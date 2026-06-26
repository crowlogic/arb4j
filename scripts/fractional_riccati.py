"""Fractional Riccati Müntz--Padé spectral-tau method, from first principles.

A pure-``mpmath`` reference implementation of every function described in the
``docs/`` directory for the constant-coefficient fractional Riccati equation

    D^mu y(t) = P + Q y(t) + R y(t)^2,      I^{1-mu} y(0) = 0,

resummed by the polynomial Chebyshev--Wheeler / diagonal Padé construction and
applied to the rough Heston characteristic function (El Euch--Rosenbaum, 2019).

The companion proven script ``bm_pricer.py`` supplies the Bakshi--Madan pricing
integral; this module supplies the characteristic function that feeds it.

Primary references (all in ``docs/``):
  * FractionalRiccatiSolutionMethodology.tex      -- the algorithmic spec
  * ThePadeMuntzSpectralTauMethodForConstantCoeffecientFractionalRiccations.tex
  * frmp_orthopoly.tex                            -- the validation oracles
  * native/pade_resolvent.c                       -- the C resolvent engine

Everything is evaluated over mpmath complex scalars at a fixed coefficient
value ``u`` (the Fourier variable in the rough Heston application), exactly as
``bm_pricer.py`` works with scalar complex arithmetic.  ``P``, ``Q``, ``R`` are
therefore passed already evaluated at ``u``.

Conventions
-----------
* A polynomial is a Python ``list`` of mpmath numbers, ``c[k]`` the coefficient
  of the monomial of degree ``k`` (ascending order).
* ``mu`` is the fractional order in ``(0, 1]`` for the base theory and may be
  any positive real for the ``mu > 1`` extension.
"""

from __future__ import annotations

from typing import List, Sequence

import mpmath as mp


# --------------------------------------------------------------------------- #
#  Polynomial helpers (ascending-degree coefficient lists)                    #
# --------------------------------------------------------------------------- #
def poly_trim(p: Sequence) -> List:
    """Drop trailing (high-degree) zero coefficients, keeping at least ``[0]``."""
    q = list(p)
    while len(q) > 1 and q[-1] == 0:
        q.pop()
    return q


def poly_add(a: Sequence, b: Sequence) -> List:
    n = max(len(a), len(b))
    out = [mp.mpf(0)] * n
    for i, c in enumerate(a):
        out[i] += c
    for i, c in enumerate(b):
        out[i] += c
    return out


def poly_scale(a: Sequence, s) -> List:
    return [s * c for c in a]


def poly_sub(a: Sequence, b: Sequence) -> List:
    return poly_add(a, poly_scale(b, mp.mpf(-1)))


def poly_shift(a: Sequence, k: int) -> List:
    """Multiply by ``x**k`` (i.e. ``arb_poly_shift_left``)."""
    return [mp.mpf(0)] * k + list(a)


def poly_mul(a: Sequence, b: Sequence) -> List:
    if not a or not b:
        return [mp.mpf(0)]
    out = [mp.mpf(0)] * (len(a) + len(b) - 1)
    for i, ai in enumerate(a):
        if ai == 0:
            continue
        for j, bj in enumerate(b):
            out[i + j] += ai * bj
    return out


def poly_eval(a: Sequence, x):
    """Horner evaluation of the polynomial at ``x``."""
    acc = mp.mpf(0)
    for c in reversed(list(a)):
        acc = acc * x + c
    return acc


def poly_coeff(a: Sequence, k: int):
    """Coefficient of ``x**k`` (zero past the stored degree)."""
    return a[k] if 0 <= k < len(a) else mp.mpf(0)


def reciprocal_flip(p: Sequence, n: int) -> List:
    """The reciprocal flip ``p^flat(z) = z**n p(1/z)`` (Definition: flip).

    For ``p(x) = sum_{k=0}^{n} c_k x**k`` returns ``sum_k c_k z**(n-k)``; ``n``
    must be at least ``deg p`` and selects the homogenising power of ``z``.
    """
    out = [mp.mpf(0)] * (n + 1)
    for k, c in enumerate(p):
        out[n - k] += c
    return out


