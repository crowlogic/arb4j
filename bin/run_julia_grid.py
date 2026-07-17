#!/usr/bin/env python3
"""Run the Julia (QuantJulia) pricer on the reference grid with progress."""
import subprocess, sys, os

BASE = os.path.dirname(os.path.abspath(__file__))
JULIA_EXE = os.path.expanduser("~/.julia/juliaup/julia-1.12.6+0.x64.linux.gnu/bin/julia")
JULIA_SCRIPT = os.path.join(BASE, "QuantJulia", "price_european.jl")

S0, r = 1.0, 0.0
models = [("M1",0.12,0.1,0.3156,0.331,-0.681), ("M2",0.30,2.0,0.04,0.3,-0.7)]
expiries = [1/252, 1/52, 1.0]
strikes  = [0.8, 0.9, 0.95, 1.0, 1.05, 1.1, 1.2]

total = len(models) * len(expiries) * len(strikes)
idx = 0

print("case_id,S0,K,T,H,lam,theta,nu,rho,r,call,put")

for label, H, lam, theta, nu, rho in models:
    for T in expiries:
        for K in strikes:
            idx += 1
            case = f"{label}_T{T:.8f}_K{K:.3f}"
            sys.stderr.write(f"\r[{idx}/{total}] {case}  ")
            sys.stderr.flush()
            cmd = [JULIA_EXE, JULIA_SCRIPT, str(S0), str(K), str(T), str(H),
                   str(lam), str(theta), str(nu), str(rho), str(r)]
            try:
                res = subprocess.run(cmd, capture_output=True, text=True, timeout=300)
                out = res.stdout.strip()
                # skip precompilation lines
                lines = [l for l in out.split('\n') if l.strip() and not l.startswith(('Precompiling', '  ', 'Info'))]
                last = lines[-1] if lines else out
                import re
                m = re.search(r'(-?\d+\.\d+(?:e[+-]?\d+)?)\s+(-?\d+\.\d+(?:e[+-]?\d+)?)', last)
                if m:
                    print(f"{case},{S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r},{m.group(1)},{m.group(2)}")
                else:
                    print(f"{case},{S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r},ERR,ERR")
            except Exception as e:
                print(f"{case},{S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r},EXC,EXC")
sys.stderr.write(f"\r[{total}/{total}] done\n")
sys.stderr.flush()
