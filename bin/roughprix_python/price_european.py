#!/usr/bin/env python3
"""Rough Heston pricer via hagerpa/roughprix (JAX, multiple Riccati solvers).

Usage:
  price_european.py S0 K T H lambda theta nu rho r [--solver SOLVER] [--time-steps N]

Prints: call_price put_price
"""
import sys, os, argparse
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "src"))
import numpy as np
from roughprix import RoughHeston, RoughHestonParam

def main():
    p = argparse.ArgumentParser()
    p.add_argument("S0", type=float)
    p.add_argument("K", type=float)
    p.add_argument("T", type=float)
    p.add_argument("H", type=float)
    p.add_argument("lam", type=float)
    p.add_argument("theta", type=float)
    p.add_argument("nu", type=float)
    p.add_argument("rho", type=float)
    p.add_argument("r", type=float)
    p.add_argument("--solver", choices=["auto","root_pade","exact_heston","pade","direct_riccati"], default="root_pade")
    p.add_argument("--time-steps", type=int, default=500)
    args = p.parse_args()

    param = RoughHestonParam(lam=args.lam, theta=args.theta, nu=args.nu,
                             rho=args.rho, V0=args.theta, H=args.H)
    model = RoughHeston(param, riskfree=args.r, base_solution=args.solver)

    # Normalize to S0=1 for numerical stability
    k_norm = args.K / args.S0
    K_arr = np.array([k_norm])
    prices = model.eur_call_put(K_arr, maturity=args.T, S_0=1.0,
                                payoff_selection="otm",
                                time_steps=args.time_steps,
                                integration="adaptive_panel")

    # Scale back
    call_norm = float(prices[0])
    if k_norm >= 1.0:
        call = call_norm * args.S0
        put = call - (args.S0 - args.K * np.exp(-args.r * args.T))
    else:
        put = call_norm * args.S0
        call = put + (args.S0 - args.K * np.exp(-args.r * args.T))

    print(f"{call:.12f} {put:.12f}")

if __name__ == "__main__":
    main()
