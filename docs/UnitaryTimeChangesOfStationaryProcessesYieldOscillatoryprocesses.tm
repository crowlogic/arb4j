<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Processes Yield
  Oscillatory Processes<next-line>and a Functional Framework Toward a
  Hilbert--Pólya Construction>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|September 16, 2025>>

  <abstract-data|<\abstract>
    A unitary time-change operator <math|U<rsub|\<theta\>>> is constructed
    for absolutely continuous, strictly increasing time reparametrizations
    <math|\<theta\>>, acting on functions that are square-integrable over
    <math|\<sigma\>>-compact sets. Applying <math|U<rsub|\<theta\>>> to the
    Cramér spectral representation of a stationary process yields an
    oscillatory process in the sense of Priestley with oscillatory function
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>
    and evolutionary spectrum <math|d*F<rsub|t><around|(|\<lambda\>|)>=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>>.
    It is proved that sample paths of any non-degenerate second-order
    stationary process almost surely lie in
    <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>,
    making the operator applicable to typical realizations. A
    zero-localization measure <math|\<mu\>*<around|(|d*t|)>=\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t>
    induces a Hilbert space <math|L<rsup|2><around|(|\<mu\>|)>> on the zero
    set of an oscillatory process <math|Z>, and the multiplication operator
    <math|<around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>> has pure point,
    simple spectrum equal to the zero set of <math|Z>. This produces a
    concrete operator scaffold consistent with a Hilbert--Pólya-type
    viewpoint.
  </abstract>>

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
    Paths Live in <with|mode|math|L<rsup|2><rsub|\<sigma\><with|mode|text|-comp>>>>
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

  <section|Function Spaces and Unitary Time Change><label|sec:functionspaces>

  <subsection|<math|\<sigma\>>-compact sets and local <math|L<rsup|2>>>

  <\definition>
    [<math|\<sigma\>>-compact sets]<label|def:sigma_compact> A subset
    <math|U\<subseteq\>\<bbb-R\>> is <math|\<sigma\>>-compact if
    <math|U=<big|cup><rsub|n=1><rsup|\<infty\>>K<rsub|n>> with each
    <math|K<rsub|n>> compact.
  </definition>

  <\definition>
    [Square-integrability on <math|\<sigma\>>-compact
    sets]<label|def:L2sigma> Define

    <\equation>
      L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>\<assign\><around*|{|f:\<bbb-R\>\<to\>\<bbb-C\>:<big|int><rsub|U><around|\||f<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>*<text|for
      every <math|\<sigma\>>-compact >U\<subseteq\>\<bbb-R\>|}>
    </equation>
  </definition>

  <\remark>
    Every bounded measurable set in <math|\<bbb-R\>> is
    <math|\<sigma\>>-compact; hence <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>
    contains functions that are square-integrable on every bounded interval,
    including functions with polynomial growth at infinity.
  </remark>

  <subsection|Unitary time-change operator>

  <\definition>
    [Unitary time-change]<label|def:Utheta> Let
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective, with
    <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0> almost everywhere and
    <math|\<theta\><rprime|'><around|(|t|)>=0> only on sets of Lebesgue
    measure zero. The function <math|\<theta\>> maps <math|\<sigma\>>-compact
    sets to <math|\<sigma\>>-compact sets. Define, for <math|f> measurable,

    <\equation>
      <around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>\<assign\><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>f<around|(|\<theta\><around|(|t|)>|)>
    </equation>
  </definition>

  <\proposition>
    [Inverse map]<label|prop:inverse> The inverse map is given by

    <\equation>
      <around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>

    which is well-defined almost everywhere on every <math|\<sigma\>>-compact
    set.
  </proposition>

  <\proof>
    Since <math|\<theta\><rprime|'><around|(|t|)>=0> only on sets of measure
    zero, and <math|\<theta\><rsup|-1>> maps sets of measure zero to sets of
    measure zero (as absolutely continuous bijective functions preserve
    measure-zero sets), the denominator <math|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    is positive almost everywhere. The expression is therefore well-defined
    almost everywhere on every <math|\<sigma\>>-compact set, which suffices
    for defining an element of <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </proof>

  <\theorem>
    [Local unitarity on <math|\<sigma\>>-compact
    sets]<label|thm:local_unitarity> For every <math|\<sigma\>>-compact set
    <math|U\<subseteq\>\<bbb-R\>> and <math|f\<in\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>,

    <\equation>
      <big|int><rsub|U><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|U|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s
    </equation>

    Moreover, <math|U<rsub|\<theta\>><rsup|-1>> is the inverse of
    <math|U<rsub|\<theta\>>> on <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Let <math|f\<in\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>
    and let <math|U> be any <math|\<sigma\>>-compact set. The local
    <math|L<rsup|2>>-norm of <math|U<rsub|\<theta\>>*f> over <math|U> is:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|U><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t>|<cell|=<big|int><rsub|U><around*|\||<sqrt|\<theta\><rprime|'><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|U>\<theta\><rprime|'><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t<eq-number>>>>>
    </align>

    Since <math|\<theta\>> is absolutely continuous and strictly increasing,
    applying the change of variables <math|s=\<theta\><around|(|t|)>> gives
    <math|d*s=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t> almost
    everywhere. Since <math|\<theta\>> maps <math|\<sigma\>>-compact sets to
    <math|\<sigma\>>-compact sets, as <math|t> ranges over <math|U>,
    <math|s=\<theta\><around|(|t|)>> ranges over
    <math|\<theta\><around|(|U|)>>, which is <math|\<sigma\>>-compact.
    Therefore:

    <\equation>
      <big|int><rsub|U>\<theta\><rprime|'><around|(|t|)>*<around|\||f<around|(|\<theta\><around|(|t|)>|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|U|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s
    </equation>

    To verify that <math|U<rsub|\<theta\>><rsup|-1>> is indeed the inverse,
    we compute explicitly. For any <math|f\<in\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>*f|)><around|(|s|)>>|<cell|=<around|(|U<rsub|\<theta\>><rsup|-1>|)>*<around|[|<sqrt|\<theta\><rprime|'><around|(|\<cdummy\>|)>>*f<around|(|\<theta\>|(>\<cdot\><around|)||)>|]><around|(|s|)><eq-number>>>|<row|<cell|>|<cell|=<frac|<around|[|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>*f<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|)>|]>)|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>><eq-number>>>|<row|<cell|>|<cell|=<frac|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>*f<around|(|s|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>><eq-number>>>|<row|<cell|>|<cell|=f<around|(|s|)><eq-number>>>>>
    </align>

    where we used <math|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>=s>.

    Similarly, for any <math|g\<in\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<frac|g<around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<frac|g<around|(|t|)>|<sqrt|\<theta\><rprime|'><around|(|t|)>>><eq-number>>>|<row|<cell|>|<cell|=g<around|(|t|)><eq-number>>>>>
    </align>

    where we used\ 

    <\equation>
      \<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>=t
    </equation>

    Therefore <math|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>=U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>=I>
    on <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </proof>

  <\theorem>
    [Unitarity on <math|L<rsup|2><around|(|\<bbb-R\>|)>>]<label|thm:global_unitarity>
    <math|U<rsub|\<theta\>>:L<rsup|2><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><around|(|\<bbb-R\>|)>>
    is unitary: <math|>

    <\equation>
      <big|int><rsub|\<bbb-R\>><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<bbb-R\>>|\|>*f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s
    </equation>

    \ and <math|U<rsub|\<theta\>><rsup|-1>> is its inverse.
  </theorem>

  <\proof>
    For <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>, we have:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t>|<cell|=<big|int><rsub|\<bbb-R\>>\<theta\><rprime|'><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t<eq-number>>>>>
    </align>

    By the change of variables <math|s=\<theta\><around|(|t|)>> with
    <math|d*s=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t>, and since
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> is bijective:

    <\equation>
      <big|int><rsub|\<bbb-R\>>\<theta\><rprime|'><around|(|t|)>*<around|\||f<around|(|\<theta\><around|(|t|)>|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<bbb-R\>>|\|>*f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s
    </equation>

    The inverse relationship follows from the same computation as in
    Theorem<nbsp><reference|thm:local_unitarity>, applied globally.
  </proof>

  <section|Oscillatory Processes (Priestley)><label|sec:oscillatory>

  <\definition>
    [Oscillatory process]<label|def:osc_proc> Let <math|F> be a finite
    nonnegative Borel measure on <math|\<bbb-R\>>. For each
    <math|t\<in\>\<bbb-R\>>, let <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>>
    and set <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>\<assign\>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>.
    An <em|oscillatory process> is a stochastic process

    <\equation>
      Z<around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure with spectral
    measure <math|F>, that is,

    <\equation>
      \<bbb-E\>*<space|-0.17em><around*|[|\<Phi\>*<around|(|d*\<lambda\>|)><space|0.17em><wide|\<Phi\>*<around|(|d*\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    Its covariance kernel is

    <\equation>
      R<rsub|Z><around|(|t,s|)>=\<bbb-E\><space|-0.17em><around*|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <\remark>
    [Real-valuedness] <math|Z> is real-valued if and only if
    <math|A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>>
    for <math|F>-a.e. <math|\<lambda\>>, equivalently
    <math|\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>>
    for <math|F>-a.e. <math|\<lambda\>>.
  </remark>

  <\theorem>
    [Existence]<label|thm:existence_osc> If <math|F> is finite and
    <math|<around|(|A<rsub|t>|)><rsub|t\<in\>\<bbb-R\>>> is measurable in
    <math|t> with <math|<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>\<less\>\<infty\>>
    for each <math|t>, then there exists a complex orthogonal random measure
    <math|\<Phi\>> with spectral measure <math|F> such that\ 

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>
    </equation>

    \ is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>> and has
    covariance <math|R<rsub|Z>> as above.
  </theorem>

  <\proof>
    We construct the stochastic integral using the standard extension
    procedure. First, define the integral for simple functions of the form
    <math|g<around|(|\<lambda\>|)>=<big|sum><rsub|j=1><rsup|n>c<rsub|j>*<with|math-font-family|bf|1><rsub|E<rsub|j>><around|(|\<lambda\>|)>>
    where <math|<around|{|E<rsub|j>|}>> are disjoint Borel sets with
    <math|F<around|(|E<rsub|j>|)>\<less\>\<infty\>> and
    <math|c<rsub|j>\<in\>\<bbb-C\>>:

    <\equation>
      <big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>\<assign\><big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>
    </equation>

    For such simple functions, the isometry property holds:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|[|<around*|\||<big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>|\|><rsup|2>|]>>|<cell|=\<bbb-E\><around*|[|<around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>|\|><rsup|2>|]><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|n><around|\||c<rsub|j>|\|><rsup|2>*F<around|(|E<rsub|j>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>>>
    </align>

    Since simple functions are dense in <math|L<rsup|2><around|(|F|)>>, we
    extend by continuity to all <math|g\<in\>L<rsup|2><around|(|F|)>>. For
    each <math|t>, since <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>
    and <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>>, we have
    <math|\<varphi\><rsub|t>\<in\>L<rsup|2><around|(|F|)>>. Therefore
    <math|Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>>
    is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>>.

    The covariance is computed as:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>*<big|int><rsub|\<bbb-R\>><wide|\<varphi\><rsub|s><around|(|\<mu\>|)>|\<bar\>><space|0.17em><wide|\<Phi\>*<around|(|d*\<mu\>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<mu\>|)>|\<bar\>>\<bbb-E\>*<around|[|\<Phi\>*<around|(|d*\<lambda\>|)><wide|\<Phi\>*<around|(|d*\<mu\>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>>>
    </align>
  </proof>

  <section|Stationary Processes and Time Change><label|sec:stationary_timechange>

  <subsection|Stationary processes>

  <\definition>
    [Cramér representation]<label|def:cramer> A zero-mean stationary process
    <math|X> with spectral measure <math|F> admits

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)>,<space|2em>R<rsub|X>*<around|(|t-s|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>.
    </equation*>
  </definition>

  <subsection|Stationary <math|\<to\>> oscillatory via
  <math|U<rsub|\<theta\>>>>

  <\theorem>
    [Time change yields oscillatory process]<label|thm:Utheta_to_osc> Let
    <math|X> be zero-mean stationary as in
    Definition<nbsp><reference|def:cramer>. For <math|\<theta\>> as in
    Definition<nbsp><reference|def:Utheta>, define

    <\equation>
      Z<around|(|t|)>\<assign\><around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then <math|Z> is oscillatory with oscillatory function

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    , gain function

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    , and covariance

    <\equation*>
      R<rsub|Z><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>><sqrt|\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|s|)>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>.
    </equation*>
  </theorem>

  <\proof>
    Applying the unitary time change operator to the spectral representation
    of <math|X<around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>*<around|(|d*\<lambda\>|)><eq-number>>>>>
    </align>

    where

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    To verify this constitutes an oscillatory representation according to
    Definition<nbsp><reference|def:osc_proc>, we must write
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>> in the form
    <math|A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>:

    <\align>
      <tformat|<table|<row|<cell|\<varphi\><rsub|t><around|(|\<lambda\>|)>>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<lambda\>*t><eq-number>>>|<row|<cell|>|<cell|=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t><eq-number>>>>>
    </align>

    where

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    Since <math|\<theta\><rprime|'><around|(|t|)>\<geq\>0> almost everywhere
    and <math|\<theta\><rprime|'><around|(|t|)>=0> only on sets of measure
    zero, <math|A<rsub|t><around|(|\<lambda\>|)>> is well-defined almost
    everywhere. Moreover, <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>> for
    each <math|t> since:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>|<cell|=<big|int><rsub|\<bbb-R\>><around*|\||<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<theta\><rprime|'><around|(|t|)><around|\||e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)>*<big|int><rsub|\<bbb-R\>>d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)>*F<around|(|\<bbb-R\>|)>\<less\>\<infty\><eq-number>>>>>
    </align>

    where we used <math|<around|\||e<rsup|i*\<alpha\>>|\|>=1> for all real
    <math|\<alpha\>>.

    The covariance is computed as:

    <\align>
      <tformat|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around*|[|<sqrt|\<theta\><rprime|'><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)><sqrt|\<theta\><rprime|'><around|(|s|)>><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|s|)>>*\<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|s|)>>*R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>>>
    </align>
  </proof>

  <\corollary>
    [Evolutionary spectrum]<label|cor:evol_spec> The evolutionary spectrum is\ 

    <\equation>
      d*F<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </corollary>

  <\proof>
    By definition of the evolutionary spectrum and using the gain function
    from Theorem<nbsp><reference|thm:Utheta_to_osc>:

    <\align>
      <tformat|<table|<row|<cell|d*F<rsub|t><around|(|\<lambda\>|)>>|<cell|=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<around*|\||<sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)><around|\||e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*F<around|(|\<lambda\>|)><eq-number>>>>>
    </align>

    since <math|<around|\||e<rsup|i*\<alpha\>>|\|>=1> for all real
    <math|\<alpha\>>.
  </proof>

  <subsection|Covariance operator conjugation>

  <\proposition>
    [Operator conjugation]<label|prop:conjugation> Let
    <math|<around|(|T<rsub|K>*f|)><around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>K<around|(|<around|\||t-s|\|>|)>*<space|0.17em>f<around|(|s|)>*<space|0.17em>d*s>
    with stationary kernel <math|K<around|(|h|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*h>*<space|0.17em>d*F<around|(|\<lambda\>|)>>.
    Define the transformed kernel

    <\equation>
      K<rsub|\<theta\>><around|(|s,t|)>\<assign\><sqrt|\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|s|)>>*<space|0.17em>K<space|-0.17em><around*|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    and operator

    <\equation>
      <around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|s,t|)>*<space|0.17em>f<around|(|s|)>*<space|0.17em>d*s
    </equation>

    Then

    <\equation>
      T<rsub|K<rsub|\<theta\>>>=U<rsub|\<theta\>>*<space|0.17em>T<rsub|K>*<space|0.17em>U<rsub|\<theta\>><rsup|-1>
    </equation>

    \ on <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </proposition>

  <\proof>
    For any <math|g\<in\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>,
    compute <math|<around|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>
    step by step.

    First,\ 

    <\equation>
      <around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>

    Second,\ 

    <\equation>
      <around|(|T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>=<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||t-s|\|>|)><frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>*<space|0.17em>d*s
    </equation>

    Apply change of variables <math|u=\<theta\><rsup|-1><around|(|s|)>>, so
    <math|s=\<theta\><around|(|u|)>> and <math|d*s=\<theta\><rprime|'><around|(|u|)>*<space|0.17em>d*u>:

    <\align>
      <tformat|<table|<row|<cell|<around|(|T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||t-\<theta\><around|(|u|)>|\|>|)><frac|g<around|(|u|)>|<sqrt|\<theta\><rprime|'><around|(|u|)>>>*\<theta\><rprime|'><around|(|u|)>*<space|0.17em>d*u<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||t-\<theta\><around|(|u|)>|\|>|)>*g<around|(|u|)><sqrt|\<theta\><rprime|'><around|(|u|)>>*<space|0.17em>d*u<eq-number>>>>>
    </align>

    Third, <math|<around|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<around|(|T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)>>:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|=<sqrt|\<theta\><rprime|'><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)>*g<around|(|u|)><sqrt|\<theta\><rprime|'><around|(|u|)>>*<space|0.17em>d*u<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|u|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)>*g<around|(|u|)>*<space|0.17em>d*u<eq-number>>>>>
    </align>

    Finally, changing variables back with <math|s=\<theta\><around|(|u|)>>:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*g<around|(|s|)>*<space|0.17em>d*s<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|s,t|)>*g<around|(|s|)>*<space|0.17em>d*s<eq-number>>>|<row|<cell|>|<cell|=<around|(|T<rsub|K<rsub|\<theta\>>>*g|)><around|(|t|)><eq-number>>>>>
    </align>

    This establishes the conjugation relation
    <math|T<rsub|K<rsub|\<theta\>>>=U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>>.
  </proof>

  <section|Sample Paths Live in <math|L<rsup|2><rsub|\<sigma\><text|-comp>>>><label|sec:samplepaths>

  <\theorem>
    [Sample paths in <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>]<label|thm:paths_sigma_comp>
    Let <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> be a
    second-order stationary process with <math|\<sigma\><rsup|2>\<assign\>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>\<less\>\<infty\>>.
    Then, almost surely, every sample path
    <math|t\<mapsto\>X<around|(|\<omega\>,t|)>> belongs to
    <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Fix any bounded interval <math|<around|[|a,b|]>> and consider the random
    variable\ 

    <\equation>
      Y<rsub|<around|[|a,b|]>>\<assign\><big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*<space|0.17em>d*t
    </equation>

    By stationarity and Fubini's theorem:

    <\equation>
      \<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=\<bbb-E\><around*|[|<big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*<space|0.17em>d*t|]>=<big|int><rsub|a><rsup|b>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>*<space|0.17em>d*t=<big|int><rsub|a><rsup|b>\<sigma\><rsup|2>*<space|0.17em>d*t=\<sigma\><rsup|2>*<around|(|b-a|)>\<less\>\<infty\>
    </equation>

    By Markov's inequality, for any <math|M\<gtr\>0>:

    <\equation>
      P*<around|(|Y<rsub|<around|[|a,b|]>>\<gtr\>M|)>\<leq\><frac|\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>|M>=<frac|\<sigma\><rsup|2>*<around|(|b-a|)>|M>
    </equation>

    Taking <math|M\<to\>\<infty\>>, we conclude
    <math|P*<around|(|Y<rsub|<around|[|a,b|]>>\<less\>\<infty\>|)>=1>, i.e.,
    almost surely the sample path is square-integrable on
    <math|<around|[|a,b|]>>.

    Since <math|\<bbb-R\>> is the countable union of bounded intervals:

    <\equation>
      \<bbb-R\>=<big|cup><rsub|n=1><rsup|\<infty\>><around|[|-n,n|]>
    </equation>

    by countable subadditivity of probability:

    <\equation>
      P<around*|(|<big|cap><rsub|n=1><rsup|\<infty\>><around*|{|<big|int><rsub|-n><rsup|n>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>|}>|)>=1
    </equation>

    Now let <math|U> be any <math|\<sigma\>>-compact set. Then
    <math|U=<big|cup><rsub|m=1><rsup|\<infty\>>K<rsub|m>> where each
    <math|K<rsub|m>> is compact. Each compact set <math|K<rsub|m>> is
    bounded, so <math|K<rsub|m>\<subseteq\><around|[|-N<rsub|m>,N<rsub|m>|]>>
    for some <math|N<rsub|m>>. Therefore:

    <\equation>
      <big|int><rsub|U>X<around|(|t|)><rsup|2>*<space|0.17em>d*t=<big|int><rsub|<big|cup><rsub|m=1><rsup|\<infty\>>K<rsub|m>>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<leq\><big|sum><rsub|m=1><rsup|\<infty\>><big|int><rsub|K<rsub|m>>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<leq\><big|sum><rsub|m=1><rsup|\<infty\>><big|int><rsub|-N<rsub|m>><rsup|N<rsub|m>>X<around|(|t|)><rsup|2>*<space|0.17em>d*t
    </equation>

    Since each integral <math|<big|int><rsub|-N<rsub|m>><rsup|N<rsub|m>>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>>
    almost surely, and the sum of countably many finite terms is finite, we
    have <math|<big|int><rsub|U>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>>
    almost surely.

    This holds for every <math|\<sigma\>>-compact set <math|U>, so almost
    surely every sample path lies in <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </proof>

  <section|Zero Localization and Hilbert\UPólya Scaffold><label|sec:HP>

  <subsection|Zero localization measure>

  <\definition>
    [Zero localization measure]<label|def:zeromeasure> Let <math|Z> be
    real-valued with <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>> and only
    simple zeros <math|Z<around|(|t<rsub|0>|)>=0\<Rightarrow\>Z<rprime|'><around|(|t<rsub|0>|)>\<neq\>0>.
    Define, for Borel <math|B\<subset\>\<bbb-R\>>,

    <\equation>
      \<mu\><around|(|B|)>\<assign\><big|int><rsub|\<bbb-R\>><with|math-font-family|bf|1><rsub|B><around|(|t|)>*<space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t
    </equation>
  </definition>

  <\theorem>
    [Atomicity on the zero set]<label|thm:atomic> For every
    <math|\<phi\>\<in\>C<rsub|c><rsup|\<infty\>><around|(|\<bbb-R\>|)>>,

    <\equation>
      <big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)>*<space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<phi\><around|(|t<rsub|0>|)>
    </equation>

    hence\ 

    <\equation>
      \<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>
    </equation>
  </theorem>

  <\proof>
    Since all zeros of <math|Z> are simple and
    <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>>, by the inverse function
    theorem each zero <math|t<rsub|0>> is isolated. Near each zero
    <math|t<rsub|0>>, <math|Z> is locally monotonic, so we can apply the
    one-dimensional change of variables formula for the Dirac delta.

    Specifically, near <math|t<rsub|0>> where
    <math|Z<around|(|t<rsub|0>|)>=0> and <math|Z<rprime|'><around|(|t<rsub|0>|)>\<neq\>0>,
    we have locally <math|Z<around|(|t|)>=<around|(|t-t<rsub|0>|)>*Z<rprime|'><around|(|t<rsub|0>|)>+O<around|(|<around|(|t-t<rsub|0>|)><rsup|2>|)>>.
    The distributional identity for the Dirac delta under smooth changes of
    variables gives:

    <\equation>
      \<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>>
    </equation>

    Therefore:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)>*<space|0.17em>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t>|<cell|=<big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)><space|0.17em><around|\||Z<rprime|'><around|(|t|)>|\|>*<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)><frac|<around|\||Z<rprime|'><around|(|t|)>|\|>*\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>*\<phi\><around|(|t<rsub|0>|)>|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<phi\><around|(|t<rsub|0>|)><eq-number>>>>>
    </align>

    This shows that <math|\<mu\>> is the discrete measure
    <math|\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>>
    assigning unit mass to each zero.
  </proof>

  <subsection|Hilbert space on zeros and multiplication operator>

  <\definition>
    [Hilbert space on the zero set]<label|def:Hmu> Let
    <math|\<cal-H\>\<assign\>L<rsup|2><around|(|\<mu\>|)>> with inner product
    <math|<around|\<langle\>|f,g|\<rangle\>>=<big|int>f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>><space|0.17em>\<mu\>*<around|(|d*t|)>>.
  </definition>

  <\proposition>
    [Atomic structure]<label|prop:atomic> With
    <math|\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>>,

    <\equation>
      \<cal-H\>\<cong\><around*|{|f:<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>\<to\>\<bbb-C\>:<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>\<less\>\<infty\>|}>\<cong\>\<ell\><rsup|2>
    </equation>

    with orthonormal basis <math|<around|{|e<rsub|t<rsub|0>>|}><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>>,
    where <math|e<rsub|t<rsub|0>><around|(|t<rsub|1>|)>=\<delta\><rsub|t<rsub|0>*t<rsub|1>>>.
  </proposition>

  <\proof>
    By the atomic form of <math|\<mu\>>, for any
    <math|f\<in\>L<rsup|2><around|(|\<mu\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|\<\|\|\>|f|\<\|\|\>><rsub|\<cal-H\>><rsup|2>>|<cell|=<big|int><around|\||f<around|(|t|)>|\|><rsup|2>*<space|0.17em>\<mu\>*<around|(|d*t|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><around|\||f<around|(|t|)>|\|><rsup|2>*<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>*<around|(|d*t|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2><eq-number>>>>>
    </align>

    This shows the isomorphism with <math|\<ell\><rsup|2>>. The functions
    <math|e<rsub|t<rsub|0>>> defined by <math|e<rsub|t<rsub|0>><around|(|t<rsub|1>|)>=\<delta\><rsub|t<rsub|0>*t<rsub|1>>>
    satisfy:

    <\equation>
      <around|\<langle\>|e<rsub|t<rsub|0>>,e<rsub|t<rsub|1>>|\<rangle\>>=<big|int>e<rsub|t<rsub|0>><around|(|t|)><wide|e<rsub|t<rsub|1>><around|(|t|)>|\<bar\>><space|0.17em>\<mu\>*<around|(|d*t|)>=<big|sum><rsub|t:Z<around|(|t|)>=0>\<delta\><rsub|t<rsub|0>*t>*\<delta\><rsub|t<rsub|1>*t>=\<delta\><rsub|t<rsub|0>*t<rsub|1>>
    </equation>

    so they form an orthonormal set. Any <math|f\<in\>\<cal-H\>> can be
    written as\ 

    <\equation>
      f=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>f<around|(|t<rsub|0>|)>*e<rsub|t<rsub|0>>
    </equation>

    <math|>proving they form a basis.
  </proof>

  <\definition>
    [Multiplication operator]<label|def:L> Define
    <math|L:\<cal-D\><around|(|L|)>\<subset\>\<cal-H\>\<to\>\<cal-H\>> by
    <math|<around|(|L*f|)><around|(|t|)>=t*<space|0.17em>f<around|(|t|)>> on
    <math|<math-up|supp><around|(|\<mu\>|)>> with domain

    <\equation>
      \<cal-D\><around|(|L|)>\<assign\><around*|{|f\<in\>\<cal-H\>:<big|int><around|\||t*<space|0.17em>f<around|(|t|)>|\|><rsup|2>*<space|0.17em>\<mu\>*<around|(|d*t|)>\<less\>\<infty\>|}>
    </equation>
  </definition>

  <\theorem>
    [Self-adjointness and spectrum]<label|thm:spectrum> <math|L> is
    self-adjoint on <math|\<cal-H\>> and has pure point, simple spectrum

    <\equation>
      \<sigma\><around|(|L|)>=<around|{|t\<in\>\<bbb-R\>:Z<around|(|t|)>=0|}>
    </equation>

    with eigenvalues <math|\<lambda\>=t<rsub|0>> and eigenvectors
    <math|e<rsub|t<rsub|0>>>.
  </theorem>

  <\proof>
    First, we verify self-adjointness. For
    <math|f,g\<in\>\<cal-D\><around|(|L|)>>:

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|L*f,g|\<rangle\>>>|<cell|=<big|int><around|(|L*f|)><around|(|t|)><wide|g<around|(|t|)>|\<bar\>><space|0.17em>\<mu\>*<around|(|d*t|)><eq-number>>>|<row|<cell|>|<cell|=<big|int>t*f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>><space|0.17em>\<mu\>*<around|(|d*t|)><eq-number>>>|<row|<cell|>|<cell|=<big|int>f<around|(|t|)><wide|t*g<around|(|t|)>|\<bar\>><space|0.17em>\<mu\>*<around|(|d*t|)><eq-number>>>|<row|<cell|>|<cell|=<big|int>f<around|(|t|)><wide|<around|(|L*g|)><around|(|t|)>|\<bar\>><space|0.17em>\<mu\>*<around|(|d*t|)><eq-number>>>|<row|<cell|>|<cell|=<around|\<langle\>|f,L*g|\<rangle\>><eq-number>>>>>
    </align>

    Thus <math|L> is symmetric.

    In the atomic representation, <math|L> acts as

    <\equation>
      <around|(|L*f|)><around|(|t<rsub|0>|)>=t<rsub|0>*f<around|(|t<rsub|0>|)>
    </equation>

    \ for each <math|t<rsub|0>> where <math|Z<around|(|t<rsub|0>|)>=0>. This
    is unitarily equivalent to the diagonal operator on
    <math|\<ell\><rsup|2>> with diagonal entries
    <math|<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>>. Such diagonal
    operators are self-adjoint.

    For the spectrum calculation: We have

    <\equation>
      L*e<rsub|t<rsub|0>>=t<rsub|0>*e<rsub|t<rsub|0>>
    </equation>

    so each <math|t<rsub|0>> where <math|Z<around|(|t<rsub|0>|)>=0> is an
    eigenvalue of <math|L> with eigenvector <math|e<rsub|t<rsub|0>>>. Since
    <math|<around|{|e<rsub|t<rsub|0>>|}>> forms an orthonormal basis,
    <math|L> has pure point spectrum.

    To show there are no other spectral points, suppose
    <math|\<lambda\>\<nin\><around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>>.
    Then for any <math|f\<in\>\<cal-D\><around|(|L|)>>,
    <math|<around|(|L-\<lambda\>*I|)>*f> has components

    <\equation>
      <around|(|<around|(|L-\<lambda\>*I|)>*f|)><around|(|t<rsub|0>|)>=<around|(|t<rsub|0>-\<lambda\>|)>*f<around|(|t<rsub|0>|)>
    </equation>

    Since <math|t<rsub|0>-\<lambda\>\<neq\>0> for all zeros <math|t<rsub|0>>,
    we can solve

    <\equation>
      <around|(|L-\<lambda\>*I|)>*f=g
    </equation>

    \ uniquely for any <math|g\<in\>\<cal-H\>> by setting

    <\equation>
      f<around|(|t<rsub|0>|)>=<frac|g<around|(|t<rsub|0>|)>|t<rsub|0>-\<lambda\>>
    </equation>

    This shows <math|L-\<lambda\>*I> is invertible, so
    <math|\<lambda\>\<nin\>\<sigma\><around|(|L|)>>. Therefore

    <\equation>
      \<sigma\><around|(|L|)>=<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>
    </equation>

    and the eigenvalues are simple.
  </proof>

  <\remark>
    [Operator scaffold]<label|rem:scaffold> The construction

    <\equation>
      <text|stationary >X<long-arrow|\<rubber-rightarrow\>|U<rsub|\<theta\>>><text|oscillatory
      >Z<long-arrow|\<rubber-rightarrow\>|\<mu\>=\<delta\><around|(|Z|)><around|\||Z<rprime|'>|\|>*<space|0.17em>d*t>L<rsup|2><around|(|\<mu\>|)><long-arrow|\<rubber-rightarrow\>|L:t\<cdot\>><around|(|L,\<sigma\><around|(|L|)>|)>
    </equation>

    produces a concrete self-adjoint operator whose spectrum equals the zero
    set of <math|Z>, determined by the choice of time-change <math|\<theta\>>
    and spectral measure <math|F>. This provides an explicit realization
    consistent with Hilbert\UPólya approaches to encoding arithmetic
    information in operator spectra.
  </remark>

  <section|Appendix: Regularity and Simple Zeros><label|sec:appendix>

  <\definition>
    [Regularity and simplicity]<label|def:regularity> Assume
    <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>> and every zero is simple:
    <math|Z<around|(|t<rsub|0>|)>=0\<Rightarrow\>Z<rprime|'><around|(|t<rsub|0>|)>\<neq\>0>.
  </definition>

  <\lemma>
    [Local finiteness and delta decomposition]<label|lem:delta> Under
    Definition<nbsp><reference|def:regularity>, zeros are locally finite and

    <\equation>
      \<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>>
    </equation>

    whence <math|\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>>.
  </lemma>

  <\proof>
    Since <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>> and
    <math|Z<rprime|'><around|(|t<rsub|0>|)>\<neq\>0> at each zero
    <math|t<rsub|0>>, the inverse function theorem implies that <math|Z> is
    locally invertible near each zero. Specifically, there exists a
    neighborhood <math|U<rsub|t<rsub|0>>> of <math|t<rsub|0>> such that
    <math|Z\|<rsub|U<rsub|t<rsub|0>>>> is strictly monotonic and invertible.

    This implies zeros are isolated: if <math|Z<around|(|t<rsub|0>|)>=0> and
    <math|Z<rprime|'><around|(|t<rsub|0>|)>\<neq\>0>, then there exists
    <math|\<epsilon\>\<gtr\>0> such that <math|Z<around|(|t|)>\<neq\>0> for
    <math|0\<less\><around|\||t-t<rsub|0>|\|>\<less\>\<epsilon\>>. Therefore
    zeros are locally finite (finitely many in any bounded interval).

    For the distributional identity, consider the one-dimensional change of
    variables formula for the Dirac delta. If <math|g:I\<to\>\<bbb-R\>> is
    <math|C<rsup|1>> on interval <math|I> with
    <math|g<rprime|'><around|(|x|)>\<neq\>0> for all <math|x\<in\>I>, then

    <\equation>
      \<delta\><around|(|g<around|(|x|)>|)>=<big|sum><rsub|x<rsub|0>:g<around|(|x<rsub|0>|)>=0><frac|\<delta\>*<around|(|x-x<rsub|0>|)>|<around|\||g<rprime|'><around|(|x<rsub|0>|)>|\|>>
    </equation>

    Applying this locally around each zero <math|t<rsub|0>> of <math|Z>, and
    since zeros are isolated, we can patch together the local results to
    obtain the global identity:

    <\equation>
      \<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>>
    </equation>

    Consequently:

    <\equation>
      \<mu\>*<around|(|d*t|)>=\<delta\><around|(|Z<around|(|t|)>|)><around|\||Z<rprime|'><around|(|t|)>|\|>*<space|0.17em>d*t=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|<around|\||Z<rprime|'><around|(|t|)>|\|>|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>>*\<delta\>*<around|(|t-t<rsub|0>|)>*<space|0.17em>d*t=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>*<around|(|d*t|)>
    </equation>

    where the last equality uses the fact that
    <math|<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>/<around|\||Z<rprime|'><around|(|t<rsub|0>|)>|\|>=1>
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
    <associate|auto-10|<tuple|5|10>>
    <associate|auto-11|<tuple|5.1|10>>
    <associate|auto-12|<tuple|5.2|11>>
    <associate|auto-13|<tuple|6|13>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|2|4>>
    <associate|auto-5|<tuple|3|6>>
    <associate|auto-6|<tuple|3.1|6>>
    <associate|auto-7|<tuple|3.2|6>>
    <associate|auto-8|<tuple|3.3|8>>
    <associate|auto-9|<tuple|4|9>>
    <associate|cor:evol_spec|<tuple|13|7>>
    <associate|def:Hmu|<tuple|18|11>>
    <associate|def:L|<tuple|20|12>>
    <associate|def:L2sigma|<tuple|2|2>>
    <associate|def:Utheta|<tuple|4|2>>
    <associate|def:cramer|<tuple|11|6>>
    <associate|def:osc_proc|<tuple|8|4>>
    <associate|def:regularity|<tuple|23|13>>
    <associate|def:sigma_compact|<tuple|1|2>>
    <associate|def:zeromeasure|<tuple|16|10>>
    <associate|lem:delta|<tuple|24|14>>
    <associate|prop:atomic|<tuple|19|11>>
    <associate|prop:conjugation|<tuple|14|8>>
    <associate|prop:inverse|<tuple|5|2>>
    <associate|rem:scaffold|<tuple|22|13>>
    <associate|sec:HP|<tuple|5|10>>
    <associate|sec:appendix|<tuple|6|13>>
    <associate|sec:functionspaces|<tuple|1|2>>
    <associate|sec:oscillatory|<tuple|2|4>>
    <associate|sec:samplepaths|<tuple|4|9>>
    <associate|sec:stationary_timechange|<tuple|3|6>>
    <associate|thm:Utheta_to_osc|<tuple|12|6>>
    <associate|thm:atomic|<tuple|17|10>>
    <associate|thm:existence_osc|<tuple|10|5>>
    <associate|thm:global_unitarity|<tuple|7|4>>
    <associate|thm:local_unitarity|<tuple|6|3>>
    <associate|thm:paths_sigma_comp|<tuple|15|9>>
    <associate|thm:spectrum|<tuple|21|12>>
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
      Paths Live in <with|mode|<quote|math>|L<rsup|2><rsub|\<sigma\><with|mode|<quote|text>|-comp>>>>
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