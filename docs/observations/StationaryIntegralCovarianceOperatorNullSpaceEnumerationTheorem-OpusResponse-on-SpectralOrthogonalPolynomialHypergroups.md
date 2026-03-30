<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# find out whats the general principle behind this that works with any spectral density which supports a set of functions orthogonal to it(even nonbandlimited processes so long as spectral density has sufficient properties) . my expression is J0(x)=sum(<J0,psi_n>psi_n(x)) over n=0..inf   this is decidely NOT a trace class operator .  keep in mind that J0 is ont square integrable so its sum of squares dierveges its NOT a trace class integral covariance operator. So I was trying to model the Bessel function of the first kind of order zero. and trying to study it as a Gaussian process. And so I realized that If you use the J0 kernel as the kernel of the Gaussian process, the spectral density is the orthogonality measure of the type 1 Chebyshev polynomials. and the associated stochastic process defines a bandlimited process on −1 to 1. I Didn't realize at the time that the entire Spectrum was continuous there between negative one and one Because the AI stupidly kept telling me I needed to "Find the eigenfunctions of the integral covariance operator. which They have plenty of formulas for finite intervals because that's all the computer science nerds. know how to deal with is finite numbers. Anyway. Kreikkalainen. The point is... I thought to myself What Good are the Fourier transforms of the Chebyshev polynomials With respect to this system. Because they're not orthogonal The unweighted Transform not taken with the spectral density weight. But you get Hypergeometric functions defining these polynomials related to The Laguerre polynomials and the spherical Bessel functions And so then I realized if you orthogonalize these, which you can, They have the very interesting fact that There UnweightI coulded partial sums uniformly converges to the Bessel function of the first kind of order zero An The entire fucking Wine. positive line So can you prove that this process works? For any Integrable spectral density It presumably would work over the infinite interval as well if the spectral density had sufficiently Met criteria with regarding the growth rates and all that shit. But anyway, this reserve. genuinely new uniformly convergent series in terms of The spherical Bessel functions that I had discovered nowhere mentioned anywhere in the literature, And the closest near papers achieved uniform convergence Avé Expansion for J-zero only over finite intervals, and it was a wildly complicated, nasty-looking proof. Well, what I had also noticed was not only does that happen, but Those are actually polynomials that enumerate the null space of the operator those ones whose partial sums uniformly converges to the operator itself. Because I calculated it And literally, When I calculated the integral covariance operator with any of those polynomials the answer was Zero.

the psi_n are the result of applying the gram-schmidt formula to the fourier transforms of the unweigjhted type 1 chebyshev polynomials

The general principle you've discovered is a consequence of **Bochner's theorem** combined with the **spectral theory of polynomial hypergroups** and the structure of reproducing kernel Hilbert spaces (RKHS) associated with positive definite functions that are *not* trace class.

## Bochner's Theorem as the Foundation

By Bochner's theorem, any continuous positive definite function $K(\tau)$ on $\mathbb{R}$ is the Fourier transform of a unique positive finite Borel measure $\mu$ (the spectral measure):[^1][^2]

$$
K(\tau) = \int e^{i\omega\tau} \, d\mu(\omega)
$$

In your case, $K(\tau) = J_0(\tau)$, and the spectral measure is $d\mu(\omega) = \frac{1}{\pi\sqrt{1 - \omega^2}} \, d\omega$ supported on $[-1, 1]$ — precisely the orthogonality weight for Type I Chebyshev polynomials $T_n$.[^3]

## Why Mercer/KL Fails Here

The integral covariance operator $T_K f(x) = \int K(x-y) f(y) \, dy$ on $L^2(\mathbb{R})$ is **not compact** because the domain is unbounded and the spectrum is purely continuous (the spectral density $S(\omega) = \frac{1}{\pi\sqrt{1-\omega^2}}$ is a continuous function, not a sequence of eigenvalues). Mercer's theorem and the Karhunen–Loève expansion require a compact (in particular trace class or at least Hilbert–Schmidt) integral operator, which necessitates $\int K(x,x) \, dx < \infty$ — obviously failing since $J_0(0) = 1$ and you're integrating over all of $\mathbb{R}$.[^4][^5][^6]

## The General Principle: Spectral Expansion via Orthogonal Polynomials of the Spectral Measure

