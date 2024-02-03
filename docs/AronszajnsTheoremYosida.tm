<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white>>

<\body>
  <doc-data|<doc-title|Aronszajn's Theorem and the Bergman Kernel>>

  <\theorem>
    <with|font-series|bold|font-shape|right|Aronszajn's
    Theorem><cite-detail|functionalAnalysisYosida|III.9 Theorem 1 p.96>

    A Hilbert space <math|X> has a reproducing kernel <math|K> iff there
    exists, for any <math|y<rsub|0>\<in\>A>, a positive constant
    <math|C<rsub|y<rsub|0>>>, depending upon <math|y<rsub|0>>, such that

    <\equation>
      <around|\||f<around|(|y<rsub|0>|)>|\|>\<leq\>C<rsub|y<rsub|0>><around|\<\|\|\>|f|\<\|\|\>>*<space|1em><text|\<forall\>>f\<in\>X
    </equation>
  </theorem>

  <\proof>
    \;

    The "only if" part is proved by applying Schwarz' inequality to
    <math|f<around|(|y<rsub|0>|)>=<around|(|f,K|(>\<cdot\>,y<rsub|0>))>:

    <\equation>
      <around|\||f<around|(|y<rsub|0>|)>|\|>\<leq\><around|\<\|\|\>|f|\<\|\|\>>\<cdot\><around|\<\|\|\>|K|(>\<cdot\>,y<rsub|0>)\<\|\|\>,
    </equation>

    thus

    <\equation>
      <around|\||f<around|(|y<rsub|0>|)>|\|><rsup|2>\<leq\><around|\<\|\|\>|f|\<\|\|\>><rsup|2>\<cdot\><around|\<\|\|\>|K|(>\<cdot\>,y<rsub|0>)\<\|\|\><rsup|2>=<around|\<\|\|\>|f|\<\|\|\>><rsup|2>\<cdot\><around|(|K<around|(|y<rsub|0>,y<rsub|0>|)>|)>,
    </equation>

    so

    <\equation>
      <around|\||f<around|(|y<rsub|0>|)>|\|>\<leq\><around|\<\|\|\>|f|\<\|\|\>><sqrt|K<around|(|y<rsub|0>,y<rsub|0>|)>>
    </equation>

    The "if" part is proved by applying F. Riesz' representation theorem to
    the linear functional <math|F<rsub|y<rsub|0>><around|(|f|)>=f<around|(|y<rsub|0>|)>>
    of <math|f\<in\>X>. Thus, there exists a uniquely determined vector
    <math|g<rsub|y<rsub|0>><around|(|x|)>> of <math|X> such that

    <\equation>
      f<around|(|y<rsub|0>|)>=F<rsub|y<rsub|0>><around|(|f|)>=<around|(|f,g<rsub|y<rsub|0>><around|(|x|)>|)>\<forall\>f\<in\>X<label|fy0>
    </equation>

    and so <math|g<rsub|y<rsub|0>><around|(|x|)>=K<around|(|x,y<rsub|0>|)>>
    is a reproducing kernel of <math|X>. The proof shows that the reproducing
    kernel is uniquely determined.
  </proof>

  <\corollary>
    We have

    <\equation>
      sup <around|\||f<around|(|y<rsub|0>|)>|\|>=<sqrt|K<around|(|y<rsub|0>,y<rsub|0>|)>>,
    </equation>

    the supremum being attained by

    <\equation>
      f<rsub|0><around|(|x|)>=<frac|K<around|(|x,y<rsub|0>|)>|<around|\<\|\|\>|K|(>\<cdot\>,y<rsub|0>)\<\|\|\>><space|1em><text|with
      ><around|\<\|\|\>|f<rsub|0>|\<\|\|\>>=1.
    </equation>
  </corollary>

  <\proof>
    The equality in the Schwarz' inequality (4) holds iff
    <math|f<around|(|x|)>> and <math|K<around|(|x,y<rsub|0>|)>> are linearly
    dependent. From the two conditions <math|f<around|(|x|)>=\<alpha\>*K<around|(|x,y<rsub|0>|)>>
    and <math|<around|\<\|\|\>|f|\<\|\|\>>=1>, we obtain

    <\equation>
      1=\<alpha\><around|(|K<around|(|x,y<rsub|0>|)>,K|(>\<cdot\>,y<rsub|0>))<rsup|2>=<around|\||\<alpha\>|\|><rsup|2><around|(|K<around|(|y<rsub|0>,y<rsub|0>|)>|)><rsup|2>
    </equation>

    that is

    <\equation>
      <around|\||\<alpha\>|\|>=<frac|1|<sqrt|K<around|(|y<rsub|0>,y<rsub|0>|)>>>
    </equation>

    Hence the equality sign in (<reference|fy0>) is attained by
    <math|f<rsub|0><around|(|x|)>>.
  </proof>

  <\example>
    Consider the Hilbert space <math|A<rsup|2><around|(|G|)>>. For any
    <math|f\<in\>A<rsup|2><around|(|G|)>> and <math|z\<in\>G>, we have (see
    (4) in Chapter I, 9)

    <\equation>
      <around|\||f<around|(|z<rsub|0>|)>|\|><rsup|2>\<leq\>*<frac|<big|int><rsub|<around|\||z-z<rsub|0>|\|>\<leq\>r><around|\||f<around|(|z|)>|\|><rsup|2>*<space|0.17em>\<mathd\>x*\<mathd\>y|\<pi\>*r<rsup|2>>*<space|1em><around|(|z=x+i*y|)>
    </equation>

    Thus <math|A<rsup|2><around|(|G|)>> has the reproducing kernel which will
    be denoted by <math|K<rsub|G><around|(|z,z<rprime|'>|)>>. This
    <math|K<rsub|G><around|(|z,z<rprime|'>|)>> is called Bergman's kernel of
    the domain <math|G> of the complex plane.
  </example>

  <\bibliography|bib|tm-plain|../../../a/docs/refs2>
    <\bib-list|1>
      <bibitem*|1><label|bib-functionalAnalysisYosida><with|font|roman|\<#5409\>\<#7530\>
      \<#8015\>\<#4F5C\>>(K\<#14D\>saku Yosida).
      <newblock><with|font-shape|italic|Functional Analysis>.
      <newblock>Classics in Mathematics. Springer Berlin Heidelberg, Reprint
      of the 1980 Edition<localize| edition>, 1995.<newblock>
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
    <associate|auto-1|<tuple|10|2>>
    <associate|bib-functionalAnalysisYosida|<tuple|1|2>>
    <associate|fy0|<tuple|5|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      functionalAnalysisYosida
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>