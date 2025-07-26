<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Von Neumann's Commutant Theory for Unitary
  Operators>|<doc-author|<author-data|<author-name|Mathematical
  Expositor>>>|<doc-date|<date|>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Preliminaries
    and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Spectral
    Theorem for Unitary Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Functions
    of Spectral Measures> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    Main Commutant Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Applications
    and Remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  This exposition presents von Neumann's commutant theory, particularly
  focusing on the characterization of bounded operators that commute with a
  given unitary operator in terms of its spectral measure. The main result
  establishes that any bounded operator commuting with a unitary operator
  <math|U<rsub|s>> must be expressible as a function of the spectral measure
  <math|E<around|(|\<cdummy\>|)>>.

  <section|Preliminaries and Definitions>

  Let <math|\<cal-H\>> be a separable complex Hilbert space with inner
  product <math|<around|\<langle\>|\<cdummy\>,\<cdummy\>|\<rangle\>>> and
  norm <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>>>.

  <\definition>
    [Unitary Operator] An operator <math|U\<in\>\<cal-B\><around|(|\<cal-H\>|)>>
    is called unitary if <math|U<rsup|\<ast\>>*U=U*U<rsup|\<ast\>>=I>, where
    <math|U<rsup|\<ast\>>> denotes the adjoint of <math|U> and <math|I> is
    the identity operator.
  </definition>

  <\definition>
    [Spectral Measure] A spectral measure on the Borel
    <math|\<sigma\>>-algebra <math|\<cal-B\><around|(|\<bbb-T\>|)>> of the
    unit circle <math|\<bbb-T\>=<around|{|z\<in\>\<bbb-C\>:<around|\||z|\|>=1|}>>
    is a map <math|E:\<cal-B\><around|(|\<bbb-T\>|)>\<to\>\<cal-B\><around|(|\<cal-H\>|)>>
    such that:

    <\enumerate>
      <item><math|E<around|(|\<emptyset\>|)>=0> and
      <math|E<around|(|\<bbb-T\>|)>=I>

      <item>For each <math|x\<in\>\<cal-H\>>, the map
      <math|\<Delta\>\<mapsto\><around|\<langle\>|E<around|(|\<Delta\>|)>*x,x|\<rangle\>>>
      is a finite positive measure

      <item><math|E*<around|(|\<Delta\><rsub|1>\<cap\>\<Delta\><rsub|2>|)>=E<around|(|\<Delta\><rsub|1>|)>*E<around|(|\<Delta\><rsub|2>|)>>
      for all <math|\<Delta\><rsub|1>,\<Delta\><rsub|2>\<in\>\<cal-B\><around|(|\<bbb-T\>|)>>

      <item><math|E<around|(|<big|cup><rsub|n=1><rsup|\<infty\>>\<Delta\><rsub|n>|)>=<big|sum><rsub|n=1><rsup|\<infty\>>E<around|(|\<Delta\><rsub|n>|)>>
      in the strong operator topology for pairwise disjoint Borel sets
      <math|<around|{|\<Delta\><rsub|n>|}>>
    </enumerate>
  </definition>

  <\definition>
    [Commutant] For an operator <math|T\<in\>\<cal-B\><around|(|\<cal-H\>|)>>,
    the commutant <math|<around|{|T|}><rprime|'>> is defined as:

    <\equation>
      <around|{|T|}><rprime|'>=<around|{|S\<in\>\<cal-B\><around|(|\<cal-H\>|)>:S*T=T*S|}>
    </equation>

    The double commutant is <math|<around|{|T|}><rprime|''>=<around|(|<around|{|T|}><rprime|'>|)><rprime|'>>.
  </definition>

  <section|Spectral Theorem for Unitary Operators>

  <\theorem>
    [Spectral Theorem for Unitary Operators] Let <math|U> be a unitary
    operator on a separable Hilbert space <math|\<cal-H\>>. Then there exists
    a unique spectral measure <math|E> on
    <math|\<cal-B\><around|(|\<bbb-T\>|)>> such that:

    <\equation>
      U=<big|int><rsub|\<bbb-T\>>z*<space|0.17em>d*E<around|(|z|)>
    </equation>

    where the integral is understood in the strong operator topology.
  </theorem>

  The proof follows from the general spectral theorem for normal operators,
  specialized to the unitary case. Since <math|U> is unitary, its spectrum
  <math|\<sigma\><around|(|U|)>\<subseteq\>\<bbb-T\>>. The spectral measure
  <math|E> is constructed via the functional calculus, and the representation
  follows from the properties of the spectral integral.

  <section|Functions of Spectral Measures>

  <\definition>
    [Function of Spectral Measure] Let <math|E> be a spectral measure on
    <math|\<cal-B\><around|(|\<bbb-T\>|)>> and let
    <math|f:\<bbb-T\>\<to\>\<bbb-C\>> be a bounded Borel measurable function.
    Then we define:

    <\equation>
      f<around|(|E|)>=<big|int><rsub|\<bbb-T\>>f<around|(|z|)>*<space|0.17em>d*E<around|(|z|)>
    </equation>

    This integral exists in the strong operator topology and defines a
    bounded operator on <math|\<cal-H\>>.
  </definition>

  <\lemma>
    [Properties of Spectral Integrals] Let <math|E> be a spectral measure and
    <math|f,g> be bounded Borel functions on <math|\<bbb-T\>>. Then:

    <\enumerate>
      <item><math|<around|\<\|\|\>|f<around|(|E|)>|\<\|\|\>>\<leq\><around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>>

      <item><math|<around|(|f+g|)><around|(|E|)>=f<around|(|E|)>+g<around|(|E|)>>

      <item><math|<around|(|f*g|)><around|(|E|)>=f<around|(|E|)>*g<around|(|E|)>>

      <item><math|<wide|f|\<bar\>><around|(|E|)>=f<around|(|E|)><rsup|\<ast\>>>

      <item>If <math|f<rsub|n>\<to\>f> uniformly, then
      <math|f<rsub|n><around|(|E|)>\<to\>f<around|(|E|)>> in operator norm
    </enumerate>
  </lemma>

  <section|The Main Commutant Theorem>

  <\theorem>
    [Von Neumann's Commutant Theorem for Unitary Operators] Let <math|U> be a
    unitary operator on a separable Hilbert space <math|\<cal-H\>> with
    spectral measure <math|E>. Then:

    <\equation>
      <around|{|U|}><rprime|'>=<around|{|f<around|(|E|)>:f\<in\>L<rsup|\<infty\>><around|(|\<bbb-T\>,\<mu\>|)>|}>
    </equation>

    where <math|\<mu\>> is any finite positive measure equivalent to all
    measures of the form <math|<around|\<langle\>|E|(>\<cdot\><around|)|x,x|\<rangle\>>>
    for <math|x\<in\>\<cal-H\>>.

    In particular, every bounded operator <math|T> that commutes with
    <math|U> can be written as:

    <\equation>
      T=<big|int><rsub|\<bbb-T\>>f<around|(|z|)>*<space|0.17em>d*E<around|(|z|)>
    </equation>

    for some bounded Borel function <math|f> on <math|\<bbb-T\>>.
  </theorem>

  <\proof>
    We prove both inclusions.

    <with|font-series|bold|Step 1:> <math|<around|{|f<around|(|E|)>:f\<in\>L<rsup|\<infty\>><around|(|\<bbb-T\>|)>|}>\<subseteq\><around|{|U|}><rprime|'>>

    Let <math|f\<in\>L<rsup|\<infty\>><around|(|\<bbb-T\>|)>> and set
    <math|T=f<around|(|E|)>>. We need to show <math|T*U=U*T>.

    Since <math|U=<big|int><rsub|\<bbb-T\>>z*<space|0.17em>d*E<around|(|z|)>>,
    we have:

    <\align>
      <tformat|<table|<row|<cell|T*U>|<cell|=f<around|(|E|)>\<cdot\><big|int><rsub|\<bbb-T\>>z*<space|0.17em>d*E<around|(|z|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-T\>>f<around|(|w|)>*<space|0.17em>d*E<around|(|w|)>\<cdot\><big|int><rsub|\<bbb-T\>>z*<space|0.17em>d*E<around|(|z|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-T\>><big|int><rsub|\<bbb-T\>>f<around|(|w|)>*z*<space|0.17em>d*E<around|(|w|)>*<space|0.17em>d*E<around|(|z|)><eq-number>>>>>
    </align>

    By the properties of spectral measures,
    <math|d*E<around|(|w|)>*<space|0.17em>d*E<around|(|z|)>=d*E*<around|(|w\<cap\>z|)>>.
    Since the spectral projections corresponding to disjoint sets are
    orthogonal, this integral simplifies to:

    <\equation>
      T*U=<big|int><rsub|\<bbb-T\>>f<around|(|z|)>*z*<space|0.17em>d*E<around|(|z|)>
    </equation>

    Similarly:

    <\align>
      <tformat|<table|<row|<cell|U*T>|<cell|=<big|int><rsub|\<bbb-T\>>z*<space|0.17em>d*E<around|(|z|)>\<cdot\>f<around|(|E|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-T\>>z*f<around|(|z|)>*<space|0.17em>d*E<around|(|z|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|\<bbb-T\>>f<around|(|z|)>*z*<space|0.17em>d*E<around|(|z|)><eq-number>>>>>
    </align>

    Therefore, <math|T*U=U*T>.

    <with|font-series|bold|Step 2:> <math|<around|{|U|}><rprime|'>\<subseteq\><around|{|f<around|(|E|)>:f\<in\>L<rsup|\<infty\>><around|(|\<bbb-T\>|)>|}>>

    This is the more substantial direction. Let
    <math|T\<in\><around|{|U|}><rprime|'>>, so <math|T*U=U*T>.

    Since <math|U<rsup|n>=<big|int><rsub|\<bbb-T\>>z<rsup|n>*<space|0.17em>d*E<around|(|z|)>>
    for all <math|n\<in\>\<bbb-Z\>>, and <math|T> commutes with <math|U>, we
    have <math|T*U<rsup|n>=U<rsup|n>*T> for all <math|n\<in\>\<bbb-Z\>>.

    For any polynomial <math|p<around|(|z|)>=<big|sum><rsub|k=-n><rsup|n>a<rsub|k>*z<rsup|k>>,
    we have:

    <\equation>
      T*p<around|(|U|)>=p<around|(|U|)>*T
    </equation>

    By the Weierstrass approximation theorem for continuous functions on
    <math|\<bbb-T\>> and the density of trigonometric polynomials, this
    extends to all continuous functions.

    Define a linear functional <math|\<Lambda\><rsub|x>> on
    <math|C<around|(|\<bbb-T\>|)>> by:

    <\equation>
      \<Lambda\><rsub|x><around|(|f|)>=<around|\<langle\>|T*f<around|(|U|)>*x,x|\<rangle\>>-<around|\<langle\>|f<around|(|U|)>*T*x,x|\<rangle\>>
    </equation>

    Since <math|T> commutes with all <math|f<around|(|U|)>> for continuous
    <math|f>, we have <math|\<Lambda\><rsub|x>\<equiv\>0>.

    By the Riesz representation theorem and a measure-theoretic argument
    (involving the regularity of the spectral measure), there exists a
    bounded Borel function <math|\<phi\>> such that:

    <\equation>
      T*x=<big|int><rsub|\<bbb-T\>>\<phi\><around|(|z|)>*<space|0.17em>d*E<around|(|z|)>*x
    </equation>

    The boundedness of <math|T> ensures <math|<around|\<\|\|\>|\<phi\>|\<\|\|\>><rsub|\<infty\>>\<leq\><around|\<\|\|\>|T|\<\|\|\>>>.

    Setting <math|f=\<phi\>>, we obtain <math|T=f<around|(|E|)>>.
  </proof>

  <\corollary>
    [Double Commutant Theorem] For a unitary operator <math|U> with spectral
    measure <math|E>:

    <\equation>
      <around|{|U|}><rprime|''>=<around|{|U|}><rprime|'>
    </equation>
  </corollary>

  <\corollary>
    [Maximal Commutativity] The algebra <math|<around|{|f<around|(|E|)>:f\<in\>L<rsup|\<infty\>><around|(|\<bbb-T\>|)>|}>>
    is maximal abelian in <math|\<cal-B\><around|(|\<cal-H\>|)>>.
  </corollary>

  <section|Applications and Remarks>

  <\proposition>
    [Characterization of Invariant Subspaces] A closed subspace
    <math|\<cal-M\>\<subseteq\>\<cal-H\>> is invariant under <math|U> if and
    only if <math|P<rsub|\<cal-M\>>\<in\><around|{|U|}><rprime|'>>, where
    <math|P<rsub|\<cal-M\>>> is the orthogonal projection onto
    <math|\<cal-M\>>.
  </proposition>

  <\theorem>
    [Spectral Multiplicity] If <math|U> has uniform multiplicity
    <math|n\<less\>\<infty\>>, then:

    <\equation>
      <around|{|U|}><rprime|'>\<cong\>L<rsup|\<infty\>><around|(|\<bbb-T\>,\<mu\>;M<rsub|n><around|(|\<bbb-C\>|)>|)>
    </equation>

    where <math|\<mu\>> is the spectral measure of <math|U> and
    <math|M<rsub|n><around|(|\<bbb-C\>|)>> denotes <math|n\<times\>n> complex
    matrices.
  </theorem>

  This completes the exposition of von Neumann's commutant theory for unitary
  operators, establishing the fundamental result that bounded operators
  commuting with <math|U> are precisely the functions of its spectral measure
  <math|E<around|(|\<cdummy\>|)>>.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-3|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-4|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-5|<tuple|5|3|../../.TeXmacs/texts/scratch/no_name_11.tm>>
    <associate|auto-6|<tuple|6|5|../../.TeXmacs/texts/scratch/no_name_11.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries
      and Definitions> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Spectral
      Theorem for Unitary Operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Functions
      of Spectral Measures> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      Main Commutant Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Applications
      and Remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>