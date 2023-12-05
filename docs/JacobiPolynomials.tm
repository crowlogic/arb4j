<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <section| The Traditional Formulas>

  The Jacobi polynomials <math|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>
  are a class of orthogonal polynomials traditionally defined by the
  <math|3>-term recurrence relation

  \;

  <\equation>
    P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<around|(|A<rsub|n>*x+B<rsub|n>|)>*P<rsub|n-1><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>-C<rsub|n>*P<rsub|n-2><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>
  </equation>

  where

  <\equation>
    A<rsub|n>=<frac|<around|(|2*n+\<alpha\>+\<beta\>+1|)>*<around|(|2*n+\<alpha\>+\<beta\>+2|)>|2*<around|(|n+1|)>*<around|(|n+\<alpha\>+\<beta\>+1|)>>
  </equation>

  <\equation>
    B<rsub|n>=<frac|<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>|)>*<around|(|2*n+\<alpha\>+\<beta\>+1|)>|2*<around|(|n+1|)>*<around|(|n+\<alpha\>+\<beta\>+1|)>*<around|(|2*n+\<alpha\>+\<beta\>|)>>
  </equation>

  <\equation>
    C<rsub|n>=<frac|<around|(|n+\<alpha\>|)>*<around|(|n+\<beta\>|)>*<around|(|2*n+\<alpha\>+\<beta\>+2|)>|<around|(|n+1|)>*<around|(|n+\<alpha\>+\<beta\>+1|)>*<around|(|2*n+\<alpha\>+\<beta\>|)>>
  </equation>

  with initial conditions

  <\equation>
    P<rsub|0><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=1
  </equation>

  <\equation*>
    P<rsub|1><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<frac|1|2>*<around|(|\<alpha\>-\<beta\>+<around|(|2+\<alpha\>+\<beta\>|)>*x|)>
  </equation*>

  \;

  <section|Jacobi Polynomials>

  A more concise and computationally less redundant way to express
  <math|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>
  involves the coeffecient sequences\ 

  <\equation>
    a<rsub|n>=<frac|b<rsub|n>|c<rsub|n>>*<around|(|\<alpha\><rsup|2>-\<beta\><rsup|2>|)>
  </equation>

  <\equation>
    b<rsub|n>=<frac|c<rsub|<around*|(|n|)>>-1|c<rsub|<around*|(|n-1|)>>>
  </equation>

  where

  <\equation*>
    c<rsub|n>=2*n+\<alpha\>+\<beta\>
  </equation*>

  so that the Jacobi polynomials are then expressed by the initial conditions
  and recurrence equation\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|P<rsub|0><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>|<cell|=1>|<cell|>>|<row|<cell|P<rsub|1><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>|<cell|=<frac|c<rsub|1>|2>+x<around|(|\<alpha\>-\<beta\>|)>*>|<cell|>>|<row|<cell|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>|<cell|=a<rsub|n>*x*P<rsub|n-1><around|(|x|)>+b<rsub|n>*P<rsub|n-2><around|(|x|)>
    >|<cell|\<forall\>n\<geqslant\>2>>>>>
  </equation>

  For Jacobi polynomials, the condition is that both the parameters
  <math|\<alpha\>> and <math|\<beta\>> must be individually greater than
  <math|-1>. This requirement ensures that the weight function

  <\equation>
    w<around*|(|x|)>=<around|(|1-x|)><rsup|\<alpha\>>*<around|(|1+x|)><rsup|\<beta\>>
    </equation>

  on the interval <math|x\<in\><around|[|-1,1|]>> is well-defined and
  integrable. If either <math|\<alpha\>> or <math|\<beta\>> were less than
  <math|-1>, the integrals at the endpoints of the interval would diverge and
  the weight function would no longer be integrable.\ 

  <\equation*>
    P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<frac|<around|(|n+\<alpha\>|)>*<around|(|n+\<beta\>|)>*P<rsub|n-1><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>-C<rsub|n>*P<rsub|n-2><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|<around|(|2*n+\<alpha\>+\<beta\>|)>>
  </equation*>

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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_15.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_15.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>
      The Traditional Formulas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Jacobi
      Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>