<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  The construction of the integral operational matrix, especially in the
  context of orthogonal polynomials like the shifted Jacobi polynomials,
  requires knowledge of several components:

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item><with|font-series|bold|Orthogonal Polynomial Basis>:

    <\itemize>
      <item>The choice of the orthogonal polynomial basis (e.g., Shifted
      Jacobi, Shifted Legendre, etc.) is fundamental. Each polynomial basis
      will have its own set of properties, recursion relations, and weight
      functions.

      <item>The orthogonality property of these polynomials is crucial for
      the construction of the operational matrix.
    </itemize>

    <item><with|font-series|bold|Definition of the Operational Matrix>:

    <\itemize>
      <item>An operational matrix is typically a square matrix, where the
      entry in the <math|i>-th row and <math|j>-th column represents the
      integral of the product of the <math|i>-th and <math|j>-th basis
      polynomials.

      <item>Mathematically, the element <math|P<rsub|i*j>> of the matrix
      <math|P> is given by:
    </itemize>
  </enumerate>

  <\equation>
    P<rsub|i*j>=<big|int><rsub|a><rsup|b>\<phi\><rsub|i><around|(|x|)>*\<phi\><rsub|j><around|(|x|)>*w<around|(|x|)>*d*x
  </equation>

  where <math|\<phi\><rsub|i><around|(|x|)>> and
  <math|\<phi\><rsub|j><around|(|x|)>> are the basis polynomials, and
  <math|w<around|(|x|)>> is the weight function associated with the chosen
  orthogonal polynomial.

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|2>

    <item><with|font-series|bold|Integration Limits and Weight Function>:

    <\itemize>
      <item>The limits of integration, <math|a> and <math|b>, and the weight
      function <math|w<around|(|x|)>> depend on the choice of the orthogonal
      polynomial.

      <item>For instance, for the standard Jacobi polynomials, the weight
      function is <math|<around|(|1-x|)><rsup|\<alpha\>>*<around|(|1+x|)><rsup|\<beta\>>>
      and the domain is typically <math|<around|[|-1,1|]>>.
    </itemize>

    <item><with|font-series|bold|Computational Tools>:

    <\itemize>
      <item>To actually compute the elements of the operational matrix, one
      would typically use symbolic computation tools (like Mathematica,
      Maple, or SymPy in Python) or numerical integration methods if symbolic
      methods are not feasible.
    </itemize>

    <item><with|font-series|bold|Size of the Matrix>:

    <\itemize>
      <item>The size of the operational matrix depends on the truncation or
      the number of terms considered in the polynomial expansion. If <math|N>
      terms are considered, the matrix will be of size <math|N\<times\>N>.
    </itemize>

    <item><with|font-series|bold|Properties of the Operational Matrix>:

    <\itemize>
      <item>Some matrices, depending on the polynomial basis, may have
      specific properties that can be exploited to simplify computations
      (e.g., diagonal dominance, sparsity). Understanding these can help in
      optimizing calculations.
    </itemize>

    <item><with|font-series|bold|Application to Differential Equations>:

    <\itemize>
      <item>Once the operational matrix is constructed, it can be used to
      transform differential equations into algebraic equations. This
      typically involves expressing the function in terms of the chosen
      polynomial basis, applying the operational matrix, and then simplifying
      to get a system of algebraic equations.
    </itemize>
  </enumerate>

  In the context of the paper you provided, the specifics of the shifted
  Jacobi polynomial and its associated weight function would be crucial in
  constructing the shifted Jacobi polynomial integral operational matrix.
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>