# --------------------------------------------------------------------------- #
#  1.  Müntz--Tau coefficient sequence  (Lemma: Müntz--Tau expansion)         #
# --------------------------------------------------------------------------- #
def gamma_ratio(k: int, mu) -> mp.mpf:
    """The Müntz weight ``Gamma(k*mu + 1) / Gamma((k+1)*mu + 1)``."""
    return mp.gamma(k * mu + 1) / mp.gamma((k + 1) * mu + 1)


def muntz_tau_coefficients(P, Q, R, mu, K: int) -> List:
    """Coefficients ``a(1..K)`` of ``y(t) = sum_{k>=1} a(k) t**(k*mu)``.

    Implements

        a(1)   = P / Gamma(mu + 1)
        a(k+1) = [Gamma(k mu+1)/Gamma((k+1)mu+1)]
                 * ( Q a(k) + R sum_{j=1}^{k-1} a(j) a(k-j) ).

    The identity ``I^mu t^s = Gamma(s+1)/Gamma(s+mu+1) t**(s+mu)`` holds for
    every ``mu > 0``, so this recurrence (and hence the whole moment-only
    Chebyshev--Wheeler pipeline built on it) is valid for any ``mu > 0``,
    not just ``mu in (0, 1]`` (Theorem: Reduction -- the CW recurrence is
    "moment-only and oblivious to origin"; convergence for ``mu > 1`` remains
    conjectural per the source's Remark on conjectural status).

    Returns a list ``a`` with ``a[0]`` unused (set to 0) so that ``a[k]`` is the
    coefficient of ``t**(k*mu)`` for ``1 <= k <= K``.
    """
    if K < 1:
        return [mp.mpf(0)]
    a = [mp.mpf(0)] * (K + 1)
    a[1] = P / mp.gamma(mu + 1)
    for k in range(1, K):
        conv = mp.mpf(0)
        for j in range(1, k):
            conv += a[j] * a[k - j]
        a[k + 1] = gamma_ratio(k, mu) * (Q * a[k] + R * conv)
    return a


# --------------------------------------------------------------------------- #
#  2.  Moment functional and Hankel determinants                              #
# --------------------------------------------------------------------------- #
def moments(a: Sequence, num: int) -> List:
    """Moment sequence ``m(k) = a(k+1)`` for ``k = 0 .. num-1`` (Def: moment)."""
    return [a[k + 1] for k in range(num)]


def hankel_determinant(m: Sequence, n: int):
    """``H_n = det[ m(i+j) ]_{0<=i,j<n}`` (Def: Hankel), with ``H_0 = 1``."""
    if n == 0:
        return mp.mpf(1)
    M = mp.matrix(n, n)
    for i in range(n):
        for j in range(n):
            M[i, j] = m[i + j]
    return mp.det(M)


def reweight_moments(m: Sequence, mu, rho) -> List:
    """Fractional-integration reweighting (Corollary: arbitrary fractional int).

    ``I^rho y`` corresponds to moments
    ``m(k) * Gamma(k mu + 1) / Gamma(k mu + 1 + rho)``.  ``rho = 1`` is the
    integrated Riccati (Theorem: Integrated Riccati), ``rho = 1 - mu`` the
    rough-Heston term ``I^{1-mu} y``.
    """
    return [
        mk * mp.gamma(k * mu + 1) / mp.gamma(k * mu + 1 + rho)
        for k, mk in enumerate(m)
    ]


