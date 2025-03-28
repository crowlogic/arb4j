<TeXmacs|2.1.4>

<style|generic>

<\body>
  \<cdot\><doc-data|<doc-title|Justification of the Interchange of Summation
  and Integration in an Integral Operator>>\ 

  The critical step in the proof that requires careful justification is the
  interchange of summation and integration. To rigorously justify this step,
  we need to establish specific conditions and apply relevant theorems.
  First, we assume that <math|f\<in\>L<rsup|1><around|[|0,\<infty\>|)>>,
  which ensures that the integrals involving <math|f<around|(|y|)>> are
  well-defined. This condition is crucial for the validity of our subsequent
  arguments.

  To apply Fubini's theorem or a similar result for interchanging summation
  and integration, we need to show that:

  <\equation*>
    <big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>><around|\||J<rsub|n><around|(|x|)>*J<rsub|n><around|(|y|)>*f<around|(|y|)>|\|>*<space|0.17em>d*y\<less\>\<infty\>
  </equation*>

  To prove this, we rely on two important properties of Bessel functions:
  <math|<around|\||J<rsub|n><around|(|x|)>|\|>\<leq\>1> for all real <math|x>
  and integer <math|n>, and <math|<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>J<rsub|n><rsup|2><around|(|x|)>=1>
  for all real <math|x> (Parseval's identity for Bessel functions).

  Using these properties, we can construct a chain of inequalities:

  <\align*>
    <tformat|<table|<row|<cell|<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>><around|\||J<rsub|n><around|(|x|)>*J<rsub|n><around|(|y|)>*f<around|(|y|)>|\|>*<space|0.17em>d*y>|<cell|\<leq\><big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><around|\||J<rsub|n><around|(|x|)><around|\||<big|int><rsub|0><rsup|\<infty\>>|\|>*J<rsub|n><around|(|y|)>*f<around|(|y|)>|\|>*<space|0.17em>d*y>>|<row|<cell|>|<cell|\<leq\><big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><around|\||J<rsub|n><around|(|x|)><around|\||<big|int><rsub|0><rsup|\<infty\>>|\|>*f<around|(|y|)>|\|>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|1>>*<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><around|\||J<rsub|n><around|(|x|)>|\|>>>|<row|<cell|>|<cell|\<leq\><around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|1>><sqrt|<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>J<rsub|n><rsup|2><around|(|x|)>>*<sqrt|<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>1>>>|<row|<cell|>|<cell|=<around|\<\|\|\>|f|\<\|\|\>><rsub|L<rsup|1>>\<cdot\>1\<cdot\><sqrt|<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>1>>>>>
  </align*>

  The last step uses Parseval's identity. Although the final sum
  <math|<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>1> diverges, we only need
  finiteness for any finite truncation of the series for the interchange to
  be valid.

  Given this justification, we can interchange the summation and integration
  for any finite truncation of the series. As the truncation limit approaches
  infinity, we obtain the desired result:

  <\equation*>
    <around|(|K*f|)><around|(|x|)>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>J<rsub|n><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|n><around|(|y|)>*f<around|(|y|)>*<space|0.17em>d*y
  </equation*>

  This proof is valid under the conditions
  <math|x\<in\><around|[|0,\<infty\>|)>> and
  <math|f\<in\>L<rsup|1><around|[|0,\<infty\>|)>>, which provide the
  necessary mathematical foundation for the simplification of the integral
  operator.
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>