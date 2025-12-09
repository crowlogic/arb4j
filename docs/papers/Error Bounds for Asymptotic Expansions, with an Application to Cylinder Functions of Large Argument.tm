<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Error Bounds for Asymptotic Expansions, with an
  Application to Cylinder Functions of Large
  Argument>|<doc-author|<author-data|<author-name|Frank W. J. Olver>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Complete
    asymptotic expansions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    need for error bounds> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Nature
    of the error bounds> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Hankel
    functions of large argument> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Evaluation
    of the variations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Collected
    results for cylinder functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Summary>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:introduction>

  In 1886, Poincaré <cite|poincare1886> introduced the notion of an
  asymptotic expansion

  <\equation>
    <label|eq:asymptotic_expansion>f<around|(|x|)>\<sim\>t<rsub|0>+<frac|t<rsub|1>|x>+<frac|t<rsub|2>|x<rsup|2>>+\<cdots\>
  </equation>

  of an arbitrary function <math|f<around|(|x|)>>. According to his
  definition the coefficients <math|t<rsub|s>> are independent of <math|x>,
  and

  <\equation>
    <label|eq:remainder_definition>f<around|(|x|)>=<big|sum><rsub|s=0><rsup|m-1><frac|t<rsub|s>|x<rsup|s>>+\<epsilon\><rsub|m><around|(|x|)>
  </equation>

  where, for each <math|m>, <math|\<epsilon\><rsub|m><around|(|x|)>=o<around|(|1/x<rsup|m-1>|)>>
  as <math|x\<to\>\<infty\>>. This concept admitted a new class of divergent
  series expansions to be useful in analysis, enabling them to be manipulated
  in much the same way as convergent power series. In turn, this has led to
  the development of a new calculus, later called \Ppure asymptotics\Q by van
  der Corput <cite|van_der_corput>. A feature of this development has been
  the generalization of the original definition of Poincaré. Schmidt
  <cite|schmidt> showed that the restrictive assumption in Poincaré's
  definition is not necessary. More recently, Erdélyi <cite|erdelyi> has
  extended the concept still further, and, with Wyman, applied it to the
  asymptotic evaluation of certain integrals <cite|erdelyi_wyman>. Erdélyi's
  generalization is given in <cite|erdelyi_generalization> below.

  For some time, however, many numerical mathematicians have been aware that
  in quite another way, the Poincaré definition is not restrictive enough. To
  understand this point of view, consider for example the well-known
  asymptotic expansion for the Hankel function
  <math|H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|z|)>> for large
  <math|<around|\||z|\|>> and fixed <math|\<nu\>>, given by

  <\equation>
    <label|eq:hankel_expansion>H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|z|)>\<sim\><sqrt|<frac|2|\<pi\>*z>>*e<rsup|i*\<phi\>>*<big|sum><rsub|s=0><rsup|\<infty\>><frac|i<rsup|s>*a<rsub|s>|z<rsup|s>>
  </equation>

  in which

  <\equation>
    <label|eq:hankel_coefficients>\<phi\><around*|(|z|)>=z-<frac|1|2>*\<nu\>*\<pi\>-<frac|1|4>*\<pi\>
  </equation>

  and

  <\equation>
    a<rsub|s>=<frac|<around|(|<frac|1|2>-\<nu\><rsup|2>|)>*<around|(|<frac|9|4>-\<nu\><rsup|2>|)>*\<cdots\>*<around|(|<around|(|<frac|s|2>|)><rsup|2>-\<nu\><rsup|2>|)>|s!8<rsup|s>>
  </equation>

  This expansion holds in Poincaré's sense <cite|poincare_sense> when
  <math|-\<pi\>\<less\>arg z\<less\>2*\<pi\>>; in fact for arbitrary values
  of a positive number <math|\<delta\>>, it is uniformly valid in the sector
  <math|-\<pi\>+\<delta\>\<leq\>arg z\<leq\>2*\<pi\>-\<delta\>> in the
  accepted sense that if the series is truncated after <math|m> terms, then
  the constant implied in the error term <math|O<around|(|<around|\||z|\|><rsup|-m>|)>>
  can be assigned independently of <math|arg z>.

  Now it will be seen later <cite|later_reference> that when <math|z> is
  large and if <math|arg z> is not too close to the constant in the uniform
  error bound depends on <math|z> and becomes increasingly large as
  <math|\<delta\>\<to\>0>. As a consequence, the concept of \Puniform
  validity\Q can be quite misleading in applications: an unsuspecting
  computer evaluating the series <eqref|eq:hankel_expansion> by the usual
  computational procedure of truncation at the smallest term may obtain
  inaccurate results in the sectors <math|-\<pi\>\<less\>arg
  z\<less\>-\<pi\>+\<delta\>> and <math|2*\<pi\>-\<delta\>\<less\>arg
  z\<less\>2*\<pi\>>, grossly so in the neighbourhoods of <math|arg
  z=-\<pi\>> and <math|2*\<pi\>>.

  This situation, although perhaps not widely appreciated, is really a fairly
  surprising, because <eqref|eq:hankel_expansion> is known to break down
  completely on crossing the boundaries <math|arg z=-\<pi\>> and
  <math|2*\<pi\>>. It is more natural <cite|natural_reference> to expect this
  failure to be gradual than abrupt as the boundaries are approached. The
  behaviour of an ordinary Taylor-series expansion of an analytic function is
  somewhat similar, inasmuch as the circle of convergence is approached. The
  analogy is not complete, however. A computer is warned of the inaccuracy of
  a truncated Taylor series near the boundary of its region of validity by a
  diminution in the rate of convergence. No similar warning is available for
  an asymptotic expansion.

  Some way of excluding the direct use of an asymptotic expansion near the
  boundaries of its region of validity is therefore desirable, and it is in
  this sense that the Poincaré definition is insufficiently restrictive
  enough. To understand this point of view, the restrictive definition should
  be modified. The specific problem of Hankel and Bessel functions of large
  arguments and derive some new results in connection with the expansion
  <eqref|eq:hankel_expansion>.

  <section|Complete asymptotic expansions><label|sec:complete_expansions>

  Practical dangers attending the use of asymptotic expansions have been
  stressed previously by Miller <cite|miller1> <cite|miller2>. In the
  expansions for the Weber functions given in these references, Miller
  distinguishes between regions of validity in the sense of Poincaré and the
  more restrictive \Pcomplete sense of Watson.\Q Essentially, the difference
  is that in the former sense of contributions of an exponentially small
  character are neglected (as they may be, according to the definition),
  whereas in the latter sense they are retained if they have numerical
  significance.

  For example, if <math|z> is not an odd integer, then the definition,
  whereas in the complete sense they are retained if they have numerical
  significance.

  For example, if <math|z> is not an odd integer then according to the
  definition <eqref|eq:remainder_definition>, the quadrant
  <math|<frac|1|2>*\<pi\>\<less\>arg z\<leq\>\<pi\>>; this is demonstrated in
  <cite|watson_reference> below. To achieve complete validity in the quadrant
  <math|-\<pi\>\<less\>arg z\<leq\>2*\<pi\>> it is necessary to add the
  series

  <\equation>
    <label|eq:additional_series><around|(|1+e<rsup|-2*\<nu\>*i*\<pi\>>|)><sqrt|<frac|2|\<pi\>*z>>*e<rsup|-i*\<phi\>>*<big|sum><rsub|s=0><rsup|\<infty\>><around|(|-i|)><rsup|s><frac|a<rsub|s>|z<rsup|s>>
  </equation>

  to the right of <eqref|eq:hankel_expansion>, whereas of course in the
  Poincaré sense <eqref|eq:additional_series> is negligible compared with the
  right of <eqref|eq:hankel_expansion> when <math|<frac|\<pi\>|2>\<less\>arg
  z\<less\>2*\<pi\>>. Similarly, to achieve complete validity in the quadrant
  <math|-\<pi\>\<less\>arg z\<less\>-<frac|\<pi\>|2>>,
  <eqref|eq:additional_series> is subtracted from the right of
  <eqref|eq:hankel_expansion>.

  By introducing exponentially small contributions of this type the numerical
  difficulties can be overcome satisfactorily in many cases, and in other
  cases, the precise is difficult to justify mathematically, however, without
  an investigation of the remainder term of the given in
  <cite|watson_reference> below. There is no readily applicable general
  definition of complete validity available, nor is it easy to find what
  \Pnumerical significance\Q is too vague a criterion by itself. A drawback
  in practice of Watson's theory of the uniqueness of asymptotic expansions
  <cite|watson_uniqueness> is the need to assess properties of the remainder
  term which are not immediately available in many applications. Furthermore,
  in cases where these properties are known it quite possible that the
  statistic bound for the remainder term is also known, thereby obviating the
  need for the theory for numerical purposes. This is certainly true of the
  example given in Watson's paper <cite|watson_paper>.

  The difficulty of recognizing when to include the numerical contribution of
  an exponentially small term in an asymptotic expansion is illustrated by
  the following example, which arose some years ago in computations at the
  National Physical Laboratory, Teddington.

  Let

  <\equation>
    <label|eq:integral_example>I<around|(|n|)>=<big|int><rsub|0><rsup|\<pi\>><frac|cos
    n*t|t<rsup|2>+1>*d*t
  </equation>

  By repeated integration by parts, one readily shows that for large positive
  integer values of <math|n>, <math|I<around|(|n|)>> has the Poincaré
  expansion

  <\equation>
    <label|eq:poincare_expansion>I<around|(|n|)>\<sim\><around|(|-1|)><rsup|n-1>*<around*|(|<frac|\<lambda\><rsub|1>|n>-<frac|\<lambda\><rsub|2>|n<rsup|2>>+<frac|\<lambda\><rsub|3>|n<rsup|3>>-\<cdots\>|)>
  </equation>

  in which the coefficients <math|\<lambda\><rsub|s>> are given by

  <\equation>
    <label|eq:lambda_coefficients>\<lambda\><rsub|s>=<around|(|n<rsup|2>+1|)><rsup|-2*s>*p<rsub|2*s-1><around|(|n|)>
  </equation>

  the <math|p<rsub|s><around|(|t|)>> being polynomials in <math|t> of degree
  <math|s>, defined recursively by <math|p<rsub|0><around|(|t|)>=1>, and

  <\equation>
    <label|eq:recursive_polynomials>p<rsub|s><around|(|t|)>=2*a*t\<cdot\>p<rsub|s-1><around|(|t|)>-<around|(|t<rsup|2>+1|)>*p<rprime|'><rsub|s-1><around|(|t|)><space|1em><around|(|s=1,2,\<ldots\>|)>.
  </equation>

  Explicit expressions for the first six polynomials are

  <\align>
    <tformat|<table|<row|<cell|p<rsub|0><around|(|t|)>>|<cell|=1<space|1em>p<rsub|1><around|(|t|)>=2*t<space|1em>p<rsub|2><around|(|t|)>=2*<around|(|3*t<rsup|2>-1|)><space|1em>p<rsub|3><around|(|t|)>=24*<around|(|t<rsup|3>-t|)><eq-number><label|eq:explicit_polynomials>>>|<row|<cell|p<rsub|4><around|(|t|)>>|<cell|=24*<around|(|5*t<rsup|4>-10*t<rsup|2>+1|)><space|1em>p<rsub|5><around|(|t|)>=240*<around|(|3*t<rsup|5>-10*t<rsup|3>+3*t|)><eq-number>>>>>
  </align>

  and on numerical evaluation, one obtains to five decimals

  <\equation>
    <label|eq:numerical_values>\<lambda\><rsub|1>=0.05318<space|1em>\<lambda\><rsub|2>=0.04791<space|1em>\<lambda\><rsub|3>=0.08985
  </equation>

  Thus for <math|n=10>, the series <eqref|eq:poincare_expansion> gives

  <\equation>
    <label|eq:series_result>I<around|(|10|)>\<approx\>-<around|(|0.0005318-0.0000048+0.0000001-\<cdots\>|)>=-0.0005271.
  </equation>

  This answer is quite incorrect however, because direct numerical quadrature
  of the expression <eqref|eq:integral_example> yields, to seven decimals,

  <\equation>
    <label|eq:quadrature_result>I<around|(|10|)>=-0.0004558
  </equation>

  The inclusion of additional terms in the expansion would not help matters,
  and a partial explanation of the discrepancy is as follows. One may write

  <\equation>
    <label|eq:integral_split>I<around|(|n|)>=<big|int><rsub|0><rsup|\<infty\>><frac|cos
    n*t|t<rsup|2>+1>*d*t-<big|int><rsub|\<pi\>><rsup|\<infty\>><frac|cos
    n*t|t<rsup|2>+1>*d*t
  </equation>

  The first of these integrals equals <math|<frac|\<pi\>|2>*e<rsup|-n>>; the
  second may again be expanded by repeated partial integration. In this way,
  one finds that\ 

  <\equation>
    <label|eq:alternative_expansion>I<around|(|n|)>\<sim\><frac|1|2>*\<pi\>*e<rsup|-n>+<around|(|-1|)><rsup|n-1>*<around*|(|<frac|\<lambda\><rsub|1>|n<rsup|2>>-<frac|\<lambda\><rsub|2>|n<rsup|4>>+<frac|\<lambda\><rsub|3>|n<rsup|6>>-\<cdots\>|)>
  </equation>

  where the <math|\<lambda\><rsub|s>> are the same as in
  <eqref|eq:lambda_coefficients>. From this result one obtains the correct
  numerical value at <math|n=10>, because

  <\equation>
    <label|eq:correct_value><frac|1|2>*\<pi\>*e<rsup|-10>=0.0000713
  </equation>

  which is exactly the discrepancy between the values
  <eqref|eq:series_result> and <eqref|eq:quadrature_result>.

  An alternative way of deriving <eqref|eq:alternative_expansion> is to apply
  the Residue theorem and Watson's lemma <cite|watson_lemma>, page 236, to
  the contour integral

  <\equation>
    <label|eq:contour_integral><big|int><rsub|C><frac|e<rsup|i*n*t>|t<rsup|2>+1>**d*t
  </equation>

  where <math|C> is the rectangle having vertices <math|\<pm\>\<pi\>> and
  <math|\<pm\>\<pi\>+i>.

  In the sense of Miller and Watson, <eqref|eq:alternative_expansion> is
  apparently a complete asymptotic expansion for positive integer <math|n>,
  whereas <eqref|eq:poincare_expansion> is incomplete. There is, however, no
  self-evident conclusive mathematical reason why this should be so, in fact
  <eqref|eq:alternative_expansion> was obtained by less obvious procedures.
  It is even possible that <eqref|eq:alternative_expansion> is itself
  incomplete, for without further investigation one does not know whether or
  not there have been neglected other exponential terms, for example
  <math|e<rsup|-2*n>>, which make numerically significant contributions for
  smaller values of <math|n>.

  <section|The need for error bounds><label|sec:need_error_bounds>

  The difficulty illustrated by the examples of the previous sections is
  linked to a fundamental weakness of the Poincaré definition: it provides no
  direct answer to the question \PWhat is the precise relation between an
  asymptotic expansion and the function from which it is derived?\Q Thus
  strictly speaking there is no connection between pure asymptotics and
  applied mathematics, except in the limit <math|<around|\||z|\|>=\<infty\>>.
  To establish a connection, two courses are open. Either one can seek upper
  bounds for the differences between the partial sums of an asymptotic
  expansion and the function from which it was obtained, or one can endeavour
  to transform the expansion into a convergent form, as, for example, in
  <cite|reference17> and <cite|reference19>. In the present paper the authors
  confine themselves to the former possibility.

  Although the theory of pure asymptotics has been extensively developed and
  applied, the corresponding theory of error bounds has been comparatively
  neglected. The literature on this aspect consists mainly of scattered
  results applicable to special functions.

  The few theorems of a general nature which have been discovered
  <cite|reference3>, <cite|reference5>, are concerned with asymptotic
  expansions of integral representations with real variables. (The example of
  <eqref|eq:integral_example>, incidentally, is not covered by these
  theorems.) A possible reason for this neglect is the belief
  <cite|reference1>, <cite|reference17>, that when error bounds are needed
  they can be obtained merely by retracing the steps of the asymptotic proof.
  This is frequently a difficult and tedious undertaking, and the bounds it
  yields are often quite unrealistic. There is no readily applicable general
  theorem, and the writer's experience with expansions arising from
  differential equations indicates that it may often be necessary to develop
  entirely new proofs of the theorems of pure asymptotics before attempting
  to follow through explicit treatment of the error terms.

  In this connection, attention may be drawn to the suggestion of Wyman
  <cite|wyman> that the main direction in which the modern theory of
  asymptotics will move is towards the use of more general concepts in the
  theory of pure asymptotics. The importance of investigating such
  generalizations is indisputable, but perhaps there is a need to stress that
  the bridging of a gap between pure and applied mathematics in this branch
  of analysis by the development of satisfactory theories of error bounds is
  also of importance. Moreover, such theories may sometimes provide an
  alternative way of overcoming one of the difficulties which has helped
  stimulate the recent further generalizations <cite|reference6> in the
  definition of an asymptotic expansion: the need to avoid narrow concepts
  concerning both the choice of asymptotic variable for a given expansion,
  and the nature of the uniformity of the expansion with respect to other
  variables.

  This observation may be illustrated briefly by the following example. In
  <cite|reference17>, <eqref|eq:reference_6_31>, Erdélyi and Wyman have
  published a generalized series expansion in terms of Airy functions for the
  Hankel function <math|H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|x|)>>
  when <math|\<nu\>> and <math|x> are real and positive, having a \Pscale\Q

  <\equation>
    <label|eq:scale_function>\<tau\><rsup|-1>*<around|(|2*m/3|)>*<space|1em><text|as><space|1em>\<tau\>\<to\>\<infty\>,<space|1em><text|where>
  </equation>

  <\equation>
    <label|eq:tau_definition>\<tau\>=<around|\||<frac|1|4>*<around|(|\<nu\><rsup|2>-x<rsup|2>|)>|\|><rsup|1/2>+<around|(|<frac|1|2>*\<nu\>|)><rsup|3/2>
  </equation>

  This means that for each fixed integer <math|m>, the
  <math|<around|(|m+1|)>>th partial sum of the series differs from
  <math|H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|x|)>> by
  <math|o<around|(|\<tau\><rsup|-1-<around|(|2*m/3|)>>|)>> as
  <math|\<tau\>\<to\>\<infty\>>. Thus these authors have succeeded in
  describing the behaviour of <math|H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|x|)>>
  when either <math|x> or <math|\<nu\>> is large by means of a single
  asymptotic expansion. Other investigators, using Poincaré expansions, have
  had to distinguish between the two cases. Recently however, the present
  writer <cite|present_writer> has derived sharp error bounds for the most

  powerful of the existing Poincaré-type expansions for
  <math|H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|x|)>> for large
  <math|x>, namely the uniform expansion in terms of Airy functions. From
  these bounds it can be seen that although the expansion was derived on the
  assumption that <math|\<nu\>> is large, it also has an asymptotic property
  for large <math|x>. Indeed, without going into detailed proof, it can be
  stated that the uniform expansion in terms of Airy functions for large
  <math|x> is also a generalized expansion, in the sense of Erdélyi, this
  time with respect to the scale <math|<around|\||<around|(|\<nu\>*t|)><rsup|-m*<around|(|x-\<nu\>|)>>|\|>>
  as <math|x\<to\>\<infty\>>, for any non-negative number <math|\<delta\>>.
  This is, in fact, a considerably more powerful scale than that of the new
  expansion.

  (Notwithstanding the generally and greater power of the Airy function
  expansion, the Poincaré-type expansion of
  <math|H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|x|)>> for fixed
  <math|\<nu\>> and large <math|x> remains important, owing to its
  simplicity, and a further study of it is made in <eqref|eq:sections_5_7>.)

  <section|Nature of the error bounds><label|sec:nature_error_bounds>

  In seeking bounds for the error term of the partial expansion of the form
  <eqref|eq:remainder_definition>, what kind of success can be hoped for? If
  <math|t<rsub|m>> is non-zero, then on replacing <math|x> by the complex
  variable <math|z>, the bound <math|<around|\||\<epsilon\><rsub|m><around|(|z|)>|\|>\<sim\><around|\||t<rsub|m>*z<rsup|-m>|\|>>.
  Hence the most that can be established, in general, is that
  <math|<around|\||\<epsilon\><rsub|m><around|(|z|)>|\|>> is bounded by the
  modulus of the first (non-vanishing) neglected term of the series. This
  bound cannot apply when <math|<around|\||arg
  t<rsub|m+1>/<around|(|z*t<rsub|m>|)>|\|>\<less\><frac|1|2>*\<pi\>>,
  however, for the modulus of the right side of the equation

  <\equation>
    <label|eq:error_bound_equation>\<epsilon\><rsub|m><around|(|z|)>=t<rsub|m>*z<rsup|-m>+t<rsub|m+1>*z<rsup|-m-1>+o<around|(|<around|\||z|\|><rsup|-m-1>|)>
  </equation>

  would exceed that of its first term for all sufficiently large
  <math|<around|\||z|\|>>. In particular, this happens when <math|t<rsub|m>>
  and <math|t<rsub|m+1>> are real and of the same sign, and <math|z> is real
  and positive.

  A modest error bound which would always be feasible is a multiple
  <math|(\<gtr\>1)> of the modulus of the first non-vanishing neglected term.
  This multiple itself could depend on <math|z>, and then ideally it would
  tend to unity as <math|<around|\||z|\|>\<to\>\<infty\>>. The last condition
  is not essential from the standpoint of most applications however, and a
  bound of this kind if likely to be quite satisfactory with any value of
  <math|<around|\||z|\|>> not too large. Perhaps this can be appreciated best
  by observing that for a specified precision in <math|<around|(|z|)>>, the
  difference between having <math|<around|\||p<rsub|m>*t<rsub|m>*z<rsup|-m>|\|>>
  and <math|<around|\||t<rsub|m>*z<rsup|-m>|\|>> as bounds for
  <math|\<epsilon\><rsub|m><around|(|z|)>> only affects the minimum allowable
  value of <math|<around|\||z|\|>> by the factor
  <math|<around|(|p<rsub|m>|)><rsup|1/m>>. Certainly, for example, if
  <math|p<rsub|m>\<less\>10> there are few situations in which such a
  reduction in the region of applicability is likely to be of importance.
  From this point of view, the expenditure of heavy analytical effort to
  achieve a slight reduction in the value of <math|p<rsub|m>> is unjustified,
  except possibly in the case of the dominant term <math|<around|(|m=1|)>> of
  the expansion.

  <section|Hankel functions of large argument><label|sec:hankel_functions>

  The following theorem is obtained from Theorem 7 of <cite|reference12> by
  taking the parameter <math|u> occurring there to be unity, and making minor
  changes:

  <\theorem>
    <label|thm:hankel_functions>Let <math|f<around|(|z|)>> be regular in a
    simply-connected complex domain <math|D>, and a sequence of functions
    <math|A<rsub|s><around|(|z|)>> be defined by
    <math|A<rsub|0><around|(|z|)>=1> and

    <\equation>
      <label|eq:hankel_recurrence>A<rsub|s+1><around|(|z|)>=-<frac|1|2>*A<rsub|s><rprime|'><around|(|z|)>+<frac|1|4>*<big|int>f<around|(|z|)>*A<rsub|s><around|(|z|)>*d*z*<space|1em><around|(|s=0,1,\<ldots\>|)>
    </equation>
  </theorem>

  Then the differential equation

  <\equation>
    <label|eq:hankel_differential><frac|d<rsup|2>*w|d*z<rsup|2>>=<around|{|1+f<around|(|z|)>|}>*w
  </equation>

  has a solution <math|w<rsub|m><around|(|z|)>>, depending on an arbitrary
  point <math|a> of <math|D> and an arbitrary positive integer <math|m>, such
  that

  <\equation>
    <label|eq:hankel_solution>w<rsub|m><around|(|z|)>=e<rsup|z><around*|[|<big|sum><rsub|s=0><rsup|m-1><frac|A<rsub|s><around|(|z|)>+\<epsilon\><rsub|m><around|(|z|)>|z<rsup|s>>|]>
  </equation>

  and

  <\equation>
    <label|eq:hankel_solution_prime>w<rsub|m><rprime|'><around|(|z|)>=e<rsup|z>*<around*|[|<big|sum><rsub|s=0><rsup|m-1><around|{|A<rsub|s><around|(|z|)>+A<rsub|s><rprime|'><around|(|z|)>|}>+\<eta\><rsub|m><around|(|z|)>|]>
  </equation>

  where

  A form of error bound which has emerged from recent investigations by the
  writer <cite|reference12>, <cite|reference13> of the asymptotic solutions
  of certain second-order differential equations with respect to a parameter
  effectively consists of the variation, that is, the integral of the modulus
  of the derivative, of the first neglected term of the series taken over a
  suitable contour. More recent work, in preparation for publication, has
  shown that bounds of this type are also applicable, in certain cases, to
  asymptotic expansions of solutions for differential equations without a
  parameter <math|z\<to\>\<infty\>> and <math|<around|(|1.01|)>>, and from
  the observations made in <eqref|eq:sections_1_1> might expect that as
  <math|z> approaches the boundaries of the regions of validity, the contour
  of integration would naturally be subject to certain restrictions, and from
  the observations made in <eqref|eq:sections_1_1> we might expect that the
  bound it decreases in <math|\<Re\>*z>.

  In the remaining part of this paper, it is shown that this variational form
  of error bound is applicable to the standard cylinder functions of large
  argument, and that it does indeed have the feature just described.

  <\equation>
    <label|eq:epsilon_m_bound><around|\||\<epsilon\><rsub|m><around|(|z|)>|\|>,<around|\||\<eta\><rsub|m><around|(|z|)>|\|>\<leq\>2*exp
    <around|{|2<around|\||u|\|>\<cdot\><around|(|A<rsub|s>|)><rsub|P>|}>\<cdot\><around|(|A<rsub|s>|)><rsub|P>\<cdot\>\<epsilon\><rsub|m>\<cdot\>H<around|(|a|)>
  </equation>

  In this result the symbol <math|V<rsub|a,z><around|(|A<rsub|s>|)>> denotes
  the variation of the function <math|A<rsub|s>> over a path <math|P>
  connecting <math|a> and <math|z>, given by

  <\equation>
    <label|eq:variation_definition>V<rsub|a,z><around|(|A<rsub|s>|)>=<big|int><rsub|P><around|\||A<rsub|s><rprime|'><around|(|t|)>|\|>*d*t
  </equation>

  similarly for <math|V<rsub|a,z><around|(|A<rsub|s><rprime|'>|)>>. The
  region <math|H<around|(|a|)>> is the subset of <math|D> comprising those
  points for which there exists a path <math|P> such that:

  <\enumerate>
    <item><math|P> lies entirely in <math|D>;

    <item><math|P> consists of a finite number of Jordan arcs, each having a
    parametric equation of the form <math|t=t<around|(|\<tau\>|)>> with
    <math|t<rprime|'><around|(|\<tau\>|)>> continuous and
    <math|t<rprime|'><around|(|\<tau\>|)>> non-vanishing;

    <item><math|\<Re\>*t> is monotonic non-decreasing as <math|t> traverses
    <math|P> from <math|a> to <math|z>.
  </enumerate>

  The point <math|a>, incidentally, may be the point at infinity on a
  straight line <math|t> lying in <math|D>; in this event one supposes that
  <math|P> coincides with <math|t> for all sufficiently large
  <math|<around|\||t|\|>>.

  The original purpose of this theorem was to provide asymptotic developments
  of solutions of <eqref|eq:hankel_differential>, complete with error bounds,
  when <math|f<around|(|z|)>> depends on a large parameter <math|u>. Suppose,
  however, that the parameter is absent, and

  <\equation>
    <label|eq:f_asymptotic>f<around|(|z|)>\<sim\>k*z<rsup|-1-\<sigma\>><space|1em><text|as><space|1em><around|\||z|\|>\<to\>\<infty\>
  </equation>

  where <math|k,\<sigma\>> are constants and <math|\<sigma\>\<gtr\>0>. Then
  for large <math|<around|\||z|\|>>, <eqref|eq:hankel_solution> and
  <eqref|eq:hankel_solution_prime> are generalized asymptotic developments,
  complete with error bounds. For if the limits of integration on the right
  of <eqref|eq:hankel_solution> are taken to be <math|a=\<infty\>> and
  <math|z>, it readily follows by induction that
  <math|A<rsub|s><around|(|z|)>=O<around|(|<around|\||z|\|><rsup|-s*\<sigma\><rsub|1>>|)>>
  (<math|s=1,2,\<ldots\>>), where <math|\<sigma\><rsub|1>=min
  <around|(|\<sigma\>,1|)>>. Moreover, from <eqref|eq:variation_definition>,
  with <math|a=\<infty\>>, one derives <math|\<epsilon\><rsub|m><around|(|z|)>,\<eta\><rsub|m><around|(|z|)>=O<around|(|<around|\||z|\|><rsup|-m*\<sigma\><rsub|1>>|)>>.

  Thus in the sense of Erdélyi <cite|erdelyi>, equations
  <eqref|eq:hankel_solution> and <eqref|eq:hankel_solution_prime> are
  generalized asymptotic expansions with respect to the scale
  <math|<around|{|<around|\||z|\|><rsup|-s*\<sigma\><rsub|1>>|}>> as
  <math|<around|\||z|\|>\<to\>\<infty\>>.

  The expansion <eqref|eq:hankel_solution> is generally less convenient than
  the usual Thomé asymptotic expansions in descending powers of <math|z>
  <cite|reference5>, <cite|reference2>, because of the need to evaluate the
  functions <math|A<rsub|s><around|(|z|)>> for <math|s\<geq\>1>. The case of
  Bessel's differential equation is special, however, in that the two forms
  of expansion become the same with a suitable choice of
  <math|f<around|(|z|)>>.

  Set

  <\equation>
    <label|eq:bessel_f>f<around|(|z|)>=<around|(|\<nu\><rsup|2>-<frac|1|4>|)>/z<rsup|2>
  </equation>

  where <math|\<nu\>> is a constant. The solution of equation
  <eqref|eq:hankel_differential> is then given by
  <math|w=z<rsup|1/2>*C<rsub|\<nu\>>*<around|(|\<pm\>i*z|)>>, where
  <math|C<rsub|\<nu\>>> denotes the general cylinder function of order
  <math|\<nu\>>. Applying the theorem with <math|a=-\<infty\>>, and replacing
  <math|z> by <math|i*z>, one constructs a solution

  <\equation>
    <label|eq:bessel_solution>w<rsub|m>=e<rsup|i*z>*<around*|{|<big|sum><rsub|s=0><rsup|m-1><frac|a<rsub|s>|z<rsup|s>>+\<epsilon\><rsub|m>|}>
  </equation>

  in which <math|a<rsub|s>> is defined by <eqref|eq:hankel_coefficients> and

  <\equation>
    <label|eq:bessel_error_bound><around|\||\<epsilon\><rsub|m>|\|>\<leq\>2*exp
    <around|{|<around|\||\<nu\><rsup|2>-<frac|1|4>|\|>*V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-m>|)>|}>*V<rsub|i*\<infty\>,z>*<around|(|a<rsub|m>*\<tau\><rsup|-m>|)>
  </equation>

  The path of variation is subject to the condition that <math|\<Im\>*t> is
  monotonic, and this restricts <math|z> to the region
  <math|-\<pi\>\<less\>arg z\<less\>2*\<pi\>>.

  Clearly

  <\equation>
    <label|eq:bessel_hankel_relation>w<rsub|m>=A*z<rsup|1/2>*H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|z|)>+B*z<rsup|1/2>*H<rsub|\<nu\>><rsup|<around|(|2|)>><around|(|z|)>,
  </equation>

  where <math|A,B> are independent of <math|z>. Letting
  <math|z\<to\>i*\<infty\>>, one sees that <math|C=0> and
  <math|e<rsup|i*\<nu\>*\<pi\>>=-1>. Using the known asymptotic forms of the
  Hankel functions <cite|reference18>, one deduces that <math|B=0> and
  <math|A=<around|(|<frac|1|2>*i|)><rsup|1/2>*e<rsup|i*<around|(|<frac|1|2>*\<nu\>+<frac|1|4>|)>*\<pi\>>>.
  Thus one derives the main result of this section:

  <\equation>
    <label|eq:main_hankel_result>H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|z|)>=<around*|(|<frac|2|\<pi\>*z>|)><rsup|1/2>*e<rsup|i*<around|(|z-<frac|1|2>*\<nu\>*\<pi\>-<frac|1|4>*\<pi\>|)>>*<around*|{|<big|sum><rsub|s=0><rsup|m-1><frac|i<rsup|s>*a<rsub|s>|z<rsup|s>>+\<epsilon\><rsub|m>|}>
  </equation>

  when <math|-\<pi\>\<less\>arg z\<less\>2*\<pi\>>, where
  <math|\<epsilon\><rsub|m>> is subject to <eqref|eq:bessel_error_bound>. The
  bound is now proceed to an evaluation of this bound.

  <section|Evaluation of the variations><label|sec:evaluation_variations>

  The problem discussed in this section is the choice of the path <math|P>
  connecting <math|i*\<infty\>> and <math|z> to minimize the quantity

  <\equation>
    <label|eq:minimize_quantity>V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-m>|)>=m*<big|int><rsub|P><around|\||\<tau\><rsup|-m-1>|\|>*d*t\|<space|1em><around|(|m\<geq\>1|)>
  </equation>

  One writes <math|\<theta\>=arg z-<frac|1|2>*\<pi\>>, and considers in turn
  the cases <math|<around|\||\<theta\>|\|>\<leq\><frac|1|2>*\<pi\>>,
  <math|<frac|1|2>*\<pi\>\<less\><around|\||\<theta\>|\|>\<leq\>\<pi\>>,
  <math|\<pi\>\<less\><around|\||\<theta\>|\|>\<less\><frac|3|2>*\<pi\>>.

  <\enumerate>
    <item><math|<around|\||\<theta\>|\|>\<leq\><frac|1|2>*\<pi\>>. Consider
    the path which is indicated on Figure<nbsp><reference|fig:path_1> when
    <math|\<theta\>> is positive and is its image in the imaginary axis when
    <math|\<theta\>> is negative. It comprises part of the imaginary axis, a
    circular arc of radius <math|R> centred at the origin, where
    <math|R\<gtr\><around|\||z|\|>> is arbitrary, and the straight line with
    parametric equation

    <\equation>
      <label|eq:parametric_line>t=z+\<tau\>*e<rsup|i*<around|(|\<theta\>+<frac|1|2>*\<pi\>|)>>*<space|1em><around|(|0\<leq\>\<tau\>\<leq\>R-<around|\||z|\|>|)>
    </equation>

    As <math|R\<to\>\<infty\>> the contributions to the variation from the
    imaginary axis and the circular arc both vanish, and one obtains

    <\equation>
      <label|eq:variation_limit_1>lim<rsub|R\<to\>\<infty\>>
      V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-m>|)>=<big|int><rsub|0><rsup|\<infty\>><frac|m*|<around|\||z+\<tau\>*e<rsup|i*<around|(|\<theta\>+<frac|1|2>*\<pi\>|)>>|\|><rsup|m+1>>d*t=<big|int><rsub|0><rsup|\<infty\>><frac|m*|<around|\||z|\|><rsup|m>>d*t
    </equation>

    Since this actually equals the modulus of the difference between the
    values of <math|\<tau\><rsup|-m>> at the extremities of the path, no
    other path can yield a smaller variation.

    <item><math|<frac|1|2>*\<pi\>\<less\><around|\||\<theta\>|\|>\<leq\>\<pi\>>.
    Consider the path indicated in Figure<nbsp><reference|fig:path_2>. Again,
    as the radius <math|R> of the circular arc tends to infinity the
    contributions from this arc and the imaginary axis both vanish, and one
    obtains

    <\equation>
      <label|eq:variation_limit_2>V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-m>|)>=<big|int><rsub|0><rsup|\<infty\>><frac|m*d*t|<around|\||z-\<tau\>|\|><rsup|m+1>>=<big|int><rsub|0><rsup|\<infty\>><frac|m*d*t|<around|(|\<tau\>+<around|\||z|\|>|)><rsup|2>+y<rsup|2>>\<cdot\><frac|1|<around|\||\<tau\>|\|><rsup|m+1>>
    </equation>

    where <math|x> and <math|y> denote the real and imaginary parts of
    <math|z>, respectively.

    That this path minimizes the variation can be seen as follows. Let one
    travel a prescribed distance <math|\<tau\>> along any admissible path
    from <math|z>, arriving at <math|t<rsub|0>> say. For the path of
    Figure<nbsp><reference|fig:path_2> one has <math|t<rsub|0>=z-\<tau\>>,
    and for any other path <math|t> lies within or on the circle centred at
    <math|z> and passing through <math|t<rsub|0>>; see
    Figure<nbsp><reference|fig:path_3>. Clearly
    <math|<around|\||t|\|>\<gtr\><around|\||t<rsub|0>|\|>> only if <math|t>
    lies within the shaded lune bounded by this circle and the circular arc
    centred at the origin and passing through <math|t<rsub|0>>. No path can
    be admitted to this lune however, because <math|\<Im\>*t\<less\>\<Im\>*z>
    in its interior. Hence <math|<around|\||t|\|>\<leq\><around|\||t<rsub|0>|\|>>,
    which leads to the stated result of this paragraph.

    The integral <eqref|eq:variation_limit_2> can be evaluated in terms of
    elementary functions for all integer values of <math|m>; for example

    <\equation>
      <label|eq:variation_elementary>V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-1>|)>=<around*|\||<frac|1|2>-tan<rsup|-1>
      <frac|<around|\||z|\|>|y>|\|>*<space|1em><around|(|y\<neq\>0|)>,
    </equation>

    <\equation>
      <label|eq:variation_y_zero>V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-1>|)>=<frac|1|<around|\||x|\|>>*<space|1em><around|(|y=0|)>.
    </equation>

    To avoid unnecessary complication however, the bound is established by
    the slightly weaker form

    <\equation>
      <label|eq:weaker_bound>V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-m>|)>\<leq\><big|int><rsub|0><rsup|\<infty\>><frac|m*d*\<tau\>|<around|(|\<tau\><rsup|2>+x<rsup|2>+y<rsup|2>|)><rsup|1/2*m+1/2>>=<frac|\<chi\><around|(|m|)>|<around|\||z|\|><rsup|m>>,
    </equation>

    in which

    <\equation>
      <label|eq:chi_definition>\<chi\><around|(|m|)>=<sqrt|\<pi\>>*<frac|\<Gamma\>*<around|(|<frac|1|2>*m+1|)>|\<Gamma\>*<around|(|<frac|1|2>*m+<frac|1|2>|)>>.
    </equation>

    This bound is in fact attained when <math|x=0>.

    <item><math|\<pi\>\<less\><around|\||\<theta\>|\|>\<less\><frac|3|2>*\<pi\>>.
    The minimizing path is indicated on Figure<nbsp><reference|fig:path_4>.
    To prove this assertion, let any other path intersect the negative
    imaginary axis at the point <math|i*\<mu\>>. If <math|\<kappa\>\<neq\>y>
    the result follows immediately from (ii), hence one supposes that
    <math|\<kappa\>=y\<gtr\>0>. On travelling a distance <math|\<tau\>> from
    <math|i*\<mu\>> towards <math|z> one arrives at a point <math|t>
    somewhere within or on the smaller circle of
    Figure<nbsp><reference|fig:path_5>, whereas on the minimizing path one
    arrives at <math|t<rsub|0>=i*\<mu\>+\<tau\>>. Again one has
    <math|<around|\||t|\|>\<leq\><around|\||t<rsub|0>|\|>> except within the
    inadmissible lune.

    On letting <math|R\<to\>\<infty\>>, one obtains

    <\equation>
      <label|eq:path_4_variation>V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-m>|)>=<big|int><rsub|y><rsup|\<infty\>><frac|m*d*\<tau\>|<around|\||m+1|\|>>=<big|int><rsub|0><rsup|\<infty\>><frac|m*d*\<tau\>|<around|\||i*y+\<tau\>|\|><rsup|m+1>>+<big|int><rsub|0><rsup|\<infty\>><frac|m*d*\<tau\>|<around|\||i*y+\<tau\>|\|><rsup|m+1>>
    </equation>

    The last of these integrals equals <math|\<chi\><around|(|m|)><around|\||y|\|><rsup|-m>>
    and the one before it is bounded by this quantity. Therefore

    <\equation>
      <label|eq:final_bound>V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-m>|)>\<less\>2*\<chi\><around|(|m|)>*<around|\||\<Im\>*z|\|><rsup|-m>
    </equation>

    One observes that as <math|arg z> approaches either of its extreme values
    <math|-\<pi\>> and <math|2*\<pi\>>, <math|V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-m>|)>>
    becomes increasingly large, as anticipated in ŸŸ1 and 4 above.
  </enumerate>

  <section|Collected results for cylinder
  functions><label|sec:collected_results>

  On combining the analysis of the last two sections and extending it by
  means of <eqref|eq:hankel_solution_prime> to the derivative
  <math|<frac|d|d*z>*H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|z|)>>, one
  has the following results, in which <math|\<nu\>> is an unrestricted real
  or complex number.

  <\equation>
    <label|eq:hankel_main_result>H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|z|)>=<around*|(|<frac|2|\<pi\>*z>|)><rsup|1/2>*e<rsup|i*\<phi\>>*<around*|{|<big|sum><rsub|s=0><rsup|m-1><frac|i<rsup|s>*a<rsub|s>|z<rsup|s>>+\<epsilon\><rsub|m>|}>
  </equation>

  <\equation>
    <label|eq:hankel_derivative_result><frac|d|d*z>*H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|z|)>=<around*|(|<frac|2|\<pi\>*z>|)><rsup|1/2>*i*e<rsup|i*\<phi\>>*<around*|{|<big|sum><rsub|s=0><rsup|m-1>i<rsup|s>*<frac|b<rsub|s>|z<rsup|s>>+i<rsup|m>*<frac|<around|(|b<rsub|m>-a<rsub|m>|)>|z<rsup|m>>+\<eta\><rsub|m>+<frac|1|2*z>*\<epsilon\><rsub|m>|}>
  </equation>

  where <math|\<phi\>=z-<frac|1|2>*\<nu\>*\<pi\>-<frac|1|4>*\<pi\>>

  <\equation>
    <label|eq:coefficient_formulas>a<rsub|s>=<frac|<around|(|<frac|1|4>*\<nu\><rsup|2>-<frac|1|4>|)>*<around|(|<frac|1|4>*\<nu\><rsup|2>-<frac|9|4>|)>*\<cdots\>*<around|(|<frac|1|4>*\<nu\><rsup|2>-<around|(|2*s-1|)><rsup|2>|)>|8<rsup|s>*s!><space|1em>b<rsub|s>=<frac|4*\<nu\><rsup|2>+4*s<rsup|2>-1|8>*a<rsub|s>
  </equation>

  <\equation>
    <label|eq:error_bounds_final><around|\||\<epsilon\><rsub|m>|\|>,<around|\||\<eta\><rsub|m>|\|>\<leq\>2<around|\||a<rsub|m>|\|>*exp
    <around|{|<around|\||\<nu\><rsup|2>-<frac|1|4>|\|>*V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-1>|)>|}>*V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-m>|)>
  </equation>

  and

  <\equation>
    <label|eq:variation_bounds>V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-m>|)>\<leq\><choice|<tformat|<table|<row|<cell|<around|\||z|\|><rsup|-m>>|<cell|<around|(|0\<leq\>arg
    z\<leq\>\<pi\>|)>>>|<row|<cell|\<chi\><around|(|m|)><around|\||z|\|><rsup|-m>>|<cell|<around|(|-<frac|1|2>*\<pi\>\<less\>arg
    z\<less\>0*<text|or >\<pi\>\<less\>arg
    z\<leq\><frac|3|2>*\<pi\>|)>>>|<row|<cell|2*\<chi\><around|(|m|)>*<around|\||\<Im\>*z|\|><rsup|-m>>|<cell|<around|(|-\<pi\>\<less\>arg
    z\<less\>-<frac|1|2>*\<pi\>*<text|or ><frac|3|2>*\<pi\>\<less\>arg
    z\<less\>2*\<pi\>|)>>>>>>
  </equation>

  In <eqref|eq:hankel_main_result> and <eqref|eq:hankel_derivative_result>
  the branch of <math|z<rsup|1/2>> is <math|exp
  <around|(|<frac|1|2>*ln\|z\|+<frac|1|2>*i*arg z|)>>, and in
  <eqref|eq:variation_bounds> <math|\<chi\><around|(|m|)>> is defined by
  <eqref|eq:chi_definition>. The values of the first ten
  <math|\<chi\><around|(|m|)>> to two decimal places are as follows:

  <\padded-center>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-bborder|1ln>|<table|<row|<cell|<math|m>>|<cell|<math|\<chi\><around|(|m|)>>>|<cell|<math|m>>|<cell|<math|\<chi\><around|(|m|)>>>>|<row|<cell|1>|<cell|1.57>|<cell|6>|<cell|3.20>>|<row|<cell|2>|<cell|2.00>|<cell|7>|<cell|3.44>>|<row|<cell|3>|<cell|2.36>|<cell|8>|<cell|3.66>>|<row|<cell|4>|<cell|2.67>|<cell|9>|<cell|3.87>>|<row|<cell|5>|<cell|2.95>|<cell|10>|<cell|4.06>>>>>
  </padded-center>

  For large <math|m>, <math|\<chi\><around|(|m|)>\<sim\><sqrt|<frac|1|2>*m*\<pi\>>>.

  The corresponding results for <math|H<rsub|\<nu\>><rsup|<around|(|2|)>><around|(|z|)>>
  and its derivative are obtained by changing the sign of <math|i>
  throughout, and replacing the <math|z>-exponential by its respective
  conjugates.

  In applying these results, the bounds for the quantity
  <math|V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-1>|)>> appearing in
  <eqref|eq:error_bounds_final> are obtained by setting <math|m=1> and
  <math|\<chi\><around|(|1|)>=<frac|\<pi\>|2>> in
  <eqref|eq:variation_bounds>. It should be observed that for all values of
  <math|z> in the region <math|-<frac|\<pi\>|2>\<leq\>arg
  z\<leq\><frac|3*\<pi\>|2>> for which the expansions
  <eqref|eq:hankel_main_result> and <eqref|eq:hankel_derivative_result> are
  computationally useful, the factor <math|exp
  <around|{|<around|\||\<nu\><rsup|2>-<frac|1|4>|\|>*V<rsub|i*\<infty\>,z><around|(|\<tau\><rsup|-1>|)>|}>>
  is approximately unity, because a necessary condition that
  <math|<around|\||a<rsub|s+1><rsup|m>|\|>> be small compared with the
  leading term 1 of each series is that <math|<around|\||z|\|>\<gtr\><around|\||\<nu\><rsup|2>-<frac|1|4>|\|>>.

  For other ranges of <math|arg z> use may be made of the connection formula
  <cite|reference18>, Ÿ3.62,

  <\equation>
    <label|eq:connection_formula>H<rsub|\<nu\>><rsup|<around|(|1|)>>*<around|(|z*e<rsup|n*\<pi\>*i>|)>=sin
    <around|(|1-n|)>*\<nu\>*\<pi\>*cos e*c*\<nu\>*\<pi\>*H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|z|)>+sin
    n*\<pi\>*cos e*c*\<nu\>*\<pi\>*H<rsub|\<nu\>><rsup|<around|(|1|)>>*<around|(|z*e<rsup|n*\<pi\>>|)>,
  </equation>

  in which <math|n> is a positive or negative integer. In the application of
  this formula, <math|arg z> can always be taken in the range
  <math|<around|(|-<frac|\<pi\>|2>,<frac|3*\<pi\>|2>|)>>, which means that
  the use of <eqref|eq:hankel_main_result> and
  <eqref|eq:hankel_derivative_result> can be confined to the sector
  <math|-<frac|\<pi\>|2>\<leq\>arg z\<leq\><frac|3*\<pi\>|2>>. Thus the
  direct use of <eqref|eq:hankel_main_result> and
  <eqref|eq:hankel_derivative_result> in the sectors <math|-\<pi\>\<less\>arg
  z\<less\>-<frac|\<pi\>|2>> and <math|<frac|3*\<pi\>|2>\<less\>arg
  z\<less\>2*\<pi\>> is fraught with the danger of a large error term; it can
  be avoided altogether. In effect, the more accurate connection-formula
  procedure improves the accuracy of <eqref|eq:hankel_main_result> and
  <eqref|eq:hankel_derivative_result> in these two sectors by adding in
  appropriate contributions of an exponentially small nature, and accordingly
  provides a rigorous justification, in the present example, of Miller's use
  of complete asymptotic expansions <cite|reference2>.

  Corresponding results for the functions <math|J<rsub|\<nu\>><around|(|z|)>>
  and <math|Y<rsub|\<nu\>><around|(|z|)>> are immediately deducible from
  those for the Hankel functions by means of the relations\ 

  <\equation>
    <label|eq:bessel_jy_relation>J<rsub|\<nu\>><around|(|z|)>=<frac|1|2>*<around|(|H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|z|)>+H<rsub|\<nu\>><rsup|<around|(|2|)>><around|(|z|)>|)>,<space|1em>Y<rsub|\<nu\>><around|(|z|)>=<frac|1|2*i>*<around|(|H<rsub|\<nu\>><rsup|<around|(|2|)>><around|(|z|)>-H<rsub|\<nu\>><rsup|<around|(|1|)>><around|(|z|)>|)>.
  </equation>

  One finds that

  <\align>
    <tformat|<table|<row|<cell|J<rsub|\<nu\>><around|(|z|)>>|<cell|=<around*|(|<frac|2|\<pi\>*z>|)><rsup|1/2>*<around*|{|cos
    \<phi\>*<big|sum><rsub|s=0><rsup|m-1><around|(|-1|)><rsup|s><frac|a<rsub|2*s>|z<rsup|2*s>>-sin
    \<phi\>*<big|sum><rsub|s=0><rsup|m-1><around|(|-1|)><rsup|s><frac|a<rsub|2*s+1>|z<rsup|2*s+1>>+\<epsilon\><rsub|2*m>|}><eq-number><label|eq:j_nu_expansion>>>|<row|<cell|>|<cell|=<around*|(|<frac|2|\<pi\>*z>|)><rsup|1/2>*<around*|{|cos
    \<phi\>*<big|sum><rsub|s=0><rsup|m><around|(|-1|)><rsup|s><frac|a<rsub|2*s>|z<rsup|2*s>>-sin
    \<phi\>*<big|sum><rsub|s=0><rsup|m-1><around|(|-1|)><rsup|s><frac|a<rsub|2*s+1>|z<rsup|2*s+1>>+\<epsilon\><rsub|2*m+1>|}>,<eq-number><label|eq:j_nu_expansion_alt>>>>>
  </align>

  and

  <\align>
    <tformat|<table|<row|<cell|Y<rsub|\<nu\>><around|(|z|)>>|<cell|=<around*|(|<frac|2|\<pi\>*z>|)><rsup|1/2>*<around*|{|sin
    \<phi\>*<big|sum><rsub|s=0><rsup|m-1><around|(|-1|)><rsup|s><frac|a<rsub|2*s>|z<rsup|2*s>>+cos
    \<phi\>*<big|sum><rsub|s=0><rsup|m-1><around|(|-1|)><rsup|s><frac|a<rsub|2*s+1>|z<rsup|2*s+1>>+\<beta\><rsub|2*m>|}><eq-number><label|eq:y_nu_expansion>>>|<row|<cell|>|<cell|=<around*|(|<frac|2|\<pi\>*z>|)><rsup|1/2>*<around*|{|sin
    \<phi\>*<big|sum><rsub|s=0><rsup|m><around|(|-1|)><rsup|s><frac|a<rsub|2*s>|z<rsup|2*s>>+cos
    \<phi\>*<big|sum><rsub|s=0><rsup|m-1><around|(|-1|)><rsup|s><frac|a<rsub|2*s+1>|z<rsup|2*s+1>>+\<beta\><rsub|2*m+1>|}>,<eq-number><label|eq:y_nu_expansion_alt>>>>>
  </align>

  where

  <\equation>
    <label|eq:error_bounds_jy_1><around|\||\<alpha\><rsub|m>|\|>,<around|\||\<beta\><rsub|m>|\|>\<leq\><around|(|<around|\||e<rsup|\<nu\>*\<pi\>*i/2>|\|>+<around|\||e<rsup|-\<nu\>*\<pi\>*i/2>|\|>|)>*exp
    <around*|{|<frac|<around|\||\<nu\><rsup|2>-<frac|1|4>|\|>|2>*<frac|<around|\||a<rsub|m>|\|>|z<rsup|m>>|}>*<space|1em><around|(|arg
    z=0|)>,
  </equation>

  <\equation>
    <label|eq:error_bounds_jy_2><around|\||\<alpha\><rsub|m>|\|>,<around|\||\<beta\><rsub|m>|\|>\<leq\><around|(|<around|\||e<rsup|\<pi\><around|\||\<nu\>|\|>/2>|\|>+\<chi\><around|(|m|)><around|\||e<rsup|\<pi\><around|\||\<nu\>|\|>/2>|\|>|)>*exp
    <around*|{|<frac|\<pi\>*<around|\||\<nu\><rsup|2>-<frac|1|4>|\|>|2<around|\||z|\|>>|}><frac|<around|\||a<rsub|m>|\|>|<around|\||z|\|><rsup|m>>*<space|1em><around|(|0\<less\><around|\||arg
    z|\|>\<leq\><frac|1|2>*\<pi\>|)>,
  </equation>

  <\equation>
    <label|eq:error_bounds_jy_3><around|\||\<alpha\><rsub|m>|\|>,<around|\||\<beta\><rsub|m>|\|>\<leq\><around|(|<around|\||e<rsup|\<pi\><around|\||\<nu\>|\|>>|\|>+2*\<chi\><around|(|m|)><around|\||e<rsup|\<pi\><around|\||\<nu\>|\|>>|\|>|)>*exp
    <around*|{|<frac|\<pi\>*<around|\||\<nu\><rsup|2>-<frac|1|4>|\|>|<around|\||\<Im\>*z|\|>>|}><frac|<around|\||a<rsub|m>|\|>|<around|\||\<Re\>*z|\|><rsup|m>>*<space|1em><around|(|<frac|1|2>*\<pi\>\<less\><around|\||arg
    z|\|>\<less\>\<pi\>|)>.
  </equation>

  The upper or lower signs are taken in <eqref|eq:error_bounds_jy_2> and
  <eqref|eq:error_bounds_jy_3>, according as <math|arg z> is positive or
  negative. Again, one sees that to achieve maximum accuracy the use of
  <eqref|eq:j_nu_expansion> and <eqref|eq:y_nu_expansion> should be confined
  to the half-plane <math|<around|\||arg z|\|>\<leq\><frac|1|2>*\<pi\>> and
  connection formulae used elsewhere.

  Next, the modified Bessel functions are considered:

  <\equation>
    <label|eq:modified_bessel_definition>K<rsub|\<nu\>><around|(|z|)>=<frac|\<pi\>|2>*<frac|i<rsup|\<nu\>+1>*H<rsub|\<nu\>><rsup|<around|(|1|)>>*<around|(|i*z|)>|i<rsup|1/2>>,<space|1em>I<rsub|\<nu\>><around|(|z|)>=<frac|1|2>*i<rsup|-\<nu\>-1>*<around|(|H<rsub|\<nu\>><rsup|<around|(|1|)>>*<around|(|i*z|)>+H<rsub|\<nu\>><rsup|<around|(|2|)>>*<around|(|i*z|)>|)>.
  </equation>

  For the former, one derives immediately from <eqref|eq:hankel_main_result>

  <\equation>
    <label|eq:k_nu_expansion>K<rsub|\<nu\>><around|(|z|)>=<around*|(|<frac|\<pi\>|2*z>|)><rsup|1/2>*e<rsup|-z>*<around*|{|<big|sum><rsub|s=0><rsup|m-1><frac|a<rsub|s>|z<rsup|s>>+\<gamma\><rsub|m>|}>,
  </equation>

  where

  <\equation>
    <label|eq:k_nu_error_bounds><around|\||\<gamma\><rsub|m>|\|>\<leq\><choice|<tformat|<table|<row|<cell|2*exp
    <around*|{|-<frac|<around|\||\<nu\><rsup|2>-<frac|1|4>|\|>|<around|\||z|\|>>|}><frac|<around|\||a<rsub|m>|\|>|<around|\||z|\|><rsup|m>>>|<cell|<around|(|<around|\||arg
    z|\|>\<leq\><frac|3|2>*\<pi\>|)>,>>|<row|<cell|2*\<chi\><around|(|m|)>*exp
    <around*|{|<frac|\<pi\>*<around|\||\<nu\><rsup|2>-<frac|1|4>|\|>|2<around|\||z|\|>>|}><frac|<around|\||a<rsub|m>|\|>|<around|\||z|\|><rsup|m>>>|<cell|<around|(|<frac|1|2>*\<pi\>\<less\><around|\||arg
    z|\|>\<leq\>\<pi\>|)>,>>|<row|<cell|4*\<chi\><around|(|m|)>*exp
    <around*|{|<frac|\<pi\>*<around|\||\<nu\><rsup|2>-<frac|1|4>|\|>|<around|\||\<Re\>*z|\|>>|}><frac|<around|\||a<rsub|m>|\|>|<around|\||\<Re\>*z|\|><rsup|m>>>|<cell|<around|(|\<pi\>\<less\><around|\||arg
    z|\|>\<less\><frac|3|2>*\<pi\>|)>.>>>>>
  </equation>

  For the latter, one finds that

  <\equation>
    <label|eq:i_nu_expansion>I<rsub|\<nu\>><around|(|z|)>=<frac|e<rsup|z>|<around|(|2*\<pi\>*z|)><rsup|1/2>>*<around*|{|<big|sum><rsub|s=0><rsup|m-1><around|(|-1|)><rsup|s><frac|a<rsub|s>|z<rsup|s>>+\<delta\><rsub|m>|}>-i*e<rsup|-\<nu\>*\<pi\>*i>*<frac|e<rsup|-z>|<around|(|2*\<pi\>*z|)><rsup|1/2>>*<around*|{|<big|sum><rsub|s=0><rsup|m-1><frac|a<rsub|s>|z<rsup|s>>+\<gamma\><rsub|m>|}>*<space|1em><around|(|-<frac|3|2>*\<pi\>\<less\>arg
    z\<less\><frac|1|2>*\<pi\>|)>.
  </equation>

  Here <math|\<gamma\><rsub|m>> is the same as in <eqref|eq:k_nu_expansion>
  and is therefore bounded by <eqref|eq:k_nu_error_bounds>;
  <math|\<delta\><rsub|m>> also is subject to <eqref|eq:k_nu_error_bounds>
  except that the applicable regions are changed to

  <math|-<frac|3|2>*\<pi\>\<leq\>arg z\<leq\>-<frac|1|2>*\<pi\>>,
  <math|-<frac|1|2>*\<pi\>\<less\>arg z\<leq\>0>, <math|0\<less\>arg
  z\<less\><frac|1|2>*\<pi\>>,

  respectively.

  Again, the use of <eqref|eq:k_nu_expansion> and <eqref|eq:i_nu_expansion>
  should be confined to the regions <math|<around|\||arg z|\|>\<leq\>\<pi\>>
  and <math|-\<pi\>\<leq\>arg z\<leq\>0>, respectively, and connection
  formulae used elsewhere. In particular, by using the relation

  <math|I<rsub|\<nu\>><around|(|z|)>=e<rsup|-\<nu\>*\<pi\>*i>*I<rsub|\<nu\>>*<around|(|z*e<rsup|\<pi\>*i>|)>>
  one deduces from <eqref|eq:i_nu_expansion> its conjugate form applicable to
  the region <math|0\<leq\>arg z\<leq\>\<pi\>>.

  Finally, one observes that by setting <math|\<nu\>=<frac|1|2>> and
  <math|<frac|3|2>> one may deduce error bounds for the asymptotic expansions
  of the Airy functions and their derivatives, but these shall not be
  recorded here.

  The above bounds are by no means the first which have been given for the
  remainder terms in the Hankel expansions of Watson <cite|watson_hankel>,
  pages 205\U220, describes in detail researches of Hankel, Stieltjes and
  himself for real <math|\<nu\>> and positive <math|z>, and of Weber and
  Schläfli for complex <math|\<nu\>> and <math|z>. Subsequently Schläfli's
  results have been extended by Döring <cite|döring> and Meijer
  <cite|meijer>. Quite recently, Döring <cite|döring_recent> has critically
  examined the bounds of Schläfli and Meijer in the case of real
  <math|\<nu\>> and complex <math|z>, and made simplifications to make them
  more readily computable.

  Except for Weber each author derives his results from integral
  representations of the Hankel functions. Weber uses a defining differential
  equation in a way which bears some resemblance to the theorem of Ÿ5 above,
  but it is more complicated.

  It is not claimed that the present bounds are superior to previous results
  in every respect. Indeed, for certain combinations of <math|\<nu\>> and
  <math|z>, particularly real <math|\<nu\>>, some of the earlier results are
  sharper. However, although it must be added that in regions where the
  expansions are meaningfully the sharpening seldom exceeds a factor of 2
  (compare the remarks made in the second paragraph of Ÿ4), one does claim,
  however, that for the general combination of complex values of
  <math|\<nu\>> and <math|z>, the present results are considerably simpler
  than the aggregate of earlier results, and furthermore they are completely
  realistic for all combinations of the variables. Of the earlier results,
  the most complete are those of Meijer. They are more complicated than
  <eqref|eq:hankel_main_result> to <eqref|eq:variation_bounds>, involving the
  solution of a transcendental equation in some regions. Moreover, they break
  down for complex values of <math|\<nu\>> arbitrarily close to, though not
  lying on, the lines <math|\<Re\>*\<nu\>=\<pm\><frac|1|2>,\<pm\>1,\<pm\><frac|3|2>,\<ldots\>>.

  <section|Summary><label|sec:summary>

  In the first part of this paper the authors discussed, in general terms,
  practical difficulties in the use of asymptotic expansions, particularly in
  the vicinity of the boundaries of their regions of validity in the complex
  plane. It was pointed out that the use of \Pcomplete asymptotic
  expansions\Q in the sense of Watson and Miller, though often expedient in
  practice, is difficult to place on a firm mathematical foundation. It was
  indicated, however, that the practical difficulties could be overcome by
  the development of satisfactory theories of error bounds. It was also
  suggested that such theories might provide an alternative or supplementary
  mathematical tool to generalizations of Poincaré's definition.

  In the second part of the paper new error bounds were derived for the
  well-known Hankel asymptotic expansions for cylinder functions of large
  complex argument and given real or complex order. These bounds were
  obtained by application of the asymptotic theory of ordinary differential
  equations. A characteristic feature of their evaluation was the
  minimization of the variation of the first neglected term of the series
  over a prescribed type of contour in the complex plane; the bounds appear
  to be the first ones for the Hankel expansions which are completely
  satisfactory for all combinations of the variables. They are well adapted
  to the control of accuracy in the construction of general-purpose automatic
  computing routines for the cylinder functions.

  <\thebibliography|9>
    <bibitem|reference1>N. G. de Bruijn, <with|font-shape|italic|Asymptotic
    methods in analysis>, (Amsterdam, North-Holland; Interscience, New York,
    1958).

    <bibitem|reference2>J. G. van der Corput,
    <with|font-shape|italic|Asymptotic developments 1. Fundamental theorems
    of asymptotics>, J. d'Analyse Math., <with|font-series|bold|4> (1956),
    341\U418.

    <bibitem|reference3>J. G. van der Corput and J. Franklin,
    <with|font-shape|italic|Approximation of integrals by integration by
    parts>, Kninki. Nederlandse Akad. Wetensch. Proc.,
    <with|font-series|bold|54> (1951), 215\U295.

    <bibitem|reference4>B. Döring, <with|font-shape|italic|Über
    Fehlerschranken zu den Hankelschen asymptotischen Entwicklungen der
    Besselfunktionen für komplexes Argument und beliebigen Index>, Z. angew.
    Math. Mech., <with|font-series|bold|42> (1962), 62\U76.

    <bibitem|reference5>A. Erdélyi, <with|font-shape|italic|Asymptotic
    expansions>, (Dover, New York, 1956).

    <bibitem|reference6><with|font-shape|italic|General asymptotic expansions
    of Laplace integrals>, Arch. Rational Mech. Anal.,
    <with|font-series|bold|7> (1961), 1\U20.

    <bibitem|reference7>A. Erdélyi and M. Wyman, <with|font-shape|italic|The
    asymptotic evaluation of certain integrals>, Arch. Rational Mech. Anal.,
    <with|font-series|bold|14> (1963), 217\U260.

    <bibitem|reference8>G. E. Forsythe, <with|font-shape|italic|Singularity
    and near singularity in numerical analysis>, Amer. Math. Mon.,
    <with|font-series|bold|65> (1958), 229\U240.

    <bibitem|reference9>C. S. Meijer, <with|font-shape|italic|Asymptotische
    Entwicklungen von Besselschen, Hankelschen und verwandten Funktionen>.
    I\UIV. Kninki. Nederlandse Akad. Wetensch. Proc.,
    <with|font-series|bold|35> (1932), 656\U667, 852\U866, 948\U959,
    1079\U1090.<bibitem|reference10>J. C. P. Miller,
    <with|font-shape|italic|Tables of Weber parabolic cylinder functions>,
    (London, H. M. S. O., 1955).

    <bibitem|reference11>National Bureau of Standards,
    <with|font-shape|italic|Handbook of mathematical functions>, Appl. Math.
    Ser. <with|font-series|bold|55> (Washington, G. P. O., 1964), Chapter 19.

    <bibitem|reference12>F. W. J. Olver, <with|font-shape|italic|Error bounds
    for the Liouville-Green (or WKB) approximation>, Proc. Cambridge Philos.
    Soc., <with|font-series|bold|57> (1961), 790\U810.

    <bibitem|reference13><with|font-shape|italic|Error bounds for asymptotic
    expansions in turning-point problems>, J. Soc. Indust. Appl. Math.,
    <with|font-series|bold|12> (1964), 200\U214.

    <bibitem|poincare1886>H. Poincaré, <with|font-shape|italic|Sur les
    intégrales irrégulières des équations linéaires>, Acta Math.
    <with|font-series|bold|8> (1886), 295\U344.

    <bibitem|schmidt>H. Schmidt, <with|font-shape|italic|Beiträge zu einer
    Theorie der allgemeinen asymptotischen Darstellungen>, Math. Ann.,
    <with|font-series|bold|113> (1937), 629\U656.

    <bibitem|reference16>G. N. Watson, <with|font-shape|italic|A theory of
    asymptotic series>, Phil. Trans. Roy. Soc. London A,
    <with|font-series|bold|211> (1911), 279\U313.

    <bibitem|reference17><with|font-shape|italic|The transformation of an
    asymptotic series into a convergent series of inverse factorials>, Rend.
    Circolo Mat. Palermo <with|font-series|bold|34> (1912), 1\U88.

    <bibitem|reference18><with|font-shape|italic|Theory of Bessel functions>,
    (Cambridge U. P. Second edition, 1944).

    <bibitem|reference19>A. van Wijngaarden, <with|font-shape|italic|A
    transformation of formal series>, I, Koninkl. Nederlandse Akad. Wetensch.
    Proc., A, <with|font-series|bold|56> (1953), 522\U543.

    <bibitem|wyman>M. Wyman, <with|font-shape|italic|The asymptotic behaviour
    of the Hermite polynomials>, Canad. J. Math., <with|font-series|bold|15>
    (1963), 332\U349.

    <vspace|1cm>

    <no-indent>The author acknowledges helpful criticisms of this paper by
    Mr. G. F. Miller and Dr. J. C. P. Miller.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-3|<tuple|3|5>>
    <associate|auto-4|<tuple|4|7>>
    <associate|auto-5|<tuple|5|7>>
    <associate|auto-6|<tuple|6|10>>
    <associate|auto-7|<tuple|7|12>>
    <associate|auto-8|<tuple|8|15>>
    <associate|auto-9|<tuple|8|16>>
    <associate|bib-poincare1886|<tuple|poincare1886|16>>
    <associate|bib-reference1|<tuple|reference1|16>>
    <associate|bib-reference10|<tuple|reference10|16>>
    <associate|bib-reference11|<tuple|reference11|16>>
    <associate|bib-reference12|<tuple|reference12|16>>
    <associate|bib-reference13|<tuple|reference13|16>>
    <associate|bib-reference16|<tuple|reference16|16>>
    <associate|bib-reference17|<tuple|reference17|16>>
    <associate|bib-reference18|<tuple|reference18|16>>
    <associate|bib-reference19|<tuple|reference19|16>>
    <associate|bib-reference2|<tuple|reference2|16>>
    <associate|bib-reference3|<tuple|reference3|16>>
    <associate|bib-reference4|<tuple|reference4|16>>
    <associate|bib-reference5|<tuple|reference5|16>>
    <associate|bib-reference6|<tuple|reference6|16>>
    <associate|bib-reference7|<tuple|reference7|16>>
    <associate|bib-reference8|<tuple|reference8|16>>
    <associate|bib-reference9|<tuple|reference9|16>>
    <associate|bib-schmidt|<tuple|schmidt|16>>
    <associate|bib-wyman|<tuple|wyman|16>>
    <associate|eq:additional_series|<tuple|6|3>>
    <associate|eq:alternative_expansion|<tuple|17|5>>
    <associate|eq:asymptotic_expansion|<tuple|1|1>>
    <associate|eq:bessel_error_bound|<tuple|32|9>>
    <associate|eq:bessel_f|<tuple|30|9>>
    <associate|eq:bessel_hankel_relation|<tuple|33|10>>
    <associate|eq:bessel_jy_relation|<tuple|51|13>>
    <associate|eq:bessel_solution|<tuple|31|9>>
    <associate|eq:chi_definition|<tuple|42|11>>
    <associate|eq:coefficient_formulas|<tuple|47|12>>
    <associate|eq:connection_formula|<tuple|50|13>>
    <associate|eq:contour_integral|<tuple|19|5>>
    <associate|eq:correct_value|<tuple|18|5>>
    <associate|eq:epsilon_m_bound|<tuple|27|8>>
    <associate|eq:error_bound_equation|<tuple|22|7>>
    <associate|eq:error_bounds_final|<tuple|48|12>>
    <associate|eq:error_bounds_jy_1|<tuple|56|14>>
    <associate|eq:error_bounds_jy_2|<tuple|57|14>>
    <associate|eq:error_bounds_jy_3|<tuple|58|14>>
    <associate|eq:explicit_polynomials|<tuple|11|4>>
    <associate|eq:f_asymptotic|<tuple|29|9>>
    <associate|eq:final_bound|<tuple|44|12>>
    <associate|eq:hankel_coefficients|<tuple|4|2>>
    <associate|eq:hankel_derivative_result|<tuple|46|12>>
    <associate|eq:hankel_differential|<tuple|24|8>>
    <associate|eq:hankel_expansion|<tuple|3|2>>
    <associate|eq:hankel_main_result|<tuple|45|12>>
    <associate|eq:hankel_recurrence|<tuple|23|8>>
    <associate|eq:hankel_solution|<tuple|25|8>>
    <associate|eq:hankel_solution_prime|<tuple|26|8>>
    <associate|eq:i_nu_expansion|<tuple|62|14>>
    <associate|eq:integral_example|<tuple|7|4>>
    <associate|eq:integral_split|<tuple|16|5>>
    <associate|eq:j_nu_expansion|<tuple|52|13>>
    <associate|eq:j_nu_expansion_alt|<tuple|53|13>>
    <associate|eq:k_nu_error_bounds|<tuple|61|14>>
    <associate|eq:k_nu_expansion|<tuple|60|14>>
    <associate|eq:lambda_coefficients|<tuple|9|4>>
    <associate|eq:main_hankel_result|<tuple|34|10>>
    <associate|eq:minimize_quantity|<tuple|35|10>>
    <associate|eq:modified_bessel_definition|<tuple|59|14>>
    <associate|eq:numerical_values|<tuple|13|4>>
    <associate|eq:parametric_line|<tuple|36|10>>
    <associate|eq:path_4_variation|<tuple|43|11>>
    <associate|eq:poincare_expansion|<tuple|8|4>>
    <associate|eq:quadrature_result|<tuple|15|4>>
    <associate|eq:recursive_polynomials|<tuple|10|4>>
    <associate|eq:remainder_definition|<tuple|2|1>>
    <associate|eq:scale_function|<tuple|20|6>>
    <associate|eq:series_result|<tuple|14|4>>
    <associate|eq:tau_definition|<tuple|21|6>>
    <associate|eq:variation_bounds|<tuple|49|12>>
    <associate|eq:variation_definition|<tuple|28|8>>
    <associate|eq:variation_elementary|<tuple|39|11>>
    <associate|eq:variation_limit_1|<tuple|37|10>>
    <associate|eq:variation_limit_2|<tuple|38|11>>
    <associate|eq:variation_y_zero|<tuple|40|11>>
    <associate|eq:weaker_bound|<tuple|41|11>>
    <associate|eq:y_nu_expansion|<tuple|54|13>>
    <associate|eq:y_nu_expansion_alt|<tuple|55|13>>
    <associate|sec:collected_results|<tuple|7|12>>
    <associate|sec:complete_expansions|<tuple|2|3>>
    <associate|sec:evaluation_variations|<tuple|6|10>>
    <associate|sec:hankel_functions|<tuple|5|7>>
    <associate|sec:introduction|<tuple|1|1>>
    <associate|sec:nature_error_bounds|<tuple|4|7>>
    <associate|sec:need_error_bounds|<tuple|3|5>>
    <associate|sec:summary|<tuple|8|15>>
    <associate|thm:hankel_functions|<tuple|1|8>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      poincare1886

      van_der_corput

      schmidt

      erdelyi

      erdelyi_wyman

      erdelyi_generalization

      poincare_sense

      later_reference

      natural_reference

      miller1

      miller2

      watson_reference

      watson_reference

      watson_uniqueness

      watson_paper

      watson_lemma

      reference17

      reference19

      reference3

      reference5

      reference1

      reference17

      wyman

      reference6

      reference17

      present_writer

      reference12

      reference12

      reference13

      erdelyi

      reference5

      reference2

      reference18

      reference18

      reference2

      watson_hankel

      döring

      meijer

      döring_recent
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Complete
      asymptotic expansions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      need for error bounds> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Nature
      of the error bounds> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Hankel
      functions of large argument> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Evaluation
      of the variations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Collected
      results for cylinder functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Summary>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>