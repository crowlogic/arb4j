"""Unit tests for :mod:`fractional_riccati`.

Every function of the fractional Riccati Müntz--Padé spectral-tau stack is
validated against an independent closed-form oracle or an independent solver:

  * Müntz--Tau coefficients   -> the R=0 closed form a(k)=P Q^{k-1}/Gamma(k mu+1)
                                 and an mpmath ODE solve at integer order.
  * Chebyshev--Wheeler        -> the classical Hankel-determinant route.
  * OPS                       -> orthogonality L[P(n,x) x^k] = 0, k < n.
  * Second-kind / Padé        -> the Padé identity g Qhat - z Phat = O(z^{2M+1}).
  * Approximant               -> the Mittag-Leffler closed form (R=0 oracle).
  * Jacobi spectrum           -> the zeros of the OPS member P(M,x).
  * Corrigendum               -> the documented maximiser mu* and value.
  * Tanh J-fraction           -> parity with native/pade_resolvent.c.
  * Rough Heston              -> the classical Heston model (bm_pricer.py) at
                                 alpha = 1, and an independent ODE solve.

Run with:  pytest scripts/test_fractional_riccati.py
"""

import mpmath as mp
import pytest

import fractional_riccati as fr
import bm_pricer as bm


# Work at high precision so the closed-form comparisons are meaningful.
mp.mp.dps = 50


def amax(values):
    return max(abs(v) for v in values)


# --------------------------------------------------------------------------- #
#  Polynomial helpers                                                         #
# --------------------------------------------------------------------------- #
def test_poly_ops_basic():
    a = [mp.mpf(1), mp.mpf(2), mp.mpf(3)]      # 1 + 2x + 3x^2
    b = [mp.mpf(0), mp.mpf(1)]                 # x
    assert fr.poly_eval(a, mp.mpf(2)) == 1 + 4 + 12
    assert fr.poly_eval(fr.poly_add(a, b), mp.mpf(2)) == 17 + 2
    assert fr.poly_eval(fr.poly_mul(a, b), mp.mpf(2)) == 2 * 17
    assert fr.poly_eval(fr.poly_shift(a, 2), mp.mpf(2)) == 4 * 17


def test_reciprocal_flip():
    # p(x) = 2 + 3x + 5x^2  ->  z^2 p(1/z) = 2 z^2 + 3 z + 5
    p = [mp.mpf(2), mp.mpf(3), mp.mpf(5)]
    flat = fr.reciprocal_flip(p, 2)
    assert [int(c) for c in flat] == [5, 3, 2]


# --------------------------------------------------------------------------- #
#  Müntz--Tau coefficient sequence                                            #
# --------------------------------------------------------------------------- #



def test_muntz_tau_quadratic_against_ode_integer_order():
    """mu = 1: a(k) are the Taylor coefficients of the Riccati ODE solution."""
    P, Q, R = mp.mpf("0.5"), mp.mpf("-0.3"), mp.mpf("0.2")
    a = fr.muntz_tau_coefficients(P, Q, R, mp.mpf(1), 16)
    f = lambda t, y: P + Q * y + R * y * y
    y = mp.odefun(f, 0, mp.mpf(0))
    t = mp.mpf("0.35")
    series = sum(a[k] * t ** k for k in range(1, 16))
    assert abs(series - y(t)) < mp.mpf("1e-15")


def test_muntz_tau_convolution_closure():
    """The convolution term keeps everything finite and matches a direct sum."""
    P, Q, R, mu = mp.mpf("1.1"), mp.mpf("0.4"), mp.mpf("-0.6"), mp.mpf("0.8")
    a = fr.muntz_tau_coefficients(P, Q, R, mu, 6)
    # Reconstruct a[4] directly from the recurrence definition.
    k = 3
    conv = sum(a[j] * a[k - j] for j in range(1, k))
    expected = fr.gamma_ratio(k, mu) * (Q * a[k] + R * conv)
    assert abs(a[k + 1] - expected) < mp.mpf("1e-45")


@pytest.mark.parametrize("mu", [mp.mpf("0.6"), mp.mpf("1.5"), mp.mpf("2.5")])
def test_muntz_tau_linear_holds_for_all_mu(mu):
    """R = 0: a(k) = P Q^{k-1}/Gamma(k mu + 1) for any mu > 0 (Theorem: Reduction)."""
    P, Q = mp.mpf("0.7"), mp.mpf("-1.3")
    a = fr.muntz_tau_coefficients(P, Q, mp.mpf(0), mu, 12)
    for k in range(1, 13):
        exact = P * Q ** (k - 1) / mp.gamma(k * mu + 1)
        assert abs(a[k] - exact) < mp.mpf("1e-44")


