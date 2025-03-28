<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  \;

  \;

  <\lemma>
    <label|ortho>The functions

    <\equation*>
      \<psi\><rsub|n><around|(|y|)>=<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
    </equation*>

    are orthonormal over the interval <math|0> to <math|\<infty\>>, i.e.,

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|n><around|(|y|)>*\<psi\><rsub|m><around|(|y|)>*<space|0.17em>d*y=\<delta\><rsub|n*m>,
    </equation*>

    where <math|\<delta\><rsub|n*m>> is the Kronecker delta.
  </lemma>

  <\proof>
    Consider the integral

    <\equation*>
      I=<big|int><rsub|0><rsup|\<infty\>>\<psi\><rsub|n><around|(|y|)>*\<psi\><rsub|m><around|(|y|)>*<space|0.17em>d*y
    </equation*>

    Substituting <math|\<psi\><rsub|n><around|(|y|)>> and
    <math|\<psi\><rsub|m><around|(|y|)>>, we get:

    <\equation*>
      I=<big|int><rsub|0><rsup|\<infty\>><sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)><sqrt|<frac|4*m+1|y>>*<around|(|-1|)><rsup|m>*J<rsub|2*m+<frac|1|2>><around|(|y|)>*<space|0.17em>d*y
    </equation*>

    This simplifies to:

    <\equation*>
      I=<sqrt|<around|(|4*n+1|)>*<around|(|4*m+1|)>>*<around|(|-1|)><rsup|n+m>*<big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*n+<frac|1|2>><around|(|y|)>*J<rsub|2*m+<frac|1|2>><around|(|y|)>|y>*<space|0.17em>d*y
    </equation*>

    Using the orthogonality relation for Bessel functions with
    <math|\<nu\>=-<frac|1|2>>:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|\<nu\>+2*n+1><around|(|t|)>*J<rsub|\<nu\>+2*m+1><around|(|t|)>|t>*<space|0.17em>d*t=<frac|\<delta\><rsub|n*m>|2*<around|(|2*n+\<nu\>+1|)>>
    </equation*>

    for <math|\<nu\>=-<frac|1|2>>, we have:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>><frac|J<rsub|2*n+<frac|1|2>><around|(|t|)>*J<rsub|2*m+<frac|1|2>><around|(|t|)>|t>*<space|0.17em>d*t=<frac|\<delta\><rsub|n*m>|4*n+1>
    </equation*>

    Substituting this result back into the integral, we have:

    <\equation*>
      I=<sqrt|<around|(|4*n+1|)>*<around|(|4*m+1|)>>*<around|(|-1|)><rsup|n+m><frac|\<delta\><rsub|n*m>|4*n+1>
    </equation*>

    For <math|n\<neq\>m>, <math|\<delta\><rsub|n*m>=0>, yielding <math|I=0>.
    For <math|n=m>, <math|\<delta\><rsub|n*m>=1>, giving:

    <\equation*>
      I=<frac|<sqrt|<around|(|4*n+1|)><rsup|2>>|4*n+1>=<frac|4*n+1|4*n+1>=1
    </equation*>

    Hence, <math|\<psi\><rsub|n><around|(|y|)>> and
    <math|\<psi\><rsub|m><around|(|y|)>> are orthonormal.
  </proof>

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

  <\proof>
    To show that <math|\<psi\><rsub|n><around|(|y|)>> are eigenfunctions of
    the integral operator with kernel <math|J<rsub|0>*<around|(|x-y|)>> and
    to find the corresponding eigenvalues, we start with the given equation:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>J<rsub|0>*<around|(|x-y|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|y|)>
    </equation*>

    where

    <\equation*>
      \<psi\><rsub|n><around|(|y|)>=<sqrt|<frac|4*n+1|y>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|y|)>
    </equation*>

    and the eigenvalues are:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    To find <math|\<lambda\><rsub|n>>, we compute:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)>*\<psi\><rsub|n><around|(|x|)>*<space|0.17em>d*x
    </equation*>

    Substituting <math|\<psi\><rsub|n><around|(|x|)>>:

    <\equation*>
      \<lambda\><rsub|n>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|0><around|(|x|)><sqrt|<frac|4*n+1|x>>*<around|(|-1|)><rsup|n>*J<rsub|2*n+<frac|1|2>><around|(|x|)>*<space|0.17em>d*x
    </equation*>

    Using the integral of products of Bessel functions:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>x<rsup|-<frac|1|2>>*J<rsub|0><around|(|x|)>*J<rsub|2*n+<frac|1|2>><around|(|x|)>*<space|0.17em>d*x=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    Thus:

    <\equation*>
      \<lambda\><rsub|n>=<sqrt|<frac|4*n+1|\<pi\>>>*<frac|\<Gamma\>*<around*|(|n+<frac|1|2>|)><rsup|2>|\<Gamma\>*<around|(|n+1|)><rsup|2>>
    </equation*>

    This completes the proof that <math|\<psi\><rsub|n><around|(|y|)>> are
    eigenfunctions of the integral operator with kernel
    <math|J<rsub|0>*<around|(|x-y|)>> and the corresponding eigenvalues are
    as given.
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
    <associate|auto-1|<tuple|3|6>>
    <associate|bib-1|<tuple|1|6>>
    <associate|bib-2|<tuple|2|6>>
    <associate|bib-3|<tuple|3|6>>
    <associate|bib-4|<tuple|4|6>>
    <associate|bib-5|<tuple|5|6>>
    <associate|bib-6|<tuple|6|6>>
    <associate|bib-7|<tuple|7|6>>
    <associate|ortho|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>