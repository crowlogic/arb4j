#!/usr/bin/env python3
"""
Gelfand--Vilenkin complex orthogonal measure for the harmonizable
representation of Y = Z \circ \Theta^{-1} / sqrt(\Theta' \circ \Theta^{-1}).

Computes the windowed Fourier transform
    K[T](xi) = (1/(2pi)) \int_0^{Theta(T)} Y(u) exp(-i xi u) du
           = (1/(2pi)) \int_0^T Z(t) sqrt(Theta'(t)) exp(-i xi Theta(t)) dt
and its normalization
    Phi_T(xi) = K[T](xi) / sqrt(Theta(T))
    |Phi_T|^2 = 2pi |K[T]|^2 / Theta(T)
approximating the spectral density S(xi) supported in [-1, 1].

The magnitude |K[T]| grows with T; dividing by sqrt(Theta(T)) yields an
L^2-bounded approximating sequence whose modulus-squared weak-*
converges to the spectral density S(xi) supported in [-1,1] (plus atoms
at xi = +/- 1).

Emulates the style of a.py (mpmath for high-precision special functions),
saving PNG via matplotlib.
"""

import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mpmath import mp, mpc, mpf, digamma, log, pi, re as mre, siegelz, siegeltheta

plt.rcParams.update({
    'figure.dpi': 120,
    'savefig.dpi': 160,
    'font.size': 11,
    'axes.grid': True,
    'grid.alpha': 0.25,
    'legend.fontsize': 10,
})

mp.dps = 15

# -----------------------------------------------------------------------------
# Hardy Z-function, theta, Theta
# -----------------------------------------------------------------------------
def vartheta(t):
    return float(siegeltheta(t))

def vartheta_prime(t):
    # theta'(t) = (1/2) Re digamma(1/4 + i t/2) - (1/2) log(pi)
    return float(0.5 * mre(digamma(mpf(0.25) + mpc(0, 0.5) * t))) - 0.5 * float(log(pi))

def Z_hardy(t):
    """Hardy Z(t) = e^{i theta(t)} zeta(1/2 + i t), real-valued on R."""
    return float(siegelz(t))

# -----------------------------------------------------------------------------
# Normalization constant c > c_star with c_star = -inf vartheta'
# vartheta' has its minimum around t ~ 6.29 with value ~ -0.66
# -----------------------------------------------------------------------------
# vartheta'(t) -> -infinity as t -> 0^+ (digamma singularity), and
# vartheta'(t) grows like (1/2) log(t/(2 pi)) for large t.
# For Theta(t) = vartheta(t) + c t to be strictly increasing on [t_min, infinity)
# we need c > -inf_{t >= t_min} vartheta'(t).
# With t_min = 3 the infimum of vartheta' on [3, infinity) is near -0.33 (attained
# near t = 6.29 where vartheta' crosses zero from below the asymptote).
# Using c = 1.0 is safely above this.
T_MIN  = 3.0
C_STAR = 0.7
C      = 1.0

def Theta(t):
    return vartheta(t) + C * t

def Theta_prime(t):
    return vartheta_prime(t) + C

# -----------------------------------------------------------------------------
# Windowed Fourier transform K[T](xi)
# Expressed in the t-variable (so we avoid computing Theta^{-1}):
#     K[T](xi) = (1/(2 pi)) \int_0^T Z(t) sqrt(Theta'(t)) e^{-i xi Theta(t)} dt
# -----------------------------------------------------------------------------
def K_T_vectorized(xi_grid, T, N_quad):
    """
    Vectorized over xi_grid using a single pre-computed t-sample.
    Returns complex K[T](xi) for each xi in xi_grid.
    """
    t = np.linspace(T_MIN, T, N_quad)
    # Precompute Z(t), sqrt(Theta'(t)), Theta(t) on the t-grid
    Zvals   = np.array([Z_hardy(tk)        for tk in t])
    Tpvals  = np.array([Theta_prime(tk)    for tk in t])
    Thvals  = np.array([Theta(tk)          for tk in t])
    sqrtTp  = np.sqrt(Tpvals)
    integrand_core = Zvals * sqrtTp  # shape (N_quad,)

    # For each xi: integrand = (Z sqrt(Theta')) * exp(-i xi Theta(t))
    # Use trapezoid rule
    # K_T(xi) = (1/(2 pi)) * trapz(integrand_core * exp(-i xi Theta(t)), t)
    # Vectorize over xi using an outer product.
    # phase matrix: exp(-i xi[k] * Theta(t[j])) of shape (n_xi, N_quad)
    phase = np.exp(-1j * np.outer(xi_grid, Thvals))
    integrand = phase * integrand_core[None, :]
    try:
        trapezoid = np.trapezoid
    except AttributeError:
        trapezoid = np.trapz
    K = trapezoid(integrand, t, axis=1) / (2.0 * np.pi)
    return K

