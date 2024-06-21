<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<\doc-title>
    Uniform Convergence of an Eigenfunction Expansion for <math|J<rsub|0>>
  </doc-title>|<doc-author|<author-data|<author-name|Stephen Crowley
  \<less\>stephencrowley214@gmail.com\<gtr\>>>>>

  I'm trying to prove that the eigenfunctions and eigenvalues of\ 

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around*|(|x|)>\<mathd\>x=\<lambda\><rsub|n>\<psi\><rsub|n><around*|(|x|)>
  </equation>

  are given by

  <\equation>
    \<psi\><rsub|n><around*|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>
  </equation>

  and

  <math|<\text>
    <\equation>
      \<lambda\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)><space|0.17em><math-up|d>x=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>=<sqrt|<frac|4*n+1|\<pi\>>>*<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>
    </equation>
  </text>>

  and that the corresponding eigenfunction expansion converges uniformly on
  <math|<around*|(|0,\<infty\>|)>>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|J<rsub|0><around*|(|x|)>>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>>\<lambda\><rsub|k>\<psi\><rsub|k><around*|(|x|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>><sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>><frac|4*n+1|\<pi\>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>><around|(|-1|)><rsup|n>*j<rsub|2*n><around|(|y|)>>>>>>
  </equation>

  If this was a bounded interval or the kernel was square integrable the
  Hilbert-Schmidt theorem or Mercer's theorem could be invoked that says a
  uniformly converging orthonormal sequence of translation invariant
  functions are necessarily the eigenfunctions of the corresponding integral
  covariance operator having the kernel to which the partial sums converge as
  the covariance kernel. The solution was derived by\ 

  1. Identifying the orthogonal polynomial sequence associated with the
  spectral density of the kernel <math|K<rsub|>>, which in the case where
  <math|K=J<rsub|0>> is given by

  <\equation>
    S<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*e<rsup|i*x*\<omega\>><space|0.17em><math-up|d>x=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|1|<sqrt|1-\<omega\><rsup|2>>>>|<cell|\<omega\>\<in\><around|(|-1,1|)>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
  </equation>

  which is equal to the spectral density of the Gaussian process having the
  kernel <math|K<around|(|t,s|)>=J<rsub|0>*<around|(|t-s|)>>. Recalling the
  Chebyshev polynomials' orthogonality relation:

  <\equation>
    <big|int><rsub|-1><rsup|1>T<rsub|n><around|(|\<omega\>|)>*T<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)><space|0.17em><math-up|d>\<omega\>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|0>|<cell|n\<neq\>m>>|<row|<cell|\<pi\>>|<cell|n=m=0>>|<row|<cell|<frac|\<pi\>|2>>|<cell|n=m\<neq\>0>>>>>|\<nobracket\>>
  </equation>

  \;

  Calculate their (finite) Fourier transforms of the Chebyshev type-I
  polynomials(which is just the usual infinite Fourier transform with the
  integration restricted to the range <math|-1*\<ldots\>*1> since
  <math|T<rsub|n><around|(|x|)>=0\<forall\>x\<nin\><around|[|-1,1|]>>) or
  equivalent the spectral density extended to take the value 0 outside
  <math|<around*|[|-1,1|]>>

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

  Then use <math|L<rsup|2>> norm of <math|<wide|T|^><rsub|n><around|(|y|)>>\ 

  <\equation>
    <around*|\||<wide|T|^><rsub|n>|\|><rsub|>=<sqrt|<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|T|^><rsub|n><around|(|y|)><rsup|2>\<mathd\>y>=<sqrt|<frac|4<around*|(|-1|)><rsup|n>\<pi\>-<around*|(|2n<rsup|2>-1|)>|4n<rsup|2>-1>>
  </equation>

  to define the normalized Fourier transforms<cite|finiteFourierTransformsOfClassicalOrthogonalPolynomials>
  <math|Y<rsub|n><around*|(|y|)>> of <math|T<rsub|n><around*|(|x|)>> \ by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|Y<rsub|n><around*|(|y|)>>|<cell|=<frac|<wide|T|^><rsub|n><around|(|y|)>|<around*|\||<wide|T|^><rsub|n>|\|>>>>|<row|<cell|>|<cell|=<frac|i*|y><around*|(|<frac|e<rsup|-i
    y>F<rsup|+><rsub|n><around*|(|y|)>-e<rsup|i<around*|(|\<pi\>n+y|)>>F<rsub|n><rsup|-><around*|(|y|)>|<sqrt|<frac|4<around*|(|-1|)><rsup|n>\<pi\>-<around*|(|2n<rsup|2>-1|)>|4n<rsup|2>-1>>>|)>>>>>>
  </equation>

  \ then orthogonalize them so that our eigenfunctions are recognized as the
  the orthogonal complement of the normalized Fourier transformed
  <math|Y<rsub|n><around*|(|y|)>> of the Type-1 Chebshev polynomials
  <math|T<rsub|n><around*|(|x|)>> (via the Gram-Schmidt process)

  <\equation>
    \<psi\><rsub|n><around|(|y|)>=Y<rsup|\<perp\>><rsub|n><around|(|y|)>=Y<rsub|n><around|(|y|)>-<big|sum><rsub|m=1><rsup|n-1><frac|<around|\<langle\>|Y<rsub|n><around|(|y|)>,Y<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|Y<rsup|\<perp\>><rsub|m><around|(|y|)>,Y<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>>*Y<rsup|\<perp\>><rsub|m><around|(|y|)>
  </equation>

  with respect to the unweighted standard Lebesgue inner product measure over
  <math|0> to <math|\<infty\>>\<less\>

  <\equation>
    \<lambda\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)><space|0.17em><math-up|d>x=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>=<sqrt|<frac|4*n+1|\<pi\>>>*<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>
  </equation>

  where <math|<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>> is the Pochhammer
  symbol aka rising factorial. The eigenfunctions can be equivalently
  expressed as

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<psi\><rsub|n><around|(|y|)>>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|4*\<pi\>>>*<big|int><rsub|-1><rsup|1>P<rsub|2*n><around|(|x|)>*e<rsup|i*x*y><space|0.17em><math-up|d>x>>>>>
  </equation>

  where <math|P<rsub|n><around*|(|x|)>> is the Legendre polynomials,
  <math|j<rsub|n><around|(|x|)>> is the spherical Bessel function of the
  first kind,\ 

  <\equation>
    j<rsub|n><around|(|x|)>=<sqrt|<frac|\<pi\>|2*x>>*J<rsub|n+<frac|1|2>><around|(|x|)>=<frac|1|<sqrt|x>>*<around*|(|sin
    <around|(|z|)>*R<rsub|n,<frac|1|2>><around|(|z|)>-cos
    <around|(|z|)>*R<rsub|n,<frac|3|2>><around|(|z|)>|)>
  </equation>

  and where <math|R<rsub|n,v><around|(|z|)>> are the (misnamed) Lommel
  polynomials<cite|modifiedLommelPolynomials>

  <\equation>
    R<rsub|n,v><around|(|z|)>=<frac|\<Gamma\>*<around|(|n+v|)>|\<Gamma\><around|(|v|)>><around*|(|<frac|z|2>|)><rsup|-n><rsub|2>*F<rsub|3><around*|(|<around|[|-<frac|n|2>,-<frac|n|2>+<frac|1|2>|]>;<around|[|v,-n,-v+1-n|]>;-z<rsup|2>|)>
  </equation>

  which are actually rational functions of z, not polynomial but rather
  \Ppolynomial in <math|1/z<rprime|''>>. Uniform convergence would imply that

  <\equation>
    K<rsub|n><around|(|x,y|)>=<big|sum><rsub|k=0><rsup|n>\<lambda\><rsub|k>*\<psi\><rsub|k>*<around|(|x-y|)>
  </equation>

  such that

  <\equation>
    lim<rsub|n\<rightarrow\>\<infty\>> K<rsub|n><around|(|x,y|)>=J<rsub|0>*<around|(|x-y|)>
  </equation>

  It is also the case that\ 

  <\equation>
    \<lambda\><rsub|m,n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|m><around|(|x|)>*\<psi\><rsub|n><around|(|x|)><space|0.17em><math-up|d>x=<choice|<tformat|<table|<row|<cell|\<lambda\><rsub|n>>|<cell|n\<leqslant\>m>>|<row|<cell|0>|<cell|n\<gtr\>m>>>>>
  </equation>

  <\thebibliography|1>
    <bibitem-with-key|1|finiteFourierTransformsOfClassicalOrthogonalPolynomials>Atul
    Dixit, Lin Jiu, Victor H Moll, and Christophe Vignat. <newblock>The
    finite Fourier transform of classical polynomials.
    <newblock><with|font-shape|italic|Journal of the Australian Mathematical
    Society>, 98:145\U160, 2015.<newblock>

    <bibitem-with-key|2|modifiedLommelPolynomials>R. Wong K.F. Lee.
    <newblock>Asymptotic expansion of the modified Lommel polynomials
    <math|h<rsub|n,\<nu\>><around|(|x|)>> and their zeros.
    <newblock><with|font-shape|italic|Proceedings of the American
    Mathematical Society>, 142(11):3953\U3964, 2014.<newblock>
  </thebibliography>
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
    <associate|auto-1|<tuple|18|4>>
    <associate|bib-finiteFourierTransformsOfClassicalOrthogonalPolynomials|<tuple|1|4>>
    <associate|bib-modifiedLommelPolynomials|<tuple|2|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      finiteFourierTransformsOfClassicalOrthogonalPolynomials

      modifiedLommelPolynomials
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>