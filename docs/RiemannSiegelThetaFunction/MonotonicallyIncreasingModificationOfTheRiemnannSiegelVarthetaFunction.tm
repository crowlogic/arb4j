<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <doc-data|<doc-title|A Bijective Modification of the Riemann-Siegel
  <math|Theta> Function>|<doc-author|<author-data|<author-name|Stephen
  Crowley \<less\>Stephencrowley214@gmail.com\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    A monotonically increasing version <math|\<vartheta\><rsup|+><around|(|t|)>>
    of the Riemann\USiegel theta function <math|\<vartheta\><around|(|t|)>>
    is constructed by modifying through reflection about its unique nonzero
    critical point. \<cdot\>
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Riemann\USiegel Theta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Monotonization
    Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Phase
    Information Preservation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|The Riemann\USiegel Theta Function>

  <\definition>
    [Riemann\USiegel Theta Function]<label|def:theta> The Riemann\USiegel
    theta function is defined as:

    <\equation>
      \<vartheta\><around|(|t|)>=arg \<Gamma\>*<space|-0.17em><around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*log
      \<pi\>
    </equation>

    where <math|\<Gamma\>> is the gamma function and arg denotes the
    principal argument, taken continuously along the path.
  </definition>

  <\definition>
    [Digamma and Trigamma Functions]<label|def:psi> The digamma function
    <math|\<psi\><rsup|<around|(|0|)>><around|(|z|)>> and trigamma function
    <math|\<psi\><rsup|<around|(|1|)>><around|(|z|)>> are defined by:

    <\align>
      <tformat|<table|<row|<cell|\<psi\><rsup|<around|(|0|)>><around|(|z|)>>|<cell|=<frac|d|d*z>*log
      \<Gamma\><around|(|z|)>=<frac|\<Gamma\><rprime|'><around|(|z|)>|\<Gamma\><around|(|z|)>><space|1em><text|<cite|DLMF5.2.1>><eq-number>>>|<row|<cell|\<psi\><rsup|<around|(|1|)>><around|(|z|)>>|<cell|=<frac|d|d*z>*\<psi\><rsup|<around|(|0|)>><around|(|z|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|1|<around|(|n+z|)><rsup|2>><space|1em><text|<cite|DLMF5.4.2>><eq-number>>>>>
    </align>

    for <math|\<Re\><around|(|z|)>\<gtr\>0>.
  </definition>

  <\proposition>
    [Derivative Properties]<label|prop:derivative> The derivative of the
    Riemann\USiegel theta function is:

    <\equation>
      \<vartheta\><rprime|'><around|(|t|)>=<frac|1|2>*\<Im\>*<space|-0.17em><around*|[|\<psi\><rsup|<around|(|0|)>>*<space|-0.17em><around*|(|<frac|1|4>+<frac|i*t|2>|)>|]>-<frac|log
      \<pi\>|2>
    </equation>
  </proposition>

  <\proof>
    Let <math|w<around|(|t|)>=<frac|1|4>+<frac|i*t|2>>. Along the curve
    <math|t\<mapsto\>w<around|(|t|)>> the principal argument of
    <math|\<Gamma\>> can be chosen continuously, so

    <\equation>
      <frac|d|d*t>arg\<Gamma\><around|(|w<around|(|t|)>|)>=\<Im\>*<space|-0.17em><around*|(|<frac|d|d*t>*log
      \<Gamma\><around|(|w<around|(|t|)>|)>|)>=\<Im\>*<space|-0.17em><around*|(|\<psi\><rsup|<around|(|0|)>><around|(|w<around|(|t|)>|)>*<space|0.17em>w<rprime|'><around|(|t|)>|)>
    </equation>

    Since <math|w<rprime|'><around|(|t|)>=i/2>, this derivative equals
    <math|<frac|1|2>*\<Im\>*\<psi\><rsup|<around|(|0|)>><around|(|w<around|(|t|)>|)>>.
    Differentiating <math|-<frac|t|2>*log \<pi\>> gives <math|-<frac|log
    \<pi\>|2>>.
  </proof>

  <\theorem>
    [Limit at the Origin]<label|thm:limit>

    <\equation>
      lim<rsub|t\<to\>0<rsup|+>> \<Im\>*<space|-0.17em><around*|[|\<psi\><rsup|<around|(|0|)>>*<space|-0.17em><around*|(|<frac|1|4>+<frac|i*t|2>|)>|]>=0
    </equation>
  </theorem>

  <\proof>
    Using the integral representation <cite|AbramowitzStegun6.3.1> and
    dominated convergence (or by analyticity and Taylor expansion in
    <math|t>), the imaginary part vanishes as <math|t\<to\>0<rsup|+>>.
  </proof>

  <\theorem>
    [Monotonicity of the Digamma Imaginary Part]<label|thm:monotonicity> For
    fixed <math|\<sigma\>\<gtr\>0>, the function
    <math|t\<mapsto\>\<Im\>*<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|\<sigma\>+i*t|)>|]>>
    is strictly increasing for <math|t\<gtr\>0>.
  </theorem>

  <\proof>
    Differentiating with respect to <math|t> gives

    <\equation>
      <frac|\<partial\>|\<partial\>*t>*\<Im\>*<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|\<sigma\>+i*t|)>|]>=\<Re\>*<space|-0.17em><around*|[|<frac|\<partial\>|\<partial\>*t>*\<psi\><rsup|<around|(|0|)>>*<around|(|\<sigma\>+i*t|)>|]>=\<Re\>*<space|-0.17em><around*|[|i*<space|0.17em>\<psi\><rsup|<around|(|1|)>>*<around|(|\<sigma\>+i*t|)>|]>=-<space|0.17em>\<Im\>*<space|-0.17em><around*|[|\<psi\><rsup|<around|(|1|)>>*<around|(|\<sigma\>+i*t|)>|]>
    </equation>

    Using the absolutely convergent series <cite|DLMF5.4.2>

    <\equation>
      \<psi\><rsup|<around|(|1|)>><around|(|z|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|1|<around|(|n+z|)><rsup|2>>,<space|1em>\<Re\>*z\<gtr\>0
    </equation>

    and setting <math|z=\<sigma\>+i*t>, we have

    <\equation>
      <frac|1|<around|(|n+\<sigma\>+i*t|)><rsup|2>>=<frac|<around|(|n+\<sigma\>|)><rsup|2>-t<rsup|2>-2*i*<around|(|n+\<sigma\>|)>*t|<around*|(|<around|(|n+\<sigma\>|)><rsup|2>+t<rsup|2>|)><rsup|2>>
    </equation>

    Thus

    <\equation>
      \<Im\>*<space|-0.17em><around*|[|\<psi\><rsup|<around|(|1|)>>*<around|(|\<sigma\>+i*t|)>|]>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|-<space|0.17em>2*<around|(|n+\<sigma\>|)>*t|<around*|(|<around|(|n+\<sigma\>|)><rsup|2>+t<rsup|2>|)><rsup|2>>\<less\>0
    </equation>

    for <math|\<sigma\>\<gtr\>0>, <math|t\<gtr\>0>. Hence
    <math|<frac|\<partial\>|\<partial\>*t>*\<Im\>*<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|\<sigma\>+i*t|)>|]>\<gtr\>0>.
  </proof>

  <\theorem>
    [Asymptotic Limit]<label|thm:growth>

    <\equation>
      lim<rsub|t\<to\>\<infty\>> \<Im\>*<space|-0.17em><around*|[|\<psi\><rsup|<around|(|0|)>>*<space|-0.17em><around*|(|<frac|1|4>+<frac|i*t|2>|)>|]>=<frac|\<pi\>|2>
    </equation>
  </theorem>

  <\proof>
    From the asymptotic expansion <cite|DLMF5.11.1>,
    <math|\<psi\><rsup|<around|(|0|)>><around|(|z|)>=log
    z-<frac|1|2*z>+O<around|(|<around|\||z|\|><rsup|-2>|)>> as
    <math|<around|\||z|\|>\<to\>\<infty\>> with <math|<around|\||arg
    z|\|>\<less\>\<pi\>>. Writing <math|z=<frac|1|4>+<frac|i*t|2>>, we have
    <math|\<Im\>*log z=arg z\<to\><frac|\<pi\>|2>>, and
    <math|\<Im\>*<around|(|-1/<around|(|2*z|)>|)>=O<around|(|1/t|)>>, so the
    limit is <math|\<pi\>/2>.
  </proof>

  <\theorem>
    [Unique Critical Point]<label|thm:critical> There exists a unique
    <math|a\<gtr\>0> such that <math|\<vartheta\><rprime|'><around|(|a|)>=0>,
    equivalently

    <\equation>
      \<Im\>*<space|-0.17em><around*|[|\<psi\><rsup|<around|(|0|)>>*<space|-0.17em><around*|(|<frac|1|4>+<frac|i*a|2>|)>|]>=log
      \<pi\>
    </equation>

    Moreover:

    <\itemize>
      <item><math|\<vartheta\><rprime|'><around|(|t|)>\<less\>0> for
      <math|t\<in\><around|(|0,a|)>>

      <item><math|\<vartheta\><rprime|'><around|(|t|)>=0> at <math|t=a>

      <item><math|\<vartheta\><rprime|'><around|(|t|)>\<gtr\>0> for
      <math|t\<gtr\>a>
    </itemize>
  </theorem>

  <\proof>
    By Theorems <reference|thm:limit>, <reference|thm:monotonicity>, and
    <reference|thm:growth>, the function <math|t\<mapsto\>\<Im\>*<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|1/4+i*t/2|)>|]>>
    is continuous, strictly increasing from <math|0> to <math|\<pi\>/2>, and
    therefore attains the value <math|log \<pi\>> at a unique
    <math|a\<gtr\>0>. The sign changes for
    <math|\<vartheta\><rprime|'><around|(|t|)>> follow from Proposition
    <reference|prop:derivative>.
  </proof>

  <section|Monotonization Construction>

  <\definition>
    [Monotonized Theta Function]<label|def:monotonized> Define the
    monotonized Riemann\USiegel theta function

    <\equation>
      \<vartheta\><rsup|+><around|(|t|)>=<choice|<tformat|<table|<row|<cell|2*\<vartheta\><around|(|a|)>-\<vartheta\><around|(|t|)>>|<cell|t\<in\><around|[|0,a|]>>>|<row|<cell|\<vartheta\><around|(|t|)>>|<cell|t\<gtr\>a>>>>>
    </equation>

    where <math|a> is the unique critical point from Theorem
    <reference|thm:critical>.
  </definition>

  <\theorem>
    [Monotonicity of <math|\<vartheta\><rsup|+>>]<label|thm:mono_construction>
    The function <math|\<vartheta\><rsup|+><around|(|t|)>> is nondecreasing
    on <math|<around|[|0,\<infty\>|)>> and strictly increasing on
    <math|<around|[|0,\<infty\>|)>\<setminus\><around|{|a|}>>:

    <\equation>
      <frac|d|d*t>*\<vartheta\><rsup|+><around|(|t|)>=<choice|<tformat|<table|<row|<cell|-\<vartheta\><rprime|'><around|(|t|)>\<gtr\>0,>|<cell|t\<in\><around|(|0,a|)>>>|<row|<cell|0,>|<cell|t=a>>|<row|<cell|\<vartheta\><rprime|'><around|(|t|)>\<gtr\>0>|<cell|t\<gtr\>a>>>>>
    </equation>
  </theorem>

  <\proof>
    Immediate from the definition and the sign of
    <math|\<vartheta\><rprime|'><around|(|t|)>>.
  </proof>

  <\proposition>
    [Continuity and Differentiability]<label|prop:continuity> The function
    <math|\<vartheta\><rsup|+><around|(|t|)>> is continuous and
    differentiable everywhere, including at <math|t=a>.
  </proposition>

  <\proof>
    Continuity at <math|a>:

    <\equation>
      lim<rsub|t\<to\>a<rsup|->> \<vartheta\><rsup|+><around|(|t|)>=2*\<vartheta\><around|(|a|)>-\<vartheta\><around|(|a|)>=\<vartheta\><around|(|a|)>=lim<rsub|t\<to\>a<rsup|+>>
      \<vartheta\><rsup|+><around|(|t|)>=\<vartheta\><rsup|+><around|(|a|)>
    </equation>

    Differentiability at <math|a>:

    <\equation*>
      lim<rsub|t\<to\>a<rsup|->> <frac|d|d*t>*\<vartheta\><rsup|+><around|(|t|)>=-\<vartheta\><rprime|'><around|(|a|)>=0=lim<rsub|t\<to\>a<rsup|+>>
      <frac|d|d*t>*\<vartheta\><rsup|+><around|(|t|)>
    </equation*>
  </proof>

  <section|Phase Information Preservation>

  <\definition>
    [Phase Representation]<label|def:phase> On the critical line,

    <\equation>
      \<zeta\>*<space|-0.17em><around*|(|<frac|1|2>+i*t|)>=e<rsup|-i*\<vartheta\><around|(|t|)>>*<space|0.17em>Z<around|(|t|)>
    </equation>

    where <math|Z<around|(|t|)>> is real-valued (the Hardy
    <math|Z>-function).
  </definition>

  <\theorem>
    [Phase Preservation]<label|thm:phase_preservation> Define

    <\equation>
      <wide|Z|~><around|(|t|)>=e<rsup|i*\<vartheta\><rsup|+><around|(|t|)>>*<space|0.17em>\<zeta\>*<space|-0.17em><around*|(|<frac|1|2>+i*t|)>
    </equation>

    Then

    <\equation>
      <wide|Z|~><around|(|t|)>=<choice|<tformat|<table|<row|<cell|e<rsup|2*i*\<vartheta\><around|(|a|)>>*<space|0.17em>Z<around|(|t|)>,>|<cell|t\<in\><around|[|0,a|]>,>>|<row|<cell|Z<around|(|t|)>,>|<cell|t\<gtr\>a.>>>>>
    </equation>
  </theorem>

  <\proof>
    For <math|t\<gtr\>a>, <math|\<vartheta\><rsup|+><around|(|t|)>=\<vartheta\><around|(|t|)>>,
    so <math|<wide|Z|~><around|(|t|)>=Z<around|(|t|)>>. For
    <math|t\<in\><around|[|0,a|]>>,

    <\equation*>
      <wide|Z|~><around|(|t|)>=e<rsup|i*<around|(|2*\<vartheta\><around|(|a|)>-\<vartheta\><around|(|t|)>|)>>*\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>=e<rsup|2*i*\<vartheta\><around|(|a|)>>*<space|0.17em>e<rsup|-i*\<vartheta\><around|(|t|)>>*\<zeta\>*<space|-0.17em><around*|(|<tfrac|1|2>+i*t|)>=e<rsup|2*i*\<vartheta\><around|(|a|)>>*<space|0.17em>Z<around|(|t|)>
    </equation*>
  </proof>

  <\corollary>
    [Zero Preservation]<label|cor:zeros> The zeros of
    <math|\<zeta\>*<space|-0.17em><around*|(|<frac|1|2>+i*t|)>> correspond
    exactly to the zeros of both <math|Z<around|(|t|)>> and
    <math|<wide|Z|~><around|(|t|)>> for <math|t\<gtr\>0>.
  </corollary>

  <\proof>
    Multiplication by nonzero phase factors preserves zeros.
  </proof>

  <\proposition>
    [Bijectivity]<label|prop:bijective> The function
    <math|\<vartheta\><rsup|+><around|(|t|)>:<around|[|0,\<infty\>|)>\<to\><around|[|\<vartheta\><rsup|+><around|(|0|)>,\<infty\>|)>>
    is bijective.
  </proposition>

  <\proof>
    Injectivity: By Theorem <reference|thm:mono_construction>,
    <math|\<vartheta\><rsup|+>> is strictly increasing except at <math|t=a>
    where the derivative is <math|0> but the function increases through
    <math|a>; hence injective. Surjectivity: <math|\<vartheta\><rsup|+>> is
    continuous and increases without bound as <math|t\<to\>\<infty\>>
    (matching <math|\<vartheta\>> asymptotically), so by the Intermediate
    Value Theorem its range is <math|<around|[|\<vartheta\><rsup|+><around|(|0|)>,\<infty\>|)>>.
  </proof>

  <\theorem>
    [Modulating Function Criteria]<label|thm:modulating> The function
    <math|\<vartheta\><rsup|+><around|(|t|)>> satisfies:

    <\enumerate>
      <item>Piecewise <math|C<rsup|1>> with piecewise continuous first
      derivative and matching at <math|t=a>,

      <item>Monotonically nondecreasing with
      <math|<frac|d|d*t>*\<vartheta\><rsup|+><around|(|t|)>\<ge\>0> and
      equality only at <math|t=a>,

      <item>Bijective with <math|lim<rsub|t\<to\>\<infty\>>
      \<vartheta\><rsup|+><around|(|t|)>=\<infty\>>.
    </enumerate>
  </theorem>

  <\proof>
    Immediate from Propositions <reference|prop:continuity>,
    <reference|prop:bijective> and Theorem <reference|thm:mono_construction>.
  </proof>

  <section|Conclusion>

  The monotonized Riemann\USiegel theta function
  <math|\<vartheta\><rsup|+><around|(|t|)>> constructed through geometric
  reflection about its unique critical point provides a bijective,
  monotonically increasing transformation that preserves all essential phase
  information of the original theta function. This construction maintains
  exact correspondence with zeros of the Riemann zeta function while enabling
  applications requiring monotonic phase functions.

  <\thebibliography|99>
    <bibitem|DLMF5.2.1>NIST Digital Library of Mathematical Functions.
    Section 5.2.1: Definitions.

    <bibitem|DLMF5.4.2>NIST Digital Library of Mathematical Functions.
    Section 5.4.2: Series Representations.

    <bibitem|DLMF5.11.1>NIST Digital Library of Mathematical Functions.
    Section 5.11.1: Asymptotic Expansions.

    <bibitem|AbramowitzStegun6.3.1>Abramowitz, M. and Stegun, I. A. (1964).
    Handbook of Mathematical Functions. National Bureau of Standards. Chapter
    6, Equation 6.3.1.

    <bibitem|Elezovic1999>Elezovi¢, N., Giordano, C., and Pe£ari¢, J. (1999).
    The best bounds in Gautschi's inequality. Mathematical Inequalities &
    Applications, 2(2), 239\U252.
  </thebibliography>

  \;
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|5>>
    <associate|auto-5|<tuple|4|5>>
    <associate|bib-AbramowitzStegun6.3.1|<tuple|AbramowitzStegun6.3.1|5>>
    <associate|bib-DLMF5.11.1|<tuple|DLMF5.11.1|5>>
    <associate|bib-DLMF5.2.1|<tuple|DLMF5.2.1|5>>
    <associate|bib-DLMF5.4.2|<tuple|DLMF5.4.2|5>>
    <associate|bib-Elezovic1999|<tuple|Elezovic1999|5>>
    <associate|cor:zeros|<tuple|13|5>>
    <associate|def:monotonized|<tuple|8|3>>
    <associate|def:phase|<tuple|11|4>>
    <associate|def:psi|<tuple|2|1>>
    <associate|def:theta|<tuple|1|1>>
    <associate|prop:bijective|<tuple|14|5>>
    <associate|prop:continuity|<tuple|10|4>>
    <associate|prop:derivative|<tuple|3|2>>
    <associate|thm:critical|<tuple|7|3>>
    <associate|thm:growth|<tuple|6|3>>
    <associate|thm:limit|<tuple|4|2>>
    <associate|thm:modulating|<tuple|15|5>>
    <associate|thm:mono_construction|<tuple|9|4>>
    <associate|thm:monotonicity|<tuple|5|2>>
    <associate|thm:phase_preservation|<tuple|12|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      DLMF5.2.1

      DLMF5.4.2

      AbramowitzStegun6.3.1

      DLMF5.4.2

      DLMF5.11.1
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Riemann\USiegel Theta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Monotonization
      Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Phase
      Information Preservation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>