<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Pushforward and Pullback Operations in Measure
  Theory>|<doc-date|>>

  <section|Introduction>

  Pushforward and pullback operations constitute essential techniques in
  measure theory, enabling the transfer of measures and functions between
  measurable spaces via measurable transformations. These constructs are
  fundamentally connected to the behavior of <math|\<sigma\>>-algebras and
  the preservation of measurability under mapping, providing indispensable
  tools for analysis, probability theory, and related fields.

  <section|Preliminaries>

  <\definition>
    Let <math|<around|(|X,\<cal-A\>|)>> and <math|<around|(|Y,\<cal-B\>|)>>
    be measurable spaces, meaning <math|X> and <math|Y> are sets, and
    <math|\<cal-A\>,\<cal-B\>> are <math|\<sigma\>>-algebras of subsets of
    <math|X> and <math|Y>, respectively. A map <math|f:X\<to\>Y> is said to
    be <em|measurable> if for all <math|B\<in\>\<cal-B\>>, the preimage
    <math|f<rsup|-1><around|(|B|)>\<in\>\<cal-A\>>.
  </definition>

  Let <math|\<mu\>> be a measure on <math|<around|(|X,\<cal-A\>|)>> and
  <math|\<nu\>> a measure on <math|<around|(|Y,\<cal-B\>|)>>.

  <section|The Pushforward (Image) Measure>

  <\definition>
    [Pushforward Measure] Let <math|f:X\<to\>Y> be a measurable function and
    <math|<around|(|X,\<cal-A\>,\<mu\>|)>> a measure space. The
    <em|pushforward> (or image) measure <math|f<rsub|\<ast\>>*\<mu\>> on
    <math|<around|(|Y,\<cal-B\>|)>> is defined by

    <\equation>
      <around|(|f<rsub|\<ast\>>*\<mu\>|)><around|(|B|)>=\<mu\><around|(|f<rsup|-1><around|(|B|)>|)>\<forall\>B\<in\>\<cal-B\>
    </equation>
  </definition>

  <\theorem>
    Let <math|<around|(|X,\<cal-A\>,\<mu\>|)>> be a measure space,
    <math|f:X\<to\>Y> a measurable function, and
    <math|<around|(|Y,\<cal-B\>|)>> a measurable space. Then
    <math|f<rsub|\<ast\>>*\<mu\>> is a measure on
    <math|<around|(|Y,\<cal-B\>|)>>.
  </theorem>

  <\proof>
    It suffices to verify the properties of a measure:

    <\enumerate>
      <item><em|Non-negativity>:\ 

      <\equation>
        <around|(|f<rsub|\<ast\>>*\<mu\>|)><around|(|B|)>=\<mu\><around|(|f<rsup|-1><around|(|B|)>|)>\<geq\>0\<forall\>B\<in\>\<cal-B\>
      </equation>

      \ since <math|\<mu\>> is a measure.

      <item><em|Null empty set>:

      <\equation>
        <around|(|f<rsub|\<ast\>>*\<mu\>|)><around|(|\<emptyset\>|)>=\<mu\><around|(|f<rsup|-1><around|(|\<emptyset\>|)>|)>=\<mu\><around|(|\<emptyset\>|)>=0
      </equation>

      <item><em|Countable additivity>: Let
      <math|<around|(|B<rsub|n>|)><rsub|n\<in\>\<bbb-N\>>\<subset\>\<cal-B\>>
      be pairwise disjoint. Then

      <\equation>
        <tabular*|<tformat|<cwith|1|-1|2|2|cell-halign|l>|<table|<row|<cell|<around|(|f<rsub|\<ast\>>*\<mu\>|)><around*|(|<big|cup><rsub|n=1><rsup|\<infty\>>B<rsub|n>|)>>|<cell|=\<mu\><around*|(|f<rsup|-1><around*|(|<big|cup><rsub|n=1><rsup|\<infty\>>B<rsub|n>|)>|)>>>|<row|<cell|>|<cell|=\<mu\><around*|(|<big|cup><rsub|n=1><rsup|\<infty\>>f<rsup|-1><around|(|B<rsub|n>|)>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=1><rsup|\<infty\>>\<mu\><around|(|f<rsup|-1><around|(|B<rsub|n>|)>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=1><rsup|\<infty\>><around|(|f<rsub|\<ast\>>*\<mu\>|)><around|(|B<rsub|n>|)>>>>>>
      </equation>

      where the third equality uses measurability of <math|f> and the fact
      that preimages preserve unions and disjointness.
    </enumerate>

    Thus, <math|f<rsub|\<ast\>>*\<mu\>> is a measure.
  </proof>

  <\remark>
    If <math|\<mu\>> is a probability measure, then so is
    <math|f<rsub|\<ast\>>*\<mu\>>. In this context,
    <math|f<rsub|\<ast\>>*\<mu\>> describes the distribution of the random
    variable <math|f> induced by <math|\<mu\>>.
  </remark>

  <section|The Pullback Operation for Measurable Functions>

  The pullback operation allows the transfer of functions and, in more
  elaborate contexts, measures across measurable spaces.

  <\definition>
    [Pullback of a Function] Let <math|f:X\<to\>Y> be a measurable function
    and <math|g:Y\<to\>\<bbb-R\>> a <math|\<cal-B\>>-measurable function. The
    <em|pullback> of <math|g> along <math|f>, denoted
    <math|f<rsup|\<ast\>>*g>, is defined by

    <\equation>
      f<rsup|\<ast\>>*g\<assign\>g\<circ\>f,<space|1em>x\<mapsto\>g<around|(|f<around|(|x|)>|)>
    </equation>

    for <math|x\<in\>X>.
  </definition>

  <\theorem>
    If <math|g:Y\<to\>\<bbb-R\>> is <math|\<cal-B\>>-measurable and
    <math|f:X\<to\>Y> is <math|\<cal-A\>>-<math|\<cal-B\>>-measurable, then
    <math|f<rsup|\<ast\>>*g=g\<circ\>f> is <math|\<cal-A\>>-measurable.
  </theorem>

  <\proof>
    Let <math|B\<in\>\<cal-B\><around|(|\<bbb-R\>|)>>, the Borel
    <math|\<sigma\>>-algebra on <math|\<bbb-R\>>. Then

    <\equation>
      <around|(|f<rsup|\<ast\>>*g|)><rsup|-1><around|(|B|)>=<around|{|x\<in\>X:g<around|(|f<around|(|x|)>|)>\<in\>B|}>=f<rsup|-1><around|(|g<rsup|-1><around|(|B|)>|)>
    </equation>

    Since <math|g> is <math|\<cal-B\>>-measurable,
    <math|g<rsup|-1><around|(|B|)>\<in\>\<cal-B\>>. Since <math|f> is
    <math|\<cal-A\>>-<math|\<cal-B\>>-measurable,
    <math|f<rsup|-1><around|(|g<rsup|-1><around|(|B|)>|)>\<in\>\<cal-A\>>.
    Thus, <math|f<rsup|\<ast\>>*g> is <math|\<cal-A\>>-measurable.
  </proof>

  <section|Pullback of a Measure: Theoretical Caveat>

  Generally, the pullback of a measure via a function is not always well
  defined. In particular, given a measure <math|\<nu\>> on
  <math|<around|(|Y,\<cal-B\>|)>> and a measurable <math|f:X\<to\>Y>, the set
  function

  <\equation>
    \<mu\><around|(|A|)>\<assign\>\<nu\><around|(|f<around|(|A|)>|)>\<forall\>A\<in\>\<cal-A\>
  </equation>

  is not, in general, a measure. Issues arise due to the failure of countable
  additivity unless <math|f> is injective or further structure is present.

  <\remark>
    A legitimate pullback of measures (under the name <em|inverse image
    measure>) exists in the context of differentiable manifolds, or via the
    theory of signed measures and distributions, but not in general for
    arbitrary measure spaces.
  </remark>

  <section|The Push-Pull Formula (Change of Variables)>

  <\theorem>
    [Pushforward and Integration (Change of Variables)] Let
    <math|<around|(|X,\<cal-A\>,\<mu\>|)>> be a measure space,
    <math|<around|(|Y,\<cal-B\>|)>> a measurable space, and <math|f:X\<to\>Y>
    a measurable map. Let <math|g:Y\<to\><around|[|0,+\<infty\>|]>> be
    <math|\<cal-B\>>-measurable. Then

    <\equation>
      <big|int><rsub|Y>g*<space|0.17em>d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>=<big|int><rsub|X>g\<circ\>f*<space|0.17em>d*\<mu\>
    </equation>
  </theorem>

  <\proof>
    Consider first <math|g=<with|math-font-family|bf|1><rsub|B>> for
    <math|B\<in\>\<cal-B\>>. Then

    <\equation>
      <big|int><rsub|Y><with|math-font-family|bf|1><rsub|B>*<space|0.17em>d*<around|(|f<rsub|\<ast\>>*\<mu\>|)>=<around|(|f<rsub|\<ast\>>*\<mu\>|)><around|(|B|)>=\<mu\><around|(|f<rsup|-1><around|(|B|)>|)>=<big|int><rsub|X><with|math-font-family|bf|1><rsub|f<rsup|-1><around|(|B|)>>*<space|0.17em>d*\<mu\>=<big|int><rsub|X><around|(|<with|math-font-family|bf|1><rsub|B>\<circ\>f|)>*<space|0.17em>d*\<mu\>
    </equation>

    By linearity and monotone convergence, the result extends to all
    non-negative <math|\<cal-B\>>-measurable functions <math|g>.
  </proof>

  <section|Interrelationships and Further Properties>

  <\proposition>
    The assignments <math|f\<mapsto\>f<rsub|\<ast\>>> and
    <math|g\<mapsto\>f<rsup|\<ast\>>*g> are functorial in the sense that

    <\enumerate>
      <item>For measurable maps <math|f:X\<to\>Y> and <math|g:Y\<to\>Z>,
      <math|<around|(|g\<circ\>f|)><rsub|\<ast\>>=g<rsub|\<ast\>>\<circ\>f<rsub|\<ast\>>>
      as assignments on measures.

      <item>For measurable maps <math|f:X\<to\>Y> and <math|g:Y\<to\>Z>,
      <math|<around|(|g\<circ\>f|)><rsup|\<ast\>>=f<rsup|\<ast\>>\<circ\>g<rsup|\<ast\>>>
      as assignments on functions.
    </enumerate>
  </proposition>

  <\proof>
    \;

    <\enumerate>
      <item>Let <math|\<mu\>> be a measure on <math|X>. For
      <math|C\<in\>\<cal-C\>> (where <math|\<cal-C\>> is a
      <math|\<sigma\>>-algebra on <math|Z>):

      <\equation>
        <tabular|<tformat|<table|<row|<cell|<around|(|<around|(|g\<circ\>f|)><rsub|\<ast\>>*\<mu\>|)><around|(|C|)>>|<cell|=\<mu\><around|(|<around|(|g\<circ\>f|)><rsup|-1><around|(|C|)>|)>>>|<row|<cell|>|<cell|=\<mu\><around|(|f<rsup|-1><around|(|g<rsup|-1><around|(|C|)>|)>|)>>>|<row|<cell|>|<cell|=<around|(|f<rsub|\<ast\>>*\<mu\>|)><around|(|g<rsup|-1><around|(|C|)>|)>>>|<row|<cell|>|<cell|=<around|(|g<rsub|\<ast\>>*f<rsub|\<ast\>>*\<mu\>|)><around|(|C|)>>>>>>
      </equation>

      <item>Let <math|h:Z\<to\>\<bbb-R\>>. Then for <math|x\<in\>X>,

      <\equation>
        <tabular|<tformat|<table|<row|<cell|<around|(|g\<circ\>f|)><rsup|\<ast\>>*h<around|(|x|)>>|<cell|=h<around|(|g<around|(|f<around|(|x|)>|)>|)>>>|<row|<cell|>|<cell|=<around|(|g<rsup|\<ast\>>*h|)><around|(|f<around|(|x|)>|)>>>|<row|<cell|>|<cell|=f<rsup|\<ast\>>*<around|(|g<rsup|\<ast\>>*h|)><around|(|x|)>>>>>>
      </equation>
    </enumerate>
  </proof>

  <section|Conclusion>

  Pushforward and pullback operations are pivotal in connecting the
  structures of different measurable spaces via measurable functions. The
  pushforward provides a mechanism to transfer measures in a functorial and
  natural way, while the pullback appropriately lifts functions, preserving
  measurability. The integration change-of-variables formula encapsulates the
  deep relationship between these operations, forming a cornerstone of modern
  analysis.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-3|<tuple|3|1|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-4|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-5|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-6|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-7|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-8|<tuple|8|4|../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Pushforward (Image) Measure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Pullback Operation for Measurable Functions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Pullback
      of a Measure: Theoretical Caveat> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>The
      Push-Pull Formula (Change of Variables)>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Interrelationships
      and Further Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>