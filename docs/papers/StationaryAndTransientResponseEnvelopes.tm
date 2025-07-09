<TeXmacs|2.1.4>

<style|<tuple|generic|metal|framed-theorems>>

<\body>
  <doc-data|<doc-title|Stationary and Transient Response
  Envelopes>|<doc-author|<author-data|<author-name|Steen
  Krenk>>>|<doc-author|<author-data|<author-name|Henrik O.
  Madsen>>>|<doc-author|<author-data|<author-name|Peter H.
  Madsen>>>|<doc-date|>>

  <abstract-data|<\abstract>
    An envelope is introduced by using the Hilbert transform to define a
    complex conjugate to the excitation and response processes of a linear
    structure. Time-limited stationary excitation is treated in detail, and
    the complex correlation function is shown to follow from its stationary
    equivalent by use of a suitable differential operator. Simple expressions
    are derived for the case of rational spectral density, and a parametric
    study of the influence of the frequency content is carried out. It is
    found that envelope crossings can be predicted by use of stationary
    measures for the mean crossing frequency and the bandwidth of the
    response combined with the non-stationary intensity. This is
    computationally important as these parameters are often available in
    closed form. Finally, the envelope is used to study the first-passage
    probability.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Stationary
    Pre-Envelope> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Zero
    Start Conditions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Evaluation
    of Correlation Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Crossing
    Frequencies> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>First
    Passage Probability> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Summary
    and Conclusions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  In a number of situations where structures are subjected to random loads of
  short duration, it is important to be able to account for the transient
  properties of the response. However, often only limited information about
  the exciting forces is available. This makes it important to identify the
  essential features and to concentrate the computational efforts on them.

  In stationary response analysis it is often convenient to use spectrum
  representation of the covariance functions of the exciting force and the
  response. The reason is partly computational convenience and partly the
  physical interpretation associated with the spectrum. The concept of a
  stochastic process as a linear combination of independent frequency
  components can be generalized to nonstationary stochastic processes by
  introduction of an evolutionary power spectrum<nbsp><cite|priestley1965|priestley1967>.
  The evolutionary power spectrum is a time dependent generalization of the
  classic power spectrum in the sense that it is a non-negative function, and
  its integral over the full frequency range gives the variance of the
  process.

  However, a complete integral representation of the covariance function
  requires factorization of the evolutionary power spectrum and, thus, the
  simple relation between the derivatives of the covariance function and the
  spectral moment known from the stationary case is lost.

  A description of nonstationary stochastic response by a direct analogy,
  where the stationary spectral moments are replaced with similar moments of
  the evolutionary power spectrum, was proposed by Corotis et
  al.<nbsp><cite|corotis1972>. However, this approach is inconsistent as is
  clearly demonstrated by comparison with the rigorous analysis of the same
  problem by Yang<nbsp><cite|yang1972>. One of the differences is that the
  evolutionary power spectrum does not possess the same number of moments as
  its stationary counterpart; indeed, moments necessary for the analogy may
  be divergent. From an analytical point of view this is not a serious
  problem because the expressions for the derivatives of the covariance
  function include time derivatives securing convergence. But, the fact that
  only the variance can be expressed directly in terms of the evolutionary
  power spectrum of a specific point in time severely limits the analogy with
  the classic power spectrum.

  In a number of problems of practical interest, the nonstationary stochastic
  process may be considered as the output of a linear system with stationary
  input. Often the exciting force is modeled as a modulated stationary
  process. It is then possible to express the correlation function(s) of the
  response directly in terms of the correlation function(s) of the
  corresponding stationary response. In that case, the power spectrum of the
  stationary process can be used directly thereby avoiding the need for
  formalism for evolutionary power spectra. For a step function variation of
  the modulation, this problem was treated by Madsen and
  Krenk<nbsp><cite|madsen1982> for multi-degree of freedom structures.

  The present work concentrates on a different aspect of the same problem,
  i.e., definition and characterization of an envelope of the transient
  response in terms of an envelope for the corresponding stationary response.
  The envelope is particularly important in characterizing the response of
  lightly damped structures to wide-band excitation, and has found specific
  application in evaluation of first passage probabilities.

  First an envelope is defined for the stationary response by use of complex
  variables. Then the definition is extended to the case of zero initial
  conditions and stationary excitation of arbitrary frequency content in
  which closed form results are derived when the frequency content is in the
  form of a rational function. A parametric study is conducted to demonstrate
  the influence of the frequency content and the damping ratio on the
  parameters describing the up-crossing frequencies of the response. Finally,
  the results are used to give a comparison of two methods for approximate
  evaluation of the first-passage probability of the transient response.

  <section|Stationary Pre-Envelope>

  Let the stationary stochastic process <math|X<around|(|t|)>> be the
  solution of the differential equation of a linear oscillator:

  <\equation>
    <wide|X|\<ddot\>><around|(|t|)>+2*\<zeta\>*\<omega\><rsub|0>*<wide|X|\<dot\>><around|(|t|)>+\<omega\><rsub|0><rsup|2>*X<around|(|t|)>=F<around|(|t|)><label|eq:oscillator>
  </equation>

  where the stationary stochastic process <math|F<around|(|t|)>> is a forcing
  function; <math|\<omega\><rsub|0>> is the natural undamped angular
  frequency; and <math|\<zeta\>> is the relative damping of the oscillator.
  (Dots denote differentiation with respect to time.)

  The forcing process <math|F<around|(|t|)>> is real with zero mean, and its
  correlation function <math|r<rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)>> can
  be expressed in terms of the real, non-negative spectral density function
  <math|S<rsub|F*F><around|(|\<omega\>|)>>:

  <\equation>
    r<rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)>=\<bbb-E\>*<around|[|F<around|(|t<rsub|1>|)>*F<around|(|t<rsub|2>|)>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|F*F><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*d*\<omega\><label|eq:correlation>
  </equation>

  where <math|\<bbb-E\><around|[|\<cdummy\>|]>> denotes the expected value.

  The idea of the pre-envelope, introduced by
  Dugundji<nbsp><cite|dugundji1958> and Arens<nbsp><cite|arens1957>, is to
  define suitable complex processes, <math|Z<around|(|t|)>> and
  <math|L<around|(|t|)>>, such that <math|X<around|(|t|)>> and
  <math|F<around|(|t|)>> are the corresponding real parts. A useful way of
  doing this is to define the imaginary parts as the Hilbert transforms
  <math|<wide|X|~><around|(|t|)>> and <math|<wide|F|~><around|(|t|)>>:

  <\equation>
    <wide|X|~><around|(|t|)>=\<cal-H\><around|[|X|]><around|(|t|)><label|eq:hilbert>
  </equation>

  A similar formula defines <math|<wide|F|~><around|(|t|)>>. The reason
  behind this choice is that the Hilbert transformation replaces <math|cos
  <around|(|\<omega\>*t+\<phi\>|)>> with <math|sin
  <around|(|\<omega\>*t+\<phi\>|)>>, and thus increases the phase angle in
  all trigonometric components of a function by <math|\<pi\>/2>.

  In many problems of practical interest, the damping will be small and
  <math|X<around|(|t|)>> is a process with narrow bandwidth. Then the Hilbert
  transform, <math|<wide|X|~><around|(|t|)>>, is approximately proportional
  with the time derivative, <math|<wide|X|\<dot\>><around|(|t|)>>, while
  being a smoother function.

  When considering the complex response

  <\equation>
    Z<around|(|t|)>=X<around|(|t|)>+i*<wide|X|~><around|(|t|)><label|eq:complex_response>
  </equation>

  to the complex force

  <\equation>
    L<around|(|t|)>=F<around|(|t|)>+i*<wide|F|~><around|(|t|)><label|eq:complex_force>
  </equation>

  it is convenient to use complex correlation functions. From the symmetry
  relations<nbsp><cite|papoulis1965>:

  <\align>
    <tformat|<table|<row|<cell|r<rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)>>|<cell|=r<rsub|F*F><around|(|t<rsub|2>,t<rsub|1>|)><eq-number><label|eq:sym1>>>|<row|<cell|r<rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)>>|<cell|=-r<rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)><eq-number><label|eq:sym2>>>>>
  </align>

  it follows that the complex correlation function,
  <math|r<rsub|L*L><around|(|t<rsub|1>,t<rsub|2>|)>>, can be written as

  <\equation>
    r<rsub|L*L><around|(|t<rsub|1>,t<rsub|2>|)>=\<bbb-E\><around|[|L<around|(|t<rsub|1>|)><wide|L<around|(|t<rsub|2>|)>|\<bar\>>|]>=2*<around*|[|r<rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)>+i*<wide|r|~><rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)>|]><label|eq:complex_corr>
  </equation>

  where <math|<wide|L<around|(|t<rsub|2>|)>|\<bar\>>> is the complex
  conjugate of <math|L<around|(|t<rsub|2>|)>>. The correlation functions only
  depend on the difference <math|\<tau\>=t<rsub|1>-t<rsub|2>>.

  Furthermore, it can be shown that the cross-correlation function,
  <math|<wide|r|~><rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)>>, can be written
  in terms of the spectral density function,
  <math|S<rsub|F*F><around|(|\<omega\>|)>>, by introducing the filter
  <math|-i<space|0.17em><text|sign><around|(|\<omega\>|)>> under the integral
  sign in equation<nbsp><eqref|eq:correlation>:

  <\equation>
    <wide|r|~><rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|[|-i<space|0.17em><text|sign><around|(|\<omega\>|)>|]>*S<rsub|F*F><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*d*\<omega\><label|eq:hilbert_corr>
  </equation>

  Use of equation<nbsp><eqref|eq:complex_corr> then yields the following
  formula for the complex correlation function
  <math|r<rsub|L*L><around|(|t<rsub|1>,t<rsub|2>|)>> in terms of the spectral
  density function <math|S<rsub|F*F><around|(|\<omega\>|)>> for the real
  forcing function <math|F<around|(|t|)>>:

  <\equation>
    r<rsub|L*L><around|(|t<rsub|1>,t<rsub|2>|)>=4*<big|int><rsub|0><rsup|\<infty\>>S<rsub|F*F><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*d*\<omega\><label|eq:complex_corr_sff>
  </equation>

  The solution to differential equation<nbsp><eqref|eq:oscillator> is given
  as a convolution integral of the forcing function and the impulse response
  function <math|h<around|(|t|)>>:

  <\equation>
    h<around|(|t|)>=<frac|1|\<omega\><rsub|d>>*e<rsup|-\<zeta\>*\<omega\><rsub|0>*t>*sin
    <around|(|\<omega\><rsub|d>*t|)>,<space|1em>t\<geq\>0<label|eq:impulse_response>
  </equation>

  where <math|\<omega\><rsub|d>=\<omega\><rsub|0>*<sqrt|1-\<zeta\><rsup|2>>>
  is the damped natural angular frequency.

  The complex correlation function <math|r<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>>
  follows by taking the expected value:

  <\equation>
    r<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>=<iint>r<rsub|L*L><around|(|\<tau\><rsub|1>,\<tau\><rsub|2>|)>*h*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*h*<around|(|t<rsub|2>-\<tau\><rsub|2>|)>*d*\<tau\><rsub|1>*d*\<tau\><rsub|2><label|eq:complex_corr_response>
  </equation>

  Upon substitution of equation<nbsp><eqref|eq:complex_corr_sff>, and change
  of the order of integration, equation<nbsp><eqref|eq:complex_corr_response>
  takes the form

  <\equation>
    r<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>=4*<big|int><rsub|0><rsup|\<infty\>>S<rsub|F*F><around|(|\<omega\>|)>*S<rsub|H><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*d*\<omega\><label|eq:rzz_sh>
  </equation>

  where <math|S<rsub|H><around|(|\<omega\>|)>> is given in terms of the
  transfer function

  <\equation>
    H<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>h<around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>=<frac|1|\<omega\><rsub|0><rsup|2>-\<omega\><rsup|2>+2*i*\<zeta\>*\<omega\><rsub|0>*\<omega\>><label|eq:transfer_function>
  </equation>

  and <math|S<rsub|H><around|(|\<omega\>|)>=H<around|(|\<omega\>|)><wide|H<around|(|\<omega\>|)>|\<bar\>>>.

  The stochastic process defined by

  <\equation>
    R<around|(|t|)>=<around|\||Z<around|(|t|)>|\|>=<sqrt|X<around|(|t|)><rsup|2>+<wide|X|~><around|(|t|)><rsup|2>><label|eq:envelope>
  </equation>

  is the envelope of Cramér and Leadbetter<nbsp><cite|cramer1967>. The
  advantage in terms of a complex forcing function is the simplicity with
  which it is generalized to transient response.

  <section|Zero Start Conditions>

  The response to an excitation of the form
  <math|U<around|(|t|)>*L<around|(|t|)>>, in which <math|U<around|(|t|)>> is
  the Heaviside step function, and <math|L<around|(|t|)>> is the stationary
  complex function of equation<nbsp><eqref|eq:complex_force>, can be treated
  by a simple extension of equation<nbsp><eqref|eq:rzz_sh>. Let
  <math|Z<around|(|t|)>> satisfy the differential equation

  <\equation>
    <wide|Z|\<ddot\>><around|(|t|)>+2*\<zeta\>*\<omega\><rsub|0>*<wide|Z|\<dot\>><around|(|t|)>+\<omega\><rsub|0><rsup|2>*Z<around|(|t|)>=U<around|(|t|)>*L<around|(|t|)><label|eq:zero_start>
  </equation>

  with the initial conditions <math|Z<around|(|0|)>=<wide|Z|\<dot\>><around|(|0|)>=0>.

  The correlation function for <math|Z<around|(|t|)>> is now

  <\equation>
    R<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>=<big|iint>r<rsub|L*L><around|(|\<tau\><rsub|1>,\<tau\><rsub|2>|)>*h*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*h*<around|(|t<rsub|2>-\<tau\><rsub|2>|)>*d*\<tau\><rsub|1>*d*\<tau\><rsub|2><label|eq:RZZ>
  </equation>

  where the notation <math|R<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>> is
  used to distinguish from the stationary case. Substitution of
  equation<nbsp><eqref|eq:complex_corr_sff> and change of the order of
  integration leads to the expression

  <\equation>
    R<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>=4*<big|int><rsub|0><rsup|\<infty\>>S<rsub|F*F><around|(|\<omega\>|)>*H<around|(|\<omega\>,t<rsub|1>|)>*H<around|(|\<omega\>,t<rsub|2>|)>*e<rsup|i*\<omega\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*d*\<omega\><label|eq:RZZ_H>
  </equation>

  where <math|H<around|(|\<omega\>,t|)>> is the time-dependent transfer
  function as defined by Lin<nbsp><cite|lin1976>. It is conveniently
  expressed in terms of the impulse response function <math|h<around|(|t|)>>
  of equation<nbsp><eqref|eq:impulse_response> and the function
  <math|g<around|(|t|)>>:

  <\equation>
    g<around|(|t|)>=<choice|<tformat|<table|<row|<cell|e<rsup|-\<zeta\>*\<omega\><rsub|0>*t>*<around*|[|cos
    <around|(|\<omega\><rsub|d>*t|)>+<frac|\<zeta\>|<sqrt|1-\<zeta\><rsup|2>>>*sin
    <around|(|\<omega\><rsub|d>*t|)>|]>,>|<cell|t\<geq\>0>>|<row|<cell|0,>|<cell|t\<less\>0>>>>><label|eq:g_function>
  </equation>

  in which <math|h<around|(|t|)>> is the response of the unloaded system with
  initial conditions <math|x<around|(|0|)>=0>,
  <math|<wide|x|\<dot\>><around|(|0|)>=1>; the function
  <math|g<around|(|t|)>> describes the response for the initial conditions
  <math|x<around|(|0|)>=1>, <math|<wide|x|\<dot\>><around|(|0|)>=0>. In terms
  of <math|g<around|(|t|)>> and <math|h<around|(|t|)>>,

  <\equation>
    H<around|(|\<omega\>,t|)>=H<around|(|\<omega\>|)>*<around*|{|1-<around|[|g<around|(|t|)>+i*\<omega\>*h<around|(|t|)>|]>*e<rsup|-i*\<omega\>*t>|}><label|eq:H_time>
  </equation>

  Substitution of equation<nbsp><eqref|eq:H_time> into
  equation<nbsp><eqref|eq:RZZ_H> yields

  <\align>
    <tformat|<table|<row|<cell|R<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>=4*<big|int><rsub|0><rsup|\<infty\>>S<rsub|F*F><around|(|\<omega\>|)>*H<around|(|\<omega\>|)><wide|H<around|(|\<omega\>|)>|\<bar\>><around|{|1-<around|[|g<around|(|t<rsub|1>|)>+i*\<omega\>*h<around|(|t<rsub|1>|)>|]>*e<rsup|-i*\<omega\>*t<rsub|1>>|}>>>|<row|<cell|\<times\><around|{|1-<around|[|g<around|(|t<rsub|2>|)>-i*\<omega\>*h<around|(|t<rsub|2>|)>|]>*e<rsup|i*\<omega\>*t<rsub|2>>|}>*e<rsup|i*\<omega\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*d*\<omega\><eq-number><label|eq:RZZ_full>>>>>
  </align>

  As neither <math|g<around|(|\<cdummy\>|)>> nor
  <math|h<around|(|\<cdummy\>|)>> contains the integration variable, it
  follows from equation<nbsp><eqref|eq:rzz_sh> that
  <math|R<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>> can be obtained from
  <math|r<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>> by differentiation.
  Written in operator form:

  <\equation>
    R<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>=<around*|{|1-<around|[|g<around|(|t<rsub|1>|)>+h<around|(|t<rsub|1>|)><frac|d|d*t<rsub|1>>|]>|}>*<around*|{|1-<around|[|g<around|(|t<rsub|2>|)>+h<around|(|t<rsub|2>|)><frac|d|d*t<rsub|2>>|]>|}>*r<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)><label|eq:RZZ_operator>
  </equation>

  The equations<nbsp><eqref|eq:sym1>-<eqref|eq:sym2> also hold for
  <math|R<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>>, and the real
  correlation functions <math|R<rsub|X*X><around|(|t<rsub|1>,t<rsub|2>|)>>
  and <math|R<rsub|<wide|X|~>*<wide|X|~>><around|(|t<rsub|1>,t<rsub|2>|)>>
  therefore follow directly from equation<nbsp><eqref|eq:RZZ_operator>. After
  a slight reduction by use of equations<nbsp><eqref|eq:sym1>-<eqref|eq:sym2>
  the following expressions are obtained:

  <\align>
    <tformat|<table|<row|<cell|R<rsub|X*X><around|(|t<rsub|1>,t<rsub|2>|)>>|<cell|=r<rsub|X*X><around|(|t<rsub|1>,t<rsub|2>|)>-g<around|(|t<rsub|1>|)>*r<rsub|X*X><around|(|0,t<rsub|2>|)>-g<around|(|t<rsub|2>|)>*r<rsub|X*X><around|(|t<rsub|1>,0|)>>>|<row|<cell|>|<cell|<space|1em>-h<around|(|t<rsub|1>|)><around*|\<nobracket\>|<frac|\<partial\>*r<rsub|X*X><around|(|\<tau\>,t<rsub|2>|)>|\<partial\>*\<tau\>>|\|><rsub|\<tau\>=0>-h<around|(|t<rsub|2>|)><around*|\<nobracket\>|<frac|\<partial\>*r<rsub|X*X><around|(|t<rsub|1>,\<tau\>|)>|\<partial\>*\<tau\>>|\|><rsub|\<tau\>=0>>>|<row|<cell|>|<cell|<space|1em>+g<around|(|t<rsub|1>|)>*g<around|(|t<rsub|2>|)>*r<rsub|X*X><around|(|0,0|)>+h<around|(|t<rsub|1>|)>*h<around|(|t<rsub|2>|)><around*|\<nobracket\>|<frac|\<partial\><rsup|2>*r<rsub|X*X><around|(|\<tau\><rsub|1>,\<tau\><rsub|2>|)>|\<partial\>*\<tau\><rsub|1>*\<partial\>*\<tau\><rsub|2>>|\|><rsub|\<tau\><rsub|1>=\<tau\><rsub|2>=0><eq-number><label|eq:RXX>>>>>
  </align>

  It follows from equation<nbsp><eqref|eq:RXX> (or directly from
  equation<nbsp><eqref|eq:RZZ_H>) that

  <\equation>
    R<rsub|X*<wide|X|~>><around|(|t,t|)>=0<label|eq:uncorrelated>
  </equation>

  implying that <math|X<around|(|t|)>> and <math|<wide|X|~><around|(|t|)>>
  are uncorrelated.

  <section|Evaluation of Correlation Functions>

  The usefulness of equations<nbsp><eqref|eq:RZZ_operator>-<eqref|eq:RXX>
  expressing <math|R<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>> in terms of
  <math|r<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>> and its derivatives is
  greatly increased if the correlation function
  <math|r<rsub|Z*Z><around|(|t<rsub|1>,t<rsub|2>|)>> for the stationary
  response can be expressed in closed form. This is the case where
  <math|S<rsub|F*F><around|(|\<omega\>|)>> is a rational function. In the
  following, the case of higher order poles is excluded. On the real axis,
  <math|S<rsub|F*F><around|(|\<omega\>|)>> is an even, real function and it
  can, therefore, be represented in the form

  <\equation>
    S<rsub|F*F><around|(|\<omega\>|)>=C<rsub|0>+<big|sum><rsub|k=1><rsup|N><around*|(|<frac|C<rsub|k>|\<omega\>-\<Omega\><rsub|k>>+<frac|<wide|C<rsub|k>|\<bar\>>|\<omega\>+<wide|\<Omega\><rsub|k>|\<bar\>>>|)><label|eq:SFF_rational>
  </equation>

  where <math|\<Omega\><rsub|k>> are the poles; and <math|C<rsub|k>> are the
  residues in the first quadrant.

  In the same notation the transfer function is

  <\equation>
    H<around|(|\<omega\>|)>=<frac|1|\<omega\><rsub|0><rsup|2>-\<omega\><rsup|2>+2*i*\<zeta\>*\<omega\><rsub|0>*\<omega\>><label|eq:H_rational>
  </equation>

  For <math|t<rsub|1>\<neq\>t<rsub|2>>, the integral in
  equation<nbsp><eqref|eq:rzz_sh> can now be evaluated by closing the line of
  integration by a quarter circle and the positive imaginary axis:

  <with|font-base-size|9|<\equation>
    r<rsub|X*X><around|(|t<rsub|1>,t<rsub|2>|)>=4*\<pi\>*<big|sum><rsub|k=1><rsup|N>C<rsub|k>*S<rsub|H><around|(|\<Omega\><rsub|k>|)>*e<rsup|i*\<Omega\><rsub|k>*<around|(|t<rsub|1>-t<rsub|2>|)>>+4*i*<big|int><rsub|0><rsup|\<infty\>>S<rsub|F*F>*<around|(|i*p|)>*S<rsub|H>*<around|(|i*p|)>*e<rsup|-p*<around|(|t<rsub|1>-t<rsub|2>|)>>*d*p<label|eq:rxx_closed>
  </equation>>

  The integral in equation<nbsp><eqref|eq:rxx_closed> is real and does not
  contribute to the correlation function <math|r<rsub|X*X><around|(|t<rsub|1>,t<rsub|2>|)>>.

  A number of important properties of the stationary process
  <math|X<around|(|t|)>> are given in terms of the even moments:

  <\equation>
    \<lambda\><rsub|0>=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>S<rsub|F*F><around|(|\<omega\>|)>*S<rsub|H><around|(|\<omega\>|)>*d*\<omega\><label|eq:lambda0>
  </equation>

  Characterization of the envelope also requires the odd moment,
  <math|\<lambda\><rsub|1>>:

  <\equation>
    \<lambda\><rsub|1>=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>\<omega\>*S<rsub|F*F><around|(|\<omega\>|)>*S<rsub|H><around|(|\<omega\>|)>*d*\<omega\><label|eq:lambda1>
  </equation>

  <section|Crossing Frequencies>

  It is convenient to analyze crossing frequencies of the response process
  <math|X<around|(|t|)>> and its envelope process <math|R<around|(|t|)>> in
  terms of the normalized complex response process

  <\equation>
    W<around|(|t|)>=Y<around|(|t|)>+i*<wide|Y|~><around|(|t|)>=<frac|Z<around|(|t|)>|\<sigma\><rsub|X><around|(|t|)>><label|eq:normalized_complex>
  </equation>

  where <math|\<sigma\><rsub|X><around|(|t|)>> is the standard deviation of
  <math|X<around|(|t|)>>. From equations<nbsp><eqref|eq:RXX>
  and<nbsp><eqref|eq:lambda0>:

  <\equation>
    \<sigma\><rsub|X><rsup|2><around|(|t|)>=\<lambda\><rsub|0>+\<lambda\><rsub|0>*g<rsup|2><around|(|t|)>+\<lambda\><rsub|2>*h<rsup|2><around|(|t|)>-2*g<around|(|t|)>*r<rsub|X*X><around|(|t,0|)>-2*h<around|(|t|)><around*|\<nobracket\>|<frac|\<partial\>*r<rsub|X*X><around|(|t,\<tau\>|)>|\<partial\>*\<tau\>>|\|><rsub|\<tau\>=0><label|eq:sigmaX>
  </equation>

  By differentiation and use of equations<nbsp><eqref|eq:impulse_response>
  and<nbsp><eqref|eq:g_function>:

  <\align>
    <tformat|<table|<row|<cell|\<sigma\><rsub|X><rsup|2><around|(|t|)>*<wide|X|\<dot\>><around|(|t|)>>|<cell|=h<around|(|t|)>*2*g<around|(|t|)>-\<omega\>*h<around|(|t|)>*<around|[|<wide|g|\<dot\>><around|(|t|)>-r<rsub|X*X><around|(|t,0|)>|]>-2*\<zeta\>*\<omega\><rsub|0>*h<around|(|t|)><around*|\<nobracket\>|<frac|\<partial\>*r<rsub|X*X><around|(|t,\<tau\>|)>|\<partial\>*\<tau\>>|\|><rsub|\<tau\>=0><eq-number><label|eq:sigmaX_dot>>>>>
  </align>

  The expected number of up-crossings of the level <math|s<around|(|t|)>> by
  <math|X<around|(|t|)>> is equal to the expected number of up-crossings of
  the normalized level <math|\<eta\><around|(|t|)>=s<around|(|t|)>/\<sigma\><rsub|X><around|(|t|)>>
  by <math|Y<around|(|t|)>>. Due to the normalization, <math|Y<around|(|t|)>>
  and <math|<wide|Y|~><around|(|t|)>> are uncorrelated and thus for normal
  processes the up-crossing rate<nbsp><cite|rice1955> is

  <\equation>
    \<nu\><around|(|t|)>=\<omega\><around|(|t|)>*\<varphi\><around|(|\<eta\>|)><label|eq:upcrossing>
  </equation>

  where <math|\<omega\><around|(|t|)>> is the standard deviation of
  <math|<wide|Y|\<dot\>><around|(|t|)>>, and
  <math|\<varphi\><around|(|\<eta\>|)>> is the standard normal density.

  When <math|X<around|(|t|)>> is a normal process, an equally simple
  expression is found for the up-crossing rate of the normalized envelope:

  <\equation>
    Q<around|(|t|)>=<sqrt|Y<rsup|2><around|(|t|)>+<wide|Y|~><rsup|2><around|(|t|)>><label|eq:Q_envelope>
  </equation>

  The covariance matrix of the stochastic variables <math|Y<around|(|t|)>>,
  <math|<wide|Y|~><around|(|t|)>>, <math|<wide|Y|\<dot\>><around|(|t|)>>, and
  <math|<wide|<wide|Y|~>|\<dot\>><around|(|t|)>> is

  <\equation>
    <matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|-\<xi\>>>|<row|<cell|0>|<cell|1>|<cell|\<xi\>>|<cell|0>>|<row|<cell|0>|<cell|\<xi\>>|<cell|\<omega\><rsup|2>>|<cell|0>>|<row|<cell|-\<xi\>>|<cell|0>|<cell|0>|<cell|\<omega\><rsup|2>>>>>><label|eq:cov_matrix>
  </equation>

  in which the function <math|\<xi\><around|(|t|)>> is given by

  <\equation>
    \<xi\><around|(|t|)>=<frac|1|\<sigma\><rsub|X><rsup|2><around|(|t|)>><around*|\<nobracket\>|<frac|\<partial\>*R<rsub|X*X><around|(|t<rsub|1>,t<rsub|2>|)>|\<partial\>*t<rsub|1>*\<partial\>*t<rsub|2>>|\|><rsub|t<rsub|1>=t<rsub|2>=t><label|eq:xi>
  </equation>

  For a normal process, the substitution <math|W<around|(|t|)>=Q<around|(|t|)>*e<rsup|i*\<theta\><around|(|t|)>>>
  leads to the probability density functions

  <\align>
    <tformat|<table|<row|<cell|f<rsub|Q><around|(|q|)>>|<cell|=q*exp
    <around*|(|-<frac|q<rsup|2>|2*<around|(|\<omega\><rsup|2>-\<xi\><rsup|2>|)>>|)><eq-number><label|eq:fQ>>>|<row|<cell|f<rsub|\<theta\>><around|(|\<theta\>|)>>|<cell|=<frac|1|<sqrt|2*\<pi\>*<around|(|\<omega\><rsup|2>-\<xi\><rsup|2>|)>>>*exp
    <around*|(|-<frac|\<theta\><rsup|2>|2*<around|(|\<omega\><rsup|2>-\<xi\><rsup|2>|)>>|)><eq-number><label|eq:ftheta>>>>>
  </align>

  showing that <math|Q<around|(|t|)>> and <math|\<theta\><around|(|t|)>> are
  mutually independent with Rayleigh and normal distributions, respectively.

  The up-crossing rate for the envelope then is

  <\equation>
    \<nu\><rsub|e><around|(|t|)>=<frac|\<omega\><around|(|t|)>|<sqrt|\<omega\><rsup|2><around|(|t|)>-\<xi\><rsup|2><around|(|t|)>>>*exp
    <around*|(|-<frac|\<eta\><rsup|2>|2*<around|(|\<omega\><rsup|2><around|(|t|)>-\<xi\><rsup|2><around|(|t|)>|)>>|)><label|eq:nu_e>
  </equation>

  <section|First Passage Probability>

  The main purpose of the previous derivations is to obtain estimates of the
  probability that the response variable <math|X<around|(|\<tau\>|)>> remains
  inside specified boundaries in the time interval
  <math|0\<leq\>\<tau\>\<less\>t>. In the following, the analysis is limited
  to the symmetric barriers <math|-\<xi\><around|(|\<tau\>|)>\<less\>X<around|(|\<tau\>|)>-\<mu\><around|(|\<tau\>|)>\<less\>\<xi\><around|(|\<tau\>|)>>.

  In the case of a narrow-band process, the outcrossings tend to occur in
  clumps and a useful concept in the analysis of the problem is the clump
  size introduced by Lyon<nbsp><cite|lyon1961> as the ratio of the
  outcrossing frequency of the process <math|X<around|(|\<tau\>|)>> to the
  outcrossing frequency of the envelope <math|R<around|(|\<tau\>|)>>, i.e.,
  <math|2*\<nu\><around|(|\<tau\>|)>/\<nu\><rsub|e><around|(|\<tau\>|)>>.

  From equations<nbsp><eqref|eq:upcrossing> and<nbsp><eqref|eq:nu_e> it is
  seen that the clump size contains the factor <math|\<eta\>> and, therefore,
  is less than one for large values of <math|\<eta\>>. An approximate
  solution to this problem was given by Vanmarcke<nbsp><cite|vanmarcke1975>
  who introduced the concept of qualified envelope crossings, i.e., envelope
  crossings followed by crossings of the process
  <math|X<around|(|\<tau\>|)>>. The corresponding crossing frequency is
  determined as

  <\equation>
    \<nu\><rsub|q><around|(|t|)>=2*\<nu\><around|(|t|)>*<around*|[|1-exp
    <around*|(|-<frac|\<nu\><rsub|e><around|(|t|)>|2*\<nu\><around|(|t|)>>|)>|]><label|eq:nu_q>
  </equation>

  When the outcrossings are assumed to be events in a Poisson process with
  intensity <math|\<nu\><around|(|t|)>>, the resulting first passage
  probability density is

  <\equation>
    p<around|(|t|)>=\<nu\><around|(|t|)>*exp
    <around*|(|-<big|int><rsub|0><rsup|t>\<nu\><around|(|s|)>*d*s|)><label|eq:first_passage>
  </equation>

  <section|Summary and Conclusions>

  An envelope is introduced by using the Hilbert transform to define complex
  stochastic excitation and response processes for a linear structure. In
  principle, the use of the Hilbert transform assumes stationary input, but
  the concept is easily extended to modulated stationary input. The special
  case of time-limited stationary excitation is treated in considerable
  detail and the complex correlation function in the nonstationary case is
  related to its stationary equivalent by a simple differential operator in
  equation<nbsp><eqref|eq:RZZ_operator>. In the important case of input with
  spectral density in the form of a rational function, the complex
  correlation function of the nonstationary response is reduced to a closed
  form expression apart from a purely imaginary integral term.

  Normalization of the response process and its envelope leads to simple
  expressions for expected crossing frequencies and, by use of the previously
  derived formulas, a parametric study of the influence of damping and
  frequency on the governing parameters is carried out. The most convenient
  choice of parameters is the standard deviation,
  <math|\<sigma\><rsub|X><around|(|t|)>>, an angular frequency parameter,
  <math|\<omega\><around|(|t|)>>, and a bandwidth parameter,
  <math|\<xi\><around|(|t|)>>. All three parameters depend on the damping
  ratio, while <math|\<xi\><around|(|t|)>> also depends significantly on the
  frequency content. It is important for applications that
  <math|\<omega\><around|(|t|)>> and <math|\<xi\><around|(|t|)>> approach
  their stationary values after a few periods.

  The concept of qualified envelope crossings is used to obtain an
  approximate formula for the first passage probability density, and a
  parameter study is carried out. The influence of the damping ratio is
  larger than that of the frequency content, and it seems justified to use
  the stationary bandwidth parameter also for the nonstationary response.
  This is computationally important because the stationary bandwidth
  parameter will often be available in closed form, e.g., from
  equations<nbsp><eqref|eq:lambda0>-<eqref|eq:lambda1> for input with
  rational spectral density.

  Finally, a comparison is made with the first passage probability density
  estimated by the point process approach. The agreement is good, but
  slightly higher values are obtained by the point process method.

  <new-page>

  <section*|References>

  <\thebibliography|99>
    <bibitem|arens1957>Arens, R., \PComplex Processes for Envelopes of Normal
    Noise,\Q <em|IRE Transactions on Information Theory>, Vol. 3, 1957, pp.
    204\U207.

    <bibitem|corotis1972>Corotis, R. B., Vanmarcke, E. H., and Cornell, C.
    A., \PFirst Passage of Nonstationary Random Processes,\Q <em|Journal of
    the Engineering Mechanics Division, ASCE>, Vol. 98, No. EM2, 1972, pp.
    401\U414.

    <bibitem|cramer1967>Cramér, H., and Leadbetter, M. R., <em|Stationary and
    Related Stochastic Processes>, John Wiley and Sons, Inc., New York, 1967.

    <bibitem|dugundji1958>Dugundji, J., \PEnvelopes and Pre-Envelopes of Real
    Waveforms,\Q <em|IRE Transactions on Information Theory>, Vol. 4, 1958,
    pp. 53\U57.

    <bibitem|krenk1979>Krenk, S., \PNonstationary Narrow-Band Response and
    First-Passage Probability,\Q <em|Journal of Applied Mechanics>, Vol. 46,
    1979, pp. 919\U924.

    <bibitem|lin1976>Lin, Y. K., <em|Probabilistic Theory of Structural
    Dynamics>, Krieger Publishing Co., Huntington, N.Y., 1976.

    <bibitem|lyon1961>Lyon, R. H., \POn the Vibration Statistics of a
    Randomly Excited Hard-Spring Oscillator II,\Q <em|Journal of the
    Acoustical Society of America>, Vol. 33, 1961, pp. 1395\U1403.

    <bibitem|madsen1982>Madsen, P. H., and Krenk, S., \PStationary and
    Transient Response Statistics,\Q <em|Journal of the Engineering Mechanics
    Division, ASCE>, Vol. 8, No. EM4, Aug. 1982, pp. 622\U635.

    <bibitem|papoulis1965>Papoulis, A., <em|Probability, Random Variables and
    Stochastic Processes>, McGraw-Hill, Kogakusha, Tokyo, 1965.

    <bibitem|priestley1965>Priestley, M. B., \PEvolutionary Spectra and
    Nonstationary Processes,\Q <em|Journal of the Royal Statistical Society>,
    Vol. B27, 1965, pp. 204\U237.

    <bibitem|priestley1967>Priestley, M. B., \PPower Spectral Analysis of
    Nonstationary Random Processes,\Q <em|Journal of Sound and Vibration>,
    Vol. 6, 1967, pp. 86\U97.

    <bibitem|rice1955>Rice, S. O., \PMathematical Analysis of Random Noise,\Q
    in <em|Selected Papers on Noise and Stochastic Processes>, N. Wax, ed.,
    Dover Publications, Inc., New York, 1955.

    <bibitem|vanmarcke1975>Vanmarcke, E. H., \POn the Distribution of the
    First-Passage Time for Normal Stationary Random Processes,\Q <em|Journal
    of Applied Mechanics>, Vol. 42, 1975, pp. 215\U220.

    <bibitem|yang1972>Yang, J.-N., \PNonstationary Envelope Process and First
    Excursion Probability,\Q <em|Journal of Structural Mechanics>, Vol. 1,
    1972, pp. 231\U248.

    <bibitem|yang1973>Yang, J.-N., \PFirst-Excursion Probability in
    Non-Stationary Random Vibration,\Q <em|Journal of Sound and Vibration>,
    Vol. 27, 1973, pp. 165\U182.

    <bibitem|yangshinozuka1971>Yang, J.-N., and Shinozuka, M., \POn the First
    Excursions Probability in Stationary Narrow-Band Random Vibration,\Q
    <em|Journal of Applied Mechanics>, Vol. 38, 1971, pp. 1017\U1022.
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
    <associate|auto-1|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-2|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-3|<tuple|3|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-4|<tuple|4|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-5|<tuple|5|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-6|<tuple|6|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-7|<tuple|7|9|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-8|<tuple|7|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|auto-9|<tuple|7|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-arens1957|<tuple|arens1957|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-corotis1972|<tuple|corotis1972|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-cramer1967|<tuple|cramer1967|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-dugundji1958|<tuple|dugundji1958|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-krenk1979|<tuple|krenk1979|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-lin1976|<tuple|lin1976|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-lyon1961|<tuple|lyon1961|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-madsen1982|<tuple|madsen1982|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-papoulis1965|<tuple|papoulis1965|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-priestley1965|<tuple|priestley1965|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-priestley1967|<tuple|priestley1967|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-rice1955|<tuple|rice1955|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-vanmarcke1975|<tuple|vanmarcke1975|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-yang1972|<tuple|yang1972|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-yang1973|<tuple|yang1973|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|bib-yangshinozuka1971|<tuple|yangshinozuka1971|11|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:H_rational|<tuple|26|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:H_time|<tuple|20|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:Q_envelope|<tuple|34|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:RXX|<tuple|23|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:RZZ|<tuple|17|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:RZZ_H|<tuple|18|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:RZZ_full|<tuple|21|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:RZZ_operator|<tuple|22|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:SFF_rational|<tuple|25|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:complex_corr|<tuple|8|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:complex_corr_response|<tuple|12|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:complex_corr_sff|<tuple|10|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:complex_force|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:complex_response|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:correlation|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:cov_matrix|<tuple|35|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:envelope|<tuple|15|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:fQ|<tuple|37|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:first_passage|<tuple|41|9|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:ftheta|<tuple|38|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:g_function|<tuple|19|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:hilbert|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:hilbert_corr|<tuple|9|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:impulse_response|<tuple|11|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:lambda0|<tuple|28|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:lambda1|<tuple|29|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:normalized_complex|<tuple|30|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:nu_e|<tuple|39|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:nu_q|<tuple|40|9|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:oscillator|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:rxx_closed|<tuple|27|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:rzz_sh|<tuple|13|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:sigmaX|<tuple|31|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:sigmaX_dot|<tuple|32|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:sym1|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:sym2|<tuple|7|4|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:transfer_function|<tuple|14|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:uncorrelated|<tuple|24|6|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:upcrossing|<tuple|33|7|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:xi|<tuple|36|8|../../.TeXmacs/texts/scratch/no_name_10.tm>>
    <associate|eq:zero_start|<tuple|16|5|../../.TeXmacs/texts/scratch/no_name_10.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      priestley1965

      priestley1967

      corotis1972

      yang1972

      madsen1982

      dugundji1958

      arens1957

      papoulis1965

      cramer1967

      lin1976

      rice1955

      lyon1961

      vanmarcke1975
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Stationary
      Pre-Envelope> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Zero
      Start Conditions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Evaluation
      of Correlation Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Crossing
      Frequencies> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>First
      Passage Probability> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Summary
      and Conclusions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>