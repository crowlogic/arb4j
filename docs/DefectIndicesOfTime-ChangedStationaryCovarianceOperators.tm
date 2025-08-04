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