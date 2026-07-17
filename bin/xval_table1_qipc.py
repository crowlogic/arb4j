#!/usr/bin/env python3
"""qipc Adams pricer on Reference Table 1 parameters."""
import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'rough_heston_qipc'))
from rough_heston_qipc import RoughHestonModel, RoughHestonParams

S0 = 1; T = 1/252; H = 0.12; lam = 0.1; theta = 0.3156
nu = 0.331; rho = -0.681; r = 0
strikes = [0.95, 0.975, 1.0, 1.025, 1.05]

alpha = H + 0.5
for K in strikes:
    params = RoughHestonParams(S0=S0, K=K, r=r, z=theta, alpha=alpha,
        lam=lam, theta=theta, rho=rho, nu=nu, t=T,
        R=1.5, u_lower=0.0, u_upper=25.0)
    model = RoughHestonModel(params)
    call = model.price(NOuter=200, NInner=1000, method='implicit', option_type='call')
    put = model.price(NOuter=200, NInner=1000, method='implicit', option_type='put')
    print(f'{K:.3f}\t{call:.12f}\t{put:.12f}')
