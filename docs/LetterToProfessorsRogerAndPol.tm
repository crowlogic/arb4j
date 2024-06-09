<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  Dear professors Roger and Pol, let me introduce myself by saying that I
  read your book Stochastic Finite Elements: The Spectral Approach back in
  2006 and thought it was fantastic and found myself revisiting it again
  during this last year when I was trying to understand a system where I
  calculated empirically the quantized variance structure function (the
  variogram) and was surprised to find the Bessel function of the first kind
  of order 0 there, clearly a scalar multiple of it. I set about trying to
  find the eigenfunctions of\ 

  <\equation>
    <big|int>J<rsub|0><around*|(|x-y|)>f<around*|(|x|)>\<mathd\>x<text|><label|integralCovariance>
  </equation>

  and was shocked to find no such results!= available despite consulting
  every conceiveible reference on the topic of integral transforms.

  \ well, I had an epiphany and came up with a technique that should solve
  any (positive definite of course) stationary covariance kernel (irrational,
  non-square-integrable is no problem). It goes like this

  1. Identify the orthogonal polynomial sequence associated to the spectral
  density of the kernek <math|K=J<rsub|0>> which in this case is given by

  <\equation>
    S<around*|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around*|(|x|)>e<rsup|i
    x \<omega\>>\<mathd\>x=<choice|<tformat|<table|<row|<cell|<frac|1|<sqrt|1-\<omega\><rsup|2>>>>|<cell|\<omega\>\<in\><around*|(|-1,1|)>>>|<row|<cell|0>|<cell|otherwise>>>>>
  </equation>

  so that we identify Equation (<reference|integralCovariance>) with the
  Chebsyhev polynomials of the first kind whose orthogonality measure is
  given by the spectral density

  <\equation>
    <big|int><rsup|1><rsub|-1>T<rsub|n><around*|(|\<omega\>|)>T<rsub|m><around*|(|\<omega\>|)>S<around*|(|\<omega\>|)>\<mathd\>w=<choice|<tformat|<table|<row|<cell|0>|<cell|n\<neq\>m>>|<row|<cell|\<pi\>>|<cell|n=m=0>>|<row|<cell|<frac|\<pi\>|2>>|<cell|n=m\<neq\>0>>>>>
  </equation>

  \ I had a hunch that if we take the (finite) Fourier transform of the
  Chebyshev type-<math|I> polynomials which is just the usual infinite
  Fourier transform with the integration restricted to the range
  <math|-1\<ldots\>1> since <math|T<rsub|n><around*|(|x|)>=0\<forall\>x\<nin\><around*|[|-1,1|]>>

  <\equation>
    <wide|T|^><rsub|n><around*|(|y|)>=<big|int><rsub|-1><rsup|1>T<rsub|n><around*|(|x|)>e<rsup|i
    x y>\<mathd\>x
  </equation>

  \ and orthogonalize them so that our eigenfunctions are their orthogonal
  complement

  <\equation>
    \<psi\><rsub|n><around*|(|y|)>=<wide|T|^><rsup|\<perp\>><rsub|n><rsup|><around*|(|y|)>
  </equation>

  \ \ \ (via the Gram-Schmidt process)\ 

  <\equation>
    \<psi\><rsub|n><around|(|y|)>=<wide|T|^><rsup|\<perp\>><rsub|n><rsup|><around*|(|y|)>=<wide|T|^><rsub|n><around*|(|y|)>-<big|sum><rsub|m=1><rsup|n-1><frac|<around|\<langle\>|<wide|T|^><rsub|m><around*|(|y|)>,\<psi\><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|<wide|T|^><rsub|m><around*|(|y|)>,<wide|T|^><rsub|m><around*|(|y|)>|\<rangle\>>>*\<psi\><rsub|m><around|(|y|)>
  </equation>

  \ with respect to the unweighted standard Lebesgue inner product
  measure<space|1em>over <math|0> to <math|\<infty\>> that it would be
  related to the solution. I was pleasently surprised to notice that indeed
  the partial sums of the orthogonalized Fourier transforms of
  <math|T<rsub|n>> are in fact proportional to the Fourier transforms of the
  Legendre polynomials over the same interval and are actually eigenfunctions
  of the given integral covariance operation in Equation
  (<reference|integralCovariance>) and that the eigenvalues are given by

  <\equation>
    \<lambda\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around*|(|x|)>\<psi\><rsub|n><around*|(|x|)>\<mathd\>x=<sqrt|<frac|4n+1|\<pi\>>><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|*n+1|)><rsup|2>>
  </equation>

  (there is actually a more involved formula by letting <math|m> vary rather
  than fixed at <math|0> but my primary aim is to represent sample paths of
  the <math|J<rsub|0>> process presently) and eigenfunctions are given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<psi\><rsub|n><around*|(|y|)>>|<cell|=<around*|(|-1|)><rsup|n><sqrt|<frac|4n+1|\<pi\>>>
    j<rsub|2n><around*|(|y|)>>>|<row|<cell|>|<cell|=<around*|(|-1|)><rsup|n><sqrt|<frac|4n+1|\<pi\>>>
    <sqrt|<frac|\<pi\>|2 y>>J<rsub|2n+<frac|1|2>><around*|(|y|)>>>|<row|<cell|>|<cell|=<around*|(|-1|)><rsup|n><sqrt|<frac|4n+1|2y>>*J<rsub|2n+<frac|1|2>><around*|(|y|)>>>|<row|<cell|>|<cell|=<sqrt|<frac|4n+1|4\<pi\>>><big|int><rsub|-1><rsup|1>P<rsub|2n><around*|(|x|)>e<rsup|i
    x y>\<mathd\>x>>>>>
  </equation>

  where <math|j<rsub|n><around*|(|x|)>> is the spherical Bessel function of
  the first kind

  <\equation>
    \<centerdot\><tabular|<tformat|<table|<row|<cell|j<rsub|n><around*|(|x|)>>|<cell|=<sqrt|<frac|\<pi\>|2
    x>>J<rsub|n+<frac|1|2>><around*|(|x|)>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|x>><around*|(|sin<around*|(|z|)>
    R<rsub|n,<frac|1|2>><around*|(|z|)>-cos<around*|(|z|)>R<rsub|n,<frac|3|2>><around*|(|z|)>|)>>>>>>
  </equation>

  and where <math|R<rsub|n,v><around*|(|z|)>> are the (misnomered) Lommel
  polynomials

  <\equation>
    R<rsub|n,v><around*|(|z|)>=<frac|\<Gamma\>*<space|-0.17em><around*|(|n+v|)>|\<Gamma\><space|-0.17em><around*|(|v|)>><around*|(|<frac|z|2>|)><rsup|-n><rsub|>
    <rsup|\<nosymbol\>><rsub|2>F<rsub|3><rsup|\<nosymbol\>><space|-0.17em><around*|(|<around*|[|-<frac|n|2>,-<frac|n|2>+<frac|1|2>|]>;<around*|[|v,-n,-v+1-n|]>;-z<rsup|2>|)>
  </equation>

  which are actually rational functions of z, not polynomial. It is the
  modified Lommel polynomials<cite|modifiedLommelPolynomials> which are
  actually polynomials defined by

  <\equation>
    h<rsub|n,v><around*|(|z|)>=R<rsub|n,v><around*|(|<frac|1|z>|)>
  </equation>

  All this leads to the uniformly convergent eigenfunction expansipon

  <\equation>
    <tabular|<tformat|<table|<row|<cell|J<rsub|0><around*|(|x|)>>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>
    \<psi\><rsub|n><around*|(|x|)>>>|<row|<cell|>|<cell|=\<cdots\>.>>>>>
  </equation>

  <big-figure|<image|KErr.eps|332pt|114pt||>|The Residual
  <math|J<rsub|0><around*|(|x|)>-K<rsub|n><around*|(|x|)>> for
  <math|n=0,10,20>>

  The question is, how to prove it? I am under the impression that this is
  noteworthy result and would like to get it published and hence I am
  reaching out to the most esteemed experts on the subject I can think of
  give that you wrote the book that I read to understand this method. It's an
  application of the Galerkin procedure described in the first part of
  Stochastic Finite Elements, except instead of just choosing a piecewise or
  other polynomial basis for the expansion, you apply the orthogonalization
  procedure to the Fourier transform of the orthogonal polynomials
  corresponding to the spectral density and thus the mass and stiffness
  matrices become the identity and <math|c<rsub|n>=\<lambda\><rsub|n>>
  becomes an identity. I do not hold a degree, I'm just a guy who started
  programming computers when he was about 5 or 6 years old and ran into this
  interesting solution. There is a bigger picture that this fits into as well
  that I would love to talk to y'all about, please do let me know if you
  could help me out, I think this method of orthogonalization combined with
  Fourier transform applies to any positive definite stationary kernel, and
  perhaps it can be extended to harmonizable processes? I have a
  non-stationary modification of int(J0(t-s)*f(t),t=0..inf) which is
  particular interesting but I figured it was best not to go into that right
  now until the stationar case is completely squared away.

  \;

  Sincerely,

  Stephen Crowley

  \;

  \;

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-modifiedLommelPolynomials>R.<nbsp>Wong K.F. Lee.
      <newblock>Asymptotic expansion of the modified lommel polynomials
      <math|h<rsub|n,\<nu\>><around|(|x|)>> and their zeros.
      <newblock><with|font-shape|italic|Proceedings of the American
      Mathematical Society>, 142(11):3953\U3964, 2014.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|auto-2|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|bib-modifiedLommelPolynomials|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_50.tm>>
    <associate|integralCovariance|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_50.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      modifiedLommelPolynomials
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||The Residual
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|J<rsub|0><around*|(|x|)>-K<rsub|n><around*|(|x|)>>>
      for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|n=0,10,20>>>|<pageref|auto-1>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>