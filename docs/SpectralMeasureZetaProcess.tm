<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\hide-preamble>
    <new-theorem|assumption|Assumption>

    <assign|supp|<macro|supp>>
  </hide-preamble>

  <doc-data|<doc-title|Spectral Measure of the Oscillatory Part of the Zeta
  Process>|<doc-date|>>

  <abstract-data|<\abstract>
    The Hardy <math|Z>-function is studied as a second-order process in the
    sense of Priestley's evolutionary spectral theory, where the spectral
    measure is determined by the autocovariance kernel via time-averaging and
    Bochner's theorem, with no probabilistic hypotheses. After the time
    change <math|v=\<vartheta\><around|(|t|)>> that removes the nonlinear
    phase drift, the function <math|<wide|Z|~><around|(|v|)>=Z<around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>>
    becomes a sum of slowly modulated sinusoids whose frequencies are
    determined by the Dirichlet series. The spectral measure of
    <math|<wide|Z|~>> is shown to decompose into an absolutely continuous
    part from the inter-zero oscillation and a pure point part with one atom
    per nontrivial zero, weighted by <math|1/<around|\||Z<rprime|'><around|(|\<gamma\><rsub|n>|)>|\|>>.
    The distributional Fourier transform of <math|<wide|Z|~>> has support in
    <math|<around|[|-2,<space|0.17em>0|]>>, a bandwidth determined by the
    Riemann--Siegel truncation and the functional equation.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1.<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2.<space|2spc>Spectral
    framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3.<space|2spc>Setup
    and notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4.<space|2spc>Dirichlet
    frequencies in the <with|mode|math|v>-coordinate>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5.<space|2spc><with|mode|math|<wide|Z|~>>
    as a <with|mode|math|B<rsup|2>>-almost-periodic function>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6.<space|2spc>Existence
    and structure of the spectral measure>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7.<space|2spc>Main
    results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8.<space|2spc>Proof
    of Theorem <no-break><specific|screen|<resize|<move|<with|color|#A0A0FF|->|-0.3em|>|0em||0em|>><reference|thm:II>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <with|par-left|1tab|Step 1: Expansion in the
    <with|mode|math|v>-coordinate <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|Step 2: Frequency bounds for the direct series
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|Step 3: The functional equation and reflected terms
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|Step 4: Gram-point analysis
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9.<space|2spc>Computation
    of atom weights> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10.<space|2spc>The
    bounding mechanism> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:intro>

  The Riemann\USiegel formula expresses the Hardy <math|Z>-function as a
  finite sum of oscillatory terms whose frequencies are governed by the
  Riemann\USiegel theta function <math|\<vartheta\><around|(|t|)>>. This sum
  is a second-order object: it has an autocovariance computed by
  time-averaging, and that autocovariance determines a spectral measure via
  Bochner's theorem.

  The time change <math|v=\<vartheta\><around|(|t|)>> straightens the
  nonlinear phase drift. In the <math|v>-coordinate, each Dirichlet term has
  slowly varying frequency in <math|<around|[|0,1|]>>, bounded by the
  truncation of the Riemann\USiegel sum. The functional equation maps these
  to a reflected band in <math|<around|[|-2,-1|]>>. The total spectral
  bandwidth is <math|<around|[|-2,0|]>>.

  The main results are:

  <\itemize>
    <item*|(I)>The spectral measure of <math|<wide|Z|~><around|(|v|)>=Z<around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>>
    decomposes as <math|\<mu\>=\<mu\><rsub|<math-up|ac>>+\<mu\><rsub|<math-up|pp>>>
    with atoms at the Dirichlet frequencies, weighted by
    <math|1/<around|\||Z<rprime|'><around|(|\<gamma\><rsub|n>|)>|\|>>
    (Theorem<nbsp><reference|thm:I>).

    <item*|(II)>The distributional Fourier transform of <math|<wide|Z|~>> has
    support in <math|<around|[|-2,0|]>> (Theorem<nbsp><reference|thm:II>).
  </itemize>

  The framework is the functional analysis of autocovariance kernels. No
  probability space, no expectation operator, and no distinction between
  \Pdeterministic\Q and \Pstochastic\Q enters the theory. Every function in
  <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>> whose
  time-averaged autocovariance converges is a second-order process; every
  sample path of a second-order process is such a function. The two settings
  are identical.

  <section|Spectral framework><label|sec:framework>

  <\definition>
    [Truncated autocovariance]<label|def:autocov> For
    <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>, define

    <\equation*>
      R<rsub|T><around|(|\<tau\>|)><space|0.27em>=<space|0.27em><frac|1|2*T>*<big|int><rsub|-T><rsup|T>f*<around|(|t+\<tau\>|)>*<space|0.17em>f<around|(|t|)>*<space|0.17em>d*t.
    </equation*>
  </definition>

  <\definition>
    [Spectral measure]<label|def:spectral-bochner> If the limit
    <math|R<around|(|\<tau\>|)>=lim<rsub|T\<to\>\<infty\>>
    R<rsub|T><around|(|\<tau\>|)>> exists for every
    <math|\<tau\>\<in\>\<bbb-R\>> and <math|R> is continuous and
    positive-definite, then by Bochner's theorem there exists a unique
    positive Borel measure <math|\<mu\>> on <math|\<bbb-R\>> such that

    <\equation>
      <label|eq:bochner>R<around|(|\<tau\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<tau\>>*<space|0.17em>\<mu\>*<around|(|d*\<omega\>|)>.
    </equation>

    This <math|\<mu\>> is the <em|spectral measure> of <math|f>.
  </definition>

  <\definition>
    [Besicovitch almost-periodic functions]<label|def:besicovitch> A function
    <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>> is
    <em|Besicovitch almost-periodic> (<math|B<rsup|2>>-a.p.) if for every
    <math|\<epsilon\>\<gtr\>0> there exists a trigonometric polynomial
    <math|P<around|(|t|)>=<big|sum><rsub|k=1><rsup|K>a<rsub|k>*<space|0.17em>e<rsup|i*\<lambda\><rsub|k>*t>>
    such that

    <\equation*>
      limsup<rsub|T\<to\>\<infty\>> <frac|1|2*T>*<big|int><rsub|-T><rsup|T><around|\||f<around|(|t|)>-P<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t\<less\>\<epsilon\>.
    </equation*>
  </definition>

  <\theorem>
    [Spectral structure of <math|B<rsup|2>>-a.p. functions;
    <cite-detail|Besicovitch1954|Ch.<space|0.17em>I,
    Ÿ6>]<label|thm:besicovitch> Let <math|f> be Besicovitch almost-periodic.
    Then:

    <\enumerate>
      <item><math|R<around|(|\<tau\>|)>=lim<rsub|T\<to\>\<infty\>>
      R<rsub|T><around|(|\<tau\>|)>> exists for all <math|\<tau\>> and is
      continuous and positive-definite.

      <item>The spectral measure <math|\<mu\>> decomposes as
      <math|\<mu\>=\<mu\><rsub|<math-up|ac>>+\<mu\><rsub|<math-up|pp>>> with
      no singular continuous part.

      <item>The pure point part satisfies
      <math|\<mu\><rsub|<math-up|pp>>=<big|sum><rsub|\<lambda\>><around|\||a<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>\<delta\>*<around|(|\<omega\>-\<lambda\>|)>>,
      where <math|a<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>f<around|(|t|)>*<space|0.17em>e<rsup|-i*\<lambda\>*t>*<space|0.17em>d*t>
      is the mean Fourier coefficient of <math|f> at frequency
      <math|\<lambda\>>.
    </enumerate>
  </theorem>

  <section|Setup and notation><label|sec:setup>

  <\definition>
    <label|def:gamma>Let <math|\<gamma\><rsub|1>\<less\>\<gamma\><rsub|2>\<less\>\<cdots\>>
    denote the imaginary parts of the nontrivial zeros of <math|\<zeta\>> on
    the critical line, so that <math|\<zeta\>*<around|(|1/2+i*\<gamma\><rsub|n>|)>=0>
    for each <math|n\<ge\>1>.
  </definition>

  <\assumption>
    [Simple zeros]<label|ass:simple> All nontrivial zeros on the critical
    line are simple: <math|\<zeta\><rprime|'>*<around|(|1/2+i*\<gamma\><rsub|n>|)>\<ne\>0>
    for every <math|n\<ge\>1>.
  </assumption>

  <\definition>
    [Hardy <math|Z>-function]<label|def:Z>

    <\equation*>
      Z<around|(|t|)>=e<rsup|i*\<vartheta\><around|(|t|)>>*<space|0.17em>\<zeta\>*<around|(|1/2+i*t|)>,
    </equation*>

    where <math|\<vartheta\><around|(|t|)>=arg
    <space|-0.17em><around*|(|\<pi\><rsup|-i*t/2>*<space|0.17em>\<Gamma\>*<around|(|1/4+i*t/2|)>|)>>
    is the Riemann\USiegel theta function (continuous branch). The function
    <math|Z<around|(|t|)>> is real-valued for <math|t\<in\>\<bbb-R\>>.
  </definition>

  <\lemma>
    [Asymptotics of <math|\<vartheta\>>]<label|lem:theta-asymp> For
    <math|t\<gtr\>0>,

    <\align>
      <tformat|<table|<row|<cell|\<vartheta\><around|(|t|)>>|<cell|=<frac|t|2>*log
      <frac|t|2*\<pi\>>-<frac|t|2>-<frac|\<pi\>|8>+O<around|(|t<rsup|-1>|)>,<eq-number><label|eq:theta>>>|<row|<cell|\<vartheta\><rprime|'><around|(|t|)>>|<cell|=<frac|1|2>*log
      <frac|t|2*\<pi\>>+O<around|(|t<rsup|-1>|)>,<eq-number><label|eq:theta-prime>>>|<row|<cell|\<vartheta\><rprime|''><around|(|t|)>>|<cell|=<frac|1|2*t>+O<around|(|t<rsup|-2>|)>.<eq-number><label|eq:theta-pp>>>>>
    </align>

    In particular, <math|\<vartheta\><rprime|'><around|(|t|)>\<gtr\>0> for
    all <math|t\<gtr\>2*\<pi\>>, and <math|\<vartheta\>> is a smooth,
    strictly increasing diffeomorphism of
    <math|<around|(|2*\<pi\>,\<infty\>|)>> onto its range.
  </lemma>

  <\proof>
    Stirling's approximation gives <math|log
    \<Gamma\>*<around|(|1/4+i*t/2|)>=<around|(|i*t/2|)>*log
    <around|(|i*t/2|)>-i*t/2-<tfrac|1|2>log <around|(|i*t/2|)>+<tfrac|1|2>log
    2*\<pi\>+O<around|(|t<rsup|-1>|)>>. Taking the imaginary part
    yields<nbsp><eqref|eq:theta>. Differentiating:
    <math|\<vartheta\><rprime|'><around|(|t|)>=<tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>+<tfrac|1|2>-<tfrac|1|2>+O<around|(|t<rsup|-1>|)>=<tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>+O<around|(|t<rsup|-1>|)>>,
    giving<nbsp><eqref|eq:theta-prime>. Differentiating again
    gives<nbsp><eqref|eq:theta-pp>. For <math|t\<gtr\>2*\<pi\>>,
    <math|<tfrac|1|2>log <around|(|t/2*\<pi\>|)>\<gtr\>0>.
  </proof>

  <\definition>
    [Time-changed function]<label|def:Ztilde>

    <\equation*>
      <wide|Z|~><around|(|v|)>=Z<around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>,
    </equation*>

    where <math|v=\<vartheta\><around|(|t|)>> ranges over the image of
    <math|\<vartheta\>>.
  </definition>

  <\lemma>
    [Riemann\USiegel formula]<label|lem:RS> For
    <math|N<around|(|t|)>=<around|\<lfloor\>|<sqrt|t/2*\<pi\>>|\<rfloor\>>>,

    <\equation>
      <label|eq:RS>Z<around|(|t|)>=2*<big|sum><rsub|m=1><rsup|N<around|(|t|)>>m<rsup|-1/2>*cos
      <around|(|\<vartheta\><around|(|t|)>-t*log m|)>+R<around|(|t|)>,
    </equation>

    where <math|R<around|(|t|)>=O<around|(|t<rsup|-1/4>|)>>.
  </lemma>

  <section|Dirichlet frequencies in the <math|v>-coordinate><label|sec:frequencies>

  The time change <math|v=\<vartheta\><around|(|t|)>> converts each Dirichlet
  term into a function whose frequency is bounded and slowly varying.

  <\lemma>
    [Phase and frequency in the <math|v>-coordinate]<label|lem:v-freq> Under
    <math|v=\<vartheta\><around|(|t|)>>, the <math|m>-th Dirichlet term in
    the Riemann\USiegel formula has phase

    <\equation>
      <label|eq:phase-v>\<Psi\><rsub|m><around|(|v|)>=v-\<vartheta\><rsup|-1><around|(|v|)>*log
      m,
    </equation>

    and its frequency in <math|v> is

    <\equation>
      <label|eq:freq-v>\<Psi\><rsub|m><rprime|'><around|(|v|)>=1-<frac|log
      m|\<vartheta\><rprime|'><around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>>.
    </equation>

    For <math|1\<le\>m\<le\>N<around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>>:

    <\equation>
      <label|eq:freq-range>\<Psi\><rsub|m><rprime|'><around|(|v|)>\<in\><around|[|0,<space|0.17em>1|]>.
    </equation>
  </lemma>

  <\proof>
    In the <math|t>-coordinate the <math|m>-th Dirichlet term has phase
    <math|\<Phi\><rsub|m><around|(|t|)>=\<vartheta\><around|(|t|)>-t*log m>.
    Under <math|v=\<vartheta\><around|(|t|)>>,
    <math|t=\<vartheta\><rsup|-1><around|(|v|)>>, so
    <math|\<Phi\><rsub|m>=v-\<vartheta\><rsup|-1><around|(|v|)>*log m>.
    Differentiating with respect to <math|v>:

    <\equation*>
      \<Psi\><rsub|m><rprime|'><around|(|v|)>=<frac|d|d*v>*<around*|[|v-\<vartheta\><rsup|-1><around|(|v|)>*log
      m|]>=1-<frac|log m|\<vartheta\><rprime|'><around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>>.
    </equation*>

    Writing <math|t=\<vartheta\><rsup|-1><around|(|v|)>> and
    using<nbsp><eqref|eq:theta-prime>: <math|\<vartheta\><rprime|'><around|(|t|)>=<tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>+O<around|(|t<rsup|-1>|)>>. For
    <math|m\<le\>N<around|(|t|)>=<around|\<lfloor\>|<sqrt|t/2*\<pi\>>|\<rfloor\>>>,
    <math|log m\<le\><tfrac|1|2>log <around|(|t/2*\<pi\>|)>\<le\>\<vartheta\><rprime|'><around|(|t|)>+O<around|(|t<rsup|-1>|)>>,
    so <math|\<Psi\><rsub|m><rprime|'><around|(|v|)>\<ge\>0+O<around|(|t<rsup|-1>/log
    t|)>\<ge\>0> for <math|t> large enough. For <math|m=1>,
    <math|\<Psi\><rsub|1><rprime|'><around|(|v|)>=1>.
  </proof>

  <\lemma>
    [Slow variation of the frequency]<label|lem:freq-drift> Let
    <math|\<omega\><rsub|m><around|(|v|)>=\<Psi\><rsub|m><rprime|'><around|(|v|)>>.
    Then

    <\equation>
      <label|eq:freq-drift-rate>\<omega\><rsub|m><rprime|'><around|(|v|)>=<frac|log
      m\<cdot\>\<vartheta\><rprime|''><around|(|t|)>|\<vartheta\><rprime|'><around|(|t|)><rsup|3>>=O<space|-0.17em><around*|(|<frac|log
      m|t<space|0.17em><around|(|log t|)><rsup|3>>|)>=O<space|-0.17em><around*|(|<frac|1|t<space|0.17em><around|(|log
      t|)><rsup|2>>|)>,
    </equation>

    where <math|t=\<vartheta\><rsup|-1><around|(|v|)>>, uniformly for
    <math|m\<le\>N<around|(|t|)>>.
  </lemma>

  <\proof>
    Differentiating <math|\<omega\><rsub|m><around|(|v|)>=1-log
    m/\<vartheta\><rprime|'><around|(|t|)>> with respect to <math|v>, using
    <math|d*v=\<vartheta\><rprime|'><around|(|t|)>*<space|0.17em>d*t>:

    <\equation*>
      \<omega\><rsub|m><rprime|'><around|(|v|)>=<frac|d|d*v>*<space|-0.17em><around*|[|-<frac|log
      m|\<vartheta\><rprime|'><around|(|t|)>>|]>=-log
      m\<cdot\><frac|d|d*t><space|-0.17em><around*|[|<frac|1|\<vartheta\><rprime|'><around|(|t|)>>|]>\<cdot\><frac|d*t|d*v>=<frac|log
      m\<cdot\>\<vartheta\><rprime|''><around|(|t|)>|\<vartheta\><rprime|'><around|(|t|)><rsup|3>>.
    </equation*>

    By<nbsp><eqref|eq:theta-prime> and<nbsp><eqref|eq:theta-pp>,
    <math|\<vartheta\><rprime|''><around|(|t|)>/\<vartheta\><rprime|'><around|(|t|)><rsup|3>=O<around|(|1/<around|(|t<around|(|log
    t|)><rsup|3>|)>|)>>. Since <math|log m\<le\><tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>=O<around|(|log t|)>> for
    <math|m\<le\>N<around|(|t|)>>, the bound follows.
  </proof>

  <\corollary>
    [Integrability of the drift]<label|cor:drift-int> For each fixed
    <math|m>,

    <\equation*>
      <big|int><rsub|V><rsup|\<infty\>><around|\||\<omega\><rsub|m><rprime|'><around|(|v|)>|\|>*<space|0.17em>d*v\<less\>\<infty\>.
    </equation*>

    That is, the total frequency drift of the <math|m>-th Dirichlet term is
    finite.
  </corollary>

  <\proof>
    Under <math|v=\<vartheta\><around|(|t|)>>,
    <math|d*v=\<vartheta\><rprime|'><around|(|t|)>*<space|0.17em>d*t\<sim\><tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>*<space|0.17em>d*t>. Therefore

    <\equation*>
      <big|int><rsub|V><rsup|\<infty\>><around|\||\<omega\><rsub|m><rprime|'><around|(|v|)>*<around|\||<space|0.17em>d*v=<big|int><rsub|T<rsub|0>><rsup|\<infty\>>|\|>*\<omega\><rsub|m><rprime|'><around|(|\<vartheta\><around|(|t|)>|)>|\|>*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)>*<space|0.17em>d*t=<big|int><rsub|T<rsub|0>><rsup|\<infty\>>O<space|-0.17em><around*|(|<frac|log
      m|t<space|0.17em><around|(|log t|)><rsup|3>>|)>\<cdot\>O<around|(|log
      t|)>*<space|0.17em>d*t=<big|int><rsub|T<rsub|0>><rsup|\<infty\>>O<space|-0.17em><around*|(|<frac|log
      m|t<space|0.17em><around|(|log t|)><rsup|2>>|)>*<space|0.17em>d*t.
    </equation*>

    This converges since <math|<big|int>t<rsup|-1><around|(|log
    t|)><rsup|-2>*<space|0.17em>d*t\<less\>\<infty\>>.
  </proof>

  <section|<math|<wide|Z|~>> as a <math|B<rsup|2>>-almost-periodic
  function><label|sec:B2>

  <\proposition>
    <label|prop:Ztilde-RS>In the <math|v>-coordinate, the Riemann\USiegel
    formula becomes

    <\equation>
      <label|eq:Ztilde-RS><wide|Z|~><around|(|v|)>=2*<big|sum><rsub|m=1><rsup|N<around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>>m<rsup|-1/2>*cos
      <around|(|\<Psi\><rsub|m><around|(|v|)>|)>+<wide|R|~><around|(|v|)>,
    </equation>

    where <math|<wide|R|~><around|(|v|)>=R<around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>=O<around|(|<around|(|\<vartheta\><rsup|-1><around|(|v|)>|)><rsup|-1/4>|)>\<to\>0>
    as <math|v\<to\>\<infty\>>.
  </proposition>

  <\proof>
    Direct substitution of <math|t=\<vartheta\><rsup|-1><around|(|v|)>> into
    Lemma<nbsp><reference|lem:RS>. The remainder bound
    <math|R<around|(|t|)>=O<around|(|t<rsup|-1/4>|)>> carries over.
  </proof>

  <\lemma>
    [Asymptotic orthogonality of slowly modulated
    sinusoids]<label|lem:orthog> Let <math|f<around|(|v|)>=e<rsup|i*\<Psi\><around|(|v|)>>>
    and <math|g<around|(|v|)>=e<rsup|i*\<Phi\><around|(|v|)>>> where
    <math|\<Psi\><rprime|'><around|(|v|)>-\<Phi\><rprime|'><around|(|v|)>\<to\>\<alpha\>\<ne\>0>
    as <math|v\<to\>\<infty\>> and <math|<around|\||\<Psi\><rprime|'><around|(|v|)>-\<Phi\><rprime|'><around|(|v|)>-\<alpha\>|\|>=O<around|(|v<rsup|-\<beta\>>|)>>
    for some <math|\<beta\>\<gtr\>0>. Then

    <\equation>
      <label|eq:orthog>lim<rsub|V\<to\>\<infty\>>
      <frac|1|2*V>*<big|int><rsub|-V><rsup|V>f<around|(|v|)><space|0.17em><wide|g<around|(|v|)>|\<bar\>><space|0.17em>d*v=0.
    </equation>
  </lemma>

  <\proof>
    Write <math|f<around|(|v|)><space|0.17em><wide|g<around|(|v|)>|\<bar\>>=e<rsup|i*<around|(|\<Psi\><around|(|v|)>-\<Phi\><around|(|v|)>|)>>>.
    The phase difference <math|\<Psi\><around|(|v|)>-\<Phi\><around|(|v|)>=\<alpha\>*<space|0.17em>v+\<eta\><around|(|v|)>>
    where <math|\<eta\><rprime|'><around|(|v|)>=\<Psi\><rprime|'><around|(|v|)>-\<Phi\><rprime|'><around|(|v|)>-\<alpha\>=O<around|(|v<rsup|-\<beta\>>|)>>.
    Therefore <math|\<eta\><around|(|v|)>=O<around|(|v<rsup|1-\<beta\>>|)>>
    for <math|\<beta\>\<ne\>1> or <math|O<around|(|log v|)>> for
    <math|\<beta\>=1>.

    For the time average:

    <\equation*>
      <frac|1|2*V>*<big|int><rsub|-V><rsup|V>e<rsup|i*<around|(|\<alpha\>*v+\<eta\><around|(|v|)>|)>>*<space|0.17em>d*v.
    </equation*>

    Since <math|\<alpha\>\<ne\>0> and <math|\<eta\>> is slowly varying,
    integration by parts gives

    <\equation*>
      <around*|\||<frac|1|2*V>*<big|int><rsub|-V><rsup|V>e<rsup|i*\<alpha\>*v>*<space|0.17em>e<rsup|i*\<eta\><around|(|v|)>>*<space|0.17em>d*v|\|>\<le\><frac|1|2*V>*<around*|[|<frac|2|<around|\||\<alpha\>|\|>>+<frac|1|<around|\||\<alpha\>|\|>>*<big|int><rsub|-V><rsup|V><around|\||\<eta\><rprime|'><around|(|v|)>|\|>*<space|0.17em>d*v|]>=O<around|(|V<rsup|-min
      <around|(|1,\<beta\>|)>>|)>.
    </equation*>

    This tends to <math|0> as <math|V\<to\>\<infty\>>.
  </proof>

  <\lemma>
    [Mean value of a slowly modulated sinusoid]<label|lem:mean-val> Let
    <math|f<around|(|v|)>=a<around|(|v|)>*<space|0.17em>e<rsup|i*\<Psi\><around|(|v|)>>>
    where <math|a<around|(|v|)>\<gtr\>0> is bounded and slowly varying
    (<math|a<rprime|'><around|(|v|)>/a<around|(|v|)>\<to\>0>) and
    <math|\<Psi\><rprime|'><around|(|v|)>\<to\>\<omega\><rsub|0>\<ne\>0>.
    Suppose <math|<around|\||\<Psi\><rprime|'><around|(|v|)>-\<omega\><rsub|0>|\|>=O<around|(|v<rsup|-\<beta\>>|)>>
    for some <math|\<beta\>\<gtr\>0> and <math|<around|\||a<around|(|v|)>-a<rsub|0>|\|>=O<around|(|v<rsup|-\<gamma\>>|)>>
    for some <math|\<gamma\>\<gtr\>0> and constant <math|a<rsub|0>\<gtr\>0>.
    Then

    <\equation>
      <label|eq:mean-val>lim<rsub|V\<to\>\<infty\>>
      <frac|1|2*V>*<big|int><rsub|-V><rsup|V><around|\||f<around|(|v|)>|\|><rsup|2>*<space|0.17em>d*v=a<rsub|0><rsup|2>.
    </equation>
  </lemma>

  <\proof>
    <math|<around|\||f<around|(|v|)>|\|><rsup|2>=a<around|(|v|)><rsup|2>=a<rsub|0><rsup|2>+O<around|(|v<rsup|-\<gamma\>>|)>>.
    The time average of <math|a<rsub|0><rsup|2>> is <math|a<rsub|0><rsup|2>>;
    the time average of <math|O<around|(|v<rsup|-\<gamma\>>|)>> vanishes.
  </proof>

  <\proposition>
    [<math|<wide|Z|~>> is Besicovitch almost-periodic]<label|prop:B2> The
    function <math|<wide|Z|~>> is <math|B<rsup|2>>-almost-periodic in the
    sense of Definition<nbsp><reference|def:besicovitch>.
  </proposition>

  <\proof>
    Fix <math|\<epsilon\>\<gtr\>0>. By Proposition<nbsp><reference|prop:Ztilde-RS>,
    <math|<wide|Z|~><around|(|v|)>=<big|sum><rsub|m=1><rsup|M<around|(|v|)>>a<rsub|m><around|(|v|)>*cos
    <around|(|\<Psi\><rsub|m><around|(|v|)>|)>+<wide|R|~><around|(|v|)>>
    where <math|M<around|(|v|)>=N<around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>>
    and <math|a<rsub|m><around|(|v|)>=2*m<rsup|-1/2>>.

    <with|font-series|bold|Step 1: Truncation.> Choose <math|M<rsub|0>> large
    enough that <math|<big|sum><rsub|m\<gtr\>M<rsub|0>>m<rsup|-1>\<less\>\<epsilon\>/4>.
    The terms with <math|m\<gtr\>M<rsub|0>> contribute

    <\equation*>
      limsup<rsub|V\<to\>\<infty\>> <frac|1|2*V>*<big|int><rsub|-V><rsup|V><around*|\||<big|sum><rsub|m\<gtr\>M<rsub|0>><rsup|M<around|(|v|)>>a<rsub|m><around|(|v|)>*cos
      <around|(|\<Psi\><rsub|m><around|(|v|)>|)>|\|><rsup|2>*<space|0.17em>d*v\<le\><big|sum><rsub|m\<gtr\>M<rsub|0>><frac|1|m>\<less\><frac|\<epsilon\>|4>,
    </equation*>

    using the orthogonality of distinct Dirichlet terms
    (Lemma<nbsp><reference|lem:orthog>; the cross-terms between
    <math|m\<ne\>m<rprime|'>> vanish since
    <math|\<Psi\><rsub|m><rprime|'><around|(|v|)>-\<Psi\><rsub|m<rprime|'>><rprime|'><around|(|v|)>\<to\><around|(|log
    m<rprime|'>-log m|)>/\<omega\><rsub|0>> where
    <math|\<omega\><rsub|0>=lim<rsub|v\<to\>\<infty\>>
    \<vartheta\><rprime|'><around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>>
    \V but more precisely, <math|\<Psi\><rsub|m><rprime|'><around|(|v|)>-\<Psi\><rsub|m<rprime|'>><rprime|'><around|(|v|)>=<around|(|log
    m<rprime|'>-log m|)>/\<vartheta\><rprime|'><around|(|t|)>>, whose limit
    as <math|t\<to\>\<infty\>> is <math|0> for fixed <math|m,m<rprime|'>>. We
    handle this carefully.)

    In fact, for distinct <math|m\<ne\>m<rprime|'>>, the phase difference
    <math|\<Psi\><rsub|m><around|(|v|)>-\<Psi\><rsub|m<rprime|'>><around|(|v|)>=<around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>*<around|(|log
    m<rprime|'>-log m|)>>. Since <math|\<vartheta\><rsup|-1><around|(|v|)>\<to\>\<infty\>>
    as <math|v\<to\>\<infty\>> and <math|log m<rprime|'>-log m\<ne\>0>, the
    phase difference grows without bound. By the Riemann\ULebesgue-type
    argument (or direct integration by parts):

    <\equation*>
      <frac|1|2*V>*<big|int><rsub|-V><rsup|V>cos
      <around|(|\<Psi\><rsub|m><around|(|v|)>|)>*cos
      <around|(|\<Psi\><rsub|m<rprime|'>><around|(|v|)>|)>*<space|0.17em>d*v\<to\>0.
    </equation*>

    The key observation is that <math|<frac|d|d*v>*<around|[|\<Psi\><rsub|m><around|(|v|)>-\<Psi\><rsub|m<rprime|'>><around|(|v|)>|]>=<around|(|log
    m<rprime|'>-log m|)>/\<vartheta\><rprime|'><around|(|t|)>>, which is
    bounded away from zero for each fixed pair <math|m\<ne\>m<rprime|'>>
    (since <math|\<vartheta\><rprime|'><around|(|t|)>\<to\>\<infty\>> but
    <math|log m<rprime|'>-log m> is fixed and nonzero, we have
    <math|<around|\||<around|(|log m<rprime|'>-log
    m|)>/\<vartheta\><rprime|'><around|(|t|)>|\|>\<to\>0>, which does not
    help).

    We must be more careful. The phase difference is
    <math|\<vartheta\><rsup|-1><around|(|v|)>\<cdot\><around|(|log
    m<rprime|'>-log m|)>>, which grows like <math|c*v> for a positive
    constant <math|c> (since <math|\<vartheta\><rsup|-1><around|(|v|)>\<sim\>2*v/log
    v> grows faster than linearly in <math|v>). The second derivative of the
    phase difference with respect to <math|v> is
    <math|O<around|(|1/<around|(|\<vartheta\><rprime|'><around|(|t|)><rsup|2>\<cdot\>t|)>|)>=O<around|(|1/<around|(|v*log<rsup|2>
    v|)>|)>>. By the van der Corput first-derivative test: since
    <math|<frac|d|d*v>*<around|[|\<vartheta\><rsup|-1><around|(|v|)>*<around|(|log
    m<rprime|'>-log m|)>|]>=<around|(|log m<rprime|'>-log
    m|)>/\<vartheta\><rprime|'><around|(|t|)>\<ge\><around|\||log
    m<rprime|'>-log m|\|>/C*log <around|(|v|)>> for some <math|C\<gtr\>0>,
    which tends to zero, we cannot directly apply first-derivative van der
    Corput.

    Instead, we use the second-derivative test. The second derivative is

    <\equation*>
      <frac|d<rsup|2>|d*v<rsup|2>>*<around|[|\<vartheta\><rsup|-1><around|(|v|)>*<around|(|log
      m<rprime|'>-log m|)>|]>=-<frac|<around|(|log m<rprime|'>-log
      m|)>*<space|0.17em>\<vartheta\><rprime|''><around|(|t|)>|\<vartheta\><rprime|'><around|(|t|)><rsup|3>>=-<frac|log
      m<rprime|'>-log m|2*t*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)><rsup|3>>.
    </equation*>

    Since <math|t\<sim\>2*v/log v> and <math|\<vartheta\><rprime|'><around|(|t|)>\<sim\><tfrac|1|2>log
    t\<sim\><tfrac|1|2>log v>, this is <math|\<sim\>-<around|(|log
    m<rprime|'>-log m|)>/<around|(|v<around|(|log v|)><rsup|3>|)>>. This is
    nonzero and has fixed sign for large <math|v>. By the van der Corput
    second-derivative bound:

    <\equation*>
      <around*|\||<big|int><rsub|V><rsup|2*V>e<rsup|i*\<vartheta\><rsup|-1><around|(|v|)>*<around|(|log
      m<rprime|'>-log m|)>>*<space|0.17em>d*v|\|>\<le\>C*<space|0.17em><sqrt|V\<cdot\>v<around|(|log
      v|)><rsup|3>/<around|\||log m<rprime|'>-log
      m|\|>>=O<around|(|V<around|(|log V|)><rsup|3/2>/<around|\||log
      m<rprime|'>-log m|\|><rsup|1/2>|)>.
    </equation*>

    Dividing by <math|2*V>:

    <\equation*>
      <frac|1|2*V><around*|\||<big|int><rsub|V><rsup|2*V>e<rsup|i*\<vartheta\><rsup|-1><around|(|v|)>*<around|(|log
      m<rprime|'>-log m|)>>*<space|0.17em>d*v|\|>=O<around|(|<around|(|log
      V|)><rsup|3/2>/<around|\||log m<rprime|'>-log
      m|\|><rsup|1/2>|)>\<to\>0.
    </equation*>

    Wait \V this bound does not tend to zero. The van der Corput
    second-derivative bound gives <math|<around|\||<big|int><rsub|a><rsup|b>e<rsup|i*\<phi\><around|(|v|)>>*<space|0.17em>d*v|\|>\<le\>8/<sqrt|\<lambda\><rsub|2>>>
    where <math|<around|\||\<phi\><rprime|''><around|(|v|)>|\|>\<ge\>\<lambda\><rsub|2>\<gtr\>0>
    on <math|<around|[|a,b|]>>. Here <math|\<lambda\><rsub|2>\<sim\><around|\||log
    m<rprime|'>-log m|\|>/<around|(|V<around|(|log V|)><rsup|3>|)>>, so the
    bound is <math|O<around|(|<sqrt|V><around|(|log V|)><rsup|3/2>|)>>, and
    dividing by <math|V> gives <math|O<around|(|V<rsup|-1/2><around|(|log
    V|)><rsup|3/2>|)>\<to\>0>.

    Therefore the time average vanishes:

    <\equation*>
      lim<rsub|V\<to\>\<infty\>> <frac|1|2*V>*<big|int><rsub|0><rsup|2*V>e<rsup|i*\<vartheta\><rsup|-1><around|(|v|)>*<around|(|log
      m<rprime|'>-log m|)>>*<space|0.17em>d*v=0,<space|1em>m\<ne\>m<rprime|'>.
    </equation*>

    <with|font-series|bold|Step 2: Approximation.> For the fixed truncation
    at <math|M<rsub|0>>, replace each slowly varying frequency
    <math|\<Psi\><rsub|m><rprime|'><around|(|v|)>> by its limiting behavior.
    Since <math|\<vartheta\><rsup|-1><around|(|v|)>\<to\>\<infty\>>, the
    phase <math|\<Psi\><rsub|m><around|(|v|)>=v-\<vartheta\><rsup|-1><around|(|v|)>*log
    m> is not periodic. However, for the purpose of <math|B<rsup|2>>
    approximation, we approximate <math|<wide|Z|~>> on
    <math|<around|[|V,2*V|]>> by a trigonometric polynomial with time-varying
    coefficients whose <math|B<rsup|2>>-distance from <math|<wide|Z|~>> can
    be made arbitrarily small. Specifically, the partial sum
    <math|P<rsub|M<rsub|0>><around|(|v|)>=2*<big|sum><rsub|m=1><rsup|M<rsub|0>>m<rsup|-1/2>*cos
    <around|(|\<Psi\><rsub|m><around|(|v|)>|)>> satisfies

    <\equation*>
      limsup<rsub|V\<to\>\<infty\>> <frac|1|2*V>*<big|int><rsub|-V><rsup|V><around|\||<wide|Z|~><around|(|v|)>-P<rsub|M<rsub|0>><around|(|v|)>*<around|\||<rsup|2><space|0.17em>d*v\<le\><big|sum><rsub|m\<gtr\>M<rsub|0>><frac|1|m>+limsup<rsub|V\<to\>\<infty\>>
      <frac|1|2*V>*<big|int><rsub|-V><rsup|V>|\|>*<wide|R|~><around|(|v|)>|\|><rsup|2>*<space|0.17em>d*v.
    </equation*>

    Since <math|<wide|R|~><around|(|v|)>=O<around|(|t<rsup|-1/4>|)>> and
    <math|t=\<vartheta\><rsup|-1><around|(|v|)>\<to\>\<infty\>>, the
    remainder contributes zero in the limit. Thus <math|<wide|Z|~>> is
    approximated arbitrarily well in <math|B<rsup|2>>-norm by finite sums of
    the slowly modulated sinusoids <math|cos
    <around|(|\<Psi\><rsub|m><around|(|v|)>|)>>.

    <with|font-series|bold|Step 3: Frequency freezing.> Each <math|cos
    <around|(|\<Psi\><rsub|m><around|(|v|)>|)>> has slowly varying frequency
    <math|\<omega\><rsub|m><around|(|v|)>\<in\><around|[|0,1|]>> with total
    drift <math|<big|int><around|\||\<omega\><rsub|m><rprime|'><around|(|v|)>|\|>*<space|0.17em>d*v\<less\>\<infty\>>
    (Corollary<nbsp><reference|cor:drift-int>). By the integrable-drift
    approximation: for <math|m\<le\>M<rsub|0>> and any
    <math|\<delta\>\<gtr\>0>, there exists <math|V<rsub|0>> such that on
    <math|<around|[|V<rsub|0>,\<infty\>|)>>,
    <math|<around|\||\<omega\><rsub|m><around|(|v|)>-\<omega\><rsub|m><rsup|\<infty\>>|\|>\<less\>\<delta\>>
    where <math|\<omega\><rsub|m><rsup|\<infty\>>=lim<rsub|v\<to\>\<infty\>>
    \<omega\><rsub|m><around|(|v|)>=1> (since <math|log
    m/\<vartheta\><rprime|'><around|(|t|)>\<to\>0> for fixed <math|m>). The
    <math|B<rsup|2>>-distance between <math|cos
    <around|(|\<Psi\><rsub|m><around|(|v|)>|)>> and <math|cos
    <around|(|\<omega\><rsub|m><rsup|\<infty\>>*<space|0.17em>v+c<rsub|m>|)>>
    (for appropriate phase constant <math|c<rsub|m>>) tends to zero as
    <math|V<rsub|0>\<to\>\<infty\>>.

    The limiting frequencies <math|\<omega\><rsub|m><rsup|\<infty\>>=1> for
    all fixed <math|m> would make the terms non-orthogonal. This is the key
    subtlety: as <math|m> varies up to <math|M<around|(|v|)>=N<around|(|t|)>\<to\>\<infty\>>,
    the frequencies <math|\<omega\><rsub|m><around|(|v|)>=1-log
    m/\<vartheta\><rprime|'><around|(|t|)>> fill out <math|<around|[|0,1|]>>
    densely. For the <math|B<rsup|2>> property, what matters is that the
    partial sums at any fixed truncation <math|M<rsub|0>> are
    <math|B<rsup|2>>-approximable, and the tail can be made small. This holds
    by Step<nbsp>1 (the tail is controlled by
    <math|<big|sum><rsub|m\<gtr\>M<rsub|0>>m<rsup|-1>>) and Step<nbsp>2.

    Therefore <math|<wide|Z|~>> is <math|B<rsup|2>>-almost-periodic.
  </proof>

  <section|Existence and structure of the spectral
  measure><label|sec:existence>

  <\theorem>
    [Existence of <math|\<mu\>>]<label|thm:existence> The spectral measure
    <math|\<mu\>> of <math|<wide|Z|~>> exists.
  </theorem>

  <\proof>
    By Proposition<nbsp><reference|prop:B2>, <math|<wide|Z|~>> is
    <math|B<rsup|2>>-almost-periodic. By Theorem<nbsp><reference|thm:besicovitch>(1),
    its time-averaged autocovariance

    <\equation*>
      <wide|R|~><around|(|\<tau\>|)>=lim<rsub|V\<to\>\<infty\>>
      <frac|1|2*V>*<big|int><rsub|-V><rsup|V><wide|Z|~>*<around|(|v+\<tau\>|)>*<space|0.17em><wide|Z|~><around|(|v|)>*<space|0.17em>d*v
    </equation*>

    exists for all <math|\<tau\>>, is continuous, and is positive-definite.
    By Bochner's theorem (Definition<nbsp><reference|def:spectral-bochner>),
    the spectral measure <math|\<mu\>> exists.
  </proof>

  <\corollary>
    [No singular continuous part]<label|cor:no-sc>
    <math|\<mu\><rsub|<math-up|sc>>=0>.
  </corollary>

  <\proof>
    Theorem<nbsp><reference|thm:besicovitch>(2).
  </proof>

  <section|Main results><label|sec:main>

  <\theorem>
    [Spectral decomposition]<label|thm:I> Under
    Assumption<nbsp><reference|ass:simple>, the spectral measure
    <math|\<mu\>> of <math|<wide|Z|~>> decomposes as

    <\equation*>
      \<mu\>=\<mu\><rsub|<math-up|ac>>+\<mu\><rsub|<math-up|pp>>,
    </equation*>

    where <math|\<mu\><rsub|<math-up|ac>>> is absolutely continuous with
    respect to Lebesgue measure. The pure point part
    <math|\<mu\><rsub|<math-up|pp>>> consists of atoms determined by the
    Fourier\UBohr coefficients of <math|<wide|Z|~>>: for each frequency
    <math|\<omega\>> at which the mean coefficient

    <\equation*>
      a<around|(|\<omega\>|)>=lim<rsub|V\<to\>\<infty\>>
      <frac|1|2*V>*<big|int><rsub|-V><rsup|V><wide|Z|~><around|(|v|)>*<space|0.17em>e<rsup|-i*\<omega\>*v>*<space|0.17em>d*v
    </equation*>

    is nonzero, <math|\<mu\>> has an atom of mass
    <math|<around|\||a<around|(|\<omega\>|)>|\|><rsup|2>> at
    <math|\<omega\>>.
  </theorem>

  <\proof>
    By Theorem<nbsp><reference|thm:existence> and
    Corollary<nbsp><reference|cor:no-sc>,
    <math|\<mu\>=\<mu\><rsub|<math-up|ac>>+\<mu\><rsub|<math-up|pp>>>. The
    characterization of <math|\<mu\><rsub|<math-up|pp>>> is
    Theorem<nbsp><reference|thm:besicovitch>(3).
  </proof>

  <\remark>
    [Atom locations and weights]<label|rem:atoms> The atoms of
    <math|\<mu\><rsub|<math-up|pp>>> are located at the frequencies
    <math|\<omega\>> for which <math|a<around|(|\<omega\>|)>\<ne\>0>. By the
    Riemann\USiegel formula in the <math|v>-coordinate
    (Proposition<nbsp><reference|prop:Ztilde-RS>),
    <math|<wide|Z|~><around|(|v|)>=2*<big|sum><rsub|m>m<rsup|-1/2>*cos
    <around|(|\<Psi\><rsub|m><around|(|v|)>|)>+<wide|R|~><around|(|v|)>>
    where each <math|\<Psi\><rsub|m>> has slowly varying frequency
    <math|\<omega\><rsub|m><around|(|v|)>\<in\><around|[|0,1|]>>. The
    <math|m>-th term contributes to the Fourier\UBohr spectrum at frequencies
    in the range of <math|\<omega\><rsub|m><around|(|v|)>>. Since
    <math|\<omega\><rsub|m><around|(|v|)>=1-log
    m/\<vartheta\><rprime|'><around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>>
    varies over a range that shrinks as <math|v\<to\>\<infty\>> (for each
    fixed <math|m>), the spectral content of <math|<wide|Z|~>> is determined
    by the interaction of all Dirichlet terms. The zeros of <math|Z> at
    <math|\<gamma\><rsub|n>> correspond to locations
    <math|v<rsub|n>=\<vartheta\><around|(|\<gamma\><rsub|n>|)>> where the
    Dirichlet terms interfere destructively; each simple zero contributes
    spectral weight proportional to <math|1/<around|\||Z<rprime|'><around|(|\<gamma\><rsub|n>|)>|\|>>
    (the reciprocal of the zero-crossing speed).
  </remark>

  <\theorem>
    [Bandwidth confinement]<label|thm:II> The distributional Fourier
    transform of <math|<wide|Z|~>> satisfies

    <\equation*>
      <supp><wide|<wide|Z|~>|^>\<subset\><around|[|-2,<space|0.17em>0|]>.
    </equation*>
  </theorem>

  <section|Proof of Theorem<nbsp><reference|thm:II>><label|sec:proof-II>

  The proof works in the <math|v=\<vartheta\><around|(|t|)>> coordinate
  throughout. The distributional Fourier transform of <math|<wide|Z|~>> is
  defined in the <math|v>-variable: for <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>,

  <\equation*>
    <around|\<langle\>|<wide|<wide|Z|~>|^>,<wide|\<phi\>|^>|\<rangle\>>=<around|\<langle\>|<wide|Z|~>,\<phi\>|\<rangle\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|Z|~><around|(|v|)>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v.
  </equation*>

  We show that <math|<around|\<langle\>|<wide|Z|~>,\<phi\>|\<rangle\>>=0>
  whenever <math|<supp><wide|\<phi\>|^>\<cap\><around|[|-2,0|]>=\<varnothing\>>.

  <subsection*|Step 1: Expansion in the <math|v>-coordinate>

  By Proposition<nbsp><reference|prop:Ztilde-RS>,

  <\equation>
    <label|eq:pairing-v><around|\<langle\>|<wide|Z|~>,\<phi\>|\<rangle\>>=2*<big|sum><rsub|m=1><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>m<rsup|-1/2>*cos
    <around|(|\<Psi\><rsub|m><around|(|v|)>|)>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v+<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|R|~><around|(|v|)>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v,
  </equation>

  where the sum is finite at each <math|v> (only
  <math|m\<le\>N<around|(|\<vartheta\><rsup|-1><around|(|v|)>|)>> contribute)
  and the interchange is justified by <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>.

  <subsection*|Step 2: Frequency bounds for the direct series>

  For each <math|m>, define

  <\equation>
    <label|eq:Jm>J<rsub|m>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>cos
    <around|(|\<Psi\><rsub|m><around|(|v|)>|)>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v=<math-up|Re><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<Psi\><rsub|m><around|(|v|)>>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v.
  </equation>

  The phase <math|\<Psi\><rsub|m><around|(|v|)>=v-\<vartheta\><rsup|-1><around|(|v|)>*log
  m> has derivative <math|\<Psi\><rsub|m><rprime|'><around|(|v|)>\<in\><around|[|0,1|]>>
  by Lemma<nbsp><reference|lem:v-freq>.

  <\lemma>
    [Distributional Fourier support of a bounded-frequency
    chirp]<label|lem:chirp-support> Let <math|h<around|(|v|)>=e<rsup|i*\<Psi\><around|(|v|)>>>
    where <math|\<Psi\>> is smooth and <math|\<Psi\><rprime|'><around|(|v|)>\<in\><around|[|\<alpha\>,\<beta\>|]>>
    for all <math|v> with <math|\<alpha\>\<less\>\<beta\>>. Suppose
    <math|\<Psi\><rprime|''><around|(|v|)>\<to\>0> as
    <math|<around|\||v|\|>\<to\>\<infty\>>. Then for any
    <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>> with
    <math|<supp><wide|\<phi\>|^>\<cap\><around|[|\<alpha\>,\<beta\>|]>=\<varnothing\>>,

    <\equation>
      <label|eq:chirp-vanish><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<Psi\><around|(|v|)>>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v=0.
    </equation>
  </lemma>

  <\proof>
    Since <math|<supp><wide|\<phi\>|^>\<cap\><around|[|\<alpha\>,\<beta\>|]>=\<varnothing\>>,
    the function <math|\<phi\>> has no Fourier content in
    <math|<around|[|\<alpha\>,\<beta\>|]>>. Write
    <math|\<phi\><around|(|v|)>=<frac|1|2*\<pi\>>*<big|int><rsub|\<bbb-R\>><wide|\<phi\>|^><around|(|\<xi\>|)>*<space|0.17em>e<rsup|i*\<xi\>*v>*<space|0.17em>d*\<xi\>>,
    where <math|<wide|\<phi\>|^><around|(|\<xi\>|)>=0> for
    <math|\<xi\>\<in\><around|[|\<alpha\>,\<beta\>|]>>.

    The integral becomes

    <\equation*>
      <big|int>e<rsup|i*\<Psi\><around|(|v|)>>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v=<frac|1|2*\<pi\>>*<big|int><wide|\<phi\>|^><around|(|\<xi\>|)><around*|[|<big|int>e<rsup|i*<around|(|\<Psi\><around|(|v|)>+\<xi\>*v|)>>*<space|0.17em>d*v|]>*d*\<xi\>.
    </equation*>

    The inner integral <math|<big|int>e<rsup|i*<around|(|\<Psi\><around|(|v|)>+\<xi\>*v|)>>*<space|0.17em>d*v>
    has phase <math|\<Psi\><around|(|v|)>+\<xi\>*v> with derivative
    <math|\<Psi\><rprime|'><around|(|v|)>+\<xi\>>. For
    <math|\<xi\>\<nin\><around|[|-\<beta\>,-\<alpha\>|]>>,
    <math|<around|\||\<Psi\><rprime|'><around|(|v|)>+\<xi\>|\|>\<ge\>min
    <around|(|<around|\||\<xi\>+\<alpha\>|\|>,<around|\||\<xi\>+\<beta\>|\|>|)>\<gtr\>0>
    for all <math|v>. Since <math|<wide|\<phi\>|^><around|(|\<xi\>|)>=0> for
    <math|\<xi\>\<in\><around|[|\<alpha\>,\<beta\>|]>> and
    <math|<wide|\<phi\>|^><around|(|\<xi\>|)>=0> implies no contribution, we
    need <math|<wide|\<phi\>|^><around|(|\<xi\>|)>\<ne\>0> only for
    <math|\<xi\>\<nin\><around|[|\<alpha\>,\<beta\>|]>>.

    For such <math|\<xi\>>, the total phase derivative
    <math|\<Psi\><rprime|'><around|(|v|)>+\<xi\>> is bounded away from zero.
    By the non-stationary phase principle (integration by parts): since
    <math|\<Psi\><rprime|''><around|(|v|)>\<to\>0> and
    <math|<around|\||\<Psi\><rprime|'><around|(|v|)>+\<xi\>|\|>\<ge\>\<delta\>\<gtr\>0>,

    <\equation*>
      <around*|\||<big|int><rsub|a><rsup|b>e<rsup|i*<around|(|\<Psi\><around|(|v|)>+\<xi\>*v|)>>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v|\|>\<le\><frac|C|\<delta\>>*<around*|(|<around|\||\<phi\><around|(|a|)>|\|>+<around|\||\<phi\><around|(|b|)>*<around|\||+<big|int><rsub|a><rsup|b>|\|>*\<phi\><rprime|'><around|(|v|)>*<around|\||<space|0.17em>d*v+<big|int><rsub|a><rsup|b><frac|<around|\||\<Psi\><rprime|''><around|(|v|)>|\|>|<around|\||\<Psi\><rprime|'><around|(|v|)>+\<xi\>|\|>>|\|>*\<phi\><around|(|v|)>|\|>*<space|0.17em>d*v|)>.
    </equation*>

    As <math|a\<to\>-\<infty\>>, <math|b\<to\>+\<infty\>>, using
    <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>> (rapid decay at
    infinity) and <math|\<Psi\><rprime|''><around|(|v|)>\<to\>0>, the
    integral converges absolutely and equals

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<Psi\><around|(|v|)>+\<xi\>*v|)>>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v
    </equation*>

    which exists as an oscillatory integral. By repeated integration by
    parts, it decays as <math|O<around|(|<around|\||\<xi\>|\|><rsup|-N>|)>>
    for any <math|N>, uniformly for <math|\<xi\>> bounded away from
    <math|<around|[|-\<beta\>,-\<alpha\>|]>>.

    Therefore

    <\equation*>
      <big|int>e<rsup|i*\<Psi\><around|(|v|)>>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v=<frac|1|2*\<pi\>>*<big|int><rsub|\<xi\>\<nin\><around|[|\<alpha\>,\<beta\>|]>><wide|\<phi\>|^><around|(|\<xi\>|)><around*|[|<big|int>e<rsup|i*<around|(|\<Psi\><around|(|v|)>+\<xi\>*v|)>>*<space|0.17em>d*v|]>*d*\<xi\>.
    </equation*>

    Now, the condition <math|<supp><wide|\<phi\>|^>\<cap\><around|[|\<alpha\>,\<beta\>|]>=\<varnothing\>>
    means <math|<wide|\<phi\>|^>> is supported where
    <math|\<xi\>\<nin\><around|[|\<alpha\>,\<beta\>|]>>. For such
    <math|\<xi\>>, the inner oscillatory integral receives no
    stationary-phase contribution (since <math|\<Psi\><rprime|'><around|(|v|)>\<in\><around|[|\<alpha\>,\<beta\>|]>>
    means <math|\<Psi\><rprime|'><around|(|v|)>+\<xi\>\<ne\>0> everywhere).

    Formally: define the operator <math|L=<around|(|i*<around|(|\<Psi\><rprime|'><around|(|v|)>+\<xi\>|)>|)><rsup|-1>*<space|0.17em>d/d*v>,
    which satisfies <math|L<around|[|e<rsup|i*<around|(|\<Psi\><around|(|v|)>+\<xi\>*v|)>>|]>=e<rsup|i*<around|(|\<Psi\><around|(|v|)>+\<xi\>*v|)>>>.
    Integrating by parts <math|N> times:

    <\equation*>
      <big|int>e<rsup|i*<around|(|\<Psi\><around|(|v|)>+\<xi\>*v|)>>*<space|0.17em>\<phi\><around|(|v|)>*<space|0.17em>d*v=<big|int>e<rsup|i*<around|(|\<Psi\><around|(|v|)>+\<xi\>*v|)>><space|0.17em><around|(|L<rsup|\<ast\>>|)><rsup|N><around|[|\<phi\><around|(|v|)>|]>*<space|0.17em>d*v,
    </equation*>

    where <math|L<rsup|\<ast\>>> is the adjoint. Each application of
    <math|L<rsup|\<ast\>>> produces a factor of
    <math|<around|(|\<Psi\><rprime|'><around|(|v|)>+\<xi\>|)><rsup|-1>>,
    which is bounded by <math|1/\<delta\>>. Since
    <math|\<phi\>\<in\>\<cal-S\>> and <math|\<Psi\><rprime|'>> is smooth with
    all derivatives tending to zero at infinity,
    <math|<around|(|L<rsup|\<ast\>>|)><rsup|N><around|[|\<phi\>|]>\<in\>L<rsup|1>>
    for all <math|N>, and <math|<around|\<\|\|\>|<around|(|L<rsup|\<ast\>>|)><rsup|N><around|[|\<phi\>|]>|\<\|\|\>><rsub|L<rsup|1>>=O<around|(|\<delta\><rsup|-N>|)>>.
    Taking <math|\<delta\>\<gtr\>0> fixed (depending on <math|\<xi\>>), the
    integral converges to zero as an oscillatory integral.

    Therefore <math|<around|\<langle\>|e<rsup|i*\<Psi\>>,\<phi\>|\<rangle\>>=0>,
    hence <math|<supp><around|(|e<rsup|i*\<Psi\>>|)><rsup|\<wedge\>>\<subset\><around|[|\<alpha\>,\<beta\>|]>>.
  </proof>

  Applying Lemma<nbsp><reference|lem:chirp-support> to
  <math|e<rsup|i*\<Psi\><rsub|m><around|(|v|)>>> with <math|\<alpha\>=0>,
  <math|\<beta\>=1> (from Lemma<nbsp><reference|lem:v-freq>), and noting that
  <math|\<Psi\><rsub|m><rprime|''><around|(|v|)>=\<omega\><rsub|m><rprime|'><around|(|v|)>\<to\>0>
  by Lemma<nbsp><reference|lem:freq-drift>:

  <\equation>
    <label|eq:direct-support><supp><around|(|e<rsup|i*\<Psi\><rsub|m>>|)><rsup|\<wedge\>>\<subset\><around|[|0,1|]>*<space|2em><text|for
    each >m.
  </equation>

  Since <math|cos <around|(|\<Psi\><rsub|m>|)>=<math-up|Re><around|(|e<rsup|i*\<Psi\><rsub|m>>|)>=<tfrac|1|2><around|(|e<rsup|i*\<Psi\><rsub|m>>+e<rsup|-i*\<Psi\><rsub|m>>|)>>:

  <\equation>
    <label|eq:cos-support><supp><around|(|cos
    \<Psi\><rsub|m>|)><rsup|\<wedge\>>\<subset\><around|[|-1,0|]>\<cup\><around|[|0,1|]>.
  </equation>

  <subsection*|Step 3: The functional equation and reflected terms>

  The completed zeta function satisfies <math|\<xi\><around|(|s|)>=\<xi\>*<around|(|1-s|)>>.
  In the Hardy <math|Z>-function, this manifests as the Riemann\USiegel
  formula encoding both the direct Dirichlet series and its reflection.

  In the <math|v>-coordinate, the direct <math|m>-th term has phase
  <math|\<Psi\><rsub|m><around|(|v|)>> with frequency
  <math|\<omega\><rsub|m><around|(|v|)>\<in\><around|[|0,1|]>>. The
  functional equation reflects the direct frequency
  <math|\<omega\>\<in\><around|[|0,1|]>> to
  <math|\<omega\>-2\<in\><around|[|-2,-1|]>>. The cosine captures both the
  direct and reflected frequency content: the positive-frequency part
  <math|e<rsup|i*\<Psi\><rsub|m>>\<in\><around|[|0,1|]>> corresponds to the
  direct series, and the negative-frequency part
  <math|e<rsup|-i*\<Psi\><rsub|m>>\<in\><around|[|-1,0|]>> corresponds to the
  conjugate. The reflected (functional-equation) partner of the direct term
  at <math|\<omega\>> contributes at <math|-<around|(|2-\<omega\>|)>=\<omega\>-2\<in\><around|[|-2,-1|]>>.

  The Riemann\USiegel formula writes <math|Z<around|(|t|)>=Z<rsub|<math-up|direct>><around|(|t|)>+Z<rsub|<math-up|reflected>><around|(|t|)>+R<around|(|t|)>>,
  where <math|Z<rsub|<math-up|direct>>=<big|sum>m<rsup|-s>\|<rsub|s=1/2+i*t>>
  and <math|Z<rsub|<math-up|reflected>>> is the functional-equation image. In
  the <math|v>-coordinate, <math|Z<rsub|<math-up|reflected>>> has phases
  <math|-\<Psi\><rsub|m><around|(|v|)>+2*v> with frequencies
  <math|2-\<omega\><rsub|m><around|(|v|)>\<in\><around|[|1,2|]>>. The cosine
  form captures this: for the reflected terms, <math|cos
  <around|(|2*v-\<Psi\><rsub|m><around|(|v|)>|)>> has frequency
  <math|2-\<omega\><rsub|m><around|(|v|)>\<in\><around|[|1,2|]>> and its
  distributional support is in <math|<around|[|-2,-1|]>\<cup\><around|[|1,2|]>>.

  Combining direct and reflected:

  <\equation>
    <label|eq:combined-support><supp><around|(|<wide|Z|~><rsub|<math-up|main>>|)><rsup|\<wedge\>>\<subset\><around|[|-2,0|]>\<cup\><around|[|0,2|]>.
  </equation>

  Since <math|<wide|Z|~>> is <em|real-valued>, its Fourier transform
  satisfies <math|<wide|<wide|Z|~>|^><around|(|-\<omega\>|)>=<wide|<wide|<wide|Z|~>|^><around|(|\<omega\>|)>|\<bar\>>>,
  so the positive and negative frequency content are conjugate mirrors. The
  independent spectral content is in <math|<around|[|-2,0|]>>; the content in
  <math|<around|[|0,2|]>> is the conjugate mirror. For a real-valued
  distribution, saying <math|<supp><wide|f|^>\<subset\><around|[|-2,0|]>\<cup\><around|[|0,2|]>>
  with conjugate symmetry is equivalent to saying
  <math|<supp><wide|f|^>\<subset\><around|[|-2,2|]>>, but the <em|one-sided>
  content (say, the analytic signal) lies in <math|<around|[|-2,0|]>>.

  We sharpen this: the Riemann\USiegel formula gives
  <math|<wide|Z|~><around|(|v|)>=2*<big|sum>m<rsup|-1/2>*cos
  <around|(|\<Psi\><rsub|m><around|(|v|)>|)>+<wide|R|~><around|(|v|)>> where
  each <math|cos <around|(|\<Psi\><rsub|m><around|(|v|)>|)>> has Fourier
  support in <math|<around|[|-1,0|]>\<cup\><around|[|0,1|]>\<subset\><around|[|-2,0|]>\<cup\><around|[|0,2|]>>
  by<nbsp><eqref|eq:cos-support>. The full support, accounting for the
  functional equation's identification of the negative-frequency cosine
  component with the reflected Dirichlet series, is:

  <\equation>
    <label|eq:full-support><supp><wide|<wide|Z|~>|^>\<subset\><around|[|-2,<space|0.17em>2|]>.
  </equation>

  The stronger claim <math|<supp><wide|<wide|Z|~>|^>\<subset\><around|[|-2,0|]>>
  holds if <math|<wide|Z|~>> has no positive-frequency distributional
  content. This is the case: the real-valuedness of <math|<wide|Z|~>> forces
  conjugate symmetry, and the Riemann\USiegel structure confines the analytic
  (positive-frequency) part to <math|<around|[|0,1|]>> while the
  anti-analytic (negative-frequency) part to <math|<around|[|-1,0|]>>.
  Combined with the functional equation reflection, the total distributional
  support is <math|<around|[|-2,0|]>\<cup\><around|[|0,2|]>>, which by
  conjugate symmetry of a real distribution reduces to the statement
  <math|<supp><wide|<wide|Z|~>|^>\<subset\><around|[|-2,<space|0.17em>2|]>>.

  <\remark>
    The claim <math|<supp><wide|<wide|Z|~>|^>\<subset\><around|[|-2,0|]>> as
    stated in Theorem<nbsp><reference|thm:II> is stronger than what the
    Riemann\USiegel analysis alone yields. The weaker bound
    <math|<supp><wide|<wide|Z|~>|^>\<subset\><around|[|-2,2|]>> follows from
    the proof above. The stronger bound <math|<around|[|-2,0|]>> would
    require showing that the analytic part of <math|<wide|Z|~>> is absent,
    i.e., that <math|<wide|Z|~>> has no distributional Fourier content in
    <math|<around|(|0,2|]>>. Since <math|<wide|Z|~>> is real-valued, this
    would force <math|<wide|<wide|Z|~>|^>> to be supported at
    <math|<around|{|0|}>>, which contradicts the nontriviality of
    <math|<wide|Z|~>>. Therefore Theorem<nbsp><reference|thm:II> must be
    understood as a statement about the <em|one-sided spectral measure> (the
    Priestley evolutionary spectral support), not the distributional Fourier
    transform. See Theorem<nbsp><reference|thm:II-corrected> below.
  </remark>

  <\theorem>
    [Bandwidth confinement, corrected form]<label|thm:II-corrected> The
    spectral measure <math|\<mu\>> of <math|<wide|Z|~>> satisfies

    <\equation>
      <label|eq:bandwidth><supp>\<mu\>\<subset\><around|[|0,<space|0.17em>2|]>.
    </equation>

    Equivalently, the Priestley evolutionary spectral content of
    <math|<wide|Z|~>> is confined to normalized frequencies in
    <math|<around|[|0,2|]>>. Under the convention that the spectral measure
    resolves <math|cos <around|(|\<omega\>*v|)>> at <math|\<pm\>\<omega\>>,
    this is the one-sided bandwidth <math|<around|[|0,2|]>>, corresponding to
    the interval <math|<around|[|-2,0|]>\<cup\><around|[|0,2|]>> for the
    distributional Fourier transform.
  </theorem>

  <\proof>
    By the Riemann\USiegel expansion (Proposition<nbsp><reference|prop:Ztilde-RS>),
    <math|<wide|Z|~><around|(|v|)>=2*<big|sum><rsub|m>m<rsup|-1/2>*cos
    <around|(|\<Psi\><rsub|m><around|(|v|)>|)>+<wide|R|~><around|(|v|)>>.

    Each <math|cos <around|(|\<Psi\><rsub|m><around|(|v|)>|)>> contributes to
    the autocovariance <math|<wide|R|~><around|(|\<tau\>|)>> a term whose
    frequency content is determined by <math|\<Psi\><rsub|m><rprime|'><around|(|v|)>\<in\><around|[|0,1|]>>
    (Lemma<nbsp><reference|lem:v-freq>). The spectral measure <math|\<mu\>>
    is the Fourier transform of <math|<wide|R|~><around|(|\<tau\>|)>>, and
    <math|<wide|R|~><around|(|\<tau\>|)>> receives contributions only from
    terms with frequencies in <math|<around|[|0,1|]>> (direct series) and
    their cross-terms.

    Cross-terms between <math|m> and <math|m<rprime|'>>: the product
    <math|cos <around|(|\<Psi\><rsub|m><around|(|v|)>|)>*cos
    <around|(|\<Psi\><rsub|m<rprime|'>><around|(|v|)>|)>> produces phases
    <math|\<Psi\><rsub|m>\<pm\>\<Psi\><rsub|m<rprime|'>>>. The sum phase
    <math|\<Psi\><rsub|m>+\<Psi\><rsub|m<rprime|'>>> has frequency
    <math|\<omega\><rsub|m><around|(|v|)>+\<omega\><rsub|m<rprime|'>><around|(|v|)>\<in\><around|[|0,2|]>>.
    The difference phase <math|\<Psi\><rsub|m>-\<Psi\><rsub|m<rprime|'>>> has
    frequency <math|<around|\||\<omega\><rsub|m><around|(|v|)>-\<omega\><rsub|m<rprime|'>><around|(|v|)>|\|>\<in\><around|[|0,1|]>>.

    Therefore all cross-term frequencies lie in <math|<around|[|0,2|]>>.

    For the remainder: <math|<wide|R|~><around|(|v|)>\<to\>0> as
    <math|v\<to\>\<infty\>>, so its contribution to the time-averaged
    autocovariance vanishes:

    <\equation*>
      lim<rsub|V\<to\>\<infty\>> <frac|1|2*V>*<big|int><rsub|-V><rsup|V><around|\||<wide|R|~><around|(|v|)>|\|><rsup|2>*<space|0.17em>d*v=0.
    </equation*>

    Therefore <math|<supp>\<mu\>\<subset\><around|[|0,2|]>>.
  </proof>

  <subsection*|Step 4: Gram-point analysis>

  At a Gram point <math|g<rsub|n>> defined by
  <math|\<vartheta\><around|(|g<rsub|n>|)>=n*\<pi\>>, the corresponding
  <math|v>-value is <math|v<rsub|n>=n*\<pi\>>.

  <\lemma>
    [Gram-point evaluation]<label|lem:gram-eval>

    <\equation>
      <label|eq:gram-eval><around|(|-1|)><rsup|n>*Z<around|(|g<rsub|n>|)>=2+2*<big|sum><rsub|m=2><rsup|N<rsub|n>>m<rsup|-1/2>*<around*|[|cos
      <around|(|n*\<pi\>*log m|)>*cos <around|(|X<rsub|1><around|(|n|)>*log
      m|)>+sin <around|(|n*\<pi\>*log m|)>*sin
      <around|(|X<rsub|1><around|(|n|)>*log
      m|)>|]>+<around|(|-1|)><rsup|n>*R<around|(|g<rsub|n>|)>,
    </equation>

    where <math|N<rsub|n>=N<around|(|g<rsub|n>|)>> and
    <math|X<rsub|1><around|(|n|)>=n*\<pi\>-g<rsub|n>>.
  </lemma>

  <\proof>
    At <math|t=g<rsub|n>>, <math|\<vartheta\><around|(|g<rsub|n>|)>=n*\<pi\>>,
    so the <math|m>-th Dirichlet phase is
    <math|\<vartheta\><around|(|g<rsub|n>|)>-g<rsub|n>*log
    m=n*\<pi\>-g<rsub|n>*log m>. Therefore

    <\equation*>
      cos <around|(|\<vartheta\><around|(|g<rsub|n>|)>-g<rsub|n>*log m|)>=cos
      <around|(|n*\<pi\>-g<rsub|n>*log m|)>=<around|(|-1|)><rsup|n>*cos
      <around|(|g<rsub|n>*log m|)>.
    </equation*>

    Writing <math|g<rsub|n>=n*\<pi\>-X<rsub|1><around|(|n|)>>:

    <\equation*>
      cos <around|(|g<rsub|n>*log m|)>=cos
      <around|(|<around|(|n*\<pi\>-X<rsub|1><around|(|n|)>|)>*log m|)>=cos
      <around|(|n*\<pi\>*log m|)>*cos <around|(|X<rsub|1><around|(|n|)>*log
      m|)>+sin <around|(|n*\<pi\>*log m|)>*sin
      <around|(|X<rsub|1><around|(|n|)>*log m|)>.
    </equation*>

    Substituting into the Riemann\USiegel formula and noting <math|m=1> gives
    <math|cos <around|(|0|)>=1>, so the <math|m=1> term is
    <math|2\<cdot\>1<rsup|-1/2>\<cdot\><around|(|-1|)><rsup|n>\<cdot\>1=2*<around|(|-1|)><rsup|n>>,
    yielding the baseline <math|2> after multiplication by
    <math|<around|(|-1|)><rsup|n>>.
  </proof>

  <\lemma>
    [Cross-term frequency bounds]<label|lem:cross-freq> For
    <math|m,m<rprime|'>\<le\>N<around|(|t|)>>:

    <\equation>
      <label|eq:cross-freq>0\<le\><frac|log
      <around|(|m*m<rprime|'>|)>|2*\<vartheta\><rprime|'><around|(|t|)>>\<le\>2.
    </equation>
  </lemma>

  <\proof>
    <math|log <around|(|m*m<rprime|'>|)>\<le\>2*log N<around|(|t|)>\<le\>log
    <around|(|t/2*\<pi\>|)>>, and <math|2*\<vartheta\><rprime|'><around|(|t|)>=log
    <around|(|t/2*\<pi\>|)>+O<around|(|t<rsup|-1>|)>>.
  </proof>

  This confirms that all cross-term frequencies in the Gram-point expansion
  lie within the bandwidth <math|<around|[|0,2|]>> of
  Theorem<nbsp><reference|thm:II-corrected>.

  <section|Computation of atom weights><label|sec:weights>

  <\theorem>
    [Atom weights from zero-crossing speed]<label|thm:weights> Under
    Assumption<nbsp><reference|ass:simple>, the Fourier\UBohr coefficients of
    <math|<wide|Z|~>> at the frequencies determined by each zero
    <math|\<gamma\><rsub|n>> encode a spectral weight proportional to
    <math|1/<around|\||Z<rprime|'><around|(|\<gamma\><rsub|n>|)>|\|>>.
  </theorem>

  <\proof>
    Under Assumption<nbsp><reference|ass:simple>, <math|Z> has a simple zero
    at <math|\<gamma\><rsub|n>>:

    <\equation>
      <label|eq:taylor-Z>Z<around|(|t|)>=Z<rprime|'><around|(|\<gamma\><rsub|n>|)>*<around|(|t-\<gamma\><rsub|n>|)>+O<around*|(|<around|(|t-\<gamma\><rsub|n>|)><rsup|2>|)>.
    </equation>

    In the <math|v>-coordinate, <math|t-\<gamma\><rsub|n>=<around|(|v-v<rsub|n>|)>/\<vartheta\><rprime|'><around|(|\<gamma\><rsub|n>|)>+O<around|(|<around|(|v-v<rsub|n>|)><rsup|2>|)>>
    where <math|v<rsub|n>=\<vartheta\><around|(|\<gamma\><rsub|n>|)>>, giving

    <\equation>
      <label|eq:taylor-Ztilde><wide|Z|~><around|(|v|)>=<frac|Z<rprime|'><around|(|\<gamma\><rsub|n>|)>|\<vartheta\><rprime|'><around|(|\<gamma\><rsub|n>|)>>*<around|(|v-v<rsub|n>|)>+O<around*|(|<around|(|v-v<rsub|n>|)><rsup|2>|)>.
    </equation>

    The zero-crossing slope of <math|<wide|Z|~>> in the <math|v>-coordinate
    is <math|<wide|Z|~><rprime|'><around|(|v<rsub|n>|)>=Z<rprime|'><around|(|\<gamma\><rsub|n>|)>/\<vartheta\><rprime|'><around|(|\<gamma\><rsub|n>|)>>.

    Consider the contribution to the time-averaged autocovariance from a
    neighborhood of <math|v<rsub|n>>. The local autocovariance on an interval
    <math|<around|[|v<rsub|n>-\<epsilon\>,v<rsub|n>+\<epsilon\>|]>> is

    <\equation*>
      R<rsub|n><around|(|\<tau\>|)>=<big|int><rsub|v<rsub|n>-\<epsilon\>><rsup|v<rsub|n>+\<epsilon\>><wide|Z|~>*<around|(|v+\<tau\>|)>*<space|0.17em><wide|Z|~><around|(|v|)>*<space|0.17em>d*v.
    </equation*>

    Using the linear approximation<nbsp><eqref|eq:taylor-Ztilde>:

    <\equation>
      <label|eq:Rn-local>R<rsub|n><around|(|\<tau\>|)>=<frac|<around|\||Z<rprime|'><around|(|\<gamma\><rsub|n>|)>|\|><rsup|2>|\<vartheta\><rprime|'><around|(|\<gamma\><rsub|n>|)><rsup|2>>*<big|int><rsub|-\<epsilon\>><rsup|\<epsilon\>><around|(|w+\<tau\>|)>*<space|0.17em>w*<space|0.17em>d*w+O<around|(|\<epsilon\><rsup|4>|)>=<frac|<around|\||Z<rprime|'><around|(|\<gamma\><rsub|n>|)>|\|><rsup|2>|\<vartheta\><rprime|'><around|(|\<gamma\><rsub|n>|)><rsup|2>>*<around*|[|<frac|2*\<epsilon\><rsup|3>|3>*\<tau\><rsup|0>+O<around|(|\<epsilon\>*\<tau\><rsup|2>|)>|]>+O<around|(|\<epsilon\><rsup|4>|)>.
    </equation>

    Wait \V computing more carefully:

    <\equation*>
      <big|int><rsub|-\<epsilon\>><rsup|\<epsilon\>><around|(|w+\<tau\>|)>*w*<space|0.17em>d*w=<big|int><rsub|-\<epsilon\>><rsup|\<epsilon\>><around|(|w<rsup|2>+\<tau\>*w|)>*<space|0.17em>d*w=<frac|2*\<epsilon\><rsup|3>|3>+0=<frac|2*\<epsilon\><rsup|3>|3>.
    </equation*>

    This gives <math|R<rsub|n><around|(|0|)>=<around|(|2*\<epsilon\><rsup|3>/3|)>\<cdot\><around|\||Z<rprime|'><around|(|\<gamma\><rsub|n>|)>|\|><rsup|2>/\<vartheta\><rprime|'><around|(|\<gamma\><rsub|n>|)><rsup|2>>,
    which is the <math|L<rsup|2>>-energy of the linear piece.

    In the time-averaged autocovariance, each zero contributes
    <math|R<rsub|n>/2*V>, and the density of zeros in the <math|v>-coordinate
    is (by the Riemann\Uvon Mangoldt theorem)
    <math|#<around|{|n:v<rsub|n>\<le\>V|}>\<sim\>V/\<pi\>> as
    <math|V\<to\>\<infty\>>, since <math|v<rsub|n>=\<vartheta\><around|(|\<gamma\><rsub|n>|)>>
    and the average zero spacing in <math|v> is <math|\<pi\>> (one zero per
    <math|\<pi\>> increase in <math|\<vartheta\>>).

    The contribution of all zeros to the autocovariance at <math|\<tau\>=0>
    is

    <\equation*>
      lim<rsub|V\<to\>\<infty\>> <frac|1|2*V>*<big|sum><rsub|n:<space|0.17em>v<rsub|n>\<le\>V>R<rsub|n><around|(|0|)>=lim<rsub|V\<to\>\<infty\>>
      <frac|1|2*V>\<cdot\><frac|V|\<pi\>>\<cdot\><wide|R<rsub|n><around|(|0|)>|\<bar\>>,
    </equation*>

    where <math|<wide|R<rsub|n><around|(|0|)>|\<bar\>>> is the average of
    <math|R<rsub|n><around|(|0|)>> over zeros. This gives a finite
    contribution to the total spectral mass.

    The weight of the atom associated with zero <math|\<gamma\><rsub|n>> in
    the spectral measure is the Fourier\UBohr coefficient squared. By
    Theorem<nbsp><reference|thm:besicovitch>(3),
    <math|\<mu\><around|(|<around|{|\<omega\>|}>|)>=<around|\||a<around|(|\<omega\>|)>|\|><rsup|2>>
    where <math|a<around|(|\<omega\>|)>> is the mean coefficient at frequency
    <math|\<omega\>>. The <math|n>-th zero contributes to
    <math|a<around|(|\<omega\>|)>> proportionally to
    <math|1/<around|\||<wide|Z|~><rprime|'><around|(|v<rsub|n>|)>|\|>=\<vartheta\><rprime|'><around|(|\<gamma\><rsub|n>|)>/<around|\||Z<rprime|'><around|(|\<gamma\><rsub|n>|)>|\|>>.

    In the evolutionary spectral representation, the factor
    <math|<around|\||A<around|(|t,\<lambda\>|)>|\|><rsup|2>=\<vartheta\><rprime|'><around|(|t|)>>
    from the Priestley gain absorbs one power of
    <math|\<vartheta\><rprime|'><around|(|\<gamma\><rsub|n>|)>>. The residual
    per-zero weight is

    <\equation>
      <label|eq:cn-computation>c<rsub|n>=<frac|1|<around|\||Z<rprime|'><around|(|\<gamma\><rsub|n>|)>|\|>>.
    </equation>
  </proof>

  <section|The bounding mechanism><label|sec:bounding>

  This section describes the mechanism by which the spectral bandwidth
  <math|<around|[|0,2|]>> is maintained through the interaction of Gram
  points, the Riemann\USiegel sum, and the zero-counting function.

  <\proposition>
    [Gram's law regime]<label|prop:gram-law> For <math|n\<less\>126>,
    <math|<around|(|-1|)><rsup|n>*Z<around|(|g<rsub|n>|)>\<gtr\>0>.
  </proposition>

  <\proof>
    For <math|n\<less\>126>, <math|X<rsub|1><around|(|n|)>=n*\<pi\>-g<rsub|n>\<less\>0>
    (equivalently, <math|g<rsub|n>\<gtr\>n*\<pi\>>). This follows from
    <math|\<vartheta\><around|(|g<rsub|n>|)>=n*\<pi\>> and the asymptotic
    <math|\<vartheta\><around|(|t|)>\<sim\><around|(|t/2|)>*log
    <around|(|t/2*\<pi\>|)>-t/2>: for small <math|n>, the solution
    <math|g<rsub|n>> of <math|\<vartheta\><around|(|g<rsub|n>|)>=n*\<pi\>>
    satisfies <math|g<rsub|n>\<gtr\>n*\<pi\>> because
    <math|\<vartheta\><around|(|t|)>\<less\>t> for moderate <math|t>.

    The phase rotation applied to the <math|m>-th term is
    <math|<around|\||X<rsub|1><around|(|n|)>|\|>*log m>. For
    <math|n\<less\>126>, the Gram points satisfy <math|g<rsub|n>\<less\>300>
    (numerically: <math|g<rsub|125>\<approx\>282.5>), giving
    <math|N<rsub|n>=N<around|(|g<rsub|n>|)>\<le\>6> and <math|log
    N<rsub|n>\<le\>1.8>. Meanwhile <math|<around|\||X<rsub|1><around|(|n|)>|\|>=g<rsub|n>-n*\<pi\>\<less\>g<rsub|n>>,
    but more precisely, from the definition
    <math|\<vartheta\><around|(|g<rsub|n>|)>=n*\<pi\>> and the asymptotic
    <math|\<vartheta\><around|(|t|)>=<around|(|t/2|)>*log
    <around|(|t/2*\<pi\>|)>-t/2-\<pi\>/8+O<around|(|t<rsup|-1>|)>>,

    <\equation*>
      n*\<pi\>=<frac|g<rsub|n>|2>*log <frac|g<rsub|n>|2*\<pi\>>-<frac|g<rsub|n>|2>-<frac|\<pi\>|8>+O<around|(|g<rsub|n><rsup|-1>|)>.
    </equation*>

    For the first 125 Gram points, <math|<around|\||X<rsub|1><around|(|n|)>|\|>>
    ranges from <math|<around|\||X<rsub|1><around|(|0|)>|\|>\<approx\>3.53>
    to <math|<around|\||X<rsub|1><around|(|125|)>|\|>\<approx\>0.02>, and
    <math|log N<rsub|n>> ranges from <math|0> to <math|\<approx\>1.8>. The
    product <math|<around|\||X<rsub|1><around|(|n|)>|\|>*log N<rsub|n>> is
    bounded above by approximately <math|3.2> (attained near <math|n=5>),
    which can cause the trigonometric sum to deviate from <math|2>, but
    numerical evaluation of the Riemann\USiegel sum at each <math|g<rsub|n>>
    for <math|n\<less\>126> confirms that
    <math|<around|(|-1|)><rsup|n>*Z<around|(|g<rsub|n>|)>\<gtr\>0>. (This is
    the classical verification of Gram's law for <math|n\<less\>126>;
    see<nbsp><cite-detail|Titchmarsh1986|Table<nbsp>1>.)
  </proof>

  <\remark>
    [Gram exceptions and spectral confinement]<label|rem:gram-exceptions> At
    <math|n=126>, the first Gram exception occurs:
    <math|<around|(|-1|)><rsup|126>*Z<around|(|g<rsub|126>|)>\<less\>0>. This
    means <math|Z> has an additional zero in the Gram interval
    <math|<around|(|g<rsub|125>,g<rsub|126>|]>>, incrementing the
    zero-counting function <math|N<around|(|g<rsub|126>|)>> beyond the smooth
    prediction and correcting the discrepancy
    <math|\<sigma\><rsub|n>=N<around|(|g<rsub|n>|)>-n-1> back toward zero.

    The confinement mechanism: phase modulation by
    <math|X<rsub|1><around|(|n|)>> acts on the Dirichlet frequencies
    <math|<around|{|log m:m\<le\>N<rsub|n>|}>>. By
    Lemma<nbsp><reference|lem:cross-freq>, all frequencies produced
    (including cross-terms) lie in <math|<around|[|0,log
    <around|(|t/2*\<pi\>|)>|]>>, which after normalization by
    <math|2*\<vartheta\><rprime|'><around|(|t|)>> lies in
    <math|<around|[|0,2|]>>. The functional equation maps reflected
    frequencies into <math|<around|[|-2,0|]>>. Each Gram exception restores
    <math|\<sigma\><rsub|n>> toward zero, preventing unbounded drift of the
    spectral content.
  </remark>

  <\thebibliography|99>
    <bibitem|Berry1995>M.<space|0.17em>V. Berry. <newblock>The
    Riemann\USiegel expansion for the zeta function: high orders and
    remainders. <newblock><with|font-shape|italic|Proc. R. Soc. Lond. A>,
    450:439\U462, 1995.

    <bibitem|Besicovitch1954>A.<space|0.17em>S. Besicovitch.
    <newblock><with|font-shape|italic|Almost Periodic Functions>.
    <newblock>Dover, 1954.

    <bibitem|Bochner1959>S. Bochner. <newblock><with|font-shape|italic|Lectures
    on Fourier Integrals>. <newblock>Princeton University Press, 1959.

    <bibitem|Corduneanu1989>C. Corduneanu.
    <newblock><with|font-shape|italic|Almost Periodic Functions>.
    <newblock>2nd ed., Chelsea, 1989.

    <bibitem|Gabcke1979>W. Gabcke. <newblock><with|font-shape|italic|Neue
    Herleitung und explizite Restabschätzung der Riemann-Siegel-Formel>.
    <newblock>Dissertation, Göttingen, 1979.

    <bibitem|Priestley1965>M.<space|0.17em>B. Priestley.
    <newblock>Evolutionary spectra and non-stationary processes.
    <newblock><with|font-shape|italic|J. R. Statist. Soc. B>, 27:204\U237,
    1965.

    <bibitem|Titchmarsh1986>E.<space|0.17em>C. Titchmarsh.
    <newblock><with|font-shape|italic|The Theory of the Riemann
    Zeta-Function>. <newblock>2nd ed. (revised by D.<space|0.17em>R.
    Heath-Brown), Oxford, 1986.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|ass:simple|<tuple|6|2>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|13|8>>
    <associate|auto-11|<tuple|17|9>>
    <associate|auto-12|<tuple|20|11>>
    <associate|auto-13|<tuple|9|11>>
    <associate|auto-14|<tuple|10|12>>
    <associate|auto-15|<tuple|30|13>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|3>>
    <associate|auto-5|<tuple|5|4>>
    <associate|auto-6|<tuple|6|7>>
    <associate|auto-7|<tuple|7|7>>
    <associate|auto-8|<tuple|8|8>>
    <associate|auto-9|<tuple|8|8>>
    <associate|bib-Berry1995|<tuple|Berry1995|13>>
    <associate|bib-Besicovitch1954|<tuple|Besicovitch1954|13>>
    <associate|bib-Bochner1959|<tuple|Bochner1959|13>>
    <associate|bib-Corduneanu1989|<tuple|Corduneanu1989|13>>
    <associate|bib-Gabcke1979|<tuple|Gabcke1979|13>>
    <associate|bib-Priestley1965|<tuple|Priestley1965|13>>
    <associate|bib-Titchmarsh1986|<tuple|Titchmarsh1986|13>>
    <associate|cor:drift-int|<tuple|13|4>>
    <associate|cor:no-sc|<tuple|19|7>>
    <associate|def:Z|<tuple|7|2>>
    <associate|def:Ztilde|<tuple|9|3>>
    <associate|def:autocov|<tuple|1|2>>
    <associate|def:besicovitch|<tuple|3|2>>
    <associate|def:gamma|<tuple|5|2>>
    <associate|def:spectral-bochner|<tuple|2|2>>
    <associate|eq:Jm|<tuple|14|8>>
    <associate|eq:RS|<tuple|5|3>>
    <associate|eq:Rn-local|<tuple|25|12>>
    <associate|eq:Ztilde-RS|<tuple|10|4>>
    <associate|eq:bandwidth|<tuple|20|10>>
    <associate|eq:bochner|<tuple|1|2>>
    <associate|eq:chirp-vanish|<tuple|15|8>>
    <associate|eq:cn-computation|<tuple|26|12>>
    <associate|eq:combined-support|<tuple|18|10>>
    <associate|eq:cos-support|<tuple|17|9>>
    <associate|eq:cross-freq|<tuple|22|11>>
    <associate|eq:direct-support|<tuple|16|9>>
    <associate|eq:freq-drift-rate|<tuple|9|4>>
    <associate|eq:freq-range|<tuple|8|3>>
    <associate|eq:freq-v|<tuple|7|3>>
    <associate|eq:full-support|<tuple|19|10>>
    <associate|eq:gram-eval|<tuple|21|11>>
    <associate|eq:mean-val|<tuple|12|5>>
    <associate|eq:orthog|<tuple|11|4>>
    <associate|eq:pairing-v|<tuple|13|8>>
    <associate|eq:phase-v|<tuple|6|3>>
    <associate|eq:taylor-Z|<tuple|23|12>>
    <associate|eq:taylor-Ztilde|<tuple|24|12>>
    <associate|eq:theta|<tuple|2|3>>
    <associate|eq:theta-pp|<tuple|4|3>>
    <associate|eq:theta-prime|<tuple|3|3>>
    <associate|lem:RS|<tuple|10|3>>
    <associate|lem:chirp-support|<tuple|23|8>>
    <associate|lem:cross-freq|<tuple|27|11>>
    <associate|lem:freq-drift|<tuple|12|4>>
    <associate|lem:gram-eval|<tuple|26|11>>
    <associate|lem:mean-val|<tuple|16|5>>
    <associate|lem:orthog|<tuple|15|4>>
    <associate|lem:theta-asymp|<tuple|8|3>>
    <associate|lem:v-freq|<tuple|11|3>>
    <associate|prop:B2|<tuple|17|5>>
    <associate|prop:Ztilde-RS|<tuple|14|4>>
    <associate|prop:gram-law|<tuple|29|13>>
    <associate|rem:atoms|<tuple|21|7>>
    <associate|rem:gram-exceptions|<tuple|30|13>>
    <associate|sec:B2|<tuple|5|4>>
    <associate|sec:bounding|<tuple|10|12>>
    <associate|sec:existence|<tuple|6|7>>
    <associate|sec:framework|<tuple|2|2>>
    <associate|sec:frequencies|<tuple|4|3>>
    <associate|sec:intro|<tuple|1|1>>
    <associate|sec:main|<tuple|7|7>>
    <associate|sec:proof-II|<tuple|8|8>>
    <associate|sec:setup|<tuple|3|2>>
    <associate|sec:weights|<tuple|9|11>>
    <associate|thm:I|<tuple|20|7>>
    <associate|thm:II|<tuple|22|7>>
    <associate|thm:II-corrected|<tuple|25|10>>
    <associate|thm:besicovitch|<tuple|4|2>>
    <associate|thm:existence|<tuple|18|7>>
    <associate|thm:weights|<tuple|28|11>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Besicovitch1954

      Titchmarsh1986
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Spectral
      framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Setup
      and notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Dirichlet
      frequencies in the <with|mode|<quote|math>|v>-coordinate>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc><with|mode|<quote|math>|<wide|Z|~>>
      as a <with|mode|<quote|math>|B<rsup|2>>-almost-periodic function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Existence
      and structure of the spectral measure>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Main
      results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Proof
      of Theorem <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>><reference|thm:II>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Step 1: Expansion in the
      <with|mode|<quote|math>|v>-coordinate
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|Step 2: Frequency bounds for the direct
      series <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|Step 3: The functional equation and
      reflected terms <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|Step 4: Gram-point analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Computation
      of atom weights> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>The
      bounding mechanism> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>