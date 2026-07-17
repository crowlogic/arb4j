"""Rough Heston option pricing.

Rough Heston option pricing with a Quadratic-Implicit Fractional Adams
Predictor-Corrector solver.

Main entry points
-----------------
RoughHestonModel(params).price(NOuter, NInner, method="implicit", option_type="call")
    Price one European option under a Rough Heston-style characteristic
    function representation.

run_grid_test_new()
    Python equivalent of test.m, using the default model solver.

This file is self-contained except for NumPy.
"""

from __future__ import annotations

from dataclasses import dataclass, fields, replace
from itertools import product
from math import gamma
from typing import Literal, Sequence, Tuple
import time

import numpy as np


SolverMethod = Literal["implicit", "explicit"]
OptionType = Literal["call", "put"]
ScalarOrGrid = float | Sequence[float]


@dataclass(frozen=True)
class RoughHestonParams:
    """Model and numerical parameters matching the original MATLAB file."""

    S0: ScalarOrGrid       # Initial stock price
    K: ScalarOrGrid        # Strike price
    r: ScalarOrGrid        # Risk-free rate
    z: ScalarOrGrid        # Initial variance/volatility input used in the MATLAB code
    alpha: ScalarOrGrid    # Fractional roughness parameter
    lam: ScalarOrGrid      # Mean-reversion speed lambda
    theta: ScalarOrGrid    # Long-term variance level
    rho: ScalarOrGrid      # Correlation
    nu: ScalarOrGrid       # Vol-of-vol parameter used by the MATLAB code
    t: ScalarOrGrid        # Maturity

    R: ScalarOrGrid        # Fourier damping parameter
    u_lower: ScalarOrGrid
    u_upper: ScalarOrGrid

    def __post_init__(self) -> None:
        _validate_positive(self.S0, "S0")
        _validate_positive(self.K, "K")
        _validate_nonnegative(self.z, "z")
        _validate_alpha(self.alpha)
        _validate_positive(self.lam, "lam")
        _validate_nonnegative(self.theta, "theta")
        _validate_rho(self.rho)
        _validate_nonnegative(self.nu, "nu")
        _validate_positive(self.t, "t")
        _validate_positive(self.R, "R")
        _validate_bounds(self.u_lower, self.u_upper)


def _is_grid_value(value: object) -> bool:
    return isinstance(value, (list, tuple, np.ndarray))


def _scalar_values(value: object, name: str) -> list[float]:
    if _is_grid_value(value):
        values = [float(item) for item in value]
        if not values:
            raise ValueError(f"{name} must contain at least one value.")
        return values
    return [float(value)]


def _validate_positive(value: ScalarOrGrid, name: str) -> None:
    for item in _scalar_values(value, name):
        if item <= 0.0:
            raise ValueError(f"{name} must be positive.")


def _validate_nonnegative(value: ScalarOrGrid, name: str) -> None:
    for item in _scalar_values(value, name):
        if item < 0.0:
            raise ValueError(f"{name} must be nonnegative.")


def _validate_alpha(value: ScalarOrGrid) -> None:
    for item in _scalar_values(value, "alpha"):
        if not 0.5 < item < 1.0:
            raise ValueError("alpha must be in (0.5, 1.0).")


def _validate_rho(value: ScalarOrGrid) -> None:
    for item in _scalar_values(value, "rho"):
        if not -1.0 <= item <= 1.0:
            raise ValueError("rho must be in [-1.0, 1.0].")


def _validate_bounds(lower: ScalarOrGrid, upper: ScalarOrGrid) -> None:
    lower_values = _scalar_values(lower, "u_lower")
    upper_values = _scalar_values(upper, "u_upper")
    for lower_item in lower_values:
        for upper_item in upper_values:
            if upper_item <= lower_item:
                raise ValueError("u_upper must be greater than u_lower.")


def _has_grid_params(params: RoughHestonParams) -> bool:
    return any(_is_grid_value(getattr(params, field.name)) for field in fields(params))


def _grid_param_names(params: RoughHestonParams) -> list[str]:
    return [field.name for field in fields(params) if _is_grid_value(getattr(params, field.name))]


def _expand_param_grid(params: RoughHestonParams) -> list[RoughHestonParams]:
    names = [field.name for field in fields(params)]
    value_lists = [_scalar_values(getattr(params, name), name) for name in names]
    return [replace(params, **dict(zip(names, values))) for values in product(*value_lists)]


