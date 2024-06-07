<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunction and Eigenvalue of the Sine Kernel>>

  <section|Introduction>

  The sine kernel is defined by:

  <\equation>
    K<around|(|x,y|)>=<frac|sin <around|(|x-y|)>|\<pi\>*<around|(|x-y|)>>
  </equation>

  <section|Eigenfunction and Eigenvalue>

  The eigenfunction <math|p<rsub|0><around*|(|x|)>=sin <around|(|x|)>>
  satisfies:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|sin
    <around|(|x-y|)>|\<pi\>*<around|(|x-y|)>>*sin
    <around|(|y|)>*<space|0.17em>d*y=sin <around|(|x|)>
  </equation>

  with corresponding eigenvalue is 1.

  <section|Fourier Transform and Heaviside Functions>

  The Fourier transform of <math|p<rsub|0><around*|(|y|)>> is:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>*e<rsup|i*x*y>*<frac|sin
    <around|(|y|)>|y*\<pi\>>*<space|0.17em>d*y=\<theta\>*<around|(|x+1|)>-\<theta\>*<around|(|x-1|)>*
  </equation>

  where <math|\<theta\><around*|(|x|)>> is the Heaviside step function

  <\equation>
    \<theta\><around*|(|x|)>=<choice|<tformat|<table|<row|<cell|1>|<cell|x\<gtr\>0>>|<row|<cell|<frac|1|2>=<frac|lim<rsub|x\<rightarrow\>0<rsup|+>>\<theta\><around*|(|x|)>+lim<rsub|x\<rightarrow\>0<rsup|->>\<theta\><around*|(|x|)>|2>>|<cell|x=0>>|<row|<cell|0>|<cell|x\<less\>0>>>>>
  </equation>

  <section|Identity Validation>

  The convolution of the sine function under the sine kernel is:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|sin
    <around|(|x-y|)>|\<pi\>*<around|(|x-y|)>>*<frac|sin
    <around|(|y|)>|\<pi\>*y>*<space|0.17em>d*y=<frac|sin
    <around|(|x|)>|x*\<pi\>>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_34.tm>>
    <associate|auto-4|<tuple|4|1|../../.TeXmacs/texts/scratch/no_name_34.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Eigenfunction
      and Eigenvalue> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Fourier
      Transform and Heaviside Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Identity
      Validation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>