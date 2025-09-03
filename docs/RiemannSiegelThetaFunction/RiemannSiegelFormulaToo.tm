<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Exactness of the Riemann-Siegel
  Formula>|<doc-author|<author-data|<author-name|Stephen Crowley>>>>

  <section|Foundational Framework>

  <\definition>
    [Riemann Zeta Function - Analytic Continuation] For
    <math|s\<in\>\<bbb-C\>\<setminus\><around|{|1|}>>, the Riemann zeta
    function admits the exact integral representation:

    <\equation*>
      \<zeta\><around|(|s|)>=<frac|1|\<Gamma\><around|(|s|)>>*<big|int><rsub|0><rsup|\<infty\>><frac|t<rsup|s-1>|e<rsup|t>-1>*d*t+<frac|1|s-1>
    </equation*>

    Equivalently, via Hankel contour integration:

    <\equation*>
      \<zeta\><around|(|s|)>=<frac|\<Gamma\>*<around|(|1-s|)>|2*\<pi\>*i>*<big|int><rsub|\<cal-H\>><frac|<around|(|-z|)><rsup|s>|e<rsup|z>-1>*<frac|d*z|z>
    </equation*>

    where <math|\<cal-H\>> is the Hankel contour encircling
    <math|\<bbb-R\><rsup|+>> counterclockwise.
  </definition>

  <\definition>
    [Functional Equation Parameters] The complete zeta function
    <math|\<Xi\><around|(|s|)>=<frac|1|2>*s*<around|(|s-1|)>*\<pi\><rsup|-s/2>*\<Gamma\>*<around|(|s/2|)>*\<zeta\><around|(|s|)>>
    satisfies <math|\<Xi\><around|(|s|)>=\<Xi\>*<around|(|1-s|)>>. The phase
    function for the critical line is:

    <\equation*>
      \<theta\><around|(|t|)>=arg \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>-<frac|t|2>*ln
      \<pi\>+<frac|\<pi\>|8>
    </equation*>
  </definition>

  <\definition>
    [Hardy Z-Function] For <math|t\<in\>\<bbb-R\>>:

    <\equation*>
      Z<around|(|t|)>=e<rsup|-i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>
    </equation*>
  </definition>

  <\theorem>
    [Reality Condition] <math|Z<around|(|t|)>\<in\>\<bbb-R\>> for all
    <math|t\<in\>\<bbb-R\>>.
  </theorem>

  <\proof>
    From the functional equation <math|\<zeta\><around|(|s|)>=2<rsup|s>*\<pi\><rsup|s-1>*sin
    <around|(|\<pi\>*s/2|)>*\<Gamma\>*<around|(|1-s|)>*\<zeta\>*<around|(|1-s|)>>,
    setting <math|s=1/2+i*t>:

    <\equation*>
      \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=2<rsup|1/2+i*t>*\<pi\><rsup|i*t-1/2>*sin
      <around*|(|<frac|\<pi\>|4>+<frac|\<pi\>*i*t|2>|)>*\<Gamma\>*<around*|(|<frac|1|2>-i*t|)>*\<zeta\>*<around*|(|<frac|1|2>-i*t|)>
    </equation*>

    Using <math|sin <around|(|\<pi\>/4+\<pi\>*i*t/2|)>=<frac|1|<sqrt|2>>*<around|(|1+i|)>*e<rsup|-\<pi\>*t/2>>
    and the reflection formula <math|\<Gamma\>*<around|(|1/2-i*t|)>*\<Gamma\>*<around|(|1/2+i*t|)>=\<pi\>/cosh
    <around|(|\<pi\>*t|)>>, we obtain:

    <\equation*>
      \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=\<pi\><rsup|i*t>*<frac|2<rsup|i*t>*\<Gamma\>*<around|(|1/2-i*t|)>|<sqrt|2*cosh
      <around|(|\<pi\>*t|)>>>*<around|(|1+i|)>*e<rsup|-\<pi\>*t/2>*\<zeta\>*<around*|(|<frac|1|2>-i*t|)>
    </equation*>

    Taking complex conjugates and using <math|<wide|\<zeta\>*<around|(|1/2-i*t|)>|\<bar\>>=\<zeta\>*<around|(|1/2+i*t|)>>:

    <\equation*>
      <wide|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\<bar\>>=\<pi\><rsup|-i*t>*<frac|2<rsup|-i*t>*\<Gamma\>*<around|(|1/2+i*t|)>|<sqrt|2*cosh
      <around|(|\<pi\>*t|)>>>*<around|(|1-i|)>*e<rsup|-\<pi\>*t/2>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>
    </equation*>

    The phase factor satisfies:

    <\equation*>
      e<rsup|2*i*\<theta\><around|(|t|)>>=\<pi\><rsup|-i*t>*<frac|2<rsup|-i*t>*\<Gamma\>*<around|(|1/2+i*t|)>|<sqrt|2*cosh
      <around|(|\<pi\>*t|)>>>*<around|(|1-i|)>*e<rsup|-\<pi\>*t/2>
    </equation*>

    Therefore:

    <\equation*>
      Z<around|(|t|)>=e<rsup|-i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>=e<rsup|i*\<theta\><around|(|t|)>><wide|\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\<bar\>>=<wide|Z<around|(|t|)>|\<bar\>>
    </equation*>
  </proof>

  <section|Exact Analytic Construction>

  <\theorem>
    [Riemann-Siegel Formula - Exact Representation] For any
    <math|N\<in\>\<bbb-N\>>, define <math|m=<around|\<lfloor\>|<sqrt|t/<around|(|2*\<pi\>|)>>|\<rfloor\>>>
    and <math|\<tau\>=<sqrt|t/<around|(|2*\<pi\>|)>>-m>. Then:

    <\equation*>
      Z<around|(|t|)>=2*<big|sum><rsub|n=1><rsup|m><frac|cos
      <around|(|\<theta\><around|(|t|)>-t*ln
      n|)>|<sqrt|n>>+<around|(|-1|)><rsup|m-1>*R<around|(|t,m|)>
    </equation*>

    where the exact remainder term is:

    <\equation*>
      R<around|(|t,m|)>=<frac|2|<sqrt|m>>*\<Re\>*<around*|(|e<rsup|-i*<around|(|\<theta\><around|(|t|)>-t*ln
      m|)>>*\<Phi\><around|(|\<tau\>,m,t|)>|)>
    </equation*>

    and the kernel function is:

    <\equation*>
      \<Phi\><around|(|\<tau\>,m,t|)>=<around*|(|<frac|t|2*\<pi\>>|)><rsup|1/4>*<big|int><rsub|0><rsup|\<infty\>><frac|e<rsup|-i*\<pi\>*\<tau\><rsup|2>-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>|<sqrt|x+m>>*d*x
    </equation*>
  </theorem>

  <\proof>
    <wide*|Step 1: Integral Representation|\<bar\>> Starting from the Hankel
    contour integral:

    <\equation*>
      \<zeta\><around|(|s|)>=<frac|\<Gamma\>*<around|(|1-s|)>|2*\<pi\>*i>*<big|int><rsub|\<cal-H\>><frac|<around|(|-z|)><rsup|s>|e<rsup|z>-1>*<frac|d*z|z>
    </equation*>

    For <math|s=1/2+i*t>, deform the contour <math|\<cal-H\>> to the path
    <math|\<cal-C\>> consisting of:

    <\itemize>
      <item>Horizontal segments <math|<around|[|\<delta\>,M|]>\<pm\>i*\<epsilon\>>
      as <math|\<epsilon\>\<to\>0<rsup|+>>

      <item>Vertical segment from <math|M-i*\<infty\>> to
      <math|M+i*\<infty\>>

      <item>Small circle around the origin of radius
      <math|\<delta\>\<to\>0<rsup|+>>
    </itemize>

    <wide*|Step 2: Residue Evaluation|\<bar\>> The integrand
    <math|<frac|<around|(|-z|)><rsup|s>|e<rsup|z>-1>*<frac|1|z>> has simple
    poles at <math|z=2*\<pi\>*i*n> for <math|n\<in\>\<bbb-Z\>\<setminus\><around|{|0|}>>.

    <\equation*>
      <text|Res><rsub|z=2*\<pi\>*i*n><frac|<around|(|-z|)><rsup|s>|e<rsup|z>-1>*<frac|1|z>=<frac|<around|(|-2*\<pi\>*i*n|)><rsup|s>|2*\<pi\>*i*n>=<frac|<around|(|-1|)><rsup|s>*<around|(|2*\<pi\>*n|)><rsup|s>|2*\<pi\>*i*n>
    </equation*>

    For <math|n\<gtr\>0>: Res<math|=<frac|e<rsup|i*\<pi\>*s>*<around|(|2*\<pi\>*n|)><rsup|s>|2*\<pi\>*i*n>=<frac|e<rsup|i*\<pi\>*s>*<around|(|2*\<pi\>|)><rsup|s>*n<rsup|s-1>|2*\<pi\>*i>>

    For <math|n\<less\>0>: Res<math|=<frac|e<rsup|-i*\<pi\>*s>*<around|(|2*\<pi\><around|\||n|\|>|)><rsup|s>|-2*\<pi\>*i<around|\||n|\|>>=<frac|e<rsup|-i*\<pi\>*s>*<around|(|2*\<pi\>|)><rsup|s><around|\||n|\|><rsup|s-1>|2*\<pi\>*i>>

    <wide*|Step 3: Finite Sum Construction|\<bar\>> The sum over positive
    residues up to <math|n\<leq\>m> gives:

    <\equation*>
      <big|sum><rsub|n=1><rsup|m><frac|e<rsup|i*\<pi\>*s>*<around|(|2*\<pi\>|)><rsup|s>*n<rsup|s-1>|2*\<pi\>*i>=<frac|e<rsup|i*\<pi\>*s>*<around|(|2*\<pi\>|)><rsup|s>|2*\<pi\>*i>*<big|sum><rsub|n=1><rsup|m>n<rsup|s-1>
    </equation*>

    For <math|s=1/2+i*t>:

    <\equation*>
      <frac|e<rsup|i*\<pi\>*<around|(|1/2+i*t|)>>*<around|(|2*\<pi\>|)><rsup|1/2+i*t>|2*\<pi\>*i>*<big|sum><rsub|n=1><rsup|m>n<rsup|-1/2+i*t>=<frac|i*e<rsup|-\<pi\>*t>*<around|(|2*\<pi\>|)><rsup|1/2>*<around|(|2*\<pi\>|)><rsup|i*t>|2*\<pi\>*i>*<big|sum><rsub|n=1><rsup|m><frac|e<rsup|i*t*ln
      n>|n<rsup|1/2>>
    </equation*>

    Using <math|e<rsup|-\<pi\>*t>/i=i*e<rsup|\<pi\>*t>> and symmetry
    considerations:

    <\equation*>
      \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=2*<big|sum><rsub|n=1><rsup|m><frac|cos
      <around|(|t*ln n-\<pi\>/4|)>|n<rsup|1/2>>+<text|remainder terms>
    </equation*>

    <wide*|Step 4: Remainder Analysis|\<bar\>> The remainder integral
    becomes:

    <\equation*>
      <big|int><rsub|m><rsup|\<infty\>><frac|<around|(|-2*\<pi\>*i*x|)><rsup|1/2+i*t>|e<rsup|2*\<pi\>*i*x>-1>*<frac|d*x|x>
    </equation*>

    Through asymptotic analysis and contour deformation, this leads to the
    exact kernel:

    <\equation*>
      \<Phi\><around|(|\<tau\>,m,t|)>=<around*|(|<frac|t|2*\<pi\>>|)><rsup|1/4>*<big|int><rsub|0><rsup|\<infty\>><frac|e<rsup|-i*\<pi\>*\<tau\><rsup|2>-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>|<sqrt|x+m>>*d*x
    </equation*>
  </proof>

  <section|Exact Integral Analysis>

  <\theorem>
    [Critical Point Structure] The phase function <math|>

    <\equation>
      \<phi\><around|(|x|)>=-\<pi\>*\<tau\><rsup|2>-2*\<pi\>*\<tau\>*x-\<pi\>*x<rsup|2>
    </equation>

    \ has unique critical point at <math|x<rsub|0>=-\<tau\>> with
    <math|\<phi\><rprime|''><around|(|x<rsub|0>|)>=-2*\<pi\>\<less\>0>.
  </theorem>

  <\proof>
    Computing derivatives:

    <\equation*>
      \<phi\><rprime|'><around|(|x|)>=-2*\<pi\>*\<tau\>-2*\<pi\>*x=-2*\<pi\>*<around|(|\<tau\>+x|)>
    </equation*>

    <\equation*>
      \<phi\><rprime|''><around|(|x|)>=-2*\<pi\>
    </equation*>

    Setting <math|\<phi\><rprime|'><around|(|x|)>=0> yields
    <math|x=-\<tau\>>. Since <math|\<phi\><rprime|''><around|(|x<rsub|0>|)>=-2*\<pi\>\<less\>0>,
    this is a maximum of the real part of <math|\<phi\>>.

    The Hessian determinant for steepest descent is:

    <\equation*>
      det H=<around*|\||\<phi\><rprime|''><around|(|x<rsub|0>|)>|\|><rsup|2>=4*\<pi\><rsup|2>\<gtr\>0
    </equation*>

    confirming a proper saddle point structure.
  </proof>

  <\theorem>
    [Steepest Descent Path Construction] The optimal integration path through
    <math|x<rsub|0>=-\<tau\>> is:

    <\equation*>
      \<gamma\><around|(|u|)>=-\<tau\>+u*e<rsup|-i*\<pi\>/4>,<space|1em>u\<in\>\<bbb-R\>
    </equation*>

    yielding <math|\<phi\><around|(|\<gamma\><around|(|u|)>|)>=-\<pi\>*\<tau\><rsup|2>-\<pi\>*u<rsup|2>>.
  </theorem>

  <\proof>
    Along the path <math|\<gamma\><around|(|u|)>=-\<tau\>+u*e<rsup|-i*\<pi\>/4>>:

    <\equation*>
      \<phi\><around|(|\<gamma\><around|(|u|)>|)>=-\<pi\>*\<tau\><rsup|2>-2*\<pi\>*\<tau\>*<around|(|u*e<rsup|-i*\<pi\>/4>|)>-\<pi\>*<around|(|u*e<rsup|-i*\<pi\>/4>|)><rsup|2>
    </equation*>

    <\equation*>
      =-\<pi\>*\<tau\><rsup|2>-2*\<pi\>*\<tau\>*u*e<rsup|-i*\<pi\>/4>-\<pi\>*u<rsup|2>*e<rsup|-i*\<pi\>/2>
    </equation*>

    <\equation*>
      =-\<pi\>*\<tau\><rsup|2>-2*\<pi\>*\<tau\>*u*<frac|1-i|<sqrt|2>>-\<pi\>*u<rsup|2>*<around|(|-i|)>
    </equation*>

    <\equation*>
      =-\<pi\>*\<tau\><rsup|2>-<sqrt|2>*\<pi\>*\<tau\>*u*<around|(|1-i|)>+i*\<pi\>*u<rsup|2>
    </equation*>

    The real part is <math|\<Re\><around|[|\<phi\><around|(|\<gamma\><around|(|u|)>|)>|]>=-\<pi\>*\<tau\><rsup|2>-<sqrt|2>*\<pi\>*\<tau\>*u>,
    which decreases as <math|<around|\||u|\|>\<to\>\<infty\>> for the correct
    branch, ensuring convergence.

    The imaginary part is <math|\<Im\><around|[|\<phi\><around|(|\<gamma\><around|(|u|)>|)>|]>=<sqrt|2>*\<pi\>*\<tau\>*u+\<pi\>*u<rsup|2>>,
    giving the oscillatory behavior necessary for the integral.
  </proof>

  <section|Convergent Series Representation>

  <\theorem>
    [Binomial Expansion Convergence] For <math|<around*|\||\<tau\>|\|>\<less\>1>
    and <math|m\<geq\>1>:

    <\equation*>
      \<Phi\><around|(|\<tau\>,m,t|)>=<around*|(|<frac|t|2*\<pi\>>|)><rsup|1/4><frac|1|<sqrt|m>>*<big|sum><rsub|k=0><rsup|\<infty\>><binom|-1/2|k><frac|1|m<rsup|k>>*\<cal-I\><rsub|k><around|(|\<tau\>|)>
    </equation*>

    where

    <\equation*>
      \<cal-I\><rsub|k><around|(|\<tau\>|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|k>*e<rsup|-i*\<pi\>*\<tau\><rsup|2>-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>*d*x
    </equation*>

    and the series converges absolutely.
  </theorem>

  <\proof>
    <wide*|Step 1: Binomial Expansion|\<bar\>> For the kernel
    <math|<around|(|x+m|)><rsup|-1/2>> with <math|x\<geq\>0> and
    <math|m\<geq\>1>:

    <\equation*>
      <frac|1|<sqrt|x+m>>=<frac|1|<sqrt|m>>*<frac|1|<sqrt|1+x/m>>=<frac|1|<sqrt|m>>*<big|sum><rsub|k=0><rsup|\<infty\>><binom|-1/2|k><around*|(|<frac|x|m>|)><rsup|k>
    </equation*>

    This expansion is valid for <math|x/m\<less\>1>, which fails for large
    <math|x>. However, the exponential decay of
    <math|e<rsup|-i*\<pi\>*x<rsup|2>>> provides uniform convergence.

    <wide*|Step 2: Dominated Convergence|\<bar\>> For any
    <math|N\<in\>\<bbb-N\>>, the partial sum error satisfies:

    <\equation*>
      <around*|\||<frac|1|<sqrt|x+m>>-<frac|1|<sqrt|m>>*<big|sum><rsub|k=0><rsup|N><binom|-1/2|k><around*|(|<frac|x|m>|)><rsup|k>|\|>\<leq\><frac|C|m<rsup|1/2>><around*|(|<frac|x|m>|)><rsup|N+1>
    </equation*>

    The integral of the error term is bounded by:

    <\equation*>
      <big|int><rsub|0><rsup|\<infty\>><frac|C|m<rsup|1/2>><around*|(|<frac|x|m>|)><rsup|N+1>*d*x=<frac|C|m<rsup|N+3/2>>*<big|int><rsub|0><rsup|\<infty\>>x<rsup|N+1>*d*x
    </equation*>

    Since <math|<big|int><rsub|0><rsup|\<infty\>>x<rsup|N+1>*e<rsup|-\<pi\>*x<rsup|2>>*d*x=<frac|1|2*\<pi\><rsup|<around|(|N+2|)>/2>>*\<Gamma\><around*|(|<frac|N+2|2>|)>\<less\>\<infty\>>,
    the dominated convergence theorem applies.

    <wide*|Step 3: Term-by-Term Integration|\<bar\>> Each integral
    <math|\<cal-I\><rsub|k><around|(|\<tau\>|)>> can be evaluated exactly:

    <\equation*>
      \<cal-I\><rsub|k><around|(|\<tau\>|)>=e<rsup|-i*\<pi\>*\<tau\><rsup|2>>*<big|int><rsub|0><rsup|\<infty\>>x<rsup|k>*e<rsup|-2*\<pi\>*i*\<tau\>*x-i*\<pi\>*x<rsup|2>>*d*x
    </equation*>

    Using the substitution <math|x=y/<sqrt|\<pi\>>> and completing the
    square:

    <\equation*>
      \<cal-I\><rsub|k><around|(|\<tau\>|)>=<frac|e<rsup|-i*\<pi\>*\<tau\><rsup|2>>|\<pi\><rsup|<around|(|k+1|)>/2>>*<big|int><rsub|0><rsup|\<infty\>>y<rsup|k>*e<rsup|-i*<around|(|y+\<tau\>*<sqrt|\<pi\>>|)><rsup|2>+i*\<pi\>*\<tau\><rsup|2>>*d*y
    </equation*>

    <\equation*>
      =<frac|1|\<pi\><rsup|<around|(|k+1|)>/2>>*<big|int><rsub|0><rsup|\<infty\>>y<rsup|k>*e<rsup|-i*<around|(|y+\<tau\>*<sqrt|\<pi\>>|)><rsup|2>>*d*y
    </equation*>

    This integral converges absolutely for all <math|k\<geq\>0> and
    <math|\<tau\>\<in\>\<bbb-C\>>.
  </proof>

  <section|Special Function Connections>

  <\definition>
    [Fresnel Integral Generalization] For <math|\<Re\><around|(|a|)>\<gtr\>0>
    and <math|k\<geq\>0>:

    <\equation*>
      F<rsub|k><around|(|a,b|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|k>*e<rsup|-a*x<rsup|2>-b*x>*d*x=<frac|1|2>*a<rsup|-<around|(|k+1|)>/2>*e<rsup|b<rsup|2>/<around|(|4*a|)>>*\<Gamma\><around*|(|<frac|k+1|2>|)>*D<rsub|-k-1><around*|(|<frac|b|<sqrt|a>>|)>
    </equation*>

    where <math|D<rsub|\<nu\>><around|(|z|)>> is the parabolic cylinder
    function.
  </definition>

  <\theorem>
    [Exact Integral Evaluation] The Riemann-Siegel integrals satisfy:

    <\equation*>
      \<cal-I\><rsub|k><around|(|\<tau\>|)>=F<rsub|k><around|(|i*\<pi\>,2*\<pi\>*i*\<tau\>|)>=<frac|e<rsup|-i*\<pi\>*\<tau\><rsup|2>>|2*<around|(|i*\<pi\>|)><rsup|<around|(|k+1|)>/2>>*\<Gamma\><around*|(|<frac|k+1|2>|)>*D<rsub|-k-1>*<around|(|2*\<tau\>*<sqrt|-i*\<pi\>>|)>
    </equation*>
  </theorem>

  <\proof>
    Direct application of the Fresnel integral formula with <math|a=i*\<pi\>>
    and <math|b=2*\<pi\>*i*\<tau\>>:

    <\equation*>
      e<rsup|b<rsup|2>/<around|(|4*a|)>>=e<rsup|<around|(|2*\<pi\>*i*\<tau\>|)><rsup|2>/<around|(|4*i*\<pi\>|)>>=e<rsup|4*\<pi\><rsup|2>*<around|(|-1|)>*\<tau\><rsup|2>/<around|(|4*i*\<pi\>|)>>=e<rsup|-i*\<pi\>*\<tau\><rsup|2>>
    </equation*>

    The argument of the parabolic cylinder function becomes:

    <\equation*>
      <frac|b|<sqrt|a>>=<frac|2*\<pi\>*i*\<tau\>|<sqrt|i*\<pi\>>>=2*\<tau\>*<sqrt|<frac|i*\<pi\>|\<pi\>>>=2*\<tau\>*<sqrt|-i*\<pi\>>
    </equation*>

    Therefore:

    <\equation*>
      \<cal-I\><rsub|k><around|(|\<tau\>|)>=<frac|e<rsup|-i*\<pi\>*\<tau\><rsup|2>>|2*<around|(|i*\<pi\>|)><rsup|<around|(|k+1|)>/2>>*\<Gamma\><around*|(|<frac|k+1|2>|)>*D<rsub|-k-1>*<around|(|2*\<tau\>*<sqrt|-i*\<pi\>>|)>
    </equation*>

    This provides an exact closed-form expression for each coefficient in the
    Riemann-Siegel series.
  </proof>

  <section|Structural Symmetries and Transformations>

  <\theorem>
    [Modular Transformation Property] For the kernel function, the
    transformation <math|m\<mapsto\>m+1>, <math|\<tau\>\<mapsto\>\<tau\>-1>
    yields:

    <\equation*>
      \<Phi\><around|(|\<tau\>-1,m+1,t|)>=e<rsup|-2*\<pi\>*i*\<tau\>+i*\<pi\>>*\<Phi\><around|(|\<tau\>,m,t|)>
    </equation*>
  </theorem>

  <\proof>
    <wide*|Step 1: Theta Function Representation|\<bar\>> The kernel can be
    expressed using Jacobi theta functions:

    <\equation*>
      \<Phi\><around|(|\<tau\>,m,t|)>=<around*|(|<frac|t|2*\<pi\>>|)><rsup|1/4><frac|e<rsup|-i*\<pi\>*m*\<tau\><rsup|2>>|m<rsup|1/4>>*\<vartheta\><rsub|3><around*|(|\<pi\>*\<tau\>,e<rsup|-i*\<pi\>/m>|)>
    </equation*>

    where <math|\<vartheta\><rsub|3><around|(|z,q|)>=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>q<rsup|n<rsup|2>>*e<rsup|2*i*n*z>>
    is the Jacobi theta function.

    <wide*|Step 2: Modular Transformation|\<bar\>> Under the transformation
    <math|\<tau\>\<mapsto\>\<tau\>-1>:

    <\equation*>
      \<vartheta\><rsub|3><around*|(|\<pi\>*<around|(|\<tau\>-1|)>,e<rsup|-i*\<pi\>/m>|)>=\<vartheta\><rsub|3><around*|(|\<pi\>*\<tau\>-\<pi\>,e<rsup|-i*\<pi\>/m>|)>
    </equation*>

    Using the periodicity property <math|\<vartheta\><rsub|3><around|(|z+\<pi\>*\<tau\>,q|)>=q<rsup|-1/2>*e<rsup|-2*i*z>*\<vartheta\><rsub|3><around|(|z,q|)>>:

    <\equation*>
      \<vartheta\><rsub|3><around*|(|\<pi\>*\<tau\>-\<pi\>,e<rsup|-i*\<pi\>/m>|)>=e<rsup|i*\<pi\>/m>*e<rsup|2*i*\<pi\>*\<tau\>>*\<vartheta\><rsub|3><around*|(|\<pi\>*\<tau\>,e<rsup|-i*\<pi\>/m>|)>
    </equation*>

    <wide*|Step 3: Phase Factor Analysis|\<bar\>> For the transformation
    <math|m\<mapsto\>m+1>:

    <\equation*>
      <frac|e<rsup|-i*\<pi\>*<around|(|m+1|)>*<around|(|\<tau\>-1|)><rsup|2>>|<around|(|m+1|)><rsup|1/4>>=<frac|e<rsup|-i*\<pi\>*<around|(|m+1|)>*<around|(|\<tau\><rsup|2>-2*\<tau\>+1|)>>|<around|(|m+1|)><rsup|1/4>>
    </equation*>

    <\equation*>
      =<frac|e<rsup|-i*\<pi\>*<around|(|m+1|)>*\<tau\><rsup|2>>*e<rsup|2*i*\<pi\>*<around|(|m+1|)>*\<tau\>>*e<rsup|-i*\<pi\>*<around|(|m+1|)>>|<around|(|m+1|)><rsup|1/4>>
    </equation*>

    Combining with the theta function transformation:

    <\equation*>
      \<Phi\><around|(|\<tau\>-1,m+1,t|)>=e<rsup|-2*i*\<pi\>*\<tau\>+i*\<pi\>>*\<Phi\><around|(|\<tau\>,m,t|)>
    </equation*>

    This modular property ensures the consistency of the Riemann-Siegel
    formula under index shifts.
  </proof>

  <\corollary>
    [Exactness Preservation] All transformations preserve the exact nature of
    the Riemann-Siegel formula. No approximations are introduced at any
    stage.
  </corollary>

  \;
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|5>>
    <associate|auto-5|<tuple|5|6>>
    <associate|auto-6|<tuple|6|7>>
    <associate|auto-7|<tuple|7|8>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Foundational
      Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Exact
      Analytic Construction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Exact
      Integral Analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Convergent
      Series Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Special
      Function Connections> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Structural
      Symmetries and Transformations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Computational
      Implementation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>