def _grid_params_as_row(params: RoughHestonParams, grid_names: list[str]) -> dict[str, float]:
    return {name: float(getattr(params, name)) for name in grid_names}


def _grid_int_values(values: Sequence[int], name: str) -> list[int]:
    grid_values = [int(value) for value in values]
    if not grid_values:
        raise ValueError(f"{name} must contain at least one value.")
    return grid_values


@dataclass
class RoughHestonModel:
    """Rough Heston option pricing model.

    Parameters are fixed when the model is created. Pricing is performed with
    price(), which can choose between the quadratic-implicit solver and the
    original explicit predictor-corrector baseline.
    """

    params: RoughHestonParams

    def price(
        self,
        NOuter: int,
        NInner: int,
        method: SolverMethod = "implicit",
        option_type: OptionType = "call",
        timed: bool = False,
        return_details: bool = False,
    ):
        """Price a European call or put option under the configured parameters."""
        if _has_grid_params(self.params):
            return self._price_from_grid_params(
                NOuter=NOuter,
                NInner=NInner,
                method=method,
                option_type=option_type,
                timed=timed,
                return_details=return_details,
            )

        start = time.perf_counter()
        result = _calculate_price(
            NOuter=NOuter,
            NInner=NInner,
            params=self.params,
            method=method,
            option_type=option_type,
            return_details=return_details,
        )
        elapsed = time.perf_counter() - start

        if return_details:
            price, details = result
            if timed:
                details["elapsed"] = elapsed
            return price, details

        if timed:
            return result, elapsed

        return result

    def _price_from_grid_params(
        self,
        NOuter: int,
        NInner: int,
        method: SolverMethod,
        option_type: OptionType,
        timed: bool,
        return_details: bool,
    ) -> list[dict[str, object]]:
        """Price all combinations implied by list-valued model parameters."""
        rows: list[dict[str, object]] = []
        grid_names = _grid_param_names(self.params)

        for grid_params in _expand_param_grid(self.params):
            start = time.perf_counter()
            result = _calculate_price(
                NOuter=NOuter,
                NInner=NInner,
                params=grid_params,
                method=method,
                option_type=option_type,
                return_details=return_details,
            )
            elapsed = time.perf_counter() - start

            if return_details:
                price, details = result
            else:
                price = result
                details = None

            row = _grid_params_as_row(grid_params, grid_names)
            row["price"] = price
            if timed:
                row["elapsed"] = elapsed
            if details is not None:
                row["details"] = details
            rows.append(row)

        return rows

    def price_grid(
        self,
        NOuter_values: Sequence[int],
        NInner_values: Sequence[int],
        method: SolverMethod = "implicit",
        option_type: OptionType = "call",
        timed: bool = False,
    ):
        """Return DataFrames of prices over NOuter and NInner combinations."""
        if _has_grid_params(self.params):
            raise ValueError("price_grid requires scalar RoughHestonParams; list-valued parameters are not supported.")

        import pandas as pd

        outer_values = _grid_int_values(NOuter_values, "NOuter_values")
        inner_values = _grid_int_values(NInner_values, "NInner_values")

        price_df = pd.DataFrame(index=inner_values, columns=outer_values, dtype=float)
        price_df.index.name = "NInner"
        price_df.columns.name = "NOuter"

        elapsed_df = pd.DataFrame(index=inner_values, columns=outer_values, dtype=float)
        elapsed_df.index.name = "NInner"
        elapsed_df.columns.name = "NOuter"

        for n_inner in inner_values:
            for n_outer in outer_values:
                if timed:
                    price, elapsed = self.price(
                        NOuter=n_outer,
                        NInner=n_inner,
                        method=method,
                        option_type=option_type,
                        timed=True,
                    )
                    elapsed_df.loc[n_inner, n_outer] = elapsed
                else:
                    price = self.price(
                        NOuter=n_outer,
                        NInner=n_inner,
                        method=method,
                        option_type=option_type,
                    )
                price_df.loc[n_inner, n_outer] = price

        if timed:
            return price_df, elapsed_df

        return price_df


# ============================================================
# Quadrature helpers
# ============================================================

def gauss_legendre(n: int, a: float, b: float) -> Tuple[np.ndarray, np.ndarray]:
    """Gauss-Legendre quadrature nodes and weights on [a, b]."""
    if n <= 0:
        raise ValueError("n must be positive.")

    x_std, w_std = np.polynomial.legendre.leggauss(n)
    x = 0.5 * (b - a) * x_std + 0.5 * (a + b)
    w = 0.5 * (b - a) * w_std
    return x, w


