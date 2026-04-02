# Titchmarsh's 1938 Exact Formula for ζ²(s) via the Bessel Integral

## Overview

In the 1938 paper *"The Approximate Functional Equation for ζ²(s)"* published in *The Quarterly Journal of Mathematics* (Vol. os-9, pp. 109–114), E. C. Titchmarsh introduced an exact representation for \(\zeta(s)^2\) centred on the integral[^1][^2]

\[
\mathcal{I}_n(s, x) \;=\; \int_{4\pi\sqrt{nx}}^{\infty} \frac{K_1(v) + \tfrac{\pi}{2}Y_1(v)}{v^{2s}}\,dv,
\]

where \(K_1\) and \(Y_1\) are, respectively, the modified Bessel function and the Bessel function of the second kind, both of order 1. The formula arose from Titchmarsh's desire to improve the error term in the Hardy–Littlewood approximate functional equation for \(\zeta(s)^2\), and its key virtue is that it expresses the tail of the divisor sum in a form amenable to asymptotic analysis via the known large-argument behaviour of \(K_1\) and \(Y_1\).[^3][^4]

***

## Background: The Hardy–Littlewood Approximate Functional Equation

The starting point is the well-known approximate functional equation proved by Hardy and Littlewood in 1929. For \(-\tfrac{1}{2} \le \sigma \le \tfrac{3}{2}\), \(x > A\), \(y > A\), and \(xy = (t/2\pi)^2\),[^1]

\[
\zeta(s)^2 \;=\; \sum_{n \le x} \frac{d(n)}{n^s} + \chi(s)^2 \sum_{n \le y} \frac{d(n)}{n^{1-s}} + O\!\left(x^{1/2-\sigma}\left(\frac{x+y}{|t|}\right)^{1/4}\log|t|\right), \quad (1)
\]

where \(d(n)\) is the number-of-divisors function, and[^1]

\[
\chi(s) = 2(2\pi)^{s-1}\sin\!\left(\frac{\pi s}{2}\right)\Gamma(1-s). \quad (2)
\]

The extra factor \(\bigl((x+y)/|t|\bigr)^{1/4}\) in the error term of (1) was the obstacle Titchmarsh set out to remove. He succeeded by substituting an exact representation of the "tail" of the divisor sum—the contribution from integers beyond the truncation point—in place of the raw remainder.[^4]

***

## The Voronoï Connection

The exact integral arises naturally from the Voronoï formula for the divisor summatory function. Voronoï proved that the error term in the Dirichlet divisor problem[^5]

\[
\Delta(x) \;:=\; \sum_{n \le x} d(n) \;-\; x\log x \;-\; (2\gamma - 1)x
\]

satisfies the exact series representation[^6][^5]

\[
\Delta(x) = -\frac{2\sqrt{x}}{\pi}\sum_{n=1}^{\infty} \frac{d(n)}{\sqrt{n}}\Bigl[K_1(4\pi\sqrt{nx}) + \frac{\pi}{2}Y_1(4\pi\sqrt{nx})\Bigr]. \quad (3)
\]

Here the Bessel combination \(K_1(v) + \tfrac{\pi}{2}Y_1(v)\) is precisely the kernel that Titchmarsh's integral contains. Formula (3) is boundedly convergent for \(x\) in any fixed closed interval not containing an integer.[^5]

The key combinatorial fact is that \(\zeta(s)^2 = \sum_{n=1}^{\infty} d(n)/n^s\) for \(\Re(s) > 1\), so any manipulation of partial sums of \(d(n)\) with explicit error terms directly yields information about \(\zeta(s)^2\). Titchmarsh turned the Voronoï formula into an exact integral representation of the tail of the partial sum, which is then inserted into a contour-integral representation of \(\zeta(s)^2\).

***

## The Bessel Functions and the Integral Kernel

### Definitions and Asymptotics

The modified Bessel function of the second kind of order 1 satisfies[^7]

\[
K_1(v) = \frac{v}{2^0}\int_0^{\infty} t^{-2}e^{-t - v^2/(4t)}\,dt,
\]

and for large \(v\)[^8]

\[
K_1(v) = \sqrt{\frac{\pi}{2v}}\,e^{-v}\!\left(1 + O(v^{-1})\right), \qquad Y_1(v) = -\sqrt{\frac{2}{\pi v}}\cos\!\left(v - \frac{3\pi}{4}\right)\!\left(1 + O(v^{-1})\right).
\]

Consequently, for large argument the Bessel combination satisfies

