<TeXmacs|2.1.1>

<style|<tuple|generic|parchment|mathematica>>

<\body>
  <doc-data|<doc-title|The Complex Dynamics Of The Hyperbolic Tangent of The
  Logarithm of One Minus <math|t> Squared>|<doc-author|<author-data|<author-name|<math|\<Sigma\>\<tau\>\<varepsilon\>\<pi\>\<eta\>\<varepsilon\>\<nu\>>
  <math|\<Sigma\> \<rho\> \<omicron\> \<omega\> \<lambda\> \<varepsilon\>
  \<psi\>> \<less\>stephencrowley214@gmail.com\<gtr\>>>>>

  \;

  <section|The S Function>

  Let the rational meromorphic quartic with a double-root at the origin and
  simple roots at <math|\<pm\><sqrt|2>> be defined by

  <\equation>
    <tabular|<tformat|<table|<row|<cell|S<around*|(|t|)>>|<cell|=tanh<around*|(|ln<around*|(|1-t<rsup|2>|)>|)>>>|<row|<cell|>|<cell|=<frac|<around*|(|1-t<rsup|2>|)><rsup|2>-1|*<around*|(|1+t<rsup|2>|)><rsup|2>+1>>>>>>
  </equation>

  There are 4 inverse branches of <math|S<around*|(|t|)>> given by

  <\equation>
    S<rsup|-1><around*|(|y|)>=<around*|{|t:S<around*|(|t|)>=y|}>=\<pm\><sqrt|<frac|y-1\<pm\><sqrt|1-y<rsup|2>>|y-1>>
  </equation>

  \;

  The transfer operator of <math|S<around*|(|t|)>> is defined by

  <\equation>
    <tabular|<tformat|<cwith|2|2|1|-1|font-base-size|8>|<cwith|2|3|2|2|font-base-size|8>|<table|<row|<cell|<around*|[|\<cal-T\><rsub|S>f|]><around*|(|y|)>>|<cell|=<big|sum><rsub|<around*|{|t:S<around*|(|t|)>=y|}>><frac|f<around*|(|t|)>|<around*|\||<wide|S|\<dot\>><around*|(|t|)>|\|>>>>|<row|<cell|>|<cell|=<frac|f<around*|(|<sqrt|<frac|y-1+<sqrt|1-y<rsup|2>>|y-1>>|)>|<around*|\||<wide|S|\<dot\>><around*|(|<sqrt|<frac|y-1+<sqrt|1-y<rsup|2>>|y-1>>|)>|\|>>+<frac|f<around*|(|-<sqrt|<frac|y-1-<sqrt|1-y<rsup|2>>|y-1>>|)>|<around*|\||<wide|S|\<dot\>><around*|(|-<sqrt|<frac|y-1-<sqrt|1-y<rsup|2>>|y-1>>|)>|\|>>+<frac|f<around*|(|<sqrt|<frac|y-1-<sqrt|1-y<rsup|2>>|y-1>>|)>|<around*|\||<wide|S|\<dot\>><around*|(|<sqrt|<frac|y-1-<sqrt|1-y<rsup|2>>|y-1>>|)>|\|>>+<frac|f<around*|(|-<sqrt|<frac|y-1+<sqrt|1-y<rsup|2>>|y-1>>|)>|<around*|\||<wide|S|\<dot\>><around*|(|-<sqrt|<frac|y-1+<sqrt|1-y<rsup|2>>|y-1>>|)>|\|>>>>|<row|<cell|>|<cell|<with|font-base-size|9|=<frac|f<around*|(|<sqrt|<frac|y-1+<sqrt|1-y<rsup|2>>|y-1>>|)>+f<around*|(|-<sqrt|<frac|y-1-<sqrt|1-y<rsup|2>>|y-1>>|)>|<around*|\||2
    <sqrt|y-1><sqrt|1-y<rsup|2>><sqrt|1-y+<sqrt|1-y<rsup|2>>>|\|>>+<frac|f<around*|(|<sqrt|<frac|y-1-<sqrt|1-y<rsup|2>>|y-1>>|)>+f<around*|(|-<sqrt|<frac|y-1+<sqrt|1-y<rsup|2>>|y-1>>|)>|<around*|\||2
    <sqrt|y-1><sqrt|1-y<rsup|2>><sqrt|y-1+<sqrt|1-y<rsup|2>>>|\|>>>>>|<row|<cell|>|<cell|>>>>>
  </equation>
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
    <associate|auto-1|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      S Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>