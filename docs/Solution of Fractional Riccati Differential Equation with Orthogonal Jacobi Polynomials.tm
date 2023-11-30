<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Solution of Fractional Riccati Differential Equation
  with Orthogonal Shifted Jacobi Polynomials>>

  <\abstract>
    This paper discusses the method of solving a fractional Riccati
    differential equation using orthogonal shifted Jacobi polynomials, with a
    focus on adapting boundary conditions from Riemann-Liouville to Caputo
    fractional derivatives. The approach is particularly relevant in the
    context of the rough Heston process in financial modeling.
  </abstract>

  <section|Introduction>

  Fractional differential equations, particularly the Riccati type, have
  garnered significant interest due to their applications in various fields
  such as finance, specifically in the rough Heston model. This paper aims to
  address the solution of such equations using an innovative approach
  involving orthogonal Jacobi polynomials.

  <section|Preliminaries>

  <subsection|Fractional Derivatives>

  The concept of fractional derivatives is central to our discussion. Two
  main types of fractional derivatives are the Riemann-Liouville and Caputo
  derivatives.

  <subsubsection|Riemann-Liouville Fractional Derivative>

  The Riemann-Liouville fractional derivative of a function
  <math|f<around|(|t|)>>, denoted as <math|<rsub|a>D<rsub|t><rsup|\<alpha\>>*f<around|(|t|)>>,
  is defined as:

  <\equation>
    <rsub|a>D<rsub|t><rsup|\<alpha\>>*f<around|(|t|)>=<frac|1|\<Gamma\>*<around|(|n-\<alpha\>|)>>*<frac|d<rsup|n>|d*t<rsup|n>>*<big|int><rsub|a><rsup|t><frac|f<around|(|\<tau\>|)>|<around|(|t-\<tau\>|)><rsup|\<alpha\>+1-n>>*d*\<tau\>
  </equation>

  where <math|n-1\<less\>\<alpha\>\<less\>n>, and <math|\<Gamma\>> is the
  Gamma function.

  <subsubsection|Caputo Fractional Derivative>

  The Caputo fractional derivative, denoted as
  <math|<rsub|a><rsup|C>D<rsub|t><rsup|\<alpha\>>*f<around|(|t|)>>, is given
  by:

  <\equation>
    C<rsup|a>D<rsub|t><rsup|\<alpha\>>*f<around|(|t|)>=<rsub|a>D<rsub|t><rsup|\<alpha\>>*<around|[|f<around|(|t|)>-f<around|(|a|)>|]>+<frac|<around|(|t-a|)><rsup|-\<alpha\>>|\<Gamma\>*<around|(|1-\<alpha\>|)>>*f<around|(|a|)>
  </equation>

  <subsection|Orthogonal Jacobi Polynomials>

  Orthogonal Jacobi polynomials are employed for approximating the solution
  of differential equations. Their properties ensure well-behaved
  derivatives, which is essential in the context of fractional derivatives.

  <section|Problem Statement>

  We consider a fractional Riccati differential equation with the given
  functions <math|a<around|(|x|)>>, <math|b<around|(|x|)>>, and
  <math|g<around|(|x|)>>, and aim to solve for the unknown function
  <math|y<around|(|x|)>>. The independent variable is <math|x>, and the
  boundary condition is specified in terms of the Caputo derivative at
  <math|x=0>.

  <section|Methodology>

  <subsection|Transformation of Boundary Conditions>

  The boundary condition in the Riemann-Liouville form is transformed into
  the Caputo form. This involves ensuring that the fractional integral of
  <math|y<around|(|x|)>> over the interval from 0 to <math|x> is zero, which
  translates to the Caputo fractional derivative of <math|y<around|(|x|)>> at
  <math|x=0> being zero.

  <subsection|Solution Representation>

  The solution <math|y<around|(|x|)>> is represented as an orthogonal shifted
  Jacobi polynomial expansion. This choice guarantees that the derivatives of
  <math|y<around|(|x|)>> at the origin are well-behaved, fulfilling the
  requirements of the fractional derivative boundary conditions.

  <section|Numerical Implementation and Results>

  <subsection|Numerical Method>

  Details of the numerical implementation of the solution method are
  presented here, including the computation of the Jacobi polynomial
  expansion and the application of boundary conditions.

  <subsection|Results and Discussion>

  This section discusses the results obtained from the numerical
  implementation, along with an error analysis and comparisons with existing
  methods, if applicable.

  <section|Conclusion>

  The paper concludes with a summary of findings, implications of the
  proposed method, and suggestions for future research in this area.

  <section|References>
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
    <associate|auto-10|<tuple|4.2|2>>
    <associate|auto-11|<tuple|5|2>>
    <associate|auto-12|<tuple|5.1|2>>
    <associate|auto-13|<tuple|5.2|2>>
    <associate|auto-14|<tuple|6|2>>
    <associate|auto-15|<tuple|7|2>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2.1|1>>
    <associate|auto-4|<tuple|2.1.1|1>>
    <associate|auto-5|<tuple|2.1.2|1>>
    <associate|auto-6|<tuple|2.2|1>>
    <associate|auto-7|<tuple|3|2>>
    <associate|auto-8|<tuple|4|2>>
    <associate|auto-9|<tuple|4.1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Fractional Derivatives
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|2.1.1<space|2spc>Riemann-Liouville
      Fractional Derivative <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|2.1.2<space|2spc>Caputo Fractional
      Derivative <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Orthogonal Jacobi
      Polynomials <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Problem
      Statement> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Methodology>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Transformation of Boundary
      Conditions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Solution Representation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Numerical
      Implementation and Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Numerical Method
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Results and Discussion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>