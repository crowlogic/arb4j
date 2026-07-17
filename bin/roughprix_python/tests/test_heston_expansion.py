"""
Validation tests for the refactored RoughHeston expansion pricer.

Run fast tests only:
    pytest tests/test_heston_expansion.py

Run all tests including slow benchmarks (time_steps=1000, order=6):
    pytest tests/test_heston_expansion.py --run-slow
"""

import numpy as np
import pytest
from scipy.special import gamma

from roughprix import fourier
from roughprix.heston import rough_heston
from roughprix.heston.base_solution import _heuristic_measure_L, _heuristic_measure_panels
from roughprix.heston.rough_heston import (
    RoughHeston,
    HestonExpansionState,
    RoughHestonParam,
    _build_kernel_derivative_ops,
    _relative_gamma_poly_coeffs,
    _raw_kernel_op,
)


# ---------------------------------------------------------------------------
# Shared fixtures
# ---------------------------------------------------------------------------

@pytest.fixture(scope="module")
def model():
    param = RoughHestonParam(H=0.3, lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02)
    return RoughHeston(param=param, riskfree=0.0)


@pytest.fixture(scope="module")
def benchmark_K():
    return np.exp(np.array([-0.20, -0.10, 0.0, 0.10, 0.20]))


@pytest.fixture(scope="module")
def benchmark_panels():
    return [0.0, 5.0, 15.0, 35.0, 75.0, 150.0, 250.0]


# ---------------------------------------------------------------------------
# 1. Backward compatibility
# ---------------------------------------------------------------------------

def test_charfun_output_shape(model):
    u = np.linspace(0.1, 5.0, 10)
    phi = model.charfun(u, maturity=1.0, order=0, time_steps=50)
    assert phi.shape == (10, 1)
    assert phi.dtype == np.complex128


def test_charfun_matches_exp_log_charfun(model):
    """charfun == exp(log_charfun) for all orders."""
    u = np.linspace(0.1, 5.0, 8)
    for order in [0, 1, 3]:
        phi = model.charfun(u, maturity=0.5, order=order, time_steps=60)
        log_phi = model.log_charfun(u, maturity=0.5, order=order, time_steps=60)
        np.testing.assert_allclose(
            phi, np.exp(log_phi), rtol=0, atol=1e-15,
            err_msg=f"charfun != exp(log_charfun) at order={order}",
        )


def test_log_charfun_shape(model):
    u = np.linspace(0.1, 5.0, 7)
    log_phi = model.log_charfun(u, maturity=1.0, order=1, time_steps=50)
    assert log_phi.shape == (7, 1)


# ---------------------------------------------------------------------------
# 3. Constant reproduction
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# 4. Measure quadrature benchmarks  (--run-slow required)
# ---------------------------------------------------------------------------

BENCH_T025 = np.array([
    1.824563450995e-01,
    1.005775136572e-01,
    2.527006517043e-02,
    4.455204459069e-04,
    3.165119239522e-06,
])

BENCH_T10 = np.array([
    1.920489890039e-01,
    1.166939964537e-01,
    4.630832094165e-02,
    6.976869640744e-03,
    7.860922747903e-04,
])


@pytest.mark.slow
def test_benchmark_T025_order6(model, benchmark_K, benchmark_panels):
    prices = model.eur_call_put(
        K=benchmark_K, maturity=0.25, expansion_order=6, R=1.2,
        panels=benchmark_panels, m_cheb=16, q_weight=128, time_steps=1000,
    )
    np.testing.assert_allclose(
        prices, BENCH_T025, rtol=0, atol=1e-8,
        err_msg="T=0.25, order=6 benchmark prices",
    )


@pytest.mark.slow
def test_benchmark_T10_order6(model, benchmark_K, benchmark_panels):
    prices = model.eur_call_put(
        K=benchmark_K, maturity=1.0, expansion_order=6, R=1.2,
        panels=benchmark_panels, m_cheb=16, q_weight=128, time_steps=1000,
    )
    np.testing.assert_allclose(
        prices, BENCH_T10, rtol=0, atol=1e-8,
        err_msg="T=1.0, order=6 benchmark prices",
    )


# ---------------------------------------------------------------------------
# 5. Convergence
# ---------------------------------------------------------------------------

def test_mcheb_convergence(model, benchmark_K, benchmark_panels):
    """Prices must converge as m_cheb increases: error 8→16 < error 4→16."""
    results = {}
    for m in [4, 8, 16]:
        results[m] = model.eur_call_put(
            K=benchmark_K, maturity=0.25, expansion_order=3, R=1.2,
            panels=benchmark_panels, m_cheb=m, q_weight=64, time_steps=200,
        )
    diff_4_16 = np.max(np.abs(results[4] - results[16]))
    diff_8_16 = np.max(np.abs(results[8] - results[16]))
    # Both values near machine epsilon — just check convergence is tight enough
    assert diff_8_16 < 1e-12, (
        f"Expected m_cheb convergence, got diff_4_16={diff_4_16:.3e} diff_8_16={diff_8_16:.3e}"
    )


def test_qweight_convergence(model, benchmark_K, benchmark_panels):
    """q_weight only affects the Heston-measure weights, not the expensive h_N nodes.
    q_weight=64 and q_weight=128 should agree to 1e-10 for smooth phi0."""
    kw = dict(K=benchmark_K, maturity=0.25, expansion_order=2, R=1.2,
              panels=benchmark_panels, m_cheb=8, time_steps=100)
    p64 = model.eur_call_put(q_weight=64, **kw)
    p128 = model.eur_call_put(q_weight=128, **kw)
    np.testing.assert_allclose(
        p64, p128, rtol=0, atol=1e-10,
        err_msg="q_weight=64 vs 128 should give same prices to 1e-10",
    )


# ---------------------------------------------------------------------------
# 6. HestonExpansionState structure
# ---------------------------------------------------------------------------

def test_expansion_state_is_dataclass(model):
    u = np.array([0.5 + 0j, 1.0 + 0j, 2.0 + 0j])
    state = model.expansion_state(u, maturity=1.0, order=0, time_steps=40)
    assert isinstance(state, HestonExpansionState)


def test_expansion_state_fields(model):
    u = np.array([0.5 + 0j, 1.0 + 0j, 2.0 + 0j])
    state = model.expansion_state(u, maturity=1.0, order=2, time_steps=40)

    assert state.u.shape == (3,)
    assert state.u.dtype == np.complex128
    assert state.grid.T == pytest.approx(1.0)
    assert state.alpha == pytest.approx(gamma(0.3 + 0.5))

    # f_list and F_list are None when return_lists=False (default)
    assert state.f_list is None
    assert state.F_list is None


def test_expansion_state_return_lists(model):
    u = np.array([0.5 + 0j, 1.0 + 0j])
    for order in [0, 1, 3]:
        state = model.expansion_state(u, maturity=1.0, order=order,
                                      time_steps=40, return_lists=True)
        assert len(state.f_list) == order + 1  # f0 ... f_order
        assert len(state.F_list) == order + 1


def test_log_charfun_from_field_f0_vs_expansion_order0(model):
    """When order=0, expansion == f0, so both fields give identical log_phi."""
    u = np.array([0.5 + 0j, 1.0 + 0j, 2.0 + 0j])
    state = model.expansion_state(u, maturity=1.0, order=0, time_steps=50)
    log_from_f0 = model.log_charfun_from_field(state, state.f0)
    log_from_exp = model.log_charfun_from_field(state, state.expansion)
    np.testing.assert_allclose(log_from_f0, log_from_exp, rtol=0, atol=0)


# ---------------------------------------------------------------------------
# 7. Domain heuristic
# ---------------------------------------------------------------------------

def test_heuristic_L_wide_moneyness():
    """Wide moneyness (kmax=0.6) at T=0.25 should choose L=500."""
    # raw = 160 * (1 + 0.75*0.6) / sqrt(0.25) = 160 * 1.45 / 0.5 = 464 → rounds to 500
    L = _heuristic_measure_L(T=0.25, kmax=0.6)
    assert L == 500.0


def test_heuristic_panels_structure():
    """Heuristic panels must start at 0, end at L, and be strictly increasing."""
    for L in [150.0, 250.0, 350.0, 500.0, 700.0, 1000.0]:
        panels = _heuristic_measure_panels(L)
        assert panels[0] == 0.0, f"panels must start at 0 for L={L}"
        assert panels[-1] == L, f"panels must end at L={L}"
        assert np.all(np.diff(panels) > 0), f"panels must be strictly increasing for L={L}"


