<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Orthogonal Polynomials with Respect to a
  Measure>|<doc-date|>>

  <section|Existence and Uniqueness of Orthogonal Polynomials>

  <subsection|Conditions for Existence>

  For a measure <math|\<mu\>> on the real line to have a set of orthogonal
  polynomials:

  <\enumerate>
    <item><math|\<mu\>> must be a positive Borel measure.

    <item>All moments of <math|\<mu\>> must exist and be finite:

    <\equation>
      <big|int>x<rsup|n>*d*\<mu\><around|(|x|)>\<less\>\<infty\>*<space|1em><text|for
      all >n\<geq\>0
    </equation>

    <item><math|\<mu\>> must not be concentrated on a finite set of points.
  </enumerate>

  <subsection|Uniqueness of Orthogonal Polynomials>

  If orthogonal polynomials exist for a measure, their uniqueness (up to
  normalization) is guaranteed by:

  <\enumerate>
    <item>Gram-Schmidt Process

    <item>Three-Term Recurrence Relation:

    <\equation>
      P<rsub|n+1><around|(|x|)>=<around|(|A<rsub|n>*x+B<rsub|n>|)>*P<rsub|n><around|(|x|)>-C<rsub|n>*P<rsub|n-1><around|(|x|)>
    </equation>
  </enumerate>

  <subsection|Determining Uniqueness>

  <\theorem>
    [Carleman's Condition] If the measure satisfies:

    <\equation>
      <big|sum><rsub|n=1><rsup|\<infty\>><around|(|m<rsub|2*n>|)><rsup|-1/2*n>=\<infty\>
    </equation>

    where <math|m<rsub|2*n>> is the <math|2*n>-th moment, then the measure
    has a unique set of orthogonal polynomials.
  </theorem>

  <\theorem>
    [Stieltjes Moment Problem] For measures supported on
    <math|<around|[|0,\<infty\>|)>>, if:

    <\equation>
      <big|sum><rsub|n=1><rsup|\<infty\>><around|(|m<rsub|n>|)><rsup|-1/2*n>=\<infty\>
    </equation>

    then the measure has a unique set of orthogonal polynomials.
  </theorem>

  <section|Generation of Orthogonal Polynomials>

  <subsection|Gram-Schmidt Process>

  Let <math|\<mu\>> be a measure on <math|\<bbb-R\>> and define the inner
  product:

  <\equation>
    <big|int><rsub|\<bbb-R\>>f<around|(|x|)>*g<around|(|x|)>*d*\<mu\><around|(|x|)>
  </equation>

  Starting with the monomials <math|<around|{|1,x,x<rsup|2>,\<ldots\>|}>>, we
  construct orthogonal polynomials <math|<around|{|P<rsub|0>,P<rsub|1>,P<rsub|2>,\<ldots\>|}>>
  as follows:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|P<rsub|0><around|(|x|)>>|<cell|=1>>|<row|<cell|<vspace*|10pt>P<rsub|1><around|(|x|)>>|<cell|=x-<frac|<big|int><rsub|\<bbb-R\>>x\<cdot\>1*<space|0.17em>d*\<mu\><around|(|x|)>|<big|int><rsub|\<bbb-R\>>1\<cdot\>1*<space|0.17em>d*\<mu\><around|(|x|)>>>>|<row|<cell|<vspace*|10pt>P<rsub|2><around|(|x|)>>|<cell|=x<rsup|2>-<frac|<big|int><rsub|\<bbb-R\>>x<rsup|2>\<cdot\>P<rsub|1><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>|<big|int><rsub|\<bbb-R\>>P<rsub|1><around|(|x|)>\<cdot\>P<rsub|1><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>>*P<rsub|1><around|(|x|)>-<frac|<big|int><rsub|\<bbb-R\>>x<rsup|2>\<cdot\>P<rsub|0><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>|<big|int><rsub|\<bbb-R\>>P<rsub|0><around|(|x|)>\<cdot\>P<rsub|0><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>>*P<rsub|0><around|(|x|)>>>|<row|<cell|<vspace*|10pt>P<rsub|n><around|(|x|)>>|<cell|=x<rsup|n>-<big|sum><rsub|k=0><rsup|n-1><frac|<big|int><rsub|\<bbb-R\>>x<rsup|n>\<cdot\>P<rsub|k><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>|<big|int><rsub|\<bbb-R\>>P<rsub|k><around|(|x|)>\<cdot\>P<rsub|k><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>>*P<rsub|k><around|(|x|)>>>>>>
  </equation>

  <subsection|Three-Term Recurrence Relation>

  The orthogonal polynomials satisfy a three-term recurrence relation:

  <\equation>
    P<rsub|n+1><around|(|x|)>=<around|(|A<rsub|n>*x+B<rsub|n>|)>*P<rsub|n><around|(|x|)>-C<rsub|n>*P<rsub|n-1><around|(|x|)>
  </equation>

  where:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|A<rsub|n>>|<cell|=<frac|<big|int><rsub|\<bbb-R\>>x*P<rsub|n><around|(|x|)>\<cdot\>P<rsub|n><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>|<big|int><rsub|\<bbb-R\>>P<rsub|n><around|(|x|)>\<cdot\>P<rsub|n><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>>>>|<row|<cell|<vspace*|10pt>B<rsub|n>>|<cell|=<frac|<big|int><rsub|\<bbb-R\>>x*P<rsub|n><around|(|x|)>\<cdot\>P<rsub|n-1><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>|<big|int><rsub|\<bbb-R\>>P<rsub|n-1><around|(|x|)>\<cdot\>P<rsub|n-1><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>>>>|<row|<cell|<vspace*|10pt>C<rsub|n>>|<cell|=<frac|<big|int><rsub|\<bbb-R\>>P<rsub|n><around|(|x|)>\<cdot\>P<rsub|n><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>|<big|int><rsub|\<bbb-R\>>P<rsub|n-1><around|(|x|)>\<cdot\>P<rsub|n-1><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>>>>>>>
  </equation>

  This recurrence relation, along with initial conditions
  <math|P<rsub|0><around|(|x|)>=1> and <math|P<rsub|1><around|(|x|)>=x-B<rsub|0>>,
  uniquely determines the set of orthogonal polynomials.

  <subsection|Normalized Orthogonal Polynomials>

  To obtain orthonormal polynomials, we normalize each polynomial by dividing
  it by its norm:

  <\equation>
    <wide|P|^><rsub|n><around|(|x|)>=<frac|P<rsub|n><around|(|x|)>|<sqrt|<big|int><rsub|\<bbb-R\>><around|[|P<rsub|n><around|(|x|)>|]><rsup|2>*d*\<mu\><around|(|x|)>>>
  </equation>

  This normalization ensures that:

  <\equation>
    <big|int><rsub|\<bbb-R\>><wide|P|^><rsub|n><around|(|x|)>\<cdot\><wide|P|^><rsub|m><around|(|x|)>*<space|0.17em>d*\<mu\><around|(|x|)>=\<delta\><rsub|n*m>
  </equation>

  where <math|\<delta\><rsub|n*m>> is the Kronecker delta.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_59.tm>>
    <associate|auto-2|<tuple|1.1|1|../../.TeXmacs/texts/scratch/no_name_59.tm>>
    <associate|auto-3|<tuple|1.2|1|../../.TeXmacs/texts/scratch/no_name_59.tm>>
    <associate|auto-4|<tuple|1.3|1|../../.TeXmacs/texts/scratch/no_name_59.tm>>
    <associate|auto-5|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_59.tm>>
    <associate|auto-6|<tuple|2.1|2|../../.TeXmacs/texts/scratch/no_name_59.tm>>
    <associate|auto-7|<tuple|2.2|2|../../.TeXmacs/texts/scratch/no_name_59.tm>>
    <associate|auto-8|<tuple|2.3|2|../../.TeXmacs/texts/scratch/no_name_59.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Existence
      and Uniqueness of Orthogonal Polynomials>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Conditions for Existence
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Uniqueness of Orthogonal
      Polynomials <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Determining Uniqueness
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Generation
      of Orthogonal Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Gram-Schmidt Process
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Three-Term Recurrence
      Relation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Normalized Orthogonal
      Polynomials <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>
    </associate>
  </collection>
</auxiliary>