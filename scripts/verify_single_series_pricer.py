"""Exact, quadrature-free verification of the single erfc--Hermite series pricer.

Verifies the load-bearing theorems of docs/single-series-pricing.md WITHOUT any
numerical integration. Every term integral is the EXACT erfc/Hermite node atom

    A_m(w*) = (1/2 pi i) int_{c-i inf}^{c+i inf} e^{g(w)}/(w-w*)^m dw
            = (1/(m-1)!) d^{m-1}/dw*^{m-1} E(w*),

    E(w*) = 1/2 e^{g(w*)} erfc(z_{w*}) - 1_{Re w*>c} e^{g(w*)},

evaluated through the closed Hermite form (frmp.tex Lemma dE):

    d^{m-1}_w E(w) = 1/2 e^{g(w)} P_{m-1}(w) erfc(z_w)
        + (e^{-xi^2/(2 sigma^2)}/sqrt(pi)) sum_{j=1}^{m-1} C(m-1,j) (sigma/sqrt2)^j
              P_{m-1-j}(w) H_{j-1}(z_w)
        - 1_{Re w>c} e^{g(w)} P_{m-1}(w),

with P_0=1, P_{k+1}=P_k' + (sigma^2 w - xi) P_k, and H_j the physicists' Hermite
polynomial. No mp.quad anywhere.

Correctness is certified by EXACT references only:
  (1) pole-free limit reproduces Black--Scholes exactly (single-series sec 8);
  (2) the with-poles price is independent of the free Cayley scale kappa
      (an exact internal identity: kappa is our arbitrary choice);
  (3) the a-priori geometric tail majorant (eq 7.2) actually bounds the
      truncation error.

This is a verification oracle (mpmath); the production code is Java/arb4j.
"""

from __future__ import annotations

import mpmath as mp

mp.mp.dps = 50
G = mp.gamma


# --------------------------------------------------------------------------
# Polynomial helpers (ascending-coefficient lists over mpc)
# --------------------------------------------------------------------------
def poly_deriv(p):
    return [k * p[k] for k in range(1, len(p))] or [mp.mpf(0)]


def poly_mul(a, b):
    out = [mp.mpf(0)] * (len(a) + len(b) - 1)
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            out[i + j] += ai * bj
    return out


def poly_eval(p, w):
    acc = mp.mpf(0)
    for coef in reversed(p):
        acc = acc * w + coef
    return acc


class ErfcHermiteAtoms:
    """Exact node atoms A_m(w*) for the Gaussian symbol g(w)=1/2 sigma^2 w^2 - w xi."""

    def __init__(self, sigma2, xi, c):
        self.sigma2 = sigma2
        self.sigma = mp.sqrt(sigma2)
        self.xi = xi
        self.c = c
        self.gprime = [-xi, sigma2]  # g'(w) = sigma^2 w - xi
        self._P = [[mp.mpf(1)]]  # P_0 = 1

    def g(self, w):
        return mp.mpf("0.5") * self.sigma2 * w * w - w * self.xi

    def z(self, w):
        return (self.xi - self.sigma2 * w) / (self.sigma * mp.sqrt(2))

    def P(self, k):
        while len(self._P) <= k:
            prev = self._P[-1]
            self._P.append(
                [a + b for a, b in zip_longest(poly_deriv(prev), poly_mul(self.gprime, prev))]
            )
        return self._P[k]

    def dE(self, w, order):
        """d^order/dw^order of E(w)."""
        m1 = order
        eg = mp.e ** self.g(w)
        zw = self.z(w)
        ind = mp.e ** self.g(w) if mp.re(w) > self.c else mp.mpf(0)
        term0 = mp.mpf("0.5") * eg * poly_eval(self.P(m1), w) * mp.erfc(zw)
        gauss = mp.e ** (-self.xi ** 2 / (2 * self.sigma2)) / mp.sqrt(mp.pi)
        s = mp.mpf(0)
        for j in range(1, m1 + 1):
            s += (
                mp.binomial(m1, j)
                * (self.sigma / mp.sqrt(2)) ** j
                * poly_eval(self.P(m1 - j), w)
                * mp.hermite(j - 1, zw)
            )
        return term0 + gauss * s - ind * poly_eval(self.P(m1), w)

    def A(self, m, w):
        """A_m(w) = (1/(m-1)!) d^{m-1} E(w)."""
        return self.dE(w, m - 1) / mp.factorial(m - 1)


