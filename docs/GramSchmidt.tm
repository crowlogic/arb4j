<TeXmacs|2.1.4>

<style|generic>

<\body>
  The Gram-Schmidt formula expresses the orthogonal complement
  <math|f<rsub|n><rsup|\<perp\>p><around|(|x|)>> of a function sequence
  <math|f<rsub|n><rsup|><around|(|x|)>> with respect to the orthogonality
  measure <math|p<around|(|x|)>> by the recursive equation

  <\equation>
    f<rsub|k><rsup|\<perp\>><around|(|x|)>=f<rsub|k><around|(|x|)>-<big|sum><rsub|j=1><rsup|k-1><frac|<around|\<langle\>|f<rsub|k>,f<rsub|j><rsup|\<perp\>p>|\<rangle\>>|<around|\<langle\>|f<rsub|j><rsup|\<perp\>p>,f<rsub|j><rsup|\<perp\>p>|\<rangle\>>>*f<rsub|j><rsup|\<perp\>p><around|(|x|)>
  </equation>

  where the inner product is defined as:

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>><rsub|p>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|x|)>*g<around|(|x|)>*p<around|(|x|)>*\<mathd\>*x
  </equation>

  where <math|><math|<around|\<langle\>|f,g|\<rangle\>>=<around|\<langle\>|f,g|\<rangle\>><rsub|1><rsub|>>
  and the normalized functions are denoted with a wide bar

  <\equation>
    <wide|f<rsub|k><rsup|\<perp\>>|\<bar\>><around|(|x|)>=<frac|f<rsub|k><rsup|\<perp\>><around|(|x|)>|<around|\<\|\|\>|f<rsub|k><rsup|\<perp\>>|\<\|\|\>>>=<frac|f<rsub|k><rsup|\<perp\>><around|(|x|)>|<sqrt|<around|\<langle\>|f<rsub|k><rsup|\<perp\>>,f<rsub|k><rsup|\<perp\>>|\<rangle\>>>>
  </equation>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.7>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>