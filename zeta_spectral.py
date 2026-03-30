#!/usr/bin/env python3
import os
import time
from typing import Tuple
from multiprocessing import Pool

import mpmath as mp
import numpy as np
import matplotlib
try:
    matplotlib.use("TkAgg")
except Exception:
    matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

mp.mp.dps = 30

I      = mp.mpc(0, 1)
T0     = 6.289835988
T_MAX  = 1000.0
T_DISPLAY_MAX = 100.0

N_T     = 80000
N_OMEGA = 2560
N_WORKERS = os.cpu_count()

OMEGAS  = np.linspace(-2.0, 0.0, N_OMEGA, endpoint=False)
D_OMEGA = OMEGAS[1] - OMEGAS[0]


def _eval_triple(t: float):
    mp.mp.dps = 30
    I_loc = mp.mpc(0, 1)
    th  = mp.siegeltheta(mp.mpf(t))
    thp = mp.diff(mp.siegeltheta, mp.mpf(t))
    z   = mp.zeta(mp.mpf("0.5") + I_loc * mp.mpf(t))
    return float(th), float(thp), complex(z)


def precompute_t_grid() -> Tuple[np.ndarray, float, np.ndarray, np.ndarray, np.ndarray]:
    print(f"[pre] building FINE t-grid [{T0}, {T_MAX}] with N_T={N_T}, workers={N_WORKERS}")
    t_grid = np.linspace(T0, T_MAX, N_T, dtype=float)
    dt = t_grid[1] - t_grid[0]

    theta_vals       = np.empty(N_T, dtype=float)
    theta_prime_vals = np.empty(N_T, dtype=float)
    zeta_vals        = np.empty(N_T, dtype=complex)

    t_start = time.time()
    chunk = max(1, N_T // (N_WORKERS * 8))

    with Pool(processes=N_WORKERS) as pool:
        for j, (th, thp, z) in enumerate(pool.imap(_eval_triple, t_grid, chunksize=chunk)):
            theta_vals[j]       = th
            theta_prime_vals[j] = thp
            zeta_vals[j]        = z
            if j == 0 or (j + 1) % max(1, N_T // 10) == 0 or j == N_T - 1:
                print(f"[pre] j={j:6d}/{N_T-1}, t={t_grid[j]:9.3f}, "
                      f"theta={th:+9.3f}, theta'={thp:+9.3f}, "
                      f"|zeta|={abs(z):8.3f}")

    print(f"[pre] done in {time.time() - t_start:.2f}s\n")

    sqrt_thp = np.sqrt(np.maximum(theta_prime_vals, 0.0))
    amp = zeta_vals * sqrt_thp
    return t_grid, dt, theta_vals, amp, zeta_vals


def compute_dPhi_grid(theta_vals: np.ndarray,
                      amp: np.ndarray,
                      dt: float) -> np.ndarray:
    dPhi = np.empty(N_OMEGA, dtype=complex)
    print(f"[dPhi] computing for N_OMEGA={N_OMEGA}")

    for k, omega in enumerate(OMEGAS):
        t0 = time.time()
        phase = np.exp(-1j * omega * theta_vals)
        val = np.trapezoid(amp * phase, dx=dt) / (2 * np.pi)
        dPhi[k] = val
        if k == 0 or (k + 1) % max(1, N_OMEGA // 8) == 0 or k == N_OMEGA - 1:
            print(f"[dPhi] k={k:5d}/{N_OMEGA-1}, omega={omega:7.3f}, "
                  f"dPhi={val.real:+.3e}{val.imag:+.3e}i, "
                  f"dt={time.time()-t0:.2f}s")
    print()
    return dPhi


def reconstruct_zeta_st(dPhi: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    print("[FFT] reconstructing zeta_st via inverse FFT")
    t0 = time.time()
    N   = N_OMEGA
    raw = np.fft.ifft(dPhi) * N
    taus = 2 * np.pi * np.arange(N, dtype=float) / (N * D_OMEGA)
    zeta_st = raw * np.exp(-2j * taus) * D_OMEGA
    print(f"[FFT] done in {time.time() - t0:.2f}s, "
          f"tau_range=[{taus[0]:.3f}, {taus[-1]:.3f}]\n")
    return taus, zeta_st


def theta_inv_from_grid(taus: np.ndarray,
                        t_grid: np.ndarray,
                        theta_vals: np.ndarray) -> np.ndarray:
    tau_min = theta_vals.min()
    tau_max = theta_vals.max()
    taus_clipped = np.clip(taus, tau_min, tau_max)
    order = np.argsort(theta_vals)
    return np.interp(taus_clipped, theta_vals[order], t_grid[order])


def find_sign_change_roots(x: np.ndarray, y: np.ndarray) -> np.ndarray:
    s = np.sign(y)
    idx = np.where(np.diff(s) != 0)[0]
    roots = []
    for i in idx:
        x0, x1 = x[i], x[i+1]
        y0, y1 = y[i], y[i+1]
        if y1 != y0:
            roots.append(x0 - y0*(x1-x0)/(y1-y0))
    return np.array(roots)


def plot_on_tau_axis(theta_vals: np.ndarray,
                     zeta_vals: np.ndarray,
                     taus: np.ndarray,
                     zeta_st_fft: np.ndarray) -> None:
    t_grid = np.linspace(T0, T_MAX, len(theta_vals), dtype=float)
    t_of_tau = theta_inv_from_grid(taus, t_grid, theta_vals)

    z_true_tau = np.interp(t_of_tau, t_grid, zeta_vals.real)
    z_st_tau   = zeta_st_fft.real

    mask_t = (t_of_tau >= T0) & (t_of_tau <= T_DISPLAY_MAX)
    tau_plot    = taus[mask_t]
    z_true_plot = z_true_tau[mask_t]
    z_st_plot   = z_st_tau[mask_t]

    roots_true = find_sign_change_roots(tau_plot, z_true_plot)
    roots_st   = find_sign_change_roots(tau_plot, z_st_plot)

    fig, ax = plt.subplots(1, 1, figsize=(16, 6))

    ax.plot(tau_plot, z_true_plot, color="black", lw=0.7,
            label="Re zeta(1/2 + i theta^{-1}(tau))  [nonstationary o theta^{-1}]")
    ax.plot(tau_plot, z_st_plot, color="C0", lw=0.7, ls="-.",
            label="Re zeta_st(tau)  [stationary spectral]")

    ax.axhline(0, color="gray", lw=0.4)

    for i, r in enumerate(roots_true):
        if i % 10 == 0:
            ax.axvline(r, color="red", alpha=0.3, lw=0.4)
    for i, r in enumerate(roots_st):
        if i % 10 == 0:
            ax.axvline(r, color="C1", alpha=0.3, lw=0.4)

    ax.set_xlabel("tau (t in [T0, 100])", fontsize=11)
    ax.set_ylabel("Re", fontsize=11)
    ax.legend(loc="upper right", fontsize=9)
    ax.xaxis.set_major_locator(ticker.MultipleLocator(10))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(2))
    ax.yaxis.set_major_locator(ticker.MultipleLocator(1))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)

    fig.suptitle("Re zeta(1/2 + i theta^{-1}(tau)) vs Re zeta_st(tau)\n"
                 "computed on t in [T0,1000], displayed for t in [T0,100]",
                 fontsize=12)
    fig.tight_layout()
    fig.savefig("zeta_tau_window_T0_100_fine.png", dpi=150)
    plt.show()
    print("[plot] saved and displayed zeta_tau_window_T0_100_fine.png")


def main() -> None:
    print(f"[main] dps={mp.mp.dps}, T=[{T0},{T_MAX}], "
          f"N_T={N_T}, N_OMEGA={N_OMEGA}, "
          f"display_t_max={T_DISPLAY_MAX}, workers={N_WORKERS}")

    t_grid, dt, theta_vals, amp, zeta_vals = precompute_t_grid()
    dPhi = compute_dPhi_grid(theta_vals, amp, dt)
    taus, zeta_st_fft = reconstruct_zeta_st(dPhi)
    plot_on_tau_axis(theta_vals, zeta_vals, taus, zeta_st_fft)


if __name__ == "__main__":
    main()

