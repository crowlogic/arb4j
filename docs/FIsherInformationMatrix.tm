<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <section|Proof of Non-redundant Parameter Space Construction>

  <\theorem>
    Given a likelihood function <math|L<around|(|\<theta\>|)>> where
    <math|\<theta\>\<in\>\<bbb-R\><rsup|n>>, the transformation
    <math|\<theta\><rsub|reduced>=V<rsub|k><rsup|T>*\<theta\>> constructed
    from the Fisher Information Matrix (FIM) eigenvectors corresponding to
    non-zero eigenvalues yields a non-redundant parameter space where
    <math|k\<less\>n> if and only if there were redundancies in the original
    parameterization.
  </theorem>

  <\proof>
    Let <math|F> be the Fisher Information Matrix with elements:

    <\equation*>
      F<rsub|i*j>=-\<bbb-E\>*<around*|[|<frac|\<partial\><rsup|2>|\<partial\>*\<theta\><rsub|i>*\<partial\>*\<theta\><rsub|j>>*log
      L<around|(|\<theta\>|)>|]>
    </equation*>

    Since <math|F> is symmetric and positive semidefinite, it has
    eigendecomposition <math|F=V*\<Lambda\>*V<rsup|T>> where:

    <\itemize>
      <item><math|\<Lambda\>=<text|diag><around|(|\<lambda\><rsub|1>,\<lambda\><rsub|2>,\<lambda\><rsub|3>,\<lambda\><rsub|4>,\<lambda\><rsub|5>,\<ldots\>,\<lambda\><rsub|n>|)>>
      where <math|\<lambda\><rsub|i>\<geq\>0>

      <item><math|V=<around|[|v<rsub|1>*<space|0.27em>v<rsub|2>*<space|0.27em>v<rsub|3>*<space|0.27em>v<rsub|4>*<space|0.27em>v<rsub|5>*<space|0.27em>\<cdots\>*<space|0.27em>v<rsub|n>|]>>
      with orthonormal eigenvectors
    </itemize>

    The rank <math|k> of <math|F> equals the number of non-zero
    eigenvalues[1]. When <math|k\<less\>n>, the model is parameter redundant
    with deficiency <math|d=n-k>[5].

    Let <math|V<rsub|k>=<around|[|v<rsub|1>*<space|0.27em>v<rsub|2>*<space|0.27em>v<rsub|3>*<space|0.27em>\<cdots\>*<space|0.27em>v<rsub|k>|]>>
    contain only the eigenvectors corresponding to non-zero eigenvalues. The
    transformation <math|\<theta\><rsub|reduced>=V<rsub|k><rsup|T>*\<theta\>>
    then:

    <\itemize>
      <item>Projects onto a space of dimension <math|k\<less\>n> if and only
      if redundancies existed

      <item>Contains only independent parameters since each basis vector
      corresponds to a unique non-zero eigenvalue

      <item>Preserves all information in the likelihood since zero
      eigenvalues indicate directions of flat likelihood[2]
    </itemize>

    Therefore, <math|\<theta\><rsub|reduced>> provides a minimal,
    non-redundant parameterization.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Proof
      of Non-redundant Parameter Space Construction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>