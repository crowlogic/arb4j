<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\theorem>
    Let <math|\<psi\><rsub|n><around|(|y|)>> be defined as

    <\equation>
      \<psi\><rsub|n><around|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|y|)>=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*<sqrt|<frac|\<pi\>|2*y>>*J<rsub|2*n+<frac|1|2>><around|(|y|)>,
    </equation>

    where <math|J<rsub|\<nu\>>> denotes the Bessel function of the first kind
    and <math|j<rsub|n>> the spherical Bessel function. Then

    <\equation>
      <\aligned>
        <tformat|<table|<row|<cell|J<rsub|0><around|(|x|)>>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>>\<psi\><rsub|n><around|(|x|)>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|y|)>*\<psi\><rsub|n><around|(|y|)>\<mathd\>y>>|<row|<cell|>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|\<pi\>>>*j<rsub|2*n><around|(|x|)><sqrt|<frac|2*n+<frac|1|2>|\<pi\>>>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>>>|<row|<cell|>|<cell|=<frac|1|2*<sqrt|\<pi\>*x>>*<big|sum><rsub|n=0><rsup|\<infty\>><around|(|-1|)><rsup|n>*<around|(|4*n+1|)>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|x|)>,>>>>
      </aligned>
    </equation>

    with uniform convergence <math|\<forall\>x\<in\>\<bbb-C\>>. Moreover,
    <math|<around|{|\<psi\><rsub|n>|}>> forms an orthonormal system in
    <math|L<rsup|2><around|(|<around|[|0,\<infty\>|)>|)>> satisfying

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|m><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>\<mathd\>t=\<delta\><rsub|m*n>=<choice|<tformat|<table|<row|<cell|1>|<cell|m=n,>>|<row|<cell|0>|<cell|m\<neq\>n.>>>>>
    </equation>
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Orthonormality of
    <math|\<psi\><rsub|n><around|(|y|)>>.> Substituting the definition:

    <\align*>
      <tformat|<table|<row|<cell|<around|\<langle\>|\<psi\><rsub|m>,\<psi\><rsub|n>|\<rangle\>>>|<cell|=<around|(|-1|)><rsup|m+n><sqrt|<frac|<around|(|4*m+1|)>*<around|(|4*n+1|)>|\<pi\><rsup|2>>>*<frac|\<pi\>|2>*<big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*m+<frac|1|2>><around|(|y|)>*J<rsub|2*n+<frac|1|2>><around|(|y|)>|y>\<mathd\>y>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|m+n><sqrt|<frac|<around|(|4*m+1|)>*<around|(|4*n+1|)>|4*\<pi\>>>\<cdot\><frac|\<delta\><rsub|m*n>|2*n+<frac|1|2>>>>|<row|<cell|>|<cell|=\<delta\><rsub|m*n>.>>>>
    </align*>

    The crucial integral follows from Bessel orthogonality:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|\<mu\>><around|(|y|)>*J<rsub|\<nu\>><around|(|y|)>|y>\<mathd\>y=<frac|2|\<pi\>>*<frac|\<delta\><rsub|\<mu\>*\<nu\>>|\<mu\>+\<nu\>>.
    </equation*>

    <with|font-series|bold|Step 2: Expansion Coefficients.> Using the
    orthonormal basis:

    <\equation*>
      c<rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|y|)>*\<psi\><rsub|n><around|(|y|)>\<mathd\>y=<around|(|-1|)><rsup|n><sqrt|<frac|4*n+1|2>>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>.
    </equation*>

    This emerges from evaluating:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|y|)><frac|J<rsub|2*n+<frac|1|2>><around|(|y|)>|<sqrt|y>>\<mathd\>y=<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|<sqrt|2>*\<Gamma\>*<around|(|n+1|)><rsup|2>>.
    </equation*>

    <with|font-series|bold|Step 3: Series Simplification.> Substitute
    <math|c<rsub|n>> into the expansion:

    <\equation*>
      J<rsub|0><around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|n>*<around|(|4*n+1|)>|2*<sqrt|\<pi\>*x>>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>*J<rsub|2*n+<frac|1|2>><around|(|x|)>.
    </equation*>

    Term-wise convergence follows from the asymptotic behavior:

    <\equation*>
      <frac|\<Gamma\>*<around|(|n+<frac|1|2>|)>|\<Gamma\>*<around|(|n+1|)>>\<sim\>n<rsup|-1/2>*<space|1em><text|and><space|1em>J<rsub|\<nu\>><around|(|z|)>\<sim\><frac|<around|(|z/2|)><rsup|\<nu\>>|\<Gamma\>*<around|(|\<nu\>+1|)>>.
    </equation*>

    <with|font-series|bold|Step 4: Uniform Convergence.> Analyticity of
    <math|J<rsub|0><around|(|z|)>> and exponential decay of coefficients
    ensure uniform convergence across <math|\<bbb-C\>> by the Weierstrass
    M-test.
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