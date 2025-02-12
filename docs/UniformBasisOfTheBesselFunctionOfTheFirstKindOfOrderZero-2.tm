<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Uniformly Convergent Orthonormal Expansion for the
  Bessel Function of the First Kind of Order
  0>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    Let <math|\<psi\><rsub|n><around|(|y|)>> be defined as

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<psi\><rsub|n><around|(|y|)>>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|<around|(|4*n+1|)>*\<pi\>|\<pi\>*2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|2*n+<frac|1|2>|y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>>>>>>
    </equation>

    where <math|J<rsub|\<nu\>>> denotes the Bessel function of the first kind
    and <math|j<rsub|n>> the spherical Bessel function. Then

    <\equation>
      <tabular|<tformat|<table|<row|<cell|J<rsub|0><around|(|x|)>>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>\<psi\><rsub|n><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|y|)>*\<psi\><rsub|n><around|(|y|)>\<mathd\>y>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|x|)><sqrt|<frac|2*n+<frac|1|2>|\<pi\>>>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>>>|<row|<cell|>|<cell|=<frac|1|2*<sqrt|\<pi\>*x>>*<big|sum><rsub|n=0><rsup|\<infty\>><around|(|-1|)><rsup|n>*<around|(|4*n+1|)>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|x|)>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|4*\<pi\>*x>>*<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|n>*<around|(|4*n+1|)>*\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|x|)>>>>>>
    </equation>

    with uniform convergence <math|\<forall\>x\<in\>\<bbb-C\>>. Moreover,
    <math|<around|{|\<psi\><rsub|n>|}>> forms an orthonormal system in
    <math|L<rsup|2><around|(|<around|[|0,\<infty\>|)>|)>> satisfying

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|m><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>\<mathd\>t=\<delta\><rsub|m*n>=<choice|<tformat|<table|<row|<cell|1>|<cell|m=n>>|<row|<cell|0>|<cell|m\<neq\>n>>>>>
    </equation>
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Orthonormality of
    <math|\<psi\><rsub|n><around|(|y|)>>>

    For <math|m\<neq\>n>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|\<psi\><rsub|m>,\<psi\><rsub|n>|\<rangle\>>>|<cell|=<around|(|-1|)><rsup|m+n><sqrt|<frac|<around|(|4*m+1|)>*<around|(|4*n+1|)>|\<pi\><rsup|2>>>*<frac|\<pi\>|2>*<big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*m+<frac|1|2>><around|(|y|)>*J<rsub|2*n+<frac|1|2>><around|(|y|)>|y>\<mathd\>y>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|m+n><sqrt|<frac|<around|(|4*m+1|)>*<around|(|4*n+1|)>|4*\<pi\>>><frac|2|\<pi\>>*<frac|\<delta\><rsub|m*n>|<around|(|2*m+<frac|1|2>|)>+<around|(|2*n+<frac|1|2>|)>>=0>>>>>
    </equation>

    For <math|m=n>:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|<around|[|J<rsub|2*n+<frac|1|2>><around|(|y|)>|]><rsup|2>|y>\<mathd\>y=<frac|1|2*n+<frac|1|2>>
    </equation>

    leading to:

    <\equation>
      <around|\<langle\>|\<psi\><rsub|n>,\<psi\><rsub|n>|\<rangle\>>=<frac|<sqrt|<frac|4*n+1|4*\<pi\>>>\<cdot\><frac|\<pi\>|2>|2*n+<frac|1|2>>=1
    </equation>

    <with|font-series|bold|Step 2: Expansion Coefficients>

    Using Neumann's addition theorem and Mellin transform techniques:

    <\equation>
      c<rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|y|)>*\<psi\><rsub|n><around|(|y|)>\<mathd\>y=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2>>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation>

    Derived from:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|y|)><frac|J<rsub|2*n+<frac|1|2>><around|(|y|)>|<sqrt|y>>\<mathd\>y=<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|<sqrt|2>*\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation>

    <with|font-series|bold|Step 3: Uniform Convergence>

    For any <math|\<epsilon\>\<gtr\>0>, choose <math|N> such that:

    <\equation>
      <big|sum><rsub|n=N+1><rsup|\<infty\>><around*|\||<around|(|-1|)><rsup|n><frac|<around|(|4*n+1|)>*\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|2*<sqrt|\<pi\>*x>*\<Gamma\>*<around|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|x|)>|\|>\<less\>\<epsilon\>
    </equation>

    Using the asymptotic behavior:

    <\equation>
      <frac|\<Gamma\>*<around|(|n+<frac|1|2>|)>|\<Gamma\>*<around|(|n+1|)>>\<sim\>n<rsup|-1/2>*<space|1em><text|and><space|1em>J<rsub|2*n+1/2><around|(|x|)>\<sim\><frac|<around|(|x/2|)><rsup|2*n+1/2>|\<Gamma\>*<around|(|2*n+3/2|)>>
    </equation>

    The ratio test shows:

    <\equation>
      lim<rsub|n\<to\>\<infty\>><around*|\||<frac|c<rsub|n+1>*J<rsub|2*<around|(|n+1|)>+1/2><around|(|x|)>|c<rsub|n>*J<rsub|2*n+1/2><around|(|x|)>>|\|>=lim<rsub|n\<to\>\<infty\>>
      <frac|<around|(|4*<around|(|n+1|)>+1|)>|<around|(|4*n+1|)>>*<frac|\<Gamma\>*<around|(|n+3/2|)><rsup|2>|\<Gamma\>*<around|(|n+2|)><rsup|2>>*<frac|<around|(|x/2|)><rsup|2>|<around|(|2*n+5/2|)>>=0
    </equation>

    Thus by the ratio test, the series converges absolutely and uniformly for
    all <math|x\<in\>\<bbb-C\>>.
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