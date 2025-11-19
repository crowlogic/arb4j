<TeXmacs|2.1.4>

<style|article>

<\body>
  <doc-data|<\doc-title>
    Unitary Time Changes of Stationary Processes Yield Oscillatory Processes
  </doc-title>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|September 16, 2025>>

  <abstract-data|<abstract|A unitary time-change operator
  <math|U<rsub|\<theta\>>> is constructed for absolutely continuous, strictly
  increasing time reparametrizations <math|\<theta\>>, acting on functions
  that are locally square-integrable. Applying <math|U<rsub|\<theta\>>> to
  the Cramér spectral representation of a stationary process yields an
  oscillatory process in the sense of Priestley with oscillatory function
  <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>,
  evolutionary spectrum <math|d*F<rsub|t><around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*F<around|(|\<lambda\>|)>>,
  and expected zero-counting function <math|\<bbb-E\><around|[|N<rsub|<around|[|0,T|]>>|]>=N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>+<frac|<around|[|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|]>|\<pi\>>*<sqrt|-<frac|<wide|K|\<ddot\>><around|(|0|)>|K<around|(|0|)>>>>,
  where <math|N<rsub|<math-up|det>><around|(|<around|[|0,T|]>|)>> counts
  deterministic zeros from critical points of the time-change. The sample
  paths of any non-degenerate second-order stationary process are locally
  square integrable, making the unitary time-change operator
  <math|U<rsub|\<theta\>>> applicable to typical realizations. A
  zero-localization measure <math|d*\<mu\><around|(|t|)>=\<delta\><around|(|Z<around|(|t|)>|)><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*d*t>
  induces a Hilbert space <math|L<rsup|2><around|(|\<mu\>|)>> on the zero set
  of each oscillatory process realization <math|Z<around|(|t|)>>, and the
  multiplication operator <math|<around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>>
  has simple pure point spectrum equal to the zero crossing set of
  <math|Z>.>>

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

  Unless otherwise stated, all processes considered will be real-valued.

  <\theorem>
    <label|asm:real>Let <math|X<around|(|u|)>> be a real-valued process:

    <\equation>
      X<around|(|u|)>\<in\>\<bbb-R\><space|1em>\<forall\>u\<in\>\<bbb-R\><label|eq:1>
    </equation>

    Then its (complex-valued) random orthogonal spectral measure satisfies

    <\equation>
      d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=d*\<Phi\>*<around|(|-\<lambda\>|)><label|eq:2>
    </equation>

    and the corresponding covariance spectral measure <math|F> is even:

    <\equation>
      F*<around|(|-A|)>=F<around|(|A|)><label|eq:3>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item>The spectral representation for <math|X<around|(|u|)>> is

      <\equation>
        X<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
      </equation>

      Since <math|X<around|(|u|)>> is real-valued for each <math|u>,

      <\equation>
        <wide|X<around|(|u|)>|\<bar\>>=X<around|(|u|)>
      </equation>

      On the other hand,

      <\align>
        <tformat|<table|<row|<cell|<wide|X<around|(|u|)>|\<bar\>>>|<cell|=<wide|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>|\<bar\>><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|e<rsup|i*\<lambda\>*u>|\<bar\>><space|0.17em>d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)><eq-number>>>>>
      </align>

      By the substitution <math|\<lambda\>\<mapsto\>-\<mu\>>,

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<mu\>*u>*<space|0.17em>d*<wide|\<Phi\>|\<bar\>><around|(|-\<mu\>|)>
      </equation>

      So

      <\equation>
        X<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*<wide|\<Phi\>|\<bar\>><around|(|-\<lambda\>|)>
      </equation>

      By uniqueness of the spectral measure representation, it follows that

      <\equation>
        d*<wide|\<Phi\>|\<bar\>><around|(|\<lambda\>|)>=d*\<Phi\>*<around|(|-\<lambda\>|)>
      </equation>

      as (orthogonal) random measures.

      <item>The covariance function of <math|X> is

      <\equation>
        R<around|(|u|)>=\<bbb-E\>*<around|(|X<around|(|0|)>*X<around|(|u|)>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*F<around|(|\<lambda\>|)>
      </equation>

      Since <math|X<around|(|u|)>> is real-valued, <math|R<around|(|u|)>> is
      real and <math|R*<around|(|-u|)>=R<around|(|u|)>>. Thus,

      <\align>
        <tformat|<table|<row|<cell|R*<around|(|-u|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*u>*<space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<mu\>*u>*<space|0.17em>d*F*<around|(|-\<mu\>|)><eq-number>>>>>
      </align>

      Equating with <math|R<around|(|u|)>>,

      <\equation>
        <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*F<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*u>*<space|0.17em>d*F*<around|(|-\<lambda\>|)>
      </equation>

      for all <math|u>. By the uniqueness theorem for Fourier\UStieltjes
      transforms, this implies

      <\equation>
        d*F<around|(|\<lambda\>|)>=d*F*<around|(|-\<lambda\>|)>
      </equation>

      Thus for any Borel set <math|A>,

      <\equation>
        F*<around|(|-A|)>=F<around|(|A|)>
      </equation>

      establishing the evenness property.
    </enumerate>
  </proof>

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

  <subsection|Stationary processes>

  <\definition>
    <label|def:cramer><with|font-series|bold|[Cramér spectral
    representation]> <cite|stationaryAndRelatedStochasticProcesses> A
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

  <subsubsection|Fourier Transform Conventions>

  <\definition>
    <label|def:fourier_conventions><with|font-series|bold|[Fourier transform
    conventions]> The forward and inverse Fourier transforms on
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> are defined by

    <\equation>
      <label|eq:fourier_forward><wide|f|^><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|u|)>*e<rsup|-i*\<lambda\>*u>*d*u
    </equation>

    and

    <\equation>
      <label|eq:fourier_inverse>f<around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|f|^><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*u>*d*\<lambda\>
    </equation>

    where the factor <math|<frac|1|2*\<pi\>>> is incorporated into the
    definition of the inverse transform.
  </definition>

  <subsubsection|Sample Path Realizations>

  <\definition>
    <label|def:L2loc><with|font-series|bold|[Locally square-integrable
    functions]> Define

    <\equation>
      L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>\<assign\><around*|{|f:\<bbb-R\>\<to\>\<bbb-C\>:<big|int><rsub|K><around|\||f<around|(|t|)>|\|><rsup|2>*d*t\<less\>\<infty\>*<text|for
      every compact >K\<subseteq\>\<bbb-R\>|}>
    </equation>
  </definition>

  <\remark>
    <label|rem:L2loc_properties>Every bounded measurable set in
    <math|\<bbb-R\>> is contained in a compact set; hence
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>> contains
    functions that are square-integrable on every bounded interval, including
    functions with polynomial growth at infinity.
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
    <math|L<rsup|2><rsub|<math-up|loc>><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Fix an arbitrary bounded interval <math|<around|[|a,b|]>\<subset\>\<bbb-R\>>
    with <math|a\<less\>b>. Define the random variable

    <\equation>
      <label|eq:Yab_def>Y<rsub|<around|[|a,b|]>>\<assign\><big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*d*t
    </equation>

    By Fubini's theorem,

    <\equation>
      \<bbb-E\><around|[|Y<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b>\<bbb-E\><around|[|X<around|(|t|)><rsup|2>|]>*d*t=<around|(|b-a|)>*\<sigma\><rsup|2>\<less\>\<infty\>
    </equation>

    By Markov's inequality, <math|\<bbb-P\>*<around|(|Y<rsub|<around|[|a,b|]>>=\<infty\>|)>=0>.
    Thus <math|Y<rsub|<around|[|a,b|]>>\<less\>\<infty\>> almost surely.
    Covering compacts by countably many dyadic intervals yields the result:
    for every compact <math|K\<subset\>\<bbb-R\>>, almost surely
    <math|<big|int><rsub|K>X<around|(|t|)><rsup|2>*d*t\<less\>\<infty\>>.
  </proof>

  <section|Oscillatory Processes>

  <\definition>
    <label|def:osc_proc><with|font-series|bold|[Oscillatory process]>
    <cite|evolutionarySpectraAndNonStationaryProcesses> Let <math|F> be a
    finite nonnegative Borel measure on <math|\<bbb-R\>>. Let

    <\equation>
      <label|eq:gain_L2>A<rsub|t>\<in\>L<rsup|2><around|(|F|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    be the gain function and

    <\equation>
      <label|eq:oscillatory_function>\<varphi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>
    </equation>

    be the corresponding oscillatory function; then an oscillatory process is
    a stochastic process which can be represented as

    <\equation>
      <label|eq:oscillatory_process><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>>>>>>
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
    <label|thm:existence_osc><with|font-series|bold|[Existence of Oscillatory
    Processes]> Let <math|F> be an absolutely continuous spectral measure and
    the gain function

    <\equation>
      <label|eq:gain_condition>A<rsub|t><around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    be measurable in both time and frequency; then the time-dependent
    spectral density is defined by

    <\equation>
      <label|eq:time_dependent_spectrum><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|S<rsub|t><around|(|\<lambda\>|)>>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<infty\>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*S<around|(|\<lambda\>|)>*d*\<lambda\>>>>>>
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
        <label|eq:simple_function>g<around|(|\<lambda\>|)>=<big|sum><rsub|j=1><rsup|n>c<rsub|j><text|<with|font-series|bold|1>><rsub|E<rsub|j>><around|(|\<lambda\>|)>
      </equation>

      <item>For simple functions, define the stochastic integral

      <\equation>
        <label|eq:integral_simple><big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>\<assign\><big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>
      </equation>

      <item>Compute the second moment:

      <\equation>
        <label|eq:second_moment_simple><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<bbb-E\><around*|[|<around*|\||<big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>|\|><rsup|2>|]>>|<cell|=\<bbb-E\><around*|[|<around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>|\|><rsup|2>|]>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>>>>>>
      </equation>

      <item>By linearity of expectation,

      <\equation>
        <label|eq:linearity_expectation>\<bbb-E\><around*|[|<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>=<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>
      </equation>

      <item>By the orthogonality relation <eqref|eq:orthogonality_phi>, since
      <math|E<rsub|j>\<cap\>E<rsub|k>=\<emptyset\>> for <math|j\<neq\>k>,

      <\equation>
        <label|eq:orthogonality_application>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|F<around|(|E<rsub|j>|)>>|<cell|<text|if
        >j=k>>|<row|<cell|0>|<cell|<text|if >j\<neq\>k>>>>>|\<nobracket\>>
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
      <math|h<around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>> and
      <math|\<epsilon\>\<gtr\>0>, there exists a simple function
      <math|g<around|(|\<lambda\>|)>> such that

      <\equation>
        <label|eq:density_simple><big|int><rsub|\<bbb-R\>><around|\||h<around|(|\<lambda\>|)>-g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<epsilon\>
      </equation>

      <item>By the isometry <eqref|eq:isometry_established> and completeness
      of <math|L<rsup|2><around|(|\<Omega\>|)>>, the integral extends
      uniquely by continuity to all <math|h<around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>>.

      <item>Since <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>> by assumption
      <eqref|eq:gain_condition>, and <math|<around|\||e<rsup|i*\<lambda\>*t>|\|>=1>,

      <\equation>
        <label|eq:varphi_L2><big|int><rsub|\<bbb-R\>><around|\||\<varphi\><rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<infty\>
      </equation>

      so <math|\<varphi\><rsub|t>\<in\>L<rsup|2><around|(|F|)>>.

      <item>Therefore

      <\equation>
        <label|eq:Z_well_defined><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>>>>>>
      </equation>

      is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>>.

      <item>To compute the covariance, use the sesquilinearity of the
      stochastic integral:

      <\equation>
        <label|eq:covariance_computation><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>*<wide|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|s><around|(|\<mu\>|)>*d*\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>>>>>>
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

  <\definition>
    <label|def:filter_impulse_response><with|font-series|bold|[Forward
    impulse response]> For an oscillatory process
    <math|Z<around|(|t|)>=<big|int>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>>
    with oscillatory function <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>>,
    define the forward impulse response function

    <\equation>
      <label|eq:impulse_response_fourier>h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*u>*d*\<lambda\>
    </equation>

    That is, <math|h<around|(|t,\<cdot\>|)>> is the inverse Fourier transform
    (in the variable <math|u>) of the oscillatory function
    <math|\<varphi\><rsub|t><around|(|\<cdummy\>|)>> at time <math|t>, with
    the <math|<frac|1|2*\<pi\>>> factor as in
    Definition<nbsp><reference|def:fourier_conventions>.
  </definition>

  <\theorem>
    <label|thm:filter_representation><with|font-series|bold|[Filter
    representation via impulse response]> Let <math|X> be a zero-mean
    stationary process with Cramér representation
    <math|X<around|(|u|)>=<big|int>e<rsup|i*\<lambda\>*u>*d*\<Phi\><around|(|\<lambda\>|)>>
    and spectral measure <math|F>, and let <math|Z> be an oscillatory process
    with oscillatory function <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>>
    and the same orthogonal random measure <math|\<Phi\>>. Then

    <\equation>
      <label|eq:filter_representation>Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u
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
        <label|eq:h_explicit>h<around|(|t,u|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*\<delta\>*<around|(|u-\<theta\><around|(|t|)>|)>
      </equation>

      establishing <eqref|eq:Z_transformation>.

      <item>To verify this as a specialization of the Fourier-based impulse
      response from Definition<nbsp><reference|def:filter_impulse_response>,
      substitute <math|\<varphi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<theta\><around|(|t|)>>>:

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
    <dueto|Bulinskaya><label|thm:bulinskaya>Let <math|X<around|(|t|)>> be a
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
    <dueto|Expected Zero-Counting Function with Deterministic
    Atoms><label|thm:kac_rice_merged>Let <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
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
    <associate|asm:real|<tuple|1|2>>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|3.2.1|13>>
    <associate|auto-11|<tuple|3.3|16>>
    <associate|auto-12|<tuple|4|18>>
    <associate|auto-13|<tuple|4.1|21>>
    <associate|auto-14|<tuple|213|24>>
    <associate|auto-2|<tuple|1.1|3>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|auto-4|<tuple|1.2.1|4>>
    <associate|auto-5|<tuple|1.2.2|4>>
    <associate|auto-6|<tuple|2|4>>
    <associate|auto-7|<tuple|3|10>>
    <associate|auto-8|<tuple|3.1|10>>
    <associate|auto-9|<tuple|3.2|12>>
    <associate|bib-evolutionarySpectraAndNonStationaryProcesses|<tuple|2|24>>
    <associate|bib-stationaryAndRelatedStochasticProcesses|<tuple|1|24>>
    <associate|cor:evol_spec|<tuple|16|16>>
    <associate|def:Hmu|<tuple|20|19>>
    <associate|def:L|<tuple|22|20>>
    <associate|def:L2loc|<tuple|5|4>>
    <associate|def:cramer|<tuple|3|3>>
    <associate|def:filter_impulse_response|<tuple|11|9>>
    <associate|def:fourier_conventions|<tuple|4|4>>
    <associate|def:gaussian_process|<tuple|2|3>>
    <associate|def:osc_proc|<tuple|8|4>>
    <associate|def:zeromeasure|<tuple|18|18>>
    <associate|eq:1|<tuple|1|2>>
    <associate|eq:2|<tuple|2|2>>
    <associate|eq:3|<tuple|3|2>>
    <associate|eq:A_t_explicit|<tuple|100|13>>
    <associate|eq:A_t_magnitude|<tuple|133|16>>
    <associate|eq:A_t_magnitude_start|<tuple|131|16>>
    <associate|eq:H_isomorphism|<tuple|164|19>>
    <associate|eq:K_def|<tuple|136|16>>
    <associate|eq:K_theta_def|<tuple|137|16>>
    <associate|eq:K_theta_recognition|<tuple|147|17>>
    <associate|eq:L2_norm_mu|<tuple|166|19>>
    <associate|eq:L2_norm_simple|<tuple|53|7>>
    <associate|eq:L_action|<tuple|174|20>>
    <associate|eq:L_basis|<tuple|182|21>>
    <associate|eq:L_def|<tuple|173|20>>
    <associate|eq:L_domain|<tuple|175|20>>
    <associate|eq:Lf_g_inner|<tuple|177|20>>
    <associate|eq:Lf_substitution|<tuple|178|20>>
    <associate|eq:R_Z_factored|<tuple|104|13>>
    <associate|eq:R_Z_final|<tuple|106|13>>
    <associate|eq:R_Z_start|<tuple|102|13>>
    <associate|eq:R_Z_substituted|<tuple|103|13>>
    <associate|eq:T_K_application|<tuple|140|17>>
    <associate|eq:T_K_def|<tuple|135|16>>
    <associate|eq:U_inv_application|<tuple|141|17>>
    <associate|eq:U_theta_def|<tuple|71|10>>
    <associate|eq:U_theta_inverse|<tuple|72|10>>
    <associate|eq:Utheta_norm_start|<tuple|74|10>>
    <associate|eq:X_covariance|<tuple|105|13>>
    <associate|eq:X_cramer|<tuple|94|12>>
    <associate|eq:X_sifting|<tuple|114|14>>
    <associate|eq:X_sifting_inverse|<tuple|120|15>>
    <associate|eq:X_theta_t|<tuple|95|12>>
    <associate|eq:Yab_def|<tuple|24|4>>
    <associate|eq:Z_conjugate|<tuple|36|5>>
    <associate|eq:Z_conjugate_substituted|<tuple|38|6>>
    <associate|eq:Z_def|<tuple|90|12>>
    <associate|eq:Z_expanded|<tuple|96|12>>
    <associate|eq:Z_integral|<tuple|97|12>>
    <associate|eq:Z_oscillatory_form|<tuple|99|13>>
    <associate|eq:Z_representation|<tuple|35|5>>
    <associate|eq:Z_sifting|<tuple|115|14>>
    <associate|eq:Z_sifting_inverse|<tuple|119|15>>
    <associate|eq:Z_transformation|<tuple|107|13>>
    <associate|eq:Z_well_defined|<tuple|57|8>>
    <associate|eq:after_substitution|<tuple|77|10>>
    <associate|eq:apply_forward_def|<tuple|80|11>>
    <associate|eq:apply_inverse_def|<tuple|79|11>>
    <associate|eq:apply_inverse_second|<tuple|85|11>>
    <associate|eq:basis_expansion|<tuple|172|20>>
    <associate|eq:basis_inner_product|<tuple|171|20>>
    <associate|eq:basis_vectors|<tuple|165|19>>
    <associate|eq:both_inverses|<tuple|89|11>>
    <associate|eq:cancel_derivative|<tuple|159|19>>
    <associate|eq:change_of_variables|<tuple|39|6>>
    <associate|eq:change_var_differential|<tuple|76|10>>
    <associate|eq:change_var_s|<tuple|143|17>>
    <associate|eq:composition_1|<tuple|78|11>>
    <associate|eq:composition_2|<tuple|84|11>>
    <associate|eq:composition_forward|<tuple|122|15>>
    <associate|eq:conjugate_t|<tuple|179|21>>
    <associate|eq:conjugation|<tuple|138|17>>
    <associate|eq:conjugation_expand|<tuple|139|17>>
    <associate|eq:covariance_Z|<tuple|93|12>>
    <associate|eq:covariance_computation|<tuple|58|8>>
    <associate|eq:covariance_final|<tuple|61|8>>
    <associate|eq:covariance_kernel|<tuple|17|3>>
    <associate|eq:cramer_representation|<tuple|18|3>>
    <associate|eq:delta_Z_decomp|<tuple|157|18>>
    <associate|eq:delta_change_var|<tuple|153|18>>
    <associate|eq:delta_decomposition|<tuple|151|18>>
    <associate|eq:delta_equality|<tuple|156|18>>
    <associate|eq:density_simple|<tuple|55|8>>
    <associate|eq:eigenvalue_equation|<tuple|184|21>>
    <associate|eq:evol_spec_def|<tuple|130|16>>
    <associate|eq:evol_spec_final|<tuple|134|16>>
    <associate|eq:evolutionary_spectrum|<tuple|129|16>>
    <associate|eq:exp_magnitude|<tuple|132|16>>
    <associate|eq:expand_square|<tuple|75|10>>
    <associate|eq:f_Lg_inner|<tuple|180|21>>
    <associate|eq:factor_inside|<tuple|146|17>>
    <associate|eq:filter_representation|<tuple|63|9>>
    <associate|eq:final_conjugation|<tuple|148|17>>
    <associate|eq:finite_variance|<tuple|23|4>>
    <associate|eq:forward_unitary_recall|<tuple|112|14>>
    <associate|eq:fourier_forward|<tuple|20|4>>
    <associate|eq:fourier_inverse|<tuple|21|4>>
    <associate|eq:fubini_composition|<tuple|123|15>>
    <associate|eq:fubini_stochastic|<tuple|59|8>>
    <associate|eq:full_expression|<tuple|145|17>>
    <associate|eq:g_explicit|<tuple|121|15>>
    <associate|eq:gain_L2|<tuple|26|4>>
    <associate|eq:gain_condition|<tuple|44|6>>
    <associate|eq:gain_equality|<tuple|41|6>>
    <associate|eq:gain_function_Z|<tuple|92|12>>
    <associate|eq:gain_symmetry|<tuple|32|5>>
    <associate|eq:h_explicit|<tuple|116|14>>
    <associate|eq:impulse_response_fourier|<tuple|62|9>>
    <associate|eq:impulse_simplification|<tuple|127|16>>
    <associate|eq:inner_product_mu|<tuple|162|19>>
    <associate|eq:integral_simple|<tuple|48|7>>
    <associate|eq:integral_substitution|<tuple|142|17>>
    <associate|eq:integrand_equality|<tuple|40|6>>
    <associate|eq:interchange_sum_integral|<tuple|155|18>>
    <associate|eq:inverse_impulse_response|<tuple|111|14>>
    <associate|eq:inverse_transformation|<tuple|110|14>>
    <associate|eq:inverse_unitary_recall|<tuple|118|15>>
    <associate|eq:isometry_Psi|<tuple|170|20>>
    <associate|eq:isometry_established|<tuple|54|8>>
    <associate|eq:isometry_simple|<tuple|52|7>>
    <associate|eq:isomorphism_map|<tuple|169|20>>
    <associate|eq:left_inverse|<tuple|83|11>>
    <associate|eq:linearity_expectation|<tuple|50|7>>
    <associate|eq:local_isometry|<tuple|73|10>>
    <associate|eq:mu_atomic|<tuple|152|18>>
    <associate|eq:mu_atomic_assumption|<tuple|163|19>>
    <associate|eq:mu_atomic_final|<tuple|161|19>>
    <associate|eq:mu_def|<tuple|150|18>>
    <associate|eq:mu_substitution|<tuple|158|19>>
    <associate|eq:mu_sum|<tuple|160|19>>
    <associate|eq:norm_equivalence|<tuple|168|19>>
    <associate|eq:norm_sum|<tuple|167|19>>
    <associate|eq:orthogonality_application|<tuple|51|7>>
    <associate|eq:orthogonality_integral|<tuple|60|8>>
    <associate|eq:orthogonality_phi|<tuple|29|5>>
    <associate|eq:osc_func_conjugate|<tuple|43|6>>
    <associate|eq:osc_func_def|<tuple|31|5>>
    <associate|eq:osc_func_neg|<tuple|42|6>>
    <associate|eq:osc_symmetry|<tuple|33|5>>
    <associate|eq:oscillatory_covariance|<tuple|30|5>>
    <associate|eq:oscillatory_function|<tuple|27|5>>
    <associate|eq:oscillatory_function_Z|<tuple|91|12>>
    <associate|eq:oscillatory_process|<tuple|28|5>>
    <associate|eq:oscillatory_well_defined|<tuple|46|7>>
    <associate|eq:phi_symmetry|<tuple|37|6>>
    <associate|eq:real_valued_condition|<tuple|34|5>>
    <associate|eq:right_inverse|<tuple|88|11>>
    <associate|eq:second_moment_simple|<tuple|49|7>>
    <associate|eq:self_adjoint|<tuple|181|21>>
    <associate|eq:sift_basis|<tuple|183|21>>
    <associate|eq:sifting_property|<tuple|113|14>>
    <associate|eq:simple_function|<tuple|47|7>>
    <associate|eq:simple_zeros|<tuple|149|18>>
    <associate|eq:simplify_composition|<tuple|82|11>>
    <associate|eq:simplify_integral|<tuple|144|17>>
    <associate|eq:simplify_second|<tuple|87|11>>
    <associate|eq:spectrum|<tuple|176|20>>
    <associate|eq:spectrum_result|<tuple|185|21>>
    <associate|eq:stationary_covariance|<tuple|19|3>>
    <associate|eq:sum_form|<tuple|154|18>>
    <associate|eq:theta_composition|<tuple|86|11>>
    <associate|eq:theta_inverse_composition|<tuple|81|11>>
    <associate|eq:time_dependent_spectrum|<tuple|45|6>>
    <associate|eq:varphi_L2|<tuple|56|8>>
    <associate|eq:varphi_as_gain|<tuple|101|13>>
    <associate|eq:varphi_t_explicit|<tuple|98|12>>
    <associate|pd|<tuple|70|10>>
    <associate|prop:atomic|<tuple|21|19>>
    <associate|prop:conjugation|<tuple|17|16>>
    <associate|rem:L2loc_properties|<tuple|6|4>>
    <associate|sec:HP|<tuple|4|18>>
    <associate|sec:stationary_timechange|<tuple|3|10>>
    <associate|thm:Utheta_to_osc|<tuple|14|12>>
    <associate|thm:atomicity|<tuple|19|18>>
    <associate|thm:bulinskaya|<tuple|24|21>>
    <associate|thm:existence_osc|<tuple|10|6>>
    <associate|thm:filter_representation|<tuple|12|9>>
    <associate|thm:inverse_filter|<tuple|15|13>>
    <associate|thm:kac_rice_merged|<tuple|25|22>>
    <associate|thm:local_unitarity|<tuple|13|10>>
    <associate|thm:paths_loc|<tuple|7|4>>
    <associate|thm:realvaluedness|<tuple|9|5>>
    <associate|thm:spectrum|<tuple|23|20>>
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

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Fourier Transform
      Conventions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Sample Path Realizations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Unitarily
      Time-Changed Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Unitary Time-Change Operator
      <with|mode|<quote|math>|U<rsub|\<theta\>>*f>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Transformation of Stationary
      <with|mode|<quote|math>|\<to\>> Oscillatory Processes via
      <with|mode|<quote|math>|U<rsub|\<theta\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|3.2.1<space|2spc>Time-Varying Filter
      Representations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Covariance operator
      conjugation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Zero
      Localization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Simplicity of Zeros and
      Their Expected Counting Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>