<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|On Uniform Boundedness and Equicontinuity in Gaussian
  Processes>|<doc-date|>>

  <section|Introduction>

  This document outlines the concepts of uniform boundedness and
  equicontinuity for a sequence of functions, particularly within the
  framework of a Gaussian process defined by a positive definite kernel on
  the positive half-line. We also discuss methodologies for proving these
  properties.

  <section|Uniform Boundedness>

  <with|font-series|bold|Definition:> A sequence of functions
  <math|<around|{|f<rsub|n>|}>> on a domain <math|D> is said to be uniformly
  bounded if there exists a real number <math|M\<gtr\>0> such that for all
  <math|x\<in\>D> and for all <math|n>, <math|<around|\||f<rsub|n><around|(|x|)>|\|>\<leq\>M>.

  <subsection|Proving Uniform Boundedness>

  To prove uniform boundedness for a sequence of functions arising from a
  Gaussian process:

  <\enumerate>
    <item><with|font-series|bold|Use the Kernel's Properties:> Positive
    definiteness of the kernel should be leveraged to establish a bound,
    given its implications on the control over the function values.

    <item><with|font-series|bold|Bounding the Gaussian Process:> The
    boundedness of the process relies on the boundedness of the mean function
    <math|\<mu\><around|(|x|)>> and covariance function
    <math|k<around|(|x,x<rprime|'>|)>> on the positive half-line.

    <item><with|font-series|bold|Applying Induction:> Start by ensuring the
    base case is bounded. Assume boundedness for the <math|n>-th function to
    show it for the <math|n+1>-th function, utilizing the structure of the
    kernel or the sequence's definition.
  </enumerate>

  <section|Equicontinuity>

  <with|font-series|bold|Definition:> A sequence of functions is
  equicontinuous at a point <math|x<rsub|0>> if, for every
  <math|\<epsilon\>\<gtr\>0>, there exists a <math|\<delta\>\<gtr\>0> such
  that for all <math|x> within <math|\<delta\>> of <math|x<rsub|0>>, and for
  all functions <math|f<rsub|n>> in the sequence,
  <math|<around|\||f<rsub|n><around|(|x|)>-f<rsub|n><around|(|x<rsub|0>|)>|\|>\<less\>\<epsilon\>>.
  The sequence is equicontinuous on a domain <math|D> if this property holds
  for every point <math|x<rsub|0>> in <math|D>.

  <subsection|Proving Equicontinuity>

  To prove equicontinuity:

  <\enumerate>
    <item><with|font-series|bold|Leverage the Kernel's Smoothness:> The
    smoothness of the positive definite kernel implies smooth variation of
    the functions with <math|x>, aiding in establishing equicontinuity.

    <item><with|font-series|bold|Uniform Convergence of Derivatives:> If the
    sequence of derivatives is uniformly convergent, this can support the
    proof of equicontinuity, based on fundamental theorems relating uniform
    convergence and equicontinuity.

    <item><with|font-series|bold|Compact Subsets Argument:> Prove
    equicontinuity on compact subsets and extend the argument across the
    entire domain, utilizing a covering of compact subsets.
  </enumerate>

  <section|Connection to Uniform Convergence>

  Establishing uniform boundedness and equicontinuity allows the application
  of the Arzelà-Ascoli theorem to extract a uniformly convergent subsequence.
  For the entire sequence to converge uniformly, the uniqueness of the limit
  function must also be shown, leveraging the properties of the kernel and
  the Gaussian process.
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
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2.1|1>>
    <associate|auto-4|<tuple|3|1>>
    <associate|auto-5|<tuple|3.1|2>>
    <associate|auto-6|<tuple|4|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Uniform
      Boundedness> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Proving Uniform Boundedness
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Equicontinuity>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Proving Equicontinuity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Connection
      to Uniform Convergence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>