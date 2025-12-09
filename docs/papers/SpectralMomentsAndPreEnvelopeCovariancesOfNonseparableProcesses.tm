<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Spectral Moments and Pre-Envelope Covariances of
  Nonseparable Processes>|<doc-author|<author-data|<author-name|Mario Di
  Paola>|<author-affiliation|Professor, Dipartimento di Ingegneria
  Strutturale e Geotecnica, Universita di Palermo, Viale delle Scienze, 90128
  Palermo, Italy>>>|<doc-author|<author-data|<author-name|Giovanni
  Petrucci>|<author-affiliation|Consulting Engineer, Istituto di Costruzione
  di Macchine, Universita di Palermo, Viale delle Scienze, 90128 Palermo,
  Italy>>>|<doc-date|<date|>>>

  <abstract-data|<\abstract>
    A critical review of the definition of the spectral moments of a
    stochastic process in the nonstationary case is presented. An adequate
    time-domain representation of spectral moments in the stationary case is
    first established, showing that the spectral moments are related to the
    variances of the stationary analytical pre-envelope processes. The
    extension to the nonstationary case is made in the time domain evaluating
    the covariances of the nonstationary pre-envelope showing the differences
    between the proposed definition and the classical one made introducing
    the evolutionary power.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Stationary
    Pre-Envelope Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Nonstationary
    Pre-Envelope Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Spectral
    Moments and Pre-Envelope Covariances, Stationary Case>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Spectral
    Moments and Pre-Envelope Covariances, Nonstationary Case>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Input-Output
    Relationships> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <with|par-left|1tab|6.1<space|2spc>PEC Matrix of the Output-Stationary
    Case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|6.2<space|2spc>PEC Matrix of the Output-Nonstationary
    Case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Numerical
    Example> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Conclusions
    and Discussion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  Many time-varying loadings to structures are modeled as stochastic
  processes and the response analysis can be established in a probabilistic
  sense. The stochastic processes of input and response may often be
  nonstationary for frequency content and amplitude, as in the case of a
  strong motion phase during an earthquake <cite|Kameda1975> and can be
  adequately represented as nonseparable processes <cite|Priestley1965>.

  Second-order moments completely define the statistics of the response.
  However, in many cases such as prediction of the first excursion failure,
  fatigue failure, etc., we are concerned with the statistics of the envelope
  process. The above, following Dugundji <cite|Dugundji1958> and Yang
  <cite|Yang1972>, and Krenk et al. <cite|Krenk1983>, for stationary and
  nonstationary processes, respectively, can be seen as the modulus of the
  pre-envelope <cite|Arens1957|Dugundji1958>; i.e., a complex process, the
  real part of which is the given process while its imaginary part is related
  to the real one in such a way that the complex process exhibits power only
  in the positive frequency range. It follows that the statistics of the
  envelope are related to the covariances of the pre-envelope.

  The pre-envelope are, in the stationary cases, strictly related to the
  so-called spectral moments (hereafter referred to as SM)
  <cite|Vanmarcke1972>. In particular, the SM, defined as the moments of the
  one-sided power spectral density function have, in time domain, the meaning
  of variances of the pre-envelope <cite|DiPaola1985>.

  The extension of the SM to the nonstationary case is usually made in the
  frequency domain as the moments of the one-sided evolutionary power
  spectral density <cite|Priestley1965|Hammond1968|Shinozuka1970>. However,
  such definition, with exception of the zeroth one, has no physical meaning
  in the time domain and enjoyment of unsatisfactory properties, for example,
  in the transient case of an oscillator subjected to white noise input
  <cite|Corotis1972>.

  In this paper, the connection between spectral moments and pre-envelope
  covariances (PEC) is presented. In particular, it is shown that only the
  area of the evolutionary power coincides with the PEC, while all other
  moments differ from the variances of the various derivatives of the
  pre-envelope and, as a consequence, the moments of the evolutionary power
  do not give any information on the statistics of the envelope.

  The PEC for a multi-degree-of-freedom linear system subjected to
  nonstationary, nonseparable processes is also presented, and the numerical
  aspect on their evaluation is discussed in the application.

  For clarity's sake, in the next two sections the complex representation of
  pre-envelope processes is first discussed.

  <section|Stationary Pre-Envelope Process>

  Let <math|<math-bf|F><around|(|t|)>> be an <math|n>-dimensional real
  stationary stochastic process vector given in the Priestley representation
  as follows:

  <\equation>
    <math-bf|F><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d<math-bf|Z><rsup|\<ast\>><around|(|\<omega\>|)>.<label|eq:stationary_representation>
  </equation>

  <math|i> is the imaginary unit (<math|i=<sqrt|-1>>), while the asterisk
  indicates the complex conjugate and <math|d<math-bf|Z><around|(|\<omega\>|)>>
  is a stochastic vector process having orthogonal increments, i.e.,

  <\equation>
    E*<around|[|d<math-bf|Z><around|(|\<omega\><rsub|1>|)>*d<math-bf|Z><rsup|\<ast\>T><around|(|\<omega\><rsub|2>|)>|]>=\<delta\>*<around|(|\<omega\><rsub|2>-\<omega\><rsub|1>|)>*<space|0.17em>d*\<psi\><around|(|\<omega\><rsub|1>|)><label|eq:orthogonal_increments>
  </equation>

  where <math|E<around|[|\<cdummy\>|]>> means stochastic average,
  <math|\<delta\><around|(|\<cdummy\>|)>> is the Dirac's delta, the
  superimposed <math|T> means transpose, and
  <math|d*\<psi\><around|(|\<omega\>|)>> is a deterministic Hermitian
  positive-definite matrix. It is worth noting that in order for equation
  <eqref|eq:stationary_representation> to be fulfilled, it is necessary that
  the process vector <math|d<math-bf|Z><around|(|\<omega\>|)>> be complex,
  such that its real and imaginary parts are even and odd functions of
  <math|\<omega\>>, respectively.

  Without loss of generality we consider that
  <math|<math-bf|F><around|(|t|)>> is a zero-mean process and
  <math|\<psi\><around|(|\<omega\>|)>> is a differentiable matrix, and hence,
  the following relationship

  <\equation>
    d*\<psi\><around|(|\<omega\>|)>=G<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\><label|eq:spectral_density>
  </equation>

  holds, <math|G<around|(|\<omega\>|)>> being the Hermitian power spectral
  density function matrix defined in both the positive and negative frequency
  ranges.

  Let us consider a new process vector <math|<wide|<math-bf|F>|~><around|(|t|)>>,
  derived from <math|<math-bf|F><around|(|t|)>>, such that the corresponding
  power spectral density function matrix <math|<wide|G|~><around|(|\<omega\>|)>>
  is one-sided, i.e.,

  <\equation>
    <wide|G|~><around|(|\<omega\>|)>=2*U<around|(|\<omega\>|)>*G<around|(|\<omega\>|)>=S<around|(|\<omega\>|)>,<label|eq:one_sided_spectral_density>
  </equation>

  <math|U<around|(|\<omega\>|)>> being the unit step function. Equation
  <eqref|eq:one_sided_spectral_density> is verified if the vector
  <math|d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>>, corresponding to
  <math|<wide|<math-bf|F>|~><around|(|\<omega\>|)>>, takes on the following
  form:

  <\equation>
    d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>=<frac|1|<sqrt|2>>*<around|(|1+<math-up|sgn><around|(|\<omega\>|)>|)>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)>=<sqrt|2>*<space|0.17em>U<around|(|\<omega\>|)>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)><label|eq:transformed_increments>
  </equation>

  <math|<math-up|sgn><around|(|\<omega\>|)>> being the signum function.
  Equation <eqref|eq:orthogonal_increments>, rewritten for the stochastic
  process vector <math|<wide|<math-bf|Z>|~><around|(|\<omega\>|)>>, now
  gives:

  <\equation>
    E*<around|[|d<wide|<math-bf|Z>|~><around|(|\<omega\><rsub|1>|)>*d<wide|<math-bf|Z>|~><rsup|\<ast\>T><around|(|\<omega\><rsub|2>|)>|]>=2*U<around|(|\<omega\><rsub|1>|)>*G<around|(|\<omega\><rsub|1>|)>*\<delta\>*<around|(|\<omega\><rsub|2>-\<omega\><rsub|1>|)>=S<around|(|\<omega\><rsub|1>|)>*\<delta\>*<around|(|\<omega\><rsub|2>-\<omega\><rsub|1>|)>.<label|eq:transformed_orthogonal>
  </equation>

  Using equation <eqref|eq:transformed_increments>, the appropriate
  description of the vector <math|<wide|<math-bf|F>|~><around|(|t|)>> takes
  on the form:

  <\equation>
    <wide|<math-bf|F>|~><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*<space|0.17em>d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>=<frac|2|<sqrt|2>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)>.<label|eq:pre_envelope_stationary>
  </equation>

  This equation shows that <math|<wide|<math-bf|F>|~><around|(|t|)>> is a
  complex vector having frequency content only in the positive frequency
  range, and it can easily be seen that its real part is proportional to the
  real process <math|<math-bf|F><around|(|t|)>> defined in equation
  <eqref|eq:stationary_representation>, while its imaginary part is the
  signumless Hilbert Transform of the real one, i.e.,
  <math|<wide|<math-bf|F>|~><around|(|t|)>> constitutes an analytic process
  <cite|Papoulis1965|Nigam1982>, and is the so-called \Ppre-envelope\Q
  <cite|Arens1957|Dugundji1958>:

  <\equation>
    <wide|<math-bf|F>|~><around|(|t|)>=<frac|2|<sqrt|2>>*<around|[|<math-bf|F><around|(|t|)>-i<wide|<math-bf|F>|\<bar\>><around|(|t|)>|]><label|eq:pre_envelope_definition>
  </equation>

  where the accent means Hilbert Transform:

  <\equation>
    <wide|<math-bf|F>|\<bar\>><around|(|t|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<math-bf|F><around|(|p|)>|t-p>*<space|0.17em>d*p.<label|eq:hilbert_transform>
  </equation>

  In the stationary case the vector <math|<wide|<math-bf|F>|~><around|(|t|)>>
  can be written in the form

  <\equation>
    <wide|<math-bf|F>|~><around|(|t|)>=<frac|2|<sqrt|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t><math-up|sgn><around|(|\<omega\>|)>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)>.<label|eq:alt_pre_envelope>
  </equation>

  It is worth noting that the modulus of the <math|j>th entry of the complex
  process vector defined in equation <eqref|eq:pre_envelope_definition> is
  proportional to the \Penvelope\Q of <math|F<rsub|j><around|(|t|)>>.

  The cross-correlation function matrix of the complex vector
  <math|<wide|<math-bf|F>|~><around|(|t|)>> is given in the form:

  <\equation>
    <math-bf|R><rsub|<wide|F|~>*<wide|F|~>><around|(|\<tau\>|)>=E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>T><around|(|t+\<tau\>|)>|]>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>>*S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>.<label|eq:cross_correlation_complex>
  </equation>

  From this equation it can easily be shown that the cross-correlation matrix
  of the vector <math|<wide|<math-bf|F>|~><around|(|t|)>> is complex and such
  that its real part is the cross-correlation function of the real vector
  <math|<math-bf|F><around|(|t|)>> while its imaginary part is the Hilbert
  Transform of the real one, i.e.,

  <\equation>
    <math-bf|R><rsub|<wide|F|~>*<wide|F|~>><around|(|\<tau\>|)>=<math-bf|R><rsub|F*F><around|(|\<tau\>|)>+i<math-bf|R><rsub|<wide|F|\<bar\>>*F><around|(|\<tau\>|)>.<label|eq:correlation_decomposition>
  </equation>

  The real and the imaginary parts of the cross-correlation function matrix
  can be rewritten in equivalent forms as follows:

  <\equation>
    <math-bf|R><rsub|F*F><around|(|\<tau\>|)>=<math-bf|R><rsub|<wide|F|~>*<wide|F|~>><rsup|R><around|(|\<tau\>|)>=\<Re\><around|{|<math-bf|R><rsub|<wide|F|~>*<wide|F|~>><around|(|\<tau\>|)>|}>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>>*G<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>,<label|eq:real_part_correlation>
  </equation>

  <\equation>
    <math-bf|R><rsub|<wide|F|\<bar\>>*F><around|(|\<tau\>|)>=\<Im\><around|{|<math-bf|R><rsub|<wide|F|~>*<wide|F|~>><around|(|\<tau\>|)>|}>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>><math-up|sgn><around|(|\<omega\>|)>*G<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>.<label|eq:imaginary_part_correlation>
  </equation>

  As a conclusion the process vector <math|<wide|<math-bf|F>|~><around|(|t|)>>
  having the representation given in equation
  <eqref|eq:pre_envelope_definition> exhibits power only in the positive
  frequency range and has the complex cross-correlation function defined in
  equation <eqref|eq:correlation_decomposition>.

  <section|Nonstationary Pre-Envelope Process>

  Let <math|<math-bf|F><around|(|t|)>> be a real nonstationary nonseparable
  stochastic process vector. Following Priestley, its representation is given
  in the form:

  <\equation>
    <math-bf|F><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*A<around|(|\<omega\>,t|)>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*A<rsup|\<ast\>><around|(|\<omega\>,t|)>*<space|0.17em>d<math-bf|Z><rsup|\<ast\>><around|(|\<omega\>|)><label|eq:nonstationary_representation>
  </equation>

  where <math|A<around|(|\<omega\>,t|)>> is a slowly time-varying
  deterministic function matrix and <math|d<math-bf|Z><around|(|\<omega\>|)>>
  is the stochastic process vector already defined in equation
  <eqref|eq:orthogonal_increments>. As for the stationary case, due to the
  fact that the process <math|<math-bf|F><around|(|t|)>> is real, the real
  and the imaginary parts of the vector <math|A<around|(|\<omega\>,t|)>*d<math-bf|Z><around|(|\<omega\>|)>>
  must be even and odd functions of <math|\<omega\>>, respectively.

  The complex representation of the nonstationary process vector can be
  obtained by inserting the process vector
  <math|d<math-bf|Z><around|(|\<omega\>|)>> defined in equation
  <eqref|eq:transformed_increments> into equation
  <eqref|eq:nonstationary_representation>, thus obtaining:

  <\equation>
    <wide|<math-bf|F>|~><around|(|t|)>=<frac|1|<sqrt|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*A<around|(|\<omega\>,t|)>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)>=<frac|2|<sqrt|2>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*A<around|(|\<omega\>,t|)>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)>.<label|eq:nonstationary_complex>
  </equation>

  This equation shows that the nonstationary vector process
  <math|<wide|<math-bf|F>|~><around|(|t|)>> is a complex vector having
  frequency content only in the positive frequency range, and it can easily
  be seen that its real part is proportional to the real vector process
  <math|<math-bf|F><around|(|t|)>> defined in equation
  <eqref|eq:nonstationary_representation>, while its imaginary part will be
  denoted as <math|<wide|<math-bf|F>|\<bar\>><around|(|t|)>>. Hence, we can
  write:

  <\equation>
    <wide|<math-bf|F>|~><around|(|t|)>=<frac|2|<sqrt|2>>*<around|[|<math-bf|F><around|(|t|)>-i<wide|<math-bf|F>|\<bar\>><around|(|t|)>|]>.<label|eq:nonstationary_pre_envelope>
  </equation>

  It is to be emphasized that <math|<wide|<math-bf|F>|\<bar\>><around|(|t|)>>
  coincides with <math|<wide|<math-bf|F>|\<bar\>><around|(|t|)>> from
  equation <eqref|eq:hilbert_transform> only in the stationary case, while in
  the nonstationary case it is given as

  <\equation>
    <wide|<math-bf|F>|\<bar\>><around|(|t|)>=<frac|1|<sqrt|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t><math-up|sgn><around|(|\<omega\>|)>*A<around|(|\<omega\>,t|)>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)>.<label|eq:nonstationary_hilbert>
  </equation>

  The modulus of the <math|j>th entry of the vector
  <math|<wide|<math-bf|F>|~><around|(|t|)>> in equation
  <eqref|eq:nonstationary_pre_envelope> is proportional to the envelope
  function of <math|F<rsub|j><around|(|t|)>> defined by Yang <cite|Yang1972>.
  The complex cross-correlation function matrix of the complex vector
  <math|<wide|<math-bf|F>|~><around|(|t|)>> can be written as follows:

  <\equation>
    <math-bf|R><rsub|<wide|F|~>*<wide|F|~>><around|(|t<rsub|1>,t<rsub|2>|)>=E<around|[|<wide|<math-bf|F>|~><around|(|t<rsub|1>|)><wide|<math-bf|F>|~><rsup|\<ast\>T><around|(|t<rsub|2>|)>|]>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t<rsub|2>-t<rsub|1>|)>>*A<around|(|\<omega\>,t<rsub|1>|)>*S<around|(|\<omega\>|)>*A<rsup|\<ast\>T><around|(|\<omega\>,t<rsub|2>|)>*<space|0.17em>d*\<omega\><label|eq:nonstationary_correlation>
  </equation>

  in which <math|T=t<rsub|2>-t<rsub|1>>.

  The real and the imaginary parts of the correlation matrix
  <math|<math-bf|R><rsub|<wide|F|~>*<wide|F|~>><around|(|t<rsub|1>,t<rsub|2>|)>>
  can be rewritten in equivalent forms as follows:

  <\equation>
    <math-bf|R><rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)>=<math-bf|R><rsub|<wide|F|~>*<wide|F|~>><rsup|R><around|(|t<rsub|1>,t<rsub|2>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t<rsub|2>-t<rsub|1>|)>>*A<around|(|\<omega\>,t<rsub|1>|)>*G<around|(|\<omega\>|)>*A<rsup|\<ast\>T><around|(|\<omega\>,t<rsub|2>|)>*<space|0.17em>d*\<omega\>,<label|eq:nonstationary_real>
  </equation>

  <\equation>
    <math-bf|R><rsub|<wide|F|\<bar\>>*F><around|(|t<rsub|1>,t<rsub|2>|)>=\<Im\><around|{|<math-bf|R><rsub|<wide|F|~>*<wide|F|~>><around|(|t<rsub|1>,t<rsub|2>|)>|}>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t<rsub|2>-t<rsub|1>|)>><math-up|sgn><around|(|\<omega\>|)>*A<around|(|\<omega\>,t<rsub|1>|)>*G<around|(|\<omega\>|)>*A<rsup|\<ast\>T><around|(|\<omega\>,t<rsub|2>|)>*<space|0.17em>d*\<omega\>.<label|eq:nonstationary_imaginary>
  </equation>

  Using equations <eqref|eq:nonstationary_real> and
  <eqref|eq:nonstationary_imaginary>, the correlation function matrix
  <math|<math-bf|R><rsub|<wide|F|~>*<wide|F|~>><around|(|t<rsub|1>,t<rsub|2>|)>>
  can be rewritten in the form:

  <\equation>
    <math-bf|R><rsub|<wide|F|~>*<wide|F|~>><around|(|t<rsub|1>,t<rsub|2>|)>=<math-bf|R><rsub|F*F><around|(|t<rsub|1>,t<rsub|2>|)>+i<math-bf|R><rsub|<wide|F|\<bar\>>*F><around|(|t<rsub|1>,t<rsub|2>|)>.<label|eq:nonstationary_correlation_decomposition>
  </equation>

  In the next section it will be shown that the complex representation of the
  vector <math|<wide|<math-bf|F>|~><around|(|t|)>> given in equations
  <eqref|eq:pre_envelope_stationary> and <eqref|eq:nonstationary_complex> for
  the stationary and nonstationary case, respectively, are essential not only
  for the definition of the envelopes, but also for the correct definition of
  the spectral moments <cite|Vanmarcke1972> in both stationary and
  nonstationary cases (see also Di Paola <cite|DiPaola1985>).

  <section|Spectral Moments and Pre-Envelope Covariances, Stationary Case>

  In this section the covariances of the stationary process defined in
  equation <eqref|eq:pre_envelope_definition> are presented. In order to do
  this, let <math|<wide|<math-bf|P>|~><around|(|t|)>> the <math|2*n>
  dimensional vector of the state variables, be introduced as follows:

  <\equation>
    <wide|<math-bf|P>|~><rsup|T><around|(|t|)>=<around|[|<wide|<math-bf|F>|~><rsup|T><around|(|t|)>,<wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|T><around|(|t|)>|]><label|eq:state_vector>
  </equation>

  where the upper dot means time differentiation and
  <math|<wide|<math-bf|F>|~><around|(|t|)>> is the stationary process vector
  given in equation <eqref|eq:pre_envelope_stationary>. Using the main
  properties of the correlation function given in equations
  <eqref|eq:real_part_correlation> and <eqref|eq:imaginary_part_correlation>
  evaluated for <math|\<tau\>=0>, the time-independent Hermitian
  cross-covariance matrix of the complex vector
  <math|<wide|<math-bf|P>|~><around|(|t|)>>, i.e., the PEC matrix, is given
  as:

  <\equation>
    \<b-Sigma\><rsub|<wide|P|~><wide|P|~>>=E<around|[|<wide|<math-bf|P>|~><around|(|t|)><wide|<math-bf|P>|~><rsup|\<ast\>T><around|(|t|)>|]>=E<around|[|<math-bf|P><around|(|t|)><math-bf|P><rsup|T><around|(|t|)>|]>+i*E<around|[|<math-bf|P><around|(|t|)><wide|<math-bf|P>|\<bar\>><rsup|T><around|(|t|)>|]><label|eq:pec_matrix_stationary>
  </equation>

  where <math|<math-bf|P><around|(|t|)>> is the real vector of state
  variables

  <\equation>
    <math-bf|P><rsup|T><around|(|t|)>=<around|[|<math-bf|F><rsup|T><around|(|t|)>,<wide|<math-bf|F>|\<dot\>><rsup|T><around|(|t|)>|]>.<label|eq:real_state_vector>
  </equation>

  Equation <eqref|eq:pec_matrix_stationary> shows that the real part of the
  matrix <math|\<b-Sigma\><rsub|<wide|P|~><wide|P|~>>> is the traditional
  covariance matrix of the real process vector
  <math|<math-bf|P><around|(|t|)>>, while the imaginary part is the
  cross-covariance between the real vector <math|<math-bf|P><around|(|t|)>>
  and its Hilbert Transform.

  The matrix <math|\<b-Sigma\><rsub|<wide|P|~><wide|P|~>>> can be rewritten
  in an extended form as follows:

  <\equation>
    \<b-Sigma\><rsub|<wide|P|~><wide|P|~>>=<around*|[|<tabular*|<tformat|<table|<row|<cell|E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>>>|<row|<cell|E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>>>>>>|]>.<label|eq:pec_matrix_extended>
  </equation>

  In previous papers <cite|Borino1988|Muscolino1988>, this matrix has been
  called, in a less appropriate manner, cross-covariance spectral matrix (CCS
  matrix).

  Using equation <eqref|eq:pre_envelope_stationary> to represent the
  stochastic vector <math|<wide|<math-bf|F>|~><around|(|t|)>>, after some
  simple algebra it can easily be seen that the various block matrices of the
  matrix <math|\<b-Sigma\><rsub|<wide|P|~><wide|P|~>>> take on the form:

  <\align>
    <tformat|<table|<row|<cell|E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>=<with|math-font-family|bf|\<Lambda\>><rsub|0,F*F>,<eq-number><label|eq:lambda0>>>|<row|<cell|E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|=i*<big|int><rsub|0><rsup|\<infty\>>\<omega\>*S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>=i*<with|math-font-family|bf|\<Lambda\>><rsub|1,F*F>,<eq-number><label|eq:lambda1>>>|<row|<cell|E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|2>*S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>=<with|math-font-family|bf|\<Lambda\>><rsub|2,F*F>.<eq-number><label|eq:lambda2>>>>>
  </align>

  Equations <eqref|eq:lambda0>-<eqref|eq:lambda2> show that the PEC matrix is
  related to the moments of the one-sided power spectral matrix
  <math|S<around|(|\<omega\>|)>>, i.e., to the so-called SM
  <cite|Vanmarcke1972>.

  Inserting equations <eqref|eq:lambda0>-<eqref|eq:lambda2> in
  <eqref|eq:pec_matrix_extended>, the frequency domain representation of the
  PEC matrix is given as:

  <\equation>
    \<b-Sigma\><rsub|<wide|P|~><wide|P|~>>=<around*|[|<tabular*|<tformat|<cwith|1|1|1|-1|cell-valign|top>|<cwith|1|1|1|-1|cell-vmode|exact>|<cwith|1|1|1|-1|cell-height|<plus|1fn|2ex>>|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>|<cell|i*<big|int><rsub|0><rsup|\<infty\>>\<omega\>*S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>>|<row|<cell|-i*<big|int><rsub|0><rsup|\<infty\>>\<omega\>*S<rsup|\<ast\>><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>|<cell|<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|2>*S<around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>>>>>>|]>.<label|eq:pec_frequency_domain>
  </equation>

  Comparing equations <eqref|eq:pec_matrix_stationary> and
  <eqref|eq:pec_frequency_domain>, the important connection between the SM
  and the PEC is evidenced.

  The presence of the imaginary unit in the out-of-diagonal block matrices in
  equation <eqref|eq:pec_frequency_domain> inverts the roles of the real and
  imaginary parts of the first spectral moment, with respect to the
  cross-covariance <math|E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|T><around|(|t|)>|]>>.

  It is interesting to note that the PEC matrix particularized for the vector
  <math|<wide|<math-bf|F>|~><around|(|t|)>>, having only one component, is
  such that its determinant is related to the bandwidth parameter
  <cite|Vanmarcke1972>.

  <section|Spectral Moments and Pre-Envelope Covariances, Nonstationary Case>

  The SM in the nonstationary case are defined in the literature as the
  moments of the so-called one-sided evolutionary spectral density
  <cite|Shinozuka1970>:

  <\equation>
    S<around|(|\<omega\>,t|)>=A<around|(|\<omega\>,t|)>*S<around|(|\<omega\>|)>*A<rsup|\<ast\>T><around|(|\<omega\>,t|)><label|eq:evolutionary_spectral_density>
  </equation>

  and the extension of the time-dependent SM is usually made in the form
  <cite|Corotis1972>:

  <\equation>
    \<Lambda\><rsub|j,F*F><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|j>*S<around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>*<space|1em>j=0,1,2,\<ldots\><label|eq:time_dependent_sm>
  </equation>

  Using the main properties of the correlation function given in equations
  <eqref|eq:nonstationary_imaginary> and <eqref|eq:nonstationary_correlation_decomposition>,
  particularized for <math|t<rsub|1>=t<rsub|2>=t>, it can easily be seen that
  for <math|j=0>, equation <eqref|eq:time_dependent_sm> gives:

  <\align>
    <tformat|<table|<row|<cell|\<Lambda\><rsub|0,F*F><around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>S<around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>=E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>T><around|(|t|)>|]><eq-number>>>|<row|<cell|>|<cell|=E<around|[|<math-bf|F><around|(|t|)><math-bf|F><rsup|T><around|(|t|)>|]>+i*E<around|[|<wide|<math-bf|F>|\<bar\>><around|(|t|)><math-bf|F><rsup|T><around|(|t|)>|]>.<eq-number><label|eq:zeroth_moment_correspondence>>>>>
  </align>

  This equation shows that the zeroth moment coincides with the covariance of
  the complex process defined in equation
  <eqref|eq:nonstationary_pre_envelope>, while for <math|j> greater than
  zero, the moments of the one-sided evolutionary power spectral density
  function matrix has no analogous correspondence in the time domain of the
  variance of the pre-envelope processes, as in the stationary case.

  The time-dependent PEC matrix is given in the form:

  <\equation>
    \<b-Sigma\><rsub|<wide|P|~><wide|P|~>><around|(|t|)>=E<around|[|<wide|<math-bf|P>|~><around|(|t|)><wide|<math-bf|P>|~><rsup|\<ast\>T><around|(|t|)>|]><label|eq:time_dependent_pec>
  </equation>

  where <math|<wide|<math-bf|P>|~><around|(|t|)>> is defined in equation
  <eqref|eq:state_vector> and while <math|<wide|<math-bf|F>|~><around|(|t|)>>
  is defined in equation <eqref|eq:nonstationary_pre_envelope>.

  The block matrices of <math|\<b-Sigma\><rsub|<wide|P|~><wide|P|~>><around|(|t|)>>
  are given in equation <eqref|eq:pec_matrix_extended>, the first block
  matrix has already been defined in equation
  <eqref|eq:zeroth_moment_correspondence>, while the other blocks can be
  written in the form:

  <\align>
    <tformat|<table|<row|<cell|E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|=E<around|[|<math-bf|F><around|(|t|)><wide|<math-bf|F>|\<dot\>><rsup|T><around|(|t|)>|]>+i*E<around|[|<wide|<math-bf|F>|\<bar\>><around|(|t|)><wide|<math-bf|F>|\<dot\>><rsup|T><around|(|t|)>|]>,<eq-number><label|eq:second_block>>>|<row|<cell|E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|=E<around|[|<wide|<math-bf|F>|\<dot\>><around|(|t|)><wide|<math-bf|F>|\<dot\>><rsup|T><around|(|t|)>|]>+i*E<around|[|<wide|<math-bf|F>|\<bar\>><around|(|t|)><wide|<math-bf|F>|\<dot\>><rsup|T><around|(|t|)>|]>.<eq-number><label|eq:third_block>>>>>
  </align>

  Using equation <eqref|eq:nonstationary_complex> to represent the
  nonstationary vector <math|<wide|<math-bf|F>|~><around|(|t|)>>, and writing
  its time differentiation in the form

  <\equation>
    <wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)>=<frac|2|<sqrt|2>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t><math-bf|A><rsub|1><around|(|\<omega\>,t|)>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)><label|eq:time_derivative>
  </equation>

  where

  <\equation>
    <math-bf|A><rsub|1><around|(|\<omega\>,t|)>=-i*\<omega\>*A<around|(|\<omega\>,t|)>+<wide|A|\<dot\>><around|(|\<omega\>,t|)>,<label|eq:a1_definition>
  </equation>

  equations <eqref|eq:time_derivative> and <eqref|eq:a1_definition> can be
  rewritten as

  <\align>
    <tformat|<table|<row|<cell|E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>A<around|(|\<omega\>,t|)>*S<around|(|\<omega\>|)>*A<rsub|1><rsup|\<ast\>T><around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>,<eq-number><label|eq:pec_01>>>|<row|<cell|E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>A<rsub|1><around|(|\<omega\>,t|)>*S<around|(|\<omega\>|)>*A<rsub|1><rsup|\<ast\>T><around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>.<eq-number><label|eq:pec_02>>>>>
  </align>

  or, in an explicit form

  <\align>
    <tformat|<table|<row|<cell|E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|=i*<big|int><rsub|0><rsup|\<infty\>>\<omega\>*S<around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>+<big|int><rsub|0><rsup|\<infty\>>S<rsub|1><around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>,<eq-number><label|eq:pec_01_explicit>>>|<row|<cell|E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|2>*S<around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>+i*<big|int><rsub|0><rsup|\<infty\>><around|[|\<omega\>*S<rsub|1><around|(|\<omega\>,t|)>-S<rsub|1><rsup|\<ast\>><around|(|\<omega\>,t|)>|]>*<space|0.17em>d*\<omega\><eq-number>>>|<row|<cell|>|<cell|<space|1em>+<big|int><rsub|0><rsup|\<infty\>>S<rsub|2><around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>,<eq-number><label|eq:pec_02_explicit>>>>>
  </align>

  where

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|<math-bf|S><rsub|1><around|(|\<omega\>,t|)>>|<cell|=A<around|(|\<omega\>,t|)>*S<around|(|\<omega\>|)>*<wide|A|\<dot\>><rsup|\<ast\>T><around|(|\<omega\>,t|)>,>>|<row|<cell|<math-bf|S><rsub|2><around|(|\<omega\>,t|)>>|<cell|=<wide|A|\<dot\>><around|(|\<omega\>,t|)>*S<around|(|\<omega\>|)>*<wide|A|\<dot\>><rsup|\<ast\>T><around|(|\<omega\>,t|)>.>>>>
    </aligned>

    <label|eq:s1_s2_definitions>
  </equation>

  Equations <eqref|eq:pec_01_explicit> and <eqref|eq:pec_02_explicit> show
  that the variances of the nonstationary pre-envelope processes
  <math|<wide|<math-bf|F>|~><around|(|t|)>> and
  <math|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)>> can be constructed
  adding to the moments of the one-sided evolutionary spectrum other
  quantities involving the time derivatives of the function matrix
  <math|A<around|(|\<omega\>,t|)>>. Only when
  <math|A<around|(|\<omega\>,t|)>> is a smooth function matrix varying very
  slowly in <math|t>, <math|<wide|A|\<dot\>><around|(|\<omega\>,t|)>> is
  approximately equal to zero, is the cross-covariances of the pre-envelope
  processes proportional to the time-dependent spectral moments defined in
  equation <eqref|eq:time_dependent_sm> <cite|To1986>. On the other hand,
  when comparing equations <eqref|eq:lambda0>-<eqref|eq:lambda2> with
  equations <eqref|eq:zeroth_moment_correspondence>,
  <eqref|eq:pec_01_explicit>, and <eqref|eq:pec_02_explicit>, it seems to be
  more reasonable to evaluate the covariances of the pre-envelope in the
  nonstationary case, in the time domain, i.e., defining the time-dependent
  PEC as the covariances of the nonstationary complex processes
  <math|<wide|<math-bf|F>|~><around|(|t|)>> and
  <math|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)>>:

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|<wide|\<Lambda\>|~><rsub|0,F*F><around|(|t|)>>|<cell|=E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>T><around|(|t|)>|]>,>>|<row|<cell|i*<wide|\<Lambda\>|~><rsub|1,F*F><around|(|t|)>>|<cell|=E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>,>>|<row|<cell|<wide|\<Lambda\>|~><rsub|2,F*F><around|(|t|)>>|<cell|=E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>.<label|eq:pec_definitions>>>>>
    </aligned>
  </equation>

  Using these quantities instead of the moments of the evolutionary power,
  some quantities of engineering interest, such as the probability density
  function of the envelope and the mean rate threshold crossing of the given
  barrier, can be computed in an exact manner
  <cite|DiPaola1987|Muscolino1988>, while only approximate expression can be
  obtained using covariances of the real processes or the moments of the
  evolutionary power.

  <section|Input-Output Relationships>

  The equation of motion of an <math|n>-degree-of-freedom linear structural
  system is governed by the following equation:

  <\equation>
    M<wide|<math-bf|X>|\<ddot\>>+C<wide|<math-bf|X>|\<dot\>>+K<math-bf|X>=<math-bf|F><around|(|t|)><label|eq:equation_of_motion>
  </equation>

  where <math|M>, <math|C>, and <math|K> are the inertia, damping and
  stiffness matrices, respectively, <math|<math-bf|X><around|(|t|)>> is the
  vector of displacements, <math|<math-bf|F><around|(|t|)>> is the forcing
  function vector. The vector solution <math|<math-bf|X><around|(|t|)>> can
  be obtained in the form:

  <\equation>
    <math-bf|X><around|(|t|)>=<big|int><rsub|0><rsup|t>H*<around|(|t-\<tau\>|)><math-bf|F><around|(|\<tau\>|)>*<space|0.17em>d*\<tau\>+G<around|(|t|)>*K<math-bf|X><rsub|0>+H<around|(|t|)>*M<wide|<math-bf|X>|\<dot\>><rsub|0>,<label|eq:solution_x>
  </equation>

  <math|H<around|(|t|)>> being the impulse response function matrix,
  <math|G<around|(|t|)>> is related to the matrix <math|H<around|(|t|)>> in
  the form:

  <\equation>
    <wide|G|\<dot\>><around|(|t|)>=H<around|(|t|)>,<label|eq:g_and_h>
  </equation>

  and <math|<math-bf|X><rsub|0>>, <math|<wide|<math-bf|X>|\<dot\>><rsub|0>>
  are the vectors of initial conditions. For greater convenience, let the
  state vector

  <\equation>
    <math-bf|U><rsup|T><around|(|t|)>=<around|[|<math-bf|X><rsup|T><around|(|t|)>,<wide|<math-bf|X>|\<dot\>><rsup|T><around|(|t|)>|]><label|eq:state_vector_u>
  </equation>

  be introduced, then the vector solution <math|<math-bf|X><around|(|t|)>> is
  written in the form

  <\equation>
    <math-bf|U><around|(|t|)>=\<theta\><around|(|t|)><math-bf|U><rsub|0>+<big|int><rsub|0><rsup|t>L*<around|(|t-\<tau\>|)><math-bf|F><around|(|\<tau\>|)>*<space|0.17em>d*\<tau\><label|eq:solution_u>
  </equation>

  in which we have set

  <\equation>
    \<theta\><around|(|t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|-G<around|(|t|)>*K>|<cell|H<around|(|t|)>*M>>|<row|<cell|-<wide|G|\<dot\>><around|(|t|)>*K>|<cell|<wide|H|\<dot\>><around|(|t|)>*M>>>>>|]>,<space|1em>L<around|(|t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|H<around|(|t|)>>>|<row|<cell|<wide|H|\<dot\>><around|(|t|)>>>>>>|]>,<space|1em><math-bf|U><rsub|0>=<around*|[|<tabular*|<tformat|<table|<row|<cell|<math-bf|X><rsub|0>>>|<row|<cell|<wide|<math-bf|X>|\<dot\>><rsub|0>>>>>>|]>.<label|eq:matrices_definition>
  </equation>

  Equation <eqref|eq:solution_u> is able to give the state vector solution,
  <math|<math-bf|U><around|(|t|)>>, in the deterministic case. The vector
  <math|<math-bf|U><around|(|t|)>> is either real or complex depending on
  whether the forcing vector is real or complex. In order to evaluate the PEC
  of the vector solution <math|<math-bf|U><around|(|t|)>>, the forcing vector
  <math|<math-bf|F><around|(|t|)>> must be defined as in equation
  <eqref|eq:pre_envelope_stationary> or <eqref|eq:nonstationary_complex> in
  the stationary or nonstationary case, respectively.

  <subsection|PEC Matrix of the Output-Stationary Case>

  Particularizing equation <eqref|eq:solution_u> for stationary condition and
  complex forcing function defined as in equation
  <eqref|eq:pre_envelope_stationary>, we obtain the stationary response of
  the state vector in the form

  <\equation>
    <wide|<math-bf|U>|~><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|t>L*<around|(|t-\<tau\>|)><wide|<math-bf|F>|~><around|(|\<tau\>|)>*<space|0.17em>d*\<tau\>=<frac|2|<sqrt|2>><around*|{|<big|int><rsub|0><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|t>L*<around|(|t-\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*<space|0.17em>d*\<tau\>|]>*d<math-bf|Z><around|(|\<omega\>|)>|}>.<label|eq:stationary_response>
  </equation>

  After some easy manipulations, the latter can be rewritten in the form

  <\equation>
    <wide|<math-bf|U>|~><around|(|t|)>=<frac|2|<sqrt|2>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*L<rsup|\<ast\>><around|(|\<omega\>|)>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)>,<label|eq:stationary_response_simplified>
  </equation>

  in which <math|L<around|(|\<omega\>|)>> is the Fourier Transform of
  <math|L<around|(|t|)>>. From this equation it can easily be seen that
  <math|<wide|<math-bf|U>|~><around|(|t|)>> is a complex process such that
  its imaginary part is the (signumless) Hilbert transform of the
  corresponding real one, i.e.,

  <\equation>
    <wide|<math-bf|U>|~><around|(|t|)>=<frac|2|<sqrt|2>>*<around|[|<math-bf|U><around|(|t|)>-i<wide|<math-bf|U>|\<bar\>><around|(|t|)>|]>.<label|eq:pre_envelope_u>
  </equation>

  The PEC matrix of the vector <math|<math-bf|X>>, according to equation
  <eqref|eq:pec_matrix_stationary>, is given in the form:

  <\equation>
    \<b-Sigma\><rsub|<wide|U|~>*<wide|U|~>>=E<around|[|<wide|<math-bf|U>|~><around|(|t|)><wide|<math-bf|U>|~><rsup|\<ast\>T><around|(|t|)>|]>=<around*|[|<tabular*|<tformat|<table|<row|<cell|<with|math-font-family|bf|\<Lambda\>><rsub|0,X*X>>|<cell|i*<with|math-font-family|bf|\<Lambda\>><rsub|1,X*X>>>|<row|<cell|-i*<with|math-font-family|bf|\<Lambda\>><rsub|1,X*X><rsup|\<ast\>>>|<cell|<with|math-font-family|bf|\<Lambda\>><rsub|2,X*X>>>>>>|]>,<label|eq:pec_output_stationary>
  </equation>

  in which the various block matrices can be written as

  <\align>
    <tformat|<table|<row|<cell|<with|math-font-family|bf|\<Lambda\>><rsub|0,X*X>>|<cell|=E<around|[|<wide|<math-bf|X>|~><around|(|t|)><wide|<math-bf|X>|~><rsup|\<ast\>T><around|(|t|)>|]>=<big|int><rsub|0><rsup|\<infty\>>H<rsup|\<ast\>><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*H<rsup|T><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>,<eq-number><label|eq:lambda0_xx>>>|<row|<cell|<with|math-font-family|bf|\<Lambda\>><rsub|1,X*X>>|<cell|=E<around|[|<wide|<math-bf|X>|~><around|(|t|)><wide|<wide|<math-bf|X>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>=i*<big|int><rsub|0><rsup|\<infty\>>\<omega\>*H<rsup|\<ast\>><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*H<rsup|T><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>,<eq-number><label|eq:lambda1_xx>>>|<row|<cell|<with|math-font-family|bf|\<Lambda\>><rsub|2,X*X>>|<cell|=E<around|[|<wide|<wide|<math-bf|X>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|X>|~>|\<dot\>><rsup|\<ast\>T><around|(|t|)>|]>=<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|2>*H<rsup|\<ast\>><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*H<rsup|T><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>.<eq-number><label|eq:lambda2_xx>>>>>
  </align>

  The latter equations give, in compact form, all the envelope covariances of
  the nodal response in the stationary case, showing the perfect
  correspondence with the pre-envelope covariances of the response process.

  <subsection|PEC Matrix of the Output-Nonstationary Case>

  In order to obtain the PEC matrix of the output in the nonstationary case,
  the forcing function vector in equation <eqref|eq:solution_u> must be
  defined as in equation <eqref|eq:nonstationary_complex>, it follows that
  the vector solution is given in the form

  <\align>
    <tformat|<table|<row|<cell|<wide|<math-bf|U>|~><around|(|t|)>>|<cell|=\<theta\><around|(|t|)><wide|<math-bf|U>|~><rsub|0>+<big|int><rsub|0><rsup|t>L*<around|(|t-\<tau\>|)><wide|<math-bf|F>|~><around|(|\<tau\>|)>*<space|0.17em>d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=\<theta\><around|(|t|)><math-bf|U><rsub|0>+<frac|2|<sqrt|2>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*N<rsup|\<ast\>><around|(|\<omega\>,t|)>*<space|0.17em>d<math-bf|Z><around|(|\<omega\>|)>,<eq-number><label|eq:nonstationary_response>>>>>
  </align>

  in which we have set

  <\equation>
    N<around|(|\<omega\>,t|)>=<big|int><rsub|0><rsup|t>L*<around|(|t-\<tau\>|)>*A<around|(|\<omega\>,t|)>*e<rsup|-i*\<omega\>*<around|(|t-\<tau\>|)>>*<space|0.17em>d*\<tau\>,<label|eq:n_definition>
  </equation>

  and <math|<wide|<math-bf|U>|~><rsub|0>> is the complex vector of initial
  conditions given as

  <\equation>
    <wide|<math-bf|U>|~><rsub|0>=<frac|2|<sqrt|2>>*<around|(|<math-bf|U><rsub|0>-i<wide|<math-bf|U>|\<bar\>><rsub|0>|)>,<label|eq:complex_initial>
  </equation>

  in which <math|<wide|<math-bf|U>|\<bar\>><rsub|0>> has the same probability
  distribution as <math|<math-bf|U><rsub|0>>.

  The time-dependent PEC matrix of the vector
  <math|<wide|<math-bf|U>|~><around|(|t|)>> is given in the form

  <\equation>
    \<b-Sigma\><rsub|<wide|U|~>*<wide|U|~>><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>N<rsup|\<ast\>><around|(|\<omega\>,t|)>*S<around|(|\<omega\>|)>*N<rsup|T><around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>+\<theta\><around|(|t|)>*\<b-Sigma\><rsub|<wide|U|~>*<wide|U|~>><around|(|0|)>*\<theta\><rsup|T><around|(|t|)>+<math-bf|Q><around|(|t|)>+<math-bf|Q><rsup|T><around|(|t|)>,<label|eq:pec_output_nonstationary>
  </equation>

  in which <math|\<b-Sigma\><rsub|<wide|U|~>*<wide|U|~>><around|(|0|)>> is
  the PEC matrix evaluated at time <math|t=0>, and
  <math|<math-bf|Q><around|(|t|)>> is the complex matrix given in the form

  <\equation>
    <math-bf|Q><around|(|t|)>=\<theta\><around|(|t|)>*<big|int><rsub|0><rsup|t>E<around|[|<wide|<math-bf|U>|~><rsub|0><wide|<math-bf|F>|~><rsup|T><around|(|\<tau\>|)>|]>*L<rsup|T>*<around|(|t-\<tau\>|)>*<space|0.17em>d*\<tau\>.<label|eq:q_matrix>
  </equation>

  For deterministic zero-start conditions, the PEC matrix is given in the
  simpler form

  <\equation>
    \<b-Sigma\><rsub|<wide|U|~>*<wide|U|~>><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>N<rsup|\<ast\>><around|(|\<omega\>,t|)>*S<around|(|\<omega\>|)>*N<rsup|T><around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>,<label|eq:pec_zero_start>
  </equation>

  in which the various block matrices are given as

  <\align>
    <tformat|<table|<row|<cell|<with|math-font-family|bf|\<Lambda\>><rsub|0,X*X><around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>R<rsub|0><rsup|\<ast\>><around|(|\<omega\>,t|)>*S<around|(|\<omega\>|)>*R<rsub|0><rsup|T><around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>,<eq-number><label|eq:lambda0_t>>>|<row|<cell|<with|math-font-family|bf|\<Lambda\>><rsub|1,X*X><around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>R<rsub|0><rsup|\<ast\>><around|(|\<omega\>,t|)>*S<around|(|\<omega\>|)>*R<rsub|1><rsup|T><around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>,<eq-number><label|eq:lambda1_t>>>|<row|<cell|<with|math-font-family|bf|\<Lambda\>><rsub|2,X*X><around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>R<rsub|1><rsup|\<ast\>><around|(|\<omega\>,t|)>*S<around|(|\<omega\>|)>*R<rsub|1><rsup|T><around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>,<eq-number><label|eq:lambda2_t>>>>>
  </align>

  where

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|R<rsub|0><around|(|\<omega\>,t|)>>|<cell|=<big|int><rsub|0><rsup|t>H*<around|(|t-\<tau\>|)>*A<around|(|\<omega\>,t|)>*e<rsup|-i*\<omega\>*\<tau\>>*<space|0.17em>d*\<tau\>,>>|<row|<cell|R<rsub|1><around|(|\<omega\>,t|)>>|<cell|=<big|int><rsub|0><rsup|t><wide|H|\<dot\>>*<around|(|t-\<tau\>|)>*A<around|(|\<omega\>,t|)>*e<rsup|-i*\<omega\>*\<tau\>>*<space|0.17em>d*\<tau\>.>>>>
    </aligned>

    <label|eq:r_definitions>
  </equation>

  Evaluating for each frequency the integrals in equations
  <eqref|eq:r_definitions> and substituting the latter in equations
  <eqref|eq:lambda0_t>-<eqref|eq:lambda2_t>, the various block matrices of
  <math|\<b-Sigma\><rsub|<wide|U|~>*<wide|U|~>><around|(|t|)>> can be
  computed.

  <section|Numerical Example>

  As an application, a two-degree-of-freedom, classically damped system
  depicted in Figure<nbsp><reference|fig:two_dof_system> has been analyzed.
  In this case the vector solution <math|<math-bf|X>> can be evaluated by
  means of the mode superposition as follows:

  <\equation>
    <math-bf|X>=\<Phi\><math-bf|Y>,<label|eq:mode_superposition>
  </equation>

  where <math|\<Phi\>> is the modal matrix normalized with respect to
  <math|M>, and <math|<math-bf|Y>> is the vector solution of the decoupled
  modal differential equations.

  <\big-figure>
    <\with|par-mode|center>
      <label|fig:two_dof_system>
    </with>
  </big-figure|The two-degrees-of-freedom system>

  The examined system is characterized by the following data:

  <\equation*>
    M<rsub|1>=M<rsub|2>=1<space|0.17em><text|kg>;<space|1em>K<rsub|1>=50<space|0.17em><text|N/cm>;<space|1em>K<rsub|2>=33<space|0.17em><text|N/cm>.
  </equation*>

  The modal analysis provided the following results:

  <\itemize>
    <item>Natural radian frequencies: <math|\<omega\><rsub|1>=3.76> rad/s;
    <math|\<omega\><rsub|2>=10.93> rad/s

    <item>Modal Matrix:

    <\equation>
      \<Phi\>=<around*|[|<tabular*|<tformat|<table|<row|<cell|0.811>|<cell|0.585>>|<row|<cell|0.585>|<cell|-0.811>>>>>|]>
    </equation>

    <item>The damping ratio, here assumed equal for both modes, is
    <math|\<xi\>=0.05>.
  </itemize>

  The input process is defined as in equation
  <eqref|eq:nonstationary_complex>, in which <math|A<around|(|\<omega\>,t|)>>
  is given in the form <cite|Spanos1983>:

  <\equation>
    A<around|(|\<omega\>,t|)>=<sqrt|<frac|b*\<beta\><around|(|\<omega\>|)>|\<pi\>>>*<big|int><rsub|0><rsup|t>exp
    <around|[|-<around|(|\<beta\><around|(|\<omega\>|)>+i*b|)>*\<tau\>|]>*<space|0.17em>d*\<tau\>.
  </equation>

  The process <math|d*<wide|Z|~><around|(|\<omega\>|)>> is such that

  <\equation>
    E*<around|[|d*<wide|Z|~><around|(|\<omega\><rsub|1>|)>*d*<wide|Z|~><rsup|\<ast\>><around|(|\<omega\><rsub|2>|)>|]>=\<alpha\><around|(|\<omega\><rsub|1>|)>*\<delta\>*<around|(|\<omega\><rsub|2>-\<omega\><rsub|1>|)>*d*\<omega\><rsub|1>*<space|1em><around|(|\<omega\>\<gtr\>0|)>.
  </equation>

  The parameters chosen for the analysis are:

  <\equation*>
    b=0.15<space|0.17em><text|s><rsup|-1>;<space|1em>\<beta\><around|(|\<omega\>|)>=\<alpha\><around|(|\<omega\>|)>=<around*|(|<frac|\<omega\>|5*\<pi\>>|)><rsup|2><space|0.17em><text|s><rsup|-1>.
  </equation*>

  The spectrum of the input is characterized by a dominant frequency
  decreasing with time from about <math|5*\<pi\>> rad/sec to <math|2*\<pi\>>
  rad/sec, and by the fact that its total power initially increases with time
  and then gradually decreases.

  In Figure<nbsp><reference|fig:modal_covariances_1>, the modal covariances
  of pre-envelope complex processes <math|<wide|Y|~><rsub|i>> (<math|i=1,2>)
  are plotted.

  <\big-figure>
    <\with|par-mode|center>
      <label|fig:modal_covariances_1>
    </with>
  </big-figure|Modal pre-envelope covariances: (a) dashed line
  <math|E<around|[|Y<rsub|1><rsup|2>|]>>, full line
  <math|40*E<around|[|<wide|Y|~><rsub|2><rsup|2>|]>>; (b) dashed line
  <math|E<around|[|<wide|Y|\<dot\>><rsub|1><rsup|2>|]>>, full line
  <math|4*E<around|[|<wide|Y|\<dot\>><rsub|2><rsup|2>|]>>; (c) dashed line
  <math|\<Re\>*<around|(|E*<around|[|<wide|Y|~><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>,
  full line <math|4*\<Re\>*<around|(|E*<around|[|<wide|Y|~><rsub|2>*<wide|<wide|Y|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>;
  (d) dashed line <math|\<Im\>*<around|(|E*<around|[|<wide|Y|~><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>,
  full line <math|40*\<Im\>*<around|(|E*<around|[|<wide|Y|~><rsub|2>*<wide|<wide|Y|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>>

  In these figures it can be seen that the peaks of the curves of the
  different modes are located at different instants, according to the
  behavior of the input process. It is to be emphasized that if the function
  <math|A<around|(|\<omega\>,t|)>> and the power spectral density function
  had been chosen as real functions, all the moments of the evolutionary
  power would be real functions, while in the new representation,
  <math|E*<around|[|<wide|Y|~><rsub|i>*<wide|<wide|Y|~>|\<dot\>><rsub|i><rsup|\<ast\>>|]>>,
  <math|i=1,2> are complex functions.

  In Figure<nbsp><reference|fig:modal_cross_covariances>, the various modal
  cross-covariances are plotted.

  <\big-figure>
    <\with|par-mode|center>
      <label|fig:modal_cross_covariances>
    </with>
  </big-figure|Modal pre-envelope covariances: (a) dashed line
  <math|\<Im\>*<around|(|E*<around|[|<wide|Y|~><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>,
  full line <math|\<Re\>*<around|(|E*<around|[|<wide|Y|~><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>;
  (b) dashed line <math|\<Im\>*<around|(|E*<around|[|<wide|Y|~><rsub|2>*<wide|<wide|Y|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>,
  full line <math|\<Re\>*<around|(|E*<around|[|<wide|Y|~><rsub|2>*<wide|<wide|Y|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>;
  (c) dashed line <math|\<Im\>*<around|(|E*<around|[|<wide|<wide|Y|~>|\<dot\>><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>,
  full line <math|\<Re\>*<around|(|E*<around|[|<wide|<wide|Y|~>|\<dot\>><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>>

  In Figure<nbsp><reference|fig:nodal_covariances>, the (nodal) covariances
  of the pre-envelope complex process <math|<wide|X|~><rsub|2><around|(|t|)>>
  (displacements of the second mass) are plotted.

  <\big-figure>
    <\with|par-mode|center>
      <label|fig:nodal_covariances>
    </with>
  </big-figure|Nodal pre-envelope covariances: (a) dashed line
  <math|E<around|[|X<rsub|2><rsup|2>|]>>, full line
  <math|E*<around|[|<wide|X|~><rsub|2>*<wide|X|~><rsub|2><rsup|\<ast\>>|]>/10>;
  (b) dashed line <math|50*\<Re\>*<around|(|E*<around|[|<wide|X|~><rsub|2>*<wide|<wide|X|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>,
  full line <math|\<Im\>*<around|(|E*<around|[|<wide|X|~><rsub|2>*<wide|<wide|X|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>>

  From a practical point of view, the numerical evaluation of the
  nonstationary PEC needs to be conducted in the following way:

  <\enumerate>
    <item>First, in a suitable time interval, depending on the behavior of
    the input process, an adequate number of instants must be selected.

    <item>For each instant, the <math|R<rsub|0><around|(|\<omega\>,t|)>>,
    <math|R<rsub|1><around|(|\<omega\>,t|)>> complex coefficients given in
    equation <eqref|eq:r_definitions> have to be evaluated, and an
    integration over the instantaneous frequency range of the input process
    for every covariance must be effected according to equations
    <eqref|eq:lambda0_t>-<eqref|eq:lambda2_t>.
  </enumerate>

  These integrals are difficult to solve analytically, but are not affected
  by particular computational problems, so that the most delicate aspect of
  the numerical problem is the evaluation of the
  <math|R<rsub|0><around|(|\<omega\>,t|)>> and
  <math|R<rsub|1><around|(|\<omega\>,t|)>> coefficients. If no analytical
  solution of such integrals can be found, for each instant considered and
  for each coefficient, a different numerical integration from <math|0> to
  the current instant must be effected. Such integrals depend essentially on
  the form of the <math|A<around|(|\<omega\>,t|)>> input function.

  In the present application a closed-form solution was easily found, but it
  is not reported for brevity's sake.

  <section|Conclusions and Discussion>

  The probabilistic structures of a real Gaussian process is fully determined
  by the first two moments (mean and covariance). In some cases of
  engineering interest, however, we are concerned with the statistics of the
  so-called envelope, that is, for narrow band process, a smooth curve
  joining the peaks of the process. Following Dugundji <cite|Dugundji1958> in
  the stationary case, and Yang <cite|Yang1972> in the nonstationary case,
  the envelope is defined as the modulus of the pre-envelope, i.e., a complex
  process, the real part of which is the given process, while the imaginary
  part is related to the real ones in such a way that the resulting complex
  process exhibits power only in the positive frequency range. In order to
  obtain the statistics of the envelope, the variances of the pre-envelope
  need to be evaluated, rather than the variances of the given real process.

  In this paper, the covariances of the pre-envelope processes have been
  evaluated, and it is shown that in the stationary case these covariances
  are strictly related to the so-called spectral moments. In particular, PEC
  matrix has been defined, the real part of which is the well-known
  covariance matrix of the real process, while its imaginary part contains
  the lowest imaginary part of the even SM, and the real part contains the
  first odd SM.

  Because the statistical characterization of the envelope requires both the
  real and the imaginary parts of the complex process, both the real and the
  imaginary parts of the PEC matrix are essential for the evaluation of the
  peak statistics of the real process.

  In order to extend the previous concepts to the nonstationary case, the
  complex representation of the nonstationary processes (introduced by Yang)
  has been adopted and extended to the vector processes, and the covariances
  of the pre-envelope process has been evaluated. The pre-envelope covariance
  coincides with the zeroth-order moment of the evolutionary power, while no
  analogous correspondence can be obtained between the higher moments of the
  evolutionary power and the covariances of the derivatives of the
  pre-envelope.

  On the other hand, remembering that the SM are useful quantities for the
  evaluation of the statistic of the peaks, and the latter are related to the
  moduli of the complex processes, it seems to be more appropriate to
  evaluate the higher-order time-dependent pre-envelope covariances of the
  various derivatives of the nonstationary complex processes, instead of the
  moments of the evolutionary power.

  It is shown that the pre-envelope covariances are given as the sum of the
  traditional higher-order SM obtained as the moments of the evolutionary
  power and other similar quantities involving the derivatives of the
  modulating functions.

  The pre-envelope covariance of a multi-degree-of-freedom linear system
  excited by a nonstationary, nonseparable process has been also discussed
  and the numerical aspects have been evidenced by means of a numerical
  example.

  <\thebibliography|99>
    <bibitem|Kameda1975>Kameda, A., 1975, \PEvolutionary Spectra of
    Seismogram by Multifilter,\Q <with|font-shape|italic|Journal of The
    Engng. Mech. Div.>, Vol. 101, No. EM6, pp. 787\U801.

    <bibitem|Priestley1965>Priestley, M. B., 1965, \PEvolutionary Spectra and
    Non-Stationary Processes,\Q <with|font-shape|italic|Journal of the Royal
    Statistical Society>, Vol. 27, pp. 204\U228.

    <bibitem|Dugundji1958>Dugundji, J., 1958, \PEnvelope and Pre-Envelope of
    Real Waveforms,\Q <with|font-shape|italic|IRE Transaction on Information
    Theory>, Vol. 4, pp. 53\U57.

    <bibitem|Yang1972>Yang, J. N., 1972, \PNon-Stationary Envelope Process
    and First Excursion Probability,\Q <with|font-shape|italic|Journal of
    Structural Mechanics>, Vol. 1, pp. 231\U248.

    <bibitem|Krenk1983>Krenk, S., Madsen, H. O., and Madsen, P. H., 1983,
    \PStationary and Transient Response Envelopes,\Q
    <with|font-shape|italic|Journal of Engng. Mech. Div.>, Vol. 109, No. EMI,
    pp. 263\U277.

    <bibitem|Arens1957>Arens, R., 1957, \PComplex processes for envelopes of
    normal noise,\Q <with|font-shape|italic|IRE Trans. on Information
    Theory>, Vol. 3, pp. 204\U207.

    <bibitem|Vanmarcke1972>Vanmarcke, E. H., 1972, \PProperties of Special
    Moments with Application to Random Vibration,\Q
    <with|font-shape|italic|Journal of Eng. Mech. Div.>, Vol. 98, pp.
    425\U446.

    <bibitem|DiPaola1985>Di Paola, M., 1985, \PTransient Spectral Moments of
    Linear Systems,\Q <with|font-shape|italic|S. M. Archives>, Vol. 10, pp.
    225\U243.

    <bibitem|Papoulis1965>Papoulis, A., 1965, \PProbability Random Variables
    and Stochastic Processes,\Q McGraw-Hill, Kogakusha, Tokyo.

    <bibitem|Nigam1982>Nigam, N. C., 1982, \PPhase Properties of a Class of
    Random Processes,\Q <with|font-shape|italic|Earthquake Engineering and
    Structural Dynamics>, Vol. 10, pp. 711\U717.

    <bibitem|Hammond1968>Hammond, J. K., 1968, \POn the Response of Single
    and Multidegree of Freedom Systems to Non-Stationary Random Excitation,\Q
    <with|font-shape|italic|Journal of Sound and Vibration>, Vol. 7, pp.
    393\U416.

    <bibitem|Shinozuka1970>Shinozuka, M., 1970, \PRandom Processes with
    Evolutionary Power,\Q <with|font-shape|italic|Journal of Eng. Mech.
    Div.>, Vol. 96, pp. 543\U545.

    <bibitem|Corotis1972>Corotis, R. S., Vanmarcke, E. H., and Cornell, C.
    A., 1972, \PFirst Passage of Non-Stationary Random Processes,\Q
    <with|font-shape|italic|Journal of Engng. Mech. Div.>, Vol. 98, No. EM2,
    pp. 401\U414.

    <bibitem|Borino1988>Borino, G., Di Paola, M., and Muscolino, G., 1988,
    \PNon-stationary spectral moments of base excited MDOF systems,\Q
    <with|font-shape|italic|Earth. Engng. and Struct. Dyn.>, Vol. 16, pp.
    745\U756.

    <bibitem|Muscolino1988>Muscolino, G., 1988, \PNon-Stationary Envelope in
    Random Vibration Theory,\Q <with|font-shape|italic|Journal of Engng.
    Mech. Div.>, Vol. 114, No. 8, pp. 1396\U1413.

    <bibitem|To1986>To, C. W. S., 1986, \PResponse Statistic of Discretized
    Structures to Non-Stationary Vibration,\Q <with|font-shape|italic|Journal
    of Sound and Vibration>, Vol. 105, pp. 217\U231.

    <bibitem|DiPaola1987>Di Paola, M., and Muscolino, G., 1987, \PSpectral
    Moments and Envelope for Non-Stationary Non-Separable Processes,\Q
    <with|font-shape|italic|Proc. of the Int. Conf. ICASP 5>, Vol. 1, pp.
    55\U62.

    <bibitem|Spanos1983>Spanos, P. T. D., and Solomos, G. P., 1983, \PMarkov
    Approximation to Transient Vibration,\Q <with|font-shape|italic|Journal
    of Eng. Mech. Div.>, Vol. 1, pp. 1134\U1149.
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
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|1|13>>
    <associate|auto-11|<tuple|2|14>>
    <associate|auto-12|<tuple|3|14>>
    <associate|auto-13|<tuple|4|14>>
    <associate|auto-14|<tuple|8|15>>
    <associate|auto-15|<tuple|8|16>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|5>>
    <associate|auto-4|<tuple|4|6>>
    <associate|auto-5|<tuple|5|8>>
    <associate|auto-6|<tuple|6|10>>
    <associate|auto-7|<tuple|6.1|10>>
    <associate|auto-8|<tuple|6.2|11>>
    <associate|auto-9|<tuple|7|13>>
    <associate|bib-Arens1957|<tuple|Arens1957|16>>
    <associate|bib-Borino1988|<tuple|Borino1988|16>>
    <associate|bib-Corotis1972|<tuple|Corotis1972|16>>
    <associate|bib-DiPaola1985|<tuple|DiPaola1985|16>>
    <associate|bib-DiPaola1987|<tuple|DiPaola1987|16>>
    <associate|bib-Dugundji1958|<tuple|Dugundji1958|16>>
    <associate|bib-Hammond1968|<tuple|Hammond1968|16>>
    <associate|bib-Kameda1975|<tuple|Kameda1975|16>>
    <associate|bib-Krenk1983|<tuple|Krenk1983|16>>
    <associate|bib-Muscolino1988|<tuple|Muscolino1988|16>>
    <associate|bib-Nigam1982|<tuple|Nigam1982|16>>
    <associate|bib-Papoulis1965|<tuple|Papoulis1965|16>>
    <associate|bib-Priestley1965|<tuple|Priestley1965|16>>
    <associate|bib-Shinozuka1970|<tuple|Shinozuka1970|16>>
    <associate|bib-Spanos1983|<tuple|Spanos1983|16>>
    <associate|bib-To1986|<tuple|To1986|16>>
    <associate|bib-Vanmarcke1972|<tuple|Vanmarcke1972|16>>
    <associate|bib-Yang1972|<tuple|Yang1972|16>>
    <associate|eq:a1_definition|<tuple|39|8>>
    <associate|eq:alt_pre_envelope|<tuple|10|4>>
    <associate|eq:complex_initial|<tuple|63|12>>
    <associate|eq:correlation_decomposition|<tuple|12|4>>
    <associate|eq:cross_correlation_complex|<tuple|11|4>>
    <associate|eq:equation_of_motion|<tuple|47|10>>
    <associate|eq:evolutionary_spectral_density|<tuple|31|8>>
    <associate|eq:g_and_h|<tuple|49|10>>
    <associate|eq:hilbert_transform|<tuple|9|4>>
    <associate|eq:imaginary_part_correlation|<tuple|14|4>>
    <associate|eq:lambda0|<tuple|27|7>>
    <associate|eq:lambda0_t|<tuple|67|12>>
    <associate|eq:lambda0_xx|<tuple|57|11>>
    <associate|eq:lambda1|<tuple|28|7>>
    <associate|eq:lambda1_t|<tuple|68|12>>
    <associate|eq:lambda1_xx|<tuple|58|11>>
    <associate|eq:lambda2|<tuple|29|7>>
    <associate|eq:lambda2_t|<tuple|69|12>>
    <associate|eq:lambda2_xx|<tuple|59|11>>
    <associate|eq:matrices_definition|<tuple|52|10>>
    <associate|eq:mode_superposition|<tuple|71|13>>
    <associate|eq:n_definition|<tuple|62|11>>
    <associate|eq:nonstationary_complex|<tuple|16|5>>
    <associate|eq:nonstationary_correlation|<tuple|19|5>>
    <associate|eq:nonstationary_correlation_decomposition|<tuple|22|6>>
    <associate|eq:nonstationary_hilbert|<tuple|18|5>>
    <associate|eq:nonstationary_imaginary|<tuple|21|6>>
    <associate|eq:nonstationary_pre_envelope|<tuple|17|5>>
    <associate|eq:nonstationary_real|<tuple|20|6>>
    <associate|eq:nonstationary_representation|<tuple|15|5>>
    <associate|eq:nonstationary_response|<tuple|61|11>>
    <associate|eq:one_sided_spectral_density|<tuple|4|3>>
    <associate|eq:orthogonal_increments|<tuple|2|3>>
    <associate|eq:pec_01|<tuple|40|9>>
    <associate|eq:pec_01_explicit|<tuple|42|9>>
    <associate|eq:pec_02|<tuple|41|9>>
    <associate|eq:pec_02_explicit|<tuple|44|9>>
    <associate|eq:pec_definitions|<tuple|46|9>>
    <associate|eq:pec_frequency_domain|<tuple|30|7>>
    <associate|eq:pec_matrix_extended|<tuple|26|7>>
    <associate|eq:pec_matrix_stationary|<tuple|24|6>>
    <associate|eq:pec_output_nonstationary|<tuple|64|12>>
    <associate|eq:pec_output_stationary|<tuple|56|11>>
    <associate|eq:pec_zero_start|<tuple|66|12>>
    <associate|eq:pre_envelope_definition|<tuple|8|4>>
    <associate|eq:pre_envelope_stationary|<tuple|7|4>>
    <associate|eq:pre_envelope_u|<tuple|55|11>>
    <associate|eq:q_matrix|<tuple|65|12>>
    <associate|eq:r_definitions|<tuple|70|12>>
    <associate|eq:real_part_correlation|<tuple|13|4>>
    <associate|eq:real_state_vector|<tuple|25|6>>
    <associate|eq:s1_s2_definitions|<tuple|45|9>>
    <associate|eq:second_block|<tuple|36|8>>
    <associate|eq:solution_u|<tuple|51|10>>
    <associate|eq:solution_x|<tuple|48|10>>
    <associate|eq:spectral_density|<tuple|3|3>>
    <associate|eq:state_vector|<tuple|23|6>>
    <associate|eq:state_vector_u|<tuple|50|10>>
    <associate|eq:stationary_representation|<tuple|1|3>>
    <associate|eq:stationary_response|<tuple|53|10>>
    <associate|eq:stationary_response_simplified|<tuple|54|11>>
    <associate|eq:third_block|<tuple|37|8>>
    <associate|eq:time_dependent_pec|<tuple|35|8>>
    <associate|eq:time_dependent_sm|<tuple|32|8>>
    <associate|eq:time_derivative|<tuple|38|8>>
    <associate|eq:transformed_increments|<tuple|5|3>>
    <associate|eq:transformed_orthogonal|<tuple|6|3>>
    <associate|eq:zeroth_moment_correspondence|<tuple|34|8>>
    <associate|fig:modal_covariances_1|<tuple|2|14>>
    <associate|fig:modal_cross_covariances|<tuple|3|14>>
    <associate|fig:nodal_covariances|<tuple|4|14>>
    <associate|fig:two_dof_system|<tuple|1|13>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Kameda1975

      Priestley1965

      Dugundji1958

      Yang1972

      Krenk1983

      Arens1957

      Dugundji1958

      Vanmarcke1972

      DiPaola1985

      Priestley1965

      Hammond1968

      Shinozuka1970

      Corotis1972

      Papoulis1965

      Nigam1982

      Arens1957

      Dugundji1958

      Yang1972

      Vanmarcke1972

      DiPaola1985

      Borino1988

      Muscolino1988

      Vanmarcke1972

      Vanmarcke1972

      Shinozuka1970

      Corotis1972

      To1986

      DiPaola1987

      Muscolino1988

      Spanos1983

      Dugundji1958

      Yang1972
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||The
      two-degrees-of-freedom system>|<pageref|auto-10>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||Modal pre-envelope
      covariances: (a) dashed line <with|mode|<quote|math>|E<around|[|Y<rsub|1><rsup|2>|]>>,
      full line <with|mode|<quote|math>|40*E<around|[|<wide|Y|~><rsub|2><rsup|2>|]>>;
      (b) dashed line <with|mode|<quote|math>|E<around|[|<wide|Y|\<dot\>><rsub|1><rsup|2>|]>>,
      full line <with|mode|<quote|math>|4*E<around|[|<wide|Y|\<dot\>><rsub|2><rsup|2>|]>>;
      (c) dashed line <with|mode|<quote|math>|\<Re\>*<around|(|E*<around|[|<wide|Y|~><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>,
      full line <with|mode|<quote|math>|4*\<Re\>*<around|(|E*<around|[|<wide|Y|~><rsub|2>*<wide|<wide|Y|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>;
      (d) dashed line <with|mode|<quote|math>|\<Im\>*<around|(|E*<around|[|<wide|Y|~><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>,
      full line <with|mode|<quote|math>|40*\<Im\>*<around|(|E*<around|[|<wide|Y|~><rsub|2>*<wide|<wide|Y|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>>|<pageref|auto-11>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||Modal pre-envelope
      covariances: (a) dashed line <with|mode|<quote|math>|\<Im\>*<around|(|E*<around|[|<wide|Y|~><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>,
      full line <with|mode|<quote|math>|\<Re\>*<around|(|E*<around|[|<wide|Y|~><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>;
      (b) dashed line <with|mode|<quote|math>|\<Im\>*<around|(|E*<around|[|<wide|Y|~><rsub|2>*<wide|<wide|Y|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>,
      full line <with|mode|<quote|math>|\<Re\>*<around|(|E*<around|[|<wide|Y|~><rsub|2>*<wide|<wide|Y|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>;
      (c) dashed line <with|mode|<quote|math>|\<Im\>*<around|(|E*<around|[|<wide|<wide|Y|~>|\<dot\>><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>,
      full line <with|mode|<quote|math>|\<Re\>*<around|(|E*<around|[|<wide|<wide|Y|~>|\<dot\>><rsub|1>*<wide|<wide|Y|~>|\<dot\>><rsub|1><rsup|\<ast\>>|]>|)>>>|<pageref|auto-12>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4>||Nodal pre-envelope
      covariances: (a) dashed line <with|mode|<quote|math>|E<around|[|X<rsub|2><rsup|2>|]>>,
      full line <with|mode|<quote|math>|E*<around|[|<wide|X|~><rsub|2>*<wide|X|~><rsub|2><rsup|\<ast\>>|]>/10>;
      (b) dashed line <with|mode|<quote|math>|50*\<Re\>*<around|(|E*<around|[|<wide|X|~><rsub|2>*<wide|<wide|X|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>,
      full line <with|mode|<quote|math>|\<Im\>*<around|(|E*<around|[|<wide|X|~><rsub|2>*<wide|<wide|X|~>|\<dot\>><rsub|2><rsup|\<ast\>>|]>|)>>>|<pageref|auto-13>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Stationary
      Pre-Envelope Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Nonstationary
      Pre-Envelope Process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Spectral
      Moments and Pre-Envelope Covariances, Stationary Case>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Spectral
      Moments and Pre-Envelope Covariances, Nonstationary Case>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Input-Output
      Relationships> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|6.1<space|2spc>PEC Matrix of the
      Output-Stationary Case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|6.2<space|2spc>PEC Matrix of the
      Output-Nonstationary Case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Numerical
      Example> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Conclusions
      and Discussion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>