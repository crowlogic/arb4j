<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems|alt-colors|bluish>>

<\body>
  <doc-data|<doc-title|Unitary Time Changes of Stationary Processes Yield
  Oscillatory Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|September 16, 2025>>

  <\abstract>
    A unitary time-change operator <math|U<rsub|\<theta\>>> is constructed
    for absolutely continuous, strictly increasing time reparametrizations
    <math|\<theta\>>, acting on functions that are locally square-integrable.
    Applying <math|U<rsub|\<theta\>>> to the Cramér spectral representation
    of a stationary process yields an oscillatory process in the sense of
    Priestley with oscillatory function <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>,
    evolutionary spectrum <math|d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*F<around|(|\<lambda\>|)>>,
    and expected zero-counting function <math|\<bbb-E\><around|[|N<rsub|<around|[|0,T|]>>|]>=N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>+<frac|<around|[|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|]>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>>,
    where <math|N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>> counts
    deterministic zeros from critical points of the time-change. The sample
    paths of any non-degenerate second-order stationary process are locally
    square integrable, making the unitary time-change operator
    <math|U<rsub|\<theta\>>> applicable to typical realizations. A
    zero-localization measure <math|d*\<mu\><around|(|t|)>=\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t>
    induces a Hilbert space <math|L<rsup|2><around|(|\<mu\>|)>> on the zero
    set of each oscillatory process realization <math|Z<around|(|t|)>>, and
    the multiplication operator <math|<around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>>
    has simple pure point spectrum equal to the zero crossing set of
    <math|Z>.
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

    <with|par-left|2tab|1.2.1<space|2spc>Fourier Transform Conventions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|2tab|1.2.2<space|2spc>Sample Path Realizations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Unitarily
    Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Unitary Time-Change Operator
    <with|mode|math|U<rsub|\<theta\>>*f> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.2<space|2spc>Transformation of Stationary
    <with|mode|math|\<to\>> Oscillatory Processes via
    <with|mode|math|U<rsub|\<theta\>>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|2tab|3.2.1<space|2spc>Time-Varying Filter Representations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|3.3<space|2spc>Covariance operator conjugation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Zero
    Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Simplicity of Zeros and Their Expected
    Counting Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>
  </table-of-contents>

  <section|Gaussian Processes>

  <text-dots> include Section 1 <text-dots>

  <section|Oscillatory Processes>

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
      satisfy the symmetry property from Theorem <reference|asm:real>:

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

  <subsubsection|Time-Varying Filter Representations>

  <\theorem>
    <label|thm:inverse_filter>Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
    be absolutely continuous, strictly increasing, and bijective with
    <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0> almost everywhere.
    Let <math|X<around|(|u|)>> be a stationary process, and define the
    oscillatory process obtained by the forward unitary time transformation
    <math|U<rsub|\<theta\>>>

    <\equation>
      <label|eq:Z_transformation>Z<around|(|t|)>=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>=<big|int><rsub|\<bbb-R\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u
    </equation>

    where the forward impulse response function is given by

    <\equation>
      h<around|(|t,u|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>
    </equation>

    For the unitary time-change case, this impulse response is a
    specialization of the general impulse response from
    Definition<nbsp><reference|def:filter_impulse_response>. Specifically,
    with <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>,
    the Fourier-based impulse response

    <\equation>
      h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*e<rsup|-i*\<lambda\>*u>*d*\<lambda\>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>
    </equation>

    simplifies to the Dirac form via the inverse Fourier transform.

    Then likewise the transformation can be reversed by expressing the
    stationary process as

    <\equation>
      <label|eq:inverse_transformation>X<around|(|u|)>=<around|(|U<rsub|\<theta\>><rsup|-1>*Z|)><around|(|u|)>=<frac|Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>=<big|int><rsub|\<bbb-R\>>g<around|(|u,t|)>*Z<around|(|t|)>*d*t
    </equation>

    where the inverse impulse response function is

    <\equation>
      <label|eq:inverse_impulse_response>g<around|(|u,t|)>=<frac|\<delta\>*<around|(|t-\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item>Recall the forward unitary transformation from Theorem
      <reference|thm:local_unitarity>:

      <\equation>
        <label|eq:forward_unitary_recall>Z<around|(|t|)>=<around|(|U<rsub|\<theta\>>*X|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>
      </equation>

      <item>To express this as a convolution integral, note that the Dirac
      delta function satisfies the sifting property: for any continuous
      function <math|f:\<bbb-R\>\<to\>\<bbb-R\>>,

      <\equation>
        <label|eq:sifting_property><big|int><rsub|\<bbb-R\>>f<around|(|u|)>*\<delta\>*<around|(|u-a|)>*d*u=f<around|(|a|)>
      </equation>

      for any <math|a\<in\>\<bbb-R\>>.

      <item>Substituting <math|f<around|(|u|)>=X<around|(|u|)>> and
      <math|a=\<theta\><around|(|t|)>>, which is well-defined since
      <math|\<theta\>> is bijective and continuous,

      <\equation>
        <label|eq:X_sifting>X<around|(|\<theta\><around|(|t|)>|)>=<big|int><rsub|\<bbb-R\>>X<around|(|u|)>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>*d*u
      </equation>

      <item>Multiplying both sides by <math|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>
      and substituting into <eqref|eq:forward_unitary_recall>,

      <\equation>
        <label|eq:Z_sifting>Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>X<around|(|u|)>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>*d*u=<big|int><rsub|\<bbb-R\>><around*|[|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>|]>*X<around|(|u|)>*d*u
      </equation>

      <item>Thus, the forward impulse response function is

      <\equation>
        <label|eq:h_explicit><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|h<around|(|t,u|)>>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*u>*d*\<lambda\>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>>>>>>
      </equation>

      establishing <eqref|eq:Z_transformation>.

      <item>To verify this as a specialization of the Fourier-based impulse
      response from <eqref|filterGain>, substitute
      <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>:

      <\equation>
        h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>*e<rsup|-i*\<lambda\>*u>*d*\<lambda\>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<frac|1|2*\<pi\>>*<big|int>e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-u|)>>*d*\<lambda\>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>
      </equation>

      by the standard Fourier representation of the Dirac delta.

      <item>For the inverse transformation, recall from Theorem
      <reference|thm:local_unitarity> that

      <\equation>
        <label|eq:inverse_unitary_recall>X<around|(|u|)>=<around|(|U<rsub|\<theta\>><rsup|-1>*Z|)><around|(|u|)>=<frac|Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>
      </equation>

      <item>Let <math|s=\<theta\><rsup|-1><around|(|u|)>>, so
      <math|u=\<theta\><around|(|s|)>> and
      <math|Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>=Z<around|(|s|)>>.
      The sifting property applied to <math|Z<around|(|t|)>> with point
      <math|\<theta\><rsup|-1><around|(|u|)>> gives

      <\equation>
        <label|eq:Z_sifting_inverse>Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>=<big|int><rsub|\<bbb-R\>>Z<around|(|t|)>*\<delta\>*<around|(|t-\<theta\><rsup|-1><around|(|u|)>|)>*d*t
      </equation>

      <item>Substituting into <eqref|eq:inverse_unitary_recall>,

      <\equation>
        <label|eq:X_sifting_inverse>X<around|(|u|)>=<frac|1|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>*<big|int><rsub|\<bbb-R\>>Z<around|(|t|)>*\<delta\>*<around|(|t-\<theta\><rsup|-1><around|(|u|)>|)>*d*t=<big|int><rsub|\<bbb-R\>><around*|[|<frac|\<delta\>*<around|(|t-\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>|]>*Z<around|(|t|)>*d*t
      </equation>

      <item>Thus, the inverse impulse response function is

      <\equation>
        <label|eq:g_explicit>g<around|(|u,t|)>=<frac|\<delta\>*<around|(|t-\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>
      </equation>

      establishing <eqref|eq:inverse_transformation> and
      <eqref|eq:inverse_impulse_response>.

      <item>To confirm invertibility, substitute <eqref|eq:Z_sifting> into
      <eqref|eq:X_sifting_inverse>. The integral becomes

      <\equation>
        <label|eq:composition_forward>X<around|(|u|)>=<big|int><rsub|\<bbb-R\>>g<around|(|u,t|)><around*|[|<big|int><rsub|\<bbb-R\>>h<around|(|t,v|)>*X<around|(|v|)>*d*v|]>*d*t
      </equation>

      <item>By Fubini's theorem, since all measures are positive and the
      delta functions ensure finite support,

      <\equation>
        <label|eq:fubini_composition>X<around|(|u|)>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>g<around|(|u,t|)>*h<around|(|t,v|)>*X<around|(|v|)>*d*v*<space|0.17em>d*t
      </equation>

      <item>Integrating the impulse response composition

      <\equation>
        g<around|(|u,t|)>*h<around|(|t,v|)>=<frac|\<delta\>*<around|(|t-\<theta\><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>\<cdot\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|v-\<theta\><around|(|t|)>|)>
      </equation>

      over <math|t> results in <math|t=\<theta\><rsup|-1><around|(|u|)>>, so

      <\equation>
        <sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>
      </equation>

      and

      <\equation>
        \<delta\>*<around|(|v-\<theta\><around|(|t|)>|)>=\<delta\>*<around|(|v-u|)>
      </equation>

      yielding

      <\equation>
        <label|eq:impulse_simplification><big|int><rsub|\<bbb-R\>>g<around|(|u,t|)>*h<around|(|t,v|)>*d*t=\<delta\>*<around|(|v-u|)>
      </equation>

      <item>Thus, <eqref|eq:fubini_composition> simplifies to

      <\equation>
        <big|int><rsub|\<bbb-R\>>\<delta\>*<around|(|v-u|)>*X<around|(|v|)>*d*v=X<around|(|u|)>
      </equation>

      confirming the transformations are inverses.
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
      <label|eq:K_theta_def>K<rsub|\<theta\>><around|(|s,t|)>\<assign\><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
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
    <label|def:zeromeasure>Let <math|Z> be real-valued with
    <math|Z\<in\>C<rsup|1><around|(|\<bbb-R\>|)>> having only simple zeros

    <\equation>
      <label|eq:simple_zeros>Z<around|(|t<rsub|0>|)>=0\<Rightarrow\><wide|Z|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0
    </equation>

    Define, for Borel <math|B\<subset\>\<bbb-R\>>,

    <\equation>
      <label|eq:mu_def>\<mu\><around|(|B|)>=<big|int><rsub|\<bbb-R\>><text|<with|font-series|bold|1>><rsub|B><around|(|t|)>*\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t
    </equation>
  </definition>

  <\theorem>
    <label|thm:atomicity>Under the assumptions of Definition
    <reference|def:zeromeasure>, zeros are locally finite and one has

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
        <label|eq:mu_substitution>\<mu\><around|(|B|)>=<big|int><rsub|\<bbb-R\>><text|<with|font-series|bold|1>><rsub|B><around|(|t|)>*<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t
      </equation>

      <item>By the sifting property of the delta function,
      <math|<around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>> evaluated at
      <math|t=t<rsub|0>> gives <math|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>:

      <\equation>
        <label|eq:cancel_derivative><big|int><rsub|\<bbb-R\>><text|<with|font-series|bold|1>><rsub|B><around|(|t|)><frac|\<delta\>*<around|(|t-t<rsub|0>|)>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t=<frac|<text|<with|font-series|bold|1>><rsub|B><around|(|t<rsub|0>|)><around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>|<around|\||<wide|Z|\<dot\>><around|(|t<rsub|0>|)>|\|>>=<text|<with|font-series|bold|1>><rsub|B><around|(|t<rsub|0>|)>
      </equation>

      <item>Summing over all zeros,

      <\equation>
        <label|eq:mu_sum>\<mu\><around|(|B|)>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0><text|<with|font-series|bold|1>><rsub|B><around|(|t<rsub|0>|)>=<big|sum><rsub|t<rsub|0>\<in\>B:Z<around|(|t<rsub|0>|)>=0>1
      </equation>

      <item>This is precisely the atomic measure

      <\equation>
        <label|eq:mu_atomic_final>\<mu\>=<big|sum><rsub|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0>\<delta\><rsub|t<rsub|0>>
      </equation>

      establishing <eqref|eq:mu_atomic>.
    </enumerate>
  </proof>

  <\definition>
    <label|def:Hmu>Let <math|\<cal-H\>=L<rsup|2><around|(|\<mu\>|)>> be the
    Hilbert space with inner product

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
      <math|e<rsub|t<rsub|0>>>), so the spectrum is simple and given by the
      closure of the zero set

      <\equation>
        <label|eq:spectrum_result>\<sigma\><around|(|L|)>=<around|{|t<rsub|0>:Z<around|(|t<rsub|0>|)>=0|}>=<wide|<around|{|t\<in\>\<bbb-R\>:Z<around|(|t|)>=0|}>|\<bar\>>
      </equation>
    </enumerate>
  </proof>

  <subsection|Simplicity of Zeros and Their Expected Counting Function>

  <\theorem>
    [Bulinskaya]<label|thm:bulinskaya>Let <math|X<around|(|t|)>> be a
    centered stationary Gaussian process with covariance function
    <math|K<around|(|h|)>=\<bbb-E\>*<around|[|X<around|(|t|)>*X*<around|(|t+h|)>|]>>
    that is twice differentiable at <math|h=0> with
    <math|K<around|(|0|)>\<gtr\>0> and <math|<wide|K|\<ddot\>><around|(|0|)>\<less\>0>.
    Then the zero set of <math|X> has no accumulation points almost surely.
    In particular, on any compact interval <math|<around|[|a,b|]>>, the
    number of zeros is almost surely finite.
  </theorem>

  <\proof>
    <\enumerate>
      <item>The twice-differentiability of <math|K> at <math|h=0> implies
      that the spectral measure <math|F> has finite second moment:

      <\equation>
        \<lambda\><rsub|2>=<big|int><rsub|\<bbb-R\>>\<omega\><rsup|2>*d*F<around|(|\<omega\>|)>=-<wide|K|\<ddot\>><around|(|0|)>\<less\>\<infty\>.
      </equation>

      <item>This finite second moment implies that <math|X> has mean-square
      continuous derivative <math|<wide|X|\<dot\>><around|(|t|)>>, with

      <\equation>
        \<bbb-E\><around|[|<wide|X|\<dot\>><around|(|t|)><rsup|2>|]>=-<wide|K|\<ddot\>><around|(|0|)>=\<lambda\><rsub|2>\<gtr\>0.
      </equation>

      <item>Since <math|<wide|X|\<dot\>><around|(|t|)>> is a non-degenerate
      centered Gaussian process, it is continuous almost surely and does not
      vanish identically on any interval.

      <item>For any zero <math|t<rsub|0>> of <math|X> (i.e.,
      <math|X<around|(|t<rsub|0>|)>=0>), if
      <math|<wide|X|\<dot\>><around|(|t<rsub|0>|)>\<ne\>0>, then <math|X>
      crosses transversally through zero at <math|t<rsub|0>>, making
      <math|t<rsub|0>> an isolated zero.

      <item>The joint distribution of <math|<around|(|X<around|(|t<rsub|0>|)>,<wide|X|\<dot\>><around|(|t<rsub|0>|)>|)>>
      is bivariate Gaussian with covariance matrix

      <\equation>
        <around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|K<around|(|0|)>>|<cell|K<rprime|'><around|(|0|)>>>|<row|<cell|K<rprime|'><around|(|0|)>>|<cell|-<wide|K|\<ddot\>><around|(|0|)>>>>>>|)>=<around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|K<around|(|0|)>>|<cell|0>>|<row|<cell|0>|<cell|-<wide|K|\<ddot\>><around|(|0|)>>>>>>|)>,
      </equation>

      where <math|K<rprime|'><around|(|0|)>=0> by evenness of <math|K>. Since
      <math|X> and <math|<wide|X|\<dot\>>> are uncorrelated Gaussians, they
      are independent.

      <item>At any zero <math|t<rsub|0>> of <math|X>, the derivative
      <math|<wide|X|\<dot\>><around|(|t<rsub|0>|)>> is Gaussian with mean
      zero and variance <math|-<wide|K|\<ddot\>><around|(|0|)>\<gtr\>0>,
      hence

      <\equation>
        \<bbb-P\>*<around|[|<wide|X|\<dot\>><around|(|t<rsub|0>|)>=0\<mid\>X<around|(|t<rsub|0>|)>=0|]>=\<bbb-P\>*<around|[|<wide|X|\<dot\>><around|(|t<rsub|0>|)>=0|]>=0.
      </equation>

      Thus almost surely <math|<wide|X|\<dot\>><around|(|t<rsub|0>|)>\<ne\>0>,
      making <math|t<rsub|0>> an isolated zero.

      <item>Since every zero of <math|X> is isolated almost surely, the zero
      set can have no accumulation points almost surely.

      <item>On a compact interval <math|<around|[|a,b|]>>, a set with no
      accumulation points is finite, completing the proof.
    </enumerate>
  </proof>

  <\theorem>
    [Expected Zero-Counting Function with Deterministic
    Atoms]<label|thm:kac_rice_merged>Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
    be <math|C<rsup|1>> (continuously differentiable), strictly increasing,
    and bijective with <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<ge\>0>
    for all <math|t> and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0>
    almost everywhere. Define the zero-derivative set

    <\equation>
      T<rsub|0>\<assign\><around|{|t\<in\>\<bbb-R\>:<wide|\<theta\>|\<dot\>><around|(|t|)>=0|}>
    </equation>

    and assume that <math|T<rsub|0>> is at most countable with no
    accumulation points on any compact interval. Let <math|X> be a centered
    stationary Gaussian process with spectral measure <math|F> and covariance
    function

    <\equation>
      K<around|(|h|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*h>*<space|0.17em>d*F<around|(|\<omega\>|)>
    </equation>

    twice differentiable at <math|h=0> with
    <math|<wide|K|\<ddot\>><around|(|0|)>\<less\>0> and
    <math|K<around|(|0|)>\<gtr\>0>. Define the unitarily time-changed process

    <\equation>
      Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Then <math|Z> is a centered Gaussian process with covariance

    <\equation>
      K<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>K*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
    </equation>

    For any compact interval <math|<around|[|0,T|]>>, define

    <\equation>
      N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>\<assign\>#<around|(|T<rsub|0>\<cap\><around|[|0,T|]>|)>
    </equation>

    By the assumption on <math|T<rsub|0>>,
    <math|N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>> is finite. The
    expected number of zeros of <math|Z> in <math|<around|[|0,T|]>>
    decomposes as

    <\equation>
      \<bbb-E\><around|[|N<rsub|<around|[|0,T|]>><around|(|Z|)>|]>=N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>+<frac|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item>Define

      <\equation>
        T<rsub|0>\<assign\><around|{|t\<in\>\<bbb-R\>:<wide|\<theta\>|\<dot\>><around|(|t|)>=0|}>,<space|2em>I<rsub|T>\<assign\><around|[|0,T|]>\<setminus\>T<rsub|0>
      </equation>

      For any <math|t<rsub|0>\<in\>T<rsub|0>>,

      <\equation>
        Z<around|(|t<rsub|0>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t<rsub|0>|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t<rsub|0>|)>|)>=0\<cdot\>X<around|(|\<theta\><around|(|t<rsub|0>|)>|)>=0
      </equation>

      so each <math|t<rsub|0>\<in\>T<rsub|0>> is a deterministic zero of
      <math|Z> on every sample path.

      <item>By the assumption that <math|T<rsub|0>> has no accumulation
      points on compact intervals, <math|T<rsub|0>\<cap\><around|[|0,T|]>> is
      finite. Thus

      <\equation>
        N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>=#<around|(|T<rsub|0>\<cap\><around|[|0,T|]>|)>\<less\>\<infty\>.
      </equation>

      <item>On the complement <math|I<rsub|T>=<around|[|0,T|]>\<setminus\>T<rsub|0>>,
      the derivative satisfies <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0>,
      hence

      <\equation>
        Z<around|(|t|)>=0<space|1em>\<Longleftrightarrow\><space|1em>X<around|(|\<theta\><around|(|t|)>|)>=0,<space|2em>t\<in\>I<rsub|T>
      </equation>

      Define

      <\equation>
        Y<around|(|t|)>\<assign\>X<around|(|\<theta\><around|(|t|)>|)>.
      </equation>

      The random zero set of <math|Z> on <math|<around|[|0,T|]>> coincides
      with the zero set of <math|Y> on <math|I<rsub|T>>, and the total zero
      count decomposes as

      <\equation>
        N<rsub|<around|[|0,T|]>><around|(|Z|)>=N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>+N<rsub|<math-up|rand>><around|(|<around|[|0,T|]>|)>
      </equation>

      where <math|N<rsub|<math-up|rand>><around|(|<around|[|0,T|]>|)>> counts
      zeros of <math|Y> in <math|I<rsub|T>>.

      <item>For <math|t,s\<in\>\<bbb-R\>>,

      <\equation>
        K<rsub|Y><around|(|t,s|)>=\<bbb-E\>*<around|[|X<around|(|\<theta\><around|(|t|)>|)>*X<around|(|\<theta\><around|(|s|)>|)>|]>=K*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
      </equation>

      Differentiate with respect to <math|s>:

      <\equation>
        <frac|\<partial\>|\<partial\>*s>*K<rsub|Y><around|(|s,t|)>=-<wide|\<theta\>|\<dot\>><around|(|s|)>*<space|0.17em><wide|K|\<dot\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
      </equation>

      Since <math|K<around|(|h|)>> is even,
      <math|<wide|K|\<dot\>><around|(|0|)>=0>. Taking <math|s\<to\>t>,

      <\equation>
        lim<rsub|s\<to\>t> <frac|\<partial\>|\<partial\>*s>*K<rsub|Y><around|(|s,t|)>=0
      </equation>

      <item>The mixed partial derivative is

      <\equation>
        <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|Y><around|(|t,s|)>=-<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>*<space|0.17em><wide|K|\<ddot\>>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
      </equation>

      Taking <math|s\<to\>t>,

      <\equation>
        lim<rsub|s\<to\>t> <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|Y><around|(|t,s|)>=-<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<wide|K|\<ddot\>><around|(|0|)>
      </equation>

      Also <math|K<rsub|Y><around|(|t,t|)>=K<around|(|0|)>>.

      <item>The Kac\URice zero intensity for <math|Y> on <math|I<rsub|T>> is

      <\equation>
        \<rho\><rsub|Y><around|(|t|)>=<frac|1|\<pi\>>*<sqrt|<frac|K<rsub|Y><around|(|t,t|)>\<cdot\>lim<rsub|s\<to\>t>
        <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|Y><around|(|t,s|)>-<around*|(|lim<rsub|s\<to\>t>
        <frac|\<partial\>|\<partial\>*s>*K<rsub|Y><around|(|s,t|)>|)><rsup|2>|K<rsub|Y><around|(|t,t|)><rsup|2>>>
      </equation>

      Substituting,

      <\equation>
        K<rsub|Y><around|(|t,t|)>\<cdot\>lim<rsub|s\<to\>t>
        <frac|\<partial\><rsup|2>|\<partial\>*s*\<partial\>*t>*K<rsub|Y><around|(|t,s|)>-0<rsup|2>=K<around|(|0|)>\<cdot\><around|(|-<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<wide|K|\<ddot\>><around|(|0|)>|)>=K<around|(|0|)>*<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>
      </equation>

      Therefore,

      <\equation>
        \<rho\><rsub|Y><around|(|t|)>=<frac|1|\<pi\>>*<sqrt|<frac|<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>*<around|(|-<wide|K|\<ddot\>><around|(|0|)>|)>|K<around|(|0|)>>>=<frac|<wide|\<theta\>|\<dot\>><around|(|t|)>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>
      </equation>

      <item>The expected random zero count is

      <\equation>
        \<bbb-E\><around|[|N<rsub|<math-up|rand>><around|(|<around|[|0,T|]>|)>|]>=<big|int><rsub|I<rsub|T>>\<rho\><rsub|Y><around|(|t|)>*<space|0.17em>d*t
      </equation>

      Since <math|T<rsub|0>> is countable (hence Lebesgue measure zero),

      <\equation>
        \<bbb-E\><around|[|N<rsub|<math-up|rand>><around|(|<around|[|0,T|]>|)>|]>=<big|int><rsub|0><rsup|T><frac|<wide|\<theta\>|\<dot\>><around|(|t|)>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>*<space|0.17em>d*t=<frac|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>
      </equation>

      <item>The total zero count factors as

      <\equation>
        N<rsub|<around|[|0,T|]>><around|(|Z|)>=N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>+N<rsub|<math-up|rand>><around|(|<around|[|0,T|]>|)>
      </equation>

      so

      <\equation>
        \<bbb-E\><around|[|N<rsub|<around|[|0,T|]>><around|(|Z|)>|]>=N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>+<frac|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>
      </equation>
    </enumerate>
  </proof>

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
    <associate|auto-10|<tuple|177|22>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|7>>
    <associate|auto-4|<tuple|3.1|7>>
    <associate|auto-5|<tuple|3.2|9>>
    <associate|auto-6|<tuple|3.2.1|11>>
    <associate|auto-7|<tuple|3.3|14>>
    <associate|auto-8|<tuple|4|15>>
    <associate|auto-9|<tuple|4.1|19>>
    <associate|bib-evolutionarySpectraAndNonStationaryProcesses|<tuple|2|22>>
    <associate|bib-stationaryAndRelatedStochasticProcesses|<tuple|1|22>>
    <associate|cor:evol_spec|<tuple|8|13>>
    <associate|def:Hmu|<tuple|12|16>>
    <associate|def:L|<tuple|14|18>>
    <associate|def:filter_impulse_response|<tuple|4|6>>
    <associate|def:osc_proc|<tuple|1|2>>
    <associate|def:zeromeasure|<tuple|10|15>>
    <associate|eq:A_t_explicit|<tuple|64|10>>
    <associate|eq:A_t_magnitude|<tuple|97|14>>
    <associate|eq:A_t_magnitude_start|<tuple|95|13>>
    <associate|eq:H_isomorphism|<tuple|128|17>>
    <associate|eq:K_def|<tuple|100|14>>
    <associate|eq:K_theta_def|<tuple|101|14>>
    <associate|eq:K_theta_recognition|<tuple|111|15>>
    <associate|eq:L2_norm_mu|<tuple|130|17>>
    <associate|eq:L2_norm_simple|<tuple|34|5>>
    <associate|eq:L_action|<tuple|138|18>>
    <associate|eq:L_basis|<tuple|146|19>>
    <associate|eq:L_def|<tuple|137|18>>
    <associate|eq:L_domain|<tuple|139|18>>
    <associate|eq:Lf_g_inner|<tuple|141|18>>
    <associate|eq:Lf_substitution|<tuple|142|18>>
    <associate|eq:R_Z_factored|<tuple|68|10>>
    <associate|eq:R_Z_final|<tuple|70|11>>
    <associate|eq:R_Z_start|<tuple|66|10>>
    <associate|eq:R_Z_substituted|<tuple|67|10>>
    <associate|eq:T_K_application|<tuple|104|14>>
    <associate|eq:T_K_def|<tuple|99|14>>
    <associate|eq:U_inv_application|<tuple|105|14>>
    <associate|eq:U_theta_def|<tuple|35|7>>
    <associate|eq:U_theta_inverse|<tuple|36|7>>
    <associate|eq:Utheta_norm_start|<tuple|38|7>>
    <associate|eq:X_covariance|<tuple|69|10>>
    <associate|eq:X_cramer|<tuple|58|9>>
    <associate|eq:X_sifting|<tuple|78|12>>
    <associate|eq:X_sifting_inverse|<tuple|84|12>>
    <associate|eq:X_theta_t|<tuple|59|9>>
    <associate|eq:Z_conjugate|<tuple|17|3>>
    <associate|eq:Z_conjugate_substituted|<tuple|19|3>>
    <associate|eq:Z_def|<tuple|54|9>>
    <associate|eq:Z_expanded|<tuple|60|10>>
    <associate|eq:Z_integral|<tuple|61|10>>
    <associate|eq:Z_oscillatory_form|<tuple|63|10>>
    <associate|eq:Z_representation|<tuple|16|3>>
    <associate|eq:Z_sifting|<tuple|79|12>>
    <associate|eq:Z_sifting_inverse|<tuple|83|12>>
    <associate|eq:Z_transformation|<tuple|71|11>>
    <associate|eq:Z_well_defined|<tuple|38|5>>
    <associate|eq:after_substitution|<tuple|41|8>>
    <associate|eq:apply_forward_def|<tuple|44|8>>
    <associate|eq:apply_inverse_def|<tuple|43|8>>
    <associate|eq:apply_inverse_second|<tuple|49|8>>
    <associate|eq:basis_expansion|<tuple|136|18>>
    <associate|eq:basis_inner_product|<tuple|135|17>>
    <associate|eq:basis_vectors|<tuple|129|17>>
    <associate|eq:both_inverses|<tuple|53|9>>
    <associate|eq:cancel_derivative|<tuple|123|16>>
    <associate|eq:change_of_variables|<tuple|20|3>>
    <associate|eq:change_var_differential|<tuple|40|8>>
    <associate|eq:change_var_s|<tuple|107|14>>
    <associate|eq:composition_1|<tuple|42|8>>
    <associate|eq:composition_2|<tuple|48|8>>
    <associate|eq:composition_forward|<tuple|86|13>>
    <associate|eq:conjugate_t|<tuple|143|18>>
    <associate|eq:conjugation|<tuple|102|14>>
    <associate|eq:conjugation_expand|<tuple|103|14>>
    <associate|eq:covariance_Z|<tuple|57|9>>
    <associate|eq:covariance_computation|<tuple|39|6>>
    <associate|eq:covariance_final|<tuple|42|6>>
    <associate|eq:delta_Z_decomp|<tuple|121|16>>
    <associate|eq:delta_change_var|<tuple|117|16>>
    <associate|eq:delta_decomposition|<tuple|115|15>>
    <associate|eq:delta_equality|<tuple|120|16>>
    <associate|eq:density_simple|<tuple|36|5>>
    <associate|eq:eigenvalue_equation|<tuple|148|19>>
    <associate|eq:evol_spec_def|<tuple|94|13>>
    <associate|eq:evol_spec_final|<tuple|98|14>>
    <associate|eq:evolutionary_spectrum|<tuple|93|13>>
    <associate|eq:exp_magnitude|<tuple|96|13>>
    <associate|eq:expand_square|<tuple|39|7>>
    <associate|eq:f_Lg_inner|<tuple|144|18>>
    <associate|eq:factor_inside|<tuple|110|15>>
    <associate|eq:filter_representation|<tuple|26|6>>
    <associate|eq:final_conjugation|<tuple|112|15>>
    <associate|eq:forward_unitary_recall|<tuple|76|11>>
    <associate|eq:fubini_composition|<tuple|87|13>>
    <associate|eq:fubini_stochastic|<tuple|40|6>>
    <associate|eq:full_expression|<tuple|109|15>>
    <associate|eq:g_explicit|<tuple|85|12>>
    <associate|eq:gain_L2|<tuple|1|2>>
    <associate|eq:gain_condition|<tuple|25|4>>
    <associate|eq:gain_equality|<tuple|22|4>>
    <associate|eq:gain_function_Z|<tuple|56|9>>
    <associate|eq:gain_symmetry|<tuple|13|3>>
    <associate|eq:h_explicit|<tuple|80|12>>
    <associate|eq:impulse_response_fourier|<tuple|27|6>>
    <associate|eq:impulse_simplification|<tuple|91|13>>
    <associate|eq:inner_product_mu|<tuple|126|16>>
    <associate|eq:integral_simple|<tuple|29|4>>
    <associate|eq:integral_substitution|<tuple|106|14>>
    <associate|eq:integrand_equality|<tuple|21|4>>
    <associate|eq:interchange_sum_integral|<tuple|119|16>>
    <associate|eq:inverse_impulse_response|<tuple|75|11>>
    <associate|eq:inverse_transformation|<tuple|74|11>>
    <associate|eq:inverse_unitary_recall|<tuple|82|12>>
    <associate|eq:isometry_Psi|<tuple|134|17>>
    <associate|eq:isometry_established|<tuple|35|5>>
    <associate|eq:isometry_simple|<tuple|33|5>>
    <associate|eq:isomorphism_map|<tuple|133|17>>
    <associate|eq:left_inverse|<tuple|47|8>>
    <associate|eq:linearity_expectation|<tuple|31|5>>
    <associate|eq:local_isometry|<tuple|37|7>>
    <associate|eq:mu_atomic|<tuple|116|15>>
    <associate|eq:mu_atomic_assumption|<tuple|127|17>>
    <associate|eq:mu_atomic_final|<tuple|125|16>>
    <associate|eq:mu_def|<tuple|114|15>>
    <associate|eq:mu_substitution|<tuple|122|16>>
    <associate|eq:mu_sum|<tuple|124|16>>
    <associate|eq:norm_equivalence|<tuple|132|17>>
    <associate|eq:norm_sum|<tuple|131|17>>
    <associate|eq:orthogonality_application|<tuple|32|5>>
    <associate|eq:orthogonality_integral|<tuple|41|6>>
    <associate|eq:orthogonality_phi|<tuple|4|2>>
    <associate|eq:osc_func_conjugate|<tuple|24|4>>
    <associate|eq:osc_func_def|<tuple|12|3>>
    <associate|eq:osc_func_neg|<tuple|23|4>>
    <associate|eq:osc_symmetry|<tuple|14|3>>
    <associate|eq:oscillatory_covariance|<tuple|5|2>>
    <associate|eq:oscillatory_function|<tuple|2|2>>
    <associate|eq:oscillatory_function_Z|<tuple|55|9>>
    <associate|eq:oscillatory_process|<tuple|3|2>>
    <associate|eq:oscillatory_well_defined|<tuple|27|4>>
    <associate|eq:phi_symmetry|<tuple|18|3>>
    <associate|eq:real_valued_condition|<tuple|15|3>>
    <associate|eq:right_inverse|<tuple|52|9>>
    <associate|eq:second_moment_simple|<tuple|30|5>>
    <associate|eq:self_adjoint|<tuple|145|18>>
    <associate|eq:sift_basis|<tuple|147|19>>
    <associate|eq:sifting_property|<tuple|77|11>>
    <associate|eq:simple_function|<tuple|28|4>>
    <associate|eq:simple_zeros|<tuple|113|15>>
    <associate|eq:simplify_composition|<tuple|46|8>>
    <associate|eq:simplify_integral|<tuple|108|15>>
    <associate|eq:simplify_second|<tuple|51|9>>
    <associate|eq:spectrum|<tuple|140|18>>
    <associate|eq:spectrum_result|<tuple|149|19>>
    <associate|eq:sum_form|<tuple|118|16>>
    <associate|eq:theta_composition|<tuple|50|9>>
    <associate|eq:theta_inverse_composition|<tuple|45|8>>
    <associate|eq:time_dependent_spectrum|<tuple|26|4>>
    <associate|eq:varphi_L2|<tuple|37|5>>
    <associate|eq:varphi_as_gain|<tuple|65|10>>
    <associate|eq:varphi_t_explicit|<tuple|62|10>>
    <associate|pd|<tuple|34|7>>
    <associate|prop:atomic|<tuple|13|17>>
    <associate|prop:conjugation|<tuple|9|14>>
    <associate|sec:HP|<tuple|4|15>>
    <associate|sec:stationary_timechange|<tuple|3|7>>
    <associate|thm:Utheta_to_osc|<tuple|6|9>>
    <associate|thm:atomicity|<tuple|11|15>>
    <associate|thm:bulinskaya|<tuple|16|19>>
    <associate|thm:existence_osc|<tuple|4|4>>
    <associate|thm:filter_representation|<tuple|4|6>>
    <associate|thm:inverse_filter|<tuple|7|11>>
    <associate|thm:kac_rice_merged|<tuple|17|20>>
    <associate|thm:local_unitarity|<tuple|5|7>>
    <associate|thm:quadratic_integrability|<tuple|2|2>>
    <associate|thm:realvaluedness|<tuple|3|3>>
    <associate|thm:spectrum|<tuple|15|18>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      evolutionarySpectraAndNonStationaryProcesses
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gaussian
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Unitarily
      Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Unitary Time-Change Operator
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|U<rsub|\<theta\>>*f>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Transformation of Stationary
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<to\>>>
      Oscillatory Processes via <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|U<rsub|\<theta\>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|3.2.1<space|2spc>Time-Varying Filter
      Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Covariance operator
      conjugation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Zero
      Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Simplicity of Zeros and
      Their Expected Counting Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>