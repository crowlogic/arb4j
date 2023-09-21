<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Orthogonal Polynomials Related to The Bessel Functions
  <math|J<rsub|0>,J<rsub|1>> And The First-Kind Chebyshev
  Polynomials>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|The normalized Fourier transforms of the Chebyshev
  polynomials of the first kind are <math|\<#2083\>F\<#2081\>> hypergeometric
  functions.>>

  Let <math|T<rsub|n>> be the Chebyshev polynomials of the first
  kind<cite-detail|ArfkenWeber2005|(13.140)>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|T<rsub|n><around*|(|x|)>>|<cell|=<rsub|>\<#2082\>F\<#2081\><around*|(|<around*|[|n,-n|]>,<around*|[|<frac|1|2>|]>,<frac|1|2>-<frac|x|2>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<wide|T|^><rsub|n><around|(|y|)>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<frac|i*|y>*<around*|(|<math-up|e><rsup|<math-up|-i>y><rsub|>F<rsup|+><rsub|n><around*|(|y|)>-<math-up|e><rsup|<math-up|i>y><rsub|><around|(|-1|)><rsup|n><rsub|>F<rsub|n><rsup|-><around*|(|y|)>|)>d*y>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*x
    y>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*y
    z>*T<rsub|n><around|(|z|)>d*z d*y>>>>>
  </equation>

  where <math|\<#2082\>F\<#2081\>> is the (Gauss) hypergeometric function and
  the <math|<wide|T|^><rsub|n><around|(|y|)>> are the Fourier transforms
  <math|> of <math|T<rsub|n><around*|(|x|)>> given by\ 

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<wide|T|^><rsub|n><around|(|y|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
    y>*T<rsub|n><around|(|x|)>d*y=<big|int><rsub|-1><rsup|1>e<rsup|-i*x
    y>*T<rsub|n><around|(|x|)>d*x>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*x
    y>*<rsub|>\<#2082\>F\<#2081\><around*|(|<around*|[|n,-n|]>,<around*|[|<frac|1|2>|]>,<frac|1|2>-<frac|x|2>|)>d*x>>|<row|<cell|>|<cell|=<frac|i*|y>*<around*|(|<math-up|e><rsup|<math-up|-i>y><rsub|>F<rsup|+><rsub|n><around*|(|y|)>-<math-up|e><rsup|<math-up|i>y><around|(|-1|)><rsup|n><rsub|>F<rsub|n><rsup|-><around*|(|y|)>|)>>>>>>
  </equation>

  where

  <\equation>
    F<rsub|m><rsup|\<pm\>><around*|(|y|)>=\<#2083\>F\<#2081\>
    <space|-0.17em><around*|(|<around|[|1,m,-m|]>,<around*|[|<frac|1|2>|]>,<frac|<math-up|<math|\<pm\>>>i
    y|2*>|)>
  </equation>

  Apply the Gram-Schmidt process to <math|<wide|T<rsub|n>|^>> to get
  <math|<wide|T|^><rsub|ortho,n>> then the limits of the orthogonalized
  Fourier transforms <math|<wide|T|^><rsub|<text|ortho,n>><around|(|\<lambda\>|)>>
  at y=0 are given

  <\equation>
    lim<rsub|y\<rightarrow\>0> <wide|T|^><rsub|ortho,n><around|(|\<lambda\>|)>=<choice|<tformat|<table|<row|<cell|<frac|1|<sqrt|\<pi\>>>>|<cell|n=0>>|<row|<cell|0>|<cell|n\<neq\>0>>>>>
  </equation>

  TODO: <cite|esgpz>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|2>
      <bibitem*|1><label|bib-ArfkenWeber2005>G.<nbsp>Arfken<localize| and
      >H.<nbsp>Weber. <newblock><with|font-shape|italic|Mathematical Methods
      for Physicists>. <newblock>Elsevier AP, Boston, 6th<localize| edition>,
      2005.<newblock>

      <bibitem*|2><label|bib-esgpz>N.<nbsp>Donald Ylvisaker. <newblock>The
      Expected Number of Zeros of a Stationary Gaussian Process.
      <newblock><with|font-shape|italic|The Annals of Mathematical
      Statistics>, 36(3):1043\U1046, 1965.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1>
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
    <associate|auto-1|<tuple|4|1>>
    <associate|bib-ArfkenWeber2005|<tuple|1|?>>
    <associate|bib-esgpz|<tuple|2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ArfkenWeber2005

      esgpz
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>