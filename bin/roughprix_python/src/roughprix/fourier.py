"""Generic Fourier quadrature pricing utilities.

Works with plain numpy/JAX arrays — no model objects.

General methodology
-------------------
Pricing is split into a model-independent quadrature stage and a
model-dependent evaluation stage.  The characteristic function is
factored as

    phi(u, T) = phi_0(u, T) * hN(u, T)

where phi_0 is the *base* characteristic function (the order-0 Riccati
solution, cheap to reuse across strikes and maturities) and hN is the
*expansion correction* (phi_N / phi_0, capturing the Taylor correction in H).
At expansion order 0 one has hN = 1 identically.

The separation is useful because the Chebyshev interpolation weights W
depend only on phi_0 and the payoff, while hN is evaluated on the coarse
node grid and multiplied in cheaply.  For a rough-Heston model the
caller produces phi_0 and hN via ``model.expansion_state`` together with
``model.log_charfun_from_field``; the high-level entry point
``RoughHeston.eur_call_put_measure_quad`` handles this automatically.

Two contour paths are provided:

Damped-measure path (arbitrary R > 0):
    Contour: u + iR, dampening factor exp(-R * log K) absorbed into the
    payoff transform.  Standard choice R = 1.2.

    1. build_panel_quadrature    — build Chebyshev–GL panel nodes once
    2. measure_weights_from_phi  — W[k,j] = ∫ payoff_hat(K_k, u+iR) phi_0(u+iR) ℓ_j(u) du
    3. eur_call_put_from_weights — price[k] = (disc/π) Re(W[k,:] @ hN)

Lewis contour path (R = 0.5, calls only):
    Contour: u - i/2.  No dampening factor; numerically recommended.

    1. build_panel_quadrature       — same quadrature setup
    2. lewis_weights_from_phi       — W[k,j] = ∫ exp(iu log(S/K_k))/(u²+¼) phi_0(u) ℓ_j(u) du
    3. eur_call_from_lewis_weights  — C_k = S - (disc/π) sqrt(S·K_k) Re(W[k,:] @ hN)
"""
from __future__ import annotations

__all__ = [
    "PanelQuadrature",
    "build_panel_quadrature",
    "fourier_payoff_call_put",
    "measure_weights_from_phi",
    "eur_call_put_from_weights",
    "lewis_weights_from_phi",
    "eur_call_from_lewis_weights",
    "otm_prices_to_ivs",
    "adaptive_check_values",
    "adaptive_converged",
]

from dataclasses import dataclass, field

import numpy as np
import jax.numpy as jnp
from scipy.stats import norm


# ---------------------------------------------------------------------------
# Black-Scholes / implied-vol helpers
# ---------------------------------------------------------------------------

def _bs_price(S_0, K, sigma, T, r=0., call=True):
    d1 = (np.log(S_0 / K) + (r + sigma ** 2 / 2) * T) / (sigma * np.sqrt(T))
    d2 = d1 - sigma * np.sqrt(T)
    d1 = np.clip(d1, -30, 30)
    d2 = np.clip(d2, -30, 30)
    if call:
        return S_0 * norm.cdf(d1) - K * np.exp(-r * T) * norm.cdf(d2)
    return -S_0 * norm.cdf(-d1) + K * np.exp(-r * T) * norm.cdf(-d2)


def _iv_bisect(price_fun, price, tol=1e-10, sl=1e-10, sr=10.):
    threshold = sl + tol
    sm = (sl + sr) / 2
    while np.amax(sr - sl) > tol:
        em = price_fun(sm) - price
        sl = np.where(em < 0, sm, sl)
        sr = np.where(em >= 0, sm, sr)
        sm = (sl + sr) / 2
    return np.where(sm < threshold, np.nan, sm)


def _iv_eur(S_0, K, T, price, payoff, r=0.):
    if isinstance(T, np.ndarray) and T.ndim == 1:
        T = T[..., None]
    call = payoff == "call"
    def price_fun(s):
        return _bs_price(S_0=S_0, K=K, sigma=s, T=T, r=r, call=call)
    return _iv_bisect(price_fun, price)


# ---------------------------------------------------------------------------
# Fourier payoff transform  (JAX, returns complex128 array (N_K, N_u))
# ---------------------------------------------------------------------------

