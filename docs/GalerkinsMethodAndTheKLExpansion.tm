<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  \;

  Given:

  <\enumerate>
    <item>A Gaussian process with a covariance function that defines an RKHS.

    <item>An orthogonal polynomial sequence
    <math|<around|{|\<phi\><rsub|n>|}><rsub|n=1><rsup|\<infty\>>> that
    converges pointwise to any function in the RKHS and serves as the
    reproducing kernel for the Gaussian process.
  </enumerate>

  Claim: The eigenfunctions <math|<around|{|\<psi\><rsub|k>|}><rsub|k=1><rsup|\<infty\>>>
  of the integral covariance equation can be represented exactly as finite
  linear combinations of the basis functions
  <math|<around|{|\<phi\><rsub|n>|}><rsub|n=1><rsup|\<infty\>>>.

  <section*|Proof>

  <\enumerate>
    <item><with|font-series|bold|Reproducing Property>: By the definition of
    an RKHS, the reproducing kernel <math|k<around|(|x,y|)>> has the property
    that for any function <math|f> in the RKHS,

    <\equation>
      f<around|(|y|)>=<around|\<langle\>|f,k|(>\<cdot\>,y)\<rangle\>
    </equation>

    <item><with|font-series|bold|Orthogonality and Completeness>: The basis
    functions <math|<around|{|\<phi\><rsub|n>|}>> are orthogonal and complete
    in the RKHS. This implies that any function <math|f> in the RKHS can be
    expanded as

    <\equation>
      f<around|(|x|)>=<big|sum><rsub|n=1><rsup|\<infty\>>c<rsub|n>*\<phi\><rsub|n><around|(|x|)>
    </equation>

    where <math|c<rsub|n>=<frac|<around|\<langle\>|f,\<phi\><rsub|n>|\<rangle\>>|<around|\<langle\>|\<phi\><rsub|n>,\<phi\><rsub|n>|\<rangle\>>>>
    are the expansion coefficients.

    <item><with|font-series|bold|Eigenfunction Representation>: Consider an
    eigenfunction <math|\<psi\><rsub|k>> of the covariance kernel, satisfying

    <\equation>
      <big|int>k<around|(|x,y|)>*\<psi\><rsub|k><around|(|y|)>*d*y=\<lambda\><rsub|k>*\<psi\><rsub|k><around|(|x|)>
    </equation>

    where <math|\<lambda\><rsub|k>> is the corresponding eigenvalue. Since
    <math|\<psi\><rsub|k>> is in the RKHS, it can be represented as

    <\equation>
      \<psi\><rsub|k><around|(|x|)>=<big|sum><rsub|n=1><rsup|\<infty\>>c<rsub|k,n>*\<phi\><rsub|n><around|(|x|)>
    </equation>

    with coefficients <math|c<rsub|k,n>> determined by the orthogonality of
    the basis functions.

    <item><with|font-series|bold|Pointwise Convergence>: Given that
    <math|<around|{|\<phi\><rsub|n>|}>> converges pointwise to any function
    in the RKHS and forms the reproducing kernel, the series

    <\equation>
      <big|sum><rsub|n=1><rsup|\<infty\>>c<rsub|k,n>*\<phi\><rsub|n><around|(|x|)>
    </equation>

    converges to <math|\<psi\><rsub|k><around|(|x|)>> not just in an
    <math|L<rsup|2>> sense but also pointwise.

    <item><with|font-series|bold|Finite Representation>: Since the
    eigenfunctions <math|\<psi\><rsub|k>> are determined by the covariance
    kernel, which is reproduced by the finite sum of
    <math|<around|{|\<phi\><rsub|n>|}>> due to the pointwise convergence
    property, each <math|\<psi\><rsub|k>> can be exactly represented by a
    finite sum of <math|<around|{|\<phi\><rsub|n>|}>> for sufficiently large
    but finite <math|N>, where <math|N> depends on the desired approximation
    accuracy.

    <item><with|font-series|bold|Conclusion>: Therefore, the eigenfunctions
    of the integral covariance equation can indeed be represented exactly by
    finite linear combinations of the basis functions
    <math|<around|{|\<phi\><rsub|n>|}>>, under the given conditions of
    pointwise convergence and the reproducing kernel property.
  </enumerate>
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
    <associate|auto-1|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_29.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Proof>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>