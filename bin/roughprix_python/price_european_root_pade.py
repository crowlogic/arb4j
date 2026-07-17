#!/usr/bin/env python3
"""Rough Heston pricer via hagerpa/roughprix using root_pade solver.

Usage:
  price_european_root_pade.py S0 K T H lambda theta nu rho r

Prints: call_price put_price
"""
import sys, os, subprocess
os.execvp(sys.executable, [sys.executable,
    os.path.join(os.path.dirname(__file__), "price_european.py"),
    "--solver", "root_pade", *sys.argv[1:]])
