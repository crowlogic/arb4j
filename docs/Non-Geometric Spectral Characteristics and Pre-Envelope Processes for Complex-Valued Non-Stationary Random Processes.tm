<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Non-Geometric Spectral Characteristics and
  Pre-Envelope Processes for Complex-Valued Non-Stationary Random
  Processes>|<doc-author|<author-data|<author-name|Anonymous>>>|<doc-date|<date|>>>

  <section|Pre-Envelope Process Theory>

  <\definition>
    [Pre-Envelope Process]<label|def:pre_envelope> For an oscillatory process
    <math|X<around|(|t|)>>, the pre-envelope process <math|Z<around|(|t|)>>
    is defined as the complex analytical signal given by

    <\equation>
      <label|eq:pre_envelope_def>Z<around|(|t|)>=X<around|(|t|)>+j*Y<around|(|t|)>
    </equation>

    where <math|Y<around|(|t|)>> is the Hilbert transform of
    <math|X<around|(|t|)>>, expressed as

    <\equation>
      <label|eq:hilbert_transform>Y<around|(|t|)>=-j*<big|int><rsub|-\<infty\>><rsup|\<infty\>><text|sign><around|(|\<omega\>|)>*A<rsub|X><around|(|\<omega\>,t|)>*e<rsup|j*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>
  </definition>

  <\proof>
    The pre-envelope formulation provides a complex representation that
    captures both the instantaneous amplitude and phase information of the
    oscillatory process. The Hilbert transform in
    equation<nbsp><eqref|eq:hilbert_transform> ensures that the imaginary
    component <math|Y<around|(|t|)>> is orthogonal to the real component
    <math|X<around|(|t|)>>, creating the analytic signal representation.
  </proof>

  <section|Spectral Representation>

  <\theorem>
    [General Spectral Representation]<label|thm:spectral_rep> The oscillatory
    process <math|X<around|(|t|)>> has the general spectral representation

    <\equation>
      <label|eq:spectral_rep>X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|X><around|(|\<omega\>,t|)>*e<rsup|j*\<omega\>*t>*d*Z<around|(|\<omega\>|)>
    </equation>

    where <math|A<rsub|X><around|(|\<omega\>,t|)>> is the complex-valued
    time-frequency modulating function and <math|d*Z<around|(|\<omega\>|)>>
    is the orthogonal increment process with
    <math|\<bbb-E\><around|[|<around|\||d*Z<around|(|\<omega\>|)>|\|><rsup|2>|]>=d*\<mu\><around|(|\<omega\>|)>>.
  </theorem>

  <\proof>
    This representation follows from the general theory of stochastic
    processes and extends the classical spectral decomposition to
    non-stationary cases. The modulating function
    <math|A<rsub|X><around|(|\<omega\>,t|)>> captures the time-varying
    spectral characteristics, while the orthogonal increment process
    <math|d*Z<around|(|\<omega\>|)>> provides the stochastic component with
    spectral measure <math|d*\<mu\><around|(|\<omega\>|)>>.
  </proof>

  <section|Non-Geometric Spectral Characteristics>

  <\definition>
    [Non-Geometric Spectral Characteristics]<label|def:ngsc> For
    complex-valued non-stationary processes, two sets of Non-Geometric
    Spectral Characteristics (NGSCs) are defined as follows:

    <\enumerate>
      <item>Type 1 - Auto-covariances:

      <\equation>
        <label|eq:ngsc_type1>c<rsub|i*k,X*X><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Phi\><rsub|X<rsup|<around|(|i|)>>*X<rsup|<around|(|k|)>>><around|(|\<omega\>,t|)>*d*\<omega\>=\<sigma\><rsub|X<rsup|<around|(|i|)>>*X<rsup|<around|(|k|)>>><around|(|t|)>
      </equation>

      <item>Type 2 - Cross-covariances with Hilbert transform:

      <\equation>
        <label|eq:ngsc_type2>c<rsub|i*k,X*Y><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<Phi\><rsub|X<rsup|<around|(|i|)>>*Y<rsup|<around|(|k|)>>><around|(|\<omega\>,t|)>*d*\<omega\>=\<sigma\><rsub|X<rsup|<around|(|i|)>>*Y<rsup|<around|(|k|)>>><around|(|t|)>
      </equation>
    </enumerate>

    where <math|i,k=0,1,2,\<ldots\>> and <math|X<rsup|<around|(|i|)>><around|(|t|)>=d<rsup|i>*X<around|(|t|)>/d*t<rsup|i>>.
  </definition>

  <\proof>
    These NGSCs extend the classical spectral moment definitions to
    non-stationary processes while maintaining physical interpretability. The
    Type 1 characteristics capture auto-covariance relationships, while Type
    2 characteristics incorporate the phase information through the Hilbert
    transform relationships.
  </proof>

  <section|Evolutionary Cross-Power Spectral Density Functions>

  <\theorem>
    [Evolutionary Cross-PSD]<label|thm:cross_psd> The evolutionary
    cross-power spectral density functions are given by

    <\equation>
      <label|eq:cross_psd>\<Phi\><rsub|X<rsup|<around|(|i|)>>*W<rsup|<around|(|k|)>>><around|(|\<omega\>,t|)>=A<rsub|X<rsup|<around|(|i|)>>><rsup|\<ast\>><around|(|\<omega\>,t|)>\<cdot\>\<Phi\><around|(|\<omega\>|)>\<cdot\>A<rsub|W<rsup|<around|(|k|)>>><around|(|\<omega\>,t|)>
    </equation>

    where <math|W=X,Y> and the modulating functions for derivatives are
    computed as

    <\equation>
      <label|eq:modulating_derivatives>A<rsub|W<rsup|<around|(|i|)>>><around|(|\<omega\>,t|)>=e<rsup|-j*\<omega\>*t>*<frac|\<partial\><rsup|i>|\<partial\>*t<rsup|i>>*<around|[|A<rsub|W><around|(|\<omega\>,t|)>\<cdot\>e<rsup|j*\<omega\>*t>|]>
    </equation>
  </theorem>

  <\proof>
    The evolutionary cross-PSD captures the time-varying spectral
    relationships between different derivatives of the processes.
    Equation<nbsp><eqref|eq:modulating_derivatives> provides the derivative
    relationship through the chain rule applied to the time-frequency
    modulating functions, accounting for the complex exponential factors.
  </proof>

  <section|Pre-Envelope Covariance Structure>

  <\lemma>
    [Pre-Envelope Covariance Matrix]<label|lem:covariance_matrix> The
    pre-envelope covariance relationships are expressed through

    <\equation>
      <label|eq:covariance_matrix>\<bbb-E\>*<around|[|S<rsup|\<ast\>><around|(|t|)>*S<rsup|T><around|(|t|)>|]>=<text|spectral
      moment matrix>
    </equation>

    where <math|S<around|(|t|)>> represents the complex modal response vector
    in the pre-envelope formulation.
  </lemma>

  <\proof>
    This relationship follows from the complex modal decomposition of the
    system response. The spectral moment matrix captures all second-order
    statistical properties of the complex modal responses, providing a
    complete characterization for Gaussian processes.
  </proof>

  <section|Time-Variant Spectral Parameters>

  <\theorem>
    [Central Frequency and Bandwidth]<label|thm:freq_bandwidth> Using the
    pre-envelope formulation, the central frequency and bandwidth parameter
    are defined as:

    <\enumerate>
      <item>Central frequency:

      <\equation>
        <label|eq:central_freq>\<omega\><rsub|c><around|(|t|)>=<frac|c<rsub|01,X*Y><around|(|t|)>|c<rsub|00,X*X><around|(|t|)>>=<frac|\<sigma\><rsub|X*<wide|Y|\<dot\>>><around|(|t|)>|\<sigma\><rsub|X><rsup|2><around|(|t|)>>
      </equation>

      <item>Bandwidth parameter:

      <\equation>
        <label|eq:bandwidth>q<around|(|t|)>=<sqrt|1-<frac|<around|[|c<rsub|01,X*Y><around|(|t|)>|]><rsup|2>|\<sigma\><rsub|X><rsup|2><around|(|t|)>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>>=<sqrt|1-<frac|\<sigma\><rsub|X*<wide|Y|\<dot\>>><rsup|2><around|(|t|)>|\<sigma\><rsub|X><rsup|2><around|(|t|)>*\<sigma\><rsub|<wide|X|\<dot\>>><rsup|2><around|(|t|)>>>
      </equation>
    </enumerate>
  </theorem>

  <\proof>
    The central frequency in equation<nbsp><eqref|eq:central_freq> provides
    the instantaneous predominant frequency through the ratio of the
    first-order cross-covariance to the variance. The bandwidth parameter in
    equation<nbsp><eqref|eq:bandwidth> measures the spectral concentration,
    with values approaching zero for narrowband processes and approaching
    unity for broadband processes.
  </proof>

  <section|Closed-Form Solution for Unit-Step Modulation>

  <\theorem>
    [Unit-Step Solution]<label|thm:unit_step> For a unit-step modulated white
    noise input, the cross-covariance <math|\<sigma\><rsub|X*<wide|Y|\<dot\>>><around|(|t|)>>
    has the exact closed-form solution

    <\align>
      <tformat|<table|<row|<cell|<label|eq:unit_step_solution>\<sigma\><rsub|X*<wide|Y|\<dot\>>><around|(|t|)>>|<cell|=<frac|j*\<phi\><rsub|0>|2*\<xi\>*\<omega\><rsub|0>*\<omega\><rsub|d>>*<around*|[|E<rsub|1>*<around|(|-\<lambda\><rsub|1>*t|)>-E<rsub|1>*<around|(|-\<lambda\><rsub|2>*t|)>-2*j*arctan
      <around*|(|<sqrt|<frac|1-\<xi\><rsup|2>|\<xi\><rsup|2>>>|)>|]>>>|<row|<cell|>|<cell|<space|1em>+<frac|j*\<phi\><rsub|0>|2*\<xi\>*\<omega\><rsub|0>*\<omega\><rsub|d>>*e<rsup|-2*\<xi\>*\<omega\><rsub|0>*t>*<around*|[|E<rsub|1>*<around|(|\<lambda\><rsub|1>*t|)>-E<rsub|1>*<around|(|\<lambda\><rsub|2>*t|)>+2*j*<around*|(|\<pi\>-arctan
      <around*|(|<sqrt|<frac|1-\<xi\><rsup|2>|\<xi\><rsup|2>>>|)>|)>|]><eq-number>>>>>
    </align>

    where <math|E<rsub|1><around|(|x|)>> is the exponential integral
    function, <math|\<lambda\><rsub|1,2>=-\<xi\>*\<omega\><rsub|0>\<pm\>j*\<omega\><rsub|d>>,
    <math|\<omega\><rsub|d>=\<omega\><rsub|0>*<sqrt|1-\<xi\><rsup|2>>>, and
    <math|\<phi\><rsub|0>> is the white noise spectral density.
  </theorem>

  <\proof>
    This closed-form solution is derived using Cauchy's residue theorem
    applied to the complex modal decomposition. The exponential integral
    functions <math|E<rsub|1><around|(|x|)>> arise naturally from the
    integration of the complex exponential functions over the frequency
    domain. The solution captures both the transient and steady-state
    behavior of the cross-covariance function for the unit-step modulated
    excitation.

    The derivation involves:

    <\enumerate>
      <item>Application of complex modal analysis to decompose the system
      response

      <item>Use of the orthogonal increment process properties

      <item>Integration using Cauchy's residue theorem in the complex plane

      <item>Evaluation of the resulting integrals in terms of exponential
      integral functions
    </enumerate>

    The two terms in equation<nbsp><eqref|eq:unit_step_solution> represent
    the growing component (first term) and the decaying transient component
    (second term) of the cross-covariance function.
  </proof>

  <\corollary>
    [Asymptotic Behavior]<label|cor:asymptotic> As <math|t\<to\>\<infty\>>,
    the solution in Theorem<nbsp><reference|thm:unit_step> approaches the
    stationary value

    <\equation>
      <label|eq:stationary_value>\<sigma\><rsub|X*<wide|Y|\<dot\>>,\<infty\>>=<frac|\<phi\><rsub|0>|\<xi\>*\<omega\><rsub|0>*\<omega\><rsub|d>>*arctan
      <around*|(|<sqrt|<frac|1-\<xi\><rsup|2>|\<xi\><rsup|2>>>|)>
    </equation>
  </corollary>

  <\proof>
    This follows from the asymptotic properties of the exponential integral
    function and the fact that the exponentially decaying term in
    equation<nbsp><eqref|eq:unit_step_solution> vanishes as
    <math|t\<to\>\<infty\>>.
  </proof>

  <section|Applications and Implications>

  The results presented in this work have significant implications for:

  <\enumerate>
    <item>Structural dynamics analysis of non-classically damped systems

    <item>Time-variant reliability assessment of engineering structures

    <item>Signal processing applications involving complex-valued processes

    <item>Random vibration theory for non-stationary excitations
  </enumerate>

  The closed-form solutions enable efficient computation of time-variant
  spectral characteristics without numerical integration, providing both
  computational advantages and theoretical insights into the evolution of
  spectral properties for linear systems under non-stationary excitation.

  <\thebibliography|9>
    <bibitem|barbato2008>M. Barbato and J.P. Conte. Spectral characteristics
    of non-stationary random processes: Theory and applications to linear
    structural models. <with|font-shape|italic|Probabilistic Engineering
    Mechanics>, 23(4):416\U426, 2008.

    <bibitem|kuleuven2011>Author Name. On the integral and differential
    evaluation of non-geometric spectral characteristics. In
    <with|font-shape|italic|Proceedings of EURODYN 2011>, pages MS16\U294,
    2011.
  </thebibliography>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|2>>
    <associate|auto-5|<tuple|5|2>>
    <associate|auto-6|<tuple|6|2>>
    <associate|auto-7|<tuple|7|3>>
    <associate|auto-8|<tuple|8|4>>
    <associate|auto-9|<tuple|4|4>>
    <associate|bib-barbato2008|<tuple|barbato2008|4>>
    <associate|bib-kuleuven2011|<tuple|kuleuven2011|4>>
    <associate|cor:asymptotic|<tuple|8|3>>
    <associate|def:ngsc|<tuple|3|1>>
    <associate|def:pre_envelope|<tuple|1|1>>
    <associate|eq:bandwidth|<tuple|10|3>>
    <associate|eq:central_freq|<tuple|9|2>>
    <associate|eq:covariance_matrix|<tuple|8|2>>
    <associate|eq:cross_psd|<tuple|6|2>>
    <associate|eq:hilbert_transform|<tuple|2|1>>
    <associate|eq:modulating_derivatives|<tuple|7|2>>
    <associate|eq:ngsc_type1|<tuple|4|1>>
    <associate|eq:ngsc_type2|<tuple|5|2>>
    <associate|eq:pre_envelope_def|<tuple|1|1>>
    <associate|eq:spectral_rep|<tuple|3|1>>
    <associate|eq:stationary_value|<tuple|12|3>>
    <associate|eq:unit_step_solution|<tuple|7|3>>
    <associate|lem:covariance_matrix|<tuple|5|2>>
    <associate|thm:cross_psd|<tuple|4|2>>
    <associate|thm:freq_bandwidth|<tuple|6|2>>
    <associate|thm:spectral_rep|<tuple|2|1>>
    <associate|thm:unit_step|<tuple|7|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Pre-Envelope
      Process Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Spectral
      Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Non-Geometric
      Spectral Characteristics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Evolutionary
      Cross-Power Spectral Density Functions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Pre-Envelope
      Covariance Structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Time-Variant
      Spectral Parameters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Closed-Form
      Solution for Unit-Step Modulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Applications
      and Implications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>