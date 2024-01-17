<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Detailed Analysis of Weak and Strong Convergence in
  Normed Spaces>|<doc-author|<author-data|<author-name|The Collective
  Unconscious>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  In this article, we delve into the concepts of weak and strong convergence
  within normed spaces, illustrating the principles with examples. This
  exploration is aimed at demystifying the behavior of sequences under these
  two types of convergence, particularly focusing on how the norms of
  sequence elements behave in each case.

  <section|Concepts of Convergence>

  <subsection|Strong Convergence>

  Strong convergence of a sequence <math|<around|{|x<rsub|n>|}>> to <math|x>
  in a normed space occurs when the norm <math|<around|\<\|\|\>|x<rsub|n>-x|\<\|\|\>>>
  approaches zero as <math|n\<rightarrow\>\<infty\>>. This type of
  convergence is intuitive as it involves the actual 'distance' between
  sequence elements and the limit point decreasing in terms of the space's
  norm.

  <subsection|Weak Convergence>

  Weak convergence is subtler. A sequence <math|<around|{|x<rsub|n>|}>>
  converges weakly to <math|x> if for every continuous linear functional
  <math|f>, the sequence of scalars <math|<around|{|f<around|(|x<rsub|n>|)>|}>>
  converges to <math|f<around|(|x|)>>. This means the convergence is
  determined by the sequence's interaction with linear functionals, not by
  its norm-distance to the limit.

  <section|Examples and Analysis>

  <subsection|Oscillating Norms>

  <\example>
    Consider the sequence in <math|l<rsup|2>> space,
    <math|x<rsub|n>=<around|(|1,<frac|1|2>,\<ldots\>,<frac|1|n>,0,\<ldots\>|)>>.
    While this sequence converges weakly to the zero vector, the norms
    exhibit oscillating behavior and do not converge to zero.
  </example>

  <big-figure|<with|par-mode|center|<image|ex1.png|0.8par|||>>|Oscillating
  norms of <math|x<rsub|n>> in <math|l<rsup|2>> space.>

  <subsection|Bounded Norms, Not Converging>

  <\example>
    In <math|L<rsup|2><around|(|<around|[|0,1|]>|)>>, the sequence
    <math|f<rsub|n><around|(|x|)>=sin <around|(|n*\<pi\>*x|)>> converges
    weakly to 0. However, the <math|L<rsup|2>> norms of <math|f<rsub|n>> are
    constantly <math|<frac|1|<sqrt|2>>>, not converging to the norm of the
    limit function (zero).
  </example>

  <big-figure|<with|par-mode|center|<image|ex2.png|0.8par|||>>|Constant
  <math|L<rsup|2>> norms of <math|f<rsub|n>> in
  <math|L<rsup|2><around|(|<around|[|0,1|]>|)>>.>

  <subsection|Unbounded Norms>

  <\example>
    In <math|l<rsup|2>> space, consider <math|x<rsub|n>=<around|(|n,0,\<ldots\>|)>>.
    This sequence weakly converges to the zero vector, but the norms
    <math|<around|\<\|\|\>|x<rsub|n>|\<\|\|\>>=n> are unbounded, showing that
    weak convergence can occur even with unbounded norms.
  </example>

  <big-figure|<with|par-mode|center|<image|ex3.png|0.8par|||> >|Unbounded
  norms in <math|l<rsup|2>> space.>

  <section|Discussion>

  These examples illustrate the diversity in behaviors that sequences can
  exhibit under weak convergence. Unlike strong convergence, where the norm
  of the difference between sequence elements and the limit decreases, weak
  convergence does not impose constraints on how the norms behave. This
  distinction is crucial in understanding infinite-dimensional spaces and the
  subtleties of functional analysis.

  <section|Conclusion>

  Our exploration into weak and strong convergence reveals the intricate
  nature of these concepts in normed spaces. Understanding these differences
  is vital for advanced mathematical studies and provides insight into the
  behavior of sequences in various contexts of functional analysis and
  related fields.
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
    <associate|auto-10|<tuple|3.3|3|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-11|<tuple|3|4|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-12|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-13|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-3|<tuple|2.1|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-4|<tuple|2.2|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-5|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-6|<tuple|3.1|1|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-7|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-8|<tuple|3.2|3|../../.TeXmacs/texts/scratch/no_name_18.tm>>
    <associate|auto-9|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_18.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Oscillating norms
      of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|x<rsub|n>>>
      in <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|l<rsup|2>>>
      space.>|<pageref|auto-7>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||Constant
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|L<rsup|2>>>
      norms of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|f<rsub|n>>>
      in <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|L<rsup|2><around|(|<around|[|0,1|]>|)>>>.>|<pageref|auto-9>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||Unbounded norms in
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|l<rsup|2>>>
      space.>|<pageref|auto-11>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Concepts
      of Convergence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Strong Convergence
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Weak Convergence
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Examples
      and Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Oscillating Norms
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Bounded Norms, Not
      Converging <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Unbounded Norms
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Discussion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>