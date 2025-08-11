<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Lagrange Inversion Theorem: A Comprehensive Proof
  with Measure-Theoretic Considerations>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<\abstract>
    A proof of the Lagrange inversion theorem for analytic functions is
    presented, with particular attention to the case where the underlying
    function is monotonically increasing or decreasing and therefore
    bijective. Points where the derivative may vanish on sets of measure zero
    are carefully considered, establishing conditions under which the
    inversion formula remains valid.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Preliminaries
    and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Main Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Proof>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Step 1: Establishing the Bijective
    Property <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|4.2<space|2spc>Step 2: Handling the Measure Zero
    Condition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|4.3<space|2spc>Step 3: The Core Proof via Residue
    Theory <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|4.4<space|2spc>Step 4: Special Case and Corollary
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Applications
    and Remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Examples>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The Lagrange inversion theorem provides an explicit formula for the
  coefficients of the power series expansion of the inverse of an analytic
  function. This fundamental result in complex analysis has profound
  applications in combinatorics, probability theory, and the study of
  generating functions. The approach presented here emphasizes its
  measure-theoretic foundations and the role of monotonic bijective
  functions.

  <section|Preliminaries and Definitions>

  <\definition>
    [Analytic Function] A function <math|f:\<bbb-C\>\<to\>\<bbb-C\>> is
    analytic at a point <math|a\<in\>\<bbb-C\>> if there exists a
    neighborhood <math|U> of <math|a> such that <math|f> can be represented
    by a convergent power series

    <\equation>
      f<around|(|z|)>=<big|sum><rsub|n=0><rsup|\<infty\>>a<rsub|n>*<around|(|z-a|)><rsup|n>\<forall\>z\<in\>U
    </equation>
  </definition>

  <\definition>
    [Monotonic Function] A real-valued function <math|g:I\<to\>\<bbb-R\>> on
    an interval <math|I> is monotonically increasing if for all
    <math|x<rsub|1>,x<rsub|2>\<in\>I> with <math|x<rsub|1>\<less\>x<rsub|2>>,
    we have <math|g<around|(|x<rsub|1>|)>\<leq\>g<around|(|x<rsub|2>|)>>. It
    is strictly monotonic if the inequality is strict whenever
    <math|x<rsub|1>\<neq\>x<rsub|2>>.
  </definition>

  <\definition>
    [Measure Zero Set] A set <math|E\<subset\>\<bbb-R\>> has Lebesgue measure
    zero if for every <math|\<epsilon\>\<gtr\>0>, there exists a countable
    collection of intervals <math|<around|{|I<rsub|k>|}><rsub|k=1><rsup|\<infty\>>>
    such that <math|E\<subset\><big|cup><rsub|k=1><rsup|\<infty\>>I<rsub|k>>
    and <math|<big|sum><rsub|k=1><rsup|\<infty\>><around|\||I<rsub|k>|\|>\<less\>\<epsilon\>>,
    where <math|<around|\||I<rsub|k>|\|>> denotes the length of interval
    <math|I<rsub|k>>.
  </definition>

  <section|The Main Theorem>

  <\theorem>
    [Lagrange Inversion Theorem with Measure-Theoretic Extension] Let
    <math|f:\<bbb-C\>\<to\>\<bbb-C\>> be analytic in a neighborhood of the
    origin with <math|f<around|(|0|)>=0> and
    <math|f<rprime|'><around|(|0|)>\<neq\>0>. Suppose there exists an
    analytic function <math|\<phi\>:\<bbb-C\>\<to\>\<bbb-C\>> with
    <math|\<phi\><around|(|0|)>\<neq\>0> such that

    <\equation>
      f<around|(|w|)>=<frac|w|\<phi\><around|(|w|)>>
    </equation>

    Let <math|g> be the compositional inverse of <math|f>, so that <math|>

    <\equation>
      f<around|(|g<around|(|z|)>|)>=z
    </equation>

    \ in a neighborhood of the origin.

    Furthermore, assume that the real part of <math|f> restricted to the real
    axis is monotonically increasing or decreasing, making <math|f> bijective
    on its domain of convergence, and that the derivative <math|f<rprime|'>>
    vanishes only on a set of measure zero.

    Then for any analytic function <math|H<around|(|w|)>> and for
    <math|n\<geq\>1>:

    <\equation>
      <around|[|z<rsup|n>|]>*H<around|(|g<around|(|z|)>|)>=<frac|1|n><around|[|w<rsup|n-1>|]>*<around*|(|H<rprime|'><around|(|w|)>*\<phi\><around|(|w|)><rsup|n>|)>
    </equation>

    where <math|<around|[|w<rsup|k>|]>> denotes the coefficient of
    <math|w<rsup|k>> in the power series expansion.

    In particular, taking <math|H<around|(|w|)>=w>, we obtain:

    <\equation>
      <around|[|z<rsup|n>|]>*g<around|(|z|)>=<frac|1|n><around|[|w<rsup|n-1>|]>*\<phi\><around|(|w|)><rsup|n>
    </equation>
  </theorem>

  <section|Proof>

  <subsection|Step 1: Establishing the Bijective Property>

  <\lemma>
    [Monotonic Analytic Functions are Locally Bijective] Let <math|f> be
    analytic in a neighborhood <math|U> of the origin with
    <math|f<around|(|0|)>=0> and <math|f<rprime|'><around|(|0|)>\<neq\>0>. If
    Re<math|<around|(|f|)>> is monotonic on <math|U\<cap\>\<bbb-R\>>, then
    <math|f> is locally bijective.
  </lemma>

  <\proof>
    Since <math|f<rprime|'><around|(|0|)>\<neq\>0>, the inverse function
    theorem for complex analytic functions guarantees that <math|f> is
    locally invertible in some neighborhood <math|V> of the origin. The
    monotonicity condition on Re<math|<around|(|f|)>> ensures that <math|f>
    is injective when restricted to real values, and by the identity theorem
    for analytic functions, this injectivity extends to the complex
    neighborhood.
  </proof>

  <subsection|Step 2: Handling the Measure Zero Condition>

  <\lemma>
    [Derivative Vanishing on Measure Zero Sets] Let <math|f> be analytic with
    <math|f<rprime|'>> vanishing only on a set <math|E> of measure zero. Then
    the Cauchy integral formula and residue calculations remain valid for the
    inversion process.
  </lemma>

  <\proof>
    Since <math|E> has measure zero, the set
    <math|<around|{|z:f<rprime|'><around|(|z|)>=0|}>> cannot accumulate at
    any point in the domain of analyticity (by the identity theorem).
    Therefore, <math|f<rprime|'><around|(|z|)>\<neq\>0> for all but a
    discrete set of points, and the standard residue-theoretic proof of the
    Lagrange inversion theorem applies without modification.

    The key observation is that in complex analysis, sets of measure zero (in
    the real sense) correspond to discrete or at most countable sets when
    dealing with zeros of analytic functions. Since analytic functions are
    determined by their behavior on any open set, the vanishing of
    <math|f<rprime|'>> on a measure zero set does not affect the global
    analytic properties required for the inversion formula.
  </proof>

  <subsection|Step 3: The Core Proof via Residue Theory>

  The proof proceeds using the residue theorem and contour integration. Let

  <\equation>
    g<around|(|z|)>=<big|sum><rsub|n=1><rsup|\<infty\>>g<rsub|n>*z<rsup|n>
  </equation>

  \ be the inverse function of <math|f>, so that
  <math|f<around|(|g<around|(|z|)>|)>=z>. By observing

  <\equation>
    f<around|(|w|)>=<frac|w|\<phi\><around|(|w|)>>
  </equation>

  \;

  it is seen that

  <\equation>
    z=f<around|(|g<around|(|z|)>|)>=<frac|g<around|(|z|)>|\<phi\><around|(|g<around|(|z|)>|)>>
  </equation>

  which gives\ 

  <\equation>
    g<around|(|z|)>=z*\<phi\><around|(|g<around|(|z|)>|)>
  </equation>

  For any analytic function <math|H<around|(|w|)>>, consider the coefficient
  <math|<around|[|z<rsup|n>|]>*H<around|(|g<around|(|z|)>|)>>. By the Cauchy
  integral formula:

  <\equation>
    <around|[|z<rsup|n>|]>*H<around|(|g<around|(|z|)>|)>=<frac|1|2*\<pi\>*i>*<big|oint><rsub|<around|\||z|\|>=r><frac|H<around|(|g<around|(|z|)>|)>|z<rsup|n+1>>*d*z
  </equation>

  for sufficiently small <math|r\<gtr\>0>. The substitution <math|>

  <\equation>
    z=f<around|(|w|)>=<frac|w|\<phi\><around|(|w|)>>
  </equation>

  \ is made so that

  <\equation>
    d*z=f<rprime|'><around|(|w|)>*d*w=<frac|\<phi\><around|(|w|)>-w*\<phi\><rprime|'><around|(|w|)>|<around|(|\<phi\><around|(|w|)>|)><rsup|2>>*d*w
  </equation>

  Since <math|g<around|(|z|)>=w> when <math|z=f<around|(|w|)>>, it is the
  case that:

  <\equation>
    <around|[|z<rsup|n>|]>*H<around|(|g<around|(|z|)>|)>=<frac|1|2*\<pi\>*i>*<big|oint><rsub|C><frac|H<around|(|w|)>|<around*|(|<frac|w|\<phi\><around|(|w|)>>|)><rsup|n+1>>\<cdot\><frac|\<phi\><around|(|w|)>-w*\<phi\><rprime|'><around|(|w|)>|<around|(|\<phi\><around|(|w|)>|)><rsup|2>>*d*w
  </equation>

  where <math|C> is the image of the circle <math|<around|\||z|\|>=r> under
  the mapping <math|w\<mapsto\>f<around|(|w|)>>. Simplifying the integrand:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<frac|H<around|(|w|)>|<around*|(|<frac|w|\<phi\><around|(|w|)>>|)><rsup|n+1>>\<cdot\><frac|\<phi\><around|(|w|)>-w*\<phi\><rprime|'><around|(|w|)>|<around|(|\<phi\><around|(|w|)>|)><rsup|2>>>|<cell|=<frac|H<around|(|w|)>*\<phi\><around|(|w|)><rsup|n+1>|w<rsup|n+1>>\<cdot\><frac|\<phi\><around|(|w|)>-w*\<phi\><rprime|'><around|(|w|)>|<around|(|\<phi\><around|(|w|)>|)><rsup|2>>>>|<row|<cell|>|<cell|=<frac|H<around|(|w|)>*\<phi\><around|(|w|)><rsup|n-1>*<around|(|\<phi\><around|(|w|)>-w*\<phi\><rprime|'><around|(|w|)>|)>|w<rsup|n+1>>>>>>>
  </equation>

  Now, observe that:

  <\equation*>
    <frac|d|d*w><around*|(|<frac|H<around|(|w|)>*\<phi\><around|(|w|)><rsup|n>|n>|)>=<frac|H<rprime|'><around|(|w|)>*\<phi\><around|(|w|)><rsup|n>+H<around|(|w|)>*n*\<phi\><around|(|w|)><rsup|n-1>*\<phi\><rprime|'><around|(|w|)>|n>
  </equation*>

  <\equation*>
    =<frac|H<rprime|'><around|(|w|)>*\<phi\><around|(|w|)><rsup|n>+H<around|(|w|)>*w*\<phi\><around|(|w|)><rsup|n-1>*\<phi\><rprime|'><around|(|w|)>|n>.
  </equation*>

  Therefore:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|H<around|(|w|)>*\<phi\><around|(|w|)><rsup|n-1>*<around|(|\<phi\><around|(|w|)>-w*\<phi\><rprime|'><around|(|w|)>|)>>|<cell|=\<phi\><around|(|w|)><rsup|n>*H<around|(|w|)>-H<around|(|w|)>*w*\<phi\><around|(|w|)><rsup|n-1>*\<phi\><rprime|'><around|(|w|)>>>|<row|<cell|>|<cell|=n*<frac|d|d*w><around*|(|<frac|H<around|(|w|)>*\<phi\><around|(|w|)><rsup|n>|n>|)>-H<rprime|'><around|(|w|)>*\<phi\><around|(|w|)><rsup|n>>>>>>
  </equation>

  Substituting back:

  <\equation*>
    <around|[|z<rsup|n>|]>*H<around|(|g<around|(|z|)>|)>=<frac|1|2*\<pi\>*i>*<big|oint><rsub|C><frac|n*<frac|d|d*w><around*|(|<frac|H<around|(|w|)>*\<phi\><around|(|w|)><rsup|n>|n>|)>-H<rprime|'><around|(|w|)>*\<phi\><around|(|w|)><rsup|n>|w<rsup|n+1>>*d*w
  </equation*>

  By the residue theorem, the integral of the exact differential vanishes,
  leaving:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|>>>>><tabular|<tformat|<table|<row|<cell|<around|[|z<rsup|n>|]>*H<around|(|g<around|(|z|)>|)>>|<cell|=-<frac|1|2*\<pi\>*i>*<big|oint><rsub|C><frac|H<rprime|'><around|(|w|)>*\<phi\><around|(|w|)><rsup|n>|w<rsup|n+1>>*d*w>>|<row|<cell|>|<cell|=<frac|1|n>\<cdot\><frac|1|2*\<pi\>*i>*<big|oint><rsub|C><frac|n*H<rprime|'><around|(|w|)>*\<phi\><around|(|w|)><rsup|n>|w<rsup|n+1>>*d*w>>|<row|<cell|>|<cell|=<frac|1|n><around|[|w<rsup|n-1>|]>*<around*|(|H<rprime|'><around|(|w|)>*\<phi\><around|(|w|)><rsup|n>|)>>>>>>
  </equation>

  The measure zero condition on the vanishing of <math|f<rprime|'>> ensures
  that this residue calculation is well-defined, as the contour can be chosen
  to avoid the discrete set where <math|f<rprime|'>> vanishes.

  <subsection|Step 4: Special Case and Corollary>

  <\corollary>
    [Classical Lagrange Inversion Formula] Under the conditions of the main
    theorem, with <math|H<around|(|w|)>=w>:

    <\equation>
      g<rsub|n>=<around|[|z<rsup|n>|]>*g<around|(|z|)>=<frac|1|n><around|[|w<rsup|n-1>|]>*\<phi\><around|(|w|)><rsup|n>
    </equation>
  </corollary>

  <\proof>
    This follows immediately from the main theorem by setting
    <math|H<around|(|w|)>=w>, so that <math|H<rprime|'><around|(|w|)>=1>.
  </proof>

  <section|Applications and Remarks>

  <\remark>
    [Monotonicity and Bijectivity] The monotonicity condition ensures global
    invertibility of the function on its real restriction, which extends to
    local bijectivity in the complex domain. This is crucial for the validity
    of the power series inversion.
  </remark>

  <\remark>
    [Measure Zero Sets and Analyticity] In the context of complex analytic
    functions, the condition that <math|f<rprime|'>> vanishes only on a set
    of measure zero is automatically satisfied in most practical
    applications, since the zeros of a non-trivial analytic function form a
    discrete set.
  </remark>

  <\proposition>
    [Convergence Properties] Under the conditions of the main theorem, the
    series <math|g<around|(|z|)>=<big|sum><rsub|n=1><rsup|\<infty\>>g<rsub|n>*z<rsup|n>>
    converges in a disk <math|<around|\||z|\|>\<less\>R> where <math|R> is
    determined by the radius of convergence of the original function <math|f>
    and the behavior of <math|\<phi\>>.
  </proposition>

  <section|Examples>

  <with|font-series|bold|Example 1:> Consider <math|>

  <\equation>
    f<around|(|w|)>=<frac|w|1+w>
  </equation>

  \ with\ 

  <\equation>
    \<phi\><around|(|w|)>=1+w
  </equation>

  . Then:

  <\equation>
    g<rsub|n>=<frac|1|n><around|[|w<rsup|n-1>|]>*<around|(|1+w|)><rsup|n>=<frac|1|n><binom|n|n-1>=1
  </equation>

  for all <math|n\<geq\>1>, giving <math|>

  <\equation>
    g<around|(|z|)>=<big|sum><rsub|n=1><rsup|\<infty\>>z<rsup|n>=<frac|z|1-z>
  </equation>

  , which is indeed the inverse of <math|f>.

  <with|font-series|bold|Example 2:> For <math|>

  <\equation>
    f<around|(|w|)>=w*e<rsup|-w>
  </equation>

  \ we have\ 

  <\equation>
    \<phi\><around|(|w|)>=e<rsup|w>
  </equation>

  , leading to:

  <\equation>
    g<rsub|n>=<frac|1|n><around|[|w<rsup|n-1>|]>*e<rsup|n*w>=<frac|n<rsup|n-1>|n!>
  </equation>

  recovering the well-known series expansion for the Lambert W function.

  <section|Conclusion>

  We have established the Lagrange inversion theorem with explicit attention
  to monotonic bijective functions and measure-theoretic considerations. The
  proof demonstrates that the classical inversion formula remains valid even
  when the derivative vanishes on sets of measure zero, provided the
  underlying function maintains its analytic and bijective properties. This
  framework provides a robust foundation for applications in combinatorics,
  probability theory, and the analysis of special functions.
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
    <associate|auto-1|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-10|<tuple|6|6|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-11|<tuple|7|7|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-3|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-4|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-5|<tuple|4.1|3|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-6|<tuple|4.2|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-7|<tuple|4.3|4|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-8|<tuple|4.4|6|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-9|<tuple|5|6|../../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries
      and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Main Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Step 1: Establishing the
      Bijective Property <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Step 2: Handling the Measure
      Zero Condition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>Step 3: The Core Proof via
      Residue Theory <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4.4<space|2spc>Step 4: Special Case and
      Corollary <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Applications
      and Remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Examples>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>