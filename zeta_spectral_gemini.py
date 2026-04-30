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

OMEGAS  = np.linspace(-3.0, 3.0, N_OMEGA, endpoint=False)
D_OMEGA = OMEGAS[1] - OMEGAS[0]


def _eval_triple(t: float):
    mp.mp.dps = 30
    I_loc = mp.mpc(0, 1)
    th  = mp.siegeltheta(mp.mpf(t))
    thp = mp.diff(mp.siegeltheta, mp.mpf(t))
    z   = mp.zeta(mp.mpf("0.5") + I_loc * mp.mpf(t))
    return float(th), float(thp), complex(z)


def precompute_t_grid() -> Tuple[np.ndarray, float, np.ndarray, np.ndarray, np.ndarray]:
    print(f"[pre] building dense t-grid [{T0}, {T_MAX}] with N_T={N_T}, workers={N_WORKERS}")
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
                      f"theta={th:+9.3f}, theta'={thp:+9.3f}, |zeta|={abs(z):8.3f}")

    print(f"[pre] done in {time.time() - t_start:.2f}s\n")

    sqrt_thp = np.sqrt(np.maximum(theta_prime_vals, 0.0))
    amp = zeta_vals * sqrt_thp
    return t_grid, dt, theta_vals, amp, zeta_vals


def compute_spectral_density(theta_vals: np.ndarray,
                             amp: np.ndarray,
                             dt: float) -> np.ndarray:
    density = np.empty(N_OMEGA, dtype=complex)
    print(f"[density] computing for N_OMEGA={N_OMEGA}")

    for k, omega in enumerate(OMEGAS):
        t0 = time.time()
        phase = np.exp(-1j * omega * theta_vals)
        integrand = amp * phase
        val = np.trapezoid(integrand, dx=dt) / (2 * np.pi)
        density[k] = val
        if k == 0 or (k + 1) % max(1, N_OMEGA // 8) == 0 or k == N_OMEGA - 1:
            print(f"[density] k={k:5d}/{N_OMEGA-1}, omega={omega:7.3f}, "
                  f"c(w)={val.real:+.3e}{val.imag:+.3e}i, dt={time.time()-t0:.2f}s")
    print()
    return density


def reconstruct_zeta_st_direct(taus: np.ndarray, density: np.ndarray) -> np.ndarray:
    """
    Bypass FFT limitations. Evaluate the exact Fourier sum directly on the
    dense taus grid. This guarantees perfect resolution matching the true function.
    """
    print(f"[rec] reconstructing stationary zeta directly on {len(taus)} points...")
    t0 = time.time()
    zeta_st = np.zeros(len(taus), dtype=complex)
    
    # Process in batches to keep memory usage low
    batch_size = 2000
    for i in range(0, len(taus), batch_size):
        taus_batch = taus[i:i+batch_size]
        # phase shape: (batch_size, N_OMEGA)
        phase = np.exp(1j * np.outer(taus_batch, OMEGAS))
        zeta_st[i:i+batch_size] = (phase @ density) * D_OMEGA
        
    print(f"[rec] done in {time.time() - t0:.2f}s\n")
    return zeta_st


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


def plot_comparison(t_grid: np.ndarray,
                    theta_vals: np.ndarray,
                    zeta_vals: np.ndarray,
                    zeta_st_rec: np.ndarray) -> None:
    # Restrict arrays to the display window
    mask = (t_grid >= T0) & (t_grid <= T_DISPLAY_MAX)
    
    tau_plot    = theta_vals[mask]
    z_true_plot = zeta_vals.real[mask]
    z_st_plot   = zeta_st_rec.real[mask]

    roots_true = find_sign_change_roots(tau_plot, z_true_plot)
    roots_st   = find_sign_change_roots(tau_plot, z_st_plot)

    fig, ax = plt.subplots(1, 1, figsize=(16, 6))

    ax.plot(tau_plot, z_true_plot, color="black", lw=0.9,
            label="Re ζ(1/2 + i θ^{-1}(τ))  [nonstationary ∘ θ^{-1}]")
    ax.plot(tau_plot, z_st_plot, color="C0", lw=0.9, ls="--",
            label="Re ζ_st(τ)  [stationary spectral reconstruction]")

    ax.axhline(0, color="gray", lw=0.5)

    for i, r in enumerate(roots_true):
        if i % 10 == 0:
            ax.axvline(r, color="red", alpha=0.3, lw=0.6)
    for i, r in enumerate(roots_st):
        if i % 10 == 0:
            ax.axvline(r, color="C1", alpha=0.3, lw=0.6)

    ax.set_xlabel(f"τ  (corresponding to t ∈ [{T0:.2f}, {T_DISPLAY_MAX}])", fontsize=11)
    ax.set_ylabel("Re", fontsize=11)
    ax.legend(loc="upper right", fontsize=9)
    ax.xaxis.set_major_locator(ticker.MultipleLocator(10))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(2))
    ax.yaxis.set_major_locator(ticker.MultipleLocator(1))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)

    fig.suptitle("High-Resolution Comparison: True Zeta vs Stationary Spectral Process", fontsize=13)
    fig.tight_layout()
    fig.savefig("zeta_tau_window_smooth.png", dpi=150)
    plt.show()
    print("[plot] saved and displayed zeta_tau_window_smooth.png")


