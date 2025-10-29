<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

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
    and evolutionary spectrum <math|d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>d*F<around|(|\<lambda\>|)>>.
    It is proved that sample paths of any non-degenerate second-order
    stationary process almost surely lie in
    <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>, making the operator
    applicable to typical realizations. A zero-localization measure
    <math|\<mathd\>\<mu\>*<around|(|*t|)>=\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t>
    induces a Hilbert space <math|L<rsup|2><around|(|\<mu\>|)>> on the zero
    set of an oscillatory process <math|Z>, and the multiplication operator
    <math|<around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>> has simple pure
    point spectrum equal to the zero crossing set of <math|Z>. This produces
    a concrete operator scaffold consistent with a Hilbert\UPólya-type
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

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Unitarily
    Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
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

    <with|par-left|1tab|5.3<space|2spc>Regularity and Simplicity of The Zeros
    of <with|mode|math|Z<around*|(|t|)>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|5.4<space|2spc>Kac-Rice Formula For The Expected Zero
    Count <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>
  </table-of-contents>

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
    <strong|[Unitary time-change]<label|def:Utheta>> Let the time-scaling
    function <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely
    continuous, strictly increasing, and bijective, with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> almost everywhere
    and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    Lebesgue measure zero. The function <math|\<theta\>> maps
    <math|\<sigma\>>-compact sets to <math|\<sigma\>>-compact sets. Define,
    for <math|f> measurable,

    <\equation>
      <around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)><label|U>
    </equation>
  </definition>

  <\proposition>
    <strong|[Inversion of Unitary time-change]<label|prop:inverse> >The
    inverse of the unitary time-change operator <math|U> in Equation
    (<reference|U>) is given by

    <\equation>
      <around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>

    which is well-defined almost everywhere on every <math|\<sigma\>>-compact
    set.
  </proposition>

  <\proof>
    Since <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    measure zero, and <math|\<theta\><rsup|-1>> maps sets of measure zero to
    sets of measure zero because of the fact that absolutely continuous
    bijective functions preserve measure-zero sets, the denominator
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
    <math|C> be any <math|\<sigma\>>-compact set. The local
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
    it is seen that:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|(|U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>*f|)><around|(|s|)>>|<cell|=<around*|(|U<rsub|\<theta\>><rsup|-1>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*f<around|(|\<theta\><around|(|s|)>|)>|)><around|(|s|)>>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>*f<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|)>>|<cell|>|<cell|>|<cell|>|<cell|\<forall\>f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>>|<row|<cell|>|<cell|=f<around|(|s|)>>|<cell|>|<cell|>|<cell|>|<cell|>>>>>
    </equation>

    since

    <\equation>
      \<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>=s
    </equation>

    and similarly, its also plain to see that:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|(|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)>>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>>*g<around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>|<cell|>|<cell|>|<cell|>|<cell|\<forall\>g\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>*g<around|(|t|)>>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|=g<around|(|t|)>>|<cell|>|<cell|>|<cell|>|<cell|>>>>>
    </equation>

    since\ 

    <\equation>
      \<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>=t
    </equation>

    Therefore

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around*|(|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>
      f|)><around*|(|t|)>>|<cell|=<around*|(|U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>
      f|)><around*|(|t|)>>>|<row|<cell|>|<cell|=f<around*|(|t|)>>>>>>
    </equation>

    on <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
  </proof>

  <subsection|Gaussian Processes>

  <subsubsection|Stationary processes>

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

  <subsubsection|Oscillatory Processes (Priestley)><label|sec:oscillatory>

  <\definition>
    <strong|[Oscillatory process]<label|def:osc_proc> >Let <math|F> be a
    finite nonnegative Borel measure on <math|\<bbb-R\>>. Let

    <\equation>
      A<rsub|t>\<in\>L<rsup|2><around|(|F|)>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    be the gain function and

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t><label|of>
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

  <\theorem>
    <strong|[Real-valuedness criterion for oscillatory
    processes]<label|thm:realvaluedness>>Let <math|Z> be an oscillatory
    process with oscillatory function

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    and spectral measure <math|F>. Then <math|Z> is real-valued if and only
    if

    <\equation>
      A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    for <math|F>-almost every <math|\<lambda\>\<in\>\<bbb-R\>>, equivalently

    <\equation>
      \<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    for <math|F>-almost every <math|\<lambda\>\<in\>\<bbb-R\>>.
  </theorem>

  <\proof>
    Assume <math|Z> is real-valued, i.e.

    <\equation>
      Z<around|(|t|)>=<wide|Z<around|(|t|)>|\<bar\>><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    Writing its oscillatory representation,

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*\<mathd\>\<Phi\><around|(|\<lambda\>|)>
    </equation>

    and taking the complex conjugate gives

    <\equation>
      <wide|Z<around|(|t|)>|\<bar\>>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>\<mathd\><wide|\<Phi\>*<around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    For a real-valued process, the orthogonal random measure <math|\<Phi\>>
    must satisfy

    <\equation>
      \<mathd\><wide|\<Phi\>*<around|(|\<lambda\>|)>|\<bar\>>=-\<mathd\>
      \<Phi\>*<around|(|*\<lambda\>|)>
    </equation>

    which ensures that the spectral representation produces real values.
    Substituting this identity and using the substitution\ 

    <\equation>
      \<mu\>=-\<lambda\>
    </equation>

    it is shown that

    <\equation>
      <wide|Z<around|(|t|)>|\<bar\>>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>e<rsup|i*\<mu\>*t>*\<mathd\>
      \<Phi\>*<around|(|\<mu\>|)>
    </equation>

    Since <math|Z<around|(|t|)>=<wide|Z<around|(|t|)>|\<bar\>>>, comparison
    of the integrands (which are unique elements of
    <math|L<rsup|2><around|(|F|)>>) yields

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<wide|A<rsub|t>*<around|(|-\<lambda\>|)>|\<bar\>><space|1em><text|for
      >F*<text|-a.e. >\<lambda\>
    </equation>

    Equivalently, because the oscillatory function (<reference|of>) is given
    by

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    we have

    <\equation>
      \<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|1em><text|for
      >F*<text|-a.e. >\<lambda\>
    </equation>

    Conversely, if <math|>

    <\equation>
      A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    \ for <math|F>-a.e. <math|\<lambda\>>, then the same substitution shows
    that

    <\equation>
      <wide|Z<around|(|t|)>|\<bar\>>=Z<around|(|t|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    so <math|Z> is real-valued. This completes the proof.
  </proof>

  <strong|[Existence]><label|thm:existence_osc> Let <math|F> be an absolutely
  continuous spectral measure and the gain function

  <\equation>
    A<rsub|t><around*|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>\<forall\>\<bbb-R\>\<ni\>t\<less\>\<infty\>
  </equation>

  \ be measurable in both time and frequency then the time-dependent spectral
  density is defined by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|S<rsub|t><around*|(|\<lambda\>|)>>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>\<less\>\<infty\>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*S<around*|(|\<lambda\>|)>d\<lambda\>>>>>>
  </equation>

  and there exists a complex orthogonal random measure <math|\<Phi\>> with
  spectral measure <math|F> such that for each sample path
  <math|\<varpi\>\<in\>\<Theta\>> in the space of sample paths having given
  covariance constituting the ensemble denoted <math|\<Theta\>>

  <\equation>
    Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>\<mathd\>\<Phi\><around|(|\<lambda\>|)>
  </equation>

  is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>> and has
  covariance <math|R<rsub|Z>> as in (<reference|covar>) above.

  <\proof>
    The proof proceeds by constructing the stochastic integral using the
    standard extension procedure. First, the integral is defined for simple
    functions of the form

    <\equation>
      g<around|(|\<lambda\>|)>=lim<rsub|n\<rightarrow\>\<infty\>><big|sum><rsub|j=1><rsup|n>c<rsub|j><text|<with|font-series|bold|1>><rsub|E<rsub|j>><around|(|\<lambda\>|)>
    </equation>

    where <math|<around|{|E<rsub|j>|}>> are disjoint Borel sets with
    <math|F<around|(|E<rsub|j>|)>\<less\>\<infty\>> and
    <math|c<rsub|j>\<in\>\<bbb-C\>>:

    <\equation>
      <big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*\<mathd\>\<Phi\><around|(|\<lambda\>|)>=lim<rsub|n\<rightarrow\>\<infty\>><big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>
    </equation>

    For simple functions such as this, the isometry property holds:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<bbb-E\><around*|[|<around*|\||<big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*<space|0.17em>\<Phi\>\<mathd\><around|(|*\<lambda\>|)>|\|><rsup|2>|]>>|<cell|=\<bbb-E\><around*|[|lim<rsub|n\<rightarrow\>\<infty\>><around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>|\|><rsup|2>|]>>>|<row|<cell|>|<cell|=lim<rsub|n\<rightarrow\>\<infty\>><big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=lim<rsub|n\<rightarrow\>\<infty\>><big|sum><rsub|j=1><rsup|n><around|\||c<rsub|j>|\|><rsup|2>*F<around*|(|E<rsub|j>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>

    Since simple functions are dense in <math|L<rsup|2><around|(|F|)>>, the
    integral is extended by continuity \<forall\><math|g\<in\>L<rsup|2><around|(|F|)>>
    since the oscillatory function (<reference|of>) is defined by

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>\<in\>L<rsup|2><around|(|F|)>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    and <math|A<rsub|t>\<in\>>. Therefore

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*\<mathd\>\<Phi\>*<around|(|\<lambda\>|)>
    </equation>

    is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>>. The covariance
    is computed as:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>\<mathd\>\<Phi\>*<around|(|\<lambda\>|)>*<big|int><rsub|\<bbb-R\>><wide|\<varphi\><rsub|s><around|(|\<mu\>|)>|\<bar\>>\<mathd\><wide|\<Phi\>*<around|(|\<mu\>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<mu\>|)>|\<bar\>>\<mathd\>\<bbb-E\>*<around|[|\<Phi\><around|(|\<lambda\>|)><wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>
  </proof>

  <section|Unitarily Time-Changed Stationary
  Processes><label|sec:stationary_timechange>

  <subsection|Stationary <math|\<to\>> oscillatory via
  <math|U<rsub|\<theta\>>>>

  <\theorem>
    <strong|[Unitary time change yields oscillatory
    process]<label|thm:Utheta_to_osc>> Let <math|X> be zero-mean stationary
    as in Definition<nbsp><reference|def:cramer>. For scaling function
    <math|\<theta\>> as in Definition<nbsp><reference|def:Utheta>, define

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>>>>>>
    </equation>

    Then <math|Z> is a realization of an oscillatory process with oscillatory
    function

    <\equation>
      \<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    gain function

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    and covariance

    <\equation>
      <tabular|<tformat|<cwith|1|5|1|1|cell-halign|l>|<cwith|1|5|1|1|cell-lborder|0ln>|<cwith|1|5|2|2|cell-halign|l>|<cwith|1|5|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around*|[|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)><wide|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*\<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>><label|covar>
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
    sets of measure zero, <math|A<rsub|t><around|(|\<lambda\>|)>> is well
    defined almost everywhere. Moreover, <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>>
    for each <math|t> since:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>|<cell|=<big|int><rsub|\<bbb-R\>><around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*<big|int><rsub|\<bbb-R\>>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*F<around|(|\<bbb-R\>|)>\<less\>\<infty\>>>>>>
    </equation>

    where <math|<around|\||e<rsup|i*\<alpha\>>|\|>=1> for all real
    <math|\<alpha\>> is used. The covariance (<reference|covar>) is computed
    by substituting the spectral representation and applying Fubuni's theorem
    to interchange the order of operations.

    <\equation>
      <tabular*|<tformat|<table|<row|<cell|>|<cell|>>>>>
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
    For any <math|g\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>, compute:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|(|<around|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>|)>*g|)><around|(|t|)>>|<cell|=<around|(|U<rsub|\<theta\>>*<around|(|T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*g|)>|)><around|(|t|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<around|(|T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-w|\|>|)>*<around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|w|)>*<space|0.17em>d*w>>>>>
    </equation>

    Substitute <math|w=\<theta\><around|(|s|)>> with
    <math|d*w=<wide|\<theta\>|\<dot\>><around|(|s|)>*<space|0.17em>d*s>:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><frac|g<around|(|s|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>>*<wide|\<theta\>|\<dot\>><around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*g<around|(|s|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)><wide|\<theta\>|\<dot\>><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>*g<around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|t,s|)>*g<around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<around|(|T<rsub|K<rsub|\<theta\>>>*g|)><around|(|t|)>>>>>>
    </equation>

    where

    <\equation>
      K<rsub|\<theta\>><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)><wide|\<theta\>|\<dot\>><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
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

    By Markov's inequality, for any <math|M\<gtr\>0>:

    <\equation>
      P*<around|(|Y<rsub|<around|[|a,b|]>>\<gtr\>M|)>\<leq\><frac|\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>|M>=<frac|\<sigma\><rsup|2>*<around|(|b-a|)>|M>
    </equation>

    Taking <math|M\<to\>\<infty\>>, the conclusion is

    <\equation>
      P*<around|(|Y<rsub|<around|[|a,b|]>>\<less\>\<infty\>|)>=1
    </equation>

    i.e., almost surely the sample path is square-integrable on
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

  <subsection|Regularity and Simplicity of The Zeros of
  <math|Z<around*|(|t|)>>>

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

  <subsection|Kac-Rice Formula For The Expected Zero Count>

  <\theorem>
    <dueto|Kac-Rice Formula for Zero Crossings><label|thm:kac_rice>Let
    <math|Z<around|(|t|)>> be a centered Gaussian process on
    <math|<around|[|a,b|]>> with covariance
    <math|K<around|(|s,t|)>=\<bbb-E\>*<around|[|Z<around|(|s|)>*Z<around|(|t|)>|]>>
    then the expected number of zeros in <math|<around|[|a,b|]>> is

    <\equation>
      <label|eq:kac_rice>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><sqrt|<frac|2|\<pi\>>>*<frac|<sqrt|K<around|(|t,t|)>*K<rsub|<wide|Z|\<dot\>>><around|(|t,t|)>-K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)><rsup|2>>|K<around|(|t,t|)>>*<space|0.17em>d*t
    </equation>

    where

    <\equation>
      K<around|(|t,t|)>=\<bbb-E\><around|[|Z<around|(|t|)><rsup|2>|]>
    </equation>

    <\equation>
      K<rsub|<wide|Z|\<dot\>>><around|(|t,t|)>=-\<partial\><rsup|2><rsub|s>*\<partial\><rsub|t>*K<around|(|s,t|)>\|<rsub|s=t>
    </equation>

    and

    <\equation>
      K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)>=\<partial\><rsub|s>*K<around|(|s,t|)>\|<rsub|s=t>
    </equation>
  </theorem>

  <\proof>
    \;

    <\enumerate>
      The exact zero counting function is\ 

      <\equation>
        N<rsub|<around|[|a,b|]>>=<big|int><rsub|a><rsup|b>\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t
      </equation>

      so

      <\equation>
        <label|eq:expectation><tabular|<tformat|<table|<row|<cell|\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>>|<cell|=<big|int><rsub|a><rsup|b>\<bbb-E\><around|[|\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>|]>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|a><rsup|b><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||v|\|>*<space|0.17em>p<rsub|Z,<wide|Z|\<dot\>>><around|(|0,v|)>*<space|0.17em>d*v*<space|0.17em>d*t>>>>>
      </equation>

      The vector <math|<around|(|Z<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>|)>>
      is bivariate Gaussian with covariance matrix\ 

      <\equation>
        \<Sigma\>=<matrix|<tformat|<table|<row|<cell|K<around|(|t,t|)>>|<cell|K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)>>>|<row|<cell|K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)>>|<cell|K<rsub|<wide|Z|\<dot\>>><around|(|t,t|)>>>>>>
      </equation>

      whose determinant is given by

      <\equation>
        det \<Sigma\>=K<around|(|t,t|)>*K<rsub|<wide|Z|\<dot\>>><around|(|t,t|)>-K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)><rsup|2>
      </equation>

      the inverse of which satisfies

      <\equation>
        \<Sigma\><rsup|-1><rsub|22>=<frac|K<around|(|t,t|)>|det \<Sigma\>>
      </equation>

      \ yielding

      <\equation>
        p<rsub|Z,<wide|Z|\<dot\>>><around|(|0,v|)>=<frac|1|<sqrt|2*\<pi\>*K<around|(|t,t|)>>>\<cdot\><frac|*exp
        <around*|(|-<frac|K<around|(|t,t|)>*v<rsup|2>|2*det
        \<Sigma\>>|)>|<sqrt|2*\<pi\>*det \<Sigma\>/K<around|(|t,t|)>>>
      </equation>

      which factorizes as <math|p<rsub|Z><around|(|0|)>\<cdot\>p<rsub|<wide|Z|\<dot\>>\|Z><around|(|v\|0|)>>
      where

      <\equation>
        p<rsub|Z><around|(|0|)>=<frac|1|<sqrt|2*\<pi\>*K<around|(|t,t|)>>>
      </equation>

      \ and <math|>

      <\equation>
        <wide|Z|\<dot\>>\|Z=0\<sim\>\<cal-N\><around|(|0,det
        \<Sigma\>/K<around|(|t,t|)>|)>
      </equation>

      For zero-mean Gaussian <math|Y\<sim\>\<cal-N\><around|(|0,\<sigma\><rsup|2>|)>>,
      direct integration gives

      <\equation>
        <tabular|<tformat|<table|<row|<cell|\<bbb-E\><around|[|<around|\||Y|\|>|]>>|<cell|=2*<big|int><rsub|0><rsup|\<infty\>><frac|y|<sqrt|2*\<pi\>*\<sigma\><rsup|2>>>*e<rsup|-y<rsup|2>/<around|(|2*\<sigma\><rsup|2>|)>>*d*y>>|<row|<cell|>|<cell|=<frac|2*\<sigma\>|<sqrt|2*\<pi\>>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-u>*d*u>>|<row|<cell|>|<cell|=<sqrt|<frac|2|\<pi\>>>*\<sigma\>>>>>>
      </equation>

      so that combining results yields

      <\equation>
        <tabular|<tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||v|\|>*<space|0.17em>p<rsub|Z,<wide|Z|\<dot\>>><around|(|0,v|)>*<space|0.17em>d*v>|<cell|=<frac|<sqrt|<frac|2|\<pi\>>>*<sqrt|<frac|det
        \<Sigma\>|K<around|(|t,t|)>>>|<sqrt|2*\<pi\>*K<around|(|t,t|)>>>>>|<row|<cell|>|<cell|=<sqrt|<frac|2|\<pi\>>>*<frac|<sqrt|det
        \<Sigma\>>|K<around|(|t,t|)>>>>>>>
      </equation>
    </enumerate>
  </proof>

  <\theorem>
    <strong|[Expected Zero-Counting Function]><label|thm:expected_zero_counting>Let
    <math|\<theta\>\<in\>\<cal-F\>> and let

    <\equation>
      <label|eq:covariance_def>K<around|(|t,s|)>=<math-up|cov><around|(|Z<around|(|t|)>,Z<around|(|s|)>|)>
    </equation>

    be twice differentiable at <math|s=0> and <math|t=0> then expected number
    of zeros of the process <math|Z<around*|(|t|)>> in
    <math|<around|[|a,b|]>> is

    <\equation>
      <label|eq:expected_zeros>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<sqrt|-K<around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>
    </equation>
  </theorem>

  <\proof>
    The covariance function of the time-changed process is

    <\equation>
      <label|eq:time_changed_cov>K<rsub|\<theta\>><around|(|s,t|)>=<math-up|cov><around|(|Z<around*|(|t|)>,Z<around*|(|s|)>|)>=<sqrt|\<theta\><around|(|s|)>\<theta\><around*|(|t|)>>**<space|0.17em>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    For the zero-crossing analysis, consider the normalized process. By the
    Kac-Rice formula:

    <\equation>
      <label|eq:kac_rice_formula>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><sqrt|-lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>>*<space|0.17em>d*t
    </equation>

    Computing the mixed partial derivative:

    <\equation>
      <label|eq:mixed_partial><frac|\<partial\>|\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>=<frac|1|2>*<frac|<wide|\<theta\>|\<dot\>><around|(|t|)>|<sqrt|\<theta\><around|(|t|)>>>*<sqrt|\<theta\><rprime|'><around|(|s|)>>*<space|0.17em>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    <\equation>
      <label|eq:mixed_partial_continued>+<sqrt|\<theta\><around|(|s|)>>*<sqrt|\<theta\><around|(|t|)>>*<space|0.17em><wide|K|\<dot\>><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><math-up|sgn><around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>*<space|0.17em><wide|\<theta\>|\<dot\>><around|(|t|)>
    </equation>

    Taking the limit as <math|s\<to\>t> and using the fact that
    <math|<wide|K|\<dot\>><around|(|0|)>=0> for stationary processes:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|\<theta\>><around|(|s,t|)>>|<cell|=<wide|\<theta\>|\<dot\>><around|(|s|)><space|0.17em><wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em><wide|K|\<ddot\>><around|(|0|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<space|0.17em><wide|K|\<ddot\>><around|(|0|)>>>>>><label|eq:limit_mixed_partial>
    </equation>

    Substituting into the Kac-Rice formula we have

    <\equation>
      <label|eq:substituted_kac_rice><tabular|<tformat|<table|<row|<cell|\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>>|<cell|=<big|int><rsub|a><rsup|b><sqrt|-<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<space|0.17em><wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<big|int><rsub|a><rsup|b><wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>>>>>>
    </equation>

    since <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<geq\>0> almost
    everywhere.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|U|<tuple|3|2>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|3|9>>
    <associate|auto-11|<tuple|4|9>>
    <associate|auto-12|<tuple|4.1|10>>
    <associate|auto-13|<tuple|4.2|12>>
    <associate|auto-14|<tuple|4.3|13>>
    <associate|auto-15|<tuple|4.4|?>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1.3|3>>
    <associate|auto-5|<tuple|1.3.1|6>>
    <associate|auto-6|<tuple|1.3.2|6>>
    <associate|auto-7|<tuple|2|6>>
    <associate|auto-8|<tuple|2.1|8>>
    <associate|auto-9|<tuple|2.2|8>>
    <associate|cor:evol_spec|<tuple|11|7>>
    <associate|covar|<tuple|47|6>>
    <associate|def:L|<tuple|18|11>>
    <associate|def:L2loc|<tuple|2|2>>
    <associate|def:Utheta|<tuple|4|2>>
    <associate|def:cramer|<tuple|7|6>>
    <associate|def:osc_proc|<tuple|8|3>>
    <associate|def:regularity|<tuple|21|12>>
    <associate|def:sigma_compact|<tuple|1|1>>
    <associate|def:zeromeasure|<tuple|14|9>>
    <associate|eq:covariance_def|<tuple|125|14>>
    <associate|eq:expectation|<tuple|116|13>>
    <associate|eq:expected_zeros|<tuple|126|14>>
    <associate|eq:kac_rice|<tuple|111|13>>
    <associate|eq:kac_rice_formula|<tuple|128|14>>
    <associate|eq:limit_mixed_partial|<tuple|131|14>>
    <associate|eq:mixed_partial|<tuple|129|14>>
    <associate|eq:mixed_partial_continued|<tuple|130|14>>
    <associate|eq:substituted_kac_rice|<tuple|132|14>>
    <associate|eq:time_changed_cov|<tuple|127|14>>
    <associate|labeldef:Hmu|<tuple|16|10>>
    <associate|labelrem:scaffold|<tuple|20|12>>
    <associate|lem:delta|<tuple|22|12>>
    <associate|of|<tuple|17|3>>
    <associate|prop:atomic|<tuple|17|10>>
    <associate|prop:conjugation|<tuple|12|8>>
    <associate|prop:inverse|<tuple|5|2>>
    <associate|sec:HP|<tuple|4|9>>
    <associate|sec:functionspaces|<tuple|1|1>>
    <associate|sec:oscillatory|<tuple|1.3.2|3>>
    <associate|sec:samplepaths|<tuple|3|8>>
    <associate|sec:stationary_timechange|<tuple|2|6>>
    <associate|thm:Utheta_to_osc|<tuple|10|6>>
    <associate|thm:atomic|<tuple|15|9>>
    <associate|thm:existence_osc|<tuple|34|5>>
    <associate|thm:expected_zero_counting|<tuple|24|14>>
    <associate|thm:kac_rice|<tuple|23|13>>
    <associate|thm:local_unitarity|<tuple|6|2>>
    <associate|thm:paths_loc|<tuple|13|8>>
    <associate|thm:realvaluedness|<tuple|9|4>>
    <associate|thm:spectrum|<tuple|19|11>>
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Unitarily
      Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
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

      <with|par-left|<quote|1tab>|5.3<space|2spc>Regularity and Simplicity of
      The Zeros of <with|mode|<quote|math>|Z<around*|(|t|)>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|5.4<space|2spc>Kac-Rice Formula For The
      Expected Zero Count <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>
    </associate>
  </collection>
</auxiliary>