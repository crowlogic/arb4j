<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <doc-data|<doc-title|An Operator Characterization of Oscillatory
  Harmonizable Processes>|<doc-author|<author-data|<author-name|Randall J.
  Swift>|<\author-affiliation>
    Department of Mathematics

    Western Kentucky University, Bowling Green, Kentucky
  </author-affiliation>>>|<doc-date|>>

  <\padded-center>
    Dedicated to Professor M. M. Rao, advisor and friend, on the occasion of
    his 65th birthday.
  </padded-center>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>INTRODUCTION>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>PRELIMINARIES>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>OSCILLATORY
    HARMONIZABLE PROCESSES> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>AN
    OPERATOR CHARACTERIZATION> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|ACKNOWLEDGEMENTS>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|INTRODUCTION>

  A class of nonstationary stochastic processes which are encountered in some
  applications is the class of modulated stationary processes
  <math|X<around|(|t|)>>. These processes are obtained when a stationary
  process <math|X<rsub|0><around|(|t|)>> is multiplied by some nonrandom
  modulating function <math|A<around|(|t|)>>:

  <\equation>
    <label|eq:modulated-process>X<around|(|t|)>=A<around|(|t|)>*X<rsub|0><around|(|t|)>
  </equation>

  This class of processes has been investigated by Joyeux <cite|Joyeux1987>
  and Priestley <cite|Priestley1981>. The book by Yaglom <cite|Yaglom1987>
  provides a nice treatment of these processes. In particular, if
  <math|A<around|(|t|)>> armits a generalized Fourier transform, the class of
  oscillatory processes, studied by Priestley <cite|Priestley1981> is
  obtained. In some physical situations, the assumption of stationarity for
  the process <math|X<rsub|0><around|(|t|)>> is unrealistic <cite|Rao1982>.
  If this condition is relaxed, and <math|X<rsub|0><around|(|t|)>> is assumed
  to be harmonizable and if <math|A<around|(|t|)>> armits a generalized
  Fourier transform, the process <math|X<around|(|t|)>> is not oscillatory,
  but is oscillatory harmonizable.

  This paper investigates the properties of oscillatory harmonizable
  processes. Section<nbsp><reference|sec:preliminaries> recalls the basic
  theory of harmonizable processes required for the subsequent analysis.
  Section<nbsp><reference|sec:oscillatory-harmonizable> introduces and
  develops the class of oscillatory harmonizable processes. In this section,
  the spectral representation of oscillatory harmonizable processes is
  obtained. This representation is used to deduce relationships between the
  oscillatory harmonizable processes and other classes of nonstationary
  processes. Section<nbsp><reference|sec:operator-characterization> obtains
  an important and useful operator characterization for oscillatory
  harmonizable processes.

  <section|PRELIMINARIES><label|sec:preliminaries>

  In the following work, there is always an underlying probability space,
  <math|<around|(|\<Omega\>,\<Sigma\>,P|)>>, whether this is explicitly
  stated or not.

  <\definition>
    <label|def:lp-space>For <math|p\<geq\>1>, define
    <math|L<rsub|0><rsup|p><around|(|P|)>> to be the set of all complex
    valued <math|f\<in\>L<rsup|p><around|(|\<Omega\>,\<Sigma\>,P|)>> such
    that <math|E<around|(|f|)>=0>, where <math|E<around|(|f|)>=<big|int>f<around|(|\<omega\>|)>*d*P<around|(|\<omega\>|)>>
    is the expectation.
  </definition>

  In this paper, we will consider second order stochastic processes. More
  specifically, mappings <math|X:\<bbb-R\>\<to\>L<rsub|0><rsup|2><around|(|P|)>>.

  <\definition>
    <label|def:stationary>A stochastic process
    <math|X:\<bbb-R\>\<to\>L<rsub|0><rsup|2><around|(|P|)>> is stationary
    (stationary in the wide or Khintchine sense) if its covariance
    <math|r<around|(|s,t|)>=E*<around|(|X<around|(|s|)>\<cdot\><wide|X<around|(|t|)>|\<bar\>>|)>>
    is continuous and is a function of the difference of its arguments, so
    that

    <\equation>
      <label|eq:stationary-covariance-form>r<around|(|s,t|)>=r*<around|(|s-t|)>
    </equation>
  </definition>

  An equivalent definition of a stationary process is one whose covariance
  function can be represented as

  <\equation>
    <label|eq:stationary-covariance>r<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*F<around|(|\<lambda\>|)>
  </equation>

  for a unique non-negative bounded Borel measure
  <math|F<around|(|\<cdummy\>|)>>. This alternate definition is a consequence
  of a classical theorem of Bochner's <cite|GihmanSkorohod1974>, and
  motivates the following definition.

  <\definition>
    <label|def:weakly-harmonizable>A stochastic process
    <math|X:\<bbb-R\>\<to\>L<rsub|0><rsup|2><around|(|P|)>> is weakly
    harmonizable if its covariance <math|r<around|(|\<cdummy\>,\<cdummy\>|)>>
    is expressible as

    <\equation>
      <label|eq:harmonizable-covariance>r<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|>e<rsup|i*\<lambda\>*s-i*\<lambda\><rprime|'>*t>*<space|0.17em>d*F<around|(|\<lambda\>,\<lambda\><rprime|'>|)>
    </equation>

    where <math|F:\<bbb-R\>\<times\>\<bbb-R\>\<to\>\<bbb-C\>> is a positive
    semi-definite bimeasure, hence of finite Fréchet variation. The integrals
    in <eqref|eq:harmonizable-covariance> are strict Morse-Transue
    <cite|ChangRao1986>. A stochastic process,
    <math|X<around|(|\<cdummy\>|)>>, is strongly harmonizable if the
    bimeasure <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> in
    <eqref|eq:harmonizable-covariance> extends to a complex measure and hence
    is of bounded Vitali variation. In either case,
    <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> is termed the spectral
    bi-measure (or spectral measure) of the harmonizable process.
  </definition>

  Comparison of equation <eqref|eq:harmonizable-covariance> with equation
  <eqref|eq:stationary-covariance> shows that when
  <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> concentrates on the diagonal
  <math|\<lambda\>=\<lambda\><rprime|'>>, both the weak and strong
  harmonizability concepts reduce to the stationary concept. Harmonizable
  processes retain the powerful Fourier analytic methods inherent with
  stationary processes, as seen in Bochner's theorem,
  <eqref|eq:stationary-covariance>; but they relax the requirement of
  stationarity.

  The structure and properties of harmonizable processes has been
  investigated and developed extensively by M.M. Rao and others. The
  following sources are listed here to provide a partial summary of the
  literature. The papers by Rao <cite|Rao1978|Rao1982|Rao1989|Rao1991|Rao1994>
  provide a basis for the theory. Chang and Rao <cite|ChangRao1986> develop
  the necessary bi-measure theory. A study of sample path behavior for
  harmonizable processes is considered by Swift <cite|Swift1996b>. Some
  results on moving average representations were obtained by Mehlman
  <cite|Mehlman1992>. The structure of harmonizable isotropic random fields
  and some applications has been considered by Swift
  <cite|Swift1994|Swift1995|Swift1996a>. Second order processes with
  harmonizable increments has been investigated also by Swift
  <cite|Swift1996c>. The forthcoming book by Kakihara <cite|Kakihara> gives a
  general treatment of multidimensional second order processes which include
  the harmonizable class.

  <section|OSCILLATORY HARMONIZABLE PROCESSES><label|sec:oscillatory-harmonizable>

  M. B. Priestley <cite|Priestley1981> introduced and studied a
  generalization of the class of stationary processes. This generalization is
  given by:

  <\definition>
    <label|def:oscillatory>A stochastic process
    <math|X:\<bbb-R\>\<to\>L<rsub|0><rsup|2><around|(|P|)>> is oscillatory if
    it has representation

    <\equation>
      <label|eq:oscillatory-representation>X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|Z<around|(|\<cdummy\>|)>> is a stochastic measure with
    orthogonal increments and

    <\equation>
      <label|eq:oscillatory-modulating-function>A<around|(|t,\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*H<around|(|\<lambda\>,d*x|)>
    </equation>

    with <math|H<around|(|\<cdummy\>,B|)>> a Borel function on
    <math|\<bbb-R\>>, <math|H<around|(|\<lambda\>,\<cdot\>|)>> a signed
    measure and <math|A<around|(|t,\<lambda\>|)>> having an absolute maximum
    at <math|\<lambda\>=0> independent of <math|t>.
  </definition>

  Using this representation the covariance of an oscillatory process is

  <\equation>
    <label|eq:oscillatory-covariance>r<around|(|s,t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|s,\<lambda\>|)>*A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*<around|(|s-t|)>>*<space|0.17em>d*\<Phi\><around|(|\<lambda\>|)>
  </equation>

  The idea of definition<nbsp><reference|def:weakly-harmonizable> provides
  the motivation for the following definition.

  <\definition>
    <label|def:oscillatory-weakly-harmonizable>A stochastic process
    <math|X:\<bbb-R\>\<to\>L<rsub|0><rsup|2><around|(|P|)>> is oscillatory
    weakly harmonizable if its covariance has representation

    <\equation>
      <label|eq:oscillatory-harmonizable-covariance>r<around|(|s,t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|>A<around|(|s,\<lambda\>|)>*A<around|(|t,\<lambda\><rprime|'>|)>*e<rsup|i*\<lambda\>*s-i*\<lambda\><rprime|'>*t>*<space|0.17em>d*F<around|(|\<lambda\>,\<lambda\><rprime|'>|)>
    </equation>

    where <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> is a function of bounded
    Fréchet variation, and

    <\equation>
      A<around|(|t,\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*H<around|(|\<lambda\>,d*x|)>
    </equation>

    with <math|H<around|(|\<cdummy\>,B|)>> a Borel function on
    <math|\<bbb-R\>>, <math|H<around|(|\<lambda\>,\<cdot\>|)>> a signed
    measure and <math|A<around|(|t,\<lambda\>|)>> having an absolute maximum
    at <math|\<lambda\>=0> independent of <math|t>.
  </definition>

  Note that if <math|A<around|(|t,\<lambda\>|)>=1>, this class coincides with
  the weakly harmonizable processes. As Priestley's definition provides an
  extension to the class of stationary processes,
  definition<nbsp><reference|def:oscillatory-weakly-harmonizable> provides an
  cxtension to the class of weakly harmonizable processes.

  Observe, further, that in this definition, for
  <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> concentrating on the diagonal,
  <math|\<lambda\>=\<lambda\><rprime|'>>, the oscillatory processes are
  obtained. Thus the oscillatory harmonizable processes also provide an
  extension to the class introduced by Priestley, which we will now term
  oscillatory stationary.

  Using this definition, it is possible to obtain the spectral representation
  of an oscillatory harmonizable process <math|X<around|(|\<cdummy\>|)>>

  <\theorem>
    <label|thm:spectral-representation>The spectral representation of an
    oscillatory weakly harmonizable stochastic process is:

    <\equation>
      <label|eq:spectral-representation>X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|Z<around|(|\<cdummy\>|)>> is a stochastic measure satisfying

    <\equation>
      <label|eq:spectral-measure-property>E<around|(|Z<around|(|B<rsub|1>|)><wide|Z<around|(|B<rsub|2>|)>|\<bar\>>|)>=F<around|(|B<rsub|1>,B<rsub|2>|)>
    </equation>

    with <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> a function of bounded
    Fréchet variation.
  </theorem>

  <\proof>
    Let <math|X<around|(|\<cdummy\>|)>> be an oscillatory weakly harmonizable
    process. Then, the covariance <math|r<around|(|\<cdummy\>,\<cdummy\>|)>>
    has representation <eqref|eq:oscillatory-harmonizable-covariance>.
    Applying a form of Karhunen's theorem <cite|Yaglom1987> gives the
    spectral representation of <math|X<around|(|\<cdummy\>|)>> as
    <eqref|eq:spectral-representation>, which is the desired result.
  </proof>

  The following condition on the signed measure <math|H>, for oscillatory
  strongly harmonizable processes shows these processes are actually a
  subclass of the strongly harmonizable processes. A similar result was
  obtained by R. Joyeux <cite|Joyeux1987>, for the oscillatory stationary
  processes.

  <\theorem>
    <label|thm:strongly-harmonizable-condition>If
    <math|X<around|(|\<cdummy\>|)>> is an oscillatory strongly harmonizable
    process with

    <\equation>
      <label|eq:h-condition><big|int><rsub|\<bbb-R\>><around|\||H|\|><around|(|\<lambda\>,d*r|)>\<less\>\<infty\>
    </equation>

    uniformly in <math|\<lambda\>\<in\>\<bbb-R\>>, then
    <math|X<around|(|\<cdummy\>|)>> is strongly harmonizable.
  </theorem>

  <\proof>
    Let

    <\equation>
      <label|eq:z-tilde><wide|Z|~><around|(|A|)>=<big|int><rsub|\<bbb-R\>>H<around|(|\<lambda\>,A-\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|A> is a Borel set of <math|\<bbb-R\>> and
    <math|A-\<lambda\>=<around|{|x-\<lambda\>:x\<in\>A|}>>.
    <math|<wide|Z|~><around|(|\<cdummy\>|)>> is a stochastic measure since
    <math|H<around|(|\<lambda\>,\<cdot\>|)>> is a signed measure, and
    uniformly bounded by <math|K>.

    Now set

    <\equation>
      <label|eq:x-tilde><wide|X|~><around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*t>*<space|0.17em><wide|Z|~><around|(|d*\<omega\>|)>
    </equation>

    <with|font-series|bold|Claim:> <math|<wide|X|~><around|(|\<cdummy\>|)>>
    is a strongly harmonizable process.

    If one lets <math|<wide|F|~><around|(|A,B|)>=E<around|(|<wide|Z|~><around|(|A|)><wide|<wide|Z|~><around|(|B|)>|\<bar\>>|)>>
    for Borel sets <math|A,B> of <math|\<bbb-R\>>, it must be shown that

    <\equation>
      <label|eq:finite-variation-condition><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><around|\||<wide|F|~><around|(|d*\<omega\>,d*\<omega\><rprime|'>|)>|\|>\<less\>\<infty\>
    </equation>

    Now

    <\align>
      <tformat|<table|<row|<cell|E<around|(|<wide|Z|~><around|(|d*\<omega\>|)><wide|<wide|Z|~><around|(|d*\<omega\><rprime|'>|)>|\<bar\>>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|>H<around|(|\<lambda\>,d*<around|(|\<omega\>-\<lambda\>|)>|)><wide|H<around|(|\<lambda\><rprime|'>,d*<around|(|\<omega\><rprime|'>-\<lambda\><rprime|'>|)>|)>|\<bar\>>E*<around|(|Z*<around|(|d*\<lambda\>|)><wide|Z*<around|(|d*\<lambda\><rprime|'>|)>|\<bar\>>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|>H<around|(|\<lambda\>,d*<around|(|\<omega\>-\<lambda\>|)>|)><wide|H<around|(|\<lambda\><rprime|'>,d*<around|(|\<omega\><rprime|'>-\<lambda\><rprime|'>|)>|)>|\<bar\>>F<around|(|d*\<lambda\>,d*\<lambda\><rprime|'>|)><eq-number><label|eq:f-tilde-expression>>>>>
    </align>

    where <math|F<around|(|A,B|)>=E<around|(|Z<around|(|A|)><wide|Z<around|(|B|)>|\<bar\>>|)>>
    is of finite Vitali variation since <math|X<around|(|t|)>> is strongly
    harmonizable.

    Thus,

    <\align>
      <tformat|<cwith|1|-1|1|-1|font-base-size|9>|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><around|\||<wide|F|~><around|(|d*\<omega\>,d*\<omega\><rprime|'>|)>|\|>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><mid|\|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|>H<around|(|\<lambda\>,d*<around|(|\<omega\>-\<lambda\>|)>|)><wide|H<around|(|\<lambda\><rprime|'>,d*<around|(|\<omega\><rprime|'>-\<lambda\><rprime|'>|)>|)>|\<bar\>>F<around|(|d*\<lambda\>,d*\<lambda\><rprime|'>|)><mid|\|>>>|<row|<cell|>|<cell|\<leq\><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><around|\||H|\|><around|(|\<lambda\>,d*<around|(|\<omega\>-\<lambda\>|)>|)><around|\||H|\|><around|(|\<lambda\><rprime|'>,d*<around|(|\<omega\><rprime|'>-\<lambda\><rprime|'>|)>|)><around|\||F|\|><around|(|d*\<lambda\>,d*\<lambda\><rprime|'>|)>>>|<row|<cell|>|<cell|\<less\>\<infty\><eq-number><label|eq:finite-variation-result>>>>>
    </align>

    since <math|<big|int><around|\||H|\|><around|(|\<lambda\>,\<bbb-R\>|)>>
    is bounded, proving the claim. Now

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<wide|X|~><around|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*t>*<space|0.17em><wide|Z|~><around|(|d*\<omega\>|)><text|>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|><big|int><rsub|-\<infty\>><rsup|\<infty\>><rsub|>e<rsup|i*\<omega\>*t>*H<around|(|\<lambda\>,d*<around|(|\<omega\>-\<lambda\>|)>|)>*<space|0.17em>Z*<around|(|d*\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int>e<rsup|i*\<lambda\>*t>*A<around|(|t,\<lambda\>|)>*<space|0.17em>Z*<around|(|d*\<lambda\>|)>>>|<row|<cell|>|<cell|=X<around|(|t|)>>>>>><label|eq:x-equality>
    </equation>

    \;

    So <math|X<around|(|t|)>> is strongly harmonizable, which completes the
    proof of the theorem.
  </proof>

  An additional class of processes related to the oscillatory processes is
  given by:

  <\definition>
    <label|def:slowly-changing>An oscillatory weakly harmonizable stochastic
    process <math|X:\<bbb-R\>\<to\>L<rsub|0><rsup|2><around|(|P|)>> is
    <math|\<varepsilon\>>-slowly changing weakly harmonizable if

    <\equation>
      <label|eq:slowly-changing-condition>B<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>><around|\||x|\|><around|\||H|\|><around|(|\<lambda\>,d*x|)>\<leq\>\<varepsilon\>,<space|1em>\<lambda\>\<in\>\<bbb-R\>.
    </equation>
  </definition>

  Slowly changing stationary processes where first considered by Priestley
  <cite|Priestley1981> and are of interest not only in engineering but also
  in economics. Priestley showed that it is possible to define a spectral
  measure for these processes. The class of slowly changing harmonizable
  processes introduced above extend the class of slowly changing stationary
  processes. The following corollary shows that it is possible to consider a
  similar concept for the slowly changing harmonizable class.

  <\corollary>
    <label|cor:slowly-changing>Slowly changing strongly harmonizable
    processes form a subclass of strongly harmonizable processes.
  </corollary>

  <\proof>
    The assumption is <eqref|eq:slowly-changing-condition>.

    <with|font-series|bold|Claim:>

    <\equation>
      <label|eq:h-finite><big|int><rsub|\<bbb-R\>><around|\||H|\|><around|(|\<lambda\>,d*r|)>\<less\>\<infty\>
    </equation>

    In fact,

    <\align>
      <tformat|<table|<row|<cell|<around|\||H|\|><around|(|\<lambda\>,\<bbb-R\>|)>>|<cell|=<big|int><rsub|\<bbb-R\>><around|\||H|\|><around|(|\<lambda\>,d*r|)>>>|<row|<cell|>|<cell|=<big|int><rsub|<around|\||x|\|>\<leq\>1><around|\||H|\|><around|(|\<lambda\>,d*x|)>+<big|int><rsub|<around|\||x|\|>\<gtr\>1><around|\||H|\|><around|(|\<lambda\>,d*x|)>>>|<row|<cell|>|<cell|\<leq\>K+<big|int><rsub|<around|\||x|\|>\<gtr\>1><around|\||H|\|><around|(|\<lambda\>,d*x|)>>>|<row|<cell|>|<cell|\<leq\>K+<big|int><rsub|<around|\||x|\|>\<gtr\>1><around|\||x|\|><around|\||H|\|><around|(|\<lambda\>,d*x|)>>>|<row|<cell|>|<cell|\<leq\>K+<big|int><rsub|\<bbb-R\>><around|\||x|\|><around|\||H|\|><around|(|\<lambda\>,d*x|)>>>|<row|<cell|>|<cell|\<leq\>K+\<varepsilon\>\<less\>\<infty\><eq-number><label|eq:h-bound>>>>>
    </align>

    which is the claim. Now since <math|K> is finite, by
    Theorem<nbsp><reference|thm:strongly-harmonizable-condition>
    <math|X<around|(|t|)>> is strongly harmonizable proving the corollary.
  </proof>

  <section|AN OPERATOR CHARACTERIZATION><label|sec:operator-characterization>

  Using oscillatory harmonizable processes, it is possible to obtain a
  representation of a broader class of processes on <math|\<bbb-R\>>.

  <\definition>
    <label|def:weak-class-c>Let <math|S> be a locally compact space with
    <math|\<cal-B\><rsub|0>> as the <math|\<sigma\>>-ring generated by the
    bounded Borel sets of <math|S>. If <math|T> is any index set,
    <math|<around|{|X<around|(|t|)>,t\<in\>T|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>
    a second order process, <math|r> its covariance and
    <math|\<beta\>:\<cal-B\><rsub|0>\<times\>\<cal-B\><rsub|0>\<to\>\<bbb-C\>>,
    a bimeasure having locally bounded Fréchet variation then
    <math|X<around|(|\<cdummy\>|)>> is said to be (locally) weakly of class
    (C) when <math|\<beta\>> is positive definite and

    <\equation>
      <label|eq:class-c-covariance>r<around|(|s,t|)>=<big|iint><rsub|S\<times\>S>g<rsub|s><around|(|x|)><wide|g<rsub|t><around|(|y|)>|\<bar\>><space|0.17em>\<beta\><around|(|d*x,d*y|)><space|1em>\<forall\><around|(|s,t|)>\<in\>T\<times\>T<text|(strict
      MT-integral)>
    </equation>

    where <math|g<rsub|t>:S\<to\>\<bbb-C\>,t\<in\>T> a family of Borel
    functions for which the integral exists. If <math|\<beta\>> has locally
    finite Vitali variation, then the process is termed of class (C) relative
    to <math|<around|{|g<rsub|s>,s\<in\>T|}>> and <math|\<beta\>>.
  </definition>

  Weak class (C) processes are considered extensively in Chang and Rao
  <cite|ChangRao1986>. Oscillatory harmonizable processes affords this broad
  class of processes to have a simple representation on <math|\<bbb-R\>> as
  seen in the following:

  <\proposition>
    <label|prop:class-c>The class of oscillatory weakly harmonizable
    processes <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>\<subset\>L<rsub|0><rsup|2><around|(|P|)>>
    coincides with the class of weak class (C) processes indexed on
    <math|\<bbb-R\>>.
  </proposition>

  <\proof>
    This follows by setting <math|g<rsub|s><around|(|\<lambda\>|)>=e<rsup|i*\<lambda\>*s>*A<around|(|s,\<lambda\>|)>>
    in definition<nbsp><reference|def:weak-class-c> since
    <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> always has finite Fréchet
    variation.
  </proof>

  Using this simple identification, an operator representation of weak class
  (C) processes indexed on <math|\<bbb-R\>> is possible. This result is an
  extension of that given in Chang and Rao <cite|ChangRao1988> for the
  oscillatory stationary class.

  <\theorem>
    <label|thm:operator-characterization><math|X<around|(|\<cdummy\>|)>> is
    an oscillatory weakly harmonizable process iff it is representable as

    <\equation>
      <label|eq:operator-representation>X<around|(|t|)>=a<around|(|t|)>*T<around|(|t|)>*Y<around|(|0|)><space|1em>\<forall\>t\<in\>\<bbb-R\>,
    </equation>

    where <math|Y<rsub|0>=Y<around|(|0|)>> is some point in

    <\equation>
      <label|eq:hilbert-space>H<around|(|X|)>=<text|sp><around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>
    </equation>

    with <math|a<around|(|t|)>> a densely defined closed operator in
    <math|H<around|(|X|)>> for each <math|t\<in\>\<bbb-R\>> and
    <math|<around|{|T<around|(|s|)>,s\<in\>\<bbb-R\>|}>> a weakly continuous
    family of positive definite contractive operators in
    <math|H<around|(|X|)>> which commutes with each
    <math|a<around|(|t|)>,t\<in\>\<bbb-R\>>.
  </theorem>

  <\proof>
    Suppose <math|X<around|(|t|)>> is oscillatory weakly harmonizable. Then

    <\equation>
      <label|eq:x-spectral>X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|Z<around|(|\<cdummy\>|)>> is a stochastic measure satisfying
    <math|E<around|(|Z<around|(|B<rsub|1>|)><wide|Z<around|(|B<rsub|2>|)>|\<bar\>>|)>=F<around|(|B<rsub|1>,B<rsub|2>|)>>
    with <math|F<around|(|\<cdummy\>,\<cdummy\>|)>> of bounded Fréchet
    variation.

    Let

    <\equation>
      <label|eq:y-process>Y<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    Then <math|Y<around|(|\<cdummy\>|)>> is weakly harmonizable.

    Now by a theorem of Rao <cite|Rao1982> there is a weakly continuous
    family of positive definite contractive operators
    <math|<around|{|T<around|(|t|)>,t\<in\>\<bbb-R\>|}>> on
    <math|H<around|(|X|)>=<text|sp><around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>>
    so that

    <\equation>
      <label|eq:y-representation>Y<around|(|t|)>=T<around|(|t|)>*Y<rsub|0>
    </equation>

    Using the spectral theorem for this family of operators (cf. Rao
    <cite|Rao1982>),

    <\equation>
      <label|eq:spectral-theorem>T<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*E*<around|(|d*\<lambda\>|)>,<space|1em>t\<in\>\<bbb-R\>
    </equation>

    where <math|<around|{|E|(>\<cdot\>),\<cal-B\>}> is the resolution of the
    identity of <math|<around|{|T<around|(|t|)>,t\<in\>\<bbb-R\>|}>> with
    <math|\<cal-B\>> as the Borel <math|\<sigma\>>-algebra of
    <math|\<bbb-R\>>. So

    <\equation>
      <label|eq:z-relation>Z<around|(|\<Lambda\>|)>=E<around|(|\<Lambda\>|)>*Y<rsub|0>,<space|1em>\<Lambda\>\<in\>\<cal-B\>.
    </equation>

    Now define

    <\equation>
      <label|eq:operator-a>a<around|(|t|)>=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>,<space|1em>t\<in\>\<bbb-R\>.
    </equation>

    It follows that <math|a<around|(|t|)>> is closed and densely defined on
    <math|H<around|(|Y|)>> with its domain containing
    <math|<around|{|Y<around|(|s|)>,s\<in\>\<bbb-R\>|}>>. Now since
    <math|T<around|(|t|)>> and <math|E<around|(|D|)>> commute for all
    <math|t> and <math|D>, then <math|a<around|(|t|)>> and
    <math|<around|{|E<around|(|D|)>,D\<in\>\<cal-B\>|}>> commute so that
    <math|a<around|(|t|)>> and <math|<around|{|T<around|(|s|)>,s\<in\>\<bbb-R\>|}>>
    commute for each <math|t>.

    Thus

    <\align>
      <tformat|<table|<row|<cell|X<around|(|t|)>>|<cell|=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*E*<around|(|d*\<lambda\>|)>*Y<rsub|0>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>A<around|(|t,\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*t>*E*<around|(|d*\<omega\>|)>*Y<rsub|0>>>|<row|<cell|>|<cell|=a<around|(|t|)>*T<around|(|t|)>*Y<rsub|0>>>|<row|<cell|>|<cell|=a<around|(|t|)>*T<around|(|t|)>*Y<around|(|0|)><eq-number><label|eq:final-representation>>>>>
    </align>

    where <eqref|eq:final-representation> follows since

    <\equation>
      E<around|(|D|)>*<big|int>e<rsup|i*\<omega\>*t>*Y<rsub|0>=<big|int><rsub|D>e<rsup|i*\<omega\>*t>*E*<around|(|d*\<omega\>|)>*Y<rsub|0>,D\<in\>\<cal-B\>
    </equation>

    Thus if <math|X<around|(|t|)>> is oscillatory weakly harmonizable, then
    <math|X<around|(|t|)>=a<around|(|t|)>*T<around|(|t|)>*Y<around|(|0|)>>
    where <math|Y<rsub|0>=Y<around|(|0|)>> is some point in
    <math|H<around|(|X|)>=<text|sp><around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>>,
    <math|a<around|(|t|)>> is a densely defined closed operator in
    <math|H<around|(|X|)>> for each <math|t\<in\>\<bbb-R\>> and
    <math|<around|{|T<around|(|s|)>,s\<in\>\<bbb-R\>|}>> is a weakly
    continuous family of positive definite contractive operators in
    <math|H<around|(|X|)>> which commutes with each
    <math|a<around|(|t|)>,t\<in\>\<bbb-R\>>.

    Now suppose <math|X<around|(|t|)>> can be represented as
    <math|X<around|(|t|)>=a<around|(|t|)>*T<around|(|t|)>*Y<around|(|0|)>>
    with <math|a<around|(|t|)>>, <math|T<around|(|t|)>>, and
    <math|Y<around|(|0|)>> as stated in the theorem. Then, using a classical
    result of von Neumann and F. Riesz <cite|RieszNagy1990>,
    <math|a<around|(|t|)>> is a function <math|g<around|(|t,\<cdot\>|)>> of
    <math|T<around|(|t|)>> and further

    <\equation>
      <label|eq:operator-a-function>a<around|(|t|)>=g<around|(|t,T<around|(|t|)>|)>=<big|int><rsub|\<bbb-R\>>g<around|(|t,\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>
    </equation>

    Thus

    <\align>
      <tformat|<table|<row|<cell|X<around|(|t|)>>|<cell|=a<around|(|t|)>*T<around|(|t|)>*Y<around|(|0|)>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>g<around|(|t,\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>*<big|int><rsub|\<bbb-R\>>e<rsup|i*\<omega\>*t>*E*<around|(|d*\<omega\>|)>*Y<rsub|0>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>g<around|(|t,\<lambda\>|)>*E*<around|(|d*\<lambda\>|)>*Y<rsub|0>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>g<around|(|t,\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number><label|eq:final-g
      representation>>>>>
    </align>

    but this is the representation of an oscillatory weakly harmonizable
    process.
  </proof>

  <section*|ACKNOWLEDGEMENTS>

  The author expresses his thanks to Professor M. M. Rao for his advice and
  encouragement during the work of this project. The author also expresses
  his gratitude to the Mathematics department at Western Kentucky University
  for release time during the Spring 1995 semester, during which this work
  was completed.

  <\thebibliography|19>
    <bibitem|ChangRao1986>D. K. Chang and M. M. Rao,
    <with|font-shape|italic|Bimeasures and Nonstationary Processes>, in Real
    and Stochastic Analysis, John Wiley and Sons, New York, 1986, p.<nbsp>7.

    <bibitem|ChangRao1988>D. K. Chang and M. M. Rao,
    <with|font-shape|italic|Special Representations of Weakly Harmonizable
    Processes>, Stochastic Analysis and Applications, 6(2):169, 1988.

    <bibitem|GihmanSkorohod1974>I. I. Gihman and A. V. Skorohod,
    <with|font-shape|italic|The Theory of Stochastic Processes I>,
    Springer-Verlag, New York, 1974.

    <bibitem|Joyeux1987>R. Joyeux, <with|font-shape|italic|Slowly Changing
    Processes and Harmonizability>, Journal of Time Series Analysis, 8,
    No.<nbsp>4, 1987.

    <bibitem|Kakihara>Y. Kakihara, <with|font-shape|italic|Multidimensional
    Second Order Stochastic Processes>, World Scientific, In preparation.

    <bibitem|Mehlman1992>M. H. Mehlman, <with|font-shape|italic|Prediction
    and Fundamental Moving Averages for Discrete Multidimensional
    Harmonizable Processes>, Journal of Multivariate Analysis, 43,
    No.<nbsp>1, 1992.

    <bibitem|Priestley1981>M. B. Priestley, <with|font-shape|italic|Spectral
    Analysis and Time Series>, Vol.<nbsp>1 and 2, Academic Press, London,
    1981.

    <bibitem|Rao1978>M. M. Rao, <with|font-shape|italic|Covariance Analysis
    of Non Stationary Time Series>, Developments in Statistics, 1,
    p.<nbsp>171, 1978.

    <bibitem|Rao1982>M. M. Rao, <with|font-shape|italic|Harmonizable
    Processes: Structure Theory>, L'Enseignement Mathématique, 28,
    p.<nbsp>295, 1982.

    <bibitem|Rao1989>M. M. Rao, <with|font-shape|italic|Harmonizable Signal
    Extraction, Filtering and Sampling>, in Topics in Non-Gaussian Signal
    Processing, (E. J. Wegman, S. C. Schwartz, J. B. Thomas, eds.),
    Springer-Verlag, New York, 1989.

    <bibitem|Rao1991>M. M. Rao, <with|font-shape|italic|Sampling and
    Prediction for Harmonizable Isotropic Random Fields>, Journal of
    Combinatorics, Information and System Sciences, 16, No.<nbsp>2-3,
    p.<nbsp>207, 1991.

    <bibitem|Rao1994>M. M. Rao, <with|font-shape|italic|Harmonizable
    processes and inference: unbiased prediction for stochastic flows>,
    Journal of Statistical Planning and Inference, 39, p.<nbsp>187, 1994.

    <bibitem|RieszNagy1990>F. Riesz and B. Sz-Nagy,
    <with|font-shape|italic|Functional Analysis>, Dover, New York, 1990.

    <bibitem|Swift1994>R. Swift, <with|font-shape|italic|The Structure of
    Harmonizable Isotropic Random Fields>, Stochastic Analysis and
    Applications, 12, No.<nbsp>5, p.<nbsp>583, 1994.

    <bibitem|Swift1995>R. Swift, <with|font-shape|italic|Representation and
    Prediction for Locally Harmonizable Isotropic Random Fields>, Journal of
    Applied Mathematics and Stochastic Analysis, VIII, p.<nbsp>101, 1995.

    <bibitem|Swift1996a>R. Swift, <with|font-shape|italic|A Class of
    Harmonizable Isotropic Random Fields>, Journal of Combinatorics,
    Information and System Sciences, (to appear), 1996.

    <bibitem|Swift1996b>R. Swift, <with|font-shape|italic|Almost Periodic
    Harmonizable Processes>, Georgian Mathematical Journal, (to appear),
    1996.

    <bibitem|Swift1996c>R. Swift, <with|font-shape|italic|Stochastic
    Processes with Harmonizable Increments>, Journal of Combinatorics,
    Information and System Sciences, (to appear), 1996.

    <bibitem|Yaglom1987>A. M. Yaglom, <with|font-shape|italic|Correlation
    Theory of Stationary and Related Random Functions>, Vol.<nbsp>1 and 2,
    Springer-Verlag, New York, 1987.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-2|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-3|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-4|<tuple|4|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-5|<tuple|34|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-6|<tuple|34|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-ChangRao1986|<tuple|ChangRao1986|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-ChangRao1988|<tuple|ChangRao1988|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-GihmanSkorohod1974|<tuple|GihmanSkorohod1974|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Joyeux1987|<tuple|Joyeux1987|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Kakihara|<tuple|Kakihara|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Mehlman1992|<tuple|Mehlman1992|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Priestley1981|<tuple|Priestley1981|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Rao1978|<tuple|Rao1978|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Rao1982|<tuple|Rao1982|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Rao1989|<tuple|Rao1989|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Rao1991|<tuple|Rao1991|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Rao1994|<tuple|Rao1994|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-RieszNagy1990|<tuple|RieszNagy1990|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Swift1994|<tuple|Swift1994|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Swift1995|<tuple|Swift1995|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Swift1996a|<tuple|Swift1996a|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Swift1996b|<tuple|Swift1996b|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Swift1996c|<tuple|Swift1996c|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Yaglom1987|<tuple|Yaglom1987|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|cor:slowly-changing|<tuple|9|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|def:lp-space|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|def:oscillatory|<tuple|4|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|def:oscillatory-weakly-harmonizable|<tuple|5|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|def:slowly-changing|<tuple|8|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|def:stationary|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|def:weak-class-c|<tuple|10|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|def:weakly-harmonizable|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:class-c-covariance|<tuple|22|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:f-tilde-expression|<tuple|16|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:final-g representation|<tuple|34|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:final-representation|<tuple|31|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:finite-variation-condition|<tuple|15|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:finite-variation-result|<tuple|17|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:h-bound|<tuple|21|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:h-condition|<tuple|12|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:h-finite|<tuple|20|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:harmonizable-covariance|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:hilbert-space|<tuple|24|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:modulated-process|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:operator-a|<tuple|30|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:operator-a-function|<tuple|33|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:operator-representation|<tuple|23|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:oscillatory-covariance|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:oscillatory-harmonizable-covariance|<tuple|8|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:oscillatory-modulating-function|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:oscillatory-representation|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:slowly-changing-condition|<tuple|19|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:spectral-measure-property|<tuple|11|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:spectral-representation|<tuple|10|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:spectral-theorem|<tuple|28|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:stationary-covariance|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:stationary-covariance-form|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:x-equality|<tuple|18|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:x-spectral|<tuple|25|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:x-tilde|<tuple|14|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:y-process|<tuple|26|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:y-representation|<tuple|27|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:z-relation|<tuple|29|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:z-tilde|<tuple|13|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|prop:class-c|<tuple|11|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|sec:operator-characterization|<tuple|4|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|sec:oscillatory-harmonizable|<tuple|3|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|sec:preliminaries|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|thm:operator-characterization|<tuple|12|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|thm:spectral-representation|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|thm:strongly-harmonizable-condition|<tuple|7|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Joyeux1987

      Priestley1981

      Yaglom1987

      Priestley1981

      Rao1982

      GihmanSkorohod1974

      ChangRao1986

      Rao1978

      Rao1982

      Rao1989

      Rao1991

      Rao1994

      ChangRao1986

      Swift1996b

      Mehlman1992

      Swift1994

      Swift1995

      Swift1996a

      Swift1996c

      Kakihara

      Priestley1981

      Yaglom1987

      Joyeux1987

      Priestley1981

      ChangRao1986

      ChangRao1988

      Rao1982

      Rao1982

      RieszNagy1990
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>INTRODUCTION>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>PRELIMINARIES>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>OSCILLATORY
      HARMONIZABLE PROCESSES> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>AN
      OPERATOR CHARACTERIZATION> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|ACKNOWLEDGEMENTS>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>