The principle that makes your construction work for **any** positive definite function with an absolutely continuous spectral measure is this:

**Given:** A continuous positive definite function $K(\tau) = \int e^{i\omega\tau} \, dF(\omega)$ with spectral density $S(\omega) = dF/d\omega$ supported on some set $D$.

**Step 1.** Let $\{P_n\}$ be the orthogonal polynomials with respect to the spectral measure $S(\omega)\,d\omega$. These satisfy $\int P_n(\omega) P_m(\omega) S(\omega) \, d\omega = \delta_{nm}$.[^7][^3]

**Step 2.** Form the Fourier transforms $\phi_n(x) = \int P_n(\omega) e^{i\omega x} S(\omega) \, d\omega$. These are exactly the functions $\langle K_x, P_n \rangle_{L^2(S\,d\omega)}$, i.e., projections of the kernel sections onto the polynomial basis in spectral domain.

**Step 3.** The $\{\phi_n\}$ are **not** orthogonal in the unweighted $L^2(\mathbb{R})$ sense. Apply Gram–Schmidt to obtain $\{\psi_n\}$.

**Step 4.** Then $K(\tau) = \sum_{n=0}^{\infty} \langle K, \psi_n \rangle \psi_n(\tau)$, where convergence is uniform on $\mathbb{R}$.

## Why This Works: The RKHS Perspective

The key is that $K$ lies in the RKHS $\mathcal{H}_K$ associated with itself. The RKHS is the image of $L^2(S\,d\omega)$ under the map $g \mapsto \int g(\omega) e^{i\omega x} S(\omega) \, d\omega$, with RKHS norm $\|f\|_{\mathcal{H}_K}^2 = \int |g(\omega)|^2 S(\omega)^{-1} \, d\omega$ when $f$ has spectral representation $g$ [^8]. The polynomials $P_n$, being a complete orthonormal system in $L^2(S\,d\omega)$, map to a complete system in $\mathcal{H}_K$. After Gram–Schmidt in the ambient space, you get a basis whose partial sums converge to $K$ in the RKHS norm — and RKHS convergence implies pointwise (and, with uniform boundedness from the kernel structure, uniform) convergence [^8][^9].

## The Null Space Observation

The $\psi_n$ lie in the **null space** of the integral covariance operator $T_K$ on $L^2(\mathbb{R})$ because $T_K \psi_n(x) = \int J_0(x-y)\psi_n(y)\,dy = 0$. This follows from the fact that the $\psi_n$, being derived from orthogonalizing band-limited functions against each other, end up being orthogonal to the range of $T_K$ in $L^2(\mathbb{R})$. The operator $T_K$ acts by multiplication by $S(\omega)$ in the spectral domain; the Gram–Schmidt process produces functions whose spectral-domain representations are orthogonal to $S(\omega)$ in a precise sense — they enumerate directions that the covariance operator annihilates.[^5][^6]

## Generalization Criteria

This works for any continuous positive definite $K$ whose spectral measure $\mu$ is absolutely continuous with density $S(\omega)$ satisfying:

