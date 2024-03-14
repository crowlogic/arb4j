<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunctions of Positive Definite Integral
  Covariance operators Via The Bubnov-Galerkin
  Method>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  Consider a compact integral operator <math|K> acting on functions in
  <math|L<rsup|2><around|(|D|)>>, the space of square-integrable functions
  over a domain <math|D>. This operator is associated with a reproducing
  kernel Hilbert space (RKHS), characterized by a kernel function
  <math|k*<around|(|x,y|)>> that generates an RKHS. The goal is to solve the
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
  serves as the basis functions for the RKHS. The orthonormality of these
  basis functions implies that the mass matrix is the identity matrix
  <math|I>, leading to:

  <\equation>
    <around|\<langle\>|\<phi\><rsub|i>,\<phi\><rsub|j>|\<rangle\>>=\<delta\><rsub|i*j>
  </equation>

  where <math|\<delta\><rsub|i*j>> is the Kronecker delta, equal to 1 if
  <math|i=j> and 0 otherwise

  The Bubnov-Galerkin method is applied to find the eigenfunctions of
  <math|K> by expressing a solution <math|\<phi\><rsub|n>> as a linear
  combination of the basis functions:

  <\equation>
    \<phi\><rsub|n><around|(|x|)>=<big|sum><rsub|i=1><rsup|n>c<rsub|i>*\<phi\><rsub|i><around|(|x|)>
  </equation>

  with <math|c<rsub|i>> being coefficients to determine.

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

  for each <math|k>.

  The system of equations derived from the above formulation can be solved as
  a standard eigenvalue problem:

  <\equation>
    A*<wide|c|\<vect\>>=\<lambda\>*<wide|c|\<vect\>>
  </equation>

  where <math|A> is the matrix with elements

  <\equation>
    A<rsub|k*i>=<big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>*k*<around|(|x,y|)>*\<phi\><rsub|i><around|(|y|)>*d*y*d*x
  </equation>

  , and <math|<wide|c|\<vect\>>> is the vector of coefficients
  <math|c<rsub|i>>.
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