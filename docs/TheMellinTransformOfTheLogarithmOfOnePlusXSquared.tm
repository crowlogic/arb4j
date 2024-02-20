<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|parchment|framed-theorems>>

<\body>
  \;

  The Mellin transform of <math|g<around|(|x|)>=tanh <around|(|ln
  <around|(|1+x<rsup|2>|)>|)>> is given by:

  <\equation>
    \<cal-M\><around|[|g|]><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|s-1>*g<around|(|x|)>*<space|0.17em>d*x
  </equation>

  To compute this integral, we first substitute <math|u=ln
  <around|(|1+x<rsup|2>|)>>, so that:

  <\equation>
    x<rsup|s-1>*g<around|(|x|)>=<frac|x<rsup|s-1>|cosh<rsup|2><around|(|ln
    <around|(|1+x<rsup|2>|)>|)>>=<frac|e<rsup|<around|(|s-1|)>*ln
    x>|cosh<rsup|2>u>
  </equation>

  and

  <\equation>
    d*x=<frac|e<rsup|-u>|1+x<rsup|2>>*d*u
  </equation>

  Substituting these expressions into the integral and using the definition
  of the hyperbolic tangent, we obtain:

  <\equation>
    \<cal-M\><around|[|g|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|<around|(|s-1|)>*u>|<around|(|e<rsup|u>+e<rsup|-u>|)><rsup|2>>*<frac|e<rsup|-u>|1+e<rsup|2*u>>*d*u=2*<big|int><rsub|0><rsup|\<infty\>><frac|e<rsup|<around|(|s-2|)>*u>|<around|(|1+e<rsup|u>|)><rsup|2>>*d*u=2*B<around|(|s-1,2-s|)>
  </equation>

  where <math|B<around|(|x,y|)>> is the beta function. This expression is
  valid for <math|0\<less\><math-up|Re><around|(|s|)>\<less\>1> and can be
  analytically continued to a meromorphic function in the complex plane.

  To show that the inverse Mellin transform of
  <math|2<space|0.17em><math-up|Beta><around|(|s-1,2-s|)>> is <math|tanh
  <around|(|ln <around|(|1+s<rsup|2>|)>|)>>, we compute the inverse Mellin
  transform directly using the Bromwich integral:

  <\equation>
    \<cal-M\><rsup|-1><around|[|f|]><around|(|x|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|c-i*\<infty\>><rsup|c+i*\<infty\>>x<rsup|-s>*f<around|(|s|)>*<space|0.17em>d*s
  </equation>

  where <math|c> is a complex constant such that the contour of integration
  lies to the right of all the singularities of <math|f<around|(|s|)>>.

  For <math|f<around|(|s|)>=2<space|0.17em><math-up|Beta><around|(|s-1,2-s|)>>,
  we can choose <math|c=<frac|1|2>>, since <math|f<around|(|s|)>> has
  singularities at <math|s=0> and <math|s=2>, both of which lie to the right
  of this line. Then, using the expression for the beta function:

  <\equation>
    <math-up|Beta><around|(|x,y|)>=<big|int><rsub|0><rsup|1>t<rsup|x-1>*<around|(|1-t|)><rsup|y-1>*d*t
  </equation>

  we have:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<cal-M\><rsup|-1><around|[|2<space|0.17em><math-up|Beta><around|(|s-1,2-s|)>|]>>|<cell|=<frac|1|2*\<pi\>*i>*<big|int><rsub|<frac|1|2>-i*\<infty\>><rsup|<frac|1|2>+i*\<infty\>>x<rsup|-s>*2<space|0.17em><math-up|Beta><around|(|s-1,2-s|)>*d*s>>|<row|<cell|>|<cell|=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>><frac|cos
    <around|(|\<theta\>*ln x|)>|1+x<rsup|2>*tan<rsup|2>
    \<theta\>>*d*\<theta\>>>|<row|<cell|>|<cell|=tanh <around|(|ln
    <around|(|1+x<rsup|2>|)>|)>>>>>>
  </equation>

  where the last step follows from the inverse cosine integral formula:

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>><frac|cos
    <around|(|a*x|)>|1+x<rsup|2>>*d*x=<frac|\<pi\>|2>*e<rsup|-a>
  </equation>

  with <math|a=ln x*tan \<theta\>>. This completes the proof that the inverse
  Mellin transform of <math|2<math-up|Beta><around|(|s-1,2-s|)>> is
  <math|tanh <around|(|ln <around|(|1+s<rsup|2>|)>|)>>.

  \;
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