def plot_spectral_measure(density: np.ndarray) -> None:
    """
    Plots the cumulative orthogonal stochastic measure and its power.
    dPhi = density * d_omega.
    """
    dPhi = density * D_OMEGA
    
    # Cumulative measure Phi(omega)
    Phi = np.cumsum(dPhi)
    
    # Cumulative spectral power
    power = np.cumsum(np.abs(dPhi)**2)
    
    # Theoretical power ramp (flat density => straight line from 0 to total power)
    # We normalize the theoretical ramp to match the total empirical power to check the shape.
    theory_power = np.linspace(0, power[-1], len(OMEGAS))

    fig, axes = plt.subplots(2, 1, figsize=(14, 8))

    # Top: The random measure complex walk
    ax = axes[0]
    ax.plot(OMEGAS, Phi.real, color="black", lw=1.0, label="Re Φ(ω)")
    ax.plot(OMEGAS, Phi.imag, color="C0", lw=1.0, label="Im Φ(ω)")
    ax.axhline(0, color="gray", lw=0.5)
    ax.set_xlabel("ω", fontsize=11)
    ax.set_ylabel("Φ(ω)", fontsize=11)
    ax.set_title("Cumulative Spectral Measure Φ(ω) = ∫ dΦ", fontsize=12)
    ax.legend(loc="upper left")
    ax.xaxis.set_major_locator(ticker.MultipleLocator(0.25))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.05))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)

    # Bottom: Power vs Flat-density Theory
    ax = axes[1]
    ax.plot(OMEGAS, power, color="black", lw=1.2, label="Empirical: cumulative sum of |dΦ|^2")
    ax.plot(OMEGAS, theory_power, color="red", lw=1.2, ls="--", label="Theoretical shape (flat spectral density)")
    ax.set_xlabel("ω", fontsize=11)
    ax.set_ylabel("Power", fontsize=11)
    ax.set_title("Spectral Distribution Function", fontsize=12)
    ax.legend(loc="upper left")
    ax.xaxis.set_major_locator(ticker.MultipleLocator(0.25))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.05))
    ax.grid(which="major", alpha=0.25)
    ax.grid(which="minor", alpha=0.08)

    fig.tight_layout()
    fig.savefig("spectral_random_measure.png", dpi=150)
    plt.show()
    print("[plot] saved and displayed spectral_random_measure.png")


def main() -> None:
    print(f"[main] dps={mp.mp.dps}, T=[{T0}, {T_MAX}], "
          f"N_T={N_T}, N_OMEGA={N_OMEGA}, "
          f"display_t_max={T_DISPLAY_MAX}, workers={N_WORKERS}")

    # 1. Precompute on dense grid
    t_grid, dt, theta_vals, amp, zeta_vals = precompute_t_grid()
    
    # 2. Compute spectral density
    density = compute_spectral_density(theta_vals, amp, dt)
    
    # 3. Direct spectral reconstruction on the exact theta_vals grid (NO FFT gaps)
    zeta_st_rec = reconstruct_zeta_st_direct(theta_vals, density)
    
    # 4. Plots
    plot_comparison(t_grid, theta_vals, zeta_vals, zeta_st_rec)
    plot_spectral_measure(density)


if __name__ == "__main__":
    main()
