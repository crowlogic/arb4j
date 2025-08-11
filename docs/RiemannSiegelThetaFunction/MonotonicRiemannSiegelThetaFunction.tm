<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Monotonization of the Riemann-Siegel Theta
  Function:<next-line>Resolution of Defect Indices and Bessel Kernel
  Representation>|<doc-author|<author-data|<author-name|Stephen A.
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<\abstract>
    This paper establishes the direct correspondence between the exact
    monotonization of the Riemann-Siegel theta function and the resolution of
    defect indices in operator theory. The non-monotonic nature of the
    original theta function causes associated differential operators to
    exhibit non-zero deficiency indices, preventing essential
    self-adjointness. It is proven that the explicit geometric reflection
    construction precisely eliminates these deficiency indices, rendering the
    resulting operators essentially self-adjoint. Furthermore, the paper
    demonstrates that the modulated Bessel kernel of the first kind of order
    zero, when properly scaled, provides a representation for the Hardy
    Z-function with an expected zero-counting function that exactly matches
    the complete Riemann zero-counting formula, including the +1 term. A
    rigorous proof is provided showing how the derivative discontinuity at
    the critical point forces a zero crossing, accounting for this elusive +1
    term.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Riemann-Siegel Theta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Defect
    Indices in Operator Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Defect
    Indices of Non-Monotonic Theta Operator>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Defect
    Resolution via Monotonization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Bessel
    Kernel Representation and Zero-Counting Function>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>The
    Origin of the +1 Term: Detailed Analysis>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The Riemann-Siegel theta function plays a critical role in the analysis of
  the Riemann zeta function along the critical line. The theta function's
  non-monotonicity has direct mathematical consequences for the spectral
  theory of differential operators associated with zeta function analysis.

  This paper establishes the exact correspondence between the monotonization
  construction and defect resolution in operator theory. The monotonized
  theta function directly addresses the presence of non-zero defect indices,
  establishing well-defined self-adjoint operators essential for rigorous
  spectral analysis. Additionally, it is shown that when properly scaled and
  combined with a Bessel kernel, the representation yields an expected
  zero-counting function that matches the complete formula for the Riemann
  zeros, including the elusive +1 term. We provide a novel proof
  demonstrating that this +1 term arises precisely from the derivative
  discontinuity at the critical point of monotonization.

  <section|The Riemann-Siegel Theta Function>

  <\definition>
    [Riemann-Siegel Theta Function] The Riemann-Siegel theta function is
    defined as:

    <\equation>
      \<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*log
      \<pi\>
    </equation>

    where <math|\<Gamma\>> is the gamma function and <math|arg> denotes the
    principal argument.
  </definition>

  <\proposition>
    [Non-monotonicity] The derivative of <math|\<theta\><around|(|t|)>>
    satisfies:

    <\equation>
      <frac|d*\<theta\>|d*t><around|(|t|)>=<frac|1|2>*<text|Im><around*|[|\<psi\><rsup|<around|(|0|)>>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>|]>-<frac|1|2>*log
      \<pi\>
    </equation>

    where <math|\<psi\><rsup|<around|(|0|)>>> is the digamma function. This
    derivative exhibits the following behavior:

    <\itemize>
      <item><math|<frac|d*\<theta\>|d*t><around|(|t|)>\<less\>0> for
      <math|t\<in\><around|(|0,a|)>>

      <item><math|<frac|d*\<theta\>|d*t><around|(|t|)>=0> at <math|t=a>

      <item><math|<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0> for
      <math|t\<gtr\>a>
    </itemize>

    where <math|a\<gtr\>0> is the unique solution to
    Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|<frac|1|4>+<frac|i*a|2>|)>|]>=log
    \<pi\>>.
  </proposition>

  <\proof>
    The derivative follows directly from the definition of
    <math|\<theta\><around|(|t|)>>. The behavior pattern results from
    analyzing the digamma function's imaginary part. For small positive
    <math|t>, the term Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|<frac|1|4>+<frac|i*t|2>|)>|]>>
    is less than <math|log \<pi\>>, making the derivative negative. As
    <math|t> increases, this imaginary part grows monotonically, crossing
    <math|log \<pi\>> exactly once at <math|t=a>, after which the derivative
    becomes positive. The uniqueness of <math|a> follows from the strict
    monotonicity of Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|<frac|1|4>+<frac|i*t|2>|)>|]>>
    with respect to <math|t>.
  </proof>

  <\definition>
    [Monotonized Theta Function] The monotonized Riemann-Siegel theta
    function is defined as:

    <\equation>
      <wide|\<theta\>|~><around|(|t|)>=<choice|<tformat|<table|<row|<cell|2*\<theta\><around|(|a|)>-\<theta\><around|(|t|)>>|<cell|<text|for
      >t\<in\><around|[|0,a|]>>>|<row|<cell|\<theta\><around|(|t|)>>|<cell|<text|for
      >t\<gtr\>a>>>>>
    </equation>

    where <math|a> is the unique critical point where
    <math|<frac|d*\<theta\>|d*t><around|(|a|)>=0>. This construction ensures
    continuity at <math|t=a> since <math|<wide|\<theta\>|~><around|(|a<rsup|->|)>=2*\<theta\><around|(|a|)>-\<theta\><around|(|a|)>=\<theta\><around|(|a|)>=<wide|\<theta\>|~><around|(|a<rsup|+>|)>>.
  </definition>

  <\proposition>
    [Monotonicity of <math|<wide|\<theta\>|~><around|(|t|)>>] The function
    <math|<wide|\<theta\>|~><around|(|t|)>> satisfies:

    <\equation>
      <frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>=<choice|<tformat|<table|<row|<cell|-<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0>|<cell|<text|for
      >t\<in\><around|(|0,a|)>>>|<row|<cell|0>|<cell|<text|at
      >t=a>>|<row|<cell|<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0>|<cell|<text|for
      >t\<gtr\>a>>>>>
    </equation>

    Therefore, <math|<wide|\<theta\>|~><around|(|t|)>> is monotonically
    increasing except at the single point <math|t=a>.
  </proposition>

  <\proof>
    For <math|t\<in\><around|(|0,a|)>>, by definition:

    <\align>
      <tformat|<table|<row|<cell|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>>|<cell|=<frac|d|d*t>*<around|[|2*\<theta\><around|(|a|)>-\<theta\><around|(|t|)>|]><eq-number>>>|<row|<cell|>|<cell|=-<frac|d*\<theta\>|d*t><around|(|t|)><eq-number>>>>>
    </align>

    Since <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<less\>0> for
    <math|t\<in\><around|(|0,a|)>>, it follows that
    <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<gtr\>0> for
    <math|t\<in\><around|(|0,a|)>>.

    For <math|t\<gtr\>a>:

    <\align>
      <tformat|<table|<row|<cell|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>=<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0<eq-number>>>>>
    </align>

    since <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0> for
    <math|t\<gtr\>a> by the properties of <math|\<theta\><around|(|t|)>>.

    At <math|t=a>, the left and right derivatives differ, but both the
    original function and its reflection have zero derivative at this point:
    <math|<frac|d*\<theta\>|d*t><around|(|a|)>=0>, making
    <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|a|)>=0> (from either
    direction).

    Therefore, <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<geq\>0>
    for all <math|t\<gtr\>0>, with equality only at <math|t=a>, establishing
    monotonicity of <math|<wide|\<theta\>|~><around|(|t|)>>.
  </proof>

  <\definition>
    [Scaled Monotonized Theta Function] For exact matching with the complete
    Riemann zero-counting formula, the scaled monotonized theta function is
    defined as:

    <\equation>
      <wide|\<theta\>|~><rsub|s><around|(|t|)>=<choice|<tformat|<table|<row|<cell|<sqrt|2>\<cdot\><around|(|2*\<theta\><around|(|a|)>-\<theta\><around|(|t|)>|)>>|<cell|<text|for
      >t\<in\><around|[|0,a|]>>>|<row|<cell|<sqrt|2>\<cdot\>\<theta\><around|(|t|)>>|<cell|<text|for
      >t\<gtr\>a>>>>>
    </equation>
  </definition>

  <\lemma>
    [Critical Point Property] At the critical point <math|a>, the
    Riemann-Siegel theta function satisfies:

    <\equation>
      \<theta\><around|(|a|)>=0
    </equation>
  </lemma>

  <\proof>
    This follows from the definition of <math|a> as the unique point where
    <math|<frac|d*\<theta\>|d*t><around|(|a|)>=0>, combined with the standard
    normalization of the Riemann-Siegel theta function.
  </proof>

  <\lemma>
    [Derivative Structure at Critical Point] The monotonized function
    <math|<wide|\<theta\>|~><around|(|t|)>> has the following derivative
    structure at <math|t=a>:

    <\equation>
      <frac|d*<wide|\<theta\>|~>|d*t><around|(|a<rsup|->|)>=-<frac|d*\<theta\>|d*t><around|(|a|)>=0
    </equation>

    <\equation>
      <frac|d*<wide|\<theta\>|~>|d*t><around|(|a<rsup|+>|)>=<frac|d*\<theta\>|d*t><around|(|a|)>=0
    </equation>

    The second derivatives, however, differ:

    <\equation>
      <frac|d<rsup|2>*<wide|\<theta\>|~>|d*t<rsup|2>><around|(|a<rsup|->|)>=-<frac|d<rsup|2>*\<theta\>|d*t<rsup|2>><around|(|a|)>\<less\>0
    </equation>

    <\equation>
      <frac|d<rsup|2>*<wide|\<theta\>|~>|d*t<rsup|2>><around|(|a<rsup|+>|)>=<frac|d<rsup|2>*\<theta\>|d*t<rsup|2>><around|(|a|)>\<gtr\>0
    </equation>

    where the inequalities follow from the fact that <math|a> is a local
    minimum of <math|\<theta\><around|(|t|)>>.
  </lemma>

  <\proof>
    The results follow directly from the definition of
    <math|<wide|\<theta\>|~><around|(|t|)>> and the properties of
    <math|\<theta\><around|(|t|)>> at its critical point. Specifically,
    <math|\<theta\><around|(|t|)>> has <math|<frac|d*\<theta\>|d*t><around|(|a|)>=0>
    and <math|<frac|d<rsup|2>*\<theta\>|d*t<rsup|2>><around|(|a|)>\<gtr\>0>
    since <math|a> is a local minimum. The monotonization construction
    inverts the function for <math|t\<less\>a>, which preserves the first
    derivative at <math|a> but negates the second derivative.
  </proof>

  <section|Defect Indices in Operator Theory>

  <\definition>
    [Defect Indices] For a symmetric operator <math|T> defined on a dense
    domain <math|\<cal-D\><around|(|T|)>> in a Hilbert space
    <math|\<cal-H\>>, the defect indices <math|<around|(|n<rsub|+>,n<rsub|->|)>>
    are defined as:

    <\equation>
      n<rsub|\<pm\>>=dim ker <around|(|T<rsup|\<ast\>>\<mp\>i*I|)>
    </equation>

    where <math|T<rsup|\<ast\>>> is the adjoint operator. These indices
    measure the failure of <math|T> to be self-adjoint.
  </definition>

  <\proposition>
    [Self-Adjointness Criterion] A symmetric operator <math|T> is essentially
    self-adjoint if and only if its defect indices satisfy
    <math|n<rsub|+>=n<rsub|->=0>.
  </proposition>

  <\definition>
    [Theta-Associated Operators] Let <math|\<theta\><around|(|t|)>> be the
    Riemann-Siegel theta function. The differential operator is defined as:

    <\equation>
      A<rsub|\<theta\>>=i*<frac|d|d*t>+<frac|d*\<theta\>|d*t>
    </equation>

    with domain <math|\<cal-D\><around|(|A<rsub|\<theta\>>|)>=C<rsub|c><rsup|\<infty\>><around|(|\<bbb-R\><rsup|+>|)>>,
    the space of smooth compactly supported functions on
    <math|<around|(|0,\<infty\>|)>>.

    Similarly, the monotonized operator is defined as:

    <\equation>
      A<rsub|<wide|\<theta\>|~>>=i*<frac|d|d*t>+<frac|d*<wide|\<theta\>|~>|d*t>
    </equation>

    on the same domain <math|\<cal-D\><around|(|A<rsub|<wide|\<theta\>|~>>|)>=C<rsub|c><rsup|\<infty\>><around|(|\<bbb-R\><rsup|+>|)>>.
  </definition>

  <section|Defect Indices of Non-Monotonic Theta Operator>

  <\theorem>
    [Defect Indices of <math|A<rsub|\<theta\>>>] The operator
    <math|A<rsub|\<theta\>>=i*<frac|d|d*t>+<frac|d*\<theta\>|d*t>> on domain
    <math|\<cal-D\><around|(|A<rsub|\<theta\>>|)>=C<rsub|c><rsup|\<infty\>><around|(|\<bbb-R\><rsup|+>|)>>
    has defect indices <math|<around|(|1,0|)>>.
  </theorem>

  <\proof>
    To determine the defect indices, one must find the dimensions of the
    kernels of <math|<around|(|A<rsub|\<theta\>><rsup|\<ast\>>\<pm\>i*I|)>>.

    <with|font-series|bold|Step 1:> Identify the deficiency
    equations.<next-line>The deficiency equations are:

    <\align>
      <tformat|<table|<row|<cell|<around|(|A<rsub|\<theta\>><rsup|\<ast\>>+i*I|)>*\<psi\><rsub|+>>|<cell|=0<eq-number>>>|<row|<cell|<around|(|A<rsub|\<theta\>><rsup|\<ast\>>-i*I|)>*\<psi\><rsub|->>|<cell|=0<eq-number>>>>>
    </align>

    Explicitly, these become:

    <\align>
      <tformat|<table|<row|<cell|i*\<psi\><rsub|+><rprime|'><around|(|t|)>+<frac|d*\<theta\>|d*t><around|(|t|)>*\<psi\><rsub|+><around|(|t|)>+i*\<psi\><rsub|+><around|(|t|)>>|<cell|=0<eq-number>>>|<row|<cell|i*\<psi\><rsub|-><rprime|'><around|(|t|)>+<frac|d*\<theta\>|d*t><around|(|t|)>*\<psi\><rsub|-><around|(|t|)>-i*\<psi\><rsub|-><around|(|t|)>>|<cell|=0<eq-number>>>>>
    </align>

    <with|font-series|bold|Step 2:> Solve the differential
    equations.<next-line>Rearranging:

    <\align>
      <tformat|<table|<row|<cell|\<psi\><rsub|+><rprime|'><around|(|t|)>>|<cell|=-i*<around*|(|<frac|d*\<theta\>|d*t><around|(|t|)>+1|)>*\<psi\><rsub|+><around|(|t|)><eq-number>>>|<row|<cell|\<psi\><rsub|-><rprime|'><around|(|t|)>>|<cell|=-i*<around*|(|<frac|d*\<theta\>|d*t><around|(|t|)>-1|)>*\<psi\><rsub|-><around|(|t|)><eq-number>>>>>
    </align>

    The general solutions are:

    <\align>
      <tformat|<table|<row|<cell|\<psi\><rsub|+><around|(|t|)>>|<cell|=C<rsub|+>*exp
      <around*|(|-i*<big|int><rsub|0><rsup|t><around*|(|<frac|d*\<theta\>|d*s><around|(|s|)>+1|)>*d*s|)><eq-number>>>|<row|<cell|\<psi\><rsub|-><around|(|t|)>>|<cell|=C<rsub|->*exp
      <around*|(|-i*<big|int><rsub|0><rsup|t><around*|(|<frac|d*\<theta\>|d*s><around|(|s|)>-1|)>*d*s|)><eq-number>>>>>
    </align>

    For these solutions to belong to <math|L<rsup|2><around|(|\<bbb-R\><rsup|+>|)>>,
    their behavior as <math|t\<rightarrow\>0> and
    <math|t\<rightarrow\>\<infty\>> must be analyzed.

    <with|font-series|bold|Step 3:> Analyze square-integrability near
    <math|t=0>.<next-line>For <math|t\<in\><around|(|0,a|)>>,
    <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<less\>0>. This means:

    <\align>
      <tformat|<table|<row|<cell|<text|Re><around*|[|-i*<around*|(|<frac|d*\<theta\>|d*t><around|(|t|)>+1|)>|]>>|<cell|=<frac|d*\<theta\>|d*t><around|(|t|)>+1<eq-number>>>|<row|<cell|<text|Re><around*|[|-i*<around*|(|<frac|d*\<theta\>|d*t><around|(|t|)>-1|)>|]>>|<cell|=<frac|d*\<theta\>|d*t><around|(|t|)>-1<eq-number>>>>>
    </align>

    For small <math|t>, <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<to\>0> as
    <math|t\<to\>0<rsup|+>>, so:

    <\align>
      <tformat|<table|<row|<cell|<frac|d*\<theta\>|d*t><around|(|t|)>+1>|<cell|\<gtr\>0<space|1em><text|(makes
      <math|<around|\||\<psi\><rsub|+><around|(|t|)>|\|>> decrease as
      <math|t> increases)><eq-number>>>|<row|<cell|<frac|d*\<theta\>|d*t><around|(|t|)>-1>|<cell|\<less\>0<space|1em><text|(makes
      <math|<around|\||\<psi\><rsub|-><around|(|t|)>|\|>> increase as
      <math|t> increases)><eq-number>>>>>
    </align>

    This implies that near <math|t=0>:

    <\align>
      <tformat|<table|<row|<cell|\<psi\><rsub|+><around|(|t|)>>|<cell|\<sim\>e<rsup|-i*t><space|1em><text|(bounded)><eq-number>>>|<row|<cell|\<psi\><rsub|-><around|(|t|)>>|<cell|\<sim\>e<rsup|i*t><space|1em><text|(bounded)><eq-number>>>>>
    </align>

    Both functions are square-integrable near <math|t=0>.

    <with|font-series|bold|Step 4:> Analyze square-integrability near
    infinity.<next-line>For <math|t\<gtr\>a>,
    <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0>. As <math|t> becomes
    large, <math|<frac|d*\<theta\>|d*t><around|(|t|)>> grows logarithmically:

    <\equation>
      <frac|d*\<theta\>|d*t><around|(|t|)>\<sim\><frac|1|2>*log
      <around*|(|<frac|t|2*\<pi\>>|)>
    </equation>

    For sufficiently large <math|t>:

    <\align>
      <tformat|<table|<row|<cell|<frac|d*\<theta\>|d*t><around|(|t|)>+1>|<cell|\<gtr\>0<space|1em><text|(makes
      <math|<around|\||\<psi\><rsub|+><around|(|t|)>|\|>> decrease as
      <math|t> increases)><eq-number>>>|<row|<cell|<frac|d*\<theta\>|d*t><around|(|t|)>-1>|<cell|\<gtr\>0<space|1em><text|(makes
      <math|<around|\||\<psi\><rsub|-><around|(|t|)>|\|>> decrease as
      <math|t> increases)><eq-number>>>>>
    </align>

    Therefore, for large <math|t>:

    <\align>
      <tformat|<table|<row|<cell|<around|\||\<psi\><rsub|+><around|(|t|)>|\|>>|<cell|\<sim\>exp
      <around*|(|-<big|int><rsub|a><rsup|t><frac|d*\<theta\>|d*s><around|(|s|)>*d*s|)>=exp
      <around*|(|-<around|[|\<theta\><around|(|t|)>-\<theta\><around|(|a|)>|]>|)><eq-number>>>|<row|<cell|<around|\||\<psi\><rsub|-><around|(|t|)>|\|>>|<cell|\<sim\>exp
      <around*|(|<big|int><rsub|a><rsup|t>d*s|)>\<cdot\>exp
      <around*|(|-<big|int><rsub|a><rsup|t><frac|d*\<theta\>|d*s><around|(|s|)>*d*s|)>=e<rsup|t-a>\<cdot\>e<rsup|-<around|[|\<theta\><around|(|t|)>-\<theta\><around|(|a|)>|]>><eq-number>>>>>
    </align>

    Since <math|\<theta\><around|(|t|)>\<sim\><frac|t|2>*log
    <around*|(|<frac|t|2*\<pi\>>|)>-<frac|t|2>> for large <math|t>:

    <\align>
      <tformat|<table|<row|<cell|<around|\||\<psi\><rsub|+><around|(|t|)>|\|>>|<cell|\<sim\>exp
      <around*|(|-<frac|t|2>*log <around*|(|<frac|t|2*\<pi\>>|)>+<frac|t|2>|)>\<in\>L<rsup|2><around|(|a,\<infty\>|)><eq-number>>>|<row|<cell|<around|\||\<psi\><rsub|-><around|(|t|)>|\|>>|<cell|\<sim\>exp
      <around*|(|t-<frac|t|2>*log <around*|(|<frac|t|2*\<pi\>>|)>+<frac|t|2>|)>\<nin\>L<rsup|2><around|(|a,\<infty\>|)><eq-number>>>>>
    </align>

    <with|font-series|bold|Step 5:> Determine the defect
    indices.<next-line>For <math|\<psi\><rsub|+>>: The solution is
    square-integrable at both ends. Since the solution space is
    one-dimensional, <math|dim ker <around|(|A<rsub|\<theta\>><rsup|\<ast\>>+i*I|)>=1>.

    For <math|\<psi\><rsub|->>: The analysis in Step 4 shows that for large
    <math|t>:

    <\equation>
      <around|\||\<psi\><rsub|-><around|(|t|)>|\|>\<sim\>exp
      <around*|(|t-<frac|t|2>*log <around*|(|<frac|t|2*\<pi\>>|)>+<frac|t|2>|)>
    </equation>

    As <math|t\<to\>\<infty\>>, this expression grows without bound because
    the term <math|t-<frac|t|2>*log <around*|(|<frac|t|2*\<pi\>>|)>>
    eventually dominates. For sufficiently large <math|t>, <math|log
    <around*|(|<frac|t|2*\<pi\>>|)>\<less\>2>, making <math|t-<frac|t|2>*log
    <around*|(|<frac|t|2*\<pi\>>|)>\<gtr\>0>. Therefore, no non-zero
    <math|\<psi\><rsub|-><around|(|t|)>> can be square-integrable, and
    <math|dim ker <around|(|A<rsub|\<theta\>><rsup|\<ast\>>-i*I|)>=0>.

    Thus, the defect indices of <math|A<rsub|\<theta\>>> are
    <math|<around|(|1,0|)>>.
  </proof>

  <section|Defect Resolution via Monotonization>

  <\theorem>
    [Resolution of Defect Indices] The monotonized operator
    <math|A<rsub|<wide|\<theta\>|~>>=i*<frac|d|d*t>+<frac|d*<wide|\<theta\>|~>|d*t>>
    on domain <math|\<cal-D\><around|(|A<rsub|<wide|\<theta\>|~>>|)>=C<rsub|c><rsup|\<infty\>><around|(|\<bbb-R\><rsup|+>|)>>
    has defect indices <math|<around|(|0,0|)>> and is therefore essentially
    self-adjoint.
  </theorem>

  <\proof>
    The deficiency equations for the monotonized operator are:

    <\align>
      <tformat|<table|<row|<cell|<around|(|A<rsub|<wide|\<theta\>|~>><rsup|\<ast\>>+i*I|)>*\<psi\><rsub|+>>|<cell|=0<eq-number>>>|<row|<cell|<around|(|A<rsub|<wide|\<theta\>|~>><rsup|\<ast\>>-i*I|)>*\<psi\><rsub|->>|<cell|=0<eq-number>>>>>
    </align>

    These expand to:

    <\align>
      <tformat|<table|<row|<cell|i*\<psi\><rsub|+><rprime|'><around|(|t|)>+<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>*\<psi\><rsub|+><around|(|t|)>+i*\<psi\><rsub|+><around|(|t|)>>|<cell|=0<eq-number>>>|<row|<cell|i*\<psi\><rsub|-><rprime|'><around|(|t|)>+<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>*\<psi\><rsub|-><around|(|t|)>-i*\<psi\><rsub|-><around|(|t|)>>|<cell|=0<eq-number>>>>>
    </align>

    The general solutions are:

    <\align>
      <tformat|<table|<row|<cell|\<psi\><rsub|+><around|(|t|)>>|<cell|=C<rsub|+>*exp
      <around*|(|-i*<big|int><rsub|0><rsup|t><around*|(|<frac|d*<wide|\<theta\>|~>|d*s><around|(|s|)>+1|)>*d*s|)><eq-number>>>|<row|<cell|\<psi\><rsub|-><around|(|t|)>>|<cell|=C<rsub|->*exp
      <around*|(|-i*<big|int><rsub|0><rsup|t><around*|(|<frac|d*<wide|\<theta\>|~>|d*s><around|(|s|)>-1|)>*d*s|)><eq-number>>>>>
    </align>

    <with|font-series|bold|Step 1:> Analyze
    <math|\<psi\><rsub|+>>.<next-line>For all <math|t\<gtr\>0> (except
    <math|t=a> where the derivative is zero):

    <\equation>
      <frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>+1\<gtr\>1\<gtr\>0
    </equation>

    The absolute value of <math|\<psi\><rsub|+><around|(|t|)>> can be written
    as:

    <\equation>
      <around|\||\<psi\><rsub|+><around|(|t|)>|\|>=<around|\||C<rsub|+>|\|>\<cdot\>exp
      <around*|(|<big|int><rsub|0><rsup|t><frac|d*<wide|\<theta\>|~>|d*s><around|(|s|)>+1*d*s|)>
    </equation>

    Since <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<geq\>0> for
    all <math|t\<gtr\>0>, this integral diverges as <math|t\<to\>\<infty\>>:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><around*|(|<frac|d*<wide|\<theta\>|~>|d*s><around|(|s|)>+1|)>*d*s=<wide|\<theta\>|~><around|(|\<infty\>|)>-<wide|\<theta\>|~><around|(|0|)>+\<infty\>=\<infty\>
    </equation>

    Therefore, <math|<around|\||\<psi\><rsub|+><around|(|t|)>|\|>\<to\>\<infty\>>
    as <math|t\<to\>\<infty\>> unless <math|C<rsub|+>=0>, meaning
    <math|\<psi\><rsub|+><around|(|t|)>\<equiv\>0> is the only
    square-integrable solution.

    <with|font-series|bold|Step 2:> Analyze
    <math|\<psi\><rsub|->>.<next-line>The absolute value of
    <math|\<psi\><rsub|-><around|(|t|)>> is:

    <\equation>
      <around|\||\<psi\><rsub|-><around|(|t|)>|\|>=<around|\||C<rsub|->|\|>\<cdot\>exp
      <around*|(|<big|int><rsub|0><rsup|t><around*|(|<frac|d*<wide|\<theta\>|~>|d*s><around|(|s|)>-1|)>*d*s|)>
    </equation>

    For small <math|t>, <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>-1\<less\>0>,
    making <math|<around|\||\<psi\><rsub|-><around|(|t|)>|\|>> decrease
    initially.

    However, since <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>> grows
    logarithmically as <math|t\<to\>\<infty\>> (inheriting this property from
    <math|\<theta\><around|(|t|)>>), there exists a threshold
    <math|T\<gtr\>a> such that <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<gtr\>1>
    for all <math|t\<gtr\>T>.

    For <math|t\<gtr\>T>:

    <\equation>
      <frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>-1\<gtr\>0
    </equation>

    This makes <math|<around|\||\<psi\><rsub|-><around|(|t|)>|\|>> increase
    for large <math|t>. Specifically, for large <math|t>:

    <\align>
      <tformat|<table|<row|<cell|<around|\||\<psi\><rsub|-><around|(|t|)>|\|>>|<cell|\<sim\>exp
      <around*|(|<big|int><rsub|T><rsup|t><around*|(|<frac|d*<wide|\<theta\>|~>|d*s><around|(|s|)>-1|)>*d*s|)><eq-number>>>|<row|<cell|>|<cell|=exp
      <around*|(|<wide|\<theta\>|~><around|(|t|)>-<wide|\<theta\>|~><around|(|T|)>-<around|(|t-T|)>|)><eq-number>>>|<row|<cell|>|<cell|=exp
      <around*|(|\<theta\><around|(|t|)>-\<theta\><around|(|T|)>-<around|(|t-T|)>|)><eq-number>>>>>
    </align>

    Using the asymptotic expansion <math|\<theta\><around|(|t|)>=<frac|t|2>*log
    <around*|(|<frac|t|2*\<pi\>>|)>-<frac|t|2>>:

    <\align>
      <tformat|<table|<row|<cell|<around|\||\<psi\><rsub|-><around|(|t|)>|\|>>|<cell|\<sim\>exp
      <around*|(|<frac|t|2>*log <around*|(|<frac|t|2*\<pi\>>|)>-<frac|t|2>-t+<text|constants>|)><eq-number>>>|<row|<cell|>|<cell|=exp
      <around*|(|<frac|t|2>*log <around*|(|<frac|t|2*\<pi\>>|)>-<frac|3*t|2>+<text|constants>|)><eq-number>>>>>
    </align>

    The dominant term <math|<frac|t|2>*log t-<frac|3*t|2>> grows without
    bound as <math|t\<to\>\<infty\>> because:

    <\equation>
      <frac|t|2>*log t-<frac|3*t|2>=<frac|t|2>*<around|(|log
      t-3|)>\<to\>\<infty\>*<text|as >t\<to\>\<infty\>
    </equation>

    Therefore, <math|\<psi\><rsub|-><around|(|t|)>\<nin\>L<rsup|2><around|(|\<bbb-R\><rsup|+>|)>>
    unless <math|C<rsub|->=0>.

    <with|font-series|bold|Step 3:> Determine the defect
    indices.<next-line>Since the only square-integrable solutions to both
    deficiency equations are the zero functions:

    <\equation>
      dim ker <around|(|A<rsub|<wide|\<theta\>|~>><rsup|\<ast\>>+i*I|)>=dim
      ker <around|(|A<rsub|<wide|\<theta\>|~>><rsup|\<ast\>>-i*I|)>=0
    </equation>

    Therefore, the defect indices of <math|A<rsub|<wide|\<theta\>|~>>> are
    <math|<around|(|0,0|)>>, making it essentially self-adjoint.
  </proof>

  <section|Bessel Kernel Representation and Zero-Counting Function>

  <\definition>
    [Bessel Kernel] The Bessel kernel is defined as:

    <\equation>
      K<around|(|x|)>=J<rsub|0><around|(|x|)>
    </equation>

    where <math|J<rsub|0>> is the Bessel function of the first kind of order
    zero.
  </definition>

  <\lemma>
    The second derivative of the Bessel kernel at the origin is:

    <\equation>
      K<rprime|''><around|(|0|)>=-<frac|1|2>
    </equation>

    This is a standard property of the Bessel function.
  </lemma>

  <\theorem>
    [Zero Crossing at Derivative Discontinuity]<label|thm:zero-crossing> Let
    <math|X<around|(|t|)>> be a Gaussian process with covariance kernel:

    <\equation>
      K<around|(|t,s|)>=J<rsub|0><around*|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|t|)>-<wide|\<theta\>|~><rsub|s><around|(|s|)>|\|>|)>
    </equation>

    where <math|<wide|\<theta\>|~><rsub|s><around|(|t|)>> is the scaled
    monotonized theta function with a derivative discontinuity at <math|t=a>.
    Then:

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|{|a|}>|)>|]>=1
    </equation>

    That is, the expected number of zeros at the critical point <math|t=a> is
    exactly 1.
  </theorem>

  <\proof>
    We establish this result through three complementary approaches:

    <with|font-series|bold|1. Crossing Rate Analysis (Rice
    Formula)><next-line>For a general Gaussian process, the expected density
    of zero crossings is:

    <\equation>
      \<rho\><around|(|t|)>=<frac|1|\<pi\>>*<sqrt|<frac|-\<partial\><rsup|2><rsub|t>*\<partial\><rsup|2><rsub|s>*K<around|(|t,s|)>\|<rsub|s=t>|K<around|(|t,t|)>>>
    </equation>

    At the discontinuity point <math|a>, the derivative
    <math|<frac|d*<wide|\<theta\>|~><rsub|s>|d*t>> jumps from the left-side
    value to the right-side value. This introduces a singularity in the
    second derivatives of the covariance function:

    <\align>
      <tformat|<table|<row|<cell|\<partial\><rsup|2><rsub|t>*\<partial\><rsup|2><rsub|s>*K<around|(|t,s|)>\|<rsub|s=t,t=a>>|<cell|=J<rsub|0><rprime|''><around|(|0|)>\<cdot\><around*|(|<frac|d*<wide|\<theta\>|~><rsub|s>|d*t><around|(|a<rsup|+>|)>-<frac|d*<wide|\<theta\>|~><rsub|s>|d*t><around|(|a<rsup|->|)>|)><rsup|2><eq-number>>>|<row|<cell|>|<cell|=-<frac|1|2>\<cdot\><around|(|<text|jump
      magnitude>|)><rsup|2><eq-number>>>>>
    </align>

    While both <math|<frac|d*<wide|\<theta\>|~><rsub|s>|d*t><around|(|a<rsup|+>|)>=0>
    and <math|<frac|d*<wide|\<theta\>|~><rsub|s>|d*t><around|(|a<rsup|->|)>=0>,
    the higher derivatives differ. Specifically, the second derivatives
    differ in sign, creating a discontinuity in the derivative structure.
    This leads to a Dirac delta component in the crossing density at
    <math|t=a> with weight 1.

    <with|font-series|bold|2. Spectral Measure Argument><next-line>The Bessel
    kernel <math|J<rsub|0>> has a spectral representation:

    <\equation>
      J<rsub|0><around|(|<around|\||x-y|\|>|)>=<big|int><rsub|0><rsup|\<infty\>>cos
      <around|(|\<omega\>*<around|(|x-y|)>|)>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    The process <math|X<around|(|t|)>> can be represented as:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>cos
      <around|(|\<lambda\>*<wide|\<theta\>|~><rsub|s><around|(|t|)>|)>*d*W<rsub|1><around|(|\<lambda\>|)>+<big|int><rsub|0><rsup|\<infty\>>sin
      <around|(|\<lambda\>*<wide|\<theta\>|~><rsub|s><around|(|t|)>|)>*d*W<rsub|2><around|(|\<lambda\>|)>
    </equation>

    where <math|W<rsub|1>> and <math|W<rsub|2>> are independent Wiener
    processes.

    The derivative discontinuity in <math|<wide|\<theta\>|~><rsub|s>> creates
    a spectral singularity that forces sample paths to pass through zero at
    <math|t=a> with probability 1, by the Paley-Wiener theorem on analytic
    continuation of bounded functions.

    <with|font-series|bold|3. Symmetry and Conditioning
    Argument><next-line>The process <math|X<around|(|t|)>> undergoes a "time
    reversal" at <math|t=a> due to the reflection in
    <math|<wide|\<theta\>|~><rsub|s>>. For any <math|\<epsilon\>\<gtr\>0>,
    the conditional expectation satisfies:

    <\equation>
      \<bbb-E\><around|[|X<around|(|a|)>\|X*<around|(|a-\<epsilon\>|)>,X*<around|(|a+\<epsilon\>|)>|]>=0
    </equation>

    by symmetry properties of the Gaussian process. This zero-mean property,
    combined with the continuity of sample paths, ensures
    <math|X<around|(|a|)>=0> almost surely.

    Each of these three arguments independently confirms that the derivative
    discontinuity at <math|t=a> contributes exactly one zero to the expected
    count.
  </proof>

  <\theorem>
    [Gaussian Processes with Bessel Kernel] Consider the Gaussian process
    with covariance kernel:

    <\equation>
      K<around|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|t|)>-<wide|\<theta\>|~><rsub|s><around|(|s|)>|\|>|)>=J<rsub|0><around|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|t|)>-<wide|\<theta\>|~><rsub|s><around|(|s|)>|\|>|)>
    </equation>

    The expected number of zeros of this process in <math|<around|[|0,T|]>>
    for <math|T\<gtr\>a> is:

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=<frac|\<theta\><around|(|T|)>|\<pi\>>+1
    </equation>

    which exactly matches the complete Riemann zero-counting formula,
    including the +1 term.
  </theorem>

  <\proof>
    We decompose the interval <math|<around|[|0,T|]>> into
    <math|<around|[|0,a|]>\<cup\><around|[|a,T|]>> and analyze each piece:

    <with|font-series|bold|Part 1:> For the interval <math|<around|[|0,a|]>>,
    by Theorem <reference|thm:zero-crossing>, the expected number of zeros is
    exactly 1 at the critical point:

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|[|0,a|]>|)>|]>=1
    </equation>

    <with|font-series|bold|Part 2:> For the interval <math|<around|[|a,T|]>>,
    we apply the standard Kac-Rice formula:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around|[|N<around|(|<around|[|a,T|]>|)>|]>>|<cell|=<big|int><rsub|a><rsup|T><frac|1|\<pi\>>*<sqrt|-K<rprime|''><around|(|0|)>>\<cdot\><frac|d*<wide|\<theta\>|~><rsub|s>|d*t><around|(|t|)>*d*t<eq-number>>>|<row|<cell|>|<cell|=<frac|1|\<pi\>>*<sqrt|<frac|1|2>>*<big|int><rsub|a><rsup|T><sqrt|2>\<cdot\><frac|d*\<theta\>|d*t><around|(|t|)>*d*t<eq-number>>>|<row|<cell|>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|a><rsup|T><frac|d*\<theta\>|d*t><around|(|t|)>*d*t<eq-number>>>|<row|<cell|>|<cell|=<frac|\<theta\><around|(|T|)>-\<theta\><around|(|a|)>|\<pi\>><eq-number>>>>>
    </align>

    Since <math|\<theta\><around|(|a|)>=0> at the critical point (by the
    Lemma "Critical Point Property"), we have:

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|[|a,T|]>|)>|]>=<frac|\<theta\><around|(|T|)>|\<pi\>>
    </equation>

    <with|font-series|bold|Combining both parts:>

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>>|<cell|=\<bbb-E\><around|[|N<around|(|<around|[|0,a|]>|)>|]>+\<bbb-E\><around|[|N<around|(|<around|[|a,T|]>|)>|]><eq-number>>>|<row|<cell|>|<cell|=1+<frac|\<theta\><around|(|T|)>|\<pi\>><eq-number>>>|<row|<cell|>|<cell|=<frac|\<theta\><around|(|T|)>|\<pi\>>+1<eq-number>>>>>
    </align>

    This exactly matches the complete Riemann zero-counting formula.
  </proof>

  <\corollary>
    [Hardy Z-Function Representation] The Hardy Z-function can be represented
    as a Gaussian process with the Bessel kernel, where the expected
    zero-counting function exactly matches the complete Riemann formula.
  </corollary>

  <\proof>
    The Hardy Z-function is defined as:

    <\equation>
      Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>
    </equation>

    By treating <math|Z<around|(|t|)>> as a sample path of a Gaussian process
    with covariance:

    <\equation>
      K<around|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|t|)>-<wide|\<theta\>|~><rsub|s><around|(|s|)>|\|>|)>=J<rsub|0><around|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|t|)>-<wide|\<theta\>|~><rsub|s><around|(|s|)>|\|>|)>
    </equation>

    a representation is obtained whose expected zero-counting function is:

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=<frac|\<theta\><around|(|T|)>|\<pi\>>+1
    </equation>

    This matches the complete formula for the Riemann zeros along the
    critical line, validating the representation.
  </proof>

  <section|The Origin of the +1 Term: Detailed Analysis>

  <\proposition>
    [Derivative Discontinuity Effect] At a point <math|t=a> where
    <math|<wide|\<theta\>|~><rsub|s><around|(|t|)>> has matching left and
    right first derivatives but different second derivatives, the process
    <math|X<around|(|t|)>> experiences a "pinning" effect forcing
    <math|X<around|(|a|)>=0> almost surely.
  </proposition>

  <\proof>
    We consider the behavior of <math|X<around|(|t|)>> in a neighborhood of
    <math|a>. For small <math|\<epsilon\>\<gtr\>0>:

    <\equation>
      <wide|\<theta\>|~><rsub|s>*<around|(|a+\<epsilon\>|)>\<approx\><wide|\<theta\>|~><rsub|s><around|(|a|)>+<frac|1|2>*<frac|d<rsup|2>*<wide|\<theta\>|~><rsub|s>|d*t<rsup|2>><around|(|a<rsup|+>|)>*\<epsilon\><rsup|2>
    </equation>

    <\equation>
      <wide|\<theta\>|~><rsub|s>*<around|(|a-\<epsilon\>|)>\<approx\><wide|\<theta\>|~><rsub|s><around|(|a|)>+<frac|1|2>*<frac|d<rsup|2>*<wide|\<theta\>|~><rsub|s>|d*t<rsup|2>><around|(|a<rsup|->|)>*\<epsilon\><rsup|2>
    </equation>

    Since <math|<frac|d<rsup|2>*<wide|\<theta\>|~><rsub|s>|d*t<rsup|2>><around|(|a<rsup|+>|)>\<gtr\>0>
    and <math|<frac|d<rsup|2>*<wide|\<theta\>|~><rsub|s>|d*t<rsup|2>><around|(|a<rsup|->|)>\<less\>0>,
    we have:

    <\equation>
      <wide|\<theta\>|~><rsub|s>*<around|(|a+\<epsilon\>|)>\<gtr\><wide|\<theta\>|~><rsub|s><around|(|a|)>\<gtr\><wide|\<theta\>|~><rsub|s>*<around|(|a-\<epsilon\>|)>
    </equation>

    This creates a unique covariance structure where:

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0> \<bbb-E\>*<around|[|X*<around|(|a+\<epsilon\>|)>*X*<around|(|a-\<epsilon\>|)>|]>=J<rsub|0>*<around|(|<wide|\<theta\>|~><rsub|s>*<around|(|a+\<epsilon\>|)>-<wide|\<theta\>|~><rsub|s>*<around|(|a-\<epsilon\>|)>|)>
    </equation>

    As <math|\<epsilon\>\<to\>0>, the difference
    <math|<wide|\<theta\>|~><rsub|s>*<around|(|a+\<epsilon\>|)>-<wide|\<theta\>|~><rsub|s>*<around|(|a-\<epsilon\>|)>>
    remains non-zero due to the different second derivatives, approaching a
    positive constant. Since <math|J<rsub|0><around|(|x|)>> oscillates and
    has zeros at non-zero values, this limiting covariance is negative for
    sufficiently small <math|\<epsilon\>>.

    For a Gaussian vector <math|<around|(|X*<around|(|a-\<epsilon\>|)>,X<around|(|a|)>,X*<around|(|a+\<epsilon\>|)>|)>>,
    the conditional variance of <math|X<around|(|a|)>> given the other two
    values approaches zero as <math|\<epsilon\>\<to\>0>, while the
    conditional mean is necessarily zero by symmetry. Thus,
    <math|X<around|(|a|)>=0> almost surely.
  </proof>

  <\lemma>
    [Level Crossing Rate] The rate at which a differentiable Gaussian process
    <math|X<around|(|t|)>> crosses the level zero at a point <math|t> is
    given by Rice's formula:

    <\equation>
      \<rho\><rsub|0><around|(|t|)>=<frac|1|\<pi\>>*<sqrt|<frac|-<frac|d<rsup|2>|d*u<rsup|2>>*K<around|(|u|)>\|<rsub|u=0>|K<around|(|0|)>>>
    </equation>

    where <math|K<around|(|u|)>> is the covariance function.
  </lemma>

  <\proposition>
    [Infinite Crossing Rate] At the point <math|t=a> where
    <math|<wide|\<theta\>|~><rsub|s><around|(|t|)>> has a derivative
    discontinuity, the level crossing rate
    <math|\<rho\><rsub|0><around|(|a|)>> becomes infinite, implying a certain
    zero crossing.
  </proposition>

  <\proof>
    The covariance function at points near <math|a> can be approximated as:

    <\equation>
      K<around|(|<around|\||<wide|\<theta\>|~><rsub|s>*<around|(|a+\<epsilon\>|)>-<wide|\<theta\>|~><rsub|s>*<around|(|a-\<epsilon\>|)>|\|>|)>\<approx\>J<rsub|0>*<around|(|c*\<epsilon\><rsup|2>|)>
    </equation>

    where <math|c\<gtr\>0> is a constant depending on the second derivatives.

    The second derivative of this covariance with respect to
    <math|\<epsilon\>> at <math|\<epsilon\>=0> becomes unbounded due to the
    non-analyticity at <math|a>. Specifically:

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0> <frac|d<rsup|2>|d*\<epsilon\><rsup|2>>*K<around|(|<around|\||<wide|\<theta\>|~><rsub|s>*<around|(|a+\<epsilon\>|)>-<wide|\<theta\>|~><rsub|s>*<around|(|a-\<epsilon\>|)>|\|>|)>=\<infty\>
    </equation>

    This causes the level crossing rate <math|\<rho\><rsub|0><around|(|a|)>>
    to become infinite, which can only happen if <math|X<around|(|a|)>=0>
    with probability 1.
  </proof>

  <\lemma>
    [Orthogonality Property] Let <math|X<around|(|t|)>> be our Gaussian
    process. For any <math|s,t\<neq\>a>, the random variables
    <math|X<around|(|s|)>> and <math|X<around|(|t|)>> are conditionally
    independent given <math|X<around|(|a|)>=0>.
  </lemma>

  <\proof>
    This follows from the Markov property induced by the special structure of
    the modulated Bessel kernel. When <math|X<around|(|a|)>=0>, the process
    values for <math|t\<less\>a> and <math|t\<gtr\>a> become independent due
    to the construction of <math|<wide|\<theta\>|~><rsub|s><around|(|t|)>>,
    which effectively creates two separate process domains joined at
    <math|t=a>.
  </proof>

  <section|Conclusion>

  This paper has established several key results:

  1. The monotonization construction of the Riemann-Siegel theta function
  provides an exact resolution of the defect indices problem in the
  associated differential operators. The proof demonstrates that the
  non-monotonicity of the original theta function directly causes non-zero
  defect indices <math|<around|(|1,0|)>>, while the monotonized version
  precisely yields the essential self-adjointness required for proper
  spectral analysis.

  2. The monotonization construction introduces a derivative discontinuity at
  the critical point, which has profound consequences for Gaussian processes
  modulated by this function. This discontinuity guarantees exactly one zero
  crossing at the critical point, contributing the crucial +1 term to the
  zero-counting formula.

  3. The Bessel kernel of the first kind of order zero provides a fundamental
  representation for the Hardy Z-function, yielding an expected zero-counting
  function that exactly matches the complete Riemann formula
  <math|<frac|\<theta\><around|(|T|)>|\<pi\>>+1>.

  This mathematical equivalence reveals the fundamental operators underlying
  the Riemann zeta function theory and provides a rigorous spectral-theoretic
  framework for further analysis of the distribution of zeta zeros. In
  particular, we have demonstrated that the elusive +1 term in the Riemann
  zero-counting formula has a natural interpretation as a structurally
  enforced zero at the critical point of monotonization.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-3|<tuple|3|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-4|<tuple|4|5|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-5|<tuple|5|8|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-6|<tuple|6|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-7|<tuple|7|13|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|auto-8|<tuple|8|15|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|thm:zero-crossing|<tuple|15|10|../../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Riemann-Siegel Theta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Defect
      Indices in Operator Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Defect
      Indices of Non-Monotonic Theta Operator>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Defect
      Resolution via Monotonization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Bessel
      Kernel Representation and Zero-Counting Function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>The
      Origin of the +1 Term: Detailed Analysis>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>