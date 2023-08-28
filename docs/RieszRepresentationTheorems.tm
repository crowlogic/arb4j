<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Riesz Representation Theorem(s)>>

  <section|Riesz Representation Theorem><label|riesz-representation-theorem><label|riesz-representation-theorem>

  The Riesz Representation Theorem serves as a key result in functional
  analysis, establishing a connection between linear functionals and measures
  or inner products, depending on the context. The theorem has multiple
  versions, and two notable ones are as follows:

  <subsection|Riesz Representation Theorem for Hilbert
  Spaces><label|riesz-representation-theorem-for-hilbert-spaces><label|riesz-representation-theorem-for-hilbert-spaces>

  Let <math|H> be a Hilbert space over <math|\<bbb-C\>> or <math|\<bbb-R\>>,
  and let <math|f:H\<rightarrow\>\<bbb-C\>> (or
  <math|f:H\<rightarrow\>\<bbb-R\>>) be a continuous linear functional. Then
  there exists a unique vector <math|y\<in\>H> such that for every
  <math|x\<in\>H>

  <\equation>
    f<around|(|x|)>=<around|\<langle\>|x,y|\<rangle\>>
  </equation>

  Here, <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>> denotes
  the inner product in <math|H>.

  <subsection|Riesz Representation Theorem for
  Measures><label|riesz-representation-theorem-for-measures><label|riesz-representation-theorem-for-measures>

  Let <math|X> be a locally compact Hausdorff space, and let
  <math|C<rsub|c><around|(|X|)>> be the space of all continuous functions
  <math|f:X\<rightarrow\>\<bbb-C\>> (or <math|\<bbb-R\>>) with compact
  support. If <math|\<Lambda\>:C<rsub|c><around|(|X|)>\<rightarrow\>\<bbb-C\>>
  (or <math|\<bbb-R\>>) is a continuous linear functional, then there exists
  a unique regular complex Borel measure <math|\<mu\>> (or real Borel
  measure, depending on the field) on <math|X> such that

  <\equation>
    \<Lambda\><around|(|f|)>=<big|int><rsub|X>f*d*\<mu\>
  </equation>

  for all <math|f\<in\>C<rsub|c><around|(|X|)>>.

  <subsection|Interpretations><label|interpretations><label|interpretations>

  <\itemize>
    <item>The Hilbert spaces version implies that every continuous linear
    functional can be represented using the inner product with a specific
    vector in that space.

    <item>The measures version indicates that continuous linear functionals
    on <math|C<rsub|c><around|(|X|)>> can be represented as integrals against
    a unique measure.
  </itemize>

  <subsection|Examples and Applications><label|examples-and-applications><label|examples-and-applications>

  <subsubsection|Legendre Polynomials><label|legendre-polynomials><label|legendre-polynomials>

  Let's consider the space <math|L<rsup|2><around|(|<around|[|-1,1|]>|)>> of
  square-integrable functions on the interval <math|<around|[|-1,1|]>> with
  the inner product defined as

  <\equation>
    <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|-1><rsup|1>f<around|(|x|)>*g<around|(|x|)>*<space|0.17em>d*x
  </equation>

  We'll look at the Legendre polynomials <math|P<rsub|n><around|(|x|)>>,
  which are orthogonal with respect to this inner product:

  <\equation>
    <around|\<langle\>|P<rsub|m>,P<rsub|n>|\<rangle\>>=<big|int><rsub|-1><rsup|1>P<rsub|m><around|(|x|)>*P<rsub|n><around|(|x|)>*<space|0.17em>d*x=\<delta\><rsub|m*n>
  </equation>

  where <math|\<delta\><rsub|m*n>> is the Kronecker delta. Now, let's say we
  have a continuous linear functional <math|f:L<rsup|2><around|(|<around|[|-1,1|]>|)>\<to\>\<bbb-R\>>.
  By the Riesz Representation Theorem, there exists a unique
  <math|g\<in\>L<rsup|2><around|(|<around|[|-1,1|]>|)>> such that

  <\equation>
    f<around|(|h|)>=<around|\<langle\>|h,g|\<rangle\>>
  </equation>

  for all <math|h\<in\>L<rsup|2><around|(|<around|[|-1,1|]>|)>>. We can
  expand <math|g> in terms of the Legendre polynomials:

  <\equation>
    g<around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>>a<rsub|n>*P<rsub|n><around|(|x|)>
  </equation>

  Then,

  <\equation>
    f<around|(|h|)>=<around|\<langle\>|h,g|\<rangle\>>=<around|\<langle\>|h,<big|sum><rsub|n=0><rsup|\<infty\>>a<rsub|n>*P<rsub|n>|\<rangle\>>=<big|sum><rsub|n=0><rsup|\<infty\>>a<rsub|n>*<around|\<langle\>|h,P<rsub|n>|\<rangle\>>
  </equation>

  Here, <math|a<rsub|n>> can be found as:

  <\equation>
    a<rsub|n>=<around|\<langle\>|g,P<rsub|n>|\<rangle\>>
  </equation>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.3|1>>
    <associate|auto-5|<tuple|1.4|1>>
    <associate|auto-6|<tuple|1.4.1|1>>
    <associate|examples-and-applications|<tuple|1.4|1>>
    <associate|interpretations|<tuple|1.3|1>>
    <associate|legendre-polynomials|<tuple|1.4.1|1>>
    <associate|riesz-representation-theorem|<tuple|1|1>>
    <associate|riesz-representation-theorem-for-hilbert-spaces|<tuple|1.1|1>>
    <associate|riesz-representation-theorem-for-measures|<tuple|1.2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Riesz
      Representation Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Riesz Representation Theorem
      for Hilbert Spaces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Riesz Representation Theorem
      for Measures <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Interpretations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Examples and Applications
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|1.4.1<space|2spc>Legendre Polynomials
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>
    </associate>
  </collection>
</auxiliary>