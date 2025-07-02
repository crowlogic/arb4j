<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Ergodic Theorems For Stationary and Strictly
  Stationary Processes>|<doc-author|<author-data|<author-name|Cramer &
  Leadbetter>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Ergodic
    Theorems: Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Ergodic
    Theorems: Strictly Stationary Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Examples:
    Ergodic and Nonergodic Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>A
    Simple Example of a Nonergodic Process>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Ergodic Theorems: Stationary Processes<label|sec:ergodic_stationary_processes>><label|sec:ergodic_stationary>

  Let <math|\<xi\><around|(|t|)>> now be a complex-valued stationary process
  with zero mean, covariance function <math|r<around|(|t|)>>, and the
  spectral representation (see equation<nbsp><eqref|eq:7.5.1>). The ergodic
  theorems of Section<nbsp><reference|sec:5.5> (see
  equation<nbsp><eqref|eq:5.5>) yield directly the following results:

  <\enumerate>
    <item><label|item:7.10.1> If we have, as <math|T\<to\>\<infty\>>,

    <\equation>
      <frac|1|T>*<big|int><rsub|0><rsup|T>r<around|(|t|)>*<space|0.17em>d*t\<to\>0,<label|eq:7.10.1>
    </equation>

    then the time average

    <\equation>
      <frac|1|T>*<big|int><rsub|0><rsup|T>\<xi\><around|(|t|)>*<space|0.17em>d*t<label|eq:7.10.2>
    </equation>

    tends in quadratic mean to zero.

    <item>If, moreover, <math|r<around|(|t|)>=O<around|(|<around|\||t|\|><rsup|-\<beta\>>|)>>
    for some <math|\<beta\>\<gtr\>0>, as <math|<around|\||t|\|>\<to\>\<infty\>>,
    the average in equation<nbsp><eqref|eq:7.10.2> tends to zero with
    probability one (see also <cite|Verb1>).
  </enumerate>

  We observe that, by a formula for characteristic functions given in
  equation<nbsp><eqref|eq:2.7.5>, the relation in
  equation<nbsp><eqref|eq:7.10.1> will be satisfied if and only if the
  spectral distribution function <math|F<around|(|\<lambda\>|)>> is
  continuous at the origin.

  However, from the spectral representation of <math|\<xi\><around|(|t|)>>,
  further information concerning the quadratic mean behaviour of the time
  average<nbsp><eqref|eq:7.10.2> and certain related averages can be
  obtained. For any <math|\<xi\><around|(|t|)>> such that the
  representations<nbsp><eqref|eq:7.4.2> and<nbsp><eqref|eq:7.5.1> hold, the
  following relations, which are formally identical with the corresponding
  relation for characteristic functions given in
  equation<nbsp><eqref|eq:2.7.5>, just as was the case in respect of the
  inversion formulas<nbsp><eqref|eq:7.5.10> and<nbsp><eqref|eq:7.5.11>, hold:

  <\align>
    <tformat|<table|<row|<cell|<frac|1|T>*<big|int><rsub|0><rsup|T>\<xi\><around|(|t|)>*e<rsup|-\<mu\>*i*t>*<space|0.17em>d*t>|<cell|<long-arrow|\<rubber-rightarrow\>|<text|q.m.>>\<Delta\>*\<zeta\><around|(|\<mu\>|)>=\<zeta\>*<around|(|\<mu\>+0|)>-\<zeta\>*<around|(|\<mu\>-0|)>,<eq-number><label|eq:7.10.3a>>>|<row|<cell|<frac|1|T>*<big|int><rsub|0><rsup|T>r<around|(|t|)>*e<rsup|-\<mu\>*i*t>*<space|0.17em>d*t>|<cell|\<to\>\<Delta\>*F<around|(|\<mu\>|)>=\<bbb-E\>*<around|\||\<Delta\>*\<zeta\><around|(|\<mu\>|)>|\|><rsup|2>.<eq-number><label|eq:7.10.3b>>>>>
  </align>

  Here <math|\<mu\>> is any real number, and
  <math|\<Delta\>*\<zeta\><around|(|\<mu\>|)>> denotes the jump of the
  spectral process at the point <math|\<mu\>>, which is a random variable,
  while <math|\<Delta\>*F<around|(|\<mu\>|)>> is the corresponding jump of
  <math|F>, which is a nonnegative constant. Thus, if, in particular, the
  spectral distribution is continuous at <math|\<mu\>>, the time averages in
  the first members of equations<nbsp><eqref|eq:7.10.3a>
  and<nbsp><eqref|eq:7.10.3b> both have the quadratic mean limit zero.

  The second relation<nbsp><eqref|eq:7.10.3b> is equivalent to the
  corresponding formula of Section<nbsp><reference|sec:2.7>, while the first
  formula is readily proved by the same kind of argument as indicated in
  respect of equation<nbsp><eqref|eq:7.5.11>.

  <section|Ergodic Theorems: Strictly Stationary
  Processes><label|sec:ergodic_strictly_stationary>

  In the case of a strictly stationary process, it is possible to obtain much
  deeper results than those given in the preceding section. We shall here
  only deal with the real-valued case, and recall that, in particular, a real
  normal and stationary process is always strictly stationary (see
  Section<nbsp><reference|sec:7.1>).

  In Section<nbsp><reference|sec:5.5> some introductory remarks were given
  concerning a \Pflow\Q in the probability space, or a one-parameter group of
  one-one transformations of this space onto itself. We now follow up these
  remarks and apply them to the present case. Without going deeper into
  ergodic theory, we shall only prove some results required for the
  applications to be made later in this book.

  Let <math|\<xi\><around|(|t|)>> be a given real-valued and strictly
  stationary process. For the proof of the Birkhoff-Khintchine ergodic
  theorem (see p.<nbsp><pageref|thm:birkhoff-khintchine>), which is the main
  result of this section, we shall have to impose certain additional
  conditions on <math|\<xi\><around|(|t|)>>. However, until further notice we
  shall be concerned with a perfectly general, real-valued, and strictly
  stationary <math|\<xi\><around|(|t|)>>.

  We now choose as our probability space the space
  <math|<around|(|X,\<cal-B\>,\<Pi\>|)>> considered in
  Section<nbsp><reference|sec:3.3>, in connection with the proof of the
  Kolmogorov theorem. <math|X> is the space of all finite and real-valued
  functions <math|x<around|(|t|)>> of the real variable <math|t>.
  <math|\<cal-B\>> is the <math|\<sigma\>>-field of Borel sets in the space
  <math|X>, that is, the smallest <math|\<sigma\>>-field over the intervals
  of <math|X> (see Section<nbsp><reference|sec:3.3>). Finally, <math|\<Pi\>>
  is the probability measure uniquely determined on all sets of
  <math|\<cal-B\>> by the finite-dimensional distributions of the given
  strictly stationary process <math|\<xi\><around|(|t|)>>.

  An elementary event, or a point <math|\<omega\>> of the probability space,
  is now an individual sample function, say <math|\<omega\>=x<around|(|t|)>>.
  We define a <em|shift transformation> <math|U<rsub|\<tau\>>> in the
  probability space taking <math|\<omega\>=x<around|(|t|)>> into
  <math|\<omega\><rsub|\<tau\>>=x*<around|(|t+\<tau\>|)>>. Similarly,
  <math|U<rsub|\<tau\>>> takes any set <math|S> of functions
  <math|x<around|(|t|)>> into the set <math|S<rsub|\<tau\>>> formed by the
  shifted functions <math|x*<around|(|t+\<tau\>|)>>.

  It is evident that the transformations <math|U<rsub|\<tau\>>>, for all real
  <math|\<tau\>>, form a group: <math|U<rsub|\<tau\>+\<rho\>>=U<rsub|\<tau\>>*U<rsub|\<rho\>>>.
  It also follows from the strict stationarity of the finite-dimensional
  distributions defining <math|\<Pi\>> that the transformations
  <math|U<rsub|\<tau\>>> are <em|measure-preserving>, that is, for any Borel
  set <math|S> of sample functions we have
  <math|\<Pi\><around|(|S<rsub|\<tau\>>|)>=\<Pi\><around|(|S|)>> for all real
  <math|\<tau\>>. The shift transformations <math|U<rsub|\<tau\>>> thus
  determine a <em|measure-preserving flow> in the probability space
  <math|<around|(|X,\<cal-B\>,\<Pi\>|)>>.

  A Borel set <math|S> is called an <em|invariant set> of the
  <math|\<xi\><around|(|t|)>> process if, for every fixed <math|\<tau\>>, the
  sets <math|S> and <math|S<rsub|\<tau\>>> differ, at most, by sets of
  <math|\<Pi\>>-measure zero. That is, the so-called symmetric difference
  between <math|S> and <math|S<rsub|\<tau\>>> should be a set of
  <math|\<Pi\>>-measure zero, or in other words we should have

  <\equation>
    S<rsub|\<tau\>>=<around|(|S+N<rsub|1>|)>-N<rsub|2>,<label|eq:invariant_set>
  </equation>

  where <math|N<rsub|1>> and <math|N<rsub|2>> are <math|\<Pi\>>-null sets,
  which may depend on <math|\<tau\>>. The invariant sets form a
  <math|\<sigma\>>-field contained in <math|\<cal-B\>>. It is readily seen
  that all sets of probability <math|\<Pi\>=0> or <math|\<Pi\>=1> are
  invariant.

  <\definition>
    The strictly stationary process <math|\<xi\><around|(|t|)>> will be
    called <em|ergodic> or <em|metrically transitive> if the
    <math|\<sigma\>>-field of invariant sets only contains sets of
    probability <math|0> or <math|1>. Since all such sets are in any case
    invariant, the property of ergodicity implies that these are the only
    invariant sets of the process. Any set of probability between zero and
    one will be effectively \Pmixed\Q with other sets under the shift
    transformation.
  </definition>

  Any random variable <math|\<eta\>> defined by means of the random variables
  <math|\<xi\><around|(|t|)>> for any values of <math|t> will be called a
  random variable defined on the <math|\<xi\><around|(|t|)>>-process. Then
  <math|\<eta\>> will be a <math|\<cal-B\>>-measurable function of the
  elementary event <math|\<omega\>=x<around|(|t|)>>, and we define the shift
  transform of <math|\<eta\>> by writing <math|U<rsub|\<tau\>>*\<eta\>=\<eta\><around|(|\<omega\><rsub|\<tau\>>|)>>.
  We call <math|\<eta\>> an <em|invariant random variable> of the
  <math|\<xi\><around|(|t|)>>-process if, for every fixed <math|\<tau\>>, the
  random variables <math|\<eta\>> and <math|U<rsub|\<tau\>>*\<eta\>> are
  equivalent (see Section<nbsp><reference|sec:2.5>), that is, if
  <math|U<rsub|\<tau\>>*\<eta\>=\<eta\>> with probability one. If
  <math|\<eta\>> is an invariant random variable, and <math|A> is any Borel
  set of real numbers, it is readily seen that the set of all
  <math|\<omega\>> in the probability space such that
  <math|\<eta\><around|(|\<omega\>|)>\<in\>A> will be an invariant set. It
  follows that, in the particular case when the
  <math|\<xi\><around|(|t|)>>-process is ergodic, any invariant random
  variable must be constant with probability one.

  For any random variable <math|\<eta\>> defined on the
  <math|\<xi\><around|(|t|)>>-process, the family of its shift transforms

  <\equation>
    \<eta\><around|(|\<tau\>,\<omega\>|)>=U<rsub|\<tau\>>*\<eta\>=\<eta\><around|(|\<omega\><rsub|\<tau\>>|)><label|eq:shift_transform_eta>
  </equation>

  for all real <math|\<tau\>> is seen to determine a new strictly stationary
  process. To every fixed elementary event <math|\<omega\>> in the
  probability space <math|<around|(|X,\<cal-B\>,\<Pi\>|)>>, that is, to every
  individual sample function <math|\<omega\>=x<around|(|t|)>> of the
  <math|\<xi\><around|(|t|)>>-process, there corresponds a uniquely
  determined sample function

  <\equation>
    y<around|(|\<tau\>,\<omega\>|)>=\<eta\>*<around|[|x*<around|(|t+\<tau\>|)>|]><label|eq:sample_function_y>
  </equation>

  of the <math|\<eta\>> process. As usual we write briefly
  <math|\<eta\><around|(|\<tau\>|)>> instead of
  <math|\<eta\><around|(|\<tau\>,\<omega\>|)>>.

  We may regard <math|\<omega\><rprime|'>=y<around|(|\<tau\>|)>> as an
  elementary event of the <math|\<eta\><around|(|\<tau\>|)>>-process. The
  transformation which takes <math|\<omega\>=x<around|(|t|)>> into
  <math|\<omega\><rprime|'>=y<around|(|\<tau\>|)>> thus gives a
  transformation of the original probability space
  <math|<around|(|X,\<cal-B\>,\<Pi\>|)>> into a new probability space (see
  Section<nbsp><reference|sec:2.4>), say <math|<around|(|X<rprime|'>,\<cal-B\><rprime|'>,\<Pi\><rprime|'>|)>>.
  Here <math|X<rprime|'>> is the same function space as <math|X>, and
  <math|\<cal-B\><rprime|'>> is a <math|\<sigma\>>-field of sets in
  <math|X<rprime|'>> including all Borel sets, while the probability measure
  <math|\<Pi\><rprime|'>> corresponding to the
  <math|\<eta\><around|(|\<tau\>|)>> process is defined for any set
  <math|S<rprime|'>\<in\>\<cal-B\><rprime|'>> by the relation (see
  Section<nbsp><reference|sec:2.4>)

  <\equation>
    \<Pi\><rprime|'><around|(|S<rprime|'>|)>=\<Pi\><around|(|S|)>,<label|eq:probability_measure_transform>
  </equation>

  where <math|S> is the inverse image of <math|S<rprime|'>>. From the
  relation<nbsp><eqref|eq:sample_function_y> between
  <math|y<around|(|\<tau\>|)>> and <math|x<around|(|t|)>>, it is seen that
  <math|y*<around|(|\<tau\>+h|)>> corresponds to <math|x*<around|(|t+h|)>>,
  so that the shift transformation is the same in both spaces.

  Suppose now that <math|S<rprime|'>\<in\>\<cal-B\><rprime|'>> is an
  invariant set of the <math|\<eta\><around|(|\<tau\>|)>>-process, so that we
  have for every <math|\<tau\>>

  <\equation>
    S<rprime|'><rsub|\<tau\>>=<around|(|S<rprime|'>+N<rprime|'><rsub|1>|)>-N<rprime|'><rsub|2>,<label|eq:invariant_set_prime>
  </equation>

  where <math|N<rprime|'><rsub|1>> and <math|N<rprime|'><rsub|2>> are
  <math|\<Pi\><rprime|'>>-null sets. We then have the corresponding relation
  between the inverse images

  <\equation>
    S<rsub|\<tau\>>=<around|(|S+N<rsub|1>|)>-N<rsub|2>,<label|eq:invariant_set_inverse>
  </equation>

  and it follows from equation<nbsp><eqref|eq:probability_measure_transform>
  that <math|N<rsub|1>> and <math|N<rsub|2>> are <math|\<Pi\>>-null sets, so
  that <math|S> is invariant for the <math|\<xi\><around|(|t|)>>-process if
  and only if <math|S<rprime|'>> is an invariant set of the
  <math|\<xi\><around|(|t|)>>-process. If, in particular, the
  <math|\<xi\><around|(|t|)>>-process is ergodic, <math|\<Pi\><around|(|S|)>>
  must be either <math|0> or <math|1>, and it follows from
  equation<nbsp><eqref|eq:7.11.3> that the same holds true for
  <math|\<Pi\><rprime|'><around|(|S<rprime|'>|)>>, so that the
  <math|\<eta\><around|(|\<tau\>|)>>-process is also ergodic. We have thus
  proved the following proposition:

  <\proposition>
    <label|prop:ergodic_inheritance>Let <math|\<xi\><around|(|t|)>> be
    strictly stationary and ergodic, while <math|\<eta\>> is a random
    variable defined on the <math|\<xi\><around|(|t|)>>-process. The
    stochastic process generated by the shift transforms
    <math|\<eta\><around|(|\<tau\>|)>=\<eta\><around|(|\<tau\>,\<omega\>|)>>
    defined by equation<nbsp><eqref|eq:7.11.1> for all real <math|\<tau\>> is
    then strictly stationary and ergodic.
  </proposition>

  For a later purpose, we observe that, if
  <math|\<eta\><rsub|1><around|(|\<tau\>|)>,\<ldots\>,\<eta\><rsub|k><around|(|\<tau\>|)>>
  are processes defined in the same way as <math|\<eta\><around|(|\<tau\>|)>>
  above, the joint distribution of the <math|\<eta\><rsub|j><around|(|\<tau\>|)>>
  will obviously show the same invariance under a translation in
  <math|\<tau\>>. Some examples of ergodic and nonergodic processes will be
  given later in this section.

  From now on, we shall suppose that our strictly stationary process
  <math|\<xi\><around|(|t|)>> satisfies the following two additional
  conditions:

  <\enumerate>
    <item><label|cond:A> <math|\<cal-E\><around|\||\<xi\><around|(|0|)>|\|>\<less\>\<infty\>>.

    <item><label|cond:B> With probability one, the sample functions of the
    <math|\<xi\><around|(|t|)>>-process are Riemann integrable on every
    finite interval. (See the criteria given in 4.2, 4.4, and 5.4.)
  </enumerate>

  We observe that, while condition<nbsp><reference|cond:A> is an essential
  condition, condition<nbsp><reference|cond:B> could be replaced by a more
  general condition involving measurability.
  Condition<nbsp><reference|cond:B> as given above seems, however, to be
  sufficiently general for most applications.

  For processes satisfying these conditions, we now proceed to prove the main
  result of this section, the famous Birkhoff-Khintchine ergodic theorem:

  <\theorem>
    <dueto|Birkhoff-Khintchine Ergodic Theorem><label|thm:birkhoff-khintchine>If
    <math|\<xi\><around|(|t|)>> is strictly stationary and satisfies the
    conditions<nbsp><reference|cond:A> and<nbsp><reference|cond:B>, each of
    the time averages

    <\equation>
      <frac|1|T>*<big|int><rsub|-T><rsup|0>\<xi\><around|(|t|)>*<space|0.17em>d*t<space|1em><text|and><space|1em><frac|1|T>*<big|int><rsub|0><rsup|T>\<xi\><around|(|t|)>*<space|0.17em>d*t<label|eq:time_averages>
    </equation>

    converges with probability one to an invariant random variable of the
    <math|\<xi\><around|(|t|)>>-process, as <math|T\<to\>\<infty\>>. If, in
    particular, <math|\<xi\><around|(|t|)>> is ergodic, both limits are, with
    probability one, equal to the constant
    <math|\<cal-E\>*\<xi\><around|(|0|)>>.
  </theorem>

  According to this theorem we have for an ergodic process, with probability
  one,

  <\equation>
    lim<rsub|T\<to\>\<infty\>> <frac|1|T>*<big|int><rsub|-T><rsup|0>\<xi\><around|(|t|)>*<space|0.17em>d*t=\<cal-E\>*\<xi\><around|(|0|)>,<label|eq:ergodic_limit>
  </equation>

  and the corresponding relation for the time average over
  <math|<around|(|0,T|)>>. Here the second member is an average value of the
  random variable <math|\<xi\><around|(|0|)>>, extended over the set of all
  possible sample functions of the process. On the other hand, the first
  member is the limit of a time average, extended over the values assumed in
  the past by one individual sample function <math|\<xi\><around|(|t|)>>.
  Thus, the theorem asserts the equality, with probability one, of the
  <em|ensemble average> in the second member and the <em|time average> in the
  first member, the latter bearing on one single realization of the process.
  In this assertion lies the physical significance of the theorem.

  The first part of the proof of the ergodic theorem that will now be given
  is a modified form of a proof due to Kolmogorov<nbsp><cite|Kolmogorov> (see
  also Gnedenko<nbsp><cite|Gnedenko>). It will be sufficient to give the
  proof for the time average over the positive part of the <math|t> axis.
  Writing, for <math|n=\<ldots\>,-1,0,1,\<ldots\>>,

  <\equation>
    \<xi\><rsub|n>=<big|int><rsub|n><rsup|n+1>\<xi\><around|(|t|)>*<space|0.17em>d*t,<label|eq:xi_n_definition>
  </equation>

  it will be seen that the sequence of the <math|\<xi\><rsub|n>> forms a
  strictly stationary process with discrete time parameter <math|n>, such
  that

  <\equation>
    \<cal-E\><around|\||\<xi\><rsub|n>|\|>=c\<less\>\<infty\>.<label|eq:xi_n_bounded>
  </equation>

  Writing further, for any <math|m\<leq\>n>,

  <\equation>
    \<eta\><rsub|m,n>=<frac|\<xi\><rsub|m>+\<xi\><rsub|m+1>+\<cdots\>+\<xi\><rsub|n>|n-m+1><label|eq:eta_mn_definition>
  </equation>

  we shall first show that a finite limit

  <\equation>
    lim<rsub|n\<to\>\<infty\>> \<eta\><rsub|0,n><label|eq:eta_limit>
  </equation>

  exists with probability one. By Fatou's lemma we have

  <\equation>
    \<cal-E\>*liminf <around|\||\<eta\><rsub|0,n>|\|>\<leq\>liminf
    \<cal-E\><around|\||\<eta\><rsub|0,n>|\|>\<leq\>c,<label|eq:fatou_application>
  </equation>

  which shows that <math|liminf <around|\||\<eta\><rsub|0,n>|\|>> is finite
  with probability one. It follows that, with probability one, the sequence
  <math|\<eta\><rsub|0,n>> has at least one finite limit point.

  Let us now assume that, with a positive probability,
  <math|\<eta\><rsub|0,n>> has not a definite limit. Some reflection will
  then show that it is possible to find two finite numbers <math|\<alpha\>>
  and <math|\<beta\>> such that <math|\<alpha\>\<less\>\<beta\>>, and that
  with a positive probability both the inequalities

  <\align>
    <tformat|<table|<row|<cell|limsup \<eta\><rsub|0,n>>|<cell|\<gtr\>\<beta\>,<eq-number><label|eq:7.11.5a>>>|<row|<cell|liminf
    \<eta\><rsub|0,n>>|<cell|\<less\>\<alpha\>,<eq-number><label|eq:7.11.5b>>>>>
  </align>

  are satisfied. If <math|S> is the set of all elementary events
  <math|\<omega\>> [that is, sample functions of the
  <math|\<xi\><around|(|t|)>>-process] such that both
  inequalities<nbsp><eqref|eq:7.11.5a> and<nbsp><eqref|eq:7.11.5b> hold, we
  shall thus have <math|\<Pi\><around|(|S|)>\<gtr\>0>, and we now have to
  show that this assumption implies a contradiction.

  Consider any fixed sample sequence <math|x<rsub|n>> of the discrete
  <math|\<xi\><rsub|n>> process and write

  <\equation>
    y<rsub|m,n>=<frac|x<rsub|m>+x<rsub|m+1>+\<cdots\>+x<rsub|n>|n-m+1>.<label|eq:y_mn_definition>
  </equation>

  We shall say that <math|<around|(|m,n|)>> is a <em|characteristic interval>
  of length <math|n-m> for the given <math|x<rsub|n>> sequence if we have

  <\align>
    <tformat|<table|<row|<cell|y<rsub|m,i>>|<cell|\<leq\>\<beta\>*<space|1em><text|for
    >i=m,m+1,\<ldots\>,n-1,<eq-number><label|eq:characteristic_condition_1>>>|<row|<cell|y<rsub|m,n>>|<cell|\<gtr\>\<beta\><eq-number><label|eq:characteristic_condition_2>>>>>
  </align>

  Note that in the case <math|n=m> only the second condition is relevant, and
  <math|<around|(|m,n|)>> is then a characteristic interval of length zero.
  Suppose now that <math|<around|(|m<rsub|1>,n<rsub|1>|)>> and
  <math|<around|(|m<rsub|2>,n<rsub|2>|)>> are two distinct characteristic
  intervals. Obviously, we cannot have <math|m<rsub|1>=m<rsub|2>>, so that we
  may assume for example, <math|m<rsub|1>\<less\>m<rsub|2>>. It will be shown
  that the intervals cannot overlap, in the sense that we cannot have

  <\equation>
    m<rsub|1>\<less\>m<rsub|2>\<less\>n<rsub|1>\<less\>n<rsub|2>.<label|eq:7.11.6>
  </equation>

  In fact, the identity

  <\equation>
    y<rsub|m<rsub|1>,n<rsub|1>>=<frac|<around|(|m<rsub|2>-m<rsub|1>|)>*y<rsub|m<rsub|1>,m<rsub|2>-1>+<around|(|n<rsub|1>-m<rsub|2>+1|)>*y<rsub|m<rsub|2>,n<rsub|1>>|n<rsub|1>-m<rsub|1>+1><label|eq:overlap_identity>
  </equation>

  shows that, in order to make the first member <math|\<gtr\>\<beta\>>, at
  least one of the <math|y>'s appearing in the second member must be
  <math|\<gtr\>\<beta\>>. But it is easily seen that this is impossible if
  equation<nbsp><eqref|eq:7.11.6> holds. Thus, the two intervals cannot
  overlap.

  Suppose further that each of the two characteristic intervals just
  considered contains a third characteristic interval
  <math|<around|(|m,n|)>>, without being identical with it. For the same
  reason as before, we must then have <math|m<rsub|1>\<less\>m<rsub|2>\<less\>m>,
  and since the intervals cannot overlap we obtain

  <\equation>
    m<rsub|1>\<less\>m<rsub|2>\<less\>m\<leq\>n\<leq\>n<rsub|2>\<leq\>n<rsub|1>.<label|eq:nested_intervals>
  </equation>

  It follows in particular that <math|n<rsub|2>-m<rsub|2>\<less\>n<rsub|1>-m<rsub|1>>,
  so that any two distinct characteristic intervals containing a third must
  have unequal lengths, the shorter interval being contained in the longer.
  Thus, all characteristic intervals containing a given characteristic
  interval will form a strictly increasing sequence of intervals.

  Hence, if <math|I=<around|(|m,n|)>> is a given characteristic interval, and
  if <math|N\<geq\>n-m> is a given integer, there will always be a uniquely
  determined largest characteristic interval <math|I<rsub|N>> of length
  <math|\<leq\>N> containing <math|I>. (It is, of course, possible that we
  may have <math|I<rsub|N>=I>, if every characteristic interval strictly
  containing <math|I> has a length exceeding <math|N>.)

  Any elementary event <math|\<omega\>> belonging to the set <math|S> will
  correspond to a definite sample sequence of the
  <math|\<xi\><rsub|n>>-process. By the first
  inequality<nbsp><eqref|eq:7.11.5a>, this sample sequence will have a
  uniquely determined characteristic interval <math|<around|(|0,n|)>> of
  length <math|n\<geq\>0>. Let <math|S<rsub|N>> for every <math|N\<geq\>0>
  denote the subset of <math|S> formed by all <math|\<omega\>> such that
  <math|0\<leq\>n\<leq\>N>. Then <math|S<rsub|N>> is never decreasing as
  <math|N> increases, and <math|S<rsub|N>\<to\>S> as <math|N\<to\>\<infty\>>.
  Consequently, <math|\<Pi\><around|(|S<rsub|N>|)>\<to\>\<Pi\><around|(|S|)>>,
  so that by hypothesis we must have <math|\<Pi\><around|(|S<rsub|N>|)>\<gtr\>0>
  for all sufficiently large <math|N>. In the sequel, we only consider values
  of <math|N> such that <math|\<Pi\><around|(|S<rsub|N>|)>\<gtr\>0>.

  For any <math|\<omega\>\<in\>S<rsub|N>>, it now follows from the above that
  there will be a uniquely determined largest characteristic interval
  <math|I<rsub|N>> of length <math|\<leq\>N> containing the characteristic
  interval <math|<around|(|0,n|)>>, and possibly coinciding with it. Let
  <math|R<rsub|p*q>> be the subset of <math|S<rsub|N>> such that

  <\equation>
    I<rsub|N>=<around|(|-p,-p+q|)>.<label|eq:interval_definition>
  </equation>

  Then we must have <math|0\<leq\>p\<leq\>q>, <math|0\<leq\>q\<leq\>N>, and
  two different <math|R<rsub|p*q>> will always be disjoint, so that

  <\equation>
    \<Pi\><around|(|S<rsub|N>|)>=<big|sum><rsub|p=0><rsup|N><big|sum><rsub|q=0><rsup|N>\<Pi\><around|(|R<rsub|p*q>|)>.<label|eq:partition_sum>
  </equation>

  From the strict stationarity of the <math|\<xi\><rsub|n>>-sequence we
  obtain

  <\equation>
    \<Pi\><around|(|R<rsub|p*q>|)>=\<Pi\><around|(|R<rsub|0*q>|)>,<label|eq:stationarity_property>
  </equation>

  and, if <math|\<Pi\><around|(|R<rsub|0*q>|)>\<gtr\>0>,

  <\equation>
    \<cal-E\><around|(|\<xi\><rsub|0>\|R<rsub|p*q>|)>=\<cal-E\><around|(|\<xi\><rsub|p>\|R<rsub|0*q>|)>.<label|eq:conditional_expectation>
  </equation>

  Observing that, for every <math|\<omega\>\<in\>R<rsub|0*q>>, we must have
  <math|\<eta\><rsub|0*q>\<gtr\>\<beta\>>, we now obtain, excluding from
  summation every term with <math|\<Pi\><around|(|R<rsub|p*q>|)>=0>,

  <\align>
    <tformat|<table|<row|<cell|\<Pi\><around|(|S<rsub|N>|)>*<space|0.17em>\<cal-E\><around|(|\<xi\><rsub|0>\<mid\>S<rsub|N>|)>>|<cell|=<big|sum><rsub|q><big|sum><rsub|p>\<Pi\><around|(|R<rsub|p*q>|)>*<space|0.17em>\<cal-E\><around|(|\<xi\><rsub|0>\<mid\>R<rsub|p*q>|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|q>\<Pi\><around|(|R<rsub|0*q>|)>*<big|sum><rsub|p>\<cal-E\><around|(|\<xi\><rsub|p>\<mid\>R<rsub|0*q>|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|q>\<Pi\><around|(|R<rsub|0*q>|)>*<around|(|q+1|)>*\<cal-E\><around|(|\<eta\><rsub|0*q>\<mid\>R<rsub|0*q>|)><eq-number>>>|<row|<cell|>|<cell|\<gtr\><big|sum><rsub|q>\<Pi\><around|(|R<rsub|0*q>|)>*<around|(|q+1|)>*\<beta\><eq-number>>>|<row|<cell|>|<cell|=\<beta\>*<big|sum><rsub|q><big|sum><rsub|p>\<Pi\><around|(|R<rsub|p*q>|)><eq-number>>>|<row|<cell|>|<cell|=\<beta\>*\<Pi\><around|(|S<rsub|N>|)>.<eq-number><label|eq:SN_xi0_bound>>>>>
  </align>

  Thus, for all sufficiently large <math|N>,

  <\equation>
    \<cal-E\><around|(|\<xi\><rsub|0>\<mid\>S<rsub|N>|)>\<gtr\>\<beta\>,<label|eq:xi0_SN_beta>
  </equation>

  and consequently, as <math|N\<to\>\<infty\>>,

  <\equation>
    \<cal-E\><around|(|\<xi\><rsub|0>\<mid\>S|)>\<geq\>\<beta\>.<label|eq:xi0_S_beta>
  </equation>

  However, arguing in the same way from the second
  inequality<nbsp><eqref|eq:7.11.5b>, and changing the sign of all relevant
  inequalities, one obtains

  <\equation>
    \<cal-E\><around|(|\<xi\><rsub|0>\<mid\>S|)>\<leq\>\<alpha\>\<less\>\<beta\>.<label|eq:xi0_S_alpha>
  </equation>

  Thus, the assumption <math|\<Pi\><around|(|S|)>\<gtr\>0> implies a
  contradiction, and it follows that a finite limit<nbsp><eqref|eq:eta_limit>
  exists with probability one.

  <\lemma>
    <label|lem:eta_limit>The sequence

    <\equation>
      \<eta\><rsub|0,n-1>=<frac|1|n>*<big|int><rsub|0><rsup|n>\<xi\><around|(|t|)>*<space|0.17em>d*t<label|eq:eta0n_integral>
    </equation>

    tends with probability one to a certain random variable, say
    <math|\<eta\>>, as <math|n\<to\>\<infty\>> through integral values.
  </lemma>

  For <math|n\<leq\>T\<less\>n+1>,

  <\align>
    <tformat|<table|<row|<cell|<frac|1|T>*<big|int><rsub|0><rsup|T>\<xi\><around|(|t|)>*<space|0.17em>d*t>|<cell|=<frac|n|T>\<cdot\><frac|1|n>*<big|int><rsub|0><rsup|n>\<xi\><around|(|t|)>*<space|0.17em>d*t+<frac|1|T>*<big|int><rsub|n><rsup|T>\<xi\><around|(|t|)>*<space|0.17em>d*t.<eq-number><label|eq:T_average_decomposition>>>>>
  </align>

  The first term in the second member obviously tends to <math|\<eta\>> with
  probability one. The last term in the second member is bounded in absolute
  value by

  <\equation>
    <frac|1|n>*<big|int><rsub|n><rsup|n+1><around|\||\<xi\><around|(|t|)>|\|>*<space|0.17em>d*t.<label|eq:last_term_bound>
  </equation>

  But <math|<around|\||\<xi\><around|(|t|)>|\|>> is strictly stationary and
  satisfies the conditions<nbsp><reference|cond:A>
  and<nbsp><reference|cond:B>. Replacing in the preceding proof
  <math|\<xi\><around|(|t|)>> by <math|<around|\||\<xi\><around|(|t|)>|\|>>,
  it follows that the limit analogous to<nbsp><eqref|eq:eta_limit> exists,
  and consequently<nbsp><eqref|eq:last_term_bound> tends to zero with
  probability one. Thus, the limiting relation

  <\equation>
    lim<rsub|T\<to\>\<infty\>> <frac|1|T>*<big|int><rsub|0><rsup|T>\<xi\><around|(|t|)>*<space|0.17em>d*t=\<eta\><label|eq:limit_eta>
  </equation>

  holds with probability one.

  Obviously, for every real <math|\<tau\>> with probability one,

  <\equation>
    lim<rsub|T\<to\>\<infty\>> <frac|1|T>*<big|int><rsub|\<tau\>><rsup|\<tau\>+T>\<xi\><around|(|t|)>*<space|0.17em>d*t=lim<rsub|T\<to\>\<infty\>>
    <frac|1|T>*<big|int><rsub|0><rsup|T>\<xi\><around|(|t|)>*<space|0.17em>d*t,<label|eq:shifted_time_average>
  </equation>

  so that the limit <math|\<eta\>> is an invariant random variable of the
  <math|\<xi\><around|(|t|)>>-process. In particular, if
  <math|\<xi\><around|(|t|)>> is ergodic, <math|\<eta\>> must be constant
  with probability one, say <math|\<eta\>=c>.

  It remains to show that <math|c=\<cal-E\>*\<xi\><around|(|0|)>>. To prove
  this, one may assume <math|\<cal-E\>*\<xi\><around|(|0|)>=0>. Writing

  <\equation>
    \<eta\><rsub|T>=<frac|1|T>*<big|int><rsub|0><rsup|T>\<xi\><around|(|t|)>*<space|0.17em>d*t,<label|eq:eta_T>
  </equation>

  one has <math|\<cal-E\>*\<eta\><rsub|T>=0> for all <math|T>, and
  <math|\<eta\><rsub|T>\<to\>c> with probability one. For any given
  <math|\<delta\>\<gtr\>0>, by condition<nbsp><reference|cond:A> and the
  strict stationarity of <math|\<xi\><around|(|t|)>>, there exists
  <math|\<epsilon\>\<gtr\>0> such that

  <\equation>
    <big|int><rsub|S><around|\||\<xi\><around|(|t|)>|\|>*<space|0.17em>d*\<Pi\>\<less\>\<delta\><label|eq:xi_S_delta>
  </equation>

  for every <math|t>, as soon as <math|\<Pi\><around|(|S|)>\<less\>\<epsilon\>>
  (see Loève<nbsp><cite|Loeve>, p.<nbsp>124). It follows that then also

  <\equation>
    <big|int><rsub|S><around|\||\<eta\><rsub|T>|\|>*<space|0.17em>d*\<Pi\>\<less\>\<delta\>.<label|eq:etaT_S_delta>
  </equation>

  Obviously, one may here take <math|\<epsilon\>\<less\>\<delta\>>. Now
  assume, for example, <math|c\<gtr\>0>. As convergence with probability one
  implies convergence in probability (see Section<nbsp><reference|sec:3.5>),
  one has

  <\equation>
    \<Pi\>*<around|(|\<eta\><rsub|T>\<gtr\>c/2|)>\<geq\>1-\<epsilon\><label|eq:etaT_c2_prob>
  </equation>

  for all sufficiently large <math|T>. Denoting by <math|S> the set of all
  elementary events <math|\<omega\>> such that
  <math|\<eta\><rsub|T>\<gtr\>c/2>, then <math|\<Pi\><around|(|S|)>\<geq\>1-\<epsilon\>\<gtr\>1-\<delta\>>,
  and <math|\<Pi\><around|(|S<rsup|\<ast\>>|)>\<less\>\<epsilon\>>.
  Consequently,

  <\align>
    <tformat|<table|<row|<cell|0=\<cal-E\>*\<eta\><rsub|T>>|<cell|=<big|int><rsub|S>\<eta\><rsub|T>*<space|0.17em>d*\<Pi\>+<big|int><rsub|S<rsup|\<ast\>>>\<eta\><rsub|T>*<space|0.17em>d*\<Pi\><eq-number>>>|<row|<cell|>|<cell|\<gtr\>\<Pi\><around|(|S|)><frac|c|2>-\<delta\><eq-number>>>|<row|<cell|>|<cell|\<gtr\><around|(|1-\<delta\>|)>*<frac|c|2>-\<delta\>.<eq-number><label|eq:expectation_etaT_bound>>>>>
  </align>

  For sufficiently small <math|\<delta\>>, this implies a contradiction, so
  that <math|c=0>. This completes the proof of the Birkhoff-Khintchine
  ergodic theorem.

  <section|Examples: Ergodic and Nonergodic
  Processes><label|sec:examples_ergodic_nonergodic>

  Consider the class of normal stationary processes. Let
  <math|\<xi\><around|(|t|)>> be real-valued, normal, and stationary, with
  zero mean and such that, with probability one, its sample functions are
  continuous over any finite interval. (Sufficient conditions for sample
  function continuity in the present case will be given in
  Sections<nbsp><reference|sec:9.2> and<nbsp><reference|sec:9.3>.) The
  conditions<nbsp><reference|cond:A> and<nbsp><reference|cond:B> of the
  Birkhoff-Khintchine theorem are then certainly satisfied. For such a
  <math|\<xi\><around|(|t|)>>, and for the corresponding covariance function
  <math|r<around|(|t|)>>, the spectral representations<nbsp><eqref|eq:7.6.2>
  and<nbsp><eqref|eq:7.6.4> hold. A proposition due to
  Maruyama<nbsp><cite|Maruyama> and Grenander<nbsp><cite|Grenander> asserts
  that, under these conditions, <em|<math|\<xi\><around|(|t|)>> will be
  ergodic if and only if the spectral distribution function
  <math|G<around|(|\<lambda\>|)>> of<nbsp><eqref|eq:7.6.2> is everywhere
  continuous>.

  To prove the necessity of this condition, suppose that
  <math|\<xi\><around|(|t|)>> is ergodic and assume, as one may,
  <math|\<cal-E\>*\<xi\><rsup|2><around|(|t|)>=1>. The spectral d.f.
  <math|F<around|(|\<lambda\>|)>> associated with
  <math|G<around|(|\<lambda\>|)>> according to<nbsp><eqref|eq:7.6.1> must
  then be everywhere continuous.

  By the lemma proved above, the process <math|\<xi\><rsup|2><around|(|t|)>>
  is strictly stationary and ergodic, with mean <math|1>. The
  Birkhoff-Khintchine theorem then asserts that the random variable

  <\equation>
    X<around|(|T|)>=<frac|1|T>*<big|int><rsub|0><rsup|T>\<xi\><rsup|2><around|(|t|)>*<space|0.17em>d*t-1<label|eq:XT_def>
  </equation>

  tends to zero with probability one, as <math|T\<to\>\<infty\>>. By the
  properties of the multidimensional normal distribution,
  <math|X<around|(|T|)>> has a fourth order moment which remains bounded as
  <math|T\<to\>\<infty\>>. It follows that <math|X<around|(|T|)>> tends to
  zero also in quadratic mean, so that <math|\<cal-E\>*X<rsup|2><around|(|T|)>\<to\>0>
  as <math|T\<to\>\<infty\>>. One has

  <\align>
    <tformat|<table|<row|<cell|\<cal-E\>*X<rsup|2><around|(|T|)>>|<cell|=<frac|1|T<rsup|2>>*\<cal-E\><around*|[|<big|int><rsub|0><rsup|T><big|int><rsub|0><rsup|T>\<xi\><rsup|2><around|(|t|)>*\<xi\><rsup|2><around|(|u|)>*<space|0.17em>d*t*<space|0.17em>d*u|]>-1<eq-number>>>|<row|<cell|>|<cell|=<frac|2|T<rsup|2>>*<big|int><rsub|0><rsup|T><big|int><rsub|0><rsup|t>r<rsup|2><around|(|u|)>*<space|0.17em>d*u*<space|0.17em>d*t<eq-number>>>|<row|<cell|>|<cell|=<frac|4|T<rsup|2>>*<big|int><rsub|0><rsup|T>t*<space|0.17em>d*t*<big|int><rsub|0><rsup|t>r<rsup|2><around|(|u|)>*<space|0.17em>d*u.<eq-number><label|eq:EX2T>>>>>
  </align>

  However, by equation<nbsp><eqref|eq:2.7.5>, the average value of
  <math|r<rsup|2><around|(|u|)>> over <math|<around|(|0,t|)>> tends to the
  sum of the squares of the saltuses of <math|F<around|(|\<lambda\>|)>> in
  all its points of discontinuity, as <math|t\<to\>\<infty\>>. In order that
  <math|\<cal-E\>*X<rsup|2><around|(|T|)>> should tend to zero as
  <math|T\<to\>\<infty\>>, it is thus necessary that
  <math|F<around|(|\<lambda\>|)>> should be everywhere continuous.

  For sufficiency, follow the lines of Grenander's proof, under the more
  restrictive condition that <math|G<around|(|\<lambda\>|)>> is even
  <em|absolutely> continuous. It then follows from<nbsp><eqref|eq:7.6.2> by
  the Riemann-Lebesgue theorem that <math|r<around|(|t|)>\<to\>0> as
  <math|<around|\||t|\|>\<to\>\<infty\>>.

  Let <math|S> be an invariant set of the
  <math|\<xi\><around|(|t|)>>-process. The shift transformation
  <math|U<rsub|\<tau\>>> then takes <math|S> into a set
  <math|S<rsub|\<tau\>>>, which differs from <math|S> only by sets of
  <math|\<Pi\>>-measure zero, so that

  <\equation>
    \<Pi\>*<around|(|S*S<rsub|\<tau\>>|)>=\<Pi\><around|(|S|)>.<label|eq:invariant_set_measure>
  </equation>

  For any given <math|\<epsilon\>\<gtr\>0>, approximate <math|S> by a finite
  interval sum <math|I> in the function space <math|X> (see
  Section<nbsp><reference|sec:3.3>) so that
  <math|I=<around|(|S+S<rprime|'>|)>-S<rprime|''>>, where <math|S<rprime|'>>
  and <math|S<rprime|''>> have <math|\<Pi\>>-measure
  <math|\<less\>\<epsilon\>>. Hence,

  <\align>
    <tformat|<table|<row|<cell|<around|\||\<Pi\><around|(|I|)>-\<Pi\><around|(|S|)>|\|>>|<cell|\<less\>\<epsilon\>,<eq-number><label|eq:PI_PS_eps>>>|<row|<cell|<around|\||\<Pi\>*<around|(|I*I<rsub|\<tau\>>|)>-\<Pi\>*<around|(|S*S<rsub|\<tau\>>|)>|\|>>|<cell|\<less\>2*\<epsilon\>,<eq-number><label|eq:PII_PSS_eps>>>>>
  </align>

  where <math|I<rsub|\<tau\>>=U<rsub|\<tau\>>*I>.

  Now, <math|I> is the set of all sample functions of the
  <math|\<xi\><around|(|t|)>>-process which satisfy certain inequalities of
  the form<nbsp>(3.3.1), giving bounds for the values of
  <math|\<xi\><around|(|t|)>> in a finite number of points, say
  <math|t<rsub|1>,\<ldots\>,t<rsub|n>>. Then <math|I<rsub|\<tau\>>> will be
  the set of all <math|\<xi\><around|(|t|)>> satisfying the corresponding
  inequalities with the arguments <math|t<rsub|1>-\<tau\>,\<ldots\>,t<rsub|n>-\<tau\>>.
  The random variables <math|\<xi\><around|(|t<rsub|i>|)>> and
  <math|\<xi\>*<around|(|t<rsub|j>-\<tau\>|)>> are all normal, and the
  covariance functions

  <\equation>
    \<cal-E\>*<around|[|\<xi\><around|(|t<rsub|i>|)>*\<xi\>*<around|(|t<rsub|j>-\<tau\>|)>|]>=r*<around|(|t<rsub|i>-t<rsub|j>+\<tau\>|)><label|eq:covariance_shift>
  </equation>

  all tend to zero as <math|<around|\||\<tau\>|\|>\<to\>\<infty\>>. Thus, the
  two groups of normal variables <math|\<xi\><around|(|t<rsub|i>|)>> and
  <math|\<xi\>*<around|(|t<rsub|j>-\<tau\>|)>> tend to be independent, so
  that

  <\equation>
    \<Pi\>*<around|(|I*I<rsub|\<tau\>>|)>-\<Pi\><around|(|I|)>*\<Pi\><around|(|I<rsub|\<tau\>>|)>\<to\>0.<label|eq:product_measure_limit>
  </equation>

  Owing to strict stationarity, <math|\<Pi\><around|(|I<rsub|\<tau\>>|)>=\<Pi\><around|(|I|)>>,
  and thus

  <\equation>
    \<Pi\>*<around|(|I*I<rsub|\<tau\>>|)>\<to\>\<Pi\><rsup|2><around|(|I|)>.<label|eq:PII_PI2>
  </equation>

  Since <math|\<epsilon\>> is arbitrary, it finally follows
  from<nbsp><eqref|eq:invariant_set_measure> and<nbsp><eqref|eq:PII_PSS_eps>
  that

  <\equation>
    \<Pi\><rsup|\<ast\>><around|(|S|)>=\<Pi\><around|(|S|)>,<label|eq:PIstar_PS>
  </equation>

  which shows that <math|\<Pi\><around|(|S|)>=1> or
  <math|\<Pi\><around|(|S|)>=0>. Therefore, every invariant set of the
  <math|\<xi\><around|(|t|)>> process has probability <math|0> or <math|1>,
  and so the process is ergodic.

  Thus, every normal <math|\<xi\><around|(|t|)>> with continuous sample
  functions, obtained from the spectral representation<nbsp><eqref|eq:7.6.4>
  with a continuous spectral d.f. <math|G<around|(|\<lambda\>|)>> gives an
  instance of an ergodic process. Any process <math|\<eta\><around|(|t|)>>
  generated by the shift transformation from some random variable defined on
  the <math|\<xi\><around|(|t|)>> process is then, by the first proposition
  proved above, also strictly stationary and ergodic. As examples we may
  mention the processes

  <\align>
    <tformat|<table|<row|<cell|\<eta\><rsub|1><around|(|t|)>>|<cell|=p<around*|[|\<xi\>*<around|(|t<rsub|1>+t|)>,\<ldots\>,\<xi\>*<around|(|t<rsub|n>+t|)>|]>,<eq-number><label|eq:eta1_def>>>|<row|<cell|\<eta\><rsub|2><around|(|t|)>>|<cell|=<big|int><rsub|t><rsup|t+1>\<xi\><around|(|u|)>*<space|0.17em>d*u,<eq-number><label|eq:eta2_def>>>>>
  </align>

  where <math|p> is a polynomial in the arguments indicated. A further
  example, which will be discussed in detail in Chapters 10 and 11, is the
  case when <math|\<eta\><around|(|t|)>> is related to the number of
  crossings between the <math|\<xi\><around|(|t|)>> curve and some given
  level <math|u> in a convenient time interval, say
  <math|<around|(|t,t+1|)>>.

  <section|A Simple Example of a Nonergodic
  Process><label|sec:nonergodic_example>

  In order to give a simple example of a nonergodic process, consider a
  normal process <math|\<xi\><around|(|t|)>> given by the spectral
  representation<nbsp><eqref|eq:7.6.4> in the particular case when
  <math|G<around|(|\<lambda\>|)>> is constant except for a single jump of
  magnitude <math|1> at <math|\<lambda\>=\<lambda\><rsub|0>>.
  Then<nbsp><eqref|eq:7.6.4> gives

  <\equation>
    \<xi\><around|(|t|)>=u*cos \<lambda\><rsub|0>*t+v*sin
    \<lambda\><rsub|0>*t,<label|eq:xi_nonergodic>
  </equation>

  where the random variables <math|u> and <math|v> are independent and normal
  <math|<around|(|0,1|)>>. Replacing <math|u> and <math|v> by new variables
  <math|\<rho\>> and <math|\<theta\>> by means of the relations
  <math|u=\<rho\>*cos \<theta\>>, <math|v=\<rho\>*sin \<theta\>>, we have

  <\equation>
    \<xi\><around|(|t|)>=\<rho\>*cos <around|(|\<lambda\><rsub|0>*t-\<theta\>|)>,<label|eq:xi_rho_theta>
  </equation>

  while the joint probability density is transformed as follows:

  <\equation>
    <frac|1|2*\<pi\>>*e<rsup|-<around|(|u<rsup|2>+v<rsup|2>|)>/2>*d*u*<space|0.17em>d*v=\<rho\>*e<rsup|-\<rho\><rsup|2>/2>*d*\<rho\>\<cdot\><frac|d*\<theta\>|2*\<pi\>>,<label|eq:joint_density>
  </equation>

  so that <math|\<rho\>> and <math|\<theta\>> are independent,
  <math|\<rho\>\<gtr\>0> having the density
  <math|\<rho\>*e<rsup|-\<rho\><rsup|2>/2>>, while <math|\<theta\>> is
  uniformly distributed over <math|<around|(|0,2*\<pi\>|)>>. Thus, we are led
  back to the case considered at the end of Section<nbsp><reference|sec:3.6>
  of a simple harmonic oscillation with constant angular frequency
  <math|\<lambda\><rsub|0>>, random amplitude <math|\<rho\>>, and random
  phase angle <math|\<theta\>>.

  That this is a nonergodic process is seen, for example, from the fact that
  the set of all sample functions with <math|a\<less\>\<rho\>\<less\>b> is
  invariant under the shift transformation. The \Pmixing\Q properties of this
  process are not strong enough to ensure ergodicity. Nevertheless, if
  <math|\<lambda\><rsub|0>\<neq\>0>, the time averages considered in the
  Birkhoff-Khintchine theorem are easily seen to converge with probability
  one to the limit

  <\equation>
    \<cal-E\>*\<xi\><around|(|0|)>=0.<label|eq:xi0_limit>
  </equation>

  On the other hand, when <math|\<lambda\><rsub|0>=0>, we have
  <math|\<xi\><around|(|t|)>=\<rho\>*cos \<theta\>=u>, so that
  <math|\<xi\><around|(|t|)>> is independent of <math|t>, and is identical
  with its own time average, which is normal <math|<around|(|0,1|)>> and thus
  not equivalent to zero.

  <\thebibliography|9>
    <bibitem|Kolmogorov>Kolmogorov, A.N., <em|Foundations of the Theory of
    Probability>.

    <bibitem|Gnedenko>Gnedenko, B.V., <em|The Theory of Probability>.

    <bibitem|Loeve>Loève, M., <em|Probability Theory>.

    <bibitem|Maruyama>Maruyama, G., \PContinuous Parameter Stationary
    Processes,\Q Memoirs of the Faculty of Science, Kyushu University, Series
    A, 1949.

    <bibitem|Grenander>Grenander, U., <em|Stochastic Processes and
    Statistical Inference>.
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-2|<tuple|2|2|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-3|<tuple|3|10|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-4|<tuple|4|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|auto-5|<tuple|67|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Gnedenko|<tuple|Gnedenko|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Grenander|<tuple|Grenander|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Kolmogorov|<tuple|Kolmogorov|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Loeve|<tuple|Loeve|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|bib-Maruyama|<tuple|Maruyama|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|cond:A|<tuple|1|4|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|cond:B|<tuple|2|5|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:7.10.1|<tuple|1|1|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:7.10.2|<tuple|2|1|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:7.10.3a|<tuple|3|2|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:7.10.3b|<tuple|4|2|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:7.11.5a|<tuple|18|6|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:7.11.5b|<tuple|19|6|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:7.11.6|<tuple|23|6|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:EX2T|<tuple|54|10|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:PII_PI2|<tuple|60|11|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:PII_PSS_eps|<tuple|57|11|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:PI_PS_eps|<tuple|56|11|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:PIstar_PS|<tuple|61|11|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:SN_xi0_bound|<tuple|35|8|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:T_average_decomposition|<tuple|40|8|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:XT_def|<tuple|51|10|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:characteristic_condition_1|<tuple|21|6|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:characteristic_condition_2|<tuple|22|6|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:conditional_expectation|<tuple|29|7|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:covariance_shift|<tuple|58|11|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:ergodic_limit|<tuple|12|5|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:eta0n_integral|<tuple|39|8|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:eta1_def|<tuple|62|11|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:eta2_def|<tuple|63|11|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:etaT_S_delta|<tuple|46|9|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:etaT_c2_prob|<tuple|47|9|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:eta_T|<tuple|44|9|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:eta_limit|<tuple|16|6|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:eta_mn_definition|<tuple|15|6|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:expectation_etaT_bound|<tuple|50|9|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:fatou_application|<tuple|17|6|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:interval_definition|<tuple|26|7|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:invariant_set|<tuple|5|3|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:invariant_set_inverse|<tuple|10|4|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:invariant_set_measure|<tuple|55|11|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:invariant_set_prime|<tuple|9|4|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:joint_density|<tuple|66|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:last_term_bound|<tuple|41|8|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:limit_eta|<tuple|42|9|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:nested_intervals|<tuple|25|7|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:overlap_identity|<tuple|24|6|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:partition_sum|<tuple|27|7|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:probability_measure_transform|<tuple|8|4|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:product_measure_limit|<tuple|59|11|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:sample_function_y|<tuple|7|4|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:shift_transform_eta|<tuple|6|3|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:shifted_time_average|<tuple|43|9|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:stationarity_property|<tuple|28|7|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:time_averages|<tuple|11|5|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:xi0_SN_beta|<tuple|36|8|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:xi0_S_alpha|<tuple|38|8|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:xi0_S_beta|<tuple|37|8|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:xi0_limit|<tuple|67|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:xi_S_delta|<tuple|45|9|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:xi_n_bounded|<tuple|14|5|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:xi_n_definition|<tuple|13|5|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:xi_nonergodic|<tuple|64|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:xi_rho_theta|<tuple|65|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|eq:y_mn_definition|<tuple|20|6|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|item:7.10.1|<tuple|1|1|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|lem:eta_limit|<tuple|4|8|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|prop:ergodic_inheritance|<tuple|2|4|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:ergodic_stationary|<tuple|1|1|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:ergodic_stationary_processes|<tuple|1|1|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:ergodic_strictly_stationary|<tuple|2|2|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:examples_ergodic_nonergodic|<tuple|3|10|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|sec:nonergodic_example|<tuple|4|12|.TeXmacs/texts/scratch/no_name_6.tm>>
    <associate|thm:birkhoff-khintchine|<tuple|3|5|.TeXmacs/texts/scratch/no_name_6.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Verb1

      Kolmogorov

      Gnedenko

      Loeve

      Maruyama

      Grenander
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Ergodic
      Theorems: Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Ergodic
      Theorems: Strictly Stationary Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Examples:
      Ergodic and Nonergodic Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>A
      Simple Example of a Nonergodic Process>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>