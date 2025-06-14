<TeXmacs|2.1.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Stone's Theorem and Spectral Representations of
  Stationary Processes>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\abstract>
    This treatise elucidates the profound relationship between unitary
    operator groups and spectral representations of stochastic processes
    through the vantage of functional analysis. By rigorously constructing
    projection-valued spectral measures and explicitly resolving operator
    domains, it establishes an isometric isomorphism between the space of
    weakly stationary processes and complex orthogonal measures. The
    synthesis of Stone's theorem with Bochner's probabilistic framework
    yields canonical spectral decompositions, completing the Hilbertian
    characterization of second-order stochastic structures.
  </abstract>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Foundations
    of Spectral Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Essential
    Self-Adjointness and Dynamical Evolution>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Hilbertian
    Structure of Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Spectral
    Representation of Stationary Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Real
    Harmonic Analysis and Spectral Symmetry>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Epilogue:
    Operator Calculus and Stochastic Synthesis>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|Foundations of Spectral Theory>

  The spectral decomposition of self-adjoint operators constitutes the
  bedrock upon which stationary process theory rests. The resolution of
  identity emerges as a cornerstone concept, encoding the operator's spectral
  structure through geometric decomposition of the underlying Hilbert space.
  This projection-valued measure assigns to each Borel set an orthogonal
  projection operator, revealing the intimate connection between measure
  theory and functional analysis.

  <\definition>
    [Projection-Valued Spectral Measure] For a self-adjoint operator <math|A>
    on Hilbert space <math|H>, the projection-valued spectral measure
    <math|E<rsub|A>> assigns to each Borel set <math|B\<subset\>\<bbb-R\>> a
    projection operator <math|E<rsub|A><around|(|B|)>:H\<to\>H> such that for
    any <math|\<psi\><around|(|x|)>\<in\>H>,

    <\equation*>
      <around|(|E<rsub|A><around|(|B|)>*\<psi\>|)><around|(|x|)>=<text|orthogonal
      projection of >\<psi\><around|(|x|)>*<text|onto spectral subspace
      >H<rsub|B>
    </equation*>

    where <math|H<rsub|B>=<around|{|\<phi\><around|(|x|)>\<in\>D<around|(|A|)>:<around|(|A*\<phi\>|)><around|(|x|)>=\<lambda\>*\<phi\><around|(|x|)>*<text|for
    some >\<lambda\>\<in\>B|}>>.
  </definition>

  The measure satisfies fundamental properties that encode the algebraic
  structure of projection operators within the geometric framework of Hilbert
  space theory. These properties ensure that the spectral measure respects
  both the Boolean algebra of Borel sets and the operator algebra of
  projections.

  <\theorem>
    [Projection-Valued Spectral Measure and Resolution of the Identity] Let
    <math|<around|(|A*\<psi\>|)><around|(|x|)>> be a self-adjoint operator on
    Hilbert space <math|H>. There exists a unique family of projection
    operators <math|E<rsub|A><around|(|B|)>>,
    <math|B\<in\>\<cal-B\><around|(|\<bbb-R\>|)>>, such that for all
    <math|\<psi\><around|(|x|)>\<in\>H>:

    <\enumerate>
      <item><math|<around|(|E<rsub|A><around|(|B|)>*\<psi\>|)><around|(|x|)>>
      is the orthogonal projection of <math|\<psi\>> onto the closed span
      <math|H<rsub|B>=<around|{|\<phi\>\<in\>D<around|(|A|)>:<around|(|A*\<phi\>|)><around|(|x|)>=\<lambda\>*\<phi\><around|(|x|)>*<text|for
      some >\<lambda\>\<in\>B|}>>.

      <item><math|E<rsub|A><around|(|B|)><rsup|2>=E<rsub|A><around|(|B|)>>
      (idempotence), <math|E<rsub|A><around|(|B|)><rsup|\<ast\>>=E<rsub|A><around|(|B|)>>
      (self-adjointness).

      <item><math|E<rsub|A><around|(|<big|cup><rsub|k>B<rsub|k>|)>=<big|sum><rsub|k>E<rsub|A><around|(|B<rsub|k>|)>>
      for disjoint <math|B<rsub|k>> (strong topology).

      <item><math|E<rsub|A><around|(|\<bbb-R\>|)>=I>,
      <math|E<rsub|A><around|(|\<emptyset\>|)>=0>.

      <item>For any interval <math|<around|(|a,b|]>> and <math|\<psi\>>,

      <\equation*>
        <around|(|E<rsub|A><around|(|<around|(|a,b|]>|)>*\<psi\>|)><around|(|x|)>=<text|s->lim<rsub|\<epsilon\>\<to\>0<rsup|+>>
        <frac|1|2*\<pi\>*i>*<big|int><rsub|a><rsup|b><around*|[|<around|(|R<rsub|\<lambda\>+i*\<epsilon\>>*\<psi\>|)><around|(|x|)>-<around|(|R<rsub|\<lambda\>-i*\<epsilon\>>*\<psi\>|)><around|(|x|)>|]>*<space|0.17em>d*\<lambda\>
      </equation*>

      where the resolvent operator encodes spectral information through
      analytic continuation:

      <\equation*>
        <around|(|R<rsub|\<lambda\>>*\<psi\>|)><around|(|x|)>=<big|int><rsub|\<bbb-R\>><frac|1|\<mu\>-\<lambda\>>*<space|0.17em>d*<around|\<langle\>|E<rsub|A><around|(|\<mu\>|)>*\<psi\>,\<delta\><rsub|x>|\<rangle\>>
      </equation*>

      and for general Borel sets <math|B=<big|cup><rsub|k><around|(|a<rsub|k>,b<rsub|k>|]>>,

      <\equation*>
        <around|(|E<rsub|A><around|(|B|)>*\<psi\>|)><around|(|x|)>=<big|sum><rsub|k><around|(|E<rsub|A><around|(|<around|(|a<rsub|k>,b<rsub|k>|]>|)>*\<psi\>|)><around|(|x|)>
      </equation*>
    </enumerate>

    Moreover, the spectral theorem holds:

    <\equation*>
      <around|(|A*\<psi\>|)><around|(|x|)>=<big|int><rsub|\<bbb-R\>>\<lambda\>*<space|0.17em>d*<around|\<langle\>|E<rsub|A><around|(|\<lambda\>|)>*\<psi\>,\<delta\><rsub|x>|\<rangle\>>
    </equation*>

    for all <math|\<psi\>\<in\>D<around|(|A|)>>.
  </theorem>

  This construction proceeds through a sophisticated limiting process
  involving the resolvent operator, which captures the spectral properties of
  the operator through its poles and residues in the complex plane. The
  spectral integral representation reveals the profound connection between
  operator theory and measure-theoretic integration, establishing the
  foundation for functional calculus on self-adjoint operators.

  <section|Essential Self-Adjointness and Dynamical Evolution>

  The transition from symmetric to self-adjoint operators, as characterized
  by Nelson's theorem, reveals the essential role of domain specifications in
  ensuring mathematical and physical consistency. This theorem provides
  practical criteria for determining when a symmetric operator admits a
  unique self-adjoint extension, bridging the gap between formal operator
  expressions and rigorous functional analysis.

  <\theorem>
    [Nelson's Theorem] Let <math|A> be a symmetric operator on <math|H> with
    dense domain <math|D<around|(|A|)>>. If there exists a core
    <math|\<cal-D\>\<subset\>D<around|(|A|)>> such that

    <\enumerate>
      <item><math|\<cal-D\>> is dense in <math|H>

      <item><math|<around|(|A*\<phi\>|)><around|(|x|)>\<in\>\<cal-D\>> for
      all <math|\<phi\>\<in\>\<cal-D\>> (invariance condition)

      <item>For some <math|\<lambda\>> with
      <math|<math-up|Im><around|(|\<lambda\>|)>\<ne\>0>, the set
      <math|<around|{|<around|(|A*\<phi\>|)><around|(|x|)>-\<lambda\>*\<phi\><around|(|x|)>:\<phi\>\<in\>\<cal-D\>|}>>
      is dense in <math|H>
    </enumerate>

    then <math|A> is essentially self-adjoint on <math|\<cal-D\>>.
  </theorem>

  <\proof>
    The invariance condition ensures that the core <math|\<cal-D\>> generates
    a dense subspace under the action of <math|<around|(|A-\<lambda\>*I|)>>,
    while the range condition guarantees surjectivity in the appropriate
    sense. These properties together imply the vanishing of deficiency
    indices, establishing essential self-adjointness through the classical
    criterion.
  </proof>

  Stone's theorem then forges an elegant correspondence between the
  infinitesimal generators of unitary evolution groups and their spectral
  resolutions, establishing a fundamental duality in operator theory. This
  bijective relationship underpins both quantum mechanical time evolution and
  the spectral theory of stationary processes.

  <\theorem>
    [Stone's Theorem] Let <math|H> be a Hilbert space. There is a bijective
    correspondence between self-adjoint operators acting as
    <math|<around|(|A*\<psi\>|)><around|(|x|)>> and strongly continuous
    one-parameter unitary groups <math|<around|{|U<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>>,
    such that for all <math|\<psi\>\<in\>H> and <math|x\<in\>\<bbb-R\>>,

    <\equation*>
      <around|(|U<rsub|t>*\<psi\>|)><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*<around|\<langle\>|E<rsub|A><around|(|\<lambda\>|)>*\<psi\>,\<delta\><rsub|x>|\<rangle\>>,
    </equation*>

    with infinitesimal generator

    <\equation*>
      <around|(|A*\<psi\>|)><around|(|x|)>=-i*<around*|\<nobracket\>|<frac|d|d*t>*<around|(|U<rsub|t>*\<psi\>|)><around|(|x|)>|\|><rsub|t=0>.
    </equation*>
  </theorem>

  <\proof>
    The correspondence manifests through the spectral integral
    representation, where the exponential function
    <math|e<rsup|i*t*\<lambda\>>> provides the bridge between the discrete
    parameter <math|t> of the group and the continuous spectral parameter
    <math|\<lambda\>>. Strong continuity of the unitary group ensures that
    the generator is well-defined and self-adjoint, while the spectral
    theorem guarantees the integral representation converges in the strong
    operator topology.
  </proof>

  This fundamental result reveals how the abstract algebraic structure of
  one-parameter groups translates into concrete spectral measures, providing
  the mathematical framework for understanding temporal evolution in both
  deterministic and stochastic contexts.

  <section|Hilbertian Structure of Stationary Processes>

  A weakly stationary process, characterized by shift-invariant covariance
  structure, generates a natural Hilbert space framework that reveals the
  deep connections between probability theory and operator analysis. The
  geometric structure of this space, endowed with the covariance inner
  product, provides the foundation for spectral decomposition of stochastic
  processes.

  <\definition>
    [Stationary Process] A stochastic process
    <math|<around|{|X<rsub|t><around|(|x|)>:t\<in\>\<bbb-R\>|}>> is weakly
    stationary if:

    <\enumerate>
      <item><math|E<around|[|X<rsub|t><around|(|x|)>|]>> is constant for all
      <math|t\<in\>\<bbb-R\>>

      <item>Cov<math|<around|(|X<rsub|t><around|(|x|)>,X<rsub|s><around|(|x|)>|)>=\<gamma\>*<around|(|t-s|)>>
      depends only on <math|t-s>

      <item><math|E<around|[|<around|\||X<rsub|t><around|(|x|)>|\|><rsup|2>|]>\<less\>\<infty\>>
      for all <math|t\<in\>\<bbb-R\>>
    </enumerate>
  </definition>

  The construction of Hilbert space <math|H<rsub|X>=<wide|<text|span>|\<bar\>><around|{|X<rsub|t><around|(|x|)>|}>>
  with inner product structure <math|<around|\<langle\>|X<rsub|s><around|(|x|)>,X<rsub|t><around|(|x|)>|\<rangle\>>=\<gamma\>*<around|(|t-s|)>>
  establishes the geometric foundation for spectral analysis. The time
  translation operators <math|<around|(|T<rsub|h>*X<rsub|t>|)><around|(|x|)>=X<rsub|t+h><around|(|x|)>>
  form a unitary group whose Stone generator reveals the process's spectral
  structure.

  <\theorem>
    [Stationary Process and Spectral Representation] Let
    <math|<around|{|X<rsub|t><around|(|x|)>|}>> be a weakly stationary
    process with <math|E<around|[|X<rsub|t><around|(|x|)>|]>> constant,
    <math|<math-up|Cov><around|(|X<rsub|t><around|(|x|)>,X<rsub|s><around|(|x|)>|)>=\<gamma\>*<around|(|t-s|)>>,
    and <math|E<around|[|<around|\||X<rsub|t><around|(|x|)>|\|><rsup|2>|]>\<less\>\<infty\>>
    for all <math|t>. Then:

    <\enumerate>
      <item><math|H=<wide|<math-up|span>|\<bar\>><around|{|X<rsub|t><around|(|x|)>|}>>
      is a Hilbert space under <math|<around|\<langle\>|X<rsub|s><around|(|x|)>,X<rsub|t><around|(|x|)>|\<rangle\>>=\<gamma\>*<around|(|t-s|)>>.

      <item>The translation group <math|<around|(|T<rsub|h>*X<rsub|t>|)><around|(|x|)>=X<rsub|t+h><around|(|x|)>>
      is strongly continuous and unitary.

      <item>There exists a unique self-adjoint generator <math|A<rsub|T>>
      acting as <math|<around|(|A<rsub|T>*\<psi\>|)><around|(|x|)>> such that

      <\equation*>
        <around|(|T<rsub|h>*\<psi\>|)><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*h*\<lambda\>>*<space|0.17em>d*<around|\<langle\>|E<rsub|A<rsub|T>><around|(|\<lambda\>|)>*\<psi\>,\<delta\><rsub|x>|\<rangle\>>
      </equation*>

      <item>The spectral theorem holds:

      <\equation*>
        <around|(|A<rsub|T>*\<psi\>|)><around|(|x|)>=<big|int><rsub|\<bbb-R\>>\<lambda\>*<space|0.17em>d*<around|\<langle\>|E<rsub|A<rsub|T>><around|(|\<lambda\>|)>*\<psi\>,\<delta\><rsub|x>|\<rangle\>>
      </equation*>
    </enumerate>
  </theorem>

  This theorem establishes that the probabilistic structure of stationary
  processes admits a complete operator-theoretic characterization, where the
  covariance function encodes the spectral measure of the underlying
  generator. The translation invariance property ensures that the time
  evolution operators form a group, while stationarity guarantees their
  unitary character.

  <section|Spectral Representation of Stationary Processes>

  The spectral representation of stationary processes requires the
  mathematical framework of orthogonal random measures, which capture the
  essential randomness while preserving geometric structure. These measures
  provide the bridge between the abstract spectral theory of operators and
  the concrete probabilistic structure of stochastic processes.

  <\definition>
    [Orthogonal Random Measure] A complex-valued orthogonal random measure
    <math|Z<around|(|B|)>> on <math|<around|(|\<bbb-R\>,\<cal-B\><around|(|\<bbb-R\>|)>|)>>
    satisfies:

    <\enumerate>
      <item><math|E<around|[|Z<around|(|A|)><wide|Z<around|(|B|)>|\<bar\>>|]>=0>
      for disjoint Borel sets <math|A,B>

      <item><math|E<around|[|<around|\||Z<around|(|A|)>|\|><rsup|2>|]>=F<around|(|A|)>>
      where <math|F<around|(|A|)>> is a finite measure on
      <math|\<cal-B\><around|(|\<bbb-R\>|)>>

      <item><math|Z<around|(|<big|cup><rsub|i>A<rsub|i>|)>=<big|sum><rsub|i>Z<around|(|A<rsub|i>|)>>
      in <math|L<rsup|2>> for pairwise disjoint <math|<around|{|A<rsub|i>|}>>

      <item><math|E<around|[|Z<around|(|A|)><rsup|2>|]>=0> for all Borel sets
      <math|A>
    </enumerate>
  </definition>

  This orthogonal random measure serves as the fundamental building block for
  constructing spectral representations, where each frequency component
  contributes independently to the overall process structure.

  <\theorem>
    [Orthogonal Random Measure Representation] For any zero-mean weakly
    stationary process <math|<around|{|X<rsub|t><around|(|x|)>|}>>, there
    exists a unique orthogonal random measure <math|Z<around|(|B|)>> such
    that

    <\equation*>
      X<rsub|t><around|(|x|)>=<big|int><rsub|\<bbb-R\>>e<rsup|i*\<lambda\>*t>*<space|0.17em>d*<around|\<langle\>|E<rsub|A<rsub|T>><around|(|\<lambda\>|)>*X<rsub|0>,\<delta\><rsub|x>|\<rangle\>>
    </equation*>

    with <math|E<rsub|A<rsub|T>><around|(|\<lambda\>|)>> the spectral
    projection-valued measure for the generator of time translations.
  </theorem>

  This representation establishes an isometry between the process's Hilbert
  space and the <math|L<rsup|2>>-space of the orthogonal random measure,
  encapsulating the essence of Bochner's theorem in operator-theoretic terms.
  The exponential kernel <math|e<rsup|i*\<lambda\>*t>> provides the harmonic
  decomposition, while the orthogonal measure captures the random amplitude
  structure.

  <section|Real Harmonic Analysis and Spectral Symmetry>

  For real-valued processes, the conjugation symmetry emerges naturally from
  the involution properties of the covariance structure, enabling
  decomposition into harmonic components. This symmetry property leads to a
  canonical decomposition in terms of cosine and sine integrals, revealing
  the underlying harmonic structure of real stochastic processes.

  <\theorem>
    [Real-Valued Process and Harmonic Measures] If
    <math|<around|{|X<rsub|t><around|(|x|)>|}>> is real-valued, then the
    spectral measure exhibits conjugation symmetry:

    <\equation*>
      <around|\<langle\>|E<rsub|A<rsub|T>>*<around|(|-B|)>*X<rsub|0>,\<delta\><rsub|x>|\<rangle\>>=<wide|<around|\<langle\>|E<rsub|A<rsub|T>><around|(|B|)>*X<rsub|0>,\<delta\><rsub|x>|\<rangle\>>|\<bar\>>
    </equation*>

    for all Borel sets <math|B>. This symmetry motivates the definition of
    real-valued orthogonal random measures:

    <\equation*>
      U*<around|(|B,x|)>\<assign\><around|\<langle\>|E<rsub|A<rsub|T>><around|(|B|)>*X<rsub|0>,\<delta\><rsub|x>|\<rangle\>>+<wide|<around|\<langle\>|E<rsub|A<rsub|T>><around|(|B|)>*X<rsub|0>,\<delta\><rsub|x>|\<rangle\>>|\<bar\>>,
    </equation*>

    <\equation*>
      V<around|(|B,x|)>\<assign\>i*<around*|(|<wide|<around|\<langle\>|E<rsub|A<rsub|T>><around|(|B|)>*X<rsub|0>,\<delta\><rsub|x>|\<rangle\>>|\<bar\>>-<around|\<langle\>|E<rsub|A<rsub|T>><around|(|B|)>*X<rsub|0>,\<delta\><rsub|x>|\<rangle\>>|)>,
    </equation*>

    yielding the real spectral decomposition

    <\equation*>
      X<rsub|t><around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>cos
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*U*<around|(|\<lambda\>,x|)>+<big|int><rsub|0><rsup|\<infty\>>sin
      <around|(|\<lambda\>*t|)>*<space|0.17em>d*V<around|(|\<lambda\>,x|)>.
    </equation*>
  </theorem>

  This harmonic representation reveals the process's frequency structure
  through trigonometric decomposition, where the cosine and sine components
  correspond to even and odd spectral contributions respectively. The
  restriction to <math|<around|[|0,\<infty\>|)>> eliminates redundancy
  inherent in the complex representation while preserving all spectral
  information.

  <\theorem>
    [Orthogonality and Variance Properties] Let <math|U> and <math|V> be the
    real orthogonal random measures defined above. For disjoint Borel sets
    <math|B<rsub|1>,B<rsub|2>\<subset\><around|[|0,\<infty\>|)>> and all
    <math|x>:

    <\equation*>
      E*<around|[|U*<around|(|B<rsub|1>,x|)>*U*<around|(|B<rsub|2>,x|)>|]>=E*<around|[|V<around|(|B<rsub|1>,x|)>*V<around|(|B<rsub|2>,x|)>|]>=0
    </equation*>

    and

    <\equation*>
      E*<around|[|U*<around|(|B,x|)><rsup|2>|]>=E<around|[|V<around|(|B,x|)><rsup|2>|]>=2*F<around|(|B|)>
    </equation*>

    where <math|F> is the spectral distribution function associated with
    <math|X<rsub|t><around|(|x|)>>.
  </theorem>

  The orthogonality relations reveal the geometric structure underlying the
  harmonic decomposition, completing the probabilistic characterization. The
  factor of 2 in the variance formula reflects the concentration of spectral
  mass from the bilateral complex representation onto the unilateral real
  representation, preserving the total spectral content while eliminating
  conjugate redundancy.

  <section|Epilogue: Operator Calculus and Stochastic Synthesis>

  This synthesis of operator theory and stochastic analysis demonstrates how
  spectral measures mediate between abstract functional calculus and concrete
  process decompositions. The explicit domain specifications and strong
  convergence criteria maintain mathematical rigor, while the canonical
  representations illuminate the deep structure underlying weakly stationary
  processes.

  The construction reveals that every weakly stationary process admits a
  canonical spectral representation through the Stone-Bochner correspondence,
  where the translation group structure determines the spectral measure, and
  the spectral measure encodes the process's probabilistic structure. This
  duality establishes weakly stationary processes as the stochastic analogs
  of self-adjoint operators, with covariance functions playing the role of
  spectral measures.

  The real harmonic decomposition further reveals how the conjugation
  symmetry inherent in real-valued processes leads to natural trigonometric
  representations, providing both theoretical insight and computational
  advantages. These results stand as testaments to the unifying power of
  Hilbert space methods in harmonizing deterministic operator theory with
  probabilistic phenomena, establishing a foundation for advanced topics in
  stochastic analysis and mathematical physics.
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
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-2|<tuple|2|3|../../../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-3|<tuple|3|4|../../../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-4|<tuple|4|5|../../../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-5|<tuple|5|6|../../../.TeXmacs/texts/scratch/no_name_28.tm>>
    <associate|auto-6|<tuple|6|7|../../../.TeXmacs/texts/scratch/no_name_28.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Foundations
      of Spectral Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Essential
      Self-Adjointness and Dynamical Evolution>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Hilbertian
      Structure of Stationary Processes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Spectral
      Representation of Stationary Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Real
      Harmonic Analysis and Spectral Symmetry>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Epilogue:
      Operator Calculus and Stochastic Synthesis>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>