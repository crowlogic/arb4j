<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Invertibility of Oscillatory Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen Crowley Says FUCK
  ANTHROPIC FUCKING SHITCUNTS>>>>

  <section*|Framework>

  Let

  <\equation*>
    X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>,<space|2em>t\<in\>\<bbb-R\>,
  </equation*>

  where

  <\itemize>
    <item><math|A:\<bbb-R\>\<times\>\<bbb-R\>\<to\>\<bbb-C\>> is a
    deterministic amplitude function;

    <item><math|d*Z<around|(|\<lambda\>|)>> is a complex orthogonal increment
    satisfying

    <\equation*>
      \<bbb-E\>*<space|-0.17em><around*|[|d*Z<around|(|\<lambda\><rsub|1>|)><space|0.17em><wide|d*Z<around|(|\<lambda\><rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>*<space|0.17em>\<mu\>*<around|(|d*\<lambda\><rsub|1>|)>
    </equation*>

    in the distributional sense, with <math|\<mu\>> a finite positive
    measure.
  </itemize>

  <section*|Fundamental Invertibility Theorem>

  <\theorem>
    <label|thm:inv>Define

    <\equation*>
      \<cal-I\><around|[|X|]><around|(|\<lambda\>|)>\<assign\><frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|-i*\<lambda\>*t>*<space|0.17em>X<around|(|t|)>*<space|0.17em>d*t.
    </equation*>

    Then <math|\<cal-I\><around|[|X|]><around|(|\<lambda\>|)>=d*Z<around|(|\<lambda\>|)>>
    for every realisation <math|X<around|(|t|)>> <em|if and only if>

    <\enumerate>
      <item><label|cond:nonzero> <math|A<around|(|t,\<lambda\>|)>\<neq\>0>
      for all <math|<around|(|t,\<lambda\>|)>\<in\>\<bbb-R\><rsup|2>>;

      <item><label|cond:ortho> <with|font-series|bold|Kernel orthonormality:>

      <\equation*>
        <frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\><rsub|1>|)>|\<bar\>><space|0.17em>A<around|(|t,\<lambda\><rsub|2>|)>*<space|0.17em>e<rsup|i*<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t>*<space|0.17em>d*t=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>*<space|1em><around|(|\<lambda\><rsub|1>,\<lambda\><rsub|2>\<in\>\<bbb-R\>|)>.
      </equation*>
    </enumerate>

    Moreover, when <eqref|cond:nonzero>\U<eqref|cond:ortho> hold,
    <math|\<cal-I\>> is the unique linear operator that recovers
    <math|d*Z<around|(|\<lambda\>|)>> from <math|X<around|(|t|)>>.
  </theorem>

  Assume <math|\<cal-I\><around|[|X|]>=d*Z<around|(|\<lambda\>|)>> for every
  admissible <math|X<around|(|t|)>>.

  <vspace*|0.5fn><no-indent><with|font-series|bold|Orthogonality.> Fix
  <math|\<lambda\><rsub|0>> and substitute the representation of
  <math|X<around|(|t|)>>:

  <\align*>
    <tformat|<table|<row|<cell|\<cal-I\><around|[|X|]><around|(|\<lambda\><rsub|0>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\><rsub|0>|)>|\<bar\>>e<rsup|-i*\<lambda\><rsub|0>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\><rsub|0>|)>|\<bar\>>A<around|(|t,\<lambda\>|)>*<space|0.17em>e<rsup|i*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>*t>*<space|0.17em>d*t|]>*<space|0.17em>d*Z<around|(|\<lambda\>|)>.>>>>
  </align*>

  Because the left-hand side equals <math|d*Z<around|(|\<lambda\><rsub|0>|)>>
  for <em|all> increment measures, the bracketed factor must equal
  <math|\<delta\>*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>>, yielding
  <eqref|cond:ortho>.

  <vspace*|0.5fn><no-indent><with|font-series|bold|Non-vanishing amplitude.>
  If <math|A<around|(|t<rsub|\<ast\>>,\<lambda\><rsub|\<ast\>>|)>=0> on a
  nontrivial time interval, then observations on that interval contain no
  information about <math|d*Z<around|(|\<lambda\><rsub|\<ast\>>|)>>,
  contradicting perfect recovery; hence <eqref|cond:nonzero> is necessary.

  Assume <eqref|cond:nonzero>\U<eqref|cond:ortho>. For any
  <math|\<lambda\><rsub|0>>,

  <\align*>
    <tformat|<table|<row|<cell|\<cal-I\><around|[|X|]><around|(|\<lambda\><rsub|0>|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\><rsub|0>|)>|\<bar\>>e<rsup|-i*\<lambda\><rsub|0>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*Z<around|(|\<lambda\>|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<delta\>*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)><space|1em><text|(by
    <eqref|cond:ortho>)>>>|<row|<cell|>|<cell|=d*Z<around|(|\<lambda\><rsub|0>|)>.>>>>
  </align*>

  Thus <math|\<cal-I\><around|[|X|]><around|(|\<lambda\>|)>=d*Z<around|(|\<lambda\>|)>>
  for all <math|\<lambda\>>.

  <section*|Uniqueness>

  <\lemma>
    If two linear operators <math|L<rsub|1>,L<rsub|2>> satisfy
    <math|L<rsub|i><around|[|X|]><around|(|\<lambda\>|)>=d*Z<around|(|\<lambda\>|)>>
    for every admissible <math|X>, then <math|L<rsub|1>=L<rsub|2>>.
  </lemma>

  <\proof>
    Set <math|L=L<rsub|1>-L<rsub|2>> and note <math|L<around|[|X|]>=0> for
    all <math|X>. For each fixed <math|\<lambda\><rsub|0>>, define the
    single-component process <math|X<rsub|\<lambda\><rsub|0>><around|(|t|)>\<assign\>A<around|(|t,\<lambda\><rsub|0>|)>*<space|0.17em>e<rsup|i*\<lambda\><rsub|0>*t>*<space|0.17em>d*Z<around|(|\<lambda\><rsub|0>|)>>.
    By <eqref|cond:ortho> these processes span the same class as
    <math|X<around|(|t|)>>, so <math|L<around|[|X<rsub|\<lambda\><rsub|0>>|]>=0>
    for all <math|\<lambda\><rsub|0>>. Linearity then implies
    <math|L\<equiv\>0>.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-2|<tuple|<with|mode|<quote|math>|\<bullet\>>|1|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-3|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|cond:nonzero|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|cond:ortho|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:inv|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_16.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Framework>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Fundamental
      Invertibility Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Uniqueness>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>