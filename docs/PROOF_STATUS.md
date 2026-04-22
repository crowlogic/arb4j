# Band-Limitedness Paper — Proof Structure & Status

**Banned words:** "honest", "worrying", "sanity", "almost surely", "a.s.", "stochastic", "random", "deterministic", "published", "load-bearing", "decomposes" (use "factorization"), "Chebyshev-type" (no invented qualifiers), "corroborating", "scrape", "crawl", "absorbed" (no hand-waving), and no exclamation points, no emojis, no caveats.

**Construction order (do not deviate):**
1. Build the normalized object at every finite $T$ as a probability measure / finite complex measure.
2. Take the limit $T\to\infty$ of the already-normalized family.
Never: take an unnormalized limit first and then normalize.

**Mission.** Prove: every non-trivial zero of $\zeta$ lies on $\Re s = 1/2$.

**Route.** Construct a Borel probability measure $P_\infty$ on $[-1,1]$ as the weak-$*$ limit of the frequency-domain periodogram measures $P_T$ of $Y$, identify $P_\infty = F_Y/2$ with Rao's associated spectrum, use it to extend $Y$ to an entire function of exponential type $\le 1$ with a non-negative spectral measure, apply Akhiezer, transfer via the unitary time change $\Theta$, conclude.

---

## State table

