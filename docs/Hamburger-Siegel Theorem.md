<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

## Hamburger-Siegel Theorem

The **Hamburger-Siegel theorem** (more commonly known as **Hamburger's theorem** for the moment problem) characterizes when a sequence of real numbers is a moment sequence of a positive measure on the real line.[^1][^2][^3][^4]

### Statement of the Theorem

Given a sequence $(s_n)_{n \geq 0}$ of real numbers, the **Hamburger moment problem** asks whether there exists a positive Borel measure $\mu$ on $\mathbb{R}$ such that

$$
s_n = \int_{-\infty}^{\infty} x^n \, d\mu(x), \quad n = 0, 1, 2, \ldots
$$

**Hamburger's Theorem** (Existence): The sequence $(s_n)_{n \geq 0}$ is a moment sequence if and only if the **Hankel matrix**

$$
H = \begin{pmatrix}
s_0 & s_1 & s_2 & \cdots \\
s_1 & s_2 & s_3 & \cdots \\
s_2 & s_3 & s_4 & \cdots \\
\vdots & \vdots & \vdots & \ddots
\end{pmatrix}
$$

is **positive semidefinite**. That is, for every finite sequence $(c_j)_{j \geq 0}$ of complex numbers with only finitely many nonzero terms,[^3][^4][^1]

$$
\sum_{j,k \geq 0} s_{j+k} c_j \overline{c_k} \geq 0.
$$

Equivalently, all principal minors (finite Hankel determinants) must be nonnegative:

$$
\det \begin{pmatrix}
s_0 & s_1 & \cdots & s_{n-1} \\
s_1 & s_2 & \cdots & s_n \\
\vdots & \vdots & \ddots & \vdots \\
s_{n-1} & s_n & \cdots & s_{2n-2}
\end{pmatrix} \geq 0
$$

for all $n \geq 1$.[^1]

### Uniqueness (Determinacy)

Hamburger also addressed the uniqueness question. The moment problem is **determinate** (the measure $\mu$ is unique) if and only if

$$
\lim_{n \to \infty} \frac{\det(H_n)}{\det(H'_n)} = 0,
$$

where $H_n$ and $H'_n$ are certain finite sections of the Hankel matrix. A more practical sufficient condition for determinacy is **Carleman's criterion**: if[^1]

$$
\sum_{n=1}^{\infty} \frac{1}{\sqrt[2n]{s_{2n}}} = \infty,
$$

then the moment problem is determinate.[^2][^1]

### Hamburger's Converse Theorem for the Riemann Zeta Function

A different but related result, also due to Hamburger, characterizes the Riemann zeta function via its functional equation.[^5][^6][^7][^8]

**Hamburger's Converse Theorem** (1921): Let $h(s) = \sum_{n=1}^{\infty} a_n n^{-s}$ and $g(s) = \sum_{n=1}^{\infty} b_n n^{-s}$ be absolutely convergent for $\Re(s) > 1$, and suppose both $(s-1)h(s)$ and $(s-1)g(s)$ are entire functions of finite order. If the functional equation[^6][^5]

$$
\pi^{-s/2} \Gamma\left(\frac{s}{2}\right) h(s) = \pi^{-(1-s)/2} \Gamma\left(\frac{1-s}{2}\right) g(1-s)
$$

holds, then $h(s) = g(s) = a_1 \zeta(s)$.

This says the Riemann zeta function is **uniquely determined** by its functional equation (up to a constant factor), provided suitable regularity conditions hold.[^5][^6]

***

## Detailed Proof of Hamburger's Theorem

The proof uses orthogonal polynomials, functional analysis, and the theory of linear functionals on polynomial algebras.

### Step 1: Reformulation via Linear Functionals

For a sequence $s = (s_n)_{n \geq 0}$, define a linear functional $L_s$ on the polynomial algebra $\mathbb{R}[x]$ by

$$
L_s(x^n) = s_n, \quad n = 0, 1, 2, \ldots
$$

By linearity of integration, $(s_n)$ is a moment sequence for measure $\mu$ if and only if

$$
L_s(p) = \int_{-\infty}^{\infty} p(x) \, d\mu(x)
$$

for all polynomials $p \in \mathbb{R}[x]$.[^4]

### Step 2: Positive Definiteness

The measure $\mu$ is positive if and only if

$$
L_s(p^2) = \int_{-\infty}^{\infty} p(x)^2 \, d\mu(x) \geq 0
$$

for all $p \in \mathbb{R}[x]$. Writing $p(x) = \sum_{j=0}^m c_j x^j$, we have[^4]

$$
L_s(p^2) = L_s\left(\left(\sum_j c_j x^j\right)^2\right) = \sum_{j,k} c_j c_k s_{j+k}.
$$

Thus, $\mu$ is positive if and only if the associated Hankel form is positive semidefinite.[^3][^4]

### Step 3: Construction via Orthogonal Polynomials

Given a positive definite sequence $(s_n)$, construct orthonormal polynomials $(P_n)$ via Gram-Schmidt orthogonalization with respect to the inner product

$$
\langle p, q \rangle = L_s(pq).
$$

These polynomials satisfy a three-term recurrence relation

$$
x P_n(x) = b_n P_{n+1}(x) + a_n P_n(x) + b_{n-1} P_{n-1}(x),
$$

with $b_n > 0$.[^2][^1]

By **Favard's theorem**, such a recurrence relation determines a positive measure $\mu$ for which $(P_n)$ are orthonormal.[^2][^1]

### Step 4: Spectral Theorem

The multiplication operator $Mf(x) = xf(x)$ on $L^2(\mu)$ is self-adjoint. By the spectral theorem, $\mu$ is the spectral measure of this operator, uniquely determined by the moments.[^4][^1]

### Step 5: Uniqueness (Determinacy)

Hamburger proved that the measure $\mu$ is unique if and only if the polynomials are dense in $L^2(\mu)$, or equivalently,

$$
\sum_{n=0}^{\infty} \left(P_n^2(0) + Q_n^2(0)\right) < \infty,
$$

where $Q_n$ are the polynomials of the second kind. Carleman's sufficient condition follows from analyzing growth rates of moments.[^1][^2]

### Conclusion

Hamburger's theorem provides a complete solution to the existence and uniqueness questions for the moment problem on $\mathbb{R}$. The positive definiteness criterion is both necessary and sufficient for existence, and various criteria (Carleman, Krein) determine uniqueness.[^3][^2][^4][^1]
<span style="display:none">[^10][^11][^12][^13][^14][^15][^16][^17][^18][^19][^20][^21][^22][^23][^24][^25][^26][^27][^28][^29][^9]</span>

<div align="center">⁂</div>

[^1]: https://web.williams.edu/Mathematics/sjmiller/public_html/book/papers/jcmp.pdf

[^2]: https://en.wikipedia.org/wiki/Stieltjes_moment_problem

[^3]: https://en.wikipedia.org/wiki/Hamburger_moment_problem

[^4]: https://arxiv.org/pdf/2008.12698.pdf

[^5]: https://arxiv.org/pdf/1910.09837.pdf

[^6]: https://www.clas.kitasato-u.ac.jp/~miyazaki/rims2022/RIMS_Jan23.pdf

[^7]: https://sites.math.rutgers.edu/~zeilberg/EM18/TitchmarshZeta.pdf

[^8]: https://sites.math.rutgers.edu/~sdmiller/gelbart-miller-zeta.pdf

[^9]: https://projecteuclid.org/journals/tokyo-journal-of-mathematics/volume-5/issue-1/On-an-Analogoue-to-Hecke-Correspondence/10.3836/tjm/1270215036.pdf

[^10]: https://en.wikipedia.org/wiki/Siegel's_theorem_on_integral_points

[^11]: https://surya-teja.com/2010/11/24/riemann-functional-equation-and-hamburgers-theorem/

[^12]: https://www.fandm.edu/directory/wendell-ressler.html

[^13]: https://www.sciencedirect.com/science/article/pii/S0096300396003050

[^14]: https://gorogoro.cis.ibaraki.ac.jp/web/papers/kano2018-a.pdf

[^15]: https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-27/issue-3/On-determinate-Hamburger-moment-problems/pjm/1102983768.pdf

[^16]: https://arxiv.org/abs/2407.08511

[^17]: https://womengovtcollegevisakha.ac.in/departments/Number theory [p211-226].pdf

[^18]: https://harvest.usask.ca/bitstreams/7c81b396-34c2-47cc-9b9c-be6d20ddc34c/download

[^19]: https://kam.mff.cuni.cz/~kyncl/presentations/40_hamburger_theorem/burger.pdf

[^20]: https://mathworld.wolfram.com/PositiveDefiniteSequence.html

[^21]: https://math.iisc.ac.in/~khare/papers/hankel.pdf

[^22]: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/517508F83FF5A35EF04D6F0F7C1483FA/S0013091500022628a.pdf/an_extended_hamburger_moment_problem.pdf

[^23]: https://www.sciencedirect.com/science/article/pii/S0925772117300640

[^24]: https://www.mscand.dk/article/download/112091/163320/236397

[^25]: https://en.wikipedia.org/wiki/Moment_problem

[^26]: https://www.sciencedirect.com/science/article/pii/0377042787901750

[^27]: https://ems.press/journals/jems/articles/2579441

[^28]: https://www.sciencedirect.com/science/article/pii/S0024379515006035

[^29]: https://onlinelibrary.wiley.com/doi/pdf/10.1002/(SICI)1522-2616(200002)210:1<67::AID-MANA67>3.0.CO;2-N

