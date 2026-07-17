#!/usr/bin/env python3
"""Generate consensus reference price table for r=0, V0=theta regime.
Octave Adams VIE and Workshop rational-approx must agree to within $0.01
per unit spot for each row to be admitted."""
import sys, os, json
ws_path = os.path.join(os.path.dirname(__file__), 'rough_heston_workshop')
sys.path.insert(0, ws_path)
import numpy as np
from rough_heston import phi_rheston_rational
from utils import lewis_formula_otm_price

# Octave reference prices (run gen_ref_table.m and paste output)
OCTAVE_FILE = os.path.join(os.path.dirname(__file__), 'ref_table_octave_output.txt')

def workshop_price(S0, K, T, H, lam, theta, nu, rho):
    params = {'nu': nu, 'H': H, 'lbd': lam, 'rho': rho}
    xi_curve = lambda t: np.full_like(t, theta)
    def phi(u, tau):
        return phi_rheston_rational(u, tau, params, xi_curve, n_pade=4, n_quad=30)
    k = np.log(K / S0)
    otm_price = float(lewis_formula_otm_price(phi, k, T)[0])
    if k >= 0:
        call = otm_price * S0
    else:
        put = otm_price * S0
        call = put + (S0 - K * np.exp(0))  # r=0
    return call

# Parameter grid: V0=theta, r=0
model_sets = [
    # (H, lam, theta, nu, rho, label)
    (0.12, 0.1,  0.3156, 0.331, -0.681, "M1"),
    (0.30, 2.0,  0.04,   0.3,   -0.7,   "M2"),
    (0.05, 0.5,  0.1,    0.2,   -0.5,   "M3"),
    (0.45, 1.0,  0.2,    0.4,   -0.8,   "M4"),
]

expiries = [1/252, 1/52, 0.25, 0.5, 1.0]
strikes  = [0.7, 0.8, 0.9, 0.95, 1.0, 1.05, 1.1, 1.2, 1.3]

S0 = 1.0
tol = 0.01  # penny tolerance per unit spot

print("REFERENCE\tMODEL\tH\tlam\ttheta\tnu\trho\tT\tK\tOctave\tWorkshop\tDiff\tConsensus")
for H, lam, theta, nu, rho, label in model_sets:
    for T in expiries:
        for K in strikes:
            ws = workshop_price(S0, K, T, H, lam, theta, nu, rho)
            print(f"{label}\t{H}\t{lam}\t{theta}\t{nu}\t{rho}\t{T:.6f}\t{K:.3f}\tWS:{ws:.12f}\tPEND\tPEND")
