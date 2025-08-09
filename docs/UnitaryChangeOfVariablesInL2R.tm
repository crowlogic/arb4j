<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <doc-data|<doc-title|Unitary Change-of-Variables Operators on
  <math|L<rsup|2><around|(|\<bbb-R\>|)>>>|<doc-date|>>

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
    <math|>

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

    where <math|<around|(|T<rsub|\<ast\>>*\<nu\>|)><around|(|A|)>=\<nu\><around|(|T<rsup|-1><around|(|A|)>|)>>
    for measurable sets <math|A>.

    From equation<nbsp><eqref|eq:isometry>, we require

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

    This requires\ 

    <\equation>
      <around|\||w<around|(|x|)>|\|><rsup|2>=\<rho\><around|(|T<around|(|x|)>|)><rsup|-1>
    </equation>

    \ almost everywhere. By the chain rule for Radon-Nikodym derivatives,

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
    fact that for such maps, <math|>

    <\equation>
      <frac|d*<around|(|\<mu\>\<circ\>T|)>|d*\<mu\>><around|(|x|)>=<around|\||T<rprime|'><around|(|x|)>|\|>
    </equation>

    \ by the classical change-of-variables theorem.
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
    <associate|def:cov-operator|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:isometry|<tuple|3|1|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:measure-condition|<tuple|6|2|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|lem:monotone|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|thm:main|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_14.tm>>
  </collection>
</references>