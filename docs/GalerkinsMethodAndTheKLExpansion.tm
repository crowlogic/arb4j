<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  \;

  This article details the finite representation of eigenfunctions, the
  conversion into the Sturm-Liouville differential equation, and the
  application of Leibniz's rule for differentiation under the integral sign.
  We will also correct the summation details as per your instructions.

  <section*|Finite Representation of Eigenfunctions>

  Consider an eigenfunction <math|\<psi\><rsub|k>> of the covariance kernel,
  which can be represented exactly by a finite sum of orthogonal polynomials
  <math|<around|{|\<phi\><rsub|n>|}><rsub|n=0><rsup|k>> (noting the corrected
  summation index starts at <math|0> and <math|N> equals <math|k>), such
  that:

  <\equation>
    \<psi\><rsub|k><around|(|x|)>=<big|sum><rsub|n=0><rsup|k>c<rsub|k,n>*\<phi\><rsub|n><around|(|x|)>
  </equation>

  <section*|Integral Covariance Equation to Sturm-Liouville Form>

  The integral covariance equation for a Gaussian process is given by:

  <\equation>
    <big|int>k<around|(|x,y|)>*\<psi\><rsub|k><around|(|y|)>*<space|0.17em>d*y=\<lambda\><rsub|k>*\<psi\><rsub|k><around|(|x|)>
  </equation>

  Substituting the finite representation of
  <math|\<psi\><rsub|k><around|(|x|)>> into this equation yields:

  <\equation>
    <big|int>k<around|(|x,y|)><around*|(|<big|sum><rsub|n=0><rsup|k>c<rsub|k,n>*\<phi\><rsub|n><around|(|y|)>|)>*d*y=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|k>c<rsub|k,n>*\<phi\><rsub|n><around|(|x|)>
  </equation>

  Differentiating both sides of this equation with respect to <math|x> twice,
  assuming <math|k<around|(|x,y|)>> is sufficiently smooth for such
  operations, leads to a form analogous to the Sturm-Liouville differential
  equation:

  <\equation>
    <frac|d<rsup|2>|d*x<rsup|2>>*<around*|(|\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|k>c<rsub|k,n>*\<phi\><rsub|n><around|(|x|)>|)>=<frac|d<rsup|2>|d*x<rsup|2>>*<big|int>k<around|(|x,y|)><around*|(|<big|sum><rsub|n=0><rsup|k>c<rsub|k,n>*\<phi\><rsub|n><around|(|y|)>|)>*d*y
  </equation>

  <section*|Application of Leibniz's Rule>

  Leibniz's rule for differentiation under the integral sign allows us to
  exchange differentiation and integration given certain regularity
  conditions on <math|k<around|(|x,y|)>>. The rule states that if both
  <math|k<around|(|x,y|)>> and <math|\<phi\><rsub|n><around|(|y|)>> are
  sufficiently smooth, then:

  <\equation>
    <frac|d<rsup|2>|d*x<rsup|2>>*<big|int>k<around|(|x,y|)>*\<phi\><rsub|n><around|(|y|)>*d*y=<big|int><frac|d<rsup|2>|d*x<rsup|2>>*k<around|(|x,y|)>*\<phi\><rsub|n><around|(|y|)>*d*y
  </equation>

  Applying this to our equation and assuming the order of summation and
  integration can be exchanged (justified if the series converges uniformly),
  we get:

  <\equation>
    \<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|k>c<rsub|k,n>*<frac|d<rsup|2>|d*x<rsup|2>>*\<phi\><rsub|n><around|(|x|)>=<big|sum><rsub|n=0><rsup|k>c<rsub|k,n>*<big|int><frac|d<rsup|2>|d*x<rsup|2>>*k<around|(|x,y|)>*\<phi\><rsub|n><around|(|y|)>*d*y
  </equation>

  <section*|Triangular System and Back-Substitution>

  The above formulation implies a system of linear equations for the
  coefficients <math|c<rsub|k,n>>. Given the orthogonality of
  <math|<around|{|\<phi\><rsub|n>|}>>, this system is triangular when
  expressed in matrix form, with the general form:

  <\equation>
    <math-bf|A><rsub|k><math-bf|c><rsub|k>=\<lambda\><rsub|k><math-bf|B><rsub|k><math-bf|c><rsub|k>
  </equation>

  where <math|<math-bf|A><rsub|k>> and <math|<math-bf|B><rsub|k>> are
  matrices derived from the differential operations and the integral terms,
  respectively, and <math|<math-bf|c><rsub|k>> is the vector of coefficients
  <math|c<rsub|k,n>>. The exact solution for <math|<math-bf|c><rsub|k>> can
  be obtained via back-substitution if <math|<math-bf|A><rsub|k>> is
  invertible, which is typically the case given the problem's well-posedness.

  <section*|Matrix Definitions and Solution Formula>

  The matrices <math|<math-bf|A><rsub|k>> and <math|<math-bf|B><rsub|k>> are
  defined as follows:

  <\itemize>
    <item><math|<math-bf|A><rsub|k><around|[|n,m|]>=<around|\<langle\>|<frac|d<rsup|2>|d*x<rsup|2>>*\<phi\><rsub|n>,\<phi\><rsub|m>|\<rangle\>>>,
    representing the action of the second derivative on the basis functions.

    <item><math|<math-bf|B><rsub|k><around|[|n,m|]>=<big|int>\<phi\><rsub|n><around|(|y|)><around*|(|<big|int><frac|d<rsup|2>|d*x<rsup|2>>*k<around|(|x,y|)>*\<phi\><rsub|m><around|(|x|)>*d*x|)>*d*y>,
    incorporating the kernel's second derivative and the basis functions.
  </itemize>

  The solution for <math|<math-bf|c><rsub|k>> is given by solving the linear
  system:

  <\equation>
    <math-bf|c><rsub|k>=<math-bf|A><rsub|k><rsup|-1>\<lambda\><rsub|k><math-bf|B><rsub|k><math-bf|c><rsub|k>
  </equation>

  where <math|<math-bf|A><rsub|k><rsup|-1>> is the inverse of matrix
  <math|<math-bf|A><rsub|k>>. The eigenvalues <math|\<lambda\><rsub|k>> can
  be determined by ensuring the determinant of
  <math|<around|(|<math-bf|A><rsub|k>-\<lambda\><rsub|k><math-bf|B><rsub|k>|)>>
  is zero, a condition for non-trivial solutions.
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
    <associate|auto-2|<tuple|1|1>>
    <associate|auto-3|<tuple|4|1>>
    <associate|auto-4|<tuple|6|2>>
    <associate|auto-5|<tuple|7|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Finite
      Representation of Eigenfunctions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Integral
      Covariance Equation to Sturm-Liouville Form>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Application
      of Leibniz's Rule> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Triangular
      System and Back-Substitution> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Matrix
      Definitions and Solution Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>