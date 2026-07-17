#!/usr/bin/env python3
"""Collate Octave + Workshop outputs into consensus reference table."""
import sys, os, re, subprocess, tempfile

ws_path = os.path.join(os.path.dirname(__file__), 'rough_heston_workshop')
sys.path.insert(0, ws_path)
import numpy as np
from rough_heston import phi_rheston_rational
from utils import lewis_formula_otm_price

S0 = 1.0
TOL = 0.01  # penny per unit spot

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

models = [
    ("M1", 0.12, 0.1,  0.3156, 0.331, -0.681),
    ("M2", 0.30, 2.0,  0.04,   0.3,   -0.7),
]
expiries = [1/252, 1/52, 1.0]
strikes  = [0.8, 0.9, 0.95, 1.0, 1.05, 1.1, 1.2]

# Octave results (manually collected from run_ref_grid.m output)
# Format: (model, T, K) -> (call, put)
octave = {
    # M1
    ("M1", 1/252, 0.8):   (0.200000023709, 0.000000023709),
    ("M1", 1/252, 0.9):   (0.100080915319, 0.000080915319),
    ("M1", 1/252, 0.95):  (0.051619797897, 0.001619797897),
    ("M1", 1/252, 1.0):   (0.013998703461, 0.013998703461),
    ("M1", 1/252, 1.05):  (0.000870040122, 0.050870040122),
    ("M1", 1/252, 1.1):   (0.000004078533, 0.100004078533),
    ("M1", 1/252, 1.2):   (0.000000000096, 0.200000000096),
    # M1 T=1/52
    ("M1", 1/52, 0.8):    (0.200263769881, 0.000263769881),
    ("M1", 1/52, 0.9):    (0.104278915156, 0.004278915156),
    ("M1", 1/52, 0.95):   (0.062663016960, 0.012663016960),
    ("M1", 1/52, 1.0):    (0.030648121076, 0.030648121076),
    ("M1", 1/52, 1.05):   (0.011171492421, 0.061171492421),
    ("M1", 1/52, 1.1):    (0.002748633544, 0.102748633544),
    ("M1", 1/52, 1.2):    (0.000038474584, 0.200038474584),
    # M1 T=1.0
    ("M1", 1.0, 0.8):     (0.312685197989, 0.112685197989),
    ("M1", 1.0, 0.9):     (0.256804260921, 0.156804260921),
    ("M1", 1.0, 0.95):    (0.231774108929, 0.181774108929),
    ("M1", 1.0, 1.0):     (0.208623063109, 0.208623063109),
    ("M1", 1.0, 1.05):    (0.187290570654, 0.237290570654),
    ("M1", 1.0, 1.1):     (0.167706468203, 0.267706468203),
    ("M1", 1.0, 1.2):     (0.133465334289, 0.333465334289),
    # M2 T=1/252
    ("M2", 1/252, 0.8):   (0.200000000000, 0.000000000000),
    ("M2", 1/252, 0.9):   (0.100000000004, 0.000000000004),
    ("M2", 1/252, 0.95):  (0.050001578180, 0.000001578180),
    ("M2", 1/252, 1.0):   (0.005001857014, 0.005001857014),
    # M2 T=1/52
    ("M2", 1/52, 0.8):    (0.200000000936, 0.000000000936),
    ("M2", 1/52, 0.9):    (0.100016976626, 0.000016976626),
    ("M2", 1/52, 0.95):   (0.050708925769, 0.000708925769),
    ("M2", 1/52, 1.0):    (0.010928379218, 0.010928379218),
    ("M2", 1/52, 1.05):   (0.000146575313, 0.050146575313),
    ("M2", 1/52, 1.1):    (0.000000014345, 0.100000014345),
    ("M2", 1/52, 1.2):    (0.000000000017, 0.200000000017),
    # M2 T=1.0
    ("M2", 1.0, 0.8):     (0.216548543407, 0.016548543407),
    ("M2", 1.0, 0.9):     (0.137923653663, 0.037923653663),
    ("M2", 1.0, 0.95):    (0.104530076366, 0.054530076366),
    ("M2", 1.0, 1.0):     (0.075934018150, 0.075934018150),
    ("M2", 1.0, 1.05):    (0.052527792763, 0.097527792763),
    ("M2", 1.0, 1.1):     (0.034377824479, 0.134377824479),
    ("M2", 1.0, 1.2):     (0.012209223712, 0.212209223712),
}

print("# Reference price table: rough Heston (r=0, V0=theta)")
print("# Octave = sigurdroemer/rough_heston (Adams VIE)")
print("# WS = fbourgey/RoughVolatilityWorkshop2024 (rational-approx CF)")
print("# Diff = abs(Octave - WS). Consensus admitted only if Diff < 0.01")
print()
print("| Case | Model | H | λ | θ | ν | ρ | T | K | Octave call | WS call | |Diff| | Consensus |")
print("|------|-------|---|---|---|---|---|---|---|---|---|---|-----------|")

for label, H, lam, theta, nu, rho in models:
    for T in expiries:
        for K in strikes:
            key = (label, T, K)
            if key not in octave:
                print(f"| {label} T={T:.4f} K={K:.3f} | {label} | {H} | {lam} | {theta} | {nu} | {rho} | {T:.6f} | {K:.3f} | N/A | N/A | N/A | N/A |")
                continue
            oct_c, oct_p = octave[key]
            ws_c = ws_call(S0, K, T, H, lam, theta, nu, rho)
            diff = abs(oct_c - ws_c)
            consensus = oct_c if diff < TOL else "FAIL"
            print(f"| {label} T={T:.4f} K={K:.3f} | {label} | {H} | {lam} | {theta} | {nu} | {rho} | {T:.6f} | {K:.3f} | {oct_c:.12f} | {ws_c:.12f} | {diff:.2e} | {consensus if isinstance(consensus, str) else f'{consensus:.12f}'} |")
