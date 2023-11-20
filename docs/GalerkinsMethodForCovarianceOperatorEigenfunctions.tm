<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <subsection|Objective><label|objective><label|objective>

  Determine the eigenfunctions of an integral covariance operator with
  kernels belonging to the class of absolutely continuous, positive definite,
  infinitely differentiable functions on <math|\<bbb-R\>>, by transforming a
  pointwise convergent polynomial basis into a uniformly convergent series
  and subsequently into a Sturm-Liouville problem.

  <subsection|Background><label|background><label|background>

  <\itemize>
    <item><with|font-series|bold|Kernel Class>: The focus is on kernels
    <math|K<around|(|h|)>> where <math|h=<around|\||t-s|\|>> and <math|K>
    belongs to the class of absolutely continuous, positive definite,
    infinitely differentiable functions on <math|\<bbb-R\>>.

    <item><with|font-series|bold|Mercer's Theorem>: Ensures the existence of
    a uniformly convergent series for such kernels.
  </itemize>

  <subsection|Methodology><label|methodology><label|methodology>

  <subsubsection|1. Galerkin Method for Uniform
  Convergence><label|galerkin-method-for-uniform-convergence><label|galerkin-method-for-uniform-convergence>

  <\itemize>
    <item><with|font-series|bold|Projection>: Apply the Galerkin method to
    project the kernel <math|K<around|(|h|)>> onto a polynomial basis:
  </itemize>

  To properly isolate <math|c<rsub|m>> in the equation, let's follow these
  steps:

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>>

    <item>Start with the integral equation:
  </enumerate>

  <\equation>
    \<phi\><around|(|x|)>=\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|x,y|)>*\<phi\><around|(|y|)>*d*y
  </equation>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|1>

    <item>Expand <math|\<phi\><around|(|x|)>> using the orthogonal basis
    <math|P<rsub|n><around|(|x|)>>:
  </enumerate>

  <\equation>
    \<phi\><around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*P<rsub|n><around|(|x|)>
  </equation>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|2>

    <item>Substitute this into the integral equation:
  </enumerate>

  <\equation>
    <big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*P<rsub|n><around|(|x|)>=\<lambda\>*<big|int><rsub|a><rsup|b>K<around|(|x,y|)>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*P<rsub|n><around|(|y|)>*d*y
  </equation>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|3>

    <item>Multiply both sides by <math|P<rsub|m><around|(|x|)>> and integrate
    over <math|<around|[|a,b|]>>:
  </enumerate>

  <\equation>
    <big|int><rsub|a><rsup|b>P<rsub|m><around|(|x|)>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*P<rsub|n><around|(|x|)>*d*x=\<lambda\>*<big|int><rsub|a><rsup|b>P<rsub|m><around|(|x|)>*<big|int><rsub|a><rsup|b>K<around|(|x,y|)>*<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*P<rsub|n><around|(|y|)>*d*y*d*x
  </equation>

  <\enumerate>
    <assign|labelenumi|<macro|<number|<enumi-nr>|arabic>.>><assign|enumi-nr|4>

    <item>Using the orthogonality of <math|P<rsub|n><around|(|x|)>>:
  </enumerate>

  <\equation>
    c<rsub|m>=\<lambda\>*<big|int><rsub|a><rsup|b><big|int><rsub|a><rsup|b>K<around|(|x,y|)>*P<rsub|m><around|(|y|)>*P<rsub|m><around|(|x|)>*d*y*d*x
  </equation>

  This isolates <math|c<rsub|m>> on one side of the equation, providing a
  formula to compute each coefficient <math|c<rsub|m>> in the expansion of
  <math|\<phi\><around|(|x|)>>.

  This process transitions from a polynomial basis for the kernel that
  converges pointwisely to uniform convergence due to the conditions for
  <hlink|Mercer's theorem|MercersTheorem> being satisifed. See
  [[PointwiseVsUniformConvergence]]

  <subsubsection|2. Series Expansion and Fubini's
  Theorem><label|series-expansion-and-fubinis-theorem><label|series-expansion-and-fubinis-theorem>

  <\itemize>
    <item><with|font-series|bold|Series Substitution>: Replace the kernel
    <math|K<around|(|h|)>> in the integral eigenvalue equation with its
    uniformly convergent series expansion:
  </itemize>

  <\equation>
    <big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*P<rsub|n><around|(|x|)><around*|(|<big|int><rsub|a><rsup|b>P<rsub|n><around|(|y|)>*\<phi\><around|(|y|)>*d*y|)>=\<lambda\>*\<phi\><around|(|x|)>
  </equation>

  <\itemize>
    <item><with|font-series|bold|Applying Fubini's Theorem>: The absolute
    continuity and infinite differentiability of <math|K<around|(|h|)>> allow
    for the interchange of summation and integration:
  </itemize>

  <\equation>
    <big|int><rsub|a><rsup|b><around*|(|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>*P<rsub|n><around|(|x|)>*P<rsub|n><around|(|y|)>|)>*\<phi\><around|(|y|)>*d*y=\<lambda\>*\<phi\><around|(|x|)>
  </equation>

  <subsubsection|3. Sturm-Liouville Differential Equation
  Formation><label|sturm-liouville-differential-equation-formation><label|sturm-liouville-differential-equation-formation>

  <\itemize>
    <item><with|font-series|bold|Differentiation>: Differentiate the modified
    equation twice with respect to <math|x> to form a Sturm-Liouville
    differential equation.
  </itemize>

  <subsubsection|4. Eigenfunction Determination><label|eigenfunction-determination><label|eigenfunction-determination>

  <\itemize>
    <item><with|font-series|bold|Solving the Equation>: Solve the
    Sturm-Liouville differential equation to determine the eigenfunctions
    <math|\<phi\><around|(|x|)>> for each term.
  </itemize>

  This methodology provides a rigorous approach for finding eigenfunctions of
  integral covariance operators with kernels from this specific class,
  utilizing advanced mathematical techniques and transformations.
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
    <associate|auto-4|<tuple|3.1|1>>
    <associate|auto-5|<tuple|3.2|2>>
    <associate|auto-6|<tuple|3.3|2>>
    <associate|auto-7|<tuple|3.4|2>>
    <associate|background|<tuple|2|1>>
    <associate|eigenfunction-determination|<tuple|3.4|2>>
    <associate|galerkin-method-for-uniform-convergence|<tuple|3.1|1>>
    <associate|methodology|<tuple|3|1>>
    <associate|objective|<tuple|1|1>>
    <associate|series-expansion-and-fubinis-theorem|<tuple|3.2|2>>
    <associate|sturm-liouville-differential-equation-formation|<tuple|3.3|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc>Objective
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|2<space|2spc>Background
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|3<space|2spc>Methodology
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|3.1<space|2spc>1. Galerkin Method for
      Uniform Convergence <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|3.2<space|2spc>2. Series Expansion and
      Fubini's Theorem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|3.3<space|2spc>3. Sturm-Liouville
      Differential Equation Formation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|3.4<space|2spc>4. Eigenfunction
      Determination <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>
    </associate>
  </collection>
</auxiliary>