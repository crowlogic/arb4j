<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Bessel Functions of Half-Integer Order and Related
  Functions>>

  <section|Definitions>

  <subsection|Bessel Function of the First Kind>

  The Bessel function of the first kind with half-integer order
  <math|n+<frac|1|2>> is defined as:

  <\equation>
    J<rsub|n+<frac|1|2>><around|(|x|)>=<sqrt|<frac|2|\<pi\>*x>>*<around|[|R<rsub|n-<frac|1|2>,0><around|(|x|)>*sin
    <around|(|x|)>-R<rsub|n-<frac|3|2>,1><around|(|x|)>*cos <around|(|x|)>|]>
  </equation>

  where <math|R<rsub|n,v><around|(|x|)>> are Lommel polynomials.

  <subsection|Lommel Polynomials>

  Lommel polynomials are defined in terms of hypergeometric functions as:

  <\equation>
    R<rsub|n,v><around|(|x|)>=<around*|(|<frac|x|2>|)><rsup|n>*<space|0.17em><rsub|1>F<rsub|2><around*|(|-<frac|n|2>;<frac|1-v-n|2>,<frac|2-v-n|2>;-<around*|(|<frac|x|2>|)><rsup|2>|)>
  </equation>

  <subsection|Hypergeometric Function>

  The generalized hypergeometric function
  <math|<rsub|1>F<rsub|2><around|(|a;b,c;z|)>> is defined as:

  <\equation>
    <rsub|1>F<rsub|2><around|(|a;b,c;z|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|a|)><rsub|k>|<around|(|b|)><rsub|k><around|(|c|)><rsub|k>>*<frac|z<rsup|k>|k!>
  </equation>

  where <math|<around|(|a|)><rsub|k>> is the Pochhammer symbol, defined as:

  <\equation>
    <around|(|a|)><rsub|k>=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
    >k=0>>|<row|<cell|a*<around|(|a+1|)>*<around|(|a+2|)>*\<cdots\>*<around|(|a+k-1|)>>|<cell|<text|if
    >k\<gtr\>0>>>>>
  </equation>

  <section|Bessel Function in Terms of Hypergeometric Functions>

  Combining the above definitions, we can express the Bessel function of
  half-integer order directly in terms of hypergeometric functions:

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|J<rsub|n+<frac|1|2>><around|(|x|)>=<sqrt|<frac|2|\<pi\>>><around*|[||\<nobracket\>>>|<cell|<around*|(|<frac|x|2>|)><rsup|n>*<space|0.17em><rsub|1>F<rsub|2><around*|(|-<frac|n-<frac|1|2>|2>;<frac|3|4>-<frac|n|2>,<frac|5|4>-<frac|n|2>;-<around*|(|<frac|x|2>|)><rsup|2>|)>*sin
      <around|(|x|)>>>|<row|<cell|>|<cell|<around*|\<nobracket\>|-<around*|(|<frac|x|2>|)><rsup|n-1>*<space|0.17em><rsub|1>F<rsub|2><around*|(|-<frac|n-<frac|3|2>|2>;<frac|1|4>-<frac|n|2>,<frac|3|4>-<frac|n|2>;-<around*|(|<frac|x|2>|)><rsup|2>|)>*cos
      <around|(|x|)>|]>>>>>
    </eqsplit>
  </equation>
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
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.3|1>>
    <associate|auto-5|<tuple|2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Definitions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Bessel Function of the First
      Kind <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Lommel Polynomials
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Hypergeometric Function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Bessel
      Function in Terms of Hypergeometric Functions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>