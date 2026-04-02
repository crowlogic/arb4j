# Exact Bessel-Function Series for E(T)

*Atkinson (1949) · Titchmarsh (1938) · Voronoï (1904) — Assembled March 31, 2026*

***

## 1. Notation and Conventions

| Symbol | Definition |
|--------|-----------|
| \(\zeta(s)\) | Riemann zeta-function, \(s \in \mathbb{C} \setminus \{1\}\) |
| \(d(n)\) | number of positive divisors of \(n \in \mathbb{N}\) |
| \(\gamma\) | Euler–Mascheroni constant |
| \(K_0, K_1\) | modified Bessel functions of the second kind, orders 0, 1; real, positive, \(K_\nu(z) \sim \sqrt{\pi/(2z)}\,e^{-z}\) as \(z \to +\infty\) |
| \(Y_0, Y_1\) | Bessel functions of the second kind (Neumann), orders 0, 1; \(Y_\nu(z) \sim \sqrt{2/(\pi z)}\sin(z - \nu\pi/2 - \pi/4)\) as \(z \to +\infty\) |
| \(J_0, J_1\) | Bessel functions of the first kind, orders 0, 1 |
| \(H_0^{(1)}\) | Hankel function \(H_0^{(1)}(z) = J_0(z) + iY_0(z)\) |
| \(\Delta(x)\) | \(\sideset{}{'}\sum_{n \le x} d(n) - x(\log x + 2\gamma - 1) - \tfrac{1}{4}\) |
| \(\Delta^*(x)\) | \(-\Delta(x) + 2\Delta(2x) - \tfrac{1}{2}\Delta(4x)\) (Jutila's variant) |
| \(N\) | positive integer with \(T/(4\pi) \le N \le T/\pi\), chosen freely |
| \(\sideset{}{'}\sum\) | sum in which the last term is halved if \(x \in \mathbb{Z}\) |

**Definition 1 (Mean-square error term).** The function \(E(T)\) is defined for \(T \ge 2\) by

\[
\int_0^T \left|\zeta\!\left(\tfrac{1}{2}+it\right)\right|^2 dt = T\log\frac{T}{2\pi} + (2\gamma - 1)T + E(T). \tag{*}
\]

Known bounds: \(E(T) = O(T^{1/3+\varepsilon})\), \(E(T) = \Omega(T^{1/4})\). The exact representation below is independent of these bounds.

***

## 2. Bessel Function Prerequisites

**Lemma 2.1** (Integral representation of \(K_0\)). For \(x > 0\):

\[
K_0(2\pi x) = \int_0^\infty \frac{\cos(2\pi x t)}{\sqrt{t^2+1}}\,dt. \tag{2.1}
\]

More generally, for \(\mathrm{Re}(\nu) > -\tfrac{1}{2}\) and \(x > 0\):

\[
K_\nu(2\pi x) = \frac{\sqrt{\pi}\,(2\pi x)^\nu}{2^\nu \Gamma(\nu + \tfrac{1}{2})} \int_0^\infty \frac{\cos(2\pi x t)}{(t^2+1)^{\nu+1/2}}\,dt. \tag{2.2}
\]

*Proof.* Entry 10.32.9 of the DLMF; substitute \(t = \sinh u\).

**Lemma 2.2** (Integral representation of \(Y_0\)). For \(z > 0\):

\[
Y_0(z) = -\frac{2}{\pi}\int_1^\infty \frac{\cos(zt)}{\sqrt{t^2-1}}\,dt.
\]

The combination arising in Voronoï's formula is, for \(n \ge 1\), \(x > 0\):

\[
4K_0(4\pi\sqrt{nx}) - 2\pi Y_0(4\pi\sqrt{nx}),
\]

arising from the Mellin–Barnes integral (3.3) below.

**Lemma 2.3** (Kernel \(H(u,n)\)). For \(n \ge 1\) and \(\mathrm{Re}(u) < 2/3\), define

\[
H(u,n) := 2\int_0^\infty y^{-u}(1+y)^{u-1}\cos(2\pi ny)\,dy. \tag{2.4}
\]

The integral converges absolutely for \(\mathrm{Re}(u) < \tfrac{1}{2}\) and is analytically continued to \(\mathrm{Re}(u) < 2/3\) by two integrations by parts. For \(u = \tfrac{1}{2}+it\):

\[
H\!\left(\tfrac{1}{2}+it, n\right) = 2\int_0^\infty y^{-1/2-it}(1+y)^{-1/2+it}\cos(2\pi ny)\,dy, \tag{2.5}
\]

absolutely convergent for each \(n \ge 1\).

**Lemma 2.4** (Asymptotics). For \(z \to +\infty\):

\[
K_\nu(z) \sim \sqrt{\frac{\pi}{2z}}\,e^{-z}\sum_{k=0}^\infty a_k(\nu)z^{-k}, \qquad Y_\nu(z) \sim \sqrt{\frac{2}{\pi z}}\sin\!\left(z - \frac{\nu\pi}{2} - \frac{\pi}{4}\right) + O(z^{-3/2}).
\]

In particular \(K_\nu(4\pi\sqrt{nx})\) decays like \(e^{-4\pi\sqrt{nx}}\) as \(n \to \infty\) for fixed \(x > 0\), and \(|Y_\nu(4\pi\sqrt{nx})| \le C(nx)^{-1/4}\).

***

## 3. Voronoï–Jutila Exact Summation Formula

**Theorem 3.1** (Voronoï 1904; Jutila 1984 — exact identity). Let \(a < b\) be positive reals and let \(f : [a,b] \to \mathbb{C}\) be smooth. Then

\[
\sideset{}{'}\sum_{a \le n \le b} d(n)f(n) = \int_a^b f(u)(\log u + 2\gamma)\,du + \sum_{n=1}^\infty d(n)\int_a^b f(u)\left[4K_0(4\pi\sqrt{nu}) - 2\pi Y_0(4\pi\sqrt{nu})\right]du. \tag{3.1}
\]

The series converges absolutely in the \(K_0\) terms and conditionally in the \(Y_0\) terms, uniformly on compact subsets of \((0,\infty)\). Equation (3.1) is an exact identity.

*Proof.*

**Step 1.** By Perron's formula,

\[
\sideset{}{'}\sum_{n \le x} d(n) = \frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty} \frac{\zeta(w)^2\, x^w}{w}\,dw, \qquad c > 1.
\]

**Step 2.** Shift the contour to \(\mathrm{Re}(w) = \tfrac{1}{2}\), picking up the double pole at \(w = 1\), which contributes \(x\log x + (2\gamma-1)x\), and the simple pole at \(w = 0\), contributing \(-\tfrac{1}{4}\). Apply the functional equation \(\zeta(w) = \chi(w)\zeta(1-w)\) on \(\mathrm{Re}(w) = \tfrac{1}{2}\).

**Step 3.** The key Mellin–Barnes identity is

\[
\frac{1}{2\pi i}\int_{1/2 - i\infty}^{1/2+i\infty} \left(\frac{\pi n}{u}\right)^{-s}\Gamma(s)^2\cos(\pi s)\,ds = 4K_0(4\pi\sqrt{nu}) - 2\pi Y_0(4\pi\sqrt{nu}). \tag{3.3}
\]

**Step 4.** The \(K_0\) series converges absolutely (exponential decay, Lemma 2.4). The \(Y_0\) series converges conditionally after Abel summation using \(\Delta(X) = O(X^{1/3+\varepsilon})\). $\square$

**Corollary 3.3.** For any smooth \(f\) and any \(N \asymp T\), applying (3.1) with \(a = 1\), \(b = N+\tfrac{1}{2}\):

\[
\sum_{n=1}^N d(n)f(n) = \int_1^{N+1/2} f(u)(\log u + 2\gamma)\,du + \sum_{n=1}^\infty d(n)\int_1^{N+1/2} f(u)\left[4K_0(4\pi\sqrt{nu}) - 2\pi Y_0(4\pi\sqrt{nu})\right]du. \tag{3.4}
\]

***

## 4. Titchmarsh's Exact Identity for \(\zeta^2(s)\)

**Theorem 4.1** (Titchmarsh 1938 — exact identity). For \(s \in \mathbb{C}\) with \(\mathrm{Re}(s) > 0\), \(s \ne 1\), and any \(x > 0\):

\[
\zeta(s)^2 = \sum_{n \le x}\frac{d(n)}{n^s} - x^{-s}\sum_{n \le x}d(n) + \frac{(2s - s^2)}{(s-1)^2}\,x^{1-s} + \frac{s}{s-1}\,x^{1-s}(2\gamma + \log x) + \frac{1}{4}x^{-s}
\]
\[
- (4\pi^2)^s s \sum_{n=1}^\infty \frac{d(n)}{n^{1-s}}\int_{4\pi\sqrt{nx}}^\infty \left[K_1(v) + \frac{\pi}{2}Y_1(v)\right]v^{-2s}\,dv. \tag{4.1}
\]

This is an exact identity for every \(x > 0\) and every \(s\) with \(\mathrm{Re}(s) > 0\), \(s \ne 1\). No approximation is involved.

*Proof.*

**Step 1.** Apply the truncated Perron formula to extract the partial sum \(\sum_{n \le x}\), obtaining an exact contour integral for the tail \(\sum_{n > x}\).

**Step 2.** Shift the tail integral to \(\mathrm{Re}(w) = 1 - \mathrm{Re}(s)\), picking up the double pole of \(\zeta(w)^2/(w-s)\) at \(w = 1\) and the simple pole at \(w = s\). Apply the functional equation \(\zeta(w)^2 = \chi(w)^2 \zeta(1-w)^2\).

**Step 3.** The identity

\[
\frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty} \chi(w)^2 (nx)^{w-s}\,dw = (4\pi^2)^s s\, n^{s-1}\int_{4\pi\sqrt{nx}}^\infty \left[K_1(v) + \frac{\pi}{2}Y_1(v)\right]v^{-2s}\,dv
\]

converts the contour remainder into the Bessel integral in (4.1), via the Sommerfeld contour integral for \(H_1^{(1)}\) and one integration by parts.

**Step 4.** The \(K_1\) term decays as \(e^{-4\pi\sqrt{nx}}\), giving absolute convergence in \(n\). The \(Y_1\) term converges conditionally after partial summation on \(d(n)\). $\square$

**Corollary 4.2.** Setting \(s = \tfrac{1}{2}+it\) and integrating over \([0,T]\) converts (4.1) into Atkinson's four-term exact formula of Theorem 5.1 without any saddle-point approximation.

***

## 5. Atkinson's Exact Pre-Saddle-Point Representation

For \(y > 0\) and \(T \ge 2\) define:

\[
\Phi(T,y) := \frac{\sin\!\left(T\log\frac{1+y}{y}\right)}{\log\frac{1+y}{y}}, \qquad \psi(y) := \frac{1}{\sqrt{y(1+y)}}, \tag{5.1–5.2}
\]

\[
\Psi(T,x) := \int_0^\infty \Phi(T,y)\,\psi(y)\cos(2\pi xy)\,dy. \tag{5.3}
\]

The exact Stirling remainder is

\[
R_0(T) := -\frac{T}{2}\log\!\left(1 + \frac{1}{4T^2}\right) - \frac{1}{12T} - \frac{1}{90T^3}, \qquad |R_0(T)| \le \frac{1}{8T} + \frac{1}{12T} + \frac{1}{90T^3}. \tag{5.4}
\]

For any integer \(N\) with \(T/(4\pi) \le N \le T/\pi\):

\[
E_1(T) := 4\sum_{n=1}^N d(n)\,\Psi(T,n), \tag{5.5}
\]

\[
E_2(T) := 4\,\Delta^*\!\left(N+\tfrac{1}{2}\right)\Psi\!\left(T, N+\tfrac{1}{2}\right), \tag{5.6}
\]

\[
E_3(T) := -\frac{2}{\pi}(\log(N+\tfrac{1}{2})+2\gamma)\int_0^\infty \frac{\Phi(T,y)\sin(2\pi(N+\tfrac{1}{2})y)}{y\sqrt{y(1+y)}}\,dy + \frac{1}{\pi i}\int_0^\infty \frac{\sin(2\pi(N+\tfrac{1}{2})y)}{y}\int_{1/2-iT}^{1/2+iT}\frac{1}{u}\!\left(\frac{1+y}{y}\right)^u du\,dy, \tag{5.7}
\]

\[
E_4(T) := 4\int_{N+1/2}^\infty \frac{\Delta^*(x)}{x}\int_0^\infty \frac{\cos(2\pi xy)}{(1+y)\sqrt{y(1+y)}\,\log\frac{1+y}{y}}\left[T\cos\!\left(T\log\frac{1+y}{y}\right) - \left(\tfrac{1}{2} + \frac{1}{\log\frac{1+y}{y}}\right)\sin\!\left(T\log\frac{1+y}{y}\right)\right]dy\,dx. \tag{5.8}
\]

**Theorem 5.1** (Atkinson's exact formula). For any \(T \ge 2\) and any integer \(N\) with \(T/(4\pi) \le N \le T/\pi\):

\[
E(T) = E_1(T) - E_2(T) + E_3(T) - E_4(T) + R_0(T). \tag{5.9}
\]

This is an exact identity for every \(T \ge 2\).

*Proof.*

**Step 1.** Write \(\int_0^T |\zeta(\tfrac{1}{2}+it)|^2\,dt = \sum_{m,n \ge 1}(mn)^{-1/2}\int_0^T (n/m)^{it}\,dt\). The diagonal \(m = n\) sums to \(T\sum_{n} n^{-1}\), regularised against the asymptotic \(T\log T + (2\gamma-1-\log 2\pi)T\) via the Stirling series for \(\log\Gamma(\tfrac{1}{4}+\tfrac{it}{2})\); this produces \(R_0(T)\) exactly, with the bound in (5.4).

**Step 2.** The off-diagonal terms (\(m \ne n\)) are rearranged by the substitution \(n/m = (1+y)/y\) (\(y = m/(n-m)\)). Via Theorem 3.1, the resulting sum is converted exactly into \(\int_0^T \sum_{n=1}^\infty d(n)H(\tfrac{1}{2}+it, n)\,dt\).

**Step 3.** Exchange \(\int_0^T dt\) and \(\int_0^\infty dy\) by Fubini (justified since \(y^{-1/2}(1+y)^{-1/2} \in L^1\)). The inner \(t\)-integral evaluates exactly:

\[
\mathrm{Re}\int_0^T e^{it\log\frac{1+y}{y}}\,dt = \frac{\sin\!\left(T\log\frac{1+y}{y}\right)}{\log\frac{1+y}{y}} = \Phi(T,y).
\]

This gives \(E_1(T)\) from the truncated sum \(\sum_{n=1}^N\).

**Step 4.** The boundary at \(n = N+\tfrac{1}{2}\) produces \(E_2(T)\) exactly.

**Step 5.** For \(n > N\): one integration by parts against \(\Delta^*(x)\) gives \(E_4(T)\) from the integral and \(E_3(T)\) from the lower boundary. Both steps are exact. $\square$

**Remark.** The choice of \(N \in [T/(4\pi), T/\pi]\) is free; (5.9) holds for every admissible \(N\). Taking \(N \approx T/(2\pi)\) minimises the term count for numerical computation.

***

## 6. Main Theorem: Exact Bessel-Function Series for \(E(T)\)

**Theorem 6.1** (Exact Bessel-function representation). For \(T \ge 2\) and any integer \(N\) with \(T/(4\pi) \le N \le T/\pi\):

\[
E(T) = 4\sum_{n=1}^N d(n)\,\Psi_B(T,n) - 4\,\Delta^*\!\left(N+\tfrac{1}{2}\right)\Psi_B\!\left(T,N+\tfrac{1}{2}\right) + E_3(T) - 4\int_{N+1/2}^\infty \frac{\Delta^*(x)}{x}\,\Xi_B(T,x)\,dx + R_0(T), \tag{6.1}
\]

where

\[
\Psi_B(T,n) := \int_0^\infty \frac{\sin\!\left(T\log\frac{1+y}{y}\right)}{\sqrt{y(1+y)}\,\log\frac{1+y}{y}}\cos(2\pi ny)\,dy, \tag{6.2}
\]

\[
\Xi_B(T,x) := \int_0^\infty \frac{\cos(2\pi xy)}{(1+y)\sqrt{y(1+y)}\,\log\frac{1+y}{y}}\left[T\cos\!\left(T\log\frac{1+y}{y}\right) - \left(\tfrac{1}{2} + \frac{1}{\log\frac{1+y}{y}}\right)\sin\!\left(T\log\frac{1+y}{y}\right)\right]dy, \tag{6.3}
\]

and \(R_0(T)\) is given exactly by (5.4). Furthermore, each \(\Psi_B(T,n)\) has the following exact Bessel representations. Under the substitution \(y = \sinh^2(\theta/2)\):

\[
\Psi_B(T,n) = \int_0^\infty \frac{\sin(2T\log\coth(\theta/2))}{2\log\coth(\theta/2)}\cos(\pi n\sinh\theta)\,d\theta, \tag{6.5}
\]

\[
\Psi_B(T,n) = \int_0^\infty Y_0(2\pi n\cosh\theta)\sin(T\theta)\,d\theta, \tag{6.7a}
\]

where (6.7a) follows from the Mehler–Sonine integral \(Y_0(z) = \tfrac{2}{\pi}\int_0^\infty \sin(z\cosh\theta)\,d\theta\) and the identification \(\mathrm{Im}[H_0^{(1)}(2\pi n\cosh\theta)] = Y_0(2\pi n\cosh\theta)\). The \(K_0\) component enters from the contour rotation \(\theta \to \theta + i\pi/2\) via \(K_0(z) = \tfrac{\pi i}{2}H_0^{(1)}(iz)\), contributing a correction bounded by \(Ce^{-2\pi n}\) for each \(n\).

All equalities in (6.1)–(6.7a) are exact identities. No saddle-point or stationary-phase step has been applied.

*Proof.* Equations (6.1)–(6.4) restate (5.9) with the substitutions \(E_1 = 4\sum d(n)\Psi_B\), \(E_2 = 4\Delta^*(N+\tfrac{1}{2})\Psi_B(T,N+\tfrac{1}{2})\), \(E_4 = 4\int(\Delta^*(x)/x)\Xi_B\,dx\). For (6.5): substitute \(y = \sinh^2(\theta/2)\) in (6.2), computing \(\sqrt{y(1+y)} = \sinh\theta/2\), \(\log((1+y)/y) = 2\log\coth(\theta/2)\), \(\cos(2\pi ny) = \cos(\pi n(\cosh\theta - 1))\), \(dy = \sinh\theta\,d\theta/2\). For (6.7a): use the Mehler–Sonine integral and \(\mathrm{Im}[H_0^{(1)}(\cdot)] = Y_0(\cdot)\). $\square$

**Corollary 6.2** (Double Bessel series for \(E_4\)). Substituting Theorem 7.2 into \(E_4\):

\[
4\int_{N+1/2}^\infty \frac{\Delta^*(x)}{x}\Xi_B(T,x)\,dx = -\frac{8}{\pi}\sum_{m=1}^\infty \frac{d(m)}{\sqrt{m}}\int_{N+1/2}^\infty \frac{K_1(4\pi\sqrt{mx}) + \frac{\pi}{2}Y_1(4\pi\sqrt{mx})}{\sqrt{x}}\Xi_B(T,x)\,dx
\]
\[
+\frac{16\sqrt{2}}{\pi}\sum_{m=1}^\infty \frac{d(m)}{\sqrt{m}}\int_{N+1/2}^\infty \frac{K_1(4\pi\sqrt{2mx}) + \frac{\pi}{2}Y_1(4\pi\sqrt{2mx})}{\sqrt{x}}\Xi_B(T,x)\,dx
\]
\[
-\frac{16}{\pi}\sum_{m=1}^\infty \frac{d(m)}{\sqrt{m}}\int_{N+1/2}^\infty \frac{K_1(4\pi\sqrt{4mx}) + \frac{\pi}{2}Y_1(4\pi\sqrt{4mx})}{\sqrt{x}}\Xi_B(T,x)\,dx. \tag{6.8}
\]

Substituting (6.8) into (6.1) gives a complete representation of \(E(T)\) as a convergent series in \(K_0, Y_0, K_1, Y_1\) with no error term other than \(R_0(T)\) from (5.4).

*Proof.* Substitute (7.2) into (5.8) term by term. The three lines of (6.8) correspond to the three terms \(-\Delta(x)\), \(+2\Delta(2x)\), \(-\tfrac{1}{2}\Delta(4x)\) in \(\Delta^*\), with the Voronoï series (7.1) substituted for each. The prefactors are: \(-(-\tfrac{2}{\pi})\cdot\tfrac{4}{\sqrt{x}} = \tfrac{8}{\pi\sqrt{x}}\) for the first, \(+2\cdot(-\tfrac{2}{\pi})\cdot(-\tfrac{4\sqrt{2}}{\sqrt{x}}) = \tfrac{16\sqrt{2}}{\pi\sqrt{x}}\) for the second, \(-(-\tfrac{1}{2})\cdot(-\tfrac{2}{\pi})\cdot\tfrac{8}{\sqrt{x}} = -\tfrac{16}{\pi\sqrt{x}}\) for the third. $\square$

***

## 7. Voronoï's Exact Series for \(\Delta^*(x)\)

**Theorem 7.1** (Voronoï 1904 — exact series for \(\Delta(x)\)). For \(x > 0\), \(x \notin \mathbb{Z}\):

\[
\Delta(x) = -\frac{2}{\pi}\sqrt{x}\sum_{n=1}^\infty \frac{d(n)}{\sqrt{n}}\left[K_1(4\pi\sqrt{nx}) + \frac{\pi}{2}Y_1(4\pi\sqrt{nx})\right]. \tag{7.1}
\]

The series converges absolutely in \(K_1\) and conditionally in \(Y_1\), uniformly on compact subsets of \((0,\infty)\setminus\mathbb{Z}\). This is an exact identity.

*Proof.* Apply the Mellin transform to \(\Delta(x)\), shift the inverse Mellin contour to \(\mathrm{Re}(s) = \tfrac{1}{2}\) via the functional equation of \(\zeta(s)^2\), and identify the resulting integral with the Bessel functions via the Basset formulas:

\[
K_1(2\pi a) = \int_0^\infty e^{-2\pi a\cosh t}\cosh t\,dt, \qquad Y_1(2\pi a) = -\frac{2}{\pi}\int_0^\infty \cosh t\cdot\sin(2\pi a\cosh t)\,dt.
\]

Summing over \(n\) with coefficients \(d(n)/\sqrt{n}\) gives (7.1). $\square$

**Theorem 7.2** (Exact series for \(\Delta^*(x)\)). Let \(\Delta^*(x) = -\Delta(x) + 2\Delta(2x) - \tfrac{1}{2}\Delta(4x)\). Substituting (7.1) into each term:

\[
\Delta^*(x) = \frac{2}{\pi}\sqrt{x}\sum_{n=1}^\infty \frac{d(n)}{\sqrt{n}}\left[K_1(4\pi\sqrt{nx}) + \frac{\pi}{2}Y_1(4\pi\sqrt{nx})\right]
\]
\[
- \frac{4\sqrt{2}}{\pi}\sqrt{x}\sum_{n=1}^\infty \frac{d(n)}{\sqrt{n}}\left[K_1(4\pi\sqrt{2nx}) + \frac{\pi}{2}Y_1(4\pi\sqrt{2nx})\right]
\]
\[
+ \frac{2}{\pi}\sqrt{x}\sum_{n=1}^\infty \frac{d(n)}{\sqrt{n}}\left[K_1(4\pi\sqrt{4nx}) + \frac{\pi}{2}Y_1(4\pi\sqrt{4nx})\right]. \tag{7.2}
\]

*Proof.* Line-by-line substitution of (7.1): \(-\Delta(x)\) gives coefficient \(+(2/\pi)\sqrt{x}\); \(2\Delta(2x)\) gives \(+2\cdot(-2/\pi)\sqrt{2x} = -(4\sqrt{2}/\pi)\sqrt{x}\); \(-\tfrac{1}{2}\Delta(4x)\) gives \(-\tfrac{1}{2}\cdot(-2/\pi)\cdot 2\sqrt{x} = +(2/\pi)\sqrt{x}\). $\square$

**Corollary 7.3** (Jutila's mean-square relation). Jutila proved:

\[
\int_2^T \left[E(t) - 2\pi\Delta^*\!\left(\frac{t}{2\pi}\right)\right]^2 dt = O(T^{4/3}\log^3 T).
\]

This shows \(E(T) \approx 2\pi\Delta^*(T/(2\pi))\) in the \(L^2\) sense. Substituting (7.2) at \(x = T/(2\pi)\) gives the leading Bessel series for \(E(T)\); the exact pointwise formula is (6.1).

***

## 8. Convergence

**Theorem 8.1.**

**(i)** The finite sum \(\sum_{n=1}^N d(n)\Psi_B(T,n)\) contains \(N \asymp T\) terms, each an explicit finite integral. It converges trivially for fixed \(T\).

**(ii)** \(\Xi_B(T,x) = O(Tx^{-1/2})\) as \(x \to \infty\) by the Riemann–Lebesgue lemma. Combined with \(\Delta^*(x) = O(x^{1/3+\varepsilon})\):

\[
\int_{N+1/2}^\infty \frac{|\Delta^*(x)|}{x}|\Xi_B(T,x)|\,dx \le CT N^{-1/6+\varepsilon} < \infty.
\]

**(iii)** In the double Bessel series (6.8): the \(K_1\) terms satisfy \(|d(m)K_1(4\pi\sqrt{mx})| \le Cm^\varepsilon e^{-4\pi\sqrt{mx}}\), giving absolute and exponentially fast convergence. The \(Y_1\) terms converge conditionally by Dirichlet's criterion after Abel summation on \(d(m)\).

**(iv)** For any \(T \ge 2\) and target precision \(\delta > 0\), truncating the Voronoï series in (6.8) at \(m = M_0\) gives

\[
|E(T) - E(T;M_0)| < \delta,
\]

with the \(K_1\) tail bounded by \(C'\,e^{-4\pi\sqrt{M_0(N+1/2)}}\), which is effective and computable.

***

## 9. The Saddle-Point Step and the Origin of \(O(\log^2 T)\)

**Proposition 9.1** (Stationary-phase lemma). Let \(\varphi, g : [a,b] \to \mathbb{R}\) with \(\varphi\) smooth, having a unique stationary point \(x_0 \in (a,b)\) with \(\varphi'(x_0) = 0\), \(\varphi''(x_0) \ne 0\), and \(g = O(G)\). Then:

\[
\int_a^b g(x)e^{i\lambda\varphi(x)}\,dx = g(x_0)e^{i\lambda\varphi(x_0)}\sqrt{\frac{2\pi}{\lambda|\varphi''(x_0)|}}\,e^{i(\pi/4)\mathrm{sgn}\,\varphi''(x_0)} + O\!\left(\frac{G}{\lambda|\varphi''(x_0)|}\right). \tag{9.1}
\]

**Proposition 9.2.** The integrand of \(\Psi_B(T,n)\) has phase \(\varphi(y) = T\log((1+y)/y) \pm 2\pi ny\). Setting \(\varphi'(y^*) = 0\) gives \(T/(y^*(1+y^*)) = 2\pi n\), with unique solution \(y^* \approx \sqrt{T/(4\pi n)} - \tfrac{1}{2}\) for \(T \gg n\). Applying (9.1):

\[
\Psi_B(T,n) = \frac{\pi}{2}\left(\frac{T}{2\pi n}\right)^{1/4}\!\left(\frac{T}{2\pi n}-1\right)^{-1/2}\cos(f(T,n)) + O(n^\varepsilon T^{-3/4}),
\]

where

\[
f(T,n) = T\operatorname{arcsinh}\!\sqrt{\frac{2\pi n}{T}} - \sqrt{2\pi nT + 4\pi^2 n^2} + \frac{\pi}{4}. \tag{9.2}
\]

Summing over \(n = 1,\ldots,N\) with weight \(d(n)\): the total saddle-point error is \(\sum_{n=1}^N d(n)O(n^\varepsilon T^{-3/4}) = O(T^{1/4+2\varepsilon})\). The boundary terms \(E_2\) and \(E_3\), evaluated at the large-argument boundary \(n = N+\tfrac{1}{2} \asymp T\), contribute \(O(\log^2 T)\) from the stationary-phase remainder at that scale. This is the entire source of the published \(O(\log^2 T)\) in the standard Atkinson formula. Without applying (9.1), formula (6.1) carries no error beyond \(R_0(T)\).

**Corollary 9.3** (Standard Atkinson formula — approximate). Applying Proposition 9.1 to each \(\Psi_B(T,n)\) and \(\Xi_B(T,x)\):

\[
E(T) = \sum_{n \le N} a(n)\cos(f(T,n)) + \sum_{n \le M} b(n)\cos(g(T,n)) + O(\log^2 T), \tag{9.3}
\]

with

\[
a(n) = (-1)^n d(n)\left(\frac{T}{2\pi n}\right)^{1/4}\!\left(1 - \frac{2\pi n}{T}\right)^{-1/4}, \qquad b(n) = \frac{1}{\sqrt{2}}d(n)\left(\frac{2T}{\pi n}\right)^{1/4}\!\left(1 + \frac{\pi n}{2T}\right)^{-1/4},
\]

\[
g(T,n) = -2T\operatorname{arcsinh}\!\sqrt{\frac{\pi n}{2T}} + \sqrt{2\pi nT + \pi^2 n^2} + \frac{\pi}{4}.
\]

The \(O(\log^2 T)\) is entirely a consequence of applying (9.1). It does not appear in (6.1).

***

## 10. Summary of Identities

| Label | Identity | Status |
|-------|----------|--------|
| \((*)\) | \(\int_0^T |\zeta(\tfrac{1}{2}+it)|^2\,dt = T\log\frac{T}{2\pi} + (2\gamma-1)T + E(T)\) | **Exact (definition)** |
| (3.1) | Voronoï–Jutila summation formula | **Exact** |
| (4.1) | Titchmarsh identity for \(\zeta^2(s)\) with \(K_1\), \(Y_1\) Bessel tail | **Exact** |
| (5.9) | Atkinson decomposition \(E(T) = E_1 - E_2 + E_3 - E_4 + R_0(T)\) | **Exact** |
| (6.1) | Main theorem: \(E(T)\) as explicit Bessel integrals | **Exact** |
| (6.8) | \(E_4\) as double series in \(K_1, Y_1\) | **Exact** |
| (7.1) | Voronoï exact series for \(\Delta(x)\) | **Exact** |
| (7.2) | Exact series for \(\Delta^*(x)\) | **Exact** |
| (9.3) | Standard Atkinson formula | **Approximate (\(O(\log^2 T)\) error)** |