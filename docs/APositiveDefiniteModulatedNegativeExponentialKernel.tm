<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|A Positive Definite Modulated Negative Exponential
  Kernel>|<doc-author|<author-data|<author-name|Stephen Andrew
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Basis
    for the Modified Riemann-Siegel Theta Function>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Key Properties
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Counting Function and Expectation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.3<space|2spc>Implementation Steps
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.4<space|2spc>Future Directions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>
  </table-of-contents>

  <section|Basis for the Modified Riemann-Siegel Theta Function>

  The focus is on establishing a basis for the modified Riemann-Siegel theta
  function <math|\<theta\><rsup|\<ast\>><around|(|t|)>>, ensuring it retains
  the desired properties of positive definiteness and monotonicity.

  <subsection|Key Properties>

  <\enumerate>
    <item><with|font-series|bold|Basis Construction>: We establish an
    orthonormal basis for the modified theta function
    <math|\<theta\><rsup|\<ast\>><around|(|t|)>>, ensuring that it maintains
    the desired properties.

    <item><with|font-series|bold|Positive Definiteness>: The modification of
    <math|\<theta\><around|(|t|)>> to <math|\<theta\><rsup|\<ast\>><around|(|t|)>>
    through reflection maintains positive definiteness, enabling us to derive
    a suitable kernel.

    <item><with|font-series|bold|Kernel Properties>: The modified theta
    function can be expressed in terms of this basis, allowing for the study
    of its properties and behavior.
  </enumerate>

  <subsection|Counting Function and Expectation>

  The expectation of the counting function is given by:

  <\equation>
    \<bbb-E\><around|[|N<around|(|T|)>|]>=<frac|\<theta\><around|(|T|)>|\<pi\>>+1
  </equation>

  The full counting function includes the argument term:

  <\equation>
    N<around|(|T|)>=<frac|\<theta\><around|(|T|)>|\<pi\>>+<frac|S<around|(|T|)>|\<pi\>>+1
  </equation>

  where <math|S<around|(|T|)>=arg \<zeta\>*<around*|(|<frac|1|2>+i*T|)>> can
  be expressed as:

  <\equation>
    S<around|(|T|)>=<frac|ln \<zeta\>*<around*|(|<frac|1|2>+i*T|)>-ln
    <wide|\<zeta\>*<around*|(|<frac|1|2>+i*T|)>|\<bar\>>|2*i>*
  </equation>

  For the associated kernel function:

  <\equation>
    K<around|(|t,s|)>=e<rsup|-<frac|<around|(|\<theta\><rsup|\<ast\>><around|(|t|)>-\<theta\><rsup|\<ast\>><around|(|s|)>|)><rsup|2>|2>*>
  </equation>

  <subsection|Implementation Steps>

  <\enumerate>
    <item>Establish the complete orthonormal basis for
    <math|\<theta\><rsup|\<ast\>><around|(|t|)>>

    <item>Verify positive definiteness of the constructed kernel

    <item>Prove monotonicity properties

    <item>Develop numerical methods for computation
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-3|<tuple|1.2|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-4|<tuple|1.3|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-5|<tuple|1.4|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Basis
      for the Modified Riemann-Siegel Theta Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Key Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Counting Function and
      Expectation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Implementation Steps
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Future Directions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>
    </associate>
  </collection>
</auxiliary>