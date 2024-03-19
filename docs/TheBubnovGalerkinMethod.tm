<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|ridged-paper|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunctions of Positive Definite Integral
  Covariance Operators Via The Bubnov-Galerkin Method And The \ The
  Christoffel-Darboux kernel>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Compact Integral Covariance Operators>

  Consider a compact integral operator <math|K> with a positive-definite
  infinitely differentiable analytic kernel function
  <math|k<around*|(|x,y|)>> acting on functions in
  <math|L<rsup|2><around|(|D|)>>, the space of square-integrable functions
  over a domain <math|D>, where we take to be the noncompact domain of
  semi-infinite positive half-line <math|D=<around*|[|0,\<infty\>|)>> . The
  goal is to solve the eigenvalue problem for <math|K>:

  <\equation>
    <around|(|K*\<phi\><rsub|n>|)><around|(|x|)>=\<lambda\>*\<phi\><rsub|n><around|(|x|)>
  </equation>

  where <math|<rsub|>\<phi\><rsub|n><around*|(|x|)>> is an element of the
  orthonormal basis <math|<around|{|\<phi\><rsub|i>|}><rsub|i=1><rsup|\<infty\>>>
  in <math|L<rsup|2><around|(|D|)>>, consisting of orthogonal polynomials
  constituting the RKHS of <math|k<around*|(|x,y|)>> so that\ 

  <\equation>
    K<around*|(|x,y|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around*|(|x|)>\<phi\><rsub|n><around*|(|y|)>|\<lambda\><rsub|n>>
  </equation>

  represents an eigenfunction of <math|K>, and <math|\<lambda\><rsub|n>> is
  the corresponding eigenvalue. The action of <math|K> on <math|\<phi\>> is
  defined by:

  <\equation>
    <around|(|K*\<phi\><rsub|n>|)><around|(|x|)>=<big|int><rsub|D>k*<around|(|x,y|)>*\<phi\><rsub|n><around|(|y|)>*d*y
  </equation>

  \;

  The RKHS basis will assume to be known but it will be shown how one can
  always be found or constructed if the sequence for the kernel does not
  correspond to any of the off-the-shelf known orthognal polynomial
  sequences, classical or otherwise.

  <subsection|The Bubnov-Galerkin method>

  The Bubnov-Galerkin method is applied to find the eigenfunctions of
  <math|K> by expressing a solution <math|\<phi\><rsub|n>> as a linear
  combination of the basis functions:

  <\equation>
    \<phi\><rsub|n><around|(|x|)>=<big|sum><rsub|i=0><rsup|n>c<rsub|n,i>*\<phi\><rsub|i><around|(|x|)>
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
    <big|int><rsub|D>k*<around|(|x,y|)>*<big|sum><rsub|i=0><rsup|n>c<rsub|i>*\<phi\><rsub|i><around|(|y|)>*d*y=\<lambda\>*<big|sum><rsub|j=0><rsup|n>c<rsub|j>*\<phi\><rsub|j><around|(|x|)>
  </equation>

  By multiplying both sides by <math|\<phi\><rsub|k><around|(|x|)>> and
  integrating over <math|D>, and utilizing the orthonormality of the basis
  functions, we simplify the equation to:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|sum><rsub|i=0><rsup|n>c<rsub|i>*<big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>*k*<around|(|x,y|)>*\<phi\><rsub|i><around|(|y|)>*d*y*d*x>|<cell|=<big|sum><rsub|i=0><rsup|n>c<rsub|k,i>*A<rsub|k,i>>>|<row|<cell|>|<cell|=\<lambda\>*c<rsub|k,n>>>>>>
  </equation>

  for each <math|k>. The system of equations derived from the above
  formulation can be solved as a standard eigenvalue problem:

  <\equation>
    A*<wide|c<rsub|n>|\<vect\>>=\<lambda\>*<rsub|n><wide|c<rsub|n>|\<vect\>>
  </equation>

  where <math|A> is the matrix with elements

  <\equation>
    A<rsub|k,*i>=<big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>*k*<around|(|x,y|)>*\<phi\><rsub|i><around|(|y|)>*d*y*d*x<label|A>
  </equation>

  and <math|<wide|c|\<vect\>>> is the vector of coefficients
  <math|c<rsub|i>>.

  <subsection|The Christoffel-Darboux kernel>

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
    K<rsub|N><around|(|x,y|)>=<big|sum><rsub|j=0><rsup|N><frac|\<phi\><rsub|j><around|(|x|)>*\<phi\><rsub|j><around|(|y|)>|\<lambda\><rsub|j>>
  </equation>

  Using this kernel which converges to

  <\equation*>
    lim<rsub|N\<rightarrow\>\<infty\>>K<rsub|N><around*|(|x,y|)>=k<around*|(|x,y|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around*|(|x|)>\<phi\><rsub|n><around*|(|y|)>|\<lambda\><rsub|n>>
  </equation*>

  we can express <math|A<rsub|k*,i>> as:

  <\equation>
    A<rsub|k,*i>=<big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>\<phi\><rsub|i>k<around*|(|x,y|)>d*y<space|0.17em>d
    x
  </equation>

  Substituting the expression for <math|K<rsub|N><around|(|x,y|)>>, we get:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|A<rsub|k*,i>>|<cell|=lim<rsub|N\<rightarrow\>\<infty\>><big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>\<phi\><rsub|i><around|(|y|)>K<rsub|N><around|(|x,y|)>d*y<space|0.17em>d
    x>>|<row|<cell|>|<cell|=lim<rsub|N\<rightarrow\>\<infty\>><big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>\<phi\><rsub|i><around|(|y|)>*<big|sum><rsub|j=0><rsup|N><frac|\<phi\><rsub|j><around|(|x|)>*\<phi\><rsub|j><around|(|y|)>|\<lambda\><rsub|j>>d*y<space|0.17em>d
    x>>|<row|<cell|>|<cell|=lim<rsub|N\<rightarrow\>\<infty\>><big|sum><rsub|j=0><rsup|N><big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>\<phi\><rsub|i><around|(|y|)>*<frac|\<phi\><rsub|j><around|(|x|)>*\<phi\><rsub|j><around|(|y|)>|\<lambda\><rsub|j>>d*y<space|0.17em>d
    x>>|<row|<cell|>|<cell|=lim<rsub|N\<rightarrow\>\<infty\>><big|sum><rsub|j=0><rsup|N><frac|1|\<lambda\><rsub|j>><big|int><rsub|D><big|int><rsub|D>\<phi\><rsub|k><around|(|x|)>\<phi\><rsub|i><around|(|y|)>*\<phi\><rsub|j><around|(|x|)>\<phi\><rsub|j><around|(|y|)>d*y<space|0.17em>d
    x>>|<row|<cell|>|<cell|=lim<rsub|N\<rightarrow\>\<infty\>><big|sum><rsub|j=0><rsup|N><frac|C<rsub|i,j,k>|\<lambda\><rsub|j>>>>>>>
  </equation>

  \;

  <subsection|The Eigenfunctions>

  \ Given the matrix elements <math|A<rsub|k*i>> as computed using the
  Christoffel-Darboux kernel approximation(which is exact in the limit), we
  can express the eigenfunctions <math|\<psi\><rsub|k><around|(|x|)>> in
  terms of the coefficients <math|c<rsub|i>> and the RKHS basis functions
  <math|\<phi\><rsub|k> >as follows:

  <\equation*>
    \<psi\><rsub|k><around|(|x|)>=<big|sum><rsub|i=0><rsup|n>c<rsub|i>*\<phi\><rsub|k*><around|(|x|)>
  </equation*>

  where <math|\<phi\><rsub|k*><around|(|x|)>> are the basis functions
  constituting the RKHS which reproduces <math|k<around*|(|x,y|)>>. The
  specific form of <math|\<psi\><rsub|k*><around|(|x|)>> depends on the
  choice of basis functions.

  In terms of the matrix elements <math|A<rsub|k*i>>, we can express the
  eigenfunctions as:

  <\equation*>
    \<psi\><rsub|k><around|(|x|)>=<big|sum><rsub|i=0><rsup|n>*\<phi\><rsub|*i><around|(|x|)><frac|c<rsub|i>|\<lambda\><rsub|k>>*<big|sum><rsub|j=0><rsup|N><frac|C<rsub|i*j*k>|\<lambda\><rsub|j>>*
  </equation*>

  where <math|C<rsub|i*j*k>> are the product integrals and
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
    <associate|A|<tuple|9|2>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1.3|3>>
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

      <with|par-left|<quote|1tab>|1.2<space|2spc>The Christoffel-Darboux
      kernel <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>The Eigenfunctions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>
    </associate>
  </collection>
</auxiliary>