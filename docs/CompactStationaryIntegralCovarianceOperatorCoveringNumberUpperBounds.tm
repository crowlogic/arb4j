<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <section|Preliminaries>

  The Fourier transform <math|\<cal-F\>> and its inverse
  <math|\<cal-F\><rsup|-1>> are defined as:

  <\equation*>
    \<cal-F\><around|[|f|]><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)>*e<rsup|-i*\<omega\>*x>*d*x
  </equation*>

  <\equation*>
    \<cal-F\><rsup|-1><around|[|g|]><around|(|x|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*d*\<omega\>
  </equation*>

  <section|Theoretical Framework>

  Let <math|K*<around|(|x-y|)>> be a stationary positive-definite kernel. By
  Bochner's theorem:

  <\equation*>
    K*<around|(|x-y|)>=\<cal-F\><rsup|-1><around|[|S|]><around|(|\<omega\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|x-y|)>>*S<around|(|\<omega\>|)>*d*\<omega\>
  </equation*>

  where <math|S<around|(|\<omega\>|)>*d*\<omega\>> is the spectral measure.

  <section|The Null Space>

  Let <math|<around|{|P<rsub|n><around|(|\<omega\>|)>|}><rsub|n=0><rsup|\<infty\>>>
  be polynomials orthogonal with respect to <math|S<around|(|\<omega\>|)>>:

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|m><around|(|\<omega\>|)>*P<rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>=\<delta\><rsub|m*n>
  </equation*>

  Since <math|P<rsub|0><around|(|\<omega\>|)>> is constant, for any
  <math|n\<geq\>1>:

  <\equation*>
    <around|\<langle\>|P<rsub|n>,1|\<rangle\>><rsub|S>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>=0
  </equation*>

  Therefore <math|<around|{|\<cal-F\><rsup|-1><around|[|P<rsub|n>|]>|}><rsub|n=1><rsup|\<infty\>>>
  is the null space of the kernel integral operator:

  <\equation*>
    <around|\<langle\>|K,\<cal-F\><rsup|-1><around|[|P<rsub|n>|]>|\<rangle\>>=<around|\<langle\>|\<cal-F\><rsup|-1><around|[|S|]>,\<cal-F\><rsup|-1><around|[|P<rsub|n>|]>|\<rangle\>>=<around|\<langle\>|S,P<rsub|n>|\<rangle\>>=0
  </equation*>

  <section|Uniform Basis of the Kernel>

  Define the null space vectors:

  <\equation*>
    \<eta\><rsub|n><around|(|x|)>=\<cal-F\><rsup|-1><around|[|P<rsub|n><around|(|\<omega\>|)>|]><around|(|x|)>
  </equation*>

  Apply Gram-Schmidt to <math|<around|{|\<eta\><rsub|n>|}>> to obtain
  orthonormal sequence <math|<around|{|\<psi\><rsub|n>|}>>. Then:

  <\equation*>
    K<around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|K,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n><around|(|x|)>
  </equation*>

  with uniform convergence.

  <section|Uniform Basis of the Spectral Factor>

  Let <math|<around|{|Q<rsub|n><around|(|\<omega\>|)>|}><rsub|n=0><rsup|\<infty\>>>
  be orthogonal polynomials with respect to
  <math|<sqrt|S<around|(|\<omega\>|)>>>:

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>Q<rsub|m><around|(|\<omega\>|)>*Q<rsub|n><around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*d*\<omega\>=\<delta\><rsub|m*n>
  </equation*>

  Define:

  <\equation*>
    \<xi\><rsub|n><around|(|x|)>=\<cal-F\><rsup|-1><around|[|Q<rsub|n><around|(|\<omega\>|)>|]><around|(|x|)>
  </equation*>

  Apply Gram-Schmidt to <math|<around|{|\<xi\><rsub|n>|}>> to obtain
  orthonormal sequence <math|<around|{|\<phi\><rsub|n>|}>>. Then:

  <\equation*>
    g<around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|n>|\<rangle\>>*\<phi\><rsub|n><around|(|x|)>
  </equation*>

  where <math|g> is the spectral factor satisfying <math|g\<ast\>g=K> and
  <math|\<cal-F\><around|[|g|]>=<sqrt|S>>.

  <section|Eigenfunction Construction>

  By Fubini's theorem and uniform convergence:

  <\equation*>
    K*<around|(|x-y|)>=<around|(|g\<ast\>g|)>*<around|(|x-y|)>=<big|sum><rsub|m,n=0><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|m>|\<rangle\>><around|\<langle\>|g,\<phi\><rsub|n>|\<rangle\>>*<around|(|\<phi\><rsub|m>\<ast\>\<phi\><rsub|n>|)>*<around|(|x-y|)>
  </equation*>

  The eigenfunctions <math|<around|{|f<rsub|n>|}>> can be expressed in the
  uniform basis <math|<around|{|\<psi\><rsub|n>|}>> with finitely many terms:

  <\equation*>
    f<rsub|n><around|(|x|)>=<big|sum><rsub|k=0><rsup|n>c<rsub|n*k>*\<psi\><rsub|k><around|(|x|)>
  </equation*>

  where coefficients <math|c<rsub|n*k>> are determined by the recurrence
  relations of the underlying orthogonal polynomials.

  <section|Conclusion>

  This construction provides a systematic method for finding eigenfunctions
  of stationary kernels through:

  <\enumerate>
    <item>Construction of orthogonal polynomial systems

    <item>Transformation to the null space

    <item>Gram-Schmidt orthogonalization

    <item>Exploitation of convolution structure
  </enumerate>

  The triangular structure emerges naturally from the polynomial degree
  preservation under convolution in the spectral domain.

  \;

  <section|Covering Numbers>

  Consider a stationary covariance kernel K with orthonormal expansion on
  L\<twosuperior\>(0,\<infty\>):

  <\equation*>
    K<around|(|x|)>=<big|sum><rsub|i=0><rsup|\<infty\>><around|\<langle\>|K,\<psi\><rsub|i>|\<rangle\>>*\<psi\><rsub|i><around|(|x|)>
  </equation*>

  The associated covariance operator T is self-adjoint due to stationarity:

  <\equation*>
    T<around|(|f|)><around|(|y|)>=<big|int><rsub|0><rsup|\<infty\>>K*<around|(|x-y|)>*f<around|(|x|)>*d*x
  </equation*>

  Define:

  <\itemize>
    <item>For kernel K:

    <\equation*>
      N<rsub|K><around|(|\<varepsilon\>|)>=<text|min><around|{|n:<around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>\<leq\>\<varepsilon\>|}>
    </equation*>

    where

    <\equation*>
      K<rsub|n><around|(|x|)>=<big|sum><rsub|i=0><rsup|n><around|\<langle\>|K,\<psi\><rsub|i>|\<rangle\>>*\<psi\><rsub|i><around|(|x|)>
    </equation*>

    and

    <\equation*>
      <around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>=max<rsub|x\<in\><around|[|0,\<infty\>|)>><around|\||K<around|(|x|)>-K<rsub|n><around|(|x|)>|\|>
    </equation*>

    <item>For operator T:

    <\equation*>
      N<rsub|T><around|(|\<varepsilon\>|)>=<text|min><around|{|n:<around|\<\|\|\>|T-T<rsub|n>|\<\|\|\>>\<leq\>\<varepsilon\>|}>
    </equation*>

    where T<rsub|n> is the operator with kernel K<rsub|n> and
    \<\|\|\>T\<\|\|\> is the operator norm
  </itemize>

  Define:

  <\equation*>
    n<around|(|\<varepsilon\>|)>=<text|max><around|{|k:<around|\||<around|\<langle\>|K,\<psi\><rsub|k>|\<rangle\>>|\|>\<gtr\>\<varepsilon\>|}>
  </equation*>

  <\theorem>
    For stationary kernel K, <math|N<rsub|K><around|(|\<varepsilon\>|)>=N<rsub|T><around|(|\<varepsilon\>|)>\<leq\>n<around|(|\<varepsilon\>|)>>
  </theorem>

  <\proof>
    1. Kernel bound <math|N<rsub|K><around|(|\<varepsilon\>|)>\<leq\>n<around|(|\<varepsilon\>|)>>:

    <\equation*>
      <around|\||K<around|(|x|)>-K<rsub|n<around|(|\<varepsilon\>|)>><around|(|x|)>|\|>=<around|\||<big|sum><rsub|i\<gtr\>n<around|(|\<varepsilon\>|)>><around|\<langle\>|K,\<psi\><rsub|i>|\<rangle\>>*\<psi\><rsub|i><around|(|x|)>|\|>
    </equation*>

    By Cauchy-Schwarz:

    <\equation*>
      \<leq\><sqrt|<big|sum><rsub|i\<gtr\>n<around|(|\<varepsilon\>|)>><around|\||<around|\<langle\>|K,\<psi\><rsub|i>|\<rangle\>>|\|><rsup|2>>*<sqrt|<big|sum><rsub|i\<gtr\>n<around|(|\<varepsilon\>|)>><around|\||\<psi\><rsub|i><around|(|x|)>|\|><rsup|2>>
    </equation*>

    Since <math|<around|{|\<psi\><rsub|i>|}>> is orthonormal,
    <math|<around|\||\<psi\><rsub|i><around|(|x|)>|\|>\<leq\>1> and
    <math|<big|sum><around|\||\<psi\><rsub|i><around|(|x|)>|\|><rsup|2>\<leq\>1>
    By definition of <math|n<around|(|\<varepsilon\>|)>>,
    <math|<around|\||<around|\<langle\>|K,\<psi\><rsub|i>|\<rangle\>>|\|>\<leq\>\<varepsilon\>>
    for <math|i\<gtr\>n<around|(|\<varepsilon\>|)>> Therefore:

    <\equation*>
      <around|\<\|\|\>|K-K<rsub|n<around|(|\<varepsilon\>|)>>|\<\|\|\>><rsub|\<infty\>>\<leq\>\<varepsilon\>
    </equation*>

    2. Operator bound: For any <math|f> with
    <math|<around|\<\|\|\>|f|\<\|\|\>>\<leq\>1>:

    <\equation>
      <\equation*>
        <tabular|<tformat|<table|<row|<cell|<around|\<\|\|\>|T<around|(|f|)>-T<rsub|n><around|(|f|)>|\<\|\|\>>>|<cell|\<leq\><around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>><around|\<\|\|\>|f|\<\|\|\>>>>|<row|<cell|>|<cell|\<leq\><around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>>>>>>
      </equation*>
    </equation>

    Therefore:

    <\equation>
      <around|\<\|\|\>|T-T<rsub|n>|\<\|\|\>>\<leq\><around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>
    </equation>

    3. Reverse inequality: Let <math|> be a point where
    <math|<around*|\||K<around*|(|z|)>-K<rsub|n><around*|(|z|)>|\|>=<around*|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>>
    is achieved:

    <\equation>
      z=<around*|{|:x<rsup|\<ast\>><around|\||K<around|(|x<rsup|\<ast\>>|)>-K<rsub|n><around|(|x<rsup|\<ast\>>|)>|\|>=<around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>|}>
    </equation>

    By stationarity, let j be the index maximizing \|\<langle\>K-K<rsub|n>,
    \<psi\><rsub|j>\<rangle\>\|. Take f = \<psi\><rsub|j>. Then:

    <\equation*>
      <around|(|T-T<rsub|n>|)>*f<around|(|x<rsup|\<ast\>>|)>=<around|(|K-K<rsub|n>|)><around|(|x<rsup|\<ast\>>|)>
    </equation*>

    Therefore:

    <\equation*>
      <around|\<\|\|\>|T-T<rsub|n>|\<\|\|\>>\<geq\><around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>
    </equation*>

    Combining the inequalities:

    <\equation*>
      <around|\<\|\|\>|T-T<rsub|n>|\<\|\|\>>=<around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>
    </equation*>

    This establishes <math|N<rsub|K><around|(|\<varepsilon\>|)>=N<rsub|T><around|(|\<varepsilon\>|)>>
  </proof>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_65.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_65.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_65.tm>>
    <associate|auto-4|<tuple|4|1|../../.TeXmacs/texts/scratch/no_name_65.tm>>
    <associate|auto-5|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_65.tm>>
    <associate|auto-6|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_65.tm>>
    <associate|auto-7|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_65.tm>>
    <associate|auto-8|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_65.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Theoretical
      Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Null
      Space Property> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Uniform
      Basis of the Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Uniform
      Basis of the Spectral Factor> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Eigenfunction
      Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Covering
      Numbers> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>