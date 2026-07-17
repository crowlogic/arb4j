#!/usr/bin/env python3
"""Run the Octave (sigurdroemer) pricer on the reference grid with progress."""
import subprocess, sys, os

BASE = os.path.dirname(os.path.abspath(__file__))
SCRIPT = os.path.join(BASE, "rough_heston_matlab", "price_european.m")

S0, r = 1.0, 0.0
models = [("M1",0.12,0.1,0.3156,0.331,-0.681), ("M2",0.30,2.0,0.04,0.3,-0.7)]
expiries = [1/252, 1/52, 1.0]
strikes  = [0.8, 0.9, 0.95, 1.0, 1.05, 1.1, 1.2]

total = len(models) * len(expiries) * len(strikes)
idx = 0

print("case_id,S0,K,T,H,lam,theta,nu,rho,r,call,put")

octave_dir = os.path.join(BASE, "rough_heston_matlab")
func_dir   = os.path.join(octave_dir, "functions")
shim_dir   = os.path.join(BASE, "octshim")

for label, H, lam, theta, nu, rho in models:
    for T in expiries:
        for K in strikes:
            idx += 1
            case = f"{label}_T{T:.8f}_K{K:.3f}"
            sys.stderr.write(f"\r[{idx}/{total}] {case}  ")
            sys.stderr.flush()
            cmd = ["octave", "--no-gui", "-q",
                   "--eval", f"pkg load financial; addpath('{octave_dir}'); addpath(genpath('{func_dir}')); addpath(genpath('{shim_dir}')); [c,p]=price_european({S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r}); fprintf('%.12f %.12f\\n',c,p);"]
            try:
                res = subprocess.run(cmd, capture_output=True, text=True, timeout=300)
                out = res.stdout.strip()
                # Extract last line that has two floats
                import re
                m = re.search(r'(-?\d+\.\d+)\s+(-?\d+\.\d+)', out)
                if m:
                    c_val, p_val = m.group(1), m.group(2)
                    print(f"{case},{S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r},{c_val},{p_val}")
                else:
                    print(f"{case},{S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r},ERR,ERR")
            except Exception as e:
                print(f"{case},{S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r},EXC,EXC")
sys.stderr.write(f"\r[{total}/{total}] done\n")
sys.stderr.flush()
