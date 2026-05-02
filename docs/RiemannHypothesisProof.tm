<TeXmacs|2.1.4>

<style|<tuple|generic|parchment|framed-theorems>>

<\body>
  <\hide-preamble>
    <assign|LP|<macro|<with|math-font|cal|LP>>>

    <assign|R|<macro|\<bbb-R\>>>

    <assign|C|<macro|\<bbb-C\>>>

    <assign|Sch|<macro|\<cal-S\>>>

    <assign|HX|<macro|\<cal-H\><rsub|X>>>
  </hide-preamble>

  <doc-data|<doc-title|A Proof of the Riemann Hypothesis
  via<next-line>Band-Limited Spectral Analysis of the Hardy
  <math|Z>-Function>|<doc-date|May 1, 2026>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-affiliation|Dallas, Texas,>>>>

  <abstract-data|<\abstract>
    Let <math|X> be the variance-normalized pullback of Hardy's
    <math|Z>-function under the Riemann--Siegel phase reparametrization.
    Using the Riemann--Siegel formula, the Montgomery--Vaughan mean-value
    theorem, and a direct stationary-phase estimate for the sum-frequency
    Dirichlet polynomial, <math|X> has Wiener covariance
    <math|K<around|(|h|)>=sin <around|(|h|)>/h>; Wiener--Khinchin gives
    scalar spectral density <math|<wide|X|^><rsub|W><around|(|\<xi\>|)>=<tfrac|1|2><with|math-font-family|bf|1><rsub|<around|[|-1,1|]>><around|(|\<xi\>|)>>.
    Stone's theorem on the Wiener Hilbert space <math|<HX>> identifies an
    orthogonal spectral measure <math|\<Phi\>> supported on
    <math|<around|[|-1,1|]>> with control measure
    <math|\<mu\>*<around|(|d*\<xi\>|)>=<tfrac|1|2><with|math-font-family|bf|1><rsub|<around|[|-1,1|]>>*<space|0.17em>d*\<xi\>>.
    The smooth regulator <math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>=e<rsup|-\<varepsilon\><sqrt|a<rsup|2>+u<rsup|2>>>>
    produces <math|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>=\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>*X\<in\>L<rsup|1>\<cap\>L<rsup|2>>;
    the orthogonal-measure isometry collapses the <math|\<Phi\>>-smearing to
    the classical scalar convolution <math|<wide|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^>=<wide|X|^><rsub|W>\<ast\><wide|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^>\<ge\>0>
    pointwise, a Schwartz function with exponential decay rate <math|a>. For
    each <math|a\<gtr\>0>, the inverse Fourier integral
    <math|<wide|X|~><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|z|)>=<around|(|2*\<pi\>|)><rsup|-1>*<big|int><wide|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^><around|(|\<xi\>|)>*e<rsup|i*z*\<xi\>>*d*\<xi\>>
    converges absolutely and defines a holomorphic extension of
    <math|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>> to the strip
    <math|<around|\||<math-up|Im><space|0.17em>z|\|>\<less\>a>. Dividing by
    <math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>> (holomorphic and
    nonvanishing on the same strip) yields a holomorphic function
    <math|X<rsup|<around|[|a|]>>> on <math|<around|\||<math-up|Im><space|0.17em>z|\|>\<less\>a>
    that equals <math|X<around|(|u|)>> on <math|<R>>. The identity theorem
    forces <math|X<rsup|<around|[|a|]>>> and
    <math|X<rsup|<around|[|a<rprime|'>|]>>> to agree on overlapping strips
    for <math|a<rprime|'>\<gtr\>a>; taking <math|a\<to\>\<infty\>> gives a
    real entire extension of <math|X> with exponential type <math|\<le\>1>.
    The scalar Laguerre identity and Bochner's theorem give
    <math|L<rsub|n><around|[|X<rsub|\<varepsilon\>>|]><around|(|u|)>\<ge\>0>;
    the pointwise limit gives <math|L<rsub|n><around|[|X|]><around|(|u|)>\<ge\>0>
    for all <math|n\<ge\>0>, <math|u\<in\><R>>. By Csordas--Vishnyakova,
    <math|X\<in\><LP>> with no genus hypothesis required; the zero
    correspondence places every nontrivial zero of
    <math|\<zeta\><around|(|s|)>> on <math|<math-up|Re><around|(|s|)>=<tfrac|1|2>>.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Conventions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Setup
    and zero correspondence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Wiener
    covariance> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Spectral
    density and orthogonal representation>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Smooth
    regulators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Entire
    extension and exponential type of <with|mode|math|X>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Laguerre
    positivity for <with|mode|math|X<rsub|\<varepsilon\>>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Regulator
    removal> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>The
    Riemann Hypothesis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>The
    sum-frequency bilinear estimate> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section*|Conventions>

  Fourier convention:

  <\equation>
    \<cal-F\><around|{|f|}><around|(|\<xi\>|)>=<big|int><rsub|<R>>f<around|(|h|)>*e<rsup|-i*h*\<xi\>>*<space|0.17em>d*h
  </equation>

  <\equation>
    \<cal-F\><rsup|-1><around|{|g|}><around|(|h|)>=<frac|1|2*\<pi\>>*<big|int><rsub|<R>>g<around|(|\<xi\>|)>*e<rsup|i*h*\<xi\>>*<space|0.17em>d*\<xi\>
  </equation>

  Wiener\UKhinchin: for autocorrelation <math|K>, the spectral density
  <math|S> satisfies

  <\equation>
    K<around|(|h|)>=<big|int>e<rsup|i*h*\<xi\>>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>
  </equation>

  FIXME: this is idiotic. Why define <math|\<cal-F\><rsup|-1><around|{|g|}><around|(|h|)>=<frac|1|2*\<pi\>>*<big|int><rsub|<R>>g<around|(|\<xi\>|)>*e<rsup|i*h*\<xi\>>*<space|0.17em>d*\<xi\>>
  just go to on and violate the convention by defining
  <math|K<around|(|h|)>=<big|int>e<rsup|i*h*\<xi\>>*S<around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>>?

  \ . Bochner: if <math|F\<in\>L<rsup|1><around|(|<R>|)>> with
  <math|F\<ge\>0> pointwise, then <math|<wide|F|^><around|(|v|)>\<ge\>0> for
  all <math|v\<in\><R>>. The Schwartz space is <math|<Sch><around|(|<R>|)>>.

  <section|Setup and zero correspondence>

  Let

  <\equation>
    \<theta\><around|(|t|)>=arg \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log
    \<pi\>
  </equation>

  be the Riemann\USiegel phase<nbsp><cite|Titchmarsh> on <math|<R>>. The
  asymptotic <math|\<theta\><rprime|'><around|(|t|)>=<tfrac|1|2>log
  <around|(|t/2*\<pi\>|)>+O<around|(|t<rsup|-2>|)>> for <math|t\<gtr\>0>
  yields <math|C<rsub|0>\<assign\>-inf<rsub|t\<in\><R>>
  \<theta\><rprime|'><around|(|t|)>\<less\>\<infty\>>. Let

  <\equation>
    \<Theta\><around|(|t|)>=\<theta\><around|(|t|)>+t*C\ 
  </equation>

  where <math|\<infty\>\<gtr\>C\<gtr\>C<rsub|0>> such that <math|
  \<Theta\><rprime|'><around|(|t|)>\<gtr\>0\<forall\>t\<in\><R>> and
  <math|\<Theta\>:<R>\<to\><R>> is a strictly increasing real-analytic
  bijection with real-analytic inverse <math|t=\<Theta\><rsup|-1>>. Let

  <\equation>
    Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>
  </equation>

  <\equation>
    X<around|(|u|)>=<frac|Z<around|(|t<around|(|u|)>|)>|<sqrt|2*<space|0.17em>\<Theta\><rprime|'><around|(|t<around|(|u|)>|)>>>
    \<forall\>u\<in\><R>
  </equation>

  <math|Z> is real-analytic and real-valued on <math|<R>>.
  <math|\<Theta\><rprime|'>\<gtr\>0> and <math|e<rsup|i*\<theta\><around|(|t|)>>\<ne\>0>
  on <math|<R>> give

  <\equation>
    X<around|(|u<rsub|0>|)>=0\<Longleftrightarrow\>Z<around|(|t<rsub|0>|)>=0\<Longleftrightarrow\>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t<rsub|0>|)>=0<space|2em>\<forall\>t<rsub|0>=t<around|(|u<rsub|0>|)>\<in\><R>
  </equation>

  The Lindelöf convexity bound

  <\equation>
    <around|\||Z<around|(|t|)>|\|>=O<around*|(|<around|(|1+<around|\||t|\|>|)><rsup|<frac|1|4>+o<around|(|1|)>>|)>
  </equation>

  \ together with <math|\<Theta\><rprime|'>\<ge\>c\<gtr\>0> yields\ 

  <\equation>
    <around|\||X<around|(|u|)>|\|>=O<around*|(|<around|(|1+<around|\||u|\|>|)><rsup|<frac|1|4>+o<around|(|1|)>>|)>
  </equation>

  Hence <math|X> has polynomial growth on <math|<R>>, defines a tempered
  distribution, and <math|X\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|<R>|)>\<setminus\>L<rsup|2><around|(|<R>|)>>.

  <\remark>
    <math|X> is defined and real-analytic on <math|<R>> only.
    <math|Z<around|(|t|)>> is not entire as a function of complex <math|t>
    (the factor <math|e<rsup|i*\<theta\><around|(|t|)>>> involves <math|arg
    \<Gamma\>>, which has branch structure off <math|<R>>), so <math|X> does
    not inherit an entire extension from <math|Z>. The entire extension of
    <math|X> is constructed independently in Ÿ<reference|sec:type> via the
    Paley\UWiener mechanism applied to the regularized functions
    <math|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>>.
  </remark>

  <section|Wiener covariance>

  <\theorem>
    <label|thm:cov>

    <\equation>
      K<around|(|h|)>\<assign\>lim<rsub|U\<to\>\<infty\>>
      <frac|1|U>*<big|int><rsub|0><rsup|U>X*<around|(|u+h|)>*X<around|(|u|)>*<space|0.17em>d*u=<frac|sin
      h|h><text|>
    </equation>

    where

    <\equation>
      lim<rsub|h\<rightarrow\>0>K<around|(|h|)>=1
    </equation>

    independent of the choice <math|C\<gtr\>C<rsub|0>>.
  </theorem>

  <\proof>
    Write <math|L=L<around|(|t|)>=\<Theta\><rprime|'><around|(|t|)>>,
    <math|N=<around|\<lfloor\>|<sqrt|t/2*\<pi\>>|\<rfloor\>>>. The
    Riemann\USiegel formula<nbsp><cite-detail|Titchmarsh|Ch.<nbsp>4> gives

    <\equation>
      <label|eq:RS>Z<around|(|t|)>=2*<big|sum><rsub|n\<le\>N>n<rsup|-1/2>*cos
      <around|(|\<theta\><around|(|t|)>-t*log n|)>+O<around|(|t<rsup|-1/4>|)>
    </equation>

    Under <math|u=\<Theta\><around|(|t|)>>, <math|d*u=L*<space|0.17em>d*t>,

    <\equation>
      X<around|(|u|)>=<sqrt|<tfrac|2|L>>*<big|sum><rsub|n\<le\>N>n<rsup|-1/2>*cos
      \<phi\><rsub|n><around|(|u|)>+O<around|(|L<rsup|-3/4>|)><text|>
    </equation>

    <\equation>
      \<phi\><rsub|n><around|(|u|)>=\<theta\><around|(|t<around|(|u|)>|)>-t<around|(|u|)>*log
      n
    </equation>

    By <math|cos A*cos B=<tfrac|1|2>cos <around|(|A-B|)>+<tfrac|1|2>cos
    <around|(|A+B|)>>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|X*<around|(|u+h|)>*X<around|(|u|)>>|<cell|=<frac|1|L>*<big|sum><rsub|m,n\<le\>N><frac|cos
      <around|(|\<phi\><rsub|m>*<around|(|u+h|)>-\<phi\><rsub|n><around|(|u|)>|)>|<sqrt|m*n>><space|1em><text|(difference)>>>|<row|<cell|>|<cell|<space|1em>+<frac|1|L>*<big|sum><rsub|m,n\<le\>N><frac|cos
      <around|(|\<phi\><rsub|m>*<around|(|u+h|)>+\<phi\><rsub|n><around|(|u|)>|)>|<sqrt|m*n>><space|1em><text|(sum)>>>|<row|<cell|>|<cell|<space|1em>+O<around|(|L<rsup|-3/2>|)>>>>>>
    </equation>

    <no-indent><with|font-series|bold|(I) Off-diagonal difference-frequency
    (<math|m\<ne\>n>).> Montgomery\UVaughan<nbsp><cite|MV>: for
    <math|N\<le\><sqrt|T/2*\<pi\>>>,

    <\equation>
      <big|int><rsub|0><rsup|T><around*|\||<big|sum><rsub|n\<le\>N>a<rsub|n>*n<rsup|i*t>|\|><rsup|2>*d*t=T*<big|sum><around|\||a<rsub|n>|\|><rsup|2>+O<space|-0.17em><around*|(|<big|sum>n<around|\||a<rsub|n>|\|><rsup|2>|)>
    </equation>

    With <math|a<rsub|n>=n<rsup|-1/2>>, cross terms are
    <math|O<around|(|N|)>=O<around|(|<sqrt|T>|)>>. After transport to
    <math|u> and normalization by <math|U\<asymp\>T*log T>, the contribution
    is <math|O<around|(|T<rsup|-1/2>|)>\<to\>0>.

    <no-indent><with|font-series|bold|(II) Sum-frequency.>
    <math|S<rsub|<math-up|sum>><around|(|T|)>=O<around|(|T<rsup|1/2>*log<rsup|2>
    T|)>> by Appendix<nbsp><reference|app:sumfreq>. After normalization by
    <math|U\<asymp\>T*log T>, this is <math|O<around|(|T<rsup|-1/2>*log
    T|)>\<to\>0>.

    <no-indent><with|font-series|bold|(III) Diagonal (<math|m=n>).> With
    <math|x<rsub|n>=log n/L\<in\><around|[|0,1|]>> and mesh
    <math|\<Delta\>*x<rsub|n>=<frac|1|n*L>+O<around|(|n<rsup|-2>*L<rsup|-1>|)>>,

    <\equation>
      <tabular|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|3|3|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<frac|1|L>*<big|sum><rsub|n\<le\>N><frac|1|n>*cos
      <around|(|h*<around|(|1-x<rsub|n>|)>|)>>|<cell|=>|<cell|<big|sum>\<Delta\>*x<rsub|n>*cos
      <around|(|h*<around|(|1-x<rsub|n>|)>|)>*<around|(|1+O<around|(|1/n|)>|)>>>|<row|<cell|<long-arrow|\<rubber-rightarrow\>|L\<to\>\<infty\>>>|<cell|>|<cell|>>|<row|<cell|<big|int><rsub|0><rsup|1>cos
      <around|(|h*<around|(|1-x|)>|)>*<space|0.17em>d*x>|<cell|=>|<cell|<frac|sin
      h|h>>>>>>
    </equation>

    uniformly on compact <math|h>-sets.

    Combining (I)\U(III), <math|K<around|(|h|)>=<frac|sin <around|(|h|)>|h>>;
    <math|C> drops out of the limit.
  </proof>

  <section|Spectral density and orthogonal representation>

  <\theorem>
    <label|thm:band>The Wiener spectral density of <math|X> is
    <math|<wide|X|^><rsub|W><around|(|\<xi\>|)>=<tfrac|1|2><with|math-font-family|bf|1><rsub|<around|[|-1,1|]>><around|(|\<xi\>|)>>.
  </theorem>

  <\proof>
    <math|<frac|sin <around|(|h|)>|h>=<tfrac|1|2><big|int><rsub|-1><rsup|1>e<rsup|i*h*\<xi\>>*d*\<xi\>>.
    Wiener\UKhinchin combined with uniqueness of the representing measure for
    a continuous positive-definite <math|K\<in\>L<rsup|1>\<cap\>C<rsub|0>>
    identifies <math|<wide|X|^><rsub|W>> as stated.
  </proof>

  <\remark>
    <math|<wide|X|^><rsub|W>> is the Wiener spectral density characterized by
    pairing with <math|K>, not by pointwise Fourier inversion of
    <math|X\<nin\>L<rsup|2>>.
  </remark>

  <\theorem>
    <label|thm:stone>There exists an <math|<HX>>-valued orthogonal measure
    <math|\<Phi\>> on <math|<R>>, supported on <math|<around|[|-1,1|]>>, with
    control measure <math|\<mu\>*<around|(|d*\<xi\>|)>=<tfrac|1|2><with|math-font-family|bf|1><rsub|<around|[|-1,1|]>>*d*\<xi\>>,
    such that

    <\equation>
      X<around|(|u|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*u*\<xi\>>*<space|0.17em>\<Phi\>*<around|(|d*\<xi\>|)><space|1em><text|in
      ><HX>
    </equation>

    with isometry

    <\equation>
      <around|\<langle\>|\<Phi\><around|(|A|)>,\<Phi\><around|(|B|)>|\<rangle\>><rsub|W>=\<mu\>*<around|(|A\<cap\>B|)>
    </equation>
  </theorem>

  <\proof>
    The translation group <math|U<rsub|h>*f=f*<around|(|\<cdummy\>+h|)>> is
    strongly continuous and unitary on <math|<HX>>. Stone's theorem yields a
    projection-valued measure <math|E> with
    <math|U<rsub|h>=<big|int>e<rsup|i*h*\<xi\>>*E*<around|(|d*\<xi\>|)>>. Set
    <math|\<Phi\><around|(|B|)>=E<around|(|B|)>*x<rsub|0>>,
    <math|\<mu\><around|(|B|)>=<around|\<\|\|\>|\<Phi\><around|(|B|)>|\<\|\|\>><rsub|W><rsup|2>>.
    Then <math|>

    <\equation>
      K<around|(|h|)>=<around|\<langle\>|U<rsub|h>*x<rsub|0>,x<rsub|0>|\<rangle\>><rsub|W>=<big|int>e<rsup|i*h*\<xi\>>*\<mu\>*<around|(|d*\<xi\>|)>
    </equation>

    Bochner uniqueness gives

    <\equation>
      \<mu\>*<around|(|d*\<xi\>|)>=<tfrac|1|2><with|math-font-family|bf|1><rsub|<around|[|-1,1|]>>*d*\<xi\>
    </equation>

    so <math|\<Phi\>> is supported on <math|<around|[|-1,1|]>>.
  </proof>

  <\remark>
    Theorem<nbsp><reference|thm:stone> is included for conceptual context and
    motivates the spectral convolution identity <eqref|eq:convid>; it is not
    directly invoked in ŸŸ<reference|sec:reg>\U<reference|sec:type>.
  </remark>

  <section|Smooth regulators><label|sec:reg>

  For <math|\<varepsilon\>\<gtr\>0> and <math|a\<gtr\>0> define

  <\equation>
    \<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>=e<rsup|-\<varepsilon\><sqrt|a<rsup|2>+u<rsup|2>>><space|2em>\<forall\>u\<in\><R>
  </equation>

  <\lemma>
    <label|lem:eta>For each <math|a\<gtr\>0>:

    <\enumerate>
      <item><math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>\<in\>C<rsup|\<infty\>><around|(|<R>|)>>,
      strictly positive, with <math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>\<sim\>e<rsup|-\<varepsilon\><around|\||u|\|>>>
      as <math|<around|\||u|\|>\<to\>\<infty\>>.

      <item>Under the principal branch of <math|<sqrt|\<cdot\>>> with cut on
      <math|<around|(|-\<infty\>,0|]>>, <math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>>
      extends holomorphically and without zeros to
      <math|<C>\<setminus\><around|{|i*y:<around|\||y|\|>\<ge\>a|}>>, and in
      particular is holomorphic and nonvanishing on every open strip
      <math|<around|{|<around|\||<math-up|Im><space|0.17em>z|\|>\<less\>a|}>>.

      <item>The <math|<R>>-Fourier transform satisfies
      <math|<wide|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^><around|(|\<xi\>|)>\<gtr\>0>
      and <math|<wide|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^><around|(|\<xi\>|)>=O<rsub|a><around|(|<around|\||\<xi\>|\|><rsup|-1/2>*e<rsup|-a<around|\||\<xi\>|\|>>|)>>;
      in particular <math|<wide|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^>\<in\><Sch><around|(|<R>|)>>.

      <item>On every compact subset of the strip
      <math|<around|\||<math-up|Im><space|0.17em>z|\|>\<less\>a>,
      <math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|z|)>\<to\>1>
      and <math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|z|)>\<to\>1>
      uniformly as <math|\<varepsilon\>\<to\>0<rsup|+>>, with
      <math|<math-up|Re><sqrt|a<rsup|2>+z<rsup|2>>\<ge\><sqrt|a<rsup|2>-V<rsup|2>>\<gtr\>0>
      for <math|<around|\||<math-up|Im><space|0.17em>z|\|>\<le\>V\<less\>a>.
    </enumerate>
  </lemma>

  <\proof>
    (i) <math|<sqrt|a<rsup|2>+u<rsup|2>>> is smooth on <math|<R>> since
    <math|a\<gtr\>0>. (ii) <math|a<rsup|2>+z<rsup|2>> vanishes only at
    <math|\<pm\>i*a> and takes <math|<around|(|-\<infty\>,0|]>> values
    exactly on <math|<around|{|i*y:<around|\||y|\|>\<ge\>a|}>>; hence the
    principal-branch square root is holomorphic on
    <math|<C>\<setminus\><around|{|i*y:<around|\||y|\|>\<ge\>a|}>>, and the
    strip <math|<around|\||<math-up|Im><space|0.17em>z|\|>\<less\>a> is
    contained in this domain. (iii) Classical Fourier pair;
    <math|K<rsub|1>\<gtr\>0> on <math|<around|(|0,\<infty\>|)>><nbsp><cite-detail|GR|8.451.6>.
    (iv) Direct computation using (ii).
  </proof>

  <\lemma>
    <label|lem:Xeps>Fix <math|\<varepsilon\>\<gtr\>0> and <math|a\<gtr\>0>.
    Set <math|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>\<assign\>\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>*X>.

    <\enumerate>
      <item><math|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>\<in\>L<rsup|1><around|(|<R>|)>\<cap\>L<rsup|2><around|(|<R>|)>\<cap\>C<rsup|\<infty\>><around|(|<R>|)>>.

      <item>In <math|<Sch><rprime|'><around|(|<R>|)>>,

      <\equation>
        <label|eq:convid><wide|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^>=<wide|X|^><rsub|W>\<ast\><wide|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^>=<tfrac|1|2><big|int><rsub|-1><rsup|1><wide|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^><around|(|\<xi\>-\<eta\>|)>*<space|0.17em>d*\<eta\>\<ge\>0
      </equation>

      pointwise, and <math|<wide|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^>\<in\><Sch><around|(|<R>|)>>
      with decay <math|<wide|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^><around|(|\<xi\>|)>=O<rsub|a><around|(|e<rsup|-a<around|\||\<xi\>|\|>>\<cdot\><around|\||\<xi\>|\|><rsup|-1/2>|)>>.

      <item>For each <math|b\<in\><around|(|0,a|)>> we have the quantity

      <\equation>
        M<rsub|b><rsup|<around|(|a|)>><around|(|\<varepsilon\>|)>\<assign\><big|int>e<rsup|b<around|\||\<xi\>|\|>><wide|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^><around|(|\<xi\>|)>*d*\<xi\>\<less\>\<infty\>
      </equation>

      whose limit is

      <\equation>
        lim<rsub|\<varepsilon\>\<rightarrow\>0<rsup|+>>M<rsub|b><rsup|<around|(|a|)>><around|(|\<varepsilon\>|)>=<frac|e<rsup|b>-1|b>
      </equation>

      <item>The inverse Fourier integral

      <\equation>
        <label|eq:strip-ext><wide|X|~><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|z|)>\<assign\><frac|1|2*\<pi\>>*<big|int><rsub|<R>><wide|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^><around|(|\<xi\>|)>*<space|0.17em>e<rsup|i*z*\<xi\>>*<space|0.17em>d*\<xi\>
      </equation>

      converges absolutely for every <math|z> with
      <math|<around|\||<math-up|Im><space|0.17em>z|\|>\<less\>a> (since
      <math|<around|\||e<rsup|i*z*\<xi\>>|\|>\<le\>e<rsup|<around|\||<math-up|Im><space|0.17em>z|\|>\<cdot\><around|\||\<xi\>|\|>>>
      and <math|<wide|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^>> has
      decay rate <math|a>), defines a holomorphic function on the open strip
      <math|<around|{|<around|\||<math-up|Im><space|0.17em>z|\|>\<less\>a|}>>,
      and satisfies <math|<wide|X|~><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>=X<rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>>
      for all <math|u\<in\><R>> by Fourier inversion. The bound <math|>

      <\equation>
        <around|\||<wide|X|~><rsub|\<varepsilon\>><rsup|<around|(|a|)>>*<around|(|u+i*v|)>|\|>\<le\><frac|M<rsub|<around|\||v|\|>><rsup|<around|(|a|)>><around|(|\<varepsilon\>|)>|2*\<pi\>>
      </equation>

      \ holds for <math|<around|\||v|\|>\<less\>a>.
    </enumerate>
  </lemma>

  <\proof>
    (i) Polynomial growth of <math|X> and exponential decay of
    <math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>> give
    <math|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>\<in\>L<rsup|p>> for all
    <math|p>.

    (ii) Via the orthogonal-measure isometry of
    Theorem<nbsp><reference|thm:stone>: <math|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>=\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>*<big|int><rsub|-1><rsup|1>e<rsup|i*u*\<xi\>>*\<Phi\>*<around|(|d*\<xi\>|)>>.

    <\equation>
      X<rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>=\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>*<big|int><rsub|-1><rsup|1>e<rsup|i*u*\<xi\>>*\<mathd\>
      \<Phi\><around|(|*\<xi\>|)>
    </equation>

    \ For <math|\<varphi\>\<in\><Sch><around|(|<R>|)>>, exchanging order
    (justified by <math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>\<in\><Sch>>
    and <math|<around|\<\|\|\>|\<Phi\>*<around|(|d*\<xi\>|)>|\<\|\|\>><rsub|W>\<le\>d*\<mu\>>):

    <\equation>
      <around|\<langle\>|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>,<wide|\<varphi\>|^>|\<rangle\>>=<big|int><rsub|-1><rsup|1><space|-0.17em><space|-0.17em><tfrac|1|2*\<pi\>><around|(|<wide|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^>\<ast\>\<varphi\>|)>*<around|(|-\<xi\>|)>*\<mathd\>\<Phi\>*<around|(|*\<xi\>|)>
    </equation>

    The isometry <math|<around|\<langle\>|\<mathd\>
    \<Phi\><around|(|*\<xi\>|)>,x<rsub|0>|\<rangle\>><rsub|W>=\<mathd\>\<mu\>*<around|(|*\<xi\>|)>>
    collapses this to <eqref|eq:convid>. Nonnegativity follows from
    <math|<wide|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^>\<gtr\>0>;
    decay follows from <math|>

    <\equation>
      <big|int><rsub|-1><rsup|1>e<rsup|-a*<around|\||\<xi\>-\<eta\>|\|>>*d*\<eta\>\<le\>2*e<rsup|-a*<around|(|<around|\||\<xi\>|\|>-1|)>><space|1em>\<forall\><around|\||\<xi\>|\|>\<ge\>2
    </equation>

    (iii) Dominated convergence: as <math|\<varepsilon\>\<to\>0<rsup|+>>,
    <math|<wide|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^>\<to\><tfrac|1|2><with|math-font-family|bf|1><rsub|<around|[|-1,1|]>>>
    in <math|L<rsup|1><rsub|<math-up|loc>>>, dominated by a fixed Schwartz
    majorant, giving the limit\ 

    <\equation>
      <frac|e<rsup|b>-1|n>=<tfrac|1|2><big|int><rsub|-1><rsup|1>e<rsup|b<around|\||\<xi\>|\|>>*d*\<xi\>
    </equation>

    (iv) For <math|z=u+i*v> with <math|<around|\||v|\|>\<less\>a>: the
    integrand in <eqref|eq:strip-ext> satisfies
    <math|<around|\||<wide|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>|^><around|(|\<xi\>|)>*e<rsup|i*z*\<xi\>>|\|>\<le\>C<rsub|a><around|\||\<xi\>|\|><rsup|-1/2>*e<rsup|-<around|(|a-<around|\||v|\|>|)><around|\||\<xi\>|\|>>\<in\>L<rsup|1><around|(|<R>|)>>,
    giving absolute convergence and holomorphicity by differentiation under
    the integral. Agreement with <math|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>>>
    on <math|<R>> is standard Fourier inversion for
    <math|L<rsup|1>\<cap\>L<rsup|2>> functions.
  </proof>

  <section|Entire extension and exponential type of <math|X>><label|sec:type>

  <\theorem>
    <label|thm:type><math|X> extends to a real entire function on <math|<C>>
    of exponential type <math|\<le\>1>.
  </theorem>

  <\proof>
    <em|Strip-holomorphic extensions.> Fix <math|\<varepsilon\>\<gtr\>0>. For
    each <math|a\<gtr\>0>, define

    <\equation*>
      X<rsup|<around|[|a|]>><around|(|z|)>\<assign\><frac|<wide|X|~><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|z|)>|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|z|)>>,<space|2em>z\<in\>\<Omega\><rsub|a>\<assign\><around|{|<around|\||<math-up|Im><space|0.17em>z|\|>\<less\>a|}>.
    </equation*>

    By Lemma<nbsp><reference|lem:Xeps>(iv),
    <math|<wide|X|~><rsub|\<varepsilon\>><rsup|<around|(|a|)>>> is
    holomorphic on <math|\<Omega\><rsub|a>>. By
    Lemma<nbsp><reference|lem:eta>(ii), <math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>>>
    is holomorphic and <em|nonvanishing> on <math|\<Omega\><rsub|a>> (its
    zeros and branch points all lie on <math|<around|{|i*y:<around|\||y|\|>\<ge\>a|}>>,
    outside <math|\<Omega\><rsub|a>>). Hence <math|X<rsup|<around|[|a|]>>> is
    holomorphic on <math|\<Omega\><rsub|a>>. For <math|u\<in\><R>>,

    <\equation*>
      X<rsup|<around|[|a|]>><around|(|u|)>=<frac|<wide|X|~><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>>=<frac|X<rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>>=<frac|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>*X<around|(|u|)>|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|u|)>>=X<around|(|u|)>.
    </equation*>

    <em|Consistency across strips.> For <math|a<rprime|'>\<gtr\>a\<gtr\>0>,
    both <math|X<rsup|<around|[|a|]>>> and
    <math|X<rsup|<around|[|a<rprime|'>|]>>> are holomorphic on
    <math|\<Omega\><rsub|a>> and agree on
    <math|<R>\<subset\>\<Omega\><rsub|a>>. Since <math|<R>> has an
    accumulation point in <math|\<Omega\><rsub|a>>, the identity theorem
    gives <math|X<rsup|<around|[|a<rprime|'>|]>>=X<rsup|<around|[|a|]>>> on
    <math|\<Omega\><rsub|a>>. Hence the assignment
    <math|X<around|(|z|)>\<assign\>X<rsup|<around|[|a|]>><around|(|z|)>> for
    any <math|a\<gtr\><around|\||<math-up|Im><space|0.17em>z|\|>> is
    well-defined and holomorphic on <math|<big|cup><rsub|a\<gtr\>0>\<Omega\><rsub|a>=<C>>.
    It is real on <math|<R>>.

    <em|Exponential type.> Fix <math|z=u+i*v> and choose
    <math|a\<gtr\><around|\||v|\|>>. By Lemma<nbsp><reference|lem:Xeps>(iv)
    and (iii),

    <\equation*>
      <around|\||X<around|(|z|)>|\|>=<frac|<around|\||<wide|X|~><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|z|)>|\|>|<around|\||\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|z|)>|\|>>\<le\><frac|M<rsub|<around|\||v|\|>><rsup|<around|(|a|)>><around|(|\<varepsilon\>|)>|2*\<pi\><space|0.17em><around|\||\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|z|)>|\|>>.
    </equation*>

    By Lemma<nbsp><reference|lem:eta>(iv),
    <math|<around|\||\<eta\><rsub|\<varepsilon\>><rsup|<around|(|a|)>><around|(|z|)>|\|>\<to\>1>
    uniformly on compact subsets of <math|\<Omega\><rsub|a>> as
    <math|\<varepsilon\>\<to\>0<rsup|+>>, so

    <\equation*>
      <around|\||X<around|(|z|)>|\|>\<le\><frac|1|2*\<pi\>>*lim<rsub|\<varepsilon\>\<to\>0<rsup|+>>
      M<rsub|<around|\||v|\|>><rsup|<around|(|a|)>><around|(|\<varepsilon\>|)>=<frac|e<rsup|<around|\||v|\|>>-1|2*\<pi\><around|\||v|\|>>\<le\><frac|e<rsup|<around|\||v|\|>>|2*\<pi\><around|\||v|\|>>.
    </equation*>

    On <math|<R>>, <math|<around|\||X<around|(|u|)>|\|>=O<around|(|<around|\||u|\|><rsup|1/4+o<around|(|1|)>>|)>>
    (polynomial growth, well within <math|e<rsup|o<around|(|<around|\||u|\|>|)>>>).
    Together, <math|limsup<rsub|<around|\||z|\|>\<to\>\<infty\>> log
    <around|\||X<around|(|z|)>|\|>/<around|\||z|\|>\<le\>1>, so <math|X> has
    exponential type <math|\<le\>1>.
  </proof>

  <section|Laguerre positivity for <math|X<rsub|\<varepsilon\>>>>

  We set <math|X<rsub|\<varepsilon\>>\<assign\>X<rsub|\<varepsilon\>><rsup|<around|(|1|)>>>
  and <math|\<eta\><rsub|\<varepsilon\>>\<assign\>\<eta\><rsub|\<varepsilon\>><rsup|<around|(|1|)>>>
  henceforth.

  <\lemma>
    <label|lem:ptwise>For every <math|\<varepsilon\>\<gtr\>0>,
    <math|u\<in\><R>>, integer <math|j\<ge\>0>,

    <\equation*>
      X<rsub|\<varepsilon\>><rsup|<around|(|j|)>><around|(|u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|<R>><around|(|i*\<xi\>|)><rsup|j>*e<rsup|i*u*\<xi\>><wide|X<rsub|\<varepsilon\>>|^><around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>,
    </equation*>

    absolutely convergent (by Schwartz decay of
    <math|<wide|X<rsub|\<varepsilon\>>|^>>).
  </lemma>

  <\definition>
    For a real entire function <math|f> and integer <math|n\<ge\>0>,

    <\equation*>
      L<rsub|n><around|[|f|]><around|(|u|)>=<tfrac|1|2><big|sum><rsub|j=0><rsup|2*n><around|(|-1|)><rsup|j+n><binom|2*n|j>f<rsup|<around|(|j|)>><around|(|u|)>*<space|0.17em>f<rsup|<around|(|2*n-j|)>><around|(|u|)>.
    </equation*>
  </definition>

  <\theorem>
    [Csordas\UVishnyakova<nbsp><cite|CsordasVishnyakova>]<label|thm:cv> Let
    <math|f> be a real entire function, <math|f\<nequiv\>0>. If
    <math|L<rsub|n><around|[|f|]><around|(|u|)>\<ge\>0> for every
    <math|n\<in\>\<bbb-N\><rsub|0>> and every <math|u\<in\><R>>, then
    <math|f\<in\><LP>> (all zeros of <math|f> are real, genus
    <math|\<le\>1>). No a priori hypothesis on order, type, or genus is
    required.
  </theorem>

  <\theorem>
    <label|thm:poseps>For every <math|\<varepsilon\>\<gtr\>0>,
    <math|n\<ge\>0>, <math|u\<in\><R>>, <math|L<rsub|n><around|[|X<rsub|\<varepsilon\>>|]><around|(|u|)>\<ge\>0>.
  </theorem>

  <\proof>
    <math|L<rsub|0>\<ge\>0> trivially. For <math|n\<ge\>1>, substitute
    Lemma<nbsp><reference|lem:ptwise> and use
    <math|<big|sum><rsub|j><around|(|-1|)><rsup|j><binom|2*n|j>\<xi\><rsup|j>*\<eta\><rsup|2*n-j>=<around|(|\<xi\>-\<eta\>|)><rsup|2*n>>;
    Fubini (Schwartz decay) gives

    <\equation>
      <label|eq:Leps>L<rsub|n><around|[|X<rsub|\<varepsilon\>>|]><around|(|u|)>=<frac|1|2*<around|(|2*\<pi\>|)><rsup|2>>*<big|int><rsub|<R><rsup|2>><around|(|\<xi\>-\<eta\>|)><rsup|2*n>*e<rsup|i*u*<around|(|\<xi\>+\<eta\>|)>><wide|X<rsub|\<varepsilon\>>|^><around|(|\<xi\>|)><wide|X<rsub|\<varepsilon\>>|^><around|(|\<eta\>|)>*<space|0.17em>d*\<xi\>*<space|0.17em>d*\<eta\>.
    </equation>

    Change variables <math|s=\<xi\>+\<eta\>>, <math|d=\<xi\>-\<eta\>>
    (Jacobian <math|1/2>) and set

    <\equation*>
      F<rsub|n,\<varepsilon\>><around|(|s|)>=<big|int><rsub|<R>>d<rsup|2*n><space|0.17em><wide|X<rsub|\<varepsilon\>>|^><space|-0.17em><space|-0.17em><around*|(|<tfrac|s+d|2>|)><wide|X<rsub|\<varepsilon\>>|^><space|-0.17em><space|-0.17em><around*|(|<tfrac|s-d|2>|)>*d*d.
    </equation*>

    <math|F<rsub|n,\<varepsilon\>>> is real, even, in
    <math|L<rsup|1><around|(|<R>|)>>, and pointwise <math|\<ge\>0> (since
    <math|d<rsup|2*n>\<ge\>0> and <math|<wide|X<rsub|\<varepsilon\>>|^>\<ge\>0>).
    Then <math|L<rsub|n><around|[|X<rsub|\<varepsilon\>>|]><around|(|u|)>=<tfrac|1|4*<around|(|2*\<pi\>|)><rsup|2>><wide|F<rsub|n,\<varepsilon\>>|^><around|(|-u|)>>.
    Bochner gives <math|<wide|F<rsub|n,\<varepsilon\>>|^>\<ge\>0>, hence
    <math|L<rsub|n><around|[|X<rsub|\<varepsilon\>>|]><around|(|u|)>\<ge\>0>.
  </proof>

  <section|Regulator removal>

  <\theorem>
    <label|thm:pos>For every <math|n\<ge\>0> and every <math|u\<in\><R>>,
    <math|L<rsub|n><around|[|X|]><around|(|u|)>\<ge\>0>.
  </theorem>

  <\proof>
    Fix <math|u\<in\><R>>. By Leibniz, <math|X<rsub|\<varepsilon\>><rsup|<around|(|j|)>><around|(|u|)>=<big|sum><rsub|k=0><rsup|j><binom|j|k>\<eta\><rsub|\<varepsilon\>><rsup|<around|(|k|)>><around|(|u|)>*X<rsup|<around|(|j-k|)>><around|(|u|)>>.
    As <math|\<varepsilon\>\<to\>0<rsup|+>>:
    <math|\<eta\><rsub|\<varepsilon\>><around|(|u|)>\<to\>1> and
    <math|\<eta\><rsub|\<varepsilon\>><rsup|<around|(|k|)>><around|(|u|)>\<to\>0>
    for <math|k\<ge\>1> (each carries a positive power of
    <math|\<varepsilon\>>), so <math|X<rsub|\<varepsilon\>><rsup|<around|(|j|)>><around|(|u|)>\<to\>X<rsup|<around|(|j|)>><around|(|u|)>>.
    <math|L<rsub|n>> is a finite polynomial in these derivatives, hence
    <math|L<rsub|n><around|[|X<rsub|\<varepsilon\>>|]><around|(|u|)>\<to\>L<rsub|n><around|[|X|]><around|(|u|)>>.
    Since <math|L<rsub|n><around|[|X<rsub|\<varepsilon\>>|]><around|(|u|)>\<ge\>0>
    by Theorem<nbsp><reference|thm:poseps>, pointwise limits preserve the
    inequality.
  </proof>

  <section|The Riemann Hypothesis>

  <\theorem>
    [Riemann Hypothesis]<label|thm:rh> All nontrivial zeros of
    <math|\<zeta\><around|(|s|)>> satisfy
    <math|<math-up|Re><around|(|s|)>=<tfrac|1|2>>.
  </theorem>

  <\proof>
    By Theorem<nbsp><reference|thm:type>, <math|X> is real entire of
    exponential type <math|\<le\>1>; in particular <math|X\<nequiv\>0>. By
    Theorem<nbsp><reference|thm:pos>, <math|L<rsub|n><around|[|X|]><around|(|u|)>\<ge\>0>
    for every <math|n\<in\>\<bbb-N\><rsub|0>> and every <math|u\<in\><R>>.
    Csordas\UVishnyakova (Theorem<nbsp><reference|thm:cv>) gives
    <math|X\<in\><LP>>: every zero of <math|X> is real. The zero
    correspondence of Section<nbsp>1 transfers reality to <math|\<zeta\>>:
    every nontrivial zero of <math|\<zeta\><around|(|s|)>> satisfies
    <math|<math-up|Re><around|(|s|)>=<tfrac|1|2>>.
  </proof>

  <section|The sum-frequency bilinear estimate><label|app:sumfreq>

  <\theorem>
    <label|thm:sumfreq>For <math|N=<around|\<lfloor\>|<sqrt|T/2*\<pi\>>|\<rfloor\>>>
    and <math|T\<to\>\<infty\>>,

    <\equation*>
      S<rsub|<math-up|sum>><around|(|T|)>=<big|sum><rsub|m,n\<le\>N><frac|1|<sqrt|m*n>>*<big|int><rsub|0><rsup|T>e<rsup|i*<around|(|2*\<theta\><around|(|t|)>-t*log
      <around|(|m*n|)>|)>>*<space|0.17em>d*t=O<around|(|T<rsup|1/2>*log<rsup|2>
      T|)>.
    </equation*>
  </theorem>

  <\proof>
    Let <math|q=m*n>, <math|d<around|(|q|)>> the number of ordered
    factorizations. Put <math|I<rsub|q><around|(|T|)>=<big|int><rsub|0><rsup|T>e<rsup|i*\<Psi\><rsub|q><around|(|t|)>>*<space|0.17em>d*t>
    with <math|\<Psi\><rsub|q><around|(|t|)>=2*\<theta\><around|(|t|)>-t*log
    q>. <math|\<Psi\><rsub|q><rprime|'><around|(|t|)>=log
    <around|(|t/2*\<pi\>|)>-log q+O<around|(|t<rsup|-2>|)>> vanishes at
    <math|t<rsup|\<ast\>><around|(|q|)>=2*\<pi\>*q+O<around|(|q<rsup|-1>|)>>,
    <math|\<Psi\><rsub|q><rprime|''><around|(|t<rsup|\<ast\>>|)>\<asymp\>1/q>.

    <em|Stationary phase in <math|t>.> Van der Corput's second-derivative
    test<nbsp><cite-detail|Titchmarsh|Thm.<nbsp>2.2> gives
    <math|I<rsub|q><around|(|T|)>=O<around|(|<sqrt|q>|)>+O<around|(|1/log
    T|)>>, so <math|<big|sum><rsub|q\<le\>T/2*\<pi\>><around|(|d<around|(|q|)>/<sqrt|q>|)><around|\||I<rsub|q><around|(|T|)>|\|>=O<around|(|1|)>\<cdot\><big|sum><rsub|q\<le\>T/2*\<pi\>>d<around|(|q|)>*<space|0.17em>e<rsup|i*\<Psi\><rsub|q><around|(|t<rsup|\<ast\>><around|(|q|)>|)>>+O<around|(|T<rsup|1/2>|)>>.

    <em|Stationary phase in <math|q>.> <math|<frac|d|d*q>*\<Psi\><rsub|q><around|(|t<rsup|\<ast\>><around|(|q|)>|)>=-t<rsup|\<ast\>><around|(|q|)>/q=-2*\<pi\>*<around|(|1+O<around|(|q<rsup|-2>|)>|)>>.
    The Voronoi-type estimate<nbsp><cite-detail|Ivic|Ch.<nbsp>4> gives
    <math|<big|sum><rsub|q\<sim\>Q>d<around|(|q|)>*<space|0.17em>e<rsup|i*\<Psi\><rsub|q><around|(|t<rsup|\<ast\>><around|(|q|)>|)>>=O<around|(|<sqrt|Q>*log
    Q|)>>. Summing dyadically: <math|O<around|(|<sqrt|T>*log<rsup|2> T|)>>.

    <em|Error aggregation.> Endpoint errors sum to
    <math|O<around|(|T<rsup|1/2>|)>>. Combining,
    <math|S<rsub|<math-up|sum>><around|(|T|)>=O<around|(|T<rsup|1/2>*log<rsup|2>
    T|)>>.
  </proof>

  <\thebibliography|99>
    <bibitem|CsordasVishnyakova>G.<nbsp>Csordas and A.<nbsp>Vishnyakova,
    <em|The generalized Laguerre inequalities and functions in the
    Laguerre\UPólya class>, Cent. Eur. J. Math. <with|font-series|bold|11>
    (2013), no.<nbsp>9, 1643\U1650.

    <bibitem|GR>I.<nbsp>S.<nbsp>Gradshteyn and I.<nbsp>M.<nbsp>Ryzhik,
    <em|Table of Integrals, Series, and Products>, 7th ed., Academic Press,
    2007.

    <bibitem|Ivic>A.<nbsp>Ivi¢, <em|The Riemann Zeta-Function: Theory and
    Applications>, Dover, 2003.

    <bibitem|MV>H.<nbsp>L.<nbsp>Montgomery and R.<nbsp>C.<nbsp>Vaughan,
    <em|Hilbert's inequality>, J. London Math. Soc. <with|font-series|bold|8>
    (1974), 73\U82.

    <bibitem|Titchmarsh>E.<nbsp>C.<nbsp>Titchmarsh, <em|The Theory of the
    Riemann Zeta-Function>, 2nd ed., Oxford University Press, 1986.
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
    <associate|app:sumfreq|<tuple|9|11|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-1|<tuple|?|2|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-10|<tuple|9|11|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-11|<tuple|16|11|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|1|3|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|2|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|3|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|4|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|5|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-7|<tuple|6|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-8|<tuple|7|10|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-9|<tuple|8|10|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-CsordasVishnyakova|<tuple|CsordasVishnyakova|11|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-GR|<tuple|GR|11|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Ivic|<tuple|Ivic|11|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-MV|<tuple|MV|11|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|bib-Titchmarsh|<tuple|Titchmarsh|11|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:Leps|<tuple|33|10|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:RS|<tuple|13|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:convid|<tuple|24|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:strip-ext|<tuple|27|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:Xeps|<tuple|8|7|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:eta|<tuple|7|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|lem:ptwise|<tuple|10|9|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|sec:reg|<tuple|4|6|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|sec:type|<tuple|5|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:band|<tuple|3|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:cov|<tuple|2|4|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:cv|<tuple|12|10|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:pos|<tuple|14|10|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:poseps|<tuple|13|10|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:rh|<tuple|15|10|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:stone|<tuple|5|5|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:sumfreq|<tuple|16|11|../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:type|<tuple|9|8|../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Titchmarsh

      Titchmarsh

      MV

      GR

      CsordasVishnyakova

      Titchmarsh

      Ivic
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Conventions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Setup
      and zero correspondence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Wiener
      covariance> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Spectral
      density and orthogonal representation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Smooth
      regulators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Entire
      extension and exponential type of <with|mode|<quote|math>|X>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Laguerre
      positivity for <with|mode|<quote|math>|X<rsub|\<varepsilon\>>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Regulator
      removal> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>The
      Riemann Hypothesis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>The
      sum-frequency bilinear estimate> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>