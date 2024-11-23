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

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Normalization
    and Fourier Analysis of Non-Stationary Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Zero-Crossing Rate Normalization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|2.2<space|2spc>Process Transformation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|2.3<space|2spc>Wigner-Ville Connection
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>
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

  <section|Normalization and Fourier Analysis of Non-Stationary Processes>

  <subsection|Zero-Crossing Rate Normalization>

  Consider a process with zero crossing rates that increase as
  <math|<around|\||t|\|>\<to\>\<infty\>>. Through normalization:

  <\itemize>
    <item>Original process has increasing crossing rates

    <item>Normalize to maintain unit rate across whole domain

    <item>This enables Fourier transform analysis
  </itemize>

  <subsection|Process Transformation>

  For a process with increasing zero crossing rates as
  <math|<around|\||t|\|>\<to\>\<infty\>>:

  The normalization procedure:

  <\enumerate>
    <item>Apply normalization for unit zero crossing rate

    <item>Results in stationary process (constant crossing rate)

    <item>Enables Fourier transform analysis
  </enumerate>

  Key insights:

  <\itemize>
    <item>Original: non-stationary (increasing crossings)

    <item>Post-normalization: stationary (unit crossing rate)

    <item>Makes Fourier transform well-defined

    <item>Spectral process exists for normalized version
  </itemize>

  The Fourier transform of the normalized process:

  <\equation>
    <wide|Y|~><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>Y<rsub|n*o*r*m*a*l*i*z*e*d><around|(|t|)>*e<rsup|-i*\<omega\>*t>*d*t
  </equation>

  exists because normalization creates a well-behaved stationary process with
  constant crossing rate properties.

  <subsection|Wigner-Ville Connection>

  The Wigner-Ville distribution:

  <\equation>
    W<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>x*<around*|(|t+<frac|\<tau\>|2>|)>*x<rsup|\<ast\>>*<around*|(|t-<frac|\<tau\>|2>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
  </equation>

  captures:

  <\itemize>
    <item>Process that's "almost" stationary

    <item>Triangular/bilinear structure

    <item>Non-stationarity enters in controlled way

    <item>Maintains certain symmetries despite non-stationarity
  </itemize>

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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.3|2>>
    <associate|auto-5|<tuple|2|2>>
    <associate|auto-6|<tuple|2.1|2>>
    <associate|auto-7|<tuple|2.2|2>>
    <associate|auto-8|<tuple|2.3|3>>
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Normalization
      and Fourier Analysis of Non-Stationary Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Zero-Crossing Rate
      Normalization <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Process Transformation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Wigner-Ville Connection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>
    </associate>
  </collection>
</auxiliary>