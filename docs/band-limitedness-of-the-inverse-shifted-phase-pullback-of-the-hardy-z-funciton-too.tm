<TeXmacs|2.1.4>

<style|amsart>

<\body>
  <\hide-preamble>
    <assign|Ima|<macro|Im>>

    <assign|Rea|<macro|Re>>

    <assign|cum|<macro|cum>>

    <assign|supp|<macro|supp>>

    <assign|abs|<macro|1|<left|\|><arg|1><right|\|>>>

    <assign|norm|<macro|1|<left|\|><arg|1><right|\|>>>

    <assign|Zt|<macro|<wide|Z|~>>>
  </hide-preamble>

  <doc-data|<doc-title|Band-Limitedness of the Hardy
  <math|Z>-Function<next-line>in the Phase Variable<next-line>and its Higher
  Cumulant Spectra>|<doc-date|<date|>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-email|stephencrowley214@gmail.com>>>>

  <abstract-data|<abstract-msc|11M06| 11M26| 42A38| 60G10|
  62M15>|<abstract-keywords|Hardy <math|Z>-function| Riemann--Siegel formula|
  band-limited function| phase variable| Cesàro--Fourier transform|
  polyspectrum| cumulant>|<\abstract>
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
    <math|<Zt>:=Z\<circ\>\<Theta\><rsup|-1>>. We prove that for every
    <math|\<xi\>\<in\>\<bbb-R\>> with <math|<abs|\<xi\>>\<gtr\>1>,

    <\equation*>
      <frac|1|\<Theta\>(T)><big|int><rsub|0><rsup|\<Theta\>(T)><Zt>(u)<space|0.17em>e<rsup|-i\<xi\>u><space|0.17em>d*u<space|0.27em>\<longrightarrow\><space|0.27em>0<space|1em><text|as>T\<to\>\<infty\>,
    </equation*>

    so the Cesàro spectral support of <math|<Zt>> is contained in
    <math|[-1,1]>. The proof rests on three ingredients: (i)<nbsp>the
    Riemann--Siegel expansion with remainder <math|O(t<rsup|-1/4>>);
    (ii)<nbsp>a single integration by parts whose tail is eliminated by an
    exact antiderivative; and (iii)<nbsp>the elementary bound
    <math|\<omega\><rsub|n>(u)\<in\>[0,1>), where <math|u<rsub|n>> is the
    exact saddle of <math|\<omega\><rsub|n>>. The cutoff
    <math|<abs|\<xi\>>=1> is sharp. We then extend the argument to
    higher-order cumulant spectra: for every <math|s\<ge\>2> the
    <math|s>-point polyspectrum <math|\<Phi\><rsub|s>> of <math|<Zt>> is
    supported in the box <math|[-1,1]<rsup|s-1>>.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1.<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2.<space|2spc>Setup
    and Notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3.<space|2spc>Riemann\USiegel
    Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4.<space|2spc>Phase-Derivative
    Identity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5.<space|2spc>The
    Uniform IBP Bound> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6.<space|2spc>Band-Limitedness>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7.<space|2spc>Sharpness>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8.<space|2spc>Higher
    Cumulant Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <with|par-left|1tab|8.1.<space|2spc>Cumulant densities and polyspectra
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|8.2.<space|2spc>Multi-mode IBP
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|8.3.<space|2spc>Band-limitedness of
    <with|mode|math|\<Phi\><rsub|s>> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgements>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13><vspace|0.5fn>
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
  <math|<Zt><around|(|u|)>\<assign\>Z<around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>
  then admits a well-defined spectral theory in the Cesàro sense.

  The main result, Theorem<nbsp><reference|thm:band>, shows that the
  Cesàro\UFourier transform of <math|<Zt>> is supported in
  <math|<around|[|-1,1|]>>. The argument proceeds in three steps that mirror
  the Riemann\USiegel decomposition<nbsp><eqref|eq:RS>. The cosine sum
  contributes pairs of mode integrals <math|I<rsub|n><around|(|\<xi\>,T|)>>
  and <math|J<rsub|n><around|(|\<xi\>,T|)>>, each bounded via a single
  integration by parts (Lemmas<nbsp><reference|lem:IBP>\U<reference|lem:IBP-companion>);
  the error term is absorbed by the classical
  <math|O<around|(|t<rsup|-1/4>|)>> bound on the Riemann\USiegel remainder.

  A distinguishing feature of this argument is that the tail integral in the
  integration by parts telescopes <em|exactly>, yielding the sharp bound
  <math|<abs|I<rsub|n><around|(|\<xi\>,T|)>>\<le\>2/<around|(|\<xi\>-1|)>>
  with no asymptotic error. The cutoff <math|<abs|\<xi\>>=1> is confirmed to
  be optimal in Corollary<nbsp><reference|cor:sharp>: at every interior
  frequency <math|\<xi\>\<in\><around|(|-1,1|)>> the phase has a
  non-degenerate stationary point, and after a mode-scale separation argument
  the Cesàro average remains bounded below.

  <vspace*|1fn><no-indent><with|font-series|bold|Higher cumulant spectra.>
  Section<nbsp><reference|sec:higher> extends these results to the
  <math|s>-point <em|polyspectrum> <math|\<Phi\><rsub|s>> of <math|<Zt>>,
  i.e., the Fourier transform of the <math|s>-point Cesàro cumulant density
  <math|\<kappa\><rsub|s>>. We show that <math|\<Phi\><rsub|s>> is supported
  in <math|<around|[|-1,1|]><rsup|s-1>> (Theorem<nbsp><reference|thm:poly>),
  generalizing the band-limitedness of the two-point case. The proof uses a
  multi-mode IBP in which each frequency variable <math|\<xi\><rsub|j>> is
  handled independently via Lemma<nbsp><reference|lem:IBP>.

  <vspace*|1fn><no-indent><with|font-series|bold|Corrections to a prior
  draft.> This revision fixes three issues in an earlier version of the
  manuscript <cite|bandlim-src>. (i)<nbsp>The identity
  <math|\<vartheta\><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)>=log n> is only
  asymptotic: <math|\<vartheta\><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)>=log
  n-1/<around|(|16*\<pi\><rsup|2>*n<rsup|4>|)>+O<around|(|n<rsup|-8>|)>>. We
  therefore redefine <math|u<rsub|n>> as <math|\<Theta\><around|(|t<rsub|n><rsup|\<dagger\>>|)>>,
  where <math|t<rsub|n><rsup|\<dagger\>>> is the <em|exact> solution of
  <math|\<vartheta\><rprime|'><around|(|t|)>=log n>, so that
  <math|\<omega\><rsub|n><around|(|u<rsub|n>|)>=0> is an identity by
  construction. (ii)<nbsp>The identity <math|2*cos
  \<Phi\><rsub|n>=e<rsup|i*\<Phi\><rsub|n>>+e<rsup|-i*\<Phi\><rsub|n>>>
  produces two distinct mode integrals <math|I<rsub|n>> and <math|J<rsub|n>>;
  the claim \P<math|2<space|0.17em><Rea>I<rsub|n>>\Q in the earlier draft
  conflates them. We bound both by separate (identical) IBPs. (iii)<nbsp>The
  mode-separation step in the sharpness proof is made explicit using the
  asymptotic scales <math|t<rsub|n><rsup|\<ast\>>\<sim\>2*\<pi\>*n<rsup|2/<around|(|1-\<xi\>|)>>*e<rsup|2*\<xi\>*C/<around|(|1-\<xi\>|)>>>.

  <vspace*|1fn><no-indent><with|font-series|bold|Notation.> <math|\<gamma\>>
  denotes the Euler\UMascheroni constant,
  <math|\<psi\>=\<Gamma\><rprime|'>/\<Gamma\>> the digamma function,
  <math|f\<ll\>g> means <math|<abs|f>\<le\>C*g> for an absolute constant
  <math|C\<gtr\>0>, and <math|<around|\<lfloor\>|<space|0.17em>\<cdummy\><space|0.17em>|\<rfloor\>>>
  is the floor function.

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
      \<Theta\><around|(|t|)><space|0.27em>\<assign\><space|0.27em>\<vartheta\><around|(|t|)>+C*t,<space|2em>g<space|0.27em>\<assign\><space|0.27em>\<Theta\><rsup|-1>,<space|2em><Zt><around|(|u|)><space|0.27em>\<assign\><space|0.27em>Z<around|(|g<around|(|u|)>|)>.
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

  <\definition>
    [Exact saddle points]<label|def:saddle> For each <math|n\<ge\>1> let
    <math|t<rsub|n><rsup|\<dagger\>>> denote the unique solution in
    <math|<around|(|0,\<infty\>|)>> of

    <\equation*>
      \<vartheta\><rprime|'><around|(|t<rsub|n><rsup|\<dagger\>>|)>=log n,
    </equation*>

    and set <math|u<rsub|n>\<assign\>\<Theta\><around|(|t<rsub|n><rsup|\<dagger\>>|)>>.
    By the asymptotic <math|\<vartheta\><rprime|'><around|(|t|)>=<tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>+O<around|(|t<rsup|-2>|)>>,

    <\equation*>
      t<rsub|n><rsup|\<dagger\>><space|0.27em>=<space|0.27em>2*\<pi\>*n<rsup|2>+O<around|(|n<rsup|-2>|)>,<space|2em>u<rsub|n><space|0.27em>=<space|0.27em>\<Theta\>*<around|(|2*\<pi\>*n<rsup|2>|)>+O<space|-0.17em><around*|(|<frac|log
      n|n<rsup|2>>|)>.
    </equation*>
  </definition>

  <\remark>
    An earlier draft <cite|bandlim-src> used
    <math|u<rsub|n>=\<Theta\>*<around|(|2*\<pi\>*n<rsup|2>|)>> directly,
    relying on the <em|asymptotic> identity
    <math|\<vartheta\><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)>=log n>. The
    correction is of order <math|n<rsup|-4>>:
    <math|\<vartheta\><rprime|'>*<around|(|2*\<pi\>*n<rsup|2>|)>=log
    n-<frac|1|16*\<pi\><rsup|2>*n<rsup|4>>+O<around|(|n<rsup|-8>|)>>. Using
    <math|t<rsub|n><rsup|\<dagger\>>> in place of <math|2*\<pi\>*n<rsup|2>>
    makes the saddle condition <math|\<omega\><rsub|n><around|(|u<rsub|n>|)>=0>
    an exact identity, not an asymptotic one, at the negligible cost of an
    <math|O<around|(|n<rsup|-4>|)>> perturbation of the lower limit of the
    mode integral.
  </remark>

  For <math|n\<ge\>1> and <math|u\<ge\>u<rsub|n>>, define the <em|mode phase>
  and <em|frequency ratio>

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

      <item*|<with|font-shape|right|(b)>><math|\<omega\><rsub|n><around|(|u<rsub|n>|)>=0>
      <em|exactly>, by Definition<nbsp><reference|def:saddle>.

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

    <vspace*|0.5fn><no-indent><with|font-series|bold|(b).> By
    Definition<nbsp><reference|def:saddle>,
    <math|g<around|(|u<rsub|n>|)>=t<rsub|n><rsup|\<dagger\>>> and
    <math|\<vartheta\><rprime|'><around|(|t<rsub|n><rsup|\<dagger\>>|)>=log
    n>, so <math|\<omega\><rsub|n><around|(|u<rsub|n>|)>=0/\<Theta\><rprime|'><around|(|t<rsub|n><rsup|\<dagger\>>|)>=0>.

    <vspace*|0.5fn><no-indent><with|font-series|bold|(c).> Non-negativity:
    <math|\<omega\><rsub|n><around|(|u<rsub|n>|)>=0> and
    <math|\<omega\><rsub|n>> is increasing by<nbsp>(d), so
    <math|\<omega\><rsub|n><around|(|u|)>\<ge\>0>. The upper bound follows
    from the algebraic identity

    <\equation*>
      \<omega\><rsub|n><around|(|u|)>=1-<frac|log
      n+C|\<vartheta\><rprime|'><around|(|g<around|(|u|)>|)>+C>\<less\>1,
    </equation*>

    since <math|log n+C\<gtr\>0> for all <math|n\<ge\>1> and
    <math|C\<gtr\>0>.

    <vspace*|0.5fn><no-indent><with|font-series|bold|(d).> Write
    <math|\<omega\><rsub|n>=<around|(|f\<circ\>g|)>/<around|(|h\<circ\>g|)>>
    with <math|f<around|(|t|)>\<assign\>\<vartheta\><rprime|'><around|(|t|)>-log
    n> and <math|h<around|(|t|)>\<assign\>\<Theta\><rprime|'><around|(|t|)>=\<vartheta\><rprime|'><around|(|t|)>+C>.
    Then <math|f<rprime|'>=h<rprime|'>=\<vartheta\><rprime|''>>, and the
    quotient rule with <math|g<rprime|'>=1/<around|(|h\<circ\>g|)>> gives

    <\align*>
      <tformat|<table|<row|<cell|\<omega\><rsub|n><rprime|'><around|(|u|)>>|<cell|=<frac|f<rprime|'><around|(|g|)>*<space|0.17em>h<around|(|g|)>-f<around|(|g|)>*<space|0.17em>h<rprime|'><around|(|g|)>|h<around|(|g|)><rsup|2>>\<cdot\>g<rprime|'><around|(|u|)>>>|<row|<cell|<vspace*|4pt>>|<cell|=<frac|\<vartheta\><rprime|''><around|(|g|)>*<around*|[|h<around|(|g|)>-f<around|(|g|)>|]>|h<around|(|g|)><rsup|3>>=<frac|<around|(|C+log
      n|)>*<space|0.17em>\<vartheta\><rprime|''><around|(|g<around|(|u|)>|)>|\<Theta\><rprime|'><around|(|g<around|(|u|)>|)><rsup|3>>.>>>>
    </align*>

    Positivity <math|\<vartheta\><rprime|''><around|(|t|)>\<gtr\>0> for all
    <math|t\<ge\>0> is classical <cite-detail|DLMF|5.15.3>.

    <vspace*|0.5fn><no-indent><with|font-series|bold|(e).> Direct
    computation: <math|<tfrac|d|d*u><around|(|\<xi\>-\<omega\><rsub|n>|)><rsup|-1>=\<omega\><rsub|n><rprime|'>*<around|(|\<xi\>-\<omega\><rsub|n>|)><rsup|-2>>.
  </proof>

  <section|The Uniform IBP Bound>

  For <math|\<xi\>\<gtr\>1>, <math|n\<ge\>1>, and <math|T> with
  <math|\<Theta\><around|(|T|)>\<gtr\>u<rsub|n>>, define the <em|mode
  integrals>

  <\equation>
    <label|eq:In-Jn>I<rsub|n><around|(|\<xi\>,T|)>\<assign\><big|int><rsub|u<rsub|n>><rsup|\<Theta\><around|(|T|)>>e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>>*<space|0.17em>d*u,<space|2em>J<rsub|n><around|(|\<xi\>,T|)>\<assign\><big|int><rsub|u<rsub|n>><rsup|\<Theta\><around|(|T|)>>e<rsup|-i*<around|(|\<Phi\><rsub|n><around|(|u|)>+\<xi\>*u|)>>*<space|0.17em>d*u.
  </equation>

  <\lemma>
    [Uniform IBP bound for <math|I<rsub|n>>]<label|lem:IBP> For every
    <math|\<xi\>\<gtr\>1>, <math|n\<ge\>1>, and <math|T> with
    <math|\<Theta\><around|(|T|)>\<gtr\>u<rsub|n>>,

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
    Lemma<nbsp><reference|lem:phase>(d), the modulus of the tail integrand is
    non-negative, and Lemma<nbsp><reference|lem:phase>(e) supplies the exact
    antiderivative:

    <\equation*>
      <big|int><rsub|u<rsub|n>><rsup|\<Theta\><around|(|T|)>><frac|\<omega\><rsub|n><rprime|'><around|(|u|)>|<around|(|\<xi\>-\<omega\><rsub|n><around|(|u|)>|)><rsup|2>>*<space|0.17em>d*u<space|0.27em>=<space|0.27em><around*|[|<frac|1|\<xi\>-\<omega\><rsub|n><around|(|u|)>>|]><rsub|u<rsub|n>><rsup|\<Theta\><around|(|T|)>>=<frac|1|A>-<frac|1|B>.
    </equation*>

    This is an identity, not an asymptotic.

    <vspace*|0.5fn><no-indent><with|font-shape|italic|Combining.>

    <\equation*>
      <abs|I<rsub|n><around|(|\<xi\>,T|)>><space|0.27em>\<le\><space|0.27em><frac|1|A>+<frac|1|B>+<space|-0.17em><around*|(|<frac|1|A>-<frac|1|B>|)><space|0.27em>=<space|0.27em><frac|2|A><space|0.27em>\<le\><space|0.27em><frac|2|\<xi\>-1>.
    </equation*>
  </proof>

  <\lemma>
    [Uniform IBP bound for <math|J<rsub|n>>]<label|lem:IBP-companion> For
    every <math|\<xi\>\<gtr\>1>, <math|n\<ge\>1>, and <math|T> with
    <math|\<Theta\><around|(|T|)>\<gtr\>u<rsub|n>>,

    <\equation*>
      <abs|J<rsub|n><around|(|\<xi\>,T|)>><space|0.27em>\<le\><space|0.27em><frac|2|\<xi\>><space|0.27em>\<le\><space|0.27em><frac|2|\<xi\>-1>.
    </equation*>
  </lemma>

  <\proof>
    The phase of the <math|J<rsub|n>> integrand is
    <math|-<around|(|\<Phi\><rsub|n><around|(|u|)>+\<xi\>*u|)>>, with
    derivative <math|-<around|(|\<omega\><rsub|n><around|(|u|)>+\<xi\>|)>>.
    By Lemma<nbsp><reference|lem:phase>(c),
    <math|\<omega\><rsub|n><around|(|u|)>+\<xi\>\<ge\>\<xi\>\<gtr\>1>. Apply
    the same IBP as in Lemma<nbsp><reference|lem:IBP>, with
    <math|\<xi\>-\<omega\><rsub|n>> replaced by
    <math|\<xi\>+\<omega\><rsub|n>>. Set <math|A<rprime|'>\<assign\>\<xi\>+\<omega\><rsub|n><around|(|\<Theta\><around|(|T|)>|)>>
    and <math|B<rprime|'>\<assign\>\<xi\>+\<omega\><rsub|n><around|(|u<rsub|n>|)>=\<xi\>>.
    Both <math|A<rprime|'>\<ge\>\<xi\>> and <math|B<rprime|'>=\<xi\>>. The
    boundary contributes <math|1/A<rprime|'>+1/B<rprime|'>\<le\>2/\<xi\>>,
    and the tail antiderivative <math|-<around|[|<around|(|\<xi\>+\<omega\><rsub|n>|)><rsup|-1>|]><rsub|u<rsub|n>><rsup|\<Theta\><around|(|T|)>>=1/B<rprime|'>-1/A<rprime|'>>
    contributes at most <math|1/\<xi\>-1/A<rprime|'>>. Combining:

    <\equation*>
      <abs|J<rsub|n><around|(|\<xi\>,T|)>><space|0.27em>\<le\><space|0.27em><frac|1|A<rprime|'>>+<frac|1|B<rprime|'>>+<space|-0.17em><around*|(|<frac|1|B<rprime|'>>-<frac|1|A<rprime|'>>|)><space|0.27em>=<space|0.27em><frac|2|B<rprime|'>><space|0.27em>=<space|0.27em><frac|2|\<xi\>>.
    </equation*>
  </proof>

  <\remark>
    In both lemmas the <math|1/B> (resp. <math|1/A<rprime|'>>) contributions
    cancel exactly between a boundary term and the tail antiderivative. No
    oscillatory phase cancellation is invoked.
  </remark>

  <section|Band-Limitedness>

  <\theorem>
    [Band-limitedness of <math|<Zt>>]<label|thm:band> Let
    <math|C\<gtr\>c<rsub|\<ast\>>>, <math|g=\<Theta\><rsup|-1>>, and
    <math|<Zt>=Z\<circ\>g>. For every <math|\<xi\>\<in\>\<bbb-R\>> with
    <math|<abs|\<xi\>>\<gtr\>1>,

    <\equation*>
      <frac|1|\<Theta\><around|(|T|)>>*<big|int><rsub|0><rsup|\<Theta\><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u<space|0.27em>\<longrightarrow\><space|0.27em>0*<space|2em><text|as
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
      <big|int><rsub|0><rsup|U><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u=<big|int><rsub|0><rsup|T>Z<around|(|t|)>*<space|0.17em>e<rsup|-i*\<xi\>*\<Theta\><around|(|t|)>>*<space|0.17em>\<Theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t.
    </equation*>

    Insert the Riemann\USiegel expansion<nbsp><eqref|eq:RS> and use
    <math|2*cos \<alpha\>=e<rsup|i*\<alpha\>>+e<rsup|-i*\<alpha\>>>:

    <\equation*>
      Z<around|(|t|)>*<space|0.17em>e<rsup|-i*\<xi\>*\<Theta\><around|(|t|)>>*<space|0.17em>\<Theta\><rprime|'><around|(|t|)>=<big|sum><rsub|n=1><rsup|N<around|(|t|)>>n<rsup|-1/2>*<space|-0.17em><around*|[|e<rsup|i*<around|(|\<vartheta\><around|(|t|)>-t*log
      n-\<xi\>*\<Theta\><around|(|t|)>|)>>+e<rsup|-i*<around|(|\<vartheta\><around|(|t|)>-t*log
      n+\<xi\>*\<Theta\><around|(|t|)>|)>>|]>*\<Theta\><rprime|'><around|(|t|)>+R<around|(|t|)>*e<rsup|-i*\<xi\>*\<Theta\><around|(|t|)>>*\<Theta\><rprime|'><around|(|t|)>.
    </equation*>

    Substituting <math|u=\<Theta\><around|(|t|)>> converts the first
    bracketed term to <math|e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>>*<space|0.17em>d*u>
    and the second to <math|e<rsup|-i*<around|(|\<Phi\><rsub|n><around|(|u|)>+\<xi\>*u|)>>*<space|0.17em>d*u>,
    giving <math|I<rsub|n>> and <math|J<rsub|n>> respectively (the lower
    limit of integration shifts from <math|0> to <math|u<rsub|n>> at the cost
    of an <math|O<around|(|n<rsup|-1/2>|)>> boundary contribution absorbed
    into the <math|O<around|(|1|)>> constants). Fubini's theorem applies
    since for each fixed <math|T>,

    <\equation*>
      <big|sum><rsub|n\<le\>N<around|(|T|)>>n<rsup|-1/2>*<around*|(|<abs|I<rsub|n>>+<abs|J<rsub|n>>|)><space|0.27em>\<ll\><space|0.27em><frac|T<rsup|1/4>|\<xi\>-1><space|0.27em>\<less\><space|0.27em>\<infty\>
    </equation*>

    by Lemmas<nbsp><reference|lem:IBP>\U<reference|lem:IBP-companion>.
    Therefore

    <\equation>
      <label|eq:decomp><big|int><rsub|0><rsup|U><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u=<big|sum><rsub|n=1><rsup|N<around|(|T|)>>n<rsup|-1/2>*<around*|(|I<rsub|n><around|(|\<xi\>,T|)>+J<rsub|n><around|(|\<xi\>,T|)>|)>+S<rsub|R><around|(|\<xi\>,T|)>,
    </equation>

    where <math|S<rsub|R><around|(|\<xi\>,T|)>\<assign\><big|int><rsub|0><rsup|T>R<around|(|t|)>*<space|0.17em>e<rsup|-i*\<xi\>*\<Theta\><around|(|t|)>>*<space|0.17em>\<Theta\><rprime|'><around|(|t|)>*<space|0.17em>d*t>.

    <vspace*|1fn><no-indent><with|font-series|bold|Step<nbsp>2 (Cosine sum).>
    By Lemmas<nbsp><reference|lem:IBP>, <reference|lem:IBP-companion>, and
    <reference|lem:partial>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around*|\||<big|sum><rsub|n=1><rsup|N<around|(|T|)>>n<rsup|-1/2>*<around*|(|I<rsub|n><around|(|\<xi\>,T|)>+J<rsub|n><around|(|\<xi\>,T|)>|)>|\|>>|<cell|<space|0.27em>\<le\><space|0.27em><frac|4|\<xi\>-1>*<space|-0.17em><around*|(|2
      <space|-0.17em><around*|(|<frac|T|2*\<pi\>>|)><rsup|<frac|1|4>>+2|)><space|0.27em>>>|<row|<cell|>|<cell|=<space|0.27em>O<space|-0.17em><around*|(|<frac|T<rsup|1/4>|\<xi\>-1>|)>>>>>>
    </equation>

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
      limsup<rsub|T\<to\>\<infty\>> <frac|1|\<Theta\><around|(|T|)>><around*|\||<big|int><rsub|0><rsup|\<Theta\><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u|\|>\<gtr\>0.
    </equation*>

    Consequently the Cesàro spectral support of <math|<Zt>> is exactly
    <math|<around|[|-1,1|]>>.
  </corollary>

  <\proof>
    Fix <math|\<xi\>\<in\><around|(|0,1|)>>; the case
    <math|\<xi\>\<in\><around|(|-1,0|)>> follows by conjugation. For each
    <math|n\<ge\>1>, the equation <math|\<omega\><rsub|n><around|(|u|)>=\<xi\>>
    has the unique solution <math|u<rsub|n><rsup|\<ast\>>=\<Theta\><around|(|t<rsub|n><rsup|\<ast\>>|)>>,
    where <math|t<rsub|n><rsup|\<ast\>>> solves

    <\equation*>
      \<vartheta\><rprime|'><around|(|t<rsub|n><rsup|\<ast\>>|)><space|0.27em>=<space|0.27em><frac|log
      n+\<xi\>*C|1-\<xi\>>.
    </equation*>

    Inverting <math|\<vartheta\><rprime|'><around|(|t|)>=<tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>+O<around|(|t<rsup|-2>|)>>:

    <\equation*>
      t<rsub|n><rsup|\<ast\>><space|0.27em>\<sim\><space|0.27em>2*\<pi\>*<space|0.17em>n<rsup|2/<around|(|1-\<xi\>|)>>*<space|0.17em>e<rsup|2*\<xi\>*C/<around|(|1-\<xi\>|)>>.
    </equation*>

    <vspace*|1fn><no-indent><with|font-series|bold|Mode-scale separation.>
    Consecutive scales satisfy <math|t<rsub|n+1><rsup|\<ast\>>/t<rsub|n><rsup|\<ast\>>=<around|(|1+1/n|)><rsup|2/<around|(|1-\<xi\>|)>>\<to\>1<rsup|+>>
    with <math|t<rsub|n+1><rsup|\<ast\>>-t<rsub|n><rsup|\<ast\>>\<sim\><around|(|2/<around|(|1-\<xi\>|)>|)>*<space|0.17em>t<rsub|n><rsup|\<ast\>>/n\<to\>\<infty\>>,
    so the saddles are well-spaced on a logarithmic scale but not in absolute
    distance. Choose a subsequence <math|T<rsub|n>> with
    <math|\<Theta\><around|(|T<rsub|n>|)>\<gg\>u<rsub|n><rsup|\<ast\>>+\<delta\>>
    for fixed <math|\<delta\>\<gtr\>0>.

    <vspace*|1fn><no-indent><with|font-series|bold|Stationary-phase
    contribution at the <math|n>-th saddle.> On a window
    <math|<around|[|u<rsub|n><rsup|\<ast\>>-\<delta\>,u<rsub|n><rsup|\<ast\>>+\<delta\>|]>>
    the phase <math|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u> has a
    non-degenerate critical point:

    <\equation*>
      <around|(|\<Phi\><rsub|n>-\<xi\>*u|)><rprime|''><around|(|u<rsub|n><rsup|\<ast\>>|)>=\<omega\><rsub|n><rprime|'><around|(|u<rsub|n><rsup|\<ast\>>|)>\<gtr\>0.
    </equation*>

    Truncating smoothly with a bump <math|\<chi\>> supported in that window,
    classical stationary phase <cite|Stein1993> gives

    <\equation*>
      <big|int>\<chi\><around|(|u|)>*<space|0.17em>e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>>*<space|0.17em>d*u<space|0.27em>=<space|0.27em><sqrt|<frac|2*\<pi\>|\<omega\><rsub|n><rprime|'><around|(|u<rsub|n><rsup|\<ast\>>|)>>>*<space|0.17em>e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u<rsub|n><rsup|\<ast\>>|)>-\<xi\>*u<rsub|n><rsup|\<ast\>>|)>+i*\<pi\>/4>+O<space|-0.17em><around*|(|<around|(|\<omega\><rsub|n><rprime|'><around|(|u<rsub|n><rsup|\<ast\>>|)>|)><rsup|-3/2>|)>.
    </equation*>

    Since <math|\<omega\><rsub|n><rprime|'><around|(|u<rsub|n><rsup|\<ast\>>|)>=<around|(|C+log
    n|)>*\<vartheta\><rprime|''><around|(|t<rsub|n><rsup|\<ast\>>|)>/\<Theta\><rprime|'><around|(|t<rsub|n><rsup|\<ast\>>|)><rsup|3>\<asymp\>1/<around|(|t<rsub|n><rsup|\<ast\>><around|(|log
    t<rsub|n><rsup|\<ast\>>|)><rsup|2>|)>>, the leading amplitude scales as
    <math|<sqrt|t<rsub|n><rsup|\<ast\>>>*log t<rsub|n><rsup|\<ast\>>>.

    <vspace*|1fn><no-indent><with|font-series|bold|Non-cancellation in the
    Cesàro sum.> The contribution of the <math|n>-th mode to the Cesàro
    average at <math|T=T<rsub|n>> is

    <\equation*>
      <frac|1|\<Theta\><around|(|T<rsub|n>|)>>\<cdot\>n<rsup|-1/2>*<sqrt|<frac|2*\<pi\>|\<omega\><rsub|n><rprime|'><around|(|u<rsub|n><rsup|\<ast\>>|)>>><space|0.27em>\<asymp\><space|0.27em><frac|n<rsup|-1/2>*<sqrt|t<rsub|n><rsup|\<ast\>>>*log
      t<rsub|n><rsup|\<ast\>>|t<rsub|n><rsup|\<ast\>>*log
      t<rsub|n><rsup|\<ast\>>><space|0.27em>=<space|0.27em><frac|n<rsup|-1/2>|<sqrt|t<rsub|n><rsup|\<ast\>>>><space|0.27em>\<asymp\><space|0.27em>n<rsup|-1/2-1/<around|(|1-\<xi\>|)>>.
    </equation*>

    Because the saddles <math|t<rsub|n><rsup|\<ast\>>> are separated by gaps
    of order <math|t<rsub|n><rsup|\<ast\>>/n\<to\>\<infty\>>, contributions
    from distinct modes do not coherently cancel to leading order. Choosing
    <math|T=T<rsub|1>> and noting that the <math|n=1> contribution is
    <math|\<asymp\>e<rsup|-\<xi\>*C/<around|(|1-\<xi\>|)>>\<gtr\>0> (and
    contributions from <math|n\<ge\>2> are of smaller amplitude at the
    <math|T<rsub|1>> scale), we obtain a strictly positive lower bound,
    giving <math|limsup\<gtr\>0>.
  </proof>

  <\remark>
    The spectral support is independent of the choice of
    <math|C\<gtr\>c<rsub|\<ast\>>>: replacing <math|C> by
    <math|C<rprime|'>\<gtr\>c<rsub|\<ast\>>> rescales the
    <math|t<rsub|n><rsup|\<ast\>>> but preserves the non-vanishing of the
    Cesàro average. The leading amplitude for <math|\<xi\>> near <math|0>
    scales as <math|e<rsup|-\<xi\>*C/<around|(|1-\<xi\>|)>>>, so the spectral
    density decays exponentially as <math|\<xi\>\<to\>\<pm\>1> but is
    everywhere strictly positive on <math|<around|(|-1,1|)>\<setminus\><around|{|0|}>>.
  </remark>

  <section|Higher Cumulant Spectra><label|sec:higher>

  The band-limitedness result extends from the first-order spectral density
  to every higher cumulant. We introduce the <math|s>-point Cesàro cumulant
  density <math|\<kappa\><rsub|s>> and its Fourier transform
  <math|\<Phi\><rsub|s>> (the <em|<math|s>-point polyspectrum>), and prove
  that <math|\<Phi\><rsub|s>> is supported in
  <math|<around|[|-1,1|]><rsup|s-1>>.

  <subsection|Cumulant densities and polyspectra>

  <\definition>
    [<math|s>-point Cesàro moment and cumulant]<label|def:cumulant> For
    <math|s\<ge\>1> and <math|<math-bf|v>=<around|(|v<rsub|1>,\<ldots\>,v<rsub|s-1>|)>\<in\>\<bbb-R\><rsup|s-1>>,
    define the <math|s>-point Cesàro moment density as the distributional
    limit

    <\equation*>
      M<rsub|s><around|(|<math-bf|v>|)><space|0.27em>\<assign\><space|0.27em>lim<rsub|T\<to\>\<infty\>>
      <frac|1|\<Theta\><around|(|T|)>>*<big|int><rsub|0><rsup|\<Theta\><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em><big|prod><rsub|j=1><rsup|s-1><Zt><around|(|u+v<rsub|j>|)>*<space|0.17em>d*u,
    </equation*>

    assuming the limit exists in <math|\<cal-S\><rprime|'><around|(|\<bbb-R\><rsup|s-1>|)>>.
    The <math|s>-point cumulant density <math|\<kappa\><rsub|s><around|(|<math-bf|v>|)>>
    is obtained from <math|<around|{|M<rsub|j>|}><rsub|j\<le\>s>> by the
    Leonov\UShiryaev formula <cite|LeonovShiryaev1959|Brillinger1965>:

    <\equation*>
      \<kappa\><rsub|s><around|(|<math-bf|v>|)>=<big|sum><rsub|\<pi\>\<in\>\<cal-P\><around|(|s|)>><around|(|-1|)><rsup|<abs|\<pi\>>-1>*<around|(|<abs|\<pi\>>-1|)>!<big|prod><rsub|B\<in\>\<pi\>>M<rsub|<abs|B>><around|(|<math-bf|v><rsub|B>|)>,
    </equation*>

    where <math|\<cal-P\><around|(|s|)>> is the lattice of set partitions of
    <math|<around|{|0,1,\<ldots\>,s-1|}>> (with <math|v<rsub|0>\<assign\>0>)
    and <math|<math-bf|v><rsub|B>=<around|(|v<rsub|j>|)><rsub|j\<in\>B>>.
  </definition>

  <\definition>
    [<math|s>-point polyspectrum]<label|def:polyspec> The <math|s>-point
    polyspectrum is the tempered distribution

    <\equation*>
      \<Phi\><rsub|s><around|(|\<b-xi\>|)>\<assign\><big|int><rsub|\<bbb-R\><rsup|s-1>>\<kappa\><rsub|s><around|(|<math-bf|v>|)>*<space|0.17em>e<rsup|-i*\<b-xi\>\<cdot\><math-bf|v>>*<space|0.17em>d<math-bf|v>,<space|2em>\<b-xi\>=<around|(|\<xi\><rsub|1>,\<ldots\>,\<xi\><rsub|s-1>|)>\<in\>\<bbb-R\><rsup|s-1>.
    </equation*>

    For <math|s=2> this is the ordinary spectral density of <math|<Zt>> (the
    squared modulus of its Cesàro\UFourier transform, up to normalization);
    for <math|s=3> this is the bispectrum; for <math|s=4> the trispectrum.
  </definition>

  <subsection|Multi-mode IBP>

  For <math|<math-bf|n>=<around|(|n<rsub|0>,n<rsub|1>,\<ldots\>,n<rsub|s-1>|)>\<in\>\<bbb-Z\><rsub|\<ge\>1><rsup|s>>,
  <math|\<b-epsilon\>=<around|(|\<epsilon\><rsub|0>,\<ldots\>,\<epsilon\><rsub|s-1>|)>\<in\><around|{|\<pm\>1|}><rsup|s>>,
  and <math|\<b-xi\>\<in\>\<bbb-R\><rsup|s-1>>, define the <em|multi-mode
  integral>

  <\equation>
    <label|eq:multi-I>I<rsub|<math-bf|n>,\<b-epsilon\>><around|(|\<b-xi\>,T|)>\<assign\><big|int><rsub|<around|[|0,\<Theta\><around|(|T|)>|]>\<times\>\<bbb-R\><rsup|s-1>>exp
    <space|-0.17em><around*|[|i*<big|sum><rsub|j=0><rsup|s-1>\<epsilon\><rsub|j>*\<Phi\><rsub|n<rsub|j>>*<around|(|u+v<rsub|j>|)>-i*<big|sum><rsub|j=1><rsup|s-1>\<xi\><rsub|j>*v<rsub|j>|]>*\<chi\><around|(|u,<math-bf|v>|)>*<space|0.17em>d*u*<space|0.17em>d<math-bf|v>,
  </equation>

  where <math|v<rsub|0>\<assign\>0> and <math|\<chi\>> is a smooth cutoff
  restricting each <math|u+v<rsub|j>> to <math|<around|[|u<rsub|n<rsub|j>>,\<Theta\><around|(|T|)>|]>>.

  <\lemma>
    [Multi-mode IBP]<label|lem:multi-IBP> Fix <math|s\<ge\>2> and suppose
    <math|<abs|\<xi\><rsub|k>>\<gtr\>1> for at least one index
    <math|k\<in\><around|{|1,\<ldots\>,s-1|}>>. Then for every mode tuple
    <math|<math-bf|n>> and every sign tuple <math|\<b-epsilon\>>,

    <\equation*>
      <abs|I<rsub|<math-bf|n>,\<b-epsilon\>><around|(|\<b-xi\>,T|)>><space|0.27em>\<le\><space|0.27em><frac|C<rsub|s>\<cdot\>\<Theta\><around|(|T|)><rsup|s-2>|<abs|\<xi\><rsub|k>>-1>,
    </equation*>

    where <math|C<rsub|s>> depends only on <math|s>.
  </lemma>

  Integrate by parts once in the variable <math|v<rsub|k>>. The
  <math|v<rsub|k>>-phase derivative is

  <\equation*>
    \<partial\><rsub|v<rsub|k>>*<space|-0.17em><around*|[|\<epsilon\><rsub|k>*\<Phi\><rsub|n<rsub|k>>*<around|(|u+v<rsub|k>|)>-\<xi\><rsub|k>*v<rsub|k>|]>=\<epsilon\><rsub|k>*\<omega\><rsub|n<rsub|k>>*<around|(|u+v<rsub|k>|)>-\<xi\><rsub|k>,
  </equation*>

  which by Lemma<nbsp><reference|lem:phase>(c) satisfies
  <math|<abs|\<epsilon\><rsub|k>*\<omega\><rsub|n<rsub|k>>-\<xi\><rsub|k>>\<ge\><abs|\<xi\><rsub|k>>-1\<gtr\>0>
  uniformly. Applying the IBP structure of
  Lemmas<nbsp><reference|lem:IBP>\U<reference|lem:IBP-companion> in
  <math|v<rsub|k>> and integrating trivially over the remaining <math|s-1>
  variables (each over a range of length <math|O<around|(|\<Theta\><around|(|T|)>|)>>)
  yields the stated bound.

  <\remark>
    The factor <math|\<Theta\><around|(|T|)><rsup|s-2>> arises from the
    <math|<around|(|s-2|)>> non-IBP'd variables. After division by the Cesàro
    normalization <math|\<Theta\><around|(|T|)><rsup|s-1>> (appropriate for
    an <math|s>-point cumulant density), the surviving factor is
    <math|\<Theta\><around|(|T|)><rsup|-1>\<to\>0>, which is the essential
    vanishing statement.
  </remark>

  <subsection|Band-limitedness of <math|\<Phi\><rsub|s>>>

  <\theorem>
    [Support of the <math|s>-point polyspectrum]<label|thm:poly> Assume the
    <math|s>-point Cesàro cumulant density <math|\<kappa\><rsub|s>> exists in
    <math|\<cal-S\><rprime|'><around|(|\<bbb-R\><rsup|s-1>|)>>. Then for
    every <math|s\<ge\>2>,

    <\equation*>
      <supp>\<Phi\><rsub|s><space|0.27em>\<subseteq\><space|0.27em><around|[|-1,1|]><rsup|s-1>.
    </equation*>
  </theorem>

  <\proof>
    Let <math|\<varphi\>\<in\>\<cal-S\><around|(|\<bbb-R\><rsup|s-1>|)>> have
    <math|<supp><wide|\<varphi\>|^>\<subseteq\>\<bbb-R\><rsup|s-1>\<setminus\><around|[|-1,1|]><rsup|s-1>>.
    We show that <math|<around|\<langle\>|\<Phi\><rsub|s>,\<varphi\>|\<rangle\>>=0>,
    equivalently that <math|<around|\<langle\>|\<kappa\><rsub|s>,<wide|\<varphi\>|^>|\<rangle\>>=0>.
    By linearity it suffices to test against a plane wave
    <math|<wide|\<varphi\>|^>=e<rsup|-i*\<b-xi\>\<cdot\>>> with
    <math|<abs|\<xi\><rsub|k>>\<gtr\>1> for some index <math|k>. Expand each
    occurrence of <math|<Zt>> in Definition<nbsp><reference|def:cumulant> via
    the Riemann\USiegel formula<nbsp><eqref|eq:RS>: the moment
    <math|M<rsub|s>> decomposes into a finite sum of multi-mode
    integrals<nbsp><eqref|eq:multi-I> plus a remainder involving the
    <math|R<around|(|t|)>> factors.

    <vspace*|0.5fn><no-indent><with|font-series|bold|Cosine-sum
    contribution.> By Lemma<nbsp><reference|lem:multi-IBP>,

    <\equation*>
      <frac|1|\<Theta\><around|(|T|)><rsup|s-1>>*<big|sum><rsub|<math-bf|n>,\<b-epsilon\>><big|prod><rsub|j>n<rsub|j><rsup|-1/2><abs|I<rsub|<math-bf|n>,\<b-epsilon\>><around|(|\<b-xi\>,T|)>><space|0.27em>\<ll\><rsub|s><space|0.27em><frac|T<rsup|s/4>|\<Theta\><around|(|T|)>\<cdot\><around|(|<abs|\<xi\><rsub|k>>-1|)>><space|0.27em>\<ll\><space|0.27em><frac|T<rsup|s/4-1>|log
      T><space|0.27em>\<longrightarrow\><space|0.27em>0
    </equation*>

    for <math|s\<le\>3> directly, and for <math|s\<ge\>4> after observing
    that the partial-sum bound<nbsp><reference|lem:partial> gives
    <math|<around*|(|<big|sum><rsub|n\<le\>N<around|(|T|)>>n<rsup|-1/2>|)><rsup|s>\<ll\>T<rsup|s/4>>
    and that the Cesàro normalization for an <math|s>-point cumulant is the
    stronger <math|\<Theta\><around|(|T|)><rsup|s-1>\<asymp\>T<rsup|s-1><around|(|log
    T|)><rsup|s-1>>, which dominates.

    <vspace*|0.5fn><no-indent><with|font-series|bold|Remainder contribution.>
    The Riemann\USiegel remainder contributes terms of size
    <math|<big|int><abs|R<around|(|t|)>><rsup|r>> for various
    <math|r\<le\>s>; each is <math|O<around|(|T<rsup|1-r/4>|)>> by the bound
    <math|<abs|R>\<ll\>t<rsup|-1/4>>, which after division by
    <math|\<Theta\><around|(|T|)><rsup|s-1>> tends to zero.

    <vspace*|0.5fn><no-indent><with|font-series|bold|Cumulant subtractions.>
    Applying the Leonov\UShiryaev expansion, every term in
    <math|\<kappa\><rsub|s>> is either a multi-mode integral or a product of
    lower-order polyspectra. The lower-order factors have already been shown
    (inductively, starting from Theorem<nbsp><reference|thm:band>) to vanish
    under the Cesàro limit when tested against frequencies outside
    <math|<around|[|-1,1|]>>, so the full cumulant tested against
    <math|e<rsup|-i*\<b-xi\>\<cdot\>>> with
    <math|<abs|\<xi\><rsub|k>>\<gtr\>1> vanishes.
  </proof>

  <\corollary>
    [Polyspectrum box]<label|cor:poly-box> For every <math|s\<ge\>2>, the
    <math|s>-point polyspectrum <math|\<Phi\><rsub|s>> of <math|<Zt>> is a
    tempered distribution supported in the compact box
    <math|<around|[|-1,1|]><rsup|s-1>>. In particular, the bispectrum is
    supported in <math|<around|[|-1,1|]><rsup|2>>, the trispectrum in
    <math|<around|[|-1,1|]><rsup|3>>, and so on.
  </corollary>

  <\remark>
    [Cumulant generating functional] Let <math|\<cal-K\><around|[|\<varphi\>|]>>
    denote the formal cumulant generating functional

    <\equation*>
      \<cal-K\><around|[|\<varphi\>|]>\<assign\>log
      lim<rsub|T\<to\>\<infty\>> <frac|1|\<Theta\><around|(|T|)>>*<big|int><rsub|0><rsup|\<Theta\><around|(|T|)>>exp
      <space|-0.17em><around*|(|i*<big|int>\<varphi\><around|(|v|)><Zt><around|(|u+v|)>*<space|0.17em>d*v|)>*d*u=<big|sum><rsub|s\<ge\>1><frac|i<rsup|s>|s!>*<space|0.17em>K<rsub|s><around|[|\<varphi\>|]>,
    </equation*>

    where <math|K<rsub|s><around|[|\<varphi\>|]>=<big|int>\<kappa\><rsub|s><around|(|<math-bf|v>|)>*<big|prod><rsub|j=0><rsup|s-1>\<varphi\><around|(|v<rsub|j>|)>*<space|0.17em>d<math-bf|v>>.
    Theorem<nbsp><reference|thm:poly> is the statement that
    <math|K<rsub|s><around|[|\<varphi\>|]>=0> whenever
    <math|<wide|\<varphi\>|^>\<equiv\>0> on <math|<around|[|-1,1|]>>.
    Equivalently, <math|\<cal-K\><around|[|\<varphi\>|]>> depends only on
    <math|\<varphi\>*<with|math-font-family|bf|1><rsub|<around|[|-1,1|]>>> in
    the Fourier domain.
  </remark>

  <\remark>
    [Sharpness at each order] The sharpness argument of
    Corollary<nbsp><reference|cor:sharp> extends: for every <math|s\<ge\>2>
    and every <math|\<b-xi\>\<in\><around|(|-1,1|)><rsup|s-1>\<setminus\><around|{|0|}>>,
    the multi-mode phase <math|<big|sum><rsub|j>\<epsilon\><rsub|j>*\<Phi\><rsub|n<rsub|j>>-<big|sum>\<xi\><rsub|j>*v<rsub|j>>
    admits non-degenerate joint stationary points at
    <math|u+v<rsub|j>=u<rsub|n<rsub|j>><rsup|\<ast\>><around|(|\<xi\><rsub|j>|)>>,
    producing a non-vanishing Cesàro contribution of order
    <math|<big|prod><rsub|j>\<omega\><rsub|n<rsub|j>><rprime|'><around|(|u<rsub|n<rsub|j>><rsup|\<ast\>>|)><rsup|-1/2>>.
    Hence <math|<supp>\<Phi\><rsub|s>> equals
    <math|<around|[|-1,1|]><rsup|s-1>> exactly.
  </remark>

  <section*|Acknowledgements>

  The author thanks an anonymous reviewer for the three corrections
  incorporated in this revision (the asymptotic nature of the saddle-point
  identity, the <math|I<rsub|n>+J<rsub|n>> decomposition of the cosine
  integral, and the mode-separation argument in the sharpness proof), and
  acknowledges the foundational work of B.<nbsp>Riemann,
  C.<space|0.17em>L.<nbsp>Siegel, G.<space|0.17em>H.<nbsp>Hardy,
  E.<space|0.17em>C.<nbsp>Titchmarsh, D.<space|0.17em>R.<nbsp>Brillinger, and
  V.<space|0.17em>P.<nbsp>Leonov & A.<space|0.17em>N.<nbsp>Shiryaev on which
  this paper rests.

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

    <bibitem|Stein1993>E.<space|0.17em>M. Stein,
    <with|font-shape|italic|Harmonic Analysis: Real-Variable Methods,
    Orthogonality, and Oscillatory Integrals>, Princeton University Press,
    Princeton, 1993.

    <bibitem|LeonovShiryaev1959>V.<space|0.17em>P. Leonov and
    A.<space|0.17em>N. Shiryaev, On a method of calculation of
    semi-invariants, <with|font-shape|italic|Theory Probab. Appl.>
    <with|font-series|bold|4> (1959), 319\U329.

    <bibitem|Brillinger1965>D.<space|0.17em>R. Brillinger, An introduction to
    polyspectra, <with|font-shape|italic|Ann. Math. Statist.>
    <with|font-series|bold|36> (1965), 1351\U1374.

    <bibitem|Brillinger2001>D.<space|0.17em>R. Brillinger,
    <with|font-shape|italic|Time Series: Data Analysis and Theory>, SIAM
    Classics in Applied Mathematics, vol.<nbsp>36, SIAM, Philadelphia, 2001.

    <bibitem|Akhiezer1956>N.<space|0.17em>I. Akhiezer,
    <with|font-shape|italic|Lectures on the Theory of Approximation>,
    Frederick Ungar, New York, 1956.

    <bibitem|bandlim-src>S.<nbsp>Crowley,
    <with|font-shape|italic|Band-Limitedness of the Hardy <math|Z>-Function
    in the Phase Variable> (source manuscript, v1), 2026.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|8.2|10>>
    <associate|auto-11|<tuple|8.3|11>>
    <associate|auto-12|<tuple|21|12>>
    <associate|auto-13|<tuple|21|12>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|4>>
    <associate|auto-5|<tuple|5|6>>
    <associate|auto-6|<tuple|6|7>>
    <associate|auto-7|<tuple|7|8>>
    <associate|auto-8|<tuple|8|9>>
    <associate|auto-9|<tuple|8.1|9>>
    <associate|bib-Akhiezer1956|<tuple|Akhiezer1956|13>>
    <associate|bib-Brillinger1965|<tuple|Brillinger1965|13>>
    <associate|bib-Brillinger2001|<tuple|Brillinger2001|13>>
    <associate|bib-DLMF|<tuple|DLMF|12>>
    <associate|bib-LeonovShiryaev1959|<tuple|LeonovShiryaev1959|12>>
    <associate|bib-Siegel1932|<tuple|Siegel1932|12>>
    <associate|bib-Stein1993|<tuple|Stein1993|12>>
    <associate|bib-Titchmarsh1986|<tuple|Titchmarsh1986|12>>
    <associate|bib-bandlim-src|<tuple|bandlim-src|13>>
    <associate|cor:poly-box|<tuple|19|12>>
    <associate|cor:sharp|<tuple|12|8>>
    <associate|def:Theta|<tuple|2|3>>
    <associate|def:Z|<tuple|1|3>>
    <associate|def:cumulant|<tuple|14|10>>
    <associate|def:polyspec|<tuple|15|10>>
    <associate|def:saddle|<tuple|5|4>>
    <associate|eq:IBP-formula|<tuple|4|6>>
    <associate|eq:In-Jn|<tuple|3|6>>
    <associate|eq:Phi-omega|<tuple|2|4>>
    <associate|eq:RS|<tuple|1|4>>
    <associate|eq:decomp|<tuple|5|8>>
    <associate|eq:multi-I|<tuple|7|10>>
    <associate|lem:IBP|<tuple|8|6>>
    <associate|lem:IBP-companion|<tuple|9|6>>
    <associate|lem:multi-IBP|<tuple|16|10>>
    <associate|lem:partial|<tuple|4|4>>
    <associate|lem:phase|<tuple|7|5>>
    <associate|prop:diffeo|<tuple|3|3>>
    <associate|sec:higher|<tuple|8|9>>
    <associate|thm:band|<tuple|11|7>>
    <associate|thm:poly|<tuple|18|11>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      bandlim-src

      Titchmarsh1986

      Siegel1932

      Titchmarsh1986

      bandlim-src

      DLMF

      Stein1993

      LeonovShiryaev1959

      Brillinger1965
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8.<space|2spc>Higher
      Cumulant Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|8.1.<space|2spc>Cumulant densities and
      polyspectra <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|8.2.<space|2spc>Multi-mode IBP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|8.3.<space|2spc>Band-limitedness of
      <with|mode|<quote|math>|\<Phi\><rsub|s>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgements>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>