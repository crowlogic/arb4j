"""Padé approximations for the rough Heston base Riccati solution.

Convention
----------
The argument `a` passed to all functions here is the same as the characteristic-
function argument `u` used in `expansion_state` / `log_charfun`, i.e.:

    a = u  (no sign change or rescaling)

The Riccati driver solved by these functions is

    D^al h = F_raw(h)

where

    F_raw(h) = c_raw + b_raw*h + q_raw*h^2
    c_raw = -0.5 * a * (a + i)
    b_raw = -nu * lamTilde
    q_raw = 0.5 * nu^2


Supported Padé orders: "22", "33", "44".
"""
from __future__ import annotations

import numpy as np
from scipy.special import gamma as _gamma, rgamma as _rgamma


def _pade_common(a, H, rho, nu, lam):
    """Shared Riccati building blocks for all Padé functions.

    Returns (al, lamTilde, aa, rm, c, b, q) where shapes are scalar/scalar/(N_a,)/...
    """
    al = H + 0.5
    lamp = lam / nu
    lamTilde = lamp - 1j * rho * a          # (N_a,)
    aa = np.sqrt(a * (a + 1j) + lamTilde ** 2)
    rm = lamTilde - aa
    c = -0.5 * a * (a + 1j)
    b = -nu * lamTilde
    q = 0.5 * nu ** 2
    return al, lamTilde, aa, rm, c, b, q


def h_pade22(
    a: np.ndarray,
    tau: np.ndarray,
    *,
    H: float,
    rho: float,
    nu: float,
    lam: float,
) -> np.ndarray:
    """Gatheral Padé 2/2 approximation of the rough Heston Riccati solution.

    Parameters
    ----------
    a            : (N_a,) complex — CF argument (a = u in expansion_state convention)
    tau          : (N_tau,) float — time values (non-negative)
    H            : float — Hurst exponent at the anchor (0.0 for H=0 anchor)
    rho          : float — correlation
    nu           : float — vol-of-vol (raw, not normalized)
    lam          : float — mean-reversion speed (raw, not normalized)
Returns
    -------
    (N_a, N_tau) complex array — h(a, tau), time on last axis.
    h(a, 0) = 0 for all a.
    """
    a = np.asarray(a, dtype=np.complex128).reshape(-1)
    tau = np.asarray(tau, dtype=float).reshape(-1)

    al, lamTilde, aa, rm, c, b, q = _pade_common(a, H, rho, nu, lam)

    G1 = _gamma(1.0 + al)
    G2 = _gamma(1.0 + 2.0 * al)

    # ---- short-time series: b1, b2 via general recurrence ----
    b1 = c / G1
    b2 = b * b1 * G1 / G2

    g0 = rm / nu
    lin = aa * nu
    g1 = -(1.0 / lin) * (1.0 / _gamma(1.0 - al)) * g0

    den = g0 ** 2 + b1 * g1

    q1 = (b1 * g0 - b2 * g1) / den
    q2 = (b1 ** 2 + b2 * g0) / den
    p1 = b1
    p2 = b2 + b1 * q1

    # ---- time variable: y = tau^al, shape (N_tau,) ----
    y = np.power(tau, al).astype(np.complex128)

    # ---- broadcast: a-terms → (N_a, 1), tau-term → (1, N_tau) ----
    p1 = p1[:, None]
    p2 = p2[:, None]
    q1 = q1[:, None]
    q2 = q2[:, None]
    y = y[None, :]  # (1, N_tau)

    h = (p1 * y + p2 * y ** 2) / (1.0 + q1 * y + q2 * y ** 2)
    return h  # (N_a, N_tau)


