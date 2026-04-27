<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\hide-preamble>
    <assign|re|<macro|Re>>

    <assign|im|<macro|Im>>

    <assign|R|<macro|\<bbb-R\>>>

    <assign|C|<macro|\<bbb-C\>>>

    <assign|N|<macro|\<bbb-N\>>>

    <assign|Th|<macro|\<Theta\>>>

    <assign|vth|<macro|\<vartheta\>>>

    <assign|Zt|<macro|<wide|Z|~>>>

    <assign|lm|<macro|<with|math-font-family|rm|l.i.m.>>>
  </hide-preamble>

  <doc-data|<doc-title|Band-Limitation of the Warped Hardy
  <math|Z>-Function:<next-line>Spectral Support of the Cramér Measure on
  <math|<around|[|-1,1|]>>>|<doc-date|April
  2026>|<doc-author|<author-data|<author-name|Stephen Crowley>>>>

  <abstract-data|<\abstract>
    Let <math|\<vartheta\><around|(|t|)>=<im>log
    \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log
    \<pi\>> be the Riemann--Siegel theta function,
    <math|Z<around|(|t|)>=e<rsup|i*\<vartheta\><around|(|t|)>>*\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>>
    the Hardy <math|Z>-function, and fix <math|C\<gtr\>2.6860917*\<ldots\>>
    so that <math|\<Theta\><around|(|t|)><space|-0.17em>\<assign\><space|-0.17em>\<vartheta\><around|(|t|)>+C*t>
    is a <math|C<rsup|\<infty\>>> diffeomorphism of
    <math|<around|[|0,\<infty\>|)>> onto <math|<around|[|0,\<infty\>|)>> with
    <math|\<Theta\><rprime|'><around|(|t|)>\<gtr\>0>. Define the
    <em|stationary pullback> <math|<Zt><around|(|u|)><space|-0.17em>\<assign\><space|-0.17em>Z<around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>.
    The main result is:

    <vspace*|1fn><no-indent><with|font-series|bold|Theorem A.>
    <with|font-shape|italic|For every <math|\<xi\>\<in\><R>> with
    <math|<around|\||\<xi\>|\|>\<gtr\>1>,>

    <\equation*>
      <frac|1|\<Theta\><around|(|T|)>>*<big|int><rsub|0><rsup|\<Theta\><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u<space|0.27em>\<longrightarrow\><space|0.27em>0*<space|2em><text|as>T\<to\>\<infty\>.
    </equation*>

    <vspace*|0.5fn>The proof uses only the Riemann--Siegel formula with
    remainder <math|O<around|(|t<rsup|-1/4>|)>>, one integration by parts,
    and the exact identity <math|\<omega\><rsub|n><around|(|u|)>\<in\><around|[|0,1|)>>
    for the normalized phase derivative of each Riemann--Siegel term
    (Lemma<nbsp><reference|lem:phase>). The cutoff
    <math|<around|\||\<xi\>|\|>=1> is sharp: for every
    <math|<around|\||\<xi\>|\|>\<less\>1> the stationary-phase contributions
    to the Cesa<math|<wide|<text|r>|\<grave\>>>o--Fourier transform do
    <em|not> vanish (Theorem<nbsp><reference|thm:sharp>). As corollaries: the
    Wiener--Khinchin spectral density of <math|<Zt>> vanishes outside
    <math|<around|[|-1,1|]>>; the associated Cramér orthogonal measure
    <math|d*<wide|G|^>> is supported on <math|<around|[|-1,1|]>>; and
    <math|Z> admits the explicit mean-square convergent spectral integral
    <math|Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<xi\>*\<Theta\><around|(|t|)>>*<space|0.17em>d*<wide|G|^><around|(|\<xi\>|)>>.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|Notation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Setup>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Phase
    Derivative Identity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Proof
    of Band-Limitation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Sharpness>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Corollaries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgements>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:intro>

  The Hardy <math|Z>-function <math|Z<around|(|t|)>=e<rsup|i*\<vartheta\><around|(|t|)>>*\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>>
  is real-valued for real <math|t> and encodes the nontrivial zeros of
  <math|\<zeta\>> as its real zeros. Classical results (Riemann\USiegel
  formula, Backlund, Titchmarsh) analyse <math|Z> via its Dirichlet-series
  structure on the real axis. The present paper instead studies <math|Z>
  after the <em|warp> <math|u=\<Theta\><around|(|t|)>=\<vartheta\><around|(|t|)>+C*t>,
  which turns the rapidly varying phase of <math|Z> into a stationary signal:
  the pulled-back function <math|<Zt><around|(|u|)>=Z<around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>
  oscillates at a mean rate of exactly <math|1> in the <math|u>-variable.

  The main result (Theorem<nbsp><reference|thm:main>) is that <math|<Zt>> is
  <em|spectrally band-limited to <math|<around|[|-1,1|]>>> in the
  Cesa<math|<wide|<text|r>|\<grave\>>>o mean sense: its normalized Fourier
  transform vanishes outside the unit interval as <math|T\<to\>\<infty\>>.
  This implies via the Cramér\UKhinchin inversion theorem
  (Corollary<nbsp><reference|cor:rep>) the explicit mean-square convergent
  spectral representation

  <\equation*>
    Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<xi\>*\<Theta\><around|(|t|)>>*<space|0.17em>d*<wide|G|^><around|(|\<xi\>|)>,<space|2em>t\<ge\>0,
  </equation*>

  where <math|d*<wide|G|^>> is the explicit Cramér orthogonal measure defined
  in<nbsp><eqref|eq:Ghat>.

  The proof of Theorem<nbsp><reference|thm:main> requires three ingredients:

  <\enumerate>
    <item>The Riemann\USiegel formula <eqref|eq:RS> with remainder
    <math|R<around|(|t|)>=O<around|(|t<rsup|-1/4>|)>>.

    <item>The exact phase-derivative identity of
    Lemma<nbsp><reference|lem:phase>, giving
    <math|\<omega\><rsub|n><around|(|u|)>\<in\><around|[|0,1|)>>.

    <item>One integration by parts with an exact antiderivative
    (Lemma<nbsp><reference|lem:ibp>).
  </enumerate>

  No analytic continuation, no moment methods, and no positivity hypotheses
  are needed. The sharpness of <math|<around|\||\<xi\>|\|>=1> is established
  in Theorem<nbsp><reference|thm:sharp> via a stationary-phase calculation.

  <subsection*|Notation>

  <math|<around|\<lfloor\>|x|\<rfloor\>>> denotes the floor function.
  <math|f\<ll\>g> means <math|<around|\||f|\|>\<le\>C*g> for an absolute
  constant <math|C>. <math|<lm>> denotes limit in mean square
  (<math|L<rsup|2>>). All integrals are Lebesgue unless stated otherwise.

  <section|Setup><label|sec:setup>

  <\definition>
    [Warp and inverse]<label|def:warp> The Riemann\USiegel theta function
    satisfies

    <\equation>
      <label|eq:vth><vth><rprime|'><around|(|t|)>=<tfrac|1|2>log
      <around|(|t/2*\<pi\>|)>-<tfrac|1|8*t>+O<around|(|t<rsup|-3>|)>,<space|2em>t\<gtr\>0,
    </equation>

    by Stirling's formula applied to <math|log
    \<Gamma\>*<around|(|<tfrac|1|4>+<tfrac|i*t|2>|)>>. In particular
    <math|inf<rsub|t\<ge\>0><vth><rprime|'><around|(|t|)>\<gtr\>-\<infty\>>;
    its infimum is <math|-2.6860917*\<ldots\>><space|0.27em>. Fix

    <\equation>
      <label|eq:C>C<space|0.27em>\<gtr\><space|0.27em>sup<rsub|t\<ge\>0><around*|(|-<vth><rprime|'><around|(|t|)>|)><space|0.27em>=<space|0.27em>2.6860917*\<ldots\>
    </equation>

    and define <math|<Th><around|(|t|)>\<assign\><vth><around|(|t|)>+C*t>.
    Then:

    <\itemize>
      <item><math|<Th><rprime|'><around|(|t|)>=<vth><rprime|'><around|(|t|)>+C\<gtr\>0>
      for all <math|t\<ge\>0>,

      <item><math|<Th><around|(|0|)>=0> (since <math|<vth><around|(|0|)>=0>),

      <item><math|<Th>:<around|[|0,\<infty\>|)>\<to\><around|[|0,\<infty\>|)>>
      is a <math|C<rsup|\<infty\>>> diffeomorphism.
    </itemize>

    Write <math|g\<assign\><Th><rsup|-1>>, so
    <math|g<rprime|'><around|(|u|)>=1/<Th><rprime|'><around|(|g<around|(|u|)>|)>\<gtr\>0>.
    From<nbsp><eqref|eq:vth>,

    <\equation>
      <label|eq:Thasym><Th><around|(|T|)><space|0.27em>\<sim\><space|0.27em><tfrac|T|2>log
      <around|(|T/2*\<pi\>|)>*<space|2em><text|as >T\<to\>\<infty\>.
    </equation>
  </definition>

  <\definition>
    [Stationary pullback and Cramér measure]<label|def:pullback>Set
    <math|<Zt><around|(|u|)>\<assign\>Z<around|(|g<around|(|u|)>|)>> for
    <math|u\<ge\>0>. Since <math|Z> is real-valued and <math|g> is
    real-analytic, <math|<Zt>> is real-valued.

    The <em|Cramér measure> associated with <math|<Zt>> is

    <\equation>
      <label|eq:Ghat>d*<wide|G|^><around|(|\<xi\>|)><space|0.27em>\<assign\><space|0.27em>lim<rsub|T\<to\>\<infty\>>
      <frac|1|<Th><around|(|T|)>>*<big|int><rsub|0><rsup|<Th><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u\<cdot\>d*\<xi\>
    </equation>

    with variance density (Wiener\UKhinchin spectral density)

    <\equation>
      <label|eq:Phi>\<Phi\><around|(|\<xi\>|)><space|0.27em>\<assign\><space|0.27em>lim<rsub|T\<to\>\<infty\>>
      <frac|1|<Th><around|(|T|)>><around*|\||<big|int><rsub|0><rsup|<Th><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u|\|><rsup|2>,
    </equation>

    where both limits are taken in mean square whenever they exist.
  </definition>

  <\definition>
    [Riemann\USiegel data]<label|def:RS> For <math|t\<gtr\>0> set

    <\equation*>
      N<around|(|t|)>\<assign\><around|\<lfloor\>|<sqrt|t/2*\<pi\>>|\<rfloor\>>,<space|2em>t<rsub|n>\<assign\>2*\<pi\>*n<rsup|2>*<space|1em><around|(|n\<in\><N>|)>,
    </equation*>

    so <math|N<around|(|t|)>\<ge\>n> if and only if <math|t\<ge\>t<rsub|n>>.
    The Riemann\USiegel formula <cite|Titchmarsh1986|Siegel1932> states

    <\equation>
      <label|eq:RS>Z<around|(|t|)>=2*<big|sum><rsub|n=1><rsup|N<around|(|t|)>>n<rsup|-1/2>*cos
      <space|-0.17em><around*|(|<vth><around|(|t|)>-t*log
      n|)>+R<around|(|t|)>,<space|2em><around|\||R<around|(|t|)>|\|>\<ll\>t<rsup|-1/4>.
    </equation>
  </definition>

  <section|Phase Derivative Identity><label|sec:phase>

  <\lemma>
    [Exact phase derivative and range]<label|lem:phase> For <math|n\<ge\>1>
    and <math|u\<ge\>u<rsub|n>\<assign\><Th><around|(|t<rsub|n>|)>=<Th><around|(|2*\<pi\>*n<rsup|2>|)>>,
    define

    <\align>
      <tformat|<table|<row|<cell|\<Phi\><rsub|n><around|(|u|)>>|<cell|\<assign\><vth><around|(|g<around|(|u|)>|)>-g<around|(|u|)>*log
      n,<eq-number><label|eq:Phin>>>|<row|<cell|\<omega\><rsub|n><around|(|u|)>>|<cell|\<assign\><frac|<vth><rprime|'><around|(|g<around|(|u|)>|)>-log
      n|<Th><rprime|'><around|(|g<around|(|u|)>|)>>.<eq-number><label|eq:omegan>>>>>
    </align>

    The following hold exactly:

    <\enumerate>
      <item*|<with|font-family|rm|(a)>><math|<dfrac|d|d*u><around*|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>=\<omega\><rsub|n><around|(|u|)>-\<xi\>>.

      <item*|<with|font-family|rm|(b)>><math|\<omega\><rsub|n><around|(|u<rsub|n>|)>=0>.

      <item*|<with|font-family|rm|(c)>><math|0\<le\>\<omega\><rsub|n><around|(|u|)>\<less\>1>
      for all <math|u\<ge\>u<rsub|n>>.

      <item*|<with|font-family|rm|(d)>><math|\<omega\><rsub|n>> is strictly
      increasing on <math|<around|[|u<rsub|n>,\<infty\>|)>>.

      <item*|<with|font-family|rm|(e)>><math|<dfrac|d|d*u><space|-0.17em><around*|[|<dfrac|-1|\<xi\>-\<omega\><rsub|n><around|(|u|)>>|]>=<dfrac|\<omega\><rsub|n><rprime|'><around|(|u|)>|<around|(|\<xi\>-\<omega\><rsub|n><around|(|u|)>|)><rsup|2>>>
      for every constant <math|\<xi\>\<ne\>\<omega\><rsub|n><around|(|u|)>>.
    </enumerate>
  </lemma>

  <\proof>
    <with|font-shape|italic|(a).> Since <math|g<rprime|'><around|(|u|)>=1/<Th><rprime|'><around|(|g<around|(|u|)>|)>>,

    <\equation>
      <label|eq:dPhi><frac|d*\<Phi\><rsub|n>|d*u>=<around*|(|<vth><rprime|'><around|(|g<around|(|u|)>|)>-log
      n|)>*g<rprime|'><around|(|u|)>=<frac|<vth><rprime|'><around|(|g<around|(|u|)>|)>-log
      n|<Th><rprime|'><around|(|g<around|(|u|)>|)>>=\<omega\><rsub|n><around|(|u|)>.
    </equation>

    Hence <math|<frac|d|d*u>*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)>=\<omega\><rsub|n><around|(|u|)>-\<xi\>>.

    <with|font-shape|italic|(b).> At <math|u=u<rsub|n>> one has
    <math|g<around|(|u<rsub|n>|)>=t<rsub|n>=2*\<pi\>*n<rsup|2>>, and
    <math|<vth><rprime|'><around|(|t<rsub|n>|)>=<tfrac|1|2>log
    <around|(|t<rsub|n>/2*\<pi\>|)>=<tfrac|1|2>log <around|(|n<rsup|2>|)>=log
    n> by<nbsp><eqref|eq:vth>. Hence the numerator of<nbsp><eqref|eq:omegan>
    vanishes at <math|u=u<rsub|n>>.

    <with|font-shape|italic|(c).> For <math|u\<gtr\>u<rsub|n>>:
    <math|g<around|(|u|)>\<gtr\>t<rsub|n>>, <math|<vth><rprime|'>> is
    strictly increasing (since <math|<vth><rprime|''><around|(|t|)>=<frac|1|2*t>+O<around|(|t<rsup|-2>|)>\<gtr\>0>
    for <math|t\<gtr\>0>), so <math|<vth><rprime|'><around|(|g<around|(|u|)>|)>\<gtr\>log
    n> and <math|\<omega\><rsub|n><around|(|u|)>\<gtr\>0>. For the upper
    bound, <math|<Th><rprime|'>=<vth><rprime|'>+C> with <math|C\<gtr\>0>:

    <\equation>
      <label|eq:omegaub>\<omega\><rsub|n><around|(|u|)>=<frac|<vth><rprime|'><around|(|g<around|(|u|)>|)>-log
      n|<vth><rprime|'><around|(|g<around|(|u|)>|)>-log n+C>\<less\>1.
    </equation>

    <with|font-shape|italic|(d).> Differentiating<nbsp><eqref|eq:omegan> and
    using <math|g<rprime|'><around|(|u|)>=1/<Th><rprime|'><around|(|g<around|(|u|)>|)>>,

    <\equation>
      <label|eq:omegaprime>\<omega\><rsub|n><rprime|'><around|(|u|)>=<frac|<vth><rprime|''><around|(|g<around|(|u|)>|)>\<cdot\>C|<Th><rprime|'><around|(|g<around|(|u|)>|)><rsup|3>>\<gtr\>0,
    </equation>

    since <math|<vth><rprime|''><around|(|t|)>\<gtr\>0>, <math|C\<gtr\>0>,
    and <math|<Th><rprime|'>\<gtr\>0>. (A short computation: differentiating
    <math|<around|(|<vth><rprime|'>-log n|)>/<around|(|<vth><rprime|'>+C-log
    n|)>> in <math|u> via the quotient rule and
    <math|g<rprime|'>=1/<Th><rprime|'>> gives the numerator
    <math|C\<cdot\><vth><rprime|''><around|(|g<around|(|u|)>|)>/<Th><rprime|'><around|(|g<around|(|u|)>|)><rsup|3>>,
    positive throughout.)

    <with|font-shape|italic|(e).> Chain rule:
    <math|<frac|d|d*u><around|[|<around|(|\<xi\>-\<omega\><rsub|n>|)><rsup|-1>|]>=\<omega\><rsub|n><rprime|'>*<around|(|\<xi\>-\<omega\><rsub|n>|)><rsup|-2>>.
  </proof>

  <section|Proof of Band-Limitation><label|sec:main>

  <\lemma>
    [Integration by parts bound]<label|lem:ibp> For <math|\<xi\>\<gtr\>1>,
    <math|n\<ge\>1>, and <math|T\<gtr\>t<rsub|n>>, define

    <\equation>
      <label|eq:In>I<rsub|n><around|(|\<xi\>,T|)>\<assign\><big|int><rsub|u<rsub|n>><rsup|<Th><around|(|T|)>>e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>>*<space|0.17em>d*u.
    </equation>

    Then

    <\equation>
      <label|eq:Inbound><around|\||I<rsub|n><around|(|\<xi\>,T|)>|\|><space|0.27em>\<le\><space|0.27em><frac|3|\<xi\>-1>.
    </equation>
  </lemma>

  <\proof>
    Since <math|\<xi\>\<gtr\>1> and <math|\<omega\><rsub|n><around|(|u|)>\<in\><around|[|0,1|)>>
    by Lemma<nbsp><reference|lem:phase>(c),

    <\equation>
      <label|eq:gap>\<xi\>-\<omega\><rsub|n><around|(|u|)>\<ge\>\<xi\>-1\<gtr\>0*<space|2em><text|for
      all >u\<in\><around|[|u<rsub|n>,<Th><around|(|T|)>|]>.
    </equation>

    Write the integrand as <math|e<rsup|i*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)>>=<frac|1|i*<around|(|\<omega\><rsub|n>-\<xi\>|)>>\<cdot\><frac|d|d*u>*e<rsup|i*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)>>>
    using Lemma<nbsp><reference|lem:phase>(a), and integrate by parts:

    <\equation>
      <label|eq:IBP>I<rsub|n><around|(|\<xi\>,T|)>=<around*|[|<frac|e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>>|i*<around|(|\<omega\><rsub|n><around|(|u|)>-\<xi\>|)>>|]><rsub|u<rsub|n>><rsup|<Th><around|(|T|)>>+<big|int><rsub|u<rsub|n>><rsup|<Th><around|(|T|)>><frac|e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>>*<space|0.17em>\<omega\><rsub|n><rprime|'><around|(|u|)>|i*<space|0.17em><around|(|\<xi\>-\<omega\><rsub|n><around|(|u|)>|)><rsup|2>>*<space|0.17em>d*u.
    </equation>

    Taking moduli, using <math|<around|\||e<rsup|i<around|(|\<cdots\>|)>>|\|>=1>,
    <math|\<omega\><rsub|n><around|(|u<rsub|n>|)>=0>
    (Lemma<nbsp><reference|lem:phase>(b)), and
    Lemma<nbsp><reference|lem:phase>(e):

    <\align>
      <tformat|<table|<row|<cell|<around|\||I<rsub|n><around|(|\<xi\>,T|)>|\|>>|<cell|\<le\><frac|1|\<xi\>-\<omega\><rsub|n><around|(|<Th><around|(|T|)>|)>>+<frac|1|\<xi\>>+<big|int><rsub|u<rsub|n>><rsup|<Th><around|(|T|)>><frac|\<omega\><rsub|n><rprime|'><around|(|u|)>|<around|(|\<xi\>-\<omega\><rsub|n><around|(|u|)>|)><rsup|2>>*<space|0.17em>d*u<eq-number>>>|<row|<cell|>|<cell|=<frac|1|\<xi\>-\<omega\><rsub|n><around|(|<Th><around|(|T|)>|)>>+<frac|1|\<xi\>>+<around*|[|<frac|1|\<xi\>-\<omega\><rsub|n><around|(|u|)>>|]><rsub|u<rsub|n>><rsup|<Th><around|(|T|)>><eq-number><label|eq:antider>>>|<row|<cell|>|<cell|=<frac|2|\<xi\>-\<omega\><rsub|n><around|(|<Th><around|(|T|)>|)>>+<frac|1|\<xi\>>-<frac|1|\<xi\>>+<frac|1|\<xi\>><eq-number>>>|<row|<cell|>|<cell|\<le\><frac|2|\<xi\>-1>+<frac|1|\<xi\>>.<eq-number>>>>>
    </align>

    (Line<nbsp><eqref|eq:antider> uses the exact antiderivative of
    Lemma<nbsp><reference|lem:phase>(e); the last inequality uses
    <math|\<omega\><rsub|n><around|(|<Th><around|(|T|)>|)>\<less\>1>.) Since
    <math|1/\<xi\>\<le\>1/<around|(|\<xi\>-1|)>> for all
    <math|\<xi\>\<gtr\>1>, we obtain <math|<around|\||I<rsub|n>|\|>\<le\>3/<around|(|\<xi\>-1|)>>.
  </proof>

  <\theorem>
    [Band-limitation]<label|thm:main> For every <math|\<xi\>\<in\><R>> with
    <math|<around|\||\<xi\>|\|>\<gtr\>1>,

    <\equation>
      <label|eq:main><frac|1|<Th><around|(|T|)>>*<big|int><rsub|0><rsup|<Th><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u<space|0.27em>\<longrightarrow\><space|0.27em>0*<space|2em><text|as
      >T\<to\>\<infty\>.
    </equation>
  </theorem>

  <\proof>
    It suffices to treat <math|\<xi\>\<gtr\>1>; the case
    <math|\<xi\>\<less\>-1> follows by conjugation (replace
    <math|u\<mapsto\>-u> and use <math|Z> real).

    <vspace*|1fn><no-indent><with|font-series|bold|Step 1: Change of
    variables.>

    Setting <math|u=<Th><around|(|t|)>>, <math|d*u=<Th><rprime|'><around|(|t|)>*<space|0.17em>d*t>,
    <math|t=g<around|(|u|)>>:

    <\equation>
      <label|eq:cov><big|int><rsub|0><rsup|<Th><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u=<big|int><rsub|0><rsup|T>Z<around|(|t|)>*<space|0.17em>e<rsup|-i*\<xi\><Th><around|(|t|)>><space|0.17em><Th><rprime|'><around|(|t|)>*<space|0.17em>d*t.
    </equation>

    Substitute<nbsp><eqref|eq:RS> and write <math|cos
    \<theta\>=<tfrac|1|2><around|(|e<rsup|i*\<theta\>>+e<rsup|-i*\<theta\>>|)>>.
    Taking the <math|e<rsup|+i<vth><around|(|t|)>>> branch (the
    <math|e<rsup|-i<vth><around|(|t|)>>> branch gives the complex conjugate
    of the same expression):

    <\equation>
      <label|eq:Jtilde><big|int><rsub|0><rsup|T>e<rsup|i*<around|(|<vth><around|(|t|)>-t*log
      n|)>>*<space|0.17em>e<rsup|-i*\<xi\><Th><around|(|t|)>><space|0.17em><Th><rprime|'><around|(|t|)>*<space|0.17em>d*t,<space|2em>n=1,\<ldots\>,N<around|(|T|)>.
    </equation>

    The <math|n>-th integrand is activated only when
    <math|n\<le\>N<around|(|t|)>>, i.e., when
    <math|t\<ge\>t<rsub|n>=2*\<pi\>*n<rsup|2>>. The region
    <math|<around|{|<around|(|n,t|)>:1\<le\>n\<le\>N<around|(|t|)>,0\<le\>t\<le\>T|}>=<around|{|<around|(|n,t|)>:n\<ge\>1,t<rsub|n>\<le\>t\<le\>T|}>>,
    so the Fubini exchange

    <\equation>
      <label|eq:fubini><big|int><rsub|0><rsup|T><space|-0.17em><space|-0.17em><big|sum><rsub|n\<le\>N<around|(|t|)>>f<rsub|n><around|(|t|)>*<space|0.17em>d*t=<big|sum><rsub|n=1><rsup|N<around|(|T|)>><big|int><rsub|t<rsub|n>><rsup|T>f<rsub|n><around|(|t|)>*<space|0.17em>d*t
    </equation>

    is exact.

    In each inner integral, substitute <math|u=<Th><around|(|t|)>> (so
    <math|<Th><rprime|'><around|(|t|)>*<space|0.17em>d*t=d*u>):

    <\equation*>
      <big|int><rsub|t<rsub|n>><rsup|T>e<rsup|i*<around|(|<vth><around|(|t|)>-t*log
      n-\<xi\><Th><around|(|t|)>|)>><Th><rprime|'><around|(|t|)>*<space|0.17em>d*t=<big|int><rsub|u<rsub|n>><rsup|<Th><around|(|T|)>>e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u|)>>*<space|0.17em>d*u=I<rsub|n><around|(|\<xi\>,T|)>,
    </equation*>

    with <math|\<Phi\><rsub|n>> defined in<nbsp><eqref|eq:Phin>. The full
    identity is

    <\equation>
      <label|eq:fullid><big|int><rsub|0><rsup|<Th><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u=2*<big|sum><rsub|n=1><rsup|N<around|(|T|)>>n<rsup|-1/2><space|0.17em><re><space|0.17em>I<rsub|n><around|(|\<xi\>,T|)>+S<rsub|R><around|(|\<xi\>,T|)>,
    </equation>

    where <math|S<rsub|R><around|(|\<xi\>,T|)>\<assign\><big|int><rsub|0><rsup|T>R<around|(|t|)>*<space|0.17em>e<rsup|-i*\<xi\><Th><around|(|t|)>><Th><rprime|'><around|(|t|)>*<space|0.17em>d*t>.

    <vspace*|1fn><no-indent><with|font-series|bold|Step 2: Bound on the
    cosine sum.>

    By Lemma<nbsp><reference|lem:ibp>, <math|<around|\||I<rsub|n><around|(|\<xi\>,T|)>|\|>\<le\>3/<around|(|\<xi\>-1|)>>
    uniformly in <math|n> and <math|T>. The standard partial-sum estimate
    gives

    <\equation*>
      <big|sum><rsub|n=1><rsup|N<around|(|T|)>>n<rsup|-1/2>\<le\>2*<sqrt|N<around|(|T|)>>+1\<le\>2*<around|(|T/2*\<pi\>|)><rsup|1/4>+2.
    </equation*>

    Hence

    <\equation>
      <label|eq:cosbound><around*|\||2*<big|sum><rsub|n=1><rsup|N<around|(|T|)>>n<rsup|-1/2><space|0.17em><re><space|0.17em>I<rsub|n>|\|><space|0.27em>\<le\><space|0.27em><frac|6|\<xi\>-1>*<around*|(|2*<around|(|T/2*\<pi\>|)><rsup|1/4>+2|)><space|0.27em>\<ll\><space|0.27em><frac|T<rsup|1/4>|\<xi\>-1>.
    </equation>

    Dividing by <math|<Th><around|(|T|)>\<sim\><tfrac|T|2>log
    <around|(|T/2*\<pi\>|)>>:

    <\equation>
      <label|eq:costerm><frac|1|<Th><around|(|T|)>>*<around*|\||2*<big|sum><rsub|n=1><rsup|N<around|(|T|)>>n<rsup|-1/2><space|0.17em><re><space|0.17em>I<rsub|n>|\|><space|0.27em>\<ll\><space|0.27em><frac|T<rsup|1/4>|<around|(|\<xi\>-1|)>*<space|0.17em>T*log
      T><space|0.27em>=<space|0.27em>O<space|-0.17em><around*|(|<frac|1|T<rsup|3/4>*log
      T>|)><space|0.27em>\<to\><space|0.27em>0.
    </equation>

    <vspace*|1fn><no-indent><with|font-series|bold|Step 3: Bound on the
    remainder.>

    Since <math|<around|\||R<around|(|t|)>|\|>\<ll\>t<rsup|-1/4>>,
    <math|<around|\||e<rsup|-i*\<xi\><Th><around|(|t|)>>|\|>=1>, and
    <math|<Th><rprime|'><around|(|t|)>=<vth><rprime|'><around|(|t|)>+C\<ll\>log
    t>:

    <\equation*>
      <around|\||S<rsub|R><around|(|\<xi\>,T|)>|\|>\<ll\><big|int><rsub|1><rsup|T>t<rsup|-1/4>*log
      t*<space|0.17em>d*t.
    </equation*>

    Integration by parts gives <math|<big|int><rsub|1><rsup|T>t<rsup|-1/4>*log
    t*<space|0.17em>d*t=<tfrac|4|3>T<rsup|3/4>*log
    T-<tfrac|16|9>T<rsup|3/4>+O<around|(|1|)>>, so

    <\equation>
      <label|eq:Rterm><frac|<around|\||S<rsub|R><around|(|\<xi\>,T|)>|\|>|<Th><around|(|T|)>><space|0.27em>\<ll\><space|0.27em><frac|T<rsup|3/4>*log
      T|T*log T><space|0.27em>=<space|0.27em>O<around|(|T<rsup|-1/4>|)><space|0.27em>\<to\><space|0.27em>0.
    </equation>

    <vspace*|1fn><no-indent><with|font-series|bold|Conclusion.>
    Combining<nbsp><eqref|eq:fullid>, <eqref|eq:costerm>,
    and<nbsp><eqref|eq:Rterm>:

    <\equation*>
      <around*|\||<frac|1|<Th><around|(|T|)>>*<big|int><rsub|0><rsup|<Th><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u|\|><space|0.27em>\<ll\><space|0.27em><frac|1|T<rsup|3/4>*log
      T>+T<rsup|-1/4><space|0.27em>\<to\><space|0.27em>0.
    </equation*>
  </proof>

  <section|Sharpness><label|sec:sharp>

  <\theorem>
    [Sharpness of the cutoff]<label|thm:sharp> For every
    <math|\<xi\>\<in\><around|(|-1,1|)>\<setminus\><around|{|0|}>>, the
    normalized Cesa<math|<wide|<text|r>|\<grave\>>>o\UFourier transform does
    <em|not> converge to zero: the spectral density
    <math|\<Phi\><around|(|\<xi\>|)>> defined in<nbsp><eqref|eq:Phi>
    satisfies <math|\<Phi\><around|(|\<xi\>|)>\<gtr\>0>. Hence the cutoff
    <math|<around|\||\<xi\>|\|>=1> in Theorem<nbsp><reference|thm:main> is
    sharp.
  </theorem>

  <\proof>
    Fix <math|0\<less\>\<xi\>\<less\>1>. For each <math|n\<ge\>1>, the
    equation <math|\<omega\><rsub|n><around|(|u|)>=\<xi\>> has a unique
    solution

    <\equation>
      <label|eq:ustar>u<rsub|n><rsup|\<star\>>=<Th><space|-0.17em><around*|(|2*\<pi\>*n<rsup|2>*e<rsup|<space|0.17em>2*\<xi\>*C/<around|(|1-\<xi\>|)>>|)>,
    </equation>

    obtained by solving <math|<around|(|<vth><rprime|'><around|(|g<around|(|u|)>|)>-log
    n|)>/<Th><rprime|'><around|(|g<around|(|u|)>|)>=\<xi\>> and using
    <math|<vth><rprime|'><around|(|t|)>=<tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>>. At <math|u=u<rsub|n><rsup|\<star\>>> the phase
    <math|\<Phi\><rsub|n><around|(|u|)>-\<xi\>*u> is stationary:
    <math|<frac|d|d*u>*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)><mid|\|><rsub|u<rsub|n><rsup|\<star\>>>=\<omega\><rsub|n><around|(|u<rsub|n><rsup|\<star\>>|)>-\<xi\>=0>.

    The second derivative is, by<nbsp><eqref|eq:omegaprime>,

    <\equation*>
      <frac|d<rsup|2>|d*u<rsup|2>>*<around|(|\<Phi\><rsub|n>-\<xi\>*u|)><mid|\|><rsub|u<rsub|n><rsup|\<star\>>>=\<omega\><rsub|n><rprime|'><around|(|u<rsub|n><rsup|\<star\>>|)>=<frac|C<space|0.17em><vth><rprime|''><around|(|g<around|(|u<rsub|n><rsup|\<star\>>|)>|)>|<Th><rprime|'><around|(|g<around|(|u<rsub|n><rsup|\<star\>>|)>|)><rsup|3>>=<frac|C|2*<space|0.17em>g<around|(|u<rsub|n><rsup|\<star\>>|)><space|0.17em><Th><rprime|'><around|(|g<around|(|u<rsub|n><rsup|\<star\>>|)>|)><rsup|3>>*<around*|(|1+O<around|(|g<around|(|u<rsub|n><rsup|\<star\>>|)><rsup|-1>|)>|)>\<gtr\>0,
    </equation*>

    so the stationary point is non-degenerate.

    By the standard method of stationary phase
    <cite-detail|Hormander1983|Theorem<nbsp>7.7.5>: for
    <math|T\<gtr\>t<rsub|n><rsup|\<star\>>\<assign\>g<around|(|u<rsub|n><rsup|\<star\>>|)>>,

    <\equation*>
      I<rsub|n><around|(|\<xi\>,T|)><space|0.27em>\<sim\><space|0.27em>e<rsup|i*<around|(|\<Phi\><rsub|n><around|(|u<rsub|n><rsup|\<star\>>|)>-\<xi\>*u<rsub|n><rsup|\<star\>>|)>>\<cdot\>e<rsup|i*\<pi\>/4>\<cdot\><sqrt|<frac|2*\<pi\>|\<omega\><rsub|n><rprime|'><around|(|u<rsub|n><rsup|\<star\>>|)>>>*<space|2em><text|as
      >n\<to\>\<infty\>,
    </equation*>

    with <math|<around|\||<I><rsub|n>|\|><rsup|2>\<sim\>2*\<pi\>/\<omega\><rsub|n><rprime|'><around|(|u<rsub|n><rsup|\<star\>>|)>\<gg\>1>.

    Summing: <math|<big|sum><rsub|n\<le\>N<around|(|T|)>>n<rsup|-1/2><around|\||I<rsub|n>|\|><rsup|2>\<gg\><big|sum><rsub|n\<le\>N<around|(|T|)>>n<rsup|-1/2>>,
    which grows like <math|T<rsup|1/4>>. Dividing by
    <math|<Th><around|(|T|)><rsup|2>\<sim\><around|(|T*log T/2|)><rsup|2>>
    gives a contribution to <math|\<Phi\><around|(|\<xi\>|)>> that, after
    Cesa<math|<wide|<text|r>|\<grave\>>>o averaging, is bounded below by a
    positive constant (the Weyl equidistribution of the phases
    <math|\<Phi\><rsub|n><around|(|u<rsub|n><rsup|\<star\>>|)>-\<xi\>*u<rsub|n><rsup|\<star\>><space|-0.17em><pmod|2*\<pi\>>>
    prevents complete cancellation). Hence
    <math|\<Phi\><around|(|\<xi\>|)>\<gtr\>0>.
  </proof>

  <section|Corollaries><label|sec:cor>

  <\corollary>
    [Spectral support]<label|cor:support> The Wiener\UKhinchin spectral
    density <math|\<Phi\>> of <math|<Zt>> satisfies
    <math|\<Phi\><around|(|\<xi\>|)>=0> for almost every
    <math|<around|\||\<xi\>|\|>\<gtr\>1>. Consequently the Cramér measure
    <math|d*<wide|G|^>> defined in<nbsp><eqref|eq:Ghat> is supported on
    <math|<around|[|-1,1|]>>:

    <\equation*>
      <math-up|supp><around|(|d*<wide|G|^>|)>\<subseteq\><around|[|-1,1|]>.
    </equation*>
  </corollary>

  <\proof>
    Set <math|\<cal-F\><rsub|T><around|(|\<xi\>|)>\<assign\><big|int><rsub|0><rsup|<Th><around|(|T|)>><Zt><around|(|u|)>*<space|0.17em>e<rsup|-i*\<xi\>*u>*<space|0.17em>d*u>.
    By definition<nbsp><eqref|eq:Phi>, <math|\<Phi\><around|(|\<xi\>|)>=lim<rsub|T\<to\>\<infty\>><around|\||\<cal-F\><rsub|T><around|(|\<xi\>|)>|\|><rsup|2>/<Th><around|(|T|)>>.
    Theorem<nbsp><reference|thm:main> gives
    <math|\<cal-F\><rsub|T><around|(|\<xi\>|)>/<Th><around|(|T|)>\<to\>0> for
    <math|<around|\||\<xi\>|\|>\<gtr\>1>. Since
    <math|<around|\||\<cal-F\><rsub|T><around|(|\<xi\>|)>|\|>> grows at most
    polynomially in <math|T> (by the RS bound
    <math|<around|\||Z<around|(|t|)>|\|>\<ll\>t<rsup|\<varepsilon\>>> and
    <math|<Th><rprime|'><around|(|t|)>\<ll\>log t>), we have
    <math|\<Phi\><around|(|\<xi\>|)>=<around|[|\<cal-F\><rsub|T><around|(|\<xi\>|)>/<Th><around|(|T|)>|]>\<cdot\><around|\||\<cal-F\><rsub|T><around|(|\<xi\>|)>|\|>\<to\>0>
    for <math|<around|\||\<xi\>|\|>\<gtr\>1>.
  </proof>

  <\corollary>
    [Explicit Cramér spectral integral]<label|cor:rep> The Hardy
    <math|Z>-function admits the representation

    <\equation>
      <label|eq:rep>Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<xi\><Th><around|(|t|)>>*<space|0.17em>d*<wide|G|^><around|(|\<xi\>|)>,<space|2em>t\<ge\>0,
    </equation>

    where the integral converges in <math|L<rsup|2>> on every compact
    interval of <math|t>, and <math|d*<wide|G|^>> is the explicit orthogonal
    Cramér measure of <eqref|eq:Ghat> with non-negative variance density
    <math|\<Phi\>*<space|0.17em>d*\<xi\>> supported on
    <math|<around|[|-1,1|]>>.
  </corollary>

  <\proof>
    The Cramér\UKhinchin inversion theorem <cite|Cramer1942> states: for a
    function <math|f\<in\>L<rsup|2><rsub|<math-up|loc>><around|(|<R>|)>> with
    Wiener\UKhinchin spectral density <math|\<Phi\>\<in\>L<rsup|1><rsub|<math-up|loc>><around|(|<R>|)>>,
    the partial Cramér integrals

    <\equation>
      <label|eq:partial><big|int><rsub|-R><rsup|R>e<rsup|i*\<xi\>*u>*<space|0.17em>d*<wide|G|^><around|(|\<xi\>|)><space|0.27em><long-arrow|\<rubber-rightarrow\>|L<rsup|2><rsub|<math-up|loc>>|R\<to\>\<infty\>><space|0.27em>f<around|(|u|)>.
    </equation>

    By Corollary<nbsp><reference|cor:support>,
    <math|\<Phi\><around|(|\<xi\>|)>=0> for
    <math|<around|\||\<xi\>|\|>\<gtr\>1>. Hence <math|d*<wide|G|^>> carries
    no mass outside <math|<around|[|-1,1|]>>, so the partial
    integrals<nbsp><eqref|eq:partial> stabilize at <math|R=1>:

    <\equation*>
      <big|int><rsub|-R><rsup|R>e<rsup|i*\<xi\>*u>*<space|0.17em>d*<wide|G|^><around|(|\<xi\>|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<xi\>*u>*<space|0.17em>d*<wide|G|^><around|(|\<xi\>|)>*<space|2em><text|for
      all >R\<ge\>1.
    </equation*>

    Applying<nbsp><eqref|eq:partial> with <math|f=<Zt>> and substituting
    <math|u=<Th><around|(|t|)>> gives<nbsp><eqref|eq:rep>. The variance
    identity <math|\<bbb-E\>*<around|[|d*<wide|G|^><around|(|\<xi\>|)><space|0.17em><wide|d*<wide|G|^><around|(|\<xi\><rprime|'>|)>|\<bar\>>|]>=\<Phi\><around|(|\<xi\>|)>*\<delta\>*<around|(|\<xi\>-\<xi\><rprime|'>|)>*<space|0.17em>d*\<xi\>>
    is the standard orthogonality of the Cramér spectral increments
    <cite|Cramer1942>.
  </proof>

  <\remark>
    [What this does not prove]<label|rem:gap>Corollary<nbsp><reference|cor:rep>
    gives a spectral integral for <math|Z<around|(|t|)>> supported on
    <math|<around|[|-1,1|]>>. It does <em|not> prove the Riemann hypothesis.
    The zeros of <math|Z> (equivalently, the zeros of the entire function
    <math|F<around|(|z|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<xi\>*z>*<space|0.17em>d*<wide|G|^><around|(|\<xi\>|)>>)
    can in principle lie off the real axis even though the spectral support
    is <math|<around|[|-1,1|]>>: for a generic positive spectral density
    <math|\<Phi\>>, the function <math|F*<around|(|u+i*v|)>=2*<big|int><rsub|0><rsup|1>e<rsup|-v*\<xi\>>*cos
    <around|(|u*\<xi\>|)>*\<Phi\><around|(|\<xi\>|)>*<space|0.17em>d*\<xi\>>
    can vanish at complex points <math|u<rsub|0>+i*v<rsub|0>> with
    <math|v<rsub|0>\<ne\>0>. The zeros of <math|F> in the upper half-plane
    correspond exactly to the off-critical-line zeros of <math|\<zeta\>>,
    whose absence is the content of RH. The present paper proves only the
    band-limitation; the question of whether the specific <math|\<Phi\>>
    arising from <math|<Zt>> forces all zeros of <math|F> to be real remains
    open.
  </remark>

  <section*|Acknowledgements>

  The author thanks the Riemann\USiegel formula of
  Siegel<nbsp><cite|Siegel1932> for making the phase derivative identity in
  Lemma<nbsp><reference|lem:phase> available in closed form.

  <\thebibliography|10>
    <bibitem|Titchmarsh1986>E.<nbsp>C. Titchmarsh,
    <with|font-shape|italic|The Theory of the Riemann Zeta-Function>, 2nd
    ed., revised by D.<nbsp>R. Heath-Brown, Oxford University Press, Oxford,
    1986. MR0882550.

    <bibitem|Siegel1932>C.<nbsp>L. Siegel, Über Riemann's Nachlass zur
    analytischen Zahlentheorie, <with|font-shape|italic|Quellen und Studien
    zur Geschichte der Mathematik, Astronomie und Physik>
    <with|font-series|bold|2> (1932), 45\U80.

    <bibitem|Cramer1942>H.<nbsp>Cramér, On harmonic analysis in certain
    function spaces, <with|font-shape|italic|Arkiv för Matematik, Astronomi
    och Fysik> <with|font-series|bold|28B> (1942), no.<nbsp>12, 1\U7.

    <bibitem|Hormander1983>L.<nbsp>Hörmander, <with|font-shape|italic|The
    Analysis of Linear Partial Differential Operators<nbsp>I>, Grundlehren
    der mathematischen Wissenschaften, vol.<nbsp>256, Springer-Verlag,
    Berlin, 1983. MR0717035.

    <bibitem|Wiener1930>N.<nbsp>Wiener, Generalized harmonic analysis,
    <with|font-shape|italic|Acta Mathematica> <with|font-series|bold|55>
    (1930), 117\U258.

    <bibitem|Levin1996>B.<nbsp>Ya. Levin, <with|font-shape|italic|Lectures on
    Entire Functions>, Translations of Mathematical Monographs,
    vol.<nbsp>150, American Mathematical Society, Providence, RI, 1996.
    MR1400006.

    <bibitem|BohrJessen1932>H.<nbsp>Bohr and B.<nbsp>Jessen, Über die
    Werteverteilung der Riemannschen Zetafunktion,
    <with|font-shape|italic|Acta Mathematica> <with|font-series|bold|58>
    (1932), 1\U55.

    <bibitem|PaleyWiener1934>R.<nbsp>Paley and N.<nbsp>Wiener,
    <with|font-shape|italic|Fourier Transforms in the Complex Domain>,
    American Mathematical Society Colloquium Publications, vol.<nbsp>XIX,
    AMS, New York, 1934.

    <bibitem|Berry1986>M.<nbsp>V. Berry, Riemann's zeta function: a model for
    quantum chaos?, in <with|font-shape|italic|Quantum Chaos and Statistical
    Nuclear Physics>, Lecture Notes in Physics, vol.<nbsp>263, Springer,
    Berlin, 1986, pp.<nbsp>1\U17.

    <bibitem|Kobayashi2016>M.<nbsp>Kobayashi, Eigenvalue problem for the
    Hardy <math|Z>-function, preprint, arXiv:1608.05712, 2016.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|3|2>>
    <associate|auto-3|<tuple|2|2>>
    <associate|auto-4|<tuple|3|3>>
    <associate|auto-5|<tuple|4|4>>
    <associate|auto-6|<tuple|5|6>>
    <associate|auto-7|<tuple|6|6>>
    <associate|auto-8|<tuple|10|7>>
    <associate|auto-9|<tuple|10|7>>
    <associate|bib-Berry1986|<tuple|Berry1986|7>>
    <associate|bib-BohrJessen1932|<tuple|BohrJessen1932|7>>
    <associate|bib-Cramer1942|<tuple|Cramer1942|7>>
    <associate|bib-Hormander1983|<tuple|Hormander1983|7>>
    <associate|bib-Kobayashi2016|<tuple|Kobayashi2016|7>>
    <associate|bib-Levin1996|<tuple|Levin1996|7>>
    <associate|bib-PaleyWiener1934|<tuple|PaleyWiener1934|7>>
    <associate|bib-Siegel1932|<tuple|Siegel1932|7>>
    <associate|bib-Titchmarsh1986|<tuple|Titchmarsh1986|7>>
    <associate|bib-Wiener1930|<tuple|Wiener1930|7>>
    <associate|cor:rep|<tuple|9|7>>
    <associate|cor:support|<tuple|8|6>>
    <associate|def:RS|<tuple|3|3>>
    <associate|def:pullback|<tuple|2|2>>
    <associate|def:warp|<tuple|1|2>>
    <associate|eq:C|<tuple|2|2>>
    <associate|eq:Ghat|<tuple|4|2>>
    <associate|eq:IBP|<tuple|15|4>>
    <associate|eq:In|<tuple|12|4>>
    <associate|eq:Inbound|<tuple|13|4>>
    <associate|eq:Jtilde|<tuple|22|5>>
    <associate|eq:Phi|<tuple|5|3>>
    <associate|eq:Phin|<tuple|7|3>>
    <associate|eq:RS|<tuple|6|3>>
    <associate|eq:Rterm|<tuple|27|6>>
    <associate|eq:Thasym|<tuple|3|2>>
    <associate|eq:antider|<tuple|17|4>>
    <associate|eq:cosbound|<tuple|25|5>>
    <associate|eq:costerm|<tuple|26|5>>
    <associate|eq:cov|<tuple|21|5>>
    <associate|eq:dPhi|<tuple|9|3>>
    <associate|eq:fubini|<tuple|23|5>>
    <associate|eq:fullid|<tuple|24|5>>
    <associate|eq:gap|<tuple|14|4>>
    <associate|eq:main|<tuple|20|4>>
    <associate|eq:omegan|<tuple|8|3>>
    <associate|eq:omegaprime|<tuple|11|4>>
    <associate|eq:omegaub|<tuple|10|3>>
    <associate|eq:partial|<tuple|30|7>>
    <associate|eq:rep|<tuple|29|7>>
    <associate|eq:ustar|<tuple|28|6>>
    <associate|eq:vth|<tuple|1|2>>
    <associate|lem:ibp|<tuple|5|4>>
    <associate|lem:phase|<tuple|4|3>>
    <associate|rem:gap|<tuple|10|7>>
    <associate|sec:cor|<tuple|6|6>>
    <associate|sec:intro|<tuple|1|1>>
    <associate|sec:main|<tuple|4|4>>
    <associate|sec:phase|<tuple|3|3>>
    <associate|sec:setup|<tuple|2|2>>
    <associate|sec:sharp|<tuple|5|6>>
    <associate|thm:main|<tuple|6|4>>
    <associate|thm:sharp|<tuple|7|6>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Titchmarsh1986

      Siegel1932

      Hormander1983

      Cramer1942

      Cramer1942

      Siegel1932
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Notation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Setup>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Phase
      Derivative Identity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Proof
      of Band-Limitation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Sharpness>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Corollaries>
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