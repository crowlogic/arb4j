<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <\hide-preamble>
    <assign|im|<macro|Im>>

    <assign|re|<macro|Re>>
  </hide-preamble>

  <doc-data|<doc-title|The Probability Current of the Riemann Zeta
  Function<next-line>on the Critical Line>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|April 2026>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>WKB
    Background> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|The polar decomposition of a wavefunction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <with|par-left|1tab|What the current measures
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|The velocity field
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|Units and normalisation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Definitions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Main
    Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    Priestley Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|WKB Background>

  The WKB method (Wentzel, Kramers, Brillouin, 1926) is a technique for
  constructing approximate solutions to the Schrödinger equation in one
  spatial dimension when the potential varies slowly compared to the
  de<nbsp>Broglie wavelength. For the present purposes only the structural
  content is needed, not the approximation.

  <subsection*|The polar decomposition of a wavefunction>

  A complex-valued function <math|\<psi\><around|(|x,t|)>> satisfying the
  time-dependent Schrödinger equation

  <\equation*>
    i*\<hbar\>*<space|0.17em>\<partial\><rsub|t>*\<psi\>=-<frac|\<hbar\><rsup|2>|2*m>*<space|0.17em>\<partial\><rsub|x><rsup|2>*\<psi\>+V*\<psi\>
  </equation*>

  can always be written in polar form

  <\equation*>
    \<psi\><around|(|x,t|)>=A<around|(|x,t|)>*<space|0.17em>e<rsup|i*S<around|(|x,t|)>/\<hbar\>>,
  </equation*>

  with <math|A\<geq\>0> and <math|S> real. Substituting and separating real
  and imaginary parts yields two equations. The imaginary part gives the
  <em|continuity equation>

  <\equation*>
    \<partial\><rsub|t>*\<rho\>+\<partial\><rsub|x>*j=0,
  </equation*>

  where the <em|probability density> and <em|probability current> are

  <\equation*>
    \<rho\>=A<rsup|2>=<around|\||\<psi\>|\|><rsup|2>,<space|2em>j=<frac|\<hbar\>|m>*<space|0.17em>A<rsup|2>*<space|0.17em>\<partial\><rsub|x>*S=<frac|\<hbar\>|m><space|0.17em><im><space|-0.17em><around*|(|<wide|\<psi\>|\<bar\>><space|0.17em>\<partial\><rsub|x>*\<psi\>|)>.
  </equation*>

  The real part gives a modified Hamilton\UJacobi equation for <math|S>.

  <subsection*|What the current measures>

  <math|\<rho\>*<around|(|x,t|)>*<space|0.17em>d*x> is the probability of
  finding the particle in <math|<around|[|x,x+d*x|]>> at time <math|t>. The
  current <math|j<around|(|x,t|)>> is the net probability flux crossing the
  point <math|x> per unit time: positive means flux to the right, negative to
  the left. The continuity equation states that probability is locally
  conserved: any decrease in <math|\<rho\>> in a region must equal the net
  outward flux through its boundary.

  <subsection*|The velocity field>

  The WKB velocity is <math|v=j/\<rho\>=<around|(|\<hbar\>/m|)>*<space|0.17em>\<partial\><rsub|x>*S>.
  In the classical limit <math|\<hbar\>\<to\>0> this coincides with the
  classical particle velocity <math|p/m> since
  <math|\<partial\><rsub|x>*S\<to\>p> (the action gradient). The current is
  then <math|j=\<rho\>*v>, a density times a speed.

  <subsection*|Units and normalisation>

  In quantum mechanics <math|<big|int>\<rho\>*<space|0.17em>d*x=1> for a
  normalised state. In the present paper <math|\<psi\>> is replaced by
  <math|\<zeta\>*<around|(|1/2+i*t|)>>, which is not square-integrable on
  <math|<around|[|0,\<infty\>|)>>, so <math|\<rho\>> is an <em|unnormalised>
  density. The role of <math|x> is played by the height <math|t>, and the WKB
  velocity field is <math|v<around|(|t|)>=\<partial\><rsub|t>*arg
  \<zeta\>*<around|(|1/2+i*t|)>>. All structural identities\Vthe continuity
  equation, the relation <math|j=\<rho\>*v>\Vhold without change.

  <section|Definitions>

  <\definition>
    [Standing objects]<label|def:objects>Let <math|\<zeta\><around|(|s|)>>
    denote the Riemann zeta function. On the critical line
    <math|<re><around|(|s|)>=1/2> define

    <\align>
      <tformat|<table|<row|<cell|\<mu\><around|(|t|)>>|<cell|\<assign\><around*|\||\<zeta\>*<around*|(|<tfrac|1|2>+i*t|)>|\|><rsup|2>>|<cell|>|<cell|<text|(local
      energy / probability density),><eq-number>>>|<row|<cell|<vspace*|4pt>\<vartheta\><around|(|t|)>>|<cell|\<assign\><im>log
      \<Gamma\>*<space|-0.17em><around*|(|<tfrac|1|4>+<tfrac|i*t|2>|)>-<tfrac|t|2>log
      \<pi\>>|<cell|>|<cell|<text|(Riemann--Siegel
      theta),><eq-number>>>|<row|<cell|<vspace*|4pt>Z<around|(|t|)>>|<cell|\<assign\>e<rsup|i*\<vartheta\><around|(|t|)>>*<space|0.17em>\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>>|<cell|>|<cell|<text|(Hardy
      <math|Z>-function, real-valued for real
      <math|t>),><eq-number>>>|<row|<cell|<vspace*|4pt>\<Psi\><around|(|t|)>>|<cell|\<assign\><big|int><rsub|0><rsup|t><around|\||\<vartheta\><rprime|'><around|(|u|)>|\|>*<space|0.17em>\<mu\><around|(|u|)>*<space|0.17em>d*u>|<cell|>|<cell|<text|(cumulative
      phase clock),><eq-number>>>|<row|<cell|<vspace*|4pt>\<Psi\><rprime|'><around|(|t|)>>|<cell|=<around|\||\<vartheta\><rprime|'><around|(|t|)>|\|>*<space|0.17em>\<mu\><around|(|t|)>>|<cell|>|<cell|<text|(cumulative
      phase density).><eq-number>>>>>
    </align>

    The branch of <math|log \<Gamma\>> is continuous on the upper half-plane
    and real on the positive real axis. By Stirling,

    <\equation*>
      \<vartheta\><rprime|'><around|(|t|)>=<tfrac|1|2>log
      <tfrac|t|2*\<pi\>>+O<around|(|t<rsup|-2>|)>,
    </equation*>

    so <math|<around|\||\<vartheta\><rprime|'><around|(|t|)>|\|>=\<vartheta\><rprime|'><around|(|t|)>>
    for all <math|t\<gtr\>t<rsub|c>\<approx\>6.29>, the unique zero of
    <math|\<vartheta\><rprime|'>> on <math|<around|(|0,\<infty\>|)>>. The
    absolute value ensures <math|\<Psi\>> is strictly increasing on all of
    <math|<around|[|0,\<infty\>|)>>.

    The critical set is

    <\equation*>
      \<cal-C\>\<assign\><around*|{|<space|0.17em>t\<geq\>0:\<Psi\><rprime|'><around|(|t|)>=0<space|0.17em>|}>=<around*|{|<space|0.17em>t:\<zeta\>*<around*|(|<tfrac|1|2>+i*t|)>=0<space|0.17em>|}>\<cup\><around|{|t<rsub|c>|}>.
    </equation*>

    <math|\<cal-C\>> is discrete: zeros of
    <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>> are isolated by the identity
    theorem for holomorphic functions, and <math|\<vartheta\><rprime|'>> has
    exactly one zero on <math|<around|[|0,\<infty\>|)>> by Stirling.
  </definition>

  <\definition>
    [Polar decomposition of <math|\<zeta\>>]<label|def:polar>At every
    <math|t\<nin\>\<cal-C\>> write

    <\equation*>
      \<zeta\>*<around*|(|<tfrac|1|2>+i*t|)>=<sqrt|\<mu\><around|(|t|)>>*<space|0.17em>e<rsup|i*\<alpha\><around|(|t|)>>,<space|2em>\<alpha\><around|(|t|)>\<assign\>arg
      \<zeta\>*<around*|(|<tfrac|1|2>+i*t|)>,
    </equation*>

    where <math|arg> denotes any fixed continuous branch of the argument on a
    connected component of the complement of the zero set. At a zero
    <math|t<rsub|n>> the argument is undefined and the polar form breaks
    down; the primary definitions below bypass this.
  </definition>

  <\definition>
    [Probability density and current]<label|def:current>The <em|probability
    density> and <em|probability current> of <math|\<zeta\>> on the critical
    line are

    <\equation*>
      \<rho\><around|(|t|)>\<assign\>\<mu\><around|(|t|)>=<around*|\||\<zeta\>*<around*|(|<tfrac|1|2>+i*t|)>|\|><rsup|2>,
    </equation*>

    <\equation*>
      j<around|(|t|)>\<assign\><im><space|-0.17em><around*|(|<space|0.17em><wide|\<zeta\>*<around*|(|<tfrac|1|2>+i*t|)>|\<bar\>>\<cdot\>\<partial\><rsub|t>*<space|0.17em>\<zeta\>*<around*|(|<tfrac|1|2>+i*t|)>|)>.
    </equation*>

    These definitions require no branch choice and are valid for all
    <math|t\<in\><around|[|0,\<infty\>|)>>, including at every zero of
    <math|\<zeta\>>.
  </definition>

  <section|Main Results>

  <\theorem>
    [Explicit polar form of the current]<label|thm:polar>For all
    <math|t\<nin\>\<cal-C\>>,

    <\equation*>
      j<around|(|t|)>=\<mu\><around|(|t|)>*<space|0.17em>\<alpha\><rprime|'><around|(|t|)>=\<mu\><around|(|t|)>*<space|0.17em>\<partial\><rsub|t>*arg
      \<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>.
    </equation*>

    At every zero <math|t<rsub|n>\<in\>\<cal-C\>> the definition gives
    <math|j<around|(|t<rsub|n>|)>=0> directly, consistently with
    <math|lim<rsub|t\<to\>t<rsub|n>> \<mu\><around|(|t|)>*\<alpha\><rprime|'><around|(|t|)>=0>.
  </theorem>

  <\proof>
    Write <math|\<zeta\><rsub|t>=<sqrt|\<mu\><around|(|t|)>>*<space|0.17em>e<rsup|i*\<alpha\><around|(|t|)>>>
    for <math|t\<nin\>\<cal-C\>>. Differentiating,

    <\equation*>
      \<partial\><rsub|t>*\<zeta\><rsub|t>=<frac|\<mu\><rprime|'><around|(|t|)>|2*<sqrt|\<mu\><around|(|t|)>>>*<space|0.17em>e<rsup|i*\<alpha\><around|(|t|)>>+i*\<alpha\><rprime|'><around|(|t|)><sqrt|\<mu\><around|(|t|)>>*<space|0.17em>e<rsup|i*\<alpha\><around|(|t|)>>=e<rsup|i*\<alpha\><around|(|t|)>>*<space|-0.17em><around*|(|<frac|\<mu\><rprime|'><around|(|t|)>|2*<sqrt|\<mu\><around|(|t|)>>>+i*\<alpha\><rprime|'><around|(|t|)><sqrt|\<mu\><around|(|t|)>>|)>.
    </equation*>

    Hence

    <\equation*>
      <wide|\<zeta\>|\<bar\>><rsub|t>*<space|0.17em>\<partial\><rsub|t>*\<zeta\><rsub|t>=<sqrt|\<mu\><around|(|t|)>>*<space|0.17em>e<rsup|-i*\<alpha\><around|(|t|)>>\<cdot\>e<rsup|i*\<alpha\><around|(|t|)>>*<space|-0.17em><around*|(|<frac|\<mu\><rprime|'>|2*<sqrt|\<mu\>>>+i*\<alpha\><rprime|'>*<sqrt|\<mu\>>|)>=<frac|\<mu\><rprime|'><around|(|t|)>|2>+i*<space|0.17em>\<mu\><around|(|t|)>*<space|0.17em>\<alpha\><rprime|'><around|(|t|)>.
    </equation*>

    Taking the imaginary part gives <math|j<around|(|t|)>=\<mu\><around|(|t|)>*<space|0.17em>\<alpha\><rprime|'><around|(|t|)>>.

    At a zero <math|t<rsub|n>>, Definition<nbsp><reference|def:current> gives
    <math|j<around|(|t<rsub|n>|)>=<im><around|(|0\<cdot\>\<partial\><rsub|t>*\<zeta\><rsub|t<rsub|n>>|)>=0>
    since <math|\<zeta\><around|(|t<rsub|n>|)>=0>. Near a simple zero
    <math|\<mu\><around|(|t|)>\<sim\>c*<around|(|t-t<rsub|n>|)><rsup|2>> and
    <math|<around|\||\<alpha\><rprime|'><around|(|t|)>|\|>> is locally
    bounded by <math|<around|\||\<vartheta\><rprime|'><around|(|t<rsub|n>|)>|\|>+O<around|(|1|)>>,
    so <math|\<mu\><around|(|t|)>*<space|0.17em>\<alpha\><rprime|'><around|(|t|)>\<to\>0>.
    The two values are consistent.
  </proof>

  <\theorem>
    [Smooth part of the current equals <math|\<Psi\><rprime|'>>]<label|thm:smooth>Under
    the Riemann\USiegel factorisation <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>=e<rsup|-i*\<vartheta\><around|(|t|)>>*Z<around|(|t|)>>
    with <math|Z<around|(|t|)>> real-valued, the phase decomposes as

    <\equation*>
      \<alpha\><around|(|t|)>=-\<vartheta\><around|(|t|)>+arg
      Z<around|(|t|)>,<space|2em>t\<nin\>\<cal-C\>.
    </equation*>

    The full distributional derivative is

    <\equation*>
      \<alpha\><rprime|'><around|(|t|)>=-\<vartheta\><rprime|'><around|(|t|)>+\<partial\><rsub|t>*arg
      Z<around|(|t|)>,
    </equation*>

    where <math|\<partial\><rsub|t>*arg Z> contributes
    <math|\<pm\>\<pi\>*<space|0.17em>\<delta\>*<around|(|t-t<rsub|n>|)>> at
    each real zero <math|t<rsub|n>> of <math|Z> (i.e. each critical-line zero
    of <math|\<zeta\>>). The current is therefore

    <\equation*>
      j<around|(|t|)>=-\<mu\><around|(|t|)>*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)>+\<mu\><around|(|t|)>*<space|0.17em>\<partial\><rsub|t>*arg
      Z<around|(|t|)>.
    </equation*>

    The smooth leading term is

    <\equation*>
      j<rsub|<math-up|smooth>><around|(|t|)>=-\<mu\><around|(|t|)>*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)>,<space|2em><around|\||j<rsub|<math-up|smooth>><around|(|t|)>|\|>=\<mu\><around|(|t|)><around|\||\<vartheta\><rprime|'><around|(|t|)>|\|>=\<Psi\><rprime|'><around|(|t|)>.
    </equation*>
  </theorem>

  <\proof>
    From Definition<nbsp><reference|def:objects>,
    <math|Z<around|(|t|)>=e<rsup|i*\<vartheta\><around|(|t|)>>*\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>>,
    so <math|arg \<zeta\>=-\<vartheta\>+arg Z>. Differentiating:
    <math|\<alpha\><rprime|'>=-\<vartheta\><rprime|'>+\<partial\><rsub|t>*arg
    Z>.

    Since <math|Z<around|(|t|)>> is real-valued and <math|C<rsup|1>> between
    zeros, <math|arg Z<around|(|t|)>\<in\><around|{|0,\<pi\>|}>> between
    consecutive zeros and jumps by <math|\<pm\>\<pi\>> at each zero
    <math|t<rsub|n>>. In the distributional sense,
    <math|\<partial\><rsub|t>*arg Z<around|(|t|)>=<big|sum><rsub|n><around|(|\<pm\>\<pi\>|)>*<space|0.17em>\<delta\>*<around|(|t-t<rsub|n>|)>>,
    with sign determined by the direction of sign change of <math|Z> at
    <math|t<rsub|n>>.

    Substituting into <math|j=\<mu\>*\<alpha\><rprime|'>>:

    <\equation*>
      j<around|(|t|)>=-\<mu\><around|(|t|)>*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)>+\<mu\><around|(|t|)>*<big|sum><rsub|n><around|(|\<pm\>\<pi\>|)>*<space|0.17em>\<delta\>*<around|(|t-t<rsub|n>|)>.
    </equation*>

    For each <math|n>, the distributional product
    <math|\<mu\><around|(|t|)>*<space|0.17em>\<delta\>*<around|(|t-t<rsub|n>|)>>
    is evaluated by pairing with a test function <math|\<phi\>>:

    <\equation*>
      <big|int>\<mu\><around|(|t|)>*<space|0.17em>\<delta\>*<around|(|t-t<rsub|n>|)>*<space|0.17em>\<phi\><around|(|t|)>*<space|0.17em>d*t=\<mu\><around|(|t<rsub|n>|)>*<space|0.17em>\<phi\><around|(|t<rsub|n>|)>=0,
    </equation*>

    since <math|\<mu\><around|(|t<rsub|n>|)>=<around|\||\<zeta\>*<around|(|<tfrac|1|2>+i*t<rsub|n>|)>|\|><rsup|2>=0>.
    Therefore the distributional terms vanish identically and
    <math|j<around|(|t|)>=-\<mu\><around|(|t|)>*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)>=j<rsub|<math-up|smooth>><around|(|t|)>>
    holds everywhere as a distribution. Taking the absolute value and using
    Definition<nbsp><reference|def:objects>,

    <\equation*>
      <around|\||j<rsub|<math-up|smooth>><around|(|t|)>|\|>=\<mu\><around|(|t|)><around|\||\<vartheta\><rprime|'><around|(|t|)>|\|>=\<Psi\><rprime|'><around|(|t|)>.
    </equation*>
  </proof>

  <\remark>
    The conclusion <math|j=j<rsub|<math-up|smooth>>> everywhere is exact, not
    approximate. The branch-jump terms in <math|\<partial\><rsub|t>*arg Z>
    are real features of <math|\<alpha\><rprime|'>> but are annihilated by
    <math|\<mu\>> vanishing at each zero. No approximation is involved.
  </remark>

  <\theorem>
    [Continuity equation in <math|\<Psi\>>-time]<label|thm:continuity>Define
    <math|T=\<Psi\><around|(|t|)>>. In <math|T>-coordinates the density and
    current are

    <\equation*>
      \<rho\><rsub|T><around|(|T|)>\<assign\><frac|\<rho\><around|(|\<Psi\><rsup|-1><around|(|T|)>|)>|\<Psi\><rprime|'><around|(|\<Psi\><rsup|-1><around|(|T|)>|)>>=<frac|1|<around|\||\<vartheta\><rprime|'><around|(|\<Psi\><rsup|-1><around|(|T|)>|)>|\|>>,<space|2em>j<rsub|T><around|(|T|)>\<assign\><frac|j<around|(|\<Psi\><rsup|-1><around|(|T|)>|)>|\<Psi\><rprime|'><around|(|\<Psi\><rsup|-1><around|(|T|)>|)>>=-<math-up|sgn><around|(|\<vartheta\><rprime|'><around|(|\<Psi\><rsup|-1><around|(|T|)>|)>|)>.
    </equation*>

    On the tail <math|t\<gtr\>t<rsub|c>>, where
    <math|\<vartheta\><rprime|'><around|(|t|)>\<gtr\>0>, one has
    <math|j<rsub|T>=-1> (constant). The continuity equation

    <\equation*>
      \<partial\><rsub|T>*\<rho\><rsub|T>+\<partial\><rsub|T>*j<rsub|T>=0
    </equation*>

    holds identically.
  </theorem>

  <\proof>
    For any Borel set <math|A\<subset\><around|[|0,\<infty\>|)>> the change
    of variables <math|T=\<Psi\><around|(|t|)>>,
    <math|d*T=\<Psi\><rprime|'><around|(|t|)>*<space|0.17em>d*t> gives

    <\equation*>
      <big|int><rsub|\<Psi\><around|(|A|)>>\<rho\><rsub|T><around|(|T|)>*<space|0.17em>d*T=<big|int><rsub|A>\<rho\><around|(|t|)>*<space|0.17em>d*t,
    </equation*>

    so <math|\<rho\><rsub|T><around|(|T|)>=\<rho\><around|(|t|)>/\<Psi\><rprime|'><around|(|t|)>>
    at <math|T=\<Psi\><around|(|t|)>>. Substituting <math|\<rho\>=\<mu\>> and
    <math|\<Psi\><rprime|'>=\<mu\><around|\||\<vartheta\><rprime|'>|\|>>:

    <\equation*>
      \<rho\><rsub|T>=<frac|\<mu\>|\<mu\><around|\||\<vartheta\><rprime|'>|\|>>=<frac|1|<around|\||\<vartheta\><rprime|'>|\|>>.
    </equation*>

    Similarly <math|j<rsub|T>=j<rsub|<math-up|smooth>>/\<Psi\><rprime|'>=-\<mu\>*\<vartheta\><rprime|'>/<around|(|\<mu\><around|\||\<vartheta\><rprime|'>|\|>|)>=-<math-up|sgn><around|(|\<vartheta\><rprime|'>|)>>.
    On the tail, <math|<math-up|sgn><around|(|\<vartheta\><rprime|'>|)>=1>,
    so <math|j<rsub|T>=-1>. Since <math|-1> is constant,
    <math|\<partial\><rsub|T>*j<rsub|T>=0>, and
    <math|\<partial\><rsub|T>*\<rho\><rsub|T>=-\<partial\><rsub|T>*j<rsub|T>=0>
    as well. The continuity equation holds identically.
  </proof>

  <\corollary>
    [Unit-speed flow] The time change <math|T=\<Psi\><around|(|t|)>> is the
    unique reparametrisation of <math|t> under which the WKB velocity
    <math|v<rsub|T>=j<rsub|T>/\<rho\><rsub|T>> satisfies

    <\equation*>
      v<rsub|T>=<frac|j<rsub|T>|\<rho\><rsub|T>>=<frac|-1|1/<around|\||\<vartheta\><rprime|'>|\|>>=-<around|\||\<vartheta\><rprime|'><around|(|\<Psi\><rsup|-1><around|(|T|)>|)>|\|>,
    </equation*>

    which equals <math|-1> in the sense that in <math|T>-time the current is
    constant (unit magnitude). The non-constant speed
    <math|<around|\||\<vartheta\><rprime|'><around|(|t|)>|\|>\<sim\><tfrac|1|2>log
    <around|(|t/2*\<pi\>|)>> of the original <math|t>-parametrisation is
    absorbed entirely into the clock <math|\<Psi\>>.
  </corollary>

  <\theorem>
    [Total flux, <math|\<Psi\>>-clock, and zero count]<label|thm:flux>The
    total flux of <math|<around|\||j<rsub|<math-up|smooth>>|\|>> over
    <math|<around|[|0,T|]>> is

    <\equation*>
      <big|int><rsub|0><rsup|T><around|\||j<rsub|<math-up|smooth>><around|(|t|)>|\|>*<space|0.17em>d*t=<big|int><rsub|0><rsup|T>\<Psi\><rprime|'><around|(|t|)>*<space|0.17em>d*t=\<Psi\><around|(|T|)>.
    </equation*>

    The smooth zero-counting function <math|<wide|N|\<bar\>><around|(|t|)>=\<vartheta\><around|(|t|)>/\<pi\>+1>
    satisfies <math|<wide|N|\<bar\>><rprime|'><around|(|t|)>=\<vartheta\><rprime|'><around|(|t|)>/\<pi\>>,
    so on the tail,

    <\equation*>
      <around|\||j<rsub|<math-up|smooth>><around|(|t|)>|\|>=\<pi\>*<space|0.17em>\<mu\><around|(|t|)>*<space|0.17em><wide|N|\<bar\>><rprime|'><around|(|t|)>,
    </equation*>

    and therefore

    <\equation*>
      \<Psi\><around|(|T|)>=\<pi\>*<big|int><rsub|0><rsup|T>\<mu\><around|(|t|)>*<space|0.17em><wide|N|\<bar\>><rprime|'><around|(|t|)>*<space|0.17em>d*t.
    </equation*>

    The total current flux, the elapsed <math|\<Psi\>>-clock, and the
    density-weighted zero count are the same integral.
  </theorem>

  <\proof>
    The first equality is the definition of
    <math|\<Psi\><around|(|T|)>=<big|int><rsub|0><rsup|T>\<Psi\><rprime|'><around|(|t|)>*<space|0.17em>d*t>
    combined with <math|<around|\||j<rsub|<math-up|smooth>>|\|>=\<Psi\><rprime|'>>
    from Theorem<nbsp><reference|thm:smooth>. The second uses
    <math|<wide|N|\<bar\>><rprime|'><around|(|t|)>=\<vartheta\><rprime|'><around|(|t|)>/\<pi\>>
    and <math|<around|\||j<rsub|<math-up|smooth>>|\|>=\<mu\><around|\||\<vartheta\><rprime|'>|\|>=\<pi\>*\<mu\>*<wide|N|\<bar\>><rprime|'>>.
  </proof>

  <\theorem>
    [Radon\UNikodym derivative as current ratio]<label|thm:RN>Let
    <math|\<gamma\>> be the Borel measure
    <math|d*\<gamma\><around|(|t|)>=\<Psi\><rprime|'><around|(|t|)>*<space|0.17em>d*t=<around|\||j<rsub|<math-up|smooth>><around|(|t|)>|\|>*<space|0.17em>d*t>.
    For <math|h\<in\>\<bbb-R\>> let <math|<around|(|T<rsub|h>*\<gamma\>|)><around|(|A|)>=\<gamma\>*<around|(|A+h|)>>.
    Then

    <\equation*>
      <frac|d*<around|(|T<rsub|h>*\<gamma\>|)>|d*\<gamma\>><around|(|t|)>=<frac|\<Psi\><rprime|'>*<around|(|t-h|)>|\<Psi\><rprime|'><around|(|t|)>>=<frac|<around|\||j<rsub|<math-up|smooth>>*<around|(|t-h|)>|\|>|<around|\||j<rsub|<math-up|smooth>><around|(|t|)>|\|>>,
    </equation*>

    for <math|\<gamma\>>-almost every <math|t>. The measures <math|\<gamma\>>
    and <math|T<rsub|h>*\<gamma\>> are equivalent (mutually absolutely
    continuous).
  </theorem>

  <\proof>
    For any Borel set <math|A>,

    <\equation*>
      <around|(|T<rsub|h>*\<gamma\>|)><around|(|A|)>=\<gamma\>*<around|(|A+h|)>=<big|int><rsub|A+h>\<Psi\><rprime|'><around|(|t|)>*<space|0.17em>d*t=<big|int><rsub|A>\<Psi\><rprime|'>*<around|(|s+h|)>*<space|0.17em>d*s.
    </equation*>

    So <math|T<rsub|h>*\<gamma\>> has Lebesgue density
    <math|\<Psi\><rprime|'>*<around|(|t-h|)>>. Both
    <math|\<Psi\><rprime|'><around|(|t|)>> and
    <math|\<Psi\><rprime|'>*<around|(|t-h|)>> vanish only on <math|\<cal-C\>>
    and <math|\<cal-C\>+h> respectively. As established in
    Definition<nbsp><reference|def:objects>, <math|\<cal-C\>> is discrete,
    hence countable, hence Lebesgue-null, hence <math|\<gamma\>>-null. The
    same holds for <math|\<cal-C\>+h>. Therefore
    <math|\<gamma\><around|(|<around|{|\<Psi\><rprime|'>=0|}>|)>=0> and
    <math|T<rsub|h>*\<gamma\>*<around|(|<around|{|\<Psi\><rprime|'>|(>\<cdot\>-h|)>=0})=0>,
    so the two measures share all null sets. The chain rule
    <math|d*<around|(|T<rsub|h>*\<gamma\>|)>/d*\<gamma\>=\<Psi\><rprime|'>*<around|(|t-h|)>/\<Psi\><rprime|'><around|(|t|)>>
    follows, and is positive <math|\<gamma\>>-a.e. The final equality
    restates <math|\<Psi\><rprime|'>=<around|\||j<rsub|<math-up|smooth>>|\|>>
    from Theorem<nbsp><reference|thm:smooth>.
  </proof>

  <\remark>
    The Radon\UNikodym derivative is the ratio of current densities at
    <math|t> and <math|t-h>. When <math|h> lies in the Cameron\UMartin space
    <math|H<rsub|\<gamma\>>> (the space of shifts for which this ratio is
    square-integrable with respect to <math|\<gamma\>>), the shift is
    absolutely continuous with respect to <math|\<gamma\>>. When
    <math|h\<nin\>H<rsub|\<gamma\>>> the translated measure concentrates on a
    set disjoint from the support of <math|\<gamma\>> in the
    measure-theoretic sense, and no Radon\UNikodym derivative exists.
  </remark>

  <section|The Priestley Representation>

  The stationary pullback <math|X<around|(|T|)>=\<zeta\>*<around|(|<tfrac|1|2>+i*\<Psi\><rsup|-1><around|(|T|)>|)>/<sqrt|\<Psi\><rprime|'><around|(|\<Psi\><rsup|-1><around|(|T|)>|)>>>
  has Fourier support in <math|<around|[|-2,0|]>> and admits the spectral
  integral

  <\equation*>
    X<around|(|T|)>=<big|int><rsub|<around|[|-2,0|]>>e<rsup|i*\<omega\>*T>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>,
  </equation*>

  where <math|\<Phi\>> is a deterministic, convergent Borel measure on
  <math|<around|[|-2,0|]>> (not a random measure, not a distribution). The
  recovery formula <math|\<zeta\>*<around|(|<tfrac|1|2>+i*t|)>=<sqrt|\<Psi\><rprime|'><around|(|t|)>>\<cdot\>X<around|(|\<Psi\><around|(|t|)>|)>>
  then gives the Priestley oscillatory representation

  <\equation*>
    \<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>=<big|int><rsub|<around|[|-2,0|]>><sqrt|\<Psi\><rprime|'><around|(|t|)>>*<space|0.27em>e<rsup|i*\<omega\>*\<Psi\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>.
  </equation*>

  Expressed through <math|\<Phi\>>, the density and current are

  <\align>
    <tformat|<table|<row|<cell|\<rho\><around|(|t|)>>|<cell|=\<Psi\><rprime|'><around|(|t|)><space|0.17em><around*|\||<big|int><rsub|<around|[|-2,0|]>>e<rsup|i*\<omega\>*\<Psi\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>|\|><rsup|2>,<eq-number>>>|<row|<cell|<vspace*|6pt>j<around|(|t|)>>|<cell|=-\<mu\><around|(|t|)>*<space|0.17em>\<vartheta\><rprime|'><around|(|t|)>=-\<Psi\><rprime|'><around|(|t|)><space|0.17em><around*|\||<big|int><rsub|<around|[|-2,0|]>>e<rsup|i*\<omega\>*\<Psi\><around|(|t|)>>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>|\|><rsup|2>\<cdot\><math-up|sgn><around|(|\<vartheta\><rprime|'><around|(|t|)>|)>,<eq-number>>>>>
  </align>

  where the second line uses <math|\<Psi\><rprime|'>=\<mu\><around|\||\<vartheta\><rprime|'>|\|>>
  and <math|j<rsub|<math-up|smooth>>=-\<mu\>*\<vartheta\><rprime|'>> from
  Theorem<nbsp><reference|thm:smooth>.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-7|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-8|<tuple|4|8|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|def:current|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|def:objects|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|def:polar|<tuple|2|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:RN|<tuple|10|7|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:continuity|<tuple|7|6|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:flux|<tuple|9|7|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:polar|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|thm:smooth|<tuple|5|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>WKB
      Background> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|The polar decomposition of a wavefunction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|What the current measures
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|The velocity field
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|Units and normalisation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Definitions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Priestley Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>