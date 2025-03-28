<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Proof of Uniform Convergence of a Sequence of
  Orthogonal Functions to the Bessel function of the First Kind of Order
  0>|<doc-author|<author-data|<author-name|Stephen
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
    <\em>
      The partial sums <math|S<rsub|N><around|(|y|)>> defined by

      <\equation>
        S<rsub|N><around|(|y|)>=<sqrt|<frac|2|\<pi\>>>*<big|sum><rsub|k=0><rsup|N><frac|\<psi\><rsub|k><around|(|y|)>|<around*|(|<frac|1|2>+k|)><rsup|2><rsub|<frac|1|2>>>
      </equation>

      uniformly converge to the Bessel function of the first kind of order
      zero, <math|J<rsub|0><around|(|y|)>>, as <math|N\<to\>\<infty\>>.
    </em>
  </theorem>

  <\proof>
    <\em>
      From the orthonormality established in Lemma (<reference|ortho>),
      consider the squared difference between <math|J<rsub|0><around|(|y|)>>
      and <math|S<rsub|N><around|(|y|)>>:

      <\equation>
        <around|\||J<rsub|0><around|(|y|)>-S<rsub|N><around|(|y|)>|\|><rsup|2>=<around*|\||<sqrt|<frac|2|\<pi\>>>*<big|sum><rsub|k=N+1><rsup|\<infty\>><frac|\<psi\><rsub|k><around|(|y|)>|<around*|(|<frac|1|2>+k|)><rsup|2><rsub|<frac|1|2>>>|\|><rsup|2>
      </equation>

      Using the Cauchy-Schwarz inequality and the orthonormality of
      <math|\<psi\><rsub|k><around|(|y|)>>, this can be bounded as:

      <\equation>
        <around|\||J<rsub|0><around|(|y|)>-S<rsub|N><around|(|y|)>|\|><rsup|2>\<leq\><frac|2|\<pi\>>*<big|sum><rsub|k=N+1><rsup|\<infty\>><frac|1|<around*|(|<frac|1|2>+k|)><rsup|4>>
      </equation>

      Using the trigamma function to express the tail sum, we have the limit

      <\equation>
        lim<rsub|N\<rightarrow\>\<infty\>><frac|2|\<pi\>>*<big|sum><rsub|k=N+1><rsup|\<infty\>><frac|1|<around*|(|<frac|1|2>+k|)><rsup|4>>=lim<rsub|N\<rightarrow\>\<infty\>><frac|\<Psi\><around|(|3,<frac|3|2>+N|)>|3
        \<pi\>>=0*
      </equation>

      as <math|N\<rightarrow\>\<infty\>> thus confirming uniform convergence.
    </em>
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
    <associate|ortho|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_44.tm>>
  </collection>
</references>