<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Convergence of the Autocovariance of the Normalized
  Zeta-Process>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|April 2026>>

  <section|Notation and Definitions>

  All notation follows the companion document establishing unit Cesàro mean
  square. Let <math|\<zeta\><around|(|s|)>> denote the Riemann zeta function,
  <math|\<vartheta\><around|(|t|)>=<math-up|Im>log
  \<Gamma\>*<around|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log \<pi\>> the
  Riemann\USiegel theta function, and <math|t<rsub|0>> the unique point where
  <math|\<vartheta\>> attains its global minimum on
  <math|<around|(|0,\<infty\>|)>>. Let <math|\<tau\><rsub|0>=\<vartheta\><around|(|t<rsub|0>|)>>,
  and let <math|\<sigma\>:<around|[|\<tau\><rsub|0>,\<infty\>|)>\<to\><around|[|t<rsub|0>,\<infty\>|)>>
  denote the inverse of <math|\<vartheta\>> restricted to
  <math|<around|[|t<rsub|0>,\<infty\>|)>>.

  Define the second-moment integral

  <\equation*>
    V<around|(|T|)>\<assign\><big|int><rsub|0><rsup|T><around*|\||\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>|\|><rsup|2>*d*t,
  </equation*>

  the pullback

  <\equation*>
    Y<around|(|\<tau\>|)>\<assign\><frac|\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*\<sigma\><around|(|\<tau\>|)>|)>|<sqrt|\<vartheta\><rprime|'><around|(|\<sigma\><around|(|\<tau\>|)>|)>>>,
  </equation*>

  the cumulative local energy

  <\equation*>
    W<around|(|\<tau\>|)>\<assign\><big|int><rsub|\<tau\><rsub|0>><rsup|\<tau\>><around|\||Y<around|(|s|)>|\|><rsup|2>*<space|0.17em>d*s,
  </equation*>

  and the normalized process

  <\equation*>
    X<around|(|\<tau\>|)>\<assign\>Y<around|(|\<tau\>|)><sqrt|<frac|\<tau\>|W<around|(|\<tau\>|)>>>.
  </equation*>

  From the companion document, the following facts are established:

  <\enumerate>
    <item*|(F1)><math|W<around|(|\<tau\>|)>=V<around|(|\<sigma\><around|(|\<tau\>|)>|)>-V<around|(|\<sigma\><around|(|\<tau\><rsub|0>|)>|)>>
    (exact identity, by change of variables
    <math|t=\<sigma\><around|(|s|)>>).

    <item*|(F2)><math|W<around|(|\<tau\>|)>=2*\<tau\>*<around|(|1+\<varepsilon\><around|(|\<tau\>|)>|)>>
    with <math|\<varepsilon\><around|(|\<tau\>|)>=O<around|(|log log
    \<tau\>/log \<tau\>|)>>.

    <item*|(F3)><math|<with|math-display|true|lim<rsub|T\<to\>\<infty\>>
    <frac|1|T>*<big|int><rsub|\<tau\><rsub|0>><rsup|T><around|\||X<around|(|\<tau\>|)>|\|><rsup|2>*<space|0.17em>d*\<tau\>=1>>.
  </enumerate>

  <section|Statement>

  <\theorem>
    <label|thm:cov>For every fixed <math|h\<in\>\<bbb-R\>>, the Cesàro
    autocovariance

    <\equation>
      <label|eq:Rdef>R<around|(|h|)>\<assign\>lim<rsub|T\<to\>\<infty\>>
      <frac|1|T>*<big|int><rsub|\<tau\><rsub|0>><rsup|T>X*<around|(|\<tau\>+h|)><space|0.17em><wide|X<around|(|\<tau\>|)>|\<bar\>><space|0.17em>d*\<tau\>
    </equation>

    exists and equals

    <\equation>
      <label|eq:Rvalue>R<around|(|h|)>=<frac|e<rsup|-i*h>*sin h|h>,
    </equation>

    with the convention <math|R<around|(|0|)>=1>.
  </theorem>

  <\corollary>
    <label|cor:spectral>The spectral density of the process <math|X> is

    <\equation*>
      <wide|S|^><around|(|\<omega\>|)>=\<pi\>\<cdot\><with|math-font-family|bf|1><rsub|<around|[|-2,0|]>><around|(|\<omega\>|)>.
    </equation*>
  </corollary>

  By direct computation,

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around|(|h|)>*<space|0.17em>e<rsup|-i*\<omega\>*h>*<space|0.17em>d*h=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-i*h>*sin
    h|h>*<space|0.17em>e<rsup|-i*\<omega\>*h>*<space|0.17em>d*h=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|sin
    h|h>*<space|0.17em>e<rsup|-i*<around|(|\<omega\>+1|)>*h>*<space|0.17em>d*h=\<pi\>\<cdot\><with|math-font-family|bf|1><rsub|<around|[|-1,1|]>>*<around|(|\<omega\>+1|)>=\<pi\>\<cdot\><with|math-font-family|bf|1><rsub|<around|[|-2,0|]>><around|(|\<omega\>|)>,
  </equation*>

  using the standard identity <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|(|sin
  h/h|)>*<space|0.17em>e<rsup|-i*\<alpha\>*h>*<space|0.17em>d*h=\<pi\>\<cdot\><with|math-font-family|bf|1><rsub|<around|[|-1,1|]>><around|(|\<alpha\>|)>>.

  <section|Proof of Theorem<nbsp><reference|thm:cov>>

  The proof proceeds in four steps.

  <subsection*|Step 1: Separation of the Slowly Varying Prefactor>

  Substituting the definitions of <math|X> and <math|Y>:

  <\equation*>
    X*<around|(|\<tau\>+h|)><space|0.17em><wide|X<around|(|\<tau\>|)>|\<bar\>>=Y*<around|(|\<tau\>+h|)><space|0.17em><wide|Y<around|(|\<tau\>|)>|\<bar\>>\<cdot\><frac|<sqrt|<around|(|\<tau\>+h|)>*<space|0.17em>\<tau\>>|<sqrt|W*<around|(|\<tau\>+h|)>*<space|0.17em>W<around|(|\<tau\>|)>>>
  </equation*>

  Define the prefactor

  <\equation>
    <label|eq:alpha-def>\<alpha\>*<around|(|\<tau\>,h|)>\<assign\><frac|<sqrt|<around|(|\<tau\>+h|)>*<space|0.17em>\<tau\>>|<sqrt|W*<around|(|\<tau\>+h|)>*<space|0.17em>W<around|(|\<tau\>|)>>>
  </equation>

  <\lemma>
    <label|lem:alpha>For each fixed <math|h\<in\>\<bbb-R\>>,

    <\equation*>
      \<alpha\>*<around|(|\<tau\>,h|)>=<frac|1|2>+O<space|-0.17em><around*|(|<frac|log
      log \<tau\>|log \<tau\>>|)>
    </equation*>

    as <math|\<tau\>\<to\>\<infty\>>.
  </lemma>

  <\proof>
    By (F2), <math|W<around|(|\<tau\>|)>=2*\<tau\>*<around|(|1+\<varepsilon\><around|(|\<tau\>|)>|)>>
    with <math|\<varepsilon\><around|(|\<tau\>|)>=O<around|(|log log
    \<tau\>/log \<tau\>|)>>. For fixed <math|h>,

    <\equation*>
      W*<around|(|\<tau\>+h|)>=2*<around|(|\<tau\>+h|)>*<around|(|1+\<varepsilon\>*<around|(|\<tau\>+h|)>|)>=2*\<tau\>*<around*|(|1+<frac|h|\<tau\>>|)>*<around|(|1+\<varepsilon\>*<around|(|\<tau\>+h|)>|)>
    </equation*>

    Therefore

    <\align*>
      <tformat|<table|<row|<cell|\<alpha\>*<around|(|\<tau\>,h|)>>|<cell|=<frac|<sqrt|<around|(|\<tau\>+h|)>*<space|0.17em>\<tau\>>|<sqrt|2*<around|(|\<tau\>+h|)>*<around|(|1+\<varepsilon\>*<around|(|\<tau\>+h|)>|)>\<cdot\>2*\<tau\>*<around|(|1+\<varepsilon\><around|(|\<tau\>|)>|)>>>>>|<row|<cell|>|<cell|=<frac|1|2>\<cdot\><frac|1|<sqrt|<around|(|1+\<varepsilon\>*<around|(|\<tau\>+h|)>|)>*<around|(|1+\<varepsilon\><around|(|\<tau\>|)>|)>>>.>>>>
    </align*>

    Since <math|\<varepsilon\>*<around|(|\<tau\>+h|)>> and
    <math|\<varepsilon\><around|(|\<tau\>|)>> are both <math|O<around|(|log
    log \<tau\>/log \<tau\>|)>>, the Taylor expansion\ 

    <\equation>
      1/<sqrt|<around|(|1+u|)>*<around|(|1+v|)>>=1-<around|(|u+v|)>/2+O<around|(|u<rsup|2>+v<rsup|2>|)>
    </equation>

    \ yields

    <\equation*>
      \<alpha\>*<around|(|\<tau\>,h|)>=<frac|1|2>+O<space|-0.17em><around*|(|<frac|log
      log \<tau\>|log \<tau\>>|)>
    </equation*>
  </proof>

  Write <math|\<alpha\>*<around|(|\<tau\>,h|)>=<frac|1|2>+\<beta\><around|(|\<tau\>,h|)>>
  with <math|\<beta\><around|(|\<tau\>,h|)>=O<around|(|log log \<tau\>/log
  \<tau\>|)>>. Then

  <\equation>
    <label|eq:split><frac|1|T>*<big|int><rsub|\<tau\><rsub|0>><rsup|T>X*<around|(|\<tau\>+h|)><space|0.17em><wide|X<around|(|\<tau\>|)>|\<bar\>><space|0.17em>d*\<tau\>=<frac|1|2>*<space|0.17em>\<cal-I\><around|(|T,h|)>+\<cal-E\><around|(|T,h|)>,
  </equation>

  where

  <\equation*>
    \<cal-I\><around|(|T,h|)>\<assign\><frac|1|T>*<big|int><rsub|\<tau\><rsub|0>><rsup|T>Y*<around|(|\<tau\>+h|)><space|0.17em><wide|Y<around|(|\<tau\>|)>|\<bar\>><space|0.17em>d*\<tau\>,<space|2em>\<cal-E\><around|(|T,h|)>\<assign\><frac|1|T>*<big|int><rsub|\<tau\><rsub|0>><rsup|T>\<beta\><around|(|\<tau\>,h|)>*<space|0.17em>Y*<around|(|\<tau\>+h|)><space|0.17em><wide|Y<around|(|\<tau\>|)>|\<bar\>><space|0.17em>d*\<tau\>.
  </equation*>

  <\lemma>
    <label|lem:error-vanishes><math|\<cal-E\><around|(|T,h|)>\<to\>0> as
    <math|T\<to\>\<infty\>> for every fixed <math|h>.
  </lemma>

  <\proof>
    By Cauchy\USchwarz,

    <\equation*>
      <around|\||\<cal-E\><around|(|T,h|)>|\|>\<le\>sup<rsub|\<tau\>\<ge\>\<tau\><rsub|0>><around|\||\<beta\><around|(|\<tau\>,h|)>|\|>\<cdot\><frac|1|T>*<big|int><rsub|\<tau\><rsub|0>><rsup|T><around|\||Y*<around|(|\<tau\>+h|)><around|\||<space|0.17em>|\|>*Y<around|(|\<tau\>|)>|\|>*<space|0.17em>d*\<tau\>.
    </equation*>

    Applying Cauchy\USchwarz to the integral:

    <\equation*>
      <frac|1|T>*<big|int><rsub|\<tau\><rsub|0>><rsup|T><around|\||Y*<around|(|\<tau\>+h|)><around|\||<space|0.17em>|\|>*Y<around|(|\<tau\>|)>|\|>*<space|0.17em>d*\<tau\>\<le\><around*|(|<frac|1|T>*<big|int><rsub|\<tau\><rsub|0>><rsup|T><around|\||Y*<around|(|\<tau\>+h|)>|\|><rsup|2>*<space|0.17em>d*\<tau\>|)><rsup|1/2>*<around*|(|<frac|1|T>*<big|int><rsub|\<tau\><rsub|0>><rsup|T><around|\||Y<around|(|\<tau\>|)>|\|><rsup|2>*<space|0.17em>d*\<tau\>|)><rsup|1/2>.
    </equation*>

    By (F2), <math|<frac|1|T>*<big|int><rsub|\<tau\><rsub|0>><rsup|T><around|\||Y<around|(|\<tau\>|)>|\|><rsup|2>*<space|0.17em>d*\<tau\>=W<around|(|T|)>/T=2+o<around|(|1|)>>.
    For the shifted version, the shift by fixed <math|h> changes the integral
    by <math|O<around|(|1|)>>, so both factors are <math|O<around|(|1|)>>.
    Since <math|sup <around|\||\<beta\><around|(|\<tau\>,h|)>|\|>=O<around|(|log
    log T/log T|)>\<to\>0>, the product tends to zero.
  </proof>

  By <eqref|eq:split> and Lemma<nbsp><reference|lem:error-vanishes>, to prove
  Theorem<nbsp><reference|thm:cov> it suffices to show

  <\equation>
    <label|eq:suffices>lim<rsub|T\<to\>\<infty\>>
    \<cal-I\><around|(|T,h|)>=<big|int><rsub|-2><rsup|0>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>=<frac|2*e<rsup|-i*h>*sin
    h|h>,
  </equation>

  since then <math|R<around|(|h|)>=<frac|1|2>\<cdot\><frac|2*e<rsup|-i*h>*sin
  h|h>=<frac|e<rsup|-i*h>*sin h|h>>.

  <subsection*|Step 2: Change of Variables to the Height Line>

  Set <math|t=\<sigma\><around|(|\<tau\>|)>>, so
  <math|\<tau\>=\<vartheta\><around|(|t|)>>,
  <math|d*\<tau\>=\<vartheta\><rprime|'><around|(|t|)>*<space|0.17em>d*t>.
  Then

  <\equation*>
    <wide|Y<around|(|\<tau\>|)>|\<bar\>>=<frac|<wide|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\<bar\>>|<sqrt|\<vartheta\><rprime|'><around|(|t|)>>>.
  </equation*>

  For the shifted term, <math|\<sigma\>*<around|(|\<tau\>+h|)>=\<sigma\>*<around|(|\<vartheta\><around|(|t|)>+h|)>>.
  Define the induced height-shift

  <\equation>
    <label|eq:delta-def>\<delta\><rsub|h><around|(|t|)>\<assign\>\<sigma\>*<around|(|\<vartheta\><around|(|t|)>+h|)>-t.
  </equation>

  <\lemma>
    <label|lem:delta>For each fixed <math|h>,

    <\equation*>
      \<delta\><rsub|h><around|(|t|)>=<frac|h|\<vartheta\><rprime|'><around|(|t|)>>+O<space|-0.17em><around*|(|<frac|1|t<around|(|log
      t|)><rsup|3>>|)>
    </equation*>

    as <math|t\<to\>\<infty\>>.
  </lemma>

  <\proof>
    By the mean value theorem applied to <math|\<sigma\>> at
    <math|\<vartheta\><around|(|t|)>>,

    <\equation*>
      \<sigma\>*<around|(|\<vartheta\><around|(|t|)>+h|)>-\<sigma\><around|(|\<vartheta\><around|(|t|)>|)>=h*<space|0.17em>\<sigma\><rprime|'><around|(|\<vartheta\><around|(|t|)>|)>+<frac|h<rsup|2>|2>*\<sigma\><rprime|''><around|(|\<xi\>|)>
    </equation*>

    for some <math|\<xi\>> between <math|\<vartheta\><around|(|t|)>> and
    <math|\<vartheta\><around|(|t|)>+h>. Since
    <math|\<sigma\><rprime|'><around|(|s|)>=1/\<vartheta\><rprime|'><around|(|\<sigma\><around|(|s|)>|)>>
    and <math|\<sigma\><around|(|\<vartheta\><around|(|t|)>|)>=t>, the
    leading term is <math|h/\<vartheta\><rprime|'><around|(|t|)>>. For the
    remainder, <math|\<sigma\><rprime|''><around|(|s|)>=-\<vartheta\><rprime|''><around|(|\<sigma\><around|(|s|)>|)>/<around|(|\<vartheta\><rprime|'><around|(|\<sigma\><around|(|s|)>|)>|)><rsup|3>>
    and <math|\<vartheta\><rprime|''><around|(|t|)>=O<around|(|t<rsup|-1>|)>>,
    <math|\<vartheta\><rprime|'><around|(|t|)>\<sim\><frac|1|2>*log
    <around|(|t/2*\<pi\>|)>>, giving <math|\<sigma\><rprime|''><around|(|\<xi\>|)>=O<around|(|1/<around|(|t<around|(|log
    t|)><rsup|3>|)>|)>>.
  </proof>

  Since <math|\<vartheta\><rprime|'><around|(|t|)>\<sim\><frac|1|2>*log
  <around|(|t/2*\<pi\>|)>>, we have <math|\<delta\><rsub|h><around|(|t|)>\<sim\>2*h/log
  <around|(|t/2*\<pi\>|)>\<to\>0>. The shifted pullback is

  <\equation*>
    Y*<around|(|\<tau\>+h|)>=<frac|\<zeta\>*<around|(|<tfrac|1|2>+i*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>|)>|<sqrt|\<vartheta\><rprime|'>*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>>>.
  </equation*>

  Changing variables <math|\<tau\>\<to\>t> in <math|\<cal-I\>>:

  <\equation>
    <label|eq:I-height>\<cal-I\><around|(|T,h|)>=<frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>><frac|\<zeta\>*<around|(|<tfrac|1|2>+i*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>|)><space|0.17em><wide|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\<bar\>>|<sqrt|\<vartheta\><rprime|'>*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)>>>*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)>*<space|0.17em>d*t,
  </equation>

  where <math|T<rsub|t>=\<sigma\><around|(|T<rsub|\<tau\>>|)>> corresponds to
  the upper limit of integration in the <math|\<tau\>>-variable.

  Since <math|\<delta\><rsub|h><around|(|t|)>\<to\>0>, a first-order Taylor
  expansion gives

  <\equation*>
    \<vartheta\><rprime|'>*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>=\<vartheta\><rprime|'><around|(|t|)>+\<delta\><rsub|h><around|(|t|)>*<space|0.17em>\<vartheta\><rprime|''><around|(|t|)>+O<around|(|\<delta\><rsub|h><around|(|t|)><rsup|2>*<space|0.17em>\<vartheta\><rprime|'''><around|(|t|)>|)>.
  </equation*>

  Using <math|\<vartheta\><rprime|''><around|(|t|)>=O<around|(|t<rsup|-1>|)>>
  and <math|\<delta\><rsub|h><around|(|t|)>=O<around|(|1/log t|)>>:

  <\equation*>
    <frac|\<vartheta\><rprime|'><around|(|t|)>|\<vartheta\><rprime|'>*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>>=1+O<space|-0.17em><around*|(|<frac|1|t*log
    t>|)>.
  </equation*>

  Therefore

  <\equation*>
    <frac|<sqrt|\<vartheta\><rprime|'><around|(|t|)>>|<sqrt|\<vartheta\><rprime|'>*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>>>=1+O<space|-0.17em><around*|(|<frac|1|t*log
    t>|)>.
  </equation*>

  <\lemma>
    <label|lem:jacobian-simplify>For fixed <math|h>,

    <\equation*>
      \<cal-I\><around|(|T,h|)>=<frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>|)><wide|\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>|\<bar\>><space|0.17em>d*t<space|0.27em>+<space|0.27em>o<around|(|1|)>
    </equation*>

    as <math|T<rsub|t>\<to\>\<infty\>>.
  </lemma>

  <\proof>
    From <eqref|eq:I-height>, after cancelling
    <math|<sqrt|\<vartheta\><rprime|'><around|(|t|)>>> from numerator and
    denominator:

    <\equation*>
      \<cal-I\><around|(|T,h|)>=<frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>>\<zeta\>*<around|(|<tfrac|1|2>+i*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>|)><space|0.17em><wide|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\<bar\>>\<cdot\><frac|<sqrt|\<vartheta\><rprime|'><around|(|t|)>>|<sqrt|\<vartheta\><rprime|'>*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>>>*<space|0.17em>d*t.
    </equation*>

    Write the ratio as <math|1+\<gamma\><around|(|t|)>> with
    <math|\<gamma\><around|(|t|)>=O<around|(|1/<around|(|t*log t|)>|)>>. By
    Cauchy\USchwarz,

    <\equation*>
      <frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>><around|\||\<gamma\><around|(|t|)><around|\||<space|0.17em>|\|>*\<zeta\>*<around|(|<tfrac|1|2>+i*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>|)><around|\||<space|0.17em>|\|>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>*<around|\||<space|0.17em>d*t\<le\>sup|\|>*\<gamma\><around|(|t|)>|\|>\<cdot\><frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>><around|\||\<zeta\>*<around|(|<tfrac|1|2>+i*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>|)><around|\||<space|0.17em>|\|>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\|>*<space|0.17em>d*t.
    </equation*>

    By Cauchy\USchwarz on the integral, each factor is controlled by
    <math|V<around|(|T<rsub|t>|)><rsup|1/2>=O<around|(|T<rsub|t><rsup|1/2><around|(|log
    T<rsub|t>|)><rsup|1/2>|)>>. Since <math|\<vartheta\><around|(|T<rsub|t>|)>\<asymp\>T<rsub|t>*log
    T<rsub|t>> and <math|sup <around|\||\<gamma\><around|(|t|)>|\|>=O<around|(|1/<around|(|t<rsub|0>*log
    t<rsub|0>|)>|)>>, the error is <math|O<around|(|T<rsub|t>/<around|(|\<vartheta\><around|(|T<rsub|t>|)>\<cdot\>t<rsub|0>*log
    t<rsub|0>|)>|)>=o<around|(|1|)>>.
  </proof>

  <subsection*|Step 3: Approximate Functional Equation and Diagonal
  Extraction>

  For <math|t\<ge\>t<rsub|<math-up|RS>>>, the approximate functional equation
  gives

  <\equation>
    <label|eq:AFE>\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>=<wide*|<big|sum><rsub|n\<le\>N<around|(|t|)>>n<rsup|-1/2-i*t>|\<wide-underbrace\>><rsub|A<around|(|t|)>>+e<rsup|-2*i*\<vartheta\><around|(|t|)>><wide*|<big|sum><rsub|n\<le\>N<around|(|t|)>>n<rsup|-1/2+i*t>|\<wide-underbrace\>><rsub|B<around|(|t|)>>+R<around|(|t|)>,
  </equation>

  where <math|N<around|(|t|)>=<around|\<lfloor\>|<sqrt|t/<around|(|2*\<pi\>|)>>|\<rfloor\>>>
  and <math|<around|\||R<rsup|<around|(|j|)>><around|(|t|)>|\|>\<le\>C<rsub|j>*<space|0.17em>t<rsup|-1/4-j/2>>.

  The product <math|\<zeta\>*<around|(|<tfrac|1|2>+i*<around|(|t+\<delta\>|)>|)><space|0.17em><wide|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\<bar\>>>
  expands into four main terms:

  <\align*>
    <tformat|<table|<row|<cell|<text|I>>|<cell|=A*<around|(|t+\<delta\>|)><space|0.17em><wide|A<around|(|t|)>|\<bar\>>,>>|<row|<cell|<text|II>>|<cell|=A*<around|(|t+\<delta\>|)>*<space|0.17em>e<rsup|2*i*\<vartheta\><around|(|t|)>><space|0.17em><wide|B<around|(|t|)>|\<bar\>>,>>|<row|<cell|<text|III>>|<cell|=e<rsup|-2*i*\<vartheta\>*<around|(|t+\<delta\>|)>>*<space|0.17em>B*<around|(|t+\<delta\>|)><space|0.17em><wide|A<around|(|t|)>|\<bar\>>,>>|<row|<cell|<text|IV>>|<cell|=e<rsup|-2*i*\<vartheta\>*<around|(|t+\<delta\>|)>>*<space|0.17em>B*<around|(|t+\<delta\>|)>*<space|0.17em>e<rsup|2*i*\<vartheta\><around|(|t|)>><space|0.17em><wide|B<around|(|t|)>|\<bar\>>,>>>>
  </align*>

  plus cross-terms involving <math|R>, which we treat separately. Here
  <math|\<delta\>=\<delta\><rsub|h><around|(|t|)>> throughout.

  <vspace*|1fn><no-indent><with|font-series|bold|Term<nbsp>I (diagonal, upper
  band).><space|0.5em>

  <\equation*>
    A*<around|(|t+\<delta\>|)><space|0.17em><wide|A<around|(|t|)>|\<bar\>>=<big|sum><rsub|m,n\<le\>N<around|(|t|)>><frac|1|<sqrt|m*n>>*<space|0.17em>m<rsup|-i*<around|(|t+\<delta\>|)>>*<space|0.17em>n<rsup|i*t>=<big|sum><rsub|m,n\<le\>N<around|(|t|)>><frac|1|<sqrt|m*n>>*<space|0.17em><around|(|n/m|)><rsup|i*t>*<space|0.17em>m<rsup|-i*\<delta\>>.
  </equation*>

  The <em|diagonal> (<math|m=n>) contributes

  <\equation>
    <label|eq:diagI>D<rsub|<math-up|I>><around|(|t|)>\<assign\><big|sum><rsub|n\<le\>N<around|(|t|)>><frac|1|n>*<space|0.17em>n<rsup|-i*\<delta\><rsub|h><around|(|t|)>>=<big|sum><rsub|n\<le\>N<around|(|t|)>><frac|e<rsup|-i*\<delta\><rsub|h><around|(|t|)>*log
    n>|n>.
  </equation>

  The <em|off-diagonal> (<math|m\<ne\>n>) terms carry the oscillating factor
  <math|<around|(|n/m|)><rsup|i*t>> with <math|log <around|(|n/m|)>\<ne\>0>.
  By the Montgomery\UVaughan mean-value theorem applied to the Cesàro average
  over the window <math|<around|[|t<rsub|0>,T<rsub|t>|]>> with normalization
  <math|1/\<vartheta\><around|(|T<rsub|t>|)>>, the off-diagonal contributes
  <math|o<around|(|1|)>> as <math|T<rsub|t>\<to\>\<infty\>>, since the
  cross-term error is <math|O<around|(|<sqrt|T<rsub|t>>/\<vartheta\><around|(|T<rsub|t>|)>|)>=O<around|(|1/<sqrt|T<rsub|t>*log<rsup|2>
  T<rsub|t>>|)>=o<around|(|1|)>>.

  For the diagonal <eqref|eq:diagI>, use Lemma<nbsp><reference|lem:delta>:
  <math|\<delta\><rsub|h><around|(|t|)>*log n=h*log
  n/\<vartheta\><rprime|'><around|(|t|)>+O<around|(|log
  n/<around|(|t<around|(|log t|)><rsup|3>|)>|)>>. Define the spectral
  variable

  <\equation>
    <label|eq:omega-def>\<omega\><rsub|n><around|(|t|)>\<assign\>-<frac|log
    n|\<vartheta\><rprime|'><around|(|t|)>>.
  </equation>

  For <math|1\<le\>n\<le\>N<around|(|t|)>> with
  <math|N<around|(|t|)>=<around|\<lfloor\>|<sqrt|t/<around|(|2*\<pi\>|)>>|\<rfloor\>>>,
  we have <math|0\<le\>log n\<le\><frac|1|2>*log
  <around|(|t/<around|(|2*\<pi\>|)>|)>> and
  <math|\<vartheta\><rprime|'><around|(|t|)>=<frac|1|2>*log
  <around|(|t/<around|(|2*\<pi\>|)>|)>+O<around|(|t<rsup|-2>|)>>, so

  <\equation*>
    \<omega\><rsub|n><around|(|t|)>\<in\><around|[|-1-O<around|(|t<rsup|-2>|)>,<space|0.27em>0|]>.
  </equation*>

  The phase in <eqref|eq:diagI> is <math|-i*\<delta\><rsub|h><around|(|t|)>*log
  n=i*\<omega\><rsub|n><around|(|t|)>*<space|0.17em>h*<space|0.17em><around|(|1+O<around|(|1/<around|(|t*log<rsup|2>
  t|)>|)>|)>>.

  The Cesàro average of the diagonal is

  <\equation>
    <label|eq:cesaro-diagI><frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>>D<rsub|<math-up|I>><around|(|t|)>*<space|0.17em>d*t=<frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>><big|sum><rsub|n\<le\>N<around|(|t|)>><frac|e<rsup|i*\<omega\><rsub|n><around|(|t|)>*<space|0.17em>h*<space|0.17em><around|(|1+o<around|(|1|)>|)>>|n>*<space|0.17em>d*t.
  </equation>

  As <math|t\<to\>\<infty\>>, the sum <math|<big|sum><rsub|n\<le\>N<around|(|t|)>>1/n\<sim\><frac|1|2>*log
  <around|(|t/<around|(|2*\<pi\>|)>|)>\<sim\>\<vartheta\><rprime|'><around|(|t|)>>,
  and the spectral variable <math|\<omega\><rsub|n><around|(|t|)>> ranges
  over <math|<around|[|-1,0|]>> with density converging to uniform (Lebesgue)
  measure on <math|<around|[|-1,0|]>>. More precisely, the partial-summation
  identity

  <\equation*>
    <big|sum><rsub|n\<le\>N><frac|f*<around|(|log
    n/L|)>|n>=<big|int><rsub|0><rsup|1>f<around|(|u|)>*<space|0.17em>L*<space|0.17em>d*u+O<space|-0.17em><around*|(|<frac|log
    N|N>|)>,
  </equation*>

  where <math|L=log N> and <math|u=log n/L>, applied with
  <math|f<around|(|u|)>=e<rsup|-i*u*h>> and <math|L=<frac|1|2>*log
  <around|(|t/<around|(|2*\<pi\>|)>|)>>, yields

  <\equation*>
    D<rsub|<math-up|I>><around|(|t|)>=\<vartheta\><rprime|'><around|(|t|)>*<big|int><rsub|-1><rsup|0>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>+O<around|(|1|)>.
  </equation*>

  Therefore

  <\align*>
    <tformat|<table|<row|<cell|<frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>>D<rsub|<math-up|I>><around|(|t|)>*<space|0.17em>d*t>|<cell|=<frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>>\<vartheta\><rprime|'><around|(|t|)>*<space|0.17em>d*t\<cdot\><big|int><rsub|-1><rsup|0>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>+O<space|-0.17em><around*|(|<frac|T<rsub|t>|\<vartheta\><around|(|T<rsub|t>|)>>|)>>>|<row|<cell|>|<cell|=<frac|\<vartheta\><around|(|T<rsub|t>|)>-\<vartheta\><around|(|t<rsub|0>|)>|\<vartheta\><around|(|T<rsub|t>|)>>\<cdot\><big|int><rsub|-1><rsup|0>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>+O<space|-0.17em><around*|(|<frac|1|log
    T<rsub|t>>|)>>>|<row|<cell|>|<cell|\<to\><big|int><rsub|-1><rsup|0>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>.>>>>
  </align*>

  <vspace*|1fn><no-indent><with|font-series|bold|Term<nbsp>IV (diagonal,
  lower band).><space|0.5em>The phase factor is
  <math|e<rsup|-2*i*\<vartheta\>*<around|(|t+\<delta\>|)>+2*i*\<vartheta\><around|(|t|)>>>.
  By the mean value theorem,

  <\equation*>
    \<vartheta\>*<around|(|t+\<delta\>|)>-\<vartheta\><around|(|t|)>=\<delta\>*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)>+O<around|(|\<delta\><rsup|2>*<space|0.17em>\<vartheta\><rprime|''><around|(|t|)>|)>=h+O<space|-0.17em><around*|(|<frac|1|t<around|(|log
    t|)><rsup|2>>|)>,
  </equation*>

  since <math|\<delta\>*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)>=h+O<around|(|1/<around|(|t<around|(|log
  t|)><rsup|2>|)>|)>> from Lemma<nbsp><reference|lem:delta>. Thus the phase
  factor is <math|e<rsup|-2*i*h>*<around|(|1+O<around|(|1/<around|(|t<around|(|log
  t|)><rsup|2>|)>|)>|)>>.

  Term<nbsp>IV is

  <\equation*>
    e<rsup|-2*i*h+o<around|(|1|)>>*<space|0.17em>B*<around|(|t+\<delta\>|)><space|0.17em><wide|B<around|(|t|)>|\<bar\>>=e<rsup|-2*i*h+o<around|(|1|)>>*<big|sum><rsub|m,n\<le\>N<around|(|t|)>><frac|1|<sqrt|m*n>>*<space|0.17em><around|(|m/n|)><rsup|i*t>*<space|0.17em>m<rsup|i*\<delta\>>.
  </equation*>

  The diagonal (<math|m=n>) contributes

  <\equation*>
    D<rsub|<math-up|IV>><around|(|t|)>=e<rsup|-2*i*h+o<around|(|1|)>>*<big|sum><rsub|n\<le\>N<around|(|t|)>><frac|e<rsup|i*\<delta\><rsub|h><around|(|t|)>*log
    n>|n>.
  </equation*>

  The phase per summand is <math|e<rsup|i*\<delta\><rsub|h><around|(|t|)>*log
  n>=e<rsup|-i*\<omega\><rsub|n><around|(|t|)>*<space|0.17em>h*<space|0.17em><around|(|1+o<around|(|1|)>|)>>>
  (note the sign reversal from <math|n<rsup|+i*t>> in <math|B>). After the
  <math|e<rsup|-2*i*h>> prefactor, the total phase of the <math|n>-th term at
  spectral variable <math|\<omega\><rsub|n>> is
  <math|e<rsup|-2*i*h>*e<rsup|-i*\<omega\><rsub|n>*h>=e<rsup|i*<around|(|-\<omega\><rsub|n>-2|)>*h>>.
  Defining <math|<wide|\<omega\>|~><rsub|n>=-\<omega\><rsub|n>-2\<in\><around|[|-2,-1|]>>
  for <math|\<omega\><rsub|n>\<in\><around|[|-1,0|]>>:

  <\equation*>
    D<rsub|<math-up|IV>><around|(|t|)>=\<vartheta\><rprime|'><around|(|t|)>*<big|int><rsub|-2><rsup|-1>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>+O<around|(|1|)>.
  </equation*>

  The same Cesàro averaging as for Term<nbsp>I gives

  <\equation*>
    <frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>>D<rsub|<math-up|IV>><around|(|t|)>*<space|0.17em>d*t\<to\><big|int><rsub|-2><rsup|-1>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>.
  </equation*>

  <vspace*|1fn><no-indent><with|font-series|bold|Terms<nbsp>II and<nbsp>III
  (cross-terms).><space|0.5em>Term<nbsp>II carries the phase
  <math|e<rsup|2*i*\<vartheta\><around|(|t|)>>>, and Term<nbsp>III carries
  <math|e<rsup|-2*i*\<vartheta\>*<around|(|t+\<delta\>|)>>=e<rsup|-2*i*\<vartheta\><around|(|t|)>>*e<rsup|-2*i*h+o<around|(|1|)>>>.
  In both cases, the phases <math|e<rsup|\<pm\>2*i*\<vartheta\><around|(|t|)>>>
  oscillate with instantaneous frequency <math|\<pm\>2*\<vartheta\><rprime|'><around|(|t|)>\<to\>\<pm\>\<infty\>>,
  while the amplitudes (products of Dirichlet polynomials of length
  <math|N<around|(|t|)>\<asymp\>t<rsup|1/2>>) have Cesàro mean square
  <math|O<around|(|\<vartheta\><rprime|'><around|(|t|)>|)>> by the
  Montgomery\UVaughan theorem. The Riemann\ULebesgue lemma (in the Cesàro
  averaging form: the Cesàro mean of <math|f<around|(|t|)>*e<rsup|i*\<lambda\><around|(|t|)>>>
  vanishes when <math|\<lambda\><rprime|'><around|(|t|)>\<to\>\<infty\>> and
  <math|f> has at most polynomial growth) gives

  <\equation*>
    <frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>><around|(|<text|Term<nbsp>II>|)>*<space|0.17em>d*t\<to\>0,<space|2em><frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>><around|(|<text|Term<nbsp>III>|)>*<space|0.17em>d*t\<to\>0.
  </equation*>

  <vspace*|1fn><no-indent><with|font-series|bold|Remainder
  cross-terms.><space|0.5em>Every cross-term involving
  <math|R<around|(|t|)>=O<around|(|t<rsup|-1/4>|)>> produces a product
  bounded pointwise by <math|O<around|(|t<rsup|-1/4>|)>\<cdot\>O<around|(|t<rsup|1/4+\<varepsilon\>>|)>=O<around|(|t<rsup|\<varepsilon\>>|)>>
  (using the convexity bound <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>\<ll\>t<rsup|1/4+\<varepsilon\>>>
  for the other factor). After Cesàro averaging:

  <\equation*>
    <frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>>O<around|(|t<rsup|\<varepsilon\>>|)>*<space|0.17em>d*t=O<space|-0.17em><around*|(|<frac|T<rsub|t><rsup|1+\<varepsilon\>>|\<vartheta\><around|(|T<rsub|t>|)>>|)>=O<space|-0.17em><around*|(|<frac|T<rsub|t><rsup|\<varepsilon\>>|log
    T<rsub|t>>|)>=o<around|(|1|)>.
  </equation*>

  <subsection*|Step 4: Assembly>

  Combining all terms:

  <\align*>
    <tformat|<table|<row|<cell|lim<rsub|T<rsub|t>\<to\>\<infty\>>
    <frac|1|\<vartheta\><around|(|T<rsub|t>|)>>*<big|int><rsub|t<rsub|0>><rsup|T<rsub|t>>\<zeta\>*<around|(|<tfrac|1|2>+i*<around|(|t+\<delta\><rsub|h><around|(|t|)>|)>|)><space|0.17em><wide|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>|\<bar\>><space|0.17em>d*t>|<cell|=<big|int><rsub|-1><rsup|0>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>+<big|int><rsub|-2><rsup|-1>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>>>|<row|<cell|>|<cell|=<big|int><rsub|-2><rsup|0>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>.>>>>
  </align*>

  By Lemma<nbsp><reference|lem:jacobian-simplify>,
  <math|\<cal-I\><around|(|T,h|)>> has the same limit:

  <\equation*>
    lim<rsub|T\<to\>\<infty\>> \<cal-I\><around|(|T,h|)>=<big|int><rsub|-2><rsup|0>e<rsup|i*\<omega\>*h>*<space|0.17em>d*\<omega\>=<frac|2*e<rsup|-i*h>*sin
    h|h>.
  </equation*>

  By <eqref|eq:split> and Lemma<nbsp><reference|lem:error-vanishes>:

  <\equation*>
    R<around|(|h|)>=<frac|1|2>\<cdot\><frac|2*e<rsup|-i*h>*sin
    h|h>=<frac|e<rsup|-i*h>*sin h|h>.
  </equation*>

  <no-indent><with|font-series|bold|Consistency check at
  <math|h=0>.><space|0.5em><math|R<around|(|0|)>=lim<rsub|h\<to\>0><around|(|e<rsup|-i*h>*sin
  h|)>/h=1>, which matches Theorem<nbsp>1 of the companion document (unit
  Cesàro mean square of <math|X>). <math|\<Box\>>

  <section|References>

  <\enumerate>
    <item>A.<space|0.17em>E.<nbsp>Ingham, Mean-value theorems in the theory
    of the Riemann zeta-function, <em|Proc. London Math. Soc.> (2)
    <with|font-series|bold|27> (1928), 273\U300.

    <item>E.<space|0.17em>C.<nbsp>Titchmarsh, <em|The Theory of the Riemann
    Zeta-Function>, 2nd ed. (revised by D.<space|0.17em>R.<nbsp>Heath-Brown),
    Oxford University Press, 1986.

    <item>H.<space|0.17em>L.<nbsp>Montgomery and
    R.<space|0.17em>C.<nbsp>Vaughan, Hilbert's inequality, <em|J. London
    Math. Soc.> (2) <with|font-series|bold|8> (1974), 73\U82.

    <item>C.<nbsp>O'Sullivan, A generalization of the Riemann\USiegel
    formula, <em|J. Number Theory> <with|font-series|bold|128> (2008),
    2043\U2066.

    <item>R.<space|0.17em>B.<nbsp>Paris, Refined asymptotics of the
    Riemann\USiegel theta function, 2020, arXiv:2004.00926.
  </enumerate>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|6|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|6|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-7|<tuple|12|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-8|<tuple|4|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|cor:spectral|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:AFE|<tuple|9|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:I-height|<tuple|8|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Rdef|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Rvalue|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:alpha-def|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:cesaro-diagI|<tuple|12|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:delta-def|<tuple|7|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:diagI|<tuple|10|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:omega-def|<tuple|11|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:split|<tuple|5|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:suffices|<tuple|6|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:alpha|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:delta|<tuple|5|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:error-vanishes|<tuple|4|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:jacobian-simplify|<tuple|6|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:cov|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Notation
      and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Statement>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Proof
      of Theorem <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>><reference|thm:cov>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Step 1: Separation of the Slowly Varying
      Prefactor <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|Step 2: Change of Variables to the Height
      Line <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|Step 3: Approximate Functional Equation and
      Diagonal Extraction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|Step 4: Assembly
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>