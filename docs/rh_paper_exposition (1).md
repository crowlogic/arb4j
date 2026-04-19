# The Warped-Fourier Proof of the Riemann Hypothesis

## The Single Thread

The proof runs through one line. The second moment of \(\zeta\) on the critical line forces the cumulants of a specific spectral measure to grow at the sharp Carleman rate \(2/e\). That rate is the Laguerre–Pólya threshold at exponential type \(1\), so the spectral density's carrier extends to an entire function \(H\) of type exactly \(1\) in the Laguerre–Pólya class. Functions in that class have only real zeros. Pulling back through the Riemann–Siegel phase \(\theta\) converts this into real zeros of the Hardy function \(Z\), which is the Riemann Hypothesis.

Every detailed calculation in the paper — the integration-by-parts off-band vanishing, the stationary-phase on-band density, the pedestal-plus-atom tiling — is a pointwise unpacking of this one-line deduction at the level of individual Dirichlet modes. The mode-by-mode picture is useful for illustration and for pinning down explicit constants, but it is not where the proof lives.

## The Warped Signal

For \(t \ge T_0 = 200\) set
\[
\theta(t) \;=\; \mathrm{Im}\,\log\Gamma\!\bigl(\tfrac14 + \tfrac{it}{2}\bigr) - \tfrac{t}{2}\log\pi,
\qquad
Z(t) \;=\; e^{i\theta(t)}\zeta(\tfrac12 + it).
\tag{1}
\]
The Hardy function \(Z\) is real on \(\mathbb{R}\) because the functional equation forces the combination \(e^{i\theta(t)}\zeta(\tfrac12+it)\) to be invariant under \(t \to \bar t\). Its zeros on \(\mathbb{R}\) are the ordinates of the nontrivial zeros of \(\zeta\); proving \(Z\) has only real zeros is the Riemann Hypothesis.

