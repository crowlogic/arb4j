<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|NONSTATIONARY ENVELOPE IN RANDOM VIBRATION
  THEORY>|<doc-author|<author-data|<author-name|Giuseppe
  Muscolino>|<author-note|Researcher, Dipartimento di Ingegneria Strutturale
  e Geotecnica, Università degli Studi di Palermo, Viale delle Scienze,
  I-90128 Palermo, Italy.>>>|<doc-date|>>

  <abstract-data|<\abstract>
    In this paper, it is shown that the input process in the nonstationary
    case must be defined as a complex process, i.e., as the product of an
    analytic random stationary process by a deterministic shaping function.
    Defining the input in this manner, the complex nonstationary
    cross-correlation matrix is evaluated, and the nonstationary spectral
    moments take on a self-evident physical meaning as variances of the
    complex response and of its time derivatives. Using the complex process,
    the nonstationary envelope, too, becomes a natural consequence of the
    previous definition, i.e., the modulus of the complex response of linear
    systems subjected to such input. In the framework of complex processes,
    the mean rate threshold crossing for circular barriers and the
    first-passage probability are evaluated using the one-step memory Markov
    process.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Preliminary
    Concepts and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Stationary Case
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Nonstationary Case
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Cross-Correlation
    Matrix of Complex Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Stationary Particularization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Cross-Covariance
    Spectral Matrix> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Stationary Case
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|4.2<space|2spc>Nonstationary Case
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Mean-Rate
    Threshold Crossing for Circular Barriers>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>First-Passage
    Probability> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Conclusions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgments>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>PSD
    of Analytic Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Notation>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:introduction>

  The problem of predicting the safety of structural systems subjected to
  random loading arises in many engineering applications. It is well-known
  that such loadings as aircraft impact during landing are nonstationary
  random processes. It follows that the response of quiescent systems is also
  nonstationary and that the prediction of their structural safety is an
  important topic in structural engineering.

  In the framework of the prediction of structural safety, the envelope
  process <cite|langley1986> plays an important role. For example, in the
  problem of first excursion failure and that of fatigue failure, evaluating
  the statistical properties of the envelope process becomes an important
  task in both stationary <cite|yang1971> and nonstationary <cite|yang1972>
  response processes. In the stationary case, the envelope process is usually
  defined following <cite|dugundji1958> and <cite|cramer1967>, and it can be
  seen as the modulus of the response of a linear system subjected to a
  complex process called pre-envelope <cite|arens1957|dugundji1958>, which is
  a complex process in which the imaginary part is the Hilbert transform of
  the companion real part.

  In previous papers <cite|borino1988|dipaola1985>, it has been demonstrated
  that the complex processes must be introduced not only for the definition
  of the envelope process, but also to give a clearer definition of
  stationary and nonstationary spectral moments, which are simply variances
  of the complex response and its time derivatives in structural systems
  subjected to such input <cite|dipaola1985>.

  In this paper, which defines the nonstationary pre-envelope process as the
  product of a deterministic shaping function by the pre-envelope of a
  stationary random process, a critical review and extensions of the
  well-known stationary concept are made in the nonstationary case. The
  complex cross-correlation matrix of the response of a
  single-degree-of-freedom (SDOF) linear system subjected to such input are
  obtained, as well as the time derivatives of the response.

  In the last sections, the nonstationary cross-correlation function and the
  nonstationary spectral moments are used in the evaluation of the mean rate
  threshold crossing for circular barriers and in the first-passage
  probability problem for the Poisson and Markov assumption of level
  crossing.

  <section|Preliminary Concepts and Definitions><label|sec:preliminaries>

  <subsection|Stationary Case><label|sec:stationary>

  The equation of motion of an SDOF system may be written in the canonical
  form as follows:

  <\equation>
    <wide|x|\<ddot\>>+2*\<zeta\>*\<omega\><rsub|0>*<wide|x|\<dot\>>+\<omega\><rsub|0><rsup|2>*x=f<around|(|t|)><label|eq:motion>
  </equation>

  where <math|\<zeta\>> and <math|\<omega\><rsub|0>> are the damping ratio
  and the natural radian frequency, respectively; the displacement
  <math|x<around|(|t|)>> is the solution of equation<nbsp><eqref|eq:motion>;
  the upper dot indicates time differentiation; and <math|f<around|(|t|)>> is
  a stochastic zero-mean process.

  It is well-known that for the stationary analysis of linear systems, the
  function that characterizes both the input and output processes is the
  power spectral density function (PSD). Though from a mathematical viewpoint
  the PSD is defined in the frequency range <math|-\<infty\>> to
  <math|\<infty\>>, from the physical viewpoint the power is defined only in
  the positive frequency range. In the last few years, it has been shown that
  the one-sided PSD (defined as <math|0>-<math|\<infty\>>) is required in
  order to obtain some significant quantities in the evaluation of the
  statistics of the stochastic response <cite|vanmarcke1972|vanmarcke1975>.
  It is defined as the product of the Heaviside function
  <math|U<around|(|\<omega\>|)>> by twice the PSD (defined as
  <math|-\<infty\>>-<math|\<infty\>>), i.e.

  <\equation>
    G<rsub|f><around|(|\<omega\>|)>=2*U<around|(|\<omega\>|)>*<wide|G|\<bar\>><rsub|f><around|(|\<omega\>|)><label|eq:psd_onesided>
  </equation>

  where the overbar indicates the usual PSD (defined as
  <math|-\<infty\>>-<math|\<infty\>>). On the other hand, in order to obtain
  a process that defines the one-sided PSD in
  equation<nbsp><eqref|eq:psd_onesided>, the corresponding process
  <math|f<around|(|t|)>> in the time domain must be a complex one, in which
  the imaginary part is the Hilbert transform of the corresponding real part,
  i.e., an analytic process <cite|dipaola1985>. This process is the so-called
  pre-envelope <cite|arens1957|dugundji1958> (see
  Appendix<nbsp><reference|app:psd>) and is given as

  <\equation>
    f<around|(|t|)>=n<around|(|t|)>+i*<wide|n|^><around|(|t|)><label|eq:preenvelope>
  </equation>

  where <math|n<around|(|t|)>> is the stationary process having the usual
  PSD, <math|G<rsub|n><around|(|\<omega\>|)>>; <math|i=<sqrt|-1>>; and the
  accent <math|<around|(|<wide||^>|)>> means Hilbert transform:

  <\equation>
    H<around|[|n<around|(|t|)>|]>=<wide|n|^><around|(|t|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|n<around|(|\<tau\>|)>|t-\<tau\>>*d*\<tau\><label|eq:hilbert>
  </equation>

  Due to the fact that input is analytic, the corresponding output is
  analytic as well <cite|krenk1981>, i.e.

  <\equation>
    x<around|(|t|)>=y<around|(|t|)>+i*<wide|y|^><around|(|t|)><label|eq:output_analytic>
  </equation>

  where <math|y<around|(|t|)>> is the response of the oscillator subjected to
  the real process <math|n<around|(|t|)>>. The process <math|x<around|(|t|)>>
  can be considered as a point in the rectangular coordinates of the plane
  <math|y<around|(|t|)>/i*<wide|y|^><around|(|t|)>>, while in polar
  coordinates the process <math|x<around|(|t|)>> can be written in the form:

  <\equation>
    x<around|(|t|)>=a<around|(|t|)>*exp <around|[|i*\<vartheta\><around|(|t|)>|]><label|eq:polar>
  </equation>

  where <math|a<around|(|t|)>> and <math|\<vartheta\><around|(|t|)>> are a
  pair of random processes called the amplitude and the phase, respectively.
  It is to be noted that <math|y<around|(|t|)>> and
  <math|<wide|y|^><around|(|t|)>> are given in polar coordinates in the form

  <\align>
    <tformat|<table|<row|<cell|y<around|(|t|)>>|<cell|=a<around|(|t|)>*cos
    <around|[|\<vartheta\><around|(|t|)>|]><eq-number><label|eq:polar_y>>>|<row|<cell|<wide|y|^><around|(|t|)>>|<cell|=a<around|(|t|)>*sin
    <around|[|\<vartheta\><around|(|t|)>|]><eq-number><label|eq:polar_yhat>>>>>
  </align>

  In equations<nbsp><eqref|eq:polar> and<nbsp><eqref|eq:polar_y>-<eqref|eq:polar_yhat>,
  following the primary definition of <cite|dugundji1958> and
  <cite|cramer1967>, <math|a<around|(|t|)>> is the so-called envelope
  function of the process <math|x<around|(|t|)>> and is the modulus of the
  complex process <math|x<around|(|t|)>> defined in
  equation<nbsp><eqref|eq:output_analytic>, i.e.

  <\equation>
    a<around|(|t|)>=<sqrt|y<rsup|2><around|(|t|)>+<wide|y|^><rsup|2><around|(|t|)>><label|eq:envelope>
  </equation>

  Notice that the process <math|a<around|(|t|)>> is defined in the range
  <math|0>-<math|\<infty\>>, while <math|\<vartheta\><around|(|t|)>> is
  defined in the range <math|0>-<math|2*\<pi\>> and is given as

  <\equation>
    \<vartheta\><around|(|t|)>=tan<rsup|-1><around*|(|<frac|<wide|y|^><around|(|t|)>|y<around|(|t|)>>|)><label|eq:phase>
  </equation>

  <subsection|Nonstationary Case><label|sec:nonstationary>

  In the nonstationary case, a quite different situation is observed. If we
  construct a complex input process in which the imaginary part is the
  Hilbert transform of the corresponding real part, it follows that the
  imaginary part of the output is different from zero for
  <math|-\<infty\>\<less\>t\<less\>0>, and the corresponding envelope exists
  in the negative time region, in contrast with its own physical meaning.
  Thus in the nonstationary case, the complex input process of
  equation<nbsp><eqref|eq:motion> must be defined as the product of a
  deterministic real shaping function <math|F<around|(|t|)>> by the
  pre-envelope of a stationary process, i.e.

  <\equation>
    f<around|(|t|)>=F<around|(|t|)>*<around|[|n<around|(|t|)>+i*<wide|n|^><around|(|t|)>|]><label|eq:nonstationary_input>
  </equation>

  Assuming the latter as input, the corresponding output will be given in the
  form:

  <\equation>
    x<around|(|t|)>=y<around|(|t|)>+i*<wide|y|~><around|(|t|)><label|eq:nonstationary_output>
  </equation>

  where <math|y<around|(|t|)>> is the response of
  equation<nbsp><eqref|eq:motion> when the input is
  <math|F<around|(|t|)>*n<around|(|t|)>>.
  Equations<nbsp><eqref|eq:nonstationary_input>
  and<nbsp><eqref|eq:nonstationary_output> are the extensions of the
  pre-envelope of the input and output processes, respectively, in the
  nonstationary case. It is also evident that <math|<wide|y|~><around|(|t|)>>
  coincides with <math|<wide|y|^><around|(|t|)>> only when
  <math|F<around|(|t|)>=1> <math|\<forall\>t> (stationary case).

  Due to the fact that the envelope <math|a<around|(|t|)>> is defined as the
  amplitude of the complex output process, as in the stationary case, we can
  write

  <\equation>
    a<around|(|t|)>=<sqrt|y<rsup|2><around|(|t|)>+<wide|y|~><rsup|2><around|(|t|)>><label|eq:nonstationary_envelope>
  </equation>

  and the corresponding nonstationary phase is given as

  <\equation>
    \<vartheta\><around|(|t|)>=tan<rsup|-1><around*|(|<frac|<wide|y|~><around|(|t|)>|y<around|(|t|)>>|)><label|eq:nonstationary_phase>
  </equation>

  Notice that equation<nbsp><eqref|eq:nonstationary_input> is the only
  correct definition of complex input for separable processes. Moreover, it
  can easily be shown that the previously defined nonstationary envelope
  coincides with the definition of envelope given by <cite|yang1972>, using
  the <cite|priestley1967> spectral representation of stochastic processes.

  <section|Cross-Correlation Matrix of Complex
  Processes><label|sec:correlation_matrix>

  To obtain the statistics of the envelope process, the cross-correlation
  matrix of the process <math|x<around|(|t|)>> and its time differentiations
  must be evaluated. To this purpose, a vector
  <math|<math-bf|X><rsub|m><around|(|t|)>> is introduced in the form

  <\equation>
    <math-bf|X><rsub|m><around|(|t|)>=<around*|[|x<around|(|t|)>,<frac|d*x<around|(|t|)>|d*t>,\<ldots\>,<frac|d<rsup|m-1>*x<around|(|t|)>|d*t<rsup|m-1>>|]><rsup|T><label|eq:vector_x>
  </equation>

  where the superscript <math|T> denotes transpose; and
  <math|x<around|(|t|)>> is the complex process defined in
  equation<nbsp><eqref|eq:output_analytic> for the stationary case and in
  equation<nbsp><eqref|eq:nonstationary_output> for the nonstationary case.
  It follows that the cross-correlation matrix of the vector
  <math|<math-bf|X><rsub|m><around|(|t|)>> can be obtained as

  <\equation>
    <math-bf|R><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)>=E<around|[|<math-bf|X><rsub|m><around|(|t<rsub|1>|)><math-bf|X><rsub|m><rsup|\<ast\>><around|(|t<rsub|2>|)>|]><label|eq:correlation_matrix>
  </equation>

  where <math|(\<ast\>)> denotes complex conjugate; and
  <math|E<around|[|\<cdummy\>|]>> denotes stochastic average. In order to
  evaluate the various entries of the matrix
  <math|<math-bf|R><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)>>, all
  stochastic averages of the product of the various time derivatives of
  <math|x<around|(|t<rsub|1>|)>> and <math|x<around|(|t<rsub|2>|)>> must be
  computed <cite|borino1988|dipaola1985|dipaola1985b>, i.e.

  <\equation>
    p<rsub|s,v,x><around|(|t<rsub|1>,t<rsub|2>|)>=E*<around*|[|<frac|d<rsup|s>*x<around|(|t<rsub|1>|)>|d*t<rsub|1><rsup|s>>*<frac|d<rsup|v>*x<rsup|\<ast\>><around|(|t<rsub|2>|)>|d*t<rsub|2><rsup|v>>|]><label|eq:cross_correlation_entry>
  </equation>

  Though in the last two sections only the first two entries of the
  correlation matrix are used, hereafter, for the sake of completeness, the
  general case involving time derivatives up to the <math|<around|(|m-1|)>>th
  order is treated. To obtain the cross-correlation function given in
  equation<nbsp><eqref|eq:cross_correlation_entry>, the various time
  differentiations of the process <math|x<around|(|t|)>> must be evaluated.
  For this purpose, using the Duhamel integral representation of the
  quiescent system subjected to the process defined in
  equation<nbsp><eqref|eq:nonstationary_input> and also using the Leibnitz
  rule applied to this case, we write

  <\equation>
    <frac|d<rsup|r>*x<around|(|t<rsub|1>|)>|d*t<rsub|1><rsup|r>>=<big|sum><rsub|k=0><rsup|r><binom|r|k><frac|d<rsup|r-k>*h<around|(|t<rsub|1>|)>|d*t<rsub|1><rsup|r-k>>*<big|int><rsub|0><rsup|t<rsub|1>><frac|d<rsup|k>|d*t<rsub|1><rsup|k>>*f*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*d*\<tau\><rsub|1>,<space|1em>r=s,v<label|eq:leibnitz>
  </equation>

  where <math|h<around|(|t|)>> is the impulse response function:

  <\equation>
    h<around|(|t|)>=<frac|1|\<omega\><rsub|D>>*exp
    <around|(|-\<zeta\>*\<omega\><rsub|0>*t|)>*sin
    <around|(|\<omega\><rsub|D>*t|)>,<space|1em>t\<geq\>0;<space|1em>h<around|(|t|)>=0,<space|1em>t\<less\>0<label|eq:impulse_response>
  </equation>

  and <math|\<omega\><rsub|D>=\<omega\><rsub|0>*<sqrt|1-\<zeta\><rsup|2>>>.
  It is worth noting that the impulse response function defined in
  equation<nbsp><eqref|eq:impulse_response> exhibits a slope discontinuity in
  <math|t=0>. It follows that the second derivatives of
  <math|h<around|(|t|)>> exhibit a Dirac delta in <math|t=0>, while the
  higher derivatives exhibit discontinuity of a higher order. However, due to
  the fact that the Leibnitz rule has been used, the various derivatives that
  appear in equation<nbsp><eqref|eq:leibnitz> must be evaluated in
  <math|t=0<rsup|+>>. On the other hand, equation<nbsp><eqref|eq:leibnitz>
  can be rewritten in a more suitable form for the following analysis by
  dropping the last summation and considering the various derivatives of the
  impulse response function in <math|t=0>, i.e.

  <\equation>
    <frac|d<rsup|r>*x<around|(|t<rsub|1>|)>|d*t<rsub|1><rsup|r>>=<big|sum><rsub|k=0><rsup|r-2><binom|r|k>\<beta\><rsub|r-k-1>*<frac|d<rsup|k>|d*t<rsub|1><rsup|k>>*f<around|(|t<rsub|1>|)>+<big|int><rsub|0><rsup|t<rsub|1>><frac|d<rsup|r>*h*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>|d*t<rsub|1><rsup|r>>*f*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*d*\<tau\><rsub|1><label|eq:derivative_form>
  </equation>

  in which <math|\<delta\><around|(|t|)>> is the Dirac's delta; and
  <math|g<around|(|t|)>> is given as

  <\equation>
    g<around|(|t|)>=<frac|1|\<omega\><rsub|D>>*exp
    <around|(|-\<zeta\>*\<omega\><rsub|0>*t|)>*cos
    <around|(|\<omega\><rsub|D>*t|)>,<space|1em>t\<geq\>0;<space|1em>g<around|(|t|)>=0,<space|1em>t\<less\>0<label|eq:g_function>
  </equation>

  and

  <\align>
    <tformat|<table|<row|<cell|\<alpha\><rsub|r>>|<cell|=-\<zeta\>*\<omega\><rsub|0>*\<alpha\><rsub|r-1>-\<omega\><rsub|D><rsup|2>*\<beta\><rsub|r-1><eq-number><label|eq:alpha_recursion>>>|<row|<cell|\<alpha\><rsub|0>>|<cell|=1<eq-number><label|eq:alpha_initial>>>>>
  </align>

  <\align>
    <tformat|<table|<row|<cell|\<beta\><rsub|r>>|<cell|=-\<zeta\>*\<omega\><rsub|0>*\<beta\><rsub|r-1>+\<omega\><rsub|D>*\<alpha\><rsub|r-1><eq-number><label|eq:beta_recursion>>>|<row|<cell|\<beta\><rsub|0>>|<cell|=0<eq-number><label|eq:beta_initial>>>>>
  </align>

  It follows that, using equation<nbsp><eqref|eq:derivative_form> to
  represent the high derivatives of <math|h<around|(|t|)>> instead of the
  Leibnitz rule, we can write in a more concise manner

  <\equation>
    <frac|d<rsup|r>*x<around|(|t<rsub|1>|)>|d*t<rsub|1><rsup|r>>=<big|sum><rsub|k=0><rsup|r-2><binom|r|k>\<beta\><rsub|r-k-1>*<frac|d<rsup|k>|d*t<rsub|1><rsup|k>>*f<around|(|t<rsub|1>|)>+<big|int><rsub|0><rsup|t<rsub|1>><frac|d<rsup|r>*h*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>|d*t<rsub|1><rsup|r>>*f*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*d*\<tau\><rsub|1><label|eq:concise_derivative>
  </equation>

  Observing that the following relationship holds (see
  Appendix<nbsp><reference|app:psd>):

  <\equation>
    E*<around|[|f*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*f<rsup|\<ast\>>*<around|(|t<rsub|2>-\<tau\><rsub|2>|)>|]>=F*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*F*<around|(|t<rsub|2>-\<tau\><rsub|2>|)>*<around|[|p<rsub|n><around|(|\<gamma\>|)>+i*p<rsub|<wide|n|^>><around|(|\<gamma\>|)>|]><label|eq:cross_correlation_f>
  </equation>

  and substituting equation<nbsp><eqref|eq:concise_derivative> into
  equation<nbsp><eqref|eq:cross_correlation_entry>, the cross-correlation
  function can be written in the form:

  <\equation>
    p<rsub|s,v,x><around|(|t<rsub|1>,t<rsub|2>|)>=<big|int><rsub|0><rsup|t<rsub|1>><big|int><rsub|0><rsup|t<rsub|2>><frac|d<rsup|s>*h<around|(|\<tau\><rsub|1>|)>|d*t<rsub|1><rsup|s>>*<frac|d<rsup|v>*h<around|(|\<tau\><rsub|2>|)>|d*t<rsub|2><rsup|v>>*F*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*F*<around|(|t<rsub|2>-\<tau\><rsub|2>|)>*<around|[|p<rsub|n><around|(|\<gamma\>|)>+i*p<rsub|<wide|n|^>><around|(|\<gamma\>|)>|]>*d*\<tau\><rsub|1>*d*\<tau\><rsub|2><label|eq:cross_correlation_general>
  </equation>

  where

  <\equation>
    \<gamma\>=t<rsub|1>-t<rsub|2>+\<tau\><rsub|1>-\<tau\><rsub|2><label|eq:gamma>
  </equation>

  In equations<nbsp><eqref|eq:cross_correlation_f>
  and<nbsp><eqref|eq:cross_correlation_general>,
  <math|p<rsub|n><around|(|\<gamma\>|)>> and
  <math|p<rsub|<wide|n|^>><around|(|\<gamma\>|)>> are the autocorrelation
  functions of the stationary process <math|n<around|(|t|)>> and its Hilbert
  transform, respectively.

  It is worth noting that using equation<nbsp><eqref|eq:leibnitz>, an
  equivalent expression of the <math|p<rsub|s,v,x><around|(|t<rsub|1>,t<rsub|2>|)>>
  function can also be obtained, but its mathematical form is more
  complicated than that given in equation<nbsp><eqref|eq:cross_correlation_general>.

  For our purposes, a more suitable expression of the cross-correlation
  function given in equation<nbsp><eqref|eq:cross_correlation_general> can be
  obtained by using the representation of
  <math|p<rsub|n><around|(|\<gamma\>|)>> and
  <math|p<rsub|<wide|n|^>><around|(|\<gamma\>|)>> as the inverse of the
  Fourier transform of the PSD <cite|papoulis1984>, i.e.

  <\align>
    <tformat|<table|<row|<cell|p<rsub|n><around|(|\<gamma\>|)>>|<cell|=E*<around|[|n<around|(|t|)>*n*<around|(|t+\<gamma\>|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>G<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*\<gamma\>>*d*\<omega\><eq-number><label|eq:pn_fourier>>>|<row|<cell|p<rsub|<wide|n|^>><around|(|\<gamma\>|)>>|<cell|=E*<around|[|<wide|n|^><around|(|t|)>*n*<around|(|t+\<gamma\>|)>|]>=-i*<big|int><rsub|-\<infty\>><rsup|\<infty\>><text|sgn><around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*\<gamma\>>*d*\<omega\><eq-number><label|eq:pnhat_fourier>>>>>
  </align>

  Substituting the latter into equation<nbsp><eqref|eq:cross_correlation_general>
  and changing the order of integration we obtain

  <\equation>
    p<rsub|s,v,x><around|(|t<rsub|1>,t<rsub|2>|)>=4*<big|int><rsub|-\<infty\>><rsup|\<infty\>>U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*K<rsub|s><around|(|\<omega\>,t<rsub|1>|)>*K<rsub|v><rsup|\<ast\>><around|(|\<omega\>,t<rsub|2>|)>*d*\<omega\><label|eq:cross_correlation_frequency>
  </equation>

  where

  <\equation>
    K<rsub|r><around|(|\<omega\>,t|)>=<big|int><rsub|0><rsup|t><frac|d<rsup|r>*h<around|(|\<tau\>|)>|d*t<rsup|r>>*F*<around|(|t-\<tau\>|)>*e<rsup|i*\<omega\>*\<tau\>>*d*\<tau\>,<space|1em>r=s,v;<space|1em>t=t<rsub|1>,t<rsub|2><label|eq:k_function>
  </equation>

  For <math|s=v=0> and <math|t<rsub|1>=t<rsub|2>=t>, the integrand in
  equation<nbsp><eqref|eq:cross_correlation_frequency> is the so-called
  evolutionary PSD <cite|corotis1977|corotis1972|grossmayer1977>, namely:

  <\equation>
    G<rsub|x><around|(|\<omega\>,t|)>=4*U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>*K<rsub|0><around|(|\<omega\>,t|)>*K<rsub|0><rsup|\<ast\>><around|(|\<omega\>,t|)><label|eq:evolutionary_psd>
  </equation>

  which is a one-sided function and shows how the frequency content changes
  with time. Due to the fact that the following inequality:

  <\equation>
    K<rsub|r><around|(|\<omega\>,t|)>\<neq\><around|(|i*\<omega\>|)><rsup|r>*K<rsub|0><around|(|\<omega\>,t|)><label|eq:inequality>
  </equation>

  holds true for <math|r\<gtr\>0>, the correlation function defined in
  equation<nbsp><eqref|eq:cross_correlation_frequency> cannot be evaluated by
  means of the evolutionary PSD. It follows that the latter is not able to
  give the counterpart in the frequency domain of the various derivatives of
  the correlation function. By contrast, in the stationary case,
  equation<nbsp><eqref|eq:inequality> becomes an identity for any order of
  <math|r>.

  <subsection|Stationary Particularization><label|sec:stationary_particularization>

  Hereafter, the cross-correlation function is obtained in the stationary
  case. Putting <math|t\<to\>\<infty\>> and <math|F<around|(|t|)>=1>
  <math|\<forall\>t> in equation<nbsp><eqref|eq:cross_correlation_frequency>,
  it follows that the function <math|K<rsub|r><around|(|\<omega\>,\<infty\>|)>>
  can be written in the form

  <\equation>
    K<rsub|r><around|(|\<omega\>,\<infty\>|)>=<big|int><rsub|0><rsup|\<infty\>><frac|d<rsup|r>*h<around|(|\<tau\>|)>|d*t<rsup|r>>*e<rsup|i*\<omega\>*\<tau\>>*d*\<tau\>=<around|(|i*\<omega\>|)><rsup|r>*K<rsub|0><around|(|\<omega\>,\<infty\>|)>,<space|1em>r=s,v<label|eq:stationary_k>
  </equation>

  where <math|K<rsub|0><around|(|\<omega\>,\<infty\>|)>> is the complex
  conjugate of the transfer function in terms of displacement, given as

  <\equation>
    K<rsub|0><around|(|\<omega\>,\<infty\>|)>=H<rsup|\<ast\>><around|(|\<omega\>|)>=<frac|1|\<omega\><rsub|0><rsup|2>-\<omega\><rsup|2>-2*i*\<zeta\>*\<omega\><rsub|0>*\<omega\>><label|eq:transfer_function>
  </equation>

  It follows that by setting <math|\<tau\>=t<rsub|2>-t<rsub|1>> in
  equation<nbsp><eqref|eq:cross_correlation_frequency>, the cross-correlation
  function can be written in the well-known simpler form:

  <\equation>
    p<rsub|s,v,x><around|(|\<tau\>|)>=4*<big|int><rsub|-\<infty\>><rsup|\<infty\>>U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>*<around|[|<around|(|-i*\<omega\>|)><rsup|s>*H<around|(|\<omega\>|)>|]>*<around|[|<around|(|i*\<omega\>|)><rsup|v>*H<rsup|\<ast\>><around|(|\<omega\>|)>|]>*e<rsup|i*\<omega\>*\<tau\>>*d*\<omega\><label|eq:stationary_correlation>
  </equation>

  It is worth noting that while in the nonstationary case the correlation
  function defined in equation<nbsp><eqref|eq:cross_correlation_frequency>
  takes on different values when the order of differentiation changes, i.e.,
  it depends on <math|s> and <math|v> being taken separately, in the
  stationary case the correlation function depends on the sum of <math|s> and
  <math|v>, i.e.

  <\align>
    <tformat|<table|<row|<cell|p<rsub|2*r,x><around|(|\<tau\>|)>>|<cell|=<around|(|-1|)><rsup|r>*E*<around*|[|<frac|d<rsup|r>*x<around|(|t|)>|d*t<rsup|r>>*<frac|d<rsup|r>*x<rsup|\<ast\>>*<around|(|t+\<tau\>|)>|d*t<rsup|r>>|]>*<space|1em><around|(|2*r=s+v|)><eq-number><label|eq:stationary_2r>>>|<row|<cell|p<rsub|2*r+1,x><around|(|\<tau\>|)>>|<cell|=<around|(|-1|)><rsup|r>*E*<around*|[|<frac|d<rsup|r>*x<around|(|t|)>|d*t<rsup|r>>*<frac|d<rsup|r+1>*x<rsup|\<ast\>>*<around|(|t+\<tau\>|)>|d*t<rsup|r+1>>|]>*<space|1em><around|(|2*r+1=s+v|)><eq-number><label|eq:stationary_2r1>>>>>
  </align>

  If the time derivatives of all orders of
  <math|p<rsub|0,x><around|(|\<tau\>|)>> exist, an equivalent definition of
  <math|p<rsub|j,x><around|(|\<tau\>|)>> (<math|j=2*r,2*r+1>) can be written
  in the form

  <\align>
    <tformat|<table|<row|<cell|p<rsub|2*r,x><around|(|\<tau\>|)>>|<cell|=<around|(|-1|)><rsup|r><frac|d<rsup|2*r>*p<rsub|0,x><around|(|\<tau\>|)>|d*\<tau\><rsup|2*r>><eq-number><label|eq:derivative_2r>>>|<row|<cell|p<rsub|2*r+1,x><around|(|\<tau\>|)>>|<cell|=<around|(|-1|)><rsup|r+1><frac|d<rsup|2*r+1>*p<rsub|0,x><around|(|\<tau\>|)>|d*\<tau\><rsup|2*r+1>><eq-number><label|eq:derivative_2r1>>>>>
  </align>

  Notice that in equations<nbsp><eqref|eq:stationary_2r>-<eqref|eq:derivative_2r1>
  the imaginary part of <math|p<rsub|2*r,x><around|(|\<tau\>|)>> and the real
  part of <math|p<rsub|2*r+1,x><around|(|\<tau\>|)>> are the Hilbert
  transforms of the corresponding real and imaginary parts, respectively.

  <section|Cross-Covariance Spectral Matrix><label|sec:spectral_matrix>

  In this section, the special cases defined by <math|\<tau\>=0> in
  equation<nbsp><eqref|eq:stationary_correlation> and
  <math|t<rsub|1>=t<rsub|2>=t> in equation<nbsp><eqref|eq:cross_correlation_frequency>
  will be discussed, obtaining the so-called spectral moments in the
  stationary and nonstationary cases, respectively. The manner in which these
  quantities play a fundamental role in the study of the statistics of the
  envelope will be discussed in the following sections.

  <subsection|Stationary Case><label|sec:spectral_stationary>

  In the stationary case, setting <math|\<tau\>=0> in
  equation<nbsp><eqref|eq:stationary_correlation>, we obtain

  <\equation>
    p<rsub|s,v,x><around|(|0|)>=4*<around|(|-i|)><rsup|s>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>*H<around|(|\<omega\>|)>*H<rsup|\<ast\>><around|(|\<omega\>|)>*\<omega\><rsup|s+v>*d*\<omega\><label|eq:spectral_moment_stationary>
  </equation>

  The integral in equation<nbsp><eqref|eq:spectral_moment_stationary>
  represents the moments of the one-sided PSD with respect to the frequency
  origin, i.e., the so-called spectral moments <cite|vanmarcke1972>

  <\equation>
    \<lambda\><rsub|s+v,x>=4*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|s+v>*U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>*H<around|(|\<omega\>|)>*H<rsup|\<ast\>><around|(|\<omega\>|)>*d*\<omega\><label|eq:spectral_moment_def>
  </equation>

  Substituting equation<nbsp><eqref|eq:spectral_moment_def> into
  equation<nbsp><eqref|eq:spectral_moment_stationary>, we obtain

  <\equation>
    p<rsub|s,v,x><around|(|0|)>=<around|(|-i|)><rsup|s>*\<lambda\><rsub|s+v,x><label|eq:spectral_moment_relation>
  </equation>

  It follows that the correlation matrix evaluated for
  <math|t<rsub|1>=t<rsub|2>> in the stationary case becomes a Hermitian
  time-independent matrix, namely the so-called cross-covariance spectral
  (CCS) matrix <cite|borino1988>

  <\equation>
    <math-bf|R><rsub|m,x><around|(|0|)>=\<b-Lambda\><rsub|m,x>=<around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|0,x>>|<cell|-i*\<lambda\><rsub|1,x>>|<cell|-\<lambda\><rsub|2,x>>|<cell|i*\<lambda\><rsub|3,x>>|<cell|\<cdots\>>>|<row|<cell|i*\<lambda\><rsub|1,x>>|<cell|\<lambda\><rsub|2,x>>|<cell|-i*\<lambda\><rsub|3,x>>|<cell|-\<lambda\><rsub|4,x>>|<cell|\<cdots\>>>|<row|<cell|-\<lambda\><rsub|2,x>>|<cell|i*\<lambda\><rsub|3,x>>|<cell|\<lambda\><rsub|4,x>>|<cell|-i*\<lambda\><rsub|5,x>>|<cell|\<cdots\>>>|<row|<cell|-i*\<lambda\><rsub|3,x>>|<cell|-\<lambda\><rsub|4,x>>|<cell|i*\<lambda\><rsub|5,x>>|<cell|\<lambda\><rsub|6,x>>|<cell|\<cdots\>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>>>>>|]><label|eq:ccs_matrix>
  </equation>

  Equation<nbsp><eqref|eq:ccs_matrix> shows that the various entries in the
  correlation matrix evaluated in <math|\<tau\>=0> are related to the
  spectral moments defined in equation<nbsp><eqref|eq:spectral_moment_def>.

  <subsection|Nonstationary Case><label|sec:spectral_nonstationary>

  As has been previously shown, in the stationary case there is a perfect
  duality between the time domain and the frequency one, i.e., in the former
  (see, e.g., equations<nbsp><eqref|eq:stationary_2r>-<eqref|eq:spectral_moment_relation>),
  the spectral moments are variances of analytical processes, while in the
  latter they are moments of the one-sided PSD (see, e.g.,
  equation<nbsp><eqref|eq:spectral_moment_def>). In the nonstationary case,
  the spectral moments of the evolutionary PSD are given as

  <\equation>
    \<lambda\><rsub|j><rsup|\<ast\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|j>*G<rsub|x><around|(|\<omega\>,t|)>*d*\<omega\><label|eq:evolutionary_moments>
  </equation>

  They have the physical meaning of variances of analytical processes only
  for <math|j=0>, as demonstrated in the previous section, as, in fact,
  equation<nbsp><eqref|eq:inequality> demonstrates (for <math|j\<gtr\>0>).

  Strictly speaking, the spectral moments as defined by
  <cite|vanmarcke1972|vanmarcke1975> should be evaluated by means of
  equation<nbsp><eqref|eq:evolutionary_moments>. However, since the spectral
  moments so evaluated do not provide the physical meaning of the variances,
  it seems more appropriate, in the nonstationary case, to calculate them
  using equation<nbsp><eqref|eq:cross_correlation_frequency>, particularized
  for <math|t<rsub|1>=t<rsub|2>=t>. The latter definition is useful for the
  evaluation of the statistics of the response, as will be shown in the next
  section.

  Notice that, using equation<nbsp><eqref|eq:cross_correlation_frequency> for
  <math|t<rsub|1>=t<rsub|2>=t>, no divergences occur in the transient case
  for white process input with <math|j=1>, while, using
  equation<nbsp><eqref|eq:evolutionary_moments>, some divergences without
  physical meaning occur in the transient zone, as demonstrated by
  <cite|corotis1972>. Therefore the CCS matrix in the nonstationary case will
  be a Hermitian one, defined in the following form:

  <\equation>
    <math-bf|R><rsub|m,x><around|(|t,t|)>=\<b-Lambda\><rsub|m,x><around|(|t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|00,x><around|(|t|)>>|<cell|\<lambda\><rsub|01,x><around|(|t|)>>|<cell|\<lambda\><rsub|02,x><around|(|t|)>>|<cell|\<lambda\><rsub|03,x><around|(|t|)>>|<cell|\<cdots\>>>|<row|<cell|\<lambda\><rsub|10,x><around|(|t|)>>|<cell|\<lambda\><rsub|11,x><around|(|t|)>>|<cell|\<lambda\><rsub|12,x><around|(|t|)>>|<cell|\<lambda\><rsub|13,x><around|(|t|)>>|<cell|\<cdots\>>>|<row|<cell|\<lambda\><rsub|20,x><around|(|t|)>>|<cell|\<lambda\><rsub|21,x><around|(|t|)>>|<cell|\<lambda\><rsub|22,x><around|(|t|)>>|<cell|\<lambda\><rsub|23,x><around|(|t|)>>|<cell|\<cdots\>>>|<row|<cell|\<lambda\><rsub|30,x><around|(|t|)>>|<cell|\<lambda\><rsub|31,x><around|(|t|)>>|<cell|\<lambda\><rsub|32,x><around|(|t|)>>|<cell|\<lambda\><rsub|33,x><around|(|t|)>>|<cell|\<cdots\>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>>>>>|]><label|eq:nonstationary_ccs>
  </equation>

  where

  <\equation>
    \<lambda\><rsub|s,v,x><around|(|t|)>=<around|(|-i|)><rsup|s>*p<rsub|s,v,x><around|(|t,t|)><label|eq:nonstationary_moment_def>
  </equation>

  It should be emphasized that in the nonstationary case, two indices are
  necessary in order to define the spectral moments, since in general

  <\equation>
    \<lambda\><rsub|s,v,x><around|(|t|)>\<neq\>\<lambda\><rsub|j,k,x><around|(|t|)>,<space|1em><around|(|s+v=j+k;s\<neq\>j,v\<neq\>k|)><label|eq:nonstationary_inequality>
  </equation>

  However, if <math|m=2>, i.e., <math|\<b-Lambda\><rsub|2,x><around|(|t|)>>
  is a <math|2\<times\>2> matrix, a single index given as the sum of the two
  indices is sufficient to define the CCS matrix in a perfectly clear manner.
  Thus, in this particular case, the <math|\<b-Lambda\><rsub|2,x><around|(|t|)>>
  matrix will be written as

  <\equation>
    \<b-Lambda\><rsub|2,x><around|(|t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|0,x><around|(|t|)>>|<cell|\<lambda\><rsub|1,x><around|(|t|)>>>|<row|<cell|\<lambda\><rsub|1,x><rsup|\<ast\>><around|(|t|)>>|<cell|\<lambda\><rsub|2,x><around|(|t|)>>>>>>|]><label|eq:ccs_2x2>
  </equation>

  Notice that the following inequality:

  <\equation>
    \<lambda\><rsub|1,x><around|(|t|)>\<neq\>\<lambda\><rsub|1,x><rsup|\<ast\>><around|(|t|)><label|eq:lambda_inequality>
  </equation>

  becomes an identity only for discrete sequences of points in the time axis
  <math|t=r*\<pi\>/\<omega\><rsub|D>> (<math|r=0,1,2,\<ldots\>>).

  <section|Mean-Rate Threshold Crossing for Circular
  Barriers><label|sec:threshold_crossing>

  To obtain the statistics of the envelope process, a new vector
  <math|<math-bf|Z><rsub|m><around|(|t|)>> is introduced, whose various
  entries are equal to the effective values of the vector
  <math|<math-bf|X><rsub|m><around|(|t|)>>, i.e.

  <\equation>
    <math-bf|Z><rsub|m><around|(|t|)>=<frac|<math-bf|X><rsub|m><around|(|t|)>|<sqrt|2>><label|eq:effective_vector>
  </equation>

  It follows that the correlation matrix of the vector
  <math|<math-bf|Z><rsub|m><around|(|t|)>> is related to the correlation
  matrix of the vectors <math|<math-bf|X><rsub|m><around|(|t|)>> through

  <\equation>
    <math-bf|R><rsub|m,z><around|(|t<rsub|1>,t<rsub|2>|)>=E<around|[|<math-bf|Z><rsub|m><around|(|t<rsub|1>|)><math-bf|Z><rsub|m><rsup|\<ast\>><around|(|t<rsub|2>|)>|]>=<frac|1|2><math-bf|R><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)><label|eq:correlation_z>
  </equation>

  If <math|f<around|(|t|)>> is a zero-mean Gaussian process, the joint
  probability density function (JPDF) of the vector
  <math|<math-bf|Z><rsub|m><around|(|t|)>> is also Gaussian and can be
  expressed as follows:

  <\equation>
    p<rsub|<math-bf|Z><rsub|m>><around|(|<math-bf|z><rsub|m>;t|)>=<around|(|2*\<pi\>|)><rsup|-m><around|\||\<b-Lambda\><rsub|m,z><around|(|t|)>|\|><rsup|-1>*exp
    <around*|[|-<frac|1|2><math-bf|z><rsub|m><rsup|T><around|(|t|)>*\<b-Lambda\><rsub|m,z><rsup|-1><around|(|t|)><math-bf|z><rsub|m><around|(|t|)>|]><label|eq:jpdf_z>
  </equation>

  where the symbol <math|<around|\||\<cdummy\>|\|>> denotes "determinant of."
  The mean numbers of upcrossings per unit time
  <math|\<nu\><rsub|a><rsup|+><around|(|\<eta\>,t|)>> of the circular barrier
  <math|\<eta\>> of the envelope process <math|a<around|(|t|)>> defined in
  equation<nbsp><eqref|eq:nonstationary_envelope>, following the main
  definitions of <cite|rice1955> and <cite|middleton1960>, can be written in
  the form

  <\equation>
    \<nu\><rsub|a><rsup|+><around|(|\<eta\>,t|)>=<big|int><rsub|0><rsup|\<infty\>>p<rsub|a*<wide|a|\<dot\>>><around|(|\<eta\>,<wide|a|\<dot\>>;t|)>*<wide|a|\<dot\>>*d*<wide|a|\<dot\>><label|eq:upcrossing_rate>
  </equation>

  where <math|p<rsub|a*<wide|a|\<dot\>>><around|(|a,<wide|a|\<dot\>>;t|)>> is
  the JPDF of the envelope and its time differentiation. The latter can be
  computed as follows:

  <\equation>
    p<rsub|a*<wide|a|\<dot\>>><around|(|a,<wide|a|\<dot\>>;t|)>=<big|int><rsub|0><rsup|2*\<pi\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|a*<wide|a|\<dot\>>*\<vartheta\>*<wide|\<vartheta\>|\<dot\>>><around|(|a,<wide|a|\<dot\>>,\<vartheta\>,<wide|\<vartheta\>|\<dot\>>;t|)>*d*\<vartheta\>*d*<wide|\<vartheta\>|\<dot\>><label|eq:jpdf_marginal>
  </equation>

  where the integrand JPDF in equation<nbsp><eqref|eq:jpdf_marginal> can be
  computed by using the coordinate transformation given in
  equation<nbsp><eqref|eq:polar>, namely

  <\equation>
    p<rsub|a*<wide|a|\<dot\>>*\<vartheta\>*<wide|\<vartheta\>|\<dot\>>><around|(|a,<wide|a|\<dot\>>,\<vartheta\>,<wide|\<vartheta\>|\<dot\>>;t|)>=<around|\||J|\|>*p<rsub|<math-bf|Z><rsub|2>><around|(|<math-bf|z><rsub|2>;t|)><label|eq:jacobian_transform>
  </equation>

  where

  <\equation>
    <around|\||J|\|>=a<rsup|2><around|(|t|)><label|eq:jacobian>
  </equation>

  is the Jacobian of the transformation; and
  <math|p<rsub|<math-bf|Z><rsub|2>><around|(|<math-bf|z><rsub|2>;t|)>> can be
  obtained by putting <math|m=2> in equation<nbsp><eqref|eq:jpdf_z>, in which
  the matrix <math|\<b-Lambda\><rsub|2,z><around|(|t|)>> and its inverse are
  given as

  <\equation>
    \<b-Lambda\><rsub|2,z><around|(|t|)>=<frac|1|2><around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|0,x><around|(|t|)>>|<cell|\<lambda\><rsub|1,x><around|(|t|)>>>|<row|<cell|\<lambda\><rsub|1,x><rsup|\<ast\>><around|(|t|)>>|<cell|\<lambda\><rsub|2,x><around|(|t|)>>>>>>|]><label|eq:lambda_2z>
  </equation>

  and

  <\equation>
    \<b-Lambda\><rsub|2,z><rsup|-1><around|(|t|)>=<frac|2|<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>><around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|2,x><around|(|t|)>>|<cell|-\<lambda\><rsub|1,x><around|(|t|)>>>|<row|<cell|-\<lambda\><rsub|1,x><rsup|\<ast\>><around|(|t|)>>|<cell|\<lambda\><rsub|0,x><around|(|t|)>>>>>>|]><label|eq:lambda_2z_inverse>
  </equation>

  The determinant <math|<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>
  is given as

  <\equation>
    <around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>=<frac|1|4>*<around|[|\<lambda\><rsub|0,x><around|(|t|)>*\<lambda\><rsub|2,x><around|(|t|)>-<around|\||\<lambda\><rsub|1,x><around|(|t|)>|\|><rsup|2>|]>=<frac|1|4>*\<lambda\><rsub|0,x><around|(|t|)>*\<lambda\><rsub|2,x><around|(|t|)>*q<rsub|z><rsup|2><around|(|t|)><label|eq:determinant_lambda>
  </equation>

  where

  <\equation>
    q<rsub|z><rsup|2><around|(|t|)>=1-<frac|<around|\||\<lambda\><rsub|1,x><around|(|t|)>|\|><rsup|2>|\<lambda\><rsub|0,x><around|(|t|)>*\<lambda\><rsub|2,x><around|(|t|)>><label|eq:qz_definition>
  </equation>

  In the stationary case, <math|q<rsub|z>> is the well-known band-width
  parameter <cite|vanmarcke1972>. Notice that only when
  <math|<math-up|Im><around|[|\<lambda\><rsub|1,x><around|(|t|)>|]>> is
  negligible does <math|q<rsub|z><around|(|t|)>> coincide with the
  time-dependent spectral density-function shape parameter defined by
  <cite|corotis1972>.

  After some algebra, the JPDF function defined in
  equation<nbsp><eqref|eq:jacobian_transform> can be written, in an explicit
  form, as follows:

  <\equation>
    p<rsub|a*<wide|a|\<dot\>>*\<vartheta\>*<wide|\<vartheta\>|\<dot\>>><around|(|a,<wide|a|\<dot\>>,\<vartheta\>,<wide|\<vartheta\>|\<dot\>>;t|)>=<frac|4*\<pi\><rsup|2>*a<rsup|2><around|(|t|)>|<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>*exp
    <around*|[|-<frac|<around*|(|\<lambda\><rsub|2,x><around|(|t|)>*a<rsup|2><around|(|t|)>+\<lambda\><rsub|0,x><around|(|t|)>*<wide|a|\<dot\>><rsup|2><around|(|t|)>-2<math-up|Re><around|[|\<lambda\><rsub|1,x><around|(|t|)>|]>*a<around|(|t|)>*<wide|a|\<dot\>><around|(|t|)>|)>|2<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>*|]><label|eq:jpdf_explicit>
  </equation>

  where the variables <math|<wide|\<vartheta\>|\<dot\>><around|(|t|)>> and
  <math|\<vartheta\><around|(|t|)>> are defined in the range
  <math|-\<infty\>\<leq\><wide|\<vartheta\>|\<dot\>>\<leq\>\<infty\>>,
  equation<nbsp><eqref|eq:jpdf_explicit> shows that
  <math|\<vartheta\><around|(|t|)>> is uniformly distributed in the range
  <math|0>-<math|2*\<pi\>>, and that <math|a<around|(|t|)>> and
  <math|<wide|a|\<dot\>><around|(|t|)>> are not independent. Instead, they
  are independent in the corresponding stationary case, in which
  <math|<math-up|Im><around|[|\<lambda\><rsub|1,x><around|(|t|)>|]>=0>.

  Once the JPDF function is evaluated, it is a very simple matter to derive
  the marginal probability density functions
  <math|p<rsub|a*<wide|a|\<dot\>>><around|(|a,<wide|a|\<dot\>>;t|)>> and
  <math|p<rsub|a><around|(|a;t|)>> (see also
  equation<nbsp><eqref|eq:jpdf_marginal>), which take on the following forms,
  respectively:

  <\equation>
    p<rsub|a*<wide|a|\<dot\>>><around|(|a,<wide|a|\<dot\>>;t|)>=<frac|a<around|(|t|)>exp
    <around*|[|-<frac|<around*|(|\<lambda\><rsub|0,x><around|(|t|)>*\<lambda\><rsub|2,x><around|(|t|)>*a<rsup|2><around|(|t|)>-2<math-up|Re><around|[|\<lambda\><rsub|1,x><around|(|t|)>|]>*a<around|(|t|)>*<wide|a|\<dot\>><around|(|t|)>+\<lambda\><rsub|0,x><around|(|t|)>*<wide|a|\<dot\>><rsup|2><around|(|t|)>|)>|2<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>*|]>|<around|[|2*\<pi\>*\<lambda\><rsub|0,x><around|(|t|)><around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>|]><rsup|1/2>>*<label|eq:marginal_aa_dot>
  </equation>

  <\equation>
    p<rsub|a><around|(|a;t|)>=<frac|a<around|(|t|)>|\<lambda\><rsub|0,x><around|(|t|)>>*exp
    <around*|(|-<frac|a<rsup|2><around|(|t|)>|2*\<lambda\><rsub|0,x><around|(|t|)>>|)><label|eq:marginal_a>
  </equation>

  The mean number of upcrossings per unit time
  <math|\<nu\><rsub|a><rsup|+><around|(|\<eta\>,t|)>> is obtained by
  substituting equation<nbsp><eqref|eq:marginal_aa_dot> into
  equation<nbsp><eqref|eq:upcrossing_rate> as follows:

  <\equation>
    \<nu\><rsub|a><rsup|+><around|(|\<eta\>,t|)>=<frac|1|<sqrt|2*\<pi\>>>*<sqrt|<frac|\<lambda\><rsub|2,x><around|(|t|)>|<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>>*exp
    <around*|(|-<frac|\<eta\><rsup|2>|2*\<lambda\><rsub|0,x><around|(|t|)>>|)>*<around*|[|1+\<Phi\><around*|(|<frac|<math-up|Im><around|[|\<lambda\><rsub|1,x><around|(|t|)>|]>*\<eta\>|<sqrt|2*\<lambda\><rsub|0,x><around|(|t|)><around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>>|)>|]><label|eq:upcrossing_final>
  </equation>

  where <math|\<Phi\><around|(|\<xi\>|)>> is the widely known error function

  <\equation>
    \<Phi\><around|(|\<xi\>|)>=<frac|2|<sqrt|\<pi\>>>*<big|int><rsub|0><rsup|\<xi\>>e<rsup|-\<rho\><rsup|2>>*d*\<rho\><label|eq:error_function>
  </equation>

  Notice that equation<nbsp><eqref|eq:upcrossing_final> gives an exact
  solution in the nonstationary case of the mean-rate threshold upcrossing
  for circular barriers and that the greatest computational effort in
  evaluating <math|\<nu\><rsub|a><rsup|+><around|(|\<eta\>;t|)>> is in the
  computation of nonstationary spectral moments.

  In the stationary case, since <math|<math-up|Im><around|[|\<lambda\><rsub|1,x><around|(|t|)>|]>=0>,
  equation<nbsp><eqref|eq:upcrossing_final> becomes

  <\equation>
    \<nu\><rsub|a><rsup|+><around|(|\<eta\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<sqrt|<frac|\<lambda\><rsub|2,x>|\<lambda\><rsub|0,x>>>*exp
    <around*|(|-<frac|\<eta\><rsup|2>|2*\<lambda\><rsub|0,x>>|)><label|eq:stationary_upcrossing>
  </equation>

  and coincides with the well-known mean-rate upcrossings given by
  <cite|cramer1967> for circular barriers.

  It is worth noting that, by introducing the complex processes instead of
  the real ones, the exact JPDF given in equations<nbsp><eqref|eq:jpdf_explicit>
  and<nbsp><eqref|eq:marginal_aa_dot> and the exact mean-rate upcrossings
  given in equation<nbsp><eqref|eq:upcrossing_final> have been obtained,
  while only approximate expressions are available in the literature.

  <section|First-Passage Probability><label|sec:first_passage>

  In this section, as an application of complex processes, the first-passage
  probability following the Poisson and the Markov assumptions is evaluated.

  To this purpose, let us consider the nonstationary zero-mean narrow-band
  Gaussian response process <math|z<around|(|t|)>=x<around|(|t|)>/<sqrt|2>>.
  <math|x<around|(|t|)>> is defined in equation<nbsp><eqref|eq:nonstationary_output>
  as an output process of a lightly damped oscillator excited by the process
  <math|f<around|(|t|)>/<sqrt|2>>, which is defined in
  equation<nbsp><eqref|eq:nonstationary_input>. The PSD of
  <math|n<around|(|t|)>> is fairly broad. Let its mean circular frequency
  <math|\<omega\><rsub|a><around|(|t|)>> be in the form

  <\equation>
    \<omega\><rsub|a><around|(|t|)>=<sqrt|<frac|\<lambda\><rsub|2,x><around|(|t|)>|\<lambda\><rsub|0,x><around|(|t|)>>><label|eq:mean_frequency>
  </equation>

  It follows from the narrow-band character of the process that the peak and
  trough of the real part of the process <math|z<around|(|t|)>> are almost
  uniformly spaced at intervals <math|\<Delta\>*t<around|(|t|)>=\<pi\>/\<omega\><rsub|a><around|(|t|)>>.
  To simplify matters, hereafter we will suppose that
  <math|\<Delta\>*t<around|(|t|)>> is almost constant, i.e.

  <\equation>
    \<Delta\>*t<around|(|t|)>=\<Delta\>*t,<space|1em>\<forall\>t<label|eq:constant_interval>
  </equation>

  Equation<nbsp><eqref|eq:constant_interval> holds true in the stationary
  case, and, excluding some transient zones, can be considered sufficiently
  accurate even in the nonstationary case.

  Let <math|\<eta\>> be the threshold level of the real part of
  <math|z<around|(|t|)>> and <math|Y<around|(|t<rsub|n>|)>> be the discrete
  point process (<math|t<rsub|n>=n*\<Delta\>*t>) of the peaks and troughs of
  the real part of <math|z<around|(|t|)>>. Then the failure rate
  <math|b<around|(|t<rsub|n>|)>>\Vnamely, the probability that the absolute
  value of <math|Y<around|(|t<rsub|n>|)>> will exit from the safe domain in
  the <math|n>th half cycle, conditioned by the fact that no threshold
  crossing has occurred before <cite|yang1971>\Vis given as

  <\equation>
    b<around|(|t<rsub|n>|)>=<text|Prob><around*|{|<around|\||Y<around|(|t<rsub|n>|)>|\|>\<geq\>\<eta\>*<around*|\||<big|cap><rsub|j=1><rsup|n-1><around|\||Y<around|(|t<rsub|j>|)>|\|>\<less\>\<eta\>|\<nobracket\>>|}><label|eq:failure_rate>
  </equation>

  Based on the observation that the envelope process, in the narrow-band
  response process, has a peak distribution that can be approximated by the
  distribution of the envelope process at times separated by
  <math|\<Delta\>*t>, equation<nbsp><eqref|eq:failure_rate> can be rewritten
  in the form

  <\equation>
    b<around|(|t<rsub|n>|)>=<text|Prob><around*|{|a<around|(|t<rsub|n>|)>\<geq\>\<eta\>*<around*|\||<big|cap><rsub|j=1><rsup|n-1>a<around|(|t<rsub|j>|)>\<less\>\<eta\>|\<nobracket\>>|}><label|eq:failure_rate_envelope>
  </equation>

  Once <math|b<around|(|t<rsub|n>|)>> is evaluated, the probability that the
  first excursion of <math|a<around|(|t<rsub|n>|)>>,
  <math|L<around|(|t<rsub|n>,\<eta\>|)>> will occur in the first <math|n>
  half cycles is given in the well-known form
  <cite|krenk1979|naess1983|naess1984|preumont1985|yang1971>

  <\equation>
    L<around|(|t<rsub|n>,\<eta\>|)>=1-<big|prod><rsub|j=1><rsup|n><around|[|1-b<around|(|t<rsub|j>|)>|]><label|eq:first_excursion>
  </equation>

  in which it is assumed that the probability of no excursion at <math|t=0>
  is one. For <math|b<around|(|t<rsub|j>|)>\<ll\>1> and for large values of
  <math|n>, equation<nbsp><eqref|eq:first_excursion> can be approximated in
  the form <cite|yang1971>

  <\equation>
    L<around|(|t<rsub|n>,\<eta\>|)>=1-exp
    <around*|(|-<big|sum><rsub|j=1><rsup|n>b<around|(|t<rsub|j>|)>|)>*<space|1em><around|(|t<rsub|j>=j*\<Delta\>*t|)><label|eq:first_excursion_approx>
  </equation>

  To obtain the unknown failure rate <math|b<around|(|t<rsub|j>|)>>, which
  appears in equation<nbsp><eqref|eq:first_excursion_approx>, the Poisson and
  Markov assumptions are usually made in the literature.

  In the Poisson assumption, the successive extrema
  <math|Y<around|(|t<rsub|j>|)>> are considered independent, and it is easily
  shown that the failure rate <math|b<around|(|t<rsub|j>|)>> can be written
  as

  <\equation>
    b<around|(|t<rsub|j>|)>=<text|Prob><around|{|a<around|(|t<rsub|j>|)>\<geq\>\<eta\>|}>=q<rsub|0><around|(|t<rsub|j>|)><label|eq:poisson_failure>
  </equation>

  where

  <\equation>
    q<rsub|0><around|(|t<rsub|j>|)>=<big|int><rsub|\<eta\>><rsup|\<infty\>>p<rsub|a><around|(|a;t<rsub|j>|)>*d*a=exp
    <around*|(|-<frac|\<eta\><rsup|2>|2*\<lambda\><rsub|0,x><around|(|t<rsub|j>|)>>|)><label|eq:q0>
  </equation>

  In the one-step memory Markov assumption, the conditional probability
  distribution of an extremum depends only on the previous extremum at a time
  separated by <math|\<Delta\>*t>; it follows that
  <math|b<around|(|t<rsub|j>|)>> is given as

  <\equation>
    b<around|(|t<rsub|j>|)>=<text|Prob><around|{|a<rsub|2>\<geq\>\<eta\>\|a<rsub|1>\<less\>\<eta\>|}>=<frac|<text|Prob><around|{|a<rsub|2>\<geq\>\<eta\>,a<rsub|1>\<less\>\<eta\>|}>|<text|Prob><around|{|a<rsub|1>\<less\>\<eta\>|}>>=<frac|q<around|(|t<rsub|j>,\<Delta\>*t|)>|1-q<rsub|0>*<around|(|t<rsub|j>-\<Delta\>*t|)>><label|eq:markov_failure>
  </equation>

  where <math|a<rsub|1>=a*<around|(|t<rsub|j>-\<Delta\>*t|)>> and
  <math|a<rsub|2>=a<around|(|t<rsub|j>|)>> are the values of the envelope
  function evaluated at times <math|t<rsub|j>-\<Delta\>*t> and
  <math|t<rsub|j>>, respectively. Further, since

  <\equation>
    <text|Prob><around|{|a<rsub|1>\<less\>\<eta\>|}>=1-<big|int><rsub|\<eta\>><rsup|\<infty\>>p<rsub|a><around|(|a;t<rsub|j>-\<Delta\>*t|)>*d*a=1-q<rsub|0>*<around|(|t<rsub|j>-\<Delta\>*t|)><label|eq:prob_a1>
  </equation>

  and

  <\equation>
    <text|Prob><around|{|a<rsub|2>\<geq\>\<eta\>,a<rsub|1>\<less\>\<eta\>|}>=q<around|(|t<rsub|j>,\<Delta\>*t|)>=<big|int><rsub|0><rsup|\<eta\>>d*a<rsub|1>*<big|int><rsub|\<eta\>><rsup|\<infty\>>p<rsub|a<rsub|1>*a<rsub|2>><around|(|a<rsub|1>,a<rsub|2>;t<rsub|j>,\<Delta\>*t|)>*d*a<rsub|2><label|eq:prob_a1a2>
  </equation>

  it follows that

  <\equation>
    b<around|(|t<rsub|j>|)>=<frac|q<around|(|t<rsub|j>,\<Delta\>*t|)>|1-q<rsub|0>*<around|(|t<rsub|j>-\<Delta\>*t|)>><label|eq:markov_b>
  </equation>

  Thus to obtain <math|b<around|(|t<rsub|j>|)>>, the JPDF that appears in
  equation<nbsp><eqref|eq:prob_a1a2> must be evaluated. This function can be
  easily obtained starting from the JPDF of the complex variables
  <math|z<around|(|t<rsub|j>|)>> and <math|z*<around|(|t<rsub|j>-\<Delta\>*t|)>>.

  In general, if a vector <math|<math-bf|Z><rsub|m><around|(|t<rsub|j>,\<Delta\>*t|)>>
  is defined in the form

  <\equation>
    <math-bf|Z><rsub|m><around|(|t<rsub|j>,\<Delta\>*t|)>=<around|[|<math-bf|Z><rsub|m><around|(|t<rsub|j>-\<Delta\>*t|)>,<math-bf|Z><rsub|m><around|(|t<rsub|j>|)>|]><rsup|T><label|eq:vector_combined>
  </equation>

  where the vector <math|<math-bf|Z><rsub|m><around|(|t<rsub|j>|)>> has been
  defined in equation<nbsp><eqref|eq:effective_vector>, the JPDF of the
  vector <math|<math-bf|Z><rsub|m><around|(|t<rsub|j>,\<Delta\>*t|)>> can be
  expressed as

  <\equation>
    p<rsub|<math-bf|Z><rsub|m>><around|[|<math-bf|z><rsub|m><around|(|t<rsub|j>,\<Delta\>*t|)>|]>=<around|(|2*\<pi\>|)><rsup|-2*m><around|\||<math-bf|R><rsub|m,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|><rsup|-1>*exp
    <around*|[|-<frac|1|2><math-bf|z><rsub|m><rsup|T><around|(|t<rsub|j>,\<Delta\>*t|)><math-bf|R><rsub|m,z><rsup|-1><around|(|t<rsub|j>,\<Delta\>*t|)><math-bf|z><rsub|m><around|(|t<rsub|j>,\<Delta\>*t|)>|]><label|eq:jpdf_combined>
  </equation>

  <math|<math-bf|R><rsub|m,z><around|(|t<rsub|j>,\<Delta\>*t|)>> being a
  <math|2*m\<times\>2*m> Hermitian correlation matrix given by

  <\equation>
    <math-bf|R><rsub|m,z><around|(|t<rsub|j>,\<Delta\>*t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|<math-bf|R><rsub|m,z><around|(|t<rsub|j>-\<Delta\>*t,t<rsub|j>-\<Delta\>*t|)>>|<cell|<math-bf|R><rsub|m,z><around|(|t<rsub|j>-\<Delta\>*t,t<rsub|j>|)>>>|<row|<cell|<math-bf|R><rsub|m,z><around|(|t<rsub|j>,t<rsub|j>-\<Delta\>*t|)>>|<cell|<math-bf|R><rsub|m,z><around|(|t<rsub|j>,t<rsub|j>|)>>>>>>|]><label|eq:correlation_block>
  </equation>

  The diagonal block matrices of this equation are the CCS matrices, already
  defined in equation<nbsp><eqref|eq:nonstationary_ccs>, and the nondiagonal
  block matrices are the cross-correlation matrices, already defined in
  equations<nbsp><eqref|eq:correlation_matrix>
  and<nbsp><eqref|eq:cross_correlation_frequency>. Using the following
  coordinate transformation:

  <\equation>
    z<rsub|r><around|(|i|)>=<frac|<frac|d<rsup|r-1>*x<around|(|t|)>|d*t<rsup|r-1>>|<sqrt|2>>*=<frac|a<rsub|r><around|(|t|)>*exp
    <around|[|i*\<vartheta\><rsub|r><around|(|t|)>|]>|<sqrt|2>>*,<space|1em>r=1,2,\<ldots\>,m;<space|1em>i=t<rsub|j>-\<Delta\>*t;<space|1em>t<rsub|j><label|eq:coordinate_transform>
  </equation>

  where <math|z<rsub|r><around|(|i|)>> is the <math|r>th element of vector
  <math|<math-bf|Z><rsub|m><around|(|t|)>>, the JPDF of the envelope, the
  phase, and its time derivatives can be computed, by substituting
  equation<nbsp><eqref|eq:coordinate_transform> into
  equation<nbsp><eqref|eq:jpdf_combined>, multiplied by the Jacobian of the
  transformation.

  Performing the latter operations specialized for <math|m=1> we obtain

  <\equation>
    <with|font-base-size|9|p<rsub|a<rsub|1>*a<rsub|2>*\<vartheta\><rsub|1>*\<vartheta\><rsub|2>><around|(|a<rsub|1>,a<rsub|2>,\<vartheta\><rsub|1>,\<vartheta\><rsub|2>;t<rsub|j>,\<Delta\>*t|)>=<frac|4*\<pi\><rsup|2>*a<rsub|1>*a<rsub|2>|<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>*e<rsup|-<frac|\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)>*a<rsub|1><rsup|2>+\<lambda\><rsub|0,z><around|(|t<rsub|j>|)>*a<rsub|2><rsup|2>-2*a<rsub|1>*a<rsub|2>*r<rsub|0>*cos
    <around|(|\<vartheta\><rsub|2>-\<vartheta\><rsub|1>+\<gamma\>|)>|2<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>*>><label|eq:jpdf_a1a2_explicit>
  </equation>

  where <math|\<vartheta\><rsub|1>=\<vartheta\>*<around|(|t<rsub|j>-\<Delta\>*t|)>>
  and <math|\<vartheta\><rsub|2>=\<vartheta\><around|(|t<rsub|j>|)>> are
  phase processes uniformly distributed in the range
  <math|0>-<math|2*\<pi\>>. <math|r<rsub|0>> and
  <math|<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>
  are given, respectively, as

  <\align>
    <tformat|<table|<row|<cell|r<rsub|0>>|<cell|=<around|\||p<rsub|0,z><around|(|t<rsub|j>-\<Delta\>*t,t<rsub|j>|)>|\|><eq-number><label|eq:r0>>>|<row|<cell|<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>|<cell|=\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)>*\<lambda\><rsub|0,z><around|(|t<rsub|j>|)>-r<rsub|0><rsup|2><eq-number><label|eq:determinant_r>>>>>
  </align>

  and <math|\<gamma\>> as

  <\equation>
    \<gamma\>=tan<rsup|-1><around*|(|<frac|<math-up|Im><around|[|p<rsub|0,z><around|(|t<rsub|j>-\<Delta\>*t,t<rsub|j>|)>|]>|<math-up|Re><around|[|p<rsub|0,z><around|(|t<rsub|j>-\<Delta\>*t,t<rsub|j>|)>|]>>|)><label|eq:gamma_phase>
  </equation>

  It is to be emphasized that <math|r<rsub|0>> is the modulus of the complex
  cross-correlation function <math|p<rsub|0,z><around|(|t<rsub|j>-\<Delta\>*t,t<rsub|j>|)>>
  and that this meaning is evident only when the complex representation of
  stochastic processes is used.

  Integrating equation<nbsp><eqref|eq:jpdf_a1a2_explicit> twice with respect
  to <math|\<vartheta\><rsub|1>> and <math|\<vartheta\><rsub|2>>, the
  marginal JPDF are computed in the form

  <\equation>
    p<rsub|a<rsub|1>*a<rsub|2>><around|(|a<rsub|1>,a<rsub|2>;t<rsub|j>,\<Delta\>*t|)>=<frac|4*\<pi\><rsup|2>*a<rsub|1>*a<rsub|2>|<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>*exp
    <around*|[|-<frac|\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)>*a<rsub|1><rsup|2>+\<lambda\><rsub|0,z><around|(|t<rsub|j>|)>*a<rsub|2><rsup|2>|2<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>|]>*I<rsub|0><around*|(|<frac|a<rsub|1>*a<rsub|2>*r<rsub|0>|<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>|)><label|eq:marginal_jpdf>
  </equation>

  where <math|I<rsub|0><around|(|\<cdummy\>|)>> is the modified Bessel's
  function of order zero.

  Finally, the <math|q<around|(|t<rsub|j>,\<Delta\>*t|)>> can be evaluated by
  the series expansion of the Bessel's function
  <math|I<rsub|0><around|(|\<cdummy\>|)>> in a form that is more suitable for
  numerical evaluation <cite|krenk1979>

  <\equation>
    q<around|(|t<rsub|j>,\<Delta\>*t|)>=<frac|r<rsub|0>|<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>*exp
    <around*|[|-<frac|\<eta\><rsup|2>*<around|[|\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)>+\<lambda\><rsub|0,z><around|(|t<rsub|j>|)>|]>|2<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>|]>+exp
    <around*|(|-<frac|\<eta\><rsup|2>|2*\<lambda\><rsub|0,z><around|(|t<rsub|j>|)>>|)>*\<Phi\><rsub|2><around|(|\<eta\>|)>+exp
    <around*|(|-<frac|\<eta\><rsup|2>|2*\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)>>|)>*\<Phi\><rsub|1><around|(|\<eta\>|)>-exp
    <around*|(|-<frac|\<eta\><rsup|2>|2*\<lambda\><rsub|0,z><around|(|t<rsub|j>|)>>|)>*\<Phi\><rsub|2><around|(|\<eta\>|)>-exp
    <around*|(|-<frac|\<eta\><rsup|2>|2*\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)>>|)>*\<Phi\><rsub|1><around|(|\<eta\>|)><label|eq:q_series>
  </equation>

  where

  <\equation>
    \<Phi\><rsub|i><around|(|\<eta\>|)>=<big|int><rsub|0><rsup|\<eta\>><frac|a<rsub|i>|\<lambda\><rsub|0,z><around|(|t<rsub|i>|)>>*exp
    <around*|(|-<frac|a<rsub|i><rsup|2>|2*\<lambda\><rsub|0,z><around|(|t<rsub|i>|)>>|)>*d*a<rsub|i>*<space|1em><around|(|i=1,2|)><label|eq:phi_integral>
  </equation>

  and

  <\align>
    <tformat|<table|<row|<cell|w<rsub|1>>|<cell|=<frac|r<rsub|0>|<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>*\<lambda\><rsub|0,z><around|(|t<rsub|j>|)><eq-number><label|eq:w1>>>|<row|<cell|w<rsub|2>>|<cell|=<frac|r<rsub|0>|<around|\||<math-bf|R><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>*\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)><eq-number><label|eq:w2>>>>>
  </align>

  Substituting equations<nbsp><eqref|eq:prob_a1> and<nbsp><eqref|eq:q_series>
  into equation<nbsp><eqref|eq:markov_b>, the failure rate
  <math|b<around|(|t<rsub|j>|)>> in the Markov assumption can be computed.

  It is worth noting that equation<nbsp><eqref|eq:q_series> requires that
  only one peak or trough always follow one zero crossing by
  <math|x<around|(|t|)>>, while no hypotheses are made on the coincidence
  between <math|x> and <math|x/\<omega\><rsub|0>>, which holds true only for
  very narrow band processes and, in some cases, gives unacceptable results
  <cite|langley1986>.

  From a computational point of view, since the integral of
  equation<nbsp><eqref|eq:phi_integral> can be evaluated in a very simple
  manner <cite|krenk1979>, the greatest computational effort in the
  computation of <math|b<around|(|t<rsub|j>|)>> consists in the evaluation of
  both the spectral moments and the cross-correlation function, which appear
  in the JPDF of the envelope for nonstationary input. In order to reduce the
  computational effort, an approximate form of the JPDF of the envelope is
  available in the literature <cite|spanos1983>.

  <section|Conclusions><label|sec:conclusions>

  In this paper, it is shown that by introducing the input process, i.e., the
  so-called pre-envelope, as the product of an analytical random stationary
  process by a deterministic shaping function, the nonstationary envelope can
  be defined as the modulus of the complex response process of structural
  systems subjected to such a pre-envelope. It is also shown that the
  introduction of the complex input process, instead of the more familiar
  real one, is essential, not only for the definition of the envelope
  process, but also for the correct definition of the spectral moments in
  both stationary and nonstationary cases.

  Starting from the previous assumption, the cross-correlation function
  matrix of nonstationary processes is obtained as the average of the complex
  output and its time derivatives in linear systems subjected to
  nonstationary pre-envelope. By similar considerations, the spectral moments
  of the output are defined as the cross-covariances of complex processes.
  The latter definition is essential for evaluating the nonstationary
  spectral moments, as, in fact, the moments of the so-called evolutionary
  PSD are not able to evaluate these quantities.

  In the two last sections, the previous definition of the envelope function
  for nonstationary processes is applied in the evaluation of the mean-rate
  threshold crossing for circular barriers and in the first-passage
  probability problem within the framework of complex processes. A more
  satisfactory representation and a clearer vision of the two problems are
  obtained. Moreover, using this procedure, a closed-form solution in the
  nonstationary case is given for the evaluation of the mean-rate threshold
  crossing of circular barriers.

  <section*|Acknowledgments>

  The writer is indebted to Mario Di Paola for his helpful comments and
  valuable suggestions in the theoretical formulation of this paper.

  <section|PSD of Analytic Process><label|app:psd>

  In this appendix, it is shown that the analytic process defined in
  equation<nbsp><eqref|eq:preenvelope> has a one-sided PSD. It can easily be
  shown that the correlation function <math|p<rsub|f><around|(|\<tau\>|)>> of
  this analytic process is given as

  <\equation>
    p<rsub|f><around|(|\<tau\>|)>=E*<around|[|f<around|(|t|)>*f<rsup|\<ast\>>*<around|(|t+\<tau\>|)>|]>=2*<around|[|p<rsub|n><around|(|\<tau\>|)>+i*p<rsub|<wide|n|^>><around|(|\<tau\>|)>|]><label|eq:pf_correlation>
  </equation>

  <math|p<rsub|n><around|(|\<tau\>|)>> and
  <math|p<rsub|<wide|n|^>><around|(|\<tau\>|)>> are defined in the text after
  equation<nbsp><eqref|eq:gamma>. Making the Fourier transform of
  equation<nbsp><eqref|eq:pf_correlation>, we obtain the PSD of
  <math|f<around|(|t|)>>, according to the Wiener-Kinchine theorem:

  <\equation>
    G<rsub|f><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|f><around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>=2*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>+2*i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|<wide|n|^>><around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\><label|eq:gf_fourier>
  </equation>

  Using the property of the Fourier transform of the Hilbert transform of
  <math|p<rsub|n><around|(|\<tau\>|)>>, i.e. <cite|papoulis1984>

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|<wide|n|^>><around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>=-i<text|sgn><around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)><label|eq:hilbert_fourier>
  </equation>

  where sgn<math|<around|(|\<omega\>|)>> is the signum function. Substituting
  this equation into equation<nbsp><eqref|eq:gf_fourier> we obtain

  <\equation>
    G<rsub|f><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|f><around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>=4*U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>=2*U<around|(|\<omega\>|)>*<wide|G|\<bar\>><rsub|f><around|(|\<omega\>|)><label|eq:gf_final>
  </equation>

  Thus the analytic process defined in equation<nbsp><eqref|eq:preenvelope>
  exhibits power only in the positive frequency range.

  <section|Notation><label|app:notation>

  The following symbols are used in this paper:

  <\description>
    <item*|<math|a<around|(|t|)>>>stationary and nonstationary envelope
    process;

    <item*|<math|<wide|a|\<dot\>><around|(|t|)>>>time differentiation of
    envelope process;

    <item*|<math|b<around|(|t<rsub|n>|)>>>failure rate;

    <item*|<math|E<around|[|\<cdummy\>|]>>>stochastic average of;

    <item*|<math|F<around|(|t|)>>>deterministic shaping function;

    <item*|<math|f<around|(|t|)>>>stochastic complex zero mean input process;

    <item*|<math|G<rsub|f><around|(|\<omega\>|)>>>one-sided PSD of complex
    input process <math|f<around|(|t|)>>;

    <item*|<math|G<rsub|n><around|(|\<omega\>|)>>>two-sided PSD of real input
    process <math|n<around|(|t|)>>;

    <item*|<math|G<rsub|x><around|(|\<omega\>|)>>>one-sided PSD of complex
    output process <math|x<around|(|t|)>>;

    <item*|<math|G<rsub|x><around|(|\<omega\>,t|)>>>so-called one-sided
    evolutionary PSD;

    <item*|<math|g<around|(|\<tau\>|)>>>deterministic function defined in
    equation<nbsp><eqref|eq:g_function>;

    <item*|<math|H<around|(|\<omega\>|)>>>transfer function in terms of
    displacements;

    <item*|<math|H<around|[|\<cdummy\>|]>>>Hilbert transform of;

    <item*|<math|h<around|(|\<tau\>|)>>>impulse response function;

    <item*|<math|I<rsub|0><around|(|\<cdummy\>|)>>>modified Bessel function
    of order zero;

    <item*|<math|<math-up|Im><around|[|\<cdummy\>|]>>>imaginary part of;

    <item*|<math|<around|\||J|\|>>>Jacobian of transformation;

    <item*|<math|K<rsub|r><around|(|\<omega\>,t|)>>>truncated Fourier
    transform of product defined in equation<nbsp><eqref|eq:k_function>;

    <item*|<math|K<rsub|r><around|(|\<omega\>,\<infty\>|)>>>transfer function
    in terms of the <math|r>th derivative of displacements;

    <item*|<math|L<around|(|t<rsub|n>,\<eta\>|)>>>first excursion probability
    of the envelope process;

    <item*|<math|n<around|(|t|)>>>stationary real zero mean input process;

    <item*|<math|<wide|n|^><around|(|t|)>>>Hilbert transform of
    <math|n<around|(|t|)>>;

    <item*|<math|p<rsub|a><around|(|a;t|)>>>probability density function of
    envelope;

    <item*|<math|p<rsub|a*<wide|a|\<dot\>>><around|(|a,<wide|a|\<dot\>>;t|)>>>joint
    probability density function of envelope and its time derivative;

    <item*|<math|p<rsub|a*<wide|a|\<dot\>>*\<vartheta\>*<wide|\<vartheta\>|\<dot\>>><around|(|a,<wide|a|\<dot\>>,\<vartheta\>,<wide|\<vartheta\>|\<dot\>>;t|)>>>joint
    probability density function of envelope, its time derivative, phase, and
    phase derivative;

    <item*|<math|p<rsub|a<rsub|1>*a<rsub|2>><around|(|a<rsub|1>,a<rsub|2>;t<rsub|j>,\<Delta\>*t|)>>>joint
    probability density function of envelope at two time points;

    <item*|<math|p<rsub|a<rsub|1>*a<rsub|2>*\<vartheta\><rsub|1>*\<vartheta\><rsub|2>><around|(|a<rsub|1>,a<rsub|2>,\<vartheta\><rsub|1>,\<vartheta\><rsub|2>;t<rsub|j>,\<Delta\>*t|)>>>joint
    probability density function of envelope and phase at two time points;

    <item*|<math|p<rsub|f><around|(|\<tau\>|)>>>correlation function of
    analytical process <math|f<around|(|t|)>>;

    <item*|<math|p<rsub|n><around|(|\<gamma\>|)>>>autocorrelation function of
    stationary process <math|n<around|(|t|)>>;

    <item*|<math|p<rsub|<wide|n|^>><around|(|\<gamma\>|)>>>autocorrelation
    function of the Hilbert transform of <math|n<around|(|t|)>>;

    <item*|<math|p<rsub|s,v,x><around|(|t<rsub|1>,t<rsub|2>|)>>><math|<around|(|s,v|)>>th
    entry of the cross-correlation matrix
    <math|<math-bf|R><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)>>;

    <item*|<math|p<rsub|<math-bf|Z><rsub|m>><around|(|<math-bf|z><rsub|m>;t|)>>>joint
    probability density function of vector
    <math|<math-bf|Z><rsub|m><around|(|t|)>>;

    <item*|<math|<math-bf|R><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)>>>cross-correlation
    matrix of vector <math|<math-bf|X><rsub|m><around|(|t<rsub|1>|)>> and
    <math|<math-bf|X><rsub|m><around|(|t<rsub|2>|)>>;

    <item*|<math|<math-bf|R><rsub|m,z><around|(|t<rsub|1>,t<rsub|2>|)>>>cross-correlation
    matrix of vector <math|<math-bf|Z><rsub|m><around|(|t<rsub|1>|)>> and
    <math|<math-bf|Z><rsub|m><around|(|t<rsub|2>|)>>;

    <item*|<math|<math-bf|R><rsub|m,z><around|(|t<rsub|j>,\<Delta\>*t|)>>><math|2*m\<times\>2*m>
    Hermitian correlation matrix for vector
    <math|<math-bf|Z><rsub|m><around|(|t<rsub|j>,\<Delta\>*t|)>>;

    <item*|<math|<math-up|Re><around|[|\<cdummy\>|]>>>real part of;

    <item*|<math|U<around|(|\<omega\>|)>>>Heaviside's function;

    <item*|<math|<math-bf|X><rsub|m><around|(|t|)>>>complex vector of order
    <math|m>, whose elements are <math|x<around|(|t|)>> and its time
    derivatives;

    <item*|<math|x<around|(|t|)>>>complex zero mean output process;

    <item*|<math|Y<around|(|t<rsub|n>|)>>>process of peaks and troughs of
    real part of <math|z<around|(|t|)>>;

    <item*|<math|y<around|(|t|)>;<wide|y|^><around|(|t|)>;<wide|y|~><around|(|t|)>>>different
    real zero mean output processes;

    <item*|<math|<math-bf|Z><rsub|m><around|(|t|)>>>effective value of
    complex output vector <math|<math-bf|X><rsub|m><around|(|t|)>>;

    <item*|<math|<math-bf|Z><rsub|m><around|(|t<rsub|j>,\<Delta\>*t|)>>>concatenated
    vector <math|<around|[|<math-bf|Z><rsub|m><around|(|t<rsub|j>-\<Delta\>*t|)>,<math-bf|Z><rsub|m><around|(|t<rsub|j>|)>|]><rsup|T>>;

    <item*|<math|z<around|(|t|)>>>effective value of complex zero mean output
    process <math|x<around|(|t|)>>;

    <item*|<math|\<alpha\><rsub|r>,\<beta\><rsub|r>>>recursive coefficients
    as defined in equations<nbsp><eqref|eq:alpha_recursion>-<eqref|eq:beta_initial>;

    <item*|<math|\<delta\><around|(|\<tau\>|)>>>Dirac's delta function;

    <item*|<math|\<zeta\>>>damping ratio;

    <item*|<math|\<eta\>>>cylindrical (circular) barrier threshold;

    <item*|<math|\<vartheta\><around|(|t|)>>>phase process;

    <item*|<math|\<lambda\><rsub|j,x><around|(|t|)>>>stationary and
    nonstationary <math|j>th spectral moment;

    <item*|<math|\<lambda\><rsub|j><rsup|\<ast\>><around|(|t|)>>><math|j>th
    moment of evolutionary PSD;

    <item*|<math|\<lambda\><rsub|s,v,x><around|(|t|)>>>nonstationary spectral
    moment with two indices;

    <item*|<math|\<b-Lambda\><rsub|m,x><around|(|t|)>>>cross-covariance
    spectral matrix of order <math|m> for process <math|x<around|(|t|)>>;

    <item*|<math|\<b-Lambda\><rsub|m,z><around|(|t|)>>>cross-covariance
    spectral matrix of order <math|m> for process <math|z<around|(|t|)>>;

    <item*|<math|\<nu\><rsub|a><rsup|+><around|(|\<eta\>,t|)>>>mean number of
    upcrossings per unit time of circular barrier <math|\<eta\>>;

    <item*|<math|\<omega\><rsub|0>>>natural radian frequency;

    <item*|<math|\<omega\><rsub|D>>>damped natural frequency,
    <math|\<omega\><rsub|D>=\<omega\><rsub|0>*<sqrt|1-\<zeta\><rsup|2>>>;

    <item*|<math|\<omega\><rsub|a><around|(|t|)>>>mean circular frequency of
    the process;

    <item*|sgn<math|<around|(|\<omega\>|)>>>sign function;

    <item*|<math|<around|\||\<cdummy\>|\|>>>determinant (for matrices) or
    modulus (for complex numbers);

    <item*|<math|I<rsub|0><around|(|\<cdummy\>|)>>>modified Bessel function
    of order zero;

    <item*|<math|\<Phi\><around|(|\<cdummy\>|)>>>error function;

    <item*|<math|\<Phi\><rsub|i><around|(|\<eta\>|)>>>integral functions as
    defined in equation<nbsp><eqref|eq:phi_integral>;

    <item*|<math|q<rsub|z><around|(|t|)>>>time-dependent spectral
    density-function shape parameter;

    <item*|<math|q<rsub|0><around|(|t<rsub|j>|)>>>probability function as
    defined in equation<nbsp><eqref|eq:q0>;

    <item*|<math|q<around|(|t<rsub|j>,\<Delta\>*t|)>>>probability function as
    defined in equation<nbsp><eqref|eq:q_series>;

    <item*|<math|r<rsub|0>>>modulus of the complex cross-correlation
    function;

    <item*|<math|\<gamma\>>>argument for autocorrelation functions and phase
    difference;

    <item*|<math|w<rsub|1>,w<rsub|2>>>auxiliary variables for integral
    evaluation as defined in equations<nbsp><eqref|eq:w1>-<eqref|eq:w2>;
  </description>

  <\thebibliography|99>
    <bibitem|arens1957>Arens, R. (1957). Complex processes for envelopes of
    normal noise. <with|font-shape|italic|IRE Trans. on Information Theory>,
    3, 204-207.

    <bibitem|borino1988>Borino, G., Di Paola, M., and Muscolino, G. (1988).
    Non-stationary spectral moments of base excited MDOF systems. (in press).

    <bibitem|corotis1977>Corotis, R. B., and Marshall, A. (1977). Oscillator
    response to modulated random excitation. <with|font-shape|italic|J.
    Engrg. Mech. Div.>, ASCE, 103(4), 501-513.

    <bibitem|corotis1972>Corotis, R. B., Vanmarcke, E. H., and Cornell, C. A.
    (1972). First passage of non-stationary random processes.
    <with|font-shape|italic|J. Engrg. Mech. Div.>, ASCE, 98(2), 401-414.

    <bibitem|cramer1967>Cramer, H., and Leadbetter, M. R. (1967).
    <with|font-shape|italic|Stationary and related stochastic processes>.
    John Wiley and Sons, Inc., New York, N.Y.

    <bibitem|dipaola1985>Di Paola, M. (1985). Transient spectral moments of
    linear systems. <with|font-shape|italic|SM Archives>, 10, 225-243.

    <bibitem|dipaola1985b>Di Paola, M., and Muscolino, G. (1985). Response
    maxima of a SDOF system under seismic action. <with|font-shape|italic|J.
    Struct. Engrg.>, ASCE, 111(9), 2033-2045.

    <bibitem|dipaola1986>Di Paola, M., and Muscolino, G. (1986). On the
    convergent part of high spectral moments for stationary structural
    response. <with|font-shape|italic|J. Sound Vib.>, 110(2), 233-245.

    <bibitem|dugundji1958>Dugundji, J. (1958). Envelope and pre-envelopes of
    real waveforms. <with|font-shape|italic|IRE Trans. on Information
    Theory>, 4, 53-57.

    <bibitem|grossmayer1977>Grossmayer, R. (1977). A seismic reliability and
    first passage failure. <with|font-shape|italic|Random excitation of
    structures by earthquake and atmospheric turbulence>, CISM Courses and
    Lectures 225, H. Parkus, ed., Springer-Verlag, Wien-New York, 110-200.

    <bibitem|krenk1979>Krenk, S. (1979). Non-stationary narrow-band response
    and first passage probability. <with|font-shape|italic|J. Appl. Mech.>,
    ASME, 46, 919-924.

    <bibitem|krenk1981>Krenk, S., Madsen, H. O., and Madsen, P. H. (1981).
    Stationary and transient response envelopes. <with|font-shape|italic|J.
    Engrg. Mech. Div.>, ASCE, 109(1), 263-277.

    <bibitem|langley1986>Langley, R. S. (1986). On various definitions of the
    envelope of a random process. <with|font-shape|italic|J. Sound Vib.>,
    105(3), 503-512.

    <bibitem|lutes1978>Lutes, L. D., Chen, Y.-T. T., and Tzuang, S.-H.
    (1978). First-passage approximations for simple oscillators.
    <with|font-shape|italic|J. Engrg. Mech. Div.>, ASCE, 106(6), 1111-1124.

    <bibitem|middleton1960>Middleton, D. (1960). <with|font-shape|italic|An
    introduction to statistical communication theory>. McGraw-Hill, Inc., New
    York, N.Y.

    <bibitem|naess1983>Naess, A. (1983). Extreme values of a stochastic
    process whose peak values are subjected to the Markov chain condition.
    <with|font-shape|italic|Norwegian Maritime Res.>, 11, 29-37.

    <bibitem|naess1984>Naess, A. (1984). The effect of the Markov chain
    condition on the prediction of extreme values. <with|font-shape|italic|J.
    Sound Vib.>, 94(1), 87-103.

    <bibitem|nigam1982>Nigam, N. C. (1982). Phase properties of a class of
    random processes. <with|font-shape|italic|Earthquake Engrg. Struct.
    Dyn.>, 10, 711-717.

    <bibitem|papoulis1984>Papoulis, A. (1984). <with|font-shape|italic|Signal
    Analysis>. McGraw-Hill, Inc., New York, N.Y.

    <bibitem|preumont1985>Preumont, A. (1985). On the peak factor of
    stationary Gaussian process. <with|font-shape|italic|J. Sound Vib.>,
    100(1), 15-34.

    <bibitem|priestley1967>Priestley, M. B. (1967). Power spectral analysis
    of non-stationary random processes. <with|font-shape|italic|J. Sound
    Vib.>, 6, 86-87.

    <bibitem|rice1955>Rice, S. O. (1955). Mathematical analysis of random
    noise. <with|font-shape|italic|Selected papers on noise and stochastic
    processes>, N. Wax, ed., Dover Publications, Inc., New York, N.Y.

    <bibitem|spanos1983>Spanos, P. T. D., and Solomos, G. P. (1983). Markov
    approximation to transient vibration. <with|font-shape|italic|J. Engrg.
    Mech. Div.>, ASCE, 109(4), 1134-1150.

    <bibitem|vanmarcke1972>Vanmarcke, E. H. (1972). Properties of spectral
    moments with applications to random vibration. <with|font-shape|italic|J.
    Engrg. Mech. Div.>, ASCE, 98(2), 425-446.

    <bibitem|vanmarcke1975>Vanmarcke, E. H. (1975). On the distribution of
    the first-passage time for normal stationary random processes.
    <with|font-shape|italic|J. Appl. Mech.>, ASME, 42, 215-220.

    <bibitem|yang1972>Yang, J.-N. (1972). Non-Stationary envelope process and
    first excursion probability. <with|font-shape|italic|J. Struct. Mech.>,
    1, 231-248.

    <bibitem|yang1971>Yang, J.-N., and Shinozuka, M. (1971). On the first
    excursion probability in stationary narrow-band random vibration.
    <with|font-shape|italic|J. Appl. Mech.>, ASME, 38, 1017-1022.
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
    <associate|app:notation|<tuple|9|17|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|app:psd|<tuple|8|16|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-1|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-10|<tuple|5|10|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-11|<tuple|6|12|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-12|<tuple|7|16|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-13|<tuple|7|16|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-14|<tuple|8|16|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-15|<tuple|9|17|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-16|<tuple|<with|mode|<quote|math>|w<rsub|1>,w<rsub|2>>|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-3|<tuple|2.1|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-4|<tuple|2.2|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-5|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-6|<tuple|3.1|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-7|<tuple|4|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-8|<tuple|4.1|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-9|<tuple|4.2|9|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-arens1957|<tuple|arens1957|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-borino1988|<tuple|borino1988|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-corotis1972|<tuple|corotis1972|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-corotis1977|<tuple|corotis1977|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-cramer1967|<tuple|cramer1967|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-dipaola1985|<tuple|dipaola1985|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-dipaola1985b|<tuple|dipaola1985b|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-dipaola1986|<tuple|dipaola1986|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-dugundji1958|<tuple|dugundji1958|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-grossmayer1977|<tuple|grossmayer1977|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-krenk1979|<tuple|krenk1979|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-krenk1981|<tuple|krenk1981|20|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-langley1986|<tuple|langley1986|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-lutes1978|<tuple|lutes1978|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-middleton1960|<tuple|middleton1960|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-naess1983|<tuple|naess1983|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-naess1984|<tuple|naess1984|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-nigam1982|<tuple|nigam1982|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-papoulis1984|<tuple|papoulis1984|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-preumont1985|<tuple|preumont1985|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-priestley1967|<tuple|priestley1967|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-rice1955|<tuple|rice1955|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-spanos1983|<tuple|spanos1983|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-vanmarcke1972|<tuple|vanmarcke1972|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-vanmarcke1975|<tuple|vanmarcke1975|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-yang1971|<tuple|yang1971|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-yang1972|<tuple|yang1972|21|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:alpha_initial|<tuple|23|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:alpha_recursion|<tuple|22|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:beta_initial|<tuple|25|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:beta_recursion|<tuple|24|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:ccs_2x2|<tuple|51|9|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:ccs_matrix|<tuple|46|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:concise_derivative|<tuple|26|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:constant_interval|<tuple|71|12|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:coordinate_transform|<tuple|85|14|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:correlation_block|<tuple|84|14|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:correlation_matrix|<tuple|16|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:correlation_z|<tuple|54|10|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:cross_correlation_entry|<tuple|17|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:cross_correlation_f|<tuple|27|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:cross_correlation_frequency|<tuple|32|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:cross_correlation_general|<tuple|28|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:derivative_2r|<tuple|41|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:derivative_2r1|<tuple|42|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:derivative_form|<tuple|20|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:determinant_lambda|<tuple|62|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:determinant_r|<tuple|88|15|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:effective_vector|<tuple|53|10|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:envelope|<tuple|9|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:error_function|<tuple|68|12|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:evolutionary_moments|<tuple|47|9|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:evolutionary_psd|<tuple|34|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:failure_rate|<tuple|72|13|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:failure_rate_envelope|<tuple|73|13|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:first_excursion|<tuple|74|13|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:first_excursion_approx|<tuple|75|13|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:g_function|<tuple|21|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:gamma|<tuple|29|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:gamma_phase|<tuple|89|15|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:gf_final|<tuple|98|17|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:gf_fourier|<tuple|96|17|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:hilbert|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:hilbert_fourier|<tuple|97|17|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:impulse_response|<tuple|19|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:inequality|<tuple|35|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:jacobian|<tuple|59|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:jacobian_transform|<tuple|58|10|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:jpdf_a1a2_explicit|<tuple|86|15|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:jpdf_combined|<tuple|83|14|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:jpdf_explicit|<tuple|64|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:jpdf_marginal|<tuple|57|10|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:jpdf_z|<tuple|55|10|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:k_function|<tuple|33|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:lambda_2z|<tuple|60|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:lambda_2z_inverse|<tuple|61|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:lambda_inequality|<tuple|52|10|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:leibnitz|<tuple|18|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:marginal_a|<tuple|66|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:marginal_aa_dot|<tuple|65|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:marginal_jpdf|<tuple|90|15|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:markov_b|<tuple|81|14|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:markov_failure|<tuple|78|14|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:mean_frequency|<tuple|70|12|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:motion|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:nonstationary_ccs|<tuple|48|9|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:nonstationary_envelope|<tuple|13|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:nonstationary_inequality|<tuple|50|9|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:nonstationary_input|<tuple|11|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:nonstationary_moment_def|<tuple|49|9|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:nonstationary_output|<tuple|12|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:nonstationary_phase|<tuple|14|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:output_analytic|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:pf_correlation|<tuple|95|17|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:phase|<tuple|10|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:phi_integral|<tuple|92|15|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:pn_fourier|<tuple|30|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:pnhat_fourier|<tuple|31|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:poisson_failure|<tuple|76|13|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:polar|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:polar_y|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:polar_yhat|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:preenvelope|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:prob_a1|<tuple|79|14|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:prob_a1a2|<tuple|80|14|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:psd_onesided|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:q0|<tuple|77|13|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:q_series|<tuple|91|15|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:qz_definition|<tuple|63|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:r0|<tuple|87|15|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:spectral_moment_def|<tuple|44|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:spectral_moment_relation|<tuple|45|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:spectral_moment_stationary|<tuple|43|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:stationary_2r|<tuple|39|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:stationary_2r1|<tuple|40|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:stationary_correlation|<tuple|38|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:stationary_k|<tuple|36|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:stationary_upcrossing|<tuple|69|12|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:transfer_function|<tuple|37|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:upcrossing_final|<tuple|67|12|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:upcrossing_rate|<tuple|56|10|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:vector_combined|<tuple|82|14|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:vector_x|<tuple|15|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:w1|<tuple|93|15|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:w2|<tuple|94|15|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:conclusions|<tuple|7|16|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:correlation_matrix|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:first_passage|<tuple|6|12|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:introduction|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:nonstationary|<tuple|2.2|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:preliminaries|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:spectral_matrix|<tuple|4|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:spectral_nonstationary|<tuple|4.2|9|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:spectral_stationary|<tuple|4.1|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:stationary|<tuple|2.1|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:stationary_particularization|<tuple|3.1|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|sec:threshold_crossing|<tuple|5|10|../../.TeXmacs/texts/scratch/no_name_10.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      langley1986

      yang1971

      yang1972

      dugundji1958

      cramer1967

      arens1957

      dugundji1958

      borino1988

      dipaola1985

      dipaola1985

      vanmarcke1972

      vanmarcke1975

      dipaola1985

      arens1957

      dugundji1958

      krenk1981

      dugundji1958

      cramer1967

      yang1972

      priestley1967

      borino1988

      dipaola1985

      dipaola1985b

      papoulis1984

      corotis1977

      corotis1972

      grossmayer1977

      vanmarcke1972

      borino1988

      vanmarcke1972

      vanmarcke1975

      corotis1972

      rice1955

      middleton1960

      vanmarcke1972

      corotis1972

      cramer1967

      yang1971

      krenk1979

      naess1983

      naess1984

      preumont1985

      yang1971

      yang1971

      krenk1979

      langley1986

      krenk1979

      spanos1983

      papoulis1984
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminary
      Concepts and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Stationary Case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Nonstationary Case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Cross-Correlation
      Matrix of Complex Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Stationary Particularization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Cross-Covariance
      Spectral Matrix> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Stationary Case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Nonstationary Case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Mean-Rate
      Threshold Crossing for Circular Barriers>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>First-Passage
      Probability> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgments>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>PSD
      of Analytic Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Notation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>

<\links>
  <\collection>
    <id|+lE9S44p2MgS0raa>
    <target|+lE9S44p2MgS0raY|EnvelopesOfNonstationaryRandomVibrations.tex>
    <locator|source-title-note-1|<id|+lE9S44p2MgS0raY>>
    <locator|dest-title-note-1|<id|+lE9S44p2MgS0raY>>
  </collection>
</links>