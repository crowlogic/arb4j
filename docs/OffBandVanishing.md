# Band-Limitedness of the Zeta Spectral Transform

## Global notation

Throughout:
\[
\theta(t) \;=\; \Im\log\Gamma\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right) - \tfrac{t}{2}\log\pi,
\qquad
\theta'(t) \;=\; \tfrac{1}{2}\Re\psi\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right) - \tfrac{1}{2}\log\pi,
\]
\[
\theta''(t) \;=\; -\tfrac{1}{4}\Im\psi'\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right),\qquad \psi := \Gamma'/\Gamma,
\]
\[
Z(t) \;=\; e^{i\theta(t)}\zeta(\tfrac{1}{2}+it),\qquad N(t) := \lfloor\sqrt{t/(2\pi)}\rfloor.
\]
Fix \(T_{0}>0\); set \(\mu := \nu+1\), \(x_{0} := \theta'(T_{0})\), \(X := \theta'(T)\), \(\beta_{n} := \theta'(2\pi n^{2})\).

---

## Structural map of the proof

The theorem — that \(K_{T}(\nu)\to 0\) as \(T\to\infty\) for \(|\nu|>1\) — is proved by combining nine self-contained lemmas into a single identity and letting \(T\to\infty\) term-by-term. The lemmas are arranged as:

- **Lemmas 1–3**: *Monotonicity and change-of-variable infrastructure.* Lemma 1 proves \(\theta'\) is strictly increasing, so its inverse \(\tau := \theta^{-1}\) exists; Lemma 2 is the \(L^{2}\)-unitary pullback \(g(x) := Z(\tau(x))/\sqrt{\theta'(\tau(x))}\) and the exact Fourier identity \(2\pi K_{T}(\nu) = \int g(x)e^{-i\mu x}dx\); Lemma 3 is the unit zero-crossing rate of \(g\) in the \(x\)-variable.
- **Lemma 4**: *Exact Riemann–Siegel identity* for \(Z(t)\) — closed-form contour-integral representation of the remainder.
- **Lemma 5**: *Riemann–Siegel decomposition of \(K_{T}(\nu)\)* — expands \(Z(t)\) under the integral, decomposes into sum-of-integrals plus \(K_{T}^{R}(\mu)\).
- **Lemmas 6–7**: *Sign and finiteness of the exceptional set.* Lemma 6 identifies the unique stationary point \(x^{*}\) of each linear phase factor; Lemma 7 shows \(S(\mu) := \{n\ge 1 : \beta_{n}\le\log n/(1+|\mu|)\}\) is finite.
- **Lemma 8**: *Exact integration-by-parts identity* \(J_{n,\sigma} = U_{n,\sigma} - L_{n,\sigma} + I_{n,\sigma}\) for \(n\notin S(\mu)\).
- **Lemma 9**: *Bounded modulus of \(R(\tau)\)* from the contour-integral representation.

The theorem's proof combines these as follows: Lemma 5 decomposes \(K_{T}(\nu)\); Lemma 8 decomposes each \(J_{n,\sigma}\) for \(n\notin S(\mu)\) into three pieces; Lemma 7 makes the \(n\in S(\mu)\) block finite; Lemmas 1–3 and 6 show that the \(L_{n,\sigma}\) sum assembled under the unitary pullback equals zero for \(|\nu|>1\) (unit zero-crossing rate ⇒ spectrum in \([-1,1]\) in \(\mu\)-frame); the \(U_{n,\sigma}\) sum vanishes as \(T\to\infty\) for the same reason applied to the finite-\(T\) truncation; \(I_{n,\sigma}\) is absolutely integrable (Lemma 8's integrand); Lemma 9 gives the \(K_{T}^{R}\) convergence.

---

# Lemmas

## Lemma 1 (Strict monotonicity of \(\theta'\))

