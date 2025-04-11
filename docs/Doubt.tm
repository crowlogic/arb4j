<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  \;

  <\theorem>
    [RKHS Basis via Convolution] Let <math|<around|{|\<phi\><rsub|i>|}>> be
    an orthonormal basis for <math|L<rsup|2><around|(|\<bbb-R\>|)>> and
    <math|h<around|(|t|)>=\<cal-F\><rsup|-1><around|{|<sqrt|S<around|(|\<omega\>|)>>|}><around|(|t|)>>.
    Define:

    <\equation*>
      \<psi\><rsub|i><around|(|t|)>=<around|(|h\<ast\>\<phi\><rsub|i>|)><around|(|t|)>
    </equation*>

    Then <math|<around|{|\<psi\><rsub|i>|}>> forms an orthonormal basis for
    the RKHS <math|\<cal-H\><rsub|K>> with kernel
    <math|K<around|(|s,t|)>=<around|(|h\<ast\>h|)>*<around|(|s-t|)>>.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Orthonormality><next-line>For
    <math|i\<neq\>j>:

    <\equation*>
      <around|\<langle\>|\<psi\><rsub|i>,\<psi\><rsub|j>|\<rangle\>><rsub|\<cal-H\><rsub|K>>=<around|\<langle\>|h\<ast\>\<phi\><rsub|i>,h\<ast\>\<phi\><rsub|j>|\<rangle\>><rsub|\<cal-H\><rsub|K>>=<around|\<langle\>|\<phi\><rsub|i>,\<phi\><rsub|j>|\<rangle\>><rsub|L<rsup|2>>=0
    </equation*>

    For <math|i=j>:

    <\equation*>
      <around|\<langle\>|\<psi\><rsub|i>,\<psi\><rsub|i>|\<rangle\>><rsub|\<cal-H\><rsub|K>>=<around|\<\|\|\>|\<phi\><rsub|i>|\<\|\|\>><rsub|L<rsup|2>><rsup|2>=1
    </equation*>

    <with|font-series|bold|Step 2: Completeness><next-line>For any
    <math|f\<in\>\<cal-H\><rsub|K>>, write <math|f=h\<ast\>g> where
    <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>. Since
    <math|<around|{|\<phi\><rsub|i>|}>> is complete:

    <\equation*>
      g=<big|sum><rsub|i=1><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|i>|\<rangle\>><rsub|L<rsup|2>>*\<phi\><rsub|i>\<Longrightarrow\>f=<big|sum><rsub|i=1><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|i>|\<rangle\>><rsub|L<rsup|2>>*<around|(|h\<ast\>\<phi\><rsub|i>|)>=<big|sum><rsub|i=1><rsup|\<infty\>><around|\<langle\>|f,\<psi\><rsub|i>|\<rangle\>><rsub|\<cal-H\><rsub|K>>*\<psi\><rsub|i>
    </equation*>
  </proof>

  <\theorem>
    [Eigenfunctions of Covariance Operator] The functions
    <math|<around|{|\<psi\><rsub|i>|}>> are eigenfunctions of the integral
    operator <math|T<rsub|K>> with eigenvalues:

    <\equation*>
      \<lambda\><rsub|i>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)><around|\||<wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>
    </equation*>
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Spectral Representation><next-line>The
    operator acts as:

    <\equation*>
      <around|(|T<rsub|K>*\<psi\><rsub|i>|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*\<psi\><rsub|i><around|(|s|)>*d*s=<around|(|K\<ast\>\<psi\><rsub|i>|)><around|(|t|)>
    </equation*>

    <with|font-series|bold|Step 2: Frequency Domain Analysis><next-line>Using
    <math|<wide|K|^><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>> and
    <math|<wide|\<psi\>|^><rsub|i><around|(|\<omega\>|)>=<sqrt|S<around|(|\<omega\>|)>>*<wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>>:

    <\equation*>
      \<cal-F\>*<around|{|T<rsub|K>*\<psi\><rsub|i>|}><around|(|\<omega\>|)>=S<around|(|\<omega\>|)><sqrt|S<around|(|\<omega\>|)>>*<wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>=\<lambda\><rsub|i>*<sqrt|S<around|(|\<omega\>|)>>*<wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>=\<lambda\><rsub|i>*\<cal-F\><around|{|\<psi\><rsub|i>|}><around|(|\<omega\>|)>
    </equation*>

    Thus <math|T<rsub|K>*\<psi\><rsub|i>=\<lambda\><rsub|i>*\<psi\><rsub|i>>
    where:

    <\equation*>
      \<lambda\><rsub|i>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)><around|\||<wide|\<phi\>|^><rsub|i><around|(|\<omega\>|)>|\|><rsup|2>*d*\<omega\>*<space|1em>\<square\>
    </equation*>
  </proof>

  <\theorem>
    [Uniform Convergence of Kernel Expansion] The kernel expansion:

    <\equation*>
      K<around|(|s,t|)>=<big|sum><rsub|i=1><rsup|\<infty\>>\<lambda\><rsub|i>*\<psi\><rsub|i><around|(|s|)>*\<psi\><rsub|i><around|(|t|)>
    </equation*>

    converges uniformly over <math|\<bbb-R\>\<times\>\<bbb-R\>>.
  </theorem>

  <\proof>
    Given <math|K<around|(|s,t|)>=<around|(|h\<ast\>h|)>*<around|(|s-t|)>>,
    use the Fourier transform:

    <\equation*>
      K<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*<around|(|s-t|)>>*d*\<omega\>=<big|sum><rsub|i=1><rsup|\<infty\>>\<lambda\><rsub|i>*\<psi\><rsub|i><around|(|s|)>*\<psi\><rsub|i><around|(|t|)>
    </equation*>

    Uniform convergence follows because the spectral density
    <math|S<around|(|\<omega\>|)>> is integrable
    (<math|<big|int>S<around|(|\<omega\>|)>*d*\<omega\>=K<around|(|0|)>\<less\>\<infty\>>)
    and the series represents a Fourier integral converging absolutely.
  </proof>
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