# --------------------------------------------------------------------------- #
#  3.  Polynomial Chebyshev--Wheeler recurrence (Theorem: Polynomial CW)      #
# --------------------------------------------------------------------------- #
def chebyshev_wheeler(m: Sequence, M: int):
    """Recurrence coefficients ``alpha(0..M-1)``, ``beta(1..M-1)`` from moments.

    Constructive form (Corollary: constructive).  The generating polynomials

        S(0, z) = sum_k m(k) z**k,     S(-1, z) = 1,
        S(n+1, z) = (S(n,z) - S(n,0)) / z - alpha(n) S(n,z) - beta(n) S(n-1,z)

    are built degree by degree; ``alpha(n)``, ``beta(n)`` are fixed by the
    divisibility constraint ``ord_z S(n+1,z) >= n+1`` (matching the ``z**(n-1)``
    and ``z**n`` coefficients).  No Hankel matrix is formed or inverted.

    Requires ``len(m) >= 2*M`` moments.  Returns ``(alpha, beta, S)`` where
    ``alpha[n]`` is defined for ``0 <= n < M``, ``beta[n]`` for ``1 <= n < M``
    (``beta[0]`` is unused, stored as 0), and ``S`` is the list of generating
    polynomials ``S[n]`` for ``n = 0 .. M``.
    """
    if len(m) < 2 * M:
        raise ValueError(f"need >= {2 * M} moments, got {len(m)}")

    S_prev = [mp.mpf(1)]                 # S(-1, z) = 1
    S_curr = [mp.mpmathify(c) for c in m]      # S(0, z)

    alpha = [mp.mpf(0)] * M
    beta = [mp.mpf(0)] * M
    S = [list(S_curr)]

    for n in range(M):
        # T(n, z) = (S(n,z) - S(n,0)) / z   (remove constant term, shift down)
        T = list(S_curr[1:]) if len(S_curr) > 1 else [mp.mpf(0)]

        # beta(n): kill the z**(n-1) coefficient of S(n+1).  For n == 0 there is
        # no z**(-1) constraint, so the S-recurrence and OPS use beta(0) = 0
        # (this is what makes alpha(0) = m(1)/m(0) come out correctly).  The
        # standard convention beta(0) = h(0) = m(0), needed only to seed the
        # second-kind recurrence P^(1)(1,x) = beta(0), is written back into the
        # returned array after the loop (it is read by nothing else).
        if n == 0:
            beta_n = mp.mpf(0)
        else:
            denom = poly_coeff(S_prev, n - 1)        # [z^{n-1}] S(n-1) = h(n-1)
            beta_n = poly_coeff(T, n - 1) / denom     # = h(n)/h(n-1)
        beta[n] = beta_n

        # alpha(n): kill the z**n coefficient of S(n+1).
        sn_n = poly_coeff(S_curr, n)                  # [z^n] S(n) = h(n)
        alpha_n = (poly_coeff(T, n) - beta_n * poly_coeff(S_prev, n)) / sn_n
        alpha[n] = alpha_n

        # S(n+1) = T - alpha(n) S(n) - beta(n) S(n-1)
        S_next = poly_sub(T, poly_scale(S_curr, alpha_n))
        S_next = poly_sub(S_next, poly_scale(S_prev, beta_n))

        S_prev, S_curr = S_curr, S_next
        S.append(list(S_curr))

    # Second-kind seed convention: beta(0) = h(0) = m(0).  Unused by the OPS,
    # the Jacobi matrix (beta(1..M-1)), or the Hankel comparison.
    if M >= 1:
        beta[0] = mp.mpmathify(m[0])

    return alpha, beta, S


def hankel_recurrence_coefficients(m: Sequence, M: int):
    """Reference ``alpha(n), beta(n)`` via direct moment Gram--Schmidt.

    An independent validator of :func:`chebyshev_wheeler` (Theorem: Equivalence
    to Hankel form / Proposition: Validation).  The monic orthogonal
    polynomials are built explicitly by Gram--Schmidt under the moment inner
    product ``<p,q> = sum_{i,j} p_i q_j m(i+j)``, and

        alpha(n) = <x P(n), P(n)> / <P(n), P(n)>,
        beta(n)  = <P(n), P(n)> / <P(n-1), P(n-1)>   (n >= 1),

    with the convention ``beta(0) = m(0)``.  This forms the polynomials and
    inner products explicitly -- the route the Chebyshev--Wheeler recurrence is
    designed to avoid -- so agreement certifies the fast recurrence.  Requires
    ``m[0 .. 2M-1]`` (the same ``2M`` moments the fast recurrence uses).
    """
    def ip(p, q):
        s = mp.mpf(0)
        for i, pi in enumerate(p):
            if pi == 0:
                continue
            for j, qj in enumerate(q):
                s += pi * qj * m[i + j]
        return s

    Ps: List[List] = []
    norms: List = []
    alpha = [mp.mpf(0)] * M
    beta = [mp.mpf(0)] * M

    for n in range(M):
        xn = [mp.mpf(0)] * n + [mp.mpf(1)]      # monic x^n
        Pn = list(xn)
        for j in range(n):
            coef = ip(xn, Ps[j]) / norms[j]
            Pn = poly_sub(Pn, poly_scale(Ps[j], coef))
        nn = ip(Pn, Pn)
        Ps.append(Pn)
        norms.append(nn)

        alpha[n] = ip(poly_shift(Pn, 1), Pn) / nn
        if n >= 1:
            beta[n] = nn / norms[n - 1]

    if M >= 1:
        beta[0] = mp.mpmathify(m[0])
    return alpha, beta


