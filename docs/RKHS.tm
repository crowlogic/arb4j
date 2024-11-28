<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <\proposition>
    Let <math|K:T\<times\>T\<to\>\<bbb-C\>> be a covariance function such
    that the associated RKHS <math|\<cal-H\><rsub|K>> is separable where
    <math|T\<subset\>\<bbb-R\>>. Then there exists a family of vector
    functions\ 

    <\equation>
      \<Psi\><around|(|t,x|)>=<around|(|\<psi\><rsub|n><around|(|t,x|)>,n\<geq\>1|)>\<forall\>t\<in\>T
    </equation>

    and a Borel measure <math|\<mu\>> on <math|T> such that
    <math|\<psi\><rsub|n><around|(|t,x|)>\<in\>L<rsup|2><around|(|T,\<mu\>|)>>
    in terms of which <math|K> is representable as:

    <\equation>
      K<around|(|s,t|)>=<big|int><rsub|T><big|sum><rsub|n=1><rsup|\<infty\>>\<psi\><rsub|n><around|(|s,x|)><wide|\<psi\><rsub|n><around|(|t,x|)>|\<bar\>>d*\<mu\><around|(|x|)>
    </equation>

    The vector functions <math|\<Psi\><around|(|s,.|)>,s\<in\>T> and the
    measure <math|\<mu\>> may not be unique, but all such
    <math|<around|(|\<Psi\>,.|)>,.)> determine <math|K> and its reproducing
    kernel Hilbert space (RKHS) <math|H<rsub|K>> uniquely and the cardinality
    of the components determining <math|K> remains the same.
    <cite-detail|stochasticProcessesInferenceTheory|>
  </proposition>

  <\remark>
    1. If <math|\<Psi\><around|(|t,.|)>> is a scalar, then we have

    <\equation>
      K<around|(|s,t|)>=<big|int><rsub|T>\<Psi\><around|(|s,x|)><wide|\<Psi\><around|(|t,x|)>|\<bar\>>d*\<mu\><around|(|x|)>
    </equation>

    which includes the tri-diagonal triangular covariance with <math|\<mu\>>
    absolutely continuous relative to the Lebesgue measure.

    2. The following notational simplification of (25) can be made. Let
    <math|n=R\<times\>Z<rsub|+>=S\<otimes\>P>, where <math|P> is the power
    set of integers Z, and let P = u @ o where o is the counting measure.
    Then

    <\equation>
      \<Psi\><around|(|t,n|)>=<around|(|\<psi\><rsub|n><around|(|t,x|)>,n\<in\>Z|)>
    </equation>

    Hence

    <\equation>
      <around|\||\<Psi\><rsup|\<ast\>><around|(|t|)>|\|><rsup|2><rsub|L<rsup|2>>=<big|int><rsub|T><around|\||\<psi\><rsub|n><around|(|t,x|)>|\|><rsup|2>*d*\<mu\><around|(|x|)>
    </equation>
  </remark>

  \;

  \;

  <vspace*|1em>This content is adapted from MM Rao's book, *Stochastic
  Processes: Inference Theory*. Propisition 8

  <\bibliography|bib|tm-plain|refs>
    <\bib-list|1>
      <bibitem*|1><label|bib-stochasticProcessesInferenceTheory>Malempati<nbsp>M.<nbsp>Rao.
      <newblock><with|font-shape|italic|Stochastic Processes: Inference
      Theory>. <newblock>Springer Monographs in Mathematics. Springer,
      2nd<localize| edition>, 2014.<newblock>
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
    <associate|auto-1|<tuple|5|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
    <associate|bib-stochasticProcessesInferenceTheory|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_62.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stochasticProcessesInferenceTheory
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>