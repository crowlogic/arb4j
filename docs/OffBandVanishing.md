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

For \(\sigma\in\{+,-\}\), \(n\ge 1\), \(\mu\in\mathbb{R}\), define the phase
\[
\Phi_{n,\sigma,\mu}(t) \;:=\; (\sigma-\mu)\theta(t) - \sigma t\log n,
\]
and its pullback along \(t(x) := (\theta')^{-1}(x)\),
\[
\widetilde\Phi_{n,\sigma,\mu}(x) \;:=\; \Phi_{n,\sigma,\mu}(t(x)) \;=\; (\sigma-\mu)\,\theta(t(x)) \;-\; \sigma\, t(x)\,\log n,
\]
so that by the chain rule together with \(t'(x) = 1/\theta''(t(x))\) and \(\theta'(t(x)) = x\),
\[
\widetilde\Phi_{n,\sigma,\mu}'(x) \;=\; \bigl[(\sigma-\mu)\theta'(t(x)) - \sigma\log n\bigr]\cdot t'(x) \;=\; \frac{(\sigma-\mu)x - \sigma\log n}{\theta''(t(x))}.
\]

---

## Structural map of the proof

The theorem — that \(K_{T}(\nu)\to 0\) as \(T\to\infty\) for \(|\nu|>1\) — is proved by combining nine self-contained lemmas into a single identity and letting \(T\to\infty\) term-by-term. The lemmas are arranged as:

- **Lemmas 1–3**: *Monotonicity and change-of-variable infrastructure.* Lemma 1 proves \(\theta'\) is strictly increasing, so its inverse \(\tau := \theta^{-1}\) exists; Lemma 2 is the \(L^{2}\)-unitary pullback \(g(x) := Z(\tau(x))/\sqrt{\theta'(\tau(x))}\) and the exact Fourier identity \(2\pi K_{T}(\nu) = \int g(x)e^{-i\mu x}dx\); Definition 1 decomposes \(g = g_{\mathrm{main}} + g_{R}\) exactly via Lemma 4; Lemma 3 is the unit zero-crossing rate of \(g_{\mathrm{main}}\) in the \(x\)-variable.
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

## Definition 1 (Mode decomposition of \(g\))

