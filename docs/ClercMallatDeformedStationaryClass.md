# The Clerc–Mallat Deformed Stationary Process Class

A complete exposition of the class as originally defined by Clerc and Mallat
(2003, *Annals of Statistics*, 31(6), pp. 1772–1821), together with the
unitary-amplitude extension introduced by Omer and Torresani and by
Meynard and Torresani, and the precise sense in which the phase-pullback
field \(Y\) of the Hardy Z-function inhabits this class.

All statements below are sourced from the primary text of
[Clerc–Mallat 2003](https://www.di.ens.fr/~mallat/papiers/WarpAnnStat.pdf)
and the later extensions in
[Omer–Torresani 2017 (HAL v2)](https://hal.science/hal-01094835v2/document) and
[Meynard–Torresani 2023 (ACHA)](https://hal.science/hal-03669280v2/file/ACHA_MT_HAL.pdf).

---

## 1. The setup: a deformation group acting on wide-sense stationary processes

Clerc and Mallat do not define a single class of nonstationary processes.
They define a **family of deformation groups** \(\mathcal D\) acting on the
set of wide-sense stationary (WSS) processes, and then study the orbits of
those groups. The "deformed stationary" class is the image of the WSS
processes under a chosen deformation group.

The underlying stationary process \(Y\) is always assumed
[(CM §2, page 2)](https://www.di.ens.fr/~mallat/papiers/WarpAnnStat.pdf):

- wide-sense stationary, i.e. \(\mathbb E\{Y(x)\}\) constant and
  \(\mathbb E\{Y(x)Y^*(y)\} = c_Y(x-y)\) with \(c_Y(0)<\infty\);
- stochastically continuous, i.e. \(c_Y\) is continuous at \(0\);
- realization-wise a function of \(\mathbb R^d\) (continuity of sample
  paths follows from the Dudley–Fernique criterion, which the authors
  note is implied by \(|c_Y(x)-c_Y(0)| = O(|\log|x||^{-1-\varepsilon})\),
  satisfied in all their estimation theorems).

Three deformation groups are defined in the paper. Only the second is the
one you need for the Hardy \(Z\) setup.

### 1.1 The frequency-modulation group (Example 1, eq. (1))

\[
\mathcal D \;=\; \bigl\{\,D_\vartheta : D_\vartheta f(x) = e^{i\vartheta(x)}\, f(x),
\ \vartheta\in C^4(\mathbb R,\mathbb R)\,\bigr\}.
\]

Stationarity-invariant subgroup: \(G_{(\varphi,\xi)} f(x) = e^{i(\varphi+\xi x)} f(x)\).
Identifiable quantity: \(\vartheta''\).

### 1.2 The one-dimensional warping group (Example 2, eq. (3)) — the relevant class

\[
\boxed{\ \mathcal D \;=\; \bigl\{\,D_\theta : D_\theta f(x) = f\!\bigl(\theta(x)\bigr),\ \theta\in C^3(\mathbb R,\mathbb R),\ \theta'(x)>0\ \bigr\}.\ }
\tag{CM-Eq.~3}
\]

A "deformed stationary process" in the original Clerc–Mallat sense is
therefore any process of the form

\[
X(x) \;=\; D_\theta Y(x) \;=\; Y\!\bigl(\theta(x)\bigr),
\qquad Y \text{ WSS},\ \theta\in C^3,\ \theta'>0.
\]

Note well: **no amplitude factor \(\sqrt{\theta'(x)}\) is present in the
original definition.** The absence of this factor is what allows the
class to act by pure reparametrisation. The amplitude factor was
introduced later to make the operator unitary on \(L^2(\mathbb R)\) — see
§5 below.

Stationarity-invariant subgroup: the **affine group**
\(G_{(u,s)} f(x) = f(u+s x)\) with \(s>0\). Identifiable quantity (the
"deformation gradient"):

\[
(\log\theta')'(x) \;=\; \frac{\theta''(x)}{\theta'(x)}.
\tag{CM-Eq.~4}
\]

### 1.3 The d-dimensional warping group (Example 3, eq. (7))

\[
\mathcal D \;=\; \bigl\{\,D_\theta : D_\theta f(x) = f\!\bigl(\theta(x)\bigr),\ \theta\in C^3(\mathbb R^d,\mathbb R^d),\ \det J_\theta(x)>0\,\bigr\}.
\]

Stationarity-invariant subgroup: the affine group \(\{u + S x : u\in\mathbb R^d,\ S\in GL^+(\mathbb R^d)\}\).
Identifiable quantity: \(J_\theta^{-1}(x)\,\partial_k J_\theta(x)\) for \(k=1,\dots,d\) (CM Eq. 9).

---

## 2. The covariance structure of a Clerc–Mallat warped process (1D)

For \(X = Y\circ\theta\) with \(Y\) WSS, the second-order structure is:

\[
\mathbb E\{X(x)\} \;=\; \mathbb E\{Y(0)\},
\qquad
c_X(x,y) \;=\; \mathbb E\{X(x)X^*(y)\} \;=\; c_Y\!\bigl(\theta(x)-\theta(y)\bigr).
\tag{★}
\]

This is NOT translation-invariant: \(c_X(x,y)\) depends on \(x,y\) through
\(\theta(x)-\theta(y)\), not through \(x-y\). That is the failure of
stationarity. Stationarity is recovered iff \(\theta\) is affine, i.e.
\(\theta(x)=u+sx\) with \(s>0\).

The identity (★) is literally the unique content of the class at the
level of second moments: **the autocovariance of \(X\) is the pullback
of the autocovariance of \(Y\) by the diagonal warping
\((x,y)\mapsto(\theta(x),\theta(y))\).**

---

## 3. What makes the class useful: the scale-transport theorem

This is the single structural theorem of the paper, stated verbatim from
Theorem 3.1 [(CM page 6)](https://www.di.ens.fr/~mallat/papiers/WarpAnnStat.pdf).

### 3.1 Assumptions

\(Y\) is WSS with covariance satisfying

\[
c_Y(0) - c_Y(x) \;=\; |x|^h\,\eta(x),\qquad h>0,\ \eta(0)>0,\ \eta\in C^1 \text{ near }0.
\tag{CM-Eq.~22}
\]

\(\psi\) is a \(C^1\) wavelet (zero mean) supported in \([-1,1]\) with

\[
\int\psi\,dx=0,\qquad \operatorname{Re}\!\iint |x-y|^h\,\psi^*(x)\psi(y)\,dx\,dy\ \neq\ 0.
\tag{CM-Eq.~23}
\]

\(\theta\in C^3\), \(\theta'(x)>0\).

### 3.2 The scalogram

\[
A_X(u,s) \;:=\; \mathbb E\!\left|\,\bigl\langle X,\ s^{-1}\psi(s^{-1}(\cdot-u))\bigr\rangle\,\right|^2.
\tag{CM-Eq.~20}
\]

### 3.3 Theorem 3.1 (Scale transport)

For each \(u\) with \(\theta''(u)\neq 0\), as \(s\to 0\),

\[
\boxed{\ \partial_u A_X(u,s) \;-\; (\log\theta')'(u)\,\partial_{\log s} A_X(u,s) \;=\; O(s)\,\partial_u A_X(u,s).\ }
\tag{CM-Eq.~24}
\]

In words: at small scales, the squared wavelet transform of a deformed
stationary process satisfies a transport PDE in the time–scale
half-plane whose velocity is exactly the deformation gradient
\((\log\theta')'\). Sending \(s\to 0\) recovers \((\log\theta')'(u)\)
from a single realisation.

The frequency-modulation and multidimensional versions are Theorems 3.2
and in §3.4; their structure is identical (transport in time–frequency
or time–matrix-scale, with velocity equal to the corresponding
deformation gradient).

---

## 4. Identifiability (Propositions 2.1, 2.2, 2.3; Theorem A)

The crucial structural property of the class is that the deformation
\(\theta\) is recoverable from a single realisation of \(X\), up to the
affine ambiguity.

### 4.1 One-dimensional warping (Proposition 2.2)

**Assume** \(Y\) is WSS with covariance \(c_Y\) that is \(C^1\) on some
\((0,\varepsilon]\) and

\[
\forall x\in(0,\varepsilon],\qquad c_Y'(x) < 0.
\tag{CM-Eq.~5}
\]

**Then** the equivalence class of \(D_\theta\) in \(\mathcal D/G\) is
uniquely characterised by the covariance of \(X=D_\theta Y\). Equivalently:
\(\theta\) is determined by \(c_X\) up to affine transformation
\(\theta(x) \mapsto u + s\,\theta(x)\).

The condition \(c_Y'<0\) on a right neighbourhood of \(0\) is satisfied
by a broad class: Ornstein–Uhlenbeck, Poisson pulse processes, and any
\(Y\) whose spectral density is a positive integrable function with
\(\int \xi^2 S_Y(\xi)\,d\xi < \infty\). It excludes white noise
(\(c_Y\equiv 0\) off the diagonal).

### 4.2 Proof sketch of the identifiability

Suppose \(D_\theta Y\) and \(D_{\tilde\theta}\tilde Y\) have the same
covariance with \(Y,\tilde Y\) both WSS. Equating covariances:

\[
c_Y\!\bigl(\theta(x)-\theta(y)\bigr) \;=\; c_{\tilde Y}\!\bigl(\tilde\theta(x)-\tilde\theta(y)\bigr).
\]

Set \(\mu := \theta\circ\tilde\theta^{-1}\). Then
\(c_{\tilde Y}(z) = c_Y\!\bigl(\mu(a)-\mu(b)\bigr)\) whenever \(z=a-b\).
Differentiating and using \(c_Y' < 0\) on \((0,\varepsilon]\) forces
\(\mu\) to be affine. This is proved in detail in CM Appendix A
[(pages 33–36)](https://www.di.ens.fr/~mallat/papiers/WarpAnnStat.pdf).

### 4.3 Multidimensional warping (Proposition 2.3)

**Assume** \(c_Y\) admits the local expansion
\(c_Y(0) - c_Y(z) = |z|^h \eta(z)\) with \(\eta(0)>0\), \(\eta\in C^2\) near
\(0\). **Then** the equivalence class of \(D_\theta\) in \(\mathcal D/G\)
is uniquely characterised by the covariance of \(X\).

---

## 5. The unitary-amplitude extension (Omer–Torresani 2017; Meynard 2019)

A decade after Clerc–Mallat, the same deformation was reintroduced in a
form better suited to \(L^2\)-analysis. Omer and Torresani define the
**time-warping operator**
[(OT eq.~(2), page 3)](https://hal.science/hal-01094835v2/document):

\[
\boxed{\ \bigl[\mathcal D_\gamma x\bigr](t) \;=\; \sqrt{\gamma'(t)}\ x\!\bigl(\gamma(t)\bigr),\qquad \gamma\in C^2,\ \gamma'>0.\ }
\tag{OT-Eq.~2}
\]

The amplitude \(\sqrt{\gamma'(t)}\) is the Jacobian half-power that makes
\(\mathcal D_\gamma\) **unitary on \(L^2(\mathbb R)\)**: for every
\(x\in L^2\),

\[
\|\mathcal D_\gamma x\|_{L^2}^2 \;=\; \int |\sqrt{\gamma'(t)}\,x(\gamma(t))|^2\,dt
\;=\; \int |x(\gamma(t))|^2\,\gamma'(t)\,dt \;\stackrel{u=\gamma(t)}{=}\; \int |x(u)|^2\,du
\;=\; \|x\|_{L^2}^2.
\]

The following identities hold:

- **Composition:** \(\mathcal D_\gamma \mathcal D_\phi = \mathcal D_{\phi\circ\gamma}\) for \(\phi,\gamma\in C^2\).
- **Inverse:** \((\mathcal D_\gamma)^{-1} = \mathcal D_{\gamma^{-1}}\).
- **Action on white noise (OT Lemma 1):** if \(N\) is complex Gaussian white noise of variance \(\sigma_0^2\), then \(\mathcal D_\gamma N\) is complex Gaussian white noise of the same variance.

### 5.1 The controlled condition

Omer–Torresani restrict the class to **controlled** warpings
[(OT page 9, eq.~(28))](https://hal.science/hal-01094835v2/document):

\[
\boxed{\ 0 < c_\gamma \;\le\; \gamma'(t) \;\le\; C_\gamma < \infty\quad\text{for all } t\in\mathbb R.\ }
\tag{OT-controlled}
\]

Without the upper bound, \(\mathcal D_\gamma\) is still unitary on
\(L^2\), but several of their subsequent results (wavelet-domain
translation approximation, transport error bounds) fail because they
require \(\|\gamma''\|_\infty < \infty\) relative to \(c_\gamma,C_\gamma\).

An alternative, milder sufficient condition for \(\mathcal D_\gamma\) to
preserve the Schwartz class \(\mathcal S(\mathbb R)\) is stated at OT
page 9:

\[
\gamma\in C^\infty,\ \text{all derivatives of polynomial growth},\ |\gamma(t)|>\alpha|t|^\beta\ \text{for }|t|>t_0,\ \alpha,\beta>0.
\]

### 5.2 The generative model with noise (OT eq.~(29))

\[
Y(t) \;=\; [\mathcal D_\gamma X](t) + N(t),
\]

with \(X\) WSS with absolutely continuous spectrum, \(N\) Gaussian white
noise of variance \(\sigma_0^2\), and \(\gamma\) controlled.

### 5.3 The key structural result: wavelet-domain transport

For an analytic wavelet \(\psi\) localised near the origin with scale
parameter \(q>1\), the continuous wavelet transform \(W_Y\) of the
deformed process satisfies, to leading order
[(OT §III, equation displayed just before Lemma 2)](https://hal.science/hal-01094835v2/document):

\[
W_{\mathcal D_\gamma X}(m,n) \;\approx\; W_X\!\bigl(m + \log_q(\gamma'(na)),\ \gamma(na)\bigr).
\]

This is the wavelet-domain version of Clerc–Mallat's transport
equation (CM-Eq. 24): time-warping translates into a vertical shift by
\(\log_q\gamma'\) in the log-scale axis.

### 5.4 Error bound (OT Theorem 2)

Under (OT-controlled) plus the decay condition
\(\rho_X(\alpha) := \int |\nu|^{2-6/(\alpha+2)} S_X(\nu)\,d\nu < \infty\)
and \(|\psi(t)|\le(1+|t|^\alpha)^{-1}\) with \(\alpha>2\),

\[
W_Y(m,n) \;=\; W^{(\delta_n;\tau_n)}(m) + W_N(m,n) + \epsilon_{mn},
\]

with the variance bound

\[
\mathbb E|\epsilon_{mn}|^2 \;\le\; \|\gamma''\|_\infty^2\, q^{3m}\!\left(K_0\,\sigma_X + K_1 \|\gamma''\|_\infty^{-3/(\alpha+2)}\,q^m\,q^{-6m/(\alpha+2)}\rho_X(\alpha)\right).
\]

### 5.5 The covariance of \(\mathcal D_\gamma X\)

For the unitary version, the covariance is

\[
R_{\mathcal D_\gamma X}(t,s) \;=\; \sqrt{\gamma'(t)\,\gamma'(s)}\ c_X\!\bigl(\gamma(t)-\gamma(s)\bigr),
\tag{★★}
\]

obtained by multiplying (★) by the product of the Jacobian half-powers.
If \(X\) has spectral density \(S_X\) with spectral representation
\(X(t) = \int e^{i\xi t}\,d\Phi(\xi)\), then

\[
(\mathcal D_\gamma X)(t) \;=\; \sqrt{\gamma'(t)}\int e^{i\xi\gamma(t)}\,d\Phi(\xi),
\]

and Fubini–orthogonality gives

\[
R_{\mathcal D_\gamma X}(t,s) \;=\; \sqrt{\gamma'(t)\,\gamma'(s)}\int e^{i\xi(\gamma(t)-\gamma(s))}\,dS_X(\xi).
\]

This is the "time-warped Cramér representation" that appears in the
V2 companion document and that is being folded into Appendix A.8 of the
paper.

---

## 6. What is NOT in the Clerc–Mallat paper

A paragraph has circulated in review of this topic claiming that the
Clerc–Mallat class "contains all stationary processes and generalises
oscillatory processes of Priestley (1965) and locally stationary
processes of Dahlhaus (1997)." **That paragraph is not in the paper.**
Direct text search of the full CM 2003 manuscript shows no occurrence
of the strings "Priestley", "Dahlhaus", "oscillatory", "locally
stationary", "harmonizable", or "Silverman". The paper defines
deformation groups, proves identifiability, and derives transport
equations. It does not situate itself relative to Priestley's or
Dahlhaus's classes.

The correct statements are:

1. Every stationary process \(Y\) is a Clerc–Mallat warped process
   \(X = Y\circ\theta\) with \(\theta = \mathrm{id}\). So the class
   contains the stationary processes trivially.
2. A Clerc–Mallat warped process is **not in general** a Priestley
   oscillatory process, because Priestley oscillatory processes have
   covariance in the bimeasure form \(\iint A(t,\xi)A^*(s,\xi)\,d\mu(\xi)\)
   with \(A\) oscillatory, and (★) does not reduce to this form unless
   extra structure is assumed on \(c_Y\) and \(\theta\).
3. A Clerc–Mallat warped process is **not in general** a Dahlhaus
   locally stationary process, because Dahlhaus's class requires a
   smooth time-varying transfer function \(A(t/T,\lambda)\) in a
   triangular-array spectral representation, whereas warping acts on
   the time argument itself.
4. A Clerc–Mallat warped process with absolutely continuous \(c_Y\)
   and smooth \(\theta\) is **weakly harmonizable** iff a bimeasure
   spectral decomposition exists for \(c_X(t,s)\), which is not
   automatic from (★).

The correct one-line description is: the Clerc–Mallat class is the
orbit, under the warping group of \(C^3\)-diffeomorphisms of \(\mathbb R\)
(resp. \(C^3\)-diffeomorphisms of \(\mathbb R^d\)), of the set of WSS
processes. Nothing more, nothing less.

---

## 7. Where the Hardy Z-function sits

Let \(Z(t) = e^{i\theta(t)}\zeta(\tfrac12+it)\) be the Hardy
Z-function and let \(\Theta(t) = \theta(t)+ct\) with \(c>c_{**}\) the
monotonised Riemann–Siegel phase of the paper. Define

\[
Y(u) \;:=\; \frac{Z(\Theta^{-1}(u))}{\sqrt{\Theta'(\Theta^{-1}(u))}}.
\]

The inverse identity reads

\[
Z(t) \;=\; \sqrt{\Theta'(t)}\ Y\!\bigl(\Theta(t)\bigr) \;=\; \bigl[\mathcal D_{\Theta}\,Y\bigr](t),
\tag{Z-warp}
\]

which is **exactly** the Omer–Torresani warping operator of §5 applied
to the (entire, exponential-type-\(\le 1\)) function \(Y\). Therefore:

### 7.1 Formal membership in the original Clerc–Mallat class (CM-Eq. 3)

The original 1D warping group requires \(\theta\in C^3\) and
\(\theta'>0\). With \(\theta \rightsquigarrow \Theta\):

- **\(\Theta\in C^\infty\):** immediate, since \(\theta\) is
  holomorphic on \(\{|\Im t|<1\}\) by [Lemma: theta holomorphic on §2 of the paper](https://github.com/crowlogic/arb4j/blob/master/docs/Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex).
- **\(\Theta'>0\):** the paper's Lemma "Strict positivity of \(\Theta'\) on the strip" gives \(\Re\Theta'(t)\ge c - c_{**} > 0\) for every admissible \(c\).

So \(Z = Y\circ\Theta\) up to the amplitude factor is a Clerc–Mallat
warped process in the sense of the original CM-Eq. 3. The original
warping group has **no upper bound on \(\theta'\)**.

### 7.2 Membership in the unitary (Omer–Torresani) class

The unitary-on-\(L^2\) form (Z-warp) is the Omer–Torresani operator
\(\mathcal D_\Theta\) applied to \(Y\). Membership in their **full**
class additionally requires

\[
0 < c_\Theta \le \Theta'(t) \le C_\Theta < \infty\quad\text{for all }t\in\mathbb R.
\]

The lower bound holds: \(\Theta'(t)\ge c-c_{**}>0\).

The upper bound **fails**. The digamma asymptotic used throughout the
paper,

\[
\theta'(t) \;=\; \tfrac12\operatorname{Re}\psi(\tfrac14+\tfrac{it}{2}) - \tfrac12\log\pi
\;=\; \tfrac12\log\!\left(\tfrac{t}{2\pi}\right) + O(t^{-2})\quad(t\to\infty),
\]

gives

\[
\Theta'(t) \;=\; \tfrac12\log\!\left(\tfrac{t}{2\pi}\right) + c + O(t^{-2})\ \to\ \infty.
\]

So \(\Theta'\) is unbounded. This has two consequences:

1. \(Z\) is in the **uncontrolled** Omer–Torresani class (the operator
   \(\mathcal D_\Theta\) is still unitary on \(L^2(\mathbb R)\), by the
   Jacobian change of variable, which only needs \(\Theta'>0\) and
   \(\Theta\) a diffeomorphism; the lower bound \(c_\Theta>0\) plus
   \(\Theta\) surjective onto \(\mathbb R\) are what is used for
   unitarity).
2. \(Z\) is outside the scope of OT's Theorem 2 error bound, which
   requires \(C_\Theta<\infty\). This bound is about wavelet-domain
   estimation — irrelevant to the RH argument.

### 7.3 The strict statement

\[
\boxed{\ Z \text{ is in the Clerc–Mallat deformed stationary class in the original sense of CM-Eq.~3, and in the Omer–Torresani unitary form of (Z-warp), without the OT upper-bound condition.}\ }
\]

Equivalently: \(Z\) is a warped stationary process with unbounded
warping-derivative \(\Theta'\). The unboundedness is benign for every
argument used in the paper — unitarity, Cramér representation
pullback, Paley–Wiener, and Akhiezer — all of which rely only on
\(\Theta'>0\), \(\Theta\in C^\infty\), and \(\Theta\) an injective
biholomorphism of the critical strip.

---

## 8. The covariance of \(Z\) in the class

Applying (★★) with \(\gamma\rightsquigarrow\Theta\):

\[
R_Z(t,s) \;=\; \sqrt{\Theta'(t)\,\Theta'(s)}\ c_Y\!\bigl(\Theta(t)-\Theta(s)\bigr),
\]

and if \(Y\) has spectral measure \(S\) supported in \([-1,1]\)
(which is the content of the paper's main theorem) then

\[
R_Z(t,s) \;=\; \sqrt{\Theta'(t)\,\Theta'(s)}\int_{-1}^{1} e^{i\xi(\Theta(t)-\Theta(s))}\,dS(\xi).
\]

This is the "time-warped Cramér representation of \(Z\)" that the V2
companion document was trying to establish, and it is the intended
content of the expanded Appendix A.8.

---

## 9. Summary of the class, in one page

| Aspect | Original Clerc–Mallat 2003 | Omer–Torresani / Meynard–Torresani extension |
|---|---|---|
| Operator | \(D_\theta f(x) = f(\theta(x))\) | \(\mathcal D_\gamma x(t) = \sqrt{\gamma'(t)}\,x(\gamma(t))\) |
| Amplitude | None | \(\sqrt{\gamma'(t)}\) (makes it unitary on \(L^2\)) |
| Smoothness | \(\theta\in C^3\) | \(\gamma\in C^2\); \(C^\infty\) with polynomial growth for Schwartz invariance |
| Monotonicity | \(\theta'(x)>0\) | \(\gamma'(t)>0\) |
| Upper bound on derivative | **None** | **\(\gamma'\le C_\gamma<\infty\)** (the "controlled" condition) |
| Covariance of \(D Y\) | \(c_Y(\theta(x)-\theta(y))\) | \(\sqrt{\gamma'(t)\gamma'(s)}\,c_Y(\gamma(t)-\gamma(s))\) |
| Identifiable quantity | \((\log\theta')'\) up to affine | \(\gamma'\) up to affine |
| Stationarity-invariant group | affine \(\{u+sx:s>0\}\) | affine |
| Transport equation | \(\partial_u A_X - (\log\theta')'\,\partial_{\log s} A_X = O(s)\) | Wavelet translation \(W_{\mathcal D_\gamma X}(m,n)\approx W_X(m+\log_q\gamma',\gamma(n))\) |
| Sample paths | Continuous if \(Y\) continuous (pullback) | Same; \(L^2\)-isometric |
| Weakly harmonizable? | Not in general | Not in general |
| Dahlhaus locally stationary? | Not in general | Not in general |
| Priestley oscillatory? | Not in general | Not in general |

The Hardy Z-function lives in the Omer–Torresani cell of the second
column, with the one caveat that \(\Theta'\) is unbounded above. Every
use of the class in the paper depends only on unitarity (which holds)
and on the covariance identity (★★) (which holds).
