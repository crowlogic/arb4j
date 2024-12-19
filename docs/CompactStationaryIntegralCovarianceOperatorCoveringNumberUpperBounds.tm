<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  \;

  <doc-data|<doc-title|Upper Bounds on Covering Numbers for Stationary
  Covariance Kernels and Operators>|<doc-author|<author-data|<author-name|Stephen
  A. Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  Consider a stationary covariance kernel K with orthonormal expansion on
  L\<twosuperior\>(0,\<infty\>):

  <\equation>
    K<around|(|x|)>=<big|sum><rsub|i=0><rsup|\<infty\>><around|\<langle\>|K,\<psi\><rsub|i>|\<rangle\>>*\<psi\><rsub|i><around|(|x|)>
  </equation>

  The associated covariance operator T is self-adjoint due to stationarity:

  <\equation>
    T<around|(|f|)><around|(|y|)>=<big|int><rsub|0><rsup|\<infty\>>K*<around|(|x-y|)>*f<around|(|x|)>*d*x
  </equation>

  Define:

  <\itemize>
    <item>For kernel K:

    <\equation>
      N<rsub|K><around|(|\<varepsilon\>|)>=<text|min><around|{|n:<around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>\<leq\>\<varepsilon\>|}>
    </equation>

    \ where\ 

    <\equation>
      K<rsub|n><around|(|x|)>=<big|sum><rsub|i=0><rsup|n><around|\<langle\>|K,\<psi\><rsub|i>|\<rangle\>>*\<psi\><rsub|i><around|(|x|)>
    </equation>

    \ and

    <\equation>
      <around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>=max<rsub|x\<in\><around|[|0,\<infty\>|)>><around|\||K<around|(|x|)>-K<rsub|n><around|(|x|)>|\|>
    </equation>

    <item>For operator <math|T:>

    <\equation>
      N<rsub|T><around|(|\<varepsilon\>|)>=<text|min><around|{|n:<around|\<\|\|\>|T-T<rsub|n>|\<\|\|\>>\<leq\>\<varepsilon\>|}>
    </equation>

    \ where <math|T<rsub|n>> is the operator with kernel <math|K<rsub|n>> and
    <math|<around|\<\|\|\>|T|\<\|\|\>>> is the operator norm
  </itemize>

  Define:

  <\equation*>
    n<around|(|\<varepsilon\>|)>=<text|max><around|{|k:<around|\||<around|\<langle\>|K,\<psi\><rsub|k>|\<rangle\>>|\|>\<gtr\><sqrt|\<varepsilon\>>|}>
  </equation*>

  Note: The stationarity of K ensures that T is self-adjoint, which
  guarantees real eigenvalues and orthogonal eigenfunctions.

  <\theorem>
    For stationary kernel K,

    <\equation>
      N<rsub|K><around|(|\<varepsilon\>|)>=N<rsub|T><around|(|\<varepsilon\>|)>\<leq\>n<around|(|\<varepsilon\>|)>
    </equation>
  </theorem>

  <\proof>
    1. Kernel bound <math|N<rsub|K><around|(|\<varepsilon\>|)>\<leq\>n<around|(|\<varepsilon\>|)>>:

    <\equation>
      <around|\||K<around|(|x|)>-K<rsub|n<around|(|\<varepsilon\>|)>><around|(|x|)>|\|>=<around|\||<big|sum><rsub|i\<gtr\>n<around|(|\<varepsilon\>|)>><around|\<langle\>|K,\<psi\><rsub|i>|\<rangle\>>*\<psi\><rsub|i><around|(|x|)>|\|>
    </equation>

    By Cauchy-Schwarz:

    <\equation>
      \<leq\><sqrt|<big|sum><rsub|i\<gtr\>n<around|(|\<varepsilon\>|)>><around|\||<around|\<langle\>|K,\<psi\><rsub|i>|\<rangle\>>|\|><rsup|2>>*<sqrt|<big|sum><rsub|i\<gtr\>n<around|(|\<varepsilon\>|)>><around|\||\<psi\><rsub|i><around|(|x|)>|\|><rsup|2>>
    </equation>

    Since <math|<around|{|\<psi\><rsub|i>|}>> is orthonormal,
    <math|<around|\||\<psi\><rsub|i><around|(|x|)>|\|>\<leq\>1> and
    <math|<big|sum><around|\||\<psi\><rsub|i><around|(|x|)>|\|><rsup|2>\<leq\>1>
    By definition of <math|n<around|(|\<varepsilon\>|)>>,
    <math|<around|\||<around|\<langle\>|K,\<psi\><rsub|i>|\<rangle\>>|\|>\<leq\><sqrt|\<varepsilon\>>>
    for <math|i\<gtr\>n<around|(|\<varepsilon\>|)>> Therefore:

    <\equation>
      <around|\<\|\|\>|K-K<rsub|n<around|(|\<varepsilon\>|)>>|\<\|\|\>><rsub|\<infty\>>\<leq\>\<varepsilon\>
    </equation>

    2. Operator bound <math|<around|\<\|\|\>|T-T<rsub|n>|\<\|\|\>>\<leq\><around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>>:
    For any <math|f> with <math|<around|\<\|\|\>|f|\<\|\|\>>\<leq\>1>:

    <\equation>
      <around|\<\|\|\>|T<around|(|f|)>-T<rsub|n><around|(|f|)>|\<\|\|\>>\<leq\><around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>><around|\<\|\|\>|f|\<\|\|\>>\<leq\><around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>
    </equation>

    3. Reverse inequality

    <\equation>
      <around|\<\|\|\>|T-T<rsub|n>|\<\|\|\>>\<geq\><around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>
    </equation>

    : Using stationarity, for any <math|x<rsub|0>>, construct
    <math|f<rsub|x<rsub|0>>> as follows:

    <\equation>
      f<rsub|x<rsub|0>><around|(|x|)>=<frac|\<phi\><around*|(|<frac|x-x<rsub|0>|\<delta\>>|)>|<sqrt|\<delta\>>>*
    </equation>

    where: - <math|\<phi\>> is a smooth bump function with support in [-1,1]
    and <math|<around|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|L<rsup|2>>=1> -
    <math|\<delta\>\<gtr\>0> is chosen small enough

    Then by stationarity of K:

    <\equation>
      lim<rsub|\<delta\>\<to\>0><around|(|T-T<rsub|n>|)><around|(|f<rsub|x<rsub|0>>|)><around|(|x<rsub|0>|)>=<around|(|K-K<rsub|n>|)><around|(|x<rsub|0>|)>
    </equation>

    Since <math|<around|\<\|\|\>|f<rsub|x<rsub|0>>|\<\|\|\>>=1> by
    construction, this shows:

    <\equation>
      <around|\<\|\|\>|T-T<rsub|n>|\<\|\|\>>\<geq\><around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>
    </equation>

    Therefore

    <\equation>
      <around|\<\|\|\>|T-T<rsub|n>|\<\|\|\>>=<around|\<\|\|\>|K-K<rsub|n>|\<\|\|\>><rsub|\<infty\>>
    </equation>

    establishing

    <\equation>
      N<rsub|K><around|(|\<varepsilon\>|)>=N<rsub|T><around|(|\<varepsilon\>|)>
    </equation>

    The stationarity of K is essential for the construction in step 3, as it
    ensures translation invariance and allows the limit argument to work.
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