\[
K_1(v) + \frac{\pi}{2}Y_1(v) \;\sim\; \sqrt{\frac{\pi}{2v}}\,e^{-v} - \frac{\pi}{2}\sqrt{\frac{2}{\pi v}}\cos\!\left(v - \frac{3\pi}{4}\right).
\]

The exponentially decaying part, \(K_1\), dominates for real argument; on the critical line, where \(v = 4\pi\sqrt{nx}\) with \(x \approx t/2\pi\), the \(Y_1\) oscillatory component also plays a role. The integral lower limit \(4\pi\sqrt{nx}\) is the natural choice because it is the argument of the Bessel functions in the Voronoï formula (3).

### Mellin Transform of the Kernel

The integral \(\int_0^{\infty} [K_1(v) + \tfrac{\pi}{2}Y_1(v)] v^{-2s}\,dv\) can be evaluated via standard Mellin transform tables. Writing the full tail integral from a cutoff \(c = 4\pi\sqrt{nx}\),

\[
\int_c^{\infty} \frac{K_1(v) + \tfrac{\pi}{2}Y_1(v)}{v^{2s}}\,dv \quad (4)
\]

the Mellin-type evaluation of (4) yields, up to gamma-factor pre-factors, an expression involving \((4\pi\sqrt{nx})^{1-2s}\) times an incomplete gamma function or confluent hypergeometric term. For \(\Re(s) > 1\) the integral converges absolutely, and analytic continuation extends it to the critical strip.

***

## Titchmarsh's Exact Formula

### Statement

Titchmarsh's 1938 result (Theorem B in the literature) establishes that for \(0 \le \sigma \le 1\), with \(xy = (t/2\pi)^2\) and \(t \ge t_0 > 0\),[^4][^2]

\[
\zeta(s)^2 \;=\; \sum_{n \le x}\frac{d(n)}{n^s} \;+\; \chi(s)^2 \sum_{n \le y}\frac{d(n)}{n^{1-s}} \;+\; R(s,x), \quad (5)
\]

where the remainder \(R(s,x)\) is expressed in closed form as a linear combination, over \(n\), of the integrals

\[
\int_{4\pi\sqrt{nx}}^{\infty} \frac{K_1(v) + \tfrac{\pi}{2}Y_1(v)}{v^{2s}}\,dv. \quad (6)
\]

Specifically, the exact formula reads[^3][^4]

\[
R(s,x) \;=\; -\frac{2^{1-2s}\pi^{-2s}}{\Gamma(s)^2}\sum_{n=1}^{\infty} \frac{d(n)}{n^{1/2}} \cdot n^{s-1/2}\int_{4\pi\sqrt{nx}}^{\infty} \frac{K_1(v) + \tfrac{\pi}{2}Y_1(v)}{v^{2s}}\,dv, \quad (7)
\]

(with appropriate normalisation factors absorbed into the constant depending on conventions). The double sum over \(n\) in (7) converges, and crucially, Titchmarsh demonstrated that the entire remainder \(R(s,x)\) satisfies[^1]

\[
R(s,x) \;=\; O\!\left(x^{1/2-\sigma}\log|t|\right), \quad (8)
\]

for \(0 \le \sigma \le 1\), thus removing the offending factor \(\bigl((x+y)/|t|\bigr)^{1/4}\) that appeared in the Hardy–Littlewood error bound.

### Why the Factor Disappears

The \(1/4\)-power factor in (1) arose from Hardy and Littlewood's use of a crude bound on the remainder—essentially a trivial estimate of the partial sums. Titchmarsh replaced this with the Voronoï exact formula (3), which converts the remainder into the Bessel integral series (7). Since \(K_1(v)\) decays exponentially for large \(v\) and \(Y_1(v)\) oscillates with amplitude \(O(v^{-1/2})\), the integral (6) evaluated at \(v = 4\pi\sqrt{nx}\) is bounded by[^8]

\[
\int_{4\pi\sqrt{nx}}^{\infty} \frac{|K_1(v)| + \tfrac{\pi}{2}|Y_1(v)|}{v^{2\sigma}}\,dv \;\ll\; (nx)^{-\sigma + 1/4}, \quad (9)
\]

and the sum over \(n\) then yields (8) via partial summation and estimates for sums of \(d(n)\). The cancellation that produces the improved bound is a genuine cancellation in the Bessel integral, not merely a computational convenience.[^4]

***

## Derivation Outline

### Step 1: Perron–Mellin Representation

For \(\Re(s) > 1\), one writes

\[
\zeta(s)^2 = \sum_{n=1}^{\infty} \frac{d(n)}{n^s} = \frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty} \frac{\zeta(w)^2}{w} x^{w-s}\,dw, \qquad c > 1, \quad (10)
\]