def fourier_payoff_call_put(K, u, call=True, digital=False, logarithmic=True):
    """Fourier transform of call/put payoff evaluated at complex argument u.

    Args:
        K: strikes, real array (N_K,)
        u: complex frequency array (N_u,); includes the dampening shift
        call / digital / logarithmic: payoff variant flags

    Returns:
        complex JAX array (N_K, N_u)
    """
    K = jnp.asarray(K, dtype=jnp.float64).reshape(-1)
    u = jnp.asarray(u, dtype=jnp.complex128)
    iu = 1j * u                    # (N_u,)
    log_K = jnp.log(K)[:, None]   # (N_K, 1)
    iu2d = iu[None, :]             # (1,  N_u)

    if digital:
        sign = -1.0 if call else 1.0
        if logarithmic:
            return sign * jnp.exp(log_K * iu2d) / iu2d
        return sign * jnp.exp(K[:, None] * iu2d) / iu2d
    if logarithmic:
        return jnp.exp(log_K * (1 + iu2d)) / (iu2d * (1 + iu2d))
    return jnp.exp(K[:, None] * iu2d) / iu2d ** 2


# ---------------------------------------------------------------------------
# Chebyshev / barycentric quadrature helpers  (numpy, computed once)
# ---------------------------------------------------------------------------

def _cheb_lobatto_nodes(a: float, b: float, m: int) -> np.ndarray:
    if m < 2:
        raise ValueError("m must be >= 2")
    j = np.arange(m)
    x = np.cos(np.pi * j / (m - 1))
    return np.sort(0.5 * (a + b) + 0.5 * (b - a) * x)


def _barycentric_weights(x: np.ndarray) -> np.ndarray:
    x = np.asarray(x, dtype=float)
    diff = x[:, None] - x[None, :]   # (m, m), zero on diagonal
    np.fill_diagonal(diff, 1.0)
    return 1.0 / np.prod(diff, axis=1)


def _barycentric_interp_matrix(
    x_eval: np.ndarray,
    x_nodes: np.ndarray,
    tol: float = 1e-14,
) -> np.ndarray:
    x_eval = np.asarray(x_eval, dtype=float).reshape(-1)
    x_nodes = np.asarray(x_nodes, dtype=float).reshape(-1)
    w = _barycentric_weights(x_nodes)
    diff = x_eval[:, None] - x_nodes[None, :]                        # (N_eval, m)
    near = np.abs(diff) < tol * np.maximum(1.0, np.abs(x_eval[:, None]))
    safe_diff = np.where(near, 1.0, diff)
    tmp = np.where(near, 0.0, w[None, :] / safe_diff)
    row_sum = tmp.sum(axis=1, keepdims=True)
    M = tmp / np.where(row_sum == 0.0, 1.0, row_sum)
    near_rows = np.where(near.any(axis=1))[0]
    for i in near_rows:
        M[i, :] = 0.0
        M[i, np.argmax(near[i])] = 1.0
    return M


def _as_strict_panels(panels) -> np.ndarray:
    panels = np.asarray(panels, dtype=float)
    if panels[0] != 0.0:
        raise ValueError("panels must start at 0.")
    if not np.all(np.diff(panels) > 0):
        raise ValueError("panels must be strictly increasing.")
    return panels


# ---------------------------------------------------------------------------
# Panel quadrature data  (built once, numpy arrays)
# ---------------------------------------------------------------------------

@dataclass
class PanelQuadrature:
    """Pre-built panel quadrature for the Fourier u-axis integration.

    u_nodes  — Chebyshev interpolation nodes across all panels; shape (N_u,).
                hN (the correction multiplier) is evaluated here.
    u_quad   — Gauss-Legendre quadrature points across all panels; shape (N_q,).
                phi0 (the base char function) is evaluated here.
    w_quad   — GL weights (panel-scaled); shape (N_q,).
    Lmat     — block-diagonal barycentric interpolation matrix (N_q, N_u).
    """
    u_nodes:    np.ndarray
    u_quad:     np.ndarray
    w_quad:     np.ndarray
    Lmat:       np.ndarray
    panels:     np.ndarray
    panel_data: list = field(default_factory=list)


