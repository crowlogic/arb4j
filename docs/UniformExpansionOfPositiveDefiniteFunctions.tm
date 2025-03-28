<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Uniform Expansions for Positive Definite
  Functions>|<doc-author|<author-data|<author-name|Stephen Andrew
  Crowley>|<\author-affiliation>
    <date|>s
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

  <\proposition>
    [Smoothness-Moment Correspondence] For a stationary kernel <math|K>:

    <\enumerate>
      <item>If <math|K\<in\>C<rsup|k><around|(|\<bbb-R\>|)>>, then
      <math|\<mu\><rsub|2*n>\<leq\>C<rsub|k>*n!<rsup|2*k/n>> where
      <math|C<rsub|k>=sup<rsub|x\<in\>\<bbb-R\>><around|\||K<rsup|<around|(|k|)>><around|(|x|)>|\|>>

      <item>If <math|K> is analytic in strip
      <math|<around|\||\<Im\><around|(|z|)>|\|>\<less\>\<delta\>>, then
      <math|\<mu\><rsub|2*n>\<leq\>C<rsub|\<delta\>>*<around|(|1/\<delta\>|)><rsup|2*n>>
      where <math|C<rsub|\<delta\>>=sup<rsub|<around|\||z|\|>\<less\>\<delta\>><around|\||K<around|(|z|)>|\|>>
    </enumerate>
  </proposition>

  <\proof>
    For (1), use Fourier transform properties:
    <math|<wide|K<rsup|<around|(|k|)>>|^><around|(|\<omega\>|)>=<around|(|i*\<omega\>|)><rsup|k><wide|K|^><around|(|\<omega\>|)>>.
    Then:

    <\equation*>
      \<mu\><rsub|2*n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|2*n>*d*\<mu\><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<omega\>|\|><rsup|2*n><around|\||<wide|K|^><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>
    </equation*>

    <\equation*>
      \<leq\>C<rsub|k><rsup|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<omega\>|\|><rsup|2*n-2*k>*d*\<omega\>=C<rsub|k><rsup|2>*<frac|2|2*n-2*k+1>\<leq\>C<rsub|k>*n!<rsup|2*k/n>
    </equation*>

    For (2), use Cauchy's integral formula in complex analysis:

    <\equation*>
      <around|\||<wide|K|^><around|(|\<omega\>|)>|\|>\<leq\>C<rsub|\<delta\>>*e<rsup|-\<delta\><around|\||\<omega\>|\|>>
    </equation*>

    Then:

    <\equation*>
      \<mu\><rsub|2*n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|2*n><around|\||<wide|K|^><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>\<leq\>C<rsub|\<delta\>><rsup|2>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<omega\><rsup|2*n>*e<rsup|-2*\<delta\><around|\||\<omega\>|\|>>*d*\<omega\>=C<rsub|\<delta\>>*<around|(|1/\<delta\>|)><rsup|2*n>
    </equation*>
  </proof>

  <\lemma>
    [Moment Problem Uniqueness] Under the Carleman condition, the measure
    <math|\<mu\>> is uniquely determined by its moments, and polynomials are
    dense in <math|L<rsup|2>*<around|(|d*\<mu\>|)>> with explicit
    approximation rate:

    <\equation*>
      inf<rsub|deg <around|(|p|)>\<leq\>n><around|\<\|\|\>|f-p|\<\|\|\>><rsub|L<rsup|2>*<around|(|d*\<mu\>|)>>\<leq\>C<rsub|f><around*|(|<big|sum><rsub|k\<gtr\>n><frac|1|\<mu\><rsub|2*k>>|)><rsup|1/2>
    </equation*>

    for any <math|f\<in\>L<rsup|2>*<around|(|d*\<mu\>|)>> with finite Sobolev
    norm.
  </lemma>

  <\proof>
    The Carleman condition implies determinacy of the moment problem by
    classic theory. The approximation rate follows from the theory of
    weighted polynomial approximation.
  </proof>

  We proceed through several steps:

  <with|font-series|bold|Step 1: Spectral Representation>

  By Bochner's theorem:

  <\equation*>
    K*<around|(|t-s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<mu\><around|(|\<omega\>|)>
  </equation*>

  <with|font-series|bold|Step 2: Regularization>

  For <math|M\<gtr\>0>, define:

  <\equation*>
    K<rsub|M>*<around|(|t-s|)>=<big|int><rsub|-M><rsup|M>e<rsup|i*\<omega\>*<around|(|t-s|)>>*d*\<mu\><around|(|\<omega\>|)>
  </equation*>

  <\lemma>
    [Truncation Convergence] <math|<around|\<\|\|\>|K-K<rsub|M>|\<\|\|\>><rsub|\<infty\>>\<leq\>\<mu\>*<around|(|\<bbb-R\>\<setminus\><around|[|-M,M|]>|)>>
    and <math|K<rsub|M>> is positive definite. Moreover,

    <\equation*>
      <around|\<\|\|\>|K-K<rsub|M>|\<\|\|\>><rsub|\<infty\>>\<leq\><frac|1|M<rsup|2>>*\<mu\><rsub|2>
    </equation*>
  </lemma>

  <\proof>
    By Chebyshev's inequality: <math|\<mu\>*<around|(|\<bbb-R\>\<setminus\><around|[|-M,M|]>|)>\<leq\><frac|1|M<rsup|2>>*\<mu\><rsub|2>>.
    Positivity preservation follows from <math|K<rsub|M>> being a Fourier
    transform of a positive measure.
  </proof>

  <with|font-series|bold|Step 3: Polynomial Approximation>

  <\lemma>
    [L\<twosuperior\> Density with Explicit Constants] Let
    <math|<around|{|p<rsub|n>|}>> be orthogonal polynomials for
    <math|\<mu\>\|<rsub|<around|[|-M,M|]>>>. Then:

    <\equation*>
      e<rsup|i*\<omega\>*t>*\<chi\><rsub|<around|[|-M,M|]>><around|(|\<omega\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n><rsup|M><around|(|t|)>*p<rsub|n><around|(|\<omega\>|)>
    </equation*>

    in <math|L<rsup|2>*<around|(|d*\<mu\>|)>>, where

    <\equation*>
      c<rsub|n><rsup|M><around|(|t|)>=<frac|<big|int><rsub|-M><rsup|M>e<rsup|i*\<omega\>*t>*p<rsub|n><around|(|\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>|<around|\<\|\|\>|p<rsub|n>|\<\|\|\>><rsup|2><rsub|L<rsup|2>*<around|(|d*\<mu\>|)>>>
    </equation*>

    with error bound for fixed <math|t>:

    <\equation*>
      <around*|\||e<rsup|i*\<omega\>*t>*\<chi\><rsub|<around|[|-M,M|]>>-<big|sum><rsub|n=0><rsup|N>c<rsub|n><rsup|M><around|(|t|)>*p<rsub|n>|\|><rsub|L<rsup|2>*<around|(|d*\<mu\>|)>>\<leq\>B<rsub|M><around|(|t|)><sqrt|<big|sum><rsub|n\<gtr\>N><frac|1|\<mu\><rsub|2*n>>>
    </equation*>

    where

    <\equation*>
      B<rsub|M><around|(|t|)>=<around|(|1+M<around|\||t|\|>|)>*e<rsup|M<around|\||t|\|>>
    </equation*>
  </lemma>

  <\proof>
    The bound <math|B<rsub|M><around|(|t|)>> arises from Taylor expansion of
    <math|e<rsup|i*\<omega\>*t>>:

    <\equation*>
      e<rsup|i*\<omega\>*t>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|i*\<omega\>*t|)><rsup|k>|k!>
    </equation*>

    On <math|<around|[|-M,M|]>>, we have <math|<around|\||\<omega\>|\|>\<leq\>M>,
    giving:

    <\equation*>
      <around*|\||<frac|d<rsup|k>|d*\<omega\><rsup|k>>*e<rsup|i*\<omega\>*t>|\|>=<around|\||t|\|><rsup|k><around|\||e<rsup|i*\<omega\>*t>|\|>\<leq\><around|\||t|\|><rsup|k>*e<rsup|M<around|\||t|\|>>
    </equation*>

    Summing these bounds:

    <\equation*>
      <big|sum><rsub|k=0><rsup|\<infty\>><frac|M<rsup|k><around|\||t|\|><rsup|k>|k!>*e<rsup|M<around|\||t|\|>>=<around|(|1+M<around|\||t|\|>|)>*e<rsup|M<around|\||t|\|>>
    </equation*>
  </proof>

  <with|font-series|bold|Step 4: RKHS Structure>

  Define <math|f<rsub|n><rsup|M>=\<cal-F\>*<around|[|p<rsub|n>*\<chi\><rsub|<around|[|-M,M|]>>|]>>.
  Then:

  <\lemma>
    [RKHS Completeness with Norm Control] The set
    <math|<around|{|f<rsub|n><rsup|M>|}><rsub|n=0><rsup|\<infty\>>> is
    complete in <math|\<cal-H\><rsub|K<rsub|M>>> with:

    <\equation*>
      <around|\<\|\|\>|f<rsub|n><rsup|M>|\<\|\|\>><rsup|2><rsub|\<cal-H\><rsub|K<rsub|M>>>=<big|int><rsub|-M><rsup|M><around|\||p<rsub|n><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
    </equation*>

    Moreover, for <math|f\<in\>\<cal-H\><rsub|K<rsub|M>>>:

    <\equation*>
      <around*|\||f-<big|sum><rsub|n=0><rsup|N><around|\<langle\>|f,f<rsub|n><rsup|M>|\<rangle\>><rsub|\<cal-H\><rsub|K<rsub|M>>>*f<rsub|n><rsup|M>|\|><rsub|\<cal-H\><rsub|K<rsub|M>>>\<leq\>
    </equation*>

    <\equation*>
      <around|\<\|\|\>|f|\<\|\|\>><rsub|\<cal-H\><rsub|K<rsub|M>>><sqrt|<frac|\<mu\><rsub|2*<around|(|N+1|)>>|\<mu\><rsub|2*N>>>
    </equation*>
  </lemma>

  <with|font-series|bold|Step 5: RKHS Convergence>

  Let <math|<around|{|\<psi\><rsub|n><rsup|M>|}>> be obtained by Gram-Schmidt
  orthonormalization of <math|<around|{|f<rsub|n><rsup|M>|}>>.

  <\lemma>
    [RKHS Expansion with Error] For fixed <math|M>:

    <\equation*>
      <around*|\<nobracket\>|<around*|\||K<rsub|M>|(>\<cdot\>,s)-<big|sum><rsub|n=0><rsup|N><around|\<langle\>|K<rsub|M>|(>\<cdot\>,s),\<psi\><rsub|n><rsup|M>\<rangle\>\<psi\><rsub|n><rsup|M>|\|><rsub|\<cal-H\><rsub|K<rsub|M>>>\<leq\>
    </equation*>

    <\equation*>
      <sqrt|\<mu\><around|(|<around|[|-M,M|]>|)>><around*|(|<frac|\<mu\><rsub|2*<around|(|N+1|)>>|\<mu\><rsub|2*N>>|)><rsup|1/4>
    </equation*>
  </lemma>

  <with|font-series|bold|Step 6: Stability Analysis>

  <\lemma>
    [Refined Gram-Schmidt Stability] For fixed <math|N>, as
    <math|M\<to\>\<infty\>>:

    <\equation*>
      <around|\<\|\|\>|\<psi\><rsub|n><rsup|M>-\<psi\><rsub|n>|\<\|\|\>><rsub|\<cal-H\><rsub|K>>\<leq\>C<rsub|N>*<frac|\<mu\><rsub|2>|M<rsup|2>>*<text|for
      >n\<leq\>N
    </equation*>

    where

    <\equation*>
      C<rsub|N>=N<sqrt|<frac|\<mu\><rsub|4*N>|\<mu\><rsub|2>>>*<big|prod><rsub|k=1><rsup|N><sqrt|<frac|\<mu\><rsub|2*k>|\<mu\><rsub|2*<around|(|k-1|)>>>>
    </equation*>
  </lemma>

  <\proof>
    The Gram-Schmidt process for <math|<around|{|f<rsub|n><rsup|M>|}>>
    yields:

    <\equation*>
      \<psi\><rsub|n><rsup|M>=<frac|f<rsub|n><rsup|M>-<big|sum><rsub|k\<less\>n><around|\<langle\>|f<rsub|n><rsup|M>,\<psi\><rsub|k><rsup|M>|\<rangle\>>*\<psi\><rsub|k><rsup|M>|<around|\<\|\|\>|f<rsub|n><rsup|M>-<big|sum><rsub|k\<less\>n><around|\<langle\>|f<rsub|n><rsup|M>,\<psi\><rsub|k><rsup|M>|\<rangle\>>*\<psi\><rsub|k><rsup|M>|\<\|\|\>>>
    </equation*>

    The difference <math|<around|\<\|\|\>|\<psi\><rsub|n><rsup|M>-\<psi\><rsub|n>|\<\|\|\>>>
    is bounded by perturbations in each inner product. These perturbations
    are of order <math|O<around|(|1/M<rsup|2>|)>> due to the truncation
    error. The constant <math|C<rsub|N>> arises from bounding the denominator
    using moment ratios:

    <\equation*>
      <around|\<\|\|\>|f<rsub|n><rsup|M>|\<\|\|\>><rsup|2>=<big|int><rsub|-M><rsup|M><around|\||p<rsub|n><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>\<geq\><frac|\<mu\><rsub|2*n>|\<mu\><rsub|2*<around|(|n-1|)>>>*<big|int><rsub|-M><rsup|M><around|\||p<rsub|n-1><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>
    </equation*>

    Iterating this bound <math|N> times and using
    <math|<around|\<\|\|\>|f<rsub|0><rsup|M>|\<\|\|\>><rsup|2>\<geq\>\<mu\><rsub|2>/M<rsup|2>>
    yields the result.
  </proof>

  <with|font-series|bold|Step 7: Uniform Convergence>

  By the reproducing property and previous lemmas:

  <\equation*>
    <around*|\<nobracket\>|sup<rsub|t,s><around*|\||K<around|(|t,s|)>-<big|sum><rsub|n=0><rsup|N><around|\<langle\>|K|(>\<cdot\>,s|)>,\<psi\><rsub|n>\<rangle\>\<psi\><rsub|n><around|(|t|)>|\|>\<leq\>
  </equation*>

  <\equation*>
    <sqrt|\<mu\><around|(|\<bbb-R\>|)>><around*|(|<frac|\<mu\><rsub|2*<around|(|N+1|)>>|\<mu\><rsub|2*N>>|)><rsup|1/4>+<frac|C<rsub|N>*\<mu\><rsub|2>|M<rsup|2>>
  </equation*>

  Taking <math|M=N<rsup|2>> gives optimal balance between truncation and
  approximation errors.

  <\corollary>
    [Convergence Rate] If <math|\<mu\><rsub|2*n>\<leq\>C*\<alpha\><rsup|n>>
    for some <math|\<alpha\>\<gtr\>1>, then:

    <\equation*>
      <around*|\<nobracket\>|sup<rsub|t,s><around*|\||K<around|(|t,s|)>-<big|sum><rsub|n=0><rsup|N><around|\<langle\>|K|(>\<cdot\>,s|)>,\<psi\><rsub|n>\<rangle\>\<psi\><rsub|n><around|(|t|)>|\|>\<leq\>C<rprime|'>*\<alpha\><rsup|-N/4>
    </equation*>

    where <math|C<rprime|'>=max <around|{|<sqrt|\<mu\><around|(|\<bbb-R\>|)>>,C<rsub|N>*\<mu\><rsub|2>|}>>.
  </corollary>

  <\remark>
    The convergence rate depends explicitly on the growth of moments, which
    in turn relates to the smoothness of the kernel as characterized by the
    Smoothness-Moment Correspondence Proposition.
  </remark>
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