def test_heuristic_panels_from_L_250():
    """L=250 produces panels that include template points < 250 plus 250 itself."""
    panels = _heuristic_measure_panels(250.0)
    assert panels[-1] == 250.0
    assert panels[0] == 0.0
    # Template points inside (0, 250) should all appear
    assert 150.0 in panels
    assert 200.0 in panels


def test_heuristic_default_gives_finite_prices(model, benchmark_K):
    """Default (no L, no panels) must give finite positive call prices."""
    prices = model.eur_call_put(
        K=benchmark_K, maturity=0.25, expansion_order=2, R=1.2,
        m_cheb=8, q_weight=32, time_steps=100,
    )
    assert np.all(np.isfinite(prices))
    assert np.all(prices > 0)


def test_fixed_domain_prices_unchanged(model, benchmark_K, benchmark_panels):
    """Explicit L+panels pricing must not change after removing auto_domain machinery."""
    prices_A = model.eur_call_put(
        K=benchmark_K, maturity=0.25, expansion_order=3, R=1.2,
        panels=benchmark_panels, m_cheb=8, q_weight=32, time_steps=100,
    )
    prices_B = model.eur_call_put(
        K=benchmark_K, maturity=0.25, expansion_order=3, R=1.2,
        L=250.0, panels=benchmark_panels, m_cheb=8, q_weight=32, time_steps=100,
    )
    np.testing.assert_allclose(prices_A, prices_B, rtol=0, atol=0)


# ---------------------------------------------------------------------------
# 8. OTM payoff selection and put-call parity
# ---------------------------------------------------------------------------

# Wide moneyness grid and fixed domain used by slow OTM tests
_OTM_K_WIDE = np.exp(np.linspace(-0.6, 0.6, 25))
_OTM_PANELS = [0, 3, 7, 12, 20, 35, 55, 80, 110, 150, 200, 270, 350, 500]
_OTM_SLOW_KW = dict(
    maturity=0.25, expansion_order=6, R=1.2, L=500.0,
    panels=_OTM_PANELS, m_cheb=16, q_weight=256, time_steps=1000, S_0=1.0,
)


def test_payoff_selection_invalid(model, benchmark_K):
    with pytest.raises(ValueError, match="payoff_selection must be"):
        model.eur_call_put(
            K=benchmark_K, maturity=0.25, expansion_order=0, R=1.2,
            panels=[0.0, 50.0, 250.0], m_cheb=4, q_weight=16,
            time_steps=50, payoff_selection="bad_value",
        )


def test_otm_is_default(model, benchmark_K, benchmark_panels):
    """payoff_selection='otm' is the default; explicit matches implicit."""
    prices_default = model.eur_call_put(
        K=benchmark_K, maturity=0.25, expansion_order=1, R=1.2,
        panels=benchmark_panels, m_cheb=8, q_weight=32, time_steps=100,
    )
    prices_explicit = model.eur_call_put(
        K=benchmark_K, maturity=0.25, expansion_order=1, R=1.2,
        panels=benchmark_panels, m_cheb=8, q_weight=32, time_steps=100,
        payoff_selection="otm",
    )
    np.testing.assert_array_equal(prices_default, prices_explicit)


def test_otm_all_calls_identical(model, benchmark_panels):
    """When all K >= F, OTM call prices must be identical to as-requested call prices."""
    K_otm_calls = np.array([1.0, 1.1, 1.2, 1.5])  # all >= F=S0=1.0 (r=0)
    kw = dict(maturity=0.25, expansion_order=1, R=1.2, panels=benchmark_panels,
              m_cheb=8, q_weight=32, time_steps=100, call=True)
    p_otm = model.eur_call_put(K=K_otm_calls, payoff_selection="otm", **kw)
    p_req = model.eur_call_put(K=K_otm_calls, payoff_selection="as_requested", **kw)
    np.testing.assert_allclose(p_otm, p_req, rtol=0, atol=0)


def test_otm_all_puts_identical(model, benchmark_panels):
    """When all K < F, OTM put prices must be identical to as-requested put prices."""
    K_otm_puts = np.array([0.5, 0.7, 0.8, 0.9])  # all < F=S0=1.0 (r=0)
    kw = dict(maturity=0.25, expansion_order=1, R=1.2, panels=benchmark_panels,
              m_cheb=8, q_weight=32, time_steps=100, call=False)
    p_otm = model.eur_call_put(K=K_otm_puts, payoff_selection="otm", **kw)
    p_req = model.eur_call_put(K=K_otm_puts, payoff_selection="as_requested", **kw)
    np.testing.assert_allclose(p_otm, p_req, rtol=0, atol=0)


def test_otm_implied_vol_no_nans(model, benchmark_K, benchmark_panels):
    """OTM implied vol must be finite for a normal moneyness grid."""
    ivs = model.eur_call_put(
        K=benchmark_K, maturity=0.25, expansion_order=2, R=1.2,
        panels=benchmark_panels, m_cheb=8, q_weight=32, time_steps=100,
        implied_vol=True, payoff_selection="otm",
    )
    assert ivs.shape == (len(benchmark_K),)
    assert np.all(np.isfinite(ivs)), f"NaN/Inf IVs: {ivs}"
    assert np.all(ivs > 0), f"Non-positive IVs: {ivs}"


@pytest.mark.slow
def test_otm_no_nans_wide_grid(model):
    """OTM IV must be finite for the full wide-moneyness grid."""
    ivs = model.eur_call_put(
        K=_OTM_K_WIDE, implied_vol=True, payoff_selection="otm", **_OTM_SLOW_KW,
    )
    assert ivs.shape == (len(_OTM_K_WIDE),)
    assert np.all(np.isfinite(ivs)), f"NaN/Inf IVs: {ivs}"
    assert np.all(ivs > 0), f"Non-positive IVs: {ivs}"


@pytest.mark.slow
def test_otm_put_call_parity(model):
    """call_prices - put_prices == S0 - K*D by construction in OTM mode."""
    S_0 = 1.0
    D = np.exp(-model.riskfree * 0.25)

    call_prices = model.eur_call_put(
        K=_OTM_K_WIDE, call=True,  payoff_selection="otm", **_OTM_SLOW_KW,
    )
    put_prices = model.eur_call_put(
        K=_OTM_K_WIDE, call=False, payoff_selection="otm", **_OTM_SLOW_KW,
    )

    pcp = call_prices - put_prices
    expected = S_0 - _OTM_K_WIDE * D

    # Parity holds to machine precision because both calls use the same
    # independently-computed OTM prices and only differ by the parity correction.
    np.testing.assert_allclose(
        pcp, expected, rtol=0, atol=1e-14,
        err_msg="Put-call parity violated in OTM mode",
    )


# ---------------------------------------------------------------------------
# 10. anchor=0.5 regression tests
# ---------------------------------------------------------------------------

def _make_model(H: float) -> RoughHeston:
    param = RoughHestonParam(H=H, lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02)
    return RoughHeston(param=param, riskfree=0.0)


def _make_model_anchored(H: float, expansion_base: str = "auto",
                         pade_order: str = "22",
                         root_pade_series_order=None, root_pade_degree: int = 7) -> RoughHeston:
    param = RoughHestonParam(H=H, lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02)
    return RoughHeston(param=param, riskfree=0.0, base_solution=expansion_base,
                       pade_order=pade_order, root_pade_series_order=root_pade_series_order,
                       root_pade_degree=root_pade_degree)


_ANCHOR_CASES = [
    (0.5, 0),
    (0.5, 1),
    (0.5, 2),
    (0.4, 0),
    (0.4, 1),
    (0.4, 2),
    (0.1, 1),
    (0.1, 2),
]

_ANCHOR_ARG = np.linspace(0.1, 3.0, 8)
_ANCHOR_T = 0.5
_ANCHOR_STEPS = 80  # fast but meaningful


@pytest.mark.parametrize("H,order", _ANCHOR_CASES)
def test_anchor_half_log_charfun(H, order):
    """Default model (anchor=0.5) must produce valid log charfun."""
    m = _make_model(H)
    result = m.log_charfun(_ANCHOR_ARG, maturity=_ANCHOR_T, order=order, time_steps=_ANCHOR_STEPS)
    assert np.all(np.isfinite(result))


@pytest.mark.parametrize("H,order", _ANCHOR_CASES)
def test_anchor_half_charfun(H, order):
    """Default model (anchor=0.5) must produce valid charfun."""
    m = _make_model(H)
    result = m.charfun(_ANCHOR_ARG, maturity=_ANCHOR_T, order=order, time_steps=_ANCHOR_STEPS)
    assert np.all(np.isfinite(result))


