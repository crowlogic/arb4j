<TeXmacs|2.1.4>

<style|generic>

<\body>
  <\theorem>
    <label|thm:existence_osc><with|font-series|bold|[Existence of Oscillatory
    Processes]> Let <math|F> be an absolutely continuous spectral measure and
    the gain function

    <\equation>
      <label|eq:gain_condition>A<rsub|t><around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    be measurable in both time and frequency; then the time-dependent
    spectral density is defined by

    <\equation>
      <label|eq:time_dependent_spectrum><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|S<rsub|t><around|(|\<lambda\>|)>>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<infty\>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*S<around|(|\<lambda\>|)>*d*\<lambda\>>>>>>
    </equation>

    and there exists a complex orthogonal random measure <math|\<Phi\>> with
    spectral measure <math|F> such that for each sample path
    <math|\<omega\><rsub|0>\<in\>\<Omega\>>

    <\equation>
      <label|eq:oscillatory_well_defined>Z<around|(|t,\<omega\><rsub|0>|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>,\<omega\><rsub|0>|)>
    </equation>

    is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>> and has
    covariance <math|R<rsub|Z>> as in <eqref|eq:oscillatory_covariance>.
  </theorem>

  <\proof>
    <\enumerate>
      <item>Define the space of simple functions on <math|\<bbb-R\>>: for
      disjoint Borel sets <math|<around|{|E<rsub|j>|}><rsub|j=1><rsup|n>>
      with <math|F<around|(|E<rsub|j>|)>\<less\>\<infty\>> and coefficients
      <math|<around|{|c<rsub|j>|}><rsub|j=1><rsup|n>\<subset\>\<bbb-C\>>,

      <\equation>
        <label|eq:simple_function>g<around|(|\<lambda\>|)>=<big|sum><rsub|j=1><rsup|n>c<rsub|j><text|<with|font-series|bold|1>><rsub|E<rsub|j>><around|(|\<lambda\>|)>
      </equation>

      <item>For simple functions, define the stochastic integral

      <\equation>
        <label|eq:integral_simple><big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>\<assign\><big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>
      </equation>

      <item>Compute the second moment:

      <\equation>
        <label|eq:second_moment_simple><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<bbb-E\><around*|[|<around*|\||<big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>|\|><rsup|2>|]>>|<cell|=\<bbb-E\><around*|[|<around*|\||<big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<Phi\><around|(|E<rsub|j>|)>|\|><rsup|2>|]>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>>>>>>
      </equation>

      <item>By linearity of expectation,

      <\equation>
        <label|eq:linearity_expectation>\<bbb-E\><around*|[|<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>=<big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>
      </equation>

      <item>By the orthogonality relation <eqref|eq:orthogonality_phi>, since
      <math|E<rsub|j>\<cap\>E<rsub|k>=\<emptyset\>> for <math|j\<neq\>k>,

      <\equation>
        <label|eq:orthogonality_application>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|F<around|(|E<rsub|j>|)>>|<cell|<text|if
        >j=k>>|<row|<cell|0>|<cell|<text|if >j\<neq\>k>>>>>|\<nobracket\>>
      </equation>

      <item>Substituting <eqref|eq:orthogonality_application> into
      <eqref|eq:linearity_expectation>,

      <\equation>
        <label|eq:isometry_simple><big|sum><rsub|j=1><rsup|n><big|sum><rsub|k=1><rsup|n>c<rsub|j><wide|c<rsub|k>|\<bar\>>\<bbb-E\><around|[|\<Phi\><around|(|E<rsub|j>|)><wide|\<Phi\><around|(|E<rsub|k>|)>|\<bar\>>|]>=<big|sum><rsub|j=1><rsup|n><around|\||c<rsub|j>|\|><rsup|2>*F<around|(|E<rsub|j>|)>
      </equation>

      <item>The right side of <eqref|eq:isometry_simple> equals

      <\equation>
        <label|eq:L2_norm_simple><big|sum><rsub|j=1><rsup|n><around|\||c<rsub|j>|\|><rsup|2>*F<around|(|E<rsub|j>|)>=<big|int><rsub|\<bbb-R\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>
      </equation>

      <item>Therefore the isometry property holds for simple functions:

      <\equation>
        <label|eq:isometry_established>\<bbb-E\><around*|[|<around*|\||<big|int><rsub|\<bbb-R\>>g<around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>|\|><rsup|2>|]>=<big|int><rsub|\<bbb-R\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>
      </equation>

      <item>The space of simple functions is dense in
      <math|L<rsup|2><around|(|F|)>>. For any
      <math|h<around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>> and
      <math|\<epsilon\>\<gtr\>0>, there exists a simple function
      <math|g<around|(|\<lambda\>|)>> such that

      <\equation>
        <label|eq:density_simple><big|int><rsub|\<bbb-R\>><around|\||h<around|(|\<lambda\>|)>-g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<epsilon\>
      </equation>

      <item>By the isometry <eqref|eq:isometry_established> and completeness
      of <math|L<rsup|2><around|(|\<Omega\>|)>>, the integral extends
      uniquely by continuity to all <math|h<around|(|\<lambda\>|)>\<in\>L<rsup|2><around|(|F|)>>.

      <item>Since <math|A<rsub|t>\<in\>L<rsup|2><around|(|F|)>> by assumption
      <eqref|eq:gain_condition>, and <math|<around|\||e<rsup|i*\<lambda\>*t>|\|>=1>,

      <\equation>
        <label|eq:varphi_L2><big|int><rsub|\<bbb-R\>><around|\||\<varphi\><rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><around|\||A<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>\<less\>\<infty\>
      </equation>

      so <math|\<varphi\><rsub|t>\<in\>L<rsup|2><around|(|F|)>>.

      <item>Therefore

      <\equation>
        <label|eq:Z_well_defined><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>>>>>>
      </equation>

      is well-defined in <math|L<rsup|2><around|(|\<Omega\>|)>>.

      <item>To compute the covariance, use the sesquilinearity of the
      stochastic integral:

      <\equation>
        <label|eq:covariance_computation><tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|R<rsub|Z><around|(|t,s|)>>|<cell|=\<bbb-E\><around|[|Z<around|(|t|)><wide|Z<around|(|s|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>*<wide|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|s><around|(|\<mu\>|)>*d*\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>>>>>>
      </equation>

      <item>By Fubini's theorem for stochastic integrals,

      <\equation>
        <label|eq:fubini_stochastic>\<bbb-E\><around*|[|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*d*\<Phi\><around|(|\<lambda\>|)>*<wide|<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|s><around|(|\<mu\>|)>*d*\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<mu\>|)>|\<bar\>>\<bbb-E\>*<around|[|d*\<Phi\><around|(|\<lambda\>|)><wide|d*\<Phi\><around|(|\<mu\>|)>|\<bar\>>|]>
      </equation>

      <item>Using the orthogonality relation <eqref|eq:orthogonality_phi>,

      <\equation>
        <label|eq:orthogonality_integral><big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<mu\>|)>|\<bar\>>\<delta\>*<around|(|\<lambda\>-\<mu\>|)>*d*F<around|(|\<lambda\>|)>*d*F<around|(|\<mu\>|)>=<big|int><rsub|\<bbb-R\>>\<varphi\><rsub|t><around|(|\<lambda\>|)><wide|\<varphi\><rsub|s><around|(|\<lambda\>|)>|\<bar\>>d*F<around|(|\<lambda\>|)>
      </equation>

      <item>Substituting the definition <eqref|eq:oscillatory_function>,

      <\equation>
        <label|eq:covariance_final>R<rsub|Z><around|(|t,s|)>=<big|int><rsub|\<bbb-R\>>A<rsub|t><around|(|\<lambda\>|)><wide|A<rsub|s><around|(|\<lambda\>|)>|\<bar\>>e<rsup|i*\<lambda\>*<around|(|t-s|)>>*d*F<around|(|\<lambda\>|)>
      </equation>

      as claimed in <eqref|eq:oscillatory_covariance>.
    </enumerate>
  </proof>
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
    <associate|eq:L2_norm_simple|<tuple|10|2>>
    <associate|eq:Z_well_defined|<tuple|14|2>>
    <associate|eq:covariance_computation|<tuple|15|2>>
    <associate|eq:covariance_final|<tuple|18|2>>
    <associate|eq:density_simple|<tuple|12|2>>
    <associate|eq:fubini_stochastic|<tuple|16|2>>
    <associate|eq:gain_condition|<tuple|1|1>>
    <associate|eq:integral_simple|<tuple|5|1>>
    <associate|eq:isometry_established|<tuple|11|2>>
    <associate|eq:isometry_simple|<tuple|9|2>>
    <associate|eq:linearity_expectation|<tuple|7|1>>
    <associate|eq:orthogonality_application|<tuple|8|1>>
    <associate|eq:orthogonality_integral|<tuple|17|2>>
    <associate|eq:oscillatory_well_defined|<tuple|3|1>>
    <associate|eq:second_moment_simple|<tuple|6|1>>
    <associate|eq:simple_function|<tuple|4|1>>
    <associate|eq:time_dependent_spectrum|<tuple|2|1>>
    <associate|eq:varphi_L2|<tuple|13|2>>
    <associate|thm:existence_osc|<tuple|1|1>>
  </collection>
</references>