def h_pade33(
    a: np.ndarray,
    tau: np.ndarray,
    *,
    H: float,
    rho: float,
    nu: float,
    lam: float,
) -> np.ndarray:
    """Gatheral Padé 3/3 approximation of the rough Heston Riccati solution.

    Parameters
    ----------
    a            : (N_a,) complex — CF argument (a = u in expansion_state convention)
    tau          : (N_tau,) float — time values (non-negative)
    H            : float — Hurst exponent at the anchor (0.0 for H=0 anchor)
    rho          : float — correlation
    nu           : float — vol-of-vol (raw, not normalized)
    lam          : float — mean-reversion speed (raw, not normalized)
Returns
    -------
    (N_a, N_tau) complex array — h(a, tau), time on last axis.
    h(a, 0) = 0 for all a.
    """
    a = np.asarray(a, dtype=np.complex128).reshape(-1)
    tau = np.asarray(tau, dtype=float).reshape(-1)

    al, lamTilde, aa, rm, c, b, q = _pade_common(a, H, rho, nu, lam)

    G1 = _gamma(1.0 + al)
    G2 = _gamma(1.0 + 2.0 * al)
    G3 = _gamma(1.0 + 3.0 * al)

    # ---- short-time series: b1..b3 via general recurrence ----
    b1 = c / G1
    b2 = b * b1 * G1 / G2
    b3 = (b * b2 + q * b1 ** 2) * G2 / G3

    # ---- long-time asymptotic: g0, g1, g2 ----
    # Nonlinear correction from Gatheral's R formula (h.Pade33).
    g0 = rm / nu
    lin = aa * nu
    if abs(al - 1.0) < 1e-15:
        g1 = np.zeros_like(g0)
        g2 = np.zeros_like(g0)
    else:
        g_al = _gamma(1.0 - al)
        g_2al = _gamma(1.0 - 2.0 * al)
        g1 = -1.0 / lin * (1.0 / g_al) * g0
        g2 = -1.0 / lin * (g_al / g_2al * g1 - q * g1 ** 2)

    # ---- Cramer's-rule closed-form solution for q1, q2, q3, p1, p2, p3 ----
    den = (
        g0 ** 3
        + 2 * b1 * g0 * g1
        - b2 * g1 ** 2
        + b1 ** 2 * g2
        + b2 * g0 * g2
    )

    p1 = b1

    p2 = (
        b1 ** 2 * g0 ** 2
        + b2 * g0 ** 3
        + b1 ** 3 * g1
        + b1 * b2 * g0 * g1
        - b2 ** 2 * g1 ** 2
        + b1 * b3 * g1 ** 2
        + b2 ** 2 * g0 * g2
        - b1 * b3 * g0 * g2
    ) / den

    q1 = (
        b1 * g0 ** 2
        + b1 ** 2 * g1
        - b2 * g0 * g1
        + b3 * g1 ** 2
        - b1 * b2 * g2
        - b3 * g0 * g2
    ) / den

    q2 = (
        b1 ** 2 * g0
        + b2 * g0 ** 2
        - b1 * b2 * g1
        - b3 * g0 * g1
        + b2 ** 2 * g2
        - b1 * b3 * g2
    ) / den

    q3 = (
        b1 ** 3
        + 2 * b1 * b2 * g0
        + b3 * g0 ** 2
        - b2 ** 2 * g1
        + b1 * b3 * g1
    ) / den

    p3 = g0 * q3

    # ---- time variable: y = tau^al, shape (N_tau,) ----
    y = np.power(tau, al).astype(np.complex128)

    # ---- broadcast: a-terms → (N_a, 1), tau-term → (1, N_tau) ----
    p1 = p1[:, None]; p2 = p2[:, None]; p3 = p3[:, None]
    q1 = q1[:, None]; q2 = q2[:, None]; q3 = q3[:, None]
    y = y[None, :]

    h = (p1 * y + p2 * y ** 2 + p3 * y ** 3) / (
        1.0 + q1 * y + q2 * y ** 2 + q3 * y ** 3
    )
    return h  # (N_a, N_tau)


