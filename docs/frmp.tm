<TeXmacs|2.1.5>

<style|<tuple|article|alt-colors|framed-theorems>>

<\body>
  <\hide-preamble>
    <assign|C|<macro|\<bbb-C\>>>

    <assign|R|<macro|\<bbb-R\>>>

    <assign|Imu|<macro|I<rsup|\<mu\>>>>

    <assign|Ico|<macro|I<rsup|1-\<mu\>>>>

    <assign|Fc|<macro|\<cal-F\>>>

    <assign|Mc|<macro|\<cal-M\>>>

    <assign|Pc|<macro|\<cal-P\>>>

    <assign|Real|<macro|Re>>

    <assign|Imag|<macro|Im>>

    <assign|sgn|<macro|sgn>>
  </hide-preamble>

  <doc-data|<doc-title|The Fractional Riccati--M�ntz--Pad�
  Theorem<next-line><with|font-size|1.19|Closed-Form Density and European
  Call Price under Rough Heston via Fox <math|H>, with COS Pricing as
  Alternative>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|May 2026>>

  <abstract-data|<\abstract>
    Three results are established for the rough Heston model. First
    (Theorem<nbsp><reference|thm:conv>), the diagonal <math|<around|[|M/M|]>>
    Pad� resummation of the local Puiseux series of the cumulant generating
    function converges on every compact subset of the complement of the Stahl
    branch/polar set, including beyond the Puiseux radius of the original
    series, at Stahl rate. The Pad� denominator is the orthogonal polynomial
    of degree <math|M> under the Hankel moment functional, produced directly
    from the M�ntz moments by the Chebyshev algorithm in arbitrary-precision
    arithmetic, equivalent to solving the Hankel system but without matrix
    formation or inversion. Second (Theorems<nbsp><reference|thm:foxH_density>,
    <reference|thm:foxH_price>), both the density of the log-return and the
    European call price admit strictly closed-form representations as finite
    sums of Fox <math|H>-functions in the partial-fraction data of the
    rational characteristic exponent <math|\<Phi\><rsub|M>>, evaluable in
    <math|O<around|(|M*log<rsup|2> M|)>> operations per strike at fixed
    maturity, with the front-end Chebyshev construction at
    <math|O<around|(|M<rsup|2>|)>> per parameter evaluation and the
    partial-fraction expansion at <math|O<around|(|M<rsup|2>|)>> per
    maturity. The price formula is derived by two analytically independent
    routes (convolution chain and Mellin--Barnes inversion) converging on
    identical parameter data. The Pad� characteristic function has Gaussian
    real-axis decay, sharper than the stretched-exponential decay of the
    exact rough Heston cf. Third (Theorem<nbsp><reference|thm:price>), the
    same prices may alternatively be computed by applying the Fang--Oosterlee
    COS method to <math|\<Phi\><rsub|M><around|(|\<cdummy\>,T|)>>, with
    Gaussian-rate truncation error.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Fractional
    calculus and the M�ntz basis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    M�ntz\UTau recurrence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Rough
    Heston cumulant moments> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Pad�
    resummation via the Chebyshev algorithm>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>Moment functional
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|4.2<space|2spc>Three-term recurrence and
    orthogonality <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|4.3<space|2spc>The Chebyshev algorithm
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|4.4<space|2spc>Pad� numerator from associated
    polynomials <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|4.5<space|2spc>Pad� matching
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|4.6<space|2spc>J-fraction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Convergence
    and a-posteriori bound> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Closed-form
    density via Fox <with|color|dark red|font-family|rm|<with|mode|math|H>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Closed-form
    European call price via Fox <with|color|dark
    red|font-family|rm|<with|mode|math|H>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>COS
    pricing as alternative> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>

    <with|par-left|1tab|8.1<space|2spc>Cumulants
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <with|par-left|1tab|8.2<space|2spc>Truncation interval
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <with|par-left|1tab|8.3<space|2spc>Payoff coefficients
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>>

    <with|par-left|1tab|8.4<space|2spc>COS price with Gaussian-rate error
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Algorithm
    and computational summary> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19><vspace|0.5fn>

    <with|par-left|1tab|9.1<space|2spc>Three-tier decomposition
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    <with|par-left|3tab|Tier 0 (per parameter evaluation, per Fourier node).
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21>>

    <with|par-left|3tab|Tier 1 (per maturity <with|color|dark
    red|font-family|rm|<with|mode|math|T>>).
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>>

    <with|par-left|3tab|Tier 2 (per strike <with|color|dark
    red|font-family|rm|<with|mode|math|K>> at fixed <with|color|dark
    red|font-family|rm|<with|mode|math|T>>).
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>>

    <with|par-left|1tab|9.2<space|2spc>Total cost across an <with|color|dark
    red|font-family|rm|<with|mode|math|<around|(|N<rsub|T>,N<rsub|K>|)>>>-surface
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    <with|par-left|1tab|9.3<space|2spc>COS endpoint
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10<space|2spc>Summary>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27><vspace|0.5fn>
  </table-of-contents>

  <section|Fractional calculus and the M�ntz basis><label|sec:fc>

  <\definition>
    [Riemann\ULiouville operators]<label|def:RL> For
    <math|\<mu\>\<in\><around|(|0,1|]>> and <math|f> locally integrable on
    <math|<around|(|0,\<infty\>|)>>,

    <\align>
      <tformat|<table|<row|<cell|<Imu>f<around|(|t|)>>|<cell|\<assign\><frac|1|\<Gamma\><around|(|\<mu\>|)>>*<big|int><rsub|0><rsup|t><around|(|t-s|)><rsup|\<mu\>-1>*f<around|(|s|)>*<space|0.17em>d*s,<eq-number><label|eq:RL_I>>>|<row|<cell|D<rsup|\<mu\>>*f<around|(|t|)>>|<cell|\<assign\><frac|d|d*t><around*|(|<Ico>f|)><around|(|t|)>.<eq-number><label|eq:RL_D>>>>>
    </align>
  </definition>

  <\lemma>
    [Power rule]<label|lem:power> For <math|s\<gtr\>-1> and
    <math|\<alpha\>\<gtr\>0>,

    <\equation>
      <label|eq:power>I<rsup|\<alpha\>>*t<rsup|s>=<frac|\<Gamma\>*<around|(|s+1|)>|\<Gamma\>*<around|(|s+\<alpha\>+1|)>>*<space|0.17em>t<rsup|s+\<alpha\>>.
    </equation>
  </lemma>

  <\proof>
    Substitution <math|\<sigma\>=t*\<tau\>> in <math|I<rsup|\<alpha\>>> gives
    <math|I<rsup|\<alpha\>>*t<rsup|s>=t<rsup|s+\<alpha\>>*B<around|(|\<alpha\>,s+1|)>/\<Gamma\><around|(|\<alpha\>|)>>,
    and <math|B<around|(|\<alpha\>,s+1|)>=\<Gamma\><around|(|\<alpha\>|)>*\<Gamma\>*<around|(|s+1|)>/\<Gamma\>*<around|(|s+\<alpha\>+1|)>>
    gives<nbsp><eqref|eq:power>.
  </proof>

  The M�ntz lattice <math|<around|{|t<rsup|k*\<mu\>>|}><rsub|k\<ge\>0>> is
  closed under <math|<Imu>> by<nbsp><eqref|eq:power> and closed under
  multiplication. In the variable <math|z=t<rsup|\<mu\>>> every element is
  <math|z<rsup|k>>, so ordinary power-series arithmetic applies.

  <section|The M�ntz\UTau recurrence><label|sec:recurrence>

  Define <math|\<gamma\><rsub|k>\<assign\>\<Gamma\>*<around|(|<around|(|k-1|)>*\<mu\>+1|)>/\<Gamma\>*<around|(|k*\<mu\>+1|)>>
  for <math|k\<ge\>1>, so that <math|<Imu>t<rsup|<around|(|k-1|)>*\<mu\>>=\<gamma\><rsub|k>*<space|0.17em>t<rsup|k*\<mu\>>>.

  <\theorem>
    [M�ntz\UTau recurrence]<label|thm:recurrence> The unique formal
    power-series solution of

    <\equation>
      <label|eq:IVP>y=<Imu><around|[|c<rsub|0>+c<rsub|1>*y+c<rsub|2>*y<rsup|2>|]>,<space|2em>y<around|(|0|)>=0,
    </equation>

    is <math|y<around|(|t|)>=<big|sum><rsub|k\<ge\>1>a<rsub|k>*t<rsup|k*\<mu\>>>
    with

    <\align>
      <tformat|<table|<row|<cell|a<rsub|1>>|<cell|=<frac|c<rsub|0>|\<Gamma\>*<around|(|\<mu\>+1|)>>,<eq-number><label|eq:a1>>>|<row|<cell|a<rsub|k>>|<cell|=\<gamma\><rsub|k>*<space|-0.17em><around*|[|c<rsub|1>*<space|0.17em>a<rsub|k-1>+c<rsub|2>*<space|-0.17em><big|sum><rsub|j=1><rsup|k-2>a<rsub|j>*<space|0.17em>a<rsub|k-1-j>|]>,<space|1em>k\<ge\>2.<eq-number><label|eq:ak>>>>>
    </align>
  </theorem>

  <\proof>
    Substitute the ansatz into<nbsp><eqref|eq:IVP> and
    apply<nbsp><eqref|eq:power> termwise. Uniqueness by induction in
    <math|k>.
  </proof>

  <section|Rough Heston cumulant moments><label|sec:cumulant>

  The rough Heston model has parameters <math|\<theta\>,\<lambda\>,\<rho\>,\<nu\>,V<rsub|0>,H\<in\><R>>
  with <math|H\<in\><around|(|0,<tfrac|1|2>|)>> and
  <math|\<mu\>\<assign\>H+<tfrac|1|2>\<in\><around|(|<tfrac|1|2>,1|)>>. The
  log-return characteristic function is <math|\<phi\><rsub|T><around|(|v|)>\<assign\>\<bbb-E\><around|[|e<rsup|i*v*X<rsub|T>>|]>=exp
  <around|(|\<Phi\><around|(|v,T|)>|)>> with <math|X<rsub|T>\<assign\>log
  <around|(|S<rsub|T>/S<rsub|0>|)>-r*T> and

  <\equation>
    <label|eq:Phi>\<Phi\><around|(|v,T|)>=\<theta\>*\<lambda\>*<big|int><rsub|0><rsup|T>h*<around|(|v,s|)>*<space|0.17em>d*s+V<rsub|0><space|0.17em><Ico>h*<around|(|v,\<cdummy\>|)><around|(|T|)>,
  </equation>

  <math|h*<around|(|v,\<cdot\>|)>> solving

  <\equation>
    <label|eq:heston_IVP>h*<around|(|v,t|)>=<Imu><around*|[|P<around|(|v|)>+Q<around|(|v|)>*h*<around|(|v,t|)>+R*<space|0.17em>h*<around|(|v,t|)><rsup|2>|]>,
  </equation>

  with <math|P<around|(|v|)>=<tfrac|1|2><around|(|-v<rsup|2>-i*v|)>>,
  <math|Q<around|(|v|)>=\<lambda\>*<around|(|i*v*\<rho\>*\<nu\>-1|)>>,
  <math|R=<tfrac|1|2>\<lambda\><rsup|2>*\<nu\><rsup|2>>.

  <\lemma>
    [Riccati Puiseux series]<label|lem:h_series> The unique formal solution
    of<nbsp><eqref|eq:heston_IVP> is <math|h*<around|(|v,t|)>=<big|sum><rsub|k\<ge\>1>a<rsub|k><around|(|v|)>*t<rsup|k*\<mu\>>>
    with <math|<around|{|a<rsub|k><around|(|v|)>|}>> from
    Theorem<nbsp><reference|thm:recurrence> applied to
    <math|c<rsub|0>=P<around|(|v|)>,c<rsub|1>=Q<around|(|v|)>,c<rsub|2>=R>.
    Each <math|a<rsub|k><around|(|v|)>> is a polynomial in <math|v> of degree
    at most <math|k+1> satisfying <math|a<rsub|k><around|(|0|)>=a<rsub|k>*<around|(|-i|)>=0>.
  </lemma>

  <\theorem>
    [Cumulant generating function as Puiseux
    series]<label|thm:cumulant_moments> With
    <math|z\<assign\>T<rsup|\<mu\>>>, <math|\<Phi\><around|(|v,T|)>=T\<cdot\><wide|\<Phi\>|^><around|(|v,z|)>>,

    <\equation>
      <label|eq:Phi_hat_def><wide|\<Phi\>|^><around|(|v,z|)>=<big|sum><rsub|k=0><rsup|\<infty\>>M<rsub|k><around|(|v|)>*<space|0.17em>z<rsup|k>,
    </equation>

    <\equation>
      <label|eq:cumulant_moments>M<rsub|k><around|(|v|)>=<frac|\<theta\>*\<lambda\>|k*\<mu\>+1>*<space|0.17em>a<rsub|k><around|(|v|)>+V<rsub|0>*<space|0.17em><frac|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+2|)>>*<space|0.17em>a<rsub|k+1><around|(|v|)>,<space|1em>k\<ge\>0,
    </equation>

    with <math|a<rsub|0><around|(|v|)>\<equiv\>0>.
  </theorem>

  <\remark>
    [Index bookkeeping]<label|rem:index> Computing
    <math|<around|{|M<rsub|k><around|(|v|)>|}><rsub|k=0><rsup|2*M-1>>
    via<nbsp><eqref|eq:cumulant_moments> requires
    <math|<around|{|a<rsub|k><around|(|v|)>|}><rsub|k=1><rsup|2*M>>, since
    the <math|V<rsub|0>> term in <math|M<rsub|k>> uses <math|a<rsub|k+1>>.
    The M�ntz-coefficient budget is <math|2*M> Riccati coefficients per
    strike.
  </remark>

  <section|Pad� resummation via the Chebyshev algorithm><label|sec:pade>

  The diagonal <math|<around|[|M/M|]>> Pad� approximant of
  <math|<wide|\<Phi\>|^>> is the unique pair
  <math|<around|(|P<rsub|M>,Q<rsub|M>|)>> with <math|deg P<rsub|M>\<le\>M-1>,
  <math|deg Q<rsub|M>\<le\>M>, <math|Q<rsub|M><around|(|0|)>=1>, satisfying

  <\equation>
    <label|eq:pade_match>Q<rsub|M><around|(|z|)><wide|\<Phi\>|^><around|(|v,z|)>-P<rsub|M><around|(|z|)>=O<around|(|z<rsup|2*M>|)>.
  </equation>

  <subsection|Moment functional>

  Define <math|\<cal-L\>:<C><around|[|w|]>\<to\><C>> by
  <math|\<cal-L\><around|[|w<rsup|k>|]>\<assign\>M<rsub|k><around|(|v|)>>,
  extended linearly. Let <math|H<rsub|n>\<assign\>det
  <around|(|M<rsub|i+j>|)><rsub|0\<le\>i,j\<less\>n>>. Quasi-definiteness
  <math|H<rsub|n>\<ne\>0> (<math|n\<ge\>1>) is assumed throughout.

  <subsection|Three-term recurrence and orthogonality>

  <\theorem>
    [Three-term recurrence]<label|thm:three_term> Under quasi-definiteness
    there is a unique sequence of monic polynomials
    <math|<around|{|p<rsub|n>|}><rsub|n\<ge\>0>>, <math|deg p<rsub|n>=n>,
    satisfying

    <\equation>
      <label|eq:OP_orthog>\<cal-L\>*<around|[|w<rsup|k>*<space|0.17em>p<rsub|n><around|(|w|)>|]>=h<rsub|n>*<space|0.17em>\<delta\><rsub|k,n>*<space|1em><around|(|0\<le\>k\<le\>n|)>,<space|1em>h<rsub|n>\<assign\>\<cal-L\>*<around|[|w<rsup|n>*p<rsub|n>|]>\<ne\>0,
    </equation>

    <\equation>
      <label|eq:three_term>p<rsub|n+1><around|(|w|)>=<around|(|w-\<alpha\><rsub|n>|)>*p<rsub|n><around|(|w|)>-\<beta\><rsub|n>*p<rsub|n-1><around|(|w|)>,<space|1em>p<rsub|0>\<equiv\>1,<space|0.27em>p<rsub|-1>\<equiv\>0,
    </equation>

    with <math|\<alpha\><rsub|n>=\<cal-L\>*<around|[|w*p<rsub|n><rsup|2>|]>/h<rsub|n>>,
    <math|\<beta\><rsub|n>=h<rsub|n>/h<rsub|n-1>> (<math|n\<ge\>1>),
    <math|\<beta\><rsub|0>\<assign\>0>, <math|h<rsub|n>=H<rsub|n+1>/H<rsub|n>>.
  </theorem>

  <subsection|The Chebyshev algorithm>

  <\theorem>
    [Chebyshev algorithm]<label|thm:chebyshev>
    <math|\<sigma\><rsub|k,l>\<assign\>\<cal-L\>*<around|[|p<rsub|k><around|(|w|)>*w<rsup|l>|]>>
    (<math|k\<ge\>-1>, <math|l\<ge\>0>).

    <\equation>
      <label|eq:cheb_recurrence>\<sigma\><rsub|-1,l>=0,<space|2em>\<sigma\><rsub|0,l>=M<rsub|l><around|(|v|)>,
    </equation>

    <\equation>
      <label|eq:cheb_recurrence2>\<sigma\><rsub|k+1,l>=\<sigma\><rsub|k,l+1>-\<alpha\><rsub|k>*\<sigma\><rsub|k,l>-\<beta\><rsub|k>*\<sigma\><rsub|k-1,l>,<space|1em>k\<ge\>0,<space|0.27em>l\<ge\>k+1,
    </equation>

    <\equation>
      <label|eq:cheb_extract>\<alpha\><rsub|0>=M<rsub|1><around|(|v|)>/M<rsub|0><around|(|v|)>,<space|1em>\<beta\><rsub|0>=0,<space|1em>h<rsub|0>=M<rsub|0><around|(|v|)>,
    </equation>

    <\equation>
      <label|eq:cheb_extract_k>\<alpha\><rsub|k>=<frac|\<sigma\><rsub|k,k+1>|\<sigma\><rsub|k,k>>-<frac|\<sigma\><rsub|k-1,k>|\<sigma\><rsub|k-1,k-1>>,<space|0.27em>\<beta\><rsub|k>=<frac|\<sigma\><rsub|k,k>|\<sigma\><rsub|k-1,k-1>>,<space|0.27em>h<rsub|k>=\<sigma\><rsub|k,k>,<space|1em>k\<ge\>1.
    </equation>

    The cost is <math|O<around|(|M<rsup|2>|)>> ring operations on
    <math|<around|{|M<rsub|l><around|(|v|)>|}><rsub|l=0><rsup|2*M-1>>, with
    no Hankel matrix formed and no linear system solved. Exact in arbitrary
    precision.
  </theorem>

  <subsection|Pad� numerator from associated polynomials>

  <\definition>
    [Associated polynomial of the second kind]<label|def:assoc>

    <\equation>
      <label|eq:p1_def>p<rsub|n><rsup|<around|(|1|)>><around|(|w|)>\<assign\>\<cal-L\><rsub|v><space|-0.17em><around*|[|<frac|p<rsub|n><around|(|w|)>-p<rsub|n><around|(|v|)>|w-v>|]>.
    </equation>
  </definition>

  <\lemma>
    [Same recurrence]<label|lem:p1_recur>
    <math|p<rsub|n+1><rsup|<around|(|1|)>>=<around|(|w-\<alpha\><rsub|n>|)>*p<rsub|n><rsup|<around|(|1|)>>-\<beta\><rsub|n>*p<rsub|n-1><rsup|<around|(|1|)>>>
    (<math|n\<ge\>1>), <math|p<rsub|0><rsup|<around|(|1|)>>\<equiv\>0>,
    <math|p<rsub|1><rsup|<around|(|1|)>>\<equiv\>M<rsub|0><around|(|v|)>>.
  </lemma>

  <subsection|Pad� matching>

  <\lemma>
    [Pad� denominator and numerator]<label|lem:match>
    <math|Q<rsub|M><around|(|z|)>\<assign\>z<rsup|M>*p<rsub|M>*<around|(|1/z|)>>,
    <math|P<rsub|M><around|(|z|)>\<assign\>z<rsup|M-1>*p<rsub|M><rsup|<around|(|1|)>>*<around|(|1/z|)>>.
    Then <math|Q<rsub|M><around|(|0|)>=1>, <math|deg P<rsub|M>\<le\>M-1>, and

    <\equation>
      <label|eq:pade_proved>Q<rsub|M><around|(|z|)><wide|\<Phi\>|^><around|(|v,z|)>-P<rsub|M><around|(|z|)>=h<rsub|M>*z<rsup|2*M>+O<around|(|z<rsup|2*M+1>|)>.
    </equation>
  </lemma>

  <\corollary>
    [Rational characteristic exponent]<label|cor:rational_Phi>

    <\equation>
      <label|eq:PhiM_def>\<Phi\><rsub|M><around|(|v,T|)>\<assign\>T\<cdot\>z\<cdot\><frac|P<rsub|M><around|(|z;v,T|)>|Q<rsub|M><around|(|z;v,T|)>><mid|\|><rsub|z=T<rsup|\<mu\>>>
    </equation>

    is rational in <math|v> at fixed <math|T>, with <math|2*M> poles in
    <math|v> from <math|Q<rsub|M><around|(|z;v,T|)>\|<rsub|z=T<rsup|\<mu\>>>=0>.
  </corollary>

  <subsection|J-fraction>

  <\theorem>
    [J-fraction]<label|thm:Jfrac>

    <\equation>
      <label|eq:Jfrac><wide|\<Phi\>|^><around|(|v,z|)>=<cfrac|M<rsub|0><around|(|v|)>|1-\<alpha\><rsub|0>*z-<cfrac|\<beta\><rsub|1>*z<rsup|2>|1-\<alpha\><rsub|1>*z-<cfrac|\<beta\><rsub|2>*z<rsup|2>|1-\<alpha\><rsub|2>*z-\<cdots\>>>>
    </equation>

    with <math|M>-th convergent <math|P<rsub|M><around|(|z|)>/Q<rsub|M><around|(|z|)>>.
  </theorem>

  <section|Convergence and a-posteriori bound><label|sec:conv>

  <\theorem>
    [Stahl convergence]<label|thm:conv> Let
    <math|\<rho\><around|(|v|)>\<gtr\>0> be the Puiseux radius and
    <math|K<around|(|v|)>\<subset\><C>\<setminus\><around|[|0,\<rho\><around|(|v|)>|)>>
    the Stahl branch/polar set. Then

    <\equation>
      <label|eq:stahl><around|\||<wide|\<Phi\>|^><around|(|v,z|)>-R<rsub|M>*<around|(|z;v|)>|\|><rsup|1/<around|(|2*M|)>>\<to\>e<rsup|-<math-ss|g><around|(|z,K<around|(|v|)>|)>>
    </equation>

    in capacity on <math|<C>\<setminus\>K<around|(|v|)>>, uniform on real
    compacta. In particular <math|\<Phi\><rsub|M><around|(|v,T|)>\<to\>\<Phi\><around|(|v,T|)>>
    for every <math|T\<ge\>0> with <math|T<rsup|\<mu\>>\<nin\>K<around|(|v|)>>,
    including <math|T> beyond the Puiseux radius.
  </theorem>

  <\theorem>
    [A-posteriori bound, supremum-ratio]<label|thm:aposteriori> Let
    <math|\<Delta\><rsub|M>\<assign\>\<Phi\><rsub|M>-\<Phi\><rsub|M-1>> and
    <math|q<rsub|M>\<assign\>sup<rsub|n\<ge\>M><around|\||\<Delta\><rsub|n+1>|\|>/<around|\||\<Delta\><rsub|n>|\|>>,
    with <math|q<rsub|M>\<to\>e<rsup|-2<math-ss|g><around|(|z,K<around|(|v|)>|)>>\<less\>1>
    on <math|<C>\<setminus\>K<around|(|v|)>>. Whenever
    <math|q<rsub|M>\<less\>1>,

    <\equation>
      <label|eq:aposteriori><around|\||\<Phi\><around|(|v,T|)>-\<Phi\><rsub|M><around|(|v,T|)>|\|>\<le\><frac|<around|\||\<Delta\><rsub|M>|\|>|1-q<rsub|M>>.
    </equation>
  </theorem>

  <\remark>
    [Aitken form]<label|rem:aitken> Under exact geometric decay
    <math|<around|\||\<Delta\><rsub|M+1>|\|>/<around|\||\<Delta\><rsub|M>|\|>=q>
    the sharper Aitken form <math|<around|\||\<Phi\>-\<Phi\><rsub|M>|\|>\<le\><around|\||\<Delta\><rsub|M>|\|><rsup|2>/<around|(|<around|\||\<Delta\><rsub|M-1>|\|>-<around|\||\<Delta\><rsub|M>|\|>|)>>
    applies; in general it is heuristic.
  </remark>

  <\lemma>
    [Normalisation]<label|lem:norm> <math|\<Phi\><rsub|M><around|(|0,T|)>=\<Phi\><rsub|M><around|(|-i,T|)>=0>,
    hence <math|\<phi\><rsub|M><around|(|0,T|)>=\<phi\><rsub|M><around|(|-i,T|)>=1>.
  </lemma>

  <\lemma>
    [Hermitian symmetry]<label|lem:herm> <math|\<phi\><rsub|M><around|(|-<wide|v|\<bar\>>,T|)>=<wide|\<phi\><rsub|M><around|(|v,T|)>|\<bar\>>>.
  </lemma>

  <\lemma>
    [Gaussian real-axis decay]<label|lem:decay> With
    <math|<around|(|\<sigma\><rsub|T>,\<mu\><rsub|T>,<around|{|u<rsub|j><around|(|T|)>,A<rsub|j><around|(|T|)>|}><rsub|j=1><rsup|2*M>|)>>
    from PFE<nbsp><eqref|eq:PFE>,

    <\equation>
      <label|eq:gauss_decay><around|\||\<phi\><rsub|M><around|(|u,T|)>|\|>\<le\>e<rsup|C<rsub|T>>*<space|0.17em>e<rsup|-<tfrac|1|2>\<sigma\><rsub|T><rsup|2>*u<rsup|2>>,<space|1em>u\<in\><R>,
    </equation>

    where <math|C<rsub|T>\<assign\><big|sum><rsub|j=1><rsup|2*M><around|\||A<rsub|j><around|(|T|)>|\|>/<around|\||<Imag>u<rsub|j><around|(|T|)>|\|>\<less\>\<infty\>>.
  </lemma>

  <\remark>
    [Pre-asymptotic regime]<label|rem:CT> The
    bound<nbsp><eqref|eq:gauss_decay> is governed by <math|C<rsub|T>>, which
    blows up if any pole approaches <math|<R>>. The Gaussian envelope
    dominates <math|e<rsup|C<rsub|T>>> for
    <math|<around|\||u|\|>\<gtrsim\><sqrt|2*C<rsub|T>/\<sigma\><rsub|T><rsup|2>>>.
    For smaller <math|<around|\||u|\|>> the trivial bound
    <math|<around|\||\<phi\><rsub|M><around|(|u,T|)>|\|>\<le\>1+<big|sum><rsub|j><around|\||A<rsub|j><around|(|T|)>|\|>/<around|\||<Imag>u<rsub|j><around|(|T|)>|\|>>
    is used.
  </remark>

  <\remark>
    [Tail comparison]<label|rem:tail_compare> Pad� <math|\<phi\><rsub|M>> has
    Gaussian decay <math|e<rsup|-<tfrac|1|2>\<sigma\><rsub|T><rsup|2>*u<rsup|2>>>,
    sharper than the stretched-exponential
    <math|e<rsup|-c<around|\||u|\|><rsup|2*\<mu\>>>> (<math|\<mu\>\<less\>1>)
    of the exact rough Heston cf.
  </remark>

  <\proposition>
    [Strip admissibility]<label|prop:strip> For rough Heston with
    <math|\<mu\>\<in\><around|(|<tfrac|1|2>,1|)>> and Pad� order <math|M>,
    the PFE poles <math|<around|{|u<rsub|j><around|(|T|)>|}><rsub|j=1><rsup|2*M>>
    split by Hermitian symmetry (Lemma<nbsp><reference|lem:herm>) into
    <math|M> poles in <math|<around|{|<Imag>u<rsub|j>\<less\>0|}>> and
    <math|M> in <math|<around|{|<Imag>u<rsub|j>\<gtr\>0|}>>. Consider

    <\equation>
      <label|eq:strip_hypothesis>min<rsub|j=1,\<ldots\>,2*M><Imag>u<rsub|j><around|(|T|)>\<gtr\>c+1
    </equation>

    for <math|c\<in\><R>>. Any <math|c\<le\>min<rsub|j><Imag>u<rsub|j><around|(|T|)>-1>
    satisfies<nbsp><eqref|eq:strip_hypothesis>; such <math|c> exists because
    the PFE has finitely many poles off <math|<R>>. The corresponding damping
    <math|\<alpha\>=-c-1> is positive and finite.
  </proposition>

  <\remark>
    [Independence from <math|c>]<label|rem:cauchy_independence> By Cauchy's
    theorem the contour can be deformed between any two admissible
    vertical lines without crossing poles, so the integral value is
    unchanged. The Fox <math|H> price formula<nbsp><eqref|eq:foxH_price> is a
    contour-invariant analytic identity.
  </remark>

  <section|Closed-form density via Fox <math|H>><label|sec:foxH_density>

  <\definition>
    [Fox <math|H>-function]<label|def:foxH> For nonnegative integers
    <math|m,n,p,q> with <math|0\<le\>n\<le\>p>, <math|0\<le\>m\<le\>q>,

    <\equation>
      <label|eq:foxH_def>H<rsup|m,n><rsub|p,q><space|-0.17em><around*|[|z<space|0.17em><mid|\|><space|0.17em><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|<around|(|a<rsub|i>,\<alpha\><rsub|i>|)><rsub|1><rsup|p>>>|<row|<cell|<around|(|b<rsub|j>,\<beta\><rsub|j>|)><rsub|1><rsup|q>>>>>>|]>\<assign\><frac|1|2*\<pi\>*i>*<big|int><rsub|\<cal-L\>><frac|<big|prod><rsub|j=1><rsup|m>\<Gamma\>*<around|(|b<rsub|j>+\<beta\><rsub|j>*s|)>*<big|prod><rsub|i=1><rsup|n>\<Gamma\>*<around|(|1-a<rsub|i>-\<alpha\><rsub|i>*s|)>|<big|prod><rsub|j=m+1><rsup|q>\<Gamma\>*<around|(|1-b<rsub|j>-\<beta\><rsub|j>*s|)>*<big|prod><rsub|i=n+1><rsup|p>\<Gamma\>*<around|(|a<rsub|i>+\<alpha\><rsub|i>*s|)>>*<space|0.17em>z<rsup|-s>*<space|0.17em>d*s.
    </equation>
  </definition>

  <\theorem>
    [Closed-form density]<label|thm:foxH_density> With PFE

    <\equation>
      <label|eq:PFE>\<Phi\><rsub|M><around|(|u,T|)>=-<tfrac|1|2>\<sigma\><rsub|T><rsup|2>*u<rsup|2>-i*\<mu\><rsub|T>*u+<big|sum><rsub|j=1><rsup|2*M><frac|A<rsub|j><around|(|T|)>|u-u<rsub|j><around|(|T|)>>,
    </equation>

    <math|\<sigma\><rsub|T><rsup|2>\<gtr\>0>, <math|\<mu\><rsub|T>\<in\><R>>,
    <math|u<rsub|j>\<nin\><R>>, <math|\<epsilon\><rsub|j>\<assign\>-<sgn><around|(|<Imag>u<rsub|j><around|(|T|)>|)>>,
    <math|f<rsub|M><around|(|x,T|)>\<assign\><Fc><rsup|-1><around|[|\<phi\><rsub|M>|(>\<cdot\>,T)]<around|(|x|)>>
    admits

    <\equation>
      <label|eq:foxH_density>f<rsub|M><around|(|x,T|)>=<big|sum><rsub|S\<in\><Pc><around|(|<around|{|1,\<ldots\>,2*M|}>|)>>d<rsub|S><around|(|T|)>*<space|0.17em>H<rsup|m<rsub|S><rsup|\<circ\>>,n<rsub|S><rsup|\<circ\>>><rsub|p<rsub|S><rsup|\<circ\>>,q<rsub|S><rsup|\<circ\>>><space|-0.17em><around*|[|\<eta\><rsub|S><around|(|x,T|)><space|0.17em><mid|\|><space|0.17em><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|<around|(|<math-bf|a><rsub|S><rsup|\<circ\>>,\<b-alpha\><rsub|S><rsup|\<circ\>>|)>>>|<row|<cell|<around|(|<math-bf|b><rsub|S><rsup|\<circ\>>,\<b-beta\><rsub|S><rsup|\<circ\>>|)>>>>>>|]>
    </equation>

    with <math|<around|(|m<rsub|S><rsup|\<circ\>>,n<rsub|S><rsup|\<circ\>>,p<rsub|S><rsup|\<circ\>>,q<rsub|S><rsup|\<circ\>>|)>=<around|(|<around|\||S|\|>+1,<around|\||S|\|>,<around|\||S|\|>+1,2\|S\|+1|)>>,

    <\equation>
      <label|eq:density_prefactors>d<rsub|S><around|(|T|)>=<frac|1|<sqrt|2*\<pi\>*\<sigma\><rsub|T><rsup|2>>>*<big|prod><rsub|j\<in\>S>\<epsilon\><rsub|j>*<sqrt|A<rsub|j><around|(|T|)>/i>,
    </equation>

    <\equation>
      <label|eq:density_argument>\<eta\><rsub|S><around|(|x,T|)>=<frac|<around|(|x-\<mu\><rsub|T>|)>*<space|0.17em><with|math-font-family|bf|1><rsub|<big|wedge><rsub|j\<in\>S>\<epsilon\><rsub|j>*<around|(|x-\<mu\><rsub|T>|)>\<gtr\>0>|<sqrt|2*\<sigma\><rsub|T><rsup|2>>>*<big|prod><rsub|j\<in\>S><around|(|i*A<rsub|j><around|(|T|)>|)>\<cdot\>exp
      <space|-0.17em><around*|(|-i*<big|sum><rsub|j\<in\>S>u<rsub|j><around|(|T|)>*<around|(|x-\<mu\><rsub|T>|)>|)>,
    </equation>

    <\equation>
      <label|eq:density_params>

      <\aligned>
        <tformat|<table|<row|<cell|<math-bf|a><rsub|S><rsup|\<circ\>>>|<cell|=<around|(|0,\<ldots\>,0|)><rsub|<around|\||S|\|>>,>|<cell|\<b-alpha\><rsub|S><rsup|\<circ\>>>|<cell|=<around|(|1,\<ldots\>,1|)><rsub|<around|\||S|\|>>,>>|<row|<cell|<math-bf|b><rsub|S><rsup|\<circ\>>>|<cell|=<around|(|0<rsub|Gauss>,<around|(|0|)><rsub|<around|\||S|\|>>,<around|(|-1|)><rsub|<around|\||S|\|>>|)>,>|<cell|\<b-beta\><rsub|S><rsup|\<circ\>>>|<cell|=<around|(|<tfrac|1|2>,<around|(|1|)><rsub|<around|\||S|\|>>,<around|(|1|)><rsub|<around|\||S|\|>>|)>.>>>>
      </aligned>
    </equation>

    All entries are constant in <math|j\<in\>S>. The <math|j>-dependent data
    enters only through <math|d<rsub|S><around|(|T|)>> and
    <math|\<eta\><rsub|S><around|(|x,T|)>>, both symmetric in <math|S>.
  </theorem>

  <\corollary>
    [Newton\UGirard symmetric collapse]<label|cor:density_symmetric> The
    level-<math|r> consolidations

    <\equation>
      <label|eq:NG_amplitude><big|sum><rsub|<around|\||S|\|>=r><big|prod><rsub|j\<in\>S><around|(|i*A<rsub|j><around|(|T|)>|)>=i<rsup|r>*<space|0.17em>e<rsub|r>*<around*|(|A<rsub|1><around|(|T|)>,\<ldots\>,A<rsub|2*M><around|(|T|)>|)>,
    </equation>

    <\equation>
      <label|eq:NG_phase><big|sum><rsub|<around|\||S|\|>=r>exp
      <space|-0.17em><around*|(|-i*<big|sum><rsub|j\<in\>S>u<rsub|j><around|(|T|)>*\<xi\>|)>=e<rsub|r>*<around*|(|e<rsup|-i*u<rsub|1><around|(|T|)>*\<xi\>>,\<ldots\>,e<rsup|-i*u<rsub|2*M><around|(|T|)>*\<xi\>>|)>,
    </equation>

    reduce the <math|2<rsup|2*M>>-subset sum to <math|2*M+1> symmetric groups
    computable in <math|O<around|(|M*log<rsup|2> M|)>> via FFT polynomial
    multiplication of <math|<big|prod><rsub|j><around|(|1+t*x<rsub|j>|)>>.
  </corollary>

  <section|Closed-form European call price via Fox
  <math|H>><label|sec:foxH_price>

  <\theorem>
    [Closed-form European call price]<label|thm:foxH_price> With
    <math|<wide|k|~>\<assign\>log <around|(|K/S<rsub|0>|)>-r*T>,

    <\equation>
      <label|eq:foxH_price>C<rsub|M>*<around|(|K,T|)>=S<rsub|0>*<big|sum><rsub|S\<in\><Pc><around|(|<around|{|1,\<ldots\>,2*M|}>|)>>c<rsub|S><around|(|T|)>*<space|0.17em>H<rsup|m<rsub|S>,n<rsub|S>><rsub|p<rsub|S>,q<rsub|S>>*<space|-0.17em><around*|[|\<zeta\><rsub|S>*<around|(|K,T|)><space|0.17em><mid|\|><space|0.17em><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|<around|(|<math-bf|a><rsub|S>,\<b-alpha\><rsub|S>|)>>>|<row|<cell|<around|(|<math-bf|b><rsub|S>,\<b-beta\><rsub|S>|)>>>>>>|]>
    </equation>

    with <math|<around|(|m<rsub|S>,n<rsub|S>,p<rsub|S>,q<rsub|S>|)>=<around|(|<around|\||S|\|>+1,<around|\||S|\|>+1,<around|\||S|\|>+2,2\|S\|+2|)>>,

    <\align>
      <tformat|<table|<row|<cell|c<rsub|S><around|(|T|)>>|<cell|=<frac|1|<sqrt|2*\<pi\>*\<sigma\><rsub|T><rsup|2>>>*<big|prod><rsub|j\<in\>S>\<epsilon\><rsub|j>*<sqrt|A<rsub|j><around|(|T|)>/i>,<eq-number><label|eq:price_prefactor>>>|<row|<cell|\<zeta\><rsub|S>*<around|(|K,T|)>>|<cell|=<frac|<around|(|K/S<rsub|0>|)>*e<rsup|-r*T-\<mu\><rsub|T>>|<sqrt|2*\<sigma\><rsub|T><rsup|2>>>*<big|prod><rsub|j\<in\>S><around|(|i*A<rsub|j><around|(|T|)>|)>.<eq-number><label|eq:price_argument>>>>>
    </align>

    After Newton\UGirard the sum reduces to <math|2*M+1> symmetric groups,
    evaluable in <math|O<around|(|M*log<rsup|2> M|)>>.
  </theorem>

  Theorem<nbsp><reference|thm:foxH_density>
  gives<nbsp><eqref|eq:foxH_density>. The payoff splits as
  <math|<around|(|S<rsub|T>-K|)><rsup|+>=S<rsub|0>*e<rsup|x+r*T>*<with|math-font-family|bf|1><rsub|x\<gtr\><wide|k|~>>-K*<with|math-font-family|bf|1><rsub|x\<gtr\><wide|k|~>>>.
  Per Fox <math|H>-summand,

  <\equation>
    <label|eq:Hint_const><big|int><rsub|<wide|k|~>><rsup|\<infty\>>H<rsup|m,n><rsub|p,q>*<around|[|\<zeta\>*x\|\<cdots\>|]>*d*x=\<zeta\><rsup|-1>*H<rsup|m+1,n><rsub|p+1,q+1><around|[|\<zeta\>*<wide|k|~>\|<around|(|0,1|)>,\<ldots\>,<around|(|1,1|)>|]>,
  </equation>

  adding one <math|\<Gamma\>>-factor each in <math|<around|(|m,p,q|)>>. The
  Mellin shift followed by<nbsp><eqref|eq:Hint_const> adds one in <math|n>.
  The increment gives <math|<around|(|<around|\||S|\|>+1,<around|\||S|\|>+1,<around|\||S|\|>+2,2\|S\|+2|)>>.

  Assume<nbsp><eqref|eq:strip_hypothesis> for some <math|c\<in\><R>>
  (Proposition<nbsp><reference|prop:strip>). The Parseval representation

  <\equation>
    <label|eq:contour>C<rsub|M>*<around|(|K,T|)>=<frac|S<rsub|0>*e<rsup|-r*T>|2*\<pi\>*i>*<big|int><rsub|c-i*\<infty\>><rsup|c+i*\<infty\>><frac|\<phi\><rsub|M><around|(|i*w,T|)>*e<rsup|-w*<wide|k|~>>|w*<around|(|w-1|)>>*<space|0.17em>d*w
  </equation>

  combined with the Bessel resummation

  <\equation>
    <label|eq:bessel_resum><big|sum><rsub|n\<ge\>1><frac|c<rsup|n>|n!<around|(|s-u|)><rsub|n>>=<frac|\<Gamma\>*<around|(|s-u|)>*I<rsub|s-u-1>*<around|(|2*<sqrt|c>|)>|c<rsup|<around|(|s-u-1|)>/2>>-1,
  </equation>

  which converges absolutely on <math|<Real><around|(|s-u|)>\<gtr\>0>,
  identifies the result as Fox <math|H> with the same parameters.

  <\corollary>
    [Two-route verification]<label|cor:two_routes> <eqref|eq:foxH_price> is
    established by two analytically independent routes converging on
    identical parameter data.
  </corollary>

  <\corollary>
    [Quadrature-free pricing]<label|cor:no_quadrature>
    <math|C<rsub|M>*<around|(|K,T|)>> is a finite sum of Fox <math|H>
    evaluations, each via an absolutely convergent residue series with
    <math|n>-th term <math|O<around|(|n!<rsup|-1>|)>>, no Fourier inversion
    quadrature, no cosine series, no truncation interval.
  </corollary>

  <section|COS pricing as alternative><label|sec:cos>

  <subsection|Cumulants>

  <math|\<psi\><rsub|M><around|(|s,T|)>\<assign\>\<Phi\><rsub|M><around|(|-i*s,T|)>>,

  <\equation>
    <label|eq:cumulants>\<kappa\><rsub|n><rsup|<around|(|M|)>><around|(|T|)>\<assign\><frac|d<rsup|n>*\<psi\><rsub|M><around|(|s,T|)>|d*s<rsup|n>><mid|\|><rsub|s=0>,<space|1em>n=1,2,3,4.
  </equation>

  <subsection|Truncation interval>

  <\equation>
    <label|eq:interval><around|[|a<around|(|T|)>,b<around|(|T|)>|]>\<assign\><around*|[|\<kappa\><rsub|1><rsup|<around|(|M|)>>-L<sqrt|\<kappa\><rsub|2><rsup|<around|(|M|)>>+<sqrt|\<kappa\><rsub|4><rsup|<around|(|M|)>>>>,<space|0.17em>\<kappa\><rsub|1><rsup|<around|(|M|)>>+L<sqrt|\<kappa\><rsub|2><rsup|<around|(|M|)>>+<sqrt|\<kappa\><rsub|4><rsup|<around|(|M|)>>>>|]>,<space|1em>L\<in\><around|[|8,12|]>.
  </equation>

  <\remark>
    [Single-interval term structure]<label|rem:single_interval>
    <math|\<kappa\><rsub|2><rsup|<around|(|M|)>><around|(|T|)>,\<kappa\><rsub|4><rsup|<around|(|M|)>><around|(|T|)>>
    are nondecreasing in <math|T>, so <math|<around|[|a,b|]>\<assign\><around|[|a<around|(|T<rsub|max>|)>,b<around|(|T<rsub|max>|)>|]>>
    is admissible for every <math|T\<in\><around|(|0,T<rsub|max>|]>>.
  </remark>

  <subsection|Payoff coefficients>

  <math|w<around|(|x|)>=K*<around|(|e<rsup|x>-1|)><rsup|+>>,
  <math|<wide|U|~><rsub|n>=<frac|2|b-a>*<around|[|\<chi\><rsub|n><around|(|0,b|)>-\<psi\><rsub|n><around|(|0,b|)>|]>>,

  <\align>
    <tformat|<table|<row|<cell|\<chi\><rsub|n><around|(|c,d|)>>|<cell|=<frac|1|1+<around|(|n*\<pi\>/<around|(|b-a|)>|)><rsup|2>>*<around*|[|cos
    <around|(|n*\<pi\>*<around|(|d-a|)>/<around|(|b-a|)>|)>*e<rsup|d>-cos
    <around|(|n*\<pi\>*<around|(|c-a|)>/<around|(|b-a|)>|)>*e<rsup|c>|\<nobracket\>>>>|<row|<cell|>|<cell|<around*|\<nobracket\>|<space|1em>+<tfrac|n*\<pi\>|b-a><around|(|sin
    <around|(|n*\<pi\>*<around|(|d-a|)>/<around|(|b-a|)>|)>*e<rsup|d>-sin
    <around|(|n*\<pi\>*<around|(|c-a|)>/<around|(|b-a|)>|)>*e<rsup|c>|)>|]>,<eq-number>>>|<row|<cell|\<psi\><rsub|n><around|(|c,d|)>>|<cell|=<choice|<tformat|<table|<row|<cell|d-c,>|<cell|n=0,>>|<row|<cell|<frac|b-a|n*\<pi\>>*<around|[|sin
    <around|(|n*\<pi\>*<around|(|d-a|)>/<around|(|b-a|)>|)>-sin
    <around|(|n*\<pi\>*<around|(|c-a|)>/<around|(|b-a|)>|)>|]>,>|<cell|n\<ge\>1.>>>>><eq-number>>>>>
  </align>

  <subsection|COS price with Gaussian-rate error>

  <\theorem>
    [COS pricing]<label|thm:price> <math|x<rsub|0>\<assign\>log
    <around|(|S<rsub|0>/K|)>+r*T>,

    <\equation>
      <label|eq:CMN>C<rsub|M,N>\<assign\>K*e<rsup|-r*T>*<big|sum><rsub|n=0><rsup|N-1><space|-0.17em><rprime|'><space|0.17em><Real><space|-0.17em><around*|[|\<phi\><rsub|M><space|-0.17em><around*|(|<tfrac|n*\<pi\>|b-a>,T|)>*exp
      <space|-0.17em><around*|(|i*n*\<pi\><tfrac|x<rsub|0>-a|b-a>|)>|]>*<wide|U|~><rsub|n>.
    </equation>

    <math|C<rsub|M,N>\<to\>C<rsub|M>> as <math|N\<to\>\<infty\>>, with

    <\equation>
      <label|eq:cos_error><around|\||C<rsub|M>-C<rsub|M,N>|\|>\<le\>C<rprime|'>*exp
      <space|-0.17em><around*|(|-<tfrac|1|2>\<sigma\><rsub|T><rsup|2>*<around|(|N*\<pi\>/<around|(|b-a|)>|)><rsup|2>|)>.
    </equation>
  </theorem>

  <section|Algorithm and computational summary><label|sec:algorithm>

  The Fox <math|H> pricing endpoint<nbsp><eqref|eq:foxH_price> consumes the
  PFE data <math|<around|{|u<rsub|j><around|(|T|)>,A<rsub|j><around|(|T|)>,\<sigma\><rsub|T>,\<mu\><rsub|T>|}>>
  and accepts <math|K> directly through <math|\<zeta\><rsub|S>*<around|(|K,T|)>>;
  no Fourier inversion is performed and no grid in <math|v> is required.

  <subsection|Three-tier decomposition>

  <paragraph|Tier 0 (per parameter evaluation, per Fourier node).> With
  <math|v> specialised to a numeric value, the Chebyshev algorithm
  (Theorem<nbsp><reference|thm:chebyshev>) on
  <math|<around|{|M<rsub|l><around|(|v|)>|}><rsub|l=0><rsup|2*M-1>> costs
  <math|O<around|(|M<rsup|2>|)>> scalar operations.

  <paragraph|Tier 1 (per maturity <math|T>).> Specialise
  <math|z=T<rsup|\<mu\>>> to obtain the rational
  <math|\<Phi\><rsub|M><around|(|v,T|)>>, then compute the PFE
  <math|<around|{|u<rsub|j><around|(|T|)>,A<rsub|j><around|(|T|)>,\<sigma\><rsub|T>,\<mu\><rsub|T>|}><rsub|j=1><rsup|2*M>>
  by root-finding and cover-up at <math|O<around|(|M<rsup|2>|)>> per
  <math|T>.

  <paragraph|Tier 2 (per strike <math|K> at fixed <math|T>).> Fox <math|H>
  evaluation<nbsp><eqref|eq:foxH_price> via Newton\UGirard consolidation
  (Corollary<nbsp><reference|cor:density_symmetric>) and an absolutely
  convergent residue series with <math|n!<rsup|-1>> terms,
  <math|O<around|(|M*log<rsup|2> M|)>> per <math|<around|(|K,T|)>>, no
  quadrature.

  <subsection|Total cost across an <math|<around|(|N<rsub|T>,N<rsub|K>|)>>-surface>

  For one parameter evaluation,

  <\equation>
    <label|eq:total_cost><wide*|O<around|(|M<rsup|2>|)>|\<wide-underbrace\>><rsub|<text|Tier
    0>>+<wide*|N<rsub|T>\<cdot\>O<around|(|M<rsup|2>|)>|\<wide-underbrace\>><rsub|<text|Tier
    1, per >T>+<wide*|N<rsub|T>*N<rsub|K>\<cdot\>O<around|(|M*log<rsup|2>
    M|)>|\<wide-underbrace\>><rsub|<text|Tier 2, per ><around|(|K,T|)>>.
  </equation>

  The structurally novel feature is the <math|K>-independence at Tier 2:
  every strike at fixed <math|T> shares the PFE data and costs only
  <math|O<around|(|M*log<rsup|2> M|)>>.

  <subsection|COS endpoint>

  The COS endpoint requires <math|\<phi\><rsub|M><around|(|v<rsub|n>,T|)>> on
  a Fourier grid, with each node costing <math|O<around|(|M|)>> via the
  rational form of <math|\<Phi\><rsub|M>>, giving <math|O<around|(|N*M|)>>
  per <math|<around|(|K,T|)>>.

  <\remark>
    [Cost decomposition]<label|rem:cost_decomposition> Per parameter
    evaluation, the pipeline scales as <math|O<around|(|M<rsup|2>|)>> for the
    Chebyshev front-end, <math|O<around|(|M<rsup|2>|)>> per maturity for the
    PFE, and <math|O<around|(|M*log<rsup|2> M|)>> per <math|<around|(|K,T|)>>
    via Fox <math|H>, with no quadrature, no Fourier inversion, and no
    truncation interval. The <math|K>-independence of Tier 2 is what allows
    the full strike slice at fixed <math|T> to be priced in time proportional
    to the slice size, not to its product with <math|M>.
  </remark>

  <section|Summary><label|sec:summary>

  <with|font-series|bold|T1.> Pad� resummation directly on
  <math|<around|{|M<rsub|k><around|(|v|)>|}>> via the Chebyshev algorithm in
  arbitrary precision, in <math|O<around|(|M<rsup|2>|)>> ring operations with
  no Hankel matrix inversion. Stahl convergence
  (Theorem<nbsp><reference|thm:conv>) extends beyond the Puiseux radius. The
  supremum-ratio a-posteriori bound (Theorem<nbsp><reference|thm:aposteriori>)
  fixes <math|M> from precision.

  <with|font-series|bold|T2.> Density (Theorem<nbsp><reference|thm:foxH_density>)
  and call price (Theorem<nbsp><reference|thm:foxH_price>) admit strictly
  closed-form Fox <math|H> representations, evaluable in
  <math|O<around|(|M*log<rsup|2> M|)>> per <math|<around|(|K,T|)>> with no
  quadrature; the front-end is <math|O<around|(|M<rsup|2>|)>> per parameter
  evaluation and the PFE <math|O<around|(|M<rsup|2>|)>> per maturity
  (Remark<nbsp><reference|rem:cost_decomposition>). Established by two
  analytically independent routes (Corollary<nbsp><reference|cor:two_routes>).

  <with|font-series|bold|T3.> COS pricing
  (Theorem<nbsp><reference|thm:price>) on rational
  <math|\<Phi\><rsub|M><around|(|\<cdummy\>,T|)>> provides a fallback
  endpoint of cost <math|O<around|(|N*M|)>> per <math|<around|(|K,T|)>> with
  Gaussian-rate truncation error.

  <\thebibliography|9>
    <bibitem|Chebyshev>P.<nbsp>L.<nbsp>Chebyshev, <em|Sur le d�veloppement
    des fonctions � une seule variable>, Bull.<nbsp>Acad.<nbsp>Imp.<nbsp>Sci.<nbsp>St.<nbsp>P�tersbourg
    <with|font-series|bold|1> (1859), 193\U200.

    <bibitem|Chihara>T.<nbsp>S.<nbsp>Chihara, <em|An Introduction to
    Orthogonal Polynomials>, Gordon and Breach, 1978.

    <bibitem|Brezinski>C.<nbsp>Brezinski, <em|Pad�-Type Approximation and
    General Orthogonal Polynomials>, Birkh�user, 1980.

    <bibitem|StahlBranch>H.<nbsp>Stahl, <em|Convergence of Pad� approximants
    to functions with branch points>, J.<nbsp>Approx.<nbsp>Theory
    <with|font-series|bold|91> (1997), 139\U204.

    <bibitem|ElEuchRosenbaum>O.<nbsp>El<nbsp>Euch and M.<nbsp>Rosenbaum,
    <em|The characteristic function of rough Heston models>,
    Math.<nbsp>Finance <with|font-series|bold|29> (2019), 3\U38.

    <bibitem|MathaiSaxena>A.<nbsp>M.<nbsp>Mathai, R.<nbsp>K.<nbsp>Saxena,
    H.<nbsp>J.<nbsp>Haubold, <em|The H-Function: Theory and Applications>,
    Springer, 2010.

    <bibitem|CarrMadan>P.<nbsp>Carr and D.<nbsp>Madan, <em|Option valuation
    using the fast Fourier transform>, J.<nbsp>Comp.<nbsp>Finance
    <with|font-series|bold|2> (1999), 61\U73.

    <bibitem|FangOosterlee>F.<nbsp>Fang and C.<nbsp>W.<nbsp>Oosterlee, <em|A
    novel pricing method for European options based on Fourier-cosine series
    expansions>, SIAM J.<nbsp>Sci.<nbsp>Comput.<nbsp><with|font-series|bold|31>
    (2008), 826\U848.

    <bibitem|SKM>S.<nbsp>G.<nbsp>Samko, A.<nbsp>A.<nbsp>Kilbas,
    O.<nbsp>I.<nbsp>Marichev, <em|Fractional Integrals and Derivatives>,
    Gordon and Breach, 1993.
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
    <associate|auto-1|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-10|<tuple|4.6|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-11|<tuple|5|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-12|<tuple|6|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-13|<tuple|7|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-14|<tuple|8|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-15|<tuple|8.1|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-16|<tuple|8.2|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-17|<tuple|8.3|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-18|<tuple|8.4|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-19|<tuple|9|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-20|<tuple|9.1|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-21|<tuple|1|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-22|<tuple|2|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-23|<tuple|3|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-24|<tuple|9.2|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-25|<tuple|9.3|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-26|<tuple|10|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-27|<tuple|10|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-3|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-4|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-5|<tuple|4.1|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-6|<tuple|4.2|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-7|<tuple|4.3|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-8|<tuple|4.4|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-9|<tuple|4.5|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Brezinski|<tuple|Brezinski|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-CarrMadan|<tuple|CarrMadan|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Chebyshev|<tuple|Chebyshev|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Chihara|<tuple|Chihara|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-ElEuchRosenbaum|<tuple|ElEuchRosenbaum|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-FangOosterlee|<tuple|FangOosterlee|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-MathaiSaxena|<tuple|MathaiSaxena|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-SKM|<tuple|SKM|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-StahlBranch|<tuple|StahlBranch|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|cor:density_symmetric|<tuple|26|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|cor:no_quadrature|<tuple|29|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|cor:rational_Phi|<tuple|12|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|cor:two_routes|<tuple|28|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:RL|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:assoc|<tuple|9|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:foxH|<tuple|24|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:CMN|<tuple|44|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Hint_const|<tuple|37|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:IVP|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Jfrac|<tuple|21|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:NG_amplitude|<tuple|32|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:NG_phase|<tuple|33|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:OP_orthog|<tuple|12|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:PFE|<tuple|27|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Phi|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:PhiM_def|<tuple|20|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Phi_hat_def|<tuple|9|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:RL_D|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:RL_I|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:a1|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:ak|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:aposteriori|<tuple|23|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:bessel_resum|<tuple|39|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cheb_extract|<tuple|16|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cheb_extract_k|<tuple|17|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cheb_recurrence|<tuple|14|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cheb_recurrence2|<tuple|15|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cos_error|<tuple|45|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cumulant_moments|<tuple|10|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:cumulants|<tuple|40|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:density_argument|<tuple|30|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:density_params|<tuple|31|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:density_prefactors|<tuple|29|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:foxH_def|<tuple|26|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:foxH_density|<tuple|28|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:foxH_price|<tuple|34|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:gauss_decay|<tuple|24|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:heston_IVP|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:interval|<tuple|41|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:contour|<tuple|38|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:p1_def|<tuple|18|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:pade_match|<tuple|11|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:pade_proved|<tuple|19|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:power|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:price_argument|<tuple|36|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:price_prefactor|<tuple|35|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:stahl|<tuple|22|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:strip_hypothesis|<tuple|25|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:three_term|<tuple|13|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:total_cost|<tuple|46|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:decay|<tuple|19|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:h_series|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:herm|<tuple|18|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:match|<tuple|11|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:norm|<tuple|17|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:p1_recur|<tuple|10|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:power|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prop:strip|<tuple|22|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:CT|<tuple|20|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:aitken|<tuple|16|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:cauchy_independence|<tuple|23|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:cost_decomposition|<tuple|32|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:index|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:single_interval|<tuple|30|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:tail_compare|<tuple|21|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:algorithm|<tuple|9|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:conv|<tuple|5|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:cos|<tuple|8|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:cumulant|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:fc|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:foxH_density|<tuple|6|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:foxH_price|<tuple|7|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:pade|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:recurrence|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:summary|<tuple|10|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:Jfrac|<tuple|13|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:aposteriori|<tuple|15|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:chebyshev|<tuple|8|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:conv|<tuple|14|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:cumulant_moments|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:foxH_density|<tuple|25|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:foxH_price|<tuple|27|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:price|<tuple|31|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:recurrence|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:three_term|<tuple|7|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Fractional
      calculus and the M�ntz basis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      M�ntz\UTau recurrence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Rough
      Heston cumulant moments> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Pad�
      resummation via the Chebyshev algorithm>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Moment functional
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Three-term recurrence and
      orthogonality <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|4.3<space|2spc>The Chebyshev algorithm
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4.4<space|2spc>Pad� numerator from
      associated polynomials <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|4.5<space|2spc>Pad� matching
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|4.6<space|2spc>J-fraction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Convergence
      and a-posteriori bound> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Closed-form
      density via Fox <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|H>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Closed-form
      European call price via Fox <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|H>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>COS
      pricing as alternative> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <with|par-left|<quote|1tab>|8.1<space|2spc>Cumulants
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|8.2<space|2spc>Truncation interval
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|8.3<space|2spc>Payoff coefficients
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|8.4<space|2spc>COS price with Gaussian-rate
      error <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Algorithm
      and computational summary> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19><vspace|0.5fn>

      <with|par-left|<quote|1tab>|9.1<space|2spc>Three-tier decomposition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|3tab>|Tier 0 (per parameter evaluation, per
      Fourier node). <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <with|par-left|<quote|3tab>|Tier 1 (per maturity
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|T>>).
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|3tab>|Tier 2 (per strike <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|K>> at fixed
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|T>>).
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|1tab>|9.2<space|2spc>Total cost across an
      <with|color|<quote|dark red>|font-family|<quote|rm>|<with|mode|<quote|math>|<around|(|N<rsub|T>,N<rsub|K>|)>>>-surface
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1tab>|9.3<space|2spc>COS endpoint
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Summary>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>