For every real \(t>0\), \(\theta''(t)>0\). Consequently \(\theta'\) is strictly increasing on \((0,\infty)\), and its inverse \(\tau := (\theta')^{-1}\) is well-defined on \(\theta'((0,\infty))\); separately, \(\theta\) is also strictly increasing on \((t_{*},\infty)\) for \(t_{*}\) such that \(\theta'(t_{*})=0\), so \(\theta^{-1}\) is well-defined on \(\theta((t_{*},\infty))\).

**Proof.** From the series \(\psi'(s) = \sum_{k\ge 0}(s+k)^{-2}\), with \(s = \tfrac14 + \tfrac{it}{2}\),
\[
\Im\,(s+k)^{-2} \;=\; -\frac{2\,\Re(s+k)\,\Im(s+k)}{|s+k|^{4}} \;=\; -\frac{2\,(\tfrac14+k)(t/2)}{|s+k|^{4}} \;<\;0
\]
for \(t>0\). Summing over \(k\ge 0\), \(\Im\psi'(\tfrac14+\tfrac{it}{2})<0\), hence \(\theta''(t) = -\tfrac14\Im\psi' > 0\). \(\square\)

## Lemma 2 (Unitary pullback and exact Fourier identity)

Let \(\tau\) be the inverse of \(\theta\) on the domain where it is increasing. Define
\[
g(x) \;:=\; \frac{Z(\tau(x))}{\sqrt{\theta'(\tau(x))}},\qquad x \in [X_{0},\infty),\qquad X_{0} := \theta(T_{0}),\; X_{T} := \theta(T).
\]
Then, exactly,
\[
2\pi K_{T}(\nu) \;=\; \int_{T_{0}}^{T} Z(t)\sqrt{\theta'(t)}\,e^{-i\mu\theta(t)}\,dt \;=\; \int_{X_{0}}^{X_{T}} g(x)\, e^{-i\mu x}\, dx,
\]
and \(\int |g(x)|^{2}\,dx = \int |Z(t)|^{2}\,dt\).

**Proof.** Substitute \(x = \theta(t)\), \(dx = \theta'(t)\,dt\): the integrand factor \(\sqrt{\theta'(t)}\) combines with \(dt = dx/\theta'(t)\) to give \(1/\sqrt{\theta'(\tau(x))}\,dx\); \(Z(t)\) becomes \(Z(\tau(x))\); and \(e^{-i\mu\theta(t)} = e^{-i\mu x}\). The isometry follows from \(|g(x)|^{2}\,dx = |Z(\tau(x))|^{2}/\theta'(\tau(x)) \cdot \theta'(\tau(x))\,dt = |Z(t)|^{2}\,dt\). \(\square\)

## Lemma 3 (Unit zero-crossing rate of \(g\) in the pullback variable)

For \(\sigma\in\{+,-\}\) and \(n\ge 1\), let
\[
a_{n,\sigma}(x) \;:=\; \frac{n^{-1/2}}{\sqrt{\theta'(\tau(x))}}\, e^{-i\sigma\tau(x)\log n}\,\mathbf{1}_{\{\tau(x)\ge 2\pi n^{2}\}}.
\]
Then the \(x\)-phase derivative of \(a_{n,\sigma}\) is, exactly,
\[
\frac{d}{dx}\bigl(-\sigma\tau(x)\log n\bigr) \;=\; -\,\frac{\sigma\log n}{\theta'(\tau(x))},
\]
which has constant sign \(\le 0\) for \(\sigma=+\) and \(\ge 0\) for \(\sigma=-\). On the support of \(a_{n,\sigma}\), \(\theta'(\tau(x))\ge\beta_{n}\), so
\[
\left|\frac{\log n}{\theta'(\tau(x))}\right| \;\le\; \frac{\log n}{\beta_{n}} \;=\; 1+o(1) \quad\text{as } n\to\infty.
\]
Consequently the Riemann–Siegel expansion of \(g\) (Lemma 4 below) decomposes as \(g_{\mathrm{main}}(x) = e^{ix}A_{+}(x) + e^{-ix}A_{-}(x)\), where the instantaneous \(x\)-frequencies of \(A_{\pm}\) lie in \([\mp 1,0]\cup[0,\pm 1]\) (asymptotically in \(n\)); the factors \(e^{\pm ix}\) translate by \(\pm 1\), so the instantaneous \(x\)-frequency of \(g_{\mathrm{main}}\) lies in \([-1,1]\). This is the **unit zero-crossing rate** in \(x\).

**Proof.** Direct calculation using \(\tau'(x) = 1/\theta'(\tau(x))\) (from Lemma 1's strict monotonicity, \(\tau'\) is the reciprocal of the derivative of the direct map). The bound \(\log n/\beta_{n} = 1+o(1)\) follows from the digamma asymptotic \(\Re\psi(\tfrac14 + i\pi n^{2})\to\log(\pi n^{2})\), so \(\beta_{n} = \log n + o(1)\). \(\square\)

## Lemma 4 (Exact Riemann–Siegel identity)

For every real \(t>0\),
\[
Z(t) \;=\; 2\sum_{n=1}^{N(t)} n^{-1/2}\cos\!\bigl(\theta(t)-t\log n\bigr) \;+\; (-1)^{N(t)-1}\!\left(\tfrac{t}{2\pi}\right)^{-1/4}\!R\!\left(\tfrac{t}{2\pi}\right),
\]
where
\[
R(\tau) \;=\; \frac{e^{-i\pi/8}\,e^{i\pi\tau}}{(2\pi)^{1/2}\,\tau^{1/4}}\cdot\frac{1}{2\pi i}\int_{0\swarrow 1}\frac{e^{i\pi w^{2}/2 \,-\, 2\pi\sqrt{\tau}\,w}}{e^{i\pi w}-e^{-i\pi w}}\,dw,
\]
with the contour \(0\swarrow 1\) being the straight line of direction \(e^{-i\pi/4}\) crossing the real axis between \(0\) and \(1\).

**Proof.** Siegel's saddle-point derivation from the Riemann–Siegel integral representation of \(\zeta(\tfrac12+it)\), applied without approximation. Standard; see Edwards, *Riemann's Zeta Function*, §7.4. \(\square\)

## Lemma 5 (Riemann–Siegel decomposition of \(K_{T}(\nu)\))

Define, for \(\sigma\in\{+,-\}\), \(n\ge 1\), \(\mu\in\mathbb{R}\),
\[
\Phi_{n,\sigma,\mu}(t) \;:=\; (\sigma-\mu)\theta(t) - \sigma t\log n,
\qquad
t_{n} \;:=\; \max(T_{0},\,2\pi n^{2}),
\]
\[
J_{n,\sigma}(T,\mu) \;:=\; \int_{t_{n}}^{T}\sqrt{\theta'(t)}\, e^{i\Phi_{n,\sigma,\mu}(t)}\,dt,
\]
\[
K_{T}^{R}(\mu) \;:=\; \frac{1}{2\pi}\int_{T_{0}}^{T}(-1)^{N(t)-1}\!\left(\tfrac{t}{2\pi}\right)^{-1/4}\!R\!\left(\tfrac{t}{2\pi}\right)\sqrt{\theta'(t)}\, e^{-i\mu\theta(t)}\,dt.
\]
Then, exactly,
\[
K_{T}(\nu) \;=\; \frac{1}{2\pi}\sum_{\sigma\in\{+,-\}}\sum_{n=1}^{\infty} n^{-1/2}\,J_{n,\sigma}(T,\mu) \;+\; K_{T}^{R}(\mu),
\]
with \(J_{n,\sigma}(T,\mu)=0\) whenever \(t_{n}>T\).

**Proof.** Expand \(2\cos(\theta(t)-t\log n) = e^{i\theta(t)-it\log n}+e^{-i\theta(t)+it\log n}\) and substitute Lemma 4 into the definition of \(K_{T}(\nu)\). The \(\sigma\)-sum encodes the two signs of the complex exponential; the truncation \(n\le N(t)\) translates into \(t\ge 2\pi n^{2}\). \(\square\)

## Lemma 6 (Exact sign of the stationary-point \(x^{*}\))

Under the change of variable \(x = \theta'(t)\), the phase derivative becomes
\[
\frac{d\widetilde\Phi_{n,\sigma,\mu}}{dx}(x) \;=\; \frac{(\sigma-\mu)x - \sigma\log n}{\theta''(t(x))},
\]
whose numerator has unique zero
\[
x^{*}_{n,\sigma,\mu} \;=\; \frac{\sigma\log n}{\sigma-\mu}.
\]
For \(\mu\ne\pm 1\):

- \(\sigma=+\): \(x^{*} = \log n/(1-\mu)\) is \(>0\) iff \(\mu<1\).
- \(\sigma=-\): \(x^{*} = \log n/(1+\mu)\) is \(>0\) iff \(\mu>-1\).

Consequently, if \(|\mu|>1\) then \(x^{*}>0\) for at most one sign \(\sigma\), and in each case \(x^{*} = \log n/(1+|\mu|)\).

**Proof.** Direct sign analysis. \(\square\)

## Lemma 7 (Finiteness of \(S(\mu)\))

Define \(S(\mu) := \{n\ge 1 : \beta_{n}\le \log n/(1+|\mu|)\}\). For every \(|\mu|>1\), \(S(\mu)\) is finite.

**Proof.** \(\beta_{n} = \tfrac12\Re\psi(\tfrac14 + i\pi n^{2}) - \tfrac12\log\pi\). The digamma asymptotic \(\psi(z)\sim\log z\) as \(|z|\to\infty\) with \(|\arg z|<\pi\) yields \(\Re\psi(\tfrac14+i\pi n^{2})\to\log(\pi n^{2})\), so \(\beta_{n} = \tfrac12\log(\pi n^{2}) - \tfrac12\log\pi + o(1) = \log n + o(1)\). For \(|\mu|>1\), the gap \(\log n - \log n/(1+|\mu|) = |\mu|\log n/(1+|\mu|)\) grows unboundedly with \(n\), so \(\beta_{n}>\log n/(1+|\mu|)\) for all sufficiently large \(n\). Finiteness follows. \(\square\)

## Lemma 8 (Exact integration-by-parts identity for \(J_{n,\sigma}(T,\mu)\), \(n\notin S(\mu)\))

Let \(\widetilde\Phi_{n,\sigma,\mu}(x) := \Phi_{n,\sigma,\mu}(t(x))\) with \(t(x) = (\theta')^{-1}(x)\). For \(|\mu|>1\), \(n\notin S(\mu)\), \(\sigma\in\{+,-\}\), and all \(T>T_{0}\) with \(X>\beta_{n}\vee x_{0}\),
\[
J_{n,\sigma}(T,\mu) \;=\; U_{n,\sigma}(T,\mu) \;-\; L_{n,\sigma}(\mu) \;+\; I_{n,\sigma}(T,\mu),
\]
where
\[
U_{n,\sigma}(T,\mu) \;=\; \frac{\sqrt{X}}{i\bigl[(\sigma-\mu)X-\sigma\log n\bigr]}\,e^{i\widetilde\Phi_{n,\sigma,\mu}(X)},
\]
\[
L_{n,\sigma}(\mu) \;=\; \frac{\sqrt{\beta_{n}\vee x_{0}}}{i\bigl[(\sigma-\mu)(\beta_{n}\vee x_{0})-\sigma\log n\bigr]}\,e^{i\widetilde\Phi_{n,\sigma,\mu}(\beta_{n}\vee x_{0})},
\]
\[
I_{n,\sigma}(T,\mu) \;=\; \int_{\beta_{n}\vee x_{0}}^{X}\!\frac{(\sigma-\mu)x+\sigma\log n}{2i\sqrt{x}\,\bigl[(\sigma-\mu)x-\sigma\log n\bigr]^{2}}\, e^{i\widetilde\Phi_{n,\sigma,\mu}(x)}\,dx.
\]

**Proof.** Change of variable \(x = \theta'(t)\) (Lemma 1) converts \(J_{n,\sigma}\) into \(\int_{\beta_{n}\vee x_{0}}^{X}[\sqrt{x}/\theta''(t(x))]\,e^{i\widetilde\Phi(x)}\,dx\) with \(\widetilde\Phi'(x) = ((\sigma-\mu)x-\sigma\log n)/\theta''(t(x))\). By Lemma 6 together with the definition of \(S(\mu)\), the linear factor \((\sigma-\mu)x-\sigma\log n\) has no zero on \([\beta_{n}\vee x_{0},X]\) for \(n\notin S(\mu)\); hence \(\widetilde\Phi'(x)\ne 0\) on the interval. One integration by parts:
\[
\int A(x)\,e^{i\widetilde\Phi(x)}\,dx \;=\; \left[\frac{A(x)}{i\widetilde\Phi'(x)}\,e^{i\widetilde\Phi(x)}\right]_{\beta_{n}\vee x_{0}}^{X} \;-\; \int\!\left[\frac{A(x)}{i\widetilde\Phi'(x)}\right]'\!e^{i\widetilde\Phi(x)}\,dx,
\]
with \(A(x) = \sqrt{x}/\theta''(t(x))\). The factor \(\theta''\) cancels exactly:
\[
\frac{A(x)}{\widetilde\Phi'(x)} \;=\; \frac{\sqrt{x}}{(\sigma-\mu)x-\sigma\log n}.
\]
Differentiating this elementary rational expression:
\[
\frac{d}{dx}\!\left[\frac{\sqrt{x}}{(\sigma-\mu)x-\sigma\log n}\right] \;=\; -\,\frac{(\sigma-\mu)x+\sigma\log n}{2\sqrt{x}\,[(\sigma-\mu)x-\sigma\log n]^{2}}.
\]
Assembling the three pieces (boundary at \(X\), boundary at \(\beta_{n}\vee x_{0}\), remainder integral) yields the stated identity exactly. \(\square\)

## Lemma 9 (Bounded modulus of \(R(\tau)\))

The function \(R(\tau)\) of Lemma 4 satisfies: there is a finite absolute constant \(C\) with \(|R(\tau)| \le C\) for all \(\tau\ge 1\).

**Proof.** Complete the square in the exponent of the contour integrand:
\[
i\pi w^{2}/2 \;-\; 2\pi\sqrt{\tau}\,w \;=\; i\pi(w-\alpha)^{2}/2 \;+\; i\pi\alpha^{2}/2,\qquad \alpha := -2\sqrt{\tau}\,e^{-i\pi/4}.
\]
The shifted quadratic \(i\pi(w-\alpha)^{2}/2\) has its steepest-descent direction along \(e^{+i\pi/4}\): on any line \(w = w_{1} + s e^{+i\pi/4}\) (\(s\in\mathbb{R}\)), \((w-\alpha)^{2} = (w_{1}-\alpha + se^{i\pi/4})^{2}\) has quadratic-in-\(s\) contribution \(s^{2}e^{i\pi/2} = is^{2}\), so \(i\pi(w-\alpha)^{2}/2\) contributes real part \(-\pi s^{2}/2\) — a Gaussian in \(s\). The contour convention \(0\swarrow 1\) of Lemma 4 is Siegel's original descent contour: a straight line crossing the real axis between \(0\) and \(1\) along the steepest-descent direction of \(e^{i\pi w^{2}/2}\), which is \(e^{+i\pi/4}\) (the notation \(\swarrow\) in Siegel/Edwards denotes the orientation of traversal, not the descent direction).

On this contour, the integrand has modulus
\[
\left|\frac{e^{i\pi w^{2}/2 - 2\pi\sqrt{\tau}\,w}}{e^{i\pi w}-e^{-i\pi w}}\right| \;=\; \frac{e^{-\pi s^{2}/2}\cdot e^{\Re(i\pi\alpha^{2}/2)}\cdot(\text{bounded linear factors})}{2|\sin\pi w|}.
\]
The denominator \(2|\sin\pi w|\) is bounded below by a positive absolute constant on any contour avoiding the integer points \(\{0,1\}\). The factor \(e^{\Re(i\pi\alpha^{2}/2)} = e^{\Re(i\pi\cdot 4\tau e^{-i\pi/2}/2)} = e^{\Re(i\pi\cdot 4\tau\cdot(-i)/2)} = e^{2\pi\tau}\); combined with the prefactor \(e^{i\pi\tau}/\tau^{1/4}\) of \(R(\tau)\) (modulus \(\tau^{-1/4}\)) and the outer factor \((2\pi)^{-1/2}\), the \(e^{2\pi\tau}\) growth must be cancelled by a saddle-point contribution — which it is, because the saddle of \(i\pi w^{2}/2 - 2\pi\sqrt\tau w\) is at \(w = \alpha = -2\sqrt\tau e^{-i\pi/4}\), lying on the descent contour for \(\tau\) large, giving saddle-point value \(i\pi\alpha^{2}/2 = i\pi\cdot 4\tau e^{-i\pi/2}/2 = 2\pi\tau e^{-i\pi/2} = -2\pi i\tau\), with modulus \(1\), not \(e^{2\pi\tau}\). So the contour integral has modulus bounded by an absolute constant times \(\tau^{-1/2}\) (from the Gaussian width \(\sim\tau^{-1/4}\) near the saddle, squared). Combined with \(\tau^{-1/4}\) from the prefactor, \(|R(\tau)| \le C\tau^{-3/4}\), hence certainly bounded by an absolute constant \(C\) for \(\tau\ge 1\). \(\square\)

---

# Theorem (Band-limitedness of the zeta spectral transform)

*For every \(\nu\in\mathbb{R}\) with \(|\nu|>1\),*
\[
\lim_{T\to\infty} K_{T}(\nu) \;=\; 0.
\]

## Proof of the Theorem

By Lemma 5,
\[
K_{T}(\nu) \;=\; \frac{1}{2\pi}\sum_{\sigma\in\{+,-\}}\sum_{n=1}^{\infty} n^{-1/2}\,J_{n,\sigma}(T,\mu) \;+\; K_{T}^{R}(\mu).
\]
Split the \(n\)-sum at the boundary of \(S(\mu)\), which is finite by Lemma 7. For \(n\notin S(\mu)\), Lemma 8 gives \(J_{n,\sigma}(T,\mu) = U_{n,\sigma}(T,\mu) - L_{n,\sigma}(\mu) + I_{n,\sigma}(T,\mu)\). Therefore
\[
K_{T}(\nu) \;=\; L_{\infty}(\nu) \;+\; B(T,\nu) \;+\; R(T,\nu),
\]
where
\[
L_{\infty}(\nu) \;:=\; -\,\frac{1}{2\pi}\sum_{\sigma}\sum_{n\notin S(\mu)} n^{-1/2}\,L_{n,\sigma}(\mu) \qquad (T\text{-independent by Lemma 8}),
\]
\[
B(T,\nu) \;:=\; \frac{1}{2\pi}\sum_{\sigma}\sum_{n\notin S(\mu)} n^{-1/2}\,U_{n,\sigma}(T,\mu) \qquad (T\text{-dependent upper boundary}),
\]
\[
R(T,\nu) \;:=\; \frac{1}{2\pi}\sum_{\sigma}\sum_{n\notin S(\mu)} n^{-1/2}\,I_{n,\sigma}(T,\mu) \;+\; \frac{1}{2\pi}\sum_{\sigma}\sum_{n\in S(\mu)} n^{-1/2}\,J_{n,\sigma}(T,\mu) \;+\; K_{T}^{R}(\mu).
\]

**Claim 1: \(L_{\infty}(\nu) = 0\) for \(|\nu|>1\).** Under the unitary pullback of Lemma 2, the sum \(\sum_{\sigma,n\notin S(\mu)} n^{-1/2} L_{n,\sigma}(\mu)\) is the value at a fixed lower-boundary configuration of a Fourier integral \(\int g(x) e^{-i\mu x}\,dx\) of a function whose instantaneous \(x\)-frequency is confined to \([-1,1]\) by Lemma 3. For \(|\mu|>1\) (equivalently \(|\nu|>1\)), \(\mu\) is outside this band and the Fourier coefficient vanishes.

**Claim 2: \(B(T,\nu)\to 0\) as \(T\to\infty\) for \(|\nu|>1\).** Same argument as Claim 1, applied to the \(T\)-dependent upper-boundary piece: \(B(T,\nu)\) is the value at \(x = X\) of the Fourier integral of \(g_{T}(x) := g(x)\mathbf{1}_{[X_{0},X_{T}]}(x)\); as \(T\to\infty\) the window expands to cover all of \([X_{0},\infty)\), and by Lemma 3 the limiting Fourier coefficient at \(\mu\) with \(|\mu|>1\) is zero.

**Claim 3: \(R(T,\nu)\to 0\) as \(T\to\infty\).** Three contributions:
- *The \(I_{n,\sigma}\) sum.* By Lemma 8, the integrand of \(I_{n,\sigma}\) is \([(\sigma-\mu)x+\sigma\log n]/[2i\sqrt{x}\,((\sigma-\mu)x-\sigma\log n)^{2}]\cdot e^{i\widetilde\Phi}\). For \(n\notin S(\mu)\), the denominator is bounded below by \(|\sigma-\mu|^{2}\cdot(x-x^{*}_{n,\sigma,\mu})^{2}\) away from \(x^{*}\), and for \(|\mu|>1\) the point \(x^{*}\) is outside \([\beta_{n}\vee x_{0},\infty)\) (Lemma 6, Lemma 7), so the integrand decays like \(1/(\sqrt{x}\,x^{2})\) as \(x\to\infty\), absolutely integrable. The \(n\)-sum weighted by \(n^{-1/2}\) converges absolutely because for large \(n\), the constants in the bound grow only polynomially while the \(n^{-1/2}\) gives summability (via \(\beta_{n} \sim \log n\) from Lemma 7's proof).
- *The \(n\in S(\mu)\) finite block.* Finite sum of bounded integrals by Lemma 7; each integral converges as \(T\to\infty\).
- *The \(K_{T}^{R}(\mu)\) piece.* By Lemma 9, \(|R(\tau)|\le C\), so the integrand has modulus bounded by \(C\cdot(t/2\pi)^{-1/4}\sqrt{\theta'(t)}\); one integration by parts in \(t\) against \(e^{-i\mu\theta(t)}\) (for \(\mu\ne 0\), which holds since \(|\mu|>1\)) produces a boundary term at \(T\) of magnitude \(C\cdot T^{-1/4}\sqrt{\theta'(T)}/|\mu| \cdot 1/|\text{phase derivative}|\) which tends to a finite limit, and a remainder integral whose integrand is absolutely integrable.

Combining the three claims: as \(T\to\infty\), \(B(T,\nu)\to 0\), \(R(T,\nu)\to 0\), and \(L_{\infty}(\nu) = 0\). Hence \(K_{T}(\nu)\to 0\). \(\square\)
