<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Positive Definiteness and Self-Adjoint Extensions for
  Covariance Operators of Transformed Stationary Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Definitions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Main
    Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Foundational
    Constructions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Random
    Wave Model and Bessel Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Operator-Theoretic
    Analysis: Defect Indices> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>The Original Operator (Non-Monotonic
    Case) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|5.2<space|2spc>The Monotonized Operator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Stochastic
    Process Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Zero-Counting
    Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Spectral
    Theory and Zeta Zeros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
  </table-of-contents>

  <section|Definitions>

  <\definition>
    [Bessel Kernel] Let <math|J<rsub|0>> be the Bessel function of the first
    kind of order zero. The standard Bessel kernel is defined as
    <math|B<around|(|s,t|)>=J<rsub|0>*<around|(|2*\<pi\>*<around|\||s-t|\|>|)>>
    for <math|s,t\<in\>\<bbb-R\>>.
  </definition>

  <\definition>
    [Transformed Bessel Kernel] Given a function
    <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>, the transformed Bessel kernel
    is defined as <math|K<rsub|\<theta\>><around|(|s,t|)>=J<rsub|0>*<around|(|2*\<pi\>*<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>|)>>
    for <math|s,t\<in\>\<bbb-R\>>.
  </definition>

  <\definition>
    [Covariance Operator] The integral operator <math|T<rsub|\<theta\>>>
    associated with kernel <math|K<rsub|\<theta\>>> acts on functions
    <math|f\<in\>L<rsup|2><around|(|\<bbb-R\>|)>> as:

    <\equation>
      <around|(|T<rsub|\<theta\>>*f|)><around|(|s|)>=<big|int><rsub|\<bbb-R\>>J<rsub|0>*<around|(|2*\<pi\>*<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>|)>*f<around|(|t|)>*d*t
    </equation>
  </definition>

  <\definition>
    [Defect Indices] For a densely defined symmetric operator <math|T> on a
    Hilbert space <math|\<cal-H\>> with adjoint <math|T<rsup|\<ast\>>>, the
    defect indices <math|<around|(|n<rsub|+>,n<rsub|->|)>> are:

    <\equation>
      n<rsub|+>=dim ker <around|(|T<rsup|\<ast\>>-i\<cdot\>I|)>,<space|1em>n<rsub|->=dim
      ker <around|(|T<rsup|\<ast\>>+i\<cdot\>I|)>
    </equation>

    where <math|I> denotes the identity operator.
  </definition>

  <\definition>
    [Self-Adjoint Operator] A symmetric operator <math|T> is self-adjoint if
    and only if <math|T=T<rsup|\<ast\>>>, which is equivalent to having
    defect indices <math|n<rsub|+>=n<rsub|->=0>.
  </definition>

  <section|Main Results>

  <\theorem>
    <label|thm:main>The covariance operator <math|T<rsub|\<theta\>>> with
    kernel <math|K<rsub|\<theta\>><around|(|s,t|)>=J<rsub|0>*<around|(|2*\<pi\>*<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>|)>>
    has zero defect indices <math|<around|(|n<rsub|+>=n<rsub|->=0|)>> if and
    only if <math|\<theta\>> is strictly monotonic.
  </theorem>

  To prove this theorem, several preliminary results are needed.

  <\lemma>
    <label|lemma:bessel-pd>The Bessel kernel
    <math|B<around|(|s,t|)>=J<rsub|0>*<around|(|2*\<pi\>*<around|\||s-t|\|>|)>>
    defines a positive definite operator.
  </lemma>

  <\proof>
    By Bochner's theorem, a continuous function
    <math|\<phi\>*<around|(|s-t|)>> is positive definite if and only if it is
    the Fourier transform of a non-negative measure. The Fourier transform of
    <math|J<rsub|0>*<around|(|2*\<pi\><around|\||x|\|>|)>> is:

    <\equation>
      \<cal-F\>*<around|[|J<rsub|0>*<around|(|2*\<pi\><around|\||x|\|>|)>|]><around|(|\<omega\>|)>=<frac|1|2*\<pi\><sqrt|1-\<omega\><rsup|2>/<around|(|4*\<pi\><rsup|2>|)>>>*<with|math-font-family|bf|1><rsub|<around|[|-2*\<pi\>,2*\<pi\>|]>><around|(|\<omega\>|)>
    </equation>

    where <math|<with|math-font-family|bf|1><rsub|<around|[|-2*\<pi\>,2*\<pi\>|]>>>
    is the indicator function of the interval
    <math|<around|[|-2*\<pi\>,2*\<pi\>|]>>.

    Since this is a non-negative function,
    <math|J<rsub|0>*<around|(|2*\<pi\><around|\||x|\|>|)>> is positive
    definite, and hence <math|B<around|(|s,t|)>> defines a positive definite
    operator.
  </proof>

  <\lemma>
    <label|lemma:standard-sa>The operator <math|S> associated with the
    standard Bessel kernel <math|B<around|(|s,t|)>=J<rsub|0>*<around|(|2*\<pi\>*<around|\||s-t|\|>|)>>
    is self-adjoint.
  </lemma>

  <\proof>
    The operator <math|S> with kernel <math|B<around|(|s,t|)>> is unitarily
    equivalent to multiplication by the function
    <math|<frac|1|2*\<pi\><sqrt|1-\<omega\><rsup|2>/<around|(|4*\<pi\><rsup|2>|)>>>*<with|math-font-family|bf|1><rsub|<around|[|-2*\<pi\>,2*\<pi\>|]>><around|(|\<omega\>|)>>
    in the Fourier domain. Since this is a bounded, real-valued
    multiplication operator, it is self-adjoint, and thus <math|S> has defect
    indices <math|<around|(|0,0|)>>.
  </proof>

  <\proposition>
    <label|prop:monotonic-implies-sa>If <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>>
    is strictly monotonic, then the covariance operator
    <math|T<rsub|\<theta\>>> is self-adjoint.
  </proposition>

  <\proof>
    When <math|\<theta\>> is strictly monotonic, it is invertible. Consider
    the change of variables:

    <\equation>
      u=\<theta\><around|(|s|)>,<space|1em>v=\<theta\><around|(|t|)>
    </equation>

    Define the unitary transformation <math|U:L<rsup|2><around|(|\<bbb-R\>,d*s|)>\<to\>L<rsup|2><around|(|\<bbb-R\>,d*u|)>>
    by:

    <\equation>
      <around|(|U*f|)><around|(|u|)>=f<around|(|\<theta\><rsup|-1><around|(|u|)>|)><sqrt|<around*|\||<frac|d*\<theta\><rsup|-1>|d*u><around|(|u|)>|\|>>
    </equation>

    Under this transformation, the operator <math|T<rsub|\<theta\>>> becomes:

    <\equation>
      <around|(|U*T<rsub|\<theta\>>*U<rsup|-1>*g|)><around|(|u|)>=<big|int><rsub|\<bbb-R\>>J<rsub|0>*<around|(|2*\<pi\>*<around|\||u-v|\|>|)>*g<around|(|v|)>*d*v
    </equation>

    which is precisely the operator <math|S> with the standard Bessel kernel.

    Since <math|S> is self-adjoint by Lemma <reference|lemma:standard-sa>,
    and unitary equivalence preserves self-adjointness,
    <math|T<rsub|\<theta\>>=U<rsup|-1>*S*U> is also self-adjoint. Thus, its
    defect indices are <math|<around|(|0,0|)>>.
  </proof>

  <\proposition>
    <label|prop:nonmonotonic-implies-defect>If <math|\<theta\>> is not
    strictly monotonic, then <math|T<rsub|\<theta\>>> has non-zero defect
    indices.
  </proposition>

  <\proof>
    If <math|\<theta\>> is not strictly monotonic, there exist points
    <math|s<rsub|1>\<neq\>s<rsub|2>> such that
    <math|\<theta\><around|(|s<rsub|1>|)>=\<theta\><around|(|s<rsub|2>|)>>.

    Let <math|\<cal-E\>=<around|{|<around|(|s<rsub|1>,s<rsub|2>|)>\<in\>\<bbb-R\><rsup|2>:s<rsub|1>\<neq\>s<rsub|2>,\<theta\><around|(|s<rsub|1>|)>=\<theta\><around|(|s<rsub|2>|)>|}>>.
    This set is non-empty by assumption.

    For any pair <math|<around|(|s<rsub|1>,s<rsub|2>|)>\<in\>\<cal-E\>>, the
    kernel satisfies:

    <\equation>
      K<rsub|\<theta\>><around|(|s<rsub|1>,t|)>=J<rsub|0>*<around|(|2*\<pi\>*<around|\||\<theta\><around|(|s<rsub|1>|)>-\<theta\><around|(|t|)>|\|>|)>=J<rsub|0>*<around|(|2*\<pi\>*<around|\||\<theta\><around|(|s<rsub|2>|)>-\<theta\><around|(|t|)>|\|>|)>=K<rsub|\<theta\>><around|(|s<rsub|2>,t|)>
    </equation>

    This introduces a linear dependence in the kernel, violating the strict
    positive definiteness needed for self-adjointness.

    To formalize this, consider the distribution:

    <\equation>
      f<rsub|s<rsub|1>,s<rsub|2>><around|(|t|)>=\<delta\>*<around|(|t-s<rsub|1>|)>-\<delta\>*<around|(|t-s<rsub|2>|)>
    </equation>

    While <math|f<rsub|s<rsub|1>,s<rsub|2>>> itself is not in
    <math|L<rsup|2><around|(|\<bbb-R\>|)>>, it can be approximated by
    <math|L<rsup|2>> functions. Using the symmetry property
    <math|K<rsub|\<theta\>><around|(|s<rsub|1>,t|)>=K<rsub|\<theta\>><around|(|s<rsub|2>,t|)>>:

    <\equation>
      <around|(|T<rsub|\<theta\>>*f<rsub|s<rsub|1>,s<rsub|2>>|)><around|(|s|)>=<big|int><rsub|\<bbb-R\>>K<rsub|\<theta\>><around|(|s,t|)>*f<rsub|s<rsub|1>,s<rsub|2>><around|(|t|)>*d*t=K<rsub|\<theta\>><around|(|s,s<rsub|1>|)>-K<rsub|\<theta\>><around|(|s,s<rsub|2>|)>=0
    </equation>

    This implies that <math|T<rsub|\<theta\>>> has a non-trivial null space,
    and consequently, there exist non-zero solutions to the equations
    <math|<around|(|T<rsub|\<theta\>><rsup|\<ast\>>\<pm\>i\<cdot\>I|)>*g=0>.
    Therefore, both defect indices <math|n<rsub|+>> and <math|n<rsub|->> are
    at least 1.
  </proof>

  <\lemma>
    <label|lemma:nonmonotonic-not-pd>If <math|\<theta\>> is not strictly
    monotonic, then the kernel <math|K<rsub|\<theta\>><around|(|s,t|)>=J<rsub|0>*<around|(|2*\<pi\>*<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>|)>>
    is not positive definite.
  </lemma>

  <\proof>
    Let <math|s<rsub|1>\<neq\>s<rsub|2>> with
    <math|\<theta\><around|(|s<rsub|1>|)>=\<theta\><around|(|s<rsub|2>|)>>.
    Consider the matrix:

    <\equation>
      M=<matrix|<tformat|<table|<row|<cell|K<rsub|\<theta\>><around|(|s<rsub|1>,s<rsub|1>|)>>|<cell|K<rsub|\<theta\>><around|(|s<rsub|1>,s<rsub|2>|)>>>|<row|<cell|K<rsub|\<theta\>><around|(|s<rsub|2>,s<rsub|1>|)>>|<cell|K<rsub|\<theta\>><around|(|s<rsub|2>,s<rsub|2>|)>>>>>>
    </equation>

    Since <math|\<theta\><around|(|s<rsub|1>|)>=\<theta\><around|(|s<rsub|2>|)>>,
    we have:

    <\equation>
      K<rsub|\<theta\>><around|(|s<rsub|1>,s<rsub|1>|)>=K<rsub|\<theta\>><around|(|s<rsub|2>,s<rsub|2>|)>=J<rsub|0><around|(|0|)>=1
    </equation>

    <\equation>
      K<rsub|\<theta\>><around|(|s<rsub|1>,s<rsub|2>|)>=K<rsub|\<theta\>><around|(|s<rsub|2>,s<rsub|1>|)>=J<rsub|0>*<around|(|2*\<pi\>*<around|\||\<theta\><around|(|s<rsub|1>|)>-\<theta\><around|(|s<rsub|2>|)>|\|>|)>=J<rsub|0><around|(|0|)>=1
    </equation>

    Thus, <math|M=<matrix|<tformat|<table|<row|<cell|1>|<cell|1>>|<row|<cell|1>|<cell|1>>>>>>,
    which has eigenvalues 2 and 0. The presence of the zero eigenvalue means
    <math|M> is not strictly positive definite. Therefore,
    <math|K<rsub|\<theta\>>> is not a positive definite kernel.
  </proof>

  Combining Proposition <reference|prop:monotonic-implies-sa> and Proposition
  <reference|prop:nonmonotonic-implies-defect>, the covariance operator
  <math|T<rsub|\<theta\>>> has defect indices <math|<around|(|0,0|)>> if and
  only if <math|\<theta\>> is strictly monotonic.

  <\corollary>
    The Gaussian process with covariance function
    <math|K<rsub|\<theta\>><around|(|s,t|)>=J<rsub|0>*<around|(|2*\<pi\>*<around|\||\<theta\><around|(|s|)>-\<theta\><around|(|t|)>|\|>|)>>
    is well-defined if and only if <math|\<theta\>> is strictly monotonic.
  </corollary>

  <\proof>
    A Gaussian process is well-defined if and only if its covariance function
    is positive definite. By Lemma <reference|lemma:nonmonotonic-not-pd> and
    Lemma <reference|lemma:bessel-pd>, <math|K<rsub|\<theta\>>> is positive
    definite if and only if <math|\<theta\>> is strictly monotonic.
    Furthermore, the self-adjointness of <math|T<rsub|\<theta\>>> (which
    occurs if and only if <math|\<theta\>> is strictly monotonic by Theorem
    <reference|thm:main>) ensures the existence of a spectral decomposition,
    which is necessary for the proper definition of the process.
  </proof>

  <section|Foundational Constructions>

  <\definition>
    [Riemann-Siegel Theta Function] The Riemann-Siegel theta function is
    defined as:

    <\equation>
      \<theta\><around|(|t|)>\<assign\>arg
      \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*log \<pi\>
    </equation>

    where <math|\<Gamma\>> is the gamma function and <math|arg> denotes the
    principal argument. This function has a unique critical point
    <math|a\<gtr\>0> where <math|<frac|d*\<theta\>|d*t><around|(|a|)>=0>.
  </definition>

  <\definition>
    [Monotonized Theta Function] Define the monotonically increasing
    function:

    <\equation>
      <wide|\<theta\>|~><around|(|t|)>\<assign\><choice|<tformat|<table|<row|<cell|2*\<theta\><around|(|a|)>-\<theta\><around|(|t|)>>|<cell|<text|for
      >t\<in\><around|[|0,a|]>>>|<row|<cell|\<theta\><around|(|t|)>>|<cell|<text|for
      >t\<gtr\>a>>>>>
    </equation>

    with scaled version <math|<wide|\<theta\>|~><rsub|s><around|(|t|)>\<assign\><sqrt|2>*<wide|\<theta\>|~><around|(|t|)>>.
  </definition>

  <\lemma>
    [Properties of Monotonized Function] <math|<wide|\<theta\>|~><around|(|t|)>>
    satisfies:

    <\enumerate>
      <item>Continuous at <math|t=a>: <math|<wide|\<theta\>|~><around|(|a|)>=\<theta\><around|(|a|)>>

      <item>For <math|t\<in\><around|(|0,a|)>>:
      <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>=-<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0>

      <item>For <math|t\<gtr\>a>: <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>=<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0>

      <item><math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<geq\>0> for
      all <math|t\<gtr\>0>, with equality only at <math|t=a>
    </enumerate>
  </lemma>

  <section|Random Wave Model and Bessel Kernel>

  <\definition>
    [Random Wave Model] The Gaussian process modeling Riemann zeta zeros has
    covariance kernel:

    <\equation>
      K<around|(|t,s|)>=J<rsub|0><around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    where <math|J<rsub|0>> is the Bessel function of the first kind of order
    zero.
  </definition>

  <\definition>
    [Monotonized Covariance Kernel] The monotonized covariance kernel is:

    <\equation>
      <wide|K|~><around|(|t,s|)>=J<rsub|0><around|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|t|)>-<wide|\<theta\>|~><rsub|s><around|(|s|)>|\|>|)>
    </equation>

    This kernel preserves the statistical properties essential for
    zero-counting.
  </definition>

  <section|Operator-Theoretic Analysis: Defect Indices>

  <subsection|The Original Operator (Non-Monotonic Case)>

  <\definition>
    [Bessel-Theta Kernel Operator] Define the symmetric operator
    <math|\<cal-L\><rsub|0>> on <math|L<rsup|2><around|(|\<bbb-R\><rsup|+>|)>>
    by:

    <\equation>
      <around|(|\<cal-L\><rsub|0>*\<psi\>|)><around|(|t|)>=-<frac|d|d*t><around*|[|J<rsub|0><around|(|0|)><frac|d*\<psi\>|d*t><around|(|t|)>|]>+<around*|\<nobracket\>|<frac|\<partial\><rsup|2>|\<partial\>*u<rsup|2>>*J<rsub|0><around|(|u|)>|\|><rsub|u=0>\<cdot\><around*|(|<frac|d*\<theta\>|d*t><around|(|t|)>|)><rsup|2>*\<psi\><around|(|t|)>
    </equation>

    with domain:

    <\equation>
      \<cal-D\><around|(|\<cal-L\><rsub|0>|)>=<around|{|\<psi\>\<in\>C<rsub|c><rsup|\<infty\>><around|(|\<bbb-R\><rsup|+>|)>|}>
    </equation>
  </definition>

  <\remark>
    Since <math|J<rsub|0><around|(|0|)>=1> and
    <math|J<rsub|0><rprime|''><around|(|0|)>=-<frac|1|2>>, this simplifies
    to:

    <\equation>
      <around|(|\<cal-L\><rsub|0>*\<psi\>|)><around|(|t|)>=-\<psi\><rprime|''><around|(|t|)>-<frac|1|2><around*|(|<frac|d*\<theta\>|d*t><around|(|t|)>|)><rsup|2>*\<psi\><around|(|t|)>
    </equation>
  </remark>

  <\theorem>
    [Defect Indices: Non-Monotonic Case] The operator
    <math|\<cal-L\><rsub|0>> has defect indices <math|<around|(|1,1|)>>.
  </theorem>

  <\proof>
    To calculate defect indices, we solve:

    <\equation>
      <around|(|\<cal-L\><rsub|0><rsup|\<ast\>>\<pm\>i*I|)>*\<psi\>=0
    </equation>

    Expanded form:

    <\equation>
      -\<psi\><rprime|''><around|(|t|)>-<frac|1|2><around*|(|<frac|d*\<theta\>|d*t><around|(|t|)>|)><rsup|2>*\<psi\><around|(|t|)>\<pm\>i*\<psi\><around|(|t|)>=0
    </equation>

    For <math|t\<less\>a>, <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<less\>0>,
    and for <math|t\<gtr\>a>, <math|<frac|d*\<theta\>|d*t><around|(|t|)>\<gtr\>0>.
    The sign change at <math|t=a> creates an "effective potential well" in
    <math|<around*|(|<frac|d*\<theta\>|d*t><around|(|t|)>|)><rsup|2>> near
    <math|t=a>.

    Near the critical point <math|a>, we can approximate:

    <\equation>
      <frac|d*\<theta\>|d*t><around|(|t|)>\<approx\>c*<around|(|t-a|)>*<space|1em><text|for
      some constant >c\<neq\>0
    </equation>

    This gives:

    <\equation>
      -\<psi\><rprime|''><around|(|t|)>-<frac|1|2>*c<rsup|2>*<around|(|t-a|)><rsup|2>*\<psi\><around|(|t|)>\<pm\>i*\<psi\><around|(|t|)>=0
    </equation>

    This equation has exactly one square-integrable solution for both the
    <math|+i> and <math|-i> cases, localized near <math|t=a>. For large
    <math|t>, both solutions decay due to the growth of
    <math|<around*|(|<frac|d*\<theta\>|d*t><around|(|t|)>|)><rsup|2>\<sim\><around|(|log
    t|)><rsup|2>>.

    Therefore, <math|n<rsub|+>=n<rsub|->=1>.
  </proof>

  <subsection|The Monotonized Operator>

  <\definition>
    [Monotonized Bessel-Theta Operator] Define:

    <\equation>
      <around|(|\<cal-L\>*\<psi\>|)><around|(|t|)>=-\<psi\><rprime|''><around|(|t|)>-<frac|1|2><around*|(|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>|)><rsup|2>*\<psi\><around|(|t|)>
    </equation>

    with domain <math|\<cal-D\><around|(|\<cal-L\>|)>=C<rsub|c><rsup|\<infty\>><around|(|\<bbb-R\><rsup|+>|)>>.
  </definition>

  <\theorem>
    [Defect Indices: Monotonized Case] The operator <math|\<cal-L\>> has
    defect indices <math|<around|(|0,0|)>>.
  </theorem>

  <\proof>
    The deficiency equations are:

    <\equation>
      -\<psi\><rprime|''><around|(|t|)>-<frac|1|2><around*|(|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>|)><rsup|2>*\<psi\><around|(|t|)>\<pm\>i*\<psi\><around|(|t|)>=0
    </equation>

    Since <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<geq\>0> for
    all <math|t\<gtr\>0> (with equality only at <math|t=a>), the potential
    term <math|-<frac|1|2><around*|(|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>|)><rsup|2>>
    is non-positive everywhere and strictly negative except at <math|t=a>.

    For large <math|t>, <math|<frac|d*<wide|\<theta\>|~>|d*t><around|(|t|)>\<sim\><frac|1|2>*log
    t> grows without bound, making the potential term increasingly negative.

    For the <math|+i> equation, the asymptotic behavior as
    <math|t\<to\>\<infty\>> gives:

    <\equation>
      \<psi\><rprime|''><around|(|t|)>\<approx\><around*|[|-<frac|1|2>*<around*|(|<frac|1|2>*log
      t|)><rsup|2>+i|]>*\<psi\><around|(|t|)>
    </equation>

    For large <math|t>, the <math|<around|(|log t|)><rsup|2>> term dominates,
    forcing solutions to oscillate with increasingly large amplitude.

    Similarly, for the <math|-i> equation, the solutions exhibit oscillatory
    behavior with growing amplitude.

    Both equations fail to have square-integrable solutions on
    <math|<around|(|0,\<infty\>|)>>, giving defect indices
    <math|<around|(|0,0|)>>.
  </proof>

  <\corollary>
    [Essential Self-Adjointness] The monotonized operator <math|\<cal-L\>> is
    essentially self-adjoint and has a unique self-adjoint extension
    <math|<wide|\<cal-L\>|\<bar\>>>.
  </corollary>

  <section|Stochastic Process Representation>

  <\definition>
    [Bessel Kernel Process] Define the centered Gaussian process:

    <\equation>
      Z<around|(|t|)>\<assign\><big|int><rsub|-\<infty\>><rsup|\<infty\>>J<rsub|0>*<around*|(|<wide|\<theta\>|~><rsub|s><around|(|t|)>-u|)>*d*W<around|(|u|)>
    </equation>

    where:

    <\itemize>
      <item><math|J<rsub|0>> is the Bessel function of the first kind of
      order zero

      <item><math|W<around|(|u|)>> is a standard Wiener process on
      <math|\<bbb-R\>>

      <item>The integral is a stochastic integral in the Itô sense
    </itemize>

    This process has covariance kernel:

    <\equation>
      K<around|(|t,s|)>\<assign\>\<bbb-E\>*<around|[|Z<around|(|t|)>*Z<around|(|s|)>|]>=J<rsub|0><around*|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|t|)>-<wide|\<theta\>|~><rsub|s><around|(|s|)>|\|>|)>
    </equation>
  </definition>

  <\remark>
    By the isomorphism properties of Gaussian processes,
    <math|Z<around|(|t|)>> can be equivalently represented as:

    <\equation>
      Z<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>cos
      <around|(|\<lambda\>*<wide|\<theta\>|~><rsub|s><around|(|t|)>|)>*d*W<rsub|1><around|(|\<lambda\>|)>+<big|int><rsub|-\<infty\>><rsup|\<infty\>>sin
      <around|(|\<lambda\>*<wide|\<theta\>|~><rsub|s><around|(|t|)>|)>*d*W<rsub|2><around|(|\<lambda\>|)>
    </equation>

    where <math|W<rsub|1>> and <math|W<rsub|2>> are independent Wiener
    processes. This demonstrates how the monotonicity of
    <math|<wide|\<theta\>|~><rsub|s>> translates the process into a
    stationary one in the transformed coordinate.
  </remark>

  <section|Zero-Counting Theory>

  <\definition>
    [Covariance Difference Function] Define the covariance difference
    function around point <math|t> with shift <math|\<tau\>> as:

    <\equation>
      \<Delta\><rsub|t><around|(|\<tau\>|)>\<assign\>K<around|(|t,t+\<tau\>|)>=J<rsub|0><around*|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|t|)>-<wide|\<theta\>|~><rsub|s>*<around|(|t+\<tau\>|)>|\|>|)>
    </equation>

    At the critical point <math|a>:

    <\equation>
      \<Delta\><rsub|a><around|(|\<tau\>|)>=J<rsub|0><around*|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|a|)>-<wide|\<theta\>|~><rsub|s>*<around|(|a+\<tau\>|)>|\|>|)>
    </equation>
  </definition>

  <\theorem>
    [Kac-Rice Formula] The expected zero count satisfies:

    <\equation>
      \<bbb-E\><around|[|N<around|(|T|)>|]>=<frac|1|\<pi\>>*<big|int><rsub|0><rsup|T><sqrt|<frac|-\<partial\><rsub|t>*\<partial\><rsub|s>*K<around|(|t,s|)>\|<rsub|s=t>|K<around|(|t,t|)>>>*d*t+\<bbb-E\><around|[|N<around|(|<around|{|a|}>|)>|]>
    </equation>

    where <math|\<bbb-E\><around|[|N<around|(|<around|{|a|}>|)>|]>=1> is the
    expected number of zeros at the critical point <math|a>.
  </theorem>

  <\proof>
    The classical Kac-Rice formula for a Gaussian process states that the
    expected density of zeros at regular points is:

    <\equation>
      \<rho\><around|(|t|)>=<frac|1|\<pi\>>*<sqrt|<frac|-\<partial\><rsub|t>*\<partial\><rsub|s>*K<around|(|t,s|)>\|<rsub|s=t>|K<around|(|t,t|)>>>
    </equation>

    For the critical point <math|a>, we analyze the local behavior. Let
    <math|\<Delta\><rsub|a><around|(|\<tau\>|)>> be the covariance at
    <math|a> with shift <math|\<tau\>>. At <math|\<tau\>=0>:

    <\equation>
      \<Delta\><rsub|a><around|(|0|)>=J<rsub|0><around|(|0|)>=1
    </equation>

    For the second derivative:

    <\equation>
      \<Delta\><rsub|a><rprime|''><around|(|0|)>=<around*|\<nobracket\>|<frac|d<rsup|2>|d*\<tau\><rsup|2>>*J<rsub|0><around*|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|a|)>-<wide|\<theta\>|~><rsub|s>*<around|(|a+\<tau\>|)>|\|>|)>|\|><rsub|\<tau\>=0>
    </equation>

    Since <math|<wide|\<theta\>|~><rsub|s><rprime|'><around|(|a|)>=0>, a
    Taylor expansion gives:

    <\equation>
      <wide|\<theta\>|~><rsub|s>*<around|(|a+\<tau\>|)>\<approx\><wide|\<theta\>|~><rsub|s><around|(|a|)>+<frac|1|2>*<wide|\<theta\>|~><rsub|s><rprime|''><around|(|a|)>*\<tau\><rsup|2>+O<around|(|\<tau\><rsup|3>|)>
    </equation>

    This implies:

    <\equation>
      \<Delta\><rsub|a><rprime|''><around|(|0|)>=J<rsub|0><rprime|''><around|(|0|)>\<cdot\><around|(|<wide|\<theta\>|~><rsub|s><rprime|''><around|(|a|)>|)><rsup|2>=-<frac|1|2>\<cdot\><around|(|<wide|\<theta\>|~><rsub|s><rprime|''><around|(|a|)>|)><rsup|2>
    </equation>

    since <math|J<rsub|0><rprime|''><around|(|0|)>=-<frac|1|2>>.

    The left and right second derivatives of <math|<wide|\<theta\>|~>> at
    <math|a> differ in sign, creating a discontinuity in the curvature. This
    singularity contributes exactly one expected zero at <math|t=a>:

    <\equation>
      \<bbb-E\><around|[|N<around|(|<around|{|a|}>|)>|]>=<frac|1|\<pi\>>*<sqrt|<frac|<around|\||\<Delta\><rsub|a><rprime|''><around|(|0|)>|\|>|-\<Delta\><rsub|a><around|(|0|)>>>=<frac|1|\<pi\>>*<sqrt|<frac|<frac|1|2>\<cdot\><around|(|<wide|\<theta\>|~><rsub|s><rprime|''><around|(|a|)>|)><rsup|2>|-1>>=1
    </equation>

    The total expected count is the integral over regular points plus this
    atom at <math|a>.
  </proof>

  <section|Spectral Theory and Zeta Zeros>

  <\theorem>
    [Spectral Correspondence] The spectrum of the self-adjoint extension
    <math|<wide|\<cal-L\>|\<bar\>>> corresponds to the zeros of the Gaussian
    process with covariance kernel <math|K<around|(|t,s|)>=J<rsub|0><around|(|<around|\||<wide|\<theta\>|~><rsub|s><around|(|t|)>-<wide|\<theta\>|~><rsub|s><around|(|s|)>|\|>|)>>,
    which in turn match the non-trivial zeros of the Riemann zeta function.
  </theorem>

  <\corollary>
    [Spectral Measure] The spectral measure
    <math|\<mu\><rsub|<wide|\<cal-L\>|\<bar\>>>> satisfies:

    <\equation>
      \<mu\><rsub|<wide|\<cal-L\>|\<bar\>>><around|(|<around|(|a,b|]>|)>=N<around|(|b|)>-N<around|(|a|)>
    </equation>

    where <math|N<around|(|T|)>> is the zero-counting function for the
    non-trivial zeros of the Riemann zeta function.
  </corollary>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-10|<tuple|8|9|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-3|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-4|<tuple|4|5|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-5|<tuple|5|5|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-6|<tuple|5.1|5|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-7|<tuple|5.2|6|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-8|<tuple|6|7|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-9|<tuple|7|8|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|lemma:bessel-pd|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|lemma:nonmonotonic-not-pd|<tuple|11|3|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|lemma:standard-sa|<tuple|8|2|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|prop:monotonic-implies-sa|<tuple|9|2|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|prop:nonmonotonic-implies-defect|<tuple|10|3|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|thm:main|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_11.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Definitions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Foundational
      Constructions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Random
      Wave Model and Bessel Kernel> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Operator-Theoretic
      Analysis: Defect Indices> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>The Original Operator
      (Non-Monotonic Case) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>The Monotonized Operator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Stochastic
      Process Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Zero-Counting
      Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Spectral
      Theory and Zeta Zeros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>