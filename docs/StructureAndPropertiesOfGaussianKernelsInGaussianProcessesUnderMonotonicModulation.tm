<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Structure and Properties of Gaussian Kernels in
  Gaussian Processes Under Monotonic <line-break>Modulation>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  \;

  <\definition>
    The standard Gaussian kernel <math|exp
    <around|(|-<around|(|t-s|)><rsup|2>|)>> admits modulation through
    strictly monotonic functions. Let <math|\<cal-F\>> denote the class of
    functions <math|f:\<bbb-R\><rsup|+>\<to\>\<bbb-R\>> satisfying:

    <\enumerate>
      <item><math|f\<in\>C<rsup|2><around|(|\<bbb-R\><rsup|+>|)>>

      <item><math|f> is strictly monotonically increasing

      <item><math|f<around|(|0|)>=0> (since <math|K*<around|(|t,t|)>=exp
      <around|(|-<around|(|f<around|(|t|)>-f<around|(|t|)>|)><rsup|2>|)>=1>
      for all <math|t>)

      <item><math|f<rprime|'>> is locally bounded and measurable

      <item><math|lim<rsub|t\<to\>\<infty\>> f<rprime|'><around|(|t|)>>
      exists (finite or infinite)
    </enumerate>
  </definition>

  <\theorem>
    [Mean Zero-Crossing Rate] For any <math|f\<in\>\<cal-F\>>, the stationary
    Gaussian process with modulated kernel

    <\equation*>
      K*<around|(|s,t|)>=exp <around|(|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>|)>
    </equation*>

    has mean zero-crossing rate:

    <\equation*>
      \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=f<around|(|T|)>
    </equation*>

    where <math|N<around|(|<around|[|0,T|]>|)>> denotes the counting measure
    of zeros in <math|<around|[|0,T|]>>.
  </theorem>

  <\proof>
    By the Kac-Rice formula:

    <\equation*>
      \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=<big|int><rsub|0><rsup|T><sqrt|-lim<rsub|s\<to\>t>
      <frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K*<around|(|s,t|)>>*d*t
    </equation*>

    Computing the derivatives:

    <\equation*>
      <frac|\<partial\>|\<partial\>*s>*K*<around|(|s,t|)>=2*<around|(|f<around|(|t|)>-f<around|(|s|)>|)>*f<rprime|'><around|(|s|)>*exp
      <around|(|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>|)>
    </equation*>

    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|<frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K*<around|(|s,t|)>=>|<cell|-2*f<rprime|'><around|(|t|)>*f<rprime|'><around|(|s|)>*exp
        <around|(|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>|)>>>|<row|<cell|>|<cell|+2*<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>*f<rprime|'><around|(|t|)>*f<rprime|'><around|(|s|)>*exp
        <around|(|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>|)>>>>>
      </aligned>
    </equation*>

    Taking the limit as <math|s\<to\>t>:

    <\equation*>
      lim<rsub|s\<to\>t> <frac|\<partial\><rsup|2>|\<partial\>*t*\<partial\>*s>*K*<around|(|s,t|)>=-<around|(|f<rprime|'><around|(|t|)>|)><rsup|2>
    </equation*>

    Therefore:

    <\equation*>
      \<bbb-E\><around|[|N<around|(|<around|[|0,T|]>|)>|]>=<big|int><rsub|0><rsup|T><around|\||f<rprime|'><around|(|t|)>|\|>*d*t=f<around|(|T|)>
    </equation*>
  </proof>

  <\theorem>
    [Eigenfunction Structure] For the modulated Gaussian kernel
    <math|K*<around|(|s,t|)>=exp <around|(|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>|)>>
    where <math|f\<in\>\<cal-F\>>, the eigenfunctions take the form:

    <\equation*>
      \<phi\><rsub|n><around|(|t|)>=c<rsub|n>*H<rsub|n><around|(|f<around|(|t|)>|)>*exp
      <around|(|-f<around|(|t|)><rsup|2>/2|)><sqrt|f<rprime|'><around|(|t|)>>
    </equation*>

    where <math|H<rsub|n>> are the Hermite polynomials, <math|c<rsub|n>> are
    normalization constants.
  </theorem>

  <\proof>
    The eigenfunction equation for kernel <math|K> is:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>exp
      <around|(|-<around|(|f<around|(|t|)>-f<around|(|s|)>|)><rsup|2>|)>*\<phi\><rsub|n><around|(|s|)>*d*s=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|t|)>
    </equation*>

    Under the change of variables <math|u=f<around|(|s|)>>,
    <math|v=f<around|(|t|)>>:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>exp
      <around|(|-<around|(|v-u|)><rsup|2>|)>*\<phi\><rsub|n><around|(|f<rsup|-1><around|(|u|)>|)><frac|d*u|f<rprime|'><around|(|f<rsup|-1><around|(|u|)>|)>>=\<lambda\><rsub|n>*\<phi\><rsub|n><around|(|f<rsup|-1><around|(|v|)>|)>
    </equation*>

    Let <math|\<psi\><rsub|n><around|(|u|)>=\<phi\><rsub|n><around|(|f<rsup|-1><around|(|u|)>|)><frac|1|<sqrt|f<rprime|'><around|(|f<rsup|-1><around|(|u|)>|)>>>>.
    Then:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>exp
      <around|(|-<around|(|v-u|)><rsup|2>|)>*\<psi\><rsub|n><around|(|u|)><sqrt|f<rprime|'><around|(|f<rsup|-1><around|(|u|)>|)>>*d*u=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|v|)><sqrt|f<rprime|'><around|(|f<rsup|-1><around|(|v|)>|)>>
    </equation*>

    This reduces to the standard Gaussian kernel eigenfunction equation:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>exp
      <around|(|-<around|(|v-u|)><rsup|2>|)>*\<psi\><rsub|n><around|(|u|)>*d*u=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|v|)>
    </equation*>

    Therefore <math|\<psi\><rsub|n><around|(|u|)>=H<rsub|n><around|(|u|)>*exp
    <around|(|-u<rsup|2>/2|)>>, giving:

    <\equation*>
      \<phi\><rsub|n><around|(|t|)>=c<rsub|n>*H<rsub|n><around|(|f<around|(|t|)>|)>*exp
      <around|(|-f<around|(|t|)><rsup|2>/2|)><sqrt|f<rprime|'><around|(|t|)>>
    </equation*>
  </proof>

  <\corollary>
    [Eigenvalues and Normalization Constants] The eigenvalues of the
    modulated Gaussian kernel are:

    <\equation*>
      \<lambda\><rsub|n>=<sqrt|\<pi\>>*2<rsup|-n>
    </equation*>

    and the normalization constants <math|c<rsub|n>> are given by:

    <\equation*>
      c<rsub|n>=<frac|1|<sqrt|n!2<rsup|n>*<sqrt|\<pi\>>>>
    </equation*>
  </corollary>

  <\proof>
    The eigenvalues remain unchanged under our transformation since:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>exp
      <around|(|-<around|(|v-u|)><rsup|2>|)>*\<psi\><rsub|n><around|(|u|)>*d*u=\<lambda\><rsub|n>*\<psi\><rsub|n><around|(|v|)>
    </equation*>

    is equivalent to the standard Gaussian kernel case where
    <math|\<lambda\><rsub|n>=<sqrt|\<pi\>>*2<rsup|-n>>.

    For the normalization constants, we require:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>\<phi\><rsub|n><around|(|t|)><rsup|2>*d*t=1
    </equation*>

    Substituting the form of <math|\<phi\><rsub|n>>:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>>c<rsub|n><rsup|2>*H<rsub|n><around|(|f<around|(|t|)>|)><rsup|2>*exp
      <around|(|-f<around|(|t|)><rsup|2>|)>*f<rprime|'><around|(|t|)>*d*t=1
    </equation*>

    Under the change of variables <math|u=f<around|(|t|)>>:

    <\equation*>
      c<rsub|n><rsup|2>*<big|int><rsub|0><rsup|\<infty\>>H<rsub|n><around|(|u|)><rsup|2>*exp
      <around|(|-u<rsup|2>|)>*d*u=1
    </equation*>

    Using the known normalization of Hermite polynomials:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>H<rsub|n><around|(|u|)><rsup|2>*exp
      <around|(|-u<rsup|2>|)>*d*u=n!2<rsup|n>*<sqrt|\<pi\>>
    </equation*>

    Therefore:

    <\equation*>
      c<rsub|n>=<frac|1|<sqrt|n!2<rsup|n>*<sqrt|\<pi\>>>>
    </equation*>
  </proof>

  <\remark>
    The invariance of eigenvalues under modulation is a profound connection
    to linear algebra. Just as eigenvalues are invariant under similarity
    transformations P<rsup|-1>AP, our modulation acts as a "continuous change
    of basis". The transformation operator

    <\equation*>
      <around|(|T*\<phi\>|)><around|(|t|)>=<sqrt|f<rprime|'><around|(|t|)>>*\<phi\><around|(|f<around|(|t|)>|)>
    </equation*>

    makes this explicit, as our kernel transformation is essentially a
    conjugation:

    <\equation*>
      K<rsub|f>=T<rsup|-1>*K<rsub|s*t*a*n*d*a*r*d>*T
    </equation*>

    The <math|<sqrt|f<rprime|'><around|(|t|)>>> terms act like the Jacobian
    of this transformation, perfectly balancing the change of measure to
    preserve spectral properties. While eigenfunctions transform (like
    eigenvectors under change of basis), the eigenvalues remain invariant - a
    beautiful infinite-dimensional analog of the basis-independence principle
    from linear algebra.
  </remark>
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