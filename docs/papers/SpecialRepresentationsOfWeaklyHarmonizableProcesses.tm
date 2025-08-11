<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Special Representations of Weakly Harmonizable
  Processes>|<doc-author|<author-data|<author-name|Derek K.
  Chang<next-line>Department of Mathematics<next-line>California State
  University<next-line>Los Angeles, California 90032 M. M.
  Rao<next-line>Department of Mathematics<next-line>University of
  California<next-line>Riverside, California 92521>>>>

  <\abstract>
    This paper contains an account of orthogonal and general series as well
    as moving-average representations of weakly harmonizable processes. Also
    oscillatory and periodically correlated second order processes, their
    relation to harmonizable classes and an operator representation are
    presented. Further, supports of the spectral functions of weakly
    harmonizable processes are considered.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Factorizable
    Spectral Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Series
    Representations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>A
    Moving Average Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Operator
    Representations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Spectral
    Support Sets> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The purpose of this article is to consider some special types of
  representations for second order processes related to different classes of
  harmonizable families. These include the series, moving average, and
  oscillatory representations. To make the statements precise, let us start
  with their standard formulations.

  Thus if <math|<around|(|\<Omega\>,\<Sigma\>,P|)>> is a probability space
  and <math|L<rsub|0><rsup|2><around|(|\<Omega\>,\<Sigma\>,P|)>>, or
  <math|L<rsub|0><rsup|2><around|(|P|)>>, is the space of (equivalence
  classes of) scalar random variables on <math|\<Omega\>> with means zero and
  finite variances, then <math|X:T\<rightarrow\>L<rsub|0><rsup|2><around|(|P|)>>,
  a curve, is called a second order process denoted also as
  <math|<around|{|X<rsub|t>,t\<in\>T|}>>. In what follows <math|T=\<bbb-R\>>
  (or <math|\<bbb-Z\>>), unless specified differently. Let
  <math|r<around|(|\<cdummy\>,\<cdummy\>|)>:<around|(|s,t|)>\<mapsto\>E*<around|(|X<rsub|s>*X<rsub|t>|)>>,
  called the covariance function on <math|\<bbb-R\>\<times\>\<bbb-R\>>, be
  continuous, where

  <\equation>
    E*<around|(|X<rsub|s>*X<rsub|t>|)>=<around|(|X<rsub|s>,X<rsub|t>|)>=<big|int><rsub|\<Omega\>>X<rsub|s>*X<rsub|t>*<space|0.17em>d*P\<forall\><around|(|s,t|)>\<in\>T\<times\>T
  </equation>

  Recall that the process <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>> is
  then termed (i) (weakly) stationary if <math|r<around|(|s,t|)>=<wide|r|~>*<around|(|s-t|)>>
  so that by the classical Bochner theorem

  <\equation>
    r<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*<around|(|s-t|)>*\<lambda\>>*F*<around|(|d*\<lambda\>|)>
  </equation>

  for a unique positive bounded nondecreasing function <math|F>; (ii)
  strongly harmonizable if

  <\equation>
    r<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*s*\<lambda\>-i*t*\<mu\>>*F<around|(|d*\<lambda\>,d*\<mu\>|)>
  </equation>

  for a positive definite <math|F:\<bbb-R\>\<times\>\<bbb-R\>\<to\>\<bbb-C\>>
  of bounded variation in the sense of Vitali; and (iii) weakly harmonizable
  if (3) holds in which <math|F> is of the (weaker) bounded variation in
  Fréchet's sense. (See [2] or [11] on a discussion of these variations and a
  need for a new integral in the case of (iii) extending Lebesgue's classical
  concept.)

  Some related classes are also of interest. Thus
  <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>> is (a) periodically
  correlated if <math|r<around|(|s+\<alpha\>,t+\<alpha\>|)>=r<around|(|s,t|)>>
  for some fixed <math|\<alpha\>\<gtr\>0> and all <math|s,t\<in\>\<bbb-R\>>
  (<math|\<alpha\>> is termed a period); (b) oscillatory if the covariance is
  representable as (the Lebesgue integral)

  <\equation>
    r<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*<around|(|s-t|)>*\<lambda\>>*a<rsub|g><around|(|\<lambda\>|)><wide|a<rsub|t><around|(|\<lambda\>|)>|\<bar\>>F*<around|(|d*\<lambda\>|)>
  </equation>

  where again <math|F> is a positive nondecreasing function, defining a
  <math|\<sigma\>>-finite measure, and <math|<around|{|a<rsub|s>,s\<in\>\<bbb-R\>|}>>
  is a square integrable (for <math|F>) collection of scalar functions on
  <math|\<bbb-R\>>; and (c) Karhunen class if in (4) the factor
  <math|e<rsup|i*<around|(|s-t|)>*\<lambda\>>> is absent. In all these cases
  the real or complex <math|F> is called the <with|font-shape|italic|spectral
  (measure)> function of the process. There are a few other second order
  classes of interest in applications, but we shall defer them at this point.

  Under some reasonable conditions it is possible to present several series
  representations of these processes and also certain forms of moving
  averages for them. Since both of these are useful in many applications, we
  consider them for harmonizable families which extend the stationary
  classes.

  <section|Factorizable Spectral Functions>

  It is of interest to start with a subclass of harmonizable processes. They
  were isolated for a special study in [8]. Thus if
  <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>> is a weakly (or strongly)
  harmonizable process with <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> as its
  spectral measure function, then it is termed a
  <with|font-shape|italic|factorizable spectral measure> (f.s.m.) class if
  <math|F<around|(|s,t|)>=M<around|(|s|)><wide|M<around|(|t|)>|\<bar\>>>.
  [Note that if <math|F<around|(|s,t|)>=M<around|(|s|)><wide|N<around|(|t|)>|\<bar\>>>
  is assumed, it is not really different since the positive definiteness of
  <math|F> implies that <math|N<around|(|s|)>=c*M<around|(|s|)>>, for some
  <math|c\<geq\>0,s\<in\>\<bbb-R\>>, so that <math|M=N> can be taken as a
  general form.] This class has some nice structural properties of which the
  following will be used here. It is stated for the index <math|T=\<bbb-R\>>,
  but a similar fact holds for <math|T=\<bbb-Z\>>.

  <\proposition>
    If <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>
    is a weakly harmonizable process, then the following are equivalent:

    (i) the <math|X<rsub|t>>-process is of f.s.m. class

    (ii) the covariance function <math|r> of the process is factorizable, in
    that

    <\equation>
      r<around|(|s,t|)>=f<around|(|s|)><wide|f<around|(|t|)>|\<bar\>><space|1em><text|for
      some continuous function >f:\<bbb-R\>\<to\>\<bbb-C\>
    </equation>

    In either of these equivalent cases, the process is necessarily strongly
    harmonizable and the <math|f> of (ii) is then the Fourier transform of
    some scalar measure <math|\<mu\>> on <math|\<bbb-R\>> (so that
    <math|f=<wide|\<mu\>|^>>).
  </proposition>

  <with|font-series|bold|Proof:> Suppose (i) holds. Then
  <math|F<around|(|A,B|)>=M<around|(|A|)><wide|M<around|(|B|)>|\<bar\>>>.
  Since <math|F> is a bimeasure, this implies that
  <math|M<around|(|\<cdummy\>|)>> is a scalar <math|\<sigma\>>-additive set
  function on the Borel <math|\<sigma\>>-algebra <math|\<cal-B\>> of
  <math|\<bbb-R\>>. Thus it is a scalar measure (hence bounded). Then the
  covariance function <math|r> can be written as (cf. (3)):

  <\equation>
    <tabular|<tformat|<table|<row|<cell|r<around|(|s,t|)>>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*s*\<lambda\>-i*t*\<mu\>>*M*<around|(|d*\<lambda\>|)><wide|M*<around|(|d*\<mu\>|)>|\<bar\>>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*s*\<lambda\>>*M*<around|(|d*\<lambda\>|)>\<cdot\><around*|(|<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<mu\>><wide|M*<around|(|d*\<mu\>|)>|\<bar\>>|)>>>|<row|<cell|>|<cell|=f<around|(|s|)><wide|f<around|(|t|)>|\<bar\>><around*|(|=<wide|M<around|(|s|)>*M<around|(|t|)><rsup|-1>|\<bar\>>|)>>>>>>
  </equation>

  by using a form of the Fubini theorem. So (ii) holds.

  Suppose, on the other hand, that (ii) holds. Then
  <math|r<around|(|s,t|)>=f<around|(|s|)><wide|f<around|(|t|)>|\<bar\>>>, for
  some <math|f>. Since the process is harmonizable, <math|r> can be expressed
  as (3). For the weakly harmonizable case, the integral there must be in the
  sense of M. Morse and W. Transue. Even in this general case, one can use a
  suitable form of the inversion formula as follows. (See [13], Thm. 3.2
  without proof; and [11], Thm. 8.2 with a detailed and different argument.)
  Thus

  <\equation>
    F<around|(|A,B|)>=lim<rsub|0\<less\>T<rsub|1>,T<rsub|2>\<to\>\<infty\>>
    <big|int><rsub|-T<rsub|1>><rsup|T<rsub|1>><big|int><rsub|-T<rsub|2>><rsup|T<rsub|2>><frac|e<rsup|-i*\<lambda\>*s<rsub|1>>*e<rsup|-i*\<lambda\><rsub|1>*s<rsub|2>>|-i*s>\<cdot\><frac|e<rsup|i*\<lambda\><rsub|2>*t>*e<rsup|i*\<lambda\><rsub|1>*t>|i*t>*r<around|(|s,t|)>*d*s*d*t
  </equation>

  where <math|A=<around|(|\<lambda\><rsub|1>,\<lambda\><rsub|2>|)>>,
  <math|B=<around|(|\<lambda\><rsub|1><rprime|'>,\<lambda\><rsub|2><rprime|'>|)>>
  are intervals of <math|\<bbb-R\>> such that
  <math|F<around|(|<around|{|\<lambda\><rsub|1>|}>,<around|{|\<lambda\><rsub|1><rprime|'>|}>|)>=0=F<around|(|<around|{|\<lambda\><rsub|2>|}>,<around|{|\<lambda\><rsub|2><rprime|'>|}>|)>>.
  Substituting <math|r<around|(|s,t|)>=f<around|(|s|)><wide|f<around|(|t|)>|\<bar\>>>
  in (5), this reduces to

  <\equation>
    F<around|(|A,B|)>=M<around|(|A|)><wide|M<around|(|B|)>|\<bar\>><text|for
    a suitable >M<around|(|\<cdummy\>|)>
  </equation>

  Since <math|F> is a bimeasure, this shows that
  <math|M<around|(|\<cdummy\>|)>> is <math|\<sigma\>>-additive on the class
  of all such intervals which are also continuity intervals of
  <math|M<around|(|\<cdummy\>|)>>. But then the standard theory says that
  <math|M<around|(|\<cdummy\>|)>> has a unique <math|\<sigma\>>-additive
  extension to be a scalar measure on <math|B>, so that the process is of
  f.s.m. class and (i) obtains.

  When these equivalent conditions hold, <math|F<around|(|A,B|)>=M<around|(|A|)>\<times\><wide|M<around|(|B|)>|\<bar\>>>,
  and hence has a unique extension to be a bounded Borel (scalar) measure on
  the Borel sets of <math|\<bbb-R\>\<times\>\<bbb-R\>>. But this means (3) is
  a Lebesgue integral and the process is strongly harmonizable. This implies
  that the f.s.m. class <math|\<subseteq\>> strongly harmonizable class. The
  above result illuminates an interesting connection between the harmonizable
  and the periodically correlated classes. While introducing and analyzing
  the latter class, Glady²ev [3] has shown that every periodically correlated
  sequence <math|<around|{|X<rsub|n>,-\<infty\>\<less\>n\<less\>\<infty\>|}>>
  is necessarily strongly harmonizable. However, a continuous parameter
  periodically correlated process need not even be weakly harmonizable. This
  also follows from Proposition 1. Indeed let
  <math|f:\<bbb-R\>\<to\>\<bbb-C\>> be a periodic continuous function having
  only a conditionally convergent Fourier series. For instance such a
  function may be constructed as follows. Let
  <math|\<varphi\>:<around|[|0,2*\<pi\>|]>\<to\>\<bbb-R\>> be the classical
  Cantor function and define <math|<wide|f|~>:<around|[|0,2*\<pi\>|]>\<to\>\<bbb-R\>>
  by the equation <math|<wide|f|~><around|(|x|)>=\<varphi\><around|(|x|)>-<around|(|x/2*\<pi\>|)>>,
  and extend it to <math|\<bbb-R\>> by periodicity. If this extended function
  is <math|f>, then it will be a candidate. Let
  <math|r<around|(|s,t|)>=f<around|(|s|)><wide|f<around|(|t|)>|\<bar\>>>.
  Then <math|r<around|(|\<cdummy\>,\<cdummy\>|)>> is clearly a covariance
  function of a periodically correlated Gaussian process with mean zero. But
  it cannot be weakly harmonizable, since otherwise by the above proposition
  <math|f=<wide|M|^>> for a scalar measure which must then have an absolutely
  convergent Fourier series. This fact was first noted for an example in [4].
  It is also not hard to construct examples of periodically correlated weakly
  harmonizable processes that are not strongly harmonizable by considering a
  bimeasure <math|F> in (3) which determines a <math|\<sigma\>>-finite but
  nonfinite measure on <math|\<bbb-R\>\<times\>\<bbb-R\>>. One such simple
  example is also given in [4]. <with|font-shape|italic|The point of this
  paragraph is to draw the attention of the reader to a significant
  distinction between certain discrete and continuous parameter harmonizable
  processes in their structures.>

  <section|Series Representations>

  Turning to some other aspects, we recall that every (weakly or strongly)
  harmonizable process is of Karhunen class (cf. [2], Cor. 7.6, and also p.
  77, Eqs. (85) and (86) for a second proof). One of these proofs actually
  uses a series representation in its demonstration. There are several such
  expansions and we shall present a \Pnatural\Q series representation of
  (weakly) harmonizable processes using its spectral domain properties, and
  another type later on.

  Consider a weakly harmonizable process <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>>
  with its spectral measure function <math|F>. Then the integral in (3)
  relative to <math|F> is defined and termed a \Pstrict\Q <math|M*T>-integral
  in [2], and denoted

  <\equation>
    r<around|(|s,t|)>=<big|int><rsub|\<bbb-R\><rsup|2>><rsup|\<ast\>>e<rsup|i*s*\<lambda\>-i*t*\<mu\>>*F<around|(|d*\<lambda\>,d*\<mu\>|)>
  </equation>

  and it reduces to the standard Lebesgue integral when <math|F> has finite
  Vitali variation. The spectral domain of the process is denoted as:

  <\equation*>
    L<rsup|2><rsub|\<ast\>><around|(|F|)>=<around|{|f<text|measurable>:<big|int><rsub|\<bbb-R\><rsup|2>><rsup|\<ast\>>f<around|(|\<lambda\>|)><wide|f<around|(|\<mu\>|)>|\<bar\>>F<around|(|d*\<lambda\>,d*\<mu\>|)>=<around|(|f,f|)><rsub|F>\<less\>\<infty\>|}>.
  </equation*>

  Evidently <math|e<rsub|s>\<in\>L<rsup|2><rsub|\<ast\>><around|(|F|)>> and
  <math|<around|(|e<rsub|s>,e<rsub|t>|)><rsub|F>=r<around|(|s,t|)>> where
  <math|e<rsub|s><around|(|\<lambda\>|)>=e<rsup|i*s*\<lambda\>>>.

  It is easy to verify that <math|<around|(|\<cdummy\>,\<cdummy\>|)><rsub|F>>
  is a semi-inner product and that <math|L<rsup|2><rsub|\<ast\>><around|(|F|)>>
  is a vector space. However, it is also true but nontrivial that
  <math|<around|{|L<rsup|2><rsub|\<ast\>><around|(|F|)>,|(>\<cdot\>,\<cdot\><around|)|<rsub|F>|}>>
  is a complete (semi-)inner product space; and the proof uses several
  results of the structure theory of harmonizable processes (cf. [2], p. 76).
  Even in the strongly harmonizable case the completeness proof is
  nontrivial. Thus if <math|\<cal-N\>=<around|{|f:<around|(|f,f|)><rsub|F>=0|}>>
  and <math|L<rsup|2><around|(|F|)>=L<rsup|2><rsub|\<ast\>><around|(|F|)>/\<cal-N\>>
  is the quotient space, let <math|<wide|f|~><rsub|i>=f<rsub|i>+\<cal-N\>,i=1,2>.
  Set

  <\equation>
    <around|(|<wide|f|~><rsub|1>,<wide|f|~><rsub|2>|)><rsub|F>=<around|(|f<rsub|1>,f<rsub|2>|)><rsub|F>
  </equation>

  Then <math|<around|{|L<rsup|2><around|(|F|)>,|(>\<cdot\>,\<cdot\><around|)|<rsub|F>|}>>
  is a Hilbert space and if <math|\<cal-H\><around|(|X|)>=<math-up|sp><around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>
  is the closed linear span, then the correspondence
  <math|\<tau\>:<wide|f|~>\<mapsto\><big|int><rsub|\<bbb-R\>>f*d*Z(\<in\>\<cal-H\><around|(|X|)>)>,
  sets up an isometric isomorphism between <math|L<rsup|2><around|(|F|)>> and
  <math|\<cal-H\><around|(|X|)>>. Here <math|Z<around|(|\<cdummy\>|)>> is the
  stochastic measure representing the <math|X<rsub|t>> process so that

  <\equation>
    X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*Z*<around|(|d*\<lambda\>|)>\<forall\>t\<in\>\<bbb-R\>
  </equation>

  where the integral is taken in the Dunford-Schwartz sense (cf. [2]). Since
  the covariance function <math|r> of (6) is continuous, it is known from
  prior results that <math|\<cal-H\><around|(|X|)>> is separable and, due to
  the isometry noted above, so is <math|L<rsup|2><around|(|F|)>>. Let
  <math|<around|{|f<rsub|n>,n\<geq\>1|}>\<subset\>L<rsup|2><around|(|F|)>> be
  any complete orthonormal sequence. If <math|<wide|f|~><rsub|n>=f<rsub|n>+\<cal-N\>>
  and

  <\equation>
    \<xi\><rsub|n>=<big|int><rsub|\<bbb-R\>>f<rsub|n><around|(|\<lambda\>|)>*Z*<around|(|d*\<lambda\>|)><space|1em>(=\<tau\><around|(|<wide|f|~><rsub|n>|)>)
  </equation>

  then <math|<around|{|\<xi\><rsub|n>,n\<geq\>1|}>\<subset\>\<cal-H\><around|(|X|)>>
  is also a complete orthonormal sequence. With this setup we can establish
  the following result which extends a similar one for the strongly
  harmonizable case in [1]. However, the latter authors assumed implicitly
  the completeness of <math|L<rsup|2><around|(|F|)>>, and this property was
  not established until recently.

  <\proposition>
    Let <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>> be a weakly
    harmonizable process with <math|L<rsup|2><around|(|F|)>> as its spectral
    domain. If <math|<around|{|<wide|f|~><rsub|n>,n\<geq\>1|}>> is a complete
    orthonormal set in <math|L<rsup|2><around|(|F|)>> and
    <math|<around|{|\<xi\><rsub|n>,n\<geq\>1|}>> the corresponding set in
    <math|\<cal-H\><around|(|X|)>=<math-up|sp><around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>,
    then

    <\equation>
      X<rsub|t>=<big|sum><rsub|n=1><rsup|\<infty\>>a<rsub|n><around|(|t|)>*\<xi\><rsub|n>
      \<forall\>t\<in\>\<bbb-R\>
    </equation>

    where <math|a<rsub|n><around|(|t|)>=<around|(|e<rsub|t>,f<rsub|n>|)><rsub|F>,n\<geq\>1,<wide|f|~><rsub|n>=f<rsub|n>+\<cal-N\>>.
  </proposition>

  <with|font-series|bold|Proof:> Since <math|\<tau\>:L<rsup|2><around|(|F|)>\<to\>\<cal-H\><around|(|X|)>>
  is an isometric isomorphism and <math|\<tau\><around|(|<wide|f|~><rsub|n>|)>=\<xi\><rsub|n>>,
  one has

  <\equation>
    <around|(|\<xi\><rsub|n>,\<xi\><rsub|m>|)>=<around|(|\<tau\><around|(|<wide|f|~><rsub|n>|)>,\<tau\><around|(|<wide|f|~><rsub|m>|)>|)>=<around|(|f<rsub|n>,f<rsub|m>|)><rsub|F>=\<delta\><rsub|m*n>.
  </equation>

  Expanding <math|X<rsub|t>> in a Fourier series in
  <math|\<cal-H\><around|(|X|)>>, we get (11) immediately with the
  coefficients <math|a<rsub|n><around|(|t|)>> given by

  <\equation>
    a<rsub|n><around|(|t|)>=<around|(|X<rsub|t>,\<xi\><rsub|n>|)>=<around|(|X<rsub|t>,\<tau\><around|(|<wide|f|~><rsub|n>|)>|)>=<around|(|\<tau\><rsup|\<ast\>><around|(|X<rsub|t>|)>,f<rsub|n>|)><rsub|F>
  </equation>

  with <math|\<tau\><rsup|\<ast\>>*<text|being the adjoint of>>

  <\equation>
    \<tau\>=<around|(|e<rsub|t>,f<rsub|n>|)><rsub|F>
  </equation>

  <math|<text|since >\<tau\><rsup|\<ast\>><around|(|X<rsub|t>|)>=e<rsub|t>.>
  This is precisely the assertion. <math|\<blacksquare\>>

  It is natural to ask for a Karhunen-Loève type expansion (cf. [5], p. 64)
  for harmonizable processes. However, the covariance function
  <math|r:\<bbb-R\>\<times\>\<bbb-R\>\<to\>\<bbb-C\>> of such a process,
  being bounded and continuous, is not necessarily square integrable on
  <math|\<bbb-R\>\<times\>\<bbb-R\>>, and here one needs to alter slightly
  the above type series representation. But with such a modification one can
  present a result for a somewhat general class including all harmonizable
  families as follows.

  Let <math|<around|{|X<rsub|t>,t\<in\>T|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>,T\<subset\>\<bbb-R\>>,
  be a process with a bounded continuous covariance function <math|r>. Let

  <\equation>
    <wide|r|~><around|(|s,t|)>=<sqrt|<frac|r<around|(|s,t|)><rsup|\<nosymbol\>>|<around|(|1+s<rsup|2>|)>*<around|(|1+t<rsup|2>|)>>>
  </equation>

  \ Then <math|<wide|r|~>> is also continuous and positive definite. The
  first being obvious, the second property is seen from the fact that for any
  continuous <math|\<varphi\>:\<bbb-R\>\<to\>\<bbb-C\>> with compact support,
  one has

  <\equation>
    <big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>><wide|r|~><around|(|s,t|)>*\<varphi\><around|(|s|)><wide|\<varphi\><around|(|t|)>|\<bar\>>d*s*d*t=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>r<around|(|s,t|)><wide|*\<varphi\>|~><around|(|s|)><wide|<wide|\<varphi\>|~><around|(|t|)>|\<bar\>>d*s*d*t*\<geq\>0
  </equation>

  since <math|r> is positive definite and
  <math|<frac|\<varphi\><around|(|s|)>|<around|(|1+s<rsup|2>|)><rsup|\<nosymbol\>>*12>>
  is integrable. If <math|<wide|X|~><rsub|t>=X<rsub|t>/<sqrt|1+t<rsup|2>>>,
  then <math|<wide|X|~><rsub|t>\<in\>L<rsub|0><rsup|2><around|(|P|)>,E*<around|(|X<rsub|s>*<wide|X|~><rsub|t>|)>=<wide|r|~><around|(|s,t|)>>,
  and what is decisive, <math|<wide|r|~>> is square integrable on
  <math|\<bbb-R\>\<times\>\<bbb-R\>>, if <math|r> is bounded. In this case
  the operator <math|A> defined by

  <\equation>
    <around|(|A*f|)><around|(|s|)>=<big|int><rsub|\<bbb-R\>><wide|r|~><around|(|s,t|)>*f<around|(|t|)>*d*t
  </equation>

  is completely continuous on the standard Lebesgue space
  <math|L<rsup|2><around|(|\<bbb-R\>|)>>, and has a complete set of
  (orthonormal) eigenfunctions corresponding to its eigenvalues
  <math|\<lambda\><rsub|i>\<geq\>0> (cf. [12], p. 243) so that
  <math|A*\<varphi\><rsub|i>=\<lambda\><rsub|i>*\<varphi\><rsub|i>>. We then
  have the following representation:

  <\proposition>
    Let <math|<around|{|X<rsub|t>,t\<in\>T|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>
    be a process with a bounded continuous covariance function <math|r>. [In
    particular, this is automatic if the process is weakly or strongly
    harmonizable.] If\ 

    <\equation>
      <wide|r|~>:<around|(|s,t|)>\<mapsto\><frac|r<around|(|s,t|)>|<sqrt|<around|(|1+s<rsup|2>|)>*<around|(|1+t<rsup|2>|)>>>
    </equation>

    \ and <math|\<lambda\><rsub|i>(\<geq\>0)> are its eigenvalues and
    <math|\<varphi\><rsub|i>> are the corresponding normalized
    eigenfunctions, then <math|<around|{|\<xi\><rsub|n>,n\<geq\>1|}>> defined
    (as a Bochner or stochastic integral) by

    <\equation>
      \<xi\><rsub|n>=*<frac|<big|int><rsub|-\<infty\>><rsup|\<infty\>>X<rsub|t>**<frac|\<varphi\><rsub|n><around|(|t|)>|<sqrt|1+t<rsup|2>>>*d*t|<sqrt|\<lambda\><rsub|n>>>
    </equation>

    form a complete orthonormal set in <math|\<cal-H\><around|(|X|)>=<math-up|sp><around|{|X<rsub|t>,t\<in\>T|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>,
    and one has

    <\equation>
      X<rsub|t>=<big|sum><rsub|n=1><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*\<varphi\><rsub|n><around|(|t|)>*<around|(|1+t<rsup|2>|)><rsup|<frac|1|2>>*\<xi\><rsub|n>
    </equation>

    the series converging in <math|\<cal-H\><around|(|X|)>>-mean.
  </proposition>

  <with|font-series|bold|Proof:> If <math|<wide|X|~><rsub|t>=X<rsub|t>/<sqrt|1+t<rsup|2>>>,
  then <math|E*<around|(|X<rsub|s>*<wide|X|~><rsub|t>|)>=<wide|r|~><around|(|s,t|)>>
  and using (12) and the classical Hilbert-Schmidt theory, we get

  <\equation>
    <wide|r|~><around|(|s,t|)>=<big|sum><rsub|i=1><rsup|\<infty\>>\<lambda\><rsub|i>*\<varphi\><rsub|i><around|(|s|)><wide|\<varphi\><rsub|i><around|(|t|)>|\<bar\>>\<forall\>\<lambda\><rsub|i>\<geq\>0
  </equation>

  the series converging in mean (and uniformly also). If we take
  <math|F<around|(|\<cdummy\>|)>> to be the function which increases by jumps
  of size <math|\<lambda\><rsub|i>> at <math|i\<geq\>0> and vanishing on the
  negative line, and <math|a<rsub|s><around|(|v|)>=\<varphi\><rsub|v><around|(|s|)>>
  for <math|v=i>, and <math|=0> elsewhere in (4), without the exponential
  term, then (15) can be expressed as

  <\equation>
    <wide|r|~><around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>a<rsub|s><around|(|v|)><wide|a<rsub|t><around|(|v|)>|\<bar\>>F*<around|(|d*v|)>\<forall\>s,t\<in\>T\<times\>T
  </equation>

  so that <math|<around|{|<wide|X|~><rsub|t>,t\<in\>T|}>> is a Karhunen
  process relative to <math|<around|{|a<rsub|s>|(>\<cdot\>),s\<in\>T}>. Then
  it may be represented as

  <\equation>
    <wide|X|~><rsub|t>=<big|int><rsub|\<bbb-R\>>a<rsub|t><around|(|v|)>*Z*<around|(|d*v|)>\<forall\>t\<in\>T
  </equation>

  where <math|Z<around|(|\<cdummy\>|)>> is a stochastic measure with
  orthogonal values in <math|L<rsub|0><rsup|2><around|(|P|)>>, and
  <math|E*<around|(|Z<around|(|A|)>*Z<around|(|B|)>|)>=F*<around|(|A\<cap\>B|)>>
  (cf. [5], p. 59; or [2], p. 55). If now we set
  <math|Z<around|(|<around|{|i|}>|)>=\<xi\><rsub|i>*<sqrt|\<lambda\><rsub|i>>>
  where <math|\<xi\><rsub|n>> is given by (13), then (17) becomes

  <\equation>
    <wide|X|~><rsub|t>=<big|sum><rsub|n=1><rsup|\<infty\>><sqrt|\<lambda\><rsub|n>>*\<varphi\><rsub|n><around|(|t|)>*\<xi\><rsub|n>
  </equation>

  the series converging in <math|\<cal-H\><around|(|X|)>>. Since
  <math|X<rsub|t>=<wide|X|~><rsub|t>*<around|(|1+t<rsup|2>|)><rsup|<frac|1|2>>>,
  this gives (14). <math|\<blacksquare\>>\ 

  <\remark>
    If <math|T> is a compact set, then no factor such as
    <math|<around|[|<around|(|1+s<rsup|2>|)>*<around|(|1+t<rsup|2>|)>|]><rsup|-<frac|1|2>>>
    is needed in the above development, since the classical Mercer theorem
    applies and yields the expansion (15) for <math|r>. In the noncompact
    case, Mercer's theorem is no longer available and some such positive
    factor seems necessary to invoke the Hilbert-Schmidt result.
  </remark>

  <section|A Moving Average Representation>

  Another expression used in the stationary case is the moving average
  representation. Following the classical case (cf. [5], p. 79) one terms a
  Karhunen type process <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>
  to have a moving average representation if it is of the form

  <\equation>
    X<rsub|t>=<big|int><rsub|\<bbb-R\>>g*<around|(|t-u|)>*Z*<around|(|d*u|)>\<forall\>t\<in\>\<bbb-R\>
  </equation>

  where <math|Z<around|(|\<cdummy\>|)>> is a stochastic measure and
  <math|<wide|g|~>*<around|(|t-\<cdot\>|)>\<in\>L<rsup|2><around|(|F|)>> for
  each <math|t>. Here <math|F> is the spectral measure such that
  <math|F<around|(|A,B|)>=E<around|(|Z<around|(|A|)><wide|Z<around|(|B|)>|\<bar\>>|)>>.
  If <math|Z<around|(|\<cdummy\>|)>> has orthogonal values in
  <math|L<rsub|0><rsup|2><around|(|P|)>> then this reduces to the classical
  (stationary) case when <math|F> is moreover the Lebesgue measure. Here we
  consider again that <math|Z<around|(|\<cdummy\>|)>> is an arbitrary
  stochastic measure in <math|L<rsub|0><rsup|2><around|(|P|)>>, and find
  conditions on <math|g> in order that the <math|X<rsub|t>>-process is weakly
  harmonizable.

  The following strong conclusion is somewhat unexpected.

  <\theorem>
    Let <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>> be a process of the
    form (18) with <math|g=<wide|f|^>>, where
    <math|f\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> and <math|Z> is a
    stochastic measure with values in <math|L<rsub|0><rsup|2><around|(|P|)>>.
    Then the process is strongly harmonizable and its spectral measure is
    absolutely continuous relative to the planar Lebesgue measure.
  </theorem>

  <\proof>
    Since <math|g=<wide|f|^>> in (18), and hence <math|g> is bounded, it
    follows that the integral is well defined as a Dunford-Schwartz integral,
    and some of it properties will be used. Thus, since a form of the Fubini
    theorem is available here (cf. [11], p. 317 for detailed reasons), one
    has

    <\equation>
      <tabular|<tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<big|int><rsub|\<bbb-R\>><wide|f|^>*<around|(|t-u|)>*Z*<around|(|d*u|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>Z*<around|(|d*u|)><around*|(|<big|int><rsub|\<bbb-R\>>e<rsup|i*<around|(|t-u|)>*\<lambda\>>*f<around|(|\<lambda\>|)>*d*\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*f<around|(|\<lambda\>|)><around*|(|<big|int><rsub|\<bbb-R\>>e<rsup|-i*u*\<lambda\>>*Z*<around|(|d*u|)>|)>*d*\<lambda\>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*f<around|(|\<lambda\>|)><wide|Y|~><around|(|\<lambda\>|)>*d*\<lambda\>>>>>>
    </equation>

    \;

    where <math|<around|{|<wide|Y|~><around|(|\<lambda\>|)>,\<lambda\>\<in\>\<bbb-R\>|}>>
    is a weakly harmonizable process by ([2], Prop. 6.4), and the integral
    now becomes a Bochner integral. Let <math|<wide|Z|~>:A\<mapsto\><big|int><rsub|A><wide|Y|~><around|(|t|)>*f<around|(|t|)>*d*t,A\<in\>\<cal-B\>>.
    Then <math|<wide|Z|~>> is a stochastic measure on the Borel sets
    <math|\<cal-B\>> of <math|\<bbb-R\>>, and one has

    <\equation>
      <tabular|<tformat|<table|<row|<cell|E<around|(|<wide|Z|~><around|(|A|)><wide|<wide|Z|~><around|(|B|)>|\<bar\>>|)>.>|<cell|=<big|int><rsub|A><big|int><rsub|B>E<around|(|<wide|Y|~><around|(|s|)><wide|Y|\<bar\>><around|(|t|)>|)>\<cdot\>f<around|(|s|)><wide|f<around|(|t|)>|\<bar\>>d*s*d*t>|<cell|>>|<row|<cell|>|<cell|=<big|int><rsub|A><big|int><rsub|B>r<rsub|Y><around|(|s,t|)><wide|f<around|(|s|)>|\<bar\>>f<around|(|t|)>*d*s*d*t>|<cell|>>|<row|<cell|>|<cell|=\<nu\><around|(|A,B|)><text|>>|<cell|<around*|(|say|)>>>>>>
    </equation>

    Here <math|r<rsub|Y>> is the covariance function of the
    <math|<wide|Y|~>>-process and is bounded. So
    <math|\<nu\><around|(|\<cdummy\>,\<cdummy\>|)>> has finite Vitali
    variation, and (19) can be written, with the properties of the Bochner
    integral, as

    <\equation>
      X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*<wide|Z|~><around|(|d*\<lambda\>|)>\<forall\><space|1em>t\<in\>\<bbb-R\>
    </equation>

    Consequently <math|<around|{|X<rsub|t>,t\<in\>\<bbb-R\>|}>> is strongly
    harmonizable.

    Finally we may calculate the covariance function of <math|X<rsub|t>> as

    <\equation>
      <tabular|<tformat|<table|<row|<cell|r<around|(|s,t|)>>|<cell|=E<around|(|X<rsub|s><wide|X<rsub|t>|\<bar\>>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*s*\<lambda\>-i*t*\<lambda\><rprime|'>>*\<nu\><around|(|d*\<lambda\>,d*\<lambda\><rprime|'>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>e<rsup|i*s*\<lambda\>-i*t*\<lambda\><rprime|'>>*r<rsub|Y><around|(|\<lambda\>,\<lambda\><rprime|'>|)><wide|f<around|(|\<lambda\>|)>|\<bar\>>f<around|(|\<lambda\><rprime|'>|)>*d*\<lambda\>*d*\<lambda\><rprime|'>>>>>>
    </equation>

    Thus <math|\<nu\><around|(|\<cdummy\>,\<cdummy\>|)>> is absolutely
    continuous relative to the Lebesgue measure on
    <math|\<bbb-R\>\<times\>\<bbb-R\>>, being a Borel measure.\ 
  </proof>

  <with|font-series|bold|Remarks:> 1. It is easily shown that
  <math|<around*|\||<big|int><rsub|\<bbb-R\>>X<rsub|t>*h<around|(|t|)>*d*t|\|><rsub|2>\<leq\>K<rsub|0>\<cdot\><around|\<\|\|\>|h|\<\|\|\>><rsub|\<infty\>>>,
  for each <math|h\<in\>L<rsup|1><around|(|\<bbb-R\>|)>> and this implies the
  (<math|V>-boundedness and so equivalently) weak harmonizability of the
  <math|X<rsub|t>>-process (cf. [11], Thm. 4.2). But the above stronger
  conclusion needs additional work, and the given demonstration seems to be
  the shortest.

  2. If <math|Z<around|(|\<cdummy\>|)>> has orthogonal increments with an
  absolutely continuous spectral measure (i.e., the stationary case), then
  one can prove a converse of the above result. In any event it is an
  extension of a classical theorem due to Karhunen (cf. [5], p. 83), and is a
  considerable strengthening of ([1], Thm. 4).

  <section|Operator Representations>

  We have defined the Karhunen class and the oscillatory one in Section 1.
  Both are of second order. The following elementary observation is useful
  for the ensuing work.

  <\proposition>
    <with|font-shape|italic|The class of oscillatory processes
    <math|<around|{|X<rsub|t>,t\<in\>T|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>
    and the class of Karhunen processes indexed by <math|T> where
    <math|T=\<bbb-R\>> or <math|\<bbb-Z\>>, coincide.>
  </proposition>

  Setting <math|g<rsub|s><around|(|\<lambda\>|)>=e<rsup|i*s*\<lambda\>>*a<rsub|s><around|(|\<lambda\>|)>>
  in (4), <math|s\<in\>T>, and <math|\<lambda\>\<in\><wide|T|^>> where
  <math|<wide|T|^>=\<bbb-R\>> or <math|<around|(|0,2*\<pi\>|]>> accordingly
  as <math|T=\<bbb-R\>> or <math|\<bbb-Z\>> respectively, in their
  definitions, the result follows immediately.

  This simple identification enables an operator theoretical representation
  of mean continuous Karhunen processes indexed by <math|\<bbb-R\>> or
  <math|\<bbb-Z\>>. We present this form and connect it with the (weakly)
  harmonizable class. This helps in gaining a better insight of these
  families. We shall deduce it from reformulations of essentially known
  results. Hereafter \Poperator\Q means \Plinear operator.\Q\ 

  <\theorem>
    <with|font-shape|italic|Let <math|<around|{|X<rsub|t>,t\<in\>T|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>
    be a mean continuous process. Then it is representable as>

    <\with|font-shape|italic>
      <\equation>
        X<rsub|t>=A<rsub|t>*U<rsub|t>*Y<rsub|0>\<forall\>t\<in\>T*<space|1em><around|(|T=\<bbb-R\>*<text|or
        >\<bbb-Z\>|)>
      </equation>

      for some point <math|Y<rsub|0>> in <math|\<cal-H\><around|(|X|)>=<math-up|sp><around|{|X<rsub|t>,t\<in\>T|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>,
      where <math|A<rsub|t>> is a densely defined closed operator in
      <math|\<cal-H\><around|(|X|)>>, for each <math|t\<in\>T>, and
      <math|<around|{|U<rsub|s>,s\<in\>T|}>> is a weakly continuous unitary
      group of operators in <math|\<cal-H\><around|(|X|)>> which commutes
      with each <math|A<rsub|t>,t\<in\>T>. If, moreover, the process is
      weakly harmonizable, then there is an enlarged Hilbert space
      <math|\<cal-K\>\<supset\>\<cal-H\><around|(|X|)>>, operators
      <math|A<rsub|t>:\<cal-K\>\<to\>\<cal-H\><around|(|X|)>> and
      <math|<around|{|U<rsub|s>,s\<in\>T|}>> a weakly continuous unitary
      group on <math|\<cal-K\>>, <math|Y<rsub|0>\<in\>\<cal-K\>>, such that
      <math|<around|{|A<rsub|t>,t\<in\>T|}>> restricted to
      <math|\<cal-H\><around|(|X|)>> is a weakly continuous contractive
      positive definite family satisfying <math|A<rsub|0>=> identity on
      <math|\<cal-H\><around|(|X|)>>. [Here positive definiteness means that
      for any <math|h<rsub|i>\<in\>\<cal-H\><around|(|X|)>,t<rsub|i>\<in\>T,i=1,\<ldots\>,n>,

      <\equation>
        <big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|n><around|(|A<rsub|t<rsub|i>-t<rsub|j>>*h<rsub|i>,h<rsub|j>|)>\<geq\>0\<forall\><space|1em>n\<geq\>1
      </equation>

      On the other hand a process defined by (21) is always weakly
      harmonizable if only <math|<around|{|A<rsub|t>,t\<in\>T|}>> is a weakly
      continuous positive definite contractive family of operators there,
      with <math|A<rsub|0>=> identity, as above.
    </with>
  </theorem>

  <\proof>
    This result is obtained from several known, but deep, facts and we
    include its essential details for completeness.

    Since the process is mean continuous, <math|\<cal-H\><around|(|X|)>> is
    separable and so <math|<around|{|X<rsub|t>,t\<in\>T|}>> is of Karhunen
    class relative to a family <math|<around|{|g<rsub|t>,t\<in\><wide|T|^>|}>>
    and a Borel measure <math|\<mu\>>. By the preceding proposition,
    replacing <math|g<rsub|t><rprime|'>> with
    <math|e<rsup|i*t<around|(|\<cdummy\>|)>>*g<rsub|t>>, we may express this
    as (<math|<wide|T|^>> denoting the dual group of <math|T>):

    <\equation>
      X<rsub|t>=<big|int><rsub|<wide|T|^>>e<rsup|i*t*\<lambda\>>*g<rsub|t><around|(|\<lambda\>|)>*Z*<around|(|d*\<lambda\>|)>\<forall\>t\<in\>T
    </equation>

    where <math|Z<around|(|\<cdummy\>|)>> is an orthogonally valued
    <math|\<sigma\>>-additive set function in <math|\<cal-H\><around|(|X|)>>
    from the Borel <math|\<sigma\>>-algebra of <math|<wide|T|^>>. Here
    <math|E<around|(|Z<around|(|A|)><wide|Z<around|(|B|)>|\<bar\>>|)>=\<mu\>*<around|(|A\<cap\>B|)>>
    and <math|<big|int><rsub|<wide|T|^>><around|\||g<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*\<mu\>*<around|(|d*\<lambda\>|)>>
    <math|\<less\>\<infty\>>. But then the <math|Y<rsub|t>>-process defined
    by

    <\equation>
      Y<rsub|t>=<big|int><rsub|<wide|T|^>>e<rsup|i*t*\<lambda\>>*Z*<around|(|d*\<lambda\>|)>\<forall\>t\<in\>T
    </equation>

    is stationary; so, as is well known, there is a weakly continuous group
    of unitary operators <math|<around|{|U<rsub|t>,t\<in\>T|}>> on
    <math|\<cal-H\><around|(|X|)>> such that
    <math|Y<rsub|t>=U<rsub|t>*Y<rsub|0>>. Also by the spectral theorem for
    this family of operators (cf. [12], p. 281 and p. 383)

    <\equation>
      U<rsub|t>=<big|int><rsub|<wide|T|^>>e<rsup|i*t*\<lambda\>>*E*<around|(|d*\<lambda\>|)>\<forall\>t\<in\>T
    </equation>

    where <math|<around|{|E|(>\<cdot\>),\<cal-B\>}> is the resolution of the
    identity of the <math|<around|{|U<rsub|t>,t\<in\>T|}>>, with
    <math|\<cal-B\>> as the Borel <math|\<sigma\>>-algebra of
    <math|<wide|T|^>>. Thus <math|Z<around|(|A|)>=E<around|(|A|)>*Y<rsub|0>,A\<in\>\<cal-B\>>.
    Now define

    <\equation>
      A<rsub|t>=<big|int><rsub|<wide|T|^>>g<rsub|t><around|(|\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>
    </equation>

    Since <math|\<mu\><around|(|\<cal-B\>|)>=<around|(|E<around|(|B|)>*Y<rsub|0>,E<around|(|B|)>*Y<rsub|0>|)>>
    and <math|<big|int><rsub|<wide|T|^>><around|\||g<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*\<mu\>*<around|(|d*\<lambda\>|)>\<less\>\<infty\>>,
    it follows from standard results of the functional calculus in Hilbert
    space that <math|A<rsub|t>> is a closed densely defined operator in
    <math|\<cal-H\><around|(|X|)>> and its domain contains
    <math|<around|{|Y<rsub|s>,s\<in\>T|}>> for each <math|t>. Since
    <math|U<rsub|t>> and <math|E<around|(|B|)>> commute for all <math|t> and
    <math|B>, we deduce that <math|A<rsub|t>> and
    <math|E<around|(|B|)>,B\<in\>\<cal-B\>> commute. It then follows that
    <math|A<rsub|t>> and <math|<around|{|U<rsub|s>,s\<in\>T|}>> commute for
    each <math|t> (cf. [12], p. 351) and one has

    <\equation>
      <tabular|<tformat|<table|<row|<cell|A<rsub|t>*U<rsub|t>*Y<rsub|0>>|<cell|=A<rsub|t><around*|(|<big|int><rsub|<wide|T|^>>e<rsup|i*t*v>*E*<around|(|d*v|)>*Y<rsub|0>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|<wide|T|^>>g<rsub|t><around|(|\<lambda\>|)>*E*<around|(|d*\<lambda\>|)><around*|(|<big|int><rsub|<wide|T|^>>e<rsup|i*t*v>*E*<around|(|d*v|)>*Y<rsub|0>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|<wide|T|^>>e<rsup|i*t*\<lambda\>>*g<rsub|t><around|(|\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>*Y<rsub|0>>>|<row|<cell|>|<cell|=<big|int><rsub|<wide|T|^>>e<rsup|i*t*\<lambda\>>*g<rsub|t><around|(|\<lambda\>|)>*Z*<around|(|d*\<lambda\>|)>=X<rsub|t>>>>>>
    </equation>

    by (25) and a property of the spectral integral(22). Thus the
    representation (21) holds.

    On the other hand, if <math|X<rsub|t>> is given by (21), with
    <math|A<rsub|t>> and <math|<around|{|U<rsub|s>,s\<in\>T|}>> commuting for
    each <math|t\<in\>T>, so that <math|A<rsub|t>> and
    <math|<around|{|E<around|(|B|)>,B\<in\>\<cal-B\>|}>> also commute, one
    concludes from a deep theorem of von Neumann and F. Riesz (cf. [12], p.
    351 again, and the footnote there) that <math|A<rsub|t>> is a function
    <math|\<varphi\><rsub|t>> of <math|U<rsub|t>>. It follows with the
    spectral theorem that

    <\equation>
      A<rsub|t>=\<varphi\><rsub|t><around|(|U<rsub|t>|)>=<big|int><rsub|<wide|T|^>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>
    </equation>

    Consequently one has

    <\equation>
      <tabular|<tformat|<table|<row|<cell|X<rsub|t>>|<cell|=A<rsub|t>*<around|(|U<rsub|t>*Y<rsub|0>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|<wide|T|^>>\<varphi\><rsub|t><around|(|\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|<wide|T|^>>e<rsup|i*t*v>*E*<around|(|d*v|)>*Y<rsub|0>>>|<row|<cell|>|<cell|=<big|int><rsub|<wide|T|^>>e<rsup|i*t*\<lambda\>>*\<varphi\><rsub|t><around|(|\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>*Y<rsub|0>>>|<row|<cell|>|<cell|=<big|int><rsub|<wide|T|^>>e<rsup|i*t*\<lambda\>>*\<varphi\><rsub|t><around|(|\<lambda\>|)>*Z*<around|(|d*\<lambda\>|)>>>>>><tabular|<tformat|<table|<row|<cell|>>>>>
    </equation>

    If we set\ 

    <\equation>
      g<rsub|t><rprime|'><around|(|\<lambda\>|)>=e<rsup|i*t*\<lambda\>>*\<varphi\><rsub|t><around|(|\<lambda\>|)>
    </equation>

    and

    <\equation>
      \<mu\><around|(|B|)>=<around|(|E<around|(|B|)>*Y<rsub|0>,E<around|(|B|)>*Y<rsub|0>|)>
    </equation>

    then the above stated properties imply that
    <math|g<rsub|t><rprime|'>\<in\>L<rsup|2><around|(|<wide|T|^>,B,\<mu\>|)>>,
    so that the process <math|<around|{|X<rsub|t>,t\<in\>T|}>> is of Karhunen
    class.

    For the last part since each weakly harmonizable process is of Karhunen
    class, it admits the representation (21), but now with special properties
    for <math|<around|{|A<rsub|t>,t\<in\>T|}>>. Let\ 

    <\equation>
      Q<rsub|t>=A<rsub|t>*U<rsub|t>
    </equation>

    Then by a known result (cf. [11], p. 330),
    <math|<around|{|Q<rsub|t>,t\<in\>T|}>> must be positive definite, weakly
    continuous and contractive. Since <math|<around|{|U<rsub|t>,t\<in\>T|}>>
    is a unitary group which is weakly continuous, it follows that
    <math|<around|{|A<rsub|t>,t\<in\>T|}>> must also be contractive and
    weakly continuous. To see that it is also positive definite, let
    <math|<around|{|h<rsub|1>,\<ldots\>,h<rsub|n>|}>\<subset\>\<cal-H\><around|(|X|)>>
    be an arbitrary set and <math|t<rsub|1>,\<ldots\>,t<rsub|n>> be any
    points of the additive group <math|T,n\<geq\>1>. Then letting\ 

    <\equation>
      v<rsub|i>=U<rsub|t<rsub|i>><rsup|\<ast\>>*h<rsub|i>\<in\>\<cal-H\><around|(|X|)>
    </equation>

    , we have

    <\equation>
      <tabular|<tformat|<table|<row|<cell|0>|<cell|\<leqslant\><big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|n><around|(|Q<rsub|t<rsub|i>-t<rsub|j>>*v<rsub|i>,v<rsub|j>|)>>|<cell|since
      Q<rsub|t><text|is> positive definite>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|n><around|(|A<rsub|t<rsub|i>-t<rsub|j>>*U<rsub|t<rsub|i>><rsup|\<ast\>>*h<rsub|i>,U<rsub|t<rsub|j>><rsup|\<ast\>>*h<rsub|j>|)>>|<cell|>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|n><around|(|U<rsub|t<rsub|i>><rsup|\<ast\>>*A<rsub|t<rsub|i>-t<rsub|j>>*h<rsub|i>,U<rsub|t<rsub|j>><rsup|\<ast\>>*h<rsub|j>|)>>|<cell|<text|since
      >U<rsub|t><rsup|\<ast\>>*<text|and >A<rsub|s>*<text|also commute as do
      >U<rsub|t>*<text|and >U<rsub|s>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|n><big|sum><rsub|j=1><rsup|n><around|(|A<rsub|t<rsub|i>-t<rsub|j>>*h<rsub|i>,h<rsub|j>|)>>|<cell|>>>>>
    </equation>

    This establishes the asserted property of the
    <math|<around|{|A<rsub|t>,t\<in\>T|}>>. Note that from the fact [11] that
    <math|Q<rsub|0>> on <math|\<cal-H\><around|(|X|)>> is also identity, we
    obtain that <math|A<rsub|0>*U<rsub|0>=A<rsub|0>> is identity as well.

    In the opposite direction the result depends on an important theorem of
    Grothendieck. If <math|A<rsub|t>:\<cal-K\>\<to\>\<cal-H\><around|(|X|)>>
    has the stated properties, then <math|Q<rsub|t>=A<rsub|t>*U<rsub|t>> is
    positive definite and satisfies the hypothesis of the converse part of
    ([11], p. 330). Hence a process defined by (21) is weakly harmonizable.
    This finishes the essential details of all the assertions.
  </proof>

  <with|font-series|bold|Remarks:> 1. As mentioned before, the first part in
  an equivalent form is already given in [9], and the last part in [11]. Both
  results obviously depend on some deep facts in abstract analysis. The
  simple Proposition 5 is used in an essential way in obtaining the
  representation (21) which thus gives an operator representation of Karhunen
  processes indexed by <math|T>. The same result extends if <math|T> is
  replaced by a locally compact abelian group when
  <math|\<cal-H\><around|(|X|)>> is assumed separable in addition.

  2. If in (4) we set <math|s=t>, then

  <\equation>
    <math-up|var>X<rsub|t>=r<around|(|t,t|)>=<big|int><rsub|\<bbb-R\>><around|\||a<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*F*<around|(|d*\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>\<mu\><rsub|t>*<around|(|d*\<lambda\>|)>
  </equation>

  where\ 

  <\equation>
    \<mu\><rsub|t><around|(|A|)>=<big|int><rsub|A><around|\||a<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*F*<around|(|d*\<lambda\>|)>
  </equation>

  \ (taking <math|T=\<bbb-R\>> for simplicity). This function, depending on
  <math|t>, is termed an \Pevolving spectrum\Q in time, by Priestley [10].
  Since

  <\equation>
    g<rsub|t><around|(|\<lambda\>|)>=e<rsup|i*t*\<lambda\>>*a<rsub|t><around|(|\<lambda\>|)>
  </equation>

  \ can be oscillatory for each <math|t>, the process <math|X<rsub|t>> which
  necessarily has the representation (cf. [2], p. 55):

  <\equation>
    X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*a<rsub|t><around|(|\<lambda\>|)>*Z*<around|(|d*\<lambda\>|)>\<forall\><space|1em>t\<in\>\<bbb-R\>
  </equation>

  is termed an oscillatory process. In [10], the <math|a<rsub|t>>-family is
  normalized so that <math|a<rsub|0><around|(|\<lambda\>|)>=1,<text|all
  >\<lambda\>>, based on some natural reasons motivated by applications. (It
  was further assumed that <math|a<rsub|t><around|(|\<cdummy\>|)>> is the
  Fourier transform of some <math|H<rsub|\<lambda\>><around|(|\<cdummy\>|)>>
  of bounded variation such that <math|<around|\||H<rsub|\<lambda\>><around|(|0|)>|\|>>
  has a maximum.) The point of (29) is that <math|Z<around|(|\<cdummy\>|)>>
  has orthogonal values and the form suggests a parallel development of the
  ideas (and interpretations) of the global stationary theory, locally at
  <math|t> if <math|a<rsub|t><around|(|\<cdummy\>|)>> is slowly varying. In
  any case, for the general representation theory one need not place these
  restrictions, but the specializations can be useful in estimation and
  inference theory itself, as indicated in [10].

  3. As Proposition 5 also implies, the representation (21) of a Karhunen
  process is not unique. The preceding sections show that several other
  (series type) representations are possible.

  <section|Spectral Support Sets>

  Finally we consider briefly the support sets of spectral bimeasure
  functions of the (subclass) periodically correlated weakly harmonizable
  processes. Also as implied by Proposition 1, a clear distinction emerges
  between the continuous and discrete parameter cases. This may be
  anticipated from the work of [3] and [4].

  The result to be given here is a generalization of one for the strongly
  harmonizable case found in [6]. First we need to state the concept of
  \Psupport\Q precisely. A set <math|S<rsub|\<beta\>>\<subset\>\<bbb-R\>\<times\>\<bbb-R\>>
  is called the <with|font-shape|italic|support> of a bimeasure
  <math|\<beta\>>, if it consists of points
  <math|<around|(|x,y|)>\<in\>\<bbb-R\>\<times\>\<bbb-R\>> such that for each
  neighborhood where

  <\equation>
    \<mu\><rsub|t><around|(|A|)>=<big|int><rsub|A><around|\||a<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*F*<around|(|d*\<lambda\>|)>
  </equation>

  \ (taking <math|T=\<bbb-R\>> for simplicity). This function, depending on
  <math|t>, is termed an \Pevolving spectrum\Q in time, by Priestley [10].
  Since <math|g<rsub|t><around|(|\<lambda\>|)>=e<rsup|i*t*\<lambda\>>*a<rsub|t><around|(|\<lambda\>|)>>
  can be oscillatory for each <math|t>, the process <math|X<rsub|t>> which
  necessarily has the representation (cf. [2], p. 55):

  <\equation>
    X<rsub|t>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*a<rsub|t><around|(|\<lambda\>|)>*Z*<around|(|d*\<lambda\>|)>\<forall\>t\<in\>\<bbb-R\>
  </equation>

  is termed an oscillatory process. In [10], the <math|a<rsub|t>>-family is
  normalized so that <math|a<rsub|0><around|(|\<lambda\>|)>=1,<text|all
  >\<lambda\>>, based on some natural reasons motivated by applications. (It
  was further assumed that <math|a<rsub|t><around|(|\<cdummy\>|)>> is the
  Fourier transform of some <math|H<rsub|\<lambda\>><around|(|\<cdummy\>|)>>
  of bounded variation such that <math|<around|\||H<rsub|\<lambda\>><around|(|0|)>|\|>>
  has a maximum.) The point of (29) is that <math|Z<around|(|\<cdummy\>|)>>
  has orthogonal values and the form suggests a parallel development of the
  ideas (and interpretations) of the global stationary theory, locally at
  <math|t> if <math|a<rsub|t><around|(|\<cdummy\>|)>> is slowly varying. In
  any case, for the general representation theory one need not place these
  restrictions, but the specializations can be useful in estimation and
  inference theory itself, as indicated in [10].

  3. As Proposition 5 also implies, the representation (21) of a Karhunen
  process is not unique. The preceding sections show that several other
  (series type) representations are possible.

  <section*|References>

  1. S. Cambanis and B. Liu, \POn harmonizable stochastic processes,\Q
  <with|font-shape|italic|Information and Control> 17(1970), 183\U202.

  2. D. K. Chang and M. M. Rao, \PBimeasures and nonstationary processes,\Q
  in: <with|font-shape|italic|Real and Stochastic Analysis>, Wiley, New York,
  1986, 7\U118.

  3. E. G. Gladyshev, \PPeriodically correlated random sequences,\Q
  <with|font-shape|italic|Soviet Math.> 2(1962), 385\U388.

  4. E. G. Gladyshev, \PPeriodically and almost-periodically correlated
  random processes with continuous time parameter,\Q
  <with|font-shape|italic|Theor. Prob. and Appl.> 8(1963), 173\U177.

  5. U. Grenander, <with|font-shape|italic|Abstract Inference>, Wiley, New
  York, 1981.

  6. H. L. Hurd, \PRepresentation of harmonizable periodically correlated
  processes and their covariances,\Q <with|font-shape|italic|Technical Report
  #182>, Center for Stochastic Processes, Univ. of North Carolina, Chapel
  Hill, 1987.

  7. K. Karhunen, \PÜber lineare Methoden in der
  Wahrscheinlichkeitsrechnung,\Q <with|font-shape|italic|Ann. Acad. Sci.
  Fenn. Ser AI Math.> 37(1947), 3\U79.

  8. J. P. Kelsh, <with|font-shape|italic|Linear Analysis of Harmonizable
  Time Series>, Ph.D thesis, Univ. of Calif., Riverside, 1978.
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
    <associate|auto-1|<tuple|1|1|SpectralRepresentationsOfWeaklyHarmonizableProcesses.tm>>
    <associate|auto-2|<tuple|2|3|SpectralRepresentationsOfWeaklyHarmonizableProcesses.tm>>
    <associate|auto-3|<tuple|3|4|SpectralRepresentationsOfWeaklyHarmonizableProcesses.tm>>
    <associate|auto-4|<tuple|4|8|SpectralRepresentationsOfWeaklyHarmonizableProcesses.tm>>
    <associate|auto-5|<tuple|5|10|SpectralRepresentationsOfWeaklyHarmonizableProcesses.tm>>
    <associate|auto-6|<tuple|6|14|SpectralRepresentationsOfWeaklyHarmonizableProcesses.tm>>
    <associate|auto-7|<tuple|51|15|SpectralRepresentationsOfWeaklyHarmonizableProcesses.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Factorizable
      Spectral Functions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Series
      Representations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>A
      Moving Average Representation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Operator
      Representations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Spectral
      Support Sets> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>