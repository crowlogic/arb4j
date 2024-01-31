<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Solving for the Eigenfunctions of the Integral
  Covariance Operator of Wide-Sense Stationary Gaussian Process>>

  <section|Introduction>

  This document details the method for solving the eigenfunctions of the
  integral covariance operator using the Karhunen-Loève expansion and the
  Galerkin projection method.

  <\definition>
    A stochastic process <math|X<around|(|t|)>> is said to be
    <strong|wide-sense stationary> (WSS) if it satisfies the following
    conditions:

    <\enumerate>
      <item>The mean of the process is constant over time, i.e.,
      <math|\<bbb-E\><around|[|X<around|(|t|)>|]>=\<mu\>> for all <math|t>,
      where <math|\<mu\>> is a constant.

      <item>The variance of the process is constant over time, i.e.,
      Var<math|<around|(|X<around|(|t|)>|)>> is the same for all <math|t>.

      <item>The autocovariance function depends only on the time difference,
      i.e., Cov<math|<around|(|X<around|(|t<rsub|1>|)>,X<around|(|t<rsub|2>|)>|)>=f<around|(|<around*|\||t<rsub|1>-t<rsub|2>|\|>|)>>
      for some function <math|f>, meaning the covariance between
      <math|X<around|(|t<rsub|1>|)>> and <math|X<around|(|t<rsub|2>|)>> is
      the same as between <math|X*<around|(|t<rsub|1>+\<tau\>|)>> and
      <math|X*<around|(|t<rsub|2>+\<tau\>|)>> for any time shift
      <math|\<tau\>>.
    </enumerate>
  </definition>

  <section|Covariance Kernel and Integral Operator>

  Consider the covariance kernel <math|C<around|(|x,y|)>=C<around*|(|x-y|)>>
  which is assumed to be infinitely differentiable and positive definite. The
  integral covariance operator <math|T> acting on a function <math|f> over
  <math|<around*|[|0,\<infty\>|)>> is defined as:

  <\equation>
    <around|(|T*f|)><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|x-y|)>*f<around|(|y|)>*d*y
  </equation>

  \;

  <section|Eigenvalue Problem>

  The eigenfunctions <math|\<phi\><rsub|n><around|(|x|)>> and eigenvalues
  <math|\<lambda\><rsub|n>> of the operator <math|T> satisfy:

  <\equation>
    <big|int><rsub|\<Omega\>>C<around|(|x-y|)>*\<phi\><rsub|n><around|(|y|)>*d*y=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|x|)>
  </equation>

  <section|Karhunen-Loève Expansion>

  The Karhunen-Loève expansion for a stochastic process
  <math|X<around|(|x|)>> is:

  <\equation>
    X<around|(|x|)>=<big|sum><rsub|n=1><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|x|)>*Z<rsub|n>
  </equation>

  where <math|Z<rsub|n>> are uncorrelated random variables.

  <section|Galerkin Projection>

  We approximate the eigenfunctions <math|\<phi\><rsub|n><around|(|x|)>> by:

  <\equation>
    \<phi\><rsub|n><around|(|x|)>\<approx\><big|sum><rsub|k=1><rsup|N>a<rsub|n*k>*\<psi\><rsub|k><around|(|x|)>
  </equation>

  using the orthogonal polynomial sequence
  <math|<around|{|\<psi\><rsub|k><around|(|x|)>|}><rsub|k=1><rsup|\<infty\>>>.

  <section|Galerkin Method Applied>

  Substituting the approximated <math|\<phi\><rsub|n><around|(|x|)>> into the
  integral equation, we have:

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>C<around|(|x-y|)><around*|(|<big|sum><rsub|k=1><rsup|N>a<rsub|n*k>*\<psi\><rsub|k><around|(|y|)>|)>*d*y=\<lambda\><rsub|n>*<big|sum><rsub|k=1><rsup|N>a<rsub|n*k>*\<psi\><rsub|k><around|(|x|)>
  </equation>

  Multiplying both sides by <math|\<psi\><rsub|j><around|(|x|)>> and
  integrating over <math|\<Omega\>>, we get a system of linear equations:

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>C<around|(|x-y|)><around*|(|<big|sum><rsub|k=1><rsup|N>a<rsub|n*k>*\<psi\><rsub|k><around|(|y|)>|)>*d*y*d*x=\<lambda\><rsub|n>*<big|int><rsup|\<infty\>><rsub|0>\<psi\><rsub|j><around|(|x|)>*<big|sum><rsub|k=1><rsup|N>a<rsub|n*k>*\<psi\><rsub|k><around|(|x|)>*d*x
  </equation>

  for <math|j=1,2,\<ldots\>,N>.

  <section|Solution>

  This results in a linear system in the coefficients <math|a<rsub|n*k>>.
  Solving this system yields the approximations of the eigenfunctions
  <math|\<phi\><rsub|n><around|(|x|)>>.

  <section|Conclusion>

  This document provides a structured approach for deriving the
  eigenfunctions of an integral covariance operator using Karhunen-Loève
  expansion and Galerkin projection method.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-5|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-6|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-7|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-8|<tuple|8|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Covariance
      Kernel and Integral Operator> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Eigenvalue
      Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Karhunen-Loève
      Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Galerkin
      Projection> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Galerkin
      Method Applied> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Solution>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>