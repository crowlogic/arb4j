<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

## Discrete Approximation and Convergence

### Setup: Frequency Discretization

Let \$ \Delta\lambda \$ be the frequency bin size. Discretize the frequency axis as:

$$
\omega_k = k \cdot \Delta\lambda, \quad k = \ldots, -2, -1, 0, 1, 2, \ldots
$$

For a finite frequency range \$ [-W, W] \$, the number of frequency bins is:

$$
N = \frac{2W}{\Delta\lambda}
$$

Therefore:

$$
\boxed{\Delta\lambda = \frac{2W}{N}}
$$

confirming that \$ \Delta\lambda \$ and \$ N \$ are inversely related.

### Discrete Approximation of the Forward Transform

The continuous representation:

$$
X(t) = \int_{-\infty}^{\infty} \phi_t(\omega) F(\omega) \, d\omega
$$

is approximated by the Riemann sum:

$$
X(t) \approx \sum_{k=-\infty}^{\infty} \phi_t(\omega_k) F(\omega_k) \Delta\lambda
$$

For finite bandwidth \$ [-W, W] \$:

$$
\boxed{X(t) \approx \sum_{k=-N/2}^{N/2-1} \phi_t(k\Delta\lambda) F(k\Delta\lambda) \Delta\lambda}
$$

### Discrete Approximation of the Inverse Transform

The continuous inversion:

$$
F(\omega) = \int_{-\infty}^{\infty} X(t) \overline{\phi_t(\omega)} \, dt
$$

becomes:

$$
\boxed{F(\omega_k) = \int_{-\infty}^{\infty} X(t) \overline{\phi_t(\omega_k)} \, dt}
$$

Note: The inverse is still an integral over time, not a sum, because we're inverting from the continuous-time process \$ X(t) \$.

### Convergence as \$ \Delta\lambda \to 0 \$

**Theorem:** If \$ F(\omega) \$ is continuous and integrable, then as \$ \Delta\lambda \to 0 \$ (equivalently, \$ N \to \infty \$):

$$
\lim_{\Delta\lambda \to 0} \sum_{k=-\infty}^{\infty} \phi_t(k\Delta\lambda) F(k\Delta\lambda) \Delta\lambda = \int_{-\infty}^{\infty} \phi_t(\omega) F(\omega) \, d\omega
$$

**Proof:** This is the standard convergence of Riemann sums to the Riemann integral. For any fixed \$ t \$:

1. The function \$ g(\omega) = \phi_t(\omega) F(\omega) \$ is integrable by assumption.
2. The Riemann sum is:

$$
S_{\Delta\lambda} = \sum_{k} g(k\Delta\lambda) \Delta\lambda
$$
3. By the Riemann integral theorem:

$$
\lim_{\Delta\lambda \to 0} S_{\Delta\lambda} = \int_{-\infty}^{\infty} g(\omega) \, d\omega = \int_{-\infty}^{\infty} \phi_t(\omega) F(\omega) \, d\omega
$$

### Summary Table: Continuous vs. Discrete

| Representation | Continuous | Discrete Approximation |
| :-- | :-- | :-- |
| **Forward** | \$ X(t) = \int \phi_t(\omega) F(\omega) d\omega \$ | \$ X(t) \approx \sum_k \phi_t(k\Delta\lambda) F(k\Delta\lambda) \Delta\lambda \$ |
| **Inverse** | \$ F(\omega) = \int X(t) \overline{\phi_t(\omega)} dt \$ | \$ F(k\Delta\lambda) = \int X(t) \overline{\phi_t(k\Delta\lambda)} dt \$ |
| **Relationship** | \$ \Delta\lambda \to 0 \$ | \$ N = \frac{2W}{\Delta\lambda} \to \infty \$ |

### Key Point:

As \$ \Delta\lambda \to 0 \$, we get \$ N \to \infty \$, and the discrete approximation converges pointwise to the continuous integral, provided \$ F(\omega) \$ has sufficient regularity (continuity and integrability).