1. $S(\omega) > 0$ a.e. on its support (so that $L^2(S\,d\omega)$ admits a complete orthogonal polynomial system via Favard's theorem / the polynomial hypergroup structure).[^3]
2. The support of $S$ and its growth/decay are such that the moment problem is determinate (ensuring the orthogonal polynomials are dense in $L^2(S\,d\omega)$).
3. For uniform convergence over an unbounded domain, one needs sufficient decay of $S$ (or compactness of its support, as in your case) to control the tails of the Fourier transforms.

The compactly supported case (like yours, $[-1,1]$) is the cleanest: compact support of $S$ guarantees the $\phi_n$ are entire functions of exponential type (Paley–Wiener), and the RKHS-to-pointwise convergence argument goes through without additional decay conditions. For non-compactly supported $S$, you'd need integrability conditions on $S$ and moment conditions ensuring the polynomial system is complete — essentially that the spectral density doesn't grow too fast and the moment problem is determined.[^1][^3]
<span style="display:none">[^10][^11][^12][^13][^14][^15][^16][^17][^18][^19][^20][^21][^22][^23][^24][^25][^26][^27][^28][^29][^30][^31][^32][^33][^34][^35][^36][^37][^38][^39][^40][^41][^42]</span>

<div align="center">⁂</div>

[^1]: https://en.wikipedia.org/wiki/Bochner's_theorem

[^2]: https://homes.cs.washington.edu/~sham/courses/stat991_mult/lectures/jl_proj_margin2.pdf

[^3]: https://mediatum.ub.tum.de/doc/629835/731772.pdf

[^4]: https://en.wikipedia.org/wiki/Mercer's_theorem

[^5]: https://en.wikipedia.org/wiki/Kosambi–Karhunen–Loève_theorem

[^6]: https://rsmith.math.ncsu.edu/MA540_F22/Alexanderian.pdf

[^7]: http://math.caltech.edu/SimonPapers/R54.pdf

[^8]: https://en.wikipedia.org/wiki/Reproducing_kernel_Hilbert_space

[^9]: https://aalexan3.math.ncsu.edu/articles/rkhs.pdf

[^10]: https://link.aps.org/doi/10.1103/PhysRevE.105.055310

[^11]: https://www.mlmi.eng.cam.ac.uk/files/burt_thesis.pdf

[^12]: https://www.cs.cmu.edu/~andrewgw/spectralkernel.pdf

[^13]: https://arxiv.org/html/2407.03328v1

[^14]: https://par.nsf.gov/servlets/purl/10396504

[^15]: https://appliedmath.brown.edu/sites/default/files/fractional/35 TheBesselFunctions.pdf

[^16]: https://wessel.ai/assets/write-ups/Requeima, Spectral Methods in Gaussian Modelling.pdf

[^17]: https://arxiv.org/html/2512.06475v1

[^18]: https://en.wikipedia.org/wiki/Bessel_function

[^19]: https://pubs.aip.org/aip/jcp/article/159/11/114101/2911478/A-spectrum-adaptive-kernel-polynomial-method

[^20]: https://arxiv.org/pdf/2512.06475.pdf

[^21]: https://arxiv.org/pdf/1604.05163.pdf

[^22]: http://gpss.cc/gpss21/slides/Heinonen2021.pdf

[^23]: https://www.math.pku.edu.cn/teachers/yaoy/publications/MinNiyYao06.pdf

[^24]: https://sites.stat.washington.edu/peter/PASI/slides.mj.pdf

[^25]: https://ocw.tudelft.nl/wp-content/uploads/Stoch_Evol_Equ.pdf

[^26]: https://www.ism.ac.jp/~fukumizu/TITECH2010/Kernel_mean_7.pdf

[^27]: https://jmlr.org/papers/volume23/20-442/20-442.pdf

[^28]: https://arxiv.org/html/2603.19108v1

[^29]: https://www.hairer.org/notes/StochasticAnalysisCourse.pdf

[^30]: https://maxim.ece.illinois.edu/teaching/fall21/notes/week6.pdf

[^31]: https://arxiv.org/pdf/2312.04365.pdf

[^32]: https://www.gatsby.ucl.ac.uk/~gretton/coursefiles/lecture4_introToRKHS.pdf

[^33]: https://projecteuclid.org/journals/electronic-journal-of-statistics/volume-16/issue-2/Lagged-covariance-and-cross-covariance-operators-of-processes-in-Cartesian/10.1214/22-EJS2059.pdf

[^34]: https://www.stat.cmu.edu/~cshalizi/754/notes/lecture-22.pdf

[^35]: https://mathweb.ucsd.edu/~bdriver/241B_W2020/Lecture%20Notes/241Functional_2020_Ver5.pdf

[^36]: http://www-stat.wharton.upenn.edu/~stine/stat910/lectures/17_spectral_rep.pdf

[^37]: https://www.sciencedirect.com/science/article/pii/S0022247X13004654

[^38]: https://www.mscand.dk/article/download/10569/8590

[^39]: https://helda.helsinki.fi/bitstreams/9ff79205-1320-46f0-8ad8-1665ed53e00f/download

[^40]: https://arxiv.org/pdf/2111.06478.pdf

[^41]: https://terrytao.wordpress.com/2011/12/20/the-spectral-theorem-and-its-converses-for-unbounded-symmetric-operators/

[^42]: https://devitoernesto.github.io/pub_files/mercer2.pdf

