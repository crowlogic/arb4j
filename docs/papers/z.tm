<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Definition of <math|\<zeta\><around|(|s|)>>,
  <math|Z<around|(|t|)>> and Basic Notions>|<doc-date|>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>The
    basic notions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    functional equation for <with|mode|math|\<zeta\><around|(|s|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Properties
    of Hardy's function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>The
    distribution of zeta-zeros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Notes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|The basic notions><label|sec:basic>

  The classical Riemann zeta-function

  <\equation>
    <label|eq:zeta_def>\<zeta\><around|(|s|)>=<big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-s>=<big|prod><rsub|p><around|(|1-p<rsup|-s>|)><rsup|-1>*<space|1em><around|(|s=\<sigma\>+i*t,\<sigma\>\<gtr\>1|)>
  </equation>

  admits analytic continuation to <math|\<bbb-C\>>. It is regular on
  <math|\<bbb-C\>> except for a simple pole at <math|s=1>. The product
  representation in equation<nbsp><eqref|eq:zeta_def> shows that
  <math|\<zeta\><around|(|s|)>> does not vanish for <math|\<sigma\>\<gtr\>1>.
  The Laurent expansion of <math|\<zeta\><around|(|s|)>> at <math|s=1> reads

  <\equation>
    <label|eq:laurent>\<zeta\><around|(|s|)>=<frac|1|s-1>+\<gamma\><rsub|0>+\<gamma\><rsub|1>*<around|(|s-1|)>+\<gamma\><rsub|2>*<around|(|s-1|)><rsup|2>+\<cdots\>,
  </equation>

  where the so-called Stieltjes constants <math|\<gamma\><rsub|k>> are given
  by

  <\equation>
    <label|eq:stieltjes>\<gamma\><rsub|k>=<frac|<around|(|-1|)><rsup|k>|k!>*lim<rsub|N\<to\>\<infty\>><around*|(|<big|sum><rsub|m\<leq\>N><frac|log<rsup|k>
    m|m>-<frac|log<rsup|k+1> N|k+1>|)>*<space|1em><around|(|k=0,1,2,\<ldots\>|)>.
  </equation>

  In particular

  <\equation>
    <label|eq:euler_constant>\<gamma\>\<equiv\>\<gamma\><rsub|0>=lim<rsub|N\<to\>\<infty\>><around*|(|1+<frac|1|2>+\<cdots\>+<frac|1|N>-log
    N|)>=-\<Gamma\><rprime|'><around|(|1|)>=0.5772157*\<ldots\>
  </equation>

  is the Euler constant and

  <\equation>
    <label|eq:gamma_func>\<Gamma\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|s-1>*e<rsup|-x>*d*x*<space|1em><around|(|<text|Re
    >s\<gtr\>0|)>
  </equation>

  is the familiar Euler gamma-function.

  The product in equation<nbsp><eqref|eq:zeta_def> is called the Euler
  product. As usual, <math|p> denotes prime numbers, so that by its very
  essence <math|\<zeta\><around|(|s|)>> represents an important tool for the
  investigation of prime numbers. This is even more evident from the relation

  <\equation>
    <label|eq:log_deriv>-<frac|\<zeta\><rprime|'><around|(|s|)>|\<zeta\><around|(|s|)>>=<big|sum><rsub|n=1><rsup|\<infty\>>\<Lambda\><around|(|n|)>*n<rsup|-s>*<space|1em><around|(|\<sigma\>\<gtr\>1|)>,
  </equation>

  which follows by logarithmic differentiation of
  equation<nbsp><eqref|eq:zeta_def>, where the von Mangoldt function
  <math|\<Lambda\><around|(|n|)>> is defined as

  <\equation>
    <label|eq:mangoldt>\<Lambda\><around|(|n|)>=<choice|<tformat|<table|<row|<cell|log
    p>|<cell|<text|if >n=p<rsup|\<alpha\>>,>>|<row|<cell|0>|<cell|<text|if
    >n\<neq\>p<rsup|\<alpha\>>>>>>><space|1em><around|(|\<alpha\>\<in\>\<bbb-N\>|)>.
  </equation>

  The zeta-function can be also used to generate many other important
  arithmetic functions; for example,

  <\equation>
    <label|eq:squarefree><frac|\<zeta\><around|(|s|)>|\<zeta\>*<around|(|2*s|)>>*<space|1em><around|(|\<sigma\>\<gtr\>1|)>,
  </equation>

  <\equation>
    <label|eq:squarefull><frac|\<zeta\>*<around|(|2*s|)>*\<zeta\>*<around|(|3*s|)>|\<zeta\>*<around|(|6*s|)>>*<space|1em><around|(|\<sigma\>\<gtr\><frac|1|2>|)>
  </equation>

  generate the characteristic functions of squarefree and squarefull numbers,
  respectively. One also has, for a given <math|k\<in\>\<bbb-N\>>,

  <\equation>
    <label|eq:divisor_gen>\<zeta\><rsup|k><around|(|s|)>=<big|sum><rsub|n=1><rsup|\<infty\>>d<rsub|k><around|(|n|)>*n<rsup|-s>*<space|1em><around|(|\<sigma\>\<gtr\>1|)>,
  </equation>

  where the (general) divisor function <math|d<rsub|k><around|(|n|)>>
  represents the number of ways <math|n> can be written as a product of
  <math|k> factors, so that in particular
  <math|d<rsub|1><around|(|n|)>\<equiv\>1> and
  <math|d<rsub|2><around|(|n|)>=<big|sum><rsub|\<delta\>\|n>1> is the number
  of positive divisors of <math|n>. The function
  <math|d<rsub|k><around|(|n|)>> is a multiplicative function of <math|n>
  (meaning <math|d<rsub|k>*<around|(|m*n|)>=d<rsub|k><around|(|m|)>*d<rsub|k><around|(|n|)>>
  if <math|m> and <math|n> are coprime), and

  <\equation>
    <label|eq:divisor_prime>d<rsub|k><around|(|p<rsup|\<alpha\>>|)>=<around|(|-1|)><rsup|\<alpha\>><binom|-k|\<alpha\>>=<frac|k*<around|(|k+1|)>*\<cdots\>*<around|(|k+\<alpha\>-1|)>|\<alpha\>!>
  </equation>

  for primes <math|p> and <math|\<alpha\>\<in\>\<bbb-N\>>.

  Another significant aspect of <math|\<zeta\><around|(|s|)>> is that it can
  be generalized to many other similar Dirichlet series (notably to the
  Selberg class <math|\<cal-S\>>, which will be discussed in Chapter 3). A
  vast body of literature exists on many facets of zeta-function theory, such
  as the distribution of its zeros and power moments of
  <math|<around|\||\<zeta\>*<around|(|<frac|1|2>+i*t|)>|\|>> (see, e.g., the
  monographs <cite|Iv1>, <cite|Iv4>, <cite|Mot1>, <cite|Ram> and
  <cite|Tit3>). It is within this framework that the classical Hardy function
  (see, e.g., <cite|Iv1>) <math|Z<around|(|t|)>> (<math|t\<in\>\<bbb-R\>>)
  arises, and plays an important role in the theory of
  <math|\<zeta\><around|(|s|)>>. It is defined as

  <\equation>
    <label|eq:hardy_def>Z<around|(|t|)>\<assign\>\<zeta\>*<around*|(|<frac|1|2>+i*t|)>*<around*|\||\<chi\>*<around*|(|<frac|1|2>+i*t|)>|\|><rsup|-1/2>,
  </equation>

  where <math|\<chi\><around|(|s|)>> comes from the well-known functional
  equation for <math|\<zeta\><around|(|s|)>>; see
  equations<nbsp><eqref|eq:func_eq> and<nbsp><eqref|eq:func_eq_alt> below.
  The basic properties of <math|Z<around|(|t|)>> will be discussed in
  Section<nbsp><reference|sec:hardy>.

  <section|The functional equation for <math|\<zeta\><around|(|s|)>>><label|sec:func_eq>

  The functional equation is one of the most fundamental tools of
  zeta-function theory. Therefore the following provides a proof which
  incidentally originated with the great German mathematician B. Riemann
  (1826-1866), who founded the theory of <math|\<zeta\><around|(|s|)>> in his
  epoch-making memoir <cite|Rie>.

  <\theorem>
    <label|thm:func_eq>The function <math|\<zeta\><around|(|s|)>> admits
    analytic continuation to <math|\<bbb-C\>>, where it satisfies the
    functional equation

    <\equation>
      <label|eq:func_eq>\<pi\><rsup|-s/2>*\<zeta\><around|(|s|)>*\<Gamma\><around*|(|<frac|s|2>|)>=\<pi\><rsup|-<around|(|1-s|)>/2>*\<zeta\>*<around|(|1-s|)>*\<Gamma\><around*|(|<frac|1-s|2>|)>.
    </equation>
  </theorem>

  <\remark>
    <label|rem:func_eq_alt>The functional equation<nbsp><eqref|eq:func_eq> is
    in a symmetric form. Alternatively one can write
    equation<nbsp><eqref|eq:func_eq> as

    <\equation>
      <label|eq:func_eq_alt>\<zeta\><around|(|s|)>=\<chi\><around|(|s|)>*\<zeta\>*<around|(|1-s|)>,
    </equation>

    where

    <\equation>
      <label|eq:chi_def>\<chi\><around|(|s|)>=<frac|\<Gamma\><around*|(|<frac|1-s|2>|)>|\<Gamma\><around*|(|<frac|s|2>|)>>*\<pi\><rsup|s-1/2>.
    </equation>

    This expression can be put into other equivalent forms. For example,

    <\equation>
      <label|eq:chi_alt>\<chi\><around|(|s|)>=2<rsup|s>*\<pi\><rsup|s-1>*sin
      <around*|(|<frac|\<pi\>*s|2>|)>*\<Gamma\>*<around|(|1-s|)>=<frac|<around|(|2*\<pi\>|)><rsup|s>|2*\<Gamma\><around|(|s|)>>*cos
      <around|(|\<pi\>*s/2|)>,
    </equation>

    where the well-known identities

    <\equation>
      <label|eq:gamma_identities>\<Gamma\><around|(|s|)>*\<Gamma\>*<around|(|1-s|)>=<frac|\<pi\>|sin
      <around|(|\<pi\>*s|)>>,<space|1em>\<Gamma\><around|(|s|)>*\<Gamma\>*<around*|(|s+<frac|1|2>|)>=2<rsup|1-2*s>*<sqrt|\<pi\>>*\<Gamma\>*<around|(|2*s|)>
    </equation>

    are used.
  </remark>

  <\remark>
    <label|rem:chi_property>Note that equation<nbsp><eqref|eq:func_eq_alt>
    gives the identity

    <\equation>
      <label|eq:chi_inverse>\<chi\><around|(|s|)>*\<chi\>*<around|(|1-s|)>=1.
    </equation>

    All identities<nbsp><eqref|eq:func_eq>\U<eqref|eq:chi_inverse> hold for
    <math|s\<in\>\<bbb-C\>>.
  </remark>

  Before proceeding to the proof of the functional
  equation<nbsp><eqref|eq:func_eq>, the following result on a transformation
  formula for the theta-function (see equation<nbsp><eqref|eq:theta_def>) is
  needed, embodied in the following lemma.

  <\lemma>
    <label|lem:theta_transform>The following holds:

    <\equation>
      <label|eq:theta_transform><big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>e<rsup|-\<pi\>*n<rsup|2>*t>=<frac|1|<sqrt|t>>*<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>e<rsup|-\<pi\>*n<rsup|2>/t>*<space|1em><around|(|t\<gtr\>0|)>.
    </equation>
  </lemma>

  For <math|v\<in\>\<bbb-R\>>, <math|\<tau\>=i*y>, <math|y\<gtr\>0>, the
  Fourier expansion

  <\equation>
    <label|eq:fourier>f<around|(|v|)>\<assign\><big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>e<rsup|\<pi\>*i*\<tau\>*<around|(|n+v|)><rsup|2>>=<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>c<rsub|k>*e<rsup|2*\<pi\>*i*k*v>
  </equation>

  holds, since <math|f<around|(|v|)>> is periodic with period 1 and
  <math|f<around|(|v|)>\<in\>C<rsup|1>*<around|[|0,1|]>>. Hence with
  <math|A=-2*\<pi\>*i*k>, <math|B=\<pi\>*y>, for the Fourier coefficients
  <math|c<rsub|k>> the expression

  <\align>
    <tformat|<table|<row|<cell|c<rsub|k>>|<cell|=<big|int><rsub|0><rsup|1><big|sum><rsub|n=-\<infty\>><rsup|\<infty\>>e<rsup|\<pi\>*i*\<tau\>*<around|(|n+v|)><rsup|2>-2*\<pi\>*i*k*v>*d*v<eq-number><label|eq:fourier_coeff>>>|<row|<cell|>|<cell|=<big|sum><rsub|n=-\<infty\>><rsup|\<infty\>><big|int><rsub|0><rsup|1>e<rsup|\<pi\>*i*\<tau\>*<around|(|n+v|)><rsup|2>-2*\<pi\>*i*k*<around|(|n+v|)>>*d*v>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-\<pi\>*y*v<rsup|2>-2*\<pi\>*i*k*v>*d*v=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|A*v-B*v<rsup|2>>*d*v>>|<row|<cell|>|<cell|=<sqrt|<frac|\<pi\>|B>>*e<rsup|A<rsup|2>/<around|(|4*B|)>>=<frac|1|<sqrt|y>>*e<rsup|-\<pi\>*k<rsup|2>/y>.>>>>
  </align>

  The change of order of summation and integration in
  equation<nbsp><eqref|eq:fourier_coeff> is justified by absolute
  convergence. Here the classical integral

  <\equation>
    <label|eq:gaussian_int><big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|(|A*t-B*t<rsup|2>|)>*d*t=<sqrt|<frac|\<pi\>|B>>*exp
    <around*|(|<frac|A<rsup|2>|4*B>|)>*<space|1em><around|(|<text|Re
    >B\<gtr\>0|)>
  </equation>

  is used.

  Setting <math|v=0>, <math|i*\<tau\>=i<rsup|2>*y=-t>, <math|y=t> in
  equations<nbsp><eqref|eq:fourier> and<nbsp><eqref|eq:fourier_coeff>,
  equation<nbsp><eqref|eq:theta_transform> of
  Lemma<nbsp><reference|lem:theta_transform> is obtained. By analytic
  continuation it is seen that equation<nbsp><eqref|eq:theta_transform>
  remains valid for Re <math|t\<gtr\>0>. If the theta-function is defined as

  <\equation>
    <label|eq:theta_def>\<vartheta\><around|(|t|)>=<big|sum><rsub|n=1><rsup|\<infty\>>e<rsup|-\<pi\>*n<rsup|2>*t>*<space|1em><around|(|<text|Re
    >t\<gtr\>0|)>,
  </equation>

  then equation<nbsp><eqref|eq:theta_transform> yields the transformation
  formula

  <\equation>
    <label|eq:theta_transform_alt>\<vartheta\><around|(|t|)>=<frac|1|2*<sqrt|t>>*<around*|(|2*\<vartheta\><around*|(|<frac|1|t>|)>+1|)>-<frac|1|2>*<space|1em><around|(|<text|Re
    >t\<gtr\>0|)>.
  </equation>

  Starting from

  <\equation>
    <label|eq:gamma_integral>\<Gamma\><around*|(|<frac|s|2>|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-x>*x<rsup|s/2-1>*d*x*<space|1em><around|(|\<sigma\>\<gtr\>0|)>,
  </equation>

  which is just equation<nbsp><eqref|eq:gamma_func> with <math|s/2> in place
  of <math|s>. If <math|n\<in\>\<bbb-N\>>, writing <math|\<pi\>*n<rsup|2>*x>
  in place of <math|x> gives

  <\equation>
    <label|eq:gamma_scaled>\<Gamma\><around*|(|<frac|s|2>|)>=\<pi\><rsup|s/2>*n<rsup|s>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<pi\>*n<rsup|2>*x>*x<rsup|s/2-1>*d*x*<space|1em><around|(|\<sigma\>\<gtr\>0|)>,
  </equation>

  or

  <\equation>
    <label|eq:zeta_integral_term>n<rsup|-s>=<frac|\<pi\><rsup|s/2>|\<Gamma\>*<around|(|s/2|)>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<pi\>*n<rsup|2>*x>*x<rsup|s/2-1>*d*x*<space|1em><around|(|\<sigma\>\<gtr\>0|)>.
  </equation>

  Summation over <math|n> gives, for <math|\<sigma\>\<gtr\>1>,

  <\equation>
    <label|eq:zeta_integral>\<zeta\><around|(|s|)>=<big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-s>=<frac|\<pi\><rsup|s/2>|\<Gamma\>*<around|(|s/2|)>>*<big|sum><rsub|n=1><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<pi\>*n<rsup|2>*x>*x<rsup|s/2-1>*d*x.
  </equation>

  Since the series

  <\equation>
    <label|eq:convergence><big|sum><rsub|n=1><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>><around*|\||e<rsup|-\<pi\>*n<rsup|2>*x>*x<rsup|s/2-1>|\|>*d*x=<big|sum><rsub|n=1><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<pi\>*n<rsup|2>*x>*x<rsup|\<sigma\>/2-1>*d*x=<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<Gamma\>*<around|(|\<sigma\>/2|)>*\<pi\><rsup|-\<sigma\>/2>|n<rsup|\<sigma\>>>
  </equation>

  converges for <math|\<sigma\>\<gtr\>1>, the order of summation and
  integration can be changed to obtain

  <\equation>
    <label|eq:zeta_theta>\<zeta\><around|(|s|)>=<frac|\<pi\><rsup|s/2>|\<Gamma\>*<around|(|s/2|)>>*<big|int><rsub|0><rsup|\<infty\>>\<vartheta\><around|(|x|)>*x<rsup|s/2-1>*d*x.
  </equation>

  In view of equation<nbsp><eqref|eq:theta_transform_alt>,
  equation<nbsp><eqref|eq:zeta_theta> may be written as

  <\align>
    <tformat|<table|<row|<cell|\<pi\><rsup|-s/2>*\<Gamma\>*<around|(|s/2|)>*\<zeta\><around|(|s|)>>|<cell|=<big|int><rsub|0><rsup|1>x<rsup|s/2-1>*\<vartheta\><around|(|x|)>*d*x+<big|int><rsub|1><rsup|\<infty\>>x<rsup|s/2-1>*\<vartheta\><around|(|x|)>*d*x<eq-number><label|eq:zeta_functional>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|1>x<rsup|s/2-1>*<around*|[|x<rsup|-1/2>*\<vartheta\><around*|(|<frac|1|x>|)>+<frac|1|2>*x<rsup|-1/2>-<frac|1|2>|]>*d*x+<big|int><rsub|1><rsup|\<infty\>>x<rsup|s/2-1>*\<vartheta\><around|(|x|)>*d*x>>|<row|<cell|>|<cell|=<frac|1|s-1>-<frac|1|s>+<big|int><rsub|0><rsup|1>x<rsup|s/2-3/2>*\<vartheta\>*<around|(|1/x|)>*d*x+<big|int><rsub|1><rsup|\<infty\>>x<rsup|s/2-1>*\<vartheta\><around|(|x|)>*d*x>>|<row|<cell|>|<cell|=<frac|1|s*<around|(|s-1|)>>+<big|int><rsub|1><rsup|\<infty\>><around*|(|x<rsup|-s/2-1/2>+x<rsup|s/2-1>|)>*\<vartheta\><around|(|x|)>*d*x.>>>>
  </align>

  Note first that the last expression in equation<nbsp><eqref|eq:zeta_functional>
  remains invariant if <math|s> is replaced by <math|1-s>. Secondly, the last
  integral in equation<nbsp><eqref|eq:zeta_functional> converges uniformly
  (since <math|x\<geq\>1> in the integrand) in any strip

  <\equation>
    <label|eq:strip>-\<infty\>\<less\>a\<leq\>\<sigma\>=<text|Re
    >s\<leq\>b\<less\>+\<infty\>.
  </equation>

  Consequently the last integral in equation<nbsp><eqref|eq:zeta_functional>
  represents an entire function of <math|s>. Therefore

  <\equation>
    <label|eq:entire_part>\<pi\><rsup|-s/2>*\<Gamma\>*<around|(|s/2|)>*\<zeta\><around|(|s|)>-<frac|1|s*<around|(|s-1|)>>
  </equation>

  is an entire function of <math|s>. Since
  <math|\<pi\><rsup|s/2>/\<Gamma\>*<around|(|s/2|)>> is an entire function
  (because <math|\<Gamma\><around|(|s|)>> has no zeros),

  <\equation>
    <label|eq:zeta_entire>\<zeta\><around|(|s|)>-<frac|1|s*<around|(|s-1|)>>*<frac|\<pi\><rsup|s/2>|2*\<Gamma\>*<around|(|s/2|)>>
  </equation>

  is also an entire function. Further, since
  <math|s*\<Gamma\>*<around|(|s/2|)>=2*\<Gamma\>*<around|(|s/2+1|)>>, it
  follows that

  <\equation>
    <label|eq:zeta_pole>\<zeta\><around|(|s|)>-<frac|1|s-1>*<frac|\<pi\><rsup|s/2>|2*\<Gamma\>*<around|(|s/2+1|)>>
  </equation>

  is an entire function. Since <math|<sqrt|\<pi\>>/<around|(|2*\<Gamma\>*<around|(|3/2|)>|)>=1>,
  <math|\<zeta\><around|(|s|)>-1/<around|(|s-1|)>> is an entire function,
  thus <math|\<zeta\><around|(|s|)>> is regular in <math|\<bbb-C\>> except
  for a simple pole at <math|s=1> with residue 1.

  This discussion shows that equation<nbsp><eqref|eq:zeta_functional>
  provides analytic continuation of <math|\<zeta\><around|(|s|)>> to
  <math|\<bbb-C\>>, as well as the functional
  equation<nbsp><eqref|eq:func_eq>.

  <\corollary>
    <label|cor:xi_function>If

    <\equation>
      <label|eq:eta_xi_def>\<eta\><around|(|s|)>=\<pi\><rsup|-s/2>*\<Gamma\>*<around|(|s/2|)>*\<zeta\><around|(|s|)>,<space|1em>\<xi\><around|(|s|)>=<frac|1|2>*s*<around|(|s-1|)>*\<eta\><around|(|s|)>
    </equation>

    are defined, then <math|\<xi\><around|(|s|)>> is an entire function of
    <math|s> satisfying the functional equation
    <math|\<xi\><around|(|s|)>=\<xi\>*<around|(|1-s|)>>. It is real for
    <math|t=0> and <math|\<sigma\>=1/2> and
    <math|\<xi\><around|(|0|)>=\<xi\><around|(|1|)>=1/2>.
  </corollary>

  <section|Properties of Hardy's function><label|sec:hardy>

  Continuing with the discussion of <math|Z<around|(|t|)>>. Recall that the
  zeta, sine and the gamma-function take conjugate values at conjugate
  points. Hence it follows from equations<nbsp><eqref|eq:chi_alt>
  and<nbsp><eqref|eq:chi_inverse> that

  <\equation>
    <label|eq:chi_real>\<chi\>*<around*|(|<frac|1|2>+i*t|)>=\<chi\>*<around*|(|<frac|1|2>-i*t|)>=\<chi\><rsup|-1>*<around*|(|<frac|1|2>+i*t|)>,
  </equation>

  so that equation<nbsp><eqref|eq:hardy_def> gives
  <math|Z<around|(|t|)>\<in\>\<bbb-R\>> when <math|t\<in\>\<bbb-R\>>, and
  <math|<around|\||Z<around|(|t|)>|\|>=<around|\||\<zeta\>*<around|(|<frac|1|2>+i*t|)>|\|>>.
  Thus the zeros of <math|\<zeta\><around|(|s|)>> on the "critical line" Re
  <math|s=1/2> are in one-to-one correspondence with the real zeros of
  <math|Z<around|(|t|)>>. This property makes <math|Z<around|(|t|)>> an
  invaluable tool in the study of the zeros of the zeta-function on the
  critical line. If equations<nbsp><eqref|eq:func_eq>
  and<nbsp><eqref|eq:func_eq_alt> are used, then

  <\equation>
    <label|eq:chi_phase><around*|\||\<chi\>*<around*|(|<frac|1|2>+i*t|)>|\|><rsup|-1/2>=\<pi\><rsup|-i*t/2>*<frac|<around*|\||\<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>|\|>|\<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>>\<assign\>e<rsup|i*\<theta\><around|(|t|)>>,
  </equation>

  say, where <math|\<theta\><around|(|t|)>> is a smooth function for which

  <\equation>
    <label|eq:theta_def_alt>\<theta\><around|(|t|)>=-<frac|1|2*i>*log
    \<chi\>*<around*|(|<frac|1|2>+i*t|)>,<space|1em>\<theta\><rprime|'><around|(|t|)>=-<frac|1|2>*<frac|\<chi\><rprime|'>*<around*|(|<frac|1|2>+i*t|)>|\<chi\>*<around*|(|<frac|1|2>+i*t|)>>.
  </equation>

  Note that also

  <\equation>
    <label|eq:theta_imag>\<theta\><around|(|t|)>=<text|Im><around*|[|log
    \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>|]>-<frac|t|2>*log
    \<pi\>\<in\>\<bbb-R\>
  </equation>

  if <math|t\<in\>\<bbb-R\>>, thus <math|\<theta\><around|(|0|)>=0>. The
  function <math|\<theta\><around|(|t|)>> is odd, since in view of
  <math|\<chi\><around|(|s|)>*\<chi\>*<around|(|1-s|)>=1>,

  <\equation>
    <label|eq:theta_odd>\<theta\>*<around|(|-t|)>=-<frac|1|2*i>*log
    \<chi\>*<around*|(|<frac|1|2>-i*t|)>=-<frac|1|2*i>*log
    <frac|1|\<chi\>*<around*|(|<frac|1|2>+i*t|)>>=<frac|1|2*i>*log
    \<chi\>*<around*|(|<frac|1|2>+i*t|)>=-\<theta\><around|(|t|)>.
  </equation>

  It is also monotonic increasing for <math|t\<geq\>7>, which follows from
  formulas<nbsp><eqref|eq:theta_explicit>\U<eqref|eq:r_def> below.
  <math|Z<around|(|t|)>> may be written alternatively as

  <\equation>
    <label|eq:hardy_alt>Z<around|(|t|)>=e<rsup|i*\<theta\><around|(|t|)>>*\<zeta\>*<around*|(|<frac|1|2>+i*t|)>,<space|1em>e<rsup|i*\<theta\><around|(|t|)>>\<assign\>\<pi\><rsup|-i*t/2>*<frac|\<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>|<around*|\||\<Gamma\>*<around*|(|<frac|1|4>+<frac|i*t|2>|)>|\|>>*<space|1em><around|(|\<theta\><around|(|t|)>\<in\>\<bbb-R\>|)>.
  </equation>

  It is also useful to note that <math|Z<around|(|t|)>> is an even function
  of <math|t>, because

  <\align>
    <tformat|<table|<row|<cell|Z*<around|(|-t|)>>|<cell|=\<zeta\>*<around*|(|<frac|1|2>-i*t|)>*<around*|\||\<chi\>*<around*|(|<frac|1|2>-i*t|)>|\|><rsup|-1/2><eq-number><label|eq:hardy_even>>>|<row|<cell|>|<cell|=\<zeta\>*<around*|(|<frac|1|2>+i*t|)>*<around*|\||\<chi\>*<around*|(|<frac|1|2>-i*t|)>|\|><rsup|1/2>=\<zeta\>*<around*|(|<frac|1|2>+i*t|)>*<around*|\||\<chi\>*<around*|(|<frac|1|2>+i*t|)>|\|><rsup|-1/2>=Z<around|(|t|)>.>>>>
  </align>

  The explicit representation

  <\equation>
    <label|eq:theta_explicit>\<theta\><around|(|t|)>=<frac|t|2>*log
    <frac|t|2*\<pi\>>-<frac|t|2>-<frac|\<pi\>|8>+R<around|(|t|)>
  </equation>

  holds. Here (see Lemma 5.1 for a proof; here <math|R<around|(|t|)>> is not
  to be confused with the error term in the Dirichlet divisor problem)

  <\equation>
    <label|eq:r_def>R<around|(|t|)>\<assign\><frac|t|4>*log
    <around*|(|1+<frac|1|4*t<rsup|2>>|)>+<frac|1|4>*arctan
    <frac|1|2*t>+<frac|t|2>*<big|int><rsub|0><rsup|\<infty\>><frac|\<psi\><around|(|u|)>|<around|(|u+<frac|1|4>|)><rsup|2>+<around|(|<frac|t|2>|)><rsup|2>>*d*u
  </equation>

  with

  <\equation>
    <label|eq:psi_def>\<psi\><around|(|x|)>=x-<around|[|x|]>-<frac|1|2>=-<big|sum><rsub|n=1><rsup|\<infty\>><frac|sin
    <around|(|2*n*\<pi\>*x|)>|n*\<pi\>>*<space|1em><around|(|x\<nin\>\<bbb-Z\>|)>.
  </equation>

  The representation<nbsp><eqref|eq:theta_explicit>\U<eqref|eq:r_def> follows
  from Stirling's formula (see equation<nbsp><eqref|eq:stirling>) for the
  gamma-function in the form

  <\equation>
    <label|eq:stirling_log>log \<Gamma\><around|(|s|)>=<around|(|s-1/2|)>*log
    s-s+log <sqrt|2*\<pi\>>-<big|int><rsub|0><rsup|\<infty\>><frac|\<psi\><around|(|u|)>|u+s>*d*u,
  </equation>

  which in turn is a consequence of the product formula

  <\equation>
    <label|eq:gamma_product><frac|1|\<Gamma\><around|(|s|)>>=s*exp
    <around|(|\<gamma\>*s|)>*<big|prod><rsub|n=1><rsup|\<infty\>><around*|(|1+<frac|s|n>|)>*e<rsup|-s/n>.
  </equation>

  Note that equation<nbsp><eqref|eq:gamma_product> valid for
  <math|s\<in\>\<bbb-C\>>, and can serve as a definition of
  <math|\<Gamma\><around|(|s|)>> equivalent to
  equation<nbsp><eqref|eq:gamma_func>.

  The expression<nbsp><eqref|eq:theta_explicit> is very useful, since it
  allows one to evaluate explicitly all the derivatives of
  <math|\<theta\><around|(|t|)>>. For <math|t\<to\>\<infty\>> it is seen that
  <math|R<around|(|t|)>> admits an asymptotic expansion in terms of negative
  powers of <math|t>, and from equation<nbsp><eqref|eq:theta_imag> and
  Stirling's formula it is found that (<math|B<rsub|k>> is the <math|k>th
  Bernoulli number)

  <\equation>
    <label|eq:r_asymptotic>R<around|(|t|)>\<sim\><big|sum><rsub|n=1><rsup|\<infty\>><frac|<around|(|2<rsup|2*n>-1|)><around|\||B<rsub|2*n>|\|>|2<rsup|2*n>*<around|(|2*n-1|)>*2*n*t<rsup|2*n-1>>.
  </equation>

  The meaning of <math|\<sim\>> in equation<nbsp><eqref|eq:r_asymptotic> is
  that, for an arbitrary integer <math|N\<geq\>1>, <math|R<around|(|t|)>>
  equals the sum of the first <math|N> terms of the series in
  equation<nbsp><eqref|eq:r_asymptotic>, plus the error term, which is
  <math|O<rsub|N><around|(|t<rsup|-2*N-1>|)>>. In general there will be, for
  <math|k\<geq\>0> and suitable constants <math|c<rsub|k,n>>,

  <\equation>
    <label|eq:r_derivatives>R<rsup|<around|(|k|)>><around|(|t|)>\<sim\><big|sum><rsub|n=1><rsup|\<infty\>>c<rsub|k,n>*t<rsup|1-2*n-k>.
  </equation>

  Thus equations<nbsp><eqref|eq:theta_explicit>
  and<nbsp><eqref|eq:r_asymptotic> give

  <\equation>
    <label|eq:theta_asymptotic>\<theta\><around|(|t|)>\<sim\><frac|t|2>*log
    <frac|t|2*\<pi\>>-<frac|t|2>-<frac|\<pi\>|8>+<big|sum><rsub|n=1><rsup|\<infty\>><frac|<around|(|2<rsup|2*n-1>-1|)><around|\||B<rsub|2*n>|\|>|2<rsup|2*n>*<around|(|2*n-1|)>*2*n*t<rsup|2*n-1>>,
  </equation>

  and there are also asymptotic expansions for the derivatives of
  <math|\<theta\><around|(|t|)>>. In particular, the approximations

  <\align>
    <tformat|<table|<row|<cell|\<theta\><around|(|t|)>>|<cell|=<frac|t|2>*log
    <frac|t|2*\<pi\>>-<frac|t|2>-<frac|\<pi\>|8>+<frac|1|48*t>+<frac|7|5760*t<rsup|3>>+O<around*|(|<frac|1|t<rsup|5>>|)>,<eq-number><label|eq:theta_approx>>>|<row|<cell|\<theta\><rprime|'><around|(|t|)>>|<cell|=<frac|1|2>*log
    <frac|t|2*\<pi\>>+O<around*|(|<frac|1|t<rsup|2>>|)>,>>|<row|<cell|\<theta\><rprime|''><around|(|t|)>>|<cell|=<frac|1|2*t>+O<around*|(|<frac|1|t<rsup|3>>|)>>>>>
  </align>

  hold, which are sufficiently sharp for many applications.

  <section|The distribution of zeta-zeros><label|sec:zeros>

  In what concerns the distribution of zeros of
  <math|\<zeta\><around|(|s|)>>, it is known that
  <math|\<zeta\><around|(|s|)>> has no zeros in the region

  <\equation>
    <label|eq:zero_free>\<sigma\>\<geq\>1-C<around|(|log
    t|)><rsup|-2/3><around|(|log log t|)><rsup|-1/3><space|1em><around|(|C\<gtr\>0,t\<geq\>t<rsub|0>\<gtr\>0|)>.
  </equation>

  This result, the strongest so-called zero-free region for
  <math|\<zeta\><around|(|s|)>> even today, was obtained by an application of
  I. M. Vinogradov's method of exponential sums. In a modern form, the
  crucial bound which implies equation<nbsp><eqref|eq:zero_free> states (see,
  e.g., <cite|Iv1>, chapter 6) that

  <\equation>
    <label|eq:vinogradov><big|sum><rsub|N\<less\>n\<leq\>N<rsub|1>\<leq\>2*N>n<rsup|i*t>\<ll\>N*exp
    <around*|(|-C*<frac|log<rsup|3> N|log<rsup|2>
    t>|)>*<space|1em><around|(|C\<gtr\>0|)>
  </equation>

  for <math|N<rsub|0>\<leq\>N\<leq\><frac|1|2>*t>, <math|t\<geq\>t<rsub|0>>.
  From equation<nbsp><eqref|eq:func_eq> it follows that
  <math|\<zeta\>*<around|(|-2*n|)>=0> for <math|n\<in\>\<bbb-N\>>. These
  zeros are the only real zeros of <math|\<zeta\><around|(|s|)>>, and are
  called the trivial zeros of <math|\<zeta\><around|(|s|)>>. In 1859, B.
  Riemann <cite|Rie> calculated a few complex zeros of
  <math|\<zeta\><around|(|s|)>> and found that they lie on the line Re
  <math|s=<frac|1|2>>, which is called the critical line in the theory of
  <math|\<zeta\><around|(|s|)>>. The first ten pairs of complex zeros
  (arranged in size according to their absolute value) are (see, e.g., C. B.
  Haselgrove <cite|Has>)

  <\align>
    <tformat|<table|<row|<cell|>|<cell|<frac|1|2>\<pm\>i*14.134725*\<ldots\>,<space|1em><frac|1|2>\<pm\>i*21.022039*\<ldots\>,<space|1em><frac|1|2>\<pm\>i*25.010857*\<ldots\>,<eq-number><label|eq:first_zeros>>>|<row|<cell|>|<cell|<frac|1|2>\<pm\>i*30.424876*\<ldots\>,<space|1em><frac|1|2>\<pm\>i*32.935061*\<ldots\>,<space|1em><frac|1|2>\<pm\>i*37.586178*\<ldots\>,>>|<row|<cell|>|<cell|<frac|1|2>\<pm\>i*40.918719*\<ldots\>,<space|1em><frac|1|2>\<pm\>i*43.327073*\<ldots\>,<space|1em><frac|1|2>\<pm\>i*48.005150*\<ldots\>,>>|<row|<cell|>|<cell|<frac|1|2>\<pm\>i*49.773832*\<ldots\>.>>>>
  </align>

  The number of complex zeros <math|\<rho\>=\<beta\>+i*\<gamma\>> of
  <math|\<zeta\><around|(|s|)>> with <math|0\<less\>\<gamma\>\<leq\>T>
  (multiplicities included) is denoted by <math|N<around|(|T|)>>. The
  asymptotic formula for <math|N<around|(|T|)>> is the famous Riemann-von
  Mangoldt formula. It was enunciated by B. Riemann <cite|Rie> in 1859, but
  proved by H. von Mangoldt <cite|Man> in 1895. It is stated here as follows.

  <\theorem>
    <label|thm:riemann_mangoldt>Let

    <\equation>
      <label|eq:s_def>S<around|(|T|)>\<assign\><frac|1|\<pi\>>*arg
      \<zeta\>*<around*|(|<frac|1|2>+i*T|)>.
    </equation>

    Then

    <\equation>
      <label|eq:n_formula>N<around|(|T|)>=<frac|T|2*\<pi\>>*log
      <frac|T|2*\<pi\>>-<frac|T|2*\<pi\>>+<frac|7|8>+S<around|(|T|)>+O<around*|(|<frac|1|T>|)>,
    </equation>

    where the <math|O>-term is a continuous function of <math|T>, and

    <\equation>
      <label|eq:s_bound>S<around|(|T|)>=O<around|(|log T|)>.
    </equation>

    Here <math|arg \<zeta\>*<around|(|<frac|1|2>+i*T|)>> is evaluated by
    continuous variation starting from <math|arg \<zeta\><around|(|2|)>=0>
    and proceeding along straight lines, first up to <math|2+i*T> and then to
    <math|1/2+i*T>, assuming that <math|T> is not an ordinate of a zeta zero.
    If <math|T> is an ordinate of a zero, then
    <math|S<around|(|T|)>=S*<around|(|T+0|)>> is set.
  </theorem>

  <\remark>
    <label|rem:s_rh>On the RH (the Riemann hypothesis, that all complex zeros
    of <math|\<zeta\><around|(|s|)>> have real parts equal to <math|1/2>) one
    can slightly improve equation<nbsp><eqref|eq:s_bound> and obtain that
    (see <cite|Tit3>)

    <\equation>
      <label|eq:s_rh_bound>S<around|(|T|)>=O<around*|(|<frac|log T|log log
      T>|)>.
    </equation>
  </remark>

  Let <math|D> be the rectangle with vertices <math|2\<pm\>i*T>,
  <math|-1\<pm\>i*T>, where <math|T\<gtr\>3> is not an ordinate of a zero.
  The function <math|\<xi\><around|(|s|)>>, defined by
  equation<nbsp><eqref|eq:eta_xi_def>, has <math|2*N<around|(|T|)>> zeros in
  the interior of <math|D>, and none on the boundary. Therefore

  <\equation>
    <label|eq:contour_integral>N<around|(|T|)>=<frac|1|4*\<pi\>><text|Im><around*|[|<big|oint><rsub|D><frac|\<xi\><rprime|'><around|(|s|)>|\<xi\><around|(|s|)>>*d*s|]>.
  </equation>

  Logarithmic differentiation of equation<nbsp><eqref|eq:eta_xi_def> gives

  <\equation>
    <label|eq:xi_log_deriv><frac|\<xi\><rprime|'><around|(|s|)>|\<xi\><around|(|s|)>>=<frac|1|s>+<frac|1|s-1>+<frac|\<eta\><rprime|'><around|(|s|)>|\<eta\><around|(|s|)>>,
  </equation>

  where <math|\<eta\><around|(|s|)>> is also given by
  equation<nbsp><eqref|eq:eta_xi_def>. Observe first that

  <\equation>
    <label|eq:pole_contribution><text|Im><around*|[|<big|oint><rsub|D><around*|(|<frac|1|s>+<frac|1|s-1>|)>*d*s|]>=4*\<pi\>.
  </equation>

  Next, note that <math|\<eta\><around|(|s|)>=\<eta\>*<around|(|1-s|)>> and
  <math|\<eta\>*<around|(|\<sigma\>\<pm\>i*t|)>> are conjugates, so that

  <\equation>
    <label|eq:eta_symmetry><big|oint><rsub|D><frac|\<eta\><rprime|'><around|(|s|)>|\<eta\><around|(|s|)>>*d*s=4<text|Im><around*|[|<big|int><rsub|L><frac|\<eta\><rprime|'><around|(|s|)>|\<eta\><around|(|s|)>>*d*s|]>,
  </equation>

  where <math|L> consists of the segments <math|<around|[|2,2+i*T|]>> and
  <math|<around|[|2+i*T,1/2+i*T|]>>. Therefore

  <\align>
    <tformat|<table|<row|<cell|<text|Im><around*|[|<big|int><rsub|L><frac|\<eta\><rprime|'><around|(|s|)>|\<eta\><around|(|s|)>>*d*s|]>>|<cell|=<text|Im><around*|[|<big|int><rsub|L><around*|(|-<frac|1|2>*log
    \<pi\>+<frac|1|2>*<frac|\<Gamma\><rprime|'>*<around|(|s/2|)>|\<Gamma\>*<around|(|s/2|)>>+<frac|\<zeta\><rprime|'><around|(|s|)>|\<zeta\><around|(|s|)>>|)>*d*s|]><eq-number><label|eq:eta_integral>>>|<row|<cell|>|<cell|=-<frac|1|2><around|(|log
    \<pi\>|)>*T+<text|Im><around*|[|<big|int><rsub|L><frac|\<Gamma\><rprime|'>*<around|(|s/2|)>|2*\<Gamma\>*<around|(|s/2|)>>*d*s+<big|int><rsub|L><frac|\<zeta\><rprime|'><around|(|s|)>|\<zeta\><around|(|s|)>>*d*s|]>.>>>>
  </align>

  Note that

  <\equation>
    <label|eq:gamma_integral_eval><text|Im><around*|[|<big|int><rsub|L><frac|\<Gamma\><rprime|'>*<around|(|s/2|)>|2*\<Gamma\>*<around|(|s/2|)>>*d*s|]>=<text|Im>log
    \<Gamma\>*<around*|(|<frac|1|4>+<frac|i*T|2>|)>,
  </equation>

  and using Stirling's formula in the form<nbsp><eqref|eq:stirling> there is

  <\equation>
    <label|eq:stirling_eval><text|Im><around*|[|<big|int><rsub|L><frac|\<Gamma\><rprime|'>*<around|(|s/2|)>|2*\<Gamma\>*<around|(|s/2|)>>*d*s|]>=<frac|T|2>*log
    <frac|T|2>-<frac|T|2>-<frac|\<pi\>|8>+O<around*|(|<frac|1|T>|)>,
  </equation>

  and to prove Theorem<nbsp><reference|thm:riemann_mangoldt> it remains to
  show that

  <\equation>
    <label|eq:zeta_integral_bound><text|Im><around*|[|<big|int><rsub|2+i*T><rsup|1/2+i*T><frac|\<zeta\><rprime|'><around|(|s|)>|\<zeta\><around|(|s|)>>*d*s|]>=O<around|(|log
    T|)>,
  </equation>

  since the integral over the other segment of <math|L> is clearly bounded.
  To prove equation<nbsp><eqref|eq:zeta_integral_bound> some estimates
  involving <math|\<zeta\><rprime|'>/\<zeta\>> are needed. The expression

  <\equation>
    <label|eq:zeta_log_deriv><frac|\<zeta\><rprime|'><around|(|s|)>|\<zeta\><around|(|s|)>>=B-<frac|1|s-1>+<frac|1|2>*log
    \<pi\>-<frac|\<Gamma\><rprime|'>*<around|(|s/2+1|)>|2*\<Gamma\>*<around|(|s/2+1|)>>+<big|sum><rsub|\<rho\>><around*|(|<frac|1|s-\<rho\>>+<frac|1|\<rho\>>|)>
  </equation>

  is used. This formula, where <math|\<rho\>> denotes complex (non-trivial)
  zeros of <math|\<zeta\><around|(|s|)>>, and <math|B=log 2+<frac|1|2>*log
  \<pi\>-1-<frac|1|2>*\<gamma\>>, follows by logarithmic differentiation of
  the product formula

  <\equation>
    <label|eq:hadamard_product>f<around|(|s|)>=e<rsup|A+B*s>*<big|prod><rsub|n=1><rsup|\<infty\>><around|(|1-s/\<rho\><rsub|n>|)>*e<rsup|s/\<rho\><rsub|n>>
  </equation>

  for suitable constants <math|A>, <math|B> if <math|f<around|(|s|)>> is an
  integral function of order 1 with zeros
  <math|\<rho\><rsub|1>,\<rho\><rsub|2>,\<ldots\>>. Taking in
  equation<nbsp><eqref|eq:hadamard_product>
  <math|f<around|(|s|)>=\<xi\><around|(|s|)>>, which is an integral function
  of order 1, equation<nbsp><eqref|eq:zeta_log_deriv> is obtained.

  Now suppose that <math|t\<geq\>2>, <math|1\<leq\>\<sigma\>\<leq\>2>. The
  gamma-term in equation<nbsp><eqref|eq:zeta_log_deriv> is <math|\<ll\>log t>
  and consequently

  <\equation>
    <label|eq:zeta_real_part>-<text|Re ><frac|\<zeta\><rprime|'><around|(|s|)>|\<zeta\><around|(|s|)>>\<less\>C*log
    t-<big|sum><rsub|\<rho\>><text|Re ><around*|(|<frac|1|s-\<rho\>>+<frac|1|\<rho\>>|)>*<space|1em><around|(|1\<leq\>\<sigma\>\<leq\>2,t\<geq\>2|)>.
  </equation>

  In equation<nbsp><eqref|eq:zeta_real_part> take <math|s=2+i*T>. Since
  <math|<frac|\<zeta\><rprime|'>|\<zeta\>>*<around|(|2+i*T|)>\<ll\>1>,

  <\equation>
    <label|eq:zero_sum_bound><big|sum><rsub|\<rho\>><text|Re
    ><around*|(|<frac|1|s-\<rho\>>+<frac|1|\<rho\>>|)>\<less\>C*log T
  </equation>

  is obtained.

  If <math|\<rho\>=\<beta\>+i*\<gamma\>> is a non-trivial zero of
  <math|\<zeta\><around|(|s|)>>, then

  <\equation>
    <label|eq:rho_real_part><text|Re ><frac|1|\<rho\>>=<frac|\<beta\>|\<beta\><rsup|2>+\<gamma\><rsup|2>>\<gtr\>0
  </equation>

  and

  <\equation>
    <label|eq:s_rho_real_part><text|Re ><frac|1|s-\<rho\>>=<frac|2-\<beta\>|<around|(|2-\<beta\>|)><rsup|2>+<around|(|T-\<gamma\>|)><rsup|2>>\<geq\><frac|1|4+<around|(|T-\<gamma\>|)><rsup|2>>,
  </equation>

  hence equation<nbsp><eqref|eq:zero_sum_bound> gives

  <\equation>
    <label|eq:zero_density><big|sum><rsub|\<rho\>><frac|1|1+<around|(|T-\<gamma\>|)><rsup|2>>\<ll\>log
    T,
  </equation>

  where summation is over all non-trivial zeros <math|\<rho\>> of
  <math|\<zeta\><around|(|s|)>>. The bound<nbsp><eqref|eq:zero_density>
  immediately gives

  <\equation>
    <label|eq:zero_count>N*<around|(|T+1|)>-N<around|(|T|)>\<ll\><big|sum><rsub|\<rho\>><frac|1|1+<around|(|T-\<gamma\>|)><rsup|2>>\<ll\>log
    T,
  </equation>

  that is, each strip <math|T\<less\>t\<leq\>T+1> contains fewer than
  <math|C*log T> zeros of <math|\<zeta\><around|(|s|)>> for some absolute
  constant <math|C\<gtr\>0>. Again using equation<nbsp><eqref|eq:zeta_log_deriv>
  with <math|s=\<sigma\>+i*t>, <math|-1\<leq\>\<sigma\>\<leq\>2> and
  <math|2+i*t>, where <math|t\<gtr\>2> is not an ordinate of any
  <math|\<rho\>>, and subtracting,

  <\equation>
    <label|eq:zeta_difference><frac|\<zeta\><rprime|'><around|(|s|)>|\<zeta\><around|(|s|)>>=<big|sum><rsub|\<rho\>><around*|(|<frac|1|s-\<rho\>>-<frac|1|2+i*t-\<rho\>>|)>+O<around|(|log
    t|)>
  </equation>

  is obtained.

  In equation<nbsp><eqref|eq:zeta_difference> for the terms with
  <math|<around|\||\<gamma\>-t|\|>\<geq\>1> there is

  <\equation>
    <label|eq:term_estimate><around*|\||<around|(|s-\<rho\>|)><rsup|-1>-<around|(|2+i*t-\<rho\>|)><rsup|-1>|\|>=<frac|2-\<sigma\>|<around|\||<around|(|s-\<rho\>|)>*<around|(|2+i*t-\<rho\>|)>|\|>>\<leq\><frac|3|<around|\||\<gamma\>-t|\|><rsup|2>>
  </equation>

  if <math|-1\<leq\>\<sigma\>\<leq\>2>. Hence by
  equation<nbsp><eqref|eq:zeta_log_deriv> the portion of the sum in
  equation<nbsp><eqref|eq:zeta_difference> for which
  <math|<around|\||\<gamma\>-t|\|>\<geq\>1> is <math|\<ll\>log t>, and for
  <math|<around|\||\<gamma\>-t|\|>\<less\>1> there is
  <math|<around|\||2+i*t-\<rho\>|\|>\<geq\>1>, and the number of such
  <math|\<rho\>> is <math|\<ll\>log t> by
  equation<nbsp><eqref|eq:zero_count>. Thus

  <\equation>
    <label|eq:zeta_local><frac|\<zeta\><rprime|'><around|(|s|)>|\<zeta\><around|(|s|)>>=<big|sum><rsub|\<rho\>,<around|\||\<gamma\>-t|\|>\<less\>1><frac|1|s-\<rho\>>+O<around|(|log
    t|)>*<space|1em><around|(|-1\<leq\>\<sigma\>\<leq\>2|)>
  </equation>

  is obtained.

  Now the proof of equation<nbsp><eqref|eq:zeta_integral_bound> easily
  follows, since by equation<nbsp><eqref|eq:zeta_local> (here
  <math|\<Delta\>> denotes the variation of the argument)

  <\align>
    <tformat|<table|<row|<cell|<text|Im><around*|[|<big|int><rsub|2+i*T><rsup|1/2+i*T><frac|\<zeta\><rprime|'><around|(|s|)>|\<zeta\><around|(|s|)>>*d*s|]>>|<cell|=<text|Im><around*|[|<big|int><rsub|2+i*T><rsup|1/2+i*T><big|sum><rsub|\<rho\>,<around|\||\<gamma\>-t|\|>\<less\>1><frac|1|s-\<rho\>>*d*s|]>+O<around|(|log
    T|)><eq-number><label|eq:arg_variation>>>|<row|<cell|>|<cell|=<big|sum><rsub|\<rho\>,<around|\||\<gamma\>-t|\|>\<less\>1>\<Delta\>*arg
    <around|(|s-\<rho\>|)>+O<around|(|log T|)>=O<around|(|log T|)>,>>>>
  </align>

  since <math|<around|\||\<Delta\>*arg <around|(|s-\<rho\>|)>|\|>\<less\>\<pi\>>
  on <math|<around|[|1/2+i*T,2+i*T|]>> and
  equation<nbsp><eqref|eq:zero_count> holds. This completes the proof of
  Theorem<nbsp><reference|thm:riemann_mangoldt>. Note, however, that by
  following the preceding proof, in view of
  equation<nbsp><eqref|eq:gamma_integral_eval>, the following corollary is
  obtained.

  <\corollary>
    <label|cor:n_theta>

    <\equation>
      <label|eq:n_theta_relation>N<around|(|T|)>=<frac|1|\<pi\>>*\<theta\><around|(|T|)>+1+S<around|(|T|)>.
    </equation>
  </corollary>

  Formula<nbsp><eqref|eq:n_theta_relation> shows the important connection
  between the functions <math|N<around|(|T|)>>,
  <math|\<theta\><around|(|T|)>> and <math|S<around|(|T|)>>. Recall that
  <math|\<theta\><around|(|T|)>> is a very smooth function, so that the jumps
  of <math|S<around|(|T|)>> come at the zeros of
  <math|\<zeta\><around|(|s|)>>, which is of course also evident from its
  definition<nbsp><eqref|eq:s_def>. Since (see
  equation<nbsp><eqref|eq:theta_imag>) <math|\<theta\><around|(|t|)>> plays a
  fundamental role in the theory of <math|Z<around|(|t|)>>,
  Corollary<nbsp><reference|cor:n_theta> shows an intrinsic connection
  between <math|N<around|(|T|)>>, <math|S<around|(|T|)>> and
  <math|Z<around|(|T|)>>. This is also evident from the relation

  <\equation>
    <label|eq:log_zeta_relation>log \<zeta\>*<around*|(|<frac|1|2>+i*t|)>=log\|Z<around|(|t|)>\|+\<pi\>*i*S<around|(|t|)>.
  </equation>

  <\corollary>
    <label|cor:gamma_sums>The following hold:

    <\align>
      <tformat|<table|<row|<cell|<big|sum><rsub|<around|\||\<gamma\>|\|>\<leq\>T><frac|1|<around|\||\<gamma\>|\|>>>|<cell|\<ll\>log<rsup|2>
      T,<eq-number><label|eq:gamma_bounds>>>|<row|<cell|<big|sum><rsub|<around|\||\<gamma\>|\|>\<gtr\>T><frac|1|\<gamma\><rsup|2>>>|<cell|\<ll\><frac|log
      T|T>,>>|<row|<cell|\<gamma\><rsub|n>>|<cell|\<sim\><frac|2*\<pi\>*n|log
      n>*<space|1em><around|(|n\<to\>\<infty\>|)>.>>>>
    </align>

    In equation<nbsp><eqref|eq:gamma_bounds>
    <math|0\<less\>\<gamma\><rsub|1>\<leq\>\<gamma\><rsub|2>\<leq\>\<cdots\>>
    denote the consecutive ordinates of non-trivial zeros
    <math|\<rho\>=\<beta\>+i*\<gamma\>> of <math|\<zeta\><around|(|s|)>>.
    They should not be confused with the Stieltjes constants, defined before
    equation<nbsp><eqref|eq:gamma_func> as the Laurent coefficients (Pierre
    Alphonse Laurent, July 18, 1813-September 2, 1854, French mathematician)
    of <math|\<zeta\><around|(|s|)>> at <math|s=1>. Both bounds in
    equation<nbsp><eqref|eq:gamma_bounds> follow by partial summation from
    equations<nbsp><eqref|eq:s_def> and<nbsp><eqref|eq:n_formula>, as well as
    the asymptotic formula for <math|\<gamma\><rsub|n>> in view of the
    obvious inequality <math|N*<around|(|\<gamma\><rsub|n>-1|)>\<less\>n\<leq\>N*<around|(|\<gamma\><rsub|n>+1|)>>.
  </corollary>

  Finally a few words about the Riemann hypothesis (RH for short), still
  unsettled at the time of the writing of this text. In his celebrated work
  <cite|Rie> B. Riemann conjectured that all complex zeros of the
  zeta-function lie on the critical line. This statement is called the
  Riemann hypothesis, and is probably the most famous open problem in
  Mathematics.

  The RH implies (see, e.g., <cite|Iv1>, <cite|Tit3>) that

  <\equation>
    <label|eq:rh_bound>\<zeta\>*<around*|(|<frac|1|2>+i*t|)>\<ll\>exp
    <around*|(|C*<frac|log t|log log t>|)>*<space|1em><around|(|C\<gtr\>0|)>.
  </equation>

  A slightly weaker bound than equation<nbsp><eqref|eq:rh_bound>, which in
  practice can often replace the RH, is the bound

  <\equation>
    <label|eq:lindelof>\<zeta\>*<around*|(|<frac|1|2>+i*t|)>\<ll\><rsub|\<varepsilon\>><around|(|<around|\||t|\|>+1|)><rsup|\<varepsilon\>>,
  </equation>

  which is known as the Lindelöf hypothesis (LH for short). It is also
  unproved, and it is not known whether equation<nbsp><eqref|eq:lindelof>
  implies the RH, although this is not very likely. Namely the LH is
  equivalent (see, <cite|Tit3>, theorem 13.5), to the statement that, for
  every <math|\<sigma\>\<gtr\>1/2>,

  <\equation>
    <label|eq:lh_equivalent>N*<around|(|\<sigma\>,T+1|)>-N*<around|(|\<sigma\>,T|)>=o<around|(|log
    T|)>*<space|1em><around|(|T\<to\>\<infty\>|)>,
  </equation>

  where <math|N*<around|(|\<sigma\>,T|)>> denotes the number of complex zeros
  <math|\<rho\>=\<beta\>+i*\<gamma\>> for which
  <math|\<beta\>\<geq\>\<sigma\>>, <math|<around|\||\<gamma\>|\|>\<leq\>T>.
  For the best unconditional bounds for <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>>
  and related topics, see the survey paper of M. N. Huxley and the present
  author <cite|HuIv>.

  Hardy's original application of <math|Z<around|(|t|)>> was to show that
  <math|\<zeta\><around|(|s|)>> has infinitely many zeros on the critical
  line Re <math|s=1/2> (see, e.g., E. C. Titchmarsh <cite|Tit3>). This will
  be discussed in the next chapter. Later A. Selberg (see <cite|Sel> and
  <cite|Tit3>) obtained that a positive proportion of zeros of
  <math|\<zeta\><around|(|s|)>> lies on the critical line. This can be stated
  as

  <\equation>
    <label|eq:selberg>N<rsub|0><around|(|T|)>\<geq\>C*N<around|(|T|)><space|1em><around|(|C\<gtr\>0,T\<geq\>T<rsub|0>|)>,
  </equation>

  where <math|N<rsub|0><around|(|T|)>> denotes the number of zeros of
  <math|Z<around|(|t|)>> in <math|<around|(|0,T|]>>, or equivalently the
  number of complex zeros of <math|\<zeta\><around|(|s|)>> on the critical
  line Re <math|s=1/2> whose imaginary parts lie in <math|<around|(|0,T|]>>.
  Selberg's bound<nbsp><eqref|eq:selberg> improves on
  <math|N<rsub|0><around|(|T|)>\<geq\>C*T>, which is a result of G. H. Hardy
  and J. E. Littlewood <cite|HaLi2> of 1921. Selberg's bound is one of the
  most important results of analytic number theory of all time, as it reveals
  the true order of magnitude of <math|N<rsub|0><around|(|T|)>>. Later work
  by various scholars led to explicit values of <math|C> in
  equation<nbsp><eqref|eq:selberg>.

  <section*|Notes>

  It was actually the great Swiss mathematician Leonhard Euler (April 15,
  1707-September 18, 1783) who first used the zeta-function, albeit only for
  real values of the variable. Besides equation<nbsp><eqref|eq:zeta_def>,
  Euler discovered several other identities from zeta-function theory. His
  paper <cite|Eul> from 1768 contains the assertion

  <\equation>
    <label|eq:euler_identity><frac|1-2<rsup|n-1>+3<rsup|n-1>-4<rsup|n-1>+5<rsup|n-1>-\<cdots\>|1-2<rsup|-n>+3<rsup|-n>-4<rsup|-n>+5<rsup|-n>-\<cdots\>>=-1\<times\>2\<times\>3\<times\>\<cdots\>*<around|(|n-1|)>*<frac|<around|(|2<rsup|n-1>-1|)>|<around|(|2<rsup|n-1>-1|)>*\<pi\><rsup|n>>*cos
    <around*|(|<frac|\<pi\>*n|2>|)>,
  </equation>

  which he verified for <math|n=1> and <math|n=2*k>. E. Landau <cite|Lan>
  wrote Euler's identity as

  <\equation>
    <label|eq:landau_euler><frac|lim<rsub|x\<to\>1>
    <big|sum><rsub|n=1><rsup|\<infty\>><around|(|-1|)><rsup|n+1>*n<rsup|s-1>*x<rsup|n-1>|lim<rsub|x\<to\>1>
    <big|sum><rsub|n=1><rsup|\<infty\>><around|(|-1|)><rsup|n+1>*n<rsup|-s>*x<rsup|n-1>>=-\<Gamma\><around|(|s|)><frac|<around|(|2<rsup|s>-1|)>|<around|(|2<rsup|s-1>-1|)>*\<pi\><rsup|s>>*cos
    <around*|(|<frac|\<pi\>*s|2>|)>,
  </equation>

  proved its validity, and showed its equivalence with the functional
  equation<nbsp><eqref|eq:func_eq>.

  There are many ways to obtain the analytic continuation of
  <math|\<zeta\><around|(|s|)>> outside the region <math|\<sigma\>\<gtr\>1>.
  One simple way (see T. Estermann <cite|Est2>) is to write, for
  <math|\<sigma\>\<gtr\>1>,

  <\equation>
    <label|eq:estermann>\<zeta\><around|(|s|)>=<big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-s>=<big|sum><rsub|n=1><rsup|\<infty\>><around*|(|n<rsup|-s>-<big|int><rsub|n><rsup|n+1>u<rsup|-s>*d*u|)>+<frac|1|s-1>
  </equation>

  and to observe that

  <\equation>
    <label|eq:estermann_bound><around*|\||n<rsup|-s>-<big|int><rsub|n><rsup|n+1>u<rsup|-s>*d*u|\|>=<around*|\||s*<big|int><rsub|n><rsup|n+1><big|int><rsub|n><rsup|u>z<rsup|-s-1>*d*z*d*u|\|>\<leq\><around|\||s|\|>*n<rsup|-\<sigma\>-1>.
  </equation>

  Hence the second series above converges absolutely for
  <math|\<sigma\>\<gtr\>0>, and by the principle of analytic continuation

  <\equation>
    <label|eq:analytic_cont>\<zeta\><around|(|s|)>=<big|sum><rsub|n=1><rsup|\<infty\>><around*|(|n<rsup|-s>-<big|int><rsub|n><rsup|n+1>u<rsup|-s>*d*u|)>+<frac|1|s-1>*<space|1em><around|(|\<sigma\>\<gtr\>0|)>
  </equation>

  is obtained, showing incidentally that <math|\<zeta\><around|(|s|)>> is
  regular for <math|\<sigma\>\<gtr\>0>, except for a simple pole at
  <math|s=1> with residue equal to 1.

  Analytic continuation of <math|\<zeta\><around|(|s|)>> for
  <math|\<sigma\>\<gtr\>0> is also given by

  <\equation>
    <label|eq:dirichlet_eta>\<zeta\><around|(|s|)>=<around|(|1-2<rsup|1-s>|)><rsup|-1>*<big|sum><rsub|n=1><rsup|\<infty\>><around|(|-1|)><rsup|n>*n<rsup|-s>
  </equation>

  since the series in equation<nbsp><eqref|eq:dirichlet_eta> converges for
  <math|\<sigma\>\<gtr\>0>.

  For <math|x\<gtr\>1> one has

  <\align>
    <tformat|<table|<row|<cell|<big|sum><rsub|n\<leq\>x>n<rsup|-s>>|<cell|=<big|int><rsub|1-0><rsup|x>u<rsup|-s>*d<around|[|u|]>=<around|[|x|]>*x<rsup|-s>+s*<big|int><rsub|1><rsup|x><around|[|u|]>*u<rsup|-s-1>*d*u<eq-number><label|eq:partial_sum>>>|<row|<cell|>|<cell|=O<around|(|x<rsup|1-\<sigma\>>|)>+s*<big|int><rsub|1><rsup|x><around|(|<around|[|u|]>-u|)>*u<rsup|-s-1>*d*u+<frac|s|s-1>-s*<frac|x<rsup|1-s>|s-1>.>>>>
  </align>

  If <math|\<sigma\>\<gtr\>1> and <math|x\<to\>\<infty\>>, it follows that

  <\equation>
    <label|eq:integral_form>\<zeta\><around|(|s|)>=<frac|s|s-1>+s*<big|int><rsub|1><rsup|\<infty\>><around|(|<around|[|u|]>-u|)>*u<rsup|-s-1>*d*u.
  </equation>

  By using the customary notation <math|\<psi\><around|(|x|)>=x-<around|[|x|]>-1/2>,
  this relation can be written as

  <\equation>
    <label|eq:psi_integral>\<zeta\><around|(|s|)>=<frac|1|s-1>+<frac|1|2>-s*<big|int><rsub|1><rsup|\<infty\>>\<psi\><around|(|u|)>*u<rsup|-s-1>*d*u.
  </equation>

  Since <math|<big|int><rsub|y><rsup|y+1>\<psi\><around|(|u|)>*d*u=0> for any
  real <math|y>, integration by parts shows that
  equation<nbsp><eqref|eq:psi_integral> provides the analytic continuation of
  <math|\<zeta\><around|(|s|)>> to the half-plane <math|\<sigma\>\<gtr\>-1>,
  and in particular it shows that <math|\<zeta\><around|(|0|)>=-1/2>. It also
  follows that the Laurent expansion of <math|\<zeta\><around|(|s|)>> at its
  pole <math|s=1> has the form

  <\equation>
    <label|eq:laurent_stieltjes>\<zeta\><around|(|s|)>=<frac|1|s-1>+\<gamma\><rsub|0>+\<gamma\><rsub|1>*<around|(|s-1|)>+\<gamma\><rsub|2>*<around|(|s-1|)><rsup|2>+\<cdots\>,
  </equation>

  where the so-called Stieltjes constants <math|\<gamma\><rsub|k>> are given
  by

  <\align>
    <tformat|<table|<row|<cell|\<gamma\><rsub|k>>|<cell|=<frac|<around|(|-1|)><rsup|k+1>|k!>*<big|int><rsub|1-0><rsup|\<infty\>>x<rsup|-1><around|(|log
    x|)><rsup|k>*d*\<psi\><around|(|x|)><eq-number><label|eq:stieltjes_integral>>>|<row|<cell|>|<cell|=<frac|<around|(|-1|)><rsup|k>|k!>*lim<rsub|N\<to\>\<infty\>><around*|(|<big|sum><rsub|m\<leq\>N><frac|log<rsup|k>
    m|m>-<frac|log<rsup|k+1> N|k+1>|)>,>>>>
  </align>

  as already mentioned in the text. The formula<nbsp><eqref|eq:stieltjes_integral>
  was proved first by T. J. Stieltjes <cite|Sti> in 1905 (Thomas Joannes
  Stieltjes, December 29, 1856-December 31, 1894, Dutch mathematician). On
  successive integrations by parts of the integral in
  equation<nbsp><eqref|eq:psi_integral> one can obtain the analytic
  continuation of <math|\<zeta\><around|(|s|)>> to <math|\<bbb-C\>>.

  A detailed discussion of the <math|\<gamma\><rsub|k>>s is given by I. M.
  Israilov <cite|Isr1>, <cite|Isr2>. The first three values, to five decimal
  places, are

  <\align>
    <tformat|<table|<row|<cell|\<gamma\><rsub|1>>|<cell|=0.07281*\<ldots\>,<eq-number><label|eq:stieltjes_values>>>|<row|<cell|\<gamma\><rsub|2>>|<cell|=-0.00485*\<ldots\>,>>|<row|<cell|\<gamma\><rsub|3>>|<cell|=-0.00034*\<ldots\>.>>>>
  </align>

  Not much is known about the properties of the Stieltjes constants
  <math|\<gamma\><rsub|k>>. It is widely believed that they are all
  irrational, but this has not been proved even for
  <math|\<gamma\>=\<gamma\><rsub|0>> (Euler's constant).

  A number <math|n> is squarefree if <math|n=1> or
  <math|n=p<rsub|1>*\<ldots\>*p<rsub|r>>, where
  <math|p<rsub|1>,\<ldots\>,p<rsub|r>> are different primes. A number
  <math|n> is squarefull if <math|n=1> or
  <math|n=p<rsub|1><rsup|\<alpha\><rsub|1>>*\<ldots\>*p<rsub|r><rsup|\<alpha\><rsub|r>>>,
  where <math|\<alpha\><rsub|1>\<geq\>2,\<ldots\>,\<alpha\><rsub|r>\<geq\>2>.
  Various generating functions involving <math|\<zeta\><around|(|s|)>> are
  thoroughly discussed in chapter 1 of <cite|Iv1>, and various divisor
  problems are discussed in chapters 13 and 14.

  The equivalence of the definitions<nbsp><eqref|eq:gamma_func>
  and<nbsp><eqref|eq:gamma_product> for <math|\<Gamma\><around|(|s|)>> is
  standard. For example, K. Ramachandra <cite|Ram> in the appendix starts
  from equation<nbsp><eqref|eq:gamma_func> and derives several properties of
  <math|\<Gamma\><around|(|s|)>>, including
  equation<nbsp><eqref|eq:gamma_product> and Stirling's
  formula<nbsp><eqref|eq:stirling>. On the other hand, Karatsuba\UVoronin
  <cite|KaVo> (also Montgomery\UVaughan <cite|MoVa>, appendix C) in the
  appendix start from equation<nbsp><eqref|eq:gamma_product> and show that
  equation<nbsp><eqref|eq:gamma_func> holds. These works contain all the
  facts about <math|\<Gamma\><around|(|s|)>> needed in this text.

  There are many proofs in the literature of the fundamental functional
  equation<nbsp><eqref|eq:func_eq> for <math|\<zeta\><around|(|s|)>>. For
  example, E. C. Titchmarsh <cite|Tit3> in chapter 2 of his well-known
  monograph presents seven different proofs of
  equation<nbsp><eqref|eq:func_eq>.

  A quick proof of equation<nbsp><eqref|eq:gaussian_int> is as follows (see
  (A.38) of <cite|Iv1>). By the principle of analytic continuation it
  suffices to prove equation<nbsp><eqref|eq:gaussian_int> for <math|B> real
  and positive, when the change of variable

  <\equation>
    <label|eq:gaussian_substitution>t=<frac|A|2*B>+<frac|x|<sqrt|B>>
  </equation>

  gives

  <\equation>
    <label|eq:gaussian_proof><big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|(|A*t-B*t<rsup|2>|)>*d*t=B<rsup|-1/2>*exp
    <around|(|A<rsup|2>/<around|(|4*B|)>|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-x<rsup|2>>*d*x=<around|(|\<pi\>/B|)><rsup|1/2>*exp
    <around|(|A<rsup|2>/<around|(|4*B|)>|)>.
  </equation>

  Recall that the Bernoulli numbers <math|B<rsub|k>> are defined by the
  series expansion

  <\equation>
    <label|eq:bernoulli_def><frac|z|e<rsup|z>-1>=<big|sum><rsub|k=0><rsup|\<infty\>>B<rsub|k>*<frac|z<rsup|k>|k!>*<space|1em><around|(|<around|\||z|\|>\<less\>2*\<pi\>|)>,
  </equation>

  so that <math|B<rsub|0>=1>, <math|B<rsub|1>=-1/2>, <math|B<rsub|2>=1/6>,
  <math|B<rsub|4>=-1/30>, <math|B<rsub|6>=1/42> etc., and
  <math|B<rsub|2*k+1>=0> for <math|k\<geq\>1>. A classical formula (see
  <cite|Iv1>, theorem 1.4 for a proof) is that

  <\equation>
    <label|eq:zeta_even>\<zeta\>*<around|(|2*k|)>=<around|(|-1|)><rsup|k+1><frac|<around|(|2*\<pi\>|)><rsup|2*k>*B<rsub|2*k>|2*<around|(|2*k|)>!>*<space|1em><around|(|k\<in\>\<bbb-N\>|)>,
  </equation>

  so that in particular

  <\align>
    <tformat|<table|<row|<cell|\<zeta\><around|(|2|)>>|<cell|=<big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-2>=<frac|\<pi\><rsup|2>|6>,<eq-number><label|eq:zeta_examples>>>|<row|<cell|\<zeta\><around|(|4|)>>|<cell|=<big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-4>=<frac|\<pi\><rsup|4>|90>.>>>>
  </align>

  Not much is known about the numbers <math|\<zeta\>*<around|(|2*n+1|)>>,
  <math|n\<in\>\<bbb-N\>>. R. Apéry <cite|Ape> (Roger Apéry, November 14,
  1916-December 18, 1994, a Greek-French mathematician) proved in 1978 that
  <math|\<zeta\><around|(|3|)>> is irrational. This result has incited much
  subsequent research. For example, T. Rivoal <cite|Riv1> proved that
  infinitely many of the numbers <math|\<zeta\>*<around|(|2*n+1|)>> are
  irrational. In <cite|Riv2> he proved that one of the nine numbers
  <math|\<zeta\>*<around|(|2*n+1|)>> for <math|2\<leq\>n\<leq\>10> is
  irrational. Rivoal's method was generalized by V. Zudilin <cite|Zud>, who
  obtained a number of irrationality results for
  <math|\<zeta\>*<around|(|2*n+1|)>>.

  Hardy's function <math|Z<around|(|t|)>> was named after Godfrey Harold "G.
  H." Hardy FRS (February 7, 1877-December 1, 1947), one of the greatest
  mathematicians of his time. He is best known for his numerous achievements
  in number theory and mathematical analysis, often obtained in joint works
  with J. E. Littlewood (June 9, 1885-September 6, 1977). Starting in 1914,
  he was the mentor of the famous Indian mathematician Srinivasa Ramanujan
  (December 22, 1887-April 26, 1920), a relationship that has become
  celebrated. He was a lecturer at Cambridge from 1906, which he left in 1919
  to take the Savilian Chair of Geometry at Oxford. He returned to Cambridge
  in 1931, where he was Sadleirian Professor until 1942. Besides writing
  numerous research articles of highest quality (these may be found in
  <cite|Har7>), he wrote several well-known books, such as <cite|Har4>,
  <cite|Har5> and <cite|Har6>. His essay from 1940 on the aesthetics of
  mathematics, A Mathematician's Apology <cite|Har3>, is often considered as
  one of the best insights into the mind of a working mathematician written
  for the layman. His textbook An Introduction to the Theory of Numbers
  <cite|HaWr>, written jointly with E. M. Wright (Sir Edward Maitland Wright,
  February 13, 1906-February 2, 2005), is one of the best introductory texts
  on number theory ever written.

  Stirling's formula for <math|\<Gamma\><around|(|s|)>> exists in many forms.
  See equation<nbsp><eqref|eq:stirling> for a sharp version of this result.
  It is named after the Scottish mathematician James Stirling (May
  1692-December 5, 1770).

  The functional equation of <math|\<zeta\><around|(|s|)>> in a certain sense
  characterizes it completely. This was established long ago by H. Hamburger
  <cite|Ham> (Hans Ludwig Hamburger, August 5, 1889, Berlin-August 14, 1956,
  a German mathematician), who proved the following result (see also chapter
  2 of <cite|Cha>). Let <math|G> be an integral function of finite order,
  <math|P> a polynomial, and let the series

  <\equation>
    <label|eq:hamburger_f>f<around|(|s|)>=<frac|G<around|(|s|)>|P<around|(|s|)>>=<big|sum><rsub|n=1><rsup|\<infty\>>a<rsub|n>*n<rsup|-s>
  </equation>

  converge absolutely for <math|\<sigma\>\<gtr\>1>. If

  <\equation>
    <label|eq:hamburger_functional>\<pi\><rsup|-s/2>*\<Gamma\>*<around|(|s/2|)>*f<around|(|s|)>=\<pi\><rsup|-<around|(|1-s|)>/2>*\<Gamma\>*<around|(|<around|(|1-s|)>/2|)>*g<around|(|s|)>,
  </equation>

  where <math|g*<around|(|1-s|)>=<big|sum><rsub|n=1><rsup|\<infty\>>b<rsub|n>*n<rsup|-s>>
  converges absolutely for <math|\<sigma\>\<less\>-\<alpha\>\<less\>0>, then

  <\equation>
    <label|eq:hamburger_result>f<around|(|s|)>=a<rsub|1>*\<zeta\><around|(|s|)>=g<around|(|s|)>.
  </equation>

  Ivan Matveevich Vinogradov (September 14, 1891-March 20, 1983) was a
  leading Soviet mathematician. He served as director of the Steklov
  Mathematical Institute for 49 years. For his method of exponential sums see
  <cite|Vin1> and <cite|Vin2>. For the sharpest value of the constant
  <math|C> in equation<nbsp><eqref|eq:vinogradov> and related bounds, see the
  papers of K. Ford <cite|For1>, <cite|For2>.

  An extensive account on the RH is to be found in the monograph of P.
  Borwein et al. <cite|BCRW>. There is much numerical evidence favoring the
  RH, and for the calculations involving the zeros of
  <math|\<zeta\><around|(|s|)>> see e.g., the works of A. M. Odlyzko
  <cite|Odl1>, <cite|Odl2>, H. te Riele and J. van de Lune <cite|RiLu>, and
  van de Lune et al <cite|LRW>. An excellent account of the RH and LH is to
  be found in the classical book of E. C. Titchmarsh <cite|Tit3>. Edward
  Charles "Ted" Titchmarsh (June 1, 1899-January 18, 1963 Oxford) was a
  leading British mathematician. He was a student of G. H. Hardy, and is
  known for work in analytic number theory, Fourier analysis and other parts
  of mathematical analysis. He was Savilian Professor of Geometry at the
  University of Oxford from 1932 to 1963.

  A function <math|f<around|(|s|)>>, regular over <math|\<bbb-C\>>, is called
  an integral (or entire) function of finite order if

  <\equation>
    <label|eq:finite_order><around|\||f<around|(|s|)>|\|>\<ll\>exp
    <around|(|B<around|\||s|\|><rsup|A>|)>
  </equation>

  for some constants <math|A>, <math|B> (<math|\<geq\>0>) as
  <math|<around|\||s|\|>\<to\>\<infty\>>. The order of <math|f<around|(|s|)>>
  is the lower bound of <math|A> for which
  equation<nbsp><eqref|eq:finite_order> holds. The study of integral
  functions of finite order was developed at the end of the nineteenth
  century by J. Hadamard, who showed that these functions can be written as
  an infinite product containing factors of the form <math|s-s<rsub|0>>
  corresponding to the zero <math|s<rsub|0>> of the function in question. The
  integral function often used in the theory of <math|\<zeta\><around|(|s|)>>
  is <math|\<xi\><around|(|s|)>>, which is an integral function of order one
  (see equation<nbsp><eqref|eq:eta_xi_def>). To see this, note that from
  equation<nbsp><eqref|eq:psi_integral> there is

  <\equation>
    <label|eq:xi_bound_prep>log <around|\||<around|(|1-s|)>*\<zeta\><around|(|s|)>|\|>\<ll\>log\|s\|+1
  </equation>

  uniformly for <math|\<sigma\>\<geq\><frac|1|2>>, and by Stirling's formula
  it follows that

  <\equation>
    <label|eq:xi_order_bound>log <around|\||\<xi\><around|(|s|)>|\|>\<ll\><around|\||s|\|>*<around|(|log\|s\|+1|)>
  </equation>

  uniformly for <math|\<sigma\>\<geq\><frac|1|2>>. Since
  <math|\<xi\>*<around|(|1-s|)>=\<xi\><around|(|s|)>>, this bound holds
  uniformly for <math|\<sigma\>\<leq\><frac|1|2>>, too. Further, by
  Stirling's formula for real <math|s> there is <math|log
  \<xi\><around|(|s|)>\<sim\><frac|1|2>*s*log s> as <math|s\<to\>\<infty\>>,
  which shows that the order of <math|\<xi\><around|(|s|)>> is exactly unity.

  The <math|\<ll\>>-constant in equation<nbsp><eqref|eq:zero_count> was made
  explicit by G. Csordas et al. <cite|COSV>, who proved that

  <\equation>
    <label|eq:explicit_zero_bound>N*<around|(|T+1|)>-N<around|(|T|)>\<leq\>log
    T*<space|1em><around|(|T\<geq\>3\<times\>10<rsup|8>|)>,
  </equation>

  which is an inequality that is easy to remember.

  For an explicit value of <math|C> in equation<nbsp><eqref|eq:rh_bound>, see
  K. Soundararajan <cite|Sou4>. He proved that one can take <math|C=3/8>. A
  sharper result, also on the RH, was obtained by V. Chandee and K.
  Soundararajan <cite|ChSo>, namely

  <\equation>
    <label|eq:chandee_sound><around*|\||\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\|>\<ll\>exp
    <around*|(|<frac|log 2|2>*<frac|log t|log log
    t>*<around*|(|1+O<around*|(|<frac|log log log t|log log t>|)>|)>|)>.
  </equation>

  On the other hand, it is known that there are arbitrarily large values of
  <math|t> for which one has unconditionally

  <\equation>
    <label|eq:lower_bound_zeta><around*|\||\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\|>\<gtr\>exp
    <around*|(|<around|(|1+o<around|(|1|)>|)>*<sqrt|<frac|log t|log log
    t>>|)>*<space|1em><around|(|t\<to\>\<infty\>|)>,
  </equation>

  as shown by K. Soundararajan <cite|Sou3>.

  The function <math|S<around|(|T|)>> is relatively small, and one can make
  the bounds in equations<nbsp><eqref|eq:s_bound>
  and<nbsp><eqref|eq:s_rh_bound> explicit. Namely it was proved by T. S.
  Trudgian <cite|Tru3> that, for <math|T\<gtr\>e>,

  <\equation>
    <label|eq:trudgian_s_bound><around|\||S<around|(|T|)>|\|>\<leq\>1.998+0.17*log
    T.
  </equation>

  This is an unconditional result. On the RH, K. Ramachandra and A.
  Sankaranarayanan <cite|RaSa2> showed that

  <\equation>
    <label|eq:rh_s_bound><around|\||S<around|(|T|)>|\|>\<leq\>1.2*<frac|log
    T|log log T>*<space|1em><around|(|T\<gtr\>T<rsub|0>|)>.
  </equation>

  This was improved, again on the RH, by D. A. Goldston and S. M. Gonek
  <cite|GoGo>. They proved that, for <math|0\<less\>h\<leq\><sqrt|t>>,

  <\equation>
    <label|eq:goldston_gonek><around|\||S*<around|(|t+h|)>-S<around|(|t|)>|\|>\<leq\><around*|(|<frac|1|2>+o<around|(|1|)>|)>*<frac|log
    T|log log T>*<space|1em><around|(|T\<to\>\<infty\>|)>,
  </equation>

  and deduced, via <math|<big|int><rsub|0><rsup|T>S<around|(|t|)>*d*t\<ll\>log
  T> (this is an unconditional result of J. E. Littlewood <cite|Lit>), that
  under the RH,

  <\equation>
    <label|eq:rh_s_improved><around|\||S<around|(|T|)>|\|>\<leq\><around*|(|<frac|1|2>+o<around|(|1|)>|)>*<frac|log
    T|log log T>*<space|1em><around|(|T\<to\>\<infty\>|)>,
  </equation>

  and a bound analogous to equation<nbsp><eqref|eq:rh_s_improved> for
  <math|m*<around|(|<frac|1|2>+i*\<gamma\>|)>>, the multiplicity of the zero
  <math|<frac|1|2>+i*\<gamma\>> (<math|\<gamma\>\<gtr\>0>), also under the
  RH. Related results are to be found in the works of M. A. Korolev
  <cite|Kor1>, <cite|Kor2> and Karatsuba-Korolev <cite|KaKo>. For the moments
  of <math|S<around|(|t|)>> one has the classical unconditional result of A.
  Selberg <cite|Sel> (Atle Selberg, June 14, 1917-August 6, 2007, Norwegian
  mathematician known for his work in analytic number theory, and in the
  theory of automorphic forms, in particular bringing them into relation with
  spectral theory) that, for fixed <math|k\<in\>\<bbb-N\>>,

  <\equation>
    <label|eq:selberg_moments><big|int><rsub|0><rsup|T><around|\||S<around|(|t|)>|\|><rsup|2*k>*d*t=<frac|<around|(|2*k|)>!|k!<around|(|2*\<pi\>|)><rsup|2*k>>*T<around|(|log
    log T|)><rsup|k>+O<around|(|T<around|(|log log T|)><rsup|k-1/2>|)>.
  </equation>

  This suggests that <math|S<around|(|t|)>/<sqrt|log log t>> resembles a
  Gaussian random variable with mean 0 and variance <math|2*\<pi\><rsup|2>>.
  A. Ghosh <cite|Gho> established this in 1983.

  Several omega results involving the functions <math|S<around|(|T|)>> and
  <math|S<rsub|1><around|(|T|)>=<big|int><rsub|0><rsup|T>S<around|(|t|)>*d*t>
  are proved by K.-M. Tsang <cite|Tsa1>. As is well-known (see Chapter IX of
  <cite|Tit3>), these functions are closely related to the distribution of
  the imaginary parts of the zeros of <math|\<zeta\><around|(|s|)>>. A.
  Selberg <cite|Sel> has proved that unconditionally one has

  <\align>
    <tformat|<table|<row|<cell|S<around|(|T|)>>|<cell|=\<Omega\><rsub|\<pm\>><around|(|<around|(|log
    T|)><rsup|1/3><around|(|log log T|)><rsup|-7/3>|)>,<eq-number><label|eq:selberg_omega>>>|<row|<cell|S<rsub|1><around|(|T|)>>|<cell|=\<Omega\><rsub|+><around|(|<around|(|log
    T|)><rsup|1/2><around|(|log log T|)><rsup|-4>|)>,>>|<row|<cell|S<rsub|1><around|(|T|)>>|<cell|=\<Omega\><rsub|-><around|(|<around|(|log
    T|)><rsup|1/3><around|(|log log T|)><rsup|-10/3>|)>.>>>>
  </align>

  Tsang refined Selberg's arguments, based on the evaluation of high moments
  of <math|S<around|(|T|)>> (see equation<nbsp><eqref|eq:selberg_moments>),
  and proved that

  <\align>
    <tformat|<table|<row|<cell|S<around|(|T|)>>|<cell|=\<Omega\><rsub|\<pm\>><around|(|<around|(|log
    T/log log T|)><rsup|1/3>|)>,<eq-number><label|eq:tsang_omega>>>|<row|<cell|S<rsub|1><around|(|T|)>>|<cell|=\<Omega\><rsub|+><around|(|<around|(|log
    T|)><rsup|1/2><around|(|log log T|)><rsup|-9/4>|)>,>>|<row|<cell|S<rsub|1><around|(|T|)>>|<cell|=\<Omega\><rsub|-><around|(|<around|(|log
    T|)><rsup|1/3><around|(|log log T|)><rsup|-4/3>|)>,>>>>
  </align>

  and if one assumes the Riemann hypothesis, then

  <\equation>
    <label|eq:tsang_rh>S<rsub|1><around|(|T|)>=\<Omega\><rsub|\<pm\>><around|(|<around|(|log
    T|)><rsup|1/2><around|(|log log T|)><rsup|-3/2>|)>.
  </equation>

  It may be conjectured that both <math|S<around|(|T|)>> and
  <math|S<rsub|1><around|(|T|)>> are of the order <math|<around|(|log
  T|)><rsup|1/2+o<around|(|1|)>>> as <math|T\<to\>\<infty\>>, although it is
  known, for example, only that <math|S<around|(|T|)>=O<around|(|log T|)>>
  (and <math|O<around|(|log T/log log T|)>> if the RH holds), so that there
  is still a considerable gap between <math|O>- and <math|\<Omega\>>-results.

  K.-M. Tsang <cite|Tsa2> has shown that unconditionally

  <\equation>
    <label|eq:tsang_sup><around*|(|sup<rsub|T\<less\>t\<leq\>2*T> log
    <around*|\||\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\|>|)>*<around*|(|sup<rsub|T\<less\>t\<leq\>2*T>\<pm\>S<around|(|t|)>|)>\<gg\><frac|log
    T|log log T>,
  </equation>

  which means that the result holds once with <math|+S<around|(|t|)>> and
  once with <math|-S<around|(|t|)>>. He also proved that

  <\equation>
    <label|eq:tsang_s1>S<rsub|1><around|(|t|)>=<big|int><rsub|0><rsup|t>S<around|(|u|)>*d*u=\<Omega\><rsub|+><around|(|<around|(|log
    t|)><rsup|1/2><around|(|log log t|)><rsup|-3/2>|)>.
  </equation>

  These results supplement that of H. L. Montgomery <cite|Mon2>; they are
  good when <math|\<sigma\>\<gtr\>1/2> is fixed. Montgomery showed that, for
  <math|<frac|1|2>\<less\>\<sigma\>\<less\>1> fixed, one has

  <\equation>
    <label|eq:montgomery_log>log <around|\||\<zeta\>*<around|(|\<sigma\>+i*t|)>|\|>=\<Omega\><rsub|+><around|(|log<rsup|1-\<sigma\>>
    t<around|(|log log t|)><rsup|-\<sigma\>>|)>,
  </equation>

  and under the RH that

  <\equation>
    <label|eq:montgomery_rh>log <around*|\||\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\|>=\<Omega\>*<around*|(|<frac|1|20>*<sqrt|<frac|log
    t|log log t>>|)>.
  </equation>

  K. Ramachandra and A. Sankaranarayanan <cite|RaSa1> used Montgomery's
  method, made optimal use of the parameter <math|\<alpha\>> in his proof and
  obtained a result which is perhaps the limit of Montgomery's method,
  containing explicit evaluation of the constant implied by the
  <math|\<Omega\>>-symbol in equation<nbsp><eqref|eq:montgomery_log>. As to
  the true order of <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>>, it is a deep
  open question, and one can only make guesses. For example, D. W. Farmer et
  al. <cite|FGH> conjecture that, as <math|T\<to\>\<infty\>>,

  <\equation>
    <label|eq:farmer_conj1>max<rsub|t\<in\><around|[|0,T|]>><around|\||Z<around|(|t|)>|\|>=max<rsub|t\<in\><around|[|0,T|]>><around*|\||\<zeta\>*<around*|(|<frac|1|2>+i*t|)>|\|>=exp
    <around*|(|<around|(|1+o<around|(|1|)>|)>*<sqrt|<frac|1|2>*log T*log log
    T>|)>
  </equation>

  and

  <\equation>
    <label|eq:farmer_conj2>limsup<rsub|t\<to\>\<infty\>>
    <frac|S<around|(|t|)>|<sqrt|log t*log log t>>=<frac|1|\<pi\>*<sqrt|2>>.
  </equation>

  Their arguments are based on methods involving random matrix theory (see,
  for example, the books of G. W. Anderson et al. <cite|AGZ> and M.L. Mehta
  <cite|Meh> for an account on random matrices). In analytic number theory,
  the distribution of zeros of the Riemann zeta-function (and other
  L-functions) is often modeled by the distribution of eigenvalues of certain
  random matrices (see J. Keating <cite|Kea>). The connection was first
  discovered by Hugh Montgomery (see <cite|Mon1>) and Freeman J. Dyson. It is
  connected to the Hilbert-Pólya conjecture (David Hilbert, January 23,
  1862-February 14, 1943, a German mathematician, and George Pólya, December
  13, 1887-September 7, 1985, a Hungarian mathematician) that the imaginary
  parts of the zeros of <math|\<zeta\><around|(|s|)>> correspond to the
  eigenvalues of an unbounded self-adjoint operator.

  For a thorough discussion on upper bounds for
  <math|N*<around|(|\<sigma\>,T|)>>, see <cite|Iv1>, chapter 11.

  Selberg's method for detecting zeros on the critical line is expounded in
  many texts, such as <cite|Tit3>, <cite|Iv1> and <cite|KaVo>. After
  Selberg's pioneering work, it was later used and refined by several
  mathematicians, most notably by N. Levinson <cite|Lev> (Norman Levinson,
  August 11, 1912-October 10, 1975, American mathematician, made major
  contributions in the study of Fourier transforms, complex analysis,
  non-linear differential equations, number theory, and signal processing).
  Levinson showed that more than a third of zeros lie on the critical line
  (i.e. <math|C=1/3> in equation<nbsp><eqref|eq:selberg>). A simplification
  of Levinson's method is to be found in the work <cite|CoGh2> of J. B.
  Conrey and A. Ghosh, and in the recent work <cite|You> of M. P. Young. The
  research was carried on by other mathematicians and, for example, J. B.
  Conrey <cite|Con2>, showed that at least two fifth of the zeros of
  <math|\<zeta\><around|(|s|)>> are on the critical line. In <cite|CGG3>,
  Conrey et al. investigated the occurrence of simple zeros on the critical
  line. The starting point is the obvious observation that <math|\<rho\>> is
  a simple zero of <math|\<zeta\><around|(|s|)>> if and only if
  <math|\<zeta\><rprime|'><around|(|\<rho\>|)>\<neq\>0>, and thus by Cauchy's
  inequality

  <\equation>
    <label|eq:cauchy_simple><around*|\||<big|sum><rsub|0\<less\>\<gamma\>\<leq\>T>B<around|(|\<rho\>|)>*\<zeta\><rprime|'><around|(|\<rho\>|)>|\|><rsup|2>\<leq\>N<rsub|s><around|(|T|)>*<big|sum><rsub|0\<less\>\<gamma\>\<leq\>T><around|\||B<around|(|\<rho\>|)>*\<zeta\><rprime|'><around|(|\<rho\>|)>|\|><rsup|2>,
  </equation>

  where <math|N<rsub|s><around|(|T|)>> is the number of simple zeros
  <math|\<rho\>=\<beta\>+i*\<gamma\>> of <math|\<zeta\><around|(|s|)>> with
  ordinates in <math|<around|(|0,T|]>>, and <math|B<around|(|s|)>> is any
  analytic function. To minimize the loss in applying Cauchy's inequality one
  wants to choose <math|B> so that <math|B*\<zeta\><rprime|'>> is close to
  constant, and therefore <math|B> is chosen as a suitable Dirichlet series
  mollifier for <math|\<zeta\><rprime|'><around|(|s|)>>. The choice of the
  mollifier is incidentally the most complicated task in this problem.
  Assuming the RH, they show that <math|N<rsub|s><around|(|T|)>/N<around|(|T|)>\<geq\>19/27=0.703703*\<ldots\>>
  as <math|T\<to\>\<infty\>>.

  The latest development concerning Selberg's method involve the works of Bui
  et al. <cite|BCY>, and by S. Feng <cite|Fen>. The former proved that at
  least 41.05% of the zeros of <math|\<zeta\><around|(|s|)>> are on the
  critical line (i.e. one can take <math|C=0.4105> in
  equation<nbsp><eqref|eq:selberg>) and at least 40.58% of the zeros of
  <math|\<zeta\><around|(|s|)>> are simple and on the critical line. At about
  the same time Feng independently claimed that at least 41.73% of the zeros
  of <math|\<zeta\><around|(|s|)>> are on the critical line and at least
  40.75% of them are simple and on the critical line. Bui et al. found some
  mistakes in Feng's work and in the second version of his paper in the ArXiv
  (http://arxiv.org/abs/1003.0059), he removed the result on simple zeros,
  and now claimed only that <math|C=0.4128>. Anyway, as it stands at the
  moment, Feng seems to be the record holder for the proportion of zeros,
  while Bui et al. are the ones for simple zeros.

  So far it is not known whether the simplicity of zeros
  (<math|\<zeta\><rprime|'><around|(|\<rho\>|)>\<neq\>0> if
  <math|\<zeta\><around|(|\<rho\>|)>=0>) and the RH imply one another \U it
  could happen, as far as it is known, that both statements are true, both
  are false, or that one is true and one is false!

  <\thebibliography|99>
    <bibitem|AGZ>G. W. Anderson, A. Guionnet and O. Zeitouni,
    <with|font-shape|italic|An Introduction to Random Matrices>, Cambridge
    University Press, Cambridge, 2010.

    <bibitem|Ape>R. Apéry, Irrationalité de <math|\<zeta\><around|(|2|)>> et
    <math|\<zeta\><around|(|3|)>>. Astérisque, 61, 11-13 (1979).

    <bibitem|BCRW>P. Borwein, S. Choi, B. Rooney and A. Weirathmueller
    (eds.), <with|font-shape|italic|The Riemann Hypothesis: A Resource for
    the Afficionado and Virtuoso Alike>, CMS Books in Mathematics, Springer,
    New York, 2008.

    <bibitem|BCY>H. M. Bui, J. B. Conrey and M. P. Young, More than 41% of
    the zeros of the zeta function are on the critical line.
    <with|font-shape|italic|Acta Arith.> 150, 35-64 (2011).

    <bibitem|Cha>S. J. Chowla, <with|font-shape|italic|The Riemann Hypothesis
    and Hilbert's Tenth Problem>, Gordon and Breach, New York, 1965.

    <bibitem|ChSo>V. Chandee and K. Soundararajan, Bounding
    <math|<around|\||\<zeta\>*<around|(|1/2+i*t|)>|\|>> on the Riemann
    hypothesis. <with|font-shape|italic|Bull. London Math. Soc.> 43, 243-250
    (2011).

    <bibitem|CGG3>J. B. Conrey, A. Ghosh and S. M. Gonek, Simple zeros of the
    Riemann zeta-function. <with|font-shape|italic|Proc. London Math. Soc.>
    (3) 76, 497-522 (1998).

    <bibitem|Con2>J. B. Conrey, More than two fifths of the zeros of the
    Riemann zeta function are on the critical line.
    <with|font-shape|italic|J. Reine Angew. Math.> 399, 1-26 (1989).

    <bibitem|CoGh2>J. B. Conrey and A. Ghosh, A simpler proof of Levinson's
    theorem. <with|font-shape|italic|Math. Proc. Cambridge Philos. Soc.> 97,
    385-395 (1985).

    <bibitem|COSV>G. Csordas, A. M. Odlyzko, W. Smith and R. S. Varga, A new
    Lehmer pair of zeros and a new lower bound for the de Bruijn-Newman
    constant <math|\<Lambda\>>. <with|font-shape|italic|Electron. Trans.
    Numer. Anal.> 1, 104-111 (1993).

    <bibitem|Est2>T. Estermann, <with|font-shape|italic|Introduction to
    Modern Prime Number Theory>, Cambridge University Press, Cambridge, 1952.

    <bibitem|Eul>L. Euler, Remarques sur un beau rapport entre les séries des
    puissances tant directes que réciproques. <with|font-shape|italic|Mém.
    Acad. Sci. Berlin> 17, 83-106 (1768).

    <bibitem|FGH>D. W. Farmer, S. M. Gonek and C. P. Hughes, The maximum size
    of L-functions. <with|font-shape|italic|J. Reine Angew. Math.> 609,
    215-236 (2007).

    <bibitem|Fen>S. Feng, Zeros of the Riemann zeta function on the critical
    line. <with|font-shape|italic|J. Number Theory> 132, 511-542 (2012).

    <bibitem|For1>K. Ford, Vinogradov's integral and bounds for the Riemann
    zeta function. <with|font-shape|italic|Proc. London Math. Soc.> (3) 85,
    565-633 (2002).

    <bibitem|For2>K. Ford, Zero-free regions for the Riemann zeta function.
    In <with|font-shape|italic|Number Theory for the Millennium II> (Urbana,
    IL, 2000), pp. 25-56, A K Peters, Natick, MA, 2002.

    <bibitem|Gho>A. Ghosh, The distribution of
    <math|\<zeta\>*<around|(|1/2+i*t|)>>. In <with|font-shape|italic|Number
    Theory, Trace Formulas and Discrete Groups> (Oslo, 1987), pp. 374-383,
    Academic Press, Boston, MA, 1989.

    <bibitem|GoGo>D. A. Goldston and S. M. Gonek, A note on S(t) and the
    zeros of the Riemann zeta-function. <with|font-shape|italic|Bull. London
    Math. Soc.> 39, 482-486 (2007).

    <bibitem|Ham>H. Hamburger, Über die Riemannsche Funktionalgleichung der
    <math|\<zeta\>>-Funktion. <with|font-shape|italic|Math. Z.> 10, 240-254
    (1921); 11, 224-245 (1921); 13, 283-311 (1922).

    <bibitem|Har3>G. H. Hardy, <with|font-shape|italic|A Mathematician's
    Apology>, Cambridge University Press, Cambridge, 1940.

    <bibitem|Har4>G. H. Hardy, <with|font-shape|italic|Divergent Series>,
    Oxford University Press, London, 1949.

    <bibitem|Har5>G. H. Hardy, <with|font-shape|italic|Pure Mathematics>,
    10th ed., Cambridge University Press, Cambridge, 1952.

    <bibitem|Har6>G. H. Hardy, <with|font-shape|italic|A Course of Pure
    Mathematics>, 10th ed., Cambridge University Press, Cambridge, 1952.

    <bibitem|Har7>G. H. Hardy, <with|font-shape|italic|Collected Papers of G.
    H. Hardy> (7 volumes), Oxford University Press, Oxford, 1966-1979.

    <bibitem|HaLi2>G. H. Hardy and J. E. Littlewood, The zeros of Riemann's
    zeta-function on the critical line. <with|font-shape|italic|Math. Z.> 10,
    283-317 (1921).

    <bibitem|Has>C. B. Haselgrove, Tables of the Riemann zeta function.
    <with|font-shape|italic|Roy. Soc. Math. Tables> 6, Cambridge University
    Press, Cambridge, 1960.

    <bibitem|HaWr>G. H. Hardy and E. M. Wright, <with|font-shape|italic|An
    Introduction to the Theory of Numbers>, 6th ed., Oxford University Press,
    Oxford, 2008.

    <bibitem|HuIv>M. N. Huxley and A. Ivi¢, Subconvexity for the Riemann zeta
    function and the divisor problem. <with|font-shape|italic|Bull. Cl. Sci.
    Math. Nat. Sci. Math.> 32, 13-32 (2007).

    <bibitem|Isr1>I. M. Israilov, On the Laurent expansion of the Riemann
    zeta function. <with|font-shape|italic|Trudy Mat. Inst. Steklov.> 158,
    98-104 (1981) [Russian]; English transl. in <with|font-shape|italic|Proc.
    Steklov Inst. Math.> 158, 105-112 (1983).

    <bibitem|Isr2>I. M. Israilov, The Stieltjes constants.
    <with|font-shape|italic|Russian Math. Surveys> 40, 217-218 (1985).

    <bibitem|Iv1>A. Ivi¢, <with|font-shape|italic|The Riemann Zeta-Function:
    Theory and Applications>, 2nd ed., Dover Publications, Mineola, NY, 2003.

    <bibitem|Iv4>A. Ivi¢, <with|font-shape|italic|Mean Values of the Riemann
    Zeta Function>, Lectures on Mathematics ETH Zürich, Birkhäuser, Boston,
    1991.

    <bibitem|KaKo>A. A. Karatsuba and M. A. Korolev, The argument of the
    Riemann zeta function. <with|font-shape|italic|Russian Math. Surveys> 60,
    433-488 (2005).

    <bibitem|KaVo>A. A. Karatsuba and S. M. Voronin,
    <with|font-shape|italic|The Riemann Zeta-Function>, de Gruyter, Berlin,
    1992.

    <bibitem|Kea>J. Keating, Random matrix theory and
    <math|\<zeta\>*<around|(|1/2+i*t|)>>. <with|font-shape|italic|Commun.
    Math. Phys.> 281, 499-522 (2008).

    <bibitem|Kor1>M. A. Korolev, On the argument of the Riemann zeta function
    on the critical line. <with|font-shape|italic|Izv. Ross. Akad. Nauk Ser.
    Mat.> 67, 21-60 (2003) [Russian]; English transl. in
    <with|font-shape|italic|Izv. Math.> 67, 225-264 (2003).

    <bibitem|Kor2>M. A. Korolev, Gram's law and the argument of the Riemann
    zeta function. <with|font-shape|italic|Publ. Inst. Math. (Beograd)
    (N.S.)> 76, 11-23 (2004).

    <bibitem|Lan>E. Landau, Über die Anzahl der Gitterpunkte in gewissen
    Bereichen. <with|font-shape|italic|Gött. Nachr.> 1912, 687-771.

    <bibitem|Lev>N. Levinson, More than one-third of zeros of Riemann's
    zeta-function are on <math|\<sigma\>=1/2>. <with|font-shape|italic|Adv.
    Math.> 13, 383-436 (1974).

    <bibitem|Lit>J. E. Littlewood, On the zeros of the Riemann zeta-function.
    <with|font-shape|italic|Proc. Cambridge Philos. Soc.> 22, 295-318 (1924).

    <bibitem|LRW>J. van de Lune, H. J. J. te Riele and D. T. Winter, On the
    zeros of the Riemann zeta function in the critical strip. IV.
    <with|font-shape|italic|Math. Comp.> 46, 667-681 (1986).

    <bibitem|Man>H. von Mangoldt, Zu Riemanns Abhandlung "Über die Anzahl der
    Primzahlen unter einer gegebenen Grösse". <with|font-shape|italic|J.
    Reine Angew. Math.> 114, 255-305 (1895).

    <bibitem|Meh>M. L. Mehta, <with|font-shape|italic|Random Matrices>, 3rd
    ed., Pure and Applied Mathematics 142, Elsevier/Academic Press,
    Amsterdam, 2004.

    <bibitem|Mon1>H. L. Montgomery, The pair correlation of zeros of the zeta
    function. <with|font-shape|italic|Proc. Sympos. Pure Math.> 24, 181-193
    (1973).

    <bibitem|Mon2>H. L. Montgomery, Extreme values of the Riemann zeta
    function. <with|font-shape|italic|Comment. Math. Helv.> 52, 511-518
    (1977).

    <bibitem|Mot1>Y. Motohashi, <with|font-shape|italic|Spectral Theory of
    the Riemann Zeta-Function>, Cambridge University Press, Cambridge, 1997.

    <bibitem|MoVa>H. L. Montgomery and R. C. Vaughan,
    <with|font-shape|italic|Multiplicative Number Theory I: Classical
    Theory>, Cambridge Studies in Advanced Mathematics 97, Cambridge
    University Press, Cambridge, 2007.

    <bibitem|Odl1>A. M. Odlyzko, On the distribution of spacings between
    zeros of the zeta function. <with|font-shape|italic|Math. Comp.> 48,
    273-308 (1987).

    <bibitem|Odl2>A. M. Odlyzko, The <math|10<rsup|20>>-th zero of the
    Riemann zeta function and 175 million of its neighbors.
    <with|font-shape|italic|AT&T Bell Lab. preprint> (1992).

    <bibitem|Ram>K. Ramachandra, <with|font-shape|italic|Lectures on
    Transcendental Numbers>, Ramanujan Institute, University of Madras,
    Madras, 1969.

    <bibitem|RaSa1>K. Ramachandra and A. Sankaranarayanan, On some theorems
    of Littlewood and Selberg. I. <with|font-shape|italic|J. Number Theory>
    44, 281-291 (1993).

    <bibitem|RaSa2>K. Ramachandra and A. Sankaranarayanan, Notes on the
    Riemann zeta-function. II. <with|font-shape|italic|Acta Arith.> 75, 1-22
    (1996).

    <bibitem|Rie>B. Riemann, Über die Anzahl der Primzahlen unter einer
    gegebenen Grösse. <with|font-shape|italic|Ber. Königl. Preuss. Akad.
    Wiss. Berlin> 1859, 671-680.

    <bibitem|RiLu>H. te Riele and J. van de Lune, Rigorous high speed
    separation of zeros of Riemann's zeta function.
    <with|font-shape|italic|Analytic Number Theory> (Allerton Park, IL,
    1995), pp. 183-197, Progr. Math. 138, Birkhäuser, Boston, MA, 1996.

    <bibitem|Riv1>T. Rivoal, La fonction zêta de Riemann prend une infinité
    de valeurs irrationnelles aux entiers impairs. <with|font-shape|italic|C.
    R. Acad. Sci. Paris Sér. I Math.> 331, 267-270 (2000).

    <bibitem|Riv2>T. Rivoal, At least one of the nine numbers
    <math|\<zeta\><around|(|5|)>,\<zeta\><around|(|7|)>,\<ldots\>,\<zeta\><around|(|21|)>>
    is irrational. <with|font-shape|italic|Acta Arith.> 101, 305-322 (2002).

    <bibitem|Sel>A. Selberg, On the zeros of Riemann's zeta-function.
    <with|font-shape|italic|Skr. Norske Vid. Akad. Oslo> 10, 1-59 (1942).

    <bibitem|Sou3>K. Soundararajan, Extreme values of zeta and L-functions.
    <with|font-shape|italic|Math. Ann.> 342, 467-486 (2008).

    <bibitem|Sou4>K. Soundararajan, Weak subconvexity for central values of
    L-functions. <with|font-shape|italic|Ann. of Math.> (2) 172, 1469-1498
    (2010).

    <bibitem|Sti>T. J. Stieltjes, Recherches sur les fractions continues.
    <with|font-shape|italic|Ann. Fac. Sci. Toulouse> 8, J76-J122; 9, A5-A47
    (1894-1895).

    <bibitem|Tit3>E. C. Titchmarsh, <with|font-shape|italic|The Theory of the
    Riemann Zeta-Function>, 2nd ed., revised by D. R. Heath-Brown, Oxford
    University Press, New York, 1986.

    <bibitem|Tru3>T. S. Trudgian, On the success and failure of Gram's law
    for the Riemann zeta function. <with|font-shape|italic|Acta Arith.> 125,
    225-256 (2006).

    <bibitem|Tsa1>K.-M. Tsang, The distribution of the values of the Riemann
    zeta function. PhD thesis, Princeton University, 1984.

    <bibitem|Tsa2>K.-M. Tsang, Higher-power moments of
    <math|\<Delta\><around|(|x|)>>, <math|E<around|(|t|)>> and
    <math|P<around|(|x|)>>. <with|font-shape|italic|J. London Math. Soc.> (2)
    65, 65-84 (2002).

    <bibitem|Vin1>I. M. Vinogradov, <with|font-shape|italic|The Method of
    Trigonometrical Sums in the Theory of Numbers>, translated from the
    Russian, revised and annotated by K. F. Roth and A. Davenport.
    Interscience Publishers, London-New York, 1954.

    <bibitem|Vin2>I. M. Vinogradov, <with|font-shape|italic|Special Variants
    of the Method of Trigonometric Sums>, translated from the Russian by K.
    F. Roth and A. Davenport, Pergamon Press, Oxford-London-New York-Paris,
    1982.

    <bibitem|You>M. P. Young, The first moment of L-functions of primitive
    Dirichlet characters with a large modulus. <with|font-shape|italic|J.
    Number Theory> 114, 100-119 (2005).

    <bibitem|Zud>V. Zudilin, One of the numbers
    <math|\<zeta\><around|(|5|)>,\<zeta\><around|(|7|)>,\<zeta\><around|(|9|)>,\<zeta\><around|(|11|)>>
    is irrational. <with|font-shape|italic|Russian Math. Surveys> 56, 774-776
    (2001).
  </thebibliography>
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
    <associate|auto-1|<tuple|1|1|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-2|<tuple|2|3|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-3|<tuple|3|7|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-4|<tuple|4|9|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-5|<tuple|86|15|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-6|<tuple|127|23|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-AGZ|<tuple|AGZ|23|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Ape|<tuple|Ape|23|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-BCRW|<tuple|BCRW|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-BCY|<tuple|BCY|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-CGG3|<tuple|CGG3|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-COSV|<tuple|COSV|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-ChSo|<tuple|ChSo|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Cha|<tuple|Cha|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-CoGh2|<tuple|CoGh2|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Con2|<tuple|Con2|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Est2|<tuple|Est2|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Eul|<tuple|Eul|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-FGH|<tuple|FGH|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Fen|<tuple|Fen|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-For1|<tuple|For1|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-For2|<tuple|For2|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Gho|<tuple|Gho|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-GoGo|<tuple|GoGo|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-HaLi2|<tuple|HaLi2|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-HaWr|<tuple|HaWr|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Ham|<tuple|Ham|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Har3|<tuple|Har3|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Har4|<tuple|Har4|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Har5|<tuple|Har5|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Har6|<tuple|Har6|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Har7|<tuple|Har7|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Has|<tuple|Has|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-HuIv|<tuple|HuIv|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Isr1|<tuple|Isr1|24|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Isr2|<tuple|Isr2|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Iv1|<tuple|Iv1|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Iv4|<tuple|Iv4|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-KaKo|<tuple|KaKo|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-KaVo|<tuple|KaVo|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Kea|<tuple|Kea|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Kor1|<tuple|Kor1|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Kor2|<tuple|Kor2|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-LRW|<tuple|LRW|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Lan|<tuple|Lan|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Lev|<tuple|Lev|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Lit|<tuple|Lit|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Man|<tuple|Man|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Meh|<tuple|Meh|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-MoVa|<tuple|MoVa|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Mon1|<tuple|Mon1|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Mon2|<tuple|Mon2|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Mot1|<tuple|Mot1|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Odl1|<tuple|Odl1|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Odl2|<tuple|Odl2|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-RaSa1|<tuple|RaSa1|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-RaSa2|<tuple|RaSa2|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Ram|<tuple|Ram|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-RiLu|<tuple|RiLu|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Rie|<tuple|Rie|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Riv1|<tuple|Riv1|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Riv2|<tuple|Riv2|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Sel|<tuple|Sel|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Sou3|<tuple|Sou3|25|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Sou4|<tuple|Sou4|26|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Sti|<tuple|Sti|26|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Tit3|<tuple|Tit3|26|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Tru3|<tuple|Tru3|26|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Tsa1|<tuple|Tsa1|26|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Tsa2|<tuple|Tsa2|26|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Vin1|<tuple|Vin1|26|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Vin2|<tuple|Vin2|26|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-You|<tuple|You|26|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|bib-Zud|<tuple|Zud|26|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|cor:gamma_sums|<tuple|9|14|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|cor:n_theta|<tuple|8|13|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|cor:xi_function|<tuple|5|6|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:analytic_cont|<tuple|91|16|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:arg_variation|<tuple|79|13|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:bernoulli_def|<tuple|101|18|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:cauchy_simple|<tuple|127|23|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:chandee_sound|<tuple|111|20|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:chi_alt|<tuple|16|3|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:chi_def|<tuple|15|3|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:chi_inverse|<tuple|18|4|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:chi_phase|<tuple|38|7|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:chi_real|<tuple|37|7|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:contour_integral|<tuple|60|11|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:convergence|<tuple|29|5|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:dirichlet_eta|<tuple|92|16|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:divisor_gen|<tuple|10|2|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:divisor_prime|<tuple|11|2|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:entire_part|<tuple|33|6|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:estermann|<tuple|89|15|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:estermann_bound|<tuple|90|16|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:eta_integral|<tuple|64|11|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:eta_symmetry|<tuple|63|11|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:eta_xi_def|<tuple|36|6|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:euler_constant|<tuple|4|1|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:euler_identity|<tuple|87|15|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:explicit_zero_bound|<tuple|110|20|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:farmer_conj1|<tuple|125|22|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:farmer_conj2|<tuple|126|22|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:finite_order|<tuple|107|19|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:first_zeros|<tuple|55|10|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:fourier|<tuple|20|4|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:fourier_coeff|<tuple|21|4|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:func_eq|<tuple|13|3|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:func_eq_alt|<tuple|14|3|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:gamma_bounds|<tuple|82|14|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:gamma_func|<tuple|5|2|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:gamma_identities|<tuple|17|4|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:gamma_integral|<tuple|25|5|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:gamma_integral_eval|<tuple|65|11|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:gamma_product|<tuple|48|8|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:gamma_scaled|<tuple|26|5|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:gaussian_int|<tuple|22|5|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:gaussian_proof|<tuple|100|17|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:gaussian_substitution|<tuple|99|17|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:goldston_gonek|<tuple|115|20|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:hadamard_product|<tuple|69|12|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:hamburger_f|<tuple|104|19|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:hamburger_functional|<tuple|105|19|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:hamburger_result|<tuple|106|19|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:hardy_alt|<tuple|42|7|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:hardy_def|<tuple|12|3|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:hardy_even|<tuple|43|8|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:integral_form|<tuple|94|16|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:landau_euler|<tuple|88|15|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:laurent|<tuple|2|1|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:laurent_stieltjes|<tuple|96|16|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:lh_equivalent|<tuple|85|15|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:lindelof|<tuple|84|14|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:log_deriv|<tuple|6|2|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:log_zeta_relation|<tuple|81|14|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:lower_bound_zeta|<tuple|112|20|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:mangoldt|<tuple|7|2|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:montgomery_log|<tuple|123|22|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:montgomery_rh|<tuple|124|22|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:n_formula|<tuple|57|10|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:n_theta_relation|<tuple|80|13|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:partial_sum|<tuple|93|16|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:pole_contribution|<tuple|62|11|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:psi_def|<tuple|46|8|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:psi_integral|<tuple|95|16|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:r_asymptotic|<tuple|49|8|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:r_def|<tuple|45|8|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:r_derivatives|<tuple|50|9|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:rh_bound|<tuple|83|14|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:rh_s_bound|<tuple|114|20|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:rh_s_improved|<tuple|116|21|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:rho_real_part|<tuple|72|12|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:s_bound|<tuple|58|10|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:s_def|<tuple|56|10|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:s_rh_bound|<tuple|59|10|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:s_rho_real_part|<tuple|73|12|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:selberg|<tuple|86|15|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:selberg_moments|<tuple|117|21|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:selberg_omega|<tuple|118|21|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:squarefree|<tuple|8|2|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:squarefull|<tuple|9|2|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:stieltjes|<tuple|3|1|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:stieltjes_integral|<tuple|97|17|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:stieltjes_values|<tuple|98|17|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:stirling_eval|<tuple|66|11|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:stirling_log|<tuple|47|8|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:strip|<tuple|32|6|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:term_estimate|<tuple|77|13|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:theta_approx|<tuple|52|9|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:theta_asymptotic|<tuple|51|9|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:theta_def|<tuple|23|5|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:theta_def_alt|<tuple|39|7|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:theta_explicit|<tuple|44|8|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:theta_imag|<tuple|40|7|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:theta_odd|<tuple|41|7|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:theta_transform|<tuple|19|4|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:theta_transform_alt|<tuple|24|5|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:trudgian_s_bound|<tuple|113|20|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:tsang_omega|<tuple|119|21|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:tsang_rh|<tuple|120|21|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:tsang_s1|<tuple|122|22|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:tsang_sup|<tuple|121|22|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:vinogradov|<tuple|54|9|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:xi_bound_prep|<tuple|108|19|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:xi_log_deriv|<tuple|61|11|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:xi_order_bound|<tuple|109|20|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zero_count|<tuple|75|13|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zero_density|<tuple|74|12|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zero_free|<tuple|53|9|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zero_sum_bound|<tuple|71|12|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_def|<tuple|1|1|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_difference|<tuple|76|13|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_entire|<tuple|34|6|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_even|<tuple|102|18|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_examples|<tuple|103|18|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_functional|<tuple|31|6|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_integral|<tuple|28|5|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_integral_bound|<tuple|67|11|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_integral_term|<tuple|27|5|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_local|<tuple|78|13|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_log_deriv|<tuple|68|12|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_pole|<tuple|35|6|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_real_part|<tuple|70|12|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|eq:zeta_theta|<tuple|30|5|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|lem:theta_transform|<tuple|4|4|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|rem:chi_property|<tuple|3|4|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|rem:func_eq_alt|<tuple|2|3|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|rem:s_rh|<tuple|7|10|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|sec:basic|<tuple|1|1|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|sec:func_eq|<tuple|2|3|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|sec:hardy|<tuple|3|7|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|sec:zeros|<tuple|4|9|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|thm:func_eq|<tuple|1|3|.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|thm:riemann_mangoldt|<tuple|6|10|.TeXmacs/texts/scratch/no_name_11.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Iv1

      Iv4

      Mot1

      Ram

      Tit3

      Iv1

      Rie

      Iv1

      Rie

      Has

      Rie

      Man

      Tit3

      Rie

      Iv1

      Tit3

      Tit3

      HuIv

      Tit3

      Sel

      Tit3

      HaLi2

      Eul

      Lan

      Est2

      Sti

      Isr1

      Isr2

      Iv1

      Ram

      KaVo

      MoVa

      Tit3

      Iv1

      Iv1

      Ape

      Riv1

      Riv2

      Zud

      Har7

      Har4

      Har5

      Har6

      Har3

      HaWr

      Ham

      Cha

      Vin1

      Vin2

      For1

      For2

      BCRW

      Odl1

      Odl2

      RiLu

      LRW

      Tit3

      COSV

      Sou4

      ChSo

      Sou3

      Tru3

      RaSa2

      GoGo

      Lit

      Kor1

      Kor2

      KaKo

      Sel

      Gho

      Tsa1

      Tit3

      Sel

      Tsa2

      Mon2

      RaSa1

      FGH

      AGZ

      Meh

      Kea

      Mon1

      Iv1

      Tit3

      Iv1

      KaVo

      Lev

      CoGh2

      You

      Con2

      CGG3

      BCY

      Fen
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      basic notions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      functional equation for <with|mode|<quote|math>|\<zeta\><around|(|s|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Properties
      of Hardy's function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      distribution of zeta-zeros> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Notes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>