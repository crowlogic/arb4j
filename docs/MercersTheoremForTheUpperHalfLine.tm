<TeXmacs|2.1.2>

<style|<tuple|article|boring-white|framed-theorems>>

<\body>
  \;

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
    <math|L<rsup|2><around|[|0,\<infty\>|)>> and
    <math|<around|{|\<lambda\><rsub|n>|}><rsub|n=0><rsup|\<infty\>>> the
    corresponding eigenvalues ordered by decreasing magnitude

    <\equation>
      <around|\||\<lambda\><rsub|n+1>|\|>\<less\><around|\||\<lambda\><rsub|n>|\|>\<forall\>n
    </equation>

    satisfy the eigenfunction equations

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|(|T<rsub|K>*\<phi\><rsub|n>|)><around|(|z|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>K<around|(|z,w|)>*\<phi\><rsub|n><around*|(|w|)>*d*w>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><around*|(|<big|sum><rsub|k=0><rsup|\<infty\>>\<lambda\><rsub|k>\<phi\><rsub|k><around*|(|z|)>\<phi\><rsub|k><around*|(|w|)>|)>*\<phi\><rsub|n><around*|(|w|)>*d*w>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|n><around*|(|w|)>*<around*|(|<big|sum><rsub|k=0><rsup|\<infty\>>\<lambda\><rsub|k>\<phi\><rsub|k><around*|(|z|)>\<phi\><rsub|k><around*|(|w|)>|)>*d*w>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>*<big|sum><rsub|k=0><rsup|\<infty\>>\<phi\><rsub|n><around*|(|w|)>\<lambda\><rsub|k>\<phi\><rsub|k><around*|(|z|)>\<phi\><rsub|k><around*|(|w|)>*d*w>>|<row|<cell|>|<cell|=*<big|sum><rsub|k=0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|n><around*|(|w|)>\<lambda\><rsub|k>\<phi\><rsub|k><around*|(|z|)>\<phi\><rsub|k><around*|(|w|)>*d*w>>|<row|<cell|>|<cell|=*<big|sum><rsub|k=0><rsup|\<infty\>>\<phi\><rsub|k><around*|(|z|)>\<lambda\><rsub|k><big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|n><around*|(|w|)>\<phi\><rsub|k><around*|(|w|)>*d*w>>|<row|<cell|>|<cell|=*<big|sum><rsub|k=0><rsup|\<infty\>>\<phi\><rsub|k><around*|(|z|)>\<lambda\><rsub|k>\<delta\><rsub|n,k>>>|<row|<cell|>|<cell|=
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
    Let <math|E<rsub|N>> be the difference
    <math|T<rsub|K>-T<rsub|K<rsub|N>>>. For any
    <math|f\<in\>L<rsup|2><around|[|0,\<infty\>|)>>:

    Let <math|f=g+h> where <math|g\<in\><text|span><around|{|\<phi\><rsub|k>|}><rsub|k\<leq\>N>>
    and <math|h\<in\><text|span><around|{|\<phi\><rsub|k>|}><rsub|k\<gtr\>N>>
    so that\ 

    <\equation>
      g<around*|(|x|)>=<big|sum><rsub|k=0><rsup|N><around|\<langle\>|f,\<phi\><rsub|k>|\<rangle\>>*\<phi\><rsub|k><around*|(|x|)>
    </equation>

    \ and

    <\equation>
      h<around*|(|x|)>=<big|sum><rsub|k=N+1><rsup|\<infty\>><around|\<langle\>|f,\<phi\><rsub|k>|\<rangle\>>*\<phi\><rsub|k><around*|(|x|)>
    </equation>

    \ where by orthogonality of <math|g> and <math|h>

    <\equation>
      <around*|\<langle\>|g,h|\<rangle\>>=<big|int><rsub|0><rsup|\<infty\>>g<around*|(|x|)>h<around*|(|x|)>\<mathd\>x=0
    </equation>

    we have

    <\equation>
      <around|\<\|\|\>|E<rsub|N>*f|\<\|\|\>><rsup|2>=<around|\<langle\>|E<rsub|N>*f,E<rsub|N>*f|\<rangle\>>=<around|\<langle\>|E<rsub|N>*h,h|\<rangle\>>
    </equation>

    because <math|E<rsub|N>*g=0> by construction and since <math|h> is
    orthogonal to the first N eigenfunctions and\ 

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
    <associate|magnification|1.4>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-screen-margin|true>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>