def h_pade44(
    a: np.ndarray,
    tau: np.ndarray,
    *,
    H: float,
    rho: float,
    nu: float,
    lam: float,
) -> np.ndarray:
    """Gatheral Padé 4/4 approximation of the rough Heston Riccati solution.

    Parameters
    ----------
    a            : (N_a,) complex — CF argument (a = u in expansion_state convention)
    tau          : (N_tau,) float — time values (non-negative)
    H            : float — Hurst exponent at the anchor (0.0 for H=0 anchor)
    rho          : float — correlation
    nu           : float — vol-of-vol (raw, not normalized)
    lam          : float — mean-reversion speed (raw, not normalized)
Returns
    -------
    (N_a, N_tau) complex array — h(a, tau), time on last axis.
    h(a, 0) = 0 for all a.
    """
    a = np.asarray(a, dtype=np.complex128).reshape(-1)
    tau = np.asarray(tau, dtype=float).reshape(-1)

    al, lamTilde, aa, rm, c, b, q = _pade_common(a, H, rho, nu, lam)

    # Gamma values: G[k] = Gamma(1 + k*al)
    G1 = _gamma(1.0 + al)
    G2 = _gamma(1.0 + 2.0 * al)
    G3 = _gamma(1.0 + 3.0 * al)
    G4 = _gamma(1.0 + 4.0 * al)

    # ---- short-time series: b1..b4 via general recurrence ----
    b1 = c / G1
    b2 = b * b1 * G1 / G2
    b3 = (b * b2 + q * b1 ** 2) * G2 / G3
    b4 = (b * b3 + 2.0 * q * b1 * b2) * G3 / G4

    # ---- long-time asymptotic: g0..g3 ----
    # h ~ g0 + g1/y + g2/y^2 + g3/y^3  as y=tau^al -> inf
    # Derived from linearised D^al v = -lin*v near g0 using Mittag-Leffler asymptotics.
    g0 = rm / nu
    lin = aa * nu
    g1 = -g0 / lin * _rgamma(1.0 - al)
    g2 = g0 / lin ** 2 * _rgamma(1.0 - 2.0 * al)
    g3 = -g0 / lin ** 3 * _rgamma(1.0 - 3.0 * al)

    if abs(al - 1.0) < 1e-15:
        g1 = np.zeros_like(g0)
        g2 = np.zeros_like(g0)
        g3 = np.zeros_like(g0)

    # ---- solve 4x4 system for denominator coefficients q1..q4 ----
    # Matching short-time (4 Taylor terms) and long-time (4 asymptotic terms):
    #   Row 0: [-b2, -b1,  g0,  g1] * [q1;q2;q3;q4] = b3
    #   Row 1: [-b1,  g0,  g1,  g2]                  = b2
    #   Row 2: [ g0,  g1,  g2,  g3]                  = b1
    #   Row 3: [ b3,  b2,  b1, -g0]                  = -b4
    N = len(a)
    A = np.empty((N, 4, 4), dtype=np.complex128)
    A[:, 0, :] = np.column_stack([-b2, -b1, g0, g1])
    A[:, 1, :] = np.column_stack([-b1, g0, g1, g2])
    A[:, 2, :] = np.column_stack([g0, g1, g2, g3])
    A[:, 3, :] = np.column_stack([b3, b2, b1, -g0])

    # rhs shape (N, 4, 1): explicit 3rd dim prevents numpy from treating (N,4)
    # as a multi-RHS problem rather than a batched single-RHS problem.
    rhs = np.stack([b3, b2, b1, -b4], axis=-1)[:, :, None]  # (N, 4, 1)

    q_sol = np.linalg.solve(A, rhs).squeeze(-1)  # (N, 4)
    q1, q2, q3, q4 = q_sol[:, 0], q_sol[:, 1], q_sol[:, 2], q_sol[:, 3]

    # ---- numerator coefficients ----
    p1 = b1
    p2 = b2 + b1 * q1
    p3 = b3 + b1 * q2 + b2 * q1
    p4 = g0 * q4

    # ---- time variable: y = tau^al, shape (N_tau,) ----
    y = np.power(tau, al).astype(np.complex128)

    # ---- broadcast: a-terms → (N_a, 1), tau-term → (1, N_tau) ----
    p1 = p1[:, None]; p2 = p2[:, None]; p3 = p3[:, None]; p4 = p4[:, None]
    q1 = q1[:, None]; q2 = q2[:, None]; q3 = q3[:, None]; q4 = q4[:, None]
    y = y[None, :]

    h = (p1 * y + p2 * y ** 2 + p3 * y ** 3 + p4 * y ** 4) / (
        1.0 + q1 * y + q2 * y ** 2 + q3 * y ** 3 + q4 * y ** 4
    )
    return h  # (N_a, N_tau)


