#!/usr/bin/env python3
"""Rough Heston pricer via hagerpa/roughprix using root_pade solver.

Usage:
  price_european_root_pade.py S0 K T H lambda theta nu rho r

Prints: call_price put_price
"""
import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "src"))
import numpy as np
from roughprix import RoughHeston, RoughHestonParam

S0 = float(sys.argv[1]); K = float(sys.argv[2]); T = float(sys.argv[3])
H = float(sys.argv[4]); lam = float(sys.argv[5]); theta = float(sys.argv[6])
nu = float(sys.argv[7]); rho = float(sys.argv[8]); r = float(sys.argv[9])

param = RoughHestonParam(lam=lam, theta=theta, nu=nu, rho=rho, V0=theta, H=H)
model = RoughHeston(param, riskfree=r, base_solution="root_pade")
prices = model.eur_call_put(np.array([K]), maturity=T, S_0=S0,
                            payoff_selection="otm", time_steps=500)
call = float(prices[0])
put = call - (S0 - K * np.exp(-r * T))
if K <= S0:
    put = float(prices[0])
    call = put + (S0 - K * np.exp(-r * T))
print(f"{call:.12f} {put:.12f}")
