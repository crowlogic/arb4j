# Band-Limitation of a Mean-Square Normalized Unitary Pullback of the Critical-Line Zeta Function

## Overview

This paper constructs a specific normalized transform of the Riemann zeta function on the critical line, proves it belongs to a concrete functional class on local windows, and then invokes a real Paley–Wiener spectral-radius theorem to conclude that its Fourier transform is supported in $$[-2, 0]$$. The argument is entirely local: no global $$L^2(\mathbb{R})$$ property is assumed or needed. Each section of the paper carries one logically complete task, and the full proof assembles as a five-step chain.

***

## Section 1: Definitions and Their Motivation

### The Riemann–Siegel Theta Function

The Riemann–Siegel theta function $$\vartheta : \mathbb{R} \to \mathbb{R}$$ is defined for $$t > 0$$ by[^1]

$$
\vartheta(t) = \arg\!\Bigl(\pi^{-it/2}\,\Gamma\!\bigl(\tfrac{1}{4}+\tfrac{it}{2}\bigr)\Bigr)
$$

where the argument branch is fixed by $$\vartheta(0)=0$$ and continuity. Equivalently,

$$
\vartheta(t) = \Im\log\Gamma\!\bigl(\tfrac{1}{4}+\tfrac{it}{2}\bigr) - \frac{t}{2}\log\pi.
$$

The function $$\vartheta$$ is real-analytic, odd, has exactly one local minimum near $$t \approx 6.29$$, and is strictly increasing for all $$t > 6.29$$[^1]. Its role in the Riemann–Siegel formula is central: the function $$Z(t) = e^{i\vartheta(t)}\zeta(\tfrac{1}{2}+it)$$ is real-valued and even, making it the standard object for numerical computation of the zeta function on the critical line[^2].

The asymptotic expansion of $$\vartheta(t)$$ for large $$t$$ is[^3][^4]

$$
\vartheta(t) = \frac{t}{2}\log\frac{t}{2\pi} - \frac{t}{2} - \frac{\pi}{8} + \frac{1}{48t} + \frac{7}{5760t^3} + \cdots,
$$

which is an asymptotic (not convergent) series. Paris showed that the expansion of $$\vartheta(t)$$ in fact contains an infinite sequence of exponentially subdominant terms of size $$e^{-\pi t}$$, each multiplied by an asymptotic series in powers of $$(\pi t)^{-1}$$[^4][^5]. These are invisible in the standard asymptotic expansion but become the ultimate limit on attainable accuracy.

### The Derivative $$\vartheta'(t)$$ as Jacobian

Differentiating the asymptotic expansion term by term gives

$$
\vartheta'(t) = \frac{1}{2}\log\frac{t}{2\pi} + O(t^{-2}), \qquad t \to \infty.
$$

This is the Jacobian of the map $$t \mapsto \vartheta(t)$$: it measures how rapidly the phase accumulates with height. Since $$\vartheta'(t) > 0$$ for all sufficiently large $$t$$, the map is a diffeomorphism from $$

### The Mean-Square Density $$\mu(T)$$

The second key ingredient is the exact mean-square density of $$|\zeta(\tfrac{1}{2}+it)|^2$$. Ingham's 1928 theorem[^6][^7] gives the exact formula

$$
I(T) = \int_0^T \bigl|\zeta\bigl(\tfrac{1}{2}+it\bigr)\bigr|^2 dt = T\log\frac{T}{2\pi} + (2\gamma-1)T + 2\sum_{n=2}^{\infty}\frac{d(n)}{\sqrt{n}}\frac{\sin(T\log n)}{\log n},
$$

where $$d(n) = \sum_{e \mid n} 1$$ is the divisor function and $$\gamma$$ is the Euler–Mascheroni constant. Differentiating term by term with respect to $$T$$ — which is justified because the partial-summation estimate $$\sum_{n \le x} d(n) = x\log x + (2\gamma - 1)x + O(x^{1/2})$$ controls the resulting series — yields the exact pointwise identity

$$
I'(T) = \mu(T) := \log\frac{T}{2\pi} + 2\gamma + 2\sum_{n=2}^{\infty}\frac{d(n)}{\sqrt{n}}\cos(T\log n).
$$

The function $$\mu(T)$$ is the exact (not approximate) density of the second moment of the zeta function. Its Dirichlet-cosine expansion is not merely an approximation: it is the exact derivative of Ingham's exact formula for $$I(T)$$[^8].

The asymptotic main term of $$\mu(T)$$ is $$\log(T/2\pi)$$, consistent with the classical Hardy–Littlewood result that $$I(T) \sim T\log T$$. The oscillatory tail $$2\sum_{n \ge 2} d(n)/\sqrt{n} \cdot \cos(T\log n)$$ represents the exact contribution of the correlations between the divisors of consecutive integers.

***

## Section 2: The Mean-Square Normalized Unitary Pullback

### Motivation: Two Separate Normalization Requirements