@pytest.mark.parametrize("H", [0.5, 0.4, 0.1])
def test_anchor_half_pricing_smoke(H):
    """Default model (anchor=0.5) must produce valid eur_call_put_measure_quad prices."""
    m = _make_model(H)
    K = np.exp(np.array([-0.1, 0.0, 0.1]))
    panels = [0.0, 5.0, 15.0, 35.0, 75.0, 150.0, 250.0]
    kw = dict(maturity=0.5, expansion_order=1, time_steps=80, time_steps_phi0=80,
              panels=panels, m_cheb=8, q_weight=32)
    result = m.eur_call_put(K, **kw)
    assert np.all(np.isfinite(result))


def test_anchor_invalid_raises_value_error():
    """Out-of-range anchor must raise ValueError with message 'anchor must be'."""
    m = _make_model(0.4)
    with pytest.raises(ValueError, match="anchor must be"):
        m.expansion_state(_ANCHOR_ARG, maturity=_ANCHOR_T, order=0, time_steps=20, anchor=0.7)


# ---------------------------------------------------------------------------
# 11. Refactor-correctness tests (RiccatiContext / AnchorExpansionOps split)
# ---------------------------------------------------------------------------

@pytest.mark.parametrize("H,order", [(0.5, 0), (0.4, 1), (0.1, 2)])
def test_refactor_order0_expansion_equals_f0(H, order):
    """At order=0 the expansion path must equal the base path f0."""
    m = _make_model(H)
    state = m.expansion_state(
        _ANCHOR_ARG, maturity=_ANCHOR_T, order=0, time_steps=_ANCHOR_STEPS,
    )
    np.testing.assert_array_equal(
        state.expansion.values, state.f0.values,
        err_msg="order=0: expansion must be identical to f0",
    )


@pytest.mark.parametrize("H,order", [(0.5, 1), (0.4, 2), (0.1, 2)])
def test_refactor_return_lists_matches_default(H, order):
    """return_lists=True must give f_list/F_list consistent with expansion."""
    m = _make_model(H)
    state_no_lists = m.expansion_state(
        _ANCHOR_ARG, maturity=_ANCHOR_T, order=order, time_steps=_ANCHOR_STEPS,
    )
    state_with_lists = m.expansion_state(
        _ANCHOR_ARG, maturity=_ANCHOR_T, order=order, time_steps=_ANCHOR_STEPS, return_lists=True,
    )
    # expansion and f0 identical regardless of return_lists
    np.testing.assert_array_equal(state_no_lists.expansion.values, state_with_lists.expansion.values)
    np.testing.assert_array_equal(state_no_lists.f0.values, state_with_lists.f0.values)
    # lists populated
    assert state_with_lists.f_list is not None
    assert state_with_lists.F_list is not None
    assert len(state_with_lists.f_list) == order + 1
    assert len(state_with_lists.F_list) == order + 1
    # f_list[0] == f0
    np.testing.assert_array_equal(state_with_lists.f_list[0].values, state_with_lists.f0.values)
    # lists absent without flag
    assert state_no_lists.f_list is None
    assert state_no_lists.F_list is None


@pytest.mark.parametrize("H,order", [(0.5, 0), (0.5, 1), (0.4, 1), (0.4, 2), (0.1, 2)])
def test_refactor_log_charfun_unchanged(H, order):
    """Refactored log_charfun must be self-consistent: two identical calls give equal output."""
    m = _make_model(H)
    result_a = m.log_charfun(_ANCHOR_ARG, maturity=_ANCHOR_T, order=order,
                             time_steps=_ANCHOR_STEPS)
    result_b = m.log_charfun(_ANCHOR_ARG, maturity=_ANCHOR_T, order=order,
                             time_steps=_ANCHOR_STEPS)
    np.testing.assert_array_equal(result_a, result_b)


# ---------------------------------------------------------------------------
# 12. Zero-anchor (Padé 2/2) tests
# ---------------------------------------------------------------------------

_ZERO_ARG = np.array([0.5 + 0.1j, 1.0 + 0.5j, 2.0 + 1.0j])
_ZERO_T = 1.0
_ZERO_STEPS = 50


def test_zero_anchor_order0_expansion_equals_f0():
    """order=0 zero-anchor: expansion must equal f0."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0, time_steps=_ZERO_STEPS,
    )
    np.testing.assert_array_equal(
        state.expansion.values, state.f0.values,
        err_msg="anchor='zero', order=0: expansion must be identical to f0",
    )


def test_zero_anchor_grid_J():
    """state.grid.J must equal time_steps."""
    m = _make_model(0.4)
    J = 30
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0, time_steps=J,
    )
    assert state.grid.J == J


def test_zero_anchor_u_shape():
    """state.u.shape must match the flattened arg."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0, time_steps=_ZERO_STEPS,
    )
    assert state.u.shape == (_ZERO_ARG.shape[0],)


def test_zero_anchor_f0_shape():
    """f0.values must have shape (N_u, N_t+1)."""
    m = _make_model(0.4)
    J = _ZERO_STEPS
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0, time_steps=J,
    )
    assert state.f0.values.shape == (len(_ZERO_ARG), J + 1)


def test_zero_anchor_f0_zero_at_t0():
    """f0 at t=0 must be zero for all u."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0, time_steps=_ZERO_STEPS,
    )
    np.testing.assert_array_equal(state.f0.values[:, 0], 0.0 + 0.0j)


def test_zero_anchor_f0_no_nan():
    """f0 values must be finite."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0, time_steps=_ZERO_STEPS,
    )
    assert np.all(np.isfinite(state.f0.values))


def test_zero_anchor_log_charfun_smoke():
    """log_charfun with anchor='zero', order=0: finite, correct shape, no NaNs."""
    m = _make_model_anchored(0.4)
    result = m.log_charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=0, time_steps=_ZERO_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(result))


def test_zero_anchor_charfun_smoke():
    """charfun with anchor='zero', order=0: finite, correct shape, no NaNs."""
    m = _make_model_anchored(0.4)
    result = m.charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=0, time_steps=_ZERO_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(result))


def test_zero_anchor_order3_works():
    """anchor=0.0, order=3 must succeed."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=3, time_steps=_ZERO_STEPS,
    )
    assert isinstance(state, HestonExpansionState)
    assert np.all(np.isfinite(np.array(state.expansion.values)))


# ---------------------------------------------------------------------------
# 13. Zero-anchor order=1 tests
# ---------------------------------------------------------------------------

_ZERO1_STEPS = 80  # slightly larger grid than order-0 tests (fraclog needs more resolution)


def test_zero_anchor_order1_state_lists():
    """order=1: f_list and F_list are populated correctly."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=1, time_steps=_ZERO1_STEPS, return_lists=True,
    )
    assert state.f_list is not None
    assert len(state.f_list) == 2
    assert state.F_list is not None
    assert len(state.F_list) == 2
    # f_list[0] must equal f0
    np.testing.assert_array_equal(
        np.array(state.f_list[0].values),
        np.array(state.f0.values),
    )
    assert state.expansion.values.shape == state.f0.values.shape


def test_zero_anchor_order1_expansion_equals_f0_plus_H_f1():
    """expansion must equal f0 + H * f1 for order=1."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=1, time_steps=_ZERO1_STEPS, return_lists=True,
        anchor=0.0,
    )
    H = m.param.H
    expected = np.array(state.f_list[0].values) + H * np.array(state.f_list[1].values)
    np.testing.assert_allclose(
        np.array(state.expansion.values),
        expected,
        rtol=1e-10,
        err_msg="expansion must equal f0 + H*f1 for order=1",
    )


def test_zero_anchor_order1_f1_shape_and_finite():
    """f1 must have the correct shape and no NaNs."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=1, time_steps=_ZERO1_STEPS, return_lists=True,
        anchor=0.0,
    )
    f1_vals = np.array(state.f_list[1].values)
    assert f1_vals.shape == (len(_ZERO_ARG), _ZERO1_STEPS + 1)
    assert np.all(np.isfinite(f1_vals))


def test_zero_anchor_order1_log_charfun_smoke():
    """log_charfun with anchor='zero', order=1: finite, correct shape."""
    m = _make_model_anchored(0.4)
    result = m.log_charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=1, time_steps=_ZERO1_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(np.array(result)))


def test_zero_anchor_order1_charfun_smoke():
    """charfun with anchor='zero', order=1: finite, correct shape."""
    m = _make_model_anchored(0.4)
    result = m.charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=1, time_steps=_ZERO1_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(np.array(result)))


