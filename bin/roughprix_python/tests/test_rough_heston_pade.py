"""Tests for rough_heston_pade.py: h_pade22, h_pade33, h_pade44 and rough_heston_pade_f0."""
from __future__ import annotations

import numpy as np
import pytest

from roughprix.heston.pade import (
    h_pade22, h_pade33, h_pade44, rough_heston_pade_f0,
    rough_heston_root_pade_f0,
)
from roughprix.heston.rough_heston import RoughHestonParam


# ---------------------------------------------------------------------------
# Fixtures
# ---------------------------------------------------------------------------

@pytest.fixture
def default_param():
    return RoughHestonParam()  # lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=0.4


@pytest.fixture
def u_typical():
    return np.array([0.5 + 0.1j, 1.0 + 0.5j, 2.0 + 1.0j, 5.0 + 2.0j])


@pytest.fixture
def t_grid():
    return np.linspace(0.0, 2.0, 21)


@pytest.fixture
def rp_param():
    return RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=0.1)


@pytest.fixture
def rp_u():
    return np.array([0.5 + 0.1j, 1.0 - 0.3j, 3.0 + 0.5j])


@pytest.fixture
def rp_t():
    return np.linspace(0.0, 0.5, 11)


# ---------------------------------------------------------------------------
# A. h_pade22 direct
# ---------------------------------------------------------------------------

