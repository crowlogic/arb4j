<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Eigenfunctions of Stationary Operators via Null Space
  Orthogonalization>|<doc-date|<date|>>>

  Let <math|C<around|(|x|)>> be the covariance function of a stationary
  Gaussian process on <math|\<bbb-R\>>. The covariance operator <math|T> is
  defined by:

  <\equation*>
    <around|(|T*f|)><around|(|x|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C*<around|(|x-y|)>*f<around|(|y|)>*<space|0.17em>d*y.
  </equation*>

  The spectral density <math|S<around|(|\<omega\>|)>> of the process is
  related to <math|C<around|(|x|)>> by Bochner's theorem:

  <\equation*>
    C<around|(|x|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>.
  </equation*>

  We consider polynomials <math|<around|{|p<rsub|n><around|(|\<omega\>|)>|}>>
  orthogonal with respect to <math|S<around|(|\<omega\>|)>> over its domain:

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*p<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>=\<delta\><rsub|n*m>.
  </equation*>

  The inverse Fourier transforms of these polynomials are:

  <\equation*>
    r<rsub|n><around|(|x|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*<space|0.17em>d*\<omega\>.
  </equation*>

  <section|Null Space Property>

  We prove that <math|r<rsub|n><around|(|x|)>> form the null space of the
  kernel inner product:

  <\equation*>
    <big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)>*d*x=0
  </equation*>

  <\proof>
    <\align*>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)>*d*x>|<cell|=<big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)><frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*<space|0.17em>d*\<omega\>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\><rprime|'>*x>*S<around|(|\<omega\><rprime|'>|)>*<space|0.17em>d*\<omega\><rprime|'>*<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*<space|0.17em>d*\<omega\>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\><rprime|'>|)>*p<rsub|n><around|(|\<omega\>|)>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\><rprime|'>+\<omega\>|)>*x>*<space|0.17em>d*x*<space|0.17em>d*\<omega\>*<space|0.17em>d*\<omega\><rprime|'>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\><rprime|'>|)>*p<rsub|n><around|(|\<omega\>|)>*\<pi\>*\<delta\>*<around|(|\<omega\><rprime|'>+\<omega\>|)>*<space|0.17em>d*\<omega\>*<space|0.17em>d*\<omega\><rprime|'>>>|<row|<cell|>|<cell|=<frac|\<pi\>|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\><rprime|'>|)>*p<rsub|n>*<around|(|-\<omega\><rprime|'>|)>*<space|0.17em>d*\<omega\><rprime|'>=0>>>>
    </align*>
  </proof>

  <section|Eigenfunctions from Orthogonalized Null Space>

  By orthogonalizing the null space <math|<around|{|r<rsub|n><around|(|x|)>|}>>,
  we obtain the eigenfunctions <math|<around|{|\<psi\><rsub|n><around|(|x|)>|}>>
  of the covariance operator <math|T>. The orthogonalization process gives:

  <\equation*>
    \<psi\><rsub|n><around|(|x|)>=<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*r<rsub|k><around|(|x|)>
  </equation*>

  where the coefficients <math|a<rsub|n*k>> are given by:

  <\equation*>
    a<rsub|n*k>=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
    >k=n>>|<row|<cell|-<big|sum><rsub|j=k><rsup|n-1>a<rsub|n*j>*<around|\<langle\>|r<rsub|n>,\<psi\><rsub|j>|\<rangle\>>>|<cell|<text|if
    >k\<less\>n>>|<row|<cell|0>|<cell|<text|if >k\<gtr\>n>>>>>
  </equation*>

  We prove that these are indeed eigenfunctions:

  <\proof>
    Let <math|\<psi\><rsub|n><around|(|x|)>=<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|x|)>>.
    Then:

    <\align*>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>C*<around|(|x-y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>C*<around|(|x-y|)>*<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|y|)>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<big|sum><rsub|k>a<rsub|n*k>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>C*<around|(|x-y|)>*r<rsub|k><around|(|y|)>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<big|sum><rsub|k>a<rsub|n*k>*<big|int><rsub|-\<infty\>><rsup|x>C*<around|(|x-y|)>*r<rsub|k><around|(|y|)>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<big|sum><rsub|k>a<rsub|n*k>*<around*|[|r<rsub|k><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*\<psi\><rsub|n><around|(|z|)>*<space|0.17em>d*z-<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*<big|int><rsub|0><rsup|z>r<rsub|k><rprime|'>*<around|(|x-t|)>*<space|0.17em>d*t*<space|0.17em>d*z|]>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*<big|sum><rsub|k>a<rsub|n*k>*r<rsub|k><around|(|x|)>=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|x|)>>>>>
    </align*>

    where the eigenvalue <math|\<lambda\><rsub|n>> is given by:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*\<psi\><rsub|n><around|(|z|)>*<space|0.17em>d*z
    </equation*>
  </proof>

  Thus, we have shown that the orthogonalized null space functions are
  eigenfunctions of the covariance operator, providing a direct method to
  construct eigenfunctions for stationary operators. The eigenvalues are
  determined by the inner product of the covariance function with the
  corresponding eigenfunction.
</body>

<\initial>
  <\collection>
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