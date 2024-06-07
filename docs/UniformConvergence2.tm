<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <\lemma>
    <label|ortho>The functions

    <\equation>
      \<psi\><rsub|n><around|(|y|)>=<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
    </equation>

    are orthonormal over the interval <math|0> to <math|\<infty\>>, i.e.,

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j><around|(|y|)>*\<psi\><rsub|k><around|(|y|)>*<space|0.17em>d*y=\<delta\><rsub|j*k>,
    </equation>

    where <math|\<delta\><rsub|j*k>> is the Kronecker delta.
  </lemma>

  <\proof>
    Consider the integral

    <\equation>
      I=<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j><around|(|y|)>*\<psi\><rsub|k><around|(|y|)>*<space|0.17em>d*y
    </equation>

    Substituting <math|\<psi\><rsub|j><around|(|y|)>> and
    <math|\<psi\><rsub|k><around|(|y|)>>, we get

    <\equation>
      I=<big|int><rsub|0><rsup|\<infty\>><sqrt|<frac|4*j+1|y>>*<around|(|-1|)><rsup|j>*J<rsub|2*j+<frac|1|2>><around|(|y|)><sqrt|<frac|4*k+1|y>>*<around|(|-1|)><rsup|k>*J<rsub|2*k+<frac|1|2>><around|(|y|)>*<space|0.17em>d*y
    </equation>

    This simplifies to

    <\equation>
      I=<sqrt|<around|(|4*j+1|)>*<around|(|4*k+1|)>>*<around|(|-1|)><rsup|j+k>*<big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*j+<frac|1|2>><around|(|y|)>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y
    </equation>

    Using the orthogonality relation for Bessel functions:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|\<nu\>><around|(|y|)>*J<rsub|\<mu\>><around|(|y|)>|y>*<space|0.17em>d*y=<frac|2*sin
      <around*|(|<frac|\<pi\>|2>*<around|(|\<mu\>-\<nu\>|)>|)>|\<pi\>*<around|(|\<mu\><rsup|2>-\<nu\><rsup|2>|)>>
    </equation*>

    where <math|\<nu\>=2*j+<frac|1|2>> and <math|\<mu\>=2*k+<frac|1|2>>, we
    find:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*j+<frac|1|2>><around|(|y|)>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y=<frac|2*sin
      <around*|(|<frac|\<pi\>|2>*<around|(|<around|(|2*k+<frac|1|2>|)>-<around|(|2*j+<frac|1|2>|)>|)>|)>|\<pi\>*<around|(|<around|(|2*k+<frac|1|2>|)><rsup|2>-<around|(|2*j+<frac|1|2>|)><rsup|2>|)>>
    </equation>

    Simplifying the argument of the sine function, we get:

    <\equation*>
      sin <around*|(|<frac|\<pi\>|2>*<around|(|<around|(|2*k+<frac|1|2>|)>-<around|(|2*j+<frac|1|2>|)>|)>|)>=sin
      <around*|(|<frac|\<pi\>|2>*<around|(|2*k-2*j|)>|)>=sin
      <around|(|\<pi\>*<around|(|k-j|)>|)>=0*<space|1em><text|\<forall\>><space|1em>k\<neq\>j
    </equation*>

    Therefore, for <math|k\<neq\>j>

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*j+<frac|1|2>><around|(|y|)>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y=0
    </equation>

    For <math|k=j>, we need to consider the limit carefully because both the
    numerator and denominator approach zero:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*j+<frac|1|2>><around|(|y|)>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y=lim<rsub|k\<to\>j>
      <frac|2*sin <around*|(|<frac|\<pi\>|2>*<around|(|<around|(|2*k+<frac|1|2>|)>-<around|(|2*j+<frac|1|2>|)>|)>|)>|\<pi\>*<around|(|<around|(|2*k+<frac|1|2>|)><rsup|2>-<around|(|2*j+<frac|1|2>|)><rsup|2>|)>>
    </equation>

    Using L'Hôpital's Rule for the limit:

    <\equation>
      lim<rsub|k\<to\>j> <frac|2*sin <around*|(|<frac|\<pi\>|2>*<around|(|2*<around|(|k-j|)>|)>|)>|\<pi\>*<around|(|<around|(|2*k+<frac|1|2>|)><rsup|2>-<around|(|2*j+<frac|1|2>|)><rsup|2>|)>>=lim<rsub|k\<to\>j>
      <frac|2\<cdot\><frac|\<pi\>|2>*cos <around*|(|\<pi\>*<around|(|k-j|)>|)>\<cdot\>2|\<pi\>\<cdot\>2*<around|(|2*k+<frac|1|2>|)>>=lim<rsub|k\<to\>j>
      <frac|2*\<pi\>*cos <around*|(|\<pi\>*<around|(|k-j|)>|)>|4*\<pi\>*<around|(|2*k+<frac|1|2>|)>>
    </equation>

    Since <math|cos <around|(|0|)>=1>, we get:

    <\equation>
      lim<rsub|k\<to\>j> <frac|2*\<pi\>|4*\<pi\>*<around|(|2*k+<frac|1|2>|)>>=<frac|1|2*<around|(|2*j+<frac|1|2>|)>>=<frac|1|4*j+1>
    </equation>

    Therefore,

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*j+<frac|1|2>><around|(|y|)>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y=<frac|\<delta\><rsub|j*k>|4*j+1>
    </equation>

    Substituting this result back into the integral, we have:

    <\equation>
      I=<sqrt|<around|(|4*j+1|)>*<around|(|4*k+1|)>>*<around|(|-1|)><rsup|j+k><frac|\<delta\><rsub|j*k>|4*j+1>
    </equation>

    For <math|j\<neq\>k>, <math|\<delta\><rsub|j*k>=0>, yielding <math|I=0>.
    For <math|j=k>, <math|\<delta\><rsub|j*k>=1>, giving:

    <\equation>
      I=<frac|<sqrt|<around|(|4*j+1|)>*<around|(|4*j+1|)>>|4*j+1>=<frac|4*j+1|4*j+1>=1
    </equation>

    Hence, <math|\<psi\><rsub|j><around|(|y|)>> and
    <math|\<psi\><rsub|k><around|(|y|)>> are orthonormal.
  </proof>

  <\lemma>
    Consider the Bessel function of the first kind
    <math|J<rsub|\<nu\>><around|(|y|)>>, and let <math|\<Gamma\>> denote the
    Gamma function. For <math|\<nu\>=2*k+<frac|1|2>> and all integers
    <math|n\<geq\>0>, the following limit holds:

    <\equation>
      lim<rsub|y\<rightarrow\>0> K<around*|(|n,y|)>=1\<forall\>n\<in\><around*|{|0,1,2\<ldots\>|}>
    </equation>

    where

    <\equation>
      K<around*|(|n,y|)>=<big|sum><rsub|k=0><rsup|n>\<psi\><rsub|n><around*|(|y|)>=<frac|<sqrt|2><around*|(|<big|sum><rsub|k=0><rsup|n><frac|<around|(|4*k+1|)>*\<Gamma\>*<around*|(|k+<frac|1|2>|)><rsup|2>*<around|(|-1|)><rsup|k>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|\<Gamma\>*<around|(|k+1|)><rsup|2>>|)>|2*<sqrt|\<pi\>>*<sqrt|y>>
    </equation>
  </lemma>

  \;

  <\lemma>
    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>|<sqrt|x>>*<space|0.17em>d*x=<frac|<sqrt|2>*<space|0.17em><around*|(|-1|)><rsup|n>*\<Gamma\>*<space|-0.17em><around*|(|n+<frac|1|2>|)><rsup|2>|2*<sqrt|\<pi\>>*<space|0.17em>\<Gamma\>*<space|-0.17em><around*|(|n+1|)><rsup|2>>\<forall\>n\<in\>\<bbb-Z\>
    </equation>
  </lemma>

  \;

  <\theorem>
    The eigenvalues of

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>\<ast\>\<psi\><rsub|n><around|(|x|)>*d*x=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|y|)>
    </equation>

    are

    <\equation>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x=<sqrt|<frac|4n+1|\<pi\>>><frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation>

    where

    <\equation>
      \<psi\><rsub|n><around|(|y|)>=<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
    </equation>

    is the orthonormal set proven in Lemma 1.
  </theorem>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|ortho|<tuple|1|1>>
  </collection>
</references>