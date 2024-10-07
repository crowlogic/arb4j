<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Orthonormal Galerkin Method for Stationary Integral
  Covariance Operator Eigenfunction Expansions>|<doc-author|<author-data|<author-name|Stephen
  Crowley>>>>

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
    <item><math|K<around|(|s,t|)>=K*<around|(|t-s|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around*|\<langle\>|\<psi\><rsub|n>,K|\<rangle\>>\<psi\><rsub|n>*<around|(|t-s|)>><space|4em>(uniformly
    convergent)

    where

    <\equation>
      <around*|\<langle\>|f,g|\<rangle\>>=<around*|\<langle\>|f,g|\<rangle\>><rsub|X>=<big|int><rsub|0><rsup|\<infty\>>f<around*|(|t|)>g<around*|(|t|)>\<mathd\>t
    </equation>

    is the standard Lebesgue <math|L<rsup|2>> inner-product over
    <math|X=<around*|[|0,\<infty\>|]>>

    <item>Eigenvalue equation: <math|<big|int><rsub|0><rsup|\<infty\>>K*<around|(|t-s|)>*\<phi\><rsub|k><around|(|t|)>*<space|0.17em>d*t=\<lambda\><rsub|k>*\<phi\><rsub|k><around|(|s|)>>

    <item>Eigenfunction expansion: <math|\<phi\><rsub|k><around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>>

    <item>The basis functions <math|<around|{|\<psi\><rsub|n>|}>> are
    orthonormal, i.e., <math|<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|m><around|(|s|)>*\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s=\<delta\><rsub|m*n>>
  </enumerate>

  <section|Objective>

  Solve for the coefficient matrices <math|c<rsub|n,k>> for the
  eigenfunctions\ 

  <\equation>
    T \<phi\><rsub|k><around|(|s|)>=\<lambda\><rsub|k>*\<phi\><rsub|k><around|(|s|)>
  </equation>

  of the integral covariance operator

  <\equation>
    T f<around*|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>K<around|(|t-s|)>*f<around|(|t|)>*<space|0.17em>d*t<space|1em>
  </equation>

  <section|Proof>

  <\enumerate>
    <item>Substitute the eigenfunction expansion into the eigenvalue
    equation:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>K*<around|(|t-s|)>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|s|)>
    </equation>

    <item>Use the uniform expansion of <math|K>:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|j=0><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|s|)>
    </equation>

    <item>Apply Fubini's theorem (justified by uniform convergence):

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|s|)><label|1stFubini>
    </equation>

    <item>Define <math|>

    <\equation>
      G<rsub|j,n><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t<label|G>
    </equation>

    to express (<reference|1stFubini>)

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<label|1stFubini>\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|s|)>>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k><big|sum><rsub|j=0><rsup|\<infty\>>*G<rsub|j,n><around|(|s|)>>>>>>
    </equation>

    <item>Project onto the basis <math|<around|{|\<psi\><rsub|m><around|(|s|)>|}>>:
    Multiply both sides by <math|\<psi\><rsub|m><around|(|s|)>>, integrate
    over <math|s>, interchange summation and integration, then finally
    utilize the orthonormality of <math|<around|{|\<psi\><rsub|n>|}>>

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<lambda\><rsub|k>*<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|sum><rsub|j=0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=\<lambda\><rsub|k>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<delta\><rsub|n,m>>>|<row|<cell|>|<cell|=\<lambda\><rsub|k>*c<rsub|m,k>>>>>><label|projection>
    </equation>

    <item> Define:

    <\align>
      <tformat|<table|<row|<cell|b<rsub|m,n>>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s<eq-number>>>>>
    </align>

    <item>Equation (<reference|projection>) becomes:

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>>b<rsub|m,n>*c<rsub|n,k>=\<lambda\><rsub|k>*c<rsub|m,k>
    </equation>

    <item>This is a standard eigenvalue problem:

    <\equation>
      B*<wide|c|\<vect\>><rsub|k>=\<lambda\><rsub|k>*<wide|c|\<vect\>><rsub|k>
    </equation>

    where <math|B=<around|(|b<rsub|m,n>|)>> and
    <math|<wide|c|\<vect\>><rsub|k>=<around|(|c<rsub|0,k>,c<rsub|1,k>,\<ldots\>|)><rsup|T>>
  </enumerate>

  <section|Verification that Solutions are Eigenfunctions>

  We will now prove that the solutions obtained are indeed eigenfunctions of
  the original integral equation.

  <\itemize>
    <item>Let <math|\<lambda\><rsub|k>> and
    <math|<wide|c|\<vect\>><rsub|k>=<around|(|c<rsub|0,k>,c<rsub|1,k>,\<ldots\>|)><rsup|T>>
    be the eigenvalues and eigenvectors of the matrix equation:

    <\equation>
      B*<wide|c|\<vect\>><rsub|k>=\<lambda\><rsub|k>*<wide|c|\<vect\>><rsub|k>
    </equation>

    where <math|B=<around|(|b<rsub|m,n>|)>> as derived above.

    <item>construct the functions <math|\<phi\><rsub|k><around|(|t|)>>:

    <\equation>
      \<phi\><rsub|k><around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>
    </equation>

    <item>Substitute this into the original integral equation and use the
    expansion of <math|K*<around|(|t-s|)>> to interchanging summations

    <\equation>
      <tabular|<tformat|<table|<row|<cell|T\<phi\><rsub|k><around|(|t|)>*>|<cell|=<big|int><rsub|0><rsup|\<infty\>>K*<around|(|t-s|)>*\<phi\><rsub|k><around|(|t|)>*d*t>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>K*<around|(|t-s|)><around*|[|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>|]>*d*t>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around*|[|<big|sum><rsub|j=0><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>|]><around*|[|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>|]>*dt*>>|<row|<cell|>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k><big|sum><rsub|j=0><rsup|\<infty\>>G<rsub|j,n><around*|(|s|)>*>>>>>
    </equation>

    <item>then rewrite the left-hand side of the integral equation:

    <\align*>
      <tformat|<table|<row|<cell|T*\<phi\><rsub|k><around|(|s|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>K*<around|(|t-s|)>*\<phi\><rsub|k><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>K*<around|(|t-s|)><around*|[|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*\<psi\><rsub|n><around|(|t|)>|]>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|0><rsup|\<infty\>>K*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k><around*|[|<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t|]>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k><around*|[|<big|sum><rsub|j=0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>|]>>>>>
    </align*>

    recalling that the matrix elements (<reference|G>) of <math|G> \ are
    functions defined by\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|G<rsub|j,n><around|(|s|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j>*<around|(|t-s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|b<rsub|m,n>>|<cell|=<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s>>>>>
    </equation>

    <item>finally, project <math|T*\<phi\><rsub|k><around|(|s|)>> onto
    <math|\<psi\><rsub|m><around|(|s|)>> by multiplying it by
    <math|\<psi\><rsub|m><around|(|s|)>> then integrating over <math|s> from
    0 to <math|\<infty\>>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|m><around|(|s|)>*T*\<phi\><rsub|k><around|(|s|)>*<space|0.17em>d*s>|<cell|=<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|m><around|(|s|)><around*|[|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k><around*|[|<big|sum><rsub|j=0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>|]>|]>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k><around*|[|<big|sum><rsub|j=0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>G<rsub|j,n><around|(|s|)>*\<psi\><rsub|m><around|(|s|)>*<space|0.17em>d*s|]>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n,k>*b<rsub|m,n>>>|<row|<cell|>|<cell|=B*<around*|{|<wide|c|\<vect\>><rsub|k>|}>>>|<row|<cell|>|<cell|=\<lambda\><rsub|k><wide|c|\<vect\>><rsub|k>>>|<row|<cell|>|<cell|=\<lambda\><rsub|k>*c<rsub|m,k>>>>>>
    </equation>

    <item>Since this holds for all <math|m>, and
    <math|<around|{|\<psi\><rsub|m>|}>> is a complete orthonormal basis, we
    conclude:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>K*<around|(|t-s|)>*\<phi\><rsub|k><around|(|t|)>*d*t=\<lambda\><rsub|k>*\<phi\><rsub|k><around|(|s|)>
    </equation>
  </itemize>

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
    <associate|1stFubini|<tuple|8|2|orthonormalCharacteristicFunctionExpansions.tm>>
    <associate|G|<tuple|7|2|orthonormalCharacteristicFunctionExpansions.tm>>
    <associate|auto-1|<tuple|1|1|orthonormalCharacteristicFunctionExpansions.tm>>
    <associate|auto-2|<tuple|2|1|orthonormalCharacteristicFunctionExpansions.tm>>
    <associate|auto-3|<tuple|3|2|orthonormalCharacteristicFunctionExpansions.tm>>
    <associate|auto-4|<tuple|4|3|orthonormalCharacteristicFunctionExpansions.tm>>
    <associate|projection|<tuple|9|?|orthonormalCharacteristicFunctionExpansions.tm>>
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