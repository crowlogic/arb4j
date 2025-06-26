<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Stationary Processes: Spectral
  Representation>|<doc-author|<author-data|<author-name|Cramer &
  Leadbetter>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Stationary
    Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>The
    Spectral Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Real-Valued Case> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Stationary Processes>

  In particular, this gives for <math|t=0>

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<lambda\>,A|)>*d*\<lambda\>=r<around|(|0|)><label|eq:integral_zero>
  </equation>

  Thus, if we think of the nonnegative function
  <math|g<around|(|\<lambda\>,A|)>/r<around|(|0|)>> as a probability density,
  the corresponding characteristic function will be
  <math|u*<around|(|t*A|)>*r<around|(|t|)>/r<around|(|0|)>>. Now as
  <math|A\<to\>\<infty\>>, this tends for every <math|t> to
  <math|r<around|(|t|)>/r<around|(|0|)>>, which is a continuous function of
  <math|t>. It then follows from the continuity theorem for c.f.'s (see
  Section<nbsp>2.7) that <math|r<around|(|t|)>/r<around|(|0|)>> is a c.f., so
  that <math|r<around|(|t|)>> is a c.f. multiplied with the constant
  <math|r<around|(|0|)>>. This immediately gives
  relation<nbsp><eqref|eq:spectral_representation>, and so Bochner's theorem
  is proved.

  Thus, every covariance function of a stationary process
  <math|\<xi\><around|(|t|)>> can be represented in the
  form<nbsp><eqref|eq:spectral_representation>, which may be regarded as a
  spectral representation of <math|r<around|(|t|)>> (see Section<nbsp>6.4).
  The never-decreasing function <math|F<around|(|\<lambda\>|)>> is called the
  spectral distribution function of the <math|\<xi\><around|(|t|)>> process.
  Clearly, <math|F<around|(|\<lambda\>|)>> is only defined up to an additive
  constant, and we can always assume

  <\equation>
    F*<around|(|-\<infty\>|)>=0,<space|1em>F*<around|(|+\<infty\>|)>=r<around|(|0|)>.<label|eq:boundary_conditions>
  </equation>

  For the spectral representation<nbsp><eqref|eq:spectral_representation>, it
  evidently does not matter how we determine the value of
  <math|F<around|(|\<lambda\>|)>> in a discontinuity point, as long as the
  relation <math|F*<around|(|\<lambda\>-0|)>\<leq\>F<around|(|\<lambda\>|)>\<leq\>F*<around|(|\<lambda\>+0|)>>
  is satisfied for all <math|\<lambda\>>. We shall usually take
  <math|F<around|(|\<lambda\>|)>=F*<around|(|\<lambda\>+0|)>>, so that
  <math|F<around|(|\<lambda\>|)>> is everywhere continuous to the right.

  If <math|F<around|(|\<lambda\>|)>> is absolutely continuous, the derivative
  <math|f<around|(|\<lambda\>|)>=F<rprime|'><around|(|\<lambda\>|)>> will be
  called the spectral density of the process.

  In the following section we shall obtain an analogous spectral
  representation for the stationary process <math|\<xi\><around|(|t|)>>
  itself. The spectral representations for <math|r<around|(|t|)>> and
  <math|\<xi\><around|(|t|)>> will then be compared and used for various
  applications.

  <section|The Spectral Representation>

  As before, we consider a stationary process <math|\<xi\><around|(|t|)>>
  with zero mean, and continuous in q.m. Let <math|F<around|(|\<lambda\>|)>>
  be the spectral distribution function defined in the preceding section,
  continuous to the right, and satisfying<nbsp><eqref|eq:boundary_conditions>.
  The following theorem is fundamental for the theory of stationary
  processes.

  <\theorem>
    [Spectral Representation Theorem]<label|thm:spectral_representation>To
    every stationary <math|\<xi\><around|(|t|)>> there can be assigned a
    process <math|\<zeta\><around|(|\<lambda\>|)>> with orthogonal
    increments, such that we have for each fixed <math|t> the spectral
    representation

    <\equation>
      \<xi\><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><label|eq:spectral_representation>
    </equation>

    the stochastic integral being defined as a q.m. integral.
    <math|\<zeta\><around|(|\<lambda\>|)>> is defined up to an additive
    random variable. If this is fixed by taking
    <math|\<zeta\>*<around|(|-\<infty\>|)>=0>, we have

    <\equation>
      E*\<zeta\><around|(|\<lambda\>|)>=0
    </equation>

    <\equation>
      <space|1em>E<around|\||\<zeta\><around|(|\<lambda\>|)>|\|><rsup|2>=F<around|(|\<lambda\>|)>
    </equation>

    <\equation>
      E*<around|\||d*\<zeta\><around|(|\<lambda\>|)>|\|><rsup|2>=d*F<around|(|\<lambda\>|)><label|eq:zeta_properties>
    </equation>
  </theorem>

  As already pointed out in Section<nbsp>6.4, the spectral
  representation<nbsp><eqref|eq:spectral_representation> shows how the
  <math|\<xi\><around|(|t|)>> process is additively built up by elementary
  and mutually orthogonal harmonic oscillations

  <\equation>
    e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><label|eq:harmonic_oscillations>
  </equation>

  each of which has an angular frequency <math|\<lambda\>>, while the random
  amplitude and the random phase are determined by the elementary increment
  <math|d*\<zeta\><around|(|\<lambda\>|)>>. The
  <math|\<zeta\><around|(|\<lambda\>|)>> process will be called the spectral
  process associated with <math|\<xi\><around|(|t|)>>.

  It has also been pointed out in Section<nbsp>6.4 that an equality between
  random variables such as<nbsp><eqref|eq:spectral_representation> should
  always be understood in the sense that the two members are equivalent
  random variables.

  <\proof>
    The spectral representation theorem may be proved by various methods. We
    shall first give a complete proof using Hilbert space theory, and then
    briefly indicate another proof by means of trigonometric integrals. From
    an abstract point of view, the theorem is equivalent to a theorem on
    groups of unitary transformations in Hilbert space due to
    Stone<nbsp><cite|Stone1>, while the above probabilistic version was given
    by Cramér<nbsp><cite|Cramer3|Cramer4>, and independently by
    Loève<nbsp><cite|Loeve1>. The proof given here will be framed in terms of
    random variables, and will only rest on the elements of Hilbert space
    theory as developed in Sections<nbsp>5.6 and<nbsp>5.7.

    We shall consider two different realizations of Hilbert space, and
    establish a correspondence between them in such a way that corresponding
    pairs of elements have the same inner products.

    Let <math|H<around|(|\<xi\>|)>> be the Hilbert space of the
    <math|\<xi\><around|(|t|)>> process as defined in Section<nbsp>5.7. This
    is the space spanned by the random variables <math|\<xi\><around|(|t|)>>
    for all real <math|t>. The elements of <math|H<around|(|\<xi\>|)>> are
    random variables, namely, all finite linear combinations

    <\equation>
      \<alpha\><rsub|1>*\<xi\><around|(|t<rsub|1>|)>+\<cdots\>+\<alpha\><rsub|n>*\<xi\><around|(|t<rsub|n>|)><label|eq:linear_combinations>
    </equation>

    and all limits in q.m. of sequences of such combinations. The inner
    product of any two elements <math|\<eta\><rsub|1>> and
    <math|\<eta\><rsub|2>> of <math|H<around|(|\<xi\>|)>> is

    <\equation>
      <around|(|\<eta\><rsub|1>,\<eta\><rsub|2>|)>=E*\<eta\><rsub|1><wide|\<eta\><rsub|2>|\<bar\>><label|eq:inner_product_xi>
    </equation>

    Two elements are regarded as identical if their distance, as defined by
    this inner product (see Section<nbsp>5.6), is zero.

    On the other hand, we denote as usual by <math|L<rsub|2><around|(|F|)>>
    the set of all non-random complex-valued functions
    <math|g<around|(|\<lambda\>|)>> such that the Lebesgue-Stieltjes integral

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||g<around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)><label|eq:L2_integral>
    </equation>

    exists and is finite. The set <math|L<rsub|2><around|(|F|)>> forms a
    Hilbert space, say <math|H<around|(|F|)>>, if addition and scalar
    multiplication are defined in the ordinary way, while the inner product
    of <math|g<rsub|1>> and <math|g<rsub|2>> is

    <\equation>
      <around|(|g<rsub|1>,g<rsub|2>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<rsub|1><around|(|\<lambda\>|)><wide|g<rsub|2><around|(|\<lambda\>|)>|\<bar\>>d*F<around|(|\<lambda\>|)><label|eq:inner_product_F>
    </equation>

    Two elements <math|g<rsub|1>> and <math|g<rsub|2>> are regarded as
    identical if their distance, as defined by this inner product, is zero,
    that is, if we have

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||g<rsub|1><around|(|\<lambda\>|)>-g<rsub|2><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)>=0<label|eq:distance_zero>
    </equation>

    We now establish a correspondence between <math|H<around|(|\<xi\>|)>> and
    <math|H<around|(|F|)>> by successive steps in the following way: For
    every real <math|t>, let <math|\<xi\><around|(|t|)>\<in\>H<around|(|\<xi\>|)>>
    and <math|e<rsup|i*t*\<lambda\>>\<in\>H<around|(|F|)>> be corresponding
    elements. By Bochner's theorem we have

    <\equation>
      E*\<xi\><around|(|t|)><wide|\<xi\><around|(|u|)>|\<bar\>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*e<rsup|-i*u*\<lambda\>>*d*F<around|(|\<lambda\>|)><label|eq:bochner_correspondence>
    </equation>

    so that inner products are preserved.

    The correspondence is now extended to finite linear combinations of the
    <math|\<xi\><around|(|t|)>> and the <math|e<rsup|i*t*\<lambda\>>>, by
    letting

    <\equation>
      \<eta\>=<big|sum><rsub|k=1><rsup|n>\<alpha\><rsub|k>*\<xi\><around|(|t<rsub|k>|)><label|eq:eta_combination>
    </equation>

    <\equation>
      g<around|(|\<lambda\>|)>=<big|sum><rsub|k=1><rsup|n>\<alpha\><rsub|k>**e<rsup|i*t<rsub|k>*\<lambda\>><label|eq:g_combination>
    </equation>

    be corresponding elements. Clearly, Bochner's theorem shows that inner
    products are still preserved, so that we have for any corresponding pairs
    <math|\<eta\><rsub|1>,\<eta\><rsub|2>> and <math|g<rsub|1>,g<rsub|2>>,

    <\equation>
      <around|(|\<eta\><rsub|1>,\<eta\><rsub|2>|)>=<around|(|g<rsub|1>,g<rsub|2>|)><label|eq:preserved_inner_products>
    </equation>

    and also for the corresponding squares of distances

    <\equation>
      E*<around|\||\<eta\><rsub|1>-\<eta\><rsub|2>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||g<rsub|1><around|(|\<lambda\>|)>-g<rsub|2><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)><label|eq:preserved_distances>
    </equation>

    The last relation shows that the correspondence is one-one, since
    <math|\<eta\><rsub|1>> and <math|\<eta\><rsub|2>> cannot be identical
    without <math|g<rsub|1>> and <math|g<rsub|2>> also being identical, and
    conversely.

    If <math|\<eta\><rsub|1>,\<eta\><rsub|2>,\<ldots\>> is a sequence of
    random variables of the form<nbsp><eqref|eq:eta_combination> converging
    in q.m. to a random variable <math|\<eta\>>, we have for the
    corresponding <math|g<rsub|1>,g<rsub|2>,\<ldots\>>,

    <\equation>
      E*<around|\||\<eta\><rsub|m>-\<eta\><rsub|n>|\|><rsup|2>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||g<rsub|m><around|(|\<lambda\>|)>-g<rsub|n><around|(|\<lambda\>|)>|\|><rsup|2>*d*F<around|(|\<lambda\>|)><label|eq:convergence_correspondence>
    </equation>

    It follows that the nonrandom functions
    <math|g<rsub|m><around|(|\<lambda\>|)>> converge in q.m. relative to the
    spectral d.f. <math|F<around|(|\<lambda\>|)>>. If
    <math|g<around|(|\<lambda\>|)>> is their limit, we finally extend the
    correspondence by letting <math|\<eta\>> and
    <math|g<around|(|\<lambda\>|)>> be corresponding elements, and
    conversely, when starting from a convergent
    <math|g<rsub|m><around|(|\<lambda\>|)>> sequence.

    Now any element of <math|H<around|(|\<xi\>|)>> is, by definition, the
    limit in q.m. of a sequence of elements of the
    form<nbsp><eqref|eq:eta_combination>. Similarly, any element of
    <math|H<around|(|F|)>> is the limit in q.m. of a sequence of elements of
    the form<nbsp><eqref|eq:g_combination>. Thus, we have now extended the
    correspondence to the whole spaces <math|H<around|(|\<xi\>|)>> and
    <math|H<around|(|F|)>>. It follows from the properties of convergence in
    q.m. that the relations<nbsp><eqref|eq:preserved_inner_products>
    and<nbsp><eqref|eq:preserved_distances> will still hold under the
    extended conditions, so that inner products and distances are still
    preserved, and the correspondence is one-one.

    For every <math|\<lambda\><rsub|0>>, the function
    <math|g*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>>, where

    <\equation>
      g<around|(|\<lambda\>|)>=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|for
      >\<lambda\>\<leq\>0>>|<row|<cell|0>|<cell|<text|otherwise>>>>>><label|eq:step_function>
    </equation>

    is an element of <math|H<around|(|F|)>>. If the corresponding element of
    <math|H<around|(|\<xi\>|)>> is denoted by
    <math|\<zeta\><around|(|\<lambda\><rsub|0>|)>>, the increment
    <math|\<zeta\><around|(|\<lambda\><rsub|1>|)>-\<zeta\><around|(|\<lambda\><rsub|0>|)>>
    corresponds to <math|g*<around|(|\<lambda\>-\<lambda\><rsub|1>|)>-g*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>>.
    For <math|\<lambda\><rsub|0>\<less\>\<lambda\><rsub|1>> this is the
    function taking the value 1 for <math|\<lambda\><rsub|0>\<less\>\<lambda\>\<leq\>\<lambda\><rsub|1>>,
    and zero otherwise. If <math|<around|(|\<lambda\><rsub|0>,\<lambda\><rsub|1>|)>>
    and <math|<around|(|\<lambda\><rsub|2>,\<lambda\><rsub|3>|)>> are
    disjoint intervals, it follows from the preservation of inner products
    that

    <\equation>
      <with|font-base-size|8|E*<around|{|<around|[|\<zeta\><around|(|\<lambda\><rsub|1>|)>-\<zeta\><around|(|\<lambda\><rsub|0>|)>|]>\<cdot\><wide|<around|[|\<zeta\><around|(|\<lambda\><rsub|3>|)>-\<zeta\><around|(|\<lambda\><rsub|2>|)>|]>|\<bar\>>|}>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|[|g*<around|(|\<lambda\>-\<lambda\><rsub|1>|)>-g*<around|(|\<lambda\>-\<lambda\><rsub|0>|)>|]>\<cdot\><wide|<around|[|g*<around|(|\<lambda\>-\<lambda\><rsub|3>|)>-g*<around|(|\<lambda\>-\<lambda\><rsub|2>|)>|]>|\<bar\>>*d*F<around|(|\<lambda\>|)>=0<label|eq:orthogonal_increments>>
    </equation>

    so that <math|\<zeta\><around|(|\<lambda\>|)>> is a process with
    orthogonal increments. Taking <math|\<lambda\><rsub|1>=\<lambda\><rsub|0>>,
    and <math|\<lambda\><rsub|2>=\<lambda\><rsub|0>>, we obtain, since
    <math|F<around|(|\<lambda\>|)>> is continuous to the right,

    <\align>
      <tformat|<table|<row|<cell|E<around|\||<around|[|\<zeta\><around|(|\<lambda\><rsub|1>|)>-\<zeta\><around|(|\<lambda\><rsub|0>|)>|]>|\|><rsup|2>>|<cell|=F<around|(|\<lambda\><rsub|1>|)>-F<around|(|\<lambda\><rsub|0>|)><eq-number><label|eq:increment_variance>>>|<row|<cell|E<around|\||\<zeta\><around|(|\<lambda\><rsub|0>|)>|\|><rsup|2>>|<cell|=F<around|(|\<lambda\><rsub|0>|)><eq-number><label|eq:zeta_variance>>>>>
    </align>

    This process satisfies<nbsp><eqref|eq:zeta_properties>, the relation
    <math|E*\<zeta\><around|(|\<lambda\>|)>=0> being evident.

    In a discontinuity point <math|\<lambda\>> of <math|F>, the limits in
    q.m. <math|\<zeta\>*<around|(|\<lambda\>\<pm\>0|)>> both exist by
    Section<nbsp>6.1, and we have <math|\<zeta\><around|(|\<lambda\>|)>=\<zeta\>*<around|(|\<lambda\>+0|)>>,
    while <math|\<Delta\>*\<zeta\><around|(|\<lambda\>|)>=\<zeta\><around|(|\<lambda\>|)>-\<zeta\>*<around|(|\<lambda\>-0|)>>
    is a random variable such that <math|E*<around|\||\<Delta\>*\<zeta\><around|(|\<lambda\>|)>|\|><rsup|2>=\<Delta\>*F<around|(|\<lambda\>|)>>.
    Further, let <math|-A=\<lambda\><rsub|1>\<less\>\<lambda\><rsub|2>\<less\>\<cdots\>\<less\>\<lambda\><rsub|n+1>=A>
    be a partition of the interval <math|<around|(|-A,A|)>>. The random
    variable

    <\equation>
      \<eta\>=<big|sum><rsub|j=1><rsup|n>e<rsup|i*t*\<lambda\><rsub|j>>*<around|[|\<zeta\><around|(|\<lambda\><rsub|j+1>|)>-\<zeta\><around|(|\<lambda\><rsub|j>|)>|]><label|eq:partition_sum>
    </equation>

    will then correspond to the <math|\<lambda\>> function

    <\equation>
      g<around|(|\<lambda\>|)>=<choice|<tformat|<table|<row|<cell|e<rsup|i*t*\<lambda\><rsub|j>>>|<cell|<text|for
      >\<lambda\><rsub|j>\<less\>\<lambda\>\<leq\>\<lambda\><rsub|j+1>*<space|1em><around|(|j=1,\<ldots\>,n|)>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>><label|eq:partition_function>
    </equation>

    As <math|A> tends to infinity, while at the same time the maximum
    distance between consecutive <math|\<lambda\><rsub|j>> tends to zero,
    <math|g<around|(|\<lambda\>|)>> will converge in q.m. to
    <math|e<rsup|i*t*\<lambda\>>\<in\>H<around|(|F|)>>, while <math|\<eta\>>
    converges to the q.m. integral (see Sections<nbsp>5.3 and<nbsp>6.3)

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)>\<in\>H<label|eq:qm_integral>
    </equation>

    so that these limits are corresponding elements. However, we already know
    that <math|e<rsup|i*t*\<lambda\>>> corresponds to
    <math|\<xi\><around|(|t|)>>, and since the correspondence is one-one, it
    now follows that we have

    <\equation>
      \<xi\><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><label|eq:final_representation>
    </equation>

    and the proof of the theorem is completed.
  </proof>

  Incidentally, we remark that, between any <math|\<eta\>> of the
  form<nbsp><eqref|eq:eta_combination> and the corresponding
  <math|g<around|(|\<lambda\>|)>> given by<nbsp><eqref|eq:g_combination> we
  have the relation

  <\equation>
    \<eta\>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<lambda\>|)>*d*\<zeta\><around|(|\<lambda\>|)><label|eq:general_representation>
  </equation>

  This relation will subsist for any pair <math|\<eta\>> and
  <math|g<around|(|\<lambda\>|)>> such that the
  integral<nbsp><eqref|eq:L2_integral> exists as a Riemann-Stieltjes
  integral. In fact, the stochastic integral in the second member
  of<nbsp><eqref|eq:general_representation> is then by Section<nbsp>6.3
  defined as a q.m. integral. For a random variable
  <math|\<eta\>\<in\>H<around|(|\<xi\>|)>> which corresponds to a
  <math|g<around|(|\<lambda\>|)>\<in\>L<rsub|2><around|(|F|)>> such that the
  integral in<nbsp><eqref|eq:general_representation> is not defined by
  Section<nbsp>6.3, we regard<nbsp><eqref|eq:general_representation> as a
  definition of this integral. It will then be seen that the set of all
  random variables <math|\<eta\>> representable in the
  form<nbsp><eqref|eq:general_representation> with a
  <math|g<around|(|\<lambda\>|)>\<in\>L<rsub|2><around|(|F|)>> is identical
  with the Hilbert space <math|H<around|(|\<xi\>|)>> spanned by the random
  variables <math|\<xi\><around|(|t|)>> for all <math|t>.

  If we compare the spectral representations of <math|r<around|(|t|)>> and
  <math|\<xi\><around|(|t|)>>

  <\align>
    <tformat|<table|<row|<cell|r<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*F<around|(|\<lambda\>|)><eq-number><label|eq:r_spectral>>>|<row|<cell|\<xi\><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)><eq-number><label|eq:xi_spectral>>>>>
  </align>

  it will be seen that the elementary harmonic oscillations are respectively
  <math|e<rsup|i*t*\<lambda\>>*d*F<around|(|\<lambda\>|)>> and
  <math|e<rsup|i*t*\<lambda\>>*d*\<zeta\><around|(|\<lambda\>|)>>.

  In both cases the angular frequency is <math|\<lambda\>>. The squared
  random amplitude appearing in the latter case has a mean value equal to the
  nonrandom amplitude in the former case

  <\equation>
    E*<around|\||d*\<zeta\><around|(|\<lambda\>|)>|\|><rsup|2>=d*F<around|(|\<lambda\>|)><label|eq:amplitude_relation>
  </equation>

  On the other hand, the random phases arising from the factor

  <\equation>
    d*\<zeta\><around|(|\<lambda\>|)>=<around|\||d*\<zeta\><around|(|\<lambda\>|)>|\|>*e<rsup|i*arg
    d*\<zeta\><around|(|\<lambda\>|)>><label|eq:random_phase>
  </equation>

  are entirely obliterated in the nonrandom elementary oscillations, where
  all the phases are reduced to zero.

  If we think of <math|\<xi\><around|(|t|)>> as representing the temporal
  development of some concrete physical system, for example, a fluctuating
  electric voltage, the spectral representation<nbsp><eqref|eq:xi_spectral>
  gives the decomposition of the total fluctuation in its elementary harmonic
  components. The relation<nbsp><eqref|eq:amplitude_relation> then shows that
  <math|d*F<around|(|\<lambda\>|)>> is the average power dissipated across a
  unit resistance by the component with frequency in the element
  <math|<around|(|\<lambda\>,\<lambda\>+d*\<lambda\>|)>>. The spectral d.f.
  <math|F<around|(|\<lambda\>|)>> thus determines the distribution of the
  total average power in the <math|\<xi\><around|(|t|)>>-fluctuation over the
  range of angular frequency <math|\<lambda\>>. The average power assigned to
  the frequency interval <math|\<lambda\><rsub|1>\<less\>\<lambda\>\<less\>\<lambda\><rsub|2>>
  is <math|F<around|(|\<lambda\><rsub|2>|)>-F<around|(|\<lambda\><rsub|1>|)>>,
  which for the whole infinite <math|\<lambda\>> range becomes

  <\equation>
    E<around|\||\<xi\><around|(|t|)>|\|><rsup|2>=r<around|(|0|)>=F*<around|(|+\<infty\>|)>-F*<around|(|-\<infty\>|)><label|eq:total_power>
  </equation>

  Thus, <math|F<around|(|\<lambda\>|)>> determines the power spectrum of the
  <math|\<xi\><around|(|t|)>> process. We may think of this as a distribution
  of a spectral mass of total amount <math|r<around|(|0|)>> over the
  <math|\<lambda\>> axis. We shall say that a point <math|\<lambda\>> belongs
  to the power spectrum, whenever the interval
  <math|<around|(|\<lambda\>-h,\<lambda\>+h|)>> carries a positive mass for
  every <math|h\<gtr\>0>.

  The spectral moments

  <\equation>
    \<mu\><rsub|2*k>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<lambda\><rsup|2*k>*d*F<around|(|\<lambda\>|)><label|eq:spectral_moments>
  </equation>

  may or may not be finite. The moment <math|\<mu\><rsub|2*k>> is finite if
  and only if <math|r<around|(|t|)>> has a derivative of order <math|2*k> at
  <math|t=0>, and there will then be an expansion of <math|r<around|(|t|)>>
  for small <math|t> up to the power <math|t<rsup|2*k>>, just as for a
  characteristic function (see Section<nbsp>2.7.4).

  Since <math|F<around|(|\<lambda\>|)>> only differs by a multiplicative
  constant from an ordinary d.f. as used in probability theory, there is a
  unique representation (see Section<nbsp>2.5) of the form
  <math|F=F<rsub|1>+F<rsub|2>+F<rsub|3>>, where each <math|F<rsub|i>> is
  real, never-decreasing, and bounded. <math|F<rsub|1>> is a step function
  which contains all the jumps of <math|F>, while <math|F<rsub|2>> is
  absolutely continuous, and <math|F<rsub|3>> is singular (see
  Section<nbsp>2.5). In the applications, the singular component
  <math|F<rsub|3>> as a rule does not occur, and we shall not consider it in
  the sequel.

  The discontinuity points of <math|F>, which all enter in <math|F<rsub|1>>,
  form the point spectrum of <math|\<xi\><around|(|t|)>>. If <math|F> has a
  jump of magnitude <math|\<Delta\>*F> at the point <math|\<lambda\>>, this
  will introduce a discrete harmonic term into the spectral representations
  for <math|r<around|(|t|)>> and <math|\<xi\><around|(|t|)>>, respectively,
  of the form

  <\equation>
    \<Delta\>*F*e<rsup|i*t*\<lambda\>>*<space|1em><text|and><space|1em>\<Delta\>*\<zeta\>*e<rsup|i*t*\<lambda\>><label|eq:discrete_terms>
  </equation>

  where <math|\<Delta\>*\<zeta\>> is a random variable with zero mean and
  variance <math|E*<around|\||\<Delta\>*\<zeta\>|\|><rsup|2>=\<Delta\>*F>. In
  the extreme case when <math|F=F<rsub|1>> is a pure step function, we have

  <\align>
    <tformat|<table|<row|<cell|r<around|(|t|)>>|<cell|=<big|sum>\<Delta\>*F*e<rsup|i*t*\<lambda\>><eq-number><label|eq:discrete_r>>>|<row|<cell|\<xi\><around|(|t|)>>|<cell|=<big|sum>\<Delta\>*\<zeta\>*e<rsup|i*t*\<lambda\>><eq-number><label|eq:discrete_xi>>>>>
  </align>

  Both sums are extended over all jumps of <math|F=F<rsub|1>>, and the first
  sum is absolutely convergent, while the second converges in q.m.

  For a great number of applications, the most important case is when
  <math|F=F<rsub|2>>, so that we have an absolutely continuous spectrum, with
  a spectral density <math|f<around|(|\<lambda\>|)>=F<rprime|'><around|(|\<lambda\>|)>>.
  Then,<nbsp><eqref|eq:r_spectral> takes the form

  <\equation>
    r<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*f<around|(|\<lambda\>|)>*d*\<lambda\><label|eq:continuous_spectrum>
  </equation>

  The spectral representations<nbsp><eqref|eq:r_spectral>
  and<nbsp><eqref|eq:xi_spectral> are formally identical with the relation
  defining a characteristic function (see Section<nbsp>2.7.1), and there are
  also corresponding reciprocal relations expressing
  <math|F<around|(|\<lambda\>|)>> and <math|\<zeta\><around|(|\<lambda\>|)>>
  in terms of <math|r<around|(|t|)>> and <math|\<xi\><around|(|t|)>>. For any
  two continuity points <math|\<lambda\><rsub|1>> and
  <math|\<lambda\><rsub|2>> of <math|F<around|(|\<lambda\>|)>> we have, in
  fact,

  <\align>
    <tformat|<table|<row|<cell|F<around|(|\<lambda\><rsub|2>|)>-F<around|(|\<lambda\><rsub|1>|)>>|<cell|=<frac|1|2*\<pi\>>*lim<rsub|T\<to\>\<infty\>>
    <big|int><rsub|-T><rsup|T><frac|e<rsup|-i*t*\<lambda\><rsub|1>>-e<rsup|-i*t*\<lambda\><rsub|2>>|-i*t>*r<around|(|t|)>*d*t<eq-number><label|eq:inversion_F>>>|<row|<cell|\<zeta\><around|(|\<lambda\><rsub|2>|)>-\<zeta\><around|(|\<lambda\><rsub|1>|)>>|<cell|=lim<rsub|T\<to\>\<infty\>><frac|1|2*\<pi\>>*<big|int><rsub|-T><rsup|T><frac|e<rsup|-i*t*\<lambda\><rsub|1>>-e<rsup|-i*t*\<lambda\><rsub|2>>|-i*t>*\<xi\><around|(|t|)>*d*t<eq-number><label|eq:inversion_zeta>>>>>
  </align>

  The first of these relations differs only by a multiplicative constant from
  the corresponding relation for a characteristic function given in
  Section<nbsp>2.7.2. The second relation contains a q.m. integral, which, by
  means of the criterion<nbsp>(3.5.7), is found to converge in q.m. as
  <math|T\<to\>\<infty\>>. Using the well-known properties of trigonometric
  integrals, it is then proved without difficulty that the
  <math|\<zeta\><around|(|\<lambda\>|)>> process defined by the second member
  of<nbsp><eqref|eq:inversion_zeta> is a process with orthogonal increments,
  which satisfies the spectral relation<nbsp><eqref|eq:xi_spectral>. Starting
  from the expression in the second member of<nbsp><eqref|eq:inversion_zeta>,
  with a given stationary <math|\<xi\><around|(|t|)>>, we thus obtain an
  independent proof of the spectral representation<nbsp><eqref|eq:xi_spectral>.

  We finally note that the inversion formulae<nbsp><eqref|eq:inversion_F>
  and<nbsp><eqref|eq:inversion_zeta> will hold even for discontinuity points
  <math|\<lambda\><rsub|1>> and <math|\<lambda\><rsub|2>> if in the first
  members we replace <math|F<around|(|\<lambda\><rsub|1>|)>> by
  <math|<frac|1|2>*<around|[|F<around|(|\<lambda\><rsub|1>|)>+F*<around|(|\<lambda\><rsub|1>-0|)>|]>>
  and <math|\<zeta\><around|(|\<lambda\><rsub|1>|)>> by
  <math|<frac|1|2>*<around|[|\<zeta\><around|(|\<lambda\><rsub|1>|)>+\<zeta\>*<around|(|\<lambda\><rsub|1>-0|)>|]>>
  and similarly for <math|F<around|(|\<lambda\><rsub|2>|)>> and
  <math|\<zeta\><around|(|\<lambda\><rsub|2>|)>>. This remark will be used in
  the following section.

  <\thebibliography|9>
    <bibitem|Stone1>Stone, M.H. Linear transformations in Hilbert space and
    their applications to analysis. American Mathematical Society Colloquium
    Publications, Vol. 15.

    <bibitem|Cramer3>Cramér, H. On the theory of stationary random processes.
    Annals of Mathematics, Vol. 41, No. 2.

    <bibitem|Cramer4>Cramér, H. Mathematical methods of statistics. Princeton
    University Press.

    <bibitem|Loeve1>Loève, M. Probability theory. D. Van Nostrand Company.
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
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-2|<tuple|2|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|auto-3|<tuple|39|8|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Cramer3|<tuple|Cramer3|8|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Cramer4|<tuple|Cramer4|8|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Loeve1|<tuple|Loeve1|8|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|bib-Stone1|<tuple|Stone1|8|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:L2_integral|<tuple|10|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:amplitude_relation|<tuple|30|6|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:bochner_correspondence|<tuple|13|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:boundary_conditions|<tuple|2|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:continuous_spectrum|<tuple|37|7|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:convergence_correspondence|<tuple|18|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:discrete_r|<tuple|35|7|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:discrete_terms|<tuple|34|7|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:discrete_xi|<tuple|36|7|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:distance_zero|<tuple|12|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:eta_combination|<tuple|14|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:final_representation|<tuple|26|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:g_combination|<tuple|15|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:general_representation|<tuple|27|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:harmonic_oscillations|<tuple|7|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:increment_variance|<tuple|21|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:inner_product_F|<tuple|11|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:inner_product_xi|<tuple|9|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:integral_zero|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:inversion_F|<tuple|38|7|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:inversion_zeta|<tuple|39|7|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:linear_combinations|<tuple|8|3|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:orthogonal_increments|<tuple|20|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:partition_function|<tuple|24|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:partition_sum|<tuple|23|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:preserved_distances|<tuple|17|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:preserved_inner_products|<tuple|16|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:qm_integral|<tuple|25|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:r_spectral|<tuple|28|6|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:random_phase|<tuple|31|6|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:spectral_moments|<tuple|33|7|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:spectral_representation|<tuple|3|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:step_function|<tuple|19|4|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:total_power|<tuple|32|6|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:xi_spectral|<tuple|29|6|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:zeta_properties|<tuple|6|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|eq:zeta_variance|<tuple|22|5|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
    <associate|thm:spectral_representation|<tuple|1|2|../../../.TeXmacs/texts/scratch/no_name_5.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Stone1

      Cramer3

      Cramer4

      Loeve1
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Stationary
      Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Spectral Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>