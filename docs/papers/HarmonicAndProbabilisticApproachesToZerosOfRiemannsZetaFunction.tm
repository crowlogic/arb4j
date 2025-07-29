<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Harmonic and Probabilistic Approaches to Zeros of
  Riemann's Zeta Function>|<doc-author|<author-data|<author-name|M. M.
  Rao>|<author-affiliation|Department of Mathematics, University of
  California, Riverside, California, USA>>>|<doc-date|>>

  <abstract-data|<\abstract>
    Probability concepts and results are closely related to the study of
    zeros of the classical Riemann zeta function and its affinity to Gaussian
    and Gamma distributions. This is elaborated in obtaining the functional
    and integral equations for the zeta and in the determination first of the
    nonzero sets and then sets containing almost all (i.e., for the CLT
    probability measure) nontrivial zeros of the zeta function
    <math|\<zeta\><around|(|\<cdummy\>|)>>. Also probability distributions
    determined by the zeta, based on the behavior of their finite dimensional
    distributions of the <math|\<zeta\>*<around|(|\<sigma\>+i*t|)>>,
    <math|\<sigma\>\<gtr\>0>, as <math|t> varies and particularly the results
    of Denjoy, slightly sharpened, and also one of Salem are included.
    Several related opinions and comments are discussed.
  </abstract>>

  <with|font-series|bold|Keywords:> Central limit theorem; Extended Denjoy's
  approach; Gamma; Gaussian distributions; Littlewood's criterion of
  equivalence of Riemann's hypothesis; Null sets in the problem; Probability
  methods; Trivial zeros; Zero free sets of zeta; Zeros on the critical line;
  Zeta function.

  <with|font-series|bold|Mathematics Subject Classification:> 11M26; 11M06;
  60A10; 60E07; 60F05.

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction
    and the Harmonic Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Another
    Functional Equation for the Zeta> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Non-Zero
    Sets of the Zeta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Nonprobabilistic
    Methods and Consequences> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Denjoy
    Probability Model for Nontrivial Zeta Zeros>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Some
    Additional Results and Comments> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction and the Harmonic Method><label|sec:intro>

  In order to set down the key relationship existing between probability
  theory and the beginnings of Riemann's zeta function, it is desirable to
  recall a pair of fundamental distributions of probability theory, namely,
  the Gamma and the Gaussian classes with parameters <math|s\<gtr\>0>,
  <math|\<sigma\>\<gtr\>0>, as follows:

  <\equation>
    <label|eq:gamma>G<rsub|s><around|(|x|)>=<frac|1|\<Gamma\><around|(|s|)>>*<big|int><rsub|0><rsup|x>e<rsup|-t>*t<rsup|s-1>*d*t,<space|1em>s\<gtr\>0
  </equation>

  and (<math|\<sigma\><rsup|2>> below is the variance parameter)

  <\equation>
    <label|eq:gaussian>\<cal-G\><rsub|\<sigma\>><around|(|x|)>=<frac|1|<sqrt|2*\<pi\>>*\<sigma\>>*<big|int><rsub|-\<infty\>><rsup|x>e<rsup|-<frac|1|2*\<sigma\><rsup|2>>*t<rsup|2>>*d*t,<space|1em>-\<infty\>\<less\>x\<less\>+\<infty\>,\<sigma\>\<gtr\>0
  </equation>

  Starting with equation<nbsp><eqref|eq:gamma> it is seen that, with a change
  of variable and <math|x=\<lambda\>>, <math|s\<gtr\>1>,

  <\equation>
    <label|eq:zeta_integral>1=G<rsub|s><around|(|\<lambda\>|)>=<frac|n<rsup|s>|\<Gamma\><around|(|s|)>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-n*t>*t<rsup|s-1>*d*t
  </equation>

  which implies on summing the rearranged terms the following:

  <\equation>
    <label|eq:zeta_def>\<zeta\><around|(|s|)>*<big|sum><rsub|n=1><rsup|\<infty\>><frac|1|n<rsup|s>>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|s-1>*<big|sum><rsub|n=1><rsup|\<infty\>>e<rsup|-n*t>*d*t=<big|int><rsub|0><rsup|\<infty\>><frac|t<rsup|s-1>|e<rsup|t>-1>*d*t
  </equation>

  Denoting the series on the left by <math|\<zeta\><around|(|s|)>>, one has
  the well-defined zeta function <math|\<zeta\>:<around|(|1,\<infty\>|)>\<to\>\<bbb-R\>>
  with <math|\<zeta\><around|(|1|)>=\<infty\>>, implying that <math|s=1> is a
  simple pole of <math|\<zeta\><around|(|\<cdummy\>|)>>. Using the standard
  complex (contour) integration one can extend
  <math|\<zeta\><around|(|\<cdummy\>|)>> to the complex plane
  <math|\<bbb-C\>> excluding the pole at <math|s=1> using a classical
  argument as follows, with its contour starting from <math|+\<infty\>> in
  the positive plane going to the origin, around it along a circle of radius
  <math|\<epsilon\>\<gtr\>0> and back to <math|+\<infty\>> in the negative
  plane suggested by <math|<around|(|-t|)><rsup|s>=exp <around|(|s*log
  <around|(|-t|)>|)>> where <math|log z> is defined for the complex <math|z>
  as usual. Thus one obtains (the left symbol denotes the contour integral
  from <math|+\<infty\>> circling around the origin in the counter clockwise
  sense to <math|+\<infty\>>):

  <\align>
    <tformat|<table|<row|<cell|<big|oint><rsub|+\<infty\>><rsup|+\<infty\>><frac|<around|(|-t|)><rsup|s>|e<rsup|t>-1>*<frac|d*t|t>>|<cell|=lim<rsub|\<epsilon\>*\<downarrow\>*0><around*|[|<big|int><rsub|+\<infty\>><rsup|\<epsilon\>+><frac|<around|(|-t|)><rsup|s>|e<rsup|t>-1>*<frac|d*t|t>+<big|int><rsub|<around|\||t|\|>=\<epsilon\>>+<big|int><rsub|\<epsilon\>-><rsup|+\<infty\>><frac|<around|(|-t|)><rsup|s>|e<rsup|t>-1>*<frac|d*t|t>|]><eq-number><label|eq:contour>>>|<row|<cell|>|<cell|=lim<rsub|\<epsilon\>*\<downarrow\>*0><around*|[|<big|int><rsub|+\<infty\>><rsup|\<epsilon\>><frac|e<rsup|s*log
    t-i*\<pi\>>|e<rsup|t>-1>*<frac|d*t|t>+<big|int><rsub|\<epsilon\>><rsup|+\<infty\>><frac|e<rsup|s*log
    t+i*\<pi\>>|e<rsup|t>-1>*<frac|d*t|t>|]>+0>>|<row|<cell|>|<cell|=<around|(|e<rsup|i*\<pi\>*s>-e<rsup|-i*\<pi\>*s>|)>*<big|int><rsub|0><rsup|\<infty\>><frac|t<rsup|s-1>|e<rsup|t>-1>*d*t+0>>|<row|<cell|>|<cell|=2*i*sin
    \<pi\>*s\<cdot\>\<zeta\><around|(|s|)><space|1em><text|by
    equation<nbsp><eqref|eq:zeta_def>>>>>>
  </align>

  Next, using the classical identity <math|<frac|\<pi\>|sin
  \<pi\>*s>=\<Gamma\><around|(|s|)>*\<Gamma\>*<around|(|1-s|)>> with
  <math|\<Gamma\><around|(|\<cdummy\>|)>> extended to <math|\<bbb-C\>> using
  standard complex analysis (cf.<nbsp><cite|ahlfors>, p. 198), one obtains
  the (complex) integral expression for <math|\<zeta\><around|(|\<cdummy\>|)>>
  as

  <\equation>
    <label|eq:zeta_complex>\<zeta\><around|(|s|)>=<frac|\<Gamma\>*<around|(|1-s|)>|2*\<pi\>*i>*<big|oint><rsub|+\<infty\>><rsup|+\<infty\>><frac|<around|(|-t|)><rsup|s>|e<rsup|t>-1>*<frac|d*t|t>
  </equation>

  On the other hand with the standard Taylor expansion for
  <math|<frac|t|e<rsup|t>-1>>, <math|<around|\||t|\|>\<gtr\>0>,
  <math|t\<gtr\>0> in equation<nbsp><eqref|eq:zeta_def>, one finds the result

  <\equation>
    <label|eq:taylor><frac|t|e<rsup|t>-1>=<big|sum><rsub|n\<geq\>0><frac|B<rsub|n>*t<rsup|n>|n!>
  </equation>

  where the <math|B<rsub|n>> are the Bernoulli numbers (<math|B<rsub|0>=1>,
  <math|B<rsub|1>=-<frac|1|2>>, <math|B<rsub|2*n+1>=0>, <math|n\<geq\>1> and
  <math|B<rsub|2*n>\<neq\>0>), so that <math|\<zeta\><around|(|s|)>=0> for
  <math|s=-2*n>, <math|n\<geq\>1> called the \Ptrivial zeros\Q of the zeta,
  known from the days of Euler, and that <math|\<zeta\>*<around|(|-n|)>=<frac|<around|(|-1|)><rsup|n>*B<rsub|n+1>|n+1>>,
  <math|\<zeta\>*<around|(|2*n|)>=<frac|<around|(|2*\<pi\>|)><rsup|n>*<around|(|-1|)><rsup|n+1>*B<rsub|2*n>|2*<around|(|2*n|)>!>>,
  <math|n\<gtr\>1>. A natural and basic question is to analyze the
  <math|\<zeta\><around|(|\<cdummy\>|)>> and find its nontrivial zeros, as
  well as the class of sets on which it is nonzero in order to determine its
  analytical properties. This became a key problem, and it was conjectured by
  B. Riemann, after extending it to all of <math|\<bbb-C\>>, that the
  nontrivial zeros of the resulting zeta lie on the line
  <math|\<Re\><around|(|s|)>=<frac|1|2>>, called the critical line, with the
  obvious simple pole at <math|s=1>. There are now many attempts towards
  solving this problem, and in what follows the Fourier or harmonic and
  probabilistic views of this question will be discussed. Indeed some
  probabilistic ideas attached to the Riemann zeta function defined on
  <math|\<bbb-C\>> were considered before, but were inadequately treated by
  nonprobabilists, and the aim here is to explain these situations and
  present the consequences. It is, however, useful to consider a closely
  related situation to equation<nbsp><eqref|eq:zeta_complex> (as I once tried
  briefly in the early 1950s but did not proceed far enough), namely,
  replacing its integrand with the related smooth function
  <math|t\<mapsto\><frac|t<rsup|s-1>|e<rsup|t>+1>>, and expanded the latter
  again by Taylor's series and evaluated several coefficients
  <math|M<rsub|n>> for properties in:

  <\equation>
    <label|eq:taylor_alt><frac|t|e<rsup|t>+1>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|M<rsub|n>*t<rsup|n>|n!>
  </equation>

  Now realizing the relation that <math|<frac|x|e<rsup|x>+1>=<frac|x|e<rsup|x>-1>-<frac|2*x|e<rsup|2*x>-1>>
  it is seen that <math|M<rsub|n>=B<rsub|n>*<around|(|1-2<rsup|n>|)>>. This
  did not seem to reveal much, where the <math|B<rsub|n>> are Bernoulli
  numbers given earlier. However, the zeta function itself was not critically
  used. But complexifying and writing <math|s=\<sigma\>+i*t> one gets the
  integral from equation<nbsp><eqref|eq:zeta_def> as
  <math|<big|int><rsub|0><rsup|\<infty\>>x<rsup|\<sigma\>-1>*e<rsup|i*t*log
  x>*<frac|d*x|e<rsup|x>+1>>. By a change of variables this can be written as
  <math|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|u>|e<rsup|e<rsup|u>>+1>*e<rsup|i*u*t>*d*u=<big|int><rsub|\<bbb-R\>>K<rsub|\<sigma\>><around|(|u|)>*e<rsup|i*u*t>*d*u>,
  which is the Fourier transform of the integrable kernel
  <math|u\<mapsto\>K<rsub|\<sigma\>><around|(|u|)>>. It then satisfies on
  using the relation<nbsp><eqref|eq:zeta_complex> the following important
  equation:

  <\equation>
    <label|eq:salem>\<zeta\><around|(|s|)>*<around|(|1-2<rsup|1-s>|)>*\<zeta\><around|(|s|)>=<big|int><rsub|\<bbb-R\>>K<rsub|\<sigma\>><around|(|u|)>*e<rsup|i*u*t>*d*u
  </equation>

  where <math|s=\<sigma\>+i*t>. It was then recognized by
  Salem<nbsp><cite|salem> that the right side of
  equation<nbsp><eqref|eq:salem> can be zero, using a known theorem of
  Norbert Wiener, so that <math|\<zeta\>*<around|(|\<sigma\>+i*t|)>=0>,
  <math|0\<less\>\<sigma\>\<less\>1> if and only if the integral equation

  <\equation>
    <label|eq:integral_eq><big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|\<sigma\>>*<around|(|x-y|)>*\<phi\><around|(|y|)>*d*y=0
  </equation>

  has a nontrivial integrable solution <math|\<phi\>>. Thus this implies that
  existence of roots of <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>=0> is
  equivalent to the existence of a nontrivial solution of the above integral
  equation! The result may be stated as:

  <\theorem>
    <label|thm:salem>The zeta function <math|\<zeta\>*<around|(|\<sigma\><rsub|0>+i*t|)>=0>
    for some <math|<around|(|0\<less\>\<sigma\><rsub|0>\<less\>1|)>> has
    roots if and only if the integral equation

    <\equation>
      <label|eq:salem_integral><big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|\<sigma\><rsub|0>>*<around|(|x-y|)>*\<phi\><around|(|y|)>*d*y=0
    </equation>

    has a nontrivial integrable solution <math|\<phi\>> for the kernel
    <math|K<rsub|\<sigma\><rsub|0>><around|(|\<cdummy\>|)>> given above.
  </theorem>

  Thus it can be concluded that the Riemann Hypothesis (RH) is equivalent to
  a purely classical analysis question finding a nontrivial solution of this
  integral equation. But the existence of such a solution is still
  unavailable. Consequently it is useful to consider another approach
  starting this time with the second relation, the Gaussian
  distribution<nbsp><eqref|eq:gaussian>, leading to a different functional
  equation for the <math|\<zeta\><around|(|\<cdummy\>|)>>, which can lead to
  a solution of the RH. This will next be detailed.

  <section|Another Functional Equation for the Zeta><label|sec:functional>

  It will now be seen, with a basic relation between the Gaussian
  distribution<nbsp><eqref|eq:gaussian> and its Fourier transform along with
  an interesting consequence of a classical theorem due to Fejér
  (cf.<nbsp><cite|zygmund>, p. 45), that another important functional
  equation satisfied by <math|\<zeta\><around|(|\<cdummy\>|)>> can be
  obtained. It will also be seen of importance in the present study. This is
  based on a more probabilistic and an analytical property of the
  distribution<nbsp><eqref|eq:gaussian> and its Fourier transform.

  The well-known characteristic function (or Fourier transform) of the other
  distribution<nbsp><eqref|eq:gaussian>, with density denoted
  <math|<wide|g|~><around|(|\<cdummy\>,\<sigma\>|)>>, is given by

  <\equation>
    <label|eq:char_func><wide|<wide|g|~>|^><around|(|t,\<sigma\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*x>*<wide|g|~><around|(|x,\<sigma\>|)>*d*x=e<rsup|-<frac|\<sigma\><rsup|2>*t<rsup|2>|2>>
  </equation>

  To exploit the fact that both <math|<wide|g|~>>, <math|<wide|g|^>> are
  exponentials and to use a powerful classical result due to Fejér
  (cf.<nbsp><cite|zygmund>) let <math|\<sigma\><rsup|2>=<frac|\<pi\><rsup|2>|t>>,
  <math|t\<gtr\>0>, and the probability density <math|<wide|g|~>> of
  equation<nbsp><eqref|eq:gaussian> becomes
  <math|<wide|<wide|g|~>|^><around|(|t,x|)>=<sqrt|<frac|t|\<pi\>>>*e<rsup|-<frac|t*x<rsup|2>|\<pi\>>>>.
  Then <math|<wide|g|^><around|(|t,u|)>=<frac|1|<sqrt|t>>*e<rsup|-<frac|\<pi\>*u<rsup|2>|t>>>.
  Since both <math|<wide|g|~><around|(|t,\<cdot\>|)>> and
  <math|<wide|<wide|g|~>|^><around|(|t,\<cdot\>|)>> are continuous for each
  <math|t\<gtr\>0>, where <math|<wide|<wide|g|~>|^><around|(|t,\<cdot\>|)>>
  is also <math|L<rsup|1><around|(|\<bbb-R\>|)>>-summable, one has the
  following remarkable relation (known as Poisson's summation formula)
  between the Gaussian density and its characteristic function given by
  equation<nbsp><eqref|eq:char_func> (the easy verification is omitted):

  <\equation>
    <label|eq:poisson><big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>e<rsup|-\<pi\>*k<rsup|2>*t>=t<rsup|-<frac|1|2>>*<big|sum><rsub|k=-\<infty\>><rsup|\<infty\>>e<rsup|-<frac|\<pi\>*k<rsup|2>|t>>,<space|1em>t\<gtr\>0
  </equation>

  This relation was already employed by Riemann in 1859, based on Jacobi's
  earlier work (see<nbsp><cite|edwards>) and it is also termed a theta
  function relation, recalled as follows. It is seen from using the
  representation in equation<nbsp><eqref|eq:zeta_complex> which can be
  simplified as:

  <\equation>
    <label|eq:zeta_theta>\<Gamma\><around*|(|<frac|s|2>|)>*\<pi\><rsup|-<frac|s|2>>*\<zeta\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>\<vartheta\><around|(|x|)>*x<rsup|<frac|s|2>>*<frac|d*x|x>
  </equation>

  where <math|\<vartheta\><around|(|x|)>=<big|sum><rsub|k=1><rsup|\<infty\>>e<rsup|-k<rsup|2>*\<pi\>*x>>,
  <math|x\<gtr\>0>, and by equation<nbsp><eqref|eq:poisson> it satisfies the
  known and useful relation:

  <\equation>
    <label|eq:theta_relation>1+2*\<vartheta\><around|(|x|)>=<frac|1|<sqrt|x>>*<around|(|1+2*\<vartheta\><around|(|x<rsup|-1>|)>|)>,<space|1em>x\<gtr\>0
  </equation>

  Now, from equations<nbsp><eqref|eq:zeta_theta>
  and<nbsp><eqref|eq:theta_relation>, along with some well-known (but not
  entirely easy) manipulations, one can rewrite the right side of
  equation<nbsp><eqref|eq:zeta_theta> as:

  <\align>
    <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>x<rsup|<frac|s|2>>*\<vartheta\><around|(|x|)><frac|d*x|x>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>\<vartheta\><around|(|x|)>*<around*|(|x<rsup|<frac|s|2>>+x<rsup|<frac|1-s|2>>|)>*<frac|d*x|x>+<frac|1|2>*<big|int><rsub|0><rsup|1><around*|(|x<rsup|-<frac|s+1|2>>-x<rsup|-<frac|s|2>>|)>*<frac|d*x|x><eq-number><label|eq:zeta_manipulation>>>|<row|<cell|>|<cell|=<frac|1|s*<around|(|s-1|)>>+<big|int><rsub|1><rsup|\<infty\>><around*|(|x<rsup|-<frac|s|2>>+x<rsup|<frac|s|2>-1>|)>*\<vartheta\><around|(|x|)><frac|d*x|x>>>>>
  </align>

  Next, this relation after a simplification, using some properties of the
  gamma function and a calculation with the integrals, gives the following
  result (all based on properties of the probability
  distribution<nbsp><eqref|eq:gaussian>):

  <\align>
    <tformat|<table|<row|<cell|\<Gamma\><around*|(|<frac|s|2>|)>*\<pi\><rsup|-<frac|s|2>>*\<zeta\><around|(|s|)>>|<cell|=\<Gamma\><around*|(|<frac|s|2>|)>*<big|int><rsub|1><rsup|\<infty\>>\<vartheta\><around|(|x|)>*<around*|(|x<rsup|<frac|s|2>>+x<rsup|<frac|1-s|2>>|)>*<frac|d*x|x>-<frac|1|s*<around|(|s-1|)>><eq-number><label|eq:functional_derivation>>>|<row|<cell|>|<cell|=\<pi\><rsup|-<frac|1-s|2>>*\<Gamma\><around*|(|<frac|1-s|2>|)>*\<zeta\>*<around|(|1-s|)>>>>>
  </align>

  This is the well-known Riemann functional equation. It is based on the
  Fourier transform of the Gaussian distribution and Fejér's key theorem on
  summability (cf.<nbsp><cite|zygmund>). This forms a basic step in obtaining
  properties of the zeta function. The above work can be summarized as:

  <\theorem>
    <label|thm:functional>The <math|\<zeta\><around|(|\<cdummy\>|)>> extended
    to the complex plane is regular except for a simple pole at <math|s=1>,
    with residue 1, and satisfies the functional equation

    <\equation>
      <label|eq:riemann_functional>\<Gamma\><around*|(|<frac|s|2>|)>*\<pi\><rsup|-<frac|s|2>>*\<zeta\><around|(|s|)>=\<pi\><rsup|-<frac|1-s|2>>*\<Gamma\><around*|(|<frac|1-s|2>|)>*\<zeta\>*<around|(|1-s|)>,<space|1em>s\<in\>\<bbb-C\>
    </equation>
  </theorem>

  Thus far it is found that <math|\<zeta\><around|(|s|)>=<big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-s>>
  has an obvious pole at <math|s=1> and the \Ptrivial\Q zeros at negative
  even integers on the real line. Moreover
  <math|\<zeta\><around|(|0|)>=-<frac|1|2>>,
  <math|\<zeta\>*<around|(|-1|)>=-<frac|1|12>>,
  <math|\<zeta\>*<around|(|-3|)>=<frac|1|120>>, and one already knows from
  Euler's work that <math|\<zeta\>*<around|(|2*n|)>=<frac|<around|(|2*\<pi\>|)><rsup|n>*<around|(|-1|)><rsup|n+1>*B<rsub|2*n>|2*<around|(|2*n|)>!>>.
  But on studying the problem of complex zeros of
  <math|\<zeta\><around|(|\<cdummy\>|)>>, Riemann stated, without any
  motivations or reasons, that \Pvery likely\Q all the complex zeros have
  their real part as <math|<frac|1|2>>, and this conjecture is also termed
  the Riemann Hypothesis (RH). First, let us consider large non-zero sets of
  <math|\<zeta\><around|(|\<cdummy\>|)>> in <math|\<bbb-C\>> using purely
  probabilistic analysis, and then turn to a determination of the zero sets
  based on Theorem<nbsp><reference|thm:functional>, with some other related
  direct approaches as a prelude to the consideration of a chance mechanism
  and its probability model constructed for the problem.

  <section|Non-Zero Sets of the Zeta Function><label|sec:nonzero>

  The zeta function was originally derived by Riemann from the classical
  Euler product representation of prime numbers and the fundamental theorem
  of arithmetic, namely that every positive integer is simply the product of
  a (finite) set of primes <math|p\<gtr\>1> that divide it. Thus,

  <\equation>
    <label|eq:euler_product>\<zeta\><around|(|s|)>=<big|prod><rsub|p><around|(|1-p<rsup|-s>|)><rsup|-1>
  </equation>

  which implies at once, from <math|\<zeta\><around|(|1|)>=\<infty\>>, the
  fact that there are infinitely many prime numbers, and, moreover,
  <math|s\<mapsto\>\<zeta\><around|(|s|)><rsup|-1>=<big|prod><rsub|p><around|(|1-p<rsup|-s>|)>>
  is an entire function on <math|\<bbb-C\>>. Many workers on RH seem to be
  unfamiliar with the following useful probabilistic argument and
  application. If <math|s=\<sigma\>+i*t\<in\>\<bbb-C\>> it follows from
  Khintchine's<nbsp><cite|khintchine> work that
  <math|t\<mapsto\>\<zeta\>*<around|(|\<sigma\>+i*t|)>> is positive definite
  and never vanishes for any <math|\<sigma\>\<gtr\>1>. More precisely, this
  fact, obtained using probability theory with a simple direct proof, will be
  presented here for information and appreciation of nonprobabilistic
  workers; but it also has independent interest and is due to Khintchine.

  <\proposition>
    <label|prop:khintchine>The mapping <math|\<bbb-R\>\<ni\>t\<mapsto\>\<zeta\>*<around|(|\<sigma\>+i*t|)>>,
    <math|\<sigma\>\<gtr\>1>, is an infinitely divisible characteristic
    function and consequently never vanishes. So
    <math|s\<mapsto\>\<zeta\><around|(|s|)>> is a nonzero entire function in
    the right half plane determined by <math|\<sigma\>\<gtr\>1> of
    <math|\<bbb-C\>> where <math|s=\<sigma\>+i*t>.
  </proposition>

  <\proof>
    Replacing <math|s=\<sigma\>+i*t> in the Euler product
    representation<nbsp><eqref|eq:euler_product> and considering a suitable
    (principal for definiteness) branch of the complex logarithm one has

    <\align>
      <tformat|<table|<row|<cell|log \<zeta\>*<around|(|\<sigma\>+i*t|)>>|<cell|=<big|sum><rsub|p><around*|[|log
      <around|(|1-p<rsup|-\<sigma\>>|)>-log
      <around|(|1-p<rsup|-\<sigma\>-i*t>|)>|]><eq-number><label|eq:log_zeta>>>|<row|<cell|>|<cell|=<big|sum><rsub|p><big|sum><rsub|m=1><rsup|\<infty\>>p<rsup|-m*\<sigma\>>*<around|(|p<rsup|-i*m*t>-1|)>/m>>|<row|<cell|>|<cell|=<big|sum><rsub|p><big|sum><rsub|m=1><rsup|\<infty\>>p<rsup|-m*\<sigma\>>*<around|(|e<rsup|-i*m*t*log
      p>-1|)>/m>>>>
    </align>

    and each of the inside terms of the display above is the logarithm of the
    characteristic function of a Poisson distribution with parameter
    <math|log p\<gtr\>0>. Consequently it is infinitely divisible (i.d.).
    Since <math|\<zeta\>> is the product of a countable collection of i.d.
    characteristic functions, continuous at <math|t=0>, is itself i.d., and
    so never vanishes by the well-known Lévy-Khintchine representation
    theorem. The positive definiteness of <math|\<zeta\>> is then a simple
    consequence. This implies all the assertions.
  </proof>

  Regarding the existence of nontrivial zeros, it was noted by
  Gram<nbsp><cite|gram> that there are exactly 15 solutions of
  <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>=0> for
  <math|0\<less\>t\<less\>50>, and evaluated each zero to a few decimal
  places, giving substance to the original Riemann conjecture. The general
  status by traditional (non probabilistic) methods will first be described
  before the probability considerations of the problem are presented. It
  should also be noted here that Odlyzko<nbsp><cite|derbyshire> has computed
  some zeros of <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>>, in fact over
  <math|10<rsup|22>>. An interesting account of this and some other works
  with comments is described in the popular book by
  Derbyshire<nbsp><cite|derbyshire> wherein Odlyzko's efforts are given in
  some detail.

  <section|Nonprobabilistic Methods and Consequences><label|sec:nonprob>

  The concrete example of Gram about the existence of a few zeros of
  <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>> prompted several attempts,
  approaches as well as extensions of the RH, in estimating the zeros of
  <math|\<zeta\><around|(|\<cdummy\>|)>> on the critical line
  <math|<around|{|<frac|1|2>+i*t:t\<in\>\<bbb-R\>|}>>. In 1914,
  Hardy<nbsp><cite|hardy> announced, with complete details later in Hardy and
  Littlewood<nbsp><cite|hardy_littlewood>, that
  <math|\<zeta\><around|(|\<cdummy\>|)>> actually has infinitely many zeros
  on the critical line that is parallel to the <math|y>-axis through the
  point <math|<frac|1|2>\<in\>\<bbb-R\>>.

  To initiate a different attack, consider now the reciprocal of the Euler
  product<nbsp><eqref|eq:euler_product> and expand it to obtain:

  <\equation>
    <label|eq:zeta_reciprocal>\<zeta\><rsup|\<ast\>><around|(|s|)>=<frac|1|\<zeta\><around|(|s|)>>=<big|prod><rsub|p><around|(|1-p<rsup|-s>|)>=1-<frac|1|2<rsup|s>>+<frac|1|3<rsup|s>>-<frac|1|5<rsup|s>>+<frac|1|6<rsup|s>>-\<cdots\>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<mu\><around|(|n|)>|n<rsup|s>>
  </equation>

  where <math|\<mu\><around|(|\<cdummy\>|)>> is the Möbius function defined
  as <math|\<mu\><around|(|n|)>=+1,0,-1> accordingly as <math|n> is a product
  of odd number of distinct primes, divisible by a square integer, or a
  product of an even number of primes respectively. The fact that
  <math|\<zeta\><rsup|\<ast\>><around|(|1|)>=0> was already asserted by Euler
  in 1750, but its convergence property seems to have been established much
  later by von Mangoldt<nbsp><cite|mangoldt>. Consider the Mertens function
  <math|M> which changes its values only at integers by steps, given as
  <math|M<around|(|x|)>=<big|sum><rsub|n\<less\>x>\<mu\><around|(|n|)>> so
  that <math|(M(n-)+M(n+<around|)||)>/2=<big|sum><rsub|k=1><rsup|n-1>\<mu\><around|(|k|)>+\<mu\><around|(|n|)>/2>.
  It is seen that <math|<around|\||M|(>\<cdot\>)\|\<uparrow\>*\<infty\>>,
  <math|<around|\||M<around|(|x|)>|\|>\<leq\>x>, <math|x\<gtr\>0> and using
  integration by parts of the Stieltjes integral for
  <math|\<zeta\><rsup|\<ast\>>> one finds its useful relation as
  <math|\<zeta\><rsup|\<ast\>><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|-s>*d*M<around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>M<around|(|x|)>*x<rsup|-s-1>*d*x>,
  since <math|<around|\||M<around|(|x|)>|\|>\<leq\><around|\||x|\|>>,
  <math|<math-up|Re><around|(|s|)>\<less\>1>. Then
  <math|x<rsup|-s>*M<around|(|x|)>\<to\>0> as <math|x\<to\>\<infty\>>,
  <math|s=\<sigma\>+i*t>, <math|\<sigma\>\<gtr\>1>. Moreover,
  <math|\<zeta\><rsup|\<ast\>><around|(|s|)>> converges for all <math|s>,
  <math|<math-up|Re><around|(|s|)>\<gtr\>a\<gtr\>0> and grows at the rate of
  <math|x<rsup|a>>, <math|x\<gtr\>0>, <math|0\<less\>a\<less\><frac|1|2>>.
  The following relation, obtained already by
  Littlewood<nbsp><cite|littlewood1912>, will play a key role also in the
  probabilistic analysis as it shifts the attention temporarily away from
  <math|\<zeta\>>.

  The result is obtained by using Hadamard's 'three circle theorem' of
  complex analysis. This is used in the probabilistic approach of the problem
  with a positive solution using a new and different argument.

  <\theorem>
    [Littlewood<nbsp><cite|littlewood1912>]<label|thm:littlewood>With the
    Mertens function <math|M> given above, for each
    <math|\<epsilon\>\<gtr\>0>, <math|M<around|(|x|)>*x<rsup|-<frac|1|2>-\<epsilon\>>\<to\>0>
    as <math|x\<to\>\<infty\>> if and only if the RH holds so that these are
    equivalent assertions.
  </theorem>

  The details of proof of this result are available in several books (cf.
  e.g.<nbsp><cite|edwards>). This will allow one to shift the view to
  <math|M<around|(|\<cdummy\>|)>> and away from
  <math|\<zeta\><around|(|\<cdummy\>|)>> temporarily, leading to the
  introduction of a probability model. The resulting analysis admits a
  solution based on a suitable central limit theorem of probability theory.
  This depends on a certain behavior of primes among the natural numbers
  suggestive of their 'unpredictable behavior' and appearance which
  Kaç<nbsp><cite|kac> refers it as a \Pgame of chance\Q. Such a relation was
  already exploited by Denjoy<nbsp><cite|denjoy> and an analogous condition
  will be exhibited below.

  <section|Denjoy Probability Model for Nontrivial Zeta
  Zeros><label|sec:denjoy>

  The starting point here is to consider all positive integers <math|n> with
  square free divisors so that <math|\<mu\><around|(|n|)>\<neq\>0> and denote
  all others as <math|\<cal-S\>\<subset\><around|{|1,2,\<ldots\>|}>=\<bbb-N\>>.
  This collection is about <math|1-<frac|1|\<zeta\><around|(|2|)>>> in
  proportion so that by Euler's formula, its value is
  <math|<frac|6|\<pi\><rsup|2>>>. The integers <math|n> from <math|\<cal-S\>>
  which are products of even and odd primes are denoted
  <math|\<cal-S\><rsub|i>>, <math|i=1,2> on which
  <math|\<mu\><around|(|n|)>=1,-1> respectively. They have corresponding
  proportions each <math|=<frac|3|\<pi\><rsup|2>>>, so that the sets
  <math|\<cal-S\><rsub|i>>, <math|i=1,2> can be given as follows. If
  <math|\<bbb-N\>>, the set of integers, is assigned 'volume' one, then the
  corresponding sets of <math|\<cal-S\>>, and <math|\<cal-S\><rsub|i>>,
  <math|i=1,2> will have 'sizes' <math|<frac|3|\<pi\><rsup|2>>>, <math|i=1,2>
  and <math|\<cal-S\><rsup|c>> will have its size
  <math|1-<frac|6|\<pi\><rsup|2>>>. Then one defines a probability measure
  <math|P> on the power set of <math|\<bbb-N\>>, so that the functions
  <math|\<mu\><around|(|n|)>=0,\<pm\>1> will become pairwise independent with
  <math|P*<around|(|\<mu\><around|(|n|)>=1|)>=P*<around|(|\<mu\><around|(|n|)>=-1|)>=\<alpha\>>
  where <math|\<alpha\>=<frac|3|\<pi\><rsup|2>>> and
  <math|P*<around|(|\<mu\><around|(|n|)>=0|)>=1-<frac|6|\<pi\><rsup|2>>>.

  The existence of such a (<math|\<sigma\>>-additive) probability <math|P> is
  not obvious. It should be approached by starting with the uniform counting
  measure on finite sets <math|<around|{|1,2,\<ldots\>,n|}>> as its
  \Pempirical distribution\Q determined by the zeta function and showing that
  the sequence is weakly convergent to a probability measure <math|P>
  relative to which the <math|\<mu\><around|(|\<cdummy\>|)>> become
  (pairwise) independent random variables. Here one has to use the key fact
  that the density of prime numbers is approximately given by
  <math|<around|(|log x|)><rsup|-1>>, <math|x\<gtr\>1>. The existence of such
  a <math|P> was implicitly assumed by Denjoy<nbsp><cite|denjoy> in his
  formulation. Here one needs to refer and use essentially the work of Jensen
  and his collaborators (see, e.g.<nbsp><cite|laurincikas> for the details)
  with extensions. This important fact, which is implicit in Denjoy's work,
  is made explicit here for clarity and will be used. The procedure is
  suggested by the classical weak limit theorems of probability and needs a
  nontrivial analysis suggested by the works of Erd®s and Kaç for the central
  limit theory based on the prime divisor function (analogous to the present
  <math|\<mu\><around|(|\<cdummy\>|)>>). [See
  also<nbsp><cite|billingsley|kac>]. The essential method in proving the
  limit probability measure here is the convergence of moments instead of
  using the Fourier analysis or characteristic functions of the classical
  probability theory. With this preamble, the pairwise independence of the
  <math|\<mu\><around|(|\<cdummy\>|)>>'s is taken to be valid (slightly
  weaker than the original assumption of Denjoy's<nbsp><cite|denjoy>). Such a
  weakening to pairwise independence is useful also to counter
  Edwards'<nbsp><cite|edwards> skeptical comments on mutual independence in
  the Denjoy approach. The weakened condition is actually sufficient here.

  Thus, one has <math|P*<around|(|\<mu\><around|(|n|)>=+1|)>=<frac|3|\<pi\><rsup|2>>=P*<around|(|\<mu\><around|(|n|)>=-1|)>>
  and <math|P*<around|(|\<mu\><around|(|n|)>=0|)>=1-<frac|6|\<pi\><rsup|2>>\<gtr\>0>,
  the variables <math|\<mu\><around|(|n|)>> being pairwise independent. Their
  means and variances are given by <math|E<around|(|\<mu\><around|(|n|)>|)>=0>
  and <math|<math-up|Var><around|(|\<mu\><around|(|n|)>|)>=<frac|6|\<pi\><rsup|2>>>.
  The Mertens function <math|M<around|(|n|)>=<big|sum><rsub|i=1><rsup|n>\<mu\><around|(|i|)>>
  thus has mean zero and variance <math|<math-up|Var><around|(|M<around|(|n|)>|)>/n=<frac|3|\<pi\><rsup|2>>>.
  Now the variances have to satisfy <math|<frac|<math-up|Var><around|(|M<around|(|n|)>|)>|n>\<to\>\<sigma\><rsup|2>>,
  which is an appropriate condition to validate the central limit theorem (or
  CLT) for pairwise independent random variables (see for
  instance<nbsp><cite|rao>, p. 399). With this condition satisfied, it is
  concluded that

  <\equation>
    <label|eq:clt>lim<rsub|n\<to\>\<infty\>>
    P<rsub|n>*<around*|(|<frac|M<rsub|n>-0|<sqrt|\<sigma\><rsup|2><math-up|Var><around|(|M<around|(|n|)>|)>>>\<leq\>x|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|x>e<rsup|-u<rsup|2>/2>*d*u
  </equation>

  and then it implies immediately that the sequence
  <math|<around|{|M<around|(|n|)>/<sqrt|n>|}><rsub|n\<geq\>1>>, is bounded in
  probability, where <math|\<sigma\><rsup|2>=<frac|6|\<pi\><rsup|2>>>.
  Consequently, one has

  <\equation>
    <label|eq:prob_result>lim<rsub|n\<to\>\<infty\>>
    P<rsub|n>*<around|(|<around|\||M<around|(|n|)>|\|>*n<rsup|-<frac|1|2>-\<epsilon\>>\<leq\>x|)>*n<rsup|-\<epsilon\>>=0
  </equation>

  This shows that <math|<around|\||M<around|(|n|)>|\|>*n<rsup|-<frac|1|2>-\<epsilon\>>\<to\>0>,
  with probability 1 for each <math|\<epsilon\>\<gtr\>0>, and hence by
  (Littlewood's) Theorem<nbsp><reference|thm:littlewood> above this implies
  that the RH holds with probability 1. The preceding discussion establishes:

  <\theorem>
    <label|thm:denjoy>Under the above conditions leading to pairwise
    independence of <math|\<mu\><around|(|n|)>>, it follows that
    <math|M<around|(|n|)>*n<rsup|-<frac|1|2>-\<epsilon\>>\<to\>0> with
    probability 1, for each <math|\<epsilon\>\<gtr\>0>, so that RH holds with
    probability 1, by an appropriate CLT application.
  </theorem>

  It should be observed that the original RH desires that the probability
  zero set should actually be empty. In the probability limit theory, one
  cannot show generally that the exceptional null set is empty. However, the
  (weaker) assertion may still be of interest since there are many results in
  the literature based on assuming the validity of RH. For instance, the main
  theorem in Chapter 7 of<nbsp><cite|laurincikas>, assumes this result. The
  author was informed that the late D. D. Kosambi of the Tata Institute of
  Fundamental Research in Bombay (now Mumbai) has a probabilistic proof of
  the RH, but it does not seem to have been well-known. [Even the late J. L.
  Doob who was Kosambi's Harvard class mate once mentioned that he heard of
  this matter in the 1960s. It may be of interest to note that Émile Borel,
  one of the founders of modern Probability Theory, has communicated Denjoy's
  result to the French Academy while Salem's note was presented by Denjoy to
  the same Academy 22 years later.]

  <section|Some Additional Results and Comments><label|sec:comments>

  Here some remarks of special interest on the work included above are added
  for information and reference.

  <\enumerate>
    <item>There exist other probability models applied to the prime number
    theorem that have an analogy of the problem considered here. Most notable
    is the one by Cramér<nbsp><cite|cramer>, and a detailed commentary on its
    interest and limitations were discussed by
    Greenville<nbsp><cite|grenville>.

    <item>In Theorem<nbsp><reference|thm:denjoy>, the pairwise independence
    can be weakened further to \P<math|m>-dependence.\Q The corresponding
    central limit theorem is still valid, as seen in the above reference for
    the same variance condition.

    <item>Regarding elimination of the null sets<nbsp><cite|kahane> states,
    for instance, that the series

    <\equation>
      <label|eq:random_series><big|sum><rsub|k=1><rsup|\<infty\>>x<rsub|k>*\<epsilon\><rsub|k>*cos
      <around|(|n*t+b<rsub|k>|)>=F<around|(|t|)>
    </equation>

    converges and defines <math|F<around|(|\<cdummy\>|)>> with probability
    one, where the <math|<around|{|\<epsilon\><rsub|k>|}><rsub|k\<geq\>1>>
    are independent Rademacher functions so that
    <math|P*<around|(|\<epsilon\><rsub|k>=+1|)>=P*<around|(|\<epsilon\><rsub|k>=-1|)>=<frac|1|2>>,
    if and only if

    <\equation>
      <label|eq:convergence_condition><big|sum><rsub|k=1><rsup|\<infty\>>x<rsub|k><rsup|2>\<less\>\<infty\>
    </equation>

    by a classical theorem due to Kolmogorov. However on the <math|P>-null
    set there exists a choice of the signs <math|\<pm\>> such that
    <math|<big|sum><rsub|k=1><rsup|\<infty\>>\<pm\>x<rsub|k>*cos
    <around|(|k*t+b<rsub|k>|)>> does not determine a Fourier-Stieltjes
    series. But it is not known how to construct such a sequence of signs and
    such a function. This will exemplify the structure of probability zero
    sets.

    <item>In a general discussion on RH, the great
    Littlewood<nbsp><cite|littlewood1962>, who has spent a large part of his
    research with many papers on RH, says that he believes RH which demands
    ALL zeros of <math|\<zeta\>*<around|(|<frac|1|2>+i*t|)>> are on the line
    <math|t\<in\>\<bbb-R\>> to be false, and that there is no reason for it
    to be true as conjectured. This comment comes after the author's disproof
    of the long standing conjecture by Gauss that
    <math|\<pi\><around|(|x|)>\<less\><math-up|Li><around|(|x|)>> where
    <math|\<pi\><around|(|x|)>> denotes the number of primes less than
    <math|x> and <math|<math-up|Li><around|(|x|)>=<big|int><rsub|2><rsup|x><frac|d*t|log
    t>+>constant, <math|x\<gtr\>2>. The failure apparently occurs for
    infinitely many large values of <math|x> starting at
    <math|10<rsup|4\<cdot\>3>>, where <math|10<rsup|1><around|(|x|)>=10<rsup|x>>
    and for <math|k\<gtr\>1>, <math|10<rsup|k><around|(|x|)>=10<rsup|10<rsup|k-1><around|(|x|)>>>,
    which was verified by Skewes.

    <item>In another direction it follows from
    Levinson's<nbsp><cite|levinson> study that 'almost all' (nontrivial)
    roots of <math|\<zeta\><around|(|s|)>=0> are 'near' the critical line
    <math|s=<frac|1|2>+i*t>, <math|t\<in\>\<bbb-R\>> and the same is even
    true of the roots of <math|\<zeta\><around|(|s|)>=a>. This is clearly
    quite analogous to the probabilistic statement presented in
    Theorem<nbsp><reference|thm:denjoy>.

    <item>Since the successful proof of the generalized RH of Weil by Deligne
    in 1980, many mathematicians believe in the truth of the original RH and
    it carries the millennium prize (of a million dollars) for its proof. A
    strong positive belief is expressed by Bombieri, and especially by
    Sarnak<nbsp><cite|sarnak>, among others (justifying the prize for its
    solution).

    <item>Extending the Kahane statement, going a step further, some
    researchers express the feeling that the RH, as stated is perhaps
    undecidable and a numerical verification by super computers is not
    possible in any reasonable future as exemplified by the Gauss conjecture
    noted in Point 4. above. Hence a probabilistic solution of the Denjoy
    type may have an interest and use.
  </enumerate>

  <\thebibliography|99>
    <bibitem|ahlfors>Ahlfors, L.V. 1975. <em|Complex Analysis> (3rd. ed.).
    McGraw-Hill, New York.

    <bibitem|billingsley>Billingsley, P. 1995. <em|Probability and Measure>
    (3rd ed.). Wiley, New York.

    <bibitem|cramer>Cramér, H. 1935. Prime numbers and probability.
    <em|Skand. Math.-Kong.> 8:107\U115.

    <bibitem|denjoy>Denjoy, A. 1931. L'hypothése de Riemann sur la
    distribution des zéros de <math|\<zeta\><around|(|s|)>>, reliée à la
    théorie des probabilities. <em|C.<nbsp>R.<nbsp>Acad.<nbsp>Sci., (Paris)>
    192:656\U658.

    <bibitem|derbyshire>Derbyshire, J. 2003. <em|Prime Obsession>. J. Henry
    Press, Washington, D.C.

    <bibitem|edwards>Edwards, H.M. 1974. <em|Riemann Zeta Function>. Academic
    Press, New York.

    <bibitem|gram>Gram, J.-P. 1903. Note sur les zéros de la Fonction
    <math|\<zeta\><around|(|s|)>> de Riemann. <em|Acta Math.> 27:289\U304.

    <bibitem|grenville>Grenville, A. 1995. Harald Cramér and the distribution
    of prime numbers. <em|Skand. Actuar. J.> 1:1\U16.

    <bibitem|hardy>Hardy, G.H. 1914. Sur les zéros de la Fonction
    <math|\<zeta\><around|(|s|)>> de Riemann.
    <em|C.<nbsp>R.<nbsp>Acad.<nbsp>Sci., Paris> 158:1012\U1014.

    <bibitem|hardy_littlewood>Hardy, G.H. and Littlewood, J.E. 1921. The
    zeros of the Riemann zeta function on the critical line. <em|Math. Z.>
    10:283\U317.

    <bibitem|kac>Kaç, M. 1959. <em|Statistical Independence in Probability,
    Analysis, and Number Theory>. Wiley, New York.

    <bibitem|kahane>Kahane, J.-P. 1985. <em|Some Random Series of Functions>
    (2nd ed.). Cambridge University Press, Cambridge, UK.

    <bibitem|khintchine>Khintchine, A.I. 1923. Über dyadische Brüche.
    <em|Math. Z.> 18:107\U116.

    <bibitem|laurincikas>Laurin£ikas, A. 1996. <em|Limit Theorems for the
    Riemann Zeta Function>. Kluwer Academic Publishers, Dordrecht, The
    Netherlands.

    <bibitem|levinson>Levinson, N. 1975. Almost all roots of
    <math|\<zeta\><around|(|s|)>=a> are arbitrarily close to
    <math|\<sigma\>=<frac|1|2>>. <em|Proceedings of the Natural Academy of
    Sciences, USA> 72:1322\U1324.

    <bibitem|littlewood1912>Littlewood, J.E. 1912. Quelques conséquenes
    l'hypothèse que la fonction <math|\<zeta\><around|(|s|)>> n'a pas de
    zéros dan le demi-plan Re<math|<around|(|s|)>\<gtr\><frac|1|2>>.
    <em|C.<nbsp>R.<nbsp>Acad.<nbsp>Sci. (Paris)> 154:263\U266.

    <bibitem|littlewood1962>Littlewood, J.E. 1962. <em|The Riemann
    Hypothesis> (ed. Good et al.). Basic Books, New York.

    <bibitem|mangoldt>von Mangoldt, H. 1897. Beweis der Gleichung
    <math|<big|sum><rsub|k=1><rsup|\<infty\>>u<around|(|k|)>/k=0>. <em|S.-B.
    Kgl. Preuss. Acad. Wiss., Berlin>.

    <bibitem|rao>Rao, M.M. 1984. <em|Probability Theory with Applications>.
    Academic Press, New York.

    <bibitem|salem>Salem, R. 1953. Sur une proposition équivalente à
    l'hypothèse de Riemann. <em|C.<nbsp>R.<nbsp>Acad.<nbsp>Sci., (Paris)>
    236:1127\U1128.

    <bibitem|sarnak>Sarnak, P. 2008. <em|Problems of the Millennium: The
    Riemann Hypthesis>. CMS Books in Mathematics, New York.

    <bibitem|zygmund>Zygmund, A. 1935 and 1959. <em|Trigonometric Series>
    (Warsaw and 2nd. ed.). Cambridge University Press, Cambridge, UK.
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
    <associate|auto-1|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|auto-2|<tuple|2|4|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|auto-3|<tuple|3|6|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|auto-4|<tuple|4|7|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|auto-5|<tuple|5|8|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|auto-6|<tuple|6|10|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|auto-7|<tuple|7|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-ahlfors|<tuple|ahlfors|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-billingsley|<tuple|billingsley|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-cramer|<tuple|cramer|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-denjoy|<tuple|denjoy|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-derbyshire|<tuple|derbyshire|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-edwards|<tuple|edwards|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-gram|<tuple|gram|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-grenville|<tuple|grenville|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-hardy|<tuple|hardy|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-hardy_littlewood|<tuple|hardy_littlewood|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-kac|<tuple|kac|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-kahane|<tuple|kahane|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-khintchine|<tuple|khintchine|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-laurincikas|<tuple|laurincikas|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-levinson|<tuple|levinson|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-littlewood1912|<tuple|littlewood1912|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-littlewood1962|<tuple|littlewood1962|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-mangoldt|<tuple|mangoldt|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-rao|<tuple|rao|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-salem|<tuple|salem|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-sarnak|<tuple|sarnak|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|bib-zygmund|<tuple|zygmund|11|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:char_func|<tuple|12|4|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:clt|<tuple|22|9|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:contour|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:convergence_condition|<tuple|25|10|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:euler_product|<tuple|19|6|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:functional_derivation|<tuple|17|5|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:gamma|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:gaussian|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:integral_eq|<tuple|10|4|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:log_zeta|<tuple|20|6|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:poisson|<tuple|13|5|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:prob_result|<tuple|23|9|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:random_series|<tuple|24|10|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:riemann_functional|<tuple|18|5|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:salem|<tuple|9|3|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:salem_integral|<tuple|11|4|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:taylor|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:taylor_alt|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:theta_relation|<tuple|15|5|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:zeta_complex|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:zeta_def|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:zeta_integral|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:zeta_manipulation|<tuple|16|5|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:zeta_reciprocal|<tuple|21|7|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|eq:zeta_theta|<tuple|14|5|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|prop:khintchine|<tuple|3|6|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|sec:comments|<tuple|6|10|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|sec:denjoy|<tuple|5|8|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|sec:functional|<tuple|2|4|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|sec:intro|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|sec:nonprob|<tuple|4|7|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|sec:nonzero|<tuple|3|6|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|thm:denjoy|<tuple|5|9|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|thm:functional|<tuple|2|5|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|thm:littlewood|<tuple|4|8|../../.TeXmacs/texts/scratch/no_name_12.tm>>
    <associate|thm:salem|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_12.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ahlfors

      salem

      zygmund

      zygmund

      edwards

      zygmund

      khintchine

      gram

      derbyshire

      derbyshire

      hardy

      hardy_littlewood

      mangoldt

      littlewood1912

      littlewood1912

      edwards

      kac

      denjoy

      denjoy

      laurincikas

      billingsley

      kac

      denjoy

      edwards

      rao

      laurincikas

      cramer

      grenville

      kahane

      littlewood1962

      levinson

      sarnak
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      and the Harmonic Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Another
      Functional Equation for the Zeta> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Non-Zero
      Sets of the Zeta Function> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Nonprobabilistic
      Methods and Consequences> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Denjoy
      Probability Model for Nontrivial Zeta Zeros>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Some
      Additional Results and Comments> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>