def test_solve_riccati_mu_gt_1_mittag_leffler():
    """The full Padé pipeline converges for mu > 1 in the R = 0 case."""
    P, Q, mu = mp.mpf("0.7"), mp.mpf("-1.3"), mp.mpf("1.5")
    t = mp.mpf("0.6")
    exact = fr.linear_riccati_closed_form(P, Q, mu, t)
    y, _ = fr.solve_fractional_riccati(P, Q, mp.mpf(0), mu, 20)
    assert abs(y(t) - exact) < mp.mpf("1e-30")


# --------------------------------------------------------------------------- #
#  Moments and Hankel determinants                                            #
# --------------------------------------------------------------------------- #
def test_moments_and_hankel_small():
    m = [mp.mpf(2), mp.mpf(3), mp.mpf(5), mp.mpf(8)]
    assert fr.hankel_determinant(m, 0) == 1
    assert fr.hankel_determinant(m, 1) == 2
    # H_2 = det[[2,3],[3,5]] = 1
    assert fr.hankel_determinant(m, 2) == 2 * 5 - 3 * 3


def test_reweight_moments_integrated():
    """rho = 1: reweighting by 1/(k mu + 1) is the integrated-Riccati map."""
    mu = mp.mpf("0.6")
    m = [mp.mpf(k + 1) for k in range(5)]
    rm = fr.reweight_moments(m, mu, mp.mpf(1))
    for k in range(5):
        assert abs(rm[k] - m[k] / (k * mu + 1)) < mp.mpf("1e-45")


# --------------------------------------------------------------------------- #
#  Chebyshev--Wheeler vs Hankel                                               #
# --------------------------------------------------------------------------- #
@pytest.mark.parametrize("mu", [mp.mpf("0.5"), mp.mpf("0.85"), mp.mpf(1)])
def test_chebyshev_wheeler_matches_hankel(mu):
    """alpha(n) and beta(n>=1) agree with the Hankel-determinant route."""
    P, Q, R = mp.mpf("0.7"), mp.mpf("-0.9"), mp.mpf("0.4")
    M = 8
    # The Hankel route forms H up to H_{M+1}, needing moments m[0 .. 2M].
    a = fr.muntz_tau_coefficients(P, Q, R, mu, 2 * M + 2)
    m = fr.moments(a, 2 * M + 1)
    alpha_cw, beta_cw, _ = fr.chebyshev_wheeler(m, M)
    alpha_h, beta_h = fr.hankel_recurrence_coefficients(m, M)
    assert amax([alpha_cw[n] - alpha_h[n] for n in range(M)]) < mp.mpf("1e-30")
    assert amax([beta_cw[n] - beta_h[n] for n in range(1, M)]) < mp.mpf("1e-30")
    # beta(n) also equals the Hankel-determinant ratio H_{n+1} H_{n-1} / H_n^2,
    # which validates hankel_determinant.
    H = [fr.hankel_determinant(m, n) for n in range(M + 1)]
    for n in range(1, M):
        ratio = H[n + 1] * H[n - 1] / H[n] ** 2
        assert abs(beta_cw[n] - ratio) < mp.mpf("1e-30")


# --------------------------------------------------------------------------- #
#  Orthogonal polynomials                                                      #
# --------------------------------------------------------------------------- #
def test_ops_orthogonality():
    """L[P(n,x) x^k] = 0 for 0 <= k < n, where L[x^j] = m(j)."""
    P, Q, R, mu = mp.mpf("0.6"), mp.mpf("-0.7"), mp.mpf("0.5"), mp.mpf("0.75")
    M = 6
    a = fr.muntz_tau_coefficients(P, Q, R, mu, 2 * M + 1)
    m = fr.moments(a, 2 * M)
    alpha, beta, _ = fr.chebyshev_wheeler(m, M)
    P_ops = fr.ops_polynomials(alpha, beta, M)

    def L(poly):
        return sum(c * m[j] for j, c in enumerate(poly))

    for n in range(1, M + 1):
        for k in range(n):
            xkPn = fr.poly_mul(P_ops[n], fr.poly_shift([mp.mpf(1)], k))
            assert abs(L(xkPn)) < mp.mpf("1e-28")


