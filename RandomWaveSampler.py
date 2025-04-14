import numpy as np
import matplotlib.pyplot as plt
from scipy.special import j0
from numpy.fft import fft, ifft, fftfreq

# CONFIGURATION
L = 200           # Interval length
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
    #np.random.seed(seed)
    
    # Frequency axis
    freq = fftfreq(n_points, d=dt)
    
    # Power Spectral Density S(f) = 1/(pi*sqrt(1-f^2)) for |f|<1
    psd = np.zeros_like(freq)
    valid_indices = (np.abs(freq) < 1.0) & (np.abs(freq) > 1e-9) # Exclude |f|>=1 and f=0 if problematic
    psd[valid_indices] = 1.0 / (np.pi * np.sqrt(1 - freq[valid_indices]**2))
    
    # Generate complex Gaussian white noise in frequency domain
    # Need sqrt(0.5) scaling for real/imag parts N(0,1) -> Complex N(0,1) variance
    noise_fft = (np.random.normal(size=n_points) + 1j * np.random.normal(size=n_points)) * np.sqrt(0.5)
    
    # Scaling factor for FFT coefficients based on PSD
    # Amplitude ~ sqrt(S(f) * Delta_f * N) where Delta_f = 1/(N*dt)
    # Scaling = sqrt(psd * (1.0 / (N * dt)) * N) = sqrt(psd / dt)
    scaling_factor = np.sqrt(psd / dt)
    
    # Apply scaling to noise
    fft_coeffs = noise_fft * scaling_factor
    
    # Ensure Hermitian symmetry for real output (redundant with complex noise generation?)
    # No, required if starting from purely random complex numbers
    fft_coeffs[n_points//2 + 1:] = np.conj(fft_coeffs[n_points//2 - 1:0:-1])
    if n_points % 2 == 0:
        fft_coeffs[n_points//2] = np.real(fft_coeffs[n_points//2]) # Nyquist real
    fft_coeffs[0] = 0 # Set DC component to zero (mean zero process)

    # Inverse FFT to get time-domain signal
    # ifft already includes 1/N scaling. Multiply by N to counteract? No.
    # Check variance: Should be integral S(f) df = 1
    path = ifft(fft_coeffs) * n_points # Multiply by N needed for correct power scaling with numpy ifft? Yes.
                                       # Check numpy fft normalization: No, ifft includes 1/N. Don't multiply by N.
                                       
    path = np.real(path) # Should be real, take real part
    
    print(f"Generated path variance: {np.var(path):.4f} (Theoretical = 1.0)") # Check variance
    
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
