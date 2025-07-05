<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|Monotonic Time Changes of Stationary Processes Are
  Oscillatory Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    This paper establishes that monotonic time changes of stationary Gaussian
    processes are oscillatory processes. The transformation of a stationary
    process through a monotonic function <math|\<theta\><around|(|t|)>>
    produces an oscillatory process with kernel
    <math|K<around|(|t,s|)>=K<rsub|0><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>>
    and gain function <math|A<around|(|t,\<lambda\>|)>=exp
    <around|(|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>
    for any stationary kernel <math|K<rsub|0>>. The expected number of zeros
    over <math|<around|[|0,T|]>> is exactly
    <math|<sqrt|-<wide|K|\<ddot\>><rsub|0><around|(|0|)>>\<cdot\><around|(|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|)>>.
    The Hardy Z-function is demonstrated to be a realization of the
    oscillatory process with kernel <math|J<rsub|0><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>>.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Time
    Change Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Main
    Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Hardy
    Z-Function Realization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  Monotonic time transformations of stationary Gaussian processes are
  oscillatory processes<cite|evolutionarySpectraAndNonStationaryProcesses|powerSpectralAnalysisOfNonStationaryRandomProcesses>.
  This fundamental result demonstrates that the transformation preserves
  essential spectral structure while introducing oscillatory behavior through
  the phase modulation induced by the time change function
  <math|\<theta\><around|(|t|)>>. The investigation centers on three key
  aspects: the relationship between eigenfunctions of the covariance
  operators, the preservation of normalization and eigenvalues under
  transformation, and the expected number of zeros of the resulting
  processes.

  <section|Oscillatory Processes>

  <\definition>
    [Priestley's Oscillatory Process]<cite|evolutionarySpectraAndNonStationaryProcesses>
    An oscillatory process <math|X<around|(|t|)>> is defined by the spectral
    representation:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<lambda\>|)>*d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|A<around|(|t,\<lambda\>|)>> is the amplitude function,
    <math|d*Z<around|(|\<lambda\>|)>> is an orthogonal random measure with

    <\equation>
      \<bbb-E\><around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=d*F<around|(|\<lambda\>|)>
    </equation>

    and <math|F<around|(|\<lambda\>|)>> is the integrated spectrum.
  </definition>

  <\definition>
    [Evolutionary Spectrum]<cite|evolutionarySpectraAndNonStationaryProcesses>
    The evolutionary spectrum of an oscillatory process is defined as:

    <\equation>
      f<around|(|t,\<lambda\>|)>=<around|\||A<around|(|t,\<lambda\>|)>|\|><rsup|2>*f<around|(|\<lambda\>|)>
    </equation>

    where

    <\equation>
      f<around|(|\<lambda\>|)>=<frac|\<mathd\>|\<mathd\>\<lambda\>>F<around|(|\<lambda\>|)>
    </equation>

    \ is the spectral density of the orthogonal random measure.
  </definition>

  <\definition>
    [Oscillatory Function]<cite|characterizationOscillatoryProcesses> The
    oscillatory function <math|\<phi\><rsub|t><around|(|\<lambda\>|)>>
    associated with the process is given by:

    <\equation>
      \<phi\><rsub|t><around|(|\<lambda\>|)>=e<rsup|i \<lambda\>
      t>A<around|(|t,\<lambda\>|)>
    </equation>
  </definition>

  <\remark>
    The characterization of oscillatory processes through their envelope
    properties has been extensively studied<cite|envelopeUniquenessOscillatoryProcess|envelopeOscillatoryProcessUpcrossings>,
    providing insights into their crossing statistics and envelope behavior.
  </remark>

  <section|Time Change Functions>

  <\definition>
    Let <math|\<cal-T\>> denote the class of time change functions
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> that are:

    <\enumerate>
      <item>Strictly monotonically increasing:
      <math|\<theta\><around|(|s|)>\<less\>\<theta\><around|(|t|)>> for all
      <math|s\<less\>t>

      <item>Twice continuously differentiable with
      <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<gtr\>0>
    </enumerate>
  </definition>

  <section|Main Results>

  <\theorem>
    [Time-Changed Kernel] For any stationary kernel
    <math|K<rsub|0><around|(|<around|\||t-s|\|>|)>> and time change function
    <math|\<theta\>\<in\>\<cal-T\>>, the time-changed kernel is:

    <\equation*>
      K<around|(|t,s|)>=K<rsub|0><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>
    </equation*>
  </theorem>

  <\proof>
    Consider a stationary process <math|Y<around|(|u|)>> with kernel
    <math|K<rsub|0><around|(|<around|\||u-v|\|>|)>> and eigenfunctions
    <math|\<psi\><rsub|n><around|(|u|)>> satisfying:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|0><around|(|<around|\||u-v|\|>|)>*\<psi\><rsub|n><around|(|v|)>*d*v=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|u|)>
    </equation>

    The time-changed process <math|X<around|(|t|)>=Y<around|(|\<theta\><around|(|t|)>|)>>
    requires eigenfunctions <math|\<phi\><rsub|n><around|(|t|)>> satisfying:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|t,s|)>*\<phi\><rsub|n><around|(|s|)>*d*s=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)>
    </equation>

    Let <math|\<phi\><rsub|n><around|(|t|)>=\<psi\><rsub|n><around|(|\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>.
    The normalization condition requires:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<phi\><rsub|n><around|(|t|)>*<around|\||<rsup|2>d*t=<big|int><rsub|-\<infty\>><rsup|\<infty\>>|\|>*\<psi\><rsub|n><around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t
    </equation>

    Under the substitution <math|u=\<theta\><around|(|t|)>>,
    <math|d*u=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<psi\><rsub|n><around|(|u|)>|\|><rsup|2>*d*u=1
    </equation>

    Therefore <math|\<phi\><rsub|n><around|(|t|)>> are properly normalized.
    Substituting into the eigenvalue equation:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|t,s|)>*\<psi\><rsub|n><around|(|\<theta\><around|(|s|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*d*s=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>
    </equation>

    Dividing by <math|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|K<around|(|t,s|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>*\<psi\><rsub|n><around|(|\<theta\><around|(|s|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>>*d*s=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Under the change of variables <math|v=\<theta\><around|(|s|)>>,
    <math|d*v=<wide|\<theta\>|\<dot\>><around|(|s|)>*d*s>:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|K<around|(|t,\<theta\><rsup|-1><around|(|v|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>*\<psi\><rsub|n><around|(|v|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>*<frac|d*v|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|\<theta\><around|(|t|)>|)>
    </equation*>

    This simplifies to:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|K<around|(|t,\<theta\><rsup|-1><around|(|v|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>>*\<psi\><rsub|n><around|(|v|)>*d*v=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|\<theta\><around|(|t|)>|)>
    </equation>

    Setting <math|u=\<theta\><around|(|t|)>>, this becomes:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|K<around|(|\<theta\><rsup|-1><around|(|u|)>,\<theta\><rsup|-1><around|(|v|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>*<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>>*\<psi\><rsub|n><around|(|v|)>*d*v=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|u|)>
    </equation>

    For this to equal the original eigenvalue equation, we require:

    <\equation>
      <frac|K<around|(|\<theta\><rsup|-1><around|(|u|)>,\<theta\><rsup|-1><around|(|v|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>*<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>>=K<rsub|0><around|(|<around|\||u-v|\|>|)>
    </equation>

    Therefore:

    <\equation>
      K<around|(|\<theta\><rsup|-1><around|(|u|)>,\<theta\><rsup|-1><around|(|v|)>|)>=K<rsub|0><around|(|<around|\||u-v|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|u|)>|)>*<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|v|)>|)>>
    </equation>

    Setting <math|t=\<theta\><rsup|-1><around|(|u|)>> and
    <math|s=\<theta\><rsup|-1><around|(|v|)>>:

    <\equation*>
      K<around|(|t,s|)>=K<rsub|0><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>
    </equation*>
  </proof>

  <\corollary>
    [Eigenvalue Invariance] The eigenvalues
    <math|<around|{|\<lambda\><rsub|n>|}>> of the time-changed kernel's
    covariance operator are identical to those of the original kernel
    <math|K<rsub|0>>'s covariance operator.
  </corollary>

  <\theorem>
    [Oscillatory Process Generation] Any Gaussian process with time-changed
    kernel <math|K<around|(|t,s|)>=K<rsub|0><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>>
    where <math|\<theta\>\<in\>\<cal-T\>> and <math|K<rsub|0>> is any
    stationary kernel is an oscillatory process with amplitude function:

    <\equation>
      A<around|(|t,\<lambda\>|)>=e<rsup|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>
    </equation>
  </theorem>

  <\proof>
    The oscillatory function is defined as:

    <\equation>
      \<phi\><rsub|t><around|(|\<lambda\>|)>=exp
      <around|(|i*\<lambda\>*t|)>*A<around|(|t,\<lambda\>|)>
    </equation>

    where <math|A<around|(|t,\<lambda\>|)>=exp
    <around|(|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>.

    Computing <math|\<phi\><rsub|t><around|(|\<lambda\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|\<phi\><rsub|t><around|(|\<lambda\>|)>>|<cell|=exp
      <around|(|i*\<lambda\>*t|)>*exp <around|(|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>><eq-number>>>|<row|<cell|>|<cell|=exp
      <around|(|i*\<lambda\>*t|)>*exp <around|(|i*\<lambda\>*\<theta\><around|(|t|)>|)>*exp
      <around|(|-i*\<lambda\>*t|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>><eq-number>>>|<row|<cell|>|<cell|=exp
      <around|(|i*\<lambda\>*\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>><eq-number>>>>>
    </align>

    The process admits the spectral representation:

    <\equation*>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
      <around|(|i*\<lambda\>*\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*d*Z<around|(|\<lambda\>|)>
    </equation*>

    This establishes the oscillatory nature with the specified amplitude
    function.
  </proof>

  <\theorem>
    [Expected Zero-Counting Function] Let <math|\<theta\>\<in\>\<cal-T\>> and
    let <math|K<rsub|0><around|(|\<cdummy\>|)>> be any positive-definite,
    stationary covariance function, twice differentiable at <math|0>.
    Consider the centered Gaussian process with covariance:

    <\equation>
      K<around|(|t,s|)>=K<rsub|0><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>
    </equation>

    Then the expected number of zeros in <math|<around|[|0,T|]>> is:

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=<sqrt|-<wide|K|\<ddot\>><rsub|0><around|(|0|)>>\<cdot\><around|(|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|)>
    </equation>
  </theorem>

  <\proof>
    By the Kac-Rice formula:

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=<big|int><rsub|0><rsup|T><sqrt|-lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K<around|(|s,t|)>>*d*t
    </equation>

    Let\ 

    <\equation>
      u=\<theta\><around|(|t|)>-\<theta\><around|(|s|)>
    </equation>

    Then

    <\equation>
      <frac|\<partial\>*|\<partial\>*t>K<around*|(|t,s|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)><wide|\<theta\>|\<dot\>><around|(|s|)>>*<around*|[|<wide|K|\<dot\>><rsub|0><around|(|<around|\||u|\|>|)><space|0.17em><math-up|sgn><around|(|u|)><space|0.17em><wide|\<theta\>|\<dot\>><around|(|t|)>+<frac|<wide|\<theta\>|\<ddot\>><around|(|t|)>|2*<wide|\<theta\>|\<dot\>><around|(|t|)>>*K<rsub|0><around|(|<around|\||u|\|>|)>|]>
    </equation>

    Therefore:

    <\align>
      <tformat|<table|<row|<cell|\<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>>|<cell|=<big|int><rsub|0><rsup|T><sqrt|-<around|(|-<wide|K|\<ddot\>><rsub|0><around|(|0|)>*<wide|\<theta\>|\<dot\>><around|(|t|)><rsup|2>|)>>*d*t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|-<wide|K|\<ddot\>><rsub|0><around|(|0|)>>*<big|int><rsub|0><rsup|T><wide|\<theta\>|\<dot\>><around|(|t|)>*d*t<eq-number>>>|<row|<cell|>|<cell|=<sqrt|-<wide|K|\<ddot\>><rsub|0><around|(|0|)>>\<cdot\><around|(|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|)><eq-number>>>>>
    </align>
  </proof>

  <\theorem>
    [Spectral Inversion Formula] The orthogonal random measure satisfies:

    <\equation*>
      d*Z<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>X<around|(|t|)>*exp
      <around|(|-i*\<lambda\>*\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*d*t\<cdot\>d*\<lambda\>
    </equation*>
  </theorem>

  <\proof>
    From the spectral representation <math|X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|(|i*\<lambda\>*\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*d*Z<around|(|\<lambda\>|)>>,
    multiply both sides by <math|exp <around|(|-i*\<mu\>*\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>>
    and integrate:

    <\equation*>
      <big|int><rsub|-T><rsup|T>X<around|(|t|)>*exp
      <around|(|-i*\<mu\>*\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*d*t=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-T><rsup|T>exp
      <around|(|i*<around|(|\<lambda\>-\<mu\>|)>*\<theta\><around|(|t|)>|)>*<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation*>

    Under the change of variables <math|u=\<theta\><around|(|t|)>>,
    <math|d*u=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t>:

    <\equation*>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|\<theta\>*<around|(|-T|)>><rsup|\<theta\><around|(|T|)>>exp
      <around|(|i*<around|(|\<lambda\>-\<mu\>|)>*u|)>*d*u*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation*>

    <\equation*>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|exp
      <around|(|i*<around|(|\<lambda\>-\<mu\>|)>*\<theta\><around|(|T|)>|)>-exp
      <around|(|i*<around|(|\<lambda\>-\<mu\>|)>*\<theta\>*<around|(|-T|)>|)>|i*<around|(|\<lambda\>-\<mu\>|)>>*d*Z<around|(|\<lambda\>|)>
    </equation*>

    As <math|T\<to\>\<infty\>>, this approaches
    <math|2*\<pi\>*\<delta\>*<around|(|\<lambda\>-\<mu\>|)>> times the
    increment of <math|Z> over an interval containing <math|\<lambda\>>,
    yielding the inversion formula.
  </proof>

  <section|Hardy Z-Function Realization>

  <\theorem>
    [Hardy Z-Function as Oscillatory Process] The Hardy Z-function

    <\equation*>
      Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>
    </equation*>

    is a realization of the oscillatory process with kernel:

    <\equation*>
      K<around|(|t,s|)>=J<rsub|0><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>
    </equation*>

    and amplitude function:

    <\equation*>
      A<around|(|t,\<lambda\>|)>=exp <around|(|i*\<lambda\>*<around|(|\<theta\><around|(|t|)>-t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>
    </equation*>
  </theorem>

  <\proof>
    The Hardy Z-function exhibits the spectral representation:

    <\equation*>
      Z<around|(|t|)>=<big|int><rsub|-1><rsup|1>exp
      <around|(|i*\<lambda\>*\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*d*Z<around|(|\<lambda\>|)>
    </equation*>

    The orthogonal random measure satisfies:

    <\equation*>
      \<bbb-E\><around|[|<around|\||d*Z<around|(|\<lambda\>|)>|\|><rsup|2>|]>=<frac|d*\<lambda\>|<sqrt|1-\<lambda\><rsup|2>>>
    </equation*>

    corresponding to the integrated spectrum
    <math|F<around|(|\<lambda\>|)>=arcsin <around|(|\<lambda\>|)>>.

    The spectral density is:

    <\equation*>
      f<around|(|\<lambda\>|)>=<frac|d|d*\<lambda\>>*arcsin
      <around|(|\<lambda\>|)>=<frac|1|<sqrt|1-\<lambda\><rsup|2>>>
    </equation*>

    The evolutionary spectrum becomes:

    <\equation*>
      f<around|(|t,\<lambda\>|)>=<around|\||A<around|(|t,\<lambda\>|)>|\|><rsup|2>*f<around|(|\<lambda\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>\<cdot\><frac|1|<sqrt|1-\<lambda\><rsup|2>>>
    </equation*>

    The orthogonal random measure can be expressed as:

    <\equation*>
      d*Z<around|(|\<lambda\>|)>=lim<rsub|T\<to\>\<infty\>>
      <frac|1|2*T>*<big|int><rsub|-T><rsup|T>Z<around|(|t|)>*exp
      <around|(|-i*\<lambda\>*\<theta\><around|(|t|)>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*d*t\<cdot\>d*\<lambda\>
    </equation*>

    This establishes the Hardy Z-function as a realization of the oscillatory
    process with the specified kernel structure.
  </proof>

  <section|Conclusion>

  Monotonic time changes of stationary Gaussian processes are oscillatory
  processes in the sense of Priestley's theory<cite|evolutionarySpectraAndNonStationaryProcesses>
  The transformation preserves eigenvalue structure while introducing
  oscillatory behavior through phase modulation. The expected number of zeros
  scales as <math|<sqrt|-<wide|K|\<ddot\>><rsub|0><around|(|0|)>>\<cdot\><around|(|\<theta\><around|(|T|)>-\<theta\><around|(|0|)>|)>>,
  providing a direct connection between the time change function and the
  zero-counting statistics. The Hardy Z-function serves as a canonical
  realization of such processes, demonstrating the deep connection between
  number theory and stochastic process theory.

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|5>
      <bibitem*|1><label|bib-envelopeUniquenessOscillatoryProcess>A.<nbsp>M.<nbsp>Hasofer.
      <newblock>A uniqueness problem for the envelope of an oscillatory
      process. <newblock><with|font-shape|italic|Journal of Applied
      Probability>, 16(4):822\U829, December 1979.<newblock>

      <bibitem*|2><label|bib-envelopeOscillatoryProcessUpcrossings>A.<nbsp>M.<nbsp>Hasofer<localize|
      and >P.<nbsp>Petocz. <newblock>The envelope of an oscillatory process
      and its upcrossings. <newblock><with|font-shape|italic|Advances in
      Applied Probability>, 10(4):711\U716, 1978.<newblock>

      <bibitem*|3><label|bib-characterizationOscillatoryProcesses>V.<nbsp>Mandrekar.
      <newblock>A characterization of oscillatory processes and their
      prediction. <newblock><with|font-shape|italic|Proceedings of the
      American Mathematical Society>, 32(1):280\U284, 1972.<newblock>

      <bibitem*|4><label|bib-evolutionarySpectraAndNonStationaryProcesses>Maurice<nbsp>B
      Priestley. <newblock>Evolutionary spectra and non-stationary processes.
      <newblock><with|font-shape|italic|Journal of the Royal Statistical
      Society: Series B (Methodological)>, 27(2):204\U229, 1965.<newblock>

      <bibitem*|5><label|bib-powerSpectralAnalysisOfNonStationaryRandomProcesses>MB
      Priestley. <newblock>Power spectral analysis of non-stationary random
      processes. <newblock><with|font-shape|italic|Journal of Sound and
      Vibration>, 6(1):86\U97, 1967.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-5|<tuple|5|6|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-6|<tuple|6|6|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|auto-7|<tuple|6|7|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|bib-characterizationOscillatoryProcesses|<tuple|3|7|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|bib-envelopeOscillatoryProcessUpcrossings|<tuple|2|7|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|bib-envelopeUniquenessOscillatoryProcess|<tuple|1|7|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|bib-evolutionarySpectraAndNonStationaryProcesses|<tuple|4|7|../../.TeXmacs/texts/scratch/no_name_7.tm>>
    <associate|bib-powerSpectralAnalysisOfNonStationaryRandomProcesses|<tuple|5|7|../../.TeXmacs/texts/scratch/no_name_7.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      evolutionarySpectraAndNonStationaryProcesses

      powerSpectralAnalysisOfNonStationaryRandomProcesses

      evolutionarySpectraAndNonStationaryProcesses

      evolutionarySpectraAndNonStationaryProcesses

      characterizationOscillatoryProcesses

      envelopeUniquenessOscillatoryProcess

      envelopeOscillatoryProcessUpcrossings

      evolutionarySpectraAndNonStationaryProcesses
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Time
      Change Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Hardy
      Z-Function Realization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>