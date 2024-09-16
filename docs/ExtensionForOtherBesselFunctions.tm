<TeXmacs|2.1.4>

<style|generic>

<\body>
  This is not central to what I want to convey and needs some cleaning up so
  setting it aside here for now.

  <section|Appendix>

  <subsection|Application of Besel Function Identities>

  <\conjecture>
    \;

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
    <associate|Tadd|<tuple|8|2>>
    <associate|Taddition|<tuple|5|1>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|9|2>>
    <associate|bib-finiteFourierTransforms|<tuple|2|2>>
    <associate|bib-gaussianProcessIntroduction|<tuple|4|2>>
    <associate|bib-modifiedLommelPolynomials|<tuple|3|2>>
    <associate|bib-onCompactOperators|<tuple|1|2>>
    <associate|conv|<tuple|6|1>>
    <associate|dualBasis|<tuple|7|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Application of Besel
      Function Identities <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>