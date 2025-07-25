<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|L2 Norm Preservation Under Monotonic
  Substitutions>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\theorem>
    [L2 Norm Preservation via Square Root Jacobian Factor] Let
    <math|g:I\<to\>J> be a strictly monotonic and differentiable function
    between intervals <math|I,J\<subseteq\>\<bbb-R\>> (possibly unbounded),
    with <math|g<rprime|'><around|(|y|)>\<neq\>0> for all <math|y\<in\>I>.
    For any <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>, define the transformed
    function <math|<wide|f|~>:I\<to\>\<bbb-C\>> by

    <\equation*>
      <wide|f|~><around|(|y|)>=f<around|(|g<around|(|y|)>|)><sqrt|<around|\||g<rprime|'><around|(|y|)>|\|>>.
    </equation*>

    Then <math|<wide|f|~>\<in\>L<rsup|2><around|(|I,d*y|)>> and

    <\equation*>
      <around|\<\|\|\>|<wide|f|~>|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>.
    </equation*>
  </theorem>

  <\proof>
    Without loss of generality, assume <math|g> is strictly increasing (the
    decreasing case follows by considering <math|-g>).

    First, establish the change of variables formula. For any measurable set
    <math|E\<subseteq\>J>:

    <\equation*>
      <big|int><rsub|E><around|\||f<around|(|x|)>*<around|\||<rsup|2><space|0.17em>d*x=<big|int><rsub|g<rsup|-1><around|(|E|)>>|\|>*f<around|(|g<around|(|y|)>|)><around|\||<rsup|2>|\|>*g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y.
    </equation*>

    This follows from the standard change of variables theorem, since
    <math|g> is strictly monotonic and differentiable with
    <math|g<rprime|'><around|(|y|)>\<neq\>0>.

    To handle potentially unbounded intervals, consider the norm computation:

    <\align>
      <tformat|<table|<row|<cell|<around|\<\|\|\>|<wide|f|~>|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>><rsup|2>>|<cell|=<big|int><rsub|I><around|\||<wide|f|~><around|(|y|)>|\|><rsup|2>*<space|0.17em>d*y<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)><sqrt|<around|\||g<rprime|'><around|(|y|)>|\|>>|\|><rsup|2>*<space|0.17em>d*y<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)><around|\||<rsup|2>|\|>*g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y.<eq-number>>>>>
    </align>

    By the change of variables formula applied to <math|J=g<around|(|I|)>>:

    <\equation*>
      <big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)><around|\||<rsup|2>|\|>*g<rprime|'><around|(|y|)>*<around|\||<space|0.17em>d*y=<big|int><rsub|J>|\|>*f<around|(|x|)>|\|><rsup|2>*<space|0.17em>d*x=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>><rsup|2>.
    </equation*>

    For unbounded intervals, this equality holds by the monotone convergence
    theorem: approximate <math|I> by an increasing sequence of bounded
    intervals <math|I<rsub|n>*\<uparrow\>*I>, apply the result to each
    <math|I<rsub|n>>, and take the limit.

    Therefore:

    <\equation*>
      <around|\<\|\|\>|<wide|f|~>|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>.
    </equation*>

    The integrability of <math|<wide|f|~>> follows immediately from the norm
    equality and the assumption that <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>.
  </proof>

  <\lemma>
    [Density of Transformed Functions] Under the conditions of Theorem 1, the
    set <math|<around|{|f<around|(|g|(>\<cdot\><around|)||)>:f\<in\>L<rsup|2><around|(|J,d*x|)>|}>>
    is dense in <math|L<rsup|2><around|(|I,<around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y|)>>,
    where <math|L<rsup|2><around|(|I,<around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y|)>>
    denotes the space of square-integrable functions with respect to the
    measure <math|<around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y>.
  </lemma>

  <\proof>
    The map <math|f\<mapsto\>f\<circ\>g> is an isometric isomorphism from
    <math|L<rsup|2><around|(|J,d*x|)>> to
    <math|L<rsup|2><around|(|I,<around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y|)>>
    by the change of variables formula. Since
    <math|L<rsup|2><around|(|J,d*x|)>> is complete, its image under an
    isometry is also complete, hence dense in itself.
  </proof>

  <\theorem>
    [Necessity of Square Root Factor] Under the same conditions as Theorem 1,
    the factor <math|<sqrt|<around|\||g<rprime|'><around|(|y|)>|\|>>> is
    necessary for L2 norm preservation. That is, if
    <math|h<around|(|y|)>=f<around|(|g<around|(|y|)>|)>\<cdot\>\<phi\><around|(|y|)>>
    for some measurable function <math|\<phi\>:I\<to\>\<bbb-R\><rsup|+>>
    satisfies <math|<around|\<\|\|\>|h|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>>
    for all <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>, then
    <math|\<phi\><around|(|y|)>=<sqrt|<around|\||g<rprime|'><around|(|y|)>|\|>>>
    almost everywhere.
  </theorem>

  <\proof>
    Suppose <math|<around|\<\|\|\>|f<around|(|g|(>\<cdot\><around|)||)>\<cdot\>\<phi\>|(>\<cdot\><around|)||\<\|\|\>><rsub|L<rsup|2><around|(|I,d*y|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>>>
    for all <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>.

    Then for any <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>:

    <\equation*>
      <big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)><around|\||<rsup|2>|\|>*\<phi\><around|(|y|)>*<around|\||<rsup|2><space|0.17em>d*y=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*x|)>><rsup|2>=<big|int><rsub|I>|\|>*f<around|(|g<around|(|y|)>|)><around|\||<rsup|2>|\|>*g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y,
    </equation*>

    where the second equality follows from the change of variables formula.

    Therefore:

    <\equation*>
      <big|int><rsub|I><around|\||f<around|(|g<around|(|y|)>|)>|\|><rsup|2>*<around|(|<around|\||\<phi\><around|(|y|)>|\|><rsup|2>-<around|\||g<rprime|'><around|(|y|)>|\|>|)>*<space|0.17em>d*y=0
    </equation*>

    for all <math|f\<in\>L<rsup|2><around|(|J,d*x|)>>.

    By Lemma 1, functions of the form <math|f<around|(|g<around|(|y|)>|)>>
    are dense in <math|L<rsup|2><around|(|I,<around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y|)>>.
    For any <math|u\<in\>L<rsup|2><around|(|I,<around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y|)>>,
    there exists a sequence <math|f<rsub|n>\<in\>L<rsup|2><around|(|J,d*x|)>>
    such that <math|f<rsub|n><around|(|g<around|(|y|)>|)>\<to\>u<around|(|y|)>>
    in <math|L<rsup|2><around|(|I,<around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y|)>>.

    Since <math|<around|\||\<phi\><around|(|y|)>|\|><rsup|2>-<around|\||g<rprime|'><around|(|y|)>|\|>>
    is integrable with respect to <math|<around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y>
    (by the boundedness of the norm-preserving property), we have:

    <\equation*>
      <big|int><rsub|I><around|\||u<around|(|y|)>|\|><rsup|2>*<around|(|<around|\||\<phi\><around|(|y|)>|\|><rsup|2>-<around|\||g<rprime|'><around|(|y|)>|\|>|)>*<space|0.17em>d*y=0
    </equation*>

    for all <math|u\<in\>L<rsup|2><around|(|I,<around|\||g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y|)>>.

    In particular, taking <math|u<around|(|y|)>=<text|sgn><around|(|<around|\||\<phi\><around|(|y|)>|\|><rsup|2>-<around|\||g<rprime|'><around|(|y|)>|\|>|)>\<cdot\><with|math-font-family|bf|1><rsub|<around|{|<around|\||\<phi\><around|(|y|)>|\|><rsup|2>\<neq\><around|\||g<rprime|'><around|(|y|)>|\|>|}>><around|(|y|)>>,
    we obtain:

    <\equation*>
      <big|int><rsub|I><around|\|||\|>*\<phi\><around|(|y|)>*<around|\||<rsup|2>-<around|\||g<rprime|'><around|(|y|)><around|\|||\|><space|0.17em>|\|>*g<rprime|'><around|(|y|)>|\|>*<space|0.17em>d*y=0.
    </equation*>

    Since <math|<around|\||g<rprime|'><around|(|y|)>|\|>\<gtr\>0> almost
    everywhere, this implies <math|<around|\||\<phi\><around|(|y|)>|\|><rsup|2>=<around|\||g<rprime|'><around|(|y|)>|\|>>
    almost everywhere.

    Taking <math|\<phi\><around|(|y|)>\<gtr\>0>, we conclude
    <math|\<phi\><around|(|y|)>=<sqrt|<around|\||g<rprime|'><around|(|y|)>|\|>>>
    almost everywhere.
  </proof>

  <\theorem>
    [Extension to General Measures] Let <math|\<mu\>> and <math|\<nu\>> be
    <math|\<sigma\>>-finite measures on <math|I> and <math|J> respectively,
    and let <math|g:I\<to\>J> be a measurable bijection. If
    <math|\<nu\>=\<mu\>\<circ\>g<rsup|-1>> (i.e.,
    <math|\<nu\><around|(|E|)>=\<mu\><around|(|g<rsup|-1><around|(|E|)>|)>>
    for all measurable <math|E\<subseteq\>J>), then for
    <math|f\<in\>L<rsup|2><around|(|J,d*\<nu\>|)>>:

    <\equation*>
      <wide|f|~><around|(|y|)>=f<around|(|g<around|(|y|)>|)><sqrt|<frac|d*<around|(|\<mu\>\<circ\>g<rsup|-1>|)>|d*\<mu\>><around|(|y|)>>
    </equation*>

    satisfies <math|<around|\<\|\|\>|<wide|f|~>|\<\|\|\>><rsub|L<rsup|2><around|(|I,d*\<mu\>|)>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|J,d*\<nu\>|)>>>,
    where <math|<frac|d*<around|(|\<mu\>\<circ\>g<rsup|-1>|)>|d*\<mu\>>> is
    the Radon-Nikodym derivative.
  </theorem>

  <\proof>
    When <math|\<mu\>> and <math|\<nu\>> are both Lebesgue measure and
    <math|g> is differentiable, the Radon-Nikodym derivative is
    <math|<around|\||g<rprime|'><around|(|y|)>|\|>>, reducing to Theorem 1.
    The general case follows by the same change of variables argument using
    the definition of the pushforward measure.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>