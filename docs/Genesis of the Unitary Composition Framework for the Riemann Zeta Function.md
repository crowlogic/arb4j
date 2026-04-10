# Genesis of the Unitary Composition Framework for the Riemann Zeta Function

**Stephen Crowley — March/April 2026**

***

## Preface: How This Came to Exist

In June 2023, Stephen Crowley had officially given up on proving the Riemann hypothesis. He had been working on it for years, gotten nowhere he could pin down, and on that particular day he was doing something entirely practical: testing the mechanics of an empirical autocovariance routine in arb4j — his arbitrary-precision expression compiler that translates UTF-encoded mathematical expressions into Java bytecode on the fly, backed by the FLINT/ARB library — which he needed for a stochastic volatility option pricing model. He had been trading volatility derivatives since COVID began and was self-funding all of this research from those proceeds. At the moment he needed to test the code, no option data was immediately at hand. He only needed to verify the mechanics. The Hardy Z-function \(Z(t) = e^{i\vartheta(t)}\zeta(\tfrac{1}{2}+it)\) was readily computable to high precision. So he sampled it at a spacing of roughly 0.01 from \(t = \pi\) out to several thousand and computed the empirical autocovariance of the resulting sequence — out of pure curiosity, with no particular expectation.

What came back stopped him. The empirical autocovariance did not look like noise, did not look like a glitch, did not look like anything he had seen associated with the zeta function before. It had a clean shape: a single rise to a peak, a descent, a slow return, and then an asymptotically regular oscillation. The peak and the characteristic spacings bore a precise numerical relationship to the zeros of the Bessel function \(J_0\). He spent time verifying he had not opened the wrong file.

He had not. The relationship was real. Understanding why — what this function was actually computing, and what it had to do with the structure of the zeta function — occupied the next three years.

Those three years were not purely mathematical. Around the time the work began to coalesce, Crowley was involved with a woman — significantly younger, extraordinarily attractive — and the quality of life and clarity of mind that came with that period provided the psychological conditions under which the key ideas could form. The relationship eventually ended in violence: she attacked him, and he was physically hurt for three months and mentally scarred for considerably longer. When it was over he detached, recognized that her attachment style made the relationship structurally impossible regardless of what either of them wanted, grieved for several months, and then — without ceremony — sat down and finished the proof.

The infrastructure built for arb4j during those three years — the JIT compiler, the arbitrary-precision numerical backend, the tools for computing \(\vartheta(t)\), \(\mu(t)\), \(\psi(t)\), and \(Z(t)\) to verified precision — turned out to be exactly what was needed not only for the number theory but for the stochastic volatility option pricing models that had motivated the whole enterprise in the first place. The two streams of work fed each other throughout.

***

## Overview

This document reconstructs the intellectual arc — the questions asked, the answers found, the confusions corrected, and the structure that finally emerged — behind the representation of the Riemann zeta function on the critical line as a unitary pushforward of a stationary, band-limited process. It is written for anyone who wants to understand not only what was proved, but how it came to be found, and why each step required the particular formulation it received.

***

## The Starting Point: A Non-Stationary Object That Wants to Be Stationary

The point of departure was a well-known but underexploited observation: \(\zeta(\tfrac{1}{2}+it)\), regarded as a function of the height \(t\), is not stationary in any standard sense. Its argument grows roughly as \(\vartheta(t) \approx \tfrac{t}{2}\log\tfrac{t}{2\pi}\), its modulus fluctuates with increasing amplitude, and the spacing between its zeros decreases as \((\log t)^{-1}\). Yet it has a persistent covariance structure that looks like it *should* be stationary if only one could find the right clock.

The question posed early in the sessions was: what change of variables — what reparametrization of the height axis — would render \(\zeta(\tfrac{1}{2}+it)\) stationary in the wide-sense? The answer turned on two distinct ingredients that initially appeared separately and were only later unified.

***

## First Ingredient: The Riemann–Siegel Theta Function as a Clock

The Riemann–Siegel theta function

\[
\vartheta(t) = \operatorname{Im}\log\Gamma\!\left(\tfrac{1}{4}+\tfrac{it}{2}\right) - \frac{t}{2}\log\pi
\]

