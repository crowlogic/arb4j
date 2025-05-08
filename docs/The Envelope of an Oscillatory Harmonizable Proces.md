<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# The Envelope of an Oscillatory Harmonizable Process: A Comprehensive Analysis

This paper examines the mathematical foundations and advancements in characterizing the envelope of oscillatory harmonizable processes, building upon Priestley's seminal work on oscillatory processes and their evolutionary spectra. By extending these concepts to the harmonizable framework, the authors establish conditions under which a unique envelope representation exists for a subclass of oscillatory harmonizable processes. The analysis integrates spectral theory, stochastic integration, and operator methods to resolve the non-uniqueness problem identified by Hasofer, providing a rigorous operator-theoretic proof of uniqueness under asymptotic stationarity conditions.

## Historical Context and Foundational Concepts

### Priestley's Oscillatory Processes

Maurice Priestley's 1965 introduction of oscillatory processes revolutionized the frequency analysis of nonstationary signals. These processes generalize stationary systems by incorporating a time-dependent modulating function \$ A(t, \lambda) \$ into the spectral representation:

$$
X(t) = \int_{\mathbb{R}} A(t, \lambda) e^{it\lambda} \hspace{0.17em} dZ(\lambda)
$$

where \$ Z(\cdot) \$ is an orthogonal stochastic measure, and \$ A(t, \lambda) \$ satisfies specific smoothness conditions. The covariance function of such processes takes the form:

$$
r(s, t) = \int_{\mathbb{R}} A(s, \lambda)A(t, \lambda)e^{i\lambda(s - t)} \hspace{0.17em} dG(\lambda)
$$

This structure permits time-localized frequency analysis but restricts \$ X(t) \$ to modulated stationary processes.

### Harmonizable Extensions

Weakly harmonizable processes, introduced by Loève and developed by Rao, relax stationarity by allowing correlated spectral components:

$$
X(t) = \int_{\mathbb{R}} e^{it\lambda} \hspace{0.17em} dZ(\lambda)
$$

with covariance:

$$
r(s, t) = \iint_{\mathbb{R}^2} e^{i(s\lambda - t\lambda')} \hspace{0.17em} dF(\lambda, \lambda')
$$

where \$ F \$ is a spectral bimeasure of bounded Fréchet variation. This framework accommodates non-decaying correlations but lacks the time-frequency localization of Priestley’s class.

## Oscillatory Harmonizable Processes

### Definition and Spectral Representation

Swift (1997) unified these paradigms by defining **oscillatory weakly harmonizable processes** through the covariance structure:

$$
r(s, t) = \iint_{\mathbb{R}^2} A(s, \lambda)A(t, \lambda')e^{i(s\lambda - t\lambda')} \hspace{0.17em} dF(\lambda, \lambda')
$$

where \$ A(t, \lambda) = \int_{\mathbb{R}} e^{it\lambda} \hspace{0.17em} dH(t, dx) \$ is a modulating function with maximum at \$ \lambda = 0 \$. The spectral representation becomes:

$$
X(t) = \int_{\mathbb{R}} A(t, \lambda)e^{it\lambda} \hspace{0.17em} dZ(\lambda)
$$

retaining Priestley’s modulation while permitting non-orthogonal increments in \$ Z \$.

### Non-Uniqueness of the Envelope

Hasofer (1979) demonstrated that oscillatory processes admit multiple envelope representations. For a process \$ Y(t) \$ and its Hilbert transform \$ \tilde{Y}(t) \$, the envelope \$ R(t) = \sqrt{Y^2(t) + \tilde{Y}^2(t)} \$ remains invariant under different \$ Y(t) \$ decompositions. This ambiguity arises because distinct quadrature processes \$ \tilde{Y}(t) \$ can yield identical \$ R(t) \$.

## Resolving Envelope Non-Uniqueness

### Time-Varying Filters and Asymptotic Stationarity

The authors introduce a time-varying filter \$ h(t_0, t, u) \$ initiated at \$ t_0 \$, whose Fourier transform defines the modulating function:

$$
A(t_0, t, \lambda) = \int_{\mathbb{R}} e^{i\lambda u}h(t_0, t, u) \hspace{0.17em} du
$$

Under the limit \$ t_0 \to -\infty \$, the filter converges to a time-invariant kernel \$ h(t - u) \$, rendering the filtered process:

$$
Y(t) = \int_{\mathbb{R}} h(t - u)X(u) \hspace{0.17em} du
$$

asymptotically stationary. This constraint imposes uniqueness on the Hilbert transform \$ \tilde{Y}(t) \$ by tying it to the causal structure of \$ h \$.

### Operator-Theoretic Uniqueness Proof

Let \$ K_{t_0} \$ and \$ K \$ denote the filtering operators for \$ Y(t_0, t) \$ and \$ Y(t) \$, respectively. Assuming invertibility of \$ K \$, any alternative representation \$ Y(t_0, t) = K'_{t_0}X' \$ must satisfy:

$$
X' = K'^{-1}KX
$$

Commutation of Hilbert transforms with \$ K'^{-1}K \$ forces:

$$
\tilde{Y} = K'\tilde{X}' = K'\left(K'^{-1}K\tilde{X}\right) = K\tilde{X}
$$

