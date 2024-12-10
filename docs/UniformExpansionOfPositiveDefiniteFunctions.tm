<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Spectral Expansion for Stationary
  Kernels>|<doc-author|<author-data|<author-name|Stephen Andrew
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    [Spectral Expansion of Stationary Kernels] Let <math|K<around|(|t,s|)>>
    be a continuous, positive definite, stationary kernel with spectral
    measure <math|\<mu\>>. Assume:

    <\enumerate>
      <item><math|\<mu\>> has all finite moments:
      <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<omega\>|\|><rsup|n>*d*\<mu\><around|(|\<omega\>|)>\<less\>\<infty\>>
      for all <math|n\<geq\>0>

      <item><math|\<mu\>> satisfies Carleman's condition:
      <math|<big|sum><rsub|n=1><rsup|\<infty\>><around|(|\<mu\><rsub|2*n>|)><rsup|-1/<around|(|2*n|)>>=\<infty\>>
      where <math|\<mu\><rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|n>*d*\<mu\><around|(|\<omega\>|)>>
    </enumerate>

    Then the expansion

    <\equation*>
      <big|sum><rsub|n=0><rsup|N><around|\<langle\>|K|(>\<cdot\>,s),\<psi\><rsub|n>\<rangle\>\<psi\><rsub|n><around|(|t|)>
    </equation*>

    where <math|<around|{|\<psi\><rsub|n>|}>> are constructed via
    Gram-Schmidt orthonormalization of <math|<around|{|f<rsub|n>|}>>,
    converges uniformly to <math|K<around|(|t,s|)>> as
    <math|N\<to\>\<infty\>>.
  </theorem>

  <\lemma>
    [Moment Problem Uniqueness] Under the Carleman condition, the measure
    <math|\<mu\>> is uniquely determined by its moments, and polynomials are
    dense in <math|L<rsup|2>*<around|(|d*\<mu\>|)>>.
  </lemma>

  <\proof>
    The Carleman condition ensures that the moment problem is determinate. By
    the Riesz-Haviland theorem, this implies polynomial density in
    <math|L<rsup|2>*<around|(|d*\<mu\>|)>>.
  </proof>

  We proceed through several steps:

  <with|font-series|bold|Step 1: Spectral Representation>

  By Bochner's theorem:

  <\equation*>
    K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<mu\><around|(|\<omega\>|)>
  </equation*>

  <with|font-series|bold|Step 2: Regularization>

  For <math|M\<gtr\>0>, define the truncated kernel:

  <\equation*>
    K<rsub|M>*<around|(|t-s|)>=<big|int><rsub|-M><rsup|M>e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<mu\><around|(|\<omega\>|)>
  </equation*>

  <\lemma>
    [Truncation Convergence] <math|<around|\<\|\|\>|K-K<rsub|M>|\<\|\|\>><rsub|\<infty\>>\<to\>0>
    as <math|M\<to\>\<infty\>>, and <math|K<rsub|M>> is positive definite for
    each <math|M>.
  </lemma>

  <\proof>
    The convergence follows from dominated convergence, while positive
    definiteness follows from the fact that <math|K<rsub|M>> is a Fourier
    transform of a positive measure.
  </proof>

  <with|font-series|bold|Step 3: Polynomial Approximation>

  <\lemma>
    [L\<twosuperior\> Density] Let <math|<around|{|p<rsub|n>|}>> be
    orthogonal polynomials with respect to
    <math|\<mu\>\|<rsub|<around|[|-M,M|]>>>. Then:

    <\equation*>
      e<rsup|i*\<omega\>*t>*\<chi\><rsub|<around|[|-M,M|]>><around|(|\<omega\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n><rsup|M><around|(|t|)>*p<rsub|n><around|(|\<omega\>|)>
    </equation*>

    in <math|L<rsup|2>*<around|(|d*\<mu\>|)>>, where

    <\equation*>
      c<rsub|n><rsup|M><around|(|t|)>=<frac|<big|int><rsub|-M><rsup|M>e<rsup|i*\<omega\>*t>*p<rsub|n><around|(|\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>|<around|\<\|\|\>|p<rsub|n>|\<\|\|\>><rsup|2><rsub|L<rsup|2>*<around|(|d*\<mu\>|)>>>
    </equation*>

    with error bound

    <\equation*>
      <around*|\||e<rsup|i*\<omega\>*t>*\<chi\><rsub|<around|[|-M,M|]>>-<big|sum><rsub|n=0><rsup|N>c<rsub|n><rsup|M><around|(|t|)>*p<rsub|n>|\|><rsub|L<rsup|2>*<around|(|d*\<mu\>|)>>\<leq\>C<rsub|M><around|(|t|)><sqrt|<big|sum><rsub|n\<gtr\>N><frac|1|\<mu\><rsub|2*n>>>
    </equation*>
  </lemma>

  <with|font-series|bold|Step 4: RKHS Structure>

  Define <math|f<rsub|n><rsup|M>=\<cal-F\>*<around|[|p<rsub|n>*\<chi\><rsub|<around|[|-M,M|]>>|]>>.
  Then:

  <\lemma>
    [RKHS Completeness] The set <math|<around|{|f<rsub|n><rsup|M>|}><rsub|n=0><rsup|\<infty\>>>
    is complete in <math|\<cal-H\><rsub|K<rsub|M>>> with:

    <\equation*>
      <around|\<\|\|\>|f<rsub|n><rsup|M>|\<\|\|\>><rsup|2><rsub|\<cal-H\><rsub|K<rsub|M>>>=<big|int><rsub|-M><rsup|M><around|\||p<rsub|n><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
    </equation*>

    Moreover, for any <math|f\<in\>\<cal-H\><rsub|K<rsub|M>>>:

    <\equation*>
      f<around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>><around|\<langle\>|f,f<rsub|n><rsup|M>|\<rangle\>><rsub|\<cal-H\><rsub|K<rsub|M>>>*f<rsub|n><rsup|M><around|(|t|)>
    </equation*>
  </lemma>

  <with|font-series|bold|Step 5: RKHS Convergence>

  Let <math|<around|{|\<psi\><rsub|n><rsup|M>|}>> be obtained by Gram-Schmidt
  orthonormalization of <math|<around|{|f<rsub|n><rsup|M>|}>>.

  <\lemma>
    [RKHS Expansion] For fixed <math|M>:

    <\equation*>
      <around*|\<nobracket\>|<around*|\||K<rsub|M>|(>\<cdot\>,s)-<big|sum><rsub|n=0><rsup|N><around|\<langle\>|K<rsub|M>|(>\<cdot\>,s),\<psi\><rsub|n><rsup|M>\<rangle\>\<psi\><rsub|n><rsup|M>|\|><rsub|\<cal-H\><rsub|K<rsub|M>>>\<leq\>
    </equation*>

    <\equation*>
      <sqrt|\<mu\><around|(|<around|[|-M,M|]>|)>-<big|sum><rsub|n=0><rsup|N><around|\<\|\|\>|p<rsub|n>|\<\|\|\>><rsup|2><rsub|L<rsup|2>*<around|(|d*\<mu\>|)>>>
    </equation*>
  </lemma>

  <with|font-series|bold|Step 6: Stability Analysis>

  <\lemma>
    [Gram-Schmidt Stability] For fixed <math|N>, as <math|M\<to\>\<infty\>>:

    <\equation*>
      <around|\<\|\|\>|\<psi\><rsub|n><rsup|M>-\<psi\><rsub|n>|\<\|\|\>><rsub|\<cal-H\><rsub|K>>\<to\>0*<text|uniformly
      for >n\<leq\>N
    </equation*>

    where <math|<around|{|\<psi\><rsub|n>|}>> are the limit functions.
  </lemma>

  <\proof>
    This follows from the stability of Gram-Schmidt under perturbation, using
    the fact that <math|<around|\<\|\|\>|f<rsub|n><rsup|M>-f<rsub|n>|\<\|\|\>><rsub|\<cal-H\><rsub|K>>\<to\>0>
    as <math|M\<to\>\<infty\>>.
  </proof>

  <with|font-series|bold|Step 7: Uniform Convergence>

  By the reproducing property and previous lemmas:

  <\equation*>
    <around*|\<nobracket\>|sup<rsub|t,s><around*|\||K<around|(|t,s|)>-<big|sum><rsub|n=0><rsup|N><around|\<langle\>|K|(>\<cdot\>,s|)>,\<psi\><rsub|n>\<rangle\>\<psi\><rsub|n><around|(|t|)>|\|>\<leq\>
  </equation*>

  <\equation*>
    C<sqrt|\<mu\><around|(|\<bbb-R\>|)>-<big|sum><rsub|n=0><rsup|N><around|\<\|\|\>|p<rsub|n>|\<\|\|\>><rsup|2><rsub|L<rsup|2>*<around|(|d*\<mu\>|)>>>
  </equation*>

  The double limit

  <\equation*>
    lim<rsub|M\<to\>\<infty\>> lim<rsub|N\<to\>\<infty\>>
    <big|sum><rsub|n=0><rsup|N><around|\<langle\>|K<rsub|M>|(>\<cdot\>,s),\<psi\><rsub|n><rsup|M>\<rangle\>\<psi\><rsub|n><rsup|M><around|(|t|)>=K<around|(|t,s|)>
  </equation*>

  converges uniformly by the stability lemma and error bounds.

  <\corollary>
    The convergence rate depends explicitly on the decay of the moments
    <math|\<mu\><rsub|2*n>>.
  </corollary>
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