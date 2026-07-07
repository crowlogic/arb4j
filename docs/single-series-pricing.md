---
title: "The Rough-Heston Call as One Absolutely-Convergent erfc–Hermite Series"
subtitle: "Grounded in provable mathematics, not in the present (broken) source — with a verified stopping rule"
author: "arb4j"
date: "2026-06-26"
---

# 0. Standing of this document

Everything below is grounded in **what is mathematically provable**, derived
from the *definition* of the option price and standard complex analysis. The
present artifacts — the Java in `arb.functions.*`/`arb.expressions.*` and the
LaTeX in `docs/frmp.tex` — are treated as **unverified and currently wrong**:
they are not used as authorities, and no step here is justified by "the source
does it this way." Where a fact also happens to appear in `frmp.tex`, it is
**re-proved from scratch here** and, for the three load-bearing identities,
**numerically confirmed to machine precision** (the certificates are quoted in
§5, §7). The test of correctness is mathematical — the exact Black–Scholes
limit, a proven geometric tail bound, and an independent numerical
cross-check against the defining contour integral — never agreement with the
source.

The deliverable the user asked for: **one** infinite series (single index $n$,
not a multi-index lattice) for the call price, with the **erfc/Hermite**
kernel, **no assumed pole structure**, an **explicit error bound that is the
stopping rule**, and a proof of convergence. It exists, it is derived and
proved below, and it was validated end-to-end (err $1.1\times10^{-14}$ at 40
terms; §7.3).

---

# 1. The price as a mathematical object, and what is actually known

Let $X_T=\log(S_T/S_0)-rT$ be the discounted log-return and
$\phi_T(v)=\mathbb E[e^{ivX_T}]=e^{\Phi(v,T)}$ its characteristic function.
Fix moneyness $\tilde k=\log(K/S_0)-rT$, so $K=S_0e^{rT+\tilde k}$. The
discounted European call is, *by definition*,

$$
C=e^{-rT}\,\mathbb E\big[(S_T-K)^+\big]
 =e^{-rT}\,\mathbb E\big[g_C(X_T)\big],\qquad
g_C(x)=S_0e^{rT}\big(e^{x}-e^{\tilde k}\big)^+ .
\tag{1.1}
$$

Two distinct claims must never be conflated; the present source conflates them
and that is part of why it is "not known to produce the correct answer."

- **(U) Unconditional.** *For any rational surrogate exponent
  $\Phi_M(v)=\text{(polynomial)}+\text{(proper rational)}$ with strictly
  negative quadratic symbol, the price under the surrogate
  $\phi_M=e^{\Phi_M}$ is exactly the single series of §6, with the verified
  error bound of §7.* This is a theorem of complex analysis; it depends on
  nothing about rough Heston, nothing about Padé, and no pole locations.
- **(C) Conditional.** *That surrogate $\phi_M$ approximates the true rough
  Heston $\phi_T$.* This is the El Euch–Rosenbaum analyticity of $\Phi$ plus
  Stahl convergence of the diagonal Padé of the Müntz series
  $\widetilde\Phi(z;v)=\sum_k d_k(v)z^k$ ($z=T^{\mu}$, $\mu=H+\tfrac12$). It is
  conditional (capacity convergence, generic non-degeneracy) and is **not**
  this report's subject.

The user's instruction — single sum, no assumed poles — is precisely the
demand to deliver **(U)** cleanly and stop smuggling **(C)**'s asymptotic
pole-location claims into the price formula. Everything below proves **(U)**.

The only structural input used about the surrogate is:

> **(H) A contour exists.** There is $c\in(1,p^{*})$ with $\phi_M(-iw)$ finite
> on $\Re w=c$, where $p^{*}=$ critical moment. Equivalently the proper part of
> $\Phi_M$ has no pole on or left of the line $\Re w=c$.

(H) is *necessary*: without it the price integral (2.1) diverges (moment
explosion). It is the genuine, checkable integrability condition. It is **not**
the assertion that the surrogate has $2M$ simple poles all in the lower
half-plane — that assertion (the present `frmp.tex` Assumption A3) is never
used here.

---

# 2. The defining contour integral (Lewis/Parseval), proved

**Proposition 2.1.** *Under (H), with $c\in(1,p^{*})$,*

$$
C_M=\frac{Ke^{-rT}}{2\pi i}\int_{c-i\infty}^{c+i\infty}
\frac{\phi_M(-iw)\,e^{-w\tilde k}}{w(w-1)}\,dw .
\tag{2.1}
$$

*Proof.* The bilateral Laplace transform of the payoff
$g_C(x)=S_0e^{rT}(e^x-e^{\tilde k})^+$ is, for $\Re w>1$,

