<TeXmacs|2.1.4>

<style|<tuple|article|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Processes Yield
  Oscillatory Processes<next-line>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|September 16, 2025>>

  <\abstract>
    A unitary time-change operator <math|U<rsub|\<theta\>>> is constructed
    for absolutely continuous, strictly increasing time reparametrizations
    <math|\<theta\>>, acting on functions that are square-integrable over
    compact sets. Applying <math|U<rsub|\<theta\>>> to the Cram�r spectral
    representation of a stationary process yields an oscillatory process in
    the sense of Priestley with oscillatory function
    <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>
    and evolutionary spectrum <math|d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*F<around|(|\<lambda\>|)>>.
    It is proved that sample paths of any non-degenerate second-order
    stationary process lie in <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>,
    making the operator applicable to typical realizations. A
    zero-localization measure <math|d*\<mu\><around|(|t|)>=\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t>
    induces a Hilbert space <math|L<rsup|2><around|(|\<mu\>|)>> on the zero
    set of an oscillatory process <math|Z>, and the multiplication operator
    <math|<around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>> has simple pure
    point spectrum equal to the zero crossing set of <math|Z>.
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
    <with|mode|math|U<rsub|\<theta\>>*f> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|2.2<space|2spc>Inverse Filter for Unitary Time
    Transformations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|2.3<space|2spc>Transformation of Stationary
    <with|mode|math|\<to\>> Oscillatory Processes via
    <with|mode|math|U<rsub|\<theta\>>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|2.4<space|2spc>Covariance operator conjugation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Zero
    Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>The Kac-Rice Formula For The Expected
    Zero Counting Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>
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
    determined in law by <math|m> and <math|K>.
  </definition>

  <\definition>
    <label|def:canonical_metric>The canonical metric associated with a
    Gaussian process is

    <\equation>
      d*<around|(|s,t|)>=<sqrt|\<bbb-E\><around|[|<around|(|X<rsub|s>-X<rsub|t>|)><rsup|2>|]>>=<sqrt|K<around|(|s,s|)>+K<around|(|t,t|)>-2*K<around|(|s,t|)>>
    </equation>
  </definition>

  <subsection|Sample Path Realizations>

  <\definition>
    <label|def:L2loc><with|font-series|bold|[Locally square-integrable
    functions]> Define

    <\equation>
      L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>\<assign\><around*|{|f:\<bbb-R\>\<to\>\<bbb-C\>:<big|int><rsub|K><around|\||f<around|(|t|)>|\|><rsup|2>*d*t\<less\>\<infty\>*<text|for
      every compact >K\<subseteq\>\<bbb-R\>|}>
    </equation>
  </definition>

  <\remark>
    <label|rem:L2loc_properties>Every bounded measurable set in
    <math|\<bbb-R\>> is compact or contained in a compact set; hence
    <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>> contains functions that
    are square-integrable on every bounded interval, including functions with
    polynomial growth at infinity.
  </remark>

  <\theorem>
    <label|thm:paths_loc><with|font-series|bold|[Sample paths in
    <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>]> Let
    <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> be a
    second-order stationary process with

    <\equation>
      <label|eq:finite_variance>\<sigma\><rsup|2>\<assign\>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>\<less\>\<infty\>
    </equation>

    Then almost every sample path lies in
    <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>. However, for
    non-degenerate processes with <math|\<sigma\><rsup|2>\<gtr\>0>, sample
    paths are not globally square-integrable.
  </theorem>

  <\proof>
    Fix an arbitrary bounded interval <math|<around|[|a,b|]>\<subset\>\<bbb-R\>>
    with <math|a\<less\>b>. Define the random variable

    <\equation>
      <label|eq:Yab_def>Y<rsub|<around|[|a,b|]>>\<assign\><big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*d*t
    </equation>

    <\enumerate>
      <item>By Tonelli's theorem, since <math|X<around|(|t|)><rsup|2>\<geq\>0>,

      <\equation>
        <label|eq:tonelli_application>\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=\<bbb-E\><around*|[|<big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*d*t|]>=<big|int><rsub|a><rsup|b>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>*d*t
      </equation>

      <item>By stationarity of <math|X>, <math|\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>=\<sigma\><rsup|2>>
      for all <math|t\<in\>\<bbb-R\>>. Therefore

      <\equation>
        <label|eq:expectation_Yab>\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b>\<sigma\><rsup|2>*d*t=\<sigma\><rsup|2>*<around|(|b-a|)>
      </equation>

      <item>Since <math|b-a\<less\>\<infty\>> and
      <math|\<sigma\><rsup|2>\<less\>\<infty\>> by assumption
      <eqref|eq:finite_variance>,

      <\equation>
        <label|eq:Yab_finite_expectation>\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>\<less\>\<infty\>
      </equation>

      <item>By Markov's inequality, for any <math|M\<gtr\>0>,

      <\equation>
        <label|eq:markov_inequality>\<bbb-P\>*<around|(|Y<rsub|<around|[|a,b|]>>\<gtr\>M|)>\<leq\><frac|\<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>|M>=<frac|\<sigma\><rsup|2>*<around|(|b-a|)>|M>
      </equation>

      <item>Taking <math|M\<to\>\<infty\>> in <eqref|eq:markov_inequality>,

      <\equation>
        <label|eq:Yab_finite_probability>\<bbb-P\>*<around|(|Y<rsub|<around|[|a,b|]>>\<less\>\<infty\>|)>=1
      </equation>

      <item>Now let <math|K\<subset\>\<bbb-R\>> be an arbitrary compact set.
      Since <math|K> is compact in <math|\<bbb-R\>>, it is closed and
      bounded. Therefore there exists <math|N\<gtr\>0> such that

      <\equation>
        <label|eq:compact_bounded>K\<subseteq\><around|[|-N,N|]>
      </equation>

      <item>By <eqref|eq:Yab_finite_probability> applied to
      <math|<around|[|a,b|]>=<around|[|-N,N|]>>,

      <\equation>
        <label|eq:interval_N_finite>\<bbb-P\>*<around*|(|<big|int><rsub|-N><rsup|N>X<around|(|t|)><rsup|2>*d*t\<less\>\<infty\>|)>=1
      </equation>

      <item>Since <math|K\<subseteq\><around|[|-N,N|]>> by
      <eqref|eq:compact_bounded>,

      <\equation>
        <label|eq:K_integral_bound><big|int><rsub|K>X<around|(|t|)><rsup|2>*d*t\<leq\><big|int><rsub|-N><rsup|N>X<around|(|t|)><rsup|2>*d*t
      </equation>

      <item>Combining <eqref|eq:interval_N_finite> and
      <eqref|eq:K_integral_bound>,

      <\equation>
        <label|eq:K_finite>\<bbb-P\>*<around*|(|<big|int><rsub|K>X<around|(|t|)><rsup|2>*d*t\<less\>\<infty\>|)>=1
      </equation>

      <item>Since <math|K> was arbitrary, <eqref|eq:K_finite> holds for every
      compact set <math|K\<subset\>\<bbb-R\>>. Therefore, almost every sample
      path <math|t\<mapsto\>X<around|(|t,\<omega\>|)>> satisfies

      <\equation>
        <label|eq:sample_path_L2loc><big|int><rsub|K><around|\||X<around|(|t,\<omega\>|)>|\|><rsup|2>*d*t\<less\>\<infty\><space|1em>\<forall\><text|compact
        >K\<subset\>\<bbb-R\>
      </equation>

      which means almost every sample path lies in
      <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.

      <item>For the global divergence statement, assume
      <math|\<sigma\><rsup|2>\<gtr\>0>. For each <math|n\<in\>\<bbb-N\>>, by
      <eqref|eq:expectation_Yab>,

      <\equation>
        <label|eq:expectation_growth>\<bbb-E\><around*|[|<big|int><rsub|-n><rsup|n>X<around|(|t|)><rsup|2>*d*t|]>=2*n*\<sigma\><rsup|2>
      </equation>

      <item>As <math|n\<to\>\<infty\>>, the right side of
      <eqref|eq:expectation_growth> diverges:

      <\equation>
        <label|eq:expectation_divergence>lim<rsub|n\<to\>\<infty\>>
        \<bbb-E\><around*|[|<big|int><rsub|-n><rsup|n>X<around|(|t|)><rsup|2>*d*t|]>=lim<rsub|n\<to\>\<infty\>>
        2*n*\<sigma\><rsup|2>=\<infty\>
      </equation>

      <item>By monotone convergence theorem, since
      <math|<big|int><rsub|-n><rsup|n>X<around|(|t|)><rsup|2>*d*t> increases
      monotonically with <math|n>,

      <\equation>
        <label|eq:MCT_application>\<bbb-E\><around*|[|lim<rsub|n\<to\>\<infty\>>
        <big|int><rsub|-n><rsup|n>X<around|(|t|)><rsup|2>*d*t|]>=lim<rsub|n\<to\>\<infty\>>
        \<bbb-E\><around*|[|<big|int><rsub|-n><rsup|n>X<around|(|t|)><rsup|2>*d*t|]>=\<infty\>
      </equation>

      <item>Therefore

      <\equation>
        <label|eq:global_divergence>\<bbb-P\>*<around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>X<around|(|t|)><rsup|2>*d*t=\<infty\>|)>=1
      </equation>

      <item>Thus sample paths are not in <math|L<rsup|2><around|(|\<bbb-R\>|)>>,
      only in <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
    </enumerate>
  </proof>

  <subsection|Stationary processes>

  <\definition>
    <label|def:cramer><with|font-series|bold|[Cram�r representation]> A
    zero-mean stationary process <math|X> with spectral measure <math|F>
    admits the sample path representation

    <\equation>
      <label|eq:cramer_representation>X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    which has covariance

    <\equation>
      <label|eq:stationary_covariance>R<rsub|X>*<around|(|t-s|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <subsection|Oscillatory Processes><label|sec:oscillatory>

  <\definition>
    <label|def:osc_proc><with|font-series|bold|[Oscillatory process]> Let
    <math|F> be a finite nonnegative Borel measure on <math|\<bbb-R\>>. Let

    <\equation>
      <label|eq:gain_L2>A<rsub|t>\<in\>L<rsup|2><around|(|F|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    be the gain function and

    <\equation>
      <label|eq:oscillatory_function>\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    be the corresponding oscillatory function then an oscillatory process is
    a stochastic process which can be represented as

    <\equation>
      <label|eq:oscillatory_process>Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure with spectral
    measure <math|F> which satisfies the relation

    <\equation>
      <label|eq:orthogonality_phi>d*\<bbb-E\><around|[|\<Phi\><around|(|\<lambda\>|)><wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*d*F<around|(|\<lambda\>|)>
    </equation>

    and has the corresponding covariance kernel

    <\equation>
      <label|eq:oscillatory_covariance>R<rsub|Z><around|(|t,s|)>=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>>d*F<around|(|\<lambda\>|)>
    </equation>
  </definition>

  <\theorem>
    <label|thm:realvaluedness><with|font-series|bold|[Real-valuedness
    criterion for oscillatory processes]> Let <math|Z> be an oscillatory
    process with oscillatory function

    <\equation>
      <label|eq:osc_func_def>\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    and spectral measure <math|F>. Then <math|Z> is real-valued if and only
    if

    <\equation>
      <label|eq:gain_symmetry>A<rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    for <math|F>-almost every <math|\<lambda\>\<in\>\<bbb-R\>>, equivalently

    <\equation>
      <label|eq:osc_symmetry>\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    for <math|F>-almost every <math|\<lambda\>\<in\>\<bbb-R\>>.
  </theorem>

  <\proof>
    <\enumerate>
      <item>Assume <math|Z> is real-valued. Then for all
      <math|t\<in\>\<bbb-R\>>,

      <\equation>
        <label|eq:real_valued_condition>Z<around|(|t|)>=<wide|Z<around|(|t|)>|\<bar\>>
      </equation>

      <item>From the oscillatory representation
      <eqref|eq:oscillatory_process>,

      <\equation>
        <label|eq:Z_representation>Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      <item>Taking the complex conjugate of both sides of
      <eqref|eq:Z_representation>,

      <\equation>
        <label|eq:Z_conjugate><wide|Z<around|(|t|)>|\<bar\>>=<wide|<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>|\<bar\>>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>*d<wide|\<Phi\><around|(|\<lambda\>|)>|\<bar\>>
      </equation>

      <item>For a real-valued process, the orthogonal random measure must
      satisfy the symmetry property

      <\equation>
        <label|eq:phi_symmetry>d<wide|\<Phi\><around|(|\<lambda\>|)>|\<bar\>>=-d*\<Phi\>*<around|(|-\<lambda\>|)>
      </equation>

      <item>Substituting <eqref|eq:phi_symmetry> into <eqref|eq:Z_conjugate>,

      <\equation>
        <label|eq:Z_conjugate_substituted><wide|Z<around|(|t|)>|\<bar\>>=-<big|int><rsub|\<bbb-R\>><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>*d*\<Phi\>*<around|(|-\<lambda\>|)>
      </equation>

      <item>Apply the change of variables <math|\<mu\>=-\<lambda\>>, so
      <math|d*\<Phi\>*<around|(|-\<lambda\>|)>=-d*\<Phi\><around|(|\<mu\>|)>>
      and <math|e<rsup|-i*\<lambda\>*t>=e<rsup|i*\<mu\>*t>>:

      <\equation>
        <label|eq:change_of_variables><wide|Z<around|(|t|)>|\<bar\>>=-<big|int><rsub|\<bbb-R\>><wide|A<rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>e<rsup|i*\<mu\>*t>*<around|(|-d*\<Phi\><around|(|\<mu\>|)>|)>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>e<rsup|i*\<mu\>*t>*d*\<Phi\><around|(|\<mu\>|)>
      </equation>

      <item>By <eqref|eq:real_valued_condition>, the right sides of
      <eqref|eq:Z_representation> and <eqref|eq:change_of_variables> must be
      equal:

      <\equation>
        <label|eq:integrand_equality><big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<mu\>|)>*e<rsup|i*\<mu\>*t>*d*\<Phi\><around|(|\<mu\>|)>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>e<rsup|i*\<mu\>*t>*d*\<Phi\><around|(|\<mu\>|)>
      </equation>

      <item>Since the stochastic integral representation is unique in
      <math|L<rsup|2><around|(|F|)>>, the integrands must be equal
      <math|F>-almost everywhere:

      <\equation>
        <label|eq:gain_equality>A<rsub|t><around|(|\<lambda\>|)>=<wide|A<rsub|t>*<around|(|-\<lambda\>|)>|\<bar\>><space|1em><text|for
        >F*<text|-a.e. >\<lambda\>
      </equation>

      <item>This is equivalent to <eqref|eq:gain_symmetry>. From
      <eqref|eq:osc_func_def>,

      <\equation>
        <label|eq:osc_func_neg>\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=A<rsub|t>*<around|(|-\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>
      </equation>

      <item>Using <eqref|eq:gain_symmetry>,

      <\equation>
        <label|eq:osc_func_conjugate>\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>=<wide|A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>|\<bar\>>=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>
      </equation>

      establishing <eqref|eq:osc_symmetry>.

      <item>Conversely, assume <eqref|eq:gain_symmetry> holds. Reversing the
      steps from <eqref|eq:change_of_variables> to
      <eqref|eq:real_valued_condition> shows that
      <math|<wide|Z<around|(|t|)>|\<bar\>>=Z<around|(|t|)>> for all <math|t>,
      so <math|Z> is real-valued.
    </enumerate>
  </proof>

  <\theorem>
    <label|thm:existence_osc><with|font-series|bold|[Existence]> Let <math|F>
    be an absolutely continuous spectral measure and the gain function

    <\equation>
      <label|eq:gain_condition>A<rsub|t><around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    be measurable in both time and frequency then the time-dependent spectral
    density is defined by

    <\equation>
      <label|eq:time_dependent_spectrum>S<rsub|t><around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<infty\>=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*S<around|(|\<lambda\>|)>*d*\<lambda\>
    </equation>

    and there exists a complex orthogonal random measure <math|\<Phi\>> with
    spectral measure <math|F> such that for each sample path
    <math|\<omega\><rsub|0>\<in\>\<Omega\>>

    <\equation>
      <label|eq:oscillatory_well_defined>Z<around|(|t,\<omega\><rsub|0>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>,\<omega\><rsub|0>|)>
    </equation>

    is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>> and has
    covariance <math|R<rsub|Z>> as in <eqref|eq:oscillatory_covariance>.
  </theorem>

  <\proof>
    <\enumerate>
      <item>Define the space of simple functions on <math|\<bbb-R\>>: for
      disjoint Borel sets <math|<around|{|E<rsub|j>|}><rsub|j=1><rsup|n>>
      with <math|F<around|(|E<rsub|j>|)>\<less\>\<infty\>> and coefficients
      <math|<around|{|c<rsub|j>|}><rsub|j=1><rsup|n>\<subset\>\<bbb-C\>>,

      <\equation>
        <label|eq:simple_function>g<around|(|\<lambda\>|)>=<big|sum><rsub|j=1><rsup|n>c<rsub|j>*<with|math-font-family|bf|1><rsub|E<rsub|j>><around|(|\<lambda\>|)>
      </equation>

      <item>For simple functions, define the stochastic integral

      <\equation>
        <label|eq:integral_simple><big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>\<assign\><big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>
      </equation>

      <item>Compute the second moment:

      <\equation>
        <label|eq:second_moment_simple>\<bbb-E\><around*|[|<around*|\||<big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>|\|><rsup|2>|]>=\<bbb-E\><around*|[|<around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>|\|><rsup|2>|]>=\<bbb-E\><around*|[|<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>
      </equation>

      <item>By linearity of expectation,

      <\equation>
        <label|eq:linearity_expectation>\<bbb-E\><around*|[|<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>=<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>
      </equation>

      <item>By the orthogonality relation <eqref|eq:orthogonality_phi>, since
      <math|E<rsub|j>\<cap\>E<rsub|k>=\<emptyset\>> for <math|j\<neq\>k>,

      <\equation>
        <label|eq:orthogonality_application>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>=<choice|<tformat|<table|<row|<cell|F<around|(|E<rsub|j>|)>>|<cell|<text|if
        >j=k>>|<row|<cell|0>|<cell|<text|if >j\<neq\>k>>>>>
      </equation>

      <item>Substituting <eqref|eq:orthogonality_application> into
      <eqref|eq:linearity_expectation>,

      <\equation>
        <label|eq:isometry_simple><big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>=<big|sum><rsub|j=1><rsup|n><around|\||c<rsub|j>|\|><rsup|2>*F<around|(|E<rsub|j>|)>
      </equation>

      <item>The right side of <eqref|eq:isometry_simple> equals

      <\equation>
        <label|eq:L2_norm_simple><big|sum><rsub|j=1><rsup|n><around|\||c<rsub|j>|\|><rsup|2>*F<around|(|E<rsub|j>|)>=<big|int><rsub|\<bbb-R\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>
      </equation>

      <item>Therefore the isometry property holds for simple functions:

      <\equation>
        <label|eq:isometry_established>\<bbb-E\><around*|[|<around*|\||<big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>|\|><rsup|2>|]>=<big|int><rsub|\<bbb-R\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>
      </equation>

      <item>The space of simple functions is dense in
      <math|L<rsup|2><around|(|F|)>>. For any
      <math|h\<in\>L<rsup|2><around|(|F|)>> and <math|\<epsilon\>\<gtr\>0>,
      there exists a simple function <math|g> such that

      <\equation>
        <label|eq:density_simple><big|int><rsub|\<bbb-R\>><around|\||h<around|(|\<lambda\>|)>-g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<epsilon\>
      </equation>

      <item>By the isometry <eqref|eq:isometry_established> and completeness
      of <math|L<rsup|2><around|(|\<Omega\>|)>>, the integral extends
      uniquely by continuity to all <math|h\<in\>L<rsup|2><around|(|F|)>>.

      <item>Since <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>> by assumption
      <eqref|eq:gain_condition>, and <math|<around|\||e<rsup|i*\<lambda\>*t>|\|>=1>,

      <\equation>
        <label|eq:varphi_L2><big|int><rsub|\<bbb-R\>><around|\||\<varphi\><rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<infty\>
      </equation>

      so <math|\<varphi\><rsub|t>\<in\>L<rsup|2><around|(|F|)>>.

      <item>Therefore

      <\equation>
        <label|eq:Z_well_defined>Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>>.

      <item>To compute the covariance, use the sesquilinearity of the
      stochastic integral:

      <\equation>
        <label|eq:covariance_computation>R<rsub|Z><around|(|t,s|)>=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>*<wide|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|s><around|(|\<mu\>|)>*d*\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>
      </equation>

      <item>By Fubini's theorem for stochastic integrals,

      <\equation>
        <label|eq:fubini_stochastic>\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>*<wide|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|s><around|(|\<mu\>|)>*d*\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<mu\>|)>|\<bar\>>\<bbb-E\>*<around|[|d*\<Phi\><around|(|\<lambda\>|)><wide|d*\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>
      </equation>

      <item>Using the orthogonality relation <eqref|eq:orthogonality_phi>,

      <\equation>
        <label|eq:orthogonality_integral><big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<mu\>|)>|\<bar\>>\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*d*F<around|(|\<lambda\>|)>*d*F<around|(|\<mu\>|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>>d*F<around|(|\<lambda\>|)>
      </equation>

      <item>Substituting the definition <eqref|eq:oscillatory_function>,

      <\equation>
        <label|eq:covariance_final>R<rsub|Z><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*F<around|(|\<lambda\>|)>
      </equation>

      as claimed in <eqref|eq:oscillatory_covariance>.
    </enumerate>
  </proof>

  <section|Unitarily Time-Changed Stationary
  Processes><label|sec:stationary_timechange>

  <subsection|Unitary time-change operator <math|U<rsub|\<theta\>>*f>>

  <\theorem>
    <label|thm:local_unitarity><with|font-series|bold|[Unitary time-change
    and local unitarity]> Let the time-scaling function
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective, with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> almost everywhere
    and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    Lebesgue measure zero. For <math|f> measurable, define

    <\equation>
      <label|eq:U_theta_def><around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Its inverse is given by

    <\equation>
      <label|eq:U_theta_inverse><around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>

    For every compact set <math|K\<subseteq\>\<bbb-R\>> and
    <math|f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>,

    <\equation>
      <label|eq:local_isometry><big|int><rsub|K><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2>d*t=<big|int><rsub|\<theta\><around|(|K|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*d*s
    </equation>

    Moreover, <math|U<rsub|\<theta\>><rsup|-1>> is the inverse of
    <math|U<rsub|\<theta\>>> on <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    <\enumerate>
      <item>Let <math|f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>> and
      let <math|K\<subset\>\<bbb-R\>> be compact. From the definition
      <eqref|eq:U_theta_def>,

      <\equation>
        <label|eq:Utheta_norm_start><big|int><rsub|K><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>|\|><rsup|2>*d*t=<big|int><rsub|K><around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*d*t
      </equation>

      <item>Expanding the square,

      <\equation>
        <label|eq:expand_square><big|int><rsub|K><around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*d*t=<big|int><rsub|K><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*d*t
      </equation>

      <item>Since <math|\<theta\>> is absolutely continuous and strictly
      increasing, <math|\<theta\><rprime|'>=<wide|\<theta\>|\<dot\>>> exists
      almost everywhere and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0>
      a.e.

      <item>Apply the change of variables <math|s=\<theta\><around|(|t|)>>.
      Then

      <\equation>
        <label|eq:change_var_differential>d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t
      </equation>

      <item>The inverse function <math|t=\<theta\><rsup|-1><around|(|s|)>>
      exists since <math|\<theta\>> is strictly increasing and bijective.

      <item>As <math|t> ranges over <math|K>, the variable
      <math|s=\<theta\><around|(|t|)>> ranges over
      <math|\<theta\><around|(|K|)>>.

      <item>Since <math|\<theta\>> is continuous and <math|K> is compact,
      <math|\<theta\><around|(|K|)>> is compact.

      <item>Substituting <eqref|eq:change_var_differential> into
      <eqref|eq:expand_square>,

      <\equation>
        <label|eq:after_substitution><big|int><rsub|K><wide|\<theta\>|\<dot\>><around|(|t|)>*<around|\||f<around|(|\<theta\><around|(|t|)>|)>*<around|\||<rsup|2>d*t=<big|int><rsub|\<theta\><around|(|K|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*d*s
      </equation>

      <item>This establishes the local isometry <eqref|eq:local_isometry>.

      <item>To verify <math|U<rsub|\<theta\>><rsup|-1>> is the inverse,
      compute:

      <\equation>
        <label|eq:composition_1><around|(|U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>*f|)><around|(|s|)>=U<rsub|\<theta\>><rsup|-1>*<around|(|U<rsub|\<theta\>>*f|)><around|(|s|)>
      </equation>

      <item>By definition <eqref|eq:U_theta_inverse>,

      <\equation>
        <label|eq:apply_inverse_def>U<rsub|\<theta\>><rsup|-1>*<around|(|U<rsub|\<theta\>>*f|)><around|(|s|)>=<frac|<around|(|U<rsub|\<theta\>>*f|)><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
      </equation>

      <item>By definition <eqref|eq:U_theta_def>,

      <\equation>
        <label|eq:apply_forward_def><around|(|U<rsub|\<theta\>>*f|)><around|(|\<theta\><rsup|-1><around|(|s|)>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>*f<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|)>
      </equation>

      <item>Since <math|\<theta\>\<circ\>\<theta\><rsup|-1>=>id,

      <\equation>
        <label|eq:theta_inverse_composition>f<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|s|)>|)>|)>=f<around|(|s|)>
      </equation>

      <item>Substituting <eqref|eq:apply_forward_def> and
      <eqref|eq:theta_inverse_composition> into <eqref|eq:apply_inverse_def>,

      <\equation>
        <label|eq:simplify_composition><frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>*f<around|(|s|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>=f<around|(|s|)>
      </equation>

      <item>Therefore

      <\equation>
        <label|eq:left_inverse>U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>=<text|id>
      </equation>

      <item>Similarly, compute:

      <\equation>
        <label|eq:composition_2><around|(|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)>
      </equation>

      <item>By definition <eqref|eq:U_theta_inverse>,

      <\equation>
        <label|eq:apply_inverse_second><around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>>
      </equation>

      <item>Since <math|\<theta\><rsup|-1>\<circ\>\<theta\>=>id,

      <\equation>
        <label|eq:theta_composition>g<around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>=g<around|(|t|)>,<space|1em>\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>=t
      </equation>

      <item>Substituting <eqref|eq:theta_composition> into
      <eqref|eq:apply_inverse_second>,

      <\equation>
        <label|eq:simplify_second><frac|g<around|(|t|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>
      </equation>

      <item>Therefore from <eqref|eq:composition_2>,

      <\equation>
        <label|eq:right_inverse><around|(|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>\<cdot\><frac|g<around|(|t|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>=g<around|(|t|)>
      </equation>

      <item>Thus

      <\equation>
        <label|eq:both_inverses>U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>=<text|id>
      </equation>

      <item>Combining <eqref|eq:left_inverse> and <eqref|eq:both_inverses>,
      <math|U<rsub|\<theta\>><rsup|-1>> is the two-sided inverse of
      <math|U<rsub|\<theta\>>> on <math|L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>.
    </enumerate>
  </proof>

  <subsection|Inverse Filter for Unitary Time Transformations>

  <\theorem>
    <label|thm:inverse_filter><with|font-series|bold|[Inverse Filter for
    Unitary Time Transformations]> Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
    be absolutely continuous, strictly increasing, and bijective with
    <math|\<theta\><rprime|'><around|(|t|)>\<gtr\>0> almost everywhere. Let
    <math|Y<around|(|u|)>> be a stationary process with unit variance, and
    define

    <\equation>
      <label|eq:Z_transformation>Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*Y<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    as the oscillatory process obtained by the unitary time transformation.
    Then:

    <\enumerate>
      <item>The forward filter kernel is

      <\equation>
        <label|eq:forward_kernel>h<around|(|t,u|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>
      </equation>

      <item>The inverse filter kernel is

      <\equation>
        <label|eq:inverse_kernel>g<around|(|t,s|)>=<frac|\<delta\>*<around|(|s-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>
      </equation>

      <item>The composition <math|<around|(|g\<circ\>h|)>> recovers the
      identity:

      <\equation>
        <label|eq:filter_identity>Y<around|(|t|)>=<big|int><rsub|\<bbb-R\>>g<around|(|t,s|)>*Z<around|(|s|)>*d*s=<frac|Z<around|(|\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>
      </equation>
    </enumerate>
  </theorem>

  <\proof>
    <\enumerate>
      <item>From <eqref|eq:Z_transformation>, the forward transformation is

      <\equation>
        <label|eq:forward_integral>Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>h<around|(|t,u|)>*Y<around|(|u|)>*d*u
      </equation>

      <item>Substituting <eqref|eq:forward_kernel>,

      <\equation>
        <label|eq:forward_substitution><big|int><rsub|\<bbb-R\>>h<around|(|t,u|)>*Y<around|(|u|)>*d*u=<big|int><rsub|\<bbb-R\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>*Y<around|(|u|)>*d*u
      </equation>

      <item>By the sifting property of the Dirac delta,

      <\equation>
        <label|eq:sifting_forward><big|int><rsub|\<bbb-R\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>*Y<around|(|u|)>*d*u=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*Y<around|(|\<theta\><around|(|t|)>|)>
      </equation>

      <item>This confirms <eqref|eq:Z_transformation>.

      <item>For the inverse, compute:

      <\equation>
        <label|eq:inverse_integral><big|int><rsub|\<bbb-R\>>g<around|(|t,s|)>*Z<around|(|s|)>*d*s=<big|int><rsub|\<bbb-R\>><frac|\<delta\>*<around|(|s-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>*Z<around|(|s|)>*d*s
      </equation>

      <item>By the sifting property,

      <\equation>
        <label|eq:sifting_inverse><big|int><rsub|\<bbb-R\>><frac|\<delta\>*<around|(|s-\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>*Z<around|(|s|)>*d*s=<frac|Z<around|(|\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>
      </equation>

      <item>Substituting <eqref|eq:Z_transformation> with <math|t> replaced
      by <math|\<theta\><rsup|-1><around|(|t|)>>,

      <\equation>
        <label|eq:Z_at_inverse>Z<around|(|\<theta\><rsup|-1><around|(|t|)>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>*Y<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|t|)>|)>|)>
      </equation>

      <item>Since <math|\<theta\>\<circ\>\<theta\><rsup|-1>=>id,

      <\equation>
        <label|eq:theta_composition_Y>Y<around|(|\<theta\><around|(|\<theta\><rsup|-1><around|(|t|)>|)>|)>=Y<around|(|t|)>
      </equation>

      <item>Substituting <eqref|eq:Z_at_inverse> and
      <eqref|eq:theta_composition_Y> into <eqref|eq:sifting_inverse>,

      <\equation>
        <label|eq:final_inverse><frac|Z<around|(|\<theta\><rsup|-1><around|(|t|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>=<frac|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>*Y<around|(|t|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|t|)>|)>>>=Y<around|(|t|)>
      </equation>

      <item>This establishes <eqref|eq:filter_identity>, confirming that
      <math|g\<circ\>h=>id.
    </enumerate>
  </proof>

  <subsection|Transformation of Stationary <math|\<to\>> Oscillatory
  Processes via <math|U<rsub|\<theta\>>>>

  <\theorem>
    <label|thm:Utheta_to_osc><with|font-series|bold|[Unitary time change
    yields oscillatory process]> Let <math|X> be zero-mean stationary as in
    Definition <reference|def:cramer>. For scaling function <math|\<theta\>>
    as in Theorem <reference|thm:local_unitarity>, define

    <\equation>
      <label|eq:Z_def>Z<around|(|t|)>=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then <math|Z> is a realization of an oscillatory process with oscillatory
    function

    <\equation>
      <label|eq:oscillatory_function_Z>\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
    </equation>

    gain function

    <\equation>
      <label|eq:gain_function_Z>A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    and covariance

    <\equation>
      <tabular|<tformat|<cwith|1|5|1|1|cell-halign|l>|<cwith|1|5|1|1|cell-lborder|0ln>|<cwith|1|5|2|2|cell-halign|l>|<cwith|1|5|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around*|[|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)><wide|<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*\<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>><label|UTCcovar>
      <label|eq:covariance_Z>R<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*d*F<around|(|\<lambda\>|)>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item>From the Cram�r representation <eqref|eq:cramer_representation>,

      <\equation>
        <label|eq:X_cramer>X<around|(|u|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*u>*d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      <item>Substituting <math|u=\<theta\><around|(|t|)>> into
      <eqref|eq:X_cramer>,

      <\equation>
        <label|eq:X_theta_t>X<around|(|\<theta\><around|(|t|)>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      <item>From the definition <eqref|eq:Z_def>,

      <\equation>
        <label|eq:Z_expanded>Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      <item>By linearity of the stochastic integral,

      <\equation>
        <label|eq:Z_integral>Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      <item>Define

      <\equation>
        <label|eq:varphi_t_explicit>\<varphi\><rsub|t><around|(|\<lambda\>|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>
      </equation>

      <item>Then <eqref|eq:Z_integral> becomes

      <\equation>
        <label|eq:Z_oscillatory_form>Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      which is the oscillatory representation <eqref|eq:oscillatory_process>.

      <item>To express this in terms of the standard oscillatory function
      form, write

      <\equation>
        <label|eq:varphi_factored>\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<lambda\>*t>
      </equation>

      <item>Define the gain function

      <\equation>
        <label|eq:A_t_explicit>A<rsub|t><around|(|\<lambda\>|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
      </equation>

      <item>Then

      <\equation>
        <label|eq:varphi_as_gain>\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
      </equation>

      confirming the oscillatory function form
      <eqref|eq:oscillatory_function>.

      <item>To compute the covariance, use <eqref|eq:oscillatory_covariance>:

      <\equation>
        <label|eq:R_Z_start>R<rsub|Z><around|(|t,s|)>=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>
      </equation>

      <item>Substituting <eqref|eq:Z_def>,

      <\equation>
        <label|eq:R_Z_substituted>R<rsub|Z><around|(|t,s|)>=\<bbb-E\>*<around*|[|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)><wide|<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>
      </equation>

      <item>Since <math|<wide|\<theta\>|\<dot\>>> is deterministic,

      <\equation>
        <label|eq:R_Z_factored>R<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*\<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>
      </equation>

      <item>By stationarity of <math|X>, using
      <eqref|eq:stationary_covariance>,

      <\equation>
        <label|eq:X_covariance>\<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>=R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*d*F<around|(|\<lambda\>|)>
      </equation>

      <item>Substituting <eqref|eq:X_covariance> into
      <eqref|eq:R_Z_factored>,

      <\equation>
        <label|eq:R_Z_final>R<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*d*F<around|(|\<lambda\>|)>
      </equation>

      establishing <eqref|eq:covariance_Z>.
    </enumerate>
  </proof>

  <\corollary>
    <label|cor:evol_spec><with|font-series|bold|[Evolutionary spectrum of
    unitarily time-changed stationary process]> The evolutionary spectrum is

    <\equation>
      <label|eq:evolutionary_spectrum>d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*F<around|(|\<lambda\>|)>
    </equation>
  </corollary>

  <\proof>
    <\enumerate>
      <item>The evolutionary spectrum is defined by

      <\equation>
        <label|eq:evol_spec_def>d*F<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>
      </equation>

      <item>From <eqref|eq:gain_function_Z>,

      <\equation>
        <label|eq:A_t_magnitude_start><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>=<around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>
      </equation>

      <item>Since <math|<around|\||e<rsup|i*\<alpha\>>|\|>=1> for all real
      <math|\<alpha\>>,

      <\equation>
        <label|eq:exp_magnitude><around*|\||e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>=1
      </equation>

      <item>Therefore

      <\equation>
        <label|eq:A_t_magnitude><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>=<around*|(|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>|)><rsup|2>\<cdot\>1=<wide|\<theta\>|\<dot\>><around|(|t|)>
      </equation>

      <item>Substituting <eqref|eq:A_t_magnitude> into
      <eqref|eq:evol_spec_def>,

      <\equation>
        <label|eq:evol_spec_final>d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*F<around|(|\<lambda\>|)>
      </equation>
    </enumerate>
  </proof>

  <subsection|Covariance operator conjugation>

  <\proposition>
    <label|prop:conjugation><with|font-series|bold|[Operator conjugation]>
    Let

    <\equation>
      <label|eq:T_K_def><around|(|T<rsub|K>*f|)><around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>K<around|(|<around|\||t-s|\|>|)>*f<around|(|s|)>*d*s
    </equation>

    with stationary kernel

    <\equation>
      <label|eq:K_def>K<around|(|h|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*h>*d*F<around|(|\<lambda\>|)>
    </equation>

    Define the transformed kernel

    <\equation>
      <label|eq:K_theta_def>K<rsub|\<theta\>><around|(|s,t|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    then the corresponding integral covariance operator is conjugated for all
    <math|f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>> by

    <\equation>
      <label|eq:conjugation><around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>=<around|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|t|)>
    </equation>
  </proposition>

  <\proof>
    <\enumerate>
      <item>From <eqref|eq:conjugation>, expand the right side:

      <\equation>
        <label|eq:conjugation_expand><around|(|U<rsub|\<theta\>>*T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<around|(|T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|\<theta\><around|(|t|)>|)>
      </equation>

      <item>By definition <eqref|eq:T_K_def>,

      <\equation>
        <label|eq:T_K_application><around|(|T<rsub|K>*U<rsub|\<theta\>><rsup|-1>*f|)><around|(|\<theta\><around|(|t|)>|)>=<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-s|\|>|)>*<around|(|U<rsub|\<theta\>><rsup|-1>*f|)><around|(|s|)>*d*s
      </equation>

      <item>By definition <eqref|eq:U_theta_inverse>,

      <\equation>
        <label|eq:U_inv_application><around|(|U<rsub|\<theta\>><rsup|-1>*f|)><around|(|s|)>=<frac|f<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
      </equation>

      <item>Substituting <eqref|eq:U_inv_application> into
      <eqref|eq:T_K_application>,

      <\equation>
        <label|eq:integral_substitution><big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-s|\|>|)><frac|f<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>*d*s
      </equation>

      <item>Apply the change of variables <math|s=\<theta\><around|(|u|)>>,
      so <math|d*s=<wide|\<theta\>|\<dot\>><around|(|u|)>*d*u> and
      <math|\<theta\><rsup|-1><around|(|s|)>=u>:

      <\equation>
        <label|eq:change_var_s><big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)><frac|f<around|(|u|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>>*<wide|\<theta\>|\<dot\>><around|(|u|)>*d*u
      </equation>

      <item>Simplify:

      <\equation>
        <label|eq:simplify_integral><big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)><frac|<wide|\<theta\>|\<dot\>><around|(|u|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>>*f<around|(|u|)>*d*u=<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>*f<around|(|u|)>*d*u
      </equation>

      <item>Substituting <eqref|eq:simplify_integral> into
      <eqref|eq:conjugation_expand>,

      <\equation>
        <label|eq:full_expression><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>*f<around|(|u|)>*d*u
      </equation>

      <item>Bring the constant inside the integral:

      <\equation>
        <label|eq:factor_inside><big|int><rsub|\<bbb-R\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)>*f<around|(|u|)>*d*u
      </equation>

      <item>By definition <eqref|eq:K_theta_def>,

      <\equation>
        <label|eq:K_theta_recognition><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)>=K<rsub|\<theta\>><around|(|u,t|)>
      </equation>

      <item>Therefore

      <\equation>
        <label|eq:final_conjugation><big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|u,t|)>*f<around|(|u|)>*d*u=<around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>
      </equation>

      establishing <eqref|eq:conjugation>.
    </enumerate>
  </proof>

  <section|Zero Localization><label|sec:HP>

  <\definition>
    <label|def:zeromeasure><with|font-series|bold|[Zero localization
    measure]> Let <math|Z> be real-valued with
    <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>> having only simple zeros

    <\equation>
      <label|eq:simple_zeros>Z<around|(|t<rsub|0>|)>=0\<Rightarrow\><wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0
    </equation>

    Define, for Borel <math|B\<subset\>\<bbb-R\>>,

    <\equation>
      <label|eq:mu_def>\<mu\><around|(|B|)>=<big|int><rsub|\<bbb-R\>><with|math-font-family|bf|1><rsub|B><around|(|t|)>*\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t
    </equation>
  </definition>

  <\theorem>
    <label|thm:atomicity><with|font-series|bold|[Atomicity and local
    finiteness of zeros and delta decomposition]> Under the assumptions of
    Definition <reference|def:zeromeasure>, zeros are locally finite and one
    has

    <\equation>
      <label|eq:delta_decomposition>\<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>
    </equation>

    whence

    <\equation>
      <label|eq:mu_atomic>\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item>For any smooth test function <math|\<phi\>> with compact support,
      apply the standard change of variables formula for the delta function.
      Let <math|<around|{|t<rsub|0><rsup|<around|(|1|)>>,t<rsub|0><rsup|<around|(|2|)>>,\<ldots\>|}>>
      denote the zeros of <math|Z>.

      <item>By the change of variables formula for distributions,

      <\equation>
        <label|eq:delta_change_var><big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)>*\<delta\><around|(|Z<around|(|t|)>|)>*d*t=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<phi\><around|(|t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>
      </equation>

      <item>The right side of <eqref|eq:delta_change_var> equals

      <\equation>
        <label|eq:sum_form><big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<phi\><around|(|t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>*d*t
      </equation>

      <item>By Fubini's theorem (justified since the sum has locally finite
      terms due to <math|C<rsup|1>> regularity and simple zeros),

      <\equation>
        <label|eq:interchange_sum_integral><big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>*d*t=<big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)>*<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>*d*t
      </equation>

      <item>Comparing <eqref|eq:delta_change_var> and
      <eqref|eq:interchange_sum_integral>,

      <\equation>
        <label|eq:delta_equality><big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)>*\<delta\><around|(|Z<around|(|t|)>|)>*d*t=<big|int><rsub|\<bbb-R\>>\<phi\><around|(|t|)>*<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>*d*t
      </equation>

      <item>Since <math|\<phi\>> is arbitrary,

      <\equation>
        <label|eq:delta_Z_decomp>\<delta\><around|(|Z<around|(|t|)>|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>
      </equation>

      establishing <eqref|eq:delta_decomposition>.

      <item>Substituting <eqref|eq:delta_Z_decomp> into the definition
      <eqref|eq:mu_def>,

      <\equation>
        <label|eq:mu_substitution>\<mu\><around|(|B|)>=<big|int><rsub|\<bbb-R\>><with|math-font-family|bf|1><rsub|B><around|(|t|)>*<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t
      </equation>

      <item>By the sifting property of the delta function,
      <math|<around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>> evaluated at
      <math|t=t<rsub|0>> gives <math|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>:

      <\equation>
        <label|eq:cancel_derivative><big|int><rsub|\<bbb-R\>><with|math-font-family|bf|1><rsub|B><around|(|t|)><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t=<frac|<with|math-font-family|bf|1><rsub|B><around|(|t<rsub|0>|)><around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>=<with|math-font-family|bf|1><rsub|B><around|(|t<rsub|0>|)>
      </equation>

      <item>Summing over all zeros,

      <\equation>
        <label|eq:mu_sum>\<mu\><around|(|B|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><with|math-font-family|bf|1><rsub|B><around|(|t<rsub|0>|)>=<big|sum><rsub|t<rsub|0>\<in\>B:Z<around|(|t<rsub|0>|)>=0>1
      </equation>

      <item>This is precisely the atomic measure

      <\equation>
        <label|eq:mu_atomic_final>\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>
      </equation>

      establishing <eqref|eq:mu_atomic>.
    </enumerate>
  </proof>

  <\definition>
    <label|def:Hmu><with|font-series|bold|[Hilbert space on the zero set]>
    Let <math|\<cal-H\>=L<rsup|2><around|(|\<mu\>|)>> with inner product

    <\equation>
      <label|eq:inner_product_mu><around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>>d*\<mu\><around|(|t|)>
    </equation>
  </definition>

  <\proposition>
    <label|prop:atomic><with|font-series|bold|[Atomic structure]> Let

    <\equation>
      <label|eq:mu_atomic_assumption>\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>
    </equation>

    then

    <\equation>
      <label|eq:H_isomorphism>\<cal-H\>\<cong\><around*|{|f:<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>\<to\>\<bbb-C\>:<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>\<less\>\<infty\>|}>\<cong\>\<ell\><rsup|2>
    </equation>

    with orthonormal basis <math|<around|{|e<rsub|t<rsub|0>>|}><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>>
    where

    <\equation>
      <label|eq:basis_vectors>e<rsub|t<rsub|0>><around|(|t<rsub|1>|)>=\<delta\><rsub|t<rsub|0>,t<rsub|1>>
    </equation>
  </proposition>

  <\proof>
    <\enumerate>
      <item>By <eqref|eq:mu_atomic_assumption>, <math|\<mu\>> is a purely
      atomic measure with atoms at the zero set.

      <item>For any <math|f\<in\>L<rsup|2><around|(|\<mu\>|)>>, the
      <math|L<rsup|2>> norm is

      <\equation>
        <label|eq:L2_norm_mu><around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|\<mu\>|)>><rsup|2>=<big|int><rsub|\<bbb-R\>><around|\||f<around|(|t|)>|\|><rsup|2>*d*\<mu\><around|(|t|)>
      </equation>

      <item>Substituting <eqref|eq:mu_atomic_assumption>,

      <\equation>
        <label|eq:norm_sum><big|int><rsub|\<bbb-R\>><around|\||f<around|(|t|)>|\|><rsup|2>*d*\<mu\><around|(|t|)>=<big|int><rsub|\<bbb-R\>><around|\||f<around|(|t|)>|\|><rsup|2>*<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>*<around|(|d*t|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>
      </equation>

      <item>Therefore

      <\equation>
        <label|eq:norm_equivalence><around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|\<mu\>|)>><rsup|2>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>
      </equation>

      <item>This is precisely the <math|\<ell\><rsup|2>> norm on the zero
      set.

      <item>Define the map <math|\<Psi\>:L<rsup|2><around|(|\<mu\>|)>\<to\>\<ell\><rsup|2>>
      by

      <\equation>
        <label|eq:isomorphism_map>\<Psi\><around|(|f|)>=<around|(|f<around|(|t<rsub|0>|)>|)><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>
      </equation>

      <item>From <eqref|eq:norm_equivalence>, <math|\<Psi\>> is an isometry:

      <\equation>
        <label|eq:isometry_Psi><around|\<\|\|\>|\<Psi\><around|(|f|)>|\<\|\|\>><rsub|\<ell\><rsup|2>><rsup|2>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><around|\||f<around|(|t<rsub|0>|)>|\|><rsup|2>=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|2><around|(|\<mu\>|)>><rsup|2>
      </equation>

      <item><math|\<Psi\>> is surjective: for any sequence
      <math|<around|(|c<rsub|t<rsub|0>>|)>\<in\>\<ell\><rsup|2>>, define
      <math|f<around|(|t|)>=<big|sum><rsub|t<rsub|0>>c<rsub|t<rsub|0>>*\<delta\><rsub|t<rsub|0>><around|(|t|)>>,
      which is in <math|L<rsup|2><around|(|\<mu\>|)>>.

      <item>Therefore <math|\<Psi\>> is a Hilbert space isomorphism,
      establishing <eqref|eq:H_isomorphism>.

      <item>For the orthonormal basis, define <math|e<rsub|t<rsub|0>>> by
      <eqref|eq:basis_vectors>.

      <item>Then

      <\equation>
        <label|eq:basis_inner_product><around|\<langle\>|e<rsub|t<rsub|0>>,e<rsub|t<rsub|1>>|\<rangle\>>=<big|int><rsub|\<bbb-R\>>e<rsub|t<rsub|0>><around|(|t|)><wide|e<rsub|t<rsub|1>><around|(|t|)>|\<bar\>>d*\<mu\><around|(|t|)>=<big|sum><rsub|s:Z<around|(|s|)>=0>\<delta\><rsub|t<rsub|0>,s>*\<delta\><rsub|t<rsub|1>,s>=\<delta\><rsub|t<rsub|0>,t<rsub|1>>
      </equation>

      <item>Therefore <math|<around|{|e<rsub|t<rsub|0>>|}>> is an orthonormal
      set.

      <item>Since every <math|f\<in\>L<rsup|2><around|(|\<mu\>|)>> can be
      written as

      <\equation>
        <label|eq:basis_expansion>f=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>f<around|(|t<rsub|0>|)>*e<rsub|t<rsub|0>>
      </equation>

      the set <math|<around|{|e<rsub|t<rsub|0>>|}>> is complete, hence an
      orthonormal basis.
    </enumerate>
  </proof>

  <\definition>
    <label|def:L><with|font-series|bold|[Multiplication operator]> Define the
    linear operator

    <\equation>
      <label|eq:L_def>L:\<cal-D\><around|(|L|)>\<subset\>\<cal-H\>\<to\>\<cal-H\>
    </equation>

    by

    <\equation>
      <label|eq:L_action><around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>
    </equation>

    on the support of <math|\<mu\>> with domain

    <\equation>
      <label|eq:L_domain>\<cal-D\><around|(|L|)>\<assign\><around*|{|f\<in\>\<cal-H\>:<big|int><around|\||t*f<around|(|t|)>|\|><rsup|2>*d*\<mu\><around|(|t|)>\<less\>\<infty\>|}>
    </equation>
  </definition>

  <\theorem>
    <label|thm:spectrum><with|font-series|bold|[Self-adjointness and
    spectrum]> <math|L> is self-adjoint on <math|\<cal-H\>> and has pure
    point, simple spectrum

    <\equation>
      <label|eq:spectrum>\<sigma\><around|(|L|)>=<wide|<around|{|t\<in\>\<bbb-R\>:Z<around|(|t|)>=0|}>|\<bar\>>
    </equation>

    with eigenvalues <math|\<lambda\>=t<rsub|0>> for each zero
    <math|t<rsub|0>> and corresponding eigenvectors <math|e<rsub|t<rsub|0>>>.
  </theorem>

  <\proof>
    <\enumerate>
      <item>For <math|f,g\<in\>\<cal-D\><around|(|L|)>>, compute the inner
      product:

      <\equation>
        <label|eq:Lf_g_inner><around|\<langle\>|L*f,g|\<rangle\>>=<big|int><rsub|\<bbb-R\>><around|(|L*f|)><around|(|t|)><wide|g<around|(|t|)>|\<bar\>>d*\<mu\><around|(|t|)>
      </equation>

      <item>By definition <eqref|eq:L_action>,

      <\equation>
        <label|eq:Lf_substitution><big|int><rsub|\<bbb-R\>>t*f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>>d*\<mu\><around|(|t|)>
      </equation>

      <item>Since <math|t> is real-valued, <math|<wide|t|\<bar\>>=t>, so

      <\equation>
        <label|eq:conjugate_t><big|int><rsub|\<bbb-R\>>t*f<around|(|t|)><wide|g<around|(|t|)>|\<bar\>>d*\<mu\><around|(|t|)>=<big|int><rsub|\<bbb-R\>>f<around|(|t|)><wide|t*g<around|(|t|)>|\<bar\>>d*\<mu\><around|(|t|)>
      </equation>

      <item>The right side of <eqref|eq:conjugate_t> is

      <\equation>
        <label|eq:f_Lg_inner><big|int><rsub|\<bbb-R\>>f<around|(|t|)><wide|<around|(|L*g|)><around|(|t|)>|\<bar\>>d*\<mu\><around|(|t|)>=<around|\<langle\>|f,L*g|\<rangle\>>
      </equation>

      <item>Therefore

      <\equation>
        <label|eq:self_adjoint><around|\<langle\>|L*f,g|\<rangle\>>=<around|\<langle\>|f,L*g|\<rangle\>>
      </equation>

      for all <math|f,g\<in\>\<cal-D\><around|(|L|)>>, establishing that
      <math|L> is symmetric.

      <item>Since <math|L> is a multiplication operator on
      <math|L<rsup|2><around|(|\<mu\>|)>>, it is self-adjoint (by standard
      functional analysis).

      <item>To determine the spectrum, compute the action on basis vectors.
      From <eqref|eq:L_action> and <eqref|eq:basis_vectors>,

      <\equation>
        <label|eq:L_basis><around|(|L*e<rsub|t<rsub|0>>|)><around|(|t|)>=t*e<rsub|t<rsub|0>><around|(|t|)>=t*\<delta\><rsub|t<rsub|0>><around|(|t|)>
      </equation>

      <item>By the sifting property,

      <\equation>
        <label|eq:sift_basis>t*\<delta\><rsub|t<rsub|0>><around|(|t|)>=t<rsub|0>*\<delta\><rsub|t<rsub|0>><around|(|t|)>=t<rsub|0>*e<rsub|t<rsub|0>><around|(|t|)>
      </equation>

      <item>Therefore

      <\equation>
        <label|eq:eigenvalue_equation>L*e<rsub|t<rsub|0>>=t<rsub|0>*e<rsub|t<rsub|0>>
      </equation>

      <item>This shows that each <math|t<rsub|0>> is an eigenvalue with
      eigenvector <math|e<rsub|t<rsub|0>>>.

      <item>Since the <math|<around|{|e<rsub|t<rsub|0>>|}>> form a complete
      orthonormal basis (Proposition <reference|prop:atomic>), the spectrum
      is pure point.

      <item>Each eigenspace is one-dimensional (spanned by
      <math|e<rsub|t<rsub|0>>>), so the spectrum is simple.

      <item>Therefore

      <\equation>
        <label|eq:spectrum_result>\<sigma\><around|(|L|)>=<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>
      </equation>

      <item>If the zero set accumulates, the spectrum is the closure:

      <\equation>
        <label|eq:spectrum_closure>\<sigma\><around|(|L|)>=<wide|<around|{|t\<in\>\<bbb-R\>:Z<around|(|t|)>=0|}>|\<bar\>>
      </equation>
    </enumerate>
  </proof>

  <subsection|The Kac-Rice Formula For The Expected Zero Counting Function>

  <\theorem>
    <label|thm:kac_rice><with|font-series|bold|[Kac-Rice Formula for Zero
    Crossings]> Let <math|Z<around|(|t|)>> be a centered Gaussian process on
    <math|<around|[|a,b|]>> with covariance
    <math|K<around|(|s,t|)>=\<bbb-E\>*<around|[|Z<around|(|s|)>*Z<around|(|t|)>|]>>
    then the expected number of zeros in <math|<around|[|a,b|]>> is

    <\equation>
      <label|eq:kac_rice>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><sqrt|<frac|2|\<pi\>>>*<frac|<sqrt|K<around|(|t,t|)>*K<rsub|<wide|Z|\<dot\>>><around|(|t,t|)>-K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)><rsup|2>>|K<around|(|t,t|)>>*d*t
    </equation>

    where

    <\equation>
      <label|eq:K_tt>K<around|(|t,t|)>=\<bbb-E\><around|[|Z<around|(|t|)><rsup|2>|]>
    </equation>

    <\equation>
      <label|eq:K_dotZ>K<rsub|<wide|Z|\<dot\>>><around|(|t,t|)>=-\<partial\><rsup|2><rsub|s>*\<partial\><rsub|t>*K<around|(|s,t|)>\|<rsub|s=t>
    </equation>

    and

    <\equation>
      <label|eq:K_Z_dotZ>K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)>=\<partial\><rsub|s>*K<around|(|s,t|)>\|<rsub|s=t>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item>The expected number of zeros is given by the Kac-Rice formula for
      the level crossing density at level zero.

      <item>For a Gaussian process <math|Z<around|(|t|)>>, the joint
      distribution of <math|<around|(|Z<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>|)>>
      is bivariate normal with covariance matrix

      <\equation>
        <label|eq:covariance_matrix>\<Sigma\><around|(|t|)>=<matrix|<tformat|<table|<row|<cell|K<around|(|t,t|)>>|<cell|K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)>>>|<row|<cell|K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)>>|<cell|K<rsub|<wide|Z|\<dot\>>><around|(|t,t|)>>>>>>
      </equation>

      <item>The determinant of <math|\<Sigma\><around|(|t|)>> is

      <\equation>
        <label|eq:determinant>det \<Sigma\><around|(|t|)>=K<around|(|t,t|)>*K<rsub|<wide|Z|\<dot\>>><around|(|t,t|)>-K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)><rsup|2>
      </equation>

      <item>The Kac-Rice formula states that the expected number of zeros in
      <math|<around|[|a,b|]>> is

      <\equation>
        <label|eq:kac_rice_general>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b>p<rsub|Z<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>><around|(|0,v|)><around|\||v|\|>*d*v*<space|0.17em>d*t
      </equation>

      where <math|p<rsub|Z<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>>> is
      the joint density of <math|<around|(|Z<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>|)>>.

      <item>For a centered bivariate normal distribution with covariance
      <math|\<Sigma\><around|(|t|)>>,

      <\equation>
        <label|eq:joint_density>p<rsub|Z<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>><around|(|z,v|)>=<frac|1|2*\<pi\>*<sqrt|det
        \<Sigma\><around|(|t|)>>>*exp <around*|(|-<frac|1|2><matrix|<tformat|<table|<row|<cell|z>>|<row|<cell|v>>>>><rsup|T>\<Sigma\><around|(|t|)><rsup|-1><matrix|<tformat|<table|<row|<cell|z>>|<row|<cell|v>>>>>|)>
      </equation>

      <item>At <math|z=0>,

      <\equation>
        <label|eq:density_at_zero>p<rsub|Z<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>><around|(|0,v|)>=<frac|1|2*\<pi\>*<sqrt|det
        \<Sigma\><around|(|t|)>>>*exp <around*|(|-<frac|v<rsup|2>*K<around|(|t,t|)>|2*det
        \<Sigma\><around|(|t|)>>|)>
      </equation>

      <item>Integrating <eqref|eq:density_at_zero> against
      <math|<around|\||v|\|>>,

      <\equation>
        <label|eq:integrate_v><big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|Z<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>><around|(|0,v|)><around|\||v|\|>*d*v=<frac|1|2*\<pi\>*<sqrt|det
        \<Sigma\><around|(|t|)>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||v|\|>*exp
        <around*|(|-<frac|v<rsup|2>*K<around|(|t,t|)>|2*det
        \<Sigma\><around|(|t|)>>|)>*d*v
      </equation>

      <item>Using symmetry, <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||v|\|>*e<rsup|-a*v<rsup|2>>*d*v=2*<big|int><rsub|0><rsup|\<infty\>>v*e<rsup|-a*v<rsup|2>>*d*v=<frac|1|a>*<sqrt|<frac|\<pi\>|a>>>:

      <\equation>
        <label|eq:gaussian_integral><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||v|\|>*exp
        <around*|(|-<frac|v<rsup|2>*K<around|(|t,t|)>|2*det
        \<Sigma\><around|(|t|)>>|)>*d*v=<sqrt|<frac|2*\<pi\>*det
        \<Sigma\><around|(|t|)>|K<around|(|t,t|)>>>
      </equation>

      <item>Substituting <eqref|eq:gaussian_integral> into
      <eqref|eq:integrate_v>,

      <\equation>
        <label|eq:density_integral><frac|1|2*\<pi\>*<sqrt|det
        \<Sigma\><around|(|t|)>>>\<cdot\><sqrt|<frac|2*\<pi\>*det
        \<Sigma\><around|(|t|)>|K<around|(|t,t|)>>>=<sqrt|<frac|2|\<pi\>>>*<frac|<sqrt|det
        \<Sigma\><around|(|t|)>>|K<around|(|t,t|)>>
      </equation>

      <item>Using <eqref|eq:determinant>,

      <\equation>
        <label|eq:final_density><sqrt|<frac|2|\<pi\>>>*<frac|<sqrt|K<around|(|t,t|)>*K<rsub|<wide|Z|\<dot\>>><around|(|t,t|)>-K<rsub|Z,<wide|Z|\<dot\>>><around|(|t,t|)><rsup|2>>|K<around|(|t,t|)>>
      </equation>

      <item>Integrating <eqref|eq:final_density> over <math|<around|[|a,b|]>>
      yields <eqref|eq:kac_rice>.
    </enumerate>
  </proof>

  \;

  \;
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
    <associate|U|<tuple|32|5>>
    <associate|UTCcovar|<tuple|56|9>>
    <associate|Z|<tuple|43|7>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|2.3|10>>
    <associate|auto-11|<tuple|3|11>>
    <associate|auto-12|<tuple|3.1|11>>
    <associate|auto-13|<tuple|3.2|12>>
    <associate|auto-14|<tuple|3.3|13>>
    <associate|auto-15|<tuple|3.4|14>>
    <associate|auto-16|<tuple|123|16>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1.3|3>>
    <associate|auto-5|<tuple|1.4|3>>
    <associate|auto-6|<tuple|2|5>>
    <associate|auto-7|<tuple|2.1|5>>
    <associate|auto-8|<tuple|2.1.1|7>>
    <associate|auto-9|<tuple|2.2|9>>
    <associate|bib-evolutionarySpectraAndNonStationaryProcesses|<tuple|2|16>>
    <associate|bib-stationaryAndRelatedStochasticProcesses|<tuple|1|16>>
    <associate|cor:evol_spec|<tuple|15|10>>
    <associate|covar|<tuple|19|3>>
    <associate|def:L|<tuple|21|13>>
    <associate|def:L2loc|<tuple|3|2>>
    <associate|def:Utheta|<tuple|10|5>>
    <associate|def:cramer|<tuple|6|3>>
    <associate|def:osc_proc|<tuple|7|3>>
    <associate|def:regularity|<tuple|23|13>>
    <associate|def:zeromeasure|<tuple|17|11>>
    <associate|eq:covariance_def|<tuple|117|15>>
    <associate|eq:expectation|<tuple|108|15>>
    <associate|eq:expected_zeros|<tuple|118|15>>
    <associate|eq:kac_rice|<tuple|103|14>>
    <associate|eq:kac_rice_formula|<tuple|120|16>>
    <associate|eq:limit_mixed_partial|<tuple|122|16>>
    <associate|eq:mixed_partial|<tuple|121|16>>
    <associate|eq:mixed_partial_continued|<tuple|121|16>>
    <associate|eq:substituted_kac_rice|<tuple|123|16>>
    <associate|eq:time_changed_cov|<tuple|119|16>>
    <associate|h|<tuple|44|7>>
    <associate|item:composition|<tuple|3|7>>
    <associate|item:forward|<tuple|1|7>>
    <associate|item:inverse|<tuple|2|7>>
    <associate|labeldef:Hmu|<tuple|19|12>>
    <associate|lem:delta|<tuple|24|14>>
    <associate|of|<tuple|16|3>>
    <associate|prop:atomic|<tuple|20|12>>
    <associate|prop:conjugation|<tuple|16|10>>
    <associate|prop:inverse|<tuple|11|5>>
    <associate|sec:HP|<tuple|3|11>>
    <associate|sec:oscillatory|<tuple|1.4|3>>
    <associate|sec:stationary_timechange|<tuple|2|5>>
    <associate|thm:Utheta_to_osc|<tuple|14|9>>
    <associate|thm:atomic|<tuple|18|11>>
    <associate|thm:existence_osc|<tuple|9|4>>
    <associate|thm:expected_zero_counting|<tuple|26|15>>
    <associate|thm:inverse-filter|<tuple|13|7>>
    <associate|thm:kac_rice|<tuple|25|14>>
    <associate|thm:local_unitarity|<tuple|12|6>>
    <associate|thm:paths_loc|<tuple|5|2>>
    <associate|thm:realvaluedness|<tuple|8|4>>
    <associate|thm:spectrum|<tuple|22|13>>
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
      <with|mode|<quote|math>|U<rsub|\<theta\>>*f>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Inverse Filter for Unitary
      Time Transformations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Transformation of Stationary
      <with|mode|<quote|math>|\<to\>> Oscillatory Processes via
      <with|mode|<quote|math>|U<rsub|\<theta\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|2.4<space|2spc>Covariance operator
      conjugation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Zero
      Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>The Kac-Rice Formula For The
      Expected Zero Counting Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>
    </associate>
  </collection>
</auxiliary>