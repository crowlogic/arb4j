<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Karhunen-Loève Expansion and Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  The Karhunen-Loève Expansion (KLT) provides a framework to represent a
  zero-mean Gaussian process using its eigenfunctions and eigenvalues. This
  expansion is intimately tied to the solutions of the Fredholm Integral
  Equation of the second kind and Sturm-Liouville differential equations,
  which arise from the differentiability properties of the covariance
  function associated with the Gaussian process.

  <section|Fredholm Integral Equation of the Second Kind>

  Given a zero-mean Gaussian process <math|Z<around|(|t|)>> with covariance
  function <math|R<around|(|t,s|)>>, the eigenfunctions
  <math|\<phi\><rsub|n><around|(|t|)>> and eigenvalues
  <math|\<lambda\><rsub|n>> of <math|R<around|(|t,s|)>> satisfy the Fredholm
  Integral Equation of the second kind:

  <\equation>
    <big|int><rsub|a><rsup|b>R<around|(|t,s|)>*\<phi\><rsub|n><around|(|s|)>*d*s=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)>
  </equation>

  <section|Transition to Sturm-Liouville Problems>

  If <math|R<around|(|t,s|)>> is absolutely continuous with respect to
  <math|t>, differentiation of the Fredholm equation twice with respect to
  <math|t> yields a Sturm-Liouville differential equation:

  <\equation>
    q<around|(|t|)>*\<phi\><rsub|n><around|(|t|)>-<frac|d|d*t><around*|(|p<around|(|t|)><frac|d*|d*t>\<phi\><rsub|n><around*|(|t|)>|)>=\<lambda\><rsub|n>*w<around|(|t|)>*\<phi\><rsub|n><around|(|t|)>
  </equation>

  The functions <math|p<around|(|t|)>>, <math|q<around|(|t|)>>, and
  <math|w<around|(|t|)>> are derived from the original covariance function
  <math|R<around|(|t,s|)>> and its derivatives.

  <section|Karhunen-Loève Expansion>

  The solutions of the preceding differential equation facilitate the
  Karhunen-Loève Expansion of the Gaussian process <math|Z<around|(|t|)>> as:

  <\equation>
    Z<around|(|t|)>=<big|sum><rsub|n=1><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*\<xi\><rsub|n>*\<phi\><rsub|n><around|(|t|)>
  </equation>

  where <math|\<xi\><rsub|n>> are uncorrelated standard Gaussian random
  variables (i.e., <math|\<xi\><rsub|n>\<sim\>N<around|(|0,1|)>> and
  <math|E*<around|[|\<xi\><rsub|n>*\<xi\><rsub|m>|]>=\<delta\><rsub|n*m>>,
  with <math|\<delta\>> denoting the Kronecker delta).

  <section|Significance>

  The Karhunen-Loève Expansion has several important implications:

  <\itemize>
    <item><with|font-series|bold|Dimensionality Reduction>: The KLT is
    employed in dimensionality reduction contexts such as principal component
    analysis (PCA), where it offers an optimal representation of data in
    terms of orthogonal functions.

    <item><with|font-series|bold|Optimal Representations>: The eigenfunctions
    corresponding to the largest eigenvalues capture the most variance in the
    Gaussian process, aiding in approximations, modeling, and simulations.

    <item><with|font-series|bold|Understanding Covariance Structures>: The
    eigenfunctions and eigenvalues elucidate the underlying structure of the
    Gaussian process, shedding light on its smoothness, periodicity, and
    other inherent properties.
  </itemize>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-4|<tuple|4|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-5|<tuple|5|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Fredholm
      Integral Equation of the Second Kind>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Transition
      to Sturm-Liouville Problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Karhunen-Loève
      Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Significance>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>