# --------------------------------------------------------------------------- #
#  4.  Orthogonal polynomials of the moment functional                        #
# --------------------------------------------------------------------------- #
def ops_polynomials(alpha: Sequence, beta: Sequence, M: int) -> List[List]:
    """Monic OPS ``P(n,x)``, ``0 <= n <= M`` (Definition: monic OPS).

        P(n+1,x) = (x - alpha(n)) P(n,x) - beta(n) P(n-1,x),
        P(-1,x) = 0,  P(0,x) = 1.
    """
    P = [None] * (M + 1)
    P_prev = [mp.mpf(0)]            # P(-1) = 0
    P_curr = [mp.mpf(1)]           # P(0)  = 1
    P[0] = list(P_curr)
    for n in range(M):
        # (x - alpha(n)) P(n)
        term = poly_shift(P_curr, 1)
        term = poly_sub(term, poly_scale(P_curr, alpha[n]))
        term = poly_sub(term, poly_scale(P_prev, beta[n]))
        P_prev, P_curr = P_curr, term
        P[n + 1] = list(P_curr)
    return P


def ops_second_kind(alpha: Sequence, beta: Sequence, M: int) -> List[List]:
    """Associated (second-kind) polynomials ``P^(1)(n,x)`` (Theorem: Padé num).

    Same three-term recurrence as the OPS but with seeds
    ``P^(1)(-1,x) = -1``, ``P^(1)(0,x) = 0``.  ``deg P^(1)(n) = n - 1``.
    """
    P = [None] * (M + 1)
    P_prev = [mp.mpf(-1)]          # P^(1)(-1) = -1
    P_curr = [mp.mpf(0)]          # P^(1)(0)  = 0
    P[0] = list(P_curr)
    for n in range(M):
        term = poly_shift(P_curr, 1)
        term = poly_sub(term, poly_scale(P_curr, alpha[n]))
        term = poly_sub(term, poly_scale(P_prev, beta[n]))
        P_prev, P_curr = P_curr, term
        P[n + 1] = list(P_curr)
    return P


# --------------------------------------------------------------------------- #
#  5.  Padé numerator/denominator and approximant                             #
# --------------------------------------------------------------------------- #
def pade_denominator(P_ops: Sequence, M: int) -> List:
    """``Qhat(M,z) = z**M P(M, 1/z)`` (Theorem: Padé denominator from OPS).

    ``P(M,x)`` is monic of degree ``M`` so the homogenising power is ``M`` and
    ``Qhat(0) = 1``.
    """
    return reciprocal_flip(P_ops[M], M)


def pade_numerator(P1_ops: Sequence, M: int) -> List:
    """``Phat(M,z) = z**(M-1) P^(1)(M, 1/z)`` (Theorem: Padé numerator).

    The associated polynomial ``P^(1)(M,x)`` has degree ``M-1`` (leading
    coefficient ``m(0) = a(1)``), so the homogenising power is ``M-1`` and
    ``Phat(0) = m(0)``.  This is exactly what cancels the ``z**1`` term of the
    Padé identity ``g Qhat - z Phat = O(z**(2M+2))`` (the diagonal ``[M/M]``
    approximant of ``g = z * S(0, .)``, with ``S(0,.)`` the Stieltjes series of
    the moments).
    """
    p = poly_trim(P1_ops[M])
    return reciprocal_flip(p, len(p) - 1)


def approximant_value(Phat: Sequence, Qhat: Sequence, z):
    """``Rhat(M,z) = z Phat(M,z) / Qhat(M,z)`` (Definition: approximant).

    This is the diagonal ``[M/M]`` Padé resummation of ``g(z) = sum a(k) z**k``;
    the fractional Riccati solution is ``y(t) = Rhat(M, t**mu)``.
    """
    return z * poly_eval(Phat, z) / poly_eval(Qhat, z)


