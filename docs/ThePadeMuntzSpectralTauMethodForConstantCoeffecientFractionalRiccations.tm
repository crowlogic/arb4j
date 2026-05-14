<TeXmacs|2.1.5>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <\hide-preamble>
    <new-theorem|assumption|Assumption>

    <assign|re|<macro|Re>>

    <assign|R|<macro|\<bbb-R\>>>

    <assign|C|<macro|\<bbb-C\>>>

    <assign|N|<macro|\<bbb-N\>>>

    <assign|dd|<macro|<space|0.17em><math-up|d>>>

    <assign|ii|<macro|<math-up|i>>>
  </hide-preamble>

  <doc-data|<doc-title|The Padé--Müntz Method forConstant-Coefficient
  Fractional Riccati Equations>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|April 2026>>

  <abstract-data|<\abstract>
    A purely algebraic, discretization-free solution method is developed for
    the general constant-coefficient fractional Riccati equation
    <math|D<rsup|\<mu\>>*y=c<rsub|0>+c<rsub|1>*<space|0.17em>y+c<rsub|2>*<space|0.17em>y<rsup|2>>
    of Caputo order <math|\<mu\>\<in\><around|(|0,1|)>> with initial
    condition <math|I<rsup|1-\<mu\>>*y<around|(|0|)>=0>.<footnote|A reference
    implementation is available in <hlink|arb4j|https://github.com/crowlogic/arb4j/blob/master/src/main/java/arb/equations/ConstantCoefficientFractionalRiccatiEquation.java>.>
    Because the Müntz lattice <math|<around|{|t<rsup|k*\<mu\>>|}><rsub|k\<ge\>1>>
    is closed under the Caputo derivative, fractional integration, and
    pointwise multiplication, the Müntz spectral Tau substitution yields an
    explicit Puiseux expansion <math|y<around|(|t|)>=<big|sum><rsub|k\<ge\>1>a<rsub|k>*<space|0.17em>t<rsup|k*\<mu\>>>
    whose coefficients satisfy a closed Gamma-ratio convolution recurrence.
    The induced power series in the variable <math|z=t<rsup|\<mu\>>> has a
    strictly positive radius of convergence <math|R>, established by a Banach
    fixed-point argument on the equivalent Volterra equation, and is finite
    for generic parameters because the complexified Riccati flow develops
    movable singularities in the complex <math|z>-plane; the recurrence by
    itself therefore produces only a local representation and is not globally
    convergent in <math|t>. Global-in-<math|t> convergence on the positive
    real axis is recovered by re-summing the Puiseux series via the diagonal
    <math|<around|[|M/M|]>> Padé approximant in <math|z>, constructed from
    the Müntz coefficients through a single Hankel linear system
    <math|H<rsub|M>*\<b-q\>=-\<b-b\>>. Under the de<nbsp>Montessus
    de<nbsp>Ballore and Nuttall--Pommerenke theorems, the diagonal Padé
    sequence converges to the analytic continuation of <math|y> along
    <math|z=t<rsup|\<mu\>>> for all <math|t\<ge\>0> whenever the solution has
    no real-positive poles <em|and> <math|g<around|(|z|)>\<assign\>y<around|(|z<rsup|1/\<mu\>>|)>>
    admits a meromorphic continuation to <math|<C>>; in that setting a
    computable a-posteriori error bound <math|<around|\||y<around|(|t|)>-y<rsub|M><around|(|t|)>|\|>\<le\><around|\||\<Delta\><rsub|M><around|(|t<rsup|\<mu\>>|)>|\|><rsup|2>/<around|(|<around|\||\<Delta\><rsub|M-1><around|(|t<rsup|\<mu\>>|)>|\|>-<around|\||\<Delta\><rsub|M><around|(|t<rsup|\<mu\>>|)>|\|>|)>>
    in terms of successive Padé differences
    <math|\<Delta\><rsub|k>=R<rsub|k>-R<rsub|k-1>> is derived from a uniform
    geometric tail estimate.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Fractional
    Calculus and the Müntz Basis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Riemann\ULiouville integral and Caputo
    derivative <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|1.2<space|2spc>The Müntz basis
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Constant-Coefficient Fractional Riccati Equation>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Equation and Volterra representation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|The Müntz\UTau Puiseux series solution
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Padé
    Resummation in <with|mode|math|z=t<rsup|\<mu\>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Power series in <with|mode|math|z> and
    the Hankel system <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.2<space|2spc>Remainder representation and
    successive-difference bound <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|3.3<space|2spc>Global convergence on the positive
    real axis <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|3.4<space|2spc>Algorithmic summary
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>
  </table-of-contents>

  <section|Fractional Calculus and the Müntz Basis><label|sec:prelim>

  <subsection|Riemann\ULiouville integral and Caputo derivative>

  <\definition>
    [Riemann\ULiouville integral]<label|def:RL> Let <math|r\<gtr\>0> and
    <math|f\<in\>L<rsup|1><rsub|<math-up|loc>><around|[|0,T|]>>. Define

    <\equation>
      <label|eq:RL_int>I<rsup|r>*f<around|(|t|)>\<assign\><frac|1|\<Gamma\><around|(|r|)>>*<big|int><rsub|0><rsup|t><around|(|t-s|)><rsup|r-1>*f<around|(|s|)><space|0.17em><dd>s
      \ \ \ \ \ \<forall\>t\<in\><around|[|0,T|]>
    </equation>
  </definition>

  <\definition>
    [Caputo derivative]<label|def:Caputo> Let
    <math|\<mu\>\<in\><around|(|0,1|)>> and <math|f> satisfy
    <math|I<rsup|1-\<mu\>>*f\<in\>C<rsup|1><around|[|0,T|]>>. Define

    <\equation>
      <label|eq:caputo>D<rsup|\<mu\>>*f<around|(|t|)>\<assign\><frac|<dd>|<dd>t>*<space|-0.17em><around*|(|I<rsup|1-\<mu\>>*f<around|(|t|)>|)>-<frac|f<around|(|0|)>|\<Gamma\>*<around|(|1-\<mu\>|)>>*t<rsup|-\<mu\>>
      \ \ \ \ \ \ \ \ \ \ \ \ \<forall\>t\<in\><around|(|0,T|]>
    </equation>

    The fundamental relations are

    <\equation>
      <label|eq:caputo_RL>I<rsup|\<mu\>>*D<rsup|\<mu\>>*f<around|(|t|)>=f<around|(|t|)>-f<around|(|0|)>
    </equation>

    <\equation>
      D<rsup|\<mu\>>*I<rsup|\<mu\>>*f<around|(|t|)>=f<around|(|t|)>
    </equation>
  </definition>

  <\remark>
    [Vanishing correction term for the Riccati
    solution]<label|rem:correction> For the fractional Riccati equation
    <eqref|eq:frac_riccati> below, the initial condition
    <math|I<rsup|1-\<mu\>>*y<around|(|0|)>=0> is consistent with the Müntz
    ansatz <math|y<around|(|t|)>=<big|sum><rsub|k\<ge\>1>a<rsub|k>*<space|0.17em>t<rsup|k*\<mu\>>>,
    since by <eqref|eq:Ir_power> below <math|I<rsup|1-\<mu\>><around|[|t<rsup|k*\<mu\>>|]><mid|\|><rsub|t=0>=0>
    for all <math|k\<ge\>1>. The same ansatz gives <math|y<around|(|0|)>=0>,
    so the correction term <math|-f<around|(|0|)>*t<rsup|-\<mu\>>/\<Gamma\>*<around|(|1-\<mu\>|)>>
    in <eqref|eq:caputo> vanishes identically along the Riccati solution, and
    the Caputo derivative reduces to <math|D<rsup|\<mu\>>*y<around|(|t|)>=<frac|<dd>|<dd>t>*I<rsup|1-\<mu\>>*y<around|(|t|)>>
    throughout.
  </remark>

  <\proposition>
    [Action on powers]<label|prop:powers> Let <math|s\<gtr\>-1> and
    <math|r\<gtr\>0>. Then

    <\equation>
      <label|eq:Ir_power>I<rsup|r>*t<rsup|s>=<frac|\<Gamma\>*<around|(|s+1|)>|\<Gamma\>*<around|(|s+r+1|)>>*<space|0.17em>t<rsup|s+r>
    </equation>

    Let <math|\<mu\>\<in\><around|(|0,1|)>> and <math|s\<gtr\>0>. Then

    <\equation>
      <label|eq:Dmu_power>D<rsup|\<mu\>>*t<rsup|s>=<frac|\<Gamma\>*<around|(|s+1|)>|\<Gamma\>*<around|(|s+1-\<mu\>|)>>*<space|0.17em>t<rsup|s-\<mu\>>
    </equation>
  </proposition>

  <\proof>
    For <eqref|eq:Ir_power>,

    <\equation>
      I<rsup|r>*t<rsup|s>=<frac|1|\<Gamma\><around|(|r|)>>*<big|int><rsub|0><rsup|t><around|(|t-u|)><rsup|r-1>*u<rsup|s><space|0.17em><dd>u
    </equation>

    The substitution <math|u=t*x> gives

    <\equation>
      <tabular|<tformat|<table|<row|<cell|I<rsup|r>*t<rsup|s>>|<cell|=<frac|t<rsup|s+r>|\<Gamma\><around|(|r|)>>*<big|int><rsub|0><rsup|1><around|(|1-x|)><rsup|r-1>*x<rsup|s><space|0.17em><dd>x>>|<row|<cell|>|<cell|=<frac|t<rsup|s+r>|\<Gamma\><around|(|r|)>>\<cdot\><frac|\<Gamma\>*<around|(|s+1|)>*<space|0.17em>\<Gamma\><around|(|r|)>|\<Gamma\>*<around|(|s+r+1|)>>=<frac|\<Gamma\>*<around|(|s+1|)>|\<Gamma\>*<around|(|s+r+1|)>>*<space|0.17em>t<rsup|s+r>>>>>>
    </equation>

    For <eqref|eq:Dmu_power>: since <math|s\<gtr\>0>,
    <math|lim<rsub|t\<to\>0<rsup|+>> t<rsup|s>=0>; the Caputo correction term
    <math|-f<around|(|0|)>*<space|0.17em>t<rsup|-\<mu\>>/\<Gamma\>*<around|(|1-\<mu\>|)>>
    in <eqref|eq:caputo> therefore vanishes, and <math|>

    <\equation>
      D<rsup|\<mu\>>*t<rsup|s>=<frac|<dd>|<dd>t>*I<rsup|1-\<mu\>>*t<rsup|s>
    </equation>

    . By <eqref|eq:Ir_power> with <math|r=1-\<mu\>>, <math|>

    <\equation>
      I<rsup|1-\<mu\>>*t<rsup|s>=<frac|\<Gamma\>*<around|(|s+1|)>|\<Gamma\>*<around|(|s+2-\<mu\>|)>>*t<rsup|s+1-\<mu\>>
    </equation>

    ; differentiating and using <math|>

    <\equation>
      \<Gamma\>*<around|(|s+2-\<mu\>|)>=<around|(|s+1-\<mu\>|)>*\<Gamma\>*<around|(|s+1-\<mu\>|)>
    </equation>

    \ yields <eqref|eq:Dmu_power>.
  </proof>

  <\remark>
    [The case <math|s=0>]<label|rem:Dmu_const> The hypothesis
    <math|s\<gtr\>0> in<nbsp><eqref|eq:Dmu_power> cannot be relaxed to
    <math|s\<ge\>0>. For <math|s=0>, <math|f<around|(|t|)>\<equiv\>1>,
    <math|f<around|(|0|)>=1>, and the correction term
    in<nbsp><eqref|eq:caputo> gives <math|D<rsup|\<mu\>><around|(|1|)>=t<rsup|-\<mu\>>/\<Gamma\>*<around|(|1-\<mu\>|)>-t<rsup|-\<mu\>>/\<Gamma\>*<around|(|1-\<mu\>|)>=0>,
    whereas the right-hand side of<nbsp><eqref|eq:Dmu_power> evaluated at
    <math|s=0> equals <math|t<rsup|-\<mu\>>/\<Gamma\>*<around|(|1-\<mu\>|)>\<ne\>0>.
    The Caputo derivative of a constant is therefore zero, consistent with
    the convention <math|D<rsup|\<mu\>>*y<around|(|0|)>=0> for solutions
    of<nbsp><eqref|eq:frac_riccati> that vanish at the origin.
  </remark>

  <subsection|The Müntz basis>

  Fix <math|\<mu\>\<in\><around|(|0,1|)>> and <math|T\<gtr\>0>.

  <\definition>
    [Müntz system]<label|def:muntz> For <math|k\<in\><N>>, define
    <math|e<rsub|k><around|(|t|)>\<assign\>t<rsup|k*\<mu\>>> on
    <math|<around|[|0,T|]>>. The span of <math|<around|{|1,e<rsub|k>:k\<ge\>1|}>>
    is denoted

    <\equation>
      \<cal-M\>\<assign\><math-up|span><around|{|1,t<rsup|\<mu\>>,t<rsup|2*\<mu\>>,\<ldots\>|}>
    </equation>
  </definition>

  <\remark>
    [Completeness]<label|rem:muntz_complete> By the Müntz\USzász theorem,
    <math|<around|{|t<rsup|k*\<mu\>>|}><rsub|k\<ge\>1>> is complete in
    <math|L<rsup|2><around|[|0,1|]>> iff <math|<big|sum><rsub|k\<ge\>1><around|(|k*\<mu\>|)><rsup|-1>=\<infty\>>.
    Since <math|<big|sum><rsub|k\<ge\>1>k<rsup|-1>=\<infty\>>, completeness
    holds for every <math|\<mu\>\<in\><around|(|0,1|)>>. This underwrites the
    Müntz\UTau spectral method.
  </remark>

  <\proposition>
    [Closure of <math|\<cal-M\>>]<label|prop:closure_M> For <math|k\<ge\>1>
    and <math|r\<gtr\>0>,

    <\align>
      <tformat|<table|<row|<cell|D<rsup|\<mu\>>*t<rsup|k*\<mu\>>>|<cell|=<frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k-1|)>*\<mu\>+1|)>>*<space|0.17em>t<rsup|<around|(|k-1|)>*\<mu\>><eq-number><label|eq:Dmu_Muntz>>>|<row|<cell|I<rsup|r>*t<rsup|k*\<mu\>>>|<cell|=<frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+r+1|)>>*<space|0.17em>t<rsup|k*\<mu\>+r><eq-number><label|eq:Ir_Muntz>>>|<row|<cell|t<rsup|j*\<mu\>>*<space|0.17em>t<rsup|k*\<mu\>>>|<cell|=t<rsup|<around|(|j+k|)>*\<mu\>><eq-number><label|eq:prod_Muntz>>>>>
    </align>

    Consequently <math|D<rsup|\<mu\>>*\<cal-M\>\<subset\>\<cal-M\>>,
    <math|I<rsup|r>*\<cal-M\>\<subset\>\<cal-M\>>, and <math|\<cal-M\>> is
    closed under multiplication.
  </proposition>

  <\proof>
    <eqref|eq:Dmu_Muntz> follows from <localize|Proposition><nbsp><reference|prop:powers>
    with <math|s=k*\<mu\>\<gtr\>0>; <eqref|eq:Ir_Muntz> from
    <eqref|eq:Ir_power> with <math|s=k*\<mu\>\<gtr\>-1>;
    <eqref|eq:prod_Muntz> is direct.
  </proof>

  These three closure properties together \V under <math|D<rsup|\<mu\>>>,
  under <math|I<rsup|r>>, and under multiplication \V are exactly what makes
  the Müntz lattice the canonical basis for any constant-coefficient
  fractional ODE with polynomial nonlinearity. The Müntz\UTau substitution
  <cite|esmaeili2015> preserves the entire algebraic structure of the
  equation.

  <section|The Constant-Coefficient Fractional Riccati
  Equation><label|sec:riccati>

  <subsection|Equation and Volterra representation>

  Let <math|\<mu\>\<in\><around|(|0,1|)>> and
  <math|c<rsub|0>,c<rsub|1>,c<rsub|2>\<in\><C>>. Consider

  <\equation>
    <label|eq:frac_riccati>D<rsup|\<mu\>>*y<around|(|t|)>=c<rsub|0>+c<rsub|1>*<space|0.17em>y<around|(|t|)>+c<rsub|2>*<space|0.17em>y<around|(|t|)><rsup|2>
  </equation>

  <\equation>
    I<rsup|1-\<mu\>>*y<around|(|0|)>=0
  </equation>

  Applying <math|I<rsup|\<mu\>>> and using <eqref|eq:caputo_RL> (and
  <math|y<around|(|0|)>=0> from <localize|Remark><nbsp><reference|rem:correction>)
  gives the equivalent Volterra integral equation

  <\equation>
    <label|eq:frac_riccati_V>y<around|(|\<lambda\>,t|)>=<frac|1|\<Gamma\><around|(|\<mu\>|)>>*<big|int><rsub|0><rsup|t><around|(|t-s|)><rsup|\<mu\>-1>*<space|-0.17em><around*|(|c<rsub|0><around*|(|\<lambda\>|)>+c<rsub|1><around*|(|\<lambda\>|)><space|0.17em>y<around|(|s|)>+c<rsub|2><around*|(|\<lambda\>|)>y<around|(|s|)><rsup|2>|)><dd>s
  </equation>

  <\remark>
    [Hölder regularity at the origin]<label|rem:regularity> Evaluating
    <eqref|eq:frac_riccati_V> at <math|t=0> gives <math|y<around|(|0|)>=0>.
    Near the origin, <math|>

    <\equation>
      y<around|(|\<lambda\>,t|)>=<frac|c<rsub|0><around*|(|\<lambda\>|)>|\<Gamma\>*<around|(|\<mu\>+1|)>>*<space|0.17em>t<rsup|\<mu\>>+\<cal-O\><around|(|t<rsup|2*\<mu\>>|)>
    </equation>

    , so <math|y> is Hölder continuous of order <math|\<mu\>> but not
    <math|C<rsup|1>> at <math|0>. The Hölder exponent <math|\<mu\>> is the
    natural regularity scale of the problem and the reason ordinary Taylor
    series in <math|t> fail.
  </remark>

  <subsection*|The Müntz\UTau Puiseux series solution>

  <\theorem>
    [Series solution in <math|<around|{|t<rsup|k*\<mu\>>|}>>]<label|thm:riccati_series>
    There exists <math|R\<gtr\>0> and coefficients
    <math|<around|(|a<rsub|k>|)><rsub|k\<ge\>1>\<subset\><C>> such that

    <\equation>
      <label|eq:y_series>y<around|(|\<lambda\>,t|)>=<big|sum><rsub|k=1><rsup|\<infty\>>a<rsub|k>*<around*|(|\<lambda\>|)>t<rsup|k*\<mu\>>
      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \<forall\><around|\||t|\|>\<less\>R<rsup|1/\<mu\>>
    </equation>

    with

    <\align>
      <tformat|<table|<row|<cell|a<rsub|1><around*|(|\<lambda\>|)>>|<cell|=<frac|c<rsub|0><around*|(|\<lambda\>|)>|\<Gamma\>*<around|(|\<mu\>+1|)>><eq-number><label|eq:a1_const>>>|<row|<cell|<vspace*|4pt>a<rsub|k+1><around*|(|\<lambda\>|)>>|<cell|=<frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>>*<around*|(|c<rsub|1><around*|(|\<lambda\>|)>*<space|0.17em>a<rsub|k><around*|(|\<lambda\>|)>+c<rsub|2><around*|(|\<lambda\>|)>*<space|-0.17em><space|-0.17em><big|sum><rsub|<stack|<tformat|<table|<row|<cell|j+\<ell\>=k>>|<row|<cell|1\<le\>j,\<ell\>\<le\>
      k-1>>>>>><space|-0.17em><space|-0.17em>a<rsub|j>*<space|0.17em>a<rsub|\<ell\>>|)><space|2em>\<forall\>k\<ge\>1<eq-number><label|eq:ak_const>>>>>
    </align>
  </theorem>

  <\remark>
    [Quadratic convolution at <math|k=1>]<label|rem:conv_k1> For <math|k=1>,
    the convolution sum is empty (no pairs <math|<around|(|j,\<ell\>|)>> with
    <math|j,\<ell\>\<ge\>1> and <math|j+\<ell\>=1>), so <math|>

    <\equation>
      a<rsub|2><around*|(|\<lambda\>|)>=<frac|\<Gamma\>*<around|(|\<mu\>+1|)>|\<Gamma\>*<around|(|2*\<mu\>+1|)>>*<space|0.17em>c<rsub|1><around*|(|\<lambda\>|)>a<rsub|1><around*|(|\<lambda\>|)>
    </equation>

    . The quadratic term first contributes at <math|k=2>, giving <math|>

    <\equation>
      a<rsub|3><around*|(|\<lambda\>|)>=<frac|\<Gamma\>*<around|(|2*\<mu\>+1|)>|\<Gamma\>*<around|(|3*\<mu\>+1|)>>*<around|(|c<rsub|1><around*|(|\<lambda\>|)>*<space|0.17em>a<rsub|2><around*|(|\<lambda\>|)>+c<rsub|2>*<space|0.17em>a<rsub|1><around*|(|\<lambda\>|)><rsup|2>|)>
    </equation>
  </remark>

  Existence of a positive radius <math|R\<gtr\>0> and analyticity of <math|y>
  in <math|z=t<rsup|\<mu\>>> on <math|<around|\||z|\|>\<less\>R> is
  established in <localize|Theorem><nbsp><reference|thm:radius> below by a
  Banach fixed-point argument on <eqref|eq:frac_riccati_V>. Granting that,
  write\ 

  <\equation>
    y<around|(|\<lambda\>,t|)>=<big|sum><rsub|k\<ge\>1>a<rsub|k>*<around*|(|\<lambda\>|)><space|0.17em>t<rsup|k*\<mu\>>
  </equation>

  ; by <eqref|eq:prod_Muntz>, we have

  <\equation>
    y<around|(|t|)><rsup|2>=<big|sum><rsub|m=2><rsup|\<infty\>><space|-0.17em><around*|(|<big|sum><rsub|<stack|<tformat|<table|<row|<cell|j+\<ell\>=m>>|<row|<cell|1\<le\>j,\<ell\>\<le\>m-1>>>>>><space|-0.17em>a<rsub|j>*<space|0.17em>a<rsub|\<ell\>>|)>*t<rsup|m*\<mu\>>
  </equation>

  abbreviated\ 

  <\equation>
    <around*|(|b<rsub|m><around*|(|\<lambda\>|)>\<assign\><big|sum><rsub|<stack|<tformat|<table|<row|<cell|j+\<ell\>=m>>|<row|<cell|1\<le\>j,\<ell\>\<le\>m-1>>>>>>a<rsub|j><around*|(|\<lambda\>|)>*<space|0.17em>a<rsub|\<ell\>><around*|(|\<lambda\>|)>|)>
  </equation>

  \ (with <math|b<rsub|1>=0>). Substituting into <eqref|eq:frac_riccati_V>
  and splitting the integral,

  <\equation>
    <tabular|<tformat|<table|<row|<cell|y<around|(|t|)>>|<cell|=<frac|c<rsub|0><around*|(|\<lambda\>|)>|\<Gamma\><around|(|\<mu\>|)>>*<space|-0.17em><big|int><rsub|0><rsup|t><space|-0.17em><around|(|t-s|)><rsup|\<mu\>-1><dd>s+<frac|c<rsub|1><around*|(|\<lambda\>|)>|\<Gamma\><around|(|\<mu\>|)>>*<big|sum><rsub|k\<ge\>1>a<rsub|k>*<space|-0.17em><around*|(|\<lambda\>|)><big|int><rsub|0><rsup|t><space|-0.17em><around|(|t-s|)><rsup|\<mu\>-1>*s<rsup|k*\<mu\>><dd>s>>|<row|<cell|>|<cell|<space|1em>+<frac|c<rsub|2><around*|(|\<lambda\>|)>|\<Gamma\><around|(|\<mu\>|)>>*<big|sum><rsub|m\<ge\>2>b<rsub|m>*<space|-0.17em><around*|(|\<lambda\>|)><big|int><rsub|0><rsup|t><space|-0.17em><around|(|t-s|)><rsup|\<mu\>-1>*s<rsup|m*\<mu\>><dd>s>>>>>
  </equation>

  The first integral equals <math|t<rsup|\<mu\>>/\<Gamma\>*<around|(|\<mu\>+1|)>>.
  For the others, <eqref|eq:Ir_power> with <math|s=k*\<mu\>> and
  <math|r=\<mu\>> gives

  <\equation>
    <big|int><rsub|0><rsup|t><around|(|t-s|)><rsup|\<mu\>-1>*s<rsup|k*\<mu\>><dd>s=\<Gamma\><around|(|\<mu\>|)><space|0.17em><frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>
  </equation>

  Reindexing with <math|n=k+1> and <math|n=m+1> and matching the coefficient
  of <math|t<rsup|n*\<mu\>>> for each <math|n\<ge\>1> yields
  <eqref|eq:a1_const> for <math|n=1> and

  <\equation>
    a<rsub|n><around*|(|\<lambda\>|)>=<around*|(|c<rsub|1><around*|(|\<lambda\>|)><space|0.17em>a<rsub|n-1><around*|(|\<lambda\>|)>+c<rsub|2><around*|(|\<lambda\>|)><space|0.17em>b<rsub|n-1><around*|(|\<lambda\>|)>|)>*<space|0.17em><frac|\<Gamma\>*<around|(|<around|(|n-1|)>*\<mu\>+1|)>|\<Gamma\>*<around|(|n*\<mu\>+1|)>>+*
    \<forall\>n\<ge\>2
  </equation>

  which is <eqref|eq:ak_const> after renaming <math|n\<mapsto\>k+1>.

  <\theorem>
    [Strictly positive Puiseux radius; coefficient bound; generic
    finiteness]<label|thm:radius> Consider the Volterra
    equation<nbsp><eqref|eq:frac_riccati_V>.

    <\enumerate>
      <item><em|Existence and <math|R\<gtr\>0>.> Set

      <\equation>
        <label|eq:T0_choice>T<rsub|0><rsup|\<mu\>><space|0.27em>\<assign\><space|0.27em>min
        <space|-0.17em><around*|(|<frac|\<Gamma\>*<around|(|\<mu\>+1|)>|<around|\||c<rsub|0>|\|>+<around|\||c<rsub|1>|\|>+<around|\||c<rsub|2>|\|>+1>,<space|0.27em><frac|\<Gamma\>*<around|(|\<mu\>+1|)>|2*<around|(|<around|\||c<rsub|1>*<around|\||+2|\|>*c<rsub|2>|\|>+1|)>>|)><space|0.27em>\<gtr\><space|0.27em>0.
      </equation>

      There exists a unique solution <math|y\<in\>C<around|[|0,T<rsub|0>|]>>
      of <eqref|eq:frac_riccati_V> with <math|<around|\<\|\|\>|y|\<\|\|\>><rsub|\<infty\>>\<le\>1>;
      this solution is analytic in <math|z=t<rsup|\<mu\>>> on the disc
      <math|<around|{|<around|\||z|\|>\<less\>T<rsub|0><rsup|\<mu\>>|}>>, so
      the Puiseux series <eqref|eq:y_series> has radius of convergence

      <\equation>
        R<space|0.27em>\<ge\><space|0.27em>T<rsub|0><rsup|\<mu\>><space|0.27em>\<gtr\><space|0.27em>0
      </equation>

      <item><em|Coefficient bound.> For every <math|0\<less\>r\<less\>R>,
      with <math|>

      <\equation>
        M<around|(|r|)>\<assign\>sup<rsub|<around|\||z|\|>=r><around|\||g<around|(|z|)>|\|>
      </equation>

      \ where <math|>

      <\equation>
        g<around|(|z|)>\<assign\>y<around|(|z<rsup|1/\<mu\>>|)>
      </equation>

      we have

      <\equation>
        <label|eq:cauchy_bound><around|\||a<rsub|k>|\|><space|0.27em>\<le\><space|0.27em><frac|M<around|(|r|)>|r<rsup|k>><space|2em>\<forall\>k\<ge\>1
      </equation>

      <item><em|Generic finiteness.>\ 

      <\equation>
        R\<less\><around|\||c<rsub|0>+c<rsub|1>*y<around|(|t|)>+c<rsub|2>*y<around|(|t|)><rsup|2>|\|>\<le\><around|\||c<rsub|0>|\|>+<around|\||c<rsub|1>|\|>+<around|\||c<rsub|2>|\|>\<infty\>
      </equation>

      For generic parameters with <math|c<rsub|2>\<ne\>0>,
      <math|R\<less\>\<infty\>>: the complexified Riccati flow develops
      movable singularities at finite distance from the origin in the complex
      <math|z>-plane.
    </enumerate>
  </theorem>

  <\proof>
    <\enumerate-numeric>
      <item>Let <math|B<rsub|1>\<assign\><around|{|y\<in\>C<around|[|0,T<rsub|0>|]>:<around|\<\|\|\>|y|\<\|\|\>><rsub|\<infty\>>\<le\>1|}>>
      with the supremum norm, and define

      <\equation>
        <tabular|<tformat|<table|<row|<cell|y<around*|(|t|)>>|<cell|\<assign\><space|0.27em><frac|1|\<Gamma\><around|(|\<mu\>|)>>*<big|int><rsub|0><rsup|t><around|(|t-s|)><rsup|\<mu\>-1>*<around*|(|c<rsub|0>+c<rsub|1>*<space|0.17em>y<around|(|s|)>+c<rsub|2>*<space|0.17em>y<around|(|s|)><rsup|2>|)><dd>s>>|<row|<cell|>|<cell|=<space|0.27em>I<rsup|\<mu\>>*<around|(|c<rsub|0>+c<rsub|1>*y+c<rsub|2>*y<rsup|2>|)><around|(|t|)>>>|<row|<cell|>|<cell|>>>>>
      </equation>

      For <math|y\<in\>B<rsub|1>> and <math|t\<in\><around|[|0,T<rsub|0>|]>>,
      <math|>

      <\equation>
        <around|\||c<rsub|0>+c<rsub|1>*y<around|(|t|)>+c<rsub|2>*y<around|(|t|)><rsup|2>|\|>\<le\><around|\||c<rsub|0>|\|>+<around|\||c<rsub|1>|\|>+<around|\||c<rsub|2>|\|>
      </equation>

      \ so by <eqref|eq:Ir_power>,

      <\equation>
        <around|\||\<Phi\><around|(|y|)><around|(|t|)>|\|><space|0.27em>\<le\><space|0.27em><around|(|<around|\||c<rsub|0>|\|>+<around|\||c<rsub|1>|\|>+<around|\||c<rsub|2>|\|>|)>*<frac|t<rsup|\<mu\>>|\<Gamma\>*<around|(|\<mu\>+1|)>><space|0.27em>\<le\><space|0.27em><around|(|<around|\||c<rsub|0>|\|>+<around|\||c<rsub|1>|\|>+<around|\||c<rsub|2>|\|>|)>*<frac|T<rsub|0><rsup|\<mu\>>|\<Gamma\>*<around|(|\<mu\>+1|)>>
      </equation>

      By the first term in <eqref|eq:T0_choice>,\ 

      <\equation>
        <frac|T<rsub|0><rsup|\<mu\>>*<around|(|<around|\||c<rsub|0>|\|>+<around|\||c<rsub|1>|\|>+<around|\||c<rsub|2>|\|>|)>|\<Gamma\>*<around|(|\<mu\>+1|)>>\<le\><frac|<around|\||c<rsub|0>|\|>+<around|\||c<rsub|1>|\|>+<around|\||c<rsub|2>|\|>|<around|\||c<rsub|0>|\|>+<around|\||c<rsub|1>|\|>+<around|\||c<rsub|2>|\|>+1>\<less\>1
      </equation>

      hence <math|\<Phi\><around|(|B<rsub|1>|)>\<subset\>B<rsub|1>>. For
      <math|y<rsub|1>,y<rsub|2>\<in\>B<rsub|1>>,

      <\equation>
        <tabular|<tformat|<table|<row|<cell|<around*|\||c<rsub|1>*<around|(|y<rsub|1>-y<rsub|2>|)>+c<rsub|2>*<around|(|y<rsub|1><rsup|2>-y<rsub|2><rsup|2>|)>|\|>>|<cell|=<space|0.27em><around*|\||c<rsub|1>+c<rsub|2>*<around|(|y<rsub|1>+y<rsub|2>|)>|\|>*<space|0.17em><around|\||y<rsub|1>-y<rsub|2>|\|><space|0.27em>>>|<row|<cell|>|<cell|\<le\><space|0.27em><around|(|<around|\||c<rsub|1>*<around|\||+2|\|>*c<rsub|2>|\|>|)>*<space|0.17em><around|\<\|\|\>|y<rsub|1>-y<rsub|2>|\<\|\|\>><rsub|\<infty\>>>>>>>
      </equation>

      so

      <\equation>
        <around|\<\|\|\>|\<Phi\><around|(|y<rsub|1>|)>-\<Phi\><around|(|y<rsub|2>|)>|\<\|\|\>><rsub|\<infty\>><space|0.27em>\<le\><space|0.27em><frac|T<rsub|0><rsup|\<mu\>>|\<Gamma\>*<around|(|\<mu\>+1|)>><around|(|<around|\||c<rsub|1>*<around|\||+2|\|>*c<rsub|2>|\|>|)>*<space|0.17em><around|\<\|\|\>|y<rsub|1>-y<rsub|2>|\<\|\|\>><rsub|\<infty\>>
      </equation>

      By the second term in <eqref|eq:T0_choice>,

      <\equation>
        <frac|T<rsub|0><rsup|\<mu\>><around|(|<around|\||c<rsub|1>*<around|\||+2|\|>*c<rsub|2>|\|>|)>|\<Gamma\>*<around|(|\<mu\>+1|)>>\<le\><frac|<around|\||c<rsub|1>*<around|\||+2|\|>*c<rsub|2>|\|>|<around|[|2*<around|(|<around|\||c<rsub|1>*<around|\||+2|\|>*c<rsub|2>|\|>+1|)>|]>>\<less\><tfrac|1|2>
      </equation>

      hence <math|\<Phi\>> is a strict contraction on <math|B<rsub|1>>. The
      Banach fixed-point theorem provides a unique
      <math|y<rsup|\<ast\>>\<in\>B<rsub|1>> with
      <math|\<Phi\><around|(|y<rsup|\<ast\>>|)>=y<rsup|\<ast\>>>, which
      solves <eqref|eq:frac_riccati_V>. The formal Puiseux series defined by
      <eqref|eq:a1_const>\U<eqref|eq:ak_const> solves the same Volterra
      equation order-by-order; by uniqueness, the series equals
      <math|y<rsup|\<ast\>>> on <math|<around|[|0,T<rsub|0>|]>>, and hence
      converges for <math|<around|\||t<rsup|\<mu\>>|\|>\<less\>T<rsub|0><rsup|\<mu\>>>,
      proving <math|R\<ge\>T<rsub|0><rsup|\<mu\>>\<gtr\>0>.

      <item>By item<nbsp>(i), <math|g<around|(|z|)>=y<around|(|z<rsup|1/\<mu\>>|)>=<big|sum><rsub|k\<ge\>1>a<rsub|k>*z<rsup|k>>
      is analytic on <math|<around|{|<around|\||z|\|>\<less\>R|}>>. For any
      <math|0\<less\>r\<less\>R>, Cauchy's integral formula gives

      <\equation>
        a<rsub|k><space|0.27em>=<space|0.27em><frac|1|2*\<pi\><ii>>*<big|oint><rsub|<around|\||z|\|>=r><frac|g<around|(|z|)>|z<rsup|k+1>><space|0.17em><dd>z
      </equation>

      <\equation>
        <around|\||a<rsub|k>|\|><space|0.27em>\<le\><space|0.27em>sup<rsub|<around|\||z|\|>=r><around|\||g<around|(|z|)>|\|>\<cdot\>r<rsup|-k><space|0.27em>=<space|0.27em>M<around|(|r|)>*<space|0.17em>r<rsup|-k>
      </equation>

      <item>For the classical case <math|\<mu\>=1> with
      <math|c<rsub|2>\<ne\>0>, the linear substitution
      <math|y=-w<rprime|'>/<around|(|c<rsub|2>*w|)>> reduces
      <math|y<rprime|'>=c<rsub|0>+c<rsub|1>*y+c<rsub|2>*y<rsup|2>> to a
      second-order linear ODE with constant coefficients for <math|w>; the
      zeros of <math|w> generically lie at finite <math|t>, and at each such
      zero <math|y> has a simple pole. The same algebraic structure of the
      recurrence<nbsp><eqref|eq:ak_const> persists for
      <math|\<mu\>\<in\><around|(|0,1|)>>, and the resulting
      <math|g<around|(|z|)>> generically inherits movable singularities at
      finite distance from the origin in the <math|z>-plane (the exact
      location of the nearest singularity is encoded by the limit of the
      diagonal Padé poles, see <localize|Section><nbsp><reference|sec:pade>).
      Hence <math|R\<less\>\<infty\>> for generic parameters with
      <math|c<rsub|2>\<ne\>0>
    </enumerate-numeric>

    \;
  </proof>

  <\remark>
    [Why this is only a local representation]<label|rem:radius_local>
    <localize|Theorem><nbsp><reference|thm:radius>(iii) is the central
    obstruction: even though every <math|a<rsub|k>> is computed in closed
    form by <eqref|eq:ak_const>, the series <eqref|eq:y_series> does <em|not>
    converge for all <math|t\<ge\>0>. The complex <math|z>-plane carries
    movable singularities of the Riccati flow, and the Puiseux radius
    <math|R> is the distance to the nearest such singularity. On the positive
    real <math|t>-axis the solution <math|y<around|(|t|)>> may exist for all
    <math|t>, yet the Müntz series ceases to converge once
    <math|t<rsup|\<mu\>>> exceeds <math|R>. A genuine global representation
    must exploit <em|analytic continuation>, not raw series summation. This
    is the role played by Padé approximation in the next section.
  </remark>

  <section|Padé Resummation in <math|z=t<rsup|\<mu\>>>><label|sec:pade>

  <subsection|Power series in <math|z> and the Hankel system>

  Let <math|z\<assign\>t<rsup|\<mu\>>> and define
  <math|g<around|(|z|)>\<assign\>y<around|(|z<rsup|1/\<mu\>>|)>>. Then

  <\equation>
    <label|eq:g_series>g<around|(|z|)>=<big|sum><rsub|k=1><rsup|\<infty\>>a<rsub|k>*<space|0.17em>z<rsup|k>,<space|2em><around|\||z|\|>\<less\>R.
  </equation>

  Fix <math|M\<in\><N>> and seek polynomials

  <\equation>
    P<rsub|M><around|(|z|)>\<assign\><big|sum><rsub|k=0><rsup|M>p<rsub|k>*<space|0.17em>z<rsup|k>,<space|2em>Q<rsub|M><around|(|z|)>\<assign\>1+<big|sum><rsub|k=1><rsup|M>q<rsub|k>*<space|0.17em>z<rsup|k>
  </equation>

  satisfying the Padé matching condition

  <\equation>
    <label|eq:Pade_match>Q<rsub|M><around|(|z|)>*<space|0.17em>g<around|(|z|)>-P<rsub|M><around|(|z|)>=\<cal-O\><around|(|z<rsup|2*M+1>|)>*<space|1em><around|(|z\<to\>0|)>.
  </equation>

  <\lemma>
    [Hankel form of the denominator system]<label|lem:hankel> Substituting
    <eqref|eq:g_series> into <eqref|eq:Pade_match> and matching coefficients
    of <math|z<rsup|n>> for <math|0\<le\>n\<le\>2*M> gives
    <math|p<rsub|0>=0>,

    <\align>
      <tformat|<cwith|2|2|1|1|cell-valign|B>|<table|<row|<cell|p<rsub|n>>|<cell|=a<rsub|n>+<big|sum><rsub|j=1><rsup|min
      <around|(|n,M|)>>q<rsub|j>*<space|0.17em>a<rsub|n-j><application-space|1em>\<forall\>1\<le\>n\<le\>M<eq-number><label|eq:Pade1>>>|<row|<cell|0>|<cell|=a<rsub|n>+<big|sum><rsub|j=1><rsup|M>q<rsub|j>*<space|0.17em>a<rsub|n-j>
      \ \ \ \ \ \ \ \ \<space\>\<forall\>M+1\<le\>n\<le\>2*M<eq-number><label|eq:Pade2>>>>>
    </align>

    The denominator system <eqref|eq:Pade2> is the Hankel linear system

    <\equation>
      <label|eq:hankel_system>H<rsub|M>*<space|0.17em>\<b-q\>=-\<b-b\>
    </equation>

    where

    <\equation>
      H<rsub|M>=<matrix|<tformat|<table|<row|<cell|a<rsub|M>>|<cell|a<rsub|M-1>>|<cell|\<cdots\>>|<cell|a<rsub|1>>>|<row|<cell|a<rsub|M+1>>|<cell|a<rsub|M>>|<cell|\<cdots\>>|<cell|a<rsub|2>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|a<rsub|2*M-1>>|<cell|a<rsub|2*M-2>>|<cell|\<cdots\>>|<cell|a<rsub|M>>>>>>
    </equation>

    <\equation>
      \<b-q\>=<matrix|<tformat|<table|<row|<cell|q<rsub|1>>>|<row|<cell|\<vdots\>>>|<row|<cell|q<rsub|M>>>>>>
      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ <space|1em>\<b-b\>=<matrix|<tformat|<table|<row|<cell|a<rsub|M+1>>>|<row|<cell|\<vdots\>>>|<row|<cell|a<rsub|2*M>>>>>>
    </equation>
  </lemma>

  <\proof>
    Direct expansion of <math|Q<rsub|M>*<space|0.17em>g> and identification
    of coefficients.
  </proof>

  <\remark>
    [Invertibility of <math|H<rsub|M>>]<label|rem:HM_invertible>
    <math|H<rsub|M>> is invertible iff <math|g<around|(|z|)>> is not a
    rational function of degree less than <math|M>. For <math|\<mu\>=1>
    (classical case) the Riccati solution is rational, and <math|H<rsub|M>>
    becomes singular for <math|M> beyond the exact pole order. For
    <math|\<mu\>\<in\><around|(|0,1|)>>, <math|g<around|(|z|)>> admits no
    finite-order rational representation; <math|det H<rsub|M>\<ne\>0>
    generically for all <math|M\<ge\>1>. If a particular order <math|M>
    yields <math|det H<rsub|M>=0>, use <math|M\<pm\>1>.
  </remark>

  <\lemma>
    [Solution]<label|lem:Pade_system> If <math|det H<rsub|M>\<neq\>0>, then
    <eqref|eq:hankel_system> has the unique solution
    <math|\<b-q\>=-H<rsub|M><rsup|-1>*\<b-b\>>, and the numerator
    coefficients are given by <eqref|eq:Pade1>.
  </lemma>

  The diagonal Padé approximant is then

  <\equation>
    <label|eq:R_M_def>R<rsub|M><around|(|z|)><space|0.27em>\<assign\><space|0.27em><frac|P<rsub|M><around|(|z|)>|Q<rsub|M><around|(|z|)>><space|0.27em>=<space|0.27em><frac|<big|sum><rsub|k=0><rsup|M>p<rsub|k>*<space|0.17em>z<rsup|k>|1+<big|sum><rsub|k=1><rsup|M>q<rsub|k>*<space|0.17em>z<rsup|k>>.
  </equation>

  <\definition>
    [Padé domain]<label|def:D_M> <math|\<cal-D\><rsub|M>\<assign\><around|{|z\<in\><C>:det
    H<rsub|M>\<neq\>0,Q<rsub|M><around|(|z|)>\<neq\>0|}>>.
  </definition>

  <subsection|Remainder representation and successive-difference bound>

  Define the remainder

  <\equation>
    <label|eq:eps_g>\<varepsilon\><rsub|M><around|(|z|)>\<assign\>g<around|(|z|)>-R<rsub|M><around|(|z|)>
  </equation>

  By construction <math|\<varepsilon\><rsub|M><around|(|z|)>=\<cal-O\><around|(|z<rsup|2*M+1>|)>>,
  and standard Padé theory <cite|baker1996> gives the structural
  representation

  <\equation>
    <label|eq:eps_structure>\<varepsilon\><rsub|M><around|(|z|)>=<frac|\<Pi\><rsub|M+1><around|(|z|)>|Q<rsub|M><around|(|z|)><rsup|2>>*<space|0.17em>z<rsup|2*M+1>
  </equation>

  for some polynomial <math|\<Pi\><rsub|M+1>> of degree at most <math|M+1>.
  For the a-posteriori bound, define

  <\equation>
    <label|eq:Delta_def>\<Delta\><rsub|k><around|(|z|)>\<assign\>R<rsub|k><around|(|z|)>-R<rsub|k-1><around|(|z|)>,<space|2em>k\<ge\>1.
  </equation>

  <\assumption>
    [Uniform geometric tail]<label|ass:diff_bound> At a fixed
    <math|z\<in\>\<cal-D\><rsub|M>\<cap\>\<cal-D\><rsub|M-1>>:

    <\enumerate>
      <item><math|g> has no poles in <math|<around|{|<around|\||\<zeta\>|\|>\<le\><around|\||z|\|>|}>>;

      <item><math|Q<rsub|M><around|(|z|)>\<ne\>0> and
      <math|Q<rsub|M-1><around|(|z|)>\<ne\>0>;

      <item>there exists <math|\<rho\>\<in\><around|(|0,1|)>> such that
      <math|<around|\||\<Delta\><rsub|k+1><around|(|z|)>|\|>\<le\>\<rho\><space|0.17em><around|\||\<Delta\><rsub|k><around|(|z|)>|\|>>
      for every <math|k\<ge\>M-1>.
    </enumerate>
  </assumption>

  <\theorem>
    [Computable error bound]<label|thm:error> Under
    <nbsp><reference|ass:diff_bound> with contraction ratio <math|\<rho\>>,
    the Padé sequence <math|R<rsub|k><around|(|z|)>> converges and

    <\equation>
      <label|eq:error_bound_uniform><around|\||g<around|(|z|)>-R<rsub|M><around|(|z|)>|\|><space|0.27em>\<le\><space|0.27em><frac|\<rho\><space|0.17em><around|\||\<Delta\><rsub|M><around|(|z|)>|\|>|1-\<rho\>>.
    </equation>

    In particular, taking the smallest a-posteriori-observable contraction
    ratio <math|\<rho\><rsub|\<ast\>>\<assign\><around|\||\<Delta\><rsub|M><around|(|z|)>|\|>/<around|\||\<Delta\><rsub|M-1><around|(|z|)>|\|>>
    (which equals <math|\<rho\>> at the index <math|k=M-1> by<nbsp>(iii) with
    equality, hence satisfies <math|\<rho\><rsub|\<ast\>>\<le\>\<rho\>\<less\>1>),
    and assuming<nbsp>(iii) holds with this <math|\<rho\><rsub|\<ast\>>>,

    <\equation>
      <label|eq:error_bound><around|\||g<around|(|z|)>-R<rsub|M><around|(|z|)>|\|><space|0.27em>\<le\><space|0.27em><frac|<around|\||\<Delta\><rsub|M><around|(|z|)>|\|><rsup|2>|<around|\||\<Delta\><rsub|M-1><around|(|z|)>|\|>-<around|\||\<Delta\><rsub|M><around|(|z|)>|\|>>.
    </equation>
  </theorem>

  <\proof>
    By <nbsp><reference|ass:diff_bound>(iii)

    <\equation>
      <around|\||\<Delta\><rsub|M+j><around|(|z|)>|\|>\<le\>\<rho\><rsup|j><around|\||\<Delta\><rsub|M><around|(|z|)>|\|>
    </equation>

    \ for every <math|j\<ge\>0> (induction on <math|j>, with the base case
    from<nbsp>(iii) and the step from\ 

    <\equation>
      <around|\||\<Delta\><rsub|M+j+1>|\|>\<le\>\<rho\><around|\||\<Delta\><rsub|M+j>|\|>
    </equation>

    . Since <math|<big|sum><rsub|j=0><rsup|\<infty\>>\<rho\><rsup|j><around|\||\<Delta\><rsub|M><around|(|z|)>|\|>\<less\>\<infty\>>,
    the telescoping series

    <\equation>
      g<around|(|z|)>-R<rsub|M><around|(|z|)><space|0.27em>=<space|0.27em><big|sum><rsub|k=M+1><rsup|\<infty\>>\<Delta\><rsub|k><around|(|z|)>
    </equation>

    converges absolutely. Estimating term-by-term,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\||g<around|(|z|)>-R<rsub|M><around|(|z|)>|\|>>|<cell|\<le\><space|0.27em><big|sum><rsub|j=1><rsup|\<infty\>><around|\||\<Delta\><rsub|M+j><around|(|z|)>|\|><space|0.27em>>>|<row|<cell|>|<cell|\<le\><space|0.27em><around|\||\<Delta\><rsub|M><around|(|z|)>|\|>*<big|sum><rsub|j=1><rsup|\<infty\>>\<rho\><rsup|j><rsub|><space|0.27em>>>|<row|<cell|>|<cell|=<space|0.27em><frac|\<rho\><space|0.17em><around|\||\<Delta\><rsub|M><around|(|z|)>|\|>|1-\<rho\>>>>>>>
    </equation>

    which is<nbsp><eqref|eq:error_bound_uniform>. Substituting\ 

    <\equation>
      \<rho\>=\<rho\><rsub|\<ast\>>=<frac|<around|\||\<Delta\><rsub|M><around|(|z|)>|\|>|<around|\||\<Delta\><rsub|M-1><around|(|z|)>|\|>>
    </equation>

    \ yields <math|>

    <\equation>
      <frac|\<rho\><rsub|\<ast\>><around|\||\<Delta\><rsub|M>|\|>|1-\<rho\><rsub|\<ast\>>>=<frac|<around|\||\<Delta\><rsub|M>|\|><rsup|2>|<around|\||\<Delta\><rsub|M-1>|\|>-<around|\||\<Delta\><rsub|M>|\|>>
    </equation>

    giving<nbsp><eqref|eq:error_bound>.
  </proof>

  <subsection|Global convergence on the positive real axis>

  <\theorem>
    [de Montessus de Ballore <cite|baker1996|montessus1902>]<label|thm:dMdB>
    Let <math|g> be meromorphic in <math|<around|{|<around|\||z|\|>\<less\>\<rho\>|}>>
    with exactly <math|n> poles (counted with multiplicity) in that disc and
    no poles on the boundary. The diagonal Padé approximants <math|R<rsub|M>>
    of order <math|<around|(|M,M|)>> converge to <math|g> uniformly on
    compact subsets of <math|<around|{|<around|\||z|\|>\<less\>\<rho\>|}>\<setminus\><around|{|<text|poles>|}>>
    as <math|M\<to\>\<infty\>>.
  </theorem>

  <\theorem>
    [Nuttall\UPommerenke <cite|baker1996|nuttall1970>]<label|thm:NP> Let
    <math|g> be meromorphic in <math|<C>> with at most countably many poles
    having no finite accumulation point. The diagonal sequence
    <math|R<rsub|M>> converges to <math|g> <em|in capacity> on
    <math|<C>\<setminus\>E>, where <math|E> has logarithmic capacity zero. In
    particular, convergence is quasi-everywhere, though not necessarily
    pointwise at every individual point.
  </theorem>

  <\remark>
    [Which theorem applies]<label|rem:which_thm>
    <localize|Theorem><nbsp><reference|thm:dMdB> gives <em|pointwise> uniform
    convergence on compacta but requires knowing the exact pole count.
    <localize|Theorem><nbsp><reference|thm:NP> requires no such count but
    yields only quasi-everywhere convergence, and presupposes meromorphy on
    all of <math|<C>>. When <math|g<around|(|z|)>=y<around|(|z<rsup|1/\<mu\>>|)>>
    is meromorphic in <math|<C>> with no poles on
    <math|<around|(|0,\<infty\>|)>> \V the canonical case for globally
    bounded Riccati solutions on the real time axis \V both theorems apply,
    and <math|R<rsub|M><around|(|t<rsup|\<mu\>>|)>\<to\>y<around|(|t|)>> for
    every <math|t\<gtr\>0>.
  </remark>

  <\theorem>
    [Global Padé\UMüntz representation]<label|thm:pade_riccati> Let
    <math|y<around|(|t|)>> solve <eqref|eq:frac_riccati>, assume <math|y> is
    bounded on <math|<around|[|0,\<infty\>|)>> (so that
    <math|g<around|(|z|)>> has no poles on the positive real <math|z>-axis),
    and assume that <math|g<around|(|z|)>\<assign\>y<around|(|z<rsup|1/\<mu\>>|)>>
    admits a meromorphic continuation to <math|<C>> with at most countably
    many poles having no finite accumulation point. Then

    <\equation>
      <label|eq:y_global_pade><space|0.17em>y<around|(|t|)>=lim<rsub|M\<to\>\<infty\>>
      R<rsub|M><around|(|t<rsup|\<mu\>>|)>=lim<rsub|M\<to\>\<infty\>>
      <frac|P<rsub|M><around|(|t<rsup|\<mu\>>|)>|Q<rsub|M><around|(|t<rsup|\<mu\>>|)>>*<space|1em><text|\<forall\>>t\<ge\>0
    </equation>
  </theorem>

  <\proof>
    Under the meromorphy hypothesis, <localize|Theorem><nbsp><reference|thm:NP>
    applies and <math|R<rsub|M>\<to\>g> in capacity on
    <math|<C>\<setminus\>E> with <math|<math-up|cap><around|(|E|)>=0>. Since
    <math|g> is holomorphic on a neighbourhood of every point of
    <math|<around|(|0,\<infty\>|)>> (by the no-positive-pole hypothesis), and
    meromorphic on every disc <math|<around|{|<around|\||z|\|>\<less\>\<rho\>|}>>
    with finitely many poles in that disc,
    <localize|Theorem><nbsp><reference|thm:dMdB> gives uniform convergence on
    compact subsets of <math|<C>\<setminus\><around|{|<text|poles>|}>>; in
    particular pointwise convergence at every
    <math|z=t<rsup|\<mu\>>\<in\><around|(|0,\<infty\>|)>>. At <math|t=0>,
    <math|y<around|(|0|)>=0> and <math|R<rsub|M><around|(|0|)>=p<rsub|0>/Q<rsub|M><around|(|0|)>=0/1=0>
    for every <math|M>, so the limit holds trivially.
  </proof>

  <\remark>
    [Status of the meromorphy hypothesis]<label|rem:meromorphy> Meromorphy of
    <math|g> on <math|<C>> is established for <math|\<mu\>=1> (where the
    linearization <math|y=-w<rprime|'>/<around|(|c<rsub|2>*w|)>> reduces the
    Riccati equation to a linear ODE with entire solutions) and is
    conjectured for <math|\<mu\>\<in\><around|(|0,1|)>> on the basis of the
    Painlevé property of the underlying flow and the empirical pole
    distribution of the diagonal Padé sequence. A complete proof for
    arbitrary <math|\<mu\>\<in\><around|(|0,1|)>> lies outside the scope of
    the present paper and is connected to the Riemann\UHilbert structure
    discussed in <localize|Section><nbsp><reference|sec:resurgence>. In
    practical computation, the hypothesis is verified a<nbsp>posteriori by
    the convergence behavior of <math|R<rsub|M><around|(|t<rsup|\<mu\>>|)>>
    at probe points <math|t> of interest, controlled by the
    bound<nbsp><eqref|eq:error_bound>.
  </remark>

  <subsection|Algorithmic summary>

  Given <math|<around|(|c<rsub|0>,c<rsub|1>,c<rsub|2>,\<mu\>|)>> and Padé
  order <math|M>:

  <\enumerate>
    <item>Compute the Puiseux coefficients
    <math|a<rsub|1>,\<ldots\>,a<rsub|2*M>> by the recurrence
    <eqref|eq:a1_const>\U<eqref|eq:ak_const>. Cost:
    <math|\<cal-O\><around|(|M<rsup|2>|)>>.

    <item>Form the Hankel matrix <math|H<rsub|M>> and right-hand side
    <math|\<b-b\>> from <eqref|eq:hankel_system>.

    <item>Solve <math|H<rsub|M>*\<b-q\>=-\<b-b\>> for the denominator
    coefficients. Cost: <math|\<cal-O\><around|(|M<rsup|3>|)>>.

    <item>Recover the numerator coefficients via <eqref|eq:Pade1>.

    <item>Evaluate <math|y<rsub|M><around|(|t|)>=<frac|P<rsub|M><around|(|t<rsup|\<mu\>>|)>|Q<rsub|M><around|(|t<rsup|\<mu\>>|)>>>
    at any <math|t\<ge\>0>. Cost: <math|\<cal-O\><around|(|M|)>> per query
  </enumerate>

  Steps 1\U4 are independent of <math|t>; the entire family
  <math|<around|{|y<rsub|M><around|(|t|)>:t\<ge\>0|}>> is encoded in a single
  rational function in <math|z=t<rsup|\<mu\>>>. There is no grid, no time
  stepping, no Newton iteration, no fixed-point loop.

  \;

  <\thebibliography|9>
    <bibitem|eleuch2019>O.<nbsp>El<nbsp>Euch and M.<nbsp>Rosenbaum, <em|The
    characteristic function of rough Heston models>, Mathematical Finance,
    29(1):3\U38, 2019.

    <bibitem|baker1996>G.<space|0.17em>A.<nbsp>Baker and
    P.<nbsp>Graves-Morris, <em|Padé Approximants>, 2nd ed., Cambridge
    University Press, 1996.

    <bibitem|esmaeili2015>S.<nbsp>Esmaeili and M.<nbsp>Shamsi, <em|The
    Müntz\ULegendre Tau method for fractional differential equations>,
    Applied Mathematical Modelling, 40(2):671\U684, 2015.

    <bibitem|montessus1902>R.<nbsp>de<nbsp>Montessus de<nbsp>Ballore, <em|Sur
    les fractions continues algébriques>, Bull. Soc. Math. France, 30:28\U36,
    1902.

    <bibitem|nuttall1970>J.<nbsp>Nuttall, <em|The convergence of Padé
    approximants of meromorphic functions>, J. Math. Anal. Appl.,
    31(1):147\U153, 1970.

    <bibitem|pommerenke1973>Ch.<nbsp>Pommerenke, <em|Padé approximants and
    convergence in capacity>, J. Math. Anal. Appl., 41:775\U780, 1973.

    <bibitem|stahl1997>H.<nbsp>Stahl, <em|The convergence of Padé
    approximants to functions with branch points>, J. Approx. Theory,
    91:139\U204, 1997.

    <bibitem|ecalle1981>J.<nbsp>Écalle, <em|Les fonctions résurgentes>, Vols.
    I\UIII, Publ. Math. d'Orsay, 1981\U1985.

    <bibitem|costin2008>O.<nbsp>Costin, <em|Asymptotics and Borel
    Summability>, Chapman & Hall/CRC, 2008.

    <bibitem|deift1999>P.<nbsp>Deift, <em|Orthogonal Polynomials and Random
    Matrices: A Riemann\UHilbert Approach>, Courant Lecture Notes 3, AMS,
    1999.

    <bibitem|callegaro2021>G.<nbsp>Callegaro, M.<nbsp>Grasselli, and
    G.<nbsp>Pagès, <em|Fast hybrid schemes for fractional Riccati equations
    (rough is not so tough)>, Mathematics of Operations Research,
    46(1):221\U254, 2021.

    <bibitem|gatheral2019>J.<nbsp>Gatheral and R.<nbsp>Radoi£i¢, <em|Rational
    approximation of the rough Heston solution>, International Journal of
    Theoretical and Applied Finance, 22(3):1950010, 2019.
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
    <associate|ass:diff_bound|<tuple|18|11>>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|3.3|12>>
    <associate|auto-11|<tuple|3.4|13>>
    <associate|auto-12|<tuple|5|13>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|4>>
    <associate|auto-4|<tuple|2|5>>
    <associate|auto-5|<tuple|2.1|5>>
    <associate|auto-6|<tuple|19|5>>
    <associate|auto-7|<tuple|3|9>>
    <associate|auto-8|<tuple|3.1|9>>
    <associate|auto-9|<tuple|3.2|11>>
    <associate|bib-baker1996|<tuple|baker1996|13>>
    <associate|bib-callegaro2021|<tuple|callegaro2021|14>>
    <associate|bib-costin2008|<tuple|costin2008|14>>
    <associate|bib-deift1999|<tuple|deift1999|14>>
    <associate|bib-ecalle1981|<tuple|ecalle1981|13>>
    <associate|bib-eleuch2019|<tuple|eleuch2019|13>>
    <associate|bib-esmaeili2015|<tuple|esmaeili2015|13>>
    <associate|bib-gatheral2019|<tuple|gatheral2019|14>>
    <associate|bib-montessus1902|<tuple|montessus1902|13>>
    <associate|bib-nuttall1970|<tuple|nuttall1970|13>>
    <associate|bib-pommerenke1973|<tuple|pommerenke1973|13>>
    <associate|bib-stahl1997|<tuple|stahl1997|13>>
    <associate|def:Caputo|<tuple|2|2>>
    <associate|def:D_M|<tuple|17|10>>
    <associate|def:RL|<tuple|1|2>>
    <associate|def:muntz|<tuple|6|4>>
    <associate|eq:Delta_def|<tuple|57|11>>
    <associate|eq:Dmu_Muntz|<tuple|13|4>>
    <associate|eq:Dmu_power|<tuple|6|3>>
    <associate|eq:Ir_Muntz|<tuple|14|4>>
    <associate|eq:Ir_power|<tuple|5|3>>
    <associate|eq:Pade1|<tuple|49|10>>
    <associate|eq:Pade2|<tuple|50|10>>
    <associate|eq:Pade_match|<tuple|48|9>>
    <associate|eq:RL_int|<tuple|1|2>>
    <associate|eq:R_M_def|<tuple|54|10>>
    <associate|eq:T0_choice|<tuple|31|7>>
    <associate|eq:a1_const|<tuple|21|5>>
    <associate|eq:ak_const|<tuple|22|5>>
    <associate|eq:caputo|<tuple|2|2>>
    <associate|eq:caputo_RL|<tuple|3|2>>
    <associate|eq:cauchy_bound|<tuple|35|7>>
    <associate|eq:eps_g|<tuple|55|11>>
    <associate|eq:eps_structure|<tuple|56|11>>
    <associate|eq:error_bound|<tuple|59|11>>
    <associate|eq:error_bound_uniform|<tuple|58|11>>
    <associate|eq:frac_riccati|<tuple|16|5>>
    <associate|eq:frac_riccati_V|<tuple|18|5>>
    <associate|eq:g_series|<tuple|46|9>>
    <associate|eq:hankel_system|<tuple|51|10>>
    <associate|eq:prod_Muntz|<tuple|15|4>>
    <associate|eq:y_global_pade|<tuple|66|12>>
    <associate|eq:y_series|<tuple|20|5>>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnr-1|<tuple|1|1>>
    <associate|lem:Pade_system|<tuple|16|10>>
    <associate|lem:hankel|<tuple|14|10>>
    <associate|prop:closure_M|<tuple|8|4>>
    <associate|prop:powers|<tuple|4|3>>
    <associate|rem:Dmu_const|<tuple|5|4>>
    <associate|rem:HM_invertible|<tuple|15|10>>
    <associate|rem:conv_k1|<tuple|11|5>>
    <associate|rem:correction|<tuple|3|2>>
    <associate|rem:meromorphy|<tuple|24|13>>
    <associate|rem:muntz_complete|<tuple|7|4>>
    <associate|rem:radius_local|<tuple|13|9>>
    <associate|rem:regularity|<tuple|9|5>>
    <associate|rem:which_thm|<tuple|22|12>>
    <associate|sec:pade|<tuple|3|9>>
    <associate|sec:prelim|<tuple|1|2>>
    <associate|sec:riccati|<tuple|2|5>>
    <associate|thm:NP|<tuple|21|12>>
    <associate|thm:dMdB|<tuple|20|12>>
    <associate|thm:error|<tuple|19|11>>
    <associate|thm:pade_riccati|<tuple|23|12>>
    <associate|thm:radius|<tuple|12|7>>
    <associate|thm:riccati_series|<tuple|10|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      esmaeili2015

      baker1996

      baker1996

      montessus1902

      baker1996

      nuttall1970
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Fractional
      Calculus and the Müntz Basis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Riemann\ULiouville integral
      and Caputo derivative <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>The Müntz basis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Constant-Coefficient Fractional Riccati Equation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Equation and Volterra
      representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|The Müntz\UTau Puiseux series solution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Padé
      Resummation in <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|z=t<rsup|\<mu\>>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Power series in
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|z>>
      and the Hankel system <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Remainder representation and
      successive-difference bound <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Global convergence on the
      positive real axis <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Algorithmic summary
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>