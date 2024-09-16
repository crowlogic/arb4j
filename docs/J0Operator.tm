<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  \;

  <doc-data|<\doc-title>
    The Eigenfunctions of <math|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around*|(|<around*|\||x-y|\|>|)>f<around*|(|x|)>\<mathd\>x>
    and a Technique For Deriving The Eigenfunctions of Stationary Gaussian
    Process Integral Covariance Operators
  </doc-title>|<doc-author|<author-data|<author-name|Stephen Crowley
  \<less\>stephencrowley214@gmail.com\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<\abstract>
    \ The null space of Gaussian process kernel inner product operators are
    shown to be the Fourier transforms of the polynomials orthogonal with
    respect to the spectral densities of the processes and it is furthermore
    shown that the orthogonal complements of the null spaces as given by the
    Gram-Schmidt recursions enumerate the products
    <math|g<rsub|k><around|(|t|)>=<sqrt|<frac|c<rsub|p>|c<rsub|q>>>*<frac|<big|prod><rsub|i=1><rsup|n<rsub|k>><around|(|t-\<alpha\><rsub|k,i>|)>|<big|prod><rsub|j=1><rsup|m<rsub|k>><around|(|t-\<beta\><rsub|k,j>|)>>=f<rsub|k><around*|(|t|)>*f<rsub|k><around*|(|s|)>>
    of the eigenfunctions <math|f<rsub|k>> of the corresponding integral
    covariance operators.
  </abstract>>

  Let <math|C<around|(|x|)>> be the covariance function of a stationary
  Gaussian process on <math|<around|[|0,\<infty\>|)>>. Define the integral
  covariance operator <math|T> by:

  <\equation>
    <around|(|T*f|)><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>C*<around|(|x-y|)>*f<around|(|y|)>*<space|0.17em>\<mathd\>*y
  </equation>

  Let <math|S<around|(|\<omega\>|)>> be the spectral density related to
  <math|C<around|(|x|)>> by the Wiener-Khinchin theorem:

  <\equation>
    C<around|(|x|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)>*<space|0.17em>\<mathd\>*\<omega\>
  </equation>

  <\equation>
    S<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*e<rsup|-i*x*\<omega\>>*\<mathd\>*x
  </equation>

  Consider polynomials <math|<around|{|p<rsub|n><around|(|\<omega\>|)>|}>>
  orthogonal with respect to <math|S<around|(|\<omega\>|)>>:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*p<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*<space|0.17em>\<mathd\>*\<omega\>=\<delta\><rsub|n*m>
  </equation>

  Define <math|r<rsub|n><around|(|x|)>> as the inverse Fourier transforms of
  <math|p<rsub|n><around|(|\<omega\>|)>>:

  <\equation>
    r<rsub|n><around|(|x|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x>*<space|0.17em>\<mathd\>*\<omega\>
  </equation>

  <\lemma>
    The functions <math|r<rsub|n><around|(|x|)>> form the null space of the
    kernel inner product:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)>*<space|0.17em>\<mathd\>*x=0
    </equation>
  </lemma>

  <\proof>
    Proof: Substitute the definitions of <math|C<around|(|x|)>> and
    <math|r<rsub|n><around|(|x|)>>, and apply Fubini's theorem:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)>*<space|0.17em>\<mathd\>*x=<big|int><rsub|0><rsup|\<infty\>><frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)>*<space|0.17em>\<mathd\>*\<omega\>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\><rprime|'>|)>*e<rsup|i*\<omega\><rprime|'>*x>*<space|0.17em>\<mathd\>*\<omega\><rprime|'>*<space|0.17em>\<mathd\>*x
    </equation>

    By Fubini's theorem, we can swap the integrals:

    <\equation>
      =<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\><rprime|'>|)>*S<around|(|\<omega\>|)>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*<around|(|\<omega\>+\<omega\><rprime|'>|)>*x>*<space|0.17em>\<mathd\>*x*<space|0.17em>\<mathd\>*\<omega\><rprime|'>*<space|0.17em>\<mathd\>*\<omega\>
    </equation>

    The integral over <math|x> yields the Dirac delta function
    <math|\<delta\>*<around|(|\<omega\>-\<omega\><rprime|'>|)>>:

    <\equation>
      =<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\><rprime|'>|)>*S<around|(|\<omega\>|)>*\<pi\>*\<delta\>*<around|(|\<omega\>-\<omega\><rprime|'>|)>*<space|0.17em>\<mathd\>*\<omega\><rprime|'>*<space|0.17em>\<mathd\>*\<omega\>
    </equation>

    Now, integrate over <math|\<omega\><rprime|'>> using the delta function:

    <\equation>
      =<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*<space|0.17em>\<mathd\>*\<omega\>
    </equation>

    By the orthogonality of <math|p<rsub|n><around|(|\<omega\>|)>> with
    respect to <math|S<around|(|\<omega\>|)>>, we conclude:

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*<space|0.17em>\<mathd\>*\<omega\>=0
    </equation>

    Thus, <math|<big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)>*<space|0.17em>\<mathd\>*x=0>,
    which completes the proof.
  </proof>

  <section|Eigenfunctions from Orthogonalized Null Space>

  By orthogonalizing the null space <math|<around|{|r<rsub|n><around|(|x|)>|}>>,
  we obtain the eigenfunctions <math|<around|{|\<psi\><rsub|n><around|(|x|)>|}>>
  of the covariance operator <math|T>. The orthogonalization process gives:

  <\equation*>
    r<rsup|\<perp\>><rsub|n><around|(|y|)>=\<psi\><rsub|n><around|(|x|)>=<big|sum><rsub|k=0><rsup|n>a<rsub|n*k>*r<rsub|k><around|(|x|)>=r<rsub|n><around|(|y|)>-<big|sum><rsub|m=0><rsup|n-1><frac|<around|\<langle\>|r<rsub|n><around|(|y|)>,r<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|r<rsup|\<perp\>><rsub|m><around|(|y|)>,r<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>>*r<rsup|\<perp\>><rsub|m><around|(|y|)>
  </equation*>

  where the coefficients <math|a<rsub|n*k>> are given by:

  <\equation>
    a<rsub|n*k>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1>|<cell|<text|if
    >k=n>>|<row|<cell|-<big|sum><rsub|j=k><rsup|n-1>a<rsub|n*j>*<around|\<langle\>|r<rsub|n>,\<psi\><rsub|j>|\<rangle\>>>|<cell|<text|if
    >k\<less\>n>>|<row|<cell|0>|<cell|<text|if >k\<gtr\>n>>>>>|\<nobracket\>>
  </equation>

  <\theorem>
    <label|factorize>For any rational function
    <math|f*<around|(|t-s|)>=<frac|P*<around|(|t-s|)>|Q*<around|(|t-s|)>>>,
    where <math|P> and <math|Q> are polynomials, there exist rational
    functions <math|g<around|(|t|)>> and <math|g<around|(|s|)>> such that
    <math|f*<around|(|t-s|)>=g<around|(|t|)>*g<around|(|s|)>>.
  </theorem>

  <\proof>
    Let

    <\equation>
      P*<around|(|t-s|)>=c<rsub|p>*<big|prod><rsub|i=1><rsup|n><around|(|t-s-\<alpha\><rsub|i>|)>
    </equation>

    \ and

    <\equation>
      Q*<around|(|t-s|)>=c<rsub|q>*<big|prod><rsub|j=1><rsup|m><around|(|t-s-\<beta\><rsub|j>|)>
    </equation>

    \ be the complete factorizations over <math|\<bbb-C\>>. Define:

    <\equation*>
      g<around|(|t|)>=<sqrt|<frac|c<rsub|p>|c<rsub|q>>>*<frac|<big|prod><rsub|i=1><rsup|n><around|(|t-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|t-\<beta\><rsub|j>|)>>
    </equation*>

    Then:

    <\align*>
      <tformat|<table|<row|<cell|g<around|(|t|)>*g<around|(|s|)>>|<cell|=<frac|c<rsub|p>|c<rsub|q>>*<frac|<big|prod><rsub|i=1><rsup|n><around|(|t-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|t-\<beta\><rsub|j>|)>>\<cdot\><frac|<big|prod><rsub|i=1><rsup|n><around|(|s-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|s-\<beta\><rsub|j>|)>>>>|<row|<cell|>|<cell|=<frac|c<rsub|p>|c<rsub|q>>*<frac|<big|prod><rsub|i=1><rsup|n><around|(|t-\<alpha\><rsub|i>|)>*<around|(|s-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|t-\<beta\><rsub|j>|)>*<around|(|s-\<beta\><rsub|j>|)>>>>|<row|<cell|>|<cell|=<frac|c<rsub|p>*<big|prod><rsub|i=1><rsup|n><around|(|<around|(|t-s|)>-\<alpha\><rsub|i>|)>|c<rsub|q>*<big|prod><rsub|j=1><rsup|m><around|(|<around|(|t-s|)>-\<beta\><rsub|j>|)>>>>|<row|<cell|>|<cell|=f*<around|(|t-s|)>>>>>
    </align*>

    For complex roots, we pair each <math|\<alpha\><rsub|i>> or
    <math|\<beta\><rsub|j>> with its complex conjugate in the factorization
    of <math|g<around|(|t|)>>. This ensures that the product
    <math|<around|(|t-\<alpha\><rsub|i>|)>*<around|(|t-<wide|\<alpha\><rsub|i>|\<bar\>>|)>>
    results in a quadratic polynomial with real coefficients, making
    <math|g<around|(|t|)>> a real-valued function.
  </proof>

  <\theorem>
    Let <math|<around|{|\<psi\><rsub|n><around|(|x|)>|}>> be the orthogonal
    complement of <math|<around|{|r<rsub|n><around|(|x|)>|}>>. Then
    <math|\<psi\><rsub|n><around|(|x|)>> are eigenfunctions of <math|T>, with
    eigenvalues:

    <\equation>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*\<psi\><rsub|n><around|(|z|)>*<space|0.17em>\<mathd\>*z
    </equation>
  </theorem>

  <\proof>
    This is not quite right, they have to be factorized as in Theorem
    <reference|factorize>. I think the infinite-dimensional version of this
    is the Hadamard product factorization?
  </proof>

  \;

  <\definition>
    Let <math|j<rsub|n><around|(|x|)>> is the spherical Bessel function of
    the first kind,\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|j<rsub|n><around|(|z|)>>|<cell|=<sqrt|<frac|\<pi\>|2*z>>*J<rsub|n+<frac|1|2>><around|(|x|)>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|z>>*<around*|(|sin
      <around|(|z|)>*R<rsub|n,<frac|1|2>><around|(|z|)>-cos
      <around|(|z|)>*R<rsub|n-1,<frac|3|2>><around|(|z|)>|)>>>>>>
    </equation>

    where <math|R<rsub|n,v><around|(|z|)>> are the (misnamed) Lommel
    polynomials <cite|modifiedLommelPolynomials>

    <\equation>
      R<rsub|n,v><around|(|z|)>=<frac|\<Gamma\>*<around|(|n+v|)>|\<Gamma\><around|(|v|)>><around*|(|<frac|2|z>|)><rsup|n><rsub|>*<rsub|2>F<rsub|3><around*|(|<around*|[|-<frac|n|2>,<frac|1|2>-<frac|n|2>|]>;<around*|[|v,-n,1-v-n|]>;-z<rsup|2>|)>
    </equation>

    where <math|*<rsub|2>F<rsub|3>> is a generalized hypergeometric function.
    The \PLommel polynomials\Q are actually rational functions of z, not
    polynomial; but rather \Ppolynomial in <math|<frac|1|z>>\Q.\ 
  </definition>

  \;

  <\conjecture>
    The series

    <\equation>
      <tabular|<tformat|<table|<row|<cell|J<rsub|0><around*|(|t|)>>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>>\<lambda\><rsub|k>\<psi\><rsub|k><around*|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>><sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>><frac|4*n+1|\<pi\>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>><around|(|-1|)><rsup|n>*j<rsub|2*n><around|(|t|)>>>>>>
    </equation>

    converges uniformly for all complex <math|t> except the origin where it
    has a regular singular point where <math|lim<rsub|t\<rightarrow\>0>J<rsub|0><around*|(|t|)>=1>.
  </conjecture>

  <\conjecture>
    The eigenfunctions of the stationary integral covariance operator\ 

    <\equation>
      <around*|[|T \<psi\><rsub|n>|]><around*|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around*|(|x|)>\<mathd\>x=\<lambda\><rsub|n>\<psi\><rsub|n><around*|(|x|)><label|T>
    </equation>

    are given by

    <\equation>
      \<psi\><rsub|n><around*|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>
    </equation>

    and the eigenvalues are given by

    <math|<\text>
      <\equation>
        <tabular|<tformat|<table|<row|<cell|\<lambda\><rsub|n>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)><space|0.17em><math-up|d>x>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|\<pi\>>>*<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>>>>>>
      </equation>
    </text>>

    where <math|<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>> is the Pochhammer
    symbol(ascending/rising factorial).\ 

    <\note>
      TODO: change <math|J<rsub|0><around*|(|x|)>> to
      <math|J<rsub|0><around*|(|<around*|\||x|\|>|)>> and
      <math|\<psi\><rsub|n><around*|(|y|)>> to
      <math|\<psi\><rsub|n><around*|(|<around*|\||y|\|>|)>,>by doing so the
      range of integration can be extended \ from
      <math|<around*|(|0,\<infty\>|)>> to
      <math|<around*|(|-\<infty\>,\<infty\>|)>> without the integral
      vanishing due to the fact that the odd-idexed Bessel functions are odd
      and therefore integration over the full interval vanishes unless the
      absolute value is used. The absolute value is the natural way to
      utilize the functions sice they are symmetric or anti-symmetric
      depending upon the parity of the index and thus no information is lost
      in making this change and indeed doing so will make all the
      integer-indexed Type-1 Bessel functions representable via this
      expansion rather than only the even indexed ones as it is now. The
      primary aim is to conclusively prove that the proposed functions are
      the eigenfunctions and eigenvalues of
      <math|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around*|(|x|)>\<mathd\>x>
      but solving the operator for each <math|<big|int><rsub|0><rsup|\<infty\>>J<rsub|m><around|(|x-y|)>*\<psi\><rsub|n><around*|(|x|)>\<mathd\>x>
      seems inevitable since the same cofactor appears in\ 
    </note>
  </conjecture>

  <\big-figure|<image|KConvergence.eps|375pt|200pt||>>
    <math|J<rsub|0>> compared to the finite-rank approximations for rank
    <math|0,5,<text|and>> 10. The figure shows the excellent convergence
    properties of the proposed eigenfunction expansion
    <math|J<rsub|0><around*|(|x|)>=lim<rsub|n\<rightarrow\>\<infty\>><big|sum><rsub|k=0><rsup|n>\<lambda\><rsub|k>\<psi\><rsub|k><around*|(|x|)>>.
  </big-figure>

  <\remark>
    There is no doubt that the expansion <math|J<rsub|0><around*|(|x|)>=lim<rsub|n\<rightarrow\>\<infty\>><big|sum><rsub|k=0><rsup|n>\<lambda\><rsub|k>\<psi\><rsub|k><around*|(|x|)>>
    is correct, but only finding the eigenfunctions of the finite-rank
    operators and confirming via Rellich's theorem that the finite-rank
    subspace operators have eigenfunctions which converge to the full-rank
    operator eigenfunctions <math|\<psi\><rsub|n><around*|(|x|)>> whose
    eigenvalues are <math|\<lambda\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around*|(|<around*|\||x|\|>|)>\<psi\><rsub|n><around*|(|x|)>\<mathd\>x>
  </remark>

  <\theorem>
    The operator defined by Equation (<reference|T>) is compact relative to
    the canonical metric induced by the covariance kernel
    <math|J<rsub|0><around*|(|<around*|\||x-y|\|>|)>>.
  </theorem>

  <\proof>
    Due to the spectral theorem for compact operators, if an operator is
    self-adjoint and has eigenvalues converging to 0, then it is necessarily
    compact. It is easy to see that

    <\equation>
      lim<rsub|n\<rightarrow\>\<infty\>>\<lambda\><rsub|n>=0
    </equation>

    and due to the symmetry of <math|J<rsub|0><around*|(|<around*|\||t|\|>|)>>
    it is self-adjoint and therefore the operator <math|T> defined in
    Equation (<reference|T>) is compact. <cite|onCompactOperators>
  </proof>

  <\definition>
    The spectral density of a stationary process is the Fourier tranform of
    the covariance kernel due to Wiener-Khinchine theorem.
  </definition>

  <\definition>
    Let <math|S<rsub|n><around*|(|x|)>> be the orthogonal polynomials whose
    orthogonality measure is equal to the spectral density of the process.
    These polynomials shall be called the spectral polynomials corresponding
    to the process.
  </definition>

  <\example>
    Let the kernel function be given by <math|K<around*|(|t,s|)>=J<rsub|0><around*|(|t-s|)>>
    then identify the orthogonal polynomial sequence associated with the
    spectral density\ 

    <\equation>
      S<around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around|(|x|)>*e<rsup|i*x*\<omega\>><space|0.17em><math-up|d>x=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|2|<sqrt|1-\<omega\><rsup|2>>>>|<cell|\<omega\>\<in\><around|(|-1,1|)>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
    </equation>

    as being twice the orthogonality measure of the Type-I Chebyshev
    polynomials <math|T<rsub|n><around*|(|x|)>> so that the orthogonal
    polynomial sequence is identified as\ 

    <\equation>
      S<rsub|n><around*|(|x|)>=<sqrt|2>T<rsub|n><around*|(|x|)>
    </equation>

    \ so that\ 

    <\equation>
      <big|int><rsub|-1><rsup|1>S<rsub|n><around|(|\<omega\>|)>*S<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)><space|0.17em><math-up|d>\<omega\>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|0>|<cell|n\<neq\>m>>|<row|<cell|2\<pi\>>|<cell|n=m=0>>|<row|<cell|\<pi\>>|<cell|n=m\<neq\>0>>>>>|\<nobracket\>>
    </equation>
  </example>

  <\remark>
    \ If the spectral density does not equal the orthogonality measure of a
    known set of orthogonal polynomials then such a set can always be
    generated by applying the Gram-Schmidt process to the monomials so that
    they are transformed into a set that is orthogonal with respect any given
    spectral density (of a stationary process).
  </remark>

  <\definition>
    The sequence <math|<wide|S|^><rsub|n><around|(|y|)>> of Fourier
    transforms of the spectral polynomials <math|S<rsub|n><around*|(|x|)>> is
    given by

    <\equation>
      <wide|S|^><rsub|n><around|(|y|)>=<big|int><rsub|-1><rsup|1>S<rsub|n><around*|(|x|)>e<rsup|i
      x y>\<mathd\>x
    </equation>
  </definition>

  <\example>
    The Fourier transforms of the Chebyshev polynomials are just the usual
    infinite Fourier transforms with the integration restricted to the range
    <math|-1*\<ldots\>*1> since <math|T<rsub|n><around|(|x|)>=0\<forall\>x\<nin\><around|[|-1,1|]>>).
    Equivalently, the spectral density function can be extended to take the
    value 0 outside the interval <math|<around*|[|-1,1|]>>. The derivation of

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<wide|T|^><rsub|n><around|(|y|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
      y>*T<rsub|n><around|(|x|)>d*y=<big|int><rsub|-1><rsup|1>e<rsup|-i*x
      y>*T<rsub|n><around|(|x|)>d*x>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
      y> <rsub|2>F<rsub|1><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|<frac|1|2>>>>>><mid|\|><frac|1|2>-<frac|x|2>|)>*<rsub|>d*x>>|<row|<cell|>|<cell|=<with|font-base-size|12|<frac|i*|y>*><around*|(|e<rsup|-i
      y>F<rsup|+><rsub|n><around*|(|y|)>-e<rsup|i<around*|(|\<pi\>n+y|)>>F<rsub|n><rsup|-><around*|(|y|)>|)>>>>>>
    </equation>

    where

    <\equation>
      F<rsub|n><rsup|\<pm\>><around*|(|y|)>=<rsub|3>F<rsub|1><around*|(|<tabular*|<tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|1,>|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|>|<cell|<frac|1|2>>>>>><mid|\|><frac|\<pm\>i
      y|2>|)>
    </equation>

    can be found in <cite|finiteFourierTransforms>.

    \;
  </example>

  <\definition>
    Let <math|Y<rsub|n><around*|(|y|)>> be the normalized spectral
    polynomials <math|S<rsub|n><around*|(|x|)>>
  </definition>

  <\example>
    \ When <math|K=J<rsub|0>> the spectral polynomials are given by

    <\equation>
      S<rsub|n><around*|(|x|)>=<sqrt|2>T<rsub|n><around*|(|x|)>
    </equation>

    so that \ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|Y<rsub|n><around*|(|y|)>>|<cell|=<frac|<wide|T|^><rsub|n><around|(|y|)>|<around*|\||<wide|T|^><rsub|n>|\|>>>>|<row|<cell|>|<cell|=<frac|i*|y><around*|(|<frac|e<rsup|-i
      y>F<rsup|+><rsub|n><around*|(|y|)>-e<rsup|i<around*|(|\<pi\>n+y|)>>F<rsub|n><rsup|-><around*|(|y|)>|<sqrt|<frac|4<around*|(|-1|)><rsup|n>\<pi\>-<around*|(|2n<rsup|2>-1|)>|4n<rsup|2>-1>>>|)>>>>>>
    </equation>

    where the <math|L<rsup|2>> norm of <math|<wide|T|^><rsub|n><around|(|y|)>>
    is given by

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around*|\||<wide|T|^><rsub|n>|\|><rsub|>>|<cell|=<sqrt|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|T|^><rsub|n><around|(|y|)><rsup|2>\<mathd\>y>>>|<row|<cell|>|<cell|=<sqrt|<frac|4<around*|(|-1|)><rsup|n>\<pi\>-<around*|(|2n<rsup|2>-1|)>|4n<rsup|2>-1>>>>>>>
    </equation>
  </example>

  \ 

  <\conjecture>
    The eigenfunctions of the integral covariance operator (<reference|T>)
    are given by the orthogonal complement of the normalized Fourier
    transforms <math|Y<rsub|n><around*|(|y|)>> of the spectral polynomials
    (via the Gram-Schmidt process)

    <\equation>
      \<psi\><rsub|n><around|(|y|)>=Y<rsup|\<perp\>><rsub|n><around|(|y|)>=Y<rsub|n><around|(|y|)>-<big|sum><rsub|m=1><rsup|n-1><frac|<around|\<langle\>|Y<rsub|n><around|(|y|)>,Y<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|Y<rsup|\<perp\>><rsub|m><around|(|y|)>,Y<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>>*Y<rsup|\<perp\>><rsub|m><around|(|y|)>
    </equation>

    can be equivalently expressed as

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<psi\><rsub|n><around|(|y|)>>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|4*\<pi\>>>*<big|int><rsub|-1><rsup|1>P<rsub|2*n><around|(|x|)>*e<rsup|i*x*y><space|0.17em><math-up|d>x>>>>>
    </equation>
  </conjecture>

  <\remark>
    Since <math|T> is compact due to its self-adjointness and convergence of
    the eigenvalues to <math|0> it converges uniformly since compactness
    implies uniform convergence of the eigenfunctions. TODO: cite/theorems
    from <cite-detail|gaussianProcessIntroduction|3. Reproducing Kernel
    Hilbert Space of a Gaussian Process>
  </remark>

  <\theorem>
    <label|Taddition>The Bessel function identity

    <\equation>
      J<rsub|0>*<around|(|x-y|)>=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*J<rsub|k>*<around|(|y|)>
    </equation>

    can be used to expression Equation (<reference|T>) as a series

    <\equation*>
      <tabular|<tformat|<table|<row|<cell|<around|[|T*f|]><around|(|y|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*f<around|(|x|)>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*J<rsub|k>*<around|(|y|)>*f<around*|(|x|)><space|0.17em>d*x>>|<row|<cell|>|<cell|=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|y|)><big|int><rsub|0><rsup|\<infty\>>*J<rsub|k>*<around|(|x|)>*f<around*|(|x|)>*<space|0.17em>d*x<space|1em>>>>>>
    </equation*>

    by applying Fubini's theorem to exchange the sum with the integral when
    <math|f> is absolutely integrable.\ 
  </theorem>

  <\proof>
    TODO: demonstrate the identity is well-known and the interchange is
    justified when <math|f\<in\>L<rsup|1><rsub|0,\<infty\>>>, e.g., <math|f>
    is Lebesgue absolutely integrable over <math|<around*|[|0,\<infty\>|]>>
  </proof>

  <\example>
    <label|conv>Simplifying The Convolution

    Apply the addition theorem

    <\equation>
      J<rsub|0>*<around|(|x-y|)>=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*J<rsub|k><around|(|y|)>
    </equation>

    to the integral covariance operator from Conjecture <reference|Taddition>

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|[|T*\<psi\><rsub|n>|]><around|(|x|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*J<rsub|k><around|(|y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|k><around|(|y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y<space|1em>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|k><around|(|y|)>*<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>*<space|0.17em>d*y>>>>>
    </equation>

    Where <math|\<psi\><rsub|n><around|(|y|)>> is:

    <\equation>
      \<psi\><rsub|n><around|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
    </equation>

    Substituting

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>J<rsub|k><around|(|y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|k><around|(|y|)>*<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<frac|<sqrt|4*n+1>*<around|(|-1|)><rsup|n><sqrt|\<pi\>>*\<Gamma\>*<around*|(|<frac|k|2>+n+<frac|1|2>|)>|2*\<Gamma\>*<around*|(|-n+<frac|k|2>+<frac|1|2>|)>*\<Gamma\>*<around*|(|<frac|k|2>+n+1|)>*\<Gamma\>*<around*|(|n+1-<frac|k|2>|)>>>>>>><label|dualBasis>
    </equation>

    Now, putting it all back into the expansion for
    <math|<around|[|T*\<psi\><rsub|n>|]><around|(|x|)>>:

    <\equation>
      <around|[|T*\<psi\><rsub|n>|]><around|(|x|)>=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)><frac|<sqrt|4*n+1>*<around|(|-1|)><rsup|n><sqrt|\<pi\>>*\<Gamma\>*<around*|(|<frac|k|2>+n+<frac|1|2>|)>|2*\<Gamma\>*<around*|(|-n+<frac|k|2>+<frac|1|2>|)>*\<Gamma\>*<around*|(|<frac|k|2>+n+1|)>*\<Gamma\>*<around*|(|n+1-<frac|k|2>|)>><label|Tadd>
    </equation>
  </example>

  <\remark>
    I checked a few points of Equation <reference|Tadd> and found it to only
    be correct for <math|x=0>; I think the calculations need to be redone
    with the kernel <math|J<rsub|0><around*|(|<around*|\||x|\|>|)>> instead
    of <math|J<rsub|0><around*|(|x|)>> because as is, the reproduction of the
    odd-indexed Bessel functions does not hold, only for the even functions
    <math|J<rsub|2n>> is it true that

    <\equation>
      J<rsub|2n><around*|(|x|)>=<big|sum><rsub|k=0><rsup|\<infty\>>\<psi\><rsub|k><around*|(|x|)><big|int><rsub|0><rsup|\<infty\>>J<rsub|2n><around*|(|y|)>\<psi\><rsub|k><around*|(|y|)>\<mathd\>k
    </equation>
  </remark>

  which is the same as Equation <reference|dualBasis> after making the
  change-of-variables <math|2n\<rightarrow\>n>. Now that I think about that
  as I write it, I realize that's probably why Equation <reference|Tadd>
  doesn't quite work as written<text-dots>hmm.\ 

  <\theorem>
    <\equation>
      <big|sum><rsub|k=0><rsup|\<infty\>>\<psi\><rsub|k><around*|(|x|)><rsup|2>=<frac|1|\<pi\>>
    </equation>
  </theorem>

  <\theorem>
    \;

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|n><around*|(|x|)><rsup|2>\<mathd\>x=1=K<around*|(|s,s|)>=K<around*|(|s-s|)>=K<around*|(|0|)>
    </equation>
  </theorem>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|4>
      <bibitem*|1><label|bib-onCompactOperators>Alen Alexanderian.
      <newblock>On compact operators. <newblock><with|font-shape|italic|Journal
      of Mathematical Analysis and Applications>, 18(2):5\U36,
      2013.<newblock>

      <bibitem*|2><label|bib-finiteFourierTransforms>Atul Dixit, Lin Jiu,
      Victor<nbsp>H Moll<localize|, and >Christophe Vignat. <newblock>The
      finite fourier transform of classical polynomials.
      <newblock><with|font-shape|italic|Journal of the Australian
      Mathematical Society>, 98:145\U160, 2015.<newblock>

      <bibitem*|3><label|bib-modifiedLommelPolynomials>R.<nbsp>Wong K.F. Lee.
      <newblock>Asymptotic expansion of the modified lommel polynomials
      <math|h<rsub|n,\<nu\>><around|(|x|)>> and their zeros.
      <newblock><with|font-shape|italic|Proceedings of the American
      Mathematical Society>, 142(11):3953\U3964, 2014.<newblock>

      <bibitem*|4><label|bib-gaussianProcessIntroduction>Steven<nbsp>P.<nbsp>Lalley.
      <newblock>Introduction to gaussian processes.
      <newblock>https://galton.uchicago.edu/<math|\<sim\>>elalley/Courses/386/GaussianProcesses.pdf,
      2013.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|T|<tuple|19|5>>
    <associate|Tadd|<tuple|39|10>>
    <associate|Taddition|<tuple|20|9>>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-2|<tuple|1|6>>
    <associate|auto-3|<tuple|42|11>>
    <associate|bib-finiteFourierTransforms|<tuple|2|11>>
    <associate|bib-gaussianProcessIntroduction|<tuple|4|11>>
    <associate|bib-modifiedLommelPolynomials|<tuple|3|11>>
    <associate|bib-onCompactOperators|<tuple|1|11>>
    <associate|conv|<tuple|21|9>>
    <associate|dualBasis|<tuple|38|10>>
    <associate|factorize|<tuple|2|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      modifiedLommelPolynomials

      onCompactOperators

      finiteFourierTransforms

      gaussianProcessIntroduction
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1>|>
        <with|mode|<quote|math>|J<rsub|0>> compared to the finite-rank
        approximations for rank <with|mode|<quote|math>|0,5,<with|mode|<quote|text>|and>>
        10. The figure shows the excellent convergence properties of the
        proposed eigenfunction expansion <with|mode|<quote|math>|J<rsub|0><around*|(|x|)>=lim<rsub|n\<rightarrow\>\<infty\>><big|sum><rsub|k=0><rsup|n>\<lambda\><rsub|k>\<psi\><rsub|k><around*|(|x|)>>.
      </surround>|<pageref|auto-2>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Eigenfunctions
      from Orthogonalized Null Space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>