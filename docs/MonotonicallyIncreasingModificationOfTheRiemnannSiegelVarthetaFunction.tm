<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Monotonically Increasing Phase-Preserving
  Modification of the Riemann-Siegel <math|\<vartheta\>>
  Function>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<\abstract>
    A monotonically increasing version <math|\<vartheta\><rsup|+><around*|(|t|)>>
    of the Riemann-Siegel theta <math|\<vartheta\><rsup|><around*|(|t|)>>
    function is constructed by modifying through reflection about its unique
    non-zero critical point. This transformation preserves all phase
    relationships essential to zeta function analysis while enforcing strict
    monotonicity. The construction maintains exact phase information without
    approximations and preserves the function's critical number-theoretic
    properties.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    Riemann-Siegel Theta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Exact
    Monotonization Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Phase
    Information Preservation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|The Riemann-Siegel Theta Function>

  <\definition>
    [Riemann-Siegel Theta Function] The Riemann-Siegel
    <math|\<vartheta\>>function is defined exactly as:

    <\equation>
      \<vartheta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*log
      \<pi\>
    </equation>

    where <math|\<Gamma\>> is the gamma function and <math|arg> denotes the
    principal argument.
  </definition>

  <\proposition>
    [Derivative Properties] The derivative of the Riemann-Siegel theta
    function is given by:

    <\equation>
      <wide|\<vartheta\>|\<dot\>><around*|(|t|)>=<frac|1|2>*<text|Im><around*|[|\<psi\><rsup|<around|(|0|)>>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>|]>-<frac|*log
      \<pi\>|2>
    </equation>

    where <math|\<psi\><rsup|<around|(|0|)>>> is the digamma function.
  </proposition>

  <\proof>
    Using the relationship between the derivative of the argument of a
    complex function and the logarithmic derivative:

    <\align>
      <tformat|<table|<row|<cell|<frac|d|d*t>*arg
      \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>>|<cell|=<text|Im><around*|[|<frac|d|d*t>*log
      \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>|]><eq-number>>>|<row|<cell|>|<cell|=<text|Im><around*|[|<frac|\<Gamma\><rprime|'>*<around|(|<frac|1|4>+<frac|i*t|2>|)>|\<Gamma\>*<around|(|<frac|1|4>+<frac|i*t|2>|)>>\<cdot\><frac|i|2>|]><eq-number>>>|<row|<cell|>|<cell|=<text|Im><around*|[|\<psi\><rsup|<around|(|0|)>>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>\<cdot\><frac|i|2>|]><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2>*<text|Im><around*|[|\<psi\><rsup|<around|(|0|)>>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>|]><eq-number>>>>>
    </align>

    The derivative of the second term is simply <math|-<frac|1|2>*log
    \<pi\>>. Combining these results gives the stated formula.
  </proof>

  <\theorem>
    <label|ucp>[Unique Critical Point] There exists a unique positive real
    value <math|a\<in\>\<bbb-R\><rsup|+>> such that:

    <\equation>
      <around*|\<nobracket\>|<frac|d*\<theta\>|d*t>|\|><rsub|t=a>=0
    </equation>

    This critical point satisfies the transcendental equation:

    <\equation>
      <text|Im><around*|[|\<psi\><rsup|<around|(|0|)>>*<around*|(|<frac|1|4>+<frac|i*a|2>|)>|]>=log
      \<pi\>
    </equation>

    Furthermore, the derivative exhibits the following behavior:

    <\itemize>
      <item><math|<frac|d*\<theta\>|d*t><around|(|t|)>\<less\>0> for
      <math|t\<in\><around|(|0,a|)>>

      <item><math|<frac|d*\<theta\>|d*t><around|(|t|)>=0> at <math|t=a>

      <item><math|<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0> for
      <math|t\<gtr\>a>
    </itemize>
  </theorem>

  \;

  <\proof>
    First, note that the transcendental equation follows directly from the
    derivative formula and setting it equal to zero:

    <\align>
      <tformat|<table|<row|<cell|<frac|d*\<theta\>|d*t><around|(|a|)>>|<cell|=0<eq-number>>>|<row|<cell|<frac|1|2>*<text|Im><around*|[|\<psi\><rsup|<around|(|0|)>>*<around*|(|<frac|1|4>+<frac|i*a|2>|)>|]>-<frac|1|2>*log
      \<pi\>>|<cell|=0<eq-number>>>|<row|<cell|<text|Im><around*|[|\<psi\><rsup|<around|(|0|)>>*<around*|(|<frac|1|4>+<frac|i*a|2>|)>|]>>|<cell|=log
      \<pi\><eq-number>>>>>
    </align>

    For uniqueness, we examine the behavior of
    Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|1/4+i*t/2|)>|]>>
    as <math|t> varies. From the properties of the digamma function:

    <\enumerate-numeric>
      <item>As <math|t\<to\>0<rsup|+>>, Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|1/4+i*t/2|)>|]>\<to\>0>,
      which is less than <math|log \<pi\>>

      <item>The function Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|1/4+i*t/2|)>|]>>
      is strictly increasing for <math|t\<gtr\>0>, which follows from the
      fact that for fixed <math|\<sigma\>\<gtr\>0>, the function
      Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|\<sigma\>+i*t|)>|]>>
      is strictly increasing in <math|t> due to the positive curvature of the
      level curves of <math|\<psi\><rsup|<around|(|0|)>>>.

      <item>As <math|t\<to\>\<infty\>>, Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|1/4+i*t/2|)>|]>\<sim\>log
      <around|(|t/2|)>\<to\>\<infty\>>, which exceeds <math|log \<pi\>> for
      sufficiently large <math|t>
    </enumerate-numeric>

    By the intermediate value theorem and the monotonicity of
    Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|1/4+i*t/2|)>|]>>,
    there exists exactly one value <math|a\<gtr\>0> where
    Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|1/4+i*a/2|)>|]>=log
    \<pi\>>.

    For the behavior of the derivative:

    <\itemize>
      <item>When <math|t\<less\>a>: Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|1/4+i*t/2|)>|]>\<less\>log
      \<pi\>>, so <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<less\>0>

      <item>When <math|t=a>: Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|1/4+i*a/2|)>|]>=log
      \<pi\>>, so <math|<frac|d*\<theta\>|d*t><around|(|a|)>=0>

      <item>When <math|t\<gtr\>a>: Im<math|<around|[|\<psi\><rsup|<around|(|0|)>>*<around|(|1/4+i*t/2|)>|]>\<gtr\>log
      \<pi\>>, so <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0>
    </itemize>
  </proof>

  <section|Exact Monotonization Construction>

  <\definition>
    [Monotonized Theta Function] We define the monotonized Riemann-Siegel
    theta function <math|<wide|\<theta\>|~><around|(|t|)>> through the exact
    transformation:

    <\equation>
      <wide|\<theta\>|~><around|(|t|)>=<choice|<tformat|<table|<row|<cell|2*\<theta\><around|(|a|)>-\<theta\><around|(|t|)>>|<cell|<text|for
      >t\<in\><around|[|0,a|]>>>|<row|<cell|\<theta\><around|(|t|)>>|<cell|<text|for
      >t\<gtr\>a>>>>>
    </equation>

    where <math|a> is the unique critical point where
    <math|<frac|d*\<theta\>|d*t><around|(|a|)>=0>.
  </definition>

  <\theorem>
    [Monotonicity Properties] The function
    <math|<wide|\<theta\>|~><around|(|t|)>> is strictly monotonically
    increasing except at <math|t=a>. Specifically:

    <\equation>
      <frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>=<choice|<tformat|<table|<row|<cell|-<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0>|<cell|<text|for
      >t\<in\><around|(|0,a|)>>>|<row|<cell|0>|<cell|<text|at
      >t=a>>|<row|<cell|<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0>|<cell|<text|for
      >t\<gtr\>a>>>>>
    </equation>
  </theorem>

  <\proof>
    For <math|t\<in\><around|(|0,a|)>>:

    <\align>
      <tformat|<table|<row|<cell|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>>|<cell|=<frac|d|d*t>*<around|[|2*\<theta\><around|(|a|)>-\<theta\><around|(|t|)>|]><eq-number>>>|<row|<cell|>|<cell|=-<frac|d*\<theta\>|d*t><around|(|t|)><eq-number>>>>>
    </align>

    From Theorem 1, its known that <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<less\>0>
    for <math|t\<in\><around|(|0,a|)>>. Therefore,
    <math|-<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0> in this range.

    For <math|t=a>:

    <\align>
      <tformat|<table|<row|<cell|<frac|d*<wide|\<theta\>|~>|d*t><around|(|a|)>>|<cell|=-<frac|d*\<theta\>|d*t><around|(|a|)><eq-number>>>|<row|<cell|>|<cell|=-0=0<eq-number>>>>>
    </align>

    For <math|t\<gtr\>a>:

    <\align>
      <tformat|<table|<row|<cell|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>>|<cell|=<frac|d*\<theta\>|d*t><around|(|t|)><eq-number>>>>>
    </align>

    From Theorem <reference|ucp>, its known that
    <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0> for <math|t\<gtr\>a>.
    Therefore, <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<gtr\>0>
    in this range.

    Thus, <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<geq\>0> for
    all <math|t\<geq\>0>, with equality only at <math|t=a>, which confirms
    that <math|<wide|\<theta\>|~><around|(|t|)>> is strictly monotonically
    increasing except at the single point <math|t=a> which is of measure
    zero.
  </proof>

  <\proposition>
    [Continuity and Differentiability] The function
    <math|<wide|\<theta\>|~><around|(|t|)>> is:

    <\enumerate>
      <item>Continuous at all points <math|t\<geq\>0>, including <math|t=a>

      <item>Differentiable at all points <math|t\<geq\>0>, including
      <math|t=a>

      <item><math|C<rsup|1>> continuous everywhere, but not <math|C<rsup|2>>
      at <math|t=a>
    </enumerate>
  </proposition>

  <\proof>
    \;

    <\enumerate-numeric>
      <item>For continuity at <math|t=a>:

      <\align>
        <tformat|<table|<row|<cell|lim<rsub|t\<to\>a<rsup|->>
        <wide|\<theta\>|~><around|(|t|)>>|<cell|=lim<rsub|t\<to\>a<rsup|->><around|[|2*\<theta\><around|(|a|)>-\<theta\><around|(|t|)>|]><eq-number>>>|<row|<cell|>|<cell|=2*\<theta\><around|(|a|)>-\<theta\><around|(|a|)><eq-number>>>|<row|<cell|>|<cell|=\<theta\><around|(|a|)><eq-number>>>|<row|<cell|lim<rsub|t\<to\>a<rsup|+>>
        <wide|\<theta\>|~><around|(|t|)>>|<cell|=lim<rsub|t\<to\>a<rsup|+>>
        \<theta\><around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=\<theta\><around|(|a|)><eq-number>>>>>
      </align>

      Since the left and right limits match,
      <math|<wide|\<theta\>|~><around|(|t|)>> is continuous at <math|t=a>.
      For <math|t\<neq\>a>, continuity follows from the continuity of
      <math|\<theta\><around|(|t|)>>.

      <item>For differentiability at <math|t=a>:

      <\align>
        <tformat|<table|<row|<cell|lim<rsub|t\<to\>a<rsup|->>
        <frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>>|<cell|=lim<rsub|t\<to\>a<rsup|->><around*|(|-<frac|d*\<theta\>|d*t><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=-<frac|d*\<theta\>|d*t><around|(|a|)><eq-number>>>|<row|<cell|>|<cell|=0<eq-number>>>|<row|<cell|lim<rsub|t\<to\>a<rsup|+>>
        <frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>>|<cell|=lim<rsub|t\<to\>a<rsup|+>>
        <frac|d*\<theta\>|d*t><around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=<frac|d*\<theta\>|d*t><around|(|a|)><eq-number>>>|<row|<cell|>|<cell|=0<eq-number>>>>>
      </align>

      Since the left and right derivatives match at <math|t=a>,
      <math|<wide|\<theta\>|~><around|(|t|)>> is differentiable at
      <math|t=a>. For <math|t\<neq\>a>, differentiability follows from the
      differentiability of <math|\<theta\><around|(|t|)>>.

      <item>For the second derivative at <math|t=a>:

      <\align>
        <tformat|<table|<row|<cell|lim<rsub|t\<to\>a<rsup|->>
        <frac|d<rsup|2>*<wide|\<theta\>|~>|d*t<rsup|2>><around|(|t|)>>|<cell|=lim<rsub|t\<to\>a<rsup|->>
        <frac|d|d*t>*<around*|(|-<frac|d*\<theta\>|d*t><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=-lim<rsub|t\<to\>a<rsup|->>
        <frac|d<rsup|2>*\<theta\>|d*t<rsup|2>><around|(|t|)><eq-number>>>|<row|<cell|lim<rsub|t\<to\>a<rsup|+>>
        <frac|d<rsup|2>*<wide|\<theta\>|~>|d*t<rsup|2>><around|(|t|)>>|<cell|=lim<rsub|t\<to\>a<rsup|+>>
        <frac|d<rsup|2>*\<theta\>|d*t<rsup|2>><around|(|t|)><eq-number>>>>>
      </align>

      Since <math|<frac|d*\<theta\>|d*t><around|(|t|)>> changes sign at
      <math|t=a> (from negative to positive),
      <math|<frac|d<rsup|2>*\<theta\>|d*t<rsup|2>><around|(|a|)>> must be
      positive (the derivative is increasing through zero). Therefore:

      <\align>
        <tformat|<table|<row|<cell|lim<rsub|t\<to\>a<rsup|->>
        <frac|d<rsup|2>*<wide|\<theta\>|~>|d*t<rsup|2>><around|(|t|)>>|<cell|=-<frac|d<rsup|2>*\<theta\>|d*t<rsup|2>><around|(|a|)>\<less\>0<eq-number>>>|<row|<cell|lim<rsub|t\<to\>a<rsup|+>>
        <frac|d<rsup|2>*<wide|\<theta\>|~>|d*t<rsup|2>><around|(|t|)>>|<cell|=<frac|d<rsup|2>*\<theta\>|d*t<rsup|2>><around|(|a|)>\<gtr\>0<eq-number>>>>>
      </align>

      Since the left and right second derivatives differ at <math|t=a>,
      <math|<wide|\<theta\>|~><around|(|t|)>> is not <math|C<rsup|2>> at
      <math|t=a>. However, it is <math|C<rsup|1>> everywhere since the first
      derivative is continuous at all points
    </enumerate-numeric>
  </proof>

  <section|Phase Information Preservation>

  <\definition>
    [Phase Representation] The Riemann zeta function on the critical line can
    be expressed as:

    <\equation>
      \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=e<rsup|-i*\<theta\><around|(|t|)>>*Z<around|(|t|)>
    </equation>

    where <math|Z<around|(|t|)>> is a real-valued function.
  </definition>

  <\theorem>
    [Phase Preservation] For the monotonized theta function, we define:

    <\equation>
      <wide|Z|~><around|(|t|)>=e<rsup|i*<wide|\<theta\>|~><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>
    </equation>

    This function satisfies:

    <\equation>
      <wide|Z|~><around|(|t|)>=<choice|<tformat|<table|<row|<cell|e<rsup|2*i*\<theta\><around|(|a|)>>*Z<around|(|t|)><rsup|\<ast\>>>|<cell|<text|for
      >t\<in\><around|[|0,a|]>>>|<row|<cell|Z<around|(|t|)>>|<cell|<text|for
      >t\<gtr\>a>>>>>
    </equation>

    where <math|Z<around|(|t|)><rsup|\<ast\>>> represents the complex
    conjugate of <math|Z<around|(|t|)>>.
  </theorem>

  <\proof>
    For <math|t\<gtr\>a>:

    <\align>
      <tformat|<table|<row|<cell|<wide|Z|~><around|(|t|)>>|<cell|=e<rsup|i*<wide|\<theta\>|~><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)><eq-number>>>|<row|<cell|>|<cell|=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)><eq-number>>>|<row|<cell|>|<cell|=e<rsup|i*\<theta\><around|(|t|)>>\<cdot\>e<rsup|-i*\<theta\><around|(|t|)>>*Z<around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=Z<around|(|t|)><eq-number>>>>>
    </align>

    For <math|t\<in\><around|[|0,a|]>>:

    <\align>
      <tformat|<table|<row|<cell|<wide|Z|~><around|(|t|)>>|<cell|=e<rsup|i*<wide|\<theta\>|~><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)><eq-number>>>|<row|<cell|>|<cell|=e<rsup|i*<around|(|2*\<theta\><around|(|a|)>-\<theta\><around|(|t|)>|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)><eq-number>>>|<row|<cell|>|<cell|=e<rsup|2*i*\<theta\><around|(|a|)>>\<cdot\>e<rsup|-i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)><eq-number>>>|<row|<cell|>|<cell|=e<rsup|2*i*\<theta\><around|(|a|)>>\<cdot\>Z<around|(|t|)><eq-number>>>>>
    </align>

    Since <math|Z<around|(|t|)>> is real-valued for the Riemann zeta function
    on the critical line, <math|Z<around|(|t|)>=Z<around|(|t|)><rsup|\<ast\>>>,
    thus:

    <\equation>
      <wide|Z|~><around|(|t|)>=e<rsup|2*i*\<theta\><around|(|a|)>>*Z<around|(|t|)><rsup|\<ast\>>
    </equation>
  </proof>

  <\corollary>
    [Zero Preservation] The zeros of <math|\<zeta\><around|(|s|)>> on the
    critical line <math|s=<frac|1|2>+i*t> correspond precisely to:

    <\enumerate>
      <item>The zeros of <math|Z<around|(|t|)>> for <math|t\<gtr\>0>

      <item>The zeros of <math|<wide|Z|~><around|(|t|)>> for <math|t\<gtr\>0>
    </enumerate>

    Therefore, the monotonization preserves all information about the zeros
    of the zeta function.
  </corollary>

  <\proof>
    From the definition of <math|Z<around|(|t|)>>:

    <\equation>
      \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=e<rsup|-i*\<theta\><around|(|t|)>>*Z<around|(|t|)>
    </equation>

    If <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>=0>, then
    <math|Z<around|(|t|)>=0> since <math|e<rsup|-i*\<theta\><around|(|t|)>>\<neq\>0>
    for all <math|t>.

    From Theorem 4 (Phase Preservation), for <math|t\<gtr\>a>:

    <\equation>
      <wide|Z|~><around|(|t|)>=Z<around|(|t|)>
    </equation>

    Therefore, for <math|t\<gtr\>a>, <math|<wide|Z|~><around|(|t|)>=0> if and
    only if <math|Z<around|(|t|)>=0>, which occurs if and only if
    <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>=0>.

    For <math|t\<in\><around|[|0,a|]>>:

    <\equation>
      <wide|Z|~><around|(|t|)>=e<rsup|2*i*\<theta\><around|(|a|)>>*Z<around|(|t|)><rsup|\<ast\>>
    </equation>

    Since <math|e<rsup|2*i*\<theta\><around|(|a|)>>\<neq\>0> and
    <math|Z<around|(|t|)>> is real-valued,
    <math|Z<around|(|t|)><rsup|\<ast\>>=Z<around|(|t|)>>. Therefore,
    <math|<wide|Z|~><around|(|t|)>=0> if and only if
    <math|Z<around|(|t|)>=0>, which occurs if and only if
    <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>=0>.

    Thus, for all <math|t\<gtr\>0>, the zeros of
    <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>> correspond exactly to the
    zeros of both <math|Z<around|(|t|)>> and <math|<wide|Z|~><around|(|t|)>>.
  </proof>

  <\proposition>
    [Bijectivity] The function <math|<wide|\<theta\>|~><around|(|t|)>:<around|[|0,\<infty\>|)>\<to\><around|[|<wide|\<theta\>|~><around|(|0|)>,\<infty\>|)>>
    is bijective.
  </proposition>

  <\proof>
    \;

    <\enumerate-numeric>
      <item>Injectivity: For any <math|t<rsub|1>,t<rsub|2>\<geq\>0> with
      <math|t<rsub|1>\<neq\>t<rsub|2>>, we need to show
      <math|<wide|\<theta\>|~><around|(|t<rsub|1>|)>\<neq\><wide|\<theta\>|~><around|(|t<rsub|2>|)>>.

      <\enumerate-roman>
        <item>If <math|t<rsub|1>,t<rsub|2>\<less\>a> or
        <math|t<rsub|1>,t<rsub|2>\<gtr\>a>, then injectivity follows from the
        strict monotonicity of <math|<wide|\<theta\>|~><around|(|t|)>> on
        each of these intervals, as proven in Theorem 2.

        <item> If <math|t<rsub|1>\<less\>a\<less\>t<rsub|2>>, then from
        monotonicity, <math|<wide|\<theta\>|~><around|(|t<rsub|1>|)>\<less\><wide|\<theta\>|~><around|(|a|)>\<less\><wide|\<theta\>|~><around|(|t<rsub|2>|)>>,
        which implies <math|<wide|\<theta\>|~><around|(|t<rsub|1>|)>\<neq\><wide|\<theta\>|~><around|(|t<rsub|2>|)>>

        <item>If <math|t<rsub|1>=a> and <math|t<rsub|2>\<neq\>a>, then from
        the strict monotonicity of <math|<wide|\<theta\>|~><around|(|t|)>>
        except at <math|t=a>, we have <math|<wide|\<theta\>|~><around|(|t<rsub|1>|)>=<wide|\<theta\>|~><around|(|a|)>\<neq\><wide|\<theta\>|~><around|(|t<rsub|2>|)>>
      </enumerate-roman>

      <item>Surjectivity: There exists <math|t\<geq\>0> such that
      <math|<wide|\<theta\>|~><around|(|t|)>=y>\<forall\><math|y\<in\><around|[|<wide|\<theta\>|~><around|(|0|)>,\<infty\>|)>>.

      For <math|y=<wide|\<theta\>|~><around|(|0|)>>, we have <math|t=0>.

      For <math|y\<gtr\><wide|\<theta\>|~><around|(|0|)>>, since
      <math|<wide|\<theta\>|~><around|(|t|)>> is continuous and strictly
      increasing for <math|t\<gtr\>0> (except at <math|t=a> where it's still
      continuous and non-decreasing), and since
      <math|lim<rsub|t\<to\>\<infty\>> <wide|\<theta\>|~><around|(|t|)>=\<infty\>>
      (which follows from the fact that <math|\<theta\><around|(|t|)>> grows
      without bound as <math|t\<to\>\<infty\>>), by the intermediate value
      theorem, there exists a unique <math|t\<gtr\>0> such that
      <math|<wide|\<theta\>|~><around|(|t|)>=y>.

      Therefore, <math|<wide|\<theta\>|~><around|(|t|)>> is both injective
      and surjective, hence bijective.
    </enumerate-numeric>
  </proof>

  \;

  <\theorem>
    [Modulating Function Criteria] The constructed function
    <math|<wide|\<theta\>|~><around|(|t|)>> satisfies all criteria for a
    modulating function:

    <\enumerate>
      <item>Piecewise continuous with piecewise continuous first derivative.

      <item>Monotonically increasing with
      <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<geq\>0>, with
      equality only on a set of measure zero (the single point <math|t=a>).

      <item>Bijective with <math|lim<rsub|t\<to\>\<infty\>>
      <wide|\<theta\>|~><around|(|t|)>=\<infty\>>.
    </enumerate>
  </theorem>

  <\proof>
    \;

    <\enumerate-numeric>
      <item> Piecewise continuity with piecewise continuous first derivative:
      From Proposition 2, <math|<wide|\<theta\>|~><around|(|t|)>> is
      continuous everywhere and <math|C<rsup|1>> continuous everywhere.
      Therefore, it is piecewise continuous with piecewise continuous first
      derivative.

      <item>Monotonically increasing with non-negative derivative: From
      Theorem 2, <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<gtr\>0>
      for all <math|t\<neq\>a> and <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|a|)>=0>.
      Therefore, <math|<wide|\<theta\>|~><around|(|t|)>> is monotonically
      increasing with non-negative derivative, with equality only at the
      single point <math|t=a>, which is a set of measure zero.

      <item>Bijectivity with limit at infinity: From Proposition 3,
      <math|<wide|\<theta\>|~><around|(|t|)>:<around|[|0,\<infty\>|)>\<to\><around|[|<wide|\<theta\>|~><around|(|0|)>,\<infty\>|)>>
      is bijective. Since <math|<wide|\<theta\>|~><around|(|t|)>=\<theta\><around|(|t|)>>
      for <math|t\<gtr\>a>, and since <math|lim<rsub|t\<to\>\<infty\>>
      \<theta\><around|(|t|)>=\<infty\>> (which follows from the asymptotic
      behavior of the theta function), we have
      <math|lim<rsub|t\<to\>\<infty\>> <wide|\<theta\>|~><around|(|t|)>=\<infty\>>
    </enumerate-numeric>

    Therefore, <math|<wide|\<theta\>|~><around|(|t|)>> satisfies all criteria
    for a modulating function.
  </proof>

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
    <associate|auto-3|<tuple|3|6>>
    <associate|auto-4|<tuple|3|9>>
    <associate|bib-crowley|<tuple|crowley|9>>
    <associate|bib-loeve|<tuple|loeve|9>>
    <associate|ucp|<tuple|3|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Riemann-Siegel Theta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Exact
      Monotonization Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Phase
      Information Preservation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>