<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunctions in RKHS with Specific Orthonormal
  Basis>|<doc-date|>>

  <\theorem>
    Let <math|K*<around|(|t-s|)>> be a stationary positive definite kernel
    with spectral density <math|S<around|(|\<omega\>|)>>, and let
    <math|h<around|(|t|)>=\<cal-F\><rsup|-1><around|{|<sqrt|S<around|(|\<omega\>|)>>|}><around|(|t|)>>.
    Let <math|<around|{|\<phi\><rsub|i>|}>> be an orthonormal basis for
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> such that:

    <\equation*>
      K<around|(|t|)>=<big|sum><rsub|i=0><rsup|\<infty\>><around|\<langle\>|K,\<phi\><rsub|i>|\<rangle\>>*\<phi\><rsub|i><around|(|t|)>,
    </equation*>

    with uniform convergence on <math|\<bbb-R\>>. Then:

    <\enumerate>
      <item><math|\<psi\><rsub|i><around|(|t|)>=<around|(|h\<ast\>\<phi\><rsub|i>|)><around|(|t|)>>
      form an orthonormal basis for the RKHS <math|\<cal-H\><rsub|K>>.

      <item><math|\<psi\><rsub|i>> are eigenfunctions of the integral
      operator <math|T<rsub|K>> with eigenvalues
      <math|\<lambda\><rsub|i>=<around|\<langle\>|K,\<phi\><rsub|i>|\<rangle\>>>.
    </enumerate>
  </theorem>

  <\proof>
    <with|font-series|bold|1. Orthonormality and completeness of
    <math|<around|{|\<psi\><rsub|i>|}>> in <math|\<cal-H\><rsub|K>>:> The
    RKHS <math|\<cal-H\><rsub|K>> is isometrically isomorphic to
    <math|L<rsup|2><around|(|\<bbb-R\>|)>> under <math|g\<mapsto\>h\<ast\>g>,
    with inner product:

    <\equation*>
      <around|\<langle\>|f,g|\<rangle\>><rsub|\<cal-H\><rsub|K>>=<around|\<langle\>|h<rsup|-1>\<ast\>f,h<rsup|-1>\<ast\>g|\<rangle\>><rsub|L<rsup|2>>.
    </equation*>

    For <math|\<psi\><rsub|i>=h\<ast\>\<phi\><rsub|i>>, we have:

    <\equation*>
      <around|\<langle\>|\<psi\><rsub|i>,\<psi\><rsub|j>|\<rangle\>><rsub|\<cal-H\><rsub|K>>=<around|\<langle\>|\<phi\><rsub|i>,\<phi\><rsub|j>|\<rangle\>><rsub|L<rsup|2>>=\<delta\><rsub|i*j>.
    </equation*>

    Completeness follows as any <math|f\<in\>\<cal-H\><rsub|K>> can be
    written as <math|f=h\<ast\>g> for <math|g\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>:

    <\equation*>
      g=<big|sum><rsub|i=0><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|i>|\<rangle\>>*\<phi\><rsub|i>\<Longrightarrow\>f=<big|sum><rsub|i=0><rsup|\<infty\>><around|\<langle\>|g,\<phi\><rsub|i>|\<rangle\>>*<around|(|h\<ast\>\<phi\><rsub|i>|)>=<big|sum><rsub|i=0><rsup|\<infty\>><around|\<langle\>|f,\<psi\><rsub|i>|\<rangle\>><rsub|\<cal-H\><rsub|K>>*\<psi\><rsub|i>.
    </equation*>

    <with|font-series|bold|2. Eigenfunction Property of
    <math|\<psi\><rsub|i>>:> The integral operator <math|T<rsub|K>> is
    defined as:

    <\equation*>
      <around|(|T<rsub|K>*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K*<around|(|t-s|)>*f<around|(|s|)>*d*s=<around|(|K\<ast\>f|)><around|(|t|)>.
    </equation*>

    Using the kernel's expansion <math|K=<big|sum><rsub|i=0><rsup|\<infty\>>\<lambda\><rsub|i>*\<phi\><rsub|i>>
    where <math|\<lambda\><rsub|i>=<around|\<langle\>|K,\<phi\><rsub|i>|\<rangle\>>>,
    we have:

    <\equation*>
      T<rsub|K>*\<psi\><rsub|j>=K\<ast\><around|(|h\<ast\>\<phi\><rsub|j>|)>=<around|(|K\<ast\>h|)>\<ast\>\<phi\><rsub|j>.
    </equation*>

    The spectral factorization gives <math|K=h\<ast\>h<rsup|\<ast\>>>.
    Crucially, the uniform convergence hypothesis ensures that convolution
    with <math|K> commutes with the basis decomposition:

    <\equation*>
      K\<ast\>\<phi\><rsub|j>=<big|sum><rsub|i=0><rsup|\<infty\>>\<lambda\><rsub|i>*<around|\<langle\>|\<phi\><rsub|j>,\<phi\><rsub|i>|\<rangle\>>*\<phi\><rsub|i>=\<lambda\><rsub|j>*\<phi\><rsub|j>.
    </equation*>

    Therefore:

    <\equation*>
      T<rsub|K>*\<psi\><rsub|j>=h\<ast\><around|(|K\<ast\>\<phi\><rsub|j>|)>=h\<ast\><around|(|\<lambda\><rsub|j>*\<phi\><rsub|j>|)>=\<lambda\><rsub|j>*<around|(|h\<ast\>\<phi\><rsub|j>|)>=\<lambda\><rsub|j>*\<psi\><rsub|j>.
    </equation*>

    This confirms <math|\<psi\><rsub|j>> are eigenfunctions of
    <math|T<rsub|K>> with eigenvalues <math|\<lambda\><rsub|j>>.
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