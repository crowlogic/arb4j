<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Hilbert Transforms and the Complex Representation of
  Real Signals>|<doc-author|<author-data|<author-name|A. W.
  RIHACZEK>|<\author-affiliation>
    Aerospace Corp.

    El Segundo, Calif.

    \;

    October 18, 1965
  </author-affiliation>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Analysis
    of Bedrosian's Observation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Correctness
    of Lerner's Result> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Reconciliation
    with Analytic Signal Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Amplitude
    Modulation Example> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Author's
    Reply> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <with|par-left|1tab|6.1<space|2spc>E. BEDROSIAN
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:introduction>

  A considerable amount of work has been published on Hilbert transforms as
  related to the complex signal notation. A particularly useful result was
  derived by Bedrosian<nbsp><cite|bedrosian1963>, who found a product theorem
  for Hilbert transforms according to which
  <math|H*<around|{|f<around|(|t|)>*g<around|(|t|)>|}>=f<around|(|t|)>*H<around|{|g<around|(|t|)>|}>>,
  provided that:

  <\enumerate>
    <item>the spectral band of <math|g<around|(|t|)>> lies entirely above
    that of <math|f<around|(|t|)>>, or

    <item><math|f<around|(|t|)>> and <math|g<around|(|t|)>> are both analytic
    functions.
  </enumerate>

  However, in interpreting the practical implications of the theorem,
  Bedrosian errs and consequently is unable to reconcile his results and
  those of Urkowitz<nbsp><cite|urkowitz1962>, Lerner<nbsp><cite|lerner1960>,
  and Kelly, Reed, and Root<nbsp><cite|kelly1960>. He resolves these
  difficulties by stating that Lerner is in error. It is the purpose of this
  letter to show that with proper interpretation of Bedrosian's theorem all
  contradictions disappear, so that none of the results need be incorrect.

  <section|Analysis of Bedrosian's Observation><label|sec:bedrosian_analysis>

  At issue is the following observation by Bedrosian. He considers Urkowitz's
  result according to which <math|r<around|(|t|)>*sin
  <around|(|\<omega\><rsub|0>*t+\<phi\>|)>> is the Hilbert transform of
  <math|r<around|(|t|)>*cos <around|(|\<omega\><rsub|0>*t+\<phi\>|)>> only
  under the restriction that the highest frequency in <math|r<around|(|t|)>>
  be smaller than the carrier frequency. He concludes, apparently from the
  results in footnote<nbsp><cite|bedrosian1963>, that no such spectral
  restriction applies when the signal is of the form
  <math|r<around|(|t|)>*cos <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>,
  on the grounds that this signal is the real part of the analytic signal
  <math|r<around|(|t|)>*e<rsup|i*<around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>>,
  whose real and imaginary parts are related by the Hilbert transform. From
  this he further concludes that Lerner must be incorrect in finding that the
  Hilbert transform relationship between <math|r<around|(|t|)>*cos
  <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>> and
  <math|r<around|(|t|)>*sin <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>
  is valid only within a correction term that decreases in magnitude as the
  percentage bandwidth becomes smaller. However, since
  <math|\<phi\>=>constant is merely a special case of
  <math|\<phi\><around|(|t|)>>, it would be indeed surprising if a
  restriction applied for the case <math|\<phi\>=>constant and none in the
  more general case of an arbitrary <math|\<phi\><around|(|t|)>>. The answer
  lies in the interpretation of modulation and modulation functions.

  <section|Correctness of Lerner's Result><label|sec:lerner_correctness>

  It is easy to convince oneself that Lerner's general result of the only
  approximate Hilbert transform relation between the two quadrature signals
  must be correct. Bedrosian's first condition for the validity of the
  product theorem would require the spectrum of <math|cos
  <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>> to lie entirely
  above the spectrum of <math|r<around|(|t|)>>. However, if an arbitrary
  phase modulation <math|\<phi\><around|(|t|)>> is imposed on a carrier, then
  the spectrum of the modulated signal will, in general, extend from minus
  infinity to plus infinity, even though most of the signal energy will
  usually be contained within a relatively narrow band about the carrier
  frequency. Thus the first condition is violated. According to the second
  condition, both <math|r<around|(|t|)>> and <math|cos
  <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>> would have to be
  analytic. Again, since phase modulation of the carrier results generally in
  negative frequencies, the second condition is also violated. Thus we are
  forced to the conclusion that the two forms <math|r<around|(|t|)>*cos
  <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>> and
  <math|r<around|(|t|)>*sin <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>
  cannot be strict Hilbert transforms of each other, which is Lerner's
  result.

  <section|Reconciliation with Analytic Signal
  Theory><label|sec:reconciliation>

  How can this finding be reconciled with the fact that the two quadrature
  signals can be considered the real and imaginary parts of the analytic
  signal <math|r<around|(|t|)>*e<rsup|i*<around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>>
  and, hence, because of the analyticity, must be a Hilbert transform pair?
  From this point of view, it would indeed appear that Bedrosian is correct
  in claiming that Lerner's correction term should not exist. The reason for
  this seeming contradiction lies in the usage of the term <em|modulation
  function> and the complex notation. In Lerner's derivation, and in the
  previous argument supporting his results, the terms amplitude and phase
  modulation are used to describe the type of modulation that was imposed on
  the carrier. Actually, the resulting modulated waveform will not have
  exactly the same modulation characteristics, since the spectrum foldover
  from the phase modulation will cause a \Pdistortion\Q of the waveform. This
  distortion will be negligible when the modulation frequencies are small
  compared to the carrier frequency but, when this is not the case, then the
  modulated waveform will have little of the characteristics of the
  modulation waveforms. This usage of the term modulation function places no
  restrictions on the choice of <math|r<around|(|t|)>> and
  <math|\<phi\><around|(|t|)>>. As a consequence, when to the real signal
  <math|r<around|(|t|)>*cos <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>
  an imaginary part <math|j*r<around|(|t|)>*sin
  <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>> is added to form
  the complex signal <math|r<around|(|t|)>*e<rsup|i*<around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>>,
  this signal will not be strictly analytic, and the Hilbert transform
  relation between real and imaginary part will apply only approximately.

  All this changes when one starts from the form
  <math|r<around|(|t|)>*e<rsup|i*<around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>>.
  As soon as it is required that this signal be analytic, a restriction is
  imposed on the functions <math|r<around|(|t|)>> and
  <math|\<phi\><around|(|t|)>>. Only those combinations are admissible that
  result in the cancellation of the negative frequencies as required to make
  the signal analytic. What is happening in a practical sense is that the
  functions <math|r<around|(|t|)>> and <math|\<phi\><around|(|t|)>> are
  redefined to include the effects of spectrum foldover, or signal
  distortion. These functions no longer describe the low-frequency signals
  used to modulate the carrier but, rather, the effects of modulation,
  including the distortions. For narrow-band signals, the differences between
  the two types of amplitude and phase modulation functions is small, as
  confirmed by Lerner's correction term. For broadband signals, however, the
  two sets of functions will bear little resemblance to each other. As a
  matter of fact, while we still may speak of an amplitude and a phase
  modulation function used to modulate a carrier in the broadband case, it
  will not be possible to define amplitude, phase, and carrier in the
  resulting \Pmodulated\Q signal. The quantities of amplitude and phase have
  practical meaning only in the case of a narrow-band signal, for which the
  period and the amplitude of the RF oscillations change significantly only
  over many cycles of the signal. However, it is still possible,
  mathematically, to define quantities <math|r<around|(|t|)>> and
  <math|\<phi\><around|(|t|)>> such that the signal can be represented in the
  analytic form <math|r<around|(|t|)>*e<rsup|i*<around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>>,
  even though these \Pmodulation functions\Q have no practical meaning. They
  are merely mathematical quantities with no relation to any physical
  modulation process, as the terms carrier, amplitude, and phase have lost
  their meaning.

  <section|Amplitude Modulation Example><label|sec:amplitude_modulation>

  The fact that an independent consideration of amplitude and phase
  modulation functions is possible only in the narrow-band case can be
  illustrated with the example of a purely amplitude modulated carrier,
  <math|r<around|(|t|)>*cos <around|(|\<omega\><rsub|0>*t+\<phi\>|)>>. If the
  restriction that the highest frequency in <math|r<around|(|t|)>> be smaller
  than the carrier frequency is removed, the resulting spectrum foldover will
  give rise to a waveform that can no longer be described by pure amplitude
  modulation, even though generated by an amplitude modulation process. Two
  functions <math|r<around|(|t|)>> and <math|\<phi\><around|(|t|)>> are
  needed now if the waveform is to be represented in the form of a modulated
  carrier, but such a representation has no practical meaning. In summary, if
  amplitude and phase modulation functions are to be arbitrary in the sense
  that they can be specified independently of each other,
  <math|r<around|(|t|)>*cos <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>
  and <math|r<around|(|t|)>*sin <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>
  are only approximately a Hilbert transform pair, with a good approximation
  only in the case of narrow-band signals. When <math|r<around|(|t|)>> and
  <math|\<phi\><around|(|t|)>> are considered the mathematical functions
  obtained by simply omitting in the frequency spectrum of a real signal the
  negative frequencies, thus taking into account the spectrum foldover due to
  amplitude modulation with too high a frequency or due to phase modulation,
  the previous signals strictly form a Hilbert transform pair. However, the
  functions <math|r<around|(|t|)>> and <math|\<phi\><around|(|t|)>> then
  cannot be independently specified and, if the waveform is broadband, they
  have no practical meaning.

  <section|Author's Reply><label|sec:author_reply>

  <subsection|E. BEDROSIAN><label|subsec:bedrosian_reply>

  Electronics Dept.<next-line>The RAND Corp.<next-line>Santa Monica, Calif.

  Rihaczek's discussion of Lerner's result<nbsp><cite|lerner1960> in terms of
  imposed modulation and spectral distortion is very interesting, and lends
  credence to the belief, which I support, that <math|r<around|(|t|)>*sin
  <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>> and
  <math|r<around|(|t|)>*cos <around|[|\<omega\><rsub|0>*t+\<phi\><around|(|t|)>|]>>
  should approximate a Hilbert pair provided only that they are <em|narrow
  band>. I should have been more explicit in my criticism of Lerner's result
  because I can see now that the context in which I refer to it creates the
  impression that I am disputing the existence of a correction term to such
  an approximation. Actually, my intention was only to point out that the
  analysis in Lerner's Appendix is defective. This can be seen by observing
  that the term-by-term integration of his equation<nbsp><eqref|eq:lerner51>
  is not justified. The resulting series clearly diverges, though Lerner
  appears to have overlooked that fact by incorrectly assigning finite values
  to divergent integrals in his equations<nbsp><eqref|eq:lerner53>
  and<nbsp><eqref|eq:lerner54>. Thus, though his result appears reasonable,
  it cannot be accepted as derived.

  <\thebibliography|9>
    <bibitem|bedrosian1963>E. Bedrosian, \PA product theorem for Hilbert
    transforms,\Q <em|Proc. IEEE> (Correspondence), vol. 51, pp. 868\U869,
    May 1963.

    <bibitem|urkowitz1962>H. Urkowitz, \PHilbert transforms of band-pass
    functions,\Q <em|Proc. IRE> (Correspondence), vol. 50, p. 2143, October
    1962.

    <bibitem|lerner1960>R. M. Lerner, \PA matched filter detection system for
    complicated Doppler shifted signals,\Q <em|IEEE Trans. on Information
    Theory>, vol. IT-6, pp. 373\U385, June 1960.

    <bibitem|kelly1960>E. J. Kelly, I. S. Reed, and W. L. Root, \PThe
    detection of radar echoes in noise,\Q <em|J. SIAM>, vol. 8, pp. 309\U341,
    June 1960.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-5|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-6|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-7|<tuple|6.1|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-8|<tuple|6.1|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-bedrosian1963|<tuple|bedrosian1963|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-kelly1960|<tuple|kelly1960|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-lerner1960|<tuple|lerner1960|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-urkowitz1962|<tuple|urkowitz1962|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:amplitude_modulation|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:author_reply|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:bedrosian_analysis|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:introduction|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:lerner_correctness|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:reconciliation|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|subsec:bedrosian_reply|<tuple|6.1|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      bedrosian1963

      urkowitz1962

      lerner1960

      kelly1960

      bedrosian1963

      lerner1960
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Analysis
      of Bedrosian's Observation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Correctness
      of Lerner's Result> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Reconciliation
      with Analytic Signal Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Amplitude
      Modulation Example> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Author's
      Reply> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|6.1<space|2spc>E. BEDROSIAN
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>