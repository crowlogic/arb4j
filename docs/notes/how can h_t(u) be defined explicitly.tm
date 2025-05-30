<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-date|>>

  <section|how can <math|h<rsub|t><around*|(|u|)>> be defined
  explicitly><label|how-can-h_tu-be-defined-explicitly><label|how-can-h>

  Sure! Let's clarify how<math|h<rsub|t><around|(|u|)>>can be
  <with|font-series|bold|explicitly defined> in the context of M.B.
  Priestley's <em|Evolutionary Spectra and Non-Stationary Processes>. This is
  discussed around the passage that begins:

  <\quote-env>
    There is an interesting alternative interpretation of oscillatory
    processes in terms of time-varying filters. ...\ 

    \;

    Let

    <\equation*>
      A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)>*d*u
    </equation*>
  </quote-env>

  This is equation (filter_fourier) in your document.

  <subsection|Explicit Definition of<math|h<rsub|t><around|(|u|)>>><label|explicit-definition-ofh_tu><label|explicit-definition-ofh>

  <subsubsection|1. Fourier Relationship><label|fourier-relationship><label|fourier-relationship>

  <math|h<rsub|t><around|(|u|)>>is related
  to<math|A<rsub|t><around|(|\<omega\>|)>>by the
  <with|font-series|bold|inverse Fourier transform>:

  <\equation*>
    A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)>*d*u
  </equation*>

  Therefore, for each fixed<math|t>,<math|h<rsub|t><around|(|u|)>>is the
  inverse Fourier transform of<math|A<rsub|t><around|(|\<omega\>|)>>:

  <\equation*>
    h<rsub|t><around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*u>*d*\<omega\>
  </equation*>

  <subsubsection|2. Interpretation><label|interpretation><label|interpretation>

  <\itemize>
    <item>For each time<math|t>,<math|h<rsub|t><around|(|u|)>>is a function
    of \Plag\Q<math|u>.

    <item>It represents the <with|font-series|bold|impulse response> of a
    time-varying (i.e., non-stationary) filter at time<math|t>.
    -<math|X<rsub|t>>is constructed by convolving this filter with a
    stationary process<math|S<rsub|t-u>>:
  </itemize>

  <\equation*>
    X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t-u>*h<rsub|t><around|(|u|)>*d*u
  </equation*>

  where<math|S<rsub|t>>is stationary with
  spectrum<math|d*\<mu\><around|(|\<omega\>|)>>.

  <subsubsection|3. Summary><label|summary><label|summary>

  <\itemize>
    <item><with|font-series|bold|Given<math|A<rsub|t><around|(|\<omega\>|)>>,
    the explicit definition is:>
  </itemize>

  <\equation*>
    h<rsub|t><around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*u>*d*\<omega\>
  </equation*>

  - <with|font-series|bold|Practical Construction:> If you know or
  specify<math|A<rsub|t><around|(|\<omega\>|)>>(the amplitude modulation
  function in frequency for time<math|t>), then you can always obtain the
  corresponding time-varying filter<math|h<rsub|t><around|(|u|)>>via its
  inverse Fourier transform.

  <subsection|In Context: Why is this Useful?><label|in-context-why-is-this-useful><label|in-context-why-is-this-useful>

  <\itemize>
    <item>This formulation allows you to interpret a general non-stationary
    (oscillatory) process as a filtered version of a stationary process,
    where the filter itself can change over time.

    <item>The evolutionary spectrum at time<math|t>,<math|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>>,
    is then the spectrum of the process you would get if you \Pfroze\Q the
    filter at time<math|t>.
  </itemize>

  <subsection|In Summary><label|in-summary><label|in-summary>

  <with|font-series|bold|<math|h<rsub|t><around|(|u|)>>is explicitly defined
  as the inverse Fourier transform of<math|A<rsub|t><around|(|\<omega\>|)>>:>

  <\equation*>
    h<rsub|t><around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|-i*\<omega\>*u>*d*\<omega\>
  </equation*>

  This allows you to construct the time-varying filter corresponding to the
  amplitude modulation function<math|A<rsub|t><around|(|\<omega\>|)>>used in
  the representation of your non-stationary process.

  If you need further clarification or an example with a
  specific<math|A<rsub|t><around|(|\<omega\>|)>>, let me know!

  \<#2042\>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1.1|1>>
    <associate|auto-4|<tuple|1.1.2|1>>
    <associate|auto-5|<tuple|1.1.3|2>>
    <associate|auto-6|<tuple|1.2|2>>
    <associate|auto-7|<tuple|1.3|2>>
    <associate|explicit-definition-ofh|<tuple|1.1|1>>
    <associate|explicit-definition-ofh_tu|<tuple|1.1|1>>
    <associate|fourier-relationship|<tuple|1.1.1|1>>
    <associate|how-can-h|<tuple|1|1>>
    <associate|how-can-h_tu-be-defined-explicitly|<tuple|1|1>>
    <associate|in-context-why-is-this-useful|<tuple|1.2|2>>
    <associate|in-summary|<tuple|1.3|2>>
    <associate|interpretation|<tuple|1.1.2|1>>
    <associate|summary|<tuple|1.1.3|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>how
      can <with|mode|<quote|math>|h<rsub|t><around*|(|u|)>> be defined
      explicitly> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Explicit Definition
      of<with|mode|<quote|math>|h<rsub|t><around|(|u|)>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>1. Fourier Relationship
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.1.2<space|2spc>2. Interpretation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.1.3<space|2spc>3. Summary
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>In Context: Why is this
      Useful? <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>In Summary
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>
    </associate>
  </collection>
</auxiliary>