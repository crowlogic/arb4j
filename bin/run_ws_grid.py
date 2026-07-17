#!/usr/bin/env python3
"""Run the Workshop (fbourgey) Padé pricer on the reference grid with progress."""
import subprocess, sys, os, textwrap

BASE = os.path.dirname(os.path.abspath(__file__))
WS_DIR = os.path.join(BASE, "rough_heston_workshop")

S0, r = 1.0, 0.0
models = [("M1",0.12,0.1,0.3156,0.331,-0.681), ("M2",0.30,2.0,0.04,0.3,-0.7)]
expiries = [1/252, 1/52, 1.0]
strikes  = [0.8, 0.9, 0.95, 1.0, 1.05, 1.1, 1.2]

total = len(models) * len(expiries) * len(strikes)
idx = 0

print("case_id,S0,K,T,H,lam,theta,nu,rho,r,call,put")

code_template = textwrap.dedent("""
import sys; sys.path.insert(0, '{ws_dir}')
import numpy as np
from rough_heston import phi_rheston_rational
from utils import lewis_formula_otm_price
params = {{'nu':{nu},'H':{H},'lbd':{lam},'rho':{rho}}}
xi = lambda t: np.full_like(t, {theta})
phi = lambda u,tau: phi_rheston_rational(u,tau,params,xi,n_pade=4,n_quad=30)
k = np.log({K}/{S0})
otm = float(lewis_formula_otm_price(phi,k,{T})[0])
if k>=0: c=otm*{S0}; p=c-({S0}-{K})
else: p=otm*{S0}; c=p+({S0}-{K})
print(f'{{c:.12f}} {{p:.12f}}')
""")

for label, H, lam, theta, nu, rho in models:
    for T in expiries:
        for K in strikes:
            idx += 1
            case = f"{label}_T{T:.8f}_K{K:.3f}"
            sys.stderr.write(f"\r[{idx}/{total}] {case}  ")
            sys.stderr.flush()
            code = code_template.format(ws_dir=WS_DIR, nu=nu, H=H, lam=lam,
                                         rho=rho, theta=theta, K=K, S0=S0, T=T)
            try:
                res = subprocess.run([sys.executable, "-c", code],
                                     capture_output=True, text=True, timeout=120)
                out = res.stdout.strip()
                import re
                m = re.search(r'(-?\d+\.\d+(?:e[+-]?\d+)?)\s+(-?\d+\.\d+(?:e[+-]?\d+)?)', out)
                if m:
                    print(f"{case},{S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r},{m.group(1)},{m.group(2)}")
                else:
                    print(f"{case},{S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r},ERR,ERR")
            except Exception as e:
                print(f"{case},{S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r},EXC,EXC")
sys.stderr.write(f"\r[{total}/{total}] done\n")
sys.stderr.flush()
