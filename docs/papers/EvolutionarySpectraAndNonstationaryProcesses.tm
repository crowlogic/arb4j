<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Evolutionary Spectra and Non-Stationary
  Processes>|<doc-author|<author-data|<author-name|M. B.
  Priestley>|<author-affiliation|University of Manchester>>>>

  <abstract-data|<\abstract>
    We develop an approach to the spectral analysis of non-stationary
    processes which is based on the concept of "evolutionary spectra"; that
    is, spectral functions which are time dependent, and have a physical
    interpretation as local energy distributions over frequency. It is shown
    that the notion of evolutionary spectra generalizes the usual definition
    of spectra for stationary processes, and that, under certain conditions,
    the evolutionary spectrum at each instant of time may be estimated from a
    single realization of a process. By such means it is possible to study
    processes with continuously changing "spectral patterns".
  </abstract>>

  <section|Introduction><label|sec:introduction>

  In the classical approach to statistical spectral analysis it is always
  assumed that the process under study, <math|X<rsub|t>>, is stationary, at
  least up to the second order. That is, we assume that
  <math|E<around|(|X<rsub|t>|)>=\<mu\>>, a constant (independent of <math|t>)
  which we may take to be zero, and that, for each <math|s> and <math|t>, the
  covariance

  <\equation>
    <label|eq:covariance_def>R<rsub|s,t>=E*<around|{|<around|(|X<rsub|s>-\<mu\>|)>*<around|(|X<rsub|t>-\<mu\>|)><rsup|\<ast\>>|}>
  </equation>

  (* denoting the complex conjugate) is a function of
  <math|<around|\||s-t|\|>> only. In this case it is well known that
  <math|R<rsub|s,t>> has a spectral representation of the form

  <\equation>
    <label|eq:spectral_representation>R<rsub|s,t>=<big|int>e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*F<around|(|\<omega\>|)>
  </equation>

  where <math|F<around|(|\<omega\>|)>> is some function having the properties
  of a distribution function, and the range of integration is
  <math|<around|(|-\<infty\>,\<infty\>|)>> for a continuous parameter
  process, and <math|<around|(|-\<pi\>,\<pi\>|)>> in the discrete case.

  Corresponding to <eqref|eq:spectral_representation>,
  <math|<around|{|X<rsub|t>|}>> has a spectral representation of the form

  <\equation>
    <label|eq:process_spectral_representation>X<rsub|t>=<big|int>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is an orthogonal process with
  <math|E<around|{|<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>|}>=d*F<around|(|\<omega\>|)>>.
  When <math|<around|{|X<rsub|t>|}>> represents some physical process, the
  spectral density function <math|f<around|(|\<omega\>|)>=F<rprime|'><around|(|\<omega\>|)>>
  (when it exists) describes the distribution (over the frequency range) of
  the energy (per unit time) dissipated by the process, and given a sample
  record of <math|<around|{|X<rsub|t>|}>>, there are several methods of
  estimating <math|f<around|(|\<omega\>|)>> (see, e.g., Grenander and
  Rosenblatt, 1957, Ch. 4).

  In practice, however, it often happens that the assumption of stationarity
  is a very doubtful one. For example, records of atmospheric turbulence
  exhibit marked changes over periods of time, and in such cases classical
  spectral analysis based on a stationary model can hardly be carried through
  with conviction. The question arises, therefore, as to whether it might be
  possible to formulate a spectral theory for non-stationary processes within
  the framework of classical concepts such as "energy" and "frequency", so
  that a spectral function (however defined) would still possess a meaningful
  and useful physical interpretation.

  Intuitively it seems obvious that if no restrictions (other than finite
  first and second moments) are placed on the class of non-stationary
  processes considered, no useful inferences may be drawn from a single
  sample record. On the other hand, if one considers a non-stationary process
  of the form

  <\equation>
    <label|eq:piecewise_stationary>X<rsub|t>=<choice|<tformat|<table|<row|<cell|X<rsub|t><rsup|<around|(|1|)>>>|<cell|<around|(|t\<leq\>t<rsub|0>|)>>>|<row|<cell|X<rsub|t><rsup|<around|(|2|)>>>|<cell|<around|(|t\<gtr\>t<rsub|0>|)>>>>>>
  </equation>

  where both <math|<around|{|X<rsub|t><rsup|<around|(|1|)>>|}>> and
  <math|<around|{|X<rsub|t><rsup|<around|(|2|)>>|}>> are stationary but with
  different autocovariance functions, then it is clear that given a sample
  record, say from <math|t=t<rsub|0>-T> to <math|t=t<rsub|0>+T>, it is
  certainly possible to infer "something" about the spectral content of
  <math|X<rsub|t>>. If, in the above example, <math|t<rsub|0>> were known,
  one would presumably estimate two spectral density functions, one for
  <math|<around|{|X<rsub|t><rsup|<around|(|1|)>>|}>> and one for
  <math|<around|{|X<rsub|t><rsup|<around|(|2|)>>|}>>. If now we try to
  generalize this approach, we are led to the notion of a continuously
  changing spectrum, or more precisely, a time-dependent spectrum.

  Clearly, in such a case, we could never hope to estimate the spectrum at a
  particular instant of time, but if we assume that the spectrum is changing
  slowly over time, then by using estimates which involve only local
  functions of <math|<around|{|X<rsub|t>|}>>, we may attempt to estimate some
  form of "average" spectrum of <math|X<rsub|t>> in the neighbourhood of any
  particular time-instant. We therefore consider a class of processes whose
  non-stationary characteristics are changing slowly over time, and in this
  respect our approach is conceived in the same spirit as Jowett's study of
  "smoothly heteromorphic" processes (Jowett, 1957).

  <section|Non-Stationary Processes><label|sec:non_stationary>

  There have been several attempts to define a spectrum for a non-stationary
  process, but in each case the object was to obtain a single function whose
  properties depended on the behaviour of the process over the whole
  parameter space. Cramer (1960) considered the class of processes which are
  harmonizable (in the Loève sense), that is, have a representation of the
  form <eqref|eq:process_spectral_representation> but without the restriction
  that <math|Z<around|(|\<omega\>|)>> must be orthogonal, and he defined the
  integrated spectrum (now a function of two variables) by

  <\equation>
    <label|eq:cramer_spectrum>d*F<around|(|\<omega\>,\<nu\>|)>=E*<around|{|d*Z<around|(|\<omega\>|)>*d*Z<rsup|\<ast\>><around|(|\<nu\>|)>|}>
  </equation>

  On the other hand, Hatanaka and Suzuki (unpublished) define the spectrum
  (or more precisely, spectral density function) of any non-stationary
  process as the limit of the expected value of the periodogram as the sample
  size tends to infinity. In our approach, however, we define a spectral
  quantity whose physical interpretation is similar to that of the spectrum
  of a stationary process.

  A somewhat related idea was developed by Page (1952) who introduced the
  idea of "instantaneous power spectra". In effect Page defines the spectrum
  in the same way as Hatanaka and Suzuki, i.e. as

  <\equation>
    <label|eq:page_spectrum>f<rsup|\<ast\>><around|(|\<omega\>|)>=lim<rsub|T\<to\>\<infty\>>
    f<rsub|T><around|(|\<omega\>|)>
  </equation>

  where

  <\equation>
    <label|eq:periodogram_def>f<rsub|T><around|(|\<omega\>|)>=<frac|1|2*\<pi\>*T><around*|\||<big|int><rsub|0><rsup|T>X<rsub|t>*e<rsup|-i*\<omega\>*t>*d*t|\|><rsup|2>
  </equation>

  and then defines the instantaneous power spectrum
  <math|P<rsub|t><around|(|\<omega\>|)>> by writing, for each
  <math|\<omega\>>,

  <\equation>
    <label|eq:instantaneous_power>f<rsub|T><around|(|\<omega\>|)>=<frac|1|T>*<big|int><rsub|0><rsup|T>P<rsub|t><around|(|\<omega\>|)>*d*t
  </equation>

  so that

  <\equation>
    <label|eq:pt_definition>P<rsub|t><around|(|\<omega\>|)>=<frac|d|d*t>*<around|{|t*f<rsub|T><around|(|\<omega\>|)>|}>
  </equation>

  Thus, the instantaneous power spectrum,
  <math|P<rsub|t><around|(|\<omega\>|)>>, represents the difference between
  the spectral content of the process over the interval
  <math|<around|(|0,t+\<delta\>*t|)>> and the interval
  <math|<around|(|0,t|)>>. This is in contrast with the approach developed
  below, whose object (roughly speaking) is to study the spectral content of
  the process within the interval <math|<around|(|t,t+\<delta\>*t|)>>. We
  feel that this latter quantity is the more relevant one as far as physical
  interpretation is concerned.

  <section|Spectral Theory for a Class of Non-Stationary Processes:
  Oscillatory Processes><label|sec:oscillatory_processes>

  Consider a continuous parameter (complex-valued) stochastic process
  <math|<around|{|X<rsub|t>|}>>, <math|-\<infty\>\<less\>t\<less\>\<infty\>>.
  (Most of the following discussion will, with the usual modifications, apply
  equally well to discrete parameter processes.) We assume that the process
  is "trend free", that is, we may write <math|E<around|(|X<rsub|t>|)>=0>,
  all <math|t>, and define the autocovariance function by

  <\equation>
    <label|eq:autocovariance_def>R<rsub|s,t>=E*<around|(|X<rsub|s>*X<rsub|t><rsup|\<ast\>>|)>
  </equation>

  We now restrict attention to the class of process for which there exists a
  family of functions <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>>
  defined on the real line, and indexed by the suffix <math|t>, and a measure
  <math|\<mu\><around|(|\<omega\>|)>> on the real line, such that for each
  <math|s,t>, the covariance function <math|R<rsub|s,t>> admits a
  representation of the form

  <\equation>
    <label|eq:covariance_representation>R<rsub|s,t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|s><around|(|\<omega\>|)>*\<phi\><rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>
  </equation>

  When the parameter space is limited to a finite interval, say
  <math|0\<less\>t\<less\>T>, it is always possible to obtain a
  representation of the form <eqref|eq:covariance_representation> in terms of
  the eigenfunctions of the covariance kernel <math|<around|{|R<rsub|s,t>|}>>
  (Parzen, unpublished). It should be noted that although we have described
  <math|\<Phi\>> as a family of functions, each defined on the
  <math|\<omega\>>-axis and indexed by the parameter <math|t>, we may also
  think of <math|\<Phi\>> as a family of functions
  <math|<around|{|\<psi\><rsub|\<omega\>><around|(|t|)>|}>>, say, each
  defined on the <math|t>-axis and indexed by the parameter <math|\<omega\>>.
  In fact, when we study the properties of various families (Section 7), it
  is convenient to adopt the latter description.

  In order for var<math|<around|(|X<rsub|t>|)>> to be finite for each
  <math|t>, <math|\<phi\><rsub|t><around|(|\<omega\>|)>> must be
  quadratically integrable with respect to the measure <math|\<mu\>> for each
  <math|t>. It may then be shown (see, e.g., Bartlett, 1955, P. 143;
  Grenander and Rosenblatt, 1957, P. 27) that whenever <math|R<rsub|s,t>> has
  the representation <eqref|eq:covariance_representation>, the process
  <math|<around|{|X<rsub|t>|}>> admits a representation of the form

  <\equation>
    <label|eq:process_representation>X<rsub|t>=<big|int>\<phi\><rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is an orthogonal process, with

  <\equation>
    <label|eq:orthogonal_measure>E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>
  </equation>

  The measure <math|\<mu\><around|(|\<omega\>|)>> here plays the same role as
  the integrated spectrum <math|F<around|(|\<omega\>|)>> does in the case of
  stationary processes, so that the analogous situation to the case of an
  absolutely continuous spectrum is obtained by assuming that the measure
  <math|\<mu\><around|(|\<omega\>|)>> is absolutely continuous with respect
  to Lebesgue measure.

  Parzen (unpublished) has pointed out that if there exists a representation
  of <math|<around|{|X<rsub|t>|}>> of the form
  <eqref|eq:process_representation>, then there is a multitude of different
  representations of the process, each representation based on a different
  family of functions. (The situation is in some ways similar to the
  selection of a basis for a vector space.) When the process is stationary,
  one valid choice of functions is the complex exponential family given by

  <\equation>
    <label|eq:stationary_family>\<phi\><rsub|t><around|(|\<omega\>|)>=e<rsup|i*\<omega\>*t>
  </equation>

  This family provides the well-known spectral decomposition (cf.
  <eqref|eq:process_spectral_representation>) in terms of sine and cosine
  "waves", and forms the basis of the physical interpretation of spectral
  analysis as an "energy distribution over frequency". However, if the
  process is non-stationary this choice of family of functions is no longer
  valid (since the representation <eqref|eq:process_spectral_representation>
  implies that <math|<around|{|X<rsub|t>|}>> is stationary), and the physical
  concept of "frequency" would appear to be no longer directly relevant. This
  is hardly surprising, since the sine and cosine waves are themselves
  "stationary" and it is natural that they should form the "basic elements"
  used in building up models of stationary processes. If we wish to introduce
  the notion of frequency in the analysis of non-stationary processes, we are
  led to seeking new "basic elements" which, although "non-stationary", have
  an oscillatory form, and in which the notion of "frequency" is still
  dominant.

  One class of basic elements (or more precisely, family of functions) which
  possess the required structure may be obtained as follows. Suppose that,
  for each fixed <math|\<omega\>>, <math|\<phi\><rsub|t><around|(|\<omega\>|)>>
  (considered as a function of <math|t>) possesses a (generalized) Fourier
  transform whose modulus has an absolute maximum at frequency
  <math|\<theta\><around|(|\<omega\>|)>>, say. Then we may regard
  <math|\<phi\><rsub|t><around|(|\<omega\>|)>> as an amplitude modulated sine
  wave with frequency <math|\<theta\><around|(|\<omega\>|)>>, and write
  <math|\<phi\><rsub|t><around|(|\<omega\>|)>> in the form

  <\equation>
    <label|eq:oscillatory_form>\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<theta\><around|(|\<omega\>|)>*t>
  </equation>

  where the modulating function <math|A<rsub|t><around|(|\<omega\>|)>> is
  such that the modulus of its (generalized) Fourier transform has an
  absolute maximum at the origin (i.e. zero frequency). We now formalize this
  approach in the following definition.

  <\definition>
    <label|def:oscillatory_function>The function of <math|t>,
    <math|\<phi\><rsub|t><around|(|\<omega\>|)>>, will be said to be an
    oscillatory function if, for some (necessarily unique)
    <math|\<theta\><around|(|\<omega\>|)>> it may be written in the form
    <eqref|eq:oscillatory_form>, where <math|A<rsub|t><around|(|\<omega\>|)>>
    is of the form

    <\equation>
      <label|eq:amplitude_form>A<rsub|t><around|(|\<omega\>|)>=<big|int>e<rsup|i*\<theta\>*t>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>
    </equation>

    with <math|<around|\||d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>>
    having an absolute maximum at <math|\<theta\>=0>. (The function
    <math|A<rsub|t><around|(|\<omega\>|)>> may be regarded as the "envelope"
    of <math|\<phi\><rsub|t><around|(|\<omega\>|)>>.)
  </definition>

  If, further, the family <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>>
  is such that <math|\<theta\><around|(|\<omega\>|)>> is a single-valued
  function of <math|\<omega\>> (i.e. if no two distinct members of the family
  have Fourier transforms whose maxima occur at the same point), then we may
  transform the variable in the integral in
  <eqref|eq:covariance_representation> from <math|\<omega\>> to
  <math|\<theta\><around|(|\<omega\>|)>>, and by suitably redefining
  <math|A<rsub|t><around|(|\<omega\>|)>> and the measure
  <math|\<mu\><around|(|\<omega\>|)>>, write

  <\equation>
    <label|eq:transformed_covariance>R<rsub|s,t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><around|(|\<omega\>|)>*A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*\<mu\><around|(|\<omega\>|)>
  </equation>

  and correspondingly

  <\equation>
    <label|eq:transformed_process>X<rsub|t>=<big|int>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>>.

  <\definition>
    <label|def:oscillatory_process>If there exists a family of oscillatory
    functions <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>>, in
    terms of which the process <math|<around|{|X<rsub|t>|}>> has a
    representation of the form <eqref|eq:covariance_representation>,
    <math|<around|{|X<rsub|t>|}>> will be termed an "oscillatory process".
  </definition>

  It follows that any oscillatory process also has a representation of the
  form <eqref|eq:transformed_process>, where the family
  <math|A<rsub|t><around|(|\<omega\>|)>> satisfies the condition of
  Definition<nbsp><reference|def:oscillatory_function>, and that, without
  loss of generality, we may write any family of oscillatory functions in the
  form

  <\equation>
    <label|eq:standard_oscillatory_form>\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>
  </equation>

  We may note that, since <eqref|eq:stationary_family> is a particular case
  of <eqref|eq:oscillatory_form> (with <math|A<rsub|t><around|(|\<omega\>|)>\<equiv\>1>,
  all <math|t,\<omega\>>, and <math|\<theta\><around|(|\<omega\>|)>=\<omega\>>),
  the class of oscillatory processes certainly includes all second-order
  stationary processes.

  <section|Evolutionary (Power) Spectra><label|sec:evolutionary_spectra>

  Consider an oscillatory process of the form <eqref|eq:transformed_process>,
  with autocovariance function, <math|R<rsub|s,t>>, of the form
  <eqref|eq:transformed_covariance>. For any particular process
  <math|<around|{|X<rsub|t>|}>> there will, in general, be a large number of
  different families of oscillatory functions in terms of each of which
  <math|<around|{|X<rsub|t>|}>> has a representation of the form
  <eqref|eq:transformed_process>, with each family inducing a different
  measure <math|\<mu\><around|(|\<omega\>|)>>. For a particular family,
  <math|\<cal-F\>>, of spectral functions
  <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>>, it is tempting
  to define the spectrum of <math|<around|{|X<rsub|t>|}>> (with respect to
  <math|\<cal-F\>>) simply as the measure
  <math|\<mu\><around|(|\<omega\>|)>>. However, such a definition would not
  have the interpretation of an "energy distribution over frequency". For,
  from <eqref|eq:transformed_covariance>, we may write

  <\equation>
    <label|eq:variance_decomposition><text|var><around|(|X<rsub|t>|)>=R<rsub|t,t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
  </equation>

  Since var<math|<around|(|X<rsub|t>|)>> may be interpreted as a measure of
  the "total energy" of the process at time <math|t>,
  <eqref|eq:variance_decomposition> gives a decomposition of total energy in
  which the contribution from "frequency" <math|\<omega\>> is
  <math|<around|{|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>|}>>.
  This result is consistent with the interpretation of equation
  <eqref|eq:transformed_process> as an expression for <math|X<rsub|t>> as the
  limiting form of a "sum" of sine waves with different frequencies and
  time-varying random amplitudes <math|<around|{|A<rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)>|}>>.

  We are thus led to the following definition.

  <\definition>
    <label|def:evolutionary_spectrum>Let <math|\<cal-F\>> denote a particular
    family of oscillatory functions, let <math|<around|{|X<rsub|t>|}>> be an
    oscillatory process having a representation of the form
    <eqref|eq:transformed_process> in terms of the family <math|\<cal-F\>>.
    We define the evolutionary power spectrum at time <math|t> with respect
    to the family <math|\<cal-F\>>, <math|d*F<rsub|t><around|(|\<omega\>|)>>,
    by

    <\equation>
      <label|eq:evolutionary_spectrum_def>d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
    </equation>
  </definition>

  Note that when <math|<around|{|X<rsub|t>|}>> is stationary, and
  <math|\<cal-F\>> is chosen to be the family of complex exponentials,
  <math|d*F<rsub|t><around|(|\<omega\>|)>> reduces to the standard definition
  of the (integrated) spectrum. The evolutionary spectrum has the same
  physical interpretation as the spectrum of a stationary process, namely,
  that it describes a distribution of energy over frequency, but whereas the
  latter is determined by the behaviour of the process over all time, the
  former represents specifically the spectral content of the process in the
  neighbourhood of the time instant <math|t>.

  Although, according to Definition<nbsp><reference|def:evolutionary_spectrum>,
  the evolutionary spectrum, <math|d*F<rsub|t><around|(|\<omega\>|)>>,
  depends on the choice of family <math|\<cal-F\>>, it follows from equation
  <eqref|eq:variance_decomposition> that

  <\equation>
    <label|eq:total_energy_invariance><text|var><around|(|X<rsub|t>|)>=<big|int>d*F<rsub|t><around|(|\<omega\>|)>
  </equation>

  so that the value of the integral of <math|d*F<rsub|t><around|(|\<omega\>|)>>
  is independent of the particular family <math|\<cal-F\>>, and, for all
  families, represents the total energy of the process at time <math|t>.

  It is now convenient to "standardize" the functions
  <math|A<rsub|t><around|(|\<omega\>|)>> so that, for all <math|\<omega\>>,

  <\equation>
    <label|eq:standardization>A<rsub|0><around|(|\<omega\>|)>=1
  </equation>

  i.e. we incorporate <math|<around|\||A<rsub|0><around|(|\<omega\>|)>|\|><rsup|2>>
  in the measure <math|\<mu\><around|(|\<omega\>|)>>. With this convention,
  <math|d*F<rsub|t><around|(|\<omega\>|)>> represents the evolutionary
  spectrum at <math|t=0>, and <math|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>>
  represents the change in the spectrum, relative to zero time. We now have,
  for each <math|\<omega\>>,

  <\equation>
    <label|eq:normalized_integral><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>=1
  </equation>

  so that the Fourier transforms of the <math|<around|{|A<rsub|t><around|(|\<omega\>|)>|}>>
  are normalized to have unit integrals.

  There is an interesting alternative interpretation of oscillatory processes
  in terms of time-varying filters. Let <math|<around|{|X<rsub|t>|}>> be of
  the form <eqref|eq:transformed_process> and suppose that for each fixed
  <math|t> we may write (formally)

  <\equation>
    <label|eq:filter_representation>A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)>*d*u
  </equation>

  Then from <eqref|eq:transformed_process>

  <\equation>
    <label|eq:filtered_process>X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t-u>*h<rsub|t><around|(|u|)>*d*u
  </equation>

  where

  <\equation>
    <label|eq:stationary_component>S<rsub|t>=<big|int>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  is a stationary process with spectrum <math|d*\<mu\><around|(|\<omega\>|)>>.
  Thus <math|X<rsub|t>> may be interpreted as the result of passing a
  stationary process through a time-varying filter
  <math|<around|{|h<rsub|t><around|(|u|)>|}>>. Conversely, any process of the
  form <eqref|eq:filtered_process> (with <math|h<rsub|t><around|(|u|)>>
  chosen so that <math|A<rsub|t><around|(|\<omega\>|)>> is of the required
  form) may be written in the form <eqref|eq:transformed_process>. Thus the
  evolutionary spectrum at time <math|t>,
  <math|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>>,
  may be interpreted as the spectrum (in the classical sense) of the
  stationary process which we would have obtained if the filter
  <math|<around|{|h<rsub|t><around|(|u|)>|}>> was held fixed in the state
  which it attained at the time instant <math|t>.

  In Section<nbsp><reference|sec:estimation> we show how, for a certain class
  of processes, evolutionary spectra may be estimated from a sample record of
  <math|<around|{|X<rsub|t>|}>>, and by examining the variations of
  <math|d*F<rsub|t><around|(|\<omega\>|)>> over time we are enabled to study
  continuously the changing spectral pattern of the process.

  <section|The Uniformly Modulated Process><label|sec:uniformly_modulated>

  One interesting example of a non-stationary process satisfying the model
  <eqref|eq:transformed_process> is the following

  <\equation>
    <label|eq:uniformly_modulated_def>X<rsub|t>=c<around|(|t|)>*X<rsub|t><rsup|<around|(|0|)>>
  </equation>

  where <math|<around|{|X<rsub|t><rsup|<around|(|0|)>>|}>> is a stationary
  process with zero mean and spectrum <math|d*F<around|(|\<omega\>|)>>, and
  the function <math|c<around|(|t|)>> (with <math|c<around|(|0|)>=1>) has a
  (generalized) Fourier transform whose modulus has an absolute maximum at
  the origin. (For example, <math|c<around|(|t|)>> may be any non-negative
  real-valued function whose Fourier transform exists.) Processes of the form
  <eqref|eq:uniformly_modulated_def> have been studied by Herbst (1963a, b,
  c). Since <math|<around|{|X<rsub|t><rsup|<around|(|0|)>>|}>> is stationary,
  we may write

  <\equation>
    <label|eq:stationary_representation>X<rsub|t><rsup|<around|(|0|)>>=<big|int>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is orthogonal with
  <math|E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*F<around|(|\<omega\>|)>>,
  so that

  <\equation>
    <label|eq:modulated_representation>X<rsub|t>=<big|int>c<around|(|t|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  We may note that since <math|\<cal-F\><rsub|0>=<around|{|c<around|(|t|)>*e<rsup|i*\<omega\>*t>|}>>
  is a family of oscillatory functions, the process defined by
  <eqref|eq:uniformly_modulated_def> is an oscillatory process and, with
  respect to <math|\<cal-F\><rsub|0>>, has evolutionary spectrum

  <\equation>
    <label|eq:uniformly_modulated_spectrum>d*F<rsub|t><around|(|\<omega\>|)>=<around|\||c<around|(|t|)>|\|><rsup|2>*d*F<around|(|\<omega\>|)>
  </equation>

  It should be observed, however, that the process defined by
  <eqref|eq:uniformly_modulated_def> is a very special case of the model
  <eqref|eq:transformed_process>, in that all the spectral components (with
  respect to <math|\<omega\>>) are varying over time in exactly the same way.
  More specifically, for any pair of frequencies
  <math|\<omega\><rsub|1>,\<omega\><rsub|2>>, and time instants
  <math|t<rsub|1>,t<rsub|2>>,

  <\equation>
    <label|eq:uniform_modulation_ratio><frac|d*F<rsub|t<rsub|1>><around|(|\<omega\><rsub|1>|)>|d*F<rsub|t<rsub|1>><around|(|\<omega\><rsub|2>|)>>=<frac|d*F<rsub|t<rsub|2>><around|(|\<omega\><rsub|1>|)>|d*F<rsub|t<rsub|2>><around|(|\<omega\><rsub|2>|)>>
  </equation>

  A process for which there exists a family <math|\<cal-F\>> such that the
  evolutionary spectrum (with respect to <math|\<cal-F\>>) has the above
  property will be called a uniformly modulated process.

  <section|Effect of Filters><label|sec:filters>

  One of the most useful features of the spectral representation of
  stationary processes is that it enables the effect of linear
  transformations (i.e. "filters") to be described purely in terms of the
  effect on individual spectral components. Thus, if we consider a linear
  transformation of a stationary process <math|<around|{|X<rsub|t>|}>>, of
  the form

  <\equation>
    <label|eq:filter_def>Y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*X<rsub|t-u>*d*u
  </equation>

  then it is well known that (with an obvious notation) the spectra of
  <math|<around|{|X<rsub|t>|}>> and <math|<around|{|Y<rsub|t>|}>> are related
  by

  <\equation>
    <label|eq:filter_spectrum>d*F<rsup|<around|(|Y|)>><around|(|\<omega\>|)>=<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsup|<around|(|X|)>><around|(|\<omega\>|)>
  </equation>

  where

  <\equation>
    <label|eq:transfer_function>\<Gamma\><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*e<rsup|-i*\<omega\>*u>*d*u
  </equation>

  is termed the transfer function of the filter
  <math|<around|{|g<around|(|u|)>|}>>. Hence
  <math|d*F<rsup|<around|(|Y|)>><around|(|\<omega\><rsub|1>|)>>, say, is
  determined purely by <math|d*F<rsup|<around|(|X|)>><around|(|\<omega\><rsub|1>|)>>
  and <math|\<Gamma\><around|(|\<omega\><rsub|1>|)>> and is not affected by
  <math|d*F<rsup|<around|(|X|)>><around|(|\<omega\>|)>> at other frequencies.

  We now show that this property holds (in an approximate sense) for
  evolutionary spectra when we consider linear transformations of
  non-stationary processes.

  Suppose that <math|<around|{|X<rsub|t>|}>> satisfies a model of the form
  <eqref|eq:transformed_process>, and consider a slightly more general form
  of the transformation <eqref|eq:filter_def>, namely

  <\equation>
    <label|eq:generalized_filter>Y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>*d*u
  </equation>

  where <math|\<omega\><rsub|0>> is any constant frequency. Then we may write

  <\equation>
    <label|eq:filtered_representation>Y<rsub|t>=<big|int>\<Gamma\><rsub|t,\<omega\><rsub|0>><around|(|\<omega\>|)>*A<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>*d*Z*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  where, for any <math|t,\<lambda\>>,

  <\equation>
    <label|eq:generalized_transfer>\<Gamma\><rsub|t,\<lambda\>><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)><around*|{|<frac|A<rsub|t-u><around|(|\<lambda\>|)>|A<rsub|t><around|(|\<lambda\>|)>>|}>*e<rsup|-i*\<omega\>*u>*d*u
  </equation>

  The function <math|\<Gamma\><rsub|t,\<lambda\>><around|(|\<omega\>|)>> will
  be termed the generalized transfer function of the filter
  <math|<around|{|g<around|(|u|)>|}>> with respect to the family
  <math|\<cal-F\>>.

  Now the representation of <math|<around|{|Y<rsub|t>|}>> given by
  <eqref|eq:filtered_representation> is not necessarily of the form
  <eqref|eq:transformed_process>, since the modulus of the (generalized)
  Fourier transform of <math|<around|{|\<Gamma\><rsub|t,\<omega\><rsub|0>><around|(|\<omega\>|)>*A<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|}>>
  may not have an absolute maximum at zero frequency. If not, then the
  function

  <\equation>
    <label|eq:modified_family>\<psi\><rsub|t,\<omega\><rsub|0>><around|(|\<omega\>|)>=\<Gamma\><rsub|t,\<omega\><rsub|0>><around|(|\<omega\>|)>*A<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>
  </equation>

  will still, in general, be oscillatory, but its "dominant" frequency will
  be slightly shifted from <math|\<omega\>>.

  There is, however, an important case where, for each <math|t,\<lambda\>>,
  the function <math|\<psi\><rsub|t,\<lambda\>><around|(|\<omega\>|)>>
  reduces approximately to <math|\<Gamma\><around|(|\<omega\>|)>>, namely
  when <math|A<rsub|t-u><around|(|\<lambda\>|)>> is, for each
  <math|t,\<lambda\>>, slowly varying compared with the function
  <math|g<around|(|u|)>>. Thus, we assume that <math|g<around|(|u|)>> decays
  rapidly to zero as <math|<around|\||u|\|>\<to\>\<infty\>>, and that
  <math|A<rsub|t-u><around|(|\<lambda\>|)>> is approximately constant over
  the range of <math|u> for which <math|g<around|(|u|)>> is non-negligible.
  In this case, we may write heuristically (for each <math|t,\<lambda\>>)

  <\equation>
    <label|eq:approximate_transfer>\<Gamma\><rsub|t,\<lambda\>><around|(|\<omega\>|)>\<approx\>\<Gamma\><around|(|\<omega\>|)>
  </equation>

  so that using <eqref|eq:filtered_representation> we may write
  <math|<around|{|Y<rsub|t>|}>> in the form

  <\equation>
    <label|eq:approximate_filtered_process>Y<rsub|t>=<big|int>\<Gamma\><around|(|\<omega\><rsub|0>|)>*A<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  where

  <\equation>
    <label|eq:orthogonal_measure_shifted>E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=<around|\||\<Gamma\><around|(|\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  Thus, we have

  <\equation>
    <label|eq:filtered_evolutionary_spectrum>d*F<rsub|t><rsup|<around|(|Y|)>><around|(|\<omega\>|)>=<around|\||\<Gamma\><around|(|\<omega\><rsub|0>|)>|\|><rsup|2>*d*F<rsub|t><rsup|<around|(|X|)>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  where the evolutionary spectra <math|d*F<rsub|t><rsup|<around|(|Y|)>><around|(|\<omega\>|)>>
  and <math|d*F<rsub|t><rsup|<around|(|X|)>><around|(|\<omega\>|)>> are both
  defined with respect to the same family of oscillatory functions
  <math|<around|{|A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>|}>>.

  In order to define more precisely the notion of a "slowly varying" function
  <math|A<rsub|t-u><around|(|\<lambda\>|)>>, and to examine in more detail
  the approximation <eqref|eq:approximate_transfer>, we now introduce the
  notion of "semi-stationary processes".

  <section|Semi-Stationary Processes><label|sec:semi_stationary>

  Let <math|<around|{|X<rsub|t>|}>> be an oscillatory process whose
  non-stationary characteristics are changing "slowly" over time. Then we may
  expect that there will exist a family <math|\<cal-F\>> of oscillatory
  functions <math|\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>
  in terms of which <math|<around|{|X<rsub|t>|}>> has a representation of the
  form <eqref|eq:transformed_process>, and which are such that, for each
  <math|\<omega\>>, <math|A<rsub|t><around|(|\<omega\>|)>> is (in some sense)
  a slowly varying function of <math|t>. Now there are, of course, various
  ways of defining a slowly varying function, but for our purposes the most
  convenient characterization is obtained by specifying that its Fourier
  transform must be "highly concentrated" in the region of zero frequency.

  For each family <math|\<cal-F\>>, define the function
  <math|B<rsub|\<cal-F\>><around|(|\<omega\>|)>> by

  <\equation>
    <label|eq:bandwidth_def>B<rsub|\<cal-F\>><around|(|\<omega\>|)>=<big|int><around|\||\<theta\>|\|>*<around|\||d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>
  </equation>

  (Note that <math|B<rsub|\<cal-F\>><around|(|\<omega\>|)>> is a measure of
  the "width" of <math|<around|\||d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>>.)

  <\definition>
    <label|def:semi_stationary_family>A family <math|\<cal-F\>> of
    oscillatory functions will be termed semi-stationary if the function
    <math|B<rsub|\<cal-F\>><around|(|\<omega\>|)>> is bounded for all
    <math|\<omega\>>, and the constant, <math|B<rsub|\<cal-F\>>>, defined by

    <\equation>
      <label|eq:characteristic_width>B<rsub|\<cal-F\>>=<around*|[|sup<rsub|\<omega\>><around|{|B<rsub|\<cal-F\>><around|(|\<omega\>|)>|}>|]><rsup|-1>
    </equation>

    will be termed the characteristic width of the family <math|\<cal-F\>>.
  </definition>

  <\definition>
    <label|def:semi_stationary_process>A semi-stationary process
    <math|<around|{|X<rsub|t>|}>> is now defined as one for which there
    exists a semi-stationary family <math|\<cal-F\>> in terms of which
    <math|<around|{|X<rsub|t>|}>> has a representation of the form
    <eqref|eq:transformed_process>.
  </definition>

  For example, the uniformly modulated process, defined in
  Section<nbsp><reference|sec:uniformly_modulated>, is a semi-stationary
  process, since the family <math|\<cal-F\><rsub|0>=<around|{|c<around|(|t|)>*e<rsup|i*\<omega\>*t>|}>>
  is semi-stationary. (Note that, since <math|c<around|(|t|)>> is independent
  of <math|\<omega\>>, <math|B<rsub|\<cal-F\><rsub|0>><around|(|\<omega\>|)>>
  is independent of <math|\<omega\>>.)

  For a particular semi-stationary process <math|<around|{|X<rsub|t>|}>>
  consider the class <math|\<cal-C\>> of semi-stationary families
  <math|\<cal-F\>>, in terms of each of which <math|<around|{|X<rsub|t>|}>>
  admits a spectral representation. We define the characteristic width of the
  process <math|<around|{|X<rsub|t>|}>>, <math|B<rsub|X>>, by

  <\equation>
    <label|eq:process_characteristic_width>B<rsub|X>=sup<rsub|\<cal-F\>\<in\>\<cal-C\>><around|(|B<rsub|\<cal-F\>>|)>
  </equation>

  Roughly speaking, <math|B<rsub|X>> may be interpreted as the maximum
  interval over which the process may be treated as "approximately
  stationary". Note that for stationary processes the class <math|\<cal-C\>>
  contains the family of complex exponentials, which has infinite
  characteristic width. Consequently, all stationary processes have infinite
  characteristic width.

  Now let <math|\<cal-C\><rsup|\<ast\>>\<subset\>\<cal-C\>> denote the
  sub-class of families whose characteristic widths are each equal to
  <math|B<rsub|X>>, and let <math|\<cal-F\><rsup|\<ast\>>> denote any family
  <math|\<in\>\<cal-C\><rsup|\<ast\>>>. For example, if
  <math|<around|{|X<rsub|t>|}>> is stationary, <math|\<cal-C\><rsup|\<ast\>>>
  contains only one family, namely the complex exponentials, so that
  <math|\<cal-F\><rsup|\<ast\>>> is uniquely determined as this family.
  (However, as far as the theory of evolutionary spectra is concerned, the
  uniqueness of <math|\<cal-F\><rsup|\<ast\>>> is not required\Vsee
  Section<nbsp><reference|sec:determination>.) If
  <math|\<cal-C\><rsup|\<ast\>>> is empty, let <math|\<cal-F\><rsup|\<ast\>>>
  denote any family whose characteristic width is arbitrarily close to
  <math|B<rsub|X>>.

  We now consider the spectral representation of
  <math|<around|{|X<rsub|t>|}>> in terms of the family
  <math|\<cal-F\><rsup|\<ast\>>>. Thus, we write

  <\equation>
    <label|eq:optimal_representation>X<rsub|t>=<big|int>A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>
  </equation>

  where <math|E*<around|\||d*Z<rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>>,
  say, and the functions <math|\<Phi\><rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>=<around|{|A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>|}>\<in\>\<cal-F\><rsup|\<ast\>>>.

  It is now clear that if the evolutionary spectrum of
  <math|<around|{|X<rsub|t>|}>> is defined with respect to
  <math|\<cal-F\><rsup|\<ast\>>>, <eqref|eq:filtered_evolutionary_spectrum>
  will be a valid approximation provided that the "width" of
  <math|g<around|(|u|)>> is much smaller than <math|B<rsub|X>>, i.e. provided
  that, for each <math|\<omega\>>, <math|d*H<rsup|\<ast\>><around|(|\<theta\>|)>>
  (the Fourier transform of <math|A<rsub|t><around|(|\<omega\>|)>>) "behaves
  as a <math|\<delta\>>-function with respect to
  <math|\<Gamma\><around|(|\<omega\>|)>>". To define this notion more
  precisely, we introduce the following definition.

  <\definition>
    <label|def:pseudo_delta>We will say that <math|u<around|(|x|)>> is a
    pseudo <math|\<delta\>>-function of order <math|\<epsilon\>> with respect
    to <math|v<around|(|x|)>> if, for any <math|k>, there exists
    <math|\<epsilon\>> (<math|\<less\>1>) independent of <math|k> such that

    <\equation>
      <label|eq:pseudo_delta_condition><around*|\||<big|int>u<around|(|x|)>*v*<around|(|x+k|)>*d*x-v<around|(|k|)>*<big|int>u<around|(|x|)>*d*x|\|>\<less\>\<epsilon\>
    </equation>
  </definition>

  Now suppose that

  <\enumerate>
    <item>the filter <math|<around|{|g<around|(|u|)>|}>> is square integrable
    and normalized so that

    <\equation>
      <label|eq:filter_normalization>2*\<pi\>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||g<around|(|u|)>*<around|\||<rsup|2>d*u=<big|int><rsub|-\<infty\>><rsup|\<infty\>>|\|>*\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>=1
    </equation>

    <item>

    <\equation>
      <label|eq:filter_bandwidth><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||u|\|><around|\||g<around|(|u|)>|\|>*d*u=B<rsub|g><space|1em><text|(say)>
    </equation>

    (Note that <math|B<rsub|g>> is a measure of the "width" of
    <math|<around|{|g<around|(|u|)>|}>>.)
  </enumerate>

  <\lemma>
    <label|lemma:pseudo_delta>Let <math|<around|{|\<Phi\><rsub|t>|}>> be a
    semi-stationary family with characteristic width
    <math|B<rsub|\<cal-F\>>>. Then, for each <math|t,\<omega\>>,
    <math|<around|{|e<rsup|i*t*\<theta\>>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>|}>>
    is a pseudo <math|\<delta\>>-function of order
    <math|<around|(|B<rsub|g>/B<rsub|\<cal-F\>>|)>> with respect to
    <math|\<Gamma\><around|(|\<theta\>|)>>.
  </lemma>

  <\proof>
    For any <math|k>, write

    <\equation>
      <label|eq:pseudo_delta_expansion><big|int>e<rsup|i*\<theta\>*k>*\<Gamma\>*<around|(|\<theta\>+k|)>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>=\<Gamma\><around|(|k|)>*<big|int>e<rsup|i*\<theta\>*k>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>+R<around|(|k|)>
    </equation>

    in which

    <\equation>
      <label|eq:remainder_term>R<around|(|k|)>=<big|int>e<rsup|i*\<theta\>*k>*<around|[|\<Gamma\>*<around|(|\<theta\>+k|)>-\<Gamma\><around|(|k|)>|]>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>
    </equation>

    But

    <\equation>
      <label|eq:remainder_bound><around|\||R<around|(|k|)>|\|>\<leq\>sup<rsub|\<theta\>><around|\||\<Gamma\><rprime|'><around|(|\<theta\>|)><around|\||<big|int>|\|>*\<theta\><around|\|||\|>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>=B<rsub|g>/B<rsub|\<cal-F\>>
    </equation>

    in virtue of <eqref|eq:filter_bandwidth>\Vthe result follows.
  </proof>

  We are now in a position to derive a more exact form of the relation
  <eqref|eq:filtered_evolutionary_spectrum>.

  <\theorem>
    <label|thm:filter_approximation>Let <math|<around|{|g<around|(|u|)>|}>>
    be a filter satisfying <eqref|eq:filter_normalization>,
    <eqref|eq:filter_bandwidth>, and <math|\<Gamma\><rsub|t,\<lambda\>><around|(|\<omega\>|)>>
    its generalized transfer function with respect to a semi-stationary
    family <math|\<cal-F\>> of characteristic width <math|B<rsub|\<cal-F\>>>.
    If, for any <math|\<epsilon\>(\<gtr\>0)>, we choose
    <math|<around|{|g<around|(|u|)>|}>> so that
    <math|B<rsub|g>\<less\>\<epsilon\>*B<rsub|\<cal-F\>>>, then

    <\equation>
      <label|eq:transfer_approximation><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|>*<around*|\||\<Gamma\><rsub|t,\<lambda\>><around|(|\<omega\>|)>-\<Gamma\><around|(|\<omega\>|)>|\|>\<less\>\<epsilon\>
    </equation>

    for all <math|t,\<lambda\>,\<omega\>>.
  </theorem>

  <\proof>
    We have, from <eqref|eq:generalized_transfer>,

    <\equation>
      <label|eq:transfer_expansion>A<rsub|t><around|(|\<lambda\>|)>*\<Gamma\><rsub|t,\<lambda\>><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*A<rsub|t-u><around|(|\<lambda\>|)>*e<rsup|-i*\<omega\>*u>*d*u
    </equation>

    Substituting for <math|A<rsub|t-u><around|(|\<lambda\>|)>> in terms of
    its Fourier transform <math|d*H<rsub|\<lambda\>><around|(|\<theta\>|)>>,
    we obtain

    <\equation>
      <label|eq:transfer_fourier>A<rsub|t><around|(|\<lambda\>|)>*\<Gamma\><rsub|t,\<lambda\>><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*e<rsup|-i*\<omega\>*u>*e<rsup|i*<around|(|t-u|)>*\<theta\>>*d*H<rsub|\<lambda\>><around|(|\<theta\>|)>*d*u
    </equation>

    on interchanging the order of integration. However, according to
    Lemma<nbsp><reference|lemma:pseudo_delta>,
    <math|<around|{|e<rsup|i*t*\<theta\>>*d*H<rsub|\<lambda\>><around|(|\<theta\>|)>|}>>
    is a pseudo <math|\<delta\>>-function of order
    <math|<around|(|B<rsub|g>/B<rsub|\<cal-F\>>|)>> with respect to
    <math|\<Gamma\><around|(|\<theta\>|)>>. Thus, if
    <math|<around|{|g<around|(|u|)>|}>> is chosen so that, for given
    <math|\<epsilon\>>, <math|B<rsub|g>\<less\>\<epsilon\>*B<rsub|\<cal-F\>>>,
    then

    <\equation>
      <label|eq:pseudo_delta_approximation><around*|\||<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<theta\>>*\<Gamma\>*<around|(|\<omega\>+\<theta\>|)>*d*H<rsub|\<lambda\>><around|(|\<theta\>|)>-\<Gamma\><around|(|\<omega\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<theta\>>*d*H<rsub|\<lambda\>><around|(|\<theta\>|)>|\|>\<less\>\<epsilon\>
    </equation>

    Noting that

    <\equation>
      <label|eq:amplitude_integral><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<theta\>>*d*H<rsub|\<lambda\>><around|(|\<theta\>|)>=A<rsub|t><around|(|\<lambda\>|)>
    </equation>

    the result follows.
  </proof>

  <section|Determination of Evolutionary Spectra><label|sec:determination>

  Let <math|<around|{|X<rsub|t>|}>> be a semi-stationary process with
  characteristic width <math|B<rsub|X>>, and
  <math|<around|{|g<around|(|u|)>|}>> a filter satisfying
  <eqref|eq:filter_normalization>, <eqref|eq:filter_bandwidth>, with width
  <math|B<rsub|g>>. For any frequency <math|\<omega\><rsub|0>>, define the
  process <math|<around|{|Y<rsub|t>|}>> as in <eqref|eq:generalized_filter>,
  i.e. write

  <\equation>
    <label|eq:filtered_process_def>Y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>*d*u
  </equation>

  Using the representation of <math|<around|{|X<rsub|t>|}>> in terms of the
  family <math|\<cal-F\><rsup|\<ast\>>> (given by
  <eqref|eq:optimal_representation>), it follows from
  <eqref|eq:filtered_representation> that we may write

  <\equation>
    <label|eq:optimal_filtered_representation>Y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Gamma\><rsub|t,\<omega\><rsub|0>><rsup|\<ast\>><around|(|\<omega\>|)>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  where <math|\<Gamma\><rsub|t,\<omega\><rsub|0>><rsup|\<ast\>><around|(|\<omega\>|)>>
  is the generalized transfer function of <math|<around|{|g<around|(|u|)>|}>>
  with respect to the family <math|\<cal-F\><rsup|\<ast\>>>. Due to the
  orthogonality of <math|Z<rsup|\<ast\>><around|(|\<omega\>|)>>, it follows
  that

  <\equation>
    <label|eq:filtered_variance>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><rsub|t,\<omega\><rsub|0>><rsup|\<ast\>><around|(|\<omega\>|)><around|\||<rsup|2>|\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  Now suppose that <math|<around|{|g<around|(|u|)>|}>> is chosen so that
  <math|B<rsub|g>\<less\>\<epsilon\>*B<rsub|X>>. Then according to
  Theorem<nbsp><reference|thm:filter_approximation> (remembering that the
  characteristic width of <math|\<cal-F\><rsup|\<ast\>>> is either equal to,
  or arbitrarily close to, <math|B<rsub|X>>), we may write

  <\equation>
    <label|eq:transfer_approximation_detailed>\<Gamma\><rsub|t,\<omega\><rsub|0>><rsup|\<ast\>><around|(|\<omega\>|)>=\<Gamma\><around|(|\<omega\>|)>+\<epsilon\>*<around|(|t,\<omega\><rsub|0>,\<omega\>|)>
  </equation>

  where

  <\equation>
    <label|eq:error_bound><around|\||\<epsilon\>*<around|(|t,\<omega\><rsub|0>,\<omega\>|)>|\|>\<less\>\<epsilon\>/<around|\||A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|>
  </equation>

  Thus we obtain from <eqref|eq:filtered_variance>

  <\equation>
    <label|eq:variance_expansion>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)><around|\||<rsup|2>|\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>+I<rsub|1>+I<rsub|2>+I<rsub|3>
  </equation>

  say, where

  <\align>
    <tformat|<table|<row|<cell|I<rsub|1>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Gamma\><rsup|\<ast\>><around|(|\<omega\>|)>*\<epsilon\>*<around|(|t,\<omega\><rsub|0>,\<omega\>|)>*<around|\||A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)><eq-number>>>|<row|<cell|I<rsub|2>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Gamma\><around|(|\<omega\>|)>*\<epsilon\><rsup|\<ast\>>*<around|(|t,\<omega\><rsub|0>,\<omega\>|)>*<around|\||A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)><eq-number>>>|<row|<cell|I<rsub|3>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<epsilon\>*<around|(|t,\<omega\><rsub|0>,\<omega\>|)><around|\||<rsup|2>|\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)><eq-number>>>>>
  </align>

  Now

  <\equation>
    <label|eq:I3_bound><around|\||I<rsub|3>|\|>\<less\>\<epsilon\><rsup|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>=O<around|(|\<epsilon\><rsup|2>|)>
  </equation>

  and

  <\equation>
    <label|eq:I2_bound><around|\||I<rsub|2>|\|>\<less\>\<epsilon\>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)><around|\|||\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  To show that <math|<around|\||I<rsub|2>|\|>=O<around|(|\<epsilon\>|)>>, it
  remains to prove that the integral on the right-hand side of the above
  inequality remains finite as <math|B<rsub|g>\<to\>0>. To demonstrate this
  fact, let the set <math|\<Omega\>> be defined by

  <\equation>
    <label|eq:omega_set>\<Omega\>=<around|{|\<omega\>:<around|\||\<Gamma\><around|(|\<omega\>|)><around|\|||\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|>\<geq\>1|}>
  </equation>

  Then

  <\equation>
    <label|eq:integral_split><with|font-base-size|9|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)><around|\|||\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>\<less\><big|int><rsub|\<Omega\>>d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>+<big|int><rsub|\<Omega\><rsup|c>><around|\||\<Gamma\><around|(|\<omega\>|)><around|\||<rsup|2>|\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>>
  </equation>

  The first term is finite, since <math|d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>>
  is the evolutionary spectrum at zero time with respect to
  <math|\<cal-F\><rsup|\<ast\>>>, and the second term is finite since
  <math|\<Gamma\><around|(|\<omega\>|)>> is normalized so that

  <\equation>
    <label|eq:transfer_normalization><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>=1
  </equation>

  The term <math|I<rsub|1>> may be treated similarly, so that in terms of

  <\equation>
    <label|eq:evolutionary_spectrum_optimal>d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>
  </equation>

  the evolutionary spectrum of <math|<around|{|X<rsub|t>|}>> with respect to
  the family <math|\<cal-F\><rsup|\<ast\>>>, we have

  <\theorem>
    <label|thm:evolutionary_determination>

    <\equation>
      <label|eq:evolutionary_determination>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>+O<around|(|\<epsilon\>|)>
    </equation>

    where <math|O<around|(|\<epsilon\>|)>> denotes a term which may be made
    arbitrarily small by choosing <math|B<rsub|g>> sufficiently small
    relative to <math|B<rsub|X>>.
  </theorem>

  Now consider the case where the measure
  <math|\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>> is absolutely continuous
  with respect to Lebesgue measure, so that for each <math|t> we may write

  <\equation>
    <label|eq:spectral_density>d*F<rsub|t><around|(|\<omega\>|)>=f<rsub|t><around|(|\<omega\>|)>*d*\<omega\>,<space|1em><text|all
    >\<omega\>
  </equation>

  where <math|f<rsub|t><around|(|\<omega\>|)>>, the evolutionary spectral
  density function, exists for all <math|\<omega\>>. Then rewriting
  Theorem<nbsp><reference|thm:evolutionary_determination> in terms of
  <math|f<rsub|t><around|(|\<omega\>|)>>, we have, to
  <math|O<around|(|\<epsilon\>|)>>,

  <\equation>
    <label|eq:density_determination>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*f<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*\<omega\>
  </equation>

  So far we have worked with the representation of
  <math|<around|{|X<rsub|t>|}>> in terms of the family
  <math|\<cal-F\><rsup|\<ast\>>>. However, as the validity of
  <eqref|eq:density_determination> depends only on the condition
  <math|B<rsub|g>\<less\>B<rsub|\<cal-F\>>>, it is clear that, for fixed
  <math|B<rsub|g>>, <eqref|eq:density_determination> will still be
  approximately true if instead we work with a representation of
  <math|<around|{|X<rsub|t>|}>> in terms of any other semi-stationary family
  <math|\<cal-F\>> whose characteristic width
  <math|B<rsub|\<cal-F\>>\<gg\>B<rsub|g>>. Thus, if
  <math|d*F<rsub|t><around|(|\<omega\>|)>=f<rsub|t><around|(|\<omega\>|)>*d*\<omega\>>
  is the evolutionary spectrum of <math|<around|{|X<rsub|t>|}>> with respect
  to such a family, then <eqref|eq:density_determination> will still hold
  approximately if we substitute <math|f<rsub|t><around|(|\<omega\>|)>> for
  <math|f<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>>.

  However, it must be remembered that <eqref|eq:density_determination> is
  only an approximation. In fact, the exact value of
  <math|E<around|\||Y<rsub|t>|\|><rsup|2>> is given by

  <\equation>
    <label|eq:exact_variance>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><rsub|t,\<omega\><rsub|0>><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  if we work in terms of a general family <math|\<cal-F\>>. Thus, the exact
  value of <math|E<around|\||Y<rsub|t>|\|><rsup|2>> is an average of
  <math|d*F<rsub|t><around|(|\<omega\>|)>> over both frequency and time, and
  we note that, since <math|E<around|\||Y<rsub|t>|\|><rsup|2>> is independent
  of the choice of <math|\<cal-F\>>, the value of this average of
  <math|d*F<rsub|t><around|(|\<omega\>|)>> (over time and frequency) must
  also be independent of <math|\<cal-F\>>. Thus the right-hand side of
  <eqref|eq:exact_variance> has an unambiguous interpretation as an "average"
  of the total energy of the process contained within a band of frequencies
  in the region of <math|\<omega\><rsub|0>> and an interval of time in the
  neighbourhood of <math|t>.

  Now in writing <eqref|eq:density_determination>, we have assumed that the
  effect of the "time-averaging" is negligible, since the condition
  <math|B<rsub|g>\<less\>B<rsub|\<cal-F\>>> implies that
  <math|d*F<rsub|t><around|(|\<omega\>|)>> is changing very slowly over the
  effective range of the filter <math|<around|{|g<around|(|u|)>|}>>. However,
  the degree of accuracy of <eqref|eq:density_determination> depends on the
  ratio <math|<around|(|B<rsub|g>/B<rsub|\<cal-F\>>|)>>. For example, if
  <math|B<rsub|g>=0>, i.e. <math|g<around|(|u|)>=\<delta\><around|(|u|)>>,
  then <eqref|eq:density_determination> is exact for all <math|\<cal-F\>>,
  and reduces to <eqref|eq:total_energy_invariance>, namely

  <\equation>
    <label|eq:exact_energy>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>d*F<rsub|t><around|(|\<omega\>|)>
  </equation>

  However, if

  <\equation>
    <label|eq:wide_filter>g<around|(|u|)>=lim<rsub|T\<to\>\<infty\>><around|{|g<rsub|T><around|(|u|)>|}>
  </equation>

  where

  <\equation>
    <label|eq:boxcar_filter>g<rsub|T><around|(|u|)>=<choice|<tformat|<table|<row|<cell|1/<sqrt|2*T>>|<cell|<around|(|<around|\||u|\|>\<less\>T|)>>>|<row|<cell|0>|<cell|<around|(|<around|\||u|\|>\<geq\>T|)>>>>>>
  </equation>

  so that <math|B<rsub|g>=\<infty\>>, then it may be shown that in this case

  <\equation>
    <label|eq:infinite_bandwidth>E<around|\||Y<rsub|t>|\|><rsup|2>=lim<rsub|T\<to\>\<infty\>>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||G<rsub|T,t,\<omega\><rsub|0>><around|(|\<omega\>|)>|\|><rsup|2>*d*F*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  where

  <\equation>
    <label|eq:finite_fourier>G<rsub|T,t,\<omega\><rsub|0>><around|(|\<omega\>|)>=<frac|1|<sqrt|2*T>>*<big|int><rsub|-T><rsup|T>e<rsup|i*\<omega\>*u>*A<rsub|t-u><around|(|\<omega\><rsub|0>|)>*d*u
  </equation>

  Note that <math|E<around|\||Y<rsub|t>|\|><rsup|2>> is independent of
  <math|t>, and reduces to the classical definition of the spectrum of
  <math|<around|{|X<rsub|t>|}>> (if it were stationary), but that
  <eqref|eq:density_determination> is now invalid for all families.

  A comparison of equations <eqref|eq:exact_energy> and
  <eqref|eq:infinite_bandwidth> is interesting. The right-hand side of
  <eqref|eq:exact_energy> is a function only of the evolutionary spectrum at
  time <math|t>, and does not involve its values at other instants of time,
  but it provides no information on the distribution of
  <math|d*F<rsub|t><around|(|\<omega\>|)>> over frequency, since it is
  completely independent of <math|\<omega\><rsub|0>>. However, assuming that,
  for each <math|T>, <math|<around|\||G<rsub|T,t,\<omega\><rsub|0>><around|(|\<omega\>|)>|\|><rsup|2>>
  is highly concentrated in the region <math|\<omega\>=0> (as will generally
  be the case since we have assumed that, for all <math|\<omega\>>,
  <math|A<rsub|t><around|(|\<omega\>|)>> is a slowly varying function of
  <math|t>), the right-hand side of <eqref|eq:infinite_bandwidth> will be
  approximately equal to

  <\equation>
    <label|eq:average_spectrum>d*F<rsub|\<omega\><rsub|0>><around*|{|lim<rsub|T\<to\>\<infty\>>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||G<rsub|T,t,\<omega\><rsub|0>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>|}>
  </equation>

  and this quantity, being completely independent of <math|t>, may be
  interpreted as a form of "average" over <math|t> of the values of
  <math|d*F<rsub|t><around|(|\<omega\><rsub|0>|)>> for
  <math|-\<infty\>\<less\>t\<less\>\<infty\>>.

  Thus we see that the more accurately we try to determine
  <math|d*F<rsub|t><around|(|\<omega\>|)>> as a function of time, the less
  accurately we determine it as a function of frequency, and vice versa. This
  feature suggests a form of UNCERTAINTY PRINCIPLE, namely, "In determining
  evolutionary spectra, one cannot obtain simultaneously a high degree of
  resolution in both the time domain and frequency domain".

  Suppose now that we fix the degree of resolution in the frequency domain,
  i.e. we set a lower bound to <math|B<rsub|g>>. Then for a particular family
  <math|\<cal-F\>>, the resolution in the time domain will be determined by
  the value of <math|B<rsub|g>/B<rsub|\<cal-F\>>>. Clearly then, we obtain
  the maximum possible resolution in time by working in terms of the family
  with the maximum characteristic width.

  Thus, if <math|\<cal-C\><rsup|\<ast\>>> contains only one member, i.e. if
  <math|\<cal-F\><rsup|\<ast\>>> is uniquely determined, then
  <math|\<cal-F\><rsup|\<ast\>>> provides the natural representation for
  <math|<around|{|X<rsub|t>|}>>, and is the family in terms of which we can
  most precisely express the time-varying spectral pattern of the process. In
  particular, we now see why the natural representation of stationary
  processes is given in terms of the complex exponential family\Vthe reason
  being simply that in this case <math|\<cal-C\><rsup|\<ast\>>> is unique and
  is just this family.

  If <math|\<cal-C\><rsup|\<ast\>>> contains several families,
  <math|\<cal-F\><rsub|1><rsup|\<ast\>>,\<cal-F\><rsub|2><rsup|\<ast\>>,\<ldots\>>
  then we may say that each <math|\<cal-F\><rsub|i><rsup|\<ast\>>>
  (<math|i=1,2,\<ldots\>>) provides a natural representation for the process.
  For, let <math|d*F<rsub|t><rsup|<around|(|i|)>\<ast\>><around|(|\<omega\>|)>>
  denote the evolutionary spectrum with respect to
  <math|\<cal-F\><rsub|i><rsup|\<ast\>>>, and let
  <math|<wide|f|~><rsub|t><rsup|<around|(|i|)>\<ast\>><around|(|\<omega\><rsub|0>|)>>
  denote the "smoothed" evolutionary spectrum, given by

  <\equation>
    <label|eq:smoothed_spectrum><wide|f|~><rsub|t><rsup|<around|(|i|)>\<ast\>><around|(|\<omega\><rsub|0>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsub|t><rsup|<around|(|i|)>\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  Then we have, for each <math|i>,

  <\equation>
    <label|eq:smoothed_equivalence>E<around|(|<around|\||Y<rsub|t>|\|><rsup|2>|)>=<wide|f|~><rsub|t><rsup|<around|(|i|)>\<ast\>><around|(|\<omega\><rsub|0>|)>+O<around|(|B<rsub|g>/B<rsub|X>|)>
  </equation>

  If now we fix the filter width <math|B<rsub|g>>, then to
  <math|O<around|(|B<rsub|g>/B<rsub|X>|)>> the "smoothed" evolutionary
  spectra with respect to each <math|\<cal-F\><rsub|i><rsup|\<ast\>>> are
  identical. Consequently, as "smoothed" spectra are the most we can
  determine, we may regard the representations with respect to each
  <math|\<cal-F\><rsub|i><rsup|\<ast\>>> as equivalent\Vat least as far as
  their corresponding spectra are concerned.

  Finally, consider the case when <math|\<cal-C\><rsup|\<ast\>>> is empty,
  i.e. there is no family <math|\<cal-F\>\<in\>\<cal-C\>> with characteristic
  width <math|B<rsub|X>>. Then there is no natural representation for the
  process since now, given any family <math|\<cal-F\>\<in\>\<cal-C\>>, there
  always exists another member of <math|\<cal-C\>> with larger characteristic
  width. However, for this case we may redefine the sub-class
  <math|\<cal-C\><rsup|\<ast\>>> so that it includes all families whose
  characteristic widths lie between <math|B<rsub|X>-\<eta\>> and
  <math|B<rsub|X>>, where <math|\<eta\>> is arbitrarily small. Then by the
  argument used above it follows that all families
  <math|\<in\>\<cal-C\><rsup|\<ast\>>> give rise to almost identical
  evolutionary spectra.

  From now on, we will consider only the representation of
  <math|<around|{|X<rsub|t>|}>> in terms of a particular family
  <math|\<cal-F\><rsup|\<ast\>>\<in\>\<cal-C\><rsup|\<ast\>>>, and when we
  refer to the evolutionary spectrum of <math|<around|{|X<rsub|t>|}>>
  (without reference to any particular family) we will mean
  <math|<around|\||A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>>,
  the evolutionary spectrum with respect to the family
  <math|\<cal-F\><rsup|\<ast\>>>.

  <section|Estimation of Evolutionary Spectra><label|sec:estimation>

  Suppose we are given a sample record of <math|<around|{|X<rsub|t>|}>>, say
  for <math|0\<less\>t\<less\>T>. We now consider the problem of estimating
  the evolutionary spectrum <math|d*F<rsub|t><around|(|\<omega\>|)>>, for
  <math|0\<leq\>t\<less\>T>, from the sample. (We omit the asterisks in
  <math|A<rsub|t><around|(|\<omega\>|)>>,
  <math|d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>>, and
  <math|d*F<rsub|t><around|(|\<omega\>|)>>, it being understood that all
  functions are now defined with respect to the family
  <math|\<cal-F\><rsup|\<ast\>>>.) We will treat here only the case where the
  measure <math|\<mu\><around|(|\<omega\>|)>> is absolutely continuous with
  respect to Lebesgue measure, so that for each <math|t> we may write

  <\equation>
    <label|eq:spectral_density_estimation>d*F<rsub|t><around|(|\<omega\>|)>=f<rsub|t><around|(|\<omega\>|)>*d*\<omega\>,<space|1em><text|all
    >\<omega\>
  </equation>

  where <math|f<rsub|t><around|(|\<omega\>|)>>, the evolutionary spectral
  density function, exists for all <math|\<omega\>>.

  Let <math|<around|{|g<around|(|u|)>|}>> be a filter of width
  <math|B<rsub|g>> satisfying the conditions of
  Section<nbsp><reference|sec:determination>, and write, for any frequency
  <math|\<omega\><rsub|0>>,

  <\equation>
    <label|eq:filtered_estimate>U<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>*d*u
  </equation>

  We assume that <math|B<rsub|g>\<less\>B<rsub|X>\<ll\>T>, so that for
  <math|t\<gtr\>0>, the limits in the above integral may be replaced
  effectively by <math|<around|(|-\<infty\>,\<infty\>|)>>, when
  <math|U<rsub|t>> becomes identical with the process
  <math|<around|{|Y<rsub|t>|}>> defined in <eqref|eq:filtered_process_def>.
  In fact, the difference between <math|U<rsub|t>> and <math|Y<rsub|t>> is
  due to "transients" (or "end-effects") in the filter output, and we assume
  that these are negligible for <math|t> sufficiently greater than zero. It
  then follows from Theorem<nbsp><reference|thm:evolutionary_determination>
  that

  <\equation>
    <label|eq:expected_filtered_power>E<around|\||U<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*f<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*\<omega\>+O<around|(|B<rsub|g>/B<rsub|X>|)>
  </equation>

  At this point it is interesting to note an important difference between the
  estimation of evolutionary spectra and the estimation of spectra for
  stationary processes. In the latter case we may still employ the technique
  described above, but the bandwidth of <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>
  is chosen as a function of <math|T> which tends to zero as
  <math|T\<to\>\<infty\>>. However, in dealing with evolutionary spectra, the
  bandwidth of <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>
  (which varies inversely with <math|B<rsub|g>>) is limited by the
  restriction <math|B<rsub|g>\<less\>B<rsub|X>>. In other words, since we
  have chosen the filter so that it operates only locally on
  <math|<around|{|X<rsub|t>|}>>, thereby assuring a high degree of resolution
  in the time domain, we must sacrifice some degree of resolution in the
  frequency domain. Thus, in order to estimate
  <math|f<rsub|t><around|(|\<omega\>|)>> we must assume that, for each
  <math|t>, it is smooth compared with <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>,
  i.e. that its bandwidth is substantially larger than the bandwidth of
  <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>> (cf.
  Priestley, 1962). In this case <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>
  is a pseudo <math|\<delta\>>-function with respect to
  <math|f<rsub|t><around|(|\<omega\>|)>> (the order being the ratio of the
  bandwidths), and we may write

  <\equation>
    <label|eq:approximate_unbiasedness>E<around|\||U<rsub|t>|\|><rsup|2>\<approx\>f<rsub|t><around|(|\<omega\><rsub|0>|)>
  </equation>

  (remembering that

  <\equation>
    <label|eq:transfer_normalization_estimation><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>=1.)
  </equation>

  Thus, <math|<around|\||U<rsub|t>|\|><rsup|2>> is an (approximately)
  unbiased estimate of <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>>. Now a
  straightforward calculation shows that, for <math|<around|{|X<rsub|t>|}>> a
  normal process,

  <\equation>
    <label|eq:variance_estimate><text|var><around|(|<around|\||U<rsub|t>|\|><rsup|2>|)>=<around*|{|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*f<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*\<omega\>|}><rsup|2>*<around|(|1+\<delta\><rsub|0,\<omega\><rsub|0>>|)>
  </equation>

  which, being independent of <math|T>, means that
  <math|<around|\||U<rsub|t>|\|><rsup|2>> will not be a very useful estimate
  of <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>> in practice. (This is
  completely analogous to the behaviour of the periodogram in classical
  spectral analysis.) However, to reduce sampling fluctuations we may
  "smooth" the values of <math|<around|\||U<rsub|t>|\|><rsup|2>> for
  neighbouring values of <math|t>. In so doing, we increase the precision of
  our estimates by sacrificing some degree of resolvability in the time
  domain.

  We, therefore, consider a weight-function
  <math|W<rsub|T<rprime|'>><around|(|t|)>>, depending on the parameter
  <math|T<rprime|'>>, which satisfies

  <\enumerate>
    <item><math|W<rsub|T<rprime|'>><around|(|t|)>\<geq\>0>, all
    <math|t,T<rprime|'>>,

    <item><math|W<rsub|T<rprime|'>><around|(|t|)>> decays to zero as
    <math|<around|\||t|\|>\<to\>\<infty\>>, all <math|T<rprime|'>>,

    <item><math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|t|)>*d*t=1>,
    all <math|T<rprime|'>>,

    <item><math|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|{|W<rsub|T<rprime|'>><around|(|t|)>|}><rsup|2>*d*t\<less\>\<infty\>>,
    all <math|T<rprime|'>>.
  </enumerate>

  Write

  <\equation>
    <label|eq:weight_transform>W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*W<rsub|T<rprime|'>><around|(|t|)>*d*t
  </equation>

  We assume that there exists a constant <math|C> such that

  <\equation>
    <label|eq:weight_normalization>lim<rsub|T<rprime|'>\<to\>\<infty\>>
    T<rprime|'>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<lambda\>|)>|\|><rsup|2>*d*\<lambda\>=C
  </equation>

  Now let

  <\equation>
    <label|eq:smoothed_estimate>V<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|u|)><around|\||U<rsub|t-u>|\|><rsup|2>*d*u
  </equation>

  Again, we assume that <math|W<rsub|T<rprime|'>><around|(|u|)>> decays
  sufficiently fast so that the above integral may be evaluated from a finite
  length of <math|<around|\||U<rsub|t>|\|><rsup|2>>. It follows from
  <eqref|eq:expected_filtered_power> that

  <\equation>
    <label|eq:expected_smoothed>E<around|(|V<rsub|t>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|u|)>*f<rsub|t-u>*<around|(|\<omega\>+\<omega\><rsub|0>|)><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*u*d*\<omega\>+O<around|(|B<rsub|g>/B<rsub|X>|)>
  </equation>

  <\equation>
    <label|eq:smoothed_expectation>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|~><rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>+O<around|(|B<rsub|g>/B<rsub|X>|)>
  </equation>

  where

  <\equation>
    <label|eq:smoothed_density><wide|f|~><rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|u|)>*f<rsub|t-u>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*u
  </equation>

  From <eqref|eq:smoothed_expectation> we see that
  <math|E<around|(|V<rsub|t>|)>> is a "smoothed" form of
  <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>>, smoothed over both time and
  frequency. If we now assume that <math|f<rsub|t><around|(|\<omega\>|)>> is
  smooth compared with <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>
  and <math|W<rsub|T<rprime|'>><around|(|t|)>>, then

  <\equation>
    <label|eq:final_approximation>E<around|(|V<rsub|t>|)>\<approx\>f<rsub|t><around|(|\<omega\><rsub|0>|)>
  </equation>

  and <math|V<rsub|t>> provides a useful estimate of
  <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>>.

  <\thebibliography|99>
    <bibitem|bartlett1955>Bartlett, M. S. (1955). <with|font-shape|italic|An
    Introduction to Stochastic Processes>. Cambridge University Press.

    <bibitem|cramer1960>Cramér, H. (1960). On the theory of stationary random
    processes. <with|font-shape|italic|Arkiv för Matematik>, 4, 375-378.

    <bibitem|grenander1957>Grenander, U. and Rosenblatt, M. (1957).
    <with|font-shape|italic|Statistical Analysis of Stationary Time Series>.
    Wiley, New York.

    <bibitem|herbst1963a>Herbst, L. (1963a). A test for quasi-stationarity.
    <with|font-shape|italic|Annals of Mathematical Statistics>, 34, 206-211.

    <bibitem|herbst1963b>Herbst, L. (1963b). On the asymptotic behaviour of
    processes with time-varying spectra. <with|font-shape|italic|Annals of
    Mathematical Statistics>, 34, 212-216.

    <bibitem|herbst1963c>Herbst, L. (1963c). The statistical analysis of
    non-stationary time series. <with|font-shape|italic|Skandinavisk
    Aktuarietidskrift>, 46, 1-24.

    <bibitem|jowett1957>Jowett, G. H. (1957). Statistical analysis using
    local properties of smoothly heteromorphic stochastic series.
    <with|font-shape|italic|Biometrika>, 44, 454-463.

    <bibitem|page1952>Page, C. H. (1952). Instantaneous power spectra.
    <with|font-shape|italic|Journal of Applied Physics>, 23, 103-106.

    <bibitem|parzen_unpublished>Parzen, E. (unpublished). On the
    representation of stochastic processes. Technical Report, Stanford
    University.

    <bibitem|priestley1962>Priestley, M. B. (1962). The analysis of
    stationary processes with mixed spectra.
    <with|font-shape|italic|Technometrics>, 4, 551-565.
  </thebibliography>
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
    <associate|auto-10|<tuple|98|19>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|4|6>>
    <associate|auto-5|<tuple|5|7>>
    <associate|auto-6|<tuple|6|8>>
    <associate|auto-7|<tuple|7|10>>
    <associate|auto-8|<tuple|8|13>>
    <associate|auto-9|<tuple|9|17>>
    <associate|bib-bartlett1955|<tuple|bartlett1955|19>>
    <associate|bib-cramer1960|<tuple|cramer1960|19>>
    <associate|bib-grenander1957|<tuple|grenander1957|20>>
    <associate|bib-herbst1963a|<tuple|herbst1963a|20>>
    <associate|bib-herbst1963b|<tuple|herbst1963b|20>>
    <associate|bib-herbst1963c|<tuple|herbst1963c|20>>
    <associate|bib-jowett1957|<tuple|jowett1957|20>>
    <associate|bib-page1952|<tuple|page1952|20>>
    <associate|bib-parzen_unpublished|<tuple|parzen_unpublished|20>>
    <associate|bib-priestley1962|<tuple|priestley1962|20>>
    <associate|def:evolutionary_spectrum|<tuple|3|6>>
    <associate|def:oscillatory_function|<tuple|1|5>>
    <associate|def:oscillatory_process|<tuple|2|5>>
    <associate|def:pseudo_delta|<tuple|6|11>>
    <associate|def:semi_stationary_family|<tuple|4|10>>
    <associate|def:semi_stationary_process|<tuple|5|10>>
    <associate|eq:I2_bound|<tuple|69|14>>
    <associate|eq:I3_bound|<tuple|68|14>>
    <associate|eq:amplitude_form|<tuple|16|5>>
    <associate|eq:amplitude_integral|<tuple|58|13>>
    <associate|eq:approximate_filtered_process|<tuple|41|9>>
    <associate|eq:approximate_transfer|<tuple|40|9>>
    <associate|eq:approximate_unbiasedness|<tuple|89|18>>
    <associate|eq:autocovariance_def|<tuple|10|3>>
    <associate|eq:average_spectrum|<tuple|83|16>>
    <associate|eq:bandwidth_def|<tuple|44|10>>
    <associate|eq:boxcar_filter|<tuple|80|15>>
    <associate|eq:characteristic_width|<tuple|45|10>>
    <associate|eq:covariance_def|<tuple|1|1>>
    <associate|eq:covariance_representation|<tuple|11|3>>
    <associate|eq:cramer_spectrum|<tuple|5|2>>
    <associate|eq:density_determination|<tuple|76|15>>
    <associate|eq:error_bound|<tuple|63|13>>
    <associate|eq:evolutionary_determination|<tuple|74|14>>
    <associate|eq:evolutionary_spectrum_def|<tuple|21|6>>
    <associate|eq:evolutionary_spectrum_optimal|<tuple|73|14>>
    <associate|eq:exact_energy|<tuple|78|15>>
    <associate|eq:exact_variance|<tuple|77|15>>
    <associate|eq:expected_filtered_power|<tuple|88|18>>
    <associate|eq:expected_smoothed|<tuple|95|19>>
    <associate|eq:filter_bandwidth|<tuple|50|12>>
    <associate|eq:filter_def|<tuple|33|8>>
    <associate|eq:filter_normalization|<tuple|49|11>>
    <associate|eq:filter_representation|<tuple|25|7>>
    <associate|eq:filter_spectrum|<tuple|34|8>>
    <associate|eq:filtered_estimate|<tuple|87|17>>
    <associate|eq:filtered_evolutionary_spectrum|<tuple|43|10>>
    <associate|eq:filtered_process|<tuple|26|7>>
    <associate|eq:filtered_process_def|<tuple|59|13>>
    <associate|eq:filtered_representation|<tuple|37|9>>
    <associate|eq:filtered_variance|<tuple|61|13>>
    <associate|eq:final_approximation|<tuple|98|19>>
    <associate|eq:finite_fourier|<tuple|82|16>>
    <associate|eq:generalized_filter|<tuple|36|9>>
    <associate|eq:generalized_transfer|<tuple|38|9>>
    <associate|eq:infinite_bandwidth|<tuple|81|16>>
    <associate|eq:instantaneous_power|<tuple|8|3>>
    <associate|eq:integral_split|<tuple|71|14>>
    <associate|eq:modified_family|<tuple|39|9>>
    <associate|eq:modulated_representation|<tuple|30|8>>
    <associate|eq:normalized_integral|<tuple|24|7>>
    <associate|eq:omega_set|<tuple|70|14>>
    <associate|eq:optimal_filtered_representation|<tuple|60|13>>
    <associate|eq:optimal_representation|<tuple|47|11>>
    <associate|eq:orthogonal_measure|<tuple|13|4>>
    <associate|eq:orthogonal_measure_shifted|<tuple|42|9>>
    <associate|eq:oscillatory_form|<tuple|15|5>>
    <associate|eq:page_spectrum|<tuple|6|3>>
    <associate|eq:periodogram_def|<tuple|7|3>>
    <associate|eq:piecewise_stationary|<tuple|4|2>>
    <associate|eq:process_characteristic_width|<tuple|46|11>>
    <associate|eq:process_representation|<tuple|12|4>>
    <associate|eq:process_spectral_representation|<tuple|3|1>>
    <associate|eq:pseudo_delta_approximation|<tuple|57|13>>
    <associate|eq:pseudo_delta_condition|<tuple|48|11>>
    <associate|eq:pseudo_delta_expansion|<tuple|51|12>>
    <associate|eq:pt_definition|<tuple|9|3>>
    <associate|eq:remainder_bound|<tuple|53|12>>
    <associate|eq:remainder_term|<tuple|52|12>>
    <associate|eq:smoothed_density|<tuple|97|19>>
    <associate|eq:smoothed_equivalence|<tuple|85|17>>
    <associate|eq:smoothed_estimate|<tuple|94|19>>
    <associate|eq:smoothed_expectation|<tuple|96|19>>
    <associate|eq:smoothed_spectrum|<tuple|84|17>>
    <associate|eq:spectral_density|<tuple|75|15>>
    <associate|eq:spectral_density_estimation|<tuple|86|17>>
    <associate|eq:spectral_representation|<tuple|2|1>>
    <associate|eq:standard_oscillatory_form|<tuple|19|5>>
    <associate|eq:standardization|<tuple|23|7>>
    <associate|eq:stationary_component|<tuple|27|7>>
    <associate|eq:stationary_family|<tuple|14|4>>
    <associate|eq:stationary_representation|<tuple|29|8>>
    <associate|eq:total_energy_invariance|<tuple|22|6>>
    <associate|eq:transfer_approximation|<tuple|54|12>>
    <associate|eq:transfer_approximation_detailed|<tuple|62|13>>
    <associate|eq:transfer_expansion|<tuple|55|12>>
    <associate|eq:transfer_fourier|<tuple|56|12>>
    <associate|eq:transfer_function|<tuple|35|8>>
    <associate|eq:transfer_normalization|<tuple|72|14>>
    <associate|eq:transfer_normalization_estimation|<tuple|90|18>>
    <associate|eq:transformed_covariance|<tuple|17|5>>
    <associate|eq:transformed_process|<tuple|18|5>>
    <associate|eq:uniform_modulation_ratio|<tuple|32|8>>
    <associate|eq:uniformly_modulated_def|<tuple|28|7>>
    <associate|eq:uniformly_modulated_spectrum|<tuple|31|8>>
    <associate|eq:variance_decomposition|<tuple|20|6>>
    <associate|eq:variance_estimate|<tuple|91|18>>
    <associate|eq:variance_expansion|<tuple|64|13>>
    <associate|eq:weight_normalization|<tuple|93|19>>
    <associate|eq:weight_transform|<tuple|92|19>>
    <associate|eq:wide_filter|<tuple|79|15>>
    <associate|lemma:pseudo_delta|<tuple|7|12>>
    <associate|sec:determination|<tuple|8|13>>
    <associate|sec:estimation|<tuple|9|17>>
    <associate|sec:evolutionary_spectra|<tuple|4|6>>
    <associate|sec:filters|<tuple|6|8>>
    <associate|sec:introduction|<tuple|1|1>>
    <associate|sec:non_stationary|<tuple|2|2>>
    <associate|sec:oscillatory_processes|<tuple|3|3>>
    <associate|sec:semi_stationary|<tuple|7|10>>
    <associate|sec:uniformly_modulated|<tuple|5|7>>
    <associate|thm:evolutionary_determination|<tuple|9|14>>
    <associate|thm:filter_approximation|<tuple|8|12>>
  </collection>
</references>

<\auxiliary>
  <\collection>
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>