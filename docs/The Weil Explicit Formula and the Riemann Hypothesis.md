# The Weil Explicit Formula and the Riemann Hypothesis: A Computationally Grounded Exposition

***

## 1. The Object of Study

The Riemann zeta function is defined for \(\mathrm{Re}(s) > 1\) by

\[
\zeta(s) = \sum_{n=1}^{\infty} \frac{1}{n^s} = \prod_{p\ \text{prime}} \frac{1}{1-p^{-s}}.
\]

The Euler product encodes unique prime factorization: every term in the Dirichlet series corresponds to a product of prime-power contributions from the Euler factors. Riemann showed in 1859 that \(\zeta(s)\) extends meromorphically to all of \(\mathbb{C}\) with a single simple pole at \(s = 1\), and satisfies the functional equation[^1]

\[
\xi(s) := \pi^{-s/2} \Gamma\!\left(\tfrac{s}{2}\right) \zeta(s) = \xi(1-s). \tag{1}
\]

This symmetry \(s \leftrightarrow 1-s\) about the line \(\mathrm{Re}(s) = \tfrac{1}{2}\) is exact. The non-trivial zeros of \(\zeta\) are those \(\rho\) with \(0 < \mathrm{Re}(\rho) < 1\) and \(\zeta(\rho) = 0\). Functional equation (1) forces them to come in pairs \((\rho, 1-\bar{\rho})\). The **Riemann Hypothesis (RH)** is the assertion that \(\mathrm{Re}(\rho) = \tfrac{1}{2}\) for every non-trivial zero.[^1]

***

## 2. The von Mangoldt Function and the Chebyshev \(\psi\)

The **von Mangoldt function** is the arithmetic function[^2]

\[
\Lambda(n) = \begin{cases} \log p & \text{if } n = p^k \text{ for some prime } p \text{ and integer } k \geq 1, \\ 0 & \text{otherwise.} \end{cases}
\]

Its values are: \(\Lambda(1)=0\), \(\Lambda(2)=\log 2\), \(\Lambda(3)=\log 3\), \(\Lambda(4)=\log 2\), \(\Lambda(5)=\log 5\), \(\Lambda(6)=0\), \(\Lambda(7)=\log 7\), \(\Lambda(8)=\log 2\), \(\Lambda(9)=\log 3\), \(\Lambda(10)=0\). The function is zero at composite numbers and at \(1\); non-zero only at prime powers, with value \(\log p\) at every power of \(p\).[^2]

This is the natural weight for prime powers in analytic number theory because[^2]

