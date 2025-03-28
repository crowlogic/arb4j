<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  \;

  The theorem presented here, known as the Null Space Property, is a
  fundamental result in the theory of orthogonal polynomials. It establishes
  a crucial relationship between the degree of an orthogonal polynomial and
  its behavior under integration with respect to its weight function.

  To understand this theorem, we need to break down its components:

  <\enumerate>
    <item>Orthogonal polynomials: These are a sequence of polynomials
    <math|<around|{|P<rsub|n><around|(|x|)>|}><rsub|n=0><rsup|\<infty\>>>
    that are orthogonal with respect to a weight function
    <math|w<around|(|x|)>> on an interval <math|<around|[|a,b|]>>. This means
    that for any two different polynomials in the sequence, their product
    integrated over the interval with the weight function equals zero.

    <item>Weight function: The function <math|w<around|(|x|)>> is
    non-negative on the interval <math|<around|[|a,b|]>> and plays a crucial
    role in defining the orthogonality of the polynomial sequence.

    <item>Null space: In this context, the null space refers to the set of
    functions <math|f<around|(|x|)>> for which the linear functional
    <math|L<around|[|f|]>=<big|int><rsub|a><rsup|b>f<around|(|x|)>*w<around|(|x|)>*d*x>
    equals zero.
  </enumerate>

  The theorem states that for any orthogonal polynomial
  <math|P<rsub|n><around|(|x|)>> in the sequence, it lies in the null space
  of <math|L<around|[|f|]>> if and only if its degree <math|n> is greater
  than zero. This has profound implications:

  <\itemize>
    <item>All orthogonal polynomials of degree 1 or higher integrate to zero
    when multiplied by their weight function over the interval of
    orthogonality.

    <item>The constant polynomial <math|P<rsub|0><around|(|x|)>> (which is
    typically normalized to 1) is the only orthogonal polynomial that does
    not lie in the null space.
  </itemize>

  The proof of this theorem relies on the fundamental orthogonality relation:

  <\equation*>
    <big|int><rsub|a><rsup|b>P<rsub|n><around|(|x|)>*P<rsub|m><around|(|x|)>*w<around|(|x|)>*d*x=h<rsub|n>*\<delta\><rsub|n*m>
  </equation*>

  where <math|h<rsub|n>\<gtr\>0> and <math|\<delta\><rsub|n*m>> is the
  Kronecker delta (equals 1 when <math|n=m>, and 0 otherwise).

  This theorem has significant applications in various areas of mathematics
  and physics, including:

  <\enumerate>
    <item>Approximation theory: It helps in constructing optimal polynomial
    approximations to functions.

    <item>Numerical integration: Gaussian quadrature rules, which are highly
    efficient numerical integration techniques, are based on the properties
    of orthogonal polynomials.

    <item>Quantum mechanics: Orthogonal polynomials appear in the solutions
    of the Schrödinger equation for various potential wells.
  </enumerate>

  Understanding this theorem and its proof provides deep insights into the
  structure and properties of orthogonal polynomials, which are essential
  tools in many branches of mathematics and physics.

  \;

  <section|Proof Logic Breakdown>

  The proof logic demonstrating that the integral of orthogonal polynomials
  of degree greater than zero is zero follows a clear and logical
  progression:

  <\enumerate>
    <item>Orthogonality relation: The proof begins by recalling the
    fundamental orthogonality relation for orthogonal polynomials:

    <\equation*>
      <big|int><rsub|a><rsup|b>P<rsub|n><around|(|x|)>*P<rsub|m><around|(|x|)>*w<around|(|x|)>*d*x=h<rsub|n>*\<delta\><rsub|n*m>
    </equation*>

    where <math|h<rsub|n>\<gtr\>0> and <math|\<delta\><rsub|n*m>> is the
    Kronecker delta.

    <item>Necessity (<math|n\<gtr\>0> implies integral is zero): For any
    <math|n\<gtr\>0>, we consider the integral:

    <\equation*>
      <big|int><rsub|a><rsup|b>P<rsub|n><around|(|x|)>*w<around|(|x|)>*d*x
    </equation*>

    This can be rewritten as:

    <\equation*>
      <big|int><rsub|a><rsup|b>P<rsub|n><around|(|x|)>*P<rsub|0><around|(|x|)>*w<around|(|x|)>*d*x
    </equation*>

    since <math|P<rsub|0><around|(|x|)>=1> by standard normalization.

    By the orthogonality relation, this integral equals zero when
    <math|n\<neq\>0>, which is true for all <math|n\<gtr\>0>.

    <item>Sufficiency (integral is zero implies <math|n\<gtr\>0>): If we have
    a polynomial <math|P<around|(|x|)>> of degree <math|n> such that:

    <\equation*>
      <big|int><rsub|a><rsup|b>P<around|(|x|)>*w<around|(|x|)>*d*x=0
    </equation*>

    This means <math|P<around|(|x|)>> is orthogonal to constants under the
    weight <math|w<around|(|x|)>>. Since <math|<around|{|P<rsub|k>|}><rsub|k=0><rsup|n-1>>
    forms a basis for polynomials of degree less than <math|n>, and
    <math|P<around|(|x|)>> is orthogonal to <math|P<rsub|0><around|(|x|)>>,
    we must have <math|n\<gtr\>0>.

    <item>Case <math|n=0>: For completeness, the proof shows that when
    <math|n=0>:

    <\equation*>
      <big|int><rsub|a><rsup|b>P<rsub|0><around|(|x|)>*w<around|(|x|)>*d*x=<big|int><rsub|a><rsup|b>w<around|(|x|)>*d*x=h<rsub|0>\<gtr\>0
    </equation*>

    This demonstrates that <math|P<rsub|0>> is not in the null space,
    confirming the "if and only if" nature of the theorem.
  </enumerate>

  This logical progression rigorously establishes that orthogonal polynomials
  of degree greater than zero integrate to zero when multiplied by their
  weight function, while the constant polynomial does not. The proof
  leverages the fundamental properties of orthogonal polynomials and basic
  principles of integration, providing a comprehensive demonstration of the
  theorem.
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Improper
      LaTeX Execution> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Proof
      Logic Breakdown> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>