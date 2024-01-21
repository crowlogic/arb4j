<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Spectrum of the Real Part of a Weighted Shift
  Operator>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  This document presents an overview of the spectrum of the real part of a
  weighted shift operator and explains why it is equal to the closed interval
  <math|<around|[|-1,1|]>>. The explanation is grounded in the principles of
  functional analysis and operator theory.

  <section|Preliminaries>

  <subsection|Weighted Shift Operator>

  A weighted shift operator, denoted as <math|T>, is a type of linear
  operator acting on a Hilbert space <math|H>. It shifts the elements of a
  sequence or a function space and multiplies each element by a corresponding
  weight. The spectral properties of this operator are significantly
  influenced by these weights.

  <subsection|Spectrum of an Operator>

  The spectrum of a linear operator <math|T>, denoted by
  <math|\<sigma\><around|(|T|)>>, comprises the set of complex numbers
  <math|\<lambda\>> for which <math|T-\<lambda\>*I> is not invertible, where
  <math|I> is the identity operator. The spectrum includes eigenvalues and
  other values where the operator is not invertible.

  <subsection|Real Part of an Operator>

  The real part of an operator <math|T>, denoted as
  <math|\<Re\><around|(|T|)>>, is given by
  <math|<frac|1|2>*<around|(|T+T<rsup|\<ast\>>|)>>, where
  <math|T<rsup|\<ast\>>> is the adjoint of <math|T>. This operator is
  self-adjoint, even if <math|T> itself is not.

  <section|Spectrum of the Real Part of a Weighted Shift Operator>

  The statement in question is that the spectrum of the real part of a
  weighted shift operator is the closed interval <math|<around|[|-1,1|]>>.
  This can be understood through the following considerations:

  <\itemize>
    <item>The weights of the shift operator, bounded by 1 in absolute value,
    limit the operator norms of <math|T> and <math|T<rsup|\<ast\>>> to 1.

    <item>The real part of <math|T> combines <math|T> and
    <math|T<rsup|\<ast\>>> and inherits their spectral characteristics.

    <item>Consequently, the spectrum of the real part lies within
    <math|<around|[|-1,1|]>>, as the operator norms are bounded and the
    spectrum of a self-adjoint operator is always within the interval defined
    by its norm.
  </itemize>

  <section|Conclusion>

  The spectrum of the real part of a weighted shift operator being within the
  interval <math|<around|[|-1,1|]>> is a result derived from the bounded
  nature of the operator and its adjoint, as well as the spectral theorem for
  self-adjoint operators. This theorem asserts that a self-adjoint operator
  on a Hilbert space has a real spectrum, comprising eigenvalues or
  continuous spectrum intervals, which in this case is the interval
  <math|<around|[|-1,1|]>>.<cite|RealWeightedShiftOperatorSpectra>

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-RealWeightedShiftOperatorSpectra>J.<nbsp>DOMBROWSKI.
      <newblock>Spectral properties of real parts of weighted shift
      operators. <newblock><with|font-shape|italic|Indiana University
      Mathematics Journal>, 29(2):249\U259, 1980.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|auto-3|<tuple|2.1|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-4|<tuple|2.2|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-5|<tuple|2.3|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-6|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-7|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-8|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|bib-RealWeightedShiftOperatorSpectra|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      RealWeightedShiftOperatorSpectra
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Weighted Shift Operator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Spectrum of an Operator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Real Part of an Operator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Spectrum
      of the Real Part of a Weighted Shift Operator>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>