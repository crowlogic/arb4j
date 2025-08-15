<TeXmacs|2.1.4>

<style|<tuple|article|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-title|Invertibility of Oscillatory
  Processes>|<doc-date|>>

  <section|Oscillatory Gaussian Processes>

  <\definition>
    An oscillatory process <math|X<around|(|t|)>> in Priestley's sense has
    the integral representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|A<around|(|t,\<lambda\>|)>> is the time-varying amplitude
    function and <math|d*Z<around|(|\<lambda\>|)>> is an orthogonal increment
    process with

    <\equation>
      E*<around|[|d*Z<around|(|\<lambda\><rsub|1>|)><wide|d*Z<around|(|\<lambda\><rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>*\<mu\>*<around|(|d*\<lambda\><rsub|1>|)>
    </equation>

    for some measure <math|\<mu\>>.
  </definition>

  <subsection|Invertibility Conditions>

  <\theorem>
    [Fundamental Invertibility Theorem] The oscillatory process
    <math|X<around|(|t|)>> with amplitude <math|A<around|(|t,\<lambda\>|)>>
    allows the expression of the associated complex orthogonal random measure

    <\equation>
      d*Z<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>*X<around|(|t|)>*<space|0.17em>d*t
    </equation>

    \ from a sample path realization <math|X<around|(|t|)>> if and only if:

    <\enumerate>
      <item><math|A<around|(|t,\<lambda\>|)>\<neq\>0\<forall\>><math|<around|(|t,\<lambda\>|)>>
      in the relevant domain

      \;

      and

      \;

      <item>The orthogonality condition holds:

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\><rsub|1>|)>|\<bar\>>A<around|(|t,\<lambda\><rsub|2>|)>*e<rsup|i*<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t>*<space|0.17em>d*t=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)><label|ortho>
      </equation>
    </enumerate>
  </theorem>

  <\proof>
    From the representation\ 

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    , one seeks to obtain the expression for
    <math|d*Z<around|(|\<lambda\>|)>>. The orthogonality condition
    (<reference|ortho>) ensures that the kernel functions form an orthonormal
    system. This allows the projection of <math|X<around|(|t|)>> onto each
    frequency component.Multiply both sides by
    <math|<wide|A<around|(|t,\<lambda\><rsub|0>|)>|\<bar\>>e<rsup|-i*\<lambda\><rsub|0>*t>>
    and integrate over <math|t>

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\><rsub|0>|)>|\<bar\>>e<rsup|-i*\<lambda\><rsub|0>*t>*X<around|(|t|)>*<space|0.17em>d*t>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\><rsub|0>|)>|\<bar\>>e<rsup|-i*\<lambda\><rsub|0>*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\><rsub|0>|)>|\<bar\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>*t>*<space|0.17em>d*t|]>*d*Z<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<delta\>*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>d*Z<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=\<mathd\>
      Z<around*|(|\<lambda\><rsub|0>|)>>>>>><label|inv>
    </equation>

    where the second-to-last equality is due to\ 

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|A<around|(|t,\<lambda\><rsub|0>|)>|\<bar\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>*t>*<space|0.17em>d*t=\<delta\>*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>
    </equation>

    which yields <math|d*Z<around|(|\<lambda\><rsub|0>|)>> after application
    of the elementary Dirac delta function identity.
  </proof>

  <\lemma>
    [Uniqueness of Inversion] The inversion formula (<reference|inv>) is
    unique under the given conditions.
  </lemma>

  <\proof>
    Suppose there exist two distinct linear operators <math|L<rsub|1>> and
    <math|L<rsub|2>> that both satisfy the inversion property, i.e., for all
    <math|X<around|(|t|)>> of the given form:

    <\equation>
      L<rsub|1><around|[|X<around|(|t|)>|]>=d*Z<around|(|\<lambda\>|)>*<space|1em><text|and><space|1em>L<rsub|2><around|[|X<around|(|t|)>|]>=d*Z<around|(|\<lambda\>|)>
    </equation>

    Define the difference operator <math|L=L<rsub|1>-L<rsub|2>>. Then
    <math|L<around|[|X<around|(|t|)>|]>=0> for all <math|X<around|(|t|)>>
    representable as

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<mu\>|)>*e<rsup|i*\<mu\>*t>*d*Z<around|(|\<mu\>|)>
    </equation>

    Consider the specific process <math|X<rsub|\<lambda\><rsub|0>><around|(|t|)>=A<around|(|t,\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>*d*Z<around|(|\<lambda\><rsub|0>|)>>
    for any fixed <math|\<lambda\><rsub|0>>. Since
    <math|L<around|[|X<rsub|\<lambda\><rsub|0>><around|(|t|)>|]>=0>, and this
    must hold for arbitrary <math|d*Z<around|(|\<lambda\><rsub|0>|)>>, the
    operator <math|L> must annihilate the kernel function
    <math|A<around|(|t,\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>>
    for every <math|\<lambda\><rsub|0>>.

    By the orthogonality condition (<reference|ortho>), the system
    <math|<around|{|A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>|}><rsub|\<lambda\>>>
    forms a complete orthogonal basis in the relevant function space. Since
    <math|L> annihilates every element of this complete system, and any
    <math|X<around|(|t|)>> can be expressed as a linear combination
    (integral) of these basis functions, <math|L> must be the zero operator.

    Therefore <math|L<rsub|1>=L<rsub|2>>, establishing uniqueness.
  </proof>

  <section|References>

  \;

  Priestley, M.B. (1965). Evolutionary spectra and non-stationary processes.
  <with|font-shape|italic|Journal of the Royal Statistical Society: Series
  B>, 27(2), 204-237.

  \;

  Priestley, M.B. (1981). <with|font-shape|italic|Spectral Analysis and Time
  Series>. Academic Press.

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
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|2|2>>
    <associate|inv|<tuple|6|2>>
    <associate|ortho|<tuple|4|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Oscillatory
      Gaussian Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Invertibility Conditions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>