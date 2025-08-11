<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|L<rsup|2> Norm Preservation Under Smooth Bijective
  Unbounded Substitutions>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-misc|July 30, 2025>>>|<doc-date|>>

  <\abstract>
    This paper establishes the fundamental connection between unitary
    bijections in <math|L<rsup|2>> spaces and measure-preserving
    transformations through weighted composition operators on unbounded
    domains. The investigation demonstrates that for <math|C<rsup|1>>
    bijective transformations <math|g:I\<to\>J> between unbounded intervals
    with positive derivative almost everywhere, <math|L<rsup|2>> norm
    preservation is achieved through the unitary change of variables operator
    <math|T<rsub|g>*f=f<around|(|g<around|(|y|)>|)><sqrt|g<rprime|'><around|(|y|)>>>.
    The analysis proves that strictly increasing functions on unbounded
    domains yield bijective mappings onto unbounded ranges, providing the
    foundation for well-defined changes of variables in Lebesgue integration.
    The central result shows that the operator
    <math|T<rsub|g>:L<rsup|2><around|(|J,d*x|)>\<to\>L<rsup|2><around|(|I,d*y|)>>
    constitutes an isometric isomorphism, with the square root of the
    Jacobian <math|<sqrt|g<rprime|'><around|(|y|)>>> serving as the unique
    scaling factor necessary for norm preservation. The necessity of this
    specific scaling is rigorously established through variational arguments,
    demonstrating that any alternative weighting function achieving the same
    isometric property must equal <math|<sqrt|g<rprime|'><around|(|y|)>>>
    almost everywhere. These findings bridge the change-of-variables formula
    in real analysis with the unitary structure of <math|L<rsup|2>> spaces,
    providing theoretical foundations for applications in ergodic theory and
    functional analysis on unbounded domains.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Smooth
    Bijective Transformations and <with|mode|math|L<rsup|2>> Norm
    Preservation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Norm-Preserving
    Substitution Operators: Measure-Preservation and Unitarity>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Necessity
    and Canonicality of the Jacobian Weight>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Unitary
    Operators, Invariant Measures, and Measure-Preservation>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  This document concerns the structure of <math|L<rsup|2>>-norm-preserving
  operators induced on <math|L<rsup|2>> spaces by smooth, bijective,
  orientation-preserving substitutions <math|g:I\<to\>J> on (possibly
  unbounded) intervals <math|I,J\<subseteq\>\<bbb-R\>>. The topic is
  fundamental in ergodic theory and operator theory, as it precisely
  characterizes when a substitution operator corresponds to a unitary
  operator, and relates directly to the behavior of measures under
  measure-preserving bijections. The classical result is also crucial for
  understanding the behavior of the <math|L<rsup|2>> norm under change of
  variables. Canonicity and necessity of the Jacobian factor is established,
  and the role of unboundedness is treated from the start.

  <section|Smooth Bijective Transformations and <math|L<rsup|2>> Norm
  Preservation>

  <\definition>
    <label|def:bijectiveC1>Let <math|I,J\<subseteq\>\<bbb-R\>> be (possibly
    unbounded) open intervals. A map <math|g:I\<to\>J> is called a <em|smooth
    bijection> if <math|g> is:

    <\enumerate>
      <item>Bijection between <math|I> and <math|J>,

      <item>Differentiable on <math|I> with
      <math|g<rprime|'><around|(|y|)>\<gtr\>0> for almost every
      <math|y\<in\>I> (i.e., <math|g> is strictly increasing except possibly
      on a set of Lebesgue measure zero).
    </enumerate>
  </definition>

  <\lemma>
    [Bijectivity of Strictly Increasing Unbounded <math|C<rsup|1>>
    Maps]<label|lem:bijective_unbounded> Let <math|I,J\<subseteq\>\<bbb-R\>>
    be (possibly unbounded) open intervals. Suppose <math|g:I\<to\>J> is a
    <math|C<rsup|1>> function with <math|g<rprime|'><around|(|y|)>\<gtr\>0>
    for all <math|y\<in\>I> except possibly a Lebesgue null set, and <math|g>
    is unbounded above and below on <math|I>. Then <math|g> is bijective onto
    <math|J=g<around|(|I|)>>, <math|g<rsup|-1>> exists and is also strictly
    increasing and differentiable a.e.
  </lemma>

  <\proof>
    The function <math|g> is strictly increasing on every subset of <math|I>
    where <math|g<rprime|'><around|(|y|)>\<gtr\>0>; on the (at most
    measure-zero) set where <math|g<rprime|'><around|(|y|)>=0>, <math|g>
    remains monotonic and continuous by <math|C<rsup|1>> regularity. Since
    <math|I> is an interval and <math|g> is continuous and strictly
    increasing almost everywhere, <math|g> is injective by the intermediate
    value property of continuous strictly increasing functions.

    Unboundedness of <math|g> on <math|I> implies that <math|g<around|(|I|)>>
    is also an open interval in <math|\<bbb-R\>> (possibly the whole real
    line), so <math|g:I\<to\>J> is surjective. Thus, <math|g> is bijective
    from <math|I> onto <math|J=g<around|(|I|)>>. Its inverse
    <math|g<rsup|-1>:J\<to\>I> is again continuous, strictly increasing
    (except possibly on a null set), and differentiable almost everywhere by
    the inverse function theorem.
  </proof>

  <section|Norm-Preserving Substitution Operators: Measure-Preservation and
  Unitarity>

  <\theorem>
    [L<rsup|2> Norm Preservation via Jacobian Factor]<label|thm:L2_jacobian>
    Let <math|g:I\<to\>J> be a smooth bijection in the sense of
    Definition<nbsp><reference|def:bijectiveC1>. For any
    <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>, define

    <\equation>
      <label|eq:transformationdef><wide|f|~><around|(|y|)>\<assign\>f<around|(|g<around|(|y|)>|)><sqrt|g<rprime|'><around|(|y|)>>.
    </equation>

    Then <math|<wide|f|~>\<in\>L<rsup|2><around|(|I,d*y|)>> and

    <\equation>
      <label|eq:L2normpres><around|\<\|\|\>|<wide|f|~>|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>.
    </equation>
  </theorem>

  <\proof>
    Since <math|g:I\<to\>J> is bijective, strictly increasing and
    differentiable almost everywhere with
    <math|g<rprime|'><around|(|y|)>\<gtr\>0> a.e., the change of variables
    theorem applies (see e.g., <cite|RoydenFitzpatrick>, <cite|Folland>).

    For any <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>,

    <\align>
      <tformat|<table|<row|<cell|<around|\<\|\|\>|<wide|f|~>|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>><rsup|2>>|<cell|=<big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)><sqrt|g<rprime|'><around|(|y|)>>|\|><rsup|2>*<space|0.17em>d*y<eq-number><label|eq:normexpansion1>>>|<row|<cell|>|<cell|=<big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>|\|><rsup|2>*g<rprime|'><around|(|y|)>*<space|0.17em>d*y<eq-number><label|eq:normexpansion2>>>>>
    </align>

    By the change of variables formula for Lebesgue integrals, for any
    measurable function <math|\<varphi\>> and bijective, strictly increasing
    <math|g> as in Lemma<nbsp><reference|lem:bijective_unbounded>:

    <\equation>
      <label|eq:cov><big|int><rsub|I>\<varphi\><around|(|g<around|(|y|)>|)>*g<rprime|'><around|(|y|)>*<space|0.17em>d*y=<big|int><rsub|J>\<varphi\><around|(|x|)>*<space|0.17em>d*x.
    </equation>

    Setting <math|\<varphi\><around|(|x|)>=<around|\||f<around|(|x|)>|\|><rsup|2>>,
    one obtains

    <\equation>
      <big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>*<around|\||<rsup|2>g<rprime|'><around|(|y|)>*<space|0.17em>d*y=<big|int><rsub|J>|\|>*f<around|(|x|)>|\|><rsup|2>*<space|0.17em>d*x=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>><rsup|2><label|eq:aftercov>
    </equation>

    Thus, <math|<around|\<\|\|\>|<wide|f|~>|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>>
    as claimed.
  </proof>

  <section|Necessity and Canonicality of the Jacobian Weight>

  <\lemma>
    [Density of Substitution Images]<label|lem:L2density> Let
    <math|g:I\<rightarrow\>J> be as in Theorem<nbsp><reference|thm:L2_jacobian>.
    Then the collection <math|<around|{|f\<circ\>g:f\<in\>L<rsup|2><around|(|J,d*x|)>|}>>
    is dense in <math|L<rsup|2><around|(|I,g<rprime|'><around|(|y|)>*<space|0.17em>d*y|)>>.
  </lemma>

  <\proof>
    The transformation <math|T:L<rsup|2><around|(|J,d*x|)>\<to\>L<rsup|2><around|(|I,g<rprime|'><around|(|y|)>*<space|0.17em>d*y|)>>
    defined by <math|T<around|(|f|)>=f\<circ\>g> is an isometric isomorphism
    by the change of variables<nbsp><eqref|eq:cov>. The image of an
    isomorphism from a complete space is itself complete and thus dense.
  </proof>

  <\theorem>
    [Necessity of the Square Root Jacobian Factor]<label|thm:necessity> Let
    <math|g:I\<to\>J> be as above. Suppose
    <math|\<psi\>:I\<to\>\<bbb-R\><rsup|+>> is measurable and for every
    <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>,

    <\equation>
      <label|eq:generalweight><around*|\||f<around|(|g|(>\<cdot\><around|)||)>\<cdot\>\<psi\>|(>\<cdot\><around*|)||\|><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>.
    </equation>

    Then <math|\<psi\><around|(|y|)>=<sqrt|g<rprime|'><around|(|y|)>>> for
    almost every <math|y\<in\>I>.
  </theorem>

  <\proof>
    Suppose <eqref|eq:generalweight> holds for all
    <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>. Compute:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)><around|\||<rsup|2>|\|>*\<psi\><around|(|y|)>|\|><rsup|2>*<space|0.17em>d*y>|<cell|=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>><rsup|2><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>|\|><rsup|2>*g<rprime|'><around|(|y|)>*<space|0.17em>d*y<eq-number><label|eq:proofcov>>>>>
    </align>

    Subtracting, for every <math|f>,

    <\equation>
      <big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>|\|><rsup|2>*<around|(|<around|\||\<psi\><around|(|y|)>|\|><rsup|2>-g<rprime|'><around|(|y|)>|)>*<space|0.17em>d*y=0
    </equation>

    By Lemma<nbsp><reference|lem:L2density>, the set
    <math|<around|{|f<around|(|g<around|(|y|)>|)>|}>> is dense in
    <math|L<rsup|2><around|(|I,g<rprime|'><around|(|y|)>*d*y|)>>. Thus, for
    every <math|u\<in\>L<rsup|2><around|(|I,g<rprime|'><around|(|y|)>*d*y|)>>,

    <\equation>
      <big|int><rsub|I><around|\||u<around|(|y|)>|\|><rsup|2>*<around|(|<around|\||\<psi\><around|(|y|)>|\|><rsup|2>-g<rprime|'><around|(|y|)>|)>*<space|0.17em>d*y=0
    </equation>

    By standard measure-theoretic arguments (cf. <cite|Folland>, p. 70), the
    only way for this to be true for all <math|u> is for
    <math|<around|\||\<psi\><around|(|y|)>|\|><rsup|2>=g<rprime|'><around|(|y|)>>
    almost everywhere. Since <math|\<psi\>> is taken as non-negative,
    <math|\<psi\><around|(|y|)>=<sqrt|g<rprime|'><around|(|y|)>>> a.e.
  </proof>

  <section|Unitary Operators, Invariant Measures, and Measure-Preservation>

  <\definition>
    [Koopman Operator]<label|def:koopman> Let
    <math|<around|(|X,\<cal-B\>,\<mu\>|)>> be a probability measure space,
    <math|T:X\<rightarrow\>X> a measurable bijection, and <math|\<mu\>> a
    <math|T>-invariant measure: for all <math|A\<in\>\<cal-B\>>,
    <math|\<mu\>*<around|(|T<rsup|-1>*A|)>=\<mu\><around|(|A|)>>. The
    <em|Koopman operator> <math|U<rsub|T>> is defined for measurable
    <math|f:X\<to\>\<bbb-C\>> by

    <\equation>
      <label|eq:koopman><around|(|U<rsub|T>*f|)><around|(|x|)>=f*<around|(|T*x|)>.
    </equation>
  </definition>

  <\theorem>
    [Unitarity Corresponds to Measure-Preservation]<label|thm:measurepreserving_unitary>
    The Koopman operator <math|U<rsub|T>> on
    <math|L<rsup|2><around|(|X,\<mu\>|)>> is unitary if and only if <math|T>
    is invertible and both <math|T> and <math|T<rsup|-1>> preserve the
    measure <math|\<mu\>>.
  </theorem>

  <\proof>
    If <math|T> is invertible and <math|\<mu\>> is <math|T>-invariant,

    <\equation*>
      <around|\<\|\|\>|U<rsub|T>*f|\<\|\|\>><rsub|L<rsup|2><around|(|X,\<mu\>|)>><rsup|2>=<big|int><rsub|X><around|\||f*<around|(|T*x|)>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|x|)>=<big|int><rsub|X><around|\||f<around|(|x|)>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|x|)>
    </equation*>

    where the last equality is by change of variables
    <math|x=T<rsup|-1><around|(|y|)>> and measure-preservation, so
    <math|U<rsub|T>> is an isometry. Surjectivity follows from invertibility
    of <math|T> and surjectivity of <math|L<rsup|2>> composition. Conversely,
    if <math|U<rsub|T>> is unitary, then the above identity must hold for all
    <math|f>. Choosing indicator functions of sets <math|A>, it follows that
    <math|\<mu\><around|(|T<rsup|-1><around|(|A|)>|)>=\<mu\><around|(|A|)>>,
    so <math|T> preserves the measure.
  </proof>

  <section|Bibliography>

  <\thebibliography|99>
    <bibitem|RoydenFitzpatrick>H. L. Royden and P. M. Fitzpatrick, <em|Real
    Analysis>, Fourth Edition, Pearson, 2010.

    <bibitem|Folland>G. B. Folland, <em|Real Analysis: Modern Techniques and
    Their Applications>, Second Edition, Wiley, 1999.

    <bibitem|Walters>P. Walters, <em|An Introduction to Ergodic Theory>,
    Springer, 1982.

    <bibitem|Halmos>P. R. Halmos, <em|Measure Theory>, Springer, 1974.

    <bibitem|EinsiedlerWard>M. Einsiedler and T. Ward, <em|Ergodic Theory
    with a View Towards Number Theory>, Springer, 2011.
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
    <associate|auto-1|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-3|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-4|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-5|<tuple|5|4|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-6|<tuple|6|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-7|<tuple|6|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|bib-EinsiedlerWard|<tuple|EinsiedlerWard|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|bib-Folland|<tuple|Folland|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|bib-Halmos|<tuple|Halmos|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|bib-RoydenFitzpatrick|<tuple|RoydenFitzpatrick|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|bib-Walters|<tuple|Walters|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|def:bijectiveC1|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|def:koopman|<tuple|6|4|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:L2normpres|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:aftercov|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:cov|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:generalweight|<tuple|7|4|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:koopman|<tuple|12|4|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:normexpansion1|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:normexpansion2|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:proofcov|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:transformationdef|<tuple|1|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|lem:L2density|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|lem:bijective_unbounded|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|thm:L2_jacobian|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|thm:measurepreserving_unitary|<tuple|7|5|../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|thm:necessity|<tuple|5|4|../.TeXmacs/texts/scratch/no_name_14.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      RoydenFitzpatrick

      Folland

      Folland
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Smooth
      Bijective Transformations and <with|mode|<quote|math>|L<rsup|2>> Norm
      Preservation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Norm-Preserving
      Substitution Operators: Measure-Preservation and Unitarity>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Necessity
      and Canonicality of the Jacobian Weight>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Unitary
      Operators, Invariant Measures, and Measure-Preservation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>