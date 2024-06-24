<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  \;

  <doc-data|<\doc-title>
    Uniform Convergence of an Eigenfunction Expansion for <math|J<rsub|0>>
  </doc-title>|<doc-author|<author-data|<author-name|Stephen Crowley
  \<less\>stephencrowley214@gmail.com\<gtr\>>>>>

  <\theorem>
    The eigenfunctions and eigenvalues of the stationary integral covariance
    operator\ 

    <\equation>
      <around*|[|T \<psi\><rsub|n>|]><around*|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around*|(|x|)>\<mathd\>x=\<lambda\><rsub|n>\<psi\><rsub|n><around*|(|x|)><label|T>
    </equation>

    are given by

    <\equation>
      \<psi\><rsub|n><around*|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>
    </equation>

    and

    <math|<\text>
      <\equation>
        <tabular|<tformat|<table|<row|<cell|\<lambda\><rsub|n>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)><space|0.17em><math-up|d>x>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|\<pi\>>>*<around|(|n+1|)><rsub|<frac|1|2>><rsup|2>>>>>>
      </equation>
    </text>>
  </theorem>

  \;

  \;

  <\proof>
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

    \ then orthogonalize them so that our eigenfunctions are recognized as
    the the orthogonal complement of the normalized Fourier transformed
    <math|Y<rsub|n><around*|(|y|)>> of the Type-1 Chebshev polynomials
    <math|T<rsub|n><around*|(|x|)>> (via the Gram-Schmidt process)

    <\equation>
      \<psi\><rsub|n><around|(|y|)>=Y<rsup|\<perp\>><rsub|n><around|(|y|)>=Y<rsub|n><around|(|y|)>-<big|sum><rsub|m=1><rsup|n-1><frac|<around|\<langle\>|Y<rsub|n><around|(|y|)>,Y<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|Y<rsup|\<perp\>><rsub|m><around|(|y|)>,Y<rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>>*Y<rsup|\<perp\>><rsub|m><around|(|y|)>
    </equation>

    with respect to the unweighted standard Lebesgue inner product measure
    over <math|0> to <math|\<infty\>>\<less\>

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
    \Ppolynomial in <math|1/z<rprime|''>>.
  </proof>

  \ 

  <\theorem>
    The eigenfunction expansion converges uniformly on
    <math|<around*|(|0,\<infty\>|)>> to the covariance kernel function

    <\equation>
      <tabular|<tformat|<table|<row|<cell|J<rsub|0><around*|(|t|)>>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>>\<lambda\><rsub|k>\<psi\><rsub|k><around*|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>><sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0<rsup|>><rsup|\<infty\>><frac|4*n+1|\<pi\>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>><around|(|-1|)><rsup|n>*j<rsub|2*n><around|(|t|)>>>>>>
    </equation>
  </theorem>

  <\proof>
    Since <math|T> is compact due to its self-adjointness and convergence of
    the eigenvalues to <math|0> it converges uniformly since compactness
    implies uniform convergence of the eigenfunctions. TODO: reproduct
    relevant theorems from <cite-detail|gaussianProcessIntroduction|3.
    Reproducing Kernel Hilbert Space of a Gaussian Process>Introduction to
    Gaussian Processes
  </proof>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|3>
      <bibitem*|1><label|bib-finiteFourierTransformsOfClassicalOrthogonalPolynomials>Atul
      Dixit, Lin Jiu, Victor<nbsp>H Moll<localize|, and >Christophe Vignat.
      <newblock>The finite fourier transform of classical polynomials.
      <newblock><with|font-shape|italic|Journal of the Australian
      Mathematical Society>, 98:145\U160, 2015.<newblock>

      <bibitem*|2><label|bib-modifiedLommelPolynomials>R.<nbsp>Wong K.F. Lee.
      <newblock>Asymptotic expansion of the modified lommel polynomials
      <math|h<rsub|n,\<nu\>><around|(|x|)>> and their zeros.
      <newblock><with|font-shape|italic|Proceedings of the American
      Mathematical Society>, 142(11):3953\U3964, 2014.<newblock>

      <bibitem*|3><label|bib-gaussianProcessIntroduction>Steven<nbsp>P.<nbsp>Lalley.
      <newblock>Introduction to gaussian processes.
      <newblock>https://galton.uchicago.edu/<nbsp>lalley/Courses/386/GaussianProcesses.pdf,
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
    <associate|T|<tuple|1|1>>
    <associate|auto-1|<tuple|15|4>>
    <associate|bib-finiteFourierTransformsOfClassicalOrthogonalPolynomials|<tuple|1|4>>
    <associate|bib-gaussianProcessIntroduction|<tuple|3|4>>
    <associate|bib-modifiedLommelPolynomials|<tuple|2|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      finiteFourierTransformsOfClassicalOrthogonalPolynomials

      modifiedLommelPolynomials

      gaussianProcessIntroduction
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>