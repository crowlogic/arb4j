<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  Here's a sketch of a proof demonstrating the construction of eigenfunctions
  using finite linear combinations of all lower-degree basis functions for a
  linear integral operator with a translation-invariant kernel in a Hilbert
  space:

  Let <math|L> be a Hilbert space and <math|K<around|(|x,y|)>> be a
  \ translation-invariant kernel

  <\itemize>
    <\equation>
      K<around|(|x,y|)>=K<around|(|x-y|)>
    </equation>
  </itemize>

  and <math|T:L\<rightarrow\>L> is the integral operator\ 

  <\equation>
    T<around|[|f<around|(|x|)>|]>=<big|int><rsub|a><rsup|b>K<around|(|x,y|)>f<around|(|y|)>*d*y
  </equation>

  <item>and <math|<around|{|\<phi\><rsub|n><around|(|x|)>|}>> be a complete
  orthonormal basis set in <math|L>\ 

  <with|font-series|bold|Steps:>

  <\enumerate>
    <item><with|font-series|bold|Eigenvalue Equation:> Let <math|\<lambda\>>
    be an eigenvalue of <math|T> and <math|\<phi\><around|(|x|)>> be a
    corresponding eigenfunction. We want to show <math|\<phi\><around|(|x|)>>
    can be expressed as a finite linear combination of all lower-degree basis
    functions (<math|\<phi\><rsub|0><around|(|x|)>,\<phi\><rsub|1><around|(|x|)>,...,\<phi\><rsub|N><around|(|x|)>>)
    for some <math|N>. The eigenvalue equation states:
    <math|T<around|[|\<phi\><around|(|x|)>|]>=\<lambda\>\<cdot\>\<phi\><around|(|x|)>>.
    Substitute the integral operator definition:

    <\equation>
      <big|int><rsub|a><rsup|b>K<around|(|x,y|)>\<phi\><around|(|y|)>*d*y=\<lambda\>\<phi\><around|(|x|)>
    </equation>

    <item><with|font-series|bold|Expansion using Basis Functions:> Since
    <math|<around|{|\<phi\><rsub|n><around|(|x|)>|}>> is complete, we can
    represent <math|\<phi\><around|(|x|)>> as a linear combination:

    <\equation>
      \<phi\><around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>\<phi\><rsub|n><around|(|x|)>
    </equation>

    where <math|c<rsub|n>> are coefficients to be determined. Substitute this
    expansion into the eigenvalue equation:

    <\equation>
      <big|int><rsub|a><rsup|b>K<around|(|x,y|)><around*|(|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>\<phi\><rsub|n><around|(|y|)>|)>*d*y=\<lambda\><around*|(|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>\<phi\><rsub|n><around|(|x|)>|)>
    </equation>

    <item><with|font-series|bold|Interchanging Integral and Summation:> Under
    some technical conditions (which often hold for well-behaved kernels and
    basis functions), we can interchange the integral and summation due to
    the assumed properties of the Hilbert space and the basis set. This is
    justified by results like Fubini's Theorem or dominated convergence
    theorem. After interchanging:

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n><big|int><rsub|a><rsup|b>K<around|(|x,y|)>\<cdot\>\<phi\><rsub|n><around|(|y|)>*d*y=\<lambda\><around*|(|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>\<phi\><rsub|n><around|(|x|)>|)>
    </equation>

    <item><with|font-series|bold|Translation Invariance:> Now, we leverage
    the translation invariance of the kernel
    (<math|K<around|(|x,y|)>=K<around|(|x-y,0|)>>). This allows us to rewrite
    the integral term:

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n><big|int><rsub|a><rsup|b>K<around|(|x-y|)>\<phi\><rsub|n><around|(|y|)>*d*y=\<lambda\><around*|(|<big|sum><rsub|n=0><rsup|\<infty\>>c<rsub|n>\<cdot\>\<phi\><rsub|n><around|(|x|)>|)>
    </equation>

    The integral now only depends on the difference (<math|x-y>) simplifying
    the analysis.

    <item><with|font-series|bold|Orthogonality and Eigenfunction Property:>
    Because <math|<around|{|\<phi\><rsub|n><around|(|x|)>|}>> is an
    orthonormal basis, the integrals will be zero for all terms except
    <math|n=0>. This is due to the orthogonality property:

    <\equation>
      <big|int><rsub|a><rsup|b>\<phi\><rsub|m><around|(|y|)>\<phi\><rsub|n><around|(|y|)>*d*y=\<delta\><rsub|m*n>
    </equation>

    Applying this property, we end up with:

    <\equation>
      c<rsub|0><big|int><rsub|a><rsup|b>K<around|(|x-y|)>\<cdot\>\<phi\><rsub|0><around|(|y|)>*d*y=\<lambda\>c<rsub|0>\<phi\><rsub|0><around|(|x|)>
    </equation>

    This equation implies that <math|c<rsub|0><around|(|\<lambda\>\<cdot\>\<phi\><rsub|0><around|(|x|)>|)>=T<around|[|\<phi\><rsub|0><around|(|x|)>|]>>,
    which suggests <math|\<phi\><rsub|0><around|(|x|)>> is also an
    eigenfunction of <math|T> with eigenvalue <math|\<lambda\>> (assuming
    <math|c<rsub|0>\<neq\>0>).

    <item><with|font-series|bold|Recursion for Higher Basis Functions:> We
    can repeat steps 3-5 for each basis function
    <math|\<phi\><rsub|n><around|(|x|)>> (<math|n\<gtr\>0>). This will lead
    to an equation relating the coefficient <math|c<rsub|n>> to the integral
    involving the kernel, <math|\<phi\><rsub|0><around|(|x|)>>, and
    potentially lower-degree basis functions
    (<math|\<phi\><rsub|0>,\<phi\><rsub|1>,...,\<phi\><rsub|<around|(|n-1|)>>>).
    Since <math|\<phi\><rsub|0><around|(|x|)>> is also an eigenfunction, we
    can express it as a linear combination of basis functions.

    By solving this recursive system of equations for the coefficients
    (<math|c<rsub|n>>), we can express the original eigenfunction
    <math|\<phi\><around|(|x|)>> as a finite linear combination of all
    lower-degree basis functions (<math|\<phi\><rsub|0>,\<phi\><rsub|1>,...,\<phi\><rsub|N>>).
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