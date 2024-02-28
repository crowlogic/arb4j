<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <section|Introduction>

  We consider the problem of finding polynomial eigenfunctions of an integral
  covariance operator with a kernel that has a Reproducing Kernel Hilbert
  Space (RKHS) orthogonal polynomial basis. The kernel is assumed to be
  analytic and infinitely differentiable, and its input RKHS converges
  pointwise to the kernel in the integral operator. The eigenfunctions are
  represented exactly as finite linear combinations of basis functions up to
  order <math|N>.

  <section|Eigenvalue Problem Formulation>

  The integral operator <math|T> acting on a function <math|f> is defined as

  <\equation>
    <around|(|T*f|)><around|(|x|)>=<big|int><rsub|\<Omega\>>K<around|(|x,y|)>*f<around|(|y|)>*dy
  </equation>

  where <math|K<around|(|x,y|)>> is the kernel of the operator and
  <math|\<Omega\>> is the domain of interest. The eigenvalue problem is
  formulated as

  <\equation>
    <around|(|T*f|)><around|(|x|)>=\<lambda\>*f<around|(|x|)>
  </equation>

  with <math|\<lambda\>> being the eigenvalue and <math|f<around|(|x|)>> the
  corresponding eigenfunction.

  <section|Representation of Eigenfunctions>

  The eigenfunctions can be exactly represented as finite linear combinations
  of the orthogonal polynomial basis functions
  <math|<around|{|\<phi\><rsub|i><around|(|x|)>|}><rsub|i=0><rsup|N>> of the
  RKHS. Thus,

  <\equation>
    \<psi\><rsub|N><around|(|x|)>=<big|sum><rsub|i=0><rsup|N>c<rsub|i>*\<phi\><rsub|i><around|(|x|)>
  </equation>

  where <math|c<rsub|i>> are coefficients to be determined.

  <section|Application of Galerkin's Method>

  Galerkin's method involves projecting the eigenvalue problem onto the
  subspace spanned by the basis functions. The residual

  <\equation>
    R<around|(|x|)>=<around|(|T*f|)><around|(|x|)>-\<lambda\>*f<around|(|x|)>
  </equation>

  is enforced to be orthogonal to the subspace. For each basis function
  <math|\<phi\><rsub|j><around|(|x|)>>, we require

  <\equation>
    <big|int><rsub|\<Omega\>>\<phi\><rsub|j><around|(|x|)>*R<around|(|x|)>*d*x=0\<forall\>j=0,1,\<ldots\>,N
  </equation>

  Substituting <math|R<around|(|x|)>> and <math|f<around|(|x|)>> yields

  <\equation*>
    <big|int><rsub|\<Omega\>>\<phi\><rsub|j><around|(|x|)>*<around*|[|<big|int><rsub|\<Omega\>>K<around|(|x,y|)><around*|(|<big|sum><rsub|i=0><rsup|N>c<rsub|i>*\<phi\><rsub|i><around|(|y|)>|)>*d*y-\<lambda\>*<big|sum><rsub|i=0><rsup|N>c<rsub|i>*\<phi\><rsub|i><around|(|x|)>|]>*d*x=0.
  </equation*>

  <section|Matrix Formulation>

  The system of equations can be represented in matrix form. Let

  <\equation>
    K<rsub|j*i>=<big|int><rsub|\<Omega\>><big|int><rsub|\<Omega\>>\<phi\><rsub|j><around|(|x|)>*K<around|(|x,y|)>*\<phi\><rsub|i><around|(|y|)>*d*y*d*x
  </equation>

  and

  <\equation>
    M<rsub|j*i>=<big|int><rsub|\<Omega\>>\<phi\><rsub|j><around|(|x|)>*\<phi\><rsub|i><around|(|x|)>*d*x
  </equation>

  The system of equations can then be written as

  <\equation>
    <math-bf|Kc>=\<lambda\><math-bf|Mc>
  </equation>

  where <math|<math-bf|K>> and <math|<math-bf|M>> are matrices constructed
  from the inner products, and <math|<math-bf|c>> is the vector of
  coefficients <math|c<rsub|i>>.

  <section|Solution of the Generalized Eigenvalue Problem>

  The final step is to solve the generalized eigenvalue problem to find the
  eigenvalues <math|\<lambda\>> and the corresponding eigenvectors
  <math|<math-bf|c>>, which give the coefficients of the eigenfunctions.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-4|<tuple|4|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-5|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-6|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Eigenvalue
      Problem Formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Representation
      of Eigenfunctions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Application
      of Galerkin's Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Matrix
      Formulation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Solution
      of the Generalized Eigenvalue Problem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>