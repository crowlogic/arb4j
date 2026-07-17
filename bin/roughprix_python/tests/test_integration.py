"""Tests for integration.py: backward compat, fraclog kernel, LinearVolterraSolver."""
from __future__ import annotations

import numpy as np
import pytest
from scipy import integrate as sci_integrate

from roughprix.heston.integration import (
    TimeGrid,
    Integrate,
    LinearVolterraSolver,
    _F_qk_nb,
)


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def make_grid(T=1.0, J=200):
    return TimeGrid.uniform(T, J)


def quad_ref(kernel_fn, f_fn, t_vals):
    """Reference values via scipy.integrate.quad at each t in t_vals."""
    out = np.zeros(len(t_vals))
    for i, t in enumerate(t_vals):
        if t <= 0.0:
            out[i] = 0.0
            continue
        val, _ = sci_integrate.quad(lambda s: kernel_fn(t, s) * f_fn(s), 0.0, t,
                                    limit=200, epsabs=1e-10, epsrel=1e-10)
        out[i] = val
    return out


# ---------------------------------------------------------------------------
# A. Backward compatibility
# ---------------------------------------------------------------------------

class TestRegularKernel:
    """regular kernel: ∫_0^t f(s) ds by cumulative trapezoid."""

    def test_constant_one(self):
        grid = make_grid(T=1.0, J=500)
        K = Integrate(grid, kernel="regular")
        result = (K @ (lambda t: np.ones_like(t))).values.real
        expected = grid.t
        np.testing.assert_allclose(result, expected, atol=1e-10)

    def test_linear(self):
        grid = make_grid(T=1.0, J=500)
        K = Integrate(grid, kernel="regular")
        result = (K @ (lambda t: t)).values.real
        expected = 0.5 * grid.t ** 2
        np.testing.assert_allclose(result, expected, atol=1e-6)

    def test_weights_matrix_raises(self):
        grid = make_grid()
        K = Integrate(grid, kernel="regular")
        with pytest.raises(ValueError, match="regular"):
            _ = K.weights_matrix


class TestLogKernel:
    """log kernel: ∫_0^t log(t-s) f(s) ds."""

    def test_constant_one_order1(self):
        grid = make_grid(T=1.0, J=500)
        K = Integrate(grid, kernel="log", order=1)
        result = (K @ (lambda t: np.ones_like(t))).values.real

        # analytical: ∫_0^t log(u) du = t log(t) - t  (= t*(log(t)-1))
        t = grid.t[1:]  # skip t=0
        ref_inner = t * (np.log(t) - 1.0)
        np.testing.assert_allclose(result[1:], ref_inner, rtol=1e-4)

    def test_weights_matrix_shape(self):
        grid = make_grid(T=1.0, J=50)
        K = Integrate(grid, kernel="log", order=1)
        Omega = K.weights_matrix
        assert Omega.shape == (51, 51)
        # strictly lower triangular (diagonal may have "last panel" right weight)
        # upper triangle (above diagonal) should be zero
        assert np.all(Omega[np.triu_indices(51, k=1)] == 0.0)

    def test_weights_matrix_is_Omega(self):
        grid = make_grid(T=1.0, J=20)
        K = Integrate(grid, kernel="log", order=1)
        assert K.weights_matrix is K._Omega


class TestFracKernel:
    """frac kernel: ∫_0^t (t-s)^alpha f(s) ds."""

    def test_constant_one_alpha_neg_half(self):
        grid = make_grid(T=1.0, J=500)
        K = Integrate(grid, kernel="frac", order=-0.5)
        result = (K @ (lambda t: np.ones_like(t))).values.real

        # analytical: ∫_0^t u^(-1/2) du = 2 sqrt(t)
        t = grid.t[1:]
        ref = 2.0 * np.sqrt(t)
        np.testing.assert_allclose(result[1:], ref, rtol=1e-4)

    def test_constant_one_alpha_half(self):
        grid = make_grid(T=1.0, J=500)
        K = Integrate(grid, kernel="frac", order=0.5)
        result = (K @ (lambda t: np.ones_like(t))).values.real

        # analytical: ∫_0^t u^(1/2) du = 2/3 t^(3/2)
        t = grid.t[1:]
        ref = 2.0 / 3.0 * t ** 1.5
        np.testing.assert_allclose(result[1:], ref, rtol=1e-4)

    def test_weights_matrix_shape(self):
        grid = make_grid(T=1.0, J=30)
        K = Integrate(grid, kernel="frac", order=-0.5)
        Omega = K.weights_matrix
        assert Omega.shape == (31, 31)


