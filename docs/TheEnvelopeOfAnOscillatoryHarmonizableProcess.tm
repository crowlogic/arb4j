<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Envelope of an Oscillatory Harmonizable
  Process>|<doc-author|<author-data|<author-name|Randall J.
  Swift>|<\author-affiliation>
    Department of Mathematics

    Western Kentucky University

    Bowling Green, KY 42101, U.S.A.
  </author-affiliation>>>|<doc-date|>>

  <abstract-data|<\abstract>
    In 1965, Priestley introduced the class of oscillatory processes and the
    concept of their evolutionary spectrum as a tool for the frequency
    analysis of these processes. In 1979, Hasofer showed that the envelope of
    an oscillatory process does not have a unique representation. Recently,
    <cite|Swift1997a> introduced the class of oscillatory harmonizable
    processes as an extension of Priestley's oscillatory class. In this
    paper, a unique representation for the envelope of a subclass of
    oscillatory harmonizable processes is obtained.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Setting> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Envelope
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgments>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  A class of nonstationary stochastic processes encountered in some
  applications is the class of modulated stationary processes
  <math|X<around|(|t|)>>. These processes are obtained when a stationary
  process <math|X<rsub|0><around|(|t|)>> is multiplied by some nonrandom
  modulating function <math|A<around|(|t|)>>:

  <\equation>
    X<around|(|t|)>=A<around|(|t|)>*X<rsub|0><around|(|t|)><label|eq:modulated>
  </equation>

  In particular, if <math|A<around|(|t|)>> admits a generalized Fourier
  transform, the class of oscillatory processes, studied by
  <cite|Priestley1965>, is obtained. In some physical situations, the
  assumption of stationarity for the process <math|X<rsub|0><around|(|t|)>>
  is unrealistic. If this condition is relaxed, and
  <math|X<rsub|0><around|(|t|)>> is assumed to be harmonizable and if
  <math|A<around|(|t|)>> admits a generalized Fourier transform, the process
  <math|X<around|(|t|)>> is not oscillatory, but is <em|oscillatory
  harmonizable>.

  In 1978, <cite|HasoferPetocz1978> described a method for obtaining an
  envelope process for the class of oscillatory processes. The approach of
  that paper parallels that of <cite|Arens1957> and <cite|Yang1972> in that
  similar definitions of envelope processes are given. Hasofer defines the
  envelope process for the class of oscillatory processes and uses them to
  obtain some properties of the process' upcrossings. These properties are
  useful for solving certain nonlinear filtering problems.

  In a later paper, <cite|Hasofer1979> constructs an example of an
  oscillatory process without a unique envelope representation and shows that
  under certain natural restrictions a representation of a unique envelope
  process exists.

  Recently, <cite|Swift1997a|Swift1997b|SwiftToAppear> extended Priestley's
  class of oscillatory processes by the introduction and analysis of the
  class of oscillatory harmonizable processes. In this note, the uniqueness
  of the envelope of an oscillatory harmonizable process is considered.

  <section|The Setting>

  In the following work, the probability space
  <math|<around|(|\<Omega\>,\<Sigma\>,P|)>> is always present, whether this
  is explicitly stated or not. To introduce the desired class of random
  functions, recall that if a process <math|X:\<bbb-R\>\<to\>L<rsup|2><around|(|P|)>>
  is stationary then it can be expressed as:

  <\equation>
    X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:stationary>
  </equation>

  where <math|Z<around|(|\<cdummy\>|)>> is a <math|\<sigma\>>-additive
  stochastic measure on the Borel sets <math|\<cal-B\>> of <math|\<bbb-R\>>,
  with orthogonal values in the complex Hilbert space
  <math|L<rsup|2><around|(|P|)>> of centered random variables. The covariance
  <math|r<around|(|\<cdummy\>,\<cdummy\>|)>> of the process is

  <\equation>
    r<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*<around|(|s-t|)>*\<lambda\>>*<space|0.17em>d*F<around|(|\<lambda\>|)><label|eq:stationary_cov>
  </equation>

  where

  <\equation>
    \<bbb-E\><around|(|Z<around|(|A|)>*Z<around|(|B|)>|)>=F*<around|(|A\<cap\>B|\<nobracket\>>
  </equation>

  is a bounded Borel measure on <math|\<bbb-R\>>. A generalization of the
  concept of stationarity which retains the powerful tools of Fourier
  analysis is given by processes <math|X:\<bbb-R\>\<to\>L<rsup|2><around|(|P|)>>
  with covariance <math|r<around|(|\<cdummy\>,\<cdummy\>|)>> expressible as

  <\equation>
    r<around|(|s,t|)>=<big|iint><rsub|\<bbb-R\>\<times\>\<bbb-R\>>e<rsup|i*s*\<lambda\>-i*t*\<lambda\><rprime|'>>*<space|0.17em>d*F<around|(|\<lambda\>,\<lambda\><rprime|'>|)><label|eq:harmonizable_cov>
  </equation>

  where <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> is a complex bimeasure,
  called the spectral bimeasure of the process, of bounded variation in the
  Vitali's sense or more inclusively in Fréchet's sense; in which case the
  integrals are strict Morse-Transue (cf. <cite|Rao1984>). The covariance as
  well as the process are termed strongly or weakly harmonizable
  respectively. Every weakly or strongly harmonizable process
  <math|X:\<bbb-R\>\<to\>L<rsup|2><around|(|P|)>> has an integral
  representation given by <eqref|eq:stationary>, where
  <math|Z:\<cal-B\>\<to\>L<rsup|2><around|(|P|)>> is a stochastic measure
  (not necessarily with orthogonal values) and is called the spectral measure
  of the process. Both of these concepts reduce to the stationary case if
  <math|F> concentrates on the diagonal <math|\<lambda\>=\<lambda\><rprime|'>>
  of <math|\<bbb-R\>\<times\>\<bbb-R\>>.

  The structure and properties of harmonizable processes have been
  investigated and developed extensively by M.<nbsp>M.<nbsp>Rao and others. A
  recent account of the development of harmonizable processes and some of
  their applications may be found in <cite|Swift1997b>. That paper also
  contains a detailed bibliography of the existing work on harmonizable
  processes.

  An interesting and useful generalization to the class of weakly
  harmonizable processes was recently given by <cite|Swift1997a>, who gave
  the following definition.

  <\definition>
    [Oscillatory Weakly Harmonizable Process]<label|def:osc_weak_harm> A
    stochastic process <math|X:\<bbb-R\>\<to\>L<rsup|2><around|(|P|)>> is
    <em|oscillatory weakly harmonizable> if its covariance has representation

    <\equation>
      r<around|(|s,t|)>=<big|iint><rsub|\<bbb-R\>\<times\>\<bbb-R\>>A<around|(|s,\<lambda\>|)>*A<around|(|t,\<lambda\><rprime|'>|)>*e<rsup|i*<around|(|s*\<lambda\>-t*\<lambda\><rprime|'>|)>>*<space|0.17em>d*F<around|(|\<lambda\>,\<lambda\><rprime|'>|)><label|eq:osc_harm_cov>
    </equation>

    where <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> is a function of bounded
    Fréchet variation, and

    <\equation>
      A<around|(|t,\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*H<around|(|t,d*x|)><label|eq:a_representation>
    </equation>

    with <math|H<around|(|t,B|)>> a Borel function on <math|\<bbb-R\>>,
    <math|H<around|(|t,\<cdot\>|)>> a signed measure and
    <math|A<around|(|t,\<lambda\>|)>> having an absolute maximum at
    <math|\<lambda\>=0> independent of <math|t>.
  </definition>

  Note that if <math|A<around|(|t,\<lambda\>|)>=1>, this class coincides with
  the weakly harmonizable class of processes.

  Oscillatory harmonizable processes are also an extension of a class of
  processes introduced by <cite|Priestley1965>. Priestley introduced and
  studied a generalization of the class of stationary processes. Priestley
  defined a process as oscillatory if it has representation

  <\equation>
    X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:priestley_rep>
  </equation>

  where <math|Z<around|(|\<cdummy\>|)>> is a stochastic measure with
  orthogonal increments and <math|A<around|(|t,\<lambda\>|)>> satisfies
  <eqref|eq:a_representation>. Using this representation, the covariance of
  an oscillatory process is

  <\equation>
    r<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|s,\<lambda\>|)>*A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*<around|(|s-t|)>>*<space|0.17em>d*G<around|(|\<lambda\>|)><label|eq:osc_cov>
  </equation>

  so that in the same fashion as Priestley's oscillatory processes extend the
  class of stationary processes, the oscillatory weakly harmonizable
  processes extend the weakly harmonizable class.

  Observe that the oscillatory harmonizable class extends the oscillatory
  class. To see this, note that if <math|F<around|(|\<cdummy\>,\<cdummy\>|)>>,
  the spectral bimeasure of a oscillatory weakly harmonizable process
  concentrates on the diagonal <math|\<lambda\>=\<lambda\><rprime|'>>, the
  oscillatory processes are obtained. To emphasize this distinction, we will
  refer to Priestley's class as the oscillatory stationary class.

  Using the definition of a oscillatory harmonizable process and a version of
  Karhunen's theorem, <cite|Swift1997a> obtained the spectral representation
  of an oscillatory harmonizable process as

  <\equation>
    X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:osc_harm_rep>
  </equation>

  where <math|Z<around|(|\<cdummy\>|)>> is a stochastic measure satisfying

  <\equation>
    \<bbb-E\>*<around|(|Z<around|(|B<rsub|1>|)>*Z<around|(|B<rsub|2>|)>|)>=F<around|(|B<rsub|1>,B<rsub|2>|)><label|eq:z_expectation>
  </equation>

  with <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> a function of bounded
  Fréchet variation.

  <section|Envelope Processes>

  Consider a weakly harmonizable process <math|X<around|(|\<cdummy\>|)>> with
  spectral representation

  <\equation>
    X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:weak_harm_rep>
  </equation>

  with <math|Z<around|(|\<cdummy\>|)>> having no jumps a.e. at the origin.
  Then the Hilbert transform <math|<wide|X|~><around|(|\<cdummy\>|)>>, (cf.,
  <cite|Hasofer1979>), of <math|X<around|(|\<cdummy\>|)>> is given by

  <\equation>
    <wide|X|~><around|(|t|)>=<text|Im >2*<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:hilbert_transform>
  </equation>

  The corresponding oscillatory weakly harmonizable process is given by

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:y_process>
  </equation>

  where <math|A<around|(|t,\<lambda\>|)>> is given by
  <eqref|eq:a_representation>. Using this representation, one defines the
  quadrature process as the Hibert transform of
  <math|Y<around|(|\<cdummy\>|)>>. More specifically,

  <\equation>
    <wide|Y|~><around|(|t|)>=<text|Im >2*<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:y_hilbert>
  </equation>

  Using the representations <eqref|eq:y_process> and <eqref|eq:y_hilbert>,
  the envelope of an oscillatory harmonizable process is given by the
  equation

  <\equation>
    R<around|(|t|)>=<sqrt|Y<rsup|2><around|(|t|)>+<wide|Y|~><rsup|2><around|(|t|)>><label|eq:envelope>
  </equation>

  The nonuniqueness of the representation <eqref|eq:y_process> for the
  oscillatory stationary class was pointed out by <cite|Priestley1965> and
  again by <cite|SwiftToAppear> in the oscillatory harmonizable case.
  <cite|Hasofer1979> constructed an example for the oscillatory stationary
  class which showed the nonuniqueness of the representation
  <eqref|eq:envelope>. This nonuniqueness can be resolved so that a process
  has a unique representation <eqref|eq:envelope>, even though the
  representation <eqref|eq:y_process> is not unique.

  Let <math|h<around|(|t<rsub|0>,t,u|)>> be a time-varying filter initiated
  at time <math|t<rsub|0>> such that for each

  <\equation>
    A<around|(|t<rsub|0>,t,\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*h<around|(|t<rsub|0>,t,u|)>*<space|0.17em>d*u<label|eq:filter_a>\<forall\>t\<gtr\>t<rsub|0>
  </equation>

  where <math|A<around|(|t<rsub|0>,t,\<lambda\>|)>> has an absolute maximum
  at <math|\<lambda\>=0>, independent of <math|t>. If the weakly harmonizable
  process <math|X<around|(|\<cdummy\>|)>> is passed through this filter, then
  it can be shown (cf., <cite|SwiftToAppear>) that

  <\equation>
    Y<around|(|t<rsub|0>,t|)>=<big|int><rsub|\<bbb-R\>>X<around|(|u|)>*h<around|(|t<rsub|0>,t,u|)>*<space|0.17em>d*u<label|eq:y_t0_t>
  </equation>

  is an oscillatory weakly harmonizable process. Now suppose that

  <\equation>
    lim<rsub|t<rsub|0>\<rightarrow\>-\<infty\>>h<around|(|t<rsub|0>,t,u|)>=h*<around|(|t-u|)><label|eq:h_limit>
    </equation>

  and

  <\equation>
    lim<rsub|t\<rightarrow\>-\<infty\>>Y<around|(|t<rsub|0>,t|)>=Y<around|(|t|)><label|eq:y_limit>
  </equation>

  where <math|Y<around|(|\<cdummy\>|)>> has representation

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|\<bbb-R\>>h*<around|(|t-u|)>*X<around|(|u|)>*<space|0.17em>d*u<label|eq:y_representation>
  </equation>

  Then since <math|X<around|(|\<cdummy\>|)>> is weakly harmonizable, it
  follows that <math|Y<around|(|\<cdummy\>|)>> is necessarily weakly
  harmonizable (<cite|ChangRao1986>, p. 87). In fact, processes which satisfy
  this condition have been termed asymptotically stationary by
  <cite|Parzen1962>, for which the theory has been well-developed.

  If the kernel <math|h*<around|(|t-u|)>> in <eqref|eq:y_representation> is
  invertible, then using a compact notation, it follows that

  <\equation>
    Y<rsub|t<rsub|0>>=K<rsub|t<rsub|0>>*X<label|eq:y_t0_compact>
  </equation>

  and

  <\equation>
    Y=K*X<label|eq:y_compact>
  </equation>

  so that

  <\equation>
    X=K<rsup|-1>*Y<label|eq:x_compact>
  </equation>

  Now to show the uniqueness of the process <math|Y<around|(|t<rsub|0>,t|)>>,
  suppose that it also has a representation

  <\equation>
    Y<around|(|t<rsub|0>,t|)>=<big|int><rsub|\<bbb-R\>>h<rprime|'><around|(|t<rsub|0>,t,u|)>*X<rprime|'><around|(|u|)>*<space|0.17em>d*u<label|eq:y_t0_alt>
  </equation>

  where <math|X<rprime|'><around|(|\<cdummy\>|)>> is a weakly harmonizable
  process and <math|h<rprime|'><around|(|t<rsub|0>,t,u|)>> is a time-varying
  filter satisfying <eqref|eq:filter_a>. If, in this representation, we also
  assume that

  <\equation>
    lim<rsub|t<rsub|0>\<rightarrow\>-\<infty\>>Y<around|(|t<rsub|0>,t|)>=Y<around|(|t|)><label|eq:y_limit_alt>
  </equation>

  where

  <\equation>
    Y<around|(|t|)>=<big|int><rsub|\<bbb-R\>>h<rprime|'>*<around|(|t-u|)>*X<rprime|'><around|(|u|)>*<space|0.17em>d*u<label|eq:y_alt>
  </equation>

  with <math|h<rprime|'>*<around|(|t-u|)>> invertible, then

  <\equation>
    Y<rsub|t<rsub|0>>=K<rprime|'><rsub|t<rsub|0>>*X<rprime|'><label|eq:y_t0_compact_alt>
  </equation>

  and

  <\equation>
    Y=K<rprime|'>*X<rprime|'><label|eq:y_compact_alt>
  </equation>

  Combining equations <eqref|eq:x_compact> and <eqref|eq:y_compact_alt> gives

  <\equation>
    X<rprime|'>=K<rprime|'><rsup|-1>*K*X<label|eq:x_prime>
  </equation>

  Now noting that <math|K<rprime|'><rsup|-1>> is a time-invariant filter with
  which Hilbert transforms commute, it follows that

  <\equation>
    <wide|X|~><rprime|'>=K<rprime|'><rsup|-1>*K*<wide|X|~><label|eq:x_prime_tilde>
  </equation>

  Thus,

  <\equation>
    <tabular|<tformat|<table|<row|<cell|Y<rsub|t<rsub|0>>>|<cell|=K<rprime|'><rsub|t<rsub|0>>*X<rprime|'>>>|<row|<cell|>|<cell|=K<rprime|'><rsub|t<rsub|0>>*K<rprime|'><rsup|-1>*K*X>>>>><label|eq:y_t0_expanded>
  </equation>

  and

  <\equation>
    <wide|Y|~>=K<rprime|'>*<wide|X|~><rprime|'>.<label|eq:y_tilde_compact>
  </equation>

  Using the spectral representation of the weakly harmonizable process
  <math|X<around|(|\<cdummy\>|)>>, the following two representations for
  <math|Y<around|(|t<rsub|0>,t|)>> are obtained;

  <\equation>
    Y<around|(|t<rsub|0>,t|)>=<big|int><rsub|\<bbb-R\>>T<rsub|1><around|(|t<rsub|0>,t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:y_t0_spectral1>
  </equation>

  were <math|T<rsub|1>> corresponds to the operator
  <math|K<rprime|'><rsub|t<rsub|0>>*K<rprime|'><rsup|-1>*K>, and

  <\equation>
    Y<around|(|t<rsub|0>,t|)>=<big|int><rsub|\<bbb-R\>>T<rsub|2><around|(|t<rsub|0>,t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:y_t0_spectral2>
  </equation>

  where <math|T<rsub|2>> corresponds to the operator <math|K>. Computing the
  covariance of <math|Y<around|(|t<rsub|0>,t|)>> from each of the
  representations <eqref|eq:y_t0_spectral1> and <eqref|eq:y_t0_spectral2>
  gives for each <math|s> and <math|t> that

  <\equation>
    <big|iint><rsub|\<bbb-R\>\<times\>\<bbb-R\>><around|(|T<rsub|1><around|(|t<rsub|0>,s,\<lambda\>|)>*T<rsub|1><around|(|t<rsub|0>,t,\<lambda\><rprime|'>|)>-T<rsub|2><around|(|t<rsub|0>,s,\<lambda\>|)>*T<rsub|2><around|(|t<rsub|0>,t,\<lambda\><rprime|'>|)>|)>e<rsup|i*<around|(|s*\<lambda\>-t*\<lambda\><rprime|'>|)>>*<space|0.17em>d*F<around|(|\<lambda\>,\<lambda\><rprime|'>|)>=0<label|eq:covariance_equality>
  </equation>

  where <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> is the spectral bimeasure
  of the weakly harmonizable process <math|X<around|(|\<cdummy\>|)>>.
  Further,

  <\equation>
    <wide|Y|~><around|(|t|)>=<text|Im >2*<big|int><rsub|\<bbb-R\>>T<rsub|1><around|(|t<rsub|0>,t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:y_tilde1>
  </equation>

  and

  <\equation>
    <wide|Y|~><around|(|t|)>=<text|Im >2*<big|int><rsub|\<bbb-R\>>T<rsub|2><around|(|t<rsub|0>,t,\<lambda\>|)>*e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><label|eq:y_tilde2>
  </equation>

  Using equation <eqref|eq:covariance_equality> along with
  <eqref|eq:y_tilde1> and <eqref|eq:y_tilde2> it follows that

  <\equation>
    <wide|Y|~><around|(|t<rsub|0>,t|)>=<wide|Y|~><rprime|'><around|(|t<rsub|0>,t|)><label|eq:y_tilde_equality>
  </equation>

  so that the uniqueness of the process is established for all
  representations satisfying the above conditions. These observations are
  summarized in the following theorem.

  <\theorem>
    <label|thm:main>Let <math|X:\<bbb-R\>\<to\>L<rsup|2><around|(|P|)>> be a
    weakly harmonizable process with spectral measure
    <math|Z<around|(|\<cdummy\>|)>> having no jumps a.e. at the origin. Let
    <math|h<around|(|t<rsub|0>,t,u|)>> be a time-varying filter initiated at
    time <math|t<rsub|0>> such that for each <math|t\<gtr\>t<rsub|0>>,

    <\equation>
      A<around|(|t<rsub|0>,t,\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*h<around|(|t<rsub|0>,t,u|)>*<space|0.17em>d*u<label|eq:theorem_filter>
    </equation>

    where <math|A<around|(|t<rsub|0>,t,\<lambda\>|)>> has an absolute maximum
    at <math|\<lambda\>=0>, independent of <math|t>. If the oscillatory
    weakly harmonizable process

    <\equation>
      Y<around|(|t<rsub|0>,t|)>=<big|int><rsub|\<bbb-R\>>X<around|(|u|)>*h<around|(|t<rsub|0>,t,u|)>*<space|0.17em>d*u<label|eq:theorem_y>
    </equation>

    is such that

    <\equation>
      lim<rsub|t<rsub|0>\<to\>-\<infty\>>h<around|(|t<rsub|0>,t,u|)>=h*<around|(|t-u|)><label|eq:theorem_h_limit>
    </equation>

    and

    <\equation>
      lim<rsub|t<rsub|0>\<to\>-\<infty\>>Y<around|(|t<rsub|0>,t|)>=Y<around|(|t|)><label|eq:theorem_y_limit>
    </equation>

    where <math|Y<around|(|\<cdummy\>|)>> has representation

    <\equation>
      Y<around|(|t|)>=<big|int><rsub|\<bbb-R\>>h*<around|(|t-u|)>*X<around|(|u|)>*<space|0.17em>d*u<label|eq:theorem_y_final>
    </equation>

    then the quadrature process <math|<wide|Y|~><around|(|\<cdummy\>|)>>
    (i.e. the Hilbert transform of <math|Y<around|(|\<cdummy\>|)>>) is
    unique.
  </theorem>

  <section*|Acknowledgments>

  The author expresses his thanks to Professor M.<nbsp>M.<nbsp>Rao for his
  continuing advice, encouragement and guidance during the work of this
  project. The author also expresses his gratitude to Western Kentucky
  University for a sabbatical leave during the Fall 1998 semester and for
  release time during the Spring 1999 semester, during which this work was
  completed.

  <\thebibliography|11>
    <bibitem|Arens1957>R. Arens, Complex Processes for Envelopes of Normal
    Noise, IRE Trans. Inf. Theory, Vol. 3, pp. 204-207, 1957.

    <bibitem|ChangRao1986>D. K. Chang and M. M. Rao, Bimeasures and
    Nonstationary Processes, in Real and Stochastic Analysis, pp. 7-118, John
    Wiley and Sons, New York, 1986.

    <bibitem|HasoferPetocz1978>A. M. Hasofer and P. Petocz, The envelope of
    an oscillatory process and its upcrossings, J. Appl. Prob., Vol. 110, pp.
    711-716, 1978.

    <bibitem|Hasofer1979>A. M. Hasofer, A Uniqueness Problem for the Envelope
    of an Oscillatory Process, J. Appl. Prob., Vol. 16, pp. 822-829, 1979.

    <bibitem|Parzen1962>E. Parzen, Spectral Analysis of Asymptotically
    Stationary Time Series, Bull. Internat. Statist. Inst., Vol. 39, p.
    87-103, 1962.

    <bibitem|Priestley1965>M. B. Priestley, Evolutionary Spectra and
    Nonstationary Processes, J. Roy. Statist. Soc., Ser. B, Vol. 27, pp.
    204-237, 1965.

    <bibitem|Rao1984>M. M. Rao, Harmonizable Processes: Structure Theory,
    L'Enseign Math., Vol. 28, pp. 295-351, 1984.

    <bibitem|Swift1997a>R. J. Swift, An Operator Characterization of
    Oscillatory Harmonizable Processes, in Stochastic Processes and
    Functional Analysis, J. Goldstein, N. Gretsky and J. J. Uhl (eds.),
    Marcel Dekker, New York, pp. 235-243, 1997.

    <bibitem|Swift1997b>R. J. Swift, Some Aspects of Harmonizable Processes
    and Fields, in Real and Stochastic Analysis: Recent Advances, M. M. Rao
    (ed.), pp. 303-365, CRC Press, Boca Raton, 1997.

    <bibitem|SwiftToAppear>R. J. Swift, The Evolutionary Spectra of a
    Harmonizable Process, J. Appl. Stat. Sci. (to appear).

    <bibitem|Yang1972>J. N. Yang, Non-stationary Envelope Process and
    First-excursion Probability, J. Structural Mech., Vol. 1, pp. 231-248,
    1972.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|global-title|The Envelope of an Oscillatory Harmonizable
    Process>
    <associate|info-flag|minimal>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-3|<tuple|3|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-4|<tuple|44|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-5|<tuple|44|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Arens1957|<tuple|Arens1957|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-ChangRao1986|<tuple|ChangRao1986|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Hasofer1979|<tuple|Hasofer1979|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-HasoferPetocz1978|<tuple|HasoferPetocz1978|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Parzen1962|<tuple|Parzen1962|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Priestley1965|<tuple|Priestley1965|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Rao1984|<tuple|Rao1984|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Swift1997a|<tuple|Swift1997a|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Swift1997b|<tuple|Swift1997b|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-SwiftToAppear|<tuple|SwiftToAppear|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Yang1972|<tuple|Yang1972|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:osc_weak_harm|<tuple|1|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:a_representation|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:covariance_equality|<tuple|36|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:envelope|<tuple|16|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:filter_a|<tuple|17|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:h_limit|<tuple|19|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:harmonizable_cov|<tuple|5|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:hilbert_transform|<tuple|13|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:modulated|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:osc_cov|<tuple|9|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:osc_harm_cov|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:osc_harm_rep|<tuple|10|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:priestley_rep|<tuple|8|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:stationary|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:stationary_cov|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:theorem_filter|<tuple|40|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:theorem_h_limit|<tuple|42|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:theorem_y|<tuple|41|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:theorem_y_final|<tuple|44|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:theorem_y_limit|<tuple|43|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:weak_harm_rep|<tuple|12|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:x_compact|<tuple|24|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:x_prime|<tuple|30|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:x_prime_tilde|<tuple|31|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_alt|<tuple|27|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_compact|<tuple|23|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_compact_alt|<tuple|29|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_hilbert|<tuple|15|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_limit|<tuple|20|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_limit_alt|<tuple|26|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_process|<tuple|14|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_representation|<tuple|21|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_t0_alt|<tuple|25|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_t0_compact|<tuple|22|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_t0_compact_alt|<tuple|28|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_t0_expanded|<tuple|32|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_t0_spectral1|<tuple|34|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_t0_spectral2|<tuple|35|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_t0_t|<tuple|18|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_tilde1|<tuple|37|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_tilde2|<tuple|38|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_tilde_compact|<tuple|33|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_tilde_equality|<tuple|39|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:z_expectation|<tuple|11|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:main|<tuple|2|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Swift1997a

      Priestley1965

      HasoferPetocz1978

      Arens1957

      Yang1972

      Hasofer1979

      Swift1997a

      Swift1997b

      SwiftToAppear

      Rao1984

      Swift1997b

      Swift1997a

      Priestley1965

      Swift1997a

      Hasofer1979

      Priestley1965

      SwiftToAppear

      Hasofer1979

      SwiftToAppear

      ChangRao1986

      Parzen1962
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Setting> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Envelope
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgments>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>