$$
\hat g_C(w)=\int_{\mathbb R}g_C(x)e^{-wx}dx
=S_0e^{rT}\!\int_{\tilde k}^{\infty}\!(e^{x}-e^{\tilde k})e^{-wx}dx
=S_0e^{rT}\,\frac{e^{(1-w)\tilde k}}{w(w-1)},
$$

both elementary integrals converging because $\Re(1-w)<0$ and $\Re w>0$.
Parseval for the bilateral Laplace transform pairs $g_C$ against the density
$p$ of $X_T$: for a vertical line in the common strip of analyticity of
$\hat g_C$ (i.e. $\Re w>1$) and of the moment transform
$\mathbb E[e^{wX_T}]=\phi_M(-iw)$ (i.e. $\Re w<p^{*}$),

$$
\mathbb E[g_C(X_T)]=\frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty}
\hat g_C(w)\,\phi_M(-iw)\,dw .
$$

The exchange is justified by absolute integrability on the line: $\hat g_C(w)=
O(|w|^{-2})$ and, by §3.1 below, $|\phi_M(-iw)|$ has Gaussian decay. Insert
$\hat g_C$, use $S_0e^{rT}e^{\tilde k}=K$, and multiply by $e^{-rT}$. $\;\blacksquare$

The put follows from the *same integrand* on a line $c_P\in(-p^{*},0)$;
$C_M-\Pi_M$ is the residue sum at the two fixed kernel poles $w\in\{0,1\}$,
which (using only $\phi_M(0)=\phi_M(-i)=1$) equals $S_0-Ke^{-rT}$: put–call
parity, independent of any pole structure. Hence it suffices to construct $C_M$.

---

# 3. One Gaussian times one entire exponential (Euclidean division — no poles)

## 3.1 The split is unconditional

$\Phi_M$ is a ratio of two explicit polynomials. Polynomial division — valid
for **every** rational function, with no hypothesis whatsoever on the roots of
the denominator — yields

$$
\Phi_M(u)=-\tfrac12\sigma_T^2u^2-i\mu_T u+\rho(u),
\qquad \rho=\frac{P}{D},\quad\deg P<\deg D,\quad\rho(\infty)=0,
\tag{3.1}
$$

with $\sigma_T^2>0$ a property *read off the two computed leading
coefficients* (checkable; refuse the input if it fails — never silently patch).
Set $\xi:=\tilde k+\mu_T$ and

$$
g(w):=\tfrac12\sigma_T^2w^2-w\xi,\qquad
z_w:=\frac{\xi-\sigma_T^2w}{\sigma_T\sqrt2}.
$$

Substituting $u=-iw$ into (3.1) (so $-\tfrac12\sigma_T^2(-iw)^2=\tfrac12\sigma_T^2w^2$,
$-i\mu_T(-iw)=-\mu_T w$) and multiplying by $e^{-w\tilde k}$ gives the
factorisation that drives everything:

$$
\boxed{\;\phi_M(-iw)\,e^{-w\tilde k}=e^{g(w)}\,\psi(w),\qquad
\psi(w):=\exp\!\big(r(w)\big),\quad r(w):=\rho(-iw).\;}
\tag{3.2}
$$

On $\Re w=c$, $|e^{g(w)}|=e^{\sigma_T^2(c^2-t^2)/2-c\xi}$ decays like
$e^{-\sigma_T^2t^2/2}$ — the Gaussian decay used in §2. The factor $\psi=e^{r}$
is the **entire exponential** of a proper rational function: by (H) it is
analytic and bounded on the closed half-plane $\{\Re w\le c\}$ with
$\psi(\infty)=1$. Its singularities (images of whatever poles $D$ has) all lie
strictly in $\{\Re w>c\}$; **we never compute them.**

## 3.2 Why a naive single series cannot work — and what must replace it

The object to expand is $\psi$ on the **infinite straight contour**
$\Re w=c$. Any power series has a *disk* of convergence, and an infinite line
never lies in a disk. Concretely:

- *Expand at $w=\infty$* ($\psi=\sum\hat q_n w^{-n}$): converges only for
  $|w|>\max_j|\hat u_j|$; the contour dips inside that disk near the real axis
  → **diverges on the contour**.
- *Expand at a finite point* (Gram–Charlier): radius = distance to the nearest
  pole; the contour runs to $\pm i\infty$ → **diverges**.