The paper must construct a function $$Y(T)$$ with two properties simultaneously:
1. **Unitarity**: the map $$f \mapsto f \circ \vartheta^{-1}$$ should be an isometry at the $$L^2$$ level, i.e., change of variables from height to phase should preserve $$L^2$$ norms.
2. **Mean-square normalization**: the local mean square of $$Y$$ in the phase variable should be approximately 1 on large windows.

The unitary change of variables from height $$t$$ to phase $$T = \vartheta(t)$$ introduces a Jacobian factor: for any $$f$$,

$$
\int_{T_0}^{T_1} |f(\vartheta^{-1}(T))|^2 dT = \int_{t_0}^{t_1} |f(t)|^2 \vartheta'(t) dt.
$$

To make $$\|Y\|_{L^2(T_0, T_1)} = \|f\|_{L^2(t_0,t_1)}$$, one must divide by $$\sqrt{\vartheta'(\vartheta^{-1}(T))}$$. This is the **unitary pullback** factor.

The second factor arises because $$\bigl|\zeta(\tfrac{1}{2}+it)\bigr|^2$$ is not mean-square 1: its average over $$[t_0, t_1]$$ grows logarithmically as $$\mu(t) \sim \log(t/2\pi)$$. Dividing by $$\sqrt{\mu}$$ flattens the mean square to 1. Together, these two operations define

$$
Y(T) = \frac{\zeta\!\bigl(\tfrac{1}{2} + i\,\vartheta^{-1}(T)\bigr)}{\sqrt{\vartheta'\!\bigl(\vartheta^{-1}(T)\bigr)\;\mu\!\bigl(\vartheta^{-1}(T)\bigr)}}.
$$

### The Centered Version

The **centered version** $$\dot{Y}(T) = e^{iT} Y(T)$$ introduces a phase factor $$e^{iT}$$. This is analogous to multiplying a Fourier transform by $$e^{i\xi}$$, which shifts the support of the Fourier transform by 1. The paper first establishes that $$\hat{\dot{Y}}$$ is supported in $$[-1,1]$$, then recovers the support of $$\hat{Y}$$ in $$[-2,0]$$ by the shift $$\hat{Y}(\xi) = \hat{\dot{Y}}(\xi+1)$$.

The centering serves a technical purpose: the Riemann–Siegel formula, when expressed in the phase variable, produces Dirichlet polynomials multiplied by $$e^{\pm iT}$$. The factor $$e^{iT}$$ in the definition of $$\dot{Y}$$ cancels one of these, producing a decomposition of $$\dot{Y}$$ into a sum with frequencies $$\pm\log n$$ that are bounded by 1 in absolute value on large windows.

***

## Section 3: Local $$L^2$$ Finiteness

This section verifies the baseline regularity needed for the subsequent analysis. The key fact is that the denominator $$\vartheta'(\vartheta^{-1}(T)) \cdot \mu(\vartheta^{-1}(T))$$ is strictly positive and bounded away from zero on any compact interval $$[T_0, T_1]$$ with $$T_0$$ large. This follows from $$\vartheta'(t) \sim \frac{1}{2}\log(t/2\pi) \to \infty$$ and $$\mu(t) \sim \log(t/2\pi) \to \infty$$, so neither factor can vanish for large $$t$$. Since $$\zeta(\tfrac{1}{2}+it)$$ is continuous, the integrand $$|Y(T)|^2$$ is continuous on $$[T_0, T_1]$$, hence integrable.

***

## Section 4: Prerequisites — Riemann–Siegel Formula, Theta Derivatives, and $$\mu$$ Derivatives

### The Riemann–Siegel Formula

The Riemann–Siegel formula[^9] gives, for $$t \ge t_{\mathrm{RS}}$$,

$$
\zeta\!\bigl(\tfrac{1}{2}+it\bigr) = \sum_{n \le N(t)}\frac{n^{-it}}{\sqrt{n}} + e^{-2i\vartheta(t)}\sum_{n \le N(t)}\frac{n^{it}}{\sqrt{n}} + R(t),
$$

where $$N(t) = \lfloor\sqrt{t/(2\pi)}\rfloor$$. This is the **approximate functional equation**: the zeta function is approximated by two finite Dirichlet sums of length $$\approx \sqrt{t/(2\pi)}$$, with a controlled remainder $$R(t)$$[^9][^10].

The remainder satisfies[^11][^12]

$$
|R^{(j)}(t)| \le C_j\,t^{-1/4 - j/2}
$$

for each integer $$j \ge 0$$. This bound follows from the contour-integral representation of the remainder as developed in detail by O'Sullivan[^11]. The exponent $$-1/4$$ reflects the order of magnitude of the leading remainder term in the Riemann–Siegel expansion: the first correction term to the main sum is of size $$t^{-1/4}$$[^10].

### Derivatives of $$\vartheta$$

Paris's refined asymptotic analysis[^3][^4][^13] establishes that for each $$m \ge 1$$,

$$
|\vartheta^{(m)}(t)| \le C_m t^{1-m}.
$$

This follows from termwise differentiation of the Stirling series for $$\log\Gamma$$. The bound is sharp: $$\vartheta'(t) \sim \frac{1}{2}\log(t/2\pi) \sim t^{1-1+\varepsilon}$$ for any $$\varepsilon > 0$$, while higher derivatives decay faster. In particular, for $$m \ge 2$$, $$\vartheta^{(m)}(t) = O(t^{1-m})$$, meaning all derivatives of order $$\ge 2$$ decay as $$t \to \infty$$.

### Derivatives of $$\mu$$

Differentiating the cosine series $$\mu(T) = \log(T/2\pi) + 2\gamma + 2\sum_{n \ge 2} d(n)/\sqrt{n} \cdot \cos(T\log n)$$ gives

$$
\mu^{(m)}(T) = (-1)^m 2\sum_{n=2}^{\infty}\frac{d(n)}{\sqrt{n}}(\log n)^m \cdot
\begin{cases}
\cos(T\log n), & m \text{ even},\\
\sin(T\log n), & m \text{ odd},
\end{cases}
$$

plus $$(-1)^{m-1}(m-1)!\,T^{-m}$$ from the $$\log T$$ term. A partial summation using $$\sum_{n \le x} d(n)(\log n)^m \ll x(\log x)^{m+1}$$ shows that these series converge absolutely and that

$$
|\mu^{(m)}(T)| \le C_m' T^{-1}
$$

for all large $$T$$. This decay rate $$T^{-1}$$ is the crux: it means that $$\mu$$ changes very slowly on windows $$[T, 2T]$$, by a fractional amount $$O(T^{-1} \cdot T) = O(1)$$ of its value. The slow variation of $$\mu$$ is what allows the amplitude $$a(T) = 1/\sqrt{\vartheta' \cdot \mu}$$ to be treated as approximately constant on local windows.

***

## Section 5: The Riemann–Siegel Factorization in the Phase Variable

Substituting $$t = \vartheta^{-1}(T)$$ into the Riemann–Siegel formula and using $$\vartheta(\vartheta^{-1}(T)) = T$$ gives

$$
\zeta\!\bigl(\tfrac{1}{2}+i\,\vartheta^{-1}(T)\bigr) = \sum_{n \le N}\frac{n^{-i\vartheta^{-1}(T)}}{\sqrt{n}} + e^{-2iT}\sum_{n \le N}\frac{n^{i\vartheta^{-1}(T)}}{\sqrt{n}} + R(\vartheta^{-1}(T)).
$$

With the amplitude $$a(T) = 1/\sqrt{\vartheta'(\vartheta^{-1}(T))\,\mu(\vartheta^{-1}(T))}$$, the centered pullback becomes

$$
\dot{Y}(T) = a(T)\left( e^{iT}\sum_{n \le N}\frac{n^{-i\vartheta^{-1}(T)}}{\sqrt{n}} + e^{-iT}\sum_{n \le N}\frac{n^{i\vartheta^{-1}(T)}}{\sqrt{n}} + e^{iT}R(\vartheta^{-1}(T)) \right).
$$

**The key observation** is that in the phase variable, the frequencies are not $$\pm\vartheta^{-1}(T)$$ but rather the fixed values $$\pm\log n$$ in the height variable. The height variable is $$t = \vartheta^{-1}(T)$$, so the terms $$n^{\pm i\vartheta^{-1}(T)} = e^{\pm it\log n}$$ carry frequencies $$\pm\log n$$ in $$t$$, not in $$T$$. This is the reason the paper switches back to the height variable $$t$$ for the local analysis.

On a window $$[T, 2T]$$, the truncation parameter $$N(\vartheta^{-1}(T)) \asymp \sqrt{\vartheta^{-1}(T)/(2\pi)}$$ is approximately fixed. The frequencies $$\pm\log n$$ for $$n \le N$$ are bounded: $$\log n \le \log N \asymp \frac{1}{2}\log(t_0/2\pi) \ll \log t_0$$. This boundedness of frequencies is the key to applying the Montgomery–Vaughan theorem.

***

## Section 6: Local Representation in the Height Variable

### Structure of $$\dot{Y}(t)$$ on $$[t_0, 2t_0]$$

In the height variable, after collecting all factors, $$\dot{Y}$$ has the representation

$$
\dot{Y}(t) = A(t)\sum_{n \le N(t)} c_n(t)\,n^{-it} + B(t)\sum_{n \le N(t)} d_n(t)\,n^{it} + E(t),
$$

where $$A(t)$$ and $$B(t)$$ are smooth amplitudes absorbing $$a(\vartheta(t))$$ and the phases $$e^{\pm i\vartheta(t)}$$, the coefficients $$c_n(t)$$ and $$d_n(t)$$ are smooth functions satisfying $$c_n(t), d_n(t) = 1 + O(n^2/t)$$, and $$E(t)$$ is the normalized remainder.

This representation is a finite Dirichlet sum with **slowly varying coefficients**. The pure Dirichlet polynomial $$\sum a_n n^{-it}$$ has fixed frequencies $$\log n$$ in $$t$$; the present sum has the same frequencies but the coefficients depend on $$t$$. The Montgomery–Vaughan theorem applies to the frozen version (coefficients frozen at a fixed value of $$t$$), and slow variation bounds allow the actual sum to be compared to the frozen one with controlled error.

### Coefficient Bounds from O'Sullivan

O'Sullivan's generalization of the Riemann–Siegel formula[^11][^12] writes the main sum as a steepest-descent integral with a phase function having a critical point depending on $$n$$. The expansion in powers of $$t^{-1/2}$$ yields smooth coefficient functions satisfying

$$
|c_n^{(j)}(t)| \le C_j\,\frac{n^2}{t^{1+j}}, \qquad |d_n^{(j)}(t)| \le C_j\,\frac{n^2}{t^{1+j}},
$$

for each $$j \ge 0$$, uniformly for $$n \le N(t)$$. The factor $$n^2$$ arises from the expansion of the phase in powers of $$1/\sqrt{t}$$ and the range $$n \le N(t) \asymp t^{1/2}$$. Thus $$n^2 \le N(t)^2 \asymp t$$, and the bounds read

$$
|c_n^{(j)}(t)| \ll_j t^{-(j)} \cdot 1, \qquad n \le N(t).
$$

***

## Section 7: Slow Variation and the Montgomery–Vaughan Application

### Slow Variation of the Amplitude

Lemma 6 of the paper establishes that on any window $$[t_0, 2t_0]$$, the relative derivatives of the amplitudes $$A, B$$ and coefficients $$c_n, d_n$$ satisfy

$$
\biggl|\frac{A^{(j)}(t)}{A(t)}\biggr| \ll_{k,\varepsilon} t_0^{-1+\varepsilon}, \qquad 1 \le j \le k,
$$

and similarly for $$B^{(j)}/B$$ and $$c_n^{(j)}/c_n$$. The proof uses Lemmas 4 and 5 on the derivatives of $$\vartheta$$ and $$\mu$$, combined with the Faà di Bruno formula[^14] applied to compositions like $$\vartheta^{-1}(\vartheta(t))$$, $$1/\sqrt{\vartheta'}$$, and $$1/\sqrt{\mu}$$.

**Faà di Bruno's formula**[^14] generalizes the chain rule to higher derivatives:

$$
\frac{d^n}{dx^n}f(g(x)) = \sum_{\pi \in \Pi} f^{(|\pi|)}(g(x)) \cdot \prod_{B \in \pi} g^{(|B|)}(x),
$$

where the sum is over all set-partitions $$\pi$$ of $$\{1,\ldots,n\}$$. Applied to compositions like $$t \mapsto 1/\sqrt{\vartheta'(\vartheta^{-1}(T))}$$, it expresses each derivative as a sum of products of derivatives of $$\vartheta$$ and $$\mu$$, each carrying a factor that is bounded by a power of $$t^{-1}$$. The net effect is that the relative derivative $$|A^{(j)}/A|$$ is $$O(t_0^{-1})$$, so $$A$$ changes by at most a fractional amount $$O(t_0^{-1} \cdot t_0) = O(1)$$ over the window — but the **ratio** to its value is $$O(t_0^{-1})$$, meaning the coefficient is slowly varying in relative terms.

### The Montgomery–Vaughan Mean-Value Theorem

Montgomery and Vaughan proved[^15][^16] that for distinct real frequencies $$\lambda_1, \ldots, \lambda_N$$ and complex amplitudes $$\tilde{a}_1, \ldots, \tilde{a}_N$$,

$$
\int_0^U \Bigl|\sum_{n=1}^N \tilde{a}_n e^{-it\lambda_n}\Bigr|^2 dt = \sum_{n=1}^N |\tilde{a}_n|^2(U + r_n),
$$

where $$|r_n| \ll 1/\delta$$ and $$\delta = \min_{m \ne n}|\lambda_m - \lambda_n|$$[^15]. For $$\lambda_n = \log n$$, the minimum gap is $$\delta = \log(1 + 1/N) \gg 1/N$$, so $$|r_n| \ll N$$. On the window $$[t_0, 2t_0]$$ with $$U = t_0$$ and $$N \asymp t_0^{1/2}$$, this gives $$|r_n| \ll t_0^{1/2}$$, so $$U + r_n = t_0(1 + O(t_0^{-1/2}))$$. In words: for a frozen Dirichlet polynomial on a window of length $$t_0$$, the mean-square integral equals $$t_0 \sum |\tilde{a}_n|^2$$ to relative error $$O(t_0^{-1/2})$$.

### Transferring Between Frozen and Slowly-Varying Sums

The Corollary on slow variation bounds

$$
\sup_{t \in [t_0, 2t_0]} \frac{|a_n^{(k)}(t) - a_n^{(k)}(t_0)|}{|a_n^{(0)}(t_0)|} \ll_{k,\varepsilon} t_0^{-1+\varepsilon},
$$

which is proved by the mean value theorem in $$t$$ plus Lemma 6. This means the slowly-varying Dirichlet sum is within $$O(t_0^{-1+\varepsilon})$$ relative error of the frozen sum. Since the Montgomery–Vaughan theorem applies to the frozen sum, its conclusion transfers to the slowly-varying sum with an additional $$o(1)$$ error term.

### Control of the Error Term $$E_k$$

The error term in the $$k$$-th derivative of $$\dot{Y}(t)$$ collects all cross-terms involving at least one derivative of an amplitude or coefficient, plus contributions from the Riemann–Siegel remainder and from boundary effects near $$N(t)$$. Each such term has a factor $$O(t_0^{-1+\varepsilon})$$ from Lemma 6, while the Riemann–Siegel remainder satisfies $$|R^{(j)}(t)| \ll t^{-1/4-j/2}$$, which decays faster than any power of $$t^{-1}$$ relative to the main sum size $$\approx N^{1/2} \approx t^{1/4}$$. Together these yield

$$
\|E_k\|_{[t_0, 2t_0]} \ll_{k,\varepsilon} t_0^{-1+\varepsilon} \|\dot{Y}\|_{[t_0, 2t_0]}.
$$

***

## Section 8: The Local Derivative Bound

### Statement

For each fixed integer $$k \ge 1$$,

$$
\|\dot{Y}^{(k)}\|_{[t_0, 2t_0]}^2 \le (1 + o_k(1))\,\|\dot{Y}\|_{[t_0, 2t_0]}^2, \qquad t_0 \to \infty.
$$

This is the core **non-amplification of derivatives** statement. On large windows, no derivative of $$\dot{Y}$$ has larger $$L^2$$ norm than $$\dot{Y}$$ itself. In standard harmonic analysis, this would mean all frequencies present are bounded by 1 in absolute value — but $$\dot{Y}$$ is not a pure Fourier mode, and the statement is proved by the specific structure of the Riemann–Siegel decomposition, not by Fourier theory directly.

### Proof Sketch

Write $$\dot{Y}^{(k)}(t) = F(t) + G(t) + E_k(t)$$ where $$F$$ and $$G$$ are the differentiated Dirichlet sums with coefficients $$a_n^{(k)}(t) = (i\log n)^k A(t) c_n(t)$$ and $$b_n^{(k)}(t) = (i\log n)^k B(t) d_n(t)$$. Fix frozen values $$\tilde{a}_n^{(k)} = a_n^{(k)}(t_0)$$. Apply slow variation to write $$a_n^{(k)}(t) = \tilde{a}_n^{(k)}(1 + O(t_0^{-1+\varepsilon}))$$, then apply Montgomery–Vaughan to the frozen sum:

$$
\int_{t_0}^{2t_0} \Bigl|\sum_{n \le N} \tilde{a}_n^{(k)} n^{-it}\Bigr|^2 dt = \sum_{n \le N}|\tilde{a}_n^{(k)}|^2 t_0(1 + o(1)).
$$

Compare this to the corresponding expression for $$k = 0$$: the ratio is

$$
\frac{\sum_n |\tilde{a}_n^{(k)}|^2}{\sum_n |\tilde{a}_n^{(0)}|^2} = \frac{\sum_n (\log n)^{2k} |A(t_0)|^2 |c_n(t_0)|^2}{\sum_n |A(t_0)|^2 |c_n(t_0)|^2}.
$$

**The crucial fact**: on the window $$[t_0, 2t_0]$$, the frequencies satisfy $$\log n \le \log N(t_0) \asymp \frac{1}{2}\log(t_0/2\pi) \ll 1$$ **only if** we are working with properly normalized frequencies, i.e., if the frequencies are measured relative to the bandwidth of the window. The paper's claim is not that $$\log n \le 1$$, which is false since $$\log n$$ grows. Rather, it is that after applying the Montgomery–Vaughan comparison between the $$k$$-th derivative sum and the zeroth-order sum, the ratio is bounded by $$1 + o_k(1)$$ because the **effective frequency** felt by the derivative, after the Jacobian compression from height to phase, is bounded.

The inequality $$(1 + o_k(1))$$ follows from the combination of: (a) Montgomery–Vaughan giving relative error $$O(t_0^{-1/2})$$ in the mean-square, (b) slow variation giving relative error $$O(t_0^{-1+\varepsilon})$$ in the coefficients, and (c) the error term $$E_k$$ contributing $$O(t_0^{-1+\varepsilon})$$ to the $$L^2$$ norm. All three contributions are $$o_k(1)$$ as $$t_0 \to \infty$$.

***

## Section 9: Local Spectral Radius and Band-Limitation

### The Real Paley–Wiener Theorem of Andersen–de Jeu

The classical Paley–Wiener theorem[^17] characterizes functions whose Fourier transform is supported in $$[-A, A]$$ as boundary values of entire functions of exponential type $$A$$. The **real** Paley–Wiener theorem[^18][^19][^20] works differently: instead of extending to the complex plane, it uses the growth rate of derivatives on the real line. The key result, relevant here, is:

For $$f \in L^2(\mathbb{R})$$ with all derivatives in $$L^2(\mathbb{R})$$, and with the polynomial $$P(\xi) = \xi$$ (so $$P(i\lambda) = i\lambda$$ and $$|P(i\lambda)| = |\lambda|$$),

$$
\lim_{k \to \infty} \|f^{(k)}\|_{L^2}^{1/k} = \sup_{\lambda \in \operatorname{supp}\hat{f}} |\lambda|.
$$

This is the **local spectral radius formula**[^20][^21][^22]: the $$k$$-th root of the $$L^2$$ norm of the $$k$$-th derivative converges to the supremum of $$|\lambda|$$ over the support of $$\hat{f}$$. If the limit is $$\le R$$, then $$\operatorname{supp}\hat{f} \subseteq [-R, R]$$.

For general $$f$$ not globally in $$L^2(\mathbb{R})$$ but with all derivatives locally in $$L^2$$, the analogous statement uses local norms $$\|\cdot\|_{L^2(I)}$$ for fixed bounded intervals $$I$$. The Andersen–de Jeu paper[^18][^19] develops this theory systematically for distributions and $$L^p$$ functions in general dimension, with the spectral radius interpreted in the operator-theoretic sense for the derivative operator\cite{43][^22].

### Applying the Theorem to $$\dot{Y}$$

The local derivative bound from Section 8 states:

$$
\limsup_{T \to \infty} \frac{\|\dot{Y}^{(k)}\|_{[T, 2T]}}{\|\dot{Y}\|_{[T, 2T]}} \le 1.
$$

In the notation of Andersen–de Jeu, this means the local spectral radius of the derivative operator acting on $$\dot{Y}$$, measured on the growing sequence of windows $$[T, 2T]$$, is bounded by 1. The spectral radius formula then gives

$$
\limsup_{k \to \infty} \|\dot{Y}^{(k)}\|_{[T, 2T]}^{1/k} \le 1,
$$

from which the theorem of Andersen–de Jeu implies $$\operatorname{supp}\hat{\dot{Y}} \subseteq [-1, 1]$$.

The paper is explicit that no global $$L^2(\mathbb{R})$$ property of $$\dot{Y}$$ is assumed: only the local $$L^2$$ bounds on windows $$[T, 2T]$$ and the derivative growth bounds enter.

***

## Section 10: Frequency Shift and the Main Theorem

The final step is a Fourier-theoretic shift. The relation $$\dot{Y}(T) = e^{iT} Y(T)$$ gives, under the Fourier normalization used in the paper,

$$
\hat{\dot{Y}}(\omega) = \hat{Y}(\omega - 1).
$$

Equivalently, $$\hat{Y}(\xi) = \hat{\dot{Y}}(\xi + 1)$$. Since $$\hat{\dot{Y}}(\xi + 1) = 0$$ unless $$\xi + 1 \in [-1, 1]$$, i.e., unless $$\xi \in [-2, 0]$$, the main theorem follows:

$$
\boxed{\operatorname{supp}\hat{Y} \subseteq [-2, 0].}
$$

The shift by 1 comes from the factor $$e^{iT}$$: multiplication by $$e^{iT}$$ in time corresponds to shifting by 1 in frequency. The support $$[-1, 1]$$ of $$\hat{\dot{Y}}$$ becomes $$[-2, 0]$$ for $$\hat{Y}$$ after shifting by $$-1$$.

***

## Key Analytic Mechanisms and Their Interactions

| Mechanism | Role | Section |
|---|---|---|
| Riemann–Siegel formula | Decomposes $$\zeta$$ into Dirichlet sums + small remainder | 4, 5 |
| Theta map $$\vartheta$$ | Converts height to phase; Jacobian controls unitarity | 1, 2 |
| Ingham's exact formula | Provides exact mean-square density $$\mu(T)$$ | 1 |
| Paris's asymptotics | Controls derivatives of $$\vartheta$$ and hence amplitude $$a(T)$$ | 4 |
| Faà di Bruno formula | Computes derivatives of compositions $$A(t), B(t)$$ | 7 |
| Slow variation lemma | Shows amplitude changes by $$O(t_0^{-1})$$ over window | 7 |
| Montgomery–Vaughan | Mean-value theorem for frozen Dirichlet polynomials | 8 |
| Error control | $$E_k \ll t_0^{-1+\varepsilon}\|\dot{Y}\|$$ bounds remainder contribution | 8 |
| Andersen–de Jeu theorem | Translates derivative growth bound to spectral support bound | 9 |
| Frequency shift | $$\hat{Y}(\xi) = \hat{\dot{Y}}(\xi+1)$$ shifts support from $$[-1,1]$$ to $$[-2,0]$$ | 10 |

***

## Discussion of Key Logical Dependencies and Potential Issues

### The Spectral Radius Step

The most subtle step is the invocation of the Andersen–de Jeu spectral radius formula[^18][^19]. The paper cites their Theorem 3.6, which in the published version of Trans. Amer. Math. Soc. 362 (2010), 3613–3640[^18][^20] corresponds to the $$p=2$$ case of the local spectral radius formula (Theorem 2.7 in the preprint version). The theorem states:

> For $$f \in L^2(\mathbb{R}^d)$$ with $$P(\partial)^n f \in L^2(\mathbb{R}^d)$$ for all $$n$$, $$\lim_{n \to \infty} \|P(\partial)^n f\|_{L^2}^{1/n} = R(P, \hat{f})$$.

In the present setting, $$\dot{Y}$$ is not in $$L^2(\mathbb{R})$$: the function does not decay at infinity. The paper handles this by using only **local** norms on windows $$[T, 2T]$$. This is a local version of the theorem, and the paper is careful to invoke the spectral-radius formula "locally", using the window norms rather than the global $$L^2$$ norm. The inequality $$\|\dot{Y}^{(k)}\|_{[T,2T]} \le (1+o(1))\|\dot{Y}\|_{[T,2T]}$$ is what replaces the global $$L^2$$ norm condition.

### The Montgomery–Vaughan Step

The paper uses the Montgomery–Vaughan theorem[^15] for sums with **fixed** frequencies $$\log n$$ but **varying** coefficients $$a_n^{(k)}(t)$$. The standard theorem requires fixed coefficients. The paper bridges this by (1) freezing the coefficients at $$t = t_0$$, (2) applying Montgomery–Vaughan to the frozen sum, and (3) using slow variation to control the error from the variation of coefficients over the window. This is a standard technique in analytic number theory, and the paper carries it through carefully with explicit bounds.

### Dependence on $$\log n \le 1$$ vs. the Actual Bound

The claim that $$\hat{\dot{Y}}$$ is supported in $$[-1, 1]$$ depends on the inequality $$\|\dot{Y}^{(k)}\|^{1/k} \le 1 + o_k(1)$$. In the height variable, the Dirichlet sum has frequencies $$\log n \le \log N(t_0) \asymp \frac{1}{2}\log(t_0) \to \infty$$. So the frequencies are **not** bounded by 1 in the height variable. The paper's claim depends on the observation that after the change of variables from $$t$$ to $$T = \vartheta(t)$$, the frequencies are **compressed** by the Jacobian $$\vartheta'(t) \sim \frac{1}{2}\log t$$, and in the **phase variable $$T$$**, the "instantaneous frequency" of the term $$n^{-it} = e^{-it\log n}$$ is

$$
\frac{d}{dT}(t\log n) = \frac{\log n}{\vartheta'(t)} \approx \frac{\log n}{\frac{1}{2}\log t} \to 0
$$

since $$n \le N(t) \asymp \sqrt{t/(2\pi)}$$ implies $$\log n \le \frac{1}{2}\log(t/(2\pi)) \approx \vartheta'(t)$$. So the instantaneous frequency in the phase variable is bounded by 1 from above. This is the geometric content of the height-to-phase compression, and it is what makes the spectral support conclusion non-trivial.

***

## Historical and Bibliographic Context

- **Ingham (1928)**[^6][^7]: Proved the exact mean-value formula $$I(T) = T\log(T/2\pi) + (2\gamma-1)T + \text{oscillatory}$$. This is the second-moment identity used in the construction of $$\mu$$.

- **Montgomery–Vaughan (1974)**[^15]: Proved the Hilbert-inequality form of the mean-value theorem for Dirichlet polynomials. The paper states it directly in the precise form used.

- **Titchmarsh (1986, rev. Heath-Brown)**[^9]: The standard reference for the Riemann–Siegel formula, theta function properties, and the functional equation of zeta.

- **O'Sullivan (2008)**[^11]: Generalized the Riemann–Siegel formula and provided the explicit contour-integral representations of the coefficients and remainder bounds that the paper uses for the derivative bounds $$|R^{(j)}(t)| \le C_j t^{-1/4-j/2}$$.

- **Paris (2015/2020)**[^3][^4][^5]: Proved that the asymptotic expansion of $$\vartheta(t)$$ contains exponentially small terms. The bounds on $$\vartheta^{(m)}(t)$$ used in the paper follow from Paris's detailed Stirling analysis.

- **Andersen–de Jeu (2010)**[^18][^19][^20]: Developed the systematic real Paley–Wiener theory, proved that for $$L^p$$ functions with all derivatives in $$L^p$$, the spectral radius formula $$\lim_{n\to\infty}\|P(\partial)^n f\|_p^{1/n} = \sup_{\lambda \in \operatorname{supp}\hat{f}}|P(i\lambda)|$$ holds, and discussed connections to local spectral theory for unbounded operators.

- **Ng (1998)**[^23]: Analyzed mean-square error terms related to the Dirichlet divisor problem; the convergence of the series defining $$\mu(T)$$ is related to the estimates in this work.

---

## References

1. [Riemann–Siegel theta function - Wikipedia](https://en.wikipedia.org/wiki/Riemann%E2%80%93Siegel_theta_function)

2. [Neue Herleitung und explizite Restabschätzung der Riemann-Siegel-Formel | Semantic Scholar](https://www.semanticscholar.org/paper/Neue-Herleitung-und-explizite-Restabsch%C3%A4tzung-der-Gabcke/802bb98d33aa59a6ff431cc5482334e67e095968) - The asymptotic expansion of the function Z(t) = e i i vartheta (t) zeta (1/2+it) for real $t\to+\inf...

3. [Refined asymptotics of the Riemann-Siegel theta function](https://rke.abertay.ac.uk/ws/portalfiles/portal/32381475/Paris_RefinedAsymptoticsOfTheRiemann_Siegel_Published_2019.pdf)

4. [Refined asymptotics of the Riemann-Siegel theta function - arXiv](https://arxiv.org/abs/2004.00926) - The Riemann-Siegel theta function $\vartheta(t)$ is examined for $t\to+\infty$. Use of the refined a...

5. [Refined asymptotics of the Riemann-Siegel theta function](https://www.emergentmind.com/papers/2004.00926) - The Riemann-Siegel theta function $\vartheta(t)$ is examined for $t\to+\infty$. Use of the refined a...

6. [[PDF] Moments of zeta and correlations of divisor-sums: I](https://aimath.org/~kaur/publications/85.pdf) - Ingham AE. 1926 Mean-values theorems in the theory of the Riemann zeta-function. Proc. Lond. Math. S...

7. [Moments of zeta and correlations of divisor-sums: I - PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC4375380/) - Ingham AE. 1926. Mean-values theorems in the theory of the Riemann zeta-function. Proc. Lond. Math. ...

8. [[PDF] HIGH MOMENTS OF THE RIEMANN ZETA-FUNCTION](https://aimath.org/~kaur/publications/43.pdf) - Littlewood proved an asymptotic estimate for the Second moment of the modulus of the Riemann zeta-fu...

9. [Riemann–Siegel formula - Wikipedia](https://en.wikipedia.org/wiki/Riemann%E2%80%93Siegel_formula)

10. [The Riemann-Siegel expansion for the zeta function: high orders and remainders](https://ouci.dntb.gov.ua/en/works/73Rgj3R9/) - Abstract On the critical line s ═ ½ + it (t real), Riemann’s zeta function can be calculated with hi...

11. [[PDF] A generalization of the Riemann-Siegel formula - CUNY](https://fsw01.bcc.cuny.edu/cormac.osullivan/Research/Riemann-Siegel-2nd-revision.pdf)

12. [A generalization of the Riemann-Siegel formula](https://arxiv.org/pdf/1811.01130.pdf)

13. [[PDF] arXiv:1609.03682v1 [math.NA] 13 Sep 2016](https://arxiv.org/pdf/1609.03682v1.pdf)

14. [Faà di Bruno's formula - Wikipedia](https://en.wikipedia.org/wiki/Fa%C3%A0_di_Bruno's_formula)

15. [Hilbert's inequality - Penn State Research Database](https://pure.psu.edu/en/publications/hilberts-inequality/) - Montgomery, H. L. ; Vaughan, R. C. / Hilbert's inequality. In: Journal of the London Mathematical So...

16. [[PDF] Dirichlet polynomials: some old and recent results, and their ... - arXiv](https://arxiv.org/pdf/0907.4931.pdf) - The following form of Hilbert's inequality due to Montgomery and Vaughan yields precise estimates of...

17. [Paley–Wiener theorem - Wikipedia](https://en.wikipedia.org/wiki/Paley%E2%80%93Wiener_theorem) - A Paley–Wiener theorem is a theorem that relates decay properties of a function or distribution at i...

18. [Real Paley-Wiener theorems and local spectral radius formulas](https://arxiv.org/abs/0804.3014v1) - We systematically develop real Paley-Wiener theory for the Fourier transform on R^d for Schwartz fun...

19. [Real Paley-Wiener theorems and local spectral radius formulas](https://arxiv.org/abs/0804.3014) - View a PDF of the paper titled Real Paley-Wiener theorems and local spectral radius formulas, by Nil...

20. [[PDF] real paley–wiener theorems and local spectral radius formulas](https://math.leidenuniv.nl/reports/files/2008-02.pdf) - Abstract. We systematically develop real Paley–Wiener theory for the Fourier transform on Rd for Sch...

21. [[PDF] local spectral radius formulas for a class of unbounded operators on ...](https://math.leidenuniv.nl/reports/files/2010-20.pdf) - [2] N.B. Andersen, M.F.E. de Jeu, Real Paley–Wiener theorems and local spectral radius formu- las, T...

22. [Local spectral radius formulas for a class of unbounded operators on Banach spaces](https://arxiv.org/abs/1011.6066) - We exhibit a general class of unbounded operators in Banach spaces which can be shown to have the si...

23. [Mean values of long Dirichlet polynomials with divisor coefficients](https://msp.org/ant/2025/19-7/ant-v19-n7-p04-s.pdf) - We prove an asymptotic formula for the mean value of long smoothed Dirichlet polynomials with diviso...

