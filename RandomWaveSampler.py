#!/usr/bin/python3

import numpy as np
import matplotlib
matplotlib.use('GTK3Agg')  # Or your preferred backend ('Qt5Agg', etc.)

import matplotlib.pyplot as plt
from scipy.special import j0
from scipy.signal import hilbert
from numpy.fft import fftfreq, ifft

# CONFIGURATION
L = 500
STEP_SIZE = 0.01
N = int(L / STEP_SIZE)
LAGSTO_SHOW = 20

def gen_path_spectral(n_points=N, dt=STEP_SIZE):
    freq = fftfreq(n_points, d=dt)
    df = 1/(n_points*dt)
    psd = np.zeros_like(freq)
    valid = (np.abs(freq) < 1.0)
    psd[valid] = 1.0 / (np.pi * np.sqrt(1 - freq[valid]**2))

    # Hermitian symmetry for real-valued process
    X = np.zeros(n_points, dtype=complex)
    X[0] = 0  # Zero mean
    nyquist_idx = n_points // 2

    for k in range(1, nyquist_idx):
        mag = np.sqrt(psd[k] * df)
        X[k] = mag * (np.random.normal() + 1j * np.random.normal()) / np.sqrt(2)
        X[n_points - k] = np.conj(X[k])

    if n_points % 2 == 0:
        X[nyquist_idx] = np.sqrt(psd[nyquist_idx] * df) * np.random.normal()

    path = np.real(ifft(X) * n_points)

    # Get quadrature and envelope via Hilbert transform
    analytic_signal = hilbert(path)
    path_quad = np.imag(analytic_signal)
    envelope = np.abs(analytic_signal)
    t = np.arange(0, L, dt)
    return path, path_quad, envelope, t

def autocorr_direct(x, max_lag_steps):
    n = len(x)
    x_centered = x - np.mean(x)
    var = np.var(x_centered)
    if var < 1e-10: return np.zeros(max_lag_steps)
    acorr = np.zeros(max_lag_steps)
    for k in range(max_lag_steps):
        if k == 0:
            acorr[k] = 1.0
        elif n - k > 0:
            cov_k = np.sum(x_centered[:-k] * x_centered[k:]) / (n - k)
            acorr[k] = cov_k / var
        else:
            acorr[k] = np.nan
    return acorr

# MAIN
path, path_quad, envelope, t = gen_path_spectral()
max_lag_steps = int(LAGSTO_SHOW / STEP_SIZE) + 1
emp_cov = autocorr_direct(path, max_lag_steps)
lag_values = np.arange(0, LAGSTO_SHOW + STEP_SIZE, STEP_SIZE)
plot_len = min(len(lag_values), len(emp_cov))

fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(16, 12))

# Top plot: in-phase, quadrature, envelope, and negative envelope
ax1.plot(t, path, color='b', linewidth=1.5, label='In-phase (process)')
ax1.plot(t, path_quad, color='g', linewidth=1.5, label='Quadrature (Hilbert)')
ax1.plot(t, envelope, color='r', linewidth=2, label='Envelope (+)')
ax1.plot(t, -envelope, color='r', linestyle='--', linewidth=2, label='Envelope (–)')
ax1.set_title("In-Phase, Quadrature, and Envelope (±) via Hilbert Transform", fontsize=14)
ax1.set_xlabel("Time", fontsize=12)
ax1.set_ylabel("Value", fontsize=12)
ax1.legend(fontsize=12)
ax1.grid(True, alpha=0.3)

# Bottom plot: covariance
ax2.plot(lag_values[:plot_len], emp_cov[:plot_len], color='b', linewidth=1.5, label='Empirical')
ax2.plot(lag_values[:plot_len], j0(2 * np.pi * lag_values[:plot_len]), 'r--', linewidth=2, label='Theoretical J₀(2π lag)')
ax2.set_title("Covariance Verification (Spectral Method)", fontsize=14)
ax2.set_xlabel("Lag (Time Units)", fontsize=12)
ax2.set_ylabel("Autocorrelation", fontsize=12)
ax2.legend(fontsize=12)
ax2.grid(True, alpha=0.3)
ax2.set_ylim(-0.5, 1.05)
ax2.set_xlim(0, LAGSTO_SHOW)

plt.tight_layout()
print("USING SPECTRAL METHOD - Target Covariance J0(2*pi*tau)")
plt.show()
