<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  \;

  <section*|1. Introduction>

  Since 1949 when the Bessel polynomials appeared, a hunt has been on to find
  a weight function <math|\<psi\>>, defined on the real axis, with respect to
  which the polynomials would be orthogonal. Although at least two devices
  have been found which formally seem to fill the role of orthogonality
  generation, none was expressible in terms of integration on the real axis.

  The purpose of this paper is to show that the Bessel polynomials
  <math|y<rsub|n><around|(|x,a,b|)>> are orthogonal with respect to the
  distribution <math|\<psi\>>, given by

  <\equation>
    <around|\<langle\>|f,\<psi\>|\<rangle\>>=lim<rsub|\<varepsilon\>\<to\>0>
    <frac|1|\<pi\>>*<big|int><rsub|\<alpha\>><rsup|\<beta\>>f<around|(|x|)>*<text|Im><around|{|<around|(|-<frac|b|x+i*\<varepsilon\>>|)>*F<rsub|1,1><around|(|a,-<frac|b|x+i*\<varepsilon\>>|)>|}>*d*x\<forall\>\<alpha\>\<less\>0,\<beta\>\<gtr\>0
  </equation>

  The key to showing that the above formula is valid is through the moments
  associated with the Bessel polynomials

  <\equation>
    \<mu\><rsub|n>=<frac|<around|(|-b|)><rsup|n+1>|<around|(|a|)><rsub|n>><space|1em><space|1em>
  </equation>

  where <math|<around|(|a|)><rsub|n>=a*<around|(|a+1|)>*\<ldots\>*<around|(|a+n-1|)>\<forall\>><math|n=0,1,\<ldots\>>,
  which were discovered in <cite|2> by examining the differential equation
  satisfied by the Bessel polynomials. It is well known that, given the
  moments <math|\<mu\><rsub|n>>, there exists a function of a complex
  variable <math|f<around|(|z|)>>, called the Cauchy representation, given by

  <\equation*>
    f<around|(|z|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|\<mu\><rsub|n>|z<rsup|n+1>>
  </equation*>

  when the support of the weight function is compact, and in general
  satisfying

  <\equation>
    lim<rsub|z\<to\>\<infty\>> z<rsup|k+1>*<around*|[|f<around|(|z|)>+<big|sum><rsub|n=0><rsup|k><frac|\<mu\><rsub|n>|z<rsup|n+1>>|]>=-\<mu\><rsub|k>
    \<forall\>\<delta\>\<less\><text|arg >z\<less\>\<pi\>-\<delta\>\<exists\>\<delta\>\<in\><around*|(|0,<frac|\<pi\>|2>|)>
    </equation>

  For the Bessel polynomials it is easy to see that

  <\equation*>
    f<around|(|z|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-<frac|b|z>|)><rsup|n+1>|<around|(|a|)><rsub|n>>=<around|(|-<frac|b|z>|)>*<rsub|1>F<rsub|1><around|(|a,-<frac|b|z>|)>
  </equation*>

  <\bibliography|bib|tm-plain|refs2>
    \;
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_23.tm>>
    <associate|auto-2|<tuple|3|?|../../.TeXmacs/texts/scratch/no_name_23.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      2

      2
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.
      Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>