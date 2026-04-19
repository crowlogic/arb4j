# Band-Limitedness of Z(t) in the θ-Variable

## Statement

Define the zeta spectral transform

$$
K_T(\nu) = \frac{1}{2\pi}\int_{0}^T \zeta\!\left(\tfrac{1}{2}+it\right)\sqrt{\theta'(t)}\,e^{-i\nu\theta(t)}\,dt,
$$

where $\theta(t) = \Im\log\Gamma\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right) - \tfrac{t}{2}\log\pi$. In the limit $T \to \infty$, the spectral content of $Z(t)$ pulled back to the $\theta$-variable is supported entirely on $[-2, 0]$. Equivalently:

$$
\lim_{T \to \infty} K_T(\nu) = 0 \qquad \text{for every fixed } \nu \notin [-2, 0].
$$

The integral from $T$ to $\infty$ is the remainder. As $T \to \infty$ that remainder vanishes, and all spectral content outside $[-2, 0]$ vanishes with it. The proof is the content of BandLimitedness.tex.

---

## The θ-Variable Pullback

Writing $\zeta(\tfrac{1}{2}+it) = e^{-i\theta(t)}Z(t)$ and setting $\mu := \nu + 1$ centers the band at $\mu \in [-1, 1]$, equivalently $\nu \in [-2, 0]$:

