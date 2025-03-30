<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Gaussian Processes, de Finetti's Theorem, and Path
  Integrals: Unifying Perspectives>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <\abstract>
      This document explores the deep connections between Gaussian processes,
      de Finetti's theorem, path integrals, and ergodic theory. We unify
      these areas through the concept of averaging over all possible
      realizations or paths. Beginning with de Finetti's representation
      <math|P*<around|(|X\<in\>A|)>=<big|int>P*<around|(|X\<in\>A\|f|)>*d*\<mu\><around|(|f|)>>
      for Gaussian processes, we examine the Karhunen-Loève expansion
      <math|X<around|(|t|)>=<big|sum><rsub|i><sqrt|\<lambda\><rsub|i>>*Z<rsub|i>*\<phi\><rsub|i><around|(|t|)>>
      and its relation to path integrals. We discuss measure equivalence
      across function spaces: <math|C<around|(|<around|[|0,T|]>|)>>
      (continuous functions), <math|H<rsup|1><rsub|0><around|(|<around|[|0,T|]>|)>>
      (Sobolev space of absolutely continuous functions vanishing at
      endpoints), and <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>> (space
      of tempered distributions). We introduce advanced concepts like the
      Cameron-Martin and Girsanov theorems. The connection to ergodic theory
      is explored through Birkhoff's theorem,
      <math|lim<rsub|n\<to\>\<infty\>> <frac|1|n>*<big|sum><rsub|k=0><rsup|n-1>f*<around|(|T<rsup|k>*x|)>=\<bbb-E\><around|[|f\|I|]><around|(|x|)>>,
      linking time and ensemble averages. We demonstrate how these
      relationships stem from fundamental symmetries in the underlying
      systems, providing a unifying framework for phenomena in mathematics
      and physics.
    </abstract>
  </author-affiliation>>>>

  <section|Introduction>

  <section|Introduction>

  This document explores the deep connections between Gaussian processes, de
  Finetti's theorem, path integrals, and various areas of mathematical
  physics and stochastic analysis. We will show how these seemingly distinct
  areas are unified through the concept of averaging over all possible
  realizations or paths.

  <section|De Finetti's Theorem and Gaussian Processes>

  <\theorem>
    [De Finetti's Representation for Gaussian Processes] For a stationary
    Gaussian process <math|X<around|(|t|)>>, there exists a probability
    measure <math|\<mu\>> on the space of continuous functions such that:

    <\equation*>
      P*<around|(|X\<in\>A|)>=<big|int>P*<around|(|X\<in\>A\|f|)>*d*\<mu\><around|(|f|)>
    </equation*>

    where <math|A> is any event in the function space of continuous paths,
    and <math|P*<around|(|X\<in\>A\|f|)>> is the probability of the event
    <math|A> given a particular realization <math|f>.
  </theorem>

  <\remark>
    This representation is fundamentally about averaging over all possible
    realizations of the process, weighted by their probability under the
    measure <math|\<mu\>>.
  </remark>

  <section|Karhunen-Loève Expansion and Averaging Over Realizations>

  The Karhunen-Loève expansion provides a concrete way to understand this
  averaging:

  <\equation*>
    X<around|(|t|)>=<big|sum><rsub|i><sqrt|\<lambda\><rsub|i>>*Z<rsub|i>*\<phi\><rsub|i><around|(|t|)>
  </equation*>

  where <math|\<lambda\><rsub|i>> are eigenvalues of the covariance operator,
  <math|\<phi\><rsub|i><around|(|t|)>> are the corresponding eigenfunctions,
  and <math|Z<rsub|i>> are independent standard normal random variables.

  <\theorem>
    [Averaging Over Realizations] For any functional <math|F<around|[|X|]>>
    of the Gaussian process:

    <\equation*>
      \<bbb-E\><around|[|F<around|[|X|]>|]>=<big|int>F<around*|[|<big|sum><rsub|i><sqrt|\<lambda\><rsub|i>>*z<rsub|i>*\<phi\><rsub|i><around|(|t|)>|]>*<big|prod><rsub|i><frac|1|<sqrt|2*\<pi\>>>*e<rsup|-z<rsub|i><rsup|2>/2>*d*z<rsub|i>
    </equation*>

    This integral represents averaging <math|F<around|[|X|]>> over all
    possible realizations of the process.
  </theorem>

  <section|Connection to Path Integrals>

  The formulation of averaging over realizations has striking similarities
  with path integrals in physics and stochastic analysis.

  <subsection|Feynman Path Integral>

  In quantum mechanics, Feynman's path integral formulation expresses the
  probability amplitude of a particle moving from point <math|a> to point
  <math|b> as:

  <\equation*>
    K<around|(|b,a|)>=<big|int>\<cal-D\><around|[|x<around|(|t|)>|]>*e<rsup|i*S<around|[|x<around|(|t|)>|]>/\<hbar\>>
  </equation*>

  where <math|S<around|[|x<around|(|t|)>|]>> is the action functional and
  <math|\<cal-D\><around|[|x<around|(|t|)>|]>> represents integration over
  all possible paths.

  <subsection|Wiener Integral>

  For Brownian motion, the Wiener integral provides a similar formulation:

  <\equation*>
    \<bbb-E\><around|[|F<around|[|W|]>|]>=<big|int>F<around|[|w<around|(|t|)>|]>*d*\<mu\><rsub|W><around|(|w|)>
  </equation*>

  where <math|\<mu\><rsub|W>> is the Wiener measure on the space of
  continuous functions.

  <\remark>
    Both these formulations involve:

    <\enumerate>
      <item>Integrating over all possible paths (realizations)

      <item>Weighting paths by appropriate probability measures
    </enumerate>
  </remark>

  <section|Unifying Perspective: Function Spaces and Measures>

  The connection between these formulations lies in the underlying function
  spaces and measures:

  <\definition>
    [Relevant Function Spaces]

    <\enumerate>
      <item><math|C<around|(|<around|[|0,T|]>|)>>: Space of continuous
      functions on <math|<around|[|0,T|]>>

      <item><math|H<rsup|1><rsub|0><around|(|<around|[|0,T|]>|)>>: Sobolev
      space of absolutely continuous functions vanishing at endpoints

      <item><math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>>: Space of
      tempered distributions (for quantum field theory)
    </enumerate>
  </definition>

  <\theorem>
    [Measure Equivalence] Under appropriate conditions, the following
    measures on <math|C<around|(|<around|[|0,T|]>|)>> are equivalent:

    <\enumerate>
      <item>Gaussian measure induced by a Gaussian process

      <item>Wiener measure

      <item>Path integral measure <math|e<rsup|-S<around|[|x|]>/\<hbar\>>*\<cal-D\>*x>
      (after Wick rotation)
    </enumerate>
  </theorem>

  <section|Advanced Connections and Frameworks>

  <subsection|Cameron-Martin Theorem>

  The Cameron-Martin theorem provides a way to understand how the measure of
  a Gaussian process changes under translations:

  <\theorem>
    [Cameron-Martin] Let <math|\<mu\>> be the measure of a Gaussian process
    on <math|C<around|(|<around|[|0,T|]>|)>>, and <math|h\<in\>H> (the
    Cameron-Martin space). Then:

    <\equation*>
      <frac|d*\<mu\><rsub|h>|d*\<mu\>><around|(|f|)>=exp
      <around*|(|<big|int><rsub|0><rsup|T><wide|h|\<dot\>><around|(|t|)>*d*W<rsub|t>-<frac|1|2>*<big|int><rsub|0><rsup|T><wide|h|\<dot\>><around|(|t|)><rsup|2>*d*t|)>
    </equation*>

    where <math|\<mu\><rsub|h>> is the translated measure.
  </theorem>

  <subsection|Girsanov's Theorem>

  Girsanov's theorem extends this idea to changes of drift in stochastic
  differential equations:

  <\theorem>
    [Girsanov] Let <math|W<rsub|t>> be a Wiener process and <math|X<rsub|t>>
    satisfy:

    <\equation*>
      d*X<rsub|t>=b<around|(|t,X<rsub|t>|)>*d*t+d*W<rsub|t>
    </equation*>

    Then under a new measure <math|\<bbb-Q\>>:

    <\equation*>
      <frac|d*\<bbb-Q\>|d*\<bbb-P\>>=exp <around*|(|<big|int><rsub|0><rsup|T>b<around|(|t,X<rsub|t>|)>*d*W<rsub|t>-<frac|1|2>*<big|int><rsub|0><rsup|T>b<around|(|t,X<rsub|t>|)><rsup|2>*d*t|)>
    </equation*>

    <math|X<rsub|t>> becomes a Wiener process under <math|\<bbb-Q\>>.
  </theorem>

  <subsection|Malliavin Calculus>

  Malliavin calculus provides a differential calculus on Wiener space,
  allowing us to define derivatives of functionals of Brownian motion:

  <\definition>
    [Malliavin Derivative] For a smooth functional <math|F> of Brownian
    motion, its Malliavin derivative <math|D*F> is defined as:

    <\equation*>
      D*F<rsub|t>=lim<rsub|\<epsilon\>\<to\>0>
      <frac|F*<around|(|W+\<epsilon\>*1<rsub|<around|[|0,t|]>>|)>-F<around|(|W|)>|\<epsilon\>>
    </equation*>
  </definition>

  <section|Connection to Ergodic Theory>

  The concepts we've discussed - de Finetti's theorem, averaging over
  realizations of Gaussian processes, and path integrals - have a profound
  connection to ergodic theory. This connection provides another perspective
  on why averaging over realizations is so fundamental.

  <subsection|The Ergodic Theorem>

  <\theorem>
    <dueto|Birkhoff's Ergodic Theorem>Let
    <math|<around|(|X,\<cal-B\>,\<mu\>,T|)>> be a measure-preserving
    dynamical system with <math|\<mu\><around|(|X|)>=1>. For any
    <math|f\<in\>L<rsup|1><around|(|X,\<mu\>|)>>,

    <\equation*>
      lim<rsub|n\<to\>\<infty\>> <frac|1|n>*<big|sum><rsub|k=0><rsup|n-1>f*<around|(|T<rsup|k>*x|)>=\<bbb-E\><around|[|f\|I|]><around|(|x|)>
    </equation*>

    for <math|\<mu\>>-almost every <math|x>, where <math|I> is the
    <math|\<sigma\>>-algebra of <math|T>-invariant sets.
  </theorem>

  <\remark>
    The ergodic theorem essentially states that, for ergodic systems, the
    time average of a function along a typical trajectory equals the space
    average over the entire phase space.
  </remark>

  <subsection|Connection to Gaussian Processes and de Finetti's Theorem>

  The connection between the ergodic theorem and our previous discussion lies
  in the equivalence between time averages and ensemble averages:

  <\enumerate>
    <item>Time Average: In the context of stochastic processes, this
    corresponds to averaging a functional of the process over time.

    <item>Ensemble Average: This is equivalent to averaging over all possible
    realizations of the process, which is precisely what we've been
    discussing in the context of de Finetti's theorem and path integrals.
  </enumerate>

  <\theorem>
    <dueto|Ergodicity of Stationary Gaussian Processes>A stationary Gaussian
    process is ergodic if and only if its spectral measure is continuous.
  </theorem>

  For ergodic Gaussian processes, we have:

  <\equation*>
    lim<rsub|T\<to\>\<infty\>> <frac|1|T>*<big|int><rsub|0><rsup|T>F<around|[|X<rsub|t>|]>*d*t=\<bbb-E\><around|[|F<around|[|X|]>|]><space|1em><text|(almost
    surely)>
  </equation*>

  The right-hand side is precisely the ensemble average we've been discussing
  in the context of de Finetti's theorem and path integrals.

  <subsection|Implications for Path Integrals>

  In the context of path integrals, ergodicity provides a bridge between:

  <\enumerate>
    <item>Averaging over all possible paths (ensemble average)

    <item>Long-time behavior of a single path (time average)
  </enumerate>

  This connection is particularly important in statistical mechanics and
  quantum field theory, where it justifies the use of ensemble averages to
  compute observable quantities.

  <\example>
    <dueto|Feynman-Kac Formula>The Feynman-Kac formula provides a connection
    between path integrals and partial differential equations:

    <\equation*>
      u<around|(|t,x|)>=\<bbb-E\><rsub|x>*<around*|[|f<around|(|X<rsub|t>|)>*exp
      <around*|(|-<big|int><rsub|0><rsup|t>V<around|(|X<rsub|s>|)>*d*s|)>|]>
    </equation*>

    Here, the right-hand side is an average over all paths of a Brownian
    motion <math|X<rsub|t>> starting at <math|x>. The ergodic properties of
    Brownian motion ensure that this ensemble average is meaningful and
    computable.
  </example>

  <subsection|Ergodicity and de Finetti's Theorem>

  De Finetti's theorem can be viewed as a statement about the ergodic
  decomposition of exchangeable sequences:

  <\theorem>
    <dueto|Ergodic Decomposition of Exchangeable Sequences>The measure
    <math|\<mu\>> in de Finetti's theorem represents the ergodic
    decomposition of the law of an exchangeable sequence. Each ergodic
    component corresponds to an i.i.d. sequence.
  </theorem>

  This perspective provides a deeper understanding of why de Finetti's
  theorem involves averaging over all possible realizations: it's essentially
  decomposing the process into its ergodic components.

  <section|Unifying Perspective: Averaging, Ergodicity, and Symmetry>

  The connections we've explored - between de Finetti's theorem, Gaussian
  processes, path integrals, and ergodic theory - all revolve around a
  central theme: the equivalence between different types of averages due to
  underlying symmetries or invariances.

  <\enumerate>
    <item>De Finetti's Theorem: Exchangeability (a type of symmetry) leads to
    representation as a mixture of i.i.d. sequences.

    <item>Gaussian Processes: Stationarity (time-translation invariance)
    often implies ergodicity, connecting time and ensemble averages.

    <item>Path Integrals: Integration over all paths reflects the symmetry of
    quantum mechanics under different trajectories.

    <item>Ergodic Theory: Time-invariance of the measure leads to equivalence
    of time and space averages.
  </enumerate>

  This unifying perspective suggests that the deep connections we've explored
  are manifestations of fundamental symmetries in the underlying systems. It
  provides a powerful framework for understanding and analyzing a wide range
  of phenomena in mathematics, physics, and beyond.

  <section|Connection to Ergodic Theory>

  The concepts we've discussed - de Finetti's theorem, averaging over
  realizations of Gaussian processes, and path integrals - have a profound
  connection to ergodic theory. This connection provides another perspective
  on why averaging over realizations is so fundamental.

  <subsection|The Ergodic Theorem>

  <\theorem>
    <dueto|Birkhoff's Ergodic Theorem>Let
    <math|<around|(|X,\<cal-B\>,\<mu\>,T|)>> be a measure-preserving
    dynamical system with <math|\<mu\><around|(|X|)>=1>. For any
    <math|f\<in\>L<rsup|1><around|(|X,\<mu\>|)>>,

    <\equation*>
      lim<rsub|n\<to\>\<infty\>> <frac|1|n>*<big|sum><rsub|k=0><rsup|n-1>f*<around|(|T<rsup|k>*x|)>=\<bbb-E\><around|[|f\|I|]><around|(|x|)>
    </equation*>

    for <math|\<mu\>>-almost every <math|x>, where <math|I> is the
    <math|\<sigma\>>-algebra of <math|T>-invariant sets.
  </theorem>

  <\remark>
    The ergodic theorem essentially states that, for ergodic systems, the
    time average of a function along a typical trajectory equals the space
    average over the entire phase space.
  </remark>

  <subsection|Connection to Gaussian Processes and de Finetti's Theorem>

  The connection between the ergodic theorem and our previous discussion lies
  in the equivalence between time averages and ensemble averages:

  <\enumerate>
    <item>Time Average: In the context of stochastic processes, this
    corresponds to averaging a functional of the process over time.

    <item>Ensemble Average: This is equivalent to averaging over all possible
    realizations of the process, which is precisely what we've been
    discussing in the context of de Finetti's theorem and path integrals.
  </enumerate>

  <\theorem>
    <dueto|Ergodicity of Stationary Gaussian Processes>A stationary Gaussian
    process is ergodic if and only if its spectral measure is continuous.
  </theorem>

  For ergodic Gaussian processes, we have:

  <\equation*>
    lim<rsub|T\<to\>\<infty\>> <frac|1|T>*<big|int><rsub|0><rsup|T>F<around|[|X<rsub|t>|]>*d*t=\<bbb-E\><around|[|F<around|[|X|]>|]><space|1em><text|(almost
    surely)>
  </equation*>

  The right-hand side is precisely the ensemble average we've been discussing
  in the context of de Finetti's theorem and path integrals.

  <subsection|Implications for Path Integrals>

  In the context of path integrals, ergodicity provides a bridge between:

  <\enumerate>
    <item>Averaging over all possible paths (ensemble average)

    <item>Long-time behavior of a single path (time average)
  </enumerate>

  This connection is particularly important in statistical mechanics and
  quantum field theory, where it justifies the use of ensemble averages to
  compute observable quantities.

  <\example>
    <dueto|Feynman-Kac Formula>The Feynman-Kac formula provides a connection
    between path integrals and partial differential equations:

    <\equation*>
      u<around|(|t,x|)>=\<bbb-E\><rsub|x>*<around*|[|f<around|(|X<rsub|t>|)>*exp
      <around*|(|-<big|int><rsub|0><rsup|t>V<around|(|X<rsub|s>|)>*d*s|)>|]>
    </equation*>

    Here, the right-hand side is an average over all paths of a Brownian
    motion <math|X<rsub|t>> starting at <math|x>. The ergodic properties of
    Brownian motion ensure that this ensemble average is meaningful and
    computable.
  </example>

  <subsection|Ergodicity and de Finetti's Theorem>

  De Finetti's theorem can be viewed as a statement about the ergodic
  decomposition of exchangeable sequences:

  <\theorem>
    <dueto|Ergodic Decomposition of Exchangeable Sequences>The measure
    <math|\<mu\>> in de Finetti's theorem represents the ergodic
    decomposition of the law of an exchangeable sequence. Each ergodic
    component corresponds to an i.i.d. sequence.
  </theorem>

  This perspective provides a deeper understanding of why de Finetti's
  theorem involves averaging over all possible realizations: it's essentially
  decomposing the process into its ergodic components.

  <section|Unifying Perspective: Averaging, Ergodicity, and Symmetry>

  The connections we've explored - between de Finetti's theorem, Gaussian
  processes, path integrals, and ergodic theory - all revolve around a
  central theme: the equivalence between different types of averages due to
  underlying symmetries or invariances.

  <\enumerate>
    <item>De Finetti's Theorem: Exchangeability (a type of symmetry) leads to
    representation as a mixture of i.i.d. sequences.

    <item>Gaussian Processes: Stationarity (time-translation invariance)
    often implies ergodicity, connecting time and ensemble averages.

    <item>Path Integrals: Integration over all paths reflects the symmetry of
    quantum mechanics under different trajectories.

    <item>Ergodic Theory: Time-invariance of the measure leads to equivalence
    of time and space averages.
  </enumerate>

  This unifying perspective suggests that the deep connections we've explored
  are manifestations of fundamental symmetries in the underlying systems. It
  provides a powerful framework for understanding and analyzing a wide range
  of phenomena in mathematics, physics, and beyond.
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-10|<tuple|7.1|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-11|<tuple|7.2|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-12|<tuple|7.3|4|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-13|<tuple|8|4|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-14|<tuple|8.1|4|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-15|<tuple|8.2|4|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-16|<tuple|8.3|5|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-17|<tuple|8.4|5|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-18|<tuple|9|6|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-19|<tuple|10|6|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-20|<tuple|10.1|6|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-21|<tuple|10.2|7|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-22|<tuple|10.3|7|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-23|<tuple|10.4|8|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-24|<tuple|11|8|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-5|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-6|<tuple|5.1|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-7|<tuple|5.2|2|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-8|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
    <associate|auto-9|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_45.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>De
      Finetti's Theorem and Gaussian Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Karhunen-Loève
      Expansion and Averaging Over Realizations>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Connection
      to Path Integrals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Feynman Path Integral
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Wiener Integral
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Unifying
      Perspective: Function Spaces and Measures>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Advanced
      Connections and Frameworks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|7.1<space|2spc>Cameron-Martin Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|7.2<space|2spc>Girsanov's Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|7.3<space|2spc>Malliavin Calculus
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Connection
      to Ergodic Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.5fn>

      <with|par-left|<quote|1tab>|8.1<space|2spc>The Ergodic Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|8.2<space|2spc>Connection to Gaussian
      Processes and de Finetti's Theorem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|8.3<space|2spc>Implications for Path
      Integrals <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|8.4<space|2spc>Ergodicity and de Finetti's
      Theorem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Unifying
      Perspective: Averaging, Ergodicity, and Symmetry>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Connection
      to Ergodic Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19><vspace|0.5fn>

      <with|par-left|<quote|1tab>|10.1<space|2spc>The Ergodic Theorem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|1tab>|10.2<space|2spc>Connection to Gaussian
      Processes and de Finetti's Theorem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <with|par-left|<quote|1tab>|10.3<space|2spc>Implications for Path
      Integrals <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|10.4<space|2spc>Ergodicity and de Finetti's
      Theorem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|11<space|2spc>Unifying
      Perspective: Averaging, Ergodicity, and Symmetry>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>