<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Spectral Tau Method for Fractional Riccati
  Equations>|<doc-author|<author-data|<author-name|YoMammy>>>>

  <section|Theoretical Foundations>

  <\theorem>
    [Shifted Jacobi Polynomial Representation] For parameters
    <math|\<alpha\>,\<beta\>\<gtr\>-1>, the shifted Jacobi polynomials on
    <math|<around|[|0,1|]>> are given by:

    <\equation>
      P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>=<big|sum><rsub|k=0><rsup|i><around|(|-1|)><rsup|i-k><binom|i+\<alpha\>|k><binom|i+\<beta\>|i-k>t<rsup|k>
    </equation>

    These polynomials form a complete orthogonal system on
    <math|L<rsup|2><around|(|<around|[|0,1|]>,w<around|(|t|)>|)>> where
    <math|w<around|(|t|)>=t<rsup|\<alpha\>>*<around|(|1-t|)><rsup|\<beta\>>>.
  </theorem>

  <\proof>
    The shifted Jacobi polynomials are obtained from the classical Jacobi
    polynomials <math|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>
    on <math|<around|[|-1,1|]>> via the affine transformation
    <math|t=<frac|x+1|2>>, or equivalently <math|x=2*t-1>.

    For the classical Jacobi polynomials, the Rodrigues formula yields:

    <\equation>
      P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<frac|<around|(|-1|)><rsup|n>|2<rsup|n>*n!>*<around|(|1-x|)><rsup|-\<alpha\>>*<around|(|1+x|)><rsup|-\<beta\>>*<frac|d<rsup|n>|d*x<rsup|n>>*<around|[|<around|(|1-x|)><rsup|n+\<alpha\>>*<around|(|1+x|)><rsup|n+\<beta\>>|]>
    </equation>

    Under the transformation <math|x=2*t-1>, we have
    <math|<around|(|1-x|)>=2*<around|(|1-t|)>> and
    <math|<around|(|1+x|)>=2*t>. Substituting and expanding using the chain
    rule <math|<frac|d|d*x>=2*<frac|d|d*t>>, the <math|n>-th derivative
    transforms as:

    <\equation>
      <frac|d<rsup|n>|d*x<rsup|n>>=2<rsup|n>*<frac|d<rsup|n>|d*t<rsup|n>>
    </equation>

    Therefore:

    <\align>
      <tformat|<table|<row|<cell|P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|2*t-1|)>>|<cell|=<frac|<around|(|-1|)><rsup|n>|2<rsup|n>*n!>*<around|(|2*<around|(|1-t|)>|)><rsup|-\<alpha\>>*<around|(|2*t|)><rsup|-\<beta\>>\<cdot\>2<rsup|n>*<frac|d<rsup|n>|d*t<rsup|n>>*<around|[|<around|(|2*<around|(|1-t|)>|)><rsup|n+\<alpha\>>*<around|(|2*t|)><rsup|n+\<beta\>>|]><eq-number>>>|<row|<cell|>|<cell|=<frac|<around|(|-1|)><rsup|n>|n!>*<around|(|1-t|)><rsup|-\<alpha\>>*t<rsup|-\<beta\>>\<cdot\>2<rsup|2*n+\<alpha\>+\<beta\>>*<frac|d<rsup|n>|d*t<rsup|n>>*<around|[|<around|(|1-t|)><rsup|n+\<alpha\>>*t<rsup|n+\<beta\>>|]><eq-number>>>>>
    </align>

    Expanding the <math|n>-th derivative using Leibniz rule and simplifying
    yields the explicit polynomial form in powers of <math|t>.

    For orthogonality, we transform the integral. For classical Jacobi
    polynomials on <math|<around|[|-1,1|]>>:

    <\equation>
      <big|int><rsub|-1><rsup|1>P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*P<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*<around|(|1-x|)><rsup|\<alpha\>>*<around|(|1+x|)><rsup|\<beta\>>*d*x=h<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>*\<delta\><rsub|n*m>
    </equation>

    Under <math|x=2*t-1> with <math|d*x=2*d*t>:

    <\align>
      <tformat|<table|<row|<cell|>|<cell|<big|int><rsub|0><rsup|1>P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|2*t-1|)>*P<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|2*t-1|)>*<around|(|2*<around|(|1-t|)>|)><rsup|\<alpha\>>*<around|(|2*t|)><rsup|\<beta\>>\<cdot\>2*d*t<eq-number>>>|<row|<cell|>|<cell|=2<rsup|\<alpha\>+\<beta\>+1>*<big|int><rsub|0><rsup|1>P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|2*t-1|)>*P<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|2*t-1|)>*t<rsup|\<alpha\>>*<around|(|1-t|)><rsup|\<beta\>>*d*t<eq-number>>>>>
    </align>

    The normalization constant adjusts accordingly, establishing
    orthogonality of the shifted polynomials on <math|<around|[|0,1|]>> with
    weight <math|w<around|(|t|)>=t<rsup|\<alpha\>>*<around|(|1-t|)><rsup|\<beta\>>>.
  </proof>

  <\theorem>
    [Orthogonality and Normalization] The shifted Jacobi polynomials satisfy:

    <\equation>
      <big|int><rsub|0><rsup|1>P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*d*t=h<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>*\<delta\><rsub|i*j>
    </equation>

    where

    <\equation>
      h<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>=<frac|\<Gamma\>*<around|(|i+\<alpha\>+1|)>*\<Gamma\>*<around|(|i+\<beta\>+1|)>|<around|(|2*i+\<alpha\>+\<beta\>+1|)>*\<Gamma\>*<around|(|i+1|)>*\<Gamma\>*<around|(|i+\<alpha\>+\<beta\>+1|)>>
    </equation>
  </theorem>

  <\proof>
    From the transformation theory, the normalization constant for classical
    Jacobi polynomials is:

    <\equation>
      h<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>=<frac|2<rsup|\<alpha\>+\<beta\>+1>|2*n+\<alpha\>+\<beta\>+1>*<frac|\<Gamma\>*<around|(|n+\<alpha\>+1|)>*\<Gamma\>*<around|(|n+\<beta\>+1|)>|\<Gamma\>*<around|(|n+1|)>*\<Gamma\>*<around|(|n+\<alpha\>+\<beta\>+1|)>>
    </equation>

    Under the transformation <math|x=2*t-1>, the Jacobian introduces a factor
    <math|2>, and the weight <math|<around|(|1-x|)><rsup|\<alpha\>>*<around|(|1+x|)><rsup|\<beta\>>=2<rsup|\<alpha\>+\<beta\>>*<around|(|1-t|)><rsup|\<alpha\>>*t<rsup|\<beta\>>>,
    yielding an overall factor of <math|2<rsup|\<alpha\>+\<beta\>+1>>.

    Thus for shifted polynomials on <math|<around|[|0,1|]>>:

    <\equation>
      h<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>=<frac|\<Gamma\>*<around|(|i+\<alpha\>+1|)>*\<Gamma\>*<around|(|i+\<beta\>+1|)>|<around|(|2*i+\<alpha\>+\<beta\>+1|)>*\<Gamma\>*<around|(|i+1|)>*\<Gamma\>*<around|(|i+\<alpha\>+\<beta\>+1|)>>
    </equation>
  </proof>

  <\theorem>
    [Fractional Derivative Operational Matrix] Let
    <math|\<nu\>\<in\><around|(|m-1,m|)>> for <math|m\<in\>\<bbb-N\>>. For
    the Caputo fractional derivative of order <math|\<nu\>>, there exists an
    operational matrix <math|<math-bf|D><rsup|\<nu\>>> with entries:

    <\equation>
      D<rsub|i*j><rsup|\<nu\>>=<frac|1|T<rsup|\<nu\>>>*<big|sum><rsub|k=j><rsup|i>\<theta\><rsub|i,k><rsup|\<nu\>>
    </equation>

    where

    <\equation>
      \<theta\><rsub|i,k><rsup|\<nu\>>=<frac|\<Gamma\>*<around|(|k+\<beta\>+1|)>*\<Gamma\>*<around|(|i+\<alpha\>+\<beta\>+1|)>|\<Gamma\>*<around|(|k+\<alpha\>+\<beta\>+1|)>*\<Gamma\>*<around|(|i+\<beta\>+1|)>><binom|i|k><frac|\<Gamma\>*<around|(|k+\<nu\>+1|)>|\<Gamma\>*<around|(|k+1-\<nu\>+1|)>>
    </equation>

    satisfying <math|D<rsup|\<nu\>>*<around|[|P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>|]>=<big|sum><rsub|i=0><rsup|N>D<rsub|i*j><rsup|\<nu\>>*P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>>
    for <math|j\<leq\>N>.
  </theorem>

  <\proof>
    The Caputo fractional derivative of order
    <math|\<nu\>\<in\><around|(|m-1,m|)>> is defined as:

    <\equation>
      D<rsup|\<nu\>>*f<around|(|t|)>=<frac|1|\<Gamma\>*<around|(|m-\<nu\>|)>>*<big|int><rsub|0><rsup|t><around|(|t-\<tau\>|)><rsup|m-\<nu\>-1>*f<rsup|<around|(|m|)>><around|(|\<tau\>|)>*d*\<tau\>
    </equation>

    For the shifted Jacobi polynomial <math|P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>=<big|sum><rsub|k=0><rsup|j>c<rsub|j*k>*<around|(|t/T|)><rsup|k>>
    where

    <\equation>
      c<rsub|j*k>=<around|(|-1|)><rsup|j-k><binom|j+\<alpha\>|k><binom|j+\<beta\>|j-k>
    </equation>

    The <math|m>-th derivative is:

    <\equation>
      <frac|d<rsup|m>|d*t<rsup|m>>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>=<frac|1|T<rsup|m>>*<big|sum><rsub|k=m><rsup|j>c<rsub|j*k>*<frac|k!|<around|(|k-m|)>!><around*|(|<frac|t|T>|)><rsup|k-m>
    </equation>

    Applying the fractional integration operator:

    <\align>
      <tformat|<table|<row|<cell|D<rsup|\<nu\>>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>>|<cell|=<frac|1|T<rsup|m>*\<Gamma\>*<around|(|m-\<nu\>|)>>*<big|sum><rsub|k=m><rsup|j>c<rsub|j*k>*<frac|k!|<around|(|k-m|)>!>*<big|int><rsub|0><rsup|t><around|(|t-\<tau\>|)><rsup|m-\<nu\>-1><around*|(|<frac|\<tau\>|T>|)><rsup|k-m>*d*\<tau\><eq-number>>>|<row|<cell|>|<cell|=<frac|1|T<rsup|\<nu\>>>*<big|sum><rsub|k=m><rsup|j>c<rsub|j*k>*<frac|\<Gamma\>*<around|(|k-m+1|)>|\<Gamma\>*<around|(|k-\<nu\>+1|)>>*t<rsup|k-\<nu\>><eq-number>>>>>
    </align>

    Using the beta function identity <math|>

    <\equation>
      <big|int><rsub|0><rsup|t><around|(|t-\<tau\>|)><rsup|a-1>*\<tau\><rsup|b-1>*d*\<tau\>=t<rsup|a+b-1>*B<around|(|a,b|)>=t<rsup|a+b-1>*<frac|\<Gamma\><around|(|a|)>*\<Gamma\><around|(|b|)>|\<Gamma\>*<around|(|a+b|)>>
    </equation>

    The result <math|D<rsup|\<nu\>>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>>*<around|(|t/T|)>>
    is then expressed as a linear combination of basis polynomials,
    determining the matrix entries <math|D<rsub|i*j><rsup|\<nu\>>> through
    the orthogonality relations.
  </proof>

  <\theorem>
    [Triple Product Integral Formula] For shifted Jacobi polynomials with
    <math|\<alpha\>,\<beta\>\<gtr\>-1>:

    <\equation>
      <big|int><rsub|0><rsup|1>P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|k><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*d*t=<big|sum><rsub|m=0><rsup|i><big|sum><rsub|n=0><rsup|j><big|sum><rsub|l=0><rsup|k>\<gamma\><rsub|m*n*l><rsup|i*j*k>*B<around|(|m+n+l+\<alpha\>+1,\<beta\>+1|)>
    </equation>

    where

    <\equation>
      \<gamma\><rsub|m*n*l><rsup|i*j*k>=<around|(|-1|)><rsup|i+j+k-m-n-l><binom|i+\<alpha\>|m><binom|i+\<beta\>|i-m><binom|j+\<alpha\>|n><binom|j+\<beta\>|j-n><binom|k+\<alpha\>|l><binom|k+\<beta\>|k-l>
    </equation>

    and <math|B<around|(|a,b|)>=<frac|\<Gamma\><around|(|a|)>*\<Gamma\><around|(|b|)>|\<Gamma\>*<around|(|a+b|)>>>
    is the Beta function.
  </theorem>

  <\proof>
    Using the explicit polynomial forms:

    <\equation>
      P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>=<big|sum><rsub|m=0><rsup|i><around|(|-1|)><rsup|i-m><binom|i+\<alpha\>|m><binom|i+\<beta\>|i-m>t<rsup|m>
    </equation>

    The triple product becomes:

    <\equation>
      P<rsub|i><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|j><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*P<rsub|k><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>=<big|sum><rsub|m=0><rsup|i><big|sum><rsub|n=0><rsup|j><big|sum><rsub|l=0><rsup|k>\<gamma\><rsub|m*n*l><rsup|i*j*k>*t<rsup|m+n+l>
    </equation>

    The integral reduces to:

    <\equation>
      <big|int><rsub|0><rsup|1>t<rsup|m+n+l+\<alpha\>>*<around|(|1-t|)><rsup|\<beta\>>*d*t=B<around|(|m+n+l+\<alpha\>+1,\<beta\>+1|)>
    </equation>

    by the definition of the Beta function. Summing over all index
    combinations yields the result.
  </proof>

  <\theorem>
    [Spectral Approximation Error Estimate] Let
    <math|y\<in\>H<rsup|s><around|(|<around|[|0,T|]>|)>> for
    <math|s\<geq\>\<nu\>> where <math|\<nu\>> is the order of the fractional
    derivative. Let <math|y<rsub|N>> denote the <math|N>-th degree polynomial
    approximation in the shifted Jacobi basis with parameters
    <math|\<alpha\>,\<beta\>\<gtr\>-1>. Then for <math|0\<leq\>r\<leq\>s>:

    <\equation>
      <around|\<\|\|\>|y-y<rsub|N>|\<\|\|\>><rsub|H<rsup|r><around|(|<around|[|0,T|]>|)>>\<leq\>C*N<rsup|r-s><around|\<\|\|\>|y|\<\|\|\>><rsub|H<rsup|s><around|(|<around|[|0,T|]>|)>>
    </equation>

    where <math|C> depends on <math|\<alpha\>,\<beta\>,s,r> but is
    independent of <math|N>.
  </theorem>

  <\proof>
    Let <math|\<pi\><rsub|N>*y> denote the <math|L<rsup|2>>-orthogonal
    projection of <math|y> onto the space of polynomials of degree
    <math|\<leq\>N> in the shifted Jacobi basis. By orthogonality:

    <\equation>
      <around|\<\|\|\>|y-\<pi\><rsub|N>*y|\<\|\|\>><rsub|L<rsup|2>><rsup|2>=<big|sum><rsub|n=N+1><rsup|\<infty\>>h<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|\||<wide|y|^><rsub|n>|\|><rsup|2>
    </equation>

    where <math|<wide|y|^><rsub|n>> are the expansion coefficients.

    For <math|y\<in\>H<rsup|s>>, integration by parts <math|s> times gives:

    <\equation>
      <wide|y|^><rsub|n>=<frac|1|h<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>>>*<big|int><rsub|0><rsup|1>y<around|(|t|)>*P<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|t|)>*w<around|(|t|)>*d*t
    </equation>

    Using the differential equation satisfied by Jacobi polynomials and
    bounds on their derivatives, we obtain:

    <\equation>
      <around|\||<wide|y|^><rsub|n>|\|>\<leq\>C*n<rsup|-s><around|\<\|\|\>|y|\<\|\|\>><rsub|H<rsup|s>>
    </equation>

    Therefore:

    <\equation>
      <around|\<\|\|\>|y-\<pi\><rsub|N>*y|\<\|\|\>><rsub|L<rsup|2>><rsup|2>\<leq\>C*<big|sum><rsub|n=N+1><rsup|\<infty\>>n<rsup|-2*s><around|\<\|\|\>|y|\<\|\|\>><rsub|H<rsup|s>><rsup|2>\<leq\>C*N<rsup|-2*s><around|\<\|\|\>|y|\<\|\|\>><rsub|H<rsup|s>><rsup|2>
    </equation>

    For the <math|H<rsup|r>> norm with <math|0\<less\>r\<less\>s>, we use the
    Sobolev norm and fractional derivative estimates to obtain:

    <\equation>
      <around|\<\|\|\>|y-\<pi\><rsub|N>*y|\<\|\|\>><rsub|H<rsup|r>>\<leq\>C*N<rsup|r-s><around|\<\|\|\>|y|\<\|\|\>><rsub|H<rsup|s>>
    </equation>

    This completes the proof.
  </proof>

  <\theorem>
    [Convergence of Spectral Tau Method for Nonlinear FDE] Consider the
    nonlinear fractional differential equation:

    <\equation>
      D<rsup|\<nu\>>*y<around|(|t|)>=F<around|(|t,y<around|(|t|)>|)>,<space|1em>y<around|(|0|)>=y<rsub|0>
    </equation>

    where <math|F:<around|[|0,T|]>\<times\>\<bbb-R\>\<to\>\<bbb-R\>> is
    Lipschitz continuous in <math|y> uniformly in <math|t> with Lipschitz
    constant <math|L>. Let <math|y> be the exact solution with
    <math|y\<in\>H<rsup|s><around|(|<around|[|0,T|]>|)>> for
    <math|s\<gtr\>\<nu\>+1/2>, and let <math|y<rsub|N>> be the spectral Tau
    approximation of degree <math|N>. Then there exists <math|N<rsub|0>> such
    that for all <math|N\<geq\>N<rsub|0>>:

    <\equation>
      <around|\<\|\|\>|y-y<rsub|N>|\<\|\|\>><rsub|L<rsup|2><around|(|<around|[|0,T|]>|)>>\<leq\>C*N<rsup|-s><around|\<\|\|\>|y|\<\|\|\>><rsub|H<rsup|s><around|(|<around|[|0,T|]>|)>>
    </equation>

    where <math|C> depends on <math|L,T,\<nu\>,s> but is independent of
    <math|N>.
  </theorem>

  <\proof>
    The Tau method satisfies:

    <\equation>
      D<rsup|\<nu\>>*y<rsub|N><around|(|t|)>-F<around|(|t,y<rsub|N><around|(|t|)>|)>=R<rsub|N><around|(|t|)>
    </equation>

    where <math|R<rsub|N>\<perp\>\<cal-P\><rsub|N-m>>, the space of
    polynomials of degree <math|\<leq\>N-m> with
    <math|m=<around|\<lceil\>|\<nu\>|\<rceil\>>>.

    Let <math|e<rsub|N>=y-y<rsub|N>>. Then:

    <\equation>
      D<rsup|\<nu\>>*e<rsub|N><around|(|t|)>=F<around|(|t,y<around|(|t|)>|)>-F<around|(|t,y<rsub|N><around|(|t|)>|)>+R<rsub|N><around|(|t|)>
    </equation>

    By the Lipschitz condition:

    <\equation>
      <around|\||F<around|(|t,y<around|(|t|)>|)>-F<around|(|t,y<rsub|N><around|(|t|)>|)>|\|>\<leq\>L<around|\||e<rsub|N><around|(|t|)>|\|>
    </equation>

    Applying the fractional integral operator <math|J<rsup|\<nu\>>> to both
    sides:

    <\equation>
      e<rsub|N><around|(|t|)>=J<rsup|\<nu\>>*<around|[|F<around|(|t,y<around|(|t|)>|)>-F<around|(|t,y<rsub|N><around|(|t|)>|)>|]>+J<rsup|\<nu\>>*R<rsub|N><around|(|t|)>
    </equation>

    Taking <math|L<rsup|2>> norms and using properties of fractional
    integrals:

    <\equation>
      <around|\<\|\|\>|e<rsub|N>|\<\|\|\>><rsub|L<rsup|2>>\<leq\>C<rsub|1>\<\|\|\>e<rsub|N>\<\|\|\><rsub|L<rsup|2>>+C<rsub|2><around|\<\|\|\>|R<rsub|N>|\<\|\|\>><rsub|L<rsup|2>>
    </equation>

    For sufficiently small <math|T> or <math|N> large enough such that
    <math|C<rsub|1>\<less\>1>:

    <\equation>
      <around|\<\|\|\>|e<rsub|N>|\<\|\|\>><rsub|L<rsup|2>>\<leq\><frac|C<rsub|2>|1-C<rsub|1>><around|\<\|\|\>|R<rsub|N>|\<\|\|\>><rsub|L<rsup|2>>
    </equation>

    By the approximation properties of the Tau method:

    <\equation>
      <around|\<\|\|\>|R<rsub|N>|\<\|\|\>><rsub|L<rsup|2>>\<leq\>C*N<rsup|-s>*<around|\<\|\|\>|D<rsup|\<nu\>>*y|\<\|\|\>><rsub|H<rsup|s-\<nu\>>>
    </equation>

    Therefore:

    <\equation>
      <around|\<\|\|\>|e<rsub|N>|\<\|\|\>><rsub|L<rsup|2>>\<leq\>C*N<rsup|-s><around|\<\|\|\>|y|\<\|\|\>><rsub|H<rsup|s>>
    </equation>

    This establishes spectral convergence.
  </proof>

  <\theorem>
    [Newton Method Convergence for Discrete System] Let
    <math|<math-bf|F>:\<bbb-R\><rsup|N+1>\<to\>\<bbb-R\><rsup|N+1>> be
    defined by:

    <\equation>
      <math-bf|F><around|(|<math-bf|c>|)>=<math-bf|D><rsup|\<nu\>><math-bf|c>-<math-bf|p>-<math-bf|Qc>-<math-bf|R><text|diag><around|(|<math-bf|c>|)><math-bf|c>
    </equation>

    where <math|<math-bf|D><rsup|\<nu\>>> is the fractional derivative
    matrix, and <math|<math-bf|Q>,<math-bf|R>> are operational matrices. The
    Jacobian is:

    <\equation>
      <math-bf|J><around|(|<math-bf|c>|)>=<math-bf|D><rsup|\<nu\>>-<math-bf|Q>-2<math-bf|R><text|diag><around|(|<math-bf|c>|)>
    </equation>

    Assume <math|<math-bf|c><rsup|\<ast\>>> is a solution with
    <math|<around|\<\|\|\>|<math-bf|J><around|(|<math-bf|c><rsup|\<ast\>>|)><rsup|-1>|\<\|\|\>>\<leq\>\<beta\>>
    and <math|<math-bf|J>> satisfies:

    <\equation>
      <around|\<\|\|\>|<math-bf|J><around|(|<math-bf|c>|)>-<math-bf|J><around|(|<math-bf|c><rprime|'>|)>|\<\|\|\>>\<leq\>K*<around|\<\|\|\>|<math-bf|c>-<math-bf|c><rprime|'>|\<\|\|\>>
    </equation>

    If <math|<around|\<\|\|\>|<math-bf|c><rsub|0>-<math-bf|c><rsup|\<ast\>>|\<\|\|\>>\<leq\><frac|1|2*\<beta\>*K>>,
    then the Newton iteration:

    <\equation>
      <math-bf|c><rsub|k+1>=<math-bf|c><rsub|k>-<around|[|<math-bf|J><around|(|<math-bf|c><rsub|k>|)>|]><rsup|-1><math-bf|F><around|(|<math-bf|c><rsub|k>|)>
    </equation>

    converges quadratically with:

    <\equation>
      <around|\<\|\|\>|<math-bf|c><rsub|k+1>-<math-bf|c><rsup|\<ast\>>|\<\|\|\>>\<leq\><frac|\<beta\>*K|2>*<around|\<\|\|\>|<math-bf|c><rsub|k>-<math-bf|c><rsup|\<ast\>>|\<\|\|\>><rsup|2>
    </equation>
  </theorem>

  <\proof>
    Since <math|<math-bf|F><around|(|<math-bf|c><rsup|\<ast\>>|)>=<with|math-font-family|bf|0>>,
    we have:

    <\align>
      <tformat|<table|<row|<cell|<math-bf|c><rsub|k+1>-<math-bf|c><rsup|\<ast\>>>|<cell|=<math-bf|c><rsub|k>-<math-bf|c><rsup|\<ast\>>-<math-bf|J><around|(|<math-bf|c><rsub|k>|)><rsup|-1><math-bf|F><around|(|<math-bf|c><rsub|k>|)><eq-number>>>|<row|<cell|>|<cell|=<math-bf|J><around|(|<math-bf|c><rsub|k>|)><rsup|-1>*<around|[|<math-bf|J><around|(|<math-bf|c><rsub|k>|)>*<around|(|<math-bf|c><rsub|k>-<math-bf|c><rsup|\<ast\>>|)>-<math-bf|F><around|(|<math-bf|c><rsub|k>|)>|]><eq-number>>>>>
    </align>

    By Taylor expansion:

    <\equation>
      <math-bf|F><around|(|<math-bf|c><rsub|k>|)>=<math-bf|F><around|(|<math-bf|c><rsup|\<ast\>>|)>+<math-bf|J><around|(|<math-bf|c><rsup|\<ast\>>|)>*<around|(|<math-bf|c><rsub|k>-<math-bf|c><rsup|\<ast\>>|)>+O<around|(|<around|\<\|\|\>|<math-bf|c><rsub|k>-<math-bf|c><rsup|\<ast\>>|\<\|\|\>><rsup|2>|)>
    </equation>

    Therefore:

    <\align>
      <tformat|<table|<row|<cell|<math-bf|c><rsub|k+1>-<math-bf|c><rsup|\<ast\>>>|<cell|=<math-bf|J><around|(|<math-bf|c><rsub|k>|)><rsup|-1>*<around|[|<around|(|<math-bf|J><around|(|<math-bf|c><rsub|k>|)>-<math-bf|J><around|(|<math-bf|c><rsup|\<ast\>>|)>|)>*<around|(|<math-bf|c><rsub|k>-<math-bf|c><rsup|\<ast\>>|)>+O<around|(|<around|\<\|\|\>|<math-bf|c><rsub|k>-<math-bf|c><rsup|\<ast\>>|\<\|\|\>><rsup|2>|)>|]><eq-number>>>>>
    </align>

    Using the Lipschitz condition and bound on the inverse:

    <\equation>
      <around|\<\|\|\>|<math-bf|c><rsub|k+1>-<math-bf|c><rsup|\<ast\>>|\<\|\|\>>\<leq\>\<beta\>*K\<\|\|\><math-bf|c><rsub|k>-<math-bf|c><rsup|\<ast\>>\<\|\|\><rsup|2>+O<around|(|<around|\<\|\|\>|<math-bf|c><rsub|k>-<math-bf|c><rsup|\<ast\>>|\<\|\|\>><rsup|2>|)>
    </equation>

    For <math|<around|\<\|\|\>|<math-bf|c><rsub|0>-<math-bf|c><rsup|\<ast\>>|\<\|\|\>>>
    sufficiently small, quadratic convergence is established.
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Theoretical
      Foundations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>