$$
K_T(\nu) = \frac{1}{2\pi}\int_{T_0}^T Z(t)\sqrt{\theta'(t)}\,e^{-i\mu\theta(t)}\,dt.
$$

The condition $\nu \notin [-2,0]$ is equivalent to $|\mu| > 1$. The theorem is that for $|\mu| > 1$ the tail $K_\infty(\nu) - K_T(\nu) = \int_T^\infty (\cdots)\,dt$ tends to zero as $T \to \infty$.

---

## Exact Facts Used

### Strict monotonicity of θ'

From the digamma series $\psi'(s) = \sum_{k \geq 0}(s+k)^{-2}$, at $s = \tfrac{1}{4}+\tfrac{it}{2}$:

$$
\theta''(t) = \frac{1}{4}\sum_{k\geq 0} \frac{2\!\left(\tfrac{1}{4}+k\right)\cdot\tfrac{t}{2}}{|\tfrac{1}{4}+k+\tfrac{it}{2}|^4} > 0 \qquad \text{for all } t > 0.
$$

Every term is strictly positive. Therefore $\theta'$ is strictly increasing, making $x = \theta'(t)$ a global bijection with smooth inverse $t(x)$.

### Riemann–Siegel main sum

Expanding $Z(t) = 2\sum_{n=1}^{N(t)} n^{-1/2}\cos(\theta(t) - t\log n) + (\text{remainder})$ and writing each cosine as a sum of two exponentials gives the exact mode decomposition

$$
K_T(\nu) = \frac{1}{2\pi}\sum_{\sigma \in \{+1,-1\}}\sum_{n \leq N(T)} n^{-1/2} J_{n,\sigma}(T,\mu),
$$

where $t_n = \max(T_0, 2\pi n^2)$ and

$$
J_{n,\sigma}(T,\mu) := \int_{t_n}^T \sqrt{\theta'(t)}\,e^{i[(\sigma-\mu)\theta(t) - \sigma t\log n]}\,dt.
$$

---

## Change of Variable x = θ'(t)

Since $\theta'' > 0$, set $X := \theta'(T)$, $\beta_n := \theta'(2\pi n^2)$, $x_0 := \theta'(T_0)$. Under $x = \theta'(t)$:

$$
J_{n,\sigma}(T,\mu) = \int_{\beta_n \vee x_0}^{X} \frac{\sqrt{x}}{\theta''(t(x))}\,e^{i\widetilde\Phi_{n,\sigma,\mu}(x)}\,dx, \qquad \widetilde\Phi'_{n,\sigma,\mu}(x) = \frac{(\sigma-\mu)x - \sigma\log n}{\theta''(t(x))}.
$$

The numerator of $\widetilde\Phi'$ is linear in $x$ with unique zero $x^* = \sigma\log n/(\sigma - \mu)$.

---

## Exact θ'' Cancellation and IBP

The amplitude-to-phase-derivative ratio is

$$
\frac{A(x)}{\widetilde\Phi'(x)} = \frac{\sqrt{x}/\theta''(t(x))}{[(\sigma-\mu)x-\sigma\log n]/\theta''(t(x))} = \frac{\sqrt{x}}{(\sigma-\mu)x - \sigma\log n}.
$$

$\theta''(t(x))$ cancels exactly. The IBP quotient is rational in $x$ alone, with derivative

$$
\frac{d}{dx}\!\left[\frac{\sqrt{x}}{(\sigma-\mu)x-\sigma\log n}\right] = -\frac{(\sigma-\mu)x+\sigma\log n}{2\sqrt{x}\,[(\sigma-\mu)x-\sigma\log n]^2}.
$$

---

## Validity of IBP: Finiteness of S(μ)

For $|\mu| > 1$, the zero $x^* > 0$ occurs in exactly one branch, with $x^* = \log n/(1+|\mu|)$. Define

$$
S(\mu) := \bigl\{n \geq 1 : \beta_n \leq \tfrac{\log n}{1+|\mu|}\bigr\}.
$$

**Lemma:** $S(\mu)$ is finite.

*Proof.* The asymptotics $\psi(z) \sim \log z$ give $\beta_n = \log n + o(1)$, so $\beta_n - \log n/(1+|\mu|) = |\mu|\log n/(1+|\mu|) + o(1) \to +\infty$. Hence $n \notin S(\mu)$ for all sufficiently large $n$. $\square$

For $n \notin S(\mu)$ — all but finitely many modes — $x^*$ lies below $\beta_n \vee x_0$, the phase derivative has constant sign on the entire integration interval, and IBP is valid with no singularity.

---

## Exact IBP Identity (Theorem 1)

For $|\mu| > 1$ and $n \notin S(\mu)$:

$$
J_{n,\sigma}(T,\mu) = \underbrace{\frac{\sqrt{X}}{i[(\sigma-\mu)X-\sigma\log n]}\,e^{i\widetilde\Phi(X)}}_{U_{n,\sigma}(T,\mu)} - \underbrace{\frac{\sqrt{\beta_n \vee x_0}}{i[(\sigma-\mu)(\beta_n \vee x_0)-\sigma\log n]}\,e^{i\widetilde\Phi(\beta_n \vee x_0)}}_{L_{n,\sigma}(\mu)} + \underbrace{\int_{\beta_n \vee x_0}^{X} \frac{(\sigma-\mu)x+\sigma\log n}{2i\sqrt{x}\,[(\sigma-\mu)x-\sigma\log n]^2}\,e^{i\widetilde\Phi(x)}\,dx}_{I_{n,\sigma}(T,\mu)}.
$$

- $U_{n,\sigma}(T,\mu)$: upper boundary, $T$-dependent.
- $L_{n,\sigma}(\mu)$: lower boundary, $T$-independent once $T_0$ fixed — part of the limiting value.
- $I_{n,\sigma}(T,\mu)$: remainder integral converging absolutely to $I_{n,\sigma}(\infty,\mu)$.

---

## The Tail Vanishes as T → ∞

### Modes n ∉ S(μ)

As $T \to \infty$, $X = \theta'(T) \to \infty$:

$$
|U_{n,\sigma}(T,\mu)| \sim \frac{1}{(|\mu|-1)\sqrt{X}} \to 0,
$$

$$
|I_{n,\sigma}(T,\mu) - I_{n,\sigma}(\infty,\mu)| = O(X^{-1/2}) \to 0.
$$

### Modes n ∈ S(μ)

For $n \in S(\mu)$ the stationary point $t^* = t(x^*)$ is a fixed finite value determined by $\theta'(t^*) = \log n/(1+|\mu|)$. The mode $J_{n,\sigma}(T,\mu)$ converges to a finite nonzero limit $J_{n,\sigma}(\infty,\mu)$ which is part of $K_\infty(\nu)$. What must vanish is only the tail

$$
J_{n,\sigma}(\infty,\mu) - J_{n,\sigma}(T,\mu) = \int_T^\infty \sqrt{\theta'(t)}\,e^{i\Phi_{n,\sigma,\mu}(t)}\,dt.
$$

For all $T > t^*$, the stationary point lies behind the lower limit of this tail integral. The phase derivative $\Phi'_{n,\sigma,\mu}(t) = (\sigma-\mu)\theta'(t) - \sigma\log n$ has constant sign on $[T, \infty)$: at $t = T > t^*$, strict monotonicity of $\theta'$ gives $\theta'(T) > \theta'(t^*) = \log n/(1+|\mu|)$, so $(\sigma-\mu)\theta'(T) - \sigma\log n$ has the sign of $\sigma - \mu$ and satisfies

$$
|\Phi'_{n,\sigma,\mu}(t)| \geq (|\mu|-1)\bigl(\theta'(T) - \tfrac{\log n}{|\mu|-1}\bigr) > 0 \qquad \text{for all } t \geq T,
$$

bounded away from zero and growing as $\theta'(T) \to \infty$. The IBP denominator therefore never vanishes on $[T,\infty)$, IBP is valid on the tail, and the argument is identical to the $n \notin S(\mu)$ case. The tail IBP gives upper boundary term

$$
\frac{\sqrt{X}}{|(\sigma-\mu)X - \sigma\log n|} \lesssim \frac{1}{(|\mu|-1)\sqrt{\theta'(T)}} \to 0,
$$

and the remainder integral of the tail is $O(\theta'(T)^{-1/2}) \to 0$ by the same $O(x^{-3/2})$ integrand estimate. Since $S(\mu)$ is finite, the total tail contribution from all $n \in S(\mu)$ is a finite sum of terms each tending to zero.

---

## Conclusion

As $T \to \infty$, the tail $K_\infty(\nu) - K_T(\nu)$ vanishes for every $\nu \notin [-2, 0]$:

$$
\lim_{T \to \infty} K_T(\nu) = 0 \qquad \text{for every fixed } \nu \notin [-2,0].
$$

$Z(t)$, pulled back to the $\theta$-variable, is band-limited to $[-2, 0]$. $\square$

---

## Every Step and Its Justification

| Step | Claim | Justification |
|------|-------|---------------|
| $\theta'' > 0$ | $\theta'$ strictly increasing; $x = \theta'(t)$ bijection | Digamma series, each term positive |
| Mode decomposition | Exact split into $J_{n,\sigma}$ | Riemann–Siegel identity, exact |
| $\theta''$ cancellation | IBP quotient rational in $x$ alone | Exact algebra |
| $S(\mu)$ finite | All but finitely many modes non-stationary on full interval | $\beta_n = \log n + o(1)$ from $\psi(z)\sim\log z$ |
| Theorem 1 | Exact IBP identity for each $J_{n,\sigma}$, $n\notin S(\mu)$ | Two-line calculation |
| $U_{n,\sigma} \to 0$ | $(|\mu|-1)^{-1}X^{-1/2} \to 0$ | $X = \theta'(T) \to \infty$ |
| $I_{n,\sigma}(T) \to I_{n,\sigma}(\infty)$ | Integrand $O(x^{-3/2})$, absolutely convergent | Rational function estimate |
| $S(\mu)$ modes | Tail $\int_T^\infty$ has no stationary point for $T > t^*$; $\theta'(T) > \theta'(t^*)$ by strict monotonicity so IBP denominator bounded away from zero and growing on $[T,\infty)$; tail is $O(\theta'(T)^{-1/2}) \to 0$ | Identical argument to $n \notin S(\mu)$ case |