def test_second_kind_divided_difference():
    """P^(1)(n,x) = L_y[(P(n,x)-P(n,y))/(x-y)] (Theorem: Padé numerator)."""
    P, Q, R, mu = mp.mpf("0.6"), mp.mpf("-0.7"), mp.mpf("0.5"), mp.mpf("0.75")
    M = 5
    a = fr.muntz_tau_coefficients(P, Q, R, mu, 2 * M + 1)
    m = fr.moments(a, 2 * M)
    alpha, beta, _ = fr.chebyshev_wheeler(m, M)
    P_ops = fr.ops_polynomials(alpha, beta, M)
    P1_ops = fr.ops_second_kind(alpha, beta, M)

    n = M
    Pn = P_ops[n]
    x = mp.mpf("1.7")
    # L_y[(Pn(x) - Pn(y))/(x - y)] = sum_j Pn[j] * sum_{i<j} x^i m(j-1-i)
    val = mp.mpf(0)
    for j, cj in enumerate(Pn):
        for i in range(j):
            val += cj * x ** i * m[j - 1 - i]
    assert abs(val - fr.poly_eval(P1_ops[n], x)) < mp.mpf("1e-28")


# --------------------------------------------------------------------------- #
#  Padé identity and approximant                                              #
# --------------------------------------------------------------------------- #
@pytest.mark.parametrize("M", [4, 8, 12])
def test_pade_identity_vanishes(M):
    """g Qhat - z Phat = O(z^{2M+1}): coefficients z^1 .. z^{2M} vanish."""
    P, Q, R, mu = mp.mpf("0.7"), mp.mpf("-1.1"), mp.mpf("0.5"), mp.mpf("0.6")
    _, d = fr.solve_fractional_riccati(P, Q, R, mu, M)
    res = fr.pade_residual(d["a"], d["Phat"], d["Qhat"], M)
    assert amax([res[i] for i in range(1, 2 * M + 1)]) < mp.mpf("1e-30")


def test_approximant_converges_to_mittag_leffler():
    """R = 0: the [M/M] approximant converges to (P/Q)(E_mu(Q t^mu) - 1)."""
    P, Q, mu = mp.mpf("0.7"), mp.mpf("-1.3"), mp.mpf("0.6")
    t = mp.mpf("0.8")
    exact = fr.linear_riccati_closed_form(P, Q, mu, t)
    prev = None
    for M in (6, 12, 24):
        y, _ = fr.solve_fractional_riccati(P, Q, mp.mpf(0), mu, M)
        err = abs(y(t) - exact)
        if prev is not None:
            assert err < prev          # monotone Padé convergence
        prev = err
    assert err < mp.mpf("1e-40")


def test_mittag_leffler_series():
    """E_{1,1}(z) = exp(z) and E_{2,1}(z) = cosh(sqrt(z))."""
    z = mp.mpf("0.9")
    assert abs(fr.mittag_leffler(mp.mpf(1), mp.mpf(1), z) - mp.e ** z) < mp.mpf("1e-40")
    assert abs(fr.mittag_leffler(mp.mpf(2), mp.mpf(1), z) - mp.cosh(mp.sqrt(z))) < mp.mpf("1e-40")


# --------------------------------------------------------------------------- #
#  Jacobi matrix and spectrum                                                 #
# --------------------------------------------------------------------------- #
def test_jacobi_spectrum_equals_ops_zeros():
    """sigma(J(M)) = { x : P(M,x) = 0 } as multisets."""
    P, Q, R, mu = mp.mpf("0.6"), mp.mpf("-0.5"), mp.mpf("0.3"), mp.mpf("0.7")
    M = 6
    a = fr.muntz_tau_coefficients(P, Q, R, mu, 2 * M + 1)
    m = fr.moments(a, 2 * M)
    alpha, beta, _ = fr.chebyshev_wheeler(m, M)
    P_ops = fr.ops_polynomials(alpha, beta, M)

    eig = fr.jacobi_spectrum(alpha, beta, M)
    # The eigenvalues must be roots of P(M,x): evaluate the OPS at each.
    for lam in eig:
        assert abs(fr.poly_eval(P_ops[M], lam)) < mp.mpf("1e-20")


def test_pole_locus_reciprocal_of_spectrum():
    """Poles of Rhat (zeros of Qhat) are reciprocals of sigma(J(M))."""
    P, Q, R, mu = mp.mpf("0.6"), mp.mpf("-0.5"), mp.mpf("0.3"), mp.mpf("0.7")
    M = 6
    _, d = fr.solve_fractional_riccati(P, Q, R, mu, M)
    eig = fr.jacobi_spectrum(d["alpha"], d["beta"], M)
    for lam in eig:
        # 1/lam must be a zero of Qhat (a pole of the approximant).
        assert abs(fr.poly_eval(d["Qhat"], 1 / lam)) < mp.mpf("1e-18")


