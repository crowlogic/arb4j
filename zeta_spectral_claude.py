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
N_TAU_DISPLAY = 4000    # how many τ-points to evaluate in the display window
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
    print(f"[pre] t-grid [{T0}, {T_MAX}], N_T={N_T}, workers={N_WORKERS}")
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
                elapsed = time.time() - t_start
                print(f"[pre] j={j:6d}/{N_T-1}, t={t_grid[j]:9.3f}, "
                      f"theta={th:+9.3f}, theta'={thp:+9.3f}, "
                      f"|zeta|={abs(z):8.3f}, elapsed={elapsed:.1f}s")

    print(f"[pre] done in {time.time() - t_start:.2f}s\n")

    sqrt_thp = np.sqrt(np.maximum(theta_prime_vals, 0.0))
    amp = zeta_vals * sqrt_thp
    return t_grid, dt, theta_vals, amp, zeta_vals


def compute_dPhi(theta_vals: np.ndarray,
                 amp: np.ndarray,
                 dt: float) -> np.ndarray:
    """Compute dPhi(omega_k) for each omega_k by trapezoidal integration over t."""
    dPhi = np.empty(N_OMEGA, dtype=complex)
    print(f"[dPhi] N_OMEGA={N_OMEGA}")
    t_start = time.time()

    for k, omega in enumerate(OMEGAS):
        phase = np.exp(-1j * omega * theta_vals)
        dPhi[k] = np.trapezoid(amp * phase, dx=dt) / (2 * np.pi)
        if k == 0 or (k + 1) % max(1, N_OMEGA // 8) == 0 or k == N_OMEGA - 1:
            print(f"[dPhi] k={k:5d}/{N_OMEGA-1}, omega={omega:7.3f}, "
                  f"|dPhi|={abs(dPhi[k]):.3e}, elapsed={time.time()-t_start:.1f}s")
    print()
    return dPhi


def eval_zeta_st_direct(taus: np.ndarray, dPhi: np.ndarray) -> np.ndarray:
    """
    Evaluate zeta_st(tau) = sum_k e^{i omega_k tau} dPhi_k
    by direct summation at arbitrary tau points.
    """
    print(f"[eval] direct summation at {len(taus)} tau points")
    t0 = time.time()
    # taus: (M,), OMEGAS: (K,) -> phase matrix (M, K)
    phase = np.exp(1j * np.outer(taus, OMEGAS))   # e^{i omega_k tau}
    zeta_st = phase @ dPhi                         # sum over k
    print(f"[eval] done in {time.time() - t0:.2f}s\n")
    return zeta_st


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


def plot_comparison(theta_vals: np.ndarray,
                    zeta_vals: np.ndarray,
                    dPhi: np.ndarray) -> None:
    """Plot 1: true vs spectral reconstruction on a dense tau grid."""
    t_grid = np.linspace(T0, T_MAX, len(theta_vals), dtype=float)

    # figure out tau range for display window
    mask_display = (t_grid >= T0) & (t_grid <= T_DISPLAY_MAX)
    tau_lo = theta_vals[mask_display].min()
    tau_hi = theta_vals[mask_display].max()

    # dense tau grid in display window
    taus = np.linspace(tau_lo, tau_hi, N_TAU_DISPLAY)

    # true: zeta(1/2 + i theta^{-1}(tau)) via interpolation
    t_of_tau = theta_inv_from_grid(taus, t_grid, theta_vals)
    z_true = np.interp(t_of_tau, t_grid, zeta_vals.real)

    # spectral: direct summation
    z_st = eval_zeta_st_direct(taus, dPhi).real

    roots_true = find_sign_change_roots(taus, z_true)
    roots_st   = find_sign_change_roots(taus, z_st)

    fig, ax = plt.subplots(1, 1, figsize=(16, 6))

    ax.plot(taus, z_true, color="black", lw=0.8,
            label="Re zeta(1/2 + i theta^{-1}(tau))")
    ax.plot(taus, z_st, color="C0", lw=0.8, ls="--",
            label="Re zeta_st(tau)  [spectral]")
    ax.axhline(0, color="gray", lw=0.4)

    for i, r in enumerate(roots_true):
        if i % 5 == 0:
            ax.axvline(r, color="red", alpha=0.25, lw=0.4)

    ax.set_xlabel("tau", fontsize=11)
    ax.set_ylabel("Re", fontsize=11)
    ax.legend(loc="upper right", fontsize=9)
    ax.xaxis.set_major_locator(ticker.MultipleLocator(5))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(1))
    ax.yaxis.set_major_locator(ticker.MultipleLocator(1))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)
    fig.suptitle("Re zeta(1/2 + i theta^{-1}(tau)) vs Re zeta_st(tau)\n"
                 f"t in [T0, {T_DISPLAY_MAX}], N_T={N_T}, N_OMEGA={N_OMEGA}",
                 fontsize=12)
    fig.tight_layout()
    fig.savefig("zeta_comparison.png", dpi=150)
    plt.show()
    print("[plot] saved and displayed zeta_comparison.png")


