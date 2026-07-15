"""
Generate reference constants for BorelPadeEiPlusTest.java.

Requires: pip install mpmath

Usage:
    python3 scripts/borel_pade_reference.py
"""
from mpmath import mp, e1, exp

mp.dps = 60

print("E1_1       =", e1(1))
print("E1_2       =", e1(2))
print("e2         =", exp(2))
print("prod       =", exp(2) * e1(2))
print("E1_1p05_re =", e1(1 + 0.5j).real)
print("E1_1p05_im =", e1(1 + 0.5j).imag)
