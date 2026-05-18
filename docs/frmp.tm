<TeXmacs|2.1.5>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <\hide-preamble>
    <assign|C|<macro|\<bbb-C\>>>

    <assign|R|<macro|\<bbb-R\>>>

    <assign|Z|<macro|\<bbb-Z\>>>

    <assign|N|<macro|\<bbb-N\>>>

    <assign|Lk|<macro|\<cal-L\>>>

    <assign|Imu|<macro|I<rsup|\<mu\>>>>

    <assign|Dmu|<macro|D<rsup|\<mu\>>>>

    <assign|Icomu|<macro|I<rsup|1-\<mu\>>>>

    <assign|Psimu|<macro|\<Psi\><rsub|\<mu\>>>>
  </hide-preamble>

  <doc-data|<doc-title|The Fractional Riccati--Müntz--Padé
  Theorem>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|May 17, 2026>>

  <abstract-data|<\abstract>
    The classical theory of Padé approximation achieves its deepest results
    when the function being approximated is meromorphic outside a compact set
    of minimal logarithmic capacity<emdash>Stahl's compact. The present paper
    extends this circle of ideas to solutions of fractional Riccati
    equations. Specifically, for the equation

    <\equation*>
      D<rsup|\<mu\>>*y=P<around|(|u|)>+Q<around|(|u|)>*<space|0.17em>y+R<around|(|u|)>*<space|0.17em>y<rsup|2>
    </equation*>

    with polynomial coefficients <math|P,Q,R\<in\>\<bbb-C\><around|[|u|]>>,
    order <math|\<mu\>\<in\><around|(|0,1|]>>, and homogeneous
    Riemann--Liouville initial condition, we prove that the unique solution
    <math|y<around|(|t,u|)>> equals the limit, in logarithmic capacity, of
    its near-diagonal Müntz--Padé approximants of type
    <math|<around|[|M-1/M|]>> in the variable <math|z=t<rsup|\<mu\>>>. (The
    denomination ``diagonal'' is standard because the denominator sequence is
    identical to that of the <math|<around|[|M/M|]>> table; see
    Section<nbsp><reference|sec:padeconv> for the precise convention.)

    The argument turns on three interlocking observations. First, the
    solution admits an expansion <math|y=<big|sum><rsub|k>a<around|(|k,u|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>>
    whose coefficients obey an explicit recurrence<emdash>the Müntz--Tau
    recurrence<emdash>driven by the Fox--Wright weights
    <math|\<psi\><rsub|k>=\<Gamma\>*<around|(|k*\<mu\>+1|)>/\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>>.
    Second, the generating function <math|A<around|(|z,u|)>=<big|sum><rsub|k>a<around|(|k,u|)>*<space|0.17em>z<rsup|k>>
    satisfies a Hadamard-product fixed-point equation
    <math|A=\<Psi\><rsub|\<mu\>>\<odot\>B<around|[|A|]>>, linking it to an
    auxiliary function <math|F<around|(|z,u|)>> that satisfies an explicit
    algebraic quadratic and therefore inherits a Stahl compact directly.
    Third, a Mellin--Barnes integral representation<emdash>valid under a
    Gevrey-1 growth condition on the Borel transform of
    <math|B<around|[|A|]>><emdash>transfers meromorphic continuation from the
    pole structure of <math|\<Psi\><rsub|\<mu\>>> to <math|A>, and a
    self-consistent fixed-point argument then places <math|K<rsub|A>> inside
    <math|K<rsub|F>>.

    The Padé denominators are identified as the orthogonal polynomials of the
    moment functional <math|\<cal-L\><around|[|x<rsup|k>|]>=a<around|(|k,u|)>>,
    computed by the Chebyshev--Wheeler algorithm, and the convergence theorem
    is a direct application of Stahl's theorem to the resulting diagonal
    sequence.
  </abstract>>

  <section|Setup and Notation>

  The Riemann\ULiouville calculus provides the natural framework for
  fractional Riccati equations. We record the two operators and their
  fundamental interplay before stating the equation.

  <\definition>
    [Riemann\ULiouville operators]<label|def:RL> For
    <math|\<mu\>\<in\><around|(|0,1|]>> and <math|f> locally integrable on
    <math|<around|(|0,\<infty\>|)>>, the fractional integral and derivative
    of order <math|\<mu\>> are

    <\align*>
      <tformat|<table|<row|<cell|<Imu>f<around|(|t|)>>|<cell|\<assign\><frac|1|\<Gamma\><around|(|\<mu\>|)>>*<big|int><rsub|0><rsup|t><around|(|t-s|)><rsup|\<mu\>-1>*f<around|(|s|)>*<space|0.17em>d*s,>>|<row|<cell|<vspace*|6pt><Dmu>f<around|(|t|)>>|<cell|\<assign\><frac|d|d*t><around*|(|<Icomu>f|)><around|(|t|)>.>>>>
    </align*>
  </definition>

  The most basic computational fact about <math|I<rsup|\<mu\>>> is how it
  acts on monomials. The following power rule, whose proof is a clean
  Beta\UGamma computation, will be invoked repeatedly throughout the paper.

  <\lemma>
    [Power rule]<label|lem:power> For <math|s\<gtr\>-1>,

    <\equation*>
      <Imu>t<rsup|s><space|0.27em>=<space|0.27em><frac|\<Gamma\>*<around|(|s+1|)>|\<Gamma\>*<around|(|s+\<mu\>+1|)>>*<space|0.17em>t<rsup|s+\<mu\>>.
    </equation*>
  </lemma>

  <\proof>
    Substitute <math|\<sigma\>=t*\<tau\>> in the defining integral to obtain

    <\equation*>
      <Imu>t<rsup|s><space|0.27em>=<space|0.27em><frac|t<rsup|s+\<mu\>>*<space|0.17em>B<around|(|\<mu\>,<space|0.17em>s+1|)>|\<Gamma\><around|(|\<mu\>|)>>,
    </equation*>

    and apply the Beta\UGamma identity <math|B<around|(|\<mu\>,s+1|)>=\<Gamma\><around|(|\<mu\>|)>*\<Gamma\>*<around|(|s+1|)>/\<Gamma\>*<around|(|s+\<mu\>+1|)>>.
    The factors <math|\<Gamma\><around|(|\<mu\>|)>> cancel, leaving the
    stated formula.
  </proof>

  With these operators in hand, the equation under study is as follows.

  <\definition>
    [Fractional Riccati equation]<label|def:fRic>

    <\equation>
      <label|eq:fRic><Dmu>y<around|(|t,u|)><space|0.27em>=<space|0.27em>P<around|(|u|)>+Q<around|(|u|)>*<space|0.17em>y<around|(|t,u|)>+R<around|(|u|)>*<space|0.17em>y<around|(|t,u|)><rsup|2>,<space|2em><Icomu>y<around|(|0,u|)>=0,
    </equation>

    with <math|P,Q,R\<in\><C><around|[|u|]>>. The initial condition
    <math|I<rsup|1-\<mu\>>*y<around|(|0,u|)>=0> is the standard
    Riemann\ULiouville homogeneous condition for order
    <math|\<mu\>\<in\><around|(|0,1|]>>.
  </definition>

  The Volterra reformulation replaces the fractional derivative with an
  integral operator, making the equation amenable to fixed-point and
  power-series methods.

  <\lemma>
    [Volterra form]<label|lem:Volt> Equation<nbsp><eqref|eq:fRic> is
    equivalent to the Volterra integral equation

    <\equation>
      <label|eq:Volt>y<space|0.27em>=<space|0.27em><Imu><space|-0.17em><around*|[|P+Q*<space|0.17em>y+R*<space|0.17em>y<rsup|2>|]>.
    </equation>
  </lemma>

  <\proof>
    Apply <math|I<rsup|\<mu\>>> to both sides of<nbsp><eqref|eq:fRic>. The
    Riemann\ULiouville composition theorem <cite-detail|SKM|Theorem<nbsp>2.4>
    gives

    <\equation*>
      <Imu><Dmu>y<space|0.27em>=<space|0.27em>y<space|0.27em>-<space|0.27em><around*|[|I<rsup|1-\<mu\>>*y|]><around|(|0<rsup|+>|)>\<cdot\><frac|t<rsup|\<mu\>-1>|\<Gamma\><around|(|\<mu\>|)>>,
    </equation*>

    and the homogeneous initial condition
    <math|I<rsup|1-\<mu\>>*y<around|(|0,u|)>=0> kills the boundary term,
    leaving <math|<Imu><Dmu>y=y>.
  </proof>

  <section|The Fox\UWright Weights>

  The key structural feature of the fractional Riccati equation is that the
  operator <math|<Imu>> acts on the Müntz monomials <math|t<rsup|k*\<mu\>>>
  by simple scalar multiplication. The scalars that appear are the
  Fox\UWright weights <math|\<psi\><rsub|k>>, and their generating function
  <math|<Psimu>> is the kernel that governs all subsequent integral
  representations.

  <\definition>
    [Fox\UWright weights and kernel]<label|def:psi>

    <\equation*>
      \<psi\><rsub|k><space|0.27em>\<assign\><space|0.27em><frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>>,<space|1em>k\<ge\>0,<space|2em><Psimu><around|(|z|)><space|0.27em>\<assign\><space|0.27em><big|sum><rsub|k=0><rsup|\<infty\>>\<psi\><rsub|k>*<space|0.17em>z<rsup|k>.
    </equation*>
  </definition>

  <\lemma>
    [Eigenvalue action of <math|<Imu>>]<label|lem:psi_eig> For every
    <math|k\<ge\>0>,

    <\equation*>
      <Imu>t<rsup|<around|(|k+1|)>*\<mu\>><space|0.27em>=<space|0.27em>\<psi\><rsub|k+1>*<space|0.17em>t<rsup|<around|(|k+2|)>*\<mu\>>.
    </equation*>
  </lemma>

  <\proof>
    Apply Lemma<nbsp><reference|lem:power> with
    <math|s=<around|(|k+1|)>*\<mu\>> and read off the ratio of Gamma values
    as <math|\<psi\><rsub|k+1>>.
  </proof>

  <\lemma>
    [Radius of convergence]<label|lem:Psimu_radius> The series <math|<Psimu>>
    has radius of convergence exactly <math|1>.
  </lemma>

  <\proof>
    Stirling's approximation gives <math|\<psi\><rsub|k>\<sim\><around|(|\<mu\>*k|)><rsup|-\<mu\>>>
    as <math|k\<to\>\<infty\>>. Therefore

    <\equation*>
      <around|\||\<psi\><rsub|k>|\|><rsup|1/k><space|0.27em>=<space|0.27em>e<rsup|-<around|(|\<mu\>/k|)>*log
      <around|(|\<mu\>*k|)><space|0.27em>+<space|0.27em>o<around|(|1/k|)>><space|0.27em>\<longrightarrow\><space|0.27em>1,
    </equation*>

    so <math|limsup<rsub|k><around|\||\<psi\><rsub|k>|\|><rsup|1/k>=1>, and
    the Cauchy\UHadamard theorem gives radius <math|1>.
  </proof>

  <section|The Müntz\UTau Series>

  We now exploit the eigenvalue structure of
  Lemma<nbsp><reference|lem:psi_eig> to solve the Volterra equation by a
  Müntz-type power series. The Banach fixed-point theorem guarantees local
  existence and uniqueness; matching coefficients at each lattice exponent
  <math|<around|(|k+1|)>*\<mu\>> then produces a fully explicit recurrence
  for the solution.

  <\theorem>
    [Müntz\UTau recurrence]<label|thm:Muntz> The unique solution
    of<nbsp><eqref|eq:Volt> admits the expansion

    <\equation*>
      y<around|(|t,u|)><space|0.27em>=<space|0.27em><big|sum><rsub|k=0><rsup|\<infty\>>a<around|(|k,u|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>
    </equation*>

    on <math|<around|[|0,T<rsub|0>|]>> for some <math|T<rsub|0>\<gtr\>0>,
    with coefficients satisfying

    <\align>
      <tformat|<table|<row|<cell|a<around|(|0,u|)>>|<cell|<space|0.27em>=<space|0.27em>P<around|(|u|)>*<space|0.17em>\<psi\><rsub|0>,<eq-number><label|eq:a0>>>|<row|<cell|<vspace*|4pt>a<around|(|k,u|)>>|<cell|<space|0.27em>=<space|0.27em>\<psi\><rsub|k>*<space|-0.17em><around*|(|Q<around|(|u|)>*<space|0.17em>a<around|(|k-1,u|)><space|0.27em>+<space|0.27em>R<around|(|u|)>*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em><space|-0.17em>a<around|(|j,u|)>*<space|0.17em>a<around|(|\<ell\>,u|)>|)>,<space|1em>k\<ge\>1.<eq-number><label|eq:ak>>>>>
    </align>
  </theorem>

  <\proof>
    The map <math|\<cal-T\><around|[|y|]>=<Imu><around|(|P+Q*y+R*y<rsup|2>|)>>
    is a contraction on <math|C*<around|[|0,T<rsub|0>|]>> for
    <math|T<rsub|0><rsup|\<mu\>>> sufficiently small, since
    <math|<around|\<\|\|\>|\<cal-T\><around|[|y|]>-\<cal-T\><around|[|<wide|y|~>|]>|\<\|\|\>>\<lesssim\>T<rsub|0><rsup|\<mu\>>*<around|\<\|\|\>|y-<wide|y|~>|\<\|\|\>>>.
    The Banach fixed-point theorem gives existence and uniqueness.
    Substituting the Müntz ansatz <math|y=<big|sum><rsub|k>a<around|(|k|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>>
    into <math|y=\<cal-T\><around|[|y|]>>, applying
    Lemma<nbsp><reference|lem:psi_eig> to evaluate each
    <math|I<rsup|\<mu\>><around|[|t<rsup|<around|(|k+1|)>*\<mu\>>|]>>, and
    expanding <math|y<rsup|2>> via the Cauchy product

    <\equation*>
      y<rsup|2><space|0.27em>=<space|0.27em><big|sum><rsub|n=0><rsup|\<infty\>><around*|(|<big|sum><rsub|j+\<ell\>=n>a<around|(|j,u|)>*<space|0.17em>a<around|(|\<ell\>,u|)>|)>*t<rsup|<around|(|n+2|)>*\<mu\>>,
    </equation*>

    one matches coefficients of <math|t<rsup|<around|(|k+1|)>*\<mu\>>> on
    both sides. At order <math|k=0> the only contribution is
    <math|I<rsup|\<mu\>>*P=P*\<psi\><rsub|0>*t<rsup|\<mu\>>>, giving
    <eqref|eq:a0>. At order <math|k\<ge\>1> the <math|Q>-linear term
    contributes <math|\<psi\><rsub|k>*Q*a*<around|(|k-1|)>> and the
    <math|R>-quadratic term contributes <math|\<psi\><rsub|k>*R*<big|sum><rsub|j+\<ell\>=k-1>a<around|(|j|)>*a<around|(|\<ell\>|)>>,
    giving <eqref|eq:ak>.
  </proof>

  <section|The Algebraic Quadratic via Generating Functions>

  The recurrence<nbsp><eqref|eq:ak> determines the coefficients
  <math|a<around|(|k,u|)>> one at a time but does not immediately reveal the
  global analytic properties of their generating function
  <math|A<around|(|z,u|)>=<big|sum><rsub|k>a<around|(|k,u|)>*<space|0.17em>z<rsup|k>>.
  To access those properties we introduce an auxiliary generating function
  <math|F> whose defining recurrence, while different from that of <math|A>,
  is precisely the one that closes into an algebraic quadratic equation. The
  distinction between <math|F> and <math|A> is fundamental and is made
  explicit in Remark<nbsp><reference|rem:Fdistinct>.

  <paragraph|Conventions.> For <math|b<around|(|z|)>=<big|sum><rsub|n>b<rsub|n>*z<rsup|n>\<in\><C><around|[|u|]><around|[|<around|[|z|]>|]>>,
  write <math|<around|[|z<rsup|k>|]>*b\<assign\>b<rsub|k>>. The two products
  used throughout are

  <\align*>
    <tformat|<table|<row|<cell|<around|[|z<rsup|k>|]>*<around|(|F\<cdot\>G|)>>|<cell|<space|0.27em>=<space|0.27em><big|sum><rsub|j=0><rsup|k>f<rsub|j>*<space|0.17em>g<rsub|k-j><space|4em><text|(Cauchy
    product)>,>>|<row|<cell|<vspace*|4pt><around|[|z<rsup|k>|]>*<around|(|F\<odot\>G|)>>|<cell|<space|0.27em>=<space|0.27em>f<rsub|k>*<space|0.17em>g<rsub|k><space|4em><text|(Hadamard
    product)>.>>>>
  </align*>

  <\definition>
    [Auxiliary generating function]<label|def:F> Set
    <math|f*<around|(|0,u|)>\<assign\>P<around|(|u|)>*\<psi\><rsub|0>> and,
    for <math|k\<ge\>1>,

    <\equation>
      <label|eq:fk>f*<around|(|k,u|)><space|0.27em>\<assign\><space|0.27em>Q<around|(|u|)>*<space|0.17em>f*<around|(|k-1,u|)><space|0.27em>+<space|0.27em>R<around|(|u|)>*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em><space|-0.17em>f*<around|(|j,u|)>*<space|0.17em>f*<around|(|\<ell\>,u|)><space|0.27em>+<space|0.27em>P<around|(|u|)>*<space|0.17em>\<psi\><rsub|k>.
    </equation>

    Define <math|F<around|(|z,u|)>\<assign\><big|sum><rsub|k=0><rsup|\<infty\>>f*<around|(|k,u|)>*<space|0.17em>z<rsup|k>>.
  </definition>

  <\remark>
    [<math|F> is distinct from <math|A>]<label|rem:Fdistinct> Comparing
    <eqref|eq:ak> and <eqref|eq:fk> reveals the structural difference:
    in<nbsp><eqref|eq:ak> the entire bracket
    <math|<around|(|Q*a*<around|(|k-1|)>+R*<big|sum>a<around|(|j|)>*a<around|(|\<ell\>|)>|)>>
    is premultiplied by <math|\<psi\><rsub|k>>, whereas in<nbsp><eqref|eq:fk>
    the term <math|P*\<psi\><rsub|k>> is added as a separate source with no
    such prefactor on the rest. Consequently <math|F\<ne\>A>, and no simple
    identity\Vneither <math|F=<Psimu>\<cdot\>A> nor
    <math|F=<Psimu>\<odot\>A>\Vholds. The role of <math|F> is to encode the
    Riccati nonlinearity in purely algebraic terms, at the cost of departing
    from the true solution sequence. The bridge between the two is the
    Hadamard fixed-point relation derived in
    Section<nbsp><reference|sec:meromorphy>.
  </remark>

  <\theorem>
    [Algebraic quadratic for <math|F>]<label|thm:quad> <math|F> satisfies the
    algebraic equation

    <\equation>
      <label|eq:quad>z*R*<space|0.17em>F<rsup|2>-<around|(|1-z*Q|)>*<space|0.17em>F+P<space|0.17em><Psimu><space|0.27em>=<space|0.27em>0<space|1em><text|in
      ><C><around|[|u|]><around|[|<around|[|z|]>|]>,
    </equation>

    with the explicit closed form

    <\equation>
      <label|eq:Fformula>F<around|(|z,u|)><space|0.27em>=<space|0.27em><frac|<around|(|1-z*Q|)>-<sqrt|<around|(|1-z*Q|)><rsup|2>-4*z*P*R<space|0.17em><Psimu><around|(|z|)>>|2*z*R>.
    </equation>
  </theorem>

  <\proof>
    Let <math|G\<assign\>z*R*F<rsup|2>-<around|(|1-z*Q|)>*F+P<Psimu>>. The
    constant coefficient satisfies <math|<around|[|z<rsup|0>|]>*G=-f<around|(|0|)>+P*\<psi\><rsub|0>=0>.
    For <math|k\<ge\>1>, writing <math|c<rsub|k-1>=<big|sum><rsub|j+\<ell\>=k-1>f<around|(|j|)>*f<around|(|\<ell\>|)>>,

    <\equation*>
      <around|[|z<rsup|k>|]>*G<space|0.27em>=<space|0.27em>R*<space|0.17em>c<rsub|k-1>-f<around|(|k|)>+Q*<space|0.17em>f*<around|(|k-1|)>+P*\<psi\><rsub|k><space|0.27em>=<space|0.27em>0
    </equation*>

    by the defining recurrence<nbsp><eqref|eq:fk>. Hence <math|G\<equiv\>0>.

    To extract<nbsp><eqref|eq:Fformula>, solve the quadratic in <math|F>. The
    discriminant at <math|z=0> is <math|\<Delta\><around|(|0,u|)>=1>, so
    <math|<sqrt|\<Delta\>>> is a well-defined formal power series with
    constant term <math|1>. We verify that the minus branch has the correct
    constant term: expanding <math|<sqrt|1-2*z*Q-4*z*P*R*\<psi\><rsub|0>+O<around|(|z<rsup|2>|)>>=1-z*<around|(|Q+2*P*R*\<psi\><rsub|0>|)>+O<around|(|z<rsup|2>|)>>
    gives

    <\equation*>
      F<around|(|z,u|)><space|0.27em>=<space|0.27em><frac|<around|(|1-z*Q|)>-<around|[|1-z*<around|(|Q+2*P*R*\<psi\><rsub|0>|)>+O<around|(|z<rsup|2>|)>|]>|2*z*R><space|0.27em>=<space|0.27em>P*\<psi\><rsub|0>+O<around|(|z|)>,
    </equation*>

    which matches <math|f<around|(|0|)>=P*\<psi\><rsub|0>>. The implicit
    function condition

    <\equation*>
      \<partial\><rsub|F>*<around*|[|z*R*F<rsup|2>-<around|(|1-z*Q|)>*F+P<Psimu>|]><mid|\|><rsub|z=0><space|0.27em>=<space|0.27em>-1<space|0.27em>\<ne\><space|0.27em>0
    </equation*>

    then pins this as the unique formal-power-series root. The plus branch is
    asymptotic to <math|<around|(|1-z*Q|)>/<around|(|z*R|)>> near <math|z=0>
    and is not a power series.
  </proof>

  <section|The Chebyshev\UWheeler Algorithm>

  The coefficients <math|a<around|(|k,u|)>> produced by
  Theorem<nbsp><reference|thm:Muntz> will serve as the moments of a linear
  functional on polynomials. The Padé denominators of <math|A> are then the
  orthogonal polynomials of that functional, and the Chebyshev\UWheeler
  algorithm gives a stable recurrence for computing them directly from the
  moments without forming and inverting Hankel matrices. We collect the
  necessary results from the classical theory of orthogonal polynomials and
  then lift them to the symbolic setting over <math|<C><around|(|u|)>>.

  <subsection|Points of growth and positive-definiteness>

  <\definition>
    [Points of growth]<label|def:growth> Let
    <math|\<lambda\>:<R>\<to\><around|[|0,\<infty\>|)>> be non-decreasing and
    right-continuous. A point <math|x<rsub|0>> is a <em|point of growth> of
    <math|\<lambda\>> if

    <\equation*>
      \<lambda\>*<around|(|x<rsub|0>+\<varepsilon\>|)>-\<lambda\>*<around|(|x<rsub|0>-\<varepsilon\>|)>\<gtr\>0*<space|2em><text|for
      all >\<varepsilon\>\<gtr\>0.
    </equation*>

    Write <math|G<around|(|\<lambda\>|)>\<assign\><math-up|supp><around|(|d*\<lambda\>|)>>
    and <math|N<rsub|\<lambda\>>\<assign\><around|\||G<around|(|\<lambda\>|)>|\|>>.
  </definition>

  <\lemma>
    [Positive-definiteness criterion]<label|lem:posdef> The inner product
    <math|<around|\<langle\>|f,g|\<rangle\>><rsub|\<lambda\>>\<assign\><big|int>f*g*<space|0.17em>d*\<lambda\>>
    on <math|<R><around|[|x|]>> is positive-definite if and only if
    <math|N<rsub|\<lambda\>>=\<infty\>>.
  </lemma>

  <\proof>
    <math|(\<Leftarrow\>)> A nonzero polynomial <math|f> of degree <math|d>
    has at most <math|d> zeros, so <math|<around|{|f<rsup|2>\<gtr\>0|}>>
    contains at least one point of growth and therefore
    <math|<around|\<langle\>|f,f|\<rangle\>><rsub|\<lambda\>>\<gtr\>0>.

    <math|(\<Rightarrow\>)> If <math|G<around|(|\<lambda\>|)>=<around|{|x<rsub|1>,\<ldots\>,x<rsub|M>|}>>
    is finite, then <math|f<around|(|x|)>\<assign\><big|prod><rsub|j><around|(|x-x<rsub|j>|)>>
    satisfies <math|f<rsup|2><around|(|x<rsub|j>|)>=0> for every <math|j>, so
    <math|f<rsup|2>> vanishes at every point of
    <math|<math-up|supp><around|(|d*\<lambda\>|)>>, giving
    <math|<around|\<langle\>|f,f|\<rangle\>><rsub|\<lambda\>>=<big|int>f<rsup|2>*<space|0.17em>d*\<lambda\>=0>
    despite <math|f\<ne\>0>.
  </proof>

  <subsection|Wheeler's algorithm>

  The following algorithm, due to Wheeler <cite|Wheeler>, computes the
  three-term recurrence coefficients <math|\<alpha\><around|(|k|)>,\<beta\><around|(|k|)>>
  of the orthogonal polynomials of <math|\<lambda\>> directly from the
  moments <math|\<mu\><around|(|\<ell\>|)>=<big|int>x<rsup|\<ell\>>*<space|0.17em>d*\<lambda\>>,
  circumventing the numerical ill-conditioning of the Hankel system.

  <paragraph|Input.> An infinite real moment sequence
  <math|\<mu\><around|(|\<ell\>|)>=<big|int>x<rsup|\<ell\>>*<space|0.17em>d*\<lambda\>>
  with <math|N<rsub|\<lambda\>>=\<infty\>>.

  <paragraph|Auxiliary array.>

  <\align*>
    <tformat|<table|<row|<cell|\<sigma\><around|(|-1,\<ell\>|)>>|<cell|<space|0.27em>=<space|0.27em>0,>>|<row|<cell|\<sigma\><around|(|0,\<ell\>|)>>|<cell|<space|0.27em>=<space|0.27em>\<mu\><around|(|\<ell\>|)>,>>|<row|<cell|\<sigma\><around|(|k,\<ell\>|)>>|<cell|<space|0.27em>=<space|0.27em>\<sigma\><around|(|k-1,\<ell\>+1|)>-\<alpha\>*<around|(|k-1|)>*<space|0.17em>\<sigma\><around|(|k-1,\<ell\>|)>-\<beta\>*<around|(|k-1|)>*<space|0.17em>\<sigma\><around|(|k-2,\<ell\>|)>.>>>>
  </align*>

  <paragraph|Recurrence coefficients.>

  <\equation*>
    \<alpha\><around|(|0|)>=<frac|\<mu\><around|(|1|)>|\<mu\><around|(|0|)>>,<space|2em>\<beta\><around|(|0|)>=\<mu\><around|(|0|)>;
  </equation*>

  <\equation*>
    \<alpha\><around|(|k|)>=<frac|\<sigma\><around|(|k,k+1|)>|\<sigma\><around|(|k,k|)>>-<frac|\<sigma\><around|(|k-1,k|)>|\<sigma\><around|(|k-1,k-1|)>>,<space|2em>\<beta\><around|(|k|)>=<frac|\<sigma\><around|(|k,k|)>|\<sigma\><around|(|k-1,k-1|)>>.
  </equation*>

  <paragraph|Orthogonal polynomials.>

  <\equation*>
    \<pi\><rsub|-1>=0,<space|1em>\<pi\><rsub|0>=1,<space|1em>\<pi\><rsub|k+1>=<around|(|x-\<alpha\><around|(|k|)>|)>*<space|0.17em>\<pi\><rsub|k>-\<beta\><around|(|k|)>*<space|0.17em>\<pi\><rsub|k-1>.
  </equation*>

  <\theorem>
    [Wheeler]<label|thm:wheeler> For all <math|k\<ge\>0>,
    <math|\<sigma\><around|(|k,k|)>\<gtr\>0>, and

    <\equation*>
      <big|int>\<pi\><rsub|j>*<space|0.17em>\<pi\><rsub|k>*<space|0.17em>d*\<lambda\><space|0.27em>=<space|0.27em>\<delta\><rsub|j*k>*<big|prod><rsub|i=0><rsup|k>\<beta\><around|(|i|)>.
    </equation*>
  </theorem>

  <\proof>
    Define <math|<wide|\<sigma\>|~><around|(|k,\<ell\>|)>\<assign\><big|int>\<pi\><rsub|k><around|(|x|)>*<space|0.17em>x<rsup|\<ell\>>*<space|0.17em>d*\<lambda\>>.
    The initial data and three-term recurrence of <math|<wide|\<sigma\>|~>>
    match those of <math|\<sigma\>>, so <math|<wide|\<sigma\>|~>=\<sigma\>>
    throughout. By induction on <math|k>, <math|\<pi\><rsub|k>> is
    <math|\<lambda\>>-orthogonal to all of
    <math|<around|{|1,x,\<ldots\>,x<rsup|k-1>|}>>, hence
    <math|\<sigma\><around|(|k,\<ell\>|)>=0> for <math|\<ell\>\<less\>k>.
    Since <math|x<rsup|k>-\<pi\><rsub|k>\<in\><math-up|span><around|{|1,\<ldots\>,x<rsup|k-1>|}>>,
    we have <math|\<sigma\><around|(|k,k|)>=<around|\<langle\>|\<pi\><rsub|k>,\<pi\><rsub|k>|\<rangle\>><rsub|\<lambda\>>\<gtr\>0>
    by Lemma<nbsp><reference|lem:posdef>. The norm product formula follows by
    induction from <math|<around|\<langle\>|\<pi\><rsub|k>,\<pi\><rsub|k>|\<rangle\>><rsub|\<lambda\>>=\<beta\><around|(|k|)><around|\<langle\>|\<pi\><rsub|k-1>,\<pi\><rsub|k-1>|\<rangle\>><rsub|\<lambda\>>>.
  </proof>

  <subsection|Symbolic transfer to the moment functional <math|\<cal-L\>>>

  The Riccati moments <math|<around|{|a<around|(|k,u|)>|}>\<subset\><C><around|[|u|]>>
  define a linear functional <math|<Lk>:<C><around|(|u|)><around|[|x|]>\<to\><C><around|(|u|)>>
  by <math|<Lk><around|[|x<rsup|\<ell\>>|]>=a<around|(|\<ell\>,u|)>>. This
  functional plays the role of <math|d*\<lambda\>> in the symbolic setting,
  and the analogue of positive-definiteness is quasi-definiteness of the
  Hankel matrix.

  <\definition>
    [Quasi-definiteness] The sequence <math|<around|{|a<around|(|k,u|)>|}>>
    is <em|quasi-definite> if

    <\equation*>
      H<rsub|n><around|(|u|)><space|0.27em>\<assign\><space|0.27em>det
      <around*|(|a<around|(|i+j,u|)>|)><rsub|0\<le\>i,j\<less\>n><space|0.27em>\<nequiv\><space|0.27em>0*<space|2em><text|for
      all >n\<ge\>1.
    </equation*>
  </definition>

  <\theorem>
    [Symbolic Wheeler]<label|thm:wheeler_sym> Under quasi-definiteness,
    <math|\<sigma\><around|(|k,k,u|)>\<nequiv\>0> in
    <math|<C><around|(|u|)>>, and the orthogonal polynomials <math|P<rsub|k>>
    of <math|\<cal-L\>> satisfy

    <\equation*>
      <Lk><around|[|P<rsub|j>*<space|0.17em>P<rsub|k>|]><space|0.27em>=<space|0.27em>\<delta\><rsub|j*k>*<big|prod><rsub|i=0><rsup|k>\<beta\><rsub|i><around|(|u|)><space|1em><text|in
      ><C><around|(|u|)>.
    </equation*>
  </theorem>

  <\proof>
    By induction and multilinearity, <math|\<sigma\><around|(|k,k,u|)>=H<rsub|k+1><around|(|u|)>/H<rsub|k><around|(|u|)>\<nequiv\>0>.
    The identity <math|\<sigma\><around|(|k,\<ell\>,u|)>=<Lk><around|[|x<rsup|\<ell\>>*P<rsub|k>|]>>
    holds by induction in <math|k> via the three-term recurrence and
    <math|<Lk>>-linearity. The norm formula follows from
    <math|<Lk><around|[|P<rsub|k><rsup|2>|]>=\<sigma\><around|(|k,k,u|)>> and
    the telescoping

    <\equation*>
      \<sigma\><around|(|k,k,u|)><space|0.27em>=<space|0.27em>\<beta\><rsub|k><around|(|u|)>*<space|0.17em>\<sigma\><around|(|k-1,k-1,u|)>.
    </equation*>
  </proof>

  <section|Padé Denominators via Gragg's Theorem><label|sec:padeconv>

  We now identify the denominators of the near-diagonal Padé approximants of
  <math|A> with the orthogonal polynomials of <math|\<cal-L\>>. Throughout,
  we use the following convention.

  <paragraph|Padé convention.> The <math|M>-th approximant constructed below
  has numerator degree at most <math|M-1> and denominator degree exactly
  <math|M>; it is therefore of type <math|<around|[|M-1/M|]>>. However, its
  denominator sequence <math|<around|{|D<rsub|M>|}>> is identical to that of
  the diagonal <math|<around|[|M/M|]>> table, because the denominator is
  determined solely by <math|M> orthogonality conditions that do not depend
  on whether an extra numerator-matching condition is imposed. We therefore
  call these approximants <em|diagonal in the denominator sense>, or simply
  <em|diagonal>, following the usage in Stahl's convergence theorem. The
  precise comparison is spelled out in the proof of
  Theorem<nbsp><reference|thm:FRMP>.

  <\theorem>
    [Gragg, symbolic form]<label|thm:gragg> Let
    <math|A<around|(|z,u|)>=<big|sum><rsub|k>a<around|(|k,u|)>*<space|0.17em>z<rsup|k>>
    with <math|<around|{|a<around|(|k,u|)>|}>> quasi-definite. There exists a
    unique pair <math|<around|(|N<rsub|M>,D<rsub|M>|)>> satisfying

    <\equation*>
      deg N<rsub|M>\<le\>M-1,<space|1em>deg
      D<rsub|M>\<le\>M,<space|1em>D<rsub|M>*<around|(|0,u|)>=1,<space|1em>D<rsub|M>*A-N<rsub|M>=O<around|(|z<rsup|2*M>|)>,
    </equation*>

    and it satisfies

    <\equation*>
      D<rsub|M>*<around|(|z,u|)><space|0.27em>=<space|0.27em>z<rsup|M>*P<rsub|M>*<around|(|z<rsup|-1>,u|)>.
    </equation*>

    Since <math|P<rsub|M>> is monic, <math|P<rsub|M><rsup|\<ast\>>*<around|(|0,u|)>=1>,
    and the formula requires no division.
  </theorem>

  <\proof>
    Write <math|D<rsub|M>=<big|sum><rsub|k=0><rsup|M>d<rsub|k>*z<rsup|k>>
    with <math|d<rsub|0>=1>. The <math|M> conditions
    <math|<around|[|z<rsup|j>|]>*<around|(|D<rsub|M>*A|)>=0> for
    <math|j=M,\<ldots\>,2*M-1> translate, after the substitution
    <math|Q<rsub|M>*<around|(|x,u|)>\<assign\>x<rsup|M>*D<rsub|M>*<around|(|x<rsup|-1>,u|)>>,
    into

    <\equation*>
      <Lk><around|[|x<rsup|i>*<space|0.17em>Q<rsub|M>|]>=0,<space|2em>i=0,\<ldots\>,M-1.
    </equation*>

    Here <math|Q<rsub|M>> is monic of degree at most <math|M>, so by
    Theorem<nbsp><reference|thm:wheeler_sym> the unique such monic polynomial
    is <math|P<rsub|M>>: <math|Q<rsub|M>=P<rsub|M>>. Solvability follows from
    <math|det=\<pm\>H<rsub|M><around|(|u|)>\<nequiv\>0>. Since
    <math|P<rsub|M>> is monic, its leading coefficient equals <math|1>, so
    <math|D<rsub|M>=z<rsup|M>*P<rsub|M>*<around|(|z<rsup|-1>,u|)>> with
    <math|D<rsub|M>*<around|(|0,u|)>=1> automatically satisfied.
  </proof>

  <section|Meromorphic Continuation of <math|A>><label|sec:meromorphy>

  The convergence theorem requires that <math|A<around|(|z,u|)>>, a priori
  only a formal power series with some positive radius
  <math|\<rho\><rsub|0>>, admit meromorphic continuation to a much larger
  domain: the universal cover of <math|<C>\<setminus\><around|{|0|}>> minus a
  compact set <math|K<rsub|A><around|(|u|)>> of minimal logarithmic capacity.
  We establish this in three steps.

  The first step (Section<nbsp><reference|subsec:hadamard>) reveals that
  <math|A> satisfies a Hadamard-product fixed-point equation
  <math|A=<Psimu>\<odot\>B<around|[|A|]>>. The second step
  (Sections<nbsp><reference|subsec:mellin> and<nbsp><reference|subsec:mb>)
  translates this equation into a Mellin\UBarnes integral representation that
  converges on a half-plane sector and extends, by the identity principle, to
  the full universal cover. The third step
  (Section<nbsp><reference|subsec:stahl>) identifies the Stahl compact of
  <math|A> as a subset of the Stahl compact of <math|F> by a self-consistent
  meromorphic fixed-point argument.

  <subsection|The Hadamard fixed-point equation><label|subsec:hadamard>

  <\lemma>
    [Hadamard form of the moment recurrence]<label|lem:hadamard> With
    <math|B<around|[|A|]>\<assign\>P+z*Q*<space|0.17em>A+z*R*<space|0.17em>A<rsup|2>>,

    <\equation*>
      A<around|(|z,u|)><space|0.27em>=<space|0.27em><Psimu><around|(|z|)>\<odot\>B<around|[|A|]><around|(|z,u|)><space|1em><text|in
      ><C><around|[|u|]><around|[|<around|[|z|]>|]>.
    </equation*>
  </lemma>

  <\proof>
    We verify the identity coefficient by coefficient. For <math|k=0>:
    <math|<around|[|z<rsup|0>|]>*B<around|[|A|]>=P>, and
    <math|\<psi\><rsub|0>\<cdot\>P=P*\<psi\><rsub|0>=a<around|(|0,u|)>>
    by<nbsp><eqref|eq:a0>. For <math|k\<ge\>1>, the factor <math|z> in the
    terms <math|z*Q*A> and <math|z*R*A<rsup|2>> shifts the index by one:

    <\align*>
      <tformat|<table|<row|<cell|<around|[|z<rsup|k>|]>*B<around|[|A|]>>|<cell|=<around|[|z<rsup|k>|]>*<around|(|z*Q*<space|0.17em>A|)>+<around|[|z<rsup|k>|]>*<around|(|z*R*<space|0.17em>A<rsup|2>|)>>>|<row|<cell|<vspace*|4pt>>|<cell|=Q<space|0.17em><around|[|z<rsup|k-1>|]>*A<space|0.27em>+<space|0.27em>R<space|0.17em><around|[|z<rsup|k-1>|]>*A<rsup|2>>>|<row|<cell|<vspace*|4pt>>|<cell|=Q*<space|0.17em>a*<around|(|k-1|)><space|0.27em>+<space|0.27em>R*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em>a<around|(|j|)>*<space|0.17em>a<around|(|\<ell\>|)>.>>>>
    </align*>

    Multiplying by <math|\<psi\><rsub|k>> recovers <math|a<around|(|k,u|)>>
    by<nbsp><eqref|eq:ak>.
  </proof>

  <subsection|The Mellin transform of <math|<Psimu>>><label|subsec:mellin>

  The Hadamard product <math|<Psimu>\<odot\>G> admits an integral
  representation via the Mellin transform of <math|<Psimu>>. We compute this
  transform using Ramanujan's master theorem, which converts a power-series
  coefficient sequence into a Mellin integral via an analytic continuation of
  the coefficients.

  <\lemma>
    [Mellin transform of <math|<Psimu>>]<label|lem:mellin_psi> For
    <math|0\<less\>\<Re\>*s\<less\>1>,

    <\equation>
      <label|eq:mellin_psi><big|int><rsub|0><rsup|\<infty\>><Psimu><around|(|-x|)>*<space|0.17em>x<rsup|s-1>*<space|0.17em>d*x<space|0.27em>=<space|0.27em>\<Gamma\><around|(|s|)>*<space|0.17em>\<Gamma\>*<around|(|1-s|)>*<space|0.17em><frac|\<Gamma\>*<around|(|1-s*\<mu\>|)>|\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>>.
    </equation>

    The right-hand side extends to a meromorphic function

    <\equation*>
      M<rsub|<Psimu>><around|(|s|)><space|0.27em>\<assign\><space|0.27em>\<Gamma\><around|(|s|)>*<space|0.17em>\<Gamma\>*<around|(|1-s|)>*<space|0.17em><frac|\<Gamma\>*<around|(|1-s*\<mu\>|)>|\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>>
    </equation*>

    on all of <math|<C>>. Its poles arise from three sources:

    <\itemize>
      <item><math|\<Gamma\><around|(|s|)>> contributes simple poles at every
      <math|s\<in\><Z><rsub|\<le\>0>>;

      <item><math|\<Gamma\>*<around|(|1-s|)>> contributes simple poles at
      every <math|s\<in\><Z><rsub|\<ge\>1>>;

      <item><math|\<Gamma\>*<around|(|1-s*\<mu\>|)>> contributes simple poles
      at <math|s=<around|(|1+m|)>/\<mu\>> for each
      <math|m\<in\><Z><rsub|\<ge\>0>>.
    </itemize>

    A pole of <math|\<Gamma\>*<around|(|1-s*\<mu\>|)>> at
    <math|s=<around|(|1+m|)>/\<mu\>> is cancelled by a zero of
    <math|1/\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>> (i.e., a pole of
    <math|\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>>) precisely when
    <math|\<mu\>+1-s*\<mu\>\<in\><Z><rsub|\<le\>0>>, equivalently
    <math|s*\<mu\>=\<mu\>+1+n> for some <math|n\<ge\>0>, i.e.,
    <math|s=1+<around|(|1+n|)>/\<mu\>>. Equating this with
    <math|<around|(|1+m|)>/\<mu\>> gives <math|1+m=\<mu\>+1+n>, hence
    <math|m-n=\<mu\>>. For <math|\<mu\>\<in\><around|(|0,1|]>> this requires
    <math|\<mu\>\<in\><Z>>, hence <math|\<mu\>=1>. Thus for
    <math|\<mu\>\<in\><around|(|0,1|)>> the entire lattice
    <math|<around|{|<around|(|1+m|)>/\<mu\>:m\<ge\>0|}>> is an uncancelled
    pole set, while for <math|\<mu\>=1> the denominator
    <math|\<Gamma\>*<around|(|2-s|)>> cancels every pole of
    <math|\<Gamma\>*<around|(|1-s|)>> at <math|s\<in\><Z><rsub|\<ge\>1>>.
  </lemma>

  <\proof>
    Write <math|<Psimu><around|(|-x|)>=<big|sum><rsub|k\<ge\>0>\<varphi\><around|(|k|)>*<around|(|-x|)><rsup|k>/k!>
    with

    <\equation*>
      \<varphi\><around|(|k|)><space|0.27em>\<assign\><space|0.27em>k!<space|0.17em>\<psi\><rsub|k><space|0.27em>=<space|0.27em><frac|\<Gamma\>*<around|(|k+1|)>*<space|0.17em>\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>>.
    </equation*>

    The function <math|\<varphi\><around|(|s|)>=\<Gamma\>*<around|(|s+1|)>*\<Gamma\>*<around|(|s*\<mu\>+1|)>/\<Gamma\>*<around|(|s*\<mu\>+\<mu\>+1|)>>
    is an entire interpolation of the sequence
    <math|<around|{|\<varphi\><around|(|k|)>|}>> (the Weierstrass product for
    <math|1/\<Gamma\>> is entire). By Stirling, each Gamma factor on a
    vertical line <math|\<Re\>*s=\<sigma\>> satisfies

    <\equation*>
      <around|\||\<Gamma\>*<around|(|\<sigma\>+i*\<tau\>+1|)>|\|><space|0.27em>\<sim\><space|0.27em><sqrt|2*\<pi\>><space|0.17em><around|\||\<tau\>|\|><rsup|\<sigma\>+1/2>*e<rsup|-<around|(|\<pi\>/2|)><around|\||\<tau\>|\|>>*<space|2em><around|(|<around|\||\<tau\>|\|>\<to\>\<infty\>|)>,
    </equation*>

    so with one factor in the denominator the product gives
    <math|<around|\||\<varphi\>*<around|(|\<sigma\>+i*\<tau\>|)>|\|>\<sim\>C<around|\||\<tau\>|\|><rsup|C<rprime|'>>*e<rsup|-<around|(|\<pi\>/2|)><around|\||\<tau\>|\|>>>.
    The exponential decay rate <math|A=\<pi\>/2> satisfies
    <math|A\<less\>\<pi\>>, which is Hardy's growth condition for Ramanujan's
    master theorem <cite-detail|Hardy|Ch.<nbsp>XI>. That theorem then yields,
    for <math|0\<less\>\<Re\>*s\<less\>1>,

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>><Psimu><around|(|-x|)>*<space|0.17em>x<rsup|s-1>*<space|0.17em>d*x<space|0.27em>=<space|0.27em>\<Gamma\><around|(|s|)>*<space|0.17em>\<varphi\>*<around|(|-s|)><space|0.27em>=<space|0.27em>\<Gamma\><around|(|s|)>*<space|0.17em>\<Gamma\>*<around|(|1-s|)>*<space|0.17em><frac|\<Gamma\>*<around|(|1-s*\<mu\>|)>|\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>>.
    </equation*>

    The cancellation analysis is a direct comparison of the zero and pole
    sets of numerator and denominator Gamma factors, as detailed in the
    statement.
  </proof>

  <subsection|Mellin\UBarnes realisation under Gevrey-1
  growth><label|subsec:mb>

  The Mellin transform <math|M<rsub|<Psimu>>> converts the Hadamard
  fixed-point equation into a Mellin\UBarnes contour integral, provided the
  Borel transform of <math|G=B<around|[|A|]>> satisfies a suitable growth
  condition. The natural condition that emerges from the Riccati structure is
  Gevrey-1, and the <math|e<rsup|-\<pi\><around|\||\<tau\>|\|>>> decay of
  <math|M<rsub|<Psimu>>> on vertical lines is exactly strong enough to absorb
  the corresponding <math|e<rsup|<around|(|\<pi\>/2|)><around|\||\<tau\>|\|>>>
  growth.

  <\lemma>
    [Mellin\UBarnes realisation]<label|lem:mb> Let
    <math|G<around|(|z,u|)>=<big|sum><rsub|k\<ge\>0>g<rsub|k><around|(|u|)>*<space|0.17em>z<rsup|k>>
    be holomorphic in <math|<around|\||z|\|>\<less\>\<rho\>>, with
    <math|g<rsub|k><around|(|u|)>> admitting an entire interpolation
    <math|<wide|G|^><around|(|s,u|)>> satisfying the Gevrey-1 bound

    <\equation>
      <label|eq:gevrey1><around|\||<wide|G|^><around|(|\<sigma\>+i*\<tau\>,u|)>|\|><space|0.27em>\<le\><space|0.27em>K<rprime|'>\<cdot\>C<rsup|<around|\||\<sigma\>|\|>+1>*<around|\||\<Gamma\>*<around|(|\<sigma\>+i*\<tau\>+1|)>|\|>
    </equation>

    in every vertical strip. Fix <math|c\<in\><around|(|0,1|)>> avoiding
    poles of <math|M<rsub|<Psimu>>>. For <math|z\<in\><C>> with
    <math|<around|\||arg <around|(|-z|)>|\|>\<less\>\<pi\>/2> and
    <math|<around|\||z|\|>\<less\>min <around|(|1,\<rho\>|)>>,

    <\equation>
      <label|eq:mb_formula><around|(|<Psimu>\<odot\>G|)><around|(|z,u|)><space|0.27em>=<space|0.27em><frac|1|2*\<pi\>*i>*<big|int><rsub|c-i*\<infty\>><rsup|c+i*\<infty\>>M<rsub|<Psimu>><around|(|s|)><space|0.17em><wide|G|^><around|(|-s,u|)>*<space|0.17em><around|(|-z|)><rsup|-s>*<space|0.17em>d*s.
    </equation>

    The integrand decays on the contour <math|\<Re\>*s=c>: by Stirling and
    Lemma<nbsp><reference|lem:mellin_psi>,

    <\equation*>
      <around|\||M<rsub|<Psimu>>*<around|(|c+i*\<tau\>|)>|\|><space|0.27em>\<sim\><space|0.27em>e<rsup|-\<pi\><around|\||\<tau\>|\|>><around|\||\<tau\>|\|><rsup|C<rsub|1>>,<space|2em><around|\||<wide|G|^><around|(|-c-i*\<tau\>,u|)>|\|><space|0.27em>\<lesssim\><space|0.27em>e<rsup|<around|(|\<pi\>/2|)><around|\||\<tau\>|\|>><around|\||\<tau\>|\|><rsup|C<rsub|2>>,
    </equation*>

    yielding net decay <math|e<rsup|-<around|(|\<pi\>/2|)><around|\||\<tau\>|\|>><around|\||\<tau\>|\|><rsup|C<rsub|1>+C<rsub|2>>>.
    The factor <math|<around|\||<around|(|-z|)><rsup|-s>|\|>=e<rsup|-c*log\|z\|-\<tau\>*arg
    <around|(|-z|)>>> contributes <math|e<rsup|-\<tau\>*arg
    <around|(|-z|)>>>, which is dominated by this Gamma decay precisely when
    <math|<around|\||arg <around|(|-z|)>|\|>\<less\>\<pi\>/2>, establishing
    absolute convergence on the sector. By analytic continuation along paths
    in <math|<C>\<setminus\><around|{|0|}>> avoiding the projected pole set
    of <math|M<rsub|<Psimu>>*<wide|G|^>>, the right-hand side extends to a
    meromorphic function on the universal cover <math|<wide|X|~>> of
    <math|<C>\<setminus\><around|{|0|}>> minus that projection.
  </lemma>

  <\proof>
    Close the contour to the left. The residue at <math|s=-k> is

    <\align*>
      <tformat|<table|<row|<cell|<math-up|Res><rsub|s=-k><around*|[|M<rsub|<Psimu>><around|(|s|)><space|0.17em><wide|G|^><around|(|-s,u|)>*<space|0.17em><around|(|-z|)><rsup|-s>|]>>|<cell|=<frac|<around|(|-1|)><rsup|k>|k!>\<cdot\>\<Gamma\>*<around|(|1+k|)>\<cdot\><frac|\<Gamma\>*<around|(|1+k*\<mu\>|)>|\<Gamma\>*<around|(|\<mu\>+1+k*\<mu\>|)>>\<cdot\>g<rsub|k><around|(|u|)>\<cdot\><around|(|-1|)><rsup|k>*z<rsup|k>>>|<row|<cell|<vspace*|4pt>>|<cell|=<around|(|-1|)><rsup|2*k>\<cdot\>\<psi\><rsub|k>\<cdot\>g<rsub|k><around|(|u|)>\<cdot\>z<rsup|k><space|0.27em>=<space|0.27em>\<psi\><rsub|k>*<space|0.17em>g<rsub|k><around|(|u|)>*<space|0.17em>z<rsup|k>,>>>>
    </align*>

    using <math|<math-up|Res><rsub|s=-k>\<Gamma\><around|(|s|)>=<around|(|-1|)><rsup|k>/k>!,
    <math|\<Gamma\>*<around|(|1+k|)>/k!=1>, and
    <math|<around|(|-1|)><rsup|2*k>=1>. Summing over <math|k\<ge\>0> recovers
    <math|<around|(|<Psimu>\<odot\>G|)><around|(|z,u|)>>. Continuation to the
    full universal cover proceeds via the identity principle along chains of
    overlapping disks avoiding the projected pole set.
  </proof>

  <subsection|Stahl compact for <math|F> and for
  <math|A>><label|subsec:stahl>

  We first apply Stahl's extremal-domain theory to the algebraic function
  <math|F>, which has the advantage of being given by an explicit quadratic
  formula. We then transfer the resulting compact to <math|A> by a
  self-consistent meromorphic fixed-point argument, using the Hadamard
  equation <math|A=<Psimu>\<odot\>B<around|[|A|]>> as the key mechanism.

  <\lemma>
    [Stahl compact for <math|F>]<label|lem:stahl_F> There exists a unique
    compact <math|K<rsub|F><around|(|u|)>\<subset\><C>> of minimal
    logarithmic capacity with <math|K<rsub|F><around|(|u|)>\<supseteq\>K<rsub|\<Psi\>>>
    such that <math|<sqrt|\<Delta\><rsub|F>>>, hence
    <math|F<around|(|z,u|)>>, is single-valued meromorphic on
    <math|<wide|X|~>\<setminus\>K<rsub|F><around|(|u|)>>. Here
    <math|\<Delta\><rsub|F><around|(|z,u|)>\<assign\><around|(|1-z*Q|)><rsup|2>-4*z*P*R<space|0.17em><Psimu><around|(|z|)>>
    is the discriminant of<nbsp><eqref|eq:quad> and <math|K<rsub|\<Psi\>>> is
    the compact determined by the poles of <math|M<rsub|<Psimu>>>.
  </lemma>

  <\proof>
    Lemma<nbsp><reference|lem:mellin_psi> provides meromorphic continuation
    of <math|<Psimu>> to <math|<wide|X|~>\<setminus\>K<rsub|\<Psi\>>>, so
    <math|\<Delta\><rsub|F>> is meromorphic on the same domain. Since
    <math|F> is the minus branch of a two-valued algebraic function over
    <math|<C><around|(|u|)><around|(|z,<Psimu><around|(|z|)>|)>>, Stahl's
    extremal-domain theorem <cite|StahlExtremal|StahlExtremalII> produces the
    unique minimal-capacity compact <math|K<rsub|F><around|(|u|)>\<supseteq\>K<rsub|\<Psi\>>>
    outside which <math|<sqrt|\<Delta\><rsub|F>>> is single-valued.
  </proof>

  <\theorem>
    [Meromorphic continuation of <math|A>]<label|thm:Acont> Under
    quasi-definiteness, <math|A<around|(|z,u|)>\<in\><C><around|[|u|]><around|[|<around|[|z|]>|]>>
    is the Taylor expansion at <math|z=0> of a function meromorphic on
    <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>>, where
    <math|K<rsub|A><around|(|u|)>\<subseteq\>K<rsub|F><around|(|u|)>>.
  </theorem>

  <\proof>
    By Theorem<nbsp><reference|thm:Muntz>, <math|A> is holomorphic on some
    disk <math|<around|\||z|\|>\<less\>\<rho\><rsub|0>>. Write
    <math|G\<assign\>B<around|[|A|]>=P+z*Q*A+z*R*A<rsup|2>>, also holomorphic
    there.

    <vspace*|1fn><no-indent><with|font-series|bold|Step 1: Gevrey-1 bound.>
    Let <math|C<rsub|0>\<assign\>sup<rsub|k\<ge\>0><around|\||\<psi\><rsub|k>|\|>\<less\>\<infty\>>
    and define

    <\equation*>
      K<space|0.27em>\<assign\><space|0.27em>C<rsub|0>*max
      <around|(|<around|\||P|\|>,<space|0.17em>1|)>,<space|2em>C<space|0.27em>\<assign\><space|0.27em>C<rsub|0><around*|(|<around|\||Q*<around|\||+K|\|>*R|\|>|)>+1.
    </equation*>

    We claim <math|<around|\||a<around|(|k,u|)>|\|>\<le\>K\<cdot\>C<rsup|k>\<cdot\>k>!
    for all <math|k\<ge\>0>. Base case: <math|<around|\||a<around|(|0|)>|\|>=<around|\||P*\<psi\><rsub|0>|\|>\<le\>C<rsub|0><around|\||P|\|>\<le\>K>.
    Inductive step: assuming the bound for <math|j\<less\>k>, the convolution
    estimate <math|<big|sum><rsub|j+\<ell\>=n>j!<space|0.17em>\<ell\>!\<le\><around|(|n+1|)>>!
    with <math|n=k-1> gives

    <\equation*>
      <around|\||a<around|(|k|)>|\|><space|0.27em>\<le\><space|0.27em>C<rsub|0>*K<around*|(|<around|\||Q*<around|\||+K|\|>*R|\|>|)>*C<rsup|k-1>*k!<space|0.27em>=<space|0.27em>K\<cdot\>C<rsub|0><around|(|<around|\||Q*<around|\||+K|\|>*R|\|>|)>\<cdot\>C<rsup|k-1>*k!<space|0.27em>\<le\><space|0.27em>K*C<rsup|k>*k!,
    </equation*>

    since <math|C<rsub|0><around|(|<around|\||Q*<around|\||+K|\|>*R|\|>|)>=C-1\<less\>C>
    by definition. The same estimate for <math|g<rsub|k>=<around|[|z<rsup|k>|]>*G>
    yields <math|<around|\||g<rsub|k>|\|>\<le\>K<rprime|''>*C<rsup|k+1>*k>!
    with <math|K<rprime|''>=K<around|(|<around|\||Q*<around|\||+K|\|>*R|\|>|)>/C<rsup|2>>.
    These integer-point bounds extend to the entire interpolation
    <math|<wide|G|^><around|(|s,u|)>> via the Phragmén\ULindelöf principle
    and Carlson's uniqueness theorem for functions of exponential type
    <math|\<less\>\<pi\>> on vertical lines: the
    bound<nbsp><eqref|eq:gevrey1> holds with constants <math|K<rprime|'>,C>
    depending only on <math|<around|\||P|\|>,<around|\||Q|\|>,<around|\||R|\|>,\<mu\>>.

    <vspace*|1fn><no-indent><with|font-series|bold|Step 2: Mellin\UBarnes
    representation.> By Lemma<nbsp><reference|lem:hadamard>,
    <math|A=<Psimu>\<odot\>G>. Lemma<nbsp><reference|lem:mb> applies and
    gives, for <math|<around|\||arg <around|(|-z|)>|\|>\<less\>\<pi\>/2> and
    <math|<around|\||z|\|>\<less\>min <around|(|1,\<rho\><rsub|0>|)>>,

    <\equation*>
      A<around|(|z,u|)><space|0.27em>=<space|0.27em><frac|1|2*\<pi\>*i>*<big|int><rsub|c-i*\<infty\>><rsup|c+i*\<infty\>>M<rsub|<Psimu>><around|(|s|)><space|0.17em><wide|G|^><around|(|-s,u|)>*<space|0.17em><around|(|-z|)><rsup|-s>*<space|0.17em>d*s,
    </equation*>

    holomorphic on the open sector. By the identity principle, <math|A>
    extends meromorphically along all paths in <math|<wide|X|~>> avoiding the
    projected pole set <math|K<rsub|\<Psi\>>\<cup\>S<rsub|G>>, where
    <math|S<rsub|G>> denotes the singularity locus of <math|<wide|G|^>>.

    <vspace*|1fn><no-indent><with|font-series|bold|Step 3: Self-consistent
    fixed point.> Since <math|G=B<around|[|A|]>> is a polynomial in <math|A>,
    <math|G> is holomorphic on every domain where <math|A> is holomorphic.
    Let <math|\<cal-M\><around|(|K|)>> denote the space of functions
    meromorphic on <math|<wide|X|~>\<setminus\>K> for a compact
    <math|K\<supseteq\>K<rsub|\<Psi\>>>. The map
    <math|A\<mapsto\><Psimu>\<odot\>B<around|[|A|]>> sends
    <math|\<cal-M\><around|(|K|)>> to itself for every
    <math|K\<supseteq\>K<rsub|\<Psi\>>>: if
    <math|A\<in\>\<cal-M\><around|(|K|)>> then
    <math|G=B<around|[|A|]>\<in\>\<cal-M\><around|(|K|)>>, and the
    Mellin\UBarnes integral produces <math|<Psimu>\<odot\>G\<in\>\<cal-M\><around|(|K|)>>
    (its only additional singularities are the poles of
    <math|M<rsub|<Psimu>>>, which project to
    <math|K<rsub|\<Psi\>>\<subseteq\>K>).

    Since <math|A> is the unique power-series fixed point of this map (by
    Theorem<nbsp><reference|thm:Muntz>), and since
    <math|F\<in\>\<cal-M\><around|(|K<rsub|F>|)>> by
    Lemma<nbsp><reference|lem:stahl_F>, the smallest <math|K> for which the
    fixed-point equation is consistent is
    <math|K<rsub|A>\<subseteq\>K<rsub|F><around|(|u|)>>. (Explicitly:
    <math|A> is already known to be meromorphic on
    <math|<wide|X|~>\<setminus\>K<rsub|\<Psi\>>> from Step<nbsp>2, and any
    singularities of <math|A> beyond <math|K<rsub|\<Psi\>>> must lie in
    <math|K<rsub|F><around|(|u|)>> because the Volterra
    equation<nbsp><eqref|eq:Volt> that <math|A> generates is locally
    equivalent to the algebraic equation<nbsp><eqref|eq:quad> for <math|F>,
    and the branch locus of <math|F> is exactly
    <math|K<rsub|F><around|(|u|)>>.) Hence

    <\equation*>
      K<rsub|A><around|(|u|)><space|0.27em>\<subseteq\><space|0.27em>K<rsub|\<Psi\>>\<cup\>K<rsub|F><around|(|u|)><space|0.27em>=<space|0.27em>K<rsub|F><around|(|u|)>.
    </equation*>
  </proof>

  <section|The Fractional Riccati\UMüntz\UPadé Theorem>

  All ingredients are now in place. The solution <math|y> lives in the space
  of Müntz series; its generating function <math|A> is meromorphic outside a
  Stahl compact contained in <math|K<rsub|F>>; and the Padé denominators are
  the orthogonal polynomials of the associated moment functional. Stahl's
  convergence-in-capacity theorem closes the argument.

  <\theorem>
    [Main theorem]<label|thm:FRMP> Under quasi-definiteness of
    <math|<around|{|a<around|(|k,u|)>|}>>, define the <math|M>-th Müntz\UPadé
    approximant to <math|y<around|(|t,u|)>> by

    <\equation*>
      y<rsub|M><around|(|t,u|)><space|0.27em>\<assign\><space|0.27em>t<rsup|\<mu\>>*<space|0.17em><frac|N<rsub|M><around|(|t<rsup|\<mu\>>,<space|0.17em>u|)>|D<rsub|M>*<around|(|t<rsup|\<mu\>>,<space|0.17em>u|)>>.
    </equation*>

    Then

    <\equation*>
      y<around|(|t,u|)><space|0.27em>=<space|0.27em>lim<rsub|M\<to\>\<infty\>>
      y<rsub|M><around|(|t,u|)>
    </equation*>

    in logarithmic capacity on compact subsets of the universal cover of
    <math|<C>\<setminus\><around|{|0|}>> minus the Stahl compact
    <math|K<rsub|A><around|(|u|)>\<subseteq\>K<rsub|F><around|(|u|)>>.
  </theorem>

  <\proof>
    By Theorem<nbsp><reference|thm:Muntz>,
    <math|y<around|(|t,u|)>=t<rsup|\<mu\>>*A<around|(|t<rsup|\<mu\>>,u|)>>.
    By Theorem<nbsp><reference|thm:gragg>,
    <math|D<rsub|M>*A-N<rsub|M>=O<around|(|z<rsup|2*M>|)>> with <math|deg
    N<rsub|M>\<le\>M-1> and <math|deg D<rsub|M>\<le\>M>; thus
    <math|N<rsub|M>/D<rsub|M>> is the <math|<around|[|M-1/M|]>> Padé
    approximant of <math|A>.

    <vspace*|1fn><no-indent><with|font-series|bold|Equivalence of denominator
    sequences.> The denominator <math|D<rsub|M>=z<rsup|M>*P<rsub|M><around|(|z<rsup|-1>|)>>
    is uniquely determined by the <math|M> orthogonality conditions
    <math|\<cal-L\>*<around|[|x<rsup|i>*Q<rsub|M>|]>=0> for
    <math|i=0,\<ldots\>,M-1>. The diagonal <math|<around|[|M/M|]>>
    approximant imposes one additional matching condition at order
    <math|z<rsup|2*M>>; however, this extra condition determines only the
    leading coefficient of the numerator <math|N<rsub|M>>, not the
    denominator. Hence the denominator sequence
    <math|<around|{|D<rsub|M>|}><rsub|M\<ge\>1>> is identical for both
    <math|<around|[|M-1/M|]>> and <math|<around|[|M/M|]>>, and Stahl's
    convergence theorem applies to this sequence regardless of the
    numerator-degree convention.

    <vspace*|1fn><no-indent><with|font-series|bold|Convergence in capacity.>
    By Theorem<nbsp><reference|thm:Acont>, <math|A> is meromorphic on
    <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>>. Stahl's theorem
    <cite|StahlConvergence|StahlBranch> then gives
    <math|N<rsub|M>/D<rsub|M>\<to\>A> in logarithmic capacity on compact
    subsets of <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>>.

    <vspace*|1fn><no-indent><with|font-series|bold|Transfer to the
    <math|t>-plane.> The change of variable <math|z=t<rsup|\<mu\>>> is a
    branched covering of degree <math|<around|\<lceil\>|1/\<mu\>|\<rceil\>>>
    at the origin. Under such a map the logarithmic capacity of the preimage
    satisfies

    <\equation*>
      <math-up|cap><around*|(|<around|{|t:t<rsup|\<mu\>>\<in\>K|}>|)><space|0.27em>=<space|0.27em><math-up|cap><around|(|K|)><rsup|1/\<mu\>>
    </equation*>

    on the principal branch, so convergence in capacity transfers from the
    <math|z>-plane to the <math|t>-plane, and <math|y<rsub|M>\<to\>y> in
    capacity on compact subsets of the corresponding preimage of
    <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>>.
  </proof>

  <\thebibliography|9>
    <bibitem|SKM>S.<nbsp>G.<nbsp>Samko, A.<nbsp>A.<nbsp>Kilbas, and
    O.<nbsp>I.<nbsp>Marichev, <em|Fractional Integrals and Derivatives:
    Theory and Applications>, Gordon and Breach, 1993. Theorem<nbsp>2.4 gives
    the composition formula <math|I<rsup|\<mu\>>*D<rsup|\<mu\>>*f=f-<around|[|I<rsup|1-\<mu\>>*f|]><around|(|0<rsup|+>|)>\<cdot\>t<rsup|\<mu\>-1>/\<Gamma\><around|(|\<mu\>|)>>.

    <bibitem|StahlExtremal>H.<nbsp>Stahl, <em|Extremal domains associated
    with an analytic function<nbsp>I>, Constr. Approx.
    <with|font-series|bold|1> (1985), 89\U110.

    <bibitem|StahlExtremalII>H.<nbsp>Stahl, <em|Extremal domains associated
    with an analytic function<nbsp>II>, Constr. Approx.
    <with|font-series|bold|1> (1985), 111\U137.

    <bibitem|StahlConvergence>H.<nbsp>Stahl, <em|The convergence of Padé
    approximants to functions with branch points (preliminary)>, Constr.
    Approx. <with|font-series|bold|4> (1988), 631\U642.

    <bibitem|StahlBranch>H.<nbsp>Stahl, <em|The convergence of Padé
    approximants to functions with branch points>,
    J.<nbsp>Approx.<nbsp>Theory <with|font-series|bold|91> (1997), 139\U204.

    <bibitem|Wheeler>J.<nbsp>C.<nbsp>Wheeler, <em|Modified moments and
    Gaussian quadratures>, Rocky Mountain J.<nbsp>Math.
    <with|font-series|bold|4> (1974), 287\U296.

    <bibitem|Gragg>W.<nbsp>B.<nbsp>Gragg, <em|The Padé table and its relation
    to certain algorithms of numerical analysis>, SIAM Review
    <with|font-series|bold|14> (1972), 1\U62.

    <bibitem|Hardy>G.<nbsp>H.<nbsp>Hardy, <em|Ramanujan: Twelve Lectures on
    Subjects Suggested by His Life and Work>, Chelsea, 1959. Chapter<nbsp>XI
    contains Hardy's rigorous proof of Ramanujan's master theorem.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|2|6>>
    <associate|auto-11|<tuple|3|7>>
    <associate|auto-12|<tuple|4|7>>
    <associate|auto-13|<tuple|5.3|7>>
    <associate|auto-14|<tuple|6|8>>
    <associate|auto-15|<tuple|1|8>>
    <associate|auto-16|<tuple|7|9>>
    <associate|auto-17|<tuple|7.1|9>>
    <associate|auto-18|<tuple|7.2|9>>
    <associate|auto-19|<tuple|7.3|11>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-20|<tuple|7.4|12>>
    <associate|auto-21|<tuple|8|13>>
    <associate|auto-22|<tuple|23|14>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|4|4>>
    <associate|auto-5|<tuple|1|4>>
    <associate|auto-6|<tuple|5|6>>
    <associate|auto-7|<tuple|5.1|6>>
    <associate|auto-8|<tuple|5.2|6>>
    <associate|auto-9|<tuple|1|6>>
    <associate|bib-Gragg|<tuple|Gragg|14>>
    <associate|bib-Hardy|<tuple|Hardy|14>>
    <associate|bib-SKM|<tuple|SKM|14>>
    <associate|bib-StahlBranch|<tuple|StahlBranch|14>>
    <associate|bib-StahlConvergence|<tuple|StahlConvergence|14>>
    <associate|bib-StahlExtremal|<tuple|StahlExtremal|14>>
    <associate|bib-StahlExtremalII|<tuple|StahlExtremalII|14>>
    <associate|bib-Wheeler|<tuple|Wheeler|14>>
    <associate|def:F|<tuple|9|5>>
    <associate|def:RL|<tuple|1|2>>
    <associate|def:fRic|<tuple|3|2>>
    <associate|def:growth|<tuple|12|6>>
    <associate|def:psi|<tuple|5|3>>
    <associate|eq:Fformula|<tuple|7|5>>
    <associate|eq:Volt|<tuple|2|2>>
    <associate|eq:a0|<tuple|3|4>>
    <associate|eq:ak|<tuple|4|4>>
    <associate|eq:fRic|<tuple|1|2>>
    <associate|eq:fk|<tuple|5|5>>
    <associate|eq:gevrey1|<tuple|9|11>>
    <associate|eq:mb_formula|<tuple|10|11>>
    <associate|eq:mellin_psi|<tuple|8|10>>
    <associate|eq:quad|<tuple|6|5>>
    <associate|lem:Psimu_radius|<tuple|7|3>>
    <associate|lem:Volt|<tuple|4|2>>
    <associate|lem:hadamard|<tuple|18|9>>
    <associate|lem:mb|<tuple|20|11>>
    <associate|lem:mellin_psi|<tuple|19|10>>
    <associate|lem:posdef|<tuple|13|6>>
    <associate|lem:power|<tuple|2|2>>
    <associate|lem:psi_eig|<tuple|6|3>>
    <associate|lem:stahl_F|<tuple|21|12>>
    <associate|rem:Fdistinct|<tuple|10|5>>
    <associate|sec:meromorphy|<tuple|7|9>>
    <associate|sec:padeconv|<tuple|6|8>>
    <associate|subsec:hadamard|<tuple|7.1|9>>
    <associate|subsec:mb|<tuple|7.3|11>>
    <associate|subsec:mellin|<tuple|7.2|9>>
    <associate|subsec:stahl|<tuple|7.4|12>>
    <associate|thm:Acont|<tuple|22|12>>
    <associate|thm:FRMP|<tuple|23|13>>
    <associate|thm:Muntz|<tuple|8|4>>
    <associate|thm:gragg|<tuple|17|8>>
    <associate|thm:quad|<tuple|11|5>>
    <associate|thm:wheeler|<tuple|14|7>>
    <associate|thm:wheeler_sym|<tuple|16|7>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      SKM

      Wheeler

      Hardy

      StahlExtremal

      StahlExtremalII

      StahlConvergence

      StahlBranch
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Setup
      and Notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Fox\UWright Weights> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Müntz\UTau Series> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Algebraic Quadratic via Generating Functions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|3tab>|Conventions.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      Chebyshev\UWheeler Algorithm> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Points of growth and
      positive-definiteness <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Wheeler's algorithm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|3tab>|Input. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|3tab>|Auxiliary array.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|3tab>|Recurrence coefficients.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|3tab>|Orthogonal polynomials.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|5.3<space|2spc>Symbolic transfer to the
      moment functional <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<cal-L\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Padé
      Denominators via Gragg's Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <with|par-left|<quote|3tab>|Padé convention.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Meromorphic
      Continuation of <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|A>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>

      <with|par-left|<quote|1tab>|7.1<space|2spc>The Hadamard fixed-point
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|7.2<space|2spc>The Mellin transform of
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<Psi\><rsub|\<mu\>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|7.3<space|2spc>Mellin\UBarnes realisation
      under Gevrey-1 growth <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|7.4<space|2spc>Stahl compact for
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|F>>
      and for <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|A>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>The
      Fractional Riccati\UMüntz\UPadé Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>