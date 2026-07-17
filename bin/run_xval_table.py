#!/usr/bin/env python3
"""
Run all available rough Heston pricers on the reference grid and 
produce a cross-validation table.

Pricers tested:
  octave  — sigurdroemer/rough_heston (fractional Adams VIE)
  ws      — fbourgey/RoughVolatilityWorkshop2024 (Padé rational CF)
  julia   — Yugam2508/QuantJulia (implicit fractional Adams)
  rp      — hagerpa/roughprix (root-Padé + H-expansion)
  R       — jgatheral/RationalRoughHeston (Adams VIE) — KNOWN BUG
  qipc    — soya-git/rough-heston-qipc (quadratic-implicit Adams) — KNOWN BUG
"""
import subprocess, sys, os, csv, io, re, textwrap

BASE = os.path.dirname(os.path.abspath(__file__))

S0, r = 1.0, 0.0

models = [
    ("M1", 0.12,  0.1,  0.3156, 0.331, -0.681),
    ("M2", 0.30,  2.0,  0.04,   0.3,   -0.7),
]
expiries = [1/252, 1/52, 1.0]
strikes  = [0.8, 0.9, 0.95, 1.0, 1.05, 1.1, 1.2]

PENNY = 0.01

def run_cmd(cmd, timeout=120):
    try:
        r = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
        out = r.stdout.strip()
        if r.returncode != 0:
            return f"ERR({r.returncode})"
        return out
    except subprocess.TimeoutExpired:
        return "TIMEOUT"
    except Exception as e:
        return f"EXC({e})"

def parse_pair(s):
    m = re.match(r'(-?\d+\.?\d*(?:e[+-]?\d+)?)\s+(-?\d+\.?\d*(?:e[+-]?\d+)?)', s)
    if m:
        return float(m.group(1)), float(m.group(2))
    return None, None

pricers = []

# --- Octave ---
def octave_call(S0, K, T, H, lam, theta, nu, rho, r):
    script = os.path.join(BASE, "run_ref_grid.m")
    # can't easily pass single case, so use octave directly
    cmd = ["octave", "--no-gui", "-q", "--eval",
           f"addpath('{os.path.join(BASE, 'rough_heston_matlab')}'); addpath(genpath('{os.path.join(BASE, 'rough_heston_matlab', 'functions')}')); [c,p]=price_european({S0},{K},{T},{H},{lam},{theta},{nu},{rho},{r}); fprintf('%.12f %.12f\\n',c,p);"]
    return run_cmd(cmd, timeout=300)
pricers.append(("Octave", octave_call, "sigurdroemer/rough_heston, fractional Adams VIE, N=252"))

# --- Workshop Padé ---
def ws_call(S0, K, T, H, lam, theta, nu, rho, r):
    ws_dir = os.path.join(BASE, "rough_heston_workshop")
    cmd = [sys.executable, "-c", textwrap.dedent(f"""
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
""")]
    return run_cmd(cmd, timeout=120)
pricers.append(("WS-Padé", ws_call, "fbourgey/RoughVolatilityWorkshop2024, Padé [4,4] rational CF, n_quad=30"))

# --- Julia QuantJulia ---
julia_exe = os.path.expanduser("~/.julia/juliaup/julia-1.12.6+0.x64.linux.gnu/bin/julia")
julia_script = os.path.join(BASE, "QuantJulia", "price_european.jl")
def julia_call(S0, K, T, H, lam, theta, nu, rho, r):
    cmd = [julia_exe, julia_script, str(S0), str(K), str(T), str(H), str(lam), str(theta), str(nu), str(rho), str(r)]
    out = run_cmd(cmd, timeout=300)
    # Strip precompilation messages
    lines = [l for l in out.split('\n') if not l.startswith('Precompiling') and not l.startswith('  ') and 'dependency' not in l and 'compiled' not in l]
    return lines[-1] if lines else out
pricers.append(("Julia", julia_call, "Yugam2508/QuantJulia, implicit fractional Adams, Gil-Pelaez Fourier inv"))

# --- roughprix root_pade ---
rp_script = os.path.join(BASE, "roughprix_python", "price_european.py")
def rp_call(S0, K, T, H, lam, theta, nu, rho, r):
    cmd = [sys.executable, rp_script, str(S0), str(K), str(T), str(H), str(lam), str(theta), str(nu), str(rho), str(r), "--solver", "root_pade"]
    out = run_cmd(cmd, timeout=300)
    # Strip GPU warnings
    lines = [l for l in out.split('\n') if 'NVIDIA' not in l and 'GPU' not in l and 'CUDA' not in l and 'jaxlib' not in l]
    return lines[-1] if lines else out
pricers.append(("roughprix", rp_call, "hagerpa/roughprix, root-Padé + H-expansion, JAX"))

# --- R Adams (broken, for reference) ---
r_script = os.path.join(BASE, "rough_heston_gatheral_r", "price_european.R")
def r_call(S0, K, T, H, lam, theta, nu, rho, r):
    cmd = ["Rscript", r_script, str(S0), str(K), str(T), str(H), str(lam), str(theta), str(nu), str(rho), str(r)]
    return run_cmd(cmd, timeout=300)
pricers.append(("R-Adams(BROKEN)", r_call, "jgatheral/RationalRoughHeston Adams VIE — produces negative prices at short T"))

# --- qipc (known Riccati bug) ---
qipc_script = os.path.join(BASE, "rough_heston_qipc", "price_european.py")
def qipc_call(S0, K, T, H, lam, theta, nu, rho, r):
    cmd = [sys.executable, qipc_script, str(S0), str(K), str(T), str(H), str(lam), str(theta), str(nu), str(rho), str(r)]
    return run_cmd(cmd, timeout=300)
pricers.append(("qipc(BROKEN)", qipc_call, "soya-git/rough-heston-qipc — Riccati quadratic coeff has extra λ² factor"))

# ============================================================
# Run all pricers on the grid
# ============================================================
print("# Rough Heston cross-validation table")
print(f"# S0={S0}, r={r}, tolerance={PENNY} (one penny per unit spot)")
print()
print("# R-Adams and qipc marked BROKEN — included for reference only")
print()
header = ["case", "model", "T", "K"]
for name, _, _ in pricers:
    header.append(f"{name}_call")
    header.append(f"{name}_put")
print("| " + " | ".join(header) + " |")
print("|" + "|".join(["---"] * len(header)) + "|")

for label, H, lam, theta, nu, rho in models:
    for T in expiries:
        for K in strikes:
            row = [f"{label} T={T:.6f}", label, f"{T:.8f}", f"{K:.3f}"]
            for name, fnc, _ in pricers:
                out = fnc(S0, K, T, H, lam, theta, nu, rho, r)
                call, put = parse_pair(out)
                if call is None:
                    row.extend([out, out])
                else:
                    row.append(f"{call:.12f}")
                    row.append(f"{put:.12f}")
            print("| " + " | ".join(row) + " |")