def rough_heston_root_pade_f0(
        u: np.ndarray,
        t: np.ndarray,
        param,
        *,
        degree: int = 7,
        H: float = 0.0,
        tail_match: bool = True,
        tail_match_alpha_tol: float = 1e-10) -> np.ndarray:
    """Root-transformed Padé approximation of the rough Heston Riccati base solution.

    Matches exact short-time Riccati coefficients in the large-u-aware variable
    x = nu * aa * t^alpha  (alpha = H_anchor + 0.5),
    builds a [degree / (degree+1)] Padé approximant for the root-relaxation
    variable E (denominator one degree higher so E→0 as x→∞), and reconstructs:

        h = A0 * (1 - E) / (r_plus - r_minus * E)

    Parameters
    ----------
    u            : (N_u,) complex — CF argument
    t            : (N_t,) float  — time grid
    param        : model parameters (.lam, .nu, .rho)
    degree       : Padé numerator degree; denominator degree = degree+1
    H             : Hurst exponent anchor; alpha = H_anchor + 0.5 must be in (0, 1]
    tail_match           : if True and alpha < 1 - tail_match_alpha_tol, replace the
                           highest short-time Padé equation with the leading 1/x tail
                           constraint p_m = C_exact * q_n, where
                           C_exact = r_plus / (r_plus - r_minus) / Gamma(1 - alpha).
    tail_match_alpha_tol : suppress tail match when alpha >= 1 - tail_match_alpha_tol.

    Returns
    -------
    (N_u, N_t) complex array
    """
    m = degree
    n = degree + 1
    series_order = m + n  # = 2*degree + 1

    alpha = H + 0.5
    if not (0.0 < alpha <= 1.0):
        raise ValueError(
            f"H_anchor={H} gives alpha={alpha}; require 0 < alpha <= 1 "
            f"(i.e. H_anchor in (-0.5, 0.5])"
        )

    a_u = np.asarray(u, dtype=np.complex128).reshape(-1)
    tau = np.asarray(t, dtype=float).reshape(-1)
    N_u, N_t = len(a_u), len(tau)
    # ---- Model quantities ----
    lamp = param.lam / param.nu
    lam_tilde = lamp - 1j * param.rho * a_u  # (N_u,)
    aa = np.sqrt(a_u * (a_u + 1j) + lam_tilde ** 2)
    aa = np.where(aa.real < 0, -aa, aa)
    r_minus = (lam_tilde - aa) / param.nu
    r_plus  = (lam_tilde + aa) / param.nu
    A0 = r_minus * r_plus  # = -u*(u+1j)/nu^2

    # x = scale_x * t^alpha, large-u-aware
    scale_x = param.nu * aa  # (N_u,)

    # ---- Compute h-series a_coeff[r] in powers of t^alpha ----
    # h(t) = sum_{r>=1} a_r * t^(r*alpha)
    #
    # a_1 = c / Gamma(1 + alpha)
    # a_{r+1} = Gamma(r*alpha + 1) / Gamma((r+1)*alpha + 1)
    #           * (b * a_r + q * sum_{j=1}^{r-1} a_j * a_{r-j})
    #
    # At alpha=0.5 this reduces exactly to the H=0 recurrence:
    #   rc[r] = Gamma(r/2+1)/Gamma(r/2+1.5),  a[1] = c/Gamma(1.5)
    N_pade_coeffs = m + n + 1  # E-series terms needed for [m/n] Padé
    N_coeff = max(series_order, m + n) + 1

    c_h = -0.5 * a_u * (a_u + 1j)  # (N_u,)
    b_h = -param.nu * lam_tilde      # (N_u,)
    q_h = 0.5 * param.nu ** 2        # scalar

    r_vals = np.arange(1, N_coeff)
    rc = _gamma(r_vals * alpha + 1.0) / _gamma((r_vals + 1) * alpha + 1.0)  # (N_coeff-1,)

    a_coeff = np.zeros((N_coeff, N_u), dtype=np.complex128)
    if N_coeff > 1:
        a_coeff[1] = c_h / _gamma(1.0 + alpha)
    for r in range(1, N_coeff - 1):
        conv = np.zeros(N_u, dtype=np.complex128)
        for j in range(1, r):
            conv += a_coeff[j] * a_coeff[r - j]
        a_coeff[r + 1] = rc[r - 1] * (b_h * a_coeff[r] + q_h * conv)

    # ---- Convert h-series to x-variable: htilde[k] = a_coeff[k] / scale_x^k ----
    htilde = np.zeros((N_pade_coeffs, N_u), dtype=np.complex128)
    sx_pow = np.ones(N_u, dtype=np.complex128)
    for k in range(1, N_pade_coeffs):
        sx_pow = sx_pow * scale_x
        htilde[k] = a_coeff[k] / sx_pow

    # ---- Compute E-series via formal power series ----
    # E(h) = (A0 - r_plus*h) / (A0 - r_minus*h)  =>  E(x) via:
    # D[0]=A0, D[k]=-r_minus*htilde[k];  N[0]=A0, N[k]=-r_plus*htilde[k]
    # invD[0]=1/A0, invD[k]=-invD[0]*sum_{j=1}^{k} D[j]*invD[k-j]
    # E[k] = sum_{j=0}^{k} N[j]*invD[k-j]
    D_s = np.zeros((N_pade_coeffs, N_u), dtype=np.complex128)
    N_arr = np.zeros((N_pade_coeffs, N_u), dtype=np.complex128)
    D_s[0] = A0
    N_arr[0] = A0
    for k in range(1, N_pade_coeffs):
        D_s[k] = -r_minus * htilde[k]
        N_arr[k] = -r_plus * htilde[k]

    invD = np.zeros((N_pade_coeffs, N_u), dtype=np.complex128)
    invD[0] = 1.0 / A0
    for k in range(1, N_pade_coeffs):
        acc = np.zeros(N_u, dtype=np.complex128)
        for j in range(1, k + 1):
            acc += D_s[j] * invD[k - j]
        invD[k] = -invD[0] * acc

    E_s = np.zeros((N_pade_coeffs, N_u), dtype=np.complex128)
    for k in range(N_pade_coeffs):
        for j in range(k + 1):
            E_s[k] += N_arr[j] * invD[k - j]

    # ---- Build [m/n] Padé approximant for E(x) ----
    # System: A_mat[i-1,j-1] = E_s[m+i-j],  i,j=1..n;  rhs[i-1]=-E_s[m+i]
    # Normalization: Q_0 = 1
    ii_arr = np.arange(1, n + 1)
    jj_arr = np.arange(1, n + 1)
    idx_mn = m + ii_arr[:, None] - jj_arr[None, :]   # (n, n) index matrix
    valid_mn = (idx_mn >= 0) & (idx_mn < N_pade_coeffs)
    idx_safe_mn = np.clip(idx_mn, 0, N_pade_coeffs - 1)
    # E_s[idx_safe_mn] shape (n, n, N_u); transpose → (N_u, n, n)
    A_mat = np.where(valid_mn[:, :, None], E_s[idx_safe_mn], 0.0).transpose(2, 0, 1)

    rhs_idx = m + np.arange(1, n + 1)   # (n,)
    valid_rhs = (rhs_idx >= 0) & (rhs_idx < N_pade_coeffs)
    rhs_safe = np.clip(rhs_idx, 0, N_pade_coeffs - 1)
    rhs_mat = -np.where(valid_rhs[:, None], E_s[rhs_safe], 0.0).T   # (N_u, n)

    q_coeff = np.zeros((N_u, n), dtype=np.complex128)
    if n > 0:
        if tail_match and alpha < 1.0 - tail_match_alpha_tol:
            # Tail-matched system: keep short-time equations for powers l=m+1..m+n-1
            # (rows 0..n-2), replace row n-1 with the leading 1/x tail constraint
            #   p_m - C_exact * q_n = 0
            # which expands to:  sum_{j=1}^{m} E_s[m-j] q_j - C_exact q_n = -E_s[m]
            r_diff = r_plus - r_minus  # (N_u,)
            C_exact = (r_plus / r_diff) * _rgamma(1.0 - alpha)  # (N_u,)
            tail_ok = np.isfinite(C_exact)  # (N_u,) bool

            A_tm = A_mat.copy()      # (N_u, n, n)
            rhs_tm = rhs_mat.copy()  # (N_u, n)

            if np.any(tail_ok):
                # Replace last row for tail_ok nodes
                # j = 1..m: A[n-1, j-1] = E_s[m-j]; j = n: A[n-1, n-1] = -C_exact
                for j in range(1, m + 1):          # j = 1..m  (= 1..n-1)
                    A_tm[tail_ok, n - 1, j - 1] = E_s[m - j, tail_ok]
                A_tm[tail_ok, n - 1, n - 1] = -C_exact[tail_ok]
                rhs_tm[tail_ok, n - 1] = -E_s[m, tail_ok]

            if np.any(tail_ok):
                q_coeff[tail_ok] = np.linalg.solve(
                    A_tm[tail_ok], rhs_tm[tail_ok, :, None]
                ).squeeze(-1)
            if np.any(~tail_ok):
                q_coeff[~tail_ok] = np.linalg.solve(
                    A_mat[~tail_ok], rhs_mat[~tail_ok, :, None]
                ).squeeze(-1)
        else:
            q_coeff = np.linalg.solve(A_mat, rhs_mat[:, :, None]).squeeze(-1)

    # Numerator: p_k = sum_{j=0}^{min(k,n)} q_full[j]*E_s[k-j],  k=0..m
    q_full = np.concatenate(
        [np.ones((N_u, 1), dtype=np.complex128), q_coeff], axis=1
    )  # (N_u, n+1)
    p_coeff = np.zeros((N_u, m + 1), dtype=np.complex128)
    for k in range(m + 1):
        for j in range(min(k, n) + 1):
            kj = k - j
            if 0 <= kj < N_pade_coeffs:
                p_coeff[:, k] += q_full[:, j] * E_s[kj]

    # ---- Time-grid evaluation ----
    z = np.power(np.maximum(tau, 0.0), alpha)  # (N_t,) — t^alpha
    x = scale_x[:, None] * z[None, :]          # (N_u, N_t)

    # Direct power summation for P and Q (m, n <= ~8, so cheap)
    P = np.zeros((N_u, N_t), dtype=np.complex128)
    Q = np.ones((N_u, N_t), dtype=np.complex128)   # q_0 = 1
    x_pow = np.ones((N_u, N_t), dtype=np.complex128)
    for k in range(max(m, n) + 1):
        if k <= m:
            P += p_coeff[:, k:k + 1] * x_pow
        if k >= 1 and k <= n:
            Q += q_coeff[:, k - 1:k] * x_pow
        if k < max(m, n):
            x_pow = x_pow * x

    E_approx = P / Q
    root_den = r_plus[:, None] - r_minus[:, None] * E_approx
    result = A0[:, None] * (1.0 - E_approx) / root_den

    # ---- Enforce h(t=0) = 0 exactly ----
    t0 = tau == 0.0
    if np.any(t0):
        result[:, t0] = 0.0

    return result


