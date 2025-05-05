<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Harmonizability of Monotonic Time Deformations of Stationary Processes: A Comprehensive Analysis

The study of stochastic processes and their spectral representations forms a cornerstone of time series analysis, with wide-ranging applications from signal processing to financial mathematics. This report examines a fundamental theorem regarding the harmonizability of time-deformed stationary processes, providing a detailed exploration of the mathematical underpinnings, proof techniques, and implications of this result. At its core, the theorem establishes that applying a continuous, strictly monotonic time deformation to a stationary process yields a harmonizable process expressible through Priestley's evolutionary spectral representation. Through meticulous analysis of spectral measures, covariance structures, and operator-theoretic interpretations, this report elucidates how monotonic temporal transformations preserve key aspects of spectral structure while introducing controlled non-stationarity. The proof's elegance lies in its reveals of how phase modulation in the spectral domain compensates for nonlinear time warping, maintaining harmonizability through exponential reweighting of spectral components.

## Foundations of Stationary Processes and Spectral Representations

### Characterizing Second-Order Stationarity

A zero-mean stochastic process $\{X(t)\}_{t \in \mathbb{R}}$ is called **second-order stationary** if its covariance function $R_X(t,s) = \mathbb{E}[X(t)\overline{X(s)}]$ depends only on the time difference $t-s$. This implies the existence of a function $r_X: \mathbb{R} \to \mathbb{C}$ such that:

$$
R_X(t,s) = r_X(t-s).
$$

The spectral theorem for stationary processes guarantees that such processes admit a representation as stochastic integrals against orthogonal increment measures. Specifically, there exists a complex-valued random measure $Z$ with orthogonal increments such that:

$$
X(t) = \int_{\mathbb{R}} e^{i t \lambda} dZ(\lambda),
$$

where the integrator satisfies $\mathbb{E}[|dZ(\lambda)|^2] = dF(\lambda)$ for some bounded spectral measure $F$ on $\mathbb{R}$. This measure $F$ coincides with the Fourier transform of the covariance function through Bochner's theorem:

$$
r_X(h) = \int_{\mathbb{R}} e^{i h \lambda} dF(\lambda).
$$

### Spectral Decomposition and Orthogonal Increments

The orthogonal increment property of $Z$ ensures that for disjoint Borel sets $A,B \subset \mathbb{R}$:

$$
\mathbb{E}[Z(A)\overline{Z(B)}] = 0.
$$

This orthogonality propagates through the spectral representation, making the integral’s variance additive over frequency intervals. The measure $F$’s boundedness enforces that the process’s energy remains finite across all frequencies, a critical constraint for physical realizability.

## Time Deformations and Induced Non-Stationarity

### Monotonic Temporal Warping Operators

Consider a continuous, strictly increasing function $\theta: \mathbb{R} \to \mathbb{R}$. Applying $\theta$ to the time index of a stationary process $X(t)$ creates a new process $Y(t) = X(\theta(t))$. If $\theta$ is nonlinear, this deformation typically destroys stationarity-for example, time dilation/compression induces varying local correlation structures. However, the theorem asserts that despite lost stationarity, $Y(t)$ remains **harmonizable**, meaning its covariance admits a double Fourier integral representation:

$$
\mathbb{E}[Y(t)\overline{Y(s)}] = \int_{\mathbb{R}} \int_{\mathbb{R}} e^{i(t\lambda - s\mu)} d\Sigma(\lambda,\mu),
$$

for some complex bivariate measure $\Sigma$. Harmonizable processes generalize stationary ones by allowing frequency components to interact coherently across time.

### Constructing Evolutionary Spectral Representations

Maurice Priestley’s evolutionary spectrum theory provides a framework for representing certain non-stationary processes through **locally stationary** approximations. A process $Y(t)$ admits an evolutionary spectral representation if:

$$
Y(t) = \int_{\mathbb{R}} e^{i t \lambda} A_t(\lambda) dZ(\lambda),
$$

where $A_t(\lambda)$ modulates the amplitude and phase of spectral components over time. The theorem identifies $A_t(\lambda) = e^{i(\theta(t)-t)\lambda}$ as the precise phase adjustment compensating for time warping.

## Core Theorem and Proof Strategy

### Formal Statement of the Theorem

Let $X(t)$ be a zero-mean, second-order stationary process with spectral representation:

$$
X(t) = \int_{\mathbb{R}} e^{i t \lambda} dZ(\lambda), \quad \mathbb{E}[|dZ(\lambda)|^2] = dF(\lambda).
$$

For a continuous, strictly increasing $\theta: \mathbb{R} \to \mathbb{R}$, define the time-deformed process $Y(t) = X(\theta(t))$. Then, $Y(t)$ possesses an evolutionary spectral representation:

$$
Y(t) = \int_{\mathbb{R}} e^{i t \lambda} A_t(\lambda) dZ(\lambda), \quad A_t(\lambda) = e^{i(\theta(t)-t)\lambda}.
$$

### Step-by-Step Proof Construction

#### Substituting the Time Deformation

Starting from the spectral representation of $X(t)$, substitute $\tau = \theta(t)$ directly:

