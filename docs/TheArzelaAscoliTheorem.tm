<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Arzelà-Ascoli Theorem>>4

  <section|Proof of the Arzelà-Ascoli Theorem>

  The Arzelà-Ascoli Theorem provides a characterization of relatively compact
  subsets of the space of continuous functions on a compact metric space.
  This proof outlines the necessary steps to demonstrate the conditions under
  which a family of functions admits a uniformly convergent subsequence.

  <subsection*|Step 1: Choosing a Finite Dense Subset and Applying
  Bolzano-Weierstrass>

  Given a compact metric space <math|X>, we leverage its compactness to cover
  <math|X> with a finite number of <math|\<epsilon\>>-balls for any given
  <math|\<epsilon\>\<gtr\>0>. The centers of these balls constitute a finite
  dense subset of <math|X>, ensuring that every point in <math|X> is within
  <math|\<epsilon\>> of one of these subset points. The Bolzano-Weierstrass
  Theorem, which asserts that every bounded sequence in
  <math|\<bbb-R\><rsup|n>> has a convergent subsequence, is applied to
  guarantee that for each point in this finite subset, the evaluations of
  functions from the family <math|\<cal-F\>> at these points have convergent
  subsequences due to <math|\<cal-F\>>'s uniform boundedness.

  <subsection*|Step 2: Constructing a Convergent Subsequence Using the
  Diagonal Argument>

  For each point in the finite dense subset, we identify a convergent
  subsequence from <math|\<cal-F\>>. Starting with the first point, we select
  a subsequence of functions converging at this point. Iteratively, for each
  subsequent point, we refine the selection to ensure convergence, employing
  a diagonal argument. Specifically, the <math|n>-th function from the
  <math|n>-th refined subsequence forms a new sequence that converges at
  every point in the finite dense subset.

  <subsection*|Step 3: Extending Pointwise to Uniform Convergence Through
  Equicontinuity>

  The family <math|\<cal-F\>>'s equicontinuity at every point in <math|X>
  implies that for any <math|\<epsilon\>\<gtr\>0>, there exists a
  <math|\<delta\>\<gtr\>0> such that for any <math|x,y\<in\>X> with
  <math|d<around|(|x,y|)>\<less\>\<delta\>>, the inequality
  <math|<around|\||f<around|(|x|)>-f<around|(|y|)>|\|>\<less\>\<epsilon\>>
  holds for all <math|f\<in\>\<cal-F\>>. Utilizing the convergent subsequence
  identified in Step 2, we argue that convergence is not merely pointwise at
  the dense subset points but uniformly across <math|X>. The crux lies in the
  <math|\<delta\>> selected for equicontinuity, ensuring that the observed
  convergence behavior uniformly influences function values over <math|X>,
  thus achieving the transition from pointwise to uniform convergence.
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
    <associate|auto-2|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_25.tm>>
    <associate|auto-3|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_25.tm>>
    <associate|auto-4|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_25.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Proof
      of the Arzelà-Ascoli Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Step 1: Choosing a Finite Dense Subset and
      Applying Bolzano-Weierstrass <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|Step 2: Constructing a Convergent
      Subsequence Using the Diagonal Argument
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|Step 3: Extending Pointwise to Uniform
      Convergence Through Equicontinuity <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>
    </associate>
  </collection>
</auxiliary>