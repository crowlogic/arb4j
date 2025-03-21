<TeXmacs|2.1.2>

<style|<tuple|article|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Compact Self-Adjoint Integral Covariance<line-break>
  Operators on <math|L<rsup|2><around|[|0,\<infty\>|)>>>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <abstract-data|<abstract|The spectral theory of compact self-adjoint
  integral operators on <math|L<rsup|2><around|[|0,\<infty\>|)>> is applied
  to extend Mercer's theorem, which is relegated to bounded(compact)
  intervals to the non-compact (unbounded) semi-infinite interval
  <math|<around|[|0,\<infty\>|)>>, focusing on eigenfunction expansions and
  norm bounds. For operators with kernels <math|K<around|(|z,w|)>>
  represented as Mercer expansions, which are infinite series of
  eigenfunction products, the main result establishes the operator norm bound
  <math|<around|\<\|\|\>|T<rsub|K>-T<rsub|K<rsub|N>>|\<\|\|\>>\<leq\><around|\||\<lambda\><rsub|N+1>|\|>>
  for the integral covariance operator <math|<around*|(|T
  f|)><around*|(|y|)>=<big|int><rsub|0><rsup|\<infty\>>K<around*|(|x,y|)>f<around*|(|x|)>\<mathd\>x>
  derived using orthogonal projection methods. An extension of Mercer's
  Theorem to the semi-infinite interval <math|<around|[|0,\<infty\>|)>>
  demonstrates that it is the the compactness of the operator relative to the
  induced canonical metric(square root of the variance structure function
  which is in one-to-one correspondence with the covariance kernel function
  <math|K> in the case of real-valued processes), rather than the domain,
  underpins these results. Furthermore, the completeness of the eigenfunction
  system is proven through the spectral properties of compact self-adjoint
  operators. These findings provide a refined understanding of integral
  covariance operators operators on <math|L<rsup|2><around|[|0,\<infty\>|)>>
  and their finite-dimensional subspaces.>>

  <\theorem>
    Let <math|T<rsub|K>> be a compact self-adjoint integral covariance
    operator on <math|L<rsup|2><around|[|0,\<infty\>|)>>\ 

    <\equation>
      <around|(|T<rsub|K>*f|)><around|(|z|)>=<big|int><rsub|0><rsup|\<infty\>>K<around|(|z,w|)>*f<around|(|w|)>*d*w
    </equation>

    defined by kernel <math|K>:

    <\equation*>
      K<around*|(|z,w|)>=<big|sum><rsub|k=0><rsup|\<infty\>>\<lambda\><rsub|k>\<phi\><rsub|k><around*|(|z|)>\<phi\><rsub|k><around*|(|w|)>
    </equation*>

    where <math|<around|{|\<phi\><rsub|n>|}><rsub|n=0><rsup|\<infty\>>> is a
    sequence of orthonormal eigenfunctions in
    <math|L<rsup|2><around|[|0,\<infty\>|)>> and the corresponding
    eigenvalues \ <math|<around|{|\<lambda\><rsub|n>|}><rsub|n=0><rsup|\<infty\>>>
    which are ordered by decreasing magnitude

    <\equation>
      <around|\||\<lambda\><rsub|n+1>|\|>\<less\><around|\||\<lambda\><rsub|n>|\|>\<forall\>n
    </equation>

    satisfy the eigenfunction equations

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|(|T<rsub|K>*\<phi\><rsub|n>|)><around|(|z|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>K<around|(|z,w|)>*\<phi\><rsub|n><around*|(|w|)>*d*w>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around*|(|<big|sum><rsub|k=0><rsup|\<infty\>>\<lambda\><rsub|k>\<phi\><rsub|k><around*|(|z|)>\<phi\><rsub|k><around*|(|w|)>|)>*\<phi\><rsub|n><around*|(|w|)>*d*w>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|n><around*|(|w|)>*<around*|(|<big|sum><rsub|k=0><rsup|\<infty\>>\<lambda\><rsub|k>\<phi\><rsub|k><around*|(|z|)>\<phi\><rsub|k><around*|(|w|)>|)>*d*w>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>*\<phi\><rsub|n><around*|(|w|)><big|sum><rsub|k=0><rsup|\<infty\>>\<lambda\><rsub|k>\<phi\><rsub|k><around*|(|z|)>\<phi\><rsub|k><around*|(|w|)>*d*w>>|<row|<cell|>|<cell|=*<big|sum><rsub|k=0><rsup|\<infty\>>\<phi\><rsub|n><around*|(|w|)><big|int><rsub|0><rsup|\<infty\>>\<lambda\><rsub|k>\<phi\><rsub|k><around*|(|z|)>\<phi\><rsub|k><around*|(|w|)>*d*w>>|<row|<cell|>|<cell|=*<big|sum><rsub|k=0><rsup|\<infty\>>\<phi\><rsub|k><around*|(|z|)>\<lambda\><rsub|k><big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|n><around*|(|w|)>\<phi\><rsub|k><around*|(|w|)>*d*w>>|<row|<cell|>|<cell|=*<big|sum><rsub|k=0><rsup|\<infty\>>\<phi\><rsub|k><around*|(|z|)>\<lambda\><rsub|k>\<delta\><rsub|n,k>>>|<row|<cell|>|<cell|=
      \<phi\><rsub|n><around*|(|z|)> \<lambda\><rsub|n>>>>>>
    </equation>

    Let <math|T<rsub|K<rsub|N>>> be the truncated operator with kernel

    <\equation>
      K<rsub|N><around|(|z,w|)>=<big|sum><rsub|n=0><rsup|N>\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|z|)>*\<phi\><rsub|n><around|(|w|)>
    </equation>

    then:

    <\equation>
      <around|\<\|\|\>|T<rsub|K>-T<rsub|K<rsub|N>>|\<\|\|\>>\<leq\><around|\||\<lambda\><rsub|N+1>|\|>
    </equation>
  </theorem>

  <\proof>
    Let

    <\equation>
      <around*|(|E<rsub|N> f|)><around*|(|z|)>=<around|(|T<rsub|K>*f|)><around|(|z|)>-<around|(|T<rsub|K<rsub|N>>*f|)><around|(|z|)>
    </equation>

    \ be the difference <math|T<rsub|K>-T<rsub|K<rsub|N>>> then let

    <\equation>
      f=g+h\<forall\>f\<in\>L<rsup|2><around|[|0,\<infty\>|)>
    </equation>

    \ where\ 

    <\equation>
      g<around*|(|x|)>=<big|sum><rsub|k=0><rsup|N><around|\<langle\>|f,\<phi\><rsub|k>|\<rangle\>>*\<phi\><rsub|k><around*|(|x|)>\<forall\>g\<in\><text|span><around|{|\<phi\><rsub|k>|}><rsub|k\<leq\>N>
    </equation>

    \ and

    <\equation>
      h<around*|(|x|)>=<big|sum><rsub|k=N+1><rsup|\<infty\>><around|\<langle\>|f,\<phi\><rsub|k>|\<rangle\>>*\<phi\><rsub|k><around*|(|x|)>\<forall\>h\<in\><text|span><around|{|\<phi\><rsub|k>|}><rsub|k\<gtr\>N>
    </equation>

    where by orthogonality of <math|g> and <math|h> (which follows from the
    orthogonality of eigenfunctions <math|\<varphi\><rsub|k>>)

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|<around|\<langle\>|g,h|\<rangle\>>>|<cell|=<around*|\<langle\>|<big|sum><rsub|k=0><rsup|N><around|\<langle\>|f,\<phi\><rsub|k>|\<rangle\>>*\<phi\><rsub|k>,<big|sum><rsub|j=N+1><rsup|\<infty\>><around|\<langle\>|f,\<phi\><rsub|j>|\<rangle\>>*\<phi\><rsub|j>|\<rangle\>>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|N><big|sum><rsub|j=N+1><rsup|\<infty\>><around|\<langle\>|f,\<phi\><rsub|k>|\<rangle\>><around|\<langle\>|f,\<phi\><rsub|j>|\<rangle\>><around|\<langle\>|\<phi\><rsub|k>,\<phi\><rsub|j>|\<rangle\>>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|N><big|sum><rsub|j=N+1><rsup|\<infty\>><around|\<langle\>|f,\<phi\><rsub|k>|\<rangle\>><around|\<langle\>|f,\<phi\><rsub|j>|\<rangle\>>*\<delta\><rsub|k,j>>>|<row|<cell|>|<cell|=0>>>>>
    </equation>

    we have

    <\equation>
      <around|\<\|\|\>|E<rsub|N>*f|\<\|\|\>><rsup|2>=<around|\<langle\>|E<rsub|N>*f,E<rsub|N>*f|\<rangle\>>=<around|\<langle\>|E<rsub|N>*h,h|\<rangle\>>
    </equation>

    since

    <\equation>
      <tformat|<table|<row|<cell|<around|(|E<rsub|N>*g|)><around|(|x|)>>|<cell|=<around*|(|E<rsub|N>*<big|sum><rsub|k=0><rsup|N><around|\<langle\>|f,\<phi\><rsub|k>|\<rangle\>>*\<phi\><rsub|k>|)><around|(|x|)>>>|<row|<cell|>|<cell|=<around|(|T<rsub|K>*g|)><around|(|x|)>-<around|(|T<rsub|K<rsub|N>>*g|)><around|(|x|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=0><rsup|N>\<lambda\><rsub|k><around|\<langle\>|f,\<phi\><rsub|k>|\<rangle\>>*\<phi\><rsub|k><around|(|z|)>-<big|sum><rsub|k=0><rsup|N>\<lambda\><rsub|k><around|\<langle\>|f,\<phi\><rsub|k>|\<rangle\>>*\<phi\><rsub|k><around|(|z|)>>>|<row|<cell|>|<cell|=0>>>>
    </equation>

    \ by construction and since <math|h> is orthogonal to the first N
    eigenfunctions and along with the fact that the eigenvalues are ordered
    by decreasing magnitude

    <\equation>
      <around|\||\<lambda\><rsub|k>|\|>\<leq\><around|\||\<lambda\><rsub|N+1>|\|>\<forall\>k\<gtr\>N
    </equation>

    we have

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\||<around|\<langle\>|E<rsub|N>*h,h|\<rangle\>>|\|>>|<cell|\<leq\><around|\||\<lambda\><rsub|N+1>|\|><around|\<\|\|\>|h|\<\|\|\>><rsup|2>>>|<row|<cell|>|<cell|\<leq\><around|\||\<lambda\><rsub|N+1>|\|><around|\<\|\|\>|f|\<\|\|\>><rsup|2>>>>>>
    </equation>

    Therefore:

    <\equation>
      <around|\<\|\|\>|E<rsub|N>|\<\|\|\>>\<leq\><around|\||\<lambda\><rsub|N+1>|\|>
    </equation>
  </proof>

  <\remark>
    This extension of Mercer's Theorem to <math|<around|[|0,\<infty\>|)>>
    reveals a deeper truth about integral operators that is obscured in most
    presentations. The key insight is that compactness of the interval plays
    no essential role - what matters is the compactness of the operator
    itself.

    The traditional presentation of Mercers theorem on compact
    <math|<around|[|a,b|]>> emphasize properties that are merely convenient
    rather than fundamental:

    <\itemize>
      <item>Compactness of <math|<around|[|a,b|]>> provides easy continuity
      arguments

      <item>Finite measure simplifies certain technical steps

      <item>Historical development focused on these cases first
    </itemize>

    However, the proof above shows that the essential structure depends only
    on:

    <\enumerate>
      <item>The spectral properties of compact self-adjoint operators

      <item>The precise operator norm bound
      <math|<around|\<\|\|\>|E<rsub|N>|\<\|\|\>>\<leq\><around|\||\<lambda\><rsub|N+1>|\|>>

      <item>The fact that <math|<around|{|\<lambda\><rsub|n>|}><rsub|n=1><rsup|\<infty\>>>
      converges to zero
    </enumerate>

    This reveals that Mercer's Theorem is fundamentally about the behavior of
    integral operators themselves, not about properties of their domains. The
    extension to <math|<around|[|0,\<infty\>|)>> is not just a generalization
    - it's a clearer view of the true mathematical structure.
  </remark>

  <\theorem>
    <dueto|Completeness>Let <math|T<rsub|K>> be a compact self-adjoint
    integral operator on <math|L<rsup|2><around|[|0,\<infty\>|)>> with kernel
    <math|K<around|(|z,w|)>>. Then the eigenfunctions
    <math|<around|{|\<phi\><rsub|n>|}><rsub|n=0><rsup|\<infty\>>> form a
    complete orthonormal system in <math|L<rsup|2><around|[|0,\<infty\>|)>>.
  </theorem>

  <\proof>
    Suppose there exists <math|f\<in\>L<rsup|2><around|[|0,\<infty\>|)>>
    orthogonal to all <math|\<phi\><rsub|n>>. Then:

    <\equation>
      <around|\<langle\>|f,\<phi\><rsub|n>|\<rangle\>>=0<space|1em>\<forall\>n
    </equation>

    Therefore:

    <\equation>
      T<rsub|K>*f=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n><around|\<langle\>|f,\<phi\><rsub|n>|\<rangle\>>*\<phi\><rsub|n>=0
    </equation>

    Since <math|T<rsub|K>> is compact and self-adjoint,
    ker<math|<around|(|T<rsub|K>|)><rsup|\<perp\>>> =
    <math|<wide|<text|range><around|(|T<rsub|K>|)>|\<bar\>>> contains all
    eigenvectors. Thus <math|f> must be zero, proving completeness.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-screen-margin|true>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>