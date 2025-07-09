<TeXmacs|2.1.4>

<style|<tuple|generic|metal>>

<\body>
  <doc-data|<doc-title|Nonstationary Envelope in Random Vibration
  Theory>|<doc-author|<author-data|<author-name|Giuseppe
  Muscolino>|<author-affiliation|Researcher, Dipartimento di Ingegneria
  Strutturale e Geotecnica, Università degli Studi di Palermo, Viale delle
  Scienze, 1-90128 Palermo, Italy.>>>|<doc-date|>>

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

  <section|Introduction>

  The problem of predicting the safety of structural systems subjected to
  random loading arises in many engineering applications. It is well-known
  that such loadings as aircraft impact during landing are nonstationary
  random processes. It follows that the response of quiescent systems is also
  nonstationary and that the prediction of their structural safety is an
  important topic in structural engineering.

  In the framework of the prediction of structural safety, the envelope
  process<nbsp><cite|langley1986> plays an important role. For example, in
  the problem of first excursion failure and that of fatigue failure,
  evaluating the statistical properties of the envelope process becomes an
  important task in both stationary<nbsp><cite|yang1971> and
  nonstationary<nbsp><cite|yang1972> response processes. In the stationary
  case, the envelope process is usually defined following
  Dugundji<nbsp><cite|dugundji1958> and Cramer and
  Leadbetter<nbsp><cite|cramer1967>, and it can be seen as the modulus of the
  response of a linear system subjected to a complex process called
  pre-envelope<nbsp><cite|arens1957|dugundji1958>, which is a complex process
  in which the imaginary part is the Hilbert transform of the companion real
  part.

  In previous papers<nbsp><cite|borino1988|dipaola1985>, it has been
  demonstrated that the complex processes must be introduced not only for the
  definition of the envelope process, but also to give a clearer definition
  of stationary and nonstationary spectral moments, which are simply
  variances of the complex response and its time derivatives in structural
  systems subjected to such input<nbsp><cite|dipaola1985>.

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

  <section|Preliminary Concepts and Definitions>

  <subsection|Stationary Case>

  The equation of motion of an SDOF system may be written in the canonical
  form as follows:

  <\equation>
    <wide|x|\<ddot\>>+2*\<zeta\>*\<omega\><rsub|0>*<wide|x|\<dot\>>+\<omega\><rsub|0><rsup|2>*x=f<around|(|t|)><label|eq:sdof_motion>
  </equation>

  where <math|\<zeta\>> and <math|\<omega\><rsub|0>> are the damping ratio
  and the natural radian frequency, respectively; the displacement
  <math|x<around|(|t|)>> is the solution of
  equation<nbsp><eqref|eq:sdof_motion>; the upper dot indicates time
  differentiation; and <math|f<around|(|t|)>> is a stochastic zero-mean
  process.

  It is well-known that for the stationary analysis of linear systems, the
  function that characterizes both the input and output processes is the
  power spectral density function (PSD). Though from a mathematical viewpoint
  the PSD is defined in the frequency range <math|-\<infty\>> to
  <math|\<infty\>>, from the physical viewpoint the power is defined only in
  the positive frequency range. In the last few years, it has been shown that
  the one-sided PSD (defined as <math|0> to <math|\<infty\>>) is required in
  order to obtain some significant quantities in the evaluation of the
  statistics of the stochastic response<nbsp><cite|vanmarcke1972|vanmarcke1975>.
  It is defined as the product of the Heaviside function
  <math|U<around|(|\<omega\>|)>> by twice the PSD (defined as
  <math|-\<infty\>> to <math|\<infty\>>), i.e.

  <\equation>
    G<rsub|f><around|(|\<omega\>|)>=2*U<around|(|\<omega\>|)>*<wide|G|\<bar\>><rsub|f><around|(|\<omega\>|)><label|eq:one_sided_psd>
  </equation>

  where the overbar indicates the usual PSD (defined as <math|-\<infty\>> to
  <math|\<infty\>>).

  In order to obtain a process that defines the one-sided PSD in
  equation<nbsp><eqref|eq:one_sided_psd>, the corresponding process
  <math|f<around|(|t|)>> in the time domain must be a complex one, in which
  the imaginary part is the Hilbert transform of the corresponding real part,
  i.e., an analytic process<nbsp><cite|dipaola1985>. This process is the
  so-called pre-envelope<nbsp><cite|arens1957|dugundji1958> and is given as

  <\equation>
    f<around|(|t|)>=n<around|(|t|)>+i*h<around|(|t|)><label|eq:pre_envelope>
  </equation>

  where <math|n<around|(|t|)>> is the stationary process having the usual
  PSD, <math|G<rsub|n><around|(|\<omega\>|)>>; <math|i=<sqrt|-1>>; and
  <math|h<around|(|t|)>> is the Hilbert transform:

  <\equation>
    h<around|(|t|)>=H<around|[|n<around|(|t|)>|]>=<frac|1|\<pi\>>*<text|p.v.><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|n<around|(|\<tau\>|)>|t-\<tau\>>*d*\<tau\><label|eq:hilbert_transform>
  </equation>

  Due to the fact that input is analytic, the corresponding output is
  analytic as well<nbsp><cite|krenk1981>, i.e.,

  <\equation>
    x<around|(|t|)>=y<around|(|t|)>+i*<wide|y|~><around|(|t|)><label|eq:analytic_output>
  </equation>

  where <math|y<around|(|t|)>> is the response of the oscillator subjected to
  the real process <math|n<around|(|t|)>>. The process <math|x<around|(|t|)>>
  can be considered as a point in the rectangular coordinates of the plane
  <math|y<around|(|t|)>/<wide|y|~><around|(|t|)>>, while in polar coordinates
  the process <math|x<around|(|t|)>> can be written in the form:

  <\equation>
    x<around|(|t|)>=a<around|(|t|)>*exp <around*|[|i*\<theta\><around|(|t|)>|]><label|eq:polar_output>
  </equation>

  where <math|a<around|(|t|)>> and <math|\<theta\><around|(|t|)>> are a pair
  of random processes called the amplitude and the phase, respectively.

  It is to be noted that <math|y<around|(|t|)>> and
  <math|<wide|y|~><around|(|t|)>> are given in polar coordinates in the form

  <\align>
    <tformat|<table|<row|<cell|y<around|(|t|)>>|<cell|=a<around|(|t|)>*cos
    <around|[|\<theta\><around|(|t|)>|]><eq-number><label|eq:polar_y>>>|<row|<cell|<wide|y|~><around|(|t|)>>|<cell|=a<around|(|t|)>*sin
    <around|[|\<theta\><around|(|t|)>|]><eq-number><label|eq:polar_ytilde>>>>>
  </align>

  Following the primary definition of Dugundji<nbsp><cite|dugundji1958> and
  Cramer and Leadbetter<nbsp><cite|cramer1967>, <math|a<around|(|t|)>> is the
  so-called envelope function of the process <math|x<around|(|t|)>> and is
  the modulus of the complex process <math|x<around|(|t|)>> defined in
  equation<nbsp><eqref|eq:analytic_output>, i.e.,

  <\equation>
    a<around|(|t|)>=<sqrt|y<rsup|2><around|(|t|)>+<wide|y|~><rsup|2><around|(|t|)>><label|eq:envelope_def>
  </equation>

  Notice that the process <math|a<around|(|t|)>> is defined in the range
  <math|<around|[|0,\<infty\>|)>>, while <math|\<theta\><around|(|t|)>> is
  defined in the range <math|<around|[|0,2*\<pi\>|)>> and is given as

  <\equation>
    \<theta\><around|(|t|)>=tan<rsup|-1><around*|(|<frac|<wide|y|~><around|(|t|)>|y<around|(|t|)>>|)><label|eq:phase_def>
  </equation>

  <subsection|Nonstationary Case>

  In the nonstationary case, a quite different situation is observed. If we
  construct a complex input process in which the imaginary part is the
  Hilbert transform of the corresponding real part, it follows that the
  imaginary part of the output is different from zero for
  <math|-\<infty\>\<less\>t\<less\>0>, and the corresponding envelope exists
  in the negative time region, in contrast with its own physical meaning.
  Thus in the nonstationary case, the complex input process of
  equation<nbsp><eqref|eq:sdof_motion> must be defined as the product of a
  deterministic real shaping function <math|F<around|(|t|)>> by the
  pre-envelope of a stationary process, i.e.,

  <\equation>
    f<around|(|t|)>=F<around|(|t|)>*<around|[|n<around|(|t|)>+i*h<around|(|t|)>|]><label|eq:nonstationary_input>
  </equation>

  Assuming the latter as input, the corresponding output will be given in the
  form:

  <\equation>
    x<around|(|t|)>=y<around|(|t|)>+i*<wide|y|~><around|(|t|)><label|eq:nonstationary_output>
  </equation>

  where <math|y<around|(|t|)>> is the response of
  equation<nbsp><eqref|eq:sdof_motion> when the input is
  <math|F<around|(|t|)>*n<around|(|t|)>>.
  Equations<nbsp><eqref|eq:nonstationary_input>
  and<nbsp><eqref|eq:nonstationary_output> are the extensions of the
  pre-envelope of the input and output processes, respectively, in the
  nonstationary case. It is also evident that <math|<wide|y|~><around|(|t|)>>
  coincides with <math|<wide|y|~><around|(|t|)>> only when
  <math|F<around|(|t|)>=1> for all <math|t> (stationary case).

  Due to the fact that the envelope <math|a<around|(|t|)>> is defined as the
  amplitude of the complex output process, as in the stationary case, we can
  write

  <\equation>
    a<around|(|t|)>=<sqrt|y<rsup|2><around|(|t|)>+<wide|y|~><rsup|2><around|(|t|)>><label|eq:nonstationary_envelope>
  </equation>

  and the corresponding nonstationary phase is given as

  <\equation>
    \<theta\><around|(|t|)>=tan<rsup|-1><around*|(|<frac|<wide|y|~><around|(|t|)>|y<around|(|t|)>>|)><label|eq:nonstationary_phase>
  </equation>

  Notice that equation<nbsp><eqref|eq:nonstationary_input> is the only
  correct definition of complex input for separable processes. Moreover, it
  can easily be shown that the previously defined nonstationary envelope
  coincides with the definition of envelope given by
  Yang<nbsp><cite|yang1972>, using the Priestley<nbsp><cite|priestley1967>
  spectral representation of stochastic processes.

  <section|Cross-Correlation Matrix of Complex Processes>

  To obtain the statistics of the envelope process, the cross-correlation
  matrix of the process <math|x<around|(|t|)>> and its time differentiations
  must be evaluated. To this purpose, a vector
  <math|<math-bf|X><rsub|m><around|(|t|)>> is introduced in the form

  <\equation>
    <math-bf|X><rsub|m><around|(|t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|x<around|(|t|)>>|<cell|<frac|d*x<around|(|t|)>|d*t>>|<cell|\<cdots\>>|<cell|<frac|d<rsup|m-1>*x<around|(|t|)>|d*t<rsup|m-1>>>>>>>|]><rsup|T><label|eq:Xm_def>
  </equation>

  where the superscript <math|T> denotes transpose; and
  <math|x<around|(|t|)>> is the complex process defined in
  equation<nbsp><eqref|eq:analytic_output> for the stationary case and in
  equation<nbsp><eqref|eq:nonstationary_output> for the nonstationary case.

  It follows that the cross-correlation matrix of the vector
  <math|<math-bf|X><rsub|m><around|(|t|)>> can be obtained as

  <\equation>
    <math-bf|R><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)>=\<bbb-E\><around*|[|<math-bf|X><rsub|m><around|(|t<rsub|1>|)><math-bf|X><rsub|m><rsup|\<ast\>><around|(|t<rsub|2>|)><rsup|T>|]><label|eq:cross_corr_matrix>
  </equation>

  where <rsup|<math|\<ast\>>> denotes complex conjugate; and
  <math|\<bbb-E\><around|[|\<cdummy\>|]>> denotes stochastic average.

  In order to evaluate the various entries of the matrix
  <math|<math-bf|R><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)>>, all
  stochastic averages of the product of the various time derivatives of
  <math|x<around|(|t<rsub|1>|)>> and <math|x<around|(|t<rsub|2>|)>> must be
  computed<nbsp><cite|borino1988|dipaola1985|dipaola_muscolino1985>, i.e.,

  <\equation>
    P<rsub|s,v,x><around|(|t<rsub|1>,t<rsub|2>|)>=\<bbb-E\>*<around*|[|<frac|d<rsup|s>*x<around|(|t<rsub|1>|)>|d*t<rsub|1><rsup|s>>*<frac|d<rsup|v>*x<rsup|\<ast\>><around|(|t<rsub|2>|)>|d*t<rsub|2><rsup|v>>|]><label|eq:Ps_v_x>
  </equation>

  The general case involving time derivatives up to the
  <math|<around|(|m-1|)>>th order is treated. To obtain the cross-correlation
  function given in equation<nbsp><eqref|eq:Ps_v_x>, the various time
  differentiations of the process <math|x<around|(|t|)>> must be evaluated.
  For this purpose, using the Duhamel integral representation of the
  quiescent system subjected to the process defined in
  equation<nbsp><eqref|eq:nonstationary_input> and also using the Leibnitz
  rule applied to this case, we write

  <\equation>
    <frac|d<rsup|r>*x<around|(|t|)>|d*t<rsup|r>>=<big|int><rsub|0><rsup|t><frac|d<rsup|r>*h<around|(|\<tau\>|)>|d*\<tau\><rsup|r>>*f*<around|(|t-\<tau\>|)>*d*\<tau\><label|eq:drx_dt>
  </equation>

  where <math|h<around|(|\<tau\>|)>> is the impulse response function:

  <\equation>
    h<around|(|\<tau\>|)>=<frac|1|\<omega\><rsub|d>>*exp
    <around|(|-\<zeta\>*\<omega\><rsub|0>*\<tau\>|)>*sin
    <around|(|\<omega\><rsub|d>*\<tau\>|)>,<space|1em>\<tau\>\<geq\>0;<space|1em>h<around|(|\<tau\>|)>=0,<space|1em>\<tau\>\<less\>0<label|eq:impulse_response>
  </equation>

  and <math|\<omega\><rsub|d>=\<omega\><rsub|0>*<sqrt|1-\<zeta\><rsup|2>>>.

  It is worth noting that the impulse response function defined in
  equation<nbsp><eqref|eq:impulse_response> exhibits a slope discontinuity at
  <math|\<tau\>=0>. It follows that the second derivatives of
  <math|h<around|(|\<tau\>|)>> exhibit a Dirac delta at <math|\<tau\>=0>,
  while the higher derivatives exhibit discontinuity of a higher order.

  For our purposes, a more suitable expression of the cross-correlation
  function given in equation<nbsp><eqref|eq:Ps_v_x> can be obtained by using
  the representation of <math|p<rsub|n><around|(|\<tau\>|)>> and
  <math|p<rsub|h><around|(|\<tau\>|)>> as the inverse of the Fourier
  transform of the PSD<nbsp><cite|papoulis1984>, i.e.,

  <\align>
    <tformat|<table|<row|<cell|p<rsub|n><around|(|\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|n<around|(|t|)>*n*<around|(|t+\<tau\>|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>G<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*\<tau\>>*d*\<omega\><eq-number><label|eq:pn_tau>>>|<row|<cell|p<rsub|h><around|(|\<tau\>|)>>|<cell|=\<bbb-E\>*<around|[|n<around|(|t|)>*h*<around|(|t+\<tau\>|)>|]>=-i*<big|int><rsub|-\<infty\>><rsup|\<infty\>><text|sgn><around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*\<tau\>>*d*\<omega\><eq-number><label|eq:ph_tau>>>>>
  </align>

  where sgn<math|<around|(|\<omega\>|)>> is the signum function.

  <section|Cross-Covariance Spectral Matrix>

  <subsection|Stationary Case>

  In the stationary case, setting <math|\<tau\>=0> in the cross-correlation,
  we obtain

  <\equation>
    P<rsub|s,v,x><around|(|0|)>=4*<around|(|-i|)><rsup|s-v>*<big|int><rsub|0><rsup|\<infty\>>U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>*H<around|(|\<omega\>|)>*H<rsup|\<ast\>><around|(|\<omega\>|)>*\<omega\><rsup|s+v>*d*\<omega\><label|eq:Ps_v_x_stationary>
  </equation>

  The integral in equation<nbsp><eqref|eq:Ps_v_x_stationary> represents the
  moments of the one-sided PSD with respect to the frequency origin, i.e.,
  the so-called spectral moments<nbsp><cite|vanmarcke1972>:

  <\equation>
    \<mu\><rsub|s,v>=4*<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|s+v>*U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>*H<rsup|\<ast\>><around|(|\<omega\>|)>*H<around|(|\<omega\>|)>*d*\<omega\><label|eq:spectral_moments>
  </equation>

  The correlation matrix evaluated for <math|t<rsub|1>-t<rsub|2>> in the
  stationary case becomes a Hermitian time-independent matrix, namely the
  so-called cross-covariance spectral (CCS) matrix<nbsp><cite|borino1988>.

  <subsection|Nonstationary Case>

  In the nonstationary case, the spectral moments of the evolutionary PSD are
  given as

  <\equation>
    \<mu\><rsub|j><rsup|\<ast\>><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|j>*G<rsub|v><around|(|\<omega\>,t|)>*d*\<omega\><label|eq:nonstationary_spec_moments>
  </equation>

  where <math|G<rsub|v><around|(|\<omega\>,t|)>> is the so-called one-sided
  evolutionary PSD.

  Strictly speaking, the spectral moments as defined by
  Vanmarcke<nbsp><cite|vanmarcke1972|vanmarcke1975> should be evaluated by
  means of equation<nbsp><eqref|eq:nonstationary_spec_moments>. However,
  since the spectral moments so evaluated do not provide the physical meaning
  of the variances, it seems more appropriate, in the nonstationary case, to
  calculate them using the time-domain cross-correlation.

  <section|Mean-Rate Threshold Crossing for Circular Barriers>

  To obtain the statistics of the envelope process, a new vector
  <math|<math-bf|Z><rsub|m><around|(|t|)>> is introduced, whose various
  entries are equal to the effective values of the vector
  <math|<math-bf|X><rsub|m><around|(|t|)>>, i.e.,

  <\equation>
    <math-bf|Z><rsub|m><around|(|t|)>=<around*|[|z<rsub|1><around|(|t|)>,z<rsub|2><around|(|t|)>,\<ldots\>,z<rsub|m><around|(|t|)>|]><rsup|T><label|eq:Zm_def>
  </equation>

  It follows that the correlation matrix of the vector
  <math|<math-bf|Z><rsub|m><around|(|t|)>> is related to the correlation
  matrix of the vectors <math|<math-bf|X><rsub|m><around|(|t|)>> through

  <\equation>
    <math-bf|K><rsub|m,z><around|(|t<rsub|1>,t<rsub|2>|)>=\<bbb-E\><around*|[|<math-bf|Z><rsub|m><around|(|t<rsub|1>|)><math-bf|Z><rsub|m><rsup|\<ast\>><around|(|t<rsub|2>|)><rsup|T>|]>=<math-bf|R><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)><label|eq:K_mz>
  </equation>

  If <math|f<around|(|t|)>> is a zero-mean Gaussian process, the joint
  probability density function (JPDF) of the vector
  <math|<math-bf|Z><rsub|m><around|(|t|)>> is also Gaussian and can be
  expressed as follows:

  <\equation>
    p<rsub|<math-bf|Z><rsub|m>><around|(|<math-bf|Z><rsub|m>;t|)>=<around|(|2*\<pi\>|)><rsup|-m><around|\||<math-bf|A><rsub|m,z><around|(|t|)>|\|><rsup|-1>*exp
    <around*|[|-<math-bf|Z><rsub|m><rsup|T><around|(|t|)><math-bf|A><rsub|m,z><rsup|-1><around|(|t|)><math-bf|Z><rsub|m><around|(|t|)>|]><label|eq:jpdf_Zm>
  </equation>

  where <math|<around|\||\<cdummy\>|\|>> denotes determinant.

  The mean numbers of upcrossings per unit time
  <math|\<nu\><rsub|+><around|(|\<eta\>,t|)>> of the circular barrier
  <math|\<eta\>> of the envelope process <math|a<around|(|t|)>> defined in
  equation<nbsp><eqref|eq:envelope_def>, following the main definitions of
  Rice<nbsp><cite|rice1955> and Middleton<nbsp><cite|middleton1960>, can be
  written in the form

  <\equation>
    \<nu\><rsub|+><around|(|\<eta\>,t|)>=<big|int><rsub|0><rsup|\<infty\>>p<rsub|a,<wide|a|\<dot\>>><around|(|\<eta\>,<wide|a|\<dot\>>;t|)><wide|a|\<dot\>>*d*<wide|a|\<dot\>><label|eq:mean_upcrossings>
  </equation>

  where <math|p<rsub|a,<wide|a|\<dot\>>><around|(|\<eta\>,<wide|a|\<dot\>>;t|)>>
  is the JPDF of the envelope and its time differentiation.

  <section|First-Passage Probability>

  As an application of complex processes, the first-passage probability
  following the Poisson and the Markov assumptions is evaluated.

  Let us consider the nonstationary zero-mean narrow-band Gaussian response
  process <math|z<around|(|t|)>=x<around|(|t|)>/<sqrt|2>>, where
  <math|x<around|(|t|)>> is defined in equation<nbsp><eqref|eq:nonstationary_output>
  as an output process of a lightly damped oscillator excited by the process
  <math|f<around|(|t|)>/<sqrt|2>>, which is defined in
  equation<nbsp><eqref|eq:nonstationary_input>. The PSD of
  <math|n<around|(|t|)>> is fairly broad. Let its mean circular frequency
  <math|\<omega\><rsub|a><around|(|t|)>> be in the form

  <\equation>
    \<omega\><rsub|a><around|(|t|)>=<sqrt|<frac|\<mu\><rsub|2><rsup|\<ast\>><around|(|t|)>|\<mu\><rsub|0><rsup|\<ast\>><around|(|t|)>>><label|eq:mean_circ_freq>
  </equation>

  It follows from the narrow-band character of the process that the peak and
  trough of the real part of the process <math|z<around|(|t|)>> are almost
  uniformly spaced at intervals <math|T<around|(|t|)>=\<pi\>/\<omega\><rsub|a><around|(|t|)>>.
  To simplify matters, we will suppose that <math|T<around|(|t|)>> is almost
  constant, i.e.,

  <\equation>
    T<around|(|t|)>=\<Delta\>*t,<space|1em>\<forall\>t<label|eq:interval_const>
  </equation>

  Let <math|\<eta\>> be the threshold level of the real part of
  <math|z<around|(|t|)>> and <math|Y<around|(|t<rsub|n>|)>> be the discrete
  point process (<math|t<rsub|n>=n*\<Delta\>*t>) of the peaks and troughs of
  the real part of <math|z<around|(|t|)>>. Then the failure rate
  <math|b<around|(|t<rsub|n>|)>>\Vnamely, the probability that the absolute
  value of <math|Y<around|(|t<rsub|n>|)>> will exit from the safe domain in
  the <math|n>th half cycle, conditioned by the fact that no threshold
  crossing has occurred before\Vis given as

  <\equation>
    b<around|(|t<rsub|n>|)>=\<bbb-P\><around*|(|max<rsub|j=1,\<ldots\>,n><around|\||Y<around|(|t<rsub|j>|)>|\|>\<less\>\<eta\><space|0.17em><mid|\|><space|0.17em><around|\||Y<around|(|t<rsub|k>|)>|\|>\<less\>\<eta\>,\<forall\>k\<less\>n|)><label|eq:failure_rate>
  </equation>

  Once <math|b<around|(|t<rsub|n>|)>> is evaluated, the probability that the
  first excursion of <math|a<around|(|t<rsub|n>|)>>,
  <math|L<around|(|t<rsub|n>,\<eta\>|)>>, will occur in the first <math|n>
  half cycles is given in the well-known form<nbsp><cite|krenk1979|naess1983|naess1984|preumont1985|yang1971>

  <\equation>
    L<around|(|t<rsub|n>,\<eta\>|)>=1-<big|prod><rsub|j=1><rsup|n><around|[|1-b<around|(|t<rsub|j>|)>|]><label|eq:first_excursion_prob>
  </equation>

  For <math|b<around|(|t<rsub|j>|)>\<ll\>1> and for large values of <math|n>,
  equation<nbsp><eqref|eq:first_excursion_prob> can be approximated
  as<nbsp><cite|yang1971>

  <\equation>
    L<around|(|t<rsub|n>,\<eta\>|)>\<approx\>1-exp
    <around*|(|-<big|sum><rsub|j=1><rsup|n>b<around|(|t<rsub|j>|)>|)><label|eq:first_excursion_approx>
  </equation>

  <section|Conclusions>

  By introducing the input process, i.e., the so-called pre-envelope, as the
  product of an analytical random stationary process by a deterministic
  shaping function, the nonstationary envelope can be defined as the modulus
  of the complex response process of structural systems subjected to such a
  pre-envelope. The introduction of the complex input process, instead of the
  more familiar real one, is essential, not only for the definition of the
  envelope process, but also for the correct definition of the spectral
  moments in both stationary and nonstationary cases.

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

  The author is indebted to Mario Di Paola for his helpful comments and
  valuable suggestions in the theoretical formulation of this paper.

  <section|PSD of Analytic Process>

  In this appendix, it is shown that the analytic process defined in
  equation<nbsp><eqref|eq:pre_envelope> has a one-sided PSD. The correlation
  function <math|P<rsub|f><around|(|\<tau\>|)>> of this analytic process is
  given as

  <\equation>
    P<rsub|f><around|(|\<tau\>|)>=\<bbb-E\>*<around|[|f<around|(|t|)>*f<rsup|\<ast\>>*<around|(|t+\<tau\>|)>|]>=2*<around|[|p<rsub|n><around|(|\<tau\>|)>+i*p<rsub|h><around|(|\<tau\>|)>|]><label|eq:analytic_corr>
  </equation>

  Making the Fourier transform of equation<nbsp><eqref|eq:analytic_corr>, we
  obtain the PSD of <math|f<around|(|t|)>>, according to the Wiener-Khinchin
  theorem:

  <\equation>
    G<rsub|f><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>P<rsub|f><around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>=2*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>+2*i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|h><around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\><label|eq:analytic_psd>
  </equation>

  Using the property of the Fourier transform of the Hilbert
  transform<nbsp><cite|papoulis1984>:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|h><around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>=-i<space|0.17em><text|sgn><around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)><label|eq:hilbert_fourier>
  </equation>

  where sgn<math|<around|(|\<omega\>|)>> is the signum function. Substituting
  this equation into equation<nbsp><eqref|eq:analytic_psd> we obtain

  <\equation>
    G<rsub|f><around|(|\<omega\>|)>=4*U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>=2*U<around|(|\<omega\>|)>*<wide|G|\<bar\>><rsub|f><around|(|\<omega\>|)><label|eq:analytic_psd_final>
  </equation>

  Thus the analytic process defined in equation<nbsp><eqref|eq:pre_envelope>
  exhibits power only in the positive frequency range.

  <section|Notation>

  <\big-table>
    <item*|<math|a<around|(|t|)>>>stationary and nonstationary envelope
    process

    <item*|<math|<wide|a|\<dot\>><around|(|t|)>>>time differentiation of
    envelope process

    <item*|<math|b<around|(|t<rsub|n>|)>>>failure rate

    <item*|<math|\<bbb-E\><around|[|\<cdummy\>|]>>>stochastic average of

    <item*|<math|F<around|(|t|)>>>deterministic shaping function

    <item*|<math|f<around|(|t|)>>>stochastic complex zero mean input process

    <item*|<math|G<rsub|f><around|(|\<omega\>|)>>>one-sided PSD of complex
    input process <math|f<around|(|t|)>>

    <item*|<math|G<rsub|n><around|(|\<omega\>|)>>>two-sided PSD of real input
    process <math|n<around|(|t|)>>

    <item*|<math|G<rsub|x><around|(|\<omega\>|)>>>one-sided PSD of complex
    output process <math|x<around|(|t|)>>

    <item*|<math|G<rsub|v><around|(|\<omega\>,t|)>>>so-called one-sided
    evolutionary PSD

    <item*|<math|g<around|(|\<tau\>|)>>>deterministic function defined in the
    text

    <item*|<math|H<around|(|\<omega\>|)>>>transfer function in terms of
    displacements

    <item*|<math|H<around|[|\<cdummy\>|]>>>Hilbert transform of

    <item*|<math|h<around|(|\<tau\>|)>>>impulse response function

    <item*|<math|I<rsub|0><around|(|\<cdummy\>|)>>>modified Bessel function
    of order zero

    <item*|<math|<math-up|Im><around|[|\<cdummy\>|]>>>imaginary part of

    <item*|<math|<around|\||\<cdummy\>|\|>>>Jacobian of transformation or
    determinant

    <item*|<math|K<rsub|r><around|(|\<omega\>,t|)>>>truncated Fourier
    transform of product defined in the text

    <item*|<math|K<rsub|r><around|(|\<omega\>,\<infty\>|)>>>transfer function
    in terms of the <math|r>th derivative of displacements

    <item*|<math|L<around|(|t<rsub|n>,\<eta\>|)>>>first excursion probability
    of the envelope process

    <item*|<math|n<around|(|t|)>>>stationary real zero mean input process

    <item*|<math|h<around|(|t|)>>>Hilbert transform of <math|n<around|(|t|)>>

    <item*|<math|p<rsub|<math-bf|Z><rsub|m>><around|(|z,t|)>>>joint
    probability function

    <item*|<math|<math-bf|R><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)>>>cross-correlation
    matrix of vector <math|<math-bf|X><rsub|m><around|(|t|)>>

    <item*|<math|<math-bf|X><rsub|m><around|(|t|)>>>complex vector of order
    <math|m>, whose elements are <math|x<around|(|t|)>> and

    <space|3em> its time differentiation

    <item*|<math|x<around|(|t|)>>>complex zero mean output process

    <item*|<math|Y<around|(|t<rsub|n>|)>>>process of peaks and troughs of
    real part of <math|z<around|(|t|)>>

    <item*|<math|y<around|(|t|)>,<wide|y|~><around|(|t|)>>>different real
    zero mean output process

    <item*|<math|<math-bf|Z><rsub|m><around|(|t|)>>>effective value of
    complex output vector <math|<math-bf|X><rsub|m><around|(|t|)>>

    <item*|<math|z<around|(|t|)>>>effective value of complex zero mean output
    process <math|x<around|(|t|)>>

    <item*|<math|a<rsub|r>,b<rsub|r>>>recursive coefficients given in the
    text

    <item*|<math|\<delta\><around|(|\<tau\>|)>>>Dirac's delta

    <item*|<math|\<zeta\>>>damping ratio

    <item*|<math|\<eta\>>>cylindrical barrier

    <item*|<math|\<theta\><around|(|t|)>>>phase process

    <item*|<math|\<mu\><rsub|j><rsup|\<ast\>><around|(|t|)>>>stationary and
    nonstationary <math|j>th spectral moment

    <item*|<math|\<mu\><rsub|j,x><around|(|t|)>>><math|j>th moment of
    evolutionary PSD

    <item*|<math|<math-bf|A><rsub|m,x><around|(|t|)>>>cross-covariance
    spectral matrix

    <item*|<math|\<nu\><rsub|+><around|(|\<eta\>,t|)>>>mean number of
    upcrossings per unit time of circular barrier <math|\<eta\>>

    <item*|<math|P<rsub|f><around|(|\<tau\>|)>>>correlation function of
    analytic process <math|f<around|(|t|)>>

    <item*|<math|P<rsub|s,v,x><around|(|t<rsub|1>,t<rsub|2>|)>>><math|s,v>th
    entry of cross-correlation matrix <math|<math-bf|R><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)>>

    <item*|<math|<math-bf|K><rsub|m,z><around|(|t<rsub|1>,t<rsub|2>|)>>>Hermitian
    correlation function matrix defined in the text

    <item*|<math|\<Phi\><around|(|\<cdummy\>|)>>>error function

    <item*|<math|\<omega\><rsub|a><around|(|t|)>>>central frequency of
    nonstationary process

    <item*|<math|\<omega\><rsub|d>>>natural damped radian frequency

    <item*|<math|\<omega\><rsub|0>>>natural radian frequency
  <|big-table>
    \;
  </big-table>

  <\thebibliography|99>
    <bibitem|arens1957>Arens, R. (1957). \PComplex processes for envelopes of
    normal noise.\Q <em|IRE Trans. on Information Theory>, 3, 204\U207.

    <bibitem|borino1988>Borino, G., Di Paola, M., and Muscolino, G. (1988).
    \PNon-stationary spectral moments of base excited MDOF systems.\Q (in
    press).

    <bibitem|corotis1977>Corotis, R. B., and Marshall, A. (1977).
    \POscillator response to modulated random excitation.\Q <em|J. Engrg.
    Mech. Div., ASCE>, 103(4), 501\U513.

    <bibitem|corotis1972>Corotis, R. B., Vanmarcke, E. H., and Cornell, C. A.
    (1972). \PFirst passage of non-stationary random processes.\Q <em|J.
    Engrg. Mech. Div., ASCE>, 98(2), 401\U414.

    <bibitem|cramer1967>Cramer, H., and Leadbetter, M. R. (1967).
    <em|Stationary and related stochastic processes>. John Wiley and Sons,
    Inc., New York, N.Y.

    <bibitem|dipaola1985>Di Paola, M. (1985). \PTransient spectral moments of
    linear systems.\Q <em|SM Archives>, 10, 225\U243.

    <bibitem|dipaola_muscolino1985>Di Paola, M., and Muscolino, G. (1985).
    \PResponse maxima of a SDOF system under seismic action.\Q <em|J. Struct.
    Engrg., ASCE>, 111(9), 2033\U2045.

    <bibitem|dipaola_muscolino1986>Di Paola, M., and Muscolino, G. (1986).
    \POn the convergent part of high spectral moments for stationary
    structural response.\Q <em|J. Sound Vib.>, 110(2), 233\U245.

    <bibitem|dugundji1958>Dugundji, J. (1958). \PEnvelope and pre-envelopes
    of real waveforms.\Q <em|IRE Trans. on Information Theory>, 4, 53\U57.

    <bibitem|grossmayer1977>Grossmayer, R. (1977). \PA seismic reliability
    and first passage failure.\Q <em|Random excitation of structures by
    earthquake and atmospheric turbulence, CISM Courses and Lectures 225>, H.
    Parkus, ed., Springer-Verlag, Wien-New York, 110\U200.

    <bibitem|krenk1979>Krenk, S. (1979). \PNon-stationary narrow-band
    response and first passage probability.\Q <em|J. Appl. Mech., ASME>, 46,
    919\U924.

    <bibitem|krenk1981>Krenk, S., Madsen, H. O., and Madsen, P. H. (1981).
    \PStationary and transient response envelopes.\Q <em|J. Engrg. Mech.
    Div., ASCE>, 109(1), 263\U277.

    <bibitem|langley1986>Langley, R. S. (1986). \POn various definitions of
    the envelope of a random process.\Q <em|J. Sound Vib.>, 105(3), 503\U512.

    <bibitem|lutes1978>Lutes, L. D., Chen, Y.-T. T., and Tzuang, S.-H.
    (1978). \PFirst-passage approximations for simple oscillators.\Q <em|J.
    Engrg. Mech. Div., ASCE>, 106(6), 1111\U1124.

    <bibitem|middleton1960>Middleton, D. (1960). <em|An introduction to
    statistical communication theory>. McGraw-Hill, Inc., New York, N.Y.

    <bibitem|naess1983>Naess, A. (1983). \PExtreme values of a stochastic
    process whose peak values are subjected to the Markov chain condition.\Q
    <em|Norwegian Maritime Res.>, 11, 29\U37.

    <bibitem|naess1984>Naess, A. (1984). \PThe effect of the Markov chain
    condition on the prediction of extreme values.\Q <em|J. Sound Vib.>,
    94(1), 87\U103.

    <bibitem|nigam1982>Nigam, N. C. (1982). \PPhase properties of a class of
    random processes.\Q <em|Earthquake Engrg. Struct. Dyn.>, 10, 711\U717.

    <bibitem|papoulis1984>Papoulis, A. (1984). <em|Signal Analysis>.
    McGraw-Hill, Inc., New York, N.Y.

    <bibitem|preumont1985>Preumont, A. (1985). \POn the peak factor of
    stationary Gaussian process.\Q <em|J. Sound Vib.>, 100(1), 15\U34.

    <bibitem|priestley1967>Priestley, M. B. (1967). \PPower spectral analysis
    of non-stationary random processes.\Q <em|J. Sound Vib.>, 6, 86\U87.

    <bibitem|rice1955>Rice, S. O. (1955). \PMathematical analysis of random
    noise.\Q <em|Selected papers on noise and stochastic processes>, N. Wax,
    ed., Dover Publications, Inc., New York, N.Y.

    <bibitem|spanos1983>Spanos, P. T. D., and Solomos, G. P. (1983). \PMarkov
    approximation to transient vibration.\Q <em|J. Engrg. Mech. Div., ASCE>,
    109(4), 1134\U1150.

    <bibitem|vanmarcke1972>Vanmarcke, E. H. (1972). \PProperties of spectral
    moments with applications to random vibration.\Q <em|J. Engrg. Mech.
    Div., ASCE>, 98(2), 425\U446.

    <bibitem|vanmarcke1975>Vanmarcke, E. H. (1975). \POn the distribution of
    the first-passage time for normal stationary random processes.\Q <em|J.
    Appl. Mech., ASME>, 42, 215\U220.

    <bibitem|yang1972>Yang, J.-N. (1972). \PNon-Stationary envelope process
    and first excursion probability.\Q <em|J. Struct. Mech.>, 1, 231\U248.

    <bibitem|yang1971>Yang, J.-N., and Shinozuka, M. (1971). \POn the first
    excursion probability in stationary narrow-band random vibration.\Q
    <em|J. Appl. Mech., ASME>, 38, 1017\U1022.
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
    <associate|auto-10|<tuple|6|7>>
    <associate|auto-11|<tuple|7|8>>
    <associate|auto-12|<tuple|7|8>>
    <associate|auto-13|<tuple|8|8>>
    <associate|auto-14|<tuple|9|9>>
    <associate|auto-15|<tuple|<with|mode|<quote|math>|\<omega\><rsub|0>>|11>>
    <associate|auto-16|<tuple|1|?>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-4|<tuple|2.2|3>>
    <associate|auto-5|<tuple|3|4>>
    <associate|auto-6|<tuple|4|5>>
    <associate|auto-7|<tuple|4.1|5>>
    <associate|auto-8|<tuple|4.2|6>>
    <associate|auto-9|<tuple|5|6>>
    <associate|bib-arens1957|<tuple|arens1957|11>>
    <associate|bib-borino1988|<tuple|borino1988|11>>
    <associate|bib-corotis1972|<tuple|corotis1972|11>>
    <associate|bib-corotis1977|<tuple|corotis1977|11>>
    <associate|bib-cramer1967|<tuple|cramer1967|11>>
    <associate|bib-dipaola1985|<tuple|dipaola1985|11>>
    <associate|bib-dipaola_muscolino1985|<tuple|dipaola_muscolino1985|11>>
    <associate|bib-dipaola_muscolino1986|<tuple|dipaola_muscolino1986|11>>
    <associate|bib-dugundji1958|<tuple|dugundji1958|11>>
    <associate|bib-grossmayer1977|<tuple|grossmayer1977|11>>
    <associate|bib-krenk1979|<tuple|krenk1979|11>>
    <associate|bib-krenk1981|<tuple|krenk1981|11>>
    <associate|bib-langley1986|<tuple|langley1986|11>>
    <associate|bib-lutes1978|<tuple|lutes1978|11>>
    <associate|bib-middleton1960|<tuple|middleton1960|11>>
    <associate|bib-naess1983|<tuple|naess1983|11>>
    <associate|bib-naess1984|<tuple|naess1984|11>>
    <associate|bib-nigam1982|<tuple|nigam1982|11>>
    <associate|bib-papoulis1984|<tuple|papoulis1984|11>>
    <associate|bib-preumont1985|<tuple|preumont1985|11>>
    <associate|bib-priestley1967|<tuple|priestley1967|11>>
    <associate|bib-rice1955|<tuple|rice1955|11>>
    <associate|bib-spanos1983|<tuple|spanos1983|11>>
    <associate|bib-vanmarcke1972|<tuple|vanmarcke1972|11>>
    <associate|bib-vanmarcke1975|<tuple|vanmarcke1975|11>>
    <associate|bib-yang1971|<tuple|yang1971|11>>
    <associate|bib-yang1972|<tuple|yang1972|11>>
    <associate|eq:K_mz|<tuple|26|6>>
    <associate|eq:Ps_v_x|<tuple|17|4>>
    <associate|eq:Ps_v_x_stationary|<tuple|22|5>>
    <associate|eq:Xm_def|<tuple|15|4>>
    <associate|eq:Zm_def|<tuple|25|6>>
    <associate|eq:analytic_corr|<tuple|34|8>>
    <associate|eq:analytic_output|<tuple|5|3>>
    <associate|eq:analytic_psd|<tuple|35|8>>
    <associate|eq:analytic_psd_final|<tuple|37|9>>
    <associate|eq:cross_corr_matrix|<tuple|16|4>>
    <associate|eq:drx_dt|<tuple|18|5>>
    <associate|eq:envelope_def|<tuple|9|3>>
    <associate|eq:failure_rate|<tuple|31|7>>
    <associate|eq:first_excursion_approx|<tuple|33|7>>
    <associate|eq:first_excursion_prob|<tuple|32|7>>
    <associate|eq:hilbert_fourier|<tuple|36|8>>
    <associate|eq:hilbert_transform|<tuple|4|3>>
    <associate|eq:impulse_response|<tuple|19|5>>
    <associate|eq:interval_const|<tuple|30|7>>
    <associate|eq:jpdf_Zm|<tuple|27|6>>
    <associate|eq:mean_circ_freq|<tuple|29|7>>
    <associate|eq:mean_upcrossings|<tuple|28|6>>
    <associate|eq:nonstationary_envelope|<tuple|13|4>>
    <associate|eq:nonstationary_input|<tuple|11|3>>
    <associate|eq:nonstationary_output|<tuple|12|4>>
    <associate|eq:nonstationary_phase|<tuple|14|4>>
    <associate|eq:nonstationary_spec_moments|<tuple|24|6>>
    <associate|eq:one_sided_psd|<tuple|2|2>>
    <associate|eq:ph_tau|<tuple|21|5>>
    <associate|eq:phase_def|<tuple|10|3>>
    <associate|eq:pn_tau|<tuple|20|5>>
    <associate|eq:polar_output|<tuple|6|3>>
    <associate|eq:polar_y|<tuple|7|3>>
    <associate|eq:polar_ytilde|<tuple|8|3>>
    <associate|eq:pre_envelope|<tuple|3|2>>
    <associate|eq:sdof_motion|<tuple|1|2>>
    <associate|eq:spectral_moments|<tuple|23|5>>
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

      dipaola_muscolino1985

      papoulis1984

      vanmarcke1972

      borino1988

      vanmarcke1972

      vanmarcke1975

      rice1955

      middleton1960

      krenk1979

      naess1983

      naess1984

      preumont1985

      yang1971

      yang1971

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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Cross-Covariance
      Spectral Matrix> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Stationary Case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Nonstationary Case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Mean-Rate
      Threshold Crossing for Circular Barriers>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>First-Passage
      Probability> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgments>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>PSD
      of Analytic Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Notation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>