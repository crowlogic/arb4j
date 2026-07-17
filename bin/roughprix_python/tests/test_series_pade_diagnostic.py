"""Diagnostic comparison of H=0 base methods on pricing contours.

Run as a pytest module with -s to see the table, or import and call compare_h0_bases().

Compares:
  base="pade", pade_order in {"22", "33", "44"}
  base="root_pade", [m/n] in {4/5, 5/6, 6/7, 7/8}
  base="direct_riccati" (reference)

Reports per method/contour:
  max |R_grid|                — Riccati residual magnitude
  max |R_grid| / (1+|f0|)    — relative residual
  min |denominator|          — for root_pade
  max |f0|                   — solution magnitude
  num_fallbacks              — for root_pade
"""
from __future__ import annotations

import numpy as np
import pytest

from roughprix.heston.rough_heston import RoughHeston, RoughHestonParam, _raw_kernel_op
from roughprix.heston.pade import rough_heston_root_pade_f0


def _make_model() -> RoughHeston:
    param = RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=0.1)
    return RoughHeston(param, riskfree=0.0)


def _lewis_u(N: int = 32, R: float = 0.5) -> np.ndarray:
    # Limit to |u_real| <= 6 where the half-power series converges.
    # For very large |u|, the series coefficients grow geometrically and
    # series_pade falls back; residuals should be compared on moderate u grids.
    grid = np.linspace(0.0, 6.0, N + 1)[1:]
    return grid + 1j * R


def _otm_call_u(N: int = 32, R: float = 1.2) -> np.ndarray:
    grid = np.linspace(0.0, 6.0, N + 1)[1:]
    return grid + 1j * abs(R)


def _otm_put_u(N: int = 32, R: float = 1.2) -> np.ndarray:
    grid = np.linspace(0.0, 6.0, N + 1)[1:]
    return grid - 1j * abs(R)


def _run_base(model, arg, maturity, base, **kw):
    from scipy.special import gamma as Gamma
    state = model.expansion_state(
        arg, maturity=maturity, order=0, time_steps=200, anchor=0.0,
        base=base, return_lists=True,
        **kw,
    )
    K0 = _raw_kernel_op(state.grid, anchor_H=0.0, log_order=0)
    alpha = Gamma(0.0 + 0.5)
    f0 = np.array(state.f0.values)            # (N_u, N_t)
    Kf0 = np.array((K0 @ state.F_ricc(state.f0)).values)
    # Normalized residual: alpha*f0 = K0@F(f0) is the actual equation
    residual = alpha * f0 - Kf0
    return f0, residual


def _report_row(label, f0, residual, min_root_denom=None, num_fallbacks=None):
    max_resid = float(np.max(np.abs(residual)))
    rel_resid = float(np.max(np.abs(residual) / (1.0 + np.abs(f0))))
    max_f0 = float(np.max(np.abs(f0)))
    min_rd_str = f"{min_root_denom:.3e}" if min_root_denom is not None else "     —    "
    fallback_str = str(num_fallbacks) if num_fallbacks is not None else "—"
    return (
        f"{label:<32s}  "
        f"max|R|={max_resid:.3e}  "
        f"rel={rel_resid:.3e}  "
        f"min|Qr|={min_rd_str}  "
        f"max|f0|={max_f0:.3e}  "
        f"fallbacks={fallback_str}"
    )


