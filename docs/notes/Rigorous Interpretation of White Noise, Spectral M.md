<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

## Rigorous Interpretation of White Noise, Spectral Measure, and Fourier Integration

**Summary:**
White noise, rigorously viewed as the distributional derivative of Brownian motion, is not a function but a generalized stochastic process. Its mathematical framework relies upon the theory of Gaussian generalized processes (e.g., in the sense of I.M. Gelfand) and their spectral (Fourier) representations.

***

### 1. **Covariance Structure and Spectral Density**

- For idealized white noise $\xi(t)$,

$$
E[\xi(t)\xi(s)] = \delta(t-s)
$$

In Fourier space,

$$
\int_{-\infty}^{\infty} e^{-i\lambda \tau} \delta(\tau) d\tau = 1
$$

(modulo conventions in $2\pi$ factors).
- **Interpretation:**
The spectral density is constant—i.e., proportional to Lebesgue measure—manifesting the process's complete lack of temporal correlation.

***

### 2. **Fourier Transform of White Noise as a Process**

- Given that $\xi(t)$ is not a function, the integral

$$
\int_{-\infty}^{\infty} e^{i\lambda t} \xi(t) dt
$$

is not a deterministic object but a **random (generalized) process** in frequency.
- The **key property** is that the spectrum captures isometry:

$$
E\left[\int_{-\infty}^{\infty} e^{i\lambda t} \xi(t) dt \cdot \overline{\int_{-\infty}^{\infty} e^{i\omega s} \xi(s) ds}\right]
= 2\pi\,\delta(\lambda-\omega)
$$

Thus, in the frequency domain, the Fourier transform of white noise is itself white noise—the “spectral covariance” is again a delta (flat spectrum).

***

### 3. **Spectral Measure and Isometry**

- The general theory (e.g., see the Kolmogorov–Cramér spectral representation theorem and spectral measure theory for stationary processes) gives:

$$
X(t) = \int_{-\infty}^{\infty} e^{i\lambda t} dZ(\lambda)
$$

where $E|dZ(\lambda)|^2 = d\mu(\lambda)$ encodes the spectral measure $\mu$.
- For white noise, $d\mu(\lambda) = \frac{1}{2\pi}\,d\lambda$ (Lebesgue measure up to normalization).

***

### 4. **Stochastic Fourier Integrals and Interpretation**

- The expression

$$
\int_{-\infty}^\infty e^{i\lambda t} dx(t)
$$

is a **stochastic Fourier integral**, not a function or pointwise value but an object whose *second-order structure* (covariances/expectations) determines its statistical properties.
- The statement

$$
\int_{-\infty}^\infty e^{i\lambda t} dx(t)
$$

“equals” a delta function is not strictly true; rather, for suitable test functions $f$, the map

$$
f \mapsto \int_{-\infty}^\infty f(t)\, \xi(t)\, dt
$$

is an isometry (up to normalization) between $L^2(\mathbb{R})$, and the covariance measure is flat (Lebesgue).

***

### 5. **Isometry Structure**

- The isometry is given by the *Plancherel theorem* for stochastic integrals:

$$
E\left|\int f(t)\,dW_t\right|^2 = \int |f(t)|^2 dt
$$

and equivalently in frequency domain. For white noise, the spectral isometry reflects the invariance under the Fourier transform.

***

**Conclusion:**
White noise and its spectral theory are most precisely handled in the language of generalized stochastic processes.

- Its time correlation is a Dirac delta; its spectral measure is Lebesgue; and its stochastic Fourier transform is again white noise.
- Claims about “delta functions” in the Fourier transform are statements about *variance/covariance* structures, not equalities of random distributions.
- The “equality” is really an isometry of Hilbert spaces induced by the Fourier transform—a key point in spectral analysis of stationary and generalized processes.

