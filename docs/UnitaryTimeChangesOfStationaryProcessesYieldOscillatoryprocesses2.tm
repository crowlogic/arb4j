<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Processes Yield
  Oscillatory Processes<next-line>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|September 16, 2025>>

  <\abstract>
    A unitary time-change operator <math|U<rsub|\<theta\>>> is constructed
    for absolutely continuous, strictly increasing time reparametrizations
    <math|\<theta\>>, acting on functions that are square-integrable over
    compact sets. Applying <math|U<rsub|\<theta\>>> to the CramÃ©r spectral
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
    a concrete operator scaffold consistent with a Hilbertâ€“PÃ³lya-type
    viewpoint.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Gaussian
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Definition
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Sample Path Realizations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.3<space|2spc>Stationary processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.4<space|2spc>Oscillatory Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Unitarily
    Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Unitary time-change operator
    <with|mode|math|U<rsub|\<theta\>> f> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|2tab|2.1.1<space|2spc>Inverse Filter for Unitary Time
    Transformations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|2.2<space|2spc>Transformation of Stationary
    <with|mode|math|\<to\>> Oscillatory Processes via
    <with|mode|math|U<rsub|\<theta\>>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
  </table-of-contents>

  <section|Gaussian Processes>

  <subsection|Definition>

  \;

  <\definition>
    <strong|(Gaussian process)> Let <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>>
    be a probability space and <math|T> a nonempty index set. A family
    <math|<around|{|X<rsub|t>:t\<in\>T|}>> of real-valued random variables on
    <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> is called a Gaussian
    process if for every finite subset <math|F=<around|{|t<rsub|1>,\<ldots\>,t<rsub|n>|}>\<subset\>T>
    the random vector <math|<around|(|X<rsub|t<rsub|1>>,\<ldots\>,X<rsub|t<rsub|n>>|)>>
    is multivariate normal (possibly degenerate). Equivalently, every finite
    linear combination <math|<big|sum><rsub|i=1><rsup|n>a<rsub|i>*X<rsub|t<rsub|i>>>
    is either almost surely constant or Gaussian. The mean function is
    <math|m<around|(|t|)>\<assign\>\<bbb-E\><around|[|X<rsub|t>|]>> and the
    covariance kernel is\ 

    <\equation>
      K<around|(|s,t|)>=<math-up|Cov><around|(|X<rsub|s>,X<rsub|t>|)>
    </equation>

    For any finite <math|<around|(|t<rsub|i>|)><rsub|i=1><rsup|n>\<subset\>T>,
    the matrix <math|K<rsub|i*j>=K<around|(|t<rsub|i>,t<rsub|j>|)>> is
    symmetric positive semidefinite, and a Gaussian process is completely
    determined in law by <math|m> and <math|K>.
  </definition>

  <\definition>
    \ The canonical metric associated with a Gaussian process is

    <\equation>
      <tabular|<tformat|<table|<row|<cell|d<around|(|s,t|)>>|<cell|=<sqrt|\<bbb-E\><around*|[|<around|(|X<rsub|s>-X<rsub|t>|)><rsup|2>|]>>>>|<row|<cell|>|<cell|=<sqrt|K<around|(|s,s|)>+K<around|(|t,t|)>-2*K<around|(|s,t|)>>>>>>>
    </equation>
  </definition>

  <subsection|Sample Path Realizations>

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

  <subsection|Stationary processes>

  <\definition>
    <strong|[Cramér representation]<label|def:cramer>>
    <cite|stationaryAndRelatedStochasticProcesses>A zero-mean stationary
    process <math|X> with spectral measure <math|F> admits the sample path
    representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>\<mathd\>\<Phi\><around|(|\<lambda\>|)>
    </equation>

    which has covariance

    <\equation>
      R<rsub|X>*<around|(|t-s|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <subsection|Oscillatory Processes><label|sec:oscillatory>

  A particularly tractable class of non-stationary Gaussian processes is that
  of the oscillatory processes as defined by Maurice Priestley in
  1965<cite|evolutionarySpectraAndNonStationaryProcesses>.

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
    measure <math|F> which satisfies the relation

    <\equation>
      \<mathd\> \<bbb-E\>*<space|-0.17em><around*|[|\<Phi\><around|(|\<lambda\>|)><wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    and has the corresponding covariance kernel

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
    Assume <math|Z> is real-valued, i.e. <math|Z<around|(|t|)>=<wide|Z<around|(|t|)>|\<bar\>>\<forall\>t\<in\>\<bbb-R\>>.Writing
    its oscillatory representation, <math|Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*\<mathd\>\<Phi\><around|(|\<lambda\>|)>>
    and taking the complex conjugate gives
    <math|<wide|Z<around|(|t|)>|\<bar\>>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>\<mathd\><wide|\<Phi\>*<around|(|\<lambda\>|)>|\<bar\>>>
    For a real-valued process, the orthogonal random measure <math|\<Phi\>>
    must satisfy <math|\<mathd\><wide|\<Phi\>*<around|(|\<lambda\>|)>|\<bar\>>=-\<mathd\>
    \<Phi\>*<around|(|*\<lambda\>|)>> which ensures that the spectral
    representation produces real values. Substituting this identity and using
    the substitution <math|\<mu\>=-\<lambda\>> it is shown that
    <math|<wide|Z<around|(|t|)>|\<bar\>>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>e<rsup|i*\<mu\>*t>*\<mathd\>
    \<Phi\>*<around|(|\<mu\>|)>>. Since <math|Z<around|(|t|)>=<wide|Z<around|(|t|)>|\<bar\>>>,
    comparison of the integrands (which are unique elements of
    <math|L<rsup|2><around|(|F|)>>) yields
    <math|A<rsub|t><around|(|\<lambda\>|)>=<wide|A<rsub|t>*<around|(|-\<lambda\>|)>|\<bar\>><space|1em><text|for
    >F*<text|-a.e.>\<lambda\>>. Equivalently, because the oscillatory
    function (<reference|of>) is given by
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>
    we have <math|\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|1em><text|for
    >F*<text|-a.e. >\<lambda\>>. Conversely, if
    <math|><math|A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>>
    for <math|F>-a.e. <math|\<lambda\>>, then the same substitution shows
    that <math|<wide|Z<around|(|t|)>|\<bar\>>=Z<around|(|t|)>\<forall\>t\<in\>\<bbb-R\>>
    so <math|Z> is real-valued.\ 
  </proof>

  <\theorem>
    <strong|[Existence]><label|thm:existence_osc> Let <math|F> be an
    absolutely continuous spectral measure and the gain function

    <\equation>
      A<rsub|t><around*|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>\<forall\>\<bbb-R\>\<ni\>t\<less\>\<infty\>
    </equation>

    be measurable in both time and frequency then the time-dependent spectral
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
  </theorem>

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

  <subsection|Unitary time-change operator <math|U<rsub|\<theta\>> f>>

  <\definition>
    <strong|[Unitary time-change]<label|def:Utheta>> Let the time-scaling
    function <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely
    continuous, strictly increasing, and bijective, with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> almost everywhere
    and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    Lebesgue measure zero. Define, for <math|f> measurable,

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

    which is well-defined almost everywhere.
  </proposition>

  <\proof>
    Since <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    measure zero, and <math|\<theta\><rsup|-1>> maps sets of measure zero to
    sets of measure zero because of the fact that absolutely continuous
    bijective functions preserve measure-zero sets, the denominator
    <math|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    is positive almost everywhere. The expression is therefore well-defined
    almost everywhere, which suffices for defining an element of
    <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
  </proof>

  <\theorem>
    <strong|[Local unitarity on compact sets]<label|thm:local_unitarity>> For
    every compact set <math|K\<subseteq\>\<bbb-R\>> and
    <math|f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>,

    <\equation>
      <big|int><rsub|K><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|K|)>>
    </equation|f<around|(|s|)>|<rsup|2>*<space|0.17em>d*s >

    Moreover, <math|U<rsub|\<theta\>><rsup|-1>> is the inverse of
    <math|U<rsub|\<theta\>>> on <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Let <math|f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>> and let
    <math|K> be any compact set. The local <math|L<rsup|2>>-norm of
    <math|U<rsub|\<theta\>>*f> over <math|K> is:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<big|int><rsub|K><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t>|<cell|=<big|int><rsub|K><around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|K><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t>>>>>
    </equation>

    Since <math|\<theta\>> is absolutely continuous and strictly increasing,
    applying the change of variables <math|s=\<theta\><around|(|t|)>> gives

    <\equation>
      d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t
    </equation>

    almost everywhere. As <math|t> ranges over the compact set <math|K>,
    <math|s=\<theta\><around|(|t|)>> ranges over
    <math|\<theta\><around|(|K|)>>, which is compact. Therefore:

    <\equation>
      <big|int><rsub|K><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|K|)>>
    </equation|f<around|(|s|)>|<rsup|2>*<space|0.17em>d*s >

    To verify that <math|U<rsub|\<theta\>><rsup|-1>> is indeed the inverse,
    it is seen that:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|(|U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>*f|)><around|(|s|)>>|<cell|=<around*|(|U<rsub|\<theta\>><rsup|-1>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*f<around|(|\<theta\><around|(|s|)>|)>|)><around|(|s|)>>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>*f<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|)>>|<cell|>|<cell|>|<cell|>|<cell|\<forall\>f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>>|<row|<cell|>|<cell|=f<around|(|s|)>>|<cell|>|<cell|>|<cell|>|<cell|>>>>>
    </equation>

    since

    <\equation>
      \<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>=s
    </equation>

    and similarly:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|(|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)>>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>>*g<around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>|<cell|>|<cell|>|<cell|>|<cell|\<forall\>g\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>*g<around|(|t|)>>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|=g<around|(|t|)>>|<cell|>|<cell|>|<cell|>|<cell|>>>>>
    </equation>

    since

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

  <subsubsection|Inverse Filter for Unitary Time Transformations>

  <\theorem>
    [Inverse Filter for Unitary Time Transformations]<label|thm:inverse-filter>Let
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective with
    <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0> almost everywhere. Let
    <math|Y<around|(|u|)>> be a stationary process with unit variance, and
    define

    <\equation>
      Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>Y<around|(|\<theta\><around|(|t|)>|)><label|Z>
    </equation>

    as the oscillatory process obtained by the unitary time transformation.
    Then:

    <\enumerate>
      <item><label|item:forward>The forward filter kernel is

      <\equation>
        h<around|(|t,u|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)><label|h>
      </equation>

      <item><label|item:inverse> The inverse filter kernel is

      <\equation>
        g<around|(|t,s|)>=<frac|\<delta\>*<around|(|s-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>
      </equation>

      <item><label|item:composition> The composition
      <math|<around|(|g\<circ\>h|)>> recovers the identity:

      <\equation>
        <tabular|<tformat|<table|<row|<cell|Y<around|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>g<around|(|t,s|)>*Z<around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<frac|Z<around|(|\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>>>>>>
      </equation>
    </enumerate>
  </theorem>

  <\proof>
    Parts <reference|item:forward>-<reference|item:composition> are
    established in sequence. Let

    <\equation>
      v=\<theta\><around|(|s|)> <text| and
      >s=\<theta\><rsup|-1><around|(|v|)>
    </equation>

    so that

    <\equation>
      d*s=<frac|1|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>
      d*v
    </equation>

    and

    <\equation>
      \<delta\>*<around|(|\<theta\><rsup|-1><around|(|v|)>-\<theta\><rsup|-1><around|(|t|)>|)>=<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>*<space|0.17em>\<delta\>*<around|(|v-t|)>
    </equation>

    then substitute the inverse filter in Equation (<reference|h>)

    <\equation>
      g<around|(|t,s|)>=<frac|\<delta\>*<around|(|s-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>
    </equation>

    and unitarily time-changed stationary process operator representation
    (<reference|Z>)

    <\equation>
      <tabular|<tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<around*|(|U<rsub|\<theta\>>
      Y|)><around*|(|t|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>Y<around|(|\<theta\><around|(|t|)>|)>>>>>>
    </equation>

    to verify that each of the equivalent expressions

    <\equation>
      <tabular|<tformat|<table|<row|<cell|Y<around*|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>g<around|(|t,s|)>*Z<around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><frac|\<delta\>*<around|(|s-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>*<space|0.17em>Z<around*|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><frac|\<delta\>*<around|(|s-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>*<space|0.17em><around*|(|U<rsub|\<theta\>>
      Y|)><around*|(|s|)><space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><frac|\<delta\>*<around|(|s-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>*<space|0.17em><sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>Y<around|(|\<theta\><around|(|s|)>|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><frac|\<delta\>*<around|(|\<theta\><rsup|-1><around|(|v|)>-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>*<space|0.17em><space|0.17em><frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>*|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>Y<around|(|v|)>d*v>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><frac|\<delta\>*<around|(|\<theta\><rsup|-1><around|(|v|)>-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>>*<space|0.17em>Y<around|(|v|)>*<space|0.17em>d*v>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><frac|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>*<space|0.17em>\<delta\>*<around|(|v-t|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>>*<space|0.17em>Y<around|(|v|)>*<space|0.17em>d*v>>|<row|<cell|>|<cell|=<frac|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>*|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>*<space|0.17em>Y<around|(|t|)>*>>|<row|<cell|>|<cell|=<frac|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>*|<around*|(|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>|)><rsup|2>>*Y<around*|(|t|)>>>|<row|<cell|>|<cell|=<frac|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>*|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>*Y<around*|(|t|)>>>|<row|<cell|>|<cell|=Y<around*|(|t|)>>>>>>
    </equation>
  </proof>

  <subsection|Transformation of Stationary <math|\<to\>> Oscillatory
  Processes via <math|U<rsub|\<theta\>>>>

  <\theorem>
    <strong|[Unitary time change yields oscillatory
    process]<label|thm:Utheta_to_osc>> Let <math|X> be zero-mean stationary
    as in Definition <reference|def:cramer>. For scaling function
    <math|\<theta\>> as in Definition <reference|def:Utheta>, define

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
      <tabular|<tformat|<cwith|1|5|1|1|cell-halign|l>|<cwith|1|5|1|1|cell-lborder|0ln>|<cwith|1|5|2|2|cell-halign|l>|<cwith|1|5|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around*|[|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)><wide|<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*\<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>><label|covar>
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
    Definition <reference|def:osc_proc>, <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>>
    has the form <math|A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>:

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
    by substituting the spectral representation and applying Fubini's theorem
    to interchange the order of operations.
  </proof>

  <\corollary>
    <strong|[Evolutionary spectrum of unitarily time-changed stationary
    process]<label|cor:evol_spec>><cite|evolutionarySpectraAndNonStationaryProcesses>
    The evolutionary spectrum, also called the time-varying spectral density,
    is

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|d*F<rsub|t><around|(|\<lambda\>|)>>|<cell|=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>
  </corollary>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|2>
      <bibitem*|1><label|bib-stationaryAndRelatedStochasticProcesses>Harald
      Cramér<localize| and >M.R.<nbsp>Leadbetter.
      <newblock><with|font-shape|italic|Stationary and Related Processes:
      Sample Function Properties and Their Applications>. <newblock>Wiley
      Series in Probability and Mathematical Statistics. 1967.<newblock>

      <bibitem*|2><label|bib-evolutionarySpectraAndNonStationaryProcesses>Maurice<nbsp>B
      Priestley. <newblock>Evolutionary spectra and non-stationary processes.
      <newblock><with|font-shape|italic|Journal of the Royal Statistical
      Society: Series B (Methodological)>, 27(2):204\U229, 1965.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|U|<tuple|23|4>>
    <associate|Z|<tuple|34|6>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|53|8>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1.3|2>>
    <associate|auto-5|<tuple|1.4|2>>
    <associate|auto-6|<tuple|2|4>>
    <associate|auto-7|<tuple|2.1|4>>
    <associate|auto-8|<tuple|2.1.1|6>>
    <associate|auto-9|<tuple|2.2|7>>
    <associate|bib-evolutionarySpectraAndNonStationaryProcesses|<tuple|2|8>>
    <associate|bib-stationaryAndRelatedStochasticProcesses|<tuple|1|8>>
    <associate|cor:evol_spec|<tuple|14|8>>
    <associate|covar|<tuple|47|7>>
    <associate|def:L2loc|<tuple|3|2>>
    <associate|def:Utheta|<tuple|9|4>>
    <associate|def:cramer|<tuple|5|2>>
    <associate|def:osc_proc|<tuple|6|2>>
    <associate|h|<tuple|35|6>>
    <associate|item:composition|<tuple|3|6>>
    <associate|item:forward|<tuple|1|6>>
    <associate|item:inverse|<tuple|2|6>>
    <associate|of|<tuple|7|2>>
    <associate|prop:inverse|<tuple|10|4>>
    <associate|sec:oscillatory|<tuple|1.4|2>>
    <associate|sec:stationary_timechange|<tuple|2|4>>
    <associate|thm:Utheta_to_osc|<tuple|13|7>>
    <associate|thm:existence_osc|<tuple|8|3>>
    <associate|thm:inverse-filter|<tuple|12|6>>
    <associate|thm:local_unitarity|<tuple|11|5>>
    <associate|thm:realvaluedness|<tuple|7|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stationaryAndRelatedStochasticProcesses

      evolutionarySpectraAndNonStationaryProcesses

      evolutionarySpectraAndNonStationaryProcesses
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gaussian
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Sample Path Realizations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Stationary processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Oscillatory Processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Unitarily
      Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Unitary time-change operator
      <with|mode|<quote|math>|U<rsub|\<theta\>> f>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|2.1.1<space|2spc>Inverse Filter for Unitary
      Time Transformations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Transformation of Stationary
      <with|mode|<quote|math>|\<to\>> Oscillatory Processes via
      <with|mode|<quote|math>|U<rsub|\<theta\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>