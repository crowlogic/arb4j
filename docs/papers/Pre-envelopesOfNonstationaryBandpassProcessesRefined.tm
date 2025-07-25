<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Pre-envelopes of Nonstationary Bandpass
  Processes>|<doc-author|<author-data|<author-name|Harry
  Urkowitz>|<author-affiliation|Philco Scientific Laboratory, Blue Bell,
  Pa.>>>>

  <\abstract>
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
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Mathematical
    Preliminaries> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Covariance
    Functions and Their Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Fundamental Theorems
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Time-Dependent
    Spectral Densities> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Physical
    Interpretation and Instantaneous Spectra>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Bandpass
    Random Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|6.1<space|2spc>Quadrature Representation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Hilbert
    Transform of Bandpass Autocovariance>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Zero
    Cross-covariance Property> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  As defined by Arens<nbsp><cite|arens1957> and
  Dugundji<nbsp><cite|dugundji1958>, the <em|pre-envelope> of a real waveform
  <math|x<around|(|t|)>> is the complex-valued function
  <math|z<around|(|t|)>> whose real part is <math|x<around|(|t|)>> and whose
  imaginary part is <math|y<around|(|t|)>>, the Hilbert transform of
  <math|x<around|(|t|)>>. The Hilbert transform is defined as:

  <\equation>
    y<around|(|t|)>=\<cal-H\><around|[|x<around|(|t|)>|]>=<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x<around|(|s|)>|t-s>*d*s<label|eq:hilbert_transform>
  </equation>

  where P.V. denotes the Cauchy principal value of the integral.

  The envelope of <math|x<around|(|t|)>> is defined as
  <math|<around|\||z<around|(|t|)>|\|>>. Dugundji has derived a number of
  interesting properties for the time auto- and cross-correlations of real
  waveforms. The same properties hold for auto- and crosscovariances of
  wide-sense stationary random processes by replacing time averages by
  ensemble averages. In this paper it is shown that similar results hold for
  nonstationary random processes. The particular interest lies in bandpass
  processes.

  The fundamental motivation for studying pre-envelopes of nonstationary
  processes stems from their application in communication theory, radar
  signal processing, and general signal analysis where the assumption of
  stationarity is often violated in practice.

  <section|Mathematical Preliminaries>

  Before proceeding with the main results, it is necessary to establish the
  mathematical framework and conventions that will be used throughout this
  work.

  <\definition>
    [Hilbert Transform]<label|def:hilbert>For a function
    <math|f<around|(|t|)>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>, the Hilbert
    transform is defined as

    <\equation>
      \<cal-H\><around|[|f<around|(|t|)>|]>=<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|f<around|(|s|)>|t-s>*d*s
    </equation>

    where the integral exists in the principal value sense.
  </definition>

  Alternative forms of the Hilbert transform that will prove useful are:

  <\equation>
    y<around|(|t|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x*<around|(|t+s|)>|-s>*d*s=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x*<around|(|t-s|)>|s>*d*s<label|eq:hilbert_transform_alt>
  </equation>

  <\definition>
    [Pre-envelope]<label|def:preenvelope>The pre-envelope of a real-valued
    function <math|x<around|(|t|)>> is the complex-valued function

    <\equation>
      z<around|(|t|)>=x<around|(|t|)>+j*\<cal-H\><around|[|x<around|(|t|)>|]>=x<around|(|t|)>+j*y<around|(|t|)>
    </equation>
  </definition>

  <section|Covariance Functions and Their Properties>

  <\definition>
    [Autocovariance Function]<label|def:autocovariance>The autocovariance
    function of a complex-valued random process <math|z<around|(|t|)>> is
    given by

    <\equation>
      R<rsub|z><around|(|t,\<tau\>|)>=\<bbb-E\>*<around|[|z<around|(|t|)>*z<rsup|\<ast\>>*<around|(|t-\<tau\>|)>|]><label|eq:autocovariance>
    </equation>

    where <math|z<rsup|\<ast\>>> denotes the complex conjugate and
    <math|\<bbb-E\><around|[|\<cdummy\>|]>> denotes the expectation operator.
  </definition>

  <\remark>
    In the special case of a wide-sense stationary process, the
    autocovariance function depends only on <math|\<tau\>>, the time
    displacement<nbsp><cite|doob1953>.
  </remark>

  <\definition>
    [Crosscovariance Function]<label|def:crosscovariance>The crosscovariance
    function of two complex-valued random processes <math|z<around|(|t|)>>
    and <math|w<around|(|t|)>> is given by

    <\equation>
      R<rsub|z*w><around|(|t,\<tau\>|)>=\<bbb-E\>*<around|[|z<around|(|t|)>*w<rsup|\<ast\>>*<around|(|t-\<tau\>|)>|]><label|eq:crosscovariance>
    </equation>
  </definition>

  <\definition>
    [<math|\<tau\>>-Hilbert Transform]<label|def:hilbert_covariance>The
    <math|\<tau\>>-Hilbert transform <math|<wide|R|^><around|(|t,\<tau\>|)>>
    of a covariance function <math|R<around|(|t,\<tau\>|)>> is the Hilbert
    transform with the integration performed over <math|\<tau\>>:

    <\equation>
      <wide|R|^><around|(|t,\<tau\>|)>=<frac|1|\<pi\>>*<with|math-font-family|rm|P.V.>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<around|(|t,s|)>|\<tau\>-s>*d*s=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<around|(|t,\<tau\>+s|)>|s>*d*s<label|eq:hilbert_covariance>
    </equation>
  </definition>

  <subsection|Fundamental Theorems>

  <\theorem>
    [Cross-covariance Hilbert Relationship]<label|thm:crosscov_hilbert>The
    crosscovariance function of <math|x<around|(|t|)>> and
    <math|y<around|(|t|)>> is the negative of the <math|\<tau\>>-Hilbert
    transform of the autocovariance function of <math|x<around|(|t|)>>:

    <\equation>
      R<rsub|x*y><around|(|t,\<tau\>|)>=-<wide|R|^><rsub|x><around|(|t,\<tau\>|)><label|eq:crosscov_hilbert>
    </equation>
  </theorem>

  <\proof>
    Starting from the definition of the crosscovariance function:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|x*y><around|(|t,\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|x<around|(|t|)>*y<rsup|\<ast\>>*<around|(|t-\<tau\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around*|[|x<around|(|t|)>\<cdot\><frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|x*<around|(|t-\<tau\>-s|)>|s>*d*s|]><eq-number>>>>>
    </align>

    By the linearity of expectation and assuming the interchange of
    expectation and integration is valid (which holds under suitable
    regularity conditions):

    <\align>
      <tformat|<table|<row|<cell|R<rsub|x*y><around|(|t,\<tau\>|)>>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|\<bbb-E\>*<around|[|x<around|(|t|)>*x*<around|(|t-\<tau\>-s|)>|]>|s>*d*s<eq-number>>>|<row|<cell|>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<rsub|x><around|(|t,\<tau\>+s|)>|s>*d*s<eq-number>>>>>
    </align>

    Making the substitution <math|u=\<tau\>+s>, so <math|s=u-\<tau\>> and
    <math|d*s=d*u>:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|x*y><around|(|t,\<tau\>|)>>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<rsub|x><around|(|t,u|)>|u-\<tau\>>*d*u<eq-number>>>|<row|<cell|>|<cell|=-<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|R<rsub|x><around|(|t,u|)>|\<tau\>-u>*d*u<eq-number>>>|<row|<cell|>|<cell|=-<wide|R|^><rsub|x><around|(|t,\<tau\>|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Hilbert Transform of Cross-covariance]<label|thm:hilbert_cross>The
    <math|\<tau\>>-Hilbert transform of the crosscovariance function
    satisfies:

    <\equation>
      <wide|R|^><rsub|x*y><around|(|t,\<tau\>|)>=R<rsub|x><around|(|t,\<tau\>|)><label|eq:hilbert_cross>
    </equation>
  </theorem>

  <\proof>
    From Theorem<nbsp><reference|thm:crosscov_hilbert>, we have
    <math|R<rsub|x*y><around|(|t,\<tau\>|)>=-<wide|R|^><rsub|x><around|(|t,\<tau\>|)>>.
    Taking the <math|\<tau\>>-Hilbert transform of both sides:

    <\align>
      <tformat|<table|<row|<cell|<wide|R|^><rsub|x*y><around|(|t,\<tau\>|)>>|<cell|=-<wide|<wide|R|^>|^><rsub|x><around|(|t,\<tau\>|)><eq-number>>>>>
    </align>

    Using the fundamental property of Hilbert transforms that
    <math|\<cal-H\><around|[|\<cal-H\><around|[|f<around|(|t|)>|]>|]>=-f<around|(|t|)>>
    for suitable functions <math|f>:

    <\align>
      <tformat|<table|<row|<cell|<wide|R|^><rsub|x*y><around|(|t,\<tau\>|)>>|<cell|=-<around|(|-R<rsub|x><around|(|t,\<tau\>|)>|)>=R<rsub|x><around|(|t,\<tau\>|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Double Hilbert Transform]<label|thm:hilbert_of_hilbert>The
    <math|\<tau\>>-Hilbert transform applied twice yields:

    <\equation>
      <wide|<wide|R|^>|^><rsub|x><around|(|t,\<tau\>|)>=-R<rsub|x><around|(|t,\<tau\>|)><label|eq:hilbert_of_hilbert>
    </equation>
  </theorem>

  <\proof>
    This follows directly from the fundamental property of Hilbert
    transforms. For a function <math|f<around|(|\<tau\>|)>> that satisfies
    appropriate regularity conditions, <math|\<cal-H\><around|[|\<cal-H\><around|[|f<around|(|\<tau\>|)>|]>|]>=-f<around|(|\<tau\>|)>>.
    Applied to the covariance function <math|R<rsub|x><around|(|t,\<tau\>|)>>
    viewed as a function of <math|\<tau\>>, this gives the desired result.
  </proof>

  <\corollary>
    [Symmetry Properties]<label|cor:symmetry>The following symmetry
    relationships hold:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|y*x><around|(|t,\<tau\>|)>>|<cell|=-R<rsub|x*y><around|(|t,-\<tau\>|)><eq-number><label|eq:cross_symmetry>>>|<row|<cell|R<rsub|y><around|(|t,\<tau\>|)>>|<cell|=R<rsub|x><around|(|t,\<tau\>|)><eq-number><label|eq:auto_symmetry>>>>>
    </align>
  </corollary>

  <\proof>
    For equation<nbsp><eqref|eq:cross_symmetry>:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|y*x><around|(|t,\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|y<around|(|t|)>*x*<around|(|t-\<tau\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around|[|x*<around|(|t-\<tau\>|)>*y<around|(|t|)>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around|[|x*<around|(|t-\<tau\>|)>*y<rsup|\<ast\>><around|(|t|)>|]><rsup|\<ast\>><eq-number>>>|<row|<cell|>|<cell|=R<rsub|x*y><rsup|\<ast\>><around|(|t,-\<tau\>|)><eq-number>>>>>
    </align>

    Since <math|x<around|(|t|)>> and <math|y<around|(|t|)>> are real-valued,
    <math|R<rsub|x*y><around|(|t,\<tau\>|)>> is real, so
    <math|R<rsub|x*y><rsup|\<ast\>><around|(|t,-\<tau\>|)>=R<rsub|x*y><around|(|t,-\<tau\>|)>>.
    However, from Theorem<nbsp><reference|thm:crosscov_hilbert>,
    <math|R<rsub|x*y><around|(|t,\<tau\>|)>=-<wide|R|^><rsub|x><around|(|t,\<tau\>|)>>,
    and using properties of the Hilbert transform, one can show that
    <math|R<rsub|y*x><around|(|t,\<tau\>|)>=-R<rsub|x*y><around|(|t,-\<tau\>|)>>.

    For equation<nbsp><eqref|eq:auto_symmetry>, this follows from the fact
    that <math|y<around|(|t|)>=\<cal-H\><around|[|x<around|(|t|)>|]>> and the
    isometric property of the Hilbert transform on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>.
  </proof>

  <\theorem>
    [Pre-envelope Autocovariance]<label|thm:preenvelope_autocov>The
    autocovariance function of the pre-envelope
    <math|z<around|(|t|)>=x<around|(|t|)>+j*y<around|(|t|)>> is given by:

    <\equation>
      R<rsub|z><around|(|t,\<tau\>|)>=2*<around*|[|R<rsub|x><around|(|t,\<tau\>|)>+j*<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|]><label|eq:preenvelope_autocov>
    </equation>
  </theorem>

  <\proof>
    From the definition of <math|z<around|(|t|)>> and the autocovariance
    function:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|z><around|(|t,\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|z<around|(|t|)>*z<rsup|\<ast\>>*<around|(|t-\<tau\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around|[|<around|(|x<around|(|t|)>+j*y<around|(|t|)>|)>*<around|(|x*<around|(|t-\<tau\>|)>-j*y*<around|(|t-\<tau\>|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around|[|x<around|(|t|)>*x*<around|(|t-\<tau\>|)>|]>+j*\<bbb-E\>*<around|[|y<around|(|t|)>*x*<around|(|t-\<tau\>|)>|]><eq-number>>>|<row|<cell|>|<cell|<space|1em>-j*\<bbb-E\>*<around|[|x<around|(|t|)>*y*<around|(|t-\<tau\>|)>|]>+\<bbb-E\>*<around|[|y<around|(|t|)>*y*<around|(|t-\<tau\>|)>|]><eq-number>>>>>
    </align>

    Using the results from previous theorems:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|z><around|(|t,\<tau\>|)>>|<cell|=R<rsub|x><around|(|t,\<tau\>|)>+j*R<rsub|y*x><around|(|t,\<tau\>|)>-j*R<rsub|x*y><around|(|t,\<tau\>|)>+R<rsub|y><around|(|t,\<tau\>|)><eq-number>>>|<row|<cell|>|<cell|=R<rsub|x><around|(|t,\<tau\>|)>+j*<around|(|-R<rsub|x*y><around|(|t,-\<tau\>|)>|)>-j*R<rsub|x*y><around|(|t,\<tau\>|)>+R<rsub|x><around|(|t,\<tau\>|)><eq-number>>>|<row|<cell|>|<cell|=2*R<rsub|x><around|(|t,\<tau\>|)>+j*<around|(|R<rsub|x*y><around|(|t,-\<tau\>|)>-R<rsub|x*y><around|(|t,\<tau\>|)>|)><eq-number>>>>>
    </align>

    From Theorem<nbsp><reference|thm:crosscov_hilbert>,
    <math|R<rsub|x*y><around|(|t,\<tau\>|)>=-<wide|R|^><rsub|x><around|(|t,\<tau\>|)>>,
    and using properties of the Hilbert transform:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|z><around|(|t,\<tau\>|)>>|<cell|=2*R<rsub|x><around|(|t,\<tau\>|)>+j*<around|(|-<wide|R|^><rsub|x><around|(|t,-\<tau\>|)>-<around|(|-<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|)>|)><eq-number>>>|<row|<cell|>|<cell|=2*R<rsub|x><around|(|t,\<tau\>|)>+j*<around|(|<wide|R|^><rsub|x><around|(|t,\<tau\>|)>-<wide|R|^><rsub|x><around|(|t,-\<tau\>|)>|)><eq-number>>>|<row|<cell|>|<cell|=2*R<rsub|x><around|(|t,\<tau\>|)>+2*j*<wide|R|^><rsub|x><around|(|t,\<tau\>|)><eq-number>>>|<row|<cell|>|<cell|=2*<around|[|R<rsub|x><around|(|t,\<tau\>|)>+j*<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|]><eq-number>>>>>
    </align>

    where the last step uses the odd symmetry property of the Hilbert
    transform.
  </proof>

  <section|Time-Dependent Spectral Densities>

  Following Lampard<nbsp><cite|lampard1954>, the concept of time-dependent
  power spectral density provides a framework for analyzing nonstationary
  processes in the frequency domain.

  <\definition>
    [Time-Dependent Power Spectral Density]<label|def:tdspectrum>The
    time-dependent power density spectrum
    <math|S<rsub|x><around|(|\<omega\>,t|)>> of the random process
    <math|x<around|(|t|)>> is defined by

    <\equation>
      S<rsub|x><around|(|\<omega\>,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<rsub|x><around|(|t,\<tau\>|)>*e<rsup|-j*\<omega\>*\<tau\>>*d*\<tau\><label|eq:tdspectrum>
    </equation>
  </definition>

  <\theorem>
    [Fourier Transform of <math|\<tau\>>-Hilbert
    Transform]<label|thm:hilbert_fourier>The Fourier transform (with respect
    to <math|\<tau\>>) of the <math|\<tau\>>-Hilbert transform of
    <math|R<rsub|x><around|(|t,\<tau\>|)>> is:

    <\equation>
      \<cal-F\><rsub|\<tau\>><around|[|<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|]>=-j\<cdot\><text|sgn><around|(|\<omega\>|)>\<cdot\>S<rsub|x><around|(|\<omega\>,t|)><label|eq:hilbert_fourier>
    </equation>

    where sgn<math|<around|(|\<omega\>|)>> is the signum function.
  </theorem>

  <\proof>
    This follows from the fundamental property of Hilbert transforms in the
    frequency domain. The Hilbert transform corresponds to multiplication by
    <math|-j\<cdot\><text|sgn><around|(|\<omega\>|)>> in the frequency
    domain. Therefore:

    <\align>
      <tformat|<table|<row|<cell|\<cal-F\><rsub|\<tau\>><around|[|<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|]>>|<cell|=<around|(|-j\<cdot\><text|sgn><around|(|\<omega\>|)>|)>\<cdot\>\<cal-F\><rsub|\<tau\>><around|[|R<rsub|x><around|(|t,\<tau\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=-j\<cdot\><text|sgn><around|(|\<omega\>|)>\<cdot\>S<rsub|x><around|(|\<omega\>,t|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Pre-envelope Spectral Density]<label|thm:preenvelope_spectrum>The
    time-dependent power density spectrum
    <math|S<rsub|z><around|(|\<omega\>,t|)>> of the pre-envelope
    <math|z<around|(|t|)>> is given by:

    <\equation>
      S<rsub|z><around|(|\<omega\>,t|)>=<choice|<tformat|<table|<row|<cell|4*S<rsub|x><around|(|\<omega\>,t|)>,>|<cell|\<omega\>\<gtr\>0>>|<row|<cell|2*S<rsub|x><around|(|0,t|)>,>|<cell|\<omega\>=0>>|<row|<cell|0,>|<cell|\<omega\>\<less\>0>>>>><label|eq:preenvelope_spectrum>
    </equation>
  </theorem>

  <\proof>
    From Theorem<nbsp><reference|thm:preenvelope_autocov> and taking the
    Fourier transform:

    <\align>
      <tformat|<table|<row|<cell|S<rsub|z><around|(|\<omega\>,t|)>>|<cell|=\<cal-F\><rsub|\<tau\>><around|[|R<rsub|z><around|(|t,\<tau\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=2*\<cal-F\><rsub|\<tau\>>*<around|[|R<rsub|x><around|(|t,\<tau\>|)>+j*<wide|R|^><rsub|x><around|(|t,\<tau\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=2*<around|[|S<rsub|x><around|(|\<omega\>,t|)>+j*<around|(|-j\<cdot\><text|sgn><around|(|\<omega\>|)>\<cdot\>S<rsub|x><around|(|\<omega\>,t|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|=2*S<rsub|x><around|(|\<omega\>,t|)>*<around|[|1+<text|sgn><around|(|\<omega\>|)>|]><eq-number>>>>>
    </align>

    Evaluating the signum function:

    <\align>
      <tformat|<table|<row|<cell|S<rsub|z><around|(|\<omega\>,t|)>=<choice|<tformat|<table|<row|<cell|2*S<rsub|x><around|(|\<omega\>,t|)>*<around|(|1+1|)>=4*S<rsub|x><around|(|\<omega\>,t|)>,>|<cell|\<omega\>\<gtr\>0>>|<row|<cell|2*S<rsub|x><around|(|\<omega\>,t|)>*<around|(|1+0|)>=2*S<rsub|x><around|(|\<omega\>,t|)>,>|<cell|\<omega\>=0>>|<row|<cell|2*S<rsub|x><around|(|\<omega\>,t|)>*<around|(|1-1|)>=0,>|<cell|\<omega\>\<less\>0>>>>><eq-number>>>>>
    </align>
  </proof>

  <section|Physical Interpretation and Instantaneous Spectra>

  Page's<nbsp><cite|page1952|kharkevich1960> concept of the instantaneous
  spectrum provides a physical interpretation of
  <math|S<rsub|x><around|(|\<omega\>,t|)>>. For any sample function of the
  random process, one may conceive of the energy density as being distributed
  in time and frequency such that the energy expended in the time interval
  <math|<around|(|t<rsub|1>,t<rsub|2>|)>> due to frequency components between
  <math|f<rsub|1>> and <math|f<rsub|2>> is given by:

  <\equation>
    E<rsub|f<rsub|1>,f<rsub|2>><rsup|t<rsub|1>,t<rsub|2>>=<big|int><rsub|t<rsub|1>><rsup|t<rsub|2>><big|int><rsub|f<rsub|1>><rsup|f<rsub|2>>p<around|(|t,f|)>*<space|0.17em>d*f*<space|0.17em>d*t<label|eq:energy_density>
  </equation>

  where <math|p<around|(|t,f|)>> is the instantaneous energy spectrum of the
  function.

  <\definition>
    [Ensemble Average Energy Spectrum] The ensemble average of the
    instantaneous energy spectrum <math|p<around|(|t,f|)>> is the
    time-dependent power density spectrum:

    <\equation>
      \<bbb-E\><around|[|p<around|(|t,\<omega\>|)>|]>=S<rsub|x><around|(|\<omega\>,t|)><label|eq:ensemble_energy>
    </equation>

    where <math|\<omega\>=2*\<pi\>*f>.
  </definition>

  <section|Bandpass Random Processes>

  <math|S<rsub|x><around|(|\<omega\>,t|)>> provides a convenient way of
  describing bandpass random processes even when the process is not
  wide-sense stationary.

  <\definition>
    [Nonstationary Bandpass Process] A bandpass random process is one whose
    time-dependent power density spectrum
    <math|S<rsub|x><around|(|\<omega\>,t|)>> has bandpass character for all
    <math|t>.
  </definition>

  For analysis, it is convenient to choose a reference frequency
  <math|f<rsub|0>> (with <math|\<omega\><rsub|c>=2*\<pi\>*f<rsub|0>>) in the
  vicinity of the band to enable the representation:

  <\equation>
    S<rsub|x><around|(|\<omega\>,t|)>=S<rsub|c><around|(|\<omega\>-\<omega\><rsub|c>,t|)>+S<rsub|c><around|(|-\<omega\>-\<omega\><rsub|c>,t|)><label|eq:bandpass_spectrum>
  </equation>

  indicating that <math|S<rsub|x><around|(|\<omega\>,t|)>> is an even
  function of <math|\<omega\>>. Here, <math|S<rsub|c><around|(|\<omega\>,t|)>>
  has low-frequency character when <math|\<omega\><rsub|c>> is in the
  vicinity of the band.

  <\remark>
    There is no requirement for symmetry of
    <math|S<rsub|x><around|(|\<omega\>,t|)>> about <math|\<omega\><rsub|c>>,
    and <math|\<omega\><rsub|c>> need not be within the actual signal band.
  </remark>

  <\theorem>
    [Bandpass Autocovariance Structure]<label|thm:bandpass_autocov>For a
    bandpass process with spectrum given by
    equation<nbsp><eqref|eq:bandpass_spectrum>, the autocovariance function
    can be written as:

    <\equation>
      R<rsub|x><around|(|t,\<tau\>|)>=R<rsub|c><around|(|t,\<tau\>|)>*cos
      <around|(|\<omega\><rsub|c>*\<tau\>|)>+R<rsub|s><around|(|t,\<tau\>|)>*sin
      <around|(|\<omega\><rsub|c>*\<tau\>|)><label|eq:autocov_bandpass>
    </equation>

    where:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|c><around|(|t,\<tau\>|)>>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>S<rsub|x><around|(|\<omega\>,t|)>*cos
      <around|(|<around|(|\<omega\>-\<omega\><rsub|c>|)>*\<tau\>|)>*d*\<omega\><eq-number><label|eq:Rc>>>|<row|<cell|R<rsub|s><around|(|t,\<tau\>|)>>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>S<rsub|x><around|(|\<omega\>,t|)>*sin
      <around|(|<around|(|\<omega\>-\<omega\><rsub|c>|)>*\<tau\>|)>*d*\<omega\><eq-number><label|eq:Rs>>>>>
    </align>
  </theorem>

  <\proof>
    Applying the inverse Fourier transform to
    equation<nbsp><eqref|eq:tdspectrum>:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|x><around|(|t,\<tau\>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|x><around|(|\<omega\>,t|)>*e<rsup|j*\<omega\>*\<tau\>>*d*\<omega\><eq-number>>>>>
    </align>

    Substituting equation<nbsp><eqref|eq:bandpass_spectrum>:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|x><around|(|t,\<tau\>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|[|S<rsub|c><around|(|\<omega\>-\<omega\><rsub|c>,t|)>+S<rsub|c><around|(|-\<omega\>-\<omega\><rsub|c>,t|)>|]>*e<rsup|j*\<omega\>*\<tau\>>*d*\<omega\><eq-number>>>>>
    </align>

    Making appropriate substitutions and using the fact that
    <math|S<rsub|x><around|(|\<omega\>,t|)>> is real and even:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|x><around|(|t,\<tau\>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|c><around|(|\<nu\>,t|)>*<around|[|e<rsup|j*<around|(|\<nu\>+\<omega\><rsub|c>|)>*\<tau\>>+e<rsup|j*<around|(|-\<nu\>+\<omega\><rsub|c>|)>*\<tau\>>|]>*d*\<nu\><eq-number>>>|<row|<cell|>|<cell|=<frac|e<rsup|j*\<omega\><rsub|c>*\<tau\>>|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|c><around|(|\<nu\>,t|)>*e<rsup|j*\<nu\>*\<tau\>>*d*\<nu\>+<frac|e<rsup|-j*\<omega\><rsub|c>*\<tau\>>|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|c><around|(|\<nu\>,t|)>*e<rsup|-j*\<nu\>*\<tau\>>*d*\<nu\><eq-number>>>>>
    </align>

    Since <math|S<rsub|c><around|(|\<nu\>,t|)>> is real and has appropriate
    symmetry properties, this reduces to:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|x><around|(|t,\<tau\>|)>>|<cell|=<text|Re><around*|[|<frac|e<rsup|j*\<omega\><rsub|c>*\<tau\>>|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>S<rsub|c><around|(|\<nu\>,t|)>*e<rsup|j*\<nu\>*\<tau\>>*d*\<nu\>|]><eq-number>>>|<row|<cell|>|<cell|=R<rsub|c><around|(|t,\<tau\>|)>*cos
      <around|(|\<omega\><rsub|c>*\<tau\>|)>+R<rsub|s><around|(|t,\<tau\>|)>*sin
      <around|(|\<omega\><rsub|c>*\<tau\>|)><eq-number>>>>>
    </align>
  </proof>

  <subsection|Quadrature Representation>

  An alternative approach to deriving the autocovariance function is to
  represent <math|x<around|(|t|)>> in quadrature form:

  <\equation>
    x<around|(|t|)>=x<rsub|c><around|(|t|)>*cos
    <around|(|\<omega\><rsub|c>*t|)>+x<rsub|s><around|(|t|)>*sin
    <around|(|\<omega\><rsub|c>*t|)><label|eq:bandpass_decomp>
  </equation>

  <\theorem>
    [Quadrature Component Properties]<label|thm:quadrature_properties>For the
    representation in equation<nbsp><eqref|eq:bandpass_decomp> to yield the
    same autocovariance as equation<nbsp><eqref|eq:autocov_bandpass>, the
    following conditions must hold:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|c><around|(|t,\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]>=\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]><eq-number><label|eq:Rc_xc_xs>>>|<row|<cell|R<rsub|s><around|(|t,\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]>=-\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]><eq-number><label|eq:Rs_xc_xs>>>>>
    </align>
  </theorem>

  <\proof>
    Computing <math|R<rsub|x><around|(|t,\<tau\>|)>=\<bbb-E\>*<around|[|x<around|(|t|)>*x*<around|(|t-\<tau\>|)>|]>>
    using equation<nbsp><eqref|eq:bandpass_decomp>:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|2*R<rsub|x><around|(|t,\<tau\>|)>=<eq-number>>>|<row|<cell|>|<cell|\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]>*<around|[|cos
      <around|(|\<omega\><rsub|c>*\<tau\>|)>+cos
      <around|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|+\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]>*<around|[|cos
      <around|(|\<omega\><rsub|c>*\<tau\>|)>-cos
      <around|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|+\<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|s>*<around|(|t-\<tau\>|)>|]>*<around|[|sin
      <around|(|\<omega\><rsub|c>*\<tau\>|)>+sin
      <around|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number>>>|<row|<cell|>|<cell|-\<bbb-E\>*<around|[|x<rsub|s><around|(|t|)>*x<rsub|c>*<around|(|t-\<tau\>|)>|]>*<around|[|sin
      <around|(|\<omega\><rsub|c>*\<tau\>|)>-sin
      <around|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>|]><eq-number>>>>>
    </align>

    For this to match equation<nbsp><eqref|eq:autocov_bandpass>, the
    coefficients of <math|cos <around|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>>
    and <math|sin <around|(|\<omega\><rsub|c>*<around|(|2*t-\<tau\>|)>|)>>
    must vanish, leading to the stated conditions.
  </proof>

  <section|Hilbert Transform of Bandpass Autocovariance>

  <\theorem>
    [Hilbert Transform of Bandpass Function]<label|thm:hilbert_bandpass>For a
    function <math|R<rsub|x><around|(|t,\<tau\>|)>> of the form in
    equation<nbsp><eqref|eq:autocov_bandpass>, where <math|R<rsub|c>> and
    <math|R<rsub|s>> satisfy a mild bandwidth requirement, the
    <math|\<tau\>>-Hilbert transform is:

    <\equation>
      <wide|R|^><rsub|x><around|(|t,\<tau\>|)>=R<rsub|c><around|(|t,\<tau\>|)>*sin
      <around|(|\<omega\><rsub|c>*\<tau\>|)>-R<rsub|s><around|(|t,\<tau\>|)>*cos
      <around|(|\<omega\><rsub|c>*\<tau\>|)><label|eq:hilbert_autocov_bandpass>
    </equation>
  </theorem>

  <\proof>
    The bandwidth requirement ensures that when the Fourier transforms of
    <math|R<rsub|c>> and <math|R<rsub|s>> are translated by
    <math|\<omega\><rsub|c>>, the results are zero for
    <math|\<omega\>\<less\>0>. Under this condition, the Hilbert transform of
    a bandpass function follows standard results<nbsp><cite|urkowitz1962>.

    For a function of the form <math|f<around|(|\<tau\>|)>=A<around|(|\<tau\>|)>*cos
    <around|(|\<omega\><rsub|c>*\<tau\>|)>+B<around|(|\<tau\>|)>*sin
    <around|(|\<omega\><rsub|c>*\<tau\>|)>> where <math|A> and <math|B> have
    sufficiently narrow bandwidth, the Hilbert transform is:

    <\equation>
      \<cal-H\><around|[|f<around|(|\<tau\>|)>|]>=A<around|(|\<tau\>|)>*sin
      <around|(|\<omega\><rsub|c>*\<tau\>|)>-B<around|(|\<tau\>|)>*cos
      <around|(|\<omega\><rsub|c>*\<tau\>|)>
    </equation>

    Applying this to equation<nbsp><eqref|eq:autocov_bandpass> yields the
    result.
  </proof>

  <\corollary>
    [Pre-envelope of Bandpass Process]<label|cor:preenvelope_bandpass>Combining
    equations<nbsp><eqref|eq:autocov_bandpass>
    and<nbsp><eqref|eq:hilbert_autocov_bandpass>, the autocovariance function
    of the pre-envelope is:

    <\equation>
      R<rsub|z><around|(|t,\<tau\>|)>=2*<around*|[|R<rsub|c><around|(|t,\<tau\>|)>-j*R<rsub|s><around|(|t,\<tau\>|)>|]>*e<rsup|j*\<omega\><rsub|c>*\<tau\>><label|eq:final_autocov>
    </equation>
  </corollary>

  <\theorem>
    [Direct Bandpass Pre-envelope]<label|thm:direct_bandpass>If
    <math|x<rsub|c><around|(|t|)>> and <math|x<rsub|s><around|(|t|)>> satisfy
    the bandwidth requirement, then:

    <\align>
      <tformat|<table|<row|<cell|y<around|(|t|)>>|<cell|=x<rsub|c><around|(|t|)>*sin
      <around|(|\<omega\><rsub|c>*t|)>-x<rsub|s><around|(|t|)>*cos
      <around|(|\<omega\><rsub|c>*t|)><eq-number><label|eq:y_bandpass>>>|<row|<cell|z<around|(|t|)>>|<cell|=<around|[|x<rsub|c><around|(|t|)>-j*x<rsub|s><around|(|t|)>|]>*e<rsup|j*\<omega\><rsub|c>*t><eq-number><label|eq:z_bandpass>>>>>
    </align>
  </theorem>

  <\proof>
    This follows directly from applying the Hilbert transform to
    equation<nbsp><eqref|eq:bandpass_decomp> and using the properties
    established in Theorem<nbsp><reference|thm:hilbert_bandpass>.
  </proof>

  <section|Zero Cross-covariance Property>

  <\theorem>
    [Zero Cross-covariance at Origin]<label|thm:zero_crosscov>The real part
    <math|x<around|(|t|)>> and imaginary part <math|y<around|(|t|)>> of the
    pre-envelope have zero cross-covariance at the same time instant:

    <\equation>
      R<rsub|x*y><around|(|t,0|)>=0<label|eq:zero_crosscov>
    </equation>
  </theorem>

  <\proof>
    From Theorem<nbsp><reference|thm:crosscov_hilbert>,
    <math|R<rsub|x*y><around|(|t,0|)>=-<wide|R|^><rsub|x><around|(|t,0|)>>.

    From equation<nbsp><eqref|eq:hilbert_autocov_bandpass> with
    <math|\<tau\>=0>:

    <\align>
      <tformat|<table|<row|<cell|<wide|R|^><rsub|x><around|(|t,0|)>>|<cell|=R<rsub|c><around|(|t,0|)>*sin
      <around|(|0|)>-R<rsub|s><around|(|t,0|)>*cos
      <around|(|0|)><eq-number>>>|<row|<cell|>|<cell|=0-R<rsub|s><around|(|t,0|)><eq-number>>>|<row|<cell|>|<cell|=-R<rsub|s><around|(|t,0|)><eq-number>>>>>
    </align>

    From equation<nbsp><eqref|eq:Rs>, with <math|\<tau\>=0>:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|s><around|(|t,0|)>>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>S<rsub|x><around|(|\<omega\>,t|)>*sin
      <around|(|<around|(|\<omega\>-\<omega\><rsub|c>|)>\<cdot\>0|)>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>S<rsub|x><around|(|\<omega\>,t|)>*sin
      <around|(|0|)>*d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=0<eq-number>>>>>
    </align>

    Therefore, <math|R<rsub|x*y><around|(|t,0|)>=-<around|(|-0|)>=0>.
  </proof>

  <\corollary>
    [Quadrature Component Independence]<label|cor:quadrature_independence>At
    the same time instant, the quadrature components are uncorrelated:

    <\equation>
      \<bbb-E\>*<around|[|x<rsub|c><around|(|t|)>*x<rsub|s><around|(|t|)>|]>=0
    </equation>
  </corollary>

  <\proof>
    This follows directly from equation<nbsp><eqref|eq:Rs_xc_xs> with
    <math|\<tau\>=0> and the result of Theorem<nbsp><reference|thm:zero_crosscov>.
  </proof>

  <\thebibliography|9>
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

    <bibitem|papoulis1991>A. Papoulis, <em|Probability, Random Variables, and
    Stochastic Processes>, 3rd ed., New York, McGraw-Hill, 1991.
  </thebibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-10|<tuple|8|10|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-11|<tuple|80|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-3|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-4|<tuple|3.1|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-5|<tuple|4|6|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-6|<tuple|5|7|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-7|<tuple|6|7|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-8|<tuple|6.1|9|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-9|<tuple|7|9|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-arens1957|<tuple|arens1957|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-davenport1958|<tuple|davenport1958|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-doob1953|<tuple|doob1953|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-dugundji1958|<tuple|dugundji1958|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-kharkevich1960|<tuple|kharkevich1960|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-lampard1954|<tuple|lampard1954|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-page1952|<tuple|page1952|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-papoulis1991|<tuple|papoulis1991|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|bib-urkowitz1962|<tuple|urkowitz1962|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|cor:preenvelope_bandpass|<tuple|21|10|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|cor:quadrature_independence|<tuple|24|11|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|cor:symmetry|<tuple|10|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|def:autocovariance|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|def:crosscovariance|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|def:hilbert|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|def:hilbert_covariance|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|def:preenvelope|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|def:tdspectrum|<tuple|12|6|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:Rc|<tuple|52|8|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:Rc_xc_xs|<tuple|61|9|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:Rs|<tuple|53|8|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:Rs_xc_xs|<tuple|62|9|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:auto_symmetry|<tuple|21|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:autocov_bandpass|<tuple|51|8|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:autocovariance|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:bandpass_decomp|<tuple|60|9|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:bandpass_spectrum|<tuple|50|7|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:cross_symmetry|<tuple|20|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:crosscov_hilbert|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:crosscovariance|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:energy_density|<tuple|48|7|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:ensemble_energy|<tuple|49|7|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:final_autocov|<tuple|70|10|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:hilbert_autocov_bandpass|<tuple|68|9|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:hilbert_covariance|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:hilbert_cross|<tuple|16|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:hilbert_fourier|<tuple|39|6|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:hilbert_of_hilbert|<tuple|19|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:hilbert_transform|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:hilbert_transform_alt|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:preenvelope_autocov|<tuple|26|5|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:preenvelope_spectrum|<tuple|42|6|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:tdspectrum|<tuple|38|6|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:y_bandpass|<tuple|71|10|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:z_bandpass|<tuple|72|10|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|eq:zero_crosscov|<tuple|73|10|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:bandpass_autocov|<tuple|18|8|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:crosscov_hilbert|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:direct_bandpass|<tuple|22|10|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:hilbert_bandpass|<tuple|20|9|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:hilbert_cross|<tuple|8|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:hilbert_fourier|<tuple|13|6|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:hilbert_of_hilbert|<tuple|9|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:preenvelope_autocov|<tuple|11|5|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:preenvelope_spectrum|<tuple|14|6|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:quadrature_properties|<tuple|19|9|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|thm:zero_crosscov|<tuple|23|10|../../.TeXmacs/texts/scratch/no_name_29.tm>>
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Mathematical
      Preliminaries> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Covariance
      Functions and Their Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Fundamental Theorems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Time-Dependent
      Spectral Densities> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Physical
      Interpretation and Instantaneous Spectra>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Bandpass
      Random Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|6.1<space|2spc>Quadrature Representation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Hilbert
      Transform of Bandpass Autocovariance>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Zero
      Cross-covariance Property> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>