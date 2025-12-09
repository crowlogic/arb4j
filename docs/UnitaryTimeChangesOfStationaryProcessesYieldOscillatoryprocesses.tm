<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Processes Yield
  Oscillatory Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|September 16, 2025>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Oscillatory
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Unitarily
    Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Unitary Time-Change Operator
    <with|mode|math|U<rsub|\<theta\>>*f> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Transformation of Stationary
    <with|mode|math|\<to\>> Oscillatory Processes via
    <with|mode|math|U<rsub|\<theta\>>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|2tab|2.2.1<space|2spc>Time-Varying Filter Representations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.3<space|2spc>Covariance operator conjugation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Oscillatory Processes>

  <\remark>
    Unless otherwise stated.

    <\enumerate>
      <item>Spectral measures are assumed to be absolutely continuous

      <item>All parametric families <math|<around|{|f<rsub|t><around|(|\<omega\>|)>|}>>
      are jointly measurable with respect to
      <math|\<cal-B\><around|(|\<bbb-R\>|)>\<otimes\>\<cal-B\><around|(|\<bbb-R\>|)>>.

      <item>Dirac delta identities such as
      <math|<big|int>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*u>*d*u=2*\<pi\>*\<delta\>*<around|(|\<mu\>-\<lambda\>|)>>
      are distributional.

      <item>Integrals of the form <math|<big|int>f<around|(|\<omega\>|)>*d*\<nu\><around|(|\<omega\>|)>>
      denote Lebesgue-Stieltjes integration with respect to measure
      <math|\<nu\>>, while <math|<big|int>g<around|(|u|)>*d*u> denotes
      Lebesgue integration with respect to Lebesgue measure.

      <item>Integrals with respect to orthogonal random measures
      <math|\<Phi\>>, written <math|<big|int>h<around|(|\<omega\>|)>*d*\<Phi\><around|(|\<omega\>|)>>,
      are Lebesgue-Stieltjes integrals in
      <math|L<rsup|2><around|(|\<Omega\>|)>> with variance
      <math|\<bbb-E\><around|[|<around|\||<big|int>h*d*\<Phi\>|\|><rsup|2>|]>=<big|int><around|\||h|\|><rsup|2>*d*\<mu\>>.

      <item>Limit interchange is justified by dominated convergence under
      uniform <math|L<rsup|2>> bounds.
    </enumerate>
  </remark>

  Throughout, <math|<around|(|\<Omega\>,\<cal-F\>,\<bbb-P\>|)>> is a fixed
  probability space and <math|\<mu\>> is a finite Borel measure on
  <math|\<bbb-R\>>.

  <\definition>
    <label|def:osc_proc><with|font-series|bold|[Oscillatory process]>
    <cite|evolutionarySpectraAndNonStationaryProcesses> Let <math|F> be a
    finite nonnegative Borel measure on <math|\<bbb-R\>>. Let the gain
    function be

    <\equation>
      A<rsub|t><around*|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)><space|1em>\<forall\>t,\<lambda\>\<in\>\<bbb-R\><label|eq:gain_L2>
    </equation>

    so that the corresponding oscillatory function is given by

    <\equation>
      <label|eq:oscillatory_function>\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>\<in\>L<rsup|2><around|(|F|)>
      since <around*|\||e<rsup|i \<lambda\>
      t>|\|>=1\<forall\>t,\<lambda\>\<in\>\<bbb-R\>
    </equation>

    then an oscillatory process is a (non-stationary) Gaussian process which
    can be represented as

    <\equation>
      <label|eq:oscillatory_process><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>>>>>>
    </equation>

    where <math|\<Phi\>> is a complex orthogonal random measure with spectral
    measure <math|F> which satisfies the relation

    <\equation>
      <label|eq:orthogonality_phi>d*\<bbb-E\><around|[|\<Phi\><around|(|\<lambda\>|)><wide|\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*d*F<around|(|\<lambda\>|)>
    </equation>

    and has the corresponding covariance kernel

    <\equation>
      <label|eq:oscillatory_covariance><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*F<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>>d*F<around|(|\<lambda\>|)>>>>>>
    </equation>
  </definition>

  <\theorem>
    [Quadratic Integrability Condition]<label|thm:quadratic_integrability>Let
    <math|<around|(|\<Omega\>,\<cal-A\>,\<mu\>|)>> be a
    <math|\<sigma\>>-finite measure space and <math|\<Phi\>> a complex-valued
    orthogonal random measure with second moment measure <math|\<mu\>>. Let
    <math|A:\<bbb-R\>\<times\>\<bbb-R\>\<to\>\<bbb-C\>> be measurable in each
    variable and define <math|\<varphi\><rsub|t><around|(|\<omega\>|)>=A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>>.
    Then for each fixed <math|t\<in\>\<bbb-R\>>, the stochastic integral

    <\equation>
      X<rsub|t>=<big|int><rsub|\<Omega\>>\<varphi\><rsub|t><around|(|\<omega\>|)>*d*\<Phi\><around|(|\<omega\>|)>
    </equation>

    exists if and only if <math|\<varphi\><rsub|t>> is square-integrable with
    respect to <math|\<mu\>>:

    <\equation>
      <big|int><rsub|\<Omega\>><around|\||\<varphi\><rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>\<less\>\<infty\>.
    </equation>

    Equivalently, since <math|<around|\||e<rsup|i*\<omega\>*t>|\|>=1>, this
    condition reduces to

    <\equation>
      <big|int><rsub|\<Omega\>><around|\||A<around|(|t,\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>\<less\>\<infty\>.
    </equation>
  </theorem>

  <\proof>
    For each fixed <math|t>, we have the algebraic identity

    <\equation>
      <around|\||\<varphi\><rsub|t><around|(|\<omega\>|)>|\|><rsup|2>=<around|\||A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>|\|><rsup|2>=<around|\||A<around|(|t,\<omega\>|)>|\|><rsup|2>\<cdot\><around|\||e<rsup|i*\<omega\>*t>|\|><rsup|2>=<around|\||A<around|(|t,\<omega\>|)>|\|><rsup|2>.
    </equation>

    Therefore

    <\equation>
      <big|int><rsub|\<Omega\>><around|\||\<varphi\><rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>=<big|int><rsub|\<Omega\>><around|\||A<around|(|t,\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>.
    </equation>

    The stochastic integral <math|X<rsub|t>> is defined via the Itô isometry:

    <\equation>
      \<bbb-E\><around*|[|<around*|\||<big|int><rsub|\<Omega\>>\<varphi\><rsub|t><around|(|\<omega\>|)>*d*\<Phi\><around|(|\<omega\>|)>|\|><rsup|2>|]>=<big|int><rsub|\<Omega\>><around|\||\<varphi\><rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>.
    </equation>

    Hence the integral exists in <math|L<rsup|2><around|(|\<Omega\>|)>>
    precisely when the right-hand side is finite. The condition on
    <math|A<around|(|t,\<cdot\>|)>> follows immediately.
  </proof>

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
        <label|eq:phi_symmetry>d<wide|\<Phi\><around|(|\<lambda\>|)>|\<bar\>>=d*\<Phi\>*<around|(|-\<lambda\>|)>
      </equation>

      <item>Substituting <eqref|eq:phi_symmetry> into <eqref|eq:Z_conjugate>,

      <\equation>
        <label|eq:Z_conjugate_substituted><wide|Z<around|(|t|)>|\<bar\>>=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>*d*\<Phi\>*<around|(|-\<lambda\>|)>
      </equation>

      <item>Apply the change of variables <math|\<mu\>=-\<lambda\>>, so
      <math|d*\<Phi\>*<around|(|-\<lambda\>|)>=d*\<Phi\><around|(|\<mu\>|)>>
      and <math|e<rsup|-i*\<lambda\>*t>=e<rsup|i*\<mu\>*t>>:

      <\equation>
        <label|eq:change_of_variables><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<wide|Z<around|(|t|)>|\<bar\>>>|<cell|=<big|int><rsub|\<bbb-R\>><wide|A<rsub|t>*<around|(|-\<mu\>|)>|\<bar\>>e<rsup|i*\<mu\>*t>*d*\<Phi\><around|(|\<mu\>|)>>>>>>
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
        <label|eq:osc_func_conjugate><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<varphi\><rsub|t>*<around|(|-\<lambda\>|)>>|<cell|=<wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>>>|<row|<cell|>|<cell|=<wide|A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>|\<bar\>>>>|<row|<cell|>|<cell|=<wide|\<varphi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>>>>>>>
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
    <label|thm:filter_representation><with|font-series|bold|[Filter
    representation]> Let <math|X> be a zero-mean stationary process\ 

    <\equation>
      X<around|(|u|)>=<big|int>e<rsup|i*\<lambda\>*u>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    \ and spectral measure <math|F>, and let <math|Z> be an oscillatory
    process with oscillatory function <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>>
    and the same orthogonal random measure <math|\<Phi\>>. Then

    <\equation>
      <label|eq:filter_representation><tabular|<tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u>>>>>
    </equation>

    where

    <\equation>
      <label|eq:impulse_response_fourier>h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*u>*d*\<lambda\>
    </equation>

    where <math|h<around|(|t,u|)>> is the forward impulse response of
    Definition<nbsp><reference|def:filter_impulse_response>.
  </theorem>

  <\proof>
    <\enumerate>
      <item>Substitute the definitions of <math|h<around|(|t,u|)>> and
      <math|X<around|(|u|)>>:

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*u>*d*\<lambda\>|]><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<mu\>*u>*d*\<Phi\><around|(|\<mu\>|)>|]>*d*u
      </equation>

      <item>Apply Fubini's theorem:

      <\equation>
        =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*u>*d*u|]>*d*\<lambda\>*<space|0.17em>d*\<Phi\><around|(|\<mu\>|)>
      </equation>

      <item>The inner integral over <math|u> is the Fourier representation of
      the Dirac delta:

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|\<mu\>-\<lambda\>|)>*u>*d*u=2*\<pi\>*\<delta\>*<around|(|\<mu\>-\<lambda\>|)>
      </equation>

      <item>Substitute:

      <\equation>
        =<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>\<cdot\>2*\<pi\>*\<delta\>*<around|(|\<mu\>-\<lambda\>|)>*<space|0.17em>d*\<lambda\>*<space|0.17em>d*\<Phi\><around|(|\<mu\>|)>
      </equation>

      <item>Simplify:

      <\equation>
        =<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*\<delta\>*<around|(|\<mu\>-\<lambda\>|)>*<space|0.17em>d*\<lambda\>*<space|0.17em>d*\<Phi\><around|(|\<mu\>|)>
      </equation>

      <item>Apply the sifting property of the delta function:

      <\equation>
        =<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<mu\>|)>*d*\<Phi\><around|(|\<mu\>|)>=Z<around|(|t|)>
      </equation>
    </enumerate>
  </proof>

  <section|Unitarily Time-Changed Stationary
  Processes><label|sec:stationary_timechange>

  <subsection|Unitary Time-Change Operator <math|U<rsub|\<theta\>>*f>>

  <\theorem>
    <label|thm:local_unitarity><with|font-series|bold|[Unitary time-change
    operator <math|U<rsub|\<theta\>>> and its inverse
    <math|U<rsub|\<theta\>><rsup|-1>>]> Let the time-change function
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> be absolutely continuous,
    strictly increasing, and bijective, with

    <\equation>
      <wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0<label|pd>
    </equation>

    almost everywhere and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0>
    only on sets of Lebesgue measure zero. For <math|f> measurable, define

    <\equation>
      <label|eq:U_theta_def><around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Its inverse is given by

    <\equation>
      <label|eq:U_theta_inverse><around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>

    For every compact set <math|K\<subseteq\>\<bbb-R\>> and
    <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>,

    <\equation>
      <label|eq:local_isometry><big|int><rsub|K><around|\||<around|(|U<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2>d*t=<big|int><rsub|\<theta\><around|(|K|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*d*s
    </equation>

    Moreover, <math|U<rsub|\<theta\>><rsup|-1>> is the inverse of
    <math|U<rsub|\<theta\>>> on <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    <\enumerate>
      <item>Let <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>
      and let <math|K\<subset\>\<bbb-R\>> be compact. From the definition
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

      <item>Since <math|\<theta\>\<circ\>\<theta\><rsup|-1>=<math-up|id>>,

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
        <label|eq:left_inverse>U<rsub|\<theta\>><rsup|-1>*U<rsub|\<theta\>>=<math-up|id>
      </equation>

      <item>Similarly, compute:

      <\equation>
        <label|eq:composition_2><around|(|U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)>
      </equation>

      <item>By definition <eqref|eq:U_theta_inverse>,

      <\equation>
        <label|eq:apply_inverse_second><around|(|U<rsub|\<theta\>><rsup|-1>*g|)><around|(|\<theta\><around|(|t|)>|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|\<theta\><around|(|t|)>|)>|)>>>
      </equation>

      <item>Since <math|\<theta\><rsup|-1>\<circ\>\<theta\>=<math-up|id>>,

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
        <label|eq:both_inverses>U<rsub|\<theta\>>*U<rsub|\<theta\>><rsup|-1>=<math-up|id>
      </equation>

      <item>Combining <eqref|eq:left_inverse> and <eqref|eq:both_inverses>,
      <math|U<rsub|\<theta\>><rsup|-1>> is the two-sided inverse of
      <math|U<rsub|\<theta\>>> on <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>.
    </enumerate>
  </proof>

  <subsection|Transformation of Stationary <math|\<to\>> Oscillatory
  Processes via <math|U<rsub|\<theta\>>>>

  <\theorem>
    <label|thm:Utheta_to_osc><with|font-series|bold|[Unitary time changes of
    stationary processes produce oscillatory process]> Let <math|X> be
    zero-mean stationary as in Definition <reference|def:cramer>. For scaling
    function <math|\<theta\>> as in Theorem <reference|thm:local_unitarity>,
    define

    <\equation>
      <label|eq:Z_def><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>>>>>>
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

    and covariance kernel

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\>*<around*|[|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)><wide|<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*\<bbb-E\><around|[|X<around|(|\<theta\><around|(|t|)>|)><wide|X<around|(|\<theta\><around|(|s|)>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>d*F<around|(|\<lambda\>|)>>>>>><label|eq:covariance_Z>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item>From the Cramér representation <eqref|eq:cramer_representation>,

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
      form, define the gain function

      <\equation>
        <label|eq:A_t_explicit>A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>
      </equation>

      <item>Then verify the oscillatory function form
      <eqref|eq:oscillatory_function> factorizes

      <\equation>
        <label|eq:varphi_as_gain><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<varphi\><rsub|t><around|(|\<lambda\>|)>>|<cell|=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<lambda\>*t>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t+t|)>>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>>>>>
      </equation>

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

      <item>By stationarity of <math|X>,\ 

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
    <label|cor:evol_spec>The evolutionary spectrum is

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
        <label|eq:exp_magnitude><around|\||e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>=1
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

  <subsubsection|Time-Varying Filter Representations>

  <text-dots> not necessary<text-dots>

  <subsection|Covariance operator conjugation>

  <\proposition>
    <label|prop:conjugation>Let

    <\equation>
      <label|eq:T_K_def><around|(|T<rsub|K>*f|)><around|(|t|)>\<assign\><big|int><rsub|\<bbb-R\>>K<around|(|<around|\||t-s|\|>|)>*f<around|(|s|)>*d*s
    </equation>

    with stationary kernel

    <\equation>
      <label|eq:K_def>K<around|(|h|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*h>*d*F<around|(|\<lambda\>|)>
    </equation>

    Define the transformed kernel

    <\equation>
      <label|eq:K_theta_def><tabular|<tformat|<table|<row|<cell|K<rsub|\<theta\>><around|(|s,t|)>>|<cell|=<around*|(|U<rsub|t\<rightarrow\>\<theta\><around*|(|t|)>>
      <around*|(|U<rsub|s\<rightarrow\>\<theta\><around*|(|s|)>>
      K|)>|)><around*|(|t,s|)>>>|<row|<cell|>|<cell|=<around*|(|U<rsub|s\<rightarrow\>\<theta\><around*|(|s|)>>
      <around*|(|U<rsub|t\<rightarrow\>\<theta\><around*|(|t|)>>
      K|)>|)><around*|(|t,s|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>>>>>>
    </equation>

    then the corresponding integral covariance operator is conjugated for all
    <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>> by

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

      <item>Combine the square roots <math|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<sqrt|<wide|\<theta\>|\<dot\>><around|(|u|)>>=<sqrt|<wide|\<theta\>|\<dot\>><around*|(|t|)><wide|\<theta\>|\<dot\>><around*|(|s|)>>>
      and recognize definition <eqref|eq:K_theta_def>,

      <\equation>
        <label|eq:K_theta_recognition><sqrt|<wide|\<theta\>|\<dot\>><around*|(|t|)><wide|\<theta\>|\<dot\>><around*|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)>=K<rsub|\<theta\>><around|(|u,t|)>
      </equation>

      <item>Therefore

      <\equation>
        <label|eq:final_conjugation><tabular|<tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|u,t|)>*f<around|(|u|)>*d*u>|<cell|=<big|int><rsub|\<bbb-R\>><sqrt|<wide|\<theta\>|\<dot\>><around*|(|t|)><wide|\<theta\>|\<dot\>><around*|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|u|)>|\|>|)>f<around|(|u|)>*d*u>>|<row|<cell|>|<cell|=<around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>>>>>>
      </equation>

      establishing <eqref|eq:conjugation>.
    </enumerate>
  </proof>

  \;

  <\thebibliography|1>
    <bibitem-with-key|1|stationaryAndRelatedStochasticProcesses>Harald Cramér
    and M.R.<nbsp>Leadbetter. <newblock><with|font-shape|italic|Stationary
    and Related Processes: Sample Function Properties and Their
    Applications>. <newblock>Wiley Series in Probability and Mathematical
    Statistics. 1967.<newblock>

    <bibitem-with-key|2|evolutionarySpectraAndNonStationaryProcesses>Maurice<nbsp>B
    Priestley. <newblock>Evolutionary spectra and non-stationary processes.
    <newblock><with|font-shape|italic|Journal of the Royal Statistical
    Society: Series B (Methodological)>, 27(2):204\U229, 1965.<newblock>
  </thebibliography>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|5>>
    <associate|auto-3|<tuple|2.1|5>>
    <associate|auto-4|<tuple|2.2|7>>
    <associate|auto-5|<tuple|2.2.1|9>>
    <associate|auto-6|<tuple|2.3|9>>
    <associate|auto-7|<tuple|90|10>>
    <associate|bib-evolutionarySpectraAndNonStationaryProcesses|<tuple|2|10>>
    <associate|bib-stationaryAndRelatedStochasticProcesses|<tuple|1|10>>
    <associate|cor:evol_spec|<tuple|8|9>>
    <associate|def:osc_proc|<tuple|2|2>>
    <associate|eq:A_t_explicit|<tuple|64|8>>
    <associate|eq:A_t_magnitude|<tuple|75|9>>
    <associate|eq:A_t_magnitude_start|<tuple|73|9>>
    <associate|eq:K_def|<tuple|78|9>>
    <associate|eq:K_theta_def|<tuple|79|9>>
    <associate|eq:K_theta_recognition|<tuple|89|10>>
    <associate|eq:R_Z_factored|<tuple|68|8>>
    <associate|eq:R_Z_final|<tuple|70|8>>
    <associate|eq:R_Z_start|<tuple|66|8>>
    <associate|eq:R_Z_substituted|<tuple|67|8>>
    <associate|eq:T_K_application|<tuple|82|10>>
    <associate|eq:T_K_def|<tuple|77|9>>
    <associate|eq:U_inv_application|<tuple|83|10>>
    <associate|eq:U_theta_def|<tuple|35|5>>
    <associate|eq:U_theta_inverse|<tuple|36|5>>
    <associate|eq:Utheta_norm_start|<tuple|38|5>>
    <associate|eq:X_covariance|<tuple|69|8>>
    <associate|eq:X_cramer|<tuple|58|7>>
    <associate|eq:X_theta_t|<tuple|59|7>>
    <associate|eq:Z_conjugate|<tuple|17|3>>
    <associate|eq:Z_conjugate_substituted|<tuple|19|3>>
    <associate|eq:Z_def|<tuple|54|7>>
    <associate|eq:Z_expanded|<tuple|60|8>>
    <associate|eq:Z_integral|<tuple|61|8>>
    <associate|eq:Z_oscillatory_form|<tuple|63|8>>
    <associate|eq:Z_representation|<tuple|16|3>>
    <associate|eq:after_substitution|<tuple|41|6>>
    <associate|eq:apply_forward_def|<tuple|44|6>>
    <associate|eq:apply_inverse_def|<tuple|43|6>>
    <associate|eq:apply_inverse_second|<tuple|49|6>>
    <associate|eq:both_inverses|<tuple|53|7>>
    <associate|eq:change_of_variables|<tuple|20|3>>
    <associate|eq:change_var_differential|<tuple|40|6>>
    <associate|eq:change_var_s|<tuple|85|10>>
    <associate|eq:composition_1|<tuple|42|6>>
    <associate|eq:composition_2|<tuple|48|6>>
    <associate|eq:conjugation|<tuple|80|9>>
    <associate|eq:conjugation_expand|<tuple|81|9>>
    <associate|eq:covariance_Z|<tuple|57|7>>
    <associate|eq:evol_spec_def|<tuple|72|9>>
    <associate|eq:evol_spec_final|<tuple|76|9>>
    <associate|eq:evolutionary_spectrum|<tuple|71|9>>
    <associate|eq:exp_magnitude|<tuple|74|9>>
    <associate|eq:expand_square|<tuple|39|5>>
    <associate|eq:factor_inside|<tuple|88|10>>
    <associate|eq:filter_representation|<tuple|26|4>>
    <associate|eq:final_conjugation|<tuple|90|10>>
    <associate|eq:full_expression|<tuple|87|10>>
    <associate|eq:gain_L2|<tuple|1|2>>
    <associate|eq:gain_equality|<tuple|22|4>>
    <associate|eq:gain_function_Z|<tuple|56|7>>
    <associate|eq:gain_symmetry|<tuple|13|3>>
    <associate|eq:impulse_response_fourier|<tuple|27|4>>
    <associate|eq:integral_substitution|<tuple|84|10>>
    <associate|eq:integrand_equality|<tuple|21|4>>
    <associate|eq:left_inverse|<tuple|47|6>>
    <associate|eq:local_isometry|<tuple|37|5>>
    <associate|eq:orthogonality_phi|<tuple|4|2>>
    <associate|eq:osc_func_conjugate|<tuple|24|4>>
    <associate|eq:osc_func_def|<tuple|12|3>>
    <associate|eq:osc_func_neg|<tuple|23|4>>
    <associate|eq:osc_symmetry|<tuple|14|3>>
    <associate|eq:oscillatory_covariance|<tuple|5|2>>
    <associate|eq:oscillatory_function|<tuple|2|2>>
    <associate|eq:oscillatory_function_Z|<tuple|55|7>>
    <associate|eq:oscillatory_process|<tuple|3|2>>
    <associate|eq:phi_symmetry|<tuple|18|3>>
    <associate|eq:real_valued_condition|<tuple|15|3>>
    <associate|eq:right_inverse|<tuple|52|7>>
    <associate|eq:simplify_composition|<tuple|46|6>>
    <associate|eq:simplify_integral|<tuple|86|10>>
    <associate|eq:simplify_second|<tuple|51|7>>
    <associate|eq:theta_composition|<tuple|50|7>>
    <associate|eq:theta_inverse_composition|<tuple|45|6>>
    <associate|eq:varphi_as_gain|<tuple|65|8>>
    <associate|eq:varphi_t_explicit|<tuple|62|8>>
    <associate|pd|<tuple|34|5>>
    <associate|prop:conjugation|<tuple|9|9>>
    <associate|sec:stationary_timechange|<tuple|2|5>>
    <associate|thm:Utheta_to_osc|<tuple|7|7>>
    <associate|thm:filter_representation|<tuple|5|4>>
    <associate|thm:local_unitarity|<tuple|6|5>>
    <associate|thm:quadratic_integrability|<tuple|3|2>>
    <associate|thm:realvaluedness|<tuple|4|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      evolutionarySpectraAndNonStationaryProcesses
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Oscillatory
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Unitarily
      Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Unitary Time-Change Operator
      <with|mode|<quote|math>|U<rsub|\<theta\>>*f>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Transformation of Stationary
      <with|mode|<quote|math>|\<to\>> Oscillatory Processes via
      <with|mode|<quote|math>|U<rsub|\<theta\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|2.2.1<space|2spc>Time-Varying Filter
      Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Covariance operator
      conjugation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>