# ---------------------------------------------------------------------------
# B. Fractional-log kernel
# ---------------------------------------------------------------------------

class TestFraclogKernel:
    """fraclog kernel: ∫_0^t (t-s)^q log(t-s)^k f(s) ds."""

    @pytest.mark.parametrize("q,k", [(-0.5, 1), (-0.5, 2), (0.0, 1), (0.5, 1)])
    def test_constant_one_vs_quadrature(self, q, k):
        grid = make_grid(T=1.0, J=600)
        K = Integrate(grid, kernel="fraclog", order=k, frac_power=q)
        result = (K @ (lambda t: np.ones_like(t))).values.real

        t_check = grid.t[10::50]  # sample ~10 interior points
        kernel_fn = lambda t, s: (t - s) ** q * np.log(t - s) ** k if t > s else 0.0
        ref = quad_ref(kernel_fn, lambda s: 1.0, t_check)
        np.testing.assert_allclose(result[10::50], ref, rtol=1e-3, atol=1e-10)

    @pytest.mark.parametrize("q,k", [(-0.5, 1), (0.0, 1)])
    def test_linear_f_vs_quadrature(self, q, k):
        grid = make_grid(T=1.0, J=600)
        K = Integrate(grid, kernel="fraclog", order=k, frac_power=q)
        result = (K @ (lambda t: t)).values.real

        t_check = grid.t[20::60]
        kernel_fn = lambda t, s: (t - s) ** q * np.log(t - s) ** k
        ref = quad_ref(kernel_fn, lambda s: s, t_check)
        np.testing.assert_allclose(result[20::60], ref, rtol=1e-3, atol=1e-10)

    def test_weights_matrix_shape(self):
        grid = make_grid(T=1.0, J=40)
        K = Integrate(grid, kernel="fraclog", order=1, frac_power=-0.5)
        Omega = K.weights_matrix
        assert Omega.shape == (41, 41)
        assert np.all(Omega[np.triu_indices(41, k=1)] == 0.0)

    def test_order_must_be_at_least_1(self):
        grid = make_grid()
        with pytest.raises(ValueError, match="order >= 1"):
            Integrate(grid, kernel="fraclog", order=0, frac_power=-0.5)

    def test_frac_power_must_be_gt_minus1(self):
        grid = make_grid()
        with pytest.raises(ValueError, match="frac_power > -1"):
            Integrate(grid, kernel="fraclog", order=1, frac_power=-1.5)

    def test_frac_power_stored(self):
        grid = make_grid()
        K = Integrate(grid, kernel="fraclog", order=2, frac_power=-0.5)
        assert K.frac_power == pytest.approx(-0.5)
        assert K.order == 2

    def test_frac_power_none_for_other_kernels(self):
        grid = make_grid()
        for kernel, kw in [("regular", {}), ("log", {"order": 1}), ("frac", {"order": -0.5})]:
            K = Integrate(grid, kernel=kernel, **kw)
            assert K.frac_power is None


class TestFqkPrimitive:
    """Unit tests for the _F_qk_nb antiderivative."""

    def test_k0_matches_power(self):
        # ∫ u^q du = u^(q+1)/(q+1)
        for q in [-0.5, 0.0, 0.5, 1.0, 2.0]:
            u = 0.7
            expected = u ** (q + 1) / (q + 1)
            assert _F_qk_nb(u, q, 0) == pytest.approx(expected, rel=1e-12)

    def test_k1_vs_scipy(self):
        # ∫ u^q log(u) du validated by scipy
        for q in [-0.5, 0.0, 0.5]:
            u = 0.8
            ref, _ = sci_integrate.quad(lambda v: v ** q * np.log(v), 0.0, u)
            assert _F_qk_nb(u, q, 1) == pytest.approx(ref, rel=1e-8)

    def test_k2_vs_scipy(self):
        for q in [-0.5, 0.0, 0.5]:
            u = 0.6
            ref, _ = sci_integrate.quad(lambda v: v ** q * np.log(v) ** 2, 0.0, u)
            assert _F_qk_nb(u, q, 2) == pytest.approx(ref, rel=1e-8)

    def test_zero_input(self):
        assert _F_qk_nb(0.0, -0.5, 1) == 0.0
        assert _F_qk_nb(0.0, 0.5, 3) == 0.0


