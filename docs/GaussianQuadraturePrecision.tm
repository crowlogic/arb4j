<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Precision of Gaussian Quadrature Methods>>

  <section|Introduction>

  This article provides a detailed exploration of Gaussian quadrature
  methods, emphasizing rigorous error estimates. These methods, associated
  with Jacobi, Legendre, Chebyshev, Laguerre, and Hermite polynomials, are
  fundamental in numerical integration across various intervals.

  <section|Gaussian Quadrature Methods and Their Error Estimates>

  Gaussian quadrature methods are essential for numerical integration,
  offering precise determination of accuracuy that depend on the
  highest-order derivative of the function within the interval of
  integration.

  <subsection|Gauss-Legendre Quadrature>

  In Gauss-Legendre Quadrature the distance between the actual and the
  calculated values is no greaer than

  <\equation>
    E<rsub|n><around|(|f|)>=<frac|<around|(|b-a|)><rsup|2*n+1>*<around|(|2*n|)>!|<around|(|2<rsup|n>*n!|)><rsup|4>*<around|(|2*n+1|)>>*max<rsub|\<xi\>\<in\><around|[|a,b|]>><around|\||f<rsup|<around|(|2*n|)>><around|(|\<xi\>|)>|\|>
  </equation>

  where <math|f<rsup|<around|(|2*n|)>>> is the <math|2*n>-th derivative of
  the function <math|f>

  <subsection|Gauss-Chebyshev Quadrature>

  For Gauss-Chebyshev Quadrature of the first kind, the difference is no
  greater than is:

  <\equation>
    E<rsub|n><around|(|f|)>=<frac|\<pi\><rsup|2>|2<rsup|2*n+1><around|(|n!|)><rsup|2>>*max<rsub|\<xi\>\<in\><around|[|-1,1|]>><around|\||f<rsup|<around|(|2*n|)>><around|(|\<xi\>|)>|\|>
  </equation>

  suitable for functions weighted by <math|<frac|1|<sqrt|1-x<rsup|2>>>>

  <subsection|Gauss-Laguerre Quadrature>

  The accuracy in Gauss-Laguerre Quadrature is:

  <\equation>
    E<rsub|n><around|(|f|)>=<frac|<around|(|n!|)><rsup|2>|<around|(|2*n+1|)><around|[|<around|(|2*n|)>!|]><rsup|3>>*max<rsub|\<xi\>\<in\><around|[|0,\<infty\>|)>><around|\||f<rsup|<around|(|2*n|)>><around|(|\<xi\>|)>|\|>
  </equation>

  assuming <math|f> is sufficiently smooth on
  <math|<around|[|0,\<infty\>|)>>.

  <subsection|Gauss-Hermite Quadrature>

  For Gauss-Hermite Quadrature, the precision is\ 

  <\equation>
    E<rsub|n><around*|(|f|)>=max<rsub|\<xi\>\<in\><around*|(|-\<infty\>,\<infty\>|)>>f<rsup|<around*|(|2n|)>><around*|(|\<xi\>|)>2<rsup|2n+1>n!<rsup|2><sqrt|\<pi\>>
  </equation>

  <section|Conclusion>\ 

  Understanding these rigorous error estimates is crucial for the effective
  application of Gaussian quadrature in computational mathematics. They
  provide a framework for evaluating the accuracy of numerical integrations
  across various types of functions and intervals
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|auto-3|<tuple|2.1|1|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|auto-4|<tuple|2.2|1|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|auto-5|<tuple|2.3|1|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|auto-6|<tuple|2.4|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|auto-7|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Gaussian
      Quadrature Methods and Their Error Estimates>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Gauss-Legendre Quadrature
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Gauss-Chebyshev Quadrature
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Gauss-Laguerre Quadrature
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.4<space|2spc>Gauss-Hermite Quadrature
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>