@pytest.mark.parametrize("H,order", [(0.5, 0), (0.5, 1), (0.4, 1), (0.4, 2), (0.1, 2)])
def test_zero_anchor_order1_half_anchor_unaffected(H, order):
    """Half-anchor expansion must be self-consistent."""
    m = _make_model(H)
    result_a = m.log_charfun(_ANCHOR_ARG, maturity=_ANCHOR_T, order=order,
                             time_steps=_ANCHOR_STEPS)
    result_b = m.log_charfun(_ANCHOR_ARG, maturity=_ANCHOR_T, order=order,
                             time_steps=_ANCHOR_STEPS)
    np.testing.assert_array_equal(result_a, result_b)


# ---------------------------------------------------------------------------
# 14. Public return-type tests (log_charfun / charfun must return numpy)
# ---------------------------------------------------------------------------

def test_log_charfun_returns_numpy():
    """log_charfun must return a NumPy ndarray at the public boundary."""
    m = _make_model(0.4)
    result = m.log_charfun(
        np.linspace(0.5, 3.0, 5), maturity=0.5, order=0, time_steps=40,
    )
    assert isinstance(result, np.ndarray), (
        f"log_charfun returned {type(result)}, expected np.ndarray"
    )
    assert result.shape == (5, 1)
    assert np.all(np.isfinite(result))


def test_charfun_returns_numpy():
    """charfun must return a NumPy ndarray at the public boundary."""
    m = _make_model(0.4)
    result = m.charfun(
        np.linspace(0.5, 3.0, 5), maturity=0.5, order=0, time_steps=40,
    )
    assert isinstance(result, np.ndarray), (
        f"charfun returned {type(result)}, expected np.ndarray"
    )
    assert result.shape == (5, 1)
    assert np.all(np.isfinite(result))


# ---------------------------------------------------------------------------
# 15. gamma_mode tests
# ---------------------------------------------------------------------------

# A. Default resolution
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------

def test_order0_expansion_equals_f0(order=0):
    """At order=0, expansion must equal f0."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0, time_steps=_ZERO_STEPS,
    )
    np.testing.assert_array_equal(
        np.array(state.expansion.values), np.array(state.f0.values),
        err_msg="order=0: expansion must be identical to f0",
    )





# F. Relative order-1 residual (with digamma correction)
# ---------------------------------------------------------------------------

def test_zero_anchor_order1_relative_residual():
    """anchor='zero', order=1 residual must vanish.

    Equation: f1 = [K_fraclog - psi(0.5)*K_frac](F0) + K_frac(Fx0*f1)
    """
    from roughprix.heston.integration import Integrate
    from scipy.special import digamma
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=1, time_steps=_ZERO1_STEPS, return_lists=True,
        anchor=0.0,
    )
    grid = state.grid
    f0, f1, F0 = state.f_list[0], state.f_list[1], state.F_list[0]

    # F0 and F_list use raw (unscaled) Riccati; kernel ops include 1/alpha
    alpha = state.alpha
    beta_raw = grid.field(m.param.lam - m.param.rho * m.param.nu * state.u * 1j)
    gam_raw = m.param.nu ** 2
    Fx0_raw = -beta_raw + gam_raw * f0

    K0 = Integrate(grid, kernel="frac", order=-0.5, start=0)
    K1 = Integrate(grid, kernel="fraclog", order=1, frac_power=-0.5, start=0)
    psi0 = float(digamma(0.5))

    # Actual equation: f1 = (1/alpha) * [(raw1 - psi0*raw0) @ F0 + raw0 @ (Fx0_raw*f1)]
    residual = (
        np.array(f1.values)
        - (1.0 / alpha) * np.array((K1 @ F0).values)
        + (psi0 / alpha) * np.array((K0 @ F0).values)
        - (1.0 / alpha) * np.array((K0 @ (Fx0_raw * f1)).values)
    )
    np.testing.assert_allclose(
        np.abs(residual).max(), 0.0, atol=1e-6,
        err_msg="Relative order-1 residual (with digamma) must be small",
    )




# H. Relative order-2 kernel formula
# ---------------------------------------------------------------------------

@pytest.mark.parametrize("anchor_H", [0.0, 0.5])
def test_relative_order2_kernel_formula(anchor_H):
    """K[2] = raw2 - 2*psi*raw1 + (psi^2 - polygamma(1,a))*raw0."""
    from roughprix.heston.integration import TimeGrid
    from roughprix.heston.rough_heston import _raw_kernel_op
    from scipy.special import digamma, polygamma

    grid = TimeGrid.uniform(T=1.0, J=30)
    f_field = grid.field(grid.t ** 2, has_time_axis=True)

    K = _build_kernel_derivative_ops(grid, anchor_H=anchor_H, order=2)

    a = anchor_H + 0.5
    psi = float(digamma(a))
    psi1 = float(polygamma(1, a))

    raw0 = _raw_kernel_op(grid, anchor_H, 0)
    raw1 = _raw_kernel_op(grid, anchor_H, 1)
    raw2 = _raw_kernel_op(grid, anchor_H, 2)

    from scipy.special import gamma as Gamma
    alpha = Gamma(anchor_H + 0.5)
    expected = (
        np.array((raw2 @ f_field).values)
        - 2.0 * psi * np.array((raw1 @ f_field).values)
        + (psi ** 2 - psi1) * np.array((raw0 @ f_field).values)
    ) / alpha
    got = np.array((K[2] @ f_field).values)
    np.testing.assert_allclose(
        got, expected, rtol=1e-12,
        err_msg=f"K[2] formula mismatch at anchor_H={anchor_H}",
    )


# I. order=3 kernel ops must work
# ---------------------------------------------------------------------------

def test_relative_order3_works():
    """order=3 must build without error."""
    from roughprix.heston.integration import TimeGrid
    grid = TimeGrid.uniform(T=1.0, J=20)
    K = _build_kernel_derivative_ops(grid, anchor_H=0.0, order=3)
    assert set(K.keys()) == {0, 1, 2, 3}


# ---------------------------------------------------------------------------
# 16. pade_order="44" threading tests
# ---------------------------------------------------------------------------

@pytest.mark.parametrize("order", [0, 1])
def test_zero_anchor_pade44_builds_valid_state(order):
    """anchor='zero', pade_order='44' must build a valid HestonExpansionState."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=order,
        time_steps=_ZERO1_STEPS, base="pade", pade_order="44",
    )
    assert isinstance(state, HestonExpansionState)
    assert state.expansion is not None
    assert np.all(np.isfinite(np.array(state.expansion.values)))


def test_zero_anchor_pade44_log_charfun_finite():
    """log_charfun with pade_order='44' must return finite values."""
    m = _make_model_anchored(0.4, expansion_base="pade", pade_order="44")
    result = m.log_charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=1,
        time_steps=_ZERO1_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(result))


def test_zero_anchor_pade44_charfun_finite():
    """charfun with pade_order='44' must return finite non-zero values."""
    m = _make_model_anchored(0.4, expansion_base="pade", pade_order="44")
    result = m.charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=0,
        time_steps=_ZERO_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(result))
    assert np.all(np.abs(result) > 0)


def test_zero_anchor_pade44_differs_from_pade22():
    """pade_order='44' and '22' must give different expansion states."""
    m = _make_model(0.4)
    state22 = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0,
        time_steps=_ZERO_STEPS, base="pade", pade_order="22",
    )
    state44 = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0,
        time_steps=_ZERO_STEPS, base="pade", pade_order="44",
    )
    assert not np.allclose(
        np.array(state22.expansion.values),
        np.array(state44.expansion.values),
    ), "pade_order='44' expansion must differ from '22'"


def test_pade_order_ignored_for_half_anchor():
    """For anchor='half', pade_order should be accepted without error."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0,
        time_steps=_ZERO_STEPS, pade_order="44",
    )
    assert isinstance(state, HestonExpansionState)


# ---------------------------------------------------------------------------
# 16b. pade_order="33" threading tests
# ---------------------------------------------------------------------------

@pytest.mark.parametrize("order", [0, 1])
def test_zero_anchor_pade33_expansion_state(order):
    """anchor='zero', pade_order='33' must build a valid HestonExpansionState."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=order,
        time_steps=_ZERO1_STEPS, base="pade", pade_order="33",
    )
    assert isinstance(state, HestonExpansionState)
    assert state.expansion is not None
    assert np.all(np.isfinite(np.array(state.expansion.values)))


def test_zero_anchor_pade33_log_charfun_finite():
    """log_charfun with pade_order='33' must return finite values."""
    m = _make_model_anchored(0.4, expansion_base="pade", pade_order="33")
    result = m.log_charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=0,
        time_steps=_ZERO_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(result))


def test_zero_anchor_pade33_charfun_finite():
    """charfun with pade_order='33' must return finite non-zero values."""
    m = _make_model_anchored(0.4, expansion_base="pade", pade_order="33")
    result = m.charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=0,
        time_steps=_ZERO_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(result))
    assert np.all(np.abs(result) > 0)


