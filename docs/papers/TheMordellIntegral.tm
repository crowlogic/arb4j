<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Definite Integral
  <math|<big|int><frac|e<rsup|a*t+b*t<rsup|2>>|e<rsup|c*t>+d>*<space|0.17em>d*t>
  and the Analytic Theory of Numbers>|<doc-author|<author-data|<author-name|L.
  J. Mordell>|<author-affiliation|University of Manchester>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>An
    Integral Function connected with the <with|mode|math|\<theta\>>
    Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    First Standard Form> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    Second Standard Form> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    Case when the Standard Forms coalesce>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Reduction
    of the Integral to the Standard Forms>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Miscellaneous
    Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>The
    Case when <with|mode|math|i*a/c<rsup|2>> is Rational and the Gauss's
    Sums> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|9<space|2spc>The
    Approximate Functional Equation of the Thetafunction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|10<space|2spc>Some
    Problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  Professor Siegel<nbsp><cite|Siegel1932> in a memoir recently published
  dealing with the manuscripts left by Riemann has pointed out that Riemann
  dealt with some integrals of the type

  <\equation>
    <label|eq:riemann_integral>I=<big|int><frac|e<rsup|a*t+b*t<rsup|2>>|e<rsup|c*t>+d>*<space|0.17em>d*t
  </equation>

  in his researches on the zeta function. Not only can the usual functional
  equation be thus found, but also an asymptotic formula is obtained for the
  zeta-function of which the first term gives the well known approximate
  functional equation due to Hardy and Littlewood<nbsp><cite|HardyLittlewood1914>.

  Kronecker's evaluation of the Gauss's sums by special integrals of this
  kind is classic. Not so well known is his evaluation of the integral

  <\equation>
    <label|eq:kronecker_integral><big|int><rsub|0><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*t<rsup|2>/n>|cosh
    a*t>*<space|0.17em>d*t
  </equation>

  in finite terms when <math|n> is an integer. The general integral or
  particular cases have also been considered by Lerch<nbsp><cite|Lerch1892>,
  Hardy<nbsp><cite|Hardy1904>, Ramanujan<nbsp><cite|Ramanujan1915a>, van der
  Corput<nbsp><cite|vanderCorput1922> and myself. My results which included
  the complete evaluation of the general integral, were found in September
  1918 and published in 1920 in volume 48 of the Quarterly Journal. The paper
  is not well known and has even escaped the notice of the editors of the
  Fortschritte. Further, it is not easily accessible outside of Great
  Britain. It seems in view of the interest aroused by Siegel's paper that it
  might be desirable to give a more accessible and fuller account of the
  integral, and the considerations leading to it and the results deduced from
  it. These are concerned chiefly with formulae involving the class number of
  definite binary quadratics, many of which are also not easily accessible
  and suggest interesting problems for research. I also include some new and
  allied results dealing with the approximate functional equation of the
  theta function.

  The starting point of my investigations was the theory of the positive,
  definite binary quadratic form

  <\equation>
    <label|eq:binary_quadratic_form>a*x<rsup|2>+2*h*x*y+b*y<rsup|2>,
  </equation>

  where <math|a,h,b> are integers, so that the determinant of the form is

  <\equation>
    <label|eq:determinant>h<rsup|2>-a*b=-D\<less\>0.
  </equation>

  Let <math|F<around|(|D|)>> be the number of uneven classes of forms of
  given determinant <math|-D>, that is, classes of forms in which <math|a>
  and <math|b> are not both even, and let <math|G<around|(|D|)>> be the total
  number of classes of forms of determinant <math|-D>. It proves convenient
  to assume that weights <math|<frac|1|2>,<frac|1|3>> are attached to the
  forms <math|<around|(|a,0,a|)>>, <math|<around|(|2*a,a,2*a|)>>
  respectively, and also that

  <\equation>
    <label|eq:F0_G0>F<around|(|0|)>=0,<space|1em>G<around|(|0|)>=-<frac|1|12>.
  </equation>

  The formulae for the class number are nearly a century old. It is well
  known that Dirichlet proved that when <math|-D> is negative and has no
  squared factors <math|\<gtr\>1>,

  <\equation>
    <label|eq:dirichlet_formula>F<around|(|D|)>=<frac|<sqrt|D>|\<pi\>>*<around*|(|<around*|(|<frac|1|1>|)>+<around*|(|<frac|1|3>|)>+<around*|(|<frac|1|5>|)>+\<cdots\>|)>
  </equation>

  Another formula published by me<nbsp><cite|Mordell1916> some years ago
  states that for all <math|-D\<less\>0>,

  <\equation>
    <label|eq:mordell_formula>F<around|(|D|)>=<frac|<sqrt|D>|\<pi\>>*<around*|(|<frac|N<around|(|1|)>|1>-<frac|N<around|(|3|)>|3>+<frac|N<around|(|5|)>|5>-\<cdots\>|)>,
  </equation>

  where <math|N<around|(|n|)>> is the number of solutions mod <math|n> of the
  congruence

  <\equation>
    <label|eq:congruence>x<rsup|2>\<equiv\>D<pmod|n>.
  </equation>

  These series can be summed in finite terms, but none of these formulae
  would suggest the existence of the so-called class relation formulae
  originally discovered by Kronecker. One is

  <\equation>
    <label|eq:class_relation>F<around|(|n|)>+2*F*<around|(|n-1<rsup|2>|)>+2*F*<around|(|n-2<rsup|2>|)>+\<cdots\>=I<around|(|n|)>-\<Gamma\><around|(|n|)>,
  </equation>

  where the summation on the left is continued so long as the argument of the
  function is not negative; <math|\<Gamma\><around|(|n|)>> denotes the sum of
  those divisors of <math|n> which are <math|\<less\><sqrt|n>> and of the
  same parity as their conjugate divisors, a weight <math|<frac|1|2>> being
  attached to <math|<sqrt|n>> if this is a divisor; <math|I<around|(|n|)>>
  represents the sum of those divisors of <math|n> whose conjugates are
  uneven.

  Kronecker proved his formula originally by comparing two expressions for
  the degree of the modular equations in the complex multiplication of
  elliptic functions. He and Hermite found other proofs from the expansion as
  Fourier series of products and quotients of thetafunctions. The real
  difficulty here of course is the selection of the appropriate functions.
  Many very important results were found by other writers especially
  Gierster, Hurwitz, who developed his theory of modular correspondences,
  Petr and Humbert. A direct method was developed by
  myself<nbsp><cite|Mordell1916> depending upon expansions involving certain
  integral functions connected with the thetafunctions. A more detailed
  account of the whole subject and references will be found in Chapter 6 of
  the third volume of Dickson's History of the Theory of Numbers.

  The plan of this paper is as follows. In
  Section<nbsp><reference|sec:integral_function>, I introduce an integral
  function, <math|f<around|(|x|)>>, the study of which led me to consider
  these integrals. It is shown in Section<nbsp><reference|sec:standard_forms>
  that the general integral can be reduced to three standard forms
  corresponding to the cases <math|\<Re\>*<around|(|a/c<rsup|2>|)>\<less\>0>,
  <math|\<gtr\>0>, <math|=0>. The first is evaluated in
  Section<nbsp><reference|sec:first_standard_form> by means of
  <math|f<around|(|x|)>>, and the second in
  Section<nbsp><reference|sec:second_standard_form> by means of an incomplete
  theta series. These two forms coalesce when
  <math|\<Re\>*<around|(|a/c<rsup|2>|)>=0> and this is dealt with in
  Section<nbsp><reference|sec:coalesce_case> which also includes the
  evaluation of the integral in finite terms when <math|i*a/c<rsup|2>> is a
  rational number. A few miscellaneous results are given in
  Section<nbsp><reference|sec:miscellaneous_results>.
  Section<nbsp><reference|sec:gauss_sums> deals again with the case when
  <math|i*a/c<rsup|2>> is rational and includes the method of evaluation of
  the Gauss's sums, to which I was led and which I published in 1918. The
  case when <math|i*a/c<rsup|2>> is irrational is resumed in
  Section<nbsp><reference|sec:approximate_functional_equation> and it is
  shown to contain, in particular, the result for the approximate functional
  equation of the thetafunction. Finally in
  Section<nbsp><reference|sec:problems>, I mention some problems awaiting
  solution.

  A variation of the first standard form had been considered by
  Lerch<nbsp><cite|Lerch1892> nearly forty years ago, but I was not aware of
  this when I wrote my Quarterly Journal paper in 1918. He evaluated his
  integral in two entirely different ways. In one, it follows as an obvious
  consequence of some expansions involving functions similar to
  <math|f<around|(|x|)>>, which of course are well known in connection with
  the expansions of doubly periodic and allied functions. In the other, it is
  deduced by an application of Poisson's summation formula to a series of the
  type <math|f<around|(|x|)>>. His results require the application of contour
  integration for the transformation of various integrals. He finds from the
  value of his integrals, the functional equations corresponding to
  equations<nbsp><eqref|eq:functional_eq_1>
  and<nbsp><eqref|eq:functional_eq_2> and proves that their solution is
  unique. Some of his results are given in
  Section<nbsp><reference|sec:miscellaneous_results>.

  My procedure is fundamentally different. After showing how I was led to
  consider the first standard form, I prove by simple contour integration
  that the integral satisfies two functional equations which define the
  integral uniquely. It is now a simple matter to solve these equations. The
  whole procedure makes comparatively little use of detailed results or
  expansions and is a useful addition to the known standard methods of
  evaluating contour integrals, especially when the results permit of
  evaluation in finite terms by means of elementary functions.

  Another variation of the first standard form had been considered by
  Ramanujan<nbsp><cite|Ramanujan1919> about the same time as myself. By
  expressing it as double integral, he finds the functional equations
  satisfied by the integral. He does not solve them except in the particular
  cases corresponding to my rational <math|i*a/c<rsup|2>>, or when the
  parameters are such that the solution is given by iteration of the
  equations, say the first <math|m> times and the second <math|n> times.

  <section|An Integral Function connected with the <math|\<theta\>>
  Functions><label|sec:integral_function>

  Write as the definition of the thetafunctions,

  <\align>
    <tformat|<table|<row|<cell|\<theta\><rsub|00><around|(|x,\<omega\>|)>>|<cell|=<big|sum><rsub|m=-\<infty\>><rsup|\<infty\>>q<rsup|m<rsup|2>>*e<rsup|2*\<pi\>*i*m*x>,<eq-number><label|eq:theta00_def>>>|<row|<cell|\<theta\><rsub|10><around|(|x,\<omega\>|)>>|<cell|=<big|sum><rsub|m<text|odd>>q<rsup|m<rsup|2>>*e<rsup|2*\<pi\>*i*m*x>,<eq-number><label|eq:theta10_def>>>|<row|<cell|\<theta\><rsub|01><around|(|x,\<omega\>|)>>|<cell|=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><around|(|-1|)><rsup|n>*q<rsup|n<rsup|2>>*e<rsup|2*\<pi\>*i*n*x>,<eq-number><label|eq:theta01_def>>>|<row|<cell|\<theta\><rsub|11><around|(|x,\<omega\>|)>>|<cell|=<big|sum><rsub|m<text|odd>><around|(|-1|)><rsup|<around|(|m-1|)>/2>*q<rsup|m<rsup|2>>*e<rsup|2*\<pi\>*i*m*x>.<eq-number><label|eq:theta11_def>>>>>
  </align>

  As usual, <math|q=e<rsup|\<pi\>*i*\<omega\>>> with
  <math|\<Im\><around|(|\<omega\>|)>\<gtr\>0>. We shall sometimes write
  <math|\<theta\><rsub|00><around|(|x|)>> instead of
  <math|\<theta\><rsub|00><around|(|x,\<omega\>|)>> when the argument
  <math|\<omega\>> is obvious and similarly in other cases. We write

  <\equation>
    <label|eq:theta00_short>\<theta\><rsub|00>=\<theta\><rsub|00><around|(|0,\<omega\>|)>=<big|sum><rsub|m=-\<infty\>><rsup|\<infty\>>q<rsup|m<rsup|2>>.
  </equation>

  Some of the simpler properties of these functions are typified by

  <\align>
    <tformat|<table|<row|<cell|\<theta\><rsub|11>*<around|(|x+1|)>>|<cell|=-\<theta\><rsub|11><around|(|x|)>,<eq-number><label|eq:theta_prop1>>>|<row|<cell|\<theta\><rsub|11>*<around|(|x+\<omega\>|)>>|<cell|=-e<rsup|-\<pi\>*i*<around|(|2*x+\<omega\>|)>>*\<theta\><rsub|11><around|(|x|)>,<eq-number><label|eq:theta_prop2>>>>>
  </align>

  and so <math|\<theta\><rsub|11><around|(|x|)>> has a simple zero at the
  points <math|x=a+b*\<omega\>> where <math|a,b> are any integers. Further
  the thetafunction possesses a simple transformation theorem of which
  particular cases are

  <\align>
    <tformat|<table|<row|<cell|\<theta\><rsub|11><around*|(|<frac|x|\<omega\>>,-<frac|1|\<omega\>>|)>>|<cell|=-i*<sqrt|-i*\<omega\>>*e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>*\<theta\><rsub|11><around|(|x,\<omega\>|)>,<eq-number><label|eq:theta_transform1>>>|<row|<cell|\<theta\><rsub|00><around*|(|<frac|x|\<omega\>>,-<frac|1|\<omega\>>|)>>|<cell|=<sqrt|-i*\<omega\>>*e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>*\<theta\><rsub|00><around|(|x,\<omega\>|)>,<eq-number><label|eq:theta_transform2>>>>>
  </align>

  where the radical here, and throughout this paper, denotes that value with
  a positive real part.

  Also

  <\align>
    <tformat|<table|<row|<cell|\<theta\><rsub|00><around|(|0,\<omega\>|)>>|<cell|=<big|prod><rsub|n=1><rsup|\<infty\>><around|(|1-q<rsup|2*n>|)>*<around|(|1+q<rsup|2*n-1>|)><rsup|2>,<eq-number><label|eq:theta_product1>>>|<row|<cell|\<theta\><rsub|01><around|(|0,\<omega\>|)>>|<cell|=<big|prod><rsub|n=1><rsup|\<infty\>><around|(|1-q<rsup|2*n>|)>*<around|(|1-q<rsup|2*n-1>|)><rsup|2>,<eq-number><label|eq:theta_product2>>>|<row|<cell|\<theta\><rsub|10><around|(|0,\<omega\>|)>>|<cell|=2*q<rsup|1/4>*<big|prod><rsub|n=1><rsup|\<infty\>><around|(|1-q<rsup|2*n>|)>*<around|(|1+q<rsup|2*n>|)><rsup|2>.<eq-number><label|eq:theta_product3>>>>>
  </align>

  The integral function is defined by the series

  <\equation>
    <label|eq:integral_function>f<around|(|x,\<omega\>|)>=<big|sum><rsub|m<text|odd>><frac|q<rsup|m<rsup|2>/4>*e<rsup|\<pi\>*i*m*x>|1-q<rsup|m>>.
  </equation>

  It is of a type which can be defined uniquely by two equations such as

  <\align>
    <tformat|<table|<row|<cell|f*<around|(|x+1|)>+f<around|(|x|)>>|<cell|=0,<eq-number><label|eq:functional_eq_1>>>|<row|<cell|f*<around|(|x+\<omega\>|)>+f<around|(|x|)>>|<cell|=\<theta\><rsub|11><around|(|x|)>.<eq-number><label|eq:functional_eq_2>>>>>
  </align>

  For if two integral functions satisfied these equations, their difference
  <math|d<around|(|x|)>> would satisfy

  <\align>
    <tformat|<table|<row|<cell|d*<around|(|x+1|)>+d<around|(|x|)>>|<cell|=0,<eq-number><label|eq:diff_eq1>>>|<row|<cell|d*<around|(|x+\<omega\>|)>+d<around|(|x|)>>|<cell|=0,<eq-number><label|eq:diff_eq2>>>>>
  </align>

  and so unless <math|d<around|(|x|)>=0>, it would have as many poles as
  zeros in the parallelogram, vertices at <math|0,1,\<omega\>,1+\<omega\>>,
  as is easily seen by considering the integral

  <\equation>
    <label|eq:residue_integral><big|oint><frac|d<rprime|'><around|(|z|)>|d<around|(|z|)>>*d*z
  </equation>

  around the parallelogram.

  Some simple properties of <math|f<around|(|x|)>> are

  <\align>
    <tformat|<table|<row|<cell|f*<around|(|-x|)>+f*<around|(|x+\<omega\>|)>>|<cell|=0<eq-number><label|eq:f_prop1>>>|<row|<cell|f<around|(|x|)>-f*<around|(|-x|)>>|<cell|=\<theta\><rsub|11>*<around|(|2*x|)><eq-number><label|eq:f_prop2>>>|<row|<cell|f*<around|(|a+b*\<omega\>|)>>|<cell|=<around|(|-1|)><rsup|a+b>*f<around|(|0|)><eq-number><label|eq:f_prop3>>>>>
  </align>

  if <math|a> and <math|b> are any integers, as then
  <math|\<theta\><rsub|11>*<around|(|a+b*\<omega\>|)>=0>.

  Also

  <\equation>
    <label|eq:f_zero>f<around|(|0|)>=<big|sum><rsub|m<text|odd>><frac|1|1-q<rsup|m>>
  </equation>

  as is easily proved by putting <math|x=<frac|1|2>> in the expansion

  <\equation>
    <label|eq:f_expansion><frac|\<theta\><rsub|01><around|(|x|)>|\<theta\><rsub|00><around|(|x|)>>=<frac|\<pi\>|\<omega\>>*<big|sum><rsub|m<text|odd>><frac|q<rsup|m<rsup|2>/4>*e<rsup|\<pi\>*i*m*x>|1-q<rsup|m>>
  </equation>

  Hence from equation<nbsp><eqref|eq:theta_product2>

  <\equation>
    <label|eq:f_zero_expanded>f<around|(|0|)>=<big|sum><rsub|m<text|odd>><frac|1|1-q<rsup|m>>=<frac|1|4*\<pi\>*i>*<frac|d|d*\<omega\>>*log
    \<theta\><rsub|00><around|(|0,\<omega\>|)>
  </equation>

  The importance of functions such as <math|f<around|(|x|)>> in class number
  formulae arises from two reasons. The first is that the derivative
  <math|f<rprime|'><around|(|0|)>> can be expressed very simply in terms of
  power series whose general coefficient involves <math|F<around|(|n|)>>.
  Thus if we take another function of the type <math|f<around|(|x|)>> and
  define an integral function <math|f<rsub|01><around|(|x|)>> by

  <\equation>
    <label|eq:f01_def>f<rsub|01>*<around|(|x+1|)>=f<rsub|01><around|(|x|)>,<space|1em>f<rsub|01>*<around|(|x+\<omega\>|)>+f<rsub|01><around|(|x|)>=\<theta\><rsub|01><around|(|x|)>,
  </equation>

  it can be shown<nbsp><cite|Mordell1916> that

  <\equation>
    <label|eq:f01_series><frac|f<rsub|01><rprime|'><around|(|0|)>|\<theta\><rsub|01><around|(|0|)>>=-4*\<pi\>*i*<big|sum><rsub|n=1><rsup|\<infty\>>F<around|(|n|)>*q<rsup|n>=-4*\<pi\>*i*\<Omega\><around|(|\<omega\>|)>
  </equation>

  say. This gives a simple generating function for
  <math|\<Omega\><around|(|\<omega\>|)>>. There are similar functions e.g.
  <math|f<rsub|00><around|(|x|)>> which is really
  <math|f<rsub|01><around|(|x,\<omega\>+1|)>>.

  The second reason is that the function

  <\equation>
    <label|eq:ratio_function><frac|f<rsub|01><around|(|x|)>*\<theta\><rsub|s><around|(|x|)>|\<theta\><rsub|00><around|(|x|)>>
  </equation>

  where <math|\<theta\><rsub|s><around|(|x|)>> is a thetafunction of order
  <math|s>, sometimes permits of a simple expansion from which formulae
  analogous to equation<nbsp><eqref|eq:class_relation> can be found for

  <\equation>
    <label|eq:class_relation_general>F<around|(|n|)>+2*F*<around|(|n-s\<cdot\>1<rsup|2>|)>+2*F*<around|(|n-s\<cdot\>2<rsup|2>|)>+2*F*<around|(|n-s\<cdot\>3<rsup|2>|)>+\<cdots\>.
  </equation>

  See also Section<nbsp><reference|sec:problems> in this connection.

  The discovery of such relations should be facilitated by the study of the
  function <math|\<Omega\><around|(|\<omega\>|)>> and the application of the
  theory of the modular functions when possible. Thus the singularities of
  <math|\<Omega\><around|(|\<omega\>|)>> are given by the
  expansion<nbsp><cite|Mordell1920>

  <\equation>
    <label|eq:omega_expansion>\<Omega\><around*|(|<frac|a*\<tau\>+b|c*\<tau\>+d>|)>=<around|(|c*\<tau\>+d|)>*\<Omega\><around|(|\<tau\>|)>+<frac|c|12>+<frac|1|2>*<big|sum><rsub|a,b><around*|(|<frac|a|b>|)>,
  </equation>

  where the double series is summed first for
  <math|a=0,\<pm\>2,\<pm\>4,\<ldots\>> and then for <math|b=1,3,5,\<ldots\>>
  in this order. The symbol <math|<around*|(|<frac|a|b>|)>> is the Jacobi
  symbol of quadratic residuacity. If <math|a> is not prime to <math|b>,
  <math|<around*|(|<frac|a|b>|)>=0> except that it equals 1 when
  <math|a=0,b=1>.

  It becomes important now to discover some simple relation connecting
  <math|\<Omega\><around|(|\<omega\>|)>> and
  <math|\<Omega\>*<around|(|-1/\<omega\>|)>>. I found that

  <\equation>
    <label|eq:omega_relation1><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|t*e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|e<rsup|2*\<pi\>*t>-1>*d*t=<frac|i|2*\<omega\>>*<around*|[|-2*\<Omega\><around|(|\<omega\>|)>+2*\<Omega\>*<around|(|-1/\<omega\>|)>+<frac|1|4>*log
    \<theta\><rsub|00><around|(|0,\<omega\>|)>|]>,
  </equation>

  <\equation>
    <label|eq:omega_relation2><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|t*e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|e<rsup|2*\<pi\>*t>+1>*d*t=<frac|1|2*\<omega\>>*<big|sum><rsub|n=1><rsup|\<infty\>><around|(|-1|)><rsup|n-1>*F*<around|(|4*n-1|)>*q<rsub|1><rsup|4*n-1>+<frac|1|2*\<omega\>>*<big|sum><rsub|n=1><rsup|\<infty\>><around|(|-1|)><rsup|n-1>*F*<around|(|2*n|)>*q<rsub|1><rsup|2*n>
  </equation>

  where <math|q<rsub|1>=e<rsup|-\<pi\>*i/\<omega\>>>.

  From these can be deduced relations such as

  <\equation>
    <label|eq:class_number_sum><big|sum><rsub|n=1><rsup|\<infty\>><frac|F<around|(|n|)>|<around|(|z+n|)><rsup|2>>+<big|sum><rsub|n=1><rsup|\<infty\>><frac|F<around|(|n|)>|<around|(|z+n|)><rsup|2>>=<frac|1|\<pi\><rsup|2>>*<big|sum><rsub|n=1><rsup|\<infty\>><frac|F<around|(|n|)>*e<rsup|2*\<pi\>*i*<sqrt|n>*z>|n<rsup|1/2>>+<frac|1|2>*<big|sum><rsub|n=1><rsup|\<infty\>><frac|4*F<around|(|n|)>-3*G<around|(|n|)>|<around|(|z+n|)><rsup|2>>
  </equation>

  <\equation>
    <label|eq:class_number_sum2>=<frac|1|4>*<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|-1|)><rsup|n>*F*<around|(|4*n+3|)>|n<rsup|2>+<around|(|4*n+3|)><rsup|2>>+<frac|1|4>*<big|sum><rsub|n=0><rsup|\<infty\>><frac|1|n<rsup|2>+1/4>,
  </equation>

  where <math|\<Re\><around|(|z|)>\<gtr\>0>.

  The consideration of such questions obviously suggests the evaluation of
  <math|f<rprime|'><around|(|x/\<omega\>,-1/\<omega\>|)>> in terms of
  <math|f<around|(|x,\<omega\>|)>> and led me to the theorem of the next
  section and then to the general integral. The
  result<nbsp><eqref|eq:omega_relation1> follows on differentiating both
  sides of equation<nbsp><eqref|eq:main_theorem> for <math|x> and putting
  <math|x=0>. The integral<nbsp><eqref|eq:omega_relation1> had been
  previously considered by Ramanujan<nbsp><cite|Ramanujan1915b> and he proved
  the characteristic property

  <\equation>
    <label|eq:ramanujan_property><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|t*e<rsup|-\<pi\>*i*t<rsup|2>/\<omega\>>|e<rsup|2*\<pi\>*t>-1>*d*t=f<around|(|\<omega\>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|t*e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|e<rsup|2*\<pi\>*t>-1>*d*t
  </equation>

  in a slightly different form and in an entirely different way. He also
  gives some applications to the Riemann zetafunction, but naturally the
  connection of the integral with the class number was unknown to him.

  <section|The First Standard Form><label|sec:first_standard_form>

  I now proceed to the proof of the

  <\theorem>
    <label|thm:main_theorem>

    <\equation>
      <label|eq:main_theorem><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>-1>*d*t=<frac|f<around|(|-x/\<omega\>,-1/\<omega\>|)>+i*\<omega\>*f<around|(|x,\<omega\>|)>|\<omega\>*\<theta\><rsub|11><around|(|x,\<omega\>|)>>,
    </equation>

    where the path of integration may be taken as either the real axis of
    <math|t> indented by the lower half of a small circle described about the
    origin as centre, say the path <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>>,
    or as a straight line parallel to the real axis of <math|t> and below it
    at a distance less than unity. Such a path may be denoted by
    <math|P<rsub|0,-1>>. We remark again that
    <math|\<Im\><around|(|\<omega\>|)>\<gtr\>0>. The case
    <math|\<Im\><around|(|\<omega\>|)>=0> will be treated in
    Section<nbsp><reference|sec:coalesce_case>.
  </theorem>

  <\proof>
    For consider the function <math|\<Phi\><around|(|x|)>> defined by

    <\equation>
      <label|eq:phi_def>\<theta\><rsub|11><around|(|x,\<omega\>|)>*\<Phi\><around|(|x|)>=f<around|(|x/\<omega\>,-1/\<omega\>|)>+i*\<omega\>*f<around|(|x,\<omega\>|)>.
    </equation>

    It is a meromorphic function of <math|x> with apparently simple poles at
    the points <math|x=a+b*\<omega\>> where <math|a> and <math|b> are any
    integers. But when <math|x=a+b*\<omega\>>, the numerator of
    <math|\<Phi\><around|(|x|)>> is

    <\align>
      <tformat|<table|<row|<cell|>|<cell|f<around*|(|<frac|a+b*\<omega\>|\<omega\>>,-<frac|1|\<omega\>>|)>+i*\<omega\>*f<around|(|a+b*\<omega\>,\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|a+b>*<around*|[|f<around*|(|<frac|b|\<omega\>>,-<frac|1|\<omega\>>|)>+i*\<omega\>*f<around|(|0,\<omega\>|)>|]>=0<eq-number>>>>>
    </align>

    from equation<nbsp><eqref|eq:f_zero>, and so <math|\<Phi\><around|(|x|)>>
    really defines an integral function of <math|x>.

    The function <math|\<Phi\><around|(|x|)>> satisfies two simple functional
    equations, namely,

    <\align>
      <tformat|<table|<row|<cell|\<Phi\>*<around|(|x-1|)>-\<Phi\><around|(|x|)>>|<cell|=<sqrt|-i*\<omega\>>*e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>,<eq-number><label|eq:phi_functional1>>>|<row|<cell|\<Phi\>*<around|(|x+\<omega\>|)>*e<rsup|\<pi\>*i*<around|(|2*x+\<omega\>|)>>-\<Phi\><around|(|x|)>>|<cell|=-i*\<omega\>*e<rsup|\<pi\>*i*<around|(|2*x+\<omega\>|)>>.<eq-number><label|eq:phi_functional2>>>>>
    </align>

    For

    <\align>
      <tformat|<table|<row|<cell|>|<cell|\<theta\><rsub|11><around|(|x-1,\<omega\>|)>*\<Phi\>*<around|(|x-1|)>-\<theta\><rsub|11><around|(|x,\<omega\>|)>*\<Phi\><around|(|x|)><eq-number>>>|<row|<cell|>|<cell|=f<around*|(|<frac|x-1|\<omega\>>,-<frac|1|\<omega\>>|)>-f<around*|(|<frac|x|\<omega\>>,-<frac|1|\<omega\>>|)>+i*\<omega\>*<around|[|f<around|(|x-1,\<omega\>|)>-f<around|(|x,\<omega\>|)>|]><eq-number>>>>>
    </align>

    and gives equation<nbsp><eqref|eq:phi_functional1>.

    Next

    <\align>
      <tformat|<table|<row|<cell|>|<cell|e<rsup|-\<pi\>*i*<around|(|2*x+\<omega\>|)>>*\<theta\><rsub|11><around|(|x,\<omega\>|)>*\<Phi\>*<around|(|x+\<omega\>|)>-\<theta\><rsub|11><around|(|x,\<omega\>|)>*\<Phi\><around|(|x|)><eq-number>>>|<row|<cell|>|<cell|=f<around*|(|<frac|x+\<omega\>|\<omega\>>,-<frac|1|\<omega\>>|)>+i*\<omega\>*<around|[|f<around|(|x+\<omega\>,\<omega\>|)>-f<around|(|x,\<omega\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=f<around*|(|<frac|x|\<omega\>>+1,-<frac|1|\<omega\>>|)>+i*\<omega\>*<around|[|\<theta\><rsub|11><around|(|x,\<omega\>|)>-f<around|(|x,\<omega\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=\<theta\><rsub|11><around|(|x,\<omega\>|)>*\<Phi\><around|(|x|)>+i*\<omega\>*\<theta\><rsub|11><around|(|x,\<omega\>|)>,<eq-number>>>>>
    </align>

    and gives equation<nbsp><eqref|eq:phi_functional2>.

    These equations define uniquely the integral function
    <math|\<Phi\><around|(|x|)>>. For if <math|d<around|(|x|)>> is the
    difference of two integral functions satisfying these equations, then

    <\align>
      <tformat|<table|<row|<cell|d*<around|(|x-1|)>-d<around|(|x|)>>|<cell|=0,<eq-number><label|eq:d_functional1>>>|<row|<cell|d*<around|(|x+\<omega\>|)>-e<rsup|\<pi\>*i*<around|(|2*x+\<omega\>|)>>*d<around|(|x|)>>|<cell|=0.<eq-number><label|eq:d_functional2>>>>>
    </align>

    Hence if <math|d<around|(|x|)>> is not identically zero, it must have at
    least one pole in the parallelogram, vertices at
    <math|0,1,\<omega\>,1+\<omega\>>, as is easily seen from

    <\equation>
      <label|eq:d_residue><big|oint><frac|d<rprime|'><around|(|z|)>|d<around|(|z|)>>*d*z.
    </equation>

    Another form for the solution of equations<nbsp><eqref|eq:phi_functional1>
    and<nbsp><eqref|eq:phi_functional2> can be found on noting that if
    <math|a> and <math|<sqrt|b>> have positive real parts,

    <\equation>
      <label|eq:gaussian_integral><big|int><rsub|0><rsup|\<infty\>>e<rsup|-a*t-b/t>*d*t=<sqrt|<frac|\<pi\>|b>>*e<rsup|-2*<sqrt|a*b>>,
    </equation>

    where the path of integration is <math|P<rsub|0,-1>>. Hence
    equation<nbsp><eqref|eq:phi_functional1> can be written as

    <\equation>
      <label|eq:phi_integral_form>\<Phi\>*<around|(|x-1|)>-\<Phi\><around|(|x|)>=<big|int><rsub|P<rsub|0,-1>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>-1>*d*t.
    </equation>

    This is evidently satisfied by the following value for
    <math|\<Phi\><around|(|x|)>>,

    <\equation>
      <label|eq:phi_solution>\<Phi\><around|(|x|)>=\<omega\>*<big|int><rsub|P<rsub|0,-1>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>-1>*d*t,
    </equation>

    the integral being taken along <math|P<rsub|0,-1>>. But the integral is
    obviously an integral function of <math|x>, and it will now be shown that
    it also satisfies equation<nbsp><eqref|eq:phi_functional2>, so that the
    integral is really another form for <math|\<Phi\><around|(|x|)>>.

    For consider the integral

    <\equation>
      <label|eq:contour_integral><big|oint><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*<around|(|x+\<omega\>|)>>|e<rsup|2*\<pi\>*t>-1>*d*t
    </equation>

    taken along the sides of a rectangle with vertices <math|A,B,C,D> at the
    points <math|\<pm\>X-i*\<lambda\>,\<pm\>X+i*<around|(|1-\<lambda\>|)>>
    where <math|\<lambda\>> is any fixed real number with
    <math|0\<less\>\<lambda\>\<less\>1>. Make <math|X\<to\>\<infty\>>. The
    integrals along the sides <math|A*D,C*B\<to\>0>, for writing
    <math|t=\<pm\>X+i*n> so that <math|-\<lambda\>\<leq\>n\<leq\>1-\<lambda\>>,
    the modulus of the integrand is

    <\equation>
      <label|eq:integrand_bound>O<around|(|e<rsup|\<pi\>*i*\<omega\>*X<rsup|2>-\<mu\>*X>|)>,
    </equation>

    where <math|\<mu\>> is independent of <math|n>. The integral along
    <math|B*A\<to\>\<Phi\><around|(|x|)>>, and that along <math|D*C> to
    <math|-e<rsup|-\<pi\>*i*<around|(|2*x+\<omega\>|)>>*\<Phi\>*<around|(|x+\<omega\>|)>>
    on writing <math|t+i> for <math|t> and noting that

    <\equation>
      <label|eq:shift_identity>\<pi\>*i*\<omega\>*<around|(|t+i|)><rsup|2>-2*\<pi\>*i*t*<around|(|x+\<omega\>|)>=\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x-\<pi\>*i*<around|(|2*x+\<omega\>|)>.
    </equation>

    The integrand is analytic in <math|A*B*C*D> except for a simple pole at
    <math|t=0> with residue <math|<frac|1|2*\<pi\>*i>>.

    Hence by Cauchy's theorem

    <\equation>
      <label|eq:cauchy_result>\<Phi\><around|(|x|)>-e<rsup|-\<pi\>*i*<around|(|2*x+\<omega\>|)>>*\<Phi\>*<around|(|x+\<omega\>|)>=i*\<omega\>,
    </equation>

    and the identification of <math|\<Phi\><around|(|x|)>> with the integral
    is completed.
  </proof>

  The integral arising when 1 in the denominator is replaced by any constant
  <math|d=e<rsup|\<pi\>*i*\<lambda\>>>, say, has its value given by

  <\equation>
    <label|eq:general_constant><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>-e<rsup|\<pi\>*i*\<lambda\>>>*d*t=e<rsup|-\<pi\>*i*<around|(|x<rsup|2>/\<omega\>+2*x*\<lambda\>/\<omega\>+\<lambda\><rsup|2>/\<omega\>|)>>*<frac|f<around|(|x+\<lambda\>*\<omega\>/\<omega\>,-1/\<omega\>|)>+i*\<omega\>*f<around|(|x+\<lambda\>*\<omega\>,\<omega\>|)>|\<omega\>*\<theta\><rsub|11><around|(|x+\<lambda\>*\<omega\>,\<omega\>|)>>,
  </equation>

  where there is no loss of generality in assuming that
  <math|0\<leq\>\<Re\><around|(|\<lambda\>|)>\<less\>1>. The path of
  integration is the real axis, but if <math|\<lambda\>> is purely imaginary,
  i.e. <math|\<Re\><around|(|\<lambda\>|)>=0>, the real axis is indented by
  the lower half of a small circle described about the point
  <math|t=i*\<lambda\>>.

  For on writing <math|i*\<lambda\>+t> for <math|t>, the integral becomes

  <\equation>
    <label|eq:shifted_integral>e<rsup|\<pi\>*i*<around|(|\<lambda\><rsup|2>*\<omega\>+2*\<lambda\>*x+x<rsup|2>|)>>*<big|int><rsub|-i*\<lambda\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*<around|(|x+\<lambda\>*\<omega\>|)>>|e<rsup|2*\<pi\>*t>-1>*d*t.
  </equation>

  The path of integration is of the type <math|P<rsub|0,-1>> and the result
  is given at once by equation<nbsp><eqref|eq:main_theorem>.

  <section|The Second Standard Form><label|sec:second_standard_form>

  It will be shown in Section<nbsp><reference|sec:standard_forms> that the
  general integral can be reduced to two standard forms of which
  equation<nbsp><eqref|eq:main_theorem> is the first. The second is the
  integral

  <\equation>
    <label|eq:second_standard><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*\<omega\>*t>-1>*d*t
  </equation>

  along the path <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>> or
  <math|<around|(|-\<infty\>,<wide|\<delta\>|^>,\<infty\>|)>>, and which we
  now evaluate. We still suppose <math|\<Im\><around|(|\<omega\>|)>\<gtr\>0>.
  The case <math|\<Im\><around|(|\<omega\>|)>=0> will be dealt with in
  Section<nbsp><reference|sec:coalesce_case>. The imaginary axis of
  <math|\<omega\>> is a line of essential singularities of the integral
  considered as a function of <math|\<omega\>>, so that it will be necessary
  to distinguish the cases when <math|\<Re\><around|(|\<omega\>|)>\<gtr\>0>,
  <math|\<Re\><around|(|\<omega\>|)>\<less\>0>, and
  <math|\<Re\><around|(|\<omega\>|)>=0>.

  Write <math|q=e<rsup|\<pi\>*i*\<omega\>>>,

  <\align>
    <tformat|<table|<row|<cell|\<theta\><around|(|x,\<omega\>|)>>|<cell|=1+q*e<rsup|2*\<pi\>*i*x>+q<rsup|4>*e<rsup|8*\<pi\>*i*x>+q<rsup|9>*e<rsup|18*\<pi\>*i*x>+\<cdots\>,<eq-number><label|eq:theta_def>>>|<row|<cell|\<phi\><around|(|x,\<omega\>|)>>|<cell|=1+q*e<rsup|-2*\<pi\>*i*x>+q<rsup|4>*e<rsup|-8*\<pi\>*i*x>+q<rsup|9>*e<rsup|-18*\<pi\>*i*x>+\<cdots\>,<eq-number><label|eq:phi_def>>>>>
  </align>

  so that <math|\<theta\><around|(|x,\<omega\>|)>>,
  <math|\<phi\><around|(|x,\<omega\>|)>> are parts of the series for
  <math|\<theta\><rsub|00><around|(|x,\<omega\>|)>> and

  <\equation>
    <label|eq:theta_phi_sum>\<theta\><around|(|x,\<omega\>|)>+\<phi\><around|(|x,\<omega\>|)>=\<theta\><rsub|00><around|(|x,\<omega\>|)>.
  </equation>

  Then, if <math|\<Re\><around|(|\<omega\>|)>\<gtr\>0>, for the path
  <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>>,

  <\equation>
    <label|eq:second_form_case1><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*\<omega\>*t>-1>*d*t=<frac|e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>*\<theta\><around|(|x,\<omega\>|)>|<sqrt|-i*\<omega\>>>,
  </equation>

  which on noting equations<nbsp><eqref|eq:theta_phi_sum>
  and<nbsp><eqref|eq:theta_transform2> can be written as

  <\equation>
    <label|eq:second_form_case1_alt><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*\<omega\>*t>-1>*d*t=<frac|e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>*\<phi\><around|(|x,\<omega\>|)>|<sqrt|-i*\<omega\>>>+\<theta\><rsub|00><around*|(|<frac|x|\<omega\>>,-<frac|1|\<omega\>>|)>.
  </equation>

  It is shown in Section<nbsp><reference|sec:coalesce_case> that if
  <math|\<Im\><around|(|\<omega\>|)>=0> and <math|\<omega\>\<gtr\>0>, then
  equation<nbsp><eqref|eq:second_form_case1> holds when
  <math|\<Im\><around|(|x|)>\<gtr\>0>, and
  equation<nbsp><eqref|eq:second_form_case1_alt> when
  <math|\<Im\><around|(|x|)>\<less\>0>.

  If <math|\<Re\><around|(|\<omega\>|)>\<less\>0>, for the path
  <math|<around|(|-\<infty\>,<wide|\<delta\>|^>,\<infty\>|)>>,

  <\equation>
    <label|eq:second_form_case2><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*\<omega\>*t>-1>*d*t=<frac|e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>*\<phi\><around|(|x,\<omega\>|)>|<sqrt|-i*\<omega\>>>+0,
  </equation>

  <\equation>
    <label|eq:second_form_case2_alt><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*\<omega\>*t>-1>*d*t=<frac|e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>*\<theta\><around|(|x,\<omega\>|)>|<sqrt|-i*\<omega\>>>-\<theta\><rsub|00><around*|(|<frac|x|\<omega\>>,-<frac|1|\<omega\>>|)>.
  </equation>

  If <math|\<Im\><around|(|\<omega\>|)>=0,\<omega\>\<less\>0>, then
  equation<nbsp><eqref|eq:second_form_case2> holds when
  <math|\<Im\><around|(|x|)>\<less\>0> and
  equation<nbsp><eqref|eq:second_form_case2_alt> when
  <math|\<Im\><around|(|x|)>\<gtr\>0>.

  Finally if <math|\<Re\><around|(|\<omega\>|)>=0>,

  <\equation>
    <label|eq:second_form_case3><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*\<omega\>*t>-1>*d*t=<frac|e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>*\<theta\><around|(|x,\<omega\>|)>|<sqrt|-i*\<omega\>>>,
  </equation>

  where the path of integration is the real axis of <math|t> indented by the
  lower halves of small circles described around the points
  <math|n*i/\<omega\>>, <math|<around|(|n=0,\<pm\>1,\<pm\>2,\<ldots\>|)>>.

  <section|The Case when the Standard Forms
  coalesce><label|sec:coalesce_case>

  There is, however, another way of solving
  equations<nbsp><eqref|eq:phi_functional1>
  and<nbsp><eqref|eq:phi_functional2> which has the great advantage of also
  giving the evaluation of the general integral when <math|\<omega\>> is
  real. Then the functions <math|f<around|(|x,\<omega\>|)>>,
  <math|\<theta\><rsub|00><around|(|x,\<omega\>|)>> no longer exist but some
  of the results of Sections<nbsp><reference|sec:first_standard_form>
  and<nbsp><reference|sec:second_standard_form> are still valid. Clearly the
  two standard forms are the same since the
  integrals<nbsp><eqref|eq:second_form_case1>
  to<nbsp><eqref|eq:second_form_case3> reduce to
  equation<nbsp><eqref|eq:main_theorem> when <math|t> is replaced by
  <math|t/\<omega\>>.

  Suppose then <math|\<omega\>> is real. The
  integrals<nbsp><eqref|eq:second_form_case1>
  to<nbsp><eqref|eq:second_form_case3> (and also
  equation<nbsp><eqref|eq:main_theorem>) converge uniformly in <math|x> for
  all bounded <math|x> and hence are integral functions of <math|x>. Thus
  take the integral<nbsp><eqref|eq:second_form_case1>, say <math|J>, and
  consider the behaviour of the integrand at the limits of summation
  <math|t=\<pm\>\<infty\>>. Clearly at <math|t=\<infty\>>, <math|J> converges
  absolutely and uniformly when <math|\<Re\><around|(|x|)>=-\<omega\>+\<epsilon\>\<gtr\>-\<omega\>>
  and <math|\<epsilon\>> is small. At <math|t=-\<infty\>> <math|J> obviously
  converges absolutely and uniformly for <math|\<Re\><around|(|x|)>\<leq\>-\<epsilon\>\<less\>0>.
  But <math|J> also converges uniformly for
  <math|0\<geq\>\<Re\><around|(|x|)>\<geq\>-\<omega\>>. Thus near
  <math|\<Re\><around|(|x|)>=-\<omega\>>, the convergence of the integral at
  only <math|t=\<infty\>> need be considered. Write

  <\equation>
    <label|eq:splitting><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*\<omega\>*t>-1>=<frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*t*<around|(|x+\<omega\>|)>>+e<rsup|-2*\<pi\>*t*<around|(|x+\<omega\>|)>>|e<rsup|2*\<pi\>*\<omega\>*t>-1>.
  </equation>

  Since

  <\equation>
    <label|eq:convergence1><big|int><rsub|\<infty\>>e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*t*<around|(|x+\<omega\>|)>>*d*t
  </equation>

  converges uniformly for bounded <math|x> and

  <\equation>
    <label|eq:bound1><around|\||e<rsup|-2*\<pi\>*i*<around|(|x+\<omega\>|)>>|\|>\<leq\>e<rsup|2*\<pi\>*\<epsilon\>*t>,
  </equation>

  the result follows since <math|\<omega\>\<gtr\>0> for <math|J>. Similarly
  near <math|\<Re\><around|(|x|)>=0>.

  If <math|\<omega\>> is real and positive, the functional
  equations<nbsp><eqref|eq:phi_functional1>
  and<nbsp><eqref|eq:phi_functional2> still hold. This is obvious for
  equation<nbsp><eqref|eq:phi_functional1>
  from<nbsp><eqref|eq:phi_integral_form>. It suffices to prove
  equation<nbsp><eqref|eq:phi_functional2> for
  <math|0\<gtr\>\<Re\><around|(|x|)>\<gtr\>-\<omega\>> as both sides are
  integral functions of <math|x>.

  The path of integration in equation<nbsp><eqref|eq:phi_solution> can be
  deformed into the inclined path <math|<around|(|-\<infty\>*e<rsup|i*\<alpha\>>,0,\<infty\>*e<rsup|i*\<alpha\>>|)>>,
  where <math|\<alpha\>> is any fixed positive acute angle, by the crude
  argument of absolute convergence, since for real <math|X>,

  <\equation>
    <label|eq:convergence_bound><around|\||e<rsup|\<pi\>*i*\<omega\>*X<rsup|2>*e<rsup|2*i*\<alpha\>>>|\|>\<leq\>1
  </equation>

  for <math|0\<leq\>\<alpha\>\<leq\><frac|\<pi\>|2>>.

  The argument leading to equation<nbsp><eqref|eq:phi_functional2> now
  applies as the integral along the side joining the points
  <math|X*e<rsup|i*\<alpha\>>,X*e<rsup|-i*\<alpha\>>> vanishes when
  <math|X\<to\>\<infty\>>, since

  <\equation>
    <label|eq:vanishing_bound><around|\||e<rsup|\<pi\>*i*\<omega\>*X<rsup|2>*e<rsup|2*i*\<alpha\>>>|\|>\<to\>0.
  </equation>

  We shall now solve the equations by iteration. Let <math|m> and <math|n> be
  positive integers. Then equation<nbsp><eqref|eq:phi_functional1> can be
  written as

  <\equation>
    <label|eq:iteration1>e<rsup|\<pi\>*i*<around|(|x+n*\<omega\>|)><rsup|2>/\<omega\>>*\<chi\>*<around|(|x+n*\<omega\>|)>-e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>*\<chi\><around|(|x|)>=-<frac|i|\<omega\>>*<frac|e<rsup|\<pi\>*i*<around|(|x+r*\<omega\>|)><rsup|2>/\<omega\>>|<sqrt|-i*\<omega\>>>*<big|sum><rsub|r=1><rsup|n>e<rsup|\<pi\>*i*<around|(|2*r*x+r<rsup|2>*\<omega\>|)>>.
  </equation>

  So from equation<nbsp><eqref|eq:phi_functional2>

  <\equation>
    <label|eq:iteration2>\<chi\>*<around|(|x-m|)>-\<chi\><around|(|x|)>=<frac|i|\<omega\>>*<frac|e<rsup|\<pi\>*i*<around|(|x-r|)><rsup|2>/\<omega\>>|<sqrt|-i*\<omega\>>>*<big|sum><rsub|r=1><rsup|m>e<rsup|\<pi\>*i*<around|(|2*r*x+r<rsup|2>*\<omega\>|)>>.
  </equation>

  Change <math|x> into <math|x-m> in equation<nbsp><eqref|eq:iteration1> and
  apply equation<nbsp><eqref|eq:iteration2>, then

  <\equation>
    <label|eq:iteration_combined>\<chi\><around|(|x|)>=-<frac|i|\<omega\>>*<frac|e<rsup|\<pi\>*i*<around|(|x-r|)><rsup|2>/\<omega\>>|<sqrt|-i*\<omega\>>>*<big|sum><rsub|r=1><rsup|m>e<rsup|\<pi\>*i*<around|(|2*r*x+r<rsup|2>*\<omega\>|)>>+<frac|i|\<omega\>>*<frac|e<rsup|\<pi\>*i*<around|(|x-m+s*\<omega\>|)><rsup|2>/\<omega\>>|<sqrt|-i*\<omega\>>>*<big|sum><rsub|s=1><rsup|n>e<rsup|\<pi\>*i*<around|(|2*s*x+s<rsup|2>*\<omega\>|)>>+e<rsup|\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>>*\<chi\>*<around|(|x-m+n*\<omega\>|)>,
  </equation>

  where

  <\equation>
    <label|eq:chi_bound>e<rsup|\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>>*\<chi\>*<around|(|x-m+n*\<omega\>|)>=e<rsup|\<pi\>*i*<around|(|x-m|)><rsup|2>/\<omega\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*t*<around|(|x-m+n*\<omega\>|)>>|e<rsup|2*\<pi\>*\<omega\>*t>-1>*d*t.
  </equation>

  When <math|\<omega\>> is a rational number, say
  <math|\<omega\>=<frac|a|b>>, where <math|a> and <math|b\<gtr\>0> are
  integers, the integrals can be evaluated in finite terms.

  For

  <\equation>
    <label|eq:rational_sum1>1+\<theta\><around|(|x,\<omega\>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>e<rsup|\<pi\>*i*n<rsup|2>*\<omega\>+2*\<pi\>*i*n*x>=<big|sum><rsub|r=0><rsup|b-1>e<rsup|\<pi\>*i*r<rsup|2>*a/b+2*\<pi\>*i*r*x>*<big|sum><rsub|N=0><rsup|\<infty\>>e<rsup|2*\<pi\>*i*N*b*x+\<pi\>*i*N<rsup|2>*b<rsup|2>*a>.
  </equation>

  Put <math|n=r+N*b>, <math|<around|(|r=0,1,2,\<ldots\>,b-1,N=0,1,\<ldots\>|)>>
  then

  <\equation>
    <label|eq:rational_sum2>1+\<theta\><around|(|x,\<omega\>|)>=<big|sum><rsub|r=0><rsup|b-1><frac|e<rsup|\<pi\>*i*r<rsup|2>*a/b+2*\<pi\>*i*r*x>|1-e<rsup|\<pi\>*i*b*<around|(|2*x+a|)>>>.
  </equation>

  Similarly

  <\equation>
    <label|eq:rational_sum3>\<phi\><around|(|x,\<omega\>|)>=<big|sum><rsub|r=0><rsup|b-1><frac|e<rsup|\<pi\>*i*r<rsup|2>*a/b-2*\<pi\>*i*r*x>|1-e<rsup|\<pi\>*i*b*<around|(|-2*x+a|)>>>.
  </equation>

  It is easy to see that with these values of
  <math|\<theta\><around|(|x,\<omega\>|)>> etc. that
  equation<nbsp><eqref|eq:second_form_case1> holds when <math|\<omega\>> is a
  positive rational number not only for <math|\<Im\><around|(|x|)>\<gtr\>0>
  but for all <math|x>. Arguments similar to those for
  equation<nbsp><eqref|eq:second_form_case1> also apply to
  equations<nbsp><eqref|eq:second_form_case1_alt>,
  <eqref|eq:second_form_case2>, <eqref|eq:second_form_case2_alt>.

  Some of these results were given in a different form by
  Ramanujan<nbsp><cite|Ramanujan1915b> but my proofs are entirely different
  from his.

  Finally when <math|\<omega\>\<gtr\>0> and irrational, and <math|x> is also
  real, the uniform convergence of the integral<nbsp><eqref|eq:chi_bound> in
  <math|x> shows that if <math|m> and <math|n\<to\>+\<infty\>> in such a way
  that <math|x-m+n*\<omega\>\<to\>0>,

  <\align>
    <tformat|<table|<row|<cell|\<chi\>*<around|(|x-m+n*\<omega\>|)>>|<cell|\<to\>\<chi\><around|(|0|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|e<rsup|2*\<pi\>*\<omega\>*t>-1>*d*t,<eq-number><label|eq:limit1>>>|<row|<cell|>|<cell|=<frac|i|2*\<omega\>>=<frac|i|2*<sqrt|-i*\<omega\>>>,<eq-number><label|eq:limit2>>>>>
  </align>

  as is obvious from the derivation of equation<nbsp><eqref|eq:chi_bound>.

  Also

  <\equation>
    <label|eq:exponential_limit>e<rsup|\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>>\<sim\>e<rsup|\<pi\>*i*<around|(|x-m|)><rsup|2>/\<omega\>>,
  </equation>

  Hence

  <\equation>
    <label|eq:final_limit>\<chi\><around|(|x|)>=lim<rsub|m,n\<to\>\<infty\>><around*|[|<big|sum><rsub|r=1><rsup|m>e<rsup|\<pi\>*i*<around|(|x-r|)><rsup|2>/\<omega\>>+<big|sum><rsub|s=1><rsup|n>e<rsup|\<pi\>*i*<around|(|x-m+s*\<omega\>|)><rsup|2>/\<omega\>>|]>+e<rsup|\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>>,
  </equation>

  the dashes denoting that the particular terms <math|r=m> and <math|s=n>
  have weights <math|<frac|1|2>>.

  Hence if <math|\<omega\>\<gtr\>0>, <math|x> is real and the path is
  <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>>,

  <\equation>
    <label|eq:irrational_formula><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*\<omega\>*t>-1>*d*t=lim<rsub|m,n\<to\>\<infty\>><around*|[|<big|sum><rsub|r=1><rsup|m<rprime|'>><frac|e<rsup|\<pi\>*i*<around|(|x-r|)><rsup|2>/\<omega\>>|<sqrt|-i*\<omega\>>>+<big|sum><rsub|s=1><rsup|n<rprime|'>><frac|e<rsup|\<pi\>*i*<around|(|x-m+s*\<omega\>|)><rsup|2>/\<omega\>>|<sqrt|-i*\<omega\>>>|]>,
  </equation>

  where <math|m\<to\>+\<infty\>>, <math|n\<to\>+\<infty\>>,
  <math|x-m+n*\<omega\>\<to\>0>.

  By writing <math|-t> for <math|t>, <math|-i> for <math|i> and <math|-x> for
  <math|x>, we see that for <math|\<omega\>\<less\>0> and the path
  <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>>,

  <\equation>
    <label|eq:negative_omega_formula><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*\<omega\>*t>-1>*d*t=lim<rsub|m,n\<to\>\<infty\>><around*|[|<big|sum><rsub|r=1><rsup|m<rprime|'>><frac|e<rsup|\<pi\>*i*<around|(|-x-r|)><rsup|2>/\<omega\>>|<sqrt|-i*\<omega\>>>+<big|sum><rsub|s=1><rsup|n<rprime|'>><frac|e<rsup|\<pi\>*i*<around|(|-x+m+s*\<omega\>|)><rsup|2>/\<omega\>>|<sqrt|-i*\<omega\>>>|]>,
  </equation>

  where <math|m\<to\>+\<infty\>>, <math|n\<to\>+\<infty\>>,
  <math|x+m+n*\<omega\>\<to\>0>.

  <section|Reduction of the Integral to the Standard
  Forms><label|sec:standard_forms>

  There remains now the reduction to the standard forms in
  Sections<nbsp><reference|sec:first_standard_form>,
  <reference|sec:second_standard_form>, <reference|sec:coalesce_case> of the
  integral

  <\equation>
    <label|eq:general_integral>I=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|a*t<rsup|2>+b*t>|e<rsup|c*t>+d>*d*t,
  </equation>

  where the path of integration is the real axis of <math|t> indented by the
  lower halves of any zeros of the denominator. The case <math|a*c=0> may be
  omitted as these results are well known. The convergence of <math|I>
  requires then <math|\<Re\><around|(|a|)>\<leq\>0>.

  If <math|c> is real, <math|I> reduces at once to the first standard form
  including the case of real <math|\<omega\>> in
  Section<nbsp><reference|sec:coalesce_case>. Hence on writing <math|-t> for
  <math|t> if need be, we can suppose that <math|c> is a complex number with
  <math|\<Re\><around|(|c|)>\<geq\>0>. We consider now the case when
  <math|<around|\||\<Re\><around|(|a|)>|\|>\<less\>0>.

  Three cases arise according as the real part of <math|a/c<rsup|2>> is
  negative, positive, or zero.

  Suppose first <math|\<Re\>*<around|(|a/c<rsup|2>|)>\<less\>0>. This implies
  <math|\<Re\><around|(|c|)>\<neq\>0>, for <math|\<Re\><around|(|c|)>=0>
  would make <math|\<Re\><around|(|a|)>\<gtr\>0>. Put

  <\equation>
    <label|eq:substitution1>t=<frac|2*\<pi\>*v|c>,<space|1em>\<pi\>*i*\<omega\>=<frac|4*\<pi\><rsup|2>*a|c<rsup|2>>,<text|i.e.
    >\<Im\><around|(|\<omega\>|)>\<gtr\>0,
  </equation>

  and <math|I> takes the form

  <\equation>
    <label|eq:reduced_form1>I=<frac|2*\<pi\>|c>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*v<rsup|2>-2*\<pi\>*i*a*v>|e<rsup|2*\<pi\>*v>+d>*d*v.
  </equation>

  The path of integration is now the line through the origin indented by the
  lower halves of the zeros of the denominator and inclined to the real axis
  of <math|v> at an angle <math|arg c> where

  <\equation>
    <label|eq:angle_constraint><frac|\<pi\>|2>\<gtr\>arg c\<gtr\>0,
  </equation>

  since <math|\<Re\><around|(|c|)>\<gtr\>0>.

  Consider now the integral

  <\equation>
    <label|eq:contour_deformation><big|oint><frac|e<rsup|\<pi\>*i*\<omega\>*v<rsup|2>-2*\<pi\>*i*a*v>|e<rsup|2*\<pi\>*v>+d>*d*v
  </equation>

  taken around the contour formed by the two lines (indented if necessary)
  joining the points <math|-\<rho\>,\<rho\>> (i.e. the real axis) and the
  points <math|-\<rho\>*c,\<rho\>*c> and the two arcs of the circle
  <math|<around|\||v|\|>=\<rho\>> joining the points <math|\<rho\>,\<rho\>*c>
  and <math|-\<rho\>,-\<rho\>*c>. When <math|\<rho\>\<to\>\<infty\>>, the
  integrals along the arcs tend to zero since
  <math|\<Re\><around|(|a|)>\<less\>0>. For putting
  <math|v=\<rho\>*e<rsup|i*\<theta\>>>, then
  <math|\<Im\>*<around|(|\<omega\>*v<rsup|2>|)>\<gtr\>0> if
  <math|0\<less\>arg \<omega\>+2*arg c\<less\>\<pi\>>, i.e.
  <math|0\<less\>arg a/i\<less\>\<pi\>>, which holds since
  <math|\<Re\><around|(|a|)>\<less\>0>.

  The zeros of the denominator are of the form <math|v=n*i+d>, say where
  <math|n=0,\<pm\>1,\<pm\>2,\<ldots\>> Only a finite number of them lie
  within the contour of integration since
  <math|\<Re\><around|(|c|)>\<neq\>0>. Hence the value of the integral

  <\equation>
    <label|eq:contour_result><big|oint><frac|e<rsup|\<pi\>*i*\<omega\>*v<rsup|2>-2*\<pi\>*i*a*v>|e<rsup|2*\<pi\>*v>+d>*d*v
  </equation>

  is given by Cauchy's theorem in terms of the integral

  <\equation>
    <label|eq:real_axis_integral><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*v<rsup|2>-2*\<pi\>*i*a*v>|e<rsup|2*\<pi\>*v>+d>*d*v
  </equation>

  which was evaluated in Section<nbsp><reference|sec:first_standard_form>.

  Suppose next <math|\<Re\>*<around|(|a/c<rsup|2>|)>\<gtr\>0>. Put
  <math|t=<frac|2*\<pi\>*v|c>> and then <math|I> takes the form

  <\equation>
    <label|eq:reduced_form2><frac|c|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*v<rsup|2>-2*\<pi\>*i*a*v>|e<rsup|c*\<omega\>*v>+d>*d*v
  </equation>

  provided <math|\<pi\>*i*\<omega\>=<frac|4*\<pi\><rsup|2>*a|c<rsup|2>>>,
  i.e.

  <\equation>
    <label|eq:omega_relation>\<omega\>=<frac|i*c<rsup|2>|4*\<pi\>*a>
  </equation>

  so that <math|\<Im\><around|(|\<omega\>|)>\<gtr\>0>.

  The path of integration can be deformed into the real axis just as before,
  since <math|\<Re\><around|(|a|)>\<less\>0>, and the integral reduces to the
  second standard form. Allowance must of course be made for the zeros of the
  denominator which are now of the form <math|n*i/\<omega\>+d>, say,
  <math|<around|(|n=0,\<pm\>1,\<pm\>2,\<ldots\>|)>>. There may be an infinite
  number of them within the contour, e.g. if <math|0\<less\>arg
  <around|(|i/\<omega\>|)>\<less\>arg <around|(|c/\<omega\>|)>>, but the
  series of residues converges absolutely since

  <\equation>
    <label|eq:convergence_condition>\<Im\><around*|[|<frac|i|\<omega\>>|]>=\<Re\><around*|(|<frac|1|\<omega\>>|)>\<gtr\>0
  </equation>

  and reduces to a thetafunction with the omission of a finite number of
  terms.

  Thirdly, suppose <math|\<Re\>*<around|(|a/c<rsup|2>|)>=0>. Either of the
  two methods of reduction suffices since <math|\<omega\>> is real and the
  integral <math|I> reduces to the special cases treated in
  Section<nbsp><reference|sec:coalesce_case>.

  There still remains the case when <math|\<Re\><around|(|a|)>=0>. It
  suffices to assume <math|\<Im\><around|(|a|)>\<gtr\>0> as the results when
  <math|\<Im\><around|(|a|)>\<less\>0> can be deduced by changing the sign of
  <math|i> throughout. On writing <math|-v> for <math|v>, we may still
  suppose <math|\<Re\><around|(|c|)>\<geq\>0>.

  When <math|\<Im\><around|(|c<rsup|2>|)>\<less\>0>, (and so
  <math|\<Re\><around|(|c|)>\<neq\>0>), we use
  equations<nbsp><eqref|eq:substitution1> and<nbsp><eqref|eq:reduced_form1>
  still holds. It is then easy to see that when
  <math|0\<gtr\>\<Re\><around|(|x|)>\<gtr\>-1>, the deformation of the path
  of integration into the real axis and the reduction to the first standard
  form still hold. The result then holds for all <math|x> by the usual
  argument.

  When <math|\<Im\><around|(|c<rsup|2>|)>\<gtr\>0>, (and so
  <math|\<Re\><around|(|c|)>\<neq\>0>), we use
  equation<nbsp><eqref|eq:reduced_form2> and as above the integral is reduced
  to the second standard form.

  When <math|\<Im\><around|(|c<rsup|2>|)>=0>, we may suppose <math|c> is
  purely imaginary, since we have already considered the case when <math|c>
  is real. We may use either equations<nbsp><eqref|eq:reduced_form1>
  or<nbsp><eqref|eq:reduced_form2> and the integral is reduced to the form

  <\equation>
    <label|eq:real_omega_case><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*v<rsup|2>-2*\<pi\>*i*a*v>|e<rsup|2*\<pi\>*v>+d>*d*v,
  </equation>

  where <math|\<omega\>> is real. The value of this integral is included in
  the results of Section<nbsp><reference|sec:coalesce_case>.

  When <math|0\<gtr\>\<Re\><around|(|x|)>\<gtr\>-1>, the path of integration
  can be deformed into the real axis from <math|-\<infty\>> to
  <math|+\<infty\>>, indented if need be. The residues arising from the
  infinite number of poles of the denominator, i.e. <math|v=n*i+d> give rise
  to a convergent series of the type <math|\<theta\><around|(|x,\<omega\>|)>>,
  or <math|\<phi\><around|(|x,\<omega\>|)>>. Thus if
  <math|\<Re\><around|(|d|)>\<gtr\>0>, only the values
  <math|n=0,1,2,3,\<ldots\>> can arise and then

  <\equation>
    <label|eq:residue_series><big|sum><rsub|n>e<rsup|\<pi\>*i*\<omega\>*<around|(|n*i+d|)><rsup|2>-2*\<pi\>*i*a*<around|(|n*i+d|)>>
  </equation>

  converges absolutely if <math|-\<Im\><around|(|\<omega\>|)>*\<Re\><around|(|d|)>-2*\<Im\><around|(|x|)>\<gtr\>0>,
  i.e. if <math|2*\<Im\><around|(|x|)>-\<omega\>*\<Re\><around|(|d|)>\<gtr\>0>.
  The results for other values of <math|x> follow as with
  equations<nbsp><eqref|eq:second_form_case1>
  to<nbsp><eqref|eq:second_form_case3> when <math|\<omega\>> is real.

  <section|Miscellaneous Results><label|sec:miscellaneous_results>

  We consider in the present section various applications of and remarks
  about the results of the paper.

  The functional equations<nbsp><eqref|eq:phi_functional1>
  and<nbsp><eqref|eq:phi_functional2> admit also of solutions of the
  type<nbsp><eqref|eq:phi_def> but with denominator
  <math|\<theta\><rsub|00><around|(|x,\<omega\>|)>> etc. instead of
  <math|\<theta\><rsub|11><around|(|x,\<omega\>|)>>. Thus if in
  equation<nbsp><eqref|eq:general_constant>, <math|\<lambda\>=-<frac|1|2>>,
  we find on noting

  <\equation>
    <label|eq:theta_identity>\<theta\><rsub|11><around*|(|x+<frac|1|4>*\<omega\>,\<omega\>|)>=i*q<rsup|1/4>*e<rsup|-\<pi\>*i*x>*\<theta\><rsub|01><around|(|x,\<omega\>|)>
  </equation>

  that

  <\equation>
    <label|eq:alternative_form1><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>+1>*d*t=<frac|f<around|(|-x/\<omega\>-<frac|1|4>,-<frac|1|\<omega\>>|)>+i*\<omega\>*f<around|(|x-<frac|\<omega\>|4>,\<omega\>|)>|\<omega\>*\<theta\><rsub|01><around|(|x,\<omega\>|)>>
  </equation>

  It is easy to show that one of the alternative forms referred to above of
  this result is

  <\equation>
    <label|eq:alternative_form2><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>+1>*d*t=<frac|\<theta\><rsub|00><around|(|x,\<omega\>|)>|2>-<frac|1|2*\<pi\>*i>*<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><frac|q<rsup|n<rsup|2>-1/4>*e<rsup|4*<around|(|2*n-1|)>*\<pi\>*i*x>|1-q<rsup|2*n-1>>
  </equation>

  Further equations<nbsp><eqref|eq:phi_functional1>
  and<nbsp><eqref|eq:phi_functional2> can also be solved by means of
  integrals of a type different from equation<nbsp><eqref|eq:phi_integral_form>.

  This is suggested by writing in equation<nbsp><eqref|eq:main_theorem>,
  <math|x/\<omega\>>, <math|-1/\<omega\>> in place of <math|x>,
  <math|\<omega\>> respectively. We have

  <\equation>
    <label|eq:transformed_integral><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-\<pi\>*i*t<rsup|2>/\<omega\>-2*\<pi\>*i*t*x/\<omega\>>|e<rsup|2*\<pi\>*t>-1>*d*t=<frac|-\<omega\>*f<around|(|x,\<omega\>|)>+i*f<around|(|-x/\<omega\>,-1/\<omega\>|)>|\<theta\><rsub|11><around|(|x/\<omega\>,-1/\<omega\>|)>>
  </equation>

  and on noting equation<nbsp><eqref|eq:theta_transform1>, this becomes

  <\equation>
    <label|eq:simplified_form><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-\<pi\>*i*<around|(|t-i*x|)><rsup|2>/\<omega\>>|e<rsup|2*\<pi\>*t>-1>*d*t=<frac|-\<omega\>*f<around|(|-x,\<omega\>|)>-i*f<around|(|-x/\<omega\>,-1/\<omega\>|)>|\<omega\>*<sqrt|-i*\<omega\>>*\<theta\><rsub|11><around|(|x,\<omega\>|)>>
  </equation>

  From equation<nbsp><eqref|eq:main_theorem> and
  equation<nbsp><eqref|eq:f_prop1>, we have, along the path
  <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>>

  <\equation>
    <label|eq:combined_result><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>-1>*d*t+i*<sqrt|-i*\<omega\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-\<pi\>*i*<around|(|t-i*x|)><rsup|2>/\<omega\>>|e<rsup|2*\<pi\>*t>-1>*d*t=-<sqrt|-i*\<omega\>>
  </equation>

  We can deduce from this that

  <\equation>
    <label|eq:reciprocal_relation><frac|1|<sqrt|-i*\<omega\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-\<pi\>*i*<around|(|t-i*x|)><rsup|2>/\<omega\>>|e<rsup|2*\<pi\>*t>-1>*d*t=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>-1>*d*t
  </equation>

  This result can also be proved by noting that both sides are integral
  solutions of the equations

  <\align>
    <tformat|<table|<row|<cell|\<Phi\>*<around|(|x+\<omega\>|)>+e<rsup|\<pi\>*i*<around|(|2*x+\<omega\>|)>>*\<Phi\><around|(|x|)>>|<cell|=2*\<omega\>*e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>,<eq-number><label|eq:reciprocal_eq1>>>|<row|<cell|\<Phi\>*<around|(|x-1|)>+\<Phi\><around|(|x|)>>|<cell|=<frac|2*e<rsup|\<pi\>*i*<around|(|x-1|)><rsup|2>/\<omega\>>|<sqrt|-i*\<omega\>>><eq-number><label|eq:reciprocal_eq2>>>>>
  </align>

  which cannot admit of more than one integral solution.

  Formulae of the type equations<nbsp><eqref|eq:combined_result>
  and<nbsp><eqref|eq:reciprocal_relation> have been found by
  Hardy<nbsp><cite|Hardy1904> and Ramanujan<nbsp><cite|Ramanujan1915b> by
  considering reciprocal functions.

  The work of Lerch<nbsp><cite|Lerch1892>, however, shows that the unique
  integral solution of the equations<nbsp><eqref|eq:phi_functional1>
  and<nbsp><eqref|eq:phi_functional2> can be expressed in an infinity of
  ways. Thus he proves that if

  <\equation>
    <label|eq:lerch_function>R<around|(|u,v,\<omega\>|)>=<big|sum><rsub|m,n=-\<infty\>><rsup|\<infty\>><frac|1|u+v+m+n*\<omega\>>
  </equation>

  then the value of the integral

  <\equation>
    <label|eq:lerch_integral>\<Psi\><around|(|v,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*v>|e<rsup|2*\<pi\>*t>+1>*d*t
  </equation>

  is given by

  <\equation>
    <label|eq:lerch_result>\<Psi\><around|(|v,\<omega\>|)>=<frac|\<pi\>*i|\<omega\>>*R<around*|(|<frac|u|\<omega\>>,<frac|u+v|\<omega\>>,-<frac|1|\<omega\>>|)>
  </equation>

  where <math|u> is arbitrary. The proof along the lines developed in this
  paper would not be difficult. Thus both sides of
  equation<nbsp><eqref|eq:lerch_result> are integral functions of <math|v>
  since the residues of the two terms in <math|R> cancel for the simple poles
  at the points <math|v=-u+m-n*\<omega\>> where <math|m,n> are any integers.
  The functional equations for <math|\<Psi\><around|(|v,\<omega\>|)>>
  analogous to equation<nbsp><eqref|eq:reciprocal_eq1> can be deduced, and
  then a proof of equation<nbsp><eqref|eq:lerch_result> would follow from a
  study of the functional equations satisfied by
  <math|R<around|(|u,v,\<omega\>|)>>.

  It is easily seen that <math|R<around|(|u,v,\<omega\>|)>> is defined
  uniquely as the meromorphic function of <math|v> satisfying the equations

  <\align>
    <tformat|<table|<row|<cell|R<around|(|u,v+1,\<omega\>|)>-R<around|(|u,v,\<omega\>|)>>|<cell|=0<eq-number><label|eq:R_functional1>>>|<row|<cell|R<around|(|u,v,\<omega\>|)>-e<rsup|\<pi\>*i*<around|(|2*v+\<omega\>|)>>*R<around|(|u,v+\<omega\>,\<omega\>|)>>|<cell|=\<theta\><rsub|00><around|(|u,\<omega\>|)><eq-number><label|eq:R_functional2>>>>>
  </align>

  and whose only singularities are simple poles at the points
  <math|m+n*\<omega\>>, where <math|m,n> are any integers, and which has a
  residue <math|1/2*\<pi\>*i> at <math|v=0>. There is, however, no need to go
  into details.

  <section|The Case when <math|i*a/c<rsup|2>> is Rational and the Gauss's
  Sums><label|sec:gauss_sums>

  The results of Section<nbsp><reference|sec:coalesce_case> when
  <math|\<omega\>> is rational contain the formula for the Gauss's sums. As
  they are also interesting examples on elementary contour integration, it
  may be desirable to state the results in their simplest forms and to sketch
  briefly the proofs again, independently of
  Section<nbsp><reference|sec:coalesce_case>.

  <\theorem>
    <label|thm:gauss_sums>If <math|a> and <math|b> are positive integers,
    then

    <\equation>
      <label|eq:gauss_formula1><around|{|1-e<rsup|\<pi\>*i*<around|(|2*x-a|)>>|}>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-\<pi\>*i*a*t<rsup|2>/b-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>-1>*d*t=<frac|1|<sqrt|i*b>>*<big|sum><rsub|r=0><rsup|a-1>e<rsup|\<pi\>*i*<around|(|x+r|)><rsup|2>/a+\<pi\>*i*<around|(|2*x-a|)>*r/a>
    </equation>

    where the path of integration is either
    <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>>, or is a straight
    line inclined to the real axis of <math|t> at an acute negative angle and
    meeting the imaginary axis between <math|t=0> and <math|t=-i>.

    <\equation>
      <label|eq:gauss_formula2><around|{|1-e<rsup|\<pi\>*i*<around|(|2*x-a|)>>|}>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-\<pi\>*i*a*t<rsup|2>/b-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>-1>*d*t=<frac|e<rsup|\<pi\>*i*x<rsup|2>/a>|<sqrt|i*b>>*<big|sum><rsub|r=1><rsup|a-1>e<rsup|\<pi\>*i*<around|(|x+r|)><rsup|2>/a+\<pi\>*i*<around|(|2*x-a|)>*r/a>
    </equation>

    along either the path <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>>,
    or along a line inclined to the real axis of <math|t> at a positive acute
    angle and meeting the imaginary axis of <math|t> between <math|t=0>,
    <math|t=-i>.
  </theorem>

  <\proof>
    For write when <math|\<omega\>> is real

    <\equation>
      <label|eq:psi_definition>\<Psi\><around|(|x|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>-1>*d*t
    </equation>

    with the inclined path of equation<nbsp><eqref|eq:gauss_formula1>. On
    noting equation<nbsp><eqref|eq:phi_integral_form>, so that
    <math|\<Phi\><around|(|x|)>=\<omega\>*\<Psi\><around|(|x|)>>, it is
    obvious that equation<nbsp><eqref|eq:phi_functional1> still holds when
    <math|\<omega\>> is real and so

    <\equation>
      <label|eq:psi_functional1>\<Psi\>*<around|(|x-1|)>-\<Psi\><around|(|x|)>=<frac|e<rsup|\<pi\>*i*x<rsup|2>/\<omega\>>|<sqrt|-i*\<omega\>>>
    </equation>

    Also

    <\equation>
      <label|eq:psi_functional2>\<Psi\>*<around|(|x+\<omega\>|)>-e<rsup|\<pi\>*i*<around|(|2*x+\<omega\>|)>>*\<Psi\><around|(|x|)>=i*e<rsup|\<pi\>*i*<around|(|2*x+\<omega\>|)>>
    </equation>

    For the rectangle of Section<nbsp><reference|sec:first_standard_form> is
    replaced by a parallelogram ABCD, vertices at
    <math|\<pm\>\<infty\>*e<rsup|i*\<alpha\>>>,
    <math|\<pm\>\<infty\>*e<rsup|i*\<alpha\>>+i>. The integrals along the
    short sides of ABCD are zero if <math|\<alpha\>> is an acute angle with
    <math|\<omega\>\<gtr\>0> because of the factor
    <math|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>> with
    <math|t=\<pm\>\<infty\>*e<rsup|i*\<alpha\>>+\<xi\>>, and
    <math|<around|\||\<xi\>|\|>\<leq\>1>. Hence
    equation<nbsp><eqref|eq:psi_functional2> follows.

    Let now <math|m,n> be positive integers. Applying
    equation<nbsp><eqref|eq:psi_functional1>, <math|m> times,

    <\equation>
      <label|eq:psi_iteration1>\<Psi\>*<around|(|x-m|)>-\<Psi\><around|(|x|)>=<frac|1|<sqrt|-i*\<omega\>>>*<big|sum><rsub|r=1><rsup|m-1>e<rsup|\<pi\>*i*<around|(|x-r|)><rsup|2>/\<omega\>>
    </equation>

    From equation<nbsp><eqref|eq:psi_functional2>

    <\equation>
      <label|eq:psi_transformation>e<rsup|-\<pi\>*i*<around|(|x+\<omega\>|)><rsup|2>/\<omega\>>*\<Psi\>*<around|(|x+\<omega\>|)>-e<rsup|-\<pi\>*i*x<rsup|2>/\<omega\>>*\<Psi\><around|(|x|)>=-i*e<rsup|-\<pi\>*i*x<rsup|2>/\<omega\>>
    </equation>

    and changing <math|x> into <math|x+\<omega\>>,
    <math|x+2*\<omega\>,\<ldots\>,x+<around|(|n-1|)>*\<omega\>> and adding

    <\equation>
      <label|eq:psi_iteration2>e<rsup|-\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>/\<omega\>>*\<Psi\>*<around|(|x+n*\<omega\>|)>-\<Psi\><around|(|x|)>=-i*<big|sum><rsub|s=0><rsup|n-1>e<rsup|\<pi\>*i*<around|(|2*s*x+s<rsup|2>*\<omega\>|)>/\<omega\>>
    </equation>

    Suppose now <math|\<omega\>=-a/b> where <math|a,b> are positive integers.
    Take <math|m=a>, <math|n=b>. Multiply
    equation<nbsp><eqref|eq:psi_iteration2> by
    <math|e<rsup|\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>/\<omega\>>>,
    write <math|b-s> for <math|s>, subtract, and note <math|-a=b*\<omega\>>,
    then equation<nbsp><eqref|eq:gauss_formula1> follows. It is also easy to
    see that when <math|0\<gtr\>\<Re\><around|(|x|)>\<gtr\>-1>, the inclined
    path can be deformed into the path <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>>,
    and then that equation<nbsp><eqref|eq:gauss_formula1> holds for
    <math|0\<geq\>\<Re\><around|(|x|)>\<geq\>-1>, while
    equation<nbsp><eqref|eq:psi_functional1> shows the integral really
    converges for all <math|x> and so equation<nbsp><eqref|eq:gauss_formula1>
    holds for all <math|x>. Similarly when <math|\<omega\>=a/b>, the result
    equation<nbsp><eqref|eq:gauss_formula2> follows. It can also be deduced
    from equation<nbsp><eqref|eq:gauss_formula1> by changing <math|i> into
    <math|-i>, noting <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>>
    becomes <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>> and then
    writing <math|-t> for <math|t> and <math|-x-1> for <math|x>.
  </proof>

  On putting <math|x=0>, in equation<nbsp><eqref|eq:gauss_formula1>, the well
  known reciprocity formula for the Gauss's sums follows. This suggested to
  me the simple proof which I published in the Messenger of
  Mathematics<nbsp><cite|Mordell1918> that

  <\equation>
    <label|eq:gauss_sum_reciprocity><big|sum><rsub|r=0><rsup|n-1>e<rsup|2*\<pi\>*i*r<rsup|2>/n>=<sqrt|n>*<frac|1+i|<sqrt|2>>
  </equation>

  For write

  <\equation>
    <label|eq:gauss_sum_function>f<around|(|z|)>=<big|sum><rsub|r=0><rsup|n-1>e<rsup|2*\<pi\>*i*r<rsup|2>/n>*<around|(|e<rsup|\<pi\>*i*z>-1|)>=<big|sum><rsub|l=0><rsup|n-1>e<rsup|2*\<pi\>*i*<around|(|l+1|)><rsup|2>/n>
  </equation>

  Then

  <\equation>
    <label|eq:gauss_sum_difference>f*<around|(|z+1|)>-f<around|(|z|)>=e<rsup|\<pi\>*i*z/n>*<around|(|e<rsup|\<pi\>*i*z>+1|)>
  </equation>

  so that

  <\equation>
    <label|eq:gauss_sum_integral><big|oint>f<around|(|z|)>*d*z=e<rsup|\<pi\>*i*z<rsup|2>/n>
  </equation>

  Consider now the integral <math|<big|oint>f<around|(|z|)>*d*z> taken around
  an infinite parallelogram ABCD of which the parallel sides AB, DC are
  inclined to the real axis of <math|z> at any positive acute angle and cut
  it at <math|z=-1/2>, <math|z=1/2> respectively. The sides BC and DA are
  parallel to the axis of <math|x> and are at an infinite distance above it
  and below it respectively.

  Then <math|f<around|(|z|)>> is analytic within ABCD except for a simple
  pole at <math|z=0> with residue <math|S/2*\<pi\>*i>.

  The integral taken along each of the sides BC and DA vanishes, while those
  along the sides AB, CD reduce to

  <\equation>
    <label|eq:contour_integral_sides><big|int><rsub|A><rsup|B><around|(|f<around|(|z|)>-f*<around|(|z+1|)>|)>*d*z=<big|int><rsub|A><rsup|B>e<rsup|\<pi\>*i*z<rsup|2>/n>*<around|(|e<rsup|\<pi\>*i*z>+1|)>*d*z
  </equation>

  Hence by Cauchy's theorem

  <\equation>
    <label|eq:gauss_sum_final>S=<big|int><rsub|A><rsup|B>e<rsup|\<pi\>*i*z<rsup|2>/n>*<around|(|e<rsup|\<pi\>*i*z>+1|)>*d*z
  </equation>

  The value of this integral is well known, since the path of integration can
  be deformed into the real axis from <math|-\<infty\>> to <math|\<infty\>>.
  We need not use this, however, for if in the first part of the integral, we
  replace <math|z> by <math|z-1> and then throughout put <math|z=y<sqrt|n>>,
  we have, with <math|k> independent of <math|n>,

  <\equation>
    <label|eq:gauss_sum_scaling>S=k<sqrt|n>*<around|(|1+e<rsup|\<pi\>*i>|)>
  </equation>

  Take <math|n=1>, whence

  <\equation>
    <label|eq:gauss_sum_normalization>1=k*<around|(|1+e<rsup|\<pi\>*i>|)>=k\<cdot\>2*i
  </equation>

  and the result.

  <section|The Approximate Functional Equation of the
  Thetafunction><label|sec:approximate_functional_equation>

  The results of Section<nbsp><reference|sec:coalesce_case> when
  <math|\<omega\>> is irrational include the approximate functional equation
  of the thetafunction. This has been the subject of papers by Hardy and
  Littlewood<nbsp><cite|HardyLittlewood1921|HardyLittlewood1923|HardyLittlewood1925>,
  van der Corput<nbsp><cite|vanderCorput1922|vanderCorput1923>,
  myself<nbsp><cite|Mordell1926> and Wilton<nbsp><cite|Wilton1927>. Its
  importance makes desirable a short treatment independent of
  Section<nbsp><reference|sec:coalesce_case>. I prove the

  <\theorem>
    <label|thm:approximate_functional>Let

    <\equation>
      <label|eq:F_definition>F<around|(|x|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>-2*\<pi\>*i*t*x>|e<rsup|2*\<pi\>*t>-1>*d*t
    </equation>

    along the path <math|<around|(|-\<infty\>,<wide|0|^>,\<infty\>|)>>, where
    <math|\<omega\>\<gtr\>0> and <math|x> is real.

    Let <math|m\<geq\>0>, <math|n\<geq\>0> be any integers and put

    <\equation>
      <label|eq:S_mn_definition>S<rsub|m,n>=<frac|1|<sqrt|-i*\<omega\>>>*<big|sum><rsub|r=0><rsup|m>e<rsup|\<pi\>*i*<around|(|x-r|)><rsup|2>/\<omega\>>+<big|sum><rsub|s=0><rsup|n>e<rsup|\<pi\>*i*<around|(|x-m+s*\<omega\>|)><rsup|2>/\<omega\>>
    </equation>

    Denote by <math|S<rprime|'><rsub|m,n>> the sum when weights <math|1/2>
    are given to the terms <math|r=m>, <math|s=n>, and by
    <math|S<rprime|''><rsub|m,n>> the sum when in addition weights <math|1/2>
    are attached to the terms <math|r=0>, <math|s=0>.

    Then if <math|m> and <math|n> are positive integers such that
    <math|0\<leq\>\<xi\>\<leq\>1>, where

    <\equation>
      <label|eq:xi_definition>x-m+n*\<omega\>=\<xi\>
    </equation>

    <\equation>
      <label|eq:approximate_bound><around|\||F<around|(|x|)>+S<rprime|'><rsub|m,n>|\|>\<leq\><frac|2*\<xi\>|\<omega\>>+min
      <around*|(|<frac|1|\<omega\>>,<frac|\<pi\>*\<xi\>|2*\<omega\><rsup|2>>|)>
    </equation>

    and so the left hand side <math|\<to\>0> if <math|m,n\<to\>+\<infty\>> in
    such a way that <math|x-m+n*\<omega\>\<to\>0>.

    Also if in addition <math|0\<leq\>x\<less\>1>,

    <\equation>
      <label|eq:approximate_bound2><around|\||S<rprime|''><rsub|m,n>|\|>\<leq\>8*\<omega\><rsup|-1/2>
    </equation>

    These results hold uniformly for all <math|\<omega\>\<gtr\>0> and not
    merely for a usual range such as <math|0\<less\>\<omega\>\<leq\>2>.
  </theorem>

  <\proof>
    Write <math|x-m> for <math|x> in equation<nbsp><eqref|eq:psi_iteration2>
    and add to equation<nbsp><eqref|eq:psi_iteration1>. Then

    <\equation>
      <label|eq:combined_iteration>e<rsup|-\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>/\<omega\>>*\<Psi\>*<around|(|x-m+n*\<omega\>|)>-\<Psi\><around|(|x|)>=S<rprime|'><rsub|m-1,n-1>
    </equation>

    Also by the argument leading to equation<nbsp><eqref|eq:second_form_case1_alt>,

    <\equation>
      <label|eq:psi_zero>\<Psi\><around|(|0|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|e<rsup|2*\<pi\>*t>-1>*d*t=<frac|i|2*\<omega\>>=<frac|i|2*<sqrt|-i*\<omega\>>>
    </equation>

    Write equation<nbsp><eqref|eq:combined_iteration> as

    <\equation>
      <label|eq:iteration_rewrite>S<rprime|'><rsub|m,n>=e<rsup|-\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>/\<omega\>>*\<Psi\>*<around|(|x-m+n*\<omega\>|)>-\<Psi\><around|(|x|)>+<frac|i*e<rsup|\<pi\>*i*<around|(|x-m|)><rsup|2>/\<omega\>>|2*<sqrt|-i*\<omega\>>>-e<rsup|-\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>/\<omega\>>
    </equation>

    <\align>
      <tformat|<table|<row|<cell|>|<cell|=e<rsup|-\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>/\<omega\>>*<around|(|\<Psi\>*<around|(|x-m+n*\<omega\>|)>-\<Psi\><around|(|0|)>|)>-\<Psi\><around|(|x|)>+T<rsub|2><eq-number><label|eq:T_decomposition>>>>>
    </align>

    where

    <\equation>
      <label|eq:T2_definition>T<rsub|2>=<frac|i*e<rsup|\<pi\>*i*<around|(|x-m|)><rsup|2>/\<omega\>>|2*<sqrt|-i*\<omega\>>>-e<rsup|-\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>/\<omega\>>
    </equation>

    Then from equation<nbsp><eqref|eq:xi_definition>,

    <\equation>
      <label|eq:T2_bound><around|\||2*<sqrt|\<omega\>>*T<rsub|2>|\|>=<around|\||e<rsup|\<pi\>*i*<around|(|x-m|)><rsup|2>/\<omega\>>-e<rsup|-\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>/\<omega\>>|\|>=<around|\||1-e<rsup|\<pi\>*i*\<xi\><rsup|2>/\<omega\>>|\|>\<less\><frac|\<pi\>*\<xi\>|\<omega\>>,
    </equation>

    and so

    <\equation>
      <label|eq:T2_final_bound><around|\||T<rsub|2>|\|>\<leq\>min
      <around*|(|<frac|1|\<omega\>>,<frac|\<pi\>*\<xi\>|2*\<omega\><rsup|2>>|)>.
    </equation>

    Also

    <\equation>
      <label|eq:T1_definition>e<rsup|-\<pi\>*i*<around|(|2*n*x+n<rsup|2>*\<omega\>|)>/\<omega\>>*T<rsub|1>=\<Psi\><around|(|0|)>=<big|int><rsub|0><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|e<rsup|2*\<pi\>*t>-1>*d*t
    </equation>

    and so

    <\equation>
      <label|eq:T1_decomposition>T<rsub|1>=<big|int><rsub|0><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|e<rsup|2*\<pi\>*t>-1>*d*t+<big|int><rsub|0><rsup|1><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|1-e<rsup|-2*\<pi\>*t>>*d*t
    </equation>

    say.

    To approximate to these, we require a modified form<footnote|I am
    indebted to Mr. Davenport for this form which leads to smaller constants
    than those I found originally.> of the second mean value theorem.

    Suppose that for <math|a\<leq\>x\<leq\>b>, <math|f<around|(|x|)>> is
    positive, monotone decreasing and differentiable, and that
    <math|g<around|(|x|)>> is any continuous function (real or complex) of
    the real variable <math|x>. Then

    <\equation>
      <label|eq:second_mean_value><around*|\||<big|int><rsub|a><rsup|b>g<around|(|x|)>*d*f<around|(|x|)>|\|>\<leq\>f<around|(|a|)>*max<rsub|a\<leq\>x\<leq\>b><around*|\||<big|int><rsub|a><rsup|x>g<around|(|t|)>*d*t|\|>
    </equation>

    This is easily proved by putting <math|G<around|(|x|)>=<big|int><rsub|a><rsup|x>g<around|(|t|)>*d*t>,
    i.e. <math|g<around|(|x|)>=G<rprime|'><around|(|x|)>> and integrating the
    left hand side by parts.

    From this follows Wilton's result<nbsp><cite|Wilton1927> that for
    <math|M\<gtr\>0>

    <\equation>
      <label|eq:wilton_bound><around*|\||<big|int><rsub|M><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|e<rsup|2*\<pi\>*t>-1>*d*t|\|>\<leq\>min
      <around*|(|<frac|1|2*\<omega\>>,<frac|1|\<pi\>*\<omega\>*M>|)>
    </equation>

    Clearly <math|I<rsub|1>\<leq\>M>, and also

    <\equation>
      <label|eq:I1_bound>I<rsub|1>\<leq\><big|int><rsub|M><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|e<rsup|2*\<pi\>*t>>*d*t+<big|int><rsub|M><rsup|\<infty\>><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|e<rsup|2*\<pi\>*t>-1>*d*t\<less\><frac|1|2*\<pi\>*\<omega\>*M>+<frac|1|\<pi\>*\<omega\>*M>,
    </equation>

    since

    <\equation>
      <label|eq:integral_bound><around*|\||<big|int><rsub|M><rsup|\<infty\>>e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>*d*t|\|>=<around*|\||<big|int><rsub|M><rsup|\<infty\>>d<around|(|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>|)>/<around|(|2*\<pi\>*i*\<omega\>*t|)>|\|>\<leq\><frac|1|\<pi\>*\<omega\>*M>
    </equation>

    on applying the modified second mean value theorem. Then if
    <math|M\<gtr\>\<omega\><rsup|-1>>,

    <\equation>
      <label|eq:combined_bound><around|\||I<rsub|1>|\|>\<leq\><frac|1|2*\<omega\>>\<less\><frac|1|\<pi\>*\<omega\>*M>+<frac|1|\<pi\>*\<omega\>>=<frac|1|\<pi\>*\<omega\>>
    </equation>

    Now <math|<frac|x|e<rsup|2*\<pi\>*x>-1>> decreases steadily from
    <math|<frac|1|2*\<pi\>>> to <math|0> in <math|0\<leq\>x\<leq\>\<infty\>>,
    taking the obvious definition at <math|x=0>. For if
    <math|y=e<rsup|2*\<pi\>*x>\<geq\>1>, then from

    <\equation>
      <label|eq:derivative_condition><frac|d*y|d*x>\<cdot\><frac|<around|(|y-1|)>*<frac|d*y|d*x>-y<frac|d<rsup|2>*y|d*x<rsup|2>>|<around|(|y-1|)><rsup|2>>=0
    </equation>

    i.e.

    <\equation>
      <label|eq:simplified_condition><around|(|y-1|)>*<frac|d*y|d*x>-y<frac|d<rsup|2>*y|d*x<rsup|2>>=0
    </equation>

    i.e.

    <\equation>
      <label|eq:y_condition>1=<frac|5*y|4>
    </equation>

    But since <math|0\<less\><frac|4|5>\<less\>1>, the left hand side
    <math|\<gtr\><frac|5*y|4>> except when <math|y=1>. Hence by the mean
    value theorem and equation<nbsp><eqref|eq:wilton_bound>,

    <\equation>
      <label|eq:T1_final_bound><around|\||T<rsub|1>|\|>\<leq\><frac|\<xi\>|\<omega\>>+max<rsub|0\<leq\>t\<leq\>1><around*|\||<big|int><rsub|0><rsup|t><frac|e<rsup|\<pi\>*i*\<omega\>*s<rsup|2>>|e<rsup|2*\<pi\>*s>-1>*d*s|\|>\<leq\><frac|\<xi\>|\<omega\>>
    </equation>

    Next in <math|T<rsub|4>> write

    <\equation>
      <label|eq:T4_decomposition>T<rsub|4>=<big|int><rsub|0><rsup|1><frac|e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>*<around|(|1-e<rsup|-2*\<pi\>*t>|)>|1-e<rsup|-2*\<pi\>*t>>*d*t=<big|int><rsub|0><rsup|1>e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>*<around|(|1-e<rsup|-2*\<pi\>*t>|)>*d*t
    </equation>

    Also if

    <\equation>
      <label|eq:T5_definition>T<rsub|5>=<big|int><rsub|0><rsup|1>e<rsup|\<pi\>*i*\<omega\>*t<rsup|2>>*e<rsup|-2*\<pi\>*t>*<around|(|1-e<rsup|-2*\<pi\>*t>|)>*d*t
    </equation>

    then

    <\equation>
      <label|eq:T5_bound><around|\||T<rsub|5>|\|>\<leq\>\<xi\>*\<omega\><rsup|-1/2>+min
      <around*|(|<frac|1|\<pi\>*\<xi\>>,<frac|1|2*\<omega\>>,<frac|1|\<pi\>*\<omega\>>|)>
    </equation>

    by the mean value theorem, since <math|<frac|x*<around|(|1-x|)>|1-x<rsup|5>>>
    decreases steadily from <math|<frac|1|5+1>> to <math|0> in
    <math|1\<geq\>x\<geq\>0>.

    For from

    <\equation>
      <label|eq:derivative_x><frac|d|d*x>\<cdot\><frac|x*<around|(|1-x|)>|1-x<rsup|5>>=0
    </equation>

    <\equation>
      <label|eq:expanded_derivative><around|(|1-x<rsup|5>|)>*<around|(|1-2*x|)>-x*<around|(|1-x|)>*<around|(|5*x<rsup|4>|)>=0
    </equation>

    <\equation>
      <label|eq:final_condition><around|(|5+1|)>*x<rsup|5>*<around|(|1-x|)>=0
    </equation>

    i.e.

    <\equation>
      <label|eq:simplified_final>x<rsup|5>=<frac|1|5+1>
    </equation>

    But the left hand side <math|\<gtr\><around|(|5+1|)>*x> except when
    <math|x=1>. Hence

    <\equation>
      <label|eq:combined_T_bounds><around|\||T<rsub|1>|\|>\<leq\>\<xi\>*\<omega\><rsup|-1/2>+min
      <around*|(|<frac|\<pi\>*\<xi\>|2*\<omega\><rsup|2>>,<frac|1|\<pi\>*\<omega\>>|)>
    </equation>

    Hence, and this is equation<nbsp><eqref|eq:approximate_bound>,

    <\equation>
      <label|eq:final_approximation><around|\||F<around|(|x|)>+S<rprime|'><rsub|m,n>|\|>\<leq\>2*\<xi\>*\<omega\><rsup|-1/2>+2*min
      <around*|(|<frac|\<pi\>*\<xi\>|2*\<omega\><rsup|2>>,<frac|1|\<pi\>*\<omega\>>|)>
    </equation>

    If now also <math|0\<leq\>x\<less\>1>, the
    formulae<nbsp><eqref|eq:T1_decomposition>
    to<nbsp><eqref|eq:combined_T_bounds> on taking
    <math|0\<leq\>\<xi\>\<less\>1>, show

    <\equation>
      <label|eq:psi_difference_bound><around|\||\<Psi\><around|(|x|)>-\<Psi\><around|(|0|)>|\|>\<leq\>2*\<omega\><rsup|-1/2>+\<omega\><rsup|-1>
    </equation>

    Also from equation<nbsp><eqref|eq:final_approximation>

    <\equation>
      <label|eq:F_S_bound><around|\||F<around|(|x|)>+S<rprime|'><rsub|m,n>|\|>\<leq\>2*\<omega\><rsup|-1/2>+2*\<omega\><rsup|-1/2>
    </equation>

    Hence

    <\equation>
      <label|eq:F_zero_bound><around|\||F<around|(|0|)>+S<rprime|'><rsub|m,n>|\|>\<leq\>7*\<omega\><rsup|-1/2>
    </equation>

    i.e.

    <\equation>
      <label|eq:S_final_bound><around|\||S<rprime|''><rsub|m,n>|\|>\<leq\>8*\<omega\><rsup|-1/2>
    </equation>
  </proof>

  <section|Some Problems><label|sec:problems>

  There still remains the general transformation formula for
  <math|f<around|(|x,\<omega\>|)>>, i.e. a simple result for

  <\equation>
    <label|eq:transformation_problem>f<around*|(|<frac|\<alpha\>*\<omega\>+\<beta\>|\<gamma\>*\<omega\>+\<delta\>>,<frac|\<alpha\>*\<omega\>+\<beta\>|\<gamma\>*\<omega\>+\<delta\>>|)>
  </equation>

  where <math|\<alpha\>,\<beta\>,\<gamma\>,\<delta\>> are any integers
  satisfying <math|\<alpha\>*\<delta\>-\<beta\>*\<gamma\>=1>. I had hoped to
  deal with this question fourteen years ago but my attention was diverted
  elsewhere. It seems to me now that some of the ideas recently developed by
  Hecke<nbsp><cite|Hecke1926a|Hecke1926b> for the transformation of the
  thetafunctions associated with algebraic fields may be relevant, but I
  leave this to others.

  There is also the question in equation<nbsp><eqref|eq:f01_series> of
  finding a simple expansion for

  <\equation>
    <label|eq:expansion_problem><frac|f<rsub|00><around|(|x|)>*\<theta\><rsub|s><around|(|x|)>|\<theta\><rsub|00><around|(|x|)>>
  </equation>

  where <math|\<theta\><rsub|s><around|(|x|)>> is a thetafunction of order
  <math|s>, which would lead to class relation formulae.
  Thus<nbsp><cite|Mordell1916>

  <\equation>
    <label|eq:class_relation_example1><frac|f<rsub|00><around|(|x|)>|\<theta\><rsub|00><around|(|x|)>>*\<theta\><rsub|01><around|(|2*x,2*\<omega\>|)>=-<frac|\<theta\><rsub|00><around|(|x,\<omega\>|)>|2>+<big|sum><rsub|n=1><rsup|\<infty\>>B<rsub|n>*q<rsup|2*n>
  </equation>

  where for <math|n\<geq\>0>,

  <\align>
    <tformat|<table|<row|<cell|B<rsub|n>>|<cell|=<around|(|-1|)><rsup|n+r>*q<rsup|<around|(|n<rsup|2>-8*r<rsup|2>|)>/4><eq-number><label|eq:B_n_definition>>>|<row|<cell|B<rsub|-n>>|<cell|=<big|sum><rsub|r=1><rsup|<around|(|n-1|)>/2><around|(|-1|)><rsup|n+r>*q<rsup|<around|(|n<rsup|2>-8*r<rsup|2>|)>/4><eq-number><label|eq:B_minus_n_definition>>>>>
  </align>

  On differentiating and putting <math|x=0>, we find that if <math|m> is any
  integer <math|\<gtr\>0>,

  <\equation>
    <label|eq:class_relation_result1>F<around|(|m|)>-2*F*<around|(|m-2\<cdot\>1<rsup|2>|)>+2*F*<around|(|m-2\<cdot\>2<rsup|2>|)>-\<cdots\>=2*<big|sum><around|(|-1|)><rsup|x+y+1>
  </equation>

  where the summation in <math|x,y> refers to the solutions in integers of

  <\equation>
    <label|eq:constraint1><frac|x<rsup|2>|2>+2*y<rsup|2>=m
  </equation>

  with <math|x\<gtr\>0> and <math|-<frac|1|2>*<around|(|x-1|)>\<leq\>y\<leq\>0>,
  or is zero if no such solutions exist.

  Next

  <\equation>
    <label|eq:class_relation_example2><frac|f<rsub|00><around|(|x|)>|\<theta\><rsub|00><around|(|x|)>>*\<theta\><rsub|00><around|(|3*x,3*\<omega\>|)>-<frac|1|2>*\<theta\><rsub|01><around|(|2*x,2*\<omega\>|)>+A*\<theta\><rsub|11><around|(|2*x,2*\<omega\>|)>+<big|sum><rsub|n=1><rsup|\<infty\>>B<rsub|n>*q<rsup|2*n>
  </equation>

  where for <math|n\<geq\>0>,

  <\align>
    <tformat|<table|<row|<cell|B<rsub|n>>|<cell|=<around|(|-1|)><rsup|n+r>*q<rsup|<around|(|n<rsup|2>-8*r<rsup|2>|)>/4><eq-number><label|eq:B_n_new>>>|<row|<cell|B<rsub|-n>>|<cell|=<big|sum><rsub|r=1><rsup|<around|(|n-2|)>/2><around|(|-1|)><rsup|n+r>*q<rsup|<around|(|n<rsup|2>-8*r<rsup|2>|)>/4><eq-number><label|eq:B_minus_n_new>>>>>
  </align>

  and is also subject to the condition <math|r\<equiv\>n<pmod|2>>. Also
  <math|A> is independent of <math|x>, but it does not seem easy to find a
  simple form for <math|A> of use for deducing class-relation formulae. This
  is, of course, the difficulty arising in the general case and is worth
  consideration by other investigators.

  Here, however, a class relation formula can be deduced as I have already
  shown. For if we change <math|x> into <math|x+<frac|1|2>> and add the two
  expansions, <math|A> is eliminated. Now differentiate and put <math|x=0>:
  we find that

  <\equation>
    <label|eq:class_relation_result2>F*<around|(|2*m|)>-2*F*<around|(|2*m-3\<cdot\>1<rsup|2>|)>+2*F*<around|(|2*m-3\<cdot\>2<rsup|2>|)>-\<cdots\>=<around|(|-1|)><rsup|m+1>*2*<big|sum>
  </equation>

  where the summation in <math|x,y> refers to the solutions in integers of

  <\equation>
    <label|eq:constraint2><frac|x<rsup|2>|3>+3*y<rsup|2>=m
  </equation>

  with <math|x\<gtr\>0> and <math|-<frac|1|3>*<around|(|x-1|)>\<leq\>y\<leq\>0>.

  An extensive set of formulae of this kind has been given by Uspensky and
  Venkoff<nbsp><cite|UspenskyVenkoff1924> which they have investigated by
  Liouville's arithmetic method.

  I may remark finally that there is a possibility that relations such as
  equations<nbsp><eqref|eq:omega_relation1>
  to<nbsp><eqref|eq:class_number_sum2> may lead to results about the order of
  magnitude of the class number and perhaps supply solutions of questions
  such as \PIs <math|F<around|(|n|)>=1> for an infinity of values of
  <math|n>?\Q

  <\thebibliography|99>
    <bibitem|HardyLittlewood1914>G.H. Hardy and J.E. Littlewood.
    <newblock>Note on the function <math|<big|int><rsub|0><rsup|\<infty\>><frac|e<rsup|-x<rsup|2>>|e<rsup|2*\<pi\>*x>+1>*d*x>.
    <newblock><with|font-shape|italic|Quarterly Journal of Mathematics>,
    35:193\U207, 1904.

    <bibitem|HardyLittlewood1921>G.H. Hardy and J.E. Littlewood.
    <newblock>Some problems of diophantine approximation.
    <newblock><with|font-shape|italic|Acta Mathematica>, 37:193\U221, 1914.

    <bibitem|HardyLittlewood1923>G.H. Hardy and J.E. Littlewood.
    <newblock>Some problems of diophantine approximation: an additional note
    on the trigonometrical series associated with the elliptic
    theta-functions. <newblock><with|font-shape|italic|Acta Mathematica>,
    47:189\U198, 1925.

    <bibitem|HardyLittlewood1925>G.H. Hardy and J.E. Littlewood.
    <newblock>The zeros of riemann's zeta-function on the critical line.
    <newblock><with|font-shape|italic|Mathematische Zeitschrift>,
    10:283\U317, 1921.

    <bibitem|Hecke1926a>E. Hecke. <newblock>Zur theorie der elliptischen
    modulfunktionen. <newblock><with|font-shape|italic|Mathematische
    Annalen>, 97:210, 1926.

    <bibitem|Hecke1926b>E. Hecke. <newblock>Über das verhalten von
    <math|\<zeta\><rsub|K><around|(|s,\<frak-m\>|)>> und
    <math|\<zeta\><rsub|K><around|(|s,\<chi\>,\<frak-f\>|)>> bei
    modultransformationen. <newblock><with|font-shape|italic|Journal für die
    reine und angewandte Mathematik>, 157:159\U170, 1926.

    <bibitem|Kronecker1889>L. Kronecker. <newblock>Summierung der gaussschen
    reihen <math|<big|sum><rsub|h=0><rsup|n-1>e<rsup|2*h<rsup|2>*\<pi\>*i/n>>.
    <newblock><with|font-shape|italic|Journal für die reine und angewandte
    Mathematik>, 105:267\U268, 1889.

    <bibitem|Lerch1892>M. Lerch. <newblock>Bemerkungen zur theorie der
    elliptischen funktionen. <newblock><with|font-shape|italic|Rozpravy ceske
    Akademie cisare Frantiska Josefa pro vedy slovesnost, a umeni>, (II Cl) 1
    Nr. (24), 1892.

    <bibitem|Mordell1916>L.J. Mordell. <newblock>On class relation formulae.
    <newblock><with|font-shape|italic|Messenger of Mathematics>, 46:113\U135,
    1916.

    <bibitem|Mordell1918>L.J. Mordell. <newblock>On a simple summation of the
    series <math|<big|sum><rsub|s=0><rsup|n-1>e<rsup|2*s<rsup|2>*\<pi\>*i/n>>.
    <newblock><with|font-shape|italic|Messenger of Mathematics>, 48:54\U56,
    1918.

    <bibitem|Mordell1920>L.J. Mordell. <newblock>The value of the definite
    integral <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|a*t<rsup|2>+b*t>|e<rsup|c*t>+d>*d*t>.
    <newblock><with|font-shape|italic|Quarterly Journal of Mathematics>,
    68:329\U342, 1920.

    <bibitem|Mordell1926>L.J. Mordell. <newblock>The approximate functional
    formula for the thetafunction. <newblock><with|font-shape|italic|Journal
    of the London Mathematical Society>, 1:68\U72, 1926.

    <bibitem|Ramanujan1915a>S. Ramanujan. <newblock>Some definite integrals.
    <newblock><with|font-shape|italic|Messenger of Mathematics>, 44:10\U18,
    1915.

    <bibitem|Ramanujan1915b>S. Ramanujan. <newblock>Some definite integrals
    connected with gauss's sums. <newblock><with|font-shape|italic|Messenger
    of Mathematics>, 44:75\U85, 1915.

    <bibitem|Ramanujan1919>S. Ramanujan. <newblock>Some definite integrals.
    <newblock><with|font-shape|italic|Journal of the Indian Mathematical
    Society>, 11:81\U87, 1919.

    <bibitem|Siegel1932>C.L. Siegel. <newblock>Über riemann's nachlass zur
    analytischen zahlentheorie. <newblock><with|font-shape|italic|Quellen und
    Studien zur Geschichte der Mathematik, Astronomie und Physik>, 2:45\U80,
    1932.

    <bibitem|UspenskyVenkoff1924>J.V. Uspensky and B. Venkoff. <newblock>On
    some new class-number relations. <newblock><with|font-shape|italic|Proceedings
    of the international mathematical congress, Toronto>, pages 315\U317,
    1924.

    <bibitem|vanderCorput1922>J.G. van der Corput. <newblock>Über summen, die
    mit den elliptischen <math|\<theta\>> funktionen zusammenhängen.
    <newblock><with|font-shape|italic|Mathematische Annalen>, 87:66\U77,
    1922.

    <bibitem|vanderCorput1923>J.G. van der Corput. <newblock>Über summen, die
    mit den elliptischen <math|\<theta\>> funktionen zusammenhängen.
    <newblock><with|font-shape|italic|Mathematische Annalen>, 90:1\U18, 1923.

    <bibitem|Wilton1927>J.R. Wilton. <newblock>The approximate functional
    formula for the thetafunction. <newblock><with|font-shape|italic|Journal
    of the London Mathematical Society>, 2:177\U180, 1927.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-10|<tuple|10|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-11|<tuple|184|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-2|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-3|<tuple|3|6|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-4|<tuple|4|8|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-5|<tuple|5|9|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-6|<tuple|6|11|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-7|<tuple|7|13|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-8|<tuple|8|15|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-9|<tuple|9|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-HardyLittlewood1914|<tuple|HardyLittlewood1914|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-HardyLittlewood1921|<tuple|HardyLittlewood1921|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-HardyLittlewood1923|<tuple|HardyLittlewood1923|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-HardyLittlewood1925|<tuple|HardyLittlewood1925|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Hecke1926a|<tuple|Hecke1926a|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Hecke1926b|<tuple|Hecke1926b|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Kronecker1889|<tuple|Kronecker1889|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Lerch1892|<tuple|Lerch1892|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Mordell1916|<tuple|Mordell1916|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Mordell1918|<tuple|Mordell1918|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Mordell1920|<tuple|Mordell1920|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Mordell1926|<tuple|Mordell1926|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Ramanujan1915a|<tuple|Ramanujan1915a|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Ramanujan1915b|<tuple|Ramanujan1915b|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Ramanujan1919|<tuple|Ramanujan1919|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Siegel1932|<tuple|Siegel1932|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-UspenskyVenkoff1924|<tuple|UspenskyVenkoff1924|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Wilton1927|<tuple|Wilton1927|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-vanderCorput1922|<tuple|vanderCorput1922|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-vanderCorput1923|<tuple|vanderCorput1923|22|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:B_minus_n_definition|<tuple|177|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:B_minus_n_new|<tuple|182|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:B_n_definition|<tuple|176|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:B_n_new|<tuple|181|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:F0_G0|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:F_S_bound|<tuple|170|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:F_definition|<tuple|137|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:F_zero_bound|<tuple|171|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:I1_bound|<tuple|153|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:R_functional1|<tuple|119|15|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:R_functional2|<tuple|120|15|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:S_final_bound|<tuple|172|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:S_mn_definition|<tuple|138|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T1_decomposition|<tuple|150|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T1_definition|<tuple|149|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T1_final_bound|<tuple|159|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T2_bound|<tuple|147|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T2_definition|<tuple|146|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T2_final_bound|<tuple|148|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T4_decomposition|<tuple|160|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T5_bound|<tuple|162|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T5_definition|<tuple|161|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T_decomposition|<tuple|145|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:alternative_form1|<tuple|108|13|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:alternative_form2|<tuple|109|14|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:angle_constraint|<tuple|98|12|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:approximate_bound|<tuple|140|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:approximate_bound2|<tuple|141|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:binary_quadratic_form|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:bound1|<tuple|79|10|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:cauchy_result|<tuple|65|8|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:chi_bound|<tuple|85|10|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:class_number_sum|<tuple|41|6|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:class_number_sum2|<tuple|42|6|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:class_relation|<tuple|9|2|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:class_relation_example1|<tuple|175|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:class_relation_example2|<tuple|180|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:class_relation_general|<tuple|37|5|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:class_relation_result1|<tuple|178|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:class_relation_result2|<tuple|183|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:combined_T_bounds|<tuple|167|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:combined_bound|<tuple|155|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:combined_iteration|<tuple|142|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:combined_result|<tuple|112|14|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:congruence|<tuple|8|2|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:constraint1|<tuple|179|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:constraint2|<tuple|184|21|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:contour_deformation|<tuple|99|12|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:contour_integral|<tuple|62|7|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:contour_integral_sides|<tuple|133|16|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:contour_result|<tuple|100|12|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:convergence1|<tuple|78|9|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:convergence_bound|<tuple|80|10|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:convergence_condition|<tuple|104|13|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:d_functional1|<tuple|56|7|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:d_functional2|<tuple|57|7|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:d_residue|<tuple|58|7|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:derivative_condition|<tuple|156|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:derivative_x|<tuple|163|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:determinant|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:diff_eq1|<tuple|25|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:diff_eq2|<tuple|26|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:dirichlet_formula|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:expanded_derivative|<tuple|164|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:expansion_problem|<tuple|174|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:exponential_limit|<tuple|91|11|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:f01_def|<tuple|34|5|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:f01_series|<tuple|35|5|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:f_expansion|<tuple|32|5|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:f_prop1|<tuple|28|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:f_prop2|<tuple|29|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:f_prop3|<tuple|30|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:f_zero|<tuple|31|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:f_zero_expanded|<tuple|33|5|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:final_approximation|<tuple|168|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:final_condition|<tuple|165|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:final_limit|<tuple|92|11|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:functional_eq_1|<tuple|23|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:functional_eq_2|<tuple|24|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:gauss_formula1|<tuple|121|15|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:gauss_formula2|<tuple|122|15|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:gauss_sum_difference|<tuple|131|16|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:gauss_sum_final|<tuple|134|16|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:gauss_sum_function|<tuple|130|16|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:gauss_sum_integral|<tuple|132|16|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:gauss_sum_normalization|<tuple|136|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:gauss_sum_reciprocity|<tuple|129|16|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:gauss_sum_scaling|<tuple|135|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:gaussian_integral|<tuple|59|7|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:general_constant|<tuple|66|8|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:general_integral|<tuple|95|11|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:integral_bound|<tuple|154|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:integral_function|<tuple|22|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:integrand_bound|<tuple|63|8|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:irrational_formula|<tuple|93|11|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:iteration1|<tuple|82|10|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:iteration2|<tuple|83|10|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:iteration_combined|<tuple|84|10|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:iteration_rewrite|<tuple|144|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:kronecker_integral|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:lerch_function|<tuple|116|14|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:lerch_integral|<tuple|117|14|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:lerch_result|<tuple|118|14|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:limit1|<tuple|89|11|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:limit2|<tuple|90|11|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:main_theorem|<tuple|44|6|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:mordell_formula|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:negative_omega_formula|<tuple|94|11|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:omega_expansion|<tuple|38|5|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:omega_relation|<tuple|103|12|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:omega_relation1|<tuple|39|5|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:omega_relation2|<tuple|40|5|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:phi_def|<tuple|70|8|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:phi_functional1|<tuple|48|6|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:phi_functional2|<tuple|49|6|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:phi_integral_form|<tuple|60|7|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:phi_solution|<tuple|61|7|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:psi_definition|<tuple|123|15|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:psi_difference_bound|<tuple|169|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:psi_functional1|<tuple|124|15|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:psi_functional2|<tuple|125|15|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:psi_iteration1|<tuple|126|16|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:psi_iteration2|<tuple|128|16|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:psi_transformation|<tuple|127|16|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:psi_zero|<tuple|143|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:ramanujan_property|<tuple|43|6|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:ratio_function|<tuple|36|5|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:rational_sum1|<tuple|86|10|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:rational_sum2|<tuple|87|10|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:rational_sum3|<tuple|88|11|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:real_axis_integral|<tuple|101|12|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:real_omega_case|<tuple|105|13|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:reciprocal_eq1|<tuple|114|14|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:reciprocal_eq2|<tuple|115|14|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:reciprocal_relation|<tuple|113|14|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:reduced_form1|<tuple|97|12|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:reduced_form2|<tuple|102|12|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:residue_integral|<tuple|27|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:residue_series|<tuple|106|13|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:riemann_integral|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:second_form_case1|<tuple|72|9|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:second_form_case1_alt|<tuple|73|9|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:second_form_case2|<tuple|74|9|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:second_form_case2_alt|<tuple|75|9|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:second_form_case3|<tuple|76|9|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:second_mean_value|<tuple|151|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:second_standard|<tuple|68|8|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:shift_identity|<tuple|64|8|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:shifted_integral|<tuple|67|8|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:simplified_condition|<tuple|157|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:simplified_final|<tuple|166|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:simplified_form|<tuple|111|14|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:splitting|<tuple|77|9|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:substitution1|<tuple|96|12|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta00_def|<tuple|10|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta00_short|<tuple|14|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta01_def|<tuple|12|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta10_def|<tuple|11|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta11_def|<tuple|13|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta_def|<tuple|69|8|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta_identity|<tuple|107|13|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta_phi_sum|<tuple|71|9|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta_product1|<tuple|19|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta_product2|<tuple|20|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta_product3|<tuple|21|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta_prop1|<tuple|15|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta_prop2|<tuple|16|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta_transform1|<tuple|17|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:theta_transform2|<tuple|18|4|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:transformation_problem|<tuple|173|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:transformed_integral|<tuple|110|14|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:vanishing_bound|<tuple|81|10|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:wilton_bound|<tuple|152|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:xi_definition|<tuple|139|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:y_condition|<tuple|158|19|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|footnote-1|<tuple|1|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|footnr-1|<tuple|1|18|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:approximate_functional_equation|<tuple|9|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:coalesce_case|<tuple|5|9|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:first_standard_form|<tuple|3|6|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:gauss_sums|<tuple|8|15|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:integral_function|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:miscellaneous_results|<tuple|7|13|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:problems|<tuple|10|20|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:second_standard_form|<tuple|4|8|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:standard_forms|<tuple|6|11|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|thm:approximate_functional|<tuple|3|17|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|thm:gauss_sums|<tuple|2|15|../../.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|thm:main_theorem|<tuple|1|6|../../.TeXmacs/texts/scratch/no_name_6.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Siegel1932

      HardyLittlewood1914

      Lerch1892

      Hardy1904

      Ramanujan1915a

      vanderCorput1922

      Mordell1916

      Mordell1916

      Lerch1892

      Ramanujan1919

      Mordell1916

      Mordell1920

      Ramanujan1915b

      Ramanujan1915b

      Hardy1904

      Ramanujan1915b

      Lerch1892

      Mordell1918

      HardyLittlewood1921

      HardyLittlewood1923

      HardyLittlewood1925

      vanderCorput1922

      vanderCorput1923

      Mordell1926

      Wilton1927

      Wilton1927

      Hecke1926a

      Hecke1926b

      Mordell1916

      UspenskyVenkoff1924
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>An
      Integral Function connected with the <with|mode|<quote|math>|\<theta\>>
      Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      First Standard Form> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      Second Standard Form> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      Case when the Standard Forms coalesce>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Reduction
      of the Integral to the Standard Forms>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Miscellaneous
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>The
      Case when <with|mode|<quote|math>|i*a/c<rsup|2>> is Rational and the
      Gauss's Sums> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>The
      Approximate Functional Equation of the Thetafunction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Some
      Problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>