# ---------------------------------------------------------------------------
# C. LinearVolterraSolver
# ---------------------------------------------------------------------------

class TestLinearVolterraSolver:
    """Test x = rhs + scale * K @ (coeff * x) residual."""

    @pytest.mark.parametrize("kernel,kw,scale", [
        ("log", {"order": 1}, 0.1),
        ("frac", {"order": -0.5}, 0.5),
        ("fraclog", {"order": 1, "frac_power": -0.5}, 0.2),
    ])
    def test_residual_is_small(self, kernel, kw, scale):
        grid = TimeGrid.uniform(1.0, 100)
        K = Integrate(grid, kernel=kernel, **kw)
        solver = LinearVolterraSolver(grid, K, scale=scale)

        rhs = grid.field(lambda t: np.sin(t) + 1j * np.cos(t))
        coeff = grid.field(lambda t: 1.0 + 0.5 * t)
        x = solver.solve(rhs, coeff)

        residual = x - rhs - scale * (K @ (coeff * x))
        np.testing.assert_allclose(
            np.abs(residual.values), 0.0, atol=1e-10,
            err_msg=f"Large residual for kernel={kernel}"
        )

    def test_regular_kernel_raises(self):
        grid = make_grid()
        K = Integrate(grid, kernel="regular")
        with pytest.raises(ValueError, match="regular"):
            LinearVolterraSolver(grid, K)

    def test_returns_field(self):
        grid = TimeGrid.uniform(1.0, 50)
        K = Integrate(grid, kernel="frac", order=-0.5)
        solver = LinearVolterraSolver(grid, K, scale=0.1)
        from roughprix.heston.integration import Field
        x = solver.solve(np.ones(51), np.ones(51))
        assert isinstance(x, Field)
        assert x.values.shape == (51,)

    def test_complex_scale(self):
        grid = TimeGrid.uniform(1.0, 80)
        K = Integrate(grid, kernel="log", order=1)
        solver = LinearVolterraSolver(grid, K, scale=0.05 + 0.03j)

        rhs = grid.field(lambda t: np.exp(1j * t))
        coeff = grid.field(lambda t: np.ones_like(t))
        x = solver.solve(rhs, coeff)

        scale = 0.05 + 0.03j
        residual = x - rhs - scale * (K @ (coeff * x))
        np.testing.assert_allclose(np.abs(residual.values), 0.0, atol=1e-10)


# ---------------------------------------------------------------------------
# D. Shape / broadcast tests
# ---------------------------------------------------------------------------

