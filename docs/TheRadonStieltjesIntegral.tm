<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Radon-Stieltjes Integral>>

  <section|The Radon-Stieltjes Integral>

  <subsection|Preliminaries>

  <\definition>
    <with|font-series|bold|Radon Measure>: A Radon measure <math|\<mu\>> on a
    locally compact Hausdorff space <math|X> is a measure that is:

    <\itemize>
      <item>Locally finite: <math|\<mu\><around|(|K|)>\<less\>\<infty\>> for
      every compact set <math|K\<subset\>X>.

      <item>Inner regular: For every Borel set <math|B\<subseteq\>X>,
      <math|\<mu\><around|(|B|)>=sup <around|{|\<mu\><around|(|K|)>:K\<subseteq\>B,K<text|is
      compact>|}>>.

      <item>Outer regular: For every Borel set <math|B\<subseteq\>X>,
      <math|\<mu\><around|(|B|)>=inf <around|{|\<mu\><around|(|U|)>:B\<subset\>U,U<text|is
      open>|}>>.
    </itemize>
  </definition>

  <\definition>
    <with|font-series|bold|Borel Measurable Functions>: A function
    <math|f:X\<rightarrow\>\<bbb-R\>> is Borel measurable if the pre-image of
    every Borel set in <math|\<bbb-R\>> is a Borel set in <math|X>.
  </definition>

  \;

  <\definition>
    <paragraph|Definition of the Radon-Stieltjes Integral>

    <\enumerate>
      <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

      <item><with|font-series|bold|Integral with Respect to a Radon Measure>:
      The Radon-Stieltjes integral of a Borel measurable function <math|f>
      with respect to a Radon measure <math|\<mu\>> over <math|X> is defined
      as:
    </enumerate>

    <\equation>
      <big|int><rsub|X>f<around*|(|x|)>\<mathd\>\<mu\><around*|(|x|)>
    </equation>

    provided that at least one of <math|<big|int><rsub|X>f<rsup|+>*d*\<mu\>>
    and <math|<big|int><rsub|X>f<rsup|->*d*\<mu\>> is finite, where
    <math|f<rsup|+>> and <math|f<rsup|->> are the positive and negative parts
    of <math|f>, respectively.
  </definition>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|1>

    <item><with|font-series|bold|Positive and Negative Parts of <math|f>>:
  </enumerate>

  <\equation*>
    f<rsup|+><around|(|x|)>=max <around|{|f<around|(|x|)>,0|}>
  </equation*>

  and

  <\equation*>
    <space|1em>f<rsup|-><around|(|x|)>=-min <around|{|f<around|(|x|)>,0|}>
  </equation*>

  So,

  <\equation>
    f=f<rsup|+>-f<rsup|->
  </equation>

  and

  <\equation>
    <around*|\||f|\|>=f<rsup|<rsub|+>>+f<rsup|->
  </equation>

  <paragraph|Detailed Construction><label|detailed-construction><label|detailed-construction>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|Simple Functions>: For simple functions
    (finite linear combinations of characteristic functions of Borel sets),
    the integral is a sum:
  </enumerate>

  <\Shaded>
    \ <Highlighting|| <NormalTok|\\int_X s \\, d\\mu = \\sum_{i=1}^n a_i
    \\mu(E_i)>>
  </Shaded>

  where

  <\Shaded>
    \ <Highlighting|| <NormalTok|s(x) = \\sum_{i=1}^n a_i \\chi_{E_i}(x)
    \\forall a_i \\in \\mathbb{R}>>
  </Shaded>

  and <math|E<rsub|i>> are disjoint Borel sets.

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|1>

    <item><with|font-series|bold|General Functions>: For general Borel
    measurable functions:

    <\itemize>
      <item>Approximate <math|f> by an increasing sequence of non-negative
      simple functions <math|s<rsub|n>> such that
      <math|s<rsub|n>*\<uparrow\>*f<rsup|+>>.

      <item>Define <math|<big|int><rsub|X>f<rsup|+>*d*\<mu\>=lim<rsub|n\<to\>\<infty\>>
      <big|int><rsub|X>s<rsub|n>*<space|0.17em>d*\<mu\>>.

      <item>Similarly, approximate <math|f<rsup|->> and define its integral.

      <item>The integral of <math|f> is <math|<big|int><rsub|X>f*d*\<mu\>=<big|int><rsub|X>f<rsup|+>*d*\<mu\>-<big|int><rsub|X>f<rsup|->*d*\<mu\>>,
      provided this does not take the form <math|\<infty\>-\<infty\>>.
    </itemize>
  </enumerate>

  <paragraph|Conclusion><label|conclusion><label|conclusion>

  The Radon-Stieltjes integral extends the concept of integration to
  functions not necessarily of bounded variation and to more general
  measures. It is essential in various advanced mathematical fields,
  particularly where classical integral definitions are insufficient. This
  rigorous approach highlights its significance and application in modern
  mathematical analysis, including but not limited to, functional analysis,
  probability theory, and mathematical physics.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-3|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-4|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-5|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|conclusion|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|definition-of-the-radon-stieltjes-integral|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|detailed-construction|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|preliminaries|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|the-radon-stieltjes-integral|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_14.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>The Radon-Stieltjes Integral
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|4tab>|Preliminaries
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Definition of the Radon-Stieltjes Integral
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Detailed Construction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.15fn>>
    </associate>
  </collection>
</auxiliary>