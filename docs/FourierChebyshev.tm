<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Orthogonal Polynomials Related to The Bessel Functions
  <math|J<rsub|0>,J<rsub|1>> And The First-Kind Chebyshev
  Polynomials>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  Let <math|T<rsub|n>> be the Chebyshev polynomials of the first kind. The
  Fourier transforms <math|<wide|T|^><rsub|n><around|(|y|)>> of
  <math|T<rsub|n><around*|(|x|)>> are given by\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|T|^><rsub|n><around|(|y|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
    y>*T<rsub|n><around|(|x|)>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|-1><rsup|1>e<rsup|-i*x
    y>*T<rsub|n><around|(|x|)>d*x<space|2em><around*|[|<text|due to
    <math|T<rsub|n>> being 0 outside the interval
    <math|<around*|(|-1,1|)>>>|]>>>|<row|<cell|>|<cell|=<frac|i*|y>*<around*|(|<math-up|e><rsup|<math-up|-i>y><rsub|>F<rsup|+><rsub|n><around*|(|y|)>-<math-up|e><rsup|<math-up|i>y><around|(|-1|)><rsup|n><rsub|>F<rsub|n><rsup|-><around*|(|y|)>|)>>>>>>
  </equation>

  where

  <\equation>
    F<rsub|m><rsup|\<pm\>><around*|(|y|)>=*<rsub|3>F<rsub|1><space|-0.17em><around*|(|<around|[|1,m,-m|]>,<around*|[|<frac|1|2>|]>,<frac|<math-up|<math|\<pm\>>>i
    y|2*>|)>
  </equation>

  and the Fourier duality is demonstrated by the inverse transform

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<wide|T|^><rsub|n><around|(|y|)>d*y=T<rsub|n><around|(|x|)>
  </equation>

  This isn't too surprising given that <math|T<rsub|n><around*|(|x|)>> is
  actually a hypergeometric function defined by

  <\equation>
    T<rsub|n><around*|(|x|)>=<rsub|>\<#2082\>F\<#2081\><around*|(|<around*|[|n,-n|]>,<around*|[|<frac|1|2>|]>,<frac|1|2>-<frac|x|2>|)>
  </equation>

  Apply the Gram-Schmidt process to <math|<wide|T<rsub|n>|^>> to get
  <math|<wide|T|^><rsub|n,<text|ortho>>> then the limits of the
  orthogonalized Fourier transforms <math|<wide|T|^><rsub|n,<text|ortho>><around|(|\<lambda\>|)>>
  at y=0 are given

  <\equation>
    lim<rsub|y\<rightarrow\>0> <wide|T|^><rsub|n,<text|ortho>><around|(|\<lambda\>|)>=-<frac|<math-up|e><rsup|-2\<cdot\><math-up|I>\<cdot\>n\<cdot\>\<pi\>>+<math-up|e><rsup|<with|math-font-family|rm|-I>\<cdot\>n\<cdot\>\<pi\>>|2\<cdot\><sqrt|\<pi\>>\<cdot\><sqrt|<frac|<math-up|e><rsup|<math-up|I>\<cdot\>n\<cdot\>\<pi\>>\<cdot\><around*|(|2\<cdot\>n<rsup|2>-1|)>|4\<cdot\>n<rsup|2>-1>>\<cdot\><around|\||n<rsup|2>-1|\|>>\<forall\>n\<geqslant\>3
  </equation>

  \;

  \;

  TODO: <cite|esgpz>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-esgpz>N.<nbsp>Donald Ylvisaker. <newblock>The
      Expected Number of Zeros of a Stationary Gaussian Process.
      <newblock><with|font-shape|italic|The Annals of Mathematical
      Statistics>, 36(3):1043\U1046, 1965.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-even-footer|>
    <associate|page-even-header|>
    <associate|page-height|auto>
    <associate|page-medium|papyrus>
    <associate|page-odd-footer|>
    <associate|page-odd-header|>
    <associate|page-orientation|portrait>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|5|?>>
    <associate|bib-esgpz|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      esgpz
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>