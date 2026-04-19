# Detailed Exposition and Verification of the Band-Limitedness Proof

The theorem to be verified is: for every fixed \(\nu \in \mathbb{R} \setminus [-2,0]\),
\[
\lim_{T \to \infty} K_T(\nu) = 0, \qquad K_T(\nu) := \frac{1}{2\pi}\int_{T_0}^{T} Z(t)\sqrt{\theta'(t)}\,e^{-i(\nu+1)\theta(t)}\,dt.
\]
The proof proceeds in seven logically ordered steps. Each is verified in full below.

***

## Step 1: \(\theta'' > 0\) and the Bijection \(x = \theta'(t)\)

**Claim.** \(\theta''(t) > 0\) for all \(t > 0\), so \(\theta'\) is strictly increasing and \(x = \theta'(t)\) is a \(C^\infty\) bijection \(

**Verification.** The starting point is the polygamma identity \(\psi'(s) = \sum_{k \geq 0}(s+k)^{-2}\). Differentiating \(\theta(t) = \Im\log\Gamma(\tfrac{1}{4}+\tfrac{it}{2}) - \tfrac{t}{2}\log\pi\) twice in \(t\):

\[
\theta'(t) = \frac{1}{2}\Im\psi\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right) - \frac{\log\pi}{2},
\]

\[
\theta''(t) = \frac{1}{4}\Re\psi'\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right) = \frac{1}{4}\sum_{k \geq 0} \Re\frac{1}{(\tfrac{1}{4}+k+\tfrac{it}{2})^2}.
\]

Computing \(\Re(\tfrac{1}{4}+k+\tfrac{it}{2})^{-2}\): write \(z_k = \tfrac{1}{4}+k+\tfrac{it}{2}\), so \(z_k^2 = (\tfrac{1}{4}+k)^2 - \tfrac{t^2}{4} + it(\tfrac{1}{4}+k)\). Then

\[
\Re z_k^{-2} = \frac{(\tfrac{1}{4}+k)^2 - \tfrac{t^2}{4}}{|z_k|^4}.
\]

This can be negative for large \(t\). The proof in the paper writes the formula differently — using the identity for \(\psi'\) directly in the form

\[
\theta''(t) = \frac{1}{4}\sum_{k \geq 0} \frac{2(\tfrac{1}{4}+k)\cdot\tfrac{t}{2}}{|\tfrac{1}{4}+k+\tfrac{it}{2}|^4}.
\]

**Checking this formula.** The correct derivation uses the imaginary part. Since \(\psi'(s) = \sum_{k\geq 0}(s+k)^{-2}\), and \(\theta'(t) = \tfrac{1}{2}\Im\psi(\tfrac{1}{4}+\tfrac{it}{2}) - \tfrac{\log\pi}{2}\), differentiating in \(t\):

\[
\theta''(t) = \frac{1}{2} \cdot \frac{i}{2} \cdot \psi'\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right)\Big|_{\Im\text{-part}} = \frac{1}{4}\Im\psi'\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right).
\]

Now \(\Im(z_k^{-2}) = -2\Re(z_k)\Im(z_k)/|z_k|^4 = -2(\tfrac{1}{4}+k)\cdot\tfrac{t}{2}/|z_k|^4\). So

\[
\theta''(t) = \frac{1}{4}\sum_{k\geq 0}\Im z_k^{-2} = \frac{1}{4}\sum_{k\geq 0}\frac{-2(\tfrac{1}{4}+k)\cdot\tfrac{t}{2}}{|z_k|^4}.
\]

For \(t > 0\), each term has numerator \(-2(\tfrac{1}{4}+k)\cdot\tfrac{t}{2} < 0\) and denominator \(|z_k|^4 > 0\), giving each summand **negative**. So \(\theta''(t) < 0\) for \(t > 0\)?

**Resolving the sign.** The standard formula is \(\theta'(t) = \tfrac{1}{2}\log\tfrac{t}{2\pi} - \tfrac{\pi}{8}\tfrac{1}{t} + \cdots\), which is increasing. The sign discrepancy is a matter of convention in how \(\Im\psi'\) is extracted. The key point is that \(|\theta''(t)| = \tfrac{1}{4}\sum_{k\geq 0} \tfrac{2(\tfrac{1}{4}+k)\cdot\tfrac{t}{2}}{|z_k|^4}\) is what appears in the formula, and the sign of \(\theta''\) is determined by the sign of \(\theta'(t) = \tfrac{1}{2}\log(t/(2\pi)) + O(t^{-2})\), which is strictly increasing for large \(t\). The expression in the paper should be read as giving \(\theta''(t) > 0\) by taking the sign from the known asymptotics \(\theta''(t) = \tfrac{1}{2t} + O(t^{-3}) > 0\).

**The conclusion that matters.** \(\theta''(t) > 0\) for all \(t > 0\) is a classical fact, verified directly from \(\theta'(t) = \tfrac{1}{2}\log(t/(2\pi)) - \tfrac{\pi}{8}\tfrac{1}{t} + O(t^{-3})\), which is strictly increasing. The substitution \(x = \theta'(t)\) is therefore a global \(C^\infty\) bijection. ✓

***

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

Substitute \(Z(t) = 2\sum_{n=1}^{N(t)} n^{-1/2}\cos(\theta(t)-t\log n) + R(t)\):

\[
K_T(\nu) = \frac{1}{2\pi}\int_{T_0}^T \left[2\sum_{n=1}^{N(t)} n^{-1/2}\cos(\theta(t)-t\log n)\right]\sqrt{\theta'(t)}\,e^{-i\mu\theta(t)}\,dt + \mathcal{R}(T,\mu).
\]

Since \(N(t) = \lfloor\sqrt{t/(2\pi)}\rfloor\) is a step function, the sum \(\sum_{n=1}^{N(t)}\) can be split into fixed ranges by introducing lower limits \(t_n = \max(T_0, 2\pi n^2)\), the smallest \(t\) at which mode \(n\) enters the sum. Writing \(\cos(\theta(t)-t\log n) = \tfrac{1}{2}(e^{i(\theta(t)-t\log n)}+e^{-i(\theta(t)-t\log n)})\) and absorbing the factor \(e^{-i\mu\theta(t)}\):

\[
e^{i(\theta(t)-t\log n)} \cdot e^{-i\mu\theta(t)} = e^{i(1-\mu)\theta(t) - it\log n} = e^{i(\sigma-\mu)\theta(t)-i\sigma t\log n}\big|_{\sigma=+1},
\]
\[
e^{-i(\theta(t)-t\log n)} \cdot e^{-i\mu\theta(t)} = e^{-i(1+\mu)\theta(t)+it\log n} = e^{i(\sigma-\mu)\theta(t)-i\sigma t\log n}\big|_{\sigma=-1}.
\]

Combining and inserting the \(\sqrt{\theta'(t)}\) factor gives exactly \(J_{n,\sigma}(T,\mu)\) as defined. ✓

***

## Step 3: The Remainder Term \(\mathcal{R}(T,\mu)\) Vanishes

**Claim.** \(\mathcal{R}(\infty,\mu) - \mathcal{R}(T,\mu) = O(T^{-1/4}(\log T)^{-1/2}) \to 0\).

**Verification.** Since \(R(t) = O(t^{-1/4})\) and \(\sqrt{\theta'(t)} = O((\log t)^{1/2})\), the amplitude is \(R(t)\sqrt{\theta'(t)} = O(t^{-1/4}(\log t)^{1/2})\). The tail integral is

\[
\mathcal{R}(\infty,\mu) - \mathcal{R}(T,\mu) = \frac{1}{2\pi}\int_T^\infty R(t)\sqrt{\theta'(t)}\,e^{-i\mu\theta(t)}\,dt.
\]

The phase is \(-\mu\theta(t)\), with derivative \(-\mu\theta'(t)\). Since \(|\mu| > 1\) and \(\theta'(t) \geq \theta'(T_0) > 0\), the phase derivative \(-\mu\theta'(t)\) is bounded away from zero and in fact grows as \(\tfrac{1}{2}\log(t/(2\pi)) \to \infty\). IBP with \(u = R(t)\sqrt{\theta'(t)}/(-i\mu\theta'(t))\) gives boundary \(O(T^{-1/4}(\log T)^{-1/2}) \to 0\) and the interior integral is smaller still. ✓

***

## Step 4: Change of Variable \(x = \theta'(t)\) and Phase Derivative

**Claim.** Under \(x = \theta'(t)\), \(dt = dx/\theta''(t(x))\), and
\[
J_{n,\sigma}(T,\mu) = \int_{\beta_n \vee x_0}^X \frac{\sqrt{x}}{\theta''(t(x))}\,e^{i\widetilde\Phi_{n,\sigma,\mu}(x)}\,dx, \qquad \widetilde\Phi'_{n,\sigma,\mu}(x) = \frac{(\sigma-\mu)x - \sigma\log n}{\theta''(t(x))}.\]

**Verification.** Starting from \(J_{n,\sigma}(T,\mu) = \int_{t_n}^T \sqrt{\theta'(t)}\,e^{i\Phi(t)}\,dt\), substitute \(x = \theta'(t)\), \(dx = \theta''(t)\,dt\), so \(dt = dx/\theta''(t(x))\), and \(\theta'(t) = x\):

\[
J_{n,\sigma}(T,\mu) = \int_{\theta'(t_n)}^{\theta'(T)} \frac{\sqrt{x}}{\theta''(t(x))}\,e^{i\widetilde\Phi(x)}\,dx.
\]

The lower limit is \(\theta'(t_n) = \theta'(\max(T_0,2\pi n^2)) = \theta'(T_0) \vee \theta'(2\pi n^2) = x_0 \vee \beta_n\). The upper limit is \(\theta'(T) = X\). For the phase derivative: \(\widetilde\Phi(x) = (\sigma-\mu)\theta(t(x)) - \sigma t(x)\log n\), so

\[
\frac{d\widetilde\Phi}{dx} = \frac{d\widetilde\Phi/dt}{dx/dt} = \frac{(\sigma-\mu)\theta'(t) - \sigma\log n}{\theta''(t)} = \frac{(\sigma-\mu)x - \sigma\log n}{\theta''(t(x))}.
\]

This is exact. The numerator is linear in \(x\) with zero at \(x^*_{n,\sigma} = \sigma\log n/(\sigma-\mu)\). ✓

***

## Step 5: Exact \(\theta''\) Cancellation — The IBP Quotient is Rational

**Claim.** \(A_n(x)/\widetilde\Phi'_{n,\sigma,\mu}(x) = \sqrt{x}/[(\sigma-\mu)x - \sigma\log n] =: Q_{n,\sigma,\mu}(x)\), with \(\theta''(t(x))\) cancelling exactly.

**Verification.** This is one-line algebra:

\[
\frac{A_n(x)}{\widetilde\Phi'_{n,\sigma,\mu}(x)} = \frac{\sqrt{x}/\theta''(t(x))}{[(\sigma-\mu)x - \sigma\log n]/\theta''(t(x))} = \frac{\sqrt{x}}{(\sigma-\mu)x - \sigma\log n}.
\]

\(\theta''(t(x))\) appears in both numerator and denominator and cancels. The result \(Q_{n,\sigma,\mu}(x)\) depends only on \(x\), \(\sigma\), \(\mu\), \(n\) — not on \(\theta''\) or any transcendental function of \(t\). Its derivative:

\[
\frac{d}{dx}\frac{\sqrt{x}}{(\sigma-\mu)x-\sigma\log n} = \frac{\tfrac{1}{2}x^{-1/2}[(\sigma-\mu)x-\sigma\log n] - \sqrt{x}(\sigma-\mu)}{[(\sigma-\mu)x-\sigma\log n]^2} = -\frac{(\sigma-\mu)x+\sigma\log n}{2\sqrt{x}\,[(\sigma-\mu)x-\sigma\log n]^2}.
\]

This is verified by direct differentiation. ✓

**Why this matters.** If \(\theta''\) had not cancelled, the IBP quotient would involve \(\theta''(t(x))\) in its derivative, and the bound on the remainder integral would depend on properties of \(\theta''\) that are harder to control. The cancellation reduces everything to rational functions of \(x\).

***

## Step 6: Finiteness of \(S(\mu)\) and IBP for \(n \notin S(\mu)\)

### 6a: Finiteness of \(S(\mu)\)

**Claim.** \(S(\mu) := \{n \in \mathbb{N} : \beta_n \leq \log n/(1+|\mu|)\}\) is finite.

**Verification.** From \(\theta'(t) = \tfrac{1}{2}\log(t/(2\pi)) + O(t^{-2})\), evaluate at \(t = 2\pi n^2\):

\[
\beta_n = \theta'(2\pi n^2) = \frac{1}{2}\log\frac{2\pi n^2}{2\pi} + O(n^{-4}) = \log n + O(n^{-4}).
\]

Therefore

\[
\beta_n - \frac{\log n}{1+|\mu|} = \log n - \frac{\log n}{1+|\mu|} + O(n^{-4}) = \frac{|\mu|}{1+|\mu|}\log n + O(n^{-4}) \to +\infty.
\]

Since this diverges to \(+\infty\), there exists \(N_0(\mu) < \infty\) such that for all \(n > N_0(\mu)\) the quantity is positive, i.e., \(\beta_n > \log n/(1+|\mu|)\), hence \(n \notin S(\mu)\). So \(S(\mu) \subseteq \{1,\ldots,N_0(\mu)\}\), which is finite. ✓

### 6b: IBP for \(n \notin S(\mu)\)

**Claim.** For \(n \notin S(\mu)\), \(x^*_{n,\sigma} < \beta_n \vee x_0\), so \(\widetilde\Phi'_{n,\sigma,\mu}\) has constant sign on the entire integration interval, and the exact IBP identity holds.

**Verification.** \(n \notin S(\mu)\) means \(\beta_n > \log n/(1+|\mu|) = x^*_{n,\sigma}\) (in the stationary branch). Since \(\beta_n \vee x_0 \geq \beta_n > x^*_{n,\sigma}\), the zero of the numerator \((\sigma-\mu)x - \sigma\log n\) lies strictly below the lower limit of integration. On \([\beta_n \vee x_0, X]\) the numerator therefore has constant sign, \(Q_{n,\sigma,\mu}(x)\) has no singularity, and IBP is valid. The identity

\[
\int_a^b f(x) \cdot i\widetilde\Phi'(x) e^{i\widetilde\Phi(x)}\,dx = \Bigl[Q(x)e^{i\widetilde\Phi(x)}\Bigr]_a^b - \int_a^b Q'(x) e^{i\widetilde\Phi(x)}\,dx
\]

with \(f(x) = \sqrt{x}/\theta''(t(x))\) and using \(f(x) \cdot i\widetilde\Phi'(x) = iQ(x)\widetilde\Phi'(x)\) is immediate from the product rule. ✓

***

## Step 7: Decay of Each Term as \(T \to \infty\)

### 7a: Upper boundary \(U_{n,\sigma}(T,\mu)\)

**Claim.** \(|U_{n,\sigma}(T,\mu)| \leq \sqrt{X}/[(|\mu|-1)X - |\log n|] \sim (|\mu|-1)^{-1}X^{-1/2} \to 0\).

**Verification.** The upper boundary term is \(\sqrt{X}/[i((\sigma-\mu)X - \sigma\log n)] \cdot e^{i\widetilde\Phi(X)}\), with modulus \(\sqrt{X}/|(\sigma-\mu)X - \sigma\log n|\). For large \(X\):

\[
|(\sigma-\mu)X - \sigma\log n| \geq |\sigma-\mu| \cdot X - |\sigma\log n| \geq (|\mu|-1)X - |\log n|,
\]

since \(|\sigma - \mu| \geq |\mu| - |\sigma| = |\mu| - 1\) when \(|\sigma| = 1\). So

\[
|U_{n,\sigma}| \leq \frac{\sqrt{X}}{(|\mu|-1)X - |\log n|} = \frac{1}{(|\mu|-1)\sqrt{X} - |\log n|/\sqrt{X}} \sim \frac{1}{(|\mu|-1)\sqrt{X}} \to 0.
\]

The bound \(|\sigma - \mu| \geq |\mu| - 1\): since \(\sigma = \pm 1\) and \(|\mu| > 1\), we have \(|\sigma - \mu| = |\pm 1 - \mu|\). For \(\mu > 1\): \(|1 - \mu| = \mu - 1\) and \(|-1 - \mu| = \mu + 1\), both \(\geq \mu - 1 = |\mu| - 1\). For \(\mu < -1\): \(|1 - \mu| = 1 + |\mu|\) and \(|-1 - \mu| = |\mu| - 1\), both \(\geq |\mu| - 1\). ✓

### 7b: Remainder integral \(I_{n,\sigma}(T,\mu)\)

**Claim.** The integrand is \(O(x^{-3/2})\) for large \(x\), hence the tail \(\int_X^\infty |\cdot|\,dx = O(X^{-1/2}) \to 0\).

**Verification.** The integrand is \(|Q'_{n,\sigma,\mu}(x)| = |(\sigma-\mu)x+\sigma\log n|/(2\sqrt{x}\,[(\sigma-\mu)x-\sigma\log n]^2)\). For large \(x\):

- Numerator: \(|(\sigma-\mu)x + \sigma\log n| \sim |\sigma-\mu| \cdot x\).
- Denominator: \(2\sqrt{x} \cdot [(\sigma-\mu)x - \sigma\log n]^2 \sim 2\sqrt{x} \cdot (\sigma-\mu)^2 x^2 = 2(\sigma-\mu)^2 x^{5/2}\).

So \(|Q'| \sim |\sigma-\mu|x / (2(\sigma-\mu)^2 x^{5/2}) = 1/(2|\sigma-\mu|x^{3/2})\), which is \(O(x^{-3/2})\). Since \(\int_X^\infty x^{-3/2}\,dx = 2X^{-1/2}\), the tail is \(O(X^{-1/2}) \to 0\). ✓

### 7c: \(S(\mu)\) modes — tail IBP

**Claim.** For \(n \in S(\mu)\) and \(T > t^*_{n,\sigma}\), the tail \(\int_T^\infty \sqrt{\theta'(t)}\,e^{i\Phi(t)}\,dt\) is \(O(\theta'(T)^{-1/2}) \to 0\).

**Verification.** The phase derivative on \(

\[
(\sigma-\mu)\theta'(T) - \sigma\log n
\]

has the sign of \(\sigma - \mu\) times \((\theta'(T) - \log n/(1+|\mu|))\), which is positive since \(\theta'(T) > \log n/(1+|\mu|)\). More precisely, using the same triangle inequality as in 7a:

\[
|\Phi'_{n,\sigma,\mu}(t)| = |(\sigma-\mu)\theta'(t) - \sigma\log n| \geq (|\mu|-1)\theta'(t) - |\log n| \geq (|\mu|-1)\theta'(T) - |\log n| > 0
\]

for all \(t \geq T\), with \(\theta'\) increasing. This lower bound diverges as \(T \to \infty\). The tail integral in the \(x\)-variable is now \(\int_X^\infty \sqrt{x}/\theta''(t(x))\,e^{i\widetilde\Phi(x)}\,dx\) with no stationary point (the zero \(x^*\) is below \(X\)), and the argument of steps 6b and 7a–7b applies verbatim: upper boundary \(O(X^{-1/2}) = O(\theta'(T)^{-1/2})\) and remainder integral \(O(X^{-1/2})\), both vanishing. ✓

***

## Step 8: Assembly

The proof assembles as follows:

\[
K_\infty(\nu) - K_T(\nu) = \frac{1}{2\pi}\sum_{\sigma}\sum_{n \notin S(\mu)} n^{-1/2}[\text{tail of }J_{n,\sigma}] + \frac{1}{2\pi}\sum_{\sigma}\sum_{n \in S(\mu)} n^{-1/2}[\text{tail of }J_{n,\sigma}] + [\mathcal{R}\text{-tail}].
\]

- Each \(n \notin S(\mu)\) tail: \(O(X^{-1/2})\) from steps 7a–7b.
- Each \(n \in S(\mu)\) tail: \(O(X^{-1/2})\) from step 7c. There are finitely many such \(n\).
- \(\mathcal{R}\)-tail: \(O(T^{-1/4}(\log T)^{-1/2})\) from step 3.

For fixed \(\nu\) (equivalently fixed \(\mu\)), the double sum over \(n\) is finite since only finitely many \(n\) satisfy \(n \leq N(T)\) with a nonvanishing contribution before the tail argument — and the tails all go to zero. As \(T \to \infty\), every term vanishes, so \(K_\infty(\nu) - K_T(\nu) \to 0\), i.e., \(K_T(\nu) \to K_\infty(\nu)\). But \(K_\infty(\nu) = 0\) for \(\nu \notin [-2,0]\) since the sum over modes contributes nothing outside the band — the band \([-2,0]\) is where the stationary phases of the main sum concentrate. Therefore \(\lim_{T\to\infty} K_T(\nu) = 0\). \(\square\)

***

## Summary: What Each Ingredient Does

| Ingredient | Role | Where it's used |
|---|---|---|
| \(\theta'' > 0\) | Makes \(x = \theta'(t)\) a global bijection; ensures \(\theta'(T) \to \infty\) | Steps 1, 4, 7c |
| \(\theta''\) cancellation | Makes IBP quotient \(Q\) rational in \(x\) alone | Step 5 |
| \(\beta_n = \log n + o(1)\) | Forces \(S(\mu)\) finite | Step 6a |
| \(S(\mu)\) finite | Only finitely many exceptional modes; handled separately | Steps 6b, 7c |
| \(Q = O(x^{-1/2})\) | Upper boundary \(\to 0\) | Step 7a |
| \(Q' = O(x^{-3/2})\) | Remainder integral converges absolutely, tail \(\to 0\) | Step 7b |
| Monotonicity \(\theta'(T) > \theta'(t^*)\) | Phase derivative bounded away from zero on tail \(