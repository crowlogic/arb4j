<TeXmacs|2.1.1>

<style|generic>

<\body>
  <section*|Jacobi Polynomials>

  The Jacobi polynomials can be defined by the following formulas:

  <with|font-series|bold|Formula for <math|A<around|(|n|)>>:>

  <\equation>
    A<around|(|n|)>=<frac|1|2>*<frac|<around|(|2*n+\<alpha\>+\<beta\>-1|)>*<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>+<around|(|2*n+\<alpha\>+\<beta\>-2|)>*<around|(|2*n+\<alpha\>+\<beta\>|)>*x|)>|n*<around|(|n+\<alpha\>+\<beta\>|)>*<around|(|2*n+\<alpha\>+\<beta\>-2|)>>
  </equation>

  <with|font-series|bold|Formula for <math|N<around|(|n|)>>:>

  <\equation>
    N<around|(|n|)>=-<frac|<around|(|-1+\<alpha\>+n|)>*<around|(|-1+n+\<beta\>|)>*<around|(|2*n+\<alpha\>+\<beta\>|)>|n*<around|(|n+\<alpha\>+\<beta\>|)>*<around|(|2*n+\<alpha\>+\<beta\>-2|)>>
  </equation>

  <with|font-series|bold|Recursive Formula for <math|P<around|(|n|)>>:>

  <\equation>
    P<around|(|n|)>=<choice|<tformat|<table|<row|<cell|1,>|<cell|<text|if
    >n=0,>>|<row|<cell|<frac|1|2>*<around|(|2+\<alpha\>+\<beta\>|)>*x-<frac|1|2>*\<beta\>+<frac|1|2>*\<alpha\>,>|<cell|<text|if
    >n=1,>>|<row|<cell|A<around|(|n|)>P<around*|(|n-1|)>+BP<around*|(|n-2|)>>|<cell|<text|otherwise>.>>>>>
  </equation>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Jacobi
      Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>