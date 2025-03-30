<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Most of section 5.2 on Admissible Translates of
  General Gaussian Processes in Stochastic Processes: Inference Theory by
  M.M. Rao>|<doc-author|<author-data|<author-name|>>>>

  3. Example. (a) Recall that an O.U. process is a stationary Gaussian
  process with mean zero and covariance given by

  <\equation>
    r*<around|(|s,t|)>=\<sigma\><rsup|2>*e<rsup|-\<beta\>*<around|\||s-t|\|>>
  </equation>

  \ for <math|0\<leq\>s,t\<leq\>a> where <math|\<beta\>\<gtr\>0,\<sigma\><rsup|2>\<gtr\>0>
  are constants. If <math|\<beta\><rsub|i>,\<sigma\><rsup|2><rsub|i>,i=1,2>
  relate to a pair of O.U. processes, so that\ 

  <\equation>
    r<rsub|i>=u<rsub|i>*v<rsub|i>
  </equation>

  \ with

  <\equation>
    u<rsub|i><around|(|t|)>=\<sigma\><rsup|2><rsub|i>*e<rsup|\<beta\><rsub|i>*t>
  </equation>

  <\equation>
    v<rsub|i><around|(|t|)>=e<rsup|-\<beta\><rsub|i>*t>
  </equation>

  \ then the conditions given in the theorem show that the measures
  <math|P<rsub|0><rsup|r<rsub|i>>,i=1,2> are equivalent iff <math|>

  <\equation>
    \<sigma\><rsup|2><rsub|1>*\<beta\><rsub|1>=\<sigma\><rsup|2><rsub|2>*\<beta\><rsub|2>=K
  </equation>

  (say). The likelihood ratio is then obtained from (2) as follows where
  <math|D<rsub|1>,D<rsub|2>> and the integrand, denoted <math|f>, are found
  to be:

  <\equation>
    D<rsup|2><rsub|1>=<frac|\<beta\><rsub|2>|\<beta\><rsub|1>>
  </equation>

  <\equation>
    D<rsub|2>=<frac|2|K>*<around|(|\<beta\><rsub|1>-\<beta\><rsub|2>|)>
  </equation>

  and

  <\equation>
    f=-<frac|<around|(|\<beta\><rsub|2>-\<beta\><rsub|1>|)>|K>*exp
    <around|[|-<around|(|\<beta\><rsub|1>+\<beta\><rsub|2>|)>*t|]>
  </equation>

  Substituting these in (2) and using integration by parts one gets

  <\equation>
    <with|font-base-size|14|<frac|d*P<rsub|0><rsup|r*2>|d*P<rsub|0><rsup|r*1>><around|(|X|)>=<sqrt|<frac|\<beta\><rsub|2>|\<beta\><rsub|1>>>*e<rsup|-<frac|<around|(|\<beta\><rsub|2>-\<beta\><rsub|1>|)>*<around|(|X<rsup|2><around|(|0|)>+X<rsup|2><around|(|a|)>|)>+<around|(|\<beta\><rsup|2><rsub|2>-\<beta\><rsup|2><rsub|1>|)>*<big|int><rsub|0><rsup|a>X<rsup|2><around|(|t|)>*<space|0.17em>d*t|2*K>*>>
  </equation>

  This example is also discussed by Striebel [1]. [There is a small numerical
  discrepancy here.] See also Duttweiler and Kailath [1],[2], Kailath and
  Weinert [1], and Kailath, Geesy and Weinert [1], for related work.

  (b) An even simpler example is noted for the equivalence of the BM and the
  Brownian bridge both have means zero and covariances

  <\equation>
    r<rsub|1>*<around|(|s,t|)>=min <around|(|s,t|)>
  </equation>

  \ and

  <\equation>
    r<rsub|2>*<around|(|s,t|)>=u*<around|(|s\<wedge\>t|)>*v*<around|(|s\<vee\>t|)>
  </equation>

  \ \<forall\><math|0\<leq\>s,t\<leq\>a\<less\>1> where
  <math|u<around|(|s|)>=s,v<around|(|s|)>=1-s>. In this case\ 

  <\equation>
    D<rsup|2><rsub|1>=<frac|1|1-a>
  </equation>

  <\equation>
    D<rsub|2>=0
  </equation>

  <\equation>
    f<around|(|t|)>=-1
  </equation>

  and since <math|r<rsub|i>*<around|(|0,0|)>=0,i=1,2>, so that
  <math|X<around|(|0|)>=0>, a.e. under both measures, the likelihood ratio is
  given by:

  <\equation>
    <frac|d*P<rsub|0><rsup|r*2>|d*P<rsub|0><rsup|r*1>>=<frac|e<rsup|-<frac|x<rsup|2><around|(|a|)>|1-a>>|<sqrt|1-a>>*
  </equation>

  The fact that the covariance function <math|r<rsub|i>> of the O.U. process
  is stationary, so that it has the spectral (or Fourier) representation:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|r<rsub|i>*<around|(|s,t|)>>|<cell|=\<sigma\><rsub|i><rsup|2>*e<rsup|-\<beta\><rsub|i>*<around|\||s-t|\|>>>>|<row|<cell|>|<cell|=<frac|\<sigma\><rsub|i><rsup|2>*\<beta\><rsub|i>|\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-i*x*<around|\||s-t|\|>>|\<beta\><rsub|i><rsup|2>+x<rsup|2>>*<space|0.17em>d*x>>>>>
  </equation>

  (if <math|\<sigma\><rsub|i><rsup|2>=1>, then it is the characteristic
  function of the Cauchy density, which thus appears here as the spectral
  density), motivates a study of obtaining conditions on the spectral
  functions for the equivalence and singularity of the measures (instead of
  the covariances). We discuss this aspect of the problem briefly.

  The additional knowledge of stationarity calls for a sharper result on the
  dichotomy problem for the resulting likelihood ratios. The following is
  representative of the situation and it is due to Gladyshev [1] which we
  include for a comparison.\ 

  <\remark>
    Recall that if <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>> is a
    (weakly) stationary process with a continuous covariance function
    <math|r>, then it admits the representation (by Bochner's theorem on
    positive definite functions)

    <\equation>
      r*<around|(|s,t|)>=r*<around|(|s-t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*u*<around|(|s-t|)>>*d*F<around|(|u|)>
    </equation>

    , where <math|F> is the spectral distribution (a bounded Borel measure)
    and <math|f=<frac|d*F|d*u>> is the spectral density whenever it exists.
  </remark>

  <\theorem>
    Let <math|<around|(|\<Omega\>,\<Sigma\>,<frac|P|Q>|)>> be Gaussian
    measures with zero means and continuous stationary covariances
    <math|r<rsub|k>> having spectral densities <math|f<rsub|k>,k=1,2> for a
    process <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>>. If the
    <math|f<rsub|k>> satisfy the growth condition

    <\equation>
      f<rsub|k><around|(|u|)>=c<rsub|k>\|u\|<rsup|\<alpha\><rsub|k>>+O<around|(|<around|\||u|\|><rsup|\<alpha\><rsub|k>-2>|)>
      <text| where >k=1,2<text| and >c<rsub|1>\<cdot\>c<rsub|2>\<neq\>0
    </equation>

    the <math|\<alpha\><rsub|k>> being real and
    <math|lim<rsub|<around|\||u|\|>\<to\>\<infty\>>
    <frac|f<rsub|1>|f<rsub|2>><around|(|u|)>\<neq\>1>, then
    <math|P\<perp\>Q>.
  </theorem>

  It should be observed that the orthogonality of measures <math|P,Q> may
  obtain even when <math|lim<rsub|<around|\||u|\|>\<to\>\<infty\>>
  <frac|f<rsub|1>|f<rsub|2>><around|(|u|)>=1> and thus for a presence of the
  di- chotomy, further conditions are necessary. We omit this specialization
  here and also the proof of the theorem referring the reader to Gladyshev's
  paper where the result is established by first extending Baxter's
  proposition and applying it to the present situation. A detailed study of
  the dichotomy problem for stationary Gaussian processes is given in
  considerable detail in Rozanov's [1] memoir.

  It is clear from these computations, when the covariances of Gaussian
  processes are different, the work cannot be materially simplified. In fact
  the approximations here lead to a stochastic integral. If covariance
  functions are more general than the triangular ones, then it is necessary
  to use more sophisticated results from abstract analysis, as already seen
  in Theorem 1.12. To understand this structure better, we now include some
  additional results and the corresponding likelihood ratios. There is also
  an integral form of triangular covariances covering a large class of
  Gaussian processes, as will appear from the work below. It signifies an
  aspect analogous to that of Section IV.4.

  Observe that if <math|P<rsub|m<rsub|i>><rsup|r<rsub|i>>,i=1,2> are
  equivalent measures, then by the chain rule for the RN-derivatives, one has
  for a.a. <math|<around|(|\<omega\>|)>>:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<frac|d*P<rsub|m<rsub|2>><rsup|r<rsub|2>>|d*P<rsub|m<rsub|1>><rsup|r<rsub|1>>><around|(|\<omega\>|)>>|<cell|=<frac|d*P<rsub|m<rsub|2>><rsup|r<rsub|2>>|d*P<rsub|m<rsub|1>><rsup|r<rsub|2>>><around|(|\<omega\>|)><frac|d*P<rsub|m<rsub|1>><rsup|r<rsub|2>>|d*P<rsub|m<rsub|1>><rsup|r<rsub|1>>><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<frac|d*P<rsub|m<rsub|2>-m<rsub|1>><rsup|r<rsub|2>>|d*P<rsub|0><rsup|r<rsub|2>>><around|(|\<omega\>|)><frac|d*P<rsub|0><rsup|r<rsub|2>>|d*P<rsub|0><rsup|r<rsub|1>>><around|(|\<omega\>|)>>>>>>
  </equation>

  Thus <math|P<rsub|m<rsub|2>><rsup|r<rsub|2>>> is equivalent to
  <math|P<rsub|m<rsub|1>><rsup|r<rsub|1>>> iff both
  <math|P<rsub|m<rsub|2>><rsup|r<rsub|2>>> is equivalent to
  <math|P<rsub|m<rsub|2>><rsup|r<rsub|2>>> and
  <math|P<rsub|m<rsub|1>><rsup|r<rsub|2>>> is equivalent to
  <math|P<rsub|m<rsub|1>><rsup|r<rsub|1>>>. By Proposition 1.2 we deduce that
  <math|m<rsub|1>,m<rsub|2>> are admissible means of
  <math|P<rsub|0><rsup|r<rsub|2>>> so that
  <math|\<delta\>=m<rsub|2>-m<rsub|1>> is also one, by linearity of that set.
  Consequently <math|P<rsub|\<delta\>><rsup|r<rsub|2>>> is equivalent to
  <math|P<rsub|0><rsup|r<rsub|1>>>. This fact may be stated for a convenient
  reference as follows:

  <with|font-series|bold|5. Proposition.> <with|font-shape|italic|If
  <math|P<rsub|m<rsub|i>><rsup|r<rsub|i>>,i=1,2>, are Gaussian measures with
  means <math|m<rsub|i>> and covariances <math|r<rsub|i>>, then
  <math|P<rsub|m<rsub|2>><rsup|r<rsub|2>>\<equiv\>P<rsub|m<rsub|1>><rsup|r<rsub|1>>>
  iff <math|P<rsub|\<delta\>><rsup|r<rsub|2>>\<equiv\>P<rsub|0><rsup|r<rsub|1>>>
  where <math|\<delta\>=m<rsub|2>-m<rsub|1>>.>

  Since by Proposition 1.2 the conditions on the equivalence (or ex- istence)
  of the first factor on the right side of (15) are known, it is now
  necessary to find similar conditions for
  <math|P<rsub|0><rsup|r<rsub|2>>\<equiv\>P<rsub|0><rsup|r<rsub|1>>>. This is
  a far deeper problem and considerable insight is obtained by use of
  abstract analysis via Aronszajn space technology. [Mathematically this is
  on the level of the analysis of the Behrens-Fisher problem that we
  discussed in Chapter II based on Linnik's penetrating study.] Its use and
  effective- ness in the present work was brought out by Parzen [1] and
  refined by Neveu [2], using a different notation. We follow this technique
  to elu- cidate its role in our theory and eventually obtain the likelihood
  ratio, in Theorem 12 below.

  In order to present an equivalent version of the above proposition, with
  hypotheses on the covariance functions, it will be useful to intro- duce an
  \Pentropy function\Q for measuring the distinctness of probabilities, in
  place of the Hellinger \Pdistance\Q used in the proof of Theorem 1.1. It is
  borrowed from information theory and highlights the covari- ance functions
  more directly than the earlier one. Thus if <math|P,Q> are probability
  measures on <math|<around|(|\<Omega\>,\<Sigma\>|)>> and <math|\<mu\>> is a
  dominating (<math|\<sigma\>>-finite) measure on <math|\<Sigma\>>, for
  example <math|<frac|P+Q|2>> so

  <\equation>
    f=<frac|d*P|d*\<mu\>> <text| and >g=<frac|d*Q|d*\<mu\>>
  </equation>

  let <math|I> be the information functional defined by:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|I>|<cell|=I<around|(|P,Q|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<Omega\>><around|(|g-f|)>*log
    <frac|g|f>*d*\<mu\>>>|<row|<cell|>|<cell|=<big|int><rsub|\<Omega\>>log
    <frac|d*Q|d*P>*d*P+<big|int><rsub|\<Omega\>>log
    <frac|d*P|d*Q>*d*Q>>|<row|<cell|>|<cell|I<around|(|Q,P|)>>>>>>
  </equation>

  which thus does not depend on <math|\<mu\>>, and similarly if
  <math|\<cal-F\><rsub|\<alpha\>>\<subset\>\<Sigma\>> is a <math|\<sigma\>>-
  algebra, and <math|P<rsub|\<alpha\>>,Q<rsub|\<alpha\>>,\<mu\><rsub|\<alpha\>>>
  are the restrictions of <math|P,Q,\<mu\>> on
  <math|\<cal-F\><rsub|\<alpha\>>>, let <math|f<rsub|\<alpha\>>,g<rsub|\<alpha\>>>
  be the corresponding densities and <math|I<rsub|\<alpha\>>> the resulting
  number given by (16). If <math|<around|{|\<cal-F\><rsub|\<alpha\>>,\<alpha\>\<in\>J|}>>
  is a directed or filtering set of <math|\<sigma\>>-algebras from
  <math|\<Sigma\>> (<math|J> being a directed set and
  <math|\<cal-F\><rsub|\<alpha\>>\<subset\>\<cal-F\><rsub|\<beta\>>> for
  <math|\<alpha\>\<less\>\<beta\>> in <math|J>) then is seen by the
  conditional Jensen's inequality applied to the convex functions
  <math|\<varphi\><rsub|1><around|(|x|)>=x*log x> and
  <math|\<varphi\><rsub|2><around|(|x|)>=log <frac|1|x>,x\<gtr\>0>, that
  <math|I<rsub|\<alpha\>>\<leq\>I<rsub|\<beta\>>> if
  <math|\<alpha\>\<less\>\<beta\>>; whence it is a monotone nondecreasing
  functional and one can verify that <math|lim<rsub|\<alpha\>>
  I<rsub|\<alpha\>>=I\<leq\>\<infty\>>, where <math|\<Sigma\>> is replaced by
  <math|\<sigma\>(\<cup\><rsub|\<alpha\>\<in\>J>\<cal-F\><rsub|\<alpha\>>>).
  [The necessary computation uses a martingale convergence theorem, since
  <math|<around|{|u<rsub|\<alpha\>>=<frac|d*Q<rsub|\<alpha\>>|d*P<rsub|\<alpha\>>>,\<cal-F\><rsub|\<alpha\>>,\<alpha\>\<in\>J|}>>,
  forms a martingale on <math|<around|(|\<Omega\>,\<Sigma\>,P|)>>, the
  details being standard and are found, e.g., in Rao [12],p.213.] Also it
  follows from definition that <math|I<around|(|P,Q|)>\<less\>\<infty\>>
  implies <math|Q\<equiv\>P> just as <math|H<around|(|P,Q|)>=1>. But by
  Theorem 1.1, <math|H<around|(|P,Q|)>\<gtr\>0\<Rightarrow\>H<around|(|P,Q|)>=1>
  for Gaussian measures, and similarly it is shown that, in this case,
  <math|I<around|(|P,Q|)>\<less\>\<infty\>> iff <math|Q\<equiv\>P>, and
  <math|Q\<perp\>P> iff <math|I<rsub|\<alpha\>><around|(|P,Q|)>=I<around|(|P<rsub|\<alpha\>>,Q<rsub|\<alpha\>>|)>=\<infty\>>
  for some <math|\<alpha\>\<in\>J> (or <math|I<around|(|P,Q|)>=\<infty\>>).
  This is also detailed in the above reference, and will be used without
  reproducing the algebra. Thus Theorem 1.1 can also be proved using this
  information functional <math|I>, as was originally done by Hájek [1].

  If now <math|\<alpha\>=<around|(|t<rsub|1>,\<ldots\>,t<rsub|n>|)>> is a
  finite set of points of the index set <math|T> for a segment of the
  observed process <math|<around|{|X<rsub|t>,t\<in\>T|}>>, let
  <math|X=<around|(|X<rsub|t<rsub|1>>,\<cdots\>,X<rsub|t<rsub|n>>|)>>, and
  <math|r<rsub|j*n>=<around|[|E<rsub|P<rsup|r<rsub|j>>>*<around|(|X<rsub|t<rsub|i>>*X<rsub|t<rsub|k>>|)>,1\<leq\>i,k\<leq\>n|]>,j=1,2>,
  be the <math|n\<times\>n> covariance matrices. Then the (elementary) finite
  dimensional likelihood ratio is given for <math|x=X<around|(|\<omega\>|)>>
  by

  <\equation>
    <label|eq:17>p<rsub|\<alpha\>><around|(|x|)>=<frac|d*Q<rsub|\<alpha\>>|d*P<rsub|\<alpha\>>><around|(|x|)>=<sqrt|<frac|<around|\||r<rsub|1*n>|\|>|<around|\||r<rsub|2*n>|\|>>>*exp
    <around|{|-<frac|1|2>*<around|[|x<rprime|'>*<around|(|r<rsub|2*n><rsup|-1>-r<rsub|1*n><rsup|-1>|)>*x<rprime|'>|]>|}>
  </equation>

  where <math|x<rprime|'>> is the transpose of the row vector <math|x> and
  <math|<around|\||r<rsub|j*n>|\|>> is the determinant of the corresponding
  matrix. In the proof of Theorem 1.1 we simplified this expression by
  simultaneously diagonalizing the matrices <math|r<rsub|j*n>>, and here we
  proceed differently by using the <math|I<rsub|\<alpha\>>>-functional with
  (17) to keep track with the covariances. Thus (16) with (17) becomes:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|I<rsub|\<alpha\>>=I<rsub|\<alpha\>><around|(|P,Q|)>>|<cell|=E<rsub|P<rsub|0><rsup|r<rsub|2>>><around|(|log
    p<rsub|\<alpha\>><around|(|X|)>|)>-E<rsub|P<rsub|0><rsup|r<rsub|1>>><around|(|log
    p<rsub|\<alpha\>><around|(|X|)>|)>>>|<row|<cell|>|<cell|=<frac|1|2>*<around|(|E<rsub|P<rsub|0><rsup|r<rsub|2>>>-E<rsub|P<rsub|0><rsup|r<rsub|1>>>|)>*<around|(|X*<around|(|r<rsub|1*n><rsup|-1>-r<rsub|2*n><rsup|-1>|)>*X<rprime|'>|)>>>|<row|<cell|>|<cell|=<frac|1|2>*<around|(|E<rsub|P<rsub|0><rsup|r<rsub|2>>>-E<rsub|P<rsub|0><rsup|r<rsub|1>>>|)><around|(|<math-up|tr><around|[|X*<around|(|r<rsub|1*n><rsup|-1>-r<rsub|2*n><rsup|-1>|)>*X<rprime|'>|]>|)>>>|<row|<cell|>|<cell|=<frac|1|2>*t*r*<around|[|<around|(|E<rsub|P<rsub|0><rsup|r<rsub|2>>>-E<rsub|P<rsub|0><rsup|r<rsub|2>*n>>|)>*<around|(|<math-up|r><rsub|1*n><rsup|-1>-<math-up|r><rsub|2*n><rsup|-1>|)>*X*X<rprime|'>|]>>>|<row|<cell|>|<cell|=<frac|1|2>*t*r*<around|[|<math-up|r><rsub|2*n><math-up|r><rsub|1*n><rsup|-1>+<math-up|r><rsub|1*n><math-up|r><rsub|2*n><rsup|-1>-2*i*d|]>>>>>>
  </equation>

  where <math|i*d> is the identity matrix, <math|t*r> is trace,
  <math|E<rsub|P<rsub|i><rsup|r<rsub|i>>>> denotes the expectation relative
  to the measure <math|P<rsup|r<rsub|i>>>, and where we used the standard
  computation for the expectations of covariances in Gaussian integrals. The
  crucial discovery here, due to Parzen [1], is that the expression in the
  last line of (18) can be identified as an element of the tensor product of
  the (finite dimensional) RKHSs <math|\<cal-H\><rsub|r*1*n>> and
  <math|\<cal-H\><rsub|r*2*n>>. We now consider the desired product space.

  If <math|\<cal-H\><rsub|r<rsub|i>>> is the RKHS for the covariance kernel
  <math|r<rsub|i>>, then their tensor product is defined as

  <\equation>
    <around|(|r<rsub|1>\<otimes\>r<rsub|2>|)><around|(|s<rsub|1>,s<rsub|2>,t<rsub|1>,t<rsub|2>|)>=r<rsub|1>*<around|(|s<rsub|1>,t<rsub|1>|)>*r<rsub|2>*<around|(|s<rsub|2>,t<rsub|2>|)>\<forall\>s<rsub|i>,t<rsub|i>\<in\>T,i=1,2
  </equation>

  so that <math|r<rsub|1>\<otimes\>r<rsub|2>> is again a covariance kernel
  (by Schur's lemma). Let <math|g<rsub|i>\<in\>\<cal-H\><rsub|i>,i=1,2> and
  <math|g=g<rsub|1>\<otimes\>g<rsub|2>> defined on <math|T\<otimes\>T> as
  <math|g<around|(|t<rsub|1>,t<rsub|2>|)>=g<rsub|1><around|(|t<rsub|1>|)>*g<rsub|2><around|(|t<rsub|2>|)>>,
  and <math|<around|\<\|\|\>|g|\<\|\|\>><rsub|\<cal-H\><rsub|1>\<otimes\>\<cal-H\><rsub|2>>=<around|\<\|\|\>|g<rsub|1>|\<\|\|\>><rsub|\<cal-H\><rsub|1>><around|\<\|\|\>|g<rsub|2>|\<\|\|\>><rsub|\<cal-H\><rsub|2>>>
  derived from the inner product

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<around|(|g,r<rsub|1>\<otimes\>r<rsub|2>|(>\<cdot\>,\<cdot\>,t<rsub|1>,t<rsub|2>))>|<cell|=<around*|\<langle\>|<around|\<nobracket\>|g<rsub|1>,r<rsub|1>|(>\<cdot\>,t<rsub|1>)|\<rangle\>><around*|\<langle\>|<around|\<nobracket\>|g<rsub|2>,r<rsub|2>|(>\<cdot\>,t<rsub|2>)|\<rangle\>>>>|<row|<cell|>|<cell|=g<rsub|1><around|(|t<rsub|1>|)>*g<rsub|2><around|(|t<rsub|2>|)>>>|<row|<cell|>|<cell|=g<around|(|t<rsub|1>,t<rsub|2>|)>>>>>>
  </equation>

  The space <math|\<cal-H\><rsub|r<rsub|1>>\<otimes\>\<cal-H\><rsub|r<rsub|2>>>
  is the closure under the norm <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|r<rsub|1>\<otimes\>r<rsub|2>>>
  of finite linear combinations of elements of the form <math|g>, and is the
  tensor product of the spaces <math|\<cal-H\><rsub|r<rsub|i>>,i=1,2> which
  is again a Hilbert space. It is verified easily that
  <math|\<cal-H\><rsub|r<rsub|1>\<otimes\>r<rsub|2>>=\<cal-H\><rsub|r<rsub|1>>\<otimes\>\<cal-H\><rsub|r<rsub|2>>>.

  As an example, for the triangular kernel
  <math|r*<around|(|s,t|)>=\<sigma\><rsup|2>*min
  <around|(|s,t|)>,0\<leq\>s,t\<leq\>1> the space
  <math|\<cal-H\><rsub|r>\<subset\>C<rsub|0><around|(|<around|[|0,1|]>|)>> of
  absolutely continuous functions vanishing at the origin, with square
  integrable derivatives, i.e., <math|f\<in\>\<cal-H\><rsub|r>> iff (with
  <math|<wide|f|\<dot\>>=<frac|d*|d*u>f<around*|(|u|)>>)

  <\equation>
    f<around|(|t|)>=<big|int><rsub|0><rsup|t><wide|f|\<dot\>><around|(|u|)>*<space|0.17em>d*u=<big|int><rsub|0><rsup|1><wide|f|\<dot\>><around|(|u|)>*\<chi\><rsub|<around|[|0,t|]>><around|(|u|)>*<space|0.17em>d*u
  </equation>

  and the inner product

  <\equation>
    <around*|\<langle\>|f,g|\<rangle\>>=<frac|<big|int><rsub|0><rsup|1><wide|f|\<dot\>><around|(|u|)><wide|g|\<dot\>><around|(|u|)>*<space|0.17em>d*u|\<sigma\><rsup|2>>*
  </equation>

  is the RKHS for this kernel <math|r>. Since
  <math|<frac|\<partial\>*r|\<partial\>*s>*<around|(|s,t|)>=\<sigma\><rsup|2>*\<chi\><rsub|<around|[|0,t|]>><around|(|s|)>>
  one gets <math|r*<around|(|\<cdummy\>,t|)>\<in\>\<cal-H\><rsub|r>> for each
  <math|t> and <math|<around|(|f,r|(>\<cdot\>,t))=f<around|(|t|)>>. This is
  the classical Wiener space. Here, replacing <math|\<sigma\>> by
  <math|\<sigma\><rsub|i>\<gtr\>0,i=1,2> and calling the resulting kernels
  <math|r<rsub|i>> one gets after a simple computation for (18):

  <\equation>
    I<rsub|\<alpha\>><around|(|P,Q|)>=<frac|n|2>*<around*|(|<frac|\<sigma\><rsub|1>|\<sigma\><rsub|2>>-<frac|\<sigma\><rsub|2>|\<sigma\><rsub|1>>|)><rsup|2><label|eq:20>
  </equation>

  which is unbounded as <math|\<alpha\>> varies on all finite subsets of
  [0,1], if <math|\<sigma\><rsub|1>\<neq\>\<sigma\><rsub|2>>. Resuming the
  general discussion, it follows from the above construc- tion that for
  <math|\<alpha\>\<less\>\<alpha\><rprime|'>> (i.e.,
  <math|\<alpha\>\<subset\>\<alpha\><rprime|'>>) are finite sets, then
  <math|\<cal-H\><rsub|r*1*\<alpha\>>\<subset\>\<cal-H\><rsub|r*1*\<alpha\><rprime|'>>>
  and <math|<around|{|\<cal-H\><rsub|r*1*\<alpha\>>\<otimes\>r<rsub|2*\<alpha\>>,\<alpha\>\<in\>J|}>>
  forms an increasingly nested set of subspaces of
  <math|\<cal-H\><rsub|r*1>\<otimes\>r<rsub|2>>. Moreover,
  <math|<around|{|<around|\<\|\|\>|r<rsub|1>-r<rsub|2>|\<\|\|\>><rsub|\<cal-H\><rsub|r*1*\<alpha\>>\<otimes\>r<rsub|2*\<alpha\>>>|}>>
  forms a monotone increas- ing net and hence has a limit (finite or not) by
  the general RKHS theory (cf., Aronszajn [1], Theorem I on p. 362).
  Consequently, <math|>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|I<around|(|P,Q|)>>|<cell|=lim<rsub|\<alpha\>>
    I<rsub|\<alpha\>><around|(|P,Q|)>>>|<row|<cell|>|<cell|=lim<rsub|\<alpha\>><around|\<\|\|\>|r<rsub|1*\<alpha\>>-r<rsub|2*\<alpha\>>|\<\|\|\>><rsub|\<cal-H\><rsub|r*1*\<alpha\>>\<otimes\>r<rsub|2*\<alpha\>>>>>>>>
  </equation>

  \ exists, finite or not. It is finite iff <math|P> and <math|Q> are
  equivalent, and singular if <math|I<around|(|P,Q|)>=\<infty\>>. Thus for
  equivalence, one must have <math|r<rsub|1>-r<rsub|2>\<in\>\<cal-H\><rsub|r*1>\<otimes\>r<rsub|2>>.
  The converse implication is established by showing that the non finiteness
  of the pre- ceding limit implies that there is a set
  <math|A\<in\>\<cap\><rsub|\<alpha\>>\<cal-F\><rsub|\<alpha\>>> on which
  <math|P> has arbitrarily small value and <math|Q> has a value close to
  unity so that <math|P\<perp\>Q> on <math|\<Sigma\>>. In particular we have
  by (20) the well-known result that the scale different BM processes (i.e.,
  <math|\<sigma\><rsub|1>\<neq\>\<sigma\><rsub|2>>) always determine singular
  measures. This discussion allows us to state Proposition 5 in the fol-
  lowing more convenient but equivalent form involving conditions only on the
  means and covariances:

  <with|font-series|bold|6. Theorem.> <with|font-shape|italic|The Gaussian
  probability measures <math|P<rsub|m<rsub|i>><rsup|r<rsub|i>>,i=1,2> on
  <math|<around|(|\<Omega\>,\<Sigma\>|)>> with means <math|m<rsub|i>> and
  covariances <math|r<rsub|i>,i=1,2> are equivalent iff (a)
  <math|\<delta\>=m<rsub|1>-m<rsub|2>\<in\>\<cal-H\><rsub|r*1>>, (b)
  <math|\<cal-H\><rsub|r*1>=\<cal-H\><rsub|r*2>>, and (c)
  <math|r<rsub|1>-r<rsub|2>\<in\>\<cal-H\><rsub|r*1>\<otimes\>r<rsub|2>(=\<cal-H\><rsub|r*1>\<otimes\>\<cal-H\><rsub|r*2>>),
  the equalities between the spaces denoting isometric iso- morphisms.>

  The spaces <math|\<cal-H\><rsub|r>> can be given a more interesting
  representation if <math|T\<subset\>\<bbb-R\>> is a compact interval and
  <math|r> is (left or right) continuous on <math|T\<times\>T> so that
  <math|\<cal-H\><rsub|r>> is separable, since then <math|r> may be shown to
  admit a (generalized) triangular form. This is utilized to obtain a sharper
  form of the preceding theorem which automatically includes the triangular
  covariances treated earlier. The result has methodological interest and
  reveals the structure of the problem vividly, in addition to unifying many
  of the previous formulations. We present the work for any <math|r> for
  which <math|\<cal-H\><rsub|r>> is separable.

  <with|font-series|bold|7. Theorem.> <with|font-shape|italic|Let
  <math|P<rsub|m<rsub|i>><rsup|r<rsub|i>>,i=1,2>, be a pair of Gaussian
  measures on <math|<around|(|\<bbb-R\><rsup|T>,\<cal-B\><rsub|T>|)>> with
  means <math|m<rsub|i>> and covariances <math|r<rsub|i>>. Then they are
  equivalent iff there exists a (<math|\<sigma\>>-finite) measure space
  <math|<around|(|\<Omega\>,\<Sigma\>,\<nu\>|)>> and an
  <math|R\<in\>L<rsup|2><around|(|\<Omega\>\<times\>\<Omega\>,\<Sigma\>\<otimes\>\<Sigma\>,\<nu\>\<otimes\>\<nu\>|)>>
  satisfying the conditions:>

  (i) <math|R<around|(|\<omega\>,\<omega\><rprime|'>|)>=R<around|(|\<omega\><rprime|'>,\<omega\>|)>>
  for a.a. <math|<around|(|\<omega\>,\<omega\><rprime|'>|)>> and for the
  Hilbert-Schmidt operator <math|A:L<rsup|2><around|(|\<nu\>|)>\<to\>L<rsup|2><around|(|\<nu\>|)>>
  defined as

  <\equation>
    A*f=<big|int><rsub|\<Omega\>>R<around|(|\<cdummy\>,\<omega\><rprime|'>|)>*f<around|(|\<omega\><rprime|'>|)>*d*\<nu\><around|(|\<omega\><rprime|'>|)>
  </equation>

  \ <math|-1> does not belong to the spectrum <math|\<sigma\><around|(|A|)>>
  of <math|A>;

  <\equation>
    -1\<nin\>\<sigma\><around*|(|A|)>
  </equation>

  (ii) and

  <\equation>
    <around|(|r<rsub|1>-r<rsub|2>|)>*<around|(|u,v|)>=<big|int><rsub|\<Omega\>><big|int><rsub|\<Omega\>>\<Psi\><around|(|u,\<omega\>|)>*\<Psi\><around|(|v,\<omega\><rprime|'>|)>*R<around|(|\<omega\>,\<omega\><rprime|'>|)>*d*\<nu\>*d*\<nu\>
  </equation>

  with <math|r<rsub|2>> having a representation as\ 

  <\equation>
    r<rsub|2><around|(|u,v|)>=<big|int><rsub|\<Omega\>>\<Psi\><around|(|u,\<omega\>|)>*\<Psi\><around|(|v,\<omega\>|)>*d*\<nu\><around|(|\<omega\>|)>
  </equation>

  \ relative to the family <math|<around|{|\<Psi\><around|(|u,\<cdot\>|)>,u\<in\>T|}>\<subset\>L<rsup|2><around|(|\<nu\>|)>>;
  and

  (iii) there is a <math|g\<in\>L<rsup|2><around|(|\<nu\>|)>> such that

  <\equation>
    <around|(|m<rsub|1>-m<rsub|2>|)><around|(|u|)>=<big|int><rsub|\<Omega\>>\<Psi\><around|(|u,\<omega\>|)>*g<around|(|\<omega\>|)>*d*\<nu\><around|(|\<omega\>|)>
  </equation>

  [The family <math|<around|{|\<Psi\><around|(|u,\<cdot\>|)>,u\<in\>T|}>>
  need not be unique, but each such collection determining <math|r<rsub|2>>
  in (ii) has the same cardinality and satisfies (iii).]

  The proof, to be given after Proposition 8, is helped by the following
  auxiliary decomposition of <math|r<rsub|2>> which is more general than the
  Mercer series representation (the latter demands continuity of the kernel
  ev- erywhere), and explains the structure of <math|\<cal-H\><rsub|r>> using
  only the separability hypothesis. We present the result here since it has
  independent interest. The procedure is motivated by the work of Cramér [5],
  with references to his earlier contributions, and of Hida [1] both of which
  use the clas- sical Hellinger-Hahn expansion instead. [But a reader may
  skip the following discussion, and proceed to the statement of Proposition
  8 for the necessary facts that are used in the proof of the theorem.
  However, the result will also be found useful for linear prediction
  considered in Chapter VIII.]

  Thus let <math|T\<subset\>\<bbb-R\>> be as given,
  <math|K:T\<times\>T\<to\>\<bbb-C\>> be a positive definite kernel, and
  <math|\<cal-H\><rsub|K>> be its RKHS with the inner product defined in (4)
  of Section 1. Then <math|<around|{|K|(>\<cdot\>,t),t\<in\>T}> is dense in
  that space. Let <math|\<cal-H\><rsub|t>=<wide|s*p|\<bar\>><around|{|K|(>\<cdot\>,s),s\<leq\>t}\<subset\>\<cal-H\><rsub|t<rprime|'>>>
  for <math|t\<leq\>t<rprime|'>>. It may and will be supposed that
  <math|\<cal-H\><rsub|t>=\<cup\><rsub|s\<less\>t>\<cal-H\><rsub|s>,t\<in\>T>
  and <math|\<cal-H\><rsup|0>=\<cap\><rsub|t\<in\>T>\<cal-H\><rsub|t>=<around|{|0|}>>
  by replacing the collection <math|<around|{|\<cal-H\><rsub|t>,t\<in\>T|}>>
  with <math|\<cal-H\><rsub|s><rsup|\<ast\>>=\<cup\><rsub|s\<less\>t>\<cal-H\><rsub|s>>
  where <math|\<cal-H\><rsub|s>\<ominus\>\<cal-H\><rsup|0>> if necessary. The
  real restriction is the assumption that <math|\<cal-H\><rsub|K>> is
  separable which we now make and which is always satisfied if <math|K> is
  left (or right) continuous. [Without this, the following argument has to be
  refined using a more advanced result, as indicated below.]

  Let <math|\<pi\><rsub|t>:\<cal-H\><rsub|K>\<to\>\<cal-H\><rsub|t>> denote
  the (unique) orthogonal projection onto <math|\<cal-H\><rsub|t>>. Then
  <math|<around|{|\<pi\><rsub|t>,t\<in\>T|}>> forms a 'resolution of the
  identity', i.e., a left continuous mutually commuting family of projections
  tending to 0 (id) as <math|t\<to\>-\<infty\><around|(|\<infty\>|)>>. The
  desired (classical) Hellinger-Hahn theorem states: There exists a
  denumerable family of elements <math|<around|{|f<rsub|n>,n\<geq\>1|}>> (not
  neces- sarily uniquely but of the same cardinality) such that
  <math|f<rsub|n><around|(|t|)>=\<pi\><rsub|t>*f<rsub|n>,t\<in\>T>, has\ 

  (i) orthogonal increments,\ 

  (ii) <math|<around|\<langle\>|f<rsub|n><around|(|t|)>,f<rsub|m><around|(|t|)>|\<rangle\>>=\<delta\><rsub|m*n><around|\<\|\|\>|f<rsub|n><around|(|t|)>|\<\|\|\>><rsup|2>>,
  and\ 

  (iii) <math|<around|{|f<rsub|n><around|(|t<rsub|2>|)>-f<rsub|n><around|(|t<rsub|1>|)>,<around|[|t<rsub|1>,t<rsub|2>|]>\<subset\>\<Delta\>=<around|[|a,b|]>\<subset\>T,n\<geq\>1|}>>
  is a complete orthonormal set in <math|\<Delta\>*\<cal-H\><rsub|K>=\<cal-H\><rsub|b>\<ominus\>\<cal-H\><rsub|a>>.\ 

  Moreover for each <math|n>, the additive function <math|\<mu\><rsub|n>>
  defined by

  <\equation>
    \<mu\><rsub|n><around|(|<around|[|t<rsub|1>,t<rsub|2>|]>|)>(=\<mu\><rsub|n><around|(|t<rsub|2>|)>-\<mu\><rsub|n><around|(|t<rsub|1>|)>)=<around|\<\|\|\>|f<rsub|n><around|(|t<rsub|2>|)>-f<rsub|n><around|(|t<rsub|1>|)>|\<\|\|\>><rsup|2>
  </equation>

  is uniquely extendible to a Borel measure on <math|\<bbb-R\>>, and one has
  for each <math|x\<in\>\<cal-H\><rsub|K>>:

  <\equation>
    \<psi\><rsub|n><rsup|x><around|(|t|)>=<frac|d*<around|\<langle\>|x,f<rsub|n>|(>\<cdot\><around|)||\<rangle\>>|d*\<mu\><rsub|n>><around|(|t|)>,<space|1em>a.*e.<around|[|\<mu\><rsub|n>|]>,<label|eq:21>
  </equation>

  <\equation>
    <around|\<\|\|\>|x|\<\|\|\>><rsup|2>=<big|sum><rsub|n><big|int><rsub|T><around|\||\<psi\><rsub|n><rsup|x><around|(|t|)>|\|><rsup|2>*d*\<mu\><rsub|n><around|(|t|)>
  </equation>

  Taking <math|x=K<around|(|\<cdummy\>,t|)>\<in\>\<cal-H\><rsub|K>>, for any
  fixed <math|t> in (21) let the corresponding <math|\<psi\><rsub|n><rsup|x>>
  be denoted by <math|\<psi\><rsub|n><around|(|t,\<cdot\>|)>,t\<in\>T>, and
  define <math|\<mu\>=<big|sum><rsub|n><frac|1|2<rsup|<around|\||n|\|>>>*\<mu\><rsub|n>>.
  Then <math|\<mu\>> is a Borel measure on <math|T> and
  <math|\<mu\><rsub|n>\<ll\>\<mu\>,n\<geq\>1>. If
  <math|L<rsup|2><around|(|T,\<mu\>|)>> is the resulting Lebesgue space on
  <math|T>, then <math|<wide|\<psi\>|~><rsub|n><around|(|t,\<cdot\>|)>=\<psi\><rsub|n><around|(|t,\<cdot\><around|)|<around|(|<frac|d*\<mu\><rsub|n>|d*\<mu\>>|)><rsup|<frac|1|2>>|(>\<cdot\>|)>\<in\>L<rsup|2><around|(|T,\<mu\>|)>>
  and the second equation of (21) gives:

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<big|sum><rsub|n><big|int><rsub|T><around|\||\<psi\><rsub|n><around|(|s,t|)>|\|><rsup|2>*d*\<mu\><rsub|n><around|(|t|)>>|<cell|=<big|sum><rsub|n><big|int><rsub|T><around|\||<wide|\<psi\>|~><rsub|n><around|(|s,t|)>|\|><rsup|2>*d*\<mu\><around|(|t|)>>>|<row|<cell|>|<cell|=<big|int><rsub|T><big|sum><rsub|n><around|\<langle\>|<wide|\<psi\>|~><rsub|n><around|(|s,x|)>,<wide|\<psi\>|~><rsub|n><around|(|s,x|)>|\<rangle\>>*d*\<mu\><around|(|x|)>>>|<row|<cell|>|<cell|=<around|\<langle\>|K|(>*\<cdummy\>,s),K<around|(|\<cdummy\>,s|)>\<rangle\>>>|<row|<cell|>|<cell|=K<around|(|s,s|)><label|eq:22>>>>>>
  </equation>

  This representation is of interest here. With this (using polarization) one
  can express the kernel as:

  <\equation>
    <big|int><rsub|T><big|sum><rsub|n><around|\<langle\>|<wide|\<psi\>|~><rsub|n><around|(|s,x|)>,<wide|\<psi\>|~><rsub|n><around|(|t,x|)>|\<rangle\>>*d*\<mu\><around|(|x|)>=K<around|(|s,t|)><label|eq:23>
  </equation>

  For simplicity let <math|\<Psi\><around|(|s,\<cdot\>|)>=<around|(|<wide|\<psi\>|~><rsub|1><around|(|s,\<cdot\>|)>,<wide|\<psi\>|~><rsub|2><around|(|s,\<cdot\>|)>,\<ldots\>|)>>
  be an infinite vector so that (23) can be simply written, using the inner
  product notation of the sequence space <math|<around|(|\<ell\><rsup|2>,|\<langle\>>\<cdot\>,\<cdot\><around|\<rangle\>||)>>,
  to get

  <\equation>
    <big|int><rsub|T><around|\<langle\>|\<Psi\><around|(|s,x|)>,\<Psi\><around|(|t,x|)>|\<rangle\>><rsub|\<ell\><rsup|2>>*d*\<mu\><around|(|x|)>=K<around|(|s,t|)><label|eq:23prime>
  </equation>

  It is known (and easy to verify) that such a function space can be
  identified as <math|L<rsup|2><around|(|T,\<mu\>;\<ell\><rsup|2>|)>> of
  vector valued (here <math|\<ell\><rsup|2>>-valued) functions on <math|T>
  with norm <math|<sqrt|K<around|(|s,s|)>>>. Now let
  <math|\<cal-F\>=<wide|s*p|\<bar\>><around|{|\<Psi\><around|(|t,\<cdot\>|)>,t\<in\>T|}>\<subset\>L<rsup|2><around|(|T,\<mu\>;\<ell\><rsup|2>|)>>,
  and

  <\equation>
    \<cal-H\><rsub|K>=<around|{|g\<in\>\<bbb-C\><rsup|T>:<around|\||g<around|(|t|)>|\|>=<around|\||<big|int><rsub|T><around|\<langle\>|\<Psi\><around|(|t,x|)>,u<around|(|x|)>|\<rangle\>><rsub|\<ell\><rsup|2>>*d*\<mu\><around|(|x|)>|\|>\<less\>\<infty\>,u\<in\>\<cal-F\>|}>
  </equation>

  with <math|<around|\<\|\|\>|g|\<\|\|\>><rsup|2>=<big|int><rsub|T><around|\<langle\>|u<around|(|x|)>,u<around|(|x|)>|\<rangle\>><rsub|\<ell\><rsup|2>>*d*\<mu\><around|(|x|)>>.
  Also\ 

  <\equation>
    <around|(|g,K|(>\<cdot\>,t))=<big|int><rsub|T><around|\<langle\>|\<Psi\><around|(|t,x|)>,u<around|(|x|)>|\<rangle\>><rsub|\<ell\><rsup|2>>*d*\<mu\><around|(|x|)>
  </equation>

  then it follows that <math|K<around|(|\<cdummy\>,t|)>\<in\>\<cal-H\><rsub|K>>
  for <math|t\<in\>T> by (23'). So that <math|\<cal-H\><rsub|K>> is an RKHS
  for the kernel <math|K>. But the general theory of Aronszajn's [1] implies
  that <math|K> defines uniquely such a space so that
  <math|\<cal-H\><rsub|K>=<wide|\<cal-H\>|~><rsub|K>>, and the mapping
  <math|\<cal-H\><rsub|K>\<to\>\<cal-F\>> is an isometric isomorphism. This
  is the desired representation for the proof of the theorem.

  It may be noted that if <math|K> is continuous on a compact interval
  <math|T>, then by Mercer's theorem it can be expanded as:

  <\equation>
    K<around|(|s,t|)>=<big|sum><rsub|n=1><rsup|\<infty\>><frac|\<psi\><rsub|n><around|(|s|)>*<wide|\<psi\>|\<bar\>><rsub|n><around|(|t|)>|\<lambda\><rsub|n>><label|eq:24>
  </equation>

  the series converging uniformly and absolutely. If we consider
  <math|\<mu\>> as a measure concentrated on <math|\<bbb-N\>> with
  <math|\<mu\><around|(|<around|{|n|}>|)>=<frac|1|\<lambda\><rsub|n>>> so
  that (24) becomes\ 

  <\equation>
    K<around|(|s,t|)>=<big|int><rsub|\<bbb-N\>><around|\<langle\>|\<psi\><around|(|s,n|)>,<wide|\<psi\>|\<bar\>><around|(|t,n|)>|\<rangle\>><rsub|\<ell\><rsup|2>>*d*\<mu\><around|(|n|)>
  </equation>

  \ then it denotes a special case of (23'). We present the general statement
  established above for reference as follows.

  <with|font-series|bold|8. Proposition.> <with|font-shape|italic|Let
  <math|K:T\<times\>T\<to\>\<bbb-C\>> be a covariance function such that the
  associated RKHS <math|\<cal-H\><rsub|K>> is separable where
  <math|T\<subset\>\<bbb-R\>>. Then there exists a family of vector functions
  <math|\<Psi\><around|(|t,\<cdot\>|)>=<around|{|\<psi\><rsub|n><around|(|t,\<cdot\>|)>,n\<geq\>1|}>,t\<in\>T>
  and a Borel measure <math|\<mu\>> on <math|T> such that
  <math|\<Psi\><around|(|t,\<cdot\>|)>\<in\>L<rsup|2><around|(|T,\<mu\>;\<ell\><rsup|2>|)>>
  in terms of which <math|K> is representable as:>

  <\equation>
    K<around|(|s,t|)>=<big|int><rsub|T><around|\<langle\>|\<Psi\><around|(|s,x|)>,\<Psi\><around|(|t,x|)>|\<rangle\>><rsub|\<ell\><rsup|2>>*d*\<mu\><around|(|x|)><label|eq:25>
  </equation>

  <with|font-shape|italic|The vector functions
  <math|\<Psi\><around|(|s,\<cdot\>|)>,s\<in\>T> and the measure
  <math|\<mu\>> may not be unique, but all such
  <math|<around|(|\<Psi\><around|(|t,\<cdot\>|)>,\<mu\>|)>> determine
  <math|K> and <math|\<cal-H\><rsub|K>> uniquely and the cardinality of the
  components determining <math|\<Psi\>> remains the same.>

  <with|font-series|bold|Important remarks:> 1. It may be observed that if
  <math|\<Psi\><around|(|t,\<cdot\>|)>> is a scalar, then we have
  <math|K<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>\<Psi\><around|(|s,x|)><wide|\<Psi\>|\<bar\>><around|(|t,x|)>*d*\<mu\><around|(|x|)>>,
  which includes the tra- ditional triangular covariance with <math|\<mu\>>
  absolutely continuous relative to the Lebesgue measure.

  2. The following notational simplification of (25) can be made. Let
  <math|\<Omega\>=\<bbb-R\>\<times\>\<bbb-Z\>,\<Sigma\>=\<cal-B\>\<otimes\>\<cal-P\>>
  where <math|\<cal-P\>> is the power set of the integers <math|\<bbb-Z\>>,
  and let <math|\<nu\>=\<mu\>\<otimes\>\<alpha\>> where <math|\<alpha\>> is
  the counting measure. Then <math|<wide|\<Psi\>|~><around|(|t,\<lambda\>|)>=<around|{|\<psi\><rsub|n><around|(|t,x|)>,n\<in\>\<bbb-Z\>|}>=\<Psi\><around|(|t,\<lambda\>,n|)>,<around|(|\<lambda\>,n|)>\<in\>\<Omega\>>.
  Hence

  <\equation>
    \<\|\|\>\<Psi\>(t,\<cdot\><around|)||\<\|\|\>><rsup|2><rsub|2,\<nu\>>=<big|int><rsub|\<Omega\>><wide|\<Psi\>|~><around|(|t,\<omega\>|)><wide|<wide|\<Psi\>|~>|\<bar\>><around|(|t,\<omega\>|)>*d*\<nu\><around|(|\<omega\>|)>
  </equation>

  and

  <\equation>
    K<around|(|s,t|)>=<big|int><rsub|\<Omega\>><wide|\<Psi\>|~><around|(|s,\<omega\>|)><wide|<wide|\<Psi\>|~>|\<bar\>><around|(|t,\<omega\>|)>*d*\<nu\><around|(|\<omega\>|)>\<forall\>s,t\<in\>T<label|eq:25prime>
  </equation>

  <\equation>
    \<cal-H\><rsub|K>=<around|{|g:g<around|(|t|)>=<big|int><rsub|\<Omega\>><wide|\<Psi\>|~><around|(|t,\<omega\>|)>*<wide|u|\<bar\>><around|(|\<omega\>|)>*d*\<nu\><around|(|\<omega\>|)>\<forall\>u\<in\>\<cal-F\>\<subset\>L<rsup|2><around|(|\<Omega\>,\<nu\>|)>|}><label|eq:26>
  </equation>

  where <math|\<cal-F\>=<wide|s*p|\<bar\>><around|{|<wide|\<Psi\>|~><around|(|t,\<cdot\>|)>,t\<in\>T|}>>
  and\ 

  <\equation>
    <around|\<\|\|\>|g|\<\|\|\>><rsup|2>=<big|int><rsub|\<Omega\>><around|\||u<around|(|\<omega\>|)>|\|><rsup|2>*d*\<nu\><around|(|\<omega\>|)>
  </equation>

  Thus <math|\<tau\>:g\<mapsto\>u> is an isometry between
  <math|\<cal-H\><rsub|K>> and <math|\<cal-F\>>. This form of (25') is
  convenient for the proof of the theorem below.

  3. An interesting application of the form (26) is the following on a
  general characterization of admissible means, complementing the work of
  Section 1. Thus let a function <math|f:T\<to\>\<bbb-C\>> be termed an
  (generally) admissible mean relative to a positive definite kernel
  <math|K:T\<times\>T\<to\>\<bbb-C\>> if it is the mean of a second order
  process <math|<around|{|X<rsub|t>,t\<in\>T|}>> on some probability space
  <math|<around|(|\<Omega\>,\<Sigma\>,P|)>> with covariance <math|K>. Since
  one can always take the process to be Gaussian with a given positive
  definite kernel as its covariance and zero mean by Kolmogorov's existence
  theorem (cf. Theorem I.1.1), this is the same as saying that if
  <math|P<rsub|f>> is the measure on <math|\<Sigma\>> of the
  <math|X<rsub|t>>-process and if <math|P> is the measure of the
  <math|Y<rsub|t>=X<rsub|t>-f>-process, then <math|P<rsub|f>\<ll\>P>. Thus it
  is another way of stating the concept introduced before. Also <math|>

  <\equation>
    K<rsub|1><around|(|s,t|)>=f<around|(|s|)><wide|f|\<bar\>><around|(|t|)>
  </equation>

  \ evidently defines a (degenerate) posi- tive definite function, and we
  have <math|>

  <\equation>
    E*<around|(|Y<rsub|s>*<wide|Y|\<bar\>><rsub|t>|)>=K<around|(|s,t|)>-K<rsub|1><around|(|s,t|)>
  </equation>

  . Then <math|f> is an admissible mean of <math|P>, i.e., iff
  <math|f\<in\>M<rsub|P>=\<cal-H\><rsub|K>> by Proposition 1.2. But by (26)
  above, <math|\<cal-H\><rsub|K>> can be realized as:
  <math|f\<in\>\<cal-H\><rsub|K>> iff, with <math|K> represented by (25'),
  <math|f> can be represented as the integral

  <\equation>
    f<around|(|t|)>=<big|int><rsub|\<Omega\>><wide|\<Psi\>|~><around|(|t,\<omega\>|)>*u<around|(|\<omega\>|)>*d*\<nu\><around|(|\<omega\>|)>\<forall\>u\<in\>\<cal-F\>
  </equation>

  with <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|K>=<around|\<\|\|\>|u|\<\|\|\>><rsub|2>>.
  But <math|u\<in\>\<cal-H\><rsub|K<rsub|1>>> always, and from (25)-(26)
  where now <math|\<mu\><around|(|<around|{|\<lambda\>|}>|)>=1> concentrating
  at one point and <math|u=1> so that <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|K<rsub|1>>=<around|[|<big|int><rsub|\<Omega\>>1*d*\<mu\>|]><rsup|<frac|1|2>>=1>.
  Since <math|K-K<rsub|1>> is positive definite iff
  <math|\<cal-H\><rsub|1>\<subset\>\<cal-H\>> by Aron- szajn's theory [1],
  pp.354-5, Theorems I-II), <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|K>\<leq\><around|\<\|\|\>|f|\<\|\|\>><rsub|K<rsub|1>>=1>.
  Thus we have shown that <math|f> is admissible relative to a covariance
  kernel <math|K> iff <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|K>\<leq\>1>. In
  this form Ylvisaker [1] proved this by a somewhat different argument. Note
  that if <math|K> is also a continuous stationary covariance so that\ 

  <\equation>
    K<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*<around|(|s-t|)>*u>*d*G<around|(|u|)>
  </equation>

  \ for a unique bounded nondecreasing <math|G>, then <math|f> is admissible
  iff with <math|>

  <\equation>
    \<Psi\><around|(|s,\<lambda\>|)>=e<rsup|i*s*\<lambda\>>
  </equation>

  \ in (25) so that (26) gives <math|f\<in\>\<cal-H\><rsub|K>> iff

  <\equation>
    f<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<Psi\><around|(|s,\<lambda\>|)>*u<around|(|\<lambda\>|)>*d*G<around|(|\<lambda\>|)>
  </equation>

  This means <math|f> is the Fourier transform of

  <\equation>
    d*F<around|(|\<lambda\>|)>=u<around|(|\<lambda\>|)>*d*G<around|(|\<lambda\>|)>
  </equation>

  , <math|F> being a function of bounded variation. This sharp form of the
  result was obtained directly by Balakrishnan [1]. Note that (25) uses a
  series representation of <math|r> and hence is not good enough for the
  Fourier representation in the RKHS setup. In particular if

  <\equation>
    r<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*s*x-i*t*y>*d*F<around|(|x,y|)>
  </equation>

  for harmonizable processes for admissibility of <math|f> only that
  <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|R>\<leq\>1> is concluded but its
  corresponding representation in the stationary case is not given, and a
  different argument for such specializations is needed. [As Ylvisaker notes,
  the RKHS argument uses only the Aronszajn theorem which does not depend on
  any property of <math|T> and it can be any point set. This is the
  generality, but then the structure of <math|f> could not be made more
  precise since the additional information on <math|r> is not utilized.
  However, the corresponding result can be obtained, using different
  techniques (cf. Rao [23] and Exercise 6.9 for more detail).]

  4. The measure <math|\<mu\>> and the functions
  <math|\<psi\><rsub|n><around|(|t,\<cdot\>|)>> are obtained in the general
  case by the Hellinger-Hahn theory when <math|\<cal-H\><rsub|K>> is
  separable. If the last condition is dropped, one has to consider a more
  advanced analysis based on the general spectral theory of a normal operator
  in a Hilbert space due to Plessner and Rokhlin [1]. The details of this in
  the context of processes are not yet available. So it will not be discussed
  further, but it points out the essential need to invoke deep mathematical
  tools even in such "naturally simple" problems.

  <with|font-series|bold|Proof of Theorem 7.> Using the notation introduced
  for the above result, we first observe that each element
  <math|V\<in\>\<cal-F\>\<otimes\>\<cal-F\>> corresponds uniquely to a
  Hilbert-Schmidt (HS)-operator <math|U> on <math|\<cal-F\>> (cf., Schatten
  [1], pp.35-36), and moreover each such <math|U> is representable by a
  kernel <math|K<rsub|0>\<in\>L<rsup|2><around|(|T\<times\>T,\<mu\>\<otimes\>\<mu\>;\<ell\><rsup|2>|)>\<cap\><around|(|\<cal-F\>\<otimes\>\<cal-F\>|)>>
  where <math|\<cal-F\>=\<tau\><around|(|\<cal-H\><rsub|K>|)>>. In fact if
  <math|F\<in\>\<cal-H\><rsub|K\<otimes\>K>>, then there is a (not
  necessarily positive definite) unique <math|K<rsub|0>> such that

  <\equation>
    F<around|(|u,v|)>=<big|int><rsub|T><big|int><rsub|T><around|(|<wide|\<Psi\>|~><around|(|u,x|)>,K<rsub|0><around|(|x,y|)><wide|\<Psi\>|~><around|(|v,y|)>|)><rsub|\<ell\><rsup|2>>*d*\<mu\><around|(|x|)>*d*\<mu\><around|(|y|)><label|eq:27>
  </equation>

  and <math|K<rsub|0>> is hermitian if <math|F> is. All of this is an easy
  consequence of the theorem in Schatten referred to above. Putting
  <math|\<Omega\>=T\<times\>\<bbb-Z\>,\<nu\>=\<mu\>\<otimes\>\<alpha\>>, as
  in the above remark (<math|\<alpha\>=> counting measure), (27) is expressed
  as:

  <\equation>
    F<around|(|u,v|)>=<big|int><rsub|\<Omega\>><big|int><rsub|\<Omega\>><wide|\<Psi\>|~><around|(|u,\<omega\>|)><wide|<wide|\<Psi\>|~><around|(|v,\<omega\><rprime|'>|)>|\<bar\>>G<around|(|\<omega\>,\<omega\><rprime|'>|)>*d*\<nu\><around|(|\<omega\>|)>*d*\<nu\><around|(|\<omega\><rprime|'>|)><label|eq:27prime>
  </equation>

  for a <math|G\<in\>L<rsup|2>*<around|(|\<nu\>\<otimes\>\<nu\>|)>> in the
  new notation (<math|G=K<rsub|0>>). With these identifications, we show that
  the conditions of Theorem 6 are equivalent to those of Theorem 7, which
  will establish the result.

  Let <math|F=r<rsub|2>-r<rsub|1>> and <math|A> be the (integral) operator
  corresponding to <math|F> acting on <math|L<rsup|2><around|(|\<nu\>|)>>.
  Then by the above recalled theorem, <math|A> associates with it a kernel
  <math|G(=R> of the theorem). To verify the equivalence of the present
  conditions with those of Theorem 6, consider the isometric isomorphism
  <math|\<tau\>:\<cal-H\><rsub|r<rsub|1>>\<to\>\<cal-F\>> defined after (25')
  in which <math|K> is taken as <math|r<rsub|1>>. Then
  <math|\<tau\><around|(|\<delta\>|)>=g\<in\>\<cal-F\>> and this is
  equivalent to (iii). Also <math|r<rsub|2>-r<rsub|1>\<in\>\<cal-H\><rsub|r<rsub|1>\<otimes\>r<rsub|2>>>
  is equivalent to showing that <math|<around|(|\<tau\>\<otimes\>\<tau\>|)>*<around|(|r<rsub|2>-r<rsub|1>|)>\<in\>\<cal-F\>\<otimes\>\<cal-F\>>,
  since <math|r<rsub|2>-r<rsub|1>> is hermitian. Then by (27'), there is an
  <math|R\<in\>L<rsup|2>*<around|(|\<nu\>\<otimes\>\<nu\>|)>> in fact is in
  the subset <math|<around|(|\<tau\>\<otimes\>\<tau\>|)><around|(|\<cal-H\><rsub|r<rsub|1>\<otimes\>r<rsub|2>>|)>>.
  This is (c) which is thus equivalent to the argument is reversible,
  condition (b) of Theorem 6 and (i) here are equivalent, so that all the
  conditions of the present result are equivalent to those of Theorem 6, as
  desired. <math|\<square\>>

  <with|font-shape|italic|Note.> If the covariance is already given to be in
  a generalized triangular form, i.e., of the type (25'), the result holds
  and no multiplicity or Hellinger-Hahn theory is needed. Indeed such a
  direct application was made by Park [1] if <math|r<rsub|1>> is a triangular
  covariance on <math|<around|(|T,\<mu\>|)>> where
  <math|T\<subset\>\<bbb-R\><rsup|n>> and <math|\<mu\>> is the Lebesgue
  measure. In our case <math|r<rsub|1>> is also a general covariance but
  <math|T\<subset\>\<bbb-R\>> so that Hellinger-Hahn representation has to be
  (and was) invoked and <math|\<mu\>> is a <math|\<sigma\>>-finite Borel
  measure. We present a specialization for BM as an example. If
  <math|T\<subset\>\<bbb-R\><rsup|n>>, a result corresponding to Proposition
  8 is not immediately available, and an assumption of triangular (or
  "factorizable") covariance, i.e., the representation (25'), seems to be
  desirable so that Theorem 6 can still be employed.

  Taking <math|r<rsub|1>> as the covariance of the BM (so it is triangular\ 

  <\equation>
    r<rsub|1><around|(|u,v|)>=<big|int><rsub|0><rsup|1>\<chi\><rsub|<around|[|0,u|]>><around|(|t|)>*\<chi\><rsub|<around|[|0,v|]>><around|(|t|)>*d*t
  </equation>

  we can present conditions for equivalence of an arbitrary Gaussian measure
  <math|P<rsub|0><rsup|r<rsub|2>>> with <math|P<rsub|0><rsup|r<rsub|1>>> of
  the BM, first obtained by Shepp [1] using a different method, as follows.
  [Here <math|\<Omega\>=<around|[|0,1|]>> and <math|d*\<nu\>=d*x>, the
  Lebesgue measure with <math|K=r<rsub|1>> in (25').]

  <with|font-series|bold|9. Corollary.> <with|font-shape|italic|Let
  <math|P<rsub|0><rsup|r>> correspond to the BM and <math|P<rsub|m><rsup|s>>
  be an arbitrary Gaussian measure, both on
  <math|<around|(|\<Omega\>,\<Sigma\>|)>>
  <math|\<Omega\>=\<bbb-R\><rsup|<around|[|0,1|]>>>. Then they are mutually
  equivalent iff there is a hermitian <math|R\<in\>L<rsup|2><around|(|<around|[|0,1|]><rsup|2>,d*x*d*y|)>>
  such that for <math|0\<leq\>u,v\<leq\>1>
  <math|<around|(|r<around|(|u,v|)>=min <around|(|u,v|)>|)>>:>

  <\enumerate>
    <item*|(i)><math|s<around|(|u,v|)>=r<around|(|u,v|)>+<big|int><rsub|0><rsup|u><big|int><rsub|0><rsup|v>R<around|(|x,y|)>*d*x*d*y>

    <item*|(ii)><with|font-shape|italic|if <math|A> is determined by <math|r>
    on <math|L<rsup|2><around|(|<around|[|0,1|]>,d*x|)>> then
    <math|-1\<nin\>\<sigma\><around|(|A|)>>, and>

    <item*|(iii)><with|font-shape|italic|there is a
    <math|g\<in\>L<rsup|2><around|(|<around|[|0,1|]>,d*x|)>> such that
    <math|m<around|(|t|)>=<big|int><rsub|0><rsup|t>g<around|(|u|)>*d*u>.>
  </enumerate>

  Note that from (i) and (iii) it follows that <math|s,m> are differentiable
  and in fact <math|R<around|(|u,v|)>=<frac|\<partial\><rsup|2>*s|\<partial\>*u*\<partial\>*v>*<around|(|u,v|)>>
  and <math|g<around|(|u|)>=<frac|d*m|d*u><around|(|u|)>>, a.e. Thus in the
  case of BM, the equivalence condition on mean and covariances can be given
  explicitly. The above conditions are a specialization of those in Theorem
  7, but were discovered by Shepp [1] by a different procedure without using
  the RKHS techniques. A direct RKHS proof of this case of Shepp's was
  immediately followed by Kailath [1].

  Since Theorem 7 shows that the kernels <math|r<rsub|1>,r<rsub|2>> determine
  HS opera- tors and when their difference belongs to
  <math|\<cal-H\><rsub|r<rsub|1>\<otimes\>r<rsub|2>>> so that
  <math|r<rsub|1>-r<rsub|2>> defines a similar operator, it is of interest to
  find conditions for the equivalence in terms of the latter transformations.
  The following is such a result, and it slightly extends a theorem due to
  Pitcher [7] (cf., also Root [1], p.302). Our demonstration is again based
  on the RKHS technique and follows from the preceding work.

  <with|font-series|bold|10. Theorem.> <with|font-shape|italic|Let
  <math|P<rsub|0><rsup|r<rsub|i>>,i=1,2>, be a pair of Gaussian measures on>

  \;

  \;

  <\with|font-series|bold>
    <\equation*>
      <text|<text-dots>to be continued<text-dots>>
    </equation*>

    \;
  </with>
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
    <associate|auto-1|<tuple|1|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:16|<tuple|11|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:17|<tuple|22|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:20|<tuple|28|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:21|<tuple|36|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:22|<tuple|38|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:23|<tuple|39|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:23prime|<tuple|40|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:24|<tuple|43|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:25|<tuple|45|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:25prime|<tuple|47|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:26|<tuple|48|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:27|<tuple|58|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|eq:27prime|<tuple|59|?|../../.TeXmacs/texts/scratch/no_name_45.tm>>
  </collection>
</references>