def zip_longest(a, b):
    n = max(len(a), len(b))
    a = list(a) + [mp.mpf(0)] * (n - len(a))
    b = list(b) + [mp.mpf(0)] * (n - len(b))
    return list(zip(a, b))


# --------------------------------------------------------------------------
# Single-series pricer (exact: atoms + Cayley exp recurrence)
# --------------------------------------------------------------------------
def term_integral(atoms, n, delta, kappa, q):
    """T_n^{(delta)} = (1/2 pi i) int e^{g(w)} zeta(w)^n/(w-delta) dw, exact via atoms.

    zeta(w)^n = sum_{k=0}^n C(n,k) (2 kappa)^k (w-q)^{-k}; partial-fraction each
    1/[(w-q)^k (w-delta)] over the simple node delta and the order-k node q.
    """
    total = atoms.A(1, delta)  # k=0 term
    for k in range(1, n + 1):
        binom = mp.binomial(n, k) * (2 * kappa) ** k
        # principal part at q: sum_{m=1}^k (-1)^{k-m}/(q-delta)^{k-m+1} A_m(q)
        s = mp.mpf(0)
        for m in range(1, k + 1):
            s += (mp.mpf(-1)) ** (k - m) / (q - delta) ** (k - m + 1) * atoms.A(m, q)
        s += (mp.mpf(1) / (delta - q) ** k) * atoms.A(1, delta)  # simple pole at delta
        total += binom * s
    return total


def cayley_q_coeffs(r_func, c, kappa, q, N):
    """q_n: Maclaurin coeffs of Psi(zeta)=exp(r(w(zeta))) via exact exp recurrence.

    r_m from the rational R(zeta)=r(w(zeta)) (here by exact Taylor of the closed
    rational form); then q_0=e^{r_0}, n q_n = sum_{m=1}^n m r_m q_{n-m}.
    """
    w_of_zeta = lambda z: c - kappa * (1 + z) / (1 - z)
    rcoef = mp.taylor(lambda z: r_func(w_of_zeta(z)), 0, N)
    q = [mp.e ** rcoef[0]]
    for n in range(1, N + 1):
        s = mp.fsum(m * rcoef[m] * q[n - m] for m in range(1, n + 1))
        q.append(s / n)
    return q, rcoef


def price_series(sigma2, muT, ktil, rT, K, poles, kappa, N):
    xi = ktil + muT
    c = mp.mpf("1") + (min(mp.re(u) for u, _ in poles) - 1) / 2 if poles else mp.mpf("1.5")
    q_node = c + kappa
    atoms = ErfcHermiteAtoms(sigma2, xi, c)
    r_func = (lambda w: mp.fsum(B / (w - u) for u, B in poles)) if poles else (lambda w: mp.mpf(0))
    qn, rcoef = cayley_q_coeffs(r_func, c, kappa, q_node, N)
    disc = K * mp.e ** (-rT)
    partials = []
    acc = mp.mpf(0)
    for n in range(N + 1):
        t1 = term_integral(atoms, n, mp.mpf(1), kappa, q_node)
        t0 = term_integral(atoms, n, mp.mpf(0), kappa, q_node)
        acc += qn[n] * (t1 - t0)
        partials.append(disc * acc)
    return partials, qn


def black_scholes(S0, K, r, T, sigma2):
    sigmaT = mp.sqrt(sigma2)
    Nf = lambda x: mp.mpf("0.5") * mp.erfc(-x / mp.sqrt(2))
    d1 = (mp.log(S0 / K) + r * T) / sigmaT + sigmaT / 2
    d2 = d1 - sigmaT
    return S0 * Nf(d1) - K * mp.e ** (-r * T) * Nf(d2)