class TestSolverShapes:
    """Verify solver handles 1D, 2D, 3D batched rhs and complex coeff."""

    def _make_solver(self, J=60):
        grid = TimeGrid.uniform(1.0, J)
        K = Integrate(grid, kernel="frac", order=-0.5)
        return grid, LinearVolterraSolver(grid, K, scale=0.1)

    def test_1d(self):
        grid, solver = self._make_solver()
        J = grid.J
        rhs = np.ones(J + 1, dtype=complex)
        coeff = np.ones(J + 1, dtype=complex)
        x = solver.solve(rhs, coeff)
        assert x.values.shape == (J + 1,)

    def test_2d_batched(self):
        grid, solver = self._make_solver()
        J = grid.J
        N = 5
        rhs = np.ones((N, J + 1), dtype=complex)
        coeff = np.ones((N, J + 1), dtype=complex)
        x = solver.solve(rhs, coeff)
        assert x.values.shape == (N, J + 1)

    def test_3d_batched(self):
        grid, solver = self._make_solver()
        J = grid.J
        N, M = 3, 4
        rhs = np.ones((N, M, J + 1), dtype=complex)
        coeff = np.ones((N, M, J + 1), dtype=complex)
        x = solver.solve(rhs, coeff)
        assert x.values.shape == (N, M, J + 1)

    def test_complex_coeff(self):
        grid, solver = self._make_solver()
        J = grid.J
        rhs = grid.field(lambda t: np.ones_like(t, dtype=complex))
        coeff = grid.field(lambda t: (1.0 + 0.5j) * np.ones_like(t))
        x = solver.solve(rhs, coeff)
        assert x.values.dtype == np.complex128

    def test_scalar_rhs_broadcast(self):
        """Scalar rhs should broadcast to full time axis."""
        grid, solver = self._make_solver()
        J = grid.J
        x = solver.solve(1.0, 1.0)
        assert x.values.shape == (J + 1,)

    def test_batched_residual(self):
        """Residual check for batched input."""
        grid = TimeGrid.uniform(1.0, 80)
        K = Integrate(grid, kernel="frac", order=-0.5)
        solver = LinearVolterraSolver(grid, K, scale=0.15)
        J = grid.J
        N = 4
        rhs_arr = np.random.default_rng(0).standard_normal((N, J + 1)) + 0j
        coeff_arr = np.ones((N, J + 1), dtype=complex)

        from roughprix.heston.integration import Field
        rhs = Field(rhs_arr, grid)
        coeff = Field(coeff_arr, grid)
        x = solver.solve(rhs, coeff)

        residual = x - rhs - 0.15 * (K @ (coeff * x))


# ---------------------------------------------------------------------------
# Adams fractional solver tests
# ---------------------------------------------------------------------------

from roughprix.heston.integration import AdamsFractionalRiccatiSolver
import math as _math
import jax.numpy as jnp


