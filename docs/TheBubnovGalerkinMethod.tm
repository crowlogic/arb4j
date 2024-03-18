<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|parchment|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunctions of Positive Definite Integral
  Covariance Operators Via The Bubnov-Galerkin Method And The \ The
  Christoffel-Darboux kernel>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Compact Integral Covariance Operators>

  Consider a compact integral operator <math|K> acting on functions in
  <math|L<rsup|2><around|(|D|)>>, the space of square-integrable functions
  over a domain <math|D>, where we take to be the noncompact domain of
  semi-infinite positive half-line <math|D=<around*|[|0,\<infty\>|)>> . This
  operator is associated with a reproducing kernel Hilbert space (RKHS) as a
  consequence of the positive definiteness of the kernel function
  <math|k<around|(|x,y|)>> which has an RKHS whose existence is assured by
  Bochners theorem which says that function is positive definite if its
  Fourier transform is non-negative and non-decreasing and these will be the
  conditions for which this article applies. The goal is to solve the
  eigenvalue problem for <math|K>:

  <\equation>
    <around|(|K*\<phi\>|)><around|(|x|)>=\<lambda\>*\<phi\><around|(|x|)>
  </equation>

  where <math|\<phi\>> represents an eigenfunction of <math|K>, and
  <math|\<lambda\>> is the corresponding eigenvalue. The action of <math|K>
  on <math|\<phi\>> is defined by:

  <\equation>
    <around|(|K*\<phi\>|)><around|(|x|)>=<big|int><rsub|D>k*<around|(|x,y|)>*\<phi\><around|(|y|)>*d*y
  </equation>

  An orthonormal basis <math|<around|{|\<phi\><rsub|i>|}><rsub|i=1><rsup|\<infty\>>>
  in <math|L<rsup|2><around|(|D|)>>, consisting of orthogonal polynomials,
  serves as the basis functions for the RKHS.\ 

  Right now the orthonormal basis will assume to be known but it will be
  shown how one can always be found or constructed if the sequence for the
  kernel does not correspond to any of the off-the-shelf known orthognal
  polynomial sequences, classical or otherwise.

  <subsection|The Bubnov-Galerkin method>

  The Bubnov-Galerkin method is applied to find the eigenfunctions of
  <math|K> by expressing a solution <math|\<phi\><rsub|n>> as a linear
  combination of the basis functions:

  <\equation>
    \<phi\><rsub|n><around|(|x|)>=<big|sum><rsub|i=1><rsup|n>c<rsub|i>*\<phi\><rsub|i><around|(|x|)>
  </equation>

  with <math|c<rsub|i>> being coefficients to determine. The orthonormality
  of these basis functions implies that the mass matrix is the identity
  matrix <math|I>, leading to:

  <\equation>
    <around|\<langle\>|\<phi\><rsub|i>,\<phi\><rsub|j>|\<rangle\>>=\<delta\><rsub|i*j>
  </equation>

  where <math|\<delta\><rsub|i*j>> is the Kronecker delta, equal to 1 if
  <math|i=j> and 0 otherwise.

  The eigenvalue problem then transforms into:

  <\equation>
    <big|int><rsub|D>k*<around|(|x,y|)>*<big|sum><rsub|i=1><rsup|n>c<rsub|i>*\<phi\><rsub|i><around|(|y|)>*d*y=\<lambda\>*<big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<phi\><rsub|j><around|(|x|)>
  </equation>

  By multiplying both sides by <math|\<phi\><rsub|k><around|(|x|)>> and
  integrating over <math|D>, and utilizing the orthonormality of the basis
  functions, we simplify the equation to:

  <\equation>
    <big|sum><rsub|i=1><rsup|n>c<rsub|i>*<big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>*k*<around|(|x,y|)>*\<phi\><rsub|i><around|(|y|)>*d*y*d*x=\<lambda\>*c<rsub|k>
  </equation>

  for each <math|k>. The system of equations derived from the above
  formulation can be solved as a standard eigenvalue problem:

  <\equation>
    A*<wide|c|\<vect\>>=\<lambda\>*<wide|c|\<vect\>>
  </equation>

  where <math|A> is the matrix with elements

  <\equation>
    A<rsub|k*i>=<big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>*k*<around|(|x,y|)>*\<phi\><rsub|i><around|(|y|)>*d*y*d*x
  </equation>

  , and <math|<wide|c|\<vect\>>> is the vector of coefficients
  <math|c<rsub|i>>.

  <section| The Christoffel-Darboux kernel>

  Leveraging the Christoffel-Darboux kernel we can construct a sequence of
  optimal (in the sense that their truncating at finite N minimzes the error
  of the approximation for any finite N) finite rank approximations, we can
  express the N-th partial sum as a ratio of the N and N-1 polynomials . This
  allows us to compute the integrals involved in <math|A<rsub|k*i>> exactly,
  without the need for direct integration over the kernel, possibly taking
  the limit via\ 

  Let's denote the N-th partial sum as <math|K<rsub|N><around|(|x,y|)>>, and
  let <math|\<phi\><rsub|i><around|(|x|)>> and
  <math|\<phi\><rsub|k><around|(|x|)>> be the N-th order polynomials. Then,
  we have:

  <\equation>
    K<rsub|N><around|(|x,y|)>=<big|sum><rsub|j=1><rsup|N><frac|\<phi\><rsub|j><around|(|x|)>*\<phi\><rsub|j><around|(|y|)>|\<lambda\><rsub|j>>
  </equation>

  Using this approximation, we can express <math|A<rsub|k*i>> as:

  <\equation>
    A<rsub|k*i>=<big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>K<rsub|N><around|(|x,y|)>\<phi\><rsub|i><around|(|y|)>*d*y<space|0.17em>d*x
  </equation>

  Substituting the expression for <math|K<rsub|N><around|(|x,y|)>>, we get:

  <\equation>
    A<rsub|k*i>=<big|sum><rsub|j=1><rsup|N><frac|1|\<lambda\><rsub|j>>*<big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>*\<phi\><rsub|j><around|(|x|)>*\<phi\><rsub|i><around|(|y|)>*<space|0.17em>d*y*<space|0.17em>d*x
  </equation>

  This can be simplified further using the orthonormality condition of the
  basis functions. Let <math|C<rsub|i*j*k>> represent the triple product
  integral:

  <\equation>
    C<rsub|i*j*k>=<big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>*\<phi\><rsub|j><around|(|x|)>*\<phi\><rsub|i><around|(|y|)>*<space|0.17em>d*x
  </equation>

  Then, <math|A<rsub|k*i>> can be expressed as:

  <\equation>
    A<rsub|k*i>=<big|sum><rsub|j=1><rsup|N><frac|C<rsub|i*j*k>|\<lambda\><rsub|j>>*=<big|sum><rsub|j=1><rsup|N><frac|<big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>*\<phi\><rsub|j><around|(|x|)>*\<phi\><rsub|i><around|(|y|)>*<space|0.17em>d*x|\<lambda\><rsub|j>>
  </equation>

  Now, to compute <math|C<rsub|i*j*k>> exactly, we need to solve the triple
  product integral in closed form, which can be done analytically based on
  the properties of the basis functions and the domain <math|D>. This
  approach provides an exact solution for <math|A<rsub|k*i>>, avoiding the
  need for numerical integration and ensuring accuracy, stability, and
  computational efficiency.

  <subsection|The Eigenfunctions>

  \ Given the matrix elements <math|A<rsub|k*i>> as computed using the
  Christoffel-Darboux kernel approximation(which is exact in the limit), we
  can express the eigenfunctions <math|\<phi\><rsub|k><around|(|x|)>> in
  terms of the coefficients <math|c<rsub|i>> as follows:

  <\equation*>
    \<phi\><rsub|k><around|(|x|)>=<big|sum><rsub|i=1><rsup|n>c<rsub|i>*\<psi\><rsub|k*i><around|(|x|)>
  </equation*>

  where <math|\<psi\><rsub|k*i><around|(|x|)>> are the basis functions used
  to construct the RKHS. The specific form of
  <math|\<psi\><rsub|k*i><around|(|x|)>> depends on the choice of basis
  functions. If orthogonal polynomials are used as the basis functions, then
  <math|\<psi\><rsub|k*i><around|(|x|)>> would correspond to the <math|i>-th
  polynomial in the expansion of the <math|k>-th eigenfunction.

  In terms of the matrix elements <math|A<rsub|k*i>>, we can express the
  eigenfunctions as:

  <\equation*>
    \<phi\><rsub|k><around|(|x|)>=<big|sum><rsub|i=1><rsup|n>*\<psi\><rsub|k*i><around|(|x|)><frac|c<rsub|i>|\<lambda\><rsub|k>>*<big|sum><rsub|j=1><rsup|N><frac|C<rsub|i*j*k>|\<lambda\><rsub|j>>*
  </equation*>

  where <math|C<rsub|i*j*k>> are the triple product integrals and
  <math|\<lambda\><rsub|k>> are the eigenvalues. This expression provides the
  eigenfunctions in terms of the coefficients <math|c<rsub|i>> and the basis
  functions used to construct the RKHS.
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
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|2|2>>
    <associate|auto-4|<tuple|2.1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Compact
      Integral Covariance Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>The Bubnov-Galerkin method
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>
      The Christoffel-Darboux kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>The Eigenfunctions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>
    </associate>
  </collection>
</auxiliary>