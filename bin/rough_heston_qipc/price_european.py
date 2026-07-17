#!/usr/bin/env python3
"""Rough Heston pricer via soya-git/rough-heston-qipc (quadratic-implicit Adams).

Usage:
  price_european.py S0 K T H lambda theta nu rho r

Prints: call_price put_price
"""
import sys, os, subprocess

S0 = float(sys.argv[1]); K = float(sys.argv[2]); T = float(sys.argv[3])
H = float(sys.argv[4]); lam = float(sys.argv[5]); theta = float(sys.argv[6])
nu = float(sys.argv[7]); rho = float(sys.argv[8]); r = float(sys.argv[9])

# Use the installed package if available, otherwise try vendored path
try:
    from rough_heston_qipc import RoughHestonModel, RoughHestonParams
except ImportError:
    sys.path.insert(0, os.path.join(os.path.dirname(__file__)))
    from rough_heston_qipc import RoughHestonModel, RoughHestonParams

alpha = H + 0.5
z = theta  # initial variance = long-run variance

params = RoughHestonParams(
    S0=S0, K=K, r=r, z=z, alpha=alpha,
    lam=lam, theta=theta, rho=rho, nu=nu, t=T,
    R=1.5, u_lower=0.0, u_upper=25.0
)
model = RoughHestonModel(params)

call = model.price(NOuter=50, NInner=500, method="implicit", option_type="call")
put  = model.price(NOuter=50, NInner=500, method="implicit", option_type="put")

print(f"{call:.12f} {put:.12f}")
