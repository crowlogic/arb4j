<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

## Spectral Inversion with Fixed Lower Limit

### Complex Form with Lower Limit at $-\infty$

Setting $\lambda_1 = -\infty$ in the inversion formulae and using $F(-\infty) = 0$ and $\zeta(-\infty) = 0$, the spectral distribution function and spectral process up to frequency $\lambda$ are given by:

$F(\lambda) = \frac{1}{2\pi} \lim_{T \to \infty} \int_{-T}^{T} \frac{1 - e^{-i t \lambda}}{i t} r(t) \, dt$

$\zeta(\lambda) = \lim_{T \to \infty} \frac{1}{2\pi} \int_{-T}^{T} \frac{1 - e^{-i t \lambda}}{i t} \xi(t) \, dt$

These formulae express the cumulative spectral content up to frequency $\lambda$ directly in terms of the covariance function $r(t)$ and the process $\xi(t)$.

### Real Trigonometric Form

For real-valued stationary processes, both $r(t)$ and $\xi(t)$ are real, and the spectral distribution $F(\lambda)$ has the symmetry property $F(-\lambda) + F(\lambda) = r(0)$ for $\lambda > 0$. The complex exponentials can be decomposed using Euler's formula $e^{-i t \lambda} = \cos(t\lambda) - i \sin(t\lambda)$.

For the **spectral distribution function**, substituting and separating real and imaginary parts:

$F(\lambda) = \frac{1}{2\pi} \lim_{T \to \infty} \int_{-T}^{T} \frac{1 - \cos(t\lambda)}{i t} r(t) \, dt + \frac{1}{2\pi} \lim_{T \to \infty} \int_{-T}^{T} \frac{\sin(t\lambda)}{t} r(t) \, dt$

Since $r(t)$ is an even function (i.e., $r(-t) = r(t)$), the integrand $\frac{1 - \cos(t\lambda)}{t} r(t)$ is odd and integrates to zero, while $\frac{\sin(t\lambda)}{t} r(t)$ is even. This yields:

$F(\lambda) = \frac{1}{\pi} \lim_{T \to \infty} \int_{0}^{T} \frac{\sin(t\lambda)}{t} r(t) \, dt$

or equivalently, using integration by parts:

$F(\lambda) = \frac{2}{\pi} \int_{0}^{\lambda} \left( \int_{0}^{\infty} \cos(t\omega) r(t) \, dt \right) d\omega$

For the **spectral process**, the real trigonometric form is:

$\zeta(\lambda) = \lim_{T \to \infty} \frac{1}{\pi} \int_{0}^{T} \frac{\sin(t\lambda)}{t} \xi(t) \, dt$

When $F(\lambda)$ is absolutely continuous with spectral density $f(\lambda)$, the relationship simplifies to the **Fourier cosine transform** pair:

$f(\lambda) = \frac{1}{\pi} \int_{0}^{\infty} r(t) \cos(t\lambda) \, dt \quad \text{for } \lambda \geq 0$

$r(t) = \int_{0}^{\infty} f(\lambda) \cos(t\lambda) \, d\lambda$
