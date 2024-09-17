<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Eigenfunctions of
  <math|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|<around|\||x-y|\|>|)>*f<around|(|x|)><math-up|d>x>
  and a Technique For Deriving The Eigenfunctions of Stationary Gaussian
  Process Integral Covariance Operators>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-affiliation|<with|font-family|tt|stephencrowley214@gmail.com>>>>|<doc-date|September
  16, 2024>>

  <abstract-data|<\abstract>
    The null spaces of Gaussian process kernel inner product operators are
    shown to be the Fourier transforms of the polynomials orthogonal with
    respect to the spectral densities of the processes and it is furthermore
    shown that the orthogonal complements of the null spaces as given by the
    Gram-Schmidt recursions enumerate the products
    <math|g<rsub|k><around|(|t|)>=<sqrt|<frac|c<rsub|p>|c<rsub|q>>>*<frac|<big|prod><rsub|i=1><rsup|n<rsub|k>><around|(|t-\<alpha\><rsub|k,i>|)>|<big|prod><rsub|j=1><rsup|m<rsub|k>><around|(|t-\<beta\><rsub|k,j>|)>>=f<rsub|k><around|(|t|)>*f<rsub|k><around|(|s|)>>
    of the eigenfunctions <math|f<rsub|k>> of the corresponding integral
    covariance operators.
  </abstract>>

  Let <math|C<around|(|x|)>> be the covariance function of a stationary
  Gaussian process on <math|<around|[|0,\<infty\>|)>>. Define the integral
  covariance operator <math|T> by:

  <\equation>
    <around|(|T*f|)><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>C*<around|(|x-y|)>*f<around|(|y|)><space|0.17em><math-up|d>y
  </equation>

  Let <math|S<around|(|\<omega\>|)>> be the spectral density related to
  <math|C<around|(|x|)>> by the Wiener-Khinchin theorem:

  <\equation>
    C<around|(|x|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)><space|0.17em><math-up|d>\<omega\>
  </equation>

  <\equation>
    S<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*e<rsup|-i*x*\<omega\>><space|0.17em><math-up|d>x
  </equation>

  Consider polynomials <math|<around|{|p<rsub|n><around|(|\<omega\>|)>|}>>
  orthogonal with respect to <math|S<around|(|\<omega\>|)>>:

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*p<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)><space|0.17em><math-up|d>\<omega\>=\<delta\><rsub|n*m>
  </equation>

  Define <math|r<rsub|n><around|(|x|)>> as the inverse Fourier transforms of
  <math|p<rsub|n><around|(|\<omega\>|)>>:

  <\equation>
    r<rsub|n><around|(|x|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*x><space|0.17em><math-up|d>\<omega\>
  </equation>

  <\lemma>
    The functions <math|r<rsub|n><around|(|x|)>> form the null space of the
    kernel inner product:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)><space|0.17em><math-up|d>x=0
    </equation>
  </lemma>

  <\proof>
    Let <math|C<around|(|x|)>> and <math|r<rsub|n><around|(|x|)>> be defined
    as:

    <\equation>
      C<around|(|x|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*a*x>*S<around|(|a|)><space|0.17em><math-up|d>a
    </equation>

    <\equation>
      r<rsub|n><around|(|x|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|b|)>*e<rsup|i*b*x><space|0.17em><math-up|d>b
    </equation>

    where <math|S<around|(|a|)>> is the spectral density and
    <math|p<rsub|n><around|(|b|)>> are orthogonal polynomials with respect to
    <math|S<around|(|a|)>>. Note that <math|C<around|(|x|)>> and
    <math|r<rsub|n><around|(|x|)>> are even functions, as they depend on the
    difference between two variables.

    Substitute the definitions of <math|C<around|(|x|)>> and
    <math|r<rsub|n><around|(|x|)>>, and apply Fubini's theorem:

    <\align*>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)><space|0.17em><math-up|d>x>|<cell|=<big|int><rsub|0><rsup|\<infty\>><frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*a*x>*S<around|(|a|)><space|0.17em><math-up|d>a*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|b|)>*e<rsup|i*b*x><space|0.17em><math-up|d>b<space|0.17em><math-up|d>x>>|<row|<cell|>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|b|)>*S<around|(|a|)>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|i*<around|(|a+b|)>*x><space|0.17em><math-up|d>x<space|0.17em><math-up|d>b<space|0.17em><math-up|d>a>>>>
    </align*>

    Since <math|C<around|(|x|)>> and <math|r<rsub|n><around|(|x|)>> are even
    functions, we can write:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)><space|0.17em><math-up|d>x=<frac|1|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)><space|0.17em><math-up|d>x
    </equation>

    Now we have:

    <\align*>
      <tformat|<table|<row|<cell|<frac|1|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)><space|0.17em><math-up|d>x>|<cell|=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|b|)>*S<around|(|a|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|a+b|)>*x><space|0.17em><math-up|d>x<space|0.17em><math-up|d>b<space|0.17em><math-up|d>a>>|<row|<cell|>|<cell|=<frac|1|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n><around|(|b|)>*S<around|(|a|)>*\<delta\>*<around|(|a+b|)><space|0.17em><math-up|d>b<space|0.17em><math-up|d>a>>|<row|<cell|>|<cell|=<frac|1|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n>*<around|(|-a|)>*S<around|(|a|)><space|0.17em><math-up|d>a>>>>
    </align*>

    By the orthogonality of <math|p<rsub|n><around|(|a|)>> with respect to
    <math|S<around|(|a|)>>, we conclude:

    <\equation>
      <frac|1|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>p<rsub|n>*<around|(|-a|)>*S<around|(|a|)><space|0.17em><math-up|d>a=0
    </equation>

    Thus, <math|<big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*r<rsub|n><around|(|x|)><space|0.17em><math-up|d>x=0>,
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
    >k*n>>|<row|<cell|0>|<cell|<text|if >k\<gtr\>n>>>>>|\<nobracket\>>
  </equation>

  <\theorem>
    Let <math|<around|{|\<psi\><rsub|n><around|(|x|)>|}>> be the orthogonal
    complement of <math|<around|{|r<rsub|n><around|(|x|)>|}>>. Then
    <math|\<psi\><rsub|n><around|(|x|)>> are eigenfunctions of <math|T>, with
    eigenvalues:

    <\equation>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*\<psi\><rsub|n><around|(|z|)><space|0.17em><math-up|d>z
    </equation>
  </theorem>

  <\proof>
    This is not quite right, they have to be factorized as in Theorem
    <reference|factorize>. I think the infinite-dimensional version of this
    is the Hadamard product factorization?
  </proof>

  <\definition>
    The spectral density of a stationary process is the Fourier transform of
    the covariance kernel due to Wiener-Khinchin theorem.
  </definition>

  <\definition>
    Let <math|S<rsub|n><around|(|x|)>> be the orthogonal polynomials whose
    orthogonality measure is equal to the spectral density of the process.
    These polynomials shall be called the spectral polynomials corresponding
    to the process.
  </definition>

  <\remark>
    If the spectral density does not equal the orthogonality measure of a
    known set of orthogonal polynomials then such a set can always be
    generated by applying the Gram-Schmidt process to the monomials so that
    they are transformed into a set that is orthogonal with respect any given
    spectral density (of a stationary process).
  </remark>

  <subsection|The Karhunen-Loeve Expansion>

  The Karhunen-Loeve expansion is a spectral representation theorem which
  expands the random process <math|w<around|(|x,\<theta\>|)>> in terms of a
  denumerable set of orthogonal random variables in the form

  <\equation>
    w<around|(|x,\<theta\>|)>=<big|sum><rsub|i=1><rsup|\<infty\>>\<mu\><rsub|i><around|(|\<theta\>|)>*g<rsub|i><around|(|x|)><label|process>
  </equation>

  where <math|<around|{|\<mu\><rsub|i><around|(|\<theta\>|)>|}>> is a set of
  random variable projections and <math|<around|{|g<rsub|i><around|(|x|)>|}>>
  are the functions of the integral covariance operator associated to the
  Gaussian process having the covariance kernel of
  <math|w<around|(|x,\<theta\>|)>>. Since equation (<reference|process>) is a
  quantization of the random process it is a representation of the process
  <math|w<around|(|x,\<theta\>|)>> as a curve in the Hilbert space spanned by
  the set <math|<around|{|g<rsub|i><around|(|x|)>|}>> expressed as a direct
  sum of orthogonal projections in this Hilbert space whose projections on
  successive basis vectors have magnitudes which are proportional to the
  corresponding eigenvalues of the covariance function associated with the
  eigenfunctions of the process <math|w<around|(|x,\<theta\>|)>>.

  <subsubsection|Derivation>

  <\theorem>
    The random process <math|w<around|(|x,\<theta\>|)>> can be represented by
    the Karhunen-Loeve expansion defined by the Fourier-like series as

    <\equation>
      w<around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*\<xi\><rsub|n><around|(|\<theta\>|)>*f<rsub|n><around|(|x|)>
    </equation>

    where <math|<around|{|\<xi\><rsub|n><around|(|\<theta\>|)>|}>> is a said
    to be a set of 'random' variables to be determined by projecting the
    process <math|w<around|(|x,\<theta\>|)>> onto the <math|n-<math-up|th>>
    eigenfunction and <math|\<lambda\><rsub|n>> is the <math|n>-th eigenvalue
    corresponding to the n-th eigenfunction of the corresponding integral
    covariance operator <math|<around|{|f<rsub|n><around|(|x|)>|}>>
  </theorem>

  <\proof>
    Let <math|w<around|(|x,\<theta\>|)>> be a random process, function of the
    position vector <math|x> defined over the domain <math|D>, with
    <math|\<theta\>> belonging to the space of random events
    <math|\<Omega\>>. Let <math|<wide|w|\<bar\>><around|(|x|)>> denote the
    expected value of <math|w<around|(|x,\<theta\>|)>> over all possible
    realizations of the process, and <math|C<around|(|x<rsub|1>,x<rsub|2>|)>>
    denote its covariance function. By definition of the covariance function,
    it is bounded, symmetric and positive definite. Thus, it has the
    eigenfunction expansion

    <\equation>
      C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|n><around|(|x<rsub|2>|)><label|2.7>
    </equation>

    where <math|\<lambda\><rsub|n>> and <math|f<rsub|n><around|(|x|)>> are
    the eigenvalue and the eigenfunction of the covariance kernel. And,
    specifically, that they are the solution to the integral equation

    <\equation>
      <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|n><around|(|x<rsub|1>|)><space|0.17em><math-up|d>x<rsub|1>=\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|2>|)><label|2.8>
    </equation>

    Due to the symmetry and the positive definiteness of the covariance
    kernel, its eigenfunctions are orthogonal and form a complete set. They
    can be normalized according to the following criterion

    <\equation>
      <big|int><rsub|D>f<rsub|n><around|(|x|)>*f<rsub|m><around|(|x|)><space|0.17em><math-up|d>x=\<delta\><rsub|n*m><label|2.9>
    </equation>

    where <math|\<delta\><rsub|n*m>> is the Kronecker delta. Clearly,
    <math|w<around|(|x,\<theta\>|)>> can be written as

    <\equation>
      w<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+\<alpha\><around|(|x,\<theta\>|)><label|2.10>
    </equation>

    where <math|\<alpha\><around|(|x,\<theta\>|)>> is a process with zero
    mean and covariance function <math|C<around|(|x<rsub|1>,x<rsub|2>|)>>.
    The process <math|\<alpha\><around|(|x,\<theta\>|)>> can be expanded in
    terms of the eigenfunctions <math|f<rsub|n><around|(|x|)>> as

    <\equation>
      \<alpha\><around|(|x,\<theta\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)><label|2.11>
    </equation>

    Second order properties of the random variables <math|\<xi\><rsub|n>> can
    be determined by multiplying both sides of equation (<reference|2.11>) by
    <math|\<alpha\><around|(|x<rsub|2>,\<theta\>|)>> and taking the
    expectation on both sides. Specifically, it is found that

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|C<around|(|x<rsub|1>,x<rsub|2>|)>>|<cell|=<around|\<langle\>|\<alpha\><around|(|x<rsub|1>,\<theta\>|)>*\<alpha\><around|(|x<rsub|2>,\<theta\>|)>|\<rangle\>>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><big|sum><rsub|m=0><rsup|\<infty\>><around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|m>>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|m><around|(|x<rsub|2>|)>>>>>><label|2.12>
    </equation>

    Then, multiplying both sides of equation (<reference|2.12>) by
    <math|f<rsub|k><around|(|x<rsub|2>|)>>, integrating over the
    domain<math|D>, and making use of the orthogonality of the
    eigenfunctions, yields

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|k><around|(|x<rsub|2>|)><space|0.17em><math-up|d>x<rsub|2>>|<cell|=\<lambda\><rsub|k>*f<rsub|k><around|(|x<rsub|1>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|k><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|k>>*f<rsub|n><around|(|x<rsub|1>|)>>>>>>
    </equation>

    Multiplying once more by <math|f<rsub|l><around|(|x<rsub|1>|)>> and
    integrating over <math|D> gives

    <\equation>
      <big|int><rsub|D><big|int><rsub|D>f<rsub|l><around|(|x<rsub|1>|)>*f<rsub|k><around|(|x<rsub|1>|)><space|0.17em><math-up|d>x<rsub|1>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|k><around|(|\<theta\>|)>|\<rangle\>><sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|k>>*\<delta\><rsub|n*l>
    </equation>

    Then, using equation (<reference|2.9>) leads to

    <\equation>
      \<lambda\><rsub|k>*\<delta\><rsub|k*l>=<sqrt|\<lambda\><rsub|k>*\<lambda\><rsub|l>>*<around|\<langle\>|\<xi\><rsub|k><around|(|\<theta\>|)>*\<xi\><rsub|l><around|(|\<theta\>|)>|\<rangle\>><label|2.15>
    </equation>

    Equation (<reference|2.15>) can be rearranged to give

    <\equation>
      <around|\<langle\>|\<xi\><rsub|k><around|(|\<theta\>|)>*\<xi\><rsub|l><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|k*l>
    </equation>

    Thus, the random process <math|w<around|(|x,\<theta\>|)>> can be written
    as

    <\equation>
      w<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+<big|sum><rsub|n=0><rsup|\<infty\>>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)><label|2.17>
    </equation>

    where

    <\equation>
      <around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>|\<rangle\>>=0
    </equation>

    <\equation>
      <around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|n*m><label|2.19>
    </equation>

    and <math|\<lambda\><rsub|n>,f<rsub|n><around|(|x|)>> are solution to
    equation (<reference|2.8>). Truncating the series in equation
    (<reference|2.17>) at the <math|M<rsup|t*h>> term, gives

    <\equation>
      w<around|(|x,\<theta\>|)>=<wide|w|\<bar\>><around|(|x|)>+<big|sum><rsub|n=0><rsup|M>\<xi\><rsub|n><around|(|\<theta\>|)><sqrt|\<lambda\><rsub|n>>*f<rsub|n><around|(|x|)><label|2.20>
    </equation>

    An explicit expression for <math|\<xi\><rsub|n><around|(|\<theta\>|)>>
    can be obtained by multiplying equation (<reference|2.11>) by
    <math|f<rsub|n><around|(|x|)>> and integrating over the domain <math|D>.
    That is,

    <\equation>
      \<xi\><rsub|n><around|(|\<theta\>|)>=<frac|<big|int><rsub|D>\<alpha\><around|(|x,\<theta\>|)>*f<rsub|n><around|(|x|)><space|0.17em><math-up|d>x|<sqrt|\<lambda\><rsub|n>>><label|2.21>
    </equation>
  </proof>

  <subsubsection|Uniqueness of the Expansion>

  <\lemma>
    <with|font-series|bold|Uniqueness>: The random variables appearing in an
    expansion of the kind given by equation (<reference|2.10>) are
    orthonormal if and only if the orthonormal functions
    <math|<around|{|f<rsub|n><around|(|x|)>|}>> and the constants
    <math|<around|{|\<lambda\><rsub|n>|}>> are respectively the
    eigenfunctions and the eigenvalues of the covariance kernel as given by
    equation (<reference|2.8>).
  </lemma>

  <\proof>
    The "if" part is an immediate consequence of equation (<reference|2.11>).
    To show the "only if" part, equation (<reference|2.12>) can be used with

    <\equation>
      <around|\<langle\>|\<xi\><rsub|n><around|(|\<theta\>|)>*\<xi\><rsub|m><around|(|\<theta\>|)>|\<rangle\>>=\<delta\><rsub|n*m>
    </equation>

    to obtain

    <\equation>
      C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|n><around|(|x<rsub|2>|)>
    </equation>

    Multiplying both sides by <math|f<rsub|m><around|(|x<rsub|2>|)>> and
    integrating over <math|D> gives

    <\equation>
      <big|int><rsub|D>C<around|(|x<rsub|1>,x<rsub|2>|)>*f<rsub|m><around|(|x<rsub|2>|)><space|0.17em><math-up|d>x<rsub|2>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*\<delta\><rsub|n*m>=\<lambda\><rsub|m>*f<rsub|m><around|(|x<rsub|1>|)>
    </equation>
  </proof>

  <\theorem>
    Let <math|Y<rsub|n><around|(|y|)>> be the normalized Fourier transforms
    of the spectral polynomials <math|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Y<rsub|n><around|(|y|)>>|<cell|=<frac|<wide|S|^><rsub|n><around|(|y|)>|<around|\||<wide|S|^><rsub|n>|\|>>>>>>>>where
    the sequence <math|<wide|S|^><rsub|n><around|(|y|)>> of inverse Fourier
    transforms of the spectral polynomials <math|S<rsub|n><around|(|x|)>> is
    given by

    <\equation>
      <wide|S|^><rsub|n><around|(|y|)>=<big|int><rsub|-1><rsup|1>S<rsub|n><around|(|x|)>*e<rsup|i*x*y><space|0.17em><math-up|d>x
    </equation>

    The eigenfunctions of the integral covariance operator (<reference|T>)
    are given by the products

    <\equation>
      \<psi\><rsub|n><around|(|x|)>*\<psi\><rsub|n><around|(|y|)>=Y<rsup|\<perp\>><rsub|n>*<around|(|x-y|)>
    </equation>

    of the elements of orthogonal complement of the normalized Fourier
    transforms <math|Y<rsub|n><around|(|y|)>> of the spectral polynomials
    (via the Gram-Schmidt process)

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<psi\><rsub|n><around|(|x|)>*\<psi\><rsub|n><around|(|y|)>>|<cell|=Y<rsup|\<perp\>><rsub|n>*<around|(|x-y|)>>>|<row|<cell|>|<cell|=Y<rsub|n>*<around|(|x-y|)>-<big|sum><rsub|m=0><rsup|n-1><frac|<around|\<langle\>|Y<rsub|m>*<around|(|x-y|)>,Y<rsup|\<perp\>><rsub|m>*<around|(|x-y|)>|\<rangle\>>|<around|\<langle\>|Y<rsup|\<perp\>><rsub|m>*<around|(|x-y|)>,Y<rsup|\<perp\>><rsub|m>*<around|(|x-y|)>|\<rangle\>>>*Y<rsup|\<perp\>><rsub|m>*<around|(|x-y|)>>>>>>
    </equation>
  </theorem>

  <\proof>
    ...there's some elegant way to do this that I can probably write down
    after my back surgery.. it involves Lemma <reference|factorize>
  </proof>

  <\lemma>
    <label|factorize>For any rational function

    <\equation>
      f*<around|(|t-s|)>=<frac|P*<around|(|t-s|)>|Q*<around|(|t-s|)>>
    </equation>

    , where <math|P> and <math|Q> are polynomials, there exist rational
    functions <math|g<around|(|t|)>> and <math|g<around|(|s|)>> such that

    <\equation>
      f*<around|(|t-s|)>=g<around|(|t|)>*g<around|(|s|)>
    </equation>
  </lemma>

  <\proof>
    Let

    <\equation>
      P*<around|(|t-s|)>=c<rsub|p>*<big|prod><rsub|i=1><rsup|n><around|(|t-s-\<alpha\><rsub|i>|)>
    </equation>

    and

    <\equation>
      Q*<around|(|t-s|)>=c<rsub|q>*<big|prod><rsub|j=1><rsup|m><around|(|t-s-\<beta\><rsub|j>|)>
    </equation>

    then define

    <\equation>
      g<around|(|t|)>=<sqrt|<frac|c<rsub|p>|c<rsub|q>>>*<frac|<big|prod><rsub|i=1><rsup|n><around|(|t-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|t-\<beta\><rsub|j>|)>>
    </equation>

    such that

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|g<around|(|t|)>*g<around|(|s|)>>|<cell|=<frac|c<rsub|p>|c<rsub|q>>*<frac|<big|prod><rsub|i=1><rsup|n><around|(|t-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|t-\<beta\><rsub|j>|)>>*<frac|<big|prod><rsub|i=1><rsup|n><around|(|s-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|s-\<beta\><rsub|j>|)>>>>|<row|<cell|>|<cell|=<frac|c<rsub|p>|c<rsub|q>>*<frac|<big|prod><rsub|i=1><rsup|n><around|(|t-\<alpha\><rsub|i>|)>*<around|(|s-\<alpha\><rsub|i>|)>|<big|prod><rsub|j=1><rsup|m><around|(|t-\<beta\><rsub|j>|)>*<around|(|s-\<beta\><rsub|j>|)>>>>|<row|<cell|>|<cell|=<frac|c<rsub|p>*<big|prod><rsub|i=1><rsup|n><around|(|<around|(|t-s|)>-\<alpha\><rsub|i>|)>|c<rsub|q>*<big|prod><rsub|j=1><rsup|m><around|(|<around|(|t-s|)>-\<beta\><rsub|j>|)>>>>|<row|<cell|>|<cell|=f*<around|(|t-s|)>>>>>>
    </equation>

    For complex roots, we pair each <math|\<alpha\><rsub|i>> or
    <math|\<beta\><rsub|j>> with its complex conjugate in the factorization
    of <math|g<around|(|t|)>>. This ensures that the product
    <math|<around|(|t-\<alpha\><rsub|i>|)>*<around|(|t-<wide|\<alpha\><rsub|i>|\<bar\>>|)>>
    results in a quadratic polynomial with real coefficients, making
    <math|g<around|(|t|)>> a real-valued function.
  </proof>

  <\example>
    Let the kernel function be given by <math|K<around|(|t,s|)>=J<rsub|0>*<around|(|t-s|)>>
    then identify the orthogonal polynomial sequence associated with the
    spectral density

    <\equation>
      S<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*e<rsup|i*x*\<omega\>><space|0.17em><math-up|d>x=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|1|<sqrt|1-\<omega\><rsup|2>>>>|<cell|\<omega\>\<in\><around|(|-1,1|)>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
    </equation>

    as being the orthogonality measure of the Type-I Chebyshev polynomials
    <math|T<rsub|n><around|(|x|)>> so that the orthogonal polynomial sequence
    is identified as

    <\equation>
      S<rsub|n><around|(|x|)>=T<rsub|n><around|(|x|)>
    </equation>

    so that

    <\equation>
      <big|int><rsub|-1><rsup|1>S<rsub|n><around|(|\<omega\>|)>*S<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)><space|0.17em><math-up|d>\<omega\>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|0>|<cell|n\<neq\>m>>|<row|<cell|2*\<pi\>>|<cell|n=m=0>>|<row|<cell|\<pi\>>|<cell|n=m\<neq\>0>>>>>|\<nobracket\>>
    </equation>

    The finite Fourier transforms of the Chebyshev polynomials are just the
    usual infinite Fourier transforms with the integration restricted to the
    range <math|-1*\<ldots\>*1> since <math|T<rsub|n><around|(|x|)>=0\<forall\>x\<nin\><around|[|-1,1|]>>).
    Equivalently, the spectral density function can be extended to take the
    value 0 outside the interval <math|<around|[|-1,1|]>>.

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<wide|T|^><rsub|n><around|(|y|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x*y>*T<rsub|n><around|(|x|)><space|0.17em><math-up|d>y=<big|int><rsub|-1><rsup|1>e<rsup|-i*x*y>*T<rsub|n><around|(|x|)><space|0.17em><math-up|d>x>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x*y><rsub|2>*F<rsub|1>*<around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|<frac|1|2>>>>>>\|<frac|1|2>-<frac|x|2>|)><space|0.17em><math-up|d>x>>|<row|<cell|>|<cell|=<frac|i|y>*<around|(|e<rsup|-i*y>*F<rsup|+><rsub|n><around|(|y|)>-e<rsup|i*<around|(|\<pi\>*n+y|)>>*F<rsub|n><rsup|-><around|(|y|)>|)>>>>>>
    </equation>

    where

    <\equation>
      F<rsub|n><rsup|\<pm\>><around|(|y|)>=<rsub|3>F<rsub|1><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|0ln>|<table|<row|<cell|1,>|<cell|n,>|<cell|-n>>|<row|<cell|>|<cell|>|<cell|<frac|1|2>>>>>>\|<frac|\<pm\>i*y|2>|)>
    </equation>

    the spectral polynomials <math|S<rsub|n>> are given by the Type-I
    Chebyshev polynomials

    <\equation>
      S<rsub|n><around|(|x|)>=T<rsub|n><around|(|x|)>
    </equation>

    and their normalization is

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Y<rsub|n><around|(|y|)>>|<cell|=<frac|<wide|T|^><rsub|n><around|(|y|)>|<around|\||<wide|T|^><rsub|n>|\|>>>>|<row|<cell|>|<cell|=<frac|i|y><around*|(|<frac|e<rsup|-i*y>*F<rsup|+><rsub|n><around|(|y|)>-e<rsup|i*<around|(|\<pi\>*n+y|)>>*F<rsub|n><rsup|-><around|(|y|)>|<sqrt|<frac|4*<around|(|-1|)><rsup|n>*\<pi\>-<around|(|2*n<rsup|2>-1|)>|4*n<rsup|2>-1>>>|)>>>>>>
    </equation>

    where the <math|L<rsup|2>> norm of <math|<wide|T|^><rsub|n><around|(|y|)>>
    is given by

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|\||<wide|T|^><rsub|n>|\|>>|<cell|=<sqrt|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|T|^><rsub|n><around|(|y|)><rsup|2><space|0.17em><math-up|d>y>>>|<row|<cell|>|<cell|=<sqrt|<frac|4*<around|(|-1|)><rsup|n>*\<pi\>-<around|(|2*n<rsup|2>-1|)>|4*n<rsup|2>-1>>>>>>>
    </equation>
  </example>

  <\definition>
    Let <math|j<rsub|n><around|(|x|)>> is the spherical Bessel function of
    the first kind,

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|j<rsub|n><around|(|z|)>>|<cell|=<sqrt|<frac|\<pi\>|2*z>>*J<rsub|n+<frac|1|2>><around|(|x|)>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|z>>*<around*|(|sin
      <around|(|z|)>*R<rsub|n,<frac|1|2>><around|(|z|)>-cos
      <around|(|z|)>*R<rsub|n-1,<frac|3|2>><around|(|z|)>|)>>>>>>
    </equation>

    where <math|R<rsub|n,v><around|(|z|)>> are the (misnamed) Lommel
    polynomials

    <\equation>
      R<rsub|n,v><around|(|z|)>=<frac|\<Gamma\>*<around|(|n+v|)>|\<Gamma\><around|(|v|)>><around*|(|<frac|2|z>|)><rsup|n><rsub|2>*F<rsub|3><around*|(|<around*|[|-<frac|n|2>,<frac|1|2>-<frac|n|2>|]>;<around|[|v,-n,1-v-n|]>;-z<rsup|2>|)>
    </equation>

    where <math|<rsub|2>F<rsub|3>> is a generalized hypergeometric function.
    The \PLommel polynomials\Q are actually rational functions of z, not
    polynomial; but rather \Ppolynomial in <math|<frac|1|z>>\Q.
  </definition>

  <\theorem>
    The eigenfunctions of the stationary integral covariance operator

    <\equation>
      <around|[|T*\<psi\><rsub|n>|]><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around|(|x|)><space|0.17em><math-up|d>x=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|x|)><label|T>
    </equation>

    are given by

    <\equation>
      Y<rsup|\<perp\>><rsub|n>*<around|(|x-y|)>=\<psi\><rsub|n><around|(|x|)>*\<psi\><rsub|n><around|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|8*n+2|\<pi\>>>*j<rsub|2*n>*<around|(|x-y|)>
    </equation>

    and the eigenvalues are given by

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<lambda\><rsub|n>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)><space|0.17em><math-up|d>x>>|<row|<cell|>|<cell|=<sqrt|<frac|2*n+<frac|1|2>|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>>>|<row|<cell|>|<cell|=<sqrt|<frac|2*n+<frac|1|2>|\<pi\>>>*<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>>>>>>
    </equation>

    where <math|<around|(|n+1|)><rsub|-<frac|1|2>>> is the Pochhammer symbol
    (ascending/rising factorial).
  </theorem>

  <\proof>
    TODO: show that <math|Y<rsup|\<perp\>><rsub|n><around|(|<around|\||x-y|\|>|)>=\<psi\><rsub|n><around|(|x|)>*\<psi\><rsub|n><around|(|y|)>>
    converges uniformly by demonstrating that it is compact relative to the
    canonical metric induced by the process then apply Hilbert's proof of a
    theorem that was initiated by Schmidt as written in Whittaker and
    Watson's "A Course of Modern Analysis". Note that just because Hilbert
    and Schmidt are involved this does not mean this is the Hilbert-Schmidt
    class of operators; specifically, nothing in this proof depends on the
    boundedness of the domain or the square integrability of the kernel; both
    of which are significant limitations of the classical Mercer theorem. To
    see that unLet <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> be a complete
    set of orthogonal functions satisfying the homogeneous integral equation
    with symmetric nucleus

    <\equation>
      \<phi\><around|(|\<alpha\>|)>=\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<phi\><around|(|\<xi\>|)><space|0.17em><math-up|d>\<xi\>
    </equation>

    the corresponding characteristic numbers being
    <math|\<lambda\><rsub|1>,\<lambda\><rsub|2>,\<lambda\><rsub|3>,\<ldots\>>
    Now suppose that the series <math|<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>>
    is uniformly convergent when <math|0\<leqslant\>a\<leq\>\<alpha\>\<leq\>b\<leqslant\>\<infty\>>,
    <math|0\<leqslant\>a\<leq\>\<gamma\>\<leq\>b\<leqslant\>\<infty\>>. Then
    it will be shown that

    <\equation>
      K<around|(|\<alpha\>,\<gamma\>|)>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
    </equation>

    For consider the symmetric nucleus

    <\equation>
      H<around|(|\<alpha\>,\<gamma\>|)>=K<around|(|\<alpha\>,\<gamma\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
    </equation>

    If this nucleus is not identically zero, it will possess at least one
    characteristic number <math|\<mu\>>. Let
    <math|\<psi\><around|(|\<gamma\>|)>> be any solution of the equation

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b>H<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)><space|0.17em><math-up|d>\<xi\>
    </equation>

    which does not vanish identically. Multiply by
    <math|\<phi\><rsub|m><around|(|\<alpha\>|)>> and integrate term-by-term
    (which we may do since the series converges uniformly by hypothesis
    proved by other means), and get

    <\equation>
      <big|int><rsub|a><rsup|b>\<psi\><around|(|\<alpha\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)><space|0.17em><math-up|d>\<alpha\>=\<mu\>*<big|int><rsub|a><rsup|b><big|int><rsub|a><rsup|b><around*|[|K<around|(|\<alpha\>,\<xi\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<xi\>|)>|\<lambda\><rsub|n>>|]>*\<psi\><around|(|\<xi\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)><space|0.17em><math-up|d>\<xi\><space|0.17em><math-up|d>\<alpha\>=0
    </equation>

    Therefore <math|\<psi\><around|(|\<alpha\>|)>> is orthogonal to
    <math|\<phi\><rsub|1><around|(|\<alpha\>|)>,\<phi\><rsub|2><around|(|\<alpha\>|)>,\<ldots\>>;
    and so taking the equation

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b><around*|[|K<around|(|\<alpha\>,\<xi\>|)>-<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<xi\>|)>|\<lambda\><rsub|n>>|]>*\<psi\><around|(|\<xi\>|)><space|0.17em><math-up|d>\<xi\>
    </equation>

    we have

    <\equation>
      \<psi\><around|(|\<alpha\>|)>=\<mu\>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)><space|0.17em><math-up|d>\<xi\>
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

    <section|Explanation>

    <with|font-series|bold|Given:>

    <\itemize>
      <item>An orthogonal set of functions
      <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> defined over an interval
      <math|<around|[|a,b|]>>.

      <item>A symmetric kernel <math|K<around|(|\<alpha\>,\<gamma\>|)>>
      defined over <math|<around|[|a,b|]>\<times\><around|[|a,b|]>>.

      <item>The series <math|<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>>
      uniformly converges to <math|K<around|(|\<alpha\>,\<gamma\>|)>>.
    </itemize>

    <with|font-series|bold|To Prove:>

    <\itemize>
      <item>The functions <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> are
      the unique eigenfunctions of the integral operator with kernel
      <math|K<around|(|\<alpha\>,\<gamma\>|)>>.
    </itemize>

    <with|font-series|bold|Proof:>

    <\enumerate>
      <item><with|font-series|bold|Uniform Convergence of Series
      Representation:>

      <\itemize>
        <item>By hypothesis, the series

        <\equation>
          K<around|(|\<alpha\>,\<gamma\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
        </equation>

        converges uniformly to <math|K<around|(|\<alpha\>,\<gamma\>|)>>.

        <item>This uniform convergence ensures that the series represents
        <math|K> accurately over the entire domain
        <math|<around|[|a,b|]>\<times\><around|[|a,b|]>>.
      </itemize>

      <item><with|font-series|bold|Orthogonality and Completeness:>

      <\itemize>
        <item>The functions <math|\<phi\><rsub|n>> are orthogonal, meaning:

        <\equation>
          <big|int><rsub|a><rsup|b>\<phi\><rsub|m><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<alpha\>|)><space|0.17em><math-up|d>\<alpha\>=0*<space|1em><text|for
          all >m\<neq\>n
        </equation>

        <item>Orthogonality implies that no <math|\<phi\><rsub|n>> can be
        represented by a linear combination of other <math|\<phi\><rsub|m>>s
        in the set.
      </itemize>

      <item><with|font-series|bold|Eigenfunction Equation:>

      <\itemize>
        <item>Each function <math|\<phi\><rsub|n>> satisfies the integral
        equation:

        <\equation>
          \<phi\><rsub|n><around|(|\<alpha\>|)>=\<lambda\><rsub|n>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<phi\><rsub|n><around|(|\<xi\>|)><space|0.17em><math-up|d>\<xi\>
        </equation>

        defining them as eigenfunctions of <math|K> with corresponding
        eigenvalues <math|\<lambda\><rsub|n>>.
      </itemize>

      <item><with|font-series|bold|Uniqueness:>

      <\itemize>
        <item>Assume there exists another function
        <math|\<psi\><around|(|\<alpha\>|)>> that is not a linear combination
        of <math|\<phi\><rsub|n>> and also satisfies the integral equation
        for some <math|\<lambda\>>:

        <\equation>
          \<psi\><around|(|\<alpha\>|)>=\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)><space|0.17em><math-up|d>\<xi\>
        </equation>

        <item>Multiply both sides by <math|\<phi\><rsub|m><around|(|\<alpha\>|)>>
        and integrate:

        <\equation>
          <big|int><rsub|a><rsup|b>\<psi\><around|(|\<alpha\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)><space|0.17em><math-up|d>\<alpha\>=\<lambda\>*<big|int><rsub|a><rsup|b><big|int><rsub|a><rsup|b>K<around|(|\<alpha\>,\<xi\>|)>*\<psi\><around|(|\<xi\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)><space|0.17em><math-up|d>\<xi\><space|0.17em><math-up|d>\<alpha\>
        </equation>

        <item>Since <math|\<psi\>> is orthogonal to all
        <math|\<phi\><rsub|n>>, the left-hand side is zero, implying
        <math|\<psi\><around|(|\<alpha\>|)>> must be zero by the completeness
        of <math|\<phi\><rsub|n>>.
      </itemize>

      <item><with|font-series|bold|Conclusion:>

      <\itemize>
        <item>The set <math|\<phi\><rsub|n>> uniquely represents the kernel
        <math|K> via their series expansion. No other function set orthogonal
        to <math|\<phi\><rsub|n>> can satisfy the kernel's integral equation
        unless it is zero.

        <item>Therefore, <math|\<phi\><rsub|n><around|(|\<alpha\>|)>> are the
        unique eigenfunctions of the integral operator defined by
        <math|K<around|(|\<alpha\>,\<gamma\>|)>>.
      </itemize>
    </enumerate>
  </proof>

  <\theorem>
    The series

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|J<rsub|0><around|(|t|)>>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>>\<lambda\><rsub|k>*\<psi\><rsub|k><around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><sqrt|<frac|2*n+<frac|1|2>|\<pi\>>>*<sqrt|<frac|8*n+2|\<pi\>>>*<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>*<around|(|-1|)><rsup|n>*j<rsub|2*n><around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><frac|4*n+1|\<pi\>>*<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>*<around|(|-1|)><rsup|n>*j<rsub|2*n><around|(|t|)>>>>>>
    </equation>

    converges uniformly for all complex <math|t> except the origin where it
    has a regular singular point where <math|lim<rsub|t\<rightarrow\>0>
    J<rsub|0><around|(|t|)>=1>.
  </theorem>

  <\proof>
    <\equation>
      <sqrt|<frac|2*n+<frac|1|2>|\<pi\>>>*<sqrt|<frac|8*n+2|\<pi\>>>=<frac|<sqrt|16*n<rsup|2>+8*n+1>|<sqrt|\<pi\><rsup|2>>>=<frac|<sqrt|<around|(|4*n+1|)>*<around|(|4*n+1|)>>|<sqrt|\<pi\>*\<pi\>>>=<frac|4*n+1|\<pi\>>
    </equation>

    TODO..show that operator defined by Equation (<reference|T>) is compact
    relative to the canonical metric induced by the covariance kernel
    <math|J<rsub|0><around|(|<around|\||x-y|\|>|)>> which can be demonstrated
    by calculating the metric entropy integral and showing it is finite for
    all positive epsilon
  </proof>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|0>
      \;
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
    <associate|2.10|<tuple|18|5>>
    <associate|2.11|<tuple|19|5>>
    <associate|2.12|<tuple|20|5>>
    <associate|2.15|<tuple|23|5>>
    <associate|2.17|<tuple|25|6>>
    <associate|2.19|<tuple|27|6>>
    <associate|2.20|<tuple|28|6>>
    <associate|2.21|<tuple|29|6>>
    <associate|2.7|<tuple|15|4>>
    <associate|2.8|<tuple|16|4>>
    <associate|2.9|<tuple|17|5>>
    <associate|T|<tuple|52|10>>
    <associate|auto-1|<tuple|1|3>>
    <associate|auto-2|<tuple|1.1|4>>
    <associate|auto-3|<tuple|1.1.1|4>>
    <associate|auto-4|<tuple|1.1.2|6>>
    <associate|auto-5|<tuple|2|11>>
    <associate|auto-6|<tuple|69|14>>
    <associate|factorize|<tuple|9|7>>
    <associate|process|<tuple|13|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Eigenfunctions
      from Orthogonalized Null Space> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>The Karhunen-Loeve Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|1.1.1<space|2spc>Derivation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.1.2<space|2spc>Uniqueness of the
      Expansion <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Explanation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>