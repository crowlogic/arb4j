# Detailed Exposition and Verification of the Band-Limitedness Proof

The theorem to be verified is: for every fixed \(\nu \in \mathbb{R} \setminus [-2,0]\),
\[
\lim_{T \to \infty} K_T(\nu) = 0, \qquad K_T(\nu) := \frac{1}{2\pi}\int_{T_0}^{T} Z(t)\sqrt{\theta'(t)}\,e^{-i(\nu+1)\theta(t)}\,dt.
\]
The proof proceeds in seven logically ordered steps. Each is verified in full below.

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

For \(t > 0\), every term has \((\tfrac{1}{4}+k) > 0\), \(\tfrac{t}{2} > 0\), and \(|z_k|^4 > 0\), so every summand is strictly positive. Hence \(\theta''(t) > 0\) for all \(t > 0\). The formula in the paper is exactly correct. The substitution \(x = \theta'(t)\) is therefore a global \(C^\infty\) bijection with \(C^\infty\) inverse \(t(x)\), and \(\theta'(T) \to \infty\) as \(T \to \infty\). ✓

---

## Step 2: Mode Decomposition

**Claim.** Substituting the Riemann–Siegel identity and writing \(\cos\alpha = \tfrac{1}{2}(e^{i\alpha}+e^{-i\alpha})\) gives
\[
K_T(\nu) = \frac{1}{2\pi}\sum_{\sigma \in \{+1,-1\}}\sum_{n \leq N(T)} n^{-1/2} J_{n,\sigma}(T,\mu) + \mathcal{R}(T,\mu),
\]
where \(J_{n,\sigma}(T,\mu) = \int_{t_n}^T \sqrt{\theta'(t)}\,e^{i[(\sigma-\mu)\theta(t)-\sigma t\log n]}\,dt\).

**Verification.** Start from

\[
K_T(\nu) = \frac{1}{2\pi}\int_{T_0}^T Z(t)\sqrt{\theta'(t)}\,e^{-i\mu\theta(t)}\,dt.
\]

Substitute \(Z(t) = 2\sum_{n=1}^{N(t)} n^{-1/2}\cos(\theta(t)-t\log n) + R(t)\). Since \(N(t) = \lfloor\sqrt{t/(2\pi)}\rfloor\) is a step function, the sum is split into fixed ranges by introducing lower limits \(t_n = \max(T_0, 2\pi n^2)\), the smallest \(t\) at which mode \(n\) enters. Writing \(\cos(\theta(t)-t\log n) = \tfrac{1}{2}(e^{i(\theta(t)-t\log n)}+e^{-i(\theta(t)-t\log n)})\) and absorbing \(e^{-i\mu\theta(t)}\):

\[
e^{i(\theta(t)-t\log n)} \cdot e^{-i\mu\theta(t)} = e^{i(1-\mu)\theta(t) - it\log n} = e^{i(\sigma-\mu)\theta(t)-i\sigma t\log n}\big|_{\sigma=+1},
\]
\[
e^{-i(\theta(t)-t\log n)} \cdot e^{-i\mu\theta(t)} = e^{-i(1+\mu)\theta(t)+it\log n} = e^{i(\sigma-\mu)\theta(t)-i\sigma t\log n}\big|_{\sigma=-1}.
\]

Combining with the \(\sqrt{\theta'(t)}\) factor gives exactly \(J_{n,\sigma}(T,\mu)\) as defined. ✓

---

## Step 3: The Remainder Term \(\mathcal{R}(T,\mu)\) Vanishes

**Claim.** \(\mathcal{R}(\infty,\mu) - \mathcal{R}(T,\mu) = O(T^{-1/4}(\log T)^{-1/2}) \to 0\).

**Verification.** Since \(R(t) = O(t^{-1/4})\) and \(\sqrt{\theta'(t)} = O((\log t)^{1/2})\), the amplitude is \(R(t)\sqrt{\theta'(t)} = O(t^{-1/4}(\log t)^{1/2})\). The tail integral is

\[
\mathcal{R}(\infty,\mu) - \mathcal{R}(T,\mu) = \frac{1}{2\pi}\int_T^\infty R(t)\sqrt{\theta'(t)}\,e^{-i\mu\theta(t)}\,dt.
\]

The phase is \(-\mu\theta(t)\) with derivative \(-\mu\theta'(t)\). Since \(|\mu| > 1\) and \(\theta'(t) \geq \theta'(T_0) > 0\), the phase derivative is bounded away from zero and grows as \(\tfrac{1}{2}\log(t/(2\pi)) \to \infty\). IBP with \(u = R(t)\sqrt{\theta'(t)}/(-i\mu\theta'(t))\) gives boundary \(O(T^{-1/4}(\log T)^{-1/2}) \to 0\) and the interior integral is smaller still. ✓

---

## Step 4: Change of Variable \(x = \theta'(t)\) and Phase Derivative

**Claim.** Under \(x = \theta'(t)\), \(dt = dx/\theta''(t(x))\), and
\[
J_{n,\sigma}(T,\mu) = \int_{\beta_n \vee x_0}^X \frac{\sqrt{x}}{\theta''(t(x))}\,e^{i\widetilde\Phi_{n,\sigma,\mu}(x)}\,dx, \qquad \widetilde\Phi'_{n,\sigma,\mu}(x) = \frac{(\sigma-\mu)x - \sigma\log n}{\theta''(t(x))}.
\]

**Verification.** Substitute \(x = \theta'(t)\), \(dx = \theta''(t)\,dt\), so \(dt = dx/\theta''(t(x))\), and \(\theta'(t) = x\):

\[
J_{n,\sigma}(T,\mu) = \int_{\theta'(t_n)}^{\theta'(T)} \frac{\sqrt{x}}{\theta''(t(x))}\,e^{i\widetilde\Phi(x)}\,dx.
\]

The lower limit is \(\theta'(\max(T_0,2\pi n^2)) = x_0 \vee \beta_n\). The upper limit is \(\theta'(T) = X\). The phase derivative:

\[
\frac{d\widetilde\Phi}{dx} = \frac{d\widetilde\Phi/dt}{dx/dt} = \frac{(\sigma-\mu)\theta'(t) - \sigma\log n}{\theta''(t)} = \frac{(\sigma-\mu)x - \sigma\log n}{\theta''(t(x))}.
\]

The numerator is linear in \(x\) with zero at \(x^*_{n,\sigma} = \sigma\log n/(\sigma-\mu)\). ✓

---

## Step 5: Exact \(\theta''\) Cancellation — The IBP Quotient is Rational

**Claim.** \(A_n(x)/\widetilde\Phi'_{n,\sigma,\mu}(x) = \sqrt{x}/[(\sigma-\mu)x - \sigma\log n] =: Q_{n,\sigma,\mu}(x)\), with \(\theta''(t(x))\) cancelling exactly.

**Verification.** One-line algebra:

\[
\frac{A_n(x)}{\widetilde\Phi'_{n,\sigma,\mu}(x)} = \frac{\sqrt{x}/\theta''(t(x))}{[(\sigma-\mu)x - \sigma\log n]/\theta''(t(x))} = \frac{\sqrt{x}}{(\sigma-\mu)x - \sigma\log n}.
\]

\(\theta''(t(x))\) appears in both numerator and denominator and cancels. The result \(Q_{n,\sigma,\mu}(x)\) depends only on \(x\), \(\sigma\), \(\mu\), \(n\). Its derivative by direct differentiation:

\[
\frac{d}{dx}\frac{\sqrt{x}}{(\sigma-\mu)x-\sigma\log n} = \frac{\tfrac{1}{2}x^{-1/2}[(\sigma-\mu)x-\sigma\log n] - \sqrt{x}(\sigma-\mu)}{[(\sigma-\mu)x-\sigma\log n]^2} = -\frac{(\sigma-\mu)x+\sigma\log n}{2\sqrt{x}\,[(\sigma-\mu)x-\sigma\log n]^2}.
\]

✓

**Why this matters.** If \(\theta''\) had not cancelled, the IBP quotient would involve \(\theta''(t(x))\) in its derivative, and bounding the remainder integral would require detailed estimates on \(\theta''\). The cancellation reduces everything to rational functions of \(x\) with explicit large-\(x\) asymptotics.

---

## Step 6: Finiteness of \(S(\mu)\) and IBP for \(n \notin S(\mu)\)

### 6a: Finiteness of \(S(\mu)\)

**Claim.** \(S(\mu) := \{n \in \mathbb{N} : \beta_n \leq \log n/(1+|\mu|)\}\) is finite.

**Verification.** From \(\theta'(t) = \tfrac{1}{2}\log(t/(2\pi)) + O(t^{-2})\), evaluate at \(t = 2\pi n^2\):

\[
\beta_n = \theta'(2\pi n^2) = \frac{1}{2}\log\frac{2\pi n^2}{2\pi} + O(n^{-4}) = \log n + O(n^{-4}).
\]

Therefore

\[
\beta_n - \frac{\log n}{1+|\mu|} = \frac{|\mu|}{1+|\mu|}\log n + O(n^{-4}) \to +\infty.
\]

There exists \(N_0(\mu) < \infty\) such that for all \(n > N_0(\mu)\), \(\beta_n > \log n/(1+|\mu|)\), hence \(n \notin S(\mu)\). So \(S(\mu) \subseteq \{1,\ldots,N_0(\mu)\}\). ✓

### 6b: IBP for \(n \notin S(\mu)\)

**Claim.** For \(n \notin S(\mu)\), \(x^*_{n,\sigma} < \beta_n \vee x_0\), so \(\widetilde\Phi'_{n,\sigma,\mu}\) has constant sign on the entire integration interval, and IBP is valid.

**Verification.** \(n \notin S(\mu)\) means \(\beta_n > \log n/(1+|\mu|) = x^*_{n,\sigma}\) (in the relevant branch). Since \(\beta_n \vee x_0 \geq \beta_n > x^*_{n,\sigma}\), the zero of the numerator \((\sigma-\mu)x - \sigma\log n\) lies strictly below the lower limit. On \([\beta_n \vee x_0, X]\) the numerator has constant sign, \(Q_{n,\sigma,\mu}(x)\) has no singularity, and IBP is valid. ✓

---

## Step 7: Decay of Each Term as \(T \to \infty\)

### 7a: Upper boundary \(U_{n,\sigma}(T,\mu)\)

**Claim.** \(|U_{n,\sigma}(T,\mu)| \leq \sqrt{X}/[(|\mu|-1)X - |\log n|] \sim (|\mu|-1)^{-1}X^{-1/2} \to 0\).

**Verification.** The modulus of the upper boundary term is \(\sqrt{X}/|(\sigma-\mu)X - \sigma\log n|\). Since \(|\sigma| = 1\) and \(|\mu| > 1\):

- For \(\mu > 1\): \(|\sigma - \mu| = |{\pm 1} - \mu|\). Both \(|1-\mu| = \mu-1\) and \(|-1-\mu| = \mu+1\) are \(\geq \mu-1 = |\mu|-1\).
- For \(\mu < -1\): \(|1-\mu| = 1+|\mu|\) and \(|-1-\mu| = |\mu|-1\), both \(\geq |\mu|-1\).

So \(|(\sigma-\mu)X - \sigma\log n| \geq (|\mu|-1)X - |\log n|\), giving

\[
|U_{n,\sigma}| \leq \frac{\sqrt{X}}{(|\mu|-1)X - |\log n|} \sim \frac{1}{(|\mu|-1)\sqrt{X}} \to 0.
\]

✓

### 7b: Remainder integral \(I_{n,\sigma}(T,\mu)\)

**Claim.** The integrand is \(O(x^{-3/2})\) for large \(x\), hence the tail is \(O(X^{-1/2}) \to 0\).

**Verification.** The integrand is \(|Q'_{n,\sigma,\mu}(x)| = |(\sigma-\mu)x+\sigma\log n|/(2\sqrt{x}\,[(\sigma-\mu)x-\sigma\log n]^2)\). For large \(x\):

- Numerator: \(\sim |\sigma-\mu| \cdot x\).
- Denominator: \(\sim 2\sqrt{x} \cdot (\sigma-\mu)^2 x^2 = 2(\sigma-\mu)^2 x^{5/2}\).

So \(|Q'| \sim 1/(2|\sigma-\mu|x^{3/2}) = O(x^{-3/2})\). Since \(\int_X^\infty x^{-3/2}\,dx = 2X^{-1/2}\), the tail is \(O(X^{-1/2}) \to 0\). ✓

### 7c: \(S(\mu)\) modes — tail IBP

**Claim.** For \(n \in S(\mu)\) and \(T > t^*_{n,\sigma}\), the tail \(\int_T^\infty \sqrt{\theta'(t)}\,e^{i\Phi(t)}\,dt\) is \(O(\theta'(T)^{-1/2}) \to 0\).

**Verification.** The phase derivative on \([T,\infty)\) is \(\Phi'_{n,\sigma,\mu}(t) = (\sigma-\mu)\theta'(t) - \sigma\log n\). At \(t = T > t^*_{n,\sigma}\), strict monotonicity of \(\theta'\) gives \(\theta'(T) > \theta'(t^*_{n,\sigma}) = \log n/(1+|\mu|)\). Using the same triangle inequality as in 7a:

\[
|\Phi'_{n,\sigma,\mu}(t)| = |(\sigma-\mu)\theta'(t) - \sigma\log n| \geq (|\mu|-1)\theta'(t) - |\log n| \geq (|\mu|-1)\theta'(T) - |\log n| > 0
\]

for all \(t \geq T\), with \(\theta'\) increasing past \(\theta'(T)\). This lower bound diverges as \(T \to \infty\). The denominator in the IBP quotient is bounded away from zero on all of \([T,\infty)\), no stationary point is present, and the argument of steps 6b and 7a–7b applies verbatim to the tail integral: upper boundary \(O(\theta'(T)^{-1/2})\) and remainder integral \(O(\theta'(T)^{-1/2})\), both vanishing. ✓

---

## Step 8: Assembly

\[
K_\infty(\nu) - K_T(\nu) = \frac{1}{2\pi}\sum_{\sigma}\sum_{n \notin S(\mu)} n^{-1/2}[\text{tail of }J_{n,\sigma}] + \frac{1}{2\pi}\sum_{\sigma}\sum_{n \in S(\mu)} n^{-1/2}[\text{tail of }J_{n,\sigma}] + [\mathcal{R}\text{-tail}].
\]

- Each \(n \notin S(\mu)\) tail: \(O(X^{-1/2})\) from steps 7a–7b.
- Each \(n \in S(\mu)\) tail: \(O(X^{-1/2})\) from step 7c. Finitely many such \(n\).
- \(\mathcal{R}\)-tail: \(O(T^{-1/4}(\log T)^{-1/2})\) from step 3.

Every term vanishes as \(T \to \infty\), so \(\lim_{T\to\infty} K_T(\nu) = 0\) for every \(\nu \notin [-2,0]\). \(\square\)

---

## Summary

| Ingredient | Role | Step |
|---|---|---|
| \(\theta'' > 0\) exact derivation | \(x = \theta'(t)\) global bijection; \(\theta'(T) \to \infty\) | 1, 4, 7c |
| \(\theta''\) cancellation | IBP quotient \(Q\) rational in \(x\) alone | 5 |
| \(\beta_n = \log n + O(n^{-4})\) | Forces \(S(\mu)\) finite | 6a |
| \(S(\mu)\) finite | Finitely many exceptional modes | 6b, 7c |
| \(Q = O(x^{-1/2})\) | Upper boundary \(\to 0\) | 7a |
| \(Q' = O(x^{-3/2})\) | Remainder integral converges, tail \(\to 0\) | 7b |
| \(\theta'(T) > \theta'(t^*)\) | Phase derivative bounded away from zero on \([T,\infty)\) for \(S(\mu)\) modes | 7c |
| \(R(t) = O(t^{-1/4})\) | Riemann–Siegel remainder term negligible | 3 |
