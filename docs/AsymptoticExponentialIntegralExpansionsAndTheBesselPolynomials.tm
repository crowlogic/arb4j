<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Connection between Higher Order Exponential Integrals
  and Bessel Polynomials>>

  <section|Introduction>

  The higher order exponential integrals, denoted as
  <math|E<around|(|x,m,n|)>>, have a significant connection with Bessel
  polynomials. This document outlines the relationship and the intriguing
  patterns observed.

  <section|Asymptotic Expansion of E(x,m,n)>

  The general formula for the asymptotic expansion of
  <math|E<around|(|x,m,n|)>> is given by:

  <\equation>
    E<around|(|x,m,n|)><nbsp><frac|E<around|(|x,m-1,n+1|)>|x>-<frac|n*E<around|(|x,m-1,n+2|)>|x<rsup|2>>+<frac|n*<around|(|n+1|)>*E<around|(|x,m-1,n+3|)>|x<rsup|3>>-...
  </equation>

  where <math|m\<gtr\>=1> and <math|n\<gtr\>=1>.

  Using this formula and the asymptotic expansion of
  <math|E<around|(|x,2,n|)>>, we can determine:

  <\equation>
    E<around|(|x,3,n|)><nbsp><frac|e<rsup|-x>|x<rsup|3>>*<around|(|1-<frac|3+3*n|x>+<frac|11+18*n+6*n<rsup|2>|x<rsup|2>>-...|)>
  </equation>

  This formula leads to a specific triangle of coefficients.

  <section|Generating Functions and Bessel Polynomials>

  The ordinary generating functions (o.g.f.s.) of the right-hand columns of
  the triangles derived from the above expansion have a structure:

  <\equation>
    G*f<around|(|p|)>=<frac|W*3*<around|(|z,p|)>|<around|(|1-z|)><rsup|2*p+1>>
  </equation>

  Here, <math|p> is 1 for the first right-hand column, 2 for the second, and
  so on. The coefficients of the <math|W*3*<around|(|z,p|)>> polynomials form
  a triangle. For example:

  <\align>
    <tformat|<table|<row|<cell|W*3*<around|(|z,p=1|)>>|<cell|=<frac|1|<around|(|1-z|)><rsup|3>><eq-number>>>|<row|<cell|W*3*<around|(|z,p=2|)>>|<cell|=<frac|3+3*z|<around|(|1-z|)><rsup|5>><eq-number>>>|<row|<cell|W*3*<around|(|z,p=3|)>>|<cell|=<frac|11+28*z+6*z<rsup|2>|<around|(|1-z|)><rsup|7>><eq-number>>>|<row|<cell|W*3*<around|(|z,p=4|)>>|<cell|=<frac|50+225*z+135*z<rsup|2>+10*z<rsup|3>|<around|(|1-z|)><rsup|9>><eq-number>>>>>
  </align>

  The formula for the coefficients is:

  <\equation>
    a*<around|(|n,m|)>=<big|sum><rsub|k=0><rsup|m-1><around|(|-1|)><rsup|n+k+1><choose|m-k+1|2>*<choose|2n+1|k>S<around|(|m+n-k,m-k+1|)>
  </equation>

  where <math|1\<less\>=m\<less\>=n> and <math|S<around*|(|n,m|)>> is the
  Stirling numbers of the first kind which count the number of permutations
  of <math|n> symbols that have exactly <math|m> cycles.

  <section|Conclusion>

  The higher-order exponential integrals <math|E<around|(|x,m,n|)>> show a
  deep connection with the Bessel polynomials. This connection illuminates
  intriguing patterns and relationships between sequences in the OEIS.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_8.tm>>
    <associate|auto-4|<tuple|4|1|../../.TeXmacs/texts/scratch/no_name_8.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Asymptotic
      Expansion of E(x,m,n)> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Generating
      Functions and Bessel Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>