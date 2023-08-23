<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Convolutions of Positive
  Measures>|<doc-author|<author-data|<author-name|Stephen A.
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <subsubsection|Definition of Convolution><label|definition-of-convolution><label|definition-of-convolution>

  <\definition>
    Let <math|\<mu\>> and <math|v> be positive measures. In the context of
    harmonic analysis on <hlink|locally compact|LocallyCompact>
    <hlink|commutative groups|CommutativeGroup> <math|G>, the
    <strong|convolution> <math|\<mu\>\<ast\>v> exists and is also a positive
    measure on <math|G> if for any <hlink|test function|TestFunction>
    <math|f\<in\>C<rsub|c><rsup|+><around|(|G|)>> where
    <math|C<rsub|c><rsup|+><around|(|G|)>> is the space of continuous
    functions with compact support and non-negative values on G; the
    convolution <math|\<mu\>\<ast\>v> given by the mapping

    <\equation>
      f\<mapsto\><big|int><rsub|G\<times\>G>f*<around|(|x+y|)>*d*<around|(|\<mu\>\<otimes\>v|)><around|(|x,y|)>\<less\>\<infty\>
    </equation>

    is finite where <math|\<mu\>\<otimes\>v> is the <hlink|product
    measure|ProductMeasure> on <math|G\<times\>G>.
  </definition>

  <subsubsection|Additional Properties><label|additional-properties><label|additional-properties>

  <\itemize>
    <item><with|font-series|bold|Associativity>: The convolution operation is
    associative among positive measures.

    <item><with|font-series|bold|Commutativity>:
    <math|\<mu\>\<ast\>v=v\<ast\>\<mu\>>

    <item><with|font-series|bold|Set <math|D<rsup|+><around|(|\<mu\>|)>>>:
    This is the set of all positive measures <math|v> for which
    <math|\<mu\>\<ast\>v> exists.
  </itemize>
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
    <associate|additional-properties|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-2|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|definition-of-convolution|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_8.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>Definition of Convolution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|2tab>|2<space|2spc>Additional Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>
    </associate>
  </collection>
</auxiliary>