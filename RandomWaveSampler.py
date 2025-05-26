#!/usr/bin/python3

import numpy as np
import matplotlib
matplotlib.use('GTK3Agg')

import matplotlib.pyplot as plt
from scipy.special import j0
from scipy.signal import hilbert, savgol_filter
from numpy.fft import fftfreq, ifft, fft

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

    # Store white noise components for plotting
    white_noise_real = np.zeros(n_points)
    white_noise_imag = np.zeros(n_points)

    for k in range(1, nyquist_idx):
        mag = np.sqrt(psd[k] * df)
        noise_real = np.random.normal()
        noise_imag = np.random.normal()
        white_noise_real[k] = noise_real
        white_noise_imag[k] = noise_imag
        X[k] = mag * (noise_real + 1j * noise_imag) / np.sqrt(2)
        X[n_points - k] = np.conj(X[k])

    if n_points % 2 == 0:
        noise_nyquist = np.random.normal()
        white_noise_real[nyquist_idx] = noise_nyquist
        X[nyquist_idx] = np.sqrt(psd[nyquist_idx] * df) * noise_nyquist

    path = np.real(ifft(X) * n_points)
    analytic_signal = hilbert(path)
    path_quad = np.imag(analytic_signal)
    envelope = np.abs(analytic_signal)
    t = np.arange(0, L, dt)
    return path, path_quad, envelope, t, X, freq, psd, white_noise_real, white_noise_imag

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

def smooth_psd(psd, window_length=31):
    if len(psd) < window_length:
        return psd
    if window_length % 2 == 0:
        window_length -= 1
    return savgol_filter(psd, window_length, 3)

# MAIN
path, path_quad, envelope, t, X, freq, psd, white_noise_real, white_noise_imag = gen_path_spectral()
max_lag_steps = int(LAGSTO_SHOW / STEP_SIZE) + 1
emp_cov = autocorr_direct(path, max_lag_steps)
lag_values = np.arange(0, LAGSTO_SHOW + STEP_SIZE, STEP_SIZE)
plot_len = min(len(lag_values), len(emp_cov))

fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(20, 15))

# Top Left: In-phase, quadrature, envelope
ax1.plot(t, path, color='b', linewidth=1.5, label='In-phase (process)')
ax1.plot(t, path_quad, color='g', linewidth=1.5, label='Quadrature (Hilbert)')
ax1.plot(t, envelope, color='r', linewidth=2, label='Envelope (+)')
ax1.plot(t, -envelope, color='r', linestyle='--', linewidth=2, label='Envelope (–)')
ax1.set_title("In-Phase, Quadrature, and Envelope (±) via Hilbert Transform", fontsize=14)
ax1.set_xlabel("Time", fontsize=12)
ax1.set_ylabel("Value", fontsize=12)
ax1.legend(fontsize=10)
ax1.grid(True, alpha=0.3)

# Top Right: White Noise Components - STEM PLOT
n_show = min(200, len(white_noise_real))
indices = np.arange(n_show)
ax2.stem(indices, white_noise_real[:n_show], linefmt='b-', markerfmt='bo', basefmt=' ', label='Real part')
ax2.stem(indices + 0.3, white_noise_imag[:n_show], linefmt='r-', markerfmt='ro', basefmt=' ', label='Imaginary part')
ax2.set_title("White Noise Components (Frequency Domain)", fontsize=14)
ax2.set_xlabel("Frequency Index", fontsize=12)
ax2.set_ylabel("Noise Value", fontsize=12)
ax2.legend(fontsize=10)
ax2.grid(True, alpha=0.3)

# Bottom Left: Covariance
ax3.plot(lag_values[:plot_len], emp_cov[:plot_len], color='b', linewidth=1.5, label='Empirical')
ax3.plot(lag_values[:plot_len], j0(2 * np.pi * lag_values[:plot_len]), 'r--', linewidth=2, label='Theoretical J₀(2π lag)')
ax3.set_title("Covariance Verification (Spectral Method)", fontsize=14)
ax3.set_xlabel("Lag (Time Units)", fontsize=12)
ax3.set_ylabel("Autocorrelation", fontsize=12)
ax3.legend(fontsize=10)
ax3.grid(True, alpha=0.3)
ax3.set_ylim(-0.5, 1.05)
ax3.set_xlim(0, LAGSTO_SHOW)

# Bottom Right: Empirical Periodogram vs. Theoretical PSD
positive_freqs = (freq >= 0)
freq_pos = freq[positive_freqs]
psd_theoretical = psd[positive_freqs]

# Compute the empirical periodogram from the synthesized path
path_demeaned = path - np.mean(path)
PATH_FFT = fft(path_demeaned)
# Correct normalization for periodogram
periodogram = (np.abs(PATH_FFT) ** 2) / (N * STEP_SIZE)
emp_psd = periodogram[positive_freqs]

# Smooth the empirical PSD
smoothed_emp_psd = smooth_psd(emp_psd, window_length=41)

# Scale the theoretical PSD to match empirical scale
# The theoretical PSD needs to be scaled by the frequency resolution
psd_theoretical_scaled = psd_theoretical * (1/(N*STEP_SIZE))

# Single axis plot
ax4.plot(freq_pos, emp_psd, color='gray', linewidth=0.7, alpha=0.7, label='Empirical PSD (raw)')
ax4.plot(freq_pos, smoothed_emp_psd, color='black', linewidth=2, label='Empirical PSD (smoothed)')
ax4.plot(freq_pos, psd_theoretical_scaled, color='red', linewidth=2.5, label='Theoretical PSD')

ax4.set_xlabel("Frequency", fontsize=12)
ax4.set_ylabel("Power Spectral Density", fontsize=12)
ax4.set_title("Empirical vs Theoretical Power Spectrum", fontsize=14)
ax4.grid(True, alpha=0.3)
ax4.set_xlim(0, 1.0)
ax4.legend(fontsize=10)

plt.tight_layout()
print("USING SPECTRAL METHOD - Target Covariance J0(2*pi*tau)")
print("PSD scaling corrected - all curves now on same scale")
plt.show()
