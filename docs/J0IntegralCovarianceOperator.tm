<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  Let <math|j<rsub|n><around|(|x|)>> is the spherical Bessel function of the
  first kind

  <\equation>
    j<rsub|n><around|(|x|)>=<sqrt|<frac|\<pi\>|2*x>>*J<rsub|n+<frac|1|2>><around|(|x|)>=<frac|1|<sqrt|x>>*<around*|(|sin
    <around|(|z|)>*R<rsub|n,<frac|1|2>><around|(|z|)>-cos
    <around|(|z|)>*R<rsub|n,<frac|3|2>><around|(|z|)>|)>
  </equation>

  and <math|P<rsub|n><around*|(|x|)>> be the Legendre polynomials and
  <math|R<rsub|n,v><around|(|z|)>> be the Lommel
  (quasi)polynomials<cite|modifiedLommelPolynomials>

  <\equation>
    R<rsub|n,v><around|(|z|)>=<frac|\<Gamma\>*<around|(|n+v|)>|\<Gamma\><around|(|v|)>><around*|(|<frac|z|2>|)><rsup|-n><rsub|2>*F<rsub|3><around*|(|<around|[|-<frac|n|2>,-<frac|n|2>+<frac|1|2>|]>;<around|[|v,-n,-v+1-n|]>;-z<rsup|2>|)>
  </equation>

  <\theorem>
    <label|t1>The eigenvalues of\ 

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*f<around|(|x|)><space|0.17em><math-up|d>x
    </equation>

    are givten by

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)><space|0.17em><math-up|d>x=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>=<sqrt|<frac|4*n+1|\<pi\>>>*<around|(|n+1|)><rsub|-<frac|1|2>><rsup|2>
    </equation*>

    and its eigenfunctions are\ 

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<psi\><rsub|n><around|(|y|)>>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|4*\<pi\>>>*<big|int><rsub|-1><rsup|1>P<rsub|2*n><around|(|x|)>*e<rsup|i*x*y><space|0.17em><math-up|d>x>>>>>
    </equation>

    which satisfy the integral covariance equation

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around*|(|t-s|)>\<psi\><rsub|k><around*|(|t|)>\<mathd\>t>|<cell|=\<lambda\><rsub|k>
      \<psi\><rsub|k><around*|(|y|)>>>|<row|<cell|>|<cell|=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>>>|<row|<cell|>|<cell|=<frac|4*n+1|\<pi\>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>*j<rsub|2*n><around|(|y|)>>>>>>
    </equation>

    and the eigenfunction expansion given by\<cdot\>

    <\equation>
      J<rsub|0><around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|x|)>=<frac|4*n+1|\<pi\>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>*j<rsub|2*n><around|(|x|)>
    </equation>

    converges uniformly over the entire complex plane except at the irregular
    removeable singular point at the origin where the limit is however well
    defined.
  </theorem>

  <\proof>
    \;

    Let
  </proof>

  <\equation>
    K<rsub|n><around*|(|x,y|)>=<big|sum><rsub|k=0><rsup|n>\<lambda\><rsub|k>
    \<psi\><rsub|k><around*|(|x-y|)>
  </equation>

  then show that\ 

  <\equation>
    lim<rsub|n\<rightarrow\>\<infty\>>K<rsub|n><around*|(|x,y|)>=J<rsub|0><around*|(|x-y|)>
  </equation>

  uniformly by utilizing the results from the uniformly convergent asymptotic
  series\R.

  <\remark>
    The solutions in Theorem <reference|t1> were derive by identifying the
    orthogonal polynomial sequence associated with the spectral density of
    the kernel <math|K>, which in the case when <math|K=J<rsub|0>> the
    spectral density is seen to be equal to

    <\equation>
      S<around|(|\<omega\>|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*e<rsup|i*x*\<omega\>><space|0.17em><math-up|d>x=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<frac|1|<sqrt|1-\<omega\><rsup|2>>>>|<cell|\<omega\>\<in\><around|(|-1,1|)>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>|\<nobracket\>>
    </equation>

    so that we identify the spectral density with the Chebyshev polynomials
    of the first kind, since their orthogonality measure is, in fact, equal
    to the spectral density in the case <math|K<around|(|t,s|)>=J<rsub|0>*<around|(|t-s|)>>.
    The Chebyshev polynomials' orthogonality relation is

    <\equation>
      <big|int><rsub|-1><rsup|1>T<rsub|n><around|(|\<omega\>|)>*T<rsub|m><around|(|\<omega\>|)>*S<around|(|\<omega\>|)><space|0.17em><math-up|d>\<omega\>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|0>|<cell|n\<neq\>m>>|<row|<cell|\<pi\>>|<cell|n=m=0>>|<row|<cell|<frac|\<pi\>|2>>|<cell|n=m\<neq\>0>>>>>|\<nobracket\>>
    </equation>

    2. Orthogonalize the finite Fourier transform of the Chebyshev type-I
    polynomials<cite|finiteFourierTransformsOfClassicalOrthogonalPolynomials>
    (which is just the usual infinite Fourier transform with the integration
    restricted to the range <math|-1*\<ldots\>*1> since
    <math|T<rsub|n><around|(|x|)>=0\<forall\>x\<nin\><around|[|-1,1|]>>)

    <\equation>
      <wide|T|^><rsub|n><around|(|y|)>=<big|int><rsub|-1><rsup|1>T<rsub|n><around|(|x|)>*e<rsup|i*x*y><space|0.17em><math-up|d>x
    </equation>

    by applying the Gram-Schmidt recursions

    <\equation>
      \<psi\><rsub|n><around|(|y|)>=<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>=<wide|T<rsup|>|^><rsub|n><around|(|y|)>-<big|sum><rsub|m=1><rsup|n-1><frac|<around|\<langle\>|<wide|T|^><rsub|n><around|(|y|)>,<wide|T|^><rsup|\<perp\>><rsub|m><around|(|y|)>|\<rangle\>>|<around|\<langle\>|<wide|T|^><rsup|\<perp\>><rsub|m><around|(|y|)>,<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>|\<rangle\>>>*<wide|T|^><rsup|\<perp\>><rsub|n><around|(|y|)>
    </equation>

    with respect to the unweighted standard Lebesgue inner product measure
    over <math|0> to <math|\<infty\>>.

    4. Note that the partial sums\ 

    <\equation>
      K<rsub|n><around*|(|x,y|)>=<big|sum><rsub|k=0><rsup|n>
      \<psi\><rsub|k><around*|(|x-y|)>
    </equation>

    converge pointwisely by applying the appropriate theorem from Fourier
    analysis.

    5. Determine the eigenvalues by projecting them onto the kernel

    6. Apply the proof of uniformity of asymptotic series by showing
    equivalence to<text-dots>

    \;
  </remark>

  \;

  <\big-figure|<image|KConvergence.eps|375pt|176.25pt||>>
    Demonstration of convergence of <math|K<rsub|n><around*|(|h|)>> to
    <math|J<rsub|0><around*|(|h|)>> for <math|n=0,5,10>
  </big-figure>

  <\big-figure|<image|KErr.eps|375pt|176.25pt||>>
    Demonstrating of approximation error between
    \ <math|K<rsub|n><around*|(|h|)>> and <math|J<rsub|0><around*|(|h|)>> for
    <math|n=0,5,10>
  </big-figure>

  <\note>
    This procedure is an application of the Galerkin 'numerical' method in
    the first part of "Stochastic Finite Elements\Q except instead of just
    choosing a piecewise or other polynomial basis for the expansion, you
    apply the orthogonalization procedure to the Fourier transform of the
    orthogonal polynomials corresponding to the spectral density, and thus
    what are termed the the mass and stiffness matrices in the engineering
    and finite element literature become the identity matrix, and
    <math|c<rsub|n>=\<lambda\><rsub|n>> becomes an identity.
  </note>

  \;

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|2>
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
    </bib-list>
  </bibliography>

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|bg-color|white>
    <associate|font|stix>
    <associate|font-family|rm>
    <associate|magnification|1>
    <associate|math-font|math-stix>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|3|LetterToProfessorsRogerAndPol.tm>>
    <associate|auto-2|<tuple|2|3|LetterToProfessorsRogerAndPol.tm>>
    <associate|auto-3|<tuple|3|3|LetterToProfessorsRogerAndPol.tm>>
    <associate|bib-finiteFourierTransformsOfClassicalOrthogonalPolynomials|<tuple|1|3|LetterToProfessorsRogerAndPol.tm>>
    <associate|bib-modifiedLommelPolynomials|<tuple|2|3|LetterToProfessorsRogerAndPol.tm>>
    <associate|t1|<tuple|1|1|LetterToProfessorsRogerAndPol.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      modifiedLommelPolynomials

      finiteFourierTransformsOfClassicalOrthogonalPolynomials
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1>|>
        Demonstration of convergence of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|K<rsub|n><around*|(|h|)>>>
        to <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|J<rsub|0><around*|(|h|)>>>
        for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|n=0,5,10>>
      </surround>|<pageref|auto-1>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|2>|>
        Demonstrating of approximation error between
        \ <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|K<rsub|n><around*|(|h|)>>>
        and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|J<rsub|0><around*|(|h|)>>>
        for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|n=0,5,10>>
      </surround>|<pageref|auto-2>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>