def composite_simpson(n: int, a: float, b: float) -> Tuple[np.ndarray, np.ndarray]:
    """Composite Simpson rule nodes and weights on [a, b]."""
    if n <= 0:
        raise ValueError("n must be positive.")
    if n % 2 != 0:
        raise ValueError("Composite Simpson requires even n. Please use an even NInner.")

    x = np.linspace(a, b, n + 1)
    h = (b - a) / n

    w = np.ones(n + 1, dtype=float)
    w[1::2] *= 4.0
    w[2:n:2] *= 2.0
    w *= h / 3.0

    return x, w


def fgc(K: float, u: np.ndarray) -> np.ndarray:
    """Lewis-style Fourier transform of the call payoff.

    Same formula as MATLAB Fgc:
        -K^(i*u + 1) / (u^2 - i*u)
    """
    return -(K ** (1j * u + 1.0)) / (u**2 - 1j * u)


# ============================================================
# Rough Heston Riccati structure
# ============================================================

def riccati_coefficients(
    uL: np.ndarray,
    lam: float,
    rho: float,
    nu: float,
) -> Tuple[np.ndarray, np.ndarray, float]:
    """Return A, B, C such that F(h) = A + B*h + C*h^2.

    The MATLAB code uses
        F(h) = 0.5 * [ -uL^2 - i*uL
                       + 2*lambda*(i*rho*nu*uL - 1)*h
                       + (lambda*nu*h)^2 ]

    Therefore:
        A = 0.5*(-uL^2 - i*uL)
        B = lambda*(i*rho*nu*uL - 1)
        C = 0.5*(lambda*nu)^2
    """
    A = 0.5 * (-uL**2 - 1j * uL)
    B = lam * (1j * rho * nu * uL - 1.0)
    C = 0.5 * (lam * nu) ** 2
    return A, B, C


def quadratic_implicit_corrector(
    G: np.ndarray,
    predictor: np.ndarray,
    A: np.ndarray,
    B: np.ndarray,
    C: float,
    a_endpoint: float,
    eps: float = 1e-14,
) -> np.ndarray:
    """Closed-form implicit Adams corrector.

    The implicit corrector solves
        h = G + a_endpoint * F(h),
    where
        F(h) = A + B*h + C*h^2.

    This becomes the complex quadratic equation
        a_endpoint*C*h^2 + (a_endpoint*B - 1)*h + (G + a_endpoint*A) = 0.

    We compute both roots and choose the one closest to the predictor value.
    This root-selection rule keeps the numerical branch continuous.
    """
    q2 = a_endpoint * C
    q1 = a_endpoint * B - 1.0
    q0 = G + a_endpoint * A

    # If the quadratic term is nearly zero, fall back to the linear equation
    # q1*h + q0 = 0.
    linear_root = -q0 / q1

    if abs(q2) < eps:
        return linear_root

    discriminant = q1**2 - 4.0 * q2 * q0
    sqrt_discriminant = np.sqrt(discriminant)

    root_plus = (-q1 + sqrt_discriminant) / (2.0 * q2)
    root_minus = (-q1 - sqrt_discriminant) / (2.0 * q2)

    use_plus = np.abs(root_plus - predictor) <= np.abs(root_minus - predictor)
    corrector = np.where(use_plus, root_plus, root_minus)
    return corrector


