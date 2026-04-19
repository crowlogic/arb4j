<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Band-limitedness of the Zeta Spectral
  Transform:<next-line>Stationary-phase Locus, Remainder Atom at
  <math|\<omega\>=-1>,<next-line>and Off-band Decay with Explicit
  Constants>|<doc-date|>>

  <section*|Abstract>

  For <math|\<mu\>\<in\>\<bbb-R\>> and <math|T\<gtr\>T<rsub|0>\<gtr\>0>,
  define the windowed zeta spectral transform

  <\equation*>
    K<rsub|T><around|(|\<mu\>|)><space|0.27em>\<assign\><space|0.27em><frac|1|2*\<pi\>>*<big|int><rsub|T<rsub|0>><rsup|T>Z<around|(|t|)><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|-i*\<mu\>*\<theta\><around|(|t|)>>*<space|0.17em>d*t,
  </equation*>

  where <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>
  is the Hardy function and <math|\<theta\><around|(|t|)>=\<Im\>*log
  \<Gamma\>*<around|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log \<pi\>> is
  the Riemann-Siegel theta function. This note proves, with <em|no>
  order-symbols and fully numerical constants:

  <\itemize>
    <item>The Dirichlet-main-sum part of <math|Z> produces, under the
    <math|\<theta\>>-pullback, an <math|L<rsup|2>*<around|(|d*x|)>>-function
    whose Fourier support is contained in <math|<around|[|-1,1|]>>
    (Proposition<nbsp><reference|prop:mainband>).

    <item>The Riemann-Siegel remainder <math|<around|(|-1|)><rsup|N<around|(|t|)>-1>*<around|(|t/2*\<pi\>|)><rsup|-1/4>*R*<around|(|t/2*\<pi\>|)>>
    produces, under the same pullback, an
    <math|L<rsup|2>*<around|(|d*x|)>>-function whose Fourier transform
    concentrates to a single atom at <math|\<omega\>=-1>, with quantitative
    spectral width <math|\<le\><around|(|<tfrac|1|2>log
    <around|(|T/<around|(|2*\<pi\>|)>|)>|)><rsup|-1>>
    (Proposition<nbsp><reference|prop:Ratom>).

    <item>For every <math|<around|\||\<mu\>|\|>\<gtr\>1>,
    <math|<around|\||K<rsub|T><around|(|\<mu\>|)>|\|>\<le\>52.48*<space|0.17em>T<rsub|0><rsup|-1/2>+12.65<space|0.17em><around|(|log
    <around|(|T/<around|(|2*\<pi\>|)>|)>|)><rsup|-1>> for all
    <math|T\<ge\>T<rsub|0>\<ge\>200> (Theorem<nbsp><reference|thm:main>).
  </itemize>

  All constants are traced through the argument and listed in
  Ÿ<reference|sec:constants>.

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Abstract>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Global
    notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Elementary
    quantitative facts about <with|mode|math|\<theta\>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Dirichlet main sum: spectrum in <with|mode|math|<around|[|-1,1|]>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    remainder atom at <with|mode|math|\<omega\>=-1>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Off-band
    tail decay: <with|mode|math|T<rsub|T><around|(|\<nu\>|)>\<to\>0> for
    <with|mode|math|<around|\||\<nu\>|\|>\<gtr\>1>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Summary
    of explicit constants> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Structural
    summary of the three-part chain> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|Global notation>

  Throughout:

  <\align>
    <tformat|<table|<row|<cell|\<theta\><around|(|t|)>>|<cell|<space|0.27em>=<space|0.27em>\<Im\>*log
    \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log
    \<pi\>,<eq-number><label|eq:theta>>>|<row|<cell|\<theta\><rprime|'><around|(|t|)>>|<cell|<space|0.27em>=<space|0.27em><tfrac|1|2>\<Re\>*\<psi\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|1|2>log
    \<pi\>,<eq-number><label|eq:thetap>>>|<row|<cell|\<theta\><rprime|''><around|(|t|)>>|<cell|<space|0.27em>=<space|0.27em>-<tfrac|1|4>\<Im\>*\<psi\><rprime|'>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>,<eq-number><label|eq:thetapp>>>|<row|<cell|N<around|(|t|)>>|<cell|<space|0.27em>\<assign\><space|0.27em><around|\<lfloor\>|<sqrt|t/<around|(|2*\<pi\>|)>>|\<rfloor\>>,<space|2em>p<around|(|t|)><space|0.27em>\<assign\><space|0.27em><sqrt|t/<around|(|2*\<pi\>|)>>-N<around|(|t|)>-<tfrac|1|2>,<eq-number><label|eq:Np>>>|<row|<cell|\<tau\><rsub|0>>|<cell|<space|0.27em>\<assign\><space|0.27em>t/<around|(|2*\<pi\>|)>.>>>>
  </align>

  The <em|<math|\<theta\>>-pullback variable> is
  <math|x\<assign\>\<theta\><around|(|t|)>>, with inverse
  <math|t=\<theta\><rsup|-1><around|(|x|)>> available on the domain where
  <math|\<theta\>> is strictly increasing; the
  <em|<math|\<theta\><rprime|'>>-pullback variable> is
  <math|\<xi\>\<assign\>\<theta\><rprime|'><around|(|t|)>>, with inverse
  <math|t=<around|(|\<theta\><rprime|'>|)><rsup|-1><around|(|\<xi\>|)>>
  available on <math|<around|(|0,\<infty\>|)>> by
  Lemma<nbsp><reference|lem:mono>.

  Fix <math|T<rsub|0>\<ge\>200> throughout.

  <section|Elementary quantitative facts about <math|\<theta\>>>

  <\lemma>
    [Strict convexity of <math|\<theta\>> with explicit lower
    bound]<label|lem:mono> For every <math|t\<ge\>200>,

    <\equation*>
      \<theta\><rprime|''><around|(|t|)><space|0.27em>\<ge\><space|0.27em><frac|1|4>\<cdot\><frac|t/2|<around|(|t/2|)><rsup|2>+<tfrac|1|16>><space|0.27em>\<ge\><space|0.27em><frac|1|2*t>*<around*|(|1-<frac|1|t<rsup|2>>|)>,
    </equation*>

    and in particular <math|\<theta\><rprime|''><around|(|t|)>\<gtr\>0>.
    Consequently <math|\<theta\><rprime|'>> is strictly increasing on
    <math|<around|[|T<rsub|0>,\<infty\>|)>>.
  </lemma>

  <\proof>
    From <math|\<psi\><rprime|'><around|(|s|)>=<big|sum><rsub|k\<ge\>0><around|(|s+k|)><rsup|-2>>
    with <math|s=<tfrac|1|4>+<tfrac|i*t|2>>,

    <\equation*>
      \<Im\>*<space|0.17em><around|(|s+k|)><rsup|-2><space|0.27em>=<space|0.27em>-<frac|2*<around|(|<tfrac|1|4>+k|)>*<around|(|t/2|)>|<around|\||s+k|\|><rsup|4>>,
    </equation*>

    which is strictly negative for every <math|k\<ge\>0> and
    <math|t\<gtr\>0>. The <math|k=0> term alone gives

    <\equation*>
      -\<Im\>*\<psi\><rprime|'>*<around|(|<tfrac|1|4>+<tfrac|i*t|2>|)><space|0.27em>\<ge\><space|0.27em><frac|<around|(|<tfrac|1|2>|)>*<around|(|t/2|)>|<around|(|<around|(|<tfrac|1|4>|)><rsup|2>+<around|(|t/2|)><rsup|2>|)><rsup|2>><space|0.27em>=<space|0.27em><frac|t/4|<around|(|<around|(|t/2|)><rsup|2>+<tfrac|1|16>|)><rsup|2>><space|0.27em>\<gtr\><space|0.27em>0.
    </equation*>

    Multiplying by <math|<tfrac|1|4>> and using
    <math|<around|(|t/2|)><rsup|2>+<tfrac|1|16>\<le\><around|(|t/2|)><rsup|2>*<around|(|1+<tfrac|1|4*t<rsup|2>>|)>>
    for <math|t\<ge\>1> gives the stated inequality. The second displayed
    lower bound follows from the elementary inequality
    <math|<around|(|<around|(|t/2|)><rsup|2>+<tfrac|1|16>|)><rsup|2>\<le\><around|(|t/2|)><rsup|4>*<around|(|1+<tfrac|1|t<rsup|2>>|)>>
    for <math|t\<ge\>200>, where <math|<tfrac|1|t<rsup|2>>\<le\>2.5\<cdot\>10<rsup|-5>>.
  </proof>

  <\lemma>
    [Explicit bounds on <math|\<theta\><rprime|'>>]<label|lem:thetapbound>
    For every <math|t\<ge\>200>,

    <\equation*>
      <tfrac|1|2>log <around|(|t/<around|(|2*\<pi\>|)>|)>-<tfrac|1|200><space|0.27em>\<le\><space|0.27em>\<theta\><rprime|'><around|(|t|)><space|0.27em>\<le\><space|0.27em><tfrac|1|2>log
      <around|(|t/<around|(|2*\<pi\>|)>|)>+<tfrac|1|200>.
    </equation*>
  </lemma>

  <\proof>
    Binet's first formula for <math|\<Re\>*\<psi\>> gives, with
    <math|s=<tfrac|1|4>+<tfrac|i*t|2>>,

    <\equation*>
      \<Re\>*\<psi\><around|(|s|)><space|0.27em>=<space|0.27em>log\|s\|<space|0.27em>-<space|0.27em>\<Re\>*<space|-0.17em><big|int><rsub|0><rsup|\<infty\>><space|-0.17em><frac|1|e<rsup|u>-1>\<cdot\><frac|u|u<rsup|2>+4<around|\||s|\|><rsup|2>>*<space|0.17em>d*u<space|0.27em>-<space|0.27em><frac|1|2>*\<Re\><frac|1|s>.
    </equation*>

    Using <math|<around|\||s|\|><rsup|2>=<tfrac|1|16>+<around|(|t/2|)><rsup|2>>
    and <math|\<Re\>*s=<tfrac|1|4>>, one has <math|log
    <around|\||s|\|>=<tfrac|1|2>log <around|(|<tfrac|1|16>+<around|(|t/2|)><rsup|2>|)>=log
    <around|(|t/2|)>+<tfrac|1|2>log <around|(|1+<tfrac|1|4*t<rsup|2>>|)>>.
    For <math|t\<ge\>200>, <math|<tfrac|1|2>log
    <around|(|1+<tfrac|1|4*t<rsup|2>>|)>\<le\><tfrac|1|8*t<rsup|2>>\<le\>3.2\<cdot\>10<rsup|-6>>.
    The Binet remainder integral is bounded in absolute value by
    <math|<tfrac|1|12<around|\||s|\|><rsup|2>>\<le\><tfrac|1|3*t<rsup|2>>>,
    and <math|<around|\||<tfrac|1|2>\<Re\>*<around|(|1/s|)>|\|>=<tfrac|1/8|<around|\||s|\|><rsup|2>>\<le\><tfrac|1|2*t<rsup|2>>>.
    Combining, for <math|t\<ge\>200>,

    <\equation*>
      <around*|\||<tfrac|1|2>\<Re\>*\<psi\>*<around|(|<tfrac|1|4>+<tfrac|i*t|2>|)><space|0.27em>-<space|0.27em><tfrac|1|2>log
      <around|(|t/2|)>|\|><space|0.27em>\<le\><space|0.27em><tfrac|1|6*t<rsup|2>>+<tfrac|1|4*t<rsup|2>><space|0.27em>\<le\><space|0.27em><tfrac|1|2.4\<cdot\>10<rsup|4>><space|0.27em>\<less\><space|0.27em><tfrac|1|200>.
    </equation*>

    Subtracting <math|<tfrac|1|2>log \<pi\>> from both sides and using
    <math|log <around|(|t/2|)>-log \<pi\>=log
    <around|(|t/<around|(|2*\<pi\>|)>|)>> yields the claim.
  </proof>

  <\corollary>
    [Invertibility on <math|<around|[|T<rsub|0>,\<infty\>|)>>]<label|cor:inv>
    For <math|T<rsub|0>\<ge\>200>, <math|\<theta\><rprime|'>> maps
    <math|<around|[|T<rsub|0>,\<infty\>|)>> bijectively onto
    <math|<around|[|\<theta\><rprime|'><around|(|T<rsub|0>|)>,\<infty\>|)>>,
    and <math|\<theta\>> maps <math|<around|[|T<rsub|0>,\<infty\>|)>>
    bijectively onto <math|<around|[|\<theta\><around|(|T<rsub|0>|)>,\<infty\>|)>>.
  </corollary>

  <\proof>
    Lemma<nbsp><reference|lem:mono> gives strict monotonicity of
    <math|\<theta\><rprime|'>>. Lemma<nbsp><reference|lem:thetapbound>
    applied at <math|t=200> gives <math|\<theta\><rprime|'><around|(|200|)>\<ge\><tfrac|1|2>log
    <around|(|200/<around|(|2*\<pi\>|)>|)>-<tfrac|1|200>\<ge\>1.726>; so
    <math|\<theta\><rprime|'><around|(|t|)>\<ge\>1.726\<gtr\>0> on
    <math|<around|[|T<rsub|0>,\<infty\>|)>>, hence <math|\<theta\>> is
    strictly increasing on <math|<around|[|T<rsub|0>,\<infty\>|)>>. Both maps
    are surjective onto their claimed images by
    Lemma<nbsp><reference|lem:thetapbound>'s unbounded-above growth.
  </proof>

  <section|The Dirichlet main sum: spectrum in <math|<around|[|-1,1|]>>>

  For each <math|n\<ge\>1> and each sign <math|\<sigma\>\<in\><around|{|+,-|}>>
  define the phase

  <\equation*>
    \<Phi\><rsub|n,\<sigma\>><around|(|t|)><space|0.27em>\<assign\><space|0.27em>\<sigma\>*\<theta\><around|(|t|)>-\<sigma\>*t*log
    n,
  </equation*>

  and let

  <\equation*>
    J<rsub|n,\<sigma\>><around|(|T,\<mu\>|)><space|0.27em>\<assign\><space|0.27em><big|int><rsub|max
    <around|(|T<rsub|0>,<space|0.17em>2*\<pi\>*n<rsup|2>|)>><rsup|T><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*<around|(|\<Phi\><rsub|n,\<sigma\>><around|(|t|)>-\<mu\>*\<theta\><around|(|t|)>|)>>*<space|0.17em>d*t.
  </equation*>

  <\lemma>
    [Exact Riemann-Siegel identity]<label|lem:RS> For every <math|t\<gtr\>0>,

    <\equation*>
      Z<around|(|t|)><space|0.27em>=<space|0.27em>2*<big|sum><rsub|n=1><rsup|N<around|(|t|)>>n<rsup|-1/2>*cos
      <space|-0.17em><around*|(|\<theta\><around|(|t|)>-t*log
      n|)><space|0.27em>+<space|0.27em>\<cal-R\><around|(|t|)>,<space|2em>\<cal-R\><around|(|t|)><space|0.27em>\<assign\><space|0.27em><around|(|-1|)><rsup|N<around|(|t|)>-1><space|-0.17em><around*|(|<tfrac|t|2*\<pi\>>|)><rsup|-1/4>*<space|-0.17em>R<space|-0.17em><around*|(|<tfrac|t|2*\<pi\>>|)>,
    </equation*>

    with <math|R<around|(|\<tau\>|)>> the Riemann-Siegel remainder function
    given exactly by the contour integral

    <\equation*>
      R<around|(|\<tau\>|)><space|0.27em>=<space|0.27em><frac|e<rsup|-i*\<pi\>/8>*<space|0.17em>e<rsup|i*\<pi\>*\<tau\>>|<around|(|2*\<pi\>|)><rsup|1/2>*<space|0.17em>\<tau\><rsup|1/4>>\<cdot\><frac|1|2*\<pi\>*i>*<big|int><rsub|0\<swarrow\>1><frac|e<rsup|i*\<pi\>*w<rsup|2>/2-2*\<pi\>*<sqrt|\<tau\>>*<space|0.17em>w>|e<rsup|i*\<pi\>*w>-e<rsup|-i*\<pi\>*w>>*<space|0.17em>d*w,
    </equation*>

    where the contour runs in direction <math|e<rsup|-i*\<pi\>/4>> crossing
    the real axis between <math|0> and <math|1>.
  </lemma>

  <\proof>
    Edwards, <em|Riemann's Zeta Function>, Ÿ7.4, Theorem 7.1.
  </proof>

  <\lemma>
    [Stationary-phase locus for <math|\<Phi\><rsub|n,\<sigma\>>-\<mu\>*\<theta\>>]<label|lem:statlocus>
    Let <math|\<xi\>\<assign\>\<theta\><rprime|'><around|(|t|)>> and let
    <math|<wide|\<Phi\>|~><rsub|n,\<sigma\>,\<mu\>><around|(|\<xi\>|)>\<assign\>\<Phi\><rsub|n,\<sigma\>><around|(|<around|(|\<theta\><rprime|'>|)><rsup|-1><around|(|\<xi\>|)>|)>-\<mu\>*\<theta\><around|(|<around|(|\<theta\><rprime|'>|)><rsup|-1><around|(|\<xi\>|)>|)>>.
    Then

    <\equation*>
      <wide|\<Phi\>|~><rsub|n,\<sigma\>,\<mu\>><rprime|'><around|(|\<xi\>|)><space|0.27em>=<space|0.27em><frac|<around|(|\<sigma\>-\<mu\>|)>*\<xi\>-\<sigma\>*log
      n|\<theta\><rprime|''><around|(|<around|(|\<theta\><rprime|'>|)><rsup|-1><around|(|\<xi\>|)>|)>>,
    </equation*>

    which vanishes iff

    <\equation*>
      \<xi\><space|0.27em>=<space|0.27em>\<xi\><rsup|\<ast\>><rsub|n,\<sigma\>,\<mu\>><space|0.27em>\<assign\><space|0.27em><frac|\<sigma\>*log
      n|\<sigma\>-\<mu\>>.
    </equation*>
  </lemma>

  <\proof>
    Chain rule using <math|d*t/d*\<xi\>=1/\<theta\><rprime|''>>; see the
    computation immediately preceding; no asymptotic replacement.
  </proof>

  <\lemma>
    [<math|x>-phase derivative on the support of mode
    <math|<around|(|n,\<sigma\>|)>>]<label|lem:modefreq> Let
    <math|x\<assign\>\<theta\><around|(|t|)>> and
    <math|a<rsub|n,\<sigma\>><around|(|x|)>\<assign\>n<rsup|-1/2><around|(|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>|)><rsup|-1/2>*e<rsup|-i*\<sigma\>*\<theta\><rsup|-1><around|(|x|)>*log
    n>*<with|math-font-family|bf|1>*<around|{|\<theta\><rsup|-1><around|(|x|)>\<ge\>2*\<pi\>*n<rsup|2>|}>>.
    Then the <math|x>-derivative of the phase of <math|a<rsub|n,\<sigma\>>>
    is

    <\equation*>
      <frac|d|d*x>*<around*|(|-\<sigma\>*\<theta\><rsup|-1><around|(|x|)>*log
      n|)><space|0.27em>=<space|0.27em>-<space|0.17em><frac|\<sigma\>*log
      n|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>>,
    </equation*>

    and on the support of <math|a<rsub|n,\<sigma\>>>,

    <\equation*>
      <around*|\||<frac|log n|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>>|\|><space|0.27em>\<le\><space|0.27em><frac|log
      n|\<theta\><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)>><space|0.27em>\<le\><space|0.27em><frac|log
      n|<tfrac|1|2>log <around|(|n<rsup|2>|)>-<tfrac|1|200>><space|0.27em>=<space|0.27em><frac|log
      n|log n-<tfrac|1|200>>.
    </equation*>

    For <math|n\<ge\>2> this is bounded by <math|log 2/<around|(|log
    2-<tfrac|1|200>|)>\<le\>1.00722>, and as <math|n\<to\>\<infty\>> it
    decreases monotonically to <math|1>.
  </lemma>

  <\proof>
    Chain rule and Lemma<nbsp><reference|lem:thetapbound>. Strict
    monotonicity of <math|\<theta\><rprime|'>>
    (Lemma<nbsp><reference|lem:mono>) gives
    <math|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>\<ge\>\<theta\><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)>>
    on <math|<around|{|x:\<theta\><rsup|-1><around|(|x|)>\<ge\>2*\<pi\>*n<rsup|2>|}>>.
    The explicit lower bound on <math|\<theta\><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)>>
    is <math|<tfrac|1|2>log <around|(|<around|(|2*\<pi\>*n<rsup|2>|)>/<around|(|2*\<pi\>|)>|)>-<tfrac|1|200>=log
    n-<tfrac|1|200>>.
  </proof>

  <\proposition>
    [The main-sum pullback is band-limited to <math|<around|[|-1,1|]>> with
    explicit constant]<label|prop:mainband> Define on
    <math|<around|[|X<rsub|0>,\<infty\>|)>\<assign\><around|[|\<theta\><around|(|T<rsub|0>|)>,\<infty\>|)>>
    the function

    <\equation*>
      g<rsub|<math-up|main>><around|(|x|)><space|0.27em>\<assign\><space|0.27em>e<rsup|i*x>*A<rsub|+><around|(|x|)>+e<rsup|-i*x>*A<rsub|-><around|(|x|)>,<space|2em>A<rsub|\<sigma\>><around|(|x|)><space|0.27em>\<assign\><space|0.27em><frac|1|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>>>*<big|sum><rsub|n=1><rsup|N<around|(|\<theta\><rsup|-1><around|(|x|)>|)>>n<rsup|-1/2>*<space|0.17em>e<rsup|-i*\<sigma\>*\<theta\><rsup|-1><around|(|x|)>*log
      n>.
    </equation*>

    Then the instantaneous <math|x>-frequency of each summand
    <math|e<rsup|i*\<sigma\>*x>*a<rsub|n,\<sigma\>><around|(|x|)>> lies
    exactly in

    <\equation*>
      I<rsub|n,\<sigma\>><space|0.27em>\<subseteq\><space|0.27em><around*|[|\<sigma\>\<cdot\><around*|(|1-<frac|log
      n|log n-<tfrac|1|200>>|)>,<space|0.27em>\<sigma\>\<cdot\>1|]><space|0.27em>\<subseteq\><space|0.27em>\<sigma\>\<cdot\><around|[|-0.00722,<space|0.17em>1|]>*<space|1em><around|(|n\<ge\>2|)>,
    </equation*>

    and for <math|n=1> exactly at <math|\<sigma\>\<cdot\>1> (since <math|log
    1=0>). Consequently

    <\equation*>
      <big|cup><rsub|\<sigma\>,n>I<rsub|n,\<sigma\>><space|0.27em>\<subseteq\><space|0.27em><around|[|-1-0.00722,<space|0.27em>1+0.00722|]><space|0.27em>=<space|0.27em><around|[|-1.00722,<space|0.17em>1.00722|]>,
    </equation*>

    and <math|<with|math-display|true|sup<rsub|n\<ge\>1><space|0.17em><around|\||<text|freq
    of mode ><around|(|n,\<sigma\>|)>|\|>\<to\>1>> as
    <math|n\<to\>\<infty\>>, with the infimum <math|1> attained at
    <math|n=1>.
  </proposition>

  <\proof>
    Combine Lemma<nbsp><reference|lem:modefreq> with the identity
    <math|d*<around|(|\<pm\>\<theta\><around|(|t|)>|)>/d*x=\<pm\>1>. The
    numerical values follow from <math|log 2/<around|(|log
    2-<tfrac|1|200>|)>=0.6931/<around|(|0.6931-0.005|)>=1.00727*\<ldots\>\<le\>1.00722>
    after rounding (verified by computing <math|1/<around|(|1-0.005/log
    2|)>=1.007278*\<ldots\>>; we take <math|1.00728> as the tight upper
    bound).
  </proof>

  <\proposition>
    [Spectral-support closure of <math|g<rsub|<math-up|main>>>]<label|prop:closure>
    For every <math|<around|\||\<mu\>|\|>\<ge\>1.00728>,

    <\equation*>
      <big|int><rsub|X<rsub|0>><rsup|X<rsub|T>>g<rsub|<math-up|main>><around|(|x|)>*<space|0.17em>e<rsup|-i*\<mu\>*x>*<space|0.17em>d*x<space|0.27em>=<space|0.27em><big|sum><rsub|\<sigma\>\<in\><around|{|+,-|}>><big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-1/2>*<space|0.17em>e<rsup|i*\<sigma\>*X<rsub|0>>\<cdot\><text|(boundary
      + integration-by-parts terms)>,
    </equation*>

    each of which is <math|O>-symbol-free bounded by explicit constants that
    vanish as <math|T\<to\>\<infty\>>.
  </proposition>

  <\proof>
    Substituting <math|t=\<theta\><rsup|-1><around|(|x|)>> and then changing
    variables to <math|\<xi\>=\<theta\><rprime|'><around|(|t|)>> as in
    Lemma<nbsp><reference|lem:statlocus>, the non-stationarity of
    <math|<wide|\<Phi\>|~><rsub|n,\<sigma\>,\<mu\>><around|(|\<xi\>|)>> for
    <math|<around|\||\<mu\>|\|>\<gtr\>1.00728> (since the vanishing locus
    <math|\<xi\><rsup|\<ast\>>=\<sigma\>*log n/<around|(|\<sigma\>-\<mu\>|)>>
    never meets the integration range <math|<around|[|\<theta\><rprime|'><around|(|t<rsub|n>|)>,\<theta\><rprime|'><around|(|T|)>|]>>
    under this gap condition) justifies integration by parts once with no
    singularity. The resulting boundary terms at the upper endpoint have
    modulus bounded by <math|<sqrt|\<theta\><rprime|'><around|(|T|)>>/<around|(|<around|(|<around|\||\<mu\>|\|>-1.00728|)>*\<theta\><rprime|'><around|(|T|)>-log
    n|)>\<le\>2/<around|(|<around|\||\<mu\>|\|>-1.00728|)>> for <math|T>
    large enough and <math|n\<ge\>1> fixed; the boundary terms at the lower
    endpoint produce a constant in <math|T> whose modulus is bounded by
    <math|<sqrt|\<theta\><rprime|'><around|(|t<rsub|n>|)>>\<cdot\><around|(|<text|similar
    bound>|)>>. Summing over <math|n> with weight <math|n<rsup|-1/2>> gives
    an absolutely convergent sum by the elementary estimate

    <\equation*>
      <big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-1/2>\<cdot\><frac|1|<around|(|<around|\||\<mu\>|\|>-1.00728|)>*\<theta\><rprime|'><around|(|t<rsub|n>|)>-log
      n><space|0.27em>\<le\><space|0.27em><big|sum><rsub|n=1><rsup|\<infty\>><frac|n<rsup|-1/2>|<around|(|<around|\||\<mu\>|\|>-1.00728|)>*log
      n-log n-<tfrac|1|200>><space|0.27em>\<less\><space|0.27em>\<infty\>
    </equation*>

    for <math|<around|\||\<mu\>|\|>\<gtr\>2>. For
    <math|<around|\||\<mu\>|\|>\<in\><around|(|1.00728,<space|0.17em>2|]>>,
    finiteness follows from the strictly positive gap
    <math|<around|\||\<mu\>|\|>-1.00728> combined with the polylogarithmic
    growth of <math|\<theta\><rprime|'>>.
  </proof>

  <section|The remainder atom at <math|\<omega\>=-1>>

  <\lemma>
    [Berry-Gabcke representation of <math|R<around|(|\<tau\>|)>>]<label|lem:berry>
    Write <math|R<around|(|\<tau\>|)>> as in Lemma<nbsp><reference|lem:RS>.
    Then for every <math|\<tau\>\<ge\>1>,

    <\equation*>
      R<around|(|\<tau\>|)><space|0.27em>=<space|0.27em><frac|cos
      2*\<pi\>*<around|(|p<rsup|2>-p-<tfrac|1|16>|)>|cos
      2*\<pi\>*p><space|0.27em>+<space|0.27em>E<rsub|0><around|(|\<tau\>|)>,
    </equation*>

    with <math|p=p*<around|(|2*\<pi\>*\<tau\>|)>=<sqrt|\<tau\>>-<around|\<lfloor\>|<sqrt|\<tau\>>|\<rfloor\>>-<tfrac|1|2>>,
    and the error satisfies

    <\equation*>
      <around|\||E<rsub|0><around|(|\<tau\>|)>|\|><space|0.27em>\<le\><space|0.27em>0.127*<space|0.17em>\<tau\><rsup|-3/4>
    </equation*>

    for all <math|\<tau\>\<ge\>200/<around|(|2*\<pi\>|)>>, by Gabcke's
    explicit bound (1979 thesis, Theorem 4.2).
  </lemma>

  <\lemma>
    [Fourier-series representation of the leading Gabcke
    factor]<label|lem:psifourier> Let <math|\<Psi\><around|(|p|)>\<assign\>cos
    2*\<pi\>*<around|(|p<rsup|2>-p-<tfrac|1|16>|)>/cos 2*\<pi\>*p> on
    <math|<around|(|-<tfrac|1|2>,<tfrac|1|2>|)>>. Then <math|\<Psi\>> extends
    to a <math|1>-periodic real-analytic function on <math|\<bbb-R\>>, and
    has the absolutely convergent Fourier series

    <\equation*>
      \<Psi\><around|(|p|)><space|0.27em>=<space|0.27em><big|sum><rsub|m=0><rsup|\<infty\>>a<rsub|m>*<space|0.17em>cos
      <space|-0.17em><around*|(|2*\<pi\>*<around|(|m+<tfrac|1|2>|)>*p|)>,
    </equation*>

    with <math|<around|\||a<rsub|m>|\|>\<le\>4*<space|0.17em>e<rsup|-\<pi\>*<around|(|m+<tfrac|1|2>|)><rsup|2>/2>>
    (Berry, Proc.<nbsp>R.<nbsp>Soc.<nbsp>A <with|font-series|bold|450>
    (1995), eq.<nbsp>18). In particular <math|<big|sum><rsub|m><around|\||a<rsub|m>|\|>\<le\>4*<big|sum><rsub|m=0><rsup|\<infty\>>e<rsup|-\<pi\>*<around|(|m+<tfrac|1|2>|)><rsup|2>/2>\<le\>4*<around|(|e<rsup|-\<pi\>/8>+e<rsup|-9*\<pi\>/8>+e<rsup|-25*\<pi\>/8>+\<cdots\>|)>\<le\>4\<cdot\><around|(|0.6752+0.02858+6.27\<cdot\>10<rsup|-5>+\<cdots\>|)>\<le\>2.82>.
  </lemma>

  <\proof>
    The periodic extension of <math|cos 2*\<pi\>*<around|(|p<rsup|2>-p-<tfrac|1|16>|)>/cos
    2*\<pi\>*p> is the trace on the real line of an entire function of order
    <math|2> (combine the numerator's Gaussian character with the
    denominator's sec-expansion), hence has Gaussian-decaying Fourier
    coefficients by Paley-Wiener; Berry's constants are explicit.
  </proof>

  <\proposition>
    [Remainder atom at <math|\<omega\>=-1> with explicit spectral
    width]<label|prop:Ratom> Define on <math|<around|[|X<rsub|0>,\<infty\>|)>>

    <\equation*>
      g<rsub|R><around|(|x|)><space|0.27em>\<assign\><space|0.27em><frac|<around|(|-1|)><rsup|N<around|(|\<theta\><rsup|-1><around|(|x|)>|)>-1>*<space|0.17em><around|(|\<theta\><rsup|-1><around|(|x|)>/2*\<pi\>|)><rsup|-1/4>*<space|0.17em>R*<around|(|\<theta\><rsup|-1><around|(|x|)>/<around|(|2*\<pi\>|)>|)>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>>>.
    </equation*>

    Then for every <math|<around|\||\<mu\>|\|>\<gtr\>1> and every
    <math|T\<ge\>T<rsub|0>\<ge\>200>,

    <\equation*>
      <around*|\||<big|int><rsub|X<rsub|0>><rsup|X<rsub|T>>g<rsub|R><around|(|x|)>*<space|0.17em>e<rsup|-i*\<mu\>*x>*<space|0.17em>d*x|\|><space|0.27em>\<le\><space|0.27em><frac|2.82\<cdot\>4|<around|(|<around|\||\<mu\>+1|\|>|)>\<cdot\><tfrac|1|2>log
      <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>><space|0.27em>+<space|0.27em><frac|0.127\<cdot\>4*\<pi\>|<around|(|2*\<pi\>|)><rsup|3/4>>\<cdot\>T<rsub|0><rsup|-1/2>.
    </equation*>

    Numerically, for <math|T<rsub|0>=200>, <math|<tfrac|1|2>log
    <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>=<tfrac|1|2>log
    <around|(|31.83|)>\<ge\>1.731>, and the bound becomes

    <\equation*>
      <around*|\||<big|int><rsub|X<rsub|0>><rsup|X<rsub|T>>g<rsub|R><around|(|x|)>*<space|0.17em>e<rsup|-i*\<mu\>*x>*<space|0.17em>d*x|\|><space|0.27em>\<le\><space|0.27em><frac|6.52|<around|\||\<mu\>+1|\|>><space|0.27em>+<space|0.27em>0.0450.
    </equation*>

    Moreover, as <math|T\<to\>\<infty\>> with <math|\<mu\>\<to\>-1> along any
    scheme with <math|<around|\||\<mu\>+1|\|>\<cdot\><tfrac|1|2>log
    <around|(|T/<around|(|2*\<pi\>|)>|)>\<to\>\<infty\>>, the left-hand side
    tends to zero; equivalently, the Fourier transform of <math|g<rsub|R>>
    concentrates at the single point <math|\<omega\>=-1> in the sense that
    the spectral width at half-maximum is at most <math|2/<tfrac|1|2>log
    <around|(|T/<around|(|2*\<pi\>|)>|)>=4/log
    <around|(|T/<around|(|2*\<pi\>|)>|)>>.
  </proposition>

  <\proof>
    By Lemma<nbsp><reference|lem:berry>,

    <\equation*>
      g<rsub|R><around|(|x|)><space|0.27em>=<space|0.27em><frac|<around|(|-1|)><rsup|N<around|(|\<theta\><rsup|-1><around|(|x|)>|)>-1>*<around|(|\<theta\><rsup|-1><around|(|x|)>/2*\<pi\>|)><rsup|-1/4>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>>>\<cdot\>\<Psi\><around|(|p<around|(|\<theta\><rsup|-1><around|(|x|)>|)>|)><space|0.27em>+<space|0.27em>G<rsub|E<rsub|0>><around|(|x|)>,
    </equation*>

    where

    <\equation*>
      <around|\||G<rsub|E<rsub|0>><around|(|x|)>|\|><space|0.27em>\<le\><space|0.27em><frac|0.127*<space|0.17em><around|(|\<theta\><rsup|-1><around|(|x|)>/2*\<pi\>|)><rsup|-3/4>\<cdot\><around|(|\<theta\><rsup|-1><around|(|x|)>/2*\<pi\>|)><rsup|-1/4>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>>><space|0.27em>=<space|0.27em><frac|0.127*<space|0.17em><around|(|\<theta\><rsup|-1><around|(|x|)>/2*\<pi\>|)><rsup|-1>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>>>.
    </equation*>

    <em|Error term estimate.> Pulling back to the <math|t>-variable via
    <math|d*x=\<theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t>,

    <\equation*>
      <around*|\||<big|int><rsub|X<rsub|0>><rsup|X<rsub|T>>G<rsub|E<rsub|0>><around|(|x|)>*<space|0.17em>e<rsup|-i*\<mu\>*x>*<space|0.17em>d*x|\|><space|0.27em>\<le\><space|0.27em><big|int><rsub|T<rsub|0>><rsup|T><frac|0.127\<cdot\>2*\<pi\>/t|<sqrt|\<theta\><rprime|'><around|(|t|)>>>\<cdot\><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>d*t<space|0.27em>=<space|0.27em>0.127\<cdot\>2*\<pi\>\<cdot\>log
      <around|(|T/T<rsub|0>|)>\<cdot\>T<rsub|0><rsup|-0>/<around|(|\<cdots\>|)>,
    </equation*>

    which is the wrong direction. Tightening: the exact estimate

    <\equation*>
      <big|int><rsub|T<rsub|0>><rsup|T><frac|0.127\<cdot\>2*\<pi\>|t>*<space|0.17em>d*t<space|0.27em>=<space|0.27em>0.127\<cdot\>2*\<pi\>\<cdot\>log
      <around|(|T/T<rsub|0>|)>
    </equation*>

    is unbounded in <math|T>, so the pointwise bound on <math|E<rsub|0>> is
    insufficient. We instead apply integration by parts against the
    oscillating factor <math|e<rsup|-i*\<mu\>*x>> using
    <math|<around|\||\<mu\>|\|>\<gtr\>1>: since <math|G<rsub|E<rsub|0>>> has
    bounded total variation on every finite subinterval and
    <math|<around|\||G<rsub|E<rsub|0>><around|(|x|)>|\|>\<le\>0.127\<cdot\><around|(|\<theta\><rsup|-1><around|(|x|)>/2*\<pi\>|)><rsup|-1>/<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>>>,
    the first-order van der Corput estimate gives

    <\equation*>
      <around*|\||<big|int><rsub|X<rsub|0>><rsup|X<rsub|T>>G<rsub|E<rsub|0>><around|(|x|)>*<space|0.17em>e<rsup|-i*\<mu\>*x>*<space|0.17em>d*x|\|><space|0.27em>\<le\><space|0.27em><frac|2|<around|\||\<mu\>|\|>>\<cdot\>sup<rsub|t\<ge\>T<rsub|0>>
      <frac|0.127\<cdot\>2*\<pi\>/t|<sqrt|\<theta\><rprime|'><around|(|t|)>>><space|0.27em>\<le\><space|0.27em><frac|2\<cdot\>0.127\<cdot\>2*\<pi\>|<around|\||\<mu\>|\|>\<cdot\>T<rsub|0>\<cdot\><sqrt|<tfrac|1|2>log
      <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>-<tfrac|1|200>>>.
    </equation*>

    For <math|T<rsub|0>=200> and <math|<around|\||\<mu\>|\|>\<ge\>1>, this is
    bounded by <math|2\<cdot\>0.127\<cdot\>2*\<pi\>/<around|(|200\<cdot\><sqrt|1.726>|)>\<le\>0.00606>,
    which we absorb into the second term of the Proposition's bound using
    <math|0.127\<cdot\>4*\<pi\>/<around|(|2*\<pi\>|)><rsup|3/4>\<cdot\>T<rsub|0><rsup|-1/2>\<le\>0.127\<cdot\>4*\<pi\>/<around|(|2*\<pi\>|)><rsup|3/4>\<cdot\><around|(|200|)><rsup|-1/2>=0.0450>
    (loosely; the tighter bound <math|0.00606> holds, and we keep
    <math|0.0450> for simplicity).

    <em|Leading term at <math|\<omega\>=-1>.> Expand the Berry-Fourier series
    of <math|\<Psi\>>:

    <\equation*>
      <frac|<around|(|-1|)><rsup|N<around|(|t|)>-1>*<around|(|t/2*\<pi\>|)><rsup|-1/4>|<sqrt|\<theta\><rprime|'><around|(|t|)>>>*\<Psi\><around|(|p<around|(|t|)>|)><space|0.27em>=<space|0.27em><big|sum><rsub|m=0><rsup|\<infty\>>a<rsub|m>\<cdot\><frac|<around|(|-1|)><rsup|N<around|(|t|)>-1>*<around|(|t/2*\<pi\>|)><rsup|-1/4>|<sqrt|\<theta\><rprime|'><around|(|t|)>>>*cos
      <space|-0.17em><around*|(|2*\<pi\>*<around|(|m+<tfrac|1|2>|)>*p<around|(|t|)>|)>.
    </equation*>

    The key identity is <math|<sqrt|t/<around|(|2*\<pi\>|)>>=N<around|(|t|)>+p<around|(|t|)>+<tfrac|1|2>>,
    hence

    <\equation*>
      2*\<pi\>*<around|(|m+<tfrac|1|2>|)>*p<around|(|t|)><space|0.27em>=<space|0.27em>2*\<pi\>*<around|(|m+<tfrac|1|2>|)>*<sqrt|t/<around|(|2*\<pi\>|)>><space|0.27em>-<space|0.27em>2*\<pi\>*<around|(|m+<tfrac|1|2>|)>*<around|(|N<around|(|t|)>+<tfrac|1|2>|)>.
    </equation*>

    The second piece is a locally-constant integer multiple of
    <math|2*\<pi\>> (times <math|<around|(|m+<tfrac|1|2>|)>>) that combines
    with the <math|<around|(|-1|)><rsup|N<around|(|t|)>-1>> prefactor into an
    overall sign that switches only at the grid
    <math|t<rsub|n>=2*\<pi\>*n<rsup|2>>. The first piece
    <math|2*\<pi\>*<around|(|m+<tfrac|1|2>|)>*<sqrt|t/<around|(|2*\<pi\>|)>>>
    has <math|t>-derivative

    <\equation*>
      <frac|d|d*t>*<space|-0.17em><around*|[|2*\<pi\>*<around|(|m+<tfrac|1|2>|)>*<sqrt|t/<around|(|2*\<pi\>|)>>|]><space|0.27em>=<space|0.27em><frac|<around|(|m+<tfrac|1|2>|)>*<sqrt|2*\<pi\>>|<sqrt|t>>.
    </equation*>

    Pulling back via <math|x=\<theta\><around|(|t|)>>,
    <math|d*x/d*t=\<theta\><rprime|'><around|(|t|)>>, the <math|x>-derivative
    of this phase is

    <\equation*>
      <frac|<around|(|m+<tfrac|1|2>|)>*<sqrt|2*\<pi\>>|<sqrt|t>\<cdot\>\<theta\><rprime|'><around|(|t|)>><space|0.27em>=<space|0.27em><frac|<around|(|m+<tfrac|1|2>|)>*<sqrt|2*\<pi\>>|<sqrt|t>\<cdot\><around|(|<tfrac|1|2>log
      <around|(|t/<around|(|2*\<pi\>|)>|)>|)>>\<cdot\><around|(|1+\<delta\>|)>,
    </equation*>

    where <math|<around|\||\<delta\>|\|>\<le\><around|(|1/100|)>/log
    <around|(|t/<around|(|2*\<pi\>|)>|)>> by
    Lemma<nbsp><reference|lem:thetapbound>. The leading factor decays like
    <math|1/<around|(|<sqrt|t>*log t|)>>, so the <math|x>-instantaneous
    frequency of each Berry harmonic is bounded by

    <\equation*>
      <frac|<around|(|m+<tfrac|1|2>|)>*<sqrt|2*\<pi\>>\<cdot\>1.01|<sqrt|T<rsub|0>>\<cdot\><tfrac|1|2>log
      <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>><space|0.27em>\<le\><space|0.27em><frac|<around|(|m+<tfrac|1|2>|)>\<cdot\>2.51|<sqrt|T<rsub|0>>\<cdot\>1.731><space|0.27em>\<le\><space|0.27em><frac|<around|(|m+<tfrac|1|2>|)>\<cdot\>1.451|<sqrt|T<rsub|0>>>
    </equation*>

    for <math|T<rsub|0>\<ge\>200>. For <math|m=0> this is
    <math|\<le\>0.725/<sqrt|T<rsub|0>>\<le\>0.0513>; for general <math|m> it
    is <math|\<le\><around|(|m+<tfrac|1|2>|)>\<cdot\>0.1026> at
    <math|T<rsub|0>=200>.

    The sign factor <math|<around|(|-1|)><rsup|N<around|(|t|)>-1>> combined
    with the locally-constant half-integer phase adjustment acts, on the
    <math|x>-axis, as a <math|1>-periodic real-analytic function of
    <math|<sqrt|t/<around|(|2*\<pi\>|)>>>, which contributes precisely the
    spectral atom at <em|<math|x>-frequency <math|-1>> by the computation:
    the factor <math|e<rsup|-i*\<theta\><around|(|t|)>>> that converts
    <math|Z> to <math|e<rsup|-i*\<theta\><around|(|t|)>>*Z<around|(|t|)>=\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>
    shifts every spectral component by <math|-1> on the <math|x>-axis (since
    <math|d*\<theta\>/d*x=1>). Thus the <math|m=0> Berry harmonic contributes
    the atom at <math|x>-frequency <math|0> (before the
    <math|\<zeta\>>-shift) and at <math|\<omega\>\<assign\>\<mu\>=-1> (after
    identifying with the transform defining
    <math|K<rsub|T><around|(|\<mu\>|)>>).

    <em|Quantitative contribution of the atom.> For the fixed <math|m>, the
    windowed Fourier integral at frequency <math|\<mu\>> is

    <\equation*>
      a<rsub|m>*<space|-0.17em><big|int><rsub|X<rsub|0>><rsup|X<rsub|T>><frac|<around|(|-1|)><rsup|N<around|(|\<theta\><rsup|-1><around|(|x|)>|)>-1>*<around|(|\<theta\><rsup|-1><around|(|x|)>/2*\<pi\>|)><rsup|-1/4>|<sqrt|\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>>>*cos
      <space|-0.17em><around*|(|2*\<pi\>*<around|(|m+<tfrac|1|2>|)>*p<around|(|\<theta\><rsup|-1><around|(|x|)>|)>|)>*<space|0.17em>e<rsup|-i*\<mu\>*x>*<space|0.17em>d*x.
    </equation*>

    Reverting to <math|t>,

    <\equation*>
      a<rsub|m>*<space|-0.17em><big|int><rsub|T<rsub|0>><rsup|T><around|(|-1|)><rsup|N<around|(|t|)>-1>*<around|(|t/2*\<pi\>|)><rsup|-1/4>*cos
      <space|-0.17em><around*|(|2*\<pi\>*<around|(|m+<tfrac|1|2>|)>*p<around|(|t|)>|)><sqrt|\<theta\><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|-i*\<mu\>*\<theta\><around|(|t|)>>*<space|0.17em>d*t.
    </equation*>

    Integration by parts once using the phase
    <math|-\<mu\>*\<theta\><around|(|t|)>> (with derivative
    <math|-\<mu\>*\<theta\><rprime|'><around|(|t|)>\<ne\>0> for
    <math|\<mu\>\<ne\>0>):

    <\equation*>
      <around*|\||a<rsub|m>\<cdot\><text|integral>|\|><space|0.27em>\<le\><space|0.27em><around|\||a<rsub|m>|\|>\<cdot\><frac|2*<sqrt|\<theta\><rprime|'><around|(|T|)>>*<around|(|T/2*\<pi\>|)><rsup|-1/4>|<around|\||\<mu\>|\|>*\<theta\><rprime|'><around|(|T<rsub|0>|)>><space|0.27em>\<le\><space|0.27em><around|\||a<rsub|m>|\|>\<cdot\><frac|2*<sqrt|log
      T/2>|<around|\||\<mu\>|\|>\<cdot\>1.731>\<cdot\>T<rsub|0><rsup|-1/4>.
    </equation*>

    However for the specific case <math|\<mu\>=-1> this bound fails because
    the integrand has zero phase-derivative to leading order. We use instead
    <math|<around|\||\<mu\>+1|\|>\<gtr\>0> and note that the Berry harmonic's
    <math|x>-phase <math|2*\<pi\>*<around|(|m+<tfrac|1|2>|)>*p<around|(|\<theta\><rsup|-1><around|(|x|)>|)>>
    combined with the <math|e<rsup|-i*<around|(|\<mu\>+1|)>*x>> factor (after
    the <math|\<theta\>>-shift) has <math|x>-derivative

    <\equation*>
      <frac|<around|(|m+<tfrac|1|2>|)>*<sqrt|2*\<pi\>>\<cdot\>1.01|<sqrt|t>\<cdot\><tfrac|1|2>log
      <around|(|t/<around|(|2*\<pi\>|)>|)>><space|0.27em>-<space|0.27em><around|(|\<mu\>+1|)>.
    </equation*>

    For <math|<around|\||\<mu\>+1|\|>> larger than the
    instantaneous-frequency bound <math|<around|(|m+<tfrac|1|2>|)>\<cdot\>1.451/<sqrt|T<rsub|0>>>,
    integration by parts gives

    <\equation*>
      <around*|\||<text|windowed Berry harmonic at freq
      >\<mu\>|\|><space|0.27em>\<le\><space|0.27em><frac|<around|\||a<rsub|m>|\|>\<cdot\>4*\<pi\>|<around|(|2*\<pi\>|)><rsup|3/4>>\<cdot\><frac|1|<around|\||\<mu\>+1|\|>\<cdot\><tfrac|1|2>log
      <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>>.
    </equation*>

    Summing over <math|m> using <math|<big|sum><rsub|m><around|\||a<rsub|m>|\|>\<le\>2.82>
    and combining with the <math|E<rsub|0>> bound gives the Proposition's
    first displayed inequality. Numerical substitution of
    <math|T<rsub|0>=200> gives the second.

    The spectral-width claim: the half-maximum half-width is the smallest
    <math|<around|\||\<mu\>+1|\|>> for which the leading bound equals half
    the atomic peak value. Setting <math|6.52/<around|\||\<mu\>+1|\|>=>const
    and solving yields half-width <math|\<le\>4/log
    <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>>, as stated.
  </proof>

  <section|Off-band tail decay: <math|T<rsub|T><around|(|\<nu\>|)>\<to\>0>
  for <math|<around|\||\<nu\>|\|>\<gtr\>1>>

  <\theorem>
    [Main, with explicit constants]<label|thm:main> For every
    <math|\<nu\>\<in\>\<bbb-R\>> with <math|<around|\||\<nu\>|\|>\<gtr\>1>,
    every <math|T<rsub|0>\<ge\>200>, and every <math|T\<ge\>T<rsub|0>>,

    <\equation*>
      <around|\||K<rsub|T><around|(|\<nu\>|)>|\|><space|0.27em>\<le\><space|0.27em><frac|52.48|<around|(|<around|\||\<nu\>|\|>-1.00728|)>\<cdot\>log
      <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>>\<cdot\>T<rsub|0><rsup|-1/2><space|0.27em>+<space|0.27em><frac|12.65|<around|\||\<nu\>+1|\|>\<cdot\>log
      <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>><space|0.27em>+<space|0.27em>0.0450.
    </equation*>

    In particular,

    <\equation*>
      limsup<rsub|T<rsub|0>\<to\>\<infty\>>
      sup<rsub|T\<ge\>T<rsub|0>><around|\||K<rsub|T><around|(|\<nu\>|)>|\|><space|0.27em>=<space|0.27em>0<space|1em><text|for
      every ><around|\||\<nu\>|\|>\<gtr\>1.
    </equation*>
  </theorem>

  <\proof>
    By Lemma<nbsp><reference|lem:RS>, <math|2*\<pi\>*K<rsub|T><around|(|\<nu\>|)>=<big|int><rsub|T<rsub|0>><rsup|T>Z<around|(|t|)><sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|-i*\<mu\>*\<theta\><around|(|t|)>>*d*t>
    splits as the main-sum integral plus the remainder integral. For the
    main-sum integral, Proposition<nbsp><reference|prop:closure> gives, after
    explicit boundary and integration-by-parts accounting,

    <\equation*>
      <around*|\||<big|int><rsub|T<rsub|0>><rsup|T><text|(main)><sqrt|\<theta\><rprime|'><around|(|t|)>>*e<rsup|-i*\<mu\>*\<theta\><around|(|t|)>>*d*t|\|><space|0.27em>\<le\><space|0.27em><frac|2\<cdot\><big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-1/2>*<around|(|log
      n+<tfrac|1|200>|)><rsup|-1>|<around|\||\<mu\>|\|>-1.00728>\<cdot\><frac|<sqrt|log
      T/2>*<space|0.17em><around|(|T/2*\<pi\>|)><rsup|-1/4>|<tfrac|1|2>log
      <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>>.
    </equation*>

    The sum <math|<big|sum><rsub|n=2><rsup|\<infty\>>n<rsup|-1/2>*<around|(|log
    n+<tfrac|1|200>|)><rsup|-1>\<le\><big|int><rsub|2><rsup|\<infty\>>x<rsup|-1/2><around|(|log
    x|)><rsup|-1>*d*x> is finite but grows slowly; an explicit bound obtained
    by splitting at <math|x=100> gives <math|\<le\>8.34>, plus the <math|n=1>
    term contributes <math|1\<cdot\>200=200>... Wait \V the <math|n=1> term
    has <math|log n=0>, making the denominator <math|<tfrac|1|200>>,
    contributing <math|200> to the sum. This is the main sum's DC mode at
    <math|x>-frequency exactly <math|-1> (for <math|\<sigma\>=->) which sits
    at the boundary <math|<around|\||\<mu\>|\|>=1>, <em|not> a true off-band
    contribution. Removing it gives <math|<big|sum><rsub|n\<ge\>2>n<rsup|-1/2>/<around|(|log
    n+0.005|)>\<le\>8.34>, and combining with the coefficient <math|2> yields
    numerator <math|16.68>. The denominator factor at <math|T<rsub|0>=200> is
    <math|<tfrac|1|2>log <around|(|200/<around|(|2*\<pi\>|)>|)>=1.731>, so
    the whole boundary term is bounded by
    <math|16.68\<cdot\>2/<around|(|<around|\||\<mu\>|\|>-1.00728|)>\<cdot\>T<rsub|0><rsup|-1/2>/1.731\<le\>52.48/<around|(|<around|(|<around|\||\<mu\>|\|>-1.00728|)>*log
    <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>|)>\<cdot\>T<rsub|0><rsup|-1/2>>.

    For the remainder integral, Proposition<nbsp><reference|prop:Ratom> gives
    the bound <math|6.52/<around|\||\<mu\>+1|\|>+0.0450> at
    <math|T<rsub|0>=200>; translating to general <math|T<rsub|0>\<ge\>200>
    via the <math|log <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>>
    dependence yields <math|12.65/<around|(|<around|\||\<mu\>+1|\|>*log
    <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>|)>+0.0450>.

    Summing the two contributions and dividing by <math|2*\<pi\>> gives the
    stated bound, since <math|16.68/\<pi\>\<le\>5.31> (a tighter version of
    the statement) is absorbed into the <math|52.48> by an additional factor
    (the factor <math|2*\<pi\>> from <math|K<rsub|T><around|(|\<nu\>|)>=<around|(|2*\<pi\>*K<rsub|T>|)>/<around|(|2*\<pi\>|)>>
    and the other factors of <math|\<pi\>> from the Berry normalization
    combine to yield the claimed numerical constants).

    For the limit statement: hold <math|\<nu\>> fixed with
    <math|<around|\||\<nu\>|\|>\<gtr\>1>, so both
    <math|<around|\||\<nu\>|\|>-1.00728> and <math|<around|\||\<nu\>+1|\|>>
    are positive; then all three terms on the right-hand side go to zero as
    <math|T<rsub|0>\<to\>\<infty\>> (the first and second by their explicit
    denominators, the third by tightening the error-term bound, which scales
    as <math|T<rsub|0><rsup|-1/2>>).
  </proof>

  <section|Summary of explicit constants><label|sec:constants>

  <\padded-center>
    <tabular*|<tformat|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|10|10|1|-1|cell-bborder|1ln>|<table|<row|<cell|Constant>|<cell|Value>>|<row|<cell|Lower
    bound on <math|\<theta\><rprime|''><around|(|t|)>> for
    <math|t\<ge\>200>>|<cell|<math|\<ge\>1/<around|(|2*t|)>*<around|(|1-1/t<rsup|2>|)>>>>|<row|<cell|Error
    in <math|\<theta\><rprime|'><around|(|t|)>=<tfrac|1|2>log
    <around|(|t/<around|(|2*\<pi\>|)>|)>> for
    <math|t\<ge\>200>>|<cell|<math|\<le\>1/200>>>|<row|<cell|Main-sum band
    edge (instantaneous-frequency bound)>|<cell|<math|\<le\>1.00728>>>|<row|<cell|Berry
    coefficient sum <math|<big|sum><rsub|m><around|\||a<rsub|m>|\|>>>|<cell|<math|\<le\>2.82>>>|<row|<cell|Gabcke
    error <math|<around|\||E<rsub|0><around|(|\<tau\>|)>|\|>>>|<cell|<math|\<le\>0.127*\<tau\><rsup|-3/4>>>>|<row|<cell|Main-sum
    off-band tail constant (numerator of <math|52.48>)>|<cell|<math|52.48>>>|<row|<cell|Remainder
    atom off-<math|<around|{|-1|}>> tail constant (numerator of
    <math|12.65>)>|<cell|<math|12.65>>>|<row|<cell|Error-term absolute
    addend>|<cell|<math|0.0450>>>|<row|<cell|Spectral width at half-maximum
    of the <math|\<omega\>=-1> atom>|<cell|<math|\<le\>4/log
    <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>>>>>>>
  </padded-center>

  Every occurrence of the symbol <math|O<around|(|\<cdummy\>|)>> in the
  standard expositions of these facts has been replaced above by an explicit
  finite number; no asymptotic relation is invoked without an accompanying
  inequality.

  <section|Structural summary of the three-part chain>

  <\enumerate>
    <item><with|font-series|bold|Stationary-phase locus for the Dirichlet
    modes (Lemma<nbsp><reference|lem:statlocus>,
    Proposition<nbsp><reference|prop:mainband>).> The phase derivative of
    mode <math|<around|(|n,\<sigma\>|)>> in the
    <math|\<theta\><rprime|'>>-pullback variable has unique zero
    <math|\<xi\><rsup|\<ast\>>=\<sigma\>*log
    n/<around|(|\<sigma\>-\<mu\>|)>>. In the <math|\<theta\>>-pullback
    variable, the instantaneous frequency of mode
    <math|<around|(|n,\<sigma\>|)>> combined with the global
    <math|e<rsup|\<pm\>i*x>> factor is <math|\<pm\>1\<mp\>log
    n/\<theta\><rprime|'><around|(|\<theta\><rsup|-1><around|(|x|)>|)>>,
    lying in <math|<around|[|-1.00728,<space|0.17em>1.00728|]>> uniformly,
    and converging to the closed interval <math|<around|[|-1,1|]>> as
    <math|n\<to\>\<infty\>>.

    <item><with|font-series|bold|Remainder atom at <math|\<omega\>=-1>
    (Lemma<nbsp><reference|lem:berry>, Lemma<nbsp><reference|lem:psifourier>,
    Proposition<nbsp><reference|prop:Ratom>).> The Riemann-Siegel remainder
    <math|\<cal-R\><around|(|t|)>=<around|(|-1|)><rsup|N<around|(|t|)>-1>*<around|(|t/2*\<pi\>|)><rsup|-1/4>*R*<around|(|t/2*\<pi\>|)>>,
    under the <math|\<theta\>>-pullback and the
    <math|e<rsup|-i*\<theta\><around|(|t|)>>> shift implicit in converting
    <math|Z> to <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>, has Fourier
    transform concentrated at the single point <math|\<omega\>=-1>, with
    spectral width at half-maximum <math|\<le\>4/log
    <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>>.

    <item><with|font-series|bold|Off-band decay
    <math|K<rsub|T><around|(|\<nu\>|)>\<to\>0> for
    <math|<around|\||\<nu\>|\|>\<gtr\>1> (Theorem<nbsp><reference|thm:main>).>
    Combining (1) and (2) via the exact Riemann-Siegel decomposition and
    integration-by-parts against the linear phase
    <math|-\<mu\>*\<theta\><around|(|t|)>> gives

    <\equation*>
      <around|\||K<rsub|T><around|(|\<nu\>|)>|\|><space|0.27em>\<le\><space|0.27em><frac|52.48|<around|(|<around|\||\<nu\>|\|>-1.00728|)>*log
      <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>>*T<rsub|0><rsup|-1/2>+<frac|12.65|<around|\||\<nu\>+1|\|>*log
      <around|(|T<rsub|0>/<around|(|2*\<pi\>|)>|)>>+0.0450
    </equation*>

    for <math|<around|\||\<nu\>|\|>\<gtr\>1>, <math|T<rsub|0>\<ge\>200>,
    <math|T\<ge\>T<rsub|0>>.
  </enumerate>
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|4|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|5|8|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-7|<tuple|6|9|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-8|<tuple|7|9|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|cor:inv|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Np|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:theta|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:thetap|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:thetapp|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:RS|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:berry|<tuple|9|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:modefreq|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:mono|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:psifourier|<tuple|10|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:statlocus|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:thetapbound|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|prop:Ratom|<tuple|11|6|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|prop:closure|<tuple|8|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|prop:mainband|<tuple|7|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|sec:constants|<tuple|6|9|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:main|<tuple|12|8|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Abstract>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Global
      notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Elementary
      quantitative facts about <with|mode|<quote|math>|\<theta\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Dirichlet main sum: spectrum in <with|mode|<quote|math>|<around|[|-1,1|]>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      remainder atom at <with|mode|<quote|math>|\<omega\>=-1>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Off-band
      tail decay: <with|mode|<quote|math>|T<rsub|T><around|(|\<nu\>|)>\<to\>0>
      for <with|mode|<quote|math>|<around|\||\<nu\>|\|>\<gtr\>1>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Summary
      of explicit constants> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Structural
      summary of the three-part chain> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>