<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Study of a Non-linear Operator Transforming Function
  <math|f<around|(|x|)>>Study of a Non-linear Operator Transforming Function
  <math|f<around|(|x|)>>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>>

  \;

  <section|Introduction>

  In this paper, the transformation of a function <math|f<around|(|x|)>>
  using the non-linear operator <math|S*f<around|(|x|)>=tanh <around|(|ln
  <around|(|1+f<around|(|x|)><rsup|2>|)>|)>> is studied.

  <section|Transformation Operator>

  The operator is defined as:

  <\equation>
    S*f<around|(|x|)>=tanh <around|(|ln <around|(|1+f<around|(|x|)><rsup|2>|)>|)>
  </equation>

  This can be expressed equivalently as:

  <\equation>
    <frac|<around|(|1+f<around|(|x|)><rsup|2>|)><rsup|2>-1|<around|(|1+f<around|(|x|)><rsup|2>|)><rsup|2>+1>=a
  </equation>

  where <math|a> is any complex number

  <section|Inverse Transformation>

  Considering the range of the hyperbolic tangent function, the operator
  <math|S*f<around|(|x|)>> has four inverse branches. These are given by
  solving the equation <math|tanh <around|(|ln
  <around|(|1+f<around|(|x|)><rsup|2>|)>|)>=a> for <math|x>. The solutions
  are:

  <\align>
    <tformat|<table|<row|<cell|<around*|(|S
    f<rsup|>|)><rsub|1><rsup|-1><around*|(|a|)>>|<cell|=RootOf<around*|(|f<around*|(|x|)>-<sqrt|<frac|1-a+<sqrt|-a<rsup|2>+1>|a-1>>|)><eq-number>>>|<row|<cell|<around*|(|S
    f<rsup|>|)><rsub|2><rsup|-1><around*|(|a|)>>|<cell|=RootOf<around*|(|<around*|\<nobracket\>|f|(>x)+<sqrt|<frac|1-a+<sqrt|-a<rsup|2>+1>|a-1>>|)><eq-number>>>|<row|<cell|<around*|(|S
    f<rsup|>|)><rsub|3><rsup|-1><around*|(|a|)>>|<cell|=RootOf<around*|(|f<around*|(|x|)>-<sqrt|<frac|1+a+<sqrt|-a<rsup|2>+1>|a-1>>|)><eq-number>>>|<row|<cell|<around*|(|S
    f<rsup|>|)><rsub|4><rsup|-1><around*|(|a|)>>|<cell|=RootOf<around*|(|f<around*|(|x|)>+<sqrt|<frac|1+a+<sqrt|-a<rsup|2>+1>|a-1>>|)><eq-number>>>>>
  </align>

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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Transformation
      Operator> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Inverse
      Transformation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>