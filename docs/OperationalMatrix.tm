<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Shifted Jacobi Polynomial Integral Operational Matrix
  for Solving Fractional Riccati Equations>|<doc-author|<author-data|<author-name|Assistant>>>|<doc-date|<date|>>>

  <section|Introduction>

  This article details the use of the shifted Jacobi polynomial integral
  operational matrix in solving fractional Riccati differential equations
  using a spectral method.

  <section|Shifted Jacobi Polynomials>

  The shifted Jacobi polynomials <math|J<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>
  on <math|<around|[|0,1|]>> are defined by:

  <\equation>
    J<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<big|sum><rsub|k=0><rsup|n><around|(|-1|)><rsup|n-k><binom|n+\<alpha\>|k><binom|n+\<beta\>|n-k>x<rsup|k>
  </equation>

  where <math|\<alpha\>,\<beta\>\<gtr\>-1> are parameters. These polynomials
  satisfy the orthogonality relation:

  <\equation>
    <big|int><rsub|0><rsup|1>x<rsup|\<alpha\>>*<around|(|1-x|)><rsup|\<beta\>>*J<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*J<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*d*x=h<rsub|n>*\<delta\><rsub|m*n>
  </equation>

  where <math|h<rsub|n>> is the normalization constant:

  <\equation>
    h<rsub|n>=<frac|\<Gamma\>*<around|(|n+\<alpha\>+1|)>*\<Gamma\>*<around|(|n+\<beta\>+1|)>|<around|(|2*n+\<alpha\>+\<beta\>+1|)>*n!\<Gamma\>*<around|(|n+\<alpha\>+\<beta\>+1|)>>
  </equation>

  <section|Integral Operational Matrix>

  The integral operational matrix <math|P> for shifted Jacobi polynomials is
  defined as:

  <\equation>
    P<rsub|i*j>=<big|int><rsub|0><rsup|1>J<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*J<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*d*x
  </equation>

  For an <math|N>-term representation, <math|P> is an <math|N\<times\>N>
  matrix. This matrix allows us to express the integral of a function
  <math|f<around|(|x|)>=<big|sum><rsub|i=0><rsup|\<infty\>>c<rsub|i>*J<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>
  as:

  <\equation>
    <big|int><rsub|0><rsup|x>f<around|(|t|)>*d*t=<math-bf|X><rsup|T>P<math-bf|C>
  </equation>

  where <math|<math-bf|X>> is the vector of Jacobi polynomials and
  <math|<math-bf|C>> is the vector of coefficients.

  <section|Application to Fractional Riccati Equations>

  Consider the fractional Riccati equation:

  <\equation>
    D<rsup|\<alpha\>>*y<around|(|x|)>=p<around|(|x|)>+q<around|(|x|)>*y<around|(|x|)>+r<around|(|x|)>*y<rsup|2><around|(|x|)>,<space|1em>0\<less\>\<alpha\>\<leq\>1
  </equation>

  with initial condition <math|y<around|(|0|)>=y<rsub|0>>.

  The spectral method involves the following steps:

  <\enumerate>
    <item>Express <math|y<around|(|x|)>> using shifted Jacobi polynomials:

    <\equation>
      y<around|(|x|)>=<big|sum><rsub|i=0><rsup|\<infty\>>c<rsub|i>*J<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<math-bf|C><rsup|T><math-bf|X><around|(|x|)>
    </equation>

    <item>Express the fractional derivative using the Caputo definition:

    <\equation>
      D<rsup|\<alpha\>>*y<around|(|x|)>=I<rsup|1-\<alpha\>>*<frac|d|d*x>*y<around|(|x|)>
    </equation>

    where <math|I<rsup|1-\<alpha\>>> is the Riemann-Liouville fractional
    integral operator.

    <item>Use the operational matrix to represent the fractional integral:

    <\equation>
      I<rsup|1-\<alpha\>>*y<around|(|x|)>=<math-bf|X><rsup|T>P<rsup|1-\<alpha\>><math-bf|C>
    </equation>

    <item>Express the nonlinear term:

    <\equation>
      y<rsup|2><around|(|x|)>=<around|(|<math-bf|C><rsup|T><math-bf|X><around|(|x|)>|)><rsup|2>=<math-bf|C><rsup|T><wide|<math-bf|X>|^><math-bf|C>
    </equation>

    where <math|<wide|<math-bf|X>|^>> is a matrix formed by the products of
    Jacobi polynomials.

    <item>Substitute these expressions into the original equation:

    <\equation>
      <math-bf|X><rsup|T>D*P<rsup|1-\<alpha\>><math-bf|C>=p<around|(|x|)>+q<around|(|x|)><math-bf|C><rsup|T><math-bf|X><around|(|x|)>+r<around|(|x|)><around|(|<math-bf|C><rsup|T><wide|<math-bf|X>|^><math-bf|C>|)>
    </equation>

    where <math|D> is the operational matrix for differentiation.

    <item>Apply the Galerkin method by multiplying both sides by
    <math|<math-bf|X><around|(|x|)>> and integrating over
    <math|<around|[|0,1|]>>:

    <\equation>
      <big|int><rsub|0><rsup|1><math-bf|X><around|(|x|)><math-bf|X><rsup|T><around|(|x|)>*d*x\<cdot\>D*P<rsup|1-\<alpha\>><math-bf|C>=<big|int><rsub|0><rsup|1><math-bf|X><around|(|x|)>*<around|[|p<around|(|x|)>+q<around|(|x|)><math-bf|C><rsup|T><math-bf|X><around|(|x|)>+r<around|(|x|)><around|(|<math-bf|C><rsup|T><wide|<math-bf|X>|^><math-bf|C>|)>|]>*d*x
    </equation>

    <item>This results in a system of nonlinear algebraic equations in the
    spectral domain:

    <\equation>
      F<around|(|<math-bf|C>|)>=0
    </equation>

    <item>Solve this system for the coefficients <math|<math-bf|C>> using an
    iterative method like Newton-Raphson.
  </enumerate>

  The solution is a sequence of spectral coefficients that define an exact
  representation of the solution in the basis of Jacobi polynomials. This
  spectral representation can be interpreted as a series of functions (which
  may be polynomial, rational, or more general, depending on the specific
  problem and basis functions used). For practical computation, this infinite
  series is typically truncated, introducing an approximation at that stage.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Shifted
      Jacobi Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Integral
      Operational Matrix> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Application
      to Fractional Riccati Equations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>