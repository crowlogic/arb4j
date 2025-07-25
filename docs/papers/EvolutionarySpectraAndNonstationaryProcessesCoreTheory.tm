<TeXmacs|2.1.4>

<style|<tuple|generic|metal|framed-theorems>>

<\body>
  <doc-data|<doc-title|Evolutionary Spectra and Non-Stationary
  Processes>|<doc-author|<author-data|<author-name|M.B.
  Priestley>|<\author-affiliation>
    February 3rd, 1965
  </author-affiliation>>>>

  <abstract-data|<abstract|We develop an approach to the spectral analysis of
  non-stationary processes which is based on the concept of \Pevolutionary
  spectra\Q; that is, spectral functions which are time dependent, and have a
  physical interpretation as local energy distributions over frequency. It is
  shown that the notion of evolutionary spectra generalizes the usual
  definition of spectra for stationary processes, and that, under certain
  conditions, the evolutionary spectrum at each instant of time may be
  estimated from a single realization of a process. By such means it is
  possible to study processes with continuously changing \Pspectral
  patterns\Q.>>

  \;

  \;

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1.
    Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2.
    Non-stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3. Spectral
    Theory for a Class of Non-stationary Processes: Oscillatory Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4. Evolutionary
    (Power) Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section*|1. Introduction>

  In the classical approach to statistical spectral analysis it is always
  assumed that the process under study, <math|X<rsub|t>>, is stationary, at
  least up to the second order. That is, we assume that
  <math|E<around*|(|X<rsub|t>|)>=\<mu\>>, a constant (independent of
  <math|t>) which we may take to be zero, and that, for each <math|s> and
  <math|t>, the covariance

  <\equation>
    <label|eq:covariance>R<rsub|s,t>=E*<around*|{|<around*|(|X<rsub|s>-\<mu\>|)>*<around*|(|X<rsub|t>-\<mu\>|)><rsup|\<ast\>>|}>
  </equation>

  (* denoting the complex conjugate) is a function of
  <math|<around|\||s-t|\|>> only. In this case it is well known that
  <math|R<rsub|s,t>> has a spectral representation of the form

  <\equation>
    <label|eq:spectral_rep>R<rsub|s,t>=<big|int>e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*F<around|(|\<omega\>|)>
  </equation>

  where <math|F<around|(|\<omega\>|)>> is some function having the properties
  of a distribution function, and the range of integration is
  <math|<around|(|-\<infty\>,\<infty\>|)>> for a continuous parameter
  process, and <math|<around|(|-\<pi\>,\<pi\>|)>> in the discrete case.

  Corresponding to <eqref|eq:spectral_rep>, <math|<around|{|X<rsub|t>|}>> has
  a spectral representation of the form

  <\equation>
    <label|eq:process_rep>X<rsub|t>=<big|int>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is an orthogonal process with
  <math|E<around|{|<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>|}>=d*F<around|(|\<omega\>|)>>.
  When <math|<around|{|X<rsub|t>|}>> represents some physical process, the
  spectral density function <math|f<around|(|\<omega\>|)>=F<rprime|'><around|(|\<omega\>|)>>
  (when it exists) describes the distribution (over the frequency range) of
  the energy (per unit time) dissipated by the process, and given a sample
  record of <math|<around|{|X<rsub|t>|}>>, there are several methods of
  estimating <math|f<around|(|\<omega\>|)>> (see, e.g.,
  <cite|grenander1957>).

  In practice, however, it often happens that the assumption of stationarity
  is a very doubtful one. For example, records of atmospheric turbulence
  exhibit marked changes over periods of time, and in such cases classical
  spectral analysis based on a stationary model can hardly be carried through
  with conviction. The question arises, therefore, as to whether it might be
  possible to formulate a spectral theory for non-stationary processes within
  the framework of classical concepts such as \Penergy\Q and \Pfrequency\Q,
  so that a spectral function (however defined) would still possess a
  meaningful and useful physical interpretation. Intuitively it seems obvious
  that if no restrictions (other than finite first and second moments) are
  placed on the class of non-stationary processes considered, no useful
  inferences may be drawn from a single sample record. On the other hand, if
  one considers a non-stationary process of the form

  <\equation>
    <label|eq:piecewise_stat>X<rsub|t>=<choice|<tformat|<table|<row|<cell|X<rsub|t><rsup|<around|(|1|)>>>|<cell|<around*|(|t\<leqslant\>t<rsub|0>|)>>>|<row|<cell|X<rsub|t><rsup|<around|(|2|)>>>|<cell|<around*|(|t\<gtr\>t<rsub|0>|)>>>>>>
  </equation>

  where both <math|<around|{|X<rsub|t><rsup|<around|(|1|)>>|}>> and
  <math|<around|{|X<rsub|t><rsup|<around|(|2|)>>|}>> are stationary but with
  different autocovariance functions, then it is clear that given a sample
  record, say from <math|t=t<rsub|0>-T> to <math|t=t<rsub|0>+T>, it is
  certainly possible to infer \Psomething\Q about the spectral content of
  <math|X<rsub|t>>. If, in the above example, <math|t<rsub|0>> were known,
  one would presumably estimate two spectral density functions, one for
  <math|<around|{|X<rsub|t><rsup|<around|(|1|)>>|}>> and one for
  <math|<around|{|X<rsub|t><rsup|<around|(|2|)>>|}>>. If now we try to
  generalize this approach, we are led to the notion of a continuously
  changing spectrum, or more precisely, a time-dependent spectrum. Clearly,
  in such a case, we could never hope to estimate the spectrum at a
  particular instant of time, but if we assume that the spectrum is changing
  slowly over time, then by using estimates which involve only local
  functions of <math|<around|{|X<rsub|t>|}>>, we may attempt to estimate some
  form of \Paverage\Q spectrum of <math|X<rsub|t>> in the neighbourhood of
  any particular time-instant. We therefore consider a class of processes
  whose non-stationary characteristics are changing slowly over time, and in
  this respect our approach is conceived in the same spirit as Jowett's study
  of \Psmoothly heteromorphic\Q processes <cite|jowett1957>.

  <section*|2. Non-stationary Processes>

  There have been several attempts to define a spectrum for a non-stationary
  process, but in each case the object was to obtain a single function whose
  properties depended on the behaviour of the process over the whole
  parameter space. Cramér <cite|cramer1960> considered the class of processes
  which are harmonizable (in the Loève sense), that is, have a representation
  of the form <eqref|eq:process_rep> but without the restriction that
  <math|Z<around|(|\<omega\>|)>> must be orthogonal, and he defined the
  integrated spectrum (now a function of two variables) by

  <\equation>
    <label|eq:integrated_spectrum>d*F<around|(|\<omega\>,\<nu\>|)>=E<around|{|<around|\||d*Z<around|(|\<omega\>|)>*d*Z<rsup|\<ast\>><around|(|\<nu\>|)>|\|>|}>
  </equation>

  On the other hand, Hatanaka and Suzuki (unpublished) define the spectrum
  (or more precisely, spectral density function) of any non-stationary
  process as the limit of the expected value of the periodogram as the sample
  size tends to infinity. In our approach, however, we define a spectral
  quantity whose physical interpretation is similar to that of the spectrum
  of a stationary process. A somewhat related idea was developed by Page
  <cite|page1952> who introduced the idea of \Pinstantaneous power spectra\Q.
  In effect Page defines the spectrum in the same way as Hatanaka and Suzuki,
  i.e. as

  <\equation>
    <label|eq:page_spectrum1>f<rsup|\<ast\>><around|(|\<omega\>|)>=lim<rsub|T\<rightarrow\>\<infty\>>
    f<rsub|T><rsup|\<ast\>><around|(|\<omega\>|)>,
  </equation>

  where

  <\equation>
    <label|eq:page_spectrum2>f<rsub|T><rsup|\<ast\>><around|(|\<omega\>|)>=E<around*|\||<big|int><rsub|0><rsup|T>X<rsub|t>*e<rsup|-i*\<omega\>*t>*d*t|\|><rsup|2>
  </equation>

  and then defines the instantaneous power spectrum
  <math|\<rho\><rsub|t><around|(|\<omega\>|)>> by writing, for each
  <math|\<omega\>>,

  <\equation>
    <label|eq:page_spectrum3>f<rsub|T><rsup|\<ast\>><around|(|\<omega\>|)>=<big|int><rsub|0><rsup|T>\<rho\><rsub|t><around|(|\<omega\>|)>*d*t
  </equation>

  so that

  <\equation>
    <label|eq:page_spectrum4>\<rho\><rsub|t><around|(|\<omega\>|)>=<frac|d|d*t><around|{|f<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>|}>
  </equation>

  and

  <\equation>
    <label|eq:page_spectrum5>f<rsup|\<ast\>><around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>\<rho\><rsub|t><around|(|\<omega\>|)>*d*t
  </equation>

  Thus, the instantaneous power spectrum,
  <math|\<rho\><rsub|t><around|(|\<omega\>|)>>, represents the difference
  between the spectral content of the process over the interval
  <math|<around|(|0,t+\<delta\>*t|)>> and the interval
  <math|<around|(|0,t|)>>. This is in contrast with the approach developed
  below, whose object (roughly speaking) is to study the spectral content of
  the process within the interval <math|<around|(|t,t+\<delta\>*t|)>>. We
  feel that this latter quantity is the more relevant one as far as physical
  interpretation is concerned.

  <section*|3. Spectral Theory for a Class of Non-stationary Processes:
  Oscillatory Processes>

  Consider a continuous parameter (complex-valued) stochastic process
  <math|<around|{|X<rsub|t>|}>>, <math|-\<infty\>\<less\>t\<less\>\<infty\>>.
  (Most of the following discussion will, with the usual modifications, apply
  equally well to discrete parameter processes.) We assume that the process
  is \Ptrend free\Q, that is, we may write <math|E<around|(|X<rsub|t>|)>=0>,
  all <math|t>, and define the autocovariance function by

  <\equation>
    <label|eq:autocovariance>R<rsub|s,t>=E*<around|(|X<rsub|s>*X<rsub|t><rsup|\<ast\>>|)>
  </equation>

  (there seems little point in discussing processes for which
  <math|R<rsub|s,t>> is a function of <math|<around|\||t-s|\|>> only, but
  <math|E<around|(|X<rsub|t>|)>> varies with <math|t>, i.e. the
  non-stationary character is confined to the mean, since in this case the
  process may be studied by a combination of regression analysis and
  classical spectral analysis (cf. <cite|grenander1957>, Ch. 7).

  We now restrict attention to the class of process for which there exists a
  family <math|<with|math-font|cal*|F>> of functions
  <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>> defined on the
  real line, and indexed by the suffix <math|t>, and a measure
  <math|\<mu\><around|(|\<omega\>|)>> on the real line, such that for each
  <math|s,t>, the covariance function <math|R<rsub|s,t>> admits a
  representation of the form

  <\equation>
    <label|eq:covar_representation>R<rsub|s,t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|s><around|(|\<omega\>|)>*\<phi\><rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>
  </equation>

  When the parameter space is limited to a finite interval, say
  <math|0\<leqslant\>t\<leqslant\>T>, it is always possible to obtain a
  representation of the form <eqref|eq:covar_representation> in terms of the
  eigenfunctions of the covariance kernel <math|<around|{|R<rsub|s,t>|}>>
  (Parzen, unpublished). It should be noted that although we have described
  <math|<with|math-font|cal*|F>> as a family of functions, each defined on
  the <math|\<omega\>>-axis and indexed by the parameter <math|t>, we may
  also think of <math|<with|math-font|cal*|F>> as a family of functions
  <math|<around|{|\<phi\><rsub|\<omega\>><around|(|t|)>|}>>, say, each
  defined on the <math|t>-axis and indexed by the parameter <math|\<omega\>>.
  In fact, when we study the properties of various families (Section 7), it
  is convenient to adopt the latter description.

  In order for <math|<math-up|var><around|(|X<rsub|t>|)>> to be finite for
  each <math|t>, <math|\<phi\><rsub|t><around|(|\<omega\>|)>> must be
  quadratically integrable with respect to the measure <math|\<mu\>>, for
  each <math|t>. It may then be shown (see, e.g., <cite|bartlett1955>, p.
  143; <cite|grenander1957>, p. 27) that whenever <math|R<rsub|s,t>> has the
  representation <eqref|eq:covar_representation>, the process
  <math|<around|{|X<rsub|t>|}>> admits a representation of the form

  <\equation>
    <label|eq:process_rep2>X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is an orthogonal process, with

  <\equation>
    <label|eq:orthogonal_process>E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>
  </equation>

  The measure <math|\<mu\><around|(|\<omega\>|)>> here plays the same role as
  the integrated spectrum <math|F<around|(|\<omega\>|)>> does in the case of
  stationary processes, so that the analogous situation to the case of an
  absolutely continuous spectrum is obtained by assuming that the measure
  <math|\<mu\><around|(|\<omega\>|)>> is absolutely continuous with respect
  to Lebesgue measure.

  Parzen (unpublished) has pointed out that if there exists a representation
  of <math|<around|{|X<rsub|t>|}>> of the form <eqref|eq:process_rep2>, then
  there is a multitude of different representations of the process, each
  representation based on a different family of functions. (The situation is
  in some ways similar to the selection of a basis for a vector space.) When
  the process is stationary, one valid choice of functions is the complex
  exponential family given by

  <\equation>
    <label|eq:complex_exp>\<phi\><rsub|t><around|(|\<omega\>|)>=e<rsup|i*\<omega\>*t>
  </equation>

  This family provides the well-known spectral decomposition (cf.
  <eqref|eq:process_rep>) in terms of sine and cosine \Pwaves\Q, and forms
  the basis of the physical interpretation of spectral analysis as an
  \Penergy distribution over frequency\Q. However, if the process is
  nonstationary this choice of family of functions is no longer valid (since
  the representation <eqref|eq:process_rep> implies that
  <math|<around|{|X<rsub|t>|}>> is stationary), and the physical concept of
  \Pfrequency\Q would appear to be no longer directly relevant. This is
  hardly surprising, since the sine and cosine waves are themselves
  \Pstationary\Q and it is natural that they should form the \Pbasic
  elements\Q used in building up models of stationary processes. If we wish
  to introduce the notion of frequency in the analysis of non-stationary
  processes, we are led to seeking new \Pbasic elements\Q which, although
  \Pnon-stationary\Q, have an oscillatory form, and in which the notion of
  \Pfrequency\Q is still dominant. One class of basic elements (or more
  precisely, family of functions) which possess the required structure may be
  obtained as follows. Suppose that, for each fixed <math|\<omega\>>,
  <math|\<phi\><rsub|t><around|(|\<omega\>|)>> (considered as a function of
  <math|t>) possesses a (generalized) Fourier transform whose modulus has an
  absolute maximum at frequency <math|\<theta\><around|(|\<omega\>|)>>, say.
  Then we may regard <math|\<phi\><rsub|t><around|(|\<omega\>|)>> as an
  amplitude modulated sine wave with frequency
  <math|\<theta\><around|(|\<omega\>|)>>, and write
  <math|\<phi\><rsub|t><around|(|\<omega\>|)>> in the form

  <\equation>
    <label|eq:amplitude_modulated>\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<theta\><around|(|\<omega\>|)>*t>
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
    <eqref|eq:amplitude_modulated>, where
    <math|A<rsub|t><around|(|\<omega\>|)>> is of the form

    <\equation>
      <label|eq:modulating_function>A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<theta\>>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>
    </equation>

    with <math|<around|\||d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>>
    having an absolute maximum at <math|\<theta\>=0>. (The function
    <math|A<rsub|t><around|(|\<omega\>|)>> may be regarded as the
    \Penvelope\Q of <math|\<phi\><rsub|t><around|(|\<omega\>|)>>.) If,
    further, the family <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>>
    is such that <math|\<theta\><around|(|\<omega\>|)>> is a single-valued
    function of <math|\<omega\>> (i.e. if no two distinct members of the
    family have Fourier transforms whose maxima occur at the same point),
    then we may transform the variable in the integral in
    <eqref|eq:covar_representation> from <math|\<omega\>> to
    <math|\<theta\><around|(|\<omega\>|)>>, and by suitably redefining
    <math|A<rsub|t><around|(|\<omega\>|)>> and the measure
    <math|\<mu\><around|(|\<omega\>|)>>, write

    <\equation>
      <label|eq:covar_representation2>R<rsub|s,t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|s><around|(|\<omega\>|)>*A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    and correspondingly

    <\equation>
      <label|eq:process_rep3>X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    where\ 

    <\equation>
      E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>
    </equation>
  </definition>

  <\definition>
    <label|def:oscillatory_process>If there exists a family of oscillatory
    functions <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>>, in
    terms of which the process <math|<around|{|X<rsub|t>|}>> has a
    representation of the form <eqref|eq:covar_representation>,
    <math|<around|{|X<rsub|t>|}>> will be termed an \Poscillatory process\Q.
  </definition>

  It follows that any oscillatory process also has a representation of the
  form <eqref|eq:process_rep3>, where the family
  <math|A<rsub|t><around|(|\<omega\>|)>> satisfies the condition of
  definition <eqref|def:oscillatory_function>, and that, without loss of
  generality, we may write any family of oscillatory functions in the form

  <\equation>
    <label|eq:oscillatory_functions>\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>
  </equation>

  We may note that, since <eqref|eq:complex_exp> is a particular case of
  <eqref|eq:amplitude_modulated> (with <math|A<rsub|t><around|(|\<omega\>|)>\<equiv\>1>,
  all <math|t,\<omega\>>, and <math|\<theta\><around|(|\<omega\>|)>\<equiv\>\<omega\>>),
  the class of oscillatory processes certainly includes all second-order
  stationary processes.

  <section*|4. Evolutionary (Power) Spectra>

  Consider an oscillatory process of the form <eqref|eq:process_rep3>, with
  autocovariance function, <math|R<rsub|s,t>>, of the form
  <eqref|eq:covar_representation2>. For any particular process
  <math|<around|{|X<rsub|t>|}>> there will, in general, be a large number of
  different families of oscillatory functions in terms of each of which
  <math|<around|{|X<rsub|t>|}>> has a representation of the form
  <eqref|eq:process_rep3>, with each family inducing a different measure
  <math|\<mu\><around|(|\<omega\>|)>>. For a particular family,
  <math|<with|math-font|cal*|F>>, of spectral functions
  <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>>, it is tempting
  to define the spectrum of <math|<around|{|X<rsub|t>|}>> (with respect to
  <math|<with|math-font|cal*|F>>) simply as the measure
  <math|\<mu\><around|(|\<omega\>|)>>. However, such a definition would not
  have the interpretation of an \Penergy distribution over frequency\Q. For,
  from <eqref|eq:covar_representation2>, we may write

  <\equation>
    <label|eq:total_energy><math-up|var>X<rsub|t>\<equiv\>R<rsub|t,t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
  </equation>

  Since var <math|X<rsub|t>> may be interpreted as a measure of the \Ptotal
  energy\Q of the process at time <math|t>, <eqref|eq:total_energy> gives a
  decomposition of total energy in which the contribution from \Pfrequency\Q
  <math|\<omega\>> is <math|<around|{|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>|}>>.
  This result is consistent with the interpretation of equation
  <eqref|eq:process_rep3> as an expression for <math|X<rsub|t>> as the
  limiting form of a \Psum\Q of sine waves with different frequencies and
  time-varying random amplitudes <math|<around|{|A<rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)>|}>>.
  We are thus led to the following definition.

  <\definition>
    <label|def:evol_spectrum>Let <math|<with|math-font|cal*|F>> denote a
    particular family of oscillatory functions,
    <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}>\<equiv\><around|{|A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>|}>>,
    and let <math|<around|{|X<rsub|t>|}>> be an oscillatory process having a
    representation of the form <eqref|eq:process_rep3> in terms of the family
    <math|<with|math-font|cal*|F>>. We define the evolutionary power spectrum
    at time <math|t> with respect to the family
    <math|<with|math-font|cal*|F>>, <math|d*F<rsub|t><around|(|\<omega\>|)>>,
    by

    <\equation>
      <label|eq:evol_spectrum>d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
    </equation>
  </definition>

  Note that when <math|<around|{|X<rsub|t>|}>> is stationary, and
  <math|<with|math-font|cal*|F>> is chosen to be the family of complex
  exponentials, <math|d*F<rsub|t><around|(|\<omega\>|)>> reduces to the
  standard definition of the (integrated) spectrum. The evolutionary spectrum
  has the same physical interpretation as the spectrum of a stationary
  process, namely, that it describes a distribution of energy over frequency,
  but whereas the latter is determined by the behaviour of the process over
  all time, the former represents specifically the spectral content of the
  process in the neighbourhood of the time instant <math|t>.

  Although, according to definition <eqref|def:evol_spectrum>, the
  evolutionary spectrum, <math|d*F<rsub|t><around|(|\<omega\>|)>>, depends on
  the choice of family <math|<with|math-font|cal*|F>>, it follows from
  equation <eqref|eq:total_energy> that

  <\equation>
    <label|eq:integral_spectrum><math-up|var><around|(|X<rsub|t>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>d*F<rsub|t><around|(|\<omega\>|)>
  </equation>

  so that the value of the integral of <math|d*F<rsub|t><around|(|\<omega\>|)>>
  is independent of the particular family <math|<with|math-font|cal*|F>>,
  and, for all families, represents the total energy of the process at time
  <math|t>.

  It is now convenient to \Pstandardize\Q the functions
  <math|A<rsub|t><around|(|\<omega\>|)>> so that, for all <math|\<omega\>>,

  <\equation>
    <label|eq:standardize>A<rsub|0><around|(|\<omega\>|)>=1
  </equation>

  i.e. we incorporate <math|<around|\||A<rsub|0><around|(|\<omega\>|)>|\|>>
  in the measure <math|\<mu\><around|(|\<omega\>|)>>. With this convention,
  <math|d*\<mu\><around|(|\<omega\>|)>> represents the evolutionary spectrum
  at <math|t=0>, and <math|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>>
  represents the change in the spectrum, relative to zero time. We now have,
  for each <math|\<omega\>>,

  <\equation>
    <label|eq:unit_integral><big|int><rsub|-\<infty\>><rsup|\<infty\>>d*H<rsub|\<omega\>><around|(|\<theta\>|)>=1
  </equation>

  so that the Fourier transforms of the <math|<around|{|A<rsub|t><around|(|\<omega\>|)>|}>>
  are normalized to have unit integrals.

  There is an interesting alternative interpretation of oscillatory processes
  in terms of time-varying filters. Let <math|<around|{|X<rsub|t>|}>> be of
  the form <eqref|eq:process_rep3> and suppose that for each fixed <math|t>
  we may write (formally)

  <\equation>
    <label|eq:filter_fourier>A<rsub|t><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*u>*h<rsub|t><around|(|u|)>*d*u
  </equation>

  Then from <eqref|eq:process_rep3>

  <\equation>
    <label|eq:filter_representation>X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t-u>*h<rsub|t><around|(|u|)>*d*u
  </equation>

  where

  <\equation>
    <label|eq:stationary_process>S<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  is a stationary process with spectrum <math|d*\<mu\><around|(|\<omega\>|)>>.
  Thus <math|X<rsub|t>> may be interpreted as the result of passing a
  stationary process through a time-varying filter
  <math|<around|{|h<rsub|t><around|(|u|)>|}>>. Conversely, any process of the
  form <eqref|eq:filter_representation> (with <math|h<rsub|t><around|(|u|)>>
  chosen so that <math|A<rsub|t><around|(|\<omega\>|)>> is of the required
  form) may be written in the form <eqref|eq:process_rep3>. Thus the
  evolutionary spectrum at time <math|t>,
  <math|<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>>,
  may be interpreted as the spectrum (in the classical sense) of the
  stationary process which we would have obtained if the filter
  <math|<around|{|h<rsub|t><around|(|u|)>|}>> was held fixed in the state
  which it attained at the time instant <math|t>.

  \;

  <\thebibliography|99>
    <bibitem|bartlett1955>Bartlett, M. S. (1955), An Introduction to
    Stochastic Processes with Special Reference to Methods and Applications.
    Cambridge University Press.

    <bibitem|cramer1960>Cramér, H. (1960), \POn some classes of
    non-stationary processes\Q, Proc. Fourth Berkeley Symposium Math.
    Statist. and Prob., 2, 57-78. University of California Press.

    <bibitem|grenander1957>Grenander, U. and Rosenblatt, M. (1957),
    Statistical Analysis of Stationary Time Series. New York: Wiley.

    <bibitem|herbst1963a>Herbst, L. J. (1963a), \PPeriodogram analysis and
    variance fluctuations\Q, J. R. statist. Soc. B, 25, 442-450.

    <bibitem|herbst1963b>Herbst, L. J. (1963b), \PA test for variance
    heterogeneity in the residuals of a Gaussian moving average\Q, J. R.
    statist. Soc. B, 25, 451-454.

    <bibitem|herbst1963c>Herbst, L. J. (1963c), \PAlmost periodic
    variances\Q, Ann. math. Statist., 34, 1549-1557.

    <bibitem|jowett1957>Jowett, G. H. (1957), \PStatistical analysis using
    local properties of smoothly heteromorphic stochastic series\Q,
    Biometrika, 44, 454-463.

    <bibitem|lomnicki1957>Lomnicki, Z. A. and Zaremba, S. K. (1957), \POn
    estimating the spectral density function of a stochastic process\Q, J. R.
    statist. Soc. B, 19, 13-37.

    <bibitem|page1952>Page, C. H. (1952), \PInstantaneous power spectra\Q, J.
    appl. Phys., 23, 103-106.

    <bibitem|priestley1962>Priestley, M. B. (1962), \PBasic consideration in
    the estimation of spectra\Q, Technometrics, 4, 551-563.
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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|4|3>>
    <associate|auto-3|<tuple|10|4>>
    <associate|auto-4|<tuple|21|7>>
    <associate|auto-5|<tuple|29|8>>
    <associate|bib-bartlett1955|<tuple|bartlett1955|8>>
    <associate|bib-cramer1960|<tuple|cramer1960|8>>
    <associate|bib-grenander1957|<tuple|grenander1957|8>>
    <associate|bib-herbst1963a|<tuple|herbst1963a|8>>
    <associate|bib-herbst1963b|<tuple|herbst1963b|9>>
    <associate|bib-herbst1963c|<tuple|herbst1963c|9>>
    <associate|bib-jowett1957|<tuple|jowett1957|9>>
    <associate|bib-lomnicki1957|<tuple|lomnicki1957|9>>
    <associate|bib-page1952|<tuple|page1952|9>>
    <associate|bib-priestley1962|<tuple|priestley1962|9>>
    <associate|def:evol_spectrum|<tuple|3|7>>
    <associate|def:oscillatory_function|<tuple|1|6>>
    <associate|def:oscillatory_process|<tuple|2|6>>
    <associate|eq:amplitude_modulated|<tuple|16|5>>
    <associate|eq:autocovariance|<tuple|11|4>>
    <associate|eq:complex_exp|<tuple|15|5>>
    <associate|eq:covar_representation|<tuple|12|4>>
    <associate|eq:covar_representation2|<tuple|18|6>>
    <associate|eq:covariance|<tuple|1|1>>
    <associate|eq:evol_spectrum|<tuple|23|7>>
    <associate|eq:filter_fourier|<tuple|27|8>>
    <associate|eq:filter_representation|<tuple|28|8>>
    <associate|eq:integral_spectrum|<tuple|24|7>>
    <associate|eq:integrated_spectrum|<tuple|5|3>>
    <associate|eq:modulating_function|<tuple|17|6>>
    <associate|eq:orthogonal_process|<tuple|14|5>>
    <associate|eq:oscillatory_functions|<tuple|21|6>>
    <associate|eq:page_spectrum1|<tuple|6|3>>
    <associate|eq:page_spectrum2|<tuple|7|3>>
    <associate|eq:page_spectrum3|<tuple|8|3>>
    <associate|eq:page_spectrum4|<tuple|9|3>>
    <associate|eq:page_spectrum5|<tuple|10|4>>
    <associate|eq:piecewise_stat|<tuple|4|2>>
    <associate|eq:process_rep|<tuple|3|2>>
    <associate|eq:process_rep2|<tuple|13|5>>
    <associate|eq:process_rep3|<tuple|19|6>>
    <associate|eq:spectral_rep|<tuple|2|2>>
    <associate|eq:standardize|<tuple|25|8>>
    <associate|eq:stationary_process|<tuple|29|8>>
    <associate|eq:total_energy|<tuple|22|7>>
    <associate|eq:unit_integral|<tuple|26|8>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      grenander1957

      jowett1957

      cramer1960

      page1952

      grenander1957

      bartlett1955

      grenander1957
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.
      Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.
      Non-stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.
      Spectral Theory for a Class of Non-stationary Processes: Oscillatory
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.
      Evolutionary (Power) Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>