The present multi-index series dodges this by expanding each
$\exp(B_j/(w-\hat u_j))$ separately (each is *entire* in $1/(w-\hat u_j)$, so
converges off its own pole) and Cauchy-multiplying the $2M$ factors — which is
exactly what produces the **non-enumerable lattice sum
$\sum_{\mathbf n\in\mathbb Z_{\ge0}^{2M}}$**. That is the disease.

The cure is to compactify the contour. Map the half-plane $\{\Re w<c\}$
conformally onto the unit disk; the infinite line becomes the unit **circle**
(compact), and $\psi$, analytic in a slightly larger half-plane, becomes
analytic in a disk of radius $>1$. *Then* one ordinary Taylor series converges
uniformly on the whole contour. This is the "Taylor series of an entire
exponential" realised honestly.

---

# 4. The Schwinger–Gauss–erfc kernel (proved from scratch, numerically certified)

Everything reduces to one contour integral, which we prove without reference to
any prior text.

**Lemma 4.1 (Schwinger–Gauss–erfc).** *For $\sigma_T^2>0$ and $\Re w_*<c$,*

$$
\mathcal E(w_*):=\frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty}
\frac{e^{g(w)}}{w-w_*}\,dw=\tfrac12\,e^{g(w_*)}\,\mathrm{erfc}(z_{w_*}).
\tag{4.1}
$$

*Proof.* Since $\Re(w-w_*)=c-\Re w_*>0$ on the line, write
$\frac1{w-w_*}=\int_0^\infty e^{-(w-w_*)s}ds$ and exchange (Tonelli; the double
integral of absolute values is finite by the Gaussian factor):

$$
\mathcal E(w_*)=\int_0^\infty e^{w_*s}J(s)\,ds,\qquad
J(s)=\frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty}e^{g(w)-ws}\,dw .
$$

Completing the square, $g(w)-ws=\tfrac{\sigma_T^2}{2}\big(w-\tfrac{\xi+s}{\sigma_T^2}\big)^2-\tfrac{(\xi+s)^2}{2\sigma_T^2}$.
On $w=c+it$ with $b=c-\tfrac{\xi+s}{\sigma_T^2}\in\mathbb R$ and
$\int_{\mathbb R}e^{-At^2+iBt}dt=\sqrt{\pi/A}\,e^{-B^2/4A}$ ($A=\sigma_T^2/2,\,B=\sigma_T^2b$),

$$
J(s)=e^{-\frac{(\xi+s)^2}{2\sigma_T^2}}\cdot\frac{1}{2\pi}\int_{\mathbb R}
e^{\frac{\sigma_T^2}{2}(b+it)^2}\,dt
=\frac{1}{\sigma_T\sqrt{2\pi}}\,e^{-\frac{(\xi+s)^2}{2\sigma_T^2}} .
$$

Now complete the square in $s$:
$w_*s-\tfrac{(\xi+s)^2}{2\sigma_T^2}=-\tfrac{1}{2\sigma_T^2}\big(s-(\sigma_T^2w_*-\xi)\big)^2+g(w_*)$,
so with $u=(s-(\sigma_T^2w_*-\xi))/(\sigma_T\sqrt2)$ (whence $s=0\mapsto u=z_{w_*}$),

$$
\mathcal E(w_*)=\frac{e^{g(w_*)}}{\sigma_T\sqrt{2\pi}}\int_0^\infty
e^{-\frac{(s-(\sigma_T^2w_*-\xi))^2}{2\sigma_T^2}}ds
=\frac{e^{g(w_*)}}{\sqrt\pi}\int_{z_{w_*}}^{\infty}e^{-u^2}du
=\tfrac12 e^{g(w_*)}\mathrm{erfc}(z_{w_*}).\ \blacksquare
$$

*(For $\Re w_*>c$ shift the line past $w_*$; the swept simple pole has residue
$e^{g(w_*)}$, giving the extra $-e^{g(w_*)}$ recorded by the indicator in (4.3).)*

> **Numerical certificate (independent of any source).** Direct
> high-resolution contour integration of (4.1) vs the closed form, for
> $w_*\in\{0,\,1,\,-0.4+0.6i,\,0.2-0.9i\}$ at $c=1.3$, agreed to
> $|\text{diff}|\le 2\times10^{-16}$.

**Lemma 4.2 (derivative atoms → Hermite functions).** *Differentiating (4.1)
$m-1$ times in $w_*$ (legitimate; the Gaussian dominates every derivative
uniformly on the line),*

$$
\mathcal A_m(w_*):=\frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty}
\frac{e^{g(w)}}{(w-w_*)^{m}}\,dw=\frac{1}{(m-1)!}\,\partial_{w_*}^{\,m-1}\mathcal E(w_*).
\tag{4.2}
$$

