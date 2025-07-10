<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Pre-envelopes of Nonstationary Bandpass
  Processes>|<doc-author|<author-data|<author-name|Harry
  Urkowitz>|<author-affiliation|Philco Scientific Laboratory, Blue Bell,
  Pa.>>>|<doc-date|>>

  <abstract-data|<\abstract>
    Many of the useful properties of pre-envelopes of real waveforms are
    shown to hold when the notion of pre-envelope is applied to random
    processes which are not wide-sense stationary. In particular, if
    <math|x<around|(|t|)>> represents a real random process which is not
    wide-sense stationary and <math|y<around|(|t|)>> is its Hilbert
    transform, then <math|x<around|(|t|)>> and <math|y<around|(|t|)>> have
    the same autocovariance function and have zero crosscovariance at the
    same instant. The autocovariance function of the pre-envelope
    <math|z<around|(|t|)>>, given by <math|z<around|(|t|)>=x<around|(|t|)>+j*y<around|(|t|)>>,
    is twice the pre-envelope of the autocovariance function of
    <math|x<around|(|t|)>>.

    The notion of a time-dependent power density spectrum allows a simple
    interpretation of a bandpass random process which is not wide-sense
    stationary. The well-known form of the autocovariance function of a
    wide-sense stationary bandpass process carries over with simple changes
    to processes which are not wide-sense stationary.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Covariances> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Time
    Dependent Spectral Densities> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Additional
    Covariance Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Conclusions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  As defined by Arens<nbsp><cite|arens1957> and
  Dugundji<nbsp><cite|dugundji1958>, the <em|pre-envelope> of a real waveform
  <math|x<around|(|t|)>> is the complex-valued function
  <math|z<around|(|t|)>> whose real part is <math|x<around|(|t|)>> and whose
  imaginary part is <math|y<around|(|t|)>>, the Hilbert transform of
  <math|x<around|(|t|)>>; i.e.,

  <\equation>
    y<around|(|t|)>=<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x<around|(|s|)>|t-s>*d*s<label|eq:hilbert_transform>
  </equation>

  where the integral is a Cauchy principal value.

  The envelope of <math|x<around|(|t|)>> is defined as
  <math|<around|\||z<around|(|t|)>|\|>>. Dugundji has derived a number of
  interesting properties for the time auto- and cross-correlations of real
  waveforms. The same properties hold for auto- and crosscovariances of
  wide-sense stationary random processes by replacing time averages by
  ensemble averages. In this paper it is shown that similar results hold for
  nonstationary (in any sense) random processes. Our particular interest is
  in bandpass processes.

  <section|The Covariances>

  In what follows, the following alternative forms of
  equation<nbsp><eqref|eq:hilbert_transform> will be useful:

  <\equation>
    y<around|(|t|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x*<around|(|t+s|)>|s>*d*s=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x*<around|(|t-s|)>|s>*d*s<label|eq:hilbert_transform_alt>
  </equation>

  <\definition>
    <label|def:autocovariance>The <em|autocovariance function> of a
    complex-valued random process <math|z<around|(|t|)>> of a real variable
    <math|t> (time) is given by

    <\equation>
      R<rsub|z><around|(|t,\<tau\>|)>=\<bbb-E\>*<around|[|z<around|(|t|)>*z<rsup|\<ast\>>*<around|(|t-\<tau\>|)>|]><label|eq:autocovariance>
    </equation>

    where the asterisk indicates the complex conjugate and the bar indicates
    a statistical or ensemble average over the sample functions of the
    process.
  </definition>

  In the special case of a wide-sense stationary process, the autocovariance
  function depends only on <math|\<tau\>>, the time
  displacement<nbsp><cite|doob1953>.

  <\definition>
    <label|def:crosscovariance>The <em|crosscovariance function> of two
    complex-valued random processes <math|z<around|(|t|)>> and
    <math|w<around|(|t|)>> of a real variable <math|t> is given by

    <\equation>
      R<rsub|z*w><around|(|t,\<tau\>|)>=\<bbb-E\>*<around|[|z<around|(|t|)>*w<rsup|\<ast\>>*<around|(|t-\<tau\>|)>|]><label|eq:crosscovariance>
    </equation>
  </definition>

  <\definition>
    <label|def:hilbert_covariance>The <math|\<tau\>>-Hilbert transform
    <math|<wide|R|^><around|(|t,\<tau\>|)>> of a covariance function
    <math|R<around|(|t,\<tau\>|)>> is the Hilbert transform with the
    integration performed over <math|\<tau\>>; i.e.,

    <\equation>
      <wide|R|^><around|(|t,\<tau\>|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<around|(|t,s|)>|\<tau\>-s>*d*s=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<around|(|t,\<tau\>+s|)>|s>*d*s<label|eq:hilbert_covariance>
    </equation>
  </definition>

  <\theorem>
    <label|thm:crosscov_hilbert>The crosscovariance function of
    <math|x<around|(|t|)>> and <math|y<around|(|t|)>> is the negative of the
    <math|\<tau\>>-Hilbert transform of the autocovariance function of
    <math|x<around|(|t|)>>:

    <\equation>
      R<rsub|x*y><around|(|t,\<tau\>|)>=-<wide|R|^><rsub|x><around|(|t,\<tau\>|)><label|eq:crosscov_hilbert>
    </equation>
  </theorem>

  <\proof>
    See derivation in the main text, using the definition of the Hilbert
    transform and properties of covariance functions.
  </proof>

  <\theorem>
    <label|thm:hilbert_cross>

    <\equation>
      <wide|R|^><rsub|x*y><around|(|t,\<tau\>|)>=-R<rsub|y*x><around|(|t,\<tau\>|)><label|eq:hilbert_cross>
    </equation>
  </theorem>

  <\proof>
    See main text for detailed derivation.
  </proof>

  <\theorem>
    <label|thm:hilbert_of_hilbert>

    <\equation>
      <wide|<wide|R|^>|^><rsub|x><around|(|t,\<tau\>|)>=-R<rsub|x><around|(|t,\<tau\>|)><label|eq:hilbert_of_hilbert>
    </equation>
  </theorem>

  <\proof>
    Follows from the property that the Hilbert transform of a Hilbert
    transform is the negative of the original function.
  </proof>

  <\theorem>
    <label|thm:covariance_identity>

    <\equation>
      R<around|(|t,\<tau\>|)>=R<around|(|t,\<tau\>|)><label|eq:covariance_identity>
    </equation>
  </theorem>

  <\proof>
    Follows from the definitions and properties of covariance functions and
    their Hilbert transforms.
  </proof>

  From the definition of <math|z<around|(|t|)>>, the pre-envelope of
  <math|x<around|(|t|)>>, we may write

  <\equation>
    z<around|(|t|)>=x<around|(|t|)>+j*y<around|(|t|)><label|eq:preenvelope>
  </equation>

  Using equation<nbsp><eqref|eq:autocovariance> and the theorems above, we
  get

  <\equation>
    R<rsub|z><around|(|t,\<tau\>|)>=2*<around*|[|R<rsub|x><around|(|t,\<tau\>|)>+j*<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|]><label|eq:preenvelope_autocov>
  </equation>

  which generalizes Dugundji's result for real waveforms and wide-sense
  stationary processes.

  <section|Time Dependent Spectral Densities>

  Following Lampard<nbsp><cite|lampard1954>, the time-dependent power density
  spectrum <math|S<around|(|\<omega\>,t|)>> of the random process
  <math|x<around|(|t|)>> is defined by

  <\equation>
    S<rsub|x><around|(|\<omega\>,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<rsub|z><around|(|t,\<tau\>|)>*e<rsup|-j*\<omega\>*\<tau\>>*d*\<tau\><label|eq:tdspectrum>
  </equation>

  From the properties of Hilbert transforms, the Fourier transform (with
  integration over <math|\<tau\>>) of <math|R<rsub|z><around|(|t,\<tau\>|)>>
  is:

  <\equation>
    \<cal-F\><around|[|R<rsub|z><around|(|t,\<tau\>|)>|]>=<choice|<tformat|<table|<row|<cell|-j*S<rsub|x><around|(|\<omega\>,t|)>,>|<cell|\<omega\>\<gtr\>0>>|<row|<cell|0,>|<cell|\<omega\>=0>>|<row|<cell|j*S<rsub|x><around|(|\<omega\>,t|)>,>|<cell|\<omega\>\<less\>0>>>>><label|eq:hilbert_fourier>
  </equation>

  It follows, then, that the time-dependent power density spectrum
  <math|S<rsub|z><around|(|\<omega\>,t|)>> of <math|z<around|(|t|)>> is given
  by

  <\equation>
    S<rsub|z><around|(|\<omega\>,t|)>=<choice|<tformat|<table|<row|<cell|4*S<rsub|x><around|(|\<omega\>,t|)>,>|<cell|\<omega\>\<gtr\>0>>|<row|<cell|2*S<rsub|x><around|(|\<omega\>,t|)>,>|<cell|\<omega\>=0>>|<row|<cell|0,>|<cell|\<omega\>\<less\>0>>>>><label|eq:preenvelope_spectrum>
  </equation>

  Page's<nbsp><cite|page1952|kharkevich1960> concept of the instantaneous
  spectrum provides an interesting physical interpretation of
  <math|S<rsub|x><around|(|\<omega\>,t|)>>, which is only briefly mentioned
  here. Considering any one sample function of the random process, one may
  conceive of the energy density of the function as being distributed in time
  and frequency such that the energy expended in the time interval
  <math|<around|(|t<rsub|1>,t<rsub|2>|)>> due to the frequency components
  between frequencies <math|f<rsub|1>> and <math|f<rsub|2>> is given by the
  volume under the surface <math|p<around|(|t,f|)>> representing the
  time-frequency energy distribution bounded by the appropriate limits:

  <\equation>
    <big|int><rsub|t<rsub|1>><rsup|t<rsub|2>><big|int><rsub|f<rsub|1>><rsup|f<rsub|2>>p<around|(|t,f|)>*<space|0.17em>d*f*<space|0.17em>d*t<label|eq:energy_density>
  </equation>

  <math|p<around|(|t,f|)>> is called the <em|instantaneous energy spectrum>
  of the function. Then the ensemble average of <math|p<around|(|t,f|)>> is
  the time-dependent power density spectrum of the process, i.e.,

  <\equation>
    \<bbb-E\><around|[|p<around|(|t,\<omega\>|)>|]>=S<rsub|x><around|(|\<omega\>,t|)><label|eq:ensemble_energy>
  </equation>

  where <math|\<omega\>=2*\<pi\>*f>.

  <math|S<rsub|x><around|(|\<omega\>,t|)>> gives a convenient way of
  describing bandpass random processes even if the process is not wide-sense
  stationary. One may define a bandpass random process as one whose
  time-dependent power density spectrum <math|S<rsub|x><around|(|\<omega\>,t|)>>
  has the bandpass character for all <math|t>. It is convenient to choose a
  reference frequency <math|f<rsub|0>> (<math|\<omega\><rsub|c>=2*\<pi\>*f<rsub|0>>)
  in the vicinity of the band to enable one to write

  <\equation>
    S<rsub|x><around|(|\<omega\>,t|)>=S<rsub|c><around|(|\<omega\>-\<omega\><rsub|c>,t|)>+S<rsub|c><around|(|-\<omega\>-\<omega\><rsub|c>,t|)><label|eq:bandpass_spectrum>
  </equation>

  indicating <math|S<rsub|x><around|(|\<omega\>,t|)>> as an even function of
  <math|\<omega\>>. <math|S<rsub|c><around|(|\<omega\>,t|)>> has a low
  frequency property if <math|\<omega\><rsub|c>> is in the vicinity of the
  band. It should be emphasized that there is no requirement for symmetry of
  <math|S<rsub|x><around|(|\<omega\>,t|)>> and that <math|\<omega\><rsub|c>>
  need not be in the band.

  Applying the Fourier inversion formula to
  equation<nbsp><eqref|eq:tdspectrum>, we get

  <\equation>
    R<rsub|z><around|(|t,\<tau\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|x><around|(|\<omega\>,t|)>*e<rsup|j*\<omega\>*\<tau\>>*d*\<omega\>=R<rsub|c><around|(|t,\<tau\>|)>*cos
    <around|(|\<omega\><rsub|c>*\<tau\>|)>+R<rsub|a*c><around|(|t,\<tau\>|)>*sin
    <around|(|\<omega\><rsub|c>*\<tau\>|)><label|eq:autocov_bandpass>
  </equation>

  where

  <\align>
    <tformat|<table|<row|<cell|R<rsub|c><around|(|t,\<tau\>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|c><around|(|\<omega\>,t|)>*cos
    <around|(|\<omega\>*\<tau\>|)>*d*\<omega\>=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>S<rsub|x><around|(|\<omega\>,t|)>*cos
    <around|(|<around|(|\<omega\>-\<omega\><rsub|c>|)>*\<tau\>|)>*d*\<omega\><eq-number><label|eq:Rc>>>|<row|<cell|R<rsub|a*c><around|(|t,\<tau\>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|c><around|(|\<omega\>,t|)>*sin
    <around|(|\<omega\>*\<tau\>|)>*d*\<omega\>=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>S<rsub|x><around|(|\<omega\>,t|)>*sin
    <around|(|<around|(|\<omega\>-\<omega\><rsub|c>|)>*\<tau\>|)>*d*\<omega\><eq-number><label|eq:Rac>>>>>
  </align>

  <section|Additional Covariance Properties>

  Another way of arriving at the autocovariance function of the bandpass
  process <math|x<around|(|t|)>> is to write <math|x<around|(|t|)>> as
  follows:

  <\equation>
    x<around|(|t|)>=x<rsub|c><around|(|t|)>*cos
    <around|(|\<omega\><rsub|c>*t|)>+x<rsub|s><around|(|t|)>*sin
    <around|(|\<omega\><rsub|c>*t|)><label|eq:bandpass_decomp>
  </equation>

  Then, using the fact that

  <\equation>
    R<rsub|a><around|(|t,\<tau\>|)>=\<bbb-E\>*<around|[|x<around|(|t|)>*x*<around|(|t-\<tau\>|)>|]><label|eq:Ra>
  </equation>

  we get:

  <\align>
    <tformat|<table|<row|<cell|2*R<rsub|x><around|(|t,\<tau\>|)>=>|<cell|\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]>*<around*|[|cos
    <around|(|\<omega\><rsub|c>*\<tau\>|)>+cos
    <around|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|+\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]>*<around*|[|cos
    <around|(|\<omega\><rsub|c>*\<tau\>|)>-cos
    <around|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|+\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]>*<around*|[|sin
    <around|(|\<omega\><rsub|c>*\<tau\>|)>+sin
    <around|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|-\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]>*<around*|[|sin
    <around|(|\<omega\><rsub|c>*\<tau\>|)>-sin
    <around|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number><label|eq:covariance_expanded>>>>>
  </align>

  If equation<nbsp><eqref|eq:covariance_expanded> is to be the same as
  equation<nbsp><eqref|eq:autocov_bandpass>, we must have:

  <\align>
    <tformat|<table|<row|<cell|R<rsub|c><around|(|t,\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]>=\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]><eq-number><label|eq:Rc_xc_xs>>>|<row|<cell|R<rsub|a*c><around|(|t,\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]>=-\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]><eq-number><label|eq:Rac_xc_xs>>>>>
  </align>

  Equation<nbsp><eqref|eq:autocov_bandpass> is the generalization of a
  similar expression for the autocovariance function of a wide-sense
  stationary bandpass random process and is almost identical in form. The
  expressions for <math|R<rsub|c>> and <math|R<rsub|a*c>> are very much like
  the corresponding expressions for the wide-sense stationary case.

  Using <math|R<rsub|c>> and <math|R<rsub|a*c>>, an alternative to
  equation<nbsp><eqref|eq:preenvelope_autocov> may be found for the
  autocovariance function of <math|z<around|(|t|)>>. Since
  <math|R<rsub|z><around|(|t,\<tau\>|)>> is written as a bandpass function
  (of <math|\<tau\>>) in equation<nbsp><eqref|eq:autocov_bandpass>, it can be
  shown<nbsp><cite|urkowitz1962> that its <math|\<tau\>>-Hilbert transform is

  <\equation>
    <wide|R|^><rsub|z><around|(|t,\<tau\>|)>=R<rsub|c><around|(|t,\<tau\>|)>*sin
    <around|(|\<omega\><rsub|c>*\<tau\>|)>+R<rsub|a*c><around|(|t,\<tau\>|)>*cos
    <around|(|\<omega\><rsub|c>*\<tau\>|)><label|eq:hilbert_autocov_bandpass>
  </equation>

  provided <math|R<rsub|c>> and <math|R<rsub|a*c>> meet a certain very mild
  bandwidth requirement. This requirement is that the bandwidth of
  <math|R<rsub|c>> (and <math|R<rsub|a*c>>) be such that when its
  <math|\<tau\>>-Fourier transform is translated upward an amount
  <math|\<omega\><rsub|c>>, the result will be zero for
  <math|\<omega\>\<less\>0>. When equations<nbsp><eqref|eq:autocov_bandpass>
  and<nbsp><eqref|eq:hilbert_autocov_bandpass> are combined, we get:

  <\equation>
    R<rsub|z><around|(|t,\<tau\>|)>=2*<around*|[|R<rsub|c><around|(|t,\<tau\>|)>+j*R<rsub|a*c><around|(|t,\<tau\>|)>|]>*e<rsup|j*\<omega\><rsub|c>*\<tau\>><label|eq:final_autocov>
  </equation>

  The same result may be obtained using <math|x<around|(|t|)>> directly. If
  <math|x<rsub|c><around|(|t|)>> and <math|x<rsub|s><around|(|t|)>> meet the
  mild bandwidth requirement mentioned above, then:

  <\align>
    <tformat|<table|<row|<cell|y<around|(|t|)>>|<cell|=x<rsub|c><around|(|t|)>*sin
    <around|(|\<omega\><rsub|c>*t|)>+x<rsub|s><around|(|t|)>*cos
    <around|(|\<omega\><rsub|c>*t|)><eq-number><label|eq:y_bandpass>>>|<row|<cell|z<around|(|t|)>>|<cell|=<around|[|x<rsub|c><around|(|t|)>+j*x<rsub|s><around|(|t|)>|]>*e<rsup|j*\<omega\><rsub|c>*t><eq-number><label|eq:z_bandpass>>>>>
  </align>

  Using equations<nbsp><eqref|eq:autocovariance> and<nbsp><eqref|eq:Rc_xc_xs>
  with equation<nbsp><eqref|eq:z_bandpass>,
  equation<nbsp><eqref|eq:final_autocov> is again obtained.

  <\theorem>
    <label|thm:zero_crosscov><math|x<around|(|t|)>> and
    <math|y<around|(|t|)>> have zero cross-covariance at the same time
    instant; i.e.,

    <\equation>
      R<rsub|x*y><around|(|t,0|)>=0<label|eq:zero_crosscov>
    </equation>
  </theorem>

  <\proof>
    From equations<nbsp><eqref|eq:crosscov_hilbert>
    and<nbsp><eqref|eq:hilbert_autocov_bandpass>, we have
    <math|R<rsub|x*y><around|(|t,0|)>=-R<rsub|a*c><around|(|t,0|)>>. But from
    equation<nbsp><eqref|eq:Rac>, the right-hand side is zero. This proves
    the theorem. It is clear, also, that <math|\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|s><around|(|t|)>|]>=0>.
  </proof>

  <section|Conclusions>

  The properties of real bandpass random processes are described by the
  properties of the pre-envelope, a complex function whose magnitude is the
  envelope of the real process. The autocovariance function of a
  non-wide-sense stationary process is a function of the time origin as well
  as of the time displacement, <math|\<tau\>>. By defining a
  <math|\<tau\>>-Hilbert transform of the autocovariance function as a
  Hilbert transform with respect to the variable <math|\<tau\>>, one obtains
  relationships between the real and imaginary parts of the pre-envelope
  which are similar to those obtained for wide-sense stationary processes.

  By defining a time-dependent spectral density as the Fourier transform,
  with respect to <math|\<tau\>>, of the time-dependent autocovariance
  function, one may describe a bandpass process (not wide-sense stationary)
  as one whose time-dependent spectral density has a bandpass character for
  all time. Then it becomes possible to write the autocovariance function of
  the real non-wide-sense stationary process in the same form as that for a
  wide-sense stationary process, i.e., in the form of a direct component plus
  a quadrature component, placing in evidence the covariance functions of the
  random modulation of a reference carrier.

  <\thebibliography|8>
    <bibitem|arens1957>R. Arens, \PComplex Processes for Envelopes of Normal
    Noise,\Q <em|IRE Trans. Info. Theory>, Vol. IT-3, No. 3, Sept. 1957, pp.
    204\U207.

    <bibitem|dugundji1958>J. Dugundji, \PEnvelopes and Pre-envelopes of Real
    Waveforms,\Q <em|IRE Trans. Info. Theory>, Vol. IT-4, No. 1, March 1958,
    pp. 53\U57.

    <bibitem|doob1953>J. L. Doob, <em|Stochastic Processes>, New York, John
    Wiley and Sons, 1953, pp. 94\U95.

    <bibitem|lampard1954>D. G. Lampard, \PGeneralization of the
    Wiener-Kintchine Theorem to Non-stationary Processes,\Q <em|J. Appl.
    Phys.>, Vol. 25, June 1954, pp. 802\U803.

    <bibitem|page1952>C. H. Page, \PInstantaneous Power Spectra,\Q <em|J.
    Appl. Physics>, Vol. 23, Jan. 1952, pp. 103\U106.

    <bibitem|kharkevich1960>A. A. Kharkevich, <em|Spectra and Analysis>,
    (Translated from the Russian), New York, Consultants Bureau (Publishers),
    1960; p. 21 et seq., p. 165 et seq.

    <bibitem|davenport1958>W. B. Davenport, Jr., W. L. Root, <em|An
    Introduction to the Theory of Random Signals and Noise>, New York,
    McGraw-Hill Co., 1958, pp. 158\U160, and Problem 10, p. 169.

    <bibitem|urkowitz1962>H. Urkowitz, \PHilbert Transforms of Band-pass
    Functions,\Q <em|Proc. IRE>, Vol. 50, 1962, p. 2143.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|4|5>>
    <associate|auto-5|<tuple|5|6>>
    <associate|auto-6|<tuple|5|7>>
    <associate|auto-7|<tuple|5|7>>
    <associate|bib-arens1957|<tuple|arens1957|7>>
    <associate|bib-davenport1958|<tuple|davenport1958|7>>
    <associate|bib-doob1953|<tuple|doob1953|7>>
    <associate|bib-dugundji1958|<tuple|dugundji1958|7>>
    <associate|bib-kharkevich1960|<tuple|kharkevich1960|7>>
    <associate|bib-lampard1954|<tuple|lampard1954|7>>
    <associate|bib-page1952|<tuple|page1952|7>>
    <associate|bib-urkowitz1962|<tuple|urkowitz1962|7>>
    <associate|def:autocovariance|<tuple|1|2>>
    <associate|def:crosscovariance|<tuple|2|2>>
    <associate|def:hilbert_covariance|<tuple|3|2>>
    <associate|eq:Ra|<tuple|22|5>>
    <associate|eq:Rac|<tuple|20|5>>
    <associate|eq:Rac_xc_xs|<tuple|28|5>>
    <associate|eq:Rc|<tuple|19|5>>
    <associate|eq:Rc_xc_xs|<tuple|27|5>>
    <associate|eq:autocov_bandpass|<tuple|18|5>>
    <associate|eq:autocovariance|<tuple|3|2>>
    <associate|eq:bandpass_decomp|<tuple|21|5>>
    <associate|eq:bandpass_spectrum|<tuple|17|4>>
    <associate|eq:covariance_expanded|<tuple|26|5>>
    <associate|eq:covariance_identity|<tuple|9|3>>
    <associate|eq:crosscov_hilbert|<tuple|6|2>>
    <associate|eq:crosscovariance|<tuple|4|2>>
    <associate|eq:energy_density|<tuple|15|4>>
    <associate|eq:ensemble_energy|<tuple|16|4>>
    <associate|eq:final_autocov|<tuple|30|6>>
    <associate|eq:hilbert_autocov_bandpass|<tuple|29|5>>
    <associate|eq:hilbert_covariance|<tuple|5|2>>
    <associate|eq:hilbert_cross|<tuple|7|3>>
    <associate|eq:hilbert_fourier|<tuple|13|4>>
    <associate|eq:hilbert_of_hilbert|<tuple|8|3>>
    <associate|eq:hilbert_transform|<tuple|1|1>>
    <associate|eq:hilbert_transform_alt|<tuple|2|2>>
    <associate|eq:preenvelope|<tuple|10|3>>
    <associate|eq:preenvelope_autocov|<tuple|11|3>>
    <associate|eq:preenvelope_spectrum|<tuple|14|4>>
    <associate|eq:tdspectrum|<tuple|12|3>>
    <associate|eq:y_bandpass|<tuple|31|6>>
    <associate|eq:z_bandpass|<tuple|32|6>>
    <associate|eq:zero_crosscov|<tuple|33|6>>
    <associate|thm:covariance_identity|<tuple|7|3>>
    <associate|thm:crosscov_hilbert|<tuple|4|2>>
    <associate|thm:hilbert_cross|<tuple|5|3>>
    <associate|thm:hilbert_of_hilbert|<tuple|6|3>>
    <associate|thm:zero_crosscov|<tuple|8|6>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      arens1957

      dugundji1958

      doob1953

      lampard1954

      page1952

      kharkevich1960

      urkowitz1962
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Covariances> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Time
      Dependent Spectral Densities> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Additional
      Covariance Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Conclusions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>