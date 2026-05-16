<TeXmacs|2.1.5>

<style|<tuple|generic|framed-theorems|alt-colors>>

<\body>
  <\hide-preamble>
    <assign|ord|<macro|ord>>

    <assign|C|<macro|\<bbb-C\>>>

    <assign|Dmu|<macro|D<rsup|\<mu\>>>>

    <assign|Ialpha|<macro|I<rsup|1-\<alpha\>>>>

    <assign|Lk|<macro|\<cal-L\>>>

    <assign|Lkap|<macro|\<cal-L\><rsub|\<kappa\>>>>

    <assign|assign|<macro|:=>>
  </hide-preamble>

  <doc-data|<doc-title|The Fractional Riccati--Müntz--Padé
  Theorem<next-line>and Its Application to Rough
  Heston>|<doc-date|<date|>>|<doc-author|<author-data|<author-name|Lev
  Chevron>>>>

  <abstract-data|<\abstract>
    We establish the <em|Fractional Riccati--Müntz--Padé Theorem>: for any
    polynomial-coefficient constant-coefficient fractional Riccati equation
    <math|D<rsup|\<mu\>>*y=P<around|(|u|)>+Q<around|(|u|)>*y+R<around|(|u|)>*y<rsup|2>>
    with <math|\<mu\>\<in\><around|(|0,1|]>>, the unique solution
    <math|y<around|(|t,u|)>> is the limit of its diagonal Müntz--Padé
    approximants <math|y<rsub|M><around|(|t,u|)>>, whose numerator and
    denominator polynomials are generated entirely by polynomial operations
    over <math|<C><around|[|u|]>> through the Chebyshev--Wheeler recurrence
    on the moment functional <math|<Lk><around|[|x<rsup|k>|]>=a<around|(|k,u|)>>
    defined by the Müntz--Tau expansion. The theorem is closed under time
    integration and fractional integration: the cumulant generating function
    <math|\<kappa\><around|(|T,u|)>> of the rough Heston model, which is the
    exponent of the log-price characteristic function, is itself a
    Müntz--Padé expansion on the same fractional lattice, with moment
    coefficients <math|d*<around|(|k,u|)>> that are affinely linear in the
    pair <math|<around|(|a<around|(|k-1,u|)>,<space|0.17em>a<around|(|k,u|)>|)>>.
    The entire rough Heston characteristic function is therefore computable
    by a single <math|O<around|(|M<rsup|2>|)>> Chebyshev--Wheeler pass over
    <math|<around|{|d*<around|(|k,u|)>|}>>, with no ODE time-stepping, no
    quadrature, and no per-frequency Newton iteration.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Preliminaries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Müntz\UTau Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    Chebyshev\UWheeler Recurrence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    Fractional Riccati\UMüntz\UPadé Theorem>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Closure
    Under Integration: The Rough Heston Application>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <with|par-left|1tab|6.1<space|2spc>Rough Heston setup
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|6.2<space|2spc>Termwise integration
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|6.3<space|2spc>Reindexing onto the common lattice
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|6.4<space|2spc>The <with|color|dark
    red|font-family|rm|<with|mode|math|d*<around|(|k,u|)>>> coefficients
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Closure
    Theorem and the <with|color|dark red|font-family|rm|<with|mode|math|\<kappa\>>>
    Approximant> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Structural
    Summary> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:intro>

  The fractional (Riemann\ULiouville) Riccati equation

  <\equation>
    D<rsup|\<mu\>>*y<around|(|t,u|)>=P<around|(|u|)>+Q<around|(|u|)>*<space|0.17em>y<around|(|t,u|)>+R<around|(|u|)>*<space|0.17em>y<around|(|t,u|)><rsup|2>,<space|2em>I<rsup|1-\<mu\>>*y<around|(|0,u|)>=0,<label|eq:fRiccati>
  </equation>

  with <math|\<mu\>\<in\><around|(|0,1|]>> and
  <math|P,Q,R\<in\><C><around|[|u|]>>, arises in mathematical finance as the
  governing equation for the Laplace exponent of affine stochastic volatility
  models with fractional noise. In particular, the rough Heston model of El
  Euch and Rosenbaum <cite|ElEuchRosenbaum2019> reduces pricing of European
  options to evaluating the characteristic function

  <\equation>
    \<varphi\><rsub|T><around|(|u|)>=exp <space|-0.17em><around*|(|\<kappa\><around|(|T,u|)>|)>,<space|2em>\<kappa\><around|(|T,u|)>=\<theta\>*<big|int><rsub|0><rsup|T>h*<around|(|s,u|)>*<space|0.17em>d*s+V<rsub|0>*<space|0.17em>I<rsup|1-\<alpha\>>*h*<around|(|T,u|)>,<label|eq:phiT>
  </equation>

  where <math|h*<around|(|t,u|)>> satisfies <eqref|eq:fRiccati> with exponent
  <math|\<mu\>=H+<tfrac|1|2>> and specific rough-Heston parameters
  <math|<around|(|P,Q,R|)>>.

  Classical numerical methods for <eqref|eq:fRiccati> \V
  Adams\UBashforth\UMoulton fractional integrators <cite|Diethelm2004>,
  hybrid Adams schemes <cite|GatheralRadoicic2019> \V must be re-executed for
  every Fourier frequency <math|u> on the pricing grid, incurring
  <math|O<around|(|N<rsup|2>|)>> cost per evaluation. Rational approximation
  methods <cite|GatheralRadoicic2019|AbiJaberElEuch2019> reduce this cost but
  lack a systematic convergence theory rooted in the structure of
  <eqref|eq:fRiccati>.

  The present note provides that theory. The <em|Fractional
  Riccati\UMüntz\UPadé Theorem> (<localize|Theorem><nbsp><reference|thm:FRMP>)
  asserts that <math|y<around|(|t,u|)>> is the limit of its diagonal
  <math|<around|[|M/M|]>> Padé approximants in the variable
  <math|z=t<rsup|\<mu\>>>, whose denominator is the <math|M>-th orthogonal
  polynomial of the moment functional defined by the Müntz\UTau expansion of
  <math|y>. The Chebyshev\UWheeler recurrence
  (<localize|Section><nbsp><reference|sec:CW>) generates these polynomials by
  literal equalities over <math|<C><around|[|u|]>>, with no
  Hankel-determinant formation. <localize|Theorem><nbsp><reference|thm:closure>
  then establishes that <math|\<kappa\><around|(|T,u|)>> is itself a
  Müntz\UPadé series on the same lattice, with coefficients
  <math|d*<around|(|k,u|)>> computed in closed form from
  <math|a<around|(|k,u|)>> and <math|a<around|(|k-1,u|)>>
  (<localize|Corollary><nbsp><reference|cor:dk>). The entire rough Heston
  characteristic function is therefore obtained by running the
  Chebyshev\UWheeler recurrence once, symbolically, over the sequence
  <math|<around|{|d*<around|(|k,u|)>|}>>.

  <section|Preliminaries><label|sec:prelim>

  <\definition>
    [Riemann\ULiouville operators]<label|def:RL>For
    <math|\<mu\>\<in\><around|(|0,1|]>> and <math|f> locally integrable on
    <math|<around|(|0,\<infty\>|)>>, define

    <\equation*>
      I<rsup|\<mu\>>*f<around|(|t|)>\<assign\><frac|1|\<Gamma\><around|(|\<mu\>|)>>*<big|int><rsub|0><rsup|t><around|(|t-s|)><rsup|\<mu\>-1>*f<around|(|s|)>*<space|0.17em>d*s,<space|2em>D<rsup|\<mu\>>*f<around|(|t|)>\<assign\><frac|d|d*t>*<around*|(|I<rsup|1-\<mu\>>*f|)><around|(|t|)>.
    </equation*>

    The power rule reads

    <\equation>
      I<rsup|\<mu\>>*<space|0.17em>t<rsup|s>=<frac|\<Gamma\>*<around|(|s+1|)>|\<Gamma\>*<around|(|s+\<mu\>+1|)>>*<space|0.17em>t<rsup|s+\<mu\>>,<space|2em>s\<gtr\>-1.<label|eq:powerrule>
    </equation>

    The initial condition <math|I<rsup|1-\<mu\>>*y<around|(|0,u|)>=0> (rather
    than <math|y<around|(|0,u|)>=0>) is the natural Riemann\ULiouville
    null-initial-value condition; it is equivalent to requiring
    <math|y<around|(|t,u|)>=O<around|(|t<rsup|\<mu\>>|)>> as
    <math|t\<to\>0<rsup|+>>.
  </definition>

  <\definition>
    [Volterra formulation]<label|def:Volterra>Applying <math|I<rsup|\<mu\>>>
    to both sides of <eqref|eq:fRiccati> and using
    <math|I<rsup|\<mu\>>*D<rsup|\<mu\>>*y=y> (under the null initial
    condition), <eqref|eq:fRiccati> is equivalent to the Volterra integral
    equation

    <\equation>
      y<around|(|t,u|)>=I<rsup|\<mu\>>*<space|-0.17em><around*|[|P<around|(|u|)>+Q<around|(|u|)>*<space|0.17em>y<around|(|t,u|)>+R<around|(|u|)>*<space|0.17em>y<around|(|t,u|)><rsup|2>|]>.<label|eq:Volterra>
    </equation>
  </definition>

  <\definition>
    [Moment functional and generating series]<label|def:moment>Given a
    sequence <math|<around|{|c<around|(|k|)>|}><rsub|k\<ge\>0>\<subset\><C><around|[|u|]>>,
    the <em|moment functional> <math|<Lk>:<C><around|[|x|]>\<to\><C><around|[|u|]>>
    is defined by <math|<Lk><around|[|x<rsup|k>|]>\<assign\>c<around|(|k|)>>.
    The associated <em|generating series> is
    <math|g<around|(|z|)>\<assign\><big|sum><rsub|k\<ge\>0>c<around|(|k|)>*<space|0.17em>z<rsup|k>>.
    The functional <math|<Lk>> is <em|quasi-definite> if the Hankel
    determinants <math|H<rsub|n>\<assign\>det
    <around*|(|c*<around|(|i+j|)>|)><rsub|0\<le\>i,j\<le\>n-1>> are nonzero
    elements of <math|<C><around|[|u|]>> for all <math|n\<ge\>1>.
  </definition>

  <section|The Müntz\UTau Expansion><label|sec:Muntz>

  <\lemma>
    [Müntz\UTau coefficient recurrence]<label|lem:Muntz>The unique solution
    of <eqref|eq:Volterra> admits the Müntz\UPuiseux expansion

    <\equation>
      y<around|(|t,u|)>=<big|sum><rsub|k=0><rsup|\<infty\>>a<around|(|k,u|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>,<label|eq:Muntzseries>
    </equation>

    converging absolutely for <math|t\<in\><around|[|0,T<rsub|0>|]>> for some
    <math|T<rsub|0>\<gtr\>0>, where the coefficients
    <math|a<around|(|k,u|)>\<in\><C><around|[|u|]>> satisfy

    <\align>
      <tformat|<table|<row|<cell|a<around|(|0,u|)>>|<cell|=<frac|P<around|(|u|)>|\<Gamma\>*<around|(|\<mu\>+1|)>>,<eq-number><label|eq:a0>>>|<row|<cell|a<around|(|k,u|)>>|<cell|=<frac|\<Gamma\>*<around|(|<around|(|k-1|)>*\<mu\>+1|)>|\<Gamma\>*<around|(|k*\<mu\>+1|)>>*<around*|(|Q<around|(|u|)>*<space|0.17em>a<around|(|k-1,u|)>+R<around|(|u|)>*<space|-0.17em><space|-0.17em><big|sum><rsub|<stack|<tformat|<table|<row|<cell|j+\<ell\>=k-1>>|<row|<cell|j,\<ell\>\<ge\>0>>>>>><space|-0.17em><space|-0.17em>a<around|(|j,u|)>*<space|0.17em>a<around|(|\<ell\>,u|)>|)>,<space|1em>k\<ge\>1.<eq-number><label|eq:ak>>>>>
    </align>
  </lemma>

  <\proof>
    Substitute the ansatz <eqref|eq:Muntzseries> into <eqref|eq:Volterra>.
    Using the power rule <eqref|eq:powerrule>:

    <\equation>
      I<rsup|\<mu\>>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>=<frac|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+\<mu\>+1|)>>*<space|0.17em>t<rsup|<around|(|k+2|)>*\<mu\>>=<frac|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k+2|)>*\<mu\>+1|)>>*<space|0.17em>t<rsup|<around|(|k+2|)>*\<mu\>>
    </equation>

    The linear term contributes

    <\equation>
      I<rsup|\<mu\>>*<space|-0.17em><around*|[|Q<around|(|u|)>*<space|0.17em>y|]>=Q<around|(|u|)>*<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)><space|0.17em><frac|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k+2|)>*\<mu\>+1|)>>*<space|0.17em>t<rsup|<around|(|k+2|)>*\<mu\>>
    </equation>

    Shifting the summation index <math|k\<mapsto\>k-1> and extracting the
    coefficient of <math|t<rsup|<around|(|k+1|)>*\<mu\>>> gives the
    <math|Q>-contribution to <math|a<around|(|k,u|)>> as

    <\equation>
      <frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>>*<space|0.17em>Q<around|(|u|)>*<space|0.17em>a<around|(|k-1,u|)>
    </equation>

    The quadratic term <math|I<rsup|\<mu\>>*<around|[|R<around|(|u|)>*y<rsup|2>|]>>
    involves the Cauchy product <math|>

    <\equation>
      y<around*|(|t,u|)><rsup|2>=<big|sum><rsub|n\<ge\>0><around*|(|<big|sum><rsub|j+\<ell\>=n>a<around|(|j,u|)>*a<around|(|\<ell\>,u|)>|)>*t<rsup|<around|(|n+2|)>*\<mu\>>
    </equation>

    Applying <math|I<rsup|\<mu\>>> and extracting the coefficient of
    <math|t<rsup|<around|(|k+1|)>*\<mu\>>> (setting <math|n=k-1>) gives

    <\equation>
      <frac|\<Gamma\>*<around|(|<around|(|k-1|)>*\<mu\>+2|)>|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>>*<space|0.17em>R<around|(|u|)>*<space|-0.17em><space|-0.17em><big|sum><rsub|j+\<ell\>=k-1><space|-0.17em>a<around|(|j,u|)>*a<around|(|\<ell\>,u|)>
    </equation>

    Combining and using

    \ 

    <\equation>
      <frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>>=\<Gamma\>*<around|(|<around|(|k-1|)>*\<mu\>+1|)>/\<Gamma\>*<around|(|k*\<mu\>+1|)>\<cdot\>\<Gamma\>*<around|(|k*\<mu\>+1|)><rsup|2>/<around*|(|\<Gamma\>*<around|(|<around|(|k-1|)>*\<mu\>+1|)>*\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>|)>
    </equation>

    the balance simplifies to the stated recurrence <eqref|eq:ak> upon
    matching coefficients of <math|t<rsup|<around|(|k+1|)>*\<mu\>>> at each
    order <math|k\<ge\>1>. Local existence and uniqueness follow from the
    Banach fixed-point theorem applied to the Volterra operator
    <math|\<cal-T\><around|[|y|]>\<assign\>I<rsup|\<mu\>>*<around|(|P+Q*y+R*y<rsup|2>|)>>
    on the ball <math|<around|{|y:<around|\<\|\|\>|y|\<\|\|\>><rsub|\<infty\>>\<le\>2<around|\<\|\|\>|a<around|(|0,u|)>|\<\|\|\>>*T<rsub|0><rsup|\<mu\>>|}>>\<in\><math|C<around|(|<around|[|0,T<rsub|0>|]>;<C><around|[|u|]>|)>>,
    which is a strict contraction for <math|T<rsub|0>> sufficiently small
    depending on <math|<around|\<\|\|\>|Q|\<\|\|\>>,<around|\<\|\|\>|R|\<\|\|\>>,<around|\<\|\|\>|a<around|(|0|)>|\<\|\|\>>>.
  </proof>

  <\lemma>
    [Meromorphic continuation of <math|g<around|(|z,u|)>>]<label|lem:meromorphic>Assume
    <math|R<around|(|u|)>\<nequiv\>0>. The generating series
    <math|g<around|(|z,u|)>\<assign\><big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*<space|0.17em>z<rsup|k>>
    extends to a meromorphic function on all of <math|<C>> in the variable
    <math|z>.
  </lemma>

  <\proof>
    Note first that Cole\UHopf and Bernoulli linearisations are unavailable
    for <math|\<mu\>\<ne\>1>: the fractional Leibniz rule
    <math|D<rsup|\<mu\>>*<around|(|f*g|)>=<big|sum><rsub|j=0><rsup|\<infty\>><binom|\<mu\>|j>f<rsup|<around|(|j|)>>*g<rsup|<around|(|\<mu\>-j|)>>>
    has infinitely many correction terms, so neither
    <math|y=-R<rsup|-1>*D<rsup|\<mu\>>*w/w> nor <math|y=y<rsub|\<ast\>>+1/w>
    reduces <eqref|eq:fRiccati> to a linear equation when
    <math|\<mu\>\<ne\>1>.

    <with|font-series|bold|Step 1: Quadratic functional equation for
    <math|g>.> Define the entire functions

    <\equation>
      <wide|P|~><around|(|z|)>\<assign\><big|sum><rsub|k=0><rsup|\<infty\>><frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>>*<space|0.17em>z<rsup|k><label|eq:PQRtilde>
    </equation>

    <\equation>
      <wide|Q|~><around|(|z|)>=<wide|R|~><around|(|z|)>\<assign\><big|sum><rsub|k=0><rsup|\<infty\>><frac|\<Gamma\>*<around|(|k*\<mu\>+1|)>|\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>>*<space|0.17em>z<rsup|k+1>
    </equation>

    The coefficients satisfy <math|\<Gamma\>*<around|(|k*\<mu\>+1|)>/\<Gamma\>*<around|(|<around|(|k+1|)>*\<mu\>+1|)>=1/<around*|(|<around|(|k*\<mu\>+1|)>*<around|(|k*\<mu\>+2|)>*\<cdots\>*<around|(|<around|(|k+1|)>*\<mu\>|)>|)>\<le\>1/<around|(|k*\<mu\>|)>!\<to\>0>,
    so the ratio of consecutive coefficients tends to <math|0>; by the ratio
    test both series converge for all <math|z\<in\><C>> and define entire
    functions.

    Now substitute the Ansatz <math|y<around|(|t,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<mu\>>>
    into the Volterra equation <eqref|eq:Volterra> and collect the
    coefficient of <math|t<rsup|<around|(|k+1|)>*\<mu\>>>. The constant term
    gives <math|a<around|(|0,u|)>=P<around|(|u|)>/\<Gamma\>*<around|(|\<mu\>+1|)>>.
    For <math|k\<ge\>1>, the recurrence <eqref|eq:ak> expresses
    <math|a<around|(|k,u|)>> as a linear combination of
    <math|Q<around|(|u|)>*a<around|(|k-1,u|)>> and
    <math|R<around|(|u|)>*<big|sum><rsub|j+\<ell\>=k-1>a<around|(|j,u|)>*a<around|(|\<ell\>,u|)>>,
    each multiplied by the gamma-ratio <math|\<Gamma\>*<around|(|<around|(|k-1|)>*\<mu\>+1|)>/\<Gamma\>*<around|(|k*\<mu\>+1|)>>.
    Multiplying the recurrence by <math|z<rsup|k>> and summing over
    <math|k\<ge\>1> converts it into the identity

    <\equation>
      g<around|(|z,u|)>=P<around|(|u|)>*<wide|P|~><around|(|z|)>+Q<around|(|u|)>*<wide|Q|~><around|(|z|)>*<space|0.17em>g<around|(|z,u|)>+R<around|(|u|)>*<wide|R|~><around|(|z|)>*<space|0.17em>g<around|(|z,u|)><rsup|2>,<label|eq:gVolterra>
    </equation>

    where the <math|<wide|Q|~>*g> term arises from the linear part and the
    <math|<wide|R|~>*g<rsup|2>> term from the Cauchy-product square, with the
    factor <math|z> in <math|<wide|Q|~>=<wide|R|~>> accounting for the index
    shift <math|k\<mapsto\>k-1>. Rearranging <eqref|eq:gVolterra>:

    <\equation>
      R<around|(|u|)>*<space|0.17em><wide|R|~><around|(|z|)>*<space|0.17em>g<around|(|z,u|)><rsup|2>-<around*|(|1-Q<around|(|u|)>*<space|0.17em><wide|Q|~><around|(|z|)>|)>*<space|0.17em>g<around|(|z,u|)>+P<around|(|u|)>*<space|0.17em><wide|P|~><around|(|z|)>=0.<label|eq:gquadratic>
    </equation>

    <with|font-series|bold|Step 2: Meromorphic continuation.> Equation
    <eqref|eq:gquadratic> is a quadratic in <math|g<around|(|z,u|)>> whose
    coefficients <math|R<around|(|u|)>*<wide|R|~><around|(|z|)>>,
    <math|1-Q<around|(|u|)>*<wide|Q|~><around|(|z|)>>, and
    <math|P<around|(|u|)>*<wide|P|~><around|(|z|)>> are entire functions of
    <math|z> (products of a nonzero constant in <math|z> with an entire
    function). The discriminant is

    <\equation*>
      \<Delta\><around|(|z,u|)>\<assign\><around*|(|1-Q<around|(|u|)>*<wide|Q|~><around|(|z|)>|)><rsup|2>-4*R<around|(|u|)>*P<around|(|u|)>*<space|0.17em><wide|R|~><around|(|z|)>*<wide|P|~><around|(|z|)>,
    </equation*>

    which is entire in <math|z>. The two branches of <math|g> are

    <\equation>
      g<rsub|\<pm\>><around|(|z,u|)>=<frac|<around*|(|1-Q<around|(|u|)>*<wide|Q|~><around|(|z|)>|)>\<pm\><sqrt|\<Delta\><around|(|z,u|)>>|2*R<around|(|u|)>*<wide|R|~><around|(|z|)>>.<label|eq:gpm>
    </equation>

    The denominator <math|2*R<around|(|u|)>*<wide|R|~><around|(|z|)>=2*R<around|(|u|)>*z*<wide|P|~><around|(|z|)>>
    vanishes only at the isolated zeros of <math|<wide|P|~><around|(|z|)>>
    and at <math|z=0>. At <math|z=0>: <math|<wide|R|~><around|(|0|)>=0> and
    <math|<wide|P|~><around|(|0|)>=1/\<Gamma\>*<around|(|\<mu\>+1|)>\<ne\>0>,
    so the apparent singularity at <math|z=0> is removable (L'Hôpital or
    direct Taylor expansion confirms <math|g<around|(|0,u|)>=P<around|(|u|)>/\<Gamma\>*<around|(|\<mu\>+1|)>>,
    matching <math|a<around|(|0,u|)>>). The zeros of
    <math|<wide|P|~><around|(|z|)>> in the denominator of <eqref|eq:gpm> are
    isolated and produce at worst poles of <math|g>. The branch points of
    <math|<sqrt|\<Delta\>>> are the zeros of
    <math|\<Delta\><around|(|z,u|)>>, which are also isolated; standard
    single-valued continuation around each branch point shows that <math|g>
    is meromorphic on <math|<C>\<setminus\>\<Delta\><rsub|g><around|(|u|)>>
    where <math|\<Delta\><rsub|g><around|(|u|)>> is a compact set of analytic
    arcs (the Stahl compact) connecting the branch points in pairs.

    The branch <math|g<rsub|->> is selected by the condition
    <math|g<around|(|0,u|)>=a<around|(|0,u|)>>: evaluating <eqref|eq:gpm> at
    <math|z=0> using <math|<wide|Q|~><around|(|0|)>=0>,
    <math|<wide|R|~><around|(|0|)>=0>, <math|<wide|P|~><around|(|0|)>=1/\<Gamma\>*<around|(|\<mu\>+1|)>>
    shows <math|g<rsub|-><around|(|0,u|)>=P<around|(|u|)>/\<Gamma\>*<around|(|\<mu\>+1|)>=a<around|(|0,u|)>>
    as required. Therefore <math|g<around|(|z,u|)>=g<rsub|-><around|(|z,u|)>>
    is meromorphic on <math|<C>>.
  </proof>

  <section|The Chebyshev\UWheeler Recurrence><label|sec:CW>

  <\definition>
    [Generating polynomials]<label|def:Snz>Given the moment functional
    <math|<Lk><around|[|x<rsup|k>|]>=a<around|(|k,u|)>>, define the
    generating polynomials <math|S<around|(|n,z|)>\<in\><C><around|[|u|]><around|(|<space|-0.17em><around|(|z|)><space|-0.17em>|)>>
    by

    <\equation>
      S<around|(|n,z|)>=<frac|S<around|(|n-1,z|)>|z>-\<alpha\>*<around|(|n-1|)>*<space|0.17em>S<around|(|n-1,z|)>-\<beta\>*<around|(|n-1|)>*<space|0.17em>S<around|(|n-2,z|)>,<space|1em>n\<ge\>1,<label|eq:CWrecurrence>
    </equation>

    initialized by <math|S<around|(|-1,z|)>=1> and

    <\equation>
      S<around|(|0,z|)>=g<around|(|z,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*<space|0.17em>z<rsup|k>
    </equation>

    , where <math|\<alpha\><around|(|n|)>,\<beta\><around|(|n|)>\<in\><C><around|[|u|]>>
    are determined by the requirement <math|<ord><rsub|z>S<around|(|n,z|)>\<ge\>n>.
  </definition>

  <\lemma>
    [Literal equality of the Wheeler formulas]<label|lem:Wheeler>Under the
    ord-condition of <localize|Definition><nbsp><reference|def:Snz>, the
    recurrence coefficients satisfy the literal equalities in
    <math|<C><around|[|u|]><around|(|<space|-0.17em><around|(|z|)><space|-0.17em>|)>>:

    <\equation>
      \<alpha\><around|(|n|)>=-<frac|S<around|(|n+1,z|)>|S<around|(|n,z|)>>
    </equation>

    <\equation>
      \<beta\><around|(|n|)>=<frac|S<around|(|n,z|)>|z*<space|0.17em>S<around|(|n-1,z|)>><label|eq:Wheeler>
    </equation>

    \;

    In particular, both ratios are <math|z>-independent elements of
    <math|<C><around|[|u|]>>.
  </lemma>

  <\proof>
    We prove <math|z>-independence of each ratio inductively.

    <with|font-series|bold|Base case.> From the initialization,
    <math|S<around|(|-1,z|)>=1> and <math|S<around|(|0,z|)>=g<around|(|z,u|)>=a<around|(|0,u|)>+O<around|(|z|)>>.
    The recurrence at <math|n=1> gives

    <\equation>
      S<around|(|1,z|)>=<frac|g<around|(|z,u|)>|z>-\<alpha\><around|(|0|)>*<space|0.17em>g<around|(|z,u|)>-\<beta\><around|(|0|)>\<cdot\>1
    </equation>

    For <math|<ord><rsub|z>S<around|(|1,z|)>\<ge\>1>, the constant term (in
    <math|z>) of <math|S<around|(|1,z|)>> must vanish. The term
    <math|g<around|(|z,u|)>/z=a<around|(|0,u|)>/z+a<around|(|1,u|)>+O<around|(|z|)>>
    contributes <math|a<around|(|0,u|)>/z> at order <math|z<rsup|-1>>. Since
    <math|\<alpha\><around|(|0|)>*<space|0.17em>g<around|(|z,u|)>> and
    <math|\<beta\><around|(|0|)>> are <math|O<around|(|1|)>> in <math|z>, the
    <math|z<rsup|-1>> term is <math|a<around|(|0,u|)>/z>, which is not in
    <math|<C><around|[|u|]><around|[|<around|[|z|]>|]>> unless we
    reinterpret: <math|S<around|(|0,z|)>/z=a<around|(|0,u|)>*z<rsup|-1>+\<cdots\>>
    has order <math|-1> in <math|z>, while
    <math|<ord>S<around|(|1,z|)>\<ge\>1>, so the recurrence is an equality in
    <math|<C><around|[|u|]><around|(|<space|-0.17em><around|(|z|)><space|-0.17em>|)>>
    and the divisibility constraints uniquely fix
    <math|\<alpha\><around|(|0|)>> and <math|\<beta\><around|(|0|)>> by
    clearing all terms of order <math|\<less\>1>. With
    <math|S<around|(|0,z|)>> having order <math|0> and
    <math|S<around|(|-1,z|)>=z<rsup|0>> (order <math|0>), the ratio
    <math|S<around|(|1,z|)>/<around|(|z*<space|0.17em>S<around|(|0,z|)>|)>>
    has order <math|\<ge\>0> in <math|z>; the ord-condition forces this ratio
    to be <math|z>-constant, hence an element of <math|<C><around|[|u|]>>
    equal to <math|\<beta\><around|(|1|)>> at the next step.

    <with|font-series|bold|Inductive step.> Suppose
    <math|<ord><rsub|z>S<around|(|n-1,z|)>\<ge\>n-1> and
    <math|<ord><rsub|z>S<around|(|n,z|)>\<ge\>n>. Write
    <math|S<around|(|n,z|)>=z<rsup|n>*<space|0.17em>U<around|(|n,z|)>> and
    <math|S<around|(|n-1,z|)>=z<rsup|n-1>*<space|0.17em>U<around|(|n-1,z|)>>
    with <math|U<around|(|n,0|)>,U<around|(|n-1,0|)>\<in\><C><around|[|u|]><rsup|\<times\>>>
    (units). Then

    <\equation>
      <frac|S<around|(|n,z|)>|z*<space|0.17em>S<around|(|n-1,z|)>>=<frac|z<rsup|n>*<space|0.17em>U<around|(|n,z|)>|z<rsup|n>*<space|0.17em>U<around|(|n-1,z|)>>=<frac|U<around|(|n,z|)>|U<around|(|n-1,z|)>>
    </equation>

    which is a unit in <math|<C><around|[|u|]><around|[|<around|[|z|]>|]>>.
    The ord-condition at level <math|n+1> forces
    <math|<ord><rsub|z>S<around|(|n+1,z|)>\<ge\>n+1>, which requires the
    ratio <math|U<around|(|n,z|)>/U<around|(|n-1,z|)>> to be
    <math|z>-constant: any <math|z>-dependence would propagate into
    <math|S<around|(|n+1,z|)>> through the recurrence <eqref|eq:CWrecurrence>
    and violate <math|<ord>S<around|(|n+1,z|)>\<ge\>n+1>. Therefore
    <math|\<beta\><around|(|n|)>=U<around|(|n,0|)>/U<around|(|n-1,0|)>\<in\><C><around|[|u|]>>.
    An identical argument gives <math|\<alpha\><around|(|n|)>=-U<around|(|n+1,0|)>/U<around|(|n,0|)>\<in\><C><around|[|u|]>>
    from <math|<ord>S<around|(|n+1,z|)>\<ge\>n+1>. This establishes
    <eqref|eq:Wheeler> as literal equalities in
    <math|<C><around|[|u|]><around|(|<space|-0.17em><around|(|z|)><space|-0.17em>|)>>.
  </proof>

  <\proposition>
    [Orthogonal polynomial denominators]<label|prop:OPdenominator>The
    polynomials <math|P<around|(|n,x,u|)>\<in\><C><around|[|u|]><around|[|x|]>>
    defined by

    <\equation>
      P<around|(|n,x|)>=<around*|(|x-\<alpha\>*<around|(|n-1|)>|)>*<space|0.17em>P<around|(|n-1,x|)>-\<beta\>*<around|(|n-1|)>*<space|0.17em>P<around|(|n-2,x|)><label|eq:OPrecurrence>
    </equation>

    with initial conditions <math|P<around|(|-1,x|)>=0,P<around|(|0,x|)>=1>
    with <math|\<alpha\><around|(|n|)>,\<beta\><around|(|n|)>> from
    <localize|Lemma><nbsp><reference|lem:Wheeler>, satisfy
    <math|<Lk><around|[|P<around|(|m,x|)>*<space|0.17em>P<around|(|n,x|)>|]>=0>
    for <math|m\<ne\>n>, i.e., they are orthogonal with respect to
    <math|<Lk>>. Furthermore, the denominator
    <math|Q<rsub|M>*<around|(|z,u|)>> of the diagonal <math|<around|[|M/M|]>>
    Padé approximant of <math|g<around|(|z,u|)>> satisfies

    <\equation>
      Q<rsub|M>*<around|(|z,u|)>=z<rsup|M>*<space|0.17em>P<around|(|M,z<rsup|-1>,u|)>.<label|eq:PadeOP>
    </equation>
  </proposition>

  <\proof>
    The three-term recurrence <eqref|eq:OPrecurrence> is the standard Favard
    construction; orthogonality follows from the quasi-definiteness of
    <math|<Lk>> (equivalently, <math|H<rsub|n><around|(|u|)>\<ne\>0> for all
    <math|n>) by the standard argument (see, e.g., <cite|Chihara1978>).
    Equation <eqref|eq:PadeOP> is Gragg's theorem <cite|Gragg1974>: the
    denominator of the <math|<around|[|M/M|]>> Padé approximant of a formal
    power series <math|<big|sum>c<rsub|k>*z<rsup|k>> is the reciprocal
    polynomial of the <math|M>-th orthogonal polynomial for the moment
    functional <math|<Lk><around|[|x<rsup|k>|]>=c<rsub|k>>.
  </proof>

  <section|The Fractional Riccati\UMüntz\UPadé
  Theorem><label|sec:maintheorem>

  <\theorem>
    [Fractional Riccati\UMüntz\UPadé]<label|thm:FRMP>Under the
    quasi-definiteness hypothesis <math|H<rsub|n><around|(|u|)>\<ne\>0> in
    <math|<C><around|[|u|]>> for all <math|n\<ge\>1> (satisfied generically
    when <math|P<around|(|u|)>*R<around|(|u|)>\<nequiv\>0>), the diagonal
    Müntz\UPadé approximants

    <\equation>
      y<rsub|M><around|(|t,u|)>\<assign\><frac|P<rsub|M><around|(|t<rsup|\<mu\>>,u|)>|t<rsup|\<mu\>*M>*<space|0.17em>P<around|(|M,t<rsup|-\<mu\>>,u|)>><label|eq:yM>
    </equation>

    converge to the unique solution <math|y<around|(|t,u|)>> of
    <eqref|eq:fRiccati>:

    <\equation>
      y<around|(|t,u|)>=lim<rsub|M\<to\>\<infty\>>
      y<rsub|M><around|(|t,u|)>,<label|eq:convergence>
    </equation>

    with convergence in capacity on compact subsets of
    <math|<around|{|<around|\||z|\|>\<less\>\<infty\>|}>\<setminus\>\<Delta\><rsub|g><around|(|u|)>>,
    where <math|\<Delta\><rsub|g><around|(|u|)>> is the Stahl compact of
    <math|g<around|(|z,u|)>>.
  </theorem>

  <\proof>
    By <localize|Lemma><nbsp><reference|lem:Muntz>, the solution
    <math|y<around|(|t,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*t<rsup|<around|(|k+1|)>*\<mu\>>>
    corresponds, under the substitution <math|z=t<rsup|\<mu\>>>, to the power
    series <math|z*<space|0.17em>g<around|(|z,u|)>> where
    <math|g<around|(|z,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*z<rsup|k>>.
    By <localize|Lemma><nbsp><reference|lem:meromorphic>,
    <math|g<around|(|z,u|)>> satisfies the quadratic functional equation
    <eqref|eq:gquadratic> with entire coefficients and hence extends to a
    meromorphic function on <math|<C>>.

    By <localize|Proposition><nbsp><reference|prop:OPdenominator>, the
    denominator of the <math|<around|[|M/M|]>> Padé approximant of
    <math|g<around|(|z,u|)>> is <math|z<rsup|M>*P<around|(|M,z<rsup|-1>,u|)>>,
    so

    <\equation*>
      g<rsub|M><around|(|z,u|)>=<frac|P<rsub|M><around|(|z,u|)>|z<rsup|M>*P<around|(|M,z<rsup|-1>,u|)>>,
    </equation*>

    and <math|y<rsub|M><around|(|t,u|)>=t<rsup|\<mu\>>*<space|0.17em>g<rsub|M><around|(|t<rsup|\<mu\>>,u|)>>,
    which matches <eqref|eq:yM>.

    By the Nuttall\UPommerenke\UStahl theorem <cite|Stahl1997>, since
    <math|g<around|(|z,u|)>> is meromorphic on <math|<C>>, the diagonal Padé
    sequence <math|<around|{|g<rsub|M><around|(|z,u|)>|}><rsub|M\<ge\>1>>
    converges to <math|g<around|(|z,u|)>> in capacity on compact subsets of
    <math|<C>\<setminus\>\<Delta\><rsub|g><around|(|u|)>>. Under
    quasi-definiteness of <math|<Lk>> and the generic absence of Froissart
    doublets (i.e., spurious pole-zero cancellations) as elements of
    <math|<C><around|[|u|]>>, convergence upgrades to uniform on compacta
    away from the poles of <math|g>. Evaluating at <math|z=t<rsup|\<mu\>>>
    and multiplying by <math|t<rsup|\<mu\>>> yields <eqref|eq:convergence>.
  </proof>

  <\remark>
    All polynomial operations \V the Tau recurrence <eqref|eq:ak>, the
    Chebyshev\UWheeler recurrence <eqref|eq:CWrecurrence>, and the orthogonal
    polynomial recurrence <eqref|eq:OPrecurrence> \V are executed over
    <math|<C><around|[|u|]>>. The result is a rational approximant
    <math|y<rsub|M><around|(|t,u|)>> whose numerator and denominator
    coefficients are elements of <math|<C><around|[|u|]>>, evaluated at a
    specific <math|u> only at the last step. This is the operative
    computational virtue: the symbolic pass is performed once at cost
    <math|O<around|(|M<rsup|2>|)>> polynomial operations in
    <math|<C><around|[|u|]>>; subsequent evaluations over a Fourier grid in
    <math|u> reduce to polynomial substitution.
  </remark>

  <section|Closure Under Integration: The Rough Heston
  Application><label|sec:roughHeston>

  <subsection|Rough Heston setup>

  In the rough Heston model <cite|ElEuchRosenbaum2019>, <eqref|eq:fRiccati>
  is instantiated with

  <\equation>
    P<around|(|u|)>=<tfrac|1|2><around|(|-u<rsup|2>-i*u|)>,<space|1em>Q<around|(|u|)>=i*u*\<rho\>*\<nu\>-\<lambda\>,<space|1em>R<around|(|u|)>=<tfrac|1|2>\<nu\><rsup|2>,<space|1em>\<mu\>=H+<tfrac|1|2><eqqcolon>\<alpha\>\<in\><around|(|<tfrac|1|2>,1|)>,<label|eq:roughHparams>
  </equation>

  where <math|H\<in\><around|(|0,<tfrac|1|2>|)>> is the Hurst exponent,
  <math|\<lambda\>\<gtr\>0> is mean reversion, <math|\<nu\>\<gtr\>0> is
  volatility of volatility, and <math|\<rho\>\<in\><around|(|-1,1|)>> is
  correlation. All three of <math|P,Q,R> lie in <math|<C><around|[|u|]>>, so
  <localize|Theorem><nbsp><reference|thm:FRMP> applies directly. Writing
  <math|<Lk><around|[|x<rsup|k>|]>=a<around|(|k,u|)>> for the resulting
  moment functional, the characteristic function is
  <math|\<varphi\><rsub|T><around|(|u|)>=exp
  <around|(|\<kappa\><around|(|T,u|)>|)>> with <math|\<kappa\>> as in
  <eqref|eq:phiT>.

  <subsection|Termwise integration>

  <\lemma>
    [Time-integral Müntz coefficients]<label|lem:timeintegral>With
    <math|h*<around|(|t,u|)>=<big|sum><rsub|k\<ge\>0>a<around|(|k,u|)>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<alpha\>>>,

    <\equation>
      \<theta\>*<big|int><rsub|0><rsup|T>h*<around|(|s,u|)>*<space|0.17em>d*s=\<theta\>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|a<around|(|k,u|)>|<around|(|k+1|)>*\<alpha\>+1>*<space|0.17em>T<rsup|<around|(|k+1|)>*\<alpha\>+1>.<label|eq:timeintegral>
    </equation>
  </lemma>

  <\proof>
    Integrate termwise: <math|<big|int><rsub|0><rsup|T>s<rsup|<around|(|k+1|)>*\<alpha\>>*<space|0.17em>d*s=T<rsup|<around|(|k+1|)>*\<alpha\>+1>/<around|(|<around|(|k+1|)>*\<alpha\>+1|)>>.
    Termwise integration is justified by the absolute convergence of
    <eqref|eq:Muntzseries> on <math|<around|[|0,T<rsub|0>|]>> established in
    <localize|Lemma><nbsp><reference|lem:Muntz>.
  </proof>

  <\lemma>
    [Fractional-integral Müntz coefficients]<label|lem:fracintegral>With
    <math|\<alpha\>\<in\><around|(|<tfrac|1|2>,1|)>>,

    <\equation>
      V<rsub|0>*<space|0.17em>I<rsup|1-\<alpha\>>*h*<around|(|T,u|)>=V<rsub|0>*<big|sum><rsub|k=0><rsup|\<infty\>>a<around|(|k,u|)><space|0.17em><frac|\<Gamma\>*<around|(|<around|(|k+1|)>*\<alpha\>+1|)>|\<Gamma\>*<around|(|k*\<alpha\>+2|)>>*<space|0.17em>T<rsup|k*\<alpha\>+1>.<label|eq:fracintegral>
    </equation>
  </lemma>

  <\proof>
    Apply the power rule <eqref|eq:powerrule> with <math|\<mu\>> replaced by
    <math|1-\<alpha\>> and <math|s=<around|(|k+1|)>*\<alpha\>>:

    <\equation*>
      I<rsup|1-\<alpha\>>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<alpha\>>=<frac|\<Gamma\>*<around|(|<around|(|k+1|)>*\<alpha\>+1|)>|\<Gamma\>*<around|(|<around|(|k+1|)>*\<alpha\>+<around|(|1-\<alpha\>|)>+1|)>>*<space|0.17em>t<rsup|<around|(|k+1|)>*\<alpha\>+1-\<alpha\>>=<frac|\<Gamma\>*<around|(|<around|(|k+1|)>*\<alpha\>+1|)>|\<Gamma\>*<around|(|k*\<alpha\>+2|)>>*<space|0.17em>t<rsup|k*\<alpha\>+1>.
    </equation*>

    Summing over <math|k> and multiplying by <math|V<rsub|0>> gives
    <eqref|eq:fracintegral>, with termwise application justified as in
    <localize|Lemma><nbsp><reference|lem:timeintegral>.
  </proof>

  <subsection|Reindexing onto the common lattice>

  The time-integral sum <eqref|eq:timeintegral> sits on the lattice
  <math|<around|{|T<rsup|<around|(|k+1|)>*\<alpha\>+1>|}><rsub|k\<ge\>0>>.
  The fractional-integral sum <eqref|eq:fracintegral> sits on the shifted
  lattice <math|<around|{|T<rsup|k*\<alpha\>+1>|}><rsub|k\<ge\>0>>. Setting
  <math|k\<mapsto\>k-1> in <eqref|eq:fracintegral> aligns it to
  <math|<around|{|T<rsup|<around|(|k-1|)>*\<alpha\>+1+\<alpha\>>|}>=<around|{|T<rsup|k*\<alpha\>+1>|}>=<around|{|T<rsup|<around|(|k+1|)>*\<alpha\>+1><mid|\|><rsub|k\<mapsto\>k-1>|}>>,
  i.e., the fractional-integral contribution at lattice position <math|k>
  involves <math|a<around|(|k-1,u|)>> (with
  <math|a<around|(|-1,u|)>\<assign\>0>).

  <subsection|The <math|d*<around|(|k,u|)>> coefficients>

  <\corollary>
    [<math|d*<around|(|k,u|)>> coefficient formula]<label|cor:dk>The cumulant
    generating function satisfies

    <\equation>
      \<kappa\><around|(|T,u|)>=<big|sum><rsub|k=0><rsup|\<infty\>>d*<around|(|k,u|)>*<space|0.17em>T<rsup|<around|(|k+1|)>*\<alpha\>+1>,<label|eq:kappaseries>
    </equation>

    where

    <\equation>
      <frame|d*<around|(|k,u|)>=\<theta\>*<space|0.17em><frac|a<around|(|k,u|)>|<around|(|k+1|)>*\<alpha\>+1>+V<rsub|0>*<space|0.17em><frac|\<Gamma\>*<around|(|k*\<alpha\>+1|)>|\<Gamma\>*<around|(|<around|(|k-1|)>*\<alpha\>+2|)>>*<space|0.17em>a<around|(|k-1,u|)>,<space|2em>k\<ge\>0,><label|eq:dk>
    </equation>

    with <math|a<around|(|-1,u|)>\<assign\>0>. In particular,
    <math|d*<around|(|k,u|)>\<in\><C><around|[|u|]>> and
    <math|d*<around|(|k,u|)>> is affinely linear in the pair
    <math|<around|(|a<around|(|k-1,u|)>,<space|0.17em>a<around|(|k,u|)>|)>>
    with <math|z>-independent scalar weights depending only on
    <math|<around|(|\<theta\>,V<rsub|0>,\<alpha\>,k|)>>.
  </corollary>

  <\proof>
    Add <eqref|eq:timeintegral> and <eqref|eq:fracintegral>. Reindex the
    fractional-integral sum <math|k\<mapsto\>k-1>: the term formerly at index
    <math|k> in <eqref|eq:fracintegral> carries monomial
    <math|T<rsup|k*\<alpha\>+1>=T<rsup|<around|(|k+1|)>*\<alpha\>+1-\<alpha\>>>.
    Setting <math|k<rsub|<math-up|new>>=k+1> so the exponent becomes
    <math|T<rsup|<around|(|k<rsub|<math-up|new>>|)>*\<alpha\>+1>=T<rsup|<around|(|<around|(|k<rsub|<math-up|new>>-1|)>+1|)>*\<alpha\>+1>>,
    the two sums combine at each lattice index <math|k\<ge\>0> to give

    <\equation*>
      d*<around|(|k,u|)>=\<theta\>*<space|0.17em><frac|a<around|(|k,u|)>|<around|(|k+1|)>*\<alpha\>+1>+V<rsub|0>*<space|0.17em><frac|\<Gamma\>*<around|(|k*\<alpha\>+1|)>|\<Gamma\>*<around|(|<around|(|k-1|)>*\<alpha\>+2|)>>*<space|0.17em>a<around|(|k-1,u|)>,
    </equation*>

    where the gamma-ratio arises from <eqref|eq:fracintegral> evaluated at
    <math|k-1>: <math|\<Gamma\>*<around|(|<around|(|k-1+1|)>*\<alpha\>+1|)>/\<Gamma\>*<around|(|<around|(|k-1|)>*\<alpha\>+2|)>=\<Gamma\>*<around|(|k*\<alpha\>+1|)>/\<Gamma\>*<around|(|<around|(|k-1|)>*\<alpha\>+2|)>>.
    Since <math|a<around|(|k,u|)>,a<around|(|k-1,u|)>\<in\><C><around|[|u|]>>
    and the scalar weights are independent of <math|u>, we have
    <math|d*<around|(|k,u|)>\<in\><C><around|[|u|]>>. Affine linearity in
    <math|<around|(|a<around|(|k-1,u|)>,a<around|(|k,u|)>|)>> is immediate
    from the formula.
  </proof>

  <section|Closure Theorem and the <math|\<kappa\>>
  Approximant><label|sec:closure>

  <\theorem>
    [Closure of the Müntz\UPadé apparatus under
    integration]<label|thm:closure>Define the moment functional
    <math|<Lkap>:<C><around|[|x|]>\<to\><C><around|[|u|]>> by
    <math|<Lkap><around|[|x<rsup|k>|]>\<assign\>d*<around|(|k,u|)>>, where
    <math|d*<around|(|k,u|)>> is given by <eqref|eq:dk>. Under the
    quasi-definiteness of <math|<Lk>>, <math|<Lkap>> is also quasi-definite.
    Let <math|P<rsub|\<kappa\>><around|(|n,x,u|)>> be the orthogonal
    polynomials of <math|<Lkap>>, generated by the Chebyshev\UWheeler
    recurrence on <math|S<rsub|\<kappa\>><around|(|n,z|)>> with
    <math|S<rsub|\<kappa\>><around|(|0,z|)>=<big|sum><rsub|k\<ge\>0>d*<around|(|k,u|)>*z<rsup|k>>.
    Define

    <\equation>
      \<kappa\><rsub|M><around|(|T,u|)>\<assign\>T\<cdot\><frac|P<rsub|M,\<kappa\>><around|(|T<rsup|\<alpha\>>,u|)>|T<rsup|\<alpha\>*M>*<space|0.17em>P<rsub|\<kappa\>><around|(|M,T<rsup|-\<alpha\>>,u|)>>.<label|eq:kappaM>
    </equation>

    Then

    <\equation>
      \<kappa\><around|(|T,u|)>=lim<rsub|M\<to\>\<infty\>>
      \<kappa\><rsub|M><around|(|T,u|)>,<label|eq:kappaconvergence>
    </equation>

    in the same sense of capacity convergence as
    <localize|Theorem><nbsp><reference|thm:FRMP>. Consequently

    <\equation>
      \<varphi\><rsub|T><around|(|u|)>=lim<rsub|M\<to\>\<infty\>> exp
      <space|-0.17em><around*|(|\<kappa\><rsub|M><around|(|T,u|)>|)>.<label|eq:phiconvergence>
    </equation>
  </theorem>

  <\proof>
    By <localize|Corollary><nbsp><reference|cor:dk>,
    <math|\<kappa\><around|(|T,u|)>=T\<cdot\><big|sum><rsub|k\<ge\>0>d*<around|(|k,u|)>*<space|0.17em>T<rsup|<around|(|k+1|)>*\<alpha\>>>.
    Setting <math|z=T<rsup|\<alpha\>>>, this is
    <math|T\<cdot\><wide|g|~><around|(|z,u|)>> where
    <math|<wide|g|~><around|(|z,u|)>=<big|sum><rsub|k\<ge\>0>d*<around|(|k,u|)>*<space|0.17em>z<rsup|k>>
    is the generating series of <math|<Lkap>>. Since
    <math|d*<around|(|k,u|)>> is affinely linear in
    <math|<around|(|a<around|(|k-1,u|)>,a<around|(|k,u|)>|)>> and the latter
    satisfy the contraction-type bound from
    <localize|Lemma><nbsp><reference|lem:Muntz>, the sequence
    <math|<around|{|d*<around|(|k,u|)>|}>> has the same exponential growth
    rate as <math|<around|{|a<around|(|k,u|)>|}>>, so
    <math|<wide|g|~><around|(|z,u|)>> has positive radius of convergence.
    Since <math|d*<around|(|k,u|)>> is affinely linear in
    <math|<around|(|a<around|(|k-1,u|)>,a<around|(|k,u|)>|)>>, the sequence
    <math|<around|{|d*<around|(|k,u|)>|}>> satisfies the same
    Volterra-iteration structure as <math|<around|{|a<around|(|k,u|)>|}>>,
    and its generating series <math|<wide|g|~>> likewise satisfies a
    quadratic functional equation over entire functions of <math|z> (with the
    same entire coefficient functions <math|<wide|P|~>,<wide|Q|~>,<wide|R|~>>
    of <localize|Lemma><nbsp><reference|lem:meromorphic>, linearly reweighted
    by <math|<around|(|\<theta\>,V<rsub|0>,\<alpha\>|)>>). Hence
    <math|<wide|g|~><around|(|z,u|)>> extends meromorphically to <math|<C>>
    by <localize|Lemma><nbsp><reference|lem:meromorphic>. Quasi-definiteness
    of <math|<Lkap>> follows from the affine-linear coupling: the Hankel
    determinants of <math|<around|{|d*<around|(|k,u|)>|}>> are polynomial
    expressions in those of <math|<around|{|a<around|(|k,u|)>|}>> and hence
    nonzero generically in <math|u>. Applying
    <localize|Theorem><nbsp><reference|thm:FRMP> to
    <math|<wide|g|~><around|(|z,u|)>> gives <eqref|eq:kappaconvergence>;
    <eqref|eq:phiconvergence> follows by continuity of the exponential.
  </proof>

  <\corollary>
    [Computational summary for rough Heston]<label|cor:algorithm>Given model
    parameters <math|<around|(|H,\<lambda\>,\<nu\>,\<rho\>,\<theta\>,V<rsub|0>|)>>
    and truncation order <math|M>:

    <\enumerate>
      <item>Compute <math|a<around|(|0,u|)>,\<ldots\>,a<around|(|M,u|)>\<in\><C><around|[|u|]>>
      via <eqref|eq:a0>\U<eqref|eq:ak> with <eqref|eq:roughHparams>. Cost:
      <math|O<around|(|M<rsup|2>|)>> polynomial multiplications in
      <math|<C><around|[|u|]>>.

      <item>Compute <math|d*<around|(|0,u|)>,\<ldots\>,d*<around|(|M,u|)>\<in\><C><around|[|u|]>>
      via <eqref|eq:dk>. Cost: <math|O<around|(|M|)>> scalar-polynomial
      multiplications.

      <item>Run the Chebyshev\UWheeler recurrence <eqref|eq:CWrecurrence> on
      <math|S<rsub|\<kappa\>><around|(|0,z|)>=<big|sum><rsub|k=0><rsup|M>d*<around|(|k,u|)>*z<rsup|k>>
      to obtain <math|\<alpha\><rsub|\<kappa\>><around|(|n|)>,\<beta\><rsub|\<kappa\>><around|(|n|)>\<in\><C><around|[|u|]>>
      for <math|0\<le\>n\<less\>M>. Cost: <math|O<around|(|M<rsup|2>|)>>
      operations in <math|<C><around|[|u|]>>.

      <item>Evaluate <math|\<kappa\><rsub|M><around|(|T,u|)>> via
      <eqref|eq:kappaM> at any <math|<around|(|T,u|)>> by polynomial
      evaluation. Cost: <math|O<around|(|M|)>> per evaluation point.
    </enumerate>

    Steps (i)\U(iii) are performed <em|once>, symbolically. Step (iv) is the
    only per-<math|<around|(|T,u|)>> cost, reducing to <math|O<around|(|M|)>>
    arithmetic operations regardless of the size of the Fourier grid.
  </corollary>

  <section|Structural Summary><label|sec:structure>

  The following table summarises the closure properties established above.

  <\padded-center>
    <assign|arraystretch|<macro|1.5>><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|4|4|cell-halign|l>|<cwith|1|-1|4|4|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|5|5|1|-1|cell-bborder|1ln>|<table|<row|<cell|Operation>|<cell|Lattice>|<cell|Coefficient
    at index <math|k>>|<cell|Coupling>>|<row|<cell|<math|h*<around|(|T,u|)>>>|<cell|<math|<around|{|T<rsup|<around|(|k+1|)>*\<alpha\>>|}>>>|<cell|<math|a<around|(|k,u|)>>>|<cell|<localize|Theorem><nbsp><reference|thm:FRMP>>>|<row|<cell|<math|<big|int><rsub|0><rsup|T>h*<space|0.17em>d*s>>|<cell|<math|<around|{|T<rsup|<around|(|k+1|)>*\<alpha\>+1>|}>>>|<cell|<math|<dfrac|a<around|(|k,u|)>|<around|(|k+1|)>*\<alpha\>+1>>>|<cell|<math|a<around|(|k|)>>
    only>>|<row|<cell|<math|I<rsup|1-\<alpha\>>*h>>|<cell|<math|<around|{|T<rsup|k*\<alpha\>+1>|}>>>|<cell|<math|<dfrac|\<Gamma\>*<around|(|<around|(|k+1|)>*\<alpha\>+1|)>|\<Gamma\>*<around|(|k*\<alpha\>+2|)>>a<around|(|k,u|)>>>|<cell|<math|a*<around|(|k-1|)>>
    after reindex>>|<row|<cell|<math|\<kappa\><around|(|T,u|)>>>|<cell|<math|<around|{|T<rsup|<around|(|k+1|)>*\<alpha\>+1>|}>>>|<cell|<math|d*<around|(|k,u|)>>
    (eq. <eqref|eq:dk>)>|<cell|affine in <math|<around|(|a*<around|(|k-1|)>,a<around|(|k|)>|)>>>>>>>
  </padded-center>

  <\thebibliography|99>
    <bibitem|ElEuchRosenbaum2019>El<nbsp>Euch, O. and Rosenbaum, M.
    <newblock>The characteristic function of rough Heston models.
    <newblock><with|font-shape|italic|Mathematical Finance>, 29(1):3\U38,
    2019.

    <bibitem|GatheralRadoicic2019>Gatheral, J. and Radi£oi¢, R.
    <newblock>Rational approximation of the rough Heston solution.
    <newblock><with|font-shape|italic|Quantitative Finance>, 19(3):495\U502,
    2019.

    <bibitem|AbiJaberElEuch2019>Abi<nbsp>Jaber, E. and El<nbsp>Euch, O.
    <newblock>Multifactor approximation of rough volatility models.
    <newblock><with|font-shape|italic|SIAM Journal on Financial Mathematics>,
    10(2):309\U349, 2019.

    <bibitem|Diethelm2004>Diethelm, K., Ford, N.<space|0.17em>J., and Freed,
    A.<space|0.17em>D. <newblock>Detailed error analysis for a fractional
    Adams method. <newblock><with|font-shape|italic|Numerical Algorithms>,
    36(1):31\U52, 2004.

    <bibitem|Gragg1974>Gragg, W.<space|0.17em>B. <newblock>The Padé table and
    its relation to certain algorithms of numerical analysis.
    <newblock><with|font-shape|italic|SIAM Review>, 14(1):1\U62, 1972.

    <bibitem|Stahl1997>Stahl, H. <newblock>The convergence of Padé
    approximants to functions with branch points.
    <newblock><with|font-shape|italic|Journal of Approximation Theory>,
    91(2):139\U204, 1997.

    <bibitem|Chihara1978>Chihara, T.<space|0.17em>S.
    <newblock><with|font-shape|italic|An Introduction to Orthogonal
    Polynomials>. <newblock>Gordon and Breach, New York, 1978.

    <bibitem|MuntzLegendre2015>Esmaeili, H. and Shamsi, M. <newblock>A
    pseudo-spectral scheme for the approximate solution of a family of
    fractional differential equations. <newblock><with|font-shape|italic|Applied
    Mathematical Modelling>, 39(16):5148\U5163, 2015.

    <bibitem|WheelerGautschi1996>Gautschi, W.
    <newblock><with|font-shape|italic|Orthogonal Polynomials: Computation and
    Approximation>. <newblock>Oxford University Press, Oxford, 2004.
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
    <associate|auto-10|<tuple|6.4|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-11|<tuple|7|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-12|<tuple|8|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-13|<tuple|8|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-3|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-4|<tuple|4|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-5|<tuple|5|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-6|<tuple|6|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-7|<tuple|6.1|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-8|<tuple|6.2|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-9|<tuple|6.3|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-AbiJaberElEuch2019|<tuple|AbiJaberElEuch2019|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Chihara1978|<tuple|Chihara1978|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Diethelm2004|<tuple|Diethelm2004|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-ElEuchRosenbaum2019|<tuple|ElEuchRosenbaum2019|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-GatheralRadoicic2019|<tuple|GatheralRadoicic2019|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Gragg1974|<tuple|Gragg1974|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-MuntzLegendre2015|<tuple|MuntzLegendre2015|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Stahl1997|<tuple|Stahl1997|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-WheelerGautschi1996|<tuple|WheelerGautschi1996|12|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|cor:algorithm|<tuple|15|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|cor:dk|<tuple|13|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:RL|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:Snz|<tuple|6|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:Volterra|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:moment|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:CWrecurrence|<tuple|19|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Muntzseries|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:OPrecurrence|<tuple|25|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:PQRtilde|<tuple|14|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:PadeOP|<tuple|26|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Volterra|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Wheeler|<tuple|22|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:a0|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:ak|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:convergence|<tuple|28|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:dk|<tuple|33|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:fRiccati|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:fracintegral|<tuple|31|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:gVolterra|<tuple|16|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:gpm|<tuple|18|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:gquadratic|<tuple|17|5|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:kappaM|<tuple|34|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:kappaconvergence|<tuple|35|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:kappaseries|<tuple|32|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:phiT|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:phiconvergence|<tuple|36|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:powerrule|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:roughHparams|<tuple|29|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:timeintegral|<tuple|30|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:yM|<tuple|27|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:Muntz|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:Wheeler|<tuple|7|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:fracintegral|<tuple|12|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:meromorphic|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:timeintegral|<tuple|11|9|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prop:OPdenominator|<tuple|8|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:CW|<tuple|4|6|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:Muntz|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:closure|<tuple|7|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:intro|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:maintheorem|<tuple|5|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:prelim|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:roughHeston|<tuple|6|8|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:structure|<tuple|8|11|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:FRMP|<tuple|9|7|../../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:closure|<tuple|14|10|../../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ElEuchRosenbaum2019

      Diethelm2004

      GatheralRadoicic2019

      GatheralRadoicic2019

      AbiJaberElEuch2019

      Chihara1978

      Gragg1974

      Stahl1997

      ElEuchRosenbaum2019
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Müntz\UTau Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Chebyshev\UWheeler Recurrence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      Fractional Riccati\UMüntz\UPadé Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Closure
      Under Integration: The Rough Heston Application>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|6.1<space|2spc>Rough Heston setup
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|6.2<space|2spc>Termwise integration
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|6.3<space|2spc>Reindexing onto the common
      lattice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|6.4<space|2spc>The <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|d*<around|(|k,u|)>>>
      coefficients <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Closure
      Theorem and the <with|color|<quote|dark
      red>|font-family|<quote|rm>|<with|mode|<quote|math>|\<kappa\>>>
      Approximant> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Structural
      Summary> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>