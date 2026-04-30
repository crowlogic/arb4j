#!/usr/bin/env python3
import os
import time
from multiprocessing import Pool
from typing import Tuple

import mpmath as mp
import numpy as np
import matplotlib

try:
    matplotlib.use("TkAgg")
except Exception:
    matplotlib.use("Agg")

import matplotlib.pyplot as plt
import matplotlib.ticker as ticker


MP_DPS = 30

T0 = 6.289835988
T_MAX = 1000.0
T_DISPLAY_MAX = 100.0

OMEGA_MIN = -2.0
OMEGA_MAX = 0.0

N_T = 16000
N_OMEGA = 2048
TAU_PAD_FACTOR = 64
N_WORKERS = os.cpu_count() or 1

mp.mp.dps = MP_DPS
I = mp.mpc(0, 1)

OMEGAS = np.linspace(OMEGA_MIN, OMEGA_MAX, N_OMEGA, endpoint=False, dtype=float)
D_OMEGA = OMEGAS[1] - OMEGAS[0]
OMEGA_BANDWIDTH = OMEGA_MAX - OMEGA_MIN


def theta(t: float) -> mp.mpf:
    return mp.siegeltheta(mp.mpf(t))


def theta_prime_closed_form(t: float) -> mp.mpf:
    s = mp.mpf("0.25") + mp.mpf("0.5") * I * mp.mpf(t)
    return mp.mpf("0.5") * mp.re(mp.digamma(s)) - mp.mpf("0.5") * mp.log(mp.pi)


def zeta_half(t: float) -> mp.mpc:
    return mp.zeta(mp.mpf("0.5") + I * mp.mpf(t))


def worker_eval_point(t: float):
    mp.mp.dps = MP_DPS
    i_loc = mp.mpc(0, 1)

    t_mp = mp.mpf(t)
    th = mp.siegeltheta(t_mp)
    thp = mp.mpf("0.5") * mp.re(mp.digamma(mp.mpf("0.25") + mp.mpf("0.5") * i_loc * t_mp)) - mp.mpf("0.5") * mp.log(mp.pi)
    z = mp.zeta(mp.mpf("0.5") + i_loc * t_mp)

    return float(th), float(thp), complex(z)


