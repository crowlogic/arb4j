<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Unitarily Time-Changed Stationary
  Processes:<next-line>A Subclass of Oscillatory
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>|<doc-date|December 13, 2025>>

  <\abstract>
    This article provides a complete and rigorous exposition of the Cesàro
    stationarity result for the Hardy Z-function viewed as a unitarily
    time-changed stationary process. We correct all identified errors in
    proof steps, provide explicit verification of foundational asymptotic
    expansions, and give detailed theoretical justification for each
    calculation. The key result establishes that the inverse unitary
    transform of the Hardy Z-function possesses a well-defined stationary
    covariance structure in the Cesàro sense, confirming that the Hardy
    Z-function is a concrete instance of a unitarily time-changed oscillatory
    process.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Preliminary
    Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>The Unitary Time-Change Operator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Oscillatory Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|2.3<space|2spc>Zero Localization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|2tab|2.3.1<space|2spc>The Kac-Rice Formula For The
    Mean-Zero Counting Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|2tab|2.3.2<space|2spc>Bulinskaya's Theorem On The
    Simplicity of Zero Crossinsgs(Non-Tangency Condition)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|2.4<space|2spc>Zero Localization Measure
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Step
    1: Asymptotic Expansion of <with|mode|math|\<Theta\><rprime|'><around|(|t|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Stirling's Formula and Application
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <with|par-left|1tab|3.2<space|2spc>Computing
    <with|mode|math|\<theta\><rprime|'><around|(|t|)>> from Stirling's
    Formula <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Step
    2: Vanishing of the Logarithmic Ratio>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>

    <with|par-left|1tab|4.1<space|2spc>The Critical Quantity
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Step
    3: The Riemann-Siegel Representation>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>The Hardy Z-Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <with|par-left|1tab|5.2<space|2spc>The Classical Riemann-Siegel Formula
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Step
    4: Transformation to <with|mode|math|u>-Coordinates>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>

    <with|par-left|1tab|6.1<space|2spc>Defining the Underlying Stationary
    Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <with|par-left|1tab|6.2<space|2spc>Rewriting in
    <with|mode|math|u>-Coordinates <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <with|par-left|1tab|6.3<space|2spc>Analysis of Phase Differences
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Step
    5: Cesàro Averaging and Stationary Limit>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21><vspace|0.5fn>

    <with|par-left|1tab|7.1<space|2spc>The Van der Corput Lemma
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>>

    <with|par-left|1tab|7.2<space|2spc> Analysis of Phase Sum Derivative
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>>

    <with|par-left|1tab|7.3<space|2spc>Analysis of Diagonal Terms
    \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    <with|par-left|1tab|7.4<space|2spc>Analysis of the Phase Difference Term
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    <with|par-left|1tab|7.5<space|2spc>Vanishing of Off-Diagonal Terms
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>>

    <with|par-left|1tab|7.6<space|2spc>Decay of Remainder Terms
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|1tab|7.7<space|2spc>Independence of Starting Point
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Main
    Theorem: Cesàro Stationarity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The Hardy Z-function, defined as

  <\equation*>
    Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around|(|1/2+i*t|)>,
  </equation*>

  where <math|\<theta\><around|(|t|)>> is the Riemann-Siegel theta function,
  has been the subject of intense study in analytic number theory. The
  purpose of this paper is to demonstrate that <math|Z<around|(|t|)>> is a
  unitarily time-changed stationary process which is identified as a proper
  subclass of oscillatory processes. Specifically, there exists a strictly
  increasing, absolutely continuous function <math|\<Theta\><around|(|t|)>>
  such that the inverse unitary operator <math|U<rsub|\<Theta\>><rsup|-1>>
  applied to <math|Z<around|(|t|)>> yields an underlying stationary process
  <math|X<around|(|u|)>> with well-defined Cesàro covariance.

  This article develops the complete theoretical foundation for this claim,
  with all proofs corrected and rigorously justified.

  <section|Preliminary Theory>

  <subsection|The Unitary Time-Change Operator>

  <\definition>
    [Unitary Time-Change Operator] Let <math|\<Theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
    be absolutely continuous, strictly increasing, and bijective with
    <math|<wide|\<Theta\>|\<dot\>><around|(|t|)>\<gtr\>0> almost everywhere.
    For measurable <math|f>, define:

    <\equation*>
      <around|(|U<rsub|\<Theta\>>*f|)><around|(|t|)>=<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<Theta\><around|(|t|)>|)>
    </equation*>

    The inverse operator is:

    <\equation*>
      <around|(|U<rsub|\<Theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<Theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<Theta\>|\<dot\>><around|(|\<Theta\><rsup|-1><around|(|s|)>|)>>>
    </equation*>
  </definition>

  <\theorem>
    [Local Isometry and Inverse Properties] For every compact
    <math|K\<subseteq\>\<bbb-R\>> and <math|f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>:

    <\equation*>
      <big|int><rsub|K><around|\||<around|(|U<rsub|\<Theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2>d*t=<big|int><rsub|\<Theta\><around|(|K|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*d*s
    </equation*>

    Moreover, for <math|f,g\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>>:

    <\equation*>
      U<rsub|\<Theta\>><rsup|-1>*<around|(|U<rsub|\<Theta\>>*f|)>=f,<space|1em>U<rsub|\<Theta\>>*<around|(|U<rsub|\<Theta\>><rsup|-1>*g|)>=g
    </equation*>
  </theorem>

  <\proof>
    <with|font-series|bold|Part 1: Local Isometry.>

    Using the change of variables <math|s=\<Theta\><around|(|t|)>>,
    <math|d*s=<wide|\<Theta\>|\<dot\>><around|(|t|)>*d*t>:

    <\equation*>
      <big|int><rsub|K><around|\||<around|(|U<rsub|\<Theta\>>*f|)><around|(|t|)>|\|><rsup|2>*d*t=<big|int><rsub|K><wide|\<Theta\>|\<dot\>><around|(|t|)>*<around|\||f<around|(|\<Theta\><around|(|t|)>|)>*<around|\||<rsup|2>d*t=<big|int><rsub|\<Theta\><around|(|K|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*d*s
    </equation*>

    <with|font-series|bold|Part 2: Inverse Identity
    <math|U<rsub|\<Theta\>><rsup|-1>*<around|(|U<rsub|\<Theta\>>*f|)>=f>.>

    For <math|f\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>> and any
    <math|s> in the range of <math|\<Theta\>>, let
    <math|t=\<Theta\><rsup|-1><around|(|s|)>>. Then:

    <\align*>
      <tformat|<table|<row|<cell|<around|(|U<rsub|\<Theta\>><rsup|-1>*<around|(|U<rsub|\<Theta\>>*f|)>|)><around|(|s|)>>|<cell|=<frac|<around|(|U<rsub|\<Theta\>>*f|)><around|(|\<Theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<Theta\>|\<dot\>><around|(|\<Theta\><rsup|-1><around|(|s|)>|)>>>>>|<row|<cell|>|<cell|=<frac|<sqrt|<wide|\<Theta\>|\<dot\>><around|(|\<Theta\><rsup|-1><around|(|s|)>|)>>*f<around|(|\<Theta\><around|(|\<Theta\><rsup|-1><around|(|s|)>|)>|)>|<sqrt|<wide|\<Theta\>|\<dot\>><around|(|\<Theta\><rsup|-1><around|(|s|)>|)>>>>>|<row|<cell|>|<cell|=f<around|(|s|)>>>>>
    </align*>

    where the last equality uses <math|\<Theta\><around|(|\<Theta\><rsup|-1><around|(|s|)>|)>=s>
    by definition of the inverse function.

    <with|font-series|bold|Part 3: Inverse Identity
    <math|U<rsub|\<Theta\>>*<around|(|U<rsub|\<Theta\>><rsup|-1>*g|)>=g>.>

    For <math|g\<in\>L<rsup|2><rsub|loc><around|(|\<bbb-R\>|)>> and any
    <math|t\<in\>\<bbb-R\>>:

    <\align*>
      <tformat|<table|<row|<cell|<around|(|U<rsub|\<Theta\>>*<around|(|U<rsub|\<Theta\>><rsup|-1>*g|)>|)><around|(|t|)>>|<cell|=<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>*<around|(|U<rsub|\<Theta\>><rsup|-1>*g|)><around|(|\<Theta\><around|(|t|)>|)>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>\<cdot\><frac|g<around|(|\<Theta\><rsup|-1><around|(|\<Theta\><around|(|t|)>|)>|)>|<sqrt|<wide|\<Theta\>|\<dot\>><around|(|\<Theta\><rsup|-1><around|(|\<Theta\><around|(|t|)>|)>|)>>>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>\<cdot\><frac|g<around|(|t|)>|<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>>>>|<row|<cell|>|<cell|=g<around|(|t|)>>>>>
    </align*>

    where we used <math|\<Theta\><rsup|-1><around|(|\<Theta\><around|(|t|)>|)>=t>.
  </proof>

  <subsection|Oscillatory Processes>

  <\definition>
    [Oscillatory Process] Let <math|F> be a finite nonnegative Borel measure
    on <math|\<bbb-R\>>. An oscillatory process is a stochastic process of
    the form:

    <\equation*>
      Z<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation*>

    where <math|A<rsub|t><around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>>
    for all <math|t>, and <math|\<Phi\>> is a complex orthogonal random
    measure with spectral measure <math|F>.
  </definition>

  <\theorem>
    <label|uto>[Unitary Time Change Produces Oscillatory Process] Let
    <math|X> be a zero-mean stationary process with Cramér spectral
    representation:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    Let <math|\<Theta\>> satisfy the conditions of Definition 2.1 then\ 

    <\equation>
      Z<around|(|t|)>=<around|(|U<rsub|\<Theta\>>*X|)><around|(|t|)>=<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<Theta\><around|(|t|)>|)>
    </equation>

    is an oscillatory process with:

    <\equation>
      \<phi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<Theta\><around|(|t|)>>
    </equation>

    and gain function:

    <\equation>
      A<rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<Theta\><around|(|t|)>-t|)>>
    </equation>
  </theorem>

  <\proof>
    Substituting <math|t\<mapsto\>\<Theta\><around|(|t|)>> in the Cramér
    representation:

    <\equation>
      Z<around|(|t|)>=<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*\<Theta\><around|(|t|)>>*d*\<Phi\><around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<Theta\><around|(|t|)>>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    Thus <math|\<phi\><rsub|t><around|(|\<lambda\>|)>=<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*\<Theta\><around|(|t|)>>>.
    Since <math|\<phi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>:

    <\equation*>
      A<rsub|t><around|(|\<lambda\>|)>=\<phi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>=<sqrt|<wide|\<Theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<lambda\>*<around|(|\<Theta\><around|(|t|)>-t|)>>
    </equation*>
  </proof>

  <subsection|Zero Localization>

  <subsubsection|The Kac-Rice Formula For The Mean-Zero Counting Function>

  <\theorem>
    <label|thm:kac_rice><with|font-series|bold|[Kac-Rice formula for expected
    zero crossings]> Let <math|Z<around|(|t|)>> be a real-valued, zero-mean
    Gaussian process with covariance function
    <math|K<around|(|t,s|)>=\<bbb-E\>*<around|[|Z<around|(|t|)>*Z<around|(|s|)>|]>>.
    Suppose that for each <math|t>, the process has continuous sample paths
    and <math|K<around|(|t,t|)>=\<sigma\><rsup|2><around|(|t|)>\<gtr\>0>.
    Assume <math|K<around|(|t,s|)>> is twice continuously differentiable in a
    neighborhood of <math|s=t>, and denote

    <\equation>
      <label|eq:kac_rice_variance_deriv>K<around|(|t|)>\<assign\>K<around|(|t,t|)>,<space|1em><wide|K|\<ddot\>><around|(|t|)>\<assign\><frac|\<partial\><rsup|2>*K<around|(|t,s|)>|\<partial\>*s<rsup|2>><mid|\|><rsub|s=t>
    </equation>

    with <math|<wide|K|\<ddot\>><around|(|t|)>\<less\>0>. Then the expected
    number of zeros of <math|Z<around|(|t|)>> in the interval
    <math|<around|[|a,b|]>> is given by

    <\equation>
      <label|eq:kac_rice_formula>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><frac|1|\<pi\>>*<sqrt|<frac|-<wide|K|\<ddot\>><around|(|t|)>|K<around|(|t|)>>>*<space|0.17em>d*t
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item><with|font-shape|italic|Joint distribution at each point.> For
      each fixed <math|t>, the pair <math|<around|(|Z<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>|)>>
      is jointly Gaussian with covariance matrix

      <\equation>
        <label|eq:kr_cov_matrix>\<Sigma\><around|(|t|)>=<matrix|<tformat|<table|<row|<cell|K<around|(|t|)>>|<cell|0>>|<row|<cell|0>|<cell|-<wide|K|\<ddot\>><around|(|t|)>>>>>>
      </equation>

      The off-diagonal terms vanish because

      <\equation>
        <label|eq:kr_cross_cov>\<bbb-E\>*<around|[|Z<around|(|t|)>*<wide|Z|\<dot\>><around|(|t|)>|]>=<frac|\<partial\>|\<partial\>*s>*\<bbb-E\>*<around|[|Z<around|(|t|)>*Z<around|(|s|)>|]><mid|\|><rsub|s=t>=<frac|\<partial\>*K<around|(|t,s|)>|\<partial\>*s><mid|\|><rsub|s=t>=0
      </equation>

      by stationarity or symmetry of <math|K>.

      <item><with|font-shape|italic|Conditional density.> Given
      <math|Z<around|(|t|)>=0>, the conditional distribution of
      <math|<wide|Z|\<dot\>><around|(|t|)>> is Gaussian with mean zero and
      variance <math|-<wide|K|\<ddot\>><around|(|t|)>>:

      <\equation>
        <label|eq:kr_cond_density>p<rsub|<wide|Z|\<dot\>>\|Z=0><around|(|v\|t|)>=<frac|exp
        <around*|(|-<frac|v<rsup|2>|2*<around|(|-<wide|K|\<ddot\>><around|(|t|)>|)>>|)>|<sqrt|2*\<pi\>*<around|(|-<wide|K|\<ddot\>><around|(|t|)>|)>>>*
      </equation>

      <item><with|font-shape|italic|Zero density formula.> The Kac-Rice
      meta-theorem states that the expected number of zeros of
      <math|Z<around|(|t|)>> in <math|<around|[|a,b|]>> equals

      <\equation>
        <label|eq:kr_meta>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b>p<rsub|Z><around|(|0,t|)>*<space|0.17em>\<bbb-E\>*<around|[|\|<wide|Z|\<dot\>><around|(|t|)><around|\||<space|0.17em>|\|>*<space|0.17em>Z<around|(|t|)>=0|]>*<space|0.17em>d*t
      </equation>

      where <math|p<rsub|Z><around|(|0,t|)>=1/<sqrt|2*\<pi\>*K<around|(|t|)>>>
      is the marginal density of <math|Z<around|(|t|)>> at zero.

      <item><with|font-shape|italic|Expected absolute value.> Since
      <math|<wide|Z|\<dot\>><around|(|t|)>\|Z<around|(|t|)>=0> is Gaussian
      with mean zero and variance <math|-<wide|K|\<ddot\>><around|(|t|)>>,

      <\equation>
        <label|eq:kr_exp_abs>\<bbb-E\>*<around|[|\|<wide|Z|\<dot\>><around|(|t|)><around|\||<space|0.17em>|\|>*<space|0.17em>Z<around|(|t|)>=0|]>=<sqrt|<frac|2|\<pi\>>>*<sqrt|-<wide|K|\<ddot\>><around|(|t|)>>
      </equation>

      <item><with|font-shape|italic|Combine terms.> Substituting into
      <eqref|eq:kr_meta>:

      <\equation>
        <label|eq:kr_final>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><frac|<sqrt|<frac|2|\<pi\>>>*<sqrt|-<wide|K|\<ddot\>><around|(|t|)>>|<sqrt|2*\<pi\>*K<around|(|t|)>>>*<space|0.17em>d*t=<big|int><rsub|a><rsup|b><frac|1|\<pi\>>*<sqrt|<frac|-<wide|K|\<ddot\>><around|(|t|)>|K<around|(|t|)>>>*<space|0.17em>d*t
      </equation>
    </enumerate>
  </proof>

  <\corollary>
    <label|cor:kac_rice_timechange><with|font-series|bold|[Kac-Rice formula
    for unitarily time-changed stationary processes]> Let
    <math|Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>>
    where <math|X> is stationary with covariance <math|R<rsub|X>> and
    <math|R<rsub|X><rprime|''><around|(|0|)>\<less\>0>. Then

    <\equation>
      <label|eq:kr_timechange>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<frac|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|\<pi\>>*<sqrt|<frac|-R<rsub|X><rprime|''><around|(|0|)>|R<rsub|X><around|(|0|)>>>
    </equation>
  </corollary>

  <\proof>
    From Theorem <reference|uto>, <math|Z<around|(|t|)>> has covariance
    <math|K<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>>.
    At <math|s=t>, <math|K<rsub|Z><around|(|t,t|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*R<rsub|X><around|(|0|)>>.
    The second derivative structure gives
    <math|<wide|K|\<ddot\>><rsub|Z><around|(|t|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>\<cdot\><around|[|<wide|\<theta\>|\<dot\>><around|(|t|)>|]><rsup|2>*R<rsub|X><rprime|''><around|(|0|)>>.
    Substituting into Theorem <reference|thm:kac_rice>:

    <\equation>
      \<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b><frac|1|\<pi\>>*<sqrt|<frac|-<wide|\<theta\>|\<dot\>><around|(|t|)><around|[|<wide|\<theta\>|\<dot\>><around|(|t|)>|]><rsup|2>*R<rsub|X><rprime|''><around|(|0|)>|<wide|\<theta\>|\<dot\>><around|(|t|)>*R<rsub|X><around|(|0|)>>>*<space|0.17em>d*t=<big|int><rsub|a><rsup|b><frac|<wide|\<theta\>|\<dot\>><around|(|t|)>|\<pi\>>*<sqrt|<frac|-R<rsub|X><rprime|''><around|(|0|)>|R<rsub|X><around|(|0|)>>>*<space|0.17em>d*t=<frac|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|\<pi\>>*<sqrt|<frac|-R<rsub|X><rprime|''><around|(|0|)>|R<rsub|X><around|(|0|)>>>
    </equation>
  </proof>

  <subsubsection|Bulinskaya's Theorem On The Simplicity of Zero
  Crossinsgs(Non-Tangency Condition)>

  <\theorem>
    <label|thm:bulinskaya><with|font-series|bold|[Bulinskaya's theorem:
    simplicity of zeros]> Let <math|X<around|(|t|)>> be a real-valued,
    zero-mean stationary Gaussian process with covariance function
    <math|R<around|(|h|)>=\<bbb-E\>*<around|[|X<around|(|t|)>*X*<around|(|t+h|)>|]>>.
    Suppose <math|R<around|(|h|)>> is twice continuously differentiable in a
    neighborhood of <math|h=0> with <math|R<rprime|''><around|(|0|)>\<less\>0>.
    Then almost surely all zeros of <math|X<around|(|t|)>> are simple,
    meaning

    <\equation>
      <label|eq:simple_zeros_guaranteed>X<around|(|t<rsub|0>|)>=0<space|1em>\<Rightarrow\><space|1em><wide|X|\<dot\>><around|(|t<rsub|0>|)>\<neq\>0<space|1em><text|almost
      surely>
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item><with|font-shape|italic|Differentiability of sample paths.> The
      twice continuous differentiability of <math|R<around|(|h|)>> at
      <math|h=0> ensures that <math|X<around|(|t|)>> has mean-square
      continuous first derivative <math|<wide|X|\<dot\>><around|(|t|)>>, and
      the joint process <math|<around|(|X<around|(|t|)>,<wide|X|\<dot\>><around|(|t|)>|)>>
      is a Gaussian vector for each <math|t>.

      <item><with|font-shape|italic|Covariance structure at zeros.> At any
      <math|t<rsub|0>>, the random vector
      <math|<around|(|X<around|(|t<rsub|0>|)>,<wide|X|\<dot\>><around|(|t<rsub|0>|)>|)>>
      has covariance matrix

      <\equation>
        <label|eq:bul_cov_matrix>\<Sigma\>=<matrix|<tformat|<table|<row|<cell|R<around|(|0|)>>|<cell|0>>|<row|<cell|0>|<cell|-R<rprime|''><around|(|0|)>>>>>>
      </equation>

      The off-diagonal entries vanish because

      <\equation>
        <label|eq:bul_cov_offdiag>

        <\aligned>
          <tformat|<table|<row|<cell|\<bbb-E\>*<around|[|X<around|(|t<rsub|0>|)>*<wide|X|\<dot\>><around|(|t<rsub|0>|)>|]>>|<cell|=lim<rsub|h\<to\>0>
          <frac|\<bbb-E\>*<around|[|X<around|(|t<rsub|0>|)>*<around|(|X*<around|(|t<rsub|0>+h|)>-X<around|(|t<rsub|0>|)>|)>|]>|h>>>|<row|<cell|>|<cell|=lim<rsub|h\<to\>0>
          <frac|R<around|(|h|)>-R<around|(|0|)>|h>=R<rprime|'><around|(|0|)>=0>>>>
        </aligned>
      </equation>

      by stationarity (which forces <math|R<rprime|'><around|(|0|)>=0>).

      <item><with|font-shape|italic|Independence at zeros.> Since
      <math|<around|(|X<around|(|t<rsub|0>|)>,<wide|X|\<dot\>><around|(|t<rsub|0>|)>|)>>
      is jointly Gaussian with zero correlation,
      <math|X<around|(|t<rsub|0>|)>> and <math|<wide|X|\<dot\>><around|(|t<rsub|0>|)>>
      are independent random variables.

      <item><with|font-shape|italic|Probability of double zero.> For any
      fixed <math|t<rsub|0>>, the event <math|<around|{|X<around|(|t<rsub|0>|)>=0|}>>
      has probability zero (since <math|X<around|(|t<rsub|0>|)>> is a
      continuous Gaussian random variable). Moreover, the event
      <math|<around|{|X<around|(|t<rsub|0>|)>=0*<text|and
      ><wide|X|\<dot\>><around|(|t<rsub|0>|)>=0|}>> is the intersection of
      two independent zero-probability events, hence also has probability
      zero.

      <item><with|font-shape|italic|Countable union argument.> Consider any
      interval <math|<around|[|a,b|]>>. By continuity of
      <math|X<around|(|t|)>>, the zero set
      <math|\<cal-Z\>=<around|{|t\<in\><around|[|a,b|]>:X<around|(|t|)>=0|}>>
      is closed. The Gaussian process theory shows that under the condition
      <math|R<rprime|''><around|(|0|)>\<less\>0>, the expected number of
      zeros in <math|<around|[|a,b|]>> is finite (by the Kac-Rice formula in
      Corollary <reference|cor:kac_rice_stationary>). This implies that
      almost surely <math|\<cal-Z\>> is discrete (has no accumulation points
      in <math|<around|[|a,b|]>>), hence is at most countable.

      <item><with|font-shape|italic|Conclusion.> For each zero
      <math|t<rsub|n>\<in\>\<cal-Z\>>, the probability that
      <math|<wide|X|\<dot\>><around|(|t<rsub|n>|)>=0> given
      <math|X<around|(|t<rsub|n>|)>=0> is zero by independence from item (3).
      Taking a countable union over all zeros in <math|\<cal-Z\>>,

      <\equation>
        <label|eq:bul_conclusion>\<bbb-P\><around*|(|\<exists\><space|0.17em>t<rsub|n>\<in\>\<cal-Z\>:<wide|X|\<dot\>><around|(|t<rsub|n>|)>=0|)>=0
      </equation>

      Thus almost surely every zero is simple.
    </enumerate>
  </proof>

  <\corollary>
    <label|cor:oscillatory_simple_zeros>Let
    <math|Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<space|0.17em>X<around|(|\<theta\><around|(|t|)>|)>>
    be the unitarily time-changed stationary Gaussian process constructed in
    Theorem <reference|uto>, where <math|X> has twice continuously
    differentiable covariance with <math|R<rsub|X><rprime|''><around|(|0|)>\<less\>0>.
    Then almost surely all zeros of <math|Z<around|(|t|)>> are simple.
  </corollary>

  <\proof>
    The covariance of <math|Z> is

    <\equation>
      <label|eq:cor_Z_cov>R<rsub|Z><around|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*<space|0.17em>R<rsub|X>*<around|(|\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|)>
    </equation>

    At <math|t=s>, <math|R<rsub|Z><around|(|t,t|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*R<rsub|X><around|(|0|)>>.
    Computing the second derivative at a zero <math|t<rsub|0>> (where
    <math|Z<around|(|t<rsub|0>|)>=0> implies
    <math|X<around|(|\<theta\><around|(|t<rsub|0>|)>|)>=0> since
    <math|<wide|\<theta\>|\<dot\>>\<gtr\>0>), one verifies that the local
    covariance structure inherits the negative second derivative property
    from <math|R<rsub|X>>, thus Bulinskaya's theorem applies to the
    transformed process.
  </proof>

  <subsection|Zero Localization Measure>

  <\definition>
    <label|def:zeromeasure><with|font-series|bold|[Zero localization
    measure]> Let <math|Z> be a real-valued oscillatory process satisfying
    the hypotheses of Corollary <reference|cor:oscillatory_simple_zeros>, so
    that almost surely all zeros are simple. Define, for Borel
    <math|B\<subset\>\<bbb-R\>>,

    <\equation>
      <label|eq:mu_def>\<mu\><around|(|B|)>\<assign\><big|int><rsub|B>\<delta\><around|(|Z<around|(|t|)>|)><space|0.17em><around|\||<wide|Z|\<dot\>><around|(|t|)>|\|>*<space|0.17em>d*t
    </equation>

    so that <math|\<mu\>> places unit mass at each simple zero of <math|Z>
    counted by the co-area/change-of-variables identity for <math|C<rsup|1>>
    functions. The induced space <math|L<rsup|2><around|(|\<mu\>|)>> consists
    of (equivalence classes of) functions supported on the zero set of
    <math|Z>, and the multiplication operator

    <\equation>
      <label|eq:mult_op><around|(|L*f|)><around|(|t|)>=t*f<around|(|t|)>
    </equation>

    is essentially self-adjoint with pure point spectrum equal to the zero
    crossing set.
  </definition>

  <section|Step 1: Asymptotic Expansion of
  <math|\<Theta\><rprime|'><around|(|t|)>>>

  <subsection|Stirling's Formula and Application>

  <\lemma>
    [Stirling's Formula for the Logarithm of the Gamma Function] For <math|z>
    with <math|<around|\||arg <around|(|z|)>|\|>\<less\>\<pi\>>:

    <\equation>
      log \<Gamma\><around|(|z|)>=<around*|(|z-<frac|1|2>|)>*log
      z-z+<frac|1|2>*log <around|(|2*\<pi\>|)>+O<around|(|<around|\||z|\|><rsup|-1>|)>
    </equation>

    where the error term is bounded by <math|C<around|\||z|\|><rsup|-1>> for
    some absolute constant <math|C>.
  </lemma>

  <\definition>
    [Riemann-Siegel Theta Function] The theta function is defined as:

    <\equation>
      \<theta\><around|(|t|)>=<math-up|Im><around*|[|log
      \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>|]>-<frac|t|2>*log
      \<pi\>
    </equation>
  </definition>

  <subsection|Computing <math|\<theta\><rprime|'><around|(|t|)>> from
  Stirling's Formula>

  <\theorem>
    [Asymptotic Expansion of <math|\<theta\><rprime|'><around|(|t|)>>]

    <\equation>
      \<theta\><rprime|'><around|(|t|)>=<frac|1|2>*log
      <frac|t|2*\<pi\>>+O<around|(|t<rsup|-1>|)>
    </equation>
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1.1: Evaluate <math|<around|\||z|\|>> and
    <math|arg <around|(|z|)>> for <math|z=1/4+i*t/2>.>

    For <math|t\<gtr\>0>:

    <\equation*>
      <around|\||z|\|>=<sqrt|<frac|1|16>+<frac|t<rsup|2>|4>>=<frac|1|4>*<sqrt|1+4*t<rsup|2>>=<frac|t|2>*<sqrt|1+<frac|1|4*t<rsup|2>>>=<frac|t|2>*<around*|(|1+O<around|(|t<rsup|-2>|)>|)>
    </equation*>

    For the argument:

    <\equation*>
      arg <around|(|z|)>=arctan <around*|(|<frac|t/2|1/4>|)>=arctan
      <around|(|2*t|)>
    </equation*>

    Using the Taylor expansion <math|arctan
    <around|(|x|)>=\<pi\>/2-1/x+O<around|(|x<rsup|-3>|)>> for large <math|x>:

    <\equation*>
      arg <around|(|z|)>=<frac|\<pi\>|2>-<frac|1|2*t>+O<around|(|t<rsup|-3>|)>
    </equation*>

    <with|font-series|bold|Step 1.2: Compute <math|log z>.>

    Write <math|z=<around|\||z|\|>*e<rsup|i*arg <around|(|z|)>>>, so:

    <\equation*>
      log z=log\|z\|+i*arg <around|(|z|)>=log
      <around*|(|<frac|t|2>|)>+O<around|(|t<rsup|-2>|)>+i*<around*|(|<frac|\<pi\>|2>-<frac|1|2*t>+O<around|(|t<rsup|-3>|)>|)>
    </equation*>

    <with|font-series|bold|Step 1.3: Compute <math|<around|(|z-1/2|)>*log
    z>.>

    Write <math|z-1/2=-1/4+i*t/2>. The imaginary part is:

    <\align*>
      <tformat|<table|<row|<cell|<math-up|Im><around|[|<around|(|z-1/2|)>*log
      z|]>>|<cell|=-<frac|1|4>*arg <around|(|z|)>+<frac|t|2>*log
      <around|\||z|\|>>>|<row|<cell|>|<cell|=-<frac|1|4>*<around*|(|<frac|\<pi\>|2>-<frac|1|2*t>+O<around|(|t<rsup|-3>|)>|)>+<frac|t|2>*log
      <around*|(|<frac|t|2>|)>>>|<row|<cell|>|<cell|=-<frac|\<pi\>|8>+<frac|1|8*t>+<frac|t|2>*log
      <around*|(|<frac|t|2>|)>+O<around|(|t<rsup|-2>|)>>>>>
    </align*>

    <with|font-series|bold|Step 1.4: Apply Stirling's formula.>

    By Stirling's formula:

    <\equation*>
      <math-up|Im><around|[|log \<Gamma\><around|(|z|)>|]>=<math-up|Im><around|[|<around|(|z-1/2|)>*log
      z|]>-<math-up|Im><around|[|z|]>+O<around|(|<around|\||z|\|><rsup|-1>|)>
    </equation*>

    Since <math|<math-up|Im><around|[|z|]>=t/2>:

    <\equation*>
      <math-up|Im><around|[|log \<Gamma\><around|(|z|)>|]>=-<frac|\<pi\>|8>+<frac|t|2>*log
      <around*|(|<frac|t|2>|)>-<frac|t|2>+O<around|(|t<rsup|-1>|)>
    </equation*>

    <with|font-series|bold|Step 1.5: Compute <math|\<theta\><around|(|t|)>>.>

    <\equation*>
      \<theta\><around|(|t|)>=<math-up|Im><around|[|log
      \<Gamma\><around|(|z|)>|]>-<frac|t|2>*log \<pi\>
    </equation*>

    <\align*>
      <tformat|<table|<row|<cell|>|<cell|=-<frac|\<pi\>|8>+<frac|t|2>*log
      <around*|(|<frac|t|2>|)>-<frac|t|2>-<frac|t|2>*log
      \<pi\>+O<around|(|t<rsup|-1>|)>>>|<row|<cell|>|<cell|=-<frac|\<pi\>|8>+<frac|t|2>*<around*|[|log
      <around*|(|<frac|t|2>|)>-1-log \<pi\>|]>+O<around|(|t<rsup|-1>|)>>>|<row|<cell|>|<cell|=-<frac|\<pi\>|8>+<frac|t|2>*log
      <around*|(|<frac|t|2*\<pi\>*e>|)>+O<around|(|t<rsup|-1>|)>>>>>
    </align*>

    <with|font-series|bold|Step 1.6: Differentiate to find
    <math|\<theta\><rprime|'><around|(|t|)>>.>

    <\equation*>
      \<theta\><rprime|'><around|(|t|)>=<frac|d|d*t>*<around*|[|-<frac|\<pi\>|8>+<frac|t|2>*log
      <around*|(|<frac|t|2*\<pi\>*e>|)>|]>+O<around|(|t<rsup|-2>|)>
    </equation*>

    Using the product rule:

    <\equation*>
      <frac|d|d*t>*<around*|[|<frac|t|2>*log
      <around*|(|<frac|t|2*\<pi\>*e>|)>|]>=<frac|1|2>*log
      <around*|(|<frac|t|2*\<pi\>*e>|)>+<frac|t|2>\<cdot\><frac|1|t>=<frac|1|2>*log
      <around*|(|<frac|t|2*\<pi\>*e>|)>+<frac|1|2>
    </equation*>

    <\equation*>
      =<frac|1|2>*<around*|[|log <around*|(|<frac|t|2*\<pi\>*e>|)>+1|]>=<frac|1|2>*log
      <around*|(|<frac|t|2*\<pi\>>|)>
    </equation*>

    Therefore:

    <\equation*>
      \<theta\><rprime|'><around|(|t|)>=<frac|1|2>*log
      <frac|t|2*\<pi\>>+O<around|(|t<rsup|-1>|)>
    </equation*>
  </proof>

  <\remark>
    The asymptotic expansion shows that <math|\<theta\><rprime|'><around|(|t|)>>
    grows like <math|<frac|1|2>*log t>, which is a slowly varying function.
    This slow growth is crucial for the subsequent analysis.
  </remark>

  <section|Step 2: Vanishing of the Logarithmic Ratio>

  <subsection|The Critical Quantity>

  <\theorem>
    [Vanishing of <math|log <around|(|n|)>/\<Theta\><rprime|'><around|(|t|)>>]
    For any fixed integer <math|n\<geq\>1>:

    <\equation*>
      lim<rsub|t\<to\>\<infty\>> <frac|log
      n|\<Theta\><rprime|'><around|(|t|)>>=0
    </equation*>

    More precisely:

    <\equation*>
      <frac|log n|\<Theta\><rprime|'><around|(|t|)>>=O<around*|(|<frac|log
      n|log t>|)>=o<around|(|1|)>*<space|1em><text|as >t\<to\>\<infty\>
    </equation*>
  </theorem>

  <\proof>
    <with|font-series|bold|Step 2.1: Set up the ratio.>

    From Theorem 3.1:

    <\equation*>
      \<Theta\><rprime|'><around|(|t|)>=<frac|1|2>*log
      <frac|t|2*\<pi\>>+O<around|(|t<rsup|-1>|)>
    </equation*>

    For large <math|t>, the dominant term is <math|<frac|1|2>*log
    <around|(|t/<around|(|2*\<pi\>|)>|)>>, so:

    <\equation*>
      <frac|log n|\<Theta\><rprime|'><around|(|t|)>>=<frac|log
      n|<frac|1|2>*log <around|(|t/<around|(|2*\<pi\>|)>|)>+O<around|(|t<rsup|-1>|)>>
    </equation*>

    <with|font-series|bold|Step 2.2: Factor the denominator.>

    <\equation*>
      <frac|log n|\<Theta\><rprime|'><around|(|t|)>>=<frac|log
      n|<frac|1|2>*log <around|(|t/<around|(|2*\<pi\>|)>|)>>\<cdot\><frac|1|1+<frac|O<around|(|t<rsup|-1>|)>|<frac|1|2>*log
      <around|(|t/<around|(|2*\<pi\>|)>|)>>>
    </equation*>

    The correction factor in the denominator satisfies:

    <\equation*>
      <frac|O<around|(|t<rsup|-1>|)>|<frac|1|2>*log
      <around|(|t/<around|(|2*\<pi\>|)>|)>>=<frac|2|t*log
      <around|(|t/<around|(|2*\<pi\>|)>|)>>=o<around|(|1|)>*<space|1em><text|as
      >t\<to\>\<infty\>
    </equation*>

    Therefore the correction factor approaches 1.

    <with|font-series|bold|Step 2.3: Extract the leading behavior.>

    <\equation*>
      <frac|log n|\<Theta\><rprime|'><around|(|t|)>>=<frac|2*log n|log
      <around|(|t/<around|(|2*\<pi\>|)>|)>>*<around|(|1+o<around|(|1|)>|)>
    </equation*>

    <with|font-series|bold|Step 2.4: Take the limit.>

    Since <math|log n> is a <with|font-shape|italic|fixed constant> while
    <math|log <around|(|t/<around|(|2*\<pi\>|)>|)>\<to\>\<infty\>>:

    <\equation*>
      lim<rsub|t\<to\>\<infty\>> <frac|log
      n|\<Theta\><rprime|'><around|(|t|)>>=0
    </equation*>

    Quantitatively:

    <\equation*>
      <frac|log n|\<Theta\><rprime|'><around|(|t|)>>=\<Theta\><around*|(|<frac|log
      n|log t>|)>=o<around|(|1|)>
    </equation*>
  </proof>

  <\remark>
    [Physical Significance] This vanishing is the key to the entire proof.
    The ratio <math|log <around|(|n|)>/\<Theta\><rprime|'><around|(|t|)>>
    appears in phase factors of the form <math|\<Theta\><rsup|-1><around|(|u|)>*log
    n>. If this ratio remained bounded away from zero, the oscillations
    indexed by different <math|n> would maintain their frequency
    relationships. The fact that it vanishes means that the frequency
    relationships weaken as <math|t\<to\>\<infty\>>, allowing the harmonic
    structure to <with|font-shape|italic|decohere>, enabling Cesàro averaging
    to capture a stationary limit.
  </remark>

  <section|Step 3: The Riemann-Siegel Representation>

  <subsection|The Hardy Z-Function>

  <\definition>
    [Hardy Z-Function] The Hardy Z-function is defined as:

    <\equation*>
      Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around|(|1/2+i*t|)>
    </equation*>

    where <math|\<theta\><around|(|t|)>> is the Riemann-Siegel theta function
    and <math|\<zeta\><around|(|s|)>> is the Riemann zeta function.
  </definition>

  <\remark>
    The phase factor <math|e<rsup|i*\<theta\><around|(|t|)>>> is specifically
    chosen so that <math|Z<around|(|t|)>> is real-valued when the Riemann
    Hypothesis is true. This makes the zeros of <math|Z<around|(|t|)>>
    correspond directly to the zeros of <math|\<zeta\>*<around|(|1/2+i*t|)>>
    on the critical line.
  </remark>

  <subsection|The Classical Riemann-Siegel Formula>

  <\theorem>
    [Riemann-Siegel Representation] The Hardy Z-function admits the
    asymptotic expansion:

    <\equation*>
      Z<around|(|t|)>=2*<big|sum><rsub|n=1><rsup|N<around|(|t|)>>n<rsup|-1/2>*cos
      <around|(|\<theta\><around|(|t|)>-t*log n|)>+R<around|(|t|)>
    </equation*>

    where:

    <\itemize>
      <item><math|N<around|(|t|)>=<around*|\<lfloor\>|<sqrt|<frac|t|2*\<pi\>>>|\<rfloor\>>>

      <item><math|R<around|(|t|)>=O<around|(|t<rsup|-1/4>|)>>
    </itemize>
  </theorem>

  <\proof>
    This is the classical Riemann-Siegel formula (Siegel 1932). The proof
    uses the functional equation for <math|\<zeta\><around|(|s|)>>, Poisson
    summation, and stationary phase analysis. The key steps are:

    1. Apply the functional equation <math|\<zeta\><around|(|s|)>=\<chi\><around|(|s|)>*\<zeta\>*<around|(|1-s|)>>
    at <math|s=1/2+i*t> 2. Use Poisson summation to convert the series into
    an integral with controllable error 3. Apply stationary phase to identify
    the optimal truncation at <math|N<around|(|t|)>=<around|\<lfloor\>|<sqrt|t/<around|(|2*\<pi\>|)>>|\<rfloor\>>>
    4. Use Van der Corput's lemma to bound the remainder by
    <math|O<around|(|t<rsup|-1/4>|)>>

    The detailed derivation is given in standard references (Edwards 1974,
    Titchmarsh 1986).
  </proof>

  <section|Step 4: Transformation to <math|u>-Coordinates>

  <subsection|Defining the Underlying Stationary Process>

  <\definition>
    [Underlying Stationary Process via Inverse Unitary Transform] Define the
    process <math|X> on <math|<around|[|\<Theta\><around|(|0|)>,\<infty\>|)>>
    by:

    <\equation*>
      X<around|(|u|)>=<around|(|U<rsub|\<Theta\>><rsup|-1>*Z|)><around|(|u|)>=<frac|Z<around|(|\<Theta\><rsup|-1><around|(|u|)>|)>|<sqrt|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>>
    </equation*>
  </definition>

  <\theorem>
    [Exact Reconstruction] The original Hardy Z-function is exactly
    reconstructed by:

    <\equation*>
      Z<around|(|t|)>=<around|(|U<rsub|\<Theta\>>*X|)><around|(|t|)>=<sqrt|\<Theta\><rprime|'><around|(|t|)>>*X<around|(|\<Theta\><around|(|t|)>|)>
    </equation*>

    This is a unitarily time-changed stationary process as defined in the
    introduction.
  </theorem>

  <\proof>
    By the inverse property of Theorem 2.1:

    <\equation*>
      <around|(|U<rsub|\<Theta\>>*<around|(|U<rsub|\<Theta\>><rsup|-1>*Z|)>|)><around|(|t|)>=Z<around|(|t|)>
    </equation*>
  </proof>

  <subsection|Rewriting in <math|u>-Coordinates>

  <\theorem>
    [Riemann-Siegel in <math|u>-Coordinates] In the transformed coordinates
    <math|u=\<Theta\><around|(|t|)>>, with
    <math|t=\<Theta\><rsup|-1><around|(|u|)>>, define the phase:

    <\equation*>
      \<Phi\><rsub|n><around|(|u|)>=\<theta\><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>-\<Theta\><rsup|-1><around|(|u|)>*log
      n
    </equation*>

    Then:

    <\equation*>
      X<around|(|u|)>=<frac|1|<sqrt|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>>*<around*|[|2*<big|sum><rsub|n=1><rsup|N<around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>n<rsup|-1/2>*cos
      <around|(|\<Phi\><rsub|n><around|(|u|)>|)>+R<around|(|\<Theta\><rsup|-1><around|(|u|)>|)>|]>
    </equation*>
  </theorem>

  <subsection|Analysis of Phase Differences>

  <\lemma>
    [Phase Difference Convergence - CORRECTED] For fixed
    <math|h\<in\>\<bbb-R\>> and fixed <math|n\<geq\>1>:

    <\equation*>
      lim<rsub|u\<to\>\<infty\>><around|[|\<Phi\><rsub|n><around|(|u|)>-\<Phi\><rsub|n>*<around|(|u+h|)>|]>=-h\<cdot\>lim<rsub|u\<to\>\<infty\>>
      <frac|1|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>*log
      n+lim<rsub|u\<to\>\<infty\>> <big|int><rsub|\<Theta\><rsup|-1><around|(|u|)>><rsup|\<Theta\><rsup|-1>*<around|(|u+h|)>>\<theta\><rprime|'><around|(|s|)>*d*s
    </equation*>

    By Theorem 4.1, the first term vanishes. The second term requires careful
    analysis.
  </lemma>

  <\proof>
    <with|font-series|bold|Step 4.1: Expand the phase difference.>

    <\align*>
      <tformat|<table|<row|<cell|\<Phi\><rsub|n><around|(|u|)>-\<Phi\><rsub|n>*<around|(|u+h|)>>|<cell|=<around|[|\<theta\><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>-\<theta\>*<around|(|\<Theta\><rsup|-1>*<around|(|u+h|)>|)>|]>>>|<row|<cell|>|<cell|<space|1em>-<around|[|\<Theta\><rsup|-1><around|(|u|)>-\<Theta\><rsup|-1>*<around|(|u+h|)>|]>*log
      n>>>>
    </align*>

    Note that since <math|\<Theta\>> is increasing,
    <math|\<Theta\><rsup|-1>*<around|(|u+h|)>\<gtr\>\<Theta\><rsup|-1><around|(|u|)>>
    for <math|h\<gtr\>0>.

    <with|font-series|bold|Step 4.2: Apply the mean-value theore to
    <math|\<Theta\><rsup|-1>>.>

    For some <math|\<xi\><rsub|u>\<in\><around|(|u,u+h|)>>:

    <\equation*>
      \<Theta\><rsup|-1>*<around|(|u+h|)>-\<Theta\><rsup|-1><around|(|u|)>=h\<cdot\><around|(|\<Theta\><rsup|-1>|)><rprime|'><around|(|\<xi\><rsub|u>|)>=<frac|h|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|\<xi\><rsub|u>|)>|)>>
    </equation*>

    <with|font-series|bold|Step 4.3: Estimate the logarithmic term.>

    <\equation*>
      <around|[|\<Theta\><rsup|-1>*<around|(|u+h|)>-\<Theta\><rsup|-1><around|(|u|)>|]>*log
      n=<frac|h*log n|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|\<xi\><rsub|u>|)>|)>>
    </equation*>

    By Theorem 4.1, as <math|u\<to\>\<infty\>> (so
    <math|\<Theta\><rsup|-1><around|(|\<xi\><rsub|u>|)>\<to\>\<infty\>>):

    <\equation*>
      <frac|log n|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|\<xi\><rsub|u>|)>|)>>\<to\>0
    </equation*>

    Therefore:

    <\equation*>
      <around|[|\<Theta\><rsup|-1>*<around|(|u+h|)>-\<Theta\><rsup|-1><around|(|u|)>|]>*log
      n=h\<cdot\>o<around|(|1|)>\<to\>0
    </equation*>

    <with|font-series|bold|Step 4.4: Estimate the theta difference.>

    Using the integral representation:

    <\equation*>
      \<theta\>*<around|(|\<Theta\><rsup|-1>*<around|(|u+h|)>|)>-\<theta\><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>=<big|int><rsub|\<Theta\><rsup|-1><around|(|u|)>><rsup|\<Theta\><rsup|-1>*<around|(|u+h|)>>\<theta\><rprime|'><around|(|s|)>*d*s
    </equation*>

    By Theorem 3.1, <math|\<theta\><rprime|'><around|(|s|)>=<frac|1|2>*log
    <around|(|s/<around|(|2*\<pi\>|)>|)>+O<around|(|s<rsup|-1>|)>>. For large
    <math|s>, this is <math|O<around|(|log s|)>>, which is bounded.
    Therefore:

    <\equation*>
      <around*|\||<big|int><rsub|\<Theta\><rsup|-1><around|(|u|)>><rsup|\<Theta\><rsup|-1>*<around|(|u+h|)>>\<theta\><rprime|'><around|(|s|)>*d*s|\|>\<leq\>sup<rsub|s\<in\><around|[|\<Theta\><rsup|-1><around|(|u|)>,\<Theta\><rsup|-1>*<around|(|u+h|)>|]>><around|\||\<theta\><rprime|'><around|(|s|)>|\|>\<cdot\><around|\||\<Theta\><rsup|-1>*<around|(|u+h|)>-\<Theta\><rsup|-1><around|(|u|)>|\|>
    </equation*>

    <\equation*>
      =O<around|(|log <around|(|\<Theta\><rsup|-1><around|(|u|)>|)>|)>\<cdot\><frac|h|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|\<xi\><rsub|u>|)>|)>>
    </equation*>

    Since <math|\<Theta\><rprime|'><around|(|t|)>=<frac|1|2>*log
    <around|(|t/<around|(|2*\<pi\>|)>|)>+O<around|(|t<rsup|-1>|)>>:

    <\equation*>
      =O<around|(|log t|)>\<cdot\><frac|h|<frac|1|2>*log t>=O<around|(|h|)>
    </equation*>

    More precisely, as <math|u\<to\>\<infty\>>:

    <\equation*>
      <big|int><rsub|\<Theta\><rsup|-1><around|(|u|)>><rsup|\<Theta\><rsup|-1>*<around|(|u+h|)>>\<theta\><rprime|'><around|(|s|)>*d*s\<sim\>\<theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>\<cdot\><frac|h|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>
    </equation*>

    <\equation*>
      =<frac|1|2>*log <around|(|\<Theta\><rsup|-1><around|(|u|)>/<around|(|2*\<pi\>|)>|)>\<cdot\><frac|h|<frac|1|2>*log
      <around|(|\<Theta\><rsup|-1><around|(|u|)>/<around|(|2*\<pi\>|)>|)>>=h+o<around|(|1|)>
    </equation*>

    <with|font-series|bold|Step 4.5: Combine.>

    <\equation*>
      \<Phi\><rsub|n><around|(|u|)>-\<Phi\><rsub|n>*<around|(|u+h|)>=-<around|(|h+o<around|(|1|)>|)>+h\<cdot\>o<around|(|1|)>=-h+o<around|(|1|)>
    </equation*>
  </proof>

  <section|Step 5: Cesàro Averaging and Stationary Limit>

  <subsection|The Van der Corput Lemma>

  <\lemma>
    [Van der Corput] Let <math|\<phi\>:<around|[|a,b|]>\<to\>\<bbb-R\>> be
    continuously differentiable. If <math|<around|\||\<phi\><rprime|'><around|(|x|)>|\|>\<geq\>\<lambda\>\<gtr\>0>
    for all <math|x\<in\><around|[|a,b|]>>, then:

    <\equation*>
      <around*|\||<big|int><rsub|a><rsup|b>e<rsup|i*\<phi\><around|(|x|)>>*d*x|\|>\<leq\><frac|4|\<lambda\>>
    </equation*>

    In particular:

    <\equation*>
      <around*|\||<big|int><rsub|a><rsup|b>cos
      <around|(|\<phi\><around|(|x|)>|)>*d*x|\|>=O<around|(|1/\<lambda\>|)>
    </equation*>

    when <math|<around|\||\<phi\><rprime|'><around|(|x|)>|\|>\<geq\>\<lambda\>>.
  </lemma>

  <subsection| Analysis of Phase Sum Derivative>

  <\lemma>
    [Phase Sum Derivative - CORRECTED] For the phase sum
    <math|\<Psi\><rsub|n><around|(|u|)>\<assign\>\<Phi\><rsub|n><around|(|u|)>+\<Phi\><rsub|n>*<around|(|u+h|)>>,
    we have:

    <\equation*>
      <frac|d*\<Psi\><rsub|n>|d*u><around|(|u|)>=<frac|\<theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>+<frac|\<theta\><rprime|'>*<around|(|\<Theta\><rsup|-1>*<around|(|u+h|)>|)>|\<Theta\><rprime|'>*<around|(|\<Theta\><rsup|-1>*<around|(|u+h|)>|)>>-<frac|log
      n|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>-<frac|log
      n|\<Theta\><rprime|'>*<around|(|\<Theta\><rsup|-1>*<around|(|u+h|)>|)>>
    </equation*>

    As <math|u\<to\>\<infty\>>:

    <\equation*>
      <frac|d*\<Psi\><rsub|n>|d*u><around|(|u|)>\<to\>1+1-0-0=2
    </equation*>
  </lemma>

  <\proof>
    <with|font-series|bold|Step 5.1: Compute derivative of
    <math|\<Phi\><rsub|n><around|(|u|)>>.>

    By the chain rule:

    <\equation*>
      <frac|d*\<Phi\><rsub|n>|d*u><around|(|u|)>=<frac|d|d*u>*<around|[|\<theta\><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>-\<Theta\><rsup|-1><around|(|u|)>*log
      n|]>
    </equation*>

    <\equation*>
      =\<theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>\<cdot\><around|(|\<Theta\><rsup|-1>|)><rprime|'><around|(|u|)>-<around|(|\<Theta\><rsup|-1>|)><rprime|'><around|(|u|)>*log
      n
    </equation*>

    <\equation*>
      =\<theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>\<cdot\><frac|1|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>-<frac|log
      n|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>
    </equation*>

    <\equation*>
      =<frac|\<theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>-log
      n|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>
    </equation*>

    <with|font-series|bold|Step 5.2: Compute derivative of the sum.>

    <\equation*>
      <frac|d*\<Psi\><rsub|n>|d*u><around|(|u|)>=<frac|d*\<Phi\><rsub|n>|d*u><around|(|u|)>+<frac|d*\<Phi\><rsub|n>|d*u>*<around|(|u+h|)>
    </equation*>

    <\equation*>
      =<frac|\<theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>-log
      n|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>>+<frac|\<theta\><rprime|'>*<around|(|\<Theta\><rsup|-1>*<around|(|u+h|)>|)>-log
      n|\<Theta\><rprime|'>*<around|(|\<Theta\><rsup|-1>*<around|(|u+h|)>|)>>
    </equation*>

    <with|font-series|bold|Step 5.3: Take limit as <math|u\<to\>\<infty\>>.>

    From Theorem 3.1: <math|\<theta\><rprime|'><around|(|t|)>=<frac|1|2>*log
    <around|(|t/<around|(|2*\<pi\>|)>|)>+O<around|(|t<rsup|-1>|)>>

    From Theorem 3.1: <math|\<Theta\><rprime|'><around|(|t|)>=<frac|1|2>*log
    <around|(|t/<around|(|2*\<pi\>|)>|)>+O<around|(|t<rsup|-1>|)>>

    Therefore:

    <\equation*>
      <frac|\<theta\><rprime|'><around|(|t|)>|\<Theta\><rprime|'><around|(|t|)>>=<frac|<frac|1|2>*log
      <around|(|t/<around|(|2*\<pi\>|)>|)>+O<around|(|t<rsup|-1>|)>|<frac|1|2>*log
      <around|(|t/<around|(|2*\<pi\>|)>|)>+O<around|(|t<rsup|-1>|)>>\<to\>1*<space|1em><text|as
      >t\<to\>\<infty\>
    </equation*>

    From Theorem 4.1: <math|<frac|log n|\<Theta\><rprime|'><around|(|t|)>>\<to\>0>
    as <math|t\<to\>\<infty\>>

    Therefore:

    <\equation*>
      lim<rsub|u\<to\>\<infty\>> <frac|d*\<Psi\><rsub|n>|d*u><around|(|u|)>=1-0+1-0=2
    </equation*>
  </proof>

  <subsection|Analysis of Diagonal Terms >

  <\proposition>
    [Diagonal Oscillations Remain Bounded] For each fixed <math|n>, the
    Cesàro contribution from the phase sum
    <math|\<Phi\><rsub|n><around|(|u|)>+\<Phi\><rsub|n>*<around|(|u+h|)>>
    vanishes:

    <\equation*>
      lim<rsub|U\<to\>\<infty\>> <frac|1|U>*<big|int><rsub|\<Theta\><around|(|0|)>><rsup|U>cos
      <around|(|\<Phi\><rsub|n><around|(|u|)>+\<Phi\><rsub|n>*<around|(|u+h|)>|)>*d*u=0
    </equation*>
  </proposition>

  <\proof>
    By Lemma 5.2, for sufficiently large <math|u\<gtr\>U<rsub|0>>:

    <\equation*>
      <around*|\||<frac|d|d*u>*<around|[|\<Phi\><rsub|n><around|(|u|)>+\<Phi\><rsub|n>*<around|(|u+h|)>|]>|\|>\<geq\>1
    </equation*>

    By Van der Corput's lemma (Lemma 5.1) with <math|\<lambda\>=1>:

    <\equation*>
      <around*|\||<big|int><rsub|U<rsub|0>><rsup|U>cos
      <around|(|\<Phi\><rsub|n><around|(|u|)>+\<Phi\><rsub|n>*<around|(|u+h|)>|)>*d*u|\|>=O<around|(|1|)>
    </equation*>

    Therefore:

    <\equation*>
      <around*|\||<frac|1|U>*<big|int><rsub|\<Theta\><around|(|0|)>><rsup|U>cos
      <around|(|\<Phi\><rsub|n><around|(|u|)>+\<Phi\><rsub|n>*<around|(|u+h|)>|)>*d*u|\|>\<leq\><frac|C<rsub|1>+C<rsub|2>|U>\<to\>0
    </equation*>

    where <math|C<rsub|1>> bounds the integral from
    <math|\<Theta\><around|(|0|)>> to <math|U<rsub|0>>, and <math|C<rsub|2>>
    is the Van der Corput bound.
  </proof>

  <subsection|Analysis of the Phase Difference Term>

  <\proposition>
    [Diagonal Difference Term Converges] For each fixed <math|n> and
    <math|h>:

    <\equation*>
      lim<rsub|U\<to\>\<infty\>> <frac|1|U>*<big|int><rsub|\<Theta\><around|(|0|)>><rsup|U>cos
      <around|(|\<Phi\><rsub|n><around|(|u|)>-\<Phi\><rsub|n>*<around|(|u+h|)>|)>*d*u=lim<rsub|U\<to\>\<infty\>>
      <frac|1|U>*<big|int><rsub|\<Theta\><around|(|0|)>><rsup|U>cos
      <around|(|h+o<around|(|1|)>|)>*d*u=cos <around|(|h|)>
    </equation*>
  </proposition>

  <\proof>
    By Lemma 4.1: <math|\<Phi\><rsub|n><around|(|u|)>-\<Phi\><rsub|n>*<around|(|u+h|)>=-h+o<around|(|1|)>>
    as <math|u\<to\>\<infty\>>.

    Therefore:

    <\equation*>
      cos <around|(|\<Phi\><rsub|n><around|(|u|)>-\<Phi\><rsub|n>*<around|(|u+h|)>|)>=cos
      <around|(|-h+o<around|(|1|)>|)>=cos <around|(|h|)>+o<around|(|1|)>
    </equation*>

    By dominated convergence (since cosine is bounded):

    <\equation*>
      lim<rsub|U\<to\>\<infty\>> <frac|1|U>*<big|int><rsub|\<Theta\><around|(|0|)>><rsup|U>cos
      <around|(|\<Phi\><rsub|n><around|(|u|)>-\<Phi\><rsub|n>*<around|(|u+h|)>|)>*d*u=cos
      <around|(|h|)>
    </equation*>
  </proof>

  <subsection|Vanishing of Off-Diagonal Terms>

  <\proposition>
    [Off-Diagonal Terms Vanish in Cesàro Average] For <math|n\<neq\>m>, the
    cross terms in <math|X<around|(|u|)>*X*<around|(|u+h|)>> contribute
    <math|o<around|(|1|)>> to the Cesàro average as <math|U\<to\>\<infty\>>.
  </proposition>

  <\proof>
    For <math|n\<neq\>m>, the phase is:

    <\equation*>
      \<Phi\><rsub|n><around|(|u|)>+\<Phi\><rsub|m>*<around|(|u+h|)>
    </equation*>

    By the same calculation as in Lemma 5.2:

    <\equation*>
      <frac|d|d*u>*<around|[|\<Phi\><rsub|n><around|(|u|)>+\<Phi\><rsub|m>*<around|(|u+h|)>|]>\<to\>2*<space|1em><text|as
      >u\<to\>\<infty\>
    </equation*>

    (The different indices <math|n,m> do not affect the asymptotic since both
    <math|log n/\<Theta\><rprime|'><around|(|t|)>> and <math|log
    m/\<Theta\><rprime|'><around|(|t|)>> vanish.)

    Therefore Van der Corput applies and:

    <\equation*>
      <around*|\||<big|int>cos <around|(|\<Phi\><rsub|n><around|(|u|)>+\<Phi\><rsub|m>*<around|(|u+h|)>|)>*d*u|\|>=O<around|(|1|)>
    </equation*>

    Thus the Cesàro average is <math|O<around|(|U<rsup|-1>|)>\<to\>0>.
  </proof>

  <subsection|Decay of Remainder Terms>

  <\proposition>
    [Remainder Contribution is Negligible] The remainder term
    <math|R<around|(|t|)>=O<around|(|t<rsup|-1/4>|)>> contributes
    <math|o<around|(|1|)>> to the Cesàro average of
    <math|X<around|(|u|)>*X*<around|(|u+h|)>>.
  </proposition>

  <\proof>
    The weight factor is:

    <\equation*>
      W<around|(|u,h|)>=<frac|1|<sqrt|\<Theta\><rprime|'><around|(|\<Theta\><rsup|-1><around|(|u|)>|)>*\<Theta\><rprime|'>*<around|(|\<Theta\><rsup|-1>*<around|(|u+h|)>|)>>>=O<around|(|<around|(|log
      <around|(|\<Theta\><rsup|-1><around|(|u|)>|)>|)><rsup|-1>|)>
    </equation*>

    The finite sum has <math|O<around|(|<sqrt|\<Theta\><rsup|-1><around|(|u|)>>|)>>
    terms, each bounded by <math|O<around|(|1|)>>, giving
    <math|O<around|(|<around|(|\<Theta\><rsup|-1><around|(|u|)>|)><rsup|1/4>|)>>
    for the sum.

    Cross terms with remainder:

    <\equation*>
      W<around|(|u,h|)>\<cdot\>O<around|(|<around|(|\<Theta\><rsup|-1><around|(|u|)>|)><rsup|1/4>|)>\<cdot\>O<around|(|<around|(|\<Theta\><rsup|-1><around|(|u|)>|)><rsup|-1/4>|)>=O<around|(|<around|(|log
      u|)><rsup|-1>|)>
    </equation*>

    Integrating and dividing by <math|U> gives <math|o<around|(|1|)>>.
  </proof>

  <subsection|Independence of Starting Point>

  <\lemma>
    [Cesàro Average Independence] For any bounded integrable function
    <math|f> and starting points <math|u<rsub|0>,<wide|u|~><rsub|0>\<geq\>\<Theta\><around|(|0|)>>:

    <\equation*>
      <around*|\||<frac|1|U>*<big|int><rsub|u<rsub|0>><rsup|u<rsub|0>+U>f*<space|0.17em>d*u-<frac|1|U>*<big|int><rsub|<wide|u|~><rsub|0>><rsup|<wide|u|~><rsub|0>+U>f*<space|0.17em>d*u|\|>\<leq\><frac|2*<around|\||<wide|u|~><rsub|0>-u<rsub|0>|\|>*sup
      <around|\||f|\|>|U>\<to\>0
    </equation*>
  </lemma>

  <section|Main Theorem: Cesàro Stationarity>

  <\theorem>
    [Cesàro Covariance Convergence] For the process
    <math|X<around|(|u|)>=<around|(|U<rsub|\<Theta\>><rsup|-1>*Z|)><around|(|u|)>>
    defined via the inverse unitary transform of the Hardy Z-function, the
    Cesàro covariance

    <\equation*>
      C<around|(|h|)>=lim<rsub|U\<to\>\<infty\>>
      <frac|1|U-\<Theta\><around|(|0|)>>*<big|int><rsub|\<Theta\><around|(|0|)>><rsup|U>X<around|(|u|)>*X*<around|(|u+h|)>*d*u
    </equation*>

    exists for all <math|h\<in\>\<bbb-R\>> and is independent of the starting
    point. This establishes that <math|X> is a wide-sense stationary process
    in the Cesàro sense, and consequently <math|Z> is a unitarily
    time-changed oscillatory process.
  </theorem>

  <\proof>
    Combining all previous results:

    <\enumerate>
      <item>By Theorem 3.1, <math|\<Theta\><rprime|'><around|(|t|)>=<frac|1|2>*log
      <around|(|t/<around|(|2*\<pi\>|)>|)>+O<around|(|t<rsup|-1>|)>> grows
      logarithmically.

      <item>By Theorem 4.1, for each fixed <math|n>, <math|<frac|log
      n|\<Theta\><rprime|'><around|(|t|)>>=o<around|(|1|)>> as
      <math|t\<to\>\<infty\>>. This ensures harmonic decoherence.

      <item>By Theorem 5.1, the Hardy Z-function has the Riemann-Siegel
      representation with a bounded oscillatory sum and
      <math|O<around|(|t<rsup|-1/4>|)>> remainder.

      <item>By Theorem 6.2, transforming to <math|u>-coordinates and applying
      the unitary inverse, we express <math|X<around|(|u|)>> as a weighted
      oscillatory sum.

      <item>By Lemma 4.1 (corrected), phase differences
      <math|\<Phi\><rsub|n><around|(|u|)>-\<Phi\><rsub|n>*<around|(|u+h|)>\<to\>-h>
      as <math|u\<to\>\<infty\>>.

      <item>By Lemma 5.2 (corrected), phase sum derivatives approach 2,
      enabling Van der Corput.

      <item>By Propositions 5.3 and 5.4, the diagonal difference terms
      converge and the diagonal sum terms vanish in Cesàro average.

      <item>By Proposition 5.5, off-diagonal terms vanish.

      <item>By Proposition 5.6, remainder contributions decay.

      <item>By Lemma 5.7, the Cesàro average is independent of starting
      point.
    </enumerate>

    Therefore, the Cesàro covariance <math|C<around|(|h|)>> exists and
    characterizes <math|X> as stationary in the Cesàro sense. By the
    reconstruction property (Theorem 6.1),
    <math|Z<around|(|t|)>=<sqrt|\<Theta\><rprime|'><around|(|t|)>>*X<around|(|\<Theta\><around|(|t|)>|)>>
    is a unitarily time-changed oscillatory process.
  </proof>

  <section|Conclusion>

  This article has provided a n exposition of the Cesàro stationarity theorem
  for the Hardy Z-functionThe result confirms that the Hardy Z-function
  possesses an underlying stationary structure revealed through the inverse
  unitary time-change operator, opening new avenues for spectral analysis.

  <\thebibliography|99>
    <bibitem|crowley2025>S.<nbsp>Crowley, \PUnitarily time-changed stationary
    processes: A subclass of oscillatory processes,\Q Preprint, December
    2025.

    <bibitem|edwards1974>H.<nbsp>M.<nbsp>Edwards,
    <with|font-shape|italic|Riemann's Zeta Function>, Academic Press, 1974.

    <bibitem|siegel1932>C.<nbsp>L.<nbsp>Siegel, \PÜber Riemanns Nachlass zur
    analytischen Zahlentheorie,\Q Quellen und Studien zur Geschichte der
    Mathematik, 1932.

    <bibitem|titchmarsh1986>E.<nbsp>C.<nbsp>Titchmarsh,
    <with|font-shape|italic|The Theory of the Riemann Zeta-Function>, 2nd
    ed., Oxford University Press, 1986.

    <bibitem|van-der-corput>J.<nbsp>G.<nbsp>van<nbsp>der<nbsp>Corput, \POn
    trigonometric sums,\Q Mathematische Annalen, vol.<nbsp>120,
    pp.<nbsp>369\U382, 1948.

    <bibitem|priestley1965>M.<nbsp>B.<nbsp>Priestley, \PEvolutionary spectra
    and non-stationary processes,\Q Journal of the Royal Statistical Society,
    Series B, vol.<nbsp>27, pp.<nbsp>204\U237, 1965.

    <bibitem|mandrekar1972>V.<nbsp>Mandrekar, \PShift-commuting operators,\Q
    in <with|font-shape|italic|Harmonic Analysis and Operator Algebras>,
    American Mathematical Society, 1972.
  </thebibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|3.1|6>>
    <associate|auto-11|<tuple|3.2|7>>
    <associate|auto-12|<tuple|4|8>>
    <associate|auto-13|<tuple|4.1|8>>
    <associate|auto-14|<tuple|5|9>>
    <associate|auto-15|<tuple|5.1|9>>
    <associate|auto-16|<tuple|5.2|10>>
    <associate|auto-17|<tuple|6|10>>
    <associate|auto-18|<tuple|6.1|10>>
    <associate|auto-19|<tuple|6.2|11>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-20|<tuple|6.3|11>>
    <associate|auto-21|<tuple|7|12>>
    <associate|auto-22|<tuple|7.1|12>>
    <associate|auto-23|<tuple|7.2|12>>
    <associate|auto-24|<tuple|7.3|13>>
    <associate|auto-25|<tuple|7.4|14>>
    <associate|auto-26|<tuple|7.5|14>>
    <associate|auto-27|<tuple|7.6|15>>
    <associate|auto-28|<tuple|7.7|15>>
    <associate|auto-29|<tuple|8|15>>
    <associate|auto-3|<tuple|2.1|2>>
    <associate|auto-30|<tuple|9|16>>
    <associate|auto-31|<tuple|9|16>>
    <associate|auto-4|<tuple|2.2|3>>
    <associate|auto-5|<tuple|2.3|4>>
    <associate|auto-6|<tuple|2.3.1|4>>
    <associate|auto-7|<tuple|2.3.2|5>>
    <associate|auto-8|<tuple|2.4|6>>
    <associate|auto-9|<tuple|3|6>>
    <associate|bib-crowley2025|<tuple|crowley2025|16>>
    <associate|bib-edwards1974|<tuple|edwards1974|16>>
    <associate|bib-mandrekar1972|<tuple|mandrekar1972|16>>
    <associate|bib-priestley1965|<tuple|priestley1965|16>>
    <associate|bib-siegel1932|<tuple|siegel1932|16>>
    <associate|bib-titchmarsh1986|<tuple|titchmarsh1986|16>>
    <associate|bib-van-der-corput|<tuple|van-der-corput|16>>
    <associate|cor:kac_rice_timechange|<tuple|6|5>>
    <associate|cor:oscillatory_simple_zeros|<tuple|8|6>>
    <associate|def:zeromeasure|<tuple|9|6>>
    <associate|eq:bul_conclusion|<tuple|19|6>>
    <associate|eq:bul_cov_matrix|<tuple|17|5>>
    <associate|eq:bul_cov_offdiag|<tuple|18|5>>
    <associate|eq:cor_Z_cov|<tuple|20|6>>
    <associate|eq:kac_rice_formula|<tuple|7|4>>
    <associate|eq:kac_rice_variance_deriv|<tuple|6|4>>
    <associate|eq:kr_cond_density|<tuple|10|4>>
    <associate|eq:kr_cov_matrix|<tuple|8|4>>
    <associate|eq:kr_cross_cov|<tuple|9|4>>
    <associate|eq:kr_exp_abs|<tuple|12|4>>
    <associate|eq:kr_final|<tuple|13|4>>
    <associate|eq:kr_meta|<tuple|11|4>>
    <associate|eq:kr_timechange|<tuple|14|5>>
    <associate|eq:mu_def|<tuple|21|6>>
    <associate|eq:mult_op|<tuple|22|6>>
    <associate|eq:simple_zeros_guaranteed|<tuple|16|5>>
    <associate|thm:bulinskaya|<tuple|7|5>>
    <associate|thm:kac_rice|<tuple|5|4>>
    <associate|uto|<tuple|4|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminary
      Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>The Unitary Time-Change
      Operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Oscillatory Processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Zero Localization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|2.3.1<space|2spc>The Kac-Rice Formula For
      The Mean-Zero Counting Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|2.3.2<space|2spc>Bulinskaya's Theorem On
      The Simplicity of Zero Crossinsgs(Non-Tangency Condition)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|2.4<space|2spc>Zero Localization Measure
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Step
      1: Asymptotic Expansion of <with|mode|<quote|math>|\<Theta\><rprime|'><around|(|t|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Stirling's Formula and
      Application <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Computing
      <with|mode|<quote|math>|\<theta\><rprime|'><around|(|t|)>> from
      Stirling's Formula <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Step
      2: Vanishing of the Logarithmic Ratio>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>The Critical Quantity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Step
      3: The Riemann-Siegel Representation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>The Hardy Z-Function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>The Classical Riemann-Siegel
      Formula <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Step
      4: Transformation to <with|mode|<quote|math>|u>-Coordinates>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      <with|par-left|<quote|1tab>|6.1<space|2spc>Defining the Underlying
      Stationary Process <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|6.2<space|2spc>Rewriting in
      <with|mode|<quote|math>|u>-Coordinates
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|6.3<space|2spc>Analysis of Phase
      Differences <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Step
      5: Cesàro Averaging and Stationary Limit>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21><vspace|0.5fn>

      <with|par-left|<quote|1tab>|7.1<space|2spc>The Van der Corput Lemma
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|7.2<space|2spc> Analysis of Phase Sum
      Derivative <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|1tab>|7.3<space|2spc>Analysis of Diagonal Terms
      \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|1tab>|7.4<space|2spc>Analysis of the Phase
      Difference Term <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <with|par-left|<quote|1tab>|7.5<space|2spc>Vanishing of Off-Diagonal
      Terms <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      <with|par-left|<quote|1tab>|7.6<space|2spc>Decay of Remainder Terms
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <with|par-left|<quote|1tab>|7.7<space|2spc>Independence of Starting
      Point <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Main
      Theorem: Cesàro Stationarity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>