Thus, \$ \tilde{Y} \$ remains uniquely tied to \$ Y \$, eliminating representation ambiguity.

## Main Theorem and Implications

### Statement of Uniqueness

**Theorem (Swift):** Let \$ X(t) \$ be a weakly harmonizable process with spectral measure \$ Z \$ devoid of origin jumps. If a time-varying filter \$ h(t_0, t, u) \$ satisfies:

1. \$ \lim_{t_0 \to -\infty} h(t_0, t, u) = h(t - u) \$
2. \$ \lim_{t_0 \to -\infty} Y(t_0, t) = Y(t) \$

then the quadrature process \$ \tilde{Y}(t) \$ (and hence the envelope \$ R(t) \$) is unique.

### Proof Strategy

1. **Spectral Convergence:** The limiting filter \$ h(t - u) \$ ensures \$ Y(t) \$ inherits weak harmonizability from \$ X(t) \$.
2. **Covariance Constancy:** Competing representations \$ Y(t) = \int T_1(t, \lambda)e^{it\lambda} \hspace{0.17em} dZ(\lambda) \$ and \$ Y(t) = \int T_2(t, \lambda)e^{it\lambda} \hspace{0.17em} dZ(\lambda) \$ must yield identical covariances, forcing \$ T_1 = T_2 \$ almost everywhere.
3. **Hilbert Transform Equivalence:** Identical \$ T \$-operators produce identical \$ \tilde{Y}(t) \$, ensuring envelope uniqueness.

## Mathematical Machinery

### Bimeasures and Fréchet Variation

The spectral bimeasure \$ F(A, B) = \mathbb{E}[Z(A)Z(B)] \$ generalizes the power spectrum to nonstationary processes. Its bounded Fréchet variation:

$$
\|F\| = \sup \sum_{i,j} |F(A_i, B_j)|
$$

over partitions \$ \{A_i\}, \{B_j\} \$, ensures well-defined double integrals in harmonizable covariance expressions.

### Hilbert Transforms in \$ L^2(P) \$

For a weakly harmonizable \$ X(t) \$, the Hilbert transform:

$$
\tilde{X}(t) = \text{Im } 2 \int_{\mathbb{R}} e^{it\lambda} \hspace{0.17em} dZ(\lambda)
$$

is constructed to orthogonalize \$ X(t) \$ and \$ \tilde{X}(t) \$, critical for envelope coherence.

## Conclusion

This work resolves a longstanding non-uniqueness problem in signal envelope analysis by synthesizing harmonizable spectral theory with time-frequency modulation. The imposition of asymptotic stationarity through limiting filters provides a natural mechanism for uniqueness, with applications in nonstationary signal processing and stochastic differential equations. Future directions include extending these results to vector-valued processes and nonlinear systems where envelope representations remain pivotal.

<div style="text-align: center">⁂</div>

[^1]: paste.txt