def rough_heston_pade_f0(
    u: np.ndarray,
    t: np.ndarray,
    param,
    *,
    pade_order: str = "22",
    H_anchor: float = 0.0,
) -> np.ndarray:
    """Base Riccati path at the anchor using a Padé approximation.

    Parameters
    ----------
    u            : (N_u,) complex — CF argument (same convention as expansion_state)
    t            : (N_t,) float  — time grid (e.g. ctx.grid.t)
    param        : RoughHestonParam — model parameters (.rho, .nu, .lam accessed)
    pade_order   : str — "22", "33", or "44"
    H_anchor     : float — anchor Hurst exponent; only 0.0 supported now

    Returns
    -------
    (N_u, N_t) complex array — f0(u, t), time on last axis
    """
    if pade_order not in ("22", "33", "44"):
        raise NotImplementedError(
            f"Padé order {pade_order!r} is not implemented; only '22', '33', and '44' are supported"
        )

    kw = dict(
        a=np.asarray(u, dtype=np.complex128),
        tau=np.asarray(t, dtype=float),
        H=H_anchor,
        rho=param.rho,
        nu=param.nu,
        lam=param.lam,
    )
    if pade_order == "22":
        return h_pade22(**kw)
    if pade_order == "33":
        return h_pade33(**kw)
    return h_pade44(**kw)
