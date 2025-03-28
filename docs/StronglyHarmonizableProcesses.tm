<TeXmacs|2.1.4>

<style|generic>

<\body>
  <section|Introduction>

  This document outlines the methodology to find the eigenfunctions of a
  strongly harmonizable process, utilizing spectral representation and
  Fourier transform techniques.

  <section|Spectral Representation of the Kernel>

  A strongly harmonizable process is characterized by a covariance function
  <math|C<around|(|t,s|)>> that can be expressed with a spectral measure. The
  kernel is given by:

  <\equation*>
    C<around|(|t,s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|t-s|)>*\<lambda\>>*f<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>
  </equation*>

  where <math|f<around|(|\<lambda\>|)>> is the spectral density function of
  the process.

  <section|Eigenvalue Problem Formulation>

  The eigenfunctions <math|\<phi\><rsub|k><around|(|t|)>> and eigenvalues
  <math|\<lambda\><rsub|k>> are determined by solving the following integral
  equation:

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|t,s|)>*\<phi\><rsub|k><around|(|s|)>*<space|0.17em>d*s=\<lambda\><rsub|k>*\<phi\><rsub|k><around|(|t|)>
  </equation*>

  This is a Fredholm integral equation of the second kind, which is
  fundamentally important in the analysis of such processes.

  <section|Fourier Transform Techniques>

  Applying the Fourier transform simplifies the convolution in the kernel
  expression:

  <\equation*>
    <wide|\<phi\>|^><rsub|k><around|(|\<lambda\>|)>=<frac|<wide|f|^><around|(|\<lambda\>|)>|\<lambda\><rsub|k>>*<wide|\<phi\>|^><rsub|k><around|(|\<lambda\>|)>
  </equation*>

  Here, <math|<wide|f|^><around|(|\<lambda\>|)>> is the Fourier transform of
  the spectral density, and <math|<wide|\<phi\>|^><rsub|k><around|(|\<lambda\>|)>>
  is the Fourier transform of the eigenfunctions.

  <section|Solving for Eigenfunctions>

  The transformed equation suggests that:

  <\equation*>
    <wide|\<phi\>|^><rsub|k><around|(|\<lambda\>|)>\<propto\>\<delta\>*<around*|(|\<lambda\>-\<lambda\><rsub|k><rprime|'>|)>
  </equation*>

  where <math|\<lambda\><rsub|k><rprime|'>> are points where the spectral
  density matches the eigenvalues scaled by the Fourier transform of the
  eigenfunctions.

  <section|Inverse Fourier Transform>

  Applying the inverse Fourier transform to
  <math|<wide|\<phi\>|^><rsub|k><around|(|\<lambda\>|)>> retrieves the
  eigenfunctions <math|\<phi\><rsub|k><around|(|t|)>> in their original
  domain:

  <\equation*>
    \<phi\><rsub|k><around|(|t|)>=\<cal-F\><rsup|-1><around*|{|<wide|\<phi\>|^><rsub|k><around|(|\<lambda\>|)>|}><around|(|t|)>
  </equation*>
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
    <associate|auto-4|<tuple|4|1>>
    <associate|auto-5|<tuple|5|1>>
    <associate|auto-6|<tuple|6|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Spectral
      Representation of the Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Eigenvalue
      Problem Formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Fourier
      Transform Techniques> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Solving
      for Eigenfunctions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Inverse
      Fourier Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>