def build_panel_quadrature(
    panels: np.ndarray,
    m_cheb: int,
    q_weight: int,
) -> PanelQuadrature:
    """Build Chebyshev–Gauss-Legendre panel quadrature for the Fourier integral."""
    panels = _as_strict_panels(np.asarray(panels, dtype=float))
    xg, wg = np.polynomial.legendre.leggauss(q_weight)

    all_u_nodes, all_u_quad, all_w_quad, Lmat_blocks, panel_data = [], [], [], [], []

    for p in range(len(panels) - 1):
        a, b = float(panels[p]), float(panels[p + 1])
        u_nodes = _cheb_lobatto_nodes(a, b, m_cheb)
        u_q = 0.5 * (a + b) + 0.5 * (b - a) * xg
        w_q = 0.5 * (b - a) * wg
        all_u_nodes.append(u_nodes)
        all_u_quad.append(u_q)
        all_w_quad.append(w_q)
        Lmat_blocks.append(_barycentric_interp_matrix(u_q, u_nodes))
        panel_data.append({"a": a, "b": b, "u_nodes": u_nodes, "u_quad": u_q, "w_quad": w_q})

    u_nodes_all = np.concatenate(all_u_nodes)
    u_quad_all  = np.concatenate(all_u_quad)
    w_quad_all  = np.concatenate(all_w_quad)

    N_q = len(u_quad_all)
    N_u = len(u_nodes_all)
    Lmat = np.zeros((N_q, N_u))
    q_off = u_off = 0
    for Lb in Lmat_blocks:
        nq, nu = Lb.shape
        Lmat[q_off:q_off + nq, u_off:u_off + nu] = Lb
        q_off += nq
        u_off += nu

    return PanelQuadrature(
        u_nodes=u_nodes_all,
        u_quad=u_quad_all,
        w_quad=w_quad_all,
        Lmat=Lmat,
        panels=panels,
        panel_data=panel_data,
    )


# ---------------------------------------------------------------------------
# Phase 2: integrate phi0 * payoff_hat onto Chebyshev nodes  (JAX)
# ---------------------------------------------------------------------------

def measure_weights_from_phi(
    phi0: jnp.ndarray,
    quad: PanelQuadrature,
    K: np.ndarray,
    R: float,
    call: bool = True,
    digital: bool = False,
) -> jnp.ndarray:
    """Compute interpolation weights W[k, j] = ∫ payoff_hat(K_k, u) phi0(u) ell_j(u) du.

    Args:
        phi0:  complex JAX array (N_q,) — base char function at quad.u_quad
        quad:  PanelQuadrature from build_panel_quadrature
        K:     strike array (N_K,)
        R:     dampening shift (real)
        call / digital: payoff variant

    Returns:
        complex JAX array (N_K, N_u)
    """
    phi0   = jnp.asarray(phi0,         dtype=jnp.complex128)
    w_quad = jnp.asarray(quad.w_quad,  dtype=jnp.float64)
    Lmat   = jnp.asarray(quad.Lmat,    dtype=jnp.float64)
    u_c    = jnp.asarray(quad.u_quad + 1j * R, dtype=jnp.complex128)

    payoff_hat = fourier_payoff_call_put(K, u_c, call=call, digital=digital)  # (N_K, N_q)
    B = payoff_hat * phi0[None, :]                                             # (N_K, N_q)
    return (B * w_quad[None, :]) @ Lmat                                        # (N_K, N_u)


# ---------------------------------------------------------------------------
# Phase 3: apply correction multiplier and price  (JAX)
# ---------------------------------------------------------------------------

def eur_call_put_from_weights(
    weights: jnp.ndarray,
    hN: jnp.ndarray,
    discount: float,
) -> jnp.ndarray:
    """Price European options from interpolation weights and correction multiplier.

    price[k] = discount / pi * Re( weights[k, :] @ hN )

    Args:
        weights:  complex JAX array (N_K, N_u)
        hN:       complex JAX array (N_u,) — correction multiplier at u_nodes
        discount: exp(-r * T)

    Returns:
        real JAX array (N_K,)
    """
    return (discount / np.pi) * jnp.real(weights @ hN)


# ---------------------------------------------------------------------------
# Lewis-contour pricing  (R=0.5 path)
# ---------------------------------------------------------------------------

def lewis_weights_from_phi(
    phi0: jnp.ndarray,
    quad: PanelQuadrature,
    K: np.ndarray,
    S_0: float,
) -> jnp.ndarray:
    """Compute Lewis weights W[k, j] for the contour u - i/2.

    W[k, j] = int_0^L exp(iu*log(S_0/K_k)) / (u^2+1/4) * phi0(u) * ell_j(u) du

    Args:
        phi0: complex JAX array (N_q,) — char function at quad.u_quad (real nodes)
        quad: PanelQuadrature from build_panel_quadrature
        K:    strike array (N_K,)
        S_0:  spot price

    Returns:
        complex JAX array (N_K, N_u)
    """
    phi0   = jnp.asarray(phi0,        dtype=jnp.complex128)
    w_quad = jnp.asarray(quad.w_quad, dtype=jnp.float64)
    Lmat   = jnp.asarray(quad.Lmat,   dtype=jnp.float64)
    u_q    = jnp.asarray(quad.u_quad, dtype=jnp.float64)
    K_arr  = jnp.asarray(np.asarray(K, dtype=float).reshape(-1), dtype=jnp.float64)

    log_ratio = jnp.log(float(S_0) / K_arr)[:, None]          # (N_K, 1)
    phase     = jnp.exp(1j * u_q[None, :] * log_ratio)         # (N_K, N_q)
    denom     = u_q[None, :] ** 2 + 0.25                        # (1,   N_q)
    B         = (phase / denom) * phi0[None, :]                 # (N_K, N_q)
    return (B * w_quad[None, :]) @ Lmat                         # (N_K, N_u)


