<TeXmacs|2.1.4>

<style|generic>

<\body>
  \;

  <\proof>
    We begin with the eigenvalue equation for a linear operator <math|K> with
    kernel <math|K*<around|(|x,y|)>>:

    <\equation>
      <big|int><rsub|D>K*<around|(|x,y|)>*\<phi\><rsub|n><around|(|y|)>*d*y=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|x|)>
    </equation>

    We expand the eigenfunction <math|\<phi\><rsub|n><around|(|x|)>> in terms
    of an orthonormal basis <math|<around|{|h<rsub|k><around|(|x|)>|}>>:

    <\equation>
      \<phi\><rsub|n><around|(|x|)>=<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*h<rsub|k><around|(|x|)>
    </equation>

    Substituting this expansion into the eigenvalue equation:

    <\equation>
      <big|int><rsub|D>K*<around|(|x,y|)>*<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*h<rsub|k><around|(|y|)>*d*y=\<lambda\><rsub|n>*<big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*h<rsub|k><around|(|x|)>
    </equation>

    We project both sides onto <math|h<rsub|j><around|(|x|)>> by multiplying
    by <math|h<rsub|j><around|(|x|)>> and integrating over <math|x>:

    <\equation>
      <big|sum><rsub|k=1><rsup|\<infty\>>c<rsub|n,k>*<big|int><rsub|D><big|int><rsub|D>h<rsub|j><around|(|x|)>*K*<around|(|x,y|)>*h<rsub|k><around|(|y|)>*d*y*d*x=\<lambda\><rsub|n>*c<rsub|n,j>
    </equation>

    Define the matrix elements:

    <\equation>
      K<rsub|j*k>=<big|int><rsub|D><big|int><rsub|D>h<rsub|j><around|(|x|)>*K*<around|(|x,y|)>*h<rsub|k><around|(|y|)>*d*y*d*x
    </equation>

    This gives us the system of equations:

    <\equation>
      <big|sum><rsub|k=1><rsup|\<infty\>>K<rsub|j*k>*c<rsub|n,k>=\<lambda\><rsub|n>*c<rsub|n,j>
    </equation>

    By induction, we can show that for any <math|j\<gtr\>1>:

    <\equation>
      c<rsub|n,j>=<frac|1|\<lambda\><rsub|n>-K<rsub|j*j>>*<big|sum><rsub|k=1><rsup|j-1>K<rsub|j*k>*c<rsub|n,k>
    </equation>

    This forms a triangular system that allows us to compute the coefficients
    <math|c<rsub|n,j>> sequentially, with each coefficient depending only on
    the previous ones.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>