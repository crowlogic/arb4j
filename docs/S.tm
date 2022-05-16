<TeXmacs|2.1.1>

<style|<tuple|generic|dark-vador>>

<\body>
  What be said about the operator <math|S<rsub|f><around*|(|t|)>>?

  <\equation>
    U<rsub|f><around*|(|t|)>=tanh<around*|(|ln<around*|(|1-f<around*|(|t|)><rsup|2>|)>|)>=<frac|<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>-1|<around*|(|1<rsup|>-f<around*|(|t|)><rsup|2>|)><rsup|2>+1>
  </equation>

  Show that the following is true:

  <subsubsection| The Newton Map <math|N<rsub|U<rsub|f>><around*|(|t|)>>
  Transforms Supperattractive Fixed-Points of <math|f<around*|(|t|)>> to
  Geometrically Attractive Fixed-Points of <math|U<rsub|f><around*|(|t|)>>>

  One crucial effect of the Newton map <math|N<rsub|U<rsub|f>><around*|(|t|)>>\ 

  <\equation>
    N<rsub|U<rsub|f>><around*|(|t|)>=t-<frac|U<rsub|f><around*|(|t|)>|<wide|U|\<dot\>><rsub|f><around*|(|t|)>>
  </equation>

  of <math|U<rsub|f><around*|(|t|)>> where <math|N<rsub|f>> is the Newton map

  <\equation>
    N<rsub|f><around*|(|t|)>=t-<frac|f<around*|(|t|)>|<wide|f|\<dot\>><around*|(|t|)>>
  </equation>

  \ is that it transforms superattractive fixed-points <math|\<lambda\>=0> of
  <math|N<rsub|f><around*|(|t|)>> to geometrically attracting fixed-points
  <math|\<lambda\>=<frac|1|2>> of <math|N<rsub|U<rsub|f><rsub|>>>

  <subsubsection|The Derivative <math|<wide|U|\<dot\>><around*|(|t|)>> and
  Functional Derivative <math|<wide|U<rsub|f>|\<dot\>><around*|(|t|)>>>

  The derivative of <math|U<around*|(|f<around*|(|t|)>|)>> with regards to
  <math|t> is given by

  <\equation>
    <wide|U|\<dot\>><around*|(|f<around*|(|t|)>|)>=<frac|8f<around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)>|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|f<around*|(|t|)>+1|)><rsup|2>+1|)><rsup|2>>
  </equation>

  whereas the <verbatim|functional derivative><index|functional derivative>
  <math|<wide|T|\<dot\>><rsub|f><around*|(|t|)>> is given by

  <math|<\text>
    <\equation>
      <wide|U|\<dot\>><rsub|f><around*|(|t|)>=<wide|U|\<dot\>><around*|(|f<around*|(|t|)>|)><wide|f|\<dot\>><around*|(|t|)>=<frac|8<wide|f|\<dot\>><around*|(|t|)>f<around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)>|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|f<around*|(|t|)>+1|)><rsup|2>+1|)><rsup|2>>
    </equation>
  </text>>

  which is just the usual derivative of U<math|> multiplied by the derivate
  of <math|f> which can be found with an application of the usual chain rule
  of calculus and simplifying the algebra by combining like terms, factoring
  and rearranging.

  <subsubsection|The Newton Map of <math|U<rsub|f><around*|(|t|)>>>

  The Newton map <math|N<rsub|U<rsub|f>><around*|(|t|)>> is a rational
  meromorphic function of <math|f<around*|(|t|)>> given by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|N<rsub|U<rsub|f>><around*|(|t|)>>|<cell|=t-<frac|U<rsub|f><around*|(|t|)>|<wide|U|\<dot\>><rsub|f><around*|(|t|)>>>>|<row|<cell|>|<cell|=t-<frac|<frac|<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>-1|<around*|(|1<rsup|>-f<around*|(|t|)><rsup|2>|)><rsup|2>+1>|<frac|8<wide|f|\<dot\>><around*|(|t|)>f<around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)>|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|f<around*|(|t|)>+1|)><rsup|2>+1|)><rsup|2>>>>>|<row|<cell|>|<cell|=t-<frac|1|8><frac|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|1+f<around*|(|*t|)><rsup|2>|)><rsup|2>+1|)><rsup|2>*<around*|(|<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>-1|)>|f*<around*|(|t|)><wide|f|\<dot\>><around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)><around*|(|1+<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>|)>>>>>>>
  </equation>

  TODO: account for the double-root at the origin introduced by the <math|U>
  map

  <subsubsection|The Newton Flow>

  The Newton flow of <math|U<rsup|><rsub|f><around*|(|t|)>> is the relaxed
  Newton map defined by\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|N<rsup|h><rsub|U<rsub|f>><around*|(|t|)>>|<cell|=t-h<frac|U<rsub|f><around*|(|t|)>|<wide|U|\<dot\>><rsub|f><around*|(|t|)>>>>|<row|<cell|>|<cell|=t-<frac|h<frac|<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>-1|<around*|(|1<rsup|>-f<around*|(|t|)><rsup|2>|)><rsup|2>+1>|<frac|8<wide|f|\<dot\>><around*|(|t|)>f<around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)>|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|f<around*|(|t|)>+1|)><rsup|2>+1|)><rsup|2>>>>>|<row|<cell|>|<cell|=t-<frac|h|8><frac|<around*|(|<around*|(|f<around*|(|t|)>-1|)><rsup|2>*<around*|(|1+f<around*|(|*t|)><rsup|2>|)><rsup|2>+1|)><rsup|2>*<around*|(|<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>-1|)>|f*<around*|(|t|)><wide|f|\<dot\>><around*|(|t|)><around*|(|f<around*|(|t|)><rsup|2>-1|)><around*|(|1+<around*|(|1-f<around*|(|t|)><rsup|2>|)><rsup|2>|)>>>>>>>
  </equation>

  where <math|h> is taken to be infinitesimal.

  <subsubsection|The Continuous, Desingularized Newton Flow
  <math|N<rsub|U<rsub|f>><around*|(|t|)>>>

  \;

  \;
</body>

<\initial>
  <\collection>
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
    <associate|auto-3|<tuple|functional derivative|1>>
    <associate|auto-4|<tuple|3|1>>
    <associate|auto-5|<tuple|4|2>>
    <associate|auto-6|<tuple|5|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|idx>
      <tuple|<tuple|functional derivative>|<pageref|auto-3>>
    </associate>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc> The Newton Map
      <with|mode|<quote|math>|N<rsub|U<rsub|f>><around*|(|t|)>> Transforms
      Supperattractive Fixed-Points of <with|mode|<quote|math>|f<around*|(|t|)>>
      to Geometrically Attractive Fixed-Points of
      <with|mode|<quote|math>|U<rsub|f><around*|(|t|)>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|2tab>|2<space|2spc>The Derivative
      <with|mode|<quote|math>|<wide|U|\<dot\>><around*|(|t|)>> and Functional
      Derivative <with|mode|<quote|math>|<wide|U<rsub|f>|\<dot\>><around*|(|t|)>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|3<space|2spc>The Newton Map of
      <with|mode|<quote|math>|U<rsub|f><around*|(|t|)>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|4<space|2spc>The Newton Flow
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|5<space|2spc>The Continuous, Desingularized
      Newton Flow <with|mode|<quote|math>|N<rsub|U<rsub|f>><around*|(|t|)>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>
    </associate>
  </collection>
</auxiliary>