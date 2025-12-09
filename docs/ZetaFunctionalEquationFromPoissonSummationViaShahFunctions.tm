<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Riemann Zeta Functional Equation via the Shah
  Function:<next-line>Complete Rigorous Derivation>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|November 12, 2025>>

  <\abstract>
    This paper presents a complete rigorous derivation of the Riemann zeta
    functional equation <math|\<xi\><around|(|s|)>=\<xi\>*<around|(|1-s|)>>
    using the Shah function (Dirac comb) as the central analytical tool. The
    Shah function <math|<math-up|III><around|(|x|)>=<big|sum><rsub|n\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-n|)>>
    provides a distributional framework that converts discrete sums into
    continuous integrals through its fundamental sampling property
    <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)><space|0.17em><math-up|III><around|(|x|)>*<space|0.17em>d*x=<big|sum><rsub|n\<in\>\<bbb-Z\>>f<around|(|n|)>>.
    This duality enables the application of Fourier analysis to
    number-theoretic objects. We establish the Poisson summation formula as a
    direct consequence of the Shah function's Fourier series representation,
    apply it to Gaussian functions <math|e<rsup|-\<pi\>*x<rsup|2>*t>> to
    derive the Jacobi theta functional equation
    <math|\<theta\><around|(|t|)>=t<rsup|-1/2>*\<theta\>*<around|(|1/t|)>>,
    and then connect the theta function to the Riemann zeta function via
    Mellin transform. The proof is entirely self-contained, with all
    calculations carried out explicitly without appeal to external results.
    The theta functional equation, obtained through the self-duality of
    Gaussians under Fourier transformation and mediated by the Shah
    function's integer sampling, is shown to imply the zeta functional
    equation through a careful analysis of the integral representation
    <math|2*\<xi\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>><around|(|\<theta\><around|(|t|)>-1|)>*t<rsup|s/2-1>*d*t>.
    This approach illuminates the deep connection between sampling theory in
    signal processing, modular forms in number theory, and the analytic
    properties of <math|\<zeta\><around|(|s|)>>.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Foundational
    Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Shah Function and Sampling> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Poisson
    Summation Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Gaussian
    Fourier Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Theta
    Functional Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Connection
    to <with|mode|math|\<zeta\>> via Mellin Transform>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>The
    Riemann Zeta Functional Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgments>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>
  </table-of-contents>

  <section|Foundational Definitions>

  This section fixes notation and conventions for distributions, Fourier
  analysis, and special functions. References include
  <cite|GelfandShilov|SteinShakarchiFourier|GrafakosClassical|RudinRCA|Edwards|Titchmarsh|IK>.

  <\definition>
    [Schwartz space and tempered distributions]<label|def:Schwartz> The
    Schwartz space <math|\<cal-S\><around|(|\<bbb-R\>|)>> consists of all
    <math|C<rsup|\<infty\>>> functions <math|\<phi\>:\<bbb-R\>\<to\>\<bbb-R\>>
    such that for every pair of nonnegative integers <math|m,n>,

    <\equation>
      <label|eq:Schwartz-seminorm>sup<rsub|x\<in\>\<bbb-R\>><space|0.17em><around*|\||<space|0.17em>x<rsup|m>*<space|0.17em>\<phi\><rsup|<around|(|n|)>><around|(|x|)><space|0.17em>|\|><space|0.27em>\<less\><space|0.27em>\<infty\>
    </equation>

    Its continuous dual <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>> is
    the space of tempered distributions. The distributional pairing is
    denoted <math|<around|\<langle\>|T,\<phi\>|\<rangle\>>> for
    <math|T\<in\>\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>> and
    <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>.
  </definition>

  <\definition>
    [Dirac delta]<label|def:delta> The Dirac delta
    <math|\<delta\>\<in\>\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>> is
    defined by

    <\equation>
      <label|eq:def-delta><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<delta\>*<around|(|x-a|)>*<space|0.17em>\<phi\><around|(|x|)>*<space|0.17em>d*x<space|0.27em>=<space|0.27em>\<phi\><around|(|a|)>
    </equation>

    for all test functions <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>
    and all <math|a\<in\>\<bbb-R\>> <cite|GelfandShilov>.
  </definition>

  <\definition>
    [Shah function (Dirac comb)]<label|def:Shah> The Shah function
    <math|<math-up|III>\<in\>\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>> is
    the <math|1>-periodic tempered distribution

    <\equation>
      <label|eq:def-shah><math-up|III><around|(|x|)><space|0.27em>=<space|0.27em><big|sum><rsub|n\<in\>\<bbb-Z\>>\<delta\>*<around|(|x-n|)>
    </equation>
  </definition>

  <\definition>
    [Fourier transform]<label|def:FT> For
    <math|f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>>, the Fourier transform is

    <\equation>
      <label|eq:def-FT><wide|f|^><around|(|\<omega\>|)><space|0.27em>=<space|0.27em><big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)>*<space|0.17em>e<rsup|-2*\<pi\>*i*<space|0.17em>\<omega\>*x>*<space|0.17em>d*x
    </equation>

    With the normalization in <eqref|eq:def-FT>, the transform extends to a
    topological automorphism of <math|\<cal-S\><around|(|\<bbb-R\>|)>> and by
    duality to <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>>
    <cite|SteinShakarchiFourier|GrafakosClassical>.
  </definition>

  <\definition>
    [Mellin transform]<label|def:Mellin> For
    <math|F:<around|(|0,\<infty\>|)>\<to\>\<bbb-C\>> locally integrable and
    <math|s\<in\>\<bbb-C\>> in a vertical strip where the integral converges,
    the Mellin transform is

    <\equation>
      <label|eq:def-Mellin>\<cal-M\><around|{|F|}><around|(|s|)><space|0.27em>=<space|0.27em><big|int><rsub|0><rsup|\<infty\>>F<around|(|t|)>*<space|0.17em>t<rsup|<space|0.17em>s-1>*<space|0.17em>d*t
    </equation>
  </definition>

  <\definition>
    [Jacobi theta function]<label|def:theta> For <math|t\<gtr\>0>,

    <\equation>
      <label|eq:def-theta>\<theta\><around|(|t|)><space|0.27em>=<space|0.27em><big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|-\<pi\>*n<rsup|2>*t>
    </equation>
  </definition>

  <\definition>
    [Riemann zeta function]<label|def:zeta> For
    <math|<math-up|Re><around|(|s|)>\<gtr\>1>,

    <\equation>
      <label|eq:def-zeta>\<zeta\><around|(|s|)><space|0.27em>=<space|0.27em><big|sum><rsub|n=1><rsup|\<infty\>><frac|1|n<rsup|s>>
    </equation>
  </definition>

  <\definition>
    [Completed zeta]<label|def:xi> The completed zeta function is

    <\equation>
      <label|eq:def-xi>\<xi\><around|(|s|)><space|0.27em>=<space|0.27em>\<pi\><rsup|-<frac|s|2>>*<space|0.17em>\<Gamma\><space|-0.17em><around*|(|<frac|s|2>|)>*<space|0.17em>\<zeta\><around|(|s|)>
    </equation>
  </definition>

  <section|The Shah Function and Sampling>

  <\proposition>
    [Action of <math|<math-up|III>>]<label|prop:Shah-action> For any
    <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>,

    <\equation>
      <label|eq:shah-action><around|\<langle\>|<math-up|III>,<space|0.17em>\<phi\>|\<rangle\>><space|0.27em>=<space|0.27em><big|sum><rsub|n\<in\>\<bbb-Z\>>\<phi\><around|(|n|)>
    </equation>
  </proposition>

  <\proof>
    By linearity of the pairing and <eqref|eq:def-delta>,

    <\align>
      <tformat|<table|<row|<cell|<around|\<langle\>|<math-up|III>,<space|0.17em>\<phi\>|\<rangle\>>>|<cell|<around*|\<nobracket\>|=<around*|\<langle\>|<big|sum><rsub|n\<in\>\<bbb-Z\>>\<delta\>|(>\<cdot\>-n),<space|0.17em>\<phi\>|\<rangle\>><eq-number><label|eq:shah-act-1>>>|<row|<cell|>|<cell|=<big|sum><rsub|n\<in\>\<bbb-Z\>><around|\<langle\>|\<delta\>|(>\<cdot\>-n),<space|0.17em>\<phi\>\<rangle\><eq-number><label|eq:shah-act-2>>>|<row|<cell|>|<cell|=<big|sum><rsub|n\<in\>\<bbb-Z\>>\<phi\><around|(|n|)><eq-number><label|eq:shah-act-3>>>>>
    </align>
  </proof>

  <\proposition>
    [Fourier series of <math|<math-up|III>>]<label|prop:Shah-FS> As a
    periodic tempered distribution,

    <\equation>
      <label|eq:shah-fourier><math-up|III><around|(|x|)><space|0.27em>=<space|0.27em><big|sum><rsub|k\<in\>\<bbb-Z\>>e<rsup|2*\<pi\>*i*k*x>
    </equation>
  </proposition>

  <\proof>
    The period is <math|1>. The <math|k>-th Fourier coefficient over
    <math|<around|[|0,1|)>> equals

    <\equation>
      <label|eq:ck>c<rsub|k><space|0.27em>=<space|0.27em><big|int><rsub|0><rsup|1><math-up|III><around|(|x|)>*<space|0.17em>e<rsup|-2*\<pi\>*i*k*x>*<space|0.17em>d*x<space|0.27em>=<space|0.27em><around|\<langle\>|\<delta\><around|(|x|)>,<space|0.17em>e<rsup|-2*\<pi\>*i*k*x>|\<rangle\>><space|0.27em>=<space|0.27em>1
    </equation>

    since the only delta in <math|<around|[|0,1|)>> is at <math|x=0>. Thus
    <eqref|eq:shah-fourier> holds in <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>>
    <cite-detail|SteinShakarchiFourier|Ÿ1.2>.
  </proof>

  <section|Poisson Summation Formula>

  <\theorem>
    [Poisson summation]<label|thm:PSF> For
    <math|f\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>,

    <\equation>
      <label|eq:psf><big|sum><rsub|n\<in\>\<bbb-Z\>>f<around|(|n|)><space|0.27em>=<space|0.27em><big|sum><rsub|k\<in\>\<bbb-Z\>><wide|f|^><around|(|k|)>
    </equation>
  </theorem>

  <\proof>
    By <eqref|eq:shah-action> and <eqref|eq:shah-fourier>,

    <\align>
      <tformat|<table|<row|<cell|<big|sum><rsub|n\<in\>\<bbb-Z\>>f<around|(|n|)>>|<cell|=<around|\<langle\>|<math-up|III>,<space|0.17em>f|\<rangle\>><eq-number><label|eq:psf-1>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)><space|0.17em><math-up|III><around|(|x|)>*<space|0.17em>d*x<eq-number><label|eq:psf-2>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)>*<space|0.17em><big|sum><rsub|k\<in\>\<bbb-Z\>>e<rsup|2*\<pi\>*i*k*x>*<space|0.17em>d*x<eq-number><label|eq:psf-3>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)>*<space|0.17em>e<rsup|2*\<pi\>*i*k*x>*<space|0.17em>d*x<eq-number><label|eq:psf-4>>>|<row|<cell|>|<cell|=<big|sum><rsub|k\<in\>\<bbb-Z\>><wide|f|^><around|(|-k|)><space|0.27em>=<space|0.27em><big|sum><rsub|k\<in\>\<bbb-Z\>><wide|f|^><around|(|k|)><eq-number><label|eq:psf-5>>>>>
    </align>

    where interchange in <eqref|eq:psf-4> is justified by the rapid decay of
    <math|f> <cite-detail|SteinShakarchiFourier|Ch.<nbsp>3>.
  </proof>

  <section|Gaussian Fourier Transform>

  <\lemma>
    [Gaussian transform]<label|lem:GaussianFT> For <math|t\<gtr\>0> and
    <math|g<rsub|t><around|(|x|)>=e<rsup|-\<pi\>*t*x<rsup|2>>>

    <\equation>
      <label|eq:gaussian-ft><wide|g|^><rsub|t><around|(|\<omega\>|)><space|0.27em>=<space|0.27em><frac|1|<sqrt|t>>*<space|0.17em>e<rsup|-\<pi\>*<frac|\<omega\><rsup|2>|t>>
    </equation>
  </lemma>

  <\proof>
    Compute

    <\align>
      <tformat|<table|<row|<cell|<wide|g|^><rsub|t><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-\<pi\>*t*x<rsup|2>>*<space|0.17em>e<rsup|-2*\<pi\>*i*\<omega\>*x>*<space|0.17em>d*x<eq-number><label|eq:gft-1>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-\<pi\>*t*<around*|(|x<rsup|2>+<frac|2*i*\<omega\>|t>*x|)>>*<space|0.17em>d*x<eq-number><label|eq:gft-2>>>>>
    </align>

    Complete the square:

    <\equation>
      <label|eq:gft-3>x<rsup|2>+<frac|2*i*\<omega\>|t>*x<space|0.27em>=<space|0.27em><around*|(|x+<frac|i*\<omega\>|t>|)><rsup|2>-<around*|(|<frac|i*\<omega\>|t>|)><rsup|2><space|0.27em>=<space|0.27em><around*|(|x+<frac|i*\<omega\>|t>|)><rsup|2>+<frac|\<omega\><rsup|2>|t<rsup|2>>
    </equation>

    Therefore

    <\align>
      <tformat|<table|<row|<cell|-\<pi\>*t*<space|-0.17em><around*|(|x<rsup|2>+<frac|2*i*\<omega\>|t>*x|)>>|<cell|=-\<pi\>*t*<around*|(|x+<frac|i*\<omega\>|t>|)><rsup|2>-\<pi\>*<space|0.17em><frac|\<omega\><rsup|2>|t><eq-number><label|eq:gft-4>>>>>
    </align>

    Insert <eqref|eq:gft-4> into <eqref|eq:gft-2>:

    <\align>
      <tformat|<table|<row|<cell|<wide|g|^><rsub|t><around|(|\<omega\>|)>>|<cell|=e<rsup|-\<pi\>*<frac|\<omega\><rsup|2>|t>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-\<pi\>*t*<around*|(|x+<frac|i*\<omega\>|t>|)><rsup|2>>*<space|0.17em>d*x<eq-number><label|eq:gft-5>>>>>
    </align>

    Shift the contour <math|x\<mapsto\>y=x+<frac|i*\<omega\>|t>> (justified
    since the integrand is entire and decreases sufficiently quickly along
    horizontal lines):

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-\<pi\>*t*<around*|(|x+<frac|i*\<omega\>|t>|)><rsup|2>>*<space|0.17em>d*x>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-\<pi\>*t*y<rsup|2>>*<space|0.17em>d*y<space|0.27em>=<space|0.27em><frac|1|<sqrt|t>><eq-number><label|eq:gft-6>>>>>
    </align>

    using the standard Gaussian integral with the present normalization
    <cite-detail|SteinShakarchiFourier|Ÿ1.2>. Combining <eqref|eq:gft-5> and
    <eqref|eq:gft-6> yields <eqref|eq:gaussian-ft>.
  </proof>

  <section|Theta Functional Equation>

  <\theorem>
    [Theta modular relation]<label|thm:theta-functional> For all
    <math|t\<gtr\>0>,

    <\equation>
      <label|eq:theta-functional>\<theta\><around|(|t|)><space|0.27em>=<space|0.27em><frac|1|<sqrt|t>>*<space|0.17em>\<theta\><space|-0.17em><around*|(|<frac|1|t>|)>
    </equation>
  </theorem>

  <\proof>
    Apply <eqref|thm:PSF> to <math|f<around|(|x|)>=e<rsup|-\<pi\>*t*x<rsup|2>>>.
    The left-hand side is

    <\equation>
      <label|eq:theta-psf-lhs><big|sum><rsub|n\<in\>\<bbb-Z\>>e<rsup|-\<pi\>*t*n<rsup|2>><space|0.27em>=<space|0.27em>\<theta\><around|(|t|)>
    </equation>

    By <eqref|lem:GaussianFT>, the right-hand side is

    <\equation>
      <label|eq:theta-psf-rhs><big|sum><rsub|k\<in\>\<bbb-Z\>><wide|f|^><around|(|k|)><space|0.27em>=<space|0.27em><big|sum><rsub|k\<in\>\<bbb-Z\>><frac|e<rsup|-\<pi\>*<frac|k<rsup|2>|t>>|<sqrt|t>><space|0.27em>=<space|0.27em><frac|\<theta\><space|-0.17em><around*|(|<frac|1|t>|)>|<sqrt|t>>
    </equation>

    Equating <eqref|eq:theta-psf-lhs> and <eqref|eq:theta-psf-rhs> gives
    <eqref|eq:theta-functional> <cite-detail|SteinShakarchiFourier|Ÿ1.4>,
    <cite-detail|ApostolModular|Ch.<nbsp>1>.
  </proof>

  <section|Connection to <math|\<zeta\>> via Mellin Transform>

  <\lemma>
    [Theta decomposition]<label|lem:theta-decomp> For <math|t\<gtr\>0>,

    <\equation>
      <label|eq:theta-decomp>\<theta\><around|(|t|)>-1<space|0.27em>=<space|0.27em><big|sum><rsub|<stack|<tformat|<table|<row|<cell|n\<in\>\<bbb-Z\>>>|<row|<cell|n\<neq\>0>>>>>>e<rsup|-\<pi\>*n<rsup|2>*t><space|0.27em>=<space|0.27em>2*<big|sum><rsub|n=1><rsup|\<infty\>>e<rsup|-\<pi\>*n<rsup|2>*t>
    </equation>
  </lemma>

  <\proof>
    By <eqref|eq:def-theta>, the term <math|n=0> contributes <math|1>, and
    the remaining terms pair as <math|\<pm\>n> with identical value, giving
    <eqref|eq:theta-decomp>.
  </proof>

  <\lemma>
    [Theta\Uzeta Mellin identity]<label|lem:theta-zeta> For
    <math|<math-up|Re><around|(|s|)>\<gtr\>1>,

    <\equation>
      <label|eq:theta-zeta-integral><big|int><rsub|0><rsup|\<infty\>><around*|(|\<theta\><around|(|t|)>-1|)>*<space|0.17em>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t<space|0.27em>=<space|0.27em>2*<space|0.17em>\<pi\><rsup|-<frac|s|2>>*<space|0.17em>\<Gamma\><space|-0.17em><around*|(|<frac|s|2>|)>*<space|0.17em>\<zeta\><around|(|s|)>
    </equation>
  </lemma>

  <\proof>
    Using <eqref|eq:theta-decomp> and Fubini,

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>><around*|(|\<theta\><around|(|t|)>-1|)>*<space|0.17em>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t>|<cell|=2*<big|sum><rsub|n=1><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<pi\>*n<rsup|2>*t>*<space|0.17em>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t<eq-number><label|eq:tz-1>>>>>
    </align>

    For each <math|n\<ge\>1>, substitute <math|u=\<pi\>*n<rsup|2>*t>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<pi\>*n<rsup|2>*t>*<space|0.17em>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-u><space|0.17em><around*|(|<frac|u|\<pi\>*n<rsup|2>>|)><rsup|<frac|s|2>-1><frac|d*u|\<pi\>*n<rsup|2>><eq-number><label|eq:tz-2>>>|<row|<cell|>|<cell|=<frac|1|\<pi\><rsup|<frac|s|2>>*<space|0.17em>n<rsup|s>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-u>*<space|0.17em>u<rsup|<frac|s|2>-1>*<space|0.17em>d*u<eq-number><label|eq:tz-3>>>|<row|<cell|>|<cell|=<frac|1|\<pi\><rsup|<frac|s|2>>*<space|0.17em>n<rsup|s>>*<space|0.17em>\<Gamma\><space|-0.17em><around*|(|<frac|s|2>|)><eq-number><label|eq:tz-4>>>>>
    </align>

    Insert <eqref|eq:tz-4> into <eqref|eq:tz-1> to obtain
    <eqref|eq:theta-zeta-integral>. See <cite-detail|Edwards|Ÿ3.5>,
    <cite-detail|Titchmarsh|Ÿ2.10>.
  </proof>

  <section|The Riemann Zeta Functional Equation>

  <\theorem>
    [Functional equation for <math|\<xi\>>]<label|thm:FE> The completed zeta
    <math|\<xi\><around|(|s|)>=\<pi\><rsup|-<frac|s|2>>*\<Gamma\><space|-0.17em><around*|(|<frac|s|2>|)>*\<zeta\><around|(|s|)>>
    satisfies the meromorphic identity

    <\equation>
      <label|eq:xi-symmetry>\<xi\><around|(|s|)><space|0.27em>=<space|0.27em>\<xi\>*<around|(|1-s|)>*<space|2em><text|for
      all >s\<in\>\<bbb-C\>.
    </equation>
  </theorem>

  <\proof>
    By <eqref|lem:theta-zeta>, for <math|<math-up|Re><around|(|s|)>\<gtr\>1>,

    <\equation>
      <label|eq:xi-mellin>2*<space|0.17em>\<xi\><around|(|s|)><space|0.27em>=<space|0.27em><big|int><rsub|0><rsup|\<infty\>><around*|(|\<theta\><around|(|t|)>-1|)>*<space|0.17em>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t
    </equation>

    Split at <math|t=1>:

    <\equation>
      <label|eq:split>2*<space|0.17em>\<xi\><around|(|s|)><space|0.27em>=<space|0.27em><big|int><rsub|0><rsup|1><around*|(|\<theta\><around|(|t|)>-1|)>*<space|0.17em>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t<space|0.27em>+<space|0.27em><big|int><rsub|1><rsup|\<infty\>><around*|(|\<theta\><around|(|t|)>-1|)>*<space|0.17em>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t
    </equation>

    Use <eqref|eq:theta-functional> in the first integral and substitute
    <math|u=<frac|1|t>>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|1><around*|(|\<theta\><around|(|t|)>-1|)>*<space|0.17em>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t>|<cell|=<big|int><rsub|0><rsup|1><around*|(|<frac|1|<sqrt|t>>*<space|0.17em>\<theta\><space|-0.17em><around*|(|<frac|1|t>|)>-1|)>*t<rsup|<frac|s|2>-1>*<space|0.17em>d*t<eq-number><label|eq:fe-1>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|1>\<theta\><space|-0.17em><around*|(|<frac|1|t>|)>*<space|0.17em>t<rsup|<frac|s|2>-<frac|3|2>>*<space|0.17em>d*t<space|0.27em>-<space|0.27em><big|int><rsub|0><rsup|1>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t<eq-number><label|eq:fe-2>>>|<row|<cell|>|<cell|=<big|int><rsub|1><rsup|\<infty\>>\<theta\><around|(|u|)>*<space|0.17em>u<rsup|-<frac|s|2>-<frac|1|2>>*<space|0.17em>d*u<space|0.27em>-<space|0.27em><frac|2|s><eq-number><label|eq:fe-3>>>|<row|<cell|>|<cell|=<big|int><rsub|1><rsup|\<infty\>><around*|(|1+<around|(|\<theta\><around|(|u|)>-1|)>|)>*<space|0.17em>u<rsup|<frac|1-s|2>-1>*<space|0.17em>d*u<space|0.27em>-<space|0.27em><frac|2|s><eq-number><label|eq:fe-4>>>>>
    </align>

    The first term in <eqref|eq:fe-4> evaluates (for
    <math|<math-up|Re><around|(|s|)>\<gtr\>1>) to

    <\equation>
      <label|eq:fe-5><big|int><rsub|1><rsup|\<infty\>>u<rsup|<frac|1-s|2>-1>*<space|0.17em>d*u<space|0.27em>=<space|0.27em>-<space|0.17em><frac|2|1-s>,
    </equation>

    hence

    <\equation>
      <label|eq:fe-6><big|int><rsub|0><rsup|1><around*|(|\<theta\><around|(|t|)>-1|)>*<space|0.17em>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t<space|0.27em>=<space|0.27em><big|int><rsub|1><rsup|\<infty\>><around*|(|\<theta\><around|(|u|)>-1|)>*<space|0.17em>u<rsup|<frac|1-s|2>-1>*<space|0.17em>d*u<space|0.27em>-<space|0.27em><frac|2|s><space|0.27em>-<space|0.27em><frac|2|1-s>
    </equation>

    Insert <eqref|eq:fe-6> into <eqref|eq:split> and relabel
    <math|u\<mapsto\>t>:

    <\align>
      <tformat|<table|<row|<cell|2*<space|0.17em>\<xi\><around|(|s|)>>|<cell|=<big|int><rsub|1><rsup|\<infty\>><around*|(|\<theta\><around|(|t|)>-1|)>*<space|0.17em>t<rsup|<frac|1-s|2>-1>*<space|0.17em>d*t<space|0.27em>-<space|0.27em><frac|2|s><space|0.27em>-<space|0.27em><frac|2|1-s><space|0.27em>+<space|0.27em><big|int><rsub|1><rsup|\<infty\>><around*|(|\<theta\><around|(|t|)>-1|)>*<space|0.17em>t<rsup|<frac|s|2>-1>*<space|0.17em>d*t<eq-number><label|eq:fe-7>>>|<row|<cell|>|<cell|=<big|int><rsub|1><rsup|\<infty\>><around*|(|\<theta\><around|(|t|)>-1|)>*<space|0.17em><around*|(|t<rsup|<frac|s|2>-1>+t<rsup|<frac|1-s|2>-1>|)>*<space|0.17em>d*t<space|0.27em>-<space|0.27em><frac|2|s><space|0.27em>-<space|0.27em><frac|2|1-s><eq-number><label|eq:fe-8>>>>>
    </align>

    The right-hand side of <eqref|eq:fe-8> is invariant under
    <math|s\<mapsto\>1-s>. Therefore, for
    <math|<math-up|Re><around|(|s|)>\<gtr\>1>,

    <\equation>
      <label|eq:fe-9>\<xi\><around|(|s|)><space|0.27em>=<space|0.27em>\<xi\>*<around|(|1-s|)>
    </equation>

    Both sides of <eqref|eq:fe-9> extend meromorphically to <math|\<bbb-C\>>
    and agree on a nonempty open set, hence <eqref|eq:xi-symmetry> holds for
    all <math|s\<in\>\<bbb-C\>> by analytic continuation
    <cite-detail|Titchmarsh|Ÿ2.10>, <cite-detail|Edwards|Ch.<nbsp>3>.
  </proof>

  <\remark>
    [Alternative normalization]<label|rem:Xi> The entire function
    <math|\<Xi\><around|(|s|)>=<tfrac|1|2><space|0.17em>s*<around|(|s-1|)>*<space|0.17em>\<xi\><around|(|s|)>>
    also satisfies <math|\<Xi\><around|(|s|)>=\<Xi\>*<around|(|1-s|)>> and is
    often used in the theory of the Riemann Hypothesis
    <cite-detail|Titchmarsh|Ÿ2.12>, <cite-detail|Edwards|Ch.<nbsp>1>.
  </remark>

  <section*|Acknowledgments>

  Standard references: <cite|Riemann1859|Titchmarsh|Edwards|SteinShakarchiFourier|GrafakosClassical|IK|GelfandShilov|RudinRCA|ApostolModular>.

  <\thebibliography|99>
    <bibitem|ApostolModular>T. M. Apostol, <em|Modular Functions and
    Dirichlet Series in Number Theory>, 2nd ed., Springer, 1990.

    <bibitem|Edwards>H. M. Edwards, <em|Riemann's Zeta Function>, Academic
    Press, 1974.

    <bibitem|GelfandShilov>I. M. Gel'fand and G. E. Shilov, <em|Generalized
    Functions>, Vol. 1, Academic Press, 1964.

    <bibitem|GrafakosClassical>L. Grafakos, <em|Classical Fourier Analysis>,
    3rd ed., Springer, 2014.

    <bibitem|IK>H. Iwaniec and E. Kowalski, <em|Analytic Number Theory>, AMS
    Colloquium Publications, Vol. 53, 2004.

    <bibitem|Riemann1859>B. Riemann, \PUeber die Anzahl der Primzahlen unter
    einer gegebenen Grösse,\Q <em|Monatsberichte der Berliner Akademie>,
    1859. (English translation in Edwards <cite|Edwards>, Appendix.)

    <bibitem|RudinRCA>W. Rudin, <em|Real and Complex Analysis>, 3rd ed.,
    McGraw\UHill, 1987.

    <bibitem|SteinShakarchiFourier>E. M. Stein and R. Shakarchi, <em|Fourier
    Analysis: An Introduction>, Princeton Univ. Press, 2003.

    <bibitem|Titchmarsh>E. C. Titchmarsh, <em|The Theory of the Riemann
    Zeta-Function>, 2nd ed., revised by D. R. Heath-Brown, Oxford Univ.
    Press, 1986.
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
    <associate|auto-1|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-2|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-3|<tuple|3|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-4|<tuple|4|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-5|<tuple|5|5|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-6|<tuple|6|6|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-7|<tuple|7|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-8|<tuple|17|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|auto-9|<tuple|17|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|bib-ApostolModular|<tuple|ApostolModular|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|bib-Edwards|<tuple|Edwards|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|bib-GelfandShilov|<tuple|GelfandShilov|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|bib-GrafakosClassical|<tuple|GrafakosClassical|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|bib-IK|<tuple|IK|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|bib-Riemann1859|<tuple|Riemann1859|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|bib-RudinRCA|<tuple|RudinRCA|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|bib-SteinShakarchiFourier|<tuple|SteinShakarchiFourier|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|bib-Titchmarsh|<tuple|Titchmarsh|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|def:FT|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|def:Mellin|<tuple|5|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|def:Schwartz|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|def:Shah|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|def:delta|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|def:theta|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|def:xi|<tuple|8|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|def:zeta|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:Schwartz-seminorm|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:ck|<tuple|14|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:def-FT|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:def-Mellin|<tuple|5|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:def-delta|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:def-shah|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:def-theta|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:def-xi|<tuple|8|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:def-zeta|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:fe-1|<tuple|40|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:fe-2|<tuple|41|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:fe-3|<tuple|42|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:fe-4|<tuple|43|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:fe-5|<tuple|44|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:fe-6|<tuple|45|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:fe-7|<tuple|46|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:fe-8|<tuple|47|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:fe-9|<tuple|48|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:gaussian-ft|<tuple|21|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:gft-1|<tuple|22|5|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:gft-2|<tuple|23|5|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:gft-3|<tuple|24|5|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:gft-4|<tuple|25|5|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:gft-5|<tuple|26|5|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:gft-6|<tuple|27|5|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:psf|<tuple|15|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:psf-1|<tuple|16|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:psf-2|<tuple|17|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:psf-3|<tuple|18|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:psf-4|<tuple|19|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:psf-5|<tuple|20|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:shah-act-1|<tuple|10|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:shah-act-2|<tuple|11|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:shah-act-3|<tuple|12|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:shah-action|<tuple|9|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:shah-fourier|<tuple|13|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:split|<tuple|39|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:theta-decomp|<tuple|31|6|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:theta-functional|<tuple|28|5|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:theta-psf-lhs|<tuple|29|5|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:theta-psf-rhs|<tuple|30|6|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:theta-zeta-integral|<tuple|32|6|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:tz-1|<tuple|33|6|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:tz-2|<tuple|34|6|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:tz-3|<tuple|35|6|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:tz-4|<tuple|36|6|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:xi-mellin|<tuple|38|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|eq:xi-symmetry|<tuple|37|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|lem:GaussianFT|<tuple|12|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|lem:theta-decomp|<tuple|14|6|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|lem:theta-zeta|<tuple|15|6|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|prop:Shah-FS|<tuple|10|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|prop:Shah-action|<tuple|9|3|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|rem:Xi|<tuple|17|8|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|thm:FE|<tuple|16|7|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|thm:PSF|<tuple|11|4|../.TeXmacs/texts/scratch/no_name_33.tm>>
    <associate|thm:theta-functional|<tuple|13|5|../.TeXmacs/texts/scratch/no_name_33.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      GelfandShilov

      SteinShakarchiFourier

      GrafakosClassical

      RudinRCA

      Edwards

      Titchmarsh

      IK

      GelfandShilov

      SteinShakarchiFourier

      GrafakosClassical

      SteinShakarchiFourier

      SteinShakarchiFourier

      SteinShakarchiFourier

      SteinShakarchiFourier

      ApostolModular

      Edwards

      Titchmarsh

      Titchmarsh

      Edwards

      Titchmarsh

      Edwards

      Riemann1859

      Titchmarsh

      Edwards

      SteinShakarchiFourier

      GrafakosClassical

      IK

      GelfandShilov

      RudinRCA

      ApostolModular

      Edwards
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Foundational
      Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Shah Function and Sampling> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Poisson
      Summation Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Gaussian
      Fourier Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Theta
      Functional Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Connection
      to <with|mode|<quote|math>|\<zeta\>> via Mellin Transform>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>The
      Riemann Zeta Functional Equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgments>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>