def eur_call_from_lewis_weights(
    weights: jnp.ndarray,
    hN: jnp.ndarray,
    S_0: float,
    K: np.ndarray,
    discount: float,
) -> jnp.ndarray:
    """Call price from Lewis weights and correction multiplier.

    C_k = S_0 - discount * sqrt(S_0 * K_k) / pi * Re( weights[k, :] @ hN )

    Args:
        weights:  complex JAX array (N_K, N_u)
        hN:       complex JAX array (N_u,) — correction multiplier at u_nodes
        S_0:      spot price
        K:        strike array (N_K,)
        discount: exp(-r * T)

    Returns:
        real JAX array (N_K,)
    """
    K_arr    = jnp.asarray(np.asarray(K, dtype=float).reshape(-1), dtype=jnp.float64)
    sqrt_S0K = jnp.sqrt(float(S_0) * K_arr)
    integral = jnp.real(weights @ jnp.asarray(hN, dtype=jnp.complex128))
    return float(S_0) - (float(discount) / np.pi) * sqrt_S0K * integral


# ---------------------------------------------------------------------------
# Adaptive panel convergence utilities  (model-agnostic)
# ---------------------------------------------------------------------------

def otm_prices_to_ivs(
    raw_otm_prices: np.ndarray,
    K: np.ndarray,
    maturity: float,
    S_0: float,
    call_mask: np.ndarray,
    put_mask: np.ndarray,
    r: float = 0.0,
) -> np.ndarray:
    """Invert a vector of OTM option prices to Black-Scholes implied vols.

    Strikes in ``call_mask`` are treated as calls, those in ``put_mask`` as puts.
    The two masks must partition K (no overlap, no gap).
    """
    ivs = np.empty_like(raw_otm_prices, dtype=float)
    if np.any(call_mask):
        ivs[call_mask] = _iv_eur(
            S_0=S_0, K=K[call_mask], T=maturity,
            price=raw_otm_prices[call_mask], payoff="call", r=r,
        )
    if np.any(put_mask):
        ivs[put_mask] = _iv_eur(
            S_0=S_0, K=K[put_mask], T=maturity,
            price=raw_otm_prices[put_mask], payoff="put", r=r,
        )
    return ivs


def adaptive_check_values(
    result: np.ndarray,
    raw_otm_prices: np.ndarray,
    call_mask: np.ndarray,
    put_mask: np.ndarray,
    implied_vol: bool,
    adaptive_metric: str,
    K: np.ndarray,
    maturity: float,
    S_0: float,
    r: float = 0.0,
    scalar_H: bool = True,
) -> np.ndarray:
    """Extract a flat array of convergence-check values from a fixed-panel result.

    Used to compare successive adaptive-panel iterations.  Returns raw OTM prices
    when ``adaptive_metric='price'``, and implied vols when ``adaptive_metric='iv'``
    (inverting prices if the result is not already in IV space).

    ``scalar_H=False`` signals that ``raw_otm_prices`` has shape ``(N_K, N_H)``
    and each H-slice is inverted independently.
    """
    if adaptive_metric == "price":
        return np.asarray(raw_otm_prices).ravel()
    # metric == "iv"
    if implied_vol:
        return np.asarray(result).ravel()
    if scalar_H:
        return otm_prices_to_ivs(
            raw_otm_prices, K, maturity, S_0, call_mask, put_mask, r
        ).ravel()
    n_K, n_H = raw_otm_prices.shape
    ivs = np.empty_like(raw_otm_prices)
    for j in range(n_H):
        ivs[:, j] = otm_prices_to_ivs(
            raw_otm_prices[:, j], K, maturity, S_0, call_mask, put_mask, r
        )
    return ivs.ravel()


def adaptive_converged(
    prev_check: np.ndarray,
    check: np.ndarray,
    metric: str,
    tol: float,
    abs_tol: float,
    rel_tol: float,
) -> bool:
    """Return True when successive adaptive-panel check values are within tolerance.

    For ``metric='iv'`` a single absolute tolerance ``tol`` is applied.
    For ``metric='price'`` a combined absolute + relative criterion is used.
    """
    err = float(np.max(np.abs(check - prev_check)))
    if metric == "iv":
        return err <= tol
    scale = max(float(np.max(np.abs(check))), 1.0)
    return err <= abs_tol + rel_tol * scale

