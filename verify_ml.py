#!/usr/bin/env python3
"""
Mittag-Leffler E_{alpha,beta}(z) Reference Value Generator
Uses mpmath for arbitrary precision computation
"""

from mpmath import mp
mp.dps = 120  # 120 decimal places

def mittag_leffler_series(z, alpha, beta, max_terms=100000):
    """Compute E_{alpha,beta}(z) via series expansion"""
    z = mp.mpc(z) if isinstance(z, complex) or hasattr(z, 'imag') else mp.mpf(z)
    alpha = mp.mpf(alpha)
    beta = mp.mpf(beta)
    
    result = mp.mpc(0) if isinstance(z, mp.mpc) else mp.mpf(0)
    z_power = mp.mpc(1) if isinstance(z, mp.mpc) else mp.mpf(1)
    
    for k in range(max_terms):
        term = z_power / mp.gamma(alpha * k + beta)
        result += term
        if k > 20 and abs(term) < mp.eps * abs(result):
            break
        z_power *= z
    return result

def mittag_leffler_E1(z, beta):
    """
    E_{1,beta}(z) exact closed form:
    E_{1,beta}(z) = z^(1-beta) * exp(z) * gamma_inc(beta-1, 0, z) / Gamma(beta-1)
    where gamma_inc(s, 0, z) is lower incomplete gamma
    """
    s = beta - 1
    return z**(1-beta) * mp.exp(z) * mp.gammainc(s, 0, z) / mp.gamma(s)

# Test cases
tests = [
    # (name, z, alpha, beta, method)
    ("E_{1,1}(2)=exp(2)", mp.mpf('2'), mp.mpf('1'), mp.mpf('1'), 'exp'),
    ("E_{0.5,1}(0.5)", mp.mpf('0.5'), mp.mpf('0.5'), mp.mpf('1'), 'series'),
    ("E_{0.75,1}(1+2i)", mp.mpc(1, 2), mp.mpf('0.75'), mp.mpf('1'), 'series'),
    ("E_{0.9,1}(-5)", mp.mpf('-5'), mp.mpf('0.9'), mp.mpf('1'), 'series'),
    ("E_{0.8,2.0}(0.2)", mp.mpf('0.2'), mp.mpf('0.8'), mp.mpf('2.0'), 'series'),
    ("E_{0.6,0.7}(2-i)", mp.mpc(2, -1), mp.mpf('0.6'), mp.mpf('0.7'), 'series'),
    ("E_{0.8,0.5}(80)", mp.mpf('80'), mp.mpf('0.8'), mp.mpf('0.5'), 'series'),
    ("E_{0.9,1.3}(0.25)", mp.mpf('0.25'), mp.mpf('0.9'), mp.mpf('1.3'), 'series'),
    ("E_{1.0,2.5}(80)", mp.mpf('80'), mp.mpf('1.0'), mp.mpf('2.5'), 'E1_exact'),
    ("E_{1.0,0.5}(80)", mp.mpf('80'), mp.mpf('1.0'), mp.mpf('0.5'), 'E1_exact'),
]

print("Mittag-Leffler Reference Values (mpmath verification)")
print("=" * 80)

for name, z, alpha, beta, method in tests:
    if method == 'exp':
        result = mp.exp(z)
    elif method == 'E1_exact':
        result = mittag_leffler_E1(z, beta)
    else:  # series
        result = mittag_leffler_series(z, alpha, beta)
    
    print(f"\n{name}")
    if isinstance(result, mp.mpc) and abs(result.imag) > mp.mpf('1e-100'):
        print(f"  Re: {mp.nstr(result.real, 80)}")
        print(f"  Im: {mp.nstr(result.imag, 80)}")
    else:
        print(f"  {mp.nstr(result.real if isinstance(result, mp.mpc) else result, 80)}")

print("\n" + "=" * 80)
print("All values computed successfully!")