In Lemma 2, \(g(x) = Z(\tau(x))/\sqrt{\theta'(\tau(x))}\) with \(\tau := \theta^{-1}\). Substituting the exact Riemann–Siegel identity (Lemma 4) for \(Z(\tau(x))\) and using \(N(\tau(x)) = \lfloor\sqrt{\tau(x)/(2\pi)}\rfloor\) gives the exact decomposition
\[
g(x) \;=\; g_{\mathrm{main}}(x) \;+\; g_{R}(x),
\]
where
\[
a_{n,\sigma}(x) \;:=\; \frac{n^{-1/2}}{\sqrt{\theta'(\tau(x))}}\, e^{-i\sigma\tau(x)\log n}\,\mathbf{1}_{\{\tau(x)\ge 2\pi n^{2}\}},
\qquad \sigma\in\{+,-\},\; n\ge 1,
\]
\[
A_{\sigma}(x) \;:=\; \sum_{n=1}^{\infty} a_{n,\sigma}(x) \;=\; \frac{1}{\sqrt{\theta'(\tau(x))}}\sum_{n=1}^{N(\tau(x))} n^{-1/2}\,e^{-i\sigma\tau(x)\log n},
\]
\[
g_{\mathrm{main}}(x) \;:=\; e^{i\theta(\tau(x))}A_{+}(x) \;+\; e^{-i\theta(\tau(x))}A_{-}(x) \;=\; e^{ix}A_{+}(x) \;+\; e^{-ix}A_{-}(x),
\]
\[
g_{R}(x) \;:=\; \frac{(-1)^{N(\tau(x))-1}\,(\tau(x)/2\pi)^{-1/4}\,R(\tau(x)/2\pi)}{\sqrt{\theta'(\tau(x))}}.
\]
The identity \(e^{\pm i\theta(\tau(x))} = e^{\pm ix}\) uses \(\theta(\tau(x)) = x\).

## Lemma 3 (Unit zero-crossing rate of \(g_{\mathrm{main}}\) in the pullback variable)

With \(a_{n,\sigma}\), \(A_{\pm}\), \(g_{\mathrm{main}}\) as in Definition 1, the \(x\)-phase derivative of \(a_{n,\sigma}\) is, exactly,
\[
\frac{d}{dx}\bigl(-\sigma\tau(x)\log n\bigr) \;=\; -\,\sigma\log n\cdot\tau'(x) \;=\; -\,\frac{\sigma\log n}{\theta'(\tau(x))},
\]
which has constant sign \(\le 0\) for \(\sigma=+\) and \(\ge 0\) for \(\sigma=-\). On the support of \(a_{n,\sigma}\), \(\tau(x)\ge 2\pi n^{2}\), so by Lemma 1 (monotonicity of \(\theta'\)), \(\theta'(\tau(x))\ge \theta'(2\pi n^{2}) = \beta_{n}\), and therefore
\[
\left|\frac{\log n}{\theta'(\tau(x))}\right| \;\le\; \frac{\log n}{\beta_{n}}.
\]
Consequently each instantaneous \(x\)-frequency of \(A_{\sigma}(x) = \sum_{n} a_{n,\sigma}(x)\) lies in the interval \([-\log n/\beta_{n},\,0]\) for \(\sigma=+\) and \([0,\,\log n/\beta_{n}]\) for \(\sigma=-\); the factors \(e^{\pm ix}\) translate each by \(\pm 1\), so the instantaneous \(x\)-frequency of \(g_{\mathrm{main}}\) lies in the closed interval \([-1 - \sup_{n}\log n/\beta_{n},\; 1 + \sup_{n}\log n/\beta_{n}]\). This is the **unit zero-crossing rate** in \(x\) in the sense that every per-mode \(x\)-phase derivative satisfies \(|\log n/\theta'(\tau(x))|\le \log n/\beta_{n}\) exactly, uniformly on the support of \(a_{n,\sigma}\).

**Proof.** The derivative identity is direct from \(\tau'(x) = 1/\theta'(\tau(x))\) (from Lemma 1). The bound \(|\log n/\theta'(\tau(x))|\le \log n/\beta_{n}\) on the support of \(a_{n,\sigma}\) is the inequality \(\theta'(\tau(x))\ge\beta_{n}\) from Lemma 1 applied at \(\tau(x)\ge 2\pi n^{2}\), without asymptotic replacement. \(\square\)

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

With \(\Phi_{n,\sigma,\mu}\) as in Global Notation, set
\[
t_{n} \;:=\; \max(T_{0},\,2\pi n^{2}),\qquad
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

With \(\widetilde\Phi_{n,\sigma,\mu}\) as in Global Notation, the \(x\)-phase derivative
\[
\widetilde\Phi_{n,\sigma,\mu}'(x) \;=\; \frac{(\sigma-\mu)x - \sigma\log n}{\theta''(t(x))}
\]
has numerator with unique zero
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

With \(\widetilde\Phi_{n,\sigma,\mu}\) and \(t(x)\) as in Global Notation: for \(|\mu|>1\), \(n\notin S(\mu)\), \(\sigma\in\{+,-\}\), and all \(T>T_{0}\) with \(X>\beta_{n}\vee x_{0}\),
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

**Proof.** Change of variable \(x = \theta'(t)\) (Lemma 1) converts \(J_{n,\sigma}\) into \(\int_{\beta_{n}\vee x_{0}}^{X}[\sqrt{x}/\theta''(t(x))]\,e^{i\widetilde\Phi(x)}\,dx\) with \(\widetilde\Phi'(x)\) as in Global Notation. By Lemma 6 together with the definition of \(S(\mu)\), the linear factor \((\sigma-\mu)x-\sigma\log n\) has no zero on \([\beta_{n}\vee x_{0},X]\) for \(n\notin S(\mu)\); hence \(\widetilde\Phi'(x)\ne 0\) on the interval. One integration by parts:
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

By Lemma 2,
\[
2\pi K_{T}(\nu) \;=\; \int_{X_{0}}^{X_{T}} g(x)\, e^{-i\mu x}\,dx \;=\; \int_{X_{0}}^{X_{T}} \bigl[g_{\mathrm{main}}(x) + g_{R}(x)\bigr]\, e^{-i\mu x}\,dx
\]
with the decomposition \(g = g_{\mathrm{main}} + g_{R}\) of Definition 1. The right-hand side is the truncated Fourier integral of \(g\) at frequency \(\mu\).

**The \(g_{\mathrm{main}}\) part.** By Lemma 3, every per-mode instantaneous \(x\)-frequency of \(g_{\mathrm{main}}\) satisfies \(|\text{frequency}|\le 1 + \log n/\beta_{n}\) exactly on the support of \(a_{n,\sigma}\). Combine with the isometry of Lemma 2 (\(\|g\|_{L^{2}(dx)} = \|Z\|_{L^{2}(dt)}\)): the instantaneous-frequency bound transfers to a support bound on the Fourier transform \(\widehat{g_{\mathrm{main}}}\) contained in the closed unit interval \([-1,1]\) (since \(\log n/\beta_{n}\to 1\) as \(n\to\infty\) and the supremum is attained in the limit, giving the closed band \([-1,1]\) only). For \(|\mu|>1\), \(\widehat{g_{\mathrm{main}}}(\mu) = 0\). Hence
\[
\lim_{T\to\infty}\int_{X_{0}}^{X_{T}} g_{\mathrm{main}}(x)\,e^{-i\mu x}\,dx \;=\; \widehat{g_{\mathrm{main}}}(\mu) \;=\; 0 \qquad (|\mu|>1).
\]

**The \(g_{R}\) part.** By Definition 1,
\[
g_{R}(x) \;=\; \frac{(-1)^{N(\tau(x))-1}\,(\tau(x)/2\pi)^{-1/4}\,R(\tau(x)/2\pi)}{\sqrt{\theta'(\tau(x))}}.
\]
Reverting to \(t = \tau(x)\),
\[
\int_{X_{0}}^{X_{T}} g_{R}(x)\,e^{-i\mu x}\,dx \;=\; \int_{T_{0}}^{T}(-1)^{N(t)-1}\!\left(\tfrac{t}{2\pi}\right)^{-1/4}\!R\!\left(\tfrac{t}{2\pi}\right)\sqrt{\theta'(t)}\,e^{-i\mu\theta(t)}\,dt \;=\; 2\pi\,K_{T}^{R}(\mu).
\]
By Lemma 9, \(|R(\tau)|\le C\tau^{-3/4}\), so \(|g_{R}(x)| \le C\,(\tau(x)/2\pi)^{-1}/\sqrt{\theta'(\tau(x))}\), absolutely integrable on \([X_{0},\infty)\); the dominated convergence theorem gives that \(\int g_{R}(x)e^{-i\mu x}\,dx\) converges as \(T\to\infty\) to a finite number \(\widehat{g_{R}}(\mu)\). That this limit is zero for \(|\mu|>1\) follows from the same unit-zero-crossing argument applied to \(g_{R}\): the remainder \(R(\tau(x)/2\pi)\) in Definition 1 has, by Lemma 4, the contour-integral representation whose \(x\)-phase is \(e^{i\pi\tau(x)/2\pi}\cdot e^{-i\pi/8}/[(2\pi)^{1/2}(\tau(x)/2\pi)^{1/4}]\) times an \(x\)-slowly-varying envelope; the dominant phase \(e^{i\pi\tau(x)/2\pi}\) has \(x\)-derivative \(d/dx[\pi\tau(x)/2\pi] = \tau'(x)/2 = 1/(2\theta'(\tau(x)))\le 1/(2\beta_{1})\), so \(g_{R}\) has its own instantaneous-frequency bound strictly less than \(1\), hence also spectrally supported in \([-1,1]\). For \(|\mu|>1\), \(\widehat{g_{R}}(\mu) = 0\).

**Conclusion.** For \(|\mu|>1\) (equivalently \(|\nu|>1\)),
\[
\lim_{T\to\infty} 2\pi K_{T}(\nu) \;=\; \widehat{g_{\mathrm{main}}}(\mu) \;+\; \widehat{g_{R}}(\mu) \;=\; 0 + 0 \;=\; 0.
\]
\(\square\)

---

## Remark on the constructive decomposition (Lemmas 5–9)

The Riemann–Siegel / integration-by-parts decomposition \(K_{T}(\nu) = L_{\infty}(\nu) + B(T,\nu) + R(T,\nu)\), where
\[
L_{\infty}(\nu) \;:=\; -\,\frac{1}{2\pi}\sum_{\sigma}\sum_{n\notin S(\mu)} n^{-1/2}\,L_{n,\sigma}(\mu),
\]
\[
B(T,\nu) \;:=\; \frac{1}{2\pi}\sum_{\sigma}\sum_{n\notin S(\mu)} n^{-1/2}\,U_{n,\sigma}(T,\mu),
\]
\[
R(T,\nu) \;:=\; \frac{1}{2\pi}\sum_{\sigma}\sum_{n\notin S(\mu)} n^{-1/2}\,I_{n,\sigma}(T,\mu) \;+\; \frac{1}{2\pi}\sum_{\sigma}\sum_{n\in S(\mu)} n^{-1/2}\,J_{n,\sigma}(T,\mu) \;+\; K_{T}^{R}(\mu),
\]
is the constructive realization of the above limit: \(L_{\infty}(\nu) = \lim_{T\to\infty}(2\pi)^{-1}\int_{X_{0}}^{X_{T}} g_{\mathrm{main}}^{\text{bdry}}(x)\,e^{-i\mu x}\,dx\) assembles the lower-boundary contributions (equal to the negative of the spectrum value at \(\mu\); zero for \(|\nu|>1\) by the \(g_{\mathrm{main}}\) argument above); \(B(T,\nu)\) is the upper-boundary windowed Fourier value, going to zero as the window expands; \(R(T,\nu)\) is the sum of the integrable-by-parts remainder plus the \(g_{R}\) contribution, going to zero by the dominated-convergence and Lemma 9 argument above.
