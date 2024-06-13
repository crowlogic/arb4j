<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  Dear Professors Roger and Pol,

  Please allow me to introduce myself. I read your book, "Stochastic Finite
  Elements: The Spectral Approach," back in 2006 and found it fantastic. I
  revisited it last year while trying to understand a system where I
  calculated empirically the quantized variance structure function (the
  variogram) of a function. This was part of testing my code for variance
  structure calculation in a project called arb4j, a Java interface for the
  arbitrary precision ball arithmetic library, now part of flintlib.org.

  I started this project a few years ago while solving option pricing
  equations and discovered that floating-point precision errors and the
  limited precision integration of discretized equations in the time domain
  were inadequate for practical purposes. Not only was it slow, but it was
  also very unstable and failed to converge in many instances.

  I was working on an implementation of a stochastic process parameter
  estimator, which involved the empirical calculation of the variance
  structure function to estimate the roughness exponent (essentially, the
  fractal dimension). I didn't have any market data, so I discretized a
  well-known continuous function and was surprised to find the Bessel
  function of the first kind of order 0 there, manifesting itself as the
  kernel of the Gaussian process that had generated it, I surmised after the
  initial disbelief wore off. The variance structure function, directly
  related simply to the covariance function of a Gaussian process that I had
  empirically calculated, was stable as the quantization length decreased to
  0, and was clearly a scalar multiple of <math|J<rsub|0>>, whose first root
  is approximately 2.4048.

  I set about trying to find the eigenfunctions of

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*f<around|(|x|)><space|0.17em><math-up|d>x
  </equation>

  and was shocked to find no such results available despite consulting every
  conceivable reference on the topic of integral transforms. After consulting
  Yosida's and Riesz-Nagy's functional analysis texts and finding almost all
  theorems were about situations where the kernel itself was
  square-integrable and the domain was finite and bounded, neither of which
  is true here, I read Aronszajn's theorem that if the kernel is positive
  definite then a unique RKHS for it exists. I naively believed that the RKHS
  meant a specific sequence of orthogonal polynomials or quasi-polynomial
  rational functions, and I did not understand at the time that the RKHS is
  the space of functions capable of being represented by projections onto the
  integral operator having this kernel as its kernel.

  So, I took the existence theorem to mean that one had to exist, of course,
  and was puzzled as to why no solution had been published or was known. I
  had an epiphany/hunch and came up with a technique that should solve any
  (positive definite, of course) stationary covariance kernel (irrational,
  non-square-integrable is no problem). It goes like this:

  1. Identify the orthogonal polynomial sequence associated with the spectral
  density of the kernel <math|K=J<rsub|0>>, which in this case is given by

  <\equation>
    S<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*e<rsup|i*x*\<omega\>><space|0.17em><math-up|d>x=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|1|<sqrt|1-\<omega\><rsup|2>>>>|<cell|\<omega\>\<in\><around|(|-1,1|)>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
  </equation>

  so that we identify the spectral density with the Chebyshev polynomials of
  the first kind, since their orthogonality measure is, in fact, equal to the
  spectral density in the case <math|K<around|(|t,s|)>=J<rsub|0>*<around|(|t-s|)>>.
  The Chebyshev polynomials' orthogonality relation is

  <\equation>
    <big|int><rsub|-1><rsup|1>T<rsub|n><around|(|\<omega\>|)>*T<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)><space|0.17em><math-up|d>\<omega\>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|0>|<cell|n\<neq\>m>>|<row|<cell|\<pi\>>|<cell|n=m=0>>|<row|<cell|<frac|\<pi\>|2>>|<cell|n=m\<neq\>0>>>>>|\<nobracket\>>
  </equation>

  I had a hunch that if we take the (finite) Fourier transform of the
  Chebyshev type-I polynomials<cite|finiteFourierTransformsOfClassicalOrthogonalPolynomials>
  (which is just the usual infinite Fourier transform with the integration
  restricted to the range <math|-1*\<ldots\>*1> since
  <math|T<rsub|n><around|(|x|)>=0\<forall\>x\<nin\><around|[|-1,1|]>>)

  <\equation>
    <wide|T|^><rsub|n><around|(|y|)>=<big|int><rsub|-1><rsup|1>T<rsub|n><around|(|x|)>*e<rsup|i*x*y><space|0.17em><math-up|d>x
  </equation>

  and orthogonalize them so that our eigenfunctions are their orthogonal
  complement (via the Gram-Schmidt process)

  <\equation>
    \<psi\><rsub|n><around|(|y|)>=<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>=<wide|T<rsup|>|^><rsub|n><around|(|y|)>-<big|sum><rsub|m=1><rsup|n-1><frac|<around|\<langle\>|<wide|T|^><rsub|n><around|(|y|)>,<wide|T|^><rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|<wide|T|^><rsup|\<perp\>><rsub|m><around|(|y|)>,<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>|\<rangle\>>>*<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>
  </equation>

  with respect to the unweighted standard Lebesgue inner product measure over
  <math|0> to <math|\<infty\>>, it would be related to the solution. I was
  pleasantly surprised to notice that indeed the partial sums of the
  orthogonalized Fourier transforms of <math|T<rsub|n>> are in fact
  proportional to the Fourier transforms of the Legendre polynomials over the
  same interval and are actually eigenfunctions of the given integral
  covariance operator that the eigenvalues are given by

  <\equation>
    \<lambda\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)><space|0.17em><math-up|d>x=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>=<sqrt|<frac|4*n+1|\<pi\>>>*<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>
  </equation>

  where <math|<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>> is the Pochhammer
  symbol aka rising factorial. There is actually a more involved formula by
  letting <math|m> vary rather than fixed at <math|0> but my primary aim is
  to represent sample paths of the <math|J<rsub|0>> process presently. The
  eigenfunctions are given by

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<psi\><rsub|n><around|(|y|)>>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|4*\<pi\>>>*<big|int><rsub|-1><rsup|1>P<rsub|2*n><around|(|x|)>*e<rsup|i*x*y><space|0.17em><math-up|d>x>>>>>
  </equation>

  where <math|j<rsub|n><around|(|x|)>> is the spherical Bessel function of
  the first kind

  <\equation>
    j<rsub|n><around|(|x|)>=<sqrt|<frac|\<pi\>|2*x>>*J<rsub|n+<frac|1|2>><around|(|x|)>=<frac|1|<sqrt|x>>*<around*|(|sin
    <around|(|z|)>*R<rsub|n,<frac|1|2>><around|(|z|)>-cos
    <around|(|z|)>*R<rsub|n,<frac|3|2>><around|(|z|)>|)>
  </equation>

  and where <math|R<rsub|n,v><around|(|z|)>> are the (misnamed) Lommel
  polynomials<cite|modifiedLommelPolynomials>

  <\equation>
    R<rsub|n,v><around|(|z|)>=<frac|\<Gamma\>*<around|(|n+v|)>|\<Gamma\><around|(|v|)>><around*|(|<frac|z|2>|)><rsup|-n><rsub|2>*F<rsub|3><around*|(|<around|[|-<frac|n|2>,-<frac|n|2>+<frac|1|2>|]>;<around|[|v,-n,-v+1-n|]>;-z<rsup|2>|)>
  </equation>

  which are actually rational functions of z, not polynomial. It is the
  modified Lommel polynomials which are actually polynomials defined by

  <\equation>
    h<rsub|n,v><around|(|z|)>=R<rsub|n,v><around*|(|<frac|1|z>|)>
  </equation>

  All this leads to the uniformly convergent eigenfunction expansion

  <\equation>
    J<rsub|0><around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|x|)>=\<cdots\>.
  </equation>

  whose finite version is\ 

  <\equation>
    K<rsub|n><around*|(|x,y|)>=<big|sum><rsub|k=0><rsup|n>\<lambda\><rsub|k>
    \<psi\><rsub|k><around*|(|x-y|)>
  </equation>

  such that

  <\equation>
    lim<rsub|n\<rightarrow\>\<infty\>>K<rsub|n><around*|(|x,y|)>=J<rsub|0><around*|(|x-y|)>
  </equation>

  <\big-figure|<image|KConvergence.eps|375pt|176.25pt||>>
    Demonstrating of convergence of <math|K<rsub|n><around*|(|h|)>> to
    <math|J<rsub|0><around*|(|h|)>> for <math|n=0,5,10>
  </big-figure>

  <\big-figure|<image|KErr.eps|375pt|176.25pt||>>
    Demonstrating of approximation error between
    \ <math|K<rsub|n><around*|(|h|)>> and <math|J<rsub|0><around*|(|h|)>> for
    <math|n=0,5,10>
  </big-figure>

  The question is, how to prove it? I am under the impression that this is a
  noteworthy result and would like to get it published. Hence, I am reaching
  out to the most esteemed experts on the subject I can think of, given that
  you wrote the book that helped me understand this method. It's an
  application of the Galerkin procedure described in the first part of
  "Stochastic Finite Elements," except instead of just choosing a piecewise
  or other polynomial basis for the expansion, you apply the
  orthogonalization procedure to the Fourier transform of the orthogonal
  polynomials corresponding to the spectral density, and thus the mass and
  stiffness matrices become the identity, and
  <math|c<rsub|n>=\<lambda\><rsub|n>> becomes an identity.

  I do not hold a degree; I'm just a guy who started programming computers
  when he was about 5 or 6 years old and ran into this interesting solution.
  There is a bigger picture that this fits into as well that I would love to
  talk to y'all about. Please do let me know if you could help me out. I
  think this method of orthogonalization combined with Fourier transform
  applies to any positive definite stationary kernel, and perhaps it can be
  extended to harmonizable processes? I have a non-stationary modification of
  <math|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|t-s|)>*f<around|(|t|)><space|0.17em><math-up|d>t>
  which is particularly interesting, but I figured it was best not to go into
  that right now until the stationary case is completely squared away.

  Sincerely,

  Stephen Crowley

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|2>
      <bibitem*|1><label|bib-finiteFourierTransformsOfClassicalOrthogonalPolynomials>Atul
      Dixit, Lin Jiu, Victor<nbsp>H Moll<localize|, and >Christophe Vignat.
      <newblock>The finite fourier transform of classical polynomials.
      <newblock><with|font-shape|italic|Journal of the Australian
      Mathematical Society>, 98:145\U160, 2015.<newblock>

      <bibitem*|2><label|bib-modifiedLommelPolynomials>R.<nbsp>Wong K.F. Lee.
      <newblock>Asymptotic expansion of the modified lommel polynomials
      <math|h<rsub|n,\<nu\>><around|(|x|)>> and their zeros.
      <newblock><with|font-shape|italic|Proceedings of the American
      Mathematical Society>, 142(11):3953\U3964, 2014.<newblock>
    </bib-list>
  </bibliography>

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|bg-color|white>
    <associate|font|stix>
    <associate|font-family|rm>
    <associate|magnification|1.2>
    <associate|math-font|math-stix>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|3>>
    <associate|auto-2|<tuple|2|4>>
    <associate|auto-3|<tuple|2|4>>
    <associate|bib-finiteFourierTransformsOfClassicalOrthogonalPolynomials|<tuple|1|4>>
    <associate|bib-modifiedLommelPolynomials|<tuple|2|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      finiteFourierTransformsOfClassicalOrthogonalPolynomials

      modifiedLommelPolynomials
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1>|>
        Demonstrating of convergence of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|K<rsub|n><around*|(|h|)>>>
        to <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|J<rsub|0><around*|(|h|)>>>
        for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|n=0,5,10>>
      </surround>|<pageref|auto-1>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|2>|>
        Demonstrating of approximation error between
        \ <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|K<rsub|n><around*|(|h|)>>>
        and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|J<rsub|0><around*|(|h|)>>>
        for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|n=0,5,10>>
      </surround>|<pageref|auto-2>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>