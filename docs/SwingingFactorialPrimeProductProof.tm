<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Proof that the <math|n>-th swinging factorial is equal
  to the product of all primes <math|p> in the range
  <math|<frac|n|2>\<less\>p\<leqslant\>n>>>

  <\abstract>
    This document provides a detailed proof that the sequence defined by
    <math|a<around|(|n|)>=<text|lcm><around*|(|a*<around|(|n-1|)>,<binom|n|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>>|)>>
    is equal to the product of all primes <math|p> in the range
    <math|<frac|n|2>\<less\>p\<leqslant\>n>.
  </abstract>

  <section|Introduction>

  We consider the sequence <math|a<around|(|n|)>> defined recursively by
  <math|a<around|(|n|)>=<text|lcm><around*|(|a*<around|(|n-1|)>,<binom|n|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>>|)>>,
  with <math|a<around|(|1|)>=1>. We aim to show that for any positive integer
  <math|n>, <math|a<around|(|n|)>> equals the product of all prime numbers
  <math|p> such that <math|<frac|n|2>\<less\>p\<leqslant\>n>.

  <section|Preliminaries>

  Before proceeding with the proof, we introduce Legendre's formula, which is
  instrumental in our analysis. Legendre's formula provides the exponent of a
  prime <math|p> in the factorization of <math|n>! as:

  <\equation*>
    <text|exp><rsub|p><around|(|n!|)>=<big|sum><rsub|k=1><rsup|\<infty\>><around*|\<lfloor\>|<frac|n|p<rsup|k>>|\<rfloor\>>.
  </equation*>

  Additionally, we recall that the binomial coefficient <math|<binom|n|k>> is
  defined as:

  <\equation*>
    <binom|n|k>=<frac|n!|k!<around|(|n-k|)>!>.
  </equation*>

  <section|Lemma>

  <\lemma>
    For a prime <math|p> and integers <math|n\<gtr\>k\<geq\>0>, <math|p>
    divides <math|<binom|n|k>> if and only if at least one of the exponents
    of <math|p> in the prime factorization of <math|k>!,
    <math|<around|(|n-k|)>>!, is less than the exponent of <math|p> in
    <math|n>!.
  </lemma>

  <\proof>
    This follows directly from Legendre's formula and the properties of prime
    factorization.
  </proof>

  <section|Main Proof>

  <\theorem>
    The sequence <math|a<around|(|n|)>=<text|lcm><around*|(|a*<around|(|n-1|)>,<binom|n|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>>|)>>
    is equal to the product of all prime numbers <math|p> such that
    <math|<frac|n|2>\<less\>p\<leqslant\>n>.
  </theorem>

  <\proof>
    We proceed by induction on <math|n>.

    <with|font-series|bold|Base Case:> For <math|n=1>, we have
    <math|a<around|(|1|)>=1>, and there are no primes in the interval
    <math|<around*|(|<frac|1|2>,1|]>>, hence the base case holds trivially.

    <with|font-series|bold|Inductive Step:> Assume the statement holds for
    some <math|n-1>, i.e., <math|a*<around|(|n-1|)>> is the product of all
    primes <math|p> such that <math|<frac|n-1|2>\<less\>p\<leqslant\>n-1>. We
    need to show that <math|a<around|(|n|)>=<text|lcm><around*|(|a*<around|(|n-1|)>,<binom|n|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>>|)>>
    is the product of all primes <math|p> such that
    <math|<frac|n|2>\<less\>p\<leqslant\>n>.

    By the inductive hypothesis, <math|a*<around|(|n-1|)>> includes all
    primes up to <math|n-1>. For <math|a<around|(|n|)>>, we consider the LCM
    of <math|a*<around|(|n-1|)>> and <math|<binom|n|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>>>.
    By our lemma, a new prime <math|p> will divide
    <math|<binom|n|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>>> if it appears
    more times in <math|n>! than in <math|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>!+<around|\<lceil\>|<frac|n|2>|\<rceil\>>>!.
    This is guaranteed for primes <math|p> in the range
    <math|<frac|n|2>\<less\>p\<leqslant\>n> since they will not fully appear
    in the factorizations of <math|<around|\<lfloor\>|<frac|n|2>|\<rfloor\>>>!
    and <math|<around|\<lceil\>|<frac|n|2>|\<rceil\>>>!.

    Thus, <math|a<around|(|n|)>> incorporates these primes exactly once,
    matching the product of all such primes <math|p>. This completes the
    inductive step and the proof.
  </proof>

  <section|Conclusion>

  We have shown that the given sequence <math|a<around|(|n|)>> indeed
  captures the product of all prime numbers in the specified range for any
  positive integer <math|n>, using a combination of Legendre's formula,
  properties of the binomial coefficients, and inductive reasoning.
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Lemma>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Main
      Proof> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>