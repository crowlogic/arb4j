<TeXmacs|2.1.2>

<style|<tuple|letter|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunction Construction for Stationary Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  \;

  <section|Preliminaries>

  <\definition>
    The Fourier transform <math|\<cal-F\>> and its inverse
    <math|\<cal-F\><rsup|-1>> are defined as:

    <\equation>
      \<cal-F\><around|[|f|]><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)>*e<rsup|-i*\<omega\>*x>*d*x
    </equation>

    <\equation>
      \<cal-F\><rsup|-1><around|[|g|]><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*d*\<omega\>
    </equation>
  </definition>

  \;

  <\definition>
    Let <math|K*<around|(|x-y|)>> be a stationary positive-definite kernel.
    By Bochner's theorem:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|K*<around|(|x-y|)>>|<cell|=\<cal-F\><rsup|-1><around|[|S|]><around|(|x-y|)>>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|x-y|)>>*S<around|(|\<omega\>|)>*d*\<omega\>>>>>>
    </equation>

    where\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|S<around|(|\<omega\>|)>>|<cell|=\<cal-F\><around*|[|K|]><around*|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|x|)>*e<rsup|-i*\<omega\>*x>*d*x>>>>>
    </equation>

    is the corresponding spectral density.
  </definition>

  <\definition>
    <strong|[The Gram-Schmidt Recursions]>

    <\equation>
      f<rsub|k><rsup|\<perp\>><around|(|x|)>=f<rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><around|\<langle\>|f<rsub|k>,<wide|f|~><rsub|j><rsup|\<perp\>>|\<rangle\>>*<wide|f|~><rsub|j><rsup|\<perp\>><around|(|x|)>
    </equation>

    <\equation>
      <wide|f|~><rsub|k><rsup|\<perp\>><around|(|x|)>=<frac|f<rsub|k><rsup|\<perp\>><around|(|x|)>|<around|\<\|\|\>|f<rsub|k><rsup|\<perp\>>|\<\|\|\>>>
    </equation>

    <\equation>
      <around|\<\|\|\>|f<rsub|k><rsup|\<perp\>>|\<\|\|\>>=<sqrt|<around|\<langle\>|f<rsub|k><rsup|\<perp\>>,f<rsub|k><rsup|\<perp\>>|\<rangle\>>>=<sqrt|<big|int><rsub|0><rsup|\<infty\>><around|\||f<rsub|k><rsup|\<perp\>><around|(|x|)>|\|><rsup|2>*d*x>
    </equation>

    <\equation>
      <wide|f|~><rsub|k><rsup|\<perp\>><around|(|x|)>=<frac|f<rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><around|\<langle\>|f<rsub|k>,<wide|f|~><rsub|j><rsup|\<perp\>>|\<rangle\>>*<wide|f|~><rsub|j><rsup|\<perp\>><around|(|x|)>|<sqrt|<big|int><rsub|0><rsup|\<infty\>><around*|\||f<rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><around|\<langle\>|f<rsub|k>,<wide|f|~><rsub|j><rsup|\<perp\>>|\<rangle\>>*<wide|f|~><rsub|j><rsup|\<perp\>><around|(|x|)>|\|><rsup|2>*d*x>>
    </equation>
  </definition>

  <\definition>
    [<strong|Spectral Polynomials] >Let <math|>\ 

    <\equation>
      f<rsup|\<perp\>><rsub|k><around|(|x|)>=f<rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><around|\<langle\>|f<rsub|k>,\<phi\><rsub|j>|\<rangle\>>*\<phi\><rsub|j><around|(|x|)>
    </equation>

    <\equation>
      P<rsub|n><around|(|\<omega\>|)>=x<rsup|n>-<big|sum><rsub|j=0><rsup|n-1><frac|<around*|\<langle\>|P<rsub|n>,x<rsup|j>|\<rangle\>>|<around*|\<langle\>|P<rsup|2><rsub|n<rsup|>>|\<rangle\>>>
    </equation>

    be polynomials orthogonal with respect to the spectral density
    <math|S<around|(|\<omega\>|)>> and normalized so that
    <math|P<rsub|0><around|(|\<omega\>|)>=1>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|m><around|(|\<omega\>|)>*P<rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>=\<delta\><rsub|m*n>
    </equation>
  </definition>

  \;

  <\theorem>
    <strong|[Null Space Theorem>] The inverse Fourier transforms of the
    polynomials <math|P<rsub|n><around*|(|*\<omega\>|)>> orthogonal with
    respect to the spectral density <math|S<around*|(|\<omega\>|)>>\ 

    <\equation>
      f<rsub|n><around*|(|x|)>=\<cal-F\><rsup|-1><around|[|P<rsub|n><around*|(|\<omega\>|)>|]><around*|(|x|)><label|nullSpace>
    </equation>

    constitute the null-space of the kernel inner-product
    <math|<around|\<langle\>|K,\<cdot\>|\<rangle\>>=<big|int><rsub|0><rsup|\<infty\>>K<around*|(|x|)>f<around*|(|x|)>\<mathd\>x>
    which is evinced by an application of Parseval's theorem

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|K,\<cal-F\><rsup|-1><around|[|P<rsub|n>|]>|\<rangle\>>>|<cell|=<around|\<langle\>|K,f<rsub|n>|\<rangle\>>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>K<around*|(|x|)>f<rsub|n><around*|(|x|)>\<mathd\>x>>|<row|<cell|>|<cell|=<around|\<langle\>|\<cal-F\><rsup|-1><around|[|S|]>,\<cal-F\><rsup|-1><around|[|P<rsub|n>|]>|\<rangle\>>>>|<row|<cell|>|<cell|=<around|\<langle\>|S,P<rsub|n>|\<rangle\>>>>|<row|<cell|>|<cell|=0>>>>>\<forall\>n\<geqslant\>1
    </equation>
  </theorem>

  <\remark>
    The null-space of an operator is also called a kernel, but to avoid
    confusion with the kernel referring to the autocovariance kernel function
    of the Gaussian process integral covariance operator, the null-space
    terminology is preferred
  </remark>

  <\theorem>
    Let

    <\equation>
      f<rsup|\<perp\>><rsub|k><around|(|x|)>=f<rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><frac|<around|\<langle\>|f<rsub|k>,f<rsup|\<perp\>><rsub|k>|\<rangle\>>|<around|\<\|\|\>|f<rsup|\<perp\>><rsub|k>|\<\|\|\>><rsup|2>>*f<rsup|\<perp\>><rsub|k><around|(|x|)>
    </equation>

    \;

    be the orthogonal complement of the sequence of null space functions
    defined in Equation (<reference|nullSpace>) then

    <\equation>
      K<around|(|x-y|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|K,f<rsup|\<perp\>><rsub|k>|\<rangle\>>*f<rsup|\<perp\>><rsub|k><around|(|x-y|)>
    </equation>

    converges uniformly <math|\<forall\>x-y\<in\>\<bbb-R\>>

    \;
  </theorem>

  <\remark>
    This is not a Mercer expansion. Notice that it is a sum over
    <math|\<psi\><rsub|n><around*|(|x-y|)>> not the product
    <math|\<psi\><rsub|n><around*|(|x|)>\<psi\><around*|(|y|)>> which is the
    form it would have to have to be a Mercer expansion.
  </remark>

  Now, just repeat the process to construct the propagator which is the
  function that which when convolved with itself results in the kernel.\ 

  \;

  TODO: link in spectral factorization theorem here and copy cleaner stuff
  from above for that.. then expand the propagator in its uniuform basis and
  do term-by-term convolution and demonstrate tringularity means the
  eigenufnctions are EXACT FINITE functions of the uniform basis for K. so
  propagator=inverseFourierTransformOfSquareRootOfFOurierTransformOfKernel so
  that propagator.convolve(propagator)=kernel.

  <section|Uniform Basis of the Spectral Factor>

  Let <math|<around|{|Q<rsub|n><around|(|\<omega\>|)>|}><rsub|n=0><rsup|\<infty\>>>
  be orthogonal polynomials with respect to
  <math|<sqrt|S<around|(|\<omega\>|)>>>:

  <\equation>
    <around*|\<langle\>|Q<rsub|m>,Q<rsub|n>|\<rangle\>><rsub|<sqrt|S>><rsub|>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>Q<rsub|m><around|(|\<omega\>|)>*Q<rsub|n><around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>=\<delta\><rsub|m*n>
  </equation>

  Define:

  <\equation>
    \<xi\><rsub|n><around|(|x|)>=\<cal-F\><rsup|-1><around|[|Q<rsub|n><around|(|\<omega\>|)>|]><around|(|x|)>
  </equation>

  Apply Gram-Schmidt to <math|<around|{|\<xi\><rsub|n>|}>> to obtain
  orthonormal sequence <math|<around|{|\<phi\><rsub|n>|}>> via:

  <\equation>
    \<phi\><rsub|k><around|(|x|)>=\<xi\><rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><frac|<around|\<langle\>|\<xi\><rsub|k>,\<phi\><rsub|j>|\<rangle\>>|<around|\<\|\|\>|\<phi\><rsub|j>|\<\|\|\>><rsup|2>>*\<phi\><rsub|j><around|(|x|)>
  </equation>

  Then:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|g<around|(|x|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*x>*<sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|n>|\<rangle\>>*\<phi\><rsub|n><around|(|x|)>>>>>>
  </equation>

  where <math|g> is the spectral factor with
  <math|\<cal-F\><around|[|g|]>=<sqrt|S>> satisfying

  <\equation>
    <tabular|<tformat|<table|<row|<cell|g<around*|(|x|)>\<ast\>g<around*|(|y|)>>|<cell|=K<around*|(|x-y|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around*|(|x+z|)><wide|g<around*|(|y-z|)>|\<bar\>>\<mathd\>z>>>>>
  </equation>

  <section|Eigenfunction Construction>

  By Fubini's theorem and uniform convergence:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|K*<around|(|x-y|)>>|<cell|=<around|(|g\<ast\>g|)>*<around|(|x-y|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|m=0><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|m>|\<rangle\>><around|\<langle\>|g,\<phi\><rsub|n>|\<rangle\>>*<around|(|\<phi\><rsub|m>\<ast\>\<phi\><rsub|n>|)>*<around|(|x-y|)>>>>>>
  </equation>

  The eigenfunctions <math|<around|{|f<rsub|n>|}>> can be expressed in the
  uniform basis <math|<around|{|\<psi\><rsub|n>|}>> with finitely many terms:

  <\equation>
    f<rsub|n><around|(|x|)>=<big|sum><rsub|k=0><rsup|n>c<rsub|n*k>*\<psi\><rsub|k><around|(|x|)>
  </equation>

  where coefficients <math|c<rsub|n*k>> are determined by the recurrence
  relations of the underlying orthogonal polynomials.

  Substituting into Mercer's theorem:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<text|<math|K*<around|(|x-y|)>>>>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x|)>*f<rsub|n><around|(|y|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*<big|sum><rsub|k=0><rsup|n><big|sum><rsub|j=0><rsup|n>c<rsub|n*k>*c<rsub|n*j>*\<psi\><rsub|k><around|(|x|)>*\<psi\><rsub|j><around|(|y|)>>>>>>
  </equation>

  This double sum structure with coefficients is precisely the inner product
  representation guaranteed by Moore-Aronszajn's theorem for reproducing
  kernel Hilbert spaces.

  The triangular structure emerges naturally from the polynomial degree
  preservation under convolution in the spectral domain.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.4>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|4>>
    <associate|auto-3|<tuple|3|5>>
    <associate|auto-4|<tuple|4|6>>
    <associate|auto-5|<tuple|5|3>>
    <associate|auto-6|<tuple|6|4>>
    <associate|nullSpace|<tuple|12|?>>
    <associate|nullSpacePoly|<tuple|12|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Uniform
      Basis of the Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Uniform
      Basis of the Spectral Factor> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Eigenfunction
      Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>