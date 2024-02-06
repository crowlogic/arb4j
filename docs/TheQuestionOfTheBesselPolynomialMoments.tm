<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Bessel Polynomial Moments>>

  <section*|1. Introduction>

  Since 1949 when the Bessel polynomials appeared, a hunt has been on to find
  a weight function <math|\<psi\>>, defined on the real axis, with respect to
  which the polynomials would be orthogonal. Although at least two devices
  have been found which formally seem to fill the role of orthogonality
  generation, none was expressible in terms of integration on the real axis.

  In a paper by Krall <cite|theBesselPolynomialMoments> it was shown that the
  Bessel polynomials <math|y<rsub|n><around|(|x,a,b|)>> are orthogonal with
  respect to the distribution <math|\<psi\>> given by

  <\equation>
    <around|\<langle\>|f,\<psi\>|\<rangle\>>=lim<rsub|\<varepsilon\>\<to\>0>
    <frac|1|\<pi\>>*<big|int><rsub|\<alpha\>><rsup|\<beta\>>f<around|(|x|)>*<text|Im><around|{|<around|(|-<frac|b|x+i*\<varepsilon\>>|)>*<rsub|1>F<rsub|1><around|(|a,-<frac|b|x+i*\<varepsilon\>>|)>|}>*d*x\<forall\>\<alpha\>\<less\>0,\<beta\>\<gtr\>0
  </equation>

  The key to showing that the above formula is valid is through the moments
  associated with the Bessel polynomials

  <\equation>
    \<mu\><rsub|n>=<frac|<around|(|-b|)><rsup|n+1>|<around|(|a|)><rsub|n>><space|1em><space|1em>
  </equation>

  where <math|<around|(|a|)><rsub|n>=a*<around|(|a+1|)>*\<ldots\>*<around|(|a+n-1|)>\<forall\>><math|n=0,1,\<ldots\>>
  are the rising factorials, which were discovered by examining the
  differential equation satisfied by the Bessel polynomials. It is well known
  that, given the moments <math|\<mu\><rsub|n>>, there exists a function of a
  complex variable <math|f<around|(|z|)>>, called the Cauchy representation,
  given by

  <\equation>
    f<around|(|z|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<mu\><rsub|n>|z<rsup|n+1>>
  </equation>

  when the support of the weight function is compact, and in general
  satisfying

  <\equation>
    lim<rsub|z\<to\>\<infty\>> z<rsup|k+1>*<around*|[|f<around|(|z|)>+<big|sum><rsub|n=0><rsup|k><frac|\<mu\><rsub|n>|z<rsup|n+1>>|]>=-\<mu\><rsub|k>
    \<forall\>\<delta\>\<less\><text|arg >z\<less\>\<pi\>-\<delta\>\<exists\>\<delta\>\<in\><around*|(|0,<frac|\<pi\>|2>|)>
  </equation>

  For the Bessel polynomials it is easy to see that

  <\equation>
    f<around|(|z|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-<frac|b|z>|)><rsup|n+1>|<around|(|a|)><rsub|n>>=<frac|-b|z><frac||>
    <rsub|1>F<rsub|1><around|(|<tabular|<tformat|<table|<row|<cell|<around*|[|1|]>,<around*|[|a|]>>>>>>,-<frac|b|z>|)>
  </equation>

  By using the Stieltjes\UPerron formula ([4] or in the distributional case
  [1]), the formula for <math|\<psi\>> immediately follows. The fact that the
  interval <math|<around|[|\<alpha\>,\<beta\>|]>> needs only to include the
  point of follows from the analyticity of <math|f<around|(|z|)>> in any
  region excluding the origin.

  <section*|2. Results>

  We state in summary

  <with|font-series|bold|Theorem 1.> The Bessel polynomials are mutually
  orthogonal with respect to <math|\<psi\>>. That is,\ 

  <\equation*>
    <around|\<langle\>|y<rsub|n>,y<rsub|m>,\<psi\>|\<rangle\>>=0\<forall\>n\<neq\>m
  </equation*>

  This, of course, follows from the Stieltjes\UPerron formula, which shows
  that <math|\<psi\>> generates the moments through
  <math|<around|\<langle\>|x<rsup|n>,\<psi\>|\<rangle\>>=\<mu\><rsub|n>\<forall\>n=0,1,\<ldots\>>.
  A direct proof may be quickly given, however by noting that bracketed term\ 

  <\equation*>
    \<psi\><around|(|\<beta\>|)>-\<psi\><around|(|\<alpha\>|)>=lim<rsub|\<epsilon\>\<to\>0>
    <frac|1|\<pi\>>*<big|int><rsub|\<alpha\>><rsup|\<beta\>><big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-b|)><rsup|n+1>|<around|(|a|)><rsub|n>><around*|[|<big|sum><rsub|j=0><rsup|<around|[|<frac|n|2>|]>><choose|n+1|2j+1><frac|n+1|<around|(|2*j+1|)>!><frac|*<around|(|-1|)><rsup|j+1>*\<varepsilon\><rsup|2j+1>*x<rsup|n-2*j>|<around|(|x<rsup|2>+\<varepsilon\><rsup|2>|)><rsup|n+1>>|]>**d*x
  </equation*>

  converges to

  <\equation>
    lim<rsub|\<varepsilon\>\<rightarrow\>0><frac|<around|(|-1|)><rsup|n><frac|d<rsup|n>|d*x<rsup|n>><around*|(|<frac|\<varepsilon\>|x<rsup|2>+\<varepsilon\><rsup|2>>|)>|n!>=<frac|<around|(|-1|)><rsup|n>*\<delta\><rsup|<around|(|n|)>><around|(|x|)>|n!>
  </equation>

  as <math|\<varepsilon\>\<rightarrow\>0> where
  <math|\<delta\><rsup|<around|(|n|)>><around|(|x|)>> is the <math|n>th
  distributional derivative of the Dirac delta function and therefore
  <math|\<psi\>> has the well-known distributional expansion

  <\equation>
    \<psi\>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|n>*\<mu\><rsub|n>*\<delta\><rsup|<around|(|n|)>><around|(|x|)>|n!>
  </equation>

  <with|font-series|bold|Theorem 2.> For <math|n=0,1,\<ldots\>>,

  <\equation>
    <around|\<langle\>|y<rsub|n><rsup|2>,\<psi\>|\<rangle\>>=<frac|b
    <around|(|-1|)><rsup|n+1>**n!<around|(|2*n+a-1|)>|<around|(|a|)><rsub|n>>\<centerdot\>
  </equation>

  This follows from using the Bessel polynomial's three term recurrence
  relation [2] and the fact that <math|\<mu\><rsub|0>=-b>.

  <with|font-series|bold|Special cases.> The instances where <math|a=b=2> and
  <math|a=b=1> are of historical importance.\ 

  <\example>
    When <math|a=b=2>, the moments are given by
    <math|\<mu\><rsub|n>=<around|(|-2|)><rsup|n+1>*<around|(|n+1|)>>! and
    thus

    <\equation>
      \<psi\><around|(|\<beta\>|)>-\<psi\><around|(|\<alpha\>|)>=lim<rsub|\<epsilon\>\<to\>0>
      <frac|-1|\<pi\>>*<big|int><rsub|\<alpha\>><rsup|\<beta\>>e<rsup|-<frac|x|x<rsup|2>+\<epsilon\><rsup|2>>>*sin
      <around*|[|<frac|2*\<epsilon\>|x<rsup|2>+\<epsilon\><rsup|2>>|]>*d*x
    </equation>

    Then

    <\equation>
      <around|\<langle\>|y<rsub|n>,y<rsub|m>,\<psi\>|\<rangle\>>=<choice|<tformat|<table|<row|<cell|0>|<cell|<text|if
      >n\<neq\>m>>|<row|<cell|<frac|2\<nospace\><around|(|-1|)><rsup|n+1>*|2*n+1>>|<cell|<text|if
      >n=m>>>>>
    </equation>
  </example>

  <\example*>
    When <math|a=b=1>, the moments are given by

    <\equation>
      \<mu\><rsub|n>=<around|(|-1|)><rsup|n+1>*n!
    </equation>

    \ and therefore

    <\equation>
      \<psi\><around|(|\<beta\>|)>-\<psi\><around|(|\<alpha\>|)>=lim<rsub|\<epsilon\>\<to\>0>
      <frac|1|\<pi\>>*<big|int><rsub|\<alpha\>><rsup|\<beta\>>e<rsup|-<frac|x|x<rsup|2>+\<epsilon\><rsup|2>>><around*|[|*<frac|\<varepsilon\>
      cos<around*|(|<frac|\<epsilon\>|x<rsup|2>+\<epsilon\><rsup|2>>|)>|x<rsup|2>+\<varepsilon\><rsup|2>>-<frac|x
      sin <around*|(|<frac|\<epsilon\>|x<rsup|2>+\<epsilon\><rsup|2>>|)>|x<rsup|2>+\<epsilon\><rsup|2>>|]>*d*x
    </equation>

    Then

    <\equation>
      <around|\<langle\>|y<rsub|n>y<rsub|m>,\<psi\>|\<rangle\>>=<choice|<tformat|<table|<row|<cell|0>|<cell|<text|if
      >n\<neq\>m>>|<row|<cell|<frac|<around|(|-1|)><rsup|n+1>|2>>|<cell|<text|if
      >n=m>>>>>
    </equation>
  </example*>

  <\bibliography|bib|tm-plain|refs2>
    <\bib-list|1>
      <bibitem*|1><label|bib-theBesselPolynomialMoments>A.M.<nbsp>Krall.
      <newblock>The besel polynomial moment problem.
      <newblock><with|font-shape|italic|Acta Mathematica Academiae
      Scientiarum Hungarica>, 38:105\U107, 1981.<newblock>
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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|5|2>>
    <associate|auto-3|<tuple|13|3>>
    <associate|bib-theBesselPolynomialMoments|<tuple|1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      theBesselPolynomialMoments
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.
      Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>