class TestHPade22Shape:
    def test_output_shape(self, u_typical, t_grid):
        result = h_pade22(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (len(u_typical), len(t_grid))

    def test_output_shape_single_u(self, t_grid):
        result = h_pade22(np.array([1.0 + 0.5j]), t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (1, len(t_grid))

    def test_output_shape_single_t(self, u_typical):
        result = h_pade22(u_typical, np.array([1.0]), H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (len(u_typical), 1)

    def test_output_shape_scalar_inputs(self):
        result = h_pade22(np.array([1.0 + 0.5j]), np.array([1.0]), H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (1, 1)


class TestHPade22Dtype:
    def test_output_is_complex(self, u_typical, t_grid):
        result = h_pade22(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert np.iscomplexobj(result)
        assert result.dtype == np.complex128


class TestHPade22AtZero:
    def test_zero_at_t_zero(self, u_typical):
        tau = np.array([0.0])
        result = h_pade22(u_typical, tau, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        np.testing.assert_array_equal(result[:, 0], 0.0 + 0.0j)

    def test_zero_at_t_zero_in_grid(self, u_typical, t_grid):
        result = h_pade22(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        # t_grid[0] == 0.0
        np.testing.assert_array_equal(result[:, 0], 0.0 + 0.0j)


class TestHPade22Finite:
    @pytest.mark.parametrize("u_val", [
        0.5 + 0.1j,
        1.0 + 0.5j,
        2.0 + 1.0j,
        5.0 + 2.0j,
        10.0 + 3.0j,
    ])
    def test_no_nan_or_inf(self, u_val, t_grid):
        result = h_pade22(np.array([u_val]), t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert np.all(np.isfinite(result)), f"Non-finite values for u={u_val}"

    def test_vectorized_multiple_u_and_t(self):
        u = np.array([0.5 + 0.2j, 1.5 + 0.8j, 3.0 + 1.5j])
        t = np.linspace(0.0, 1.0, 11)
        result = h_pade22(u, t, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (3, 11)
        assert np.all(np.isfinite(result))


class TestHPade22Parameters:
    @pytest.mark.parametrize("rho", [-0.9, -0.5, 0.0, 0.5])
    def test_various_rho(self, u_typical, t_grid, rho):
        result = h_pade22(u_typical, t_grid, H=0.0, rho=rho, nu=0.3, lam=0.3)
        assert result.shape == (len(u_typical), len(t_grid))
        assert np.all(np.isfinite(result))

    @pytest.mark.parametrize("nu", [0.1, 0.3, 0.5, 1.0])
    def test_various_nu(self, u_typical, t_grid, nu):
        result = h_pade22(u_typical, t_grid, H=0.0, rho=-0.7, nu=nu, lam=0.3)
        assert np.all(np.isfinite(result))

    @pytest.mark.parametrize("lam", [0.1, 0.3, 0.5, 1.0])
    def test_various_lam(self, u_typical, t_grid, lam):
        result = h_pade22(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=lam)
        assert np.all(np.isfinite(result))


# ---------------------------------------------------------------------------
# B. rough_heston_pade_f0 convenience wrapper
# ---------------------------------------------------------------------------

class TestRoughHestonPadeF0:
    def test_shape(self, default_param, u_typical, t_grid):
        result = rough_heston_pade_f0(u_typical, t_grid, default_param)
        assert result.shape == (len(u_typical), len(t_grid))

    def test_complex_dtype(self, default_param, u_typical, t_grid):
        result = rough_heston_pade_f0(u_typical, t_grid, default_param)
        assert np.iscomplexobj(result)

    def test_zero_at_t_zero(self, default_param, u_typical):
        result = rough_heston_pade_f0(u_typical, np.array([0.0]), default_param)
        np.testing.assert_array_equal(result[:, 0], 0.0 + 0.0j)

    def test_no_nan_or_inf(self, default_param, u_typical, t_grid):
        result = rough_heston_pade_f0(u_typical, t_grid, default_param)
        assert np.all(np.isfinite(result))

    def test_unsupported_pade_order_raises(self, default_param, u_typical, t_grid):
        with pytest.raises(NotImplementedError, match="Padé order"):
            rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="55")

    def test_nonzero_H_anchor_runs(self, default_param, u_typical, t_grid):
        """rough_heston_pade_f0 now supports arbitrary H_anchor via h_padeXX."""
        result = rough_heston_pade_f0(u_typical, t_grid, default_param, H_anchor=0.5)
        assert result.shape == (len(u_typical), len(t_grid))
        assert np.all(np.isfinite(result))

    def test_default_pade_order_is_22(self, default_param, u_typical, t_grid):
        # Should not raise
        result = rough_heston_pade_f0(u_typical, t_grid, default_param)
        assert result.shape == (len(u_typical), len(t_grid))

    def test_matches_h_pade22_directly(self, default_param, u_typical, t_grid):
        result_f0 = rough_heston_pade_f0(u_typical, t_grid, default_param)
        result_direct = h_pade22(
            u_typical, t_grid,
            H=0.0,
            rho=default_param.rho,
            nu=default_param.nu,
            lam=default_param.lam,
        )
        np.testing.assert_array_equal(result_f0, result_direct)


# ---------------------------------------------------------------------------
# C. h_pade44 direct
# ---------------------------------------------------------------------------

class TestHPade44Shape:
    def test_output_shape(self, u_typical, t_grid):
        result = h_pade44(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (len(u_typical), len(t_grid))

    def test_output_shape_single_u(self, t_grid):
        result = h_pade44(np.array([1.0 + 0.5j]), t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (1, len(t_grid))

    def test_output_shape_single_t(self, u_typical):
        result = h_pade44(u_typical, np.array([1.0]), H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (len(u_typical), 1)


class TestHPade44Dtype:
    def test_output_is_complex(self, u_typical, t_grid):
        result = h_pade44(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert np.iscomplexobj(result)
        assert result.dtype == np.complex128


class TestHPade44AtZero:
    def test_zero_at_t_zero(self, u_typical):
        tau = np.array([0.0])
        result = h_pade44(u_typical, tau, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        np.testing.assert_array_almost_equal(np.abs(result[:, 0]), 0.0, decimal=14)

    def test_zero_at_t_zero_in_grid(self, u_typical, t_grid):
        result = h_pade44(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        np.testing.assert_array_almost_equal(np.abs(result[:, 0]), 0.0, decimal=14)


class TestHPade44Finite:
    @pytest.mark.parametrize("u_val", [
        0.5 + 0.1j,
        1.0 + 0.5j,
        2.0 + 1.0j,
        5.0 + 2.0j,
        10.0 + 3.0j,
    ])
    def test_no_nan_or_inf(self, u_val, t_grid):
        result = h_pade44(np.array([u_val]), t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert np.all(np.isfinite(result)), f"Non-finite values for u={u_val}"

    def test_vectorized_multiple_u_and_t(self):
        u = np.array([0.5 + 0.2j, 1.5 + 0.8j, 3.0 + 1.5j])
        t = np.linspace(0.0, 1.0, 11)
        result = h_pade44(u, t, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (3, 11)
        assert np.all(np.isfinite(result))


class TestHPade44NotIdenticalToPade22:
    def test_pade44_differs_from_pade22(self, u_typical, t_grid):
        r22 = h_pade22(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        r44 = h_pade44(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert not np.allclose(r22, r44), "h_pade44 must differ from h_pade22"


# ---------------------------------------------------------------------------
# D. rough_heston_pade_f0 with pade_order="44"
# ---------------------------------------------------------------------------

class TestRoughHestonPadeF0Pade44:
    def test_shape(self, default_param, u_typical, t_grid):
        result = rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="44")
        assert result.shape == (len(u_typical), len(t_grid))

    def test_complex_dtype(self, default_param, u_typical, t_grid):
        result = rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="44")
        assert np.iscomplexobj(result)

    def test_zero_at_t_zero(self, default_param, u_typical):
        result = rough_heston_pade_f0(u_typical, np.array([0.0]), default_param, pade_order="44")
        np.testing.assert_array_almost_equal(np.abs(result[:, 0]), 0.0, decimal=14)

    def test_no_nan_or_inf(self, default_param, u_typical, t_grid):
        result = rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="44")
        assert np.all(np.isfinite(result))

    def test_matches_h_pade44_directly(self, default_param, u_typical, t_grid):
        result_f0 = rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="44")
        result_direct = h_pade44(
            u_typical, t_grid,
            H=0.0,
            rho=default_param.rho,
            nu=default_param.nu,
            lam=default_param.lam,
        )
        np.testing.assert_array_equal(result_f0, result_direct)

    def test_unsupported_order_bad_raises(self, default_param, u_typical, t_grid):
        with pytest.raises(NotImplementedError, match="Padé order"):
            rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="bad")


# ---------------------------------------------------------------------------
# E. h_pade33 direct
# ---------------------------------------------------------------------------

class TestHPade33Shape:
    def test_output_shape(self, u_typical, t_grid):
        result = h_pade33(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (len(u_typical), len(t_grid))

    def test_output_shape_single_u(self, t_grid):
        result = h_pade33(np.array([1.0 + 0.5j]), t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (1, len(t_grid))

    def test_output_shape_single_t(self, u_typical):
        result = h_pade33(u_typical, np.array([1.0]), H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (len(u_typical), 1)


class TestHPade33Dtype:
    def test_output_is_complex(self, u_typical, t_grid):
        result = h_pade33(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert np.iscomplexobj(result)
        assert result.dtype == np.complex128


class TestHPade33AtZero:
    def test_zero_at_t_zero(self, u_typical):
        tau = np.array([0.0])
        result = h_pade33(u_typical, tau, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        np.testing.assert_array_almost_equal(np.abs(result[:, 0]), 0.0, decimal=14)

    def test_zero_at_t_zero_in_grid(self, u_typical, t_grid):
        result = h_pade33(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        np.testing.assert_array_almost_equal(np.abs(result[:, 0]), 0.0, decimal=14)


class TestHPade33Finite:
    @pytest.mark.parametrize("u_val", [
        0.5 + 0.1j,
        1.0 + 0.5j,
        2.0 + 1.0j,
        5.0 + 2.0j,
        10.0 + 3.0j,
    ])
    def test_no_nan_or_inf(self, u_val, t_grid):
        result = h_pade33(np.array([u_val]), t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert np.all(np.isfinite(result)), f"Non-finite values for u={u_val}"

    def test_vectorized_multiple_u_and_t(self):
        u = np.array([0.5 + 0.2j, 1.5 + 0.8j, 3.0 + 1.5j])
        t = np.linspace(0.0, 1.0, 11)
        result = h_pade33(u, t, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (3, 11)
        assert np.all(np.isfinite(result))

    def test_regression_representative_inputs(self):
        u = np.array([0.2 + 0.1j, 1.0 - 0.5j, -10.0 - 1.2j])
        t = np.array([0.0, 0.01, 0.25, 1.0])
        result = h_pade33(u, t, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert result.shape == (3, 4)
        assert np.all(np.isfinite(result))
        # t=0 column must be zero
        np.testing.assert_array_almost_equal(np.abs(result[:, 0]), 0.0, decimal=14)


class TestHPade33NotIdentical:
    def test_pade33_differs_from_pade22(self, u_typical, t_grid):
        r22 = h_pade22(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        r33 = h_pade33(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert not np.allclose(r22, r33), "h_pade33 must differ from h_pade22"

    def test_pade33_differs_from_pade44(self, u_typical, t_grid):
        r33 = h_pade33(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        r44 = h_pade44(u_typical, t_grid, H=0.0, rho=-0.7, nu=0.3, lam=0.3)
        assert not np.allclose(r33, r44), "h_pade33 must differ from h_pade44"


# ---------------------------------------------------------------------------
# F. rough_heston_pade_f0 with pade_order="33"
# ---------------------------------------------------------------------------

class TestRoughHestonPadeF0Pade33:
    def test_shape(self, default_param, u_typical, t_grid):
        result = rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="33")
        assert result.shape == (len(u_typical), len(t_grid))

    def test_complex_dtype(self, default_param, u_typical, t_grid):
        result = rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="33")
        assert np.iscomplexobj(result)

    def test_zero_at_t_zero(self, default_param, u_typical):
        result = rough_heston_pade_f0(u_typical, np.array([0.0]), default_param, pade_order="33")
        np.testing.assert_array_almost_equal(np.abs(result[:, 0]), 0.0, decimal=14)

    def test_no_nan_or_inf(self, default_param, u_typical, t_grid):
        result = rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="33")
        assert np.all(np.isfinite(result))

    def test_matches_h_pade33_directly(self, default_param, u_typical, t_grid):
        result_f0 = rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="33")
        result_direct = h_pade33(
            u_typical, t_grid,
            H=0.0,
            rho=default_param.rho,
            nu=default_param.nu,
            lam=default_param.lam,
        )
        np.testing.assert_array_equal(result_f0, result_direct)

    def test_unsupported_55_raises(self, default_param, u_typical, t_grid):
        with pytest.raises(NotImplementedError, match="Padé order"):  # noqa: keep remainder
            rough_heston_pade_f0(u_typical, t_grid, default_param, pade_order="55")


# ---------------------------------------------------------------------------
# G. driver_scale tests
# ---------------------------------------------------------------------------

_KW_BASE = dict(H=0.0, rho=-0.7, nu=0.3, lam=0.3)
_U_DS = np.array([0.2 + 0.1j, 1.0 - 0.5j, 3.0 + 0.8j])
_TAU_DS = np.linspace(0.0, 1.0, 21)





class TestRootPadeShape:
    def test_shape_default(self, rp_param, rp_u, rp_t):
        out = rough_heston_root_pade_f0(rp_u, rp_t, rp_param)
        assert out.shape == (len(rp_u), len(rp_t))

    def test_shape_single_u(self, rp_param, rp_t):
        out = rough_heston_root_pade_f0(np.array([1.0 + 0.5j]), rp_t, rp_param)
        assert out.shape == (1, len(rp_t))

    def test_shape_single_t(self, rp_param, rp_u):
        out = rough_heston_root_pade_f0(rp_u, np.array([1.0]), rp_param)
        assert out.shape == (len(rp_u), 1)

    def test_dtype_complex(self, rp_param, rp_u, rp_t):
        out = rough_heston_root_pade_f0(rp_u, rp_t, rp_param)
        assert np.iscomplexobj(out)


class TestRootPadeAtZero:
    def test_zero_at_t0(self, rp_param, rp_u):
        t = np.array([0.0, 0.5, 1.0])
        out = rough_heston_root_pade_f0(rp_u, t, rp_param)
        np.testing.assert_array_equal(out[:, 0], 0.0)

    def test_zero_at_t0_only_zero(self, rp_param, rp_u):
        out = rough_heston_root_pade_f0(rp_u, np.array([0.0]), rp_param)
        np.testing.assert_array_equal(out, 0.0)


class TestRootPadeFinite:
    def test_all_finite_default(self, rp_param, rp_u, rp_t):
        out = rough_heston_root_pade_f0(rp_u, rp_t, rp_param)
        assert np.all(np.isfinite(out)), "Non-finite values in root_pade output"

    def test_all_finite_various_degrees(self, rp_param, rp_u, rp_t):
        for degree in [4, 5, 6, 7]:
            out = rough_heston_root_pade_f0(rp_u, rp_t, rp_param, degree=degree)
            assert np.all(np.isfinite(out)), f"Non-finite values for degree={degree}"

    def test_all_finite_moderate_u(self, rp_param):
        u_mod = np.linspace(0.1, 10.0, 20) + 0.5j
        out = rough_heston_root_pade_f0(u_mod, np.linspace(0.0, 0.5, 11), rp_param)
        assert np.all(np.isfinite(out))


class TestRootPadeHAnchorError:
    def test_raises_for_out_of_range_h_anchor(self, rp_param, rp_u, rp_t):
        with pytest.raises(ValueError):
            rough_heston_root_pade_f0(rp_u, rp_t, rp_param, H=0.6)

    def test_raises_for_lower_bound_h_anchor(self, rp_param, rp_u, rp_t):
        with pytest.raises(ValueError):
            rough_heston_root_pade_f0(rp_u, rp_t, rp_param, H=-0.5)




class TestRootPadeVsDirectRiccati:
    """root_pade and direct_riccati must agree qualitatively on moderate contours."""

    def test_relative_mode_agreement(self):
        from roughprix.heston.rough_heston import RoughHeston, RoughHestonParam

        m = RoughHeston(
            RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=0.1),
            riskfree=0.0,
        )
        arg = np.array([0.5 + 0.1j, 1.0 - 0.3j])
        kw = dict(maturity=0.5, order=0, time_steps=100, return_lists=True)

        st_rp = m.expansion_state(arg, base="root_pade", **kw)  # no gamma_mode
        st_dr = m.expansion_state(arg, base="direct_riccati", **kw)

        f0_rp = np.array(st_rp.f0.values)
        f0_dr = np.array(st_dr.f0.values)

        rel_diff = np.max(np.abs(f0_rp - f0_dr) / np.maximum(np.abs(f0_dr), 1e-12))
        assert rel_diff < 0.3, (
            f"root_pade and direct_riccati differ too much: {rel_diff:.3f}"
        )


class TestRootPadeWiring:
    """root_pade is accepted by expansion_state and produces finite results."""

    def test_expansion_state_runs(self):
        from roughprix.heston.rough_heston import RoughHeston, RoughHestonParam

        m = RoughHeston(RoughHestonParam(), riskfree=0.0)
        arg = np.array([0.5 + 0.1j, 5.0 + 0.5j, 20.0 + 0.5j])
        state = m.expansion_state(
            arg, maturity=0.5, order=0, time_steps=50, base="root_pade",
        )
        f0 = np.array(state.f0.values)
        assert f0.shape[0] == len(arg)
        assert np.all(np.isfinite(f0))

    def test_validation_rejects_unknown(self):
        from roughprix.heston.rough_heston import RoughHeston, RoughHestonParam

        m = RoughHeston(RoughHestonParam(), riskfree=0.0)
        with pytest.raises(ValueError):
            m.expansion_state(
                np.array([1.0 + 0.5j]), maturity=1.0, order=0, base="bad_method",
            )

    def test_log_charfun_runs(self):
        from roughprix.heston.rough_heston import RoughHeston, RoughHestonParam

        m = RoughHeston(RoughHestonParam(), riskfree=0.0, base_solution="root_pade")
        arg = np.array([0.5 + 0.1j, 5.0 + 0.5j])
        log_cf = m.log_charfun(
            arg, maturity=0.5, order=0, time_steps=50,
        )
        assert log_cf.shape == (len(arg), 1)
        assert np.all(np.isfinite(log_cf))

    def test_frozen_mode_runs(self):
        from roughprix.heston.rough_heston import RoughHeston, RoughHestonParam

        m = RoughHeston(
            RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=0.2),
            riskfree=0.0,
        )
        arg = np.array([1.0 - 0.3j, 5.0 + 0.5j])
        state = m.expansion_state(
            arg, maturity=0.5, order=0, time_steps=50, base="root_pade",
        )
        f0 = np.array(state.f0.values)
        assert np.all(np.isfinite(f0))

    def test_various_pade_degrees_run(self):
        from roughprix.heston.rough_heston import RoughHeston, RoughHestonParam

        m = RoughHeston(RoughHestonParam(), riskfree=0.0)
        arg = np.array([1.0 + 0.5j, 3.0 + 0.5j])
        for degree in [4, 5, 6, 7]:
            state = m.expansion_state(
                arg, maturity=0.5, order=0, time_steps=50, base="root_pade",
                root_pade_degree=degree,
            )
            f0 = np.array(state.f0.values)
            assert np.all(np.isfinite(f0)), f"Non-finite for degree={degree}"


# ===========================================================================
# Section K: rough_heston_root_pade_f0 — general H_anchor
# ===========================================================================

class TestRootPadeHAnchorGeneral:
    """Tests for generalised H_anchor support in rough_heston_root_pade_f0."""

    @pytest.fixture
    def param(self):
        return RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=0.1)

    @pytest.fixture
    def u_small(self):
        return np.array([0.5 + 0.1j, 1.0 - 0.3j, 3.0 + 0.5j])

    @pytest.fixture
    def t_short(self):
        return np.linspace(0.0, 0.5, 11)

    def test_h_anchor_zero_matches_default(self, param, u_small, t_short):
        """H_anchor=0.0 must give the same output as the default call."""
        out_default = rough_heston_root_pade_f0(u_small, t_short, param)
        out_explicit = rough_heston_root_pade_f0(u_small, t_short, param, H=0.0)
        np.testing.assert_array_equal(out_default, out_explicit)

    def test_h_anchor_025_finite(self, param, u_small, t_short):
        """H_anchor=0.25 (alpha=0.75) must return all finite values."""
        out = rough_heston_root_pade_f0(u_small, t_short, param, H=0.25)
        assert out.shape == (len(u_small), len(t_short))
        assert np.iscomplexobj(out)
        assert np.all(np.isfinite(out)), "Non-finite values for H_anchor=0.25"

    def test_h_anchor_05_finite(self, param, u_small, t_short):
        """H_anchor=0.5 (alpha=1.0, classical Heston) must return all finite values."""
        out = rough_heston_root_pade_f0(u_small, t_short, param, H=0.5)
        assert out.shape == (len(u_small), len(t_short))
        assert np.all(np.isfinite(out)), "Non-finite values for H_anchor=0.5"

    def test_h_anchor_05_close_to_pade44(self, param, u_small):
        """H_anchor=0.5 root_pade should agree with h_pade44(H=0.5) for small maturity."""
        from roughprix.heston.pade import h_pade44
        t_tiny = np.linspace(0.0, 0.1, 6)
        out_rp = rough_heston_root_pade_f0(u_small, t_tiny, param, H=0.5)
        out_p4 = h_pade44(
            a=u_small,
            tau=t_tiny,
            H=0.5,
            rho=param.rho,
            nu=param.nu,
            lam=param.lam,
        )
        # Skip t=0 (both are zero there)
        rel_diff = np.max(
            np.abs(out_rp[:, 1:] - out_p4[:, 1:])
            / np.maximum(np.abs(out_p4[:, 1:]), 1e-12)
        )
        assert rel_diff < 0.5, (
            f"H_anchor=0.5 root_pade deviates too much from h_pade44: {rel_diff:.3f}"
        )

    def test_h_anchor_zero_at_t0(self, param, u_small):
        """h(t=0) == 0 for all H_anchor values."""
        for h_anc in [0.0, 0.25, 0.5]:
            out = rough_heston_root_pade_f0(u_small, np.array([0.0]), param, H=h_anc)
            np.testing.assert_array_equal(
                out, 0.0, err_msg=f"Non-zero at t=0 for H_anchor={h_anc}"
            )

    def test_diagnostics_report_h_anchor_and_alpha(self, param, u_small, t_short):
        """rough_heston_root_pade_f0 must return finite arrays for various H anchors."""
        for h_anc in [0.0, 0.25, 0.5]:
            result = rough_heston_root_pade_f0(u_small, t_short, param, H=h_anc)
            assert isinstance(result, np.ndarray)
            assert np.all(np.isfinite(result))


    def test_different_h_anchors_give_different_outputs(self, param, u_small):
        """Different H_anchor values must produce genuinely different results (t > 0)."""
        t_pos = np.array([0.1, 0.5])
        out_0 = rough_heston_root_pade_f0(u_small, t_pos, param, H=0.0)
        out_q = rough_heston_root_pade_f0(u_small, t_pos, param, H=0.25)
        out_h = rough_heston_root_pade_f0(u_small, t_pos, param, H=0.5)
        assert not np.allclose(out_0, out_q), "H_anchor=0.0 and 0.25 unexpectedly equal"
        assert not np.allclose(out_q, out_h), "H_anchor=0.25 and 0.5 unexpectedly equal"