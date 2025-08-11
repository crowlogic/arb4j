<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Nonstationary Envelope in Random Vibration Theory: A
  Theorem-Proof Reformulation>|<doc-author|<author-data|<author-name|Giuseppe
  Muscolino(Original Author)>|<author-note|Researcher, Dipartimento di
  Ingegneria Strutturale e Geotecnica, Università degli Studi di Palermo,
  Viale delle Scienze, I-90128 Palermo, Italy.>>>|<doc-date|>>

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

  <padded-center|This document reformulates the results and derivations
  contained in the article ``NONSTATIONARY ENVELOPE IN RANDOM VIBRATION
  THEORY'' by <with|font-series|bold|Giuseppe
  Muscolino><cite|envelopesOfNonstationaryRandomVibrations> into a
  theorem-proof format. All core results, definitions, and derivations are
  attributed to the original author.>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Preliminaries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>One-sided
    PSD of an analytic process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Complex
    output, correlation kernels, and evolutionary PSD>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Stationary
    specialization and spectral moments> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Nonstationary
    Cross-Covariance-Spectral(CCS) moments and their meaning>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Envelope
    statistics and upcrossing rates> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>First-passage
    probability with Poisson and Markov assumptions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Conceptual
    conclusions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Authorship and
    Source Attribution> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
  </table-of-contents>

  <section|Preliminaries>

  Consider the SDOF linear system

  <\equation>
    <label|eq:motion><wide|x|\<ddot\>><around|(|t|)>+2*\<zeta\>*\<omega\><rsub|0>*<wide|x|\<dot\>><around|(|t|)>+\<omega\><rsub|0><rsup|2>*x<around|(|t|)>=f<around|(|t|)>
  </equation>

  with damping ratio <math|\<zeta\>\<in\><around|(|0,1|)>>, natural frequency
  <math|\<omega\><rsub|0>\<gtr\>0>, and damped frequency <math|>

  <\equation>
    \<omega\><rsub|D>=\<omega\><rsub|0>*<sqrt|1-\<zeta\><rsup|2>>
  </equation>

  Let <math|h<around|(|t|)>> be the impulse response,

  <\equation>
    <label|eq:h>h<around|(|t|)>=<frac|1|\<omega\><rsub|D>>*e<rsup|-\<zeta\>*\<omega\><rsub|0>*t>*sin
    <around|(|\<omega\><rsub|D>*t|)>*<space|0.17em><with|math-font-family|bf|1><rsub|t\<ge\>0>
  </equation>

  and let <math|>

  <\equation>
    H<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>h<around|(|t|)>*e<rsup|-i*\<omega\>*t>*<space|0.17em>d*t=<frac|1|\<omega\><rsub|0><rsup|2>-\<omega\><rsup|2>-2*i*\<zeta\>*\<omega\><rsub|0>*\<omega\>>
  </equation>

  \ denote the frequency response.

  <\definition>
    [Analytic (pre-envelope) process] Let <math|n<around|(|t|)>> be a
    zero-mean, stationary, real Gaussian process with two-sided PSD
    <math|G<rsub|n><around|(|\<omega\>|)>>. The <em|analytic (or
    pre-envelope) process> is

    <\equation>
      <label|eq:analytic>f<around|(|t|)>=n<around|(|t|)>+i*<space|0.17em><wide|n|^><around|(|t|)>
    </equation>

    where <math|<wide|n|^><around|(|t|)>> is the Hilbert transform of
    <math|n<around|(|t|)>>:

    <\equation>
      <label|eq:hilbert><wide|n|^><around|(|t|)>=<frac|1|\<pi\>>*<space|0.17em><text|p.v.><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|n<around|(|\<tau\>|)>|t-\<tau\>>*<space|0.17em>d*\<tau\>
    </equation>
  </definition>

  <\definition>
    [Nonstationary pre-envelope input] Let <math|F<around|(|t|)>> be a
    deterministic shaping function. The nonstationary complex input is

    <\equation>
      <label|eq:nonstat_input>f<around|(|t|)>=F<around|(|t|)>*<around*|(|n<around|(|t|)>+i*<wide|n|^><around|(|t|)>|)>=F<around|(|t|)>*f<rsub|s><around|(|t|)>
    </equation>

    where <math|f<rsub|s><around|(|t|)>> is the analytic process associated
    to <math|n<around|(|t|)>>
  </definition>

  <\definition>
    [Complex system response and envelope] For input
    <eqref|eq:nonstat_input>, define the complex response

    <\equation>
      <label|eq:complex_response>x<around|(|t|)>=y<around|(|t|)>+i*<wide|y|~><around|(|t|)>
    </equation>

    with <math|y<around|(|t|)>> the real response to
    <math|F<around|(|t|)>*n<around|(|t|)>>, and
    <math|<wide|y|~><around|(|t|)>> the imaginary companion induced by the
    complex excitation. The <em|envelope> and <em|phase> processes are

    <\equation>
      <label|eq:env_phase>a<around|(|t|)>=<around|\||x<around|(|t|)>|\|>=<sqrt|y<rsup|2><around|(|t|)>+<wide|y|~><rsup|2><around|(|t|)>>
    </equation>

    <\equation>
      \<vartheta\><around|(|t|)>=arg x<around|(|t|)>=tan<rsup|-1><space|-0.17em><around*|(|<frac|<wide|y|~><around|(|t|)>|y<around|(|t|)>>|)>
    </equation>
  </definition>

  <section|One-sided PSD of an analytic process>

  <\theorem>
    [One-sided PSD of <math|f<around|(|t|)>>]<label|thm:onesidedPSD> Let
    <math|f<around|(|t|)>=n<around|(|t|)>+i*<wide|n|^><around|(|t|)>>, with
    <math|n<around|(|t|)>> stationary, zero-mean, real, and with two-sided
    PSD <math|G<rsub|n><around|(|\<omega\>|)>>. Then the PSD of
    <math|f<around|(|t|)>> is one-sided:

    <\equation>
      G<rsub|f><around|(|\<omega\>|)>=4*<space|0.17em>U<around|(|\<omega\>|)>*<space|0.17em>G<rsub|n><around|(|\<omega\>|)>=2*<space|0.17em>U<around|(|\<omega\>|)>*<space|0.17em><wide|G|\<bar\>><rsub|f><around|(|\<omega\>|)>
    </equation>

    where <math|U<around|(|\<omega\>|)>> is the Heaviside step, and
    <math|<wide|G|\<bar\>><rsub|f>> is the corresponding two-sided PSD.
  </theorem>

  <\proof>
    The correlation of <math|f<around|(|t|)>> is

    <\equation>
      p<rsub|f><around|(|\<tau\>|)>=\<bbb-E\>*<around|{|f<around|(|t|)>*f<rsup|\<ast\>>*<around|(|t+\<tau\>|)>|}>=2*<around*|(|p<rsub|n><around|(|\<tau\>|)>+i*<space|0.17em>p<rsub|<wide|n|^>><around|(|\<tau\>|)>|)>,
    </equation>

    where <math|p<rsub|n><around|(|\<tau\>|)>=\<bbb-E\>*<around|{|n<around|(|t|)>*n*<around|(|t+\<tau\>|)>|}>>
    and <math|p<rsub|<wide|n|^>><around|(|\<tau\>|)>=\<bbb-E\>*<around|{|<wide|n|^><around|(|t|)>*n*<around|(|t+\<tau\>|)>|}>>.
    By Fourier transforming and using the Hilbert transform property
    <math|\<cal-F\><around|{|p<rsub|<wide|n|^>>|}>=-i<space|0.17em><math-up|sgn><around|(|\<omega\>|)>*<space|0.17em>G<rsub|n><around|(|\<omega\>|)>>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|G<rsub|f><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|f><around|(|\<tau\>|)>*e<rsup|-i*\<omega\>*\<tau\>>*d*\<tau\>=2*G<rsub|n><around|(|\<omega\>|)>+2*i*<around*|(|-i<space|0.17em><math-up|sgn><around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>|)>>>|<row|<cell|>|<cell|=2*G<rsub|n><around|(|\<omega\>|)>+2<space|0.17em><math-up|sgn><around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>=4*U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>>>>>>
    </equation>

    since

    <\equation>
      U<around|(|\<omega\>|)>=<tfrac|1+<math-up|sgn><around|(|\<omega\>|)>|2>
    </equation>

    . This proves the claim.
  </proof>

  <section|Complex output, correlation kernels, and evolutionary PSD>

  <\definition>
    [Derivative vector and cross-correlation] For integer <math|m\<ge\>1>,
    define

    <\equation>
      \<b-X\><rsub|m><around|(|t|)>=<around*|[|x<around|(|t|)>,<space|0.17em><wide|x|\<dot\>><around|(|t|)>,<space|0.17em>\<ldots\>,<space|0.17em>x<rsup|<around|(|m-1|)>><around|(|t|)>|]><rsup|T>
    </equation>

    <\equation>
      \<b-R\><rsub|m,x><around|(|t<rsub|1>,t<rsub|2>|)>=\<bbb-E\>*<around|{|\<b-X\><rsub|m><around|(|t<rsub|1>|)>*\<b-X\><rsub|m><rsup|\<ast\>><around|(|t<rsub|2>|)>|}>
    </equation>

    Let

    <\equation>
      <label|eq:psv>p<rsub|s,v,x><around|(|t<rsub|1>,t<rsub|2>|)>=\<bbb-E\><space|-0.17em><around*|{|x<rsup|<around|(|s|)>><around|(|t<rsub|1>|)><space|0.17em><around*|(|x<rsup|<around|(|v|)>><around|(|t<rsub|2>|)>|)><rsup|\<ast\>>|}>\<forall\>s,v\<in\><around|{|0,\<ldots\>,m-1|}>
    </equation>
  </definition>

  <\lemma>
    [Response derivatives via <math|h>]<label|lem:deriv> For <math|r\<ge\>0>,

    <\equation>
      <label|eq:derivative_form>x<rsup|<around|(|r|)>><around|(|t<rsub|1>|)>=<big|sum><rsub|k=0><rsup|r-2><binom|r|k>\<beta\><rsub|r-k-1>*<space|0.17em><frac|d<rsup|k>|d*t<rsub|1><rsup|k>>*f<around|(|t<rsub|1>|)>+<big|int><rsub|0><rsup|t<rsub|1>><frac|d<rsup|r>|d*t<rsub|1><rsup|r>>*h*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*<space|0.17em>f*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*<space|0.17em>d*\<tau\><rsub|1>
    </equation>

    where <math|<around|{|\<alpha\><rsub|r>|}>,<around|{|\<beta\><rsub|r>|}>>
    are defined recursively by

    <\equation>
      \<alpha\><rsub|r>=<choice|<tformat|<table|<row|<cell|1>|<cell|r=0>>|<row|<cell|-\<zeta\>*\<omega\><rsub|0>*\<alpha\><rsub|r-1>-\<omega\><rsub|D><rsup|2>*\<beta\><rsub|r-1>>|<cell|r\<gtr\>0>>>>>
    </equation>

    <\equation>
      \<beta\><rsub|r>=<choice|<tformat|<table|<row|<cell|0>|<cell|r=0>>|<row|<cell|-\<zeta\>*\<omega\><rsub|0>*\<beta\><rsub|r-1>+\<omega\><rsub|D>*\<alpha\><rsub|r-1>>|<cell|r=1>>>>>
    </equation>
  </lemma>

  <\proof>
    Start from the Duhamel integral <math|>

    <\equation>
      x<around|(|t|)>=<big|int><rsub|0><rsup|t>h*<around|(|t-\<tau\>|)>*f<around|(|\<tau\>|)>*<space|0.17em>d*\<tau\>
    </equation>

    , differentiate under the integral sign using Leibniz rule taking into
    account the distributional derivatives of <math|h> at <math|0<rsup|+>>
    and the known structure of derivatives of <math|h> dictated by the ODE
    satisfied by <math|h>. Collect boundary terms into the finite sum with
    coefficients <math|<around|{|\<beta\><rsub|r>|}>> and the convolution
    term as written. The stated recursions arise by enforcing the ODE
    <math|h<rprime|''>+2*\<zeta\>*\<omega\><rsub|0>*h<rprime|'>+\<omega\><rsub|0><rsup|2>*h=\<delta\>>
    and matching coefficients of derivatives at <math|0<rsup|+>>. Details
    follow the standard derivation for differentiating convolutions with
    kernels possessing slope discontinuities at <math|0<rsup|+>>.
  </proof>

  <\proposition>
    [Nonstationary cross-correlation kernel form]<label|prop:kernel> Let\ 

    <\equation>
      f<around|(|t|)>=F<around|(|t|)>*<around*|(|n<around|(|t|)>+i*<wide|n|^><around|(|t|)>|)>
    </equation>

    \ with <math|n> stationary, and define

    <\equation>
      K<rsub|r><around|(|\<omega\>,t|)>=<big|int><rsub|0><rsup|t><frac|d<rsup|r>|d*t<rsup|r>>*h<around|(|\<tau\>|)>*<space|0.17em>F*<around|(|t-\<tau\>|)>*<space|0.17em>e<rsup|i*\<omega\>*\<tau\>>*<space|0.17em>d*\<tau\>\<forall\>r\<ge\>0
    </equation>

    Then

    <\equation>
      <label|eq:general_corr>p<rsub|s,v,x><around|(|t<rsub|1>,t<rsub|2>|)>=4*<big|int><rsub|-\<infty\>><rsup|\<infty\>>U<around|(|\<omega\>|)>*<space|0.17em>G<rsub|n><around|(|\<omega\>|)>*<space|0.17em>e<rsup|i*\<omega\>*<around|(|t<rsub|1>-t<rsub|2>|)>>*<space|0.17em>K<rsub|s><around|(|\<omega\>,t<rsub|1>|)>*<space|0.17em>K<rsub|v><rsup|\<ast\>><around|(|\<omega\>,t<rsub|2>|)>*<space|0.17em>d*\<omega\>
    </equation>
  </proposition>

  <\proof>
    From Lemma<nbsp><reference|lem:deriv> and linearity,
    <math|p<rsub|s,v,x><around|(|t<rsub|1>,t<rsub|2>|)>> is a sum of terms
    involving expectations of products of <math|f> and its time-shifts. Using
    the stationarity of <math|n> and the structure <math|>

    <\equation>
      f<around|(|t|)>=F<around|(|t|)>*<around*|(|n<around|(|t|)>+i*<wide|n|^><around|(|t|)>|)>
    </equation>

    we have

    <\equation>
      \<bbb-E\>*<around|{|f*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*f<rsup|\<ast\>>*<around|(|t<rsub|2>-\<tau\><rsub|2>|)>|}>=F*<around|(|t<rsub|1>-\<tau\><rsub|1>|)>*F*<around|(|t<rsub|2>-\<tau\><rsub|2>|)>*<around*|(|p<rsub|n><around|(|\<gamma\>|)>+i*p<rsub|<wide|n|^>><around|(|\<gamma\>|)>|)>,
    </equation>

    with <math|>

    <\equation>
      \<gamma\>=t<rsub|1>-t<rsub|2>+\<tau\><rsub|1>-\<tau\><rsub|2>
    </equation>

    . Represent <math|p<rsub|n>,p<rsub|<wide|n|^>>> by inverse Fourier
    transforms using <math|G<rsub|n><around|(|\<omega\>|)>> and
    <math|-<space|-0.17em>i<space|0.17em><math-up|sgn><around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>>,
    respectively, and exchange integration order to obtain
    <eqref|eq:general_corr>, with the factor
    <math|4*U<around|(|\<omega\>|)>*G<rsub|n><around|(|\<omega\>|)>> arising
    by Theorem<nbsp><reference|thm:onesidedPSD>.
  </proof>

  <\definition>
    [Evolutionary PSD] For <math|>

    <\equation>
      s=v=0
    </equation>

    \ and\ 

    <\equation>
      t<rsub|1>=t<rsub|2>=t
    </equation>

    \ in <eqref|eq:general_corr>, define

    <\equation>
      <label|eq:evoPSD>G<rsub|x><around|(|\<omega\>,t|)>=4*<space|0.17em>U<around|(|\<omega\>|)>*<space|0.17em>G<rsub|n><around|(|\<omega\>|)><space|0.17em><mid|\|>K<rsub|0><around|(|\<omega\>,t|)><mid|\|><rsup|2>
    </equation>

    the one-sided evolutionary PSD of <math|x<around|(|t|)>>.
  </definition>

  <\theorem>
    [Failure of derivative-factorization in
    nonstationarity]<label|thm:fail_factor> In general, for <math|r\<gtr\>0>
    and finite <math|t>,

    <\equation>
      <label|eq:ineq>K<rsub|r><around|(|\<omega\>,t|)>\<neq\><around|(|i*\<omega\>|)><rsup|r>*<space|0.17em>K<rsub|0><around|(|\<omega\>,t|)>.
    </equation>

    Consequently, the evolutionary PSD <math|G<rsub|x><around|(|\<omega\>,t|)>>
    does not encode all cross-correlation derivatives <math|p<rsub|s,v,x>> in
    nonstationary settings.
  </theorem>

  <\proof>
    For <math|r\<gtr\>0> and finite <math|t>, <math|K<rsub|r>> involves
    derivatives of <math|h> convolved with the time-varying
    <math|F*<around|(|t-\<tau\>|)>> and a truncation at <math|\<tau\>=t>. The
    presence of the non-constant <math|F<around|(|\<cdummy\>|)>> and
    finite-time truncation breaks the commutation of differentiation with
    multiplication by <math|F*<around|(|t-\<tau\>|)>> and with the finite
    integration limit. Therefore differentiation in time does not correspond
    to multiplication by <math|<around|(|i*\<omega\>|)><rsup|r>> in the
    <math|\<tau\>>-domain transform, yielding <eqref|eq:ineq>. In the
    stationary limit <math|F\<equiv\>1> and <math|t\<to\>\<infty\>>, both
    obstructions vanish and equality is restored (see
    Theorem<nbsp><reference|thm:stationary_specialization>).
  </proof>

  <section|Stationary specialization and spectral moments>

  <\theorem>
    [Stationary specialization]<label|thm:stationary_specialization> If
    <math|F<around|(|t|)>\<equiv\>1> for all <math|t> and
    <math|t\<to\>\<infty\>>, then

    <\equation>
      <label|eq:Kr_stationary>K<rsub|r><around|(|\<omega\>,\<infty\>|)>=<big|int><rsub|0><rsup|\<infty\>>h<rsup|<around|(|r|)>><around|(|\<tau\>|)>*<space|0.17em>e<rsup|i*\<omega\>*\<tau\>>*<space|0.17em>d*\<tau\>=<around|(|i*\<omega\>|)><rsup|r>*H<rsup|\<ast\>><around|(|\<omega\>|)>
    </equation>

    Hence,

    <\equation>
      <label|eq:psv_stationary>p<rsub|s,v,x><around|(|\<tau\>|)>=4*<big|int><rsub|-\<infty\>><rsup|\<infty\>>U<around|(|\<omega\>|)>*<space|0.17em>G<rsub|n><around|(|\<omega\>|)>*<space|0.17em><around*|[|<around|(|-i*\<omega\>|)><rsup|s>*H<around|(|\<omega\>|)>|]>*<around*|[|<around|(|i*\<omega\>|)><rsup|v>*H<rsup|\<ast\>><around|(|\<omega\>|)>|]>*<space|0.17em>e<rsup|i*\<omega\>*\<tau\>>*<space|0.17em>d*\<omega\>
    </equation>

    with <math|\<tau\>=t<rsub|2>-t<rsub|1>>.
  </theorem>

  <\proof>
    With <math|F\<equiv\>1> and <math|t\<to\>\<infty\>>, <math|K<rsub|r>>
    becomes the full Fourier transform of <math|h<rsup|<around|(|r|)>>>, and
    by differentiation under the transform
    <math|K<rsub|r>=<around|(|i*\<omega\>|)><rsup|r>*K<rsub|0>=<around|(|i*\<omega\>|)><rsup|r>*H<rsup|\<ast\>>>.
    Substituting into <eqref|eq:general_corr> and using time-invariance
    yields <eqref|eq:psv_stationary>.
  </proof>

  <\proposition>
    <dueto|Derivative relations in the stationary
    case><label|prop:derivative_rel>Assume
    <math|p<rsub|0,x><around|(|\<tau\>|)>> is differentiable to all orders.
    Then

    <\align>
      <tformat|<table|<row|<cell|p<rsub|2*r,x><around|(|\<tau\>|)>>|<cell|=<around|(|-1|)><rsup|r><frac|d<rsup|2*r>|d*\<tau\><rsup|2*r>>*p<rsub|0,x><around|(|\<tau\>|)>=<around|(|-1|)><rsup|r>*\<bbb-E\>*<around|{|x<rsup|<around|(|r|)>><around|(|t|)>*<around|(|x<rsup|<around|(|r|)>>*<around|(|t+\<tau\>|)>|)><rsup|\<ast\>>|}><eq-number>>>|<row|<cell|p<rsub|2*r+1,x><around|(|\<tau\>|)>>|<cell|=<around|(|-1|)><rsup|r+1><frac|d<rsup|2*r+1>|d*\<tau\><rsup|2*r+1>>*p<rsub|0,x><around|(|\<tau\>|)>=<around|(|-1|)><rsup|r>*\<bbb-E\>*<around|{|x<rsup|<around|(|r|)>><around|(|t|)>*<around|(|x<rsup|<around|(|r+1|)>>*<around|(|t+\<tau\>|)>|)><rsup|\<ast\>>|}><eq-number>>>>>
    </align>

    Moreover, the imaginary part of <math|p<rsub|2*r,x>> and the real part of
    <math|p<rsub|2*r+1,x>> are Hilbert transforms of the corresponding real
    and imaginary parts, respectively.
  </proposition>

  <\proof>
    Differentiate\ 

    <\equation>
      p<rsub|0,x><around|(|\<tau\>|)>=\<bbb-E\>*<around|{|x<around|(|t|)>*x<rsup|\<ast\>>*<around|(|t+\<tau\>|)>|}>
    </equation>

    \ with respect to <math|\<tau\>> and use stationarity to move derivatives
    to the appropriate arguments of <math|x> and <math|x<rsup|\<ast\>>>.
    Fourier-domain representation <eqref|eq:psv_stationary> immediately
    yields the sign patterns and Hilbert relations by parity of
    <math|<around|(|i*\<omega\>|)><rsup|k>> and
    <math|U<around|(|\<omega\>|)>>-support.
  </proof>

  <\definition>
    [Stationary spectral moments] Define the one-sided spectral moments of
    <math|x> by

    <\equation>
      <label|eq:lambda_stationary>\<lambda\><rsub|j,x>=4*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|j>*<space|0.17em>U<around|(|\<omega\>|)>*<space|0.17em>G<rsub|n><around|(|\<omega\>|)><space|0.17em><around|\||H<around|(|\<omega\>|)>|\|><rsup|2>*<space|0.17em>d*\<omega\>
    </equation>
  </definition>

  <\theorem>
    [CCS matrix in the stationary case]<label|thm:ccs_stationary> Let
    <math|p<rsub|s,v,x><around|(|0|)>> be given by <eqref|eq:psv_stationary>
    with <math|\<tau\>=0>. Then

    <\equation>
      p<rsub|s,v,x><around|(|0|)>=<around|(|-i|)><rsup|s>*\<lambda\><rsub|s+v,x>
    </equation>

    and the cross-covariance spectral (CCS) matrix <math|>

    <\equation>
      \<b-Lambda\><rsub|m,x>=\<b-R\><rsub|m,x><around|(|0|)>
    </equation>

    \ is Hermitian, with entries

    <\equation>
      \<b-Lambda\><rsub|m,x>=<around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|0,x>>|<cell|-i*\<lambda\><rsub|1,x>>|<cell|-\<lambda\><rsub|2,x>>|<cell|i*\<lambda\><rsub|3,x>>|<cell|\<cdots\>>>|<row|<cell|i*\<lambda\><rsub|1,x>>|<cell|\<lambda\><rsub|2,x>>|<cell|-i*\<lambda\><rsub|3,x>>|<cell|-\<lambda\><rsub|4,x>>|<cell|\<cdots\>>>|<row|<cell|-\<lambda\><rsub|2,x>>|<cell|i*\<lambda\><rsub|3,x>>|<cell|\<lambda\><rsub|4,x>>|<cell|-i*\<lambda\><rsub|5,x>>|<cell|\<cdots\>>>|<row|<cell|-i*\<lambda\><rsub|3,x>>|<cell|-\<lambda\><rsub|4,x>>|<cell|i*\<lambda\><rsub|5,x>>|<cell|\<lambda\><rsub|6,x>>|<cell|\<cdots\>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>>>>>|]>
    </equation>
  </theorem>

  <\proof>
    Set <math|\<tau\>=0> in <eqref|eq:psv_stationary> and use the definition
    <eqref|eq:lambda_stationary>; the factor <math|<around|(|-i|)><rsup|s>>
    comes from the factorization of derivatives. Hermitian symmetry follows
    from conjugation and exchange of <math|s,v>.
  </proof>

  <section|Nonstationary Cross-Covariance-Spectral(CCS) moments and their
  meaning>

  <\definition>
    [Nonstationary Cross-Covariance-Spectral moments] Define

    <\equation>
      <label|eq:lambda_nonstat>\<lambda\><rsub|s,v,x><around|(|t|)>=<around|(|-i|)><rsup|s>*<space|0.17em>p<rsub|s,v,x><around|(|t,t|)>\<forall\>s,v\<ge\>0
    </equation>

    and the nonstationary CCS matrix\ 

    <\equation>
      \<b-Lambda\><rsub|m,x><around|(|t|)>=\<b-R\><rsub|m,x><around|(|t,t|)>
    </equation>

    \ with entries <math|\<lambda\><rsub|s,v,x><around|(|t|)>>.
  </definition>

  <\theorem>
    [Nonstationary Hermitian Cross-Covariance-Spectra moments and two-index
    dependence]<label|thm:nonstat_hermitian> For each <math|t>,
    <math|\<b-Lambda\><rsub|m,x><around|(|t|)>> is Hermitian. In general,

    <\equation>
      \<lambda\><rsub|s,v,x><around|(|t|)>\<neq\>\<lambda\><rsub|j,k,x><around|(|t|)>*<space|1em><text|even
      if >s+v=j+k,
    </equation>

    except in special stationary-like cases (e.g., <math|F\<equiv\>1>).
  </theorem>

  <\proof>
    Hermiticity follows from\ 

    <\equation>
      p<rsub|s,v,x><around|(|t,t|)>=<wide|p<rsub|v,s,x><around|(|t,t|)>|\<bar\>>
    </equation>

    \ by definition. The two-index dependence arises because the
    factorization\ 

    <\equation>
      K<rsub|r><around|(|\<omega\>,t|)>=<around|(|i*\<omega\>|)><rsup|r>*K<rsub|0><around|(|\<omega\>,t|)>
    </equation>

    \ fails in general (Theorem<nbsp><reference|thm:fail_factor>), so
    integrands for <math|<around|(|s,v|)>> and <math|<around|(|j,k|)>> with
    equal <math|>

    <\equation>
      s+v=j+k
    </equation>

    \ are not equal pointwise in <math|\<omega\>>, hence their integrals
    differ in general.
  </proof>

  <\proposition>
    [2-by-2 CCS and bandwidth parameter]<label|prop:2x2> For <math|m=2>,

    <\equation>
      <label|eq:Lambda2>\<b-Lambda\><rsub|2,x><around|(|t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|0,x><around|(|t|)>>|<cell|\<lambda\><rsub|1,x><around|(|t|)>>>|<row|<cell|\<lambda\><rsub|1,x><rsup|\<ast\>><around|(|t|)>>|<cell|\<lambda\><rsub|2,x><around|(|t|)>>>>>>|]>
    </equation>

    <\equation>
      <around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>=<frac|1|4>*<around*|(|\<lambda\><rsub|0,x><around|(|t|)>*\<lambda\><rsub|2,x><around|(|t|)>-<around|\||\<lambda\><rsub|1,x><around|(|t|)>|\|><rsup|2>|)>
    </equation>

    where\ 

    <\equation>
      \<b-Lambda\><rsub|2,z><around|(|t|)>=<tfrac|1|2>\<b-Lambda\><rsub|2,x><around|(|t|)>
    </equation>

    \ corresponds to <math|>

    <\equation>
      z<around|(|t|)>=<frac|x<around*|(|t|)>|<sqrt|2>>
    </equation>

    Define

    <\equation>
      q<rsub|z><rsup|2><around|(|t|)>=1-<frac|<around|\||\<lambda\><rsub|1,x><around|(|t|)>|\|><rsup|2>|\<lambda\><rsub|0,x><around|(|t|)>*\<lambda\><rsub|2,x><around|(|t|)>>
    </equation>

    Then <math|q<rsub|z><around|(|t|)>> generalizes the stationary bandwidth
    parameter, reducing to it when <math|<math-up|Im>\<lambda\><rsub|1,x><around|(|t|)>=0>.
  </proposition>

  <\proof>
    Direct computation:\ 

    <\equation>
      <around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>=<tfrac|1|4><around|\||\<b-Lambda\><rsub|2,x><around|(|t|)>|\|>=<tfrac|1|4><around*|(|\<lambda\><rsub|0,x>*\<lambda\><rsub|2,x>-<around|\||\<lambda\><rsub|1,x>|\|><rsup|2>|)>
    </equation>

    , and the definition of <math|q<rsub|z><rsup|2>> follows by
    normalization. The reduction to the stationary parameter is immediate
    when <math|\<lambda\><rsub|1,x>> is real.
  </proof>

  <section|Envelope statistics and upcrossing rates>

  <\definition>
    [Effective vector and Gaussianity] Let

    <\equation>
      \<b-Z\><rsub|m><around|(|t|)>=<frac|\<b-X\><rsub|m><around|(|t|)>|<sqrt|2>>
    </equation>

    If <math|f<around|(|t|)>> is zero-mean Gaussian (hence
    <math|x<around|(|t|)>> is complex Gaussian), then
    <math|\<b-Z\><rsub|m><around|(|t|)>> is zero-mean complex Gaussian with
    covariance\ 

    <\equation>
      \<b-Lambda\><rsub|m,z><around|(|t|)>=<tfrac|1|2>\<b-Lambda\><rsub|m,x><around|(|t|)>
    </equation>
  </definition>

  <\lemma>
    [Joint density in polar coordinates for <math|m=2>]<label|lem:polarJPDF>
    For <math|m=2>, denote <math|>

    <\equation>
      x<around|(|t|)>=<sqrt|2>*<space|0.17em>z<around|(|t|)>=<sqrt|2>*<space|0.17em>a<around|(|t|)>*e<rsup|i*\<vartheta\><around|(|t|)>>
    </equation>

    \ and similarly for <math|<wide|x|\<dot\>>>. Then the joint density of
    <math|<around|(|a,<wide|a|\<dot\>>,\<vartheta\>,<wide|\<vartheta\>|\<dot\>>|)>>
    at time <math|t> is

    <\equation>
      <label|eq:jpdf_polar>p<rsub|a,<wide|a|\<dot\>>,\<vartheta\>,<wide|\<vartheta\>|\<dot\>>><around|(|a,<wide|a|\<dot\>>,\<vartheta\>,<wide|\<vartheta\>|\<dot\>>;t|)>=<frac|4*\<pi\><rsup|2>*a<rsup|2>|<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>*e<rsup|-<frac|\<lambda\><rsub|2,x><around|(|t|)>*a<rsup|2>+\<lambda\><rsub|0,x><around|(|t|)>*<wide|a|\<dot\>><rsup|2>-2<math-up|Re><around|{|\<lambda\><rsub|1,x><around|(|t|)>|}>*a*<wide|a|\<dot\>>|2<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>>
    </equation>

    In particular, <math|\<vartheta\>> is uniform on
    <math|<around|[|0,2*\<pi\>|)>>, and <math|a> and <math|<wide|a|\<dot\>>>
    are independent iff <math|>

    <\equation>
      <math-up|Im>\<lambda\><rsub|1,x><around|(|t|)>=0
    </equation>

    which is the stationary case.
  </lemma>

  <\proof>
    Apply the linear complex Gaussian density for
    <math|\<b-Z\><rsub|2><around|(|t|)>> with covariance
    <math|\<b-Lambda\><rsub|2,z><around|(|t|)>>, transform to polar
    coordinates <math|<around|(|a,\<vartheta\>|)>> and
    <math|<around|(|<wide|a|\<dot\>>,<wide|\<vartheta\>|\<dot\>>|)>> via\ 

    <\equation>
      z<rsub|1>=<frac|a*e<rsup|i*\<vartheta\>>|<sqrt|2>>
    </equation>

    <\equation>
      z<rsub|2>=<frac|<wide|a|\<dot\>>*e<rsup|i*\<vartheta\><rsub|2>>|<sqrt|2>>
    </equation>

    , and compute the Jacobian

    <\equation>
      <around|\||J|\|>=a<rsup|2>
    </equation>

    Integrate out the angular velocities to the extent needed to obtain the
    stated marginal of <math|<around|(|a,<wide|a|\<dot\>>,\<vartheta\>,<wide|\<vartheta\>|\<dot\>>|)>>;
    the exponent collects the quadratic form defined by
    <math|\<b-Lambda\><rsub|2,z><rsup|-1><around|(|t|)>>, which is

    <\equation>
      \<b-Lambda\><rsub|2,z><rsup|-1><around|(|t|)>=<frac|2|<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>><around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|2,x><around|(|t|)>>|<cell|-\<lambda\><rsub|1,x><around|(|t|)>>>|<row|<cell|-\<lambda\><rsub|1,x><rsup|\<ast\>><around|(|t|)>>|<cell|\<lambda\><rsub|0,x><around|(|t|)>>>>>>|]>
    </equation>

    Uniformity of <math|\<vartheta\>> follows by rotational invariance of the
    complex Gaussian distribution; dependence of <math|a> and
    <math|<wide|a|\<dot\>>> is governed by the off-diagonal term
    <math|\<lambda\><rsub|1,x>>, whose imaginary part couples the
    quadratures.
  </proof>

  <\proposition>
    [Marginals for <math|a> and <math|<around|(|a,<wide|a|\<dot\>>|)>>]<label|prop:marginals>
    With the notation above,

    <\align>
      <tformat|<table|<row|<cell|p<rsub|a><around|(|a;t|)>>|<cell|=<frac|a
      exp <space|-0.17em><around*|(|-<frac|a<rsup|2>|2*\<lambda\><rsub|0,x><around|(|t|)>>|)>|\<lambda\><rsub|0,x><around|(|t|)>>*<eq-number>>>|<row|<cell|p<rsub|a,<wide|a|\<dot\>>><around|(|a,<wide|a|\<dot\>>;t|)>>|<cell|=<frac|a
      exp <space|-0.17em><around*|(|-<frac|\<lambda\><rsub|0,x><around|(|t|)>*\<lambda\><rsub|2,x><around|(|t|)>*a<rsup|2>-2<math-up|Re><around|{|\<lambda\><rsub|1,x><around|(|t|)>|}>*a*<wide|a|\<dot\>>+\<lambda\><rsub|0,x><around|(|t|)>*<wide|a|\<dot\>><rsup|2>|2<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>|)>|<sqrt|2*\<pi\>*<space|0.17em>\<lambda\><rsub|0,x><around|(|t|)><space|0.17em><around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>><eq-number>>>>>
    </align>
  </proposition>

  <\proof>
    Integrate <eqref|eq:jpdf_polar> over <math|\<vartheta\>,<wide|\<vartheta\>|\<dot\>>>
    to obtain <math|p<rsub|a,<wide|a|\<dot\>>>>; then integrate
    <math|p<rsub|a,<wide|a|\<dot\>>>> over <math|<wide|a|\<dot\>>> to obtain
    <math|p<rsub|a>>. The Rayleigh-type marginal for <math|a> follows because
    <math|>

    <\equation>
      \<lambda\><rsub|0,x><around|(|t|)>=\<bbb-E\><around|{|<around|\||x<around|(|t|)>|\|><rsup|2>|}>
    </equation>
  </proof>

  <\theorem>
    [Exact nonstationary upcrossing rate for circular
    barriers]<label|thm:upcrossing> Let <math|\<nu\><rsub|a><rsup|+><around|(|\<eta\>,t|)>>
    denote the mean rate of upcrossings of level <math|\<eta\>\<gtr\>0> by
    the envelope <math|a<around|(|t|)>>. Then

    <\equation>
      <label|eq:nu_final>\<nu\><rsub|a><rsup|+><around|(|\<eta\>,t|)>=<frac|<space|0.17em>e<rsup|-<frac|\<eta\><rsup|2>|2*\<lambda\><rsub|0,x><around|(|t|)>>>|<sqrt|2*\<pi\>>>*<sqrt|<frac|\<lambda\><rsub|2,x><around|(|t|)>|<around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>>**<around*|(|1+\<Phi\><space|-0.17em><around*|(|<frac|<math-up|Im><around|{|\<lambda\><rsub|1,x><around|(|t|)>|}>*<space|0.17em>\<eta\>|<sqrt|2*<space|0.17em>\<lambda\><rsub|0,x><around|(|t|)><space|0.17em><around|\||\<b-Lambda\><rsub|2,z><around|(|t|)>|\|>>>|)>|)>
    </equation>

    where\ 

    <\equation>
      \<Phi\><around|(|\<xi\>|)>=<frac|2|<sqrt|\<pi\>>>*<big|int><rsub|0><rsup|\<xi\>>e<rsup|-\<rho\><rsup|2>>*<space|0.17em>d*\<rho\>
    </equation>

    is the Gaussian error function.
  </theorem>

  <\proof>
    By Rice's formula for the envelope crossings,

    <\equation>
      \<nu\><rsub|a><rsup|+><around|(|\<eta\>,t|)>=<big|int><rsub|0><rsup|\<infty\>><wide|a|\<dot\>>*<space|0.17em>p<rsub|a,<wide|a|\<dot\>>><around|(|\<eta\>,<wide|a|\<dot\>>;t|)>*<space|0.17em>d*<wide|a|\<dot\>>
    </equation>

    Insert the explicit Gaussian form of <math|p<rsub|a,<wide|a|\<dot\>>>>
    from Proposition<nbsp><reference|prop:marginals> with <math|a=\<eta\>>
    and complete the square in <math|<wide|a|\<dot\>>>, yielding a Gaussian
    integral with a linear term that produces the error-function factor
    depending on <math|<math-up|Im>\<lambda\><rsub|1,x><around|(|t|)>>.
    Evaluation produces the prefactor <math|<sqrt|\<lambda\><rsub|2,x>/<around|\||\<b-Lambda\><rsub|2,z>|\|>>/<sqrt|2*\<pi\>>>
    and the exponential <math|exp <around|(|-\<eta\><rsup|2>/<around|(|2*\<lambda\><rsub|0,x>|)>|)>>,
    as stated.
  </proof>

  <\corollary>
    [Stationary upcrossing rate]<label|cor:stationary_upcrossing> If
    <math|<math-up|Im>\<lambda\><rsub|1,x><around|(|t|)>=0> (stationary
    case), then

    <\equation>
      \<nu\><rsub|a><rsup|+><around|(|\<eta\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<sqrt|<frac|\<lambda\><rsub|2,x>|\<lambda\><rsub|0,x>>>*<space|0.17em>exp
      <space|-0.17em><around*|(|-<frac|\<eta\><rsup|2>|2*\<lambda\><rsub|0,x>>|)>
    </equation>
  </corollary>

  <\proof>
    In stationarity, <math|<around|\||\<b-Lambda\><rsub|2,z>|\|>=<tfrac|1|4><around|(|\<lambda\><rsub|0,x>*\<lambda\><rsub|2,x>-\<lambda\><rsub|1,x><rsup|2>|)>>
    with <math|\<lambda\><rsub|1,x>> real and, for narrowband envelopes and
    standard conditions, the error-function argument vanishes so the bracket
    reduces to 1. The determinant ratio simplifies to
    <math|\<lambda\><rsub|2,x>/\<lambda\><rsub|0,x>> in the classical
    envelope-crossing setting, recovering the well-known expression.
  </proof>

  <section|First-passage probability with Poisson and Markov assumptions>

  Let <math|z<around|(|t|)>=<frac|x<around*|(|t|)>|<sqrt|2>>> and define the
  mean instantaneous frequency

  <\equation>
    <label|eq:mean_freq>\<omega\><rsub|a><around|(|t|)>=<sqrt|<frac|\<lambda\><rsub|2,x><around|(|t|)>|\<lambda\><rsub|0,x><around|(|t|)>>>
  </equation>

  and the half-cycle spacing <math|\<Delta\>*t\<simeq\>\<pi\>/\<omega\><rsub|a><around|(|t|)>>,
  approximated as constant in time outside transient zones.

  <\definition>
    [Discrete extrema process and failure rate] Let

    <\equation>
      t<rsub|n>=n*\<Delta\>*t
    </equation>

    \ and <math|Y<around|(|t<rsub|n>|)>> denote the peaks/troughs of
    <math|<math-up|Re><around|{|z<around|(|t|)>|}>>. Define the failure rate

    <\equation>
      b<around|(|t<rsub|n>|)>=\<bbb-P\>*<around|{|<space|0.17em><around|\||Y<around|(|t<rsub|n>|)>|\|>\<ge\>\<eta\>\<mid\>\<cap\><rsub|j=1><rsup|n-1><around|{|<around|\||Y<around|(|t<rsub|j>|)>|\|>\<less\>\<eta\>|}><space|0.17em>|}>
    </equation>
  </definition>

  <\proposition>
    [First-excursion probability]<label|prop:first_excursion> The probability
    that the first excursion of the envelope occurs within the first <math|n>
    half-cycles is

    <\equation>
      L<around|(|t<rsub|n>,\<eta\>|)>=1-<big|prod><rsub|j=1><rsup|n><around*|(|1-b<around|(|t<rsub|j>|)>|)>\<simeq\>1-exp
      <space|-0.17em><around*|(|-<big|sum><rsub|j=1><rsup|n>b<around|(|t<rsub|j>|)>|)>
    </equation>

    where the approximation holds for <math|b<around|(|t<rsub|j>|)>\<ll\>1>
    and large <math|n>.
  </proposition>

  <\proof>
    This follows from the standard relation between survival probability over
    discrete independent (or weakly dependent) trials and the sum of small
    failure probabilities, by <math|log <big|prod><around|(|1-b|)>\<approx\>-<big|sum>b>.
  </proof>

  <\theorem>
    [Poisson assumption]<label|thm:poisson> Under the Poisson approximation
    (successive extrema independent),

    <\equation>
      b<around|(|t<rsub|j>|)>=\<bbb-P\>*<around|{|a<around|(|t<rsub|j>|)>\<ge\>\<eta\>|}>=q<rsub|0><around|(|t<rsub|j>|)>=exp
      <space|-0.17em><around*|(|-<frac|\<eta\><rsup|2>|2*\<lambda\><rsub|0,x><around|(|t<rsub|j>|)>>|)>
    </equation>
  </theorem>

  <\proof>
    From Proposition<nbsp><reference|prop:marginals>,\ 

    <\equation>
      p<rsub|a><around|(|a;t|)>=<frac|a|\<lambda\><rsub|0,x><around|(|t|)>>*exp
      <around|(|-a<rsup|2>/<around|(|2*\<lambda\><rsub|0,x><around|(|t|)>|)>|)>
    </equation>

    Therefore <math|>

    <\equation>
      q<rsub|0><around|(|t<rsub|j>|)>=<big|int><rsub|\<eta\>><rsup|\<infty\>>p<rsub|a><around|(|a;t<rsub|j>|)>*<space|0.17em>d*a=exp
      <around|(|-\<eta\><rsup|2>/<around|(|2*\<lambda\><rsub|0,x><around|(|t<rsub|j>|)>|)>|)>
    </equation>
  </proof>

  <\theorem>
    [One-step Markov assumption]<label|thm:markov> Under the one-step memory
    Markov assumption,

    <\equation>
      b<around|(|t<rsub|j>|)>=<frac|q<around|(|t<rsub|j>,\<Delta\>*t|)>|1-q<rsub|0>*<around|(|t<rsub|j>-\<Delta\>*t|)>>
    </equation>

    where

    <\equation>
      <label|eq:q_def>q<around|(|t<rsub|j>,\<Delta\>*t|)>=<big|int><rsub|0><rsup|\<eta\>>*<big|int><rsub|\<eta\>><rsup|\<infty\>><space|0.17em>p<rsub|a<rsub|1>,a<rsub|2>><around|(|a<rsub|1>,a<rsub|2>;t<rsub|j>,\<Delta\>*t|)>d*a<rsub|2>*d*a<rsub|1>
    </equation>

    and <math|p<rsub|a<rsub|1>,a<rsub|2>>> is the joint density of envelopes
    at two times <math|t<rsub|j>-\<Delta\>*t> and <math|t<rsub|j>> given by

    <\equation>
      <label|eq:p_a1a2>p<rsub|a<rsub|1>,a<rsub|2>><around|(|a<rsub|1>,a<rsub|2>;t<rsub|j>,\<Delta\>*t|)>=<frac|4*\<pi\><rsup|2>*a<rsub|1>*a<rsub|2>
      *e<rsup|-<frac|\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)>*a<rsub|1><rsup|2>+\<lambda\><rsub|0,z><around|(|t<rsub|j>|)>*a<rsub|2><rsup|2>|2<around|\||\<b-R\><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>>
      *I<rsub|0><space|-0.17em><around*|(|<frac|a<rsub|1>*a<rsub|2>*<space|0.17em>r<rsub|0>|<around|\||\<b-R\><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>|)>|<around|\||\<b-R\><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>
    </equation>

    where <math|I<rsub|0>> the modified Bessel function of order zero and

    <\equation>
      \<lambda\><rsub|0,z><around|(|t|)>=<tfrac|1|2>\<lambda\><rsub|0,x><around|(|t|)>
    </equation>

    <\equation>
      r<rsub|0>=<around|\||p<rsub|0,z><around|(|t<rsub|j>-\<Delta\>*t,t<rsub|j>|)>|\|>
    </equation>

    <\equation>
      <around|\||\<b-R\><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>=\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)>*\<lambda\><rsub|0,z><around|(|t<rsub|j>|)>-r<rsub|0><rsup|2>
    </equation>
  </theorem>

  <\proof>
    By definition of conditional probability,

    <\equation>
      b<around|(|t<rsub|j>|)>=<frac|\<bbb-P\><around|{|a<around|(|t<rsub|j>|)>\<ge\>\<eta\>,a<around|(|t<rsub|j-1>|)>\<less\>\<eta\>|}>|\<bbb-P\>*<around|{|a<around|(|t<rsub|j-1>|)>\<less\>\<eta\>|}>>=<frac|q<around|(|t<rsub|j>,\<Delta\>*t|)>|1-q<rsub|0><around|(|t<rsub|j-1>|)>>
    </equation>

    The joint density <eqref|eq:p_a1a2> follows from the 2-time complex
    Gaussian law for <math|z<around|(|t|)>> with covariance block matrix

    <\equation>
      \<b-R\><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>=<around*|[|<tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)>>|<cell|p<rsub|0,z><around|(|t<rsub|j>-\<Delta\>*t,t<rsub|j>|)>>>|<row|<cell|p<rsub|0,z><rsup|\<ast\>><around|(|t<rsub|j>-\<Delta\>*t,t<rsub|j>|)>>|<cell|\<lambda\><rsub|0,z><around|(|t<rsub|j>|)>>>>>>|]>
    </equation>

    transformed to polar coordinates and integrated over the phases
    <math|\<vartheta\><rsub|1>,\<vartheta\><rsub|2>> (yielding
    <math|I<rsub|0>>). Substituting into <eqref|eq:q_def> gives the stated
    expression.
  </proof>

  <\proposition>
    [Series-friendly form for <math|q<around|(|t<rsub|j>,\<Delta\>*t|)>>]<label|prop:q_series>
    Let

    <\equation>
      w<rsub|1>=<frac|r<rsub|0>|<around|\||\<b-R\><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>*\<lambda\><rsub|0,z><around|(|t<rsub|j>|)>
    </equation>

    <\equation>
      w<rsub|2>=<frac|r<rsub|0>|<around|\||\<b-R\><rsub|1,z><around|(|t<rsub|j>,\<Delta\>*t|)>|\|>>*\<lambda\><rsub|0,z>*<around|(|t<rsub|j>-\<Delta\>*t|)>
    </equation>

    Using the series expansion of <math|I<rsub|0>>,
    <math|q<around|(|t<rsub|j>,\<Delta\>*t|)>> can be expressed in a
    numerically convenient series-integral form whose elementary terms
    involve the integrals

    <\equation>
      \<Phi\><rsub|i><around|(|\<eta\>|)>=<big|int><rsub|0><rsup|\<eta\>><frac|a<rsub|i>|\<lambda\><rsub|0,z><around|(|t<rsub|i>|)>>*exp
      <space|-0.17em><around*|(|-<frac|a<rsub|i><rsup|2>|2*\<lambda\><rsub|0,z><around|(|t<rsub|i>|)>>|)>*<space|0.17em>d*a<rsub|i>
    </equation>

    where <math|<around|(|i=1,2,t<rsub|1>=t<rsub|j>-\<Delta\>*t,t<rsub|2>=t<rsub|j>|)>>
    and exponentials with arguments proportional to <math|\<eta\><rsup|2>>.
    In particular, <math|q> can be assembled from three contributions: a term
    proportional to <math|>

    <\equation>
      r<rsub|0>*exp<around*|(|-\<eta\><rsup|2>*<frac|\<lambda\><rsub|0,z><around|(|t<rsub|1>|)>+\<lambda\><rsub|0,z><around|(|t<rsub|2>|)>|2<around|\||\<b-R\><rsub|1,z>|\|>>|)>
    </equation>

    , two Rayleigh-tail compensations <math|>

    <\equation>
      exp <around*|(|<frac|-\<eta\><rsup|2>|2*\<lambda\><rsub|0,z><around|(|t<rsub|i>|)>>|)>*\<Phi\><rsub|3-i><around|(|\<eta\>|)>
    </equation>

    , and corresponding cancellations, as detailed in the original
    derivation.
  </proposition>

  <\proof>
    Expand

    <\equation>
      I<rsub|0><around|(|\<xi\>|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|\<xi\>/2|)><rsup|2*k>|<around|(|k!|)><rsup|2>>
    </equation>

    \ inside <eqref|eq:p_a1a2>, separate integrals in <math|a<rsub|1>> and
    <math|a<rsub|2>>, and recognize each integral as either a Rayleigh-type
    tail integral or its complement over <math|<around|[|0,\<eta\>|]>>,
    giving the functions <math|\<Phi\><rsub|i><around|(|\<eta\>|)>>. Collect
    terms to obtain the fast-convergent representation described. The
    explicit algebra follows by termwise integration and grouping
    exponentials sharing the same quadratic forms in <math|\<eta\>>.
  </proof>

  <section|Conceptual conclusions>

  <\theorem>
    [Conceptual synthesis]<label|thm:conclusion> Under the nonstationary
    complex pre-envelope excitation\ 

    <\equation>
      f<around|(|t|)>=F<around|(|t|)>*<around|(|n+i*<wide|n|^>|)>
    </equation>

    <\itemize>
      <item>The envelope <math|a<around|(|t|)>> equals the modulus of the
      complex response <math|x<around|(|t|)>> and is physically consistent
      (no negative-time artifacts).

      <item>The appropriate nonstationary \Pspectral moments\Q with physical
      meaning are the Cross-Covariance-Spectral entries

      <\equation>
        \<lambda\><rsub|s,v,x><around|(|t|)>=<around|(|-i|)><rsup|s>*p<rsub|s,v,x><around|(|t,t|)>
      </equation>

      , i.e., variances and cross-variances of <math|x> and its derivatives.

      <item>The evolutionary PSD moments <math|>

      <\equation>
        \<lambda\><rsub|j><rsup|\<ast\>><around|(|t|)>=<big|int>\<omega\><rsup|j>*G<rsub|x><around|(|\<omega\>,t|)>*<space|0.17em>d*\<omega\>
      </equation>

      \ coincide with variances only for <math|j=0>; for <math|j\<gtr\>0>
      they generally lack the variance interpretation due to
      Theorem<nbsp><reference|thm:fail_factor>.

      <item>Exact expressions are obtained for the nonstationary envelope
      upcrossing rate <eqref|eq:nu_final> and for first-passage
      approximations under Poisson and one-step Markov assumptions.
    </itemize>
  </theorem>

  <\proof>
    Each bullet is established by the preceding
    Theorems<nbsp><reference|thm:onesidedPSD>, <reference|thm:fail_factor>,
    <reference|thm:nonstat_hermitian>, <reference|thm:upcrossing>,
    <reference|thm:poisson>, and <reference|thm:markov>, together with
    Definitions of the Cross-Covariance-Spectral(CCS) moments and the
    envelope/phase representation.
  </proof>

  <section*|Authorship and Source Attribution>

  All results, definitions, and derivations reformulated here are due to the
  original paper: <em|\PNONSTATIONARY ENVELOPE IN RANDOM VIBRATION THEORY\Q>
  by <with|font-series|bold|Giuseppe Muscolino>, Dipartimento di Ingegneria
  Strutturale e Geotecnica, Università degli Studi di Palermo, Italy. This
  document merely restructures the exposition into theorem-proof style with
  expanded intermediate steps for clarity.

  <\bibliography|bib|tm-plain|../refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-envelopesOfNonstationaryRandomVibrations>G.<nbsp>Muscolino.
      <newblock>Nonstationary envelope in random vibration theory.
      <newblock><with|font-shape|italic|Journal of Engineering Mechanics>,
      114(8):1396\U1413, 1988.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|auto-10|<tuple|<with|mode|<quote|math>|\<bullet\>>|15>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|6>>
    <associate|auto-5|<tuple|5|8>>
    <associate|auto-6|<tuple|6|9>>
    <associate|auto-7|<tuple|7|12>>
    <associate|auto-8|<tuple|8|15>>
    <associate|auto-9|<tuple|<with|mode|<quote|math>|\<bullet\>>|15>>
    <associate|bib-envelopesOfNonstationaryRandomVibrations|<tuple|1|15>>
    <associate|cor:stationary_upcrossing|<tuple|21|11>>
    <associate|eq:Kr_stationary|<tuple|32|6>>
    <associate|eq:Lambda2|<tuple|47|9>>
    <associate|eq:analytic|<tuple|5|2>>
    <associate|eq:complex_response|<tuple|8|3>>
    <associate|eq:derivative_form|<tuple|18|4>>
    <associate|eq:env_phase|<tuple|9|3>>
    <associate|eq:evoPSD|<tuple|30|6>>
    <associate|eq:general_corr|<tuple|24|5>>
    <associate|eq:h|<tuple|3|2>>
    <associate|eq:hilbert|<tuple|6|2>>
    <associate|eq:ineq|<tuple|31|6>>
    <associate|eq:jpdf_polar|<tuple|56|10>>
    <associate|eq:lambda_nonstat|<tuple|41|8>>
    <associate|eq:lambda_stationary|<tuple|37|7>>
    <associate|eq:mean_freq|<tuple|69|12>>
    <associate|eq:motion|<tuple|1|2>>
    <associate|eq:nonstat_input|<tuple|7|3>>
    <associate|eq:nu_final|<tuple|65|11>>
    <associate|eq:p_a1a2|<tuple|78|13>>
    <associate|eq:psv|<tuple|17|4>>
    <associate|eq:psv_stationary|<tuple|33|6>>
    <associate|eq:q_def|<tuple|77|13>>
    <associate|lem:deriv|<tuple|6|4>>
    <associate|lem:polarJPDF|<tuple|18|10>>
    <associate|prop:2x2|<tuple|16|9>>
    <associate|prop:derivative_rel|<tuple|11|7>>
    <associate|prop:first_excursion|<tuple|23|12>>
    <associate|prop:kernel|<tuple|7|5>>
    <associate|prop:marginals|<tuple|19|10>>
    <associate|prop:q_series|<tuple|26|14>>
    <associate|thm:ccs_stationary|<tuple|13|7>>
    <associate|thm:conclusion|<tuple|27|15>>
    <associate|thm:fail_factor|<tuple|9|6>>
    <associate|thm:markov|<tuple|25|13>>
    <associate|thm:nonstat_hermitian|<tuple|15|8>>
    <associate|thm:onesidedPSD|<tuple|4|3>>
    <associate|thm:poisson|<tuple|24|12>>
    <associate|thm:stationary_specialization|<tuple|10|6>>
    <associate|thm:upcrossing|<tuple|20|11>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      envelopesOfNonstationaryRandomVibrations
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>One-sided
      PSD of an analytic process> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Complex
      output, correlation kernels, and evolutionary PSD>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Stationary
      specialization and spectral moments>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Nonstationary
      Cross-Covariance-Spectral(CCS) moments and their meaning>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Envelope
      statistics and upcrossing rates> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>First-passage
      probability with Poisson and Markov assumptions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Conceptual
      conclusions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Authorship
      and Source Attribution> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>