and shifts the contour past the pole at \(w = s\), collecting the partial sum over \(n \le x\) plus a tail integral from the functional equation. This is the standard Perron formula approach to approximate functional equations.[^9]

### Step 2: Functional Equation Substitution

The functional equation \(\zeta(w) = \chi(w)\zeta(1-w)\) (with \(\chi\) as in (2)) converts \(\zeta(w)^2\) on the shifted contour into \(\chi(w)^2\zeta(1-w)^2\). Expanding \(\zeta(1-w)^2\) as a Dirichlet series and integrating term-by-term produces the second sum in (5) plus an explicit integral remainder.[^9]

### Step 3: Bessel Integral Emergence

The key step is to recognise the integral remainder as a Mellin convolution of the divisor function with the Bessel kernel. Specifically, Hardy (and later Koshliakov) identified[^10][^11]

\[
H_0^{(1)}(x) \;:=\; \int_0^{\infty} \cos\!\left(\frac{1}{t}\right)\cos(xt)\,dt \;=\; K_0(2\sqrt{x}) - \frac{\pi}{2}Y_0(2\sqrt{x}), \quad (11)
\]

and the order-1 analogue arises when differentiating with respect to \(x\). More directly, the Voronoï summation formula for \(d(n)\) (equation (3)) is the Mellin-transform inverse of the identity[^12][^6]

\[
\int_0^{\infty} d(n)f(n)\,dn \;\xrightarrow{\text{Voronoï}}\; \text{sum involving}\; K_0(4\pi\sqrt{nx}), Y_0(4\pi\sqrt{nx}),
\]

and differentiation in the truncation parameter produces the order-1 Bessel functions \(K_1\), \(Y_1\) at the boundary.[^6][^5]

Integrating by parts once in the tail integral of step 2, using the Voronoï formula to replace the partial sum of \(d(n)e(\cdot)\) by Bessel sums, and then recognising the resulting boundary contribution yields precisely the integral in (6) at the truncation point \(4\pi\sqrt{nx}\). This is the moment where the Bessel integral (6) crystallises as a natural object.

### Step 4: Estimation of the Bessel Remainder

Using the asymptotic (for \(v \to \infty\))[^8]

\[
K_1(v) \sim \sqrt{\frac{\pi}{2v}}\,e^{-v}, \qquad Y_1(v) \sim -\sqrt{\frac{2}{\pi v}}\sin\!\left(v - \frac{\pi}{4}\right),
\]

the integral over \([4\pi\sqrt{nx}, \infty)\) is bounded using the stationary phase for the \(Y_1\) portion and the exponential decay of \(K_1\). A direct computation gives, for \(0 < \sigma < 1\),[^5]

\[
\int_{4\pi\sqrt{nx}}^{\infty} \frac{K_1(v) + \frac{\pi}{2}Y_1(v)}{v^{2\sigma}}\,dv \;\ll\; (nx)^{1/4 - \sigma/1}. \quad (12)
\]

Summing (12) over \(n \ge 1\) with weight \(d(n)/n^{1/2}\) and \(n^{s - 1/2}\) (the prefactor from the Dirichlet expansion), a standard estimate gives \(R(s,x) = O(x^{1/2-\sigma}\log t)\), which is precisely (8).

***

## Significance and Downstream Impact

### Improvement over Hardy–Littlewood

Titchmarsh's 1938 paper is described in the literature as having "improved the error term [of the Hardy–Littlewood formula] by removing the factor \(((x+y)/|t|)^{1/4}\)."[^1] This may appear like a modest gain, but the factor \((t/|t|)^{1/4} = 1\) cancels trivially when \(x \approx y \approx t/2\pi\); the real gain occurs for unequal \(x, y\), where the formula is applied in mean-value and sub-convexity arguments.

### Application to Ingham's Mean-Value Formula

Titchmarsh's exact formula (5)–(7) was applied by Ingham (with the Titchmarsh improvement) to obtain asymptotic formulas for the fourth power moment of \(\zeta(s)\) on the critical line. The same apparatus underpins the error-term analysis in[^5]

\[
E(T) \;=\; \int_0^T |\zeta(\tfrac{1}{2} + it)|^2\,dt - T\!\left(\log\frac{T}{2\pi} + 2\gamma - 1\right),
\]

where the close analogy between the Voronoï formula for \(\Delta(x)\) and the Atkinson formula for \(E(T)\) (the two formulas are structurally isomorphic, both involving \(d(n)\) with Bessel coefficients) reflects the same Bessel integral as the one Titchmarsh isolated.[^8][^5]

