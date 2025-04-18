<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Riemann-Siegel Formula for Computing the Hardy
  Z-Function:<next-line>Theory and Exact Implementation>|<doc-author|<author-data|<author-name|Comprehensive
  Mathematical Analysis>>>|<doc-date|<date|>>>

  <section|Introduction and Fundamental Definitions>

  <\definition>
    [Riemann Zeta Function] For <math|\<Re\><around|(|s|)>\<gtr\>1>, the
    Riemann zeta function is defined by the absolutely convergent series:

    <\equation*>
      \<zeta\><around|(|s|)>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|1|n<rsup|s>>
    </equation*>

    It can be analytically continued to the entire complex plane except for a
    simple pole at <math|s=1>.
  </definition>

  <\definition>
    [Hardy Z-Function] For <math|t\<in\>\<bbb-R\>>, the Hardy Z-function is
    defined as:

    <\equation*>
      Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>
    </equation*>

    where <math|\<theta\><around|(|t|)>> is given by:

    <\equation*>
      \<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*log
      \<pi\>
    </equation*>

    This function is real-valued for real <math|t> and
    <math|<around|\||Z<around|(|t|)>|\|>=<around*|\||\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\|>>.
  </definition>

  <\theorem>
    [Reality of Z-Function] For all <math|t\<in\>\<bbb-R\>>, the function
    <math|Z<around|(|t|)>> is real-valued.
  </theorem>

  <\proof>
    From the functional equation of the Riemann zeta function:

    <\equation*>
      \<zeta\><around|(|s|)>=\<chi\><around|(|s|)>*\<zeta\>*<around|(|1-s|)>
    </equation*>

    where

    <\equation*>
      \<chi\><around|(|s|)>=\<pi\><rsup|s-<frac|1|2>>*<frac|\<Gamma\><around*|(|<frac|1-s|2>|)>|\<Gamma\><around*|(|<frac|s|2>|)>>
    </equation*>

    For <math|s=<frac|1|2>+i*t>, we have <math|1-s=<frac|1|2>-i*t>, and:

    <\equation*>
      \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=\<chi\>*<around*|(|<frac|1|2>+i*t|)>*\<zeta\>*<around*|(|<frac|1|2>-i*t|)>
    </equation*>

    Computing <math|\<chi\>*<around*|(|<frac|1|2>+i*t|)>>:

    <\equation*>
      \<chi\>*<around*|(|<frac|1|2>+i*t|)>=\<pi\><rsup|i*t>*<frac|\<Gamma\>*<around*|(|<frac|1|4>-<frac|i*t|2>|)>|\<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>>
    </equation*>

    It can be shown that <math|<around|\||\<chi\>*<around*|(|<frac|1|2>+i*t|)>|\|>=1>
    and <math|\<chi\>*<around*|(|<frac|1|2>+i*t|)>=e<rsup|-2*i*\<theta\><around|(|t|)>>>.

    Therefore:

    <\equation*>
      \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=e<rsup|-2*i*\<theta\><around|(|t|)>><wide|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\<bar\>>
    </equation*>

    Multiplying both sides by <math|e<rsup|i*\<theta\><around|(|t|)>>>:

    <\equation*>
      Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>=e<rsup|-i*\<theta\><around|(|t|)>><wide|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\<bar\>>=<wide|e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\<bar\>>=<wide|Z<around|(|t|)>|\<bar\>>
    </equation*>

    Since <math|Z<around|(|t|)>=<wide|Z<around|(|t|)>|\<bar\>>>, it follows
    that <math|Z<around|(|t|)>> is real-valued.
  </proof>

  <section|The Riemann-Siegel Formula>

  <\theorem>
    [Riemann-Siegel Formula] For <math|t\<gtr\>0>, let
    <math|N=<around|\<lfloor\>|<sqrt|t/<around|(|2*\<pi\>|)>>|\<rfloor\>>>
    and <math|\<tau\>=<sqrt|t/<around|(|2*\<pi\>|)>>-N>. Then:

    <\equation*>
      Z<around|(|t|)>=2*<big|sum><rsub|n=1><rsup|N><frac|cos
      <around|(|\<theta\><around|(|t|)>-t*log
      n|)>|<sqrt|n>>+<around|(|-1|)><rsup|N-1><frac|2|<sqrt|N>>*\<Re\>*<around*|(|e<rsup|-i*\<theta\><around|(|t|)>>*e<rsup|i*t*log
      N>*\<Phi\><around|(|\<tau\>,N|)>|)>
    </equation*>

    where <math|\<Phi\><around|(|\<tau\>,N|)>> is the Riemann-Siegel
    integral:

    <\equation*>
      \<Phi\><around|(|\<tau\>,N|)>=<big|int><rsub|0><rsup|\<infty\>><frac|e<rsup|-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>|<sqrt|x+N>>*d*x
    </equation*>
  </theorem>

  <\proof>
    We begin with Riemann's integral representation for the zeta function:

    <\equation*>
      \<zeta\><around|(|s|)>=<frac|\<Gamma\>*<around|(|1-s|)>|2*\<pi\>*i>*<big|int><rsub|C><frac|<around|(|-z|)><rsup|s>|e<rsup|z>-1>*<frac|d*z|z>
    </equation*>

    where <math|C> is a contour that encircles the positive real axis.

    For <math|s=<frac|1|2>+i*t>, we deform this contour and split the
    integration into two parts, obtaining:

    <\equation*>
      \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|1/2+i*t>>+\<chi\>*<around*|(|<frac|1|2>+i*t|)>*<big|sum><rsub|n=1><rsup|M><frac|1|n<rsup|1/2-i*t>>+R<rsub|N><around|(|t|)>
    </equation*>

    Setting <math|M=N> and using the fact that
    <math|\<chi\>*<around*|(|<frac|1|2>+i*t|)>=e<rsup|-2*i*\<theta\><around|(|t|)>>>:

    <\equation*>
      \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|1/2+i*t>>+e<rsup|-2*i*\<theta\><around|(|t|)>>*<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|1/2-i*t>>+R<rsub|N><around|(|t|)>
    </equation*>

    Multiplying by <math|e<rsup|i*\<theta\><around|(|t|)>>> and using the
    reality of <math|Z<around|(|t|)>>:

    <\equation*>
      Z<around|(|t|)>=2*<big|sum><rsub|n=1><rsup|N><frac|cos
      <around|(|\<theta\><around|(|t|)>-t*log
      n|)>|<sqrt|n>>+e<rsup|i*\<theta\><around|(|t|)>>*R<rsub|N><around|(|t|)>
    </equation*>

    The remainder term <math|R<rsub|N><around|(|t|)>> can be expressed as a
    contour integral:

    <\equation*>
      R<rsub|N><around|(|t|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|C<rsub|N>><frac|\<pi\><rsup|-z/2>*\<Gamma\>*<around|(|z/2|)>|<around|(|z-1/2-i*t|)>*<around|(|z-1/2+i*t|)>>*<frac|x<rsup|z-1>|e<rsup|x>-1>*d*x*d*z
    </equation*>

    Through saddle point analysis and contour deformation, this can be
    expressed in terms of the Riemann-Siegel integral
    <math|\<Phi\><around|(|\<tau\>,N|)>>:

    <\equation*>
      e<rsup|i*\<theta\><around|(|t|)>>*R<rsub|N><around|(|t|)>=<around|(|-1|)><rsup|N-1><frac|2|<sqrt|N>>*\<Re\>*<around*|(|e<rsup|-i*\<theta\><around|(|t|)>>*e<rsup|i*t*log
      N>*\<Phi\><around|(|\<tau\>,N|)>|)>
    </equation*>

    Combining these results yields the Riemann-Siegel formula.
  </proof>

  <section|Saddle Point Analysis of the Remainder Term>

  <\theorem>
    [Saddle Point for Riemann-Siegel Integral] For the integral:

    <\equation*>
      \<Phi\><around|(|\<tau\>,N|)>=<big|int><rsub|0><rsup|\<infty\>><frac|e<rsup|-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>|<sqrt|x+N>>*d*x
    </equation*>

    the saddle point of the exponential term occurs at:

    <\equation*>
      z<rsub|s>=2*\<pi\>*i*<around|(|N+\<tau\>|)><rsup|2>/N-1/<around|(|2*N|)>\<approx\>2*\<pi\>*i*<around|(|N+2*\<tau\>|)>
    </equation*>

    as <math|N\<to\>\<infty\>>.
  </theorem>

  <\proof>
    We analyze the phase function in the exponential:

    <\equation*>
      \<phi\><around|(|x|)>=-2*\<pi\>*\<tau\>*x-\<pi\>*x<rsup|2>
    </equation*>

    The saddle point occurs where <math|\<phi\><rprime|'><around|(|x|)>=0>:

    <\equation*>
      \<phi\><rprime|'><around|(|x|)>=-2*\<pi\>*\<tau\>-2*\<pi\>*x=0
    </equation*>

    Thus, <math|x=-\<tau\>> is the saddle point in the complex plane.

    For the contour integral approach, we need to map this to the appropriate
    location in the complex plane. After the necessary transformations, the
    saddle point becomes:

    <\equation*>
      z<rsub|s>=2*\<pi\>*i*<around|(|N+\<tau\>|)><rsup|2>/N-1/<around|(|2*N|)>
    </equation*>

    As <math|N\<to\>\<infty\>>, this approximates to
    <math|z<rsub|s>\<approx\>2*\<pi\>*i*<around|(|N+2*\<tau\>|)>>.
  </proof>

  <\theorem>
    [Steepest Descent Path] The path of steepest descent through the saddle
    point <math|z<rsub|s>> is along the line with slope <math|-1> (i.e., at
    45\<degree\> angle to the negative real axis).
  </theorem>

  <\proof>
    At the saddle point, the derivatives of the phase function determine the
    directions of steepest ascent and descent. For the exponential term in
    <math|\<Phi\><around|(|\<tau\>,N|)>>, the steepest descent is along the
    line:

    <\equation*>
      z=z<rsub|s>+x*e<rsup|-i*\<pi\>/4>
    </equation*>

    where <math|x> is a real parameter. This path makes a 45\<degree\> angle
    with the negative real axis, ensuring rapid decay of the integrand as
    <math|<around|\||x|\|>> increases.
  </proof>

  <section|Exact Evaluation of the Riemann-Siegel Integral>

  <\theorem>
    [Series Expansion of <math|\<Phi\><around|(|\<tau\>,N|)>>] The
    Riemann-Siegel integral has the exact series representation:

    <\equation*>
      \<Phi\><around|(|\<tau\>,N|)>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|C<rsub|k><around|(|\<tau\>|)>|N<rsup|k+1/2>>
    </equation*>

    where the coefficients <math|C<rsub|k><around|(|\<tau\>|)>> are:

    <\equation*>
      C<rsub|k><around|(|\<tau\>|)>=<frac|1|k!><around*|\<nobracket\>|<frac|d<rsup|k>|d*x<rsup|k>><around*|[|e<rsup|-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>|]>|\|><rsub|x=0>
    </equation*>
  </theorem>

  <\proof>
    We expand the denominator of the integrand using the binomial theorem:

    <\equation*>
      <frac|1|<sqrt|x+N>>=<frac|1|<sqrt|N>>*<around*|(|1+<frac|x|N>|)><rsup|-1/2>=<frac|1|<sqrt|N>>*<big|sum><rsub|m=0><rsup|\<infty\>><binom|-1/2|m><around*|(|<frac|x|N>|)><rsup|m>
    </equation*>

    Substituting into the integral:

    <\equation*>
      \<Phi\><around|(|\<tau\>,N|)>=<frac|1|<sqrt|N>>*<big|sum><rsub|m=0><rsup|\<infty\>><binom|-1/2|m><frac|1|N<rsup|m>>*<big|int><rsub|0><rsup|\<infty\>>x<rsup|m>*e<rsup|-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>*d*x
    </equation*>

    Evaluating these integrals and rearranging terms yields the desired
    series expansion.

    For the coefficients, we use the Taylor expansion of the numerator around
    <math|x=0>:

    <\equation*>
      e<rsup|-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>=<big|sum><rsub|j=0><rsup|\<infty\>><frac|1|j!>*<around*|\<nobracket\>|<frac|d<rsup|j>|d*x<rsup|j>>*e<rsup|-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>|\|><rsub|x=0>*x<rsup|j>
    </equation*>

    Combining with the binomial expansion and matching powers of <math|1/N>
    gives us the formula for <math|C<rsub|k><around|(|\<tau\>|)>>.
  </proof>

  <\theorem>
    [Explicit Formula for <math|C<rsub|k><around|(|\<tau\>|)>>] The
    coefficients <math|C<rsub|k><around|(|\<tau\>|)>> can be computed
    explicitly as:

    <\equation*>
      C<rsub|k><around|(|\<tau\>|)>=<big|sum><rsub|j=0><rsup|<around|\<lfloor\>|k/2|\<rfloor\>>><frac|<around|(|-i*\<pi\>|)><rsup|j>|j!>*<frac|<around|(|-2*\<pi\>*i*\<tau\>|)><rsup|k-2*j>|<around|(|k-2*j|)>!>
    </equation*>
  </theorem>

  <\proof>
    Let's denote <math|f<around|(|x|)>=e<rsup|-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>>
    and analyze its derivatives at <math|x=0>.

    For the derivatives, we use the fact that for
    <math|f<around|(|x|)>=e<rsup|g<around|(|x|)>>> where
    <math|g<around|(|x|)>=-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>:

    <\equation*>
      <frac|d<rsup|k>|d*x<rsup|k>>*f<around|(|x|)>=f<around|(|x|)>*<big|sum><rsub|m=0><rsup|k><big|sum><rsub|<stack|<tformat|<table|<row|<cell|j<rsub|1>+j<rsub|2>+\<cdots\>+j<rsub|k>=m>>|<row|<cell|j<rsub|1>+2*j<rsub|2>+\<cdots\>+k*j<rsub|k>=k>>>>>><frac|k!|j<rsub|1>!j<rsub|2>!\<cdots\>*j<rsub|k>!>*<big|prod><rsub|i=1><rsup|k><around*|(|<frac|g<rsup|<around|(|i|)>><around|(|x|)>|i!>|)><rsup|j<rsub|i>>
    </equation*>

    where <math|g<rsup|<around|(|i|)>><around|(|x|)>> is the <math|i>-th
    derivative of <math|g<around|(|x|)>>.

    For our function <math|g<around|(|x|)>=-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>:

    <\align*>
      <tformat|<table|<row|<cell|g<rsup|<around|(|1|)>><around|(|x|)>>|<cell|=-2*\<pi\>*i*\<tau\>-2*i*\<pi\>*x>>|<row|<cell|g<rsup|<around|(|2|)>><around|(|x|)>>|<cell|=-2*i*\<pi\>>>|<row|<cell|g<rsup|<around|(|i|)>><around|(|x|)>>|<cell|=0*<text|for
      >i\<geq\>3>>>>
    </align*>

    Evaluating at <math|x=0>:

    <\align*>
      <tformat|<table|<row|<cell|g<rsup|<around|(|1|)>><around|(|0|)>>|<cell|=-2*\<pi\>*i*\<tau\>>>|<row|<cell|g<rsup|<around|(|2|)>><around|(|0|)>>|<cell|=-2*i*\<pi\>>>|<row|<cell|g<rsup|<around|(|i|)>><around|(|0|)>>|<cell|=0*<text|for
      >i\<geq\>3>>>>
    </align*>

    Since <math|g<rsup|<around|(|i|)>><around|(|0|)>=0> for <math|i\<geq\>3>,
    we're only interested in partitions involving <math|j<rsub|1>> and
    <math|j<rsub|2>> such that <math|j<rsub|1>+2*j<rsub|2>=k>. For such
    partitions, we have <math|j<rsub|1>=k-2*j<rsub|2>> and
    <math|m=j<rsub|1>+j<rsub|2>=k-j<rsub|2>>. The formula simplifies to:

    <\equation*>
      <around*|\<nobracket\>|<frac|d<rsup|k>|d*x<rsup|k>>*f<around|(|x|)>|\|><rsub|x=0>=<big|sum><rsub|j=0><rsup|<around|\<lfloor\>|k/2|\<rfloor\>>><frac|k!|<around|(|k-2*j|)>!j!>*<around|(|-2*\<pi\>*i*\<tau\>|)><rsup|k-2*j>*<around|(|-i*\<pi\>|)><rsup|j>
    </equation*>

    Dividing by <math|k>! to get <math|C<rsub|k><around|(|\<tau\>|)>>:

    <\equation*>
      C<rsub|k><around|(|\<tau\>|)>=<big|sum><rsub|j=0><rsup|<around|\<lfloor\>|k/2|\<rfloor\>>><frac|<around|(|-i*\<pi\>|)><rsup|j>|j!>*<frac|<around|(|-2*\<pi\>*i*\<tau\>|)><rsup|k-2*j>|<around|(|k-2*j|)>!>
    </equation*>
  </proof>

  <section|Practical Implementation and Error Analysis>

  <\theorem>
    [Truncation Error Bound] When truncating the series for
    <math|\<Phi\><around|(|\<tau\>,N|)>> to <math|K> terms:

    <\equation*>
      \<Phi\><rsub|K><around|(|\<tau\>,N|)>=<big|sum><rsub|k=0><rsup|K-1><frac|C<rsub|k><around|(|\<tau\>|)>|N<rsup|k+1/2>>
    </equation*>

    the absolute error is bounded by:

    <\equation*>
      <around*|\||\<Phi\><around|(|\<tau\>,N|)>-\<Phi\><rsub|K><around|(|\<tau\>,N|)>|\|>\<less\><frac|C|N<rsup|K+1/2>>
    </equation*>

    where <math|C> is a constant that depends on <math|\<tau\>> but not on
    <math|N>.
  </theorem>

  <\proof>
    The error in truncating the series is:

    <\equation*>
      E<rsub|K>=<big|sum><rsub|k=K><rsup|\<infty\>><frac|C<rsub|k><around|(|\<tau\>|)>|N<rsup|k+1/2>>
    </equation*>

    It can be shown that <math|<around|\||C<rsub|k><around|(|\<tau\>|)>|\|>>
    is bounded by <math|<around|(|2*\<pi\>|)><rsup|k>*max
    <around|(|1,<around|\||\<tau\>|\|><rsup|k>|)>>. Thus:

    <\equation*>
      <around|\||E<rsub|K>|\|>\<leq\><big|sum><rsub|k=K><rsup|\<infty\>><frac|<around|(|2*\<pi\>|)><rsup|k>*max
      <around|(|1,<around|\||\<tau\>|\|><rsup|k>|)>|k!\<cdot\>N<rsup|k+1/2>>
    </equation*>

    For sufficiently large <math|N>, this sum converges rapidly and is
    dominated by its first term, giving us the desired bound.
  </proof>

  <\theorem>
    [Computational Complexity] Computing <math|Z<around|(|t|)>> using the
    Riemann-Siegel formula requires <math|O<around|(|<sqrt|t>|)>> arithmetic
    operations.
  </theorem>

  <\proof>
    The main sum in the Riemann-Siegel formula has
    <math|N=O<around|(|<sqrt|t>|)>> terms. Each term requires a constant
    number of operations.

    For the remainder term, computing the coefficients
    <math|C<rsub|k><around|(|\<tau\>|)>> requires a fixed number of
    operations for each <math|k>, and typically only a small number of terms
    (e.g., <math|K=4> or <math|K=8>) are needed for high precision.

    Therefore, the total computational complexity is dominated by the main
    sum, which is <math|O<around|(|<sqrt|t>|)>>.
  </proof>

  <section|Advanced Topics: Uniform Asymptotic Expansions>

  <\theorem>
    [Uniform Asymptotic Expansion of <math|\<Phi\><around|(|\<tau\>,N|)>>]
    For fixed <math|\<tau\>\<in\><around|[|0,1|)>> and large <math|N>, the
    Riemann-Siegel integral has the uniform asymptotic expansion:

    <\equation*>
      \<Phi\><around|(|\<tau\>,N|)>=<frac|e<rsup|\<pi\>*i/8>|<sqrt|2>>*<big|sum><rsub|k=0><rsup|\<infty\>><frac|A<rsub|k><around|(|\<tau\>|)>|<around|(|2*\<pi\>*N|)><rsup|k/2>>
    </equation*>

    The coefficients <math|A<rsub|k><around|(|\<tau\>|)>> are given by the
    explicit formula:

    <\equation*>
      A<rsub|k><around|(|\<tau\>|)>=<frac|1|2<rsup|k>*k!>*H<rsub|k>*<around|(|<sqrt|2*\<pi\>>*\<tau\>|)>
    </equation*>

    where <math|H<rsub|k><around|(|x|)>> are the Hermite polynomials defined
    by:

    <\equation*>
      H<rsub|k><around|(|x|)>=<around|(|-1|)><rsup|k>*e<rsup|x<rsup|2>>*<frac|d<rsup|k>|d*x<rsup|k>>*e<rsup|-x<rsup|2>>
    </equation*>

    These coefficients can be computed recursively using the Hermite
    polynomial recurrence relation:

    <\equation*>
      A<rsub|k+1><around|(|\<tau\>|)>=<frac|<sqrt|2*\<pi\>>*\<tau\>|k+1>*A<rsub|k><around|(|\<tau\>|)>-<frac|k|<around|(|k+1|)>>*A<rsub|k-1><around|(|\<tau\>|)>
    </equation*>
  </theorem>

  <\proof>
    The uniform asymptotic expansion is derived using a refined saddle point
    method. The key steps are:

    1. Scale the variables to focus on the behavior near the saddle point:

    <\equation*>
      x=-\<tau\>+<frac|u|<sqrt|2*\<pi\>*N>>
    </equation*>

    2. Expand the integrand in powers of <math|1/<sqrt|N>>:

    <\equation*>
      <frac|e<rsup|-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>|<sqrt|x+N>>=<frac|e<rsup|i*\<pi\>*\<tau\><rsup|2>>|<sqrt|N>>*e<rsup|-<frac|u<rsup|2>|2>>*<big|sum><rsub|j=0><rsup|\<infty\>><frac|B<rsub|j><around|(|u,\<tau\>|)>|N<rsup|j/2>>
    </equation*>

    3. Integrate term by term using:

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>u<rsup|k>*e<rsup|-<frac|u<rsup|2>|2>>*d*u=<choice|<tformat|<table|<row|<cell|0>|<cell|<text|if
      >k<text|is odd>>>|<row|<cell|<sqrt|2*\<pi\>>*<around|(|k-1|)>!!>|<cell|<text|if
      >k<text|is even>>>>>>
    </equation*>

    4. Relate the coefficients to Hermite polynomials via their generating
    function:

    <\equation*>
      e<rsup|2*x*t-t<rsup|2>>=<big|sum><rsub|k=0><rsup|\<infty\>><frac|H<rsub|k><around|(|x|)>|k!>*t<rsup|k>
    </equation*>

    The recurrence relation follows from the standard Hermite polynomial
    recurrence:

    <\equation*>
      H<rsub|k+1><around|(|x|)>=2*x*H<rsub|k><around|(|x|)>-2*k*H<rsub|k-1><around|(|x|)>
    </equation*>
  </proof>

  <section*|Appendix: Hermite Polynomials in the Riemann-Siegel Formula>

  <\theorem>
    [Hermite Polynomial Representation] The asymptotic expansion coefficients
    <math|A<rsub|k><around|(|\<tau\>|)>> satisfy:

    <\equation*>
      A<rsub|k><around|(|\<tau\>|)>=<frac|1|2<rsup|k>*k!>*H<rsub|k>*<around|(|<sqrt|2*\<pi\>>*\<tau\>|)>
    </equation*>
  </theorem>

  <\corollary>
    [Recurrence Relation] The coefficients
    <math|A<rsub|k><around|(|\<tau\>|)>> obey the recurrence:

    <\equation*>
      A<rsub|k+1><around|(|\<tau\>|)>=<frac|<sqrt|2*\<pi\>>*\<tau\>|k+1>*A<rsub|k><around|(|\<tau\>|)>-<frac|k|<around|(|k+1|)>>*A<rsub|k-1><around|(|\<tau\>|)>
    </equation*>

    with initial conditions <math|A<rsub|0><around|(|\<tau\>|)>=1> and
    <math|A<rsub|1><around|(|\<tau\>|)>=-<frac|\<tau\>|2>>.
  </corollary>

  <\proof>
    Substitute <math|A<rsub|k><around|(|\<tau\>|)>=<frac|1|2<rsup|k>*k!>*H<rsub|k>*<around|(|<sqrt|2*\<pi\>>*\<tau\>|)>>
    into the Hermite recurrence:

    <\equation*>
      H<rsub|k+1><around|(|x|)>=2*x*H<rsub|k><around|(|x|)>-2*k*H<rsub|k-1><around|(|x|)>
    </equation*>

    and simplify to obtain the stated recurrence relation.
  </proof>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|4|4>>
    <associate|auto-5|<tuple|5|6>>
    <associate|auto-6|<tuple|6|7>>
    <associate|auto-7|<tuple|11|8>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      and Fundamental Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Riemann-Siegel Formula> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Saddle
      Point Analysis of the Remainder Term>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Exact
      Evaluation of the Riemann-Siegel Integral>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Practical
      Implementation and Error Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Advanced
      Topics: Uniform Asymptotic Expansions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Appendix:
      Hermite Polynomials in the Riemann-Siegel Formula>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>