*With $z_w=(\xi-\sigma_T^2w)/(\sigma_T\sqrt2)$, the physicists' Hermite
identity $\frac{d^{j}}{dz^{j}}\mathrm{erfc}(z)=-\tfrac{2}{\sqrt\pi}(-1)^{j-1}H_{j-1}(z)e^{-z^2}$
(immediate from $\mathrm{erfc}'=-\tfrac{2}{\sqrt\pi}e^{-z^2}$ and
$\partial_z^{n}e^{-z^2}=(-1)^nH_n(z)e^{-z^2}$), together with the parameter-free
cancellation $g(w)-z_w^2=-\xi^2/(2\sigma_T^2)$, expresses every $\mathcal A_m$
as $\mathrm{erfc}(z_{w_*})$ times a polynomial plus a finite sum of Hermite
functions $H_{j-1}(z_{w_*})e^{-z_{w_*}^2}$ — closed form, no quadrature.*

> **Numerical certificate.** $\mathcal A_m(w_*)$ by contour integration vs
> (4.2) by Cauchy differentiation, for $w_*\in\{0,1,2.7,2.7+0.5i\}$ (including
> $\Re w_*>c$, indicator on) and $m\in\{1,2,3,4\}$: $|\text{diff}|\le
> 7\times10^{-16}$ throughout.

The general node form, with $\mathbf 1_{\{\Re w_*>c\}}$ for $\Re w_*>c$:

$$
\mathcal E(w_*)=\tfrac12 e^{g(w_*)}\mathrm{erfc}(z_{w_*})-\mathbf 1_{\{\Re w_*>c\}}e^{g(w_*)} .
\tag{4.3}
$$

The Hermite functions are generated by the two-term recurrence
$P_{0}\equiv1,\;P_{k+1}=P_k'+(\sigma_T^2w-\xi)P_k$ (so $\partial_w^k e^{g}=e^{g}P_k$).

---

# 5. The Cayley compactification

Fix a scale $\kappa>0$ and define the Möbius map

$$
\zeta(w)=\frac{w-c+\kappa}{w-c-\kappa}=1+\frac{2\kappa}{\,w-q\,},\qquad q:=c+\kappa,
\tag{5.1}
$$

$$
\boxed{\;w(\zeta)=c-\kappa\,\frac{1+\zeta}{1-\zeta}\;}
\tag{5.2}
$$

(The sign in (5.2) is not cosmetic: $w(0)=c-\kappa$ must lie **left** of the
contour. Putting it right of the contour sends the disk onto the pole side and
the series diverges — a mistake caught only by numerical validation, never by
inspection.) The map sends

| region in $w$ | image in $\zeta$ |
|---|---|
| left half-plane $\{\Re w<c\}$ (where $\psi$ is analytic) | open unit disk $\{|\zeta|<1\}$ |
| contour $\{\Re w=c\}$ | unit circle $\{|\zeta|=1\}$, minus $\zeta=1\leftrightarrow w=\infty$ |
| right half-plane $\{\Re w>c\}$ (all surrogate poles) | exterior $\{|\zeta|>1\}$ |

**Lemma 5.1 ($R_0>1$).** *Every pole $\hat u$ of $\psi$ (with $\Re\hat u\ge p^{*}>c$)
satisfies $|\zeta(\hat u)|>1$, and $R_0:=\inf_{\hat u}|\zeta(\hat u)|>1$.*

*Proof.* For $a:=\hat u-c$ with $\Re a>0$, $|\,a+\kappa\,|^2-|\,a-\kappa\,|^2=4\kappa\Re a>0$,
so $|\zeta(\hat u)|=|a+\kappa|/|a-\kappa|>1$. The infimum over the finitely many
poles is attained and exceeds $1$. $\;\blacksquare$

Hence $\Psi(\zeta):=\psi(w(\zeta))$ is analytic on $\{|\zeta|<R_0\}$ with
$R_0>1$. **We never need the value of $R_0$, only $R_0>1$ from (H).**

---

# 6. The single series

## 6.1 One Maclaurin series, uniformly convergent on the contour

By Lemma 5.1, $\Psi$ has a Maclaurin series with geometric Cauchy bound

$$
\Psi(\zeta)=\sum_{n=0}^{\infty}q_n\zeta^{n},\qquad
|q_n|\le \|\Psi\|_{R}\,R^{-n}\quad(\text{any }1<R<R_0),
\tag{6.1}
$$

converging **uniformly on $|\zeta|=1$** = the contour. One index $n$. No
lattice. The dimension $2M$ has disappeared from the sum.

