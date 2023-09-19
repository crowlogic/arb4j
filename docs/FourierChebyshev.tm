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
    <math|<around*|(|-1,1|)>>>|]>>>|<row|<cell|>|<cell|=<frac|i*|y>*<around*|(|<math-up|e><rsup|<math-up|-
    i>\<cdot\>y><rsub|>*<rsub|3>F<rsub|1><space|-0.17em><around*|(|<around|[|1,m,-m|]>,<around*|[|<frac|1|2>|]>,<frac|<math-up|i>|2*y>|)>-<math-up|e><rsup|<math-up|i>\<cdot\>y><around|(|-1|)><rsup|m><rsub|>*<rsub|3>F<rsub|1><space|-0.17em><around*|(|<around|[|1,m,-m|]>,<around*|[|<frac|1|2>|]>,-<frac|<math-up|i>|2*y>|)>|)>>>>>>
  </equation>

  where the Fourier duality is demonstrated by the inverse transform

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<wide|T|^><rsub|n><around|(|y|)>d*y=T<rsub|n><around|(|x|)>
  </equation>

  Apply the Gram-Schmidt process to <math|<wide|T<rsub|n>|^>> to get
  <math|<wide|T|^><rsub|n,<text|ortho>>> then the limits of the
  orthogonalized Fourier transforms <math|<wide|T|^><rsub|n,<text|ortho>><around|(|\<lambda\>|)>>
  at y=0 are given

  <\equation>
    lim<rsub|y\<rightarrow\>0> <wide|T|^><rsub|n,<text|ortho>><around|(|\<lambda\>|)>=-<frac|<math-up|e><rsup|-2\<cdot\><math-up|I>\<cdot\>n\<cdot\>\<pi\>>+<math-up|e><rsup|<with|math-font-family|rm|-I>\<cdot\>n\<cdot\>\<pi\>>|2\<cdot\><sqrt|\<pi\>>\<cdot\><sqrt|<frac|<math-up|e><rsup|<math-up|I>\<cdot\>n\<cdot\>\<pi\>>\<cdot\><around*|(|2\<cdot\>n<rsup|2>-1|)>|4\<cdot\>n<rsup|2>-1>>\<cdot\><around|\||n<rsup|2>-1|\|>>\<forall\>n\<geqslant\>3
  </equation>
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