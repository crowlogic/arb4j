<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  \<cdot\><doc-data|<doc-title|Unitary Bijections From Strictly Increasing
  Functions On The Real Line>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|This paper establishes the fundamental connection
  between unitary bijections in <math|L<rsup|2>> spaces and
  measure-preserving transformations through weighted composition operators
  on unbounded domains. The investigation demonstrates that for
  <math|C<rsup|1>> bijective transformations <math|g:I\<to\>J> between
  unbounded intervals with positive derivative almost everywhere,
  <math|L<rsup|2>> norm preservation is achieved through the unitary change
  of variables operator <math|T<rsub|g>*f=f<around|(|g<around|(|y|)>|)><sqrt|g<rprime|'><around|(|y|)>>>.
  The analysis proves that strictly increasing functions on unbounded domains
  yield bijective mappings onto unbounded ranges, providing the foundation
  for well-defined changes of variables in Lebesgue integration. The central
  result shows that the operator <math|T<rsub|g>:L<rsup|2><around|(|J,d*x|)>\<to\>L<rsup|2><around|(|I,d*y|)>>
  constitutes an isometric isomorphism, with the square root of the Jacobian
  <math|<sqrt|g<rprime|'><around|(|y|)>>> serving as the unique scaling
  factor necessary for norm preservation. The necessity of this specific
  scaling is rigorously established through variational arguments,
  demonstrating that any alternative weighting function achieving the same
  isometric property must equal <math|<sqrt|g<rprime|'><around|(|y|)>>>
  almost everywhere. These findings bridge the change-of-variables formula in
  real analysis with the unitary structure of <math|L<rsup|2>> spaces,
  providing theoretical foundations for applications in ergodic theory and
  functional analysis on unbounded domains.>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Bijective
    Transformations on Unbounded Domains>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc><with|mode|math|L<rsup|2>>
    Norm Preservation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  This short note establishes the fundamental relationship between unitary
  bijections in <math|L<rsup|2>> spaces and measure-preserving
  transformations in ergodic theory. Under bijective <math|C<rsup|1>> changes
  of variables on unbounded domains, <math|L<rsup|2>> norm preservation is
  achieved by a weighted composition operator whose weight is the square root
  of the Jacobian <math|g<rprime|'>>. This unitary transformation is both
  necessary and sufficient.

  <section|Bijective Transformations on Unbounded Domains>

  <\theorem>
    <dueto|Bijectivity of Strictly Increasing Functions on Unbounded
    Domains><label|thm:bijective_unbounded>Let <math|g:I\<to\>\<bbb-R\>> be a
    strictly increasing function where <math|I\<subseteq\>\<bbb-R\>> is an
    unbounded interval. Then <math|g> is bijective onto its range
    <math|J=g<around|(|I|)>>, and <math|J> is also an unbounded interval.
  </theorem>

  <\proof>
    Since <math|g> is strictly increasing, injectivity is immediate. For any
    <math|x<rsub|1>,x<rsub|2>\<in\>I> with <math|x<rsub|1>\<less\>x<rsub|2>>,
    one has <math|g<around|(|x<rsub|1>|)>\<less\>g<around|(|x<rsub|2>|)>>.

    For surjectivity onto <math|J=g<around|(|I|)>>, let <math|y\<in\>J>. By
    definition, there exists <math|x\<in\>I> such that
    <math|g<around|(|x|)>=y>. The uniqueness of such <math|x> follows from
    injectivity.

    To establish that <math|J> is unbounded, consider two cases:

    <\enumerate>
      <item>If <math|I=<around|(|a,\<infty\>|)>> or
      <math|I=<around|[|a,\<infty\>|)>> for some <math|a\<in\>\<bbb-R\>>,
      then as <math|x\<to\>\<infty\>>, since <math|g> is strictly increasing,
      either <math|g<around|(|x|)>\<to\>\<infty\>> or <math|g<around|(|x|)>>
      approaches some finite supremum. If the latter held, then by the
      intermediate value theorem and strict monotonicity, <math|g> would map
      <math|<around|(|a,\<infty\>|)>> to some bounded interval, contradicting
      the strict increase property over an unbounded domain.

      <item>If <math|I=<around|(|-\<infty\>,b|)>> or
      <math|I=<around|(|-\<infty\>,b|]>>, a similar argument shows <math|J>
      extends to <math|-\<infty\>>.

      <item>If <math|I=\<bbb-R\>>, then <math|J> must be unbounded in both
      directions.
    </enumerate>

    Therefore, <math|g:I\<to\>J> is bijective with both <math|I> and <math|J>
    unbounded intervals.
  </proof>

  <\theorem>
    <dueto|Differentiable Bijections with Positive
    Derivative><label|thm:diff_bijective>Let <math|g:I\<to\>J> be a
    <math|C<rsup|1>> bijection between unbounded intervals
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
      <label|eq:change_vars><big|int><rsub|J>f<around|(|x|)>*<space|0.17em>d*x=<big|int><rsub|I>f<around|(|g<around|(|y|)>|)><around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y=<big|int><rsub|I>f<around|(|g<around|(|y|)>|)>*g<rprime|'><around|(|y|)>*<space|0.17em>d*y
    </equation>

    where the last equality uses <math|g<rprime|'><around|(|y|)>\<gtr\>0>
    almost everywhere. The points where <math|g<rprime|'><around|(|y|)>=0>
    form a set of measure zero and do not affect the integral.
  </proof>

  <section|<math|L<rsup|2>> Norm Preservation>

  <\definition>
    <dueto|Unitary Change of Variables Operator><label|def:unitary_transform>Let
    <math|g:I\<to\>J> be a <math|C<rsup|1>> bijection between unbounded
    intervals with <math|g<rprime|'><around|(|y|)>\<gtr\>0> almost
    everywhere. For <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>, define the
    unitary change of variables operator <math|T<rsub|g>> by:

    <\equation>
      <label|eq:unitary_transform><around|(|T<rsub|g>*f|)><around|(|y|)>=f<around|(|g<around|(|y|)>|)><sqrt|g<rprime|'><around|(|y|)>>
    </equation>
  </definition>

  <\theorem>
    <dueto|<math|L<rsup|2>> Norm Preservation for Unbounded
    Domains><label|thm:l2_preservation>Under the conditions of
    Definition<nbsp><reference|def:unitary_transform>, the operator
    <math|T<rsub|g>:L<rsup|2><around|(|J,d*x|)>\<to\>L<rsup|2><around|(|I,d*y|)>>
    is an isometric isomorphism. Specifically:

    <\equation>
      <label|eq:norm_equality><around|\<\|\|\>|T<rsub|g>*f|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>
    </equation>
  </theorem>

  <\proof>
    For <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>, compute directly:

    <\align>
      <tformat|<table|<row|<cell|<around|\<\|\|\>|T<rsub|g>*f|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>><rsup|2>>|<cell|=<big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)><sqrt|g<rprime|'><around|(|y|)>>|\|><rsup|2>*<space|0.17em>d*y<eq-number><label|eq:norm_calc1>>>|<row|<cell|>|<cell|=<big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>|\|><rsup|2>*g<rprime|'><around|(|y|)>*<space|0.17em>d*y<eq-number><label|eq:norm_calc2>>>>>
    </align>

    By the change of variables formula from
    Theorem<nbsp><reference|thm:diff_bijective> with
    <math|x=g<around|(|y|)>>:

    <\equation>
      <label|eq:change_vars_apply><big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>*<around|\||<rsup|2>g<rprime|'><around|(|y|)>*<space|0.17em>d*y=<big|int><rsub|J>|\|>*f<around|(|x|)>|\|><rsup|2>*<space|0.17em>d*x=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>><rsup|2>
    </equation>

    Since both <math|I> and <math|J> are unbounded, the change of variables
    is justified by approximating with bounded subintervals and applying the
    monotone convergence theorem.

    Therefore:

    <\equation>
      <label|eq:final_norm><around|\<\|\|\>|T<rsub|g>*f|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>
    </equation>

    The fact that <math|T<rsub|g>*f\<in\>L<rsup|2><around|(|I,d*y|)>> follows
    immediately from equation<nbsp><eqref|eq:final_norm> and the assumption
    <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>.
  </proof>

  <\theorem>
    <dueto|Necessity of Square Root Unitary
    Transformation><label|thm:necessity>Let <math|g:I\<to\>J> be as in
    Theorem<nbsp><reference|thm:l2_preservation>. If
    <math|\<phi\>:I\<to\>\<bbb-R\><rsup|+>> is any measurable function such
    that <math|f<around|(|g<around|(|y|)>|)>*\<phi\><around|(|y|)>\<in\>L<rsup|2><around|(|I,d*y|)>>
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
      <label|eq:phi_ae_equal>\<phi\><around|(|y|)><rsup|2>=g<rprime|'><around|(|y|)><text|almost
      everywhere>
    </equation>

    Taking <math|\<phi\><around|(|y|)>\<gtr\>0>, one obtains
    <math|\<phi\><around|(|y|)>=<sqrt|g<rprime|'><around|(|y|)>>> almost
    everywhere.
  </proof>

  <section|Conclusion>

  The results show that <math|L<rsup|2>> norm preservation under
  <math|C<rsup|1>> bijections is realized by the weighted composition
  operator <math|T<rsub|g>*f=f<around|(|g<around|(|y|)>|)><sqrt|g<rprime|'><around|(|y|)>>>.
  The factor <math|<sqrt|g<rprime|'>>> is both necessary and sufficient for
  isometry, linking the change-of-variables formula to unitary structure on
  <math|L<rsup|2>>.

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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-3|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-4|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|auto-5|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|bib-halmos1956lectures|<tuple|halmos1956lectures|4|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|bib-petersen1989ergodic|<tuple|petersen1989ergodic|4|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|bib-reed1980functional|<tuple|reed1980functional|4|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|bib-walters1982introduction|<tuple|walters1982introduction|4|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|def:unitary_transform|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:change_vars|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:change_vars_apply|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:final_norm|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:general_norm|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:norm_calc1|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:norm_calc2|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:norm_equality|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:phi_ae_equal|<tuple|12|4|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:phi_comparison|<tuple|10|4|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:phi_condition|<tuple|9|4|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:phi_difference|<tuple|11|4|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|eq:unitary_transform|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|thm:bijective_unbounded|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|thm:diff_bijective|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|thm:l2_preservation|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
    <associate|thm:necessity|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_14.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Bijective
      Transformations on Unbounded Domains>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc><with|mode|<quote|math>|L<rsup|2>>
      Norm Preservation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>