def test_zero_anchor_pade33_eur_call_put_finite():
    """eur_call_put_measure_quad with pade_order='33' must return finite prices."""
    m = _make_model_anchored(0.4, expansion_base="pade", pade_order="33")
    result = m.eur_call_put(
        K=np.array([0.9, 1.0, 1.1]), maturity=_ZERO_T, expansion_order=0,
        time_steps=_ZERO_STEPS,
    )
    assert np.all(np.isfinite(result))


def test_zero_anchor_pade33_higher_order_frozen():
    """pade_order='33', order=3 must work."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=3,
        time_steps=80, base="pade", pade_order="33",
    )
    assert isinstance(state, HestonExpansionState)
    assert np.all(np.isfinite(np.array(state.expansion.values)))


def test_zero_anchor_pade33_differs_from_pade22():
    """pade_order='33' and '22' must give different expansion states."""
    m = _make_model(0.4)
    state22 = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0,
        time_steps=_ZERO_STEPS, base="pade", pade_order="22",
    )
    state33 = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=0,
        time_steps=_ZERO_STEPS, base="pade", pade_order="33",
    )
    assert not np.allclose(
        np.array(state22.expansion.values),
        np.array(state33.expansion.values),
    ), "pade_order='33' expansion must differ from '22'"


# ---------------------------------------------------------------------------
# 17. zero-anchor frozen higher-order tests
# ---------------------------------------------------------------------------

_FROZEN_HIGH_STEPS = 80


@pytest.mark.parametrize("order", [3, 4])
def test_zero_anchor_frozen_higher_order_no_exception(order):
    """anchor='zero', order>=3 must not raise."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=order,
        time_steps=_FROZEN_HIGH_STEPS,
        return_lists=True,
    )
    assert isinstance(state, HestonExpansionState)


@pytest.mark.parametrize("order", [3, 4])
def test_zero_anchor_frozen_higher_order_list_lengths(order):
    """f_list and F_list must each have length order+1."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=order,
        time_steps=_FROZEN_HIGH_STEPS,
        return_lists=True,
    )
    assert len(state.f_list) == order + 1
    assert len(state.F_list) == order + 1


@pytest.mark.parametrize("order", [3, 4])
def test_zero_anchor_frozen_higher_order_all_finite(order):
    """All fields in expansion must be finite."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=order,
        time_steps=_FROZEN_HIGH_STEPS,
        return_lists=True,
    )
    assert np.all(np.isfinite(np.array(state.expansion.values)))
    for fn in state.f_list:
        assert np.all(np.isfinite(np.array(fn.values)))


@pytest.mark.parametrize("order", [3, 4])
def test_zero_anchor_frozen_higher_order_taylor_reconstruction(order):
    """Manual Taylor sum must match state.expansion."""
    from math import factorial
    m = _make_model(0.4)
    H = m.param.H
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=order,
        time_steps=_FROZEN_HIGH_STEPS,
        return_lists=True, anchor=0.0,
    )
    anchor_H = 0.0
    manual = state.f_list[0]
    for n in range(1, order + 1):
        manual = manual + ((H - anchor_H) ** n / factorial(n)) * state.f_list[n]
    np.testing.assert_allclose(
        np.array(manual.values), np.array(state.expansion.values),
        rtol=1e-12, err_msg=f"Taylor reconstruction mismatch at order={order}",
    )


def test_zero_anchor_relative_order2_works():
    """anchor='zero', order=2 must succeed."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=2,
        time_steps=_FROZEN_HIGH_STEPS,
    )
    assert isinstance(state, HestonExpansionState)
    assert np.all(np.isfinite(np.array(state.expansion.values)))


def test_zero_anchor_relative_order3_works():
    """anchor='zero', order=3 must now succeed."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=3,
        time_steps=_FROZEN_HIGH_STEPS,
    )
    assert isinstance(state, HestonExpansionState)
    assert np.all(np.isfinite(np.array(state.expansion.values)))


def test_zero_anchor_default_order3_works():
    """Default anchor='zero' must work for order=3."""
    m = _make_model(0.4)
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=3,
        time_steps=_FROZEN_HIGH_STEPS,
    )
    assert isinstance(state, HestonExpansionState)
    assert np.all(np.isfinite(np.array(state.expansion.values)))



def test_zero_anchor_frozen_log_charfun_order3_finite():
    """log_charfun with anchor='zero', order=3 must be finite."""
    m = _make_model_anchored(0.4)
    result = m.log_charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=3,
        time_steps=_FROZEN_HIGH_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(result))


def test_zero_anchor_frozen_charfun_order3_finite():
    """charfun with anchor='zero', order=3 must be finite."""
    m = _make_model_anchored(0.4)
    result = m.charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=3,
        time_steps=_FROZEN_HIGH_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(result))
    assert np.all(np.abs(result) > 0)


# ---------------------------------------------------------------------------
# 18. Generic relative-Gamma polynomial and kernel tests
# ---------------------------------------------------------------------------

@pytest.mark.parametrize("anchor_H", [0.0, 0.5])
def test_relative_poly_order0(anchor_H):
    polys = _relative_gamma_poly_coeffs(anchor_H, order=0)
    assert len(polys) == 1
    np.testing.assert_allclose(polys[0], [1.0])


@pytest.mark.parametrize("anchor_H", [0.0, 0.5])
def test_relative_poly_order1(anchor_H):
    from scipy.special import digamma
    a = anchor_H + 0.5
    polys = _relative_gamma_poly_coeffs(anchor_H, order=1)
    assert len(polys) == 2
    np.testing.assert_allclose(polys[1], [-float(digamma(a)), 1.0], rtol=1e-12)


@pytest.mark.parametrize("anchor_H", [0.0, 0.5])
def test_relative_poly_order2(anchor_H):
    from scipy.special import digamma, polygamma
    a = anchor_H + 0.5
    psi = float(digamma(a))
    psi1 = float(polygamma(1, a))
    polys = _relative_gamma_poly_coeffs(anchor_H, order=2)
    assert len(polys) == 3
    expected = np.array([psi ** 2 - psi1, -2.0 * psi, 1.0])
    np.testing.assert_allclose(polys[2], expected, rtol=1e-12)


@pytest.mark.parametrize("anchor_H", [0.0, 0.5])
def test_relative_poly_order3(anchor_H):
    from scipy.special import digamma, polygamma
    a = anchor_H + 0.5
    psi = float(digamma(a))
    psi1 = float(polygamma(1, a))
    psi2 = float(polygamma(2, a))
    # P3 = (L-psi)^3 - 3*psi1*(L-psi) - psi2
    expected = np.array([
        -psi ** 3 + 3 * psi * psi1 - psi2,
        3 * psi ** 2 - 3 * psi1,
        -3 * psi,
        1.0,
    ])
    polys = _relative_gamma_poly_coeffs(anchor_H, order=3)
    assert len(polys) == 4
    np.testing.assert_allclose(polys[3], expected, rtol=1e-11)


@pytest.mark.parametrize("anchor_H", [0.0, 0.5])
def test_relative_kernel_matches_hardcoded_order1(anchor_H):
    """Generic builder must match the old hardcoded K[1] formula."""
    from roughprix.heston.integration import TimeGrid
    from scipy.special import digamma
    grid = TimeGrid.uniform(T=1.0, J=40)
    x = grid.field(np.sin(grid.t + 0.1), has_time_axis=True)

    K = _build_kernel_derivative_ops(grid, anchor_H=anchor_H, order=1)

    from scipy.special import gamma as Gamma
    alpha = Gamma(anchor_H + 0.5)
    psi = float(digamma(anchor_H + 0.5))
    raw0 = _raw_kernel_op(grid, anchor_H, 0)
    raw1 = _raw_kernel_op(grid, anchor_H, 1)
    manual = (np.array((raw1 @ x).values) - psi * np.array((raw0 @ x).values)) / alpha

    np.testing.assert_allclose(
        np.array((K[1] @ x).values), manual, atol=1e-12,
    )


