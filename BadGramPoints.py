#!/usr/bin/python3

import mpmath as mp

# Set precision
mp.dps = 30

def find_nonconformists():
    nonconformists = []
    
    for n in range(1, 1100):
        # Find nth Gram point by solving theta(g) = pi*n
        def theta_eq(g):
            return mp.siegeltheta(g) - mp.pi * n
        
        # Initial guess from the formula
        g0 = 2 * mp.pi * mp.exp(1 + mp.lambertw((8*n + 1)/(8*mp.e)))
        
        # Find root
        gram_n = mp.findroot(theta_eq, g0)
        
        # Check if (-1)^n * Z(gram_n) < 0
        z_val = mp.siegelz(gram_n)
        if ((-1)**n * z_val) < 0:
            print(f"n={n}, t={float(gram_n):.10f}")
            nonconformists.append((n, float(gram_n)))
    
    return nonconformists

# Run it
nonconformists = find_nonconformists()
print(f"\nTotal nonconformists: {len(nonconformists)}")
for n, t in nonconformists:
    print(f"Index {n}: t = {t:.10f}")
