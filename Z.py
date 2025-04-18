import numpy as np
import matplotlib.pyplot as plt
from scipy.special import lambertw
from mpmath import zeta, gamma, arg, log, pi, mp

mp.dps = 15  # set decimal places for mpmath

# Exact Riemann-Siegel theta function
def riemann_siegel_theta(t):
    return float(arg(gamma(0.25 + 0.5j * t)) - 0.5 * t * log(pi))

# Stirling approximation for theta
def theta_stirling(t):
    t = np.asarray(t)
    return 0.5 * t * np.log(t / (2 * np.e * np.pi)) - 0.5 * np.pi / 8

# Inverse Riemann-Siegel theta using Lambert W
def inverse_theta_approx(theta):
    pi_ = np.pi
    e = np.e
    x = 8 * theta + pi_
    W_arg = x / (8 * pi_ * e)
    W_val = lambertw(W_arg)
    term1 = x / (4 * W_val)
    term2 = W_val / (6 * x * (np.log(x / (8 * pi_)) - np.log(W_val)))
    return np.real(term1 - term2)

# Hardy Z function
def hardy_z(t):
    t_mp = mp.mpf(t)
    th = arg(gamma(0.25 + 0.5j * t_mp)) - 0.5 * t_mp * log(pi)
    z = zeta(0.5 + 1j * t_mp)
    return float(mp.re(mp.exp(1j * th) * z))

# --- Plot 1: Theta and its approximation ---
tvals = np.linspace(0.1, 100, 300)
theta_exact = np.array([riemann_siegel_theta(t) for t in tvals])
theta_approx = theta_stirling(tvals)

plt.figure(figsize=(10,6))
plt.plot(tvals, theta_exact, label='Exact Riemann-Siegel Theta', linewidth=2)
plt.plot(tvals, theta_approx, label='Approximation (Stirling)', linewidth=2)
plt.xlabel('t')
plt.ylabel('Theta(t)')
plt.legend()
plt.tight_layout()
plt.show()

# --- Plot 2: Inverse Theta approximation ---
theta_range = np.linspace(0.1, 100, 300)
inv_theta = inverse_theta_approx(theta_range)

plt.figure(figsize=(10,6))
plt.plot(theta_range, inv_theta, label='Inverse Riemann-Siegel Theta Approximation', linewidth=2)
plt.xlabel('Theta')
plt.ylabel('Inverse Theta')
plt.legend()
plt.tight_layout()
plt.show()

# --- Plot 3: Scaled Hardy Z function (inverse theta as argument) ---
zvals = np.array([hardy_z(t) for t in inv_theta])
zvals_scaled = zvals / np.max(np.abs(zvals))

plt.figure(figsize=(10,6))
plt.plot(theta_range, zvals_scaled, label='Scaled Hardy Z (inverse theta as arg)', linewidth=2)
plt.xlabel('Theta')
plt.ylabel('Scaled Hardy Z function value')
plt.legend()
plt.tight_layout()
plt.show()
