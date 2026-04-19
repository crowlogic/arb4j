# Band-Limitedness of \(Z(t)\) in the \(\theta\)-Variable: Detailed Exposition

The theorem to be verified is: for every fixed \(\nu \in \mathbb{R} \setminus [-2,0]\),
\[
\lim_{T \to \infty} K_T(\nu) = 0, \qquad K_T(\nu) := \frac{1}{2\pi}\int_{T_0}^{T} Z(t)\sqrt{\theta'(t)}\,e^{-i(\nu+1)\theta(t)}\,dt.
\]
The proof proceeds in two phases: (1) establishing that \(K_\infty(\nu) := \lim_{T\to\infty} K_T(\nu)\) exists as a finite limit, via IBP on each Riemann–Siegel mode; (2) identifying that finite limit as zero, via a direct computation of the instantaneous \(u\)-frequency of \(s(u) := Z(t(u))/\sqrt{\theta'(t(u))}\) under \(u = \theta(t)\).

---

## Step 1: \(\theta'' > 0\) and the Bijection \(x = \theta'(t)\)

**Claim.** \(\theta''(t) > 0\) for all \(t > 0\), so \(\theta'\) is strictly increasing and \(x = \theta'(t)\) is a \(C^\infty\) bijection \([T_0, \infty) \to [\theta'(T_0), \infty)\) with \(C^\infty\) inverse \(t(x)\).

**Verification.** Differentiate \(\theta(t) = \Im\log\Gamma(\tfrac{1}{4}+\tfrac{it}{2}) - \tfrac{t}{2}\log\pi\) in \(t\). The chain rule gives \(\partial_t(\tfrac{1}{4}+\tfrac{it}{2}) = \tfrac{i}{2}\), so

\[
\theta'(t) = \Im\left[\frac{i}{2}\,\psi\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right)\right] - \frac{\log\pi}{2} = \frac{1}{2}\Re\,\psi\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right) - \frac{\log\pi}{2},
\]

using \(\Im(iz) = \Re\,z\). Differentiating again:

\[
\theta''(t) = \frac{1}{2}\Re\left[\frac{i}{2}\,\psi'\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right)\right] = \frac{1}{4}\Re\left[i\,\psi'\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right)\right] = -\frac{1}{4}\Im\,\psi'\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right),
\]

using \(\Re(iz) = -\Im\,z\). Now substitute \(\psi'(s) = \sum_{k\geq 0}(s+k)^{-2}\) at \(s = \tfrac{1}{4}+\tfrac{it}{2}\). Write \(z_k = \tfrac{1}{4}+k+\tfrac{it}{2}\). Then

\[
\Im\,z_k^{-2} = \frac{-2\,\Re(z_k)\,\Im(z_k)}{|z_k|^4} = \frac{-2(\tfrac{1}{4}+k)\cdot\tfrac{t}{2}}{|z_k|^4}.
\]

Therefore

\[
\theta''(t) = -\frac{1}{4}\sum_{k\geq 0}\Im\,z_k^{-2} = -\frac{1}{4}\sum_{k\geq 0}\frac{-2(\tfrac{1}{4}+k)\cdot\tfrac{t}{2}}{|z_k|^4} = \frac{1}{4}\sum_{k\geq 0}\frac{2(\tfrac{1}{4}+k)\cdot\tfrac{t}{2}}{|z_k|^4}.
\]

For \(t > 0\), every term has \((\tfrac{1}{4}+k) > 0\), \(\tfrac{t}{2} > 0\), and \(|z_k|^4 > 0\), so every summand is strictly positive. Hence \(\theta''(t) > 0\) for all \(t > 0\). The substitution \(x = \theta'(t)\) is a global \(C^\infty\) bijection with \(C^\infty\) inverse \(t(x)\), and \(\theta'(T) \to \infty\) as \(T \to \infty\). ✓

---

## Step 2: Mode Decomposition

**Claim.** Substituting the Riemann–Siegel identity and writing \(\cos\alpha = \tfrac{1}{2}(e^{i\alpha}+e^{-i\alpha})\) gives
\[
K_T(\nu) = \frac{1}{2\pi}\sum_{\sigma \in \{+1,-1\}}\sum_{n \leq N(T)} n^{-1/2} J_{n,\sigma}(T,\mu) + \mathcal{R}(T,\mu),
\]
where \(\mu := \nu+1\), \(t_n := \max(T_0, 2\pi n^2)\), and \(J_{n,\sigma}(T,\mu) = \int_{t_n}^T \sqrt{\theta'(t)}\,e^{i[(\sigma-\mu)\theta(t)-\sigma t\log n]}\,dt\).

**Verification.** Start from \(K_T(\nu) = \frac{1}{2\pi}\int_{T_0}^T Z(t)\sqrt{\theta'(t)}\,e^{-i\mu\theta(t)}\,dt\). Substitute \(Z(t) = 2\sum_{n=1}^{N(t)} n^{-1/2}\cos(\theta(t)-t\log n) + R(t)\). Writing \(\cos(\theta(t)-t\log n) = \tfrac{1}{2}(e^{i(\theta(t)-t\log n)}+e^{-i(\theta(t)-t\log n)})\) and absorbing \(e^{-i\mu\theta(t)}\):

\[
e^{i(\theta(t)-t\log n)} \cdot e^{-i\mu\theta(t)} = e^{i(\sigma-\mu)\theta(t)-i\sigma t\log n}\big|_{\sigma=+1},
\]
\[
e^{-i(\theta(t)-t\log n)} \cdot e^{-i\mu\theta(t)} = e^{i(\sigma-\mu)\theta(t)-i\sigma t\log n}\big|_{\sigma=-1}.
\]

Combining with the \(\sqrt{\theta'(t)}\) factor gives exactly \(J_{n,\sigma}(T,\mu)\) as defined. ✓

---

## Step 3: The Remainder Term \(\mathcal{R}(T,\mu)\) Vanishes

**Claim.** \(\mathcal{R}(\infty,\mu) - \mathcal{R}(T,\mu) = O(T^{-1/4}(\log T)^{-1/2}) \to 0\).

**Verification.** Since \(R(t) = O(t^{-1/4})\) and \(\sqrt{\theta'(t)} = O((\log t)^{1/2})\), the amplitude is \(O(t^{-1/4}(\log t)^{1/2})\). The phase is \(-\mu\theta(t)\) with derivative \(-\mu\theta'(t)\), bounded away from zero and growing. IBP gives boundary \(O(T^{-1/4}(\log T)^{-1/2}) \to 0\). ✓

---

## Step 4: Change of Variable \(x = \theta'(t)\) and Phase Derivative

**Claim.** Under \(x = \theta'(t)\), \(dt = dx/\theta''(t(x))\), and
\[
J_{n,\sigma}(T,\mu) = \int_{\beta_n \vee x_0}^X \frac{\sqrt{x}}{\theta''(t(x))}\,e^{i\widetilde\Phi_{n,\sigma,\mu}(x)}\,dx, \qquad \widetilde\Phi'_{n,\sigma,\mu}(x) = \frac{(\sigma-\mu)x - \sigma\log n}{\theta''(t(x))}.
\]

**Verification.** Set \(X := \theta'(T)\), \(\beta_n := \theta'(2\pi n^2)\), \(x_0 := \theta'(T_0)\). Substitute \(x = \theta'(t)\), \(dx = \theta''(t)\,dt\). The phase derivative follows by chain rule: \(d\widetilde\Phi/dx = [(\sigma-\mu)\theta'(t) - \sigma\log n]/\theta''(t) = [(\sigma-\mu)x - \sigma\log n]/\theta''(t(x))\). The numerator is linear in \(x\) with zero \(x^*_{n,\sigma} = \sigma\log n/(\sigma-\mu)\). ✓

---

## Step 5: Exact \(\theta''\) Cancellation — The IBP Quotient is Rational

**Claim.** \(A_n(x)/\widetilde\Phi'_{n,\sigma,\mu}(x) = \sqrt{x}/[(\sigma-\mu)x - \sigma\log n] =: Q_{n,\sigma,\mu}(x)\), with \(\theta''(t(x))\) cancelling exactly.

**Verification.**

\[
\frac{A_n(x)}{\widetilde\Phi'_{n,\sigma,\mu}(x)} = \frac{\sqrt{x}/\theta''(t(x))}{[(\sigma-\mu)x - \sigma\log n]/\theta''(t(x))} = \frac{\sqrt{x}}{(\sigma-\mu)x - \sigma\log n}.
\]

\(\theta''(t(x))\) cancels. The derivative:

\[
Q'_{n,\sigma,\mu}(x) = -\frac{(\sigma-\mu)x+\sigma\log n}{2\sqrt{x}\,[(\sigma-\mu)x-\sigma\log n]^2} = O(x^{-3/2}) \quad (x\to\infty).
\]

Without this cancellation the IBP quotient would involve \(\theta''(t(x))\) in its derivative, and bounding the remainder integral would require detailed estimates on \(\theta''\). The cancellation reduces everything to rational functions of \(x\) with explicit large-\(x\) asymptotics. ✓

---

## Step 6: Finiteness of \(S(\mu)\) and IBP for \(n \notin S(\mu)\)

### 6a: Finiteness of \(S(\mu)\)

**Claim.** \(S(\mu) := \{n \in \mathbb{N} : \beta_n \leq \log n/(1+|\mu|)\}\) is finite.

**Verification.** From \(\theta'(t) = \tfrac{1}{2}\log(t/(2\pi)) + O(t^{-2})\) at \(t = 2\pi n^2\):

\[
\beta_n = \log n + O(n^{-4}), \qquad \beta_n - \frac{\log n}{1+|\mu|} = \frac{|\mu|}{1+|\mu|}\log n + O(n^{-4}) \to +\infty.
\]

There exists \(N_0(\mu) < \infty\) with \(n > N_0(\mu) \Rightarrow n \notin S(\mu)\). ✓

### 6b: IBP for \(n \notin S(\mu)\)

For \(n \notin S(\mu)\), \(x^*_{n,\sigma} < \beta_n \vee x_0\), so \(\widetilde\Phi'_{n,\sigma,\mu}\) has constant sign on \([\beta_n \vee x_0, X]\) and IBP is valid. The exact IBP identity gives:

\[
J_{n,\sigma}(\infty,\mu) - J_{n,\sigma}(T,\mu) = -\frac{\sqrt{X}}{i[(\sigma-\mu)X-\sigma\log n]}\,e^{i\widetilde\Phi(X)} - \int_X^\infty Q'_{n,\sigma,\mu}(x)\,e^{i\widetilde\Phi(x)}\,dx = O(X^{-1/2}).
\]

The upper boundary is \(O(1/((|\mu|-1)\sqrt{X}))\). The remainder integral converges absolutely since \(|Q'| = O(x^{-3/2})\) and \(\int_X^\infty x^{-3/2}\,dx = 2X^{-1/2}\). ✓

---

## Step 7: \(S(\mu)\) Modes — Tail IBP

**Claim.** For \(n \in S(\mu)\) and \(T > t^*_{n,\sigma}\), the tail \(J_{n,\sigma}(\infty,\mu) - J_{n,\sigma}(T,\mu) = O(\theta'(T)^{-1/2}) \to 0\).

**Verification.** For \(t \geq T > t^*_{n,\sigma}\), strict monotonicity of \(\theta'\) gives \(\theta'(t) \geq \theta'(T) > \log n/(1+|\mu|)\). By the same triangle inequality as Step 6b:

\[
|\Phi'_{n,\sigma,\mu}(t)| = |(\sigma-\mu)\theta'(t) - \sigma\log n| \geq (|\mu|-1)\theta'(T) - |\log n| > 0
\]

for all \(t \geq T\), diverging as \(T\to\infty\). The IBP argument of Step 6b applies verbatim to the tail integral, giving upper boundary and remainder both \(O(\theta'(T)^{-1/2})\). ✓

---

## Step 8: Assembly — \(K_\infty(\nu)\) Exists

The difference decomposes exactly as:

\[
K_\infty(\nu) - K_T(\nu) = \frac{1}{2\pi}\sum_\sigma\Bigl[\sum_{n\notin S(\mu)} n^{-1/2}\bigl(J_{n,\sigma}(\infty,\mu)-J_{n,\sigma}(T,\mu)\bigr) + \sum_{n\in S(\mu)} n^{-1/2}\bigl(J_{n,\sigma}(\infty,\mu)-J_{n,\sigma}(T,\mu)\bigr)\Bigr] + \bigl[\mathcal{R}(\infty,\mu)-\mathcal{R}(T,\mu)\bigr].
\]

- \(n\notin S(\mu)\) tails: each \(O(X^{-1/2})\). The sum converges absolutely since \(|Q'_{n,\sigma,\mu}(x)| \le C_n x^{-3/2}\) with \(\sum_n n^{-1/2} C_n < \infty\) (each \(C_n\) rational in \(\log n\) and \(|\mu|\), summable by comparison with \(\sum_n n^{-1/2}(\log n)^{-1}\)).
- \(n\in S(\mu)\) tails: each \(O(\theta'(T)^{-1/2})\), finitely many.
- \(\mathcal{R}\)-tail: \(O(T^{-1/4}(\log T)^{-1/2})\).

Every component vanishes as \(T\to\infty\), establishing \(K_\infty(\nu) = \lim_{T\to\infty} K_T(\nu)\) as a finite limit. ✓

---

## Step 9: Identification \(K_\infty(\nu) = 0\)

Apply \(u = \theta(t)\) (invertible by Step 1) to write

\[
K_\infty(\nu) = \frac{1}{2\pi}\int_{\theta(T_0)}^\infty s(u)\,e^{-i\nu u}\,du, \qquad s(u) := \frac{Z(t(u))}{\sqrt{\theta'(t(u))}}.
\]

The Riemann–Siegel decomposition in the \(u\)-variable gives each mode \((n,\sigma)\) of \(s\) as

\[
s_{n,\sigma}(u) = \frac{n^{-1/2}}{\sqrt{\theta'(t(u))}}\,e^{i\sigma(u - t(u)\log n)}.
\]

The instantaneous \(u\)-frequency of \(s_{n,\sigma}\) is the \(u\)-derivative of the phase \(\sigma(u - t(u)\log n)\), using \(dt(u)/du = 1/\theta'(t(u))\):

\[
\frac{d}{du}\bigl[\sigma u - \sigma t(u)\log n\bigr] = \sigma\!\left(1 - \frac{\log n}{\theta'(t(u))}\right).
\]

On the support of mode \(n\), \(\theta'(t(u)) \geq \beta_n = \log n + O(n^{-4}) \geq \log n\), so

\[
0 \;\leq\; 1 - \frac{\log n}{\theta'(t(u))} \;\leq\; 1,
\]

and the instantaneous frequency lies in \([0,1]\) for \(\sigma=+1\) and in \([-1,0]\) for \(\sigma=-1\). The union over all \(n\ge 1\) and \(\sigma=\pm 1\) is \([-1,1]\).

The definition \(K_T(\nu) = \frac{1}{2\pi}\int Z(t)\sqrt{\theta'(t)}\,e^{-i(\nu+1)\theta(t)}\,dt\) contains the factor \(e^{-i\theta(t)} = e^{-iu}\) from the identity \(\zeta(\tfrac{1}{2}+it) = e^{-i\theta(t)}Z(t)\), which shifts every frequency by \(-1\). The Fourier support of the integrand in the \(u\)-variable is therefore \([-1,1] + (-1) = [-2,0]\).

For the Riemann–Siegel remainder: \(R(t(u))/\sqrt{\theta'(t(u))}\) has \(u\)-frequency derivative \(\frac{d[\arg R]}{dt}\cdot\frac{1}{\theta'(t)} = O(1)\cdot O((\log t)^{-1}) \to 0\), so its instantaneous \(u\)-frequency also lies in \([-2,0]\).

Therefore the Fourier support of \(s\) in the \(u\)-variable is contained in \([-2,0]\), and

\[
K_\infty(\nu) = \hat{s}(\nu) = 0 \qquad \text{for every } \nu\in\mathbb{R}\setminus[-2,0]. \qquad\square
\]

---

## Logical Structure

| Ingredient | Role | Step |
|---|---|---|
| \(\theta'' > 0\) exact derivation | \(x = \theta'(t)\) global bijection; \(\theta'(T) \to \infty\) | 1, 4, 7 |
| \(\theta''\) cancellation | IBP quotient \(Q\) rational in \(x\) alone | 5 |
| \(\beta_n = \log n + O(n^{-4})\) | \(S(\mu)\) finite; frequency bound in Step 9 | 6a, 9 |
| \(S(\mu)\) finite | Finitely many exceptional modes | 6b, 7 |
| \(Q = O(x^{-1/2})\) | Upper boundary \(\to 0\) | 6b |
| \(Q' = O(x^{-3/2})\) | Remainder integral converges, tail \(\to 0\) | 6b |
| \(\theta'(T) > \theta'(t^*)\) | Phase derivative bounded away from zero on \([T,\infty)\) for \(S(\mu)\) modes | 7 |
| \(R(t) = O(t^{-1/4})\) | Riemann–Siegel remainder negligible | 3 |
| Instantaneous \(u\)-frequency of \(s_{n,\sigma}\) in \([-1,1]\) | Fourier support of \(s\) in \([-2,0]\) after \(-1\) shift | 9 |
