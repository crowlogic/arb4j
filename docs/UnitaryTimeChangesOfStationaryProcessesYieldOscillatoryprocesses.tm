<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitarily Time-Changed Stationary
  Processes:<next-line>A Subclass of Oscillatory
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|December 13, 2025>>

  <\abstract>
    A unitary time-change operator <math|U<rsub|\<theta\>>> is constructed
    for absolutely continuous, strictly increasing time reparametrizations
    <math|\<theta\>>, acting on functions that are locally square-integrable.
    Applying <math|U<rsub|\<theta\>>> to the Cramér spectral representation
    of a stationary process <math|X<around|(|t|)>> produces the transformed
    process

    <\equation*>
      Z<around|(|t|)>=<around*|(|U<rsub|\<theta\>>*X|)><around*|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation*>

    which is an oscillatory process with oscillatory function
    <math|\<phi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>,
    evolutionary power spectral density <math|S<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*S<around|(|\<lambda\>|)>>,
    and covariance kernel <math|>

    <\equation*>
      K<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>K<rsub|X><around|(|\<theta\><around|(|t|)>,\<theta\><around|(|s|)>|)>
    </equation*>

    \ where <math|K<rsub|X>> is the stationary covariance of
    <math|X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>>.
    Unitarily time-changed stationary processes form a subclass of
    oscillatory processes. The generalized Kac\URice formula for
    non-stationary processes gives the expected zero-counting function. By
    Bulinskaya's theorem, when the covariance is twice continuously
    differentiable with <math|<wide|R|\<ddot\>><around|(|0|)>\<less\>0>,
    almost all zeros are simple. A zero-localization measure
    <math|d*\<mu\><around|(|t|)>=\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t>
    induces a Hilbert space <math|L<rsup|2><around|(|\<mu\>|)>> on the zero
    set of each oscillatory process realization <math|Z<around|(|t|)>>.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Gaussian
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Definition
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Stationary Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.3<space|2spc>Sample Path Realizations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Definition
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Unitarily
    Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Unitary Time-Change Operator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.2<space|2spc>Stationary to Oscillatory
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Zero
    Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Kac\URice
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|4.2<space|2spc>Bulinskaya
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Example:
    The Hardy Z-Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>Definitions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|5.2<space|2spc>Stationary Candidate and Exact
    Inversion <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <with|par-left|1tab|5.3<space|2spc><with|mode|math|L<rsup|2><rsub|<with|mode|text|<with|font-family|rm|font-shape|right|loc>>>>
    Identity on Finite Intervals <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <with|par-left|1tab|5.4<space|2spc>Limit-form Mean-Square Statements
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>>

    <with|par-left|1tab|5.5<space|2spc>Time-Average Covariance Conjectures
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19><vspace|0.5fn>
  </table-of-contents>

  <section|Gaussian Processes>

  <subsection|Definition>

  <\definition>
    [Gaussian process] Let <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>>
    be a probability space and <math|T> a nonempty index set. A family
    <math|<around|{|X<rsub|t>:t\<in\>T|}>> of real-valued random variables on
    <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> is called a
    <with|font-series|bold|Gaussian process> if for every finite subset
    <math|<around|{|t<rsub|1>,\<ldots\>,t<rsub|n>|}>\<subset\>T> the random
    vector <math|<around|(|X<rsub|t<rsub|1>>,\<ldots\>,X<rsub|t<rsub|n>>|)>>
    is multivariate normal (possibly degenerate). Equivalently, every finite
    linear combination <math|<big|sum><rsub|i=1><rsup|n>a<rsub|i>*X<rsub|t<rsub|i>>>
    is either almost surely constant or Gaussian. The
    <with|font-series|bold|mean function> is
    <math|m<around|(|t|)>\<assign\>\<bbb-E\><around|[|X<rsub|t>|]>> and the
    <with|font-series|bold|covariance kernel> is

    <\equation>
      K<around|(|s,t|)>=<math-up|Cov><around|(|X<rsub|s>,X<rsub|t>|)>
    </equation>

    For any finite <math|<around|(|t<rsub|i>|)><rsub|i=1><rsup|n>\<subset\>T>,
    the matrix <math|K<rsub|i*j>=K<around|(|t<rsub|i>,t<rsub|j>|)>> is
    symmetric positive semidefinite, and a Gaussian process is completely
    determined in law by <math|m> and <math|K>.
  </definition>

  <subsection|Stationary Processes>

  <\definition>
    [Cramér spectral representation] A zero-mean stationary process <math|X>
    with spectral measure <math|F> admits the sample path representation

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    which has covariance

    <\equation>
      R<rsub|X>*<around|(|t-s|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <subsection|Sample Path Realizations>

  <\definition>
    [Locally square-integrable functions] Define

    <\equation>
      L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>\<assign\><around*|{|f:\<bbb-R\>\<to\>\<bbb-C\>:<big|int><rsub|K><around|\||f<around|(|t|)>|\|><rsup|2>*d*t\<less\>\<infty\>*<text|for
      every compact >K\<subseteq\>\<bbb-R\>|}>
    </equation>
  </definition>

  <\remark>
    Every bounded measurable set in <math|\<bbb-R\>> is compact or contained
    in a compact set; hence <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>
    contains functions that are square-integrable on every bounded interval,
    including functions with polynomial growth at infinity.
  </remark>

  <\theorem>
    [Sample paths in <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>]
    Let <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> be a
    second-order stationary process with

    <\equation>
      \<sigma\><rsup|2>\<assign\>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>\<less\>\<infty\>
    </equation>

    Then almost every sample path lies in
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Fix a bounded interval <math|<around|[|a,b|]>\<subset\>\<bbb-R\>> with
    <math|a\<less\>b> and define

    <\equation>
      Y<rsub|<around|[|a,b|]>>\<assign\><big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*d*t
    </equation>

    By Tonelli's theorem,

    <\equation>
      \<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>*d*t
    </equation>

    By stationarity, <math|\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>=\<sigma\><rsup|2>>,
    hence

    <\equation>
      \<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=\<sigma\><rsup|2>*<around|(|b-a|)>\<less\>\<infty\>
    </equation>

    Markov's inequality yields

    <\equation>
      \<bbb-P\>*<around|(|Y<rsub|<around|[|a,b|]>>\<gtr\>M|)>\<leq\><frac|\<sigma\><rsup|2>*<around|(|b-a|)>|M>
    </equation>

    so <math|\<bbb-P\>*<around|(|Y<rsub|<around|[|a,b|]>>\<less\>\<infty\>|)>=1>.
    If <math|K\<subset\>\<bbb-R\>> is compact then
    <math|K\<subseteq\><around|[|-N,N|]>> for some <math|N\<gtr\>0>, so

    <\equation>
      <big|int><rsub|K>X<around|(|t|)><rsup|2>*d*t\<leq\><big|int><rsub|-N><rsup|N>X<around|(|t|)><rsup|2>*d*t\<less\>\<infty\><text|a.s.>
    </equation>

    Thus <math|X<around|(|\<cdummy\>,\<omega\>|)>\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>
    for almost every <math|\<omega\>>. <math|\<Box\>>
  </proof>

  <section|Oscillatory Processes>

  <subsection|Definition>

  <\definition>
    [Oscillatory process] Let <math|F> be a finite nonnegative Borel measure
    on <math|\<bbb-R\>>. Let

    <\equation>
      A<rsub|t>\<in\>L<rsup|2><around|(|F|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    be the <with|font-series|bold|gain function> and

    <\equation>
      \<phi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    the corresponding <with|font-series|bold|oscillatory function>. An
    <with|font-series|bold|oscillatory process> is a stochastic process
    represented as

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>\<phi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>>>>>>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure with spectral
    measure <math|F> satisfying

    <\equation>
      \<bbb-E\><around|[|\<Phi\><around|(|\<lambda\>|)><wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*d*F<around|(|\<lambda\>|)>
    </equation>

    and covariance

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<phi\><rsub|t><around|(|\<lambda\>|)><wide|\<phi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>
  </definition>

  <\definition>
    [Evolutionary power spectral density (EPSD)] If
    <math|d*F<around|(|\<lambda\>|)>=S<around|(|\<lambda\>|)>*d*\<lambda\>>,
    define

    <\equation>
      S<rsub|t><around|(|\<lambda\>|)>\<assign\><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*S<around|(|\<lambda\>|)>
    </equation>

    so that

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|d*F<rsub|t><around|(|\<lambda\>|)>>|<cell|=S<rsub|t><around|(|\<lambda\>|)>*d*\<lambda\>>>|<row|<cell|>|<cell|=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*S<around|(|\<lambda\>|)>*\<mathd\>*\<lambda\>>>>>>
    </equation>
  </definition>

  <\theorem>
    [Real-valuedness criterion for oscillatory processes] Let <math|Z> be an
    oscillatory process with <math|\<phi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>
    and spectral measure <math|F>. Then <math|Z> is real-valued if and only
    if

    <\equation>
      A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>><text|for
      >F*<text|-a.e. >\<lambda\>\<in\>\<bbb-R\>
    </equation>

    equivalently

    <\equation>
      \<phi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<phi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><text|for
      >F*<text|-a.e. >\<lambda\>\<in\>\<bbb-R\>
    </equation>
  </theorem>

  <\proof>
    Taking complex conjugates of <math|Z<around|(|t|)>=<big|int>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>>
    and applying the symmetry <math|d<wide|\<Phi\><around|(|\<lambda\>|)>|\<bar\>>=d*\<Phi\>*<around|(|-\<lambda\>|)>>
    for real processes, with change of variables <math|\<mu\>=-\<lambda\>>,
    yields <math|A<rsub|t><around|(|\<lambda\>|)>=<wide|A<rsub|t>*<around|(|-\<lambda\>|)>|\<bar\>>>
    <math|F>-a.e. Reversing the steps gives the converse. <math|\<Box\>>
  </proof>

  <\theorem>
    [Existence of oscillatory processes with explicit <math|L<rsup|2>>-limit
    construction] Let <math|F> be absolutely continuous with density
    <math|S<around|(|\<lambda\>|)>> and let
    <math|A<rsub|t><around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>> for
    all <math|t\<in\>\<bbb-R\>>, measurable jointly in
    <math|<around|(|t,\<lambda\>|)>>. Define

    <\equation>
      \<sigma\><rsub|t><rsup|2>\<assign\><big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<infty\>
    </equation>

    Then there exists a complex orthogonal random measure <math|\<Phi\>> with
    spectral measure <math|F> such that for each fixed <math|t> the
    stochastic integral

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    is well-defined as an <math|L<rsup|2><around|(|\<Omega\>|)>>-limit and
    has covariance (15).
  </theorem>

  <\proof>
    Let <math|S> be the set of simple functions
    <math|g<around|(|\<lambda\>|)>=<big|sum><rsub|j=1><rsup|n>c<rsub|j><text|<with|font-series|bold|1>><rsub|E<rsub|j>><around|(|\<lambda\>|)>>
    with disjoint Borel <math|E<rsub|j>> and
    <math|F<around|(|E<rsub|j>|)>\<less\>\<infty\>>. Define
    <math|<big|int>g*d*\<Phi\>\<assign\><big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>>.
    Orthogonality gives the isometry:

    <\equation>
      \<bbb-E\><around*|\||<big|int>g*d*\<Phi\>|\|><rsup|2>=<big|int><rsub|\<bbb-R\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>
    </equation>

    For <math|h\<in\>L<rsup|2><around|(|F|)>>, choose <math|g<rsub|n>\<in\>S>
    with <math|<around|\<\|\|\>|h-g<rsub|n>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>>\<to\>0>.
    Then:

    <\equation>
      \<bbb-E\>*<around*|\||<big|int>g<rsub|n>*d*\<Phi\>-<big|int>g<rsub|m>*d*\<Phi\>|\|><rsup|2>=<around|\<\|\|\>|g<rsub|n>-g<rsub|m>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>><rsup|2>,<space|1em>lim<rsub|n,m\<to\>\<infty\>><around|\<\|\|\>|g<rsub|n>-g<rsub|m>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>><rsup|2>=0
    </equation>

    Completeness of <math|L<rsup|2><around|(|\<Omega\>|)>> yields the limit,
    and the isometry shows independence of the approximating sequence.
    <math|\<Box\>>
  </proof>

  <section|Unitarily Time-Changed Stationary Processes>

  <subsection|Unitary Time-Change Operator>

  <\theorem>
    [Unitary time-change and local isometry] Let
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> a.e. For measurable
    <math|f>, define:

    <\equation>
      <around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Define the inverse map:

    <\equation>
      <around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>

    For every compact <math|K\<subseteq\>\<bbb-R\>> and
    <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>:

    <\equation>
      <big|int><rsub|K><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2>d*t=<big|int><rsub|\<theta\><around|(|K|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*d*s
    </equation>

    Moreover, for <math|f,g\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>:

    <\equation>
      U<rsub|\<theta\>><rsup|-1>*<around|(|U<rsub|\<theta\>>*f|)>=f,<space|1em>U<rsub|\<theta\>>*<around|(|U<rsub|\<theta\>><rsup|-1>*g|)>=g
    </equation>
  </theorem>

  <\proof>
    Using change of variables <math|s=\<theta\><around|(|t|)>>,
    <math|d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t>:

    <\equation>
      <big|int><rsub|K><wide|\<theta\>|\<dot\>><around|(|t|)>*<around|\||f<around|(|\<theta\><around|(|t|)>|)>*<around|\||<rsup|2>d*t=<big|int><rsub|\<theta\><around|(|K|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*d*s
    </equation>

    Direct substitution verifies the inverse identities. <math|\<Box\>>
  </proof>

  <\theorem>
    [Fundamental inversion via stationary representation] Let
    <math|Z<around|(|t|)>> be an oscillatory process with spectral
    representation

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>> for each <math|t> and
    <math|\<Phi\>> is an orthogonal random measure. Then there exists a
    stationary process <math|X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>>
    such that <math|Z<around|(|t|)>=A<around|(|t|)>*X<around|(|t|)>> for a
    closed operator <math|A<around|(|t|)>> commuting with the shift group.
    The random spectral measure <math|\<Phi\>> is uniquely determined by
    <math|X> via <math|\<Phi\><around|(|B|)>=<around|(|E<around|(|B|)>*X|)><around|(|0|)>>
    for all Borel <math|B>, where <math|E> is the spectral measure of the
    shift group.
  </theorem>

  <\definition>
    [Unitarily time-changed stationary process] Let
    <math|X=<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> be a
    second-order stationary process with sample paths in
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>. Let
    <math|\<theta\>> satisfy Theorem 17. Define:

    <\equation>
      Z<around|(|t|)>\<assign\><around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then <math|Z> is called a <with|font-series|bold|unitarily time-changed
    stationary process>.
  </definition>

  <\lemma>
    [Exact recovery of <math|X>] If <math|Z> is defined as above, then:

    <\equation>
      X=U<rsub|\<theta\>><rsup|-1>*Z.
    </equation>
  </lemma>

  <\proof>
    This is precisely <math|U<rsub|\<theta\>><rsup|-1>*<around|(|U<rsub|\<theta\>>*X|)>=X>
    from Theorem 17. <math|\<Box\>>
  </proof>

  \;

  <subsection|Stationary to Oscillatory>

  <\theorem>
    [Unitary time change produces oscillatory process] Let <math|X> be
    zero-mean stationary with <math|X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>>.
    Let <math|\<theta\>> satisfy Theorem 17. Define:

    <\equation>
      Z<around|(|t|)>\<assign\><around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then <math|Z> is an oscillatory process with oscillatory function:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<phi\><rsub|t><around|(|\<lambda\>|)>>|<cell|=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<lambda\>*t>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t+t|)>>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>>>>>
    </equation>

    where the gain function is:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|A<rsub|t><around|(|\<lambda\>|)>>|<cell|=\<varphi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*e<rsup|-i*\<lambda\>*t>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>>>>>>
    </equation>
  </theorem>

  <\proof>
    Substituting <math|t\<mapsto\>\<theta\><around|(|t|)>> in the spectral
    representation:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*\<Phi\><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around*|(|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|)>*d*\<Phi\><around|(|\<lambda\>|)>>>>>>
    </equation>

    Thus <math|\<phi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>
    and <math|A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>>
    since <math|\<phi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>.
    <math|\<Box\>>
  </proof>

  <\corollary>
    <dueto|EPSD for the unitary time change>If
    <math|d*F<around|(|\<lambda\>|)>=S<around|(|\<lambda\>|)>*d*\<lambda\>>,
    then:

    <\equation>
      S<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*S<around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*S<around|(|\<lambda\>|)>.
    </equation>
  </corollary>

  <\proof>
    <\equation>
      <around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>=<wide|\<theta\>|\<dot\>><around|(|t|)><around|\||e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>=<wide|\<theta\>|\<dot\>><around|(|t|)>
    </equation>
  </proof>

  <section|Zero Localization>

  <subsection|Kac\URice>

  <\theorem>
    [Generalized Kac\URice formula for non-stationary Gaussian processes] Let
    <math|Z<around|(|t|)>> be a real-valued, zero-mean Gaussian process with
    covariance <math|K<around|(|t,s|)>=\<bbb-E\>*<around|[|Z<around|(|t|)>*Z<around|(|s|)>|]>>.
    Assume <math|K<around|(|t,t|)>\<gtr\>0> and that <math|K<around|(|t,s|)>>
    is twice continuously differentiable in a neighborhood of
    <math|<around|(|t,t|)>>. Define:

    <\equation>
      K<around|(|t|)>\<assign\>K<around|(|t,t|)>,<space|1em>K<rsub|s><around|(|t|)>\<assign\><frac|\<partial\>*K<around|(|t,s|)>|\<partial\>*s>\|<rsub|s=t>,<space|1em>K<rsub|s*s><around|(|t|)>\<assign\><frac|\<partial\><rsup|2>*K<around|(|t,s|)>|\<partial\>*s<rsup|2>>\|<rsub|s=t>.
    </equation>

    Assume

    <\equation>
      V<around|(|t|)>\<assign\>K<around|(|t|)>*K<rsub|s*s><around|(|t|)>-<around|[|K<rsub|s><around|(|t|)>|]><rsup|2>\<gtr\>0
    </equation>

    for <math|t\<in\><around|[|a,b|]>>. Then:

    <\equation>
      \<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><frac|1|\<pi\>>*<sqrt|<frac|V<around|(|t|)>|K<around|(|t|)><rsup|2>>>*d*t
    </equation>
  </theorem>

  <\proof>
    The joint density of <math|<around|(|Z<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>|)>>
    is Gaussian with covariance matrix <math|\<Sigma\><around|(|t|)>=<around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|K<around|(|t|)>>|<cell|K<rsub|s><around|(|t|)>>>|<row|<cell|K<rsub|s><around|(|t|)>>|<cell|K<rsub|s*s><around|(|t|)>>>>>>|)>>.
    The Kac\URice formula gives:

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>>|<cell|=<big|int><rsub|a><rsup|b>\<bbb-E\>*<around|[|<around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>\<mid\>Z<around|(|t|)>=0|]>*p<rsub|Z<around|(|t|)>><around|(|0|)>*d*t>>|<row|<cell|>|<cell|=<big|int><rsub|a><rsup|b><frac|1|<sqrt|2*\<pi\>*K<around|(|t|)>>>*<sqrt|<frac|2|\<pi\>>*<frac|K<around|(|t|)>*K<rsub|s*s><around|(|t|)>-K<rsub|s><around|(|t|)><rsup|2>|K<around|(|t|)><rsup|2>>>*d*t>>>>>
    </equation>

    Simplifying yields <math|<frac|1|\<pi\>>*<sqrt|V<around|(|t|)>/K<around|(|t|)><rsup|2>>>.
    <math|\<Box\>>
  </proof>

  <\remark>
    <dueto|Critical note for unitarily time-changed processes>For
    <math|Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>>
    where <math|X> is stationary, we have
    <math|K<rsub|s><around|(|t|)>\<neq\>0> in general. Computing:

    <\equation>
      K<around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
    </equation>

    <\equation>
      K<rsub|s><around|(|t|)>=<frac|1|2>*<wide|\<theta\>|\<ddot\>><around|(|t|)>*R<rsub|X><around|(|0|)>
    </equation>

    This is non-zero unless <math|\<theta\>> is linear. Therefore **formula
    (48) must be used** for unitarily time-changed processes; the stationary
    simplification (49) does not apply.
  </remark>

  <subsection|Bulinskaya>

  <\theorem>
    [Bulinskaya] Let <math|X<around|(|t|)>> be a real-valued, zero-mean
    stationary Gaussian process with covariance
    <math|R<around|(|h|)>=\<bbb-E\>*<around|[|X<around|(|t|)>*X*<around|(|t+h|)>|]>>.
    If <math|R> is twice continuously differentiable in a neighborhood of 0
    and <math|R<rprime|''><around|(|0|)>\<less\>0>, then with probability 1
    all zeros of <math|X> are simple.
  </theorem>

  <\proof>
    For fixed <math|t<rsub|0>>, <math|<around|(|X<around|(|t<rsub|0>|)>,<wide|X|\<dot\>><around|(|t<rsub|0>|)>|)>>
    is jointly Gaussian. Stationarity gives
    <math|\<bbb-E\>*<around|[|X<around|(|t<rsub|0>|)>*<wide|X|\<dot\>><around|(|t<rsub|0>|)>|]>=R<rprime|'><around|(|0|)>=0>,
    so they are independent. Since <math|R<rprime|''><around|(|0|)>\<less\>0>,
    <math|<wide|X|\<dot\>><around|(|t<rsub|0>|)>> is non-degenerate and
    <math|\<bbb-P\>*<around|(|<wide|X|\<dot\>><around|(|t<rsub|0>|)>=0|)>=0>.
    Thus <math|\<bbb-P\>*<around|(|X<around|(|t<rsub|0>|)>=0*<text|and
    ><wide|X|\<dot\>><around|(|t<rsub|0>|)>=0|)>=0>. By continuity and
    countable union over rationals, all zeros are simple almost surely.
    <math|\<Box\>>
  </proof>

  <section|Example: The Hardy Z-Function>

  <subsection|Definitions>

  <\definition>
    [Hardy Z-function] Let <math|\<zeta\><around|(|s|)>> be the Riemann zeta
    function and let <math|\<theta\><around|(|t|)>> denote the
    Riemann\USiegel theta function. Define:

    <\equation>
      Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around|(|1/2+i*t|)>
    </equation>
  </definition>

  <\definition>
    [Monotonized theta time change] Let <math|a\<gtr\>0> be the unique
    critical point of <math|\<theta\>> in <math|<around|(|0,\<infty\>|)>>
    where <math|<wide|\<theta\>|\<dot\>><around|(|a|)>=0>. Define
    <math|\<Theta\>:<around|[|0,\<infty\>|)>\<to\><around|[|\<Theta\><around|(|0|)>,\<infty\>|)>>
    by:

    <\equation>
      \<Theta\><around|(|t|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|2*\<theta\><around|(|a|)>-\<theta\><around|(|t|)>>|<cell|0\<leq\>t\<leq\>a>>|<row|<cell|\<theta\><around|(|t|)>>|<cell|t\<geq\>a>>>>>|\<nobracket\>>
    </equation>
  </definition>

  <subsection|Stationary Candidate and Exact Inversion>

  <\definition>
    [Stationary candidate defined by <math|U<rsub|\<Theta\>><rsup|-1>>]
    Define:

    <\equation>
      X<around|(|u|)>=<around|(|U<rsub|\<Theta\>><rsup|-1>*Z|)><around|(|u|)>=<frac|Z<around|(|\<Theta\><rsup|-1><around|(|u|)>|)>|<sqrt|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>>\<forall\>u\<in\><around|[|\<Theta\><around|(|0|)>,\<infty\>|)>
    </equation>
  </definition>

  <\lemma>
    [Exact reconstruction <math|Z=U<rsub|\<Theta\>>*X>] With <math|X> as
    defined above:

    <\equation>
      Z<around|(|t|)>=<around|(|U<rsub|\<Theta\>>*X|)><around|(|t|)>=<sqrt|\<Theta\><rprime|'><around|(|t|)>>*X<around|(|\<Theta\><around|(|t|)>|)>\<forall\>t\<in\><around|[|0,\<infty\>|)>
    </equation>
  </lemma>

  <\proof>
    This is <math|U<rsub|\<Theta\>>*<around|(|U<rsub|\<Theta\>><rsup|-1>*Z|)>=Z>
    from Theorem 17. <math|\<Box\>>
  </proof>

  \;

  <subsection|<math|L<rsup|2><rsub|<math-up|loc>>> Identity on Finite
  Intervals>

  <\lemma>
    [Finite-interval <math|L<rsup|2>> identity] For every <math|T\<gtr\>0>:

    <\equation>
      <big|int><rsub|\<Theta\><around|(|0|)>><rsup|\<Theta\><around|(|T|)>><around|\||X<around|(|u|)>*<around|\||<rsup|2>d*u=<big|int><rsub|0><rsup|T>|\|>*Z<around|(|t|)>|\|><rsup|2>*d*t.
    </equation>
  </lemma>

  <\proof>
    With <math|u=\<Theta\><around|(|t|)>>,
    <math|d*u=<wide|\<Theta\>|\<dot\>><around|(|t|)>*d*t>, and
    <math|X<around|(|u|)>=<frac|Z<around|(|t|)>|<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>>>:

    <\equation*>
      <big|int><rsub|\<Theta\><around|(|0|)>><rsup|\<Theta\><around|(|T|)>><around|\||X<around|(|u|)>|\|><rsup|2>*d*u=<big|int><rsub|0><rsup|T><around*|\||<frac|Z<around|(|t|)>|<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>>|\|><rsup|2><wide|\<Theta\>|\<dot\>><around|(|t|)>*d*t=<big|int><rsub|0><rsup|T><around|\||Z<around|(|t|)>|\|><rsup|2>*d*t*<space|1em>\<Box\>
    </equation*>
  </proof>

  <\theorem>
    [<math|X\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|<around|[|\<Theta\><around|(|0|)>,\<infty\>|)>|)>>]

    <\equation>
      X\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|<around|[|\<Theta\><around|(|0|)>,\<infty\>|)>|)>
    </equation>
  </theorem>

  <\proof>
    For compact <math|<around|[|c,d|]>\<subset\><around|[|\<Theta\><around|(|0|)>,\<infty\>|)>>,
    the preimage <math|<around|[|\<Theta\><rsup|-1><around|(|c|)>,\<Theta\><rsup|-1><around|(|d|)>|]>>
    is compact in <math|<around|[|0,\<infty\>|)>>. The Hardy Z-function is
    continuous on compact sets, so <math|<big|int><rsub|\<Theta\><rsup|-1><around|(|c|)>><rsup|\<Theta\><rsup|-1><around|(|d|)>><around|\||Z<around|(|t|)>|\|><rsup|2>*d*t\<less\>\<infty\>>.
    By Lemma 30, <math|<big|int><rsub|c><rsup|d><around|\||X<around|(|u|)>|\|><rsup|2>*d*u>
    equals this finite integral. <math|\<Box\>>
  </proof>

  <subsection|Limit-form Mean-Square Statements>

  <\theorem>
    [Hardy\ULittlewood second moment (limit form)]

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|<big|int><rsub|0><rsup|T><around|\||\<zeta\>*<around|(|1/2+i*t|)>|\|><rsup|2>*d*t|T*log
      T>=1
    </equation>

    Equivalently:

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|<big|int><rsub|0><rsup|T><around|\||Z<around|(|t|)>|\|><rsup|2>*d*t|T*log
      T>=1
    </equation>
  </theorem>

  <\theorem>
    [Ratio limit for <math|\<Theta\>>]

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|\<Theta\><around|(|T|)>|<around|(|T/2|)>*log
      T>=1
    </equation>
  </theorem>

  <\theorem>
    [Mean-square limit for <math|X>]

    <\equation>
      lim<rsub|T\<to\>\<infty\>> <frac|1|\<Theta\><around|(|T|)>-\<Theta\><around|(|0|)>>*<big|int><rsub|\<Theta\><around|(|0|)>><rsup|\<Theta\><around|(|T|)>><around|\||X<around|(|u|)>|\|><rsup|2>*d*u=2
    </equation>
  </theorem>

  <\proof>
    By Lemma 30:

    <\equation>
      <frac|<big|int><rsub|\<Theta\><around|(|0|)>><rsup|\<Theta\><around|(|T|)>><around|\||X<around|(|u|)>|\|><rsup|2>*d*u|\<Theta\><around|(|T|)>-\<Theta\><around|(|0|)>>=<frac|<big|int><rsub|0><rsup|T><around|\||Z<around|(|t|)>|\|><rsup|2>*d*t|\<Theta\><around|(|T|)>-\<Theta\><around|(|0|)>>
    </equation>

    Writing:

    <\equation>
      <frac|<big|int><rsub|0><rsup|T><around|\||Z<around|(|t|)>|\|><rsup|2>*d*t|\<Theta\><around|(|T|)>-\<Theta\><around|(|0|)>>=<around*|(|<frac|<big|int><rsub|0><rsup|T><around|\||Z<around|(|t|)>|\|><rsup|2>*d*t|T*log
      T>|)><around*|(|<frac|T*log T|\<Theta\><around|(|T|)>-\<Theta\><around|(|0|)>>|)>
    </equation>

    the first factor <math|\<to\>1> by (57) and the second factor
    <math|\<to\>2> by (58). <math|\<Box\>>
  </proof>

  <subsection|Time-Average Covariance Conjectures>

  <\definition>
    [Empirical covariance kernel] For <math|U\<gtr\>\<Theta\><around|(|0|)>>
    and <math|\<tau\>\<in\>\<bbb-R\>> define:

    <\equation>
      K<rsub|U><around|(|\<tau\>|)>\<assign\><frac|1|U-\<Theta\><around|(|0|)>>*<big|int><rsub|\<Theta\><around|(|0|)>><rsup|U>X<around|(|u|)>*X*<around|(|u+\<tau\>|)>*d*u
    </equation>
  </definition>

  <\conjecture>
    <dueto|Existence of a stationary covariance kernel>For each fixed
    <math|\<tau\>\<in\>\<bbb-R\>>, the limit:

    <\equation>
      K<around|(|\<tau\>|)>\<assign\>lim<rsub|U\<to\>\<infty\>>
      K<rsub|U><around|(|\<tau\>|)>
    </equation>

    exists in <math|\<bbb-R\>>.
  </conjecture>

  <\conjecture>
    <dueto|Ergodic stationary realization>There exists a probability space
    <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> and a stationary
    ergodic process <math|<around|{|X<rsub|<math-up|st>><around|(|u,\<omega\>|)>|}><rsub|u\<in\>\<bbb-R\>>>
    such that for some <math|\<omega\><rsub|0>\<in\>\<Omega\>>:

    <\equation>
      X<rsub|<math-up|st>><around|(|u,\<omega\><rsub|0>|)>=X<around|(|u|)><space|1em>\<forall\>u\<geq\>\<Theta\><around|(|0|)>
    </equation>

    and for every fixed <math|\<tau\>\<in\>\<bbb-R\>>:

    <\equation>
      \<bbb-E\>*<around|[|X<rsub|<math-up|st>><around|(|0,\<omega\>|)>*X<rsub|<math-up|st>><around|(|\<tau\>,\<omega\>|)>|]>=lim<rsub|U\<to\>\<infty\>>
      <frac|<big|int><rsub|\<Theta\><around|(|0|)>><rsup|U>X<around|(|u|)>*X*<around|(|u+\<tau\>|)>*d*u|U-\<Theta\><around|(|0|)>>
    </equation>
  </conjecture>

  <\thebibliography|99>
    <bibitem|stationaryAndRelatedStochasticProcesses>Harald Cramér and M. R.
    Leadbetter. <with|font-shape|italic|Stationary and Related Processes:
    Sample Function Properties and Their Applications>. Wiley, 1967.

    <bibitem|evolutionarySpectraAndNonStationaryProcesses>Maurice B.
    Priestley. Evolutionary spectra and non-stationary processes.
    <with|font-shape|italic|J. R. Stat. Soc. B>, 27(2):204\U229, 1965.

    <bibitem|priestley1981>Maurice B. Priestley.
    <with|font-shape|italic|Spectral Analysis and Time Series>. Academic
    Press, 1981.

    <bibitem|bulinskaya>E. V. Bulinskaya. On the mean number of crossings of
    a level by a stationary Gaussian process. <with|font-shape|italic|Theory
    Probab. Appl.>, 6(4):435\U438, 1961.
  </thebibliography>
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
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|4|7>>
    <associate|auto-11|<tuple|4.1|7>>
    <associate|auto-12|<tuple|4.2|7>>
    <associate|auto-13|<tuple|5|8>>
    <associate|auto-14|<tuple|5.1|8>>
    <associate|auto-15|<tuple|5.2|8>>
    <associate|auto-16|<tuple|5.3|9>>
    <associate|auto-17|<tuple|5.4|9>>
    <associate|auto-18|<tuple|5.5|10>>
    <associate|auto-19|<tuple|59|10>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1.3|2>>
    <associate|auto-5|<tuple|2|3>>
    <associate|auto-6|<tuple|2.1|3>>
    <associate|auto-7|<tuple|3|5>>
    <associate|auto-8|<tuple|3.1|5>>
    <associate|auto-9|<tuple|3.2|6>>
    <associate|bib-bulinskaya|<tuple|bulinskaya|10>>
    <associate|bib-evolutionarySpectraAndNonStationaryProcesses|<tuple|evolutionarySpectraAndNonStationaryProcesses|10>>
    <associate|bib-priestley1981|<tuple|priestley1981|10>>
    <associate|bib-stationaryAndRelatedStochasticProcesses|<tuple|stationaryAndRelatedStochasticProcesses|10>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gaussian
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Stationary Processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Sample Path Realizations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Unitarily
      Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Unitary Time-Change Operator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Stationary to Oscillatory
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Zero
      Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Kac\URice
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Bulinskaya
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Example:
      The Hardy Z-Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Definitions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Stationary Candidate and
      Exact Inversion <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|5.3<space|2spc><with|mode|<quote|math>|L<rsup|2><rsub|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-shape|<quote|right>|loc>>>>
      Identity on Finite Intervals <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|5.4<space|2spc>Limit-form Mean-Square
      Statements <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|5.5<space|2spc>Time-Average Covariance
      Conjectures <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>