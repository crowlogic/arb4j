<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Gaussian Quadrature via Jacobi
  Polynomials>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  Numerical integration is a key aspect of computational mathematics, where
  Gaussian quadrature methods stand out due to their efficiency. These
  methods are intricately linked to Jacobi polynomials and their special and
  limit cases, including Legendre, Chebyshev, Laguerre, and Hermite
  polynomials. This article provides a detailed mathematical overview of
  these relationships and their applications in Gaussian quadrature.

  <section|Jacobi Polynomials>

  Jacobi polynomials <math|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>
  are a class of orthogonal polynomials on the interval
  <math|<around|[|-1,1|]>> defined by the weight function
  <math|<around|(|1-x|)><rsup|\<alpha\>>*<around|(|1+x|)><rsup|\<beta\>>>,
  where <math|\<alpha\>,\<beta\>\<gtr\>-1>. They are given by the Rodrigues'
  formula:

  <\equation>
    P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<frac|<around|(|-1|)><rsup|n>|2<rsup|n>*n!>*<around|(|1-x|)><rsup|-\<alpha\>>*<around|(|1+x|)><rsup|-\<beta\>>*<frac|d<rsup|n>|d*x<rsup|n>>*<around*|[|<around|(|1-x|)><rsup|\<alpha\>+n>*<around|(|1+x|)><rsup|\<beta\>+n>|]><text|>
  </equation>

  <section|Special Cases of Jacobi Polynomials>

  <subsection|Legendre Polynomials>

  For <math|\<alpha\>=\<beta\>=0>, Jacobi polynomials simplify to Legendre
  polynomials:

  <\equation>
    P<rsub|n><around|(|x|)>=P<rsub|n><rsup|<around|(|0,0|)>><around|(|x|)>=<frac|1|2<rsup|n>>*<frac|d<rsup|n>|d*x<rsup|n>><around*|[|<around|(|x<rsup|2>-1|)><rsup|n>|]>
  </equation>

  <subsection|Chebyshev Polynomials>

  Chebyshev polynomials of the first kind <math|T<rsub|n><around|(|x|)>> and
  second kind <math|U<rsub|n><around|(|x|)>> are obtained by:

  <\align*>
    <tformat|<table|<row|<cell|T<rsub|n><around|(|x|)>>|<cell|=lim<rsub|\<alpha\>\<to\>-<frac|1|2>>
    <frac|P<rsub|n><rsup|<around|(|\<alpha\>,\<alpha\>|)>><around|(|x|)>|P<rsub|n><rsup|<around|(|\<alpha\>,\<alpha\>|)>><around|(|1|)>>=cos
    <around|(|n*arccos x|)>>>|<row|<cell|U<rsub|n><around|(|x|)>>|<cell|=<frac|<around|(|n+1|)>|2>*P<rsub|n><rsup|<around|(|<frac|1|2>,<frac|1|2>|)>><around|(|x|)>=<frac|sin
    <around|(|<around|(|n+1|)>*arccos x|)>|sin <around|(|arccos x|)>>>>>>
  </align*>

  <section|Limiting Processes for Laguerre and Hermite Polynomials>

  <subsection|Laguerre Polynomials>

  Laguerre polynomials <math|L<rsub|n><around|(|x|)>> are derived from Jacobi
  polynomials through the limit:

  <\equation>
    L<rsub|n><around|(|x|)>=lim<rsub|\<alpha\>\<to\>\<infty\>>
    <frac|P<rsub|n><rsup|<around|(|\<alpha\>,0|)>><around*|(|<frac|x-1|\<alpha\>>|)>|P<rsub|n><rsup|<around|(|\<alpha\>,0|)>>*<around|(|-1|)>>=<frac|e<rsup|x>|n!>*<frac|d<rsup|n>|d*x<rsup|n>>*<around|(|e<rsup|-x>*x<rsup|n>|)>
  </equation>

  <subsection|Hermite Polynomials>

  Hermite polynomials <math|H<rsub|n><around|(|x|)>> are derived in a similar
  fashion:

  <\equation>
    H<rsub|n><around|(|x|)>=lim<rsub|\<alpha\>\<to\>\<infty\>>
    2<rsup|-n>*P<rsub|n><rsup|<around|(|\<alpha\>,-<frac|1|2>|)>><around*|(|<frac|x|<sqrt|2*\<alpha\>>>|)>=<around|(|-1|)><rsup|n>*e<rsup|x<rsup|2>>*<frac|d<rsup|n>|d*x<rsup|n>>*e<rsup|-x<rsup|2>>
  </equation>

  <section|Gaussian Quadrature Methods>

  <subsection|Gauss-Legendre Quadrature>

  <item>Quadrature Formula:

  <\equation>
    <big|int><rsub|-1><rsup|1>f<around|(|x|)>*<space|0.17em>d*x\<approx\><big|sum><rsub|i=1><rsup|n>w<rsub|i>*f<around|(|x<rsub|i>|)>
  </equation>

  \ where <math|x<rsub|i>> are the roots of <math|P<rsub|n><around|(|x|)>>
  and <math|w<rsub|i>> are the weights.

  <item>Error Bound: Given by\ 

  <\equation>
    E<rsub|n><around|(|f|)>=<frac|2<rsup|2*n+1><around|(|n!|)><rsup|4>|<around|(|2*n+1|)><around|[|<around|(|2*n|)>!|]><rsup|3>>*f<rsup|<around|(|2*n|)>><around|(|\<xi\>|)>
  </equation>

  <math|> for some <math|\<xi\>> in <math|<around|[|-1,1|]>>.

  <subsection|Gauss-Chebyshev Quadrature>

  <\itemize>
    <item>Quadrature Formula:

    <\equation>
      <big|int><rsub|-1><rsup|1><frac|f<around|(|x|)>|<sqrt|1-x<rsup|2>>>*d*x\<approx\><frac|\<pi\>|n>*<big|sum><rsub|i=1><rsup|n>f<around|(|x<rsub|i>|)><text|>
    </equation>

    where <math|x<rsub|i>> are the roots of <math|T<rsub|n><around|(|x|)>>.

    <item>Error Bound: Depends on the behavior of <math|f<around|(|x|)>>
    around the roots of <math|T<rsub|n><around|(|x|)>>
  </itemize>

  <subsection|Gauss-Laguerre Quadrature>

  <\itemize>
    <item>Quadrature Formula <math|>

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>e<rsup|-x>*f<around|(|x|)>*d*x\<approx\><big|sum><rsub|i=1><rsup|n>w<rsub|i>*f<around|(|x<rsub|i>|)>
    </equation>

    <item>where <math|x<rsub|i>> are the roots of
    <math|L<rsub|n><around|(|x|)>> and <math|w<rsub|i>> are the weights.

    <item>Error Bound: Similar in nature to Gauss-Legendre but for functions
    over <math|<around|[|0,\<infty\>|)>>
  </itemize>

  <subsection|Gauss-Hermite Quadrature>

  <\itemize>
    <item>Quadrature Formula:\ 

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-x<rsup|2>>*f<around|(|x|)>*d*x\<approx\><big|sum><rsub|i=1><rsup|n>w<rsub|i>*f<around|(|x<rsub|i>|)>
    </equation>

    where <math|x<rsub|i>> are the roots of <math|H<rsub|n><around|(|x|)>>
    and <math|w<rsub|i>> are the weights.

    <item>Error Bound: Suitable for functions on
    <math|<around|(|-\<infty\>,\<infty\>|)>> with a Gaussian weigh
  </itemize>

  <section|Conclusion>

  The exploration of Gaussian quadrature methods through the lens of Jacobi
  polynomials and their special and limit cases provides a rich and nuanced
  understanding of numerical integration. These methods are pivotal in
  computational mathematics, offering precise and efficient ways to
  approximate definite integrals.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-10|<tuple|5.1|2|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-11|<tuple|5.2|2|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-12|<tuple|5.3|3|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-13|<tuple|5.4|3|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-14|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-4|<tuple|3.1|1|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-5|<tuple|3.2|1|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-6|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-7|<tuple|4.1|2|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-8|<tuple|4.2|2|../../.TeXmacs/texts/scratch/no_name_20.tm>>
    <associate|auto-9|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_20.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Jacobi
      Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Special
      Cases of Jacobi Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Legendre Polynomials
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Chebyshev Polynomials
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Limiting
      Processes for Laguerre and Hermite Polynomials>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Laguerre Polynomials
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Hermite Polynomials
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Gaussian
      Quadrature Methods> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Gauss-Legendre Quadrature
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Gauss-Chebyshev Quadrature
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|5.3<space|2spc>Gauss-Laguerre Quadrature
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|5.4<space|2spc>Gauss-Hermite Quadrature
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>