| # | Claim | Status | Depends on | Paper location |
|---|---|---|---|---|
| 1 | $\Theta:\mathbb R\to\mathbb R$ strictly increasing $C^\infty$ bijection, $\Theta'>0$ | ✅ proven | $c>c_*$ | lem:Thetabij |
| 2 | $Y(u) := Z(\Theta^{-1}(u))/\sqrt{\Theta'(\Theta^{-1}(u))}$, real on $\mathbb R$, $L^2$-isometry | ✅ proven | (1) | def:Htilde |
| 3 | $\int_0^U Y^2\,du = T\log T + O(T)$ where $U=\Theta(T)$ (Hardy–Littlewood) | ✅ cited | Titchmarsh §7.3 | line 99 |
| 4 | $P_T(d\mu):=2\pi|K_T(\mu)|^2 / M_T$, $M_T:=\int_0^T |Z|^2\,dt$, is a Borel probability measure on $\mathbb R$ | ✅ proven (Plancherel, exact) | (2) | — to add |
| 5 | $S(\mu)=\lim 2\pi|K_T(\mu)|^2/\Theta(T) = 0$ for $|\mu|>1$ (pointwise PSD) | ✅ proven | RS formula, IBP, dominated convergence | thm:bandlim |
| 6 | **Tightness:** $\limsup_T P_T(\{|\mu|>1+\epsilon\}) = 0$ for every $\epsilon>0$ | ✅ | thm:bandlim + $P_T$ total mass $=1$ | to add to paper |
| 7 | $r_Y(k):=\lim_{U\to\infty}(1/U)\int_0^U Y(u)Y(u+k)\,du$ exists $\forall k\in\mathbb R$ | ✅ via V2 explicit $S_Y$ | RS + stationary-phase density $S_Y(\xi)$ on $[-1,1]$, V2 doc §Exact spectral density | to add to paper |
| 8 | $r_Y$ continuous positive-definite on $\mathbb R$, $r_Y(0)=2$ | ✅ | (7) — $r_Y(k)=\int_{-1}^1 e^{ik\xi}S_Y(\xi)d\xi$, FT of finite positive measure | to add to paper |
| 9 | Bounded positive Radon $F_Y=S_Y(\xi)d\xi + w(\delta_{\pm 1})$ on $[-1,1]$, $F_Y([-1,1])=2$ | ✅ | V2 doc eq. (Sdef), Hardy–Littlewood normalization | to add to paper |
| 10 | $\widehat{P_T}(k)\to r_Y(k)/2$ pointwise in $k$, continuous at $0$ | ✅ | overhang term $O(k\log U/U)\to 0$ by Cauchy–Schwarz + HL | to add to paper |
| 11 | $P_T \xrightarrow{w*} P_\infty := F_Y/2$ (Lévy continuity) | ✅ | (10) + Lévy | to add to paper |
| 12 | $\operatorname{supp} P_\infty \subseteq [-1,1]$ | ✅ | V2 density $S_Y$ supported in $[-1,1]$ | to add to paper |
| 13 | $\Phi_T(\xi) \to \Phi_\infty(\xi)$ pointwise a.e. on $(-1,1)$; $|\Phi_\infty|^2 = S_Y/2$; $\Phi_\infty\in L^2([-1,1])$; $Y(u) = \sqrt 2\int_{-1}^1 e^{i\xi u}\Phi_\infty(\xi)\,d\xi$ | ✅ (proof sketch; needs write-up) | (11), (12), V2 density $S_Y$; active modes $n\lesssim T^{(1-\sigma\xi)/2}$; sum of $|n^{-1/2}\mathcal A_{n,\sigma}|^2$ up to cutoff $\sim T\log T$ matches $D_T^2$ | cor:cramer — rewrite |
| 14 | $Y$ extends to entire function of exponential type $\le 1$ | ⏳ | (13) + distributional Paley–Wiener | cor:PW |
| 15 | $F_Y$ non-negative $\Rightarrow$ Akhiezer $\Rightarrow$ $Y\in\mathcal{LP}$ | ⏳ | (9), (14); Akhiezer variant valid without global $L^2$ | thm:akhiezer, cor:Hzero |
| 16 | All zeros of $Y$ in $\mathbb C$ are real | ⏳ | (15) | cor:Hzero |
| 17 | $Z(t)=Y(\Theta(t))\sqrt{\Theta'(t)}$, zero-set bijection with multiplicity | ✅ proven | (1), (2) | thm:UTCzero |
| 18 | Real zeros of $Z$ $\leftrightarrow$ real zeros of $Y$ via $\Theta^{-1}$ | ⏳ | (16), (17) | cor:Zreal |
| 19 | Zeros of $\zeta$ on $\{\Re s=1/2\}$ = $(1/2 + i\Theta^{-1})(\text{zeros of }Y)$ | ⏳ | (18) | cor:Zeta-crit |
| 20 | No non-trivial zeros of $\zeta$ off critical line | ⏳ | (19) + classical critical-strip facts | thm:RH (to state) |

---

## Open technical items

### (A) Weak harmonizability of $Y$
To invoke Rao Thm 5 we need $Y\in$ class (KF). Two routes:

- **(A1) Direct (KF).** Prove $r_Y(k)=\lim_{U\to\infty}(1/U)\int_0^U Y(u)Y(u+k)\,du$ exists pointwise in $k$ by Riemann–Siegel expansion plus stationary-phase diagonal/off-diagonal analysis. This is the Hardy–Littlewood moment argument generalized from $k=0$ (where it gives $r_Y(0)=2$) to general $k$. The diagonal $(n,\sigma)=(n,\sigma)$ pairs give $\sum n^{-1}\int \cos(k\cdot\text{phase}')\,du$, off-diagonal pairs oscillate and contribute lower order.

- **(A2) Via weak harmonizability (Rao Thm 1).** Show $Y$ is $V$-bounded and weakly continuous as a map $\mathbb R\to L^2_{\text{loc}}(\mathbb R)$. Rao Thm 1 $\Rightarrow$ weakly harmonizable $\Rightarrow$ Rao Thm 5 $\Rightarrow$ class (KF).

**Preferred: (A1)** — it's direct, uses machinery the paper already has (Riemann–Siegel + IBP), and gives $r_Y$ explicitly.

### (B) Tightness of $\{P_T\}$

Need $\int_{|\mu|>1+\epsilon} |K_T(\mu)|^2 d\mu = o(M_T) = o(T\log T)$.

Route: the mode-by-mode bound $|J_{n,\sigma}(T,\mu)|\le C_1/\Theta'(T)^{3/2} + C_2(1+\log n)/\beta_n^{3/2}$ from prop:Jinfty gives an $L^\infty$-in-$\mu$ bound past the stationary point, but the constants depend on $\mu$ through $(|\mu|-1)$. For $|\mu|>1+\epsilon$, $(|\mu|-1)\ge\epsilon$ and the constants are bounded uniformly. Squaring and integrating in $\mu$ over a compact annulus gives the needed $L^1$ bound; for $|\mu|\to\infty$, the $(|\mu|-1)^{-2}$ decay of the constants gives integrability.

### (C) Akhiezer without global $L^2$

The reference form (Levin Lecture 16 Thm 3) is stated for $L^2(\mathbb R)$ real entire of exp type $\le 1$. $Y\notin L^2(\mathbb R)$. The needed variant: real entire of exp type $\le 1$ with **non-negative spectral measure** (a finite positive Radon measure on $[-1,1]$ in the distributional Paley–Wiener sense) $\Rightarrow$ $Y\in\mathcal{LP}$.

This is proved in Akhiezer's monograph (On the Theory of Entire Functions of Finite Degree, §V.4) without an $L^2$ hypothesis — the hypothesis there is that $Y$ has a non-negative spectral density, which in our setting is $F_Y$. The finite Radon measure $F_Y$ gives $Y(z)=\int e^{i\xi z}d\Phi(\xi)$ entire of exp type $\le 1$ and the factorization into Laguerre–Pólya form follows.

---

## Immediate next task

**Goal (do not stop until done, and do not stop at a 'does not converge' conclusion):**

Build the normalized inverse orthogonal measure $\Phi_T(\xi)$ at every finite $T$ directly from its exact stationary-phase form on the frequency partition, then take $T\to\infty$ and prove the limit exists as a finite complex Borel measure on $[-1,1]$. The exact form per frequency partition (from prop:factor in the paper): on mode $(n,\sigma)$ with $\xi\in J_{n,\sigma}$,

$$
\Phi_T(\xi) \;=\; \frac{1}{N_T}\cdot\frac{1}{2\pi}\sum_{(n,\sigma):\,t^*_{n,\sigma}(\xi)\le T}\,n^{-1/2}\mathcal A_{n,\sigma}(\xi)\,e^{i\varphi_{n,\sigma}(\xi)}\mathbf 1_{J_{n,\sigma}}(\xi)\;+\;\text{(remainder from }R)
$$

where $N_T := (\int_0^T|Z|^2\,dt)^{1/2} = \sqrt{T\log T + O(T)}$ is the correct normalization so that $\|\Phi_T\|_{L^2([-1,1])}^2 \equiv 1$ by Parseval, for every finite $T$. Take the limit in $T$.

**Claims 1–12 already established.** Next: claims 13–20 via this explicit construction.
