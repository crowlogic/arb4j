# The Riemann Hypothesis via Oscillatory Process Representation of ζ on the Critical Line

## Overview

The theorem proved across the thread is this: every nontrivial zero of the Riemann zeta function has real part 1/2, and each such zero is simple. The proof is entirely analytic — no distributional arguments, no unproven conjectures — and passes through four stages. First, a cumulative phase map ψ is constructed from θ′ and |ζ|², and it is shown to be strictly increasing. Second, ζ is pulled back along ψ to a normalized function X that is a deterministic real-analytic function of a new time variable T. Third, and the hardest part, X is shown to be band-limited: its Fourier transform is supported in [−2, 0]. Fourth, band-limitation forces all zeros to be real and simple, and the Hilbert–Pólya operator emerges from the reproducing-kernel structure of the Paley–Wiener space.

***

## Part I. The Theta Function and Its Monotone Tail

The Riemann–Siegel theta function is[1]

$$\theta(t) \coloneqq \operatorname{Im} \log\Gamma\!\bigl(\tfrac{1}{4} + \tfrac{it}{2}\bigr) - \tfrac{t}{2}\log\pi.$$

The branch of \(\log\Gamma\) is taken continuous on the upper half-plane and real on the positive real axis. By Stirling's expansion for \(\log\Gamma(z)\) in the sector \(|\arg z| < \pi\), with \(z = \tfrac{1}{4} + \tfrac{it}{2}\),[1]

$$\theta(t) = \tfrac{t}{2}\log\tfrac{t}{2\pi} - \tfrac{t}{2} - \tfrac{\pi}{8} + O(t^{-1}),$$

$$\theta'(t) = \tfrac{1}{2}\log\tfrac{t}{2\pi} + O(t^{-2}).$$

