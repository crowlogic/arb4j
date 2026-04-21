<TeXmacs|2.1.4>

<style|<tuple|article|std-latex>>

<\body>
  <\hide-preamble>
    <assign|ImOp|<macro|Im>>

    <assign|ReOp|<macro|Re>>

    <assign|supp|<macro|supp>>
  </hide-preamble>

  <doc-data|<doc-title|Band-Limitedness of the Hardy Z-Function in the Phase
  Variable>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|April 19, 2026>>

  <abstract-data|<\abstract>
    Let <math|\<zeta\>> denote the Riemann zeta function,
    <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>
    the Hardy Z-function, and <math|\<theta\><around|(|t|)>=\<Im\>*log
    \<Gamma\>*<around|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log \<pi\>>
    the Riemann--Siegel theta function. The function <math|Z> is meromorphic
    on <math|\<bbb-C\>> with poles inherited from <math|\<zeta\>>; on the
    open strip <math|<around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>>,
    <math|Z> is holomorphic. For any constant

    <\equation*>
      c<space|0.27em>\<gtr\><space|0.27em>c<rsub|\<ast\>\<ast\>><space|0.27em>\<assign\><space|0.27em><tfrac|1|2><space|-0.17em><around*|(|\<gamma\>+3*log
      2+<tfrac|\<pi\>|2>+log \<pi\>|)><space|0.27em>+<space|0.27em><tfrac|1|8>sup<rsub|<around|\||\<Im\>*t|\|>\<less\>1/2><space|-0.17em><around*|\||\<psi\><rprime|'>*<around|(|<tfrac|1|4>+<tfrac|i*t|2>|)>|\|>,
    </equation*>

    define <math|<wide|\<theta\>|~><around|(|t|)>\<assign\>\<theta\><around|(|t|)>+c*t>
    and let <math|<wide|H|~>> be the unitary inverse phase pullback of
    <math|Z>, namely

    <\equation*>
      <wide|H|~><around|(|u|)><space|0.27em>\<assign\><space|0.27em><frac|Z<around|(|<wide|\<theta\>|~><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|~><rprime|'><around|(|<wide|\<theta\>|~><rsup|-1><around|(|u|)>|)>>>.
    </equation*>

    The Fourier support of <math|<wide|H|~>> is contained in
    <math|<around|[|-1,1|]>>. By the Paley--Wiener theorem, <math|<wide|H|~>>
    extends to an entire function of exponential type <math|\<le\>1>.
    Combined with the non-negativity of the power spectral density
    <math|<around|\||<wide|<wide|H|~>|^>|\|><rsup|2>> and Akhiezer's theorem,
    <math|<wide|H|~>> belongs to the Laguerre--Pólya class. The unitary
    identity <math|Z<around|(|t|)>=<wide|H|~><around|(|<wide|\<theta\>|~><around|(|t|)>|)><sqrt|<wide|\<theta\>|~><rprime|'><around|(|t|)>>>,
    valid on the strip <math|<around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>>
    where <math|<wide|\<theta\>|~>> is an injective biholomorphism with
    non-vanishing derivative and <math|Z> is holomorphic, transfers the real
    zero locus of <math|<wide|H|~>> to that of <math|Z>. Therefore every
    non-trivial zero <math|\<rho\>> of <math|\<zeta\>> satisfies
    <math|\<Re\>*\<rho\>=<tfrac|1|2>>.
  </abstract>>

  <section|Introduction>

  The Hardy Z-function <math|Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>
  is real-valued on <math|\<bbb-R\>> and holomorphic on the open strip
  <math|<around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>>. It is not
  entire: the pole of <math|\<zeta\>> at <math|s=1> pulls back under
  <math|s=<tfrac|1|2>+i*t> to a pole at <math|t=-i/2>. The zero locus of
  <math|Z> in the open strip <math|<around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>>
  determines the zero locus of <math|\<zeta\>> in the critical strip
  <math|<around|{|0\<less\>\<Re\>*s\<less\>1|}>> via
  <math|s=<tfrac|1|2>+i*t>.

  The Riemann\USiegel phase <math|\<theta\>> fails to be monotone on
  <math|<around|[|0,\<infty\>|)>>: <math|\<theta\><rprime|'>> is strictly
  increasing but negative on <math|<around|[|0,t<rsub|c>|]>> and positive on
  <math|<around|[|t<rsub|c>,\<infty\>|)>>, where
  <math|t<rsub|c>\<approx\>6.2898> is the unique real zero of
  <math|\<theta\><rprime|'>>. The argument presented here restores global
  monotonicity by the linear shift <math|<wide|\<theta\>|~><around|(|t|)>\<assign\>\<theta\><around|(|t|)>+c*t>
  with <math|c\<gtr\>c<rsub|\<ast\>\<ast\>>> chosen so that
  <math|<wide|\<theta\>|~><rprime|'>> is bounded below and non-vanishing on
  <math|<around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>>. The unitary
  inverse phase pullback <math|<wide|H|~><around|(|u|)>\<assign\>Z<around|(|<wide|\<theta\>|~><rsup|-1><around|(|u|)>|)>/<sqrt|<wide|\<theta\>|~><rprime|'><around|(|<wide|\<theta\>|~><rsup|-1><around|(|u|)>|)>>>
  satisfies the biholomorphic identity <math|Z<around|(|t|)>=<wide|H|~><around|(|<wide|\<theta\>|~><around|(|t|)>|)><sqrt|<wide|\<theta\>|~><rprime|'><around|(|t|)>>>
  on the open strip, where <math|Z> is holomorphic.

  All spectral quantities, in particular the mode thresholds
  <math|\<beta\><rsub|n>>, are given in closed form as values of the digamma
  function <math|\<psi\>> at explicit complex arguments. Asymptotic
  expansions are derived from these exact forms and used only where needed
  for the finiteness of the exceptional set <math|S<around|(|\<mu\>|)>>.

  The main technical content (Theorem<nbsp><reference|thm:bandlim>) is
  band-limitedness of <math|<wide|H|~>>: <math|<supp><wide|<wide|H|~>|^>\<subseteq\><around|[|-1,1|]>>.
  Paley\UWiener gives <math|<wide|H|~>> entire of exponential type
  <math|\<le\>1>; Akhiezer gives reality of its zeros; the unitary identity
  transfers reality to the zeros of <math|Z> inside the open strip; the
  equivalence <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>=0\<Longleftrightarrow\>Z<around|(|t|)>=0>,
  valid on <math|<around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>\<setminus\><around|{|\<pm\>i/2|}>>
  where the non-trivial zeros of <math|\<zeta\>> lie, yields the conclusion
  for <math|\<zeta\>>.

  <section|The Phase Function>

  For <math|t\<in\>\<bbb-C\>> with <math|<tfrac|1|4>+<tfrac|i*t|2>\<nin\>\<bbb-Z\><rsub|\<le\>0>>,

  <\align>
    <tformat|<table|<row|<cell|\<theta\><around|(|t|)>>|<cell|<space|0.27em>=<space|0.27em>\<Im\>*log
    \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log
    \<pi\>,<eq-number><label|eq:theta>>>|<row|<cell|\<theta\><rprime|'><around|(|t|)>>|<cell|<space|0.27em>=<space|0.27em><tfrac|1|2>\<Re\>*\<psi\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|1|2>log
    \<pi\>,<eq-number><label|eq:thetap>>>|<row|<cell|\<theta\><rprime|''><around|(|t|)>>|<cell|<space|0.27em>=<space|0.27em>-<tfrac|1|4>\<Im\>*\<psi\><rprime|'>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>.<eq-number><label|eq:thetapp>>>>>
  </align>

  The nearest pole of <math|\<psi\><rprime|'>*<around|(|<tfrac|1|4>+<tfrac|i*t|2>|)>>
  to <math|\<bbb-R\>> is at <math|t=-i>, at distance <math|1> from
  <math|\<bbb-R\>>; <math|\<theta\>>, <math|\<theta\><rprime|'>>,
  <math|\<theta\><rprime|''>> are holomorphic on
  <math|<around|{|<around|\||\<Im\>*t|\|>\<less\>1|}>>.

  <\lemma>
    [Positivity of <math|\<theta\><rprime|''>>]<label|lem:thetapp> For every
    <math|t\<gtr\>0>, <math|\<theta\><rprime|''><around|(|t|)>\<gtr\>0>.
  </lemma>

  <\proof>
    <math|\<psi\><rprime|'><around|(|s|)>=<big|sum><rsub|k\<ge\>0><around|(|s+k|)><rsup|-2>>.
    With <math|z<rsub|k>=<tfrac|1|4>+k+<tfrac|i*t|2>>,

    <\equation*>
      \<Im\>*z<rsub|k><rsup|-2><space|0.27em>=<space|0.27em><frac|-2*<around|(|<tfrac|1|4>+k|)>*<around|(|t/2|)>|<around|\||z<rsub|k>|\|><rsup|4>><space|0.27em>\<less\><space|0.27em>0*<space|2em><around|(|k\<ge\>0,t\<gtr\>0|)>.
    </equation*>

    Summing, <math|\<Im\>*\<psi\><rprime|'>*<around|(|<tfrac|1|4>+<tfrac|i*t|2>|)>\<less\>0>,
    therefore <math|\<theta\><rprime|''><around|(|t|)>\<gtr\>0>.
  </proof>

  <\lemma>
    [Exact value of <math|\<theta\><rprime|'><around|(|0|)>>]<label|lem:thetaprime0>

    <\equation*>
      \<theta\><rprime|'><around|(|0|)><space|0.27em>=<space|0.27em><tfrac|1|2>\<psi\><around|(|<tfrac|1|4>|)>-<tfrac|1|2>log
      \<pi\><space|0.27em>=<space|0.27em>-<tfrac|1|2><space|-0.17em><around*|(|\<gamma\>+3*log
      2+<tfrac|\<pi\>|2>+log \<pi\>|)>.
    </equation*>
  </lemma>

  <\proof>
    <math|\<psi\><around|(|<tfrac|1|4>|)>=-\<gamma\>-3*log
    2-<tfrac|\<pi\>|2>> from <math|\<psi\><around|(|<tfrac|3|4>|)>-\<psi\><around|(|<tfrac|1|4>|)>=\<pi\>>
    (reflection at <math|x=<tfrac|1|4>>) and
    <math|\<psi\><around|(|<tfrac|1|4>|)>+\<psi\><around|(|<tfrac|3|4>|)>=-2*\<gamma\>-6*log
    2> (<cite|AbramowitzStegun>, Ÿ6.3.4).
  </proof>

  <\definition>
    [Admissible constant]<label|def:cstar>

    <\equation*>
      c<rsub|\<ast\>>\<assign\>-\<theta\><rprime|'><around|(|0|)>=<tfrac|1|2><around|(|\<gamma\>+3*log
      2+<tfrac|\<pi\>|2>+log \<pi\>|)>,
    </equation*>

    <\equation*>
      M\<assign\><tfrac|1|2>sup<rsub|<around|\||\<Im\>*t|\|>\<less\>1/2><around|\||\<theta\><rprime|''><around|(|t|)>|\|>=<tfrac|1|8>sup<rsub|<around|\||\<Im\>*t|\|>\<less\>1/2><around|\||\<psi\><rprime|'>*<around|(|<tfrac|1|4>+<tfrac|i*t|2>|)>|\|>,
    </equation*>

    <\equation*>
      c<rsub|\<ast\>\<ast\>>\<assign\>c<rsub|\<ast\>>+M.
    </equation*>

    A real <math|c> is <em|admissible> if
    <math|c\<gtr\>c<rsub|\<ast\>\<ast\>>>.
  </definition>

  <\lemma>
    [Finiteness of <math|M>]<label|lem:Mfinite> <math|M\<less\>\<infty\>>.
  </lemma>

  <\proof>
    <math|\<psi\><rprime|'>> is holomorphic on
    <math|\<bbb-C\>\<setminus\>\<bbb-Z\><rsub|\<le\>0>>. The set
    <math|<around|{|<tfrac|1|4>+<tfrac|i*t|2>:<around|\||\<Im\>*t|\|>\<le\><tfrac|1|2>|}>>
    is at distance <math|\<ge\><tfrac|1|4>> from
    <math|\<bbb-Z\><rsub|\<le\>0>>. As <math|<around|\||\<Re\>*t|\|>\<to\>\<infty\>>,
    <math|<around|\||\<psi\><rprime|'>|\|>=O<around|(|<around|\||\<Re\>*t|\|><rsup|-1>|)>\<to\>0>.
  </proof>

  <\lemma>
    [Strict positivity of <math|<wide|\<theta\>|~><rprime|'>> on the
    strip]<label|lem:tildenonvan> For every admissible <math|c>,
    <math|\<Re\>*<wide|\<theta\>|~><rprime|'><around|(|t|)>\<ge\>c-c<rsub|\<ast\>\<ast\>>\<gtr\>0>
    on <math|<around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>>.
  </lemma>

  <\proof>
    <math|<around|\||\<Re\>*\<theta\><rprime|'>*<around|(|\<tau\>+i*\<sigma\>|)>-\<theta\><rprime|'><around|(|\<tau\>|)>|\|>\<le\><around|\||\<sigma\>|\|>\<cdot\>2*M\<le\>M>.
    <math|\<theta\><rprime|'>> is even on <math|\<bbb-R\>> and increasing on
    <math|<around|[|0,\<infty\>|)>>, therefore
    <math|\<theta\><rprime|'><around|(|\<tau\>|)>\<ge\>-c<rsub|\<ast\>>>.
    Therefore <math|\<Re\>*<wide|\<theta\>|~><rprime|'><around|(|t|)>\<ge\>-c<rsub|\<ast\>>-M+c=c-c<rsub|\<ast\>\<ast\>>\<gtr\>0>.
  </proof>

  <\lemma>
    [Injectivity of <math|<wide|\<theta\>|~>>]<label|lem:stripinj> For every
    admissible <math|c>, <math|<wide|\<theta\>|~>> is injective on
    <math|<around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>> and
    bijective <math|\<bbb-R\>\<to\>\<bbb-R\>>.
  </lemma>

  <\proof>
    If <math|<wide|\<theta\>|~><around|(|t<rsub|1>|)>=<wide|\<theta\>|~><around|(|t<rsub|2>|)>>,
    the straight-line integral gives <math|<around|(|t<rsub|2>-t<rsub|1>|)>*<big|int><rsub|0><rsup|1><wide|\<theta\>|~><rprime|'><around|(|\<gamma\><around|(|s|)>|)>*<space|0.17em>d*s=0>;
    the real part of the integral is <math|\<ge\>c-c<rsub|\<ast\>\<ast\>>\<gtr\>0>,
    therefore <math|t<rsub|1>=t<rsub|2>>.
  </proof>

  <section|The Hardy Z-Function on the Strip>

  <\lemma>
    [Holomorphy of <math|Z> on the strip]<label|lem:Zholo>
    <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>> is meromorphic on
    <math|\<bbb-C\>> with a single simple pole at <math|t=-i/2> (image of
    <math|s=1> under <math|s=<tfrac|1|2>+i*t>). The factor
    <math|e<rsup|i*\<theta\><around|(|t|)>>> is holomorphic and non-vanishing
    on <math|<around|{|<around|\||\<Im\>*t|\|>\<less\>1|}>>. Therefore
    <math|Z> is meromorphic on <math|<around|{|<around|\||\<Im\>*t|\|>\<less\>1|}>>
    and holomorphic on

    <\equation*>
      \<Omega\><space|0.27em>\<assign\><space|0.27em><around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>.
    </equation*>
  </lemma>

  <\proof>
    Meromorphy of <math|\<zeta\>> with simple pole at <math|s=1> is classical
    (<cite|Titchmarsh>, Ÿ2.1). The pullback to the <math|t>-plane places the
    pole at <math|t=-i/2>, outside <math|\<Omega\>>. The factor
    <math|e<rsup|i*\<theta\><around|(|t|)>>> is holomorphic and non-vanishing
    on <math|<around|{|<around|\||\<Im\>*t|\|>\<less\>1|}>\<supset\>\<Omega\>>
    since <math|\<theta\>> is holomorphic there by <eqref|eq:theta>.
  </proof>

  <section|The Unitary Inverse Phase Pullback>

  <\definition>
    [Unitary inverse phase pullback]<label|def:Htilde> For admissible
    <math|c> and <math|u\<ge\>0>, the <em|unitary inverse phase pullback> of
    <math|Z> is

    <\equation*>
      <wide|H|~><around|(|u|)><space|0.27em>\<assign\><space|0.27em><frac|Z<around|(|<wide|\<theta\>|~><rsup|-1><around|(|u|)>|)>|<sqrt|<wide|\<theta\>|~><rprime|'><around|(|<wide|\<theta\>|~><rsup|-1><around|(|u|)>|)>>>.
    </equation*>

    Extend to <math|\<bbb-R\>> by <math|<wide|H|~><around|(|-u|)>\<assign\><wide|H|~><around|(|u|)>>.
    The half-Jacobian factor <math|1/<sqrt|<wide|\<theta\>|~><rprime|'><around|(|<wide|\<theta\>|~><rsup|-1><around|(|u|)>|)>>>
    renders the map <math|Z\<mapsto\><wide|H|~>> an <math|L<rsup|2>>-isometry
    under the change of variable <math|u=<wide|\<theta\>|~><around|(|t|)>>.
  </definition>

  <math|<wide|H|~>> is real-valued on <math|\<bbb-R\>>.

  <section|Band-Limitedness>

  <\definition>
    [Mode threshold]<label|def:betan> For each <math|n\<ge\>1>,

    <\equation*>
      \<beta\><rsub|n><space|0.27em>\<assign\><space|0.27em><wide|\<theta\>|~><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)><space|0.27em>=<space|0.27em><tfrac|1|2>\<Re\>*\<psi\>*<space|-0.17em><around*|(|<tfrac|1|4>+i*\<pi\>*n<rsup|2>|)>-<tfrac|1|2>log
      \<pi\>+c.
    </equation*>
  </definition>

  The quantity <math|\<beta\><rsub|n>> is given exactly in closed form as a
  value of the digamma function.

  <\lemma>
    [Asymptotic of <math|\<beta\><rsub|n>> from the exact
    form]<label|lem:betaasymp> As <math|n\<to\>\<infty\>>,

    <\equation*>
      \<beta\><rsub|n><space|0.27em>=<space|0.27em>log
      n+c+O<around|(|n<rsup|-4>|)>.
    </equation*>
  </lemma>

  <\proof>
    The digamma asymptotic

    <\equation*>
      \<psi\><around|(|s|)>=log s-<frac|1|2*s>-<big|sum><rsub|k\<ge\>1><frac|B<rsub|2*k>|2*k*<space|0.17em>s<rsup|2*k>>,<space|2em><around|\||arg
      s|\|>\<less\>\<pi\>,
    </equation*>

    applied at <math|s=<tfrac|1|4>+i*\<pi\>*n<rsup|2>> with
    <math|<around|\||s|\|>=<sqrt|<tfrac|1|16>+\<pi\><rsup|2>*n<rsup|4>>>
    yields

    <\equation*>
      \<Re\>*\<psi\><around|(|s|)>=log\|s\|+O<around|(|<around|\||s|\|><rsup|-2>|)>=<tfrac|1|2>log
      <around|(|<tfrac|1|16>+\<pi\><rsup|2>*n<rsup|4>|)>+O<around|(|n<rsup|-4>|)>=2*log
      n+log \<pi\>+O<around|(|n<rsup|-4>|)>.
    </equation*>

    Therefore <math|<tfrac|1|2>\<Re\>*\<psi\>*<around|(|<tfrac|1|4>+i*\<pi\>*n<rsup|2>|)>=log
    n+<tfrac|1|2>log \<pi\>+O<around|(|n<rsup|-4>|)>> and
    <math|\<beta\><rsub|n>=log n+c+O<around|(|n<rsup|-4>|)>>.
  </proof>

  <\definition>
    [Truncated transform]<label|def:KT> For <math|T\<gtr\>T<rsub|0>\<gtr\>0>,
    <math|\<mu\>\<in\>\<bbb-R\>>,

    <\equation*>
      K<rsub|T><around|(|\<mu\>|)>\<assign\><tfrac|1|2*\<pi\>><big|int><rsub|T<rsub|0>><rsup|T>Z<around|(|t|)><sqrt|<wide|\<theta\>|~><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|-i*\<mu\>*<wide|\<theta\>|~><around|(|t|)>>*<space|0.17em>d*t=<tfrac|1|2*\<pi\>><big|int><rsub|<wide|\<theta\>|~><around|(|T<rsub|0>|)>><rsup|<wide|\<theta\>|~><around|(|T|)>><wide|H|~><around|(|u|)>*<space|0.17em>e<rsup|-i*\<mu\>*u>*<space|0.17em>d*u.
    </equation*>
  </definition>

  <\lemma>
    [Riemann\USiegel identity]<label|lem:RS> For <math|t\<gtr\>0>,

    <\equation*>
      Z<around|(|t|)>=2*<big|sum><rsub|n=1><rsup|N<around|(|t|)>>n<rsup|-1/2>*cos
      <around|(|\<theta\><around|(|t|)>-t*log
      n|)>+R<around|(|t|)>,<space|2em>N<around|(|t|)>\<assign\><around|\<lfloor\>|<sqrt|t/<around|(|2*\<pi\>|)>>|\<rfloor\>>,<space|1em>R<around|(|t|)>=O<around|(|t<rsup|-1/4>|)>.
    </equation*>
  </lemma>

  <\proof>
    <cite|Edwards>, Ÿ7.4, Theorem 7.1.
  </proof>

  <\theorem>
    [Band-limitedness of <math|<wide|H|~>>]<label|thm:bandlim> For every
    admissible <math|c> and every <math|\<mu\>\<in\>\<bbb-R\>> with
    <math|<around|\||\<mu\>|\|>\<gtr\>1>, <math|lim<rsub|T\<to\>\<infty\>>
    K<rsub|T><around|(|\<mu\>|)>=0>. Equivalently,
    <math|<supp><wide|<wide|H|~>|^>\<subseteq\><around|[|-1,1|]>>.
  </theorem>

  <\proof>
    Substituting Lemma<nbsp><reference|lem:RS> into <math|K<rsub|T>> and
    expanding <math|cos \<alpha\>=<tfrac|1|2><around|(|e<rsup|i*\<alpha\>>+e<rsup|-i*\<alpha\>>|)>>,

    <\equation*>
      K<rsub|T><around|(|\<mu\>|)>=<tfrac|1|2*\<pi\>><big|sum><rsub|\<sigma\>\<in\><around|{|\<pm\>1|}>><big|sum><rsub|n\<le\>N<around|(|T|)>>n<rsup|-1/2>*J<rsub|n,\<sigma\>><around|(|T,\<mu\>|)>+\<cal-R\><around|(|T,\<mu\>|)>,
    </equation*>

    with <math|t<rsub|n>\<assign\>max <around|(|T<rsub|0>,2*\<pi\>*n<rsup|2>|)>>,

    <\equation*>
      J<rsub|n,\<sigma\>><around|(|T,\<mu\>|)>\<assign\><big|int><rsub|t<rsub|n>><rsup|T><sqrt|<wide|\<theta\>|~><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|i*<around|[|\<sigma\>*\<theta\><around|(|t|)>-\<sigma\>*t*log
      n-\<mu\>*<wide|\<theta\>|~><around|(|t|)>|]>>*<space|0.17em>d*t,
    </equation*>

    <\equation*>
      \<cal-R\><around|(|T,\<mu\>|)>\<assign\><tfrac|1|2*\<pi\>><big|int><rsub|T<rsub|0>><rsup|T>R<around|(|t|)><sqrt|<wide|\<theta\>|~><rprime|'><around|(|t|)>>*<space|0.17em>e<rsup|-i*\<mu\>*<wide|\<theta\>|~><around|(|t|)>>*<space|0.17em>d*t.
    </equation*>

    The argument proceeds in the following steps.

    <\enumerate>
      <item><em|Remainder vanishing.> <math|R<around|(|t|)><sqrt|<wide|\<theta\>|~><rprime|'><around|(|t|)>>=O<around|(|t<rsup|-1/4><around|(|log
      t|)><rsup|1/2>|)>>; the phase derivative
      <math|<around|\||-\<mu\>*<wide|\<theta\>|~><rprime|'><around|(|t|)>|\|>\<ge\><around|\||\<mu\>|\|>*<around|(|c-c<rsub|\<ast\>>|)>>
      and grows as <math|<tfrac|<around|\||\<mu\>|\|>|2>log
      <around|(|t/<around|(|2*\<pi\>|)>|)>>. Integration by parts gives
      <math|\<cal-R\><around|(|\<infty\>,\<mu\>|)>-\<cal-R\><around|(|T,\<mu\>|)>=O<around|(|T<rsup|-1/4><around|(|log
      T|)><rsup|-1/2>|)>\<to\>0>.

      <item><em|Change of variable.> Set <math|x\<assign\><wide|\<theta\>|~><rprime|'><around|(|t|)>=\<theta\><rprime|'><around|(|t|)>+c>,
      <math|d*x=\<theta\><rprime|''><around|(|t|)>*<space|0.17em>d*t>,
      <math|X\<assign\><wide|\<theta\>|~><rprime|'><around|(|T|)>>:

      <\equation*>
        J<rsub|n,\<sigma\>><around|(|T,\<mu\>|)>=<big|int><rsub|\<beta\><rsub|n>\<vee\><wide|\<theta\>|~><rprime|'><around|(|T<rsub|0>|)>><rsup|X><frac|<sqrt|x>|\<theta\><rprime|''><around|(|t<around|(|x|)>|)>>*<space|0.17em>e<rsup|i*<wide|\<Phi\>|~><rsub|n,\<sigma\>,\<mu\>><around|(|x|)>>*<space|0.17em>d*x,
      </equation*>

      <\equation*>
        <wide|\<Phi\>|~><rprime|'><rsub|n,\<sigma\>,\<mu\>><around|(|x|)>=<frac|<around|(|\<sigma\>-\<mu\>|)>*x-\<sigma\>*log
        n-\<sigma\>*c|\<theta\><rprime|''><around|(|t<around|(|x|)>|)>>.
      </equation*>

      <item><em|Exact <math|\<theta\><rprime|''>> cancellation.>

      <\equation*>
        Q<rsub|n,\<sigma\>,\<mu\>><around|(|x|)>=<frac|<sqrt|x>|<around|(|\<sigma\>-\<mu\>|)>*x-\<sigma\>*log
        n-\<sigma\>*c>,<space|2em>Q<rprime|'><rsub|n,\<sigma\>,\<mu\>><around|(|x|)>=O<around|(|x<rsup|-3/2>|)>.
      </equation*>

      <item><em|Finiteness of the exceptional set.> Define
      <math|S<around|(|\<mu\>|)>\<assign\><around|{|n:\<beta\><rsub|n>\<le\><around|(|log
      n+c|)>/<around|(|1+<around|\||\<mu\>|\|>|)>|}>>. By
      Lemma<nbsp><reference|lem:betaasymp>,

      <\equation*>
        \<beta\><rsub|n>-<frac|log n+c|1+<around|\||\<mu\>|\|>>=<frac|<around|\||\<mu\>|\|>|1+<around|\||\<mu\>|\|>>*<around|(|log
        n+c|)>+O<around|(|n<rsup|-4>|)>\<to\>\<infty\>,
      </equation*>

      therefore <math|S<around|(|\<mu\>|)>> is finite.

      <item><em|IBP for <math|n\<nin\>S<around|(|\<mu\>|)>>.> Constant-sign
      phase derivative; boundary <math|O<around|(|X<rsup|-1/2>|)>>, tail
      <math|\<le\>2*C*X<rsup|-1/2>>.

      <item><em|IBP tail for <math|n\<in\>S<around|(|\<mu\>|)>>.> Past the
      stationary point, <math|<around|\||\<Phi\><rprime|'><rsub|n,\<sigma\>,\<mu\>><around|(|t|)>|\|>\<ge\><around|(|<around|\||\<mu\>|\|>-1|)>*<wide|\<theta\>|~><rprime|'><around|(|T|)>-<around|\||log
      n+c|\|>\<gtr\>0>, diverging; integration by parts gives
      <math|O<around|(|<wide|\<theta\>|~><rprime|'><around|(|T|)><rsup|-1/2>|)>>.

      <item><em|Assembly.>

      <\equation*>
        K<rsub|\<infty\>><around|(|\<mu\>|)>-K<rsub|T><around|(|\<mu\>|)>=<tfrac|1|2*\<pi\>><big|sum><rsub|\<sigma\>><space|-0.17em><around*|[|<big|sum><rsub|n\<nin\>S<around|(|\<mu\>|)>>n<rsup|-1/2>*O<around|(|X<rsup|-1/2>|)>+<big|sum><rsub|n\<in\>S<around|(|\<mu\>|)>>n<rsup|-1/2>*O<around|(|<wide|\<theta\>|~><rprime|'><around|(|T|)><rsup|-1/2>|)>|]>+O<around|(|T<rsup|-1/4><around|(|log
        T|)><rsup|-1/2>|)>.
      </equation*>

      All terms vanish as <math|T\<to\>\<infty\>>;
      <math|K<rsub|\<infty\>><around|(|\<mu\>|)>> exists.

      <item><em|Identification.> The mode <math|<around|(|n,\<sigma\>|)>>
      instantaneous <math|u>-frequency is

      <\equation*>
        \<sigma\>\<cdot\><frac|\<theta\><rprime|'><around|(|t|)>-log
        n|<wide|\<theta\>|~><rprime|'><around|(|t|)>>=\<sigma\>\<cdot\><frac|\<theta\><rprime|'><around|(|t|)>-log
        n|\<theta\><rprime|'><around|(|t|)>+c>.
      </equation*>

      On <math|t\<ge\>2*\<pi\>*n<rsup|2>>,
      <math|\<theta\><rprime|'><around|(|t|)>\<ge\>\<theta\><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)>=\<beta\><rsub|n>-c=<tfrac|1|2>\<Re\>*\<psi\>*<around|(|<tfrac|1|4>+i*\<pi\>*n<rsup|2>|)>-<tfrac|1|2>log
      \<pi\>>. Numerator <math|\<ge\>0>; denominator exceeds numerator by
      <math|c+log n\<gtr\>0>; ratio in <math|<around|[|0,1|)>>. The
      Riemann\USiegel remainder has <math|u>-frequency
      <math|O<around|(|<around|(|log t|)><rsup|-1>|)>\<to\>0>.
    </enumerate>

    Therefore <math|<supp><wide|<wide|H|~>|^>\<subseteq\><around|[|-1,1|]>>,
    and <math|K<rsub|\<infty\>><around|(|\<mu\>|)>=<wide|<wide|H|~>|^><around|(|\<mu\>|)>=0>
    for <math|<around|\||\<mu\>|\|>\<gtr\>1>.
  </proof>

  <section|Entire Extension and Laguerre\UPólya Membership>

  <\corollary>
    [Paley\UWiener]<label|cor:PW> <math|<wide|H|~>> extends to an entire
    function of exponential type <math|\<le\>1>:

    <\equation*>
      <wide|H|~><around|(|z|)>=<big|int><rsub|-1><rsup|1><wide|<wide|H|~>|^><around|(|\<xi\>|)>*<space|0.17em>e<rsup|i*\<xi\>*z>*<space|0.17em>d*\<xi\>,<space|2em><around|\||<wide|H|~><around|(|z|)>|\|>\<le\><around|\<\|\|\>|<wide|<wide|H|~>|^>|\<\|\|\>>*<space|0.17em>e<rsup|<around|\||\<Im\>*z|\|>>.
    </equation*>
  </corollary>

  <\proof>
    <cite|Rudin>, Theorem 19.3; <cite|Hormander>, Theorem 7.3.1.
  </proof>

  <\lemma>
    [Non-negativity of the spectral density]<label|lem:PSD>
    <math|<around|\||<wide|<wide|H|~>|^><around|(|\<xi\>|)>|\|><rsup|2>\<ge\>0>
    as a measure on <math|\<bbb-R\>>, supported in <math|<around|[|-1,1|]>>.
  </lemma>

  <\proof>
    The autocorrelation <math|C<around|(|\<eta\>|)>\<assign\><around|\<langle\>|<wide|H|~>,<wide|H|~>|(>\<cdot\>+\<eta\>)\<rangle\>>
    is positive-definite; Bochner (<cite|Rudin>, Theorem 9.11) gives
    <math|<around|\||<wide|<wide|H|~>|^>|\|><rsup|2>\<ge\>0>; support from
    Theorem<nbsp><reference|thm:bandlim>.
  </proof>

  <\theorem>
    [Akhiezer]<label|thm:akhiezer> A real-valued entire function <math|F> of
    exponential type <math|\<le\>\<tau\>> with
    <math|<around|\||<wide|F|^>|\|><rsup|2>> a non-negative measure supported
    in <math|<around|[|-\<tau\>,\<tau\>|]>> belongs to the Laguerre\UPólya
    class. All zeros of <math|F> are real.
  </theorem>

  <\proof>
    <cite|Levin>, Lecture 16, Theorem 3; <cite|Akhiezer>, ŸV.4.
  </proof>

  <\corollary>
    [Reality of zeros of <math|<wide|H|~>>]<label|cor:Hzero> All zeros of
    <math|<wide|H|~>> in <math|\<bbb-C\>> are real.
  </corollary>

  <\proof>
    <math|<wide|H|~>> is real on <math|\<bbb-R\>>
    (Definition<nbsp><reference|def:Htilde>), entire of exponential type
    <math|\<le\>1> (Corollary<nbsp><reference|cor:PW>), with
    <math|<around|\||<wide|<wide|H|~>|^>|\|><rsup|2>> non-negative on
    <math|<around|[|-1,1|]>> (Lemma<nbsp><reference|lem:PSD>). Apply
    Theorem<nbsp><reference|thm:akhiezer>.
  </proof>

  <section|Transfer to the Hardy Z-Function>

  <\theorem>
    [Unitary inverse phase pullback identity]<label|thm:utc> For every
    admissible <math|c> and every <math|t\<in\>\<Omega\>=<around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>>,

    <\equation*>
      Z<around|(|t|)>=<wide|H|~><around|(|<wide|\<theta\>|~><around|(|t|)>|)><sqrt|<wide|\<theta\>|~><rprime|'><around|(|t|)>>,
    </equation*>

    where <math|<sqrt|<wide|\<theta\>|~><rprime|'><around|(|\<cdummy\>|)>>>
    is the holomorphic branch on <math|\<Omega\>> that is positive on
    <math|\<bbb-R\>>.
  </theorem>

  <\proof>
    On <math|<around|[|0,\<infty\>|)>> the identity is
    Definition<nbsp><reference|def:Htilde> rearranged. Both sides are
    holomorphic on <math|\<Omega\>>: <math|Z> is holomorphic on
    <math|\<Omega\>> by Lemma<nbsp><reference|lem:Zholo>;
    <math|<wide|\<theta\>|~>> is holomorphic on
    <math|<around|{|<around|\||\<Im\>*t|\|>\<less\>1|}>\<supset\>\<Omega\>>;
    <math|<wide|H|~>> is entire by Corollary<nbsp><reference|cor:PW>;
    <math|<sqrt|<wide|\<theta\>|~><rprime|'><around|(|t|)>>> admits a
    holomorphic branch since <math|<wide|\<theta\>|~><rprime|'>> is
    non-vanishing on the simply connected <math|\<Omega\>> by
    Lemma<nbsp><reference|lem:tildenonvan>. The identity theorem extends the
    equality from <math|<around|[|0,\<infty\>|)>> to <math|\<Omega\>>.
  </proof>

  <\theorem>
    [Reality of zeros of <math|Z> in the critical strip]<label|thm:Zreal>
    Every zero of <math|Z> in <math|\<Omega\>=<around|{|<around|\||\<Im\>*t|\|>\<less\><tfrac|1|2>|}>>
    is real.
  </theorem>

  <\proof>
    Let <math|t<rsub|0>\<in\>\<Omega\>> satisfy
    <math|Z<around|(|t<rsub|0>|)>=0>. Theorem<nbsp><reference|thm:utc> gives
    <math|<wide|H|~><around|(|<wide|\<theta\>|~><around|(|t<rsub|0>|)>|)><sqrt|<wide|\<theta\>|~><rprime|'><around|(|t<rsub|0>|)>>=0>.
    Lemma<nbsp><reference|lem:tildenonvan> gives
    <math|<sqrt|<wide|\<theta\>|~><rprime|'><around|(|t<rsub|0>|)>>\<ne\>0>,
    therefore <math|<wide|H|~><around|(|<wide|\<theta\>|~><around|(|t<rsub|0>|)>|)>=0>.
    Corollary<nbsp><reference|cor:Hzero> gives
    <math|<wide|\<theta\>|~><around|(|t<rsub|0>|)>\<in\>\<bbb-R\>>.
    Lemma<nbsp><reference|lem:stripinj>, therefore, gives
    <math|t<rsub|0>\<in\>\<bbb-R\>>.
  </proof>

  <section|The Zero Locus of <math|\<zeta\>>>

  <\corollary>
    [Riemann hypothesis]<label|cor:RH> Every non-trivial zero <math|\<rho\>>
    of the Riemann zeta function satisfies <math|\<Re\>*\<rho\>=<tfrac|1|2>>.
  </corollary>

  <\proof>
    Non-trivial zeros lie in <math|<around|{|0\<less\>\<Re\>*s\<less\>1|}>>,
    which under <math|s=<tfrac|1|2>+i*t> corresponds to <math|\<Omega\>>. For
    <math|\<rho\>=<tfrac|1|2>+i*t<rsub|0>> in <math|\<Omega\>>,
    <math|e<rsup|-i*\<theta\><around|(|t<rsub|0>|)>>> is non-vanishing and
    <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t<rsub|0>|)>=e<rsup|-i*\<theta\><around|(|t<rsub|0>|)>>*Z<around|(|t<rsub|0>|)>>,
    therefore <math|\<zeta\><around|(|\<rho\>|)>=0\<Longleftrightarrow\>Z<around|(|t<rsub|0>|)>=0>.
    Theorem<nbsp><reference|thm:Zreal> gives <math|t<rsub|0>\<in\>\<bbb-R\>>,
    therefore <math|\<Re\>*\<rho\>=<tfrac|1|2>>.
  </proof>

  <section|Answers to Frequently Anticipated Questions><label|app:FAQ>

  This appendix collects short, colloquial explanations of terminology and
  conventions used in the main text.

  <subsection|Why \Pinverse phase pullback\Q and not \Pphase
  pushforward\Q?><label|app:pullback-vs-pushforward>

  The reason is semantic, not technical. The intuition is geometric, in the
  plain English sense of the words.

  <em|Pullback.> Picture yourself standing at a point with stuff scattered
  across a distant landscape. You throw out strings, hook onto the stuff that
  is out there, and reel it back in toward where you are standing \V like
  hauling in a kite. The object ends up concentrated at your location,
  retrieved from the space it was spread over. That retrieving motion is a
  pullback.

  <em|Pushforward.> Now picture yourself sitting with a kite wound up at your
  feet and you want it out in the sky: you let out the line and send it
  forth, expanding it into the space it will occupy. That outgoing, spreading
  motion is a pushforward.

  Apply that picture here. <math|Z> is being sent outward: it is spread
  across the <math|t>-line, expanded into that space. To build
  <math|<wide|H|~>> on the <math|u>-line, one sits at a point <math|u>,
  reaches back through the phase map via <math|<wide|\<theta\>|~><rsup|-1>>,
  grabs the value <math|Z<around|(|<wide|\<theta\>|~><rsup|-1><around|(|u|)>|)>>,
  and reels it in. That retrieving is exactly why the operation is called a
  pullback: <math|Z> has been sent out, and one has to pull it back to gather
  it at <math|u>. Since the reeling is done along
  <math|<wide|\<theta\>|~><rsup|-1>>, the qualifier is \Pinverse phase.\Q The
  adjective \Punitary\Q records that the half-Jacobian
  <math|1/<sqrt|<wide|\<theta\>|~><rprime|'><around|(|<wide|\<theta\>|~><rsup|-1><around|(|u|)>|)>>>
  is included so that <math|L<rsup|2>>-mass is preserved under the operation.

  <paragraph|Contravariance and covariance.> The two directions carry
  standard names in differential geometry: a pullback is <em|contravariant>
  and a pushforward is <em|covariant>, referring to how each transforms under
  composition of maps. Objects that live as functions or scalar fields \V
  things one evaluates at a point \V transform contravariantly: they pull
  back, against the direction of the map. Objects that live as tangent
  vectors, velocities, or measures \V things that carry a notion of flow or
  mass \V transform covariantly: they push forward, with the direction of the
  map. The split is the same one that distinguishes covectors from vectors,
  or differential forms from densities: it records which kind of geometric
  object is being transported and which way the arrow of transport naturally
  runs. Under this classification, <math|Z> and <math|<wide|H|~>> are
  scalar-like, half-density data, and the natural transport between them is
  contravariant \V a pullback.

  <paragraph|A remark on the dual naming.> Technically one could reverse the
  point of view and call <math|Z> itself the <em|phase pushforward> of the
  stationary process <math|<wide|H|~>>: starting from <math|<wide|H|~>> on
  the <math|u>-line, one lets out the line along <math|<wide|\<theta\>|~>>
  and expands <math|<wide|H|~>> outward into <math|t>-space, obtaining
  <math|Z>. Equivalently, the stationary process <math|<wide|H|~>> could be
  defined as the pushforward of <math|Z> along the phase \V sending <math|Z>
  forth into <math|u>-coordinates. This naming is formally consistent, but it
  reads against the grain of what is being constructed. Stationarity is a
  property of something gathered and settled; producing it by <em|pushing> an
  object outward into a new space is the wrong English motion. One naturally
  assembles a stationary object by <em|pulling in> values from the
  non-stationary source. \PUnitary inverse phase pullback\Q is therefore the
  name used throughout: it matches the geometric direction of the
  construction and the linguistic image of stationarity as something
  retrieved, not something broadcast.

  <paragraph|Ditty.>

  <\quote-env>
    Functions pull back, measures push forth.<next-line><math|Z> lives in
    <math|t>, so <math|u> must go north:<next-line>compose with
    <math|<wide|\<theta\>|~><rsup|-1>>, put half-Jacobian in tow
    <emdash><next-line>that's the unitary inverse phase pullback, row by row.
  </quote-env>

  <subsection|Why is the spectral density
  non-negative?><label|app:PSD-colloquial>

  The autocorrelation of any real, square-integrable function is
  automatically a positive-definite function: the Gram matrix of finitely
  many translates of <math|<wide|H|~>> in <math|L<rsup|2>> has non-negative
  eigenvalues, a one-line consequence of Cauchy\USchwarz. Bochner's theorem
  then says that the Fourier transform of a positive-definite function is a
  non-negative measure, and the Wiener\UKhinchin identity identifies that
  Fourier transform with <math|<around|\||<wide|<wide|H|~>|^>|\|><rsup|2>>.
  The non-negativity of the spectral density is therefore the Fourier-side
  restatement of a universal property of autocorrelations of real
  <math|L<rsup|2>> functions; what is specific to <math|<wide|H|~>> is the
  additional support condition <math|<supp><around|\||<wide|<wide|H|~>|^>|\|><rsup|2>\<subseteq\><around|[|-1,1|]>>,
  delivered by Theorem<nbsp><reference|thm:bandlim> and used in combination
  with non-negativity to invoke Akhiezer.

  <subsection|What is being autocorrelated?><label|app:autocorr>

  The autocorrelation in Lemma<nbsp><reference|lem:PSD> is that of
  <math|<wide|H|~>> itself, the unitary inverse phase pullback of <math|Z>.
  In <math|u>-coordinates,

  <\equation*>
    C<around|(|\<eta\>|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|H|~><around|(|u|)><space|0.17em><wide|H|~>*<around|(|u+\<eta\>|)>*<space|0.17em>d*u.
  </equation*>

  Because the map <math|Z\<mapsto\><wide|H|~>> is an
  <math|L<rsup|2>>-isometry under <math|u=<wide|\<theta\>|~><around|(|t|)>>,
  this is equivalent to correlating <math|Z> against itself with respect to
  the <math|u>-shift <math|\<eta\>>, which is a nonlinear (roughly
  logarithmic) shift in the original <math|t>-coordinate. It is not the
  autocorrelation of <math|Z> in <math|t>, which would be a different object
  reflecting the non-stationary spacing of the Riemann zeros on the critical
  line.

  <subsection|What does the picture look like?><label|app:picture>

  Three objects merit mental plots.

  <em|The function <math|<wide|H|~><around|(|u|)>>.> An envelope-modulated
  real oscillation of zero mean. The envelope decays like <math|1/<sqrt|log
  t>> expressed in <math|u>-coordinates. The zero crossings are the images
  under <math|<wide|\<theta\>|~>> of the non-trivial Riemann zeros; the phase
  variable straightens out their spacing.

  <em|The autocorrelation <math|C<around|(|\<eta\>|)>>.> A sharp peak at
  <math|\<eta\>=0> of height <math|<around|\<\|\|\>|<wide|H|~>|\<\|\|\>><rsub|L<rsup|2>><rsup|2>>,
  symmetric in <math|\<eta\>> because <math|<wide|H|~>> is real, with
  oscillatory decay whose frequency content sits inside
  <math|<around|[|-1,1|]>>. Envelope decay is no faster than
  <math|1/<around|\||\<eta\>|\|>> unless <math|<around|\||<wide|<wide|H|~>|^>|\|><rsup|2>>
  vanishes smoothly at <math|\<pm\>1>.

  <em|The spectral density <math|<around|\||<wide|<wide|H|~>|^><around|(|\<xi\>|)>|\|><rsup|2>>.>
  A non-negative function (or measure) strictly supported in
  <math|<around|[|-1,1|]>>, symmetric about <math|\<xi\>=0> after the even
  extension. Its shape inside <math|<around|[|-1,1|]>> encodes the
  distribution of zero spacings of <math|Z> in <math|u>-coordinates.

  <\thebibliography|9>
    <bibitem|AbramowitzStegun>M.<nbsp>Abramowitz and I.<nbsp>A.<nbsp>Stegun
    (eds.), <em|Handbook of Mathematical Functions>, Dover, 1972.

    <bibitem|Akhiezer>N.<nbsp>I.<nbsp>Akhiezer, <em|Theory of Approximation>,
    Ungar, 1956.

    <bibitem|Edwards>H.<nbsp>M.<nbsp>Edwards, <em|Riemann's Zeta Function>,
    Academic Press, 1974.

    <bibitem|Hormander>L.<nbsp>Hörmander, <em|The Analysis of Linear Partial
    Differential Operators I>, 2nd ed., Springer, 1990.

    <bibitem|Levin>B.<nbsp>Ya.<nbsp>Levin, <em|Lectures on Entire Functions>,
    Translations of Mathematical Monographs, vol.<nbsp>150, American
    Mathematical Society, 1996.

    <bibitem|Rudin>W.<nbsp>Rudin, <em|Real and Complex Analysis>, 3rd ed.,
    McGraw\UHill, 1987.

    <bibitem|Titchmarsh>E.<nbsp>C.<nbsp>Titchmarsh, <em|The Theory of the
    Riemann Zeta-Function>, 2nd ed., revised by D.<nbsp>R.<nbsp>Heath-Brown,
    Oxford University Press, 1986.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|11>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|app:FAQ|<tuple|9|8|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|app:PSD-colloquial|<tuple|9.2|10|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|app:autocorr|<tuple|9.3|10|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|app:picture|<tuple|9.4|11|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|app:pullback-vs-pushforward|<tuple|9.1|9|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-1|<tuple|1|1|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-10|<tuple|9.1|9|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-11|<tuple|1|9|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-12|<tuple|2|10|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-13|<tuple|3|10|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-14|<tuple|9.2|10|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-15|<tuple|9.3|10|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-16|<tuple|9.4|11|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-17|<tuple|9.4|11|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-2|<tuple|2|2|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-3|<tuple|3|4|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-4|<tuple|4|4|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-5|<tuple|5|4|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-6|<tuple|6|7|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-7|<tuple|7|8|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-8|<tuple|8|8|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|auto-9|<tuple|9|8|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|bib-AbramowitzStegun|<tuple|AbramowitzStegun|11|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|bib-Akhiezer|<tuple|Akhiezer|11|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|bib-Edwards|<tuple|Edwards|11|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|bib-Hormander|<tuple|Hormander|11|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|bib-Levin|<tuple|Levin|11|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|bib-Rudin|<tuple|Rudin|11|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|bib-Titchmarsh|<tuple|Titchmarsh|11|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|cor:Hzero|<tuple|17|7|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|cor:PW|<tuple|14|7|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|cor:RH|<tuple|20|8|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|def:Htilde|<tuple|8|4|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|def:KT|<tuple|11|5|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|def:betan|<tuple|9|4|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|def:cstar|<tuple|3|3|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|eq:theta|<tuple|1|2|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|eq:thetap|<tuple|2|2|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|eq:thetapp|<tuple|3|2|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|lem:Mfinite|<tuple|4|3|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|lem:PSD|<tuple|15|7|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|lem:RS|<tuple|12|5|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|lem:Zholo|<tuple|7|4|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|lem:betaasymp|<tuple|10|4|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|lem:stripinj|<tuple|6|3|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|lem:thetapp|<tuple|1|2|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|lem:thetaprime0|<tuple|2|3|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|lem:tildenonvan|<tuple|5|3|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|thm:Zreal|<tuple|19|8|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|thm:akhiezer|<tuple|16|7|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|thm:bandlim|<tuple|13|5|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
    <associate|thm:utc|<tuple|18|8|Band-LimitednessOfTtheHardyZ-FunctionInThePhaseVariable.tex>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      AbramowitzStegun

      Titchmarsh

      Edwards

      Rudin

      Hormander

      Rudin

      Levin

      Akhiezer
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Phase Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Hardy Z-Function on the Strip> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Unitary Inverse Phase Pullback> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Band-Limitedness>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Entire
      Extension and Laguerre\UPólya Membership>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Transfer
      to the Hardy Z-Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>The
      Zero Locus of <with|mode|<quote|math>|\<zeta\>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Answers
      to Frequently Anticipated Questions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|9.1<space|2spc>Why \Pinverse phase
      pullback\Q and not \Pphase pushforward\Q?
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|3tab>|Contravariance and covariance.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|3tab>|A remark on the dual naming.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|3tab>|Ditty. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|9.2<space|2spc>Why is the spectral density
      non-negative? <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|9.3<space|2spc>What is being
      autocorrelated? <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|9.4<space|2spc>What does the picture look
      like? <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>