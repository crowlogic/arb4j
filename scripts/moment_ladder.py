#!/usr/bin/env python3
"""
Evaluate the Theta-warped Stieltjes moments mu_n from Theorem 2 of
docs/MomentRHCriterion.tex directly, and compute the Hankel determinant
ladder det H_N^R with mu_n^R := Re mu_n.

Closed form (with the sign fix: minus absorbed into the definition of h):

  mu_n = - (-i)^n * n! / Theta_1^(n+1/2)
         * sum over (a,b,c,k_3,k_5,...) with
             a + b + 2c + sum_{l>=1} 2l*k_{2l+1} = n
           of:
             (i^a * zeta_a / a!)
             * (i^b / b!) * M_b
             * (prod_{j=0..c-1}(-eps-j) / c!) * N_{2c}
             * (prod_{j=0..K-1}(-(n+1)-j) / K!)
             * prod_{l>=1} (1/k_{2l+1}!) * (Theta_{2l+1} / ((2l+1)! * Theta_1))^k_{2l+1}

with K = sum_l k_{2l+1}, and

  M_b   = sum over (m_1,m_3,...) with sum_{l>=0}(2l+1) m_{2l+1} = b of
            (b! / prod m_{2l+1}!) * prod ( Theta_{2l+1} / (2l+1)! )^m_{2l+1}
  N_{2c}= same with b replaced by 2c.

Here zeta_a := zeta^(a)(1/2), Theta_k := Theta^(k)(0).
Theta(t) = theta(t) + C t, so Theta_1 = theta'(0) + C and Theta_{2l+1} = theta^(2l+1)(0)
for l >= 1 (the C t term only affects Theta_1).
"""

from __future__ import annotations
import sys
from mpmath import mp, mpc, mpf, zeta, psi, log, pi, sqrt, fac, re, im

mp.dps = 60  # decimal digits


# ---------------------------------------------------------------------------
# Taylor data
# ---------------------------------------------------------------------------

def zeta_deriv_at_half(a: int) -> mpc:
    """zeta^(a)(1/2)."""
    return zeta(mpf(1) / 2, derivative=a)


def theta_odd_derivative_at_zero(k: int) -> mpf:
    """theta^(k)(0) for k >= 1 odd. (Even derivatives vanish.)

    theta(t) = arg Gamma(1/4 + i t/2) - (log pi / 2) t
             = Im log Gamma(1/4 + i t/2) - (log pi / 2) t
    Expanding log Gamma around 1/4:
      log Gamma(1/4 + z) = log Gamma(1/4) + psi(1/4) z
                          + (psi'(1/4)/2) z^2 + (psi''(1/4)/6) z^3 + ...
                          = log Gamma(1/4) + sum_{m>=1} psi^(m-1)(1/4) z^m / m!
    With z = i t / 2:
      log Gamma(1/4 + i t / 2) = log Gamma(1/4)
                                + sum_{m>=1} psi^(m-1)(1/4) * (i t / 2)^m / m!
    Imaginary part, coefficient of t^k / k! : for each m >= 1 the term
    psi^(m-1)(1/4) * (i/2)^m / m! * t^m contributes
    (k!/m!) * Im[(i/2)^m] * psi^(m-1)(1/4)  when m == k.
    Im[(i/2)^m] = (1/2^m) * Im[i^m], which is (1/2^m) if m ≡ 1 (mod 4),
    -(1/2^m) if m ≡ 3 (mod 4), 0 for even m. So only odd k contribute.

    theta^(k)(0) = k! * Im[coeff of t^k in series]
                 = k! * (1/2^k) * s(k) * psi^(k-1)(1/4) / k!
                 = (s(k) / 2^k) * psi^(k-1)(1/4)       for k odd >= 1

    where s(k) = +1 if k ≡ 1 (mod 4), -1 if k ≡ 3 (mod 4).

    Additionally for k = 1 we subtract (log pi)/2 from theta'(0).
    """
    if k <= 0 or k % 2 == 0:
        return mpf(0)
    sign = 1 if (k % 4 == 1) else -1
    val = mpf(sign) / mpf(2) ** k * psi(k - 1, mpf(1) / 4)
    if k == 1:
        val -= log(pi) / 2
    return val


def Theta_odd_derivative_at_zero(k: int, C: mpf) -> mpf:
    """Theta^(k)(0) with Theta(t) = theta(t) + C t.

    For k == 1: theta'(0) + C.
    For k >= 2: theta^(k)(0) (the linear term C*t does not contribute).
    """
    base = theta_odd_derivative_at_zero(k)
    if k == 1:
        return base + C
    return base


