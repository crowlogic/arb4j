<TeXmacs|2.1.4>

<style|generic>

<\body>
  \;

  <\section*>
    The <strong|Denominiators of the Eigenfunctions of
    <math|<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around*|(|x-y|)>f<around*|(|x|)>\<mathd\>x>>
    is

    Sequence A127752 in the OEIS
  </section*>

  \;

  <subsection*|Matrix Definition>

  The matrix <math|A> associated with sequence A127752 is defined by:

  <\equation*>
    A*<around|(|n,k|)>=<choice|<tformat|<table|<row|<cell|<frac|1|3*n+1>>|<cell|<text|if
    >k\<leq\>n\<leq\>2*k>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>
  </equation*>

  <subsection*|Inverse Matrix and Sequence Calculation>

  The sequence <math|a<around|(|n|)>> is defined as the row sums of the
  inverse of matrix <math|A>, specifically:

  <\equation*>
    a<around|(|n|)>=<big|sum><rsub|k=1><rsup|N><around|(|A<rsup|-1>|)><rsub|n,k>
  </equation*>

  where <math|A<rsup|-1>> denotes the inverse of matrix <math|A> and <math|N>
  is the size of the matrix up to which the inverse and row sums are
  calculated.

  <subsection*|Conjectural Relation>

  It is conjectured that:

  <\equation*>
    a<around|(|n|)><modulo|2><text| is the first Feigenbaum symbolic sequence
    >A*035263.
  </equation*>

  This conjecture has been verified up to the first 2048 te
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_35.tm>>
    <associate|auto-2|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_35.tm>>
    <associate|auto-3|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_35.tm>>
    <associate|auto-4|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_35.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Definition
      and Formulation of Sequence A127752>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Matrix Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|Inverse Matrix and Sequence Calculation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|Conjectural Relation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>
    </associate>
  </collection>
</auxiliary>