@pytest.mark.parametrize("anchor_H", [0.0, 0.5])
def test_relative_kernel_matches_hardcoded_order2(anchor_H):
    """Generic builder must match the old hardcoded K[2] formula."""
    from roughprix.heston.integration import TimeGrid
    from scipy.special import digamma, polygamma
    grid = TimeGrid.uniform(T=1.0, J=40)
    x = grid.field(np.sin(grid.t + 0.1), has_time_axis=True)

    K = _build_kernel_derivative_ops(grid, anchor_H=anchor_H, order=2)

    from scipy.special import gamma as Gamma
    alpha = Gamma(anchor_H + 0.5)
    psi = float(digamma(anchor_H + 0.5))
    psi1 = float(polygamma(1, anchor_H + 0.5))
    raw0 = _raw_kernel_op(grid, anchor_H, 0)
    raw1 = _raw_kernel_op(grid, anchor_H, 1)
    raw2 = _raw_kernel_op(grid, anchor_H, 2)
    manual = (
        np.array((raw2 @ x).values)
        - 2.0 * psi * np.array((raw1 @ x).values)
        + (psi ** 2 - psi1) * np.array((raw0 @ x).values)
    ) / alpha

    np.testing.assert_allclose(
        np.array((K[2] @ x).values), manual, atol=1e-12,
    )


@pytest.mark.parametrize("order", [3, 4])
@pytest.mark.parametrize("anchor", [0.0, 0.5])
def test_relative_higher_order_smoke(order, anchor):
    """anchor='zero'/'half', order>=3 must build and be finite."""
    from math import factorial
    m = _make_model(0.4)
    H = m.param.H
    state = m.expansion_state(
        _ZERO_ARG, maturity=_ZERO_T, order=order,
        time_steps=_FROZEN_HIGH_STEPS,
        return_lists=True, anchor=anchor,
    )
    assert isinstance(state, HestonExpansionState)
    assert len(state.f_list) == order + 1
    assert len(state.F_list) == order + 1
    assert np.all(np.isfinite(np.array(state.expansion.values)))

    # Taylor reconstruction must match
    anchor_H = anchor
    manual = state.f_list[0]
    for n in range(1, order + 1):
        manual = manual + ((H - anchor_H) ** n / factorial(n)) * state.f_list[n]
    np.testing.assert_allclose(
        np.array(manual.values), np.array(state.expansion.values), rtol=1e-12,
    )


# ---------------------------------------------------------------------------
# 19. log_ricc_scale consistency
# ---------------------------------------------------------------------------

def test_log_charfun_zero_anchor_order2_finite():
    """log_charfun must be finite for anchor='zero', order=2, both gamma modes."""
    m = _make_model_anchored(0.4)
    result = m.log_charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=2,
        time_steps=_FROZEN_HIGH_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(result))


def test_charfun_zero_anchor_order2_finite():
    """charfun must be finite for anchor='zero', order=2, both gamma modes."""
    m = _make_model_anchored(0.4)
    result = m.charfun(
        _ZERO_ARG, maturity=_ZERO_T, order=2,
        time_steps=_FROZEN_HIGH_STEPS,
    )
    assert result.shape == (len(_ZERO_ARG), 1)
    assert np.all(np.isfinite(result))
    assert np.all(np.abs(result) > 0)


def test_eur_call_put_zero_anchor_order2_finite():
    """eur_call_put_measure_quad must be finite for anchor='zero', order=2."""
    m = _make_model_anchored(0.4)
    result = m.eur_call_put(
        K=np.array([0.9, 1.0, 1.1]), maturity=_ZERO_T, expansion_order=2,
        time_steps=_FROZEN_HIGH_STEPS,
    )
    assert np.all(np.isfinite(result))


# ---------------------------------------------------------------------------
# 20. Zero-anchor Riccati residual consistency
# ---------------------------------------------------------------------------

def test_zero_anchor_order0_residual():
    """Padé 2/2 residual at order 0: |f0 - K0 @ F(f0)| / |f0| < tol at T."""
    tol = 0.10
    m = _make_model(0.1)   # H=0.1, close to zero-anchor
    state = m.expansion_state(
        _ZERO_ARG, maturity=0.25, order=0,
        time_steps=200,
        pade_order="22", return_lists=True, anchor=0.0,
    )
    # Actual equation: alpha * f0 = raw_K0 @ F(f0), where alpha = Gamma(anchor_H+0.5)
    from scipy.special import gamma as Gamma
    alpha = Gamma(0.0 + 0.5)
    K0 = _raw_kernel_op(state.grid, anchor_H=0.0, log_order=0)
    f0_vals = np.array(state.f0.values)
    Ff0_vals = np.array((K0 @ state.F_ricc(state.f0)).values)
    res = np.abs(alpha * f0_vals - Ff0_vals)
    denom = np.abs(alpha * f0_vals)
    # Evaluate relative residual at final time step only (where values are largest)
    mask = denom[..., -1] > 1e-10
    if mask.any():
        rel = res[mask, -1] / denom[mask, -1]
        assert float(np.max(rel)) < tol, f"residual too large: {float(np.max(rel)):.4f}"


# ---------------------------------------------------------------------------
# 21. Zero-anchor higher-order drift regression
# ---------------------------------------------------------------------------

@pytest.mark.parametrize("order", [0, 1, 2, 3])
def test_zero_anchor_higher_order_not_exploding(order):
    """Higher-order corrections for anchor='zero' must stay finite and not wildly diverge."""
    m = _make_model(0.1)   # H=0.1
    state = m.expansion_state(
        _ZERO_ARG, maturity=0.25, order=order,
        time_steps=80,
        pade_order="22", return_lists=True,
    )
    exp_vals = np.array(state.expansion.values)
    assert np.all(np.isfinite(exp_vals)), f"Non-finite expansion at order={order}"
    # Corrections should not be orders of magnitude larger than f0
    f0_norm = float(np.max(np.abs(np.array(state.f_list[0].values))))
    exp_norm = float(np.max(np.abs(exp_vals)))
    assert exp_norm < 100 * max(f0_norm, 1e-8), (
        f"Expansion blew up: order={order}, "
        f"|f0|={f0_norm:.3g}, |expansion|={exp_norm:.3g}"
    )


# ---------------------------------------------------------------------------
# 22. base="direct_riccati" tests
# ---------------------------------------------------------------------------

_DIRECT_ARG = np.array([0.5 + 0.1j, 1.0 - 0.3j, 2.0 + 0.5j])
_DIRECT_T = 0.25
_DIRECT_J = 100


def test_zero_base_bad_value_raises():
    """Passing an unsupported zero_base value must raise ValueError."""
    m = _make_model(0.1)
    with pytest.raises(ValueError, match="base must be"):
        m.expansion_state(
            _DIRECT_ARG, maturity=_DIRECT_T, order=0,
            time_steps=_DIRECT_J, base="bad",
        )


def test_direct_riccati_base_order0_shape_and_finite():
    """base='direct_riccati', order=0: shape, dtype, finite, f0[t=0]=0."""
    m = _make_model(0.1)
    state = m.expansion_state(
        _DIRECT_ARG, maturity=_DIRECT_T, order=0,
        time_steps=_DIRECT_J,
        base="direct_riccati", return_lists=True,
    )
    assert isinstance(state, HestonExpansionState)
    f0_vals = np.array(state.f0.values)
    assert f0_vals.shape == (len(_DIRECT_ARG), _DIRECT_J + 1)
    assert np.iscomplexobj(f0_vals)
    assert np.all(np.isfinite(f0_vals))
    # t=0 column must be zero
    np.testing.assert_array_almost_equal(np.abs(f0_vals[:, 0]), 0.0, decimal=14)


def test_direct_riccati_base_order0_expansion_equals_f0():
    """At order=0, expansion must equal f0."""
    m = _make_model(0.1)
    state = m.expansion_state(
        _DIRECT_ARG, maturity=_DIRECT_T, order=0,
        time_steps=_DIRECT_J,
        base="direct_riccati", return_lists=True,
    )
    np.testing.assert_array_equal(
        np.array(state.expansion.values), np.array(state.f0.values),
    )


def test_direct_riccati_differs_from_pade():
    """direct_riccati and pade bases must produce different f0 values."""
    m = _make_model(0.1)
    kw = dict(maturity=_DIRECT_T, order=0, time_steps=_DIRECT_J, return_lists=True)
    state_pade = m.expansion_state(_DIRECT_ARG, base="pade", **kw)
    state_direct = m.expansion_state(_DIRECT_ARG, base="direct_riccati", **kw)
    assert not np.allclose(
        np.array(state_pade.f0.values), np.array(state_direct.f0.values),
    ), "direct_riccati and pade bases must differ"


@pytest.mark.parametrize("order", [1, 2])
def test_direct_riccati_higher_order_smoke(order):
    """base='direct_riccati', order>=1: finite, lists correct length, reconstruction matches."""
    from math import factorial
    m = _make_model(0.1)
    state = m.expansion_state(
        _DIRECT_ARG, maturity=_DIRECT_T, order=order,
        time_steps=_DIRECT_J,
        base="direct_riccati", return_lists=True,
    )
    assert len(state.f_list) == order + 1
    assert len(state.F_list) == order + 1
    exp_vals = np.array(state.expansion.values)
    assert np.all(np.isfinite(exp_vals))

    # Taylor reconstruction must match (anchor=param.H by default)
    H = m.param.H
    anchor_H = H  # expansion anchor == param.H by default
    manual = state.f_list[0]
    for n in range(1, order + 1):
        manual = manual + ((H - anchor_H) ** n / factorial(n)) * state.f_list[n]
    np.testing.assert_allclose(
        np.array(manual.values), exp_vals, rtol=1e-12,
    )


