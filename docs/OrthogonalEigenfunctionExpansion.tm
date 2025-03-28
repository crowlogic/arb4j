<TeXmacs|2.1.4>

<style|generic>

<\body>
  \;

  <subsection|Translation-Invariant (Stationary) Gaussian Processes>

  <\proof>
    Let <math|R<around|(|s,t|)>> be a positive definite kernel on
    <math|<around|[|0,\<infty\>|)>> and <math|<around|{|\<phi\><rsub|k><around|(|t|)>|}><rsub|k=1><rsup|\<infty\>>>
    be an orthonormal basis for <math|L<rsup|2><around|[|0,\<infty\>|)>>.
    Define the matrix <math|K> with elements:

    <\equation>
      K<rsub|i*j>=<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|i><around|(|s|)>*\<phi\><rsub|j><around|(|t|)>*<space|0.17em>d*s*<space|0.17em>d*t
    </equation>

    Consider the eigenvalue problem:

    <\equation>
      K<math-bf|c><rsub|n>=\<lambda\><rsub|n><math-bf|c><rsub|n>
    </equation>

    where <math|<math-bf|c><rsub|n>=<around|(|c<rsub|n,1>,c<rsub|n,2>,\<ldots\>|)><rsup|T>>
    is the eigenvector corresponding to eigenvalue <math|\<lambda\><rsub|n>>.
    Now, let

    <\equation>
      \<psi\><rsub|n><around|(|t|)>=<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*\<phi\><rsub|k><around|(|t|)>
    </equation>

    We will show that <math|\<psi\><rsub|n><around|(|t|)>> is an
    eigenfunction of the integral operator with kernel
    <math|R<around|(|s,t|)>>.

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s>|<cell|=<big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*\<phi\><rsub|k><around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|k><around|(|s|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*<big|sum><rsub|j=1><rsup|\<infty\>><around*|(|<big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|k><around|(|s|)>*\<phi\><rsub|j><around|(|t|)>*<space|0.17em>d*s|)>*\<phi\><rsub|j><around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|\<infty\>><around*|(|<big|sum><rsub|k=1><rsup|\<infty\>>K<rsub|j*k>*c<rsub|n,k>|)>*\<phi\><rsub|j><around|(|t|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|\<infty\>>\<lambda\><rsub|n>*c<rsub|n,j>*\<phi\><rsub|j><around|(|t|)>>>|<row|<cell|>|<cell|=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|t|)>>>>>>
    </equation>

    Thus, <math|\<psi\><rsub|n><around|(|t|)>> is indeed an eigenfunction of
    the integral operator with eigenvalue <math|\<lambda\><rsub|n>>, and the
    coefficients <math|c<rsub|n,k>> satisfy:

    <\equation>
      c<rsub|n,k>=<frac|<big|sum><rsub|j=1><rsup|\<infty\>>K<rsub|k*j>*c<rsub|n,j>|\<lambda\><rsub|n>>*
    </equation>

    This proves that the expansion

    <\equation>
      \<psi\><rsub|n><around|(|t|)>=<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*\<phi\><rsub|k><around|(|t|)>
    </equation>

    \ holds for any positive definite kernel <math|R<around|(|s,t|)>> and any
    orthonormal basis <math|<around|{|\<phi\><rsub|k><around|(|t|)>|}><rsub|k=1><rsup|\<infty\>>>
    on <math|<around|[|0,\<infty\>|)>>, with the coefficients
    <math|c<rsub|n,k>> determined by the eigenvalue problem of the matrix
    <math|K>.
  </proof>

  <\proof>
    We start with the eigenfunction equation:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|t|)>
    </equation>

    Multiply both sides by <math|\<phi\><rsub|k><around|(|t|)>> and integrate
    over t:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*<big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s*<space|0.17em>d*t=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
    </equation>

    By Fubini's theorem, we can swap the order of integration on the left
    side:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|k><around|(|t|)>*<space|0.17em>d*t*<space|0.17em>\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
    </equation>

    Recall the definition of <math|\<psi\><rsub|n><around|(|t|)>>:

    <\equation>
      \<psi\><rsub|n><around|(|t|)>=<big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n,j>*\<phi\><rsub|j><around|(|t|)>
    </equation>

    Substitute this into the left side of the equation from step 3:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|k><around|(|t|)>*<space|0.17em>d*t*<space|0.17em><big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n,j>*\<phi\><rsub|j><around|(|s|)>*<space|0.17em>d*s=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
    </equation>

    Expand the left side:

    <\equation>
      <big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n,j>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|k><around|(|t|)>*\<phi\><rsub|j><around|(|s|)>*<space|0.17em>d*t*<space|0.17em>d*s=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
    </equation>

    Recognize the definition of <math|K<rsub|k*j>> from the original proof:

    <\equation>
      <big|sum><rsub|j=1><rsup|\<infty\>>c<rsub|n,j>*K<rsub|k*j>=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
    </equation>

    The left side is exactly <math|\<lambda\><rsub|n>*c<rsub|n,k>> from the
    eigenvalue equation <math|K<math-bf|c><rsub|n>=\<lambda\><rsub|n><math-bf|c><rsub|n>>:

    <\equation>
      \<lambda\><rsub|n>*c<rsub|n,k>=\<lambda\><rsub|n>*<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t
    </equation>

    Divide both sides by <math|\<lambda\><rsub|n>>:

    <\equation>
      c<rsub|n,k>=<frac|<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t|\<lambda\><rsub|n>>*<label|c>
    </equation>

    This completes the proof.
  </proof>

  <\proof>
    We start with the eigenvalue equation for the matrix <math|K>:

    <\equation>
      K<math-bf|c><rsub|n>=\<lambda\><rsub|n><math-bf|c><rsub|n>
    </equation>

    Multiply both sides by <math|<math-bf|c><rsub|n><rsup|T>> from the left:

    <\equation>
      <math-bf|c><rsub|n><rsup|T>K<math-bf|c><rsub|n>=\<lambda\><rsub|n><math-bf|c><rsub|n><rsup|T><math-bf|c><rsub|n>
    </equation>

    Divide both sides by <math|<math-bf|c><rsub|n><rsup|T><math-bf|c><rsub|n>>:

    <\equation>
      \<lambda\><rsub|n>=<frac|<math-bf|c><rsub|n><rsup|T>K<math-bf|c><rsub|n>|<math-bf|c><rsub|n><rsup|T><math-bf|c><rsub|n>>
    </equation>

    Now, let's expand the numerator using the definition of <math|K>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<math-bf|c><rsub|n><rsup|T>K<math-bf|c><rsub|n>>|<cell|=<big|sum><rsub|i,j>c<rsub|n,i>*K<rsub|i*j>*c<rsub|n,j>>>|<row|<cell|>|<cell|=<big|sum><rsub|i,j>c<rsub|n,i>*c<rsub|n,j>*<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<phi\><rsub|i><around|(|s|)>*\<phi\><rsub|j><around|(|t|)>*<space|0.17em>d*s*<space|0.17em>d*t>>>>>
    </equation>

    Recall that <math|\<psi\><rsub|n><around|(|t|)>=<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*\<phi\><rsub|k><around|(|t|)>>.
    Using this, we can rewrite the above as:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<math-bf|c><rsub|n><rsup|T>K<math-bf|c><rsub|n>>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)><around*|(|<big|sum><rsub|i>c<rsub|n,i>*\<phi\><rsub|i><around|(|s|)>|)><around*|(|<big|sum><rsub|j>c<rsub|n,j>*\<phi\><rsub|j><around|(|t|)>|)>*<space|0.17em>d*s*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*s*<space|0.17em>d*t>>>>>
    </equation>

    For the denominator, note that <math|<math-bf|c><rsub|n><rsup|T><math-bf|c><rsub|n>=<around|\<\|\|\>|\<psi\><rsub|n>|\<\|\|\>><rsup|2>=1>
    due to normalization of eigenfunctions.

    Therefore, we conclude:

    <\equation>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*s*<space|0.17em>d*t
    </equation>

    This completes the proof.
  </proof>

  Therefore, (<reference|c>) becomes

  <\equation>
    c<rsub|n,k>=<frac|<big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|k><around|(|t|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*t|<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>R<around|(|s,t|)>*\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>*<space|0.17em>d*s*<space|0.17em>d*t>
  </equation>

  <\equation*>
    \;
  </equation*>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|c|<tuple|15|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc>Translation-Invariant
      (Stationary) Gaussian Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>
    </associate>
  </collection>
</auxiliary>