def solve_fractional_riccati(P, Q, R, mu, M: int):
    """Full pipeline: return a callable ``t -> y_M(t)`` and the intermediates.

    Builds ``2M`` moments, runs Chebyshev--Wheeler, recovers the OPS pair and
    the diagonal Padé numerator/denominator, and returns
    ``(y, data)`` where ``y(t) = Rhat(M, t**mu)`` approximates the solution and
    ``data`` is a dict of every intermediate object for inspection/testing.
    """
    a = muntz_tau_coefficients(P, Q, R, mu, 2 * M + 1)
    g, data = pade_resum_from_coefficients(a, M)

    def y(t):
        return g(mp.power(t, mu))

    return y, data


def pade_resum_from_coefficients(a: Sequence, M: int):
    """Diagonal ``[M/M]`` Padé resummation of ``g(z) = sum_{k>=1} a(k) z**k``.

    Runs the polynomial Chebyshev--Wheeler recurrence on the moment functional
    ``m(k) = a(k+1)`` and returns ``(g_approx, data)`` where ``g_approx(z)`` is
    the rational approximant and ``data`` holds every intermediate.  ``a`` must
    have at least ``2M + 1`` usable coefficients (``a[1 .. 2M]``).
    """
    m = moments(a, 2 * M)
    alpha, beta, S = chebyshev_wheeler(m, M)
    P_ops = ops_polynomials(alpha, beta, M)
    P1_ops = ops_second_kind(alpha, beta, M)
    Qhat = pade_denominator(P_ops, M)
    Phat = pade_numerator(P1_ops, M)

    def g_approx(z):
        return approximant_value(Phat, Qhat, z)

    data = dict(a=list(a), m=m, alpha=alpha, beta=beta, S=S,
                P_ops=P_ops, P1_ops=P1_ops, Phat=Phat, Qhat=Qhat)
    return g_approx, data


def generating_series(a: Sequence, num: int) -> List:
    """The formal generator ``g(z) = sum_{k>=1} a(k) z**k`` truncated to ``num``."""
    g = [mp.mpf(0)] * (num + 1)
    for k in range(1, min(len(a), num + 1)):
        g[k] = a[k]
    return g


def pade_residual(a: Sequence, Phat: Sequence, Qhat: Sequence, M: int) -> List:
    """Coefficients of ``g(z) Qhat(z) - z Phat(z)`` (Theorem: Padé identity).

    Must vanish to order ``z**(2M+2)``: coefficients ``z**1 .. z**(2M+1)`` are
    all zero (Proposition: Validation).
    """
    g = generating_series(a, 2 * M + 1)
    lhs = poly_mul(g, Qhat)
    rhs = poly_shift(Phat, 1)            # z * Phat(z)
    return poly_sub(lhs, rhs)


# --------------------------------------------------------------------------- #
#  6.  Jacobi matrix and spectrum (Section: Jacobi matrix and spectrum)       #
# --------------------------------------------------------------------------- #
def jacobi_matrix(alpha: Sequence, beta: Sequence, M: int):
    """Non-symmetric tridiagonal ``J(M)`` (Definition: Jacobi matrix).

    Diagonal ``(alpha(0..M-1))``, super-diagonal all ones, sub-diagonal
    ``(beta(1..M-1))``.
    """
    J = mp.matrix(M, M)
    for i in range(M):
        J[i, i] = alpha[i]
    for i in range(M - 1):
        J[i, i + 1] = mp.mpf(1)
        J[i + 1, i] = beta[i + 1]
    return J


def jacobi_spectrum(alpha: Sequence, beta: Sequence, M: int) -> List:
    """Eigenvalues of ``J(M)`` = zeros of the OPS member ``P(M,x)`` (Thm: spectrum)."""
    J = jacobi_matrix(alpha, beta, M)
    E, _ = mp.eig(J)
    return list(E)


# --------------------------------------------------------------------------- #
#  7.  Corrigendum: the Gamma-ratio maximiser                                 #
# --------------------------------------------------------------------------- #
def gamma_ratio_maximiser():
    """Argmax over ``mu in (0,1]`` of ``Gamma(mu+1)/Gamma(2 mu+1)`` (Corrigendum).

    Solves ``psi(mu+1) - 2 psi(2 mu+1) = 0`` by Newton on the digamma equation.
    Returns ``(mu_star, value)``; the documented values are
    ``mu_star = 0.14503474316667...``, ``value = 1.03967510771...``.
    """
    f = lambda mu: mp.digamma(mu + 1) - 2 * mp.digamma(2 * mu + 1)
    mu_star = mp.findroot(f, mp.mpf("0.145"))
    value = mp.gamma(mu_star + 1) / mp.gamma(2 * mu_star + 1)
    return mu_star, value


