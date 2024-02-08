<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The <section*|Trinomial Theorem>>>

  The Trinomial Theorem states that for any non-negative integer <math|n> and
  real or complex numbers <math|a>, <math|b>, and <math|c>, the expansion of
  the power of a trinomial <math|<around|(|a+b+c|)><rsup|n>> is given by:

  <\equation>
    <around|(|a+b+c|)><rsup|n>=<big|sum><rsub|p+q+r=n><frac|n!|p!q!r!>*a<rsup|p>*b<rsup|q>*c<rsup|r>
  </equation>

  where the sum is taken over all non-negative integers <math|p>, <math|q>,
  and <math|r> such that <math|p+q+r=n>.

  <section*|Proof>

  The proof is based on the principle of counting. The expression
  <math|<around|(|a+b+c|)><rsup|n>> represents the sum of all possible
  products of <math|n> factors, each of which is either <math|a>, <math|b>,
  or <math|c>. Each term in the expanded expression corresponds to a
  particular combination of <math|p> occurrences of <math|a>, <math|q>
  occurrences of <math|b>, and <math|r> occurrences of <math|c>, such that
  <math|p+q+r=n>.

  <subsection*|Combinatorial Argument>

  <\enumerate>
    <item><with|font-series|bold|Counting the Terms:> Consider a sequence of
    <math|n> slots, each of which will be filled with either <math|a>,
    <math|b>, or <math|c>. The number of ways to choose <math|p> slots for
    <math|a> out of <math|n> slots is <math|<binom|n|p>>. After choosing
    <math|p> slots for <math|a>, there are <math|n-p> slots left.

    <item><with|font-series|bold|Choosing for <math|b> and <math|c>:> From
    the remaining <math|n-p> slots, choose <math|q> slots for <math|b>, which
    can be done in <math|<binom|n-p|q>> ways. This leaves <math|r=n-p-q>
    slots, which will all be filled with <math|c>.

    <item><with|font-series|bold|Total Combinations:> The total number of
    ways to arrange <math|p> occurrences of <math|a>, <math|q> occurrences of
    <math|b>, and <math|r> occurrences of <math|c> is the product of the
    number of ways to choose those slots:
    <math|<binom|n|p><binom|n-p|q>=<frac|n!|p!<around|(|n-p|)>!>\<cdot\><frac|<around|(|n-p|)>!|q!<around|(|n-p-q|)>!>=<frac|n!|p!q!r!>>.

    <item><with|font-series|bold|Conclusion:> Summing over all possible
    non-negative integer combinations of <math|p>, <math|q>, and <math|r>
    that sum to <math|n> gives the total number of terms in the expansion of
    <math|<around|(|a+b+c|)><rsup|n>>, each multiplied by the appropriate
    trinomial coefficient <math|<frac|n!|p!q!r!>>, thus proving the theorem.
  </enumerate>
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-2|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-3|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_26.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Trinomial
      Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Combinatorial Argument
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>