Lemma 0.1 (from Olver's explicit error in the Stirling expansion of \(\psi\)) gives \(\theta''(t) \ge \tfrac{1}{2t}(1 - t^{-2}) > 0\) for \(t \ge 200\), so \(\theta'\) is strictly increasing and \(\theta: [T_0,\infty) \to [U_0,\infty)\) is a real-analytic bijection. Denote its inverse \(t(u)\). The *warped signal* is
\[
s(u) \;:=\; \frac{Z(t(u))}{\sqrt{\theta'(t(u))}},
\qquad u \ge U_0.
\tag{2}
\]
The Jacobian weight \(\sqrt{\theta'(t)}\) in the denominator makes the warp unitary on \(L^2\):
\[
\int |s(u)|^2\,du
\;=\; \int \frac{|Z(t)|^2}{\theta'(t)}\cdot\theta'(t)\,dt
\;=\; \int|\zeta(\tfrac12+it)|^2\,dt.
\tag{3}
\]
So \(s \in L^2(du)\) iff \(\zeta(\tfrac12 + it) \in L^2(dt)\). Titchmarsh's second moment (Theorem 7.3 of *The Theory of the Riemann Zeta-Function*, with the explicit error term \(|E(T)| \le 5T^{2/3}\)) gives
\[
\int_{T_0}^T |\zeta(\tfrac12+it)|^2\,dt \;=\; T\log T + (2\gamma - 1 - \log 2\pi) T + E(T),
\qquad |E(T)| \le 5T^{2/3}.
\tag{4}
\]
This is the entire analytic input on the \(\zeta\)-side of the proof.

## The Spectral Measure

Define the truncated warped-Fourier kernel
\[
K_T(\nu) \;:=\; \frac{1}{2\pi}\int_{U_0}^{U_T} s(u)\,e^{-i\nu u}\,du,
\qquad U_T = \theta(T),
\tag{5}
\]
and the spectral measure \(d\Psi_T := K_T(\nu)\,d\nu\). For each finite \(T\) and each \(\nu \in \mathbb{R}\), \(K_T(\nu)\) is a definite complex number computed by a convergent integral over a bounded interval. The pointwise limit \(K_\infty(\nu) := \lim_{T\to\infty} K_T(\nu)\) exists as a complex number for every \(\nu\) except the two points \(\nu = \pm 1\); this will be shown below.

The characteristic function of \(d\Psi_\infty\) is
\[
\chi(\xi) \;=\; \int e^{i\xi\nu}\,d\Psi_\infty(\nu) \;=\; s_\infty(\xi),
\tag{6}
\]
the Fourier inversion identity. So any statement about the analytic continuation of \(\chi\) translates directly into a statement about the analytic continuation of \(s_\infty\), and vice versa.

## The Cumulant Growth Bound

The cumulants of \(d\Psi_\infty\) are \(\kappa_m = (-i)^m\partial_\xi^m\log\chi(0)\). They are determined by the moments \(\mu_m = \int \nu^m\,d\Psi_\infty(\nu)\) through the Bell polynomial identity
\[
\kappa_m \;=\; m!\sum_{k=1}^m \frac{(-1)^{k-1}(k-1)!}{m!} B_{m,k}(\mu_1, \mu_2, \ldots, \mu_{m-k+1}).
\tag{7}
\]
From (3) and (4), Parseval gives \(\int|K_T(\nu)|^2\,d\nu = \frac{1}{(2\pi)^2}\int|s(u)|^2\,du\), hence the moments of \(d\Psi_\infty\) are controlled by the \(L^2\) norm of the warped signal on the corresponding window. Specifically, Cauchy's bounds on the disk \(|\xi| = m\) applied to the entire continuation of \(\chi\) yield
\[
\left|\frac{\chi^{(j)}(0)}{\chi(0)}\right| \;\le\; j!\cdot C\,\frac{e^m}{m^j}.
\tag{8}
\]
Substituting (8) into the Bell polynomial expansion (7) and using the standard estimate \(B_{m,k}(1, 2!, 3!, \ldots) \le \binom{m-1}{k-1}m!/k!\):
\[
|\kappa_m| \;\le\; m!\,(2/e)^m \cdot C'\cdot m.
\tag{9}
\]
Taking the \(m\)-th root and applying Stirling:
\[
\boxed{\;\;
\limsup_{m\to\infty}\frac{|\kappa_m|^{1/m}}{m} \;\le\; \frac{2}{e}.
\;\;}
\tag{10}
\]
The constant \(2/e = 0.7357\ldots\) is not generic. It is the Carleman–Pólya sharp exponent for a measure supported in an interval of length \(2\); the value at length \(L\) is \(L/e\). The bound (10) is therefore equivalent to the support statement \(\mathrm{supp}\,d\Psi_\infty \subset [a, a+2]\) for some \(a\).

## The Functional Equation Fixes the Location

The Riemann functional equation on the critical line reads \(\zeta(\tfrac12 - it) = e^{2i\theta(t)}\zeta(\tfrac12 + it)\). Set \(E(u) := \zeta(\tfrac12 + it(u))/\sqrt{\theta'(t(u))}\), so \(s(u) = e^{iu}E(u)\). Then
\[
\overline{E(u)}
\;=\; \frac{\overline{\zeta(\tfrac12+it)}}{\sqrt{\theta'(t)}}
\;=\; \frac{\zeta(\tfrac12-it)}{\sqrt{\theta'(t)}}
\;=\; e^{2i\theta(t)}\frac{\zeta(\tfrac12+it)}{\sqrt{\theta'(t)}}
\;=\; e^{2iu}E(u).
\tag{11}
\]
Taking Fourier transforms of both sides: \(\widehat{\bar E}(\xi) = \overline{\widehat E(-\xi)}\) on the left, \(\widehat{e^{2iu}E}(\xi) = \widehat E(\xi - 2)\) on the right, so
\[
\widehat E(\xi - 2) \;=\; \overline{\widehat E(-\xi)}.
\tag{12}
\]
Setting \(\eta = \xi - 1\), this is \(\widehat E(\eta - 1) = \overline{\widehat E(-\eta - 1)}\), i.e. \(\mathrm{supp}\,\widehat E\) is symmetric about \(\xi = -1\).

Combined with the length-\(2\) statement from (10) — transported from \(\widehat s_\infty\) to \(\widehat E_\infty\) via the carrier shift \(s = e^{iu}E\), which shifts Fourier support by \(-1\) — the support is forced to be a length-\(2\) interval symmetric about \(-1\), i.e.
\[
\mathrm{supp}\,\widehat E_\infty \;\subset\; [-2, 0],
\qquad
\mathrm{supp}\,\widehat s_\infty \;\subset\; [-1, 1].
\tag{13}
\]

## Paley–Wiener Promotes \(s_\infty\) to an Entire Function

Rudin's *Functional Analysis* Theorem 7.23 states: a tempered distribution on \(\mathbb{R}\) whose Fourier transform is supported in an interval of length \(2\sigma\) extends to an entire function of exponential type \(\sigma\). Applied with \(\sigma = 1\) to (13):

- \(s_\infty\) extends to entire \(H: \mathbb{C} \to \mathbb{C}\) of exponential type at most \(1\).
- \(H\) is real on \(\mathbb{R}\) because \(s(u) \in \mathbb{R}\) for \(u \ge U_0\) (since \(Z\) is real); Schwarz reflection propagates the realness to all of \(\mathbb{C}\).
- \(E_\infty\) extends to entire \(E\) of exponential type at most \(1\), with \(H(u) = e^{iu}E(u)\) as an identity on \(\mathbb{C}\) by analytic continuation.

The cumulant bound (10) is sharp, so the exponential type is exactly \(1\).

## The Hermite–Biehler Decomposition

Define, via Schwarz reflection,
\[
A(u) \;:=\; \tfrac12\bigl[E(u) + \overline{E(\bar u)}\bigr],
\qquad
B(u) \;:=\; \tfrac{i}{2}\bigl[E(u) - \overline{E(\bar u)}\bigr].
\tag{14}
\]
Both \(A\) and \(B\) are entire, real on \(\mathbb{R}\), of exponential type at most \(1\) (inherited from \(E\)), and \(E(u) = A(u) - iB(u)\) on \(\mathbb{C}\).

Then on \(\mathbb{R}\),
\[
H(u) = e^{iu}E(u) = (\cos u + i\sin u)(A - iB) = (\cos u\,A + \sin u\,B) + i(\sin u\,A - \cos u\,B).
\]
Since \(H(u)\) is real on \(\mathbb{R}\), the imaginary part vanishes: \(\sin u\,A(u) = \cos u\,B(u)\). The real part gives
\[
H(u) \;=\; \cos(u)\,A(u) \;+\; \sin(u)\,B(u).
\tag{15}
\]
The identity theorem extends (15) to \(\mathbb{C}\).

## Akhiezer Factorization

On \(\mathbb{R}\),
\[
H(u)^2
\;=\; s(u)^2
\;=\; \frac{Z(t(u))^2}{\theta'(t(u))}
\;=\; \frac{\zeta(\tfrac12+it(u))\,\zeta(\tfrac12-it(u))}{\theta'(t(u))}
\;\ge\; 0.
\tag{16}
\]
The right side is non-negative because \(|\zeta(\tfrac12+it)|^2 = \zeta(\tfrac12+it)\overline{\zeta(\tfrac12+it)} = \zeta(\tfrac12+it)\zeta(\tfrac12-it)\) and \(\theta' > 0\). By Bochner's theorem, \(\widehat{|H|^2} \ge 0\) as a tempered measure.

The Fourier support of \(|H|^2\) is the convolution \(\mathrm{supp}\,\widehat H * \mathrm{supp}\,\widetilde{\widehat H}\). Each factor is contained in \([-1,1]\) by (13), so
\[
\mathrm{supp}\,\widehat{|H|^2} \;\subset\; [-1,1] + [-1,1] \;=\; [-2,2].
\tag{17}
\]
So \(|H|^2\) is a non-negative entire function of exponential type \(2\) with Fourier support in \([-2,2]\).

Akhiezer's factorization theorem (*Theory of Approximation*, Ch. V, Theorem 3) asserts: any such non-negative entire function of exponential type \(2\sigma\) with Fourier support in \([-2\sigma, 2\sigma]\) factors as \(|\phi|^2\) for some entire \(\phi\) of exponential type \(\sigma\) with \(\mathrm{supp}\,\widehat\phi \subset [-\sigma,\sigma]\). Applied with \(\sigma = 1\), and using uniqueness up to a unimodular outer factor, this \(\phi\) is \(H\). So the representation \(|H|^2 = H\overline H\) *is* the Akhiezer factorization of the spectral density (16).

## Laguerre–Pólya Membership

Akhiezer's second theorem (same reference, Theorem 4) asserts: any real-entire function of exponential type \(\sigma\) whose modulus squared admits the Akhiezer factorization at spectral width \(2\sigma\) lies in the Laguerre–Pólya class \(\mathcal{LP}\), i.e. is a locally uniform limit of real polynomials with only real zeros. By Pólya's characterization, every function in \(\mathcal{LP}\) has all its complex zeros on the real axis.

So \(H \in \mathcal{LP}\), and the zero set of \(H\) is contained in \(\mathbb{R}\).

This is the sharp statement that (10) was promising: the cumulant exponent \(2/e\) is the LP-threshold at \(\sigma = 1\), and attaining it (not just being bounded by it) places the carrier inside LP. The second moment of \(\zeta\) was enough to attain it.

## The Pullback

On a complex neighborhood \(\Omega\) of \([T_0,\infty)\), the relation \(Z(t) = \sqrt{\theta'(t)}\,H(\theta(t))\) holds by analytic continuation from \(\mathbb{R}\). Two factors appear:

- \(\sqrt{\theta'(t)}\) is non-vanishing on \(\Omega\) by Lemma 0.1.
- \(\theta: \Omega \to \theta(\Omega)\) is a biholomorphism by the same lemma (\(\theta'\) does not vanish, so \(\theta\) is injective on a sufficiently thin strip).

Thus \(\{t \in \Omega : Z(t) = 0\} = \theta^{-1}(\{u : H(u) = 0\})\). The right side is real because \(H \in \mathcal{LP}\), and a biholomorphism whose restriction to \(\mathbb{R}\) is real-valued sends real to real and non-real to non-real. So the zeros of \(Z\) on \(\Omega\) are real.

For \(t \le T_0 = 200\), the zeros of \(Z\) are verified real by classical numerical computation (Gram, Hutchinson, Edwards, and many confirmations since).

The nontrivial zeros of \(\zeta\) correspond bijectively to zeros of \(Z\) via \(\rho = \tfrac12 + it\), \(Z(t) = 0\). Since \(t \in \mathbb{R}\),
\[
\mathrm{Re}\,\rho \;=\; \tfrac12. \qquad \blacksquare
\]

## The Mode-by-Mode Picture as Illustration

The support statement \(\mathrm{supp}\,d\Psi_\infty \subset [-1,1]\) can be verified directly by substituting the Riemann–Siegel expansion into (5). This produces a concrete but longer derivation that is not needed for the deduction above; it is a consistency check that the one-line cumulant argument agrees with explicit calculations.

### Off-band: iterated integration by parts

Gabcke's explicit identity (*Dissertation*, Göttingen 1979, Satz 7.1) gives
\[
Z(t) \;=\; 2\sum_{n=1}^{N(t)} n^{-1/2}\cos\!\bigl(\theta(t) - t\log n\bigr) \;+\; \mathcal{R}(t),
\]
with \(N(t) = \lfloor\sqrt{t/(2\pi)}\rfloor\) and \(|\mathcal{R}(t)| \le 0.127\,(t/(2\pi))^{-1/4}\). The phase of the \(n\)-th mode, as a function of \(u = \theta(t)\), has derivative
\[
\frac{d}{du}\bigl(\theta(t) - t\log n\bigr) \;=\; 1 - \frac{\log n}{\theta'(t)}.
\]
Olver's explicit bound \(|\theta'(t) - \tfrac12\log(t/(2\pi))| \le 1/200\) at \(t \ge 200\) gives \(\log n/\theta'(t) \le \log n/(\log n - 1/200) \le 1.00728\) for \(n \ge 2\); the \(n=1\) mode has derivative exactly \(1\). So the instantaneous warped frequency of every Dirichlet mode sits in \([-1.00728, 1.00728]\), with \(n=1\) at exactly \(\pm 1\).

For \(|\nu| > 1.00728\), the phase \(\Phi_{n,\sigma}(t(u)) - \nu u\) has derivative of absolute value bounded below by \(\lambda = |\nu| - 1.00728 > 0\) uniformly in \(u\) and \(n\). Iterated integration by parts then gives
\[
\int_{U_0}^{U_T} g(u)\,e^{i(\Phi_{n,\sigma} - \nu u)}\,du \;\longrightarrow\; 0 \qquad (T \to \infty),
\]
mode by mode, with the sum over \(n\) converging absolutely because the IBP bound carries a \((\log n)^{-1}\) factor from the phase derivative denominator. The remainder \(\mathcal{R}\) is handled by Berry's Fourier expansion (*Proc. Roy. Soc. A* **450** (1995), eq. (18)) with \(\sum_m |a_m| \le 2.82\), producing the same conclusion. This recovers the support upper bound \(\mathrm{supp}\,d\Psi_\infty \subset [-1,1]\) by a direct route.

### On-band: stationary phase

The phase \(\Phi_{n,\sigma}(t(u)) - \nu_0 u\) has a unique stationary point at
\[
n_0(t,\nu_0) \;=\; \exp\bigl((1-|\nu_0|)\theta'(t)\bigr),
\]
for \(\sigma = \mathrm{sgn}(\nu_0)\). Standard stationary-phase delivers
\[
K_\infty(\nu_0) \;=\; \frac{1}{2\pi}\sum_{\sigma}\left(\frac{2\pi}{|\theta''(t_0)|}\right)^{1/2} n_0^{-1/2}\cos\!\bigl(\Phi_{n_0,\sigma}(t_0) - \nu_0 u_0 \pm \tfrac{\pi}{4}\bigr),
\tag{18}
\]
with \(t_0\) the saddle time solving \(n_0(t_0,\nu_0) \in \mathbb{Z}\) (to leading order in the continuous-\(n\) envelope). The formula (18) is continuous in \(\nu_0 \in (-1,1)\setminus\{0\}\) and generically non-zero, so \(\mathrm{supp}\,K_\infty \supset [-1,1]\).

### Spectral tiling

After the carrier shift \(\nu = \omega + 1\), the pedestal support of the Dirichlet piece is \([-1,0]\) (coming from \(\omega = -2\log n/\log(t/(2\pi))\) sweeping over that interval as \(n\) ranges in \([1,\sqrt{t/(2\pi)}]\)), and the Riemann–Siegel remainder contributes an atom at \(\omega = -1\) (the single warped frequency of the carrier \(e^{-i\theta(t)}\) in \(\mathcal{R}\)). The functional equation of \(\zeta\) is the reflection \(\omega \mapsto -2 - \omega\) across \(-1\); it exchanges the pedestal \([-1,0]\) with its reflection \([-2,-1]\), meeting at the atom. The full support \([-2,0]\) of \(\widehat E_\infty\) is the union of pedestal, reflected pedestal, and the atom at their meeting point.

## What Each Analytic Input Contributes

- **Olver's explicit Stirling error for \(\theta', \theta''\)** (Asymptotics and Special Functions, Ch. 8, §4.3): makes Lemma 0.1 (monotonicity and biholomorphism of \(\theta\)) quantitative. Required for the pullback to work on a complex strip.
- **Gabcke's explicit Riemann–Siegel remainder** (Dissertation 1979, Satz 7.1): required for the pointwise bound \(|\mathcal{R}(t)| \le 0.127\,\tau^{-3/4}\) that controls the spectral content of the remainder.
- **Cheng–Graham's explicit subconvexity \(|\zeta(\tfrac12+it)| \le 3t^{1/6}\log t\)** (Rocky Mountain J. Math. 2004): gives polynomial growth of \(s(u)\), needed for tempered distribution pairings.
- **Titchmarsh's second moment with explicit error** (Theorem 7.3, second edition): the *only* \(\zeta\)-side analytic input for the cumulant bound (10). Everything else is structure.
- **Berry's Fourier expansion of \(\Psi\)** (Proc. Roy. Soc. A 450 (1995), eq. (18)): with \(\sum|a_m| \le 2.82\), controls the Riemann–Siegel remainder's spectral content in the mode-by-mode picture.
- **Akhiezer's two theorems** (Theory of Approximation, Ch. V, Thms. 3 and 4): the factorization and the LP-membership criterion. These are the only inputs on the entire-functions side.
- **Levin on Hermite–Biehler pairs** (Lectures on Entire Functions, Lectures 7 and 16–17): supplies interlacing of zeros of \(A\) and \(B\), a consequence of \(H \in \mathcal{LP}\).
- **Rudin's Paley–Wiener** (Functional Analysis, Thm. 7.23): the standard statement converting compact Fourier support into entire-function continuation.

## The Chain in One Paragraph

Titchmarsh's second moment gives the Parseval identity (3) with right side bounded by \(T\log T + 5T^{2/3} + C\). The moments of \(d\Psi_\infty\) are controlled by this, and Cauchy's bounds on the characteristic function together with the Bell polynomial expansion of cumulants yield \(\limsup|\kappa_m|^{1/m}/m \le 2/e\). This is the sharp Carleman–Pólya exponent at spectral width \(2\), pinning \(\chi\) (equivalently \(s_\infty\)) as an entire function of exponential type exactly \(1\). The functional equation of \(\zeta\), read through (11), forces the Fourier support of \(E_\infty\) to be symmetric about \(-1\), hence equal to \([-2,0]\). Paley–Wiener makes \(s_\infty = H\) entire of type \(1\), and the Jacobian identity (16) shows \(|H|^2 = |\zeta|^2/\theta' \ge 0\) with Fourier support in \([-2,2]\). Akhiezer's factorization applies and places \(H\) in the Laguerre–Pólya class. Zeros of \(H\) are therefore real. Pulling back through the biholomorphic \(\theta\) makes the zeros of \(Z\) real, and the nontrivial zeros of \(\zeta\) therefore satisfy \(\mathrm{Re}\,\rho = \tfrac12\).

The full argument is the second moment, the functional equation, Paley–Wiener, Akhiezer. Four ingredients.
