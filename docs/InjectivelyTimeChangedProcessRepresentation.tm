<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Injectively Time-Changed Stationary
  Processes:<next-line>A Spectral Analysis>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Gain
    Function Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Fundamental
    Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Warping
    Function Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Inversion
    Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Band-Limited
    Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Asymptotic
    Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  This analysis concerns injectively time-changed stationary processes, which
  arise from spectral representations involving a warping function
  <math|\<theta\><around|(|t|)>> applied to the oscillatory kernel.

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

  <section|Gain Function Representation>

  <\proposition>
    [Evolutionary Spectral Form] The process <math|X<around|(|t|)>> admits
    the evolutionary spectral representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-1><rsup|1>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where the gain function is

    <\equation>
      A<around|(|t,\<lambda\>|)>=e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>
  </proposition>

  <\proof>
    Direct substitution yields:

    <\align>
      <tformat|<table|<row|<cell|X<around|(|t|)>>|<cell|=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number>>>>>
    </align>
  </proof>

  <section|Fundamental Properties>

  <\theorem>
    [Spectral Characteristics] Let <math|X<around|(|t|)>> be an injectively
    time-changed stationary process. Then:

    <\enumerate>
      <item><math|X<around|(|t|)>> is well-defined for all
      <math|t\<in\>\<bbb-R\>>

      <item><math|E<around|[|<around|\||X<around|(|t|)>|\|><rsup|2>|]>=<big|int><rsub|-1><rsup|1>F*<around|(|d*\<lambda\>|)>\<less\>\<infty\>>

      <item>The covariance function satisfies

      <\equation>
        <text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*F*<around|(|d*\<lambda\>|)>
      </equation>
    </enumerate>
  </theorem>

  <\proof>
    (1) Since <math|\<theta\>> is strictly increasing and continuous,
    <math|\<theta\><around|(|t|)>> is well-defined for all <math|t>. The
    stochastic integral converges in <math|L<rsup|2>> by the isometry
    property:

    <\align>
      <tformat|<table|<row|<cell|E<around|[|<around|\||X<around|(|t|)>|\|><rsup|2>|]>>|<cell|=E<around*|[|<around*|\||<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1><around|\||e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|\|><rsup|2>*F*<around|(|d*\<lambda\>|)>=<big|int><rsub|-1><rsup|1>F*<around|(|d*\<lambda\>|)>\<less\>\<infty\><eq-number>>>>>
    </align>

    (2) Follows immediately from (1).

    (3) By orthogonality of the random measure increments:

    <\align>
      <tformat|<table|<row|<cell|<text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>>|<cell|=E<around*|[|<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*\<theta\><around|(|s|)>>*d*Z<around|(|\<lambda\>|)>\<cdot\><wide|<big|int><rsub|-1><rsup|1>e<rsup|i*\<mu\>*\<theta\><around|(|t|)>>*d*Z<around|(|\<mu\>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*\<theta\><around|(|s|)>><wide|e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|\<bar\>>F*<around|(|d*\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*F*<around|(|d*\<lambda\>|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Non-Stationarity Condition] An injectively time-changed stationary
    process <math|X<around|(|t|)>> is stationary if and only if
    <math|\<theta\><around|(|t|)>=t+c> for some constant
    <math|c\<in\>\<bbb-R\>>.
  </theorem>

  <\proof>
    (<math|\<Leftarrow\>>) If <math|\<theta\><around|(|t|)>=t+c>, then

    <\equation>
      <text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*c>*e<rsup|-i*\<lambda\>*c>*F*<around|(|d*\<lambda\>|)>=<big|int><rsub|-1><rsup|1>F*<around|(|d*\<lambda\>|)>
    </equation>

    which is independent of <math|s> and <math|t>, establishing stationarity.

    (<math|\<Rightarrow\>>) Suppose <math|X<around|(|t|)>> is stationary.
    Then Cov<math|<around|(|X<around|(|s|)>,X<around|(|t|)>|)>> depends only
    on <math|t-s>. From the covariance formula, this requires

    <\equation>
      \<theta\><around|(|s|)>-\<theta\><around|(|t|)>=g*<around|(|s-t|)>
    </equation>

    for some function <math|g>. Differentiating with respect to <math|s>:

    <\equation>
      \<theta\><rprime|'><around|(|s|)>=g<rprime|'>*<around|(|s-t|)>
    </equation>

    Since the left side depends only on <math|s> and the right side on
    <math|s-t>, both must be constant. Thus
    <math|\<theta\><rprime|'><around|(|t|)>=k> for some constant <math|k>,
    implying <math|\<theta\><around|(|t|)>=k*t+c>. For the covariance to
    depend only on the difference <math|s-t>, one requires <math|k=1>,
    yielding <math|\<theta\><around|(|t|)>=t+c>.
  </proof>

  <section|Warping Function Analysis>

  <\definition>
    The <em|warping deviation function> is
    <math|\<Delta\><around|(|t|)>\<assign\>\<theta\><around|(|t|)>-t>.
  </definition>

  <\proposition>
    [Deviation Dynamics] Let <math|\<Delta\><around|(|t|)>=\<theta\><around|(|t|)>-t>
    where <math|\<theta\>> is strictly increasing. Then:

    <\enumerate>
      <item><math|\<Delta\><rprime|'><around|(|t|)>=\<theta\><rprime|'><around|(|t|)>-1>

      <item>The gain function becomes <math|A<around|(|t,\<lambda\>|)>=e<rsup|i*\<lambda\>*\<Delta\><around|(|t|)>>>

      <item>The instantaneous frequency modulation is
      <math|\<lambda\>*\<Delta\><rprime|'><around|(|t|)>>
    </enumerate>
  </proposition>

  <\proof>
    (1) and (2) are immediate. For (3), the phase of the spectral component
    at frequency <math|\<lambda\>> is <math|\<lambda\>*\<theta\><around|(|t|)>>.
    The instantaneous frequency is

    <\equation>
      <frac|d|d*t>*<around|[|\<lambda\>*\<theta\><around|(|t|)>|]>=\<lambda\>*\<theta\><rprime|'><around|(|t|)>=\<lambda\>*<around|(|1+\<Delta\><rprime|'><around|(|t|)>|)>=\<lambda\>+\<lambda\>*\<Delta\><rprime|'><around|(|t|)>
    </equation>

    The modulation relative to the base frequency <math|\<lambda\>> is
    <math|\<lambda\>*\<Delta\><rprime|'><around|(|t|)>>.
  </proof>

  <section|Inversion Theory>

  <\theorem>
    [Spectral Inversion] Let <math|X<around|(|t|)>> be an injectively
    time-changed stationary process with absolutely continuous spectral
    measure <math|F*<around|(|d*\<lambda\>|)>=f<around|(|\<lambda\>|)>*d*\<lambda\>>.
    If <math|\<theta\>> is invertible with inverse <math|\<psi\>>, then

    <\equation>
      f<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X<around|(|\<psi\><around|(|u|)>|)>*e<rsup|-i*\<lambda\>*u>*<frac|d*u|\<psi\><rprime|'><around|(|u|)>>
    </equation>
  </theorem>

  <\proof>
    Making the substitution <math|u=\<theta\><around|(|t|)>>, so
    <math|t=\<psi\><around|(|u|)>> and <math|d*t=\<psi\><rprime|'><around|(|u|)>*d*u>:

    <\align>
      <tformat|<table|<row|<cell|X<around|(|\<psi\><around|(|u|)>|)>>|<cell|=<big|int><rsub|-1><rsup|1>e<rsup|i*\<mu\>*u>*d*Z<around|(|\<mu\>|)><eq-number>>>>>
    </align>

    This is the spectral representation of a stationary process in the
    <math|u>-domain. The standard inversion formula for stationary processes
    gives:

    <\equation>
      f<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X<around|(|\<psi\><around|(|u|)>|)>*e<rsup|-i*\<lambda\>*u>*<frac|d*u|\<psi\><rprime|'><around|(|u|)>>
    </equation>

    where the factor <math|<frac|1|\<psi\><rprime|'><around|(|u|)>>> accounts
    for the change of measure.
  </proof>

  <section|Band-Limited Structure>

  <\theorem>
    [Oscillatory Characterization] An injectively time-changed stationary
    process <math|X<around|(|t|)>> with spectral support in
    <math|<around|[|-1,1|]>> exhibits oscillatory behavior in the sense of
    Priestley if and only if the spectral measure <math|F> concentrates mass
    away from <math|\<lambda\>=0>.
  </theorem>

  <\proof>
    The process has the representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*Z<around|(|\<lambda\>|)>
    </equation>

    Oscillatory behavior requires sustained periodic components. If <math|F>
    has significant mass at <math|\<lambda\>=0>, the corresponding component
    <math|e<rsup|i\<cdot\>0\<cdot\>\<theta\><around|(|t|)>>=1> contributes a
    non-oscillatory constant term. Conversely, if <math|F> concentrates away
    from zero, all spectral components <math|e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>
    with <math|\<lambda\>\<neq\>0> exhibit oscillatory behavior modulated by
    the time-change <math|\<theta\><around|(|t|)>>.
  </proof>

  <\corollary>
    [Band-Limited Narrow-Band Property] If <math|F> is concentrated in an
    interval <math|<around|[|\<lambda\><rsub|0>-\<epsilon\>,\<lambda\><rsub|0>+\<epsilon\>|]>>
    with <math|\<lambda\><rsub|0>\<neq\>0> and small
    <math|\<epsilon\>\<gtr\>0>, then <math|X<around|(|t|)>> exhibits
    narrow-band oscillatory behavior around the carrier frequency
    <math|\<lambda\><rsub|0>>.
  </corollary>

  <section|Asymptotic Analysis>

  <\theorem>
    [Large Deviation Asymptotics] If <math|\<Delta\><around|(|t|)>=\<theta\><around|(|t|)>-t>
    grows without bound as <math|<around|\||t|\|>\<to\>\<infty\>>, then the
    process <math|X<around|(|t|)>> exhibits asymptotic phase decorrelation:

    <\equation>
      lim<rsub|<around|\||t-s|\|>\<to\>\<infty\>><text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>=0
    </equation>

    provided <math|F> has no point masses.
  </theorem>

  <\proof>
    The covariance is

    <\equation>
      <text|Cov><around|(|X<around|(|s|)>,X<around|(|t|)>|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|)>>*F*<around|(|d*\<lambda\>|)>
    </equation>

    If <math|<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>\<to\>\<infty\>>
    as <math|<around|\||t-s|\|>\<to\>\<infty\>>, then by the Riemann-Lebesgue
    lemma, the oscillatory integral converges to zero when <math|F> is
    absolutely continuous with respect to Lebesgue measure.
  </proof>

  <section|Conclusion>

  Injectively time-changed stationary processes provide a mathematically
  rigorous framework for analyzing non-stationary oscillatory phenomena
  through spectral methods. The warping function
  <math|\<theta\><around|(|t|)>> induces a time-dependent modulation while
  preserving the fundamental spectral structure inherited from the underlying
  orthogonal increment process.
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
      Function Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Fundamental
      Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Warping
      Function Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Inversion
      Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Band-Limited
      Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Asymptotic
      Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>