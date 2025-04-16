
import numpy as np
import matplotlib;
matplotlib.use('GTK3Agg')  # or 'Qt5Agg', 'GTK3Agg', etc. depending on your system

import matplotlib.pyplot as plt

from scipy.special import j0
from numpy.fft import fft, ifft, fftfreq, fftshift, ifftshift

# CONFIGURATION
L = 500           # Interval length
STEP_SIZE = 0.01  # Time resolution
N = int(L / STEP_SIZE) # Number of points
LAGSTO_SHOW = 20  # Max lag to plot (time units)

# --------------------------
# SPECTRAL SYNTHESIS PATH GENERATION
# --------------------------
def gen_path_spectral(n_points=N, dt=STEP_SIZE):
    """
    Generates a stationary Gaussian process with covariance J0(2*pi*tau)
    using spectral synthesis (FFT method).
    """
    # Frequency axis (centered for easier handling)
    freq = fftfreq(n_points, d=dt)
    
    # Power Spectral Density S(f) = 1/(pi*sqrt(1-f^2)) for |f|<1
    psd = np.zeros_like(freq)
    valid_indices = (np.abs(freq) < 1.0) & (np.abs(freq) > 1e-9) 
    psd[valid_indices] = 1.0 / (np.pi * np.sqrt(1 - freq[valid_indices]**2))
    
    # Create spectrum with proper hermitian symmetry for real output
    X = np.zeros(n_points, dtype=complex)
    
    # Frequency domain step size
    df = 1/(n_points*dt)
    
    # Generate DC component (real)
    X[0] = 0  # Zero mean process
    
    # Generate positive frequencies (except Nyquist if even)
    nyquist_idx = n_points//2
    for k in range(1, nyquist_idx):
        mag = np.sqrt(psd[k] * df)
        X[k] = mag * (np.random.normal() + 1j*np.random.normal())/np.sqrt(2)
        # Ensure hermitian symmetry for real output
        X[n_points-k] = np.conj(X[k])
    
    # Handle Nyquist frequency specially (real if n_points is even)
    if n_points % 2 == 0:
        X[nyquist_idx] = np.sqrt(psd[nyquist_idx] * df) * np.random.normal()
    
    # Inverse FFT to get time-domain signal
    # Note: numpy's ifft already includes 1/N scaling
    path = np.real(ifft(X)) * n_points  # Scale by N for correct variance
    
    print(f"Generated path variance: {np.var(path):.4f} (Theoretical = 1.0)")
    
    return path, np.arange(0, L, dt)

# --------------------------
# DIRECT AUTOCOVARIANCE CALCULATION (Unbiased)
# --------------------------
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
            cov_k = np.sum(x_centered[:-k] * x_centered[k:]) / (n - k) # Unbiased estimator
            acorr[k] = cov_k / var
        else:
            acorr[k] = np.nan
    return acorr

# --------------------------
# EXECUTION
# --------------------------
path, t = gen_path_spectral()

max_lag_steps = int(LAGSTO_SHOW/STEP_SIZE) + 1
emp_cov = autocorr_direct(path, max_lag_steps)

# --------------------------
# PLOTTING
# --------------------------
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(16, 12))

# PATH PLOT
ax1.plot(t, path, color='k', linewidth=1.5)
ax1.set_title("Single Path (Spectral Method)", fontsize=14)
ax1.set_xlabel("Time", fontsize=12)
ax1.set_ylabel("X(t)", fontsize=12)
ax1.grid(True, alpha=0.3)

# COVARIANCE PLOT
lag_values = np.arange(0, LAGSTO_SHOW + STEP_SIZE, STEP_SIZE)
plot_len = min(len(lag_values), len(emp_cov))

ax2.plot(lag_values[:plot_len], emp_cov[:plot_len], color='b', linewidth=1.5, label='Empirical')
# Theoretical curve is now J0(2*pi*lag) because we used S(f) for that process
ax2.plot(lag_values[:plot_len], j0(2 * np.pi * lag_values[:plot_len]), 'r--', linewidth=2, label='Theoretical J₀(2π lag)')
ax2.set_title("Covariance Verification (Spectral Method)", fontsize=14)
ax2.set_xlabel("Lag (Time Units)", fontsize=12)
ax2.set_ylabel("Autocorrelation", fontsize=12)
ax2.legend(fontsize=12)
ax2.grid(True, alpha=0.3)
ax2.set_ylim(-0.5, 1.05)
ax2.set_xlim(0, LAGSTO_SHOW)

plt.tight_layout()
print(f"USING SPECTRAL METHOD - Target Covariance J0(2*pi*tau)")
plt.show()
