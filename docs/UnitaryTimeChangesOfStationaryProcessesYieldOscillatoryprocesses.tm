<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Processes Yield
  Oscillatory Processes<next-line>and a Functional Framework Toward a
  Hilbert--Pólya Construction>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|September 16, 2025>>

  <\abstract>
    A unitary time-change operator <math|U<rsub|\<theta\>>> is constructed
    for absolutely continuous, strictly increasing time reparametrizations
    <math|\<theta\>>, acting on functions that are square-integrable over
    compact sets. Applying <math|U<rsub|\<theta\>>> to the Cramér spectral
    representation of a stationary process yields an oscillatory process in
    the sense of Priestley with oscillatory function
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>
    and evolutionary spectrum <math|d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>>.
    It is proved that sample paths of any non-degenerate second-order
    stationary process almost surely lie in
    <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>, making the operator
    applicable to typical realizations. A zero-localization measure
    <math|\<mu\>*<around|(|d*t|)>=\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t>
    induces a Hilbert space <math|L<rsup|2><around|(|\<mu\>|)>> on the zero
    set of an oscillatory process <math|Z>, and the multiplication operator
    <math|<around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>> has pure point,
    simple spectrum equal to the zero set of <math|Z>. This produces a
    concrete operator scaffold consistent with a Hilbert\UPólya-type
    viewpoint.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Function
    Spaces and Unitary Time Change> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc><with|mode|math|\<sigma\>>-compact
    sets and local <with|mode|math|L<rsup|2>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Unitary time-change operator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes (Priestley)> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Stationary
    Processes and Time Change> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Stationary processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|3.2<space|2spc>Stationary <with|mode|math|\<to\>>
    oscillatory via <with|mode|math|U<rsub|\<theta\>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|3.3<space|2spc>Covariance operator conjugation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Sample
    Paths Live in <with|mode|math|L<rsup|2><rsub|loc>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Zero
    Localization and Hilbert\UPólya Scaffold>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>Zero localization measure
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|5.2<space|2spc>Hilbert space on zeros and
    multiplication operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Appendix:
    Regularity and Simple Zeros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>
  </table-of-contents>

  TODO: add zero counting function<space|1em>and expected zero counting
  function!!!!!

  <section|Function Spaces and Unitary Time Change><label|sec:functionspaces>

  <subsection|<math|\<sigma\>>-compact sets and local <math|L<rsup|2>>>

  <\definition>
    <strong|[<math|\<sigma\>>-compact sets]<label|def:sigma_compact>> A
    subset <math|U\<subseteq\>\<bbb-R\>> is <math|\<sigma\>>-compact if

    <\equation>
      U=<big|cup><rsub|n=1><rsup|\<infty\>>K<rsub|n>
    </equation>

    with each <math|K<rsub|n>> compact.
  </definition>

  <\definition>
    <strong|[Locally square-integrable functions]><label|def:L2loc> Define

    <\equation>
      L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>\<assign\><around*|{|f:\<bbb-R\>\<to\>\<bbb-C\>:<big|int><rsub|K><around|\||f<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>*<text|for
      every compact >K\<subseteq\>\<bbb-R\>|}>
    </equation>
  </definition>

  <\remark>
    Every bounded measurable set in <math|\<bbb-R\>> is compact or contained
    in a compact set; hence <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>
    contains functions that are square-integrable on every bounded interval,
    including functions with polynomial growth at infinity.
  </remark>

  <subsection|Unitary time-change operator>

  <\definition>
    <strong|[Unitary time-change]<label|def:Utheta>> Let
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective, with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> almost everywhere
    and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    Lebesgue measure zero. The function <math|\<theta\>> maps
    <math|\<sigma\>>-compact sets to <math|\<sigma\>>-compact sets. Define,
    for <math|f> measurable,

    <\equation>
      <around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>
    </equation>
  </definition>

  <\proposition>
    <strong|[Inverse map]<label|prop:inverse> >The inverse map is given by

    <\equation>
      <around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>

    which is well-defined almost everywhere on every <math|\<sigma\>>-compact
    set.
  </proposition>

  <\proof>
    Since <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    measure zero, and <math|\<theta\><rsup|-1>> maps sets of measure zero to
    sets of measure zero (as absolutely continuous bijective functions
    preserve measure-zero sets), the denominator
    <math|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    is positive almost everywhere. The expression is therefore well-defined
    almost everywhere on every <math|\<sigma\>>-compact set, which suffices
    for defining an element of <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
  </proof>

  <\theorem>
    <strong|[Local unitarity on <math|\<sigma\>>-compact
    sets]<label|thm:local_unitarity>> For every <math|\<sigma\>>-compact set
    <math|C\<subseteq\>\<bbb-R\>> and <math|f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>,

    <\equation>
      <big|int><rsub|C><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|C|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s
    </equation>

    Moreover, <math|U<rsub|\<theta\>><rsup|-1>> is the inverse of
    <math|U<rsub|\<theta\>>> on <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Let <math|f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>> and let
    <math|U> be any <math|\<sigma\>>-compact set. The local
    <math|L<rsup|2>>-norm of <math|U<rsub|\<theta\>>*f> over <math|C> is:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<big|int><rsub|C><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t>|<cell|=<big|int><rsub|C><around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|C><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t>>>>>
    </equation>

    Since <math|\<theta\>> is absolutely continuous and strictly increasing,
    applying the change of variables <math|s=\<theta\><around|(|t|)>> gives

    <\equation>
      d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t
    </equation>

    almost everywhere. Since <math|\<theta\>> maps <math|\<sigma\>>-compact
    sets to <math|\<sigma\>>-compact sets, as <math|t> ranges over <math|C>,
    <math|s=\<theta\><around|(|t|)>> ranges over
    <math|\<theta\><around|(|C|)>>, which is <math|\<sigma\>>-compact.
    Therefore:

    <\equation>
      <big|int><rsub|C><wide|\<theta\>|\<dot\>><around|(|t|)>*<around|\||f<around|(|\<theta\><around|(|t|)>|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|C|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s
    </equation>

    To verify that <math|U<rsub|\<theta\>><rsup|-1>> is indeed the inverse,
    we compute explicitly. For any <math|f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|(|U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>*f|)><around|(|s|)>>|<cell|=<around*|(|U<rsub|\<theta\>><rsup|-1>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*f<around|(|\<theta\><around|(|s|)>|)>|)><around|(|s|)>>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>*f<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|)>>>|<row|<cell|>|<cell|=f<around|(|s|)>>>>>>
    </equation>

    since <math|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>=s>.
    Similarly, for any <math|g\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|(|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)>>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>>*g<around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>*g<around|(|t|)>>>|<row|<cell|>|<cell|=g<around|(|t|)>>>>>>
    </equation>

    since <math|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>=t>.
    Therefore

    <\equation>
      U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>=U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>=I
    </equation>

    on <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
  </proof>

  <\theorem>
    <strong|[Unitarity on <math|L<rsup|2><around|(|\<bbb-R\>|)>>]<label|thm:global_unitarity>>
    <math|U<rsub|\<theta\>>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    is unitary:

    <\equation>
      <big|int><rsub|\<bbb-R\>><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<bbb-R\>>|\|>*f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s
    </equation>

    and <math|U<rsub|\<theta\>><rsup|-1>> is its inverse.
  </theorem>

  <\proof>
    For <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>, we have:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t>|<\cell>
        =<big|int><rsub|\<bbb-R\>><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t<eq-number>
      </cell>>>>
    </align>

    By the change of variables

    <\equation>
      s=\<theta\><around|(|t|)>
    </equation>

    with

    <\equation>
      d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*t
    </equation>

    and since <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> is bijective:

    <\equation>
      <big|int><rsub|\<bbb-R\>><wide|\<theta\>|\<dot\>><around|(|t|)>*<around|\||f<around|(|\<theta\><around|(|t|)>|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<bbb-R\>>|\|>*f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s
    </equation>

    The inverse relationship follows from the same computation as in
    Theorem<nbsp><reference|thm:local_unitarity>, applied globally.
  </proof>

  <section|Oscillatory Processes (Priestley)><label|sec:oscillatory>

  <\definition>
    <strong|[Oscillatory process]<label|def:osc_proc> >Let <math|F> be a
    finite nonnegative Borel measure on <math|\<bbb-R\>>. For each
    <math|t\<in\>\<bbb-R\>>, let <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>>
    be the gain function and

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    be the corresponding oscillatory function then an <em|oscillatory
    process> is a stochastic process which can be represented as

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*\<mathd\>*\<Phi\><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*\<mathd\>*\<Phi\><around|(|\<lambda\>|)>>>>>>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure with spectral
    measure <math|F>, that is,

    <\equation>
      \<bbb-E\>*<space|-0.17em><around*|[|\<Phi\>*<around|(|d*\<lambda\>|)><space|0.17em><wide|\<Phi\>*<around|(|d*\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    and corresponding covariance kernel

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><space|-0.17em><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<phi\><rsub|t><around|(|\<lambda\>|)><wide|\<phi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>>\<mathd\>*F<around|(|\<lambda\>|)>>>>>><label|covar>
    </equation>
  </definition>

  <\remark>
    [Real-valuedness] <math|Z> is real-valued if and only if

    <\equation>
      A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    for <math|F>-a.e. <math|\<lambda\>>, equivalently

    <\equation>
      \<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    for <math|F>-a.e. <math|\<lambda\>>. TODO: this needs to be recast as a
    theorem
  </remark>

  <\theorem>
    <strong|[Existence]><label|thm:existence_osc> If <math|F> is finite and
    <math|<around|(|A<rsub|t>|)><rsub|t\<in\>\<bbb-R\>>> is measurable in
    <math|t> with

    <\equation>
      <big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>\<less\>\<infty\>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    then there exists a complex orthogonal random measure <math|\<Phi\>> with
    spectral measure <math|F> such that

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>> and has
    covariance <math|R<rsub|Z>> as in (<reference|covar>) above.
  </theorem>

  <\proof>
    The proof proceeds by constructing the stochastic integral using the
    standard extension procedure. First, the integral is defined for simple
    functions of the form

    <\equation>
      g<around|(|\<lambda\>|)>=<big|sum><rsub|j=1><rsup|n>c<rsub|j><text|<with|font-series|bold|1>><rsub|E<rsub|j>><around|(|\<lambda\>|)>
    </equation>

    where <math|<around|{|E<rsub|j>|}>> are disjoint Borel sets with
    <math|F<around|(|E<rsub|j>|)>\<less\>\<infty\>> and
    <math|c<rsub|j>\<in\>\<bbb-C\>>:

    <\equation>
      <big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>\<assign\><big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>
    </equation>

    For such simple functions, the isometry property holds:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<bbb-E\><around*|[|<around*|\||<big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>|\|><rsup|2>|]>>|<cell|=\<bbb-E\><around*|[|<around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>|\|><rsup|2>|]>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|n><around|\||c<rsub|j>|\|><rsup|2>*F(E<rsub|j>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>

    Since simple functions are dense in <math|L<rsup|2><around|(|F|)>>, the
    integral is extended by continuity to all
    <math|g\<in\>L<rsup|2><around|(|F|)>>. For each <math|t>, since

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    and <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>>,
    <math|\<varphi\><rsub|t>\<in\>L<rsup|2><around|(|F|)>> holds. Therefore

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>>. The covariance
    is computed as:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>*<big|int><rsub|\<bbb-R\>><wide|\<varphi\><rsub|s><around|(|\<mu\>|)>|\<bar\>><space|0.17em><wide|\<Phi\>*<around|(|d*\<mu\>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<mu\>|)>|\<bar\>>\<bbb-E\>*<around|[|\<Phi\>*<around|(|d*\<lambda\>|)><wide|\<Phi\>*<around|(|d*\<mu\>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>
  </proof>

  <section|Stationary Processes and Time Change><label|sec:stationary_timechange>

  <subsection|Stationary processes>

  <\definition>
    <strong|[Cramér representation]<label|def:cramer>> A zero-mean stationary
    process <math|X> with spectral measure <math|F> admits the sample path
    representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    which has covariance

    <\equation>
      R<rsub|X>*<around|(|t-s|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <subsection|Stationary <math|\<to\>> oscillatory via
  <math|U<rsub|\<theta\>>>>

  <\theorem>
    <strong|[Time change yields oscillatory
    process]<label|thm:Utheta_to_osc>> Let <math|X> be zero-mean stationary
    as in Definition<nbsp><reference|def:cramer>. For <math|\<theta\>> as in
    Definition<nbsp><reference|def:Utheta>, define

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>>>>>>
    </equation>

    Then <math|Z> is oscillatory with oscillatory function

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    , gain function

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    , and covariance

    <\equation>
      R<rsub|Z><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </theorem>

  <\proof>
    Applying the unitary time change operator to the spectral representation
    of <math|X<around|(|t|)>>:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>\<mathd\>*\<Phi\><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*\<mathd\>*\<Phi\><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*\<mathd\>*\<Phi\><around|(|\<lambda\>|)>>>>>>
    </equation>

    where

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    To verify this constitutes an oscillatory representation according to
    Definition<nbsp><reference|def:osc_proc>,
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>> has the form
    <math|A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<varphi\><rsub|t><around|(|\<lambda\>|)>>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<lambda\>*t>>>|<row|<cell|>|<cell|=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>>>>>
    </equation>

    where

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    Since <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<geq\>0> almost
    everywhere and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on
    sets of measure zero, <math|A<rsub|t><around|(|\<lambda\>|)>> is
    well-defined almost everywhere. Moreover,
    <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>> for each <math|t> since:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>|<cell|=<big|int><rsub|\<bbb-R\>><around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*<big|int><rsub|\<bbb-R\>>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*F<around|(|\<bbb-R\>|)>\<less\>\<infty\>>>>>>
    </equation>

    where <math|<around|\||e<rsup|i*\<alpha\>>|\|>=1> for all real
    <math|\<alpha\>> is used. The covariance is computed as:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around*|[|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*\<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>
  </proof>

  <\corollary>
    <strong|[Evolutionary spectrum]<label|cor:evol_spec>> The evolutionary
    spectrum is

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|d*F<rsub|t><around|(|\<lambda\>|)>>|<cell|=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>
  </corollary>

  <\proof>
    By definition of the evolutionary spectrum and using the gain function
    from Theorem<nbsp><reference|thm:Utheta_to_osc>:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|d*F<rsub|t><around|(|\<lambda\>|)>>|<cell|=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)><around|\||e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>

    since

    <\equation>
      <around|\||e<rsup|i*\<alpha\>>|\|>=1\<forall\>a\<in\>\<bbb-R\>
    </equation>
  </proof>

  <subsection|Covariance operator conjugation>

  <\proposition>
    <strong|[Operator conjugation]<label|prop:conjugation>> Let

    <\equation>
      <around|(|T<rsub|K>*f|)><around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>K<around|(|<around|\||t-s|\|>|)>*<space|0.17em>f<around|(|s|)>*<space|0.17em>d*s
    </equation>

    with stationary kernel

    <\equation>
      K<around|(|h|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*h>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    Define the transformed kernel

    <\equation>
      K<rsub|\<theta\>><around|(|s,t|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>K<space|-0.17em><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    and corresponding integral covariance operator

    <\equation>
      <around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|s,t|)>*<space|0.17em>f<around|(|s|)>*<space|0.17em>d*s
    </equation>

    Then

    <\equation>
      T<rsub|K<rsub|\<theta\>>>=U<rsub|\<theta\>>*<space|0.17em>T<rsub|K>*<space|0.17em>U<rsub|\<theta\>><rsup|-1>
    </equation>

    on <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
  </proposition>

  <\proof>
    For any <math|g\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>, the
    integral operator is transformed from coordinates <math|<around|(|r,w|)>>
    to coordinates <math|<around|(|t,s|)>> by applying both coordinate
    transformations

    <\equation>
      r=\<theta\><around|(|t|)>
    </equation>

    and

    <\equation>
      w=\<theta\><around|(|s|)>
    </equation>

    by simultaneous substitution with Jacobians

    <\equation>
      d*r=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*t
    </equation>

    and

    <\equation>
      d*w=<wide|\<theta\>|\<dot\>><around|(|s|)>*<space|0.17em>d*s
    </equation>

    The operator <math|T<rsub|K>> in <math|<around|(|r,w|)>> coordinates is:

    <\equation>
      <around|(|T<rsub|K>*f|)><around|(|r|)>=<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||r-w|\|>|)>*f<around|(|w|)>*<space|0.17em>d*w
    </equation>

    Under the simultaneous transformation <math|r=\<theta\><around|(|t|)>>
    and <math|w=\<theta\><around|(|s|)>>:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|(|<around|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>|)>*g|)><around|(|t|)>>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*<around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|s|)>|)><frac|<wide|\<theta\>|\<dot\>><around|(|s|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><frac|g<around|(|s|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*g<around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*g<around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|t,s|)>*g<around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<around|(|T<rsub|K<rsub|\<theta\>>>*g|)><around|(|t|)>>>>>>
    </equation>

    where

    <\equation>
      K<rsub|\<theta\>><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    Therefore

    <\equation>
      T<rsub|K<rsub|\<theta\>>>=U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>
    </equation>
  </proof>

  <section|Sample Paths Live in <math|L<rsup|2><rsub|loc>>><label|sec:samplepaths>

  <\theorem>
    <strong|[Sample paths in <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>]<label|thm:paths_loc>>
    Let <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> be a
    second-order stationary process with

    <\equation>
      \<sigma\><rsup|2>\<assign\>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>\<less\>\<infty\>
    </equation>

    then, almost surely, every sample path
    <math|t\<mapsto\>X<around|(|\<omega\>,t|)>> belongs to
    <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Fix any bounded interval <math|<around|[|a,b|]>> and consider the random
    variable

    <\equation>
      Y<rsub|<around|[|a,b|]>>\<assign\><big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*<space|0.17em>d*t
    </equation>

    By stationarity and Fubini's theorem:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=\<bbb-E\><around*|[|<big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*<space|0.17em>d*t|]>>|<cell|=<big|int><rsub|a><rsup|b>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|a><rsup|b>\<sigma\><rsup|2>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=\<sigma\><rsup|2>*<around|(|b-a|)>\<less\>\<infty\>>>>>>
    </equation>

    Equivalently, invoking the evolutionary spectrum\ 

    <\equation>
      d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*F<around|(|\<lambda\>|)>
    </equation>

    it can be seen that the oscillatory process can be expressed as\ 

    <\equation>
      Z<around|(|t|)>=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>
    </equation>

    whose (ensemble) variance is given by

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<bbb-E\><around|[|Z<around|(|t|)><rsup|2>|]>>|<cell|=<big|int>d*F<rsub|t><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*<big|int>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*\<sigma\><rsup|2>>>>>>
    </equation>

    Therefore for any bounded interval <math|<around|[|a,b|]>>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<bbb-E\><around*|[|<big|int><rsub|a><rsup|b>Z<around|(|t|)><rsup|2>*d*t|]>>|<cell|=<big|int><rsub|a><rsup|b><wide|\<theta\>|\<dot\>><around|(|t|)>*\<sigma\><rsup|2>*d*t>>|<row|<cell|>|<cell|=\<sigma\><rsup|2>*<around|[|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|]>\<less\>\<infty\>>>>>>
    </equation>

    By Markov's inequality, for any <math|M\<gtr\>0>:

    <\equation>
      P*<around|(|Y<rsub|<around|[|a,b|]>>\<gtr\>M|)>\<leq\><frac|\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>|M>=<frac|\<sigma\><rsup|2>*<around|(|b-a|)>|M>
    </equation>

    Taking <math|M\<to\>\<infty\>>, the conclusion is

    <\equation>
      P*<around|(|Y<rsub|<around|[|a,b|]>>\<less\>\<infty\>|)>=1
    </equation>

    , i.e., almost surely the sample path is square-integrable on
    <math|<around|[|a,b|]>>. Since <math|\<bbb-R\>> is the countable union of
    bounded intervals:

    <\equation>
      \<bbb-R\>=<big|cup><rsub|n=1><rsup|\<infty\>><around|[|-n,n|]>
    </equation>

    by countable subadditivity of probability:

    <\equation>
      P<around*|(|<big|cap><rsub|n=1><rsup|\<infty\>><around*|{|<big|int><rsub|-n><rsup|n>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>|}>|)>=1
    </equation>

    Now let <math|K> be any compact set. Then <math|K> is bounded, so

    <\equation>
      K\<subseteq\><around|[|-N,N|]>
    </equation>

    for some <math|N>. Therefore:

    <\equation>
      <big|int><rsub|K>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<leq\><big|int><rsub|-N><rsup|N>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>
    </equation>

    almost surely. This holds for every compact set <math|K>, so almost
    surely every sample path lies in <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
  </proof>

  <section|Zero Localization and Hilbert\UPólya Scaffold><label|sec:HP>

  <subsection|Zero localization measure>

  <\definition>
    <strong|[Zero localization measure]<label|def:zeromeasure>> Let <math|Z>
    be real-valued with <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>> having
    only simple zeros

    <\equation>
      Z<around|(|t<rsub|0>|)>=0\<Rightarrow\><wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0
    </equation>

    Define, for Borel <math|B\<subset\>\<bbb-R\>>,

    <\equation>
      \<mu\><around|(|B|)>=<big|int><rsub|\<bbb-R\>><text|<with|font-series|bold|1>><rsub|B><around|(|t|)>*<space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t
    </equation>
  </definition>

  <\theorem>
    <strong|[Atomicity on the zero set]<label|thm:atomic>> For every
    <math|\<phi\>\<in\>C<rsub|c><rsup|\<infty\>><around|(|\<bbb-R\>|)>>,

    <\equation>
      <big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)>*<space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<phi\><around|(|t<rsub|0>|)>
    </equation>

    hence

    <\equation>
      \<mu\><around|(|t|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>><around|(|t|)>
    </equation>
  </theorem>

  <\proof>
    Since all zeros of <math|Z> are simple and
    <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>>, by the inverse function
    theorem each zero <math|t<rsub|0>> is isolated. Near each zero
    <math|t<rsub|0>>, <math|Z> is locally monotonic, so the one-dimensional
    change of variables formula for the Dirac delta can be applied.

    Specifically, near <math|t<rsub|0>> where
    <math|Z<around|(|t<rsub|0>|)>=0> and <math|<wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0>,
    locally

    <\equation>
      Z<around|(|t|)>=<around|(|t-t<rsub|0>|)>*<wide|Z|\<dot\>><around|(|t<rsub|0>|)>+O<around|(|<around|(|t-t<rsub|0>|)><rsup|2>|)>
    </equation>

    holds. The distributional identity for the Dirac delta under smooth
    changes of variables gives:

    <\equation>
      \<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>
    </equation>

    Therefore:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)>*<space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><around|(|t|)><space|0.17em><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)><frac|<around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>*\<phi\><around|(|t<rsub|0>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<phi\><around|(|t<rsub|0>|)>>>>>>
    </equation>

    This shows that <math|\<mu\>> is the discrete measure

    <\equation>
      \<mu\><around*|(|t|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>><around*|(|t|)>
    </equation>

    assigning unit mass to each zero.
  </proof>

  <subsection|Hilbert space on zeros and multiplication operator>

  <\definition>
    <strong|[Hilbert space on the zero set]<label|labeldef:Hmu>> Let
    <math|\<cal-H\>=L<rsup|2><around|(|\<mu\>|)>> with inner product

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>><space|0.17em>\<mathd\>\<mu\>*<around|(|t|)>
    </equation>
  </definition>

  <\proposition>
    <strong|[Atomic structure]<label|prop:atomic>> Let

    <\equation>
      \<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>
    </equation>

    then

    <\equation>
      \<cal-H\>\<cong\><around*|{|f:<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>\<to\>\<bbb-C\>:<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>\<less\>\<infty\>|}>\<cong\>\<ell\><rsup|2>
    </equation>

    with orthonormal basis <math|<around|{|e<rsub|t<rsub|0>>|}><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>>
    where

    <\equation>
      e<rsub|t<rsub|0>><around|(|t<rsub|1>|)>=\<delta\><rsub|t<rsub|0>*><around*|(|t<rsub|1>|)>
    </equation>
  </proposition>

  <\proof>
    By the atomic form of <math|\<mu\>>, for any
    <math|f\<in\>L<rsup|2><around|(|\<mu\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|\<\|\|\>|f|\<\|\|\>><rsub|\<cal-H\>><rsup|2>>|<cell|=<big|int><around|\||f<around|(|t|)>|\|><rsup|2>*\<mathd\>\<mu\>*<around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><around|\||f<around|(|t|)>|\|><rsup|2>*<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>*<around|(|*t|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2><eq-number>>>>>
    </align>

    This shows the isomorphism with <math|\<ell\><rsup|2>> where the
    functions <math|e<rsub|t<rsub|0>>> defined by

    <\equation>
      e<rsub|t<rsub|0>><around|(|t<rsub|1>|)>=\<delta\><rsub|t<rsub|0>><around*|(|t<rsub|1>|)>
    </equation>

    satisfy the relations

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|e<rsub|t<rsub|0>>,e<rsub|t<rsub|1>>|\<rangle\>>>|<cell|=<big|int>e<rsub|t<rsub|0>><around|(|t|)><wide|e<rsub|t<rsub|1>><around|(|t|)>|\<bar\>>\<mathd\>\<mu\>*<around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|t:Z<around|(|t|)>=0>\<delta\><rsub|t<rsub|0>*><around*|(|t|)>*\<delta\><rsub|t<rsub|1>><around*|(|t|)>>>|<row|<cell|>|<cell|=\<delta\><rsub|t<rsub|0><rsub|>><around*|(|t<rsub|1>|)>>>|<row|<cell|>|<cell|=\<delta\>t<rsub|1><around*|(|t<rsub|0>|)>>>>>>
    </equation>

    thus forming an orthonormal set. Thus, any
    <math|f<around*|(|t|)>\<in\>\<cal-H\>> can be written as

    <\equation>
      f<around*|(|t|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>f<around|(|t<rsub|0>|)>*e<rsub|t<rsub|0>><around*|(|t|)>
    </equation>

    proving they form a basis.
  </proof>

  <\definition>
    <strong|[Multiplication operator]<label|def:L>> Define the linear
    operator

    <\equation>
      L:\<cal-D\><around|(|L|)>\<subset\>\<cal-H\>\<to\>\<cal-H\>
    </equation>

    \ by

    <\equation>
      <around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>
    </equation>

    on the support of <math|\<mu\>> with domain

    <\equation>
      \<cal-D\><around|(|L|)>\<assign\><around*|{|f\<in\>\<cal-H\>:<big|int><around|\||t*<space|0.17em>f<around|(|t|)>|\|><rsup|2>*<space|0.17em>\<mu\>*<around|(|d*t|)>\<less\>\<infty\>|}>
    </equation>
  </definition>

  <\theorem>
    <strong|[Self-adjointness and spectrum]<label|thm:spectrum>> <math|L> is
    self-adjoint on <math|\<cal-H\>> and has pure point, simple spectrum

    <\equation>
      \<sigma\><around|(|L|)>=<wide|<around|{|t\<in\>\<bbb-R\>:Z<around|(|t|)>=0|}>|\<bar\>>
    </equation>

    with eigenvalues <math|\<lambda\>=t<rsub|0>> for each zero
    <math|t<rsub|0>> and corresponding eigenvectors <math|e<rsub|t<rsub|0>>>.
  </theorem>

  <\proof>
    First, self-adjointness is verified. For
    <math|f,g\<in\>\<cal-D\><around|(|L|)>>:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|\<langle\>|L*f,g|\<rangle\>>>|<cell|=<big|int><around|(|L*f|)><around|(|t|)><wide|g<around|(|t|)>|\<bar\>>\<mathd\>\<mu\>*<around|(|*t|)>>>|<row|<cell|>|<cell|=<big|int>t*f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>><space|0.17em>\<mathd\>\<mu\>*<around|(|*t|)>>>|<row|<cell|>|<cell|=<big|int>f<around|(|t|)><wide|t*g<around|(|t|)>|\<bar\>>
      \<mathd\>\<mu\>*<around|(|*t|)>>>|<row|<cell|>|<cell|=<big|int>f<around|(|t|)><wide|<around|(|L*g|)><around|(|t|)>|\<bar\>>\<mathd\>\<mu\>*<around|(|*t|)>>>|<row|<cell|>|<cell|=<around|\<langle\>|f,L*g|\<rangle\>>>>>>>
    </equation>

    Thus <math|L> is symmetric and acts as

    <\equation>
      <around|(|L*f|)><around|(|t<rsub|0>|)>=t<rsub|0>*f<around|(|t<rsub|0>|)>
    </equation>

    for each <math|t<rsub|0>> in the atomic representation where

    <\equation>
      Z<around|(|t<rsub|0>|)>=0
    </equation>

    This is unitarily equivalent to the diagonal operator on
    <math|\<ell\><rsup|2>> with diagonal entries

    <\equation>
      <around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>
    </equation>

    Such diagonal operators are self-adjoint. For the spectrum calculation:

    <\equation>
      L*e<rsub|t<rsub|0>>=t<rsub|0>*e<rsub|t<rsub|0>>\<forall\><around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>
    </equation>

    holds, so each <math|t<rsub|0>> is an eigenvalue of <math|L> with
    eigenvector <math|e<rsub|t<rsub|0>>> and since
    <math|<around|{|e<rsub|t<rsub|0>>|}>> forms an orthonormal basis,
    <math|L> has pure point spectrum. The spectrum of a diagonal operator
    equals the closure of the set of diagonal entries, hence

    <\equation>
      \<sigma\><around|(|L|)>=<wide|<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>|\<bar\>>
    </equation>

    The eigenvalues are simple.
  </proof>

  <\remark>
    <strong|[Operator scaffold]<label|labelrem:scaffold>> The construction

    <\equation>
      <text|stationary >X<long-arrow|\<rubber-rightarrow\>|U<rsub|\<theta\>>><text|oscillatory
      >Z<long-arrow|\<rubber-rightarrow\>|\<mu\>=\<delta\><around|(|Z|)><around|\||<wide|Z|\<dot\>>|\|>*<space|0.17em>d*t>L<rsup|2><around|(|\<mu\>|)><long-arrow|\<rubber-rightarrow\>|L:t\<cdot\>><around|(|L,\<sigma\><around|(|L|)>|)>
    </equation>

    produces a concrete self-adjoint operator whose eigenvalues equal the
    zero set of <math|Z> and whose spectrum equals the closure of the zero
    set, determined by the choice of time-change <math|\<theta\>> and
    spectral measure <math|F>. This provides an explicit realization
    consistent with Hilbert\UPólya approaches to encoding arithmetic
    information in operator spectra.
  </remark>

  <section|Appendix: Regularity and Simple Zeros><label|sec:appendix>

  <\definition>
    <strong|[Regularity and simplicity]<label|def:regularity>> Assume
    <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>> and every zero is simple:
    <math|>

    <\equation>
      Z<around|(|t<rsub|0>|)>=0\<Rightarrow\><wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0
    </equation>
  </definition>

  <\lemma>
    <strong|[Local finiteness and delta decomposition]<label|lem:delta>
    >Under Definition<nbsp><reference|def:regularity>, zeros are locally
    finite and

    <\equation>
      \<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>
    </equation>

    whence

    <\equation>
      \<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>
    </equation>
  </lemma>

  <\proof>
    Since <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>> and
    <math|<wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0> at each zero
    <math|t<rsub|0>>, the inverse function theorem implies that <math|Z> is
    locally invertible near each zero. Specifically, there exists a
    neighborhood <math|U<rsub|t<rsub|0>>> of <math|t<rsub|0>> such that
    <math|Z\|<rsub|U<rsub|t<rsub|0>>>> is strictly monotonic and invertible.

    This implies zeros are isolated: if <math|Z<around|(|t<rsub|0>|)>=0> and
    <math|<wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0>, then there exists
    <math|\<epsilon\>\<gtr\>0> such that <math|Z<around|(|t|)>\<neq\>0> for
    <math|0\<less\><around|\||t-t<rsub|0>|\|>\<less\>\<epsilon\>>. Therefore
    zeros are locally finite (finitely many in any bounded interval).

    For the distributional identity, the one-dimensional change of variables
    formula for the Dirac delta is considered. If <math|g:I\<to\>\<bbb-R\>>
    is <math|C<rsup|1>> on interval <math|I> with
    <math|<wide|g|\<dot\>><around|(|x|)>\<neq\>0> for all <math|x\<in\>I>,
    then

    <\equation>
      \<delta\><around|(|g<around|(|x|)>|)>=<big|sum><rsub|x<rsub|0>:g<around|(|x<rsub|0>|)>=0><frac|\<delta\>*<around|(|x-x<rsub|0>|)>|<around|\||<wide|g|\<dot\>><around|(|x<rsub|0>|)>|\|>>
    </equation>

    Applying this locally around each zero <math|t<rsub|0>> of <math|Z>, and
    since zeros are isolated, the local results can be patched together to
    obtain the global identity:

    <\equation>
      \<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>
    </equation>

    Consequently:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<mathd\>\<mu\>*<around|(|t|)>>|<cell|=\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|<around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>*\<delta\>*<around|(|t-t<rsub|0>|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>*<around|(|d*t|)>>>>>>
    </equation>

    where the last equality uses the fact that

    <\equation>
      <frac|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>=1
    </equation>

    when evaluating at <math|t=t<rsub|0>>.
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
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|5|13>>
    <associate|auto-11|<tuple|5.1|13>>
    <associate|auto-12|<tuple|5.2|14>>
    <associate|auto-13|<tuple|6|17>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|2|5>>
    <associate|auto-5|<tuple|3|7>>
    <associate|auto-6|<tuple|3.1|7>>
    <associate|auto-7|<tuple|3.2|8>>
    <associate|auto-8|<tuple|3.3|10>>
    <associate|auto-9|<tuple|4|11>>
    <associate|cor:evol_spec|<tuple|13|9>>
    <associate|covar|<tuple|20|5>>
    <associate|def:L|<tuple|20|16>>
    <associate|def:L2loc|<tuple|2|2>>
    <associate|def:Utheta|<tuple|4|2>>
    <associate|def:cramer|<tuple|11|7>>
    <associate|def:osc_proc|<tuple|8|5>>
    <associate|def:regularity|<tuple|23|17>>
    <associate|def:sigma_compact|<tuple|1|2>>
    <associate|def:zeromeasure|<tuple|16|13>>
    <associate|labeldef:Hmu|<tuple|18|14>>
    <associate|labelrem:scaffold|<tuple|22|17>>
    <associate|lem:delta|<tuple|24|17>>
    <associate|prop:atomic|<tuple|19|15>>
    <associate|prop:conjugation|<tuple|14|10>>
    <associate|prop:inverse|<tuple|5|3>>
    <associate|sec:HP|<tuple|5|13>>
    <associate|sec:appendix|<tuple|6|17>>
    <associate|sec:functionspaces|<tuple|1|2>>
    <associate|sec:oscillatory|<tuple|2|5>>
    <associate|sec:samplepaths|<tuple|4|11>>
    <associate|sec:stationary_timechange|<tuple|3|7>>
    <associate|thm:Utheta_to_osc|<tuple|12|8>>
    <associate|thm:atomic|<tuple|17|13>>
    <associate|thm:existence_osc|<tuple|10|6>>
    <associate|thm:global_unitarity|<tuple|7|4>>
    <associate|thm:local_unitarity|<tuple|6|3>>
    <associate|thm:paths_loc|<tuple|15|11>>
    <associate|thm:spectrum|<tuple|21|16>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Function
      Spaces and Unitary Time Change> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc><with|mode|<quote|math>|\<sigma\>>-compact
      sets and local <with|mode|<quote|math>|L<rsup|2>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Unitary time-change operator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes (Priestley)> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Stationary
      Processes and Time Change> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Stationary processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Stationary
      <with|mode|<quote|math>|\<to\>> oscillatory via
      <with|mode|<quote|math>|U<rsub|\<theta\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Covariance operator
      conjugation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Sample
      Paths Live in <with|mode|<quote|math>|L<rsup|2><rsub|loc>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Zero
      Localization and Hilbert\UPólya Scaffold>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Zero localization measure
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Hilbert space on zeros and
      multiplication operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Appendix:
      Regularity and Simple Zeros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>