\[
-\frac{\zeta'(s)}{\zeta(s)} = \sum_{n=1}^{\infty} \frac{\Lambda(n)}{n^s}, \qquad \mathrm{Re}(s) > 1.
\]

The Chebyshev function \(\psi(x) = \sum_{n \leq x} \Lambda(n)\) is the logarithmically weighted prime-power count up to \(x\). The prime number theorem — \(\pi(x) \sim x/\log x\) — is equivalent to \(\psi(x) \sim x\). RH is equivalent to \(\psi(x) = x + O(\sqrt{x}\log^2 x)\), a quantitative sharpening.[^1]

***

## 3. The Explicit Formula

### 3.1 What It States

The explicit formula is the exact identity linking \(\psi(x)\) to the zeros of \(\zeta\). Riemann's original version, cleaned up by von Mangoldt, gives[^1]

\[
\psi(x) = x - \sum_{\rho}^{'} \frac{x^{\rho}}{\rho} - \frac{\zeta'(0)}{\zeta(0)} - \tfrac{1}{2}\log(1 - x^{-2}), \qquad x > 1, \tag{2}
\]

where the sum is over non-trivial zeros, taken symmetrically as \(\lim_{T\to\infty}\sum_{|\mathrm{Im}\,\rho| \leq T}\). The term \(x\) on the right comes from the pole of \(-\zeta'/\zeta\) at \(s=1\). Each zero \(\rho = \sigma + i\gamma\) contributes \(x^\rho/\rho = x^\sigma e^{i\gamma\log x}/\rho\). Under RH, all \(\sigma = \tfrac{1}{2}\), so every contribution has modulus \(x^{1/2}/|\rho|\) — this is exactly why RH gives the sharp bound \(\psi(x) = x + O(\sqrt{x}\log^2 x)\)[^1].

### 3.2 The Test-Function Form (Guinand–Weil)

The most flexible form uses a smooth test function. Define the Mellin transform of \(u:(0,\infty)\to\mathbb{C}\) as

\[
\widetilde{u}(s) = \int_0^{\infty} u(t)\, t^{s-1}\, dt,
\]

and define the involution \(u^*(t) = t^{-1} u(t^{-1})\). The Guinand–Weil explicit formula is then[^3][^1]

\[
\widetilde{u}(0) + \widetilde{u}(1) - \sum_{\rho}^{'} \widetilde{u}(\rho) = \sum_{n=1}^{\infty} \Lambda(n)\bigl[u(n) + u^*(n)\bigr] + W_{\infty}(u). \tag{3}
\]

**Decoding (3) term by term:**

The left side is the **spectral side**: the two polar contributions \(\widetilde{u}(0) + \widetilde{u}(1)\) from the trivial factors and pole of \(\zeta\), minus the sum of \(\widetilde{u}\) evaluated at each non-trivial zero. This side "knows" the zeros.[^1]

The right side is the **arithmetic side**: the discrete sum over prime powers \(n\) via \(\Lambda(n)\), together with the archimedean term \(W_\infty(u)\) which comes from the Gamma factor in the functional equation. This side "knows" the primes.[^1]

The formula says these two ways of computing the same quantity are exactly equal, for every sufficiently regular test function \(u\).

### 3.3 The Archimedean Term \(W_\infty(u)\)

The term \(W_\infty(u)\) is a principal-value integral arising from the logarithmic derivative of the Gamma factor \(\pi^{-s/2}\Gamma(s/2)\) in \(\xi(s)\). Explicitly:[^4][^3]

\[
W_\infty(u) = \int_0^\infty u(\rho)\,\tau(\rho)\,d^{\times}\rho, \qquad \tau(\rho) = \frac{\rho^{1/2}}{2}\!\left(\frac{1}{1+\rho} + \frac{1}{|1-\rho|}\right), \tag{4}
\]

with \(d^{\times}\rho = d\rho/\rho\) the multiplicative Haar measure, and the integral interpreted as a principal value at \(\rho = 1\) because \(\tau(\rho) \sim |\rho - 1|^{-1}\) as \(\rho\to 1\). The singularity is not removable: it arises because the log-derivative of \(\Gamma(s/2)\) has a pole at \(s=0\) corresponding to the zero of \(\xi\) at \(s=0\)[^4]. Every formula involving \(W_\infty\) must either evaluate the principal value directly or choose test functions \(u\) that vanish at \(\rho = 1\) to make the integral absolutely convergent.

For a concrete class: if \(u\) is smooth, compactly supported in \((0,\infty)\setminus\{1\}\), then \(W_\infty(u) = \int u(\rho)\tau(\rho)d^{\times}\rho\) with no regularization needed.

***

## 4. Weil's Positivity Criterion: Full Derivation

### 4.1 Setting Up the Quadratic Form

Work on the multiplicative group \(\mathbb{R}^{\times}_+ = (0,\infty)\) with convolution

\[
(f * g)(x) = \int_0^\infty f(xy^{-1})\,g(y)\,d^{\times}y
\]

and the involution \(g^\sharp(x) = x^{-1}g(x^{-1})\). Note that \(\widetilde{g^\sharp}(s) = \widetilde{g}(1-s)\), so the involution \(g \mapsto g^\sharp\) corresponds to the symmetry \(s \mapsto 1-s\) at the level of Mellin transforms — this is exactly the symmetry of the functional equation (1).[^5]

Now substitute the positive-definite element \(f = g * \bar{g}^\sharp\) (for \(g \in C_c^\infty(\mathbb{R}^{\times}_+)\)) into the explicit formula (3). The Mellin transform satisfies

\[
\widetilde{f}(s) = \widetilde{g}(s)\cdot\overline{\widetilde{g}(1-\bar{s})},
\]

so at a zero \(\rho\) of \(\zeta\):

\[
\widetilde{f}(\rho) = \widetilde{g}(\rho)\cdot\overline{\widetilde{g}(1-\bar{\rho})}.
\]

Under RH, all zeros satisfy \(\rho = \tfrac{1}{2} + i\gamma\) with \(\gamma \in \mathbb{R}\), so \(1-\bar{\rho} = \tfrac{1}{2} + i\gamma = \rho\), giving \(\widetilde{f}(\rho) = |\widetilde{g}(\rho)|^2 \geq 0\)[^5][^3].

### 4.2 The Spectral Side Under RH

The spectral side of (3) applied to \(f = g * \bar{g}^\sharp\) becomes:

\[
\widetilde{f}(0) + \widetilde{f}(1) - \sum_{\rho}^{'}\widetilde{f}(\rho) = |\widetilde{g}(0)|^2 + |\widetilde{g}(1)|^2 - \sum_{\rho}^{'}|\widetilde{g}(\rho)|^2.
\]

(The equality \(\widetilde{f}(0) = |\widetilde{g}(0)|^2\) and \(\widetilde{f}(1) = |\widetilde{g}(1)|^2\) use \(\rho \in \{0,1\}\) on the critical line.) The third term \(-\sum|\widetilde{g}(\rho)|^2\) is a sum of non-positive terms with a minus sign, so the spectral side has no definite sign from this alone.

Impose the **normalization condition**: require \(\widetilde{g}(0) = \widetilde{g}(1) = 0\). (These are conditions at the real points \(s = 0, 1\), achievable by choosing \(g\) so that \(\int g(x) d^{\times}x = 0\) and \(\int g(x)\cdot x\, d^{\times}x = 0\).) Then the spectral side collapses to

\[
-\sum_{\rho}^{'}|\widetilde{g}(\rho)|^2 \leq 0.
\]

The explicit formula (3) then says:

\[
-\sum_{\rho}^{'}|\widetilde{g}(\rho)|^2 = \text{(arithmetic side)} = \sum_{n=1}^{\infty}\Lambda(n)[f(n) + f^*(n)] + W_\infty(f). \tag{5}
\]

**RH is equivalent to**: for all \(g \in C_c^\infty(\mathbb{R}^{\times}_+)\) with \(\widetilde{g}(0) = \widetilde{g}(1) = 0\), the right side of (5) is \(\leq 0\).[^6][^5]

This is Weil's criterion. The arithmetic side \(\sum_v W_v(f)\) must be non-positive for every such \(f\), where \(W_v(f)\) denotes the contribution of the place \(v\) to the right-hand side.

### 4.3 Why the Sign Can Fail

If RH is false with a zero \(\rho_0 = \sigma_0 + i\gamma_0\) at \(\sigma_0 \neq \tfrac{1}{2}\), then \(1-\bar{\rho}_0 \neq \rho_0\), so \(\widetilde{f}(\rho_0) = \widetilde{g}(\rho_0)\overline{\widetilde{g}(1-\bar{\rho}_0)}\) need not be real, and in particular the sum \(\sum |\widetilde{g}(\rho)|^2\) over off-line zeros is replaced by a non-Hermitian sum that can exceed the contributions from on-line zeros. Bombieri showed precisely: if exactly \(2k\) zeros lie off the critical line (counted with multiplicity), then the Weil quadratic form has exactly \(k\) negative eigenvalues in a suitable finite-dimensional truncation, for truncation large enough[^6][^3].

***

## 5. The Computable Equivalences

### 5.1 Li's Criterion

Define the completed xi function

\[
\xi(s) := \tfrac{1}{2}s(s-1)\pi^{-s/2}\Gamma\!\left(\tfrac{s}{2}\right)\zeta(s).
\]

This is entire, real on the real axis, symmetric \(\xi(s) = \xi(1-s)\), with zeros exactly at the non-trivial zeros of \(\zeta\). Define the **Li coefficients**[^7]

\[
\lambda_n := \frac{1}{(n-1)!}\frac{d^n}{ds^n}\left[s^{n-1}\log\xi(s)\right]\bigg|_{s=1}, \qquad n = 1, 2, 3, \ldots \tag{6}
\]

Equivalently, these may be expressed as a sum over zeros:

\[
\lambda_n = \sum_\rho \left[1 - \left(1 - \frac{1}{\rho}\right)^n\right], \tag{7}
\]

where the sum is over all non-trivial zeros, symmetrically ordered[^7]. Note \(|1 - 1/\rho| < 1\) iff \(|\rho - 1| < |\rho|\) iff \(\mathrm{Re}(\rho) > \tfrac{1}{2}\)[^7]. So if all zeros have \(\mathrm{Re}(\rho) = \tfrac{1}{2}\), each term in (7) has real part 1 minus something of modulus exactly 1, and one can show the sum is real and positive.

**Li's theorem (1997):** RH is equivalent to \(\lambda_n > 0\) for all \(n \geq 1\).[^7]

**Proof sketch:** If RH holds, all \(\rho = \tfrac{1}{2} + i\gamma\), so \(1 - 1/\rho = (\rho - 1)/\rho\). The map \(\rho \mapsto 1 - 1/\rho\) sends the critical line to the circle \(|z - 1| = 1\) centered at \(1\). Then \(1 - (1 - 1/\rho)^n\) has positive real part for \(n \geq 1\) by the geometry of this circle, and summing over the symmetric zero set gives \(\lambda_n > 0\). Conversely, a zero off the critical line contributes a term with \(|1 - 1/\rho| \neq 1\), eventually making some \(\lambda_n \leq 0\)[^7][^8].

### 5.2 Computability of \(\lambda_n\)

The Taylor expansion

\[
\log\xi\!\left(\frac{z}{z-1}\right) = \sum_{n=0}^{\infty} \lambda_n z^n \tag{8}
\]

gives a direct power series whose coefficients are the Li numbers. The first few values, computed to 5 significant figures, are:[^9]

\(\lambda_1 \approx 0.023096\), \(\lambda_2 \approx 0.046173\), \(\lambda_3 \approx 0.069213\), \(\lambda_4 \approx 0.092198\).[^9]

All computed values are positive. Positivity has been verified rigorously (via interval arithmetic in the Arb library) up to \(n = 10^5\). The asymptotic behavior under RH is known precisely: as \(n \to \infty\),[^10][^11][^7]

\[
\lambda_n \sim n\bigl(A\log n + B\bigr), \qquad A = \tfrac{1}{2}, \quad B = \tfrac{1}{2}(\gamma - 1 - \log(4\pi)) \approx -0.023,
\]

which is positive for all large \(n\). This gives a concrete numerical program: compute \(\lambda_n\) for increasing \(n\) to unprecedented precision; a single negative value disproves RH.[^11]

### 5.3 The Nyman–Beurling \(L^2\) Criterion

Let \(\{t\}\) denote the fractional part of \(t\), and define the dilation \(\rho_a(x) = \{a/x\}\) for \(a > 0\). In the Hilbert space \(H = L^2(0,\infty)\) with the standard measure, let \(\mathcal{B}\) be the closure of the linear span of \(\{\rho_a : a \geq 1\}\).[^12][^13]

**Nyman–Beurling theorem:** RH is equivalent to \(\chi_{(0,1]} \in \mathcal{B}\), i.e., the indicator function of \((0,1]\) lies in the \(L^2\) closure of the space spanned by dilates of the fractional part.[^14][^12]

**Why this is equivalent to RH:** The Mellin transform of \(\rho_a(x) = \{a/x\}\) is \(\widetilde{\rho}_a(s) = a^s \zeta(s)/s\) for \(0 < \mathrm{Re}(s) < 1\). If \(\zeta\) has a zero \(\rho\) in the critical strip, then \(\widetilde{\rho}_a(\rho) = 0\) for all \(a\), so any function approximable by \(\rho_a\)'s must also have Mellin transform vanishing at \(\rho\). But the Mellin transform of \(\chi_{(0,1]}\) is \(1/s\), which is non-zero everywhere. Therefore if \(\chi_{(0,1]}\) is in \(\mathcal{B}\), the Mellin transform of functions in \(\mathcal{B}\) must be able to "see" \(1/s\) at every point in the strip, which forces no zeros off the critical line.[^12]

**Báez-Duarte's strengthening (2003):** It suffices to use only integer dilations: \(\mathcal{B}_{\mathbb{N}} = \overline{\mathrm{span}}\{\rho_n : n \in \mathbb{N}\}\). RH is equivalent to \(\chi_{(0,1]} \in \mathcal{B}_{\mathbb{N}}\). A constructive sequence of approximations is given:[^14]

\[
\chi_{(0,1]}(x) \approx -\sum_{a=1}^{n} \mu(a)\, e^{-c\frac{\log a}{\log\log n}} \rho_a(x), \tag{9}
\]

with error \(O((\log\log n)^{-1/3})\) in \(L^2\). Here \(\mu\) is the Möbius function. This gives a quantitative approximation problem that is both theoretically clean and numerically accessible.[^15]

### 5.4 The de Bruijn–Newman Constant

Define the family of entire functions parameterized by \(t \in \mathbb{R}\):[^16][^17]

\[
H_t(z) = \int_0^\infty e^{tu^2}\Phi(u)\cos(zu)\,du,
\]

where

\[
\Phi(u) = \sum_{n=1}^\infty \bigl(2\pi^2 n^4 e^{9u} - 3\pi n^2 e^{5u}\bigr)\exp(-\pi n^2 e^{4u}).
\]

At \(t = 0\), \(H_0(z/2) = \xi(\tfrac{1}{2} + iz)\), so the zeros of \(H_0\) are exactly the imaginary parts of the non-trivial zeros of \(\zeta\). The Fourier factor \(e^{tu^2}\) is an entire-function deformation that "spreads" the zeros of \(\Phi\) as \(t\) increases.[^17]

**Newman's theorem (1976):** There exists a finite constant \(\Lambda \in \mathbb{R}\) such that all zeros of \(H_t\) are real iff \(t \geq \Lambda\).[^18]

- RH is equivalent to \(\Lambda \leq 0\).[^18]
- Newman conjectured \(\Lambda \geq 0\).
- **Rodgers–Tao (2018):** Proved \(\Lambda \geq 0\). Therefore RH is equivalent to \(\Lambda = 0\) exactly.[^16][^17]

The Rodgers–Tao proof proceeds by contradiction: assume \(\Lambda < 0\), then analyze the zero dynamics of \(H_t\) for \(\Lambda < t \leq 0\) using work of Csordas, Smith, and Varga. The analysis forces the zeros of \(H_0\) to be in "local equilibrium" — locally behaving like an arithmetic progression. But this contradicts Montgomery's pair correlation results for zeta zeros, which establish that the zeros are NOT equally spaced locally; they exhibit GUE-type repulsion. The contradiction establishes \(\Lambda \geq 0\).[^17][^16]

The proof of \(\Lambda \geq 0\) is thus a genuine theorem — it combines real analysis, the zero dynamics of an explicit one-parameter family of entire functions, and the pair correlation statistics of zeta zeros. It required input from three previously unconnected areas.[^17]

### 5.5 Robin's Criterion

Let \(\sigma(n) = \sum_{d|n} d\) be the sum-of-divisors function and \(\gamma\) the Euler–Mascheroni constant[^19][^20]. **Robin's theorem (1984)[^20]:** RH is equivalent to

\[
\sigma(n) < e^{\gamma}\, n\log\log n \qquad \text{for all } n > 5040. \tag{10}
\]

The number 5040 is the largest \(n\) for which the inequality fails (it fails for several \(n \leq 5040\), all of which are highly composite). The key structural fact: the integers for which \(\sigma(n)/(n\log\log n)\) is maximized are the **colossally abundant numbers**, a specific infinite sequence constructible explicitly. If a violation of (10) exists beyond 5040, it must come from this sequence.[^19][^20]

Conditional refinements: any counterexample to (10) with \(n > 5040\) must be even, not squarefree, not squarefull, and divisible by a fifth power greater than 1. These structural constraints allow one to reduce the search to an explicitly characterized family.[^20]

**Lagarias's variant (2002):** RH is equivalent to

\[
\sigma(n) \leq H_n + e^{H_n}\log H_n \qquad \text{for all } n \geq 1,
\]

where \(H_n = \sum_{k=1}^n 1/k\) is the \(n\)-th harmonic number. This formulation has the advantage of having no exceptional set (unlike Robin's 5040 threshold) and is phrased in terms of elementary functions only.[^21]

***

## 6. The Bombieri Variational Analysis of the Weil Quadratic Form

Bombieri (2000) studied the quadratic form \(Q_W\) appearing in Weil's criterion directly and proved several concrete results that quantify how close to positivity the form actually is.[^6][^3]

**Positive definiteness for small support:** There exists \(t_0 > 0\) such that \(Q_W(g) \geq 0\) for all \(g \in C_c^\infty(\mathbb{R}^{\times}_+)\) supported in \([e^{-t_0}, e^{t_0}]\) with \(\widetilde{g}(0) = \widetilde{g}(1) = 0\). This is Yoshida's theorem, re-proved by Bombieri with explicit control. The support width \(t_0\) is computable (it relates to the first zero-free region of \(\zeta\)).[^6]

**Minimum of \(Q_W\) in the \(L^2\) unit ball:** For functions supported in \([-t, t]\) (in the log scale, so \([e^{-t}, e^t]\) in the multiplicative variable), the functional \(Q_W\) attains a finite minimum on the unit \(L^2\) ball. As \(t \to \infty\), this minimum decreases toward \(-\infty\) if RH is false, and stays \(\geq 0\) if RH is true.[^6]

**Finite-dimensional truncations:** Taking only finitely many prime contributions in the arithmetic side of (3) — i.e., replacing the infinite sum \(\sum_{n=1}^\infty \Lambda(n)[\cdots]\) by \(\sum_{n \leq N} \Lambda(n)[\cdots]\) — yields a finite-rank quadratic form \(Q_N\). Its eigenvalues are explicitly computable as a function of \(N\). Bombieri proved: if RH is false with exactly \(2k\) zeros off the critical line (and truncation \(N\) is large enough), then \(Q_N\) has exactly \(k\) negative eigenvalues. This gives a direct numerical program: compute eigenvalues of \(Q_N\) for increasing \(N\) and look for sign changes.[^3][^6]

**The \(\zeta\)-cycle numerics (Connes–Consani 2021):** Working on a fixed interval \([1/\lambda, \lambda]\), the smallest eigenvalues of the restricted Weil quadratic form \(Q_{W,\lambda}\) can be computed explicitly and are found numerically to be extremely small (near zero) but positive. The corresponding eigenvectors are expressed in terms of **prolate spheroidal wave functions** at scale \(\lambda\). This is a fully computable phenomenon: prolate functions are classical objects from signal processing, and the connection to the Weil form gives a new numerical approach to testing positivity.[^22]

***

## 7. The Explicit Formula as a Signal: The Spectral Density

Return to the Chebyshev density formula. Taking the distributional derivative of \(\psi(x)\) and using (2) gives[^1]

\[
\frac{d\psi}{dx} = 1 - \sum_{\gamma \in Z} \frac{\cos(\gamma \log x)}{\sqrt{x}} - \frac{1}{x(x^2-1)}, \tag{11}
\]

where \(Z = \{\gamma \in \mathbb{R} : \zeta(\tfrac{1}{2} + i\gamma) = 0\}\) is the set of imaginary parts of zeros on the critical line (assuming RH). This is a superposition of oscillations at frequencies \(\gamma\) in the log scale, damped by \(1/\sqrt{x}\). The density of primes — corrected by the "main term" \(1\) and the term \(1/x(x^2-1)\) — is a sum of cosines with frequencies equal to the imaginary parts of the zeros. This is the direct computational meaning of the zeros: they are the Fourier frequencies of the prime distribution on the log scale.[^1]

Numerically, one can truncate (11) at large \(T\): taking the sum over \(|\gamma| \leq T\) and plotting gives increasingly sharp approximations to the step function of \(\psi(x)\). This has been done for \(T\) up to millions, always recovering the prime distribution with accuracy consistent with RH[^1].

***

## 8. The Productive Equivalences: A Summary

The following formulations are all equivalent to RH. They are ordered by decreasing computability.

| Criterion | What must hold | Status of verification |
|-----------|----------------|----------------------|
| **Robin** (1984) [^19][^20] | \(\sigma(n) < e^\gamma n\log\log n\) for all \(n > 5040\) | Verified for all \(n \leq 10^{13}\) |
| **Lagarias** (2002) [^21] | \(\sigma(n) \leq H_n + e^{H_n}\log H_n\) for all \(n \geq 1\) | Verified for all \(n \leq 10^{13}\) |
| **Li** (1997) [^7] | \(\lambda_n > 0\) for all \(n \geq 1\) | Verified for \(n \leq 10^5\) rigorously |
| **Nyman–Beurling** (1950/1955) [^12][^13] | \(\chi_{(0,1]} \in \overline{\mathrm{span}}\{\rho_a : a\geq 1\}\) in \(L^2\) | Qualitative; rate unknown |
| **Báez-Duarte** (2003) [^14][^15] | \(\chi_{(0,1]} \in \overline{\mathrm{span}}\{\rho_n : n \in \mathbb{N}\}\) | Explicit approximant (9) known |
| **Weil** (1952) [^5][^6] | \(\sum_v W_v(g*\bar{g}^\sharp) \leq 0\) for all admissible \(g\) | Yoshida threshold verified; \(Q_N\) eigenvalues computed |
| **de Bruijn–Newman** (Rodgers–Tao) [^18][^16][^17] | \(\Lambda = 0\) | \(\Lambda \geq 0\) proved; \(\Lambda \leq 0\) is RH |
| **Mertens** [^1] | \(M(x) = O(x^{1/2+\varepsilon})\) for all \(\varepsilon > 0\) | No effective bound; equivalent by Mellin analysis |
| **Speiser** [^1] | \(\zeta'(s)\) has no zeros in \(0 < \mathrm{Re}(s) < 1/2\) | Equivalent; some partial results |

***

## 9. What the Explicit Formula Actually Computes

The formula (3) is not formal: given any smooth compactly supported test function \(u\), the right-hand side is an absolutely computable finite sum (the prime power terms) plus a principal-value integral (the archimedean term). The left-hand side involves the sum over zeros, which is conditionally convergent. Verifying the formula numerically — computing both sides independently and checking they agree — is itself a non-trivial consistency check on the location of zeros.[^1]

The fundamental content is this: **the zeros of \(\zeta\) and the prime numbers are not independent objects**. The explicit formula (2) or (3) is the exact, computable relation between them. RH is the assertion that the zeros sit in the one position — the critical line — that makes the prime distribution as regular as possible, with the error term \(\psi(x) - x\) bounded by \(\sqrt{x}\) times logarithmic factors rather than something larger.[^2][^1]

Every equivalence listed above is a different way of asking the same question: do the zeros sit on the critical line? The Weil quadratic form asks it as a sign condition on an integral; Li's criterion asks it as positivity of explicit Taylor coefficients; Nyman–Beurling asks it as a density condition in a Hilbert space; Robin asks it as an inequality on an arithmetic function. All are equivalent, all are computable to varying degrees, and none is known to be true unconditionally.[^23]

---

## References

1. [SpectralAnalysisAndTheRiemannHypothesis.pdf](https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_0ef7599c-c3a2-4aa5-9433-1e3a04ebb26e/6b2084d4-ec03-487a-b0e9-466ab375869b/SpectralAnalysisAndTheRiemannHypothesis.pdf?AWSAccessKeyId=ASIA2F3EMEYEVVBN3RU6&Signature=dHc90u3Wn0drB7ai8eUj8mQEbjU%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIFRp93YHWxbncYfwFlmN6Pf%2Frt1dXtpekynd6z3FQ5ZfAiBoQ4hwJ23poND6GnCjx0EXrZYHA9a7Pr0gI8QVxaEQtir8BAiY%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAEaDDY5OTc1MzMwOTcwNSIMJ54GzyLaBqxlNO4MKtAEY2%2BZJql%2FFouogNjbrdLaFhzGF8Bvcg5JMTS34PTZBx6%2BEyb3Ei113PKFTeemHrWpfBqSFWhrqRp%2FepgMzXH%2FTb%2FZTqta8GWUh5qy1aCAbiPjym0zsVsRVSr%2FVEnkDAd%2Fpk3v%2BJVZa2uQwQsHFnrgwDMkMKiZMtE6N%2F5yrgZayjlsP61jZCWGRbI7h9Ia%2FvHRFrQ%2B00qRLoOItnb1u9LoLKpuvVDFjoLbnjuIz3mSY3gvXzBbKR4GanHSPDSkq4sz5JnoEXwB%2BehOPIpmVWtQbH0oRR9B%2FZ8BxmxDmjlBBRNZ1AegzhfycW6ap1JqEODBCdEpSrRtguSZvxTKr2%2BwVrJkHrVqbWGo0XQoexVhLhgKuSRe6yKrbm%2BZj5X8c6n4wMjjd1CpphfO4cP%2B9W8h1ng5qEnnNzRyAnOokHR9bklOfvqyR3jR45RIhfa4dmB3t2%2B9r4w0jC6fte9yPPHWw0yOr%2FLg3w1XwGFs0xE%2FVtXkslT4a4wm2CAUskPUfjqqZXykTgu%2FG2qFo7keg1sta9rtPQIu1taiYY735B8fm6QfMCBBajRM3GFU%2FdghxaYzSoyK0LFTLJjuLb2%2BsRwLCdJ1tq4%2Bt4om8ht8U%2BNfUfg6vcDJtkauCdc6T8VkA%2BTkOUJY8TYKO79z4ZbQdS7bwRm0bhaBveogrBWly28BU1Rm4eo0odvDOJ%2BSNTehMyP%2BEBKg2RdRVCUMckHD5O270jI0kF6sYoaEpIJDm2cAJOThmAvYe%2FO4PcxPJDtmAMEO12xWiJ8tPIPWRMXxp2qcLjCY6sLOBjqZAZO93WpWfHHGORikpN8wcu6g4cY8zPq3zNWijQ%2FIlBmvSmdX92E%2Fvlermt9cDFYlfTp19CJ9wp4vxOjsyFECrgMZKaq3s3OkHVgtUfkmFaqeMPJYj1qiqVAm5jdEvRiQg%2FyyV6KvbAXnNU3%2BwjfXg9CaRTYWoqofhZXa9NnuNYxdEOksJWatfma2xjiq6txVUQLFDvr%2F%2F5LIdA%3D%3D&Expires=1775289067) - 1384 2004 146–157
SPECTRAL ANALYSIS AND THE RIEMANN HYPOTHESIS
GILLES LACHAUD
ABSTRACT. The explicit...

2. [Von Mangoldt function - Wikipedia](https://en.wikipedia.org/wiki/Von_Mangoldt_function) - In mathematics, the von Mangoldt function is an arithmetic function named after German mathematician...

3. [[PDF] Remarks on Weil's quadratic functional in the theory of prime ...](http://www.bdim.eu/item?fmt=pdf&id=RLIN_2000_9_11_3_183_0)

4. [Weil positivity and Trace formula](https://alainconnes.org/wp-content/uploads/Selecta.pdf)

5. [Weil's criterion - Wikipedia](https://en.wikipedia.org/wiki/Weil's_criterion)

6. [Remarks on Weil's quadratic functional in the theory of ...](https://eudml.org/doc/252338)

7. [Li's criterion - Wikipedia](https://en.wikipedia.org/wiki/Li's_criterion)

8. [Complements to Li's criterion for the Riemann hypothesis | Nokia.com](https://www.nokia.com/bell-labs/publications-and-media/publications/complements-to-lis-criterion-for-the-riemann-hypothesis/) - In a recent paper Xian-Jin Li showed that the Riemann Hypothesis holds if and only if lambda(n) = Si...

9. [Testing Li's criterion](https://fredrikj.net/blog/2013/03/testing-lis-criterion/)

10. [0506326.dvi](https://www.ipht.fr/Docspht/articles/t05/108/public/publi.pdf)

11. [[PDF] Sharpenings of Li's criterion for the Riemann Hypothesis - arXiv](https://arxiv.org/pdf/math/0506326.pdf)

12. [Functiones et Approximatio](https://projecteuclid.org/journals/functiones-et-approximatio-commentarii-mathematici/volume-37/issue-1/On-the-Nyman-Beurling-criterion-for-the-Riemann-hypothesis/10.7169/facm/1229618750.pdf)

13. [[PDF] The Nyman{Beurling Equivalent Form for the Riemann Hypothesis](https://www.esi.ac.at/preprints/esi623.pdf) - In fact,. Beurling [6] noticed that (RH) already holds true if the constant function 1 lies in this ...

14. [A strengthening of the Nyman-Beurling criterion for the Riemann ...](https://eudml.org/doc/252348) - According to the well-known Nyman-Beurling criterion the Riemann hypothesis is equivalent to the pos...

15. [A strengthening of the Nyman-Beurling criterion for the Riemann hypothesis, 2](https://ui.adsabs.harvard.edu/abs/2002math......5003B/abstract) - Let $\rho(x)=x-[x]$, $\chi=\chi_{(0,1)}$. In $L_2(0,\infty)$ consider the subspace $\B$ generated by...

16. [The De Bruijn-Newman constant is non-negative](https://arxiv.org/abs/1801.05914) - For each $t \in {\bf R}$, define the entire function $$ H_t(x) := \int_0^\infty e^{tu^2} Φ(u) \cos(x...

17. [[PDF] THE DE BRUIJN–NEWMAN CONSTANT IS NON-NEGATIVE](https://par.nsf.gov/servlets/purl/10186590)

18. [de Bruijn–Newman constant - Wikipedia](https://en.wikipedia.org/wiki/De_Bruijn%E2%80%93Newman_constant)

19. [Robin's Inequality & the Riemann Hypothesis - Emergent Mind](https://www.emergentmind.com/topics/robin-s-inequality) - Robin's inequality links the sum-of-divisors function to the Riemann Hypothesis with an explicit ari...

20. [On Robin's criterion for the Riemann hypothesis - EuDML](https://eudml.org/doc/249981) - Robin's criterion states that the Riemann Hypothesis (RH) is true if and only if Robin's inequality ...

21. [[PDF] Robin inequality,Lagarias criterion, and Riemann hypothesis - arXiv](https://arxiv.org/pdf/1605.08273.pdf) - Robin's criterion [11]: States that RH is true if and only if the inequality σ(n) < eγnlog log n, fo...

22. [[PDF] arXiv:2106.01715v1 [math.NT] 3 Jun 2021 - Alain Connes](https://alainconnes.org/wp-content/uploads/zeta-cycles-3.pdf) - Abstract We exhibit very small eigenvalues of the quadratic form associated to the Weil explicit for...

23. [Riemann hypothesis - Wikipedia](https://en.wikipedia.org/wiki/Riemann_hypothesis) - The Riemann hypothesis is the conjecture that the Riemann zeta function has its zeros only at the ne...

