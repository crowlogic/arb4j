#!/usr/bin/env python3
"""Rough Heston pricer via fbourgey/RoughVolatilityWorkshop2024 (Padé-based).

Usage:
  price_european.py S0 K T H lambda theta nu rho r

Prints: call_price put_price
"""
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from rough_heston import phi_rheston_rational
from utils import lewis_formula_otm_price

S0 = float(sys.argv[1]); K = float(sys.argv[2]); T = float(sys.argv[3])
H = float(sys.argv[4]); lam = float(sys.argv[5]); theta = float(sys.argv[6])
nu = float(sys.argv[7]); rho = float(sys.argv[8]); r = float(sys.argv[9])

params = {'nu': nu, 'H': H, 'lbd': lam, 'rho': rho}
xi_curve = lambda t: np.full_like(t, theta)

def phi(u, tau):
    return phi_rheston_rational(u, tau, params, xi_curve, n_pade=4, n_quad=30)

k = np.log(K / S0)
otm_price = float(lewis_formula_otm_price(phi, k, T)[0])

# Lewis formula returns prices normalized to S0=1, scale back
if k >= 0:
    call = otm_price * S0
    put = call - (S0 - K * np.exp(-r * T))
else:
    put = otm_price * S0
    call = put + (S0 - K * np.exp(-r * T))

print(f"{call:.12f} {put:.12f}")
