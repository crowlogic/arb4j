<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\theorem>
    The partial sums <math|S<rsub|N><around|(|y|)>> defined as:

    <\equation*>
      S<rsub|N><around|(|y|)>=<sqrt|<frac|2|\<pi\>>>*<big|sum><rsub|k=0><rsup|N><frac|\<psi\><rsub|k><around|(|y|)>|<around*|(|<frac|1|2>+k|)><rsup|2><rsub|<frac|1|2>>>
    </equation*>

    where <math|\<psi\><rsub|n><around|(|y|)>=<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>
    are the orthonormal eigenfunctions, uniformly converge to the Bessel
    function of the first kind of order zero, <math|J<rsub|0><around|(|y|)>>,
    as <math|N\<to\>\<infty\>>.
  </theorem>

  <\proof>
    To prove the uniform convergence of <math|S<rsub|N><around|(|y|)>> to
    <math|J<rsub|0><around|(|y|)>>, we consider the squared difference:

    <\equation*>
      <around|\||J<rsub|0><around|(|y|)>-S<rsub|N><around|(|y|)>|\|><rsup|2>=<around*|\||<sqrt|<frac|2|\<pi\>>>*<big|sum><rsub|k=N+1><rsup|\<infty\>><frac|\<psi\><rsub|k><around|(|y|)>|<around*|(|<frac|1|2>+k|)><rsup|2><rsub|<frac|1|2>>>|\|><rsup|2>
    </equation*>

    Applying the Cauchy-Schwarz inequality and using the orthonormality of
    <math|\<psi\><rsub|n><around|(|y|)>>, we obtain:

    <\equation*>
      <\align*>
        <tformat|<table|<row|<cell|<around|\||J<rsub|0><around|(|y|)>-S<rsub|N><around|(|y|)>|\|><rsup|2>>|<cell|\<leq\><frac|2|\<pi\>>*<big|sum><rsub|k=N+1><rsup|\<infty\>><frac|1|<around*|(|<frac|1|2>+k|)><rsup|2><rsub|1>>*<big|sum><rsub|k=N+1><rsup|\<infty\>><around|\||\<psi\><rsub|k><around|(|y|)>|\|><rsup|2>>>|<row|<cell|>|<cell|=<frac|2|\<pi\>>*<big|sum><rsub|k=N+1><rsup|\<infty\>><frac|1|<around*|(|<frac|1|2>+k|)><rsup|2><rsub|1>>*<big|int><rsub|0><rsup|\<infty\>><around|\||\<psi\><rsub|k><around|(|y|)>|\|><rsup|2>*<space|0.17em>d*y>>|<row|<cell|>|<cell|=<frac|2|\<pi\>>*<big|sum><rsub|k=N+1><rsup|\<infty\>><frac|1|<around*|(|<frac|1|2>+k|)><rsup|2><rsub|1>>>>>>
      </align*>
    </equation*>

    The sum <math|<big|sum><rsub|k=N+1><rsup|\<infty\>><frac|1|<around*|(|<frac|1|2>+k|)><rsup|2><rsub|1>>>
    is the tail of a convergent series, which can be expressed using the
    trigamma function <math|\<Psi\><around|(|1,z|)>>:

    <\equation*>
      <big|sum><rsub|k=N+1><rsup|\<infty\>><frac|1|<around*|(|<frac|1|2>+k|)><rsup|2>>=\<Psi\><around*|(|1,<frac|3|2>+N|)>
    </equation*>

    The trigamma function <math|\<Psi\><around|(|1,z|)>> rapidly decreases as
    <math|z> increases, implying:

    <\equation*>
      \<Psi\><around|(|1,<frac|3|2>+N|)>\<rightarrow\>0*<text|as
      >N\<rightarrow\>\<infty\>
    </equation*>

    Consequently, the tail of the series converges to zero as <math|N>
    increases, independent of <math|y>:

    <\equation*>
      <frac|2|\<pi\>>*<big|sum><rsub|k=N+1><rsup|\<infty\>><frac|1|<around*|(|<frac|1|2>+k|)><rsup|2><rsub|1>>\<rightarrow\>0*<text|as
      >N\<rightarrow\>\<infty\>
    </equation*>

    Therefore, the squared difference <math|<around|\||J<rsub|0><around|(|y|)>-S<rsub|N><around|(|y|)>|\|><rsup|2>>
    converges to zero uniformly in <math|y> as <math|N> approaches infinity,
    proving that <math|S<rsub|N><around|(|y|)>> uniformly converges to
    <math|J<rsub|0><around|(|y|)>>.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>