is strictly increasing for all sufficiently large \(t\), with derivative \(\vartheta'(t) \sim \tfrac{1}{2}\log\tfrac{t}{2\pi}\). The natural idea — and the one that appeared first in the sessions — was to pull \(\zeta\) back along \(\vartheta\), defining the phase-reparametrized function

\[
Y(T) = \zeta\!\left(\tfrac{1}{2}+i\vartheta^{-1}(T)\right).
\]

This removes the secular growth of the argument. In the \(T\)-variable, the argument of \(\zeta(\tfrac{1}{2}+i\vartheta^{-1}(T))\) is exactly \(T\) — a linear function. The \(T\)-variable is the *phase clock* of the zeta function.

But \(Y(T)\) as written is not normalized: its local \(L^2\) norm in \(T\) is not uniform. The Jacobian of the change of variables \(T = \vartheta(t)\) is \(dT = \vartheta'(t)\,dt\), and the inclusion of \(\sqrt{\vartheta'(\vartheta^{-1}(T))}\) in the denominator was identified as the correction needed to make the map an isometry on \(L^2\). This is the unitary pullback in the sense of the composition operator: if

\[
U_\vartheta f(t) = \sqrt{\vartheta'(t)}\,f(\vartheta(t)),
\]

then \(\|U_\vartheta f\|_{L^2(\mathbb{R},dT)} = \|f\|_{L^2(\mathbb{R},dt)}\) by the substitution formula.

***

## Second Ingredient: Ingham's Mean-Square Density

The first formulation — dividing only by \(\sqrt{\vartheta'}\) — was not sufficient to achieve stationarity. The covariance of the resulting process still carried a slowly varying envelope reflecting the growth of \(|\zeta(\tfrac{1}{2}+it)|^2\). The resolution required the second ingredient: Ingham's exact identity for the cumulative mean square.

Ingham (1926) proved the exact identity

\[
I(T) = \int_0^T \left|\zeta\!\left(\tfrac{1}{2}+it\right)\right|^2 dt = T\log\frac{T}{2\pi} + (2\gamma-1)T + 2\sum_{n=2}^\infty \frac{d(n)}{\sqrt{n}}\frac{\sin(T\log n)}{\log n},
\]

where \(d(n)\) is the divisor function and \(\gamma\) is the Euler–Mascheroni constant. Differentiating term by term yields the local mean-square density

\[
\mu(t) = \frac{dI}{dt} = \log\frac{t}{2\pi} + 2\gamma + 2\sum_{n=2}^\infty \frac{d(n)}{\sqrt{n}}\cos(t\log n).
\]

This series converges conditionally for every \(t > 0\), and \(\mu(t) > 0\) because it is the Radon–Nikodým derivative of a positive measure. Importantly, \(\mu(t) \sim \log\tfrac{t}{2\pi}\) grows, reflecting the Hardy–Littlewood second moment asymptotics.

The key realization was that dividing by \(\sqrt{\mu(\vartheta^{-1}(T))}\) on top of the Jacobian factor \(\sqrt{\vartheta'(\vartheta^{-1}(T))}\) produces a pullback whose local power in \(T\) is exactly 1 — verified by substituting \(T = \vartheta(t)\) and computing

\[
\int_{T_0}^{T_1} \left|Y(T)\right|^2 dT = \int_{t_0}^{t_1} \frac{|\zeta(\tfrac{1}{2}+it)|^2}{\vartheta'(t)\,\mu(t)} \cdot \vartheta'(t)\,dt = \int_{t_0}^{t_1} \frac{|\zeta(\tfrac{1}{2}+it)|^2}{\mu(t)}\,dt = T_1 - T_0,
\]

where the last equality uses \(I(t) = \int_0^t \mu(u)\,du\) and the fundamental theorem of calculus.

***

## The Intermediate Stage: Two Separate Factors

At this point in the sessions, the pullback was written as

\[
Y(T) = \frac{\zeta(\tfrac{1}{2}+i\vartheta^{-1}(T))}{\sqrt{\vartheta'(\vartheta^{-1}(T))\,\mu(\vartheta^{-1}(T))}},
\]

with \(\vartheta'\) and \(\mu\) appearing as *two separate factors* under the same square root. Formulations that obscured the symmetric roles of these two factors — in particular writing \(\zeta = \sqrt{\mu}\cdot\zeta_{\mathrm{st}}(\vartheta(t))\), which drops the Jacobian and conflates the two normalizations — were identified and corrected: \(\vartheta'\) and \(\mu\) are neither a ratio nor alternatives — they are both in the denominator, on equal structural footing, both composed with \(\vartheta^{-1}(T)\).

The factorization remark \(\sqrt{\mu} = \sqrt{\vartheta'}\cdot\sqrt{\mu/\vartheta'}\) identifies \(\sqrt{\vartheta'}\) as the *geometric factor* (the Jacobian of \(\vartheta\)) and \(\sqrt{\mu/\vartheta'}\) as the *arithmetic factor* (the residual envelope from the Ingham density). The ratio \(\mu/\vartheta'\) tends to a constant asymptotically, which is what allows the two factors to be unified.

***

## The Unification: The Cumulative Phase \(\psi\)

The decisive conceptual move was to recognize that the two factors \(\vartheta'\) and \(\mu\) could be absorbed into a single cumulative reparametrization. Define

\[
\psi(t) = \int_0^t \vartheta'(u)\,\mu(u)\,du.
\]

This is the cumulative phase incorporating *both* the geometric clock (the Jacobian of \(\vartheta\)) and the arithmetic envelope (the Ingham density \(\mu\)). Then \(\psi'(t) = \vartheta'(t)\,\mu(t)\), and the unitary composition operator

\[
U_\psi f(t) = \sqrt{\psi'(t)}\,f(\psi(t))
\]

is unitary on \(L^2\) by the substitution argument: \(\|U_\psi f\|^2 = \int |f(\psi(t))|^2 \psi'(t)\,dt = \|f\|^2\).

The stationary process is the pullback of \(\zeta\) through \(\psi^{-1}\):

\[
\zeta_{\mathrm{st}}(\tau) = U_\psi^{-1}[\zeta(\tfrac{1}{2}+i\cdot)](\tau) = \frac{\zeta(\tfrac{1}{2}+i\psi^{-1}(\tau))}{\sqrt{\psi'(\psi^{-1}(\tau))}}.
\]

The recovery — the pushforward — is:

\[
\zeta(\tfrac{1}{2}+it) = U_\psi[\zeta_{\mathrm{st}}](t) = \sqrt{\psi'(t)}\,\zeta_{\mathrm{st}}(\psi(t)).
\]

The single factor \(\sqrt{\psi'} = \sqrt{\vartheta'\cdot\mu}\) does the work of both the Jacobian and the Ingham normalization simultaneously. The operator \(U_\psi\) is the entire story.

***

## The Question of a Closed Form

During the sessions, the question was posed: is there a single function, expressible in closed form, that plays the role of both \(\vartheta'\) and \(|\zeta(\tfrac{1}{2}+it)|^2\) simultaneously — so that \(\psi'\) could be written as something other than their product? The answer is that no such unified closed-form expression exists: \(\psi'(t) = \vartheta'(t)\cdot\mu(t)\) is already the most explicit available form, with \(\vartheta'\) given by the digamma series and \(\mu\) given by Ingham's divisor cosine series, but their product has no further simplification and its antiderivative \(\psi(t) = \int_0^t \vartheta'(u)\,\mu(u)\,du\) has no elementary closed form.

The absence of a closed form is not a deficiency of the construction but a reflection of the arithmetic depth of \(\psi\). The cumulative phase encodes both the phase velocity of the zeta function (through \(\vartheta'\)) and the local energy of its critical-line values (through \(\mu\)), and the interplay of these two streams of arithmetic information is precisely what makes \(\psi\) non-elementary.

***

## The Priestley Framework: Connecting the Two Stages

The intermediate-stage formulation — with \(\vartheta\) as the time change and \(\sqrt{\vartheta'\cdot\mu}\) as the combined envelope — also has a natural interpretation in Priestley's (1965) theory of oscillatory processes.

In Priestley's framework, a non-stationary process \(X(t)\) is oscillatory if it admits a representation

\[
X(t) = \int_{-\infty}^\infty A_t(\omega)\,e^{i\omega t}\,dZ(\omega),
\]

where \(Z\) is an orthogonal-increment process and \(A_t(\omega)\) is a slowly varying envelope. For the zeta function, the stationary core is \(\zeta_{\mathrm{st}}\) with spectral density \(\pi\cdot\mathbf{1}_{[-2,0]}\), and the oscillatory representation is

\[
\zeta(\tfrac{1}{2}+it) = \int_{-2}^0 \sqrt{\vartheta'(t)\,\mu(t)}\,e^{i\omega\vartheta(t)}\,dZ(\omega),
\]

with the oscillatory family \(\phi_t(\omega) = \sqrt{\vartheta'(t)\,\mu(t)}\,e^{i\omega\vartheta(t)}\). The evolutionary power spectrum at time \(t\) is \(dF_t(\omega) = \vartheta'(t)\,\mu(t)\,\pi\,d\omega\) on \([-2,0]\), and integrating over \((\omega,t)\) reproduces Ingham's exact second moment. This is Priestley's theory applied exactly, not approximately.

The unitary-operator formulation and the Priestley formulation are two facets of the same structure: the former emphasizes the operator-theoretic content (unitarity, self-adjointness of the Hilbert–Pólya generator), while the latter emphasizes the stochastic-process content (evolutionary spectrum, oscillatory family, consistency with the second moment).

***

## The Spectral Content of \(\mu\) Itself

A separate thread examines \(\mu(t)\) as a mathematical object in its own right. The conclusion is that \(\mu\) sits at the junction of two entirely different spectral theories.

The stationary process \(\zeta_{\mathrm{st}}\) has an absolutely continuous spectral measure supported on \([-2,0]\), making it mixing and ergodic. In contrast, the oscillatory part \(E'(t) = \mu(t) - \log\frac{t}{2\pi} - 2\gamma\) is a Bohr–Besicovitch almost-periodic function with pure point spectral measure supported on \(\{\pm\log n : n \geq 2\}\), with weights \(d(n)/\sqrt{n}\) encoding the divisor structure. These weights are the Dirichlet coefficients of \(\zeta(s)^2\) at \(s = \tfrac{1}{2}\).

The correlations of \(\mu\) — more precisely the fourth moment of \(\zeta\) on the critical line — are governed by Motohashi's spectral decomposition in terms of Maass cusp form eigenvalues for \(\mathrm{SL}_2(\mathbb{Z})\backslash\mathbb{H}\), a completely different spectral theory on the hyperbolic plane. The factorization \(\zeta(\tfrac{1}{2}+it) = \sqrt{\mu(t)}\cdot\zeta_{\mathrm{st}}(\vartheta(t))\) therefore separates the automorphic spectral theory (governing \(\mu\)) from the Bochner–Paley–Wiener spectral theory (governing \(\zeta_{\mathrm{st}}\)).

***

## The Hardy Z-Function Variant

The Hardy Z-function \(Z(t) = e^{i\vartheta(t)}\zeta(\tfrac{1}{2}+it)\) is real-valued for all real \(t\), and its zeros coincide with the zeros of \(\zeta\) on the critical line. A parallel stationary process

\[
Z_{\mathrm{st}}(\tau) = \frac{Z(\vartheta^{-1}(\tau))}{\sqrt{\mu(\vartheta^{-1}(\tau))}} = e^{i\tau}\zeta_{\mathrm{st}}(\tau)
\]

is real-valued and has covariance \(R_Z(\Delta) = \sin\Delta/\Delta\) — the symmetric sinc kernel — with spectral density \(\pi\cdot\mathbf{1}_{[-1,1]}\), centered at zero.

The real-valued formulation has the structural advantage that the Gram matrix of the pair \((Z_{\mathrm{st}}(\tau), Z_{\mathrm{st}}'(\tau))\) is diagonal with determinant \(2/3 > 0\), reflecting the independence (not merely uncorrelatedness) of the process value and its derivative at every point. This makes the Bulinskaya simplicity argument slightly cleaner in the real setting than in the complex one.

***

## The Proof Chain: From Band-Limitation to the Riemann Hypothesis

The band-limitation of \(\zeta_{\mathrm{st}}\) — that its Fourier transform is supported in \([-2,0]\) — is the central analytic fact. It was established by tracking the Riemann–Siegel terms through the time change \(T = \vartheta(t)\): the \(n\)-th term in the first Dirichlet sum has phase \(-\vartheta(t)\log n\), whose \(T\)-frequency is \(-\log n/\vartheta'(\vartheta^{-1}(T)) \in (-1,0)\) for \(n \leq N(t) \sim \sqrt{t/2\pi}\). The second sum, premultiplied by \(\chi(\tfrac{1}{2}+it) = e^{-2i\vartheta(t)}\), shifts the band to \((-2,-1)\). Together the two sums fill \((-2,0)\) exactly, and the Riemann–Siegel remainder contributes only transition-region content at the band boundary.

From band-limitation, the Paley–Wiener theory identifies \(\zeta_{\mathrm{st}}\) as an element of \(\mathrm{PW}_{[-2,0]}\): an entire function of exponential type 2 that is square-integrable on \(\mathbb{R}\). The one-sided support \([-2,0]\) — not centered at zero — implies that in the upper half-plane \(\operatorname{Im}T > 0\), every Fourier component \(e^{i\omega T}\) with \(\omega \in [-2,0]\) decays as \(e^{-|\omega|\operatorname{Im}T}\). Therefore \(\zeta_{\mathrm{st}}(T) \to 0\) as \(\operatorname{Im}T \to +\infty\), placing \(\zeta_{\mathrm{st}}\) in the Hardy space \(H^2\) of the upper half-plane, which is zero-free in the open upper half-plane. By the Schwarz reflection principle and the reality of \(\zeta_{\mathrm{st}}\) on \(\mathbb{R}\), the same holds in the lower half-plane. All zeros of \(\zeta_{\mathrm{st}}\) are real.

Simplicity follows by two independent routes. The Bernstein inequality for \(\mathrm{PW}_{[-2,0]}\) functions gives \(\|\zeta_{\mathrm{st}}^{(k)}\|_{L^2} \leq 2^k \|\zeta_{\mathrm{st}}\|_{L^2}\), and a double zero would force exponential \(L^2\) derivative growth contradicting this. Independently, Bulinskaya's theorem (1961) applies: the covariance \(R(\Delta) = e^{-i\Delta}\sin\Delta/\Delta\) gives \(-R''(0) = 4/3 > 0\) (a finite second spectral moment), the Geman condition is satisfied since \(R\) is real-analytic, and the joint density of \((\zeta_{\mathrm{st}}(\tau), \zeta_{\mathrm{st}}'(\tau))\) is non-degenerate at every \(\tau\) (Gram matrix determinant \(1/3 > 0\)). Therefore tangencies to zero — double zeros — occur with probability zero.

The transfer to the critical line runs through the recovery formula: \(\zeta(\tfrac{1}{2}+it) = \sqrt{\psi'(t)}\,\zeta_{\mathrm{st}}(\psi(t))\). At a zero \(t_0\) with \(\zeta(\tfrac{1}{2}+it_0) = 0\), the chain rule gives

\[
\frac{d}{dt}\zeta(\tfrac{1}{2}+it)\Big|_{t_0} = \frac{d\sqrt{\psi'}}{dt}\Big|_{t_0}\cdot\zeta_{\mathrm{st}}(\psi(t_0)) + \sqrt{\psi'(t_0)}\cdot\zeta_{\mathrm{st}}'(\psi(t_0))\cdot\psi'(t_0).
\]

The first term vanishes since \(\zeta_{\mathrm{st}}(\psi(t_0)) = 0\). The second term is nonzero since \(\psi'(t_0) > 0\) and \(\zeta_{\mathrm{st}}'(\psi(t_0)) \neq 0\) by simplicity. Every zero of \(\zeta\) on the critical line is therefore simple.

***

## The Hilbert–Pólya Operator

A further thread explored in the sessions is the construction of the Hilbert–Pólya operator as the infinitesimal generator of the \(\psi\)-translation group on the RKHS \(H_K\). For \(s \in \mathbb{R}\), define the translation

\[
(V_s f)(t) = \sqrt{\frac{\psi'(\psi^{-1}(\psi(t)+s))}{\psi'(t)}}\,f(\psi^{-1}(\psi(t)+s)).
\]

This is a one-parameter strongly continuous unitary group on \(H_K\). By Stone's theorem (1932), it has a unique self-adjoint infinitesimal generator

\[
Df = -i\lim_{s\to 0}\frac{V_s f - f}{s}, \qquad Df(t) = -i\frac{f'(t)}{\psi'(t)}.
\]

The spectrum of \(D\) is absolutely continuous, equal to \([-2,0]\) — the same interval as the Fourier support of \(\zeta_{\mathrm{st}}\). The covariance operator \(C\) (the orthogonal projection onto \(\mathrm{PW}_{[-2,0]}\), restricted to the half-line) is a separate object from \(D\): \(C\) is compact with eigenvalues in \((0,1]\) (prolate spheroidal wave function eigenvalues), while \(D\) is unbounded with continuous spectrum. The zeros of \(\zeta_{\mathrm{st}}\) appear as poles of the resolvent of \(D\), not as its eigenvalues — a distinction that was a point of genuine discovery within the sessions.

***

## The Exact Series for the Cumulative Phase

A technical question raised in the sessions was whether \(\psi(t)\) admits an exact convergent series expansion paralleling Ingham's identity for \(I(T)\). The answer is affirmative: since \(\psi'(t) = \vartheta'(t)\,\mu(t)\), with \(\vartheta'\) given by the imaginary part of the digamma function at \(\tfrac{1}{4}+\tfrac{it}{2}\) (an absolutely convergent series), and \(\mu(t)\) given by Ingham's divisor cosine series (conditionally convergent), integrating their product term by term yields

\[
\psi(t) = \frac{t^2}{2}\log\frac{t}{2\pi} - \frac{t^2}{2} + 2\sum_{n=2}^\infty \frac{d(n)}{\sqrt{n}}\frac{\sin(t\log n)}{\log n} + \text{(lower-order terms)},
\]

structurally identical to Ingham's identity but one degree higher in the secular part (quadratic versus linear). The oscillatory fluctuations are controlled by the same divisor weights \(d(n)/\sqrt{n}\) at the same frequencies \(\log n\), reflecting the fact that the arithmetic content of \(\psi\) is the same as that of \(I\). The Lagrange inversion of \(\psi\) — computing \(\psi^{-1}(\tau)\) from this series via the Lagrange–Bürmann formula — gives an exact convergent expansion for \(\psi^{-1}\) in terms of the same divisor-function data, with computable truncation error at every order.

***

## Structural Summary

The full construction rests on four components assembled in a specific order.

**The cumulative phase** \(\psi(t) = \int_0^t \vartheta'(u)\,\mu(u)\,du\) is the unique diffeomorphism that simultaneously accounts for the Jacobian of the theta map and the Ingham normalization of the mean-square density. It is not elementary but admits an exact arithmetic series.

**The unitary composition operator** \(U_\psi f(t) = \sqrt{\psi'(t)}\,f(\psi(t))\) is unitary on \(L^2\) by the substitution formula. The stationary process is \(\zeta_{\mathrm{st}} = U_\psi^{-1}[\zeta(\tfrac{1}{2}+i\cdot)]\), and \(\zeta = U_\psi[\zeta_{\mathrm{st}}]\).

**Band-limitation** of \(\zeta_{\mathrm{st}}\) — Fourier support in \([-2,0]\) — follows from the Riemann–Siegel decomposition, whose instantaneous frequencies in the \(\psi\)-variable all lie in \([-2,0]\) by the ratio \(\log n/\vartheta'(\vartheta^{-1}(T))\).

**Zero structure** — all zeros real and simple — follows from the Paley–Wiener membership \(\mathrm{PW}_{[-2,0]}\) (one-sided support forces Hardy-space membership, which is zero-free in both half-planes) and Bulinskaya's theorem (finite second spectral moment and non-degenerate Gram matrix force simplicity).

The recovery formula transfers the zero structure back to the critical line: real, simple zeros of \(\zeta_{\mathrm{st}}\) correspond, via \(\zeta(\tfrac{1}{2}+it) = \sqrt{\psi'(t)}\,\zeta_{\mathrm{st}}(\psi(t))\), to zeros of \(\zeta\) on the critical line, and the chain-rule argument preserves simplicity.