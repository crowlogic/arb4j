#!/usr/bin/env python3
"""Run workshop pricer on reference grid, output CSV."""
import sys, os, csv, time
ws_path = os.path.join(os.path.dirname(__file__), 'rough_heston_workshop')
sys.path.insert(0, ws_path)
import numpy as np
from rough_heston import phi_rheston_rational
from utils import lewis_formula_otm_price

S0 = 1.0

def ws_call(S0, K, T, H, lam, theta, nu, rho):
    params = {'nu': nu, 'H': H, 'lbd': lam, 'rho': rho}
    xi_curve = lambda t: np.full_like(t, theta)
    def phi(u, tau):
        return phi_rheston_rational(u, tau, params, xi_curve, n_pade=4, n_quad=30)
    k = np.log(K / S0)
    otm_price = float(lewis_formula_otm_price(phi, k, T)[0])
    if k >= 0:
        return otm_price * S0
    else:
        put = otm_price * S0
        return put + (S0 - K)

# Grid
models = [
    ("M1", 0.12, 0.1,  0.3156, 0.331, -0.681),
    ("M2", 0.30, 2.0,  0.04,   0.3,   -0.7),
]
expiries = [1/252, 1/52, 1.0]
strikes  = [0.8, 0.9, 0.95, 1.0, 1.05, 1.1, 1.2]

print("case_id,model,H,lam,theta,nu,rho,T,K,ws_call")
for label, H, lam, theta, nu, rho in models:
    for T in expiries:
        for K in strikes:
            t0 = time.time()
            c = ws_call(S0, K, T, H, lam, theta, nu, rho)
            case = f"{label}_T{T}_K{K:.3f}"
            print(f"{case},{label},{H},{lam},{theta},{nu},{rho},{T:.8f},{K:.3f},{c:.12f}")
            elapsed = time.time() - t0
            sys.stderr.write(f"{case}: {elapsed:.1f}s\n")
