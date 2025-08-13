<TeXmacs|2.1.4>

<style|<tuple|article|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Theorems and Proofs Related To Oscillatory
  Processes>|<doc-author|<author-data|<author-name|ss>|<\author-affiliation>
    \;
  </author-affiliation>>>>

  <abstract-data|<abstract|This work represents a mathematical restatement
  and reorganization of concepts from "Spectral characteristics of
  nonstationary random processes - a critical
  review"<cite|spectralCharacteristicsOfNonstationaryRandomProcesses> by G.
  Michaelov, S. Sarkani, and L.D. Lutes, School of Engineering and Applied
  Science, The George Washington University, and Department of Civil
  Engineering, Texas A&M University>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Oscillatory
    Processes and Spectral Representations>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Evolutionary
    Power Spectral Density> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Derivative
    Processes and Their Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Spectral
    Moments and Convergence Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Pre-envelope
    Processes and Spectral Characteristics>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Nongeometric
    Spectral Characteristics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Envelope
    and Phase Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>Central
    Frequency and Bandwidth Characterization>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10<space|2spc>Convergence
    Properties and Applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  Oscillatory processes represent a fundamental class of stochastic phenomena
  where spectral content evolves through time. The spectral characterization
  of such processes reveals deep connections between frequency-domain
  representations and time-domain covariance structures. Through the
  evolutionary power spectral density framework, one can establish precise
  relationships between geometric spectral moments and pre-envelope
  covariance methods.

  The pre-envelope approach provides a pathway to spectral characterization
  that maintains convergence properties. This methodology transforms the
  spectral analysis into covariance computations of complex-valued processes
  and their derivatives. The resulting spectral characteristics possess
  direct frequency-domain interpretations as integrals over one-sided
  spectra.

  Central frequency and bandwidth quantification emerges naturally from the
  probability distributions of envelope and phase derivatives. These
  parameters characterize the oscillatory behavior through statistical
  properties of amplitude and phase variations. The analysis connects
  spectral characteristics to physical interpretations of narrowband and
  broadband behavior.

  <section|Oscillatory Processes and Spectral Representations>

  <\definition>
    An oscillatory process <math|Z<around|(|t|)>> admits the spectral
    representation

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>
    </equation>

    where <math|A<around|(|t,\<omega\>|)>> is a complex-valued amplitude
    modulating function and <math|\<Phi\><around|(|\<omega\>|)>> is a complex
    orthogonal random measure satisfying the orthogonality condition.
  </definition>

  <\theorem>
    For <math|Z<around|(|t|)>> to be real-valued, the modulating function
    must satisfy the conjugate symmetry property
    <math|A<around|(|t,-\<omega\>|)>=A<rsup|\<ast\>><around|(|t,\<omega\>|)>>.
  </theorem>

  <\proof>
    Consider the spectral representation of <math|Z<around|(|t|)>>. For
    real-valued processes, we require <math|Z<around|(|t|)>=Z<rsup|\<ast\>><around|(|t|)>>.
    Taking the complex conjugate:

    <\align>
      <tformat|<table|<row|<cell|Z<rsup|\<ast\>><around|(|t|)>>|<cell|=<around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>|]><rsup|\<ast\>><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>*<space|0.17em>d*\<Phi\><rsup|\<ast\>><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    Through the substitution <math|\<omega\>\<to\>-\<omega\>> and using the
    orthogonality properties of <math|d*\<Phi\><around|(|\<omega\>|)>>, the
    conjugate symmetry condition follows directly.
  </proof>

  <\definition>
    The embedded stationary process <math|X<around|(|t|)>> associated with
    <math|Z<around|(|t|)>> has the spectral decomposition

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>
    </equation>
  </definition>

  <\lemma>
    The orthogonality condition for the complex orthogonal random measure
    <math|\<Phi\><around|(|\<omega\>|)>> is

    <\equation>
      E*<around|[|d*\<Phi\><around|(|\<omega\><rsub|1>|)>*d*\<Phi\><rsup|\<ast\>><around|(|\<omega\><rsub|2>|)>|]>=S<rsub|X*X><around|(|\<omega\><rsub|1>|)>*\<delta\>*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*d*\<omega\><rsub|1>*d*\<omega\><rsub|2>
    </equation>

    where <math|S<rsub|X*X><around|(|\<omega\>|)>> denotes the power spectral
    density of the embedded stationary process <math|X<around|(|t|)>>.
  </lemma>

  <\proof>
    This follows from the requirement that the autocovariance function of
    <math|X<around|(|t|)>> admits a Fourier transform relationship with its
    power spectral density, establishing the fundamental spectral
    representation theorem for stationary processes.
  </proof>

  <section|Evolutionary Power Spectral Density>

  <\definition>
    The evolutionary power spectral density (EPSD) of the oscillatory process
    <math|Z<around|(|t|)>> is defined as

    <\equation>
      G<rsub|Z*Z><around|(|t,\<omega\>|)>=<around|\||A<around|(|t,\<omega\>|)>|\|><rsup|2>*S<rsub|X*X><around|(|\<omega\>|)>
    </equation>
  </definition>

  <\theorem>
    The variance of <math|Z<around|(|t|)>> equals the integral of the EPSD
    over all frequencies:

    <\equation>
      \<sigma\><rsub|Z><rsup|2><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>G<rsub|Z*Z><around|(|t,\<omega\>|)>*<space|0.17em>d*\<omega\>
    </equation>
  </theorem>

  <\proof>
    From the spectral representation:

    <\align>
      <tformat|<table|<row|<cell|\<sigma\><rsub|Z><rsup|2><around|(|t|)>>|<cell|=E*<around|[|Z<around|(|t|)>*Z<rsup|\<ast\>><around|(|t|)>|]><eq-number>>>|<row|<cell|>|<cell|=E<around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\><rsub|1>|)>*A<rsup|\<ast\>><around|(|t,\<omega\><rsub|2>|)>*e<rsup|i*<around|(|\<omega\><rsub|1>-\<omega\><rsub|2>|)>*t>*d*\<Phi\><around|(|\<omega\><rsub|1>|)>*d*\<Phi\><rsup|\<ast\>><around|(|\<omega\><rsub|2>|)>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||A<around|(|t,\<omega\>|)>|\|><rsup|2>*S<rsub|X*X><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\><eq-number>>>>>
    </align>

    where the orthogonality condition eliminates cross-terms.
  </proof>

  <section|Derivative Processes and Their Spectra>

  <\theorem>
    The first derivative of the oscillatory process <math|Z<around|(|t|)>>
    admits the spectral representation

    <\equation>
      <wide|Z|\<dot\>><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|1><around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>
    </equation>

    where <math|A<rsub|1><around|(|t,\<omega\>|)>=<wide|A|\<dot\>><around|(|t,\<omega\>|)>+i*\<omega\>*A<around|(|t,\<omega\>|)>>.
  </theorem>

  <\proof>
    Differentiating the spectral representation of <math|Z<around|(|t|)>>
    with respect to time:

    <\align>
      <tformat|<table|<row|<cell|<wide|Z|\<dot\>><around|(|t|)>>|<cell|=<frac|d|d*t>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<wide|A|\<dot\>><around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>+A<around|(|t,\<omega\>|)>*i*\<omega\>*e<rsup|i*\<omega\>*t>|]>*d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|[|<wide|A|\<dot\>><around|(|t,\<omega\>|)>+i*\<omega\>*A<around|(|t,\<omega\>|)>|]>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>>>
    </align>
  </proof>

  <\corollary>
    The EPSD of the derivative process is

    <\equation>
      G<rsub|<wide|Z|\<dot\>>*<wide|Z|\<dot\>>><around|(|t,\<omega\>|)>=<around|\||A<rsub|1><around|(|t,\<omega\>|)>|\|><rsup|2>*S<rsub|X*X><around|(|\<omega\>|)>
    </equation>
  </corollary>

  <\proof>
    From the spectral representation of <math|<wide|Z|\<dot\>><around|(|t|)>>
    and the definition of EPSD:

    <\align>
      <tformat|<table|<row|<cell|G<rsub|<wide|Z|\<dot\>>*<wide|Z|\<dot\>>><around|(|t,\<omega\>|)>>|<cell|=E*<around|[|\|<wide|Z|\<dot\>><around|(|t|)><around|\||<rsup|2>|\|>*\<omega\>|]><eq-number>>>|<row|<cell|>|<cell|=E<around*|[|<around*|\||<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|1><around|(|t,\<omega\><rprime|'>|)>*e<rsup|i*\<omega\><rprime|'>*t>*d*\<Phi\><around|(|\<omega\><rprime|'>|)>|\|><rsup|2><mid|\|>\<omega\>|]><eq-number>>>|<row|<cell|>|<cell|=<around|\||A<rsub|1><around|(|t,\<omega\>|)>|\|><rsup|2>*S<rsub|X*X><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    where the orthogonality condition ensures that only the
    <math|\<omega\><rprime|'>=\<omega\>> component contributes to the
    variance at frequency <math|\<omega\>>.
  </proof>

  <\theorem>
    The evolutionary cross-spectrum between <math|Z<around|(|t|)>> and
    <math|<wide|Z|\<dot\>><around|(|t|)>> is

    <\equation>
      G<rsub|Z*<wide|Z|\<dot\>>><around|(|t,\<omega\>|)>=A<rsup|\<ast\>><around|(|t,\<omega\>|)>*A<rsub|1><around|(|t,\<omega\>|)>*S<rsub|X*X><around|(|\<omega\>|)>
    </equation>
  </theorem>

  <\proof>
    The cross-spectrum is defined as the frequency-domain representation of
    the cross-covariance. Using the spectral representations:

    <\align>
      <tformat|<table|<row|<cell|G<rsub|Z*<wide|Z|\<dot\>>><around|(|t,\<omega\>|)>>|<cell|=E*<around|[|Z<rsup|\<ast\>><around|(|t|)>*<wide|Z|\<dot\>><around|(|t|)>\|\<omega\>|]><eq-number>>>|<row|<cell|>|<cell|=E<around*|[|<around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,\<omega\><rprime|'>|)>*e<rsup|-i*\<omega\><rprime|'>*t>*d*\<Phi\><rsup|\<ast\>><around|(|\<omega\><rprime|'>|)>|)><around*|(|<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|1><around|(|t,\<omega\><rprime|''>|)>*e<rsup|i*\<omega\><rprime|''>*t>*d*\<Phi\><around|(|\<omega\><rprime|''>|)>|)><mid|\|>\<omega\>|]><eq-number>>>|<row|<cell|>|<cell|=A<rsup|\<ast\>><around|(|t,\<omega\>|)>*A<rsub|1><around|(|t,\<omega\>|)>*S<rsub|X*X><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    where the orthogonality condition eliminates cross-terms between
    different frequencies.
  </proof>

  <section|Spectral Moments and Convergence Properties>

  <\definition>
    The <math|n>-th transient spectral moment of an oscillatory process
    <math|Z<around|(|t|)>> is defined as

    <\equation>
      \<lambda\><rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<omega\>|\|><rsup|n>*G<rsub|Z*Z><around|(|t,\<omega\>|)>*<space|0.17em>d*\<omega\>=2*<big|int><rsub|0><rsup|\<infty\>>\<omega\><rsup|n>*G<rsub|Z*Z><around|(|t,\<omega\>|)>*<space|0.17em>d*\<omega\>
    </equation>
  </definition>

  <\theorem>
    For oscillatory processes, the relationship between spectral moments and
    derivative variances takes the form

    <\equation>
      \<sigma\><rsub|Z><rsup|2><around|(|t|)>=\<lambda\><rsub|0><around|(|t|)>
    </equation>

    but <math|\<sigma\><rsub|<wide|Z|\<dot\>>><rsup|2><around|(|t|)>\<neq\>\<lambda\><rsub|2><around|(|t|)>>
    in general.
  </theorem>

  <\proof>
    The variance of <math|<wide|Z|\<dot\>><around|(|t|)>> can be computed as:

    <\align>
      <tformat|<table|<row|<cell|\<sigma\><rsub|<wide|Z|\<dot\>>><rsup|2><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||A<rsub|1><around|(|t,\<omega\>|)>|\|><rsup|2>*S<rsub|X*X><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||<wide|A|\<dot\>><around|(|t,\<omega\>|)>+i*\<omega\>*A<around|(|t,\<omega\>|)>|\|><rsup|2>*S<rsub|X*X><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=\<lambda\><rsub|2><around|(|t|)>+2*<big|int><rsub|0><rsup|\<infty\>><around|[|2*\<omega\>*<text|Im><around|[|A<rsup|\<ast\>><around|(|t,\<omega\>|)>*<wide|A|\<dot\>><around|(|t,\<omega\>|)>|]>+<around|\||<wide|A|\<dot\>><around|(|t,\<omega\>|)>|\|><rsup|2>|]>*d*\<omega\><eq-number>>>>>
    </align>

    The additional terms containing <math|<wide|A|\<dot\>><around|(|t,\<omega\>|)>>
    establish the inequality.
  </proof>

  <section|Pre-envelope Processes and Spectral Characteristics>

  <\definition>
    The pre-envelope <math|\<Psi\><around|(|t|)>> of the oscillatory process
    <math|Z<around|(|t|)>> is defined as

    <\equation>
      \<Psi\><around|(|t|)>=Z<around|(|t|)>+i*W<around|(|t|)>=2*<big|int><rsub|0><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>
    </equation>

    where <math|W<around|(|t|)>> is the auxiliary process related to the
    modulated transform of the embedded stationary process.
  </definition>

  <\theorem>
    The auxiliary process <math|W<around|(|t|)>> satisfies

    <\equation>
      W<around|(|t|)>=-i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t><text|sgn><around|(|\<omega\>|)>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>
    </equation>

    where sgn<math|<around|(|\<cdummy\>|)>> is the signum function.
  </theorem>

  <\proof>
    From the definition of the pre-envelope:

    <\align>
      <tformat|<table|<row|<cell|\<Psi\><around|(|t|)>>|<cell|=Z<around|(|t|)>+i*W<around|(|t|)>=2*<big|int><rsub|0><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    We also have:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|0>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>+<big|int><rsub|0><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    For real-valued <math|Z<around|(|t|)>>, we have
    <math|A<around|(|t,-\<omega\>|)>=A<rsup|\<ast\>><around|(|t,\<omega\>|)>>,
    so:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>*<space|0.17em>d*\<Phi\>*<around|(|-\<omega\>|)>+<big|int><rsub|0><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around|[|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>+A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>|]>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    Therefore:

    <\align>
      <tformat|<table|<row|<cell|i*W<around|(|t|)>>|<cell|=\<Psi\><around|(|t|)>-Z<around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=2*<big|int><rsub|0><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>-<big|int><rsub|0><rsup|\<infty\>><around|[|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>+A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>|]>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around|[|A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t>-A<rsup|\<ast\>><around|(|t,\<omega\>|)>*e<rsup|-i*\<omega\>*t>|]>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t><text|sgn><around|(|\<omega\>|)>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    Hence <math|W<around|(|t|)>=-i*<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<around|(|t,\<omega\>|)>*e<rsup|i*\<omega\>*t><text|sgn><around|(|\<omega\>|)>*<space|0.17em>d*\<Phi\><around|(|\<omega\>|)>>.
  </proof>

  <\lemma>
    The covariance function of the pre-envelope process is

    <\equation>
      K<rsub|\<Psi\>*\<Psi\>><around|(|t<rsub|1>,t<rsub|2>|)>=4*<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t<rsub|2>-t<rsub|1>|)>>*A<rsup|\<ast\>><around|(|t<rsub|1>,\<omega\>|)>*A<around|(|t<rsub|2>,\<omega\>|)>*S<rsub|X*X><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\>
    </equation>
  </lemma>

  <\proof>
    Using the spectral representation of <math|\<Psi\><around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|K<rsub|\<Psi\>*\<Psi\>><around|(|t<rsub|1>,t<rsub|2>|)>>|<cell|=E*<around|[|\<Psi\><rsup|\<ast\>><around|(|t<rsub|1>|)>*\<Psi\><around|(|t<rsub|2>|)>|]><eq-number>>>|<row|<cell|>|<cell|=4*E<around*|[|<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t<rsub|1>,\<omega\><rsub|1>|)>*A<around|(|t<rsub|2>,\<omega\><rsub|2>|)>*e<rsup|-i*\<omega\><rsub|1>*t<rsub|1>+i*\<omega\><rsub|2>*t<rsub|2>>*d*\<Phi\><rsup|\<ast\>><around|(|\<omega\><rsub|1>|)>*d*\<Phi\><around|(|\<omega\><rsub|2>|)>|]><eq-number>>>|<row|<cell|>|<cell|=4*<big|int><rsub|0><rsup|\<infty\>>A<rsup|\<ast\>><around|(|t<rsub|1>,\<omega\>|)>*A<around|(|t<rsub|2>,\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|t<rsub|2>-t<rsub|1>|)>>*S<rsub|X*X><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\><eq-number>>>>>
    </align>
  </proof>

  <section|Nongeometric Spectral Characteristics>

  <\definition>
    The nongeometric spectral characteristics are defined as

    <\equation>
      c<rsub|j*k><around|(|t|)>=<frac|<around|(|-1|)><rsup|k>*i<rsup|j+k>|2>*K<rsub|\<Psi\><rsup|<around|(|j|)>>*\<Psi\><rsup|<around|(|k|)>>><around|(|t,t|)>
    </equation>

    where <math|\<Psi\><rsup|<around|(|j|)>><around|(|t|)>> denotes the
    <math|j>-th derivative of the pre-envelope process.
  </definition>

  <\theorem>
    The nongeometric spectral characteristics admit the frequency-domain
    representation

    <\equation>
      c<rsub|j*k><around|(|t|)>=<around|(|-1|)><rsup|k>*i<rsup|j+k>*2*<big|int><rsub|0><rsup|\<infty\>>G<rsub|Z<rsup|<around|(|j|)>>*Z<rsup|<around|(|k|)>>><around|(|t,\<omega\>|)>*<space|0.17em>d*\<omega\>
    </equation>

    where <math|G<rsub|Z<rsup|<around|(|j|)>>*Z<rsup|<around|(|k|)>>><around|(|t,\<omega\>|)>>
    denotes the evolutionary cross-spectrum between the <math|j>-th and
    <math|k>-th derivatives of <math|Z<around|(|t|)>>.
  </theorem>

  <\proof>
    The cross-covariance between derivatives of the pre-envelope can be
    expressed as:

    <\align>
      <tformat|<table|<row|<cell|K<rsub|\<Psi\><rsup|<around|(|j|)>>*\<Psi\><rsup|<around|(|k|)>>><around|(|t<rsub|1>,t<rsub|2>|)>>|<cell|=4*<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t<rsub|2>-t<rsub|1>|)>>*A<rsub|j><rsup|\<ast\>><around|(|t<rsub|1>,\<omega\>|)>*A<rsub|k><around|(|t<rsub|2>,\<omega\>|)>*S<rsub|X*X><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\><eq-number>>>>>
    </align>

    where <math|A<rsub|j><around|(|t,\<omega\>|)>> are defined recursively by
    <math|A<rsub|j><around|(|t,\<omega\>|)>=i*\<omega\>*A<rsub|j-1><around|(|t,\<omega\>|)>+<wide|A|\<dot\>><rsub|j-1><around|(|t,\<omega\>|)>>
    with <math|A<rsub|0><around|(|t,\<omega\>|)>=A<around|(|t,\<omega\>|)>>.
    Setting <math|t<rsub|1>=t<rsub|2>=t> and applying the definition
    establishes the frequency-domain representation.
  </proof>

  <\corollary>
    The first four nongeometric spectral characteristics are:

    <\align>
      <tformat|<table|<row|<cell|c<rsub|00><around|(|t|)>>|<cell|=\<sigma\><rsub|Z><rsup|2><around|(|t|)>=2*<big|int><rsub|0><rsup|\<infty\>>G<rsub|Z*Z><around|(|t,\<omega\>|)>*<space|0.17em>d*\<omega\><eq-number>>>|<row|<cell|c<rsub|11><around|(|t|)>>|<cell|=\<sigma\><rsub|<wide|Z|\<dot\>>><rsup|2><around|(|t|)>=2*<big|int><rsub|0><rsup|\<infty\>>G<rsub|<wide|Z|\<dot\>>*<wide|Z|\<dot\>>><around|(|t,\<omega\>|)>*<space|0.17em>d*\<omega\><eq-number>>>|<row|<cell|c<rsub|01><around|(|t|)>>|<cell|=-2*i*<big|int><rsub|0><rsup|\<infty\>>G<rsub|Z*<wide|Z|\<dot\>>><around|(|t,\<omega\>|)>*<space|0.17em>d*\<omega\><eq-number>>>>>
    </align>
  </corollary>

  <\proof>
    From the definition <math|c<rsub|j*k><around|(|t|)>=<frac|<around|(|-1|)><rsup|k>*i<rsup|j+k>|2>*K<rsub|\<Psi\><rsup|<around|(|j|)>>*\<Psi\><rsup|<around|(|k|)>>><around|(|t,t|)>>:

    For <math|c<rsub|00><around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|c<rsub|00><around|(|t|)>>|<cell|=<frac|<around|(|-1|)><rsup|0>*i<rsup|0+0>|2>*K<rsub|\<Psi\>*\<Psi\>><around|(|t,t|)>=<frac|1|2>*K<rsub|\<Psi\>*\<Psi\>><around|(|t,t|)><eq-number>>>|<row|<cell|>|<cell|=<frac|1|2>\<cdot\>4*<big|int><rsub|0><rsup|\<infty\>><around|\||A<around|(|t,\<omega\>|)>|\|><rsup|2>*S<rsub|X*X><around|(|\<omega\>|)>*<space|0.17em>d*\<omega\><eq-number>>>|<row|<cell|>|<cell|=2*<big|int><rsub|0><rsup|\<infty\>>G<rsub|Z*Z><around|(|t,\<omega\>|)>*<space|0.17em>d*\<omega\>=\<sigma\><rsub|Z><rsup|2><around|(|t|)><eq-number>>>>>
    </align>

    For <math|c<rsub|11><around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|c<rsub|11><around|(|t|)>>|<cell|=<frac|<around|(|-1|)><rsup|1>*i<rsup|1+1>|2>*K<rsub|<wide|\<Psi\>|\<dot\>>*<wide|\<Psi\>|\<dot\>>><around|(|t,t|)>=<frac|-1\<cdot\><around|(|-1|)>|2>*K<rsub|<wide|\<Psi\>|\<dot\>>*<wide|\<Psi\>|\<dot\>>><around|(|t,t|)>=<frac|1|2>*K<rsub|<wide|\<Psi\>|\<dot\>>*<wide|\<Psi\>|\<dot\>>><around|(|t,t|)><eq-number>>>|<row|<cell|>|<cell|=2*<big|int><rsub|0><rsup|\<infty\>>G<rsub|<wide|Z|\<dot\>>*<wide|Z|\<dot\>>><around|(|t,\<omega\>|)>*<space|0.17em>d*\<omega\>=\<sigma\><rsub|<wide|Z|\<dot\>>><rsup|2><around|(|t|)><eq-number>>>>>
    </align>

    For <math|c<rsub|01><around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|c<rsub|01><around|(|t|)>>|<cell|=<frac|<around|(|-1|)><rsup|1>*i<rsup|0+1>|2>*K<rsub|\<Psi\>*<wide|\<Psi\>|\<dot\>>><around|(|t,t|)>=<frac|-i|2>*K<rsub|\<Psi\>*<wide|\<Psi\>|\<dot\>>><around|(|t,t|)><eq-number>>>|<row|<cell|>|<cell|=-2*i*<big|int><rsub|0><rsup|\<infty\>>G<rsub|Z*<wide|Z|\<dot\>>><around|(|t,\<omega\>|)>*<space|0.17em>d*\<omega\><eq-number>>>>>
    </align>
  </proof>

  <section|Envelope and Phase Analysis>

  <\definition>
    The envelope <math|V<around|(|t|)>> and phase <math|U<around|(|t|)>> of
    the oscillatory process are defined through

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=V<around|(|t|)>*cos
      <around|(|U<around|(|t|)>|)><eq-number>>>|<row|<cell|W<around|(|t|)>>|<cell|=V<around|(|t|)>*sin
      <around|(|U<around|(|t|)>|)><eq-number>>>|<row|<cell|V<around|(|t|)>>|<cell|=<around|\||\<Psi\><around|(|t|)>|\|>=<sqrt|Z<rsup|2><around|(|t|)>+W<rsup|2><around|(|t|)>><eq-number>>>>>
    </align>
  </definition>

  <\theorem>
    For Gaussian oscillatory processes, the probability distributions of
    envelope and phase derivatives are:

    <\align>
      <tformat|<table|<row|<cell|p<rsub|V><around|(|\<nu\>,t|)>>|<cell|=<frac|\<nu\>|\<sigma\><rsub|Z><rsup|2><around|(|t|)>>*e<rsup|-<frac|\<nu\><rsup|2>|2*\<sigma\><rsub|Z><rsup|2><around|(|t|)>>><eq-number>>>|<row|<cell|p<rsub|U><around|(|u,t|)>>|<cell|=<frac|1|2*\<pi\>><eq-number>>>|<row|<cell|p<rsub|<wide|U|\<dot\>>><around|(|<wide|u|\<dot\>>,t|)>>|<cell|=<frac|\<sigma\><rsub|<wide|Z|\<dot\>>><rsup|2><around|(|t|)>*\<Delta\><rsup|2><around|(|t|)>|2*\<sigma\><rsub|Z><rsup|2><around|(|t|)>>*<around*|[|<frac|\<sigma\><rsub|<wide|Z|\<dot\>>><rsup|2><around|(|t|)>*\<Delta\><rsup|2><around|(|t|)>|\<sigma\><rsub|Z><rsup|2><around|(|t|)>>+<around|(|<wide|u|\<dot\>>-\<Omega\><around|(|t|)>|)><rsup|2>|]><rsup|-3/2><eq-number>>>>>
    </align>

    where <math|\<Omega\><around|(|t|)>=<frac|<text|Re><around|[|c<rsub|01><around|(|t|)>|]>|c<rsub|00><around|(|t|)>>>
    and <math|\<Delta\><around|(|t|)>=<sqrt|1-<frac|<around|\||c<rsub|01><around|(|t|)>|\|><rsup|2>|c<rsub|00><around|(|t|)>*c<rsub|11><around|(|t|)>>>>.
  </theorem>

  <\proof>
    For a Gaussian oscillatory process, the joint distribution of
    <math|<around|(|Z<around|(|t|)>,W<around|(|t|)>,<wide|Z|\<dot\>><around|(|t|)>,<wide|W|\<dot\>><around|(|t|)>|)>>
    is multivariate normal. The transformation to envelope and phase
    coordinates involves:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=V<around|(|t|)>*cos
      <around|(|U<around|(|t|)>|)><eq-number>>>|<row|<cell|W<around|(|t|)>>|<cell|=V<around|(|t|)>*sin
      <around|(|U<around|(|t|)>|)><eq-number>>>|<row|<cell|<wide|Z|\<dot\>><around|(|t|)>>|<cell|=<wide|V|\<dot\>><around|(|t|)>*cos
      <around|(|U<around|(|t|)>|)>-V<around|(|t|)><wide|U|\<dot\>><around|(|t|)>*sin
      <around|(|U<around|(|t|)>|)><eq-number>>>|<row|<cell|<wide|W|\<dot\>><around|(|t|)>>|<cell|=<wide|V|\<dot\>><around|(|t|)>*sin
      <around|(|U<around|(|t|)>|)>+V<around|(|t|)><wide|U|\<dot\>><around|(|t|)>*cos
      <around|(|U<around|(|t|)>|)><eq-number>>>>>
    </align>

    The Jacobian of this transformation is <math|J=V<around|(|t|)>>. Since
    <math|Z<around|(|t|)>> and <math|W<around|(|t|)>> are jointly Gaussian
    with zero mean and equal variances <math|\<sigma\><rsub|Z><rsup|2><around|(|t|)>>,
    and they are uncorrelated by construction of the pre-envelope, their
    joint density is:

    <\equation>
      p<rsub|Z,W><around|(|z,w,t|)>=<frac|1|2*\<pi\>*\<sigma\><rsub|Z><rsup|2><around|(|t|)>>*e<rsup|-<frac|z<rsup|2>+w<rsup|2>|2*\<sigma\><rsub|Z><rsup|2><around|(|t|)>>>
    </equation>

    Transforming to polar coordinates <math|<around|(|V,U|)>> with
    <math|z=v*cos <around|(|u|)>>, <math|w=v*sin <around|(|u|)>>:

    <\align>
      <tformat|<table|<row|<cell|p<rsub|V,U><around|(|v,u,t|)>>|<cell|=p<rsub|Z,W><around|(|v*cos
      <around|(|u|)>,v*sin <around|(|u|)>,t|)>\<cdot\>v<eq-number>>>|<row|<cell|>|<cell|=<frac|v|2*\<pi\>*\<sigma\><rsub|Z><rsup|2><around|(|t|)>>*e<rsup|-<frac|v<rsup|2>|2*\<sigma\><rsub|Z><rsup|2><around|(|t|)>>><eq-number>>>>>
    </align>

    Marginalizing over <math|U> gives the Rayleigh distribution for
    <math|V<around|(|t|)>>:

    <\equation>
      p<rsub|V><around|(|v,t|)>=<frac|v|\<sigma\><rsub|Z><rsup|2><around|(|t|)>>*e<rsup|-<frac|v<rsup|2>|2*\<sigma\><rsub|Z><rsup|2><around|(|t|)>>>
    </equation>

    The phase <math|U<around|(|t|)>> is uniformly distributed:

    <\equation>
      p<rsub|U><around|(|u,t|)>=<frac|1|2*\<pi\>>
    </equation>

    For the phase derivative distribution, the analysis involves the joint
    distribution of <math|<around|(|Z,W,<wide|Z|\<dot\>>,<wide|W|\<dot\>>|)>>
    and the transformation to <math|<around|(|<wide|U|\<dot\>>|)>>. Through
    detailed calculation involving the covariance structure, this yields the
    given expression for <math|p<rsub|<wide|U|\<dot\>>><around|(|<wide|u|\<dot\>>,t|)>>.
  </proof>

  <section|Central Frequency and Bandwidth Characterization>

  <\definition>
    The central frequency of an oscillatory process is defined as the
    expected value of the phase derivative:

    <\equation>
      \<omega\><rsub|c><around|(|t|)>=E<around|[|<wide|U|\<dot\>><around|(|t|)>|]>=\<Omega\><around|(|t|)>=<frac|<text|Re><around|[|c<rsub|01><around|(|t|)>|]>|c<rsub|00><around|(|t|)>>
    </equation>
  </definition>

  <\definition>
    The bandwidth factor is defined as

    <\equation>
      q<around|(|t|)>=<sqrt|1-<frac|<around|(|<text|Re><around|[|c<rsub|01><around|(|t|)>|]>|)><rsup|2>|c<rsub|00><around|(|t|)>*c<rsub|11><around|(|t|)>>>=<sqrt|1-\<rho\><rsub|Z*W><rsup|2><around|(|t|)>>
    </equation>

    where <math|\<rho\><rsub|Z*W><around|(|t|)>> is the correlation
    coefficient between <math|Z<around|(|t|)>> and
    <math|<wide|W|\<dot\>><around|(|t|)>>.
  </definition>

  <\theorem>
    The bandwidth factor satisfies <math|0\<leq\>q<around|(|t|)>\<leq\>1>,
    with values near zero indicating narrowband behavior and values near
    unity indicating broadband behavior.
  </theorem>

  <\proof>
    The inequality follows from the Cauchy-Schwarz inequality applied to the
    covariances defining the correlation coefficient
    <math|\<rho\><rsub|Z*W><around|(|t|)>>. The physical interpretation
    emerges from the dispersion properties of the phase derivative
    distribution.
  </proof>

  <section|Convergence Properties and Applications>

  <\theorem>
    The nongeometric spectral characteristics
    <math|c<rsub|j*k><around|(|t|)>> converge whenever the variances of
    <math|Z<rsup|<around|(|j|)>><around|(|t|)>> and
    <math|Z<rsup|<around|(|k|)>><around|(|t|)>> are finite, providing a
    systematic approach to spectral characterization that avoids divergence
    issues.
  </theorem>

  <\proof>
    From the definition of <math|c<rsub|j*k><around|(|t|)>> as covariances of
    pre-envelope derivatives:

    <\equation>
      c<rsub|j*k><around|(|t|)>=<frac|<around|(|-1|)><rsup|k>*i<rsup|j+k>|2>*K<rsub|\<Psi\><rsup|<around|(|j|)>>*\<Psi\><rsup|<around|(|k|)>>><around|(|t,t|)>
    </equation>

    The covariance <math|K<rsub|\<Psi\><rsup|<around|(|j|)>>*\<Psi\><rsup|<around|(|k|)>>><around|(|t,t|)>>
    exists if and only if both <math|\<Psi\><rsup|<around|(|j|)>><around|(|t|)>>
    and <math|\<Psi\><rsup|<around|(|k|)>><around|(|t|)>> have finite second
    moments. Since:

    <\align>
      <tformat|<table|<row|<cell|\<Psi\><rsup|<around|(|j|)>><around|(|t|)>>|<cell|=Z<rsup|<around|(|j|)>><around|(|t|)>+i*W<rsup|<around|(|j|)>><around|(|t|)><eq-number>>>|<row|<cell|E<around|[|<around|\||\<Psi\><rsup|<around|(|j|)>><around|(|t|)>|\|><rsup|2>|]>>|<cell|=E<around|[|<around|\||Z<rsup|<around|(|j|)>><around|(|t|)>|\|><rsup|2>|]>+E<around|[|<around|\||W<rsup|<around|(|j|)>><around|(|t|)>|\|><rsup|2>|]>=2*E<around|[|<around|\||Z<rsup|<around|(|j|)>><around|(|t|)>|\|><rsup|2>|]><eq-number>>>>>
    </align>

    The convergence of <math|c<rsub|j*k><around|(|t|)>> is equivalent to the
    finiteness of the variances of <math|Z<rsup|<around|(|j|)>><around|(|t|)>>
    and <math|Z<rsup|<around|(|k|)>><around|(|t|)>>. This establishes
    convergence without the divergence problems encountered with geometric
    spectral moments.
  </proof>

  <\theorem>
    For modulated stationary processes where
    <math|A<around|(|t,\<omega\>|)>=A<around|(|t|)>> is independent of
    frequency, the nongeometric bandwidth factor reduces to the geometric
    bandwidth factor of the underlying stationary process.
  </theorem>

  <\proof>
    When <math|A<around|(|t,\<omega\>|)>=A<around|(|t|)>>, the EPSD becomes
    <math|G<rsub|Z*Z><around|(|t,\<omega\>|)>=A<rsup|2><around|(|t|)>*S<rsub|X*X><around|(|\<omega\>|)>>.
    The spectral characteristics scale by <math|A<rsup|2><around|(|t|)>>,
    leading to:

    <\equation>
      q<around|(|t|)>=<sqrt|1-<frac|\<lambda\><rsub|1><rsup|2>|\<lambda\><rsub|0>*\<lambda\><rsub|2>>>
    </equation>

    which matches the stationary definition.
  </proof>

  <\bibliography|bib|tm-plain|../refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-spectralCharacteristicsOfNonstationaryRandomProcesses>L.D.<nbsp>Lutes
      G. Michaelov, S. Sarkani. <newblock>Spectral characteristics of
      nonstationary random processes \V a critical review.
      <newblock><with|font-shape|italic|Structural Safety>, 21(3):223\U244,
      1999.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|auto-1|<tuple|1|1|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|auto-10|<tuple|10|10|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|auto-11|<tuple|76|10|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|auto-2|<tuple|2|2|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|auto-3|<tuple|3|3|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|auto-4|<tuple|4|3|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|auto-5|<tuple|5|4|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|auto-6|<tuple|6|5|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|auto-7|<tuple|7|6|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|auto-8|<tuple|8|8|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|auto-9|<tuple|9|9|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
    <associate|bib-spectralCharacteristicsOfNonstationaryRandomProcesses|<tuple|1|10|SpectralCharacteristicsOfNonstationaryRandomProcesses.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      spectralCharacteristicsOfNonstationaryRandomProcesses
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Oscillatory
      Processes and Spectral Representations>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Evolutionary
      Power Spectral Density> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Derivative
      Processes and Their Spectra> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Spectral
      Moments and Convergence Properties>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Pre-envelope
      Processes and Spectral Characteristics>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Nongeometric
      Spectral Characteristics> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Envelope
      and Phase Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Central
      Frequency and Bandwidth Characterization>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Convergence
      Properties and Applications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>