<TeXmacs|2.1.4>

<style|<tuple|article|std-latex>>

<\body>
  <doc-data|<doc-title|Normalization and Fourier Analysis of Non-Stationary
  Processes>|<doc-author|<author-data|<author-name|Technical
  Report>>>|<doc-date|<date|>>>

  <section|Zero-Crossing Rate Normalization>

  Consider a process with zero crossing rates that increase as
  <math|<around|\||t|\|>\<to\>\<infty\>>. Through normalization:

  <\itemize>
    <item>Original process has increasing crossing rates

    <item>Normalize to maintain unit rate across whole domain

    <item>This enables Fourier transform analysis
  </itemize>

  <section|Process Transformation>

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

  <section|Wigner-Ville Connection>

  The Wigner-Ville distribution:

  <\equation>
    W<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>x*<around|(|t+\<tau\>/2|)>*x<rsup|\<ast\>>*<around|(|t-\<tau\>/2|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
  </equation>

  captures:

  <\itemize>
    <item>Process that's "almost" stationary

    <item>Triangular/bilinear structure

    <item>Non-stationarity enters in controlled way

    <item>Maintains certain symmetries despite non-stationarity
  </itemize>

  <section|Basis for the Modified Riemann-Siegel Theta Function>

  The focus is on establishing a basis for the modified Riemann-Siegel theta
  function <math|\<theta\><rsup|\<ast\>><around|(|t|)>>, ensuring it retains
  the desired properties of positive definiteness and monotonicity.

  <subsection|Key Points>

  1. **Basis for the Theta Function**: We can construct an orthonormal basis
  for the modified theta function <math|\<theta\><rsup|\<ast\>><around|(|t|)>>,
  ensuring that it maintains the desired properties.

  2. **Positive Definiteness**: The modification of
  <math|\<theta\><around|(|t|)>> to <math|\<theta\><rsup|\<ast\>><around|(|t|)>>
  through reflection will help maintain positive definiteness, enabling us to
  derive a suitable kernel.

  3. **Kernel Derivation**: Once we have the appropriate orthonormal basis,
  we can express the modified theta function in terms of this basis, allowing
  for the study of its properties and behavior.

  <subsection|Next Steps>

  - Establish the orthonormal basis for <math|\<theta\><rsup|\<ast\>><around|(|t|)>>.
  - Ensure that the constructed kernel based on
  <math|\<theta\><rsup|\<ast\>><around|(|t|)>> is positive definite and
  monotonic.

  This approach will facilitate the exploration of the properties of the
  modified Riemann-Siegel theta function and its applications.

  <section|Basis for the Modified Riemann-Siegel Vartheta Function>

  This section focuses on establishing a basis for the modified
  Riemann-Siegel theta function <math|\<theta\><around|(|t|)>>, ensuring it
  retains the desired properties of positive definiteness and monotonicity.

  <subsection|Key Points>

  1. **Basis for the Varheta Function**: An orthonormal basis for the
  modified theta function <math|\<vartheta\><around|(|t|)>> can be
  constructed.

  2. **Positive Definiteness**: The modification of
  <math|\<vartheta\><around|(|t|)>> through reflection maintains positive
  definiteness.

  3. **Kernel Derivation**: The modified <math|\<vartheta\>> function can be
  expressed in terms of this basis.

  <subsection|Kac-Rice Formula>

  The Kac-Rice formula provides the exact value of the mean zero counting
  function of the Riemann zeta function:

  <\equation>
    \<bbb-E\><around|[|N<around|(|T|)>|]>=<frac|\<vartheta\><around*|(|t|)>|>
  </equation>

  Apply the Kac-Rice formula to the kernel:

  <\equation>
    K<around|(|t,s|)>=e<rsup|-<frac|1|2>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)><rsup|2>>
  </equation>

  <subsection|Next Steps>

  - Establish the orthonormal basis for <math|\<theta\><around|(|t|)>>. -
  Ensure that the constructed kernel based on <math|\<theta\><around|(|t|)>>
  is positive definite and monotonic.
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-10|<tuple|5.3|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|3|?>>
    <associate|auto-4|<tuple|4|?>>
    <associate|auto-5|<tuple|4.1|?>>
    <associate|auto-6|<tuple|4.2|?>>
    <associate|auto-7|<tuple|5|?>>
    <associate|auto-8|<tuple|5.1|?>>
    <associate|auto-9|<tuple|5.2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Basis
      for the Modified Riemann-Siegel Theta Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Key Points
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Next Steps
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Basis
      for the Modified Riemann-Siegel Theta Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Key Points
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Kac-Rice Formula
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Next Steps
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>
    </associate>
  </collection>
</auxiliary>