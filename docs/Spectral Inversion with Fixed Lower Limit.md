<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

## Spectral Inversion with Fixed Lower Limit

### Complex Form with Lower Limit at $-\infty$

Setting $\lambda_1 = -\infty$ in the inversion formulae and using $F(-\infty) = 0$ and $\zeta(-\infty) = 0$, the spectral distribution function and spectral process up to frequency $\lambda$ are given by:

$F(\lambda) = \frac{1}{2\pi} \lim_{T \to \infty} \int_{-T}^{T} \frac{1 - e^{-i t \lambda}}{i t} r(t) \, dt$

$\zeta(\lambda) = \lim_{T \to \infty} \frac{1}{2\pi} \int_{-T}^{T} \frac{1 - e^{-i t \lambda}}{i t} \xi(t) \, dt$

These formulae express the cumulative spectral content up to frequency $\lambda$ directly in terms of the covariance function $r(t)$ and the process $\xi(t)$.[^1][^2][^3]

### Real Trigonometric Form

For real-valued stationary processes, both $r(t)$ and $\xi(t)$ are real, and the spectral distribution $F(\lambda)$ has the symmetry property $F(-\lambda) + F(\lambda) = r(0)$ for $\lambda > 0$. The complex exponentials can be decomposed using Euler's formula $e^{-i t \lambda} = \cos(t\lambda) - i \sin(t\lambda)$.[^4][^5]

For the **spectral distribution function**, substituting and separating real and imaginary parts:

$F(\lambda) = \frac{1}{2\pi} \lim_{T \to \infty} \int_{-T}^{T} \frac{1 - \cos(t\lambda)}{i t} r(t) \, dt + \frac{1}{2\pi} \lim_{T \to \infty} \int_{-T}^{T} \frac{\sin(t\lambda)}{t} r(t) \, dt$

Since $r(t)$ is an even function (i.e., $r(-t) = r(t)$), the integrand $\frac{1 - \cos(t\lambda)}{t} r(t)$ is odd and integrates to zero, while $\frac{\sin(t\lambda)}{t} r(t)$ is even. This yields:

$F(\lambda) = \frac{1}{\pi} \lim_{T \to \infty} \int_{0}^{T} \frac{\sin(t\lambda)}{t} r(t) \, dt$

or equivalently, using integration by parts:

$F(\lambda) = \frac{2}{\pi} \int_{0}^{\lambda} \left( \int_{0}^{\infty} \cos(t\omega) r(t) \, dt \right) d\omega$

For the **spectral process**, the real trigonometric form is:

$\zeta(\lambda) = \lim_{T \to \infty} \frac{1}{\pi} \int_{0}^{T} \frac{\sin(t\lambda)}{t} \xi(t) \, dt$

When $F(\lambda)$ is absolutely continuous with spectral density $f(\lambda)$, the relationship simplifies to the **Fourier cosine transform** pair:[^6][^7][^5]

$f(\lambda) = \frac{1}{\pi} \int_{0}^{\infty} r(t) \cos(t\lambda) \, dt \quad \text{for } \lambda \geq 0$

$r(t) = \int_{0}^{\infty} f(\lambda) \cos(t\lambda) \, d\lambda$

These forms are particularly useful in practice since real-valued processes require only real arithmetic, eliminating the need for complex-valued computations.[^8][^7][^6]
<span style="display:none">[^10][^11][^12][^13][^14][^15][^16][^17][^18][^19][^20][^21][^22][^23][^24][^25][^26][^9]</span>

<div align="center">⁂</div>

[^1]: http://arxiv.org/pdf/1801.02248.pdf

[^2]: http://arxiv.org/pdf/1009.1543.pdf

[^3]: https://arxiv.org/abs/2111.01603v1

[^4]: http://arxiv.org/pdf/2303.11561.pdf

[^5]: https://arxiv.org/pdf/1603.05440.pdf

[^6]: https://arxiv.org/pdf/2401.10494.pdf

[^7]: https://www.mdpi.com/2313-433X/6/4/15/pdf

[^8]: http://arxiv.org/pdf/2502.15741.pdf

[^9]: https://arxiv.org/pdf/1212.6546.pdf

[^10]: http://arxiv.org/pdf/1006.3967.pdf

[^11]: http://arxiv.org/pdf/2111.06874.pdf

[^12]: https://arxiv.org/pdf/2501.17118.pdf

[^13]: https://www.ams.org/btran/2020-07-03/S2330-0000-2020-00045-4/S2330-0000-2020-00045-4.pdf

[^14]: http://arxiv.org/pdf/1111.6409.pdf

[^15]: http://arxiv.org/pdf/2412.00075.pdf

[^16]: https://www.scirp.org/pdf/apm_2019122315075970.pdf

[^17]: http://arxiv.org/pdf/2111.10899.pdf

[^18]: http://arxiv.org/pdf/1003.1187.pdf

[^19]: http://arxiv.org/pdf/1701.03407.pdf

[^20]: https://arxiv.org/html/2504.01163v1

[^21]: http://arxiv.org/pdf/2001.03953.pdf

[^22]: http://arxiv.org/pdf/2001.08492.pdf

[^23]: https://arxiv.org/pdf/2012.09789.pdf

[^24]: https://repositorio.unican.es/xmlui/bitstream/10902/11330/1/EfficientAlgorithmsInversion.pdf

[^25]: https://pjsor.com/pjsor/article/download/520/252

[^26]: http://arxiv.org/pdf/2501.08753.pdf

