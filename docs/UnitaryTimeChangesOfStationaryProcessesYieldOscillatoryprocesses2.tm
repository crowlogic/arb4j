<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <documentclass*|11pt|article>

  <usepackage|amsmath,amssymb,amsfonts,amsthm,mathtools> <usepackage|bm>
  <usepackage|mathrsfs> <usepackage|enumitem>
  <usepackage*|margin=1in|geometry> <usepackage*|colorlinks=true,linkcolor=blue,citecolor=blue,urlcolor=blue|hyperref>

  <title|Unitary Time Changes of Stationary Processes Produce Oscillatory
  Processes > <author|Stephen Crowley><date|September 16, 2025>

  <theoremstyle|definition> <new-theorem|definition|Definition>[section]
  <theoremstyle|plain> <new-theorem|theorem|Theorem><new-theorem|proposition|Proposition><new-theorem|corollary|Corollary><new-theorem|lemma|Lemma><theoremstyle|remark>
  <new-theorem|remark|Remark>

  <assign|assign|<macro|\<assign\>>><assign|tmop|<macro|var>><numberwithin|equation|section>

  <maketitle>

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
    evolutionary power spectral density <math|S<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>S<around|(|\<lambda\>|)>>,
    and covariance kernel <math|K<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>K<rsub|X><around|(|\<theta\><around|(|t|)>,\<theta\><around|(|s|)>|)>>
    where <math|K<rsub|X>> is the stationary covariance of
    <math|X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>,
    and the expected zero-counting function
    <math|\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>> of the oscillatory
    process paths equals <math|<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<space|0.17em><around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>/\<pi\>>.
    The sample paths of any non-degenerate second-order stationary process
    are locally square integrable, making the unitary time-change operator
    <math|U<rsub|\<theta\>>> applicable to typical realizations. By
    Bulinskaya's theorem, when the covariance is twice continuously
    differentiable with <math|R<rprime|''><around|(|0|)>\<less\>0>, almost
    all zeros are simple. A zero-localization measure
    <math|d*\<mu\><around|(|t|)>=\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t>
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

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>(Non-Stationary)
    Oscillatory Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Filter Representations and
    Invertibility for Oscillatory Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Unitarily
    Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Unitary time-change operator
    <with|mode|math|U<rsub|\<theta\>>*f> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.2<space|2spc>Filter Representations for Unitarily
    Time-Changed Stationary Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|3.3<space|2spc>Transformation of stationary to
    oscillatory processes via <with|mode|math|U<rsub|\<theta\>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|3.4<space|2spc>Covariance operator conjugation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Zero
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
    representation]> A zero-mean stationary process <math|X> with spectral
    measure <math|F> admits the sample path representation

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
      <label|eq:L2loc_def>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>\<assign\><around*|{|f:\<bbb-R\>\<to\>\<bbb-C\><space|0.17em>:<space|0.17em><big|int><rsub|K><around|\||f<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>*<text|for
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
      <label|eq:compact_bound><big|int><rsub|K>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<le\><big|int><rsub|-N><rsup|N>X<around|(|t|)><rsup|2>*<space|0.17em>d*t\<less\>\<infty\><space|1em><text|a.s.>
    </equation>

    hence almost every path satisfies <math|<big|int><rsub|K><around|\||X<around|(|t,\<omega\>|)>|\|><rsup|2>*<space|0.17em>d*t\<less\>\<infty\>>
    for every compact <math|K>, i.e. <math|X<around|(|\<cdummy\>,\<omega\>|)>\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>
  </proof>

  <subsection|(Non-Stationary) Oscillatory Processes><label|sec:oscillatory>

  <\definition>
    <label|def:osc_proc><with|font-series|bold|[Oscillatory process]> Let
    <math|F> be a finite nonnegative Borel measure on <math|\<bbb-R\>>. Let

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
      <label|eq:oscillatory_covariance>

      <\aligned>
        <tformat|<table|<row|<cell|R<rsub|Z><around|(|t,s|)><space|0.27em>=<space|0.27em>\<bbb-E\><space|-0.17em><around*|[|Z<around|(|t|)><space|0.17em><wide|Z<around|(|s|)>|\<bar\>>|]>>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><space|0.17em><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*F<around|(|\<lambda\>|)>>>>>
      </aligned>
    </equation>
  </definition>

  <\definition>
    <label|def:epsd><with|font-series|bold|[Evolutionary power spectral
    density (EPSD)]> For an oscillatory process with gain function
    <math|A<rsub|t><around|(|\<lambda\>|)>> and spectral measure <math|F>
    having density <math|S<around|(|\<lambda\>|)>> (i.e.,
    <math|d*F<around|(|\<lambda\>|)>=S<around|(|\<lambda\>|)>*d*\<lambda\>>),
    the evolutionary power spectral density is

    <\equation>
      <label|eq:epsd_definition>S<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>S<around|(|\<lambda\>|)>
    </equation>

    so that the evolutionary spectral measure is
    <math|d*F<rsub|t><around|(|\<lambda\>|)>=S<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>>
  </definition>

  <\definition>
    <label|def:variance_evolutionary><with|font-series|bold|[Variance of
    oscillatory process]> The variance of an oscillatory process
    <math|Z<around|(|t|)>> is given by integrating the evolutionary power
    spectral density over all frequencies

    <\equation>
      <label|eq:variance_epsd><tmop>v*a*r<around|(|Z<around|(|t|)>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>d*F<rsub|t><around|(|\<lambda\>|)>
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

    <\equation>
      <label|eq:real_proof_1>Z<around|(|t|)>=<big|int><space|-0.17em>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    and using the symmetry relation for the orthogonal random measure
    appropriate for real-valued processes, a change of variable
    <math|\<mu\>=-\<lambda\>> shows that the
    <math|L<rsup|2><around|(|F|)>>-integrands must agree <math|F>-a.e., i.e.

    <\equation>
      <label|eq:real_proof_2>A<rsub|t><around|(|\<lambda\>|)>=<wide|A<rsub|t>*<around|(|-\<lambda\>|)>|\<bar\>>
    </equation>

    which is equivalent to <eqref|eq:gain_symmetry>. Using
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>
    then gives <eqref|eq:osc_symmetry>. The converse follows by reversing the
    steps
  </proof>

  <\theorem>
    <label|thm:existence_osc><with|font-series|bold|[Existence of oscillatory
    processes with explicit <math|L<rsup|2>>-limit construction]> Let
    <math|F> be an absolutely continuous spectral measure with density
    <math|S<around|(|\<lambda\>|)>> and the gain function
    <math|A<rsub|t><around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>> for
    all <math|t\<in\>\<bbb-R\>>, measurable jointly in
    <math|<around|(|t,\<lambda\>|)>>. Define the time-dependent variance

    <\equation>
      <label|eq:time_dependent_spectrum>\<sigma\><rsub|t><rsup|2>\<assign\><big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)><space|0.27em>=<space|0.27em><big|int><rsub|\<bbb-R\>>S<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\><space|0.27em>\<less\><space|0.27em>\<infty\>
    </equation>

    where <math|S<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*S<around|(|\<lambda\>|)>>
    is the evolutionary power spectral density. Then there exists a complex
    orthogonal random measure <math|\<Phi\>> with spectral measure <math|F>
    such that for each fixed <math|t> the stochastic integral

    <\equation>
      <label|eq:oscillatory_well_defined>Z<around|(|t|)><space|0.27em>=<space|0.27em><big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    is well-defined as an <math|L<rsup|2><around|(|\<Omega\>|)>>-limit and
    has covariance <math|R<rsub|Z>> as in <eqref|eq:oscillatory_covariance>
  </theorem>

  <\proof>
    <\enumerate>
      <item><with|font-shape|italic|Simple functions and isometry.> Let
      <math|<math-ss|S>> denote the set of simple functions

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
      <math|I<around|(|g|)>=<big|int>g*<space|0.17em>d*\<Phi\>>, is an
      isometry with respect to the <math|L<rsup|2><around|(|F|)>>-norm.

      <item><with|font-shape|italic|Density and Cauchy property.> Simple
      functions are dense in <math|L<rsup|2><around|(|F|)>>: for any
      <math|h\<in\>L<rsup|2><around|(|F|)>> there exists
      <math|g<rsub|n>\<in\><math-ss|S>> with
      <math|<around|\<\|\|\>|h-g<rsub|n>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>>\<to\>0>.
      By <eqref|eq:isometry_simple>,

      <\equation>
        <label|eq:cauchy_sequence>\<bbb-E\><space|-0.17em><around*|[|<around*|\||<big|int>g<rsub|n>*<space|0.17em>d*\<Phi\>-<big|int>g<rsub|m>*<space|0.17em>d*\<Phi\>|\|><rsup|2>|]>=<around|\<\|\|\>|g<rsub|n>-g<rsub|m>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>><rsup|2><space|0.27em><long-arrow|\<rubber-rightarrow\>|n,m\<to\>\<infty\>|>0
      </equation>

      so <math|<around*|{|<big|int>g<rsub|n>*<space|0.17em>d*\<Phi\>|}>> is
      Cauchy in <math|L<rsup|2><around|(|\<Omega\>|)>>.

      <item><with|font-shape|italic|Definition by <math|L<rsup|2>>-limit and
      independence of approximating sequence.> Since
      <math|L<rsup|2><around|(|\<Omega\>|)>> is complete, the limit exists.
      Define, for <math|h\<in\>L<rsup|2><around|(|F|)>>,

      <\equation>
        <label|eq:L2_limit_def><big|int><rsub|\<bbb-R\>>h<around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)><space|0.27em>\<assign\><space|0.27em>lim<rsub|n\<to\>\<infty\>>
        <big|int><rsub|\<bbb-R\>>g<rsub|n><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      where <math|g<rsub|n>\<in\><math-ss|S>> and
      <math|<around|\<\|\|\>|h-g<rsub|n>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>>\<to\>0>.
      If <math|g<rsub|n>> and <math|<wide|g|~><rsub|n>> are two such
      approximating sequences, then <math|<around|\<\|\|\>|g<rsub|n>-<wide|g|~><rsub|n>|\<\|\|\>><rsub|L<rsup|2><around|(|F|)>>\<to\>0>
      and again by <eqref|eq:isometry_simple> the corresponding integrals
      differ by an <math|L<rsup|2><around|(|\<Omega\>|)>>-null sequence, so
      the limit is independent of the sequence.

      <item><with|font-shape|italic|Isometry and linearity extend.> By
      continuity from <eqref|eq:isometry_simple> and <eqref|eq:L2_limit_def>,

      <\equation>
        <label|eq:L2_isometry_extension>\<bbb-E\><space|-0.17em><around*|[|<around*|\||<big|int>h*<space|0.17em>d*\<Phi\>|\|><rsup|2>|]>=<big|int><rsub|\<bbb-R\>><around|\||h<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>
      </equation>

      for all <math|h\<in\>L<rsup|2><around|(|F|)>>, and the map
      <math|h\<mapsto\><big|int>h*<space|0.17em>d*\<Phi\>> is linear and
      isometric.

      <item><with|font-shape|italic|Application to
      <math|\<varphi\><rsub|t>>.> Since <math|<around|\||e<rsup|i*\<lambda\>*t>|\|>=1>,
      <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>\<in\>L<rsup|2><around|(|F|)>>
      and

      <\equation>
        <label|eq:varphi_L2><big|int><rsub|\<bbb-R\>><around|\||\<varphi\><rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*F<around|(|\<lambda\>|)>=\<sigma\><rsub|t><rsup|2>\<less\>\<infty\>
      </equation>

      Hence <math|Z<around|(|t|)>> in <eqref|eq:oscillatory_well_defined> is
      well-defined as the <math|L<rsup|2><around|(|\<Omega\>|)>>-limit
      <eqref|eq:L2_limit_def> with <math|h=\<varphi\><rsub|t>>. Computing
      covariance via sesquilinearity together with
      <eqref|eq:orthogonality_phi> yields <eqref|eq:oscillatory_covariance>
    </enumerate>
  </proof>

  <subsection|Filter Representations and Invertibility for Oscillatory
  Processes>

  <\definition>
    <label|def:filter_gain><with|font-series|bold|[Time-dependent filter and
    gain]> The time-dependent filter <math|h*<around|(|t,u|)>> and gain
    function <math|A<rsub|t><around|(|\<lambda\>|)>> satisfy the Fourier
    transform pair

    <\equation>
      <label|eq:gain_from_filter>A<rsub|t><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t,u|)>*<space|0.17em>e<rsup|-i*\<lambda\>*<around|(|t-u|)>>*<space|0.17em>d*u
    </equation>

    <\equation>
      <label|eq:filter_from_gain>h*<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*<around|(|t-u|)>>*<space|0.17em>d*\<lambda\>
    </equation>

    with square-integrability

    <\equation>
      <label|eq:filter_square_int><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||h*<around|(|t,u|)>|\|><rsup|2>*<space|0.17em>d*u\<less\>\<infty\><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>
  </definition>

  <\theorem>
    <label|thm:general_filter><with|font-series|bold|[Forward and inverse
    filter representations for general oscillatory processes]> Let
    <math|Z<around|(|t|)>> be an oscillatory process as in Definition
    <reference|def:osc_proc> with oscillatory function
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>.
    Then:

    <\enumerate>
      <item>The forward time-varying filter representation is

      <\equation>
        <label|eq:general_forward_filter>Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>h*<around|(|t,\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      with kernel <math|h*<around|(|t,\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>>

      <item>For oscillatory processes with white noise representation
      <math|d*W<around|(|u|)>> satisfying

      <\equation>
        <label|eq:whitenoise_orthog>\<bbb-E\>*<around|[|d*W<around|(|u<rsub|1>|)><space|0.17em><wide|d*W<around|(|u<rsub|2>|)>|\<bar\>>|]>=\<delta\>*<around|(|u<rsub|1>-u<rsub|2>|)>*<space|0.17em>d*u<rsub|1>
      </equation>

      the process admits

      <\equation>
        <label|eq:whitenoise_filter>Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t,u|)>*<space|0.17em>d*W<around|(|u|)>
      </equation>
    </enumerate>
  </theorem>

  <\proof>
    <\enumerate>
      <item>Equation <eqref|eq:general_forward_filter> is immediate from
      <eqref|eq:oscillatory_process>

      <item>The white noise representation follows from the spectral relation

      <\equation>
        <label|eq:spectral_whitenoise>d*\<Phi\><around|(|\<lambda\>|)>=<frac|1|2*\<pi\>>*<big|int>e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*W<around|(|u|)>*<space|0.17em>d*u
      </equation>

      and application of the filter Fourier pair
    </enumerate>
  </proof>

  <\definition>
    <label|def:amplitude_nondeg><with|font-series|bold|[Amplitude
    nondegeneracy]> The amplitude <math|A<rsub|t><around|(|\<lambda\>|)>>
    satisfies

    <\equation>
      <label|eq:nonzero>A<rsub|t><around|(|\<lambda\>|)>\<neq\>0*<space|1em><text|for
      all ><around|(|t,\<lambda\>|)>*<text|in the support of >F
    </equation>
  </definition>

  <\definition>
    <label|def:orthonormality><with|font-series|bold|[Kernel orthonormality]>
    The amplitude satisfies

    <\equation>
      <label|eq:delta_ortho><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\><rsub|1>|)>*<space|0.17em>A<rsub|t><around|(|\<lambda\><rsub|2>|)>*<space|0.17em>e<rsup|i*<around|(|\<lambda\><rsub|2>-\<lambda\><rsub|1>|)>*t>*<space|0.17em>d*t=\<delta\>*<around|(|\<lambda\><rsub|1>-\<lambda\><rsub|2>|)>
    </equation>
  </definition>

  <\theorem>
    <label|thm:fund_inv><with|font-series|bold|[Fundamental invertibility for
    oscillatory processes]> For <math|Z> as in Definition
    <reference|def:osc_proc>, the inversion formula

    <\equation>
      <label|eq:inv_identity>d*\<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|-i*\<lambda\>*t>*<space|0.17em>Z<around|(|t|)>*<space|0.17em>d*t
    </equation>

    holds if and only if <math|A<rsub|t>> satisfies the nondegeneracy
    condition <eqref|eq:nonzero> and the orthonormality condition
    <eqref|eq:delta_ortho>
  </theorem>

  <\proof>
    <\enumerate>
      <item><with|font-shape|italic|Forward direction.> From
      <eqref|eq:oscillatory_process>,

      <\equation>
        <label|eq:inv_proof_1>Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      Multiply by <math|A<rsub|t><around|(|\<lambda\><rsub|0>|)>*e<rsup|-i*\<lambda\><rsub|0>*t>>
      and integrate over <math|t>:

      <\equation>
        <label|eq:inv_proof_2><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\><rsub|0>|)>*e<rsup|-i*\<lambda\><rsub|0>*t>*Z<around|(|t|)>*<space|0.17em>d*t=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\><rsub|0>|)>*e<rsup|-i*\<lambda\><rsub|0>*t><around*|[|<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>|]>*d*t
      </equation>

      <item><with|font-shape|italic|Swap order of integration.>

      <\equation>
        <label|eq:inv_proof_3>=<big|int><rsub|\<bbb-R\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\><rsub|0>|)>*A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>*t>*d*t|]>*d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      <item><with|font-shape|italic|Apply orthonormality.> By
      <eqref|eq:delta_ortho>,

      <\equation>
        <label|eq:inv_proof_4>=<big|int><rsub|\<bbb-R\>>\<delta\>*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>=d*\<Phi\><around|(|\<lambda\><rsub|0>|)>
      </equation>

      <item><with|font-shape|italic|Backward direction.> Insert

      <\equation>
        <label|eq:inv_proof_5>Z<rsub|\<lambda\><rsub|0>><around|(|t|)>=A<rsub|t><around|(|\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>
      </equation>

      into <eqref|eq:inv_identity>:

      <\equation>
        <label|eq:inv_proof_6>d*\<Phi\><rsub|\<lambda\><rsub|0>><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>*A<rsub|t><around|(|\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>*d*t
      </equation>

      The left side equals <math|\<delta\>*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>>,
      hence <eqref|eq:delta_ortho> holds. Nondegeneracy follows from linear
      independence by evaluating at <math|<around|(|t,\<lambda\>|)>> where
      <math|Z<around|(|t|)>\<neq\>0>
    </enumerate>
  </proof>

  <\lemma>
    <label|lem:unique><with|font-series|bold|[Uniqueness of inversion]> If
    <math|\<cal-I\><rsub|1>*Z=d*\<Phi\><around|(|\<lambda\>|)>=\<cal-I\><rsub|2>*Z>
    for all <math|Z>, then <math|\<cal-I\><rsub|1>=\<cal-I\><rsub|2>>
  </lemma>

  <\proof>
    Let <math|\<cal-L\>=\<cal-I\><rsub|1>-\<cal-I\><rsub|2>>. Choose

    <\equation>
      <label|eq:unique_proof_1>Z<rsub|\<lambda\><rsub|0>><around|(|t|)>=A<rsub|t><around|(|\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>
    </equation>

    Then <math|<around|(|\<cal-L\>*Z<rsub|\<lambda\><rsub|0>>|)><around|(|\<lambda\>|)>>
    equals

    <\equation>
      <label|eq:unique_proof_2><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>*A<rsub|t><around|(|\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>*d*t-<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>*A<rsub|t><around|(|\<lambda\><rsub|0>|)>*e<rsup|i*\<lambda\><rsub|0>*t>*d*t=0
    </equation>

    Density of the span <math|<around|{|Z<rsub|\<lambda\><rsub|0>>|}>>
    implies <math|\<cal-L\>=0>
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
      <label|eq:theta_dot_positive><wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0
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
    By <eqref|eq:U_theta_def>,

    <\equation>
      <label|eq:unitarity_proof_1><big|int><rsub|K><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>|\|><rsup|2>*d*t=<big|int><rsub|K><wide|\<theta\>|\<dot\>><around|(|t|)><space|0.17em><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<space|0.17em>d*t
    </equation>

    With the change of variables <math|s=\<theta\><around|(|t|)>> and
    <math|d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t>, the domain maps to
    <math|\<theta\><around|(|K|)>>, giving <eqref|eq:local_isometry>. The
    two-sided inverse identities follow from direct substitution into
    <eqref|eq:U_theta_def> and <eqref|eq:U_theta_inverse>
  </proof>

  <subsection|Filter Representations for Unitarily Time-Changed Stationary
  Processes>

  <\theorem>
    <label|thm:inverse_filter><with|font-series|bold|[Forward and inverse
    filter representations for unitarily time-changed stationary processes]>
    Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective with
    <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0> a.e. Let
    <math|X<around|(|u|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>>
    be a realization of a stationary process, and set

    <\equation>
      <label|eq:Z_transformation>Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>
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
        <label|eq:filter_identity>X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>g*<around|(|t,s|)>*<space|0.17em>Z<around|(|s|)>*<space|0.17em>d*s=<frac|Z<around|(|\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>
      </equation>
    </enumerate>
  </theorem>

  <\proof>
    <\enumerate>
      <item>Using the sifting property of the Dirac delta in
      <eqref|eq:forward_kernel> gives <eqref|eq:Z_transformation>

      <item>Applying <eqref|eq:inverse_kernel>, then substituting
      <eqref|eq:Z_transformation> at <math|s=\<theta\><rsup|-1><around|(|t|)>>
      and using

      <\equation>
        <label|eq:theta_inverse_id>\<theta\>\<circ\>\<theta\><rsup|-1>=<math-up|id>
      </equation>

      yields <eqref|eq:filter_identity>

      <item>The identity follows from items (1) and (2)
    </enumerate>
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
      <label|UTCovar>

      <\aligned>
        <tformat|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><space|-0.17em><around*|[|Z<around|(|t|)><space|0.17em><wide|Z<around|(|s|)>|\<bar\>>|]>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>\<bbb-E\><space|-0.17em><around*|[|X<around|(|\<theta\><around|(|t|)>|)><space|0.17em><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>R<rsub|X>*<space|-0.17em><around*|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>
      </aligned>
    </equation>
  </theorem>

  <\proof>
    From the Cramér representation <eqref|eq:cramer_representation>,

    <\equation>
      <label|eq:osc_proof_1>X<around|(|\<theta\><around|(|t|)>|)>=<big|int>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    Therefore

    <\equation>
      <label|eq:osc_proof_2>Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><around*|(|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>|)>*d*\<Phi\><around|(|\<lambda\>|)>=<big|int>\<varphi\><rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    which is of the oscillatory form with <math|\<varphi\><rsub|t>> as in
    <eqref|eq:oscillatory_function_Z> and <math|A<rsub|t>> as in
    <eqref|eq:gain_function_Z>. The covariance follows from stationarity via
    <eqref|eq:stationary_covariance>
  </proof>

  <\corollary>
    <label|cor:epsd_timechange><with|font-series|bold|[Evolutionary power
    spectral density of unitarily time-changed stationary process]> If the
    stationary spectral measure has density <math|S<around|(|\<lambda\>|)>>,
    i.e. <math|d*F<around|(|\<lambda\>|)>=S<around|(|\<lambda\>|)>*d*\<lambda\>>,
    then the evolutionary power spectral density of
    <math|Z<around|(|t|)>=U<rsub|\<theta\>>*X<around|(|t|)>> is

    <\equation>
      <label|eq:epsd_timechange>S<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>S<around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>S<around|(|\<lambda\>|)>
    </equation>

    and therefore

    <\equation>
      <label|eq:epsd_measure>d*F<rsub|t><around|(|\<lambda\>|)>=S<rsub|t><around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>=<wide|\<theta\>|\<dot\>><around|(|t|)>*<space|0.17em>d*F<around|(|\<lambda\>|)>
    </equation>
  </corollary>

  <\proof>
    Since

    <\equation>
      <label|eq:epsd_proof_1><around|\||e<rsup|i*\<alpha\>>|\|>=1
    </equation>

    we have

    <\equation>
      <label|eq:epsd_proof_2><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>=<wide|\<theta\>|\<dot\>><around|(|t|)>
    </equation>

    giving <eqref|eq:epsd_timechange>
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

    <\equation>
      <label|eq:conj_proof_1><around*|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em><around|(|T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|\<theta\><around|(|t|)>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-s|\|>|)><frac|f<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>*<space|0.17em>d*s
    </equation>

    With <math|s=\<theta\><around|(|u|)>>,
    <math|d*s=<wide|\<theta\>|\<dot\>><around|(|u|)>*<space|0.17em>d*u>,
    obtain

    <\equation>
      <label|eq:conj_proof_2><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)><space|0.17em><sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>*<space|0.17em>f<around|(|u|)>*<space|0.17em>d*u=<big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|u,t|)>*<space|0.17em>f<around|(|u|)>*<space|0.17em>d*u=<around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>
    </equation>
  </proof>

  <section|Zero Localization><label|sec:HP>

  <\theorem>
    <label|thm:bulinskaya><with|font-series|bold|[Bulinskaya's theorem:
    simplicity of zeros]> Let <math|X<around|(|t|)>> be a real-valued,
    zero-mean stationary Gaussian process with covariance function
    <math|R<around|(|h|)>=\<bbb-E\>*<around|[|X<around|(|t|)>*X*<around|(|t+h|)>|]>>.
    Suppose <math|R<around|(|h|)>> is twice continuously differentiable in a
    neighborhood of <math|h=0> with <math|R<rprime|''><around|(|0|)>\<less\>0>.
    Then almost surely all zeros of <math|X<around|(|t|)>> are simple,
    meaning

    <\equation>
      <label|eq:simple_zeros_guaranteed>X<around|(|t<rsub|0>|)>=0<space|0.27em>\<Rightarrow\><space|0.27em><wide|X|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0<space|1em><text|almost
      surely>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item><with|font-shape|italic|Differentiability of sample paths.> The
      twice continuous differentiability of <math|R<around|(|h|)>> at
      <math|h=0> ensures that <math|X<around|(|t|)>> has mean-square
      continuous first derivative <math|<wide|X|\<dot\>><around|(|t|)>>, and
      the joint process <math|<around|(|X<around|(|t|)>,<wide|X|\<dot\>><around|(|t|)>|)>>
      is a Gaussian vector for each <math|t>.

      <item><with|font-shape|italic|Covariance structure at zeros.> At any
      <math|t<rsub|0>>, the random vector
      <math|<around|(|X<around|(|t<rsub|0>|)>,<wide|X|\<dot\>><around|(|t<rsub|0>|)>|)>>
      has covariance matrix

      <\equation>
        <label|eq:bul_cov_matrix>\<Sigma\>=<matrix|<tformat|<table|<row|<cell|R<around|(|0|)>>|<cell|0>>|<row|<cell|0>|<cell|-R<rprime|''><around|(|0|)>>>>>>
      </equation>

      The off-diagonal entries vanish because

      <\equation>
        <label|eq:bul_cov_offdiag>\<bbb-E\>*<around|[|X<around|(|t<rsub|0>|)>*<wide|X|\<dot\>><around|(|t<rsub|0>|)>|]>=lim<rsub|h\<to\>0>
        <frac|\<bbb-E\>*<around|[|X<around|(|t<rsub|0>|)>*<around|(|X*<around|(|t<rsub|0>+h|)>-X<around|(|t<rsub|0>|)>|)>|]>|h>=lim<rsub|h\<to\>0>
        <frac|R<around|(|h|)>-R<around|(|0|)>|h>=R<rprime|'><around|(|0|)>=0
      </equation>

      by stationarity (which forces <math|R<rprime|'><around|(|0|)>=0>).

      <item><with|font-shape|italic|Independence at zeros.> Since
      <math|<around|(|X<around|(|t<rsub|0>|)>,<wide|X|\<dot\>><around|(|t<rsub|0>|)>|)>>
      is jointly Gaussian with zero correlation,
      <math|X<around|(|t<rsub|0>|)>> and <math|<wide|X|\<dot\>><around|(|t<rsub|0>|)>>
      are independent random variables.

      <item><with|font-shape|italic|Probability of double zero.> For any
      fixed <math|t<rsub|0>>, the event <math|<around|{|X<around|(|t<rsub|0>|)>=0|}>>
      has probability zero (since <math|X<around|(|t<rsub|0>|)>> is a
      continuous Gaussian random variable). Moreover, the event
      <math|<around|{|X<around|(|t<rsub|0>|)>=0*<text|and
      ><wide|X|\<dot\>><around|(|t<rsub|0>|)>=0|}>> is the intersection of
      two independent zero-probability events, hence also has probability
      zero.

      <item><with|font-shape|italic|Countable union argument.> Consider any
      interval <math|<around|[|a,b|]>>. By continuity of
      <math|X<around|(|t|)>>, the zero set
      <math|\<cal-Z\>=<around|{|t\<in\><around|[|a,b|]>:X<around|(|t|)>=0|}>>
      is closed. The Gaussian process theory (specifically the
      Bulinskaya-Belyaev results) shows that under the condition
      <math|R<rprime|''><around|(|0|)>\<less\>0>, the expected number of
      zeros in <math|<around|[|a,b|]>> is finite:

      <\equation>
        <label|eq:expected_zeros>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<frac|<around|(|b-a|)>|\<pi\>>*<sqrt|-<frac|R<rprime|''><around|(|0|)>|R<around|(|0|)>>>\<less\>\<infty\>
      </equation>

      This implies that almost surely <math|\<cal-Z\>> is discrete (has no
      accumulation points in <math|<around|[|a,b|]>>), hence is at most
      countable.

      <item><with|font-shape|italic|Conclusion.> For each zero
      <math|t<rsub|n>\<in\>\<cal-Z\>>, the probability that
      <math|<wide|X|\<dot\>><around|(|t<rsub|n>|)>=0> given
      <math|X<around|(|t<rsub|n>|)>=0> is zero by independence from item (3).
      Taking a countable union over all zeros in <math|\<cal-Z\>>,

      <\equation>
        <label|eq:bul_conclusion>\<bbb-P\><around*|(|\<exists\><space|0.17em>t<rsub|n>\<in\>\<cal-Z\>:<wide|X|\<dot\>><around|(|t<rsub|n>|)>=0|)>=0
      </equation>

      Thus almost surely every zero is simple
    </enumerate>
  </proof>

  <\corollary>
    <label|cor:oscillatory_simple_zeros>Let
    <math|Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>>
    be the unitarily time-changed stationary Gaussian process constructed in
    Theorem <reference|thm:Utheta_to_osc>, where <math|X> has twice
    continuously differentiable covariance with
    <math|R<rprime|''><rsub|X><around|(|0|)>\<less\>0>. Then almost surely
    all zeros of <math|Z<around|(|t|)>> are simple
  </corollary>

  <\proof>
    The covariance of <math|Z> is

    <\equation>
      <label|eq:cor_Z_cov>R<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
    </equation>

    At <math|t=s>,

    <\equation>
      <label|eq:cor_Z_var>R<rsub|Z><around|(|t,t|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*R<rsub|X><around|(|0|)>
    </equation>

    Computing the second derivative at a zero <math|t<rsub|0>> (where
    <math|Z<around|(|t<rsub|0>|)>=0> implies
    <math|X<around|(|\<theta\><around|(|t<rsub|0>|)>|)>=0> since
    <math|<wide|\<theta\>|\<dot\>>\<gtr\>0>), one verifies that the local
    covariance structure inherits the negative second derivative property
    from <math|R<rsub|X>>, thus Bulinskaya's theorem applies to the
    transformed process
  </proof>

  <\definition>
    <label|def:zeromeasure><with|font-series|bold|[Zero localization
    measure]> Let <math|Z> be a real-valued oscillatory process satisfying
    the hypotheses of Corollary <reference|cor:oscillatory_simple_zeros>, so
    that almost surely all zeros are simple. Define, for Borel
    <math|B\<subset\>\<bbb-R\>>,

    <\equation>
      <label|eq:mu_def>\<mu\><around|(|B|)>\<assign\><big|int><rsub|B>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t
    </equation>

    so that <math|\<mu\>> places unit mass at each simple zero of <math|Z>
    counted by the co-area/change-of-variables identity for <math|C<rsup|1>>
    functions. The induced space <math|L<rsup|2><around|(|\<mu\>|)>> consists
    of (equivalence classes of) functions supported on the zero set of
    <math|Z>, and the multiplication operator

    <\equation>
      <label|eq:mult_op><around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>
    </equation>

    is essentially self-adjoint with pure point spectrum equal to the
    zero-crossing set
  </definition>

  <\thebibliography|9>
    <bibitem|stationaryAndRelatedStochasticProcesses>Harald Cramér and
    M.R.<nbsp>Leadbetter. <newblock><with|font-shape|italic|Stationary and
    Related Processes: Sample Function Properties and Their Applications>.
    <newblock>Wiley Series in Probability and Mathematical Statistics, 1967.

    <bibitem|evolutionarySpectraAndNonStationaryProcesses>Maurice<nbsp>B
    Priestley. <newblock>Evolutionary spectra and non-stationary processes.
    <newblock><with|font-shape|italic|Journal of the Royal Statistical
    Society: Series B (Methodological)>, 27(2):204\U229, 1965.

    <bibitem|priestley1981>Maurice<nbsp>B Priestley.
    <newblock><with|font-shape|italic|Spectral Analysis and Time Series>.
    <newblock>Academic Press, 1981.

    <bibitem|bulinskaya>Bulinskaya, E. V. <newblock>On the mean number of
    crossings of a level by a stationary Gaussian process.
    <newblock><with|font-shape|italic|Theory of Probability and Its
    Applications>, 1961.
  </thebibliography>
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
    <associate|UTCovar|<tuple|62|12>>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|2.3|12>>
    <associate|auto-11|<tuple|2.4|13>>
    <associate|auto-12|<tuple|3|14>>
    <associate|auto-13|<tuple|83|16>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1.2.1|3>>
    <associate|auto-5|<tuple|1.3|4>>
    <associate|auto-6|<tuple|1.4|7>>
    <associate|auto-7|<tuple|2|10>>
    <associate|auto-8|<tuple|2.1|10>>
    <associate|auto-9|<tuple|2.2|11>>
    <associate|bib-bulinskaya|<tuple|bulinskaya|16>>
    <associate|bib-evolutionarySpectraAndNonStationaryProcesses|<tuple|evolutionarySpectraAndNonStationaryProcesses|16>>
    <associate|bib-priestley1981|<tuple|priestley1981|16>>
    <associate|bib-stationaryAndRelatedStochasticProcesses|<tuple|stationaryAndRelatedStochasticProcesses|16>>
    <associate|cor:epsd_timechange|<tuple|20|13>>
    <associate|cor:oscillatory_simple_zeros|<tuple|23|15>>
    <associate|def:L2loc|<tuple|3|3>>
    <associate|def:amplitude_nondeg|<tuple|13|8>>
    <associate|def:cramer|<tuple|2|2>>
    <associate|def:epsd|<tuple|7|4>>
    <associate|def:filter_gain|<tuple|11|7>>
    <associate|def:gaussian_process|<tuple|1|2>>
    <associate|def:orthonormality|<tuple|14|8>>
    <associate|def:osc_proc|<tuple|6|4>>
    <associate|def:variance_evolutionary|<tuple|8|5>>
    <associate|def:zeromeasure|<tuple|24|15>>
    <associate|eq:K_def|<tuple|70|13>>
    <associate|eq:K_theta_def|<tuple|71|13>>
    <associate|eq:L2_isometry_extension|<tuple|29|7>>
    <associate|eq:L2_limit_def|<tuple|28|7>>
    <associate|eq:L2loc_def|<tuple|4|3>>
    <associate|eq:T_K_def|<tuple|69|13>>
    <associate|eq:U_theta_def|<tuple|50|10>>
    <associate|eq:U_theta_inverse|<tuple|51|10>>
    <associate|eq:Yab_def|<tuple|6|3>>
    <associate|eq:Z_def|<tuple|59|12>>
    <associate|eq:Z_transformation|<tuple|54|11>>
    <associate|eq:bul_conclusion|<tuple|79|15>>
    <associate|eq:bul_cov_matrix|<tuple|76|14>>
    <associate|eq:bul_cov_offdiag|<tuple|77|14>>
    <associate|eq:cauchy_sequence|<tuple|27|6>>
    <associate|eq:compact_bound|<tuple|10|3>>
    <associate|eq:conj_proof_1|<tuple|73|13>>
    <associate|eq:conj_proof_2|<tuple|74|14>>
    <associate|eq:conjugation|<tuple|72|13>>
    <associate|eq:cor_Z_cov|<tuple|80|15>>
    <associate|eq:cor_Z_var|<tuple|81|15>>
    <associate|eq:covariance_kernel|<tuple|1|2>>
    <associate|eq:cramer_representation|<tuple|2|2>>
    <associate|eq:delta_ortho|<tuple|39|8>>
    <associate|eq:epsd_definition|<tuple|16|4>>
    <associate|eq:epsd_measure|<tuple|66|13>>
    <associate|eq:epsd_proof_1|<tuple|67|13>>
    <associate|eq:epsd_proof_2|<tuple|68|13>>
    <associate|eq:epsd_timechange|<tuple|65|13>>
    <associate|eq:expectation_Yab|<tuple|8|3>>
    <associate|eq:expected_zeros|<tuple|78|14>>
    <associate|eq:filter_from_gain|<tuple|32|7>>
    <associate|eq:filter_identity|<tuple|57|11>>
    <associate|eq:filter_square_int|<tuple|33|7>>
    <associate|eq:finite_variance|<tuple|5|3>>
    <associate|eq:forward_kernel|<tuple|55|11>>
    <associate|eq:gain_L2|<tuple|11|4>>
    <associate|eq:gain_from_filter|<tuple|31|7>>
    <associate|eq:gain_function_Z|<tuple|61|12>>
    <associate|eq:gain_symmetry|<tuple|18|5>>
    <associate|eq:general_forward_filter|<tuple|34|8>>
    <associate|eq:integral_simple|<tuple|25|6>>
    <associate|eq:inv_identity|<tuple|40|9>>
    <associate|eq:inv_proof_1|<tuple|41|9>>
    <associate|eq:inv_proof_2|<tuple|42|9>>
    <associate|eq:inv_proof_3|<tuple|43|9>>
    <associate|eq:inv_proof_4|<tuple|44|9>>
    <associate|eq:inv_proof_5|<tuple|45|9>>
    <associate|eq:inv_proof_6|<tuple|46|9>>
    <associate|eq:inverse_kernel|<tuple|56|11>>
    <associate|eq:isometry_simple|<tuple|26|6>>
    <associate|eq:local_isometry|<tuple|52|10>>
    <associate|eq:markov_inequality|<tuple|9|3>>
    <associate|eq:mu_def|<tuple|82|15>>
    <associate|eq:mult_op|<tuple|83|15>>
    <associate|eq:nonzero|<tuple|38|8>>
    <associate|eq:orthogonality_phi|<tuple|14|4>>
    <associate|eq:osc_proof_1|<tuple|63|12>>
    <associate|eq:osc_proof_2|<tuple|64|12>>
    <associate|eq:osc_symmetry|<tuple|19|5>>
    <associate|eq:oscillatory_covariance|<tuple|15|4>>
    <associate|eq:oscillatory_function|<tuple|12|4>>
    <associate|eq:oscillatory_function_Z|<tuple|60|12>>
    <associate|eq:oscillatory_process|<tuple|13|4>>
    <associate|eq:oscillatory_well_defined|<tuple|23|6>>
    <associate|eq:real_proof_1|<tuple|20|5>>
    <associate|eq:real_proof_2|<tuple|21|5>>
    <associate|eq:simple_function|<tuple|24|6>>
    <associate|eq:simple_zeros_guaranteed|<tuple|75|14>>
    <associate|eq:spectral_whitenoise|<tuple|37|8>>
    <associate|eq:stationary_covariance|<tuple|3|2>>
    <associate|eq:theta_dot_positive|<tuple|49|10>>
    <associate|eq:theta_inverse_id|<tuple|58|11>>
    <associate|eq:time_dependent_spectrum|<tuple|22|6>>
    <associate|eq:tonelli_application|<tuple|7|3>>
    <associate|eq:unique_proof_1|<tuple|47|10>>
    <associate|eq:unique_proof_2|<tuple|48|10>>
    <associate|eq:unitarity_proof_1|<tuple|53|11>>
    <associate|eq:variance_epsd|<tuple|17|5>>
    <associate|eq:varphi_L2|<tuple|30|7>>
    <associate|eq:whitenoise_filter|<tuple|36|8>>
    <associate|eq:whitenoise_orthog|<tuple|35|8>>
    <associate|lem:unique|<tuple|16|10>>
    <associate|prop:conjugation|<tuple|21|13>>
    <associate|rem:L2loc_properties|<tuple|4|3>>
    <associate|sec:HP|<tuple|3|14>>
    <associate|sec:oscillatory|<tuple|1.3|4>>
    <associate|sec:stationary_timechange|<tuple|2|10>>
    <associate|thm:Utheta_to_osc|<tuple|19|12>>
    <associate|thm:bulinskaya|<tuple|22|14>>
    <associate|thm:existence_osc|<tuple|10|6>>
    <associate|thm:fund_inv|<tuple|15|9>>
    <associate|thm:general_filter|<tuple|12|8>>
    <associate|thm:inverse_filter|<tuple|18|11>>
    <associate|thm:local_unitarity|<tuple|17|10>>
    <associate|thm:paths_loc|<tuple|5|3>>
    <associate|thm:realvaluedness|<tuple|9|5>>
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

      <with|par-left|<quote|1tab>|1.2<space|2spc>Stationary processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Sample path realizations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>(Non-Stationary)
      Oscillatory Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Filter Representations and
      Invertibility for Oscillatory Processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Unitarily
      Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Unitary time-change operator
      <with|mode|<quote|math>|U<rsub|\<theta\>>*f>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Filter Representations for
      Unitarily Time-Changed Stationary Processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Transformation of stationary
      to oscillatory processes via <with|mode|<quote|math>|U<rsub|\<theta\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Covariance operator
      conjugation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Zero
      Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>