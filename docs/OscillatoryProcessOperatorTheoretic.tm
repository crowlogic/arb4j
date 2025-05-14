<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|A Rigorous Operator-Theoretic Formulation of
  Oscillatory Processes>|<doc-author|<author-data|<author-name|Technical
  Note>>>|<doc-date|<date|>>>

  <abstract-data|<\abstract>
    This note presents a reformulation of the theory of oscillatory processes
    using explicit operator notation with brackets. The approach resolves
    ambiguities in previous formulations where operators were notationally
    indistinguishable from scalar multiplication. Particular emphasis is
    placed on the proper notation for operators acting on functions in the
    spectral domain.
  </abstract>>

  \;

  <section|Introduction>

  The theory of oscillatory processes introduced by Priestley and expanded by
  Mandrekar provides a powerful framework for analyzing non-stationary
  stochastic processes. However, the notation used in the original
  formulations has led to ambiguities, particularly in distinguishing between
  operator action and scalar multiplication. This note provides a rigorous
  reformulation using explicit bracket notation for operators to resolve
  these issues.

  <section|Mathematical Framework>

  Let <math|\<cal-H\>=L<rsup|2><around|(|\<bbb-R\>,d*\<rho\>|)>> denote the
  Hilbert space of square-integrable functions with respect to spectral
  measure <math|\<rho\>>.

  <\definition>
    [Spectral Multiplication Operator] For a measurable function
    <math|a<rsub|t>:\<bbb-R\>\<to\>\<bbb-C\>> satisfying
    <math|<big|int><rsub|\<bbb-R\>><around|\||a<rsub|t><around|(|\<lambda\>|)>|\|><rsup|2>*d*\<rho\><around|(|\<lambda\>|)>\<less\>\<infty\>>,
    the spectral multiplication operator <math|<math-bf|A><rsub|t>:\<cal-H\>\<to\>\<cal-H\>>
    is defined by its action on any function <math|f\<in\>\<cal-H\>>:

    <\equation>
      <math-bf|A><rsub|t><around*|[|f|]><around|(|\<lambda\>|)>=a<rsub|t><around|(|\<lambda\>|)>\<cdot\>f<around|(|\<lambda\>|)>,<space|1em>\<forall\>\<lambda\>\<in\>\<bbb-R\>
    </equation>
  </definition>

  <\definition>
    [Stationary Process] A zero-mean stationary process
    <math|<around|{|Y<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> has the
    spectral representation:

    <\equation>
      Y<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|Z<around|(|\<lambda\>|)>> is an orthogonal increment process
    with <math|\<bbb-E\><around|\||Z<around|(|A|)>|\|><rsup|2>=\<rho\><around|(|A|)>>
    for Borel sets <math|A>.
  </definition>

  <\definition>
    [Oscillatory Process] A process <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>>
    is oscillatory if it admits the representation:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>><math-bf|A><rsub|t><around*|[|e<rsup|i<around|(|\<cdummy\>|)>*t>|]><around|(|\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where <math|<math-bf|A><rsub|t>> is a spectral multiplication operator
    defined by a measurable function <math|a<rsub|t><around|(|\<lambda\>|)>>.
  </definition>

  <section|Main Results>

  <\theorem>
    [Characterization of Oscillatory Processes] A process
    <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> is oscillatory
    if and only if it can be expressed as:

    <\equation>
      X<around|(|t|)>=<math-bf|A><rsub|t><around*|[|Y<around|(|t|)>|]>
    </equation>

    where <math|Y<around|(|t|)>> is a stationary process and
    <math|<math-bf|A><rsub|t>> is a spectral multiplication operator.
  </theorem>

  <\proof>
    First, assume <math|<around|{|X<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>>
    is oscillatory. By definition:

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>><math-bf|A><rsub|t><around*|[|e<rsup|i<around|(|\<cdummy\>|)>*t>|]><around|(|\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)>=<big|int><rsub|\<bbb-R\>>a<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    Let <math|Y<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>>.
    Then:

    <\align>
      <tformat|<table|<row|<cell|<math-bf|A><rsub|t><around*|[|Y<around|(|t|)>|]>>|<cell|=<math-bf|A><rsub|t><around*|[|<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><math-bf|A><rsub|t><around*|[|e<rsup|i<around|(|\<cdummy\>|)>*t>|]><around|(|\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>a<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=X<around|(|t|)><eq-number>>>>>
    </align>

    Conversely, if <math|X<around|(|t|)>=<math-bf|A><rsub|t><around*|[|Y<around|(|t|)>|]>>
    with <math|Y<around|(|t|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>>,
    then:

    <\align>
      <tformat|<table|<row|<cell|X<around|(|t|)>>|<cell|=<math-bf|A><rsub|t><around*|[|<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)>|]><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>><math-bf|A><rsub|t><around*|[|e<rsup|i<around|(|\<cdummy\>|)>*t>|]><around|(|\<lambda\>|)>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-R\>>a<rsub|t><around|(|\<lambda\>|)>*e<rsup|i*\<lambda\>*t>*<space|0.17em>d*Z<around|(|\<lambda\>|)><eq-number>>>>>
    </align>

    which is the representation of an oscillatory process.
  </proof>

  <\corollary>
    [Commutation with Shift Operators] Let <math|<math-bf|U><rsub|s>> be the
    shift operator defined by <math|<math-bf|U><rsub|s><around*|[|Y<around|(|t|)>|]>=Y*<around|(|t+s|)>>.
    Then the spectral multiplication operator <math|<math-bf|A><rsub|t>>
    commutes with <math|<math-bf|U><rsub|s>>:

    <\equation>
      <math-bf|A><rsub|t><around*|[|<math-bf|U><rsub|s><around|[|Y|]>|]>=<math-bf|U><rsub|s><around*|[|<math-bf|A><rsub|t><around|[|Y|]>|]>
    </equation>
  </corollary>

  <section|Note on Notation>

  The formulation presented here differs from that of Mandrekar and other
  authors by introducing explicit bracket notation
  <math|<math-bf|A><rsub|t><around*|[|f|]>> for the action of operators on
  functions. This distinction is crucial for several reasons:

  <\enumerate>
    <item>In previous formulations, expressions such as
    "<math|A<rsub|t>*y<around|(|t|)>>" are ambiguous, as they could be
    interpreted either as operator action or scalar multiplication.

    <item>The bracket notation <math|<math-bf|A><rsub|t><around*|[|f|]><around|(|\<lambda\>|)>>
    makes explicit that <math|<math-bf|A><rsub|t>> acts on functions in the
    spectral domain, not on process values directly.

    <item>This formulation clearly distinguishes between modulation by a
    deterministic function (where <math|a<rsub|t><around|(|\<lambda\>|)>> is
    independent of <math|\<lambda\>>) and more general spectral operations.

    <item>Expressions such as <math|<math-bf|A><rsub|t><around*|[|Y<around|(|t|)>|]>>
    unambiguously represent the application of an operator to a stochastic
    process, rather than pointwise multiplication.
  </enumerate>

  The bracket notation resolves the syntactic ambiguities of the original
  paper, where operator action was denoted in a manner that failed to
  distinguish it from multiplication by a scalar function of time. This led
  to confusion when analyzing processes (such as time-warped stationary
  processes) where the operator action cannot be reduced to scalar
  multiplication.

  <section|Example: Comparison with Previous Notation>

  In previous formulations, one might encounter the expression:

  <\equation>
    x<around|(|t|)>=A<rsub|t>*y<around|(|t|)><space|1em><text|(ambiguous
    notation)>
  </equation>

  It is unclear whether <math|A<rsub|t>> is a scalar or an operator. Using
  the notation introduced here:

  <\equation>
    X<around|(|t|)>=<math-bf|A><rsub|t><around*|[|Y<around|(|t|)>|]><space|1em><text|(unambiguous
    operator action)>
  </equation>

  The brackets explicitly indicate that <math|<math-bf|A><rsub|t>> is an
  operator acting on <math|Y<around|(|t|)>>, not a scalar multiplier.

  <section|Conclusion>

  This reformulation provides a rigorous operator-theoretic foundation for
  Priestley's theory of oscillatory processes, resolving notational
  ambiguities in previous work. The explicit use of bracket notation for
  operator action ensures clear distinction between operators and scalar
  multipliers, essential for understanding the spectral structure of
  non-stationary processes.

  <\thebibliography|9>
    <bibitem|priestley>Priestley, M.B. (1965). Evolutionary spectra and
    non-stationary processes. J. Roy. Statist. Soc. Ser. B, 27, 204\U237.

    <bibitem|mandrekar>Mandrekar, V. (1976). On prediction theory for
    oscillatory processes. Theory Probab. Appl., 21(3), 496\U507.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|3>>
    <associate|auto-5|<tuple|5|3>>
    <associate|auto-6|<tuple|6|4>>
    <associate|auto-7|<tuple|6|4>>
    <associate|bib-mandrekar|<tuple|mandrekar|4>>
    <associate|bib-priestley|<tuple|priestley|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Mathematical
      Framework> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Note
      on Notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Example:
      Comparison with Previous Notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>