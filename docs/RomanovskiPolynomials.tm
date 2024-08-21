<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Romanovski Polynomials>|<doc-date|>>

  <section*|Short Description>

  Mathematics concept.

  In mathematics, the Romanovski polynomials are one of three finite subsets
  of real orthogonal polynomials discovered by Vsevolod
  Romanovsky<cite|Romanovski1929> (Romanovski in French transcription) within
  the context of probability distribution functions in statistics. They form
  an orthogonal subset of a more general family of little-known Routh
  polynomials introduced by Edward John Routh<cite|Routh1884> in 1884. The
  term Romanovski polynomials was put forward by Raposo,<cite|Raposo2007>
  with reference to the so-called 'pseudo-Jacobi polynomials in Lesky's
  classification scheme.<cite|Lesky1996> It seems more consistent to refer to
  them as Romanovski\URouth polynomials, by analogy with the terms
  Romanovski\UBessel and Romanovski\UJacobi used by Lesky for two other sets
  of orthogonal polynomials.

  In some contrast to the standard classical orthogonal polynomials, the
  polynomials under consideration differ, in so far as for arbitrary
  parameters only a finite number of them are orthogonal, as discussed in
  more detail below.

  <section*|The Differential Equation for the Romanovski Polynomials>

  The Romanovski polynomials solve the following version of the
  hypergeometric differential equation:

  <\equation>
    s<around|(|x|)>*R<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><rprime|''><around|(|x|)>+t<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|1><around|(|x|)>*R<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><rprime|'><around|(|x|)>+\<lambda\><rsub|n>*R<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><around|(|x|)>=0
  </equation>

  where <math|x\<in\><around|(|-\<infty\>,+\<infty\>|)>>

  <\equation>
    s<around|(|x|)>=<around*|(|1+x<rsup|2>|)>
  </equation>

  <\equation>
    t<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|1><around|(|x|)>=2*\<beta\>*x+\<alpha\>
  </equation>

  <math|>and

  <\equation>
    \<lambda\><rsub|n>=-n*<around|(|2*\<beta\>+n-1|)>
  </equation>

  Curiously, they have been omitted from the standard textbooks on special
  functions in mathematical physics and in
  mathematics<cite|Abramowitz1972|Nikiforov1988|Szego1939|Ismail2005> and
  have only a relatively scarce presence elsewhere in the mathematical
  literature.<cite|Askey1987|Zarzo1995>

  The weight functions are:

  <\equation>
    w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=<around*|(|1+x<rsup|2>|)><rsup|\<beta\>-1>*e<rsup|-\<alpha\>
    arccot<around*|(|x|)>>
  </equation>

  they solve Pearson's differential equation:

  <\equation>
    <around|[|s<around|(|x|)>*w<around|(|x|)>|]><rprime|'>=t<around|(|x|)>*w<around|(|x|)>
  </equation>

  <\equation>
    <space|1em>s<around|(|x|)>=1+x<rsup|2>
  </equation>

  that assures the self-adjointness of the differential operator of the
  hypergeometric ordinary differential equation.

  For <math|\<alpha\>=0> and <math|\<beta\>\<less\>0>, the weight function of
  the Romanovski polynomials takes the shape of the Cauchy distribution,
  whence the associated polynomials are also denoted as Cauchy
  polynomials<cite|Witte2000> in their applications in random matrix
  theory.<cite|Forrester2010>

  The Rodrigues formula specifies the polynomial
  <math|R<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><around|(|x|)>> as:

  <\equation>
    R<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><around|(|x|)>=N<rsub|n>*<frac|<frac|<math-up|d><rsup|n>|<math-up|d>x<rsup|n>>*<around*|(|w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*s<around|(|x|)><rsup|n>|)>|w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>*
    \<forall\>0\<leq\>n
  </equation>

  where <math|N<rsub|n>> is a normalization constant. This constant is
  related to the coefficient <math|c<rsub|n>> of the term of degree <math|n>
  in the polynomial <math|R<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><around|(|x|)>>
  by the expression:

  <\equation>
    N<rsub|n>=<frac|<around|(|-1|)><rsup|n>*n!<space|0.17em>c<rsub|n>|<big|prod><rsub|k=0><rsup|n-1>\<lambda\><rsub|n><rsup|<around|(|k|)>>>
  </equation>

  <\equation>
    \<lambda\><rsub|n>=-n*<around*|(|t<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><rprime|'>+<tfrac|1|2><around|(|n-1|)>*s<rprime|''><around|(|x|)>|)>
  </equation>

  which holds for <math|n\<geq\>1>.

  <section*|Relationship Between the Polynomials of Romanovski and Jacobi>

  As shown by Askey, this finite sequence of real orthogonal polynomials can
  be expressed in terms of Jacobi polynomials of imaginary argument and
  thereby is frequently referred to as complexified Jacobi
  polynomials.<cite|Cotfas2004> Namely, the Romanovski equation can be
  formally obtained from the Jacobi equation,<cite|MathWorldJacobiDifferentialEquation>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<around*|(|1-x<rsup|2>|)>*P<rsub|n><rsup|<around|(|\<gamma\>,\<delta\>|)>><rprime|''><around|(|x|)>+t<rsup|<around|(|\<gamma\>,\<delta\>|)>><rsub|1><around|(|x|)>*P<rsub|n><rsup|<around|(|\<gamma\>,\<delta\>|)>><rprime|'><around|(|x|)>+\<lambda\><rsub|n>*P<rsup|<around|(|\<gamma\>,\<delta\>|)>><rsub|n><around|(|x|)>=0>>>>>
  </equation>

  <\equation>
    t<rsup|<around|(|\<gamma\>,\<delta\>|)>><rsub|1><around|(|x|)>=\<delta\>-\<gamma\>-<around|(|\<gamma\>+\<delta\>+2|)>*x
  </equation>

  <\equation>
    \<lambda\><rsub|n>=n*<around|(|n+\<gamma\>+\<delta\>+1|)>
  </equation>

  \<forall\><math|x\<in\><around*|[|-1,1|]>> via the replacements, for real
  <math|x>,

  <\equation>
    x\<to\>i*x
  </equation>

  <\equation>
    <frac|<math-up|d>|<math-up|d>x>\<to\>-i*<frac|<math-up|d>|<math-up|d>x>
  </equation>

  <\equation>
    \<gamma\>=\<delta\><rsup|\<ast\>>=\<beta\>-1+<frac|\<alpha\>*i|2>
  </equation>

  in which case one finds:

  <\equation>
    R<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><around|(|x|)>=i<rsup|n>*P<rsup|<around*|(|\<beta\>-1+<frac|i|2>*\<alpha\>,\<beta\>-1-<frac|i|2>*\<alpha\>|)>><rsub|n>*<around|(|i*x|)>
  </equation>

  (with suitably chosen normalization constants for the Jacobi polynomials).
  The complex Jacobi polynomials on the right are defined via Kuijlaars et
  al. (2003),<cite|Kuijlaars2005> which assures that these are real
  polynomials in <math|x>.

  Since the cited authors discuss the non-hermitian (complex) orthogonality
  conditions only for real Jacobi indexes, the overlap between their analysis
  and definition of Romanovski polynomials exists only if <math|\<alpha\>=0>.
  However, examination of this peculiar case requires more scrutiny beyond
  the limits of this article. Notice the invertibility of:

  <\equation>
    P<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><around|(|x|)>=<around|(|-i|)><rsup|n>*R<rsup|<around*|(|i*<around|(|\<alpha\>-\<beta\>|)>,<frac|1|2>*<around|(|\<alpha\>+\<beta\>|)>+1|)>><rsub|n>*<around|(|-i*x|)>
  </equation>

  where, now, <math|P<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><around|(|x|)>>
  is a real Jacobi polynomial and:

  <\equation*>
    R<rsup|<around*|\<nobracket\>|<around*|(|i*<around|(|\<alpha\>-\<beta\>|)>,<frac|1|2>*<around|(|\<alpha\>+\<beta\>|)>+1|)>|)>><rsub|n>*<around|(|-i*x|)>
  </equation*>

  would be a complex Romanovski polynomial.

  <section*|Properties of Romanovski Polynomials>

  <subsection*|Explicit Construction>

  For real <math|\<alpha\>,\<beta\>> and <math|n=0,1,2>,..., a function
  <math|R<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|n><around|(|x|)>> can be
  defined by the Rodrigues formula as:

  <\equation>
    R<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>\<equiv\><frac|<frac|<math-up|d><rsup|n>|<math-up|d>x<rsup|n>>*<around*|(|w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*s<around|(|x|)><rsup|n>|)>|w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>*
  </equation>

  where <math|w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>> is the
  same weight function as in (2), and <math|s<around|(|x|)>=1+x<rsup|2>> is
  the coefficient of the second derivative of the hypergeometric differential
  equation.

  Note that we have chosen the normalization constants <math|N<rsub|n>=1>,
  which is equivalent to making a choice of the coefficient of highest degree
  in the polynomial, as given by the equation:

  <\equation>
    c<rsub|n>=<frac|1|n!>*<big|prod><rsub|k=0><rsup|n-1><around*|(|2*\<beta\>*<around|(|n-k|)>+n*<around|(|n-1|)>-k*<around|(|k-1|)>\<forall\>|\<nobracket\>>n\<geq\>1
  </equation>

  Also, note that the coefficient <math|c<rsub|n>> does not depend on the
  parameter <math|\<alpha\>>, but only on <math|\<beta\>> and, for particular
  values of <math|\<beta\>>, <math|c<rsub|n>> vanishes (i.e., for all the
  values:

  <\equation>
    \<beta\>=<frac|k*<around|(|k-1|)>-n*<around|(|n-1|)>|2*<around|(|n-k|)>>
  </equation>

  where <math|k=0,...,n-1>). This observation poses a problem addressed
  below.

  For later reference, we write explicitly the polynomials of degree 0, 1,
  and 2,

  <\equation>
    <tabular|<tformat|<table|<row|<cell|R<rsub|0><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>|<cell|=1>>|<row|<cell|R<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|1><around|(|x|)>>|<cell|=<frac|<around*|(|w<rprime|'><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*s<around|(|x|)>+s<rprime|'><around|(|x|)>*w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|)>|w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>*>>|<row|<cell|>|<cell|=t<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=2*\<beta\>*x+\<alpha\>>>|<row|<cell|R<rsup|<around|(|\<alpha\>,\<beta\>|)>><rsub|2><around|(|x|)>>|<cell|=<frac|<frac|<math-up|d>|<math-up|d>x>*<around*|(|s<rsup|2><around|(|x|)>*w<rprime|'><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>+2*s<around|(|x|)>*s<rprime|'><around|(|x|)>*w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|)>|w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>*>>|<row|<cell|>|<cell|=<frac|<frac|<math-up|d>|<math-up|d>x>*<around*|(|s<around|(|x|)>*w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*<around*|(|t<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>+s<rprime|'><around|(|x|)>|)>|)>|w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>*>>|<row|<cell|>|<cell|=<around*|(|2*x+t<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|)>*t<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>+<around*|(|2+t<rprime|'><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>|)>*s<around|(|x|)>>>|<row|<cell|>|<cell|=<around|(|2*\<beta\>+1|)>*<around|(|2*\<beta\>+2|)>*x<rsup|2>+2*<around|(|2*\<beta\>+1|)>*\<alpha\>*x+<around*|(|2*\<beta\>+\<alpha\><rsup|2>+2|)>>>>>>
  </equation>

  <subsection*|Orthogonality>

  The two polynomials, <math|R<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>
  and <math|R<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>>
  with <math|m\<neq\>n>, are orthogonal,<cite|Raposo2007>

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|+\<infty\>>w<rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*R<rsub|m><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>*R<rsub|n><rsup|<around|(|\<alpha\>,\<beta\>|)>><around|(|x|)>=0
  </equation>

  if and only if,

  <\equation>
    m+n\<less\>1-2*\<beta\>
  </equation>

  In other words, for arbitrary parameters, only a finite number of
  Romanovski polynomials are orthogonal. This property is referred to as
  finite orthogonality. However, for some special cases in which the
  parameters depend in a particular way on the polynomial degree, infinite
  orthogonality can be achieved.

  This is the case of a version of the differential equation that has been
  independently encountered anew within the context of the exact solubility
  of the quantum mechanical problem of the trigonometric Rosen\UMorse
  potential and reported in Compean Kirchbach (2006).<cite|Compean2006>
  There, the polynomial parameters <math|\<alpha\>> and <math|\<beta\>> are
  no longer arbitrary but are expressed in terms of the potential parameters,
  <math|a> and <math|b>, and the degree <math|n> of the polynomial according
  to the relations,

  <\equation>
    \<alpha\>\<to\>\<alpha\><rsub|n>=<frac|2*b|n+1+a>
  </equation>

  <\equation>
    \<beta\>\<to\>\<beta\><rsub|n>=-<around|(|a+n+1|)>+1
  </equation>

  <math|\<forall\>n=0,1,2,\<ldots\>,\<infty\>> Correspondingly,
  <math|\<lambda\><rsub|n>> emerges as <math|\<lambda\><rsub|n>=-n*<around|(|2*a+n-1|)>>,
  while the weight function takes the shape:

  <\equation>
    <around*|(|1+x<rsup|2>|)><rsup|-<around|(|a+n+1|)>>*e<rsup|-<frac|2*b|n+a+1>arccot<around*|(|x|)>><text|>
  </equation>

  Finally, the one-dimensional variable, <math|x>, in Compean Kirchbach
  (2006)<cite|Compean2006> has been taken as

  \;

  <\equation>
    x=cot <around*|(|<frac|r|d>|)>
  </equation>

  where <math|r> is the radial distance, while <math|d> is an appropriate
  length parameter. In Compean Kirchbach,<cite|Compean2006> it has been shown
  that the family of Romanovski polynomials corresponding to the infinite
  sequence of parameter pairs,

  <\equation>
    <around*|(|\<alpha\><rsub|1>,\<beta\><rsub|1>|)>,<around*|(|\<alpha\><rsub|2>*\<beta\><rsub|2>|)>,\<ldots\>,<around*|(|\<alpha\><rsub|n>*\<beta\><rsub|n>|)>,\<ldots\>
    as<space|1em>n\<longrightarrow\>\<infty\>
  </equation>

  is orthogonal.

  <subsection*|Generating Function>

  In Weber (2007),<cite|Weber2007> polynomials
  <math|Q<rsub|\<nu\>><rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n|)>><around|(|x|)>>,
  with <math|\<beta\><rsub|n>+n=-a>, and complementary to
  <math|R<rsup|<around|(|\<alpha\><rsub|n>,\<beta\><rsub|n>|)>><rsub|n><around|(|x|)>>
  have been studied, generated in the following way:

  <\equation>
    Q<rsub|\<nu\>><rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n|)>><around|(|x|)>=<frac|<frac|<math-up|d><rsup|\<nu\>>|<math-up|d>x<rsup|\<nu\>>>*w<rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>|)>><around|(|x|)>*<around*|(|1+x<rsup|2>|)><rsup|n>|w<rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>|)>>>*
  </equation>

  In taking into account the relation,

  <\equation>
    w<rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>|)>><around|(|x|)>*<around*|(|1+x<rsup|2>|)><rsup|\<delta\>>=w<rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+\<delta\>|)>><around|(|x|)>
  </equation>

  Equation becomes equivalent to:

  <\equation>
    Q<rsub|\<nu\>><rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n|)>><around|(|x|)>=<frac|<frac|<math-up|d><rsup|\<nu\>>|<math-up|d>x<rsup|\<nu\>>>*w<rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>|)>><around|(|x|)>*<around*|(|1+x<rsup|2>|)><rsup|\<nu\>>|w<rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>|)>>>*=R<rsub|\<nu\>><rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>|)>><around|(|x|)>
  </equation>

  and thus links the complementary to the principal Romanovski polynomials.

  The main attraction of the complementary polynomials is that their
  generating function can be calculated in closed form.<cite|Weber2007> Such
  a generating function, written for the Romanovski polynomials based on
  Equation with the parameters and therefore referring to infinite
  orthogonality, has been introduced as:

  <\equation>
    G<rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>|)>><around|(|x,y|)>=<big|sum><rsub|\<nu\>=0><rsup|\<infty\>>R<rsub|\<nu\>><rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>|)>><around|(|x|)><frac|y<rsup|\<nu\>>|\<nu\>!>
  </equation>

  The notational differences between Weber<cite|Weber2007> and those used
  here are summarized as follows:

  <\itemize>
    <item><math|G<rsup|<around|(|\<alpha\><rsub|n>,\<beta\><rsub|n>|)>><around|(|x,y|)>>
    here versus <math|Q<around|(|x,y;\<alpha\>,-a|)>> there, <math|\<alpha\>>
    there in place of <math|\<alpha\><rsub|n>> here,

    <item><math|a=-\<beta\><rsub|n>-n>, and

    <item><math|Q<rsup|<around|(|\<alpha\>,-a|)>><rsub|\<nu\>><around|(|x|)>>
    in Equation (15) in Weber<cite|Weber2007> corresponding to
    <math|R<rsup|<around|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>|)>><rsub|\<nu\>><around|(|x|)>>
    here.
  </itemize>

  The generating function under discussion obtained in Weber<cite|Weber2007>
  now reads:

  <\equation>
    <with|font-base-size|7|G<rsup|<around|(|\<alpha\><rsub|n>,\<beta\><rsub|n>|)>><around|(|x,y|)>=<around*|(|1+x<rsup|2>|)><rsup|-\<beta\><rsub|n>-n+1>*e<rsup|\<alpha\><rsub|n>arccot<around*|(|x|)>>*<around*|(|1+<around*|(|x+y*<around*|(|1+x<rsup|2>|)>|)><rsup|2>|)><rsup|-<around*|(|-\<beta\><rsub|n>-n+1|)>>*e<rsup|-\<alpha\><rsub|n>arccot<around*|(|x+y*<around*|(|1+x<rsup|2>|)>|)>>>
  </equation>

  <subsection*|Recurrence Relations>

  Recurrence relations between the infinite orthogonal series of Romanovski
  polynomials with the parameters in the above equations follow from the
  generating function,<cite|Weber2007>

  <\equation>
    \<nu\>*<around*|(|\<nu\>+1-2*<around|(|\<beta\><rsub|n>+n|)>|)>*R<rsub|\<nu\>-1><rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>+1|)>><around|(|x|)>+<frac|<math-up|d>|<math-up|d>x>*R<rsub|\<nu\>><rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>|)>><around|(|x|)>=0,
  </equation>

  and

  <\equation>
    <tabular|<tformat|<table|<row|<cell|R<rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>-1|)>><rsub|\<nu\>+1><around|(|x|)>>|<cell|=<around*|(|\<alpha\><rsub|n>-2*x*<around|(|-\<beta\><rsub|n>-n+\<nu\>+1|)>|)>*R<rsub|\<nu\>><rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>|)>>-\<ldots\>>|<cell|>>|<row|<cell|>|<cell|\<ldots\>-\<nu\>*<around*|(|1+x<rsup|2>|)>*<around*|(|2*<around|(|-\<beta\><rsub|n>-n|)>+\<nu\>+1|)>*R<rsub|\<nu\>-1><rsup|<around*|(|\<alpha\><rsub|n>,\<beta\><rsub|n>+n-\<nu\>+1|)>>>|<cell|>>>>>
  </equation>

  as Equations (10) and (23) of Weber (2007)<cite|Weber2007> respectively.

  <section*|See Also>

  <\itemize>
    <item>Associated Legendre functions

    <item>Gaussian quadrature

    <item>Gegenbauer polynomials

    <item>Legendre rational functions

    <item>Turán's inequalities

    <item>Legendre wavelet

    <item>Jacobi polynomials

    <item>Legendre polynomials

    <item>Spherical harmonics

    <item>Trigonometric Rosen\UMorse potential
  </itemize>

  <\bibliography|bib|plain|references>
    \;
  </bibliography>
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-10|<tuple|<with|mode|<quote|math>|\<bullet\>>|7|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-2|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-3|<tuple|10|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-4|<tuple|18|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-5|<tuple|18|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-6|<tuple|22|4|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-7|<tuple|29|5|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-8|<tuple|34|6|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-9|<tuple|36|6|../../.TeXmacs/texts/scratch/no_name_45.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Romanovski1929

      Routh1884

      Raposo2007

      Lesky1996

      Abramowitz1972

      Nikiforov1988

      Szego1939

      Ismail2005

      Askey1987

      Zarzo1995

      Witte2000

      Forrester2010

      Cotfas2004

      MathWorldJacobiDifferentialEquation

      Kuijlaars2005

      Raposo2007

      Compean2006

      Compean2006

      Compean2006

      Weber2007

      Weber2007

      Weber2007

      Weber2007

      Weber2007

      Weber2007

      Weber2007
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Short
      Description> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|The
      Differential Equation for the Romanovski Polynomials>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Relationship
      Between the Polynomials of Romanovski and Jacobi>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Properties
      of Romanovski Polynomials> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Explicit Construction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|Orthogonality
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|Generating Function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|Recurrence Relations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|See
      Also> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>