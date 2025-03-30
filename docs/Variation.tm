<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Vitali and Fréchet Variations>>

  <section|Vitali Variation>

  <subsection|Definition>

  Vitali variation is a fundamental concept in mathematical analysis,
  particularly in the study of functions of several variables. For a function
  <math|f:I\<to\>\<bbb-R\>>, where <math|I> is a rectangle in
  <math|\<bbb-R\><rsup|n>>, the Vitali variation <math|V<around|(|f,I|)>> is
  given by:

  <\equation>
    V<around|(|f,I|)>=sup<rsub|P> <big|sum><rsub|J\<in\>P><around|\||f<around|(|a<rsub|J>|)>-f<around|(|b<rsub|J>|)>|\|>
  </equation>

  where <math|P> ranges over all partitions of <math|I> into subrectangles
  <math|J>, and <math|a<rsub|J>> and <math|b<rsub|J>> are opposite vertices
  of <math|J>.

  Functions with finite Vitali variation possess several important
  properties:

  <\enumerate>
    <item>They are bounded and continuous almost everywhere.

    <item>They can be expressed as the difference of two functions with
    nonnegative sums.

    <item>They have well-defined Riemann-Stieltjes integrals.
  </enumerate>

  <section|Fréchet Variation>

  <subsection|Definition>

  A bimeasure <math|F> on a product space
  <math|\<Omega\><rsub|1>\<times\>\<Omega\><rsub|2>> has finite Fréchet
  variation if:

  <\equation>
    V<rsub|F><around|(|\<Omega\><rsub|1>,\<Omega\><rsub|2>|)>=sup<rsub|\<Pi\><rsub|1>,\<Pi\><rsub|2>>
    <big|sum><rsub|A\<in\>\<Pi\><rsub|1>><big|sum><rsub|B\<in\>\<Pi\><rsub|2>><around|\||F<around|(|A,B|)>|\|>
  </equation>

  where <math|\<Pi\><rsub|1>> and <math|\<Pi\><rsub|2>> are finite partitions
  of <math|\<Omega\><rsub|1>> and <math|\<Omega\><rsub|2>> respectively.

  <section|Mathematical Implications>

  <subsection|Strongly Harmonizable Processes>

  For strongly harmonizable processes, the correlation function is:

  <\equation>
    R<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*<around|(|s-t|)>*\<lambda\>>*d*F<around|(|\<lambda\>|)>
  </equation>

  where <math|F> is a complex-valued measure with finite Vitali variation.

  <subsection|Weakly Harmonizable Processes>

  For weakly harmonizable processes, the correlation function is:

  <\equation>
    R<around|(|s,t|)>=<big|int><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|s*\<lambda\><rsub|1>-t*\<lambda\><rsub|2>|)>>*d*F<around|(|\<lambda\><rsub|1>,\<lambda\><rsub|2>|)>
  </equation>

  where <math|F> is a bimeasure with finite Fréchet variation.

  <subsection|Key Implications>

  <\enumerate>
    <item>Spectral measures: Strongly harmonizable processes have countably
    additive spectral measures.

    <item>Stochastic integration: More developed theory for strongly
    harmonizable processes.

    <item>Boundedness properties: Strongly harmonizable processes are bounded
    in probability.

    <item>Representation theory: Weakly harmonizable processes can be
    represented by positive definite contractive linear operators in a
    Hilbert space.

    <item>Continuity and differentiability: Strongly harmonizable processes
    have stronger continuity properties.
  </enumerate>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-3|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-4|<tuple|2.1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-5|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-6|<tuple|3.1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-7|<tuple|3.2|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-8|<tuple|3.3|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Vitali
      Variation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Fréchet
      Variation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Mathematical
      Implications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Strongly Harmonizable
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Weakly Harmonizable
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Key Implications
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>
    </associate>
  </collection>
</auxiliary>