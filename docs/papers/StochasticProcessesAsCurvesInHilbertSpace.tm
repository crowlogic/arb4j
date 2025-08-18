<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|STOCHASTIC PROCESSES AS CURVES IN HILBERT
  SPACE>|<doc-author|<author-data|<author-name|HARALD CRAMÉR>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Basic
    Definitions and Auxiliary Concepts> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Projection
    Operators and Spectral Families> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Distribution
    Functions and Equivalence Classes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Spectral
    Multiplicity Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Prediction
    Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7<space|2spc>Correlation
    Function and Spectral Type> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|8<space|2spc>Existence
    of Processes with Given Spectral Type>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction><label|sec:intro>

  In this paper the theory of spectral multiplicity in a separable Hilbert
  space will be applied to the study of stochastic processes
  <math|x<around|(|t|)>>, where <math|x<around|(|t|)>> is a complex-valued
  random variable with a finite second-order moment, while the parameter
  <math|t> may take any real values.

  For an account of multiplicity theory one may refer to Chapter 7 of Stone's
  book <cite|linearHilbertSpaceTransforms> which deals with the case of a
  separable space. The treatment of the subject found e.g. in the books by
  Halmos <cite|halmosHilbertSpaceSpectralMultiplicity> and Nakano
  <cite|nakanoSpectralTheory> is mainly concerned with the more general and
  considerably more intricate case of a non-separable space.

  The considerations will apply to certain classes of curves in a purely
  abstract Hilbert space, and it is only a question of terminology when,
  throughout this paper, the discussion confines itself to that particular
  realization of Hilbert space which has proved useful in probability theory.

  It is finally observed that all statements may be directly generalized to
  the case of vector processes of the form
  <math|<around|(|x<rsub|1><around|(|t|)>,\<ldots\>,x<rsub|k><around|(|t|)>|)>>.

  <section|Basic Definitions and Auxiliary Concepts><label|sec:basic>

  In Sections <reference|sec:basic>\U<reference|sec:distributions> some basic
  definitions and some auxiliary concepts will now be introduced.

  Consider the set of all complex-valued random variables <math|x> defined on
  a fixed probability space and satisfying the relations

  <\equation>
    <label|eq:finite_moment>E<around|{|<around|\||x|\|><rsup|2>|}>\<less\>\<infty\>
  </equation>

  Two variables <math|x> and <math|y> will be regarded as identical if

  <\equation>
    <label|eq:identical>E<around|{|<around|\||x-y|\|><rsup|2>|}>=0
  </equation>

  The set of all these variables forms a Hilbert space <math|H>, if the inner
  product is defined in the usual way:

  <\equation>
    <label|eq:inner_product><around|(|x,y|)>=E*<around|{|x*<wide|y|\<bar\>>|}>
  </equation>

  Convergence of sequences of random variables will always be understood as
  strong convergence in the topology thus introduced, i.e. as convergence in
  quadratic mean according to probability terminology.

  If for every real <math|t> a random variable <math|x<around|(|t|)>\<in\>H>
  is given, the set of variables <math|x<around|(|t|)>> may be regarded as a
  stochastic process with continuous time <math|t>, or, alternatively, as a
  curve <math|C> in the Hilbert space <math|H>. It is well known that various
  properties of stochastic processes have been studied by regarding them as
  curves in <math|H> (cf., e.g., <cite|kolmogorovInvariantCurves>,
  <cite|kolmogorovWienerSpiral>, <cite|neumannSchoenbergFourierIntegrals>,
  <cite|pinskerCurvesStationaryIncrements>,
  <cite|cramerStochasticProcessTheoryContribution>,
  <cite|cramerNonStationaryProcesses>).

  The subspaces of <math|H> associated with the <math|x<around|(|t|)>> curve
  or process are defined by writing

  <\align>
    <tformat|<table|<row|<cell|H<around|(|x|)>>|<cell|=S<around|{|x<around|(|u|)>,-\<infty\>\<less\>u\<less\>\<infty\>|}><eq-number><label|eq:subspaces>>>|<row|<cell|H<around|(|x,t|)>>|<cell|=S<around|{|x<around|(|u|)>,u\<leq\>t|}><eq-number>>>|<row|<cell|H<around|(|x,-\<infty\>|)>>|<cell|=<big|cap><rsub|t>H<around|(|x,t|)><eq-number>>>>>
  </align>

  Here <math|S<around|{|\<cdummy\>|}>> denotes the subspace of <math|H>
  spanned by the random variables indicated between the brackets.

  Evidently <math|H<around|(|x|)>> is the smallest subspace of <math|H> which
  contains the whole curve <math|C> generated by the <math|x<around|(|t|)>>
  process, while <math|H<around|(|x,t|)>> is the smallest subspace containing
  the \Parc\Q of <math|C> formed by all points <math|x<around|(|u|)>> with
  <math|u\<leq\>t>. If the parameter <math|t> is interpreted as time,
  <math|H<around|(|x,t|)>> will represent the \Ppast and present\Q of the
  <math|x<around|(|t|)>> process from the point of view of the instant
  <math|t>, while <math|H<around|(|x,-\<infty\>|)>> represents the
  \Pinfinitely remote past\Q of the process.

  For the processes <math|y<around|(|t|)>>, <math|z<around|(|t|)>>,
  <math|\<ldots\>> analogous notations <math|H<around|(|y,t|)>>,
  <math|H<around|(|z,t|)>>, <math|\<ldots\>> are used for subspaces defined
  in the corresponding way.

  In the sequel only stochastic processes <math|x<around|(|t|)>\<in\>H> which
  are assumed to satisfy the following conditions (A) and (B) will be
  considered:

  <\enumerate>
    <item>The subspace <math|H<around|(|x,-\<infty\>|)>> contains only the
    zero element of <math|H>.

    <item>For all <math|t> the limits <math|x*<around|(|t+0|)>> exist and
    <math|x*<around|(|t-0|)>=x<around|(|t|)>>.
  </enumerate>

  The condition (A) implies that <math|x<around|(|t|)>> is a regular, or
  purely non-deterministic process (cf. <cite|cramerPurelyNonDeterministicProcesses>).
  From (B) it follows, as shown in <cite|cramerPurelyNonDeterministicProcesses>,
  that the space <math|H<around|(|x|)>> is separable, and that the
  <math|x<around|(|t|)>> curve has at most an enumerable number of
  discontinuities. The condition <math|x*<around|(|t-0|)>=x<around|(|t|)>> is
  not essential, and is introduced here only in order to avoid some trivial
  complications.

  As <math|t> increases through real values, the subspaces
  <math|H<around|(|x,t|)>> will obviously form a never decreasing family. For
  a fixed finite <math|t> the union of all <math|H<around|(|x,u|)>> with
  <math|u\<less\>t> may not be a closed set, but if
  <math|H<around|(|x,t-0|)>> is defined as the closure of this union, it is
  easily proved that <math|H<around|(|x,t-0|)>=H<around|(|x,t|)>> always
  holds. Similarly, the union of the <math|H<around|(|x,u|)>> for all real
  <math|u> may not be closed, but if <math|H<around|(|x,+\<infty\>|)>> is
  defined as its closure, then <math|H<around|(|x,+\<infty\>|)>=H<around|(|x|)>>.

  Suppose that a certain time point <math|t> is such that for all
  <math|h\<gtr\>0>

  <\equation>
    <label|eq:innovation_condition>H<around|(|x,t-h|)>\<neq\>H<around|(|x,t+h|)>
  </equation>

  Every time interval <math|t-h\<less\>u\<less\>t+h> will then contain at
  least one <math|x<around|(|u|)>> not included in
  <math|H<around|(|x,t-h|)>>. This may be expressed by saying that the
  process receives a new impulse, or an innovation, during the interval
  <math|<around|(|t-h,t+h|)>> for every <math|h\<gtr\>0>. The set of all time
  points <math|t> with this property will be called the innovation spectrum
  of the <math|x<around|(|t|)>> process.

  <section|Projection Operators and Spectral Families><label|sec:projection>

  Suppose that a stochastic process <math|x<around|(|t|)>> satisfying the
  conditions (A) and (B) is given. By <math|P<rsub|t>> the projection
  operator in the Hilbert space <math|H<around|(|x|)>> with range
  <math|H<around|(|x,t|)>> is denoted. It then follows from the properties of
  the <math|H<around|(|x,t|)>> family given above that

  <\align>
    <tformat|<table|<row|<cell|P<rsub|t>>|<cell|\<leq\>P<rsub|u>*<space|1em><text|for
    >t\<less\>u<eq-number><label|eq:projection_properties>>>|<row|<cell|P<rsub|t-0>>|<cell|=P<rsub|t>*<space|1em><text|for
    all >t<eq-number>>>|<row|<cell|P<rsub|-\<infty\>>>|<cell|=0,<space|1em>P<rsub|+\<infty\>>=I<eq-number>>>>>
  </align>

  where <math|0> and <math|I> denote respectively the zero and the identity
  operator in <math|H<around|(|x|)>>.

  It follows that the <math|P<rsub|t>> form a spectral family of projections
  or a resolution of the identity according to Hilbert space terminology. As
  seen, the projections <math|P<rsub|t>> are, for all real <math|t>, uniquely
  determined by the given <math|x<around|(|t|)>> process.

  The properties of the <math|P<rsub|t>> family will be discussed further in
  Section <reference|sec:multiplicity>.

  For any random variable <math|z\<in\>H<around|(|x|)>> with
  <math|E<around|{|<around|\||z|\|><rsup|2>|}>\<less\>\<infty\>> a stochastic
  process is now defined by writing

  <\equation>
    <label|eq:partial_innovation>z<around|(|t|)>=P<rsub|t>*z
  </equation>

  It is then readily seen that <math|z<around|(|t|)>> will be a process with
  orthogonal increments satisfying (A) and (B). Writing

  <\equation>
    <label|eq:distribution_function>F<rsub|z><around|(|t|)>=E<around|{|<around|\||z<around|(|t|)>|\|><rsup|2>|}>
  </equation>

  it follows that <math|F<rsub|z><around|(|t|)>> is, for any fixed <math|z>,
  a distribution function of <math|t> such that
  <math|F<rsub|z>*<around|(|t-0|)>=F<rsub|z><around|(|t|)>> for all <math|t>.

  The points of increase of <math|z<around|(|t|)>> coincide with the points
  of increase of <math|F<rsub|z><around|(|t|)>> and form a subset of the
  innovation spectrum of <math|x<around|(|t|)>>, and, accordingly,
  <math|z<around|(|t|)>> is denoted as a partial innovation process
  associated with <math|x<around|(|t|)>>. The space <math|H<around|(|z,t|)>>
  is spanned by the random variables <math|z<around|(|u|)>> with
  <math|u\<leq\>t>, and it is known (cf., e.g.,
  <cite|doobStochasticProcesses>, p. 425\U428) that <math|H<around|(|z,t|)>>
  is identical with the set of all random variables of the form

  <\equation>
    <label|eq:integral_representation><big|int><rsub|-\<infty\>><rsup|t>g<around|(|t,u|)>*d*z<around|(|u|)>
  </equation>

  where <math|g<around|(|t,u|)>> is a non-random function such that the
  integral

  <\equation>
    <label|eq:convergence_integral><big|int><rsub|-\<infty\>><rsup|t><around|\||g<around|(|t,u|)>|\|><rsup|2>*d*F<rsub|z><around|(|u|)>
  </equation>

  is convergent.

  <section|Distribution Functions and Equivalence
  Classes><label|sec:distributions>

  Consider now the class <math|\<Omega\>> of all distribution functions
  <math|F<around|(|t|)>> determined such as to be continuous to the left for
  all <math|t>. A partial ordering in <math|\<Omega\>> is introduced by
  saying that <math|F<rsub|1>> is superior to <math|F<rsub|2>>, and writing
  <math|F<rsub|1>\<succeq\>F<rsub|2>>, whenever <math|F<rsub|2>> is
  absolutely continuous with respect to <math|F<rsub|1>>. If
  <math|F<rsub|1>\<succeq\>F<rsub|2>> and
  <math|F<rsub|2>\<succeq\>F<rsub|1>>, then <math|F<rsub|1>> and
  <math|F<rsub|2>> are said to be equivalent.

  The set of all distribution functions equivalent to a given
  <math|F<around|(|t|)>> forms an equivalence class <math|R>. A partial
  ordering is introduced in the set of all equivalence classes in the obvious
  way by writing <math|R<rsub|1>\<succeq\>R<rsub|2>> when the corresponding
  relation holds for any <math|F<rsub|1>\<in\>R<rsub|1>> and
  <math|F<rsub|2>\<in\>R<rsub|2>>. A point <math|t> is called a point of
  increase for the equivalence class <math|R> whenever <math|t> is a point of
  increase for any <math|F\<in\>R>.

  In the sequel sequences of never increasing equivalence classes will be
  considered:

  <\equation>
    <label|eq:sequence_classes>R<rsub|1>\<succeq\>R<rsub|2>\<succeq\>\<cdots\>\<succeq\>R<rsub|N>
  </equation>

  The number <math|N> of elements in a sequence of this form, which may be
  finite or infinite, will be called the total multiplicity of the sequence.
  A multiplicity function <math|N<around|(|t|)>> of the sequence
  <eqref|eq:sequence_classes> is also defined by writing for any real
  <math|t>

  <\equation>
    <label|eq:multiplicity_function>N<around|(|t|)>=<text|the number of those
    >R<rsub|n>*<text|in <eqref|eq:sequence_classes> for which >t<text|is a
    point of increase>
  </equation>

  <math|N<around|(|t|)>>, like <math|N>, may be finite or infinite, and the
  total multiplicity <math|N> will obviously satisfy the relation

  <\equation>
    <label|eq:total_multiplicity>N=sup<rsub|t> N<around|(|t|)>
  </equation>

  where <math|t> runs through all real values.

  If, in particular, <math|N<around|(|t|)>=0> for all <math|t> in some closed
  interval <math|<around|[|a,b|]>>, all functions <math|F<around|(|t|)>>
  belonging to any of the equivalence classes in the sequence
  <eqref|eq:sequence_classes> will be constant throughout
  <math|<around|[|a,b|]>>.

  <section|Spectral Multiplicity Theory><label|sec:multiplicity>

  To any <math|x<around|(|t|)>> satisfying the conditions (A) and (B) there
  corresponds according to Section <reference|sec:projection> a uniquely
  determined spectral family of projections <math|P<rsub|t>> satisfying
  <eqref|eq:projection_properties>. It then follows from the theory of
  spectral multiplicity in a separable Hilbert space
  (<cite|linearHilbertSpaceTransforms>, Chapter 7) that to the same
  <math|x<around|(|t|)>> there corresponds a uniquely determined, never
  increasing sequence <eqref|eq:sequence_classes> of equivalence classes,
  having the following properties:

  If <math|N> is the total multiplicity of the sequence
  <eqref|eq:sequence_classes>, it is possible to find <math|N> orthonormal
  random variables <math|z<rsub|1>,\<ldots\>,z<rsub|N>\<in\>H<around|(|x|)>>
  such that the corresponding processes with orthogonal increments defined in
  Section <reference|sec:projection> satisfy the relations

  <\align>
    <tformat|<table|<row|<cell|F<rsub|z<rsub|n>><around|(|t|)>>|<cell|\<in\>R<rsub|n><eq-number><label|eq:orthonormal_properties>>>|<row|<cell|H<around|(|z<rsub|m>,t|)>>|<cell|\<perp\>H<around|(|z<rsub|n>,t|)>,<space|1em>m\<neq\>n<eq-number>>>|<row|<cell|H<around|(|x,t|)>>|<cell|=<big|sum><rsub|n=1><rsup|N>H<around|(|z<rsub|n>,t|)><eq-number>>>>>
  </align>

  where the last sum denotes the vector sum of the mutually orthogonal
  subspaces involved.

  Now <math|x<around|(|t|)>> is always an element of <math|H<around|(|x,t|)>>
  and from Section <reference|sec:projection> the following theorem is
  obtained, previously given in somewhat less precise form in
  <cite|cramerStochasticProcessTheoryContribution> and
  <cite|cramerPurelyNonDeterministicProcesses>.

  <\theorem>
    <label|thm:representation>To any stochastic process
    <math|x<around|(|t|)>> satisfying (A) and (B) there corresponds a
    uniquely determined sequence <eqref|eq:sequence_classes> of equivalence
    classes such that <math|x<around|(|t|)>> can be represented in the form

    <\equation>
      <label|eq:main_representation>x<around|(|t|)>=<big|sum><rsub|n=1><rsup|N><big|int><rsub|-\<infty\>><rsup|t>g<rsub|n><around|(|t,u|)>*d*z<rsub|n><around|(|u|)>
    </equation>

    where the <math|z<rsub|n><around|(|u|)>> are mutually orthogonal
    processes with orthogonal increments satisfying
    <eqref|eq:orthonormal_properties>. The <math|g<rsub|n><around|(|t,u|)>>
    are non-random functions such that

    <\equation>
      <label|eq:convergence_condition><big|sum><rsub|n=1><rsup|N><big|int><rsub|-\<infty\>><rsup|t><around|\||g<rsub|n><around|(|t,u|)>|\|><rsup|2>*d*F<rsub|z<rsub|n>><around|(|u|)>\<less\>\<infty\>
    </equation>

    The number <math|N>, which is called the total spectral multiplicity of
    the <math|x<around|(|t|)>> process, is the uniquely determined number of
    elements in <eqref|eq:sequence_classes> and may be finite or infinite. No
    representation of the form <eqref|eq:main_representation> with these
    properties exists for any smaller value of <math|N>.
  </theorem>

  The sequence <eqref|eq:sequence_classes> corresponding to a given
  <math|x<around|(|t|)>> process will be said to determine the spectral type
  of the process.

  The relation <eqref|eq:main_representation> gives a linear representation
  of <math|x<around|(|t|)>> in terms of past and present innovation elements
  <math|d*z<rsub|n><around|(|u|)>>. The total innovation process associated
  with <math|x<around|(|t|)>> is an <math|N>-dimensional vector process
  <math|<around|{|z<rsub|1><around|(|t|)>,\<ldots\>,z<rsub|N><around|(|t|)>|}>>
  where, as before, <math|N> may be finite or infinite.

  It is interesting to compare this with the situation in the case of a
  regular process with discrete time (<cite|cramerStochasticProcessTheoryContribution>,
  Theorem 1) where a similar representation always holds with <math|N=1>.

  Also in the particular case of a stationary process with continuous time,
  satisfying (A) and (B), it follows from well-known theorems that
  <math|N=N<around|(|t|)>=1> for all <math|t>, and that the only element in
  the corresponding sequence <eqref|eq:sequence_classes> may be represented
  by any absolutely continuous distribution function <math|F<around|(|t|)>>
  having an everywhere positive density function.

  <section|Prediction Theory><label|sec:prediction>

  The best linear least squares prediction of <math|x*<around|(|t+h|)>> in
  terms of all <math|x<around|(|u|)>> with <math|u\<leq\>t> is obtained from
  <eqref|eq:main_representation> in the form

  <\equation>
    <label|eq:prediction>P<rsub|t>*x*<around|(|t+h|)>=<big|sum><rsub|n=1><rsup|N><big|int><rsub|-\<infty\>><rsup|t>g<rsub|n><around|(|t+h,u|)>*d*z<rsub|n><around|(|u|)>
  </equation>

  The error involved in this prediction is

  <\equation>
    <label|eq:prediction_error>x*<around|(|t+h|)>-P<rsub|t>*x*<around|(|t+h|)>=<big|sum><rsub|n=1><rsup|N><big|int><rsub|t><rsup|t+h>g<rsub|n><around|(|t+h,u|)>*d*z<rsub|n><around|(|u|)>
  </equation>

  Now consider the multiplicity function <math|N<around|(|t|)>> associated
  with the sequence <eqref|eq:sequence_classes>, as defined in Section
  <reference|sec:distributions>. Suppose that in the closed interval
  <math|t\<leq\>u\<leq\>t+h> the condition
  <math|N<around|(|u|)>\<leq\>N<rsub|1>\<less\>N> holds. Then all terms with
  <math|n\<gtr\>N<rsub|1>> in the second member of
  <eqref|eq:prediction_error> will reduce to zero, so that the innovation
  entering into the process during <math|<around|[|t,t+h|]>> will only be of
  dimensionality <math|N<rsub|1>>. Speaking somewhat loosely, it may be said
  that the multiplicity function <math|N<around|(|t|)>> determines for every
  <math|t> the dimensionality of the innovation element
  <math|<around|{|d*z<rsub|1><around|(|t|)>,\<ldots\>|}>>.

  If, in particular, <math|N<around|(|u|)>=0> for <math|t\<leq\>u\<leq\>t+h>,
  it follows that the process does not receive any innovation at all during
  this interval. Accordingly in this case the whole second member of
  <eqref|eq:prediction_error> reduces to zero, so that exact prediction is
  possible over the interval considered.

  <section|Correlation Function and Spectral Type><label|sec:correlation>

  The correlation function of the <math|x<around|(|t|)>> process is now
  introduced:

  <\equation>
    <label|eq:correlation_function>r<around|(|s,t|)>=E<around|{|x<around|(|s|)><wide|x<around|(|t|)>|\<bar\>>|}>
  </equation>

  As before all stochastic processes considered are assumed to satisfy the
  conditions (A) and (B). The following theorem, which shows that the
  spectral type of a process is uniquely determined by the correlation
  function, will now be proved.

  <\theorem>
    <label|thm:correlation_uniqueness>Let <math|x<around|(|t|)>> and
    <math|y<around|(|t|)>> be two processes satisfying (A) and (B) and having
    the same correlation function <math|r<around|(|s,t|)>>. The sequences of
    equivalence classes, which correspond to <math|x<around|(|t|)>> and
    <math|y<around|(|t|)>> in the way described in Theorem
    <reference|thm:representation>, are then identical.
  </theorem>

  <\proof>
    <math|x<around|(|t|)>> and <math|y<around|(|t|)>> define two curves
    situated, respectively, in the spaces <math|H<around|(|x|)>> and
    <math|H<around|(|y|)>>. A transformation <math|V> from the <math|x>-curve
    to the <math|y>-curve is now defined by writing

    <\equation>
      <label|eq:transformation>V*x<around|(|t|)>=y<around|(|t|)>
    </equation>

    and this definition is extended by linearity to the linear manifold in
    <math|H<around|(|x|)>> determined by all points <math|x<around|(|t|)>>.
    It is readily seen that this definition is unique, and that the
    transformation is isometric. It follows, in fact, from the equality of
    the correlation functions that any linear relation
    <math|<big|sum>\<alpha\><rsub|k>*x<around|(|t<rsub|k>|)>=0> implies and
    is implied by the corresponding relation
    <math|<big|sum>\<alpha\><rsub|k>*y<around|(|t<rsub|k>|)>=0>, which shows
    that the transformation is unique, while the isometry follows from the
    identity

    <\equation>
      <label|eq:isometry>r<around|(|s,t|)>=<around|(|x<around|(|s|)>,x<around|(|t|)>|)>=<around|(|V*x<around|(|s|)>,V*x<around|(|t|)>|)>
    </equation>

    The transformation can now be extended to an isometric transformation
    <math|V> defined in the whole space <math|H<around|(|x|)>>. If the
    restriction of <math|V> to <math|H<around|(|x,t|)>> is considered, it is
    immediately seen that

    <\equation>
      <label|eq:subspace_transformation>V*H<around|(|x,t|)>=H<around|(|y,t|)>
    </equation>

    for all <math|t>.

    Denoting by <math|P<rsub|t><rsup|<around|(|x|)>>> and
    <math|P<rsub|t><rsup|<around|(|y|)>>> the spectral families of
    projections corresponding, respectively, to <math|x<around|(|t|)>> and
    <math|y<around|(|t|)>>, then

    <\equation>
      <label|eq:projection_equivalence>V*P<rsub|t><rsup|<around|(|x|)>>*V<rsup|-1>=P<rsub|t><rsup|<around|(|y|)>>
    </equation>

    Thus the two spectral families are isometrically equivalent, and the
    assertion of the theorem now follows directly from Hilbert space theory.
    In the particular case when <math|H<around|(|x|)>=H<around|(|y|)>>, the
    transformation <math|V> will be unitary.
  </proof>

  On the other hand, two processes with isometrically equivalent spectral
  families do not necessarily have the same correlation function. In other
  words, the correlation function is not uniquely determined by the spectral
  type.

  In order to see this, it is enough to consider the two processes
  <math|x<around|(|t|)>> and <math|y<around|(|t|)>=f<around|(|t|)>*x<around|(|t|)>>,
  where <math|f<around|(|t|)>> is a non-random function such that
  <math|0\<less\>m\<leq\><around|\||f<around|(|t|)>|\|>\<leq\>M> for all
  <math|t>. It is clear that <math|H<around|(|x,t|)>=H<around|(|y,t|)>> for
  all <math|t>, while the correlation functions differ by the factor
  <math|f<around|(|s|)><wide|f<around|(|t|)>|\<bar\>>>.

  <section|Existence of Processes with Given Spectral
  Type><label|sec:existence>

  In this section it will be shown that a stochastic process possessing any
  given spectral type can always be found. The more precise statement
  contained in the following theorem will even be proved.

  <\theorem>
    <label|thm:existence>Suppose that a sequence of equivalence classes of
    the form <eqref|eq:sequence_classes> is given. Then there exists a
    harmonizable process <math|x<around|(|t|)>> which has the spectral type
    defined by the given sequence.
  </theorem>

  Comparing this statement with the final remark in Section
  <reference|sec:multiplicity>, it will be seen how restricted the class of
  stationary processes is in comparison with the class of harmonizable
  processes.

  <\proof>
    In order to prove the theorem a sequence of disjoint sets
    <math|A<rsub|1>,A<rsub|2>,\<ldots\>> of real points is denoted such that
    the measure of every <math|A<rsub|n>> is positive in any non-vanishing
    interval.<footnote|The use of the sets <math|A<rsub|n>> for the
    construction of processes with given multiplicity properties goes back to
    a correspondence between Professor Kolmogorov and the present author (cf.
    <cite|cramerOrthogonalDecompositions>). A simple way of constructing the
    <math|A<rsub|n>> is the following: Let
    <math|1\<less\>n<rsub|1>\<less\>n<rsub|2>\<less\>\<cdots\>> be positive
    integers such that <math|<big|sum>1/n<rsub|p>> converges. Almost every
    real <math|x> then has a unique expansion
    <math|x=r<rsub|0>+<big|sum>r<rsub|p>/n<rsub|1>*\<cdots\>*n<rsub|p>>,
    where the <math|r<rsub|p>> are integers and
    <math|0\<leq\>r<rsub|k>\<less\>n<rsub|k>> for <math|k\<geq\>1>. If
    <math|A<rsub|n>> is the set of those <math|x> for which the number of
    zeros among the <math|r<rsub|k>> with <math|k\<geq\>1> is finite and of
    the form <math|2<rsup|p>*<around|(|2*q+1|)>> where <math|p> is a
    non-negative integer, then the sequence
    <math|A<rsub|1>,A<rsub|2>,\<ldots\>> has the required properties.> If
    <math|\<alpha\><rsub|n><around|(|v|)>> is the characteristic function of
    <math|A<rsub|n>> then

    <\equation>
      <label|eq:characteristic_property><big|int><rsub|a><rsup|b>\<alpha\><rsub|n><around|(|v|)>*d*v\<gtr\>0
    </equation>

    for all <math|n> and for any real <math|a\<less\>b>.

    In each equivalence class <math|R<rsub|n>> appearing in the given
    sequence <eqref|eq:sequence_classes> a distribution function
    <math|F<rsub|n><around|(|t|)>\<in\>R<rsub|n>> is further taken. Obviously
    the functions <math|F<rsub|1>,\<ldots\>,F<rsub|N>> can be chosen so that
    the integrals

    <\equation>
      <label|eq:moment_convergence>k<rsub|n>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|t<rsup|2>>*d*F<rsub|n><around|(|t|)>
    </equation>

    converge for all <math|n>. Then <math|1\<leq\>k<rsub|n>\<less\>\<infty\>>.
    Assuming that the basic probability field is not too restricted, <math|N>
    mutually orthogonal stochastic processes
    <math|z<rsub|1><around|(|t|)>,\<ldots\>,z<rsub|N><around|(|t|)>> with
    orthogonal increments can then be found such that

    <\equation>
      <label|eq:process_properties>F<rsub|z<rsub|n>><around|(|t|)>=E<around|{|<around|\||z<rsub|n><around|(|t|)>|\|><rsup|2>|}>=F<rsub|n><around|(|t|)>
    </equation>

    The following definition is now introduced:

    <\equation>
      <label|eq:kernel_definition>g<rsub|n><around|(|t,u|)>=<choice|<tformat|<table|<row|<cell|<frac|1|n*k<rsub|n>>*<big|int><rsub|0><rsup|t-u>e<rsup|-v<rsup|2>>*<around|(|t-u-v|)>*\<alpha\><rsub|n><around|(|v|)>*d*v,>|<cell|u\<less\>t>>|<row|<cell|0,>|<cell|u\<geq\>t>>>>>
    </equation>

    and

    <\align>
      <tformat|<table|<row|<cell|x<rsub|n><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|t>g<rsub|n><around|(|t,u|)>*d*z<rsub|n><around|(|u|)><eq-number><label|eq:process_construction>>>|<row|<cell|x<around|(|t|)>>|<cell|=<big|sum><rsub|n=1><rsup|N>x<rsub|n><around|(|t|)><eq-number>>>>>
    </align>

    For <math|u\<less\>t> the inequality

    <\equation>
      <label|eq:kernel_bound>0\<less\>g<rsub|n><around|(|t,u|)>\<less\><frac|1|n*k<rsub|n>>*e<rsup|-<around|(|t-u|)><rsup|2>>
    </equation>

    holds, and hence by <eqref|eq:moment_convergence>,

    <\align>
      <tformat|<table|<row|<cell|E<around|{|<around|\||x<rsub|n><around|(|t|)>|\|><rsup|2>|}>>|<cell|\<less\><frac|1|n<rsup|2>*k<rsub|n><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-2*<around|(|t-u|)><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|(|t+<around|\||u|\|>|)><rsup|4>*d*F<rsub|n><around|(|u|)><eq-number>>>|<row|<cell|>|<cell|\<leq\><frac|8|n<rsup|2>*k<rsub|n><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-2*<around|(|t-u|)><rsup|2>>*<around|(|t+<around|\||u|\|>|)><rsup|4>*d*F<rsub|n><around|(|u|)>\<leq\><frac|8*<around|(|t+k<rsub|n>|)><rsup|4>|n<rsup|2>*k<rsub|n><rsup|2>><eq-number>>>>>
    </align>

    so that the series for <math|x<around|(|t|)>> converges in quadratic mean
    if <math|N=\<infty\>>. (Note that the <math|x<rsub|n><around|(|t|)>>,
    like the <math|z<rsub|n><around|(|t|)>>, are mutually orthogonal.)

    It will now be proved a) that the <math|x<around|(|t|)>> process defined
    by <eqref|eq:process_construction> has the given spectral type, and b)
    that it is harmonizable.

    It follows from the construction of the <math|z<rsub|n><around|(|t|)>>
    and from <eqref|eq:process_construction> that

    <\align>
      <tformat|<table|<row|<cell|F<rsub|z<rsub|n>><around|(|t|)>>|<cell|\<in\>R<rsub|n><eq-number><label|eq:constructed_properties>>>|<row|<cell|H<around|(|z<rsub|m>,t|)>>|<cell|\<perp\>H<around|(|z<rsub|n>,t|)>,<space|1em>m\<neq\>n<eq-number>>>|<row|<cell|H<around|(|x,t|)>>|<cell|\<subseteq\><big|sum><rsub|n=1><rsup|N>H<around|(|z<rsub|n>,t|)><eq-number>>>>>
    </align>

    If it can be shown that the sign of equality holds in the last relation,
    the relations <eqref|eq:orthonormal_properties> will be satisfied and it
    then follows that the <math|x<around|(|t|)>> process defined by
    <eqref|eq:process_construction> has the given spectral type. In order to
    prove this it is sufficient to show that

    <\equation>
      <label|eq:inclusion_proof>z<rsub|n><around|(|t|)>\<in\>H<around|(|x,t|)>
    </equation>

    for all <math|n> and <math|t>.

    The equality

    <\equation>
      <label|eq:exponential_derivative>e<rsup|t<rsup|2>>*x<around|(|t|)>=<big|sum><rsub|n=1><rsup|N><frac|1|n*k<rsub|n>>*<big|int><rsub|-\<infty\>><rsup|t>e<rsup|u<rsup|2>>*<around|(|t-u|)>*\<alpha\><rsub|n><around|(|u|)>*d*z<rsub|n><around|(|u|)>
    </equation>

    holds.

    It is shown without difficulty that the derivative in q.m. of this random
    function exists for all <math|t> and has the expression

    <\equation>
      <label|eq:first_derivative><frac|d|d*t>*<around|(|e<rsup|t<rsup|2>>*x<around|(|t|)>|)>=<big|sum><rsub|n=1><rsup|N><frac|1|n*k<rsub|n>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<alpha\><rsub|n><around|(|u|)>*z<rsub|n><around|(|u|)>*d*u
    </equation>

    where the last sum converges in q.m. It is now desired to show that for
    almost all <math|t> (Lebesgue measure) differentiation once more in q.m.
    is possible, and so obtain

    <\equation>
      <label|eq:second_derivative><frac|d<rsup|2>|d*t<rsup|2>>*<around|(|e<rsup|t<rsup|2>>*x<around|(|t|)>|)>=<big|sum><rsub|n=1><rsup|N><frac|1|n*k<rsub|n>>*\<alpha\><rsub|n><around|(|t|)>*z<rsub|n><around|(|t|)>
    </equation>

    In order to prove this it must be shown that the random variable

    <\equation>
      <label|eq:difference_expression>W=<big|sum><rsub|n=1><rsup|N><frac|1|n*k<rsub|n>*h>*<big|int><rsub|t><rsup|t+h>\<alpha\><rsub|n><around|(|u|)>*<around|(|z<rsub|n><around|(|u|)>-z<rsub|n><around|(|t|)>|)>*d*u-\<alpha\><rsub|n><around|(|t|)>*z<rsub|n><around|(|t|)>
    </equation>

    converges to zero in q.m. for almost all <math|t> as <math|h\<to\>0>. The
    expression <math|W=W<rsub|1>+W<rsub|2>>, where

    <\align>
      <tformat|<table|<row|<cell|W<rsub|1>>|<cell|=<big|sum><rsub|n=1><rsup|N><frac|1|n*k<rsub|n>*h>*<big|int><rsub|t><rsup|t+h>\<alpha\><rsub|n><around|(|u|)>*<around|(|z<rsub|n><around|(|u|)>-z<rsub|n><around|(|t|)>|)>*d*u<eq-number>>>|<row|<cell|W<rsub|2>>|<cell|=<big|sum><rsub|n=1><rsup|N><frac|1|n*k<rsub|n>*h>*\<alpha\><rsub|n><around|(|t|)>*<around*|(|<big|int><rsub|t><rsup|t+h>\<alpha\><rsub|n><around|(|u|)>*d*u-\<alpha\><rsub|n><around|(|t|)>|)><eq-number>>>>>
    </align>

    Now both <math|W<rsub|1>> and <math|W<rsub|2>> are sums of mutually
    orthogonal random variables and

    <\align>
      <tformat|<table|<row|<cell|E<around|\||W<rsub|1>|\|><rsup|2>>|<cell|=<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|2>*k<rsub|n><rsup|2>*h<rsup|2>>*<big|int><rsub|t><rsup|t+h><big|int><rsub|t><rsup|t+h>\<alpha\><rsub|n><around|(|u|)>*\<alpha\><rsub|n><around|(|v|)>*<around|[|F<rsub|n><around|(|min
      <around|(|u,v|)>|)>-F<rsub|n><around|(|t|)>|]>*d*u*d*v<eq-number>>>|<row|<cell|>|<cell|\<leq\><big|sum><rsub|n=1><rsup|N><frac|2|n<rsup|2>*h<rsup|2>>*<big|int><rsub|t><rsup|t+h><around|(|t+h-u|)>*<around|[|F<rsub|n><around|(|u|)>-F<rsub|n><around|(|t|)>|]>*d*u\<leq\>2*<big|sum><rsub|n=1><rsup|N><frac|F<rsub|n>*<around|(|t+h|)>-F<rsub|n><around|(|t|)>|n<rsup|2>><eq-number>>>>>
    </align>

    and

    <\equation>
      E<around|\||W<rsub|2>|\|><rsup|2>=<big|sum><rsub|n=1><rsup|N><frac|1|n<rsup|2>>*F<rsub|n><around|(|t|)>*<around*|\||<frac|1|h>*<big|int><rsub|t><rsup|t+h>\<alpha\><rsub|n><around|(|u|)>*d*u-\<alpha\><rsub|n><around|(|t|)>|\|><rsup|2>
    </equation>

    However, all the <math|F<rsub|n>> are continuous almost everywhere, and
    it follows that <math|W<rsub|1>> tends to zero in q.m. for almost all
    <math|t>. On the other hand, the metric density of any <math|A<rsub|n>>
    exists almost everywhere and is equal to
    <math|\<alpha\><rsub|n><around|(|t|)>> so that <math|W<rsub|2>> tends to
    zero in q.m. almost everywhere. Thus it has been shown that
    <eqref|eq:second_derivative> holds for almost all <math|t>.

    Let now <math|m> be a given integer, <math|1\<leq\>m\<leq\>N>. The sets
    <math|A<rsub|n>> being disjoint, it then follows from
    <eqref|eq:second_derivative> that for almost all <math|t\<in\>A<rsub|m>>

    <\equation>
      <label|eq:individual_recovery><frac|d<rsup|2>|d*t<rsup|2>>*<around|(|e<rsup|t<rsup|2>>*x<around|(|t|)>|)>=<frac|1|m*k<rsub|m>>*z<rsub|m><around|(|t|)>
    </equation>

    The first member of the last relation is evidently an element of
    <math|H<around|(|x,t|)>>, so that <math|z<rsub|m><around|(|t|)>\<in\>H<around|(|x,t|)>>
    for almost all <math|t\<in\>A<rsub|m>>. Now <math|A<rsub|m>> is of
    positive measure in every non-vanishing interval, while
    <math|z<rsub|m><around|(|t|)>> is by definition everywhere continuous to
    the left in q.m. Thus <math|z<rsub|m><around|(|t|)>\<in\>H<around|(|x,t|)>>
    for all <math|t> and all <math|m=1,\<ldots\>,N>, and according to the
    above this proves that <math|x<around|(|t|)>> has the given spectral
    type.

    In order to prove also that <math|x<around|(|t|)>> is harmonizable the
    Fourier transform <math|h<rsub|n><around|(|\<lambda\>,u|)>> of
    <math|g<rsub|n><around|(|t,u|)>> with respect to <math|t> is introduced.
    From <eqref|eq:kernel_definition> it is obtained

    <\align>
      <tformat|<table|<row|<cell|h<rsub|n><around|(|\<lambda\>,u|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-t<rsup|2>*<around|(|1+i*\<lambda\>|)>>*d*t*<big|int><rsub|0><rsup|\<infty\>>g<rsub|n><around|(|t,u|)>*e<rsup|-i*t*\<lambda\>>*d*t<eq-number>>>|<row|<cell|>|<cell|=<frac|1|n*k<rsub|n>>*<big|int><rsub|u><rsup|\<infty\>><big|int><rsub|0><rsup|t-u><around|(|t-u-v|)>*\<alpha\><rsub|n><around|(|v|)>*d*v*d*t<eq-number>>>>>
    </align>

    The double integral is absolutely convergent and

    <\equation>
      <label|eq:fourier_transform>h<rsub|n><around|(|\<lambda\>,u|)>=<frac|1|n*k<rsub|n>*<around|(|1+i*\<lambda\>|)><rsup|2>>*<big|int><rsub|u><rsup|\<infty\>>\<alpha\><rsub|n><around|(|v|)>*e<rsup|-v*<around|(|1+i*\<lambda\>|)>>*d*v
    </equation>

    <\equation>
      <label|eq:fourier_bound><around|\||h<rsub|n><around|(|\<lambda\>,u|)>|\|>\<less\><frac|e<rsup|-u>|n*k<rsub|n>*<around|(|1+\<lambda\><rsup|2>|)>>
    </equation>

    Thus <math|h<rsub|n><around|(|\<lambda\>,u|)>> is, for any fixed
    <math|u>, absolutely integrable with respect to <math|\<lambda\>>. On the
    other hand, it follows from <eqref|eq:kernel_definition> that
    <math|g<rsub|n><around|(|t,u|)>> is everywhere continuous, so that the
    inverse Fourier formula

    <\equation>
      <label|eq:inverse_fourier>g<rsub|n><around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|n><around|(|\<lambda\>,u|)>*e<rsup|i*t*\<lambda\>>*d*\<lambda\>
    </equation>

    holds.

    Now the correlation functions of <math|x<rsub|n><around|(|t|)>> and
    <math|x<around|(|t|)>> are, by <eqref|eq:kernel_definition> and
    <eqref|eq:process_construction>,

    <\align>
      <tformat|<table|<row|<cell|\<nu\><rsub|n><around|(|s,t|)>>|<cell|=E<around|{|x<rsub|n><around|(|s|)><wide|x<rsub|n><around|(|t|)>|\<bar\>>|}>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<rsub|n><around|(|s,u|)>*g<rsub|n><around|(|t,u|)>*d*F<rsub|n><around|(|u|)><eq-number>>>|<row|<cell|\<nu\><around|(|s,t|)>>|<cell|=E<around|{|x<around|(|s|)><wide|x<around|(|t|)>|\<bar\>>|}>=<big|sum><rsub|n=1><rsup|N>\<nu\><rsub|n><around|(|s,t|)><eq-number>>>>>
    </align>

    Replacing the <math|g<rsub|n>> by their expressions according to
    <eqref|eq:inverse_fourier> it is obtained

    <\equation>
      \<nu\><rsub|n><around|(|s,t|)>=<frac|1|<around|(|2*\<pi\>|)><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|s*\<lambda\>-t*\<mu\>|)>>*d*\<lambda\>*d*\<mu\>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|n><around|(|\<lambda\>,u|)><wide|h<rsub|n><around|(|\<mu\>,u|)>|\<bar\>>d*F<rsub|n><around|(|u|)>
    </equation>

    the inversion of the order of integration being justified by absolute
    convergence according to <eqref|eq:moment_convergence> and
    <eqref|eq:fourier_bound>.

    If

    <\align>
      <tformat|<table|<row|<cell|C<rsub|n><around|(|\<lambda\>,\<mu\>|)>>|<cell|=<frac|1|<around|(|2*\<pi\>|)><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|n><around|(|\<lambda\>,u|)><wide|h<rsub|n><around|(|\<mu\>,u|)>|\<bar\>>d*F<rsub|n><around|(|u|)><eq-number>>>|<row|<cell|c<rsub|n><around|(|\<lambda\>,\<mu\>|)>>|<cell|=<big|int><rsub|-\<lambda\>><rsup|\<lambda\>><big|int><rsub|-\<mu\>><rsup|\<mu\>>C<rsub|n><around|(|\<rho\>,\<sigma\>|)>*d*\<rho\>*d*\<sigma\><eq-number>>>>>
    </align>

    are written, it follows from well-known criteria (cf., e.g.,
    <cite|loeveProbabilityTheory>, p. 466\U469) that
    <math|C<rsub|n><around|(|\<lambda\>,\<mu\>|)>> is a correlation function.
    Further <math|C<rsub|n><around|(|\<lambda\>,\<mu\>|)>> is of bounded
    variation over the whole <math|<around|(|\<lambda\>,\<mu\>|)>>-plane, its
    variation being bounded by the expression

    <\align>
      <tformat|<table|<row|<cell|>|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||C<rsub|n><around|(|\<lambda\>,\<mu\>|)>|\|>*d*\<lambda\>*d*\<mu\><eq-number>>>|<row|<cell|>|<cell|\<less\><frac|1|\<pi\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|d*\<lambda\>|1+\<lambda\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|d*\<mu\>|1+\<mu\><rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-2<around|\||u|\|>>*d*F<rsub|n><around|(|u|)><eq-number>>>|<row|<cell|>|<cell|\<less\><frac|1|4*n<rsup|2>*k<rsub|n><rsup|2>><eq-number>>>>>
    </align>

    obtained from <eqref|eq:moment_convergence> and <eqref|eq:fourier_bound>.

    It now follows that

    <\align>
      <tformat|<table|<row|<cell|\<nu\><rsub|n><around|(|s,t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|s*\<lambda\>-t*\<mu\>|)>>*d*\<lambda\>*d*\<mu\>*C<rsub|n><around|(|\<lambda\>,\<mu\>|)><eq-number>>>|<row|<cell|\<nu\><around|(|s,t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|s*\<lambda\>-t*\<mu\>|)>>*d*\<lambda\>*d*\<mu\>*C<around|(|\<lambda\>,\<mu\>|)><eq-number>>>>>
    </align>

    where

    <\equation>
      C<around|(|\<lambda\>,\<mu\>|)>=<big|sum><rsub|n=1><rsup|N>C<rsub|n><around|(|\<lambda\>,\<mu\>|)>
    </equation>

    is a correlation function which, according to the above, is of bounded
    variation over the whole <math|<around|(|\<lambda\>,\<mu\>|)>>-plane.
    Hence it may be concluded (cf. <cite|cramerStochasticProcessTheoryContribution>,
    and <cite|loeveProbabilityTheory>, p. 476) that <math|x<around|(|t|)>> is
    a harmonizable process

    <\equation>
      <label|eq:harmonizable_representation>x<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*d*y<around|(|\<lambda\>|)>
    </equation>

    where <math|y<around|(|\<lambda\>|)>> has the correlation function
    <math|C<around|(|\<lambda\>,\<mu\>|)>>. Note that <math|x<around|(|t|)>>
    is a regular process and is everywhere continuous in quadratic mean. The
    proof is completed.
  </proof>

  <\bibliography|bib|tm-plain|../refs>
    <\bib-list|13>
      <bibitem*|1><label|bib-cramerNonStationaryProcesses>H.<nbsp>Cramér.
      <newblock>On some classes of non-stationary stochastic processes.
      <newblock><with|font-shape|italic|Proc. 4th Berkeley Sympos. Math.
      Statist. and Prob.>, II:57\U77, 1961.<newblock>

      <bibitem*|2><label|bib-cramerPurelyNonDeterministicProcesses>H.<nbsp>Cramér.
      <newblock>On the structure of purely non-deterministic stochastic
      processes. <newblock><with|font-shape|italic|Arkiv Math.>, 4:249\U266,
      1961.<newblock>

      <bibitem*|3><label|bib-cramerOrthogonalDecompositions>H.<nbsp>Cramér.
      <newblock>Décompositions orthogonales de certains procès stochastiques.
      <newblock><with|font-shape|italic|Ann. Fac. Sciences Clermont>,
      11:15\U21, 1962.<newblock>

      <bibitem*|4><label|bib-cramerStochasticProcessTheoryContribution>Harald
      Cramér. <newblock>A contribution to the theory of stochastic processes.
      <newblock><with|font-shape|italic|Proceedings of the Second Berkeley
      Symposium on Mathematical Statistics and Probability>, 2:329\U339,
      1951.<newblock>

      <bibitem*|5><label|bib-doobStochasticProcesses>J.<nbsp>L.<nbsp>Doob.
      <newblock><with|font-shape|italic|Stochastic Processes>.
      <newblock>Wiley, 1953.<newblock>

      <bibitem*|6><label|bib-halmosHilbertSpaceSpectralMultiplicity>P.<nbsp>R.<nbsp>Halmos.
      <newblock><with|font-shape|italic|Introduction to Hilbert Space and the
      Theory of Spectral Multiplicity>. <newblock>Chelsea, 2nd<localize|
      edition>, 1957.<newblock>

      <bibitem*|7><label|bib-kolmogorovInvariantCurves>A.<nbsp>N.<nbsp>Kolmogorov.
      <newblock>Curves in hilbert space which are invariant with respect to a
      one-parameter group of motions. <newblock><with|font-shape|italic|DAN
      SSSR>, 26:6\U9, 1940.<newblock>

      <bibitem*|8><label|bib-kolmogorovWienerSpiral>A.<nbsp>N.<nbsp>Kolmogorov.
      <newblock>Wiener's spiral and some other interesting curves in hilbert
      space. <newblock><with|font-shape|italic|DAN SSSR>, 26:115\U118,
      1940.<newblock>

      <bibitem*|9><label|bib-loeveProbabilityTheory>M.<nbsp>Loève.
      <newblock><with|font-shape|italic|Probability Theory>. <newblock>Van
      Nostrand, 3rd<localize| edition>, 1963.<newblock>

      <bibitem*|10><label|bib-nakanoSpectralTheory>H.<nbsp>Nakano.
      <newblock><with|font-shape|italic|Spectral Theory in the Hilbert
      Space>. <newblock>Jap. Soc. for the Promotion of Science,
      1953.<newblock>

      <bibitem*|11><label|bib-pinskerCurvesStationaryIncrements>M.<nbsp>S.<nbsp>Pinsker.
      <newblock>Theory of curves in hilbert space with stationary n-th
      increments. <newblock><with|font-shape|italic|Izv. AN SSSR, Ser. Mat.>,
      19:319\U344, 1955.<newblock>

      <bibitem*|12><label|bib-linearHilbertSpaceTransforms>Marshall<nbsp>Harvey
      Stone. <newblock><with|font-shape|italic|Linear Transformations in
      Hilbert Space>, <localize|volume><nbsp>XV<localize| of
      ><with|font-shape|italic|Colloquium Publications>. <newblock>American
      Mathematical Society, 501 West 116th Street, 4th Printing
      (1951)<localize| edition>, 1932.<newblock>

      <bibitem*|13><label|bib-neumannSchoenbergFourierIntegrals>J.<nbsp>von<nbsp>Neumann<localize|
      and >I.<nbsp>J.<nbsp>Schoenberg. <newblock>Fourier integrals and metric
      geometry. <newblock><with|font-shape|italic|Trans. Amer. Math. Soc.>,
      50:226\U251, 1941.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-3|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-4|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-5|<tuple|5|5|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-6|<tuple|6|6|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-7|<tuple|7|6|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-8|<tuple|8|8|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|auto-9|<tuple|69|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-cramerNonStationaryProcesses|<tuple|1|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-cramerOrthogonalDecompositions|<tuple|3|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-cramerPurelyNonDeterministicProcesses|<tuple|2|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-cramerStochasticProcessTheoryContribution|<tuple|4|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-doobStochasticProcesses|<tuple|5|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-halmosHilbertSpaceSpectralMultiplicity|<tuple|6|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-kolmogorovInvariantCurves|<tuple|7|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-kolmogorovWienerSpiral|<tuple|8|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-linearHilbertSpaceTransforms|<tuple|12|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-loeveProbabilityTheory|<tuple|9|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-nakanoSpectralTheory|<tuple|10|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-neumannSchoenbergFourierIntegrals|<tuple|13|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|bib-pinskerCurvesStationaryIncrements|<tuple|11|13|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:characteristic_property|<tuple|30|8|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:constructed_properties|<tuple|39|9|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:convergence_condition|<tuple|22|5|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:convergence_integral|<tuple|14|4|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:correlation_function|<tuple|25|6|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:difference_expression|<tuple|46|10|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:distribution_function|<tuple|12|3|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:exponential_derivative|<tuple|43|9|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:finite_moment|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:first_derivative|<tuple|44|10|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:fourier_bound|<tuple|56|11|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:fourier_transform|<tuple|55|11|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:harmonizable_representation|<tuple|69|12|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:identical|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:inclusion_proof|<tuple|42|9|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:individual_recovery|<tuple|52|11|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:inner_product|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:innovation_condition|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:integral_representation|<tuple|13|4|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:inverse_fourier|<tuple|57|11|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:isometry|<tuple|27|7|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:kernel_bound|<tuple|36|9|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:kernel_definition|<tuple|33|8|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:main_representation|<tuple|21|5|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:moment_convergence|<tuple|31|8|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:multiplicity_function|<tuple|16|4|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:orthonormal_properties|<tuple|18|5|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:partial_innovation|<tuple|11|3|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:prediction|<tuple|23|6|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:prediction_error|<tuple|24|6|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:process_construction|<tuple|34|9|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:process_properties|<tuple|32|8|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:projection_equivalence|<tuple|29|7|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:projection_properties|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:second_derivative|<tuple|45|10|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:sequence_classes|<tuple|15|4|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:subspace_transformation|<tuple|28|7|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:subspaces|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:total_multiplicity|<tuple|17|4|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|eq:transformation|<tuple|26|7|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|footnote-1|<tuple|1|8|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|footnr-1|<tuple|1|8|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|sec:basic|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|sec:correlation|<tuple|7|6|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|sec:distributions|<tuple|4|4|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|sec:existence|<tuple|8|8|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|sec:intro|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|sec:multiplicity|<tuple|5|5|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|sec:prediction|<tuple|6|6|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|sec:projection|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:correlation_uniqueness|<tuple|2|7|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:existence|<tuple|3|8|../../.TeXmacs/texts/scratch/no_name_16.tm>>
    <associate|thm:representation|<tuple|1|5|../../.TeXmacs/texts/scratch/no_name_16.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      linearHilbertSpaceTransforms

      halmosHilbertSpaceSpectralMultiplicity

      nakanoSpectralTheory

      kolmogorovInvariantCurves

      kolmogorovWienerSpiral

      neumannSchoenbergFourierIntegrals

      pinskerCurvesStationaryIncrements

      cramerStochasticProcessTheoryContribution

      cramerNonStationaryProcesses

      cramerPurelyNonDeterministicProcesses

      cramerPurelyNonDeterministicProcesses

      doobStochasticProcesses

      linearHilbertSpaceTransforms

      cramerStochasticProcessTheoryContribution

      cramerPurelyNonDeterministicProcesses

      cramerStochasticProcessTheoryContribution

      cramerOrthogonalDecompositions

      loeveProbabilityTheory

      cramerStochasticProcessTheoryContribution

      loeveProbabilityTheory
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Basic
      Definitions and Auxiliary Concepts>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Projection
      Operators and Spectral Families> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Distribution
      Functions and Equivalence Classes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Spectral
      Multiplicity Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Prediction
      Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Correlation
      Function and Spectral Type> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Existence
      of Processes with Given Spectral Type>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>