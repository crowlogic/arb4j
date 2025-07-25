<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Pre-envelopes of Nonstationary Bandpass
  Processes>|<doc-author|<author-data|<author-name|Harry
  Urkowitz>|<author-affiliation|Philco Scientific Laboratory, Blue Bell,
  Pa.>>>|<doc-date|>>

  <abstract-data|<\abstract>
    Many significant properties of pre-envelopes of real waveforms are shown
    to extend when the notion of pre-envelope is applied to random processes
    that are not wide-sense stationary. Specifically, if
    <math|x<around|(|t|)>> denotes a real random process which is not
    wide-sense stationary and <math|y<around|(|t|)>> is its Hilbert
    transform, then <math|x<around|(|t|)>> and <math|y<around|(|t|)>> possess
    the same autocovariance function and have zero crosscovariance at the
    same instant. The autocovariance function of the pre-envelope
    <math|z<around|(|t|)>>, given by <math|z<around|(|t|)>=x<around|(|t|)>+j*y<around|(|t|)>>,
    is twice the pre-envelope of the autocovariance function of
    <math|x<around|(|t|)>>.

    The introduction of a time-dependent power density spectrum enables a
    convenient interpretation of a bandpass random process not assumed to be
    wide-sense stationary. The classical form of the autocovariance function
    for a wide-sense stationary bandpass process generalizes, with minor
    modifications, to nonstationary processes.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Covariances>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Time-Dependent
    Spectral Densities> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
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

  where the integral is evaluated in the Cauchy principal value sense.

  The envelope of <math|x<around|(|t|)>> is defined as
  <math|<around|\||z<around|(|t|)>|\|>>. Dugundji derived a number of
  properties of time auto- and cross-correlations for real waveforms; these
  properties also apply to auto- and crosscovariances of wide-sense
  stationary random processes when time averages are replaced by ensemble
  averages. The present work demonstrates that analogous properties hold for
  nonstationary random processes as well, with particular emphasis on
  bandpass processes.

  <section|Covariances>

  The following alternative forms of<nbsp><eqref|eq:hilbert_transform> are
  also instrumental for subsequent analysis:

  <\equation>
    y<around|(|t|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x*<around|(|t+s|)>|s>*d*s=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x*<around|(|t-s|)>|s>*d*s<label|eq:hilbert_transform_alt>
  </equation>

  <\definition>
    <label|def:autocovariance>The <em|autocovariance function> of a
    complex-valued random process <math|z<around|(|t|)>> is defined as

    <\equation>
      R<rsub|z><around|(|t,\<tau\>|)>=\<bbb-E\>*<around|[|z<around|(|t|)>*z<rsup|\<ast\>>*<around|(|t-\<tau\>|)>|]><label|eq:autocovariance>
    </equation>

    where <math|z<rsup|\<ast\>>*<around|(|t-\<tau\>|)>> denotes the complex
    conjugate and <math|\<bbb-E\><around|[|\<cdummy\>|]>> denotes the
    statistical expectation over the ensemble of sample functions.
  </definition>

  In the special case that the process is wide-sense stationary,
  <math|R<rsub|z><around|(|t,\<tau\>|)>> depends only on the time difference
  <math|\<tau\>><nbsp><cite|doob1953>.

  <\definition>
    <label|def:crosscovariance>The <em|crosscovariance function> of two
    complex-valued random processes <math|z<around|(|t|)>> and
    <math|w<around|(|t|)>> is given by

    <\equation>
      R<rsub|z*w><around|(|t,\<tau\>|)>=\<bbb-E\>*<around|[|z<around|(|t|)>*w<rsup|\<ast\>>*<around|(|t-\<tau\>|)>|]><label|eq:crosscovariance>
    </equation>
  </definition>

  <\definition>
    <label|def:hilbert_covariance>The <math|\<tau\>>-Hilbert transform
    <math|<wide|R|^><around|(|t,\<tau\>|)>> of a covariance function
    <math|R<around|(|t,\<tau\>|)>> is defined as the Hilbert transform with
    integration carried out over the variable <math|\<tau\>>:

    <\equation>
      <wide|R|^><around|(|t,\<tau\>|)>=<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<around|(|t,s|)>|\<tau\>-s>*d*s=<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<around|(|t,\<tau\>+s|)>|s>*d*s<label|eq:hilbert_covariance>
    </equation>
  </definition>

  <\theorem>
    <label|thm:crosscov_hilbert>The crosscovariance function of
    <math|x<around|(|t|)>> and its Hilbert transform <math|y<around|(|t|)>>
    is the negative of the <math|\<tau\>>-Hilbert transform of the
    autocovariance function of <math|x<around|(|t|)>>:

    <\equation>
      R<rsub|x*y><around|(|t,\<tau\>|)>=-<wide|R|^><rsub|x><around|(|t,\<tau\>|)><label|eq:crosscov_hilbert>
    </equation>
  </theorem>

  <\proof>
    By the definition of covariance and linearity of the Hilbert transform,
    one has

    <\equation>
      R<rsub|x*y><around|(|t,\<tau\>|)>=\<bbb-E\>*<around|[|x<around|(|t|)>*y*<around|(|t-\<tau\>|)>|]>=\<bbb-E\>*<around*|[|x<around|(|t|)>\<cdot\><frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x<around|(|s|)>|t-\<tau\>-s>*d*s|]>
    </equation>

    By Fubini's theorem, the order of expectation and integration can be
    interchanged (assuming regularity conditions hold), yielding

    <\equation>
      R<rsub|x*y><around|(|t,\<tau\>|)>=<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|\<bbb-E\>*<around|[|x<around|(|t|)>*x<around|(|s|)>|]>|t-\<tau\>-s>*d*s=<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<rsub|x><around|(|t,t-s|)>|t-\<tau\>-s>*d*s
    </equation>

    Let <math|u=t-s>, then <math|s=t-u>, <math|d*s=-d*u>:

    <\equation>
      R<rsub|x*y><around|(|t,\<tau\>|)>=-<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<rsub|x><around|(|t,u|)>|\<tau\>-u>*d*u
    </equation>

    which is <math|-<wide|R|^><rsub|x><around|(|t,\<tau\>|)>>
    by<nbsp><eqref|eq:hilbert_covariance>.
  </proof>

  <\theorem>
    <label|thm:hilbert_cross>The <math|\<tau\>>-Hilbert transform of the
    crosscovariance <math|R<rsub|x*y><around|(|t,\<tau\>|)>> yields the
    negative of the reversed crosscovariance function:

    <\equation>
      <wide|R|^><rsub|x*y><around|(|t,\<tau\>|)>=-R<rsub|y*x><around|(|t,\<tau\>|)><label|eq:hilbert_cross>
    </equation>
  </theorem>

  <\proof>
    Via the definition of the Hilbert transform and the antisymmetry
    property:

    <\equation>
      <wide|R|^><rsub|x*y><around|(|t,\<tau\>|)>=<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<rsub|x*y><around|(|t,s|)>|\<tau\>-s>*d*s
    </equation>

    Now, <math|R<rsub|x*y><around|(|t,s|)>=-<wide|R|^><rsub|x><around|(|t,s|)>>
    (by Theorem<nbsp><reference|thm:crosscov_hilbert>), so

    <\equation>
      <wide|R|^><rsub|x*y><around|(|t,\<tau\>|)>=-<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<wide|R|^><rsub|x><around|(|t,s|)>|\<tau\>-s>*<space|0.17em>d*s
    </equation>

    But the Hilbert transform is an anti-involution, i.e.,
    <math|<wide|<wide|R|^>|^><rsub|x><around|(|t,\<tau\>|)>=-R<rsub|x><around|(|t,\<tau\>|)>>.
    Likewise, switching the roles of <math|x> and <math|y> and considering
    the anti-symmetry yields <math|-R<rsub|y*x><around|(|t,\<tau\>|)>> as the
    result.
  </proof>

  <\theorem>
    <label|thm:hilbert_of_hilbert>The Hilbert transform of the Hilbert
    transform of a function equals the negative of the original function:

    <\equation>
      <wide|<wide|R|^>|^><rsub|x><around|(|t,\<tau\>|)>=-R<rsub|x><around|(|t,\<tau\>|)><label|eq:hilbert_of_hilbert>
    </equation>
  </theorem>

  <\proof>
    This result follows from the well-known property of the Hilbert
    transform:

    <\equation*>
      \<cal-H\><rsup|2><around|{|f|}><around|(|t|)>=-f<around|(|t|)>
    </equation*>

    where <math|\<cal-H\>> is the Hilbert transform, provided <math|f>
    satisfies appropriate regularity and integrability
    conditions<nbsp><cite|davenport1958>. Applying the Hilbert transform in
    <math|\<tau\>> twice to <math|R<rsub|x><around|(|t,\<tau\>|)>> yields
    <math|-R<rsub|x><around|(|t,\<tau\>|)>>.
  </proof>

  From the definition of <math|z<around|(|t|)>> as the pre-envelope,

  <\equation>
    z<around|(|t|)>=x<around|(|t|)>+j*y<around|(|t|)><label|eq:preenvelope>
  </equation>

  one can expand the autocovariance as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|R<rsub|z><around|(|t,\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|z<around|(|t|)>*z<rsup|\<ast\>>*<around|(|t-\<tau\>|)>|]>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around|[|<around|(|x<around|(|t|)>+j*y<around|(|t|)>|)>*<around|(|x*<around|(|t-\<tau\>|)>-j*y*<around|(|t-\<tau\>|)>|)>|]>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around|[|x<around|(|t|)>*x*<around|(|t-\<tau\>|)>|]>+\<bbb-E\>*<around|[|y<around|(|t|)>*y*<around|(|t-\<tau\>|)>|]>>>|<row|<cell|>|<cell|<space|2em>+j*<around*|(|\<bbb-E\>*<around|[|y<around|(|t|)>*x*<around|(|t-\<tau\>|)>|]>-\<bbb-E\>*<around|[|x<around|(|t|)>*y*<around|(|t-\<tau\>|)>|]>|)>>>>>>
  </equation>

  Since the Hilbert transform is a linear phase shifter in the frequency
  domain, the autocovariance of <math|y> equals that of <math|x>, while the
  cross terms are related to the Hilbert transform, as previous theorems
  state.

  Thus one concludes the following result:

  <\theorem>
    <label|thm:preenvelope_covariance>The autocovariance function of the
    pre-envelope <math|z<around|(|t|)>> is

    <\equation>
      R<rsub|z><around|(|t,\<tau\>|)>=2*<around*|[|R<rsub|x><around|(|t,\<tau\>|)>+j*<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|]><label|eq:preenvelope_autocov>
    </equation>

    where <math|R<rsub|x><around|(|t,\<tau\>|)>> is the autocovariance of
    <math|x<around|(|\<cdummy\>|)>> and <math|<wide|R|^><rsub|x><around|(|t,\<tau\>|)>>
    its <math|\<tau\>>-Hilbert transform.
  </theorem>

  <\proof>
    As above, by noting that\ 

    <\equation>
      \<bbb-E\>*<around|[|x<around|(|t|)>*x*<around|(|t-\<tau\>|)>|]>=R<rsub|x><around|(|t,\<tau\>|)>
    </equation>

    <\equation>
      \<bbb-E\>*<around|[|y<around|(|t|)>*y*<around|(|t-\<tau\>|)>|]>=R<rsub|y><around|(|t,\<tau\>|)>=R<rsub|x><around|(|t,\<tau\>|)>
    </equation>

    <\equation>
      \<bbb-E\>*<around|[|x<around|(|t|)>*y*<around|(|t-\<tau\>|)>|]>=R<rsub|x*y><around|(|t,\<tau\>|)>=-<wide|R|^><rsub|x><around|(|t,\<tau\>|)>
    </equation>

    <\equation>
      \<bbb-E\>*<around|[|y<around|(|t|)>*x*<around|(|t-\<tau\>|)>|]>=R<rsub|y*x><around|(|t,\<tau\>|)>=<wide|R|^><rsub|x><around|(|t,\<tau\>|)>
    </equation>

    and thus

    <\equation>
      <tabular|<tformat|<table|<row|<cell|R<rsub|z><around|(|t,\<tau\>|)>>|<cell|=R<rsub|x><around|(|t,\<tau\>|)>+R<rsub|x><around|(|t,\<tau\>|)>+j*<around*|(|<wide|R|^><rsub|x><around|(|t,\<tau\>|)>-<around|(|-<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|)>|)>>>|<row|<cell|>|<cell|=2*R<rsub|x><around|(|t,\<tau\>|)>+2*j*<wide|R|^><rsub|x><around|(|t,\<tau\>|)>>>>>>
    </equation>
  </proof>

  <section|Time-Dependent Spectral Densities>

  Following Lampard<nbsp><cite|lampard1954>, the time-dependent power density
  spectrum <math|S<rsub|x><around|(|\<omega\>,t|)>> of the random process
  <math|x<around|(|t|)>> is defined via the Fourier transform (over
  <math|\<tau\>>) of the autocovariance function:

  <\equation>
    S<rsub|x><around|(|\<omega\>,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<rsub|x><around|(|t,\<tau\>|)>*e<rsup|-j*\<omega\>*\<tau\>>*d*\<tau\><label|eq:tdspectrum>
  </equation>

  Similarly, the spectrum of the pre-envelope <math|z<around|(|t|)>> is
  obtained from its autocovariance. Employing the properties of the Hilbert
  transform under Fourier transformation, one obtains:

  <\equation>
    \<cal-F\><rsub|\<tau\>><around|[|R<rsub|z><around|(|t,\<tau\>|)>|]>=<choice|<tformat|<table|<row|<cell|4*S<rsub|x><around|(|\<omega\>,t|)>>|<cell|\<omega\>\<gtr\>0>>|<row|<cell|2*S<rsub|x><around|(|0,t|)>>|<cell|\<omega\>=0>>|<row|<cell|0,>|<cell|\<omega\>\<less\>0>>>>><label|eq:preenvelope_spectrum>
  </equation>

  where <math|\<cal-F\><rsub|\<tau\>>> denotes the Fourier transform in the
  variable <math|\<tau\>>

  Note from<nbsp><eqref|eq:preenvelope_autocov>:

  <\equation*>
    R<rsub|z><around|(|t,\<tau\>|)>=2*<around*|[|R<rsub|x><around|(|t,\<tau\>|)>+j*<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|]>
  </equation*>

  Taking the Fourier transform in <math|\<tau\>>, the Hilbert transform in
  <math|\<tau\>> corresponds to multiplying the spectrum by
  <math|-j<math-up|sgn><around|(|\<omega\>|)>>, where
  <math|<math-up|sgn><around|(|\<omega\>|)>> denotes the sign function:

  <\equation>
    \<cal-F\><rsub|\<tau\>><around|[|<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|]>=-j<math-up|sgn><around|(|\<omega\>|)>*S<rsub|x><around|(|\<omega\>,t|)>
  </equation>

  Thus the spectrum becomes:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|S<rsub|z><around|(|\<omega\>,t|)>>|<cell|=2*<around*|[|S<rsub|x><around|(|\<omega\>,t|)>+j*<around|(|-j<math-up|sgn><around|(|\<omega\>|)>*S<rsub|x><around|(|\<omega\>,t|)>|)>|]>>>|<row|<cell|>|<cell|=2*<around*|[|S<rsub|x><around|(|\<omega\>,t|)>+<math-up|sgn><around|(|\<omega\>|)>*S<rsub|x><around|(|\<omega\>,t|)>|]>>>|<row|<cell|>|<cell|=2*S<rsub|x><around|(|\<omega\>,t|)>*<around*|[|1+<math-up|sgn><around|(|\<omega\>|)>|]>>>>>>
  </equation>

  For <math|\<omega\>\<gtr\>0>, <math|<math-up|sgn><around|(|\<omega\>|)>=1>,
  giving <math|S<rsub|z><around|(|\<omega\>,t|)>=4*S<rsub|x><around|(|\<omega\>,t|)>>.
  For <math|\<omega\>\<less\>0>, <math|<math-up|sgn><around|(|\<omega\>|)>=-1>,
  giving <math|S<rsub|z><around|(|\<omega\>,t|)>=0>. For <math|\<omega\>=0>
  the value is <math|2*S<rsub|x><around|(|0,t|)>>

  The instantaneous spectrum concept developed by Page<nbsp><cite|page1952>
  and Kharkevich<nbsp><cite|kharkevich1960> provides a physical
  interpretation: for an individual sample function, the energy density in
  time and frequency can be described by an instantaneous energy spectrum
  <math|p<around|(|t,f|)>>, such that the energy in the time interval
  <math|<around|(|t<rsub|1>,t<rsub|2>|)>> and frequency interval
  <math|<around|(|f<rsub|1>,f<rsub|2>|)>> is given by

  <\equation>
    <big|int><rsub|t<rsub|1>><rsup|t<rsub|2>><big|int><rsub|f<rsub|1>><rsup|f<rsub|2>>p<around|(|t,f|)>*<space|0.17em>d*f*<space|0.17em>d*t
  </equation>

  Taking the ensemble average yields the time-dependent power spectrum:

  <\equation>
    \<bbb-E\><around|[|p<around|(|t,\<omega\>|)>|]>=S<rsub|x><around|(|\<omega\>,t|)>
  </equation>

  where <math|\<omega\>=2*\<pi\>*f>

  <no-indent>This provides a natural way to characterize bandpass random
  processes even in the absence of stationarity: a process is bandpass if
  <math|S<rsub|x><around|(|\<omega\>,t|)>> exhibits the bandpass property for
  all <math|t>. A reference frequency <math|f<rsub|0>> (or
  <math|\<omega\><rsub|c>=2*\<pi\>*f<rsub|0>>) may be chosen near the band
  centre, so as to allow the decomposition:

  <\equation>
    S<rsub|x><around|(|\<omega\>,t|)>=S<rsub|c><around|(|\<omega\>-\<omega\><rsub|c>,t|)>+S<rsub|c><around|(|-\<omega\>-\<omega\><rsub|c>,t|)><label|eq:bandpass_spectrum>
  </equation>

  where the function <math|S<rsub|c><around|(|\<omega\>,t|)>> is concentrated
  near <math|\<omega\>=0>. Although <math|S<rsub|x><around|(|\<omega\>,t|)>>
  need not be an even function of <math|\<omega\>>, this decomposition is
  always possible for a bandpass process; <math|\<omega\><rsub|c>> need not
  lie strictly within the band.

  Applying the Fourier inversion to <math|S<rsub|x><around|(|\<omega\>,t|)>>
  gives the autocovariance function:

  <\align>
    <tformat|<table|<row|<cell|R<rsub|x><around|(|t,\<tau\>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|x><around|(|\<omega\>,t|)>*e<rsup|j*\<omega\>*\<tau\>>*d*\<omega\>>>|<row|<cell|>|<cell|=R<rsub|c><around|(|t,\<tau\>|)>*cos
    <around|(|\<omega\><rsub|c>*\<tau\>|)>+R<rsub|a*c><around|(|t,\<tau\>|)>*sin
    <around|(|\<omega\><rsub|c>*\<tau\>|)><eq-number><label|eq:autocov_bandpass>>>>>
  </align>

  where

  <\align>
    <tformat|<table|<row|<cell|R<rsub|c><around|(|t,\<tau\>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|c><around|(|\<omega\>,t|)>*cos
    <around|(|\<omega\>*\<tau\>|)>*d*\<omega\><eq-number><label|eq:Rc>>>|<row|<cell|R<rsub|a*c><around|(|t,\<tau\>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|c><around|(|\<omega\>,t|)>*sin
    <around|(|\<omega\>*\<tau\>|)>*d*\<omega\><eq-number><label|eq:Rac>>>>>
  </align>

  <section|Additional Covariance Properties>

  The real bandpass process <math|x<around|(|t|)>> can be represented as:

  <\equation>
    x<around|(|t|)>=x<rsub|c><around|(|t|)>*cos
    <around|(|\<omega\><rsub|c>*t|)>+x<rsub|s><around|(|t|)>*sin
    <around|(|\<omega\><rsub|c>*t|)><label|eq:bandpass_decomp>
  </equation>

  where <math|x<rsub|c><around|(|t|)>> is the in-phase (cosine) component and
  <math|x<rsub|s><around|(|t|)>> is the quadrature (sine) component, each a
  real random process with (generally) time-dependent covariance.

  The autocovariance function is:

  <\equation>
    R<rsub|x><around|(|t,\<tau\>|)>=\<bbb-E\>*<around|[|x<around|(|t|)>*x*<around|(|t-\<tau\>|)>|]>
  </equation>

  Substituting <eqref|eq:bandpass_decomp> and using properties of
  covariances, it is found that:

  <\align>
    <tformat|<table|<row|<cell|2*R<rsub|x><around|(|t,\<tau\>|)>=>|<cell|\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]>*<around*|[|cos
    <around*|(|\<omega\><rsub|c>*\<tau\>|)>+cos
    <around*|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|+\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]>*<around*|[|cos
    <around*|(|\<omega\><rsub|c>*\<tau\>|)>-cos
    <around*|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|+\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]>*<around*|[|sin
    <around*|(|\<omega\><rsub|c>*\<tau\>|)>+sin
    <around*|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|-\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]>*<around*|[|sin
    <around*|(|\<omega\><rsub|c>*\<tau\>|)>-sin
    <around*|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number><label|eq:covariance_expanded>>>>>
  </align>

  By comparison with <eqref|eq:autocov_bandpass>, the following identities
  must hold:

  <\align>
    <tformat|<table|<row|<cell|R<rsub|c><around|(|t,\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]>=\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]><eq-number><label|eq:Rc_xc_xs>>>|<row|<cell|R<rsub|a*c><around|(|t,\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]>=-\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]><eq-number><label|eq:Rac_xc_xs>>>>>
  </align>

  This reflects the symmetry properties of the covariance functions for
  <math|x<rsub|c>> and <math|x<rsub|s>> in the decomposition.

  <\remark>
    For <math|R<rsub|c><around|(|t,\<tau\>|)>> and
    <math|R<rsub|a*c><around|(|t,\<tau\>|)>> to represent the in-phase and
    quadrature covariance functions of a bandpass process, it suffices that
    the bandwidth of <math|x<around|(|t|)>> is much less than the carrier
    frequency <math|\<omega\><rsub|c>>, so that
    <math|x<rsub|c><around|(|t|)>> and <math|x<rsub|s><around|(|t|)>> vary
    slowly compared to <math|\<omega\><rsub|c>>.
  </remark>

  An alternative expression for the autocovariance of the pre-envelope
  <math|z<around|(|t|)>>, using these real and quadrature components, is
  given by

  <\equation>
    R<rsub|z><around|(|t,\<tau\>|)>=2*<around*|[|R<rsub|c><around|(|t,\<tau\>|)>+j*R<rsub|a*c><around|(|t,\<tau\>|)>|]>*e<rsup|j*\<omega\><rsub|c>*\<tau\>><label|eq:final_autocov>
  </equation>

  <\proof>
    By substituting <math|z<around|(|t|)>=<around|[|x<rsub|c><around|(|t|)>+j*x<rsub|s><around|(|t|)>|]>*e<rsup|j*\<omega\><rsub|c>*t>>
    from the decomposition into the definition of the autocovariance, and
    using the properties in<nbsp><eqref|eq:Rc_xc_xs>
    and<nbsp><eqref|eq:Rac_xc_xs>, as well as the orthogonality between
    <math|x<rsub|c>> and <math|x<rsub|s>>, this result follows after
    simplification of trigonometric identities.
  </proof>

  The Hilbert transform of <math|R<rsub|z><around|(|t,\<tau\>|)>> can be
  directly obtained as

  <\equation>
    <wide|R|^><rsub|z><around|(|t,\<tau\>|)>=R<rsub|c><around|(|t,\<tau\>|)>*sin
    <around|(|\<omega\><rsub|c>*\<tau\>|)>+R<rsub|a*c><around|(|t,\<tau\>|)>*cos
    <around|(|\<omega\><rsub|c>*\<tau\>|)><label|eq:hilbert_autocov_bandpass>
  </equation>

  provided the bandwidth condition stated earlier is satisfied
  (cf.<nbsp><cite|urkowitz1962>).

  <\theorem>
    <label|thm:zero_crosscov>The real process <math|x<around|(|t|)>> and its
    Hilbert transform <math|y<around|(|t|)>> have zero cross-covariance at
    the same time instant:

    <\equation>
      R<rsub|x*y><around|(|t,0|)>=0<label|eq:zero_crosscov>
    </equation>
  </theorem>

  <\proof>
    From Theorem<nbsp><reference|thm:crosscov_hilbert>,
    <math|R<rsub|x*y><around|(|t,0|)>=-<wide|R|^><rsub|x><around|(|t,0|)>>.
    Now, <math|<wide|R|^><rsub|x><around|(|t,0|)>> vanishes for any function
    whose spectrum is entirely positive or negative, and in particular for
    band-limited signals centered away from zero, since the Hilbert transform
    of an even function at zero argument is zero. More directly, using
    equations<nbsp><eqref|eq:Rac> and<nbsp><eqref|eq:Rac_xc_xs> at
    <math|\<tau\>=0>,

    <\equation*>
      R<rsub|a*c><around|(|t,0|)>=\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|s><around|(|t|)>|]>
    </equation*>

    but <math|x<rsub|c>> and <math|x<rsub|s>> are uncorrelated for all
    <math|t> (since the original process is real and bandpass). Therefore,

    <\equation*>
      R<rsub|x*y><around|(|t,0|)>=-R<rsub|a*c><around|(|t,0|)>=0
    </equation*>
  </proof>

  <section|Conclusions>

  The properties of real bandpass random processes may be compactly described
  by the properties of the pre-envelope, a complex process whose modulus is
  the envelope of the real process. For non-wide-sense stationary processes,
  the autocovariance depends on both time origin and displacement. Defining
  the <math|\<tau\>>-Hilbert transform of the autocovariance function yields
  relationships between the real and imaginary components of the pre-envelope
  analogous to those in the stationary case.

  By establishing the time-dependent spectral density as the Fourier
  transform (in the time difference variable) of the autocovariance, a
  bandpass process\Vregardless of stationarity\Vcan be characterized as one
  whose time-dependent spectrum exhibits bandpass characteristics for all
  <math|t>. The autocovariance function of the real non-wide-sense stationary
  process can thus be cast in the same form as in the stationary case: a sum
  of direct and quadrature components, manifesting the covariance functions
  of the underlying random envelope modulation.

  <section*|References>

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
    <associate|auto-3|<tuple|3|5>>
    <associate|auto-4|<tuple|4|6>>
    <associate|auto-5|<tuple|5|8>>
    <associate|auto-6|<tuple|5|8>>
    <associate|auto-7|<tuple|5|8>>
    <associate|bib-arens1957|<tuple|arens1957|8>>
    <associate|bib-davenport1958|<tuple|davenport1958|8>>
    <associate|bib-doob1953|<tuple|doob1953|8>>
    <associate|bib-dugundji1958|<tuple|dugundji1958|8>>
    <associate|bib-kharkevich1960|<tuple|kharkevich1960|8>>
    <associate|bib-lampard1954|<tuple|lampard1954|8>>
    <associate|bib-page1952|<tuple|page1952|8>>
    <associate|bib-urkowitz1962|<tuple|urkowitz1962|8>>
    <associate|def:autocovariance|<tuple|1|2>>
    <associate|def:crosscovariance|<tuple|2|2>>
    <associate|def:hilbert_covariance|<tuple|3|2>>
    <associate|eq:Rac|<tuple|31|6>>
    <associate|eq:Rac_xc_xs|<tuple|39|7>>
    <associate|eq:Rc|<tuple|30|6>>
    <associate|eq:Rc_xc_xs|<tuple|38|7>>
    <associate|eq:autocov_bandpass|<tuple|29|6>>
    <associate|eq:autocovariance|<tuple|3|2>>
    <associate|eq:bandpass_decomp|<tuple|32|6>>
    <associate|eq:bandpass_spectrum|<tuple|28|6>>
    <associate|eq:covariance_expanded|<tuple|37|7>>
    <associate|eq:crosscov_hilbert|<tuple|6|2>>
    <associate|eq:crosscovariance|<tuple|4|2>>
    <associate|eq:final_autocov|<tuple|40|7>>
    <associate|eq:hilbert_autocov_bandpass|<tuple|41|7>>
    <associate|eq:hilbert_covariance|<tuple|5|2>>
    <associate|eq:hilbert_cross|<tuple|10|3>>
    <associate|eq:hilbert_of_hilbert|<tuple|13|3>>
    <associate|eq:hilbert_transform|<tuple|1|1>>
    <associate|eq:hilbert_transform_alt|<tuple|2|2>>
    <associate|eq:preenvelope|<tuple|14|4>>
    <associate|eq:preenvelope_autocov|<tuple|16|4>>
    <associate|eq:preenvelope_spectrum|<tuple|23|5>>
    <associate|eq:tdspectrum|<tuple|22|5>>
    <associate|eq:zero_crosscov|<tuple|42|7>>
    <associate|thm:crosscov_hilbert|<tuple|4|2>>
    <associate|thm:hilbert_cross|<tuple|5|3>>
    <associate|thm:hilbert_of_hilbert|<tuple|6|3>>
    <associate|thm:preenvelope_covariance|<tuple|7|4>>
    <associate|thm:zero_crosscov|<tuple|9|7>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      arens1957

      dugundji1958

      doob1953

      davenport1958

      lampard1954

      page1952

      kharkevich1960

      urkowitz1962
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Covariances>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Time-Dependent
      Spectral Densities> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
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