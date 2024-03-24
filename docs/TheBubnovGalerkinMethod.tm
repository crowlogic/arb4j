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

  Consider a compact integral operator <math|K> with a
  positive-definitekernel function <math|k<around*|(|x,y|)>> acting on
  functions in <math|L<rsup|2><around|(|D|)>>, the space of square-integrable
  functions over the noncompact domain of the positive semi-infinite
  half-line <math|D=<around*|[|0,\<infty\>|)>> . The goal is to answer the
  eigenfunction question for <math|K>:

  <\equation>
    <around|(|K*\<psi\><rsub|n>|)><around|(|x|)>=<big|int><rsub|D>k*<around|(|x,y|)>*\<psi\><rsub|n><around|(|y|)>*d*y=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|x|)><around|(|K*\<psi\><rsub|n>|)><around|(|x|)>
  </equation>

  where <math|<rsub|>\<psi\><rsub|n><around*|(|x|)>> is the <math|n>-th
  eigenfunction corresponding to the <math|n>-th eigenvalue
  <math|\<lambda\><rsub|n>> of the integral covariance operator <math|K> and
  <math|k<around*|(|x,y|)>> can be represented \ sequence of orthonormal
  polynomials which converges uniformly to <math|k<around*|(|x,y|)>>

  <\equation>
    k<around*|(|x,y|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around*|(|x|)>\<phi\><rsub|n><around*|(|y|)>|\<lambda\><rsub|n>>
  </equation>

  The basis set \ <math|\<phi\><rsub|n><around*|(|x|)>> is a sequence of
  orthonormal polynomials derived from the orthogonalized Fourier transforms
  of the orthogonal polynomial sequence whose corresponding orthogonality
  measure is equal to the spectral density which is the Fourier transform of
  the kernel <math|k<around*|(|x,y|)>>.\ 

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

  and <math|<wide|c|\<vect\>>=<around*|[|c<rsub|0>,c<rsub|1>,\<ldots\>,c<rsub|n>|]>>
  is the vector of coefficients <math|c<rsub|i>>.

  \;
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
    <associate|A|<tuple|8|2>>
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