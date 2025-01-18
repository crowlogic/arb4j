<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|The Random Wave Process>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  The Bessel function of the first kind of order zero, derived from the
  Fourier transform of a uniform measure on the unit circle, plays a crucial
  role in describing random plane waves and has significant implications for
  Berry's random wave conjecture in quantum chaos theory.

  <section|Bessel Function Definition>

  The Bessel function of the first kind, denoted as
  <math|J<rsub|\<alpha\>><around|(|x|)>>, is a solution to Bessel's
  differential equation:

  <\equation>
    x<rsup|2>*<frac|d<rsup|2>*y|d*x<rsup|2>>+x*<frac|d*y|d*x>+<around|(|x<rsup|2>-\<alpha\><rsup|2>|)>*y=0
  </equation>

  where <math|\<alpha\>> is the order of the Bessel function. For integer or
  positive <math|\<alpha\>>, <math|J<rsub|\<alpha\>><around|(|x|)>> is finite
  at the origin (<math|x=0>), while for negative non-integer
  <math|\<alpha\>>, it diverges as x approaches zero. The function can be
  expressed as an infinite series:

  <\equation>
    J<rsub|\<alpha\>><around|(|x|)>=<big|sum><rsub|m=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|m>|m!\<Gamma\>*<around|(|m+\<alpha\>+1|)>><around*|(|<frac|x|2>|)><rsup|2*m+\<alpha\>>
  </equation>

  where <math|\<Gamma\>> is the gamma function.

  <section|Gaussian Process Kernel Derivation>

  The Gaussian process kernel <math|J<rsub|0><around|(|<around|\||t-s|\|>|)>>
  for the random wave model can be derived through two equivalent approaches.
  In one dimension:

  <\equation>
    J<rsub|0><around|(|<around|\||t-s|\|>|)>=<big|int><rsub|-1><rsup|1>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*<frac|1|\<pi\><sqrt|1-\<lambda\><rsup|2>>>*d*\<lambda\>
  </equation>

  And in two dimensions:

  <\equation>
    J<rsub|0><around|(|<around|\||\<lambda\>|\|>|)>=<big|int><rsub|0><rsup|2*\<pi\>>e<rsup|i*<around|(|\<lambda\><rsub|1>*cos
    \<theta\>+\<lambda\><rsub|2>*sin \<theta\>|)>>*<frac|d*\<theta\>|2*\<pi\>>
  </equation>

  where <math|<around|\||\<lambda\>|\|>=<sqrt|\<lambda\><rsub|1><rsup|2>+\<lambda\><rsub|2><rsup|2>>>.

  <section|Connection to Covariance Functions>

  The <math|J<rsub|0>> covariance function belongs to the family of radial
  basis functions, which are isotropic and depend only on the distance
  between points. This allows for uniform behavior in all directions and
  connects to broader classes of Gaussian processes through their spectral
  representations.

  <section|Stationarity and Isotropy in Random Plane Waves>

  Random plane waves exhibit stationarity:

  <\equation>
    \<bbb-E\>*<around|[|X<around|(|t|)>*X<around|(|s|)>|]>=\<bbb-E\>*<around|[|X*<around|(|t+h|)>*X*<around|(|s+h|)>|]>
  </equation>

  and isotropy:

  <\equation>
    \<bbb-E\>*<around|[|X<around|(|t|)>*X<around|(|s|)>|]>=J<rsub|0><around|(|<around|\||t-s|\|>|)>
  </equation>

  Key properties include:

  <\enumerate>
    <item>Uniform energy distribution

    <item>Scale-invariance

    <item>Ergodicity
  </enumerate>

  <section|Spectral Analysis of <math|J<rsub|0>> Kernel>

  The spectral analysis reveals:

  <\itemize>
    <item>Discrete spectrum over <math|<around|[|0,\<infty\>|)>>

    <item>Unknown eigenfunctions (no closed form, yet anyway)

    <item>Slowly decaying eigenvalues

    <item>Dimensionality dependence

    <item>Orthonormal basis properties
  </itemize>

  The kernel's properties fundamentally shape the behavior of the random
  plane wave model and present ongoing challenges in spectral theory and
  stochastic processes.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_68.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_68.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_68.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_68.tm>>
    <associate|auto-5|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_68.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Bessel
      Function Definition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Gaussian
      Process Kernel Derivation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Connection
      to Covariance Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Stationarity
      and Isotropy in Random Plane Waves>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Spectral
      Analysis of <with|mode|<quote|math>|J<rsub|0>> Kernel>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>