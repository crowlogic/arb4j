from dataclasses import dataclass
from math import comb, factorial
from typing import Callable, Literal

import numpy as np
import jax.numpy as jnp
from scipy.special import gamma

from .integration import Field, Integrate, TimeGrid, suggested_time_grid_power


@dataclass(slots=True)
class RoughHestonParam:
    """Parameters for the rough Heston stochastic volatility model.

    The variance process satisfies

        dS_t = sqrt(V_t) S_t dW_t
        V_t  = V0 + (1/Γ(H+½)) ∫₀ᵗ (t-s)^(H-½) [lam*(theta - V_s) ds
                                                    + nu*sqrt(V_s) dB_s]
        corr(dW_t, dB_t) = rho

    where H ∈ (-½, ½] is the Hurst exponent; H = ½ recovers classical Heston.
    All parameters are the *raw* (un-normalised) Riccati coefficients.

    Parameters
    ----------
    lam : float
        Mean-reversion speed of the variance process.
    theta : float
        Long-run variance level (mean of V_t as t → ∞).
    nu : float
        Vol-of-vol (raw, un-normalised).
    rho : float
        Correlation between price and variance Brownian motions; typically < 0.
    V0 : float
        Initial instantaneous variance.
    H : float
        Hurst exponent; must lie in (-½, ½].  H = ½ → classical Heston.
    """
    lam: float = 0.3
    theta: float = 0.3 * 0.02
    nu: float = 0.3
    rho: float = -0.7
    V0: float = 0.02
    H: float = 0.4



@dataclass(slots=True)
class HestonExpansionState:
    """Intermediate state returned by :meth:`RoughHeston.expansion_state`.

    Attributes
    ----------
    grid : TimeGrid
        Time discretisation used for the Volterra solve.
    u : np.ndarray
        Complex Fourier argument array, shape ``(N_u,)``.
    alpha : float
        ``Γ(anchor_H + ½)`` — the normalisation factor for the fractional kernel.
    f0 : Field
        Base Riccati solution ``h(u, ·)`` at the expansion anchor, shape ``(N_u, N_t)``.
    expansion : Field
        Taylor-summed approximation ``Σ_{n=0}^{N} (H-H₀)ⁿ/n! fₙ``, same shape as ``f0``.
    F_ricc : Callable
        Unscaled Riccati right-hand side ``F_raw(x) = c - β x + ½γ x²``.
    kappa_path : Field
        Conditional-mean path ``V0 + (θ/Γ(H+3/2)) t^(H+½)``, shape ``(N_t,)``.
    kappa_path_reflected : Field
        Same path evaluated at ``T - t`` (used for the measure change).
    f_list : list[Field] or None
        Expansion coefficients ``[f_0, f_1, …, f_N]``; populated only when
        ``return_lists=True`` is passed to :meth:`~RoughHeston.expansion_state`.
    F_list : list[Field] or None
        Corresponding Riccati RHS evaluations; populated alongside ``f_list``.
    """
    grid: TimeGrid
    u: np.ndarray
    alpha: float
    f0: object  # Field
    expansion: object  # Field
    F_ricc: Callable
    kappa_path: object  # Field
    kappa_path_reflected: object  # Field
    f_list: list | None = None
    F_list: list | None = None


@dataclass(slots=True)
class RiccatiContext:
    """Shared setup that is independent of the expansion anchor point."""
    grid: TimeGrid
    u: np.ndarray
    Z: object  # Field: grid.field(u)
    time: object  # Field: grid.field(grid.t)
    beta: object  # Field: lam_raw - rho*nu_raw*u*1j  (unscaled)
    gam: float  # nu_raw^2  (unscaled)
    alpha: float  # Gamma(anchor_H+0.5); stored for direct-Riccati and exact-Heston solvers
    anchor_H: float  # anchor Hurst exponent
    theta: float
    V0: float
    F_ricc: Callable  # Riccati RHS F_raw (unscaled; kernel ops include 1/Γ)
    kappa_path: object  # Field: V0 + (theta/Γ(H+3/2)) * t^(H+1/2)
    kappa_path_reflected: object  # Field: same but evaluated at T-t


@dataclass(slots=True)
class AnchorExpansionOps:
    """Anchor-specific objects needed to run the expansion recursion."""
    anchor_H: float  # anchor point, e.g. 0.5 for the Heston branch
    f0: object  # Field: base Riccati solution at anchor
    K: object  # dict[int, Integrate]: log^k kernel operators
    solve_linearized: Callable  # [[Field], Field]: linear resolvent


class _LinearCombOp:
    """Weighted sum of integration operators: result = Σ_i c_i * (K_i @ obj)."""

    def __init__(self, terms: list):
        self._terms = terms  # list of (float, Integrate) pairs

    def __matmul__(self, obj):
        result = None
        for c, K in self._terms:
            term = c * (K @ obj)
            result = term if result is None else result + term
        return result

    @property
    def weights_matrix(self):
        result = None
        for c, K in self._terms:
            m = c * K.weights_matrix
            result = m if result is None else result + m
        return result


def _raw_kernel_op(grid: TimeGrid, anchor_H: float, log_order: int) -> Integrate:
    """Return the operator for (t-s)^(anchor_H-1/2) * log(t-s)^log_order."""
    q = anchor_H - 0.5
    if log_order == 0:
        if abs(q) < 1e-15:
            return Integrate(grid, kernel="regular", start=0)
        return Integrate(grid, kernel="frac", order=q, start=0)
    if abs(q) < 1e-15:
        return Integrate(grid, kernel="log", order=log_order, start=0)
    return Integrate(grid, kernel="fraclog", order=log_order, frac_power=q, start=0)


def _poly_mul(p: np.ndarray, q: np.ndarray) -> np.ndarray:
    return np.convolve(p, q)


def _relative_gamma_poly_coeffs(anchor_H: float, order: int) -> list:
    """Return polys[n] = coefficients of P_n(L), n=0..order.

    The n-th derivative kernel at H=anchor_H is
        K_n(t) = t^(anchor_H-1/2) * P_n(log t)
    where P_n satisfies the recurrence
        P_{n+1} = sum_{k=0}^n C(n,k) * P_{n-k} * x_{k+1}
    with x_1(L) = L - digamma(a) and x_m = -polygamma(m-1, a) for m>=2.

    coeffs[j] = coefficient of L**j.
    """
    from scipy.special import digamma, polygamma

    a = anchor_H + 0.5
    polys = [np.array([1.0], dtype=float)]

    x = [None] * (order + 1)
    if order >= 1:
        x[1] = np.array([-float(digamma(a)), 1.0], dtype=float)
    for m in range(2, order + 1):
        x[m] = np.array([-float(polygamma(m - 1, a))], dtype=float)

    for n in range(order):
        P_next = np.zeros(n + 2, dtype=float)
        for k in range(n + 1):
            term = _poly_mul(polys[n - k], x[k + 1])
            P_next[:len(term)] += comb(n, k) * term
        polys.append(P_next)

    return polys


def _build_kernel_derivative_ops(
        grid: TimeGrid,
        anchor_H: float,
        order: int,
) -> dict:
    """Build the dict of kernel-derivative operators K[0], ..., K[order].

    Each K[n] is the n-th H-derivative of the full kernel (t-s)^(H-1/2)/Γ(H+1/2)
    evaluated at H=anchor_H, so K[0] is the proper fractional integral
    (1/Γ(anchor_H+1/2)) * ∫(t-s)^(anchor_H-1/2) [.] ds.  The 1/Γ factor is
    absorbed here so callers can work with the unscaled Riccati RHS F_raw.
    """
    alpha = gamma(anchor_H + 0.5)
    polys = _relative_gamma_poly_coeffs(anchor_H, order)
    raw_ops = {j: _raw_kernel_op(grid, anchor_H, j) for j in range(order + 1)}

    tol = 1e-14
    K = {}
    for n in range(order + 1):
        terms = [
            (float(c) / alpha, raw_ops[j])
            for j, c in enumerate(polys[n])
            if abs(c) > tol
        ]
        if len(terms) == 1 and abs(terms[0][0] - 1.0) <= tol:
            K[n] = terms[0][1]
        else:
            K[n] = _LinearCombOp(terms)
    return K


