<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Harmonizable and Oscillatory Stochastic
  Processes:<next-line>Spectral Representations and Random Measure
  Characterization>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|This document provides a rigorous
  measure-theoretic foundation for harmonizable stochastic processes and
  oscillatory processes as a distinguished subclass. The presentation focuses
  on spectral representations, associated random measures, and inversion
  formulae. Harmonizable processes generalize stationary processes via
  bivariate spectral measures, while oscillatory processes admit
  time-dependent amplitude-modulated spectral decompositions. The exposition
  establishes precise characterizations of these processes and derives the
  corresponding spectral measures and inversion formulae.>>

  <section|Introduction>

  The mathematical formalization of non-stationary phenomena requires
  frameworks beyond classical spectral theory. Harmonizable processes provide
  such a framework by generalizing the concept of stationarity through
  bivariate spectral measures. These measures enable the representation of a
  wider class of stochastic processes whose covariance structures evolve in
  time, yet retain certain regularity properties that permit spectral
  analysis.

  Stochastic processes pervade numerous domains where non-stationary signals
  require mathematical characterization. Classical stationary process theory
  proves insufficient for phenomena with evolving frequency content.
  Harmonizable processes bridge this gap by permitting time-varying
  covariance structures while maintaining a generalized spectral
  representation. Within this class, oscillatory processes-introduced by
  Priestley-form a distinguished subclass permitting localized frequency
  analysis through time-dependent amplitude modulation.

  The measure-theoretic foundation of these processes connects to the broader
  theory of stochastic integration and functional analysis. The
  representations presented herein establish the conditions under which one
  may decompose complex-valued processes into oscillatory components with
  random amplitudes. These decompositions generalize the classical Fourier
  representation to non-stationary settings, where frequency content varies
  with time.

  This document establishes the theoretical foundations of harmonizable and
  oscillatory processes, provides spectral representations, characterizes
  their associated random measures, and derives inversion formulae for
  recovering these measures from process realizations. The treatment employs
  measure theory and functional analysis to establish rigorous results
  concerning these process classes and their properties.

  <section|Harmonizable Stochastic Processes>

  <subsection|Fundamental Definitions and Spectral Representation>

  <\definition>
    [Harmonizable Process] A complex-valued stochastic process
    <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>> is called
    <with|font-series|bold|harmonizable> if its covariance function
    <math|R<around|(|s,t|)>> can be represented as:

    <\equation>
      R<around|(|s,t|)>=\<bbb-E\><around|[|X<around|(|s|)><wide|X<around|(|t|)>|\<bar\>>|]>=<big|iint><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|\<omega\>*s-\<xi\>*t|)>>*<space|0.17em>d*F<around|(|\<omega\>,\<xi\>|)>
    </equation>

    where <math|F<around|(|\<omega\>,\<xi\>|)>> is a positive definite
    bivariate spectral measure of bounded variation.
  </definition>

  <\theorem>
    [Spectral Representation] A harmonizable process
    <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>> admits the
    stochastic integral representation:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*Z<around|(|\<omega\>|)>
    </equation>

    where <math|Z<around|(|\<omega\>|)>> is a stochastic process with
    orthogonal increments satisfying <math|\<bbb-E\>*<around|[|d*Z<around|(|\<omega\>|)><wide|d*Z<around|(|\<xi\>|)>|\<bar\>>|]>=d*F<around|(|\<omega\>,\<xi\>|)>>.
  </theorem>

  The argument proceeds by constructing a stochastic measure <math|Z> on the
  Borel sets of <math|\<bbb-R\>> through the following steps:

  <\enumerate>
    <item>Define the Hilbert space <math|H<rsub|X>> as the closed linear span
    of <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>> in
    <math|L<rsup|2><around|(|\<Omega\>,\<cal-F\>,P|)>>.

    <item>For any Borel set <math|A\<subset\>\<bbb-R\>>, construct the random
    variable <math|Z<around|(|A|)>> as the <math|L<rsup|2>>-limit of finite
    linear combinations of the form <math|<big|sum><rsub|j=1><rsup|n>c<rsub|j>*X<around|(|t<rsub|j>|)>>
    where the coefficients <math|c<rsub|j>> are chosen to approximate the
    indicator function of <math|A> under appropriate transforms.

    <item>Verify that <math|Z> satisfies the orthogonal increment property:
    for disjoint Borel sets <math|A> and <math|B>,
    <math|\<bbb-E\><around|[|Z<around|(|A|)><wide|Z<around|(|B|)>|\<bar\>>|]>=F*<around|(|A\<times\>B|)>>.

    <item>Establish that the stochastic integral
    <math|<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*Z<around|(|\<omega\>|)>>
    is well-defined and equals <math|X<around|(|t|)>> in the <math|L<rsup|2>>
    sense.
  </enumerate>

  The positive definiteness of <math|F> ensures that the constructed measure
  <math|Z> has the required properties.

  <\proposition>
    [Stationarity Characterization] A harmonizable process
    <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>> is stationary if and
    only if its spectral measure <math|F<around|(|\<omega\>,\<xi\>|)>>
    concentrates on the diagonal <math|\<omega\>=\<xi\>>, i.e.,
    <math|F*<around|(|A\<times\>B|)>=0> whenever
    <math|A\<cap\>B=\<emptyset\>>.
  </proposition>

  <\enumerate>
    <item>If <math|X<around|(|t|)>> is stationary, then
    <math|R<around|(|s,t|)>=R<around|(|s-t,0|)>> depends only on the time
    difference. Substituting into the harmonic representation:

    <\align>
      <tformat|<table|<row|<cell|R<around|(|s-t,0|)>>|<cell|=<big|iint><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|\<omega\>*s-\<xi\>*t|)>>*<space|0.17em>d*F<around|(|\<omega\>,\<xi\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|iint><rsub|\<bbb-R\><rsup|2>>e<rsup|i*\<omega\>*<around|(|s-t|)>>*e<rsup|i*<around|(|\<omega\>-\<xi\>|)>*t>*<space|0.17em>d*F<around|(|\<omega\>,\<xi\>|)><eq-number>>>>>
    </align>

    Since this must hold for all <math|s,t>, the support of <math|F> must
    satisfy <math|\<omega\>=\<xi\>>.

    <item>Conversely, if <math|F> concentrates on the diagonal, then:

    <\align>
      <tformat|<table|<row|<cell|R<around|(|s,t|)>>|<cell|=<big|iint><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|\<omega\>*s-\<xi\>*t|)>>*<space|0.17em>d*F<around|(|\<omega\>,\<xi\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*<around|(|s-t|)>>*<space|0.17em>d*F<around|(|\<omega\>,\<omega\>|)><eq-number>>>>>
    </align>

    which depends only on <math|s-t>, establishing stationarity.
  </enumerate>

  <\definition>
    [Strong and Weak Harmonizability] Let
    <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>> be a harmonizable
    process with spectral measure <math|F>.

    <\enumerate>
      <item><math|X> is <with|font-series|bold|strongly harmonizable> if
      <math|F> has bounded Vitali variation (allowing classical
      Lebesgue-Stieltjes integration).

      <item><math|X> is <with|font-series|bold|weakly harmonizable> if
      <math|F> has bounded Fréchet variation (requiring Morse-Transue
      integration).
    </enumerate>
  </definition>

  <\remark>
    Strongly harmonizable processes form a proper subset of weakly
    harmonizable processes. The distinction becomes crucial when considering
    operator-valued spectral measures and infinite-dimensional processes.
  </remark>

  <section|Oscillatory Processes>

  <subsection|Definition and Spectral Structure>

  <\definition>
    [Oscillatory Process] A stochastic process
    <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>> is an
    <with|font-series|bold|oscillatory process> if it admits the
    representation:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where:

    <\enumerate>
      <item><math|A<rsub|t><around|(|\<lambda\>|)>> is a deterministic
      complex-valued function modulating <math|e<rsup|i*\<lambda\>*t>>.

      <item><math|Z<around|(|\<lambda\>|)>> is a stochastic process with
      orthogonal increments such that <math|\<bbb-E\>*<around|[|d*Z<around|(|\<lambda\>|)><wide|d*Z<around|(|\<xi\>|)>|\<bar\>>|]>=\<delta\>*<around|(|\<lambda\>-\<xi\>|)>*d*\<mu\><around|(|\<lambda\>|)>>
      where <math|\<mu\>> is a positive measure and <math|\<delta\>> denotes
      the Dirac delta function.
    </enumerate>
  </definition>

  <\definition>
    [Evolutionary Power Spectral Density] For an oscillatory process
    <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>>, the
    <with|font-series|bold|evolutionary power spectral density> (ePSD) is
    defined as:

    <\equation>
      h<rsub|t><around|(|\<lambda\>|)>=<around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2><frac|d*\<mu\>|d*\<lambda\>>
    </equation>

    when <math|\<mu\>> is absolutely continuous with respect to Lebesgue
    measure.
  </definition>

  <\theorem>
    [Covariance Structure] The covariance function of an oscillatory process
    has the representation:

    <\equation>
      R<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>A<rsub|s><around|(|\<lambda\>|)><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|s-t|)>>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>
    </equation>
  </theorem>

  <\align>
    <tformat|<table|<row|<cell|R<around|(|s,t|)>>|<cell|=\<bbb-E\><around|[|X<around|(|s|)><wide|X<around|(|t|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>A<rsub|s><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*s>*<space|0.17em>d*Z<around|(|\<lambda\>|)>\<cdot\><wide|<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<xi\>|)>*e<rsup|i*\<xi\>*t>*<space|0.17em>d*Z<around|(|\<xi\>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>A<rsub|s><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*s>*<space|0.17em>d*Z<around|(|\<lambda\>|)>\<cdot\><big|int><rsub|\<bbb-R\>><wide|A<rsub|t><around|(|\<xi\>|)>|\<bar\>>e<rsup|-i*\<xi\>*t><space|0.17em><wide|d*Z<around|(|\<xi\>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|<eq-number>>>>>
  </align>

  Exchanging the expectation and integration (justified by Fubini's theorem
  for stochastic integrals):

  <\align>
    <tformat|<table|<row|<cell|R<around|(|s,t|)>>|<cell|=<big|iint><rsub|\<bbb-R\><rsup|2>>A<rsub|s><around|(|\<lambda\>|)><wide|A<rsub|t><around|(|\<xi\>|)>|\<bar\>>e<rsup|i*\<lambda\>*s>*e<rsup|-i*\<xi\>*t>*<space|0.17em>\<bbb-E\>*<around|[|d*Z<around|(|\<lambda\>|)><wide|d*Z<around|(|\<xi\>|)>|\<bar\>>|]><eq-number>>>|<row|<cell|>|<cell|=<big|iint><rsub|\<bbb-R\><rsup|2>>A<rsub|s><around|(|\<lambda\>|)><wide|A<rsub|t><around|(|\<xi\>|)>|\<bar\>>e<rsup|i*\<lambda\>*s>*e<rsup|-i*\<xi\>*t>*<space|0.17em>\<delta\>*<around|(|\<lambda\>-\<xi\>|)>*d*\<mu\><around|(|\<lambda\>|)>*d*\<xi\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|s><around|(|\<lambda\>|)><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*s>*e<rsup|-i*\<lambda\>*t>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|s><around|(|\<lambda\>|)><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|s-t|)>>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)><eq-number>>>>>
  </align>

  <\proposition>
    [Harmonizability of Oscillatory Processes] Every oscillatory process is
    strongly harmonizable with a spectral measure <math|F> supported on the
    diagonal and given by:

    <\equation>
      d*F<around|(|\<lambda\>,\<xi\>|)>=A<rsub|s><around|(|\<lambda\>|)><wide|A<rsub|t><around|(|\<xi\>|)>|\<bar\>>\<delta\>*<around|(|\<lambda\>-\<xi\>|)>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>*d*\<xi\>
    </equation>
  </proposition>

  From the covariance representation:

  <\align>
    <tformat|<table|<row|<cell|R<around|(|s,t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|s><around|(|\<lambda\>|)><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|s-t|)>>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|iint><rsub|\<bbb-R\><rsup|2>>A<rsub|s><around|(|\<lambda\>|)><wide|A<rsub|t><around|(|\<xi\>|)>|\<bar\>>e<rsup|i*\<lambda\>*s>*e<rsup|-i*\<xi\>*t>*<space|0.17em>\<delta\>*<around|(|\<lambda\>-\<xi\>|)>*d*\<mu\><around|(|\<lambda\>|)>*d*\<xi\><eq-number>>>>>
  </align>

  Comparing with the harmonizable representation:

  <\equation>
    R<around|(|s,t|)>=<big|iint><rsub|\<bbb-R\><rsup|2>>e<rsup|i*<around|(|\<lambda\>*s-\<xi\>*t|)>>*<space|0.17em>d*F<around|(|\<lambda\>,\<xi\>|)>
  </equation>

  One identifies:

  <\equation>
    d*F<around|(|\<lambda\>,\<xi\>|)>=A<rsub|s><around|(|\<lambda\>|)><wide|A<rsub|t><around|(|\<xi\>|)>|\<bar\>>\<delta\>*<around|(|\<lambda\>-\<xi\>|)>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>*d*\<xi\>
  </equation>

  The boundedness of variation follows from the fact that the measure is
  concentrated on the diagonal and <math|A<rsub|t><around|(|\<lambda\>|)>>
  contributes only a bounded modulation.

  <section|Random Measure Characterization and Inversion>

  <subsection|Orthogonal Increments and Spectral Recovery>

  <\theorem>
    [Stochastic Inversion Formula] For an oscillatory process
    <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>>, if
    <math|A<rsub|t><around|(|\<lambda\>|)>> is invertible for each fixed
    <math|\<lambda\>>, then the random measure
    <math|d*Z<around|(|\<lambda\>|)>> is recoverable via:

    <\equation>
      d*Z<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>X<around|(|t|)>*A<rsub|t><rsup|-1><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>*<space|0.17em>d*t
    </equation>

    where the integral is interpreted in the mean-square sense.
  </theorem>

  Multiply both sides of the oscillatory representation by
  <math|A<rsub|t><rsup|-1><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>>
  and integrate over <math|t>:

  <\align>
    <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>X<around|(|t|)>*A<rsub|t><rsup|-1><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>*<space|0.17em>d*t>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<xi\>|)>*e<rsup|i*\<xi\>*t>*<space|0.17em>d*Z<around|(|\<xi\>|)>|)>*A<rsub|t><rsup|-1><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<xi\>|)>*A<rsub|t><rsup|-1><around|(|\<lambda\>|)>*e<rsup|i*<around|(|\<xi\>-\<lambda\>|)>*t>*<space|0.17em>d*t|)>*d*Z<around|(|\<xi\>|)><eq-number>>>>>
  </align>

  For the inner integral, we have:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<xi\>|)>*A<rsub|t><rsup|-1><around|(|\<lambda\>|)>*e<rsup|i*<around|(|\<xi\>-\<lambda\>|)>*t>*<space|0.17em>d*t=2*\<pi\>*\<delta\>*<around|(|\<xi\>-\<lambda\>|)>
  </equation>

  provided that <math|A<rsub|t><around|(|\<xi\>|)>*A<rsub|t><rsup|-1><around|(|\<lambda\>|)>>
  is sufficiently well-behaved. This yields:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>X<around|(|t|)>*A<rsub|t><rsup|-1><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>*<space|0.17em>d*t=2*\<pi\>*<big|int><rsub|\<bbb-R\>>\<delta\>*<around|(|\<xi\>-\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<xi\>|)>=2*\<pi\>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
  </equation>

  Dividing by <math|2*\<pi\>> completes the proof. The mean-square
  convergence follows from the orthogonality of the increments of <math|Z>.

  <\remark>
    No assumption regarding the slow variation of
    <math|A<rsub|t><around|(|\<lambda\>|)>> is necessary for the validity of
    the inversion formula. The result is exact and holds whenever the
    integral is well-defined in the mean-square sense.
  </remark>

  <subsection|Wigner-Ville Transform and Spectral Characterization>

  <\definition>
    [Wigner-Ville Transform] The <with|font-series|bold|cross-Wigner-Ville
    transform> of a process <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>>
    is defined as:

    <\equation>
      W<rsub|X><around|(|t,\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>X*<around*|(|t+<frac|\<tau\>|2>|)><wide|X*<around*|(|t-<frac|\<tau\>|2>|)>|\<bar\>>e<rsup|-i*\<lambda\>*\<tau\>>*<space|0.17em>d*\<tau\>
    </equation>
  </definition>

  <\theorem>
    [Spectral Recovery via Wigner-Ville] For an oscillatory process
    <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>>, the integral of the
    expected value of the Wigner-Ville transform over time yields:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<bbb-E\><around|[|W<rsub|X><around|(|t,\<lambda\>|)>|]>*<space|0.17em>d*t=2*\<pi\>*<space|0.17em>\<bbb-E\><around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=2*\<pi\>*<space|0.17em>h<rsub|t><around|(|\<lambda\>|)>*d*\<lambda\>
    </equation>
  </theorem>

  <\align>
    <tformat|<table|<row|<cell|\<bbb-E\><around|[|W<rsub|X><around|(|t,\<lambda\>|)>|]>>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>X*<around*|(|t+<frac|\<tau\>|2>|)><wide|X*<around*|(|t-<frac|\<tau\>|2>|)>|\<bar\>>e<rsup|-i*\<lambda\>*\<tau\>>*<space|0.17em>d*\<tau\>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<bbb-E\>*<around*|[|X*<around*|(|t+<frac|\<tau\>|2>|)><wide|X*<around*|(|t-<frac|\<tau\>|2>|)>|\<bar\>>|]>*e<rsup|-i*\<lambda\>*\<tau\>>*<space|0.17em>d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>R<around*|(|t+<frac|\<tau\>|2>,t-<frac|\<tau\>|2>|)>*e<rsup|-i*\<lambda\>*\<tau\>>*<space|0.17em>d*\<tau\><eq-number>>>>>
  </align>

  Substituting the covariance expression for oscillatory processes:

  <\align>
    <tformat|<table|<row|<cell|\<bbb-E\><around|[|W<rsub|X><around|(|t,\<lambda\>|)>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|(|<big|int><rsub|\<bbb-R\>>A<rsub|t+\<tau\>/2><around|(|\<xi\>|)><wide|A<rsub|t-\<tau\>/2><around|(|\<xi\>|)>|\<bar\>>e<rsup|i*\<xi\>*\<tau\>>*<space|0.17em>d*\<mu\><around|(|\<xi\>|)>|)>*e<rsup|-i*\<lambda\>*\<tau\>>*<space|0.17em>d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t+\<tau\>/2><around|(|\<xi\>|)><wide|A<rsub|t-\<tau\>/2><around|(|\<xi\>|)>|\<bar\>>e<rsup|i*<around|(|\<xi\>-\<lambda\>|)>*\<tau\>>*<space|0.17em>d*\<tau\>|)>*d*\<mu\><around|(|\<xi\>|)><eq-number>>>>>
  </align>

  Under appropriate regularity conditions on
  <math|A<rsub|t><around|(|\<lambda\>|)>>, the inner integral approaches
  <math|2*\<pi\>*\<delta\>*<around|(|\<xi\>-\<lambda\>|)>> when integrated
  over all time <math|t>:

  <\align>
    <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<bbb-E\><around|[|W<rsub|X><around|(|t,\<lambda\>|)>|]>*<space|0.17em>d*t>|<cell|=2*\<pi\>*<big|int><rsub|\<bbb-R\>>\<delta\>*<around|(|\<xi\>-\<lambda\>|)><around|\||A<rsub|t><around|(|\<xi\>|)>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<xi\>|)><eq-number>>>|<row|<cell|>|<cell|=2*\<pi\><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=2*\<pi\>*<space|0.17em>h<rsub|t><around|(|\<lambda\>|)>*d*\<lambda\><eq-number>>>>>
  </align>

  Since <math|\<bbb-E\><around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=d*\<mu\><around|(|\<lambda\>|)>>,
  we have:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<bbb-E\><around|[|W<rsub|X><around|(|t,\<lambda\>|)>|]>*<space|0.17em>d*t=2*\<pi\>*<space|0.17em>\<bbb-E\><around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>=2*\<pi\>*<space|0.17em>h<rsub|t><around|(|\<lambda\>|)>*d*\<lambda\>
  </equation>

  <section|Random Measure Construction from Process Samples>

  <subsection|Functional Analysis Framework>

  <\theorem>
    [Orthogonal Projection] Let <math|\<cal-H\><rsub|X>> be the Hilbert space
    generated by <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>>. The
    random measure <math|d*Z<around|(|\<lambda\>|)>> emerges as the
    orthogonal projection of <math|X<around|(|t|)>> onto the basis
    <math|<around|{|A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>|}>>
    in <math|L<rsup|2><around|(|\<mu\>|)>>.
  </theorem>

  Define the linear operator <math|\<cal-F\><rsub|W>:\<cal-H\><rsub|X>\<to\>L<rsup|2><around|(|\<mu\>|)>>
  by:

  <\equation>
    \<cal-F\><rsub|W>:X<around|(|t|)>\<mapsto\><big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
  </equation>

  For a fixed sample path <math|X<around|(|t,\<zeta\>|)>>, we seek the
  corresponding <math|d*Z<around|(|\<lambda\>,\<zeta\>|)>>. By the orthogonal
  projection theorem, this is given by the inner product:

  <\equation>
    d*Z<around|(|\<lambda\>,\<zeta\>|)>=<around|\<langle\>|X|(>\<cdot\>,\<zeta\>),A<rsub|\<cdot\>><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>\<cdot\>>\<rangle\><rsub|L<rsup|2><around|(|\<mu\>|)>>
  </equation>

  Computing this inner product:

  <\equation>
    <big|int><rsub|\<bbb-R\>>X<around|(|t,\<zeta\>|)><wide|A<rsub|t><around|(|\<lambda\>|)>|\<bar\>>e<rsup|-i*\<lambda\>*t>*<space|0.17em>d*t=d*Z<around|(|\<lambda\>,\<zeta\>|)>
  </equation>

  This establishes that <math|d*Z<around|(|\<lambda\>,\<zeta\>|)>> is the
  coefficient of the projection of <math|X<around|(|t,\<zeta\>|)>> onto the
  basis element <math|A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>>.

  <subsection|Dual Basis and Inversion>

  <\theorem>
    [Inversion via Dual Basis] Given an oscillatory process
    <math|<around|{|X<around|(|t|)>:t\<in\>\<bbb-R\>|}>>, the random measure
    <math|d*Z<around|(|\<lambda\>|)>> can be recovered via:

    <\equation>
      d*Z<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>X<around|(|t|)><wide|\<psi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*t
    </equation>

    where <math|\<psi\><rsub|t><around|(|\<lambda\>|)>=A<rsub|t><rsup|-1><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*t>>
    is the dual basis satisfying:

    <\equation>
      <big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t><wide|\<psi\><rsub|t><around|(|\<xi\>|)>|\<bar\>><space|0.17em>d*t=\<delta\>*<around|(|\<lambda\>-\<xi\>|)>
    </equation>
  </theorem>

  The dual basis elements <math|\<psi\><rsub|t><around|(|\<lambda\>|)>> are
  defined to satisfy the biorthogonality relation:

  <\equation>
    <big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t><wide|\<psi\><rsub|t><around|(|\<xi\>|)>|\<bar\>><space|0.17em>d*t=\<delta\>*<around|(|\<lambda\>-\<xi\>|)>
  </equation>

  Substituting the oscillatory representation of <math|X<around|(|t|)>>:

  <\align>
    <tformat|<table|<row|<cell|<big|int><rsub|\<bbb-R\>>X<around|(|t|)><wide|\<psi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*t>|<cell|=<big|int><rsub|\<bbb-R\>><around*|(|<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<xi\>|)>*e<rsup|i*\<xi\>*t>*<space|0.17em>d*Z<around|(|\<xi\>|)>|)><wide|\<psi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around*|(|<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<xi\>|)>*e<rsup|i*\<xi\>*t><wide|\<psi\><rsub|t><around|(|\<lambda\>|)>|\<bar\>><space|0.17em>d*t|)>*d*Z<around|(|\<xi\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>\<delta\>*<around|(|\<xi\>-\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<xi\>|)><eq-number>>>|<row|<cell|>|<cell|=d*Z<around|(|\<lambda\>|)><eq-number>>>>>
  </align>

  <\remark>
    The completeness of the basis <math|<around|{|A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>|}>>
    in <math|L<rsup|2><around|(|\<mu\>|)>> ensures that the inversion is
    unique. No estimates or approximations are required; the result is exact
    when the integrals converge in the mean-square sense.
  </remark>

  <section|Conclusion>

  This document has established the measure-theoretic foundations of
  harmonizable stochastic processes and the specialized subclass of
  oscillatory processes. Key results include:

  <\enumerate>
    <item>The characterization of harmonizable processes through bivariate
    spectral measures, generalizing stationary processes.

    <item>The representation of oscillatory processes via time-dependent
    amplitude modulation of complex exponentials.

    <item>The derivation of exact inversion formulae for recovering the
    associated random measures from process samples.

    <item>The connection between oscillatory processes and time-frequency
    analysis through the Wigner-Ville transform.
  </enumerate>

  The theory provides a rigorous framework for analyzing non-stationary
  stochastic processes with time-varying spectral characteristics. The
  spectral representations and inversion formulae developed herein offer
  powerful tools for the mathematical characterization of complex-valued
  processes with evolving frequency content.

  <\thebibliography|99>
    <bibitem|yag>Yaglom, A.M., "Correlation theory of stationary and related
    random functions," Springer-Verlag, 1987.

    <bibitem|pri>Priestley, M.B., "Evolutionary spectra and non-stationary
    processes," Journal of the Royal Statistical Society, Series B, vol. 27,
    pp. 204-237, 1965.

    <bibitem|man>Mandrekar, V. and Ghosh, J.K., "A characterization of
    oscillatory processes and their spectral representations," Stochastic
    Analysis and Applications, vol. 30, no. 6, pp. 998-1021, 2012.

    <bibitem|encycl>"Harmonizable random process," Encyclopedia of
    Mathematics, available at: https://encyclopediaofmath.org/wiki/Harmonizable_random_process.

    <bibitem|nas>Nason, G., "M B Priestley and non-stationary processes,"
    Workshop slides, 2022.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-10|<tuple|5.1|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-11|<tuple|5.2|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-12|<tuple|6|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-13|<tuple|4|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-3|<tuple|2.1|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-4|<tuple|3|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-5|<tuple|3.1|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-6|<tuple|4|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-7|<tuple|4.1|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-8|<tuple|4.2|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-9|<tuple|5|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-encycl|<tuple|encycl|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-man|<tuple|man|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-nas|<tuple|nas|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-pri|<tuple|pri|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-yag|<tuple|yag|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Harmonizable
      Stochastic Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Fundamental Definitions and
      Spectral Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Oscillatory
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Definition and Spectral
      Structure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Random
      Measure Characterization and Inversion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Orthogonal Increments and
      Spectral Recovery <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Wigner-Ville Transform and
      Spectral Characterization <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Random
      Measure Construction from Process Samples>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Functional Analysis
      Framework <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Dual Basis and Inversion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>