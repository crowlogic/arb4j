#!/usr/bin/env python3
"""Rough Heston pricer via SimonBreneis/approximations (Fourier + fractional Riccati).

Usage:
  price_european.py S0 K T H lambda theta nu rho r

Prints: call_price put_price
"""
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from rHestonFourier import eur_call_put

S0 = float(sys.argv[1]); K = float(sys.argv[2]); T = float(sys.argv[3])
H = float(sys.argv[4]); lam = float(sys.argv[5]); theta = float(sys.argv[6])
nu = float(sys.argv[7]); rho = float(sys.argv[8]); r = float(sys.argv[9])

V_0 = theta  # initial variance = long-run variance
K_arr = np.array([K])

# Get prices (implied_vol=False, call=True)
prices = eur_call_put(S0, K_arr, lam, rho, nu, theta, V_0, T, r=r,
                       N=3, H=H, implied_vol=False, call=True, verbose=0)

if isinstance(prices, tuple):
    price, *_ = prices
else:
    price = prices

call = float(np.asarray(price).flat[0])
put = call - (S0 - K * np.exp(-r * T))

print(f"{call:.12f} {put:.12f}")
