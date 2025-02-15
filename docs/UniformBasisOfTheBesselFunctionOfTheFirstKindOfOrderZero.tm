<TeXmacs|2.1.2>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Uniformly Convergent Orthonormal Expansion for the
  Bessel Function of the First Kind of Order
  0>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    Let <math|\<psi\><rsub|n><around|(|y|)>> be defined as

    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|\<psi\><rsub|n><around|(|y|)>>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<space|0.17em>j<rsub|2*n><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*<space|0.17em>J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|<around|(|4*n+1|)>*\<pi\>|\<pi\>*2*y>>*<space|0.17em>J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2*y>>*<space|0.17em>J<rsub|2*n+<frac|1|2>><around|(|y|)>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><sqrt|<frac|2*n+<frac|1|2>|y>>*<space|0.17em>J<rsub|2*n+<frac|1|2>><around|(|y|)>>>>>
      </aligned>
    </equation*>

    where <math|J<rsub|\<nu\>>> denotes the Bessel function of the first kind
    and <math|j<rsub|n>> the spherical Bessel function. Then

    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|J<rsub|0><around|(|x|)>>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>\<psi\><rsub|n><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|y|)>*\<psi\><rsub|n><around|(|y|)><space|0.17em>\<mathd\>y>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<space|0.17em>j<rsub|2*n><around|(|x|)><space|0.17em><sqrt|<frac|2*n+<frac|1|2>|\<pi\>>>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>>>|<row|<cell|>|<cell|=<frac|1|2*<sqrt|\<pi\>*x>>*<big|sum><rsub|n=0><rsup|\<infty\>><around|(|-1|)><rsup|n>*<around|(|4*n+1|)>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|x|)>>>|<row|<cell|>|<cell|=<frac|1|<sqrt|4*\<pi\>*x>>*<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|n>*<around|(|4*n+1|)>*\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|x|)>>>>>
      </aligned>
    </equation*>

    with uniform convergence <math|\<forall\>x\<in\>\<bbb-C\>>. Moreover,
    <math|<around|{|\<psi\><rsub|n>|}>> forms an orthonormal system in
    <math|L<rsup|2><around|(|<around|[|0,\<infty\>|)>|)>> satisfying

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|m><around|(|t|)>*\<psi\><rsub|n><around|(|t|)><space|0.17em>\<mathd\>t=\<delta\><rsub|m*n>=<choice|<tformat|<table|<row|<cell|1>|<cell|m=n,>>|<row|<cell|0>|<cell|m\<neq\>n.>>>>>
    </equation*>
  </theorem>

  <\proof>
    \;

    <with|font-series|bold|Orthonormality of
    <math|\<psi\><rsub|n><around|(|y|)>>>

    For <math|m\<neq\>n>, by substituting the definition we have

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<langle\>|\<psi\><rsub|m>,\<psi\><rsub|n>|\<rangle\>>>|<cell|=<around|(|-1|)><rsup|m+n><sqrt|<frac|<around|(|4*m+1|)>*<around|(|4*n+1|)>|\<pi\><rsup|2>>>*<frac|\<pi\>|2>*<big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*m+<frac|1|2>><around|(|y|)>*J<rsub|2*n+<frac|1|2>><around|(|y|)>|y><space|0.17em>\<mathd\>y>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|m+n><sqrt|<frac|<around|(|4*m+1|)>*<around|(|4*n+1|)>|4*\<pi\>>>\<cdot\><frac|2|\<pi\>>*<frac|\<delta\><rsub|m*n>|<around|(|2*m+<frac|1|2>|)>+<around|(|2*n+<frac|1|2>|)>>=0>>>>>
    </equation>

    For <math|m=n>, using the orthogonality relation

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|<around*|[|J<rsub|2*n+<frac|1|2>><around|(|y|)>|]><rsup|2>|y><space|0.17em>\<mathd\>y=<frac|1|2*n+<frac|1|2>>
    </equation>

    we obtain

    <\equation>
      <around|\<langle\>|\<psi\><rsub|n>,\<psi\><rsub|n>|\<rangle\>>=<frac|<sqrt|<frac|4*n+1|4*\<pi\>>>\<cdot\><frac|\<pi\>|2>|2*n+<frac|1|2>>=1
    </equation>

    <with|font-series|bold|Expansion Coefficients>

    Since the system <math|<around|{|\<psi\><rsub|n>|}>> is orthonormal, the
    coefficients in the expansion are given by

    <\equation>
      c<rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|y|)>*<space|0.17em>\<psi\><rsub|n><around|(|y|)><space|0.17em>\<mathd\>y
    </equation>

    Using Neumann's addition theorem together with Mellin transform
    techniques, one obtains

    <\equation*>
      c<rsub|n>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2>>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>,
    </equation*>

    which is derived from the evaluation

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|y|)><frac|J<rsub|2*n+<frac|1|2>><around|(|y|)>|<sqrt|y>><space|0.17em>\<mathd\>y=<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|<sqrt|2>*\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation>

    <with|font-series|bold|Uniform Convergence>

    Observe that the series for <math|J<rsub|0><around|(|x|)>> is
    alternating, with its <math|n>th term given by

    <\equation>
      a<rsub|n><around|(|x|)>=<frac|<around|(|-1|)><rsup|n>*<around|(|4*n+1|)>*\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|2*<sqrt|\<pi\>*x>*<space|0.17em>\<Gamma\>*<around|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|x|)>
    </equation>

    Due to the asymptotic behavior

    <\equation>
      <frac|\<Gamma\>*<around|(|n+<frac|1|2>|)>|\<Gamma\>*<around|(|n+1|)>>\<sim\>n<rsup|-1/2>*<space|1em><text|and><space|1em>J<rsub|2*n+<frac|1|2>><around|(|x|)>\<sim\><frac|<around|(|x/2|)><rsup|2*n+<frac|1|2>>|\<Gamma\>*<around|(|2*n+<frac|3|2>|)>>
    </equation>

    for each fixed <math|x> (and for sufficiently large <math|n>) the
    absolute values <math|<around|\||a<rsub|n><around|(|x|)>|\|>> decrease
    monotonically.

    Since the series is alternating with monotonically decreasing term
    magnitudes, the Alternating Series Remainder Theorem applies. In other
    words, the pointwise error obtained by truncating the series after the
    <math|N>th term is bounded by the absolute value of the first omitted
    term:

    <\equation>
      <around*|\||J<rsub|0><around|(|x|)>-<big|sum><rsub|n=0><rsup|N>a<rsub|n><around|(|x|)>|\|>\<leq\><around|\||a<rsub|N+1><around|(|x|)>|\|>
    </equation>

    Because the projection (or Fourier coefficient) <math|c<rsub|n>>
    converges to <math|0> monotonically, for any given
    <math|\<epsilon\>\<gtr\>0> there exists an <math|N> (which may be chosen
    uniformly in <math|x>) such that

    <\equation>
      <around|\||a<rsub|N+1><around|(|x|)>|\|>\<less\>\<epsilon\>*<space|1em><text|for
      all >x\<in\>\<bbb-C\>
    </equation>

    This completes the argument that the expansion converges uniformly
    without needing to form any tail sums.
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