# --------------------------------------------------------------------------- #
#  8.  Mittag-Leffler oracle (frmp_orthopoly: the R = 0 oracle)               #
# --------------------------------------------------------------------------- #
def mittag_leffler(alpha, beta, z, terms: int = 200):
    """Two-parameter Mittag-Leffler ``E_{alpha,beta}(z) = sum z^k/Gamma(alpha k + beta)``.

    Series evaluation; intended for the moderate arguments used in the closed-
    form unit tests (the ``R = 0`` oracle ``y(t) = (P/Q)(E_mu(Q t^mu) - 1)``).
    """
    total = mp.mpf(0)
    for k in range(terms):
        total += mp.power(z, k) / mp.gamma(alpha * k + beta)
    return total


def linear_riccati_closed_form(P, Q, mu, t):
    """Exact solution of ``D^mu y = P + Q y`` (the ``R = 0`` case).

        y(t) = (P/Q) (E_{mu,1}(Q t^mu) - 1).
    """
    return (P / Q) * (mittag_leffler(mu, mp.mpf(1), Q * mp.power(t, mu)) - 1)


# --------------------------------------------------------------------------- #
#  9.  Rough Heston characteristic function (Algorithm: Rough Heston via CW)  #
# --------------------------------------------------------------------------- #
def rough_heston_pqr(u, lam, nu, rho):
    """Map a Fourier argument ``u`` to ``(P, Q, R)`` (Theorem: El Euch--Rosenbaum).

        D^alpha h = 1/2 (-u^2 - i u) + (i u rho nu - lambda) h + 1/2 nu^2 h^2,
        (P, Q, R) = (1/2(-u^2 - i u), i u rho nu - lambda, 1/2 nu^2).
    """
    iu = mp.mpc(0, 1) * u
    P = mp.mpf("0.5") * (-u * u - iu)
    Q = iu * rho * nu - lam
    R = mp.mpf("0.5") * nu * nu
    return P, Q, R


def rough_heston_h(u, alpha, lam, nu, rho, M: int):
    """The Padé-resummed solution ``h(t,u)`` of the rough Heston Riccati.

    Returns a callable ``t -> h(t,u)`` (Algorithm step 5).
    """
    P, Q, R = rough_heston_pqr(u, lam, nu, rho)
    y, _ = solve_fractional_riccati(P, Q, R, alpha, M)
    return y


def rough_heston_cgf(u, alpha, T, V0, theta, lam, nu, rho, M: int):
    """Rough Heston cumulant generating function ``log phi_T(u)`` (Algorithm rH).

        log phi_T(u) = theta * int_0^T h(s,u) ds  +  V0 * I^{1-alpha} h(T,u).

    Both functionals of ``h`` are Padé-resummed (Algorithm rH steps 6--7) via
    the reweighted moment functionals (Theorem: Integrated Riccati, Corollary:
    arbitrary fractional integration), giving global convergence rather than a
    locally-convergent raw series:

        int_0^t h ds       = t       * G_b(t**alpha),  b(k) = a(k)/(k alpha + 1),
        I^{1-alpha} h(T,u) = T**(1-alpha) * G_c(T**alpha),
                             c(k) = a(k) Gamma(k alpha+1)/Gamma(k alpha+2-alpha),

    where ``G_b``, ``G_c`` are the diagonal ``[M/M]`` Padé resummations of
    ``sum_k b(k) z**k`` and ``sum_k c(k) z**k``.

    At ``alpha = 1`` this reduces to the classical Heston model; with the
    parameter dictionary ``theta = lambda * theta_Heston`` it reproduces
    ``bm_pricer.heston_logcf`` exactly (``I^0 h(T) = h(T) = `` the Heston ``D``,
    ``theta * int h = `` the Heston ``C``).
    """
    P, Q, R = rough_heston_pqr(u, lam, nu, rho)
    a = muntz_tau_coefficients(P, Q, R, alpha, 2 * M + 1)

    # Integrated Riccati: b(k) = a(k)/(k alpha + 1); int_0^T h = T * G_b(T^alpha)
    b = [mp.mpf(0)] * len(a)
    for k in range(1, len(a)):
        b[k] = a[k] / (k * alpha + 1)
    Gb, _ = pade_resum_from_coefficients(b, M)
    integral = T * Gb(mp.power(T, alpha))

    # Fractional integration rho_exp = 1 - alpha:
    #   c(k) = a(k) Gamma(k alpha+1)/Gamma(k alpha+1+rho_exp)
    #   I^{rho_exp} h(T) = T^{rho_exp} * G_c(T^alpha)
    rho_exp = 1 - alpha
    c = [mp.mpf(0)] * len(a)
    for k in range(1, len(a)):
        c[k] = a[k] * mp.gamma(k * alpha + 1) / mp.gamma(k * alpha + 1 + rho_exp)
    Gc, _ = pade_resum_from_coefficients(c, M)
    frac_int = mp.power(T, rho_exp) * Gc(mp.power(T, alpha))

    return theta * integral + V0 * frac_int


