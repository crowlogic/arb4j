<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Cayley Transform in Operator
  Theory>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  The Cayley transform is a fundamental tool in functional analysis,
  especially in operator theory on Hilbert spaces. It provides a method to
  transform the problem of finding self-adjoint extensions of symmetric
  operators into a problem of finding isometric extensions.

  <section|Symmetric and Self-Adjoint Operators>

  In the context of Hilbert spaces, an operator <math|T> is symmetric if it
  equals its adjoint, i.e., <math|T=T<rsup|\<ast\>>>, on its domain. A
  self-adjoint operator is a symmetric operator whose domain coincides with
  that of its adjoint.

  <section|Self-Adjoint Extensions>

  The problem involves identifying self-adjoint extensions of a symmetric
  operator <math|T> with a dense domain in a Hilbert space. This means
  finding self-adjoint operators that extend <math|T> while preserving its
  fundamental properties.

  <section|The Cayley Transform>

  The Cayley transform <math|U> of a symmetric operator <math|T> is defined
  by the formula:

  <\equation>
    U=<around|(|T-i*I|)>*<around|(|T+i*I|)><rsup|-1>
  </equation>

  where <math|I> denotes the identity operator. This transformation maps
  <math|T> to a unitary operator <math|U> on its domain.

  <section|Conversion to Isometric Extension Problem>

  The Cayley transform converts the challenge of finding self-adjoint
  extensions of <math|T> into that of finding isometric extensions of
  <math|U>. The self-adjoint extensions of <math|T> correspond to the
  isometric extensions of <math|U>. By extending <math|U> to a unitary
  operator on the entire Hilbert space, the inverse Cayley transform yields a
  self-adjoint extension of <math|T>.

  <section|Advantages>

  The Cayley transform is advantageous because dealing with unitary operators
  and isometries is often more straightforward than handling self-adjoint
  operators directly. Unitary operators and isometries possess geometric and
  algebraic properties that facilitate the discovery of extensions.

  <section|Conclusion>

  The Cayley transform thereby simplifies the problem of finding self-adjoint
  extensions of operators and leverages the more tractable properties of
  unitary and isometric operators.
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
    <associate|auto-4|<tuple|4|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-5|<tuple|5|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-6|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-7|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Symmetric
      and Self-Adjoint Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Self-Adjoint
      Extensions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Cayley Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Conversion
      to Isometric Extension Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Advantages>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>