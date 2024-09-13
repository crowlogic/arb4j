<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Eigenfunctions of Non-Stationary Operators via
  Wigner-Ville Isomorphism>|<doc-date|<date|>>>

  <\theorem>
    Let <math|C<around|(|t,s|)>> be the covariance function of a
    non-stationary Gaussian process on <math|\<bbb-R\>>. The covariance
    operator <math|T> is defined by:

    <\equation*>
      <around|(|T*f|)><around|(|t|)>=<big|int>C<around|(|t,s|)>*f<around|(|s|)>*<space|0.17em>d*s
    </equation*>

    The Wigner-Ville distribution <math|W<around|(|t,\<omega\>|)>> of the
    process is related to <math|C<around|(|t,s|)>> by:

    <\equation*>
      W<around|(|t,\<omega\>|)>=<big|int>C<around|(|t+\<tau\>/2,t-\<tau\>/2|)>*e<rsup|-i*\<omega\>*\<tau\>>*<space|0.17em>d*\<tau\>
    </equation*>

    Conversely:

    <\equation*>
      C<around|(|t,s|)>=<big|int>W<around|(|<around|(|t+s|)>/2,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*<space|0.17em>d*\<omega\>
    </equation*>

    We consider polynomials <math|<around|{|p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>|}>>
    orthogonal with respect to the spectral density
    <math|S<around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>>:

    <\equation*>
      <big|int><big|int>p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*p<rsub|m><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*S<around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*<space|0.17em>d*\<omega\><rsub|1>*d*\<omega\><rsub|2>=\<delta\><rsub|n*m>
    </equation*>

    where <math|S<around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>=<frac|1|2*\<pi\>>*<big|int>W<around|(|t,<around|(|\<omega\><rsub|1>+\<omega\><rsub|2>|)>/2|)>*e<rsup|-i*t*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>>*<space|0.17em>d*t>

    The inverse Fourier transforms of these polynomials are:

    <\equation*>
      r<rsub|n><around|(|t,s|)>=<frac|1|2*\<pi\>>*<big|int><big|int>p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*e<rsup|i*\<omega\><rsub|1>*t-i*\<omega\><rsub|2>*s>*<space|0.17em>d*\<omega\><rsub|1>*d*\<omega\><rsub|2>
    </equation*>
  </theorem>

  <section|Null Space Property>

  We prove that <math|r<rsub|n><around|(|t,s|)>> form the null space of the
  kernel inner product:

  <\equation*>
    <big|int><big|int>C<around|(|t,s|)>*r<rsub|n><around|(|t,s|)>*<space|0.17em>d*t*<space|0.17em>d*s=0
  </equation*>

  <\proof>
    <\align*>
      <tformat|<table|<row|<cell|>|<cell|<big|int><big|int>C<around|(|t,s|)>*r<rsub|n><around|(|t,s|)>*<space|0.17em>d*t*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><big|int><around*|[|<big|int>W<around|(|<around|(|t+s|)>/2,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t-s|)>>*<space|0.17em>d*\<omega\>|]>>>|<row|<cell|>|<cell|<space|1em>\<times\><around*|[|<frac|1|2*\<pi\>>*<big|int><big|int>p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*e<rsup|i*\<omega\><rsub|1>*t-i*\<omega\><rsub|2>*s>*<space|0.17em>d*\<omega\><rsub|1>*d*\<omega\><rsub|2>|]>*<space|0.17em>d*t*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><big|int><big|int>W<around|(|<around|(|t+s|)>/2,\<omega\>|)>>>|<row|<cell|>|<cell|<space|1em>\<times\><around*|[|<big|int><big|int>p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*e<rsup|i*<around|(|\<omega\><rsub|1>-\<omega\>|)>*t-i*<around|(|\<omega\><rsub|2>-\<omega\>|)>*s>*<space|0.17em>d*\<omega\><rsub|1>*d*\<omega\><rsub|2>|]>*<space|0.17em>d*\<omega\>*<space|0.17em>d*t*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<frac|1|2*\<pi\>>*<big|int><big|int><big|int>W<around|(|u,\<omega\>|)>>>|<row|<cell|>|<cell|<space|1em>\<times\><around*|[|<big|int><big|int>p<rsub|n><around|(|\<omega\><rsub|1>,\<omega\><rsub|2>|)>*e<rsup|i*<around|(|\<omega\><rsub|1>-\<omega\>|)>*<around|(|u+v/2|)>-i*<around|(|\<omega\><rsub|2>-\<omega\>|)>*<around|(|u-v/2|)>>*<space|0.17em>d*\<omega\><rsub|1>*d*\<omega\><rsub|2>|]>*<space|0.17em>d*\<omega\>*<space|0.17em>d*u*<space|0.17em>d*v>>|<row|<cell|>|<cell|<space|1em><text|(substituting
      <math|u=<around|(|t+s|)>/2>, <math|v=t-s>)>>>|<row|<cell|>|<cell|=<big|int><big|int>W<around|(|u,\<omega\>|)>*p<rsub|n><around|(|\<omega\>,\<omega\>|)>*<space|0.17em>d*u*<space|0.17em>d*\<omega\>>>|<row|<cell|>|<cell|=<big|int><big|int>S<around|(|\<omega\>,\<omega\>|)>*p<rsub|n><around|(|\<omega\>,\<omega\>|)>*<space|0.17em>d*\<omega\>=0<space|1em><text|(by
      orthogonality)>>>>>
    </align*>
  </proof>

  <section|Eigenfunctions from Orthogonalized Null Space>

  By orthogonalizing the null space <math|<around|{|r<rsub|n><around|(|t,s|)>|}>>,
  we obtain the eigenfunctions <math|<around|{|\<psi\><rsub|n><around|(|t,s|)>|}>>
  of the covariance operator <math|T>. The orthogonalization process gives:

  <\equation*>
    \<psi\><rsub|n><around|(|t,s|)>=<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*r<rsub|k><around|(|t,s|)>
  </equation*>

  where the coefficients <math|a<rsub|n*k>> are given by:

  <\equation*>
    a<rsub|n*k>=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
    >k=n>>|<row|<cell|-<big|sum><rsub|j=k><rsup|n-1>a<rsub|n*j>*<around|\<langle\>|r<rsub|n>,\<psi\><rsub|j>|\<rangle\>>>|<cell|<text|if
    >k\<less\>n>>|<row|<cell|0>|<cell|<text|if >k\<gtr\>n>>>>>
  </equation*>

  We prove that these are indeed eigenfunctions:

  <\proof>
    Let <math|\<psi\><rsub|n><around|(|t,s|)>=<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|t,s|)>>.
    Then:

    <\align*>
      <tformat|<table|<row|<cell|<big|int>C<around|(|t,u|)>*\<psi\><rsub|n><around|(|u,s|)>*<space|0.17em>d*u>|<cell|=<big|int>C<around|(|t,u|)>*<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|u,s|)>*<space|0.17em>d*u>>|<row|<cell|>|<cell|=<big|sum><rsub|k>a<rsub|n*k>*<big|int>C<around|(|t,u|)>*r<rsub|k><around|(|u,s|)>*<space|0.17em>d*u>>|<row|<cell|>|<cell|=<big|sum><rsub|k>a<rsub|n*k>*<around*|[|r<rsub|k><around|(|t,s|)>*<big|int><big|int>C<around|(|u,v|)>*\<psi\><rsub|n><around|(|u,v|)>*<space|0.17em>d*u*<space|0.17em>d*v|\<nobracket\>>>>|<row|<cell|>|<cell|<space|1em><around*|\<nobracket\>|-<big|int><big|int>C<around|(|u,v|)>*\<partial\><rsub|t>*r<rsub|k><around|(|t-u,s-v|)>*<space|0.17em>d*u*<space|0.17em>d*v|]>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|t,s|)>=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|t,s|)>>>>>
    </align*>

    where the eigenvalue <math|\<lambda\><rsub|n>> is given by:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><big|int>C<around|(|t,s|)>*\<psi\><rsub|n><around|(|t,s|)>*<space|0.17em>d*t*<space|0.17em>d*s
    </equation*>
  </proof>

  The eigenfunctions of the non-stationary process are then given by:

  <\equation*>
    \<phi\><rsub|n><around|(|t|)>=\<psi\><rsub|n><around|(|t,t|)>
  </equation*>

  Thus, we have shown that the orthogonalized null space functions are
  eigenfunctions of the non-stationary covariance operator, providing a
  direct method to construct eigenfunctions for non-stationary operators. The
  eigenvalues are determined by the inner product of the covariance function
  with the corresponding eigenfunction.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Null
      Space Property> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Eigenfunctions
      from Orthogonalized Null Space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>