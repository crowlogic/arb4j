<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Processes Yield
  Oscillatory Processes<next-line>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|September 16, 2025>>

  <\abstract>
    A unitary time-change operator <math|U<rsub|\<theta\>>> is constructed
    for absolutely continuous, strictly increasing time reparametrizations
    <math|\<theta\>>, acting on functions that are locally square-integrable
    (meaning over compact sets). Applying <math|U<rsub|\<theta\>>> to the
    Cramér spectral representation of a stationary process
    <math|X<around|(|t|)>> produces the transformed process
    <math|Z<around|(|t|)>=U<rsub|\<theta\>>*X<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>,
    which is an oscillatory process in the sense of Priestley with
    oscillatory function <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>,
    evolutionary spectrum <math|d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>>,
    and covariance kernel <math|K<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>K<rsub|X><around|(|\<theta\><around|(|t|)>,\<theta\><around|(|s|)>|)>>
    where <math|K<rsub|X>> is the stationary covariance of
    <math|X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>,
    and the expected zero-counting function
    <math|\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>> of the oscillatory
    process paths equals <math|<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|a|)>-\<theta\><around|(|b|)>|)>>.
    The sample paths of any non-degenerate second-order stationary process
    are locally square integrable, making the unitary time-change operator
    <math|U<rsub|\<theta\>>> applicable to typical realizations. A
    zero-localization measure <math|d*\<mu\><around|(|t|)>=\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t>
    induces a Hilbert space <math|L<rsup|2><around|(|\<mu\>|)>> on the zero
    set of each oscillatory process realization <math|Z<around|(|t|)>>, and
    the multiplication operator <math|<around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>>
    has simple pure point spectrum equal to the zero crossing set of <math|Z>
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Gaussian
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Definition
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>Stationary processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|2tab|1.2.1<space|2spc>Sample path realizations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|1.3<space|2spc>(Non-Stationary) Oscillatory Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Unitarily
    Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Unitary time-change operator
    <with|mode|math|U<rsub|\<theta\>>*f> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|2.2<space|2spc>Time-Varying (Convolution) Filter
    Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|2tab|2.2.1<space|2spc>The Oscillatory Subclass
    <with|mode|math|Z<around*|(|t|)>=U<rsub|\<theta\>> X<around*|(|t|)>>
    \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|2.3<space|2spc>Transformation of stationary to
    oscillatory processes via <with|mode|math|U<rsub|\<theta\>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|2.4<space|2spc>Covariance operator conjugation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Zero
    Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>
  </table-of-contents>

  <section|Gaussian Processes>

  <subsection|Definition>

  <\definition>
    <label|def:gaussian_process><with|font-series|bold|(Gaussian process)>
    Let <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> be a probability
    space and <math|T> a nonempty index set. A family
    <math|<around|{|X<rsub|t>:t\<in\>T|}>> of real-valued random variables on
    <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> is called a Gaussian
    process if for every finite subset <math|<around|{|t<rsub|1>,\<ldots\>,t<rsub|n>|}>\<subset\>T>
    the random vector <math|<around|(|X<rsub|t<rsub|1>>,\<ldots\>,X<rsub|t<rsub|n>>|)>>
    is multivariate normal (possibly degenerate). Equivalently, every finite
    linear combination <math|<big|sum><rsub|i=1><rsup|n>a<rsub|i>*X<rsub|t<rsub|i>>>
    is either almost surely constant or Gaussian. The mean function is
    <math|m<around|(|t|)>\<assign\>\<bbb-E\><around|[|X<rsub|t>|]>> and the
    covariance kernel is

    <\equation>
      <label|eq:covariance_kernel>K<around|(|s,t|)>=<math-up|Cov><around|(|X<rsub|s>,X<rsub|t>|)>
    </equation>

    For any finite <math|<around|(|t<rsub|i>|)><rsub|i=1><rsup|n>\<subset\>T>,
    the matrix <math|K<rsub|i*j>=K<around|(|t<rsub|i>,t<rsub|j>|)>> is
    symmetric positive semidefinite, and a Gaussian process is completely
    determined in law by <math|m> and <math|K>
  </definition>

  <subsection|Stationary processes>

  <\definition>
    <label|def:cramer><with|font-series|bold|[Cramér spectral
    representation]><cite|stationaryAndRelatedStochasticProcesses> A
    zero-mean stationary process <math|X> with spectral measure <math|F>
    admits the sample path representation

    <\equation>
      <label|eq:cramer_representation>X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    which has covariance

    <\equation>
      <label|eq:stationary_covariance>R<rsub|X>*<around|(|t-s|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <subsubsection|Sample path realizations>

  <\definition>
    <label|def:L2loc><with|font-series|bold|[Locally square-integrable
    functions]> Define

    <\equation>
      L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>\<assign\><around*|{|f:\<bbb-R\>\<to\>\<bbb-C\><space|0.17em>:<space|0.17em><big|int><rsub|K><around|\||f<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>*<text|for
      every compact >K\<subseteq\>\<bbb-R\>|}>
    </equation>
  </definition>

  <\remark>
    <label|rem:L2loc_properties>Every bounded measurable set in
    <math|\<bbb-R\>> is compact or contained in a compact set; hence
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>> contains
    functions that are square-integrable on every bounded interval, including
    functions with polynomial growth at infinity
  </remark>

  <\theorem>
    <label|thm:paths_loc><with|font-series|bold|[Sample paths in
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>]> Let
    <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> be a
    second-order stationary process with

    <\equation>
      <label|eq:finite_variance>\<sigma\><rsup|2>\<assign\>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>\<less\>\<infty\>
    </equation>

    Then almost every sample path lies in
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>
  </theorem>

  <\proof>
    Fix an arbitrary bounded interval <math|<around|[|a,b|]>\<subset\>\<bbb-R\>>
    with <math|a\<less\>b>. Define

    <\equation>
      <label|eq:Yab_def>Y<rsub|<around|[|a,b|]>>\<assign\><big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*<space|0.17em>d*t
    </equation>

    By Tonelli's theorem, since <math|X<around|(|t|)><rsup|2>\<ge\>0>,

    <\equation>
      <label|eq:tonelli_application>\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=\<bbb-E\><space|-0.17em><around*|[|<big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*<space|0.17em>d*t|]>=<big|int><rsub|a><rsup|b>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>*<space|0.17em>d*t
    </equation>

    By stationarity, <math|\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>=\<sigma\><rsup|2>>
    for all <math|t>, hence

    <\equation>
      <label|eq:expectation_Yab>\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=\<sigma\><rsup|2>*<around|(|b-a|)>\<less\>\<infty\>
    </equation>

    Markov's inequality yields, for <math|M\<gtr\>0>,

    <\equation>
      <label|eq:markov_inequality>\<bbb-P\>*<around|(|Y<rsub|<around|[|a,b|]>>\<gtr\>M|)>\<le\><frac|\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>|M>=<frac|\<sigma\><rsup|2>*<around|(|b-a|)>|M>
    </equation>

    and letting <math|M\<to\>\<infty\>> gives
    <math|\<bbb-P\>*<around|(|Y<rsub|<around|[|a,b|]>>\<less\>\<infty\>|)>=1>.
    Now let <math|K\<subset\>\<bbb-R\>> be compact, so
    <math|K\<subseteq\><around|[|-N,N|]>> for some <math|N\<gtr\>0>. Then

    <\equation>
      <big|int><rsub|K>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<le\><big|int><rsub|-N><rsup|N>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<less\>\<infty\><space|1em><text|a.s.>
    </equation>

    hence almost every path satisfies <math|<big|int><rsub|K><around|\||X<around|(|t,\<omega\>|)>|\|><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>>
    for every compact <math|K>, i.e. <math|X<around|(|\<cdummy\>,\<omega\>|)>\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>
  </proof>

  <subsection|(Non-Stationary) Oscillatory Processes><label|sec:oscillatory>

  <\definition>
    <label|def:osc_proc><with|font-series|bold|[Oscillatory
    process]><cite|evolutionarySpectraAndNonStationaryProcesses> Let <math|F>
    be a finite nonnegative Borel measure on <math|\<bbb-R\>>. Let

    <\equation>
      <label|eq:gain_L2>A<rsub|t>\<in\>L<rsup|2><around|(|F|)><space|1em>\<forall\><space|0.17em>t\<in\>\<bbb-R\>
    </equation>

    be the gain function and

    <\equation>
      <label|eq:oscillatory_function>\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>
    </equation>

    the corresponding oscillatory function. An oscillatory process is a
    stochastic process represented as

    <\equation>
      <label|eq:oscillatory_process>Z<around|(|t|)><space|0.27em>=<space|0.27em><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><space|0.27em>=<space|0.27em><big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure with spectral
    measure <math|F> satisfying

    <\equation>
      <label|eq:orthogonality_phi>d*\<bbb-E\><space|-0.17em><around*|[|\<Phi\><around|(|\<lambda\>|)><space|0.17em><wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]><space|0.27em>=<space|0.27em>\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    and covariance

    <\equation>
      <label|eq:oscillatory_covariance><tabular|<tformat|<table|<row|<cell|R<rsub|Z><around|(|t,s|)><space|0.27em>=<space|0.27em>\<bbb-E\><space|-0.17em><around*|[|Z<around|(|t|)><space|0.17em><wide|Z<around|(|s|)>|\<bar\>>|]>>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|\<nobracket\>>>>>>><with|font-series|bold|>
    </equation>

    \;
  </definition>

  <\definition>
    <label|cor:evol_spec><with|font-series|bold|[Evolutionary spectrum]> The
    evolutionary power spectral density of an oscillatory process is given by
    is

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<label|eq:evolutionary_spectrum>d*F<rsub|t><around|(|\<lambda\>|)>>|<cell|=S<rsub|t><around*|(|\<lambda\>|)>\<mathd\>\<lambda\>>>|<row|<cell|>|<cell|=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)><with|font-series|bold|>>>|<row|<cell|>|<cell|=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>S<around*|(|\<lambda\>|)>d\<lambda\>>>>>>
    </equation>
  </definition>

  <\definition>
    <strong|[Variance of evolutionary process]> The variance of an
    evolutionary process <math|Z<around*|(|t|)>> is given by integrating the
    evolutionary power spectral density <math|S<rsub|t><around*|(|\<lambda\>|)>>
    over all frequencues

    <\equation>
      var<around*|(|Z<around*|(|t|)>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t><around*|(|\<lambda\><rsub|>|)>\<mathd\>\<lambda\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<mathd\>F<rsub|t><around*|(|\<lambda\>|)>
    </equation>
  </definition>

  <\theorem>
    <label|thm:realvaluedness><with|font-series|bold|[Real-valuedness
    criterion for oscillatory processes]> Let <math|Z> be an oscillatory
    process with oscillatory function <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>>
    and spectral measure <math|F>. Then <math|Z> is real-valued if and only
    if

    <\equation>
      <label|eq:gain_symmetry>A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|1em><text|for
      >F*<text|-a.e. >\<lambda\>\<in\>\<bbb-R\>
    </equation>

    equivalently

    <\equation>
      <label|eq:osc_symmetry>\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|1em><text|for
      >F*<text|-a.e. >\<lambda\>\<in\>\<bbb-R\>
    </equation>
  </theorem>

  <\proof>
    If <math|Z> is real-valued, then <math|Z<around|(|t|)>=<wide|Z<around|(|t|)>|\<bar\>>>
    for all <math|t>. Taking conjugates in the representation
    <math|Z<around|(|t|)>=<big|int><space|-0.17em>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>
    and using the symmetry relation for the orthogonal random measure
    appropriate for real-valued processes, a change of variable
    <math|\<mu\>=-\<lambda\>> shows that the
    <math|L<rsup|2><around|(|F|)>>-integrands must agree <math|F>-a.e., i.e.
    <math|A<rsub|t><around|(|\<lambda\>|)>=<wide|A<rsub|t>*<around|(|-\<lambda\>|)>|\<bar\>>>,
    which is equivalent to <eqref|eq:gain_symmetry>. Using
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>
    then gives <eqref|eq:osc_symmetry>. The converse follows by reversing the
    steps
  </proof>

  <\theorem>
    <label|thm:existence_osc><with|font-series|bold|[Existence of oscillatory
    processes with explicit <math|L<rsup|2>>-limit construction]> Let
    <math|F> be an absolutely continuous spectral measure and the gain
    function <math|A<rsub|t><around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>>
    for all <math|t\<in\>\<bbb-R\>>, measurable jointly in
    <math|<around|(|t,\<lambda\>|)>>. Define the time-dependent spectrum

    <\equation>
      <label|eq:time_dependent_spectrum>S<rsub|t>\<assign\><big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)><space|0.27em>=<space|0.27em><big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>S<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\><space|0.27em>\<less\><space|0.27em>\<infty\>
    </equation>

    Then there exists a complex orthogonal random measure <math|\<Phi\>> with
    spectral measure <math|F> such that for each fixed <math|t> the
    stochastic integral

    <\equation>
      <label|eq:oscillatory_well_defined>Z<around|(|t|)><space|0.27em>=<space|0.27em><big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    is well-defined as an <math|L<rsup|2><around|(|\<Omega\>|)>>-limit and
    has covariance <math|R<rsub|Z>> as in <eqref|eq:oscillatory_covariance>
  </theorem>

  <\proof>
    Step 1 (simple functions and isometry). Let <math|<math-ss|S>> denote the
    set of simple functions

    <\equation>
      <label|eq:simple_function>g<around|(|\<lambda\>|)><space|0.27em>=<space|0.27em><big|sum><rsub|j=1><rsup|n>c<rsub|j>*<space|0.17em><with|math-font-family|bf|1><rsub|E<rsub|j>><around|(|\<lambda\>|)>
    </equation>

    with disjoint Borel <math|E<rsub|j>> and
    <math|F<around|(|E<rsub|j>|)>\<less\>\<infty\>>,
    <math|c<rsub|j>\<in\>\<bbb-C\>>. Define the stochastic integral on
    <math|<math-ss|S>> by

    <\equation>
      <label|eq:integral_simple><big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><space|0.27em>\<assign\><space|0.27em><big|sum><rsub|j=1><rsup|n>c<rsub|j>*<space|0.17em>\<Phi\><around|(|E<rsub|j>|)>
    </equation>

    Using orthogonality of <math|\<Phi\>>,

    <\equation>
      <label|eq:isometry_simple>\<bbb-E\><space|-0.17em><around*|[|<around*|\||<big|int>g*<space|0.17em>d*\<Phi\>|\|><rsup|2>|]>=<big|sum><rsub|j=1><rsup|n><around|\||c<rsub|j>|\|><rsup|2>*<space|0.17em>F<around|(|E<rsub|j>|)>=<big|int><rsub|\<bbb-R\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    Thus the map <math|I:<math-ss|S>\<to\>L<rsup|2><around|(|\<Omega\>|)>>,
    <math|I<around|(|g|)>=<big|int>g*<space|0.17em>d*\<Phi\>>, is an isometry
    with respect to the <math|L<rsup|2><around|(|F|)>>-norm.

    Step 2 (density and Cauchy property). Simple functions are dense in
    <math|L<rsup|2><around|(|F|)>>: for any
    <math|h\<in\>L<rsup|2><around|(|F|)>> there exists
    <math|g<rsub|n>\<in\><math-ss|S>> with
    <math|<around|\<\|\|\>|h-g<rsub|n>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>>\<to\>0>.
    By <eqref|eq:isometry_simple>,

    <\equation>
      <label|eq:cauchy_sequence>\<bbb-E\><space|-0.17em><around*|[|<around*|\||<big|int>g<rsub|n>*<space|0.17em>d*\<Phi\>-<big|int>g<rsub|m>*<space|0.17em>d*\<Phi\>|\|><rsup|2>|]>=<around|\<\|\|\>|g<rsub|n>-g<rsub|m>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>><rsup|2><space|0.27em><long-arrow|\<rubber-rightarrow\>|n,m\<to\>\<infty\>|>0
    </equation>

    so <math|<around*|{|<big|int>g<rsub|n>*<space|0.17em>d*\<Phi\>|}>> is
    Cauchy in <math|L<rsup|2><around|(|\<Omega\>|)>>.

    Step 3 (definition by <math|L<rsup|2>>-limit and independence of
    approximating sequence). Since <math|L<rsup|2><around|(|\<Omega\>|)>> is
    complete, the limit exists. Define, for
    <math|h\<in\>L<rsup|2><around|(|F|)>>,

    <\equation>
      <label|eq:L2_limit_def><big|int><rsub|\<bbb-R\>>h<around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><space|0.27em>\<assign\><space|0.27em>lim<rsub|n\<to\>\<infty\>>
      <big|int><rsub|\<bbb-R\>>g<rsub|n><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|g<rsub|n>\<in\><math-ss|S>> and
    <math|<around|\<\|\|\>|h-g<rsub|n>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>>\<to\>0>.
    If <math|g<rsub|n>> and <math|<wide|g|~><rsub|n>> are two such
    approximating sequences, then <math|<around|\<\|\|\>|g<rsub|n>-<wide|g|~><rsub|n>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>>\<to\>0>
    and again by <eqref|eq:isometry_simple> the corresponding integrals
    differ by an <math|L<rsup|2><around|(|\<Omega\>|)>>-null sequence, so the
    limit is independent of the sequence.

    Step 4 (isometry and linearity extend). By continuity from
    <eqref|eq:isometry_simple> and <eqref|eq:L2_limit_def>,

    <\equation>
      <label|eq:L2_isometry_extension>\<bbb-E\><space|-0.17em><around*|[|<around*|\||<big|int>h*<space|0.17em>d*\<Phi\>|\|><rsup|2>|]>=<big|int><rsub|\<bbb-R\>><around|\||h<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    for <math|h\<in\>L<rsup|2><around|(|F|)>>, and the map
    <math|h\<mapsto\><big|int>h*<space|0.17em>d*\<Phi\>> is linear and
    isometric.

    Step 5 (apply to <math|\<varphi\><rsub|t>>). Since
    <math|<around|\||e<rsup|i*\<lambda\>*t>|\|>=1>,
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>\<in\>L<rsup|2><around|(|F|)>>
    and

    <\equation>
      <big|int><rsub|\<bbb-R\>><around|\||\<varphi\><rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>=S<rsub|t>\<less\>\<infty\>
    </equation>

    Hence <math|Z<around|(|t|)>> in <eqref|eq:oscillatory_well_defined> is
    well-defined as the <math|L<rsup|2><around|(|\<Omega\>|)>>-limit
    <eqref|eq:L2_limit_def> with <math|h=\<varphi\><rsub|t>>. Computing
    covariance via sesquilinearity together with <eqref|eq:orthogonality_phi>
    yields <eqref|eq:oscillatory_covariance>
  </proof>

  <section|Unitarily Time-Changed Stationary
  Processes><label|sec:stationary_timechange>

  <subsection|Unitary time-change operator <math|U<rsub|\<theta\>>*f>>

  <\theorem>
    <label|thm:local_unitarity><with|font-series|bold|[Unitary time-change
    and local isometry]> Let the time-scaling function
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective, with

    <\equation>
      <wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0
    </equation>

    almost everywhere and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0>
    only on sets of Lebesgue measure zero. For <math|f> measurable, define

    <\equation>
      <label|eq:U_theta_def><around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>f<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Its inverse is given by

    <\equation>
      <label|eq:U_theta_inverse><around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>

    For every compact set <math|K\<subseteq\>\<bbb-R\>> and
    <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>,

    <\equation>
      <label|eq:local_isometry><big|int><rsub|K><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2><space|0.17em>d*t=<big|int><rsub|\<theta\><around|(|K|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s
    </equation>

    Moreover, <math|U<rsub|\<theta\>><rsup|-1>> is the inverse of
    <math|U<rsub|\<theta\>>> on <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>
  </theorem>

  <\proof>
    By <eqref|eq:U_theta_def>, <math|<big|int><rsub|K><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>|\|><rsup|2>*d*t=<big|int><rsub|K><wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t>.
    With the change of variables <math|s=\<theta\><around|(|t|)>> and
    <math|d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t>, the domain maps to
    <math|\<theta\><around|(|K|)>>, giving <eqref|eq:local_isometry>. The
    two-sided inverse identities follow from direct substitution into
    <eqref|eq:U_theta_def> and <eqref|eq:U_theta_inverse>
  </proof>

  <subsection|Time-Varying (Convolution) Filter Representations>

  <\theorem>
    TODO: insert time-varying filter representations (both forward and
    reverse)
  </theorem>

  <subsubsection|The Oscillatory Subclass
  <math|Z<around*|(|t|)>=U<rsub|\<theta\>> X<around*|(|t|)>> >

  \;

  \;

  \;

  <\theorem>
    <label|thm:inverse_filter><with|font-series|bold|[Filter representations
    of unitarily time-changed stationary processes]> Let
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective with
    <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0> a.e. Let
    <math|X<around|(|u|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i \<lambda\>
    t>\<mathd\>\<Phi\><around*|(|\<lambda\>|)>> be a realization of a
    stationary process , and set

    <\equation>
      <label|eq:Z_transformation>Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>Y<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then:

    <\enumerate>
      <item>The forward filter kernel is

      <\equation>
        <label|eq:forward_kernel>h*<around|(|t,u|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>
      </equation>

      <item>The inverse filter kernel is

      <\equation>
        <label|eq:inverse_kernel>g*<around|(|t,s|)>=<frac|\<delta\>*<around*|(|s-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>
      </equation>

      <item>The composition <math|<around|(|g\<circ\>h|)>> recovers the
      identity:

      <\equation>
        <label|eq:filter_identity>Y<around|(|t|)>=<big|int><rsub|\<bbb-R\>>g*<around|(|t,s|)>*<space|0.17em>Z<around|(|s|)>*<space|0.17em>d*s=<frac|Z<around|(|\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>
      </equation>
    </enumerate>
  </theorem>

  <\proof>
    Using the sifting property of the Dirac delta in
    <eqref|eq:forward_kernel> gives <eqref|eq:Z_transformation>. Likewise,
    applying <eqref|eq:inverse_kernel>, then substituting
    <eqref|eq:Z_transformation> at <math|s=\<theta\><rsup|-1><around|(|t|)>>
    and <math|\<theta\>\<circ\>\<theta\><rsup|-1>=<math-up|id>> yields
    <eqref|eq:filter_identity>
  </proof>

  <subsection|Transformation of stationary to oscillatory processes via
  <math|U<rsub|\<theta\>>>>

  <\theorem>
    <label|thm:Utheta_to_osc><with|font-series|bold|[Unitary time change
    produces oscillatory process]> Let <math|X> be zero-mean stationary as in
    Definition <reference|def:cramer>. For a scaling function
    <math|\<theta\>> as in Theorem <reference|thm:local_unitarity>, define

    <\equation>
      <label|eq:Z_def>Z<around|(|t|)>=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then <math|Z> is a realization of an oscillatory process with oscillatory
    function

    <\equation>
      <label|eq:oscillatory_function_Z>\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    gain function

    <\equation>
      <label|eq:gain_function_Z>A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    and covariance

    <\equation>
      <tabular|<tformat|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><space|-0.17em><around*|[|Z<around|(|t|)><space|0.17em><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>\<bbb-E\><space|-0.17em><around*|[|X<around|(|\<theta\><around|(|t|)>|)><space|0.17em><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>R<rsub|X>*<space|-0.17em><around*|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>><label|UTCovar>
    </equation>
  </theorem>

  <\proof>
    From the Cramér representation <eqref|eq:cramer_representation>,
    <math|X<around|(|\<theta\><around|(|t|)>|)>=<big|int>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>.
    Therefore

    <\equation*>
      Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><around*|(|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|)>*d*\<Phi\><around|(|\<lambda\>|)>=<big|int>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation*>

    which is of the oscillatory form with <math|\<varphi\><rsub|t>> as in
    <eqref|eq:oscillatory_function_Z> and <math|A<rsub|t>> as in
    <eqref|eq:gain_function_Z>. The covariance follows from stationarity via
    <eqref|eq:stationary_covariance>
  </proof>

  <\corollary>
    <label|cor:evol_spec><with|font-series|bold|[Evolutionary spectrum of
    unitarily time-changed stationary process]> The evolutionary spectrum is

    <\equation>
      <label|eq:evolutionary_spectrum>d*F<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </corollary>

  <\proof>
    Since <math|<around|\||e<rsup|i*\<alpha\>>|\|>=1>,
    <math|<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>=<wide|\<theta\>|\<dot\>><around|(|t|)>>,
    giving <eqref|eq:evolutionary_spectrum>
  </proof>

  <subsection|Covariance operator conjugation>

  <\proposition>
    <label|prop:conjugation><with|font-series|bold|[Operator conjugation]>
    Let

    <\equation>
      <label|eq:T_K_def><around|(|T<rsub|K>*f|)><around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>K<around|(|<around|\||t-s|\|>|)>*<space|0.17em>f<around|(|s|)>*<space|0.17em>d*s
    </equation>

    with stationary kernel

    <\equation>
      <label|eq:K_def>K<around|(|h|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*h>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>

    Define the transformed kernel

    <\equation>
      <label|eq:K_theta_def>K<rsub|\<theta\>><around|(|s,t|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>K<space|-0.17em><around*|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    Then for all <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>,

    <\equation>
      <label|eq:conjugation><around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>=<around*|(|U<rsub|\<theta\>>*<space|0.17em>T<rsub|K>*<space|0.17em>U<rsub|\<theta\>><rsup|-1>*f|)><around|(|t|)>
    </equation>
  </proposition>

  <\proof>
    Compute

    <\equation*>
      <around*|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em><around|(|T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|\<theta\><around|(|t|)>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-s|\|>|)><frac|f<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>*<space|0.17em>d*s
    </equation*>

    With <math|s=\<theta\><around|(|u|)>>,
    <math|d*s=<wide|\<theta\>|\<dot\>><around|(|u|)>*<space|0.17em>d*u>,
    obtain

    <\equation*>
      <sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)><space|0.17em><sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>*<space|0.17em>f<around|(|u|)>*<space|0.17em>d*u=<big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|u,t|)>*<space|0.17em>f<around|(|u|)>*<space|0.17em>d*u=<around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>
    </equation*>
  </proof>

  <section|Zero Localization><label|sec:HP>

  <\definition>
    <label|def:zeromeasure><with|font-series|bold|[Zero localization
    measure]> Let <math|Z> be real-valued with
    <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>> having only simple zeros

    <\equation>
      <label|eq:simple_zeros>Z<around|(|t<rsub|0>|)>=0<space|0.27em>\<Rightarrow\><space|0.27em><wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0
    </equation>

    Define, for Borel <math|B\<subset\>\<bbb-R\>>,

    <\equation>
      <label|eq:mu_def>\<mu\><around|(|B|)>\<assign\><big|int><rsub|B>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t
    </equation>

    so that <math|\<mu\>> places unit mass at each simple zero of <math|Z>
    counted by the co-area/change-of-variables identity for <math|C<rsup|1>>
    functions. The induced space <math|L<rsup|2><around|(|\<mu\>|)>> consists
    of (equivalence classes of) functions supported on the zero set of
    <math|Z>, and the multiplication operator
    <math|<around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>> is essentially
    self-adjoint on <math|C<rsub|c><rsup|\<infty\>>> functions supported on
    the zero set with pure point spectrum equal to the zero-crossing set
  </definition>

  \;

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
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|UTCovar|<tuple|40|8>>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|2.3|8>>
    <associate|auto-11|<tuple|2.4|9>>
    <associate|auto-12|<tuple|3|9>>
    <associate|auto-13|<tuple|47|10>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1.2.1|2>>
    <associate|auto-5|<tuple|1.3|3>>
    <associate|auto-6|<tuple|2|6>>
    <associate|auto-7|<tuple|2.1|6>>
    <associate|auto-8|<tuple|2.2|6>>
    <associate|auto-9|<tuple|2.2.1|6>>
    <associate|bib-evolutionarySpectraAndNonStationaryProcesses|<tuple|2|10>>
    <associate|bib-stationaryAndRelatedStochasticProcesses|<tuple|1|10>>
    <associate|cor:evol_spec|<tuple|15|8>>
    <associate|def:L2loc|<tuple|3|2>>
    <associate|def:cramer|<tuple|2|2>>
    <associate|def:gaussian_process|<tuple|1|2>>
    <associate|def:osc_proc|<tuple|6|3>>
    <associate|def:zeromeasure|<tuple|17|9>>
    <associate|eq:K_def|<tuple|43|9>>
    <associate|eq:K_theta_def|<tuple|44|9>>
    <associate|eq:L2_isometry_extension|<tuple|27|5>>
    <associate|eq:L2_limit_def|<tuple|26|5>>
    <associate|eq:T_K_def|<tuple|42|9>>
    <associate|eq:U_theta_def|<tuple|30|6>>
    <associate|eq:U_theta_inverse|<tuple|31|6>>
    <associate|eq:Yab_def|<tuple|6|2>>
    <associate|eq:Z_def|<tuple|37|8>>
    <associate|eq:Z_transformation|<tuple|33|7>>
    <associate|eq:cauchy_sequence|<tuple|25|5>>
    <associate|eq:conjugation|<tuple|45|9>>
    <associate|eq:covariance_kernel|<tuple|1|2>>
    <associate|eq:cramer_representation|<tuple|2|2>>
    <associate|eq:evolutionary_spectrum|<tuple|41|8>>
    <associate|eq:expectation_Yab|<tuple|8|3>>
    <associate|eq:filter_identity|<tuple|36|7>>
    <associate|eq:finite_variance|<tuple|5|2>>
    <associate|eq:forward_kernel|<tuple|34|7>>
    <associate|eq:gain_L2|<tuple|11|3>>
    <associate|eq:gain_function_Z|<tuple|39|8>>
    <associate|eq:gain_symmetry|<tuple|18|4>>
    <associate|eq:integral_simple|<tuple|23|5>>
    <associate|eq:inverse_kernel|<tuple|35|7>>
    <associate|eq:isometry_simple|<tuple|24|5>>
    <associate|eq:local_isometry|<tuple|32|6>>
    <associate|eq:markov_inequality|<tuple|9|3>>
    <associate|eq:mu_def|<tuple|47|9>>
    <associate|eq:orthogonality_phi|<tuple|14|3>>
    <associate|eq:osc_symmetry|<tuple|19|4>>
    <associate|eq:oscillatory_covariance|<tuple|15|3>>
    <associate|eq:oscillatory_function|<tuple|12|3>>
    <associate|eq:oscillatory_function_Z|<tuple|38|8>>
    <associate|eq:oscillatory_process|<tuple|13|3>>
    <associate|eq:oscillatory_well_defined|<tuple|21|4>>
    <associate|eq:simple_function|<tuple|22|5>>
    <associate|eq:simple_zeros|<tuple|46|9>>
    <associate|eq:stationary_covariance|<tuple|3|2>>
    <associate|eq:time_dependent_spectrum|<tuple|20|4>>
    <associate|eq:tonelli_application|<tuple|7|3>>
    <associate|prop:conjugation|<tuple|16|9>>
    <associate|rem:L2loc_properties|<tuple|4|2>>
    <associate|sec:HP|<tuple|3|9>>
    <associate|sec:oscillatory|<tuple|1.3|3>>
    <associate|sec:stationary_timechange|<tuple|2|6>>
    <associate|thm:Utheta_to_osc|<tuple|14|8>>
    <associate|thm:existence_osc|<tuple|10|4>>
    <associate|thm:inverse_filter|<tuple|13|7>>
    <associate|thm:local_unitarity|<tuple|11|6>>
    <associate|thm:paths_loc|<tuple|5|2>>
    <associate|thm:realvaluedness|<tuple|9|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stationaryAndRelatedStochasticProcesses

      evolutionarySpectraAndNonStationaryProcesses
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gaussian
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Stationary processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Sample path realizations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>(Non-Stationary) Oscillatory
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Unitarily
      Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Unitary time-change operator
      <with|mode|<quote|math>|U<rsub|\<theta\>>*f>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Time-Varying (Convolution)
      Filter Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|2.2.1<space|2spc>The Oscillatory Subclass
      <with|mode|<quote|math>|Z<around*|(|t|)>=U<rsub|\<theta\>>
      X<around*|(|t|)>> \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Transformation of stationary
      to oscillatory processes via <with|mode|<quote|math>|U<rsub|\<theta\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|2.4<space|2spc>Covariance operator
      conjugation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Zero
      Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>