# ---------------------------------------------------------------------------
# Integer partitions with restricted part sizes
# ---------------------------------------------------------------------------

def partitions_into_odd_parts(b: int):
    """Yield tuples (m_1, m_3, m_5, ...) with sum (2l+1)*m_{2l+1} = b, trailing zeros trimmed."""
    # odd parts up to b
    odd_parts = [p for p in range(1, b + 1, 2)]
    current = [0] * len(odd_parts)

    def rec(idx: int, remaining: int):
        if idx == len(odd_parts):
            if remaining == 0:
                yield tuple(current)
            return
        p = odd_parts[idx]
        max_count = remaining // p
        for count in range(max_count + 1):
            current[idx] = count
            yield from rec(idx + 1, remaining - count * p)
        current[idx] = 0

    yield from rec(0, b)


def compositions_with_constraint(n: int, C_val: mpf, eps: mpf, Theta: list):
    """Yield tuples (a, b, c, k3, k5, ...) with a + b + 2c + sum_{l>=1} 2l k_{2l+1} = n,
       where (k3, k5, ...) are k_{2l+1} for l = 1, 2, ...
    """
    # Max index for k_{2l+1}: 2l <= n => l <= n/2, so l in 1..n//2.
    L_max = n // 2
    ks = [0] * L_max  # ks[l-1] = k_{2l+1} for l = 1..L_max

    def rec_k(l: int, remaining: int):
        # l: current l index (1-based). Fill ks[l-1].
        if l > L_max:
            # Now enumerate (a, b, c) with a + b + 2c = remaining, a,b,c >= 0.
            for c in range(remaining // 2 + 1):
                r2 = remaining - 2 * c
                for b in range(r2 + 1):
                    a = r2 - b
                    yield (a, b, c, tuple(ks))
            return
        weight = 2 * l  # cost per unit of k_{2l+1}
        max_count = remaining // weight
        for count in range(max_count + 1):
            ks[l - 1] = count
            yield from rec_k(l + 1, remaining - count * weight)
        ks[l - 1] = 0

    yield from rec_k(1, n)


# ---------------------------------------------------------------------------
# M_b and N_{2c}
# ---------------------------------------------------------------------------

def M_or_N(q: int, Theta: list) -> mpf:
    """Compute
         sum over (m_1, m_3, ...) with sum (2l+1) m_{2l+1} = q of
           (q! / prod m_{2l+1}!) * prod (Theta_{2l+1} / (2l+1)!)^{m_{2l+1}}
       Same definition for M_b (q=b) and N_{2c} (q=2c).
    """
    if q == 0:
        return mpf(1)
    total = mpf(0)
    q_fac = fac(q)
    for parts in partitions_into_odd_parts(q):
        # parts[i] is m_{2i+1}, i = 0..len-1
        term = q_fac
        denom = mpf(1)
        for i, m in enumerate(parts):
            if m == 0:
                continue
            two_l_plus_1 = 2 * i + 1
            # (Theta_{2l+1} / (2l+1)!)^m / m!
            base = Theta[two_l_plus_1]  # Theta_{2l+1}
            term *= (base / fac(two_l_plus_1)) ** m
            denom *= fac(m)
        term /= denom
        total += term
    return total


# ---------------------------------------------------------------------------
# mu_n via Theorem 2
# ---------------------------------------------------------------------------

def mu_n(n: int, C_val: mpf, eps: mpf, zeta_der: dict, Theta: list) -> mpc:
    """Evaluate the nth Theta-warped Stieltjes moment."""
    Theta_1 = Theta[1]
    prefac = -((mpc(0, -1)) ** n) * fac(n) / (Theta_1 ** (mpf(n) + mpf(1) / 2))

    total = mpc(0)
    for a, b, c, ks in compositions_with_constraint(n, C_val, eps, Theta):
        # term 1: i^a * zeta_a / a!
        t1 = (mpc(0, 1) ** a) * zeta_der[a] / fac(a)
        # term 2: i^b / b! * M_b
        t2 = (mpc(0, 1) ** b) / fac(b) * M_or_N(b, Theta)
        # term 3: prod_{j=0..c-1}(-eps - j) / c! * N_{2c}
        t3_num = mpf(1)
        for j in range(c):
            t3_num *= (-eps - j)
        t3 = t3_num / fac(c) * M_or_N(2 * c, Theta)
        # term 4: prod_{j=0..K-1}(-(n+1) - j) / K!
        K = sum(ks)
        t4_num = mpf(1)
        for j in range(K):
            t4_num *= (-(n + 1) - j)
        t4 = t4_num / fac(K)
        # term 5: prod_l (1/k_{2l+1}!) * (Theta_{2l+1} / ((2l+1)! Theta_1))^k
        t5 = mpf(1)
        for l_minus_1, k in enumerate(ks):
            if k == 0:
                continue
            two_l_plus_1 = 2 * (l_minus_1 + 1) + 1  # l = l_minus_1 + 1, so 2l+1 = 2(l_minus_1+1)+1
            t5 *= mpf(1) / fac(k) * (Theta[two_l_plus_1] / (fac(two_l_plus_1) * Theta_1)) ** k

        total += t1 * t2 * t3 * t4 * t5

    return prefac * total


# ---------------------------------------------------------------------------
# Driver
# ---------------------------------------------------------------------------

def main():
    # Parameters
    C_val = mpf(3)
    eps   = mpf(1)
    N_max = 5  # compute mu_0 .. mu_{2*N_max} = mu_0..mu_10 so det H_N up to N = N_max

    # Precompute Taylor data up to the needed order
    total_moments = 2 * N_max + 1  # mu_0..mu_{2 N_max}
    max_a = 2 * N_max              # zeta_a for a = 0..2 N_max
    zeta_der = {a: zeta_deriv_at_half(a) for a in range(max_a + 1)}

    # Theta[k] for k = 0..(2 N_max + 1). We need up to Theta_{2l+1} with 2l+1 <= n, n <= 2 N_max.
    max_k = 2 * N_max + 1
    Theta = [mpf(0)] * (max_k + 1)
    for k in range(1, max_k + 1):
        Theta[k] = Theta_odd_derivative_at_zero(k, C_val)

    print(f"C = {C_val}, eps = {eps}, precision = {mp.dps} digits")
    print(f"Theta_1 = {Theta[1]}")
    print(f"Theta_3 = {Theta[3]}")
    print(f"Theta_5 = {Theta[5]}")
    print(f"zeta(1/2)    = {zeta_der[0]}")
    print(f"zeta'(1/2)   = {zeta_der[1]}")
    print(f"zeta''(1/2)  = {zeta_der[2]}")
    print(f"zeta'''(1/2) = {zeta_der[3]}")
    print()

    # Compute moments
    mus = []
    for n in range(total_moments):
        m = mu_n(n, C_val, eps, zeta_der, Theta)
        mus.append(m)
        print(f"mu_{n} = {m}")
    print()

    # Real parts
    mu_R = [re(m) for m in mus]
    for n, x in enumerate(mu_R):
        print(f"mu_{n}^R = {x}")
    print()

    # Hankel determinants
    # det H_N^R for N = 0..N_max
    for N in range(N_max + 1):
        H = [[mu_R[i + j] for j in range(N + 1)] for i in range(N + 1)]
        d = det_matrix(H)
        print(f"det H_{N}^R = {d}   (sign: {'+' if d > 0 else ('-' if d < 0 else '0')})")

    # Ratios
    print()
    print("Ratios det H_{N+1}^R / det H_N^R:")
    prev = None
    for N in range(N_max + 1):
        H = [[mu_R[i + j] for j in range(N + 1)] for i in range(N + 1)]
        d = det_matrix(H)
        if prev is not None and prev != 0:
            ratio = d / prev
            print(f"  N={N}: det H_{N}/det H_{N-1} = {ratio}")
        prev = d


def det_matrix(A):
    """Determinant via mp-precision LU with partial pivoting. Returns an mpf."""
    n = len(A)
    M = [row[:] for row in A]
    sign = mpf(1)
    for i in range(n):
        # pivot
        piv = i
        for r in range(i + 1, n):
            if abs(M[r][i]) > abs(M[piv][i]):
                piv = r
        if M[piv][i] == 0:
            return mpf(0)
        if piv != i:
            M[i], M[piv] = M[piv], M[i]
            sign = -sign
        for r in range(i + 1, n):
            f = M[r][i] / M[i][i]
            for c in range(i, n):
                M[r][c] -= f * M[i][c]
    prod = sign
    for i in range(n):
        prod *= M[i][i]
    return prod


if __name__ == "__main__":
    main()
