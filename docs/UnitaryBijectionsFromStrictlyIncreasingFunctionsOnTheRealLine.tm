<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  \<cdot\><doc-data|<doc-title|Unitary Bijections From Strictly Increasing
  Functions On The Real Line>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  \;

  <\abstract>
    This paper establishes a comprehensive theory of unitary
    change-of-variables operators on <math|L<rsup|2>> spaces, encompassing
    both the general framework for <math|L<rsup|2><around|(|\<bbb-R\>|)>> and
    specialized results for measure-preserving transformations. The
    investigation begins with the characterization of when weighted
    composition operators <math|<around|(|U*f|)><around|(|x|)>=f<around|(|T<around|(|x|)>|)>\<cdot\>w<around|(|x|)>>
    achieve unitarity, requiring measurable bijections modulo null sets,
    mutual absolute continuity of measures, and specific weight functions
    involving Radon-Nikodym derivatives. For differentiable transformations,
    this reduces to the condition <math|<around|\||w<around|(|x|)>|\|><rsup|2>=<around|\||T<rprime|'><around|(|x|)>|\|>>.
    The analysis then specializes to <math|C<rsup|1>> bijective
    transformations <math|g:I\<to\>J> between intervals with positive
    derivative almost everywhere, where <math|L<rsup|2>> norm preservation
    under Lebesgue measure is achieved through the unitary change of
    variables operator <math|T<rsub|g>*f=f<around|(|g<around|(|y|)>|)><sqrt|g<rprime|'><around|(|y|)>>>.
    The necessity of these specific scaling factors is rigorously established
    through variational arguments. These findings provide a unified
    theoretical foundation bridging the change-of-variables formula in real
    analysis with the unitary structure of <math|L<rsup|2>> spaces, with
    applications in ergodic theory, functional analysis, and measure theory.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>General
    Framework: Unitary Change-of-Variables Operators>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Bijective
    Transformations on Unbounded Domains>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc><with|mode|math|L<rsup|2>>
    Norm Preservation Under Lebesgue Measure>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  This paper presents a comprehensive theory of unitary change-of-variables
  operators on <math|L<rsup|2>> spaces, establishing the fundamental
  relationship between unitary bijections and measure-preserving
  transformations in both general and specialized settings. The investigation
  begins with the general framework for weighted composition operators on
  <math|L<rsup|2><around|(|\<bbb-R\>|)>>, then specializes to
  measure-preserving transformations on unbounded domains.

  <section|General Framework: Unitary Change-of-Variables Operators>

  <\definition>
    <label|def:cov-operator>A <em|change-of-variables operator> on
    <math|L<rsup|2><around|(|\<bbb-R\>,\<mu\>|)>> where <math|\<mu\>> is
    Lebesgue measure is a bounded linear operator
    <math|U:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    of the form

    <\equation>
      <around|(|U*f|)><around|(|x|)>=f<around|(|T<around|(|x|)>|)>\<cdot\>w<around|(|x|)>
    </equation>

    for some measurable map <math|T:\<bbb-R\>\<to\>\<bbb-R\>> and measurable
    weight function <math|w:\<bbb-R\>\<to\>\<bbb-C\>> with
    <math|<around|\||w<around|(|x|)>|\|>\<gtr\>0> almost everywhere.
  </definition>

  <\theorem>
    <label|thm:main>Let <math|U> be a change-of-variables operator as in
    Definition<nbsp><reference|def:cov-operator>. Then <math|U> is unitary if
    and only if the following conditions hold:

    <\enumerate>
      <item><math|T:\<bbb-R\>\<to\>\<bbb-R\>> is a measurable bijection
      modulo null sets;

      <item><math|\<mu\>\<circ\>T<rsup|-1>\<ll\>\<mu\>> and
      <math|\<mu\>\<ll\>\<mu\>\<circ\>T<rsup|-1>> (mutual absolute
      continuity);

      <item><math|<around|\||w<around|(|x|)>|\|><rsup|2>=<frac|d*<around|(|\<mu\>\<circ\>T|)>|d*\<mu\>><around|(|x|)>>
      almost everywhere;

      <item><math|w<around|(|x|)>=<sqrt|<frac|d*<around|(|\<mu\>\<circ\>T|)>|d*\<mu\>><around|(|x|)>>\<cdot\>e<rsup|i*\<theta\><around|(|x|)>>>
      for some measurable phase function <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>.
    </enumerate>

    Furthermore, if <math|T> is differentiable almost everywhere with
    <math|T<rprime|'><around|(|x|)>\<neq\>0> a.e., then condition (3) becomes

    <\equation>
      <around|\||w<around|(|x|)>|\|><rsup|2>=<around|\||T<rprime|'><around|(|x|)>|\|>
    </equation>
  </theorem>

  <\proof>
    The proof proceeds by establishing necessity and sufficiency separately.

    <with|font-series|bold|Necessity:> Assume <math|U> is unitary. Since
    <math|U> is an isometry, for any <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>,

    <\equation>
      <label|eq:isometry><around|\<\|\|\>|U*f|\<\|\|\>><rsub|2><rsup|2>=<around|\<\|\|\>|f|\<\|\|\>><rsub|2><rsup|2>
    </equation>

    Computing the left side:

    <\equation>
      <around|\<\|\|\>|U*f|\<\|\|\>><rsub|2><rsup|2>=<big|int><rsub|\<bbb-R\>><around|\||f<around|(|T<around|(|x|)>|)><around|\||<rsup|2>|\|>*w<around|(|x|)>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|x|)>
    </equation>

    Define the measure <math|\<nu\>> by <math|d*\<nu\>=<around|\||w|\|><rsup|2>*d*\<mu\>>.
    By the change-of-variables formula for the pushforward measure,

    <\equation>
      <big|int><rsub|\<bbb-R\>><around|\||f<around|(|T<around|(|x|)>|)><around|\||<rsup|2>|\|>*w<around|(|x|)>*<around|\||<rsup|2><space|0.17em>d*\<mu\><around|(|x|)>=<big|int><rsub|\<bbb-R\>>|\|>*f<around|(|y|)>|\|><rsup|2>*<space|0.17em>d*<around|(|T<rsub|\<ast\>>*\<nu\>|)><around|(|y|)>
    </equation>

    where

    <\equation>
      <around|(|T<rsub|\<ast\>>*\<nu\>|)><around|(|A|)>=\<nu\><around|(|T<rsup|-1><around|(|A|)>|)>
    </equation>

    for measurable sets <math|A>. From equation<nbsp><eqref|eq:isometry>, we
    require

    <\equation>
      <label|eq:measure-condition><big|int><rsub|\<bbb-R\>><around|\||f<around|(|y|)>|\|><rsup|2>*<space|0.17em>d*<around|(|T<rsub|\<ast\>>*\<nu\>|)><around|(|y|)>=<big|int><rsub|\<bbb-R\>><around|\||f<around|(|y|)>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|y|)>
    </equation>

    for all <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>.

    This implies <math|T<rsub|\<ast\>>*\<nu\>=\<mu\>> as measures. Therefore,
    for any measurable set <math|A>,

    <\equation>
      \<mu\><around|(|A|)>=\<nu\><around|(|T<rsup|-1><around|(|A|)>|)>=<big|int><rsub|T<rsup|-1><around|(|A|)>><around|\||w<around|(|x|)>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|x|)>
    </equation>

    For <math|U> to be surjective (hence unitary rather than merely
    isometric), <math|T> must be invertible modulo null sets. This requires
    both directions of absolute continuity in condition (2).

    By the Radon-Nikodym theorem, since <math|\<mu\>\<circ\>T<rsup|-1>\<ll\>\<mu\>>,
    there exists <math|\<rho\>\<geq\>0> such that

    <\equation>
      \<rho\><around|(|y|)>=<frac|d*<around|(|\<mu\>\<circ\>T<rsup|-1>|)>|d*\<mu\>><around|(|y|)>
    </equation>

    The standard change-of-variables identity gives, for nonnegative
    measurable <math|g>,

    <\equation>
      <big|int><rsub|\<bbb-R\>>g<around|(|T<around|(|x|)>|)>*<space|0.17em>d*\<mu\><around|(|x|)>=<big|int><rsub|\<bbb-R\>>g<around|(|y|)>*\<rho\><around|(|y|)>*<space|0.17em>d*\<mu\><around|(|y|)>
    </equation>

    Comparing with the isometry requirement from
    equation<nbsp><eqref|eq:measure-condition>, we obtain

    <\equation>
      <big|int><rsub|\<bbb-R\>>g<around|(|T<around|(|x|)>|)><around|\||w<around|(|x|)>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|x|)>=<big|int><rsub|\<bbb-R\>>g<around|(|y|)>*<space|0.17em>d*\<mu\><around|(|y|)>
    </equation>

    This requires

    <\equation>
      <around|\||w<around|(|x|)>|\|><rsup|2>=\<rho\><around|(|T<around|(|x|)>|)><rsup|-1>
    </equation>

    almost everywhere. By the chain rule for Radon-Nikodym derivatives,

    <\equation>
      <around|\||w<around|(|x|)>|\|><rsup|2>=<frac|d*<around|(|\<mu\>\<circ\>T|)>|d*\<mu\>><around|(|x|)>
    </equation>

    The phase freedom in condition (4) follows from the fact that only
    <math|<around|\||w|\|><rsup|2>> is determined by the isometry condition.

    <with|font-series|bold|Sufficiency:> Conversely, assume conditions
    (1)-(4) hold. Define <math|U> as in Definition<nbsp><reference|def:cov-operator>
    with the specified <math|T> and <math|w>. The computation above shows
    that <math|U> is isometric. Since <math|T> is bijective modulo null sets
    with mutual absolute continuity, the operator <math|U<rsup|\<ast\>>>
    exists and is given by

    <\equation>
      <around|(|U<rsup|\<ast\>>*g|)><around|(|x|)>=g<around|(|T<rsup|-1><around|(|x|)>|)>\<cdot\><wide|w<around|(|T<rsup|-1><around|(|x|)>|)>|\<bar\>>\<cdot\><sqrt|<frac|d*<around|(|\<mu\>\<circ\>T<rsup|-1>|)>|d*\<mu\>><around|(|x|)>>\<cdot\>e<rsup|-i*\<theta\><around|(|T<rsup|-1><around|(|x|)>|)>>
    </equation>

    Direct computation verifies <math|U*U<rsup|\<ast\>>=U<rsup|\<ast\>>*U=I>,
    establishing unitarity.

    The final statement regarding differentiable <math|T> follows from the
    fact that for such maps,

    <\equation>
      <frac|d*<around|(|\<mu\>\<circ\>T|)>|d*\<mu\>><around|(|x|)>=<around|\||T<rprime|'><around|(|x|)>|\|>
    </equation>

    by the classical change-of-variables theorem.
  </proof>

  <\lemma>
    <label|lem:monotone>If <math|T:\<bbb-R\>\<to\>\<bbb-R\>> is a measurable
    bijection that is differentiable almost everywhere, then <math|T> is
    either almost everywhere monotone increasing or almost everywhere
    monotone decreasing.
  </lemma>

  <\proof>
    Since <math|T> is a bijection of <math|\<bbb-R\>>, the intermediate value
    theorem and injectivity require that <math|T> cannot change monotonicity
    on any interval where it is continuous. As <math|T> is differentiable
    almost everywhere, it is continuous almost everywhere, and the set where
    <math|T<rprime|'>> exists has full measure. On this set,
    <math|T<rprime|'>> cannot change sign without violating the bijection
    property, hence <math|T<rprime|'><around|(|x|)>\<geq\>0> almost
    everywhere or <math|T<rprime|'><around|(|x|)>\<leq\>0> almost everywhere.
  </proof>

  <section|Bijective Transformations on Unbounded Domains>

  <\theorem>
    [Bijectivity of Strictly Increasing Unbounded
    Functions]<label|thm:bijective_unbounded>Let <math|g:I\<to\>\<bbb-R\>> be
    a strictly increasing and unbounded function where
    <math|I\<subseteq\>\<bbb-R\>> is an unbounded interval. Then <math|g> is
    bijective onto its range <math|J=g<around|(|I|)>>, and <math|J> is also
    an unbounded interval.
  </theorem>

  <\proof>
    Since <math|g> is strictly increasing, injectivity is immediate. For any
    <math|x<rsub|1>,x<rsub|2>\<in\>I> with <math|x<rsub|1>\<less\>x<rsub|2>>,
    one has <math|g<around|(|x<rsub|1>|)>\<less\>g<around|(|x<rsub|2>|)>>.

    For surjectivity onto <math|J=g<around|(|I|)>>, let <math|y\<in\>J>. By
    definition, there exists <math|x\<in\>I> such that
    <math|g<around|(|x|)>=y>. The uniqueness of such <math|x> follows from
    injectivity.

    To establish that <math|J> is unbounded, note that since <math|g> is
    unbounded, for any <math|M\<gtr\>0>, there exists <math|x\<in\>I> such
    that <math|<around|\||g<around|(|x|)>|\|>\<gtr\>M>. Consider two cases:

    <\enumerate>
      <item>If <math|I> is unbounded above (e.g.,
      <math|I=<around|(|a,\<infty\>|)>> or
      <math|I=<around|[|a,\<infty\>|)>>), and <math|g> is unbounded above,
      then as <math|x\<to\>\<infty\>> in <math|I>, we have
      <math|g<around|(|x|)>\<to\>\<infty\>> since <math|g> is strictly
      increasing. Thus <math|J> is unbounded above.

      <item>If <math|I> is unbounded below (e.g.,
      <math|I=<around|(|-\<infty\>,b|)>> or
      <math|I=<around|(|-\<infty\>,b|]>>), and <math|g> is unbounded below,
      then as <math|x\<to\>-\<infty\>> in <math|I>, we have
      <math|g<around|(|x|)>\<to\>-\<infty\>> since <math|g> is strictly
      increasing. Thus <math|J> is unbounded below.

      <item>If <math|I=\<bbb-R\>> and <math|g> is unbounded in both
      directions, then <math|J> must be unbounded in both directions.
    </enumerate>

    Since <math|g> is continuous (being strictly monotone) and maps an
    interval to an interval, <math|J> is indeed an interval. Therefore,
    <math|g:I\<to\>J> is bijective with both <math|I> and <math|J> unbounded
    intervals.
  </proof>

  <\theorem>
    [Differentiable Bijections with Positive
    Derivative]<label|thm:diff_bijective>Let <math|g:I\<to\>J> be a
    <math|C<rsup|1>> bijection between intervals
    <math|I,J\<subseteq\>\<bbb-R\>> such that
    <math|g<rprime|'><around|(|y|)>\<gtr\>0> for all <math|y\<in\>I> except
    possibly on a set of measure zero. Then <math|g> is a well-defined change
    of variables for Lebesgue integration.
  </theorem>

  <\proof>
    The condition <math|g<rprime|'><around|(|y|)>\<gtr\>0> almost everywhere
    ensures that <math|g> is locally invertible almost everywhere. Since
    <math|g> is already assumed bijective and <math|C<rsup|1>>, the standard
    change of variables formula applies:

    <\equation>
      <label|eq:change_vars><aligned|<tformat|<table|<row|<cell|<big|int><rsub|J>f<around|(|x|)>*<space|0.17em>d*x>|<cell|=<big|int><rsub|I>f<around|(|g<around|(|y|)>|)><around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|I>f<around|(|g<around|(|y|)>|)>*g<rprime|'><around|(|y|)>*<space|0.17em>d*y>>>>>
    </equation>

    where the last equality uses <math|g<rprime|'><around|(|y|)>\<gtr\>0>
    almost everywhere. The points where <math|g<rprime|'><around|(|y|)>=0>
    form a set of measure zero and do not affect the integral.
  </proof>

  <section|<math|L<rsup|2>> Norm Preservation Under Lebesgue Measure>

  <\definition>
    [Unitary Change of Variables Operator]<label|def:unitary_transform>Let
    <math|g:I\<to\>J> be a <math|C<rsup|1>> bijection between intervals with
    <math|g<rprime|'><around|(|y|)>\<gtr\>0> almost everywhere. For
    <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>, define the unitary change of
    variables operator <math|T<rsub|g>> by:

    <\equation>
      <label|eq:unitary_transform><around|(|T<rsub|g>*f|)><around|(|y|)>=f<around|(|g<around|(|y|)>|)><sqrt|g<rprime|'><around|(|y|)>>
    </equation>
  </definition>

  <\theorem>
    [<math|L<rsup|2>> Norm Preservation]<label|thm:l2_preservation>Under the
    conditions of Definition<nbsp><reference|def:unitary_transform>, the
    operator <math|T<rsub|g>:L<rsup|2><around|(|J,d*x|)>\<to\>L<rsup|2><around|(|I,d*y|)>>
    is an isometric isomorphism. Specifically:

    <\equation>
      <label|eq:norm_equality><around|\<\|\|\>|T<rsub|g>*f|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>
    </equation>
  </theorem>

  <\proof>
    For <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>, compute directly:

    <align|<tformat|<table|<row|<cell|<around|\<\|\|\>|T<rsub|g>*f|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>><rsup|2>>|<cell|=<big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)><sqrt|g<rprime|'><around|(|y|)>>|\|><rsup|2>*<space|0.17em>d*y<eq-number><label|eq:norm_calc1>>>|<row|<cell|>|<cell|=<big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>|\|><rsup|2>*g<rprime|'><around|(|y|)>*<space|0.17em>d*y<eq-number><label|eq:norm_calc2>>>>>>

    By the change of variables formula from
    Theorem<nbsp><reference|thm:diff_bijective> with
    <math|x=g<around|(|y|)>>:

    <\equation>
      <label|eq:change_vars_apply><big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>*<around|\||<rsup|2>g<rprime|'><around|(|y|)>*<space|0.17em>d*y=<big|int><rsub|J>|\|>*f<around|(|x|)>|\|><rsup|2>*<space|0.17em>d*x=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>><rsup|2>
    </equation>

    Therefore:

    <\equation>
      <label|eq:final_norm><around|\<\|\|\>|T<rsub|g>*f|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>
    </equation>

    The fact that <math|T<rsub|g>*f\<in\>L<rsup|2><around|(|I,d*y|)>> follows
    immediately from equation<nbsp><eqref|eq:final_norm> and the assumption
    <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>.

    To show <math|T<rsub|g>> is an isomorphism, we verify bijectivity.
    Injectivity follows from the positivity of
    <math|<sqrt|g<rprime|'><around|(|y|)>>> almost everywhere: if
    <math|T<rsub|g>*f<rsub|1>=T<rsub|g>*f<rsub|2>>, then
    <math|f<rsub|1><around|(|g<around|(|y|)>|)>=f<rsub|2><around|(|g<around|(|y|)>|)>>
    a.e., which implies <math|f<rsub|1>=f<rsub|2>> since <math|g> is
    surjective. For surjectivity, given <math|h\<in\>L<rsup|2><around|(|I,d*y|)>>,
    define <math|f<around|(|x|)>=h<around|(|g<rsup|-1><around|(|x|)>|)>/<sqrt|g<rprime|'><around|(|g<rsup|-1><around|(|x|)>|)>>>.
    Then <math|f\<in\>L<rsup|2><around|(|J,d*x|)>> and <math|T<rsub|g>*f=h>.
  </proof>

  <\theorem>
    [Necessity of Square Root Unitary Transformation]<label|thm:necessity>Let
    <math|g:I\<to\>J> be as in Theorem<nbsp><reference|thm:l2_preservation>.
    If <math|\<phi\>:I\<to\>\<bbb-R\><rsup|+>> is any measurable function
    such that <math|f<around|(|g<around|(|y|)>|)>*\<phi\><around|(|y|)>\<in\>L<rsup|2><around|(|I,d*y|)>>
    and

    <\equation>
      <label|eq:general_norm><around|\<\|\|\>|f<around|(|g|(>\<cdot\><around|)||)>*\<phi\>|(>\<cdot\><around|)||\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>
    </equation>

    for all <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>, then
    <math|\<phi\><around|(|y|)>=<sqrt|g<rprime|'><around|(|y|)>>> almost
    everywhere.
  </theorem>

  <\proof>
    From the norm condition in equation<nbsp><eqref|eq:general_norm>:

    <\equation>
      <label|eq:phi_condition><big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>*<around|\||<rsup|2>\<phi\><around|(|y|)><rsup|2>*<space|0.17em>d*y=<big|int><rsub|J>|\|>*f<around|(|x|)>|\|><rsup|2>*<space|0.17em>d*x
    </equation>

    Using the change of variables <math|x=g<around|(|y|)>> on the right side:

    <\equation>
      <label|eq:phi_comparison><big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>*<around|\||<rsup|2>\<phi\><around|(|y|)><rsup|2>*<space|0.17em>d*y=<big|int><rsub|I>|\|>*f<around|(|g<around|(|y|)>|)>|\|><rsup|2>*g<rprime|'><around|(|y|)>*<space|0.17em>d*y
    </equation>

    This gives:

    <\equation>
      <label|eq:phi_difference><big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>|\|><rsup|2>*<around|(|\<phi\><around|(|y|)><rsup|2>-g<rprime|'><around|(|y|)>|)>*<space|0.17em>d*y=0
    </equation>

    Since this holds for all <math|f\<in\>L<rsup|2><around|(|J,d*x|)>> and
    the composition <math|f<around|(|g|(>\<cdot\><around|)||)>> generates a
    dense subspace of <math|L<rsup|2><around|(|I,g<rprime|'><around|(|y|)>*<space|0.17em>d*y|)>>,
    the fundamental lemma of calculus of variations implies:

    <\equation>
      <label|eq:phi_ae_equal>\<phi\><around|(|y|)><rsup|2>=g<rprime|'><around|(|y|)><space|1em><text|almost
      everywhere>
    </equation>

    Taking <math|\<phi\><around|(|y|)>\<gtr\>0>, one obtains
    <math|\<phi\><around|(|y|)>=<sqrt|g<rprime|'><around|(|y|)>>> almost
    everywhere.
  </proof>

  <section|Conclusion>

  The results establish a comprehensive theory of unitary change-of-variables
  operators on <math|L<rsup|2>> spaces. The general framework shows that
  unitarity requires measurable bijections modulo null sets, mutual absolute
  continuity, and weight functions given by square roots of Radon-Nikodym
  derivatives. For <math|L<rsup|2>> norm preservation under measurable
  bijections, the scaling factor <math|<sqrt|g<rprime|'>>> is both necessary
  and sufficient for isometry, linking the change-of-variables formula to
  unitary structure on <math|L<rsup|2>> spaces. The key requirement that the
  function be both strictly increasing and unbounded ensures that
  transformations between unbounded domains preserve the unbounded nature of
  the range, which is essential for the applicability of the theory to
  problems in ergodic theory and functional analysis.

  <\thebibliography|9>
    <bibitem|petersen1989ergodic>K. Petersen, <em|Ergodic Theory>, Cambridge
    Studies in Advanced Mathematics, Cambridge University Press, 1989.

    <bibitem|halmos1956lectures>P. R. Halmos, <em|Lectures on Ergodic
    Theory>, Chelsea Publishing Company, 1956.

    <bibitem|walters1982introduction>P. Walters, <em|An Introduction to
    Ergodic Theory>, Graduate Texts in Mathematics, Springer-Verlag, 1982.

    <bibitem|reed1980functional>M. Reed and B. Simon, <em|Methods of Modern
    Mathematical Physics I: Functional Analysis>, Academic Press, 1980.
  </thebibliography>

  \;
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|5>>
    <associate|auto-5|<tuple|5|6>>
    <associate|auto-6|<tuple|5|6>>
    <associate|bib-halmos1956lectures|<tuple|halmos1956lectures|6>>
    <associate|bib-petersen1989ergodic|<tuple|petersen1989ergodic|6>>
    <associate|bib-reed1980functional|<tuple|reed1980functional|6>>
    <associate|bib-walters1982introduction|<tuple|walters1982introduction|6>>
    <associate|def:cov-operator|<tuple|1|2>>
    <associate|def:unitary_transform|<tuple|6|5>>
    <associate|eq:change_vars|<tuple|16|4>>
    <associate|eq:change_vars_apply|<tuple|21|5>>
    <associate|eq:final_norm|<tuple|22|5>>
    <associate|eq:general_norm|<tuple|23|5>>
    <associate|eq:isometry|<tuple|3|2>>
    <associate|eq:measure-condition|<tuple|7|2>>
    <associate|eq:norm_calc1|<tuple|19|5>>
    <associate|eq:norm_calc2|<tuple|20|5>>
    <associate|eq:norm_equality|<tuple|18|5>>
    <associate|eq:phi_ae_equal|<tuple|27|6>>
    <associate|eq:phi_comparison|<tuple|25|6>>
    <associate|eq:phi_condition|<tuple|24|6>>
    <associate|eq:phi_difference|<tuple|26|6>>
    <associate|eq:unitary_transform|<tuple|17|5>>
    <associate|lem:monotone|<tuple|3|3>>
    <associate|thm:bijective_unbounded|<tuple|4|4>>
    <associate|thm:diff_bijective|<tuple|5|4>>
    <associate|thm:l2_preservation|<tuple|7|5>>
    <associate|thm:main|<tuple|2|2>>
    <associate|thm:necessity|<tuple|8|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>General
      Framework: Unitary Change-of-Variables Operators>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Bijective
      Transformations on Unbounded Domains>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc><with|mode|<quote|math>|L<rsup|2>>
      Norm Preservation Under Lebesgue Measure>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>