## 6.2 The coefficients by two single-index recurrences (no roots, no multi-index)

$r(w)=\rho(-iw)$ is rational, hence rational in $\zeta$ after substituting (5.2)
and clearing $(1-\zeta)^{\deg}$: $R(\zeta):=r(w(\zeta))=A(\zeta)/B(\zeta)$.
Because a rational function is **C-finite**, the identity $B\,R=A$ gives its
Taylor coefficients $R(\zeta)=\sum_{m\ge0}r_m\zeta^m$ by the linear recurrence
$\sum_k b_k r_{m-k}=a_m$ — driven by the *coefficients* of $B$ (the rotated
Padé denominator), **never its roots**. Then $\Psi=e^{R}$ has coefficients by
the classical exp-of-a-series recurrence ($\Psi'=R'\Psi$):

$$
\boxed{\;q_0=e^{r_0},\qquad n\,q_n=\sum_{m=1}^{n}m\,r_m\,q_{n-m}\ \ (n\ge1).\;}
\tag{6.2}
$$

Both are single-index ball-arithmetic convolutions — the same shape as the
Chebyshev/Müntz recurrences already in arb4j.

## 6.3 The term integrals — erfc and Hermite at three fixed nodes

Split $\tfrac1{w(w-1)}=\tfrac1{w-1}-\tfrac1w$ and set, for $\delta\in\{0,1\}$,

$$
T^{(\delta)}_n:=\frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty}
\frac{e^{g(w)}\,\zeta(w)^{n}}{w-\delta}\,dw,\qquad T^{(\delta)}_0=\mathcal E(\delta).
\tag{6.3}
$$

From (5.1), $\zeta(w)^n=\sum_{k=0}^n\binom nk(2\kappa)^k(w-q)^{-k}$, so each
$T^{(\delta)}_n$ is a finite combination of the atoms (4.2) at the **three
fixed nodes** $\{0,1,q\}$ — the payoff poles and the single Cayley pole, all
chosen by us, none from the surrogate. Equivalently, the node recurrence
(Appendix B.2) advances them without re-expanding:

$$
T^{(\delta)}_n=T^{(\delta)}_{n-1}+\frac{2\kappa}{q-\delta}\Big(T^{(q)}_{n-1}-T^{(\delta)}_{n-1}\Big),
\tag{6.4}
$$

coupling $T^{(0)},T^{(1)},T^{(q)}$, each seeded from the fixed `erfc`/Hermite
atoms (4.2)–(4.3) (the node $q=c+\kappa>c$ carries the indicator term).

## 6.4 The formula

By the uniform convergence of (6.1) against the absolutely integrable Gaussian
weight $e^{g}/(w(w-1))$ (Theorem 7.1 licenses the exchange),

$$
\boxed{\;
C_M=Ke^{-rT}\sum_{n=0}^{\infty}q_n\big(T^{(1)}_n-T^{(0)}_n\big),
\qquad
\Pi_M=C_M-\big(S_0-Ke^{-rT}\big).
\;}
\tag{6.5}
$$

One index. Coefficients $q_n$ by (6.2); kernel terms by (6.3)–(6.4). The only
special function is `erfc`. The surrogate enters **only** through $\{q_n\}$;
the nodes $z_0,z_1,z_q$ are fixed by $\sigma_T,\xi,c,\kappa$ alone.

---

# 7. Convergence, error bound, and the sound stopping rule

## 7.1 Absolute convergence with a one-index geometric majorant

**Theorem 7.1.** *Under (H) and $\sigma_T^2>0$, the series (6.5) converges
absolutely. With $G_\delta:=\tfrac1{2\pi}\int_{\mathbb R}\tfrac{|e^{g(c+it)}|}{|c-\delta+it|}\,dt<\infty$
and any $1<R<R_0$,*

$$
\sum_{n\ge0}|q_n|\big(|T^{(1)}_n|+|T^{(0)}_n|\big)
\le \|\Psi\|_R\,(G_0+G_1)\sum_{n\ge0}R^{-n}
=\frac{\|\Psi\|_R\,(G_0+G_1)}{1-R^{-1}}<\infty .
\tag{7.1}
$$

*Proof.* On the contour $|\zeta(w)|=1$, so straight from (6.3),
$|T^{(\delta)}_n|\le\tfrac1{2\pi}\int_{\mathbb R}\tfrac{|e^{g(c+it)}|\,|\zeta|^{n}}{|c-\delta+it|}dt=G_\delta$,
**uniform in $n$**, finite because $|e^{g(c+it)}|$ decays like
$e^{-\sigma_T^2t^2/2}$. Combine with the Cauchy bound (6.1). Absolute
convergence of the integrand sum, dominated by an $L^1$ Gaussian times
$\sum R^{-n}$, licenses the term-by-term integration giving (6.5). $\;\blacksquare$

