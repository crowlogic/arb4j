<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

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

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>
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
    <label|eq:zeta_def>\<Gamma\><around|(|s|)>*<big|sum><rsub|n=1><rsup|\<infty\>><frac|1|n<rsup|s>>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|s-1>*<big|sum><rsub|n=1><rsup|\<infty\>>e<rsup|-n*t>*d*t=<big|int><rsub|0><rsup|\<infty\>><frac|t<rsup|s-1>|e<rsup|t>-1>*d*t
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

  Now realizing the relation that\ 

  <\equation>
    <frac|x|e<rsup|x>+1>=<frac|x|e<rsup|x>-1>-<frac|2*x|e<rsup|2*x>-1>
  </equation>

  \ it is seen that\ 

  <\equation>
    M<rsub|n>=B<rsub|n>*<around|(|1-2<rsup|n>|)>
  </equation>

  . This did not seem to reveal much, where the <math|B<rsub|n>> are
  Bernoulli numbers given earlier. However, the zeta function itself was not
  critically used. But complexifying and writing <math|s=\<sigma\>+i*t> one
  gets the integral from equation<nbsp><eqref|eq:zeta_def> as <math|>

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>x<rsup|\<sigma\>-1>*e<rsup|i*t*log
    x>*<frac|d*x|e<rsup|x>+1>
  </equation>

  By a change of variables this can be written as <math|>

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|u>|e<rsup|e<rsup|u>>+1>*e<rsup|i*u*t>*d*u=<big|int><rsub|\<bbb-R\>>K<rsub|\<sigma\>><around|(|u|)>*e<rsup|i*u*t>*d*u
  </equation>

  which is the Fourier transform of the integrable kernel
  <math|u\<mapsto\>K<rsub|\<sigma\>><around|(|u|)>>. It then satisfies on
  using the relation<nbsp><eqref|eq:zeta_complex> the following important
  equation:

  <\equation>
    <label|eq:salem>\<centerdot\><tabular|<tformat|<table|<row|<cell|\<Gamma\><around|(|s|)>*<around|(|1-2<rsup|1-s>|)>*\<zeta\><around|(|s|)>>|<cell|=\<Gamma\><around|(|\<sigma\>+i*t|)>*<around|(|1-2<rsup|1-<around*|(|\<sigma\>+i*t|)>>|)>*\<zeta\><around|(|\<sigma\>+i*t|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>K<rsub|\<sigma\>><around|(|u|)>*e<rsup|i*u*t>*d*u>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>K<rsub|Re<around*|(|s|)>><around|(|u|)>*e<rsup|i*u*t>*d*u>>>>>
  </equation>

  where <math|s=\<sigma\>+i*t>. It was then recognized by
  Salem<nbsp><cite|salem> that the right side of
  equation<nbsp><eqref|eq:salem> can be zero, using a known theorem of
  Norbert Wiener, so that <math|\<zeta\>*<around|(|\<sigma\>+i*t|)>=0>,
  <math|0\<less\>\<sigma\>\<less\>1> if and only if the integral equation

  <\equation>
    <label|eq:integral_eq><big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|\<sigma\>>*<around|(|x-y|)>*\<phi\><around|(|y|)>*d*y=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|Re<around*|(|s|)>>*<around|(|x-y|)>*\<phi\><around|(|y|)>*d*y=0
  </equation>

  has a nontrivial integrable solution <math|\<phi\>>. Thus this implies that
  existence of roots of\ 

  <\equation>
    \<zeta\>*<around|(|<frac|1|2>+i*t|)>=0
  </equation>

  \ is equivalent to the existence of a nontrivial solution of the above
  integral equation! The result may be stated as:

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
  integral equation.\ 

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
    <associate|auto-1|<tuple|1|1|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|auto-2|<tuple|16|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-ahlfors|<tuple|ahlfors|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-billingsley|<tuple|billingsley|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-cramer|<tuple|cramer|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-denjoy|<tuple|denjoy|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-derbyshire|<tuple|derbyshire|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-edwards|<tuple|edwards|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-gram|<tuple|gram|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-grenville|<tuple|grenville|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-hardy|<tuple|hardy|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-hardy_littlewood|<tuple|hardy_littlewood|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-kac|<tuple|kac|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-kahane|<tuple|kahane|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-khintchine|<tuple|khintchine|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-laurincikas|<tuple|laurincikas|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-levinson|<tuple|levinson|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-littlewood1912|<tuple|littlewood1912|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-littlewood1962|<tuple|littlewood1962|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-mangoldt|<tuple|mangoldt|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-rao|<tuple|rao|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-salem|<tuple|salem|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-sarnak|<tuple|sarnak|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|bib-zygmund|<tuple|zygmund|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:contour|<tuple|5|2|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:gamma|<tuple|1|1|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:gaussian|<tuple|2|2|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:integral_eq|<tuple|14|3|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:salem|<tuple|13|3|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:salem_integral|<tuple|16|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:taylor|<tuple|7|2|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:taylor_alt|<tuple|8|3|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:zeta_complex|<tuple|6|2|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:zeta_def|<tuple|4|2|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|eq:zeta_integral|<tuple|3|2|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|sec:intro|<tuple|1|1|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
    <associate|thm:salem|<tuple|1|4|HarmonicAndProbabilisticApproachesToZerosOfRiemannsZetaFunction.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      ahlfors

      salem
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      and the Harmonic Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>