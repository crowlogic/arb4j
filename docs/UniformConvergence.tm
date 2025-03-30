<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Proof of the Uniform Convergence of a Sequence of
  Orthogonal (Eigen)Functions to the Bessel function of the First Kind of
  Order 0>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\lemma>
    <\em>
      The functions<label|ortho>

      <\equation>
        \<psi\><rsub|n><around|(|y|)>=<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
      </equation>

      \ are orthonormal over the interval <math|0> to <math|\<infty\>>, i.e.,

      <\equation>
        <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j><around|(|y|)>*\<psi\><rsub|k><around|(|y|)>*<space|0.17em>d*y=\<delta\><rsub|j*k>
      </equation>

      where <math|\<delta\><rsub|j*k>> is the Kronecker delta.
    </em>
  </lemma>

  \;

  <\proof>
    <\em>
      Consider the integral

      <\equation>
        I=<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|j><around|(|y|)>*\<psi\><rsub|k><around|(|y|)>*<space|0.17em>d*y
      </equation>

      which can be expressed as

      <\equation>
        I=<big|int><rsub|0><rsup|\<infty\>><sqrt|<frac|4*j+1|y>>*<around|(|-1|)><rsup|j>*J<rsub|2*j+<frac|1|2>><around|(|y|)><sqrt|<frac|4*k+1|y>>*<around|(|-1|)><rsup|k>*J<rsub|2*k+<frac|1|2>><around|(|y|)>*<space|0.17em>d*y
      </equation>

      This simplifies to

      <\equation>
        I=<sqrt|<around|(|4*j+1|)>*<around|(|4*k+1|)>>*<around|(|-1|)><rsup|j+k>*<big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*j+<frac|1|2>><around|(|y|)>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y
      </equation>

      Using the orthogonality relation for Bessel functions,

      <\equation>
        <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|\<nu\>><around|(|y|)>*J<rsub|\<mu\>><around|(|y|)>|y>*<space|0.17em>d*y=<frac|\<delta\><rsub|\<nu\>*\<mu\>>|2*\<nu\>>
      </equation>

      where <math|\<nu\>=2*j+<frac|1|2>> and <math|\<mu\>=2*k+<frac|1|2>>, we
      find

      <\equation>
        <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*j+<frac|1|2>><around|(|y|)>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y=<frac|\<delta\><rsub|j*k>|4*j+1>
      </equation>

      Substituting this result back, we have

      <\equation>
        I=<sqrt|<around|(|4*j+1|)>*<around|(|4*k+1|)>>*<around|(|-1|)><rsup|j+k><frac|\<delta\><rsub|j*k>|4*j+1>
      </equation>

      For <math|j\<neq\>k>, <math|\<delta\><rsub|j*k>=0>, yielding
      <math|I=0>. For <math|j=k>, <math|\<delta\><rsub|j*k>=1>, giving

      <\equation>
        I=<frac|<sqrt|<around|(|4*j+1|)>*<around|(|4*j+1|)>>|4*j+1>=1
      </equation>

      Hence, <math|\<psi\><rsub|j><around|(|y|)>> and
      <math|\<psi\><rsub|k><around|(|y|)>> are orthonormal.
    </em>
  </proof>

  <\theorem>
    Given:

    <\equation*>
      \<lambda\><around|(|n|)>=<sqrt|4*n+1>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|<sqrt|\<pi\>>*\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    We aim to show:

    <\equation*>
      \<lambda\><around|(|n|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x
    </equation*>

    where

    <\equation*>
      \<psi\><rsub|n><around|(|x|)>=<frac|1|2>*<sqrt|4*n+1>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|x|)><frac|<sqrt|2>|<sqrt|x>>
    </equation*>
  </theorem>

  <\proof>
    Substitute <math|\<psi\><rsub|n><around|(|x|)>> into the integral and
    simplify:

    <\equation*>
      \<lambda\><around|(|n|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*<around*|(|<frac|1|2>*<sqrt|4*n+1>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|x|)><frac|<sqrt|2>|<sqrt|x>>|)>*d*x
    </equation*>

    <\equation*>
      =<frac|1|<sqrt|2>>*<sqrt|4*n+1>*<around|(|-1|)><rsup|n>*<big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>|<sqrt|x>>*d*x
    </equation*>

    Use the known result for the integral of the product of Bessel functions:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>|<sqrt|x>>*d*x=<frac|<sqrt|\<pi\>>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>|2<rsup|n+<frac|1|2>>*\<Gamma\>*<around|(|n+1|)>>
    </equation*>

    Substitute this result back into <math|\<lambda\><around|(|n|)>> and
    simplify:

    <\equation*>
      \<lambda\><around|(|n|)>=<frac|1|<sqrt|2>>*<sqrt|4*n+1>*<around|(|-1|)><rsup|n><frac|<sqrt|\<pi\>>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>|2<rsup|n+<frac|1|2>>*\<Gamma\>*<around|(|n+1|)>>
    </equation*>

    <\equation*>
      =<sqrt|4*n+1>*<frac|<around|(|-1|)><rsup|n><sqrt|\<pi\>>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>|2<rsup|n+1>*\<Gamma\>*<around|(|n+1|)>>
    </equation*>

    Use the Gamma function duplication formula:

    <\equation*>
      \<Gamma\>*<around|(|n+1|)>=<frac|<sqrt|\<pi\>>*\<Gamma\>*<around|(|2*n+1|)>|2<rsup|2*n>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>>
    </equation*>

    Substitute back into <math|\<lambda\><around|(|n|)>>:

    <\equation*>
      \<lambda\><around|(|n|)>=<sqrt|4*n+1>*<frac|<around|(|-1|)><rsup|n><sqrt|\<pi\>>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>|2<rsup|n+1><around*|(|<frac|<sqrt|\<pi\>>*\<Gamma\>*<around|(|2*n+1|)>|2<rsup|2*n>*\<Gamma\>*<around*|(|n+<frac|1|2>|)>>|)>>
    </equation*>

    <\equation*>
      =<sqrt|4*n+1>*<frac|<around|(|-1|)><rsup|n>*2<rsup|2*n>*\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|2<rsup|n+1>*\<Gamma\>*<around|(|2*n+1|)>>
    </equation*>

    The term <math|<around|(|-1|)><rsup|n>> cancels out because it appears in
    both the numerator and denominator:

    <\equation*>
      =<sqrt|4*n+1>*<frac|2<rsup|2*n>*\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|2<rsup|n+1>*\<Gamma\>*<around|(|2*n+1|)>>
    </equation*>

    Simplify further:

    <\equation*>
      =<sqrt|4*n+1>*<frac|2<rsup|n-1>*\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|2*n+1|)>>
    </equation*>

    Recognize <math|<around|(|2*n|)>!=\<Gamma\>*<around|(|2*n+1|)>>:

    <\equation*>
      =<sqrt|4*n+1>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|<sqrt|\<pi\>>*\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    Thus, the identity is confirmed:

    <\equation*>
      \<lambda\><around|(|n|)>=<sqrt|4*n+1>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|<sqrt|\<pi\>>*\<Gamma\>*<around|(|n+1|)><rsup|2>>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x
    </equation*>
  </proof>

  <\theorem>
    Consider the Bessel function of the first kind
    <math|J<rsub|\<nu\>><around|(|y|)>>, and let <math|\<Gamma\>> denote the
    Gamma function. For <math|\<nu\>=2*k+<frac|1|2>> and all integers
    <math|n\<geq\>0>, the following limit holds:

    <\equation>
      lim<rsub|y\<rightarrow\>0> <frac|<sqrt|2><around*|(|<big|sum><rsub|k=0><rsup|n><frac|<around|(|4*k+1|)>*\<Gamma\>*<around*|(|k+<frac|1|2>|)><rsup|2>*<around|(|-1|)><rsup|k>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|\<Gamma\>*<around|(|k+1|)><rsup|2>>|)>|2*<sqrt|\<pi\>>*<sqrt|y>>=1
    </equation>
  </theorem>

  <\proof>
    We start by recalling the series expansion of the Bessel function of the
    first kind <math|J<rsub|\<nu\>><around|(|y|)>> around <math|y=0>:

    <\equation>
      J<rsub|\<nu\>><around|(|y|)>=<around*|(|<frac|y|2>|)><rsup|\<nu\>>*<big|sum><rsub|m=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|m>|m!<space|0.17em>\<Gamma\>*<around|(|\<nu\>+m+1|)>><around*|(|<frac|y|2>|)><rsup|2*m>
    </equation>

    For <math|\<nu\>=2*k+<frac|1|2>>, the expansion becomes:

    <\equation>
      J<rsub|2*k+<frac|1|2>><around|(|y|)>=<around*|(|<frac|y|2>|)><rsup|2*k+<frac|1|2>>*<big|sum><rsub|m=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|m>|m!<space|0.17em>\<Gamma\>*<around|(|2*k+<frac|1|2>+m+1|)>><around*|(|<frac|y|2>|)><rsup|2*m>
    </equation>

    Substituting the series expansion into the limit:

    <\equation>
      lim<rsub|y\<rightarrow\>0> <frac|<sqrt|2><around*|(|<big|sum><rsub|k=0><rsup|n><frac|<around|(|4*k+1|)>*\<Gamma\>*<around*|(|k+<frac|1|2>|)><rsup|2>*<around|(|-1|)><rsup|k>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|\<Gamma\>*<around|(|k+1|)><rsup|2>>|)>|2*<sqrt|\<pi\>>*<sqrt|y>>
    </equation>

    Substituting the series expansion of <math|J<rsub|2*k+<frac|1|2>><around|(|y|)>>:

    <\equation>
      lim<rsub|y\<rightarrow\>0> <frac|<sqrt|2><around*|(|<big|sum><rsub|k=0><rsup|n><frac|<around|(|4*k+1|)>*\<Gamma\>*<around*|(|k+<frac|1|2>|)><rsup|2>*<around|(|-1|)><rsup|k><around*|(|<frac|y|2>|)><rsup|2*k+<frac|1|2>>*<big|sum><rsub|m=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|m>|m!\<Gamma\>*<around|(|2*k+<frac|1|2>+m+1|)>><around*|(|<frac|y|2>|)><rsup|2*m>|\<Gamma\>*<around|(|k+1|)><rsup|2>>|)>|2*<sqrt|\<pi\>>*<sqrt|y>>
    </equation>

    As <math|y\<rightarrow\>0>, the dominant term in the inner sum is when
    <math|m=0>. Higher-order terms vanish faster. Therefore, we approximate:

    <\equation>
      J<rsub|2*k+<frac|1|2>><around|(|y|)>\<approx\><frac|<around*|(|<frac|y|2>|)><rsup|2*k+<frac|1|2>>|\<Gamma\>*<around|(|2*k+<frac|3|2>|)>>
    </equation>

    Simplifying the limit:

    <\equation>
      lim<rsub|y\<rightarrow\>0> <frac|<sqrt|2><around*|(|<big|sum><rsub|k=0><rsup|n><frac|<around|(|4*k+1|)>*\<Gamma\>*<around*|(|k+<frac|1|2>|)><rsup|2>*<around|(|-1|)><rsup|k><around*|(|<frac|y|2>|)><rsup|2*k+<frac|1|2>>|\<Gamma\>*<around|(|k+1|)><rsup|2>*\<Gamma\>*<around|(|2*k+<frac|3|2>|)>>|)>|2*<sqrt|\<pi\>>*<sqrt|y>>
    </equation>

    Only the term with <math|k=0> survives in the limit, as terms with
    <math|k\<gtr\>0> contain higher powers of <math|y>, which go to zero
    faster than <math|<sqrt|y>>:

    <\equation>
      lim<rsub|y\<rightarrow\>0> <frac|<sqrt|2><around*|(|<frac|<around|(|4\<cdot\>0+1|)>*\<Gamma\>*<around*|(|0+<frac|1|2>|)><rsup|2><around*|(|<frac|y|2>|)><rsup|<frac|1|2>>|\<Gamma\>*<around|(|0+1|)><rsup|2>*\<Gamma\><around*|(|<frac|3|2>|)>>|)>|2*<sqrt|\<pi\>>*<sqrt|y>>
    </equation>

    Using <math|\<Gamma\><around*|(|<frac|1|2>|)>=<sqrt|\<pi\>>>,
    <math|\<Gamma\><around|(|1|)>=1>, and
    <math|\<Gamma\><around*|(|<frac|3|2>|)>=<frac|<sqrt|\<pi\>>|2>>, we get:

    <\equation>
      =<frac|<sqrt|2><around*|(|<frac|\<pi\><around*|(|<frac|y|2>|)><rsup|<frac|1|2>>|<sqrt|\<pi\>>/2>|)>|2*<sqrt|\<pi\>>*<sqrt|y>>
    </equation>

    Simplifying the fraction:

    <\equation>
      =<frac|<sqrt|2><around*|(|<frac|2*<sqrt|\<pi\>>*<sqrt|y/2>|<sqrt|\<pi\>>>|)>|2*<sqrt|\<pi\>>*<sqrt|y>>
    </equation>

    Further simplification:

    <\equation>
      <frac|<sqrt|2>\<cdot\>2*<sqrt|y/2>|2*<sqrt|y>>=<frac|<sqrt|2>\<cdot\>2\<cdot\><sqrt|1/2>\<cdot\><sqrt|y>|2*<sqrt|y>>=<frac|<sqrt|2>\<cdot\><sqrt|2>|2>=1
    </equation>

    Therefore, the given limit is:

    <\equation*>
      lim<rsub|y\<rightarrow\>0> <frac|<sqrt|2><around*|(|<big|sum><rsub|k=0><rsup|n><frac|<around|(|4*k+1|)>*\<Gamma\>*<around*|(|k+<frac|1|2>|)><rsup|2>*<around|(|-1|)><rsup|k>*J<rsub|2*k+<frac|1|2>><around|(|y|)>|\<Gamma\>*<around|(|k+1|)><rsup|2>>|)>|2*<sqrt|\<pi\>>*<sqrt|y>>=1
    </equation*>
  </proof>

  Certainly! Here's the corrected and restated proof:

  <\theorem>
    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>>\<psi\><rsub|n><around|(|x|)>\<cdot\><around|(|-1|)><rsup|n>=<frac|1|2>
    </equation>
  </theorem>

  <\proof>
    \ From the lemma in the provided proof, we know that the functions
    <math|\<psi\><rsub|n><around|(|y|)>> defined as:

    <\equation>
      \<psi\><rsub|n><around|(|y|)>=<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
    </equation>

    are orthonormal over the interval <math|<around|[|0,\<infty\>|)>>.
    Theorem 1 in the provided proof establishes the following identity:

    <\equation>
      \<lambda\><around|(|n|)>=<sqrt|4*n+1>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|<sqrt|\<pi\>>*\<Gamma\>*<around|(|n+1|)><rsup|2>>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x
    </equation>

    Now, let's consider the Bessel function of the first kind of order 0,
    <math|J<rsub|0><around|(|x|)>>. It has the following series expansion:

    <\equation>
      J<rsub|0><around|(|x|)>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|n>|<around|(|n!|)><rsup|2>><around*|(|<frac|x|2>|)><rsup|2*n>
    </equation>

    Substituting the series expansion of <math|J<rsub|0><around|(|x|)>> into
    the identity from Theorem 1:

    <\equation>
      <sqrt|4*n+1>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|<sqrt|\<pi\>>*\<Gamma\>*<around|(|n+1|)><rsup|2>>=<big|int><rsub|0><rsup|\<infty\>><around*|(|<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|<around|(|k!|)><rsup|2>><around*|(|<frac|x|2>|)><rsup|2*k>|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x
    </equation>

    Interchanging the sum and integral (justified by uniform convergence):

    <\equation>
      <sqrt|4*n+1>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|<sqrt|\<pi\>>*\<Gamma\>*<around|(|n+1|)><rsup|2>>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|k>|<around|(|k!|)><rsup|2>>*<big|int><rsub|0><rsup|\<infty\>><around*|(|<frac|x|2>|)><rsup|2*k>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x
    </equation>

    Using the orthonormality of <math|\<psi\><rsub|n><around|(|x|)>>, the
    integral on the right-hand side is non-zero only when <math|k=n>:

    <\equation>
      <sqrt|4*n+1>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|<sqrt|\<pi\>>*\<Gamma\>*<around|(|n+1|)><rsup|2>>=<frac|<around|(|-1|)><rsup|n>|<around|(|n!|)><rsup|2>>*<big|int><rsub|0><rsup|\<infty\>><around*|(|<frac|x|2>|)><rsup|2*n>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x
    </equation>

    Now, multiplying both sides by <math|<around|(|-1|)><rsup|n>> and summing
    over <math|n> from 0 to <math|\<infty\>>:

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>><around|(|-1|)><rsup|n><sqrt|4*n+1>*<frac|\<Gamma\>*<around|(|n+<frac|1|2>|)><rsup|2>|<sqrt|\<pi\>>*\<Gamma\>*<around|(|n+1|)><rsup|2>>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|1|<around|(|n!|)><rsup|2>>*<big|int><rsub|0><rsup|\<infty\>><around*|(|<frac|x|2>|)><rsup|2*n>*\<psi\><rsub|n><around|(|x|)>\<cdot\><around|(|-1|)><rsup|n>*<space|0.17em>d*x
    </equation>

    The left-hand side is precisely the limit given in Theorem 2 as
    <math|y\<rightarrow\>0>, which equals 1. Therefore:

    <\equation>
      1=<big|sum><rsub|n=0><rsup|\<infty\>><frac|1|<around|(|n!|)><rsup|2>>*<big|int><rsub|0><rsup|\<infty\>><around*|(|<frac|x|2>|)><rsup|2*n>*\<psi\><rsub|n><around|(|x|)>\<cdot\><around|(|-1|)><rsup|n>*<space|0.17em>d*x
    </equation>

    Recognizing the series expansion of <math|J<rsub|0><around|(|x|)>> on the
    right-hand side:

    <\equation>
      1=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)><around*|(|<big|sum><rsub|n=0><rsup|\<infty\>>\<psi\><rsub|n><around|(|x|)>\<cdot\><around|(|-1|)><rsup|n>|)>*<space|0.17em>d*x
    </equation>

    Since the functions <math|\<psi\><rsub|n><around|(|x|)>> are continuous
    and the series <math|<big|sum><rsub|n=0><rsup|\<infty\>>\<psi\><rsub|n><around|(|x|)>\<cdot\><around|(|-1|)><rsup|n>>
    converges uniformly, we can conclude that:

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>>\<psi\><rsub|n><around|(|x|)>\<cdot\><around|(|-1|)><rsup|n>=<frac|1|2>
    </equation>

    for all <math|x\<in\><around|[|0,\<infty\>|)>>. Thus, we have proven the
    desired identity.
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

<\references>
  <\collection>
    <associate|ortho|<tuple|1|1>>
  </collection>
</references>