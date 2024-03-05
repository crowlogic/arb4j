<TeXmacs|2.1.1>

<style|generic>

<\body>
  <doc-data|<doc-title|Formulas Related to the Complete Elliptical Integral
  of the First Kind>>

  <section*|Complete Elliptical Integral of the First Kind
  <math|K<around|(|k|)>>>

  <subsection*|Definition>

  <\equation>
    K<around|(|k|)>=<big|int><rsub|0><rsup|<frac|\<pi\>|2>><frac|d*\<theta\>|<sqrt|1-k<rsup|2>*sin<rsup|2>
    \<theta\>>>
  </equation>

  <subsection*|Hypergeometric Representation>

  <\equation>
    K<around|(|k|)>=<frac|\<pi\>|2><rsub|2>*F<rsub|1><around*|(|<frac|1|2>,<frac|1|2>;1;k<rsup|2>|)>
  </equation>

  <subsection*|Series Expansion>

  <\equation>
    K<around|(|k|)>=<frac|\<pi\>|2>*<around*|[|1+<around*|(|<frac|1|2>|)><rsup|2>*k<rsup|2>+<around*|(|<frac|1\<cdot\>3|2\<cdot\>4>|)><rsup|2>*k<rsup|4>+\<cdots\>|]>
  </equation>

  <subsection*|Asymptotic Expansion for <math|k\<to\>1>>

  <\equation>
    K<around|(|k|)>\<approx\>ln <around*|(|<frac|4|<sqrt|1-k<rsup|2>>>|)>,<space|1em>k\<to\>1
  </equation>

  <subsection*|Relation to Other Integrals>

  <with|font-series|bold|Complete Elliptical Integral of the Second Kind
  <math|E<around|(|k|)>>:>

  <\equation>
    E<around|(|k|)>=<big|int><rsub|0><rsup|<frac|\<pi\>|2>><sqrt|1-k<rsup|2>*sin<rsup|2>
    \<theta\>>*<space|0.17em>d*\<theta\>
  </equation>

  <subsection*|Legendre's Relation>

  <\equation>
    E<around|(|k|)>*K<around|(|k<rprime|'>|)>+E<around|(|k<rprime|'>|)>*K<around|(|k|)>-K<around|(|k|)>*K<around|(|k<rprime|'>|)>=<frac|\<pi\>|2>,<space|1em>k<rprime|'>=<sqrt|1-k<rsup|2>>
  </equation>

  <subsection*|Applications in Geometry>

  <with|font-series|bold|Arc Length of the Lemniscate:>

  <\equation>
    s=2*a\<cdot\>K<around*|(|<frac|1|<sqrt|2>>|)>
  </equation>

  <subsection*|Numerical Methods>

  <with|font-shape|italic|For computing <math|K<around|(|k|)>>, numerical
  integration, series expansion, or iterative algorithms may be applied,
  depending on the desired accuracy and computational efficiency.>
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-2|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-3|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-4|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-5|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-6|<tuple|4|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-7|<tuple|5|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-8|<tuple|6|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
    <associate|auto-9|<tuple|7|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Complete
      Elliptical Integral of the First Kind
      <with|mode|<quote|math>|K<around|(|k|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Definition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|Hypergeometric Representation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|Series Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|Asymptotic Expansion for
      <with|mode|<quote|math>|k\<to\>1> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|Relation to Other Integrals
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|Legendre's Relation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|Applications in Geometry
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|Numerical Methods
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>
    </associate>
  </collection>
</auxiliary>