<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Proving the Karhunen-Loève Expansion for a
  Non-Square-Integrable Kernel>>

  To prove that the Karhunen-Loève (KL) expansion works for a specific,
  non-square-integrable kernel within its Reproducing Kernel Hilbert Space
  (RKHS), we need to rigorously demonstrate several key points:

  <\enumerate>
    <item><with|font-series|bold|Well-definedness of the RKHS>: Establish
    that the RKHS associated with your kernel is well-defined. This includes
    showing that the space is complete and that every function in the space
    can be represented through the kernel in a way that respects the
    reproducing property. Specifically, for any <math|f\<in\>>RKHS and for
    all <math|x>, <math|f<around|(|x|)>=<around|\<langle\>|f,K|(>\<cdot\>,x)\<rangle\>>,
    where <math|K> is your kernel and <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>>
    denotes the inner product in the RKHS.

    <item><with|font-series|bold|Eigenfunctions and Eigenvalues>: Prove that
    the eigenfunctions <math|<around|{|\<phi\><rsub|n>|}>> and eigenvalues
    <math|<around|{|\<lambda\><rsub|n>|}>> you have derived are correct and
    form a complete orthogonal basis for the RKHS. This involves
    demonstrating that the eigenfunctions are orthogonal with respect to the
    inner product in the RKHS and that any function within the RKHS can be
    approximated to an arbitrary degree of accuracy by a finite linear
    combination of these eigenfunctions.

    <item><with|font-series|bold|Convergence of the KL Expansion>: Show that
    the KL expansion converges to the stochastic process in the mean square
    sense. For a stochastic process <math|X<around|(|t|)>> with mean
    <math|\<mu\><around|(|t|)>> and your non-square-integrable kernel
    <math|K<around|(|s,t|)>>, you need to prove that

    <\equation*>
      lim<rsub|N\<to\>\<infty\>> E<around*|[|<around*|\||X<around|(|t|)>-<around*|(|\<mu\><around|(|t|)>+<big|sum><rsub|n=1><rsup|N>Z<rsub|n>*\<phi\><rsub|n><around|(|t|)>|)>|\|><rsup|2>|]>=0,
    </equation*>

    where <math|E<around|[|\<cdummy\>|]>> denotes expectation, and
    <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>>> represents the norm in the
    RKHS. This step ensures that the series converges to the actual process.

    <item><with|font-series|bold|Appropriateness of the RKHS for the Kernel>:
    Justify why the RKHS you've constructed is the appropriate setting for
    analyzing your kernel, despite its non-square-integrability. This
    involves linking the properties of the kernel to the features of the
    RKHS, ensuring that operations such as the inner product and function
    evaluation are meaningful and consistent with the stochastic process's
    properties you're modeling.

    <item><with|font-series|bold|Mathematical Rigor and Formal Proofs>:
    Utilize theorems from functional analysis, stochastic processes, and
    Hilbert space theory to formally prove the statements above. Reference
    relevant mathematical literature to support your arguments, ensuring that
    each step of your proof is grounded in established theory.
  </enumerate>

  This process will likely involve a combination of theoretical analysis and
  practical demonstration (e.g., numerical examples or simulations to support
  the convergence and effectiveness of the KL expansion in representing your
  specific stochastic process). The rigorous application of mathematical
  principles from the fields of stochastic processes, functional analysis,
  and specifically the theory of RKHSs, is crucial for validating the use of
  the KL expansion with your kernel.

  <\theorem>
    <with|font-series|bold|Weierstrass M-test.> Suppose that
    <math|<around|(|f<rsub|n>|)>> is a sequence of real- or complex-valued
    functions defined on a set <math|A>, and that there is a sequence of
    non-negative numbers <math|<around|(|M<rsub|n>|)>> satisfying the
    conditions

    <\itemize>
      <item><math|<around|\||f<rsub|n><around|(|x|)>|\|>\<leq\>M<rsub|n>> for
      all <math|n\<geq\>1> and \<forall\><math|x\<in\>A> and

      <item><math|<big|sum><rsub|n=1><rsup|\<infty\>>M<rsub|n>> converges.
    </itemize>

    Then the series

    <\equation>
      <big|sum><rsub|n=1><rsup|\<infty\>>f<rsub|n><around|(|x|)>
    </equation>

    converges absolutely and uniformly on <math|A>.

    A series satisfying the hypothesis is called <em|normally convergent>.
    The result is often used in combination with the uniform limit theorem.
    Together they say that if, in addition to the above conditions, the set
    <math|A> is a topological space and the functions <math|f<rsub|n>> are
    continuous on <math|A>, then the series converges to a continuous
    function.
  </theorem>

  <\proof>
    Consider the sequence of functions

    <\equation>
      S<rsub|n><around|(|x|)>=<big|sum><rsub|k=1><rsup|n>f<rsub|k><around|(|x|)>
    </equation>

    Since the series

    <\equation>
      <big|sum><rsub|n=1><rsup|\<infty\>>M<rsub|n>\<less\>\<infty\>
    </equation>

    <math|> converges and <math|M<rsub|n>\<geq\>0\<forall\>><math|n>, then by
    the Cauchy criterion,

    <\equation>
      <big|sum><rsub|k=n+1><rsup|m>M<rsub|k>\<less\>\<varepsilon\>\<forall\>\<varepsilon\>\<gtr\>0\<exists\>N\<forall\>m\<gtr\>n\<gtr\>N
    </equation>

    For a given value of <math|N>,

    <\equation*>
      \;
    </equation*>

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\||S<rsub|m><around|(|x|)>-S<rsub|n><around|(|x|)>|\|>>|<cell|=<around*|\||<big|sum><rsub|k=n+1><rsup|m>f<rsub|k><around|(|x|)>|\|>>>|<row|<cell|<around*|(|<tabular|<tformat|<table|<row|<cell|triangle
      >>|<row|<cell|inequality>>>>>|)>>|<cell|\<leq\><big|sum><rsub|k=n+1><rsup|m><around|\||f<rsub|k><around|(|x|)>|\|>>>|<row|<cell|>|<cell|\<leq\><big|sum><rsub|k=n+1><rsup|m>M<rsub|k>\<less\>\<varepsilon\>>>>>>\<forall\>x\<in\>A\<forall\>m\<gtr\>n\<gtr\>N
    </equation>

    The sequence <math|S<rsub|n><around|(|x|)>> is thus a Cauchy sequence in
    <math|\<bbb-R\>> or <math|\<bbb-C\>>, and by completeness, it converges
    to a function <math|S<around|(|x|)>> that depends on <math|x> so that\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\||S<around|(|x|)>-S<rsub|n><around|(|x|)>|\|>>|<cell|=<around*|\||lim<rsub|m\<to\>\<infty\>>
      S<rsub|m><around|(|x|)>-S<rsub|n><around|(|x|)>|\|>>>|<row|<cell|>|<cell|=lim<rsub|m\<to\>\<infty\>><around*|\||S<rsub|m><around|(|x|)>-S<rsub|n><around|(|x|)>|\|>\<leq\>\<varepsilon\>>>>>>\<forall\>n\<gtr\>N
    </equation>

    Since <math|N> does not depend on <math|x>, this means that the sequence
    <math|S<rsub|n><around*|(|x|)>> of partial sums converges uniformly to
    the function <math|S<around*|(|x|)>>. Hence, by definition, the series
    <math|<big|sum><rsub|k=1><rsup|\<infty\>>f<rsub|k><around|(|x|)>>
    converges uniformly. Similarly, it can proved that
    <math|<big|sum><rsup|\<infty\>><rsub|k=1><around*|\||f<rsub|k><around*|(|x|)>|\|>>
    converges uniformly.

    \;
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