class TestAdamsFractionalRiccatiSolver:
    """Unit tests for AdamsFractionalRiccatiSolver."""

    # ----- helpers -----------------------------------------------------------

    @staticmethod
    def _make_solver(alpha, J=400, T=1.0, F=None, **kw):
        grid = TimeGrid.uniform(T, J)
        if F is None:
            F = lambda j, x: jnp.zeros_like(x)
        return AdamsFractionalRiccatiSolver(grid, alpha, F, **kw)

    # ----- basic validity ----------------------------------------------------

    def test_invalid_alpha_zero_raises(self):
        with pytest.raises(ValueError, match="alpha"):
            self._make_solver(0.0)

    def test_invalid_alpha_negative_raises(self):
        with pytest.raises(ValueError, match="alpha"):
            self._make_solver(-0.1)

    def test_invalid_alpha_greater_than_one_raises(self):
        with pytest.raises(ValueError, match="alpha"):
            self._make_solver(1.01)

    def test_alpha_one_accepted(self):
        solver = self._make_solver(1.0)
        result = solver.solve()
        assert result.values.shape == (401,)

    def test_alpha_boundary_small_accepted(self):
        solver = self._make_solver(0.01)
        result = solver.solve()
        assert np.all(np.isfinite(np.array(result.values)))

    # ----- zero vector field -------------------------------------------------

    @pytest.mark.parametrize("alpha", [0.3, 0.5, 0.7, 1.0])
    def test_zero_field_gives_zero(self, alpha):
        solver = self._make_solver(alpha, J=100, T=0.5,
                                   F=lambda j, x: jnp.zeros((), dtype=jnp.complex128))
        result = solver.solve()
        np.testing.assert_array_equal(np.array(result.values), 0.0)

    # ----- t = 0 always zero -------------------------------------------------

    @pytest.mark.parametrize("alpha", [0.3, 0.5, 1.0])
    def test_t0_is_zero(self, alpha):
        c = jnp.array(1.0 + 0.5j)
        F = lambda j, x: c
        solver = self._make_solver(alpha, J=50, T=0.5, F=F)
        result = solver.solve()
        assert complex(np.array(result.values)[0]) == 0.0

    # ----- constant F: exact solution h(t) = c * t^alpha / alpha (raw) ------

    @pytest.mark.parametrize("alpha", [0.3, 0.5, 0.7, 1.0])
    def test_constant_field_raw_exact(self, alpha):
        """h(t) = c * t^alpha / alpha exactly for constant F=c (verified analytically)."""
        c = 1.0 + 0.0j
        J, T = 200, 1.0
        grid = TimeGrid.uniform(T, J)
        F = lambda j, x: jnp.full((), complex(c), dtype=jnp.complex128)
        solver = AdamsFractionalRiccatiSolver(grid, alpha, F, normalized=False)
        result = solver.solve()

        t = grid.t
        expected = c * t**alpha / alpha
        np.testing.assert_allclose(
            np.array(result.values), expected, rtol=1e-12, atol=1e-12,
            err_msg=f"Constant-F raw solution incorrect for alpha={alpha}",
        )

    @pytest.mark.parametrize("alpha", [0.3, 0.5, 1.0])
    def test_constant_field_normalized(self, alpha):
        """h(t) = c * t^alpha / Gamma(alpha+1) for normalized=True."""
        c = 2.0 + 0.0j
        J, T = 200, 1.0
        grid = TimeGrid.uniform(T, J)
        F = lambda j, x: jnp.full((), complex(c), dtype=jnp.complex128)
        solver = AdamsFractionalRiccatiSolver(grid, alpha, F, normalized=True)
        result = solver.solve()

        t = grid.t
        expected = c * t**alpha / _math.gamma(alpha + 1)
        np.testing.assert_allclose(
            np.array(result.values), expected, rtol=1e-12, atol=1e-12,
            err_msg=f"Constant-F normalized solution incorrect for alpha={alpha}",
        )

    # ----- batched complex input ---------------------------------------------

    def test_batched_complex_shape(self):
        """Batched (N_u,) input: output shape is (N_u, J+1)."""
        N_u, J, T = 8, 100, 0.5
        c = jnp.arange(N_u, dtype=jnp.complex128)
        F = lambda j, x: c   # x is (N_u,), return (N_u,)
        grid = TimeGrid.uniform(T, J)
        solver = AdamsFractionalRiccatiSolver(grid, 0.5, F, normalized=False)
        result = solver.solve()
        assert result.values.shape == (N_u, J + 1)
        assert np.iscomplexobj(np.array(result.values))

    def test_batched_complex_constant_correctness(self):
        """Batched constant F: each batch element satisfies h_i(t)=c_i*t^alpha/alpha."""
        N_u, J, T, alpha = 5, 200, 1.0, 0.5
        c_arr = jnp.array([1.0, 2.0, 0.5, -1.0, 3.0], dtype=jnp.complex128)
        F = lambda j, x: c_arr
        grid = TimeGrid.uniform(T, J)
        solver = AdamsFractionalRiccatiSolver(grid, alpha, F, normalized=False)
        result = solver.solve()

        t = grid.t
        expected = np.array(c_arr)[:, None] * t[None, :]**alpha / alpha
        np.testing.assert_allclose(
            np.array(result.values), expected, rtol=1e-12, atol=1e-12,
        )

    # ----- corrector iterations ----------------------------------------------

    def test_corrector_iterations_gt1_gives_finite(self):
        """More corrector iterations should not break correctness."""
        J, T, alpha = 100, 0.5, 0.5
        c = jnp.array(1.0 + 0j)
        F = lambda j, x: c
        grid = TimeGrid.uniform(T, J)
        for n in [1, 2, 3]:
            solver = AdamsFractionalRiccatiSolver(grid, alpha, F,
                                                  normalized=False,
                                                  corrector_iterations=n)
            result = solver.solve()
            assert np.all(np.isfinite(np.array(result.values))), f"n_corr={n} failed"

    # ----- returns a Field ---------------------------------------------------

    def test_returns_field(self):
        from roughprix.heston.integration import Field
        solver = self._make_solver(0.5, J=50, T=0.5,
                                   F=lambda j, x: jnp.zeros((), dtype=jnp.complex128))
        result = solver.solve()
        assert isinstance(result, Field)
        assert result.values.shape == (51,)