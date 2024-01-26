<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <section|Introduction>

  The <math|<rsub|3>F<rsub|1>> hypergeometric function is an important
  function in mathematical analysis with both terminating and non-terminating
  cases. This document provides an overview of its general form and a
  detailed look at the terminating case.

  <section|Rising Factorial>

  The rising factorial, denoted as <math|<around|(|x|)><rsub|n>>, is defined
  by the product:

  <\equation>
    <around|(|x|)><rsub|n>=x\<cdot\><around|(|x+1|)>\<cdot\><around|(|x+2|)>\<cdot\>\<ldots\>\<cdot\><around|(|x+n-1|)>
  </equation>

  for <math|n> consecutive terms, or equivalently,

  <\equation>
    <around|(|x|)><rsub|n>=<big|prod><rsub|k=0><rsup|n-1><around|(|x+k|)>
  </equation>

  <section|General Form of <math|<rsub|3>F<rsub|1>> Hypergeometric Function>

  The general form of the <math|<rsub|3>F<rsub|1>> hypergeometric function is
  defined as:

  <\equation>
    <rsub|3>F<rsub|1><around|(|a<rsub|1>,a<rsub|2>,a<rsub|3>;b<rsub|1>;x|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|a<rsub|1>|)><rsub|n><around|(|a<rsub|2>|)><rsub|n><around|(|a<rsub|3>|)><rsub|n>|<around|(|b<rsub|1>|)><rsub|n>>*<frac|x<rsup|n>|n!>
  </equation>

  where <math|<around|(|a|)><rsub|n>> denotes the rising factorial
  (Pochhammer symbol).

  <section|<math|<rsub|3>F<rsub|1>> Hypergeometric Function in the
  Terminating Case>

  In the terminating case, the <math|<rsub|3>F<rsub|1>> function is defined
  as:

  <\equation>
    <rsub|3>F<rsub|1><around|(|\<alpha\><rsub|1>,\<alpha\><rsub|2>,\<alpha\><rsub|3>;\<beta\><rsub|1>;x|)>=<big|sum><rsub|n=0><rsup|m>f<rsub|n><around|(|x|)>
  </equation>

  where <math|m> is the smallest negative integer among the numerator
  coefficients <math|\<alpha\><rsub|k>>:

  <\equation>
    m=min <around|(|<around|{|-max <around|(|\<alpha\><rsub|k>,0|)>\<mid\>k=1,2,3|}>|)>
  </equation>

  and the terms <math|f<rsub|n><around|(|x|)>> are defined by the recurrence
  relation:

  <\equation>
    f<rsub|n+1><around|(|x|)>=x*f<rsub|n><around|(|x|)><frac|<around|(|\<alpha\><rsub|1>|)><rsub|n><around|(|\<alpha\><rsub|2>|)><rsub|n><around|(|\<alpha\><rsub|3>|)><rsub|n>|<around|(|\<beta\><rsub|1>|)><rsub|n>\<times\>n!><space|1em>\<forall\>n\<geq\>0
  </equation>

  with the initial condition:

  <\equation>
    f<rsub|0><around|(|x|)>=1
  </equation>

  <section|Conclusion>

  The <math|<rsub|3>F<rsub|1>> hypergeometric function, with its general and
  terminating forms, provides a rich area for exploration in mathematical
  analysis, with numerous applications in various fields.
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
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|1>>
    <associate|auto-5|<tuple|5|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Rising
      Factorial> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>General
      Form of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<rsub|3>F<rsub|1>>>
      Hypergeometric Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc><with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<rsub|3>F<rsub|1>>>
      Hypergeometric Function in the Terminating Case>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>