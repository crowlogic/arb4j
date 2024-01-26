<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <section|Introduction>

  The <math|<rsub|3>F<rsub|1>> hypergeometric function has both terminating
  and non-terminating cases. This document focuses on the terminating case,
  where at least one of the numerator parameters is a negative integer.

  <section|<math|<rsub|3>F<rsub|1>> Hypergeometric Function in the
  Terminating Case>

  The terminating case of the <math|<rsub|3>F<rsub|1>> hypergeometric
  function is defined as follows:

  <\equation>
    <rsub|3>F<rsub|1><around|(|\<alpha\><rsub|1>,\<alpha\><rsub|2>,\<alpha\><rsub|3>;\<beta\><rsub|1>;x|)>=<big|sum><rsub|n=0><rsup|m>f<rsub|n><around|(|x|)>
  </equation>

  where <math|m> is the smallest non-positive integer among the numerator
  coefficients <math|\<alpha\><rsub|k>>:

  <\equation>
    m=min <around|{|-max <around|(|\<alpha\><rsub|k>,0|)>\<mid\>k=1,2,3|}>
  </equation>

  and the terms <math|f<rsub|n><around|(|x|)>> are given by the recurrence
  relation:

  <\equation>
    f<rsub|n+1><around|(|x|)>=x*f<rsub|n><around|(|x|)><frac|<around|(|\<alpha\><rsub|1>|)><rsub|n><around|(|\<alpha\><rsub|2>|)><rsub|n><around|(|\<alpha\><rsub|3>|)><rsub|n>|<around|(|\<beta\><rsub|1>|)><rsub|n>\<times\>n!><space|1em>\<forall\>n\<geqslant\>0
  </equation>

  with the initial condition

  <\equation>
    f<rsub|0><around|(|x|)>=1
  </equation>

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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc><with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<rsub|3>F<rsub|1>>>
      Hypergeometric Function in the Terminating Case>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>