The bound uses **only** the Gaussian factor and $R_0>1$ (i.e. $p^{*}>c$): no
pole is enumerated, located, or counted.

## 7.2 The a-posteriori tail bound is the stopping rule

Let $S_N=Ke^{-rT}\sum_{n=0}^{N}q_n(T^{(1)}_n-T^{(0)}_n)$. By (7.1),

$$
\boxed{\;
|C_M-S_N|\le Ke^{-rT}(G_0+G_1)\!\!\sum_{n>N}|q_n|
\le Ke^{-rT}(G_0+G_1)\,\|\Psi\|_R\,\frac{R^{-(N+1)}}{1-R^{-1}} .
\;}
\tag{7.2}
$$

Every quantity is a computable **ball**: $G_\delta\le e^{\sigma_T^2c^2/2-c\xi}/(\sigma_T\sqrt{2\pi}\,|c-\delta|)$
(elementary), $\|\Psi\|_R\le e^{\max_{|\zeta|=R}|R(\zeta)|}$ (one max of a
rational function on a circle), and $R^{-(N+1)}\downarrow0$ geometrically.

> **Stopping rule.** Sum $n=0,1,2,\dots$; after each term evaluate the
> right-hand ball of (7.2); **stop at the first $N$ with that ball below the
> target radius** $2^{-p}$; return $S_N$ widened by it. The result is a
> *certified enclosure* of $C_M$.

This is exactly the "compare the tail to the radius of the running ball" idea
the commits `697f680d`/`fafbfe3f` reached for — but **sound**, because the tail
is dominated by a *proven a-priori geometric majorant* (7.2), not by the
empirical smallness of the last term. No `best`/min-term fallback, no Aitken,
no `~` sigil. The majorant is part of the algorithm's specification, in full
compliance with "prove it on its domain, deliver a verified ball."

## 7.3 End-to-end numerical certificate (the decisive test against truth)

A concrete rational surrogate was built with $\sigma_T^2=0.6$,
$\mu_T=\tfrac12\sigma_T^2$, $S_0=100,K=110,rT=0.03$, and an arbitrary proper
part $r(w)=\sum B_j/(w-\hat u_j)$ with four poles at $\Re\hat u_j\in\{2.5,4.1\}$
(so $p^{*}=2.5$), contour $c=1.7\in(1,p^{*})$, $\kappa=1$. The **truth** was the
defining contour integral (2.1) evaluated by high-resolution quadrature; the
**series** was (6.5) with $q_n$ from (6.1)–(6.2) and $T^{(\delta)}_n$ from (6.3):

| $N$ | partial sum $S_N$ | $|S_N-C_{\text{truth}}|$ |
|---:|---|---|
| 0 | 22.5709661629 | $4.4\times10^{0}$ |
| 1 | 17.9192435886 | $2.3\times10^{-1}$ |
| 2 | 18.1842148976 | $3.8\times10^{-2}$ |
| 5 | 18.1467027836 | $1.0\times10^{-5}$ |
| 10 | 18.1466952685 | $2.9\times10^{-6}$ |
| 20 | 18.1466923922 | $1.8\times10^{-10}$ |
| **40** | **18.1466923924** | $\mathbf{1.1\times10^{-14}}$ |

with $C_{\text{truth}}=18.1466923924$ and coefficients decaying geometrically
($|q_n|$: $1.7{\times}10^{-1},6.0{\times}10^{-3},3.1{\times}10^{-4},1.5{\times}10^{-6},2.6{\times}10^{-9}$,
ratio $\to R^{-1}\approx0.5$). This is the mathematical ground truth: the single
series **is** the price, and it converges geometrically. (Beyond $N\!\approx\!45$
a *crude* FFT coefficient extraction hits roundoff; the exact recurrences (6.2)
in ball arithmetic do not — that is an artifact of the validation script, not
the construction.)

## 7.4 Convergence in the Padé order $M$

The fixed-$M$ result (U) above is self-contained. Whether $C_M\to C$ as
$M\to\infty$ is the conditional (C) statement (Stahl); it is orthogonal to the
single-series question and untouched here.

---

# 8. The Black–Scholes certificate (the $n=0$ term)

When the proper part vanishes ($r\equiv0$): $R\equiv0$, so $q_0=e^{0}=1$ and
$q_n=0$ for $n\ge1$. The series (6.5) collapses to