$$
Y(t) = X(\theta(t)) = \int_{\mathbb{R}} e^{i \theta(t) \lambda} dZ(\lambda).
$$

The critical insight involves rewriting the exponential’s argument to isolate a term proportional to $t$. Observe that:

$$
\theta(t) = t + (\theta(t) - t),
$$

which allows factoring:

$$
e^{i \theta(t)\lambda} = e^{i t \lambda} \cdot e^{i (\theta(t) - t)\lambda}.
$$

Thus:

$$
Y(t) = \int_{\mathbb{R}} e^{i t \lambda} \underbrace{e^{i (\theta(t) - t)\lambda}}_{A_t(\lambda)} dZ(\lambda).
$$

This explicitly exhibits $Y(t)$ in Priestley’s evolutionary form with modulator $A_t(\lambda)$.

#### Covariance Structure Verification

To confirm harmonizability, compute:

$$
\mathbb{E}[Y(t)\overline{Y(s)}] = \mathbb{E}\left[ \int_{\mathbb{R}} e^{i t \lambda} A_t(\lambda) dZ(\lambda) \cdot \int_{\mathbb{R}} e^{-i s \mu} \overline{A_s(\mu)} \overline{dZ(\mu)} \right].
$$

Using the orthogonal increment property:

$$
\mathbb{E}[dZ(\lambda)\overline{dZ(\mu)}] = \delta(\lambda - \mu) dF(\lambda),
$$

yielding:

$$
\mathbb{E}[Y(t)\overline{Y(s)}] = \int_{\mathbb{R}} e^{i (t - s)\lambda} A_t(\lambda)\overline{A_s(\lambda)} dF(\lambda).
$$

Substituting $A_t(\lambda) = e^{i(\theta(t)-t)\lambda}$ gives:

$$
\mathbb{E}[Y(t)\overline{Y(s)}] = \int_{\mathbb{R}} e^{i (\theta(t) - \theta(s))\lambda} dF(\lambda).
$$

This matches the covariance of the original stationary process evaluated at the warped time difference $\theta(t) - \theta(s)$, confirming that the deformation preserves the connection to $X(t)$’s spectral structure.

## Implications and Theoretical Extensions

### Phase Modulation Interpretation

The modulator $A_t(\lambda) = e^{i(\theta(t)-t)\lambda}$ introduces a **frequency-dependent phase shift** compensating for temporal warping. For each frequency $\lambda$, the phase adjustment $(\theta(t)-t)\lambda$ realigns spectral components to maintain coherence under the time deformation. This suggests that monotonic time warps correspond to smooth, predictable phase distortions in the frequency domain.

### Connection to Doppler Effects

In radar/sonar applications, moving targets induce Doppler time warping $\theta(t) = t + vt$ (for constant velocity $v$). The theorem then yields $A_t(\lambda) = e^{i v t \lambda}$, matching the classical Doppler shift’s phase modulation. This bridges stochastic process theory with physical waveform analysis.

### Nonlinear Time Deformations

For nonlinear $\theta(t)$ (e.g., $\theta(t) = t + \alpha t^2$), the phase modulation becomes time-frequency coupled:

$$
A_t(\lambda) = e^{i \alpha t^2 \lambda}.
$$

This creates quadratic spectral chirps, illustrating how non-uniform time scaling generates complex frequency trajectories while maintaining harmonizability.

## Comparative Analysis with Alternative Approaches

### Karhunen-Loève Expansions

While the Karhunen-Loève expansion represents non-stationary processes through deterministic basis functions with uncorrelated coefficients, Priestley’s approach retains the frequency-domain interpretation crucial for many applications. The theorem shows that time deformations of stationary processes form a subset of Priestley-representable processes with explicit modulators.

### Wigner-Ville Distributions

Time-frequency distributions like the Wigner-Ville spectrum provide complementary perspectives. For $Y(t)$, the Wigner-Ville distribution would reveal energy concentrations along curves $\lambda(t) = \theta'(t)\lambda_0$, reflecting the local stretching/compression of spectral content.

## Practical Considerations and Applications

### Signal Resampling and Warping

In signal processing, resampling a stationary signal via $\theta^{-1}(t)$ can remove nonlinear time warping. The theorem guarantees that such operations remain well-posed in the evolutionary spectral domain, enabling phase-corrected resynthesis.

### Nonstationary Time Series Analysis

For econometric or biological time series exhibiting growth-related nonstationarity (e.g., GDP series), applying $\theta(t) = \log t$ could stationarize the process while maintaining harmonizability. Forecasting models could then leverage the evolutionary spectral representation for improved predictions.

## Conclusion

This analysis substantiates that monotonic time deformations of stationary processes yield harmonizable processes describable through phase-modulated evolutionary spectra. The proof technique-centered on spectral measure manipulation and covariance structure preservation-highlights deep connections between temporal transformations and frequency-domain adjustments. Future directions include extending these results to multivariate processes and investigating connections to operator-based nonstationary models. The theorem’s utility in applications ranging from Doppler correction to time-series warping underscores the enduring relevance of spectral methods in stochastic process theory.

$$
\boxed{Y(t) = \int_{\mathbb{R}} e^{i t \lambda} e^{i (\theta(t) - t)\lambda} dZ(\lambda)}
$$

