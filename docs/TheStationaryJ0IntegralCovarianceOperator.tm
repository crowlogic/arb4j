<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|framed-theorems>>

<\body>
  \;

  <doc-data|<doc-title|The Stationary <math|J<rsub|0>> Integral Covariance
  Operator>|<doc-author|<author-data|<author-name|Stephen A.
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\lemma>
    <label|ortho>The functions

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<psi\><rsub|n><around|(|y|)>>|<cell|=*<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around*|(|-1|)><rsup|n><sqrt|<frac|4n+1|\<pi\>>>j<rsub|2n><around*|(|y|)>>>>>>
    </equation>

    are orthonormal over the interval <math|0> to <math|\<infty\>>, i.e.,

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|n><around|(|y|)>*\<psi\><rsub|m><around|(|y|)>*<space|0.17em>d*y=\<delta\><rsub|n*m>,
    </equation*>

    where <math|\<delta\><rsub|n*m>> is the Kronecker delta.
  </lemma>

  <\proof>
    Consider the integral

    <\equation>
      I=<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|n><around|(|y|)>*\<psi\><rsub|m><around|(|y|)>*<space|0.17em>d*y
    </equation>

    Substituting <math|\<psi\><rsub|n><around|(|y|)>> and
    <math|\<psi\><rsub|m><around|(|y|)>>, we get:

    <\equation>
      I=<big|int><rsub|0><rsup|\<infty\>><sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)><sqrt|<frac|4*m+1|y>>*<around|(|-1|)><rsup|m>*J<rsub|2*m+<frac|1|2>><around|(|y|)>*<space|0.17em>d*y
    </equation>

    This simplifies to:

    <\equation>
      I=<sqrt|<around|(|4*n+1|)>*<around|(|4*m+1|)>>*<around|(|-1|)><rsup|n+m>*<big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*n+<frac|1|2>><around|(|y|)>*J<rsub|2*m+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y
    </equation>

    Using the orthogonality relation for Bessel functions with
    <math|\<nu\>=-<frac|1|2>>:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|\<nu\>+2*n+1><around|(|t|)>*J<rsub|\<nu\>+2*m+1><around|(|t|)>|t>*<space|0.17em>d*t=<frac|\<delta\><rsub|n*m>|2*<around|(|2*n+\<nu\>+1|)>>
    </equation>

    for <math|\<nu\>=-<frac|1|2>>, we have:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*n+<frac|1|2>><around|(|t|)>*J<rsub|2*m+<frac|1|2>><around|(|t|)>|t>*<space|0.17em>d*t=<frac|\<delta\><rsub|n*m>|4*n+1>
    </equation>

    Substituting this result back into the integral, we have:

    <\equation>
      I=<sqrt|<around|(|4*n+1|)>*<around|(|4*m+1|)>>*<around|(|-1|)><rsup|n+m><frac|\<delta\><rsub|n*m>|4*n+1>
    </equation>

    For <math|n\<neq\>m>, <math|\<delta\><rsub|n*m>=0>, yielding <math|I=0>.
    For <math|n=m>, <math|\<delta\><rsub|n*m>=1>, giving:

    <\equation>
      I=<frac|<sqrt|<around|(|4*n+1|)><rsup|2>>|4*n+1>=<frac|4*n+1|4*n+1>=1
    </equation>

    Hence, <math|\<psi\><rsub|n><around|(|y|)>> and
    <math|\<psi\><rsub|m><around|(|y|)>> are orthonormal.
  </proof>

  <\theorem>
    The eigenvalues of

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>\<ast\>\<psi\><rsub|n><around|(|x|)>*d*x=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|y|)>
    </equation>

    are given by

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<lambda\><rsub|n>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)><space|0.17em>d*x>>|<row|<cell|>|<cell|=<sqrt|<frac|4n+1|\<pi\>>><frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>>>>>>
    </equation>

    where <math|\<psi\><rsub|n><around|(|x|)>> is the orthonormal set defined
    in Lemma 1.
  </theorem>

  <\proof>
    To show that <math|\<psi\><rsub|n><around|(|y|)>> are eigenfunctions of
    the integral operator with kernel <math|J<rsub|0>*<around|(|x-y|)>> and
    to find the corresponding eigenvalues, we start with the given equation:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|y|)>
    </equation*>

    where

    <\equation*>
      \<psi\><rsub|n><around|(|y|)>=<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
    </equation*>

    and the eigenvalues are:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    To find <math|\<lambda\><rsub|n>>, we compute:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x
    </equation*>

    Substituting <math|\<psi\><rsub|n><around|(|x|)>>:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)><sqrt|<frac|4*n+1|x>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|x|)>*<space|0.17em>d*x
    </equation*>

    Using the integral of products of Bessel functions:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>x<rsup|-<frac|1|2>>*J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>*<space|0.17em>d*x=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    Thus:

    <\equation*>
      \<lambda\><rsub|n>=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    This completes the proof that <math|\<psi\><rsub|n><around|(|y|)>> are
    eigenfunctions of the integral operator with kernel
    <math|J<rsub|0>*<around|(|x-y|)>> and the corresponding eigenvalues are
    as given.
  </proof>

  <\definition>
    Let <math|j<rsub|n><around|(|x|)>> is the spherical Bessel function of
    the first kind,\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|j<rsub|n><around|(|z|)>>|<cell|=<sqrt|<frac|\<pi\>|2*z>>*J<rsub|n+<frac|1|2>><around|(|x|)>>>|<row|<cell|>|<cell|=<frac|sin
      <around|(|z|)>*R<rsub|n,<frac|1|2>><around|(|z|)>-cos
      <around|(|z|)>*R<rsub|n-1,<frac|3|2>><around|(|z|)>|<sqrt|z>>>>>>>
    </equation>

    where <math|R<rsub|n,v><around|(|z|)>> are the so-called Lommel
    polynomials <cite|modifiedLommelPolynomials>

    <\equation>
      R<rsub|n,v><around|(|z|)>=<frac|\<Gamma\>*<around|(|n+v|)>|\<Gamma\><around|(|v|)>><around*|(|<frac|2|z>|)><rsup|n><rsub|>*<rsub|2>F<rsub|3><around*|(|<around*|[|-<frac|n|2>,<frac|1|2>-<frac|n|2>|]>;<around*|[|v,-n,1-v-n|]>;-z<rsup|2>|)>
    </equation>

    where <math|*<rsub|2>F<rsub|3>> is a generalized hypergeometric function
    which are really rational functions which are said to be \Ppolynomial in
    <math|<frac|1|z>>\Q.\ 
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
    symbol(ascending/rising factorial).
  </conjecture>

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

  <subsubsection|Simplifying The Convolution>

  Apply the addition theorem

  <\equation*>
    J<rsub|0>*<around|(|x-y|)>=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*J<rsub|k>*<around|(|y|)>
  </equation*>

  to the integral covariance operator

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|<around|[|T*\<psi\><rsub|n>|]><around|(|x|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)>*J<rsub|k>*<around|(|y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)><big|int><rsub|0><rsup|\<infty\>>*J<rsub|k>*<around|(|y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y<space|1em>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)><big|int><rsub|0><rsup|\<infty\>>*J<rsub|k>*<around|(|y|)>*<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)><space|0.17em>d*y>>>>>
  </equation*>

  Where <math|\<psi\><rsub|n><around|(|y|)>> is:

  <\equation*>
    \<psi\><rsub|n><around|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
  </equation*>

  Substituting\ 

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>J<rsub|k>*<around|(|y|)>*\<psi\><rsub|n><around|(|y|)>*<space|0.17em>d*y>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|k>*<around|(|y|)>*<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)><space|0.17em>d*y>>|<row|<cell|>|<cell|=<frac|<sqrt|4*n+1>*<around|(|-1|)><rsup|n><sqrt|\<pi\>>*\<Gamma\>*<around*|(|<frac|k|2>+n+<frac|1|2>|)>|2*\<Gamma\>*<around*|(|-n+<frac|k|2>+<frac|1|2>|)>*\<Gamma\>*<around*|(|<frac|k|2>+n+1|)>*\<Gamma\>*<around*|(|n+1-<frac|k|2>|)>>>>>>>
  </equation*>

  Now, putting it all back into the expansion for
  <math|<around|[|T*\<psi\><rsub|n>|]><around|(|x|)>>:

  <\equation*>
    <around|[|T*\<psi\><rsub|n>|]><around|(|x|)>=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>J<rsub|k><around|(|x|)><frac|<sqrt|4*n+1>*<around|(|-1|)><rsup|n><sqrt|\<pi\>>*\<Gamma\>*<around*|(|<frac|k|2>+n+<frac|1|2>|)>|2*\<Gamma\>*<around*|(|-n+<frac|k|2>+<frac|1|2>|)>*\<Gamma\>*<around*|(|<frac|k|2>+n+1|)>*\<Gamma\>*<around*|(|n+1-<frac|k|2>|)>>
  </equation*>

  <\conjecture>
    \;

    <\equation>
      <big|sum><rsub|k=0><rsup|\<infty\>>\<psi\><rsub|k><around*|(|x|)><rsup|2>=<frac|1|\<pi\>>
    </equation>
  </conjecture>

  <section|Appendix>

  <subsection|A Theorem On The Development of Symmetric Nuclei>

  <\theorem>
    <cite-detail|whittakerAndWatsonCourseOfModernAnalysis|11.70> Let
    <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> be a complete set of
    orthogonal functions satisfying the homogeneous integral equation with
    symmetric nucleus

    <\equation>
      \<phi\><around|(|\<alpha\>|)>=\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<phi\><around|(|\<xi\>|)>*d*\<xi\>
    </equation>

    the corresponding characteristic numbers being
    <math|\<lambda\><rsub|1>,\<lambda\><rsub|2>,\<lambda\><rsub|3>,\<ldots\>>Now
    suppose that the series <math|<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>>
    is uniformly convergent when <math|0\<leqslant\>a\<leq\>\<alpha\>\<leq\>b\<leqslant\>\<infty\>>,<math|0\<leqslant\>a\<leq\>\<gamma\>\<leq\>b\<leqslant\>\<infty\>>.
    Then it will be shown that

    <\equation>
      K<around|(|\<alpha\>,\<gamma\>|)>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
    </equation>
  </theorem>

  <\proof>
    For consider the symmetric nucleus

    <\equation>
      H<around|(|\<alpha\>,\<gamma\>|)>=K<around|(|\<alpha\>,\<gamma\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
    </equation>

    If this nucleus is not identically zero, it will possess at least one
    characteristic number <math|\<mu\>>. Let
    <math|\<psi\><around|(|\<gamma\>|)>> be any solution of the equation

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b>H<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)>*d*\<xi\>
    </equation>

    which does not vanish identically. Multiply by
    <math|\<phi\><rsub|m><around|(|\<alpha\>|)>> and integrate term-by-term
    (which we may do since the series converges uniformly by hypothesis
    proved by other means), and get

    <\equation>
      <big|int><rsub|a><rsup|b>\<psi\><around|(|\<alpha\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)>*d*\<alpha\>=\<mu\>*<big|int><rsub|a><rsup|b><big|int><rsub|a><rsup|b><around*|[|K<around|(|\<alpha\>,\<xi\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<xi\>|)>|\<lambda\><rsub|n>>|]>*\<psi\><around|(|\<xi\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)>*d*\<xi\>*d*\<alpha\>=0
    </equation>

    Therefore <math|\<psi\><around|(|\<alpha\>|)>> is orthogonal to
    <math|\<phi\><rsub|1><around|(|\<alpha\>|)>,\<phi\><rsub|2><around|(|\<alpha\>|)>,\<ldots\>>;
    and so taking the equation

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b><around*|[|K<around|(|\<alpha\>,\<xi\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<xi\>|)>|\<lambda\><rsub|n>>|]>*\<psi\><around|(|\<xi\>|)>*d*\<xi\>
    </equation>

    we have

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)>*d*\<xi\>
    </equation>

    Therefore <math|\<mu\>> is a characteristic number of
    <math|K<around|(|\<alpha\>,\<gamma\>|)>>, and so
    <math|\<psi\><around|(|\<alpha\>|)>> must be a linear combination of the
    functions <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> corresponding to
    this number; let

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=<big|sum><rsub|m>a<rsub|m>*\<phi\><rsub|m><around|(|\<alpha\>|)>
    </equation>

    Multiply by <math|\<phi\><rsub|m><around|(|\<gamma\>|)>> and integrate;
    then since <math|\<psi\><around|(|\<alpha\>|)>> is orthogonal to all the
    functions <math|\<phi\><rsub|m><around|(|\<alpha\>|)>>, we see that
    <math|a<rsub|m>=0>, so, contrary to hypothesis,
    <math|\<psi\><around|(|\<alpha\>|)>=0>. The contradiction implies that
    the nucleus <math|H<around|(|\<alpha\>,\<gamma\>|)>> must be identically
    zero; that is to say, <math|K<around|(|\<alpha\>,\<gamma\>|)>> can be
    expanded in the given series, if it is uniformly convergent.
  </proof>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|4>
      <bibitem*|1><label|bib-finiteFourierTransforms>Atul Dixit, Lin Jiu,
      Victor<nbsp>H Moll<localize|, and >Christophe Vignat. <newblock>The
      finite fourier transform of classical polynomials.
      <newblock><with|font-shape|italic|Journal of the Australian
      Mathematical Society>, 98:145\U160, 2015.<newblock>

      <bibitem*|2><label|bib-whittakerAndWatsonCourseOfModernAnalysis>George<nbsp>Neville<nbsp>Watson
      Edmund Taylor Whittaker. <newblock><with|font-shape|italic|A course of
      modern analysis: an introduction to the general theory of infinite
      processes and of analytic functions; with an account of the principal
      transcendental functions>. <newblock>University Press, 1920.<newblock>

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

  \;

  \;

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
    <associate|T|<tuple|14|4>>
    <associate|auto-1|<tuple|1|7>>
    <associate|auto-2|<tuple|1|8>>
    <associate|auto-3|<tuple|1.1|8>>
    <associate|auto-4|<tuple|36|9>>
    <associate|bib-finiteFourierTransforms|<tuple|1|9>>
    <associate|bib-gaussianProcessIntroduction|<tuple|4|9>>
    <associate|bib-modifiedLommelPolynomials|<tuple|3|9>>
    <associate|bib-whittakerAndWatsonCourseOfModernAnalysis|<tuple|2|9>>
    <associate|ortho|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      modifiedLommelPolynomials

      finiteFourierTransforms

      gaussianProcessIntroduction

      whittakerAndWatsonCourseOfModernAnalysis
    </associate>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>Simplifying The Convolution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>A Theorem On The Development
      of Symmetric Nuclei <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>