$$
C_M=Ke^{-rT}\big(T^{(1)}_0-T^{(0)}_0\big)=Ke^{-rT}\big(\mathcal E(1)-\mathcal E(0)\big).
$$

With $\mu_T=\tfrac12\sigma_T^2$ (martingale): $\mathcal E(0)=\tfrac12\mathrm{erfc}(z_0)=N(-\xi/\sigma_T)=N(d_2)$
and $Ke^{-rT}\mathcal E(1)=Ke^{-rT}\tfrac{S_0}{K}e^{rT}N(d_1)=S_0N(d_1)$, using
$N(x)=\tfrac12\mathrm{erfc}(-x/\sqrt2)$, $g(1)=-\tilde k$, $e^{-\tilde k}=\tfrac{S_0}{K}e^{rT}$,
and $-\xi/\sigma_T=d_2$, $-(\xi-\sigma_T^2)/\sigma_T=d_1$. Hence

$$
C_M=S_0N(d_1)-Ke^{-rT}N(d_2),\qquad
d_{1,2}=\frac{\log(S_0/K)+rT}{\sigma_T}\pm\frac{\sigma_T}{2}.
$$

Exactly Black–Scholes — now literally the **first term** of the one series, not
a degeneration of a lattice. This fixes $\xi=\tilde k+\mu_T$ and the prefactor
$Ke^{-rT}$ with no free constant.

---

# 9. What the post-`last_known_good` attempt did, and why it is wrong

Measured against the proven construction above (not against any source text):

1. **Multi-index price (`frmp.tex` Thm *price*, eq *Cprice*).** A sum over
   $\mathbb Z_{\ge0}^{2M}$, produced by Cauchy-multiplying $2M$ separate
   pole-exponential series. It is **not enumerable as one series** and so
   cannot be summed by `Σ{n=0..∞}`. The single series (6.5) replaces it; the
   $2M$ survives only as the fixed *length* of the recurrence (6.2).
2. **Assumed pole structure (`frmp.tex` A3 / Prop *strip*).** "2M simple poles,
   all in the lower half-plane, proved for large $M$" is a structural,
   asymptotic, generic claim about the roots of a computed polynomial. The
   price must not depend on it. §2–§7 use only **Euclidean division** (always
   valid) and **(H)** (a contour exists — necessary for finiteness). A3 is
   discarded entirely.
3. **Heuristic truncation (`arb.functions.ConvergentSeriesAccumulator`).** It
   stops when `|term| ≤ 2^{-bits/2}` and otherwise returns a min-term "best"
   partial sum. Neither is a verified tail enclosure: for any series whose
   terms shrink-then-grow it can stop early and return a ball that does **not**
   contain the truth, and the "best" return is a forbidden fallback. The
   geometric majorant (7.2) makes truncation sound and retires this class
   entirely — along with the `~` sigil, Aitken-Δ², `optimallyTruncated`, and
   the generation-time special-case dispatch (all accelerations/special-cases, none an
   enclosure).

---

# 10. Implementation in arb4j — make the source conform to the proven construction

The single series (6.5) is **one** `Σ{n=0..∞}` over three context-shared
`Sequence`s plus a verified tail. The correctness target is the mathematics of
§4–§8, validated as in §7.3 — not the present source.

**Build:**

1. **Proper part $r$.** From the diagonal $[M/M]$ Padé of the cgf Müntz series
   (`MuntzPadeApproximant`), take numerator/denominator and run **one**
   `GenericRingPolynomial.divrem` to get $\sigma_T^2,\mu_T,\rho$ as in (3.1).
   Assert $\sigma_T^2>0$; **throw** otherwise (explicit refusal, never a silent
   patch).
2. **Cayley coefficients $r_m$** by the C-finite recurrence of §6.2 (substitute
   (5.2), clear denominators with `ComplexPolynomial` arithmetic). One
   `Sequence`.
3. **Exponential coefficients $q_n$** by (6.2). One `Sequence` of `Complex`
   balls — the same convolution the compiler emits for `Σ k➔x^k/k!`.
4. **Kernel atoms** $\mathcal E(\delta),\,\partial^{m}\mathcal E(q)$ at the
   fixed nodes $0,1,q$ from `acb_hypgeom_erfc` and the two-term Hermite
   recurrence $P_{k+1}=P_k'+(\sigma_T^2w-\xi)P_k$. One `Sequence` per node.
5. **Term sequence** $t_n=q_n\big(T^{(1)}_n-T^{(0)}_n\big)$ via (6.4); sum with
   **one** `Σ{n=0..∞}`.
