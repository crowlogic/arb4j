<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Orthonormal Galerkin Method for Stationary Integral
  Covariance Operator Eigenfunction Expansions>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Given>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Objective>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Proof>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Verification
    that Solutions are Eigenfunctions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Given>

  <\enumerate>
    <item><math|K<around|(|s,t|)>=K*<around|(|t-s|)>>

    <item><math|K*<around|(|t-s|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<psi\><rsub|n>*<around|(|t-s|)>>
    (uniformly convergent)

    <item>Eigenvalue equation: <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*\<phi\><rsub|k><around|(|t|)>*<space|0.17em>d*t=\<lambda\><rsub|k>*\<phi\><rsub|k><around|(|s|)>>

    <item>Eigenfunction expansion: <math|\<phi\><rsub|k><around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>>

    <item>The basis functions <math|<around|{|\<psi\><rsub|n>|}>> are
    orthonormal, i.e., <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|m><around|(|s|)>*\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s=\<delta\><rsub|m*n>>
  </enumerate>

  <section|Objective>

  The goal is to solve for the coefficient matrix <math|c<rsub|n,k>> of the
  eigenfunctions

  <\equation>
    T*\<phi\><rsub|k><around|(|s|)>=\<lambda\><rsub|k>*\<phi\><rsub|k><around|(|s|)>
  </equation>

  of the integral covariance operator

  <\equation>
    T*f<around|(|s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*f<around|(|t|)>*<space|0.17em>d*t
  </equation>

  <section|Proof>

  <\enumerate>
    <item>The eigenfunction expansion is substituted into the eigenvalue
    equation:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|s|)>
    </equation>

    <item>Using the uniform expansion of <math|K>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|sum><rsub|j=0><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|s|)>
    </equation>

    <item>Applying Fubini's theorem (justified by uniform convergence):

    <\equation>
      <big|sum><rsub|j=0><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|s|)>
    </equation>

    <item>Let <math|G<rsub|j,n><around|(|s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t>:

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|sum><rsub|j=0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|s|)>
    </equation>

    <item>Projecting onto the basis <math|<around|{|\<psi\><rsub|m><around|(|s|)>|}>>
    by multiplying both sides by <math|\<psi\><rsub|m><around|(|s|)>> and
    integrating over <math|s>:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|sum><rsub|j=0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s=\<lambda\><rsub|k>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s
    </equation>

    <item>Interchanging summation and integration:

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s
    </equation>

    <item>The right-hand side simplifies to
    <math|\<lambda\><rsub|k>*c<rsub|m,k>> by orthonormality of
    <math|<around|{|\<psi\><rsub|n>|}>>. Define:

    <\align>
      <tformat|<table|<row|<cell|b<rsub|m,n>>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s<eq-number>>>>>
    </align>

    <item>The equation becomes:

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>>b<rsub|m,n>*c<rsub|n,k>=\<lambda\><rsub|k>*c<rsub|m,k>
    </equation>

    <item>This reduces to a standard eigenvalue problem:

    <\equation>
      B*<wide|c|\<vect\>><rsub|k>=\<lambda\><rsub|k>*<wide|c|\<vect\>><rsub|k>
    </equation>

    where <math|B=<around|(|b<rsub|m,n>|)>> and
    <math|<wide|c|\<vect\>><rsub|k>=<around|(|c<rsub|0,k>,c<rsub|1,k>,\<ldots\>|)><rsup|T>>
  </enumerate>

  <section|Verification that Solutions are Eigenfunctions>

  A verification that the solutions obtained are indeed eigenfunctions of the
  original integral equation follows:

  <\enumerate>
    <item>Let <math|\<lambda\><rsub|k>> and
    <math|<wide|c|\<vect\>><rsub|k>=<around|(|c<rsub|0,k>,c<rsub|1,k>,\<ldots\>|)><rsup|T>>
    be the eigenvalues and eigenvectors of the matrix equation:

    <\equation>
      B*<wide|c|\<vect\>><rsub|k>=\<lambda\><rsub|k>*<wide|c|\<vect\>><rsub|k>
    </equation>

    where <math|B=<around|(|b<rsub|m,n>|)>> as derived above.

    <item>The functions <math|\<phi\><rsub|k><around|(|t|)>> are constructed
    as:

    <\equation>
      \<phi\><rsub|k><around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>
    </equation>

    <item>Substituting into the original integral equation:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*\<phi\><rsub|k><around|(|t|)>*d*t=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)><around*|[|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>|]>*d*t
    </equation>

    <item>Using the expansion of <math|K*<around|(|t-s|)>> and interchanging
    summations:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|sum><rsub|j=0><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>|]><around*|[|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>|]>*d*t<eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*d*t<eq-number>>>>>
    </align>

    <item>Recalling the definitions:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|G<rsub|j,n><around|(|s|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|b<rsub|m,n>>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s>>>>>
    </equation>

    <item>The left-hand side of the integral equation can be rewritten:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|T*\<phi\><rsub|k><around|(|s|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*\<phi\><rsub|k><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)><around*|[|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>|]>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k><around*|[|<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t|]>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k><around*|[|<big|sum><rsub|j=0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>|]>>>>>>
    </equation>

    <item>Projecting onto <math|\<psi\><rsub|m><around|(|s|)>> by multiplying
    by <math|\<psi\><rsub|m><around|(|s|)>> and integrating over <math|s>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|m><around|(|s|)>*T*\<phi\><rsub|k><around|(|s|)>*<space|0.17em>d*s>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<psi\><rsub|m><around|(|s|)><around*|[|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k><around*|[|<big|sum><rsub|j=0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>|]>|]>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k><around*|[|<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s|]>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*b<rsub|m,n>>>|<row|<cell|>|<cell|=<around|(|B*<wide|c|\<vect\>><rsub|k>|)><rsub|m>>>|<row|<cell|>|<cell|=\<lambda\><rsub|k><around|(|<wide|c|\<vect\>><rsub|k>|)><rsub|m>>>|<row|<cell|>|<cell|=\<lambda\><rsub|k>*c<rsub|m,k>>>>>>
    </equation>

    <item>Since this holds for all <math|m>, and
    <math|<around|{|\<psi\><rsub|m>|}>> is a complete orthonormal basis, the
    conclusion follows:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*\<phi\><rsub|k><around|(|t|)>*d*t=\<lambda\><rsub|k>*\<phi\><rsub|k><around|(|s|)>
    </equation>
  </enumerate>

  Therefore, the <math|\<phi\><rsub|k><around|(|s|)>> constructed from the
  eigenvectors of <math|B> are indeed eigenfunctions of the original integral
  equation with eigenvalues <math|\<lambda\><rsub|k>>.
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
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Given>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Objective>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Verification
      that Solutions are Eigenfunctions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>