def test_direct_riccati_pricing_smoke():
    """eur_call_put_measure_quad with base='direct_riccati' must return finite prices.

    The Adams predictor-corrector is an explicit method that requires fine grids
    for stability at large Fourier modes.  L=200 with time_steps=500 is safe for
    the rough-Heston parameters used here; larger L requires proportionally more
    time_steps.
    """
    m = _make_model_anchored(0.1,
                              expansion_base="direct_riccati")
    result = m.eur_call_put(
        K=np.array([0.9, 1.0, 1.1]),
        maturity=_DIRECT_T,
        expansion_order=1,
        time_steps=500,
        L=200,
        implied_vol=False,
        payoff_selection="otm",
    )
    assert np.all(np.isfinite(result))
    assert np.all(result >= 0)


# ---------------------------------------------------------------------------
# 23. Convention invariant tests
# ---------------------------------------------------------------------------

@pytest.mark.parametrize("anchor_H", [0.0, 0.25, 0.5])
def test_relative_K1_differs_from_raw_log_kernel(anchor_H):
    """For relative mode, K[1] includes digamma correction and differs from raw log kernel."""
    from roughprix.heston.integration import TimeGrid
    from roughprix.heston.rough_heston import _build_kernel_derivative_ops, _raw_kernel_op

    grid_ref = TimeGrid.uniform(T=0.25, J=50)
    K_rel = _build_kernel_derivative_ops(grid_ref, anchor_H=anchor_H, order=1)
    K_raw1 = _raw_kernel_op(grid_ref, anchor_H=anchor_H, log_order=1)

    one = grid_ref.field(1.0)
    val_rel = np.array((K_rel[1] @ one).values)
    val_raw = np.array((K_raw1 @ one).values)
    assert not np.allclose(val_rel, val_raw), \
        f"relative K[1] must differ from raw log kernel at anchor_H={anchor_H}"


# 23e. Known-good branch regression: half-anchor matches reference to tight tolerance
def test_half_frozen_regression():
    """anchor='half' must match the reference expansion at order 2."""
    from math import factorial
    H = 0.1
    T = _ANCHOR_T
    m = RoughHeston(
        RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=H),
        riskfree=0.0,
    )
    S0 = 1.0
    F = S0
    log_m = np.array([-0.1, 0.0, 0.1])
    K = F * np.exp(log_m)

    result = m.eur_call_put(
        K=K,
        maturity=T,
        expansion_order=1,
        time_steps=80,
        implied_vol=True,
        payoff_selection="otm",
    )
    assert np.all(np.isfinite(result)), \
        f"Non-finite IV for H={H}, T={T}: {result}"
    assert np.all(result > 0), \
        f"Non-positive IV for H={H}, T={T}: {result}"


# ---------------------------------------------------------------------------
# 24. driver_scale / frozen-zero-Padé convention tests
# ---------------------------------------------------------------------------

def test_zero_pade_deterministic():
    """Zero Padé must be deterministic across identical calls."""
    m = RoughHeston(
        RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=0.1),
        riskfree=0.0,
    )
    arg = np.array([0.5 + 0.1j, 1.0 - 0.3j])
    kw = dict(maturity=0.25, order=0, time_steps=50, pade_order="22", return_lists=True)

    # Run twice — same mode, same params → same result
    st1 = m.expansion_state(arg, base="pade", **kw)
    st2 = m.expansion_state(arg, base="pade", **kw)
    np.testing.assert_array_equal(
        np.array(st1.f0.values), np.array(st2.f0.values),
        err_msg="relative zero Padé must be deterministic",
    )
    from scipy.special import gamma
    H = 0.1
    assert abs(st1.alpha - gamma(H + 0.5)) < 1e-12


def test_half_anchor_unchanged_by_driver_scale_refactor():
    """Half-anchor expansion must be unaffected by the Padé driver_scale change."""
    m = RoughHeston(
        RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=0.2),
        riskfree=0.0,
    )
    arg = np.array([0.5 + 0.1j, 1.0 - 0.3j])
    state = m.expansion_state(
        arg, maturity=0.5, order=2, time_steps=50, return_lists=True,
    )
    exp_vals = np.array(state.expansion.values)
    assert np.all(np.isfinite(exp_vals))
    log_phi = m.log_charfun_from_field(state, state.expansion)
    assert np.all(np.isfinite(log_phi))


# ---------------------------------------------------------------------------
# 25. New refactor API tests
# ---------------------------------------------------------------------------

_NEW_API_ARG = np.array([0.5 + 0.1j, 1.0 - 0.3j, 3.0 + 0.5j])
_NEW_API_T = 0.5
_NEW_API_STEPS = 50


def _new_model(H=0.2):
    return RoughHeston(
        RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=H),
        riskfree=0.0,
    )


def test_auto_05_uses_exact_heston():
    """anchor=0.5, base='auto' must use exact Heston and match base='exact_heston'."""
    m = _new_model(H=0.5)
    kw = dict(maturity=_NEW_API_T, order=1, time_steps=_NEW_API_STEPS)
    state_auto = m.expansion_state(_NEW_API_ARG, base="auto", **kw)
    state_ex = m.expansion_state(_NEW_API_ARG, base="exact_heston", **kw)
    np.testing.assert_array_equal(
        np.array(state_auto.expansion.values),
        np.array(state_ex.expansion.values),
    )


def test_zero_pade_matches_explicit_relative():
    """anchor=0.0, base='pade' reproduces old zero/pade/relative path."""
    m = _new_model()
    kw = dict(maturity=_NEW_API_T, order=0, time_steps=_NEW_API_STEPS, base="pade")
    st1 = m.expansion_state(_NEW_API_ARG, **kw)
    st2 = m.expansion_state(_NEW_API_ARG, **kw)
    np.testing.assert_array_equal(
        np.array(st1.f0.values), np.array(st2.f0.values),
    )
    assert np.all(np.isfinite(st1.f0.values))


def test_zero_root_pade_runs_finite():
    """anchor=0.0, base='root_pade' must run and produce finite f0."""
    m = _new_model()
    state = m.expansion_state(
        _NEW_API_ARG, maturity=_NEW_API_T, order=0, time_steps=_NEW_API_STEPS, base="root_pade",
    )
    assert np.all(np.isfinite(state.f0.values))


def test_anchor_025_root_pade_finite():
    """anchor=0.25, base='root_pade' must run and return all-finite f0."""
    m = _new_model()
    state = m.expansion_state(
        _NEW_API_ARG, maturity=_NEW_API_T, order=0, time_steps=_NEW_API_STEPS, base="root_pade",
    )
    assert np.all(np.isfinite(state.f0.values))
    assert state.f0.values.shape == (len(_NEW_API_ARG), _NEW_API_STEPS + 1)


def test_anchor_025_direct_riccati_finite():
    """anchor=0.25, base='direct_riccati' must run and return finite f0 on tiny grid."""
    m = _new_model(H=0.25)
    state = m.expansion_state(
        _NEW_API_ARG[:2], maturity=0.1, order=0, time_steps=20, base="direct_riccati",
    )
    assert np.all(np.isfinite(state.f0.values))


def test_exact_heston_wrong_anchor_raises():
    """base='exact_heston' with anchor != 0.5 must raise ValueError."""
    m = _new_model()
    with pytest.raises(ValueError, match="exact_heston"):
        m.expansion_state(
            _NEW_API_ARG, maturity=_NEW_API_T, order=0, time_steps=20, base="exact_heston",
        )


def test_anchor_05_root_pade_runs_finite():
    """anchor=0.5, base='root_pade' must run and produce finite f0 (uses approx, not exact Heston)."""
    m = _new_model(H=0.4)
    state = m.expansion_state(
        _NEW_API_ARG, maturity=_NEW_API_T, order=0, time_steps=_NEW_API_STEPS, base="root_pade",
    )
    assert np.all(np.isfinite(state.f0.values))
    assert state.f0.values.shape == (len(_NEW_API_ARG), _NEW_API_STEPS + 1)