# -----------------------------------------------------------------------------
# Compute for multiple T values to show the normalization
# -----------------------------------------------------------------------------
def main():
    # xi grid (fine grid in [-1.5, 1.5] to show support on [-1,1])
    xi = np.linspace(-1.5, 1.5, 301)

    # Multiple T values. Use enough quadrature points per T to resolve Z.
    T_vals = [50.0, 100.0, 200.0, 400.0]
    # Keep N_quad/T roughly constant so resolution scales with T.
    # ~20 samples per unit-t is enough to resolve Z oscillations at T=400
    # (Z has ~Theta(T)/(2 pi) ~ 400 zeros by T=400, i.e. ~1 zero per unit-t).
    N_per_unit_T = 20

    results = {}
    for T in T_vals:
        N_quad = int(N_per_unit_T * T)
        print(f"T = {T:.0f}   Theta(T) = {Theta(T):.4f}   N_quad = {N_quad}")
        K = K_T_vectorized(xi, T, N_quad)
        ThT = Theta(T)
        Phi = K / np.sqrt(ThT)                         # normalized complex measure
        density = 2.0 * np.pi * np.abs(K)**2 / ThT     # approximates S(xi)
        results[T] = dict(K=K, Phi=Phi, density=density)

    def _bandmarks(ax):
        ax.axvline(1.0,  linestyle=':', color='gray', linewidth=1)
        ax.axvline(-1.0, linestyle=':', color='gray', linewidth=1)

    # ---------------------------------------------------------------------
    # Plot 1: |K[T](xi)| vs T (shows magnitude growth)
    # ---------------------------------------------------------------------
    fig, ax = plt.subplots(figsize=(11, 5))
    for T in T_vals:
        ax.plot(xi, np.abs(results[T]['K']), label=f"|K[{int(T)}]|", linewidth=1.3)
    _bandmarks(ax)
    ax.set_title(r"$|K[T](\xi)|$ — unnormalized magnitude grows with $T$")
    ax.set_xlabel(r"$\xi$"); ax.set_ylabel(r"$|K[T](\xi)|$")
    ax.legend(ncol=4, loc='upper center', bbox_to_anchor=(0.5, 1.12), frameon=False)
    fig.tight_layout()
    fig.savefig("orthogonal_K_unnormalized.png", bbox_inches='tight')
    plt.close(fig)

    # ---------------------------------------------------------------------
    # Plot 2: |Phi_T(xi)| = |K[T]|/sqrt(Theta(T)) — normalized magnitude
    # ---------------------------------------------------------------------
    fig, ax = plt.subplots(figsize=(11, 5))
    for T in T_vals:
        ax.plot(xi, np.abs(results[T]['Phi']), label=f"T = {int(T)}", linewidth=1.3)
    _bandmarks(ax)
    ax.set_title(r"$|\Phi_T(\xi)| = |K[T](\xi)|/\sqrt{\Theta(T)}$ — normalized; support $\to[-1,1]$")
    ax.set_xlabel(r"$\xi$"); ax.set_ylabel(r"$|\Phi_T(\xi)|$")
    ax.legend(ncol=4, loc='upper center', bbox_to_anchor=(0.5, 1.12), frameon=False)
    fig.tight_layout()
    fig.savefig("orthogonal_Phi_normalized.png", bbox_inches='tight')
    plt.close(fig)

    # ---------------------------------------------------------------------
    # Plot 3: spectral density 2pi |K[T]|^2 / Theta(T) -> S(xi)
    # ---------------------------------------------------------------------
    fig, ax = plt.subplots(figsize=(11, 5))
    for T in T_vals:
        ax.plot(xi, results[T]['density'], label=f"T = {int(T)}", linewidth=1.3)
    _bandmarks(ax)
    ax.set_title(r"$2\pi\,|K[T](\xi)|^2/\Theta(T) \to S(\xi)$, supported on $[-1,1]$")
    ax.set_xlabel(r"$\xi$"); ax.set_ylabel("spectral density (approx.)")
    ax.legend(ncol=4, loc='upper center', bbox_to_anchor=(0.5, 1.12), frameon=False)
    fig.tight_layout()
    fig.savefig("orthogonal_spectral_density.png", bbox_inches='tight')
    plt.close(fig)

    # ---------------------------------------------------------------------
    # Plot 4: real and imaginary parts of the normalized complex measure
    # Phi_T(xi) = K[T](xi) / sqrt(Theta(T)) at T = max
    # ---------------------------------------------------------------------
    T_big = T_vals[-1]
    PhiBig = results[T_big]['Phi']
    fig, ax = plt.subplots(figsize=(11, 5))
    ax.plot(xi, np.real(PhiBig), label=r"$\mathrm{Re}\,\Phi_T$", linewidth=1.2)
    ax.plot(xi, np.imag(PhiBig), label=r"$\mathrm{Im}\,\Phi_T$", linewidth=1.2)
    ax.plot(xi, np.abs(PhiBig),  label=r"$|\Phi_T|$", linewidth=1.2, linestyle='--', color='k')
    _bandmarks(ax)
    ax.set_title(rf"Complex orthogonal measure $\Phi_T$ at $T = {int(T_big)}$ (real, imag, magnitude)")
    ax.set_xlabel(r"$\xi$"); ax.set_ylabel(r"$\Phi_T(\xi)$")
    ax.legend(ncol=3, loc='upper center', bbox_to_anchor=(0.5, 1.12), frameon=False)
    fig.tight_layout()
    fig.savefig("orthogonal_Phi_real_imag.png", bbox_inches='tight')
    plt.close(fig)

    # ---------------------------------------------------------------------
    # Total mass (L^2 norm of Phi_T on real line = sigma_H^2 asymptotically)
    # ---------------------------------------------------------------------
    print("\nL^2 check:")
    try:
        trapezoid = np.trapezoid
    except AttributeError:
        trapezoid = np.trapz
    for T in T_vals:
        m = trapezoid(np.abs(results[T]['Phi'])**2, xi)
        sup = np.max(np.abs(results[T]['Phi']))
        print(f"  T = {int(T):4d}   int |Phi_T|^2 dxi = {m:.5f}   sup |Phi_T| = {sup:.5f}")

    print("\nSaved:")
    print("  orthogonal_K_unnormalized.png")
    print("  orthogonal_Phi_normalized.png")
    print("  orthogonal_spectral_density.png")
    print("  orthogonal_Phi_real_imag.png")

if __name__ == "__main__":
    main()
