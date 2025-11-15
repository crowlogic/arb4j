<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# show in detail the definition of F( lambda - 0 ) what it means as its defined rigorously as thats shorthand for a specific limit from a certain direction... lay all that , from both sides and how the plus and minus notation is used

$F(\lambda-0)$ means the **left-hand limit** of the spectral distribution function $F$ at the point $\lambda$, i.e. the limit of $F(x)$ as $x$ approaches $\lambda$ from values $x<\lambda$.[^1][^2]

### One-sided limit notation

For a real function $f:\mathbb{R}\to\mathbb{R}$ and a point $a\in\mathbb{R}$, the **left-hand limit** is denoted

$$
\lim_{x\to a^-} f(x) = f(a-0),
$$

and is defined as the unique number $L$ such that for every $\varepsilon>0$ there exists $\delta>0$ with
$0<a-x<\delta \Rightarrow |f(x)-L|<\varepsilon$.[^2][^1]
Similarly, the **right-hand limit**

$$
\lim_{x\to a^+} f(x) = f(a+0)
$$

is defined by the condition that for every $\varepsilon>0$ there exists $\delta>0$ with
$0<x-a<\delta \Rightarrow |f(x)-L|<\varepsilon$.[^2][^3]

### Equivalent directional notations

The notation $x\to a^-$ is equivalent to writing $x\uparrow a$ or $x\nearrow a$, all meaning that $x$ increases to $a$ with $x<a$ at all times.[^2]
The notation $x\to a^+$ is equivalent to $x\downarrow a$ or $x\searrow a$, meaning that $x$ decreases to $a$ with $x>a$ at all times.[^4][^2]

### Left and right limits of a monotone $F$

Let $F:\mathbb{R}\to\mathbb{R}$ be a nondecreasing function (as in a distribution or spectral distribution function). Then the **left limit** at $\lambda$ is

$$
F(\lambda-0) := \lim_{x\uparrow\lambda} F(x) = \sup_{x<\lambda} F(x),
$$

and the **right limit** is

$$
F(\lambda+0) := \lim_{x\downarrow\lambda} F(x) = \inf_{x>\lambda} F(x).\,[]
$$

For such monotone $F$, both limits always exist (finite or infinite), even if $F$ has a jump discontinuity at $\lambda$.[^5][^2]

### Distribution / spectral functions viewpoint

For a distribution-type function $F$ (probability distribution function or spectral distribution function), one typically assumes **right-continuity**:

$$
F(\lambda) = F(\lambda+0) \quad \text{for all } \lambda,
$$

and existence of left limits $F(\lambda-0)$ (càdlàg property).[^6][^5]
In this setting, the **jump** at $\lambda$ is defined by

$$
\Delta F(\lambda) := F(\lambda) - F(\lambda-0),
$$

which measures the mass concentrated exactly at the single point $\{\lambda\}$ in the associated measure.[^5][^6]

### How $F(\lambda-0)$ encodes intervals

Given a nondecreasing right-continuous $F$, one can associate a measure $\mu$ via

$$
\mu((a,b]) = F(b) - F(a) \quad \text{for } a<b,
$$

and extend this consistently to the Borel $\sigma$-algebra.[^6][^5]
In particular,

$$
\mu((-\infty,\lambda)) = \lim_{x\uparrow\lambda} F(x) = F(\lambda-0),\quad
\mu((-\infty,\lambda]) = F(\lambda),
$$

so the difference $\mu((-\infty,\lambda]) - \mu((-\infty,\lambda)) = F(\lambda)-F(\lambda-0)$ is exactly the mass at $\{\lambda\}$.[^5][^6]

### Plus/minus at a spectral point

In spectral analysis of stationary processes, $F$ is the spectral distribution function and the random orthogonal-increment measure $Z$ has covariance measure $dF$.[^7][^6][^5]
There, $F(\lambda-0)$ denotes the cumulative spectral mass strictly **below** $\lambda$, while $F(\lambda)$ denotes the cumulative spectral mass up to and including $\lambda$, and the jump $\Delta F(\lambda)=F(\lambda)-F(\lambda-0)$ corresponds to a discrete spectral line at frequency $\lambda$.[^7][^6][^5]

### Summary of the shorthand

- $F(\lambda-0)$: limit of $F(x)$ as $x\to\lambda$ with $x<\lambda$ (approach from the left), equal to $\sup_{x<\lambda} F(x)$ for monotone $F$.[^2][^5]
- $F(\lambda+0)$: limit of $F(x)$ as $x\to\lambda$ with $x>\lambda$ (approach from the right), equal to $\inf_{x>\lambda} F(x)$ for monotone $F$.[^2][^5]
- $\Delta F(\lambda)=F(\lambda)-F(\lambda-0)$: size of the jump of $F$ at $\lambda$, representing the point mass of the associated measure (in the spectral case, the discrete spectral mass at that frequency).[^6][^7][^5]
<span style="display:none">[^10][^11][^12][^13][^14][^15][^16][^17][^18][^19][^20][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://tutorial.math.lamar.edu/classes/calci/onesidedlimits.aspx

[^2]: https://en.wikipedia.org/wiki/One-sided_limit

[^3]: https://math.libretexts.org/Bookshelves/Calculus/Calculus_3e_(Apex)/01:_Limits/1.04:_One_Sided_Limits

[^4]: https://sites.millersville.edu/bikenaga/calculus1/left-and-right-limits/left-and-right-limits.html

[^5]: https://www.stat.berkeley.edu/~bartlett/courses/fall2007/lectures/17.pdf

[^6]: https://math.umd.edu/~bnk/chTHREE.STAT705.pdf

[^7]: https://dspace.mit.edu/bitstream/handle/1721.1/46357/14-384Fall-2002/NR/rdonlyres/Economics/14-384Time-Series-AnalysisFall2002/DB84E6DE-D11C-4548-B282-9F674CC0B94E/0/384lecture3.pdf

[^8]: https://en.wikipedia.org/wiki/Spectral_power_distribution

[^9]: https://math.unm.edu/~ghuerta/tseries/week13_2.pdf

[^10]: https://www.physics-in-a-nutshell.com/article/25/spectral-distribution-of-radiometric-quantities

[^11]: https://www.sciencedirect.com/topics/mathematics/spectral-density-function

[^12]: https://www.math.umd.edu/~bnk/STAT730/TS_2___Spectral_Density_and_Distribution_Function.pdf

[^13]: https://www.le.ac.uk/users/dsgp1/COURSES/MESOMET/ECMETXT/11mesmet.pdf

[^14]: http://www-stat.wharton.upenn.edu/~stine/stat910/lectures/17_spectral_rep.pdf

[^15]: https://www.math.utah.edu/~golden/docs/publications/Golden_et_al_NPG_Climate_Oct_2022.pdf

[^16]: https://projecteuclid.org/journals/annals-of-statistics/volume-30/issue-1/Spectral-analysis-for-harmonizable-processes/10.1214/aos/1015362193.pdf

[^17]: http://www.astro.yale.edu/vdbosch/astro320_summary21.pdf

[^18]: https://www.pbr-book.org/4ed/Radiometry,_Spectra,_and_Color/Representing_Spectral_Distributions

[^19]: https://www3.nd.edu/~apilking/Math10550/Lectures/Lecture 4 Limit Laws.pdf

[^20]: https://jordanleagle.com/2020/04/12/spectral-energy-distributions/