# --------------------------------------------------------------------------- #
#  Corrigendum                                                                #
# --------------------------------------------------------------------------- #
def test_corrigendum_maximiser():
    mu_star, value = fr.gamma_ratio_maximiser()
    assert abs(mu_star - mp.mpf("0.14503474316667")) < mp.mpf("1e-12")
    assert abs(value - mp.mpf("1.03967510771")) < mp.mpf("1e-10")
    # It is a genuine maximum: neighbours are smaller.
    f = lambda mu: mp.gamma(mu + 1) / mp.gamma(2 * mu + 1)
    assert f(mu_star) > f(mu_star + mp.mpf("0.01"))
    assert f(mu_star) > f(mu_star - mp.mpf("0.01"))


# --------------------------------------------------------------------------- #
#  Tanh J-fraction (parity with native/pade_resolvent.c)                      #
# --------------------------------------------------------------------------- #
def test_tanh_jfraction_matches_native_smoke_test():
    """Reproduce the pade_resolvent.c smoke test: R(0.5) ~ tanh(0.5)/0.5."""
    z = mp.mpf("0.5")
    approx = fr.tanh_jfraction_value(z, steps=8)
    exact = mp.tanh(z) / z
    assert abs(approx - exact) < mp.mpf("1e-15")


# --------------------------------------------------------------------------- #
#  Rough Heston                                                               #
# --------------------------------------------------------------------------- #
HESTON = dict(
    V0=mp.mpf("0.04"), theta=mp.mpf("0.04"), lam=mp.mpf("1.0"),
    nu=mp.mpf("0.3"), rho=mp.mpf("-0.7"),
)
T = mp.mpf("0.25")


def test_rough_heston_pqr_matches_riccati():
    """The (P,Q,R) map yields the El Euch--Rosenbaum Riccati coefficients."""
    u = mp.mpf("1.3")
    P, Q, R = fr.rough_heston_pqr(u, HESTON["lam"], HESTON["nu"], HESTON["rho"])
    iu = mp.mpc(0, 1) * u
    assert abs(P - mp.mpf("0.5") * (-u * u - iu)) < mp.mpf("1e-45")
    assert abs(Q - (iu * HESTON["rho"] * HESTON["nu"] - HESTON["lam"])) < mp.mpf("1e-45")
    assert abs(R - mp.mpf("0.5") * HESTON["nu"] ** 2) < mp.mpf("1e-45")


@pytest.mark.parametrize("u", [mp.mpf("0.5"), mp.mpf("1.3"), mp.mpf("3.0")])
def test_rough_heston_h_matches_ode_at_alpha_one(u):
    """At alpha = 1 the Padé Riccati solution h(t,u) matches an ODE solve."""
    P, Q, R = fr.rough_heston_pqr(u, HESTON["lam"], HESTON["nu"], HESTON["rho"])
    y, _ = fr.solve_fractional_riccati(P, Q, R, mp.mpf(1), 20)
    f = lambda t, h: P + Q * h + R * h * h
    h = mp.odefun(f, 0, mp.mpf(0))
    assert abs(y(T) - h(T)) < mp.mpf("1e-25")


@pytest.mark.parametrize("u", [mp.mpf("0.5"), mp.mpf("1.3"), mp.mpf("3.0")])
def test_rough_heston_cgf_reduces_to_classical_heston(u):
    """alpha = 1 with theta_EE = lambda * theta_Heston reproduces bm_pricer."""
    cgf = fr.rough_heston_cgf(
        u, mp.mpf(1), T, HESTON["V0"],
        HESTON["lam"] * HESTON["theta"],
        HESTON["lam"], HESTON["nu"], HESTON["rho"], M=20,
    )
    ref = bm.heston_logcf(u, T, HESTON["V0"], HESTON["theta"],
                          HESTON["lam"], HESTON["nu"], HESTON["rho"])
    assert abs(cgf - ref) < mp.mpf("1e-25")


def test_rough_heston_price_bridges_bm_pricer():
    """Bakshi--Madan price with the Padé CF (alpha=1) equals the closed-form CF."""
    S0 = K = mp.mpf("100")
    r = mp.mpf("0")

    def phi_pade(v, T_):
        return fr.rough_heston_phi(
            v, mp.mpf(1), T_, HESTON["V0"], HESTON["lam"] * HESTON["theta"],
            HESTON["lam"], HESTON["nu"], HESTON["rho"], M=18,
        )

    params = (HESTON["V0"], HESTON["theta"], HESTON["lam"],
              HESTON["nu"], HESTON["rho"])
    phi_closed = lambda v, T_: bm.phi(v, T_, params)

    C_pade = bm.bakshi_madan_call(S0, K, r, T, phi_pade)
    C_closed = bm.bakshi_madan_call(S0, K, r, T, phi_closed)
    assert abs(C_pade - C_closed) < mp.mpf("1e-10")
