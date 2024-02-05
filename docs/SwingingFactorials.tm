<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Swinging Factorials>|<doc-author|<author-data|<author-name|Stephen
  Crowley \<less\>stephencrowley214@gmail.com\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  The concept of swinging factorials presents a unique and fascinating aspect
  of combinatorial mathematics, extending the traditional understanding of
  factorials with intriguing properties and applications. This document aims
  to provide a thorough examination of swinging factorials, including their
  definitions, mathematical properties, generating functions, and significant
  relations to other combinatorial structures.

  <section|Definitions>

  The swinging factorial of a number <math|n>, denoted by
  <math|a<around|(|n|)>>, is defined in several equivalent ways. One
  prominent definition is given by:

  <\equation>
    a<around|(|n|)>=2<rsup|n-<around|(|n<modulo|2>|)>>*<big|prod><rsub|k=1><rsup|n>k<rsup|<around|(|-1|)><rsup|k+1>>,
  </equation>

  where <math|> denotes the modulus operation. An alternative formulation
  involves factorials and the floor function:

  <\equation>
    a<around|(|n|)>=<frac|n!|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>!<rsup|2>>
  </equation>

  <section|Properties>

  Swinging factorials exhibit several notable properties:

  <\itemize>
    <item>They relate to the enumeration of swinging orbitals in
    combinatorial structures.

    <item>The sequence connects with central binomial coefficients,
    especially evident in its relationship with least common multiples (LCM)
    of consecutive central binomial coefficients.

    <item>For odd prime numbers <math|p>, the sequence shows a pattern where
    <math|p> consecutive multiples of <math|p> follow the least positive
    multiple of <math|p>.
  </itemize>

  <section|Generating Functions and Recurrences>

  The swinging factorial is characterized by various generating functions and
  recurrence relations:

  <\itemize>
    <item>Exponential generating function (E.g.f.):\ 

    <\equation>
      <around|(|1+x|)>I<rsub|0><around*|(|2x|)>
    </equation>

    where <math|I<rsub|0>> is a modified type 1 Bessel function

    <item>Ordinary generating function (O.g.f.):\ 

    <\equation>
      a<around|(|n|)>=<text|SeriesCoeff><rsub|n><around*|(|<frac|1+<frac|z|1-4*z<rsup|2>>|<sqrt|1-4*z<rsup|2>>>|)>
    </equation>

    <item>Polynomial generating function (P.g.f.):

    <\equation>
      a<around|(|n|)>=<text|PolyCoeff><rsub|n><around*|(|<around|(|1+z<rsup|2>|)><rsup|n>+n*z*<around|(|1+z<rsup|2>|)><rsup|n-1>|)>
    </equation>

    <item>D-finite recurrence:

    <\equation>
      <text|<tabular|<tformat|<cwith|1|5|1|1|cell-halign|r>|<table|<row|<cell|<math|n\<cdot\>a<around|(|n|)>+>>>|<row|<cell|<math|<around|(|n-2|)>\<cdot\>a*<around|(|n-1|)>+>>>|<row|<cell|<math|4*<around|(|3-2*n|)>\<cdot\>a*<around|(|n-2|)>+>>>|<row|<cell|<math|4*<around|(|1-n|)>\<cdot\>a*<around|(|n-3|)>+>>>|<row|<cell|<math|16*<around|(|n-3|)>\<cdot\>a*<around|(|n-4|)>><space|1em>>>>>>=0>
    </equation>
  </itemize>

  <section|Applications and Interpretations>

  Swinging factorials play a significant role in various mathematical
  contexts:

  <\itemize>
    <item>They are related to the enumeration of geometric structures,
    particularly in the context of hypercubes intersecting with hyperplanes.

    <item>The sequence contributes to the study of number theory and
    combinatorial geometry, including implications for the lonely runner
    conjecture.
  </itemize>

  <section|Examples>

  To illustrate the concept, consider the following examples:

  <\itemize>
    <item><math|a<around|(|10|)>=252>, calculated as <math|10!/5!<rsup|2>>.

    <item><math|a<around|(|11|)>=2772>, calculated as <math|11!/5!<rsup|2>>.
  </itemize>

  <section|Conclusion>

  The study of swinging factorials unveils a rich mathematical structure
  interlinking factorials, binomial coefficients, and geometric
  interpretations. It underscores the depth and breadth of combinatorial
  mathematics, revealing intricate relationships and properties that extend
  beyond the conventional factorial function.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_25.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_25.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_25.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_25.tm>>
    <associate|auto-5|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_25.tm>>
    <associate|auto-6|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_25.tm>>
    <associate|auto-7|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_25.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Definitions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Properties>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Generating
      Functions and Recurrences> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Applications
      and Interpretations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Examples>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>