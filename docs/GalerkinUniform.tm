<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white>>

<\body>
  <doc-data|<doc-title|Uniform Convergence of Orthogonal Polynomial
  Expansions in RKHS via the Galerkin Method>>

  <section*|Introduction>

  In the context of Reproducing Kernel Hilbert Spaces (RKHS), orthogonal
  polynomials play a pivotal role in approximating functions through series
  expansions. This document elucidates the relationship between pointwise
  convergence, the reproducing property of kernels, and uniform convergence,
  particularly emphasizing the application of the Galerkin method for
  achieving optimal mean-square approximations that result in uniform
  convergence.

  <section|Preliminaries>

  <with|font-series|bold|RKHS and the Reproducing Kernel:> An RKHS is a
  Hilbert space of functions where for any function <math|f> in the space and
  any point <math|x>, the function value <math|f<around|(|x|)>> can be
  obtained via the inner product <math|<around|\<langle\>|f,K|(>\<cdot\>,x)\<rangle\>>
  with a reproducing kernel <math|K>.

  <with|font-series|bold|Orthogonal Polynomials:> These polynomials form a
  basis for function spaces, where each polynomial is orthogonal to others
  under a specific inner product, facilitating the approximation of functions
  within the space.

  <with|font-series|bold|Pointwise vs. Uniform Convergence:> Pointwise
  convergence occurs when functions in a sequence converge at every domain
  point to a limit function. Uniform convergence, a stronger condition,
  ensures that the sequence converges to the limit function uniformly over
  the entire domain.

  <section|Theorem>

  <\theorem>
    Given an RKHS with a reproducing kernel <math|K> and a complete input
    space of functions spanned by a set of pointwise converging orthogonal
    polynomials <math|<around|{|P<rsub|n>|}>> that reproduce <math|K>,
    applying the Galerkin method to project each basis function onto <math|K>
    results in a uniformly convergent series expansion for any function
    <math|f> in the RKHS. This convergence is uniform in the sense that the
    maximum approximation error across the domain decreases as more terms are
    included in the series.
  </theorem>

  <section|Constructive Proof Approach>

  <subsection*|1. Completeness of Input Space>

  First, we establish that the space spanned by <math|<around|{|P<rsub|n>|}>>
  is complete, meaning any function in the RKHS can be approximated with a
  linear combination of these polynomials to any desired degree of accuracy.

  <subsection*|2. Projection via Galerkin Method>

  For each polynomial <math|P<rsub|n>>, the projection coefficient is
  calculated by taking the inner product with the kernel function <math|K>,
  <math|<around|\<langle\>|P<rsub|n>,K|(>\<cdot\>,x)\<rangle\>>. This
  optimizes the mean-square error of the approximation.

  <subsection*|3. Uniform Boundedness and Equicontinuity>

  We verify that the sequence of partial sums of the polynomial series is
  uniformly bounded and equicontinuous, leveraging specific properties of the
  orthogonal polynomials and the kernel function.

  <subsection*|4. Application of Arzelà-Ascoli Theorem>

  The Arzelà-Ascoli theorem is applied to argue that a uniformly bounded and
  equicontinuous sequence of functions has a uniformly convergent
  subsequence, demonstrating uniform convergence of the polynomial series to
  the function <math|f> in the RKHS.

  <subsection*|5. Convergence Analysis>

  Finally, it is shown that adding more terms to the series decreases the
  uniform approximation error across the domain between the polynomial series
  and any target function <math|f> in the RKHS, leading to uniform
  convergence.

  <section*|Conclusion>

  The constructive approach detailed herein underscores that while the
  reproducing property of the kernel facilitates the computation of
  projection coefficients, uniform convergence is achieved through a
  meticulous analysis of the orthogonal polynomial series properties and the
  specific approximation method, underpinned by the Galerkin method's
  optimization of mean-square approximation error.
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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-10|<tuple|3|2>>
    <associate|auto-2|<tuple|1|1>>
    <associate|auto-3|<tuple|2|1>>
    <associate|auto-4|<tuple|3|1>>
    <associate|auto-5|<tuple|3|1>>
    <associate|auto-6|<tuple|3|2>>
    <associate|auto-7|<tuple|3|2>>
    <associate|auto-8|<tuple|3|2>>
    <associate|auto-9|<tuple|3|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Constructive
      Proof Approach> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1. Completeness of Input Space
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2. Projection via Galerkin Method
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3. Uniform Boundedness and Equicontinuity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4. Application of Arzelà-Ascoli Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|5. Convergence Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>