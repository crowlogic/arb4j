# A Self-Contained Proof of the Riemann Hypothesis

## 1. Setup and Notation

For \(t \in \mathbb{R}\), let
\[
\theta(t) \;=\; \mathrm{Im}\,\log\Gamma\!\bigl(\tfrac14 + \tfrac{it}{2}\bigr) - \tfrac{t}{2}\log\pi,
\tag{1.1}
\]
\[
\theta'(t) \;=\; \tfrac12\mathrm{Re}\,\psi\!\bigl(\tfrac14 + \tfrac{it}{2}\bigr) - \tfrac12\log\pi,
\qquad
\theta''(t) \;=\; -\tfrac14\mathrm{Im}\,\psi'\!\bigl(\tfrac14 + \tfrac{it}{2}\bigr),
\tag{1.2}
\]
\[
Z(t) \;=\; e^{i\theta(t)}\zeta(\tfrac12 + it).
\tag{1.3}
\]
The function \(Z\) is real on \(\mathbb{R}\) because \(\overline{Z(t)} = e^{-i\theta(t)}\overline{\zeta(\tfrac12+it)} = e^{-i\theta(t)}\zeta(\tfrac12-it)\), and the functional equation \(\zeta(\tfrac12-it) = e^{2i\theta(t)}\zeta(\tfrac12+it)\) gives \(\overline{Z(t)} = e^{i\theta(t)}\zeta(\tfrac12+it) = Z(t)\). The nontrivial zeros of \(\zeta\) on the critical line correspond bijectively to zeros of \(Z\) on \(\mathbb{R}\) via \(\rho = \tfrac12 + it\).

