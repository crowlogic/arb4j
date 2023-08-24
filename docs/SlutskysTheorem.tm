<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <section|Slutsky's Theorem Proof (Modified)><label|slutskys-theorem-proof-modified><label|slutskys-theorem-proof-modified>

  <subsection|Preliminaries><label|preliminaries><label|preliminaries>

  We want to prove that if <math|X<rsub|n><long-arrow|\<rubber-rightarrow\>|d>X>
  and <math|Y<rsub|n><long-arrow|\<rubber-rightarrow\>|p>Y>, then
  <math|X<rsub|n>+Y<rsub|n><long-arrow|\<rubber-rightarrow\>|d>X+Y>.

  <\itemize>
    \;

    <item><with|font-series|bold|Convergence in Distribution>:

    \ <math|X<rsub|n><long-arrow|\<rubber-rightarrow\>|d>X> means that for
    all continuous bounded functions <math|g>,
    <math|\<bbb-E\><around|[|g<around|(|X<rsub|n>|)>|]>\<to\>\<bbb-E\><around|[|g<around|(|X|)>|]>>
    as <math|n\<to\>\<infty\>>.

    <item><with|font-series|bold|Convergence in Probability>:\ 

    \ <math|Y<rsub|n><long-arrow|\<rubber-rightarrow\>|p>Y> implies that for
    any <math|P*<around|(|<around|\||Y<rsub|n>-Y|\|>\<gtr\>\<epsilon\>|)>\<to\>0\<forall\>\<epsilon\>\<gtr\>0>
    as <math|n\<to\>\<infty\>>.
  </itemize>

  <subsection|Main Proof><label|main-proof><label|main-proof>

  To prove <math|X<rsub|n>+Y<rsub|n><long-arrow|\<rubber-rightarrow\>|d>X+Y>
  we need to show:

  <\equation>
    lim<rsub|n\<to\>\<infty\>> \<bbb-E\>*<around|[|g*<around|(|X<rsub|n>+Y<rsub|n>|)>|]>=\<bbb-E\>*<around|[|g*<around|(|X+Y|)>|]>
  </equation>

  <subsubsection|Step 1: Taylor Expansion><label|step-1-taylor-expansion><label|step-1-taylor-expansion>

  Expand <math|g*<around|(|X<rsub|n>+Y<rsub|n>|)>> around <math|X<rsub|n>+Y>
  using a first-order Taylor series:

  <\equation>
    g*<around|(|X<rsub|n>+Y<rsub|n>|)>=g*<around|(|X<rsub|n>+Y|)>+<around|(|Y<rsub|n>-Y|)>*g<rprime|'>*<around|(|X<rsub|n>+\<theta\>*<around|(|Y<rsub|n>-Y|)>|)>
  </equation>

  where <math|\<theta\>> lies between <math|Y> and <math|Y<rsub|n>>.

  <subsubsection|Step 2: Expectation><label|step-2-expectation><label|step-2-expectation>

  Take expectation of both sides and apply linearity:

  <\equation>
    \<bbb-E\>*<around|[|g*<around|(|X<rsub|n>+Y<rsub|n>|)>|]>=\<bbb-E\>*<around|[|g*<around|(|X<rsub|n>+Y|)>|]>+\<bbb-E\>*<around|[|<around|(|Y<rsub|n>-Y|)>*g<rprime|'>*<around|(|X<rsub|n>+\<theta\>*<around|(|Y<rsub|n>-Y|)>|)>|]>
  </equation>

  <subsubsection|Step 3: Taking Limits><label|step-3-taking-limits><label|step-3-taking-limits>

  Since <math|X<rsub|n><long-arrow|\<rubber-rightarrow\>|d>X> and
  <math|Y<rsub|n><long-arrow|\<rubber-rightarrow\>|p>Y>:

  <\equation>
    lim<rsub|n\<to\>\<infty\>> \<bbb-E\>*<around|[|g*<around|(|X<rsub|n>+Y|)>|]>=\<bbb-E\>*<around|[|g*<around|(|X+Y|)>|]>
  </equation>

  And, <math|Y<rsub|n><long-arrow|\<rubber-rightarrow\>|p>Y> implies that
  <math|\<bbb-E\>*<around|[|<around|(|Y<rsub|n>-Y|)>*g<rprime|'>*<around|(|X<rsub|n>+\<theta\>*<around|(|Y<rsub|n>-Y|)>|)>|]>\<to\>0>
  (by Dominated Convergence Theorem).

  <subsubsection|Step 4: Conclusion><label|step-4-conclusion><label|step-4-conclusion>

  Combine these limits to conclude:

  <\equation>
    lim<rsub|n\<to\>\<infty\>> \<bbb-E\>*<around|[|g*<around|(|X<rsub|n>+Y<rsub|n>|)>|]>=\<bbb-E\>*<around|[|g*<around|(|X+Y|)>|]>
  </equation>

  This completes the proof for the sum. The proofs for the other parts
  (difference, product, division) are similar.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|1.2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|1.2.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|1.2.2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|1.2.3|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-7|<tuple|1.2.4|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|main-proof|<tuple|1.2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|preliminaries|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|slutskys-theorem-proof-modified|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|step-1-taylor-expansion|<tuple|1.2.1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|step-2-expectation|<tuple|1.2.2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|step-3-taking-limits|<tuple|1.2.3|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|step-4-conclusion|<tuple|1.2.4|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Slutsky's
      Theorem Proof (Modified)> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Preliminaries
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Main Proof
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>Step 1: Taylor Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Step 2: Expectation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|1.2.3<space|2spc>Step 3: Taking Limits
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|1.2.4<space|2spc>Step 4: Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>
    </associate>
  </collection>
</auxiliary>