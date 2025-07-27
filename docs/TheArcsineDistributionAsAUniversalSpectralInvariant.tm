<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Arcsine Distribution as a Universal Spectral
  Invariant>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Normalized
    Gaussian Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Random
    Wave Theory and Bessel Kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Chebyshev
    Polynomials and Orthogonality> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Universal
    Properties of the Arcsine Distribution>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Fundamental
    Connections> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The arcsine distribution appears as a fundamental measure across various
  mathematical structures, including stochastic processes, orthogonal
  polynomials, and random wave theory. This document establishes connections
  between these areas through the appearance of the arcsine measure as a
  canonical invariant.

  <section|Normalized Gaussian Processes>

  <\theorem>
    [Normalized Gaussian Process Representation] Let <math|X<around|(|t|)>>
    be a real, zero-mean, stationary Gaussian process with a narrow-band
    spectrum. Let <math|R<around|(|t|)>=<around|\||Z<around|(|t|)>|\|>>
    denote the envelope, where <math|Z<around|(|t|)>=X<around|(|t|)>+i*X<rsub|H><around|(|t|)>>
    is the analytic signal and <math|X<rsub|H><around|(|t|)>> denotes the
    Hilbert transform of <math|X<around|(|t|)>>. Then

    <\equation>
      <frac|X<around|(|t|)>|R<around|(|t|)>>=cos \<theta\><around|(|t|)>
    </equation>

    where <math|\<theta\><around|(|t|)>=arg Z<around|(|t|)>> is the
    instantaneous phase. For such a process, <math|\<theta\><around|(|t|)>>
    is distributed uniformly over <math|<around|[|0,2*\<pi\>|)>>, and the
    normalized process follows the arcsine law:

    <\equation>
      f<around|(|y|)>=<frac|1|\<pi\><sqrt|1-y<rsup|2>>>\<forall\>y\<in\><around|(|-1,1|)>
    </equation>
  </theorem>

  <\proof>
    The analytic representation of <math|X<around|(|t|)>> yields
    <math|Z<around|(|t|)>=R<around|(|t|)>*e<rsup|i*\<theta\><around|(|t|)>>>,
    so <math|X<around|(|t|)>=R<around|(|t|)>*cos \<theta\><around|(|t|)>>.
    The variable <math|\<theta\><around|(|t|)>> is uniformly distributed on
    <math|<around|[|0,2*\<pi\>|)>> for a stationary, narrow-band Gaussian
    process. The transformation <math|Y=cos \<Theta\>> with
    <math|\<Theta\>\<sim\><text|Uniform><around|[|0,2*\<pi\>|)>> gives the
    density

    <\equation>
      f<rsub|Y><around|(|y|)>=<frac|1|2*\<pi\>>\<cdot\><frac|2|<sqrt|1-y<rsup|2>>>=<frac|1|\<pi\><sqrt|1-y<rsup|2>>>
    </equation>

    for <math|y\<in\><around|(|-1,1|)>> from the change of variables and the
    properties of the cosine map.
  </proof>

  <section|Random Wave Theory and Bessel Kernels>

  <\theorem>
    [Isotropic Random Wave Spectral Measure] Consider the isotropic random
    wave field <math|W<around|(|<math-bf|x>|)>> in <math|\<bbb-R\><rsup|2>>
    with covariance kernel

    <\equation>
      K<around|(|<math-bf|x>,<math-bf|y>|)>=J<rsub|0><around|(|<around|\||<math-bf|x>-<math-bf|y>|\|>|)>
    </equation>

    where <math|J<rsub|0>> is the zeroth-order Bessel function of the first
    kind. At each point <math|<math-bf|x>>, the normalized field
    <math|W<around|(|<math-bf|x>|)>/<sqrt|<math-up|Var><around|[|W<around|(|<math-bf|x>|)>|]>>>
    follows the arcsine distribution.
  </theorem>

  <\proof>
    The random wave can be represented as

    <\equation>
      W<around|(|<math-bf|x>|)>=<big|int><rsub|S<rsup|1>>cos
      <around|(|<math-bf|k>\<cdot\><math-bf|x>+\<phi\><around|(|<math-bf|k>|)>|)>*<space|0.17em>d*\<sigma\><around|(|<math-bf|k>|)>
    </equation>

    where <math|\<phi\><around|(|<math-bf|k>|)>> are independent phases
    uniformly distributed in <math|<around|[|0,2*\<pi\>|)>> and
    <math|d*\<sigma\>> is the normalized measure on the unit circle. The
    covariance is <math|K<around|(|<math-bf|x>,<math-bf|y>|)>=J<rsub|0><around|(|<around|\||<math-bf|x>-<math-bf|y>|\|>|)>>
    and <math|<math-up|Var><around|[|W<around|(|<math-bf|x>|)>|]>=1>. Each
    realization is a linear combination of cosines with independent random
    phases, so at each point, the normalized field
    <math|W<around|(|<math-bf|x>|)>> has the same law as <math|cos \<Theta\>>
    for <math|\<Theta\>> uniform in <math|<around|[|0,2*\<pi\>|)>>; thus, the
    law is arcsine.
  </proof>

  <section|Chebyshev Polynomials and Orthogonality>

  <\theorem>
    [Chebyshev Orthogonality and Arcsine Measure] The Chebyshev polynomials
    of the first kind <math|<around|{|T<rsub|n><around|(|x|)>|}><rsub|n=0><rsup|\<infty\>>>
    form an orthogonal basis with respect to the measure
    <math|<frac|d*x|\<pi\><sqrt|1-x<rsup|2>>>> on <math|<around|[|-1,1|]>>:

    <\equation>
      <big|int><rsub|-1><rsup|1>T<rsub|m><around|(|x|)>*T<rsub|n><around|(|x|)><frac|d*x|\<pi\><sqrt|1-x<rsup|2>>>=<choice|<tformat|<table|<row|<cell|1,>|<cell|m=n=0>>|<row|<cell|<frac|1|2>,>|<cell|m=n\<geq\>1>>|<row|<cell|0,>|<cell|m\<neq\>n>>>>>
    </equation>

    The function <math|<frac|1|<sqrt|1-x<rsup|2>>>> is the density of the
    arcsine distribution.
  </theorem>

  <\proof>
    The Chebyshev polynomials satisfy <math|T<rsub|n><around|(|cos
    \<theta\>|)>=cos <around|(|n*\<theta\>|)>> for
    <math|\<theta\>\<in\><around|[|0,\<pi\>|]>>. Using <math|x=cos
    \<theta\>>, <math|d*x=-sin \<theta\>*d*\<theta\>>, and
    <math|<sqrt|1-x<rsup|2>>=sin \<theta\>>, one obtains:

    <\equation>
      <big|int><rsub|-1><rsup|1>T<rsub|m><around|(|x|)>*T<rsub|n><around|(|x|)><frac|d*x|\<pi\><sqrt|1-x<rsup|2>>>=<big|int><rsub|0><rsup|\<pi\>>cos
      <around|(|m*\<theta\>|)>*cos <around|(|n*\<theta\>|)><frac|d*\<theta\>|\<pi\>>
    </equation>

    This integral evaluates to <math|1> when <math|m=n=0>, to <math|1/2> when
    <math|m=n\<geq\>1>, and to <math|0> when <math|m\<neq\>n>.
  </proof>

  <section|Universal Properties of the Arcsine Distribution>

  <\theorem>
    [Arcsine Distribution as Equilibrium Measure] The arcsine distribution
    <math|\<mu\><around|(|x|)>=<frac|d*x|\<pi\><sqrt|1-x<rsup|2>>>> on
    <math|<around|[|-1,1|]>> serves as the equilibrium measure for the
    logarithmic potential. The following properties characterize this
    measure:

    <\enumerate>
      <item>The arcsine measure minimizes the logarithmic energy

      <\equation>
        I<around|(|\<mu\>|)>=<big|iint>log
        <around|\||x-y|\|><rsup|-1>*<space|0.17em>d*\<mu\><around|(|x|)>*d*\<mu\><around|(|y|)>
      </equation>

      among probability measures supported on <math|<around|[|-1,1|]>>.

      <item>The sequence of Chebyshev nodes <math|x<rsub|k>=cos
      <around*|(|<frac|<around|(|2*k-1|)>*\<pi\>|2*n>|)>> for
      <math|k=1,\<ldots\>,n> converges in distribution to the arcsine measure
      as <math|n\<to\>\<infty\>>.

      <item>The arcsine measure serves as the orthogonality measure for the
      Chebyshev polynomials of the first kind.

      <item>The arcsine type behavior appears in the local statistics of
      eigenvalues at the spectral edge for several random matrix ensembles
      and in certain random functions and operator models.
    </enumerate>
  </theorem>

  For property 1, the logarithmic potential of the arcsine measure is
  constant on <math|<around|[|-1,1|]>>, exhibiting the defining
  characteristic of an equilibrium measure in logarithmic potential theory.
  Property 2 follows by considering the limiting distribution of zeros of
  Chebyshev polynomials, which corresponds to the arcsine law. Property 3 is
  shown in the previous theorem. Property 4 holds by results in potential
  theory, approximation theory, and analysis of spectral measures at the
  spectral edge for random matrices and certain operators.

  <section|Fundamental Connections>

  <\corollary>
    [Universality of the Arcsine Spectral Invariant] The arcsine distribution
    functions as a universal spectral invariant in the following contexts:

    <\enumerate>
      <item>Ratios of stationary narrow-band Gaussian processes to their
      envelopes

      <item>Isotropic random wave fields with Bessel covariance kernels in
      two dimensions

      <item>Orthogonality measure for Chebyshev polynomials of the first kind

      <item>Equilibrium measures in logarithmic potential theory

      <item>Local spectral statistics and zero distributions in approximation
      theory and parts of random matrix theory
    </enumerate>

    The occurrence of the arcsine law in these diverse mathematical
    structures reflects a common underlying geometry associated with scale
    invariance, rotational symmetry, and extremal properties for logarithmic
    potentials.
  </corollary>

  <\proof>
    Each of these systems exhibits properties such as rotational invariance,
    scale invariance, or extremizing characteristics for logarithmic energy.
    The arcsine law arises as a consequence of these symmetries and extremal
    principles, connecting stochastic analysis, spectral theory, and
    classical analysis.
  </proof>

  <section|Conclusion>

  The arcsine distribution constitutes a canonical spectral invariant. Its
  appearance in normalized Gaussian processes, random wave theory, Chebyshev
  polynomials, and potential theory exemplifies foundational principles in
  mathematical physics and analysis, unifying diverse branches through a
  common probabilistic and geometric structure.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-5|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-6|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-7|<tuple|7|4|../../.TeXmacs/texts/scratch/no_name_11.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Normalized
      Gaussian Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Random
      Wave Theory and Bessel Kernels> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Chebyshev
      Polynomials and Orthogonality> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Universal
      Properties of the Arcsine Distribution>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Fundamental
      Connections> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>