def main():
    S0 = mp.mpf("100")
    K = mp.mpf("110")
    rT = mp.mpf("0.03")
    sigma2 = mp.mpf("0.6")
    muT = mp.mpf("0.5") * sigma2  # martingale centring
    ktil = mp.log(K / S0) - rT
    N = 45

    print("EXACT verification (no numerical integration anywhere)")
    print("=" * 64)

    # (1) Pole-free limit must equal Black-Scholes EXACTLY.
    partials, qn = price_series(sigma2, muT, ktil, rT, K, poles=[], kappa=mp.mpf("1"), N=4)
    C_bs = black_scholes(S0, K, rT / 1, 1, sigma2)  # rT already absolute; T folded into sigma2
    # Reconstruct BS with explicit r,T: use r=0, T=1 so rT consistent -> use direct form
    C_bs = S0 * (mp.mpf("0.5") * mp.erfc(-((mp.log(S0 / K) + rT) / mp.sqrt(sigma2) + mp.sqrt(sigma2) / 2) / mp.sqrt(2))) \
        - K * mp.e ** (-rT) * (mp.mpf("0.5") * mp.erfc(-((mp.log(S0 / K) + rT) / mp.sqrt(sigma2) - mp.sqrt(sigma2) / 2) / mp.sqrt(2)))
    print("(1) pole-free single series == Black-Scholes (exact reference)")
    print(f"    C_series = {mp.nstr(partials[-1], 20)}")
    print(f"    C_BS     = {mp.nstr(C_bs, 20)}")
    print(f"    |diff|   = {float(abs(partials[-1] - C_bs)):.2e}")

    # (2) With poles: price is INDEPENDENT of the free Cayley scale kappa.
    poles = [
        (mp.mpc("2.5", "0.3"), mp.mpc("0.5", "0.2")),
        (mp.mpc("2.5", "-0.3"), mp.mpc("0.5", "-0.2")),
        (mp.mpc("4.1", "0.7"), mp.mpc("-0.3", "0.1")),
        (mp.mpc("4.1", "-0.7"), mp.mpc("-0.3", "-0.1")),
    ]
    pa, qa = price_series(sigma2, muT, ktil, rT, K, poles, kappa=mp.mpf("1"), N=N)
    pb, qb = price_series(sigma2, muT, ktil, rT, K, poles, kappa=mp.mpf("1.6"), N=N)
    print("\n(2) with-poles price independent of free Cayley scale kappa (exact identity)")
    print(f"    C(kappa=1.0) = {mp.nstr(pa[-1], 18)}")
    print(f"    C(kappa=1.6) = {mp.nstr(pb[-1], 18)}")
    print(f"    |diff|       = {float(abs(pa[-1] - pb[-1])):.2e}")

    # (3) a-priori geometric tail majorant (eq 7.2) bounds the truncation error.
    # On the contour |zeta(w)|=1, so |T_n^{(delta)}| <= G_delta uniformly in n
    # (a finite constant); the operative control is the geometric decay of |q_n|,
    # and sum_{n>N} |q_n| * G is an a-priori upper bound on |S_N - C|.
    print("\n(3) a-priori tail majorant sum_{n>N}|q_n|*G bounds actual error (kappa=1.0)")
    Cfinal = pa[-1]
    G = atom_contour_bound(sigma2, ktil + muT, mp.mpf("1") + (mp.mpf("2.5") - 1) / 2)
    # asymptotic Cauchy ratio R^-1 = limsup |q_{n+1}/q_n|, read from the tail
    tail_ratio = abs(qa[N]) ** (mp.mpf(1) / N) if qa[N] != 0 else mp.mpf(0)
    print(f"    asymptotic |q_n|^(1/n) -> R^-1 ~ {float(tail_ratio):.3f}  (<1 required)")
    for Ncut in (5, 10, 20, 30):
        actual = abs(pa[Ncut] - Cfinal)
        majorant = mp.fsum(abs(qa[n]) for n in range(Ncut + 1, N + 1)) * G
        ok = "OK" if majorant >= actual else "VIOLATED"
        print(f"    N={Ncut:2d}  actual |S_N-C|={float(actual):.2e}  majorant={float(majorant):.2e}  [{ok}]")


def atom_contour_bound(sigma2, xi, c):
    """G_delta upper bound: |T_n^{(delta)}| <= (1/2pi) int |e^{g(c+it)}|/|c-delta+it| dt
    <= e^{sigma^2 c^2/2 - c xi}/(sigma sqrt(2 pi) |c-delta|), elementary (eq 7.2),
    here for delta in {0,1} take the larger (delta=1, |c-1|) ; closed form, no quad."""
    sigma = mp.sqrt(sigma2)
    base = mp.e ** (sigma2 * c ** 2 / 2 - c * xi) / (sigma * mp.sqrt(2 * mp.pi))
    return base * (1 / abs(c - 1) + 1 / abs(c))


if __name__ == "__main__":
    main()
