<TeXmacs|2.1.4>

<style|generic>

<\body>
  \<cdot\><doc-data|<doc-title|Derivation of the Appearance of
  <math|J<rsub|0>> in the Random Plane Wave
  Model>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  This document outlines the derivation of the Bessel function
  <math|J<rsub|0>> appearing in the expectation of the product of cosine
  functions in the random plane wave model, where wave vectors are uniformly
  distributed in all directions with uniformly distributed random phases.

  <section|Mathematical Setup>

  Consider a random plane wave model with waves represented as <math|cos
  <around|(|<math-bf|k>\<cdot\><math-bf|x>+\<theta\>|)>>, where
  <math|<math-bf|k>> is the wave vector, <math|<math-bf|x>> is the position
  vector, and <math|\<theta\>> is a random phase uniformly distributed
  between <math|0> and <math|2*\<pi\>>.

  <section|Derivation>

  <subsection|Cosine Expansion>

  Using the cosine product expansion, we have:

  <\equation>
    cos <around|(|a|)>*cos <around|(|b|)>=<frac|1|2>*<around|[|cos
    <around|(|a-b|)>+cos <around|(|a+b|)>|]>
  </equation>

  Applying this to our wave model:

  <\align*>
    <tformat|<table|<row|<cell|cos <around|(|<math-bf|k>\<cdot\><math-bf|x>+\<theta\>|)>*cos
    <around|(|<math-bf|k>\<cdot\><math-bf|y>+\<theta\>|)>>|<cell|=<frac|1|2>*<around|[|cos
    <around|(|<math-bf|k>\<cdot\><around|(|<math-bf|x>-<math-bf|y>|)>|)>+cos
    <around|(|<math-bf|k>\<cdot\><around|(|<math-bf|x>+<math-bf|y>|)>+2*\<theta\>|)>|]>>>>>
  </align*>

  <subsection|Expectation Over <math|\<theta\>>>

  Averaging over <math|\<theta\>> and utilizing the uniform distribution of
  <math|\<theta\>>, the second term involving <math|cos> averaged over
  <math|2*\<theta\>> cancels out due to symmetry:

  <\equation>
    \<bbb-E\><rsub|\<theta\>>*<around|[|cos
    <around|(|<math-bf|k>\<cdot\><math-bf|x>+\<theta\>|)>*cos
    <around|(|<math-bf|k>\<cdot\><math-bf|y>+\<theta\>|)>|]>=<frac|1|2>*cos
    <around|(|<math-bf|k>\<cdot\><around|(|<math-bf|x>-<math-bf|y>|)>|)>
  </equation>

  <subsection|Averaging Over Directions>

  The integration over all directions of <math|<math-bf|k>> isotropically
  leads to:

  <\equation>
    <big|int><rsub|sphere>cos <around|(|<math-bf|k>\<cdot\><math-bf|r>|)>*<space|0.17em>d*\<Omega\>=2*\<pi\>*J<rsub|0><around|(|k<around|\<\|\|\>|<math-bf|r>|\<\|\|\>>|)>
  </equation>

  where <math|<math-bf|r>=<math-bf|x>-<math-bf|y>> and <math|d*\<Omega\>> is
  the differential solid angle element. Normalizing by the total solid angle
  <math|4*\<pi\>>:

  <\equation>
    <frac|1|4*\<pi\>>\<cdot\>2*\<pi\>*J<rsub|0><around|(|k<around|\<\|\|\>|<math-bf|r>|\<\|\|\>>|)>=<frac|1|2>*J<rsub|0><around|(|k<around|\<\|\|\>|<math-bf|r>|\<\|\|\>>|)>
  </equation>

  <subsection|Conclusion>

  The expectation value of the product of the cosines, after integrating over
  all directions and averaging out the random phases, results in:

  <\equation>
    \<bbb-E\>*<around|[|cos <around|(|<math-bf|k>\<cdot\><math-bf|x>+\<theta\>|)>*cos
    <around|(|<math-bf|k>\<cdot\><math-bf|y>+\<theta\>|)>|]>=J<rsub|0><around|(|<around|\<\|\|\>|<math-bf|x>-<math-bf|y>|\<\|\|\>>|)>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-4|<tuple|3.1|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-5|<tuple|3.2|1|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-6|<tuple|3.3|2|../../.TeXmacs/texts/scratch/no_name_55.tm>>
    <associate|auto-7|<tuple|3.4|2|../../.TeXmacs/texts/scratch/no_name_55.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Mathematical
      Setup> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Derivation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Cosine Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Expectation Over
      <with|mode|<quote|math>|\<theta\>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Averaging Over Directions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>
    </associate>
  </collection>
</auxiliary>