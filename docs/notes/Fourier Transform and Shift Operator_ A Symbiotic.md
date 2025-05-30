<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

## Fourier Transform and Shift Operator: A Symbiotic Relationship

The intricate interplay between the shift operator and Fourier transform is fundamental to understanding spectral completeness in weakly harmonizable processes. This relationship provides both analytical tools and theoretical insights into the structure of non-stationary processes.

### Fourier Characterization of the Shift Operator

In the spectral representation of a harmonizable process:

$X_t = \int_{\mathbb{R}} e^{it\lambda} \, dZ(\lambda)$

The shift operator $S$ acts as a multiplication operator in the frequency domain:

$S\left(\int_{\mathbb{R}} f(\lambda) \, dZ(\lambda)\right) = \int_{\mathbb{R}} e^{i\lambda}f(\lambda) \, dZ(\lambda)$

This demonstrates that temporal shifts correspond to phase modulations in the spectral domain. When considering the invertibility of $S$, we are essentially examining the properties of the multiplication operator $M_{e^{i\lambda}}$ on $\mathscr{L}_*^2(\beta)$. The shift operator is invertible if and only if this multiplication operator is invertible, which occurs precisely when:

$\text{ess inf}_{\lambda \in \mathbb{R}} |e^{i\lambda}| > 0 \text{ and } \text{ess sup}_{\lambda \in \mathbb{R}} |e^{i\lambda}| < \infty$

Since $|e^{i\lambda}| = 1$ for all $\lambda$, the second condition is automatically satisfied. The first condition relates to the support properties of the spectral measure.

### Bochner-Fourier Duality

For harmonizable processes, the covariance function and the spectral bimeasure form a Fourier transform pair:

$R(s,t) = \mathbb{E}[X_s\overline{X_t}] = \int\int e^{is\lambda}e^{-it\mu} \, d\beta(\lambda,\mu)$

Conversely:

$\beta(A,B) = \lim_{n\to\infty} \sum_{s,t=-n}^n R(s,t)e^{-is\lambda}e^{it\mu} \chi_A(\lambda)\chi_B(\mu)$

where the limit is in the sense of measures.

This duality establishes that completeness in the spectral domain is equivalent to the existence of a generalized Fourier isomorphism between the time-domain Hilbert space $H_X$ and the frequency-domain space $\mathscr{L}_*^2(\beta)$.

### Frame Theory and Spectral Completeness

The exponential functions $\{e^{it\lambda}\}_{t \in \mathbb{Z}}$ form a Riesz basis for $\mathscr{L}_*^2(\beta)$ if and only if the spectral domain is complete. This is characterized by the frame condition:

$m\|f\|^2 \leq \sum_{t \in \mathbb{Z}} \left|\int_{\mathbb{R}} f(\lambda)e^{-it\lambda} \, d\mu(\lambda)\right|^2 \leq M\|f\|^2$

for constants $0 < m \leq M < \infty$ and all $f \in \mathscr{L}_*^2(\beta)$. This frame condition is equivalent to the invertibility of the shift operator.

### Spectral Factorization and Invertibility

When the shift operator is invertible, the bimeasure $\beta$ admits a spectral factorization:

$\beta(A,B) = \int_A \int_B h(\lambda)\overline{h(\mu)}K(\lambda,\mu) \, d\nu(\lambda) \, d\nu(\mu)$

where $h$ is bounded away from zero and infinity, $K$ is a positive definite kernel, and $\nu$ is a positive measure. This factorization connects to Wiener's celebrated work on spectral factorization of stationary processes, extending it to the harmonizable setting.

The function $h$ plays a crucial role: its non-vanishing property ($\inf_{\lambda}|h(\lambda)| > 0$) is precisely what guarantees the invertibility of the shift operator. This establishes a direct link between the analytical properties of the spectral representation and the dynamical properties of the process through the shift operator.

