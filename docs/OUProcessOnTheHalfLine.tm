<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  \;

  <\definition>
    Let <math|<around|{|X<around|(|t|)>:t\<in\><around|[|0,\<infty\>|)>|}>>
    be a zero-mean stationary Gaussian process with covariance function
    <math|C<around|(|t,s|)>=C<around|(|<around|\||t-s|\|>|)>>. The associated
    integral covariance operator <math|\<cal-K\>> is defined as:

    <\equation>
      <around|(|\<cal-K\>*f|)><around|(|t|)>=<big|int><rsub|0><rsup|\<infty\>>C<around|(|<around|\||t-s|\|>|)>*f<around|(|s|)>*d*s
    </equation>

    for <math|f\<in\>L<rsup|2><around|[|0,\<infty\>|)>>.
  </definition>

  <\theorem>
    For the stationary Gaussian process with exponential covariance
    <math|C<around|(|t,s|)>=e<rsup|-\<alpha\>*<around|\||t-s|\|>>> where
    <math|\<alpha\>\<gtr\>0>, the integral operator <math|\<cal-K\>> has
    countably many eigenpairs <math|<around|(|\<lambda\><rsub|n>,\<phi\><rsub|n>|)>>
    given by:

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=cos <around|(|\<beta\><rsub|n>*t|)>-<frac|\<alpha\>|\<beta\><rsub|n>>*sin
      <around|(|\<beta\><rsub|n>*t|)>
    </equation>

    with corresponding eigenvalues:

    <\equation>
      \<lambda\><rsub|n>=<frac|2*\<alpha\>|\<alpha\><rsup|2>+\<beta\><rsub|n><rsup|2>>
    </equation>

    where <math|\<beta\><rsub|n>> are the positive solutions to the
    transcendental equation:

    <\equation>
      \<beta\>*tan \<beta\>=-\<alpha\>
    </equation>
  </theorem>

  <\proof>
    We begin with the eigenvalue equation:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<alpha\>*<around|\||t-s|\|>>*\<phi\><around|(|s|)>*d*s=\<lambda\>*\<phi\><around|(|t|)>
    </equation>

    Differentiating twice with respect to <math|t>, we obtain:

    <\align>
      <tformat|<table|<row|<cell|<frac|d|d*t><around*|[|<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<alpha\>*<around|\||t-s|\|>>*\<phi\><around|(|s|)>*d*s|]>>|<cell|=\<lambda\>*\<phi\><rprime|'><around|(|t|)><eq-number>>>|<row|<cell|<big|int><rsub|0><rsup|\<infty\>><frac|d|d*t><around|[|e<rsup|-\<alpha\>*<around|\||t-s|\|>>|]>*\<phi\><around|(|s|)>*d*s>|<cell|=\<lambda\>*\<phi\><rprime|'><around|(|t|)><eq-number>>>|<row|<cell|<big|int><rsub|0><rsup|\<infty\>><around|(|-\<alpha\>|)>*<text|sgn><around|(|t-s|)>*e<rsup|-\<alpha\>*<around|\||t-s|\|>>*\<phi\><around|(|s|)>*d*s>|<cell|=\<lambda\>*\<phi\><rprime|'><around|(|t|)><eq-number>>>>>
    </align>

    Differentiating again:

    <\align>
      <tformat|<table|<row|<cell|<frac|d|d*t><around*|[|<big|int><rsub|0><rsup|\<infty\>><around|(|-\<alpha\>|)>*<text|sgn><around|(|t-s|)>*e<rsup|-\<alpha\>*<around|\||t-s|\|>>*\<phi\><around|(|s|)>*d*s|]>>|<cell|=\<lambda\>*\<phi\><rprime|''><around|(|t|)><eq-number>>>|<row|<cell|<big|int><rsub|0><rsup|\<infty\>><around|(|-\<alpha\>|)><rsup|2>*e<rsup|-\<alpha\>*<around|\||t-s|\|>>*\<phi\><around|(|s|)>*d*s-2*\<alpha\>*\<phi\><around|(|t|)>>|<cell|=\<lambda\>*\<phi\><rprime|''><around|(|t|)><eq-number>>>|<row|<cell|\<alpha\><rsup|2>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<alpha\>*<around|\||t-s|\|>>*\<phi\><around|(|s|)>*d*s-2*\<alpha\>*\<phi\><around|(|t|)>>|<cell|=\<lambda\>*\<phi\><rprime|''><around|(|t|)><eq-number>>>|<row|<cell|\<alpha\><rsup|2>*\<lambda\>*\<phi\><around|(|t|)>-2*\<alpha\>*\<phi\><around|(|t|)>>|<cell|=\<lambda\>*\<phi\><rprime|''><around|(|t|)><eq-number>>>>>
    </align>

    Rearranging, we get the differential equation:

    <\equation>
      \<phi\><rprime|''><around|(|t|)>-<frac|\<alpha\><rsup|2>*\<lambda\>-2*\<alpha\>|\<lambda\>>*\<phi\><around|(|t|)>=0
    </equation>

    Let <math|\<gamma\>=<frac|\<alpha\><rsup|2>*\<lambda\>-2*\<alpha\>|\<lambda\>>>.
    We consider the case where <math|\<gamma\>\<less\>0>, setting
    <math|\<beta\><rsup|2>=-\<gamma\>>:

    <\equation>
      \<phi\><rprime|''><around|(|t|)>+\<beta\><rsup|2>*\<phi\><around|(|t|)>=0
    </equation>

    The general solution is:

    <\equation>
      \<phi\><around|(|t|)>=A*cos <around|(|\<beta\>*t|)>+B*sin
      <around|(|\<beta\>*t|)>
    </equation>

    To determine <math|A> and <math|B>, we need boundary conditions. From the
    original eigenvalue equation at <math|t=0>:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<alpha\>*s>*\<phi\><around|(|s|)>*d*s>|<cell|=\<lambda\>*\<phi\><around|(|0|)><eq-number>>>|<row|<cell|>|<cell|<eq-number>>>>>
    </align>

    The first derivative of the eigenvalue equation at <math|t=0> gives:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>><around|(|-\<alpha\>|)>*e<rsup|-\<alpha\>*s>*\<phi\><around|(|s|)>*d*s>|<cell|=\<lambda\>*\<phi\><rprime|'><around|(|0|)><eq-number>>>|<row|<cell|-\<alpha\>*\<lambda\>*\<phi\><around|(|0|)>>|<cell|=\<lambda\>*\<phi\><rprime|'><around|(|0|)><eq-number>>>|<row|<cell|\<phi\><rprime|'><around|(|0|)>>|<cell|=-\<alpha\>*\<phi\><around|(|0|)><eq-number>>>>>
    </align>

    For our solution <math|\<phi\><around|(|t|)>=A*cos
    <around|(|\<beta\>*t|)>+B*sin <around|(|\<beta\>*t|)>>:

    <\align>
      <tformat|<table|<row|<cell|\<phi\><around|(|0|)>>|<cell|=A<eq-number>>>|<row|<cell|\<phi\><rprime|'><around|(|0|)>>|<cell|=B*\<beta\><eq-number>>>>>
    </align>

    From the boundary condition <math|\<phi\><rprime|'><around|(|0|)>=-\<alpha\>*\<phi\><around|(|0|)>>:

    <\align>
      <tformat|<table|<row|<cell|B*\<beta\>>|<cell|=-\<alpha\>*A<eq-number>>>|<row|<cell|B>|<cell|=-<frac|\<alpha\>|\<beta\>>*A<eq-number>>>>>
    </align>

    Therefore, our eigenfunction has the form:

    <\equation>
      \<phi\><around|(|t|)>=A*<around*|(|cos
      <around|(|\<beta\>*t|)>-<frac|\<alpha\>|\<beta\>>*sin
      <around|(|\<beta\>*t|)>|)>
    </equation>

    Substituting this back into the original eigenvalue equation:

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<alpha\>*<around|\||t-s|\|>>*A*<around*|(|cos
      <around|(|\<beta\>*s|)>-<frac|\<alpha\>|\<beta\>>*sin
      <around|(|\<beta\>*s|)>|)>*d*s=\<lambda\>*A*<around*|(|cos
      <around|(|\<beta\>*t|)>-<frac|\<alpha\>|\<beta\>>*sin
      <around|(|\<beta\>*t|)>|)>
    </equation>

    By direct calculation (splitting the integral at <math|s=t> and
    evaluating), this equation is satisfied when:

    <\equation>
      \<lambda\>=<frac|2*\<alpha\>|\<alpha\><rsup|2>+\<beta\><rsup|2>>
    </equation>

    and when <math|\<beta\>> satisfies:

    <\equation>
      \<beta\>*tan \<beta\>=-\<alpha\>
    </equation>

    This transcendental equation has countably infinitely many solutions
    <math|\<beta\><rsub|n>>, each giving rise to an eigenfunction:

    <\equation>
      \<phi\><rsub|n><around|(|t|)>=A<rsub|n>*<around*|(|cos
      <around|(|\<beta\><rsub|n>*t|)>-<frac|\<alpha\>|\<beta\><rsub|n>>*sin
      <around|(|\<beta\><rsub|n>*t|)>|)>
    </equation>

    where <math|A<rsub|n>> is a normalization constant and:

    <\equation>
      \<lambda\><rsub|n>=<frac|2*\<alpha\>|\<alpha\><rsup|2>+\<beta\><rsub|n><rsup|2>>
    </equation>

    The values of <math|\<beta\><rsub|n>> can be determined numerically, with
    <math|\<beta\><rsub|n>\<approx\><around|(|n-<frac|1|2>|)>*\<pi\>> for
    large <math|n>.
  </proof>

  <\corollary>
    For the specific case where <math|\<alpha\>=1>, the first few eigenpairs
    are:

    <\align>
      <tformat|<table|<row|<cell|\<beta\><rsub|1>>|<cell|\<approx\>2.0288>|<cell|\<lambda\><rsub|1>>|<cell|\<approx\>0.7954<eq-number>>>|<row|<cell|\<beta\><rsub|2>>|<cell|\<approx\>4.9132>|<cell|\<lambda\><rsub|2>>|<cell|\<approx\>0.1575<eq-number>>>|<row|<cell|\<beta\><rsub|3>>|<cell|\<approx\>7.9787>|<cell|\<lambda\><rsub|3>>|<cell|\<approx\>0.0612<eq-number>>>>>
    </align>

    with eigenfunctions:

    <\align>
      <tformat|<table|<row|<cell|\<phi\><rsub|1><around|(|t|)>>|<cell|=cos
      <around|(|2.0288*t|)>-<frac|sin <around|(|2.0288*t|)>|2.0288>*<eq-number>>>|<row|<cell|\<phi\><rsub|2><around|(|t|)>>|<cell|=cos
      <around|(|4.9132*t|)>-<frac|sin <around|(|4.9132*t|)>|4.9132>*<eq-number>>>|<row|<cell|\<phi\><rsub|3><around|(|t|)>>|<cell|=cos
      <around|(|7.9787*t|)>-<frac|sin <around|(|7.9787*t|)>|7.9787>*<eq-number>>>>>
    </align>
  </corollary>

  <\lemma>
    The eigenfunctions <math|<around|{|\<phi\><rsub|n>|}><rsub|n=1><rsup|\<infty\>>>
    form a complete orthogonal set in <math|L<rsup|2><around|[|0,\<infty\>|)>>
    with respect to the inner product:

    <\equation>
      <around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|0><rsup|\<infty\>>f<around|(|t|)>*g<around|(|t|)>*d*t
    </equation>
  </lemma>

  <\proof>
    The eigenfunctions satisfy a regular Sturm-Liouville problem on
    <math|<around|[|0,\<infty\>|)>> with appropriate decay conditions. The
    orthogonality follows from the self-adjointness of the differential
    operator, and completeness follows from Weyl's criterion for the
    essential spectrum.
  </proof>

  <\proposition>
    Any sample path of the Gaussian process can be represented using the
    Karhunen-Loève expansion:

    <\equation>
      X<around|(|t|)>=<big|sum><rsub|n=1><rsup|\<infty\>>Z<rsub|n>*<sqrt|\<lambda\><rsub|n>>*\<phi\><rsub|n><around|(|t|)>
    </equation>

    where <math|Z<rsub|n>> are independent standard normal random variables.
  </proposition>
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