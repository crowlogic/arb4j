<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Spectral Moments and Pre-Envelope Covariances of
  Nonseparable Processes>|<doc-author|<author-data|<author-name|Professor
  Giovanni Petrucci>|<\author-affiliation>
    Dipartimento di Ingegneria Strutturale e Geotecnica

    Consulting Engineer, Istituto di Costruzione di Macchine

    Università di Palermo, Viale delle Scienze, 90128 Palermo, Italy
  </author-affiliation>>>|<doc-date|>>

  <abstract-data|<\abstract>
    A critical review of the definition of the spectral moments of a
    stochastic process in the nonstationary case is presented. An adequate
    time-domain representation of the spectral moments in the stationary case
    is first established, showing that the spectral moments are related to
    the variances of the stationary analytical pre-envelope processes. The
    extension to the nonstationary case is made in the time domain evaluating
    the covariances of the nonstationary pre-envelope, showing the
    differences between the proposed definition and the classical one made
    introducing the evolutionary power.
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

    <with|par-left|1tab|6.1<space|2spc>P.E.C. Matrix of the Output-Stationary
    Case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|6.2<space|2spc>P.E.C. Matrix of the
    Output-Nonstationary Case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Numerical
    Example> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Conclusions
    and Discussion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  Many time-varying loadings to structures are modeled as stochastic
  processes and the response analysis can be established in a probabilistic
  sense. The stochastic processes of input and response may often be
  nonstationary for frequency content and amplitude, as in the case of a
  strong motion phase during an earthquake <cite|kameda1975> and can be
  adequately represented as nonseparable processes <cite|priestley1965>.

  For Gaussian inputs and linear systems, the first and the second-order
  moments completely define the statistics of the response. However, in many
  cases such as prediction of the first excursion failure, fatigue failure,
  etc., we are concerned with the statistics of the envelope process. The
  above, following <cite|dugundji1958> and <cite|yang1972>, and
  <cite|krenk1983>, for stationary and nonstationary processes, respectively,
  can be seen as the modulus of the pre-envelope (<cite|arens1957>;
  <cite|dugundji1958>); i.e., a complex process, the real part of which is
  the given process while its imaginary part is related to the real one in
  such a way that the complex process exhibits power only in the positive
  frequency range. It follows that the statistics of the envelope are related
  to the covariances of the pre-envelope.

  It has been shown (<cite|dipaola1985>) that the covariances of the
  pre-envelope are, in the stationary cases, strictly related to the
  so-called spectral moments SM (hereafter referred to as SM)
  (<cite|vanmarcke1972>). In particular, the SM, defined as the moments of
  the one-sided power spectral density function have, in time domain, the
  meaning of variances of the pre-envelope (<cite|dipaola1985>).

  The extension of the SM to the nonstationary case is usually made in the
  frequency domain as the moments of the one-sided evolutionary power
  spectral density (<cite|priestley1965>; <cite|hammond1968>;
  <cite|shinozuka1970>). However, such definition, with exception of the
  zeroth one SM, has no physical meaning in the time domain and enjoyment of
  unsatisfactory properties, for example, in the transient case of an
  oscillator subjected to white noise input (see <cite|corotis1972>).

  Here a comparison between the SM in the nonstationary case and the
  pre-envelope covariances (PEC) is presented. In particular, it is shown
  that only the area of the evolutionary power coincides with the PEC, while
  all other moments differ from the variances of the various derivatives of
  the pre-envelope and, as a consequence, the moments of the evolutionary
  power do not give any information on the statistics of the envelope.

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
    <label|eq:priestley><math-bf|F><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*d<math-bf|Z><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d<math-bf|Z><rsup|\<ast\>><around|(|\<omega\>|)>
  </equation>

  <math|i> is the imaginary unit (<math|i=<sqrt|-1>>), while the asterisk
  indicates the complex conjugate and <math|d<math-bf|Z><around|(|\<omega\>|)>>
  is a stochastic vector process having orthogonal increments, i.e.,

  <\equation>
    <label|eq:orthogonal>E*<around|[|d<math-bf|Z><around|(|\<omega\><rsub|2>|)>*d<math-bf|Z><rsup|\<ast\>><around|(|\<omega\><rsub|1>|)>|]>=\<delta\>*<around|(|\<omega\><rsub|2>-\<omega\><rsub|1>|)>*d*\<psi\><around|(|\<omega\><rsub|1>|)>
  </equation>

  where <math|E<around|[|\<cdummy\>|]>> means stochastic average,
  <math|\<delta\><around|(|t|)>> is the Dirac's delta, the superimposed
  <math|T> means transpose, and <math|d*\<psi\><around|(|\<omega\>|)>> is a
  deterministic Hermitian positive-definite matrix. It is worth noting that
  in order for equation<nbsp><eqref|eq:priestley> to be fulfilled, it is
  necessary that the process vector <math|d<math-bf|Z><around|(|\<omega\>|)>>
  be complex, such that its real and imaginary parts are even and odd
  functions of <math|\<omega\>>, respectively.

  Without loss of generality we consider that
  <math|<math-bf|F><around|(|t|)>> is a zero-mean process and
  <math|\<psi\><around|(|\<omega\>|)>> is a differentiable matrix, and hence,
  the following relationship

  <\equation>
    <label|eq:dpsi>d*\<psi\><around|(|\<omega\>|)>=<math-bf|G><around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  holds, <math|<math-bf|G><around|(|\<omega\>|)>> being the Hermitian power
  spectral density function matrix defined in both the positive and negative
  frequency ranges.

  Let us consider a new process vector <math|<wide|<math-bf|F>|~><around|(|t|)>>,
  derived from <math|<math-bf|F><around|(|t|)>>, such that the corresponding
  power spectral density function matrix <math|<wide|<math-bf|G>|~><around|(|\<omega\>|)>>
  is one-sided, i.e.,

  <\equation>
    <label|eq:onesided><wide|<math-bf|G>|~><around|(|\<omega\>|)>=2*U<around|(|\<omega\>|)><math-bf|G><around|(|\<omega\>|)>=<math-bf|S><around|(|\<omega\>|)>
  </equation>

  <math|U<around|(|\<omega\>|)>> being the unit step function.
  Equation<nbsp><eqref|eq:onesided> is verified if the vector
  <math|d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>>, corresponding to
  <math|<wide|<math-bf|F>|~><around|(|\<omega\>|)>>, takes on the following
  form:

  <\equation>
    <label|eq:dztilde>d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>=<frac|1|2>*<around|(|1+<text|sgn><around|(|\<omega\>|)>|)>*d<math-bf|Z><around|(|\<omega\>|)>=<frac|1|<sqrt|2>>*U<around|(|\<omega\>|)>*d<math-bf|Z><around|(|\<omega\>|)>
  </equation>

  sgn<math|<around|(|\<omega\>|)>> being the signum function.
  Equation<nbsp><eqref|eq:orthogonal>, rewritten for the stochastic process
  vector <math|<wide|<math-bf|Z>|~><around|(|\<omega\>|)>>, now gives:

  <\equation>
    <label|eq:dztildeorth>E*<around|[|d<wide|<math-bf|Z>|~><around|(|\<omega\><rsub|1>|)>*d<wide|<math-bf|Z>|~><rsup|\<ast\>><around|(|\<omega\><rsub|2>|)>|]>=2*U<around|(|\<omega\><rsub|1>|)>*d*\<psi\><around|(|\<omega\><rsub|1>|)>*\<delta\>*<around|(|\<omega\><rsub|2>-\<omega\><rsub|1>|)>=<math-bf|S><around|(|\<omega\><rsub|1>|)>*d*\<omega\><rsub|1>*\<delta\>*<around|(|\<omega\><rsub|2>-\<omega\><rsub|1>|)>
  </equation>

  Using equation<nbsp><eqref|eq:dztilde>, the appropriate description of the
  vector <math|<wide|<math-bf|F>|~><around|(|t|)>> takes on the form:

  <\equation>
    <label|eq:ftilde><wide|<math-bf|F>|~><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>=<frac|1|<sqrt|2>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*d<math-bf|Z><around|(|\<omega\>|)>
  </equation>

  This equation shows that <math|<wide|<math-bf|F>|~><around|(|t|)>> is a
  complex vector having frequency content only in the positive frequency
  range, and it can easily be seen that its real part is proportional to the
  real process <math|<math-bf|F><around|(|t|)>> defined in
  equation<nbsp><eqref|eq:priestley>, while its imaginary part is the
  signumless Hilbert Transform of the real one, i.e.,
  <math|<wide|<math-bf|F>|~><around|(|t|)>> constitutes an analytic process
  (<cite|papoulis1965>, <cite|nigam1982>), and is the so-called
  "pre-envelope" (<cite|arens1957>; <cite|dugundji1958>).

  <\equation>
    <label|eq:preenvelope><wide|<math-bf|F>|~><around|(|t|)>=<frac|1|<sqrt|2>>*<around*|(|<math-bf|F><around|(|t|)>-i<wide|<math-bf|F>|^><around|(|t|)>|)>
  </equation>

  where the accent <math|<wide||^>> means Hilbert Transform:

  <\equation>
    <label|eq:hilbert><wide|<math-bf|F>|^><around|(|t|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|<math-bf|F><around|(|p|)>|t-p>*d*p
  </equation>

  In the stationary case the vector <math|<wide|<math-bf|F>|~><around|(|t|)>>
  can be written in the form

  <\equation>
    <label|eq:ftildeint><wide|<math-bf|F>|~><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t><text|sgn><around|(|\<omega\>|)>*d<math-bf|Z><around|(|\<omega\>|)>
  </equation>

  It is worth noting that the modulus of the <math|j>th entry of the complex
  process vector defined in equation<nbsp><eqref|eq:preenvelope> is
  proportional to the "envelope" of <math|F<rsub|j><around|(|t|)>>.

  The cross-correlation function matrix of the complex vector
  <math|<wide|<math-bf|F>|~><around|(|t|)>> is given in the form:

  <\equation>
    <label|eq:crosscorr><math-bf|R><rsub|<wide|<math-bf|F>|~><wide|<math-bf|F>|~>><around|(|\<tau\>|)>=E*<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>>T*<around|(|t+\<tau\>|)>|]>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>><math-bf|S><around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  From this equation it can easily be shown that the cross-correlation matrix
  of the vector <math|<wide|<math-bf|F>|~><around|(|t|)>> is complex and such
  that its real part is the cross-correlation function of the real vector
  <math|<math-bf|F><around|(|t|)>> while its imaginary part is the Hilbert
  Transform of the real one, i.e.,

  <\equation>
    <label|eq:corrparts><math-bf|R><rsub|<wide|<math-bf|F>|~><wide|<math-bf|F>|~>><around|(|\<tau\>|)>=<math-bf|R><rsub|<math-bf|FF>><around|(|\<tau\>|)>+i<math-bf|R><rsub|<math-bf|F><wide|<math-bf|F>|^>><around|(|\<tau\>|)>
  </equation>

  The real and the imaginary parts of the cross-correlation function matrix
  can be rewritten in equivalent forms as follows:

  <\equation>
    <label|eq:rff><math-bf|R><rsub|<math-bf|FF>><around|(|\<tau\>|)>=<math-bf|R><rsub|<math-bf|FF>><around|(|\<tau\>|)>=-<math-bf|R><rsub|<wide|<math-bf|F>|^><wide|<math-bf|F>|^>><around|(|\<tau\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>><math-bf|G><around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  <\equation>
    <label|eq:rfhf><math-bf|R><rsub|<math-bf|F><wide|<math-bf|F>|^>><around|(|\<tau\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>><text|sgn><around|(|\<omega\>|)><math-bf|G><around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  As a conclusion the process vector <math|<wide|<math-bf|F>|~><around|(|t|)>>
  having the representation given in equation<nbsp><eqref|eq:preenvelope>
  exhibits power only in the positive frequency range and has the complex
  cross-correlation function defined in equation<nbsp><eqref|eq:corrparts>.

  <section|Nonstationary Pre-Envelope Process>

  Let <math|<math-bf|F><around|(|t|)>> be a real nonstationary nonseparable
  stochastic process vector. Following Priestley, its representation is given
  in the form:

  <\equation>
    <label|eq:nonstat><math-bf|F><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t><math-bf|A><around|(|\<omega\>,t|)>*d<math-bf|Z><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t><math-bf|A><rsup|\<ast\>><around|(|\<omega\>,t|)>*d<math-bf|Z><rsup|\<ast\>><around|(|\<omega\>|)>
  </equation>

  where <math|<math-bf|A><around|(|\<omega\>,t|)>> is a slowly time-varying
  deterministic function matrix and <math|d<math-bf|Z><around|(|\<omega\>|)>>
  is the stochastic process vector already defined in
  equation<nbsp><eqref|eq:orthogonal>. As for the stationary case, due to the
  fact that the process <math|<math-bf|F><around|(|t|)>> is real, the real
  and the imaginary parts of the vector <math|<math-bf|A><around|(|\<omega\>,t|)>*d<math-bf|Z><around|(|\<omega\>|)>>
  must be even and odd functions of <math|\<omega\>>, respectively.

  The complex representation of the nonstationary process vector can be
  obtained by inserting the process vector
  <math|d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>> defined in
  equation<nbsp><eqref|eq:dztilde> into equation<nbsp><eqref|eq:nonstat>,
  thus obtaining:

  <\equation>
    <label|eq:ftildenonstat><wide|<math-bf|F>|~><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t><math-bf|A><around|(|\<omega\>,t|)>*d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>=<frac|1|<sqrt|2>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t><math-bf|A><around|(|\<omega\>,t|)>*d<math-bf|Z><around|(|\<omega\>|)>
  </equation>

  This equation shows that the nonstationary vector process
  <math|<wide|<math-bf|F>|~><around|(|t|)>> is a complex vector having
  frequency content only in the positive frequency range, and it can easily
  be seen that its real part is proportional to the real vector process
  <math|<math-bf|F><around|(|t|)>> defined in
  equation<nbsp><eqref|eq:nonstat>, while its imaginary part will be denoted
  as <math|-<wide|<math-bf|F>|^><around|(|t|)>>. Hence, we can write:

  <\equation>
    <label|eq:preenvnonstat><wide|<math-bf|F>|~><around|(|t|)>=<frac|1|<sqrt|2>>*<around*|(|<math-bf|F><around|(|t|)>-i<wide|<math-bf|F>|^><around|(|t|)>|)>
  </equation>

  It is to be emphasized that <math|<wide|<math-bf|F>|^><around|(|t|)>>
  coincides with <math|<math-bf|F><around|(|t|)>> only in the stationary
  case, while in the nonstationary case it is given as

  <\equation>
    <label|eq:hilbertnonstat><wide|<math-bf|F>|^><around|(|t|)>=i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<omega\>*t><text|sgn><around|(|\<omega\>|)><math-bf|A><around|(|\<omega\>,t|)>*d<math-bf|Z><around|(|\<omega\>|)>
  </equation>

  The modulus of the <math|j>th entry of the vector
  <math|<wide|<math-bf|F>|~><around|(|t|)>> in
  equation<nbsp><eqref|eq:preenvnonstat> is proportional to the envelope
  function of <math|F<rsub|j><around|(|t|)>> defined by <cite|yang1972>. The
  complex cross-correlation function matrix of the complex vector
  <math|<wide|<math-bf|F>|~><around|(|t|)>> can be written as follows:

  <\equation>
    <label|eq:crosscorrnonstat><math-bf|R><rsub|<wide|<math-bf|F>|~><wide|<math-bf|F>|~>><around|(|t<rsub|1>,t<rsub|2>|)>=E<around|[|<wide|<math-bf|F>|~><around|(|t<rsub|1>|)><wide|<math-bf|F>|~><rsup|\<ast\>>T<around|(|t<rsub|2>|)>|]>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>><math-bf|A><around|(|\<omega\>,t<rsub|1>|)><math-bf|S><around|(|\<omega\>|)><math-bf|A><rsup|\<ast\>>T<around|(|\<omega\>,t<rsub|2>|)>*d*\<omega\>
  </equation>

  in which <math|\<tau\>=t<rsub|2>-t<rsub|1>>.

  The real and the imaginary parts of the correlation matrix
  <math|<math-bf|R><rsub|<wide|<math-bf|F>|~><wide|<math-bf|F>|~>><around|(|t<rsub|1>,t<rsub|2>|)>>
  can be rewritten in equivalent forms as follows:

  <\equation>
    <label|eq:rffnonstat><math-bf|R><rsub|<math-bf|FF>><around|(|t<rsub|1>,t<rsub|2>|)>=<math-bf|R><rsub|<math-bf|FF>><around|(|t<rsub|1>,t<rsub|2>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>><math-bf|A><around|(|\<omega\>,t<rsub|1>|)><math-bf|G><around|(|\<omega\>|)><math-bf|A><rsup|\<ast\>>T<around|(|\<omega\>,t<rsub|2>|)>*d*\<omega\>
  </equation>

  <\equation>
    <label|eq:rfhfnonstat><math-bf|R><rsub|<math-bf|F><wide|<math-bf|F>|^>><around|(|t<rsub|1>,t<rsub|2>|)>=-<math-bf|R><rsub|<wide|<math-bf|F>|^><math-bf|F>><around|(|t<rsub|1>,t<rsub|2>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><text|sgn><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*\<tau\>><math-bf|A><around|(|\<omega\>,t<rsub|1>|)><math-bf|G><around|(|\<omega\>|)><math-bf|A><rsup|\<ast\>>T<around|(|\<omega\>,t<rsub|2>|)>*d*\<omega\>
  </equation>

  Using equations<nbsp><eqref|eq:rffnonstat> and<nbsp><eqref|eq:rfhfnonstat>,
  the correlation function matrix <math|<math-bf|R><rsub|<wide|<math-bf|F>|~><wide|<math-bf|F>|~>><around|(|t<rsub|1>,t<rsub|2>|)>>
  can be rewritten in the form:

  <\equation>
    <label|eq:corrpartsnonstat><math-bf|R><rsub|<wide|<math-bf|F>|~><wide|<math-bf|F>|~>><around|(|t<rsub|1>,t<rsub|2>|)>=<math-bf|R><rsub|<math-bf|FF>><around|(|t<rsub|1>,t<rsub|2>|)>+i<math-bf|R><rsub|<math-bf|F><wide|<math-bf|F>|^>><around|(|t<rsub|1>,t<rsub|2>|)>.
  </equation>

  In the next section it will be shown that the complex representation of the
  vector <math|<wide|<math-bf|F>|~><around|(|t|)>> given in
  equations<nbsp><eqref|eq:ftilde> and <eqref|eq:ftildenonstat> for the
  stationary and nonstationary case, respectively, are essential not only for
  the definition of the envelopes, but also for the correct definition of the
  spectral moments (<cite|vanmarcke1972>) in both stationary and
  nonstationary cases. (See also <cite|dipaola1985>.)

  <section|Spectral Moments and Pre-Envelope Covariances, Stationary Case>

  In this section the covariances of the stationary process defined in
  equation<nbsp><eqref|eq:preenvelope> are presented. In order to do this,
  let <math|<math-bf|P><around|(|t|)>>, the <math|2*n>-dimensional vector of
  the state variables, be introduced as follows:

  <\equation>
    <label|eq:pvector><math-bf|P><rsup|T><around|(|t|)>=<around|[|<wide|<math-bf|F>|~><rsup|T><around|(|t|)><space|1em><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|T><around|(|t|)>|]>
  </equation>

  where the upper dot means time differentiation and
  <math|<wide|<math-bf|F>|~><around|(|t|)>> is the stationary process vector
  given in equation<nbsp><eqref|eq:preenvelope>. Using the main properties of
  the correlation function given in equations<nbsp><eqref|eq:rff>
  and<nbsp><eqref|eq:rfhf> evaluated for <math|\<tau\>=0>, the
  time-independent Hermitian cross-covariance matrix of the complex vector
  <math|<math-bf|P><around|(|t|)>>, i.e., the PEC matrix, is given as:

  <\equation>
    <label|eq:pecmatrix>\<b-Sigma\><rsub|<math-bf|PP>>=E<around|[|<math-bf|P><around|(|t|)><math-bf|P><rsup|\<ast\>>T<around|(|t|)>|]>=E<around|[|<math-bf|P><around|(|t|)><math-bf|P><rsup|T><around|(|t|)>|]>+i*E<around|[|<math-bf|P><around|(|t|)><wide|<math-bf|P>|^><rsup|T><around|(|t|)>|]>
  </equation>

  where <math|<math-bf|P><around|(|t|)>> is the real vector of state
  variables

  <\equation>
    <label|eq:prealvector><math-bf|P><rsup|T><around|(|t|)>=<around|[|<math-bf|F><rsup|T><around|(|t|)><space|1em><wide|<math-bf|F>|^><rsup|T><around|(|t|)>|]>.
  </equation>

  Equation<nbsp><eqref|eq:pecmatrix> shows that the real part of the matrix
  <math|\<b-Sigma\><rsub|<math-bf|PP>>> is the traditional covariance matrix
  of the real process vector <math|<math-bf|P><around|(|t|)>>, while the
  imaginary part is the cross-covariance between the real vector
  <math|<math-bf|P><around|(|t|)>> and its Hilbert Transform.

  The matrix <math|\<b-Sigma\><rsub|<math-bf|PP>>> can be rewritten in an
  extended form as follows

  <\equation>
    <label|eq:extendedpec>\<b-Sigma\><rsub|<math-bf|PP>>=<around*|[|<tabular*|<tformat|<table|<row|<cell|E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>>T<around|(|t|)>|]>>|<cell|E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>>T<around|(|t|)>|]>>>|<row|<cell|E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>>T<around|(|t|)>|]>>|<cell|E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>>T<around|(|t|)>|]>>>>>>|]>
  </equation>

  In previous papers (<cite|borino1988>; <cite|muscolino1988>), this matrix
  has been called, in a less appropriate manner, cross-covariance spectral
  matrix (CCS matrix).

  Using equation<nbsp><eqref|eq:ftilde> to represent the stochastic vector
  <math|<wide|<math-bf|F>|~><around|(|t|)>>, after some simple algebra it can
  easily be seen that the various block matrices of the matrix
  <math|\<b-Sigma\><rsub|<math-bf|PP>>> take on the form:

  <\equation>
    <label|eq:block1>E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>>T<around|(|t|)>|]>=<big|int><rsub|0><rsup|\<infty\>><math-bf|S><around|(|\<omega\>|)>*d*\<omega\>=\<b-Lambda\><rsub|0,<math-bf|FF>>
  </equation>

  <\equation>
    <label|eq:block2>E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>>T<around|(|t|)>|]>=i*<big|int><rsub|0><rsup|\<infty\>>\<omega\><math-bf|S><around|(|\<omega\>|)>*d*\<omega\>=i*\<b-Lambda\><rsub|1,<math-bf|FF>>
  </equation>

  <\equation>
    <label|eq:block3>E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>>T<around|(|t|)>|]>=<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|2><math-bf|S><around|(|\<omega\>|)>*d*\<omega\>=\<b-Lambda\><rsub|2,<math-bf|FF>>
  </equation>

  Equations<nbsp><eqref|eq:block1>\U<eqref|eq:block3> show that the PEC
  matrix is related to the moments of the one-sided power spectral matrix
  <math|<math-bf|S><around|(|\<omega\>|)>>, i.e., to the so-called SM
  (<cite|vanmarcke1972>).

  Inserting equation<nbsp><eqref|eq:block1>\U<eqref|eq:block3> in
  equation<nbsp><eqref|eq:extendedpec>, the frequency domain representation
  of the PEC matrix is given as:

  <\equation>
    <label|eq:pecfreq>\<b-Sigma\><rsub|<math-bf|PP>>=<around*|[|<tabular*|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>><math-bf|S><around|(|\<omega\>|)>*d*\<omega\>>|<cell|i*<big|int><rsub|0><rsup|\<infty\>>\<omega\><math-bf|S><around|(|\<omega\>|)>*d*\<omega\>>>|<row|<cell|-i*<big|int><rsub|0><rsup|\<infty\>>\<omega\><math-bf|S><around|(|\<omega\>|)>*d*\<omega\>>|<cell|<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|2><math-bf|S><around|(|\<omega\>|)>*d*\<omega\>>>>>>|]>
  </equation>

  Comparing equations<nbsp><eqref|eq:pecmatrix> and<nbsp><eqref|eq:pecfreq>,
  the important connection between the SM and the PEC is evidenced.

  The presence of the imaginary unit in the out-of-diagonal block matrices in
  equation<nbsp><eqref|eq:pecfreq> inverts the roles of the real and
  imaginary parts of the first spectral moment, with respect to the
  cross-covariance <math|E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<math-bf|F>|~><around|(|t|)>|]>>.

  It is interesting to note that the PEC matrix particularized for the vector
  <math|<math-bf|F><around|(|t|)>>, having only one component, is such that
  its determinant is related to the bandwidth parameter
  (<cite|vanmarcke1972>).

  <section|Spectral Moments and Pre-Envelope Covariances, Nonstationary Case>

  The SM in the nonstationary case are defined in the literature as the
  moments of the so-called one-sided evolutionary spectral density
  (<cite|shinozuka1970>):

  <\equation>
    <label|eq:evospec><math-bf|S><around|(|\<omega\>,t|)>=<math-bf|A><around|(|\<omega\>,t|)><math-bf|S><around|(|\<omega\>|)><math-bf|A><rsup|\<ast\>>T<around|(|\<omega\>,t|)>
  </equation>

  and the extension of the time-dependent SM is usually made in the form
  (<cite|corotis1972>):

  <\equation>
    <label|eq:smnonstat>\<b-Lambda\><rsub|j,<math-bf|FF>><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|j><math-bf|S><around|(|\<omega\>,t|)>*d*\<omega\>,<space|1em>j\<geq\>0.
  </equation>

  Using the main properties of the correlation function given in
  equations<nbsp><eqref|eq:rfhfnonstat> and<nbsp><eqref|eq:corrpartsnonstat>,
  particularized for <math|t<rsub|1>=t<rsub|2>=t>, it can easily be seen that
  for <math|j=0>, equation<nbsp><eqref|eq:smnonstat> gives:

  <\equation>
    <label|eq:sm0>\<b-Lambda\><rsub|0,<math-bf|FF>><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>><math-bf|S><around|(|\<omega\>,t|)>*d*\<omega\>=E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>>T<around|(|t|)>|]>=E<around|[|<math-bf|F><around|(|t|)><math-bf|F><rsup|T><around|(|t|)>|]>+i*E<around|[|<math-bf|F><around|(|t|)><wide|<math-bf|F>|^><rsup|T><around|(|t|)>|]>
  </equation>

  This equation shows that the zeroth coincides with the covariance of the
  complex process defined in equation<nbsp><eqref|eq:preenvnonstat>, while
  for <math|j> greater than zero, the moments of the one-sided evolutionary
  power spectral density function matrix has no analogous correspondence in
  the time domain of the variance of the pre-envelope processes, as in the
  stationary case.

  The time-dependent PEC matrix is given in the form:

  <\equation>
    <label|eq:pecnonstat>\<b-Sigma\><rsub|<math-bf|PP>><around|(|t|)>=E<around|[|<math-bf|P><around|(|t|)><math-bf|P><rsup|\<ast\>>T<around|(|t|)>|]>
  </equation>

  where <math|<math-bf|P><around|(|t|)>> is defined in
  equation<nbsp><eqref|eq:pvector> and while
  <math|<wide|<math-bf|F>|~><around|(|t|)>> is defined in
  equation<nbsp><eqref|eq:preenvnonstat>. The block matrices of
  <math|\<b-Sigma\><rsub|<math-bf|PP>><around|(|t|)>> are given in
  equation<nbsp><eqref|eq:extendedpec>, the first block matrix has already
  been defined in equation<nbsp><eqref|eq:sm0>, while the other blocks can be
  written in the form:

  <\equation>
    <label|eq:blocknonstat1>E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|T><around|(|t|)>|]>=E<around|[|<math-bf|F><around|(|t|)><math-bf|F><rsup|T><around|(|t|)>|]>+i*E<around|[|<math-bf|F><around|(|t|)><wide|<math-bf|F>|^><rsup|T><around|(|t|)>|]>
  </equation>

  <\equation>
    <label|eq:blocknonstat2>E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>>T<around|(|t|)>|]>=E<around|[|<wide|<math-bf|F>|\<dot\>><around|(|t|)><math-bf|F><rsup|T><around|(|t|)>|]>+i*E<around|[|<wide|<math-bf|F>|\<dot\>><around|(|t|)><wide|<math-bf|F>|^><rsup|T><around|(|t|)>|]>
  </equation>

  Using equation<nbsp><eqref|eq:ftildenonstat> to represent the nonstationary
  vector <math|<wide|<math-bf|F>|~><around|(|t|)>>, and writing its time
  differentiation in the form

  <\equation>
    <label|eq:dotftildenonstat><wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)>=<frac|1|<sqrt|2>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t><math-bf|A><rsub|1><around|(|\<omega\>,t|)>*d<math-bf|Z><around|(|\<omega\>|)>
  </equation>

  where

  <\equation>
    <label|eq:a1><math-bf|A><rsub|1><around|(|\<omega\>,t|)>=-i*\<omega\><math-bf|A><around|(|\<omega\>,t|)>+<wide|<math-bf|A>|\<dot\>><around|(|\<omega\>,t|)>,
  </equation>

  equations<nbsp><eqref|eq:ftildenonstat>
  and<nbsp><eqref|eq:dotftildenonstat> can be rewritten as

  <\equation>
    <label|eq:blocknonstat3>E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>>T<around|(|t|)>|]>=<big|int><rsub|0><rsup|\<infty\>><math-bf|A><around|(|\<omega\>,t|)><math-bf|S><around|(|\<omega\>|)><math-bf|A><rsup|\<ast\>>T<around|(|\<omega\>,t|)>*d*\<omega\>
  </equation>

  <\equation>
    <label|eq:blocknonstat4>E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>>T<around|(|t|)>|]>=<big|int><rsub|0><rsup|\<infty\>><math-bf|A><rsub|1><around|(|\<omega\>,t|)><math-bf|S><around|(|\<omega\>|)><math-bf|A><rsub|1><rsup|\<ast\>>T<around|(|\<omega\>,t|)>*d*\<omega\>
  </equation>

  or, in an explicit form

  <\equation>
    <label|eq:blocknonstat5>E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>>T<around|(|t|)>|]>=<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|2><math-bf|S><around|(|\<omega\>,t|)>*d*\<omega\>+<big|int><rsub|0><rsup|\<infty\>><math-bf|S><rsub|1><around|(|\<omega\>,t|)>*d*\<omega\>
  </equation>

  <\equation>
    <label|eq:blocknonstat6>E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>>T<around|(|t|)>|]>=<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|2><math-bf|S><around|(|\<omega\>,t|)>*d*\<omega\>+<big|int><rsub|0><rsup|\<infty\>><around|[|\<omega\><math-bf|S><rsub|1><around|(|\<omega\>,t|)>-<math-bf|S><rsub|2><around|(|\<omega\>,t|)>|]>*d*\<omega\>+<big|int><rsub|0><rsup|\<infty\>><math-bf|S><rsub|2><around|(|\<omega\>,t|)>*d*\<omega\>
  </equation>

  where

  <\equation>
    <label|eq:s1><math-bf|S><rsub|1><around|(|\<omega\>,t|)>=<math-bf|A><around|(|\<omega\>,t|)><math-bf|S><around|(|\<omega\>|)><wide|<math-bf|A>|\<dot\>><rsup|\<ast\>>T<around|(|\<omega\>,t|)>
  </equation>

  <\equation>
    <label|eq:s2><math-bf|S><rsub|2><around|(|\<omega\>,t|)>=<wide|<math-bf|A>|\<dot\>><around|(|\<omega\>,t|)><math-bf|S><around|(|\<omega\>|)><wide|<math-bf|A>|\<dot\>><rsup|\<ast\>>T<around|(|\<omega\>,t|)>
  </equation>

  Equations<nbsp><eqref|eq:blocknonstat5> and<nbsp><eqref|eq:blocknonstat6>
  show that the variances of the nonstationary pre-envelope processes
  <math|<wide|<math-bf|F>|~><around|(|t|)>> and
  <math|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)>> can be constructed
  adding to the moments of the one-sided evolutionary spectrum other
  quantities involving the time derivatives of the function matrix
  <math|<math-bf|A><around|(|\<omega\>,t|)>>. Only when
  <math|<math-bf|A><around|(|\<omega\>,t|)>> is a smooth function matrix
  varying very slowly in <math|t>, <math|<wide|<math-bf|A>|\<dot\>><around|(|\<omega\>,t|)>>
  is approximately equal to zero, is the cross-covariances of the
  pre-envelope processes proportional to the time-dependent spectral moments
  defined in equation<nbsp><eqref|eq:smnonstat>. (See also <cite|to1986>.) On
  the other hand, when comparing equation<nbsp><eqref|eq:block1>\U<eqref|eq:block3>
  with equations<nbsp><eqref|eq:sm0>,<nbsp><eqref|eq:blocknonstat5>,
  and<nbsp><eqref|eq:blocknonstat6>, it seems to be more reasonable to
  evaluate the covariances of the pre-envelope in the nonstationary case, in
  the time domain, i.e., defining the time-dependent PEC as the covariances
  of the nonstationary complex processes <math|<wide|<math-bf|F>|~><around|(|t|)>>
  and <math|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)>>

  <\equation>
    <label|eq:pecnonstatdef>\<b-Lambda\><rsub|0\|<math-bf|FF>><around|(|t|)>=E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<math-bf|F>|~><rsup|\<ast\>>T<around|(|t|)>|]>
  </equation>

  <\equation>
    <label|eq:pecnonstatdef1>i*\<b-Lambda\><rsub|1\|<math-bf|FF>><around|(|t|)>=E<around|[|<wide|<math-bf|F>|~><around|(|t|)><wide|<wide|<math-bf|F>|~>|\<dot\>><rsup|\<ast\>>T<around|(|t|)>|]>
  </equation>

  <\equation>
    <label|eq:pecnonstatdef2>\<b-Lambda\><rsub|2\|<math-bf|FF>><around|(|t|)>=E<around|[|<wide|<wide|<math-bf|F>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|F>|~><rsup|\<ast\>>T|\<dot\>><around|(|t|)>|]>
  </equation>

  Using these quantities instead of the moments of the evolutionary power,
  some quantities of engineering interest, such as the probability density
  function of the envelope and the mean-rate threshold crossing of the given
  barrier, can be computed in an exact manner (<cite|dipaola1987>;
  <cite|muscolino1988>), while only approximate expression can be obtained
  using covariances of the real processes or the moments of the evolutionary
  power.

  <section|Input-Output Relationships>

  The equation of motion of an <math|n>-degree-of-freedom linear structural
  system is governed by the following equation:

  <\equation>
    <label|eq:motion><math-bf|M><wide|<math-bf|X>|\<ddot\>>+<math-bf|C><wide|<math-bf|X>|\<dot\>>+<math-bf|KX>=<math-bf|F><around|(|t|)>
  </equation>

  where, <math|<math-bf|M>>, <math|<math-bf|C>>, and <math|<math-bf|K>> are
  the inertia, damping and stiffness matrices, respectively,
  <math|<math-bf|X><around|(|t|)>> is the vector of displacements.
  <math|<math-bf|F><around|(|t|)>> is the forcing function vector. The vector
  solution <math|<math-bf|X><around|(|t|)>> can be obtained in the form:

  <\equation>
    <label|eq:solution><math-bf|X><around|(|t|)>=<big|int><rsub|0><rsup|t><math-bf|H><around|(|t-\<tau\>|)><math-bf|F><around|(|\<tau\>|)>*d*\<tau\>+<math-bf|G><around|(|t|)><math-bf|KU><rsub|0>+<math-bf|H><around|(|t|)><math-bf|MX><rsub|0>
  </equation>

  <\equation>
    <label|eq:g><math-bf|G><around|(|t|)>=<wide|<math-bf|H>|\<dot\>><around|(|t|)>,
  </equation>

  and <math|<math-bf|X><rsub|0>>, <math|<wide|<math-bf|X>|\<dot\>><rsub|0>>
  are the vectors of initial conditions.

  For greater convenience, let the state vector

  <\equation>
    <label|eq:statevector><math-bf|U><rsup|T><around|(|t|)>=<around|[|<math-bf|X><rsup|T><around|(|t|)><space|1em><wide|<math-bf|X>|\<dot\>><rsup|T><around|(|t|)>|]>
  </equation>

  be introduced, then the vector solution <math|<math-bf|X><around|(|t|)>> is
  written in the form

  <\equation>
    <label|eq:statesolution><math-bf|U><around|(|t|)>=\<b-Phi\><around|(|t|)><math-bf|U><rsub|0>+<big|int><rsub|0><rsup|t>\<b-Psi\>*<around|(|t-\<tau\>|)><math-bf|F><around|(|\<tau\>|)>*d*\<tau\>
  </equation>

  in which we have set

  <\equation>
    <label|eq:phi>\<b-Phi\><around|(|t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|<math-bf|G><around|(|t|)><math-bf|K>>|<cell|<math-bf|H><around|(|t|)><math-bf|M>>>|<row|<cell|<wide|<math-bf|G>|\<dot\>><around|(|t|)><math-bf|K>>|<cell|<wide|<math-bf|H>|\<dot\>><around|(|t|)><math-bf|M>>>>>>|]>;<space|1em>\<b-Psi\><around|(|t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|<math-bf|H><around|(|t|)>>>|<row|<cell|<wide|<math-bf|H>|\<dot\>><around|(|t|)>>>>>>|]>
  </equation>

  Equation<nbsp><eqref|eq:statesolution> is able to give the state vector
  solution, <math|<math-bf|U><around|(|t|)>>, in the deterministic case. The
  vector <math|<math-bf|U><around|(|t|)>> is either real or complex depending
  on whether the forcing vector is real or complex. In order to evaluate the
  PEC of the vector solution <math|<math-bf|U><around|(|t|)>>, the forcing
  vector <math|<math-bf|F><around|(|t|)>> must be defined as in
  equation<nbsp><eqref|eq:preenvelope> or <eqref|eq:preenvnonstat> in the
  stationary or nonstationary case, respectively.

  <subsection|P.E.C. Matrix of the Output-Stationary Case>

  Particularizing the equation<nbsp><eqref|eq:statesolution> for stationary
  condition and complex forcing function defined as in
  equation<nbsp><eqref|eq:preenvelope>, we obtain the stationary response of
  the state vector in the form

  <\equation>
    <label|eq:statout><math-bf|U><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>><around*|[|<big|int><rsub|0><rsup|t>\<b-Psi\>*<around|(|t-\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>|]>*d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>
  </equation>

  After some easy manipulations, the latter can be rewritten in the form

  <\equation>
    <label|eq:statout2><math-bf|U><around|(|t|)>=<frac|2|<sqrt|2>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-i*\<omega\>*t>*\<b-Psi\><rsup|\<ast\>><around|(|\<omega\>|)>*d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>
  </equation>

  in which <math|\<b-Psi\><around|(|\<omega\>|)>> is the Fourier Transform of
  <math|\<b-Psi\><around|(|t|)>>. From this equation it can easily be seen
  that <math|<math-bf|U><around|(|t|)>> is a complex process such that its
  imaginary part is the (signumless) Hilbert transform of the corresponding
  real one, i.e.,

  <\equation>
    <label|eq:hilbertout><wide|<math-bf|U>|~><around|(|t|)>=<frac|1|<sqrt|2>>*<around*|[|<math-bf|U><around|(|t|)>-i<wide|<math-bf|U>|^><around|(|t|)>|]>
  </equation>

  The PEC matrix of the vector <math|<math-bf|X>>, according to
  equation<nbsp><eqref|eq:pecmatrix>, is given in the form:

  <\equation>
    <label|eq:pecout>\<b-Sigma\><rsub|<wide|<math-bf|X>|~><wide|<math-bf|X>|~>>=E<around|[|<wide|<math-bf|U>|~><around|(|t|)><wide|<math-bf|U>|~><rsup|\<ast\>>T<around|(|t|)>|]>=<around*|[|<tabular*|<tformat|<table|<row|<cell|\<b-Lambda\><rsub|0,<math-bf|XX>>>|<cell|-i*\<b-Lambda\><rsub|1,<math-bf|XX>>>>|<row|<cell|i*\<b-Lambda\><rsub|1,<math-bf|XX>>>|<cell|\<b-Lambda\><rsub|2,<math-bf|XX>>>>>>>|]>
  </equation>

  in which the various block matrices can be written as

  <\equation>
    <label|eq:lambda0>\<b-Lambda\><rsub|0,<math-bf|XX>>=E<around|[|<wide|<math-bf|X>|~><around|(|t|)><wide|<math-bf|X>|~><rsup|\<ast\>>T<around|(|t|)>|]>=<big|int><rsub|0><rsup|\<infty\>><math-bf|H><rsup|\<ast\>><around|(|\<omega\>|)><math-bf|S><around|(|\<omega\>|)><math-bf|H><rsup|T><around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  <\equation>
    <label|eq:lambda1>i*\<b-Lambda\><rsub|1,<math-bf|XX>>=E<around|[|<wide|<math-bf|X>|~><around|(|t|)><wide|<wide|<math-bf|X>|~>|\<dot\>><rsup|\<ast\>>T<around|(|t|)>|]>=-i*<big|int><rsub|0><rsup|\<infty\>>\<omega\><math-bf|H><rsup|\<ast\>><around|(|\<omega\>|)><math-bf|S><around|(|\<omega\>|)><math-bf|H><rsup|T><around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  <\equation>
    <label|eq:lambda2>\<b-Lambda\><rsub|2,<math-bf|XX>>=E<around|[|<wide|<wide|<math-bf|X>|~>|\<dot\>><around|(|t|)><wide|<wide|<math-bf|X>|~>|\<dot\>><rsup|\<ast\>>T<around|(|t|)>|]>=<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|2><math-bf|H><rsup|\<ast\>><around|(|\<omega\>|)><math-bf|S><around|(|\<omega\>|)><math-bf|H><rsup|T><around|(|\<omega\>|)>*d*\<omega\>
  </equation>

  <math|<math-bf|H><around|(|t|)>> being the impulse response function
  matrix, <math|<math-bf|G><around|(|t|)>> is related to the matrix
  <math|<math-bf|H><around|(|t|)>> in the form:
  <math|<math-bf|G><around|(|t|)>=<wide|<math-bf|H>|\<dot\>><around|(|t|)>>.

  The latter equations give, in compact form, all the envelope covariances of
  the nodal response in the stationary case, showing the perfect
  correspondence with the pre-envelope covariances of the response process.

  <subsection|P.E.C. Matrix of the Output-Nonstationary Case>

  In order to obtain the PEC matrix of the output in the nonstationary case,
  the forcing function vector in equation<nbsp><eqref|eq:statesolution> must
  be defined as in equation<nbsp><eqref|eq:preenvnonstat>, it follows that
  the vector solution is given in the form

  <\equation>
    <label|eq:nonstatout><math-bf|U><around|(|t|)>=\<b-Phi\><around|(|t|)><math-bf|U><rsub|0>+<big|int><rsub|0><rsup|t>\<b-Psi\>*<around|(|t-\<tau\>|)><wide|<math-bf|F>|~><around|(|\<tau\>|)>*d*\<tau\>=\<b-Phi\><around|(|t|)><math-bf|U><rsub|0>+<frac|1|<sqrt|2>>*<big|int><rsub|0><rsup|\<infty\>><math-bf|N><around|(|\<omega\>,t|)>*d<wide|<math-bf|Z>|~><around|(|\<omega\>|)>
  </equation>

  in which we have set

  <\equation>
    <label|eq:n><math-bf|N><around|(|\<omega\>,t|)>=<big|int><rsub|0><rsup|t>\<b-Psi\>*<around|(|t-\<tau\>|)><math-bf|A><around|(|\<omega\>,\<tau\>|)>*e<rsup|-i*\<omega\>*<around|(|t-\<tau\>|)>>*d*\<tau\>
  </equation>

  and <math|<math-bf|U><rsub|0>> is the complex vector of initial conditions
  given as

  <\equation>
    <label|eq:u0><wide|<math-bf|U>|~><rsub|0>=<frac|1|<sqrt|2>>*<around*|(|<math-bf|U><rsub|0>-i<wide|<math-bf|U>|^><rsub|0>|)>
  </equation>

  in which <math|<wide|<math-bf|U>|^><rsub|0>> has the same probability
  distribution as <math|<math-bf|U><rsub|0>>.

  The time-dependent PEC matrix of the vector
  <math|<math-bf|U><around|(|t|)>> is given in the form

  <\equation>
    <label|eq:pecnonstatout><with|font-base-size|9|\<b-Sigma\><rsub|<wide|<math-bf|U>|~><wide|<math-bf|U>|~>><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>><math-bf|N><rsup|\<ast\>><around|(|\<omega\>,t|)><math-bf|S><around|(|\<omega\>|)><math-bf|N><rsup|T><around|(|\<omega\>,t|)>*d*\<omega\>+\<b-Phi\><around|(|t|)>*\<b-Sigma\><rsub|<wide|<math-bf|U>|~><wide|<math-bf|U>|~>><around|(|0|)>*\<b-Phi\><rsup|T><around|(|t|)>+<math-bf|Q><around|(|t|)>+<math-bf|Q><rsup|\<ast\>>T<around|(|t|)>>
  </equation>

  in which <math|\<b-Sigma\><rsub|<wide|<math-bf|U>|~><wide|<math-bf|U>|~>><around|(|0|)>>
  is the PEC matrix evaluated at time <math|t=0>, and
  <math|<math-bf|Q><around|(|t|)>> is the complex matrix given in the form

  <\equation>
    <label|eq:q><math-bf|Q><around|(|t|)>=\<b-Phi\><around|(|t|)>*<big|int><rsub|0><rsup|t>E<around|[|<wide|<math-bf|U>|~><rsub|0><wide|<math-bf|F>|~><rsup|T><around|(|\<tau\>|)>|]>*\<b-Psi\><rsup|T>*<around|(|t-\<tau\>|)>*d*\<tau\>
  </equation>

  For deterministic zero-start conditions, the PEC matrix is given in the
  simpler form

  <\equation>
    <label|eq:pecnonstatoutsimple>\<b-Sigma\><rsub|<wide|<math-bf|U>|~><wide|<math-bf|U>|~>><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>><math-bf|N><rsup|\<ast\>><around|(|\<omega\>,t|)><math-bf|S><around|(|\<omega\>|)><math-bf|N><rsup|T><around|(|\<omega\>,t|)>*d*\<omega\>
  </equation>

  in which the various block matrices are given as

  <\equation>
    <label|eq:lambda0nonstat>\<b-Lambda\><rsub|0,<math-bf|XX>><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>><math-bf|R><rsub|0><rsup|\<ast\>><around|(|\<omega\>,t|)><math-bf|S><around|(|\<omega\>|)><math-bf|R><rsub|0><rsup|T><around|(|\<omega\>,t|)>*d*\<omega\>
  </equation>

  <\equation>
    <label|eq:lambda1nonstat>i*\<b-Lambda\><rsub|1,<math-bf|XX>><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>><math-bf|R><rsub|0><rsup|\<ast\>><around|(|\<omega\>,t|)><math-bf|S><around|(|\<omega\>|)><math-bf|R><rsub|1><rsup|T><around|(|\<omega\>,t|)>*d*\<omega\>
  </equation>

  <\equation>
    <label|eq:lambda2nonstat>\<b-Lambda\><rsub|2,<math-bf|XX>><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>><math-bf|R><rsub|1><rsup|\<ast\>><around|(|\<omega\>,t|)><math-bf|S><around|(|\<omega\>|)><math-bf|R><rsub|1><rsup|T><around|(|\<omega\>,t|)>*d*\<omega\>
  </equation>

  and

  <\equation>
    <label|eq:r0><math-bf|R><rsub|0><around|(|\<omega\>,t|)>=<big|int><rsub|0><rsup|t><math-bf|H><around|(|t-\<tau\>|)><math-bf|A><around|(|\<omega\>,\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
  </equation>

  <\equation>
    <label|eq:r1><math-bf|R><rsub|1><around|(|\<omega\>,t|)>=<big|int><rsub|0><rsup|t><wide|<math-bf|H>|\<dot\>><around|(|t-\<tau\>|)><math-bf|A><around|(|\<omega\>,\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>
  </equation>

  Evaluating for each frequency the integrals in equations<nbsp><eqref|eq:r0>
  and<nbsp><eqref|eq:r1> and substituting the latter in
  equations<nbsp><eqref|eq:lambda0nonstat>\U<eqref|eq:lambda2nonstat>, the
  various block matrices of <math|\<b-Sigma\><rsub|<wide|<math-bf|U>|~><wide|<math-bf|U>|~>><around|(|t|)>>
  can be computed.

  <section|Numerical Example>

  As an application, a two-degree-of-freedom, classically damped system
  depicted in Fig.<nbsp>1 has been analyzed. In this case the vector solution
  <math|<math-bf|X>> can be evaluated by means of the mode superposition as
  follows:

  <\equation>
    <label|eq:modesuper><math-bf|X>=\<b-Phi\><math-bf|Y>
  </equation>

  where <math|\<b-Phi\>> is the modal matrix normalized with respect to
  <math|<math-bf|M>>, and <math|<math-bf|Y>> is the vector solution of the
  decoupled modal differential equations. The examinated system is
  characterized by the following data

  <\align*>
    <tformat|<table|<row|<cell|M<rsub|1>>|<cell|=M<rsub|2>=1<space|0.17em><text|kg>;>>|<row|<cell|K<rsub|1>>|<cell|=50<space|0.17em><text|New/cm>;>>|<row|<cell|K<rsub|2>>|<cell|=33<space|0.17em><text|New/cm>.>>>>
  </align*>

  The modal analysis provided the following results:

  <\itemize>
    <item>Natural radian frequencies: <math|\<omega\><rsub|1>=3.76<space|0.17em>>rad/s;
    <math|\<omega\><rsub|2>=10.93<space|0.17em>>rad/s

    <item>Modal Matrix:

    <\equation*>
      \<b-Phi\>=<around*|[|<tabular*|<tformat|<table|<row|<cell|0.811>|<cell|0.585>>|<row|<cell|0.585>|<cell|-0.811>>>>>|]>
    </equation*>

    <item>the damping ratio, here assumed equal for both modes, is
    <math|\<zeta\>=0.05>.
  </itemize>

  The input process is defined as in equation<nbsp><eqref|eq:ftildenonstat>,
  in which <math|<math-bf|A><around|(|\<omega\>,t|)>> is given in the form
  (<cite|spanos1983>):

  <\equation>
    <label|eq:aomega>A<around|(|\<omega\>,t|)>=<sqrt|8>*exp
    <around*|(|-<frac|1|2>*b*t|)>*t*exp <around*|(|-<frac|1|2>*\<beta\><around|(|\<omega\>|)>*t|)>,<space|1em>0\<leq\>\<omega\>\<less\>\<infty\>.
  </equation>

  The process <math|d*Z<around|(|\<omega\>|)>> is such that

  <\equation>
    <label|eq:dzspec>E*<around|[|d*Z<around|(|\<omega\><rsub|1>|)>*d*Z<rsup|\<ast\>><around|(|\<omega\><rsub|2>|)>|]>=a<around|(|\<omega\><rsub|1>|)>*\<delta\>*<around|(|\<omega\><rsub|2>-\<omega\><rsub|1>|)>*d*\<omega\><rsub|1>*<space|1em><around|(|\<omega\>\<gtr\>0|)>.
  </equation>

  The parameters chosen for the analysis are

  <\equation>
    <tabular|<tformat|<table|<row|<cell|b>|<cell|=0.15<space|0.17em><text|s><rsup|-1>>>|<row|<cell|\<beta\><around|(|\<omega\>|)>>|<cell|=a<around|(|\<omega\>|)>=<around*|(|<frac|\<omega\>|5*\<pi\>>|)><rsup|2><space|0.17em><text|s><rsup|-1>>>>>>
  </equation>

  The spectrum of the input is characterized by a dominant frequency
  decreasing with time from about <math|5*\<pi\><space|0.17em>>rad/s to
  <math|2*\<pi\><space|0.17em>>rad/s, and by the fact that its total power
  initially increases with time and then gradually decreases.

  In Fig.<nbsp>2 the modal covariances of pre-envelope complex processes
  <math|<wide|Y|~><rsub|j>> (<math|j=1,2>) are plotted. In these figures it
  can be seen that the peaks of the curves of the different modes are located
  at different instants, according to the behavior of the input process. It
  is to be emphasized that if the function <math|A<around|(|\<omega\>,t|)>>
  and the power spectral density function had been chosen as real functions,
  all the moments of the evolutionary power would be real functions, while in
  the new representation, <math|E*<around|[|<wide|Y|~><rsub|j>*<wide|Y|~><rsub|j><rsup|\<ast\>>|]>>,
  <math|j=1,2> are complex functions.

  In Fig.<nbsp>3 the various modal cross-covariances are plotted, while in
  Fig.<nbsp>4 the (nodal) covariances of the pre-envelope complex process
  <math|X<rsub|2><around|(|t|)>> (displacements of the second mass) are
  plotted.

  From a practical point of view, the numerical evaluation of the
  nonstationary PEC needs to be conducted in the following way: First of all,
  in a suitable time interval, depending on the behavior of the input
  process, an adequate number of instants must be selected. For each instant,
  the <math|<math-bf|R><rsub|0><around|(|\<omega\>,t|)>>,
  <math|<math-bf|R><rsub|1><around|(|\<omega\>,t|)>> complex coefficients
  given in equation<nbsp><eqref|eq:r0>, <eqref|eq:r1> have to be evaluated,
  and an integration over the instantaneous frequency range of the input
  process for every covariance must be effected according to
  equations<nbsp><eqref|eq:lambda0nonstat>\U<eqref|eq:lambda2nonstat>.

  These integrals are difficult to solve analytically, but are not affected
  by particular computational problems, so that the most delicate aspect of
  the numerical problem is the evaluation of the
  <math|<math-bf|R><rsub|0><around|(|\<omega\>,t|)>> and
  <math|<math-bf|R><rsub|1><around|(|\<omega\>,t|)>> coefficients. If no
  analytical solution of such integrals can be found, for each instant
  considered and for each coefficient, a different numerical integration from
  <math|0> to the current instant must be effected. Such integrals depend
  essentially on the form of the <math|A<around|(|\<omega\>,t|)>> input
  function.

  In the present application a closed-form solution was easily found, but it
  is not reported for brevity's sake.

  <section|Conclusions and Discussion>

  The probabilistic structures of a real Gaussian process is fully determined
  by the first two moments (mean and covariance). In some cases of
  engineering interest, however, we are concerned with the statistics of the
  so-called envelope, that is, for narrow band process, a smooth curve
  joining the peaks of the process. Following <cite|dugundji1958> in the
  stationary case, and <cite|yang1972> in the nonstationary case, the
  envelope is defined as the modulus of the pre-envelope, i.e., a complex
  process, the real part of which is the given process, while the imaginary
  part is related to the real ones in such a way that the resulting complex
  process exhibits power only in the positive frequency range. In order to
  obtain the statistics of the envelope, the variances of the pre-envelope
  need to be evaluated, rather than the variances of the given real process.

  Here the covariances of such complex process have been evaluated, and it is
  shown that in the stationary case these covariances are strictly related to
  the so-called spectral moments. In particular, PEC matrix has been defined,
  the real part of which is the well-known covariance matrix of the real
  process, while its imaginary part contains the lowest imaginary part of the
  even SM, and the real part contains the first odd SM.

  Because the statistical characterization of the envelope requires both the
  real and the imaginary parts of the complex process, both the real and the
  imaginary parts of the PEC matrix are essential for the evaluation of the
  peak statistics of the real process.

  In order to extend the previous concepts to the nonstationary case, the
  complex representation of the nonstationary processes (introduced by
  <cite|yang1972>) has been adopted and extended to the vector processes, and
  the covariances of the pre-envelope process has been evaluated. The
  pre-envelope covariance coincides with the zeroth-order moment of the
  evolutionary power, while no analogous correspondence can be obtained
  between the higher moments of the evolutionary power and the covariances of
  the derivatives of the pre-envelope.

  On other hand, remembering that the SM are useful quantities for the
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
    <bibitem|arens1957>Arens, R., 1957, \PComplex processes for envelopes of
    normal noise,\Q <with|font-shape|italic|IRE Trans. on Information
    Theory>, Vol.<nbsp>3, pp.<nbsp>204\U207.

    <bibitem|borino1988>Borino, G., Di Paola, M., and Muscolino, G., 1988,
    \PNon-stationary spectral moments of base excited MDOF systems,\Q
    <with|font-shape|italic|Earth. Engng. and Struct. Dyn.>, Vol.<nbsp>16,
    pp.<nbsp>745\U756.

    <bibitem|corotis1972>Corotis, R. S., Vanmarcke, E. H., and Cornell, C.
    A., 1972, \PFirst Passage of Non-Stationary Random Processes,\Q
    <with|font-shape|italic|Journal of Engng. Mech. Div.>, Vol.<nbsp>98,
    No.<nbsp>EM2, pp.<nbsp>401\U414.

    <bibitem|dipaola1985>Di Paola, M., 1985, \PTransient Spectral Moments of
    Linear Systems,\Q <with|font-shape|italic|S. M. Archives>, Vol.<nbsp>10,
    pp.<nbsp>225\U243.

    <bibitem|dipaola1987>Di Paola, M., and Muscolino, G., 1987, \PSpectral
    Moments and Envelope for Non-Stationary\ 

    Non-Separable Processes,\Q <with|font-shape|italic|Proc. of the Int.
    Conf. ICASP 5>, Vol.<nbsp>1, pp.<nbsp>55\U62.

    <bibitem|dugundji1958>Dugundji, J., 1958, \PEnvelope and Pre-Envelope of
    Real Waveforms,\Q <with|font-shape|italic|IRE Transaction on Information
    Theory>, Vol.<nbsp>4, pp.<nbsp>53\U57.

    <bibitem|hammond1968>Hammond, J. K., 1968, \POn the Response of Single
    and Multidegree of Freedom Systems to Non-Stationary Random Excitation,\Q
    <with|font-shape|italic|Journal of Sound and Vibration>, Vol.<nbsp>7,
    pp.<nbsp>393\U416.

    <bibitem|kameda1975>Kameda, A., 1975, \PEvolutionary Spectra of
    Seismogram by Multifilter,\Q <with|font-shape|italic|Journal of The
    Engng. Mech. Div.>, Vol.<nbsp>101, No.<nbsp>EM6, pp.<nbsp>787\U801.

    <bibitem|krenk1983>Krenk, S., Madsen, H. O., and Madsen, P. H., 1983,
    \PStationary and Transient Response Envelopes,\Q
    <with|font-shape|italic|Journal of Engng. Mech. Div.>, Vol.<nbsp>109,
    No.<nbsp>EM1, pp.<nbsp>263\U277.

    <bibitem|muscolino1988>Muscolino, G., 1988, \PNon-Stationary Envelope in
    Random Vibration Theory,\Q <with|font-shape|italic|Journal of Engng.
    Mech. Div.>, Vol.<nbsp>114, No.<nbsp>8, pp.<nbsp>1396\U1413.

    <bibitem|nigam1982>Nigam, N. C., 1982, \PPhase Properties of a Class of
    Random Processes,\Q <with|font-shape|italic|Earthquake Engineering and
    Structural Dynamics>, Vol.<nbsp>10, pp.<nbsp>711\U717.

    <bibitem|papoulis1965>Papoulis, A., 1965, \PProbability Random Variables
    and Stochastic Processes,\Q McGraw-Hill, Kogakusha, Tokyo.

    <bibitem|priestley1965>Priestley, M. B., 1965, \PEvolutionary Spectra and
    Non-Stationary Processes,\Q <with|font-shape|italic|Journal of the Royal
    Statistical Society>, Vol.<nbsp>27, pp.<nbsp>204\U228.

    <bibitem|shinozuka1970>Shinozuka, M., 1970, \PRandom Processes with
    Evolutionary Power,\Q <with|font-shape|italic|Journal of Eng. Mech.
    Div.>, Vol.<nbsp>96, pp.<nbsp>543\U545.

    <bibitem|spanos1983>Spanos, P. T. D., and Solomos, G. P., 1983, \PMarkov
    Approximation to Transient Vibration,\Q <with|font-shape|italic|Journal
    of Eng. Mech. Div.>, Vol.<nbsp>1, pp.<nbsp>1134\U1149.<bibitem|to1986>To,
    C. W. S., 1986, \PResponse Statistic of Discretized Structures to
    Non-Stationary Vibration,\Q <with|font-shape|italic|Journal of Sound and
    Vibration>, Vol.<nbsp>105, pp.<nbsp>217\U231.

    <bibitem|vanmarcke1972>Vanmarcke, E. H., 1972, \PProperties of Special
    Moments with Application to Random Vibration,\Q
    <with|font-shape|italic|Journal of Eng. Mech. Div.>, Vol.<nbsp>98,
    pp.<nbsp>425\U446.

    <bibitem|yang1972>Yang, J. N., 1972, \PNon-Stationary Envelope Process
    and First Excursion Probability,\Q <with|font-shape|italic|Journal of
    Structural Mechanics>, Vol.<nbsp>1, pp.<nbsp>231\U248.
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
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-10|<tuple|8|14|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-11|<tuple|8|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-2|<tuple|2|2|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-3|<tuple|3|4|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-4|<tuple|4|6|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-5|<tuple|5|7|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-6|<tuple|6|9|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-7|<tuple|6.1|10|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-8|<tuple|6.2|11|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|auto-9|<tuple|7|12|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-arens1957|<tuple|arens1957|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-borino1988|<tuple|borino1988|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-corotis1972|<tuple|corotis1972|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-dipaola1985|<tuple|dipaola1985|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-dipaola1987|<tuple|dipaola1987|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-dugundji1958|<tuple|dugundji1958|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-hammond1968|<tuple|hammond1968|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-kameda1975|<tuple|kameda1975|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-krenk1983|<tuple|krenk1983|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-muscolino1988|<tuple|muscolino1988|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-nigam1982|<tuple|nigam1982|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-papoulis1965|<tuple|papoulis1965|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-priestley1965|<tuple|priestley1965|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-shinozuka1970|<tuple|shinozuka1970|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-spanos1983|<tuple|spanos1983|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-to1986|<tuple|to1986|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-vanmarcke1972|<tuple|vanmarcke1972|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|bib-yang1972|<tuple|yang1972|15|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:a1|<tuple|38|8|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:aomega|<tuple|73|13|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:block1|<tuple|27|6|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:block2|<tuple|28|6|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:block3|<tuple|29|6|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:blocknonstat1|<tuple|35|8|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:blocknonstat2|<tuple|36|8|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:blocknonstat3|<tuple|39|8|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:blocknonstat4|<tuple|40|8|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:blocknonstat5|<tuple|41|8|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:blocknonstat6|<tuple|42|8|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:corrparts|<tuple|12|4|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:corrpartsnonstat|<tuple|22|5|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:crosscorr|<tuple|11|4|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:crosscorrnonstat|<tuple|19|5|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:dotftildenonstat|<tuple|37|8|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:dpsi|<tuple|3|3|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:dzspec|<tuple|74|13|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:dztilde|<tuple|5|3|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:dztildeorth|<tuple|6|3|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:evospec|<tuple|31|7|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:extendedpec|<tuple|26|6|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:ftilde|<tuple|7|3|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:ftildeint|<tuple|10|4|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:ftildenonstat|<tuple|16|5|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:g|<tuple|50|9|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:hilbert|<tuple|9|4|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:hilbertnonstat|<tuple|18|5|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:hilbertout|<tuple|56|10|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:lambda0|<tuple|58|10|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:lambda0nonstat|<tuple|67|12|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:lambda1|<tuple|59|10|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:lambda1nonstat|<tuple|68|12|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:lambda2|<tuple|60|10|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:lambda2nonstat|<tuple|69|12|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:modesuper|<tuple|72|12|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:motion|<tuple|48|9|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:n|<tuple|62|11|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:nonstat|<tuple|15|4|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:nonstatout|<tuple|61|11|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:onesided|<tuple|4|3|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:orthogonal|<tuple|2|3|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:pecfreq|<tuple|30|7|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:pecmatrix|<tuple|24|6|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:pecnonstat|<tuple|34|7|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:pecnonstatdef|<tuple|45|9|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:pecnonstatdef1|<tuple|46|9|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:pecnonstatdef2|<tuple|47|9|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:pecnonstatout|<tuple|64|11|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:pecnonstatoutsimple|<tuple|66|11|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:pecout|<tuple|57|10|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:phi|<tuple|53|9|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:prealvector|<tuple|25|6|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:preenvelope|<tuple|8|3|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:preenvnonstat|<tuple|17|5|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:priestley|<tuple|1|2|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:pvector|<tuple|23|6|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:q|<tuple|65|11|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:r0|<tuple|70|12|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:r1|<tuple|71|12|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:rff|<tuple|13|4|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:rffnonstat|<tuple|20|5|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:rfhf|<tuple|14|4|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:rfhfnonstat|<tuple|21|5|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:s1|<tuple|43|8|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:s2|<tuple|44|8|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:sm0|<tuple|33|7|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:smnonstat|<tuple|32|7|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:solution|<tuple|49|9|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:statesolution|<tuple|52|9|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:statevector|<tuple|51|9|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:statout|<tuple|54|10|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:statout2|<tuple|55|10|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
    <associate|eq:u0|<tuple|63|11|../../../.TeXmacs/texts/scratch/no_name_9.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      kameda1975

      priestley1965

      dugundji1958

      yang1972

      krenk1983

      arens1957

      dugundji1958

      dipaola1985

      vanmarcke1972

      dipaola1985

      priestley1965

      hammond1968

      shinozuka1970

      corotis1972

      papoulis1965

      nigam1982

      arens1957

      dugundji1958

      yang1972

      vanmarcke1972

      dipaola1985

      borino1988

      muscolino1988

      vanmarcke1972

      vanmarcke1972

      shinozuka1970

      corotis1972

      to1986

      dipaola1987

      muscolino1988

      spanos1983

      dugundji1958

      yang1972

      yang1972
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

      <with|par-left|<quote|1tab>|6.1<space|2spc>P.E.C. Matrix of the
      Output-Stationary Case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|6.2<space|2spc>P.E.C. Matrix of the
      Output-Nonstationary Case <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Numerical
      Example> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Conclusions
      and Discussion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>