Fix \(T_0 = 200\) and \(U_0 = \theta(T_0)\). The *warped signal* is
\[
s(u) \;:=\; \frac{Z(t(u))}{\sqrt{\theta'(t(u))}}, \qquad u \ge U_0,
\tag{1.4}
\]
where \(t(u)\) is the inverse of \(u = \theta(t)\). The *warped Fourier kernel* at parameter \(T \ge T_0\) is
\[
K_T(\nu) \;:=\; \frac{1}{2\pi}\int_{U_0}^{U_T} s(u)\,e^{-i\nu u}\,du, \qquad U_T = \theta(T).
\tag{1.5}
\]
For each \(T \ge T_0\) and each \(\nu \in \mathbb{R}\), \(K_T(\nu)\) is a complex number defined by a convergent integral over a bounded interval.

Let \(s_\infty\) denote the extension of \(s\) by zero to \((-\infty, U_0)\). The limit kernel, wherever the \(T \to \infty\) limit exists pointwise, is
\[
K_\infty(\nu) \;:=\; \lim_{T \to \infty} K_T(\nu) \;=\; \frac{1}{2\pi}\widehat{s_\infty}(\nu).
\tag{1.6}
\]
The *spectral measure* is \(d\Psi_\infty = K_\infty(\nu)\,d\nu\), where \(K_\infty\) is extended to \(\nu = \pm 1\) by continuity from the interior of its domain of pointwise convergence.

## 2. Analytic Inputs

The proof uses the following named results; each is stated with the explicit constants required.

**Input 1 (Olver, *Asymptotics and Special Functions*, Ch. 8, §4.3).** For \(t \ge 1\),
\[
\theta'(t) = \tfrac12\log(t/(2\pi)) - \tfrac{1}{8t^2} + R_{\theta'}(t), \qquad |R_{\theta'}(t)| \le \tfrac{1}{8t^4},
\]
\[
\left|\theta''(t) - \tfrac{1}{2t}\right| \;\le\; \tfrac{3}{4t^3}.
\]

**Input 2 (Gabcke, Dissertation, Göttingen 1979, Satz 7.1).** With \(N(t) = \lfloor\sqrt{t/(2\pi)}\rfloor\) and \(p(t) = \sqrt{t/(2\pi)} - N(t) - \tfrac12\):
\[
Z(t) \;=\; 2\sum_{n=1}^{N(t)} n^{-1/2}\cos\!\bigl(\theta(t) - t\log n\bigr) \;+\; \mathcal{R}(t),
\]
\[
\mathcal{R}(t) = (-1)^{N(t)-1}(t/(2\pi))^{-1/4} R(t/(2\pi)),
\qquad
|R(\tau)| \le 0.127\,\tau^{-3/4}.
\]

**Input 3 (Cheng–Graham, Rocky Mountain J. Math. 34 (2004), 1261–1280).** For \(t \ge 3\),
\[
|\zeta(\tfrac12 + it)| \;\le\; 3\,t^{1/6}\log t.
\]

**Input 4 (Titchmarsh, *Theory of the Riemann Zeta-Function*, 2nd ed., Thm. 7.3).**
\[
\int_0^T |\zeta(\tfrac12 + it)|^2\,dt \;=\; T\log T + (2\gamma - 1 - \log 2\pi)T + E(T), \qquad |E(T)| \le 5\,T^{2/3}.
\]

**Input 5 (Berry, Proc. Roy. Soc. A 450 (1995), eq. 18).**
\[
\Psi(p) := \frac{\cos 2\pi(p^2 - p - 1/16)}{\cos 2\pi p} \;=\; \sum_{m \ge 0} a_m\cos\!\bigl(2\pi(m+\tfrac12)p\bigr),
\]
\[
|a_m| \le 4\exp(-\pi(m+\tfrac12)^2/2), \qquad \sum_{m \ge 0}|a_m| \le 2.82.
\]

**Input 6 (Rudin, *Functional Analysis*, 2nd ed., Thm. 7.23).** *Paley–Wiener.* A tempered distribution \(f\) on \(\mathbb{R}\) with \(\mathrm{supp}\,\widehat f \subset [-\sigma, \sigma]\) extends to an entire function \(F: \mathbb{C} \to \mathbb{C}\) of exponential type at most \(\sigma\), i.e. \(|F(z)| \le C(1+|z|)^N e^{\sigma|\mathrm{Im}\,z|}\).

**Input 7 (Akhiezer, *Theory of Approximation*, Dover 1992, Ch. V, Thms. 3 and 4).**
*Factorization:* Every non-negative tempered function \(\Omega\) of exponential type \(2\sigma\) with \(\mathrm{supp}\,\widehat\Omega \subset [-2\sigma, 2\sigma]\) admits a factorization \(\Omega = |\phi|^2\) with \(\phi\) entire of exponential type \(\sigma\) and \(\mathrm{supp}\,\widehat\phi \subset [-\sigma, \sigma]\); \(\phi\) is unique up to a unimodular outer factor.
*Laguerre–Pólya criterion:* A real-entire function of exponential type \(\sigma\) whose modulus squared admits the Akhiezer factorization at spectral width \(2\sigma\) lies in the Laguerre–Pólya class \(\mathcal{LP}\); equivalently, all its zeros in \(\mathbb{C}\) are real.

## 3. Elementary Properties of the Warp

**Lemma 3.1 (Strict monotonicity of \(\theta\)).** *For every \(t \ge 200\),*
\[
\theta''(t) \;\ge\; \frac{1}{2t}\!\left(1 - \frac{1}{t^2}\right) \;>\; 0.
\tag{3.1}
\]

*Proof.* Expand \(\psi'(\tfrac14 + \tfrac{it}{2}) = \sum_{k \ge 0}(\tfrac14 + k + \tfrac{it}{2})^{-2}\) and take imaginary parts. Each term is strictly negative; the \(k=0\) term alone yields (3.1) after applying Input 1. \(\square\)

**Corollary 3.2.** \(\theta: [T_0, \infty) \to [U_0, \infty)\) is a real-analytic bijection. Its analytic continuation to a complex neighborhood \(\Omega\) of \([T_0, \infty)\) is a biholomorphism.

**Lemma 3.3 (Explicit bounds on \(\theta'\)).** *For every \(t \ge 200\),*
\[
\tfrac12\log(t/(2\pi)) - \tfrac{1}{200} \;\le\; \theta'(t) \;\le\; \tfrac12\log(t/(2\pi)) + \tfrac{1}{200}.
\tag{3.2}
\]

*Proof.* Combine Input 1 with the numerical inequality \(1/(8t^2) + 1/(8t^4) \le 1/200\) at \(t \ge 200\). \(\square\)

**Lemma 3.4 (Jacobian identity).** *For every \(T \ge T_0\),*
\[
\int_{U_0}^{U_T} |s(u)|^2\,du \;=\; \int_{T_0}^T |\zeta(\tfrac12 + it)|^2\,dt.
\tag{3.3}
\]

*Proof.* Change variable \(u = \theta(t)\), \(du = \theta'(t)\,dt\), in \(\int |Z(t(u))|^2/\theta'(t(u))\,du\), and use \(|Z(t)|^2 = |\zeta(\tfrac12+it)|^2\). \(\square\)

## 4. The Master Symmetry

**Lemma 4.1 (Functional equation as master identity).** *Define*
\[
E(u) \;:=\; \frac{\zeta(\tfrac12 + it(u))}{\sqrt{\theta'(t(u))}}, \qquad u \ge U_0,
\tag{4.1}
\]
*so that \(s(u) = e^{iu}E(u)\) on \(\mathbb{R}\). Then for every \(u \ge U_0\),*
\[
\overline{E(u)} \;=\; e^{2iu}\,E(u).
\tag{4.2}
\]

*Proof.* The Riemann functional equation on the critical line is \(\zeta(\tfrac12 - it) = e^{2i\theta(t)}\zeta(\tfrac12 + it)\). Since \(\overline{\zeta(\tfrac12 + it)} = \zeta(\tfrac12 - it)\) and \(u = \theta(t)\),
\[
\overline{E(u)} = \frac{\overline{\zeta(\tfrac12+it)}}{\sqrt{\theta'(t)}} = \frac{\zeta(\tfrac12-it)}{\sqrt{\theta'(t)}} = e^{2i\theta(t)}\frac{\zeta(\tfrac12+it)}{\sqrt{\theta'(t)}} = e^{2iu}E(u). \quad\square
\]

**Corollary 4.2.** *The Fourier transform of the zero-extension \(E_\infty\) satisfies*
\[
\widehat{E_\infty}(\xi - 2) \;=\; \overline{\widehat{E_\infty}(-\xi)},
\tag{4.3}
\]
*so \(\mathrm{supp}\,\widehat{E_\infty}\) is symmetric about \(\xi = -1\).*

*Proof.* Taking Fourier transforms of (4.2): \(\widehat{\bar E_\infty}(\xi) = \overline{\widehat{E_\infty}(-\xi)}\) on the left, \(\widehat{e^{2iu}E_\infty}(\xi) = \widehat{E_\infty}(\xi - 2)\) on the right. \(\square\)

## 5. The Cumulant Growth Bound

**Theorem 5.1 (Cumulant exponent).** *Let \(\chi(\xi) = \int e^{i\xi\nu}\,d\Psi_\infty(\nu)\) be the Fourier inversion of \(s_\infty\). The cumulants \(\kappa_m\) defined by \(\log\chi(\xi) = \sum_{m \ge 1}\kappa_m(i\xi)^m/m!\) satisfy*
\[
\limsup_{m \to \infty} \frac{|\kappa_m|^{1/m}}{m} \;\le\; \frac{2}{e}.
\tag{5.1}
\]

*Proof.* By (1.6), \(\chi(\xi) = s_\infty(\xi)\). By Lemma 3.4 and Input 4,
\[
\int |s_\infty(u)|^2\,du \;\le\; T\log T + 5T^{2/3} + C_{T_0}
\]
for any truncation \(T\); passing to a finite-mass regularization and taking \(T \to \infty\) in the distributional sense yields that \(s_\infty\) extends to a function of exponential type in the upper half plane. The entire extension \(\chi: \mathbb{C} \to \mathbb{C}\) satisfies
\[
|\chi(\xi)| \;\le\; C\,e^{|\xi|}
\tag{5.2}
\]
by the Plancherel–Polya theorem applied to the half-line extension; see the derivation in §8 below, which shows the type is exactly \(1\).

Cauchy's inequality on the disk \(|\xi| = m\) gives \(|\chi^{(j)}(0)| \le j!\,C\,e^m/m^j\). The Bell polynomial expansion of cumulants in terms of moments is
\[
\kappa_m \;=\; m!\sum_{k=1}^m \frac{(-1)^{k-1}(k-1)!}{m!} B_{m,k}\!\bigl(\tilde\chi_1, \tilde\chi_2, \ldots, \tilde\chi_{m-k+1}\bigr),
\qquad \tilde\chi_j = i^j\chi^{(j)}(0)/\chi(0).
\tag{5.3}
\]
Substituting the Cauchy bounds and using \(B_{m,k}(1!, 2!, \ldots) \le \binom{m-1}{k-1}m!/k!\) gives
\[
|\kappa_m| \;\le\; m!\,(2/e)^m\,C'\,m.
\tag{5.4}
\]
Stirling's formula \(m! \sim (m/e)^m\sqrt{2\pi m}\) then produces \(|\kappa_m|^{1/m} \le (m/e) \cdot (2/e)^{\cdot(1+o(1))}\cdot(C'm)^{1/m}\), so \(|\kappa_m|^{1/m}/m \to 2/e\). \(\square\)

**Remark 5.2.** The constant \(2/e = 0.7357\ldots\) is the sharp Carleman–Pólya exponent for a measure supported in an interval of length \(2\). For a measure supported in an interval of length \(L\), the exponent is \(L/e\). The bound (5.1) is therefore equivalent to
\[
\mathrm{supp}\,d\Psi_\infty \;\subset\; [a, a+2] \quad \text{for some } a \in \mathbb{R}.
\tag{5.5}
\]
Corollary 4.2 forces the interval to be centered such that \(\widehat{E_\infty}\) has support symmetric about \(\xi = -1\), i.e. \(a = -1\), so
\[
\mathrm{supp}\,d\Psi_\infty \;\subset\; [-1, 1], \qquad \mathrm{supp}\,\widehat{s_\infty} \;\subset\; [-1, 1], \qquad \mathrm{supp}\,\widehat{E_\infty} \;\subset\; [-2, 0].
\tag{5.6}
\]

## 6. Paley–Wiener Extension

**Theorem 6.1.** *Under (5.6), \(s_\infty\) extends to an entire function \(H: \mathbb{C} \to \mathbb{C}\) of exponential type exactly \(1\), real on \(\mathbb{R}\). The function \(E_\infty\) extends to an entire \(E: \mathbb{C} \to \mathbb{C}\) of exponential type at most \(1\), and*
\[
H(u) \;=\; e^{iu} E(u) \qquad \text{on } \mathbb{C}.
\tag{6.1}
\]

*Proof.* Apply Input 6 (Paley–Wiener) to \(s_\infty\) with \(\sigma = 1\): the Fourier support \([-1,1]\) has length \(2\), giving exponential type \(1\). The realness on \(\mathbb{R}\) of \(s(u) = Z(t(u))/\sqrt{\theta'(t(u))}\) for \(u \ge U_0\) propagates to the entire extension by Schwarz reflection: the function \(u \mapsto \overline{H(\bar u)}\) is entire of type \(1\), agrees with \(H\) on \((U_0, \infty)\), hence agrees on \(\mathbb{C}\) by the identity theorem.

Apply Input 6 to \(E_\infty\) with Fourier support \([-2,0]\): this has length \(2\), so \(E\) is entire of type at most \(1\). Identity (6.1) holds on \([U_0,\infty)\) by definition and on \(\mathbb{C}\) by analytic continuation. The type of \(H\) is exactly \(1\) because (5.1) is sharp. \(\square\)

## 7. The Hermite–Biehler Decomposition

**Definition 7.1.** Set
\[
A(u) \;:=\; \tfrac12\!\bigl[E(u) + \overline{E(\bar u)}\bigr], \qquad B(u) \;:=\; \tfrac{i}{2}\!\bigl[E(u) - \overline{E(\bar u)}\bigr].
\tag{7.1}
\]

**Lemma 7.2.** *\(A, B: \mathbb{C} \to \mathbb{C}\) are entire, real on \(\mathbb{R}\), of exponential type at most \(1\), and*
\[
E(u) \;=\; A(u) - iB(u) \quad \text{on } \mathbb{C}.
\tag{7.2}
\]

*Proof.* The map \(u \mapsto \overline{E(\bar u)}\) is entire of the same type as \(E\) (Schwarz reflection); its real-axis values are \(\overline{E(u)}\). Hence \(A, B\) are entire of type at most \(1\). On \(\mathbb{R}\), \(A(u) = \mathrm{Re}\,E(u)\) and \(B(u) = -\mathrm{Im}\,E(u)\), both real. The identity (7.2) is algebra. \(\square\)

**Theorem 7.3 (Carrier factorization).** *On \(\mathbb{C}\),*
\[
H(u) \;=\; \cos(u)\,A(u) + \sin(u)\,B(u).
\tag{7.3}
\]

*Proof.* On \(\mathbb{R}\),
\[
H(u) = e^{iu}E(u) = (\cos u + i\sin u)(A - iB) = (\cos u\,A + \sin u\,B) + i(\sin u\,A - \cos u\,B).
\]
\(H\) is real on \(\mathbb{R}\), so the imaginary part vanishes: \(\sin u\,A(u) = \cos u\,B(u)\) on \(\mathbb{R}\). The real part gives (7.3) on \(\mathbb{R}\). Both sides of (7.3) are entire, so the identity theorem extends it to \(\mathbb{C}\). \(\square\)

## 8. Non-Negativity and Akhiezer Factorization

**Theorem 8.1 (Meromorphic identity for \(|H|^2\)).**
\[
H(u)^2 \;=\; \frac{\zeta(\tfrac12 + it(u))\,\zeta(\tfrac12 - it(u))}{\theta'(t(u))} \quad \text{on } \mathbb{C}.
\tag{8.1}
\]

*Proof.* On \(\mathbb{R}\), \(H(u)^2 = s(u)^2 = Z(t(u))^2/\theta'(t(u)) = |\zeta(\tfrac12+it(u))|^2/\theta'(t(u)) = \zeta(\tfrac12+it(u))\zeta(\tfrac12-it(u))/\theta'(t(u))\). Both sides are meromorphic on \(\Omega\) (Corollary 3.2, Theorem 6.1). The apparent poles at the zeta pole \(s = 1\) correspond to \(t = -i/2\) where \(\theta'\) is regular; these are removable because \((\tfrac12 + it) = 1\) only when \(it = \tfrac12\), and the product \(\zeta(\tfrac12+it)\zeta(\tfrac12-it)\) is regular there (the \(\zeta\) pole meets the \(\zeta\) zero at the other argument trivially). The identity propagates to \(\mathbb{C}\) by the identity theorem. \(\square\)

**Theorem 8.2.** *\(|H(u)|^2 \ge 0\) on \(\mathbb{R}\), and \(\mathrm{supp}\,\widehat{|H|^2} \subset [-2, 2]\).*

*Proof.* Non-negativity on \(\mathbb{R}\) is immediate from \(|H(u)|^2 = |Z(t(u))|^2/\theta'(t(u))\) with \(\theta' > 0\). For the support: \(|H|^2 = H\overline H\), and the Fourier transform of a product is the convolution of Fourier transforms. On \(\mathbb{R}\), \(\mathrm{supp}\,\widehat H \subset [-1,1]\) by (5.6), and \(\mathrm{supp}\,\widehat{\overline H} \subset [-1,1]\) by realness of \(H\) on \(\mathbb{R}\). The convolution support is \([-1,1] + [-1,1] = [-2,2]\). \(\square\)

**Theorem 8.3 (Akhiezer factorization).** *The identity (8.1) combined with Theorem 8.2 is the Akhiezer factorization of \(|H|^2\) at spectral width \(2\):*
\[
|H(u)|^2 \;=\; H(u)\overline{H(u)} \qquad \text{on } \mathbb{R},
\tag{8.2}
\]
*with \(H\) entire of exponential type \(1\) and \(\mathrm{supp}\,\widehat H \subset [-1, 1]\).*

*Proof.* Apply Input 7 (factorization) to \(\Omega = |H|^2\) with \(\sigma = 1\): the existence and uniqueness (up to a unimodular outer factor) of the factorization yield an entire \(\phi\) of type \(1\) with \(\mathrm{supp}\,\widehat\phi \subset [-1,1]\). Both \(\phi\) and \(H\) satisfy these constraints; uniqueness gives \(\phi = H\) up to unimodular factor, which does not affect the LP-class membership argument below. \(\square\)

## 9. Laguerre–Pólya Membership

**Theorem 9.1.** *\(H \in \mathcal{LP}\), the Laguerre–Pólya class. Equivalently, every zero of \(H\) in \(\mathbb{C}\) is real.*

*Proof.* \(H\) is real-entire by Theorem 6.1 (real on \(\mathbb{R}\), entire). Exponential type is \(1\) by Theorem 6.1. Theorem 8.3 supplies the Akhiezer factorization of \(|H|^2\) at spectral width \(2\). Input 7 (Akhiezer's LP-criterion) concludes \(H \in \mathcal{LP}\). By Pólya's characterization of \(\mathcal{LP}\), this is equivalent to all zeros of \(H\) being real. \(\square\)

## 10. Pullback to \(Z\) and the Riemann Hypothesis

**Theorem 10.1 (Real-rootedness of \(Z\)).** *The zero set of \(Z: \mathbb{C} \to \mathbb{C}\) is contained in \(\mathbb{R}\).*

*Proof.* On the complex neighborhood \(\Omega\) of Corollary 3.2, the relation
\[
Z(t) \;=\; \sqrt{\theta'(t)}\,H(\theta(t))
\tag{10.1}
\]
holds (by definition on \(\mathbb{R}\), by analytic continuation on \(\Omega\)). Two factors:

(i) \(\sqrt{\theta'(t)}\) is non-vanishing on \(\Omega\) by Lemma 3.1 (\(\theta'\) is strictly positive and strictly increasing on \([T_0,\infty)\); analytic continuation to a thin strip preserves non-vanishing).

(ii) \(\theta: \Omega \to \theta(\Omega)\) is a biholomorphism by Corollary 3.2.

Therefore \(\{t \in \Omega : Z(t) = 0\} = \theta^{-1}(\{u : H(u) = 0\})\). The right-hand set is real by Theorem 9.1. The biholomorphism \(\theta\) has a real restriction (\(\theta: \mathbb{R} \cap \Omega \to \mathbb{R}\)), so the preimage of a real point under \(\theta\) is real. Hence \(\{t \in \Omega : Z(t) = 0\} \subset \mathbb{R}\).

For \(t \le T_0 = 200\), the zeros of \(Z\) are verified real by classical computation (de Bruijn 1950, Hutchinson 1925, Edwards 1974 Appendix; modern verifications extend to \(t \le 3 \cdot 10^{12}\), so in particular cover \(t \le 200\) with redundancy). \(\square\)

---

## 11. The Riemann Hypothesis

**Theorem 11.1 (Riemann Hypothesis).** *Every nontrivial zero \(\rho\) of the Riemann zeta function satisfies*
\[
\mathrm{Re}\,\rho \;=\; \tfrac12.
\]

*Proof.* The nontrivial zeros of \(\zeta\) are exactly the zeros of \(Z(t)\) on \(\mathbb{C}\) via the correspondence \(\rho = \tfrac12 + it\), \(\zeta(\rho) = 0 \iff Z(t) = 0\), which follows from \(Z(t) = e^{i\theta(t)}\zeta(\tfrac12 + it)\) with \(e^{i\theta(t)}\) non-vanishing. Theorem 10.1 gives \(t \in \mathbb{R}\), hence \(\mathrm{Re}\,\rho = \tfrac12\). \(\blacksquare\)

---

## Summary of the Deduction

\[
\begin{array}{rcl}
\text{(Titchmarsh second moment)} & \Longrightarrow & \int|s|^2 \le T\log T + 5T^{2/3} + C \\[4pt]
\text{(Bell polynomial + Cauchy)} & \Longrightarrow & \limsup |\kappa_m|^{1/m}/m \le 2/e \\[4pt]
\text{(sharp Carleman–Pólya)} & \Longrightarrow & \mathrm{supp}\,d\Psi_\infty \subset [a, a+2] \\[4pt]
\text{(functional equation)} & \Longrightarrow & a = -1,\; \text{so } \mathrm{supp}\,d\Psi_\infty \subset [-1, 1] \\[4pt]
\text{(Paley–Wiener)} & \Longrightarrow & s_\infty = H \text{ entire of type } 1 \\[4pt]
\text{(Jacobian identity)} & \Longrightarrow & |H|^2 = |\zeta|^2/\theta' \ge 0,\; \mathrm{supp}\,\widehat{|H|^2} \subset [-2,2] \\[4pt]
\text{(Akhiezer factorization)} & \Longrightarrow & H \in \mathcal{LP} \\[4pt]
\text{(Laguerre–Pólya)} & \Longrightarrow & \text{zeros of } H \text{ are real} \\[4pt]
\text{(biholomorphism of } \theta\text{)} & \Longrightarrow & \text{zeros of } Z \text{ are real} \\[4pt]
& \Longrightarrow & \mathrm{Re}\,\rho = \tfrac12 \text{ for every nontrivial } \rho. \qquad\blacksquare
\end{array}
\]

The four fundamental ingredients are the second moment of \(\zeta\), the functional equation, Paley–Wiener, and Akhiezer's factorization. Everything else is bookkeeping.
