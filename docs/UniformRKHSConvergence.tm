<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Uniform Convergence of Orthonormal Basis Projections
  in RKHS with Stationary Kernels on <math|<around|[|0,\<infty\>|)>>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|April 10, 2025>>

  <\definition>
    [Stationary RKHS on <math|<around|[|0,\<infty\>|)>>] A reproducing kernel
    Hilbert space <math|H> over <math|D=<around|[|0,\<infty\>|)>> with kernel
    <math|k<around|(|x,y|)>=\<kappa\><around|(|<around|\||x-y|\|>|)>> is
    called <with|font-series|bold|stationary> if:

    <\enumerate>
      <item><math|\<kappa\>:<around|[|0,\<infty\>|)>\<to\>\<bbb-R\>> is
      continuous

      <item><math|\<exists\>M\<gtr\>0> such that
      <math|sup<rsub|h\<geq\>0><around|\||\<kappa\><around|(|h|)>|\|>\<leq\>M>

      <item>The evaluation functional <math|f\<mapsto\>f<around|(|x|)>> is
      continuous for all <math|x\<in\>D>
    </enumerate>
  </definition>

  <\theorem>
    [Uniform Convergence Without Trace Class]<label|thm:main> Let <math|H> be
    a stationary RKHS with orthonormal basis
    <math|<around|{|e<rsub|n>|}><rsub|n=1><rsup|\<infty\>>> and kernel
    satisfying:

    <\equation>
      sup<rsub|h\<geq\>0><around|\||\<kappa\><around|(|h|)>|\|>\<leq\>M where
      M\<in\>\<bbb-R\><rsup|+>
    </equation>

    For any <math|f\<in\>H> with expansion

    <\equation>
      f<around*|(|x|)>=<big|sum><rsub|n=1><rsup|\<infty\>>c<rsub|n>*e<rsub|n><around*|(|x|)>
    </equation>

    , the partial sums

    <\equation>
      S<rsub|N>*f=<big|sum><rsub|n=1><rsup|N>c<rsub|n>*e<rsub|n>
    </equation>

    \ converge uniformly:

    <\equation>
      lim<rsub|N\<to\>\<infty\>> sup<rsub|x\<geq\>0><around|\||S<rsub|N>*f<around|(|x|)>-f<around|(|x|)>|\|>=0
    </equation>
  </theorem>

  <\proof>
    1. <with|font-series|bold|RKHS Convergence>: By orthonormal basis
    properties:

    <\equation>
      lim<rsub|N\<to\>\<infty\>><around|\<\|\|\>|f-S<rsub|N>*f|\<\|\|\>><rsub|H>=0
    </equation>

    2. <with|font-series|bold|Pointwise Control>: For any
    <math|x\<in\><around|[|0,\<infty\>|)>>:

    <\align*>
      <tformat|<table|<row|<cell|<around|\||f<around|(|x|)>-S<rsub|N>*f<around|(|x|)>|\|>>|<cell|=<around|\||<around|\<langle\>|f-S<rsub|N>*f,k|(>\<cdot\>,x|)>\<rangle\><rsub|H>\|>>|<row|<cell|>|<cell|\<leq\><around|\<\|\|\>|f-S<rsub|N>*f|\<\|\|\>><rsub|H>*<sqrt|k<around|(|x,x|)>>>>|<row|<cell|>|<cell|=<around|\<\|\|\>|f-S<rsub|N>*f|\<\|\|\>><rsub|H>*<sqrt|k<around|(|0|)>>>>|<row|<cell|>|<cell|\<leq\><sqrt|M>*<around|\<\|\|\>|f-S<rsub|N>*f|\<\|\|\>><rsub|H>>>>>
    </align*>

    3. <with|font-series|bold|Uniform Convergence>: Take supremum over
    <math|x\<geq\>0>:

    <\equation>
      sup<rsub|x\<geq\>0><around|\||f<around|(|x|)>-S<rsub|N>*f<around|(|x|)>|\|>\<leq\><sqrt|M>*<around|\<\|\|\>|f-S<rsub|N>*f|\<\|\|\>><rsub|H>
    </equation>

    Since <math|<around|\<\|\|\>|f-S<rsub|N>*f|\<\|\|\>><rsub|H>\<to\>0> as
    <math|N\<rightarrow\>\<infty\>> and the eigenvalues must decrease
    monitonically towards zero if the integral covariance operator formed by
    this kernel is compct relative to the induced canonical metric, uniform
    convergence follows.
  </proof>

  <\remark>
    This result holds without requiring:

    <\enumerate>
      <item>Trace class property of the integral operator

      <item>Compactness of the domain

      <item>Mercer-type eigenvalue decay conditions

      <item>Summability of coefficients <math|<big|sum><around|\||c<rsub|n>|\|>>
    </enumerate>

    The key mechanism is the RKHS structure combined with uniform kernel
    boundedness.
  </remark>

  <\thebibliography|9>
    <bibitem|Aronszajn50>Aronszajn, N. (1950). Theory of Reproducing Kernels.
    Trans. AMS.

    <bibitem|Berlinet04>Berlinet, A. and Thomas-Agnan, C. (2004). Reproducing
    Kernel Hilbert Spaces. Springer.
  </thebibliography>
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
    <associate|auto-1|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-Aronszajn50|<tuple|Aronszajn50|2|../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|bib-Berlinet04|<tuple|Berlinet04|2|../.TeXmacs/texts/scratch/no_name_77.tm>>
    <associate|thm:main|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_77.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>