<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

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

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5. The
    Uniformly Modulated Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6. Effect of
    Filters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7.
    Semi-stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8.
    Determination of Evolutionary Spectra>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9. Estimation
    of Evolutionary Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10. Discrete
    Parameter Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|11. Further
    Problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>
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

    where <math|E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>>.
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
    <label|eq:standardize>A<rsub|0><around|(|\<omega\>|)>=1;
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

  In Section 9 we show how, for a certain class of processes, evolutionary
  spectra may be estimated from a sample record of
  <math|<around|{|X<rsub|t>|}>>, and by examining the variations of
  <math|d*F<rsub|t><around|(|\<omega\>|)>> over time we are enabled to study
  continuously the changing spectral pattern of the process.

  <section*|5. The Uniformly Modulated Process>

  One interesting example of a non-stationary process satisfying the model
  <eqref|eq:process_rep3> is the following

  <\equation>
    <label|eq:uniform_modulated>X<rsub|t>=c<around|(|t|)>*X<rsub|t><rsup|<around|(|0|)>>
  </equation>

  where <math|<around|{|X<rsub|t><rsup|<around|(|0|)>>|}>> is a stationary
  process with zero mean and spectrum <math|d*F<around|(|\<omega\>|)>>, and
  the function <math|c<around|(|t|)>> (with <math|c<around|(|0|)>=1>) has a
  (generalized) Fourier transform whose modulus has an absolute maximum at
  the origin. (For example, <math|c<around|(|t|)>> may be any non-negative
  real-valued function whose Fourier transform exists.) Processes of the form
  <eqref|eq:uniform_modulated> have been studied by
  <cite|herbst1963a|herbst1963b|herbst1963c>. Since
  <math|<around|{|X<rsub|t><rsup|<around|(|0|)>>|}>> is stationary, we may
  write

  <\equation>
    <label|eq:stationary_rep>X<rsub|t><rsup|<around|(|0|)>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  where <math|Z<around|(|\<omega\>|)>> is orthogonal with
  <math|E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*F<around|(|\<omega\>|)>>,
  so that

  <\equation>
    <label|eq:modulated_rep>X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>c<around|(|t|)>*e<rsup|i*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
  </equation>

  We may note that since <math|<with|math-font|cal*|F><rsub|0>\<equiv\><around|{|c<around|(|t|)>*e<rsup|i*\<omega\>*t>|}>>
  is a family of oscillatory functions, the process defined by
  <eqref|eq:uniform_modulated> is an oscillatory process and, with respect to
  <math|<with|math-font|cal*|F><rsub|0>>, has evolutionary spectrum

  <\equation>
    <label|eq:modulated_spectrum>d*F<rsub|t><around|(|\<omega\>|)>=<around|\||c<around|(|t|)>|\|><rsup|2>*d*F<around|(|\<omega\>|)>
  </equation>

  It should be observed, however, that the process defined by
  <eqref|eq:uniform_modulated> is a very special case of the model
  <eqref|eq:process_rep3>, in that all the spectral components (with respect
  to <math|<with|math-font|cal*|F><rsub|0>>) are varying over time in exactly
  the same way. More specifically, for any pair of frequencies
  <math|\<omega\><rsub|1>,\<omega\><rsub|2>>, and time instants
  <math|t<rsub|1>,t<rsub|2>>,

  <\equation>
    <label|eq:modulated_ratio><frac|d*F<rsub|t<rsub|2>><around|(|\<omega\><rsub|1>|)>|d*F<rsub|t<rsub|2>><around|(|\<omega\><rsub|1>|)>>=<frac|d*F<rsub|t<rsub|1>><around|(|\<omega\><rsub|2>|)>|d*F<rsub|t<rsub|2>><around|(|\<omega\><rsub|2>|)>>
  </equation>

  A process for which there exists a family
  <math|<with|math-font|cal*|F><rsub|0>> such that the evolutionary spectrum
  (with respect to <math|<with|math-font|cal*|F><rsub|0>>) has the above
  property will be called a uniformly modulated process.

  <section*|6. Effect of Filters>

  One of the most useful features of the spectral representation of
  stationary processes is that it enables the effect of linear
  transformations (i.e. \Pfilters\Q) to be described purely in terms of the
  effect on individual spectral components. Thus, if we consider a linear
  transformation of a stationary process <math|<around|{|X<rsub|t>|}>>, of
  the form

  <\equation>
    <label|eq:filter_transform>Y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*X<rsub|t-u>*d*u
  </equation>

  then it is well known that (with an obvious notation) the spectra of
  <math|<around|{|X<rsub|t>|}>> and <math|<around|{|Y<rsub|t>|}>> are related
  by

  <\equation>
    <label|eq:filter_spectrum>d*F<rsup|<around|(|Y|)>><around|(|\<omega\>|)>=<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsup|<around|(|X|)>><around|(|\<omega\>|)>
  </equation>

  where

  <\equation>
    <label|eq:transfer_function>\<Gamma\><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*e<rsup|-i*u*\<omega\>>*d*u
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
  <eqref|eq:process_rep3>, and consider a slightly more general form of the
  transformation <eqref|eq:filter_transform>, namely

  <\equation>
    <label|eq:generalized_transform>Y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>*d*u
  </equation>

  where <math|\<omega\><rsub|0>> is any constant frequency. Then we may write

  <\equation>
    <label|eq:transformed_rep>Y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Gamma\><rsub|t,\<omega\>+\<omega\><rsub|0>><around|(|\<omega\>|)>*A<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>*d*Z*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  where, for any <math|t,\<lambda\>,\<theta\>>,

  <\equation>
    <label|eq:generalized_transfer>\<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*<around|{|A<rsub|t-u><around|(|\<lambda\>|)>/A<rsub|t><around|(|\<lambda\>|)>|}>*e<rsup|-i*u*\<theta\>>*d*u
  </equation>

  The function <math|\<Gamma\><rsub|t,\<omega\>><around|(|\<omega\>|)>> will
  be termed the generalized transfer function of the filter
  <math|<around|{|g<around|(|u|)>|}>> with respect to the family
  <math|<with|math-font|cal*|F>>.

  Now the representation of <math|<around|{|Y<rsub|t>|}>> given by
  <eqref|eq:transformed_rep> is not necessarily of the form
  <eqref|eq:process_rep3>, since the modulus of the (generalized) Fourier
  transform of <math|<around|{|\<Gamma\><rsub|t,\<omega\>+\<omega\><rsub|0>><around|(|\<omega\>|)>*A<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|}>>
  may not have an absolute maximum at zero frequency. If not, then the
  function

  <\equation>
    <label|eq:transformed_phi><wide|\<phi\>|^><rsub|t><around|(|\<omega\>|)>=\<Gamma\><rsub|t,\<omega\>+\<omega\><rsub|0>><around|(|\<omega\>|)>*A<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>
  </equation>

  will still, in general, be oscillatory, but its \Pdominant\Q frequency will
  be slightly shifted from <math|\<omega\>>.

  There is, however, an important case where, for each <math|t,\<lambda\>>,
  the function <math|\<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>>
  reduces approximately to <math|\<Gamma\><around|(|\<theta\>|)>>, namely
  when <math|A<rsub|t-u><around|(|\<lambda\>|)>> is, for each
  <math|t,\<lambda\>>, slowly varying compared with the function
  <math|g<around|(|u|)>>. Thus, we assume that <math|g<around|(|u|)>> decays
  rapidly to zero as <math|<around|\||u|\|>\<rightarrow\>\<infty\>>, and that
  <math|A<rsub|t-u><around|(|\<lambda\>|)>> is approximately constant over
  the range of <math|u> for which <math|g<around|(|u|)>> is non-negligible.
  In this case, we may write heuristically (for each <math|t,\<lambda\>>)

  <\equation>
    <label|eq:approximate_transfer>\<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>\<sim\>\<Gamma\><around|(|\<theta\>|)>,<space|1em><text|all
    >\<theta\>
  </equation>

  so that using <eqref|eq:transformed_rep> we may write
  <math|<around|{|Y<rsub|t>|}>> in the form

  <\equation>
    <label|eq:approximate_rep>Y<rsub|t>\<sim\><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>*d*<wide|Z|~><around|(|\<omega\>|)>
  </equation>

  where

  <\equation>
    <label|eq:transformed_z>E*<around|\||d*<wide|Z|~><around|(|\<omega\>|)>|\|><rsup|2>=<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  Thus, we have

  <\equation>
    <label|eq:transformed_spectrum>d*F<rsub|t><rsup|<around|(|Y|)>><around|(|\<omega\>|)>\<sim\><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsub|t><rsup|<around|(|X|)>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  where the evolutionary spectra <math|d*F<rsub|t><rsup|<around|(|Y|)>><around|(|\<omega\>|)>>
  and <math|d*F<rsub|t><rsup|<around|(|X|)>><around|(|\<omega\>|)>> are both
  defined with respect to the same family of oscillatory functions
  <math|<with|math-font|cal*|F>\<equiv\><around|{|A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>|}>>.

  In order to define more precisely the notion of a \Pslowly varying\Q
  function <math|A<rsub|t-u><around|(|\<lambda\>|)>>, and to examine in more
  detail the approximation <eqref|eq:approximate_transfer>, we now introduce
  the notion of \Psemi-stationary processes\Q.

  <section*|7. Semi-stationary Processes>

  Let <math|<around|{|X<rsub|t>|}>> be an oscillatory process whose
  non-stationary characteristics are changing \Pslowly\Q over time. Then we
  may expect that there will exist a family <math|<with|math-font|cal*|F>> of
  oscillatory functions <math|\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>
  in terms of which <math|<around|{|X<rsub|t>|}>> has a representation of the
  form <eqref|eq:process_rep3>, and which are such that, for each
  <math|\<omega\>,A<rsub|t><around|(|\<omega\>|)>> is (in some sense) a
  slowly varying function of <math|t>. Now there are, of course, various ways
  of defining a slowly varying function, but for our purposes the most
  convenient characterization is obtained by specifying that its Fourier
  transform must be \Phighly concentrated\Q in the region of zero frequency.

  For each family <math|<with|math-font|cal*|F>>, define the function
  <math|B<rsub|<with|math-font|cal*|F>><around|(|\<omega\>|)>> by

  <\equation>
    <label|eq:width_function>B<rsub|<with|math-font|cal*|F>><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<theta\>|\|>*<around*|\||d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>.
  </equation>

  (Note that <math|B<rsub|<with|math-font|cal*|F>><around|(|\<omega\>|)>> is
  a measure of the \Pwidth\Q of <math|<around|\||d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>>.)

  <\definition>
    <label|def:semi_stationary_family>A family <math|<with|math-font|cal*|F>>
    of oscillatory functions will be termed semi-stationary if the function
    <math|B<rsub|<with|math-font|cal*|F>><around|(|\<omega\>|)>> is bounded
    for all <math|\<omega\>>, and the constant,
    <math|B<rsub|<with|math-font|cal*|F>>>, defined by

    <\equation>
      <label|eq:characteristic_width>B<rsub|<with|math-font|cal*|F>>=<around*|[|sup<rsub|\<omega\>><around*|{|B<rsub|<with|math-font|cal*|F>><around|(|\<omega\>|)>|}>|]><rsup|-1>
    </equation>

    will be termed the characteristic width of the family
    <math|<with|math-font|cal*|F>>.
  </definition>

  <\definition>
    <label|def:semi_stationary_process>A semi-stationary process
    <math|<around|{|X<rsub|t>|}>> is now defined as one for which there
    exists a semi-stationary family <math|<with|math-font|cal*|F>> in terms
    of which <math|<around|{|X<rsub|t>|}>> has a representation of the form
    <eqref|eq:process_rep3>.
  </definition>

  For example, the uniformly modulated process, defined in Section 5, is a
  semistationary process, since the family
  <math|<with|math-font|cal*|F><rsub|0>\<equiv\><around|{|c<around|(|t|)>*e<rsup|i*\<omega\>*t>|}>>
  is semi-stationary. (Note that, since <math|c<around|(|t|)>> is independent
  of <math|\<omega\>,B<rsub|<with|math-font|cal*|F><rsub|0>><around|(|\<omega\>|)>>
  is independent of <math|\<omega\>>.)

  For a particular semi-stationary process <math|<around|{|X<rsub|t>|}>>
  consider the class <math|<with|math-font|cal*|C>> of semistationary
  families <math|<with|math-font|cal*|F>>, in terms of each of which
  <math|<around|{|X<rsub|t>|}>> admits a spectral representation. We define
  the characteristic width of the process <math|<around|{|X<rsub|t>|}>>,
  <math|B<rsub|X>>, by

  <\equation>
    <label|eq:process_width>B<rsub|X>=sup<rsub|<with|math-font|cal*|F>\<in\><with|math-font|cal*|C>><around|(|B<rsub|<with|math-font|cal*|F>>|)>
  </equation>

  Roughly speaking, <math|B<rsub|X>> may be interpreted as the maximum
  interval over which the process may be treated as \Papproximately
  stationary\Q. Note that for stationary processes the class
  <math|<with|math-font|cal*|C>> contains the family of complex exponentials,
  which has infinite characteristic width. Consequently, all stationary
  processes have infinite characteristic width.

  Now let <math|<with|math-font|cal*|C><rsup|\<ast\>>\<subset\><with|math-font|cal*|C>>
  denote the sub-class of families whose characteristic widths are each equal
  to <math|B<rsub|X>>, and let <math|<with|math-font|cal*|F><rsup|\<ast\>>>
  denote any family <math|\<in\><with|math-font|cal*|C><rsup|\<ast\>>>. For
  example, if <math|<around|{|X<rsub|t>|}>> is stationary,
  <math|<with|math-font|cal*|C><rsup|\<ast\>>> contains only one family,
  namely the complex exponentials, so that
  <math|<with|math-font|cal*|F><rsup|\<ast\>>> is uniquely determined as this
  family. (However, as far as the theory of evolutionary spectra is
  concerned, the uniqueness of <math|<with|math-font|cal*|F><rsup|\<ast\>>>
  is not required-see Section 8.) If <math|<with|math-font|cal*|C><rsup|\<ast\>>>
  is empty, let <math|<with|math-font|cal*|F><rsup|\<ast\>>> denote any
  family whose characteristic width is arbitrarily close to <math|B<rsub|X>>.

  We now consider the spectral representation of
  <math|<around|{|X<rsub|t>|}>> in terms of the family
  <math|<with|math-font|cal*|F><rsup|\<ast\>>>. Thus, we write

  <\equation>
    <label|eq:optimal_representation>X<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>><around|(|\<omega\>|)>
  </equation>

  where <math|E*<around|\||d*Z<rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>>,
  say, and the functions <math|\<phi\><rsub|t><around|(|\<omega\>|)>=<around|{|A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>|}>\<in\><with|math-font|cal*|F><rsup|\<ast\>>>.
  It is now clear that if the evolutionary spectrum of
  <math|<around|{|X<rsub|t>|}>> is defined with respect to
  <math|<with|math-font|cal*|F><rsup|\<ast\>>>,
  <eqref|eq:transformed_spectrum> will be a valid approximation provided that
  the \Pwidth\Q of <math|g<around|(|u|)>> is much smaller than
  <math|B<rsub|X>>, i.e. provided that, for each
  <math|\<omega\>,d*H<rsub|\<omega\>><rsup|\<ast\>><around|(|\<theta\>|)>>
  (the Fourier transform of <math|A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>>)
  \Pbehaves as a <math|\<delta\>>-function with respect to
  <math|\<Gamma\><around|(|\<omega\>|)>>\Q. To define this notion more
  precisely, we introduce the following definition.

  <\definition>
    <label|def:pseudo_delta>We will say that <math|u<around|(|x|)>> is a
    pseudo <math|\<delta\>>-function of order <math|\<epsilon\>> with respect
    to <math|v<around|(|x|)>> if, for any <math|k>, there exists
    <math|\<epsilon\>(\<ll\>1)> independent of <math|k> such that,

    <\equation>
      <label|eq:pseudo_delta><around*|\||<big|int><rsub|-\<infty\>><rsup|\<infty\>>u<around|(|x|)>*v*<around|(|x+k|)>*d*x-v<around|(|k|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>u<around|(|x|)>*d*x|\|>\<less\>\<epsilon\>
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
      <label|eq:filter_width><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||u|\|><around|\||g<around|(|u|)>|\|>*d*u=B<rsub|g><text|(say)>
    </equation>
  </enumerate>

  (Note that <math|B<rsub|g>> is a measure of the \Pwidth\Q of
  <math|<around|{|g<around|(|u|)>|}>>.)

  <\lemma>
    <label|lemma:pseudo_delta>Let <math|<around|{|<with|math-font|cal*|F>|}>>
    be a semi-stationary family with characteristic width
    <math|B<rsub|<with|math-font|cal*|F>>>. Then, for each
    <math|t,\<omega\>,<around|{|e<rsup|i*t*\<omega\>>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>|}>>
    is a pseudo <math|\<delta\>>-function of order
    <math|<around|(|B<rsub|g>/B<rsub|<with|math-font|cal*|F>>|)>> with
    respect to <math|\<Gamma\><around|(|\<theta\>|)>>.
  </lemma>

  <\proof>
    For any <math|k>, write

    <\equation>
      <label|eq:lemma_proof1><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<theta\>>*\<Gamma\>*<around|(|\<theta\>+k|)>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>=\<Gamma\><around|(|k|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<theta\>>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>+R<around|(|k|)>
    </equation>

    in which

    <\equation>
      <label|eq:lemma_proof2>R<around|(|k|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<theta\>*e<rsup|i*t*\<theta\>>*\<Gamma\><rprime|'>*<around|[|k+\<eta\><around|(|\<theta\>|)>*\<theta\>|]>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>
    </equation>

    where, for each <math|\<theta\>,0\<leqslant\>\<eta\><around|(|\<theta\>|)>\<leqslant\>1>.
    But

    <\equation>
      <label|eq:lemma_proof3><around|\||R<around|(|k|)>|\|>\<leqslant\>sup<rsub|\<theta\>><around|\||\<Gamma\><rprime|'><around|(|\<theta\>|)><around|\||<big|int><rsub|-\<infty\>><rsup|\<infty\>>|\|>*\<theta\><around|\|||\|>*d*H<rsub|\<omega\>><around|(|\<theta\>|)>|\|>\<leqslant\>B<rsub|g>/B<rsub|<with|math-font|cal*|F>>,
    </equation>

    in virtue of <eqref|eq:filter_width>-the result follows.
  </proof>

  We are now in a position to derive a more exact form of the relation
  <eqref|eq:approximate_transfer>.

  <\theorem>
    <label|thm:transfer_approx>Let <math|<around|{|g<around|(|u|)>|}>> be a
    filter satisfying <eqref|eq:filter_normalization>,
    <eqref|eq:filter_width>, and <math|\<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>>
    its generalized transfer function with respect to a semi-stationary
    family <math|<with|math-font|cal*|F>> of characteristic width
    <math|B<rsub|<with|math-font|cal*|F>>>. If, for any
    <math|\<epsilon\>(\<gtr\>0)>, we choose
    <math|<around|{|g<around|(|u|)>|}>> so that
    <math|B<rsub|g>\<leqslant\>\<epsilon\>*B<rsub|<with|math-font|cal*|F>>>,
    then

    <\equation>
      <label|eq:transfer_approx><around|\||A<rsub|t><around|(|\<lambda\>|)><around|\|||\|>*\<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>-\<Gamma\><around|(|\<theta\>|)>|\|>\<less\>\<epsilon\>
    </equation>

    for all <math|t,\<lambda\>,\<theta\>>.
  </theorem>

  <\proof>
    We have, from <eqref|eq:generalized_transfer>,

    <\equation>
      <label|eq:theorem_proof1>A<rsub|t><around|(|\<lambda\>|)>*\<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*A<rsub|t-u><around|(|\<lambda\>|)>*e<rsup|-i*u*\<theta\>>*d*u
    </equation>

    Substituting for <math|A<rsub|t-u><around|(|\<lambda\>|)>> in terms of
    its Fourier transform <math|d*H<rsub|\<lambda\>><around|(|\<theta\>|)>>,
    we obtain

    <\equation>
      <tabular|<tformat|<table|<row|<cell|A<rsub|t><around|(|\<lambda\>|)>*\<Gamma\><rsub|t,\<lambda\>><around|(|\<theta\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*e<rsup|-i*u*\<theta\>>*e<rsup|i*<around|(|t-u|)>*\<phi\>>*d*H<rsub|\<lambda\>><around|(|\<phi\>|)>*d*u>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<phi\>>*\<Gamma\>*<around|(|\<theta\>+\<phi\>|)>*d*H<rsub|\<lambda\>><around|(|\<phi\>|)>>>>>><label|eq:theorem_proof2>
    </equation>

    on interchanging the order of integration. However, according to Lemma
    <reference|lemma:pseudo_delta>, <math|<around|{|e<rsup|i*t*\<phi\>>*d*H<rsub|\<lambda\>><around|(|\<phi\>|)>|}>>
    is a pseudo <math|\<delta\>>-function of order
    <math|<around|(|B<rsub|g>/B<rsub|<with|math-font|cal*|F>>|)>> with
    respect to <math|\<Gamma\><around|(|\<phi\>|)>>. Thus, if
    <math|<around|{|g<around|(|u|)>|}>> is chosen so that, for given
    <math|\<epsilon\>,B<rsub|g>\<leqslant\>\<epsilon\>*B<rsub|<with|math-font|cal*|F>>>,
    then

    <\equation>
      <label|eq:theorem_proof3><around*|\||<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<phi\>>*\<Gamma\>*<around|(|\<theta\>+\<phi\>|)>*d*H<rsub|\<lambda\>><around|(|\<phi\>|)>-\<Gamma\><around|(|\<theta\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<phi\>>*d*H<rsub|\<lambda\>><around|(|\<phi\>|)>|\|>\<less\>\<epsilon\>
    </equation>

    Noting that

    <\equation>
      <label|eq:theorem_proof4><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<phi\>>*d*H<rsub|\<lambda\>><around|(|\<phi\>|)>=A<rsub|t><around|(|\<lambda\>|)>
    </equation>

    the result follows.
  </proof>

  <section*|8. Determination of Evolutionary Spectra>

  Let <math|<around|{|X<rsub|t>|}>> be a semi-stationary process with
  characteristic width <math|B<rsub|X>>, and
  <math|<around|{|g<around|(|u|)>|}>> a filter satisfying
  <eqref|eq:filter_normalization>, <eqref|eq:filter_width>, with width
  <math|B<rsub|g>>. For any frequency <math|\<omega\><rsub|0>>, define the
  process <math|<around|{|Y<rsub|t>|}>> as in
  <eqref|eq:generalized_transform>, i.e. write

  <\equation>
    <label|eq:det_evol_transform>Y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|u|)>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>*d*u
  </equation>

  Using the representation of <math|<around|{|X<rsub|t>|}>> in terms of the
  family <math|<with|math-font|cal*|F><rsup|\<ast\>>> (given by
  <eqref|eq:optimal_representation>), it follows from
  <eqref|eq:transformed_rep> that we may write

  <\equation>
    <label|eq:det_evol_rep>Y<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Gamma\><rsub|t,\<omega\>+\<omega\><rsub|0>><rsup|\<ast\>><around|(|\<omega\>|)>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*\<omega\>*t>*d*Z<rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  where <math|\<Gamma\><rsub|t*\<lambda\>><rsup|\<ast\>><around|(|\<theta\>|)>>
  is the generalized transfer function of <math|<around|{|g<around|(|u|)>|}>>
  with respect to the family <math|<with|math-font|cal*|F><rsup|\<ast\>>>.
  Due to the orthogonality of <math|Z<rsup|\<ast\>><around|(|\<omega\>|)>>,
  it follows that

  <\equation>
    <label|eq:det_evol_energy>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><rsub|t,\<omega\>+\<omega\><rsub|0>><rsup|\<ast\>><around|(|\<omega\>|)><around|\||<rsup|2>|\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  Now suppose that <math|<around|{|g<around|(|u|)>|}>> is chosen so that
  <math|B<rsub|g>\<less\>\<epsilon\>*B<rsub|X>>. Then according to Theorem
  <reference|thm:transfer_approx> (remembering that the characteristic width
  of <math|<with|math-font|cal*|F><rsup|\<ast\>>> is either equal to, or
  arbitrarily close to, <math|B<rsub|X>>), we may write

  <\equation>
    <label|eq:det_evol_approx1>\<Gamma\><rsub|t,\<omega\>+\<omega\><rsub|0>><rsup|\<ast\>><around|(|\<omega\>|)>=\<Gamma\><around|(|\<omega\>|)>+r<around|(|t,\<omega\><rsub|0>,\<omega\>|)>
  </equation>

  where

  <\equation>
    <label|eq:det_evol_approx2><around|\||r<around|(|t,\<omega\><rsub|0>,\<omega\>|)>|\|>\<less\>\<epsilon\>/<around|\||A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|>
  </equation>

  Thus we obtain from <eqref|eq:det_evol_energy>

  <\equation>
    <label|eq:det_evol_approx3>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)><around|\||<rsup|2>|\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>+I<rsub|1>+I<rsub|2>+I<rsub|3>
  </equation>

  say, where

  <\equation>
    <tabular|<tformat|<table|<row|<cell|I<rsub|1>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Gamma\><around|(|\<omega\>|)>*r<rsup|\<ast\>>*<around|\||A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>>>|<row|<cell|I<rsub|2>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Gamma\><rsup|\<ast\>><around|(|\<omega\>|)>*r*<around|\||A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>>>|<row|<cell|I<rsub|3>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||r|\|><rsup|2>*<around|\||A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>>>>>><label|eq:det_evol_error_terms>
  </equation>

  Now

  <\equation>
    <label|eq:det_evol_error_bound1><around|\||I<rsub|3>|\|>\<leqslant\>\<epsilon\><rsup|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>=O<around|(|\<epsilon\><rsup|2>|)>
  </equation>

  and

  <\equation>
    <label|eq:det_evol_error_bound2><around|\||I<rsub|2>|\|>\<leqslant\>\<epsilon\>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)><around|\|||\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  To show that <math|<around|\||I<rsub|2>|\|>=O<around|(|\<epsilon\>|)>>, it
  remains to prove that the integral on the right-hand side of the above
  inequality remains finite as <math|B<rsub|g>\<rightarrow\>0>. To
  demonstrate this fact, let the set <math|\<Omega\>> be defined by

  <\equation>
    <label|eq:det_evol_set>\<Omega\>=<around|{|\<omega\>:<around|\||\<Gamma\><around|(|\<omega\>|)><around|\|||\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|>\<leqslant\>1|}>
  </equation>

  Then

  <\equation>
    <with|font-base-size|9|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)><around|\|||\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>\<leqslant\><big|int><rsub|\<Omega\>>d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>+<big|int><rsub|<wide|\<Omega\>|\<bar\>>><around|\||\<Gamma\><around|(|\<omega\>|)><around|\||<rsup|2>|\|>*A<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>><label|eq:det_evol_integral_split>
  </equation>

  The first term is finite, since <math|d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>>
  is the evolutionary spectrum at zero time with respect to
  <math|<with|math-font|cal*|F><rsup|\<ast\>>>, and the second term is finite
  since <math|\<Gamma\><around|(|\<omega\>|)>> is normalized so that

  <\equation>
    <label|eq:det_evol_normalized><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>=1
  </equation>

  The term <math|I<rsub|1>> may be treated similarly, so that in terms of

  <\equation>
    <label|eq:det_evol_spectrum>d*F<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>=<around|\||A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>
  </equation>

  the evolutionary spectrum of <math|<around|{|X<rsub|t>|}>> with respect to
  the family <math|<with|math-font|cal*|F><rsup|\<ast\>>>, we have

  <\theorem>
    <label|thm:spectrum_estimation>

    <\equation>
      <label|eq:spectrum_estimation>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>+O<around|(|\<epsilon\>|)>
    </equation>

    where <math|O<around|(|\<epsilon\>|)>> denotes a term which may be made
    arbitrarily small by choosing <math|B<rsub|g>> sufficiently small
    relative to <math|B<rsub|X>>.
  </theorem>

  Now consider the case where the measure
  <math|\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>> is absolutely continuous
  with respect to Lebesgue measure, so that for each <math|t> we may write

  <\equation>
    <label|eq:spectrum_density>d*F<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>=f<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  where <math|f<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>>, the
  evolutionary spectral density function, exists for all <math|\<omega\>>.
  Then rewriting Theorem <reference|thm:spectrum_estimation> in terms of
  <math|f<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>>, we have, to
  <math|O<around|(|\<epsilon\>|)>>,

  <\equation>
    <label|eq:spectrum_density_est>E<around|\||Y<rsub|t>|\|><rsup|2>\<doteqdot\><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*f<rsub|t><rsup|\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*\<omega\>
  </equation>

  So far we have worked with the representation of
  <math|<around|{|X<rsub|t>|}>> in terms of the family
  <math|<with|math-font|cal*|F><rsup|\<ast\>>>. However, as the validity of
  <eqref|eq:spectrum_density_est> depends only on the condition
  <math|B<rsub|g>\<ll\>B<rsub|<with|math-font|cal*|F><rsup|\<ast\>>>>, it is
  clear that, for fixed <math|B<rsub|g>>, <eqref|eq:spectrum_density_est>
  will still be approximately true if instead we work with a representation
  of <math|<around|{|X<rsub|t>|}>> in terms of any other semi-stationary
  family <math|<with|math-font|cal*|F>> whose characteristic width
  <math|B<rsub|<with|math-font|cal*|F>>\<gg\>B<rsub|g>>. Thus, if
  <math|d*F<rsub|t><around|(|\<omega\>|)>=f<rsub|t><around|(|\<omega\>|)>*d*\<omega\>>
  is the evolutionary spectrum of <math|<around|{|X<rsub|t>|}>> with respect
  to such a family, then <eqref|eq:spectrum_density_est> will still hold
  approximately if we substitute <math|f<rsub|t><around|(|\<omega\>|)>> for
  <math|f<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>>.

  However, it must be remembered that <eqref|eq:spectrum_density_est> is only
  an approximation. In fact, if we work in terms of a general family
  <math|<with|math-font|cal*|F>>, the exact value of
  <math|E<around|\||Y<rsub|t>|\|><rsup|2>> is given by (cf.
  <eqref|eq:det_evol_energy>)

  <\equation>
    <label|eq:exact_energy>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><rsub|t,\<omega\>+\<omega\><rsub|0>><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  Thus, the exact value of <math|E<around|\||Y<rsub|t>|\|><rsup|2>> is an
  average of <math|d*F<rsub|t><around|(|\<omega\>|)>> over both frequency and
  time, and we note that, since <math|E<around|\||Y<rsub|t>|\|><rsup|2>> is
  independent of the choice of <math|<with|math-font|cal*|F>>, the value of
  this average of <math|d*F<rsub|t><around|(|\<omega\>|)>> (over time and
  frequency) must also be independent of <math|<with|math-font|cal*|F>>. Thus
  the right-hand side of <eqref|eq:exact_energy> has an unambiguous
  interpretation as an \Paverage\Q of the total energy of the process
  contained within a band of frequencies in the region of
  <math|\<omega\><rsub|0>> and an interval of time in the neighbourhood of
  <math|t>.

  Now in writing <eqref|eq:spectrum_density_est>, we have assumed that the
  effect of the \Ptime-averaging\Q is negligible, since the condition
  <math|B<rsub|g>\<ll\>B<rsub|<with|math-font|cal*|F>>> implies that
  <math|d*F<rsub|t><around|(|\<omega\>|)>> is changing very slowly over the
  effective range of the filter <math|<around|{|g<around|(|u|)>|}>>. However,
  the degree of accuracy of <eqref|eq:spectrum_density_est> depends on the
  ratio <math|<around|(|B<rsub|g>/B<rsub|<with|math-font|cal*|F>>|)>>. For
  example, if <math|B<rsub|g>=0>, i.e. <math|g<around|(|u|)>=\<delta\><around|(|u|)>>,
  then <eqref|eq:spectrum_density_est> is exact for all
  <math|<with|math-font|cal*|F>>, and reduces to
  <eqref|eq:integral_spectrum>, namely

  <\equation>
    <label|eq:delta_filter>E<around|\||Y<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>d*F<rsub|t><around|(|\<omega\>|)>
  </equation>

  On the other hand, if

  <\equation>
    <label|eq:inf_width_filter1>g<around|(|u|)>=lim<rsub|T\<rightarrow\>\<infty\>><around|{|g<rsub|T><around|(|u|)>|}>
  </equation>

  where

  <\equation>
    <label|eq:inf_width_filter2>g<rsub|T><around*|(|u|)>=<choice|<tformat|<table|<row|<cell|<frac|1|<sqrt|T>>>|<cell|<around*|\||u|\|>\<leqslant\><frac|T|2>>>|<row|<cell|0>|<cell|<around*|\||u|\|>\<gtr\><frac|T|2>>>>>>
  </equation>

  so that <math|B<rsub|g>=\<infty\>>, then it may be shown that in this case

  <\equation>
    <label|eq:inf_width_energy>E<around|\||Y<rsub|t>|\|><rsup|2>=lim<rsub|T\<rightarrow\>\<infty\>>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||G<rsub|T,\<omega\><rsub|0>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  where

  <\equation>
    <label|eq:inf_width_G>G<rsub|T,\<omega\><rsub|0>><rsup|<around|(|\<omega\>|)>>=<frac|1|<sqrt|T>>*<big|int><rsub|t-<frac|1|2>*T><rsup|t+<frac|1|2>*T>A<rsub|u>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*e<rsup|i*u*\<omega\>>*d*u
  </equation>

  Note that <math|E<around|\||Y<rsub|t>|\|><rsup|2>> is independent of
  <math|t>, and reduces to the classical definition of the spectrum of
  <math|<around|{|X<rsub|t>|}>> (if it were stationary), but that
  <eqref|eq:spectrum_density_est> is now invalid for all families.

  A comparison of equations <eqref|eq:delta_filter> and
  <eqref|eq:inf_width_energy> is interesting. The right-hand side of
  <eqref|eq:delta_filter> is a function only of the evolutionary spectrum at
  time <math|t>, and does not involve its values at other instants of time,
  but it provides no information on the distribution of
  <math|d*F<rsub|t><around|(|\<omega\>|)>> over frequency, since it is
  completely independent of <math|\<omega\><rsub|0>>. However, assuming that,
  for each <math|T,<around|\||G<rsub|T,\<omega\><rsub|0>><around|(|\<omega\>|)>|\|><rsup|2>>
  is highly concentrated in the region <math|\<omega\>=0> (as will generally
  be the case since we have assumed that, for all
  <math|\<omega\>,A<rsub|t><around|(|\<omega\>|)>> is a slowly varying
  function of <math|t>), the right-hand side of <eqref|eq:inf_width_energy>
  will be approximately equal to

  <\equation>
    <label|eq:avg_spectrum>d*\<mu\><around|(|\<omega\><rsub|0>|)><around*|{|lim<rsub|T\<rightarrow\>\<infty\>>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||G<rsub|T,\<omega\><rsub|0>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>|}>
  </equation>

  and this quantity, being completely independent of <math|t>, may be
  interpreted as a form of \Paverage\Q over <math|t> of the values of
  <math|d*F<rsub|t><around|(|\<omega\><rsub|0>|)>> for
  <math|-\<infty\>\<leqslant\>t\<leqslant\>\<infty\>>.

  Thus we see that the more accurately we try to determine
  <math|d*F<rsub|t><around|(|\<omega\>|)>> as a function of time, the less
  accurately we determine it as a function of frequency, and vice versa. This
  feature suggests a form of Uncertainty Principle, namely, "In determining
  evolutionary spectra, one cannot obtain simultaneously a high degree of
  resolution in both the time domain and frequency domain".

  Suppose now that we fix the degree of resolution in the frequency domain,
  i.e. we set a lower bound to <math|B<rsub|g>>. Then for a particular family
  <math|<with|math-font|cal*|F>>, the resolution in the time domain will be
  determined by the value of <math|B<rsub|g>/B<rsub|<with|math-font|cal*|F>>>.
  Clearly then, we obtain the maximum possible resolution in time by working
  in terms of the family with the maximum characteristic width.

  Thus, if <math|<with|math-font|cal*|C><rsup|\<ast\>>> contains only one
  member, i.e. if <math|<with|math-font|cal*|F><rsup|\<ast\>>> is uniquely
  determined, then <math|<with|math-font|cal*|F><rsup|\<ast\>>> provides the
  natural representation for <math|<around|{|X<rsub|t>|}>>, and is the family
  in terms of which we can most precisely express the time-varying spectral
  pattern of the process. In particular, we now see why the natural
  representation of stationary processes is given in terms of the complex
  exponential family-the reason being simply that in this case
  <math|<with|math-font|cal*|F><rsup|\<ast\>>> is unique and is just this
  family.

  If <math|<with|math-font|cal*|C><rsup|\<ast\>>> contains several families,
  <math|<with|math-font|cal*|F><rsub|1><rsup|\<ast\>>,<with|math-font|cal*|F><rsub|2><rsup|\<ast\>>,<with|math-font|cal*|F><rsub|3><rsup|\<ast\>>,\<ldots\>>,
  then we may say that each <math|<with|math-font|cal*|F><rsub|i><rsup|\<ast\>><around|(|i=1,2,\<ldots\>|)>>
  provides a natural representation for the process. For, let
  <math|d*F<rsub|t><rsup|<around|(|i|)>\<ast\>><around|(|\<omega\>|)>> denote
  the evolutionary spectrum with respect to
  <math|<with|math-font|cal*|F><rsub|i><rsup|\<ast\>><around|(|i=1,2,\<ldots\>|)>>
  and let <math|<wide|f|^><rsub|t><rsup|<around|(|i|)>\<ast\>><around|(|\<omega\><rsub|0>|)>>
  denote the "smoothed" evolutionary spectrum, given by

  <\equation>
    <label|eq:smoothed_spectrum><wide|f|^><rsub|t><rsup|<around|(|i|)>\<ast\>><around|(|\<omega\><rsub|0>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*F<rsub|t><rsup|<around|(|i|)>\<ast\>>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  Then we have, for each <math|i>,

  <\equation>
    <label|eq:smoothed_spectrum_approx>E<around|(|<around|\||Y<rsub|t>|\|><rsup|2>|)>=<wide|f|^><rsub|t><rsup|<around|(|i|)>\<ast\>><around|(|\<omega\><rsub|0>|)>+O<around*|(|<frac|B<rsub|g>|B<rsub|X>>|)>
  </equation>

  If now we fix the filter width <math|B<rsub|g>>, then to
  <math|O<around|(|B<rsub|g>/B<rsub|X>|)>> the "smoothed" evolutionary
  spectra with respect to each <math|<with|math-font|cal*|F><rsub|i><rsup|\<ast\>>>
  are identical. Consequently, as "smoothed" spectra are the most we can
  determine, we may regard the representations with respect to each
  <math|<with|math-font|cal*|F><rsub|i><rsup|\<ast\>>> as equivalent-at least
  as far as their corresponding spectra are concerned.

  Finally, consider the case when <math|<with|math-font|cal*|C><rsup|\<ast\>>>
  is empty, i.e. there is no family <math|\<in\><with|math-font|cal*|C>> with
  characteristic width <math|B<rsub|X>>. Then there is no natural
  representation for the process since now, given any family
  <math|\<in\><with|math-font|cal*|C>>, there always exists another member of
  <math|<with|math-font|cal*|C>> with larger characteristic width. However,
  for this case we may redefine the sub-class
  <math|<with|math-font|cal*|C><rsup|\<ast\>>> so that it includes all
  families whose characteristic widths lie between <math|B<rsub|X>-\<eta\>>
  and <math|B<rsub|X>>, where <math|\<eta\>> is arbitrarily small. Then by
  the argument used above it follows that all families
  <math|\<in\><with|math-font|cal*|C><rsup|\<ast\>>> give rise to almost
  identical evolutionary spectra.

  From now on, we will consider only the representation of
  <math|<around|{|X<rsub|t>|}>> in terms of a particular family
  <math|<with|math-font|cal*|F><rsup|\<ast\>>\<in\><with|math-font|cal*|C><rsup|\<ast\>>>,
  and when we refer to the evolutionary spectrum of
  <math|<around|{|X<rsub|t>|}>> (without reference to any particular family)
  we will mean <math|<around|\||A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>>,
  the evolutionary spectrum with respect to the family
  <math|<with|math-font|cal*|F><rsup|\<ast\>>>.

  <section*|9. Estimation of Evolutionary Spectra>

  Suppose we are given a sample record of <math|<around|{|X<rsub|t>|}>>, say
  for <math|0\<leqslant\>t\<leqslant\>T>. We now consider the problem of
  estimating the evolutionary spectrum <math|d*F<rsub|t><around|(|\<omega\>|)>>,
  for <math|0\<leqslant\>t\<leqslant\>T>, from the sample. (We omit the
  asterisks in <math|A<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>,d*\<mu\><rsup|\<ast\>><around|(|\<omega\>|)>>,
  and <math|d*F<rsub|t><rsup|\<ast\>><around|(|\<omega\>|)>>, it being
  understood that all functions are now defined with respect to the family
  <math|<with|math-font|cal*|F><rsup|\<ast\>>>.) We will treat here only the
  case where the measure <math|\<mu\><around|(|\<omega\>|)>> is absolutely
  continuous with respect to Lebesgue measure, so that we may write, for each
  <math|t,d*F<rsub|t><around|(|\<omega\>|)>=f<rsub|t><around|(|\<omega\>|)>*d*\<omega\>>,
  all <math|\<omega\>>, where <math|f<rsub|t><around|(|\<omega\>|)>>, the
  evolutionary spectral density function, exists for all <math|\<omega\>>.

  Let <math|<around|{|g<around|(|u|)>|}>> be a filter of width
  <math|B<rsub|g>> satisfying the conditions of Section 8, and write, for any
  frequency <math|\<omega\><rsub|0>>,

  <\equation>
    <label|eq:est_filter_output>U<rsub|t>=<big|int><rsub|t-T><rsup|t>g<around|(|u|)>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>*d*u
  </equation>

  We assume that <math|B<rsub|g>\<ll\>B<rsub|X>\<ll\>T>, so that for
  <math|t\<gg\>0>, the limits in the above integral may be replaced
  effectively by <math|<around|(|-\<infty\>,\<infty\>|)>>, when
  <math|U<rsub|t>> becomes identical with the process
  <math|<around|{|Y<rsub|t>|}>> defined in <eqref|eq:det_evol_transform>. In
  fact, the difference between <math|U<rsub|t>> and <math|Y<rsub|t>> is due
  to \Ptransients\Q (or \Pend-effects\Q) in the filter output, and we assume
  that these are negligible for <math|t> sufficiently greater than zero. It
  then follows from Theorem <reference|thm:spectrum_estimation> that

  <\equation>
    <label|eq:est_energy>E<around|\||U<rsub|t>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*f<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*\<omega\>+O<around|(|B<rsub|g>/B<rsub|X>|)>
  </equation>

  At this point it is interesting to note an important difference between the
  estimation of evolutionary spectra and the estimation of spectra for
  stationary processes. In the latter case we may still employ the technique
  described above, but the bandwidth of <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>
  is chosen as a function of <math|T> which tends to zero as
  <math|T\<rightarrow\>\<infty\>>. However, in dealing with evolutionary
  spectra, the bandwidth of <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>
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
    <label|eq:est_approx>E<around|\||U<rsub|t>|\|><rsup|2>\<sim\>f<rsub|t><around|(|\<omega\><rsub|0>|)>
  </equation>

  (remembering that

  <\equation>
    <label|eq:est_normalization><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>=1
    <text|)>
  </equation>

  Thus, <math|<around|\||U<rsub|t>|\|><rsup|2>> is an (approximately)
  unbiased estimate of <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>>. Now a
  straightforward calculation shows that, for <math|<around|{|X<rsub|t>|}>> a
  normal process,

  <\equation>
    <label|eq:est_variance><math-up|var><around|(|<around|\||U<rsub|t>|\|><rsup|2>|)>\<sim\><around*|{|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*f<rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*\<omega\>|}><rsup|2>*<around|(|1+\<delta\><rsub|0,\<omega\><rsub|0>>|)>
  </equation>

  which, being independent of <math|T>, means that
  <math|<around|\||U<rsub|t>|\|><rsup|2>> will not be a very useful estimate
  of <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>> in practice. (This is
  completely analogous to the behaviour of the periodogram in classical
  spectral analysis.) However, to reduce sampling fluctuations we may
  \Psmooth\Q the values of <math|<around|\||U<rsub|t>|\|><rsup|2>> for
  neighbouring values of <math|t>. In so doing, we increase the precision of
  our estimates by sacrificing some degree of resolvability in the time
  domain.

  We, therefore, consider a weight-function
  <math|W<rsub|T<rprime|'>><around|(|t|)>>, depending on the parameter
  <math|T<rprime|'>>, which satisfies

  <\enumerate>
    <item><math|W<rsub|T<rprime|'>><around|(|t|)>\<geqslant\>0>, all
    <math|t,T<rprime|'>>,

    <item><math|W<rsub|T<rprime|'>><around|(|t|)>> decays to zero as
    <math|<around|\||t|\|>\<rightarrow\>\<infty\>>, all <math|T<rprime|'>>,

    <item><math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|t|)>*d*t=1>,
    all <math|T<rprime|'>>,

    <item><math|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|{|W<rsub|T<rprime|'>><around|(|t|)>|}><rsup|2>*d*t\<less\>\<infty\>>,
    all <math|T<rprime|'>>
  </enumerate>

  Write

  <\equation>
    <label|eq:est_weight_transform>W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*t>*W<rsub|T<rprime|'>><around|(|t|)>*d*t
  </equation>

  We assume that there exists a constant <math|C> such that

  <\enumerate>
    <item><math|lim<rsub|T<rprime|'>\<rightarrow\>\<infty\>><around|{|T<rprime|'>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<lambda\>|)>|\|><rsup|2>*d*\<lambda\>|}>=C>
  </enumerate>

  Now let

  <\equation>
    <label|eq:est_smoothed>V<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|u|)><around|\||U<rsub|t-u>|\|><rsup|2>*d*u
  </equation>

  Again, we assume that <math|W<rsub|T<rprime|'>><around|(|u|)>> decays
  sufficiently fast so that the above integral may be evaluated from a finite
  length of <math|<around|\||U<rsub|t>|\|><rsup|2>>. It follows from
  <eqref|eq:est_energy> that

  <\equation>
    <label|eq:est_smoothed_energy>

    <\aligned>
      <tformat|<table|<row|<cell|E<around|(|V<rsub|t>|)>>|<cell|\<sim\><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|u|)>*f<rsub|t-u>*<around|(|\<omega\>+\<omega\><rsub|0>|)><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*u*d*\<omega\>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f<rsub|t>|\<bar\>><around|(|\<omega\>+\<omega\><rsub|0>|)><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>>>>>
    </aligned>
  </equation>

  where

  <\equation>
    <label|eq:est_smoothed_spectrum><wide|f|\<bar\>><rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|u|)>*f<rsub|t-u>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*u
  </equation>

  From <eqref|eq:est_smoothed_energy> we see that
  <math|E<around|(|V<rsub|t>|)>> is a \Psmoothed\Q form of
  <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>>, smoothed over both time and
  frequency. If, as before, we assume that
  <math|f<rsub|t><around|(|\<omega\>|)>> is \Pflat\Q compared with
  <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>> (each
  <math|t>), then <eqref|eq:est_smoothed_energy> may be written

  <\equation>
    <label|eq:est_smoothed_approx>E<around|(|V<rsub|t>|)>\<sim\><wide|f|\<bar\>><rsub|t><around|(|\<omega\><rsub|0>|)>
  </equation>

  so that <math|V<rsub|t>> is an (approximately) unbiased estimate of the
  (weighted) average value of <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>>
  in the neighbourhood of the time-instant <math|t>.

  An investigation of the sampling properties of <math|V<rsub|t>> is
  straightforward, if lengthy, and we merely summarize here the main result.
  (A derivation of equations <eqref|eq:est_variance> and
  <eqref|eq:est_variance_smoothed> together with a discussion of certain
  \Pdesign relations\Q will be presented elsewhere.) Assuming that
  <math|<around|{|<around|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>/T<rprime|'>|}>>
  is a pseudo <math|\<delta\>>-function with respect to
  <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>, i.e. that
  the \Pwidth\Q of <math|<around|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>>
  is much smaller than the \Pwidth\Q of <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>,
  i.e. that the \Pwidth\Q of <math|W<rsub|T<rprime|'>><around|(|t|)>> is much
  larger than <math|B<rsub|g>>, we may show that

  <math-up|var>(\|U<rsub|t>\|<rsup|2>) \<sim\><left|{><big|int><rsub|-\<infty\>><rsup|\<infty\>>\|\<Gamma\>(\<omega\>)\|<rsup|2>
  f<rsub|t>(\<omega\>+\<omega\><rsub|0>) d
  \<omega\><right|}><rsup|2>(1+\<delta\><rsub|0, \<omega\><rsub|0>>)

  which, being independent of <math|T>, means that
  <math|<around|\||U<rsub|t>|\|><rsup|2>> will not be a very useful estimate
  of <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>> in practice. (This is
  completely analogous to the behaviour of the periodogram in classical
  spectral analysis.) However, to reduce sampling fluctuations we may
  \Psmooth\Q the values of <math|<around|\||U<rsub|t>|\|><rsup|2>> for
  neighbouring values of <math|t>. In so doing, we increase the precision of
  our estimates by sacrificing some degree of resolvability in the time
  domain.

  We, therefore, consider a weight-function
  <math|W<rsub|T<rprime|'>><around|(|t|)>>, depending on the parameter
  <math|T<rprime|'>>, which satisfies

  <\enumerate>
    <item><math|W<rsub|T<rprime|'>><around|(|t|)>\<geqslant\>0>, \<forall\>
    <math|t,T<rprime|'>>

    <item><math|W<rsub|T<rprime|'>><around|(|t|)>> decays to zero as
    <math|<around|\||t|\|>\<rightarrow\>\<infty\>>, \<forall\>
    <math|T<rprime|'>>

    <item><math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|t|)>*d*t=1>,
    \<forall\> <math|T<rprime|'>>

    <item><math|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|{|W<rsub|T<rprime|'>><around|(|t|)>|}><rsup|2>*d*t\<less\>\<infty\>>,
    \<forall\> <math|T<rprime|'>>
  </enumerate>

  Write

  <\equation>
    <label|eq:est_weight_transform>W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*t>*W<rsub|T<rprime|'>><around|(|t|)>*d*t
  </equation>

  We assume that there exists a constant <math|C> such that

  <\enumerate>
    <item><math|lim<rsub|T<rprime|'>\<rightarrow\>\<infty\>><around|{|T<rprime|'>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<lambda\>|)>|\|><rsup|2>*d*\<lambda\>|}>=C>
  </enumerate>

  Now let

  <\equation>
    <label|eq:est_smoothed>V<rsub|t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|u|)><around|\||U<rsub|t-u>|\|><rsup|2>*d*u
  </equation>

  Again, we assume that <math|W<rsub|T<rprime|'>><around|(|u|)>> decays
  sufficiently fast so that the above integral may be evaluated from a finite
  length of <math|<around|\||U<rsub|t>|\|><rsup|2>>. It follows from
  <eqref|eq:est_energy> that

  <\equation>
    <tabular|<tformat|<table|<row|<cell|E<around|(|V<rsub|t>|)>>|<cell|\<sim\><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|u|)>*f<rsub|t-u>*<around|(|\<omega\>+\<omega\><rsub|0>|)><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*u*d*\<omega\>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f<rsub|t>|\<bar\>><around|(|\<omega\>+\<omega\><rsub|0>|)><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>>>>>><label|eq:est_smoothed_energy>
  </equation>

  where

  <\equation>
    <label|eq:est_smoothed_spectrum><wide|f|\<bar\>><rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>><around|(|u|)>*f<rsub|t-u>*<around|(|\<omega\>+\<omega\><rsub|0>|)>*d*u
  </equation>

  From <eqref|eq:est_smoothed_energy> we see that
  <math|E<around|(|V<rsub|t>|)>> is a \Psmoothed\Q form of
  <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>>, smoothed over both time and
  frequency. If, as before, we assume that
  <math|f<rsub|t><around|(|\<omega\>|)>> is \Pflat\Q compared with
  <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>> (each
  <math|t>), then <eqref|eq:est_smoothed_energy> may be written

  <\equation>
    <label|eq:est_smoothed_approx>E<around|(|V<rsub|t>|)>\<sim\><wide|f|\<bar\>><rsub|t><around|(|\<omega\><rsub|0>|)>
  </equation>

  so that <math|V<rsub|t>> is an (approximately) unbiased estimate of the
  (weighted) average value of <math|f<rsub|t><around|(|\<omega\><rsub|0>|)>>
  in the neighbourhood of the time-instant <math|t>.

  An investigation of the sampling properties of <math|V<rsub|t>> is
  straightforward, if lengthy, and we merely summarize here the main result.
  (A derivation of equations <eqref|eq:est_variance> and
  <eqref|eq:est_variance_smoothed> together with a discussion of certain
  \Pdesign relations\Q will be presented elsewhere.) Assuming that
  <math|<around|{|<around|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>/T<rprime|'>|}>>
  is a pseudo <math|\<delta\>>-function with respect to
  <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>, i.e. that
  the \Pwidth\Q of <math|<around|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>>
  is much smaller than the \Pwidth\Q of <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>,
  i.e. that the \Pwidth\Q of <math|W<rsub|T<rprime|'>><around|(|t|)>> is much
  larger than <math|B<rsub|g>>, we may show that

  <\equation>
    <label|eq:est_variance_smoothed><math-up|var><around|(|V<rsub|t>|)>\<sim\><around|{|<wide|f<rsub|t><rsup|2>|~><around|(|\<omega\><rsub|0>|)>|}><rsup|2><around|{|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>|}><around|{|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|4>*d*\<omega\>|}>*<around|(|1+\<delta\><rsub|0,\<omega\><rsub|0>>|)>
  </equation>

  where

  <\equation>
    <label|eq:est_smoothed_variance><wide|f<rsub|t><rsup|2>|~><around|(|\<omega\><rsub|0>|)>=<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsub|t-u><around|(|\<omega\><rsub|0>|)><around|{|W<rsub|T<rprime|'>><around|(|u|)>|}><rsup|2>*d*u|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|{|W<rsub|T<rprime|'>><around|(|u|)>|}><rsup|2>*d*u>
  </equation>

  For large <math|T<rprime|'>>, we obtain from
  <eqref|eq:est_variance_smoothed> and condition (e),

  <\equation>
    <label|eq:est_variance_asymptotic><math-up|var><around|(|V<rsub|t>|)>\<sim\><frac|<around|{|<wide|f<rsub|t><rsup|2>|~><around|(|\<omega\><rsub|0>|)>|}>*C|T<rprime|'>><around*|{|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|4>*d*\<omega\>|}>*<around|(|1+\<delta\><rsub|0,\<omega\><rsub|0>>|)>
  </equation>

  Thus the sampling fluctuations of <math|<around|(|V<rsub|t>|)>> are of
  <math|O<around|(|1/<sqrt|T<rprime|'>>|)>>.

  The discussion so far has been in terms of a general filter
  <math|<around|{|g<around|(|u|)>|}>> and a general weight function
  <math|<around|{|W<rsub|T<rprime|'>><around|(|t|)>|}>>. In practice, we must
  choose a particular form for each of these functions. As far as the form of
  <math|<around|{|g<around|(|u|)>|}>> is concerned, we may make use of any of
  the standard \Pwindows\Q used in spectral analysis of stationary
  processes-remembering that <math|<around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>>
  (and not <math|\<Gamma\><around|(|\<omega\>|)>>) corresponds to the
  spectral window. For example, if we choose

  <\equation>
    <label|eq:est_bartlett_filter>g<around|(|u|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1/2*<sqrt|<around|(|h*\<pi\>|)>>>|<cell|<around|(|<around|\||u|\|>\<leqslant\>h|)>>>|<row|<cell|0>|<cell|<around|(|<around|\||u|\|>\<gtr\>h|)>>>>>>|\<nobracket\>>
  </equation>

  then

  <\equation>
    <label|eq:est_bartlett_window><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>=<frac|1|2*\<pi\>>*<frac|sin<rsup|2>
    h*\<omega\>|h*\<omega\><rsup|2>>
  </equation>

  corresponding to the Bartlett window. The weight function
  <math|<around|{|W<rsub|T<rprime|'>><around|(|t|)>|}>> may also be chosen
  from the customary collection of \Pwindows\Q, with the time and frequency
  domains interchanged.

  For example, we may choose

  <\equation>
    <label|eq:est_daniell_filter>W<rsub|T<rprime|'>><around|(|t|)>=<choice|<tformat|<table|<row|<cell|1/T<rprime|'>>|<cell|<around*|(|-<frac|1|2>*T<rprime|'>\<leqslant\>t\<leqslant\><frac|1|2>*T<rprime|'>|)>>>|<row|<cell|0>|<cell|<text|otherwise
    >>>>>>
  </equation>

  (corresponding to the Daniell window), so that

  <\equation>
    <label|eq:est_daniell_window>W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<lambda\>|)>=<frac|sin
    <around*|(|<frac|1|2>*T<rprime|'>*\<lambda\>|)>|<frac|1|2>*T<rprime|'>*\<lambda\>>
  </equation>

  and

  <\equation>
    <label|eq:est_daniell_constant>lim<rsub|T<rprime|'>\<rightarrow\>\<infty\>><around*|{|T<rprime|'>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<lambda\>|)>|\|><rsup|2>*d*\<lambda\>|}>=2*\<pi\>
  </equation>

  Alternatively, we may choose

  <\equation>
    <label|eq:est_exp_filter>W<rsub|T<rprime|'>><around|(|t|)>=<choice|<tformat|<table|<row|<cell|<around|(|T<rprime|'>|)><rsup|-1>*e<rsup|-t/T<rprime|'>>>|<cell|<around|(|t\<gtr\>0|)>>>|<row|<cell|0>|<cell|<around|(|t\<less\>0|)>>>>>>
  </equation>

  then

  <\equation>
    <label|eq:est_exp_window>W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<lambda\>|)>=<frac|1|1+i*\<lambda\>*T<rprime|'>>
  </equation>

  and

  <\equation>
    <label|eq:est_exp_constant>lim<rsub|T<rprime|'>\<rightarrow\>\<infty\>><around*|{|T<rprime|'>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<lambda\>|)>|\|><rsup|2>*d*\<lambda\>|}>=\<pi\>
  </equation>

  With <math|<around|{|g<around|(|u|)>|}>> given by
  <eqref|eq:est_bartlett_filter>, and <math|W<rsub|T<rprime|'>><around|(|t|)>>
  by <eqref|eq:est_daniell_filter>, we find (for
  <math|\<omega\><rsub|0>\<neq\>0>),

  <\equation>
    <label|eq:est_variance_bartlett_daniell><frac|<math-up|var><around|(|V<rsub|t>|)>|<wide|f<rsub|t><rsup|2>|~><around|(|\<omega\><rsub|0>|)>>\<sim\><frac|2*\<pi\>|T<rprime|'>><around*|{|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|4>*d*\<omega\>|}>=<frac|4*\<pi\>*h|3*T<rprime|'>>
  </equation>

  while for <math|<around|{|g<around|(|u|)>|}>> given by
  <eqref|eq:est_bartlett_filter>, and <math|W<rsub|T<rprime|'>><around|(|t|)>>
  by <eqref|eq:est_exp_filter>, we find

  <\equation>
    <label|eq:est_variance_bartlett_exp><frac|<math-up|var><around|(|V<rsub|t>|)>|<wide|f<rsub|t><rsup|2>|~><around|(|\<omega\><rsub|0>|)>>\<sim\><frac|\<pi\>|T<rprime|'>><around*|{|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|4>*d*\<omega\>|}>=<frac|2*\<pi\>*h|3*T<rprime|'>>
  </equation>

  Thus, with the same value of <math|T<rprime|'>>, the estimate corresponding
  to the weight function <eqref|eq:est_daniell_filter> has a variance twice
  as large as that corresponding to <eqref|eq:est_exp_filter>.

  <section*|10. Discrete Parameter Processes>

  A spectral theory for discrete-parameter non-stationary processes may be
  developed in exactly the same way as that for continuous-parameter
  processes. Thus, an oscillatory discrete-parameter process will have a
  representation of the form

  <\equation>
    <label|eq:discrete_rep>X<rsub|t>=<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|i*t*\<omega\>>*A<rsub|t><around|(|\<omega\>|)>*d*Z<around|(|\<omega\>|)><space|1em><around|(|t=0,\<pm\>1,\<pm\>2,\<ldots\>|)>
  </equation>

  where, for each <math|\<omega\>>, the sequence
  <math|<around|{|A<rsub|t><around|(|\<omega\>|)>|}>> has a generalized
  Fourier transform whose modulus has an absolute maximum at the origin, and
  <math|Z<around|(|\<omega\>|)>> is an orthogonal process on the interval
  <math|<around|(|-\<pi\>,\<pi\>|)>>, with
  <math|E*<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>>.
  (In view of the factor <math|e<rsup|i*t*\<omega\>>> in the integrand in
  <eqref|eq:discrete_rep>, there is no loss of generality in taking the
  limits to be <math|<around|(|-\<pi\>,\<pi\>|)>>.)

  The evolutionary spectrum at time <math|t> (with respect to the family of
  sequences <math|<with|math-font|cal*|F>\<equiv\><around|{|e<rsup|i*t*\<omega\>>*A<rsub|t><around|(|\<omega\>|)>|}>>)
  is defined as

  <\equation>
    <label|eq:discrete_spectrum>d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>*<space|1em><around|(|-\<pi\>\<leqslant\>\<omega\>\<leqslant\>\<pi\>|)>.
  </equation>

  The evolutionary spectral density function
  <math|f<rsub|t><around|(|\<omega\>|)>> (with respect to the family with
  maximum characteristic width) may be estimated by the method described in
  the previous Section, except that the function
  <math|<around|{|g<around|(|u|)>|}>> is replaced by a sequence
  <math|<around|{|g<rsub|u>|}>> and the weight function
  <math|W<rsub|T<rprime|'>><around|(|t|)>> by a sequence
  <math|<around|{|W<rsub|T<rprime|'>,t>|}>>. Thus we write

  <\equation>
    <tabular|<tformat|<table|<row|<cell|U<rsub|t>>|<cell|=<big|sum><rsub|u=-\<infty\>><rsup|\<infty\>>g<rsub|u>*X<rsub|t-u>*e<rsup|-i*\<omega\><rsub|0>*<around|(|t-u|)>>>>|<row|<cell|V<rsub|t>>|<cell|=<big|sum><rsub|v=-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>,v><around|\||U<rsub|t-v>|\|><rsup|2>>>>>><label|eq:discrete_filter_output>
  </equation>

  <\equation>
    \;
  </equation>

  and it may be shown that

  <\equation>
    <label|eq:discrete_expected_energy>E<around|(|V<rsub|t>|)>\<sim\><big|int><rsub|-\<pi\>><rsup|\<pi\>><wide|f|\<bar\>><rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>
  </equation>

  where

  <\equation>
    <label|eq:discrete_smoothed_spectrum><wide|f|\<bar\>><rsub|t>*<around|(|\<omega\>+\<omega\><rsub|0>|)>=<big|sum><rsub|v=-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>,v>*f<rsub|t-v>*<around|(|\<omega\>+\<omega\><rsub|0>|)>
  </equation>

  and

  <\equation>
    <label|eq:discrete_transfer>\<Gamma\><around|(|\<omega\>|)>=<big|sum><rsub|u=-\<infty\>><rsup|\<infty\>>g<rsub|u>*e<rsup|-i*u*\<omega\>>
  </equation>

  We may also show that

  <\equation>
    <label|eq:discrete_variance><math-up|var><around|(|V<rsub|t>|)>\<sim\><around|{|<wide|f<rsub|t><rsup|2>|~><around|(|\<omega\><rsub|0>|)>|}><rsup|2><around|{|<big|int><rsub|-\<pi\>><rsup|\<pi\>><around|\||W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>|}><around|{|<big|int><rsub|-\<pi\>><rsup|\<pi\>><around|\||\<Gamma\><around|(|\<omega\>|)>|\|><rsup|4>*d*\<omega\>|}>*<around|(|1+\<delta\><rsub|0,\<omega\><rsub|0>>|)>
  </equation>

  where

  <\equation>
    <label|eq:discrete_variance_numerator><wide|f<rsub|t><rsup|2>|~><around|(|\<omega\><rsub|0>|)>=<frac|<big|sum><rsub|v=-\<infty\>><rsup|\<infty\>>f<rsub|t-v><around|(|\<omega\><rsub|0>|)><around|(|W<rsub|T<rprime|'>,v>|)><rsup|2>|<big|sum><rsub|v=-\<infty\>><rsup|\<infty\>><around|(|W<rsub|T<rprime|'>,v>|)><rsup|2>>
  </equation>

  and

  <\equation>
    <label|eq:discrete_weight_fourier>W<rsub|T<rprime|'>><rsup|\<ast\>><around|(|\<omega\>|)>=<big|sum><rsub|v=-\<infty\>><rsup|\<infty\>>W<rsub|T<rprime|'>,v>*e<rsup|i*v*\<omega\>>
  </equation>

  <section*|11. Further Problems>

  In designing an evolutionary spectral analysis, we must decide on the
  choice of the following quantities:

  <\enumerate>
    <item>the functional form of the filter
    <math|<around|{|g<around|(|u|)>|}>>,

    <item>the functional form of the weight function
    <math|W<rsub|T<rprime|'>><around|(|t|)>>,

    <item>the width, <math|B<rsub|g>>, of
    <math|<around|{|g<around|(|u|)>|}>>,

    <item>the parameter <math|T<rprime|'>> of
    <math|<around|{|W<rsub|T<rprime|'>><around|(|t|)>|}>>.
  </enumerate>

  The problem of choosing (1) and (3) occurs also in classical spectral
  analysis, and even in this case it is well known that the "optimum" choice
  depends on which criterion of optimality one adopts. For example, for a
  fixed record length we may choose that filter which minimizes

  <\enumerate>
    <item>the mean square error of the estimate at a particular frequency, or

    <item>the integrated mean square error (over frequency), or

    <item>the maximum mean square error (over frequency).
  </enumerate>

  On the other hand, if we are able to observe the process over an
  arbitrarily long interval, we may fix the value of, say, the mean square
  error at a particular frequency, and choose that filter which requires the
  shortest record length to provide estimates with the prescribed error. So
  far, the only problem which has been satisfactorily solved is the optimum
  choice of filter under criterion (b) (Lomnicki and Zaremba, 1957). Now,
  when dealing with the estimation of evolutionary spectra, there is clearly
  a multitude of various criteria to consider, since the spectrum is now a
  function of both frequency and time. In this case it is doubtful whether an
  analytic approach would prove very useful in determining optimum designs,
  and an empirical approach via artificially generated processes may be the
  most rewarding.

  Another problem which arises is that of testing whether the process which
  we are sampling can be regarded as stationary. One form of test is
  suggested by an analogy with analysis of variance methods. Thus, if we
  assume that the process is, in fact, stationary, we would estimate its
  spectral density function by

  <\equation>
    <label|eq:stationary_estimate><wide|f|^><rsub|s><around|(|\<omega\>|)>=<frac|1|T>*<big|int><rsub|0><rsup|T><around|\||U<rsub|t>|\|><rsup|2>*d*t
  </equation>

  corresponding to

  <\equation>
    <label|eq:stationary_window>W<rsub|T<rprime|'>><around|(|t|)>=<choice|<tformat|<table|<row|<cell|1/T<rprime|'>>|<cell|<around|(|0\<leqslant\>t\<leqslant\>T<rprime|'>|)>>>|<row|<cell|0>|<cell|<text|otherwise
    >>>>>>
  </equation>

  with <math|T<rprime|'>\<equiv\>T>. If <math|<wide|f<rsub|t>|^><around|(|\<omega\>|)>>
  denotes an estimate of the evolutionary spectral density function at time
  <math|t>, it seems reasonable to base a test of stationarity on the
  function

  <\equation>
    <label|eq:stationarity_test>\<Psi\><around|(|\<omega\>|)>=<big|int><rsub|0><rsup|T><around|{|<wide|f|^><rsub|t><around|(|\<omega\>|)>-<wide|f|^><rsub|s><around|(|\<omega\>|)>|}><rsup|2>*d*t
  </equation>

  <section*|References>

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
    <associate|page-even-footer|<htab|5mm><math|>page
    <page-the-page><htab|5mm>>
    <associate|page-even-header|<htab|5mm>Evolutionary Spectra and
    Non-Stationary Processes>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-odd-footer|<htab|5mm>page <page-the-page><htab|5mm>>
    <associate|page-odd-header|<htab|5mm>Evolutionary Spectra and
    Non-Stationary Processes>
    <associate|page-screen-margin|false>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|2>>
    <associate|auto-10|<tuple|112|24>>
    <associate|auto-11|<tuple|122|25>>
    <associate|auto-12|<tuple|125|26>>
    <associate|auto-13|<tuple|125|26>>
    <associate|auto-2|<tuple|4|3>>
    <associate|auto-3|<tuple|10|4>>
    <associate|auto-4|<tuple|20|6>>
    <associate|auto-5|<tuple|28|8>>
    <associate|auto-6|<tuple|33|9>>
    <associate|auto-7|<tuple|44|11>>
    <associate|auto-8|<tuple|59|14>>
    <associate|auto-9|<tuple|84|18>>
    <associate|bib-bartlett1955|<tuple|bartlett1955|26>>
    <associate|bib-cramer1960|<tuple|cramer1960|26>>
    <associate|bib-grenander1957|<tuple|grenander1957|26>>
    <associate|bib-herbst1963a|<tuple|herbst1963a|26>>
    <associate|bib-herbst1963b|<tuple|herbst1963b|26>>
    <associate|bib-herbst1963c|<tuple|herbst1963c|26>>
    <associate|bib-jowett1957|<tuple|jowett1957|26>>
    <associate|bib-lomnicki1957|<tuple|lomnicki1957|26>>
    <associate|bib-page1952|<tuple|page1952|26>>
    <associate|bib-priestley1962|<tuple|priestley1962|26>>
    <associate|def:evol_spectrum|<tuple|3|7>>
    <associate|def:oscillatory_function|<tuple|1|6>>
    <associate|def:oscillatory_process|<tuple|2|6>>
    <associate|def:pseudo_delta|<tuple|6|12>>
    <associate|def:semi_stationary_family|<tuple|4|11>>
    <associate|def:semi_stationary_process|<tuple|5|11>>
    <associate|eq:amplitude_modulated|<tuple|16|5>>
    <associate|eq:approximate_rep|<tuple|42|10>>
    <associate|eq:approximate_transfer|<tuple|41|10>>
    <associate|eq:autocovariance|<tuple|11|4>>
    <associate|eq:avg_spectrum|<tuple|82|17>>
    <associate|eq:characteristic_width|<tuple|46|11>>
    <associate|eq:complex_exp|<tuple|15|5>>
    <associate|eq:covar_representation|<tuple|12|4>>
    <associate|eq:covar_representation2|<tuple|18|6>>
    <associate|eq:covariance|<tuple|1|2>>
    <associate|eq:delta_filter|<tuple|77|16>>
    <associate|eq:det_evol_approx1|<tuple|63|14>>
    <associate|eq:det_evol_approx2|<tuple|64|14>>
    <associate|eq:det_evol_approx3|<tuple|65|15>>
    <associate|eq:det_evol_energy|<tuple|62|14>>
    <associate|eq:det_evol_error_bound1|<tuple|67|15>>
    <associate|eq:det_evol_error_bound2|<tuple|68|15>>
    <associate|eq:det_evol_error_terms|<tuple|66|15>>
    <associate|eq:det_evol_integral_split|<tuple|70|15>>
    <associate|eq:det_evol_normalized|<tuple|71|15>>
    <associate|eq:det_evol_rep|<tuple|61|14>>
    <associate|eq:det_evol_set|<tuple|69|15>>
    <associate|eq:det_evol_spectrum|<tuple|72|15>>
    <associate|eq:det_evol_transform|<tuple|60|14>>
    <associate|eq:discrete_expected_energy|<tuple|117|24>>
    <associate|eq:discrete_filter_output|<tuple|115|24>>
    <associate|eq:discrete_rep|<tuple|113|24>>
    <associate|eq:discrete_smoothed_spectrum|<tuple|118|25>>
    <associate|eq:discrete_spectrum|<tuple|114|24>>
    <associate|eq:discrete_transfer|<tuple|119|25>>
    <associate|eq:discrete_variance|<tuple|120|25>>
    <associate|eq:discrete_variance_numerator|<tuple|121|25>>
    <associate|eq:discrete_weight_fourier|<tuple|122|25>>
    <associate|eq:est_approx|<tuple|87|19>>
    <associate|eq:est_bartlett_filter|<tuple|103|22>>
    <associate|eq:est_bartlett_window|<tuple|104|23>>
    <associate|eq:est_daniell_constant|<tuple|107|23>>
    <associate|eq:est_daniell_filter|<tuple|105|23>>
    <associate|eq:est_daniell_window|<tuple|106|23>>
    <associate|eq:est_energy|<tuple|86|19>>
    <associate|eq:est_exp_constant|<tuple|110|23>>
    <associate|eq:est_exp_filter|<tuple|108|23>>
    <associate|eq:est_exp_window|<tuple|109|23>>
    <associate|eq:est_filter_output|<tuple|85|19>>
    <associate|eq:est_normalization|<tuple|88|19>>
    <associate|eq:est_smoothed|<tuple|96|21>>
    <associate|eq:est_smoothed_approx|<tuple|94|22>>
    <associate|eq:est_smoothed_energy|<tuple|97|21>>
    <associate|eq:est_smoothed_spectrum|<tuple|98|22>>
    <associate|eq:est_smoothed_variance|<tuple|101|22>>
    <associate|eq:est_variance|<tuple|89|19>>
    <associate|eq:est_variance_asymptotic|<tuple|102|22>>
    <associate|eq:est_variance_bartlett_daniell|<tuple|111|23>>
    <associate|eq:est_variance_bartlett_exp|<tuple|112|24>>
    <associate|eq:est_variance_smoothed|<tuple|100|22>>
    <associate|eq:est_weight_transform|<tuple|95|21>>
    <associate|eq:evol_spectrum|<tuple|22|7>>
    <associate|eq:exact_energy|<tuple|76|16>>
    <associate|eq:filter_fourier|<tuple|26|8>>
    <associate|eq:filter_normalization|<tuple|50|12>>
    <associate|eq:filter_representation|<tuple|27|8>>
    <associate|eq:filter_spectrum|<tuple|35|9>>
    <associate|eq:filter_transform|<tuple|34|9>>
    <associate|eq:filter_width|<tuple|51|12>>
    <associate|eq:generalized_transfer|<tuple|39|10>>
    <associate|eq:generalized_transform|<tuple|37|10>>
    <associate|eq:inf_width_G|<tuple|81|17>>
    <associate|eq:inf_width_energy|<tuple|80|17>>
    <associate|eq:inf_width_filter1|<tuple|78|17>>
    <associate|eq:inf_width_filter2|<tuple|79|17>>
    <associate|eq:integral_spectrum|<tuple|23|7>>
    <associate|eq:integrated_spectrum|<tuple|5|3>>
    <associate|eq:lemma_proof1|<tuple|52|13>>
    <associate|eq:lemma_proof2|<tuple|53|13>>
    <associate|eq:lemma_proof3|<tuple|54|13>>
    <associate|eq:modulated_ratio|<tuple|33|9>>
    <associate|eq:modulated_rep|<tuple|31|9>>
    <associate|eq:modulated_spectrum|<tuple|32|9>>
    <associate|eq:modulating_function|<tuple|17|6>>
    <associate|eq:optimal_representation|<tuple|48|12>>
    <associate|eq:orthogonal_process|<tuple|14|5>>
    <associate|eq:oscillatory_functions|<tuple|20|6>>
    <associate|eq:page_spectrum1|<tuple|6|3>>
    <associate|eq:page_spectrum2|<tuple|7|3>>
    <associate|eq:page_spectrum3|<tuple|8|3>>
    <associate|eq:page_spectrum4|<tuple|9|4>>
    <associate|eq:page_spectrum5|<tuple|10|4>>
    <associate|eq:piecewise_stat|<tuple|4|2>>
    <associate|eq:process_rep|<tuple|3|2>>
    <associate|eq:process_rep2|<tuple|13|5>>
    <associate|eq:process_rep3|<tuple|19|6>>
    <associate|eq:process_width|<tuple|47|12>>
    <associate|eq:pseudo_delta|<tuple|49|12>>
    <associate|eq:smoothed_spectrum|<tuple|83|18>>
    <associate|eq:smoothed_spectrum_approx|<tuple|84|18>>
    <associate|eq:spectral_rep|<tuple|2|2>>
    <associate|eq:spectrum_density|<tuple|74|16>>
    <associate|eq:spectrum_density_est|<tuple|75|16>>
    <associate|eq:spectrum_estimation|<tuple|73|16>>
    <associate|eq:standardize|<tuple|24|7>>
    <associate|eq:stationarity_test|<tuple|125|26>>
    <associate|eq:stationary_estimate|<tuple|123|26>>
    <associate|eq:stationary_process|<tuple|28|8>>
    <associate|eq:stationary_rep|<tuple|30|8>>
    <associate|eq:stationary_window|<tuple|124|26>>
    <associate|eq:theorem_proof1|<tuple|56|13>>
    <associate|eq:theorem_proof2|<tuple|57|13>>
    <associate|eq:theorem_proof3|<tuple|58|14>>
    <associate|eq:theorem_proof4|<tuple|59|14>>
    <associate|eq:total_energy|<tuple|21|7>>
    <associate|eq:transfer_approx|<tuple|55|13>>
    <associate|eq:transfer_function|<tuple|36|9>>
    <associate|eq:transformed_phi|<tuple|40|10>>
    <associate|eq:transformed_rep|<tuple|38|10>>
    <associate|eq:transformed_spectrum|<tuple|44|11>>
    <associate|eq:transformed_z|<tuple|43|10>>
    <associate|eq:uniform_modulated|<tuple|29|8>>
    <associate|eq:unit_integral|<tuple|25|7>>
    <associate|eq:width_function|<tuple|45|11>>
    <associate|lemma:pseudo_delta|<tuple|7|13>>
    <associate|thm:spectrum_estimation|<tuple|9|16>>
    <associate|thm:transfer_approx|<tuple|8|13>>
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

      herbst1963a

      herbst1963b

      herbst1963c
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5.
      The Uniformly Modulated Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6.
      Effect of Filters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7.
      Semi-stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8.
      Determination of Evolutionary Spectra>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9.
      Estimation of Evolutionary Spectra>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10.
      Discrete Parameter Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|11.
      Further Problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>