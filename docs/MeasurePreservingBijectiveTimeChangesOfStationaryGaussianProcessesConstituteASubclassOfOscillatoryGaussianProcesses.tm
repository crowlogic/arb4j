<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Measure-Preserving Bijective Time Changes of
  Stationary Gaussian Processes Constitute a Subclass of Oscillatory Gaussian
  Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<author-email|stephencrowley214@gmail.com>>>|<doc-date|August 1,
  2025>>

  <\abstract>
    This article establishes that Gaussian processes obtained through
    measure-preserving bijective unitary time transformations of stationary
    processes constitute a subclass of oscillatory processes in the sense of
    Priestley. The transformation <math|Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)>>,
    where <math|X<around|(|t|)>> represents a realization of a stationary
    Gaussian process and <math|\<theta\>> denotes a strictly increasing
    <math|C<rsup|1>> differentiable monotonic function, yields an oscillatory
    process with evolutionary power spectrum
    <math|d*F<rsub|t><around|(|\<omega\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)>>.
    An explicit unitary transformation between the input stationary process
    and the transformed oscillatory process is established on the space of
    functions square-integrable on <math|\<sigma\>>-compact sets, preserving
    local <math|L<rsup|2>>-norms and providing a complete spectral
    characterization.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Mathematical
    Background> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1<space|2spc>Function Spaces on
    <with|mode|math|\<sigma\>>-Compact Sets
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2<space|2spc>Stationary Gaussian Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <with|par-left|1tab|2.3<space|2spc>Oscillatory Processes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    <with|par-left|1tab|2.4<space|2spc>Time Scaling Functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>The
    Unitary Time-Change Transformation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <with|par-left|1tab|3.1<space|2spc>Definition of the Transformation
    Operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.2<space|2spc>Well-Definedness and Local Unitarity
    Properties <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Sample
    Path Square-Integrability> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Main
    Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <with|par-left|1tab|5.1<space|2spc>Oscillatory Representation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|5.2<space|2spc>Evolutionary Power Spectrum
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|5.3<space|2spc>Operator Conjugation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|5.4<space|2spc>Zero-Crossing Analysis
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  The theory of non-stationary stochastic processes has found applications in
  signal processing, time series analysis, and mathematical physics. Among
  the various classes of non-stationary processes, oscillatory processes as
  defined by Priestley provide an elegant framework for understanding
  time-varying spectral characteristics. This work demonstrates that a
  specific subclass of oscillatory processes can be constructed through
  measure-preserving bijective time transformations of stationary Gaussian
  processes, working within the natural framework of functions
  square-integrable on <math|\<sigma\>>-compact sets.

  The main contribution establishes a fundamental connection between
  stationary and oscillatory processes through unitary operators that
  preserve essential geometric properties while introducing controlled
  non-stationarity. This approach provides both theoretical insights and
  practical methods for generating oscillatory processes with prescribed
  spectral evolution.

  <section|Mathematical Background>

  <subsection|Function Spaces on <math|\<sigma\>>-Compact Sets>

  <\definition>
    [<math|\<sigma\>>-Compact Sets]<label|def:sigma_compact> A subset
    <math|U\<subseteq\>\<bbb-R\>> is called <math|\<sigma\>>-compact if it
    can be written as a countable union of compact sets:

    <\equation>
      U=<big|cup><rsub|n=1><rsup|\<infty\>>K<rsub|n>
    </equation>

    where each <math|K<rsub|n>\<subset\>\<bbb-R\>> is compact.
  </definition>

  <\definition>
    [Square-Integrability on <math|\<sigma\>>-Compact
    Sets]<label|def:L2_sigma_compact> The space
    <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>
    consists of measurable functions <math|f:\<bbb-R\>\<to\>\<bbb-C\>> such
    that

    <\equation>
      <big|int><rsub|U><around|\||f<around|(|x|)>|\|><rsup|2>*d*x\<less\>\<infty\>
    </equation>

    for every <math|\<sigma\>>-compact set <math|U\<subseteq\>\<bbb-R\>>.
  </definition>

  <\remark>
    <label|rem:sigma_compact_properties>Every bounded measurable set in
    <math|\<bbb-R\>> is <math|\<sigma\>>-compact. The space
    <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>
    contains functions that are square-integrable on every bounded interval,
    including functions with polynomial growth at infinity.
  </remark>

  <subsection|Stationary Gaussian Processes>

  <\definition>
    [Stationary Gaussian Process]<label|def:stationary> A real-valued process
    <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> constitutes a
    stationary Gaussian process if it admits the continuous spectral
    representation

    <\equation>
      <label|eq:stationary_rep>X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*t>*d*\<Phi\><around|(|\<omega\>|)>
    </equation>

    where <math|\<Phi\><around|(|\<omega\>|)>> represents an
    orthogonal-increment process with spectral density

    <\equation>
      E*<around|\||d*\<Phi\><around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>*d*\<omega\>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|u|)>*e<rsup|-i*\<omega\>*u>*d*u
    </equation>

    and <math|\<mu\>> denotes an absolutely continuous measure on
    <math|\<bbb-R\>>. Each realization <math|X<around|(|t|)>> belongs to
    <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </definition>

  <subsection|Oscillatory Processes>

  <\definition>
    [Oscillatory Process]<label|def:oscillatory> A complex-valued,
    second-order process <math|<around|{|Z<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>>
    is termed <em|oscillatory> if there exist

    <\enumerate>
      <item>a family of oscillatory basis functions
      <math|<around|{|\<phi\><rsub|t><around|(|\<omega\>|)>|}><rsub|t\<in\>\<bbb-R\>>>
      with

      <\equation>
        \<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*e<rsup|i*\<omega\>*u>*d*u
      </equation>

      and a corresponding family of gain functions

      <\equation>
        A<rsub|t><around|(|\<omega\>|)>=<frac|\<phi\><rsub|t><around|(|\<omega\>|)>|e<rsup|i*\<omega\>*t>>\<in\>L<rsup|2><around|(|\<mu\>|)><label|envelope>
      </equation>

      with time-dependent filter given by

      <\equation>
        h<around|(|t,u|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<lambda\>|)>*e<rsup|-i*\<lambda\>*u>*d*\<lambda\>
      </equation>

      <item>a complex orthogonal random measure
      <math|\<Phi\><around|(|\<omega\>|)>> with

      <\equation>
        E*<around|\||d*\<Phi\><around|(|\<omega\>|)>|\|><rsup|2>=d*\<mu\><around|(|\<omega\>|)>=S<around|(|\<omega\>|)>*d*\<omega\>
      </equation>
    </enumerate>

    such that

    <\equation>
      <label|eq:oscillatory_rep>

      <\aligned>
        <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>*d*\<Phi\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<around|(|t,u|)>*X<around|(|u|)>*d*u>>>>
      </aligned>
    </equation>

    where

    <\equation>
      X<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<lambda\>*t>*d*\<Phi\><around|(|\<lambda\>|)>
    </equation>

    and each realization <math|Z<around|(|t|)>> belongs to
    <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </definition>

  <subsection|Time Scaling Functions>

  <\definition>
    [Scaling Functions]<label|def:scaling> Let <math|\<cal-F\>> denote the
    set of functions <math|\<theta\>:\<bbb-R\>\<to\>\<bbb-R\>> satisfying

    <\enumerate>
      <item><math|\<theta\>> is absolutely continuous with

      <\equation>
        <wide|\<theta\>|\<dot\>><around|(|t|)>=<frac|d|d*t>*\<theta\><around|(|t|)>\<geq\>0
      </equation>

      almost everywhere and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0>
      only on sets of Lebesgue measure zero

      <item><math|\<theta\>> is strictly increasing and bijective

      <item><math|\<theta\>> maps <math|\<sigma\>>-compact sets to
      <math|\<sigma\>>-compact sets
    </enumerate>
  </definition>

  <\remark>
    <label|rem:inverse_properties>The conditions in
    Definition<nbsp><reference|def:scaling> ensure that
    <math|\<theta\><rsup|-1><around|(|s|)>> exists and is absolutely
    continuous. By the inverse function theorem for absolutely continuous
    functions,

    <\equation>
      <frac|d|d*s><around|(|\<theta\><rsup|-1>|)><around|(|s|)>=<frac|1|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>=<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)><rsup|-1>
    </equation>

    for almost all <math|s> in the range of <math|\<theta\>>. The condition
    that <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    measure zero ensures that <math|<frac|1|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    is well-defined almost everywhere. Moreover, <math|\<theta\><rsup|-1>>
    preserves the <math|\<sigma\>>-compact structure.
  </remark>

  <section|The Unitary Time-Change Transformation>

  <subsection|Definition of the Transformation Operator>

  <\definition>
    [Unitary Time-Change Operator]<label|def:unitary_op> For
    <math|\<theta\>\<in\>\<cal-F\>>, the operator
    <math|M<rsub|\<theta\>>:L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>
    is defined by

    <\equation>
      <label|eq:unitary_op><around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>
    </equation>
  </definition>

  <\definition>
    [Unitarily Time-Changed Stationary Process]<label|def:time_changed_proc>
    For <math|\<theta\>\<in\>\<cal-F\>>, applying the unitary time change
    operator <math|M<rsub|\<theta\>>> from
    Definition<nbsp><reference|def:unitary_op> to a realization of a
    stationary process <math|X<around|(|t|)>> from the ensemble
    <math|<around|{|X<around|(|t|)>|}>> defines a realization of the
    unitarily time-changed process

    <\equation>
      <label|eq:time_change>Z<around|(|t|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)><space|1em>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    where <math|Z<around|(|t|)>\<in\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </definition>

  <\definition>
    [Inverse Unitary Time-Change Operator]<label|def:inverse_unitary_op> The
    inverse operator <math|M<rsub|\<theta\>><rsup|-1>:L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>
    corresponding to the unitary time-change operator
    <math|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>> defined in
    Equation<nbsp><eqref|eq:unitary_op> is given by

    <\equation>
      <label|eq:unitary_inverse><around|(|M<rsub|\<theta\>><rsup|-1>*g|)><around|(|s|)>=<frac|g<around|(|\<theta\><rsup|-1><around|(|s|)>|)>|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    </equation>
  </definition>

  <subsection|Well-Definedness and Local Unitarity Properties>

  <\lemma>
    [Well-Definedness of Inverse Operator]<label|lem:inverse_well_defined>
    The operator <math|M<rsub|\<theta\>><rsup|-1>> in
    Definition<nbsp><reference|def:inverse_unitary_op> is well-defined on
    <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </lemma>

  <\proof>
    Since <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on sets of
    measure zero by Definition<nbsp><reference|def:scaling>, and
    <math|\<theta\><rsup|-1>> maps sets of measure zero to sets of measure
    zero (as it preserves absolute continuity), the denominator
    <math|<sqrt|<wide|\<theta\>|\<dot\>><around|(|\<theta\><rsup|-1><around|(|s|)>|)>>>
    is positive almost everywhere. The expression in
    equation<nbsp><eqref|eq:unitary_inverse> is therefore well-defined almost
    everywhere on every <math|\<sigma\>>-compact set, which suffices for
    defining an element of <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </proof>

  <\theorem>
    [Local Unitarity of Transformation Operator]<label|thm:local_unitary> The
    operator <math|M<rsub|\<theta\>>> defined in
    equation<nbsp><eqref|eq:unitary_op> satisfies local unitarity: for every
    <math|\<sigma\>>-compact set <math|U\<subseteq\>\<bbb-R\>>,

    <\equation>
      <label|eq:local_L2_preserve><big|int><rsub|U><around|\||<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>*<around|\||<rsup|2>d*t=<big|int><rsub|\<theta\><around|(|U|)>>|\|>*f<around|(|s|)>|\|><rsup|2>*d*s<space|1em>\<forall\>f\<in\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>
    </equation>
  </theorem>

  <\proof>
    Let <math|f\<in\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>
    and let <math|U> be any <math|\<sigma\>>-compact set. The local
    <math|L<rsup|2>>-norm of <math|M<rsub|\<theta\>>*f> over <math|U> is
    computed as follows:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|U><around|\||<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>|\|><rsup|2>*d*t>|<cell|=<big|int><rsub|U><around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*d*t<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|U><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*d*t<eq-number>>>>>
    </align>

    Applying the change of variables <math|s=\<theta\><around|(|t|)>>, since
    <math|\<theta\>> is absolutely continuous and strictly increasing, the
    Jacobian is given by

    <\equation>
      d*s=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*t
    </equation>

    almost everywhere. Since <math|\<theta\>> maps <math|\<sigma\>>-compact
    sets to <math|\<sigma\>>-compact sets (by
    Definition<nbsp><reference|def:scaling>), as <math|t> ranges over
    <math|U>, <math|s=\<theta\><around|(|t|)>> ranges over
    <math|\<theta\><around|(|U|)>>, which is <math|\<sigma\>>-compact.
    Therefore:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|U><wide|\<theta\>|\<dot\>><around|(|t|)><around|\||f<around|(|\<theta\><around|(|t|)>|)>|\|><rsup|2>*d*t>|<cell|=<big|int><rsub|\<theta\><around|(|U|)>><around|\||f<around|(|s|)>|\|><rsup|2>*d*s<eq-number>>>>>
    </align>

    To complete the proof of local unitarity, verification that
    <math|M<rsub|\<theta\>><rsup|-1>> is indeed the inverse of
    <math|M<rsub|\<theta\>>> on <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>
    follows by checking that <math|M<rsub|\<theta\>>*M<rsub|\<theta\>><rsup|-1>=M<rsub|\<theta\>><rsup|-1>*M<rsub|\<theta\>>=I>
    on each <math|\<sigma\>>-compact domain.
  </proof>

  <section|Sample Path Square-Integrability>

  <\theorem>
    [Sample Paths in <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>]<label|thm:sample_paths_in_L2sigma>
    Let <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> be a
    second-order stationary Gaussian process with finite second moment
    <math|\<sigma\><rsup|2>=E<around|[|X<around|(|t|)><rsup|2>|]>\<less\>\<infty\>>.
    Then almost surely every sample path <math|X<around|(|\<omega\>,\<cdot\>|)>>
    belongs to <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </theorem>

  <\proof>
    Fix any bounded interval <math|<around|[|a,b|]>>. Consider the random
    variable

    <\equation>
      Y<rsub|<around|[|a,b|]>>=<big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*d*t
    </equation>

    By stationarity and finite second moment,

    <\equation>
      E<around|[|Y<rsub|<around|[|a,b|]>>|]>=<big|int><rsub|a><rsup|b>E<around|[|X<around|(|t|)><rsup|2>|]>*d*t=<big|int><rsub|a><rsup|b>\<sigma\><rsup|2>*d*t=\<sigma\><rsup|2>*<around|(|b-a|)>\<less\>\<infty\>.
    </equation>

    By Markov's inequality, for any <math|M\<gtr\>0>,

    <\equation>
      P*<around|(|Y<rsub|<around|[|a,b|]>>\<gtr\>M|)>\<leq\><frac|E<around|[|Y<rsub|<around|[|a,b|]>>|]>|M>=<frac|\<sigma\><rsup|2>*<around|(|b-a|)>|M>.
    </equation>

    Taking the limit as <math|M\<to\>\<infty\>>, it follows that

    <\equation>
      P*<around*|(|<big|int><rsub|a><rsup|b>X<around|(|t|)><rsup|2>*d*t\<less\>\<infty\>|)>=1,
    </equation>

    i.e., almost surely the sample path is square integrable on
    <math|<around|[|a,b|]>>. Since <math|\<bbb-R\>> is the countable union of
    such bounded intervals,

    <\equation>
      \<bbb-R\>=<big|cup><rsub|n=1><rsup|\<infty\>><around|[|-n,n|]>,
    </equation>

    then by countable subadditivity of probability

    <\equation>
      P<around*|(|<big|cap><rsub|n=1><rsup|\<infty\>><around*|{|<big|int><rsub|-n><rsup|n>X<around|(|t|)><rsup|2>*d*t\<less\>\<infty\>|}>|)>=1,
    </equation>

    meaning almost surely the sample path lies in
    <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>.
  </proof>

  <section|Main Results>

  <subsection|Oscillatory Representation>

  <\theorem>
    [Oscillatory Form]<label|thm:osc_rep> The process
    <math|<around|{|Z<around|(|t|)>|}>> defined in
    equation<nbsp><eqref|eq:time_change> with realizations in
    <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>> is
    oscillatory with oscillatory functions

    <\equation>
      <label|eq:phi_def>\<phi\><rsub|t><around|(|\<omega\>|)>=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>
    </equation>

    and gain functions

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>
  </theorem>

  <\proof>
    Applying the unitary time change operator
    <math|<around|(|M<rsub|\<theta\>>*f|)><around|(|t|)>> from
    Definition<nbsp><reference|def:unitary_op> and substituting the spectral
    representation<nbsp><eqref|eq:stationary_rep> of the stationary process
    <math|X<around|(|t|)>>:

    <\align>
      <tformat|<table|<row|<cell|Z<around|(|t|)>>|<cell|=<around|(|M<rsub|\<theta\>>*X|)><around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*X<around|(|\<theta\><around|(|t|)>|)><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>*d*\<Phi\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|t><around|(|\<omega\>|)>*d*\<Phi\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    where

    <\equation>
      \<phi\><rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>>
    </equation>

    To verify this constitutes an oscillatory representation according to
    Definition<nbsp><reference|def:oscillatory>, the expression
    <math|\<phi\><rsub|t><around|(|\<omega\>|)>> must be written in the form
    <math|A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t>>:

    <\align>
      <tformat|<table|<row|<cell|\<phi\><rsub|t><around|(|\<omega\>|)>>|<cell|=A<rsub|t><around|(|\<omega\>|)>*e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>*e<rsup|i*\<omega\>*t><eq-number>>>|<row|<cell|>|<cell|=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<omega\>*\<theta\><around|(|t|)>><eq-number>>>>>
    </align>

    where

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    Since <math|<wide|\<theta\>|\<dot\>><around|(|t|)>\<geq\>0> almost
    everywhere and <math|<wide|\<theta\>|\<dot\>><around|(|t|)>=0> only on
    sets of measure zero, the function <math|A<rsub|t><around|(|\<omega\>|)>>
    is well-defined almost everywhere. Moreover,
    <math|A<rsub|t><around|(|\<cdummy\>|)>\<in\>L<rsup|2><around|(|\<mu\>|)>>
    for each <math|t> since:

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><wide|\<theta\>|\<dot\>><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*\<mu\><around|(|\<bbb-R\>|)>\<less\>\<infty\><eq-number>>>>>
    </align>
  </proof>

  <subsection|Evolutionary Power Spectrum>

  <\corollary>
    [Evolutionary Spectrum]<label|cor:evolving_spec> The evolutionary power
    spectrum is

    <\equation>
      <label|eq:evolutionary_spec>d*F<rsub|t><around|(|\<omega\>|)>=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)>
    </equation>
  </corollary>

  <\proof>
    By Definition<nbsp><reference|def:oscillatory> and the envelope from
    Equation<nbsp><eqref|envelope>, the evolutionary power spectrum is:

    <\align>
      <tformat|<table|<row|<cell|d*F<rsub|t><around|(|\<omega\>|)>>|<cell|=<around|\||A<rsub|t><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<around*|\||<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)><around|\||e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>|\|><rsup|2>*d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    since <math|<around|\||e<rsup|i*\<alpha\>>|\|>=1> for all
    <math|\<alpha\>\<in\>\<bbb-R\>>.
  </proof>

  <subsection|Operator Conjugation>

  <\theorem>
    [Operator Conjugation]<label|thm:operator_conjugation> Let
    <math|T<rsub|K>> be the integral covariance operator defined by

    <\equation>
      <label|eq:integral_op_original><around|(|T<rsub|K>*f|)><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||t-s|\|>|)>*f<around|(|s|)>*d*s
    </equation>

    where <math|K<around|(|h|)>> represents the stationary kernel

    <\equation>
      K<around|(|h|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>S<around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*h>*d*\<lambda\>
    </equation>

    and let <math|T<rsub|K<rsub|\<theta\>>>> be the integral covariance
    operator defined by

    <\equation>
      <label|eq:integral_op_transformed>

      <\aligned>
        <tformat|<table|<row|<cell|<around|(|T<rsub|K<rsub|\<theta\>>>*f|)><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<rsub|\<theta\>><around|(|s,t|)>*f<around|(|s|)>*d*s>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>*f<around|(|s|)>*d*s>>>>
      </aligned>
    </equation>

    for the unitarily time-changed kernel

    <\equation>
      K<rsub|\<theta\>><around|(|s,t|)>=K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)><sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>*<wide|\<theta\>|\<dot\>><around|(|s|)>>
    </equation>

    Then on <math|L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>,

    <\equation>
      <label|eq:conjugation>T<rsub|K<rsub|\<theta\>>>=M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>
    </equation>
  </theorem>

  <\proof>
    For any <math|g\<in\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>,
    the computation of <math|<around|(|M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>*g|)><around|(|t|)>>
    proceeds through the same algebraic steps as in the classical case, with
    the change of variables arguments remaining valid on each
    <math|\<sigma\>>-compact domain where the integrals are well-defined.
  </proof>

  <subsection|Zero-Crossing Analysis>

  <\theorem>
    [Expected Zero-Counting Function]<label|thm:zero_count> Let
    <math|\<theta\>\<in\>\<cal-F\>> and let

    <\equation>
      K<around|(|\<tau\>|)>=<math-up|cov><around|(|X<around|(|t|)>,X*<around|(|t+\<tau\>|)>|)>
    </equation>

    be twice differentiable at <math|\<tau\>=0>. For any bounded interval
    <math|<around|[|a,b|]>>, the expected number of zeros of the process
    <math|Z<rsub|t>> is

    <\equation>
      <label|eq:zero_count>\<bbb-E\><around|[|N<rsub|<around|[|a,b|]>>|]>=<sqrt|-<wide|K|\<ddot\>><around|(|0|)>>*<around|(|\<theta\><around|(|b|)>-\<theta\><around|(|a|)>|)>
    </equation>
  </theorem>

  <\proof>
    Since <math|<around|[|a,b|]>> is compact, the covariance function of the
    time-changed process is

    <\equation>
      <label|eq:time_changed_cov>K<rsub|\<theta\>><around|(|s,t|)>=<math-up|cov><around|(|Z<rsub|s>,Z<rsub|t>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|s|)>*<wide|\<theta\>|\<dot\>><around|(|t|)>>*K<around|(|<around|\||\<theta\><around|(|t|)>-\<theta\><around|(|s|)>|\|>|)>
    </equation>

    The Kac-Rice formula and subsequent mixed derivative calculations proceed
    identically on the bounded interval <math|<around|[|a,b|]>>, yielding the
    same result.
  </proof>

  <section|Conclusion>

  This analysis establishes that Gaussian processes generated by
  measure-preserving bijective time changes of stationary processes form a
  well-defined subclass of oscillatory processes within the natural framework
  of functions square-integrable on <math|\<sigma\>>-compact sets. The key
  contributions include:

  <\enumerate>
    <item>The construction of the unitary operator
    <math|M<rsub|\<theta\>>:L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>\<to\>L<rsup|2><rsub|\<sigma\><text|-comp>><around|(|\<bbb-R\>|)>>
    and its inverse

    <item>The explicit oscillatory representation with envelope function

    <\equation>
      A<rsub|t><around|(|\<omega\>|)>=<sqrt|<wide|\<theta\>|\<dot\>><around|(|t|)>>*e<rsup|i*\<omega\>*<around|(|\<theta\><around|(|t|)>-t|)>>
    </equation>

    <item>The evolutionary power spectrum formula

    <\equation>
      d*F<rsub|t><around|(|\<omega\>|)>=<wide|\<theta\>|\<dot\>><around|(|t|)>*d*\<mu\><around|(|\<omega\>|)>
    </equation>

    <item>The operator conjugation relationship

    <\equation>
      T<rsub|K<rsub|\<theta\>>>=M<rsub|\<theta\>>*T<rsub|K>*M<rsub|\<theta\>><rsup|-1>
    </equation>

    <item>A closed-form expression for the expected zero count on bounded
    intervals
  </enumerate>

  The theoretical framework accommodates functions that are square-integrable
  on <math|\<sigma\>>-compact sets, providing significant practical
  advantages for processes with polynomial growth, bounded support, or other
  physically relevant behaviors while maintaining all essential mathematical
  properties.

  <\thebibliography|99>
    <bibitem|priestley1965>M.B. Priestley. Evolutionary spectra and
    non-stationary processes. <em|Journal of the Royal Statistical Society,
    Series B>, 27(2):204\U237, 1965.

    <bibitem|cramer1967>H. Cramér and M.R. Leadbetter. <em|Stationary and
    Related Stochastic Processes>. Wiley, 1967.

    <bibitem|kac1943>M. Kac. On the average number of real roots of a random
    algebraic equation. <em|Bulletin of the American Mathematical Society>,
    49(4):314\U320, 1943.

    <bibitem|rice1945>S.O. Rice. Mathematical analysis of random noise.
    <em|Bell System Technical Journal>, 24(1):46\U156, 1945.
  </thebibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-breaking|sloppy>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-10|<tuple|4|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-11|<tuple|5|7|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-12|<tuple|5.1|7|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-13|<tuple|5.2|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-14|<tuple|5.3|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-15|<tuple|5.4|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-16|<tuple|6|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-17|<tuple|5|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-2|<tuple|2|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-3|<tuple|2.1|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-4|<tuple|2.2|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-5|<tuple|2.3|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-6|<tuple|2.4|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-7|<tuple|3|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-8|<tuple|3.1|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|auto-9|<tuple|3.2|5|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-cramer1967|<tuple|cramer1967|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-kac1943|<tuple|kac1943|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-priestley1965|<tuple|priestley1965|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|bib-rice1945|<tuple|rice1945|11|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|cor:evolving_spec|<tuple|15|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:L2_sigma_compact|<tuple|2|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:inverse_unitary_op|<tuple|10|5|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:oscillatory|<tuple|5|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:scaling|<tuple|6|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:sigma_compact|<tuple|1|2|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:stationary|<tuple|4|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:time_changed_proc|<tuple|9|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|def:unitary_op|<tuple|8|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|envelope|<tuple|6|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:conjugation|<tuple|50|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:evolutionary_spec|<tuple|41|8|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:integral_op_original|<tuple|46|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:integral_op_transformed|<tuple|48|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:local_L2_preserve|<tuple|16|5|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:oscillatory_rep|<tuple|9|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:phi_def|<tuple|27|7|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:stationary_rep|<tuple|3|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:time_change|<tuple|14|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:time_changed_cov|<tuple|53|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:unitary_inverse|<tuple|15|5|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:unitary_op|<tuple|13|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|eq:zero_count|<tuple|52|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|lem:inverse_well_defined|<tuple|11|5|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|rem:inverse_properties|<tuple|7|4|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|rem:sigma_compact_properties|<tuple|3|3|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:local_unitary|<tuple|12|5|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:operator_conjugation|<tuple|16|9|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:osc_rep|<tuple|14|7|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:sample_paths_in_L2sigma|<tuple|13|6|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
    <associate|thm:zero_count|<tuple|17|10|MeasurePreservingBijectiveTimeChangesOfStationaryGaussianProcessesWithEvolvingSpectra.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Mathematical
      Background> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Function Spaces on
      <with|mode|<quote|math>|\<sigma\>>-Compact Sets
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Stationary Gaussian
      Processes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Oscillatory Processes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|2.4<space|2spc>Time Scaling Functions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      Unitary Time-Change Transformation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Definition of the
      Transformation Operator <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Well-Definedness and Local
      Unitarity Properties <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Sample
      Path Square-Integrability> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Oscillatory Representation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Evolutionary Power Spectrum
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|5.3<space|2spc>Operator Conjugation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|5.4<space|2spc>Zero-Crossing Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>