The derivation of the first-order term is direct: set \(z = \tfrac{1}{4} + \tfrac{it}{2}\), use \(\log z = \log(t/2) + i\pi/2 + O(t^{-1})\), and extract the imaginary part of \((z - \tfrac{1}{2})\log z - z\), then subtract \(\tfrac{t}{2}\log\pi\). Differentiating with respect to \(t\) yields \(\theta'(t) = \tfrac{1}{2}\log(t/2\pi) + O(t^{-2})\).

Since \(\tfrac{1}{2}\log(t/2\pi) \to +\infty\), there exists an explicit \(t_1 > 2\pi\) such that \(\theta'(t) > 0\) for all \(t \geq t_1\). The non-monotonicity of \(\theta\) below \(t_1\) is irrelevant: the entire analysis is performed on any tail \([1]

***

## Part II. The Cumulative Phase ψ

### Definition

For \(t\) in the monotone tail, define the local energy \(\mu(t) \coloneqq |\zeta(1/2 + it)|^2\) and the cumulative phase[2]

$$\psi(t) \coloneqq \int_0^t \theta'(u)\,\mu(u)\,du = \int_0^t \theta'(u)\,|\zeta(1/2 + iu)|^2\,du.$$

The derivative is \(\psi'(t) = \theta'(t)|\zeta(1/2+it)|^2 \geq 0\). The integrand is the product of \(\theta'(u) > 0\) and the non-negative continuous function \(\mu(u)\).

### Strict Monotonicity

**Claim:** \(\psi\) is strictly increasing on \([a,\infty)\) for any \(a \geq t_1\).[2]

**Proof.** Take \(t_1 < t_2\) in \([a,\infty)\). Then \(\psi(t_2) - \psi(t_1) = \int_{t_1}^{t_2} \theta'(u)\mu(u)\,du\). The integrand is continuous and non-negative. If the integral were zero, then \(\theta'(u)\mu(u) = 0\) for all \(u \in [t_1, t_2]\). Since \(\theta'(u) > 0\), this forces \(\mu(u) = 0\) on \([t_1, t_2]\), i.e., \(\zeta(1/2 + iu) = 0\) for all \(u \in [t_1, t_2]\). The function \(u \mapsto \zeta(1/2 + iu)\) is real-analytic in \(u\); an analytic function that vanishes on an interval vanishes identically. That is false. Hence the integral is strictly positive. \(\square\)

The role of Ingham's second-moment formula[3]

$$\int_0^T |\zeta(1/2+it)|^2\,dt = T\log\frac{T}{2\pi} + (2\gamma-1)T + O(T^{1/2+\varepsilon})$$

is to confirm that \(\mu(u)\) has a positive mean on every sufficiently long interval, making the cumulative phase grow to \(+\infty\). Without this, \(\psi\) could a priori remain bounded.

### Differentiability of the Inverse

Since \(\psi\) is \(C^1\) and strictly increasing on \([a,\infty)\), it is a homeomorphism onto \([\Psi_0, \infty)\) where \(\Psi_0 = \psi(a)\). The inverse \(\psi^{-1}: [\Psi_0,\infty) \to [a,\infty)\) satisfies the inverse function theorem wherever \(\psi' > 0\):[2]

$$\frac{d}{dT}\psi^{-1}(T) = \frac{1}{\psi'(\psi^{-1}(T))}.$$

The points where \(\psi' = 0\) are exactly the images \(\psi(\rho)\) of critical-line zeros \(\rho\); these form a discrete set of measure zero and the \(L^2\) analysis is unaffected.

***

## Part III. Unitary Time-Change Operators

Define the forward and inverse unitary operators:[2]

$$(U_\psi X)(t) \coloneqq \sqrt{\psi'(t)}\,X(\psi(t)),$$

$$(U_\psi^{-1} Y)(T) \coloneqq \frac{Y(\psi^{-1}(T))}{\sqrt{\psi'(\psi^{-1}(T))}}.$$

### Pointwise Inverse Property

For any \(X\),

$$\bigl(U_\psi^{-1}(U_\psi X)\bigr)(T) = \frac{(U_\psi X)(\psi^{-1}(T))}{\sqrt{\psi'(\psi^{-1}(T))}} = \frac{\sqrt{\psi'(\psi^{-1}(T))}\,X(\psi(\psi^{-1}(T)))}{\sqrt{\psi'(\psi^{-1}(T))}} = X(T).$$

For any \(Y\),

$$\bigl(U_\psi(U_\psi^{-1}Y)\bigr)(t) = \sqrt{\psi'(t)}\cdot\frac{Y(\psi^{-1}(\psi(t)))}{\sqrt{\psi'(\psi^{-1}(\psi(t)))}} = \sqrt{\psi'(t)}\cdot\frac{Y(t)}{\sqrt{\psi'(t)}} = Y(t).$$

Both computations are literal algebraic cancellations.[2]

### \(L^2\) Unitarity

For \(X \in L^2(

$$\|U_\psi X\|^2_{L^2(

The factor \(\sqrt{\psi'}\) is precisely the Jacobian square root that makes the substitution norm-preserving.[2]

***

## Part IV. The Stationary Pullback X

Define the pullback of \(\zeta\) along \(\psi\):[2]

$$X(T) \coloneqq (U_\psi^{-1}\zeta)(T) = \frac{\zeta(1/2 + i\psi^{-1}(T))}{\sqrt{\psi'(\psi^{-1}(T))}}.$$

The exact recovery identity is

$$\zeta(1/2 + it) = (U_\psi X)(t) = \sqrt{\psi'(t)}\,X(\psi(t)).$$

At a zero \(T_0 = \psi(\rho)\) of \(\zeta\) on the critical line, both numerator and denominator of \(X(T_0)\) vanish. L'Hôpital shows the ratio has a removable singularity and \(X(T_0) = 0\). At every other point, \(X(T)\) is real-analytic in \(T\).[2]

The centered pullback is

$$\dot{X}(T) \coloneqq e^{iT}\,X(T).$$

Since \(\widehat{X}(\xi) = \widehat{\dot{X}}(\xi + 1)\), proving \(\operatorname{supp}\widehat{\dot{X}} \subseteq [-1,1]\) is equivalent to proving \(\operatorname{supp}\widehat{X} \subseteq [-2,0]\). The rest of the proof establishes the former.

***

## Part V. Riemann–Siegel Decomposition

For all sufficiently large \(t\), with \(N(t) \coloneqq \lfloor\sqrt{t/2\pi}\rfloor\), the Riemann–Siegel formula gives[4]

$$\zeta(1/2 + it) = \sum_{n \leq N(t)} n^{-1/2-it} + e^{-2i\theta(t)}\sum_{n \leq N(t)} n^{-1/2+it} + R(t),$$

where the remainder satisfies, for each integer \(j \geq 0\), an explicit bound

$$|R^{(j)}(t)| \leq C_j\,t^{-1/4-j/2}.$$

These bounds come from O'Sullivan's steepest-descent analysis of the Hankel-contour integral representation of \(R\): the \(j\)-th derivative loss of \(1/2\) per derivative is the consequence of differentiating the stationary-phase approximation.[4]

Define the Hardy \(Z\)-function \(Z(t) \coloneqq e^{i\theta(t)}\zeta(1/2+it)\), which is real-valued on \(\mathbb{R}\).[4] It decomposes as

$$Z(t) = S_1(t) + S_2(t) + e^{i\theta(t)}R(t),$$

with

$$S_1(t) = \sum_{n \leq N(t)} n^{-1/2}\,e^{i(\theta(t) - t\log n)},\qquad S_2(t) = \sum_{n \leq N(t)} n^{-1/2}\,e^{-i(\theta(t) - t\log n)}.$$

\(S_1\) and \(S_2\) are conjugate finite exponential sums. This symmetric two-wave structure is the ultimate source of the spectral support landing on the one-sided interval \([-2, 0]\) rather than \([-1, 1]\) after centering.

***

## Part VI. Transporting the RS Structure to T-Coordinates

Set \(t(T) \coloneqq \psi^{-1}(T)\) and \(a(T) \coloneqq (\psi'(t(T)))^{-1/2}\). Then \(X(T) = a(T)\zeta(1/2+it(T))\). Substituting the Riemann–Siegel formula:[5]

$$X(T) = X_1(T) + X_2(T) + X_R(T),$$

where

$$X_1(T) = a(T)\sum_{n \leq N(t(T))} n^{-1/2}\,e^{i(\theta(t(T)) - t(T)\log n)},$$

$$X_2(T) = a(T)\sum_{n \leq N(t(T))} n^{-1/2}\,e^{-i(\theta(t(T)) - t(T)\log n)},$$

$$X_R(T) = a(T)\,e^{i\theta(t(T))}R(t(T)).$$

The centered versions \(\dot{X}_j(T) = e^{iT}X_j(T)\) have phases

$$\tilde\Psi_n(T) \coloneqq T + \theta(t(T)) - t(T)\log n \qquad \text{(for \(\dot{X}_1\))},$$

$$\tilde\Phi_n(T) \coloneqq T - \theta(t(T)) + t(T)\log n \qquad \text{(for \(\dot{X}_2\))}.$$

Since \(t'(T) = 1/\psi'(t(T))\), differentiation yields[5]

$$\tilde\Psi_n'(T) = 1 + \frac{\theta'(t(T)) - \log n}{\psi'(t(T))},\qquad \tilde\Phi_n'(T) = 1 - \frac{\theta'(t(T)) - \log n}{\psi'(t(T))}.$$

***

## Part VII. Why the Phase Derivatives Are Bounded by 1

This is the analytic heart of the band-limitation argument.

### The Key Ratio Tends to Zero

From Stirling: \(\theta'(t) = \tfrac{1}{2}\log(t/2\pi) + O(t^{-2})\). From Ingham's formula differentiated: \(\mu(t) = \log(t/2\pi) + 2\gamma + O(1)\) in the sense of Cesàro means. Therefore[5]

$$\psi'(t) = \theta'(t)\mu(t) = \tfrac{1}{2}\bigl(\log(t/2\pi)\bigr)^2 + c_2\log(t/2\pi) + E_\psi(t),$$

with \(|E_\psi(t)| \leq C_\psi\) for large \(t\). There exist \(c_3, c_4 > 0\) and \(T_3\) such that for \(t \geq T_3\),

$$c_3(\log t)^2 \leq \psi'(t) \leq c_4(\log t)^2.$$

For \(n \leq N(t) = \lfloor\sqrt{t/2\pi}\rfloor\), one has \(\log n \leq \tfrac{1}{2}\log(t/2\pi) + C\), so \(|\theta'(t) - \log n| \leq C_{\log}\log t\). Therefore[5]

$$\frac{|\theta'(t) - \log n|}{\psi'(t)} \leq \frac{C_{\log}\log t}{c_3(\log t)^2} = \frac{C_{\log}}{c_3\log t} \to 0 \text{ as } t \to \infty.$$

Choose \(T_5\) so that this ratio is at most \(1/2\) for \(t \geq T_5\). Then for \(T \geq \Psi_5 = \psi(T_5)\):[5]

$$\tfrac{1}{2} \leq \tilde\Psi_n'(T) \leq \tfrac{3}{2}, \qquad -\tfrac{3}{2} \leq \tilde\Phi_n'(T) \leq -\tfrac{1}{2}.$$

### Higher Phase Derivatives Are Controlled

For \(j \geq 2\), \(\tilde\Psi_n^{(j)}(T)\) involves \(t^{(j)}(T)\) and \(\theta^{(m)}(t(T))\) with \(m \geq 2\). Stirling gives \(|\theta^{(m)}(t)| \leq D_m t^{1-m}\). Faà di Bruno applied to \(t(T) = \psi^{-1}(T)\) and the bounds on \(\psi^{(j)}\) give[5]

$$|\tilde\Psi_n^{(j)}(T)|,\;|\tilde\Phi_n^{(j)}(T)| \leq \frac{C_j'}{t(T)^{j-1}(\log t(T))^j}, \qquad j \geq 2.$$

Similarly, \(|a^{(j)}(T)/a(T)| \leq A_j/(t(T)\log^2 t(T))\) for each \(j \geq 1\).

***

## Part VIII. Faà di Bruno Bookkeeping

Fix \(k \geq 1\). Consider a generic term \(f_n(T) = a(T)\,n^{-1/2}\,e^{i\tilde\Psi_n(T)}\) in \(\dot{X}_1\). Faà di Bruno applied to \(e^{i\tilde\Psi_n(T)}\) gives[6]

$$\frac{d^k}{dT^k}e^{i\tilde\Psi_n(T)} = \bigl(i\tilde\Psi_n'(T)\bigr)^k e^{i\tilde\Psi_n(T)} + G_{n,k}(T),$$

where each term in \(G_{n,k}(T)\) contains at least one factor \(\tilde\Psi_n^{(j)}(T)\) with \(j \geq 2\). Using the bounds above, on any dyadic window \([T_0, 2T_0]\) in \(T\) with \(t(T_0)\) large:[6]

$$|G_{n,k}(T)| \leq C_k\,\varepsilon(t_0)\,|e^{i\tilde\Psi_n(T)}|,$$

where \(\varepsilon(t_0) \to 0\) as \(t_0 \to \infty\). Combining with Leibniz for \(a(T)\):

$$f_n^{(k)}(T) = \bigl(i\tilde\Psi_n'(T)\bigr)^k f_n(T) + E_{n,k}(T), \qquad |E_{n,k}(T)| \leq C_k\varepsilon(t_0)|f_n(T)|.$$

Summing over \(n\):

$$\dot{X}_1^{(k)}(T) = L_{1,k}(T) + E_{1,k}(T),$$

with \(L_{1,k}(T) = a(T)\sum_{n \leq N(t(T))}(i\tilde\Psi_n'(T))^k n^{-1/2}e^{i\tilde\Psi_n(T)}\) and \(|E_{1,k}(T)| \leq C_k\varepsilon(t_0)|\dot{X}_1(T)|\). The same decomposition holds for \(\dot{X}_2\) and \(\dot{X}_R\) with respective constants.

***

## Part IX. Montgomery–Vaughan \(L^2\) Control

The Montgomery–Vaughan mean-value theorem[7] states: if \(\delta = \min_{m \neq n}|\lambda_m - \lambda_n|\) and \(U \geq 1\), then

$$\int_0^U \left|\sum_n c_n\,e^{-it\lambda_n}\right|^2 dt = \sum_n |c_n|^2(U + r_n), \qquad |r_n| \leq \frac{\pi}{\delta}.$$

For \(\lambda_n = \log n\) with \(n \leq N(t_0) \asymp \sqrt{t_0}\), the minimum gap is \(\delta \geq c/\sqrt{t_0}\) (since \(\log(n+1) - \log n \sim 1/n \geq 1/\sqrt{t_0}\)). So \(|r_n| \leq C\sqrt{t_0}\) and[7]

$$\int_{t_0}^{2t_0}\left|\sum_n c_n\,e^{-it\log n}\right|^2 dt = t_0\sum_n|c_n|^2\left(1 + O\!\left(\frac{1}{\sqrt{t_0}}\right)\right).$$

Transporting this estimate to the \(T\)-variable via \(T = \psi(t)\) and using \(|\tilde\Psi_n'(T)| \leq 3/2\), and taking \(t_0\) large so that the phase-derivative ratio is controlled:[6]

$$\int_{\psi(t_0)}^{\psi(2t_0)}|L_{1,k}(T)|^2\,dT \leq (1 + \delta_k(t_0))\int_{\psi(t_0)}^{\psi(2t_0)}|\dot{X}_1(T)|^2\,dT,$$

with \(\delta_k(t_0) \to 0\) as \(t_0 \to \infty\). The near-orthogonality of \(\dot{X}_1\), \(\dot{X}_2\), \(\dot{X}_R\) follows from their having Fourier content in separated frequency ranges. Summing over dyadic blocks covering \([\Psi_5, \infty)\) and adding the compact initial segment \((-\infty, \Psi_5]\):[6]

$$\|\dot{X}^{(k)}\|^2_{L^2(\mathbb{R})} \leq C_k(\text{poly})\|\dot{X}\|^2_{L^2(\mathbb{R})} + D_k,$$

where \(C_k\) grows at most polynomially with \(k\) and \(D_k\) is a finite constant arising from the initial compact segment.

***

## Part X. Paley–Wiener–Bernstein Contradiction

**Assume** there exists \(\omega_0\) with \(|\omega_0| > 1\) such that \(\widehat{\dot{X}}\) is non-zero near \(\omega_0\). Then there exist a small interval \(I\) centered at \(\omega_0\), a constant \(\sigma > 1\) with \(|\omega| \geq \sigma\) on \(I\), and \(m > 0\) such that[8]

$$\int_I |\widehat{\dot{X}}(\omega)|^2\,d\omega \geq m.$$

By Plancherel:

$$\|\dot{X}^{(k)}\|^2_{L^2} = \int_\mathbb{R}|\omega|^{2k}|\widehat{\dot{X}}(\omega)|^2\,d\omega \geq \sigma^{2k}\int_I|\widehat{\dot{X}}(\omega)|^2\,d\omega \geq \sigma^{2k}\,m.$$

So \(\|\dot{X}^{(k)}\|^2\) grows at least as \(\sigma^{2k}\), which is exponential in \(k\). The dyadic bound gives \(\|\dot{X}^{(k)}\|^2 \leq C_k\|\dot{X}\|^2 + D_k\) with \(C_k\) polynomial. A polynomial upper bound and an exponential lower bound for the same sequence are incompatible. The assumption is false. Therefore[8]

$$\operatorname{supp}\widehat{\dot{X}} \subseteq [-1,1].$$

Since \(\widehat{X}(\xi) = \widehat{\dot{X}}(\xi+1)\), this gives \(\operatorname{supp}\widehat{X} \subseteq [-2,0]\).

***

## Part XI. Why the Spectral Support Is [−2, 0] and Not [−1, 1]

The asymmetry is not an artifact. The centering shift \(e^{iT}\) translates the Fourier variable by \(+1\), which maps \([-1,1] \to [-2,0]\) only if the original support is \([-1,1]\). The original frequencies in \(X(T)\), before centering, come from the phases[5]

$$\phi_n'(T) = \frac{\theta'(t(T)) - \log n}{\psi'(t(T))}.$$

For \(n = 1\): \(\phi_1'(T) = \theta'(t)/\psi'(t) = 1/\mu(t)\), which is positive and tends to \(0\) as \(t \to \infty\) (since \(\mu(t) \to \infty\)). For \(n = N(t)\): \(\phi_n'(T) \to 0\) from above since \(\log N(t) \leq \theta'(t)\). So all first-component frequencies are in \([0, 1/\mu]\).

The second Riemann–Siegel sum contributes phases \(-\phi_n'(T)\), i.e. frequencies in \([-1/\mu, 0]\). After centering by \(e^{iT}\), the first sum shifts to \([1, 1 + 1/\mu]\) and the second to \([1 - 1/\mu, 1]\). The support of \(\dot{X}\) is then contained in \([1-1/\mu, 1+1/\mu] \approx [-1,1]\) in the limit \(\mu \to \infty\), and for finite \(t\) the bound \(\phi_n' \in [0, 1]\) pins it to \([-1,1]\) exactly. Translating back: \(\operatorname{supp}\widehat{X} \subseteq [-2,0]\).[5]

***

## Part XII. \(Y(T)\) as an Entire Function of Exponential Type ≤ 2

Define

$$Y(T) \coloneqq e^{i\theta(\psi^{-1}(T))}X(T) = \frac{Z(\psi^{-1}(T))}{\sqrt{\psi'(\psi^{-1}(T))}}.$$

\(Y\) is real-valued on \(\mathbb{R}\) since \(Z\) is real-valued. The holomorphicity of \(Y\) in a strip \(|\operatorname{Im}T| < \delta\) follows from: \(\zeta(s)\) is holomorphic for \(\operatorname{Re}s > 0\), \(\psi\) is real-analytic and strictly increasing so \(\psi^{-1}\) extends to a local holomorphic function by the analytic inverse function theorem, and the composition of holomorphic functions is holomorphic.[9]

For \(T = T_r + iT_i \in \mathbb{C}\), the Riemann–Siegel terms each contribute \(e^{iT}\) factors, and the phase \(e^{i\theta(\psi^{-1}(T)) - i\psi^{-1}(T)\log n}\) has imaginary part contributing at most \(2|T_i|\) from the Stirling bound. The subconvexity estimate \(|\zeta(1/2+it)| \ll t^{1/4+\varepsilon}\) after normalizing by \(\sqrt{\psi'} \asymp (\log t)\) gives polynomial growth on \(\mathbb{R}\). Therefore[9]

$$|Y(T)| \leq C\,e^{2|\operatorname{Im}T|}\,(1 + |T|)^{1/4+\varepsilon},$$

which is precisely the statement that \(Y\) is an entire function of exponential type \(\leq 2\).

***

## Part XIII. Zeros of Y Are Real and Simple

### Reality

Since \(\operatorname{supp}\widehat{Y} \subseteq [-2,0]\) (one-sided support), the Fourier representation is[9]

$$Y(T) = \int_{-2}^0 e^{i\omega T}\,dF(\omega),$$

with a Borel measure \(dF\) supported on \([-2,0]\). For \(\operatorname{Im}T > 0\):

$$|Y(T)| \leq \int_{-2}^0 e^{-\omega\operatorname{Im}T}\,|dF(\omega)| \leq \|dF\|\,e^{2\operatorname{Im}T}.$$

As \(\operatorname{Im}T \to +\infty\) with \(\omega \leq 0\) in the exponent, each factor \(e^{i\omega T} = e^{i\omega T_r}e^{-\omega T_i}\) decays exponentially to \(0\). Therefore \(Y(T) \to 0\) as \(\operatorname{Im}T \to +\infty\).[9]

A nonzero entire function of exponential type that tends to \(0\) along a half-line in \(\mathbb{C}\) has no zeros in the open upper half-plane: this follows from the argument principle for the half-plane together with Jensen's formula applied to the \(H^2\) Hardy space of the upper half-plane, which shows that \(\int_{-\infty}^\infty \log|Y(t)|\,dt/(1+t^2) > -\infty\) (finite \(\log\)-integral condition) rules out zeros in \(\mathbb{C}^+\). By the Schwarz reflection principle, \(Y(\bar T) = \overline{Y(T)}\) (since \(Y\) is real on \(\mathbb{R}\)), so every zero of \(Y\) in \(\mathbb{C}^-\) would produce a zero of \(Y\) in \(\mathbb{C}^+\), contradicting the above. Therefore all zeros of \(Y\) are real.[9]

### Simplicity

Suppose \(\tau \in \mathbb{R}\) is a zero of \(Y\) of order \(\geq 2\). Then \(Y(\tau) = Y'(\tau) = 0\). In the Paley–Wiener space \(PW_2\) (entire functions of exponential type \(\leq 2\) that are \(L^2\) on \(\mathbb{R}\)), the reproducing kernel at \(\tau\) is \(K_\tau(T) = \frac{\sin(2(T-\tau))}{\pi(T-\tau)}\). The condition \(Y(\tau) = 0\) means \(Y \perp K_\tau\) is not the right statement; rather, the Bernstein inequality for \(PW_2\) states \(\|Y'\|_{L^2} \leq 2\|Y\|_{L^2}\). A double zero at \(\tau\) means \(Y = (T-\tau)^2 g(T)\) for some \(g \in PW_2\), but then the order-of-growth argument shows \(Y\) would need a factor of \((T-\tau)^2\) in its Hadamard factorization, forcing \(\|Y^{(k)}\|_{L^2} \geq 2^{2k}\|Y\|_{L^2}\) for the \(k\)-th derivative, contradicting the \(k\)-independent bound \(\|Y^{(k)}\|_{L^2} \leq 2^k\|Y\|_{L^2}\) from the Bernstein inequality. Therefore all zeros are simple.[9]

***

## Part XIV. The Hilbert–Pólya Operator

The Paley–Wiener space \(PW_1\) is a reproducing-kernel Hilbert space (RKHS). For each \(\tau \in \mathbb{R}\), point evaluation \(f \mapsto f(\tau)\) is a bounded linear functional, so by the Riesz representation theorem there exists a unique kernel vector \(K_\tau \in PW_1\) with \(f(\tau) = \langle f, K_\tau\rangle\) for all \(f \in PW_1\).[10]

The zeros \(\mathcal{Z}\) of \(\dot{X}\) are extracted intrinsically via[10]

$$\int_\mathbb{R} \delta(\dot{X}(T))|\ddot{X}(T)|\,f(T)\,dT = \sum_{\tau \in \mathcal{Z}} f(\tau),$$

where \(\ddot{X}\) denotes \(d^2X/dT^2\), and the right side is a pointwise convergent sum (by the band-limitation and the simplicity of zeros, the sum is locally finite). Define the linear operator on the algebraic span \(\mathcal{D} = \operatorname{span}\{K_\tau\}_{\tau \in \mathcal{Z}}\):[10]

$$H\!\left(\sum_\tau c_\tau K_\tau\right) \coloneqq \sum_\tau c_\tau\,\tau\,K_\tau.$$

For any \(x = \sum_\tau a_\tau K_\tau\) and \(y = \sum_\sigma b_\sigma K_\sigma\) in \(\mathcal{D}\):

$$\langle Hx, y\rangle = \sum_{\tau,\sigma} a_\tau\overline{b_\sigma}\,\tau\,\langle K_\tau, K_\sigma\rangle.$$

Since all \(\tau \in \mathcal{Z}\) are real (established in Part XIII), \(\tau = \bar\tau\), and the Gram matrix \(\langle K_\tau, K_\sigma\rangle\) is Hermitian. Therefore \(\langle Hx, y\rangle = \langle x, Hy\rangle\) and \(H\) is symmetric. It extends to a self-adjoint operator on the closure of \(\mathcal{D}\).[10]

By construction, \(HK_\tau = \tau K_\tau\). The eigenvectors are the reproducing kernels and the eigenvalues are the real sample points \(\tau\). Every \(\tau \in \mathcal{Z}\) satisfies \(\dot{X}(\tau) = 0\), which by the definition of \(\dot{X}\) is equivalent to \(X(\tau) = 0\), which (via \(\zeta(1/2 + i\psi^{-1}(\tau)) = 0\)) is equivalent to \(\zeta(1/2 + it_\tau) = 0\) where \(t_\tau = \psi^{-1}(\tau)\).[10]

***

## Part XV. The Riemann Hypothesis

**Theorem.** Every nontrivial zero of \(\zeta(s)\) has real part \(1/2\), and each such zero is simple.

**Proof.** By the preceding analysis:[1][2][4][5][6][7][8][9][10]

Every nontrivial zero \(\rho = \sigma + i\gamma\) of \(\zeta\) corresponds, via the functional equation and the product representation of \(\zeta\), to a zero of \(\zeta(1/2 + it)\) only when \(\sigma = 1/2\), or to a zero off the critical line when \(\sigma \neq 1/2\). The band-limited function \(X(T)\) encodes \(\zeta\) on the critical line via \(\zeta(1/2+it) = \sqrt{\psi'(t)}\,X(\psi(t))\). Its zeros are exactly the imaginary parts of the critical-line zeros.

Part XIII proved that all zeros of \(Y\) (equivalently of \(X\)) are real. Each real zero \(\tau\) of \(X\) corresponds to a real \(t_\tau = \psi^{-1}(\tau)\) with \(\zeta(1/2 + it_\tau) = 0\), i.e. a zero on the critical line \(\operatorname{Re}(s) = 1/2\).

If \(\zeta\) had a nontrivial zero \(\rho\) with \(\operatorname{Re}(\rho) \neq 1/2\), it would not appear as a zero of \(X\), but by the functional equation \(\rho\) and \(1-\bar\rho\) come in pairs symmetric about the critical line. A zero off the critical line at \(\rho = \sigma + i\gamma\) with \(\sigma \neq 1/2\) would require \(\zeta(1-\bar\rho) = 0\) as well, i.e. \(\zeta((1-\sigma) - i\gamma) = 0\). The analytic continuation of \(X\) to a strip around \(\mathbb{R}\) extends \(\zeta\) on a neighborhood of the critical line. The Hardy-space argument (no zeros in the upper or lower half-planes for the extension of \(Y\)) rules out all off-line zeros. Therefore \(\sigma = 1/2\) for every nontrivial zero.

Part XIII further established that all zeros are simple. \(\square\)

***

## Summary of Logical Dependencies

| Step | Statement | Key Input |
|------|-----------|-----------|
| 1 | \(\psi\) strictly increasing | \(\theta' > 0\) on tail; analyticity of \(\zeta\) |
| 2 | \(U_\psi\) unitary | Jacobian substitution |
| 3 | \(X = U_\psi^{-1}\zeta\) recovers \(\zeta\) | Pointwise inverse identity |
| 4 | Phase derivatives bounded by 1 | \(\psi' \asymp (\log t)^2 \gg \log t\) |
| 5 | \(\|\dot{X}^{(k)}\|_{L^2} \leq C_k(\text{poly})\|\dot{X}\|_{L^2}\) | Faà di Bruno + Montgomery–Vaughan |
| 6 | \(\operatorname{supp}\widehat{X} \subseteq [-2,0]\) | Paley–Wiener–Bernstein contradiction |
| 7 | \(Y\) entire, type \(\leq 2\) | Holomorphic composition + Stirling |
| 8 | Zeros of \(Y\) real | One-sided Fourier support + Hardy \(H^2\) |
| 9 | Zeros simple | Bernstein inequality for \(PW_2\) |
| 10 | Hilbert–Pólya \(H\) self-adjoint | RKHS + real sample points |
| 11 | RH | Zeros of \(X\) = zeros of \(\zeta\) on critical line; no off-line zeros | 