### Generalisation by Hall and Subsequent Authors

In 1999, Hall extended Titchmarsh's method to the functions \(\zeta'(s)^2\), \(\zeta(s)\zeta''(s)\), and \(\zeta'(s)\zeta''(s)\), obtaining approximate functional equations whose error terms contained the extraneous \(((x+y)/|t|)^{1/4}\) factor. A 2018 paper by Cao, Tanigawa and Zhai then applied Titchmarsh's method to remove this factor from Hall's results as well, following the exact same route: replacing divisor-sum remainders by Bessel integral exact formulas and then invoking the asymptotics of \(K_1\) and \(Y_1\).[^1][^4]

Another proof of the improved error term, independent of Titchmarsh's Bessel integral approach, was given by Ivić using the Voronoï summation formula directly.[^4]

### Connection to the Hardy–Koshliakov Kernel

The kernel \(K_0(2\sqrt{x}) - \tfrac{\pi}{2}Y_0(2\sqrt{x})\) appearing in formula (11) is known as the Hardy–Koshliakov integral. It is the \(k=1\), \(z=0\) case of the general kernel[^11][^10]

\[
H_z^{(k)}(x) \;:=\; \int_0^{\infty} t^{z-k}\cos(xt)\cos\!\left(\frac{1}{t^k}\right)dt, \quad (13)
\]

studied by Koshliakov and subsequently generalised by Dixit, Maji and Vatwani in the context of Voronoï summation formulas for generalised divisor functions. The order-1 version of (11)—obtained by differentiating with respect to \(x\)—produces the \(K_1\)/\(Y_1\) kernel directly:[^12][^6]

\[
-\frac{d}{dx}\!\left[K_0(2\sqrt{x}) - \frac{\pi}{2}Y_0(2\sqrt{x})\right] = \frac{1}{\sqrt{x}}\!\left[K_1(2\sqrt{x}) + \frac{\pi}{2}Y_1(2\sqrt{x})\right]. \quad (14)
\]

The substitution \(v = 2\sqrt{x}\) then converts (14) into the integrand of (6) (up to a change of normalisation). Titchmarsh's integral is thus the boundary value, at the truncation point, of the integrated form of the Hardy–Koshliakov kernel.

***

## Analytic Structure of the Integral

### Convergence Strip

The integral \(\int_c^{\infty} [K_1(v) + \tfrac{\pi}{2}Y_1(v)] v^{-2s}\,dv\) converges absolutely for \(\Re(s) > 1/4\) (since \(K_1(v) \ll e^{-v}\) and \(Y_1(v) \ll v^{-1/2}\) as \(v \to \infty\)) and admits analytic continuation to the full complex plane via integration by parts. This is consistent with the critical strip \(0 < \sigma < 1\) in which Titchmarsh's approximate functional equation operates.[^3][^8]

### Connection to Incomplete Beta and Hypergeometric Functions

Via the substitution \(v = 4\pi\sqrt{nu}\) the integral (6) becomes

\[
\int_{4\pi\sqrt{nx}}^{\infty}\frac{K_1(v) + \tfrac{\pi}{2}Y_1(v)}{v^{2s}}\,dv = (4\pi)^{1-2s}n^{1/2 - s}\int_x^{\infty} \frac{K_1(4\pi\sqrt{nu}) + \tfrac{\pi}{2}Y_1(4\pi\sqrt{nu})}{u^s}\,\frac{du}{2\sqrt{u}},
\]

and the change of variable \(u = t^2/(16\pi^2 n)\) transforms this into a Mellin–Barnes-type integral whose value can be written in terms of a generalised hypergeometric function \({}_1F_2\) or an incomplete modified Bessel function, depending on whether the \(K_1\) or \(Y_1\) contribution is isolated. The \(K_1\) portion evaluates to an incomplete Gamma function \(\Gamma(1-s, 4\pi\sqrt{nx})\) times a power factor; the \(Y_1\) portion gives a trigonometric Mellin transform with an explicit phase.[^7][^8]

### Behaviour on the Critical Line

On \(s = 1/2 + it\) with \(x = t/2\pi\), the argument of the Bessel functions at the lower limit is \(4\pi\sqrt{n \cdot t/2\pi} = 2\sqrt{2\pi n t}\). For \(n \sim t/2\pi\) (the dominant terms), this is \(\approx 2t\), so the integrand oscillates rapidly and the integral is small. For \(n \ll t\), the lower limit is \(\ll t\), the integral is larger, but these terms contribute to the main-term sums rather than the error. This separation in scale is what makes the Bessel integral remainder bounded by \(O(t^0 \log t) = O(\log t)\) on the critical line, consistent with \(\sigma = 1/2\) in (8).

***

## Summary of the Formula

Collecting all ingredients, Titchmarsh's 1938 exact formula for \(\zeta(s)^2\) in the critical strip \(0 \le \sigma \le 1\) states:[^2][^4][^1]

\[
\zeta(s)^2 = \sum_{n \le x}\frac{d(n)}{n^s} + \chi(s)^2 \sum_{n \le y}\frac{d(n)}{n^{1-s}} - \frac{(2\pi)^{2s-1}}{\pi\Gamma(s)^2}\sum_{n=1}^{\infty}\frac{d(n)}{n^{1-s}} \int_{4\pi\sqrt{nx}}^{\infty}\frac{K_1(v) + \tfrac{\pi}{2}Y_1(v)}{v^{2s}}\,dv, \quad (15)
\]

where \(\chi(s)\) is defined in (2) and \(xy = (t/2\pi)^2\). The formula is exact: there is no \(O(\cdot)\) symbol on the right-hand side. The third term is the exact remainder \(R(s,x)\), and its estimation via the asymptotics of \(K_1\) and \(Y_1\) yields the improved bound \(R(s,x) = O(x^{1/2-\sigma}\log t)\), removing the \(((x+y)/|t|)^{1/4}\) factor from the Hardy–Littlewood formula (1).[^1]

---

## References

1. [Titchmarsh's Method for the Approximate Functional Equations for ζ](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X18000330)

2. [THE APPROXIMATE FUNCTIONAL EQUATION FOR ζ2(s)](https://discovery.researcher.life/article/the-approximate-functional-equation-for-2-s/bd96d5770027346ebf18efcebe383c7e) - Article on THE APPROXIMATE FUNCTIONAL EQUATION FOR ζ2(s), published in The Quarterly Journal of Math...

3. [http://dx.doi.org/10.4153/CJM-2018-004-9](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/7A973F187A082F9AC4C7AAC4048A76C8/S0008414X18000330a.pdf/titchmarshs_method_for_the_approximate_functional_equations_for_unicodestixx1d701prime_s2_unicodestixx1d701sunicodestixx1d701prime_prime_s_and_unicodestixx1d701prime_sunicodestixx1d701prime_prime_s.pdf)

4. [Titchmarsh's Method for the Approximate Functional ...](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/7A973F187A082F9AC4C7AAC4048A76C8/S0008414X18000330a.pdf/titchmarshs-method-for-the-approximate-functional-equations-for-dollarunicodestixx1d701prime-s2dollar-dollarunicodestixx1d701sunicodestixx1d701prime-prime-sdollar-and-dollarunicodestixx1d701prime-suni.pdf)

5. [[PDF] RECENT PROGRESS ON THE DIRICHLET DIVISOR PROBLEM ...](http://www.math.hku.hk/imrwww/IMRPreprintSeries/2010/IMR2010-10.pdf) - Let ∆(x) and E(t) denote respectively the remainder terms in the Dirichlet divisor problem and the m...

6. [[PDF] Voronoi summation formula for the generalized divisor function ...](https://arxiv.org/pdf/2303.09937.pdf) - (n) denote the sum of z-th powers of those divisors d of n whose k-th powers also divide n. This ari...

7. [[PDF] The integrals in Gradshteyn and Ryzhik. Part 22: Bessel-K functions](http://www.koutschan.de/publ/GlasserKohlKoutschanMollStraub12/final22.pdf)

8. [[PDF] arXiv:2105.06821v3 [math.NT] 13 Dec 2022](https://arxiv.org/pdf/2105.06821.pdf) - Deeper connection between E(T) and ∆(x) was discovered by Atkinson in [Atk49], where he presented a ...

9. [Riemann zeta function - Wikipedia](https://en.wikipedia.org/wiki/Riemann_zeta_function)

10. [[PDF] koshliakov kernel and identities involving the riemann zeta function](https://webpages.charlotte.edu/aroy15/image/drrz02-kos.pdf) - Some integral identities involving the Riemann zeta function and func- tions reciprocal in a kernel ...

11. [SERIES TRANSFORMATIONS AND INTEGRALS INVOLVING THE](https://people.iitgn.ac.in/~adixit/nc-cms/content/upload/series_trans.pdf)

12. [[PDF] VORONOÏ SUMMATION FORMULA FOR THE GENERALIZED ...](https://adixit.people.iitgn.ac.in/wp/wp-content/uploads/2023/03/dmv5.pdf) - Voronoı summation formula, differential equations, generalized divisor function, ... divisor functio...