def rough_heston_phi(u, alpha, T, V0, theta, lam, nu, rho, M: int):
    """Rough Heston characteristic function ``phi_T(u) = exp(log phi_T(u))``.

    Drop-in replacement for ``bm_pricer.phi`` that works for any ``alpha`` in
    ``(0, 1]``; at ``alpha = 1`` it reduces to the classical Heston model.
    """
    return mp.exp(rough_heston_cgf(u, alpha, T, V0, theta, lam, nu, rho, M))


# --------------------------------------------------------------------------- #
#  10.  Tanh J-fraction resolvent (parity with native/pade_resolvent.c)       #
# --------------------------------------------------------------------------- #
def tanh_jfraction_value(z, steps: int = 8):
    """Reproduce the ``native/pade_resolvent.c`` smoke test in Python.

    The reciprocal J-fraction for ``tanh(z)/z`` has ``alpha_k = 0`` and
    ``beta_k = -1/((2k-1)(2k+1))``; the diagonal Padé convergent ``R_M(z)`` is
    built from the moment functional whose moments reproduce that J-fraction.

    Rather than re-deriving the moments we mirror the C reciprocal recurrence

        W_{M+1}(z) = (1 - alpha z) W_M(z) - beta z^2 W_{M-1}(z)

    directly on the numerator/denominator polynomials.
    """
    # P/Q recurrence in the reciprocal (Maclaurin) domain, as in pade_resolvent.c
    P_prev, Q_prev = [mp.mpf(0)], [mp.mpf(1)]      # P_0 = 0, Q_0 = 1
    P_curr, Q_curr = [mp.mpf(1)], [mp.mpf(1), mp.mpf(0)]  # P_1 = c0 = 1, Q_1 = 1 - 0*z
    for k in range(1, steps + 1):
        beta = mp.mpf(-1) / ((2 * k - 1) * (2 * k + 1))
        # W_{new} = W_curr - alpha z W_curr - beta z^2 W_prev ; alpha = 0
        Qn = poly_sub(Q_curr, poly_scale(poly_shift(Q_prev, 2), beta))
        Pn = poly_sub(P_curr, poly_scale(poly_shift(P_prev, 2), beta))
        P_prev, Q_prev = P_curr, Q_curr
        P_curr, Q_curr = Pn, Qn
    return poly_eval(P_curr, z) / poly_eval(Q_curr, z)


# --------------------------------------------------------------------------- #
#  Demo                                                                        #
# --------------------------------------------------------------------------- #
if __name__ == "__main__":
    mp.mp.dps = 40

    # Linear (R = 0) sanity check against the Mittag-Leffler closed form.
    P, Q, mu, M = mp.mpf("0.7"), mp.mpf("-1.3"), mp.mpf("0.6"), 24
    y, _ = solve_fractional_riccati(P, Q, mp.mpf(0), mu, M)
    t = mp.mpf("0.8")
    approx = y(t)
    exact = linear_riccati_closed_form(P, Q, mu, t)
    print(f"R=0 Padé   y({t}) = {mp.nstr(approx, 25)}")
    print(f"R=0 exact  y({t}) = {mp.nstr(exact, 25)}")
    print(f"abs error          = {mp.nstr(abs(approx - exact), 5)}")

    # Corrigendum maximiser.
    mu_star, value = gamma_ratio_maximiser()
    print(f"mu*   = {mp.nstr(mu_star, 20)}  (doc 0.14503474316667)")
    print(f"value = {mp.nstr(value, 20)}  (doc 1.03967510771)")
