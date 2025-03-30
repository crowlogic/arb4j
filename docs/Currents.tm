<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <section*|Definition>

  A <with|font-series|bold|current> <math|T> of degree <math|k> on a manifold
  <math|M> is a continuous linear functional on the space of compactly
  supported smooth differential forms of complementary degree <math|n-k>
  (where <math|n> is the dimension of the manifold). This is expressed as:

  <\equation>
    T<around|(|\<omega\>|)>
  </equation>

  for a compactly supported smooth <math|<around|(|n-k|)>>-form
  <math|\<omega\>> on <math|M>.

  <section*|Properties and Operations>

  <\enumerate>
    <item><with|font-series|bold|Boundary of a Current:> If <math|T> is a
    <math|k>-current, its boundary <math|\<partial\>*T> is a
    <math|<around|(|k-1|)>>-current defined by:

    <\equation>
      \<partial\>*T<around|(|\<omega\>|)>=T*<around|(|d*\<omega\>|)>
    </equation>

    where <math|d*\<omega\>> is the exterior derivative of <math|\<omega\>>.

    <item><with|font-series|bold|Pushforward and Pullback:> Given a smooth
    map <math|f:M\<to\>N>, the pushforward of a current can be defined from
    <math|M> to <math|N>. The pullback, however, is generally not
    well-defined for currents.

    <item><with|font-series|bold|Integration of Currents:> A
    <math|n>-dimensional current <math|T> on <math|M> can be integrated over
    <math|M>, represented by:

    <\equation>
      <big|int><rsub|M>T
    </equation>
  </enumerate>

  <section*|Examples of Currents>

  <\enumerate>
    <item><with|font-series|bold|Dirac Delta Current:> For a point <math|p>
    in <math|M>, the Dirac delta current <math|\<delta\><rsub|p>> of degree
    <math|n> acts on a <math|n>-form <math|\<omega\>> by:

    <\equation>
      \<delta\><rsub|p><around|(|\<omega\>|)>=\<omega\><around|(|p|)>
    </equation>

    <item><with|font-series|bold|Integration Along a Submanifold:> Let
    <math|S> be a <math|k>-dimensional oriented smooth submanifold of
    <math|M>. The current <math|<around|[|S|]>> associated with <math|S> acts
    on a <math|<around|(|n-k|)>>-form <math|\<omega\>> as:

    <\equation>
      <around|[|S|]><around|(|\<omega\>|)>=<big|int><rsub|S>\<omega\>
    </equation>
  </enumerate>

  <section*|Application in Equidistribution>

  Currents can be used to study the asymptotic distribution of zeros of
  holomorphic sections in Hermitian vector bundles, particularly how these
  zeros distribute themselves across the manifold, often converging to a
  certain limiting current.
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-2|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-4|<tuple|5|1|../../.TeXmacs/texts/scratch/no_name_39.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Definition>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Properties
      and Operations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Examples
      of Currents> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Application
      in Equidistribution> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>