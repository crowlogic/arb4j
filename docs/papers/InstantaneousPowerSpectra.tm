<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Instantaneous Power
  Spectra>|<doc-author|<author-data|<author-name|Chester H.
  Page>>>|<doc-date|>>

  <\padded-center>
    National Bureau of Standards, Washington, D.C.<next-line>(Received August
    16, 1951)
  </padded-center>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Mathematical
    Formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Examples>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Step-Wave
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|3.2<space|2spc>Stepped Sine Wave
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|3.3<space|2spc>Isosceles Triangle
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Extension
    to Reactive Circuits> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Random
    Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Conclusions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The intuitive concept of a changing spectrum is discussed. The
  instantaneous power spectrum is defined mathematically and used to make the
  intuitive concepts more precise. It depends upon the past history of a
  signal, but not upon the future.

  Integration of the instantaneous power spectrum over time yields the
  conventional energy spectrum. The instantaneous power spectrum of a random
  function may be averaged over the ensemble of functions, with a resulting
  stochastic average instantaneous power spectrum that is equal to the
  conventional time average power spectrum of a stochastic process.

  The ordinary concept of the frequency spectrum of a signal is often
  confusing in practice. The spectrum is expressed in terms of the Fourier
  transform of the signal; the Fourier transform is determined by the
  complete history of the signal from <math|t=-\<infty\>> to
  <math|t=+\<infty\>>. In practice, we are interested in what is happening
  now, and this is independent of what the signal may do in the future. It is
  a familiar fact that in the Fourier solution of a circuit problem, the
  future behavior of the applied signal does not affect the result, even
  though it apparently enters the calculation via the transform.

  For example, let a man and woman sing alternate verses of a song. It is a
  common intuitive reaction to say that the spectrum keeps changing. We
  somehow feel that a sample of sufficient duration defines a spectrum, yet
  the mathematical definition of spectrum disallows this. The paradox becomes
  more apparent when we decrease the time intervals for spectral comparison
  and ask how the spectrum changes in successive milliseconds. This is
  \Pobviously\Q an absurd query. The paradox is somewhat resolved by a
  sharper analysis. By the spectrum of the male verses we really mean the
  power spectrum of this man's singing, or mathematically the power spectrum
  of the stochastic process of which the singing of one verse is a
  statistically large sample. This standard concept of power spectrum will be
  discussed later. The role of duration is now clarified; one verse is
  statistically sufficient to give a reasonably precise determination of the
  process and its spectrum, one syllable is not a large enough sample.

  The paradox has not, however, been completely vanquished. There is
  certainly nothing statistical about a pure sine wave. Let us play a simple
  melody on a very crude electric organ, or more ideally, change the
  frequency of an audio oscillator. We describe both these situations in
  terms of frequency changes in time. Again, each tone must be of sufficient
  duration to define a frequency. But how long does it take to establish a
  frequency? Indeed, what do we mean by a frequency, since any signal of
  finite duration has a spectrum that is not infinitely sharp? A unique
  frequency exists only for a sine wave of infinite duration.

  There must be some description of signals that asymptotically agrees with
  the above intuitive properties. That is, a sine wave switched on at
  <math|t=0> has some sort of spectral distribution that can be represented
  more and more closely by a single frequency as time goes on. Similarly, a
  stochastic process can be spectrally described in some manner that
  progressively agrees more closely with the power spectrum of the process.
  We seek a description in terms of an \Pinstantaneous power spectrum\Q with
  the above properties.

  <section|Mathematical Formulation>

  <\definition>
    [Energy Spectrum] The (energy) spectrum of a signal is defined as the
    absolute square of the Fourier transform of the signal. Thus a signal
    <math|G<around|(|t|)>> has the Fourier transform

    <\equation>
      g<around|(|f|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-2*\<pi\>*i*f*t>*G<around|(|t|)>*<space|0.17em>d*t<label|eq:fourier_transform>
    </equation>

    if the integral converges.
  </definition>

  Plancherel's theorem states that

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||g<around|(|f|)>*<around|\||<rsup|2><space|0.17em>d*f=<big|int><rsub|-\<infty\>><rsup|\<infty\>>|\|>*G<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t<label|eq:plancherel>
  </equation>

  Since <math|G<rsup|2><around|(|t|)>> is the instantaneous power (into unit
  resistance), <eqref|eq:plancherel> represents the total energy of the
  signal, and <math|<around|\||g|\|><rsup|2>> is interpreted as the energy
  distribution in frequency, or the energy spectrum. Thus the spectrum
  depends upon the entire history of the signal, by virtue of the infinite
  limits in <eqref|eq:fourier_transform>. This property of the spectrum is
  responsible for many apparent paradoxes and much confusion in description.

  Consider the energy of a signal to be distributed in time and frequency.
  Denote the energy density in this <math|t-f> plane by
  <math|\<rho\>*<around|(|t,f|)>>. The total energy expended up to time
  <math|T> will be

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|T><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<rho\>*<around|(|t,f|)>*<space|0.17em>d*f*<space|0.17em>d*t
  </equation*>

  The rate of increase of total energy is the instantaneous power, and is
  simply

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<rho\>*<around|(|T,f|)>*<space|0.17em>d*f<label|eq:instantaneous_power>
  </equation>

  by differentiating the energy. Thus at any time <math|T>, the distribution
  <math|\<rho\>*<around|(|T,f|)>> can be considered as the instantaneous
  power spectrum.

  Suppose the signal <math|G<around|(|t|)>> to be switched off at <math|t=T>.
  This defines an auxiliary signal

  <\equation>
    G<rsub|a><around|(|t|)>=<choice|<tformat|<table|<row|<cell|G<around|(|t|)>>|<cell|t\<less\>T>>|<row|<cell|0>|<cell|t\<gtr\>T>>>>><label|eq:auxiliary_signal>
  </equation>

  which is identical with <math|G<around|(|t|)>> up till time <math|T>, and
  therefore up till time <math|T> has delivered the same energy as
  <math|G<around|(|t|)>>. Since <math|G<rsub|a>> is defined for all time, we
  can compute its Fourier transform and its energy spectrum, and the latter
  should agree with the time integrated power spectrum of
  <math|G<around|(|t|)>>. That is, we require <math|\<rho\>*<around|(|t,f|)>>
  to satisfy the condition

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|T>\<rho\>*<around|(|t,f|)>*<space|0.17em>d*t=<around*|\||g<rsub|a><around|(|f|)>|\|><rsup|2><label|eq:integrated_spectrum>
  </equation>

  where <math|g<rsub|a><around|(|f|)>> is the transform of
  <math|G<rsub|a><around|(|t|)>>. Since this condition must be satisfied for
  all <math|T>, it is convenient to define the running transform of
  <math|G<around|(|t|)>> as the transform of a continually changing auxiliary
  function:

  <\equation>
    g<rsub|t><around|(|f|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>G<rsub|t><around|(|x|)>*e<rsup|-2*\<pi\>*i*f*x>*<space|0.17em>d*x=<big|int><rsub|-\<infty\>><rsup|t>G<around|(|x|)>*e<rsup|-2*\<pi\>*i*f*x>*<space|0.17em>d*x<label|eq:running_transform>
  </equation>

  The instantaneous power spectrum must now satisfy

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|t>\<rho\>*<around|(|x,f|)>*<space|0.17em>d*x=<around*|\||g<rsub|t><around|(|f|)>|\|><rsup|2><label|eq:cumulative_spectrum>
  </equation>

  and this equation is sufficient to determine <math|\<rho\>>.
  Differentiation with respect to <math|t> yields

  <\equation>
    \<rho\>*<around|(|t,f|)>=<frac|\<partial\>|\<partial\>*t><around*|\||g<rsub|t><around|(|f|)>|\|><rsup|2><label|eq:instantaneous_spectrum>
  </equation>

  The expression for <math|\<rho\>*<around|(|t,f|)>> can profitably be
  written in other forms. First, substitute <eqref|eq:running_transform> into
  <eqref|eq:instantaneous_spectrum>, so that

  <\equation>
    \<rho\>*<around|(|t,f|)>=<frac|\<partial\>|\<partial\>*t><around*|{|<big|int><rsub|-\<infty\>><rsup|t>G<around|(|x|)>*e<rsup|-2*\<pi\>*i*f*x>*<space|0.17em>d*x*<big|int><rsub|-\<infty\>><rsup|t>G<around|(|y|)>*e<rsup|+2*\<pi\>*i*f*y>*<space|0.17em>d*y|}><label|eq:instantaneous_spectrum_expanded>
  </equation>

  This is usually the most convenient form for calculation of
  <math|\<rho\>*<around|(|t,f|)>>. The intermediate result
  <eqref|eq:instantaneous_spectrum_expanded> can be used as follows.
  Integrating over frequency gives:

  <\align>
    <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<rho\>*<around|(|t,f|)>*<space|0.17em>d*f>|<cell|=G<around|(|t|)><around*|(|<around*|{|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|t>G<around|(|y|)>*e<rsup|2*\<pi\>*i*f*<around|(|y-t|)>>*<space|0.17em>d*y*<space|0.17em>d*f|\<nobracket\>>+<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|t>G<around|(|x|)>*e<rsup|-2*\<pi\>*i*f*<around|(|x-t|)>>*<space|0.17em>d*x*<space|0.17em>d*f|)>>>|<row|<cell|>|<cell|=2*G<around|(|t|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>G<rsub|t><around|(|x|)>*cos
    2*\<pi\>*f*<around|(|x-t|)>*<space|0.17em>d*x*<space|0.17em>d*f<eq-number>>>>>
  </align>

  By Fourier's theorem, the double integral is

  <\equation>
    <frac|1|2>*<around|[|G<rsub|t>*<around|(|t-0|)>+G<rsub|t>*<around|(|t+0|)>|]>=<frac|1|2>*G<around|(|t|)>
  </equation>

  by virtue of the discontinuity in <math|G<rsub|t><around|(|x|)>> by
  definition <eqref|eq:auxiliary_signal>. Therefore,

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<rho\>*<around|(|t,f|)>*<space|0.17em>d*f=G<rsup|2><around|(|t|)>=<text|instantaneous
    power><label|eq:energy_conservation>
  </equation>

  as expected. Equation <eqref|eq:instantaneous_spectrum_expanded> can also
  be written as

  <\equation>
    \<rho\>*<around|(|t,f|)>=2*G<around|(|t|)>*<big|int><rsub|-\<infty\>><rsup|t>G<around|(|x|)>*cos
    2*\<pi\>*f*<around|(|x-t|)>*<space|0.17em>d*x<label|eq:instantaneous_spectrum_cosine>
  </equation>

  and a change of variable yields

  <\equation>
    \<rho\>*<around|(|t,f|)>=2*<big|int><rsub|0><rsup|\<infty\>>G<around|(|t|)>*G*<around|(|t-\<tau\>|)>*cos
    2*\<pi\>*f*\<tau\>*<space|0.17em>d*\<tau\><label|eq:instantaneous_spectrum_delay>
  </equation>

  where <math|G<around|(|t|)>> has been placed inside the integral purely for
  later convenience.

  <section|Examples>

  <subsection|Step-Wave>

  Consider the spectrum generated by a step-wave, i.e., direct current
  switched on at <math|t=0>. We find directly

  <\equation>
    g<rsub|t><around|(|f|)>=<big|int><rsub|0><rsup|t>e<rsup|-2*\<pi\>*i*f*x>*<space|0.17em>d*x=<frac|e<rsup|-2*\<pi\>*i*f*t>-1|-2*\<pi\>*i*f>
  </equation>

  The real part gives

  <\equation>
    <math-up|Re><around|{|e<rsup|2*\<pi\>*i*f*t>*g<rsub|t><around|(|f|)>|}>=<math-up|Re><around*|{|<frac|1-e<rsup|2*\<pi\>*i*f*t>|2*\<pi\>*i*f>|}>=<frac|sin
    2*\<pi\>*f*t|2*\<pi\>*f>
  </equation>

  and therefore

  <\equation>
    \<rho\>*<around|(|t,f|)>=2<around*|(|<frac|sin
    2*\<pi\>*f*t|2*\<pi\>*f>|)><label|eq:step_spectrum>
  </equation>

  This spectrum is of the form <math|sin x/x> with its familiar oscillations.
  For any <math|t>, it has its greatest maximum at <math|f=0>, and this value
  <math|<around|(|\<rho\><rsub|max>=2*t|)>> grows indefinitely. As time goes
  on, the distribution becomes more concentrated around <math|f=0>; the peaks
  of the instantaneous spectrum move in toward <math|f=0> maintaining
  constant area under each \Phump\Q of the curve. The area

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<rho\>*<space|0.17em>d*f=1
  </equation>

  for all <math|t>, and the spectrum approaches a <math|\<delta\>>-function
  as <math|t\<to\>\<infty\>>. Thus as <math|t> increases, the spectrum is
  more and more precisely described by stating that the signal is an
  oscillation of zero frequency.

  <subsection|Stepped Sine Wave>

  The stepped sine wave

  <\equation>
    G<around|(|t|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|t\<less\>0>>|<row|<cell|sin
    2*\<pi\>*f<rsub|0>*t>|<cell|t\<gtr\>0>>>>><label|eq:stepped_sine>
  </equation>

  exhibits a similar behavior. Its spectrum is found by
  <eqref|eq:instantaneous_spectrum_cosine> to be

  <\equation>
    \<rho\>*<around|(|t,f|)>=<frac|-f<rsub|0>*sin
    2*\<pi\>*f<rsub|0>*t*<around|(|cos 2*\<pi\>*f<rsub|0>*t-cos
    2*\<pi\>*f*t|)>|f<rsup|2>-f<rsub|0><rsup|2>><label|eq:stepped_sine_spectrum>
  </equation>

  which can also be expressed as

  <\equation>
    \<rho\>*<around|(|t,f|)>=-f<rsub|0>*sin
    2*\<pi\>*f<rsub|0>*t\<cdot\><frac|sin
    \<pi\>*<around|(|f+f<rsub|0>|)>*t|f+f<rsub|0>>\<cdot\><frac|sin
    \<pi\>*<around|(|f-f<rsub|0>|)>*t|f-f<rsub|0>>
  </equation>

  As <math|t\<to\>\<infty\>>, the spectrum becomes a
  <math|\<delta\>>-function distribution at <math|f=f<rsub|0>> and
  <math|f=-f<rsub|0>>. The appearance of negative frequencies is not
  conceptually troublesome because the spectrum is always an even function of
  <math|f>. Thus negative frequencies can be ignored in the interpretation.

  Negative energy densities do occur, as is obvious in
  <eqref|eq:stepped_sine_spectrum>. These seem physically unreal at first
  glance, but must be present. For if either of these stepped signals is
  turned off when <math|t> is small, the total spectrum contains high
  frequencies. If turned off later, the high frequency content is less, but
  the high frequency content must have been present originally. This means
  that as time goes on, the \Pvirtual\Q sidebands must be modified and some
  of the energy recalled. Negative values of the density <math|\<rho\>> occur
  only in partial compensation of earlier positive <math|\<rho\>>; the total
  energy <math|<big|int><rsub|-\<infty\>><rsup|t>\<rho\>*<space|0.17em>d*t>
  is always positive at all frequencies, by <eqref|eq:cumulative_spectrum>.

  <subsection|Isosceles Triangle>

  Another interesting signal is the isosceles triangle, such as

  <\equation>
    G<around|(|t|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|t\<less\>-1>>|<row|<cell|1+t>|<cell|-1\<less\>t\<less\>0>>|<row|<cell|1-t>|<cell|0\<less\>t\<less\>1>>|<row|<cell|0>|<cell|t\<gtr\>1>>>>><label|eq:triangle_signal>
  </equation>

  The instantaneous power spectrum is readily found to be

  <\equation>
    \<rho\>*<around|(|t,f|)>=<around|(|1+t|)>*<frac|1-cos
    2*\<pi\>*f*<around|(|1+t|)>|2*\<pi\><rsup|2>*f<rsup|2>><space|1em><text|for
    >-1\<less\>t\<less\>0<label|eq:triangle_spectrum_rising>
  </equation>

  and

  <\equation>
    \<rho\>*<around|(|t,f|)>=<around|(|1-t|)>*<frac|2*cos 2*\<pi\>*f*t-1-cos
    2*\<pi\>*f*<around|(|1+t|)>|2*\<pi\><rsup|2>*f<rsup|2>>*<space|1em><text|for
    >0\<less\>t\<less\>1<label|eq:triangle_spectrum_falling>
  </equation>

  with <math|\<rho\>*<around|(|t,f|)>=0> elsewhere. During the rise of the
  signal, the energy density is everywhere positive by
  <eqref|eq:triangle_spectrum_rising>. During the latter half of the signal,
  there are regions of negative density. At all times, the density is maximum
  at zero frequency, and this maximum is greatest shortly after <math|t=0>.
  The direct component of the signal is still increasing when the signal peak
  is passed. A relief plot of <math|\<rho\>> is shown in Fig.<nbsp>1.

  <section|Extension to Reactive Circuits>

  The definition of power spectrum in terms of pure (unit) resistance load
  was made for simplicity. Consider the voltage <math|E<around|(|t|)>>
  applied across a circuit containing reactance, with the resulting current
  <math|I<around|(|t|)>>. The instantaneous power delivered by the source is
  <math|E*I>, so the total energy delivered is

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>E<around|(|t|)>*I<around|(|t|)>*<space|0.17em>d*t=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<around|(|f|)><wide|\<imath\>|\<bar\>><around|(|f|)>*<space|0.17em>d*f=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|e|\<bar\>><around|(|f|)>*i<around|(|f|)>*<space|0.17em>d*f=<big|int><rsub|-\<infty\>><rsup|\<infty\>><math-up|Re><around|{|e*<wide|\<imath\>|\<bar\>>|}>*<space|0.17em>d*f<label|eq:reactive_energy>
  </equation>

  where <math|e<around|(|f|)>> and <math|i<around|(|f|)>> are the Fourier
  transforms of <math|E<around|(|t|)>> and <math|I<around|(|t|)>>, with
  <math|<wide|e|\<bar\>>> the complex conjugate of <math|e>. The equation
  follows from Plancherel's theorem, and the energy spectrum can be taken as
  any of the three integrands on the right. The complex forms yield an
  imaginary component of energy density. This component is an odd function of
  frequency, so its net power is zero. Inclusion of this term does not
  apparently have any usefulness, so we take the energy density in the third
  form: real part of <math|e*<wide|\<imath\>|\<bar\>>>.

  The energy delivered by the source up until time <math|t> is

  <\equation>
    \<cal-E\><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|t>E<around|(|x|)>*I<around|(|x|)>*<space|0.17em>d*x=<big|int><rsub|-\<infty\>><rsup|\<infty\>>E<rsub|t><around|(|x|)>*I<rsub|t><around|(|x|)>*<space|0.17em>d*x<label|eq:reactive_cumulative_energy>
  </equation>

  where <math|I<rsub|t><around|(|x|)>> is the current resulting from the
  auxiliary voltage <math|E<rsub|t><around|(|x|)>> which vanishes for
  <math|x\<gtr\>t>. Note that <math|I<rsub|t><around|(|x|)>> does not vanish
  identically for <math|x\<gtr\>t>, and note also that any arbitrary
  definition of <math|I<rsub|t><around|(|x|)>> for <math|x\<gtr\>t> would not
  affect <eqref|eq:reactive_cumulative_energy>. By Plancherel's theorem, the
  right-hand side of <eqref|eq:reactive_cumulative_energy> is equal to

  <\equation>
    \<cal-E\><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><math-up|Re><around|{|e<rsub|t><around|(|f|)>*<wide|\<imath\>|\<bar\>><rsub|t><around|(|f|)>|}>*<space|0.17em>d*f<label|eq:reactive_spectrum>
  </equation>

  so that the cumulative energy spectrum can be taken as
  <math|<math-up|Re><around|{|e<rsub|t><around|(|f|)>*<wide|\<imath\>|\<bar\>><rsub|t><around|(|f|)>|}>>.
  Its rate of increase is the instantaneous power spectrum

  <\equation>
    \<rho\>*<around|(|t,f|)>=<frac|\<partial\>|\<partial\>*t><math-up|Re><around|{|e<rsub|t><around|(|f|)>*<wide|\<imath\>|\<bar\>><rsub|t><around|(|f|)>|}><label|eq:reactive_instantaneous>
  </equation>

  The running transform of the current <math|i<rsub|t><around|(|f|)>> can be
  found in terms of the impedance of the circuit, or its reciprocal, the
  admittance:

  <\equation>
    i<rsub|t><around|(|f|)>=<frac|e<rsub|t><around|(|f|)>|z<around|(|f|)>>=e<rsub|t><around|(|f|)>*A<around|(|f|)>
  </equation>

  This yields

  <\equation>
    \<rho\>*<around|(|t,f|)>=<frac|\<partial\>|\<partial\>*t><math-up|Re><around|{|<around|\||e<rsub|t><around|(|f|)>|\|><rsup|2>*A<around|(|f|)>|}>=C<around|(|f|)><frac|\<partial\>|\<partial\>*t><around|\||e<rsub|t><around|(|f|)>|\|><rsup|2><label|eq:reactive_final>
  </equation>

  using <math|A<around|(|f|)>=C<around|(|f|)>+i*S<around|(|f|)>>. The result
  <eqref|eq:reactive_final> shows that <math|\<rho\>*<around|(|t,f|)>> has
  the original form <eqref|eq:instantaneous_spectrum> multiplied by the
  conductance. This is the spectrum for the power delivered by the source,
  not that dissipated by the resistance. These two are not in continual
  balance because energy is stored in the reactance. The corresponding total
  energy spectra for <math|t\<to\>\<infty\>> must, however, be equal.

  <section|Random Functions>

  When the driving force <math|G<around|(|t|)>> is a random function, a
  continuing process, the total energy becomes infinite with time. The
  Fourier transform and the conventional energy spectrum do not exist. An
  average energy spectrum per second, or power spectrum, does exist and its
  customary definition can be expressed in terms of our running transform:

  <\equation>
    P<around|(|f|)>=lim<rsub|T\<to\>\<infty\>>
    <frac|1|T><around|\||g<rsub|T><around|(|f|)>|\|><rsup|2><label|eq:random_power_spectrum>
  </equation>

  The usual procedure for finding <math|P<around|(|f|)>> is to use the
  Wiener-Khintchine theorem:

  <\equation>
    P<around|(|f|)>=2*<big|int><rsub|0><rsup|\<infty\>>\<Psi\><around|(|\<tau\>|)>*cos
    2*\<pi\>*f*\<tau\>*<space|0.17em>d*\<tau\><label|eq:wiener_khintchine>
  </equation>

  where

  <\equation>
    \<Psi\><around|(|\<tau\>|)>=lim<rsub|T\<to\>\<infty\>>
    <frac|1|T>*<big|int><rsub|0><rsup|T>G<around|(|t|)>*G*<around|(|t-\<tau\>|)>*<space|0.17em>d*t<label|eq:autocorrelation>
  </equation>

  is, except for normalization, the auto-correlation function of the process
  <math|G<around|(|t|)>>. Thus the standard form for the power spectrum of a
  stochastic process is

  <\equation>
    P<around|(|f|)>=2*<big|int><rsub|0><rsup|\<infty\>><around|\<langle\>|G<around|(|t|)>*G*<around|(|t-\<tau\>|)>|\<rangle\>><rsub|time>*cos
    2*\<pi\>*f*\<tau\>*<space|0.17em>d*\<tau\><label|eq:stochastic_power_spectrum>
  </equation>

  with <math|<around|\<langle\>|G<around|(|t|)>*G*<around|(|t-\<tau\>|)>|\<rangle\>><rsub|time>>
  indicating the time average of the product.

  Now for a stationary ergodic process, time averages and stochastic averages
  over the ensemble should be equivalent. Hence we expect that our
  instantaneous power spectrum formula, applied to random functions, will
  yield a result corresponding to <eqref|eq:stochastic_power_spectrum> after
  stochastic averaging. Indeed, the stochastic average of
  <eqref|eq:instantaneous_spectrum_delay> is

  <\equation>
    <around|\<langle\>|\<rho\>*<around|(|t,f|)>|\<rangle\>><rsub|stochastic>=2*<big|int><rsub|0><rsup|\<infty\>><around|\<langle\>|G<around|(|t|)>*G*<around|(|t-\<tau\>|)>|\<rangle\>><rsub|stochastic>*cos
    2*\<pi\>*f*\<tau\>*<space|0.17em>d*\<tau\><label|eq:stochastic_instantaneous>
  </equation>

  which is the power spectrum <math|P<around|(|f|)>> if <math|G> is an
  ergodic process.

  Returning to <eqref|eq:instantaneous_spectrum_delay>, if
  <math|G<around|(|t|)>> is a function switched on at <math|t=0>, the
  integrand vanishes for <math|\<tau\>\<gtr\>t>, and

  <\equation>
    \<rho\>*<around|(|t,f|)>=2*<big|int><rsub|0><rsup|t>G<around|(|t|)>*G*<around|(|t-\<tau\>|)>*cos
    2*\<pi\>*f*\<tau\>*<space|0.17em>d*\<tau\><label|eq:finite_time_spectrum>
  </equation>

  Hence for a random function switched on at <math|t=0>,

  <\align>
    <tformat|<table|<row|<cell|<around|\<langle\>|\<rho\>*<around|(|t,f|)>|\<rangle\>><rsub|stochastic>>|<cell|=2*<big|int><rsub|0><rsup|t><around|\<langle\>|G<around|(|t|)>*G*<around|(|t-\<tau\>|)>|\<rangle\>><rsub|stochastic>*cos
    2*\<pi\>*f*\<tau\>*<space|0.17em>d*\<tau\>>>|<row|<cell|>|<cell|=2*<big|int><rsub|0><rsup|t>\<Psi\><around|(|\<tau\>|)>*cos
    2*\<pi\>*f*\<tau\>*<space|0.17em>d*\<tau\><eq-number><label|eq:developing_spectrum>>>>>
  </align>

  and the stochastic average of the instantaneous power spectrum
  asymptotically approaches the function <math|P<around|(|f|)>>. The result
  <eqref|eq:developing_spectrum> shows how the power spectrum of the process
  develops in time. At time <math|t> after starting the process, if <math|t>
  is sufficiently large that the process has effectively \Pforgotten\Q its
  start, i.e., <math|\<Psi\><around|(|\<tau\>|)>\<approx\>0> for
  <math|\<tau\>\<gtr\>t>, the instantaneous power spectrum has effectively
  attained its ultimate value. This means that a sufficient statistical
  sample of the process has been taken for estimating the power spectrum.

  <section|Conclusions>

  It appears that an instantaneous power spectrum can be rigorously defined
  as a useful concept, and that its properties not only fill an intuitive
  need, but also serve to round out the mathematical structure of spectrum
  analysis.

  <thebibliography|1|<bibitem|Rice1944>S.<nbsp>O.<nbsp>Rice, \PMathematical
  Analysis of Random Noise,\Q <with|font-shape|italic|Bell System Technical
  Journal>, vol.<nbsp>23, pp.<nbsp>283\U332, July 1944.>
</body>

<\initial>
  <\collection>
    <associate|magnification|1>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-10|<tuple|6|7|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-3|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-4|<tuple|3.1|4|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-5|<tuple|3.2|4|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-6|<tuple|3.3|5|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-7|<tuple|4|5|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-8|<tuple|5|6|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|auto-9|<tuple|6|7|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|bib-Rice1944|<tuple|Rice1944|7|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:autocorrelation|<tuple|33|6|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:auxiliary_signal|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:cumulative_spectrum|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:developing_spectrum|<tuple|37|7|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:energy_conservation|<tuple|12|3|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:finite_time_spectrum|<tuple|36|6|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:fourier_transform|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:instantaneous_power|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:instantaneous_spectrum|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:instantaneous_spectrum_cosine|<tuple|13|3|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:instantaneous_spectrum_delay|<tuple|14|3|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:instantaneous_spectrum_expanded|<tuple|9|3|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:integrated_spectrum|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:plancherel|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:random_power_spectrum|<tuple|31|6|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:reactive_cumulative_energy|<tuple|26|5|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:reactive_energy|<tuple|25|5|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:reactive_final|<tuple|30|6|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:reactive_instantaneous|<tuple|28|5|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:reactive_spectrum|<tuple|27|5|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:running_transform|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:step_spectrum|<tuple|17|4|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:stepped_sine|<tuple|19|4|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:stepped_sine_spectrum|<tuple|20|4|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:stochastic_instantaneous|<tuple|35|6|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:stochastic_power_spectrum|<tuple|34|6|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:triangle_signal|<tuple|22|5|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:triangle_spectrum_falling|<tuple|24|5|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:triangle_spectrum_rising|<tuple|23|5|../../.TeXmacs/texts/scratch/no_name_38.tm>>
    <associate|eq:wiener_khintchine|<tuple|32|6|../../.TeXmacs/texts/scratch/no_name_38.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Mathematical
      Formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Examples>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Step-Wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Stepped Sine Wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Isosceles Triangle
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Extension
      to Reactive Circuits> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Random
      Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>