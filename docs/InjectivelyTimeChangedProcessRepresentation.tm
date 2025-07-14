<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Injectively Time-Changed Stationary
  Processes:<next-line>A Spectral Analysis>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Gain
    Function Decomposition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Fundamental
    Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Time-Warping
    Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Inversion
    Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Band-Limited
    Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Reconstruction
    and Synthesis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  We develop the theory of injectively time-changed stationary processes,
  which arise from spectral representations of the form

  <\equation>
    X<around|(|t|)>=<big|int><rsub|-1><rsup|1>f<around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<lambda\>
  </equation>

  where <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> is strictly increasing and
  <math|f\<in\>L<rsup|2><around|(|<around|[|-1,1|]>|)>>.

  <\definition>
    An <em|injectively time-changed stationary process> is a stochastic
    process <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>>
    admitting the spectral representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> is strictly increasing,
    <math|\<theta\>\<in\>C<rsup|1><around|(|\<bbb-R\>|)>>, and
    <math|<around|{|Z<around|(|\<lambda\>|)>|}><rsub|\<lambda\>\<in\><around|[|-1,1|]>>>
    is an orthogonal increment process with
    <math|E<around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=F*<around|(|d*\<lambda\>|)>>
    for some finite measure <math|F> on <math|<around|[|-1,1|]>>.
  </definition>

  <section|Gain Function Decomposition>

  <\proposition>
    [Evolutionary Spectral Representation] The process <math|X<around|(|t|)>>
    can be written in evolutionary form as

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-1><rsup|1>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where the gain function is

    <\equation>
      A<around|(|t,\<lambda\>|)>=e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>
  </proposition>

  <\proof>
    Direct substitution gives

    <\align>
      <tformat|<table|<row|<cell|A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>|<cell|=e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<lambda\>*t><eq-number>>>|<row|<cell|>|<cell|=e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t+t|)>><eq-number>>>|<row|<cell|>|<cell|=e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>><eq-number>>>>>
    </align>
  </proof>

  <section|Fundamental Properties>

  <\theorem>
    [Spectral Representation] Let <math|X<around|(|t|)>> be an injectively
    time-changed stationary process. Then:

    <\enumerate>
      <item><math|X<around|(|t|)>> is well-defined for all
      <math|t\<in\>\<bbb-R\>>

      <item><math|E<around|[|<around|\||X<around|(|t|)>|\|><rsup|2>|]>=<big|int><rsub|-1><rsup|1>F*<around|(|d*\<lambda\>|)>\<less\>\<infty\>>

      <item>The covariance function satisfies

      <\equation>
        <text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*F*<around|(|d*\<lambda\>|)>
      </equation>
    </enumerate>
  </theorem>

  <\proof>
    (1) Since <math|\<theta\>> is strictly increasing and continuous,
    <math|\<theta\><around|(|t|)>> is well-defined for all <math|t>. The
    integral converges by the Cauchy-Schwarz inequality.

    (2) By orthogonality:

    <\align>
      <tformat|<table|<row|<cell|E<around|[|<around|\||X<around|(|t|)>|\|><rsup|2>|]>>|<cell|=E<around*|[|<around*|\||<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>F*<around|(|d*\<lambda\>|)>\<less\>\<infty\><eq-number>>>>>
    </align>

    (3) By orthogonality of increments:

    <\align>
      <tformat|<table|<row|<cell|<text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>>|<cell|=E<around*|[|<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*\<theta\><around|(|s|)>>*d*Z<around|(|\<lambda\>|)>\<cdot\><wide|<big|int><rsub|-1><rsup|1>e<rsup|i*\<mu\>*\<theta\><around|(|t|)>>*d*Z<around|(|\<mu\>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*F*<around|(|d*\<lambda\>|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Non-Stationarity Characterization] An injectively time-changed
    stationary process <math|X<around|(|t|)>> is stationary if and only if
    <math|\<theta\><around|(|t|)>=t+c> for some constant
    <math|c\<in\>\<bbb-R\>>.
  </theorem>

  <\proof>
    (<math|\<Leftarrow\>>) If <math|\<theta\><around|(|t|)>=t+c>, then

    <\equation>
      <text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*<around|(|s+c-t-c|)>>*F*<around|(|d*\<lambda\>|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*<around|(|s-t|)>>*F*<around|(|d*\<lambda\>|)>
    </equation>

    which depends only on <math|s-t>, so <math|X<around|(|t|)>> is
    stationary.

    (<math|\<Rightarrow\>>) Suppose <math|X<around|(|t|)>> is stationary.
    Then Cov<math|<around|(|X<around|(|s|)>,X<around|(|t|)>|)>> depends only
    on <math|t-s>. This requires <math|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>=g*<around|(|t-s|)>>
    for some function <math|g>. Differentiating with respect to <math|t>:
    <math|\<theta\><rprime|'><around|(|t|)>=g<rprime|'>*<around|(|t-s|)>>.
    Since the left side depends only on <math|t>,
    <math|\<theta\><rprime|'><around|(|t|)>> must be constant, so
    <math|\<theta\><around|(|t|)>=a*t+b>. For stationarity, we need
    <math|a=1>.
  </proof>

  <section|Time-Warping Analysis>

  <\definition>
    The <em|instantaneous frequency modulation> at time <math|t> and
    frequency <math|\<lambda\>> is

    <\equation>
      \<omega\><around|(|t,\<lambda\>|)>=\<lambda\>*\<theta\><rprime|'><around|(|t|)>
    </equation>
  </definition>

  <\proposition>
    [Frequency Modulation Properties] Let <math|X<around|(|t|)>> be an
    injectively time-changed stationary process. Then:

    <\enumerate>
      <item>The phase function is <math|\<Phi\><around|(|t,\<lambda\>|)>=\<lambda\>*\<theta\><around|(|t|)>>

      <item>The instantaneous frequency is
      <math|<frac|\<partial\>*\<Phi\>|\<partial\>*t>=\<lambda\>*\<theta\><rprime|'><around|(|t|)>>

      <item>When <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>1>,
      frequencies are compressed; when <math|\<theta\><rprime|'><around|(|t|)>\<less\>1>,
      frequencies are stretched
    </enumerate>
  </proposition>

  <\proof>
    (1) and (2) are immediate from the definition. For (3), the rate of phase
    evolution <math|\<lambda\>*\<theta\><rprime|'><around|(|t|)>> compared to
    the baseline rate <math|\<lambda\>> determines frequency scaling.
  </proof>

  <section|Inversion Theory>

  <\theorem>
    [Warping Inversion] Let <math|X<around|(|t|)>> be an injectively
    time-changed stationary process with <math|\<theta\>> strictly
    increasing. Define the inverse process

    <\equation>
      Y<around|(|s|)>=X<around|(|\<theta\><rsup|-1><around|(|s|)>|)>
    </equation>

    Then <math|Y<around|(|s|)>> has the spectral representation

    <\equation>
      Y<around|(|s|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*s>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    and is stationary.
  </theorem>

  <\proof>
    Since <math|\<theta\>> is strictly increasing, <math|\<theta\><rsup|-1>>
    exists. Substituting <math|t=\<theta\><rsup|-1><around|(|s|)>>:

    <\align>
      <tformat|<table|<row|<cell|Y<around|(|s|)>>|<cell|=X<around|(|\<theta\><rsup|-1><around|(|s|)>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>*d*Z<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*s>*d*Z<around|(|\<lambda\>|)><eq-number>>>>>
    </align>

    This is the standard stationary representation with covariance

    <\equation>
      <text|Cov><around|(|Y<around|(|s<rsub|1>|)>,Y<around|(|s<rsub|2>|)>|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*<around|(|s<rsub|1>-s<rsub|2>|)>>*F*<around|(|d*\<lambda\>|)>
    </equation>

    depending only on <math|s<rsub|1>-s<rsub|2>>.
  </proof>

  <section|Band-Limited Structure>

  <\theorem>
    [Oscillatory Character] An injectively time-changed stationary process
    <math|X<around|(|t|)>> with spectral support in <math|<around|[|-1,1|]>>
    exhibits oscillatory behavior with time-varying instantaneous frequency

    <\equation>
      \<omega\><rsub|inst><around|(|t|)>=<big|int><rsub|-1><rsup|1>\<lambda\>*\<theta\><rprime|'><around|(|t|)><frac|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|<big|int><rsub|-1><rsup|1><around|\||d*Z<around|(|\<mu\>|)>|\|><rsup|2>>
    </equation>
  </theorem>

  <\proof>
    The instantaneous frequency is the weighted average of component
    frequencies <math|\<lambda\>*\<theta\><rprime|'><around|(|t|)>>, weighted
    by spectral power <math|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>>.
  </proof>

  <\corollary>
    [Priestley Oscillatory Process] When the spectral measure <math|F> is
    concentrated away from <math|\<lambda\>=0> and
    <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0>, the process
    <math|X<around|(|t|)>> is oscillatory in Priestley's sense with
    time-varying carrier frequency.
  </corollary>

  <section|Reconstruction and Synthesis>

  <\theorem>
    [Spectral Synthesis] Given a strictly increasing warping function
    <math|\<theta\><around|(|t|)>> and spectral density
    <math|f<around|(|\<lambda\>|)>> supported on <math|<around|[|-1,1|]>>,
    the process

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-1><rsup|1>f<around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*\<lambda\>
    </equation>

    uniquely determines an injectively time-changed stationary process.
  </theorem>

  <\proof>
    The integral converges since <math|f\<in\>L<rsup|2><around|(|<around|[|-1,1|]>|)>>
    and <math|<around|\||e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|\|>=1>.
    The covariance structure follows from Theorem 1, and injectivity of
    <math|\<theta\>> ensures the process is well-defined and non-degenerate.
  </proof>

  <section|Conclusion>

  Injectively time-changed stationary processes provide a natural framework
  for analyzing non-stationary oscillatory phenomena while preserving
  spectral interpretability. The warping function
  <math|\<theta\><around|(|t|)>> serves as the fundamental mechanism for
  temporal modulation, with the gain function
  <math|A<around|(|t,\<lambda\>|)>=e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>>
  encoding the deviation from stationary evolution.
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
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|3>>
    <associate|auto-5|<tuple|5|4>>
    <associate|auto-6|<tuple|6|4>>
    <associate|auto-7|<tuple|7|5>>
    <associate|auto-8|<tuple|8|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Gain
      Function Decomposition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Fundamental
      Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Time-Warping
      Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Inversion
      Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Band-Limited
      Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Reconstruction
      and Synthesis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>