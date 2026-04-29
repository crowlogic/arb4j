<TeXmacs|2.1.4>

<style|amsart>

<\body>
  <\hide-preamble>
    <assign|Ima|<macro|Im>>

    <assign|Rea|<macro|Re>>

    <assign|abs|<macro|1|<left|\|><arg|1><right|\|>>>

    <assign|norm|<macro|1|<left|\|><arg|1><right|\|>>>
  </hide-preamble>

  <doc-data|<doc-title|Band-Limitedness of the Hardy
  <math|Z>-Function<next-line>in the Phase
  Variable>|<doc-date|<date|>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-email|stephencrowley214@gmail.com>>>>

  <abstract-data|<abstract-msc|11M06| 11M26| 42A38|
  26A45>|<abstract-keywords|Hardy <math|Z>-function| Riemann--Siegel formula|
  band-limited function| phase variable| Cesàro--Fourier
  transform>|<\abstract>
    Let <math|\<vartheta\>(t)=<Ima>log \<Gamma\><space|-0.17em><left|(><tfrac|1|4>+<tfrac|i*t|2><right|)>-<tfrac|t|2>log
    \<pi\>> be the Riemann--Siegel theta function and
    <math|Z(t)=e<rsup|i\<vartheta\>(t)>\<zeta\><space|-0.17em><left|(><tfrac|1|2>+i*t<right|)>>
    the Hardy <math|Z>-function. Fix any constant
    <math|C\<gtr\>c<rsub|\<ast\>>>, where

    <\equation*>
      c<rsub|\<ast\>><space|0.27em>:=<space|0.27em><tfrac|1|2><space|-0.17em><left|(>\<gamma\>+3log
      2+<tfrac|\<pi\>|2>+log \<pi\><right|)><space|0.27em>\<approx\><space|0.27em>2.6860917,
    </equation*>

    so that <math|\<Theta\>(t):=\<vartheta\>(t)+C*t> is a
    <math|C<rsup|\<infty\>>> diffeomorphism of <math|[0,\<infty\>)>, and let
    <math|<wide|Z|~>:=Z\<circ\>\<Theta\><rsup|-1>>. We prove that for every
    <math|\<xi\>\<in\>\<bbb-R\>> with <math|\|\<xi\>\|\<gtr\>1>,

    <\equation*>
      <frac|1|\<Theta\>(T)><big|int><rsub|0><rsup|\<Theta\>(T)><wide|Z|~>(u)<space|0.17em>e<rsup|-i\<xi\>u><space|0.17em>d*u<space|0.27em>\<longrightarrow\><space|0.27em>0<space|1em><text|as>T\<to\>\<infty\>.
    </equation*>

    The proof is self-contained and uses only three ingredients: (i)<nbsp>the
    Riemann--Siegel expansion with remainder <math|O(t<rsup|-1/4>>);
    (ii)<nbsp>one integration by parts with an exact antiderivative whose
    tail telescopes identically to zero; and (iii)<nbsp>the elementary
    phase-derivative bound <math|\<omega\><rsub|n>(u)\<in\>[0,1>). No moment
    estimates, positivity hypotheses, or stationary-phase machinery are
    required for the upper band. The spectral cutoff <math|\|\<xi\>\|=1> is
    sharp: for every <math|\<xi\>\<in\>(-1,1)\<setminus\>{0}> the Cesàro
    average is bounded away from zero.
  </abstract>>

  <\table-of-contents|toc>
    \;
  </table-of-contents>

  <section|Introduction>

  The Riemann\USiegel theta function <math|\<vartheta\><around|(|t|)>>
  satisfies <math|\<vartheta\><rprime|'><around|(|t|)>\<sim\><tfrac|1|2>log
  <around|(|t/2*\<pi\>|)>\<to\>+\<infty\>>, so the Hardy <math|Z>-function
  oscillates at a rate that grows without bound. A natural strategy is to
  absorb this growth into a change of variables: replace the time parameter
  <math|t> by the <em|accumulated phase> <math|u=\<Theta\><around|(|t|)>\<assign\>\<vartheta\><around|(|t|)>+C*t>,
  where <math|C\<gtr\>c<rsub|\<ast\>>> is chosen so that <math|\<Theta\>> is
  a globally increasing diffeomorphism. The reparametrized function
  <math|<wide|Z|~><around|(|u|)>\<assign\>Z<around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>
  then has a well-defined spectral theory in the Cesàro sense.

  The main result, Theorem<nbsp><reference|thm:band>, shows that the
  Cesàro\UFourier transform of <math|<wide|Z|~>> is supported in
  <math|<around|[|-1,1|]>>, i.e., that <math|<wide|Z|~>> is <em|band-limited>
  to <math|<around|[|-1,1|]>>. The argument proceeds in three steps that
  mirror the Riemann\USiegel decomposition<nbsp><eqref|eq:RS>. The cosine sum
  contributes mode integrals <math|I<rsub|n><around|(|\<xi\>,T|)>>, each
  bounded via a single integration by parts (Lemma<nbsp><reference|lem:IBP>);
  the error term is absorbed by the classical
  <math|O<around|(|t<rsup|-1/4>|)>> bound on the Riemann\USiegel remainder
  (Step<nbsp>3 of the proof).

  A key feature distinguishing this argument from stationary-phase or
  van-der-Corput methods is that the tail integral in the integration by
  parts telescopes <em|exactly>, yielding the sharp bound
  <math|<around|\||I<rsub|n><around|(|\<xi\>,T|)>|\|>\<le\>2/<around|(|\<xi\>-1|)>>
  with no asymptotic error. The cutoff <math|<around|\||\<xi\>|\|>=1> is
  confirmed to be optimal in Corollary<nbsp><reference|cor:sharp>: at every
  interior frequency <math|\<xi\>\<in\><around|(|-1,1|)>> the
  stationary-phase contribution to <math|I<rsub|n>> is non-degenerate, so the
  Cesàro average does not vanish.

  Throughout, <math|\<gamma\>> denotes the Euler\UMascheroni constant,
  <math|\<psi\>=\<Gamma\><rprime|'>/\<Gamma\>> the digamma function,
  <math|f\<ll\>g> means <math|<around|\||f|\|>\<le\>C*g> for an absolute
  constant <math|C\<gtr\>0>, and <math|<around|\<lfloor\>|<space|0.17em>\<cdummy\><space|0.17em>|\<rfloor\>>>
  denotes the floor function.

  <section|Setup and Notation>

  <\definition>
    [Hardy <math|Z>-function]<label|def:Z> For <math|t\<ge\>0> define

    <\equation*>
      \<vartheta\><around|(|t|)><space|0.27em>\<assign\><space|0.27em><Ima>log
      \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log
      \<pi\>,<space|2em>Z<around|(|t|)><space|0.27em>\<assign\><space|0.27em>e<rsup|i*\<vartheta\><around|(|t|)>>*\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>.
    </equation*>

    The function <math|Z> is real-valued with zeros exactly the zeros of
    <math|\<zeta\>> on <math|<Rea>s=<tfrac|1|2>>.
  </definition>

  <\definition>
    [Shifted phase map]<label|def:Theta> Set

    <\equation*>
      c<rsub|\<ast\>><space|0.27em>\<assign\><space|0.27em><tfrac|1|2><space|-0.17em><around*|(|\<gamma\>+3*log
      2+<tfrac|\<pi\>|2>+log \<pi\>|)>,
    </equation*>

    fix any <math|C\<gtr\>c<rsub|\<ast\>>>, and define

    <\equation*>
      \<Theta\><around|(|t|)><space|0.27em>\<assign\><space|0.27em>\<vartheta\><around|(|t|)>+C*t,<space|2em>g<space|0.27em>\<assign\><space|0.27em>\<Theta\><rsup|-1>,<space|2em><wide|Z|~><around|(|u|)><space|0.27em>\<assign\><space|0.27em>Z<around|(|g<around|(|u|)>|)>.
    </equation*>
  </definition>

  <\proposition>
    [Diffeomorphism property]<label|prop:diffeo> For any
    <math|C\<gtr\>c<rsub|\<ast\>>>, the map
    <math|\<Theta\>:<around|[|0,\<infty\>|)>\<to\><around*|[|\<Theta\><around|(|0|)>,\<infty\>|)>>
    is a <math|C<rsup|\<infty\>>> diffeomorphism with

    <\equation*>
      \<Theta\><rprime|'><around|(|t|)><space|0.27em>=<space|0.27em>\<vartheta\><rprime|'><around|(|t|)>+C<space|0.27em>\<gtr\><space|0.27em>0<space|1em>\<forall\><space|0.17em>t\<ge\>0,<space|2em>\<Theta\><rprime|'><around|(|t|)><space|0.27em>\<sim\><space|0.27em><tfrac|1|2>log
      <space|-0.17em><around*|(|<tfrac|t|2*\<pi\>>|)>*<space|1em><around|(|t\<to\>\<infty\>|)>.
    </equation*>

    Moreover, <math|\<Theta\><around|(|T|)>\<sim\><tfrac|T|2>log
    <around|(|T/2*\<pi\>|)>> as <math|T\<to\>\<infty\>>.
  </proposition>

  <\proof>
    The identity <math|\<vartheta\><rprime|'><around|(|t|)>=<tfrac|1|2><Rea><space|0.17em>\<psi\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|1|2>log
    \<pi\>> and the digamma special value
    <math|\<psi\><space|-0.17em><around*|(|<tfrac|1|4>|)>=-\<gamma\>-<tfrac|\<pi\>|2>-3*log
    2> give

    <\equation*>
      \<vartheta\><rprime|'><around|(|0|)>=<tfrac|1|2>\<psi\><space|-0.17em><around*|(|<tfrac|1|4>|)>-<tfrac|1|2>log
      \<pi\>=-<tfrac|1|2><space|-0.17em><around*|(|\<gamma\>+<tfrac|\<pi\>|2>+3*log
      2+log \<pi\>|)>=-c<rsub|\<ast\>>.
    </equation*>

    Since <math|\<vartheta\><rprime|'>> is strictly increasing with
    <math|\<vartheta\><rprime|'><around|(|t|)>=<tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>+O<around|(|t<rsup|-2>|)>> <cite|Titchmarsh1986>,
    its global infimum is <math|-c<rsub|\<ast\>>>, so
    <math|\<Theta\><rprime|'><around|(|t|)>=\<vartheta\><rprime|'><around|(|t|)>+C\<gtr\>0>
    for all <math|t\<ge\>0> whenever <math|C\<gtr\>c<rsub|\<ast\>>>.
    Surjectivity onto <math|<around|[|\<Theta\><around|(|0|)>,\<infty\>|)>>
    is immediate from <math|\<Theta\><around|(|t|)>\<to\>\<infty\>>. The
    asymptotic for <math|\<Theta\><around|(|T|)>> follows by integration.
  </proof>

  <section|Riemann\USiegel Expansion>

  Set <math|N<around|(|t|)>\<assign\><around|\<lfloor\>|<sqrt|t/<around|(|2*\<pi\>|)>>|\<rfloor\>>>.
  The Riemann\USiegel formula <cite|Siegel1932|Titchmarsh1986> asserts

  <\equation>
    <label|eq:RS>Z<around|(|t|)><space|0.27em>=<space|0.27em>2*<big|sum><rsub|n=1><rsup|N<around|(|t|)>>n<rsup|-1/2>*cos
    <space|-0.17em><around*|(|\<vartheta\><around|(|t|)>-t*log
    n|)>+R<around|(|t|)>,<space|2em><abs|R<around|(|t|)>>\<ll\>t<rsup|-1/4>,<space|1em>t\<ge\>1.
  </equation>

  <\lemma>
    [Partial-sum bound]<label|lem:partial> For all <math|T\<ge\>1>,

    <\equation*>
      <big|sum><rsub|n=1><rsup|N<around|(|T|)>>n<rsup|-1/2><space|0.27em>\<le\><space|0.27em>2<space|-0.17em><around*|(|<frac|T|2*\<pi\>>|)><rsup|1/4>+2.
    </equation*>
  </lemma>

  <\proof>
    The standard estimate <math|<big|sum><rsub|n=1><rsup|M>n<rsup|-1/2>\<le\>2*<sqrt|M>+1>,
    applied with <math|M=N<around|(|T|)>\<le\><around|(|T/2*\<pi\>|)><rsup|1/2>>,
    gives the result.
  </proof>

  <section|Phase-Derivative Identity>

  For <math|n\<ge\>1> and <math|u\<ge\>u<rsub|n>\<assign\>\<Theta\>*<around|(|2*\<pi\>*n<rsup|2>|)>>,
  define the <em|mode phase> and <em|frequency ratio>

  <\equation>
    <label|eq:Phi-omega>\<Phi\><rsub|n><around|(|u|)><space|0.27em>\<assign\><space|0.27em>\<vartheta\><around|(|g<around|(|u|)>|)>-g<around|(|u|)>*log
    n,<space|2em>\<omega\><rsub|n><around|(|u|)><space|0.27em>\<assign\><space|0.27em><frac|\<vartheta\><rprime|'><around|(|g<around|(|u|)>|)>-log
    n|\<Theta\><rprime|'><around|(|g<around|(|u|)>|)>>.
  </equation>

  <\lemma>
    [Phase-derivative identity]<label|lem:phase> For all integers
    <math|n\<ge\>1>, all <math|u\<ge\>u<rsub|n>>, and all
    <math|\<xi\>\<in\>\<bbb-R\>>:

    <\enumerate>
      <item*|<with|font-shape|right|(a)>><math|<with|math-display|true|<frac|d|d*u>*<around*|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>=\<omega\><rsub|n><around|(|u|)>-\<xi\>>>.

      <item*|<with|font-shape|right|(b)>><math|\<omega\><rsub|n><around|(|u<rsub|n>|)>=0>.

      <item*|<with|font-shape|right|(c)>><math|0\<le\>\<omega\><rsub|n><around|(|u|)>\<less\>1>
      for all <math|u\<ge\>u<rsub|n>>.

      <item*|<with|font-shape|right|(d)>><math|<with|math-display|true|\<omega\><rsub|n><rprime|'><around|(|u|)>=<frac|<around|(|C+log
      n|)>*<space|0.17em>\<vartheta\><rprime|''><around|(|g<around|(|u|)>|)>|\<Theta\><rprime|'><around|(|g<around|(|u|)>|)><rsup|3>>\<gtr\>0>>;
      hence <math|\<omega\><rsub|n>> is strictly increasing on
      <math|<around|[|u<rsub|n>,\<infty\>|)>>.

      <item*|<with|font-shape|right|(e)>>For every constant
      <math|\<xi\>\<nin\>\<omega\><rsub|n><space|-0.17em><around*|(|<around|[|u<rsub|n>,\<infty\>|)>|)>>,

      <\equation*>
        <frac|d|d*u><space|-0.17em><around*|[|<frac|1|\<xi\>-\<omega\><rsub|n><around|(|u|)>>|]>=<frac|\<omega\><rsub|n><rprime|'><around|(|u|)>|<around|(|\<xi\>-\<omega\><rsub|n><around|(|u|)>|)><rsup|2>>.
      </equation*>
    </enumerate>
  </lemma>

  <\proof>
    <with|font-series|bold|(a).> Using <math|g<rprime|'><around|(|u|)>=1/\<Theta\><rprime|'><around|(|g<around|(|u|)>|)>>:

    <\equation*>
      <frac|d*\<Phi\><rsub|n>|d*u>=<around*|(|\<vartheta\><rprime|'><around|(|g<around|(|u|)>|)>-log
      n|)>\<cdot\>g<rprime|'><around|(|u|)>=<frac|\<vartheta\><rprime|'><around|(|g<around|(|u|)>|)>-log
      n|\<Theta\><rprime|'><around|(|g<around|(|u|)>|)>>=\<omega\><rsub|n><around|(|u|)>.
    </equation*>

    Subtracting <math|\<xi\>> gives part<nbsp>(a).

    <vspace*|0.5fn><no-indent><with|font-series|bold|(b).> The classical
    saddle-point identity <math|\<vartheta\><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)>=<tfrac|1|2>log
    <around|(|n<rsup|2>|)>=log n> <cite-detail|Titchmarsh1986|Chapter<nbsp>4>
    gives <math|\<omega\><rsub|n><around|(|u<rsub|n>|)>=<around|(|log n-log
    n|)>/\<Theta\><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)>=0>.

    <vspace*|0.5fn><no-indent><with|font-series|bold|(c).> Non-negativity:
    <math|\<omega\><rsub|n><around|(|u<rsub|n>|)>=0> and
    <math|\<omega\><rsub|n>> is increasing by<nbsp>(d). The upper bound
    follows from the algebraic identity

    <\equation*>
      \<omega\><rsub|n><around|(|u|)>=1-<frac|log
      n+C|\<vartheta\><rprime|'><around|(|g<around|(|u|)>|)>+C>\<less\>1,
    </equation*>

    since <math|log n+C\<gtr\>0> for all <math|n\<ge\>1> and
    <math|C\<gtr\>0>.

    <vspace*|0.5fn><no-indent><with|font-series|bold|(d).> Write
    <math|\<omega\><rsub|n>=f\<circ\>g<space|0.17em>/<space|0.17em>h\<circ\>g>
    with <math|f<around|(|t|)>\<assign\>\<vartheta\><rprime|'><around|(|t|)>-log
    n> and <math|h<around|(|t|)>\<assign\>\<Theta\><rprime|'><around|(|t|)>=\<vartheta\><rprime|'><around|(|t|)>+C>.
    Then <math|f<rprime|'>=h<rprime|'>=\<vartheta\><rprime|''>>, so the
    quotient rule and <math|g<rprime|'>=1/<around|(|h\<circ\>g|)>> give

    <\align*>
      <tformat|<table|<row|<cell|\<omega\><rsub|n><rprime|'><around|(|u|)>>|<cell|=<frac|f<rprime|'><around|(|g|)>*<space|0.17em>h<around|(|g|)>-f<around|(|g|)>*<space|0.17em>h<rprime|'><around|(|g|)>|h<around|(|g|)><rsup|2>>\<cdot\>g<rprime|'><around|(|u|)>>>|<row|<cell|<vspace*|4pt>>|<cell|=<frac|\<vartheta\><rprime|''><around|(|g|)>*<around*|[|h<around|(|g|)>-f<around|(|g|)>|]>|h<around|(|g|)><rsup|3>>=<frac|<around|(|C+log
      n|)>*<space|0.17em>\<vartheta\><rprime|''><around|(|g<around|(|u|)>|)>|\<Theta\><rprime|'><around|(|g<around|(|u|)>|)><rsup|3>>.>>>>
    </align*>

    Positivity of <math|\<vartheta\><rprime|''><around|(|t|)>=<tfrac|1|4><Rea><space|0.17em>\<psi\><rprime|'>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>>
    for all <math|t\<ge\>0> is classical <cite-detail|DLMF|5.15.3>.

    <vspace*|0.5fn><no-indent><with|font-series|bold|(e).> Direct
    computation: <math|<tfrac|d|d*u><around|(|\<xi\>-\<omega\><rsub|n>|)><rsup|-1>=\<omega\><rsub|n><rprime|'>*<around|(|\<xi\>-\<omega\><rsub|n>|)><rsup|-2>>.
  </proof>

  <\remark>
    <label|rem:formula-d>The numerator in part<nbsp>(d) is <math|C+log n>,
    not merely <math|C>. For <math|n=1> the expressions coincide, but for
    <math|n\<ge\>2> the correct formula carries the additional <math|log n>
    factor. The sign and strict monotonicity are unaffected since <math|C+log
    n\<gtr\>0> for all <math|n\<ge\>1>.
  </remark>

  <section|The Uniform IBP Bound>

  For <math|\<xi\>\<gtr\>1>, <math|n\<ge\>1>, and
  <math|T\<gtr\>2*\<pi\>*n<rsup|2>>, define the <em|mode integral>

  <\equation>
    <label|eq:In>I<rsub|n><around|(|\<xi\>,T|)><space|0.27em>\<assign\><space|0.27em><big|int><rsub|u<rsub|n>><rsup|\<Theta\><around|(|T|)>>e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>>*<space|0.17em>d*u.
  </equation>

  <\lemma>
    [Uniform IBP bound]<label|lem:IBP> For every <math|\<xi\>\<gtr\>1>,
    <math|n\<ge\>1>, and <math|T\<gtr\>2*\<pi\>*n<rsup|2>>,

    <\equation*>
      <abs|I<rsub|n><around|(|\<xi\>,T|)>><space|0.27em>\<le\><space|0.27em><frac|2|\<xi\>-1>.
    </equation*>
  </lemma>

  <\proof>
    Set <math|A\<assign\>\<xi\>-\<omega\><rsub|n><around|(|\<Theta\><around|(|T|)>|)>>
    and <math|B\<assign\>\<xi\>-\<omega\><rsub|n><around|(|u<rsub|n>|)>=\<xi\>>.
    By Lemma<nbsp><reference|lem:phase>(c), <math|A\<ge\>\<xi\>-1\<gtr\>0>
    and <math|B=\<xi\>\<gtr\>1>.

    <vspace*|0.5fn><no-indent><with|font-shape|italic|Integration by parts.>
    Write the integrand as <math|e<rsup|i*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)>>=<around|(|i*<around|(|\<omega\><rsub|n>-\<xi\>|)>|)><rsup|-1><space|0.17em><tfrac|d|d*u>e<rsup|i*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)>>>
    and integrate by parts once:

    <\equation>
      <label|eq:IBP-formula>I<rsub|n><around|(|\<xi\>,T|)>=<around*|[|<frac|e<rsup|i*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)>>|i*<around|(|\<omega\><rsub|n>-\<xi\>|)>>|]><rsub|u<rsub|n>><rsup|\<Theta\><around|(|T|)>>+<big|int><rsub|u<rsub|n>><rsup|\<Theta\><around|(|T|)>><frac|e<rsup|i*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)>>*<space|0.17em>\<omega\><rsub|n><rprime|'><around|(|u|)>|i*<around|(|\<xi\>-\<omega\><rsub|n><around|(|u|)>|)><rsup|2>>*<space|0.17em>d*u.
    </equation>

    <vspace*|0.5fn><no-indent><with|font-shape|italic|Boundary terms.> The
    upper boundary contributes at most <math|1/A>; the lower contributes
    <math|1/B>.

    <vspace*|0.5fn><no-indent><with|font-shape|italic|Tail integral.> Since
    <math|\<omega\><rsub|n><rprime|'>\<gtr\>0> by
    Lemma<nbsp><reference|lem:phase>(d), the integrand in modulus is
    non-negative, and Lemma<nbsp><reference|lem:phase>(e) supplies the exact
    antiderivative:

    <\equation*>
      <big|int><rsub|u<rsub|n>><rsup|\<Theta\><around|(|T|)>><frac|\<omega\><rsub|n><rprime|'><around|(|u|)>|<around|(|\<xi\>-\<omega\><rsub|n><around|(|u|)>|)><rsup|2>>*<space|0.17em>d*u<space|0.27em>=<space|0.27em><around*|[|<frac|1|\<xi\>-\<omega\><rsub|n><around|(|u|)>>|]><rsub|u<rsub|n>><rsup|\<Theta\><around|(|T|)>>=<frac|1|A>-<frac|1|B>.
    </equation*>

    No asymptotic approximation is used; this is an identity.

    <vspace*|0.5fn><no-indent><with|font-shape|italic|Combining.>

    <\equation*>
      <abs|I<rsub|n><around|(|\<xi\>,T|)>><space|0.27em>\<le\><space|0.27em><wide*|<frac|1|A>|\<wide-underbrace\>><rsub|<text|upper
      bdry>>+<wide*|<frac|1|B>|\<wide-underbrace\>><rsub|<text|lower
      bdry>>+<wide*|<frac|1|A>-<frac|1|B>|\<wide-underbrace\>><rsub|tail><space|0.27em>=<space|0.27em><frac|2|A><space|0.27em>\<le\><space|0.27em><frac|2|\<xi\>-1>.
    </equation*>
  </proof>

  <\remark>
    The <math|1/B> contributions cancel exactly between the lower boundary
    and the tail antiderivative, leaving the combined bound
    <math|2/A\<le\>2/<around|(|\<xi\>-1|)>>. This is an exact identity; no
    oscillatory phase cancellation is invoked.
  </remark>

  <section|Band-Limitedness>

  <\theorem>
    [Band-limitedness of <math|<wide|Z|~>>]<label|thm:band> Let
    <math|C\<gtr\>c<rsub|\<ast\>>>, <math|g=\<Theta\><rsup|-1>>, and
    <math|<wide|Z|~>=Z\<circ\>g>. For every <math|\<xi\>\<in\>\<bbb-R\>> with
    <math|<around|\||\<xi\>|\|>\<gtr\>1>,

    <\equation*>
      <frac|1|\<Theta\><around|(|T|)>>*<big|int><rsub|0><rsup|\<Theta\><around|(|T|)>><wide|Z|~><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u<space|0.27em>\<longrightarrow\><space|0.27em>0*<space|2em><text|as
      >T\<to\>\<infty\>.
    </equation*>
  </theorem>

  <\proof>
    Since <math|Z> is real-valued, the <math|\<xi\>\<less\>-1> case follows
    from <math|\<xi\>\<gtr\>1> by complex conjugation. Fix
    <math|\<xi\>\<gtr\>1> and set <math|U\<assign\>\<Theta\><around|(|T|)>>.

    <vspace*|1fn><no-indent><with|font-series|bold|Step<nbsp>1 (Change of
    variables).> Substituting <math|u=\<Theta\><around|(|t|)>>,
    <math|d*u=\<Theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t>,
    <math|g<around|(|u|)>=t>:

    <\equation*>
      <big|int><rsub|0><rsup|U><wide|Z|~><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u=<big|int><rsub|0><rsup|T>Z<around|(|t|)>*<space|0.17em>e<rsup|-i*\<xi\>*\<Theta\><around|(|t|)>>*<space|0.17em>\<Theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t.
    </equation*>

    Insert the Riemann\USiegel expansion<nbsp><eqref|eq:RS>:

    <\align*>
      <tformat|<table|<row|<cell|>|<cell|=2*<big|sum><rsub|n=1><rsup|N<around|(|T|)>>n<rsup|-1/2>*<big|int><rsub|2*\<pi\>*n<rsup|2>><rsup|T>cos
      <space|-0.17em><around*|(|\<vartheta\><around|(|t|)>-t*log
      n|)>*<space|0.17em>e<rsup|-i*\<xi\>*\<Theta\><around|(|t|)>>*<space|0.17em>\<Theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t+S<rsub|R><around|(|\<xi\>,T|)>,>>>>
    </align*>

    where <math|S<rsub|R><around|(|\<xi\>,T|)>\<assign\><big|int><rsub|0><rsup|T>R<around|(|t|)>*<space|0.17em>e<rsup|-i*\<xi\>*\<Theta\><around|(|t|)>>*<space|0.17em>\<Theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t>
    and the lower limit has been shifted from <math|0> to
    <math|2*\<pi\>*n<rsup|2>> at the cost of an <math|O<around|(|1|)>> error
    absorbed into the constants. Writing <math|cos
    <around|(|\<vartheta\>-t*log n|)>=<tfrac|1|2><around|(|e<rsup|i*<around|(|\<vartheta\>-t*log
    n|)>>+e<rsup|-i*<around|(|\<vartheta\>-t*log n|)>>|)>> and substituting
    <math|u=\<Theta\><around|(|t|)>> converts each term to
    <math|e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>>*<space|0.17em>d*u>
    (or its conjugate). The Fubini exchange is justified by absolute
    convergence: for each fixed <math|T>,
    <math|<big|sum><rsub|n\<le\>N<around|(|T|)>>n<rsup|-1/2>\<cdot\>2/<around|(|\<xi\>-1|)>\<ll\>T<rsup|1/4>\<less\>\<infty\>>.
    Taking real parts:

    <\equation>
      <label|eq:decomp><big|int><rsub|0><rsup|U><wide|Z|~><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u=2*<big|sum><rsub|n=1><rsup|N<around|(|T|)>>n<rsup|-1/2><space|0.17em><Rea><space|0.17em>I<rsub|n><around|(|\<xi\>,T|)>+S<rsub|R><around|(|\<xi\>,T|)>.
    </equation>

    <vspace*|1fn><no-indent><with|font-series|bold|Step<nbsp>2 (Cosine sum).>
    By Lemma<nbsp><reference|lem:IBP> and Lemma<nbsp><reference|lem:partial>,

    <\equation*>
      <around*|\||2*<big|sum><rsub|n=1><rsup|N<around|(|T|)>>n<rsup|-1/2><space|0.17em><Rea><space|0.17em>I<rsub|n><around|(|\<xi\>,T|)>|\|><space|0.27em>\<le\><space|0.27em><frac|4|\<xi\>-1>*<space|-0.17em><around*|(|2<space|-0.17em><around*|(|<frac|T|2*\<pi\>>|)><rsup|1/4>+2|)><space|0.27em>=<space|0.27em>O<space|-0.17em><around*|(|<frac|T<rsup|1/4>|\<xi\>-1>|)>.
    </equation*>

    Dividing by <math|\<Theta\><around|(|T|)>\<sim\><tfrac|T|2>log
    <around|(|T/2*\<pi\>|)>> gives <math|O<around|(|T<rsup|-3/4>/log
    T|)>\<to\>0>.

    <vspace*|1fn><no-indent><with|font-series|bold|Step<nbsp>3 (Remainder).>
    Using <math|<abs|R<around|(|t|)>>\<ll\>t<rsup|-1/4>> and
    <math|\<Theta\><rprime|'><around|(|t|)>\<ll\>log t>,

    <\equation*>
      <abs|S<rsub|R><around|(|\<xi\>,T|)>><space|0.27em>\<ll\><space|0.27em><big|int><rsub|1><rsup|T>t<rsup|-1/4>*log
      t*<space|0.17em>d*t<space|0.27em>\<ll\><space|0.27em>T<rsup|3/4>*log T.
    </equation*>

    Dividing by <math|\<Theta\><around|(|T|)>\<sim\><tfrac|T|2>log T> gives
    <math|O<around|(|T<rsup|-1/4>|)>\<to\>0>.

    <vspace*|1fn><no-indent>Combining Steps<nbsp>2 and<nbsp>3 completes the
    proof.
  </proof>

  <section|Sharpness>

  <\corollary>
    [Spectral support is exactly <math|<around|[|-1,1|]>>]<label|cor:sharp>
    For every <math|\<xi\>\<in\><around|(|-1,1|)>\<setminus\><around|{|0|}>>,

    <\equation*>
      limsup<rsub|T\<to\>\<infty\>> <frac|1|\<Theta\><around|(|T|)>><around*|\||<big|int><rsub|0><rsup|\<Theta\><around|(|T|)>><wide|Z|~><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u|\|>\<gtr\>0.
    </equation*>

    Consequently the Cesàro spectral support of <math|<wide|Z|~>> is exactly
    <math|<around|[|-1,1|]>>.
  </corollary>

  <\proof>
    Fix <math|\<xi\>\<in\><around|(|0,1|)>>; the case
    <math|\<xi\>\<in\><around|(|-1,0|)>> follows by conjugation. For each
    <math|n\<ge\>1>, the equation <math|\<omega\><rsub|n><around|(|u|)>=\<xi\>>
    has the unique solution <math|u<rsub|n><rsup|\<ast\>>=\<Theta\><around|(|t<rsub|n><rsup|\<ast\>>|)>>,
    where <math|t<rsub|n><rsup|\<ast\>>> satisfies

    <\equation*>
      \<vartheta\><rprime|'><around|(|t<rsub|n><rsup|\<ast\>>|)><space|0.27em>=<space|0.27em><frac|log
      n+\<xi\>*C|1-\<xi\>>.
    </equation*>

    Inverting <math|\<vartheta\><rprime|'><around|(|t|)>\<sim\><tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>>:

    <\equation*>
      t<rsub|n><rsup|\<ast\>><space|0.27em>\<sim\><space|0.27em>2*\<pi\>*n<rsup|2>\<cdot\>e<rsup|2*\<xi\>*<around|(|C+log
      n|)>/<around|(|1-\<xi\>|)>>.
    </equation*>

    At <math|u=u<rsub|n><rsup|\<ast\>>> the phase
    <math|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u> has a non-degenerate
    stationary point:

    <\equation*>
      <frac|d|d*u>*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)><mid|\|><rsub|u<rsub|n><rsup|\<ast\>>>=\<omega\><rsub|n><around|(|u<rsub|n><rsup|\<ast\>>|)>-\<xi\>=0,<space|2em><frac|d<rsup|2>|d*u<rsup|2>>*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)><mid|\|><rsub|u<rsub|n><rsup|\<ast\>>>=\<omega\><rsub|n><rprime|'><around|(|u<rsub|n><rsup|\<ast\>>|)>\<gtr\>0.
    </equation*>

    Standard stationary-phase analysis gives
    <math|<around|\||I<rsub|n><around|(|\<xi\>,T<rsub|n>|)>|\|><rsup|2>\<sim\>2*\<pi\>/\<omega\><rsub|n><rprime|'><around|(|u<rsub|n><rsup|\<ast\>>|)>\<gtr\>0>
    for <math|T<rsub|n>> chosen with <math|\<Theta\><around|(|T<rsub|n>|)>\<gg\>u<rsub|n><rsup|\<ast\>>>.
    Since the scales <math|t<rsub|n><rsup|\<ast\>>> are well-separated, the
    contributions to the Cesàro average from distinct modes do not cancel,
    and <math|limsup<rsub|T\<to\>\<infty\>>
    \<Theta\><around|(|T|)><rsup|-1><around*|\||<big|int><rsub|0><rsup|\<Theta\><around|(|T|)>><wide|Z|~><around|(|u|)>*e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u|\|>\<gtr\>0>.
  </proof>

  <\remark>
    The spectral support is independent of the choice of
    <math|C\<gtr\>c<rsub|\<ast\>>>. Replacing <math|C> by any
    <math|C<rprime|'>\<gtr\>c<rsub|\<ast\>>> changes <math|\<Theta\>> and
    <math|g> but leaves the question of whether the Cesàro average vanishes
    unaffected.
  </remark>

  <section*|Acknowledgements>

  The author thanks B.<nbsp>Riemann, C.<space|0.17em>L.<nbsp>Siegel,
  G.<space|0.17em>H.<nbsp>Hardy, and E.<space|0.17em>C.<nbsp>Titchmarsh for
  the foundational results on which this paper rests.

  <\thebibliography|9>
    <bibitem|Titchmarsh1986>E.<space|0.17em>C. Titchmarsh,
    <with|font-shape|italic|The Theory of the Riemann Zeta-Function>,
    2nd<nbsp>ed., revised by D.<space|0.17em>R. Heath-Brown, Oxford
    University Press, Oxford, 1986.

    <bibitem|Siegel1932>C.<space|0.17em>L. Siegel, Über Riemanns Nachlaÿ zur
    analytischen Zahlentheorie, <with|font-shape|italic|Quellen Stud. Gesch.
    Math. Astron. Phys.> <with|font-series|bold|2> (1932), 45\U80.

    <bibitem|DLMF>F.<space|0.17em>W.<space|0.17em>J. Olver,
    D.<space|0.17em>W. Lozier, R.<space|0.17em>F. Boisvert,
    C.<space|0.17em>W. Clark<nbsp>(eds.), <with|font-shape|italic|NIST
    Digital Library of Mathematical Functions>, Release<nbsp>1.2.1, 2024.
    <slink|https://dlmf.nist.gov/>

    <bibitem|Akhiezer1956>N.<space|0.17em>I. Akhiezer,
    <with|font-shape|italic|Lectures on the Theory of Approximation>,
    Frederick Ungar, New York, 1956.

    <bibitem|bandlim-src>S.<nbsp>Crowley,
    <with|font-shape|italic|Band-Limitedness of the Hardy <math|Z>-Function
    in the Phase Variable> (source manuscript), 2026.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|4|3>>
    <associate|auto-5|<tuple|5|4>>
    <associate|auto-6|<tuple|6|5>>
    <associate|auto-7|<tuple|7|6>>
    <associate|auto-8|<tuple|11|7>>
    <associate|auto-9|<tuple|11|7>>
    <associate|bib-Akhiezer1956|<tuple|Akhiezer1956|7>>
    <associate|bib-DLMF|<tuple|DLMF|7>>
    <associate|bib-Siegel1932|<tuple|Siegel1932|7>>
    <associate|bib-Titchmarsh1986|<tuple|Titchmarsh1986|7>>
    <associate|bib-bandlim-src|<tuple|bandlim-src|7>>
    <associate|cor:sharp|<tuple|10|6>>
    <associate|def:Theta|<tuple|2|2>>
    <associate|def:Z|<tuple|1|2>>
    <associate|eq:IBP-formula|<tuple|4|5>>
    <associate|eq:In|<tuple|3|4>>
    <associate|eq:Phi-omega|<tuple|2|3>>
    <associate|eq:RS|<tuple|1|3>>
    <associate|eq:decomp|<tuple|5|6>>
    <associate|lem:IBP|<tuple|7|4>>
    <associate|lem:partial|<tuple|4|3>>
    <associate|lem:phase|<tuple|5|3>>
    <associate|prop:diffeo|<tuple|3|2>>
    <associate|rem:formula-d|<tuple|6|4>>
    <associate|thm:band|<tuple|9|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Titchmarsh1986

      Siegel1932

      Titchmarsh1986

      Titchmarsh1986

      DLMF
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.<space|2spc>Setup
      and Notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.<space|2spc>Riemann\USiegel
      Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.<space|2spc>Phase-Derivative
      Identity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5.<space|2spc>The
      Uniform IBP Bound> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6.<space|2spc>Band-Limitedness>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7.<space|2spc>Sharpness>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgements>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>