def _calculate_price(
    NOuter: int,
    NInner: int,
    params: RoughHestonParams,
    method: SolverMethod,
    option_type: OptionType,
    return_details: bool = False,
):
    """Price a European call or put under rough Heston.

    The implicit method solves h = G + a*F(h) exactly as a
    quadratic equation at each time step and Fourier node. The explicit method
    keeps the original predictor-corrector endpoint update h = G + a*F(h^P).

    Parameters
    ----------
    NOuter : int
        Number of Gauss-Legendre nodes for Fourier integration.
    NInner : int
        Number of time steps for fractional Adams recursion. Must be even
        because Simpson quadrature is used at the end.
    params : RoughHestonParams
        Model and numerical parameters.
    method : {"implicit", "explicit"}
        Corrector method used in the fractional Adams recursion.
    option_type : {"call", "put"}
        Option payoff type. Put prices are obtained from the computed call price
        by put-call parity.
    return_details : bool
        If True, return (price, details_dict). Otherwise return price.

    Returns
    -------
    price : float
        Option price.
    details : dict, optional
        Returned only when return_details=True. Contains u, h, numF, L.
    """
    if NOuter <= 0:
        raise ValueError("NOuter must be positive.")
    if NInner <= 0:
        raise ValueError("NInner must be positive.")
    if NInner % 2 != 0:
        raise ValueError("NInner must be even because composite Simpson is used.")

    if method not in ("implicit", "explicit"):
        raise ValueError("method must be 'implicit' or 'explicit'.")
    if option_type not in ("call", "put"):
        raise ValueError("option_type must be 'call' or 'put'.")

    p = params

    # Fourier quadrature grid.
    u, w = gauss_legendre(NOuter, p.u_lower, p.u_upper)
    uL = u.astype(np.complex128) - 1j * p.R

    # F(h) = A + B*h + C*h^2.
    A, B, C = riccati_coefficients(uL, p.lam, p.rho, p.nu)

    def F(h: np.ndarray) -> np.ndarray:
        return A + B * h + C * h**2

    # Store h(t_k, u_i) and F(h(t_k, u_i)).
    h = np.zeros((NOuter, NInner + 1), dtype=np.complex128)
    numF = np.zeros_like(h)
    h[:, 0] = 0.0
    numF[:, 0] = F(h[:, 0])
    F0 = numF[:, 0]

    delta = p.t / NInner

    # Fractional Adams weights.
    a_constant = delta**p.alpha / gamma(p.alpha + 2.0)
    b_constant = delta**p.alpha / gamma(p.alpha + 1.0)

    # Precompute a0(k), k=0,...,NInner-1.
    k_arr = np.arange(NInner, dtype=float)
    a0_values = a_constant * (
        k_arr ** (p.alpha + 1.0) - (k_arr - p.alpha) * (k_arr + 1.0) ** p.alpha
    )

    # Precompute a_mid following the same reverse-order logic as MATLAB code.
    a_all = np.arange(NInner, -1, -1, dtype=float) ** (p.alpha + 1.0)
    a_diff_order1 = a_all[:NInner] - a_all[1 : NInner + 1]
    a_diff_order2 = a_diff_order1[: NInner - 1] - a_diff_order1[1:NInner]
    a_mid = a_constant * a_diff_order2

    # Precompute predictor weights b.
    b_all = np.arange(NInner, -1, -1, dtype=float) ** p.alpha
    b_diff = b_all[:NInner] - b_all[1 : NInner + 1]
    b_coef = b_constant * b_diff

    for k in range(NInner):
        # Predictor:
        #   h_{k+1}^P = sum_{j=0}^k b_{k-j} F(h_j)
        predictor_weights = b_coef[-(k + 1) :]
        predictor = numF[:, : k + 1] @ predictor_weights

        # Historical part of Adams-Moulton corrector:
        #   G_k = a0(k)*F(h_0) + sum_{j=1}^k a_{k,j} F(h_j)
        if k == 0:
            G = a0_values[k] * F0
        else:
            corrector_history_weights = a_mid[-k:]
            G = a0_values[k] * F0 + numF[:, 1 : k + 1] @ corrector_history_weights

        if method == "implicit":
            # New method: solve h = G + a*F(h) exactly as a quadratic equation.
            corrector = quadratic_implicit_corrector(
                G=G,
                predictor=predictor,
                A=A,
                B=B,
                C=C,
                a_endpoint=a_constant,
            )
        else:
            corrector = G + a_constant * F(predictor)

        h[:, k + 1] = corrector
        numF[:, k + 1] = F(corrector)

    # Time integral in the characteristic function formula.
    _, w_inner = composite_simpson(NInner, 0.0, p.t)
    L = np.exp(p.theta * p.lam * (h @ w_inner) + p.z * (numF @ w_inner))

    # Fourier inversion.
    payoff_transform = p.S0 * fgc(p.K / p.S0, 1j * p.R - u)
    call_price = 2.0 * np.exp(-p.r * p.t) / (2.0 * np.pi) * np.sum(
        w * np.real(L * payoff_transform)
    )
    call_price = float(np.real(call_price))

    if option_type == "call":
        price = call_price
    else:
        price = call_price - p.S0 + p.K * np.exp(-p.r * p.t)

    if return_details:
        details = {
            "u": u,
            "weights_fourier": w,
            "uL": uL,
            "h": h,
            "numF": numF,
            "L": L,
            "params": p,
            "method": method,
            "option_type": option_type,
            "call_price": call_price,
        }
        return price, details

    return price
