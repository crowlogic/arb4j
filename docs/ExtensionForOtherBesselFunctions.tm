<TeXmacs|2.1.4>

<style|generic>

<\body>
  This is not central to what I want to convey and needs some cleaning up so
  setting it aside here for now

  <\theorem>
    Let <math|\<psi\><rsub|n><around|(|y|)>> be

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<psi\><rsub|n><around|(|y|)>>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>>>>
    </equation>

    where <math|J> is the Bessel function of the first kind and <math|j> is a
    spherical Bessel function of the first kind then

    <\equation>
      <tabular|<tformat|<table|<row|<cell|J<rsub|0><around*|(|x|)>>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>>\<psi\><rsub|n><around*|(|x|)><big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around*|(|x|)>\<psi\><rsub|n><around*|(|x|)>\<mathd\>x>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>>\<psi\><rsub|n><around*|(|x|)><sqrt|<frac|2n+<frac|1|2>|\<pi\>>><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|n+1|)><rsup|2>>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|x|)><sqrt|<frac|2n+<frac|1|2>|\<pi\>>><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|n+1|)><rsup|2>>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)><sqrt|<frac|2n+<frac|1|2>|\<pi\>>><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|n+1|)><rsup|2>>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>><sqrt|<frac|2n+<frac|1|2>|\<pi\>>><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|n>*<sqrt|<frac|<around*|(|4*n+1|)>
      \<pi\><around*|(|2n+<frac|1|2>|)>|\<pi\><around*|(|2*y|)>\<pi\>>><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|n>*<sqrt|<frac|<around*|(|4*n+1|)>
      <around*|(|2n+<frac|1|2>|)>|\<pi\>2*y>><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|n>*<sqrt|<frac|<around*|(|4*n+1|)>
      <around*|(|4n+1|)>|\<pi\>*y>><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|n>*<sqrt|<frac|<around*|(|4*n+1|)>
      <rsup|2>|\<pi\>*y>><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|n>*<around*|(|<frac|4*n+1|2*<sqrt|\<pi\>
      y>>|)><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|\<infty\>><around|(|-1|)><rsup|n>*<around*|(|<frac|2*n+<frac|1|2>|*<sqrt|\<pi\>
      y>>|)><frac|\<Gamma\><around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\><around*|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>>>>
    </equation>

    where the convergence is uniform <math|\<forall\>x\<in\>\<bbb-C\>> and
    furthermore <math|\<psi\><rsub|n><around*|(|x|)>> are orthnormal over
    <math|<around*|[|0,\<infty\>|]>> with the <math|L<rsup|2>> inner product
    relative to the Lebesgue measure

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|m><around*|(|t|)>\<psi\><rsub|n><around*|(|t|)>\<mathd\>t=\<delta\><rsub|m,n>=<choice|<tformat|<table|<row|<cell|1>|<cell|m=n>>|<row|<cell|0>|<cell|m\<neq\>n>>>>>
    </equation>
  </theorem>

  <subsection|Application of Besel Function Identities>

  \;

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

    \;

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
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|Tadd|<tuple|10|2>>
    <associate|Taddition|<tuple|4|1>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|11|3>>
    <associate|bib-finiteFourierTransforms|<tuple|2|3>>
    <associate|bib-gaussianProcessIntroduction|<tuple|4|3>>
    <associate|bib-modifiedLommelPolynomials|<tuple|3|3>>
    <associate|bib-onCompactOperators|<tuple|1|3>>
    <associate|conv|<tuple|5|2>>
    <associate|dualBasis|<tuple|9|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc>Application of Besel Function
      Identities <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>