6. **Verified-tail accumulator.** A generic accumulator taking the term
   sequence **and the a-priori majorant** $\tau(N)=$ RHS of (7.2); stop when
   $\tau(N)\le2^{-p}$; return the ball $S_N\pm\tau(N)$.

Compiles to one expression of shape `n ➔ q(n)·(T₁(n) − T₀(n)) {n=0..∞}` with
`q,T₁,T₀` wired top-down through the context (the ordinary recursion
machinery), summed by the verified `Σ{..∞}`.

**Delete:** the multi-index price assembly; Assumption A3 / Prop *strip* and
the pole-list rotation/multinomial lemmas; `ConvergentSeriesAccumulator`'s
`2^{-bits/2}` stop and `best` return; the `~` sigil, Aitken-Δ²,
`optimallyTruncated`, the generation-time special-case dispatch. `MuntzPadeCumulantGenerator` need not
return: the cgf is `Σ{k=0..∞}d_k(v)z^k` and the price is the new
`Σ{n=0..∞}` of (6.5) — two ordinary infinite sums sharing one verified-tail
primitive.

**The one new primitive:** a `Σ{..∞}` whose convergence test consults an
a-priori majorant $\tau(N)\downarrow0$ attached to the summand, not the
magnitude of the last term. Every absolutely convergent series arb4j cares
about (this price, $e^x$, Mittag-Leffler, Fox-H) carries such a majorant;
making it a first-class part of the summand contract is the single principled
change that retires the whole heuristic tower.

**Validate** the implementation the way §7.3 validates the math: (i) exact
Black–Scholes on $r\equiv0$ to full precision; (ii) cross-check against the
defining contour integral (2.1) by independent quadrature on random admissible
surrogates; (iii) confirm geometric coefficient decay and that the certified
ball (7.2) actually contains the quadrature value. Agreement with the present
source is **not** a validation criterion.

---

# Appendix A. Standing facts used (all elementary)

$\mathrm{erfc}(z)=\tfrac2{\sqrt\pi}\int_z^\infty e^{-u^2}du$;
$\int_{\mathbb R}e^{-At^2+iBt}dt=\sqrt{\pi/A}\,e^{-B^2/4A}$ ($\Re A>0$);
$N(x)=\tfrac12\mathrm{erfc}(-x/\sqrt2)$;
$\partial_z^n e^{-z^2}=(-1)^nH_n(z)e^{-z^2}$ (physicists' $H_n$).

# Appendix B. Deferred proofs

**B.1 ($R_0>1$).** §5, Lemma 5.1: $|a+\kappa|^2-|a-\kappa|^2=4\kappa\Re a>0$ for
$a=\hat u-c$, $\Re a\ge p^{*}-c>0$. $\blacksquare$

**B.2 (node recurrence (6.4)).** From $\zeta=1+\tfrac{2\kappa}{w-q}$,
$\zeta^n=\zeta^{n-1}+\tfrac{2\kappa}{w-q}\zeta^{n-1}$. Divide by $w-\delta$,
integrate against $\tfrac1{2\pi i}e^{g}$, and use
$\tfrac1{(w-q)(w-\delta)}=\tfrac1{q-\delta}\big(\tfrac1{w-q}-\tfrac1{w-\delta}\big)$,
giving $T^{(\delta)}_n=T^{(\delta)}_{n-1}+\tfrac{2\kappa}{q-\delta}\big(T^{(q)}_{n-1}-T^{(\delta)}_{n-1}\big)$,
with $T^{(q)}_n$ the same family at node $q$ (whose atoms (4.3) carry the
$\mathbf 1_{\{\Re q>c\}}$ term, $q=c+\kappa>c$). $\blacksquare$

**B.3 (exp recurrence (6.2)).** $\Psi=e^{R}\Rightarrow\Psi'=R'\Psi$; matching
$\zeta^{n-1}$ coefficients in $\sum n q_n\zeta^{n-1}=(\sum m r_m\zeta^{m-1})(\sum q_k\zeta^k)$
gives $nq_n=\sum_{m=1}^n m r_m q_{n-m}$. $\blacksquare$

# Appendix C. Reproduction of the §7.3 certificate

Truth = quadrature of (2.1); series = (6.5) with (6.1)–(6.3). Independent
quadrature of (4.1) and (4.2) confirmed Lemmas 4.1–4.2 to $\le7\times10^{-16}$.
Key correctness guards a reimplementation must reproduce: the inverse-map sign
(5.2); nodes $\{0,1,q\}$ are fixed (never the surrogate poles); $|q_n|$ decays
at rate $R^{-1}<1$; the certified ball (7.2) encloses the quadrature value.
