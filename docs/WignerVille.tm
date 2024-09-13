<TeXmacs|2.1.4>

<style|generic>

<\body>
  <section|Wigner-Ville Representation and Process Analysis>

  <subsection|Wigner-Ville Representation>

  For a signal <math|x<around|(|t|)>>, the Wigner-Ville representation is
  defined as:

  <\equation>
    W<rsub|x><around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>x*<around|(|t+\<tau\>/2|)>*x<rsup|\<ast\>>*<around|(|t-\<tau\>/2|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
  </equation>

  Properties:

  <\enumerate>
    <item>Realness: <math|W<rsub|x><around|(|t,\<omega\>|)>\<in\>\<bbb-R\>>

    <item>Time-frequency shifts: <math|W<rsub|x*<around|(|t-t<rsub|0>|)>*e<rsup|i*\<omega\><rsub|0>*t>><around|(|t,\<omega\>|)>=W<rsub|x><around|(|t-t<rsub|0>,\<omega\>-\<omega\><rsub|0>|)>>

    <item>Marginals: <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|x><around|(|t,\<omega\>|)>*d*\<omega\>=<around|\||x<around|(|t|)>|\|><rsup|2>>
    <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|x><around|(|t,\<omega\>|)>*d*t=<around|\||<wide|x|^><around|(|\<omega\>|)>|\|><rsup|2>>
  </enumerate>

  <subsection|Process Definition>

  Given <math|W<around|(|t,\<omega\>|)>>, we define a process
  <math|X<around|(|t|)>> as:

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is a complex-valued random measure
  with:

  <\equation>
    E*<around|[|d*Z<around|(|\<omega\>|)>*d*Z<rsup|\<ast\>><around|(|\<omega\><rprime|'>|)>|]>=W<around|(|<frac|t+t<rprime|'>|2>,\<omega\>|)>*\<delta\>*<around|(|\<omega\>-\<omega\><rprime|'>|)>*d*\<omega\>
  </equation>

  <subsection|Moment Analysis>

  First moment (mean):

  <\equation>
    E<around|[|X<around|(|t|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*E*<around|[|d*Z<around|(|\<omega\>|)>|]>=0
  </equation>

  Second moment (covariance):

  <\equation>
    K<around|(|t,s|)>=E*<around|[|X<around|(|t|)>*X<rsup|\<ast\>><around|(|s|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t-s|)>>*W<around|(|<frac|t+s|2>,\<omega\>|)>*d*\<omega\>
  </equation>

  <subsection|Spectral Analysis>

  The spectral density function <math|S<around|(|t,\<omega\>|)>> is given by:

  <\equation>
    S<around|(|t,\<omega\>|)>=W<around|(|t,\<omega\>|)>
  </equation>

  Instantaneous power:

  <\equation>
    P<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<around|(|t,\<omega\>|)>*d*\<omega\>
  </equation>

  <subsection|Time-Frequency Analysis>

  Time-frequency correlation:

  <\equation>
    R<around|(|t,\<tau\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*\<tau\>>*d*\<omega\>
  </equation>

  <subsection|Stationarity Condition>

  The process is stationary if and only if <math|W<around|(|t,\<omega\>|)>>
  is independent of <math|t>:

  <\equation>
    W<around|(|t,\<omega\>|)>=S<around|(|\<omega\>|)>
  </equation>

  where <math|S<around|(|\<omega\>|)>> is the spectral density of the
  stationary process.
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
    <associate|auto-5|<tuple|1.4|1>>
    <associate|auto-6|<tuple|1.5|2>>
    <associate|auto-7|<tuple|1.6|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Wigner-Ville
      Representation and Process Analysis>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Wigner-Ville Representation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Process Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Moment Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Spectral Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.5<space|2spc>Time-Frequency Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.6<space|2spc>Stationarity Condition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>
    </associate>
  </collection>
</auxiliary>