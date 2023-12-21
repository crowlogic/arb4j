<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Cayley Transform and Extensions of Self-Adjoint
  Operators>|<doc-author|<author-data|<author-name|Stephen Crowley
  \<less\>crow@outsider.trading\<gtr\> And The Collective
  Unconscious>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|The Cayley Transform>

  The Cayley transform is a crucial tool in the study of unbounded
  self-adjoint operators in Hilbert spaces. Given a self-adjoint operator
  <math|A> on a Hilbert space <math|\<cal-H\>>, the Cayley transform is
  defined as:

  <\equation>
    U=<around|(|A-i*I|)>*<around|(|A+i*I|)><rsup|-1>
  </equation>

  where <math|I> is the identity operator.

  <subsection|Key Properties>

  <\itemize>
    <item><with|font-series|bold|Unitarity:> The Cayley transform of a
    self-adjoint operator is a unitary operator on <math|\<cal-H\>>.

    <item><with|font-series|bold|Spectrum:> If <math|\<lambda\>> is in the
    spectrum of <math|A>, the corresponding point in the spectrum of <math|U>
    is

    <\equation>
      \<mu\>=<around|(|\<lambda\>-i|)>*<around|(|\<lambda\>+i|)><rsup|-1>
    </equation>

    <item>This effectively maps the real line (spectrum of <math|A>) onto the
    unit circle, excluding the point -1.
  </itemize>

  <section|Extensions of Self-Adjoint Operators>

  In the context of operator extensions, one often looks to determine all
  possible self-adjoint extensions of a symmetric operator <math|T> that is
  not necessarily self-adjoint.

  <subsection|Symmetric Operators>

  An operator <math|T> is symmetric if it satisfies

  <\equation>
    <around|\<langle\>|T*x,y|\<rangle\>>=<around|\<langle\>|x,T*y|\<rangle\>>\<forall\>x,y\<in\>T
  </equation>

  <subsection|Self-Adjoint Extensions>

  A self-adjoint extension <math|A> of <math|T> is a self-adjoint operator
  <math|A> such that <math|T\<subseteq\>A>.

  <section|Role of the Cayley Transform>

  <subsection|Mapping to Unitary Operators>

  The Cayley transform maps the problem of finding self-adjoint extensions of
  <math|T> into that of finding unitary extensions of a certain partially
  defined unitary operator

  <subsection|<with|font-series|bold|Von Neumann's Theorem>>

  This theorem characterizes all self-adjoint extensions of <math|T> in terms
  of deficiency indices and deficiency spaces, with the Cayley transform
  playing a central role.

  <subsection|<with|font-series|bold|Deficiency Spaces and Indices>>

  These spaces are defined as the null spaces of
  <math|T<rsup|\<ast\>>\<pm\>i*I>, with their dimensions (deficiency indices)
  dictating the number of self-adjoint extensions possible. The Cayley
  transform is instrumental in studying these spaces

  <subsection|Parameterizing Extensions>

  For operators with equal deficiency indices, self-adjoint extensions can be
  parameterized using unitary maps between the deficiency spaces, analyzed
  via the Cayley transform.

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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_17.tm>>
    <associate|auto-10|<tuple|3.4|2|../../.TeXmacs/texts/scratch/no_name_17.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_17.tm>>
    <associate|auto-3|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_17.tm>>
    <associate|auto-4|<tuple|2.1|1|../../.TeXmacs/texts/scratch/no_name_17.tm>>
    <associate|auto-5|<tuple|2.2|2|../../.TeXmacs/texts/scratch/no_name_17.tm>>
    <associate|auto-6|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_17.tm>>
    <associate|auto-7|<tuple|3.1|2|../../.TeXmacs/texts/scratch/no_name_17.tm>>
    <associate|auto-8|<tuple|3.2|2|../../.TeXmacs/texts/scratch/no_name_17.tm>>
    <associate|auto-9|<tuple|3.3|2|../../.TeXmacs/texts/scratch/no_name_17.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      Cayley Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Key Properties
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Extensions
      of Self-Adjoint Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Symmetric Operators
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Self-Adjoint Extensions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Role
      of the Cayley Transform> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Mapping to Unitary Operators
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|3.2<space|2spc><with|font-series|<quote|bold>|Von
      Neumann's Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.3<space|2spc><with|font-series|<quote|bold>|Deficiency
      Spaces and Indices> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|3.4<space|2spc>Parameterizing Extensions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>
    </associate>
  </collection>
</auxiliary>