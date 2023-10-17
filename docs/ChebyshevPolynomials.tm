<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Matrix Representation for Chebyshev Polynomials of the
  First Kind>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  Chebyshev polynomials of the first kind, denoted as
  <math|T<rsub|n><around|(|x|)>>, arise in various areas of mathematics and
  physics. In this article, we present a matrix representation of these
  polynomials based on their recursive definition.

  <section|Recursive Definition>

  The Chebyshev polynomials of the first kind are defined recursively as:

  <\align>
    <tformat|<table|<row|<cell|T<rsub|0><around|(|x|)>>|<cell|=1,<eq-number>>>|<row|<cell|T<rsub|1><around|(|x|)>>|<cell|=x,<eq-number>>>|<row|<cell|T<rsub|n+1><around|(|x|)>>|<cell|=2*x*T<rsub|n><around|(|x|)>-T<rsub|n-1><around|(|x|)>.<eq-number>>>>>
  </align>

  <section|Matrix Representation>

  To represent the Chebyshev polynomials in a matrix form, we can use the
  above recursive relationship. We denote:

  <\itemize>
    <item><math|A> as the matrix that represents multiplication by <math|x>.

    <item><math|I> as the identity matrix.
  </itemize>

  The matrix <math|A> is defined with a super-diagonal of ones:

  <\equation>
    A=<around*|[|<tabular*|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|0>|<cell|\<ldots\>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|\<ldots\>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|\<ldots\>>|<cell|1>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|\<ldots\>>|<cell|0>>>>>|]>
  </equation>

  Using this, we can represent the recursive relationship in a block matrix
  form:

  <\equation>
    C=<around*|[|<tabular*|<tformat|<table|<row|<cell|I>|<cell|2*A>|<cell|-I>|<cell|0>|<cell|\<ldots\>>>|<row|<cell|0>|<cell|I>|<cell|2*A>|<cell|-I>|<cell|\<ldots\>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|\<ldots\>>|<cell|-I>>>>>|]>
  </equation>

  In this matrix:

  <\itemize>
    <item>The blocks along the main diagonal are the identity matrix
    <math|I>.

    <item>The blocks on the super-diagonal are <math|2*A>, representing the
    <math|2*x> multiplication.

    <item>The blocks two steps below the main diagonal are <math|-I>,
    accounting for the subtraction in the recursive definition.
  </itemize>

  <section|Conclusion>

  The matrix representation of the Chebyshev polynomials provides an
  efficient way to compute their coefficients up to a certain degree. This
  representation is particularly useful in numerical computations and
  simulations.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_11.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Recursive
      Definition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Matrix
      Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>