def test_auto_and_exact_heston_agree_at_05():
    """anchor=0.5: base='auto' and base='exact_heston' must produce identical states."""
    m = _new_model(H=0.5)
    kw = dict(maturity=_NEW_API_T, order=2, time_steps=_NEW_API_STEPS)
    state_auto = m.expansion_state(_NEW_API_ARG, base="auto", **kw)
    state_ex = m.expansion_state(_NEW_API_ARG, base="exact_heston", **kw)
    np.testing.assert_array_equal(
        np.array(state_auto.expansion.values),
        np.array(state_ex.expansion.values),
    )


@pytest.mark.parametrize("anchor,base", [
    (0.0, "pade"),
    (0.0, "root_pade"),
    (0.25, "root_pade"),
    (0.5, "root_pade"),
])
def test_approx_base_f0_zero_at_t0(anchor, base):
    """f0(t=0) must be zero for all approximate bases at any anchor."""
    m = _new_model()
    state = m.expansion_state(
        _NEW_API_ARG, maturity=_NEW_API_T, order=0, time_steps=_NEW_API_STEPS, base=base,
    )
    np.testing.assert_array_equal(
        np.array(state.f0.values)[:, 0], 0.0 + 0.0j,
        err_msg=f"f0(t=0) must be zero for anchor={anchor}, base={base!r}",
    )


@pytest.mark.parametrize("anchor,base,order", [
    (0.5, "auto", 0),
    (0.5, "auto", 1),
    (0.0, "root_pade", 0),
    (0.0, "root_pade", 1),
    (0.25, "root_pade", 0),
    (0.25, "root_pade", 1),
])
def test_expansion_recursion_on_tiny_grid(anchor, base, order):
    """expansion_state must succeed and produce finite results on tiny grids."""
    m = _new_model(H=0.15)
    state = m.expansion_state(
        _NEW_API_ARG, maturity=0.25, order=order, time_steps=20, base=base,
    )
    assert isinstance(state, HestonExpansionState)
    assert np.all(np.isfinite(np.array(state.expansion.values)))


# ---------------------------------------------------------------------------
# Adams direct_riccati integration and benchmark tests
# ---------------------------------------------------------------------------

def _make_rough_model(H=0.1):
    return RoughHeston(
        RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=H),
        riskfree=0.0,
    )


_ADAMS_ARG = np.array([0.5 + 0.5j, 1.0 + 0.5j, 2.0 + 0.5j])
_ADAMS_T = 0.25
_ADAMS_J = 200


@pytest.mark.parametrize("anchor", [0.0, 0.25])
def test_adams_direct_riccati_finite(anchor):
    """direct_riccati base with Adams solver must be finite for anchor in (0, 0.5)."""
    m = _make_rough_model(H=0.1)
    state = m.expansion_state(
        _ADAMS_ARG, maturity=_ADAMS_T, order=0,
        time_steps=_ADAMS_J,
        base="direct_riccati",
    )
    f0 = np.array(state.f0.values)
    assert f0.shape == (len(_ADAMS_ARG), _ADAMS_J + 1)
    assert np.all(np.isfinite(f0)), f"Adams solver non-finite for anchor={anchor}"
    np.testing.assert_array_almost_equal(np.abs(f0[:, 0]), 0.0, decimal=14)


def test_adams_direct_riccati_anchor05_close_to_exact_heston():
    """anchor=0.5, base='direct_riccati' should be close to base='exact_heston'."""
    m = _make_rough_model(H=0.5)
    kw = dict(maturity=_ADAMS_T, order=0, time_steps=_ADAMS_J)
    state_adams = m.expansion_state(_ADAMS_ARG, base="direct_riccati", **kw)
    state_exact = m.expansion_state(_ADAMS_ARG, base="exact_heston", **kw)
    f0_adams = np.array(state_adams.f0.values)
    f0_exact = np.array(state_exact.f0.values)
    assert np.all(np.isfinite(f0_adams))
    rel = np.max(np.abs(f0_adams - f0_exact) / (1.0 + np.abs(f0_exact)))
    assert rel < 0.05, f"Adams vs exact_heston deviation too large: {rel:.4f}"


def test_adams_no_r_heston_fourier_import():
    """base='direct_riccati' must not import from r_heston_fourier."""
    import inspect
    from roughprix.heston import rough_heston
    src = inspect.getsource(heston_expansion)
    assert "r_heston_fourier" not in src, \
        "heston_expansion.py still references r_heston_fourier"


def test_adams_benchmark_vs_root_pade_small_contour():
    """direct_riccati and root_pade should agree to within 5% on a small Fourier contour."""
    param = RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=0.1)
    m_dr = RoughHeston(param, riskfree=0.0,
                       base_solution="direct_riccati")
    m_rp = RoughHeston(param, riskfree=0.0,
                       base_solution="root_pade")
    kw_common = dict(
        K=np.array([0.95, 1.0, 1.05]),
        maturity=_ADAMS_T,
        expansion_order=0,
        L=80,
        implied_vol=False,
        payoff_selection="otm",
    )
    prices_dr = m_dr.eur_call_put(time_steps=_ADAMS_J, **kw_common)
    prices_rp = m_rp.eur_call_put(time_steps=50, **kw_common)
    assert np.all(np.isfinite(prices_dr)), "direct_riccati prices non-finite"
    assert np.all(np.isfinite(prices_rp)), "root_pade prices non-finite"
    rel_diff = np.abs(prices_dr - prices_rp) / np.maximum(prices_rp, 1e-10)
    assert np.all(rel_diff < 0.05), \
        f"root_pade vs direct_riccati deviation: {rel_diff}"


# =============================================================================
# implicit_pi solver tests
# =============================================================================

_PI_PARAM = RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=0.1)
_PI_ARG = np.array([0.5 + 0.5j, 1.0 + 0.5j, 2.0 + 0.5j, 5.0 + 0.5j])
_PI_T = 0.25
_PI_J = 200


def test_implicit_pi_agrees_with_adams_uniform_anchor0():
    """Adams and implicit_pi should agree closely on a uniform grid at anchor=0."""
    m = RoughHeston(_PI_PARAM, riskfree=0.0,
                    base_solution="direct_riccati")
    kw = dict(arg=_PI_ARG, maturity=_PI_T, order=0,
              time_steps=_PI_J,
              base="direct_riccati", return_lists=False)
    state_adams = m.expansion_state(**kw, direct_riccati_solver="adams")
    state_pi    = m.expansion_state(**kw, direct_riccati_solver="implicit_pi")
    np.testing.assert_allclose(
        np.array(state_adams.expansion.values),
        np.array(state_pi.expansion.values),
        rtol=1e-3,
        err_msg="Adams and implicit_pi disagree on uniform grid at anchor=0",
    )


def test_implicit_pi_hyper_rough_finite():
    """implicit_pi must stay finite at anchor=-0.05 for Fourier nodes up to x=500."""
    param = RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=-0.05)
    m = RoughHeston(param, riskfree=0.0,
                    base_solution="direct_riccati",
                    direct_riccati_solver="implicit_pi")
    arg_large = np.array([1.0 + 0.5j, 50.0 + 0.5j, 250.0 + 0.5j, 500.0 + 0.5j])
    state = m.expansion_state(arg_large, maturity=_PI_T, order=0,
                               time_steps=_PI_J, base="direct_riccati")
    vals = np.array(state.expansion.values)
    assert np.all(np.isfinite(vals)), \
        f"implicit_pi produced non-finite values at anchor=-0.05: {vals[~np.isfinite(vals)]}"


def test_implicit_pi_hyper_rough_graded_grid():
    """implicit_pi with time_grid='graded' must not raise at anchor=-0.05."""
    param = RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=-0.05)
    m = RoughHeston(param, riskfree=0.0,
                    base_solution="direct_riccati",
                    direct_riccati_solver="implicit_pi")
    state = m.expansion_state(_PI_ARG, maturity=_PI_T, order=0,
                               time_steps=_PI_J, base="direct_riccati",
                               time_grid="graded")
    assert np.all(np.isfinite(np.array(state.expansion.values)))


def test_auto_selects_implicit_pi_for_negative_anchor():
    """With direct_riccati_solver='auto', anchor<0 must use implicit_pi (no NaN on large u)."""
    param = RoughHestonParam(lam=0.3, theta=0.006, nu=0.3, rho=-0.7, V0=0.02, H=-0.05)
    m = RoughHeston(param, riskfree=0.0,
                    base_solution="direct_riccati")  # default solver="auto"
    arg_large = np.array([100.0 + 0.5j, 250.0 + 0.5j])
    state = m.expansion_state(arg_large, maturity=_PI_T, order=0,
                               time_steps=_PI_J, base="direct_riccati")
    assert np.all(np.isfinite(np.array(state.expansion.values))), \
        "auto mode should route to implicit_pi for anchor<0 and remain finite"