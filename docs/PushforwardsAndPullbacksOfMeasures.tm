<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Pushforward and Pullback Operations in Measure
  Theory>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Preliminaries
    and Fundamental Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Pushforward
    Measures> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Pullback
    Operations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Fundamental
    Relationships> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Advanced
    Properties and Applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The pushforward and pullback operations constitute fundamental mechanisms
  in measure theory for transforming measures and <math|\<sigma\>>-algebras
  through measurable mappings. These operations preserve the essential
  structure of measurable spaces while enabling the study of measures on
  different spaces through their relationships via measurable functions.

  <section|Preliminaries and Fundamental Definitions>

  <\definition>
    [Measurable Space and Function] Let <math|<around|(|X,<with|math-font|cal*|A>|)>>
    and <math|<around|(|Y,<with|math-font|cal*|B>|)>> denote measurable
    spaces. A function <math|f:X\<to\>Y> is
    <math|<around|(|<with|math-font|cal*|A>,<with|math-font|cal*|B>|)>>-measurable
    if for every <math|B\<in\><with|math-font|cal*|B>>,
    <math|f<rsup|-1><around|(|B|)>> belongs to
    <math|<with|math-font|cal*|A>>.
  </definition>

  <\definition>
    [Measure Space] A measure space is a triple
    <math|<around|(|X,<with|math-font|cal*|A>,\<mu\>|)>>, where
    <math|<around|(|X,<with|math-font|cal*|A>|)>> is a measurable space and
    <math|\<mu\>:<with|math-font|cal*|A>\<to\><around|[|0,\<infty\>|]>> is a
    measure.
  </definition>

  <section|Pushforward Measures>

  <\definition>
    [Pushforward Measure] Given a measure space
    <math|<around|(|X,<with|math-font|cal*|A>,\<mu\>|)>>, a measurable space
    <math|<around|(|Y,<with|math-font|cal*|B>|)>>, and a
    <math|<around|(|<with|math-font|cal*|A>,<with|math-font|cal*|B>|)>>-measurable
    function <math|f:X\<to\>Y>, the pushforward measure
    <math|f<rsub|\<ast\>>*\<mu\>> is the measure on
    <math|<around|(|Y,<with|math-font|cal*|B>|)>> defined by

    <\equation*>
      f<rsub|\<ast\>>*\<mu\><around|(|B|)>=\<mu\><around*|(|f<rsup|-1><around|(|B|)>|)>,<space|2em>\<forall\>B\<in\><with|math-font|cal*|B>.
    </equation*>
  </definition>

  <\theorem>
    [Well-definedness of the Pushforward Measure] For any
    <math|<around|(|<with|math-font|cal*|A>,<with|math-font|cal*|B>|)>>-measurable
    <math|f:X\<to\>Y>, the pushforward <math|f<rsub|\<ast\>>*\<mu\>> defines
    a measure on <math|<around|(|Y,<with|math-font|cal*|B>|)>>.
  </theorem>

  <\proof>
    The following conditions are verified:

    <\enumerate>
      <item><with|font-shape|italic|Non-negativity:> For every
      <math|B\<in\><with|math-font|cal*|B>>,

      <\equation*>
        f<rsub|\<ast\>>*\<mu\><around|(|B|)>=\<mu\><around*|(|f<rsup|-1><around|(|B|)>|)>\<geq\>0
      </equation*>

      since <math|\<mu\>> is a measure.

      <item><with|font-shape|italic|Null empty set:>

      <\equation*>
        f<rsub|\<ast\>>*\<mu\><around|(|\<emptyset\>|)>=\<mu\><around|(|f<rsup|-1><around|(|\<emptyset\>|)>|)>=\<mu\><around|(|\<emptyset\>|)>=0
      </equation*>

      because <math|f<rsup|-1><around|(|\<emptyset\>|)>=\<emptyset\>>.

      <item><with|font-shape|italic|Countable additivity:> Let
      <math|<around|{|B<rsub|n>|}><rsub|n=1><rsup|\<infty\>>\<subset\><with|math-font|cal*|B>>
      be pairwise disjoint. Observe

      <\equation*>
        f<rsub|\<ast\>>*\<mu\><around*|(|<big|cup><rsub|n=1><rsup|\<infty\>>B<rsub|n>|)>=\<mu\><around*|(|f<rsup|-1><around*|(|<big|cup><rsub|n=1><rsup|\<infty\>>B<rsub|n>|)>|)>=\<mu\><around*|(|<big|cup><rsub|n=1><rsup|\<infty\>>f<rsup|-1><around|(|B<rsub|n>|)>|)>
      </equation*>

      and since the <math|B<rsub|n>> are pairwise disjoint, the
      <math|f<rsup|-1><around|(|B<rsub|n>|)>> are also pairwise disjoint, so

      <\equation*>
        \<mu\><around*|(|<big|cup><rsub|n=1><rsup|\<infty\>>f<rsup|-1><around|(|B<rsub|n>|)>|)>=<big|sum><rsub|n=1><rsup|\<infty\>>\<mu\><around|(|f<rsup|-1><around|(|B<rsub|n>|)>|)>=<big|sum><rsub|n=1><rsup|\<infty\>>f<rsub|\<ast\>>*\<mu\><around|(|B<rsub|n>|)>
      </equation*>
    </enumerate>
  </proof>

  <\theorem>
    [Change of Variables Formula] Let <math|f:X\<to\>Y> be
    <math|<around|(|<with|math-font|cal*|A>,<with|math-font|cal*|B>|)>>-measurable
    and <math|g:Y\<to\><around|[|0,\<infty\>|]>> be
    <math|<with|math-font|cal*|B>>-measurable. Then

    <\equation*>
      <big|int><rsub|Y>g*<space|0.17em>d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>=<big|int><rsub|X><around|(|g\<circ\>f|)>*<space|0.17em>d*\<mu\>
    </equation*>
  </theorem>

  <\proof>
    Proceed by the standard construction of the Lebesgue integral using
    simple functions.

    <\enumerate>
      <item>Let <math|g=\<chi\><rsub|B>> for
      <math|B\<in\><with|math-font|cal*|B>>. Then

      <\align*>
        <tformat|<table|<row|<cell|<big|int><rsub|Y>\<chi\><rsub|B>*<space|0.17em>d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>>|<cell|=f<rsub|\<ast\>>*\<mu\><around|(|B|)>=\<mu\><around|(|f<rsup|-1><around|(|B|)>|)>=<big|int><rsub|X>\<chi\><rsub|f<rsup|-1><around|(|B|)>>*<space|0.17em>d*\<mu\>>>|<row|<cell|>|<cell|=<big|int><rsub|X>\<chi\><rsub|B><around|(|f<around|(|x|)>|)>*<space|0.17em>d*\<mu\><around|(|x|)>=<big|int><rsub|X><around|(|\<chi\><rsub|B>\<circ\>f|)>*<space|0.17em>d*\<mu\>>>>>
      </align*>

      <item>Given <math|g=<big|sum><rsub|i=1><rsup|n>a<rsub|i>*\<chi\><rsub|B<rsub|i>>>
      with <math|a<rsub|i>\<geq\>0>, <math|B<rsub|i>\<in\><with|math-font|cal*|B>>,
      pairwise disjoint,

      <\align*>
        <tformat|<table|<row|<cell|<big|int><rsub|Y>g*<space|0.17em>d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>>|<cell|=<big|sum><rsub|i=1><rsup|n>a<rsub|i>*f<rsub|\<ast\>>*\<mu\><around|(|B<rsub|i>|)>=<big|sum><rsub|i=1><rsup|n>a<rsub|i>*\<mu\><around|(|f<rsup|-1><around|(|B<rsub|i>|)>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|n>a<rsub|i>*<big|int><rsub|X>\<chi\><rsub|f<rsup|-1><around|(|B<rsub|i>|)>>*<space|0.17em>d*\<mu\>=<big|int><rsub|X><big|sum><rsub|i=1><rsup|n>a<rsub|i>*\<chi\><rsub|f<rsup|-1><around|(|B<rsub|i>|)>>*<space|0.17em>d*\<mu\>>>|<row|<cell|>|<cell|=<big|int><rsub|X><around|(|g\<circ\>f|)>*<space|0.17em>d*\<mu\>>>>>
      </align*>

      <item>For a general non-negative measurable <math|g>, there exists an
      increasing sequence <math|<around|(|g<rsub|n>|)>> of simple functions
      <math|g<rsub|n>*\<uparrow\>*g> pointwise. The Monotone Convergence
      Theorem gives

      <\equation*>
        <big|int><rsub|Y>g*<space|0.17em>d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>=lim<rsub|n\<to\>\<infty\>>
        <big|int><rsub|Y>g<rsub|n>*<space|0.17em>d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>=lim<rsub|n\<to\>\<infty\>>
        <big|int><rsub|X><around|(|g<rsub|n>\<circ\>f|)>*<space|0.17em>d*\<mu\>=<big|int><rsub|X><around|(|g\<circ\>f|)>*<space|0.17em>d*\<mu\>
      </equation*>
    </enumerate>

    The formula thus holds for all non-negative measurable <math|g>. For
    general real-valued <math|g>, split into positive and negative parts.
  </proof>

  <section|Pullback Operations>

  <\definition>
    [Pullback of a <math|\<sigma\>>-Algebra] Given measurable spaces
    <math|<around|(|X,<with|math-font|cal*|A>|)>> and
    <math|<around|(|Y,<with|math-font|cal*|B>|)>>, and any function
    <math|f:X\<to\>Y>, define

    <\equation*>
      f<rsup|\<ast\>>*<with|math-font|cal*|B>\<assign\><around|{|f<rsup|-1><around|(|B|)>:B\<in\><with|math-font|cal*|B>|}>
    </equation*>

    The collection <math|f<rsup|\<ast\>>*<with|math-font|cal*|B>> is a
    <math|\<sigma\>>-algebra on <math|X>.
  </definition>

  <\theorem>
    Let <math|f:X\<to\>Y> be arbitrary and <math|<with|math-font|cal*|B>> a
    <math|\<sigma\>>-algebra on <math|Y>. Then
    <math|f<rsup|\<ast\>>*<with|math-font|cal*|B>> is a
    <math|\<sigma\>>-algebra on <math|X>.
  </theorem>

  <\proof>
    The properties are checked as follows:

    <\enumerate>
      <item><math|X\<in\>f<rsup|\<ast\>>*<with|math-font|cal*|B>> since
      <math|Y\<in\><with|math-font|cal*|B>> and
      <math|f<rsup|-1><around|(|Y|)>=X>.

      <item><math|f<rsup|\<ast\>>*<with|math-font|cal*|B>> is closed under
      complementation. If <math|A=f<rsup|-1><around|(|B|)>\<in\>f<rsup|\<ast\>>*<with|math-font|cal*|B>>
      for <math|B\<in\><with|math-font|cal*|B>>, then
      <math|A<rsup|c>=<around|(|f<rsup|-1><around|(|B|)>|)><rsup|c>=f<rsup|-1><around|(|B<rsup|c>|)>>,
      and <math|B<rsup|c>\<in\><with|math-font|cal*|B>> as
      <math|<with|math-font|cal*|B>> is a <math|\<sigma\>>-algebra.

      <item><math|f<rsup|\<ast\>>*<with|math-font|cal*|B>> is closed under
      countable unions. If <math|A<rsub|n>=f<rsup|-1><around|(|B<rsub|n>|)>>
      with <math|B<rsub|n>\<in\><with|math-font|cal*|B>>, then

      <\equation*>
        <big|cup><rsub|n=1><rsup|\<infty\>>A<rsub|n>=<big|cup><rsub|n=1><rsup|\<infty\>>f<rsup|-1><around|(|B<rsub|n>|)>=f<rsup|-1><around*|(|<big|cup><rsub|n=1><rsup|\<infty\>>B<rsub|n>|\<nobracket\>>
      </equation*>

      and <math|<big|cup><rsub|n=1><rsup|\<infty\>>B<rsub|n>\<in\><with|math-font|cal*|B>>.
    </enumerate>
  </proof>

  <\definition>
    [Pullback Measure] Let <math|<around|(|Y,<with|math-font|cal*|B>,\<nu\>|)>>
    be a measure space, and <math|f:X\<to\>Y> a measurable function. The
    pullback measure <math|f<rsup|\<ast\>>*\<nu\>> is a measure defined on
    <math|f<rsup|\<ast\>>*<with|math-font|cal*|B>> by

    <\equation*>
      f<rsup|\<ast\>>*\<nu\><around|(|A|)>=\<nu\><around|(|B|)><space|2em><text|for
      >A=f<rsup|-1><around|(|B|)>,B\<in\><with|math-font|cal*|B>
    </equation*>

    provided this is well-defined, i.e., if
    <math|A=f<rsup|-1><around|(|B<rsub|1>|)>=f<rsup|-1><around|(|B<rsub|2>|)>>
    implies <math|\<nu\><around|(|B<rsub|1>|)>=\<nu\><around|(|B<rsub|2>|)>>.
  </definition>

  <\theorem>
    [Well-definedness and Properties of Pullback Measure] If
    <math|A=f<rsup|-1><around|(|B<rsub|1>|)>=f<rsup|-1><around|(|B<rsub|2>|)>>
    with <math|B<rsub|1>,B<rsub|2>\<in\><with|math-font|cal*|B>>, then
    <math|B<rsub|1>,B<rsub|2>> may differ outside <math|f<around|(|X|)>>. The
    pullback <math|f<rsup|\<ast\>>*\<nu\>> is well-defined if and only if
    <math|\<nu\>> is supported on <math|f<around|(|X|)>>. In general, for
    each <math|A=f<rsup|-1><around|(|B|)>>, set

    <\equation*>
      f<rsup|\<ast\>>*\<nu\><around|(|A|)>=\<nu\>*<around*|(|B\<cap\>f<around|(|X|)>|)>
    </equation*>

    This restores well-definedness and <math|f<rsup|\<ast\>>*\<nu\>> is then
    a measure on <math|f<rsup|\<ast\>>*<with|math-font|cal*|B>>.
  </theorem>

  <\proof>
    Let <math|A=f<rsup|-1><around|(|B<rsub|1>|)>=f<rsup|-1><around|(|B<rsub|2>|)>>
    for <math|B<rsub|1>,B<rsub|2>\<in\><with|math-font|cal*|B>>. Then
    <math|f<rsup|-1>*<around|(|B<rsub|1>*\<Delta\>*B<rsub|2>|)>=\<emptyset\>>,
    so <math|<around|(|B<rsub|1>*\<Delta\>*B<rsub|2>|)>\<cap\>f<around|(|X|)>=\<emptyset\>>,
    i.e. <math|B<rsub|1>\<cap\>f<around|(|X|)>=B<rsub|2>\<cap\>f<around|(|X|)>>.
    If <math|\<nu\>> is supported on <math|f<around|(|X|)>>, then
    <math|\<nu\><around|(|B<rsub|1>|)>=\<nu\><around|(|B<rsub|2>|)>>. More
    generally, replacing <math|B> with <math|B\<cap\>f<around|(|X|)>> ensures
    uniqueness.
  </proof>

  <section|Fundamental Relationships>

  <\theorem>
    [Composition of Pushforwards] Let <math|f:X\<to\>Y> and <math|g:Y\<to\>Z>
    be <math|<around|(|<with|math-font|cal*|A>,<with|math-font|cal*|B>|)>>-
    and <math|<around|(|<with|math-font|cal*|B>,<with|math-font|cal*|C>|)>>-measurable
    respectively. Then, for any measure <math|\<mu\>> on
    <math|<around|(|X,<with|math-font|cal*|A>|)>>,

    <\equation*>
      <around|(|g\<circ\>f|)><rsub|\<ast\>>*\<mu\>=g<rsub|\<ast\>>*<around|(|f<rsub|\<ast\>>*\<mu\>|)>.
    </equation*>
  </theorem>

  <\proof>
    For any <math|C\<in\><with|math-font|cal*|C>>,

    <\align*>
      <tformat|<table|<row|<cell|<around|(|g\<circ\>f|)><rsub|\<ast\>>*\<mu\><around|(|C|)>>|<cell|=\<mu\><around|(|<around|(|g\<circ\>f|)><rsup|-1><around|(|C|)>|)>=\<mu\><around|(|f<rsup|-1><around|(|g<rsup|-1><around|(|C|)>|)>|)>>>|<row|<cell|>|<cell|=f<rsub|\<ast\>>*\<mu\><around|(|g<rsup|-1><around|(|C|)>|)>=g<rsub|\<ast\>>*<around|(|f<rsub|\<ast\>>*\<mu\>|)><around|(|C|)>>>>>
    </align*>
  </proof>

  <\theorem>
    [Adjunction Property] Let <math|<around|(|X,<with|math-font|cal*|A>,\<mu\>|)>>
    be a measure space, <math|<around|(|Y,<with|math-font|cal*|B>|)>> a
    measurable space, <math|f:X\<to\>Y> measurable, and
    <math|h:X\<to\><around|[|0,\<infty\>|]>> an
    <math|<with|math-font|cal*|A>>-measurable function. Then the following
    are equivalent:

    <\enumerate>
      <item>There exists a <math|<with|math-font|cal*|B>>-measurable function
      <math|g:Y\<to\><around|[|0,\<infty\>|]>> such that <math|h=g\<circ\>f>
      <math|\<mu\>>-almost everywhere,

      <item>For every <math|B\<in\><with|math-font|cal*|B>>,

      <\equation*>
        <big|int><rsub|f<rsup|-1><around|(|B|)>>h*<space|0.17em>d*\<mu\>=<big|int><rsub|B>g*<space|0.17em>d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>.
      </equation*>
    </enumerate>
  </theorem>

  <\proof>
    Assume (1). Then

    <\equation*>
      <big|int><rsub|f<rsup|-1><around|(|B|)>>h*<space|0.17em>d*\<mu\>=<big|int><rsub|f<rsup|-1><around|(|B|)>>g\<circ\>f*<space|0.17em>d*\<mu\>=<big|int><rsub|B>g*<space|0.17em>d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>
    </equation*>

    by the change of variables formula.

    Assume (2). Define the measure <math|\<nu\><around|(|E|)>\<assign\><big|int><rsub|f<rsup|-1><around|(|E|)>>h*<space|0.17em>d*\<mu\>>
    on <math|<with|math-font|cal*|B>>. Since this measure is absolutely
    continuous with respect to <math|f<rsub|\<ast\>>*\<mu\>>, the
    Radon-Nikodym theorem applies and yields a
    <math|<with|math-font|cal*|B>>-measurable <math|g> with
    <math|d*\<nu\>/d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>=g>. It holds that
    for <math|B\<in\><with|math-font|cal*|B>>,

    <\equation*>
      <big|int><rsub|B>g*<space|0.17em>d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>=\<nu\><around|(|B|)>=<big|int><rsub|f<rsup|-1><around|(|B|)>>h*<space|0.17em>d*\<mu\>
    </equation*>

    For any <math|A\<in\><with|math-font|cal*|A>>, set
    <math|B=f<around|(|A|)>> and the analogous relation expresses
    <math|h=g\<circ\>f> almost everywhere where <math|g> is the Radon-Nikodym
    derivative of <math|\<nu\>> with respect to
    <math|f<rsub|\<ast\>>*\<mu\>>.

    More explicitly, for <math|E\<in\><with|math-font|cal*|A>>, using
    <math|\<mu\><around|(|E|)>> and integrating <math|h> over <math|E>, the
    set <math|f<around|(|E|)>> is <math|<with|math-font|cal*|B>>-measurable
    and, by the disintegration theorem (for probability measures),
    <math|h<around|(|x|)>> is the pullback under <math|f> of <math|g>,
    <math|\<mu\>>-a.e.
  </proof>

  <section|Advanced Properties and Applications>

  <\theorem>
    [Pushforward of Absolutely Continuous Measures] Let
    <math|\<mu\>,\<lambda\>> be <math|\<sigma\>>-finite measures on
    <math|<around|(|X,<with|math-font|cal*|A>|)>> with
    <math|\<mu\>\<ll\>\<lambda\>>, and let <math|f:X\<to\>Y> be
    <math|<around|(|<with|math-font|cal*|A>,<with|math-font|cal*|B>|)>>-measurable.
    Then <math|f<rsub|\<ast\>>*\<mu\>\<ll\>f<rsub|\<ast\>>*\<lambda\>> on
    <math|<around|(|Y,<with|math-font|cal*|B>|)>>.
  </theorem>

  <\proof>
    Let <math|B\<in\><with|math-font|cal*|B>> with
    <math|f<rsub|\<ast\>>*\<lambda\><around|(|B|)>=0>. Then
    <math|\<lambda\><around|(|f<rsup|-1><around|(|B|)>|)>=0>. As
    <math|\<mu\>\<ll\>\<lambda\>>, <math|\<mu\><around|(|f<rsup|-1><around|(|B|)>|)>=0>,
    i.e., <math|f<rsub|\<ast\>>*\<mu\><around|(|B|)>=0>. Thus,
    <math|f<rsub|\<ast\>>*\<mu\>\<ll\>f<rsub|\<ast\>>*\<lambda\>>.
  </proof>

  <\theorem>
    [Radon-Nikodym Theorem under Pushforward] Let
    <math|<around|(|X,<with|math-font|cal*|A>,\<lambda\>|)>> be a
    <math|\<sigma\>>-finite measure space, and <math|f:X\<to\>Y> be
    <math|<around|(|<with|math-font|cal*|A>,<with|math-font|cal*|B>|)>>-measurable.
    Suppose <math|\<mu\>\<ll\>\<lambda\>>, so that there exists a
    Radon-Nikodym derivative <math|h=<frac|d*\<mu\>|d*\<lambda\>>>. Then

    <\equation*>
      f<rsub|\<ast\>>*\<mu\>\<ll\>f<rsub|\<ast\>>*\<lambda\>
    </equation*>

    and the Radon-Nikodym derivative <math|<frac|d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>|d*<around|(|f<rsub|\<ast\>>*\<lambda\>|)>>>
    is given (in the case <math|f> is countable-to-one or
    <math|f<rsub|\<ast\>>*\<lambda\>> is <math|\<sigma\>>-finite) by

    <\equation*>
      <frac|d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>|d*<around|(|f<rsub|\<ast\>>*\<lambda\>|)>><around|(|y|)>=<big|int><rsub|f<rsup|-1><around|(|y|)>>h<around|(|x|)>*<space|0.17em>d*\<lambda\><rsub|y><around|(|x|)>
    </equation*>

    where <math|\<lambda\><rsub|y>> is the disintegration of
    <math|\<lambda\>> over <math|f> at <math|y>, or, more generally,

    <\equation*>
      <frac|d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>|d*<around|(|f<rsub|\<ast\>>*\<lambda\>|)>><around|(|y|)>=\<bbb-E\><rsub|\<lambda\>>*<around|[|h<space|0.17em>\|<space|0.17em>f=y|]>
    </equation*>
  </theorem>

  <\proof>
    Let <math|B\<in\><with|math-font|cal*|B>>. Then

    <\equation*>
      f<rsub|\<ast\>>*\<mu\><around|(|B|)>=\<mu\><around|(|f<rsup|-1><around|(|B|)>|)>=<big|int><rsub|f<rsup|-1><around|(|B|)>>h*<space|0.17em>d*\<lambda\>=<big|int><rsub|B><around*|(|<big|int><rsub|f<rsup|-1><around|(|<around|{|y|}>|)>>h<around|(|x|)>*<space|0.17em>d*\<lambda\><rsub|y><around|(|x|)>|)>*d*<around|(|f<rsub|\<ast\>>*\<lambda\>|)><around|(|y|)>.
    </equation*>

    Thus, by the Radon-Nikodym theorem,

    <\equation*>
      <frac|d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>|d*<around|(|f<rsub|\<ast\>>*\<lambda\>|)>><around|(|y|)>=<big|int><rsub|f<rsup|-1><around|(|y|)>>h<around|(|x|)>*<space|0.17em>d*\<lambda\><rsub|y><around|(|x|)>
    </equation*>

    Here, <math|\<lambda\><rsub|y>> is a regular conditional probability
    measure induced by <math|f> and <math|\<lambda\>>. This formula is
    justified by the disintegration theorem for <math|\<sigma\>>-finite
    measures.

    If <math|f> is countable-to-one and <math|\<lambda\>> is counting
    measure, then

    <\equation*>
      <frac|d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>|d*<around|(|f<rsub|\<ast\>>*\<lambda\>|)>><around|(|y|)>=<big|sum><rsub|x\<in\>f<rsup|-1><around|(|y|)>>h<around|(|x|)>
    </equation*>

    In the more general setting, the conditional expectation interpretation
    holds:

    <\equation*>
      <frac|d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>|d*<around|(|f<rsub|\<ast\>>*\<lambda\>|)>><around|(|y|)>=\<bbb-E\><rsub|\<lambda\>>*<around|[|h\<mid\>f=y|]>
    </equation*>

    where the right side is understood as the conditional expectation of
    <math|h> given <math|f<around|(|x|)>=y>.
  </proof>

  <\corollary>
    [Radon-Nikodym Derivative under Pushforward for Probability Measures] If
    <math|<around|(|X,<with|math-font|cal*|A>,\<lambda\>|)>> is a probability
    space and <math|f:X\<to\>Y> is measurable, then for any probability
    measure <math|\<mu\>\<ll\>\<lambda\>>, with
    <math|h=<frac|d*\<mu\>|d*\<lambda\>>>, the pushforward satisfies

    <\equation*>
      <frac|d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>|d*<around|(|f<rsub|\<ast\>>*\<lambda\>|)>><around|(|y|)>=\<bbb-E\><rsub|\<lambda\>>*<around|[|h\<mid\>f=y|]>,
    </equation*>

    i.e. the conditional expectation of <math|h> given <math|f=y>.
  </corollary>

  <\proof>
    This is a restatement of the result in the theorem above for probability
    measures, using the definition of conditional expectation.
  </proof>

  <section|Conclusion>

  The pushforward and pullback operations provide a systematic framework for
  relating measures and <math|\<sigma\>>-algebras across different measurable
  spaces via measurable mappings. The pushforward measure
  <math|f<rsub|\<ast\>>*\<mu\>> transports a measure from the domain to the
  codomain, preserving foundational properties, and enables the study of
  distributions and transformation of integrals via the change of variables
  formula. The pullback operation <math|f<rsup|\<ast\>>*<with|math-font|cal*|B>>
  provides the minimal <math|\<sigma\>>-algebra structure required for the
  measurability of <math|f>, and the pullback of measures formalizes which
  subsets of the domain are \Pvisible\Q through <math|f> in terms of the
  measure on <math|Y>.

  These constructions are intrinsic to probability theory, analysis, and
  differential geometry, notably for describing the distributions of random
  variables and the measures induced by geometric transformations. The
  detailed interrelations, such as the adjunction property and Radon-Nikodym
  transformations under pushforward, furnish powerful tools for explicit
  computations and a deeper understanding of the structure of
  measure-theoretic transformations.
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
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|3>>
    <associate|auto-5|<tuple|5|4>>
    <associate|auto-6|<tuple|6|5>>
    <associate|auto-7|<tuple|7|7>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries
      and Fundamental Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Pushforward
      Measures> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Pullback
      Operations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Fundamental
      Relationships> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Advanced
      Properties and Applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>