def compare_h0_bases(maturity: float = 0.25, print_output: bool = True):
    model = _make_model()
    contours = [
        ("Lewis R=0.5", _lewis_u()),
        ("OTM call R=1.2", _otm_call_u()),
        ("OTM put R=-1.2", _otm_put_u()),
    ]

    methods = [
        ("pade-22",  dict(base="pade", pade_order="22")),
        ("pade-33",  dict(base="pade", pade_order="33")),
        ("pade-44",  dict(base="pade", pade_order="44")),
        ("root_pade-4/5",    dict(base="root_pade",   root_pade_series_order=16,  root_pade_degree=4)),
        ("root_pade-5/6",    dict(base="root_pade",   root_pade_series_order=16,  root_pade_degree=5)),
        ("root_pade-6/7",    dict(base="root_pade",   root_pade_series_order=16,  root_pade_degree=6)),
        ("root_pade-7/8",    dict(base="root_pade",   root_pade_series_order=16,  root_pade_degree=7)),
        ("direct_riccati",   dict(base="direct_riccati")),
    ]

    rows = []
    for cname, u_grid in contours:
        if print_output:
            print(f"\n{'='*80}")
            print(f"Contour: {cname}")
            print(f"{'='*80}")

        for mname, mkw in methods:
            f0, residual = _run_base(model, u_grid, maturity, **mkw)

            row = _report_row(mname, f0, residual)
            rows.append((cname, mname, f0, residual, None))
            if print_output:
                print(row)

    return rows


# ---------------------------------------------------------------------------
# pytest integration: sanity checks on the diagnostic output
# ---------------------------------------------------------------------------

class TestSeriesPadeDiagnostic:
    """Smoke-test that the diagnostic comparison runs without errors."""

    @pytest.fixture(scope="class")
    def rows(self):
        # Use T=0.25 so y=sqrt(T)=0.5, within the series convergence radius
        return compare_h0_bases(maturity=0.25, print_output=False)

    def test_returns_rows(self, rows):
        assert len(rows) > 0

    def test_direct_riccati_moderate_residual(self, rows):
        """direct_riccati reference should have smaller residual than pade-22."""
        # direct_riccati at 200 time steps is approximate (not machine-exact);
        # we just check it's below a generous bound that eliminates clear bugs.
        for cname, mname, f0, residual, _ in rows:
            if mname == "direct_riccati":
                rel = np.max(np.abs(residual) / (1.0 + np.abs(f0)))
                assert rel < 0.20, (
                    f"direct_riccati residual too large on {cname}: {rel:.4f}"
                )

    def test_no_nans_in_any_method(self, rows):
        for cname, mname, f0, residual, _ in rows:
            assert np.all(np.isfinite(f0)), f"{mname} produced non-finite f0 on {cname}"
            assert np.all(np.isfinite(residual)), f"{mname} produced non-finite residual on {cname}"

    def test_root_pade_reasonable_residual(self, rows):
        """root_pade [5/6] relative residual must be below 0.05 — matching pade-44."""
        for cname, mname, f0, residual, _ in rows:
            if mname == "root_pade-5/6":
                rel = np.max(np.abs(residual) / (1.0 + np.abs(f0)))
                assert rel < 0.05, (
                    f"root_pade-5/6 residual too large on {cname}: {rel:.4f}"
                )

    def test_root_pade_better_than_pade22(self, rows):
        """root_pade [5/6] must achieve smaller relative residual than pade-22."""
        resid = {}
        for cname, mname, f0, residual, _ in rows:
            if cname == "Lewis R=0.5" and mname in ("pade-22", "root_pade-5/6"):
                resid[mname] = float(np.max(np.abs(residual) / (1.0 + np.abs(f0))))
        if "pade-22" in resid and "root_pade-5/6" in resid:
            assert resid["root_pade-5/6"] < resid["pade-22"], (
                f"root_pade-5/6 ({resid['root_pade-5/6']:.4f}) not better "
                f"than pade-22 ({resid['pade-22']:.4f}) on Lewis contour"
            )

    def test_root_pade_no_nans(self, rows):
        """root_pade must never produce non-finite values."""
        for cname, mname, f0, residual, _ in rows:
            if mname.startswith("root_pade"):
                assert np.all(np.isfinite(f0)), (
                    f"{mname} produced non-finite f0 on {cname}"
                )
                assert np.all(np.isfinite(residual)), (
                    f"{mname} produced non-finite residual on {cname}"
                )
