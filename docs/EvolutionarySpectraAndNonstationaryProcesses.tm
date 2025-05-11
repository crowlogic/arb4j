<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Evolutionary Spectra and Non-Stationary
  Processes>|<doc-author|<author-data|<author-name|M. B.
  Priestley>|<author-affiliation|University of Manchester>>>|<doc-date|Read
  at a Research Methods Meeting of the Society, February 3,
  1965<next-line><em|(Professor D.<nbsp>V. Lindley in the Chair)>>>

  <abstract-data|<\abstract>
    We develop an approach to the spectral analysis of non-stationary
    processes based on the concept of <em|evolutionary spectra><emdash>that
    is, spectral functions which are time-dependent and have a physical
    interpretation as local energy distributions over frequency. It is shown
    that the notion of evolutionary spectra generalizes the usual definition
    of spectra for stationary processes, and that, under certain conditions,
    the evolutionary spectrum at each instant of time may be estimated from a
    single realization of a process. By such means it is possible to study
    processes with continuously changing ``spectral patterns''.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Non-Stationary
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Spectral
    Theory for a Class of Non-Stationary Processes: Oscillatory Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Evolutionary
    (Power) Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    Uniformly Modulated Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Effect
    of Filters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Semi-Stationary
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Determination
    of Evolutionary Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Estimation
    of Evolutionary Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <with|par-left|1tab|Practical Windows
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10<space|2spc>Discrete
    Parameter Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|11<space|2spc>Further
    Problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Appendix:
    Analysis of Artificial Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Discussion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References in
    the Discussion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  In the classical approach to statistical spectral analysis it is always
  assumed that the process under study, <math|<around|{|X<rsub|t>|}>>, is
  stationary up to at least the second order. That is, we assume that
  <math|\<bbb-E\><around|(|X<rsub|t>|)>=\<mu\>>, a constant (independent of
  <math|t>), which we may take to be zero, and that, for each <math|s> and
  <math|t>, the covariance

  <\equation>
    R<rsub|s,t>=\<bbb-E\>*<around*|(|<around|(|X<rsub|s>-\<mu\>|)>*<around|(|X<rsub|t>-\<mu\>|)><rsup|\<ast\>>|)><label|eq:autocov_stationary>
  </equation>

  (* denoting complex conjugation) is a function of <math|<around|\||s-t|\|>>
  only. In this case, it is well known that <math|R<rsub|s,t>> has a spectral
  representation of the form

  <\equation>
    R<rsub|s,t>=<big|int>e<rsup|i*\<omega\>*<around|(|s-t|)>>*<space|0.17em>d*F<around|(|\<omega\>|)>,<label|eq:spectral_stationary>
  </equation>

  where <math|F<around|(|\<omega\>|)>> has the properties of a distribution
  function, with <math|\<omega\>\<in\><around|(|-\<infty\>,\<infty\>|)>> for
  continuous parameter, or <math|\<omega\>\<in\><around|(|-\<pi\>,\<pi\>|)>>
  in the discrete case.

  Corresponding to<nbsp><eqref|eq:spectral_stationary>,
  <math|<around|{|X<rsub|t>|}>> has a spectral representation

  <\equation>
    X<rsub|t>=<big|int>e<rsup|i*\<omega\>*t>*<space|0.17em>d*Z<around|(|\<omega\>|)>,<label|eq:process_rep_stationary>
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is an orthogonal process with
  <math|\<bbb-E\>*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*F<around|(|\<omega\>|)>>.
  For physical processes, the spectral density
  <math|f<around|(|\<omega\>|)>=F<rprime|'><around|(|\<omega\>|)>> (when it
  exists) describes the energy distribution over frequencies.

  However, the assumption of stationarity is often questionable; e.g.,
  atmospheric turbulence records change over time and classical spectral
  analysis may not be adequate. Thus, can we formulate spectral theory for
  non-stationary processes retaining notions such as \Penergy\Q and
  \Pfrequency\Q and preserving physical interpretability?

  If no restrictions (other than finite first and second moments) are placed,
  no useful inference can be drawn from a single record. But, for processes
  that are stationary in segments (i.e., <math|X<rsub|t>=X<rsup|<around|(|1|)>><rsub|t>>
  for <math|t\<leq\>t<rsub|0>>, <math|X<rsup|<around|(|2|)>><rsub|t>> for
  <math|t\<gtr\>t<rsub|0>>), we infer something about the spectrum. This
  motivates considering a <em|continuously changing> or time-dependent
  spectrum.

  We therefore focus on processes where non-stationary characteristics change
  slowly over time (akin to Jowett's \Psmoothly heteromorphic\Q
  processes<nbsp><cite|Jowett1957>).

  <section|Non-Stationary Processes><label|sec:nonstationary>

  Several attempts have been made to define a spectrum for non-stationary
  processes. Notably, Cramér<nbsp><cite|Cramer1960> considered harmonizable
  processes (Loève sense), with representations
  like<nbsp><eqref|eq:process_rep_stationary> but
  <math|Z<around|(|\<omega\>|)>> need not be orthogonal. The integrated
  spectrum is then (as a function of two variables):

  <\equation>
    d*F<around|(|\<omega\>,\<nu\>|)>=\<bbb-E\>*<around|[|d*Z<around|(|\<omega\>|)>*d*Z<rsup|\<ast\>><around|(|\<nu\>|)>|]>.
  </equation>

  Hatanaka and Suzuki define the spectrum (spectral density function) as the
  limiting expected value of the periodogram as sample size
  <math|\<to\>\<infty\>>. Page<nbsp><cite|Page1952> introduced
  \Pinstantaneous power spectra\Q. Specifically,

  <\align>
    <tformat|<table|<row|<cell|f<rsup|\<ast\>><around|(|\<omega\>|)>>|<cell|=lim<rsub|T\<to\>\<infty\>>
    f<rsub|T><around|(|\<omega\>|)>,<eq-number>>>|<row|<cell|f<rsub|T><around|(|\<omega\>|)>>|<cell|=\<bbb-E\>*<around*|{|<frac|1|T>*<big|int><rsub|0><rsup|T>X<rsub|t>*e<rsup|-i*\<omega\>*t>*d*t|}>,<eq-number>>>|<row|<cell|P<rsub|t><around|(|\<omega\>|)>>|<cell|=<frac|d|d*t>*f<rsup|\<ast\>><around|(|\<omega\>|)>.<eq-number>>>>>
  </align>

  The instantaneous power spectrum <math|P<rsub|t><around|(|\<omega\>|)>>
  compares the spectral content up to <math|t+d*t> and up to <math|t>.

  Our approach, in contrast, is to study the spectral content <em|within> the
  interval <math|<around|(|t,t+d*t|)>>, which we argue is more relevant for
  physical interpretation.

  <section|Spectral Theory for a Class of Non-Stationary Processes:
  Oscillatory Processes><label|sec:oscillatory>

  Consider a complex-valued, continuous-parameter process
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>>, assumed \Ptrend
  free\Q, i.e., <math|\<bbb-E\><around|(|X<rsub|t>|)>=0> <math|\<forall\>t>.

  Define the autocovariance

  <\equation>
    R<rsub|s,t>=\<bbb-E\>*<around|(|X<rsub|s>*X<rsub|t><rsup|\<ast\>>|)>.<label|eq:autocov_general>
  </equation>

  Assume there exists a family <math|\<cal-F\>> of functions
  <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>> defined on
  <math|\<bbb-R\>> and indexed by <math|t>, and a measure
  <math|\<mu\><around|(|\<omega\>|)>> on <math|\<bbb-R\>>, such that

  <\equation>
    R<rsub|s,t>=<big|int>\<phi\><rsub|s><around|(|\<omega\>|)>*\<phi\><rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*<space|0.17em>d*\<mu\><around|(|\<omega\>|)>.<label|eq:cov_oscill>
  </equation>

  (see also Parzen, unpublished). Each <math|t>-indexed function can also be
  viewed as a family <math|<around|{|\<phi\><rsub|\<omega\>><around|(|t|)>|}>>
  indexed by <math|\<omega\>>.

  For <math|X<rsub|t>> to have finite variance,
  <math|\<phi\><rsub|t><around|(|\<omega\>|)>> must be quadratically
  integrable in <math|\<omega\>>. When <math|R<rsub|s,t>>
  admits<nbsp><eqref|eq:cov_oscill>, we get:

  <\equation>
    X<rsub|t>=<big|int>\<phi\><rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)>,<label|eq:process_general>
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is orthogonal and

  <\equation>
    \<bbb-E\>*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>.<label|eq:orthog_measure>
  </equation>

  (see Bartlett<nbsp><cite|Bartlett1955> and Grenander &
  Rosenblatt<nbsp><cite|GrenanderRosenblatt1957>).

  For stationary processes, a suitable <math|\<cal-F\>> is

  <\equation>
    \<phi\><rsub|t><around|(|\<omega\>|)>=e<rsup|i*\<omega\>*t>,<label|eq:phi_stationary>
  </equation>

  yielding the standard spectral decomposition.

  For non-stationary processes, the family of basic elements must be
  \Poscillatory\Q but \Pnon-stationary\Q. Suppose for each <math|\<omega\>>,
  <math|\<phi\><rsub|t><around|(|\<omega\>|)>> has a generalized Fourier
  transform maximized at frequency <math|\<theta\><around|(|\<omega\>|)>>, so

  <\equation>
    \<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<theta\><around|(|\<omega\>|)>*t>,<label|eq:phi_oscillatory>
  </equation>

  where <math|A<rsub|t><around|(|\<omega\>|)>> is such that its Fourier
  transform (in <math|t>) is maximized at 0.

  <\definition>
    <label|def:oscillatory_function>The function
    <math|\<phi\><rsub|t><around|(|\<omega\>|)>> is <em|oscillatory> if, for
    some unique <math|\<theta\><around|(|\<omega\>|)>>, it may be written as
    in<nbsp><eqref|eq:phi_oscillatory> where

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<big|int>e<rsup|i*t*\<theta\>>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>,<label|eq:A_FT>
    </equation>

    with <math|<around|\||d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>>
    maximized at <math|\<theta\>=0>.
  </definition>

  If <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>> is such that
  <math|\<theta\><around|(|\<omega\>|)>> is single-valued, the variable
  in<nbsp><eqref|eq:cov_oscill> can be changed from <math|\<omega\>> to
  <math|\<theta\><around|(|\<omega\>|)>>, yielding

  <\align>
    <tformat|<table|<row|<cell|R<rsub|s,t>>|<cell|=<big|int>A<rsub|s><around|(|\<omega\>|)>*A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*\<mu\><around|(|\<omega\>|)>,<eq-number><label|eq:cov_theta>>>|<row|<cell|X<rsub|t>>|<cell|=<big|int>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>.<eq-number><label|eq:X_theta>>>>>
  </align>

  <\definition>
    <label|def:oscillatory_process>A process with
    representation<nbsp><eqref|eq:cov_oscill> in terms of a family of
    oscillatory functions <math|\<cal-F\>> is called an <em|oscillatory
    process>.
  </definition>

  Any such process can be represented as in<nbsp><eqref|eq:X_theta> with
  <math|\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>.

  <section|Evolutionary (Power) Spectra><label|sec:evospectra>

  For an oscillatory process as above, the variance is

  <\equation>
    <math-up|var><around|(|X<rsub|t>|)>=R<rsub|t,t>=<big|int><around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>.<label|eq:var_xt>
  </equation>

  Thus, the contribution from frequency <math|\<omega\>> is
  <math|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>>.

  <\definition>
    <label|def:evolutionary_spectrum>Let <math|\<cal-F\>=<around|{|A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>|}>>,
    and <math|<around|{|X<rsub|t>|}>> have
    representation<nbsp><eqref|eq:X_theta>. The <em|evolutionary power
    spectrum> at time <math|t> with respect to <math|\<cal-F\>> is

    <\equation>
      d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>.<label|eq:evolutionary_spectrum>
    </equation>
  </definition>

  For stationary processes with <math|\<cal-F\>> the exponential family
  (<math|A<rsub|t><around|(|\<omega\>|)>\<equiv\>1>),
  <math|d*F<rsub|t><around|(|\<omega\>|)>> reduces to the classical spectrum.

  Also,

  <\equation>
    <math-up|var><around|(|X<rsub|t>|)>=<big|int>d*F<rsub|t><around|(|\<omega\>|)>,<label|eq:var_evospec>
  </equation>

  so the total energy at <math|t> is independent of the family
  <math|\<cal-F\>>.

  It is convenient to normalize <math|A<rsub|t><around|(|\<omega\>|)>> so
  that

  <\equation>
    <big|int><around|\||d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>=1,<label|eq:A_norm>
  </equation>

  making <math|d*\<mu\><around|(|\<omega\>|)>> the evolutionary spectrum at
  <math|t=0>.

  Oscillatory processes can also be interpreted as the result of passing a
  stationary process through a time-varying filter. That is, with
  <math|h<rsub|t><around|(|u|)>> such that

  <\equation>
    A<rsub|t><around|(|\<omega\>|)>=<big|int>e<rsup|i*u*\<omega\>>*h<rsub|t><around|(|u|)>*d*u,<label|eq:A_filter>
  </equation>

  then

  <\equation>
    X<rsub|t>=<big|int>h<rsub|t><around|(|u|)>*S<rsub|t-u>*d*u,<space|1em>S<rsub|t>=<big|int>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>,<label|eq:X_filter>
  </equation>

  where <math|S<rsub|t>> is stationary with spectrum
  <math|d*\<mu\><around|(|\<omega\>|)>>.

  <section|The Uniformly Modulated Process>

  A notable special case is

  <\equation>
    X<rsub|t>=c<around|(|t|)>*X<rsup|<around|(|0|)>><rsub|t>,<label|eq:uniformly_modulated>
  </equation>

  where <math|<around|{|X<rsub|t><rsup|<around|(|0|)>>|}>> is stationary,
  <math|c<around|(|0|)>=1>, and <math|c<around|(|t|)>>'s Fourier transform
  has modulus maximized at the origin.

  Then

  <\equation>
    X<rsup|<around|(|0|)>><rsub|t>=<big|int>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>,<label|eq:stationary_decomp>
  </equation>

  so

  <\equation>
    X<rsub|t>=<big|int>c<around|(|t|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>.<label|eq:um_decomp>
  </equation>

  This is an oscillatory process; its evolutionary spectrum is

  <\equation>
    d*F<rsub|t><around|(|\<omega\>|)>=c<around|(|t|)><rsup|2>*<space|0.17em>d*F<around|(|\<omega\>|)>.<label|eq:um_spec>
  </equation>

  This process is special in that spectral components vary in time in the
  same way:

  <\equation>
    <frac|d*F<rsub|t<rsub|1>><around|(|\<omega\><rsub|1>|)>|d*F<rsub|t<rsub|2>><around|(|\<omega\><rsub|1>|)>>=<frac|d*F<rsub|t<rsub|1>><around|(|\<omega\><rsub|2>|)>|d*F<rsub|t<rsub|2>><around|(|\<omega\><rsub|2>|)>>,<nbsp>\<forall\>\<omega\><rsub|1>,\<omega\><rsub|2>
  </equation>

  A process with such a property is called a <em|uniformly modulated
  process>.

  <section|Effect of Filters><label|sec:filters>

  For stationary processes, the effect of a linear filter
  <math|g<around|(|u|)>>, applied as

  <\equation>
    Y<rsub|t>=<big|int>g<around|(|u|)>*X<rsub|t-u>*d*u,<label|eq:filter>
  </equation>

  results in a transformed spectrum

  <\align>
    <tformat|<table|<row|<cell|d*F<rsub|Y><around|(|\<omega\>|)>>|<cell|=<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsub|X><around|(|\<omega\>|)>,<eq-number><label|eq:filtered_spec>>>|<row|<cell|\<Gamma\><around|(|\<omega\>|)>>|<cell|=<big|int>g<around|(|u|)>*e<rsup|-i*\<omega\>*u>*d*u.<eq-number>>>>>
  </align>

  For oscillatory (non-stationary) processes, consider

  <\equation>
    Y<rsub|t>=<big|int>g<around|(|u|)>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>*d*u,<label|eq:nonstationary_filter>
  </equation>

  which can be expanded as

  <\equation>
    Y<rsub|t>=<big|int>\<Gamma\><rsub|t,\<omega\><rsub|0>><around|(|\<omega\>|)>*A<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>*d*Z*<around|(|\<omega\>+\<omega\><rsub|0>|)>,<label|eq:filtered_oscillatory>
  </equation>

  where

  <\equation>
    \<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>=<big|int>g<around|(|u|)><frac|A<rsub|t-u><around|(|\<lambda\>|)>|A<rsub|t><around|(|\<lambda\>|)>>*e<rsup|-i*\<theta\>*u>*d*u.<label|eq:gen_transfer>
  </equation>

  If <math|A<rsub|t-u><around|(|\<lambda\>|)>> varies slowly compared to
  <math|g<around|(|u|)>>, then <math|\<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>\<approx\>\<Gamma\><around|(|\<theta\>|)>>
  and

  <\equation>
    Y<rsub|t>\<approx\><big|int>A<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>*d*<wide|Z|~><around|(|\<omega\>|)>,
  </equation>

  with

  <\equation>
    \<bbb-E\>*<around|\||d*<wide|Z|~><around|(|\<omega\>|)>|\|><rsup|2>=<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  and thus

  <\equation>
    d*F<rsub|Y><around|(|\<omega\>|)>\<approx\><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsub|X>*<around|(|\<omega\>+\<omega\><rsub|0>|)>.<label|eq:filtered_evospectra>
  </equation>

  <section|Semi-Stationary Processes>

  To formalize \Pslowly varying\Q, for each family <math|\<cal-F\>> define

  <\equation>
    B<around|(|\<omega\>|)>=<big|int><around|\||\<theta\>|\|>*<space|0.17em><around|\||d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>,<label|eq:Bw>
  </equation>

  and

  <\equation>
    B<rsub|\<cal-F\>>=<around|[|sup<rsub|\<omega\>>
    B<around|(|\<omega\>|)>|]><rsup|-1>.<label|eq:B_F>
  </equation>

  <\definition>
    <label|def:semi_stationary_family>A family <math|\<cal-F\>> is
    <em|semi-stationary> if <math|B<around|(|\<omega\>|)>> is bounded
    <math|\<forall\>\<omega\>>. <math|B<rsub|\<cal-F\>>> is the
    <em|characteristic width> of <math|\<cal-F\>>.
  </definition>

  <\definition>
    <label|def:semi_stationary_process>A process is semi-stationary if it has
    a representation<nbsp><eqref|eq:X_theta> with respect to a
    semi-stationary family.
  </definition>

  For all such admissible families <math|\<cal-F\>>, define

  <\equation>
    B<rsub|X>=sup<rsub|\<cal-F\>> B<rsub|\<cal-F\>>.<label|eq:BX>
  </equation>

  Let <math|\<cal-F\><rsup|\<ast\>>> be a family achieving the supremum
  (characteristic width <math|B<rsub|X>>).

  Then

  <\equation>
    X<rsub|t>=A<rsup|\<ast\>><rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>.<label|eq:X_Fstar>
  </equation>

  The validity of the approximation<nbsp><eqref|eq:filtered_evospectra>
  depends on the \Pwidth\Q of <math|g<around|(|u|)>> being much less than
  <math|B<rsub|X>>.

  Define the following:

  <\definition>
    We say <math|u<around|(|x|)>> is a <em|pseudo>
    <math|\<delta\>>-<em|function of order> <math|\<epsilon\>> with respect
    to <math|v<around|(|x|)>> if, for every <math|k>, there exists
    <math|\<epsilon\>\<less\>1> such that

    <\equation>
      <around*|\||<big|int>u<around|(|x|)>*v*<around|(|x+k|)>*d*x-v<around|(|k|)>*<big|int>u<around|(|x|)>*d*x|\|>\<less\>\<epsilon\>.
    </equation>
  </definition>

  Assume <math|g<around|(|u|)>> is square integrable and normalized:

  <\align>
    <tformat|<table|<row|<cell|<big|int><around|\||g<around|(|u|)>|\|>*d*u=1,<space|1em><big|int><around|\||u|\|><space|0.17em><around|\||g<around|(|u|)>|\|>*d*u=B<rsub|g>.<eq-number><label|eq:filter_width>>>>>
  </align>

  <\lemma>
    <label|lem:pseudo_delta>Let <math|\<cal-F\>> be semi-stationary with
    width <math|B>. Then, for each <math|t,\<omega\>>,
    <math|<around|{|e<rsup|i*t*\<theta\>>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>|}>>
    is a pseudo <math|\<delta\>>-function of order <math|B<rsub|g>/B> with
    respect to <math|\<Gamma\><around|(|\<theta\>|)>>.
  </lemma>

  <\proof>
    For any <math|k>,

    <\equation*>
      <big|int>e<rsup|i*t*\<theta\>>*\<Gamma\>*<around|(|\<theta\>+k|)>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>=\<Gamma\><around|(|k|)>*<big|int>e<rsup|i*t*\<theta\>>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>+R<around|(|k|)>
    </equation*>

    with <math|R<around|(|k|)>> bounded in terms of <math|B<rsub|g>> and
    <math|B>. Details follow the standard argument (see text for more).
  </proof>

  <\theorem>
    <label|thm:approximation>Suppose <math|g<around|(|u|)>>
    satisfies<nbsp><eqref|eq:filter_width>, and
    <math|\<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>> is its
    generalized transfer function with respect to a semi-stationary family of
    width <math|B>. If <math|B<rsub|g>\<less\>\<epsilon\>*B>, then

    <\equation*>
      <around|\||A<rsub|t><around|(|\<lambda\>|)>|\|>\<cdot\><around|\||\<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>-\<Gamma\><around|(|\<theta\>|)>|\|>\<less\>\<epsilon\>,<space|1em>\<forall\>t,\<lambda\>,\<theta\>.
    </equation*>
  </theorem>

  <\proof>
    The proof follows by representing <math|A<rsub|t-u><around|(|\<lambda\>|)>>
    by its Fourier transform and applying
    Lemma<nbsp><reference|lem:pseudo_delta>.
  </proof>

  <section|Determination of Evolutionary Spectra><label|sec:determination>

  Let <math|<around|{|X<rsub|t>|}>> be a semi-stationary process with width
  <math|B<rsub|X>>. Let <math|g<around|(|u|)>> be a filter of width
  <math|B<rsub|g>\<less\>B<rsub|X>>. For any frequency
  <math|\<omega\><rsub|0>>, set

  <\equation>
    Y<rsub|t>=<big|int>g<around|(|u|)>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>*d*u.<label|eq:Y_sample>
  </equation>

  Expressing <math|X<rsub|t>> in terms of <math|\<cal-F\><rsup|\<ast\>>>
  gives, via<nbsp><eqref|eq:X_Fstar>, representation

  <\equation>
    Y<rsub|t>=<big|int>\<Gamma\><rsub|t,\<omega\><rsub|0>><around|(|\<omega\>|)>*A<rsup|\<ast\>><rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>,
  </equation>

  and so

  <\equation>
    \<bbb-E\><around|\||Y<rsub|t>|\|><rsup|2>=<big|int><around|\||\<Gamma\><rsub|t,\<omega\><rsub|0>><around|(|\<omega\>|)><around|\||<rsup|2>|\|>*A<rsup|\<ast\>><rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>+O<around|(|B<rsub|g>/B<rsub|X>|)>.<label|eq:Ey2>
  </equation>

  <section|Estimation of Evolutionary Spectra><label|sec:estimation>

  Given a sample record <math|<around|{|X<rsub|t>|}>> for
  <math|0\<less\>t\<leq\>T>, we wish to estimate
  <math|d*F<rsub|t><around|(|\<omega\>|)>> for <math|0\<less\>t\<leq\>T>.
  Suppose <math|\<mu\><around|(|\<omega\>|)>> is absolutely continuous, so
  <math|d*F<rsub|t><around|(|\<omega\>|)>=f<rsub|t><around|(|\<omega\>|)>*d*\<omega\>>.

  Let <math|g<around|(|u|)>> have width <math|B<rsub|g>\<less\>B<rsub|X>\<less\>T>,
  and for <math|\<omega\><rsub|0>> define

  <\equation>
    U<rsub|t>=<big|int><rsub|t-T><rsup|t>g<around|(|u|)>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>*d*u.<label|eq:Ut>
  </equation>

  For <math|t> large enough, end effects are negligible and <math|U<rsub|t>>
  approximates <math|Y<rsub|t>> in<nbsp><eqref|eq:Y_sample>.

  Thus,

  <\equation>
    \<bbb-E\><around|\||U<rsub|t>|\|><rsup|2>=<big|int><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*f<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*\<omega\>+O<around|(|B<rsub|g>/B<rsub|X>|)>,
  </equation>

  where <math|\<Gamma\><around|(|\<omega\>|)>> is the transfer function of
  <math|g<around|(|u|)>>.

  In contrast to stationary spectral estimation, for evolutionary spectra the
  bandwidth of <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>
  is limited by <math|B<rsub|g>*B<rsub|X>>; i.e., higher time resolution
  reduces frequency resolution. If <math|f<rsub|t><around|(|\<omega\>|)>> is
  smooth compared to <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>,

  <\equation>
    \<bbb-E\><around|\||U<rsub|t>|\|><rsup|2>\<approx\>f<rsub|t><around|(|\<omega\><rsub|0>|)>,<label|eq:Ut_f>
  </equation>

  as <math|<big|int><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>=1>.

  For a normal process,

  <\equation>
    <math-up|var><around|(|<around|\||U<rsub|t>|\|><rsup|2>|)>\<approx\><around|[|<big|int><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*f<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*\<omega\>|]><rsup|2>*<around|(|1+\<delta\><rsub|0,0>|)>,
  </equation>

  which is independent of <math|T>: <math|<around|\||U<rsub|t>|\|><rsup|2>>
  is a noisy estimate, as in the classical periodogram.

  To improve variance, average <math|<around|\||U<rsub|t>|\|><rsup|2>> over
  neighboring <math|t> using a weight function
  <math|W<rsub|T<rprime|'>><around|(|t|)>> with the following properties:

  <\enumerate>
    <item><math|W<rsub|T<rprime|'>><around|(|t|)>\<geq\>0> for all
    <math|t,T<rprime|'>>

    <item><math|W<rsub|T<rprime|'>><around|(|t|)>\<to\>0> as
    <math|<around|\||t|\|>\<to\>\<infty\>>

    <item><math|<big|int>W<rsub|T<rprime|'>><around|(|t|)>*d*t=1> for all
    <math|T<rprime|'>>

    <item><math|<big|int><around|[|W<rsub|T<rprime|'>><around|(|t|)>|]><rsup|2>*d*t\<less\>\<infty\>>
    for all <math|T<rprime|'>>

    <item>For some <math|C\<gtr\>0>, <math|lim<rsub|T<rprime|'>\<to\>\<infty\>>
    T<rprime|'>*<big|int><around|\||W<rsub|T<rprime|'>><around|(|\<lambda\>|)>|\|><rsup|2>*d*\<lambda\>=C>
    where <math|W<rsub|T<rprime|'>><around|(|\<lambda\>|)>> is the Fourier
    transform of <math|W<rsub|T<rprime|'>><around|(|t|)>>
  </enumerate>

  Define

  <\equation>
    V<rsub|t>=<big|int>W<rsub|T<rprime|'>><around|(|u|)><around|\||U<rsub|t-u>|\|><rsup|2>*d*u.<label|eq:Vt>
  </equation>

  With suitable smoothness,

  <\equation>
    \<bbb-E\>*V<rsub|t>\<approx\>f<rsub|t><around|(|\<omega\><rsub|0>|)>,
  </equation>

  and

  <\equation>
    <math-up|var><around|(|V<rsub|t>|)>\<sim\><around|[|f<rsub|t><around|(|\<omega\><rsub|0>|)>|]><rsup|2><frac|C|T<rprime|'>>*<around|(|1+\<delta\><rsub|0,0>|)>,
  </equation>

  so fluctuations are <math|O<around|(|1/<sqrt|T<rprime|'>>|)>>.

  <subsection*|Practical Windows>

  <math|g<around|(|u|)>>, the filter, may be any standard spectral analysis
  window. For example, for the Bartlett window:

  <\align>
    <tformat|<table|<row|<cell|g<around|(|u|)>>|<cell|=<choice|<tformat|<table|<row|<cell|<frac|1|2*h>>|<cell|<around|\||u|\|>\<leq\>h>>|<row|<cell|0>|<cell|<text|otherwise>>>>>><eq-number><label|eq:Bartlett>>>|<row|<cell|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>|<cell|=<frac|1|2*\<pi\>>*<frac|sin<rsup|2>
    h*\<omega\>|\<pi\><rsup|2>*\<omega\><rsup|2>><eq-number>>>>>
  </align>

  For the weight function <math|W<rsub|T<rprime|'>><around|(|t|)>>, the
  Daniell window:

  <\equation>
    W<rsub|T<rprime|'>><around|(|t|)>=<choice|<tformat|<table|<row|<cell|<frac|1|T<rprime|'>>>|<cell|-T<rprime|'>\<less\>t\<leq\>T<rprime|'>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>
  </equation>

  or alternatively an exponential window.

  <section|Discrete Parameter Processes><label|sec:discrete>

  For a discrete-parameter process, the (oscillatory) representation is

  <\equation>
    X<rsub|t>=<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|i*t*\<omega\>>*A<rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)>,<space|1em>t=0,\<pm\>1,\<pm\>2,...<label|eq:discrete_oscillatory>
  </equation>

  where <math|A<rsub|t><around|(|\<omega\>|)>> (for each <math|\<omega\>>)
  has a generalized discrete Fourier transform maximized at zero, and
  <math|Z<around|(|\<omega\>|)>> is orthogonal with
  <math|\<bbb-E\>*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>>
  on <math|<around|(|-\<pi\>,\<pi\>|)>>.

  The evolutionary spectrum at <math|t> (relative to
  <math|<around|{|e<rsup|i*t*\<omega\>>*A<rsub|t><around|(|\<omega\>|)>|}>>)
  is

  <\equation>
    d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>,<space|2em><around|(|-\<pi\>\<leq\>\<omega\>\<leq\>\<pi\>|)>.
  </equation>

  Estimation proceeds as in the continuous case, but with sums instead of
  integrals:

  <\align>
    <tformat|<table|<row|<cell|U<rsub|t>>|<cell|=<big|sum><rsub|u>g<rsub|u>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>,<eq-number>>>|<row|<cell|V<rsub|t>>|<cell|=<big|sum><rsub|v>W<rsub|v><around|\||U<rsub|t-v>|\|><rsup|2>.<eq-number>>>>>
  </align>

  <section|Further Problems><label|sec:further>

  For evolutionary spectral analysis, one must choose:

  <\enumerate>
    <item>Filter <math|g<around|(|u|)>> form

    <item>Weight <math|W<rsub|T<rprime|'>><around|(|t|)>> form

    <item>Filter width <math|B<rsub|g>>

    <item>Parameter <math|T<rprime|'>> for <math|W<rsub|T<rprime|'>>>
  </enumerate>

  The optimal choice depends on specific optimality criteria (mean square
  error, etc.), and may need to be addressed empirically.

  Testing for stationarity can be approached via variance analysis, e.g., by
  comparing

  <\equation>
    f<around|(|\<omega\>|)>=<frac|1|T>*<big|int><rsub|0><rsup|T><around|\||U<rsub|t>|\|><rsup|2>*d*t
  </equation>

  with <math|W<rsub|T<rprime|'>><around|(|t|)>=<frac|1|T<rprime|'>>,0\<less\>t\<leq\>T<rprime|'>>,
  and testing based on

  <\equation>
    A<around|(|\<omega\>|)>=<big|int><around|[|f<rsub|t><around|(|\<omega\>|)>-f<around|(|\<omega\>|)>|]><rsup|2>*d*t.
  </equation>

  <section*|References>

  <\thebibliography|99>
    <bibitem|Bartlett1955>Bartlett, M.S. (1955). <em|An Introduction to
    Stochastic Processes with Special Reference to Methods and Applications>.
    Cambridge: Cambridge University Press.

    <bibitem|Cramer1960>Cramér, H. (1960). On some classes of non-stationary
    processes. <em|Proc. Fourth Berkeley Symp. Math. Statist. Prob.>,
    <with|font-series|bold|2>, 57\U78.

    <bibitem|GrenanderRosenblatt1957>Grenander, U. and Rosenblatt, M. (1957).
    <em|Statistical Analysis of Stationary Time Series>. New York: Wiley.

    <bibitem|Herbst1963a>Herbst, L.J. (1963a). Periodogram analysis and
    variance fluctuations. <em|J. R. Statist. Soc. B>,
    <with|font-series|bold|25>, 442\U450.

    <bibitem|Herbst1963b>Herbst, L.J. (1963b). A test for variance
    heterogeneity in the residuals of a Gaussian moving average. <em|J. R.
    Statist. Soc. B>, <with|font-series|bold|25>, 451\U454.

    <bibitem|Herbst1963c>Herbst, L.J. (1963c). Almost periodic variances.
    <em|Ann. Math. Statist.>, <with|font-series|bold|34>, 1549\U1557.

    <bibitem|Jowett1957>Jowett, G.H. (1957). Statistical analysis using local
    properties of smoothly heteromorphic stochastic series. <em|Biometrika>,
    <with|font-series|bold|44>, 454\U463.

    <bibitem|LomnickiZaremba1957>Lomnicki, Z.A. and Zaremba, S.K. (1957). On
    estimating the spectral density function of a stochastic process. <em|J.
    R. Statist. Soc. B>, <with|font-series|bold|19>, 13\U37.

    <bibitem|Page1952>Page, C.H. (1952). Instantaneous power spectra. <em|J.
    Appl. Phys.>, <with|font-series|bold|23>, 103\U106.

    <bibitem|Priestley1962>Priestley, M.B. (1962). Basic consideration in the
    estimation of spectra. <em|Technometrics>, <with|font-series|bold|4>,
    551\U563.
  </thebibliography>

  <section*|Appendix: Analysis of Artificial Processes>

  To test the suggested estimation methods, artificial non-stationary
  processes were generated from known models. The main example considered is:

  <\align>
    <tformat|<table|<row|<cell|X<rsub|t>>|<cell|=e<rsup|-<around|(|t-500|)><rsup|2>/<around|[|2\<times\>200<rsup|2>|]>>*Y<rsub|t>,<eq-number>>>|<row|<cell|Y<rsub|t+2>-0.8*Y<rsub|t+1>+0.4*Y<rsub|t>>|<cell|=Z<rsub|t>,<eq-number>>>>>
  </align>

  where <math|Z<rsub|t>\<sim\>\<cal-N\><around|(|0,100<rsup|2>|)>> i.i.d.

  The spectral density of <math|Y<rsub|t>> is

  <\equation>
    f<rsup|<around|(|1|)>><around|(|\<omega\>|)>=<frac|\<sigma\><rsup|2>|2*\<pi\>>*<frac|0.792|1-0.8*cos
    \<omega\>+0.4*cos<rsup|2> \<omega\>>,<space|2em>\<sigma\><rsup|2>=<math-up|var><around|(|Y<rsub|t>|)>=1332.
  </equation>

  With respect to the family <math|F=<around|{|e<rsup|-<around|(|t-500|)><rsup|2>/2\<times\>200<rsup|2>>*e<rsup|i*t*\<omega\>>|}>>,
  the evolutionary spectrum of <math|X<rsub|t>> is

  <\equation>
    f<rsup|<around|(|x|)>><rsub|t><around|(|\<omega\>|)>=<around|[|e<rsup|-<around|(|t-500|)><rsup|2>/2\<times\>200<rsup|2>>|]><rsup|2>*f<rsup|<around|(|1|)>><around|(|\<omega\>|)>.
  </equation>

  Estimates were computed using the discrete-time analog of
  equation<nbsp><eqref|eq:Vt> with <math|W<rsub|T<rprime|'>><around|(|u|)>>
  from the Daniell window (<math|T<rprime|'>=200>) and <math|g<around|(|u|)>>
  as in<nbsp><eqref|eq:Bartlett> with <math|h=7>. For this <math|h> the
  filter's bandwidth is about half that of
  <math|f<rsup|<around|(|x|)>><rsub|t><around|(|\<omega\>|)>> at the peak.

  Details on figures and further numerical analysis are omitted for brevity.

  <section*|Discussion>

  A detailed discussion followed the main presentation, involving remarks by
  M.<nbsp>S.<nbsp>Bartlett, D.<nbsp>R.<nbsp>Brillinger,
  C.<nbsp>W.<nbsp>J.<nbsp>Granger, H.<nbsp>H.<nbsp>Robertson,
  J.<nbsp>W.<nbsp>Tukey, H.<nbsp>E.<nbsp>Daniels, G.<nbsp>A.<nbsp>Barnard,
  and a reply by M.<nbsp>B.<nbsp>Priestley. For the full text of these
  contributions, see the source document.

  <section*|References in the Discussion>

  <\thebibliography|99>
    <bibitem|Devinatz1953>Devinatz, A. (1953). Integral representations of
    positive definite functions. <em|Trans. Amer. Math. Soc.>,
    <with|font-series|bold|74>, 56\U77.

    <bibitem|Gabor1946>Gabor, D. (1946). Theory of communication. <em|J.
    Inst. Elec. Eng.>, <with|font-series|bold|93>, 429\U459.

    <bibitem|GrangerHatanaka1964>Granger, C.<nbsp>W.<nbsp>J. and Hatanaka, M.
    (1964). <em|Spectral Analysis of Economic Time Series>. Princeton:
    Princeton University Press.

    <bibitem|Hida1960>Hida, T. (1960). Canonical representations of Gaussian
    processes and their applications. <em|Mem. Coll. Sci. Univ. Kyoto>,
    <with|font-series|bold|33>, 109\U155.

    <bibitem|Levy1959>Levy, P. (1959). Sur quelques classes de fonctions
    aléatoires. <em|J. Math. Pures et App.>, <with|font-series|bold|38>,
    1\U23.

    <bibitem|Tukey1961>Tukey, J.W. (1961). Discussion, emphasising the
    connection between analysis of variance and spectrum analysis.
    <em|Technometrics>, <with|font-series|bold|3>, 191\U219.

    <bibitem|Ville1948>Ville, J. (1948). Theorie et applications de la notion
    de signal analytique. <em|Cables et Transmission>,
    <with|font-series|bold|2>, 61\U74.

    <bibitem|Zadeh1961>Zadeh, L.A. (1961). Time varying networks, I.
    <em|Proc. I.R.E.>, <with|font-series|bold|49>, 1488\U1503.
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
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|52|10>>
    <associate|auto-11|<tuple|10|10>>
    <associate|auto-12|<tuple|11|11>>
    <associate|auto-13|<tuple|61|11>>
    <associate|auto-14|<tuple|61|11>>
    <associate|auto-15|<tuple|Priestley1962|12>>
    <associate|auto-16|<tuple|65|12>>
    <associate|auto-17|<tuple|65|13>>
    <associate|auto-18|<tuple|65|13>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|4|5>>
    <associate|auto-5|<tuple|5|5>>
    <associate|auto-6|<tuple|6|6>>
    <associate|auto-7|<tuple|7|7>>
    <associate|auto-8|<tuple|8|8>>
    <associate|auto-9|<tuple|9|9>>
    <associate|bib-Bartlett1955|<tuple|Bartlett1955|11>>
    <associate|bib-Cramer1960|<tuple|Cramer1960|11>>
    <associate|bib-Devinatz1953|<tuple|Devinatz1953|13>>
    <associate|bib-Gabor1946|<tuple|Gabor1946|13>>
    <associate|bib-GrangerHatanaka1964|<tuple|GrangerHatanaka1964|13>>
    <associate|bib-GrenanderRosenblatt1957|<tuple|GrenanderRosenblatt1957|12>>
    <associate|bib-Herbst1963a|<tuple|Herbst1963a|12>>
    <associate|bib-Herbst1963b|<tuple|Herbst1963b|12>>
    <associate|bib-Herbst1963c|<tuple|Herbst1963c|12>>
    <associate|bib-Hida1960|<tuple|Hida1960|13>>
    <associate|bib-Jowett1957|<tuple|Jowett1957|12>>
    <associate|bib-Levy1959|<tuple|Levy1959|13>>
    <associate|bib-LomnickiZaremba1957|<tuple|LomnickiZaremba1957|12>>
    <associate|bib-Page1952|<tuple|Page1952|12>>
    <associate|bib-Priestley1962|<tuple|Priestley1962|12>>
    <associate|bib-Tukey1961|<tuple|Tukey1961|13>>
    <associate|bib-Ville1948|<tuple|Ville1948|13>>
    <associate|bib-Zadeh1961|<tuple|Zadeh1961|13>>
    <associate|def:evolutionary_spectrum|<tuple|3|5>>
    <associate|def:oscillatory_function|<tuple|1|4>>
    <associate|def:oscillatory_process|<tuple|2|4>>
    <associate|def:semi_stationary_family|<tuple|4|7>>
    <associate|def:semi_stationary_process|<tuple|5|7>>
    <associate|eq:A_FT|<tuple|14|4>>
    <associate|eq:A_filter|<tuple|21|5>>
    <associate|eq:A_norm|<tuple|20|5>>
    <associate|eq:BX|<tuple|39|7>>
    <associate|eq:B_F|<tuple|38|7>>
    <associate|eq:Bartlett|<tuple|53|10>>
    <associate|eq:Bw|<tuple|37|7>>
    <associate|eq:Ey2|<tuple|45|9>>
    <associate|eq:Ut|<tuple|46|9>>
    <associate|eq:Ut_f|<tuple|48|9>>
    <associate|eq:Vt|<tuple|50|10>>
    <associate|eq:X_Fstar|<tuple|40|7>>
    <associate|eq:X_filter|<tuple|22|5>>
    <associate|eq:X_theta|<tuple|16|4>>
    <associate|eq:Y_sample|<tuple|43|8>>
    <associate|eq:autocov_general|<tuple|8|3>>
    <associate|eq:autocov_stationary|<tuple|1|2>>
    <associate|eq:cov_oscill|<tuple|9|3>>
    <associate|eq:cov_theta|<tuple|15|4>>
    <associate|eq:discrete_oscillatory|<tuple|56|10>>
    <associate|eq:evolutionary_spectrum|<tuple|18|5>>
    <associate|eq:filter|<tuple|28|6>>
    <associate|eq:filter_width|<tuple|42|8>>
    <associate|eq:filtered_evospectra|<tuple|36|7>>
    <associate|eq:filtered_oscillatory|<tuple|32|6>>
    <associate|eq:filtered_spec|<tuple|29|6>>
    <associate|eq:gen_transfer|<tuple|33|7>>
    <associate|eq:nonstationary_filter|<tuple|31|6>>
    <associate|eq:orthog_measure|<tuple|11|4>>
    <associate|eq:phi_oscillatory|<tuple|13|4>>
    <associate|eq:phi_stationary|<tuple|12|4>>
    <associate|eq:process_general|<tuple|10|4>>
    <associate|eq:process_rep_stationary|<tuple|3|2>>
    <associate|eq:spectral_stationary|<tuple|2|2>>
    <associate|eq:stationary_decomp|<tuple|24|6>>
    <associate|eq:um_decomp|<tuple|25|6>>
    <associate|eq:um_spec|<tuple|26|6>>
    <associate|eq:uniformly_modulated|<tuple|23|5>>
    <associate|eq:var_evospec|<tuple|19|5>>
    <associate|eq:var_xt|<tuple|17|5>>
    <associate|lem:pseudo_delta|<tuple|7|8>>
    <associate|sec:determination|<tuple|8|8>>
    <associate|sec:discrete|<tuple|10|10>>
    <associate|sec:estimation|<tuple|9|9>>
    <associate|sec:evospectra|<tuple|4|5>>
    <associate|sec:filters|<tuple|6|6>>
    <associate|sec:further|<tuple|11|11>>
    <associate|sec:nonstationary|<tuple|2|3>>
    <associate|sec:oscillatory|<tuple|3|3>>
    <associate|thm:approximation|<tuple|8|8>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Jowett1957

      Cramer1960

      Page1952

      Bartlett1955

      GrenanderRosenblatt1957
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Non-Stationary
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Spectral
      Theory for a Class of Non-Stationary Processes: Oscillatory Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Evolutionary
      (Power) Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      Uniformly Modulated Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Effect
      of Filters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Semi-Stationary
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Determination
      of Evolutionary Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Estimation
      of Evolutionary Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Practical Windows
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Discrete
      Parameter Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|11<space|2spc>Further
      Problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix:
      Analysis of Artificial Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Discussion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References
      in the Discussion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>