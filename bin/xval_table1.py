#!/usr/bin/env python3
"""Cross-validate: workshop rational-approximation pricer vs published Table 1."""
import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'rough_heston_workshop'))
import numpy as np
from rough_heston import phi_rheston_rational
from utils import lewis_formula_otm_price

S0 = 1; T = 1/252; H = 0.12; lam = 0.1; theta = 0.3156
nu = 0.331; rho = -0.681; r = 0
strikes = [0.95, 0.975, 1.0, 1.025, 1.05]

params = {'nu': nu, 'H': H, 'lbd': lam, 'rho': rho}
xi_curve = lambda t: np.full_like(t, theta)

def phi(u, tau):
    return phi_rheston_rational(u, tau, params, xi_curve, n_pade=4, n_quad=30)

print('=== Workshop rational-approximation pricer — Reference Table 1 ===')
print(f'Parameters: S0={S0}, T={T:.6f}, H={H}, α={H+0.5}, λ={lam}, ρ={rho},')
print(f'            θ={theta}, ν={nu}, V₀={theta} (V₀=θ), r={r}')
print(f'Strike\tCall\t\t\tPut')
for K in strikes:
    k = np.log(K / S0)
    otm_price = float(lewis_formula_otm_price(phi, k, T)[0])
    if k >= 0:
        call = otm_price * S0
        put = call - (S0 - K * np.exp(-r * T))
    else:
        put = otm_price * S0
        call = put + (S0 - K * np.exp(-r * T))
    print(f'{K:.3f}\t{call:.12f}\t{put:.12f}')
