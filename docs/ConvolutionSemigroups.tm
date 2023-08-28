<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <section|The Convolution Semigroup and Integral
  Transforms><label|the-convolution-semigroup-and-integral-transforms><label|the-convolution-semigroup-and-integral-transforms>

  In the context of integral transforms, a convolution semigroup is a family
  of measures <math|<around|{|\<mu\><rsub|t>|}><rsub|t\<geq\>0>> on a locally
  compact abelian group <math|G> (often <math|\<bbb-R\><rsup|n>> or
  <math|\<bbb-C\>>) such that the following properties hold:

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|Identity Element>:
    <math|\<mu\><rsub|0>=\<delta\><rsub|0>>, the Dirac delta measure at the
    identity element <math|0> of <math|G>.

    <item><with|font-series|bold|Convolution Property>:
  </enumerate>

  <\equation>
    \<mu\><rsub|s+t>=\<mu\><rsub|s>\<ast\>\<mu\><rsub|t><space|1em>\<forall\>s,t\<geq\>0
  </equation>

  where <math|\<ast\>> denotes the convolution of measures.

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|2>

    <item><with|font-series|bold|Continuity>: The mapping
    <math|t\<mapsto\>\<mu\><rsub|t><around|(|f|)>> is continuous for every
    continuous function <math|f> with compact support on <math|G>.
  </enumerate>

  When the measures <math|\<mu\><rsub|t>> are absolutely continuous with
  respect to the <hlink|Lebesgue measure|LebesgueMeasure>, they can be
  represented by their densities <math|p<rsub|t><around|(|x|)>>. In this
  case, the convolution property can be expressed as:

  <\equation>
    p<rsub|s+t><around|(|y|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|s><around|(|x|)>*p<rsub|t>*<around|(|y-x|)>*d*x
  </equation>

  This is a continuous-time analogue of the <hlink|Chapman-Kolmogorov
  equation|ChapmanKolmogorovEquation> in the theory of Markov processes and
  provides a way to understand the evolution of the density
  <math|p<rsub|t><around|(|x|)>> over time.

  In the context of integral transforms like the Fourier or Laplace
  transform, convolution semigroups are particularly useful because they
  often lead to simple expressions when transformed. For example, if
  <math|\<mu\><rsub|t>> is a convolution semigroup and
  <math|<wide|\<mu\><rsub|t>|^>> is its Fourier transform, then the Fourier
  transform of <math|\<mu\><rsub|s+t>> can be easily expressed in terms of
  <math|<wide|\<mu\><rsub|s>|^>> and <math|<wide|\<mu\><rsub|t>|^>> due to
  the convolution property.

  The Fourier transform of a measure <math|\<mu\>> is defined as:

  <\equation>
    <wide|\<mu\>|^><around|(|\<xi\>|)>=<big|int><rsub|G>e<rsup|-i<around|\<langle\>|x,\<xi\>|\<rangle\>>>*d*\<mu\><around|(|x|)>
  </equation>

  where <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>> is the
  inner product on <math|G>.

  The convolution property then implies that:

  <\equation>
    <wide|\<mu\><rsub|s+t>|^><around|(|\<xi\>|)>=<wide|\<mu\><rsub|s>|^><around|(|\<xi\>|)><wide|\<mu\><rsub|t>|^><around|(|\<xi\>|)>
  </equation>

  which is a simple multiplicative relationship.

  Convolution semigroups are a key concept in the theory of stochastic
  processes, harmonic analysis, and functional analysis, among other areas.
  They provide a way to understand the evolution of distributions under the
  action of a linear operator, often a differential operator.

  <subsection|Convolution Semigroups and Transience on Locally Compact
  Commutative Groups><label|convolution-semigroups-and-transience-on-locally-compact-commutative-groups><label|convolution-semigroups-and-transience-on-locally-compact-commutative-groups>

  In the setting of locally compact abelian (LCA) groups, a convolution
  semigroup is a family of Radon measures
  <math|<around|(|\<mu\><rsub|t>|)><rsub|t\<geq\>0>> on the LCA group
  <math|G> that satisfies the following properties:

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|Identity>: <math|\<mu\><rsub|0>> is the
    Dirac measure at the identity element <math|e> of <math|G>.
  </enumerate>

  <\equation>
    \<mu\><rsub|0><around|(|A|)>=<choice|<tformat|<table|<row|<cell|1,>|<cell|<text|if>e\<in\>A>>|<row|<cell|0,>|<cell|<text|otherwise>>>>>>
  </equation>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|1>

    <item><with|font-series|bold|Semigroup Property>: For all
    <math|t,s\<geq\>0>
  </enumerate>

  <\equation>
    \<mu\><rsub|t+s>=\<mu\><rsub|t>\<ast\>\<mu\><rsub|s>
  </equation>

  where <math|\<ast\>> denotes the convolution of measures.

  <\equation>
    <around|(|\<mu\><rsub|t>\<ast\>\<mu\><rsub|s>|)><around|(|A|)>=<big|int><rsub|G><big|int><rsub|G>\<chi\><rsub|A>*<around|(|x\<ast\>y|)>*d*\<mu\><rsub|t><around|(|x|)>*d*\<mu\><rsub|s><around|(|y|)>
  </equation>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|2>

    <item><with|font-series|bold|Continuity>: The mapping
    <math|t\<mapsto\>\<mu\><rsub|t><around|(|A|)>> is continuous for every
    Borel set <math|A> in <math|G>.
  </enumerate>

  <subsubsection|Transience><label|transience><label|transience>

  The term \Ptransience\Q is not directly related to the concept of a
  convolution semigroup. In the context of stochastic processes, particularly
  Markov chains, a state is said to be \Ptransient\Q if, starting from that
  state, the process is expected to return to it only a finite number of
  times. In contrast, a state is \Precurrent\Q if the process is expected to
  return to it an infinite number of times.

  Given this definition, a convolution semigroup
  <math|<around|(|\<mu\><rsub|t>|)><rsub|t\<geq\>0>> on an LCA group <math|G>
  is said to be \Ptransient\Q if:

  <\equation>
    <big|int><rsub|G><around*|(|<big|int><rsub|0><rsup|\<infty\>>\<mu\><rsub|t><around|(|x|)>*d*t|)>*d*x\<less\>\<infty\>
  </equation>

  The concept of transience or recurrence is more about the long-term
  behavior of a stochastic process, whereas a convolution semigroup is a
  mathematical construct that helps to describe the evolution of a
  distribution over time. Convolution semigroups can be used to model both
  transient and recurrent behavior, depending on the specifics of the
  semigroup and the associated generator (often a differential operator).
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
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1.1|2>>
    <associate|convolution-semigroups-and-transience-on-locally-compact-commutative-groups|<tuple|1.1|1>>
    <associate|the-convolution-semigroup-and-integral-transforms|<tuple|1|1>>
    <associate|transience|<tuple|1.1.1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Convolution Semigroup and Integral Transforms>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Convolution Semigroups and
      Transience on Locally Compact Commutative Groups
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>Transience
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>