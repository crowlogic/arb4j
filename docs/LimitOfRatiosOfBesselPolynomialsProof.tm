<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Proof of a Limit Involving Bessel Polynomials>>

  <section|Introduction>

  We aim to prove that for Bessel polynomials <math|y<rsub|n><around|(|x|)>>,
  defined by the recursion formula

  <\equation>
    y<rsub|n><around|(|x|)>=<around|(|2*n-1|)>*x*y<rsub|n-1><around|(|x|)>+y<rsub|n-2><around|(|x|)>
  </equation>

  the following limit holds:

  <\equation>
    lim<rsub|x\<to\>\<infty\>> <frac|y<rsub|n+1><around|(|x|)>|y<rsub|n><around|(|x|)>\<cdot\>x>=2*n+1
  </equation>

  <section|Proof>

  First, recall the recursion formula for Bessel polynomials:

  <\equation>
    y<rsub|n><around|(|x|)>=<around|(|2*n-1|)>*x*y<rsub|n-1><around|(|x|)>+y<rsub|n-2><around|(|x|)>
  </equation>

  This recursion formula establishes a relationship between three consecutive
  Bessel polynomials.

  Now consider the ratio <math|y<rsub|n+1><around|(|x|)>/y<rsub|n><around|(|x|)>>:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<frac|y<rsub|n+1><around|(|x|)>|y<rsub|n><around|(|x|)>>>|<cell|=<frac|<around|(|2*n+1|)>*x*y<rsub|n><around|(|x|)>+y<rsub|n-1><around|(|x|)>|y<rsub|n><around|(|x|)>>>>|<row|<cell|>|<cell|=<around|(|2*n+1|)>*x+<frac|y<rsub|n-1><around|(|x|)>|y<rsub|n><around|(|x|)>>>>>>>
  </equation>

  As <math|x\<to\>\<infty\>>, the term <math|y<rsub|n-1><around|(|x|)>/y<rsub|n><around|(|x|)>>
  becomes negligible compared to the term <math|<around|(|2*n+1|)>*x>. Thus,
  we have

  <\equation>
    lim<rsub|x\<to\>\<infty\>> <frac|y<rsub|n+1><around|(|x|)>|y<rsub|n><around|(|x|)>>=<around|(|2*n+1|)>*x
  </equation>

  Now, dividing both sides of Equation <eqref|eq:limit_ratio> by <math|x>, we
  get

  <\equation>
    lim<rsub|x\<to\>\<infty\>> <frac|y<rsub|n+1><around|(|x|)>|y<rsub|n><around|(|x|)>\<cdot\>x>=2*n+1
  </equation>

  This completes the proof.
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>