class RoughHeston(object):
    """Rough Heston model pricer based on a fractional-Riccati Taylor expansion.

    The log-price characteristic function is approximated by expanding the
    fractional Riccati solution around an anchor Hurst exponent ``H₀ = param.H``
    to arbitrary order in ``ΔH = H_target - H₀``.  At order 0 the expansion
    collapses to the exact model characteristic function at the anchor.

    The anchor Riccati solution ``h(u, t; H₀)`` is computed by one of three
    methods selected via ``base_solution``:

    * ``"root_pade"``  — root-transformed Padé approximant (default away from H₀ = ½).
    * ``"exact_heston"`` — closed-form classical Heston (only valid at H₀ = ½).
    * ``"pade"``       — Gatheral Padé [m/m] approximant.
    * ``"direct_riccati"`` — numerical fractional ODE solver (Adams or implicit-π).
    * ``"auto"``       — ``"exact_heston"`` when ``H₀ = ½``, else ``"root_pade"``.

    European option prices are computed via Fourier inversion on the Lewis
    contour (``R = 0.5``) or a shifted damped-payoff contour (``R > 0.5``).
    """

    def __init__(
            self,
            param: RoughHestonParam,
            riskfree: float,
            base_solution: str = "auto",
            pade_order: str = "22",
            root_pade_series_order: int | None = None,
            root_pade_degree: int = 7,
            root_pade_tail_match: bool = False,
            direct_riccati_solver: Literal["auto", "adams", "implicit_pi"] = "auto",
    ):
        """Initialise the rough Heston pricer.

        Parameters
        ----------
        param : RoughHestonParam
            Model parameters.  ``param.H`` is used as the expansion anchor H₀.
        riskfree : float
            Continuously compounded risk-free rate.
        base_solution : {"auto", "root_pade", "exact_heston", "pade", "direct_riccati"}
            Method used to solve the base Riccati equation at the anchor.
            ``"auto"`` selects ``"exact_heston"`` when ``param.H == 0.5``,
            otherwise ``"root_pade"``.
        pade_order : {"22", "33", "44"}
            Padé order; only used when ``base_solution="pade"``.
        root_pade_series_order : int or None
            Number of short-time series coefficients for the root-Padé solve;
            ``None`` defaults to ``2 * root_pade_degree + 1``.
        root_pade_degree : int
            Numerator degree ``m`` of the ``[m/(m+1)]`` root-Padé approximant.
        root_pade_tail_match : bool
            If ``True``, replace the highest short-time Padé equation with the
            exact leading ``1/x`` tail constraint, improving large-maturity accuracy.
        direct_riccati_solver : {"auto", "adams", "implicit_pi"}
            Fractional ODE solver when ``base_solution="direct_riccati"``.
            ``"auto"`` selects ``"implicit_pi"`` for ``H < 0`` or non-uniform grids.
        """
        self.param = param
        self.riskfree = riskfree
        self.base_solution = base_solution
        self.pade_order = pade_order
        self.root_pade_series_order = root_pade_series_order
        self.root_pade_degree = root_pade_degree
        self.root_pade_tail_match = root_pade_tail_match
        self.direct_riccati_solver = direct_riccati_solver

    def expansion_state(
            self,
            arg: np.ndarray,
            maturity: float = 1.0,
            order: int = 0,
            time_steps: int = 100,
            H: float | None = None,
            return_lists: bool = False,
            anchor: float | None = None,
            base: Literal["auto", "exact_heston", "pade", "root_pade", "direct_riccati"] | None = None,
            pade_order: str | None = None,
            root_pade_degree: int | None = None,
            root_pade_series_order: int | None = None,
            root_pade_tail_match: bool | None = None,
            time_grid: Literal["uniform", "graded", "symmetric_graded"] = "uniform",
            grid_power: float | None = None,
            direct_riccati_solver: Literal["auto", "adams", "implicit_pi"] | None = None,
    ) -> HestonExpansionState:
        """Compute the fractional-Riccati expansion state at a given Fourier argument.

        Solves the base Riccati equation at the anchor ``H₀`` and accumulates
        the H-derivative fields ``f_0, f_1, …, f_order`` on the time grid.
        The result can be passed directly to :meth:`log_charfun_from_field` or
        inspected for diagnostics.

        Parameters
        ----------
        arg : np.ndarray
            Complex Fourier argument, shape ``(N_u,)``.  Typically
            ``-1j*(R - 1j*u)`` for a contour at height ``R``.
        maturity : float
            Option maturity T > 0.
        order : int
            Taylor expansion order N.  Order 0 gives the exact anchor solution.
        time_steps : int
            Number of time-grid nodes on ``[0, T]``.
        H : float or None
            Target Hurst exponent for the expansion evaluation.
            ``None`` uses ``self.param.H`` (i.e. evaluates at the anchor itself).
        return_lists : bool
            If ``True``, populate ``HestonExpansionState.f_list`` and ``F_list``
            with the individual coefficient fields ``f_n``.
        anchor : float or None
            Override the expansion anchor for this call only.
            ``None`` (default) uses ``self.param.H``.
        base : str or None
            Override ``self.base_solution`` for this call only.
        pade_order, root_pade_degree, root_pade_series_order, root_pade_tail_match
            Per-call overrides for the corresponding constructor settings.
        time_grid : {"uniform", "graded", "symmetric_graded"}
            Time-node distribution.  ``"graded"`` clusters nodes near ``t = 0``
            (recommended for small anchors); ``"symmetric_graded"`` additionally
            clusters near ``t = T``.
        grid_power : float or None
            Grading exponent; ``None`` auto-selects via
            :func:`suggested_time_grid_power`.
        direct_riccati_solver : {"auto", "adams", "implicit_pi"} or None
            Per-call override for the fractional ODE solver.

        Returns
        -------
        HestonExpansionState
        """
        target_H = float(H) if H is not None else self.param.H
        anchor_eff = float(anchor) if anchor is not None else self.param.H
        base_eff = base if base is not None else self.base_solution
        po_eff = pade_order if pade_order is not None else self.pade_order
        rpd_eff = root_pade_degree if root_pade_degree is not None else self.root_pade_degree
        rpso_eff = root_pade_series_order if root_pade_series_order is not None else self.root_pade_series_order
        rptm_eff = root_pade_tail_match if root_pade_tail_match is not None else self.root_pade_tail_match
        drs_eff = direct_riccati_solver if direct_riccati_solver is not None else self.direct_riccati_solver

        alpha_anchor = anchor_eff + 0.5
        if not (0.0 < alpha_anchor <= 1.0):
            raise ValueError(f"anchor must be in (-0.5, 0.5], got {anchor_eff!r}")
        if base_eff not in ("auto", "exact_heston", "pade", "root_pade", "direct_riccati"):
            raise ValueError(
                f"base must be one of 'auto', 'exact_heston', 'pade', 'root_pade', "
                f"'direct_riccati', got {base_eff!r}"
            )
        if base_eff == "direct_riccati" and drs_eff == "adams" and time_grid != "uniform":
            raise ValueError(
                f"base='direct_riccati' with direct_riccati_solver='adams' requires "
                f"time_grid='uniform' (got {time_grid!r})."
            )
        ctx = self._build_convention_context(
            arg, maturity, time_steps,
            anchor_H=anchor_eff, target_H=target_H,
            time_grid=time_grid, grid_power=grid_power,
        )
        ops = self._build_anchor_ops(
            ctx, order, base_eff, anchor_eff,
            pade_order=po_eff,
            root_pade_degree=rpd_eff,
            root_pade_series_order=rpso_eff,
            root_pade_tail_match=rptm_eff,
            direct_riccati_solver=drs_eff,
        )
        expansion, f_list, F_list = self._run_expansion_recursion(
            ctx=ctx, ops=ops, target_H=target_H, order=order, return_lists=return_lists,
        )
        return HestonExpansionState(
            grid=ctx.grid,
            u=ctx.u,
            alpha=ctx.alpha,
            f0=ops.f0,
            expansion=expansion,
            F_ricc=ctx.F_ricc,
            kappa_path=ctx.kappa_path,
            kappa_path_reflected=ctx.kappa_path_reflected,
            f_list=f_list,
            F_list=F_list,
        )

    # ------------------------------------------------------------------
    # ------------------------------------------------------------------

    def _build_convention_context(
            self,
            arg: np.ndarray,
            maturity: float,
            time_steps: int,
            *,
            anchor_H: float,
            target_H: float | None = None,
            time_grid: str = "uniform",
            grid_power: float | None = None,
    ) -> RiccatiContext:
        """Build the shared Riccati context. driver_alpha = Gamma(anchor_H + 0.5)."""
        if target_H is None:
            target_H = self.param.H

        if time_steps < 1:
            raise ValueError(f"time_steps must be >= 1, got {time_steps!r}")
        if maturity <= 0:
            raise ValueError(f"maturity must be > 0, got {maturity!r}")
        if grid_power is not None and grid_power < 1.0:
            raise ValueError(f"grid_power must be >= 1, got {grid_power!r}")

        driver_alpha = gamma(anchor_H + 0.5)

        lam_raw = self.param.lam
        nu_raw = self.param.nu
        rho = self.param.rho
        theta = self.param.theta
        V0 = self.param.V0

        u = np.asarray(arg, dtype=np.complex128).reshape(-1)
        if time_grid == "uniform":
            grid = TimeGrid.uniform(T=maturity, J=int(time_steps))
        elif time_grid == "graded":
            power = grid_power if grid_power is not None else suggested_time_grid_power(anchor_H)
            grid = TimeGrid.graded(T=maturity, J=int(time_steps), power=power)
        elif time_grid == "symmetric_graded":
            power = grid_power if grid_power is not None else suggested_time_grid_power(anchor_H)
            grid = TimeGrid.symmetric_graded(T=maturity, J=int(time_steps), power=power)
        else:
            raise ValueError(
                f"time_grid must be 'uniform', 'graded', or 'symmetric_graded', got {time_grid!r}"
            )
        time = grid.field(grid.t, has_time_axis=True)

        beta = grid.field(lam_raw - rho * nu_raw * u * 1j)
        gam = nu_raw ** 2
        Z = grid.field(u)

        F_ricc = lambda x: (
                (-0.5) * Z * (Z + 1j)
                - beta * x
                + 0.5 * gam * (x * x)
        )

        kappa_path = V0 + (theta / gamma(target_H + 1.5)) * np.power(time, target_H + 0.5)

        t_ref = grid.field(np.maximum(grid.T - grid.t, 0.0), has_time_axis=True)
        kappa_path_reflected = V0 + (theta / gamma(target_H + 1.5)) * np.power(t_ref, target_H + 0.5)

        return RiccatiContext(
            grid=grid, u=u, Z=Z, time=time, beta=beta,
            gam=gam, alpha=driver_alpha,
            anchor_H=anchor_H, theta=theta, V0=V0,
            F_ricc=F_ricc, kappa_path=kappa_path,
            kappa_path_reflected=kappa_path_reflected,
        )

    # ------------------------------------------------------------------
    # ------------------------------------------------------------------

    def _build_exact_heston_anchor_ops(
            self,
            ctx: RiccatiContext,
            order: int,
    ) -> AnchorExpansionOps:
        lam_eff = self.param.lam / ctx.alpha
        nu_eff = self.param.nu / ctx.alpha
        rho = self.param.rho

        # Heston discriminant (scalar arrays over u)
        beta_eff = lam_eff - rho * nu_eff * ctx.u * 1j
        D_raw = np.sqrt(beta_eff ** 2 + (ctx.u + 1j) * ctx.u * nu_eff ** 2)
        G_raw = (beta_eff - D_raw) / (beta_eff + D_raw)

        D = ctx.grid.field(D_raw)
        G = ctx.grid.field(G_raw)
        eD = np.exp(-D * ctx.time)

        f0 = ctx.gam ** -1 * (ctx.beta - D) * (1 - eD) / (1 - G * eD)
        eG0 = (1 - G * eD) * (1 - G * eD) / eD
        g = -ctx.beta + ctx.gam * f0
        del eD, D, G

        K = _build_kernel_derivative_ops(ctx.grid, anchor_H=0.5, order=order)

        def solve_linearized(h_n: Field) -> Field:
            return h_n + (K[0] @ (g * eG0 * h_n)) / eG0

        return AnchorExpansionOps(
            anchor_H=0.5,
            f0=f0,
            K=K,
            solve_linearized=solve_linearized,
        )

    # ------------------------------------------------------------------
    # ------------------------------------------------------------------

    def _build_anchor_ops(
            self,
            ctx: RiccatiContext,
            order: int,
            base: str,
            anchor: float,
            pade_order: str = "22",
            root_pade_degree: int = 7,
            root_pade_series_order: int | None = None,
            root_pade_tail_match: bool = False,
            direct_riccati_solver: str = "auto",
    ) -> AnchorExpansionOps:
        anchor_tol = 1e-10
        if base == "auto":
            if abs(anchor - 0.5) < anchor_tol:
                return self._build_exact_heston_anchor_ops(ctx, order)
            return self._build_approx_anchor_ops(
                ctx, order, "root_pade", anchor,
                root_pade_degree=root_pade_degree,
                root_pade_series_order=root_pade_series_order,
                root_pade_tail_match=root_pade_tail_match,
            )
        if base == "exact_heston":
            if abs(anchor - 0.5) >= anchor_tol:
                raise ValueError(
                    f"base='exact_heston' requires anchor=0.5, got anchor={anchor!r}"
                )
            return self._build_exact_heston_anchor_ops(ctx, order)
        return self._build_approx_anchor_ops(
            ctx, order, base, anchor,
            pade_order=pade_order,
            root_pade_degree=root_pade_degree,
            root_pade_series_order=root_pade_series_order,
            root_pade_tail_match=root_pade_tail_match,
            direct_riccati_solver=direct_riccati_solver,
        )

    # ------------------------------------------------------------------
    # ------------------------------------------------------------------

    def _build_approx_anchor_ops(
            self,
            ctx: RiccatiContext,
            order: int,
            base: str,
            anchor: float,
            pade_order: str = "22",
            root_pade_degree: int = 7,
            root_pade_series_order: int | None = None,
            root_pade_tail_match: bool = False,
            direct_riccati_solver: str = "auto",
    ) -> AnchorExpansionOps:
        if base == "pade":
            from .pade import rough_heston_pade_f0
            f0_values = rough_heston_pade_f0(
                u=ctx.u,
                t=ctx.grid.t,
                param=self.param,
                pade_order=pade_order,
                H_anchor=anchor,
            )
        elif base == "direct_riccati":
            # Solve psi = ∫_0^t (t-s)^(alpha-1) F(psi(s)) ds
            # with F(x) = c - beta*x + 0.5*gam*x^2.
            alpha_anchor = anchor + 0.5
            lam_raw = self.param.lam
            nu_raw = self.param.nu
            rho = self.param.rho
            _c_np = np.asarray(-0.5 / ctx.alpha * ctx.u * (ctx.u + 1j), dtype=np.complex128)
            _beta_np = np.asarray((lam_raw - rho * nu_raw * 1j * ctx.u) / ctx.alpha, dtype=np.complex128)
            _gam = float(nu_raw ** 2 / ctx.alpha)

            # Determine which solver to use.
            _is_uniform = np.allclose(np.diff(ctx.grid.t), np.diff(ctx.grid.t)[0],
                                      rtol=1e-10, atol=1e-14)
            if direct_riccati_solver == "implicit_pi":
                _use_implicit_pi = True
            elif direct_riccati_solver == "adams":
                _use_implicit_pi = False
            else:  # "auto": prefer implicit_pi for H<0 or non-uniform grids
                _use_implicit_pi = (anchor < 0.0) or not _is_uniform

            if _use_implicit_pi:
                from .integration import ProductIntegrationRiccatiSolver
                solver = ProductIntegrationRiccatiSolver(
                    ctx.grid, alpha_anchor, _c_np, _beta_np, _gam,
                )
                f0_field = solver.solve()
            else:
                from .integration import AdamsFractionalRiccatiSolver
                _c_jnp = jnp.asarray(_c_np)
                _beta_jnp = jnp.asarray(_beta_np)

                def F_point(j, x):
                    return _c_jnp - _beta_jnp * x + 0.5 * _gam * x * x

                solver = AdamsFractionalRiccatiSolver(
                    ctx.grid, alpha_anchor, F_point, normalized=False,
                )
                f0_field = solver.solve()

            f0_values = np.asarray(f0_field.values)
        elif base == "root_pade":
            from .pade import rough_heston_root_pade_f0
            f0_values = rough_heston_root_pade_f0(u=ctx.u, t=ctx.grid.t, param=self.param, degree=root_pade_degree,
                                                  H=anchor, tail_match=root_pade_tail_match)
        else:
            raise ValueError(
                f"base must be 'pade', 'root_pade', or 'direct_riccati', got {base!r}"
            )

        f0 = ctx.grid.field(f0_values, has_time_axis=True)
        K = _build_kernel_derivative_ops(ctx.grid, anchor_H=anchor, order=order)

        if order == 0:
            def solve_linearized(h_n: Field) -> Field:
                raise NotImplementedError("order >= 1 requires order >= 1 to be specified")

            return AnchorExpansionOps(anchor_H=anchor, f0=f0, K=K, solve_linearized=solve_linearized)

        Fx0 = -ctx.beta + ctx.gam * f0

        anchor_tol = 1e-10
        if abs(anchor - 0.5) < anchor_tol:
            # anchor=0.5 → K[0] is kernel='regular' (no weights_matrix).
            # Solve x = rhs + ∫_0^t Fx0(s)*x(s) ds by a forward left-rectangle
            # scan that avoids the dense Omega matrix. Uses actual panel widths
            # so nonuniform (graded) grids are handled correctly.
            from jax import lax as _lax
            _dt_arr = jnp.asarray(np.append(np.diff(ctx.grid.t), 0.0), dtype=jnp.float64)
            _Fx0 = jnp.asarray(Fx0.values, dtype=jnp.complex128)

            def solve_linearized(rhs: Field) -> Field:
                R = jnp.asarray(ctx.grid.field(rhs).values, dtype=jnp.complex128)

                def _step(acc, j):
                    x_j = R[..., j] + acc
                    return acc + _dt_arr[j] * _Fx0[..., j] * x_j, x_j

                _, x_cols = _lax.scan(_step, jnp.zeros(R.shape[:-1], dtype=jnp.complex128),
                                      jnp.arange(R.shape[-1]))
                return ctx.grid.field(jnp.moveaxis(x_cols, 0, -1), has_time_axis=True)
        else:
            from .integration import LinearVolterraSolver
            solver = LinearVolterraSolver(ctx.grid, K[0], scale=1.0)

            def solve_linearized(rhs: Field) -> Field:
                return solver.solve(rhs, Fx0)

        return AnchorExpansionOps(anchor_H=anchor, f0=f0, K=K, solve_linearized=solve_linearized)

    # ------------------------------------------------------------------
    # ------------------------------------------------------------------

    def _run_expansion_recursion(
            self,
            ctx: RiccatiContext,
            ops: AnchorExpansionOps,
            target_H: float,
            order: int,
            return_lists: bool,
    ):
        f_list = [ops.f0]
        F_list = [ctx.F_ricc(ops.f0)]
        expansion = ops.f0

        for n in range(1, order + 1):
            h_n = ctx.grid.field(0.0)

            for k in range(1, n + 1):
                m = n - k
                h_n += comb(n, k) * (ops.K[k] @ F_list[m])

            if n >= 2:
                T_n = ctx.grid.field(0.0)
                for p in range(1, n):
                    T_n += comb(n, p) * (f_list[p] * f_list[n - p])
                h_n += ops.K[0] @ (0.5 * ctx.gam * T_n)

            f_n = ops.solve_linearized(h_n)
            f_list.append(f_n)
            cross = ctx.grid.field(0.0)

            for p in range(0, n + 1):
                cross += comb(n, p) * (f_list[p] * f_list[n - p])

            F_n = -ctx.beta * f_n + 0.5 * ctx.gam * cross
            F_list.append(F_n)
            expansion += (target_H - ops.anchor_H) ** n / factorial(n) * f_n

        f_out = f_list if return_lists else None
        F_out = F_list if return_lists else None
        return expansion, f_out, F_out

    def log_charfun_from_field(self, state: HestonExpansionState, field) -> np.ndarray:
        C = Integrate(state.grid, start=0, stop="T") @ (
                state.F_ricc(field) * state.kappa_path_reflected
        )
        return 1j * state.u * self.riskfree * state.grid.T + C

    def _compute_kappa_path_reflected(self, grid: TimeGrid, H: float):
        """Reflected variance path: evaluated at T-t instead of t."""
        t_ref = grid.field(np.maximum(grid.T - grid.t, 0.0), has_time_axis=True)
        return self.param.V0 + (self.param.theta / gamma(H + 1.5)) * np.power(t_ref, H + 0.5)

    def _log_charfun_raw(self, ctx: RiccatiContext, expansion_field, kappa_path_reflected) -> np.ndarray:
        """Log charfun given a pre-built context, expansion field, and reflected kappa_path."""
        C = Integrate(ctx.grid, start=0, stop="T") @ (
                ctx.F_ricc(expansion_field) * kappa_path_reflected
        )
        return 1j * ctx.u * self.riskfree * ctx.grid.T + C

    def _compute_expansion_for_H(self, f_list: list, anchor_H: float, H: float):
        """Taylor combination: f0 + (H−a)*f1/1! + (H−a)²*f2/2! + …"""
        result = f_list[0]
        for n in range(1, len(f_list)):
            result = result + (H - anchor_H) ** n / factorial(n) * f_list[n]
        return result

    def _build_h_independent_fields(
            self,
            arg: np.ndarray,
            maturity: float,
            time_steps: int,
            order: int,
            anchor_eff: float,
            base_eff: str,
            pade_order_eff: str,
            rpd_eff: int,
            rpso_eff,
            rptm_eff: bool = False,
            time_grid: str = "uniform",
            grid_power: float | None = None,
            direct_riccati_solver: str = "auto",
    ) -> tuple:
        """Build context and f_list independent of H (anchor_H used as placeholder for kappa_path).

        Callers must use _log_charfun_raw with the correct H-specific kappa_path.
        """
        ctx = self._build_convention_context(
            arg, maturity, time_steps,
            anchor_H=anchor_eff, target_H=anchor_eff,
            time_grid=time_grid, grid_power=grid_power,
        )
        ops = self._build_anchor_ops(
            ctx, order, base_eff, anchor_eff,
            pade_order=pade_order_eff,
            root_pade_degree=rpd_eff,
            root_pade_series_order=rpso_eff,
            root_pade_tail_match=rptm_eff,
            direct_riccati_solver=direct_riccati_solver,
        )
        _, f_list, _ = self._run_expansion_recursion(
            ctx=ctx, ops=ops, target_H=anchor_eff, order=order, return_lists=True,
        )
        return ctx, f_list

    def log_charfun(
            self,
            arg: np.ndarray,
            maturity: float = 1.0,
            order: int = 0,
            time_steps: int = 100,
            H=None,
            time_grid: Literal["uniform", "graded", "symmetric_graded"] = "uniform",
            grid_power: float | None = None,
    ) -> np.ndarray:
        """Log characteristic function E[exp(i u log(S_T/S_0))].

        Parameters
        ----------
        arg : np.ndarray
            Complex Fourier argument, shape ``(N_u,)``.
        maturity : float
            Option maturity T.
        order : int
            Taylor expansion order in H around the anchor ``self.param.H``.
        time_steps : int
            Number of time-grid nodes.
        H : float, array-like, or None
            Target Hurst exponent(s).  ``None`` → ``self.param.H``.
            Passing an array evaluates all H values in a single Volterra solve,
            returning shape ``(N_u, N_H)``.  A scalar H returns shape ``(N_u,)``.
        time_grid : {"uniform", "graded", "symmetric_graded"}
            Time discretisation; see :meth:`expansion_state`.
        grid_power : float or None
            Grading exponent; ``None`` auto-selects.

        Returns
        -------
        np.ndarray
            Shape ``(N_u,)`` for scalar H, ``(N_u, N_H)`` for array H.
        """
        anchor_eff = self.param.H
        base_eff = self.base_solution
        po_eff = self.pade_order
        rpd_eff = self.root_pade_degree
        rpso_eff = self.root_pade_series_order
        rptm_eff = self.root_pade_tail_match

        if H is None:
            H_arr = np.array([self.param.H])
            scalar_H = True
        else:
            H_arr = np.atleast_1d(np.asarray(H, dtype=float))
            scalar_H = False

        if len(H_arr) > 1:
            ctx, f_list = self._build_h_independent_fields(
                arg, maturity, time_steps, order,
                anchor_eff, base_eff, po_eff, rpd_eff, rpso_eff, rptm_eff,
                time_grid=time_grid, grid_power=grid_power,
                direct_riccati_solver=self.direct_riccati_solver,
            )
            cols = []
            for H_i in H_arr:
                exp_i = self._compute_expansion_for_H(f_list, anchor_eff, float(H_i))
                kappa_i_ref = self._compute_kappa_path_reflected(ctx.grid, float(H_i))
                log_phi_i = self._log_charfun_raw(ctx, exp_i, kappa_i_ref)
                cols.append(np.asarray(log_phi_i).reshape(-1, 1))
            return np.concatenate(cols, axis=1)  # (n_u, n_H)

        # Scalar H — build state independently
        cols = []
        for H_i in H_arr:
            state = self.expansion_state(
                arg=arg, maturity=maturity, order=order, time_steps=time_steps,
                H=float(H_i), time_grid=time_grid, grid_power=grid_power,
            )
            cols.append(np.asarray(self.log_charfun_from_field(state, state.expansion)).reshape(-1, 1))
        log_phi = np.concatenate(cols, axis=1)  # (n_u, 1) or (n_u, n_H)
        return log_phi

    def charfun(
            self,
            arg: np.ndarray,
            maturity: float = 1.0,
            order: int = 0,
            time_steps: int = 100,
            H=None,
            time_grid: Literal["uniform", "graded", "symmetric_graded"] = "uniform",
            grid_power: float | None = None,
    ) -> np.ndarray:
        """Characteristic function.  See log_charfun for the H parameter."""
        return np.exp(self.log_charfun(
            arg=arg, maturity=maturity, order=order, time_steps=time_steps,
            H=H, time_grid=time_grid, grid_power=grid_power,
        ))

    def eur_call_put(
            self,
            # --- option ---
            K,
            maturity: float,
            S_0: float = 1.0,
            call: bool = True,
            digital: bool = False,
            implied_vol: bool = False,
            payoff_selection: str = "otm",
            # --- fourier ---
            R: float = 1.2,
            integration: Literal["panel", "adaptive_panel"] = "panel",
            L: float | None = None,
            panels=None,
            m_cheb: int = 16,
            q_weight: int = 128,
            time_steps_phi0: int | None = None,
            # --- expansion ---
            expansion_order: int = 0,
            time_steps: int = 1000,
            H=None,
            # --- adaptive ---
            adaptive_metric: Literal["price", "iv"] = "iv",
            adaptive_tol: float = 1e-4,
            adaptive_abs_tol: float = 1e-8,
            adaptive_rel_tol: float = 1e-6,
            adaptive_L_candidates: list | None = None,
            adaptive_max_iter: int = 8,
            adaptive_verbose: bool = False,
            # --- time grid ---
            time_grid: Literal["uniform", "graded", "symmetric_graded"] = "uniform",
            grid_power: float | None = None,
    ) -> np.ndarray:
        """Price European calls or puts via Fourier quadrature on the Heston measure.

        Parameters
        ----------
        K : array-like
            Strike prices.
        maturity : float
            Option maturity T > 0.
        S_0 : float
            Initial spot price.
        call : bool
            ``True`` for call, ``False`` for put.  Ignored when
            ``payoff_selection="otm"`` (OTM payoff is chosen per strike).
        digital : bool
            Price digital (cash-or-nothing) payoffs instead of vanilla.
        implied_vol : bool
            If ``True``, return Black–Scholes implied volatilities instead of
            option prices.
        payoff_selection : {"otm", "as_requested"}
            ``"otm"`` prices calls for K ≥ F and puts for K < F, then applies
            put–call parity.  ``"as_requested"`` uses ``call`` for all strikes.
        R : float
            Fourier contour height.  ``R = 0.5`` selects the Lewis contour
            (no dampening factor, numerically recommended).  ``R > 0.5``
            uses a damped-payoff contour.
        L : float or None
            Upper truncation of the Fourier integral.  ``None`` auto-selects
            from a maturity/moneyness heuristic.
        panels : array-like or None
            Explicit Chebyshev panel breakpoints.  Overrides ``L`` when given.
        m_cheb : int
            Chebyshev nodes per panel.
        q_weight : int
            Number of nodes for the quadrature weight pre-computation.
        time_steps_phi0 : int or None
            Time-grid nodes for the order-0 (phi0) solve.  ``None`` falls
            back to ``time_steps``.
        expansion_order : int
            Taylor expansion order N in H around ``self.param.H``.
        time_steps : int
            Time-grid nodes for the expansion solve.
        H : float, array-like, or None
            Target Hurst exponent(s).  ``None`` or a scalar uses ``self.param.H``
            or the given value and returns shape ``(N_K,)``.
            An array reuses the expensive Volterra fields across all H values
            and returns shape ``(N_K, N_H)``.
        integration : {"panel", "adaptive_panel"}
            ``"panel"`` uses fixed panels.  ``"adaptive_panel"`` iteratively
            widens ``L`` until prices or implied vols stabilise.
        adaptive_metric : {"price", "iv"}
            Convergence criterion for adaptive integration.
        adaptive_tol : float
            Relative tolerance for the adaptive stopping rule.
        adaptive_abs_tol, adaptive_rel_tol : float
            Absolute and relative tolerances used alongside ``adaptive_tol``.
        adaptive_L_candidates : list or None
            Explicit sequence of ``L`` values to try; overrides the automatic
            doubling schedule.
        adaptive_max_iter : int
            Maximum number of adaptive refinement iterations.
        adaptive_verbose : bool
            Print convergence information at each adaptive step.
        time_grid : {"uniform", "graded", "symmetric_graded"}
            Time-node distribution; see :meth:`expansion_state`.
        grid_power : float or None
            Grading exponent; ``None`` auto-selects.

        Returns
        -------
        np.ndarray
            Option prices (or implied vols) of shape ``(N_K,)`` for scalar H,
            or ``(N_K, N_H)`` when H is an array.
        """
        _pricing_kw = dict(
            K=K, maturity=maturity, S_0=S_0, call=call, digital=digital,
            implied_vol=implied_vol, payoff_selection=payoff_selection,
            R=R, L=L, panels=panels, m_cheb=m_cheb, q_weight=q_weight,
            time_steps_phi0=time_steps_phi0, expansion_order=expansion_order,
            time_steps=time_steps, H=H,
            time_grid=time_grid, grid_power=grid_power,
        )
        if integration == "panel":
            result, *_ = self._eur_call_put_measure_quad_fixed_panel(**_pricing_kw)
            return result
        if integration == "adaptive_panel":
            return self._eur_call_put_measure_quad_adaptive_panel(
                adaptive_metric=adaptive_metric,
                adaptive_tol=adaptive_tol,
                adaptive_abs_tol=adaptive_abs_tol,
                adaptive_rel_tol=adaptive_rel_tol,
                adaptive_L_candidates=adaptive_L_candidates,
                adaptive_max_iter=adaptive_max_iter,
                adaptive_verbose=adaptive_verbose,
                **_pricing_kw,
            )
        raise ValueError(f"integration must be 'panel' or 'adaptive_panel', got {integration!r}")

    def _eur_call_put_measure_quad_fixed_panel(
            self,
            # --- option ---
            K,
            maturity: float,
            S_0: float = 1.0,
            call: bool = True,
            digital: bool = False,
            implied_vol: bool = False,
            payoff_selection: str = "otm",
            # --- fourier ---
            R: float = 1.2,
            L: float | None = None,
            panels=None,
            m_cheb: int = 16,
            q_weight: int = 128,
            time_steps_phi0: int | None = None,
            # --- expansion ---
            expansion_order: int = 0,
            time_steps: int = 1000,
            H=None,
            # --- incremental cache (supplied by adaptive loop) ---
            _phi0_cache: dict | None = None,
            _log_hN_cache: dict | None = None,
            # --- time grid ---
            time_grid: Literal["uniform", "graded", "symmetric_graded"] = "uniform",
            grid_power: float | None = None,
    ) -> tuple:
        from .base_solution import (
            _as_strict_panels,
            _heuristic_measure_L, _heuristic_measure_panels,
        )
        from roughprix.fourier import (
            _iv_eur, build_panel_quadrature,
            measure_weights_from_phi, eur_call_put_from_weights,
            lewis_weights_from_phi, eur_call_from_lewis_weights,
        )

        # --- resolve expansion base params from stored model values ---
        anchor_eff = self.param.H
        base_eff = self.base_solution
        po_eff = self.pade_order
        rpd_eff = self.root_pade_degree
        rpso_eff = self.root_pade_series_order
        rptm_eff = self.root_pade_tail_match

        if time_steps_phi0 is None:
            time_steps_phi0 = time_steps

        # --- resolve H ---
        scalar_H = H is None or np.ndim(H) == 0
        if H is None:
            H_arr = np.array([self.param.H])
        else:
            H_arr = np.atleast_1d(np.asarray(H, dtype=float))

        lewis_mode = (not digital) and np.isclose(R, 0.5)
        if digital and np.isclose(R, 0.5):
            raise ValueError("Lewis contour (R=0.5) is not supported for digital options.")

        K = np.asarray(K, dtype=float).reshape(-1)
        D = np.exp(-self.riskfree * maturity)
        F = S_0 / D

        kmax = None
        if panels is None:
            if L is None:
                kmax = float(np.max(np.abs(np.log(K / F))))
                L = _heuristic_measure_L(maturity, kmax)
            panels_resolved = _heuristic_measure_panels(L)
        else:
            panels_resolved = _as_strict_panels(panels, L=L)
            L = float(panels_resolved[-1])

        if lewis_mode:
            # Lewis always prices all strikes on a single contour as calls.
            call_mask = np.ones(len(K), dtype=bool)
            put_mask = np.zeros(len(K), dtype=bool)
            masks = [(call_mask, True)]
        elif payoff_selection == "as_requested":
            call_mask = np.ones(len(K), dtype=bool)
            put_mask = np.zeros(len(K), dtype=bool)
            masks = [(call_mask, call)]
        elif payoff_selection == "otm":
            put_mask = K < F
            call_mask = ~put_mask
            masks = []
            if np.any(call_mask):
                masks.append((call_mask, True))
            if np.any(put_mask):
                masks.append((put_mask, False))
        else:
            raise ValueError("payoff_selection must be 'as_requested' or 'otm'")

        quad = build_panel_quadrature(panels_resolved, m_cheb, q_weight)

        # For multiple H: precompute H-independent fields per R-sign (or Lewis contour).
        _phi0_fields: dict = {}  # R_sub / "lewis" -> (ctx_q, f0_q)
        _hN_fields: dict = {}  # R_sub / "lewis" -> (ctx_n, f_list_n)
        if len(H_arr) > 1:
            if lewis_mode:
                ctx_q, f_list_q = self._build_h_independent_fields(
                    quad.u_quad - 0.5j, maturity, time_steps_phi0, 0,
                    anchor_eff, base_eff, po_eff, rpd_eff, rpso_eff, rptm_eff,
                    time_grid=time_grid, grid_power=grid_power,
                    direct_riccati_solver=self.direct_riccati_solver,
                )
                _phi0_fields["lewis"] = (ctx_q, f_list_q)
                ctx_n, f_list_n = self._build_h_independent_fields(
                    quad.u_nodes - 0.5j, maturity, time_steps, expansion_order,
                    anchor_eff, base_eff, po_eff, rpd_eff, rpso_eff, rptm_eff,
                    time_grid=time_grid, grid_power=grid_power,
                    direct_riccati_solver=self.direct_riccati_solver,
                )
                _hN_fields["lewis"] = (ctx_n, f_list_n)
            else:
                for mask, subset_call in masks:
                    R_sub = abs(R) if subset_call else -abs(R)
                    if R_sub not in _phi0_fields:
                        arg_q = -1j * (R_sub - 1j * quad.u_quad)
                        ctx_q, f_list_q = self._build_h_independent_fields(
                            arg_q, maturity, time_steps_phi0, 0,
                            anchor_eff, base_eff, po_eff, rpd_eff, rpso_eff, rptm_eff,
                            time_grid=time_grid, grid_power=grid_power,
                            direct_riccati_solver=self.direct_riccati_solver,
                        )
                        _phi0_fields[R_sub] = (ctx_q, f_list_q)
                    if R_sub not in _hN_fields:
                        arg_n = -1j * (R_sub - 1j * quad.u_nodes)
                        ctx_n, f_list_n = self._build_h_independent_fields(
                            arg_n, maturity, time_steps, expansion_order,
                            anchor_eff, base_eff, po_eff, rpd_eff, rpso_eff, rptm_eff,
                            time_grid=time_grid, grid_power=grid_power,
                            direct_riccati_solver=self.direct_riccati_solver,
                        )
                        _hN_fields[R_sub] = (ctx_n, f_list_n)

        # ----------------------------------------------------------------
        # Evaluate for each H value
        # ----------------------------------------------------------------
        all_prices = []
        all_raw_otm_prices = []

        for H_i in H_arr:
            H_i = float(H_i)
            otm_prices_i = np.zeros(len(K))
            otm_is_call_i = np.full(len(K), call)

            if len(H_arr) <= 1:
                if lewis_mode:
                    # Lewis: single contour arg = u - 0.5j, keyed as "lewis".
                    _lewis_key = (H_i, "lewis")
                    if _phi0_cache is not None and _lewis_key in _phi0_cache:
                        phi0_lewis = _phi0_cache[_lewis_key]
                    else:
                        state_q = self.expansion_state(
                            quad.u_quad - 0.5j, maturity=maturity, order=0,
                            time_steps=time_steps_phi0, H=H_i,
                            time_grid=time_grid, grid_power=grid_power,
                        )
                        phi0_lewis = jnp.exp(jnp.asarray(
                            self.log_charfun_from_field(state_q, state_q.f0),
                            dtype=jnp.complex128,
                        ))

                    if expansion_order == 0:
                        log_hN_lewis = np.zeros(len(quad.u_nodes))
                    elif _log_hN_cache is not None and _lewis_key in _log_hN_cache:
                        log_hN_lewis = _log_hN_cache[_lewis_key]
                    else:
                        state_n = self.expansion_state(
                            quad.u_nodes - 0.5j, maturity=maturity, order=expansion_order,
                            time_steps=time_steps, H=H_i,
                            time_grid=time_grid, grid_power=grid_power,
                        )
                        log_hN_lewis = np.asarray(
                            self.log_charfun_from_field(state_n, state_n.expansion)
                            - self.log_charfun_from_field(state_n, state_n.f0)
                        )
                else:
                    # --------------------------------------------------------
                    # Scalar H: pre-compute phi0 and log_hN for all R_subs
                    # in batched expansion_state calls.
                    #
                    # Optimisations:
                    #   • order=0  → hN=1 exactly; skip all hN evaluation.
                    #   • All R_subs batched into one expansion_state for phi0.
                    #   • order>0  → all R_subs batched into one expansion_state
                    #                for hN (separate call, different order).
                    # --------------------------------------------------------
                    all_R_subs = list(dict.fromkeys(
                        abs(R) if sc else -abs(R) for _, sc in masks
                    ))
                    phi0_per_R: dict = {}
                    log_hN_per_R: dict = {}

                    R_need_phi0: list = []
                    R_need_hN: list = []
                    for R_sub in all_R_subs:
                        key = (H_i, R_sub)
                        if _phi0_cache is not None and key in _phi0_cache:
                            phi0_per_R[R_sub] = _phi0_cache[key]
                        else:
                            R_need_phi0.append(R_sub)
                        if expansion_order == 0:
                            log_hN_per_R[R_sub] = np.zeros(len(quad.u_nodes))
                        elif _log_hN_cache is not None and key in _log_hN_cache:
                            log_hN_per_R[R_sub] = _log_hN_cache[key]
                        else:
                            R_need_hN.append(R_sub)

                    # Batched phi0 at u_quad for all R_subs that need it
                    if R_need_phi0:
                        n_q = len(quad.u_quad)
                        arg_b = np.concatenate(
                            [-1j * (Rs - 1j * quad.u_quad) for Rs in R_need_phi0]
                        )
                        state_b = self.expansion_state(
                            arg_b, maturity=maturity, order=0,
                            time_steps=time_steps_phi0, H=H_i,
                            time_grid=time_grid, grid_power=grid_power,
                        )
                        lp0 = np.asarray(self.log_charfun_from_field(state_b, state_b.f0))
                        for i_r, R_sub in enumerate(R_need_phi0):
                            phi0_per_R[R_sub] = jnp.exp(jnp.asarray(
                                lp0[i_r * n_q:(i_r + 1) * n_q], dtype=jnp.complex128,
                            ))

                    # Batched log_hN at u_nodes for all R_subs that need it (order>0)
                    if R_need_hN:
                        n_n = len(quad.u_nodes)
                        arg_b = np.concatenate(
                            [-1j * (Rs - 1j * quad.u_nodes) for Rs in R_need_hN]
                        )
                        state_b = self.expansion_state(
                            arg_b, maturity=maturity, order=expansion_order,
                            time_steps=time_steps, H=H_i,
                            time_grid=time_grid, grid_power=grid_power,
                        )
                        lp0 = np.asarray(self.log_charfun_from_field(state_b, state_b.f0))
                        lpN = np.asarray(self.log_charfun_from_field(state_b, state_b.expansion))
                        for i_r, R_sub in enumerate(R_need_hN):
                            log_hN_per_R[R_sub] = np.asarray(
                                lpN[i_r * n_n:(i_r + 1) * n_n]
                                - lp0[i_r * n_n:(i_r + 1) * n_n]
                            )

            # ---- Per-mask computation -----------------------------------
            _hN_cache_i: dict = {}  # used only by the multi-H path

            for mask, subset_call in masks:
                K_sub = K[mask]

                if lewis_mode:
                    # --- Lewis: single contour, all strikes as calls ---
                    if len(H_arr) > 1:
                        ctx_q, f_list_q = _phi0_fields["lewis"]
                        kappa_q_ref = self._compute_kappa_path_reflected(ctx_q.grid, H_i)
                        log_phi0 = self._log_charfun_raw(ctx_q, f_list_q[0], kappa_q_ref)
                        phi0_sub = jnp.exp(jnp.asarray(log_phi0, dtype=jnp.complex128))
                    else:
                        phi0_sub = phi0_lewis

                    w_jnp = lewis_weights_from_phi(phi0_sub, quad, K_sub, S_0)

                    if len(H_arr) > 1:
                        cache_key = ("lewis", quad.u_nodes.tobytes())
                        if cache_key not in _hN_cache_i:
                            ctx_n, f_list_n = _hN_fields["lewis"]
                            kappa_n_ref = self._compute_kappa_path_reflected(ctx_n.grid, H_i)
                            exp_n = self._compute_expansion_for_H(f_list_n, anchor_eff, H_i)
                            log_phiN_n = self._log_charfun_raw(ctx_n, exp_n, kappa_n_ref)
                            log_phi0_n = self._log_charfun_raw(ctx_n, f_list_n[0], kappa_n_ref)
                            log_hN_sub = np.asarray(log_phiN_n - log_phi0_n)
                            hN_sub = np.exp(log_hN_sub)
                            _hN_cache_i[cache_key] = (log_hN_sub, hN_sub)
                        else:
                            log_hN_sub, hN_sub = _hN_cache_i[cache_key]
                    else:
                        log_hN_sub = log_hN_lewis
                        hN_sub = np.exp(log_hN_lewis)

                    sub_prices = np.asarray(
                        eur_call_from_lewis_weights(w_jnp, jnp.asarray(hN_sub), S_0, K_sub, D)
                    )
                    otm_prices_i[mask] = sub_prices
                    otm_is_call_i[mask] = True

                else:
                    R_sub = abs(R) if subset_call else -abs(R)

                    # --- phi0 ---
                    if len(H_arr) > 1:
                        ctx_q, f_list_q = _phi0_fields[R_sub]
                        kappa_q_ref = self._compute_kappa_path_reflected(ctx_q.grid, H_i)
                        log_phi0 = self._log_charfun_raw(ctx_q, f_list_q[0], kappa_q_ref)
                        phi0_sub = jnp.exp(jnp.asarray(log_phi0, dtype=jnp.complex128))
                    else:
                        phi0_sub = phi0_per_R[R_sub]

                    w_jnp = measure_weights_from_phi(
                        phi0_sub, quad, K_sub, R_sub, call=subset_call, digital=digital,
                    )

                    # --- log_hN ---
                    if len(H_arr) > 1:
                        cache_key = (float(R_sub), quad.u_nodes.tobytes())
                        if cache_key not in _hN_cache_i:
                            ctx_n, f_list_n = _hN_fields[R_sub]
                            kappa_n_ref = self._compute_kappa_path_reflected(ctx_n.grid, H_i)
                            exp_n = self._compute_expansion_for_H(f_list_n, anchor_eff, H_i)
                            log_phiN_n = self._log_charfun_raw(ctx_n, exp_n, kappa_n_ref)
                            log_phi0_n = self._log_charfun_raw(ctx_n, f_list_n[0], kappa_n_ref)
                            log_hN_sub = np.asarray(log_phiN_n - log_phi0_n)
                            hN_sub = np.exp(log_hN_sub)
                            _hN_cache_i[cache_key] = (log_hN_sub, hN_sub)
                        else:
                            log_hN_sub, hN_sub = _hN_cache_i[cache_key]
                    else:
                        log_hN_sub = log_hN_per_R[R_sub]
                        hN_sub = np.exp(log_hN_sub)

                    sub_prices = np.asarray(
                        eur_call_put_from_weights(w_jnp, jnp.asarray(hN_sub), D)
                    )
                    otm_prices_i[mask] = sub_prices
                    otm_is_call_i[mask] = subset_call

            # capture raw OTM prices before parity correction and IV inversion
            all_raw_otm_prices.append(otm_prices_i.copy())

            if lewis_mode and payoff_selection == "as_requested" and not call:
                # Lewis always prices calls; convert to puts via parity when user wants puts.
                prices_i = otm_prices_i - S_0 + K * D
            elif payoff_selection == "as_requested":
                prices_i = otm_prices_i
            else:
                prices_i = np.empty_like(K)
                if call:
                    prices_i[call_mask] = otm_prices_i[call_mask]
                    prices_i[put_mask] = otm_prices_i[put_mask] + S_0 - K[put_mask] * D
                else:
                    prices_i[put_mask] = otm_prices_i[put_mask]
                    prices_i[call_mask] = otm_prices_i[call_mask] - S_0 + K[call_mask] * D

            if implied_vol:
                if payoff_selection == "as_requested":
                    payoff = "call" if call else "put"
                    result_i = _iv_eur(S_0=S_0, K=K, T=maturity,
                                       price=prices_i, payoff=payoff, r=self.riskfree)
                else:
                    ivs_i = np.empty_like(K)
                    if np.any(call_mask):
                        ivs_i[call_mask] = _iv_eur(
                            S_0=S_0, K=K[call_mask], T=maturity,
                            price=otm_prices_i[call_mask], payoff="call", r=self.riskfree,
                        )
                    if np.any(put_mask):
                        ivs_i[put_mask] = _iv_eur(
                            S_0=S_0, K=K[put_mask], T=maturity,
                            price=otm_prices_i[put_mask], payoff="put", r=self.riskfree,
                        )
                    result_i = ivs_i
            else:
                result_i = prices_i

            all_prices.append(result_i)

        # ----------------------------------------------------------------
        # Assemble output
        # ----------------------------------------------------------------
        raw_otm_prices = all_raw_otm_prices[0] if scalar_H else np.stack(all_raw_otm_prices, axis=-1)
        result = all_prices[0] if scalar_H else np.stack(all_prices, axis=-1)
        return result, raw_otm_prices, call_mask, put_mask

    def _eur_call_put_measure_quad_adaptive_panel(
            self,
            # --- adaptive params only; all pricing params arrive via **pricing_kw ---
            adaptive_metric: Literal["price", "iv"] = "iv",
            adaptive_tol: float = 1e-4,
            adaptive_abs_tol: float = 1e-8,
            adaptive_rel_tol: float = 1e-6,
            adaptive_L_candidates: list | None = None,
            adaptive_max_iter: int = 8,
            adaptive_verbose: bool = False,
            **pricing_kw,
    ) -> np.ndarray:
        from .base_solution import (
            _heuristic_measure_panels,
            _nested_measure_L_candidates, _validate_nested_measure_L_candidates,
        )
        from roughprix.fourier import (
            build_panel_quadrature, adaptive_check_values, adaptive_converged,
        )

        # Extract what the adaptive loop needs from pricing_kw.
        K = pricing_kw["K"]
        maturity = pricing_kw["maturity"]
        S_0 = pricing_kw.get("S_0", 1.0)
        call = pricing_kw.get("call", True)
        digital = pricing_kw.get("digital", False)
        payoff_selection = pricing_kw.get("payoff_selection", "otm")
        R = pricing_kw.get("R", 1.2)
        implied_vol = pricing_kw.get("implied_vol", False)
        expansion_order = pricing_kw.get("expansion_order", 0)
        time_steps = pricing_kw.get("time_steps", 1000)
        time_steps_phi0 = pricing_kw.get("time_steps_phi0")
        time_grid = pricing_kw.get("time_grid", "uniform")
        grid_power = pricing_kw.get("grid_power")
        H = pricing_kw.get("H")

        if pricing_kw.get("panels") is not None:
            raise ValueError(
                "adaptive_panel expects panels=None; explicit panels imply a fixed grid. "
                "Use integration='panel' to pass explicit panels."
            )

        K_arr = np.asarray(K, dtype=float).reshape(-1)
        D = np.exp(-self.riskfree * maturity)
        F = S_0 / D

        scalar_H = H is None or np.ndim(H) == 0
        H_arr_eff = np.array([self.param.H]) if H is None else np.atleast_1d(np.asarray(H, dtype=float))
        # Incremental caching only applies to the scalar-H path; multi-H uses
        # _build_h_independent_fields which can't be split across panels.
        use_incremental_cache = len(H_arr_eff) <= 1

        m_cheb = pricing_kw.get("m_cheb", 16)
        q_weight = pricing_kw.get("q_weight", 128)
        ts_phi0_eff = time_steps if time_steps_phi0 is None else time_steps_phi0

        lewis_mode = (not digital) and np.isclose(R, 0.5)
        if digital and np.isclose(R, 0.5):
            raise ValueError("Lewis contour (R=0.5) is not supported for digital options.")

        # Pre-determine which contours will be used (mirrors mask logic in fixed-panel helper).
        if lewis_mode:
            R_subs = ["lewis"]
        elif payoff_selection == "as_requested":
            R_subs = [abs(R) if call else -abs(R)]
        else:
            R_subs = []
            if np.any(K_arr >= F):
                R_subs.append(abs(R))
            if np.any(K_arr < F):
                R_subs.append(-abs(R))

        # Build L candidates — must be exact _MEASURE_PANEL_TEMPLATE endpoints to ensure
        # consecutive grids are nested (prefix property required by incremental cache).
        if adaptive_L_candidates is None:
            kmax = float(np.max(np.abs(np.log(K_arr / F))))
            adaptive_L_candidates_used = _nested_measure_L_candidates(maturity, kmax)
        else:
            adaptive_L_candidates_used = _validate_nested_measure_L_candidates(
                adaptive_L_candidates
            )

        L_seq = adaptive_L_candidates_used[:adaptive_max_iter]

        # Incremental log-value cache: (H_i, R_sub) → concatenated log arrays
        _phi0_log_cache: dict = {}
        _log_hN_log_cache: dict = {}
        prev_n_quad = 0
        prev_n_nodes = 0
        prev_quad = None

        prev_check = None
        last_result = None

        for i, L_try in enumerate(L_seq):
            phi0_cache_iter: dict | None = None
            log_hN_cache_iter: dict | None = None

            if use_incremental_cache:
                panels_try = _heuristic_measure_panels(float(L_try))
                quad_try = build_panel_quadrature(panels_try, m_cheb, q_weight)

                if prev_quad is not None and not (
                        np.allclose(prev_quad.u_quad, quad_try.u_quad[:len(prev_quad.u_quad)])
                        and np.allclose(prev_quad.u_nodes, quad_try.u_nodes[:len(prev_quad.u_nodes)])
                ):
                    raise RuntimeError(
                        "Internal adaptive_panel cache error: quadrature grid is not nested. "
                        "Use nested L candidates or disable incremental caching."
                    )
                prev_quad = quad_try

                u_quad_new = quad_try.u_quad[prev_n_quad:]
                u_nodes_new = quad_try.u_nodes[prev_n_nodes:]

                phi0_cache_iter = {}
                log_hN_cache_iter = {}

                for H_i in H_arr_eff:
                    H_i = float(H_i)
                    for R_sub in R_subs:
                        key = (H_i, R_sub)  # R_sub is "lewis" or a float

                        # --- phi0 at new quadrature points ---
                        if len(u_quad_new) > 0:
                            if lewis_mode:
                                arg_new = u_quad_new - 0.5j
                            else:
                                arg_new = -1j * (R_sub - 1j * u_quad_new)
                            state_new = self.expansion_state(
                                arg_new, maturity=maturity, order=0,
                                time_steps=ts_phi0_eff, H=H_i,
                                time_grid=time_grid, grid_power=grid_power,
                            )
                            log_phi0_new = np.asarray(
                                self.log_charfun_from_field(state_new, state_new.f0)
                            )
                            if key in _phi0_log_cache:
                                log_phi0_full = np.concatenate([_phi0_log_cache[key], log_phi0_new])
                            else:
                                log_phi0_full = log_phi0_new
                            _phi0_log_cache[key] = log_phi0_full
                            phi0_cache_iter[key] = jnp.exp(
                                jnp.asarray(log_phi0_full, dtype=jnp.complex128)
                            )

                        # --- log_hN at new Chebyshev nodes (order=0 → hN=1, skip) ---
                        if expansion_order > 0 and len(u_nodes_new) > 0:
                            if lewis_mode:
                                arg_n_new = u_nodes_new - 0.5j
                            else:
                                arg_n_new = -1j * (R_sub - 1j * u_nodes_new)
                            state_n_new = self.expansion_state(
                                arg_n_new, maturity=maturity,
                                order=expansion_order, time_steps=time_steps,
                                H=H_i, time_grid=time_grid, grid_power=grid_power,
                            )
                            log_hN_new = np.asarray(
                                self.log_charfun_from_field(state_n_new, state_n_new.expansion)
                                - self.log_charfun_from_field(state_n_new, state_n_new.f0)
                            )
                            if key in _log_hN_log_cache:
                                log_hN_full = np.concatenate([_log_hN_log_cache[key], log_hN_new])
                            else:
                                log_hN_full = log_hN_new
                            _log_hN_log_cache[key] = log_hN_full
                            log_hN_cache_iter[key] = log_hN_full

                prev_n_quad = len(quad_try.u_quad)
                prev_n_nodes = len(quad_try.u_nodes)

            result_try, raw_otm_try, call_mask_try, put_mask_try = (
                self._eur_call_put_measure_quad_fixed_panel(
                    L=float(L_try),
                    _phi0_cache=phi0_cache_iter,
                    _log_hN_cache=log_hN_cache_iter,
                    **{k: v for k, v in pricing_kw.items() if k not in ("panels", "L")},
                )
            )
            check = adaptive_check_values(
                result_try, raw_otm_try, call_mask_try, put_mask_try,
                implied_vol, adaptive_metric, K_arr, maturity, S_0,
                r=self.riskfree, scalar_H=scalar_H,
            )

            if prev_check is not None:
                if adaptive_verbose:
                    err = float(np.max(np.abs(check - prev_check)))
                    print(f"[adaptive_panel] iter={i}, L={L_try}, err={err:.3e}")

                if adaptive_converged(
                    prev_check, check, adaptive_metric,
                    adaptive_tol, adaptive_abs_tol, adaptive_rel_tol,
                ):
                    return result_try
            else:
                if adaptive_verbose:
                    print(f"[adaptive_panel] iter={i}, L={L_try} (first)")

            prev_check = check
            last_result = result_try

        return last_result
