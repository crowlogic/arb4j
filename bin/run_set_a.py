#!/usr/bin/env python3
import sys, os
ws_path = os.path.join(os.path.dirname(__file__), 'rough_heston_workshop')
sys.path.insert(0, ws_path)
import numpy as np
from rough_heston import phi_rheston_rational
from utils import lewis_formula_otm_price

S0, K, T, H, lam, theta, nu, rho, r = 100, 100, 1, 0.3, 2, 0.04, 0.3, -0.7, 0.1
params = {'nu': nu, 'H': H, 'lbd': lam, 'rho': rho}
xi_curve = lambda t: np.full_like(t, theta)
def phi(u, tau):
    return phi_rheston_rational(u, tau, params, xi_curve, n_pade=4, n_quad=30)
k = np.log(K / S0)
otm_price = float(lewis_formula_otm_price(phi, k, T)[0])
if k >= 0:
    call = otm_price * S0
    put = call - (S0 - K * np.exp(-r * T))
else:
    put = otm_price * S0
    call = put + (S0 - K * np.exp(-r * T))
print(f'workshop rational-approx pricer:')
print(f'call={call:.12f} put={put:.12f}')
