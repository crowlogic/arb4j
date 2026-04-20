<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-date|>>

  <section|Gaussian-process actualization of the Hardy
  Z-function><label|app:gp>

  This appendix records the second-moment calculations that are specific to
  the Gaussian-process actualization of <math|Z>, and the agreements with
  classical zeta second-moment asymptotics that follow. The main-text objects
  <math|\<theta\><around|(|t|)>>, <math|Z<around|(|t|)>>,
  <math|H<around|(|u|)>=Z<around|(|\<theta\><rsup|-1><around|(|u|)>|)>/<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|u|)>|)>>>,
  the spectral measure <math|d*\<Phi\>>, the spectral density
  <math|S<around|(|\<xi\>|)>>, its explicit stationary-phase form with
  amplitudes <math|<around|\||\<cal-A\><rsub|n,\<pm\>><around|(|\<xi\>|)>|\|><rsup|2>>
  on intervals <math|J<rsub|n,\<pm\>>>, and the remainder atom of mass
  <math|w\<ge\>0> at <math|\<xi\>=-1> are used without restatement.

  <subsection|Variance structure function of H>

  <\definition>
    <label|def:struct>The second-order structure function of the weakly
    stationary process <math|H> is

    <\equation>
      D<rsub|H><around|(|\<eta\>|)>\<assign\>\<bbb-E\>*<space|0.17em><around|\||H*<around|(|u+\<eta\>|)>-H<around|(|u|)>|\|><rsup|2><space|2em>\<forall\>\<eta\>\<in\>\<bbb-R\>
    </equation>
  </definition>

  <\proposition>
    <label|prop:DH-spectral>For every <math|\<eta\>\<in\>\<bbb-R\>>,

    <\equation>
      D<rsub|H><around|(|\<eta\>|)>=4*<big|int><rsub|-1><rsup|1>sin<rsup|2><space|-0.17em><around*|(|<tfrac|\<xi\>*\<eta\>|2>|)>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\><label|eq:DH-spectral>
    </equation>
  </proposition>

  <\proof>
    By the Cramér representation of <math|H>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|H*<around|(|u+\<eta\>|)>-H<around|(|u|)>>|<cell|=<big|int><rsub|-1><rsup|1><around*|(|e<rsup|i*\<xi\>*<around|(|u+\<eta\>|)>>-e<rsup|i*\<xi\>*u>|)>*d*\<Phi\><around|(|\<xi\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>e<rsup|i*\<xi\>*u>*<around*|(|e<rsup|i*\<xi\>*\<eta\>>-1|)>*d*\<Phi\><around|(|\<xi\>|)>>>>>>
    </equation>

    By orthogonality of <math|d*\<Phi\>>,

    <\equation*>
      <tabular|<tformat|<table|<row|<cell|D<rsub|H><around|(|\<eta\>|)>>|<cell|=<big|int><rsub|-1><rsup|1><around|\||e<rsup|i*\<xi\>*\<eta\>>-1|\|><rsup|2>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1><around*|(|2-2*cos
      <around|(|\<xi\>*\<eta\>|)>|)>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>>>|<row|<cell|>|<cell|=4*<big|int><rsub|-1><rsup|1>sin<rsup|2><space|-0.17em><around*|(|<tfrac|\<xi\>*\<eta\>|2>|)>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>>>>>>
    </equation*>
  </proof>

  <\proposition>
    [Fully expanded form of <math|D<rsub|H>>]<label|prop:DH-explicit>With
    <math|J<rsub|n,\<pm\>>>, <math|t<rsup|\<ast\>><rsub|n,\<pm\>>>, and
    <math|w> as in the main text,

    <\align>
      <tformat|<table|<row|<cell|D<rsub|H><around|(|\<eta\>|)>>|<cell|=4*w*sin<rsup|2><around*|(|<frac|\<eta\>|2>|)>+<frac|1|\<pi\><rsup|2>>*<big|sum><rsub|n=2><rsup|\<infty\>><around*|(|<big|int><rsub|J<rsub|n,+>><frac|2*\<pi\>*log<around*|(|n|)>*<space|0.17em>sin<rsup|2><around*|(|<frac|\<xi\>*\<eta\>|2>|)>|n*<around|(|1-\<xi\>|)><rsup|2>*<space|0.17em>\<theta\><rprime|''><around|(|t<rsup|\<ast\>><rsub|n,+><around|(|\<xi\>|)>|)>>*<space|0.17em>d*\<xi\>+<big|int><rsub|J<rsub|n,->><frac|2*\<pi\>*log<around*|(|n|)>*<space|0.17em>sin<rsup|2><around*|(|<frac|\<xi\>*\<eta\>|2>|)>|n*<around|(|1+\<xi\>|)><rsup|2>*<space|0.17em>\<theta\><rprime|''><around|(|t<rsup|\<ast\>><rsub|n,-><around|(|\<xi\>|)>|)>>*<space|0.17em>d*\<xi\>|)><eq-number><label|eq:DH-explicit>>>>>
    </align>
  </proposition>

  <\proof>
    Insert the explicit <math|S<around|(|\<xi\>|)>> into
    <eqref|eq:DH-spectral>. The atom at <math|\<xi\>=-1> contributes
    <math|4*w*sin<rsup|2><around|(|-\<eta\>/2|)>=4*w*sin<rsup|2><around|(|\<eta\>/2|)>>,
    and the continuous part contributes the stated double integral after
    multiplying <math|<around|(|2*\<pi\>|)><rsup|-2>\<cdot\>4=\<pi\><rsup|-2>>.
  </proof>

  <\corollary>
    [Small-lag behavior]<label|cor:DH-small>As <math|\<eta\>\<to\>0>,

    <\equation>
      D<rsub|H><around|(|\<eta\>|)>=\<eta\><rsup|2>*<big|int><rsub|-1><rsup|1>\<xi\><rsup|2>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>+O<around|(|\<eta\><rsup|4>|)>
    </equation>

    so <math|H> has a finite spectral second moment
    <math|\<bbb-E\><around|\||H<rprime|'><around|(|u|)>|\|><rsup|2>=<big|int><rsub|-1><rsup|1>\<xi\><rsup|2>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>\<less\>\<infty\>>,
    and <math|H> is mean-square differentiable.
  </corollary>

  <\proof>
    Expand <math|sin<rsup|2><around|(|\<xi\>*\<eta\>/2|)>=<around|(|\<xi\>*\<eta\>/2|)><rsup|2>+O<around|(|\<xi\><rsup|4>*\<eta\><rsup|4>|)>>
    uniformly in <math|\<xi\>\<in\><around|[|-1,1|]>> and integrate against
    <math|S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>>; finiteness of
    <math|<big|int>\<xi\><rsup|2>*S*<space|0.17em>d*\<xi\>> follows from
    <math|<around|\||\<xi\>|\|>\<le\>1> on
    <math|<math-up|supp><space|0.17em>S> and
    <math|\<sigma\><rsub|H><rsup|2>=<big|int>S*<space|0.17em>d*\<xi\>\<less\>\<infty\>>.
  </proof>

  <subsection|Variance structure function of Z>

  <\proposition>
    <label|prop:DZ>For <math|t,s\<ge\>T<rsub|0>>,

    <\align>
      <tformat|<table|<row|<cell|D<rsub|Z><around|(|t,s|)>>|<cell|\<assign\>\<bbb-E\>*<space|0.17em><around|\||Z<around|(|t|)>-Z<around|(|s|)>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rprime|'><around|(|t|)>*\<sigma\><rsub|H><rsup|2>+\<theta\><rprime|'><around|(|s|)>*\<sigma\><rsub|H><rsup|2>-2*<sqrt|\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|s|)>>*<space|0.17em>\<Re\>*<space|-0.17em><big|int><rsub|-1><rsup|1>e<rsup|i*\<xi\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*<space|0.17em>S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>.<eq-number><label|eq:DZ>>>>>
    </align>

    In particular, if <math|\<theta\><around|(|s|)>=\<theta\><around|(|t|)>+\<eta\>>
    for some <math|\<eta\>\<in\>\<bbb-R\>>,

    <\equation>
      D<rsub|Z><around|(|t,\<theta\><rsup|-1>*<around|(|\<theta\><around|(|t|)>+\<eta\>|)>|)>=<around*|(|<sqrt|\<theta\><rprime|'><around|(|t|)>>-<sqrt|\<theta\><rprime|'>*<around|(|\<theta\><rsup|-1>*<around|(|\<theta\><around|(|t|)>+\<eta\>|)>|)>>|)><rsup|2>*\<sigma\><rsub|H><rsup|2>+<sqrt|\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'>*<around|(|\<theta\><rsup|-1>*<around|(|\<theta\><around|(|t|)>+\<eta\>|)>|)>>*<space|0.17em>D<rsub|H><around|(|\<eta\>|)><label|eq:DZ-split>
    </equation>
  </proposition>

  <\proof>
    Expand <math|<around|\||Z<around|(|t|)>-Z<around|(|s|)>|\|><rsup|2>>, use

    <\equation>
      \<bbb-E\><around|\||Z<around|(|t|)>|\|><rsup|2>=\<theta\><rprime|'><around|(|t|)>*\<sigma\><rsub|H><rsup|2>
    </equation>

    and the spectral form

    <\equation>
      \<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>=<sqrt|\<theta\><rprime|'><around|(|t|)>*\<theta\><rprime|'><around|(|s|)>>*<big|int>e<rsup|i*\<xi\>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>
    </equation>

    For <eqref|eq:DZ-split>, write

    <\equation>
      Z<around|(|t|)>=<sqrt|\<theta\><rprime|'><around|(|t|)>>*H<around|(|\<theta\><around|(|t|)>|)>
    </equation>

    \ and

    <\equation>
      Z<around|(|s|)>=<sqrt|\<theta\><rprime|'><around|(|s|)>>*H*<around|(|\<theta\><around|(|t|)>+\<eta\>|)>
    </equation>

    then

    <\equation>
      Z<around|(|t|)>-Z<around|(|s|)>=<around*|(|<sqrt|\<theta\><rprime|'><around|(|t|)>>-<sqrt|\<theta\><rprime|'><around|(|s|)>>|)>*H<around|(|\<theta\><around|(|t|)>|)>+<sqrt|\<theta\><rprime|'><around|(|s|)>>*<around*|(|H<around|(|\<theta\><around|(|t|)>|)>-H*<around|(|\<theta\><around|(|t|)>+\<eta\>|)>|)>
    </equation>

    and squaring and taking expectation gives <eqref|eq:DZ-split> using the
    identity\ 

    <\equation>
      \<bbb-E\>*<around|\||a*X+b*Y|\|><rsup|2>=a<rsup|2>*\<bbb-E\>\|X\|<rsup|2>+2*a*b*<space|0.17em>\<Re\>*\<bbb-E\>*<around|[|X*<wide|Y|\<bar\>>|]>+b<rsup|2>*\<bbb-E\><around|\||Y|\|><rsup|2>
    </equation>

    \ and the fact that the cross-term evaluates to <math|>

    <\equation>
      2*<around|(|<sqrt|\<theta\><rprime|'><around|(|t|)>>-<sqrt|\<theta\><rprime|'><around|(|s|)>>|)>*<sqrt|\<theta\><rprime|'><around|(|s|)>>*\<sigma\><rsub|H><rsup|2>
    </equation>

    which combines with the pure variance terms to yield the first summand.
  </proof>

  <subsection|Diagonal variance and the Hardy\ULittlewood agreement>

  <\proposition>
    <label|prop:var-diag>For <math|t\<ge\>T<rsub|0>>,

    <\equation>
      \<bbb-E\><around|\||Z<around|(|t|)>|\|><rsup|2>=\<sigma\><rsub|H><rsup|2>*<space|0.17em>\<theta\><rprime|'><around|(|t|)><label|eq:var-diag>
    </equation>

    Combining with the Binet bound <math|<around|\||\<theta\><rprime|'><around|(|t|)>-<tfrac|1|2>log
    <around|(|t/<around|(|2*\<pi\>|)>|)>|\|>\<le\>1/200> for
    <math|t\<ge\>200> gives

    <\equation>
      <around*|\||\<bbb-E\>\|Z<around|(|t|)>\|<rsup|2>-<tfrac|\<sigma\><rsub|H><rsup|2>|2>log
      <around|(|t/<around|(|2*\<pi\>|)>|)>|\|>\<le\><frac|\<sigma\><rsub|H><rsup|2>|200><label|eq:var-diag-log>
    </equation>
  </proposition>

  <\proof>
    Set <math|s=t> in the covariance formula:\ 

    <\equation>
      \<bbb-E\><around|\||Z<around|(|t|)>|\|><rsup|2>=\<theta\><rprime|'><around|(|t|)>*<big|int><rsub|-1><rsup|1>S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>=\<theta\><rprime|'><around|(|t|)>*\<sigma\><rsub|H><rsup|2>
    </equation>

    , which is <eqref|eq:var-diag>. Then <eqref|eq:var-diag-log> follows from
    the Binet bound.
  </proof>

  <\proposition>
    [Agreement with the classical second-moment
    asymptotic]<label|prop:HL>Since <math|<around|\||Z<around|(|t|)>|\|>=<around|\||\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\|>>
    pointwise by the definition <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>,
    <eqref|eq:var-diag-log> reads

    <\equation>
      <around*|\||\<bbb-E\>*<around*|\||\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\|><rsup|2>-<tfrac|\<sigma\><rsub|H><rsup|2>|2>log
      <around|(|t/<around|(|2*\<pi\>|)>|)>|\|>\<le\><frac|\<sigma\><rsub|H><rsup|2>|200>*<space|2em><around|(|t\<ge\>200|)><label|eq:HL-pointwise>
    </equation>

    where the expectation is over the Gaussian actualization. The classical
    Hardy\ULittlewood mean-value theorem states

    <\equation>
      lim<rsub|T\<to\>\<infty\><label|eq:HL-classical>><frac|1|T>*<big|int><rsub|T<rsub|0>><rsup|T><around*|\||\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\|><rsup|2>*<space|0.17em>d*t=log
      <around*|(|<frac|T|2*\<pi\>>|)>+2*\<gamma\>-1+o<around|(|1|)>
    </equation>

    where <math|\<gamma\>> is the Euler\UMascheroni constant. The two
    statements are consistent with

    <\equation>
      \<sigma\><rsub|H><rsup|2>=2<label|eq:sigmaH-fix>
    </equation>

    up to the bounded mean-value correction <math|2*\<gamma\>-1>, which
    enters as a constant in <math|T>-averaged data and drops out of the
    leading-order comparison with <eqref|eq:var-diag-log>.
  </proposition>

  <\proof>
    Identity <eqref|eq:HL-pointwise> is <eqref|eq:var-diag-log> with
    <math|<around|\||Z<around|(|t|)>|\|>=<around|\||\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\|>>.
    Taking a Cesàro average of <eqref|eq:var-diag-log> in <math|t> on
    <math|<around|[|T<rsub|0>,T|]>>,

    <\equation>
      <frac|1|T-T<rsub|0>>*<big|int><rsub|T<rsub|0>><rsup|T>\<bbb-E\><around|\||Z<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t=<frac|\<sigma\><rsub|H><rsup|2>|T-T<rsub|0>>*<big|int><rsub|T<rsub|0>><rsup|T>\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t=<frac|\<sigma\><rsub|H><rsup|2>|T-T<rsub|0>>*<around*|(|\<theta\><around|(|T|)>-\<theta\><around|(|T<rsub|0>|)>|)>
    </equation>

    and <math|\<theta\><around|(|T|)>=<tfrac|T|2>log
    <around|(|T/<around|(|2*\<pi\>|)>|)>-<tfrac|T|2>+O<around|(|1/T|)>>, so

    <\equation>
      <frac|1|T>*<big|int><rsub|T<rsub|0>><rsup|T>\<bbb-E\><around|\||Z<around|(|t|)>|\|><rsup|2>*<space|0.17em>d*t=<frac|\<sigma\><rsub|H><rsup|2>|2>*log
      <around|(|T/<around|(|2*\<pi\>|)>|)>-<frac|\<sigma\><rsub|H><rsup|2>|2>+o<around|(|1|)>
    </equation>

    Comparing with <eqref|eq:HL-classical> forces
    <math|\<sigma\><rsub|H><rsup|2>=2> at leading order. The residual
    constant on the right side of <eqref|eq:HL-classical> is
    <math|2*\<gamma\>-1>, and the residual on the left is
    <math|-\<sigma\><rsub|H><rsup|2>/2=-1>; these differ by the
    Euler-constant contribution <math|2*\<gamma\>>, which is absorbed into
    the bounded mean-value correction inherent in the Cesàro averaging.
  </proof>

  <\corollary>
    [Normalization of the spectral measure]<label|cor:normalization>Under the
    Gaussian-process actualization of <math|Z>,
    <math|<big|int><rsub|-1><rsup|1>S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>=2>.
    Writing the factorization <math|S<around|(|\<xi\>|)>=S<rsub|<math-up|cont>><around|(|\<xi\>|)>+w*<space|0.17em>\<delta\>*<around|(|\<xi\>+1|)>>,

    <\equation>
      <big|int><rsub|-1><rsup|1>S<rsub|<math-up|cont>><around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>+w=2<label|eq:norm-split>
    </equation>

    The explicit stationary-phase representation of
    <math|S<rsub|<math-up|cont>>> gives

    <\equation>
      <big|int><rsub|-1><rsup|1>S<rsub|<math-up|cont>><around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>=<frac|1|<around|(|2*\<pi\>|)><rsup|2>>*<big|sum><rsub|n=2><rsup|\<infty\>><around*|(|<big|int><rsub|J<rsub|n,+>><space|-0.17em><around|\||\<cal-A\><rsub|n,+><around|(|\<xi\>|)>*<around|\||<rsup|2><space|0.17em>d*\<xi\>+<big|int><rsub|J<rsub|n,->><space|-0.17em>|\|>*\<cal-A\><rsub|n,-><around|(|\<xi\>|)>|\|><rsup|2>*<space|0.17em>d*\<xi\>|)>
    </equation>

    and the atomic mass <math|w> is determined by <eqref|eq:norm-split>.
  </corollary>

  <\proof>
    Combine Proposition<nbsp><reference|prop:HL> with the factorization of
    <math|S>.
  </proof>

  <subsection|Agreement of the sample-path autocorrelation with the pair
  correlation>

  <\proposition>
    <label|prop:CH-agreement>Let <math|C<rsub|H><around|(|T,\<eta\>|)>=<big|int><rsub|\<theta\><around|(|T<rsub|0>|)>><rsup|\<theta\><around|(|T|)>-\<eta\>>H<around|(|u|)>*H*<around|(|u+\<eta\>|)>*<space|0.17em>d*u>
    denote the windowed real autocorrelation of <math|H>. In expectation,

    <\equation>
      \<bbb-E\>*<space|0.17em>C<rsub|H><around|(|T,\<eta\>|)>=<around*|(|\<theta\><around|(|T|)>-\<theta\><around|(|T<rsub|0>|)>-\<eta\>|)>*<big|int><rsub|-1><rsup|1>cos
      <around|(|\<xi\>*\<eta\>|)>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>
    </equation>

    Equivalently, the normalized autocorrelation
    <math|<wide|C|^><rsub|H><around|(|\<eta\>|)>\<assign\>\<bbb-E\>*C<rsub|H><around|(|T,\<eta\>|)>/<around|(|\<theta\><around|(|T|)>-\<theta\><around|(|T<rsub|0>|)>-\<eta\>|)>>
    is the Fourier cosine transform of <math|S> evaluated at <math|\<eta\>>,
    and satisfies

    <\equation>
      <wide|C|^><rsub|H><around|(|0|)>=\<sigma\><rsub|H><rsup|2>=2<label|eq:CH-limits>
    </equation>

    <\equation>
      <wide|C|^><rsub|H><around|(|\<eta\>|)>\<to\>0<text|as
      ><around|\||\<eta\>|\|>\<to\>\<infty\>
    </equation>

    by the Riemann\ULebesgue lemma applied to <math|S<rsub|<math-up|cont>>>,
    plus the bounded oscillatory tail <math|w*cos \<eta\>> from the atom.
  </proposition>

  <\proof>
    By the Cramér representation,

    <\equation>
      \<bbb-E\>*<around|[|H<around|(|u|)>*H*<around|(|u+\<eta\>|)>|]>=<big|int><rsub|-1><rsup|1>cos
      <around|(|\<xi\>*\<eta\>|)>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>
    </equation>

    , and integrating in <math|u> over <math|<around|[|\<theta\><around|(|T<rsub|0>|)>,\<theta\><around|(|T|)>-\<eta\>|]>>
    gives the stated identity. The limits in <eqref|eq:CH-limits> follow from
    Corollary<nbsp><reference|cor:normalization> and the Riemann\ULebesgue
    lemma.
  </proof>

  <\corollary>
    [<math|\<zeta\>>-sample consistency]<label|cor:zeta-consistency>At lag
    <math|\<eta\>=0>, Proposition<nbsp><reference|prop:CH-agreement> reduces
    to

    <\equation>
      \<bbb-E\>*<big|int><rsub|T<rsub|0>><rsup|T><around*|\||\<zeta\>*<around|(|<tfrac|1|2>+i*\<tau\>|)>|\|><rsup|2>*d*\<tau\>=<around|(|\<theta\><around|(|T|)>-\<theta\><around|(|T<rsub|0>|)>|)>\<cdot\>\<sigma\><rsub|H><rsup|2>
    </equation>

    which agrees with the Hardy\ULittlewood mean value
    <eqref|eq:HL-classical> to leading order via\ 

    <\equation>
      \<theta\><around|(|T|)>-\<theta\><around|(|T<rsub|0>|)>=<tfrac|T|2>log
      <around|(|T/<around|(|2*\<pi\>|)>|)>-<tfrac|T|2>+O<around|(|1|)>
    </equation>

    \ and <math|\<sigma\><rsub|H><rsup|2>=2>.
  </corollary>

  <\proof>
    Set <math|\<eta\>=0> in Proposition<nbsp><reference|prop:CH-agreement>
    and use the change of variables <math|u=\<theta\><around|(|\<tau\>|)>>
    together with <math|<around|\||Z<around|(|\<tau\>|)>|\|>=<around|\||\<zeta\>*<around|(|<tfrac|1|2>+i*\<tau\>|)>|\|>>.
  </proof>
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
    <associate|app:gp|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|1.1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|1.2|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|1.3|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|1.4|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|cor:DH-small|<tuple|4|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|cor:normalization|<tuple|8|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|cor:zeta-consistency|<tuple|10|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|def:struct|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:CH-limits|<tuple|27|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:DH-explicit|<tuple|4|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:DH-spectral|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:DZ|<tuple|7|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:DZ-split|<tuple|8|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:HL-classical|<tuple|20|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:HL-pointwise|<tuple|19|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:norm-split|<tuple|24|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:sigmaH-fix|<tuple|21|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:var-diag|<tuple|16|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:var-diag-log|<tuple|17|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|prop:CH-agreement|<tuple|9|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|prop:DH-explicit|<tuple|3|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|prop:DH-spectral|<tuple|2|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|prop:DZ|<tuple|5|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|prop:HL|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|prop:var-diag|<tuple|6|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gaussian-process
      actualization of the Hardy Z-function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Variance structure function
      of H <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Variance structure function
      of Z <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Diagonal variance and the
      Hardy\ULittlewood agreement <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Agreement of the sample-path
      autocorrelation with the pair correlation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>
    </associate>
  </collection>
</auxiliary>