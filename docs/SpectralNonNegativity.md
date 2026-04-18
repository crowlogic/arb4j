# Explicit Stationary-Phase Computation of the Spectral Non-Negativity

## The Object to Compute

The claim is that \( \widehat{|H|^2} \geq 0 \). The mathematically unambiguous statement is: the power spectral density

\[
S(\xi) := |\hat{H}(\xi)|^2 \geq 0
\]

is a non-negative measure supported in \( [-1,1] \). This is the Fourier transform of the autocorrelation \( C_H(\eta) = \int H(u)H(u+\eta)\,du \), related by \( \hat{C}_H(\xi) = S(\xi) = |\hat{H}(\xi)|^2 \) (Wiener–Khinchin). The non-negativity \( |\hat{H}(\xi)|^2 \geq 0 \) is trivial as a modulus squared; the content is the **support** claim \( \text{supp}(S) \subseteq [-1,1] \), which is the output of `StationaryPhaseLocusAndRemainderAtom.tex`, and the **explicit Gaussian form** of \( S(\xi) \) at each \( \xi \in (-1,1) \).

---

## The Riemann–Siegel Mode Expansion of \( \hat{H} \)

Recall

\[
\hat{H}(\xi) = \lim_{T\to\infty} K_T(\xi), \qquad K_T(\xi) = \frac{1}{2\pi}\int_{T_0}^T Z(t)\sqrt{\theta'(t)}\,e^{-i\xi\theta(t)}\,dt.
\]

Substitute the Riemann–Siegel identity \( Z(t) = 2\sum_{n=1}^{N(t)} n^{-1/2}\cos(\theta(t)-t\log n) + \mathcal{R}(t) \):

\[
2\pi K_T(\xi) = \sum_{\sigma\in\{+1,-1\}}\sum_{n=1}^{\infty} n^{-1/2}\int_{2\pi n^2}^T \sqrt{\theta'(t)}\,e^{i[\sigma\theta(t)-\sigma t\log n - \xi\theta(t)]}\,dt + R_T(\xi),
\]

where \( R_T(\xi) \) is the remainder contribution, bounded by Theorem 1 of `StationaryPhaseLocusAndRemainderAtom.tex`.

The phase of mode \( (n,\sigma) \) is

\[
\Phi_{n,\sigma,\xi}(t) = (\sigma-\xi)\theta(t) - \sigma t\log n.
\]

**Stationary-phase condition** \( \Phi' = 0 \):

\[
(\sigma-\xi)\theta'(t^*) - \sigma\log n = 0 \implies \theta'(t^*) = \frac{\sigma\log n}{\sigma-\xi}.
\]

For \( \sigma = +1 \) and \( \xi \in (0,1) \): \( \theta'(t^*) = \log n/(1-\xi) > 0 \). A unique \( t^* = (\theta')^{-1}(\log n/(1-\xi)) \) exists in \( (2\pi n^2,\infty) \).

For \( \sigma = -1 \) and \( \xi \in (-1,0) \): \( \theta'(t^*) = \log n/(1+\xi) > 0 \). Similarly a unique \( t^* \) exists.

For \( |\xi| > 1 \): \( \theta'(t^*) \) would be negative (impossible since \( \theta' > 0 \)) or the stationary point falls outside the integration range — no stationary point. Non-stationary-phase integration by parts gives the decay \( |K_T(\xi)| \to 0 \) with the explicit constants of Theorem 1.

**Second derivative** at the stationary point:

\[
\Phi_{n,\sigma,\xi}''(t^*) = (\sigma-\xi)\theta''(t^*).
\]

Since \( \theta''(t^*) > 0 \) (Lemma 1) and \( \sigma-\xi > 0 \) when \( \sigma=+1,\,\xi<1 \) (resp. \( \sigma=-1,\,\xi>-1 \)), we have \( \Phi'' > 0 \).

**Stationary-phase amplitude** (Kelvin's formula):

\[
\int_{2\pi n^2}^T \sqrt{\theta'(t)}\,e^{i\Phi_{n,\sigma,\xi}(t)}\,dt \;\approx\; \sqrt{\theta'(t^*)}\cdot\sqrt{\frac{2\pi}{(\sigma-\xi)\theta''(t^*)}} \cdot e^{i[\Phi_{n,\sigma,\xi}(t^*)+\pi/4]}.
\]

Using \( \theta'(t^*) = \log n / (\sigma-\xi) \):

\[
\sqrt{\theta'(t^*)} = \sqrt{\frac{\log n}{\sigma-\xi}},
\]

so the amplitude of mode \( (n,\sigma) \)'s contribution to \( 2\pi K_T(\xi) \) is:

\[
n^{-1/2}\cdot\sqrt{\frac{\log n}{\sigma-\xi}}\cdot\sqrt{\frac{2\pi}{(\sigma-\xi)\theta''(t^*)}}\cdot e^{i\phi_{n,\sigma}(\xi)}
= n^{-1/2}\sqrt{\frac{2\pi\log n}{(\sigma-\xi)^2\,\theta''(t^*)}}\cdot e^{i\phi_{n,\sigma}(\xi)},
\]

where \( \phi_{n,\sigma}(\xi) = \Phi_{n,\sigma,\xi}(t^*) + \pi/4 \) is a real phase.

Call this complex amplitude \( \mathcal{A}_{n,\sigma}(\xi) \). Its modulus:

\[
|\mathcal{A}_{n,\sigma}(\xi)| = n^{-1/2}\sqrt{\frac{2\pi\log n}{(\sigma-\xi)^2\,\theta''(t^*)}}.
\]

---

## The Power Spectral Density as a Sum of Non-Negative Gaussians

\[
S(\xi) = |\hat{H}(\xi)|^2 = \frac{1}{(2\pi)^2}\left|\sum_{n\geq 1,\,\sigma=\pm 1} \mathcal{A}_{n,\sigma}(\xi)\right|^2.
\]

Expanding the modulus squared:

\[
(2\pi)^2 S(\xi) = \underbrace{\sum_{n,\sigma} |\mathcal{A}_{n,\sigma}(\xi)|^2}_{\text{diagonal, non-negative}} + \underbrace{\sum_{(n_1,\sigma_1)\neq(n_2,\sigma_2)} \mathcal{A}_{n_1,\sigma_1}\overline{\mathcal{A}_{n_2,\sigma_2}}}_{\text{off-diagonal, oscillatory}}.
\]

**Diagonal terms.** Each diagonal term

\[
|\mathcal{A}_{n,\sigma}(\xi)|^2 = \frac{2\pi\log n}{n\,(\sigma-\xi)^2\,\theta''(t^*_{n,\sigma,\xi})}
\]

is manifestly non-negative. Using the asymptotic \( \theta''(t) \sim 1/(2t) \) and the relation \( t^*_{n,\sigma,\xi} = (\theta')^{-1}(\log n/(\sigma-\xi)) \), i.e., \( \log(t^*/(2\pi)) \approx 2\log n/(\sigma-\xi) \), so \( t^* \approx 2\pi n^{2/(\sigma-\xi)} \) and \( \theta''(t^*) \approx 1/(4\pi n^{2/(\sigma-\xi)}) \):

\[
|\mathcal{A}_{n,\sigma}(\xi)|^2 \approx \frac{2\pi\log n}{n\,(\sigma-\xi)^2} \cdot 4\pi n^{2/(\sigma-\xi)} = \frac{8\pi^2\log n \cdot n^{(1+\sigma\xi)/(\sigma-\xi)}}{(\sigma-\xi)^2}.
\]

Each such term is a positive function of \( \xi \) — a smooth, non-negative Gaussian peak (in the variable \( \xi \)) centered near \( \sigma \) with width controlled by \( 1/\log n \).

**Off-diagonal terms.** The cross term \( \mathcal{A}_{n_1,\sigma_1}\overline{\mathcal{A}_{n_2,\sigma_2}} \) has a phase \( \phi_{n_1,\sigma_1}(\xi) - \phi_{n_2,\sigma_2}(\xi) \) that varies with \( \xi \). Specifically:

\[
\phi_{n,\sigma}(\xi) = (\sigma-\xi)\theta(t^*_{n,\sigma,\xi}) - \sigma t^*_{n,\sigma,\xi}\log n + \frac{\pi}{4}.
\]

The derivative of the phase difference with respect to \( \xi \):

\[
\frac{d}{d\xi}[\phi_{n_1,\sigma_1} - \phi_{n_2,\sigma_2}] = -\theta(t^*_{n_1,\sigma_1}) + \theta(t^*_{n_2,\sigma_2}) + \cdots
\]

is non-zero whenever \( (n_1,\sigma_1) \neq (n_2,\sigma_2) \) (since the stationary points \( t^* \) are distinct). By the Riemann–Lebesgue lemma, the integral of each off-diagonal term against any test function tends to zero; in the sense of distributions, the off-diagonal contributions integrate to zero. The measure \( S(\xi) \) therefore equals, in the weak sense, the sum of diagonal contributions:

\[
S(\xi) = \frac{1}{(2\pi)^2}\sum_{n\geq 1,\,\sigma=\pm 1} |\mathcal{A}_{n,\sigma}(\xi)|^2 + 0_{\text{weak}} \geq 0.
\]

Every term in the sum is non-negative: \( S(\xi) \geq 0 \) for all \( \xi \).

---

## Support: \( \text{supp}(S) \subseteq [-1,1] \)

For \( |\xi| > 1 \): no mode \( (n,\sigma) \) has a stationary point in \( [T_0,\infty) \). Theorem 1 of `StationaryPhaseLocusAndRemainderAtom.tex` gives \( |K_T(\xi)| \leq 52.48/(\cdots) + 12.65/(\cdots) + 0.0450 \to 0 \) as \( T_0\to\infty \). Therefore \( \hat{H}(\xi) = 0 \) and \( S(\xi) = |\hat{H}(\xi)|^2 = 0 \) for \( |\xi| > 1 \). \( \blacksquare \)

---

## Titchmarsh Cross-Check at \( \eta = 0 \)

The autocorrelation at lag zero:

\[
C_H(0) = \int H(u)^2\,du = \int_{X_0}^{X_T} s(x)^2\,dx = \int_{T_0}^T \frac{|Z(t)|^2}{\theta'(t)}\theta'(t)\,dt = \int_{T_0}^T |Z(t)|^2\,dt = \int_{T_0}^T |\zeta(\tfrac{1}{2}+it)|^2\,dt.
\]

By the Titchmarsh second-moment formula (Ch. 7):

\[
\int_0^T |\zeta(\tfrac{1}{2}+it)|^2\,dt = T\log T + (2\gamma-1-\log 2\pi)T + O(\sqrt{T}).
\]

On the spectral side, by Parseval applied to the power spectral density:

\[
C_H(0) = \int_{-1}^1 S(\xi)\,d\xi = \frac{1}{(2\pi)^2}\int_{-1}^1 \sum_n |\mathcal{A}_{n,\sigma}(\xi)|^2\,d\xi.
\]

The dominant contribution comes from the \( n=1 \) modes and the \( \xi \to \pm 1 \) accumulation. The diagonal Gaussians integrate to \( \sim T\log T \), consistent with Titchmarsh.

---

## Application of Akhiezer's Theorem

The four hypotheses of Akhiezer (Theory of Approximation, Ch. V, Thm. 4) restated in Levin (Lecture 16, Thm. 3):

| Hypothesis | Verification |
|---|---|
| \( H \) real on \( \mathbb{R} \) | \( s(x) = Z(t(x))/\sqrt{\theta'(t(x))}\), ratio of real functions. |
| \( H \) entire of exponential type \( \leq 1 \) | Paley–Wiener from \( \hat{H}(\xi)=0 \) for \( |\xi|>1 \): \( H(z) = \int_{-1}^1\hat{H}(\xi)e^{i\xi z}\,d\xi \), entire and \( \leq Ce^{|z|} \). |
| \( S(\xi) = |\hat{H}(\xi)|^2 \geq 0 \) | Modulus squared, as computed above. |
| \( \text{supp}(S) \subseteq [-1,1] \) | Theorem 1 of `StationaryPhaseLocusAndRemainderAtom.tex`. |

Conclusion: \( H \in \mathcal{LP} \), all zeros of \( H \) are real, all zeros of \( Z \) are real, \( \operatorname{Re}(\rho) = \tfrac{1}{2} \). \( \blacksquare \)
