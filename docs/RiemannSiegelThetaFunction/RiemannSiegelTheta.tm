<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Riemann-Siegel Theta
  Function>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    For all real <math|t>,

    <\equation>
      \<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+i<frac|t|2>|)>-<frac|log
      \<pi\>|2>*t+\<pi\>*<around*|\<lfloor\>|<frac|t|2>+<frac|1|4>|\<rfloor\>>
    </equation>

    is continuous.
  </theorem>

  <\proof>
    Let <math|z<around|(|t|)>=<frac|1|4>+i<frac|t|2>>. The reflection formula
    states:

    <\equation>
      \<Gamma\><around|(|z|)>*\<Gamma\>*<around|(|1-z|)>=<frac|\<pi\>|sin
      <around|(|\<pi\>*z|)>>
    </equation>

    Taking arguments:

    <\equation>
      arg \<Gamma\><around|(|z|)>+arg \<Gamma\>*<around|(|1-z|)>=-arg sin
      <around|(|\<pi\>*z|)><pmod|2*\<pi\>>
    </equation>

    For <math|t<rsub|0>> where <math|<frac|t<rsub|0>|2>+<frac|1|4>=n\<in\>\<bbb-Z\>>:

    <\equation>
      z*<around|(|t<rsub|0>\<pm\>\<epsilon\>|)>=n\<pm\>i<frac|\<epsilon\>|2>
    </equation>

    The argument <math|arg \<Gamma\><around|(|z<around|(|t|)>|)>> jumps by
    <math|\<pi\>> at each such <math|t<rsub|0>>:

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0<rsup|+>> arg
      \<Gamma\>*<around|(|z*<around|(|t<rsub|0>+\<epsilon\>|)>|)>=lim<rsub|\<epsilon\>\<to\>0<rsup|->>
      arg \<Gamma\>*<around|(|z*<around|(|t<rsub|0>-\<epsilon\>|)>|)>+\<pi\>
    </equation>

    At these same points <math|t<rsub|0>>, the floor function term jumps:

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0<rsup|+>>
      \<pi\>*<around*|\<lfloor\>|<frac|t<rsub|0>+\<epsilon\>|2>+<frac|1|4>|\<rfloor\>>=\<pi\>*n
    </equation>

    <\equation>
      lim<rsub|\<epsilon\>\<to\>0<rsup|->>
      \<pi\>*<around*|\<lfloor\>|<frac|t<rsub|0>-\<epsilon\>|2>+<frac|1|4>|\<rfloor\>>=\<pi\>*<around|(|n-1|)>
    </equation>

    Therefore at each <math|t<rsub|0>>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|lim<rsub|\<epsilon\>\<to\>0<rsup|+>>
      \<theta\>*<around|(|t<rsub|0>+\<epsilon\>|)>>|<cell|=<around|[|arg
      \<Gamma\><around|(|z<around|(|t<rsub|0><rsup|+>|)>|)>-<frac|log
      \<pi\>|2>*t<rsub|0>+\<pi\>*n|]>>>|<row|<cell|>|<cell|=<around|[|arg
      \<Gamma\><around|(|z<around|(|t<rsub|0><rsup|->|)>|)>+\<pi\>-<frac|log
      \<pi\>|2>*t<rsub|0>+\<pi\>*n|]>>>|<row|<cell|>|<cell|=<around|[|arg
      \<Gamma\><around|(|z<around|(|t<rsub|0><rsup|->|)>|)>-<frac|log
      \<pi\>|2>*t<rsub|0>+\<pi\>*<around|(|n-1|)>|]>>>|<row|<cell|>|<cell|=lim<rsub|\<epsilon\>\<to\>0<rsup|->>
      \<theta\>*<around|(|t<rsub|0>-\<epsilon\>|)>>>>>>
    </equation>

    Between any two consecutive such points <math|t<rsub|0>>, all terms in
    <math|\<theta\><around|(|t|)>> are continuous. Thus
    <math|\<theta\><around|(|t|)>> is continuous for all real <math|t>.
  </proof>
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