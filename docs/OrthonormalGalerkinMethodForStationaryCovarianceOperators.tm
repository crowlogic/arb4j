<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Eigenfunction Expansion for Translation-Invariant
  Kernels via Galerkin Method>|<doc-author|<author-data|<author-name|Stephen
  Andrew Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <\definition>
    For a translation-invariant kernel <math|K*<around|(|x-y|)>> on
    <math|\<bbb-R\><rsup|d>>, its Gram matrix <math|A> with respect to a
    uniformly convergent orthonormal basis
    <math|<around|{|\<psi\><rsub|j>|}><rsub|j=1><rsup|\<infty\>>> is:

    <\equation*>
      A<rsub|i*j>=<big|int><rsub|\<bbb-R\><rsup|d>>\<psi\><rsub|i>*<around|(|x-y|)>*\<psi\><rsub|j><around|(|y|)>*d*y
    </equation*>
  </definition>

  <\theorem>
    The Gram matrix <math|A> can be expressed in terms of Fourier transforms:

    <\equation*>
      A<rsub|i*j>=\<cal-F\><rsup|-1>*<around|[|\<cal-F\><around|[|\<psi\><rsub|i>|]><rsup|\<ast\>>\<cdot\>\<cal-F\><around|[|\<psi\><rsub|j>|]>|]>
    </equation*>

    where <math|\<cal-F\>> denotes the Fourier transform,
    <math|\<cal-F\><rsup|-1>> the inverse Fourier transform, and
    <rsup|<math|\<ast\>>> the complex conjugate.
  </theorem>

  <\proof>
    By the convolution theorem and Parseval's identity:

    <\align*>
      <tformat|<table|<row|<cell|A<rsub|i*j>>|<cell|=<big|int><rsub|\<bbb-R\><rsup|d>>\<psi\><rsub|i>*<around|(|x-y|)>*\<psi\><rsub|j><around|(|y|)>*d*y>>|<row|<cell|>|<cell|=<around|(|\<psi\><rsub|i>\<ast\>\<psi\><rsub|j>|)><around|(|x|)>>>|<row|<cell|>|<cell|=\<cal-F\><rsup|-1>*<around|[|\<cal-F\><around|[|\<psi\><rsub|i>|]>\<cdot\>\<cal-F\><around|[|\<psi\><rsub|j>|]>|]>>>|<row|<cell|>|<cell|=\<cal-F\><rsup|-1>*<around|[|\<cal-F\><around|[|\<psi\><rsub|i>|]><rsup|\<ast\>>\<cdot\>\<cal-F\><around|[|\<psi\><rsub|j>|]>|]>>>>>
    </align*>

    The last step follows from the fact that <math|\<psi\><rsub|i>> is
    real-valued, so <math|\<cal-F\><around|[|\<psi\><rsub|i>|]>=\<cal-F\><around|[|\<psi\><rsub|i>|]><rsup|\<ast\>>>.
  </proof>

  <\theorem>
    For a kernel <math|K*<around|(|x-y|)>=<big|sum><rsub|j=1><rsup|\<infty\>>a<rsub|j>*\<psi\><rsub|j>*<around|(|x-y|)>>,
    the eigenfunctions <math|\<phi\><rsub|k>> and their corresponding
    eigenvalues <math|\<lambda\><rsub|k>> are given by:

    <\equation*>
      \<phi\><rsub|k><around|(|x|)>=<big|sum><rsub|j=1><rsup|\<infty\>>b<rsub|k*j>*\<psi\><rsub|j><around|(|x|)>
    </equation*>

    where the coefficients <math|b<rsub|k*j>> satisfy:

    <\equation*>
      <big|sum><rsub|j=1><rsup|\<infty\>>a<rsub|i>*A<rsub|i*j>*b<rsub|k*j>=\<lambda\><rsub|k>*b<rsub|k*i>*<space|1em><text|for
      all >i
    </equation*>
  </theorem>

  <\proof>
    Let <math|\<phi\><rsub|k><around|(|x|)>=<big|sum><rsub|j=1><rsup|\<infty\>>b<rsub|k*j>*\<psi\><rsub|j><around|(|x|)>>
    be an eigenfunction of <math|K>. Then:

    <\align*>
      <tformat|<table|<row|<cell|\<lambda\><rsub|k>*\<phi\><rsub|k><around|(|x|)>>|<cell|=<big|int>K*<around|(|x-y|)>*\<phi\><rsub|k><around|(|y|)>*d*y>>|<row|<cell|>|<cell|=<big|int><around*|(|<big|sum><rsub|i=1><rsup|\<infty\>>a<rsub|i>*\<psi\><rsub|i>*<around|(|x-y|)>|)><around*|(|<big|sum><rsub|j=1><rsup|\<infty\>>b<rsub|k*j>*\<psi\><rsub|j><around|(|y|)>|)>*d*y>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>><big|sum><rsub|j=1><rsup|\<infty\>>a<rsub|i>*b<rsub|k*j>*<big|int>\<psi\><rsub|i>*<around|(|x-y|)>*\<psi\><rsub|j><around|(|y|)>*d*y>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>><big|sum><rsub|j=1><rsup|\<infty\>>a<rsub|i>*b<rsub|k*j>*A<rsub|i*j>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|\<infty\>>a<rsub|i><around*|(|<big|sum><rsub|j=1><rsup|\<infty\>>A<rsub|i*j>*b<rsub|k*j>|)>>>>>
    </align*>

    Equating coefficients of <math|\<psi\><rsub|i><around|(|x|)>> on both
    sides:

    <\equation*>
      \<lambda\><rsub|k>*b<rsub|k*i>=a<rsub|i>*<big|sum><rsub|j=1><rsup|\<infty\>>A<rsub|i*j>*b<rsub|k*j>
    </equation*>

    This is equivalent to the equation:

    <\equation*>
      <big|sum><rsub|j=1><rsup|\<infty\>>a<rsub|i>*A<rsub|i*j>*b<rsub|k*j>=\<lambda\><rsub|k>*b<rsub|k*i>*<space|1em><text|for
      all >i
    </equation*>

    Thus, the eigenfunctions are given by the solutions of this equation
    system.
  </proof>

  <\theorem>
    The nth eigenfunction <math|\<phi\><rsub|n><around|(|x|)>> of the kernel
    <math|K*<around|(|x-y|)>=<big|sum><rsub|j=1><rsup|\<infty\>>a<rsub|j>*\<psi\><rsub|j>*<around|(|x-y|)>>
    is given by:

    <\equation*>
      \<phi\><rsub|n><around|(|x|)>=<big|sum><rsub|j=1><rsup|\<infty\>>b<rsub|n*j>*\<psi\><rsub|j><around|(|x|)>
    </equation*>

    where the coefficients <math|b<rsub|n*j>> satisfy:

    <\equation*>
      <big|sum><rsub|j=1><rsup|\<infty\>>a<rsub|i>*A<rsub|i*j>*b<rsub|n*j>=\<lambda\><rsub|n>*b<rsub|n*i>*<space|1em><text|for
      all >i
    </equation*>
  </theorem>
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