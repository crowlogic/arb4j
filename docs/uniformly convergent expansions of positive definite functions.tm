<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Uniformly Convergent Expansions of Positive Definite
  Functions>|<doc-author|<author-data|<author-name|Stephen Crowley
  \<less\>stephencrowley214@gmail.com\<gtr\>>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\theorem>
    The covariance function <math|K<around|(|t|)>> of a stationary Gaussian
    process has a uniformly convergent expansion in terms of functions from
    the orthogonal complement of the null space of the inner product defined
    by <math|K>. This uniform convergence holds initially on the real line
    and extends to the entire complex plane.
  </theorem>

  <\proof>
    Let <math|<around|{|P<rsub|n><around|(|\<omega\>|)>|}><rsub|n=0><rsup|\<infty\>>>
    be the orthogonal polynomials with respect to the spectral density
    <math|S<around|(|\<omega\>|)>> of a stationary Gaussian process, and
    <math|<around|{|f<rsub|n><around|(|t|)>|}><rsub|n=0><rsup|\<infty\>>>
    their Fourier transforms defined as:

    <\equation>
      f<rsub|n><around|(|t|)>=<big|int>P<rsub|n><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<omega\>
    </equation>

    Let <math|K<around|(|t|)>> be the covariance function of the Gaussian
    process.

    1) First, the orthogonality of the polynomials
    <math|P<rsub|n><around|(|\<omega\>|)>> is established:

    a) By definition of orthogonal polynomials, for <math|m\<neq\>n>:

    <\equation>
      <big|int>P<rsub|m><around|(|\<omega\>|)>*P<rsub|n><around|(|\<omega\>|)>*S<around|(|\<omega\>|)>*d*\<omega\>=0
    </equation>

    b) The spectral density and covariance function form a Fourier transform
    pair:

    <\equation>
      K<around|(|t|)>=<big|int>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<omega\>
    </equation>

    2) The null space property of <math|<around|{|f<rsub|n><around|(|t|)>|}><rsub|n=1><rsup|\<infty\>>>
    is proven:

    a) Consider the inner product <math|<around|\<langle\>|f<rsub|n>,K|\<rangle\>>>
    for <math|n\<geq\>1>:

    <\equation>
      <around|\<langle\>|f<rsub|n>,K|\<rangle\>>=<big|int>f<rsub|n><around|(|t|)>*K<around|(|t|)>*d*t=<big|int>f<rsub|n><around|(|t|)><around*|(|<big|int>S<around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<omega\>|)>*d*t
    </equation>

    b) Applying Fubini's theorem:

    <\equation>
      <around|\<langle\>|f<rsub|n>,K|\<rangle\>>=<big|int>S<around|(|\<omega\>|)><around*|(|<big|int>f<rsub|n><around|(|t|)>*e<rsup|i*\<omega\>*t>*d*t|)>*d*\<omega\>=<big|int>S<around|(|\<omega\>|)>*P<rsub|n><around|(|\<omega\>|)>*d*\<omega\>=0
    </equation>

    Thus, <math|<around|{|f<rsub|n><around|(|t|)>|}><rsub|n=1><rsup|\<infty\>>>
    are in the null space of the inner product defined by <math|K>.

    3) The Gram-Schmidt process is applied to the Fourier transforms
    <math|<around|{|f<rsub|n><around|(|t|)>|}><rsub|n=0><rsup|\<infty\>>> to
    obtain an orthonormal basis <math|<around|{|g<rsub|n><around|(|t|)>|}><rsub|n=0><rsup|\<infty\>>>
    for the orthogonal complement of the null space:

    <\equation>
      <wide|g|~><rsub|0><around|(|t|)>=f<rsub|0><around|(|t|)>
    </equation>

    <\equation>
      g<rsub|0><around|(|t|)>=<frac|<wide|g|~><rsub|0><around|(|t|)>|<around|\<\|\|\>|<wide|g|~><rsub|0><around|(|t|)>|\<\|\|\>>>
    </equation>

    For <math|n\<geq\>1>:

    <\equation>
      <wide|g|~><rsub|n><around|(|t|)>=f<rsub|n><around|(|t|)>-<big|sum><rsub|k=0><rsup|n-1><around|\<langle\>|f<rsub|n>,g<rsub|k>|\<rangle\>>*g<rsub|k><around|(|t|)>
    </equation>

    <\equation>
      g<rsub|n><around|(|t|)>=<frac|<wide|g|~><rsub|n><around|(|t|)>|<around|\<\|\|\>|<wide|g|~><rsub|n><around|(|t|)>|\<\|\|\>>>
    </equation>

    where <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>>> and
    <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>> denote the
    norm and inner product induced by <math|K>, respectively.

    4) <math|K<around|(|t|)>> can be expressed in terms of this basis:

    <\equation>
      K<around|(|t|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<alpha\><rsub|n>*g<rsub|n><around|(|t|)>
    </equation>

    where <math|\<alpha\><rsub|n>=<around|\<langle\>|K,g<rsub|n>|\<rangle\>>>
    are the projections of <math|K> onto <math|g<rsub|n><around|(|t|)>>.

    5) The partial sum is defined as:

    <\equation>
      S<rsub|N><around|(|t|)>=<big|sum><rsub|n=0><rsup|N>\<alpha\><rsub|n>*g<rsub|n><around|(|t|)>
    </equation>

    6) The sequence of partial sums <math|S<rsub|N><around|(|t|)>> converges
    uniformly to <math|K<around|(|t|)>> in the canonical metric induced by
    the kernel as <math|N\<to\>\<infty\>>.

    7) To realize this, recall that the canonical metric is defined as:

    <\equation>
      d*<around|(|f,g|)>=<sqrt|<big|int><big|int><around|(|f<around|(|t|)>-g<around|(|t|)>|)>*<around|(|f<around|(|s|)>-g<around|(|s|)>|)>*K*<around|(|t-s|)>*d*t*d*s>
    </equation>

    8) The error in this metric is considered:

    <\equation>
      d*<around|(|K,S<rsub|N>|)><rsup|2>=<big|int><big|int><around|(|K<around|(|t|)>-S<rsub|N><around|(|t|)>|)>*<around|(|K<around|(|s|)>-S<rsub|N><around|(|s|)>|)>*K*<around|(|t-s|)>*d*t*d*s
    </equation>

    9) As the kernel operator is compact in this metric:

    For every positive epsilon, there exists an N (which depends on epsilon)
    less than n, such that the distance between K and S<rsub|n> is less than
    epsilon.

    <\equation>
      \<exists\>N<around|(|\<epsilon\>|)>\<less\>n:d*<around|(|K,S<rsub|n>|)>\<less\>\<epsilon\><space|1em>\<forall\>\<epsilon\>\<gtr\>0
    </equation>

    10) Extension to the Complex Plane:

    a) The covariance function <math|K<around|(|t|)>> of a stationary
    Gaussian process is positive definite and therefore analytic in the
    complex plane.

    b) The partial sum <math|S<rsub|N><around|(|t|)>> is a finite sum of
    analytic functions (as <math|g<rsub|n><around|(|t|)>> are analytic), and
    is thus analytic in the complex plane.

    c) The convergence of <math|S<rsub|N><around|(|t|)>> to
    <math|K<around|(|t|)>> on the real line is uniform, as shown in steps
    1-9.

    d) Consider any open disk D in the complex plane that intersects the real
    line. The intersection of D with the real line contains an accumulation
    point.

    e) By the Identity Theorem for analytic functions, since
    <math|K<around|(|t|)>> and <math|S<rsub|N><around|(|t|)>> agree on a set
    with an accumulation point within D (namely, the intersection of D with
    the real line), they must agree on the entire disk D.

    f) As this holds for any disk intersecting the real line, and such disks
    cover the entire complex plane, the uniform convergence of
    <math|S<rsub|N><around|(|t|)>> to <math|K<around|(|t|)>> extends to the
    entire complex plane.

    Thus, it has been shown that the covariance function
    <math|K<around|(|t|)>> has a uniformly convergent expansion in terms of
    functions from the orthogonal complement of the null space of the inner
    product defined by <math|K>. This uniform convergence holds initially on
    the real line and extends to the entire complex plane.
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