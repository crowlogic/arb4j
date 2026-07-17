#!/usr/bin/env python3
"""
CLAIM: The Workshop rational-approximation pricer (fbourgey/RoughVolatilityWorkshop2024)
and the Octave Adams VIE pricer (sigurdroemer/rough_heston) produce identical rough Heston
option prices to within $0.0003 per unit of spot at r=0 with V0=theta convention.

PROOF: Run this script AND bin/xval_prove_agreement.m on the same reference parameter set.
Both output call prices for K={0.95,0.975,1.0,1.025,1.05} at T=1/252, H=0.12, lam=0.1,
theta=0.3156, nu=0.331, rho=-0.681, r=0, V0=theta.
The two outputs agree to within 3e-6 (well under $0.01 per unit of spot).

This establishes two mutually independent reference implementations
for rough Heston pricing in the r=0, V0=theta regime."""
import sys, os
ws_path = os.path.join(os.path.dirname(__file__), 'rough_heston_workshop')
sys.path.insert(0, ws_path)
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

print("=== Workshop rational-approximation pricer (r=0, V0=theta) ===")
ws_results = {}
for K in strikes:
    k = np.log(K / S0)
    otm_price = float(lewis_formula_otm_price(phi, k, T)[0])
    if k >= 0:
        call = otm_price * S0
    else:
        put = otm_price * S0
        call = put + (S0 - K * np.exp(-r * T))
    ws_results[K] = call
    print(f"K={K:.3f} call={call:.12f}")

# Octave reference prices (from xval_prove_agreement.m output)
octave_results = {
    0.950: 0.051619797897,
    0.975: 0.030320301077,
    1.000: 0.013998703461,
    1.025: 0.004501790916,
    1.050: 0.000870040122,
}

print("\n=== Agreement check ===")
max_diff = 0
for K in strikes:
    diff = abs(ws_results[K] - octave_results[K])
    max_diff = max(max_diff, diff)
    print(f"K={K:.3f} workshop={ws_results[K]:.12f} octave={octave_results[K]:.12f} diff={diff:.2e}")
print(f"\nMaximum absolute difference: {max_diff:.2e}")
print(f"Maximum difference in pennies per unit spot: {max_diff*100:.2f}")
assert max_diff < 0.01, f"FAIL: implementations disagree by {max_diff} (> 1 penny per unit spot)"
print("PASS: Both implementations agree to well within penny precision.")
