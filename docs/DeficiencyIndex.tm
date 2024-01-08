<TeXmacs|2.1.1>

<style|<tuple|article|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Von Neumann's Deficiency Index Theorem and
  Self-Adjoint Extensions: An Example>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|This article explores the profound implications of
  Von Neumann's Deficiency Index Theorem, a fundamental result in the theory
  of unbounded operators in Hilbert spaces concerning self-adjoint extensions
  of symmetric operators.>>

  <section|Introduction>

  This article explores the profound implications of Von Neumann's Deficiency
  Index Theorem, a fundamental result in the theory of unbounded operators in
  Hilbert spaces concerning self-adjoint extensions of symmetric operators.

  <section|Von Neumann's Deficiency Index Theorem>

  <\theorem>
    Let <math|A> be a densely defined, closed, symmetric operator on a
    Hilbert space <math|H>. Define the deficiency subspaces
    <math|\<cal-K\><rsub|+>> and <math|\<cal-K\><rsub|->> by:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<cal-K\><rsub|->>|<cell|=<text|Ker><around|(|A<rsup|\<ast\>>+i*I|)>>>|<row|<cell|\<cal-K\><rsub|+>>|<cell|=<text|Ker><around|(|A<rsup|\<ast\>>-i*I|)><text|>>>>>>
    </equation>

    and the deficiency indices <math|n<rsub|+>> and <math|n<rsub|->> by:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|n<rsub|+>>|<cell|=<text|dim><around|(|\<cal-K\><rsub|+>|)>>>|<row|<cell|n<rsub|->>|<cell|=<text|dim><around|(|\<cal-K\><rsub|->|)>>>>>>
    </equation>

    The operator <math|A> admits self-adjoint extensions if and only if
    <math|n<rsub|+>=n<rsub|->>. Each self-adjoint extension of <math|A>
    corresponds to a unique isometry from <math|\<cal-K\><rsub|+>> to
    <math|\<cal-K\><rsub|->>
  </theorem>

  <section|Example>

  Consider the differential operator <math|A=<frac|d<rsup|2>|d*x<rsup|2>>> on
  <math|L<rsup|2><around|(|0,\<pi\>|)>>, with the domain of smooth functions
  vanishing at <math|x=0>. This operator is symmetric.

  <subsection|Deficiency Subspaces and Indices>

  For the equation <math|<frac|d<rsup|2>*y|d*x<rsup|2>>=i*y<around|(|x|)>>,
  the solution under the boundary condition <math|y<around|(|0|)>=0> is
  <math|y<around|(|x|)>=c<rsub|1>*sin <around*|(|<around*|(|<frac|1|2>-<frac|1|2>*i|)>*2<rsup|1/2>*x|)>>.
  Similarly, for <math|<frac|d<rsup|2>*y|d*x<rsup|2>>=-i*y<around|(|x|)>>,
  the solution is <math|y<around|(|x|)>=c<rsub|1>*sin
  <around*|(|<around*|(|<frac|1|2>+<frac|1|2>*i|)>*2<rsup|1/2>*x|)>>. These
  non-trivial solutions indicate the presence of non-zero deficiency indices.

  <subsection|Existence of Self-Adjoint Extensions>

  Since both <math|n<rsub|+>> and <math|n<rsub|->> are non-zero and equal,
  self-adjoint extensions of the operator <math|A> exist. Each extension is
  associated with a unique isometry between <math|\<cal-K\><rsub|+>> and
  <math|\<cal-K\><rsub|->>.

  <section|Conclusion>

  Through this example, we demonstrate the practical application of Von
  Neumann's Deficiency Index Theorem. The theorem not only provides
  theoretical insights but also guides the resolution of concrete problems
  involving differential operators and their extensions in Hilbert spaces.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-4|<tuple|3.1|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-5|<tuple|3.2|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-6|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Von
      Neumann's Deficiency Index Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Example>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Deficiency Subspaces and
      Indices <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Existence of Self-Adjoint
      Extensions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>