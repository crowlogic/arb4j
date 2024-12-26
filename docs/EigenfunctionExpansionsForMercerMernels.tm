<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Eigenfunction Expansions for Mercer
  Kernels>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  Consider an integral operator with kernel <math|R<around|(|s,t|)>> acting
  on functions in <math|L<rsup|2><around|[|0,\<infty\>|)>>.

  <\definition>
    The eigenfunctions satisfy the equation:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<psi\><around|(|s|)>*<space|0.17em>d*s=\<lambda\>*\<psi\><around|(|t|)>
    </equation>

    where <math|<around|{|\<psi\><rsub|n>|}><rsub|n=1><rsup|\<infty\>>> are
    the eigenfunctions with corresponding eigenvalues
    <math|<around|{|\<lambda\><rsub|n>|}><rsub|n=1><rsup|\<infty\>>>
  </definition>

  <\definition>
    Let <math|<around|{|\<phi\><rsub|j>|}><rsub|j=1><rsup|\<infty\>>> be a
    complete orthonormal basis of <math|L<rsup|2><around|[|0,\<infty\>|)>>
    and define the kernel matrix elements:

    <\equation>
      K<rsub|k*j>=<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|k><around|(|t|)>*\<phi\><rsub|j><around|(|s|)>*<space|0.17em>d*t*<space|0.17em>d*s
    </equation>
  </definition>

  \ 

  <\theorem>
    If <math|\<psi\><rsub|n><around|(|t|)>=<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n,j>*\<phi\><rsub|j><around|(|t|)>>
    is an eigenfunction expansion, then:

    <\equation>
      c<rsub|n,k>=<frac|<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t|\<lambda\><rsub|n>>*
    </equation>
  </theorem>

  <\proof>
    <\enumerate>
      <item>Begin with the eigenfunction equation for <math|\<psi\><rsub|n>>:

      <\equation>
        <big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|t|)>
      </equation>

      <item>Multiply both sides by <math|\<phi\><rsub|k><around|(|t|)>> and
      integrate over t:

      <\equation>
        <big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*<big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s*<space|0.17em>d*t=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
      </equation>

      <item>Apply Fubini's theorem to swap integration order on the left
      side:

      <\equation>
        <big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|k><around|(|t|)>*<space|0.17em>d*t*<space|0.17em>\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
      </equation>

      <item>Substitute the eigenfunction expansion
      <math|\<psi\><rsub|n><around|(|s|)>=<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n,j>*\<phi\><rsub|j><around|(|s|)>>:

      <\equation>
        <big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|k><around|(|t|)>*<space|0.17em>d*t*<space|0.17em><big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n,j>*\<phi\><rsub|j><around|(|s|)>*<space|0.17em>d*s=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
      </equation>

      <item>Exchange summation and integration (justified by <math|L<rsup|2>>
      convergence):

      <\equation>
        <big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n,j>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|k><around|(|t|)>*\<phi\><rsub|j><around|(|s|)>*<space|0.17em>d*t*<space|0.17em>d*s=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
      </equation>

      <item>Recognize the kernel matrix elements:

      <\equation>
        <big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n,j>*K<rsub|k*j>=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
      </equation>

      <item>Note that <math|<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n,j>*K<rsub|k*j>>
      is the <math|k>-th component of <math|K<math-bf|c><rsub|n>>. Since
      <math|\<psi\><rsub|n>> is an eigenfunction, <math|<math-bf|c><rsub|n>>
      must satisfy <math|K<math-bf|c><rsub|n>=\<lambda\><rsub|n><math-bf|c><rsub|n>>,
      thus:

      <\equation>
        \<lambda\><rsub|n>*c<rsub|n,k>=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
      </equation>

      <item>Divide both sides by <math|\<lambda\><rsub|n>> (noting
      <math|\<lambda\><rsub|n>\<neq\>0> for non-trivial eigenfunctions):

      <\equation>
        c<rsub|n,k>=<frac|<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t|\<lambda\><rsub|n>>*
      </equation>
    </enumerate>

    This establishes that the coefficient <math|c<rsub|n,k>> in the
    eigenfunction expansion equals the normalized inner product of the basis
    function <math|\<phi\><rsub|k>> with the eigenfunction
    <math|\<psi\><rsub|n>>.
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