def precompute_fine_t_grid() -> Tuple[np.ndarray, float, np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
    print(
        f"[pre] building fine t-grid [{T0}, {T_MAX}] "
        f"with N_T={N_T}, workers={N_WORKERS}, dps={MP_DPS}"
    )

    t_grid = np.linspace(T0, T_MAX, N_T, dtype=float)
    dt = t_grid[1] - t_grid[0]

    theta_vals = np.empty(N_T, dtype=float)
    theta_prime_vals = np.empty(N_T, dtype=float)
    zeta_vals = np.empty(N_T, dtype=np.complex128)

    chunk = max(1, N_T // (8 * N_WORKERS))
    t_start = time.time()

    with Pool(processes=N_WORKERS) as pool:
        for j, (th, thp, z) in enumerate(pool.imap(worker_eval_point, t_grid, chunksize=chunk)):
            theta_vals[j] = th
            theta_prime_vals[j] = thp
            zeta_vals[j] = z

            if j == 0 or (j + 1) % max(1, N_T // 10) == 0 or j == N_T - 1:
                print(
                    f"[pre] j={j:6d}/{N_T - 1}, t={t_grid[j]:9.3f}, "
                    f"theta={th:+10.3f}, theta'={thp:+10.6f}, |zeta|={abs(z):9.4f}"
                )

    elapsed = time.time() - t_start
    print(f"[pre] done in {elapsed:.2f}s, dt={dt:.6f}\n")

    sqrt_theta_prime = np.sqrt(np.maximum(theta_prime_vals, 0.0))
    amp = zeta_vals * sqrt_theta_prime
    return t_grid, dt, theta_vals, theta_prime_vals, zeta_vals, amp


def compute_dphi(theta_vals: np.ndarray, amp: np.ndarray, dt: float) -> np.ndarray:
    print(f"[dPhi] computing spectral samples on [{OMEGA_MIN}, {OMEGA_MAX}) with N_OMEGA={N_OMEGA}, d_omega={D_OMEGA:.9f}")
    dphi = np.empty(N_OMEGA, dtype=np.complex128)

    for k, omega in enumerate(OMEGAS):
        t0 = time.time()
        phase = np.exp(-1j * omega * theta_vals)
        val = np.trapezoid(amp * phase, dx=dt) / (2.0 * np.pi)
        dphi[k] = val

        if k == 0 or (k + 1) % max(1, N_OMEGA // 8) == 0 or k == N_OMEGA - 1:
            print(
                f"[dPhi] k={k:5d}/{N_OMEGA - 1}, omega={omega:+9.6f}, "
                f"dPhi={val.real:+.6e}{val.imag:+.6e}i, "
                f"dt={time.time() - t0:.3f}s"
            )

    print()
    return dphi


def reconstruct_stationary_zero_padded(dphi: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    m = N_OMEGA * TAU_PAD_FACTOR
    print(
        f"[FFT] zero-padded reconstruction: "
        f"N_OMEGA={N_OMEGA}, pad_factor={TAU_PAD_FACTOR}, M={m}"
    )

    padded = np.zeros(m, dtype=np.complex128)
    padded[:N_OMEGA] = dphi

    raw = np.fft.ifft(padded) * m
    tau = 2.0 * np.pi * np.arange(m, dtype=float) / (m * D_OMEGA)
    psi_recon = np.exp(1j * OMEGA_MIN * tau) * raw * D_OMEGA

    tau_step = tau[1] - tau[0]
    tau_period = 2.0 * np.pi / D_OMEGA

    print(
        f"[FFT] tau_step={tau_step:.9f}, tau_period={tau_period:.6f}, "
        f"tau_range=[{tau[0]:.6f}, {tau[-1]:.6f}]\n"
    )

    return tau, psi_recon


def interpolate_true_stationary_on_tau(
    t_grid: np.ndarray,
    theta_vals: np.ndarray,
    theta_prime_vals: np.ndarray,
    zeta_vals: np.ndarray,
    tau_eval: np.ndarray,
) -> np.ndarray:
    mask = (
        (t_grid <= T_DISPLAY_MAX)
        & (theta_prime_vals > 0.0)
        & np.isfinite(theta_vals)
        & np.isfinite(theta_prime_vals)
        & np.isfinite(zeta_vals.real)
        & np.isfinite(zeta_vals.imag)
    )

    t_use = t_grid[mask]
    tau_use = theta_vals[mask]
    psi_use = zeta_vals[mask] / np.sqrt(theta_prime_vals[mask])

    order = np.argsort(tau_use)
    tau_sorted = tau_use[order]
    psi_sorted = psi_use[order]

    re = np.interp(tau_eval, tau_sorted, psi_sorted.real)
    im = np.interp(tau_eval, tau_sorted, psi_sorted.imag)
    return re + 1j * im


def plot_stationary_comparison(
    t_grid: np.ndarray,
    theta_vals: np.ndarray,
    theta_prime_vals: np.ndarray,
    zeta_vals: np.ndarray,
    tau_dense: np.ndarray,
    psi_recon_dense: np.ndarray,
) -> None:
    tau_display_max = float(theta(T_DISPLAY_MAX))
    tau_display_min = max(0.0, float(theta_vals.min()))

    mask_tau = (tau_dense >= tau_display_min) & (tau_dense <= tau_display_max)
    tau_plot = tau_dense[mask_tau]
    psi_recon_plot = psi_recon_dense[mask_tau]

    psi_true_plot = interpolate_true_stationary_on_tau(
        t_grid=t_grid,
        theta_vals=theta_vals,
        theta_prime_vals=theta_prime_vals,
        zeta_vals=zeta_vals,
        tau_eval=tau_plot,
    )

    fig, ax = plt.subplots(1, 1, figsize=(16, 6))

    ax.plot(
        tau_plot,
        psi_true_plot.real,
        color="black",
        lw=1.2,
        label="Re zeta_st(tau) from zeta(1/2+it) o theta^{-1}",
    )
    ax.plot(
        tau_plot,
        psi_recon_plot.real,
        color="tab:blue",
        lw=1.0,
        ls="--",
        label="Re zeta_st(tau) from spectral reconstruction",
    )

    ax.axhline(0.0, color="gray", lw=0.5)
    ax.set_xlabel("tau", fontsize=11)
    ax.set_ylabel("Re zeta_st(tau)", fontsize=11)
    ax.set_title(
        f"Stationary process on tau-axis; computed on t in [{T0}, {T_MAX}], shown up to t={T_DISPLAY_MAX}",
        fontsize=12,
    )

    ax.xaxis.set_major_locator(ticker.MultipleLocator(5))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(1))
    ax.yaxis.set_major_locator(ticker.MultipleLocator(1))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)
    ax.legend(loc="upper right", fontsize=9)

    fig.tight_layout()
    fig.savefig("zeta_stationary_comparison_dense.png", dpi=160)
    plt.show()
    print("[plot] saved and displayed zeta_stationary_comparison_dense.png")


def plot_random_measure(dphi: np.ndarray) -> None:
    omega = OMEGAS

    phi_cum = np.cumsum(dphi) * D_OMEGA
    phi_power = np.cumsum(np.abs(dphi) ** 2) * D_OMEGA

    power_norm = phi_power / phi_power[-1] if phi_power[-1] != 0 else phi_power
    linear_ref = (omega - omega[0]) / (omega[-1] - omega[0])

    fig, axes = plt.subplots(2, 2, figsize=(15, 10))

    ax = axes[0, 0]
    ax.plot(omega, dphi.real, color="black", lw=0.8, label="Re dPhi/domega samples")
    ax.plot(omega, dphi.imag, color="tab:blue", lw=0.8, label="Im dPhi/domega samples")
    ax.set_title("Spectral samples", fontsize=12)
    ax.set_xlabel("omega")
    ax.set_ylabel("sample value")
    ax.xaxis.set_major_locator(ticker.MultipleLocator(0.25))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.05))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)
    ax.legend(loc="best", fontsize=8)

    ax = axes[0, 1]
    ax.plot(phi_cum.real, phi_cum.imag, color="tab:purple", lw=0.9)
    ax.scatter([phi_cum.real[0]], [phi_cum.imag[0]], color="green", s=30, label="start")
    ax.scatter([phi_cum.real[-1]], [phi_cum.imag[-1]], color="red", s=30, label="end")
    ax.set_title("Cumulative random measure in complex plane", fontsize=12)
    ax.set_xlabel("Re Phi(omega)")
    ax.set_ylabel("Im Phi(omega)")
    ax.grid(alpha=0.25)
    ax.legend(loc="best", fontsize=8)
    ax.set_aspect("equal", adjustable="box")

    ax = axes[1, 0]
    ax.plot(omega, phi_cum.real, color="black", lw=0.9, label="Re Phi(omega)")
    ax.plot(omega, phi_cum.imag, color="tab:blue", lw=0.9, label="Im Phi(omega)")
    ax.set_title("Cumulative random measure versus omega", fontsize=12)
    ax.set_xlabel("omega")
    ax.set_ylabel("Phi(omega)")
    ax.xaxis.set_major_locator(ticker.MultipleLocator(0.25))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.05))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)
    ax.legend(loc="best", fontsize=8)

    ax = axes[1, 1]
    ax.plot(omega, power_norm, color="black", lw=1.1, label="normalized cumulative |dPhi|^2")
    ax.plot(omega, linear_ref, color="red", lw=1.0, ls="--", label="linear reference")
    ax.set_title("Cumulative spectral power versus linear ramp", fontsize=12)
    ax.set_xlabel("omega")
    ax.set_ylabel("normalized cumulative power")
    ax.set_ylim(-0.02, 1.02)
    ax.xaxis.set_major_locator(ticker.MultipleLocator(0.25))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.05))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)
    ax.legend(loc="best", fontsize=8)

    fig.tight_layout()
    fig.savefig("zeta_random_measure.png", dpi=160)
    plt.show()
    print("[plot] saved and displayed zeta_random_measure.png")


def main() -> None:
    print(
        f"[main] dps={MP_DPS}, T=[{T0}, {T_MAX}], "
        f"N_T={N_T}, N_OMEGA={N_OMEGA}, workers={N_WORKERS}"
    )
    print(
        f"[main] omega_range=[{OMEGA_MIN}, {OMEGA_MAX}), d_omega={D_OMEGA:.9f}, "
        f"bandwidth={OMEGA_BANDWIDTH:.6f}, tau_pad_factor={TAU_PAD_FACTOR}"
    )

    t_grid, dt, theta_vals, theta_prime_vals, zeta_vals, amp = precompute_fine_t_grid()
    dphi = compute_dphi(theta_vals, amp, dt)
    tau_dense, psi_recon_dense = reconstruct_stationary_zero_padded(dphi)

    plot_stationary_comparison(
        t_grid=t_grid,
        theta_vals=theta_vals,
        theta_prime_vals=theta_prime_vals,
        zeta_vals=zeta_vals,
        tau_dense=tau_dense,
        psi_recon_dense=psi_recon_dense,
    )

    plot_random_measure(dphi)


if __name__ == "__main__":
    main()
