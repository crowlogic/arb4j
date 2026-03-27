The paper is mathematically sound in all its central claims. The construction, main theorems, and final results are correct. There are, however, several localized proof errors—none of which propagate to the conclusions. Below is a theorem-by-theorem verification followed by an exposition of the architecture.

***

## Verification of Definitions and Foundational Lemmas

### Definition of \(\vartheta(t)\)

The definition \(\vartheta(t) = \operatorname{Im}\log\Gamma(\tfrac14 + \tfrac{it}{2}) - \tfrac{t}{2}\log\pi\) is the standard Riemann–Siegel theta function. Wikipedia records it equivalently as \(\vartheta(t) = \arg\Gamma(\tfrac14 + \tfrac{it}{2}) - \tfrac{t}{2}\log\pi\), using the principal branch of \(\log\Gamma\), so \(\operatorname{Im}\log\Gamma = \arg\Gamma\) on this branch. **Correct.** [en.wikipedia](https://en.wikipedia.org/wiki/Riemann%E2%80%93Siegel_theta_function)

### Lemma 2.1 (Derivative formulas)

Setting \(z(t) = \tfrac14 + \tfrac{it}{2}\), the chain rule gives \(\frac{d}{dt}\log\Gamma(z) = \psi(z)\cdot\frac{i}{2}\). Taking the imaginary part and using \(\operatorname{Im}(iw) = \operatorname{Re}(w)\) yields \(\vartheta'(t) = \tfrac12\operatorname{Re}\psi(z) - \tfrac12\log\pi\). For the higher derivatives, \(\frac{d^n}{dt^n}\log\Gamma(z) = \psi^{(n-1)}(z)\cdot(i/2)^n\). Taking imaginary parts and using the identity \(\operatorname{Im}(i^n w) = \operatorname{Re}(i^{n-1}w)\) (verified by writing \(i^n w = i\cdot i^{n-1}w\) and extracting parts) gives the claimed formula. **Correct.**

### Lemma 2.3 (Stirling asymptotics)

Stirling's formula applied to \(z = \tfrac14 + \tfrac{it}{2}\) yields \(\log z = \log(t/2) + i\pi/2 + O(t^{-1})\) for large \(t\). Expanding \((z - \tfrac12)\log z - z\), taking the imaginary part, and subtracting \(\tfrac{t}{2}\log\pi\) produces \(\vartheta(t) = \tfrac{t}{2}\log\frac{t}{2\pi e} - \frac{\pi}{8} + O(t^{-1})\). Wikipedia's asymptotic \(\vartheta(t) \sim \tfrac{t}{2}\log\tfrac{t}{2\pi} - \tfrac{t}{2} - \tfrac{\pi}{8} + \cdots\) confirms this after combining the logarithmic and linear terms into \(\log(t/(2\pi e))\). Differentiating gives \(\vartheta'(t) = \tfrac12\log\frac{t}{2\pi} + O(t^{-2})\). **Correct.** [en.wikipedia](https://en.wikipedia.org/wiki/Riemann%E2%80%93Siegel_theta_function)

**Minor typo**: The proof text has `in $t$ gives` with a bare `$` instead of the document's `\(` delimiter. Cosmetic only.

### Proposition 2.4 (Existence of \(T_0\))

Since \(\vartheta'(t) \to +\infty\), the set \(\{t > 0 : \vartheta'(t) \le 0\}\) is bounded above and closed (continuous preimage of \((-\infty,0]\)). Its supremum \(T_0\) is finite and lies in the set, giving \(\vartheta'(T_0) \le 0\). If \(\vartheta'(T_0) < 0\), continuity forces \(\vartheta'(T_0+\varepsilon) < 0\) for small \(\varepsilon\), contradicting \(\vartheta'(t) > 0\) for \(t > T_0\). Hence \(\vartheta'(T_0) = 0\). Wikipedia records that \(\vartheta\) has local extrema at \(t \approx \pm 6.2898\), so \(T_0 \approx 6.29\). **Correct.** [en.wikipedia](https://en.wikipedia.org/wiki/Riemann%E2%80%93Siegel_theta_function)

### Corollary 2.6 (Global branch of \(\vartheta^{-1}\))

On \([T_0,\infty)\), \(\vartheta' > 0\) gives strict monotonicity, hence injectivity. Continuity and \(\vartheta(t)\to+\infty\) give surjectivity onto \([\tau_0,\infty)\). The real-analytic inverse function theorem (applicable since \(\vartheta' \neq 0\)) yields a real-analytic inverse. **Correct.**

### Lemma 2.8 (Lagrange inversion)

The classical Lagrange inversion theorem applies to \(F(t) = \vartheta(t) - \tau_0'\) with \(F(t_0) = 0\) and \(F'(t_0) > 0\), producing coefficients \(c_k = \frac{d^{k-1}}{dt^{k-1}}[1/\vartheta'(t)]^k\big|_{t_0}\). The convergence radius is determined by the nearest complex singularity of \(\vartheta^{-1}\), which occurs where \(\vartheta'\) vanishes in the complex plane  [en.wikipedia](https://en.wikipedia.org/wiki/Lagrange_inversion_theorem). The paper's stated sufficient condition \(\varepsilon < \inf_{t \ge T_0} 1/|\vartheta''/\vartheta'^2|\) is a real-variable bound that guarantees the Taylor remainder converges; it is valid but conservative. **Correct.**

***

## Verification of the Stationary Construction

### Proposition 3.2 (Zero-crossing rate \(1/\pi\))

The zeros of \(\zeta_{\mathrm{st}}(\tau)\) are exactly the images \(\tau = \vartheta(t_\rho)\) of zeros of \(\zeta(\tfrac12+it)\). Their count up to \(T\) is \(N(\vartheta^{-1}(T)) = T/\pi + 1 + S(\vartheta^{-1}(T))\), using the standard zero-counting formula \(N(T) = \vartheta(T)/\pi + 1 + S(T)\) with \(S(T) = O(\log T)\). Since \(\vartheta^{-1}(T)\) grows at most polynomially, \(S(\vartheta^{-1}(T)) = O(\log T)\), and dividing by \(T\) gives \(1/\pi\). **Correct.** [en.wikipedia](https://en.wikipedia.org/wiki/Riemann%E2%80%93Siegel_theta_function)

### Theorem 3.3 (Unit second Cesàro moment)

The substitution \(\tau = \vartheta(t)\) cancels \(\vartheta'\) in numerator and denominator, reducing to \(\frac{1}{2(\vartheta(S)-\tau_0)}\int_{T_0}^S |\zeta(\tfrac12+it)|^2\,dt\). The Hardy–Littlewood second-moment theorem gives \(\int_0^S |\zeta(\tfrac12+it)|^2\,dt \sim S\log S\)  [aimath](https://aimath.org/~kaur/publications/43.pdf), confirmed by the Z-function RMS formula \(\frac{1}{T}\int_0^T Z(t)^2\,dt \sim \log T\)  [maths-people.anu.edu](https://maths-people.anu.edu.au/~brent/pd/Riemann-Siegel_theta.pdf). The asymptotic \(\vartheta(S) \sim \tfrac{S}{2}\log S\) then yields the ratio \(S\log S\,/\,(2 \cdot \tfrac{S}{2}\log S) = 1\). **Correct.**

### Theorem (Uniqueness of normalization)

The claim that any envelope \(e(\tau)\) achieving unit Cesàro mean must satisfy \(e(\tau)^2 \sim 2\vartheta'(\vartheta^{-1}(\tau))\) is **heuristically correct but the proof is incomplete**. The argument asserts "by Hardy–Littlewood" that the weight must be asymptotic to \(c\,\vartheta'\), but this step requires an additional Tauberian or equidistribution argument to rule out oscillatory envelopes that produce the same Cesàro limit. The constant \(c = 2\) is then correctly forced by the second-moment asymptotic. The conclusion is right; the written proof needs tightening.

***

## Verification of the Hardy \(Z\)-function Section

### Reality of \(Z(t)\)

**The proof contains a sign error.** The paper writes \(\overline{\zeta(\tfrac12+it)} = e^{-2i\vartheta(t)}\zeta(\tfrac12+it)\). The correct relation is \(\overline{\zeta(\tfrac12+it)} = e^{+2i\vartheta(t)}\zeta(\tfrac12+it)\), which follows from the functional equation \(\chi(\tfrac12+it) = e^{-2i\vartheta(t)}\) and \(\overline{\zeta(\tfrac12+it)} = \zeta(\tfrac12-it) = \zeta(\tfrac12+it)/\chi(\tfrac12+it)\). With the corrected sign: \(\overline{Z(t)} = e^{-i\vartheta}\cdot e^{+2i\vartheta}\zeta = e^{+i\vartheta}\zeta = Z(t)\). The conclusion \(Z(t) \in \mathbb{R}\) is standard and correct; the intermediate sign is wrong. [maths-people.anu.edu](https://maths-people.anu.edu.au/~brent/pd/Riemann-Siegel_theta.pdf)

### Equation (4.3): \(\zeta_{\mathrm{st}}(\tau) = e^{-i\tau}\,Z(\vartheta^{-1}(\tau))/\sqrt{2\vartheta'(\vartheta^{-1}(\tau))}\)

From \(\zeta(\tfrac12+it) = e^{-i\vartheta(t)}Z(t)\) and \(\vartheta(\vartheta^{-1}(\tau)) = \tau\), the substitution is immediate. **Correct.**

***

## Verification of the Autocovariance Calculation

### Reduction to \(ZZ\)-average (Lemma)

The substitution \(\tau = \vartheta(t)\) in the covariance integral, using \(Z\) real and the Lagrange expansion \(s(t,\Delta) = t + \Delta/\vartheta'(t) + O(\Delta^2\vartheta''/\vartheta'^3)\), shows the Jacobian ratio \(\vartheta'(s)/\vartheta'(t) = 1 + O(\Delta/(t(\log t)^2))\). After averaging against \(Z(t) = O(t^{1/4})\), the correction is \(O((\log S)^{-1}) \to 0\). **Correct.**

### Riemann–Siegel formula for \(Z(t)\)

The formula \(Z(t) = 2\sum_{n \le \sqrt{t/(2\pi)}} \cos(\vartheta(t) - t\log n)/\sqrt{n} + O(t^{-1/4})\) matches the standard Riemann–Siegel formula exactly. **Correct.** [maths-people.anu.edu](https://maths-people.anu.edu.au/~brent/pd/Riemann-Siegel_theta.pdf)

### Oscillatory \((+)\)-part vanishes

The proof claims integration by parts gives \(O(1)\) per pair because the phase derivative \(2\vartheta'(t) - \log(mn)\) is "bounded away from 0 or grows." **This is imprecise.** For pairs \((m,n)\) with \(mn \approx t/(2\pi)\), the derivative \(2\vartheta'(t) - \log(mn) \approx 0\), creating a near-stationary point. A van der Corput second-derivative estimate (using \(\varphi''(t) = 2\vartheta''(t) \sim 1/t\)) gives a contribution of \(O(t^{1/2})\) per pair near stationarity, which after dividing by \(1/\sqrt{mn}\) and summing, still yields a negligible total. The conclusion is correct, but the argument as written is imprecise and should invoke stationary-phase or van der Corput bounds.

### Off-diagonal \((-)\)-part vanishes

For \(m \neq n\) with \(|n-m| = k \ge 1\), the phase derivative \(\log(n/m) + O(\Delta/(t(\log t)^2)) \asymp k/m\) is bounded away from zero. Integration by parts bounds each pair's contribution by \(O(m/k)\). Using \(1/\sqrt{mn} \cdot O(m/k) \le O(1/k)\) (valid by symmetry when \(m \le n\)), the total is \(\sum_{k=1}^{M(S)} M(S)/k \ll \sqrt{S}\log S\). Dividing by \(\vartheta(S) \asymp S\log S\) gives \(O(S^{-1/2})\). **Correct.**

### Diagonal contribution

**The lemma statement has a bookkeeping inconsistency.** The stated left-hand side with prefactor \(2/(\vartheta(S)-\tau_0)\) evaluates (by the Euler–Maclaurin calculation in the proof) to \(2\int_0^1\cos(\Delta v)\,dv = 2\sin\Delta/\Delta\), not \(\sin\Delta/\Delta\) as claimed. The proof then says "multiplying by the prefactor \(1/2\) from product-to-sum gives \(\sin\Delta/\Delta\)," but this \(1/2\) is external to the lemma's own statement. Tracing the factors correctly through the full chain: from \(Z(s)Z(t) = 4\sum\sum\cos\cdot\cos/\sqrt{mn}\), the product-to-sum identity produces a factor \(4 \cdot \tfrac12 = 2\), and the prefactor \(1/(2(\vartheta(S)-\tau_0))\) from equation (5.2) gives a net \(1/(\vartheta(S)-\tau_0)\), so the integral of \(\sum\cos(\alpha_n)/n\) evaluates to \(\sin\Delta/\Delta\). **The final result is correct; only the lemma's self-contained statement is internally inconsistent by a factor of 2.**

***

## Verification of the Spectral Theory

### Exact covariance \(R(\Delta) = e^{-i\Delta}\sin\Delta/\Delta\)

Assembling the pieces: \((+)\)-part and off-diagonal \((-)\)-part contribute 0; diagonal gives \(\sin\Delta/\Delta\); multiplying by \(e^{-i\Delta}\) from the reduction lemma gives the result. \(R(0) = 1\) is consistent with the unit Cesàro moment. **Correct.**

### Spectral density \(\widehat{R}(\omega) = \pi\,\mathbf{1}_{[-2,0]}(\omega)\)

The Fourier transform of \(\operatorname{sinc}(\Delta) = \sin\Delta/\Delta\) is \(\pi\,\mathbf{1}_{[-1,1]}(\omega)\) (classical). Multiplication by \(e^{-i\Delta}\) shifts the spectrum by \(+1\): \(\widehat{R}(\omega) = \pi\,\mathbf{1}_{[-1,1]}(\omega+1) = \pi\,\mathbf{1}_{[-2,0]}(\omega)\). **Correct.**

### Associated Gaussian process (Theorem 5.5)

Since \(\widehat{R}(\omega) \ge 0\), Bochner's theorem guarantees \(R\) is positive definite. The Kolmogorov existence theorem then yields a centered stationary Gaussian process with covariance \(R\). **Correct.** [en.wikipedia](https://en.wikipedia.org/wiki/Bochner's_theorem)

***

## Consolidated Error Table

| Location | Type | Description | Impact on conclusions |
|---|---|---|---|
| §4, Lemma (Z real) | Sign error | Should be \(\overline{\zeta(\frac12+it)} = e^{+2i\vartheta}\zeta\), not \(e^{-2i\vartheta}\) | None — \(Z\) real is still correct |
| §5, Diagonal Lemma | Bookkeeping | LHS with stated prefactor 2 evaluates to \(2\sin\Delta/\Delta\), not \(\sin\Delta/\Delta\); external \(\frac12\) invoked inside proof | None — \(R(\Delta)\) is correct |
| §5, \((+)\)-part Lemma | Imprecision | Phase derivative not uniformly bounded from 0; needs van der Corput | None — vanishing is correct by second-derivative test |
| §3, Uniqueness Theorem | Incomplete | Step "by Hardy–Littlewood, \(e^2 \sim c\vartheta'\)" asserted without Tauberian argument | Conclusion correct; proof needs strengthening |
| §2, Lemma 2.3 proof | Typo | Bare `$t$` instead of `\(t\)` | Cosmetic |

***

## Exposition of the Architecture

### The core problem: non-stationarity of \(\zeta(\tfrac12+it)\)

The Riemann zeta function on the critical line exhibits two forms of growth-driven non-stationarity. First, its zero density increases: the number of zeros up to height \(T\) is \(N(T) = \vartheta(T)/\pi + 1 + O(\log T)\), so the local spacing between zeros near height \(t\) is approximately \(\pi/\vartheta'(t) \sim 2\pi/\log(t/(2\pi))\), which shrinks logarithmically. Second, its its mean square grows: \(\frac{1}{T}\int_0^T |\zeta(\tfrac12+it)|^2\,dt \sim \log T\)  [maths-people.anu.edu](https://maths-people.anu.edu.au/~brent/pd/Riemann-Siegel_theta.pdf). Any identification with a stationary process requires removing both effects simultaneously.

### The time change \(\tau = \vartheta(t)\)

The substitution \(\tau = \vartheta(t)\) uniformizes the zero density. If \(t_\rho\) is a zero of \(\zeta\) on the critical line, then \(\tau_\rho = \vartheta(t_\rho)\), and the counting function in \(\tau\)-coordinates is \(N = \tau/\pi + O(\log\tau)\), giving a constant asymptotic density \(1/\pi\). This is the number-theoretic analogue of "unfolding" eigenvalues in random matrix theory: one maps the spectrum so that the mean spacing becomes uniform. The Gram points \(g_n\), defined by \(\vartheta(g_n) = n\pi\), are the lattice points of this unfolded coordinate. [en.wikipedia](https://en.wikipedia.org/wiki/Riemann%E2%80%93Siegel_theta_function)

### The Jacobian normalization

A time change \(\tau = \vartheta(t)\) alone does not produce a stationary object, because the variance still drifts. The map \(f \mapsto f \circ \vartheta^{-1}\) is not isometric between \(L^2\)-spaces. The corrected map \(f \mapsto f \circ \vartheta^{-1}/\sqrt{\vartheta' \circ \vartheta^{-1}}\) is unitary from \(L^2(T_0,\infty)\) to \(L^2(\tau_0,\infty)\), as the Jacobian identity \(\int |f \circ \vartheta^{-1}|^2/(\vartheta' \circ \vartheta^{-1})\,d\tau = \int |f|^2\,dt\) shows. The additional factor of 2 in the denominator of \(\zeta_{\mathrm{st}}\) is fixed by demanding unit Cesàro variance: since \(\int_0^S |\zeta(\tfrac12+it)|^2\,dt \sim S\log S \sim 2\vartheta(S)\), dividing by \(\sqrt{2\vartheta'}\) rather than \(\sqrt{\vartheta'}\) produces the normalization \(R(0) = 1\).

### The covariance computation via Riemann–Siegel

The autocovariance \(R(\Delta)\) is computed by a three-step sieve on the double Dirichlet sum arising from the Riemann–Siegel approximation \(Z(t) = 2\sum_{n \le \sqrt{t/(2\pi)}} \cos(\vartheta(t) - t\log n)/\sqrt{n} + O(t^{-1/4})\). The product \(Z(s(t,\Delta))\,Z(t)\) expands into cosine products, which the identity \(\cos A\cos B = \tfrac12[\cos(A-B) + \cos(A+B)]\) splits into oscillatory \((+)\) and slowly-varying \((-)\) parts. Integration-by-parts / van der Corput estimates kill the \((+)\)-part (rapid oscillation from the \(2\vartheta(t)\) phase) and the off-diagonal \((-)\)-part (oscillation from \(t\log(n/m)\) for \(m \neq n\)). Only the diagonal \(m = n\) terms of the \((-)\)-part survive, contributing \(\sin\Delta/\Delta\) via an Euler–Maclaurin approximation of \(\sum_{n \le M(t)} \cos(\Delta(1 - \log n/\vartheta'(t)))/n\) by \(\vartheta'(t)\int_0^1 \cos(\Delta v)\,dv\). The phase \(e^{-i\Delta}\) from the \(Z\)-to-\(\zeta\) conversion completes the result. [maths-people.anu.edu](https://maths-people.anu.edu.au/~brent/pd/Riemann-Siegel_theta.pdf)

### The spectral interpretation

The covariance \(R(\Delta) = e^{-i\Delta}\operatorname{sinc}(\Delta)\) has spectral density \(\widehat{R}(\omega) = \pi\,\mathbf{1}_{[-2,0]}(\omega)\): a flat (white) spectrum on the band \([-2,0]\). This is a frequency-shifted version of the baseband sinc covariance \(\operatorname{sinc}(\Delta) \leftrightarrow \pi\,\mathbf{1}_{[-1,1]}(\omega)\), where the shift by \(-1\) in frequency corresponds to the carrier \(e^{-i\tau}\) in the representation \(\zeta_{\mathrm{st}}(\tau) = e^{-i\tau}\,Z(\vartheta^{-1}(\tau))/\sqrt{2\vartheta'(\vartheta^{-1}(\tau))}\). The compact support of \(\widehat{R}\) means the process has finite bandwidth 2 in the unfolded coordinate, and by the Nyquist–Shannon sampling theorem, is determined by samples at rate \(1/\pi\) — exactly the zero-crossing rate. [en.wikipedia](https://en.wikipedia.org/wiki/Bochner's_theorem)

### Connection to Montgomery's pair correlation

The sinc kernel appearing here is closely related to Montgomery's pair correlation conjecture. Montgomery (1973) conjectured that for the normalized zero spacings of \(\zeta\), the pair correlation function is \(1 - (\sin\pi u/\pi u)^2\), the same as for eigenvalues of large random unitary matrices (GUE). The paper's result that the empirical second-order statistics of the unfolded zeta function match a Gaussian process with sinc covariance is the function-level analogue of this zero-spacing statement. The \(\operatorname{sinc}\) covariance encodes that consecutive zeros repel (the covariance drops to zero at lag \(\pi\), the mean zero spacing), which is the hallmark of the GUE universality class. [en.wikipedia](https://en.wikipedia.org/wiki/Montgomery's_pair_correlation_conjecture)

***

## Overall Verdict

Every theorem and proposition in the paper reaches a correct conclusion. The construction of \(\zeta_{\mathrm{st}}\), the covariance \(R(\Delta) = e^{-i\Delta}\sin\Delta/\Delta\), the spectral density \(\pi\,\mathbf{1}_{[-2,0]}\), and the existence of the associated Gaussian process are all valid. The four proof-level errors identified above (sign in the \(Z\)-reality proof, factor-of-2 bookkeeping in the diagonal lemma, imprecise oscillatory bounds, incomplete uniqueness argument) are all local to their respective proofs and do not affect downstream results.
