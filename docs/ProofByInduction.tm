<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Proof By Induction>>

  <section*|Induction>

  Induction is a method of proving statements about well-ordered sets. If
  <math|S> is a well-ordered set with ordering <math|\<less\>>, and we want
  to show that a property <math|P> holds for every element of <math|S>, it is
  sufficient to show that,

  <\equation*>
    <text|IF >t\<less\>s\<forall\>t,s\<in\>S\<Rightarrow\>P<around|(|t|)>*<text|THEN
    >P<around|(|s|)>
  </equation*>

  I.e., if <math|P> holds for anything less than <math|s> then it holds for
  <math|s>. In this case, it is said that <math|P> is proved by induction.

  The most common instance of proof by induction is induction over the
  natural numbers where it is proved that some property holds for <math|n=0>
  and that if it holds for <math|n>, it holds for <math|n+1>.

  (In fact, it is sufficient for <math|\<less\>> to be a well-founded partial
  order on <math|S>, not necessarily a well-ordering of <math|S>.)
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
    <associate|auto-1|<tuple|?|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Induction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>