def plot_spectral_measure(dPhi: np.ndarray) -> None:
    """Plot 2: cumulative spectral measure + cumulative power vs theory."""
    omegas = OMEGAS
    domega = D_OMEGA

    # cumulative measure Phi(omega) = cumsum of dPhi * domega
    Phi = np.cumsum(dPhi) * domega

    # cumulative spectral power
    power = np.cumsum(np.abs(dPhi)**2) * domega
    theory = omegas - omegas[0]   # omega + 2

    fig, axes = plt.subplots(2, 1, figsize=(14, 8))

    # top: cumulative measure (complex random walk)
    ax = axes[0]
    ax.plot(omegas, Phi.real, color="black", lw=0.7, label="Re Phi(omega)")
    ax.plot(omegas, Phi.imag, color="C0", lw=0.7, label="Im Phi(omega)")
    ax.axhline(0, color="gray", lw=0.4)
    ax.set_xlabel("omega", fontsize=11)
    ax.set_ylabel("Phi(omega)", fontsize=11)
    ax.set_title("Cumulative spectral measure Phi(omega)", fontsize=12)
    ax.legend(loc="best", fontsize=9)
    ax.xaxis.set_major_locator(ticker.MultipleLocator(0.25))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.05))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)

    # bottom: cumulative power vs theoretical ramp
    ax = axes[1]
    ax.plot(omegas, power, color="black", lw=1.0,
            label="empirical cumsum |dPhi|^2 domega")
    ax.plot(omegas, theory, color="red", lw=1.0, ls="--",
            label="theoretical: omega + 2  (flat density)")
    ax.set_xlabel("omega", fontsize=11)
    ax.set_ylabel("cumulative power", fontsize=11)
    ax.set_title("Spectral distribution: empirical vs theoretical", fontsize=12)
    ax.legend(loc="best", fontsize=9)
    ax.xaxis.set_major_locator(ticker.MultipleLocator(0.25))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.05))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)

    fig.tight_layout()
    fig.savefig("spectral_measure.png", dpi=150)
    plt.show()
    print("[plot] saved and displayed spectral_measure.png")


def main() -> None:
    print(f"[main] dps={mp.mp.dps}, T=[{T0},{T_MAX}], "
          f"N_T={N_T}, N_OMEGA={N_OMEGA}, "
          f"N_TAU_DISPLAY={N_TAU_DISPLAY}, workers={N_WORKERS}")

    t_grid, dt, theta_vals, amp, zeta_vals = precompute_t_grid()
    dPhi = compute_dPhi(theta_vals, amp, dt)

    plot_comparison(theta_vals, zeta_vals, dPhi)
    plot_spectral_measure(dPhi)


if __name__ == "__main__":
    main()
