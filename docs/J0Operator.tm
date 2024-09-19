<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Eigenfunctions of Stationary Integral Covariance
  Operators>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-affiliation|<with|font-family|tt|stephencrowley214@gmail.com>>>>|<doc-date|September
  16, 2024>>

  <abstract-data|<\abstract>
    The null spaces of the kernel inner product operators of Gaussian process
    \ are shown to be the Fourier transforms of the polynomials orthogonal
    with respect to the spectral densities of the processes and it is
    furthermore shown that the orthogonal complements of the null spaces are
    given by the Gram-Schmidt recursions which enumerate the products
    <math|\<Psi\><rsub|k><around|(|t-s|)>=<sqrt|<frac|c<rsub|p>|c<rsub|q>>>*<frac|<big|prod><rsub|i=1><rsup|n<rsub|k>><around|(|t-s-\<alpha\><rsub|k,i>|)>|<big|prod><rsub|j=1><rsup|m<rsub|k>><around|(|t-s-\<beta\><rsub|k,j>|)>>=\<psi\><rsub|k><around|(|t|)>*\<psi\><rsub|k><around|(|s|)>>
    of the eigenfunctions <math|\<psi\><rsub|k><around*|(|t|)>> of the
    corresponding integral covariance operators.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <with|par-left|1tab|1.1<space|2spc>Null Space of the Inner Product
    Operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Eigenfunctions
    Are The Facorizations of the Orthogonal Complement of the Null Space>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Appendix>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Proofs & Lemmas
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|2tab|3.1.1<space|2spc>Unique Uniform Convergence of
    Eigenfunctions to Kernel <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|2tab|3.1.2<space|2spc>Factorization of Rational
    <with|mode|math|f<around*|(|t-s|)>=g<around*|(|t|)>g<around*|(|s|)>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  Let <math|C<around|(|x|)>> be the covariance function of a stationary
  Gaussian process on <math|<around|[|0,\<infty\>|)>>. Define the integral
  covariance operator <math|T> by:

  <\equation>
    <around|(|T*f|)><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>C*<around|(|x-y|)>*f<around|(|y|)><space|0.17em><math-up|d>y<label|T>
  </equation>

  Let <math|S<around|(|\<omega\>|)>> be the spectral density related to
  <math|C<around|(|x|)>> by the Wiener-Khinchin theorem:

  <\equation>
    C<around|(|x|)>=<frac|1|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*x>*S<around|(|\<omega\>|)><space|0.17em><math-up|d>\<omega\>
  </equation>

  <\equation>
    S<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|x|)>*e<rsup|-i*x*\<omega\>><space|0.17em><math-up|d>x
  </equation>

  <subsection|Null Space of the Inner Product Operator>

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

  <section|Eigenfunctions Are The Facorizations of the Orthogonal Complement
  of the Null Space>

  By orthogonalizing the null space <math|<around|{|r<rsub|n><around|(|x|)>|}>>,
  we obtain the product of the \ eigenfunctions
  <math|<around|{|\<psi\><rsub|n><around|(|x|)>\<psi\><rsub|n><around*|(|y|)>=\<Psi\><rsub|n><around*|(|x-y|)>|}>>
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
    The eigenvalues of the integral covariance operator (<reference|T>) are
    given by

    <\equation>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|z|)>*\<Psi\><rsub|n><around|(|z|)><space|0.17em><math-up|d>z
    </equation>
  </theorem>

  <\proof>
    TOOD: Insert the way to show this, its standard
  </proof>

  \;

  <\theorem>
    Let <math|\<Psi\><rsub|n><around|(|y|)>> be the normalized Fourier
    transforms of the spectral polynomials
    <math|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<Psi\><rsub|n><around|(|y|)>>|<cell|=<frac|<wide|S|^><rsub|n><around|(|y|)>|<around|\||<wide|S|^><rsub|n>|\|>>>>>>>>where
    the sequence <math|<wide|S|^><rsub|n><around|(|y|)>> of inverse Fourier
    transforms of the spectral polynomials <math|S<rsub|n><around|(|x|)>> is
    given by

    <\equation>
      <wide|S|^><rsub|n><around|(|y|)>=<big|int><rsub|-1><rsup|1>S<rsub|n><around|(|x|)>*e<rsup|i*x*y><space|0.17em><math-up|d>x
    </equation>

    The product of the eigenfunctions of the integral covariance operator
    (<reference|T>) are given by\ 

    <\equation>
      \<psi\><rsub|n><around|(|x|)>*\<psi\><rsub|n><around|(|y|)>=\<Psi\><rsup|\<perp\>><rsub|n>*<around|(|x-y|)>
    </equation>

    of the elements of orthogonal complement of the normalized Fourier
    transforms <math|\<Psi\><rsub|n><around|(|y|)>> of the spectral
    polynomials (via the Gram-Schmidt process)

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<psi\><rsub|n><around|(|x|)>*\<psi\><rsub|n><around|(|y|)>>|<cell|=\<Psi\><rsup|\<perp\>><rsub|n>*<around|(|x-y|)>>>|<row|<cell|>|<cell|=\<Psi\><rsub|n>*<around|(|x-y|)>-<big|sum><rsub|m=0><rsup|n-1><frac|<around|\<langle\>|\<Psi\><rsub|m>*<around|(|x-y|)>,\<Psi\><rsup|\<perp\>><rsub|m>*<around|(|x-y|)>|\<rangle\>>|<around|\<langle\>|\<Psi\><rsup|\<perp\>><rsub|m>*<around|(|x-y|)>,\<Psi\><rsup|\<perp\>><rsub|m>*<around|(|x-y|)>|\<rangle\>>>*\<Psi\><rsup|\<perp\>><rsub|m>*<around|(|x-y|)>>>>>>
    </equation>
  </theorem>

  <\proof>
    ...TODO
  </proof>

  \;

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

    The finite Fourier transforms of the Chebyshev
    polynomials<cite|finiteFourierTransforms> are just the usual infinite
    Fourier transforms with the integration restricted to the range
    <math|-1*\<ldots\>*1> since <math|T<rsub|n><around|(|x|)>=0\<forall\>x\<nin\><around|[|-1,1|]>>).
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

  \;

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

  <section|Appendix>

  <subsection|Proofs & Lemmas>

  <subsubsection|Unique Uniform Convergence of Eigenfunctions to Kernel>

  <\theorem>
    Let <math|K<around|(|\<alpha\>,\<gamma\>|)>> be a symmetric kernel
    defined on <math|<around|[|0,\<infty\>|)>\<times\><around|[|0,\<infty\>|)>>,
    and let <math|<around|{|\<phi\><rsub|n><around|(|\<alpha\>|)>|}><rsub|n=0><rsup|\<infty\>>>
    be the set of orthonormal eigenfunctions of the integral equation

    <\equation>
      \<phi\><around|(|\<alpha\>|)>=\<lambda\>*<big|int><rsub|0><rsup|\<infty\>>K<around|(|\<alpha\>,\<xi\>|)>*\<phi\><around|(|\<xi\>|)><space|0.17em><math-up|d>\<xi\>
    </equation>

    with corresponding eigenvalues <math|<around|{|\<lambda\><rsub|n>|}><rsub|n=0><rsup|\<infty\>>>.
    The eigenfunctions satisfy the orthonormality condition:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|m><around|(|\<alpha\>|)><space|0.17em><math-up|d>\<alpha\>=\<delta\><rsub|n*m>
    </equation>

    where <math|\<delta\><rsub|n*m>> is the Kronecker delta. Then, if the
    series

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
    </equation>

    is uniformly convergent for <math|0\<leq\>\<alpha\>,\<gamma\>\<less\>\<infty\>>,
    we have

    <\equation>
      K<around|(|\<alpha\>,\<gamma\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
    </equation>
  </theorem>

  <\proof>
    Let

    <\equation>
      S<around|(|\<alpha\>,\<gamma\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>
    </equation>

    Consider the action of <math|S<around|(|\<alpha\>,\<gamma\>|)>> on an
    eigenfunction <math|\<phi\><rsub|m><around|(|\<gamma\>|)>>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>S<around|(|\<alpha\>,\<gamma\>|)>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\>>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>|\<lambda\><rsub|n>>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|n><around|(|\<gamma\>|)>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>|\<lambda\><rsub|n>>*\<delta\><rsub|n*m><eq-number>>>|<row|<cell|>|<cell|=<frac|\<phi\><rsub|m><around|(|\<alpha\>|)>|\<lambda\><rsub|m>><eq-number>>>>>
    </align>

    The interchange of summation and integration is justified by the uniform
    convergence of the series. For the eigenfunction
    <math|\<phi\><rsub|m><around|(|\<alpha\>|)>>:

    <\equation>
      \<phi\><rsub|m><around|(|\<alpha\>|)>=\<lambda\><rsub|m>*<big|int><rsub|0><rsup|\<infty\>>K<around|(|\<alpha\>,\<gamma\>|)>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\>
    </equation>

    Comparing this with our result for <math|S<around|(|\<alpha\>,\<gamma\>|)>>,
    we see that

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>S<around|(|\<alpha\>,\<gamma\>|)>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\>=<big|int><rsub|0><rsup|\<infty\>>K<around|(|\<alpha\>,\<gamma\>|)>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\>
    </equation>

    for all eigenfunctions <math|\<phi\><rsub|m><around|(|\<alpha\>|)>>. For
    any square-integrable function <math|f<around|(|\<alpha\>|)>>:

    <\equation>
      f<around|(|\<alpha\>|)>=<big|sum><rsub|m=0><rsup|\<infty\>>c<rsub|m>*\<phi\><rsub|m><around|(|\<alpha\>|)>
    </equation>

    where <math|c<rsub|m>=<big|int><rsub|0><rsup|\<infty\>>f<around|(|\<gamma\>|)>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\>>.
    Then:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>S<around|(|\<alpha\>,\<gamma\>|)>*f<around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>S<around|(|\<alpha\>,\<gamma\>|)>*<big|sum><rsub|m=0><rsup|\<infty\>>c<rsub|m>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|m=0><rsup|\<infty\>>c<rsub|m>*<big|int><rsub|0><rsup|\<infty\>>S<around|(|\<alpha\>,\<gamma\>|)>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|m=0><rsup|\<infty\>>c<rsub|m>*<big|int><rsub|0><rsup|\<infty\>>K<around|(|\<alpha\>,\<gamma\>|)>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>K<around|(|\<alpha\>,\<gamma\>|)>*<big|sum><rsub|m=0><rsup|\<infty\>>c<rsub|m>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>K<around|(|\<alpha\>,\<gamma\>|)>*f<around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\><eq-number>>>>>
    </align>

    Since this equality holds for all square-integrable functions
    <math|f<around|(|\<alpha\>|)>>, we conclude that

    <\equation>
      S<around|(|\<alpha\>,\<gamma\>|)>=K<around|(|\<alpha\>,\<gamma\>|)>
    </equation>

    To prove uniqueness, suppose there exists another expansion

    <\equation>
      K<around|(|\<alpha\>,\<gamma\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<phi\><rsub|n><around|(|\<alpha\>|)>*\<phi\><rsub|n><around|(|\<gamma\>|)>|\<lambda\><rsub|n>>+H<around|(|\<alpha\>,\<gamma\>|)>
    </equation>

    where <math|H<around|(|\<alpha\>,\<gamma\>|)>> is a non-zero symmetric
    function. Then for any eigenfunction <math|\<phi\><rsub|m><around|(|\<alpha\>|)>>:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>H<around|(|\<alpha\>,\<gamma\>|)>*\<phi\><rsub|m><around|(|\<gamma\>|)><space|0.17em><math-up|d>\<gamma\>=0
    </equation>

    This implies <math|H<around|(|\<alpha\>,\<gamma\>|)>> must be identically
    zero, contradicting our assumption. Therefore, the expansion is unique.
    <cite-detail|whittakerAndWatsonCourseOfModernAnalysis|..?>

    For a specific eigenfunction <math|\<phi\><rsub|k><around|(|\<alpha\>|)>>:

    <\equation>
      \<phi\><rsub|k><around|(|\<alpha\>|)>=\<lambda\><rsub|k>*<frac|\<phi\><rsub|k><around|(|\<alpha\>|)>|\<lambda\><rsub|k>>*<big|int><rsub|0><rsup|\<infty\>><around|[|\<phi\><rsub|k><around|(|\<xi\>|)>|]><rsup|2><space|0.17em><math-up|d>\<xi\>
    </equation>

    This leads to the normalization condition:
    <math|<big|int><rsub|0><rsup|\<infty\>><around|[|\<phi\><rsub|k><around|(|\<xi\>|)>|]><rsup|2><space|0.17em><math-up|d>\<xi\>=1>.
  </proof>

  <subsubsection|Factorization of Rational
  <math|f<around*|(|t-s|)>=g<around*|(|t|)>g<around*|(|s|)>>>

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

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|2>
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
    <associate|T|<tuple|26|6>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|2|3>>
    <associate|auto-4|<tuple|3|7>>
    <associate|auto-5|<tuple|3.1|7>>
    <associate|auto-6|<tuple|3.1.1|7>>
    <associate|auto-7|<tuple|3.1.2|9>>
    <associate|auto-8|<tuple|55|10>>
    <associate|bib-finiteFourierTransforms|<tuple|1|10>>
    <associate|bib-whittakerAndWatsonCourseOfModernAnalysis|<tuple|2|10>>
    <associate|factorize|<tuple|8|9>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      finiteFourierTransforms

      whittakerAndWatsonCourseOfModernAnalysis
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Null Space of the Inner
      Product Operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Eigenfunctions
      Are The Facorizations of the Orthogonal Complement of the Null Space>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Proofs & Lemmas
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|3.1.1<space|2spc>Unique Uniform Convergence
      of Eigenfunctions to Kernel <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|3.1.2<space|2spc>Factorization of Rational
      <with|mode|<quote|math>|f<around*|(|t-s|)>=g<around*|(|t|)>g<around*|(|s|)>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>