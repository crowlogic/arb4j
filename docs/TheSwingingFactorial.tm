<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Swinging Factorial>>

  The sequence A056040, known as the <with|font-shape|italic|swinging
  factorial>, is defined as:

  <\equation*>
    a<around|(|n|)>=2<rsup|n-<around|(|n<modulo|2>|)>>*<big|prod><rsub|k=1><rsup|n>k<rsup|<around|(|-1|)><rsup|k+1>>.
  </equation*>

  The first few values of this sequence are:

  <\equation*>
    1,1,2,6,6,30,20,140,70,630,252,2772,924,12012,3432,51480,12870,218790,48620,923780,184756,3879876,705432,16224936,2704156,67603900,10400600,280816200,40116600,1163381400,155117520,4808643120,601080390,19835652870,2333606220.
  </equation*>

  <section*|Properties and Formulas>

  <section*|Equations>

  <\enumerate>
    <item><math|a<around|(|n|)>=<frac|n!|<around*|\<lfloor\>|<frac|n|2>|\<rfloor\>>!<rsup|2>>>.

    <item><math|a<around|(|0|)>=1>, <math|a<around|(|n|)>=n<rsup|<around|(|n<modulo|2>|)>><around*|(|<frac|4|n>|)><rsup|<around|(|n+1<modulo|2>|)>>*a*<around|(|n-1|)>>
    for <math|n\<geq\>1>.

    <item>Exponential generating function (e.g.f.):
    <math|<around|(|1+x|)>*I<rsub|0>*<around|(|2*x|)>> where <math|I<rsub|0>>
    is the modified Bessel function of the first kind.

    <item>Ordinary generating function (o.g.f.):

    \ <math|a<around|(|n|)>=<text|SeriesCoeff><rsub|n><around*|(|<frac|1+z/<around|(|1-4*z<rsup|2>|)>|<sqrt|1-4*z<rsup|2>>>|)>>.

    <item>Probability generating function (p.g.f.):\ 

    <math|a<around|(|n|)>=<text|PolyCoeff><rsub|n><around*|(|<around|(|1+z<rsup|2>|)><rsup|n>+n*z*<around|(|1+z<rsup|2>|)><rsup|n-1>|)>>.

    <item><math|a*<around|(|2*n+1|)>=A*046212*<around|(|2*n+1|)>=A*100071*<around|(|2*n+1|)>>

    <item><math|a*<around|(|2*n|)>=<binom|2*n|n>>;
    <math|a*<around|(|2*n+1|)>=<around|(|2*n+1|)><binom|2*n|n>>

    <item>D-finite with recurrence:

    \ <math|n\<cdot\>a<around|(|n|)>+<around|(|n-2|)>\<cdot\>a*<around|(|n-1|)>+4*<around|(|-2*n+3|)>\<cdot\>a*<around|(|n-2|)>+4*<around|(|-n+1|)>\<cdot\>a*<around|(|n-3|)>+16*<around|(|n-3|)>\<cdot\>a*<around|(|n-4|)>=0>.

    <item><math|<big|sum><rsub|n\<geq\>0><frac|1|a<around|(|n|)>>=<frac|4|3>+<frac|8*\<pi\>|9*<sqrt|3>>>.

    <item>Exponential generating function (e.g.f.): <math|U<around|(|0|)>>
    where\ 

    <\equation>
      U<around|(|k|)>=1+<frac|x|1-<frac|x|x+<frac|<around|(|k+1|)><rsup|2>|U<around|(|k+1|)>>>>
    </equation>

    \ (continued fraction, 3-step).

    <item>Central column of the coefficients of the swinging polynomials
    A162246.

    <item><math|a<around|(|n|)>=<big|sum><rsub|k=0><rsup|n>a<around|(|n|)>>
    where <math|a<around*|(|n+1|)>=ceil<around*|(|<frac|a<around*|(|n|)><rsup|2>|a<around*|(|n-1|)>>|)>-1>

    <item><math|a<around|(|n|)>=<text|hypergeometric><around|(|<around|[|-n,-n-1,<frac|1|2>|]>,<around|[|-n-2,1|]>,2|)>\<cdot\>2<rsup|n-1>\<cdot\><around|(|n+2|)>>

    <item><math|a<around|(|n|)>=4<rsup|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>>\<cdot\><text|hypergeometric><around|(|<around|[|-<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>,<frac|<around|(|-1|)><rsup|n>|2>|]>,<around|[|1|]>,1|)>>.

    <item><math|<big|sum><rsub|n\<geq\>0><frac|<around|(|-1|)><rsup|n>|a<around|(|n|)>>=<frac|4|3>-<frac|4*\<pi\>|9*<sqrt|3>>>.
  </enumerate>

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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|?|1>>
    <associate|auto-3|<tuple|15|2>>
    <associate|auto-4|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Properties
      and Formulas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Equations>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Examples>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|MAPLE <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>
    </associate>
  </collection>
</auxiliary>