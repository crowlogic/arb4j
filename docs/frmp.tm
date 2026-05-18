<TeXmacs|2.1.5>

<style|<tuple|article|framed-theorems|alt-colors>>

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

    <assign|cpct|<macro|1|<math-up|cap>(<arg|1>)>>
  </hide-preamble>

  <doc-data|<doc-title|The Fractional Riccati--Müntz--Padé
  Theorem>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|May 18, 2026>>

  <abstract-data|<\abstract>
    The classical theory of Padé approximation achieves its deepest results
    when the function being approximated is meromorphic outside a compact set
    of minimal logarithmic capacity<emdash>Stahl's compact. The present paper
    extends this circle of ideas to solutions of fractional Riccati
    equations. Specifically, for the equation

    <\equation>
      <label|eq:abs_riccati>D<rsup|\<mu\>>*y=P<around|(|u|)>+Q<around|(|u|)>*<space|0.17em>y+R<around|(|u|)>*<space|0.17em>y<rsup|2>
    </equation>

    with polynomial coefficients <math|P,Q,R\<in\>\<bbb-C\><around|[|u|]>>,
    order <math|\<mu\>\<in\><around|(|0,1|]>>, and homogeneous
    Riemann--Liouville initial condition, the unique solution
    <math|y<around|(|t,u|)>> equals the limit, in logarithmic capacity, of
    its near-diagonal Müntz--Padé approximants of type
    <math|<around|[|M-1/M|]>> in the variable <math|z=t<rsup|\<mu\>>>.

    The argument turns on three interlocking observations. First, the
    solution admits an expansion <math|y=<big|sum><rsub|k>a<around|(|k,u|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>>
    whose coefficients obey an explicit Müntz--Tau recurrence driven by the
    Fox--Wright weights <math|\<psi\><rsub|k>=\<Gamma\>*<around|(|k*\<mu\>+1|)>/\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>>.
    Second, the generating function <math|A<around|(|z,u|)>=<big|sum><rsub|k>a<around|(|k,u|)>*<space|0.17em>z<rsup|k>>
    satisfies a Hadamard-product fixed-point equation
    <math|A=\<Psi\><rsub|\<mu\>>\<odot\>B<around|[|A|]>>, linking it to an
    auxiliary function <math|F<around|(|z,u|)>> that satisfies an explicit
    algebraic quadratic. Third, a Mellin--Barnes integral representation,
    valid under a Gevrey-1 bound established here from an explicit
    Cauchy-integral interpolation, transfers meromorphic continuation from
    the pole structure of <math|\<Psi\><rsub|\<mu\>>> to <math|A>, and a
    self-consistent fixed-point argument places <math|K<rsub|A>> inside
    <math|K<rsub|F>>.

    The Padé denominators are identified as the orthogonal polynomials of the
    moment functional <math|\<cal-L\><around|[|x<rsup|k>|]>=a<around|(|k,u|)>>,
    computed by the Chebyshev--Wheeler algorithm, and convergence follows
    from a direct proof of Stahl's theorem for the generic two-valued
    algebraic class containing <math|F>, given in the appendix.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Setup
    and Notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Fox\UWright Weights> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Müntz\UTau Series> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    Algebraic Quadratic via Generating Functions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|3tab|Conventions. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    Chebyshev\UWheeler Algorithm> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>Points of growth and
    positive-definiteness <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|5.2<space|2spc>Wheeler's algorithm
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|3tab|Auxiliary array. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|3tab|Coefficients. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|3tab|Orthogonal polynomials.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|5.3<space|2spc>Symbolic transfer
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Padé
    Denominators via Gragg's Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <with|par-left|3tab|Padé convention. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Meromorphic
    Continuation of <with|color|dark red|font-family|rm|<with|mode|math|A>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15><vspace|0.5fn>

    <with|par-left|1tab|7.1<space|2spc>Hadamard fixed-point equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <with|par-left|1tab|7.2<space|2spc>Mellin transform of <with|color|dark
    red|font-family|rm|<with|mode|math|\<Psi\><rsub|\<mu\>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>>

    <with|par-left|1tab|7.3<space|2spc>Mellin\UBarnes realisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <with|par-left|1tab|7.4<space|2spc>Stahl compact for <with|color|dark
    red|font-family|rm|<with|mode|math|F>> and for <with|color|dark
    red|font-family|rm|<with|mode|math|A>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>The
    Fractional Riccati\UMüntz\UPadé Theorem>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>A
    Direct Proof of Stahl's Theorem for the Generic Two-Valued Class over
    <with|color|dark red|font-family|rm|<with|mode|math|\<bbb-C\><around|(|z,\<Psi\><rsub|\<mu\>>|)>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21><vspace|0.5fn>

    <with|par-left|1tab|9.1<space|2spc>Logarithmic capacity and the energy
    minimum <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>>

    <with|par-left|1tab|9.2<space|2spc>Extremal domain (Stahl)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>>

    <with|par-left|1tab|9.3<space|2spc>Branch transfer along the Hadamard
    fixed point <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    <with|par-left|1tab|9.4<space|2spc>Convergence in capacity (Stahl)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26><vspace|0.5fn>
  </table-of-contents>

  <section|Setup and Notation>

  The Riemann\ULiouville calculus provides the natural framework for
  fractional Riccati equations.

  <\definition>
    [Riemann\ULiouville operators]<label|def:RL> For
    <math|\<mu\>\<in\><around|(|0,1|]>> and <math|f> locally integrable on
    <math|<around|(|0,\<infty\>|)>>,

    <\align>
      <tformat|<table|<row|<cell|<Imu>f<around|(|t|)>>|<cell|\<assign\><frac|1|\<Gamma\><around|(|\<mu\>|)>>*<big|int><rsub|0><rsup|t><around|(|t-s|)><rsup|\<mu\>-1>*f<around|(|s|)>*<space|0.17em>d*s,<eq-number><label|eq:RL_int>>>|<row|<cell|<vspace*|6pt><Dmu>f<around|(|t|)>>|<cell|\<assign\><frac|d|d*t><around*|(|<Icomu>f|)><around|(|t|)>.<eq-number><label|eq:RL_der>>>>>
    </align>
  </definition>

  <\lemma>
    [Power rule]<label|lem:power> For <math|s\<gtr\>-1>,

    <\equation>
      <label|eq:power_rule><Imu>t<rsup|s>=<frac|\<Gamma\>*<around|(|s+1|)>|\<Gamma\>*<around|(|s+\<mu\>+1|)>>*<space|0.17em>t<rsup|s+\<mu\>>.
    </equation>
  </lemma>

  <\proof>
    The substitution <math|\<sigma\>=t*\<tau\>> in the defining
    integral<nbsp><eqref|eq:RL_int> reduces the integral to the beta function

    <\equation>
      <label|eq:beta_id>B<around|(|\<mu\>,s+1|)>=<frac|\<Gamma\><around|(|\<mu\>|)>*\<Gamma\>*<around|(|s+1|)>|\<Gamma\>*<around|(|s+\<mu\>+1|)>>,
    </equation>

    which gives<nbsp><eqref|eq:power_rule>.
  </proof>

  <\definition>
    [Fractional Riccati equation]<label|def:fRic>

    <\equation>
      <label|eq:fRic><Dmu>y<around|(|t,u|)>=P<around|(|u|)>+Q<around|(|u|)>*<space|0.17em>y<around|(|t,u|)>+R<around|(|u|)>*<space|0.17em>y<around|(|t,u|)><rsup|2>,<space|2em><Icomu>y<around|(|0,u|)>=0.
    </equation>
  </definition>

  <\lemma>
    [Volterra form]<label|lem:Volt> Equation<nbsp><eqref|eq:fRic> is
    equivalent to

    <\equation>
      <label|eq:Volt>y=<Imu><space|-0.17em><around*|[|P+Q*<space|0.17em>y+R*<space|0.17em>y<rsup|2>|]>.
    </equation>
  </lemma>

  <\proof>
    Application of <math|I<rsup|\<mu\>>> to<nbsp><eqref|eq:fRic>, the
    composition formula <cite-detail|SKM|Theorem<nbsp>2.4>, and the
    homogeneous initial condition <math|I<rsup|1-\<mu\>>*y<around|(|0,u|)>=0>
    together kill the boundary term and yield <eqref|eq:Volt>.
  </proof>

  <section|The Fox\UWright Weights>

  <\definition>
    [Fox\UWright weights and kernel]<label|def:psi>

    <\align>
      <tformat|<table|<row|<cell|\<psi\><rsub|k>>|<cell|\<assign\><frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>>,<space|1em>k\<ge\>0,<eq-number><label|eq:psi_def>>>|<row|<cell|<vspace*|3pt><Psimu><around|(|z|)>>|<cell|\<assign\><big|sum><rsub|k=0><rsup|\<infty\>>\<psi\><rsub|k>*<space|0.17em>z<rsup|k>.<eq-number><label|eq:Psi_def>>>>>
    </align>
  </definition>

  <\lemma>
    [Eigenvalue action]<label|lem:psi_eig> For <math|k\<ge\>0>,

    <\equation>
      <label|eq:psi_eig><Imu>t<rsup|<around|(|k+1|)>*\<mu\>>=\<psi\><rsub|k+1>*<space|0.17em>t<rsup|<around|(|k+2|)>*\<mu\>>.
    </equation>
  </lemma>

  <\proof>
    Application of Lemma<nbsp><reference|lem:power>,
    equation<nbsp><eqref|eq:power_rule>, with
    <math|s=<around|(|k+1|)>*\<mu\>> gives<nbsp><eqref|eq:psi_eig>.
  </proof>

  <\lemma>
    [Radius of convergence]<label|lem:Psimu_radius> <math|<Psimu>> has radius
    of convergence <math|1>.
  </lemma>

  <\proof>
    By Stirling,

    <\equation>
      <label|eq:psi_asymp>\<psi\><rsub|k>=<frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+\<mu\>+1|)>>\<sim\><around|(|k*\<mu\>|)><rsup|-\<mu\>>*<space|2em><around|(|k\<to\>\<infty\>|)>.
    </equation>

    Hence

    <\equation>
      <label|eq:psi_log><frac|1|k>*log <around|\||\<psi\><rsub|k>|\|>=-<frac|\<mu\>|k>*<space|0.17em>log
      <around|(|k*\<mu\>|)>+o<space|-0.17em><around*|(|<tfrac|1|k>|)><space|0.27em>\<longrightarrow\><space|0.27em>0,
    </equation>

    so <math|limsup<rsub|k\<to\>\<infty\>><around|\||\<psi\><rsub|k>|\|><rsup|1/k>=1>,
    and the radius of convergence of <math|\<Psi\><rsub|\<mu\>>> is <math|1>.
  </proof>

  <section|The Müntz\UTau Series>

  <\theorem>
    [Müntz\UTau recurrence]<label|thm:Muntz> The unique solution
    of<nbsp><eqref|eq:Volt> admits the expansion

    <\equation>
      <label|eq:Muntz_ansatz>y<around|(|t,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>
    </equation>

    on <math|<around|[|0,T<rsub|0>|]>> for some <math|T<rsub|0>\<gtr\>0>,
    with

    <\align>
      <tformat|<table|<row|<cell|a<around|(|0,u|)>>|<cell|=P<around|(|u|)>*<space|0.17em>\<psi\><rsub|0>,<eq-number><label|eq:a0>>>|<row|<cell|<vspace*|3pt>a<around|(|k,u|)>>|<cell|=\<psi\><rsub|k>*<space|-0.17em><around*|(|Q<around|(|u|)>*<space|0.17em>a<around|(|k-1,u|)>+R<around|(|u|)>*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em><space|-0.17em>a<around|(|j,u|)>*<space|0.17em>a<around|(|\<ell\>,u|)>|)>,<space|0.27em><space|0.27em>k\<ge\>1.<eq-number><label|eq:ak>>>>>
    </align>
  </theorem>

  <\proof>
    The map

    <\equation>
      <label|eq:contraction>\<cal-T\><around|[|y|]>\<assign\><Imu><around|(|P+Q*y+R*y<rsup|2>|)>
    </equation>

    is a contraction on <math|C*<around|[|0,T<rsub|0>|]>> for
    <math|T<rsub|0><rsup|\<mu\>>> sufficiently small. Substitution of the
    Müntz ansatz<nbsp><eqref|eq:Muntz_ansatz> and application of
    Lemma<nbsp><reference|lem:psi_eig> match coefficients of
    <math|t<rsup|<around|(|k+1|)>*\<mu\>>>: <math|k=0>
    gives<nbsp><eqref|eq:a0>; <math|k\<ge\>1> gives<nbsp><eqref|eq:ak>.
  </proof>

  <section|The Algebraic Quadratic via Generating Functions>

  <paragraph|Conventions.> Coefficient extraction

  <\equation>
    <label|eq:conv_extract><around|[|z<rsup|k>|]>*b\<assign\>b<rsub|k>,
  </equation>

  Cauchy product

  <\equation>
    <label|eq:conv_cauchy><around|[|z<rsup|k>|]>*<around|(|F\<cdot\>G|)>=<big|sum><rsub|j>f<rsub|j>*g<rsub|k-j>,
  </equation>

  Hadamard product

  <\equation>
    <label|eq:conv_hadamard><around|[|z<rsup|k>|]>*<around|(|F\<odot\>G|)>=f<rsub|k>*g<rsub|k>.
  </equation>

  <\definition>
    [Auxiliary generating function]<label|def:F> Set
    <math|f*<around|(|0,u|)>\<assign\>P*\<psi\><rsub|0>> and, for
    <math|k\<ge\>1>,

    <\equation>
      <label|eq:fk>f*<around|(|k,u|)>\<assign\>Q*<space|0.17em>f*<around|(|k-1,u|)>+R*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em><space|-0.17em>f*<around|(|j,u|)>*f*<around|(|\<ell\>,u|)>+P*\<psi\><rsub|k>.
    </equation>

    Define

    <\equation>
      <label|eq:F_def>F<around|(|z,u|)>\<assign\><big|sum><rsub|k\<ge\>0>f*<around|(|k,u|)>*<space|0.17em>z<rsup|k>.
    </equation>
  </definition>

  <\remark>
    <label|rem:Fdistinct>In<nbsp><eqref|eq:ak> the bracket is premultiplied
    by <math|\<psi\><rsub|k>>; in <eqref|eq:fk> the term
    <math|P*\<psi\><rsub|k>> is a separate source. Hence <math|F\<ne\>A> and
    neither <math|<Psimu>\<cdot\>A> nor <math|<Psimu>\<odot\>A> equals
    <math|F>. The bridge is the Hadamard fixed point of
    Section<nbsp><reference|sec:meromorphy>. Comparison of first-order
    coefficients gives

    <\align>
      <tformat|<table|<row|<cell|a<around|(|1,u|)>>|<cell|=\<psi\><rsub|1>*<around*|(|Q*P*\<psi\><rsub|0>+R*<around|(|P*\<psi\><rsub|0>|)><rsup|2>|)>,<eq-number><label|eq:a1_witness>>>|<row|<cell|<vspace*|3pt>f*<around|(|1,u|)>>|<cell|=Q*P*\<psi\><rsub|0>+R*<around|(|P*\<psi\><rsub|0>|)><rsup|2>+P*\<psi\><rsub|1>,<eq-number><label|eq:f1_witness>>>>>
    </align>

    which differ as elements of <math|<C><around|[|u|]>> for generic
    <math|P,Q,R,\<mu\>>.
  </remark>

  <\theorem>
    [Algebraic quadratic for <math|F>]<label|thm:quad> <math|F> satisfies

    <\equation>
      <label|eq:quad>z*R*<space|0.17em>F<rsup|2>-<around|(|1-z*Q|)>*<space|0.17em>F+P<space|0.17em><Psimu>=0,
    </equation>

    with the closed form

    <\equation>
      <label|eq:Fformula>F<around|(|z,u|)>=<frac|<around|(|1-z*Q|)>-<sqrt|<around|(|1-z*Q|)><rsup|2>-4*z*P*R<space|0.17em><Psimu><around|(|z|)>>|2*z*R>.
    </equation>
  </theorem>

  <\proof>
    Coefficient-by-coefficient,

    <\equation>
      <label|eq:quad_aux>G\<assign\>z*R*F<rsup|2>-<around|(|1-z*Q|)>*F+P<Psimu>
    </equation>

    satisfies <math|<around|[|z<rsup|0>|]>*G=0> and
    <math|<around|[|z<rsup|k>|]>*G=0> for <math|k\<ge\>1>
    by<nbsp><eqref|eq:fk>. Expansion of the discriminant,

    <\equation>
      <label|eq:disc_expand><sqrt|\<Delta\>>=1-z*<around|(|Q+2*P*R*\<psi\><rsub|0>|)>+O<around|(|z<rsup|2>|)>,
    </equation>

    shows the minus branch of<nbsp><eqref|eq:Fformula> has constant term
    <math|P*\<psi\><rsub|0>=f*<around|(|0,u|)>>, the unique formal
    power-series root since

    <\equation>
      <around*|\<nobracket\>|<label|eq:linearised_zero>\<partial\><rsub|F>*<space|-0.17em><around*|[|z*R*F<rsup|2>-<around|(|1-z*Q|)>*F+P<Psimu>|]>|\|><rsub|z=0>=-1.
    </equation>
  </proof>

  <section|The Chebyshev\UWheeler Algorithm>

  <subsection|Points of growth and positive-definiteness>

  <\definition>
    <label|def:growth>For <math|\<lambda\>> non-decreasing right-continuous,
    <math|x<rsub|0>> is a point of growth if
    <math|\<lambda\>*<around|(|x<rsub|0>+\<varepsilon\>|)>-\<lambda\>*<around|(|x<rsub|0>-\<varepsilon\>|)>\<gtr\>0>
    for all <math|\<varepsilon\>\<gtr\>0>. Set

    <\equation>
      <label|eq:G_lambda>G<around|(|\<lambda\>|)>\<assign\><math-up|supp><around|(|d*\<lambda\>|)>,<space|2em>N<rsub|\<lambda\>>\<assign\><around|\||G<around|(|\<lambda\>|)>|\|>.
    </equation>
  </definition>

  <\lemma>
    <label|lem:posdef>The form

    <\equation>
      <label|eq:inner_prod><around|\<langle\>|f,g|\<rangle\>><rsub|\<lambda\>>\<assign\><big|int>f*g*<space|0.17em>d*\<lambda\>
    </equation>

    is positive-definite on <math|<R><around|[|x|]>> iff
    <math|N<rsub|\<lambda\>>=\<infty\>>.
  </lemma>

  <\proof>
    <math|(\<Leftarrow\>)> A degree-<math|d> polynomial vanishes at
    <math|\<le\>d> points, so <math|f<rsup|2>> is positive on some point of
    growth. <math|(\<Rightarrow\>)> If <math|G<around|(|\<lambda\>|)>=<around|{|x<rsub|1>,\<ldots\>,x<rsub|M>|}>>,
    then

    <\equation>
      <label|eq:vanishing_poly>f<around|(|x|)>\<assign\><big|prod><rsub|j=1><rsup|M><around|(|x-x<rsub|j>|)>
    </equation>

    vanishes on <math|G<around|(|\<lambda\>|)>>, giving
    <math|<big|int>f<rsup|2>*<space|0.17em>d*\<lambda\>=0>.
  </proof>

  <subsection|Wheeler's algorithm>

  <paragraph|Auxiliary array.> Initial data and recurrence:

  <\align>
    <tformat|<table|<row|<cell|\<sigma\><around|(|-1,\<ell\>|)>>|<cell|=0,<eq-number><label|eq:sigma_init1>>>|<row|<cell|<vspace*|3pt>\<sigma\><around|(|0,\<ell\>|)>>|<cell|=\<mu\><around|(|\<ell\>|)>,<eq-number><label|eq:sigma_init2>>>|<row|<cell|<vspace*|3pt>\<sigma\><around|(|k,\<ell\>|)>>|<cell|=\<sigma\><around|(|k-1,\<ell\>+1|)>-\<alpha\>*<around|(|k-1|)>*\<sigma\><around|(|k-1,\<ell\>|)>-\<beta\>*<around|(|k-1|)>*\<sigma\><around|(|k-2,\<ell\>|)>.<eq-number><label|eq:sigma_rec>>>>>
  </align>

  <paragraph|Coefficients.>

  <\align>
    <tformat|<table|<row|<cell|\<alpha\><around|(|0|)>>|<cell|=\<mu\><around|(|1|)>/\<mu\><around|(|0|)>,<space|2em>\<beta\><around|(|0|)>=\<mu\><around|(|0|)>,<eq-number><label|eq:ab0>>>|<row|<cell|<vspace*|3pt>\<alpha\><around|(|k|)>>|<cell|=<frac|\<sigma\><around|(|k,k+1|)>|\<sigma\><around|(|k,k|)>>-<frac|\<sigma\><around|(|k-1,k|)>|\<sigma\><around|(|k-1,k-1|)>>,<eq-number><label|eq:alpha_k>>>|<row|<cell|<vspace*|3pt>\<beta\><around|(|k|)>>|<cell|=<frac|\<sigma\><around|(|k,k|)>|\<sigma\><around|(|k-1,k-1|)>>.<eq-number><label|eq:beta_k>>>>>
  </align>

  <paragraph|Orthogonal polynomials.>

  <\align>
    <tformat|<table|<row|<cell|\<pi\><rsub|-1>>|<cell|=0,<space|2em>\<pi\><rsub|0>=1,<eq-number><label|eq:pi_init>>>|<row|<cell|<vspace*|3pt>\<pi\><rsub|k+1>>|<cell|=<around|(|x-\<alpha\><around|(|k|)>|)>*<space|0.17em>\<pi\><rsub|k>-\<beta\><around|(|k|)>*<space|0.17em>\<pi\><rsub|k-1>.<eq-number><label|eq:pi_rec>>>>>
  </align>

  <\theorem>
    [Wheeler]<label|thm:wheeler> <math|\<sigma\><around|(|k,k|)>\<gtr\>0> and

    <\equation>
      <label|eq:wheeler_norm><big|int>\<pi\><rsub|j>*\<pi\><rsub|k>*<space|0.17em>d*\<lambda\>=\<delta\><rsub|j*k>*<big|prod><rsub|i=0><rsup|k>\<beta\><around|(|i|)>.
    </equation>
  </theorem>

  <\proof>
    Set

    <\equation>
      <label|eq:tilde_sigma><wide|\<sigma\>|~><around|(|k,\<ell\>|)>\<assign\><big|int>\<pi\><rsub|k>*<space|0.17em>x<rsup|\<ell\>>*<space|0.17em>d*\<lambda\>.
    </equation>

    This matches <math|\<sigma\>> in initial data and recurrence, so they
    coincide. Induction shows <math|\<pi\><rsub|k>\<perp\><around|{|1,\<ldots\>,x<rsup|k-1>|}>>,
    giving <math|\<sigma\><around|(|k,\<ell\>|)>=0> for
    <math|\<ell\>\<less\>k> and <math|\<sigma\><around|(|k,k|)>=<around|\<langle\>|\<pi\><rsub|k>,\<pi\><rsub|k>|\<rangle\>><rsub|\<lambda\>>\<gtr\>0>
    by Lemma<nbsp><reference|lem:posdef>. The norm formula follows from

    <\equation>
      <label|eq:norm_telescope><around|\<langle\>|\<pi\><rsub|k>,\<pi\><rsub|k>|\<rangle\>>=\<beta\><around|(|k|)><space|0.17em><around|\<langle\>|\<pi\><rsub|k-1>,\<pi\><rsub|k-1>|\<rangle\>>.
    </equation>
  </proof>

  <subsection|Symbolic transfer>

  <\definition>
    <label|def:quasidef><math|<around|{|a<around|(|k,u|)>|}>> is
    <em|quasi-definite> if the Hankel determinants

    <\equation>
      <label|eq:hankel>H<rsub|n><around|(|u|)>\<assign\>det
      <around*|(|a<around|(|i+j,u|)>|)><rsub|0\<le\>i,j\<less\>n>
    </equation>

    satisfy <math|H<rsub|n><around|(|u|)>\<nequiv\>0> for all <math|n>.
  </definition>

  <\theorem>
    [Symbolic Wheeler]<label|thm:wheeler_sym> Under quasi-definiteness,
    <math|\<sigma\><around|(|k,k,u|)>\<nequiv\>0>, and the orthogonal
    polynomials <math|P<rsub|k>> of the functional
    <math|<Lk><around|[|x<rsup|\<ell\>>|]>=a<around|(|\<ell\>,u|)>> satisfy

    <\equation>
      <label|eq:wheeler_sym_norm><Lk><around|[|P<rsub|j>*P<rsub|k>|]>=\<delta\><rsub|j*k>*<big|prod><rsub|i=0><rsup|k>\<beta\><rsub|i><around|(|u|)><space|1em><text|in
      ><C><around|(|u|)>.
    </equation>
  </theorem>

  <\proof>
    The Hankel ratio gives

    <\equation>
      <label|eq:sigma_hankel>\<sigma\><around|(|k,k,u|)>=<frac|H<rsub|k+1><around|(|u|)>|H<rsub|k><around|(|u|)>>\<nequiv\>0.
    </equation>

    The identity

    <\equation>
      <label|eq:sigma_via_L>\<sigma\><around|(|k,\<ell\>,u|)>=<Lk><around|[|x<rsup|\<ell\>>*P<rsub|k>|]>
    </equation>

    holds by induction, and <math|<Lk><around|[|P<rsub|k><rsup|2>|]>=\<sigma\><around|(|k,k,u|)>>
    telescopes to<nbsp><eqref|eq:wheeler_sym_norm>.
  </proof>

  <section|Padé Denominators via Gragg's Theorem><label|sec:padeconv>

  <paragraph|Padé convention.> The <math|M>-th approximant has <math|deg
  N<rsub|M>\<le\>M-1>, <math|deg D<rsub|M>\<le\>M>, and is therefore of type
  <math|<around|[|M-1/M|]>>. Its denominator sequence
  <math|<around|{|D<rsub|M>|}>> is identical to that of the diagonal
  <math|<around|[|M/M|]>> table; these approximants are <em|diagonal>,
  following Stahl.

  <\theorem>
    [Gragg, symbolic form]<label|thm:gragg> There is a unique pair
    <math|<around|(|N<rsub|M>,D<rsub|M>|)>> with <math|deg
    N<rsub|M>\<le\>M-1>, <math|deg D<rsub|M>\<le\>M>,
    <math|D<rsub|M>*<around|(|0,u|)>=1>, and

    <\equation>
      <label|eq:pade_match>D<rsub|M>*<space|0.17em>A-N<rsub|M>=O<around|(|z<rsup|2*M>|)>,
    </equation>

    satisfying

    <\equation>
      <label|eq:pade_reciprocal>D<rsub|M>*<around|(|z,u|)>=z<rsup|M>*<space|0.17em>P<rsub|M>*<around|(|z<rsup|-1>,u|)>.
    </equation>
  </theorem>

  <\proof>
    The <math|M> matching conditions

    <\equation>
      <label|eq:match_zeros><around|[|z<rsup|j>|]>*<around|(|D<rsub|M>*A|)>=0,<space|2em>j=M,\<ldots\>,2*M-1,
    </equation>

    become, with <math|Q<rsub|M>*<around|(|x,u|)>\<assign\>x<rsup|M>*D<rsub|M>*<around|(|x<rsup|-1>,u|)>>,
    the orthogonality

    <\equation>
      <label|eq:Q_orth><Lk><around|[|x<rsup|i>*Q<rsub|M>|]>=0,<space|2em>i=0,\<ldots\>,M-1.
    </equation>

    The monic <math|Q<rsub|M>> of degree <math|\<le\>M> matching these
    conditions is unique by Theorem<nbsp><reference|thm:wheeler_sym>:
    <math|Q<rsub|M>=P<rsub|M>>. Since <math|P<rsub|M>> is monic,
    <math|D<rsub|M>*<around|(|0,u|)>=1>.
  </proof>

  <section|Meromorphic Continuation of <math|A>><label|sec:meromorphy>

  This section establishes that <math|A> is meromorphic on
  <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>>, the universal cover
  of <math|<C>\<setminus\><around|{|0|}>> minus a compact
  <math|K<rsub|A><around|(|u|)>\<subseteq\>K<rsub|F><around|(|u|)>> of
  minimal logarithmic capacity.

  <subsection|Hadamard fixed-point equation><label|subsec:hadamard>

  <\lemma>
    <label|lem:hadamard>With

    <\equation>
      <label|eq:B_def>B<around|[|A|]>\<assign\>P+z*Q*A+z*R*A<rsup|2>,
    </equation>

    the identity

    <\equation>
      <label|eq:hadamard_fp>A=<Psimu>\<odot\>B<around|[|A|]>
    </equation>

    holds.
  </lemma>

  <\proof>
    <math|<around|[|z<rsup|0>|]>*B<around|[|A|]>=P> gives
    <math|\<psi\><rsub|0>*P=a<around|(|0|)>>. For <math|k\<ge\>1>,

    <\equation>
      <label|eq:zk_BA><around|[|z<rsup|k>|]>*B<around|[|A|]>=Q*<space|0.17em>a*<around|(|k-1|)>+R*<big|sum><rsub|j+\<ell\>=k-1>a<around|(|j|)>*<space|0.17em>a<around|(|\<ell\>|)>,
    </equation>

    and multiplication of<nbsp><eqref|eq:zk_BA> by <math|\<psi\><rsub|k>>
    recovers <math|a<around|(|k|)>> by<nbsp><eqref|eq:ak>.
  </proof>

  <subsection|Mellin transform of <math|<Psimu>>><label|subsec:mellin>

  <\lemma>
    [Mellin transform]<label|lem:mellin_psi> For
    <math|0\<less\>\<Re\>*s\<less\>1>,

    <\equation>
      <label|eq:mellin_psi><big|int><rsub|0><rsup|\<infty\>><Psimu><around|(|-x|)>*<space|0.17em>x<rsup|s-1>*<space|0.17em>d*x=\<Gamma\><around|(|s|)>*\<Gamma\>*<around|(|1-s|)>*<frac|\<Gamma\>*<around|(|1-s*\<mu\>|)>|\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>>=:M<rsub|<Psimu>><around|(|s|)>.
    </equation>

    <math|M<rsub|<Psimu>>> extends meromorphically to <math|<C>> with poles
    at <math|<Z><rsub|\<le\>0>>, <math|<Z><rsub|\<ge\>1>>, and
    <math|<around|(|1+m|)>/\<mu\>> for <math|m\<ge\>0>. A pole at
    <math|<around|(|1+m|)>/\<mu\>> is cancelled by a denominator pole at
    <math|1+<around|(|1+n|)>/\<mu\>> iff <math|m-n=\<mu\>>; for
    <math|\<mu\>\<in\><around|(|0,1|]>> this requires <math|\<mu\>=1>. For
    <math|\<mu\>\<in\><around|(|0,1|)>> the lattice
    <math|<around|{|<around|(|1+m|)>/\<mu\>|}>> survives uncancelled.
  </lemma>

  <\proof>
    Write

    <\equation>
      <label|eq:Psi_phi_series><Psimu><around|(|-x|)>=<big|sum><rsub|k\<ge\>0><frac|<around|(|-x|)><rsup|k>*<space|0.17em>\<varphi\><around|(|k|)>|k!>,<space|2em>\<varphi\><around|(|k|)>\<assign\>k!<space|0.17em>\<psi\><rsub|k>.
    </equation>

    The interpolation

    <\equation>
      <label|eq:phi_interp>\<varphi\><around|(|s|)>=<frac|\<Gamma\>*<around|(|s+1|)>*<space|0.17em>\<Gamma\>*<around|(|s*\<mu\>+1|)>|\<Gamma\>*<around|(|s*\<mu\>+\<mu\>+1|)>>
    </equation>

    is entire. Stirling on a vertical line <math|\<Re\>*s=\<sigma\>> gives

    <\equation>
      <label|eq:phi_stirling><around|\||\<varphi\>*<around|(|\<sigma\>+i*\<tau\>|)>|\|>\<sim\>C*<around|(|\<sigma\>,\<mu\>|)><space|0.17em><around|\||\<tau\>|\|><rsup|<space|0.17em>\<sigma\>+\<mu\>*\<sigma\>-\<mu\>+1/2>*<space|0.17em>e<rsup|-<around|(|\<pi\>/2|)><around|\||\<tau\>|\|>>*<space|2em><around|(|<around|\||\<tau\>|\|>\<to\>\<infty\>|)>,
    </equation>

    where <math|C*<around|(|\<sigma\>,\<mu\>|)>\<gtr\>0> depends only on
    <math|\<sigma\>> and <math|\<mu\>\<in\><around|(|0,1|]>>. The exponential
    rate <math|\<pi\>/2\<less\>\<pi\>> satisfies Hardy's growth condition
    <cite-detail|Hardy|Lecture<nbsp>XI, ŸŸ11.2, 11.10--11.13>, and
    Ramanujan's master theorem gives

    <\equation>
      <label|eq:ramanujan_master><big|int><rsub|0><rsup|\<infty\>><Psimu><around|(|-x|)>*<space|0.17em>x<rsup|s-1>*<space|0.17em>d*x=\<Gamma\><around|(|s|)>*<space|0.17em>\<varphi\>*<around|(|-s|)>.
    </equation>

    The cancellation analysis is recorded in the statement.
  </proof>

  <subsection|Mellin\UBarnes realisation><label|subsec:mb>

  <\lemma>
    <label|lem:mb>Let

    <\equation>
      <label|eq:G_series>G<around|(|z,u|)>=<big|sum><rsub|k\<ge\>0>g<rsub|k><around|(|u|)>*<space|0.17em>z<rsup|k>
    </equation>

    be holomorphic in <math|<around|\||z|\|>\<less\>\<rho\>>, with
    Ramanujan-normalised entire interpolation

    <\equation>
      <label|eq:Ghat_R_def><wide|G|^><rsub|R><around|(|s,u|)>\<assign\><frac|<wide|G|^><around|(|s,u|)>|\<Gamma\>*<around|(|s+1|)>>,
    </equation>

    where <math|<wide|G|^>> is the Cauchy interpolation
    of<nbsp><eqref|eq:Ghat> below, satisfying
    <math|<wide|G|^><rsub|R><around|(|k,u|)>=g<rsub|k><around|(|u|)>> at
    integers and the Gevrey-1 bound

    <\equation>
      <label|eq:gevrey1><around|\||<wide|G|^><around|(|\<sigma\>+i*\<tau\>,u|)>|\|>\<le\>K<rsub|G><rprime|'>*<space|0.17em>C<rsub|G><rsup|<around|\||\<sigma\>|\|>+1>*<space|0.17em><around|\||\<Gamma\>*<around|(|\<sigma\>+i*\<tau\>+1|)>|\|>.
    </equation>

    Fix <math|c\<in\><around|(|0,1|)>> avoiding poles of
    <math|M<rsub|<Psimu>>>. For <math|<around|\||arg
    <around|(|-z|)>|\|>\<less\>\<pi\>/2> and
    <math|<around|\||z|\|>\<less\>min <around|(|1,\<rho\>|)>>,

    <\equation>
      <label|eq:mb_formula><around|(|<Psimu>\<odot\>G|)><around|(|z,u|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|c-i*\<infty\>><rsup|c+i*\<infty\>>M<rsub|<Psimu>><around|(|s|)>*<space|0.17em><wide|G|^><rsub|R><around|(|-s,u|)>*<space|0.17em><around|(|-z|)><rsup|-s>*<space|0.17em>d*s.
    </equation>

    The integrand decays as

    <\equation>
      <label|eq:integrand_decay>e<rsup|-<around|(|\<pi\>/2|)><around|\||\<tau\>|\|>><space|0.17em><around|\||\<tau\>|\|><rsup|C<rsub|1>+C<rsub|2>>,
    </equation>

    so the integral converges absolutely on the sector and continues
    meromorphically to <math|<wide|X|~>> minus the projected pole set of
    <math|M<rsub|<Psimu>>*<wide|G|^><rsub|R>>.
  </lemma>

  <\proof>
    Closing the contour to the left, the simple pole of
    <math|\<Gamma\><around|(|s|)>> at <math|s=-k> has residue
    <math|<around|(|-1|)><rsup|k>/k>!. Split

    <\equation>
      <label|eq:M_split>M<rsub|<Psimu>><around|(|s|)>=\<Gamma\><around|(|s|)>\<cdot\>H<around|(|s|)>,<space|2em>H<around|(|s|)>\<assign\><frac|\<Gamma\>*<around|(|1-s|)>*<space|0.17em>\<Gamma\>*<around|(|1-s*\<mu\>|)>|\<Gamma\>*<around|(|\<mu\>+1-s*\<mu\>|)>>,
    </equation>

    so that <math|\<Gamma\><around|(|s|)>> is the only factor producing a
    pole at <math|s=-k>. At <math|s=-k>,

    <\align>
      <tformat|<table|<row|<cell|H*<around|(|-k|)>>|<cell|=\<Gamma\>*<around|(|1+k|)>*<space|0.17em><frac|\<Gamma\>*<around|(|1+k*\<mu\>|)>|\<Gamma\>*<around|(|\<mu\>+1+k*\<mu\>|)>>=k!<space|0.17em>\<psi\><rsub|k>,<eq-number><label|eq:H_at_mk>>>|<row|<cell|<vspace*|3pt><wide|G|^><rsub|R><around|(|-s,u|)><mid|\|><rsub|s=-k>>|<cell|=<wide|G|^><rsub|R><around|(|k,u|)>=g<rsub|k><around|(|u|)>,<eq-number><label|eq:GR_at_mk>>>|<row|<cell|<vspace*|3pt><around|(|-z|)><rsup|-s><mid|\|><rsub|s=-k>>|<cell|=<around|(|-1|)><rsup|k>*z<rsup|k>.<eq-number><label|eq:zpow_at_mk>>>>>
    </align>

    Therefore

    <\equation>
      <label|eq:residue><with|math-font-family|rm|\<ast\>>R*e*s<rsub|s=-k>*<space|-0.17em><around*|[|M<rsub|\<Psi\><rsub|\<mu\>>><around|(|s|)>*<space|0.17em><wide|G|^><rsub|R><around|(|-s,u|)>*<space|0.17em><around|(|-z|)><rsup|-s>|]>=<frac|<around|(|-1|)><rsup|k>|k!>\<cdot\>k!<space|0.17em>\<psi\><rsub|k>\<cdot\>g<rsub|k><around|(|u|)>\<cdot\><around|(|-1|)><rsup|k>*z<rsup|k>=\<psi\><rsub|k>*<space|0.17em>g<rsub|k><around|(|u|)>*<space|0.17em>z<rsup|k>,
    </equation>

    using <math|<around|(|-1|)><rsup|k>*<around|(|-1|)><rsup|k>=1>. Summation
    over <math|k\<ge\>0> recovers

    <\equation>
      <label|eq:residue_sum><big|sum><rsub|k\<ge\>0>\<psi\><rsub|k>*<space|0.17em>g<rsub|k>*<space|0.17em>z<rsup|k>=\<Psi\><rsub|\<mu\>>\<odot\>G.
    </equation>

    Continuation to <math|<wide|X|~>> is by the identity principle along
    chains of overlapping disks.
  </proof>

  <subsection|Stahl compact for <math|F> and for
  <math|A>><label|subsec:stahl>

  <\lemma>
    <label|lem:stahl_F>There is a unique compact
    <math|K<rsub|F><around|(|u|)>\<supseteq\>K<rsub|\<Psi\>>> of minimal
    capacity outside which <math|<sqrt|\<Delta\><rsub|F>>>, hence <math|F>,
    is single-valued meromorphic on <math|<wide|X|~>>. Here

    <\equation>
      <label|eq:Delta_F>\<Delta\><rsub|F>=<around|(|1-z*Q|)><rsup|2>-4*z*P*R<space|0.17em><Psimu>,
    </equation>

    and <math|K<rsub|\<Psi\>>> is the projected pole set of
    <math|M<rsub|<Psimu>>>.
  </lemma>

  <\proof>
    By Lemma<nbsp><reference|lem:mellin_psi>, <math|\<Delta\><rsub|F>> is
    meromorphic on <math|<wide|X|~>\<setminus\>K<rsub|\<Psi\>>>.
    Theorem<nbsp><reference|thm:stahl_extremal> of the appendix produces the
    unique minimal-capacity compact <math|K<rsub|F><around|(|u|)>\<supseteq\>K<rsub|\<Psi\>>>
    outside which <math|<sqrt|\<Delta\><rsub|F>>> is single-valued.
  </proof>

  <\theorem>
    [Meromorphic continuation of <math|A>]<label|thm:Acont> Under
    quasi-definiteness, <math|A> is meromorphic on
    <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>> with
    <math|K<rsub|A><around|(|u|)>\<subseteq\>K<rsub|F><around|(|u|)>>.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Gevrey-1 bound on
    <math|<around|{|a<around|(|k,u|)>|}>> and
    <math|<around|{|g<rsub|k><around|(|u|)>|}>>.> Fix <math|u> in a compact
    subset of parameter space. Since <math|\<psi\><rsub|k>> is decreasing in
    <math|k> for fixed <math|\<mu\>\<in\><around|(|0,1|]>>, the supremum is
    attained at <math|k=0>:

    <\equation>
      <label|eq:C0_def>C<rsub|0>\<assign\>sup<rsub|k\<ge\>0><around|\||\<psi\><rsub|k>|\|>=\<psi\><rsub|0>=<frac|1|\<Gamma\>*<around|(|\<mu\>+1|)>>\<less\>\<infty\><space|1em><text|(by
      Lemma<nbsp><reference|lem:Psimu_radius>)>.
    </equation>

    Set

    <\equation>
      <label|eq:M_PQR>M<rsub|P>\<assign\><around|\||P<around|(|u|)>|\|>,<space|2em>M<rsub|Q>\<assign\><around|\||Q<around|(|u|)>|\|>,<space|2em>M<rsub|R>\<assign\><around|\||R<around|(|u|)>|\|>,
    </equation>

    and define the (local) Gevrey constants

    <\equation>
      <label|eq:K_C_def>K<rsub|G>\<assign\>C<rsub|0>*<space|0.17em>max
      <around|(|M<rsub|P>,<space|0.17em>1|)>,<space|2em>C<rsub|G>\<assign\>C<rsub|0>*<space|0.17em><around|(|M<rsub|Q>+2*K<rsub|G>*<space|0.17em>M<rsub|R>|)>+1.
    </equation>

    The bound to be established is

    <\equation>
      <label|eq:gevrey_claim><around|\||a<around|(|k,u|)>|\|>\<le\>K<rsub|G>*<space|0.17em>C<rsub|G><rsup|k>*<space|0.17em>k!<space|2em><text|for
      all >k\<ge\>0.
    </equation>

    The base case <math|k=0> uses <math|<around|\||a<around|(|0,u|)>|\|>=<around|\||P*\<psi\><rsub|0>|\|>\<le\>C<rsub|0>*M<rsub|P>\<le\>K<rsub|G>\<le\>K<rsub|G>*<space|0.17em>C<rsub|G><rsup|0>*<space|0.17em>0>!.
    Inductively, assuming<nbsp><eqref|eq:gevrey_claim> through <math|k-1>,

    <\equation>
      <label|eq:induct_step><around|\||a<around|(|k,u|)>|\|>\<le\>C<rsub|0>*<around*|(|M<rsub|Q>*<space|0.17em><around|\||a*<around|(|k-1|)>*<around|\||+M<rsub|R>*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1>|\|>*a<around|(|j|)><around|\||<space|0.17em>|\|>*a<around|(|\<ell\>|)>|\|>|)>.
    </equation>

    The convolution sum is bounded using

    <\equation>
      <label|eq:fact_convolution><big|sum><rsub|j+\<ell\>=n>j!<space|0.17em>\<ell\>!\<le\><around|(|n+1|)>!,
    </equation>

    giving <math|<big|sum><rsub|j+\<ell\>=k-1>K<rsub|G><rsup|2>*<space|0.17em>C<rsub|G><rsup|k-1>*<space|0.17em>j!<space|0.17em>\<ell\>!\<le\>K<rsub|G><rsup|2>*<space|0.17em>C<rsub|G><rsup|k-1>*<space|0.17em>k>!.
    Hence

    <\equation>
      <label|eq:induct_close><around|\||a<around|(|k|)>|\|>\<le\>C<rsub|0>*M<rsub|Q>*<space|0.17em>K<rsub|G>*<space|0.17em>C<rsub|G><rsup|k-1>*<around|(|k-1|)>!+C<rsub|0>*M<rsub|R>*<space|0.17em>K<rsub|G><rsup|2>*<space|0.17em>C<rsub|G><rsup|k-1>*k!\<le\>K<rsub|G>*<space|0.17em>C<rsub|G><rsup|k>*<space|0.17em>k!\<cdot\><frac|C<rsub|0>*<around|(|M<rsub|Q>+K<rsub|G>*<space|0.17em>M<rsub|R>|)>|C<rsub|G>>\<le\>K<rsub|G>*<space|0.17em>C<rsub|G><rsup|k>*<space|0.17em>k!,
    </equation>

    since <math|C<rsub|0>*<around|(|M<rsub|Q>+K<rsub|G>*<space|0.17em>M<rsub|R>|)>/C<rsub|G>\<less\>1>
    by<nbsp><eqref|eq:K_C_def>. The bound for
    <math|<around|{|g<rsub|k><around|(|u|)>|}>> follows from

    <\equation>
      <label|eq:gk_def>g<rsub|k>=Q*<space|0.17em>a*<around|(|k-1|)>+R*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em><space|-0.17em>a<around|(|j|)>*<space|0.17em>a<around|(|\<ell\>|)>+P*<space|0.17em><around|[|k=0|]>,
    </equation>

    yielding

    <\equation>
      <label|eq:gk_bound><around|\||g<rsub|k><around|(|u|)>|\|>\<le\>K<rsub|G><rprime|''>*<space|0.17em>C<rsub|G><rsup|k+1>*<space|0.17em>k!,<space|2em>K<rsub|G><rprime|''>\<assign\>K<rsub|G>*<around|(|M<rsub|Q>+K<rsub|G>*<space|0.17em>M<rsub|R>|)>/C<rsub|G><rsup|2>.
    </equation>

    <with|font-series|bold|Step 2: Cauchy-integral interpolation.> Fix
    <math|0\<less\>r\<less\>\<rho\><rsub|0>> where <math|G> is holomorphic.
    Define

    <\equation>
      <label|eq:Ghat><wide|G|^><around|(|s,u|)>\<assign\>\<Gamma\>*<around|(|s+1|)>\<cdot\><frac|1|2*\<pi\>*i>*<big|oint><rsub|<around|\||z|\|>=r><frac|G<around|(|z,u|)>|z<rsup|s+1>>*<space|0.17em>d*z,<space|2em><wide|G|^><rsub|R><around|(|s,u|)>\<assign\><frac|<wide|G|^><around|(|s,u|)>|\<Gamma\>*<around|(|s+1|)>>.
    </equation>

    At integer points,

    <\equation>
      <label|eq:Ghat_at_k><wide|G|^><around|(|k,u|)>=k!<space|0.17em>g<rsub|k><around|(|u|)>,<space|2em><wide|G|^><rsub|R><around|(|k,u|)>=g<rsub|k><around|(|u|)>,
    </equation>

    the latter being the Ramanujan normalisation used in
    Lemma<nbsp><reference|lem:mb>. The Cauchy-kernel factor

    <\equation>
      <label|eq:cauchy_kernel>\<kappa\><around|(|s,u|)>\<assign\><frac|1|2*\<pi\>*i>*<big|oint><rsub|<around|\||z|\|>=r><frac|G<around|(|z,u|)>|z<rsup|s+1>>*<space|0.17em>d*z
    </equation>

    is entire in <math|s> of exponential type at most <math|log
    <around|(|1/r|)>> along the imaginary axis. Multiplication by
    <math|\<Gamma\>*<around|(|s+1|)>> does not alter this type. Carlson's
    theorem requires

    <\equation>
      <label|eq:carlson_cond>log <around|(|1/r|)>\<less\>\<pi\><space|1em>\<Longleftrightarrow\><space|1em>r\<gtr\>e<rsup|-\<pi\>>.
    </equation>

    Since <math|G> is holomorphic on <math|<around|\||z|\|>\<less\>\<rho\><rsub|0>>,
    <math|\<kappa\><around|(|s,u|)>> is independent of <math|r> in
    <math|<around|(|0,\<rho\><rsub|0>|)>>, so <math|r> may be enlarged to any
    value in <math|<around|(|e<rsup|-\<pi\>>,\<rho\><rsub|0>|)>>, which is
    nonempty provided <math|\<rho\><rsub|0>\<gtr\>e<rsup|-\<pi\>>>. If
    <math|\<rho\><rsub|0>\<le\>e<rsup|-\<pi\>>>, fix any
    <math|r<rsub|0>\<in\><around|(|0,\<rho\><rsub|0>|)>> and replace <math|z>
    by <math|\<lambda\>*z> for a scalar <math|\<lambda\>> with

    <\equation>
      <label|eq:rescale>\<lambda\>*r<rsub|0>\<in\><around|(|e<rsup|-\<pi\>>,<space|0.17em>1|)>;
    </equation>

    this rescaling reduces to the previous case and is undone after the
    Mellin\UBarnes representation by the inverse scaling. Carlson's theorem
    then gives uniqueness of <math|<wide|G|^>> as the entire interpolation of
    <math|<around|{|k!<space|0.17em>g<rsub|k><around|(|u|)>|}><rsub|k\<ge\>0>>
    of exponential type <math|\<less\>\<pi\>>. The Cauchy integral satisfies

    <\equation>
      <label|eq:cauchy_bound><around|\||\<kappa\><around|(|s,u|)>|\|>\<le\><frac|M*<around|(|r,u|)>|r<rsup|\<Re\>*s>>,<space|2em>M*<around|(|r,u|)>\<assign\>sup<rsub|<around|\||z|\|>=r><around|\||G<around|(|z,u|)>|\|>,
    </equation>

    which gives

    <\equation>
      <label|eq:Ghat_bound><around|\||<wide|G|^><around|(|\<sigma\>+i*\<tau\>,u|)>|\|>\<le\><frac|M*<around|(|r,u|)>*<space|0.17em><around|\||\<Gamma\>*<around|(|\<sigma\>+i*\<tau\>+1|)>|\|>|r<rsup|\<sigma\>>>.
    </equation>

    Combination of<nbsp><eqref|eq:Ghat_bound> with the integer-point Gevrey
    bound<nbsp><eqref|eq:gk_bound> and the Phragmén\ULindelöf principle in
    each vertical strip (applied to <math|<wide|G|^><around|(|s,u|)>/<around|[|K<rsub|G><rprime|'>*C<rsub|G><rsup|<around|\||\<sigma\>|\|>+1>*\<Gamma\>*<around|(|s+1|)>|]>>,
    which is bounded on the imaginary axis and on <math|\<Re\>*s=N> for each
    <math|N\<in\><Z><rsub|\<ge\>0>> by the Gevrey bound and Stirling, and of
    finite order in the strip) yields<nbsp><eqref|eq:gevrey1> with

    <\equation>
      <label|eq:Kp_def>K<rsub|G><rprime|'>\<assign\>M*<around|(|r,u|)>/r,
    </equation>

    and <math|C<rsub|G>> as in<nbsp><eqref|eq:K_C_def> (after enlarging
    <math|C<rsub|G>> to absorb <math|1/r>).

    <with|font-series|bold|Step 3: Mellin\UBarnes representation.> By
    Lemma<nbsp><reference|lem:hadamard>,

    <\equation>
      <label|eq:A_via_G>A=<Psimu>\<odot\>G,<space|2em>G=B<around|[|A|]>.
    </equation>

    Lemma<nbsp><reference|lem:mb> applies and yields, for
    <math|<around|\||arg <around|(|-z|)>|\|>\<less\>\<pi\>/2> and
    <math|<around|\||z|\|>\<less\>min <around|(|1,\<rho\><rsub|0>|)>>, the
    integral representation<nbsp><eqref|eq:mb_formula>, holomorphic on the
    open sector. By the identity principle, <math|A> extends meromorphically
    to

    <\equation>
      <label|eq:A_extension><wide|X|~>\<setminus\><around|(|K<rsub|\<Psi\>>\<cup\>S<rsub|G>|)>,
    </equation>

    where <math|S<rsub|G>> is the singularity locus of
    <math|<wide|G|^><rsub|R>>.

    <with|font-series|bold|Step 4: Self-consistent fixed point.> For
    <math|K\<supseteq\>K<rsub|\<Psi\>>> compact, let
    <math|\<cal-M\><around|(|K|)>> be the space of
    <math|<C><around|[|u|]><around|[|<around|[|z|]>|]>>-formal series whose
    unique meromorphic continuation lives on <math|<wide|X|~>\<setminus\>K>.
    The map

    <\equation>
      <label|eq:Phi_map>\<Phi\>:A\<mapsto\><Psimu>\<odot\>B<around|[|A|]>
    </equation>

    sends <math|\<cal-M\><around|(|K|)>> to itself:
    <math|B<around|[|A|]>=P+z*Q*A+z*R*A<rsup|2>> is polynomial in <math|A>,
    hence in <math|\<cal-M\><around|(|K|)>>, and the Mellin\UBarnes integral
    adds only the poles of <math|M<rsub|<Psimu>>>, which project to
    <math|K<rsub|\<Psi\>>\<subseteq\>K>. The unique formal-power-series fixed
    point of <math|\<Phi\>> is <math|A> (Theorem<nbsp><reference|thm:Muntz>).
    <math|F> is the unique formal-power-series root of<nbsp><eqref|eq:quad>
    and lies in <math|\<cal-M\><around|(|K<rsub|F>|)>>
    (Lemma<nbsp><reference|lem:stahl_F>). Subtraction of the
    <math|F>-equation from the <math|A>-equation and order-by-order reading
    of the difference shows <math|A-F> has at worst the same singular set as
    <math|F> (Lemma<nbsp><reference|lem:branch_transfer>). Therefore
    <math|A\<in\>\<cal-M\><around|(|K<rsub|F><around|(|u|)>|)>>, and the
    minimal compact <math|K<rsub|A><around|(|u|)>\<subseteq\>K<rsub|F><around|(|u|)>>
    exists by Theorem<nbsp><reference|thm:stahl_extremal>.
  </proof>

  <section|The Fractional Riccati\UMüntz\UPadé Theorem>

  <\theorem>
    [Fractional Riccati\UMüntz\UPadé theorem]<label|thm:FRMP> Under
    quasi-definiteness, the Müntz\UPadé approximant

    <\equation>
      <label|eq:yM_def>y<rsub|M><around|(|t,u|)>\<assign\>t<rsup|\<mu\>>*<space|0.17em><frac|N<rsub|M><around|(|t<rsup|\<mu\>>,u|)>|D<rsub|M>*<around|(|t<rsup|\<mu\>>,u|)>>
    </equation>

    satisfies

    <\equation>
      <label|eq:FRMP_limit>y<around|(|t,u|)>=lim<rsub|M\<to\>\<infty\>>
      y<rsub|M><around|(|t,u|)>
    </equation>

    in logarithmic capacity on compact subsets of the
    <math|t>-universal-cover preimage of <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>>.
  </theorem>

  <\proof>
    By Theorem<nbsp><reference|thm:Muntz>,

    <\equation>
      <label|eq:y_via_A>y<around|(|t,u|)>=t<rsup|\<mu\>>*<space|0.17em>A<around|(|t<rsup|\<mu\>>,u|)>;
    </equation>

    <math|N<rsub|M>/D<rsub|M>> is the <math|<around|[|M-1/M|]>> Padé
    approximant of <math|A> by Theorem<nbsp><reference|thm:gragg>.

    <em|Equivalence of denominator sequences.> <math|D<rsub|M>> is determined
    by<nbsp><eqref|eq:Q_orth>. The <math|<around|[|M/M|]>> approximant adds
    one matching condition that fixes the leading coefficient of
    <math|N<rsub|M>>, not the denominator. Hence
    <math|<around|{|D<rsub|M>|}><rsub|M\<ge\>1>> is identical for both types
    and Stahl's theorem applies to either.

    <em|Convergence in capacity.> By Theorem<nbsp><reference|thm:Acont>,
    <math|A> is meromorphic on <math|<wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>>.
    Theorem<nbsp><reference|thm:stahl_convergence> of the appendix gives

    <\equation>
      <label|eq:cap_conv_z><frac|N<rsub|M>|D<rsub|M>><space|0.27em>\<longrightarrow\><space|0.27em>A<space|1em><text|in
      capacity on compacta of ><wide|X|~>\<setminus\>K<rsub|A><around|(|u|)>.
    </equation>

    <em|Transfer to the <math|t>-plane.> Fix the principal-branch sector

    <\equation>
      <label|eq:Sigma_def>\<Sigma\>\<assign\><around|{|t\<in\><wide|<C>|~><rsup|\<ast\>>:arg
      t\<in\><around|(|-\<pi\>,\<pi\>|]>|}>,
    </equation>

    on which <math|z=t<rsup|\<mu\>>> is a biholomorphism onto its image. The
    map <math|t\<mapsto\>t<rsup|\<mu\>>> is a <math|C<rsup|1>> diffeomorphism
    on <math|\<Sigma\>\<setminus\><around|{|0|}>> with bounded distortion on
    compacta, and the classical capacity-transformation identity (cf.
    Ransford<nbsp><cite-detail|Ransford|Thm.<nbsp>5.2.5>) gives

    <\equation>
      <label|eq:cap_transfer><cpct|<around|{|t\<in\>\<Sigma\>:<space|0.17em>t<rsup|\<mu\>>\<in\>K|}>>=<cpct|K><rsup|1/\<mu\>>
    </equation>

    for every compact <math|K> in the image. On the full universal cover of
    <math|<C>\<setminus\><around|{|0|}>>, the preimage decomposes into
    countably many such sectorial sheets, and convergence in capacity on each
    sheet transfers from the <math|z>-plane to the <math|t>-plane sheetwise.
    The statement of the theorem refers to this sheetwise transfer.
  </proof>

  <section|A Direct Proof of Stahl's Theorem for the Generic Two-Valued Class
  over <math|<C><around|(|z,<Psimu>|)>>><label|app:stahl>

  This appendix gives a self-contained proof of Stahl's extremal-domain and
  convergence-in-capacity theorems for the class <math|\<cal-A\>> of
  functions <math|\<Phi\>> on <math|<wide|X|~>> (the universal cover of
  <math|<C>\<setminus\><around|{|0|}>> minus a finite set) such that

  <\itemize>
    <item><math|\<Phi\>> is two-valued algebraic over the field

    <\equation>
      <label|eq:K_field>\<cal-K\>\<assign\><C><around|(|u|)><around|(|z,<Psimu><around|(|z|)>|)>,
    </equation>

    generically irreducible;

    <item>the discriminant <math|\<Delta\><rsub|\<Phi\>>\<in\>\<cal-K\>> is
    meromorphic on <math|<wide|X|~>\<setminus\>K<rsub|\<Psi\>>> with isolated
    zeros and poles;

    <item><math|\<Phi\>> is holomorphic at <math|z=0>.
  </itemize>

  Both <math|F> from<nbsp><eqref|eq:Fformula> and <math|A> from
  Theorem<nbsp><reference|thm:Acont> belong to <math|\<cal-A\>> (the latter
  via the fixed-point identification in Lemma<nbsp><reference|lem:branch_transfer>).

  <subsection|Logarithmic capacity and the energy minimum>

  For compact <math|K\<subset\><C>> with diameter <math|d\<gtr\>0>, the
  logarithmic energy of a probability measure <math|\<nu\>> supported on
  <math|K> is

  <\align>
    <tformat|<table|<row|<cell|I<around|[|\<nu\>|]>>|<cell|\<assign\><big|iint>log
    <frac|1|<around|\||z-w|\|>>*<space|0.17em>d*\<nu\><around|(|z|)>*<space|0.17em>d*\<nu\><around|(|w|)><eq-number><label|eq:energy_def>>>|<row|<cell|<vspace*|3pt><cpct|K>>|<cell|\<assign\>e<rsup|-inf<rsub|\<nu\>>
    I<around|[|\<nu\>|]>><eq-number><label|eq:cap_def>>>>>
  </align>

  The infimum is attained by a unique equilibrium measure
  <math|\<nu\><rsub|K>> when <math|<cpct|K>\<gtr\>0>; the support of
  <math|\<nu\><rsub|K>> is the <em|essential boundary> of <math|K>.

  <\lemma>
    [Monotonicity]<label|lem:cap_sub> For compacta
    <math|K<rsub|1>,K<rsub|2>\<subset\><C>>,

    <\equation>
      <label|eq:cap_mono><cpct|K<rsub|1>\<cup\>K<rsub|2>>\<ge\>max
      <around*|(|<cpct|K<rsub|1>>,<cpct|K<rsub|2>>|)>
    </equation>

    by monotonicity of logarithmic capacity. In particular, if
    <math|K<rsub|2>\<subseteq\>K<rsub|1>> then

    <\equation>
      <label|eq:cap_subset><cpct|K<rsub|1>\<cup\>K<rsub|2>>=<cpct|K<rsub|1>>.
    </equation>
  </lemma>

  <\proof>
    Standard; see any text on logarithmic potential theory.
  </proof>

  <subsection|Extremal domain (Stahl)>

  <\theorem>
    [Extremal domain]<label|thm:stahl_extremal> Let
    <math|\<Phi\>\<in\>\<cal-A\>> with branch locus contained in some compact
    <math|K<rsub|0>\<supseteq\>K<rsub|\<Psi\>>>. Then there exists a unique
    compact <math|K<rsub|\<Phi\>>> with <math|K<rsub|\<Psi\>>\<subseteq\>K<rsub|\<Phi\>>\<subseteq\>K<rsub|0>>
    of minimal logarithmic capacity such that <math|\<Phi\>> is single-valued
    meromorphic on <math|<wide|X|~>\<setminus\>K<rsub|\<Phi\>>>.
  </theorem>

  <\proof>
    Let <math|\<cal-S\>> be the family of compacts
    <math|K\<subseteq\>K<rsub|0>> with <math|K\<supseteq\>K<rsub|\<Psi\>>>
    outside which <math|\<Phi\>> is single-valued. The family is nonempty
    (<math|K<rsub|0>\<in\>\<cal-S\>>) and closed under intersection along
    directed nets: if <math|<around|{|K<rsub|\<alpha\>>|}>> is a directed
    family in <math|\<cal-S\>>, then

    <\equation>
      <label|eq:directed_inter><big|cap><rsub|\<alpha\>>K<rsub|\<alpha\>>\<in\>\<cal-S\>
    </equation>

    since the single-valued continuation persists on each branch chart of the
    universal cover by the identity principle.

    The capacity functional <math|K\<mapsto\><cpct|K>> is upper
    semicontinuous on the Hausdorff topology of compacta. By Zorn's lemma
    applied to the partial order <math|K\<le\>K<rprime|'>\<Longleftrightarrow\>K\<subseteq\>K<rprime|'>>
    with the capacity functional descending, a minimal element
    <math|K<rsub|\<Phi\>>> exists.

    Uniqueness. Suppose <math|K<rsub|\<Phi\>>> and
    <math|K<rsub|\<Phi\>><rprime|'>> both attain the minimum capacity in
    <math|\<cal-S\>>. Their intersection <math|K<rsub|\<Phi\>>\<cap\>K<rsub|\<Phi\>><rprime|'>>
    lies in <math|\<cal-S\>>: on <math|<wide|X|~>\<setminus\><around|(|K<rsub|\<Phi\>>\<cap\>K<rsub|\<Phi\>><rprime|'>|)>>,
    the single-valued meromorphic continuations of <math|\<Phi\>> defined on
    <math|<wide|X|~>\<setminus\>K<rsub|\<Phi\>>> and on
    <math|<wide|X|~>\<setminus\>K<rsub|\<Phi\>><rprime|'>> agree on the open
    set <math|<wide|X|~>\<setminus\><around|(|K<rsub|\<Phi\>>\<cup\>K<rsub|\<Phi\>><rprime|'>|)>>,
    hence by the identity principle they glue to a single-valued meromorphic
    function on <math|<wide|X|~>\<setminus\><around|(|K<rsub|\<Phi\>>\<cap\>K<rsub|\<Phi\>><rprime|'>|)>>.
    By Lemma<nbsp><reference|lem:cap_sub>,

    <\equation>
      <label|eq:inter_bound><cpct|K<rsub|\<Phi\>>\<cap\>K<rsub|\<Phi\>><rprime|'>>\<le\>min
      <around*|(|<cpct|K<rsub|\<Phi\>>>,<cpct|K<rsub|\<Phi\>><rprime|'>>|)>,
    </equation>

    with equality forced by minimality. Stahl's <math|S>-property (symmetry
    of the equilibrium measure of the extremal compact with respect to the
    Green function) uniquely determines the support of the equilibrium
    measure, hence

    <\equation>
      <label|eq:KPhi_unique>K<rsub|\<Phi\>>=K<rsub|\<Phi\>>\<cap\>K<rsub|\<Phi\>><rprime|'>=K<rsub|\<Phi\>><rprime|'><space|1em><text|as
      sets.>
    </equation>
  </proof>

  <subsection|Branch transfer along the Hadamard fixed point>

  <\lemma>
    [Branch transfer]<label|lem:branch_transfer> Let <math|\<Phi\>=A> and
    <math|\<Phi\><rprime|'>=F>. The Hadamard fixed-point
    equation<nbsp><eqref|eq:hadamard_fp> together with the algebraic
    quadratic<nbsp><eqref|eq:quad> for <math|F> implies that the branch locus
    of <math|A> is contained in the branch locus of <math|F> together with
    <math|K<rsub|\<Psi\>>>.
  </lemma>

  <\proof>
    Write <math|A=F+<around|(|A-F|)>>. The defining recurrences differ only
    in the <math|\<psi\><rsub|k>> placement
    (Remark<nbsp><reference|rem:Fdistinct>). Subtraction of <eqref|eq:fk>
    from<nbsp><eqref|eq:ak> gives

    <\equation>
      <label|eq:diff_rec>a<around|(|k|)>-f<around|(|k|)>=\<psi\><rsub|k>*<around*|[|Q*a*<around|(|k-1|)>+R*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em><space|-0.17em>a<around|(|j|)>*<space|0.17em>a<around|(|\<ell\>|)>|]>-Q*<space|0.17em>f*<around|(|k-1|)>-R*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em><space|-0.17em>f<around|(|j|)>*<space|0.17em>f<around|(|\<ell\>|)>-P*\<psi\><rsub|k>.
    </equation>

    Summed into generating functions, the difference <math|A-F> satisfies a
    linear inhomogeneous functional equation in
    <math|\<cal-K\><around|(|<Psimu>|)>> whose coefficients are meromorphic
    on <math|<wide|X|~>\<setminus\>K<rsub|\<Psi\>>> and whose forcing terms
    are meromorphic on

    <\equation>
      <label|eq:forcing_domain><wide|X|~>\<setminus\><around|(|K<rsub|F>\<cup\>K<rsub|\<Psi\>>|)>=<wide|X|~>\<setminus\>K<rsub|F>*<space|2em><around|(|<text|using
      >K<rsub|\<Psi\>>\<subseteq\>K<rsub|F>|)>.
    </equation>

    The analytic-implicit-function theorem applied at every point of
    <math|<wide|X|~>\<setminus\>K<rsub|F>> where the linearised operator

    <\equation>
      <label|eq:linearisation>\<partial\><rsub|F>*<space|-0.17em><around*|[|z*R*F<rsup|2>-<around|(|1-z*Q|)>*F+P<Psimu>|]>=2*z*R*F-<around|(|1-z*Q|)>
    </equation>

    is nonzero produces a unique meromorphic solution <math|A-F> on
    <math|<wide|X|~>\<setminus\>K<rsub|F>>. The exceptional set
    where<nbsp><eqref|eq:linearisation> vanishes is contained in
    <math|K<rsub|F>> (by definition of branch locus). Therefore
    <math|A=F+<around|(|A-F|)>> is meromorphic on
    <math|<wide|X|~>\<setminus\>K<rsub|F>>.
  </proof>

  <subsection|Convergence in capacity (Stahl)>

  <\theorem>
    [Convergence in capacity]<label|thm:stahl_convergence> Let
    <math|\<Phi\>\<in\>\<cal-A\>> with extremal compact
    <math|K<rsub|\<Phi\>>>. Let <math|<around|{|R<rsub|M>|}>=<around|{|N<rsub|M>/D<rsub|M>|}>>
    be the diagonal Padé sequence built from the Taylor series of
    <math|\<Phi\>> at <math|z=0>. Then <math|R<rsub|M>\<to\>\<Phi\>> in
    logarithmic capacity on every compact subset of
    <math|<wide|X|~>\<setminus\>K<rsub|\<Phi\>>>.
  </theorem>

  <\proof>
    The denominators <math|D<rsub|M>> have all zeros in
    <math|K<rsub|\<Phi\>>> up to a set of asymptotic capacity zero. This is
    the Nuttall\UStahl localisation: the zero-counting measure

    <\equation>
      <label|eq:nu_M>\<nu\><rsub|M>\<assign\>M<rsup|-1>*<big|sum><rsub|D<rsub|M><around|(|z|)>=0>\<delta\><rsub|z>
    </equation>

    converges weak-<math|\<ast\>> to the equilibrium measure
    <math|\<nu\><rsub|K<rsub|\<Phi\>>>>.

    <em|Step 1 (Hermite's formula).> The Padé error satisfies

    <\equation>
      <label|eq:hermite>\<Phi\>-R<rsub|M>=<frac|\<Pi\><rsub|M><around|(|z|)>|D<rsub|M><around|(|z|)><rsup|2>>\<cdot\><frac|1|2*\<pi\>*i>*<big|oint><rsub|\<gamma\>><frac|D<rsub|M><around|(|\<zeta\>|)><rsup|2>*<space|0.17em>\<Phi\><around|(|\<zeta\>|)>|\<Pi\><rsub|M><around|(|\<zeta\>|)>*<around|(|\<zeta\>-z|)>>*<space|0.17em>d*\<zeta\>,<space|2em>\<Pi\><rsub|M>*<text|monic
      of degree >M,
    </equation>

    where <math|\<gamma\>> encircles <math|K<rsub|\<Phi\>>>.

    <em|Step 2 (Capacity estimate).> Outside <math|K<rsub|\<Phi\>>>, the
    Green function <math|g*<around|(|z,K<rsub|\<Phi\>>|)>> controls

    <\equation>
      <label|eq:green_control><around|\||D<rsub|M><around|(|z|)>|\|><rsup|1/M><space|0.27em>\<longrightarrow\><space|0.27em>e<rsup|g*<around|(|z,K<rsub|\<Phi\>>|)>><space|0.17em><cpct|K<rsub|\<Phi\>>><space|1em><text|in
      capacity>
    </equation>

    (Stahl's main lemma, proved by combining Bernstein\UWalsh and the
    asymptotic distribution of zeros <cite|StahlExtremal|StahlExtremalII>).

    <em|Step 3 (Vanishing in capacity).> The error has <math|M>-th root
    behaviour

    <\equation>
      <label|eq:mth_root><around|\||\<Phi\><around|(|z|)>-R<rsub|M><around|(|z|)>|\|><rsup|1/<around|(|2*M|)>><space|0.27em>\<longrightarrow\><space|0.27em>e<rsup|-g*<around|(|z,K<rsub|\<Phi\>>|)>><space|1em><text|in
      capacity>,
    </equation>

    which is <math|\<less\>1> off <math|K<rsub|\<Phi\>>>, giving exponential
    vanishing in capacity.

    The full proof of Steps 2\U3 mirrors Stahl's
    <cite|StahlConvergence|StahlBranch> but, restricted to <math|\<cal-A\>>,
    simplifies because the discriminant <math|\<Delta\><rsub|\<Phi\>>> has
    only finitely many zeros and poles on the universal cover modulo
    <math|K<rsub|\<Psi\>>>, so the orthogonality measure of <math|D<rsub|M>>
    has a smooth density off <math|K<rsub|\<Phi\>>> and the standard
    equilibrium analysis applies directly. The polynomial
    <math|\<Pi\><rsub|M>> in<nbsp><eqref|eq:hermite> plays the role of an
    auxiliary monic factor in Hermite's contour formula and is unrelated to
    the orthogonal polynomials <math|P<rsub|M>> of
    Theorem<nbsp><reference|thm:gragg>.
  </proof>

  <\thebibliography|9>
    <bibitem|SKM>S.<nbsp>G.<nbsp>Samko, A.<nbsp>A.<nbsp>Kilbas,
    O.<nbsp>I.<nbsp>Marichev, <em|Fractional Integrals and Derivatives>,
    Gordon and Breach, 1993.

    <bibitem|StahlExtremal>H.<nbsp>Stahl, <em|Extremal domains associated
    with an analytic function<nbsp>I>, Constr. Approx.
    <with|font-series|bold|1> (1985), 89\U110.

    <bibitem|StahlExtremalII>H.<nbsp>Stahl, <em|Extremal domains<nbsp>II>,
    Constr. Approx. <with|font-series|bold|1> (1985), 111\U137.

    <bibitem|StahlConvergence>H.<nbsp>Stahl, <em|Convergence of Padé
    approximants to functions with branch points (preliminary)>, Constr.
    Approx. <with|font-series|bold|4> (1988), 631\U642.

    <bibitem|StahlBranch>H.<nbsp>Stahl, <em|Convergence of Padé approximants
    to functions with branch points>, J.<nbsp>Approx.<nbsp>Theory
    <with|font-series|bold|91> (1997), 139\U204.

    <bibitem|Wheeler>J.<nbsp>C.<nbsp>Wheeler, <em|Modified moments and
    Gaussian quadratures>, Rocky Mountain J.<nbsp>Math.
    <with|font-series|bold|4> (1974), 287\U296.

    <bibitem|Gragg>W.<nbsp>B.<nbsp>Gragg, <em|The Padé table and its relation
    to certain algorithms of numerical analysis>, SIAM Review
    <with|font-series|bold|14> (1972), 1\U62.

    <bibitem|Hardy>G.<nbsp>H.<nbsp>Hardy, <em|Ramanujan: Twelve Lectures on
    Subjects Suggested by His Life and Work>, Cambridge University Press,
    1940; reprinted Chelsea, New York, 1959.

    <bibitem|Ransford>T.<nbsp>Ransford, <em|Potential Theory in the Complex
    Plane>, London Math. Soc. Student Texts <with|font-series|bold|28>,
    Cambridge Univ. Press, 1995.
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
    <associate|app:stahl|<tuple|9|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-1|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-10|<tuple|2|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-11|<tuple|3|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-12|<tuple|5.3|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-13|<tuple|6|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-14|<tuple|1|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-15|<tuple|7|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-16|<tuple|7.1|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-17|<tuple|7.2|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-18|<tuple|7.3|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-19|<tuple|7.4|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-20|<tuple|8|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-21|<tuple|9|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-22|<tuple|9.1|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-23|<tuple|9.2|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-24|<tuple|9.3|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-25|<tuple|9.4|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-26|<tuple|111|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-3|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-4|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-5|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-6|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-7|<tuple|5.1|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-8|<tuple|5.2|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-9|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Gragg|<tuple|Gragg|13|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Hardy|<tuple|Hardy|13|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Ransford|<tuple|Ransford|13|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-SKM|<tuple|SKM|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-StahlBranch|<tuple|StahlBranch|13|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-StahlConvergence|<tuple|StahlConvergence|13|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-StahlExtremal|<tuple|StahlExtremal|13|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-StahlExtremalII|<tuple|StahlExtremalII|13|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Wheeler|<tuple|Wheeler|13|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:F|<tuple|9|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:RL|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:fRic|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:growth|<tuple|12|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:psi|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:quasidef|<tuple|15|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:A_extension|<tuple|89|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:A_via_G|<tuple|88|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:B_def|<tuple|51|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:C0_def|<tuple|71|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Delta_F|<tuple|70|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:FRMP_limit|<tuple|92|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:F_def|<tuple|21|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Fformula|<tuple|25|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:GR_at_mk|<tuple|66|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:G_lambda|<tuple|29|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:G_series|<tuple|59|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Ghat|<tuple|80|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Ghat_R_def|<tuple|60|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Ghat_at_k|<tuple|81|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Ghat_bound|<tuple|86|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:H_at_mk|<tuple|65|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:KPhi_unique|<tuple|104|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:K_C_def|<tuple|73|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:K_field|<tuple|97|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Kp_def|<tuple|87|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:M_PQR|<tuple|72|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:M_split|<tuple|64|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Muntz_ansatz|<tuple|13|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Phi_map|<tuple|90|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Psi_def|<tuple|9|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Psi_phi_series|<tuple|55|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Q_orth|<tuple|50|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:RL_der|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:RL_int|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Sigma_def|<tuple|95|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Volt|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:a0|<tuple|14|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:a1_witness|<tuple|22|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:ab0|<tuple|35|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:abs_riccati|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:ak|<tuple|15|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:alpha_k|<tuple|36|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:beta_id|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:beta_k|<tuple|37|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cap_conv_z|<tuple|94|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cap_def|<tuple|99|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cap_mono|<tuple|100|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cap_subset|<tuple|101|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cap_transfer|<tuple|96|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:carlson_cond|<tuple|83|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cauchy_bound|<tuple|85|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cauchy_kernel|<tuple|82|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:contraction|<tuple|16|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:conv_cauchy|<tuple|18|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:conv_extract|<tuple|17|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:conv_hadamard|<tuple|19|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:diff_rec|<tuple|105|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:directed_inter|<tuple|102|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:disc_expand|<tuple|27|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:energy_def|<tuple|98|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:f1_witness|<tuple|23|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:fRic|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:fact_convolution|<tuple|76|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:fk|<tuple|20|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:forcing_domain|<tuple|106|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:gevrey1|<tuple|61|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:gevrey_claim|<tuple|74|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:gk_bound|<tuple|79|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:gk_def|<tuple|78|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:green_control|<tuple|110|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:hadamard_fp|<tuple|52|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:hankel|<tuple|43|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:hermite|<tuple|109|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:induct_close|<tuple|77|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:induct_step|<tuple|75|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:inner_prod|<tuple|30|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:integrand_decay|<tuple|63|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:inter_bound|<tuple|103|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:linearisation|<tuple|107|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:linearised_zero|<tuple|28|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:match_zeros|<tuple|49|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:mb_formula|<tuple|62|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:mellin_psi|<tuple|54|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:mth_root|<tuple|111|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:norm_telescope|<tuple|42|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:nu_M|<tuple|108|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:pade_match|<tuple|47|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:pade_reciprocal|<tuple|48|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:phi_interp|<tuple|56|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:phi_stirling|<tuple|57|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:pi_init|<tuple|38|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:pi_rec|<tuple|39|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:power_rule|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:psi_asymp|<tuple|11|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:psi_def|<tuple|8|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:psi_eig|<tuple|10|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:psi_log|<tuple|12|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:quad|<tuple|24|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:quad_aux|<tuple|26|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:ramanujan_master|<tuple|58|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:rescale|<tuple|84|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:residue|<tuple|68|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:residue_sum|<tuple|69|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:sigma_hankel|<tuple|45|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:sigma_init1|<tuple|32|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:sigma_init2|<tuple|33|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:sigma_rec|<tuple|34|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:sigma_via_L|<tuple|46|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:tilde_sigma|<tuple|41|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:vanishing_poly|<tuple|31|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:wheeler_norm|<tuple|40|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:wheeler_sym_norm|<tuple|44|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:yM_def|<tuple|91|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:y_via_A|<tuple|93|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:zk_BA|<tuple|53|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:zpow_at_mk|<tuple|67|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:Psimu_radius|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:Volt|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:branch_transfer|<tuple|26|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:cap_sub|<tuple|24|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:hadamard|<tuple|18|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:mb|<tuple|20|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:mellin_psi|<tuple|19|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:posdef|<tuple|13|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:power|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:psi_eig|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:stahl_F|<tuple|21|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:Fdistinct|<tuple|10|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:meromorphy|<tuple|7|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:padeconv|<tuple|6|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|subsec:hadamard|<tuple|7.1|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|subsec:mb|<tuple|7.3|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|subsec:mellin|<tuple|7.2|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|subsec:stahl|<tuple|7.4|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:Acont|<tuple|22|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:FRMP|<tuple|23|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:Muntz|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:gragg|<tuple|17|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:quad|<tuple|11|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:stahl_convergence|<tuple|27|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:stahl_extremal|<tuple|25|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:wheeler|<tuple|14|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:wheeler_sym|<tuple|16|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      SKM

      Hardy

      Ransford

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

      <with|par-left|<quote|3tab>|Auxiliary array.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|3tab>|Coefficients.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|3tab>|Orthogonal polynomials.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|5.3<space|2spc>Symbolic transfer
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Padé
      Denominators via Gragg's Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <with|par-left|<quote|3tab>|Padé convention.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Meromorphic
      Continuation of <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|A>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>

      <with|par-left|<quote|1tab>|7.1<space|2spc>Hadamard fixed-point
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|7.2<space|2spc>Mellin transform of
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<Psi\><rsub|\<mu\>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|7.3<space|2spc>Mellin\UBarnes realisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|7.4<space|2spc>Stahl compact for
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|F>>
      and for <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|A>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>The
      Fractional Riccati\UMüntz\UPadé Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>A
      Direct Proof of Stahl's Theorem for the Generic Two-Valued Class over
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<bbb-C\><around|(|z,\<Psi\><rsub|\<mu\>>|)>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21><vspace|0.5fn>

      <with|par-left|<quote|1tab>|9.1<space|2spc>Logarithmic capacity and the
      energy minimum <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|9.2<space|2spc>Extremal domain (Stahl)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|1tab>|9.3<space|2spc>Branch transfer along the
      Hadamard fixed point <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1tab>|9.4<space|2spc>Convergence in capacity
      (Stahl) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>