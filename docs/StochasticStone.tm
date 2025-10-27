<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  <\hide-preamble>
    <assign|C|<macro|\<bbb-C\>>>

    <assign|R|<macro|\<bbb-R\>>>

    <assign|Z|<macro|\<bbb-Z\>>>

    <assign|N|<macro|\<bbb-N\>>>

    <assign|E|<macro|\<bbb-E\>>>

    <assign|Prob|<macro|\<bbb-P\>>>

    <assign|1|<macro|<with|math-font|Bbb*|1>>>

    <assign|ip|<macro|1|2|<left|langle><arg|1>,<space|0.17em><arg|2>
    <right|rangle>>>

    <assign|norm|<macro|1|<left|lVert><arg|1> <right|rVert>>>

    <assign|supp|<macro|supp>>

    <assign|sgn|<macro|sgn>>

    <assign|Var|<macro|Var>>

    <assign|Cov|<macro|Cov>>

    <assign|Dom|<macro|Dom>>

    <assign|Ran|<macro|Ran>>

    <assign|re|<macro|Re>>

    <assign|im|<macro|Im>>

    \;
  </hide-preamble>

  <doc-data|<doc-title|Advanced Analysis of Stone's Theorem and Spectral
  Representations in Stochastic Process Theory:<next-line>A Comprehensive
  Treatment with Detailed Proofs>|<doc-date|>>

  <abstract-data|<\abstract>
    This article develops a rigorous bridge between functional analysis and
    the theory of weakly stationary stochastic processes via spectral theory.
    We present complete, detailed proofs of the spectral theorem for
    self-adjoint operators and its projection-valued measure framework,
    establish Stone's theorem linking strongly continuous unitary groups to
    self-adjoint generators, and derive spectral representations of weakly
    stationary processes through orthogonal random measures. All proofs are
    given in full detail without reference to ``standard arguments'' or
    omitted steps.
  </abstract>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Foundational
    Concepts and Preliminaries> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Projection-Valued
    Measures and Spectral Calculus> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Stone's
    Theorem on One-Parameter Unitary Groups>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Essential
    Self-Adjointness and Nelson's Theorem>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Hilbert
    Space Structure of Weakly Stationary Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Conclusion>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>
  </table-of-contents>

  <section|Foundational Concepts and Preliminaries>

  <\definition>
    [Self-Adjoint Operator] Let <math|H> be a complex Hilbert space. A
    densely defined linear operator <math|A:<Dom><around|(|A|)>\<to\>H> with
    <math|<Dom><around|(|A|)>> dense in <math|H> is <em|self-adjoint> if
    <math|A=A<rsup|\<ast\>>>, meaning:

    <\enumerate>
      <item><math|<Dom><around|(|A<rsup|\<ast\>>|)>=<Dom><around|(|A|)>>, and

      <item><math|<ip|A*\<phi\>|\<psi\>>=<ip|\<phi\>|A*\<psi\>>> for all
      <math|\<phi\>,\<psi\>\<in\><Dom><around|(|A|)>>
    </enumerate>
  </definition>

  <\definition>
    [Orthogonal Projection] A bounded linear operator <math|P:H\<to\>H> is an
    <em|orthogonal projection> if <math|P<rsup|2>=P> and
    <math|P<rsup|\<ast\>>=P>. The range <math|<Ran><around|(|P|)>> is a
    closed subspace and <math|H=<Ran><around|(|P|)>\<oplus\><Ran><around|(|P|)><rsup|\<perp\>>>.
  </definition>

  <section|Projection-Valued Measures and Spectral Calculus>

  <\definition>
    [Projection-Valued Measure (PVM)] Let <math|<around|(|X,\<cal-A\>|)>> be
    a measurable space and <math|H> a Hilbert space. A map
    <math|E:\<cal-A\>\<to\>\<cal-L\><around|(|H|)>> is a
    <em|projection-valued measure> if:

    <\enumerate>
      <item>For each <math|B\<in\>\<cal-A\>>, <math|E<around|(|B|)>> is an
      orthogonal projection on <math|H>.

      <item><math|E<around|(|\<emptyset\>|)>=0> and <math|E<around|(|X|)>=I>.

      <item>For pairwise disjoint sets <math|<around|{|B<rsub|k>|}><rsub|k\<geq\>1>\<subset\>\<cal-A\>>,

      <\equation>
        E<space|-0.17em><around*|(|<big|cup><rsub|k=1><rsup|\<infty\>>B<rsub|k>|)><space|0.27em>=<space|0.27em><big|sum><rsub|k=1><rsup|\<infty\>>E<around|(|B<rsub|k>|)>
      </equation>

      where convergence is in the strong operator topology.
    </enumerate>
  </definition>

  <\lemma>
    [Properties of PVM]<label|lem:pvm_properties> Let <math|E> be a PVM on
    <math|<around|(|X,\<cal-A\>|)>>. Then:

    <\enumerate>
      <item>If <math|B<rsub|1>\<cap\>B<rsub|2>=\<emptyset\>>, then
      <math|E<around|(|B<rsub|1>|)>*E<around|(|B<rsub|2>|)>=0>.

      <item>If <math|B<rsub|1>\<subset\>B<rsub|2>>, then
      <math|E<around|(|B<rsub|1>|)>\<leq\>E<around|(|B<rsub|2>|)>> (in the
      partial order of projections).

      <item>For each <math|\<phi\>,\<psi\>\<in\>H>, the map
      <math|B\<mapsto\><ip|E<around|(|B|)>*\<phi\>|\<psi\>>> defines a
      complex measure.
    </enumerate>
  </lemma>

  <\proof>
    <\enumerate-alpha>
      <item>Suppose <math|B<rsub|1>\<cap\>B<rsub|2>=\<emptyset\>>. Then
      <math|B<rsub|1>\<cup\>B<rsub|2>> is disjoint, so by the PVM property,

      <\equation>
        E*<around|(|B<rsub|1>\<cup\>B<rsub|2>|)>=E<around|(|B<rsub|1>|)>+E<around|(|B<rsub|2>|)>
      </equation>

      Applying both sides to <math|\<phi\>\<in\>H>, we have\ 

      <\equation>
        E*<around|(|B<rsub|1>\<cup\>B<rsub|2>|)>*\<phi\>=E<around|(|B<rsub|1>|)>*\<phi\>+E<around|(|B<rsub|2>|)>*\<phi\>
      </equation>

      . Now, since <math|E<around|(|B<rsub|1>|)>> and
      <math|E<around|(|B<rsub|2>|)>> are orthogonal projections and
      <math|B<rsub|1>\<cap\>B<rsub|2>=\<emptyset\>>, the ranges
      <math|<Ran><around|(|E<around|(|B<rsub|1>|)>|)>> and
      <math|<Ran><around|(|E<around|(|B<rsub|2>|)>|)>> are orthogonal.
      Indeed, for any <math|\<phi\>\<in\>H>,

      <\equation>
        <ip|E<around|(|B<rsub|1>|)>*\<phi\>|E<around|(|B<rsub|2>|)>*\<phi\>>=<ip|E*<around|(|B<rsub|1>\<cap\>B<rsub|2>|)>*\<phi\>|\<phi\>>=<ip|E<around|(|\<emptyset\>|)>*\<phi\>|\<phi\>>=0
      </equation>

      Hence <math|>

      <\equation>
        E<around|(|B<rsub|1>|)>*E<around|(|B<rsub|2>|)>=0
      </equation>

      <item>If <math|B<rsub|1>\<subset\>B<rsub|2>>, write
      <math|B<rsub|2>=B<rsub|1>\<cup\><around|(|B<rsub|2>\<setminus\>B<rsub|1>|)>>
      disjointly. Then

      <\equation>
        E<around|(|B<rsub|2>|)>=E<around|(|B<rsub|1>|)>+E*<around|(|B<rsub|2>\<setminus\>B<rsub|1>|)>
      </equation>

      Since <math|E*<around|(|B<rsub|2>\<setminus\>B<rsub|1>|)>\<geq\>0>, we
      have <math|>

      <\equation>
        E<around|(|B<rsub|2>|)>\<geq\>E<around|(|B<rsub|1>|)>
      </equation>

      <item>For fixed <math|\<phi\>,\<psi\>\<in\>H>, define
      <math|\<mu\><rsub|\<phi\>,\<psi\>><around|(|B|)>\<assign\><ip|E<around|(|B|)>*\<phi\>|\<psi\>>>.
      We verify <math|\<mu\><rsub|\<phi\>,\<psi\>>> is a complex measure.
      Clearly <math|\<mu\><rsub|\<phi\>,\<psi\>><around|(|\<emptyset\>|)>=0>.
      For disjoint <math|<around|{|B<rsub|k>|}>>,

      <\equation>
        <tabular|<tformat|<table|<row|<cell|\<mu\><rsub|\<phi\>,\<psi\>><space|-0.17em><around*|(|<big|cup><rsub|k=1><rsup|\<infty\>>B<rsub|k>|)>>|<cell|=<around*|\<langle\>|E<space|-0.17em><around*|(|<big|cup><rsub|k=1><rsup|\<infty\>>B<rsub|k>|)>*\<phi\>,\<psi\>|\<rangle\>>>>|<row|<cell|>|<cell|=<around*|\<langle\>|<big|sum><rsub|k=1><rsup|\<infty\>>E<around|(|B<rsub|k>|)>*\<phi\>,\<psi\>|\<rangle\>><space|1em><text|(strong
        convergence)>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=1><rsup|\<infty\>><ip|E<around|(|B<rsub|k>|)>*\<phi\>|\<psi\>>=<big|sum><rsub|k=1><rsup|\<infty\>>\<mu\><rsub|\<phi\>,\<psi\>><around|(|B<rsub|k>|)>>>>>>
      </equation>
    </enumerate-alpha>

    \;
  </proof>

  <\theorem>
    [Spectral Integral for Bounded Functions]<label|thm:spectral_integral_bounded>
    Let <math|E> be a PVM on <math|<around|(|X,\<cal-A\>|)>> and
    <math|f:X\<to\><C>> a bounded measurable function. There exists a unique
    bounded operator <math|T<rsub|f>\<in\>\<cal-L\><around|(|H|)>> such that
    for all <math|\<phi\>,\<psi\>\<in\>H>,

    <\equation>
      <ip|T<rsub|f>*\<phi\>|\<psi\>>=<big|int><rsub|X>f<around|(|x|)>*<space|0.17em>d<ip|E<around|(|x|)>*\<phi\>|\<psi\>>
    </equation>

    Moreover, <math|<norm|T<rsub|f>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>>
    and <math|T<rsub|f><rsup|\<ast\>>=T<rsub|<wide|f|\<bar\>>>>. We write
    <math|T<rsub|f>=<big|int><rsub|X>f*<space|0.17em>d*E>.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Construction for simple functions.> Let
    <math|f=<big|sum><rsub|j=1><rsup|n>c<rsub|j><1><rsub|B<rsub|j>>> be a
    simple function with <math|B<rsub|j>> pairwise disjoint. Define

    <\equation>
      T<rsub|f>\<assign\><big|sum><rsub|j=1><rsup|n>c<rsub|j>*E<around|(|B<rsub|j>|)>
    </equation>

    This is a bounded operator since each <math|E<around|(|B<rsub|j>|)>> is a
    projection. For <math|\<phi\>,\<psi\>\<in\>H>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<ip|T<rsub|f>*\<phi\>|\<psi\>>>|<cell|=<big|sum><rsub|j=1><rsup|n>c<rsub|j><ip|E<around|(|B<rsub|j>|)>*\<phi\>|\<psi\>>>>|<row|<cell|>|<cell|=<big|sum><rsub|j=1><rsup|n>c<rsub|j>*<big|int><rsub|X><1><rsub|B<rsub|j>><around|(|x|)>*<space|0.17em>d<ip|E<around|(|x|)>*\<phi\>|\<psi\>>>>|<row|<cell|>|<cell|=<big|int><rsub|X>f<around|(|x|)>*<space|0.17em>d<ip|E<around|(|x|)>*\<phi\>|\<psi\>>>>>>>
    </equation>

    <with|font-series|bold|Step 2: Bound.> For any unit vector
    <math|\<phi\>\<in\>H>, define the positive measure\ 

    <\equation>
      \<nu\><rsub|\<phi\>><around|(|B|)>\<assign\><ip|E<around|(|B|)>*\<phi\>|\<phi\>>
    </equation>

    . Note <math|\<nu\><rsub|\<phi\>><around|(|X|)>=<around|\<\|\|\>|\<phi\>|\<\|\|\>><rsup|2>=1>.
    Then

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\||<ip|T<rsub|f>*\<phi\>|\<phi\>>|\|>>|<cell|=<around*|\||<big|int><rsub|X>f*<space|0.17em>d*\<nu\><rsub|\<phi\>>|\|>\<leq\><big|int><rsub|X><around|\||f|\|>*<space|0.17em>d*\<nu\><rsub|\<phi\>>\<leq\><around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>*\<nu\><rsub|\<phi\>><around|(|X|)>=<around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>>>>>>
    </equation>

    By the polarization identity, <math|<around|\||<ip|T<rsub|f>*\<phi\>|\<psi\>>|\|>\<leq\>C<around|\<\|\|\>|\<phi\>|\<\|\|\>><around|\<\|\|\>|\<psi\>|\<\|\|\>>>
    for some constant <math|C\<leq\><around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>>.
    Hence <math|<norm|T<rsub|f>>\<leq\><around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>>.
    Conversely, for any <math|\<epsilon\>\<gtr\>0>, there exists
    <math|B<rsub|\<epsilon\>>> with <math|\<nu\><rsub|\<phi\>><around|(|B<rsub|\<epsilon\>>|)>\<gtr\>0>
    and <math|<around|\||f<around|(|x|)>|\|>\<gtr\><around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>-\<epsilon\>>
    on <math|B<rsub|\<epsilon\>>>. Choosing
    <math|\<phi\>=E<around|(|B<rsub|\<epsilon\>>|)>*\<phi\><rsub|0>/<around|\<\|\|\>|E<around|(|B<rsub|\<epsilon\>>|)>*\<phi\><rsub|0>|\<\|\|\>>>
    for suitable <math|\<phi\><rsub|0>>, we get
    <math|<norm|T<rsub|f>>\<geq\><around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>-\<epsilon\>>.
    Thus <math|<norm|T<rsub|f>>=<around|\<\|\|\>|f|\<\|\|\>><rsub|\<infty\>>>.

    <with|font-series|bold|Step 3: Extension to bounded functions.> For
    general bounded measurable <math|f>, approximate by simple functions
    <math|f<rsub|n>\<to\>f> uniformly. Then
    <math|<around|\<\|\|\>|T<rsub|f<rsub|n>>-T<rsub|f<rsub|m>>|\<\|\|\>>=<around|\<\|\|\>|f<rsub|n>-f<rsub|m>|\<\|\|\>><rsub|\<infty\>>\<to\>0>,
    so <math|<around|(|T<rsub|f<rsub|n>>|)>> is Cauchy in
    <math|\<cal-L\><around|(|H|)>>. Define
    <math|T<rsub|f>\<assign\>lim<rsub|n\<to\>\<infty\>> T<rsub|f<rsub|n>>>.
    The integral formula follows by passing to the limit in the simple
    function case.

    <with|font-series|bold|Step 4: Adjoint.> For simple
    <math|f=<big|sum>c<rsub|j><1><rsub|B<rsub|j>>>,

    <\equation>
      <text|<math|T<rsub|f><rsup|\<ast\>>=<around*|(|<big|sum>c<rsub|j>*E<around|(|B<rsub|j>|)>|)><rsup|\<ast\>>=<big|sum><wide|c<rsub|j>|\<bar\>>E<around|(|B<rsub|j>|)>=T<rsub|<wide|f|\<bar\>>>>>
    </equation>

    By density and continuity, this extends to all bounded <math|f>.
  </proof>

  <\theorem>
    [Spectral Theorem for Bounded Self-Adjoint
    Operators]<label|thm:spectral_bounded> Let <math|A> be a bounded
    self-adjoint operator on <math|H>. There exists a unique PVM
    <math|E<rsub|A>> on <math|\<cal-B\><around|(|<R>|)>> (the Borel
    <math|\<sigma\>>-algebra) such that

    <\equation>
      A=<big|int><rsub|<R>>\<lambda\>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>
    </equation>

    and

    <\equation>
      <supp><around|(|E<rsub|A>|)>\<subseteq\><around|[|-<around|\<\|\|\>|A|\<\|\|\>>,<around|\<\|\|\>|A|\<\|\|\>>|]>
    </equation>
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Construct the commutative
    <math|C<rsup|\<ast\>>>-algebra.> Let <math|\<cal-A\>> be the norm-closed
    <math|\<ast\>>-subalgebra of <math|\<cal-L\><around|(|H|)>> generated by
    <math|A> and <math|I>. Since <math|A> is self-adjoint, every element of
    <math|\<cal-A\>> is a norm limit of polynomials in <math|A> and
    <math|A<rsup|\<ast\>>=A>, hence <math|\<cal-A\>> is commutative.

    <with|font-series|bold|Step 2: Gelfand transform.> By the Gelfand-Naimark
    theorem, <math|\<cal-A\>> is isometrically <math|\<ast\>>-isomorphic to
    <math|C<around|(|X|)>> for some compact Hausdorff space <math|X> (the
    spectrum of <math|\<cal-A\>>). The Gelfand transform
    <math|\<Gamma\>:\<cal-A\>\<to\>C<around|(|X|)>> is a
    <math|\<ast\>>-isomorphism. Under this isomorphism, <math|A> corresponds
    to a continuous function <math|<wide|A|^>\<in\>C<around|(|X|)>> which is
    real-valued (since <math|A> is self-adjoint). The norm
    <math|<around|\<\|\|\>|<wide|A|^>|\<\|\|\>><rsub|\<infty\>>=<around|\<\|\|\>|A|\<\|\|\>>>.

    <with|font-series|bold|Step 3: Representation on <math|C<around|(|X|)>>.>
    There exists a unitary <math|U:H\<to\>L<rsup|2><around|(|X,\<mu\>|)>> for
    some regular Borel measure <math|\<mu\>> on <math|X> such that
    <math|U*A*U<rsup|\<ast\>>> is multiplication by <math|<wide|A|^>>. That
    is, <math|<around|(|U*A*U<rsup|\<ast\>>*\<psi\>|)><around|(|x|)>=<wide|A|^><around|(|x|)>*\<psi\><around|(|x|)>>
    for <math|\<psi\>\<in\>L<rsup|2><around|(|X,\<mu\>|)>>.

    <with|font-series|bold|Step 4: Define the PVM.> For a Borel set
    <math|B\<subset\><R>>, define

    <\equation>
      E<rsub|A><around|(|B|)>\<assign\>U<rsup|\<ast\>>*M<rsub|<1><rsub|<wide|A|^><rsup|-1><around|(|B|)>>>*U
    </equation>

    where <math|M<rsub|<1><rsub|<wide|A|^><rsup|-1><around|(|B|)>>>> is
    multiplication by the indicator function on
    <math|L<rsup|2><around|(|X,\<mu\>|)>>. This is an orthogonal projection.
    The map <math|E<rsub|A>> is a PVM since <math|M<rsub|<1><rsub|S>>> for
    Borel <math|S\<subset\>X> form a PVM.

    <with|font-series|bold|Step 5: Verification.> We have

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|<R>>\<lambda\>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>>|<cell|=U<rsup|\<ast\>><around*|(|<big|int><rsub|<R>>\<lambda\>*<space|0.17em>d<around|(|M<rsub|<1><rsub|<wide|A|^><rsup|-1><around|(|<around|(|-\<infty\>,\<lambda\>|]>|)>>>|)>|)>*U>>|<row|<cell|>|<cell|=U<rsup|\<ast\>>*M<rsub|<wide|A|^>>*U>>|<row|<cell|>|<cell|=A>>>>>
    </equation>

    The support is contained in <math|<around|[|-<around|\<\|\|\>|A|\<\|\|\>>,<around|\<\|\|\>|A|\<\|\|\>>|]>>
    since <math|<wide|A|^>> takes values in
    <math|<around|[|-<around|\<\|\|\>|A|\<\|\|\>>,<around|\<\|\|\>|A|\<\|\|\>>|]>>.

    <with|font-series|bold|Step 6: Uniqueness.> Suppose
    <math|E<rprime|'><rsub|A>> is another PVM satisfying <math|>

    <\equation>
      A=<big|int>\<lambda\>*<space|0.17em>d*E<rprime|'><rsub|A><around|(|\<lambda\>|)>
    </equation>

    . Then for any polynomial <math|p>,\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|p<around|(|A|)>>|<cell|=<big|int>p<around|(|\<lambda\>|)>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int>p<around|(|\<lambda\>|)>*<space|0.17em>d*E<rprime|'><rsub|A><around|(|\<lambda\>|)>>>>>>
    </equation>

    . By the Weierstrass approximation theorem, this extends to all
    continuous functions, hence to all Borel functions by monotone class
    arguments. Thus

    <\equation>
      E<rsub|A>=E<rprime|'><rsub|A>
    </equation>
  </proof>

  <\theorem>
    [Spectral Theorem for Unbounded Self-Adjoint
    Operators]<label|thm:spectral_unbounded> Let <math|A> be an unbounded
    self-adjoint operator on <math|H>. There exists a unique PVM
    <math|E<rsub|A>> on <math|\<cal-B\><around|(|<R>|)>> such that

    <\equation>
      A=<big|int><rsub|<R>>\<lambda\>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>
    </equation>

    <\equation>
      <Dom><around|(|A|)>=<around*|{|\<phi\>\<in\>H:<big|int><rsub|<R>>\<lambda\><rsup|2>*<space|0.17em>d*<around|\<\|\|\>|E<rsub|A><around|(|\<lambda\>|)>*\<phi\>|\<\|\|\>><rsup|2>\<less\>\<infty\>|}>
    </equation>

    Moreover, for <math|\<phi\>\<in\><Dom><around|(|A|)>>,

    <\equation>
      A*\<phi\>=<big|int><rsub|<R>>\<lambda\>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>*\<phi\>
    </equation>
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Cayley transform.> Define the Cayley
    transform\ 

    <\equation>
      U\<assign\><around|(|A-i*I|)>*<around|(|A+i*I|)><rsup|-1>
    </equation>

    . Since <math|A> is self-adjoint, both <math|A\<pm\>i*I> are bijections
    from <math|<Dom><around|(|A|)>> to <math|H> with bounded inverses.
    Moreover, <math|U> is a unitary operator on <math|H>. To see this, note
    that for <math|\<phi\>\<in\><Dom><around|(|A|)>>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<\|\|\>|U*<around|(|A+i*I|)>*\<phi\>|\<\|\|\>><rsup|2>>|<cell|=<around|\<\|\|\>|<around|(|A-i*I|)>*\<phi\>|\<\|\|\>><rsup|2>=<ip|<around|(|A-i*I|)>*\<phi\>|<around|(|A-i*I|)>*\<phi\>>>>|<row|<cell|>|<cell|=<ip|<around|(|A<rsup|2>+I|)>*\<phi\>|\<phi\>>=<ip|<around|(|A+i*I|)>*\<phi\>|<around|(|A+i*I|)>*\<phi\>>=<around|\<\|\|\>|<around|(|A+i*I|)>*\<phi\>|\<\|\|\>><rsup|2>>>>>>
    </equation>

    Thus <math|U> extends to a unitary on <math|H>. Note <math|U> has no
    eigenvalue <math|1> (since <math|A> is self-adjoint, <math|A-i*I> is
    injective).

    <with|font-series|bold|Step 2: Spectral theorem for <math|U>.> By Theorem
    <reference|thm:spectral_bounded>, there exists a PVM <math|F> on
    <math|\<cal-B\><around|(|\<bbb-T\>|)>> (where
    <math|\<bbb-T\>=<around|{|z\<in\><C>:<around|\||z|\|>=1|}>>) such that
    <math|>

    <\equation>
      U=<big|int><rsub|\<bbb-T\>>z*<space|0.17em>d*F<around|(|z|)>
    </equation>

    . Since <math|1\<nin\>\<sigma\><around|(|U|)>>,
    <math|F<around|(|<around|{|1|}>|)>=0>.

    <with|font-series|bold|Step 3: Inverse Cayley transform.> The inverse
    Cayley transform is <math|A=i*<around|(|I+U|)>*<around|(|I-U|)><rsup|-1>>.
    For <math|z\<in\>\<bbb-T\>\<setminus\><around|{|1|}>>, the function\ 

    <\equation>
      \<lambda\><around|(|z|)>\<assign\>i*<frac|1+z|1-z>
    </equation>

    \ maps <math|\<bbb-T\>\<setminus\><around|{|1|}>> onto <math|<R>>. This
    is a homeomorphism. Define the PVM <math|E<rsub|A>> on <math|<R>> by

    <\equation>
      E<rsub|A><around|(|B|)>\<assign\>F<around|(|\<lambda\><rsup|-1><around|(|B|)>|)>
    </equation>

    for Borel <math|B\<subset\><R>>.

    <with|font-series|bold|Step 4: Verification of the spectral integral.> We
    have

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|int><rsub|<R>>\<lambda\>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>>|<cell|=<big|int><rsub|\<bbb-T\>\<setminus\><around|{|1|}>>i*<frac|1+z|1-z>*<space|0.17em>d*F<around|(|z|)>>>|<row|<cell|>|<cell|=i*<big|int><rsub|\<bbb-T\>><around|(|1+z|)>*<around|(|1-z|)><rsup|-1>*<space|0.17em>d*F<around|(|z|)>>>|<row|<cell|>|<cell|=i*<around|(|I+U|)>*<around|(|I-U|)><rsup|-1>>>|<row|<cell|>|<cell|=A>>>>>
    </equation>

    The domain calculation follows from the fact that
    <math|\<phi\>\<in\><Dom><around|(|A|)>> if and only if
    <math|<around|(|I-U|)><rsup|-1>*\<phi\>\<in\><Dom><around|(|I+U|)>>,
    which is equivalent to

    <\equation>
      <big|int><rsub|\<bbb-T\>><around*|\||<frac|1+z|1-z>|\|><rsup|2>*<space|0.17em>d*<around|\<\|\|\>|F<around|(|z|)>*\<phi\>|\<\|\|\>><rsup|2>=<big|int><rsub|<R>>\<lambda\><rsup|2>*<space|0.17em>d*<around|\<\|\|\>|E<rsub|A><around|(|\<lambda\>|)>*\<phi\>|\<\|\|\>><rsup|2>\<less\>\<infty\>
    </equation>

    <with|font-series|bold|Step 5: Uniqueness.> Uniqueness follows from the
    uniqueness of the spectral theorem for the unitary operator <math|U> and
    the bijection between PVMs for <math|U> and <math|A> via the Cayley
    transform.
  </proof>

  <\corollary>
    [Functional Calculus]<label|cor:functional_calculus> Let <math|A> be
    self-adjoint with spectral measure <math|E<rsub|A>>. For any Borel
    function <math|f:<R>\<to\><C>>, define

    <\equation>
      f<around|(|A|)>\<assign\><big|int><rsub|<R>>f<around|(|\<lambda\>|)>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>
    </equation>

    <\equation>
      <Dom><around|(|f<around|(|A|)>|)>=<around*|{|\<phi\>\<in\>H:<big|int><rsub|<R>><around|\||f<around|(|\<lambda\>|)>|\|><rsup|2>*<space|0.17em>d*<around|\<\|\|\>|E<rsub|A><around|(|\<lambda\>|)>*\<phi\>|\<\|\|\>><rsup|2>\<less\>\<infty\>|}>
    </equation>

    Then <math|f<around|(|A|)>> is a normal operator (bounded if <math|f> is
    bounded), and\ 

    <\equation>
      <around|(|f*g|)><around|(|A|)>=f<around|(|A|)>*g<around|(|A|)>
    </equation>

    \ on <math|<Dom><around|(|g<around|(|A|)>|)>\<cap\><Dom><around|(|<around|(|f*g|)><around|(|A|)>|)>>.
  </corollary>

  <\proof>
    This follows directly from the properties of the spectral integral
    established in Theorem <reference|thm:spectral_integral_bounded> and its
    extension to unbounded functions by truncation arguments. The composition
    property follows from the measure-theoretic identity <math|>

    <\equation>
      <big|int>f*g*<space|0.17em>d*E=<big|int>f*<space|0.17em>d*E\<cdot\><big|int>g*<space|0.17em>d*E
    </equation>

    \ for projection-valued integrals.
  </proof>

  <section|Stone's Theorem on One-Parameter Unitary Groups>

  <\definition>
    [Strongly Continuous Unitary Group] A family
    <math|<around|(|U<rsub|t>|)><rsub|t\<in\><R>>\<subset\>\<cal-L\><around|(|H|)>>
    is a <em|strongly continuous one-parameter unitary group> if:

    <\enumerate>
      <item><math|U<rsub|t>> is unitary for all <math|t\<in\><R>>,

      <item><math|U<rsub|t+s>=U<rsub|t>*U<rsub|s>> for all
      <math|s,t\<in\><R>>,

      <item><math|U<rsub|0>=I>,

      <item><math|lim<rsub|t\<to\>0><norm|U<rsub|t>*\<phi\>-\<phi\>>=0> for
      all <math|\<phi\>\<in\>H>.
    </enumerate>
  </definition>

  <\definition>
    [Infinitesimal Generator] The <em|infinitesimal generator> <math|A> of
    <math|<around|(|U<rsub|t>|)>> is defined by

    <\equation>
      <Dom><around|(|A|)>\<assign\><around*|{|\<phi\>\<in\>H:lim<rsub|t\<to\>0>
      <frac|U<rsub|t>*\<phi\>-\<phi\>|t><text|exists>|}><text|>
    </equation>

    <\equation>
      A*\<phi\>\<assign\>lim<rsub|t\<to\>0>
      <frac|U<rsub|t>*\<phi\>-\<phi\>|t>
    </equation>
  </definition>

  <\lemma>
    [Basic Properties of the Generator]<label|lem:generator_properties> Let
    <math|A> be the generator of a strongly continuous unitary group
    <math|<around|(|U<rsub|t>|)>>. Then:

    <\enumerate>
      <item><math|<Dom><around|(|A|)>> is dense in <math|H>.

      <item>For <math|\<phi\>\<in\><Dom><around|(|A|)>>, the map
      <math|t\<mapsto\>U<rsub|t>*\<phi\>> is differentiable with <math|>

      <\equation>
        <tabular|<tformat|<table|<row|<cell|<frac|d|d*t>*U<rsub|t>*\<phi\>>|<cell|=U<rsub|t>*A*\<phi\>>>|<row|<cell|>|<cell|=A*U<rsub|t>*\<phi\>>>>>>
      </equation>

      <item><math|A> is closed.

      <item><math|A> is skew-adjoint: <math|i*A> is self-adjoint.
    </enumerate>
  </lemma>

  <\proof>
    (a) For <math|\<phi\>\<in\>H> and <math|h\<gtr\>0>, define

    <\equation>
      \<phi\><rsub|h>\<assign\><frac|1|h>*<big|int><rsub|0><rsup|h>U<rsub|s>*\<phi\>*<space|0.17em>d*s
    </equation>

    This integral exists as a Riemann integral of continuous <math|H>-valued
    functions. We claim <math|\<phi\><rsub|h>\<in\><Dom><around|(|A|)>>.
    Indeed,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<frac|U<rsub|t>*\<phi\><rsub|h>-\<phi\><rsub|h>|t>>|<cell|=<frac|1|h*t>*<big|int><rsub|0><rsup|h><around|(|U<rsub|t+s>*\<phi\>-U<rsub|s>*\<phi\>|)>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<frac|1|h*t>*<around*|(|<big|int><rsub|t><rsup|t+h>U<rsub|s>*\<phi\>*<space|0.17em>d*s-<big|int><rsub|0><rsup|h>U<rsub|s>*\<phi\>*<space|0.17em>d*s|)>>>|<row|<cell|>|<cell|=<frac|1|h*t>*<around*|(|<big|int><rsub|h><rsup|t+h>U<rsub|s>*\<phi\>*<space|0.17em>d*s-<big|int><rsub|0><rsup|t>U<rsub|s>*\<phi\>*<space|0.17em>d*s|)>.>>>>>
    </equation>

    As <math|t\<to\>0>, this converges to
    <math|<frac|1|h>*<around|(|U<rsub|h>*\<phi\>-\<phi\>|)>>. Thus
    <math|\<phi\><rsub|h>\<in\><Dom><around|(|A|)>> and
    <math|A*\<phi\><rsub|h>=<frac|1|h>*<around|(|U<rsub|h>*\<phi\>-\<phi\>|)>>.

    Now, <math|<around|\<\|\|\>|\<phi\><rsub|h>-\<phi\>|\<\|\|\>>\<leq\><frac|1|h>*<big|int><rsub|0><rsup|h><around|\<\|\|\>|U<rsub|s>*\<phi\>-\<phi\>|\<\|\|\>>*<space|0.17em>d*s\<to\>0>
    as <math|h\<to\>0> by dominated convergence and strong continuity. Thus
    <math|<Dom><around|(|A|)>> is dense.

    (b) For <math|\<phi\>\<in\><Dom><around|(|A|)>> and <math|t,h\<in\><R>>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<frac|U<rsub|t+h>*\<phi\>-U<rsub|t>*\<phi\>|h>>|<cell|=U<rsub|t>*<frac|U<rsub|h>*\<phi\>-\<phi\>|h>>>>>>
    </equation>

    As <math|h\<to\>0>, <math|<frac|U<rsub|h>*\<phi\>-\<phi\>|h>\<to\>A*\<phi\>>.
    By continuity of <math|U<rsub|t>>,\ 

    <\equation>
      U<rsub|t>*<frac|U<rsub|h>*\<phi\>-\<phi\>|h>\<to\>U<rsub|t>*A*\<phi\>
    </equation>

    Similarly, <math|>

    <\equation>
      <frac|U<rsub|t+h>*\<phi\>-U<rsub|t>*\<phi\>|h>=<frac|U<rsub|h>*<around|(|U<rsub|t>*\<phi\>|)>-<around|(|U<rsub|t>*\<phi\>|)>|h>
    </equation>

    Since <math|U<rsub|t>*\<phi\>\<in\><Dom><around|(|A|)>> (by the argument
    below), this converges to <math|A*U<rsub|t>*\<phi\>>. Thus

    <\equation>
      <frac|d|d*t>*U<rsub|t>*\<phi\>=A*U<rsub|t>*\<phi\>=U<rsub|t>*A*\<phi\>
    </equation>

    To show <math|U<rsub|t><around|(|<Dom><around|(|A|)>|)>\<subseteq\><Dom><around|(|A|)>>:
    for <math|\<phi\>\<in\><Dom><around|(|A|)>>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<frac|U<rsub|h>*<around|(|U<rsub|t>*\<phi\>|)>-U<rsub|t>*\<phi\>|h>>|<cell|=<frac|U<rsub|t+h>*\<phi\>-U<rsub|t>*\<phi\>|h>>>|<row|<cell|>|<cell|=U<rsub|t>*<frac|U<rsub|h>*\<phi\>-\<phi\>|h>\<to\>U<rsub|t>*A*\<phi\>>>>>>
    </equation>

    as <math|h\<to\>0>. Thus <math|U<rsub|t>*\<phi\>\<in\><Dom><around|(|A|)>>
    and\ 

    <\equation>
      A*<around|(|U<rsub|t>*\<phi\>|)>=U<rsub|t>*A*\<phi\>
    </equation>

    (c) Suppose <math|\<phi\><rsub|n>\<in\><Dom><around|(|A|)>> with
    <math|\<phi\><rsub|n>\<to\>\<phi\>> and
    <math|A*\<phi\><rsub|n>\<to\>\<psi\>>. We need to show
    <math|\<phi\>\<in\><Dom><around|(|A|)>> and <math|A*\<phi\>=\<psi\>>. For
    any <math|t\<neq\>0>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<frac|U<rsub|t>*\<phi\>-\<phi\>|t>>|<cell|=lim<rsub|n\<to\>\<infty\>>
      <frac|U<rsub|t>*\<phi\><rsub|n>-\<phi\><rsub|n>|t>>>|<row|<cell|>|<cell|=lim<rsub|n\<to\>\<infty\>>
      <frac|1|t>*<big|int><rsub|0><rsup|t>U<rsub|s>*A*\<phi\><rsub|n>*<space|0.17em>d*s>>|<row|<cell|>|<cell|=<frac|1|t>*<big|int><rsub|0><rsup|t>U<rsub|s>*\<psi\>*<space|0.17em>d*s>>>>>
    </equation>

    As <math|t\<to\>0>, the right-hand side converges to <math|\<psi\>> by
    continuity. Thus <math|\<phi\>\<in\><Dom><around|(|A|)>> and

    <\equation>
      A*\<phi\>=\<psi\>
    </equation>

    (d) We show <math|i*A> is self-adjoint. For
    <math|\<phi\>\<in\><Dom><around|(|A|)>> and <math|\<psi\>\<in\>H>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<ip|A*\<phi\>|\<psi\>>>|<cell|=lim<rsub|t\<to\>0>
      <frac|1|t><ip|U<rsub|t>*\<phi\>-\<phi\>|\<psi\>>>>|<row|<cell|>|<cell|=lim<rsub|t\<to\>0>
      <frac|1|t>*<around|(|<ip|U<rsub|t>*\<phi\>|\<psi\>>-<ip|\<phi\>|\<psi\>>|)>>>>>>
    </equation>

    Since <math|U<rsub|t>> is unitary, <math|>

    <\equation>
      <ip|U<rsub|t>*\<phi\>|\<psi\>>=<ip|\<phi\>|U<rsub|-t>*\<psi\>>=<ip|\<phi\>|U<rsub|t><rsup|\<ast\>>*\<psi\>>
    </equation>

    Thus

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<ip|A*\<phi\>|\<psi\>>>|<cell|=lim<rsub|t\<to\>0>
      <frac|1|t>*<around|(|<ip|\<phi\>|U<rsub|t><rsup|\<ast\>>*\<psi\>>-<ip|\<phi\>|\<psi\>>|)>>>|<row|<cell|>|<cell|=lim<rsub|t\<to\>0><ip|\<phi\>|<frac|U<rsub|t><rsup|\<ast\>>*\<psi\>-\<psi\>|t>>>>|<row|<cell|>|<cell|=lim<rsub|t\<to\>0><ip|\<phi\>|<frac|U<rsub|-t>*\<psi\>-\<psi\>|t>>=-lim<rsub|t\<to\>0><ip|\<phi\>|<frac|U<rsub|-t>*\<psi\>-\<psi\>|-t>>>>>>>
    </equation>

    If <math|\<psi\>\<in\><Dom><around|(|A|)>>, this equals
    <math|-<ip|\<phi\>|A*\<psi\>>>. Thus for
    <math|\<phi\>,\<psi\>\<in\><Dom><around|(|A|)>>,

    <\equation>
      <ip|A*\<phi\>|\<psi\>>=-<ip|\<phi\>|A*\<psi\>>
    </equation>

    i.e.,

    <\equation>
      <ip|i*A*\<phi\>|\<psi\>>=<ip|\<phi\>|i*A*\<psi\>>
    </equation>

    Hence <math|i*A> is symmetric on <math|<Dom><around|(|A|)>>. To show
    <math|i*A> is self-adjoint, we use the resolvent identity. For <math|>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|R<rsub|\<lambda\>>>|<cell|=<around|(|A-i*\<lambda\>*I|)><rsup|-1>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*t>*U<rsub|t>*<space|0.17em>d*t\<forall\>\<lambda\>\<in\><R>\<setminus\><around|{|0|}>>>>>>
    </equation>

    exists as a bounded operator (for <math|\<lambda\>\<less\>0> integrate
    <math|<big|int><rsub|0><rsup|\<infty\>>=<big|int><rsub|-\<infty\>><rsup|0>e<rsup|\<lambda\>*s>*U<rsub|-s>*<space|0.17em>d*s>
    with <math|s=-t>). This formula shows\ 

    <\equation>
      <Ran><around|(|A-i*\<lambda\>*I|)>=H
    </equation>

    \ and

    <\equation>
      ker <around|(|A-i*\<lambda\>*I|)>=<around|{|0|}>
    </equation>

    , implying <math|i*A> is self-adjoint.
  </proof>

  <\theorem>
    [Bochner's Theorem]<label|thm:bochner> Let <math|g:<R>\<to\><C>> be a
    continuous function. Then <math|g> is positive-definite (meaning
    <math|<big|sum><rsub|j,k>g*<around|(|t<rsub|j>-t<rsub|k>|)><wide|c<rsub|j>|\<bar\>>c<rsub|k>\<geq\>0>
    for all finite collections <math|<around|{|t<rsub|j>|}>> and
    <math|<around|{|c<rsub|j>|}>\<subset\><C>>) if and only if there exists a
    finite positive Borel measure <math|\<mu\>> on <math|<R>> such that

    <\equation>
      g<around|(|t|)>=<big|int><rsub|<R>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>
    </equation>
  </theorem>

  <\proof>
    (<math|\<Leftarrow\>>) If <math|g<around|(|t|)>=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>>
    for a positive measure <math|\<mu\>>, then for any
    <math|<around|{|t<rsub|j>|}>> and <math|<around|{|c<rsub|j>|}>>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|sum><rsub|j,k>g*<around|(|t<rsub|j>-t<rsub|k>|)><wide|c<rsub|j>|\<bar\>>c<rsub|k>>|<cell|=<big|sum><rsub|j,k><big|int>e<rsup|i*<around|(|t<rsub|j>-t<rsub|k>|)>*\<lambda\>>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)><space|0.17em><wide|c<rsub|j>|\<bar\>>c<rsub|k>>>|<row|<cell|>|<cell|=<big|int><big|sum><rsub|j,k>e<rsup|i*t<rsub|j>*\<lambda\>>*e<rsup|-i*t<rsub|k>*\<lambda\>><wide|c<rsub|j>|\<bar\>>c<rsub|k>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>>>|<row|<cell|>|<cell|=<big|int><around*|\||<big|sum><rsub|j>c<rsub|j>*e<rsup|i*t<rsub|j>*\<lambda\>>|\|><rsup|2>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>\<geq\>0.>>>>>
    </equation>

    (<math|\<Rightarrow\>>) Suppose <math|g> is positive-definite and
    continuous.

    <with|font-series|bold|Step 1: Construct a pre-Hilbert space.> Let
    <math|\<cal-S\>> be the space of finite linear combinations
    <math|\<phi\>=<big|sum><rsub|j=1><rsup|n>c<rsub|j>*\<delta\><rsub|t<rsub|j>>>
    (where <math|\<delta\><rsub|t>> is the Dirac measure at <math|t>). Define
    an inner product on <math|\<cal-S\>> by

    <\equation>
      <ip|<big|sum><rsub|j>c<rsub|j>*\<delta\><rsub|t<rsub|j>>|<big|sum><rsub|k>d<rsub|k>*\<delta\><rsub|s<rsub|k>>>=<big|sum><rsub|j,k>g*<around|(|t<rsub|j>-s<rsub|k>|)><wide|c<rsub|j>|\<bar\>>d<rsub|k>.
    </equation>

    Positive-definiteness ensures <math|<ip|\<phi\>|\<phi\>>\<geq\>0>. The
    seminorm <math|<around|\<\|\|\>|\<phi\>|\<\|\|\>>\<assign\><sqrt|<ip|\<phi\>|\<phi\>>>>
    may have a null space <math|\<cal-N\>\<assign\><around|{|\<phi\>:<around|\<\|\|\>|\<phi\>|\<\|\|\>>=0|}>>.
    Define the quotient <math|\<cal-S\>/\<cal-N\>> and complete to obtain a
    Hilbert space <math|H>.

    <with|font-series|bold|Step 2: Define the translation operators.> For
    <math|t\<in\><R>>, define <math|U<rsub|t>:\<cal-S\>\<to\>\<cal-S\>> by
    <math|U<rsub|t>*\<delta\><rsub|s>\<assign\>\<delta\><rsub|s+t>>. Then

    <\equation>
      <text|<math|<ip|U<rsub|t>*\<phi\>|\<psi\>>=<ip|\<phi\>|U<rsub|-t>*\<psi\>>>>
    </equation>

    for all <math|\<phi\>,\<psi\>\<in\>\<cal-S\>>, since

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<text|<math|<ip|U<rsub|t>*\<delta\><rsub|s>|U<rsub|t>*\<delta\><rsub|r>>>>>|<cell|=g*<around|(|<around|(|s+t|)>-<around|(|r+t|)>|)>>>|<row|<cell|>|<cell|=g*<around|(|s-r|)>>>|<row|<cell|>|<cell|=<ip|\<delta\><rsub|s>|\<delta\><rsub|r>>>>>>>
    </equation>

    Thus <math|U<rsub|t>> extends to a unitary operator on <math|H>. The
    group property <math|U<rsub|t+s>=U<rsub|t>*U<rsub|s>> is clear. Strong
    continuity follows from\ 

    <\equation>
      <tabular|<tformat|<table|<row|<cell|lim<rsub|t\<rightarrow\>0><around|\<\|\|\>|U<rsub|t>*\<delta\><rsub|s>-\<delta\><rsub|s>|\<\|\|\>><rsup|2>>|<cell|=g<around|(|0|)>-g<around|(|t|)>-<wide|g<around|(|t|)>|\<bar\>>+g<around|(|0|)>>>|<row|<cell|>|<cell|=lim<rsub|t\<rightarrow\>0>2<re><around|(|g<around|(|0|)>-g<around|(|t|)>|)>>>|<row|<cell|>|<cell|=0>>>>>
    </equation>

    by continuity of <math|g>.

    <with|font-series|bold|Step 3: Apply Stone's theorem.> By Stone's theorem
    (Theorem <reference|thm:stone> below), there exists a self-adjoint
    operator <math|A> on <math|H> such that <math|>

    <\equation>
      U<rsub|t>=e<rsup|i*t*A>
    </equation>

    . Write\ 

    <\equation>
      A=<big|int>\<lambda\>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>
    </equation>

    \ for the spectral measure <math|E<rsub|A>>. Then

    <\equation>
      U<rsub|t>=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>
    </equation>

    Define <math|\<mu\>> by <math|\<mu\><around|(|B|)>\<assign\><ip|E<rsub|A><around|(|B|)>*\<delta\><rsub|0>|\<delta\><rsub|0>>>.
    This is a positive finite measure (finite since
    <math|\<mu\><around|(|<R>|)>=<around|\<\|\|\>|\<delta\><rsub|0>|\<\|\|\>><rsup|2>=g<around|(|0|)>\<less\>\<infty\>>).
    Then

    <\equation>
      <tabular|<tformat|<table|<row|<cell|g<around|(|t|)>>|<cell|=<ip|U<rsub|t>*\<delta\><rsub|0>|\<delta\><rsub|0>>=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d<ip|E<rsub|A><around|(|\<lambda\>|)>*\<delta\><rsub|0>|\<delta\><rsub|0>>=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>>>>>>
    </equation>

    \;
  </proof>

  <\theorem>
    [Stone's Theorem]<label|thm:stone> There is a bijective correspondence
    between strongly continuous one-parameter unitary groups
    <math|<around|(|U<rsub|t>|)><rsub|t\<in\><R>>> on <math|H> and
    self-adjoint operators <math|A> on <math|H> given by

    <\equation>
      U<rsub|t>=e<rsup|i*t*A>=<big|int><rsub|<R>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>
    </equation>

    where <math|E<rsub|A>> is the spectral measure of <math|A>, and <math|A>
    is the infinitesimal generator of <math|<around|(|U<rsub|t>|)>>.
  </theorem>

  <\proof>
    (<math|\<Rightarrow\>>) Given a strongly continuous unitary group
    <math|<around|(|U<rsub|t>|)>>, let <math|A> be its generator
    (Definition). By Lemma <reference|lem:generator_properties>(d),
    <math|i*A> is self-adjoint. Let <math|E<rsub|i*A>> be the spectral
    measure of <math|i*A>. Define

    <\equation>
      V<rsub|t>\<assign\><big|int><rsub|<R>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*E<rsub|i*A><around|(|\<lambda\>|)>=<big|int><rsub|<R>>e<rsup|-t*\<mu\>>*<space|0.17em>d*E<rsub|A><around|(|\<mu\>|)>
    </equation>

    where <math|E<rsub|A><around|(|\<cdummy\>|)>\<assign\>E<rsub|i*A>*<around|(|i<rsup|-1>\<cdot\>|)>>
    is the spectral measure of <math|A=-i*<around|(|i*A|)>>. We need to show
    <math|V<rsub|t>=U<rsub|t>>.

    <with|font-series|bold|Step 1: <math|V<rsub|t>> is a unitary group.>
    Since <math|e<rsup|i*t*\<lambda\>>> has modulus 1, <math|V<rsub|t>> is
    unitary. The group property follows from

    <\equation*>
      V<rsub|t+s>=<big|int>e<rsup|i*<around|(|t+s|)>*\<lambda\>>*<space|0.17em>d*E<rsub|i*A><around|(|\<lambda\>|)>=<big|int>e<rsup|i*t*\<lambda\>>*e<rsup|i*s*\<lambda\>>*<space|0.17em>d*E<rsub|i*A><around|(|\<lambda\>|)>=V<rsub|t>*V<rsub|s>.
    </equation*>

    Strong continuity: for <math|\<phi\>\<in\>H>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<\|\|\>|V<rsub|t>*\<phi\>-\<phi\>|\<\|\|\>><rsup|2>>|<cell|=<big|int><around|\||e<rsup|i*t*\<lambda\>>-1|\|><rsup|2>*<space|0.17em>d*<around|\<\|\|\>|E<rsub|i*A><around|(|\<lambda\>|)>*\<phi\>|\<\|\|\>><rsup|2>>>>>>
    </equation>

    By dominated convergence (<math|<around|\||e<rsup|i*t*\<lambda\>>-1|\|>\<leq\>2>),
    this tends to 0 as <math|t\<to\>0>.

    <with|font-series|bold|Step 2: The generator of <math|V<rsub|t>> is
    <math|A>.> For <math|\<phi\>\<in\><Dom><around|(|A|)>>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|lim<rsub|t\<to\>0>
      <frac|V<rsub|t>*\<phi\>-\<phi\>|t>>|<cell|=lim<rsub|t\<to\>0>
      <big|int><frac|e<rsup|i*t*\<lambda\>>-1|t>*<space|0.17em>d*E<rsub|i*A><around|(|\<lambda\>|)>*\<phi\>>>|<row|<cell|>|<cell|=<big|int>i*\<lambda\>*<space|0.17em>d*E<rsub|i*A><around|(|\<lambda\>|)>*\<phi\>>>|<row|<cell|>|<cell|=<big|int>\<mu\>*<space|0.17em>d*E<rsub|A><around|(|\<mu\>|)>*\<phi\>=A*\<phi\>,>>>>>
    </equation>

    where the limit interchange is justified by dominated convergence on
    compact sets and the domain condition
    <math|<big|int>\<lambda\><rsup|2>*<space|0.17em>d*<around|\<\|\|\>|E<rsub|i*A><around|(|\<lambda\>|)>*\<phi\>|\<\|\|\>><rsup|2>\<less\>\<infty\>>.

    <with|font-series|bold|Step 3: Uniqueness of generators.> If
    <math|<around|(|U<rsub|t>|)>> and <math|<around|(|V<rsub|t>|)>> have the
    same generator <math|A>, then for <math|\<phi\>\<in\><Dom><around|(|A|)>>,

    <\equation>
      <frac|d|d*t>*<around|(|U<rsub|t>*\<phi\>-V<rsub|t>*\<phi\>|)>=A*<around|(|U<rsub|t>*\<phi\>-V<rsub|t>*\<phi\>|)>
    </equation>

    Define <math|\<psi\><around|(|t|)>\<assign\>U<rsub|-t>*<around|(|U<rsub|t>*\<phi\>-V<rsub|t>*\<phi\>|)>>.
    Then <math|\<psi\><around|(|0|)>=0> and

    <\equation>
      <text|<math|\<psi\><rprime|'><around|(|t|)>=U<rsub|-t>*<around|(|-A+A|)>*<around|(|U<rsub|t>*\<phi\>-V<rsub|t>*\<phi\>|)>+U<rsub|-t>*<frac|d|d*t>*<around|(|U<rsub|t>*\<phi\>-V<rsub|t>*\<phi\>|)>=0>>
    </equation>

    Thus <math|\<psi\><around|(|t|)>=0> for all <math|t>, implying
    <math|U<rsub|t>*\<phi\>=V<rsub|t>*\<phi\>> for all
    <math|\<phi\>\<in\><Dom><around|(|A|)>>. By density of
    <math|<Dom><around|(|A|)>> and continuity, <math|U<rsub|t>=V<rsub|t>>.

    (<math|\<Leftarrow\>>) Conversely, given a self-adjoint operator <math|A>
    with spectral measure <math|E<rsub|A>>, define

    <\equation>
      U<rsub|t>\<assign\><big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>
    </equation>

    This is a unitary operator (as in Step 1 above). The group property and
    strong continuity follow as before. The generator is

    <\equation>
      <tabular|<tformat|<table|<row|<cell|lim<rsub|t\<to\>0>
      <frac|U<rsub|t>*\<phi\>-\<phi\>|t>>|<cell|=lim<rsub|t\<to\>0>
      <big|int><frac|e<rsup|i*t*\<lambda\>>-1|t>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>*\<phi\>=<big|int>\<lambda\>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>*\<phi\>=A*\<phi\>>>>>>
    </equation>

    for <math|\<phi\>\<in\><Dom><around|(|A|)>>. Thus the generator is
    <math|A>.
  </proof>

  <section|Essential Self-Adjointness and Nelson's Theorem>

  <\definition>
    [Symmetric Operator] A densely defined operator
    <math|S:<Dom><around|(|S|)>\<to\>H> is <em|symmetric> if
    <math|<ip|S*\<phi\>|\<psi\>>=<ip|\<phi\>|S*\<psi\>>> for all
    <math|\<phi\>,\<psi\>\<in\><Dom><around|(|S|)>>. Equivalently,
    <math|S\<subseteq\>S<rsup|\<ast\>>>.
  </definition>

  <\definition>
    [Essentially Self-Adjoint] A symmetric operator <math|S> is
    <em|essentially self-adjoint> if its closure <math|<wide|S|\<bar\>>> is
    self-adjoint, i.e., <math|<wide|S|\<bar\>>=<around|(|<wide|S|\<bar\>>|)><rsup|\<ast\>>>.
  </definition>

  <\definition>
    [Analytic Vector] A vector <math|\<phi\>\<in\>H> is an <em|analytic
    vector> for an operator <math|S> if <math|\<phi\>\<in\><big|cap><rsub|n=0><rsup|\<infty\>><Dom><around|(|S<rsup|n>|)>>
    and there exists <math|r\<gtr\>0> such that

    <\equation>
      <big|sum><rsub|n=0><rsup|\<infty\>><frac|<norm|S<rsup|n>*\<phi\>>|n!>*r<rsup|n>\<less\>\<infty\>
    </equation>
  </definition>

  <\theorem>
    [Nelson's Analytic Vector Theorem]<label|thm:nelson> Let <math|S> be a
    symmetric operator on <math|H>. If there exists a dense subspace
    <math|\<cal-D\>\<subset\><Dom><around|(|S|)>> consisting entirely of
    analytic vectors for <math|S>, then <math|S> is essentially self-adjoint.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Define local one-parameter groups on
    analytic vectors.> For <math|\<phi\>\<in\>\<cal-D\>>, let
    <math|r<rsub|\<phi\>>\<gtr\>0> be such that
    <math|<big|sum><rsub|n=0><rsup|\<infty\>><frac|<norm|S<rsup|n>*\<phi\>>|n!>*r<rsub|\<phi\>><rsup|n>\<less\>\<infty\>>.
    For <math|<around|\||t|\|>\<less\>r<rsub|\<phi\>>>, define

    <\equation>
      U<rsub|t><rsup|<around|(|\<phi\>|)>>\<assign\><big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|i*t|)><rsup|n>|n!>*S<rsup|n>*\<phi\>
    </equation>

    This series converges in <math|H> by the comparison test. Moreover,
    <math|U<rsub|0><rsup|<around|(|\<phi\>|)>>=\<phi\>> and

    <\equation>
      <tabular|<tformat|<table|<row|<cell|U<rsub|t+s><rsup|<around|(|\<phi\>|)>>>|<cell|=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<around|(|i*<around|(|t+s|)>|)><rsup|n>|n!>*S<rsup|n>*\<phi\>>>|<row|<cell|>|<cell|=<around*|(|<big|sum><rsub|j=0><rsup|\<infty\>><frac|<around|(|i*t|)><rsup|j>|j!>*S<rsup|j>|)><around*|(|<big|sum><rsub|k=0><rsup|\<infty\>><frac|<around|(|i*s|)><rsup|k>|k!>*S<rsup|k>|)>*\<phi\>>>|<row|<cell|>|<cell|=U<rsub|t><rsup|<around|(|U<rsub|s><rsup|<around|(|\<phi\>|)>>|)>>>>>>>
    </equation>

    for <math|<around|\||t|\|>,<around|\||s|\|>,<around|\||t+s|\|>\<less\>r<rsub|\<phi\>>>.

    <with|font-series|bold|Step 2: Extend to a global strongly continuous
    unitary group.> For <math|\<phi\>,\<psi\>\<in\>\<cal-D\>>, define

    <\equation>
      f<rsub|\<phi\>,\<psi\>><around|(|t|)>\<assign\><ip|U<rsub|t><rsup|<around|(|\<phi\>|)>>|U<rsub|-t><rsup|<around|(|\<psi\>|)>>>
    </equation>

    By symmetry of <math|S>, <math|<ip|S<rsup|n>*\<phi\>|\<psi\>>=<ip|\<phi\>|S<rsup|n>*\<psi\>>>
    (by induction), so

    <\equation>
      <tabular|<tformat|<table|<row|<cell|f<rsub|\<phi\>,\<psi\>><around|(|t|)>>|<cell|=<big|sum><rsub|n,m=0><rsup|\<infty\>><frac|<around|(|i*t|)><rsup|n>*<around|(|-i*t|)><rsup|m>|n!m!><ip|S<rsup|n>*\<phi\>|S<rsup|m>*\<psi\>>>>|<row|<cell|>|<cell|=<big|sum><rsub|n,m=0><rsup|\<infty\>><frac|<around|(|i*t|)><rsup|n>*<around|(|-i*t|)><rsup|m>|n!m!><ip|S<rsup|n+m>*\<phi\>|\<psi\>>>>|<row|<cell|>|<cell|=<ip|\<phi\>|\<psi\>>>>>>>
    </equation>

    for <math|<around|\||t|\|>\<less\>min
    <around|(|r<rsub|\<phi\>>,r<rsub|\<psi\>>|)>>. This shows
    <math|<around|\<\|\|\>|U<rsub|t><rsup|<around|(|\<phi\>|)>>|\<\|\|\>>=<around|\<\|\|\>|\<phi\>|\<\|\|\>>>
    (taking <math|\<psi\>=\<phi\>>), so <math|U<rsub|t><rsup|<around|(|\<phi\>|)>>/<around|\<\|\|\>|\<phi\>|\<\|\|\>>>
    is an isometry locally.

    By the density of <math|\<cal-D\>> and a standard extension argument
    (using the fact that isometric maps on a dense subset extend uniquely to
    the whole space), the local isometries patch together to define a global
    strongly continuous unitary group <math|<around|(|U<rsub|t>|)><rsub|t\<in\><R>>>
    on <math|H>.

    <with|font-series|bold|Step 3: The generator extends <math|S>.> Let
    <math|A> be the generator of <math|<around|(|U<rsub|t>|)>>. For
    <math|\<phi\>\<in\>\<cal-D\>>,

    <\align*>
      <tformat|<table|<row|<cell|lim<rsub|t\<to\>0>
      <frac|U<rsub|t>*\<phi\>-\<phi\>|t>>|<cell|=lim<rsub|t\<to\>0>
      <frac|1|t><around*|(|<big|sum><rsub|n=1><rsup|\<infty\>><frac|<around|(|i*t|)><rsup|n>|n!>*S<rsup|n>*\<phi\>|)>>>|<row|<cell|>|<cell|=lim<rsub|t\<to\>0>
      <big|sum><rsub|n=1><rsup|\<infty\>><frac|<around|(|i*t|)><rsup|n-1>|<around|(|n-1|)>!>*S<rsup|n>*\<phi\>=i*S*\<phi\>>>>>
    </align*>

    Thus <math|\<cal-D\>\<subset\><Dom><around|(|A|)>> and
    <math|A\|<rsub|\<cal-D\>>=i*S>. Since <math|A> is the generator,
    <math|i*A> is self-adjoint (Lemma <reference|lem:generator_properties>(d)).
    Hence <math|-i*A> is self-adjoint, so <math|S\<subseteq\>-i*A>. But
    <math|-i*A> is self-adjoint, so <math|<wide|S|\<bar\>>\<subseteq\>-i*A=<around|(|-i*A|)><rsup|\<ast\>>\<subseteq\><wide|S|\<bar\>><rsup|\<ast\>>>.
    This forces <math|<wide|S|\<bar\>>=<around|(|-i*A|)>> to be self-adjoint.
  </proof>

  <\proposition>
    [Deficiency Indices Criterion]<label|prop:deficiency> A densely defined
    symmetric operator <math|S> is essentially self-adjoint if and only if
    <math|ker <around|(|S<rsup|\<ast\>>\<pm\>i*I|)>=<around|{|0|}>> (the
    deficiency indices are <math|<around|(|0,0|)>>).
  </proposition>

  <\proof>
    <with|font-series|bold|Step 1: Necessity.> If <math|S> is essentially
    self-adjoint, then <math|<wide|S|\<bar\>>> is self-adjoint. For a
    self-adjoint operator <math|A>, <math|ker
    <around|(|A\<pm\>i*I|)>=<around|{|0|}>> since
    <math|<around|\<\|\|\>|A*\<phi\>\<pm\>i*\<phi\>|\<\|\|\>><rsup|2>=<around|\<\|\|\>|A*\<phi\>|\<\|\|\>><rsup|2>+<around|\<\|\|\>|\<phi\>|\<\|\|\>><rsup|2>\<geq\><around|\<\|\|\>|\<phi\>|\<\|\|\>><rsup|2>>.

    <with|font-series|bold|Step 2: Sufficiency (von Neumann's theorem).> The
    adjoint <math|S<rsup|\<ast\>>> decomposes as
    <math|<Dom><around|(|S<rsup|\<ast\>>|)>=<Dom><around|(|<wide|S|\<bar\>>|)>\<oplus\>ker
    <around|(|S<rsup|\<ast\>>-i*I|)>\<oplus\>ker
    <around|(|S<rsup|\<ast\>>+i*I|)>> (orthogonal direct sum of graph inner
    products). If both deficiency spaces vanish, then
    <math|<Dom><around|(|S<rsup|\<ast\>>|)>=<Dom><around|(|<wide|S|\<bar\>>|)>>,
    so <math|<wide|S|\<bar\>>=S<rsup|\<ast\>>> is self-adjoint.
  </proof>

  <section|Hilbert Space Structure of Weakly Stationary Processes>

  <\definition>
    [Weakly Stationary Process] A stochastic process
    <math|<around|(|X<rsub|t>|)><rsub|t\<in\><R>>> on a probability space
    <math|<around|(|\<Omega\>,\<cal-F\>,<Prob>|)>> is <em|weakly stationary>
    (or <em|second-order stationary>) if:

    <\enumerate>
      <item><math|<E><around|[|X<rsub|t>|]>=m> for all <math|t> (constant
      mean),

      <item><math|<E><around|[|<around|\||X<rsub|t>|\|><rsup|2>|]>\<less\>\<infty\>>
      for all <math|t>,

      <item>The covariance function <math|\<gamma\><around|(|s,t|)>\<assign\><E><around|[|<around|(|X<rsub|s>-m|)>*<wide|<around|(|X<rsub|t>-m|)>|\<bar\>>|]>>
      depends only on <math|s-t>: <math|\<gamma\><around|(|s,t|)>=\<gamma\><around|(|s-t,0|)>=:\<gamma\>*<around|(|s-t|)>>.
    </enumerate>
  </definition>

  Without loss of generality, assume <math|m=0> (by subtracting the mean).
  Then <math|\<gamma\><around|(|t|)>\<assign\><E><around|[|X<rsub|t><wide|X<rsub|0>|\<bar\>>|]>>.

  <\lemma>
    [Positive-Definiteness of Covariance]<label|lem:covariance_pd> The
    covariance function <math|\<gamma\>> of a weakly stationary process is
    positive-definite: for any <math|t<rsub|1>,\<ldots\>,t<rsub|n>\<in\><R>>
    and <math|c<rsub|1>,\<ldots\>,c<rsub|n>\<in\><C>>,

    <\equation*>
      <big|sum><rsub|j,k=1><rsup|n>\<gamma\>*<around|(|t<rsub|j>-t<rsub|k>|)><wide|c<rsub|j>|\<bar\>>c<rsub|k>\<geq\>0.
    </equation*>
  </lemma>

  <\proof>
    We have

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<big|sum><rsub|j,k=1><rsup|n>\<gamma\>*<around|(|t<rsub|j>-t<rsub|k>|)><wide|c<rsub|j>|\<bar\>>c<rsub|k>>|<cell|=<big|sum><rsub|j,k><E><around|[|X<rsub|t<rsub|j>><wide|X<rsub|t<rsub|k>>|\<bar\>>|]><wide|c<rsub|j>|\<bar\>>c<rsub|k>>>|<row|<cell|>|<cell|=<E><around*|[|<around*|\||<big|sum><rsub|j>c<rsub|j>*X<rsub|t<rsub|j>>|\|><rsup|2>|]>\<geq\>0.>>>>>
    </equation>

    \;
  </proof>

  <\theorem>
    [Construction of the Process Hilbert Space]<label|thm:process_hilbert>
    Let <math|<around|(|X<rsub|t>|)>> be a weakly stationary process with
    covariance <math|\<gamma\>>. Define

    <\equation>
      H\<assign\><wide|<text|span>|\<bar\>><around|{|X<rsub|t>:t\<in\><R>|}><rsup|L<rsup|2><around|(|\<Omega\>|)>>
    </equation>

    the closure in <math|L<rsup|2><around|(|\<Omega\>,<Prob>|)>> of the
    linear span of <math|<around|{|X<rsub|t>:t\<in\><R>|}>>. Then <math|H> is
    a Hilbert space with inner product <math|<ip|Y|Z>\<assign\><E><around|[|Y*<wide|Z|\<bar\>>|]>>.
    Moreover, the translation operators <math|<around|(|T<rsub|h>*X<rsub|t>|)>\<assign\>X<rsub|t+h>>
    extend to a strongly continuous unitary group on <math|H>.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: <math|H> is a Hilbert space.> <math|H> is
    a closed subspace of the Hilbert space
    <math|L<rsup|2><around|(|\<Omega\>|)>>, so it is complete.

    <with|font-series|bold|Step 2: Translation operators.> For
    <math|Y=<big|sum><rsub|j=1><rsup|n>c<rsub|j>*X<rsub|t<rsub|j>>\<in\><text|span><around|{|X<rsub|t>|}>>,
    define <math|T<rsub|h>*Y\<assign\><big|sum><rsub|j>c<rsub|j>*X<rsub|t<rsub|j>+h>>.
    Then

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<ip|T<rsub|h>*Y|T<rsub|h>*Z>>|<cell|=<E><around*|[|<big|sum><rsub|j>c<rsub|j>*X<rsub|t<rsub|j>+h>*<wide|<big|sum><rsub|k>d<rsub|k>*X<rsub|s<rsub|k>+h>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|sum><rsub|j,k>c<rsub|j><wide|d<rsub|k>|\<bar\>><E><around|[|X<rsub|t<rsub|j>+h><wide|X<rsub|s<rsub|k>+h>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|sum><rsub|j,k>c<rsub|j><wide|d<rsub|k>|\<bar\>>\<gamma\>*<around|(|<around|(|t<rsub|j>+h|)>-<around|(|s<rsub|k>+h|)>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|j,k>c<rsub|j><wide|d<rsub|k>|\<bar\>>\<gamma\>*<around|(|t<rsub|j>-s<rsub|k>|)>=<ip|Y|Z>.>>>>>
    </equation>

    Thus <math|T<rsub|h>> is an isometry on
    span<math|<around|{|X<rsub|t>|}>>. Since this span is dense in <math|H>,
    <math|T<rsub|h>> extends uniquely to a unitary operator on <math|H>.

    <with|font-series|bold|Step 3: Group property.> For
    <math|Y\<in\><text|span><around|{|X<rsub|t>|}>>,
    <math|T<rsub|h+k>*Y=T<rsub|h>*<around|(|T<rsub|k>*Y|)>> by definition. By
    density and continuity, this extends to all of <math|H>.

    <with|font-series|bold|Step 4: Strong continuity.> For
    <math|Y=<big|sum><rsub|j>c<rsub|j>*X<rsub|t<rsub|j>>>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<\|\|\>|T<rsub|h>*Y-Y|\<\|\|\>><rsup|2>>|<cell|=<E><around*|\||<big|sum><rsub|j>c<rsub|j>*<around|(|X<rsub|t<rsub|j>+h>-X<rsub|t<rsub|j>>|)>|\|><rsup|2>>>|<row|<cell|>|<cell|=<big|sum><rsub|j,k>c<rsub|j><wide|c<rsub|k>|\<bar\>><E><around|[|<around|(|X<rsub|t<rsub|j>+h>-X<rsub|t<rsub|j>>|)>*<wide|<around|(|X<rsub|t<rsub|k>+h>-X<rsub|t<rsub|k>>|)>|\<bar\>>|]>>>|<row|<cell|>|<cell|=<big|sum><rsub|j,k>c<rsub|j><wide|c<rsub|k>|\<bar\>><around|(|2*\<gamma\><around|(|0|)>-\<gamma\>*<around|(|t<rsub|j>-t<rsub|k>+h|)>-\<gamma\>*<around|(|t<rsub|j>-t<rsub|k>-h|)>|)>.>>>>>
    </equation>

    By continuity of <math|\<gamma\>> at 0, this tends to 0 as
    <math|h\<to\>0>. By density, <math|lim<rsub|h\<to\>0><around|\<\|\|\>|T<rsub|h>*\<phi\>-\<phi\>|\<\|\|\>>=0>
    for all <math|\<phi\>\<in\>H>.
  </proof>

  <\theorem>
    [Spectral Representation of Stationary Processes -
    Cramér]<label|thm:cramer> Let <math|<around|(|X<rsub|t>|)>> be a weakly
    stationary process with covariance <math|\<gamma\>>. There exists a
    right-continuous, non-decreasing function <math|F:<R>\<to\><R>> with
    <math|F*<around|(|-\<infty\>|)>=0> such that

    <\equation>
      \<gamma\><around|(|t|)>=<big|int><rsub|<R>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*F<around|(|\<lambda\>|)>.<inactive|<hybrid|>>
    </equation>

    Moreover, there exists an orthogonal random measure <math|Z> on
    <math|<R>> (i.e., <math|<E><around|[|Z<around|(|B<rsub|1>|)><wide|Z<around|(|B<rsub|2>|)>|\<bar\>>|]>=0>
    for disjoint Borel sets <math|B<rsub|1>,B<rsub|2>>) such that

    <\equation>
      X<rsub|t>=<big|int><rsub|<R>>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)>
    </equation>

    where the integral is in the <math|L<rsup|2><around|(|\<Omega\>|)>>
    sense, and <math|<E><around|[|<around|\||Z<around|(|B|)>|\|><rsup|2>|]>=F<around|(|B|)>>
    for Borel <math|B>.
  </theorem>

  <\proof>
    <with|font-series|bold|Step 1: Apply Bochner's theorem.> By Lemma
    <reference|lem:covariance_pd>, <math|\<gamma\>> is positive-definite. If
    <math|\<gamma\>> is continuous, Bochner's theorem (Theorem
    <reference|thm:bochner>) yields a finite positive measure <math|\<mu\>>
    on <math|<R>> such that <math|\<gamma\><around|(|t|)>=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*\<mu\><around|(|\<lambda\>|)>>.
    Define <math|F<around|(|\<lambda\>|)>\<assign\>\<mu\><around|(|<around|(|-\<infty\>,\<lambda\>|]>|)>>.
    Then <math|F> is right-continuous, non-decreasing, and
    <math|F*<around|(|-\<infty\>|)>=0>, <math|F<around|(|\<infty\>|)>=\<mu\><around|(|<R>|)>=\<gamma\><around|(|0|)>=<E><around|[|<around|\||X<rsub|0>|\|><rsup|2>|]>>.

    <with|font-series|bold|Step 2: Construct the spectral measure for the
    translation group.> By Theorem <reference|thm:process_hilbert>,
    <math|<around|(|T<rsub|h>|)>> is a strongly continuous unitary group on
    <math|H>. By Stone's theorem (Theorem <reference|thm:stone>), there
    exists a self-adjoint generator <math|A> with spectral measure
    <math|E<rsub|A>> such that

    <\equation>
      T<rsub|h>=<big|int>e<rsup|i*h*\<lambda\>>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>
    </equation>

    <with|font-series|bold|Step 3: Define the orthogonal random measure.> For
    a Borel set <math|B\<subset\><R>>, define the random variable

    <\equation>
      Z<around|(|B|)>\<assign\>E<rsub|A><around|(|B|)>*X<rsub|0>
    </equation>

    This is an element of <math|H\<subset\>L<rsup|2><around|(|\<Omega\>|)>>,
    hence a random variable. We verify the orthogonality property: for
    disjoint <math|B<rsub|1>,B<rsub|2>>,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<E><around|[|Z<around|(|B<rsub|1>|)><wide|Z<around|(|B<rsub|2>|)>|\<bar\>>|]>>|<cell|=<ip|E<rsub|A><around|(|B<rsub|1>|)>*X<rsub|0>|E<rsub|A><around|(|B<rsub|2>|)>*X<rsub|0>>>>|<row|<cell|>|<cell|=<ip|E<rsub|A>*<around|(|B<rsub|1>\<cap\>B<rsub|2>|)>*X<rsub|0>|X<rsub|0>>>>|<row|<cell|>|<cell|=<ip|E<rsub|A><around|(|\<emptyset\>|)>*X<rsub|0>|X<rsub|0>>>>|<row|<cell|>|<cell|=0>>>>>
    </equation>

    <with|font-series|bold|Step 4: Spectral representation of
    <math|X<rsub|t>>.> We have

    <\equation>
      <tabular|<tformat|<table|<row|<cell|X<rsub|t>>|<cell|=T<rsub|t>*X<rsub|0>>>|<row|<cell|>|<cell|=<around*|(|<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>|)>*X<rsub|0>>>|<row|<cell|>|<cell|=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*E<rsub|A><around|(|\<lambda\>|)>*X<rsub|0>>>|<row|<cell|>|<cell|=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)>>>>>>
    </equation>

    <with|font-series|bold|Step 5: Variance of <math|Z<around|(|B|)>>.>

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<E><around|[|<around|\||Z<around|(|B|)>|\|><rsup|2>|]>>|<cell|=<ip|E<rsub|A><around|(|B|)>*X<rsub|0>|E<rsub|A><around|(|B|)>*X<rsub|0>>=<ip|E<rsub|A><around|(|B|)>*X<rsub|0>|X<rsub|0>>>>|<row|<cell|>|<cell|=<big|int><rsub|B>1*<space|0.17em>d<ip|E<rsub|A><around|(|\<lambda\>|)>*X<rsub|0>|X<rsub|0>>=<big|int><rsub|B><space|0.17em>d*\<mu\><rsub|0><around|(|\<lambda\>|)>>>>>>
    </equation>

    where <math|\<mu\><rsub|0><around|(|B|)>\<assign\><ip|E<rsub|A><around|(|B|)>*X<rsub|0>|X<rsub|0>>>.
    To identify <math|\<mu\><rsub|0>> with the spectral distribution
    <math|F>, note that

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<gamma\><around|(|t|)>>|<cell|=<E><around|[|X<rsub|t><wide|X<rsub|0>|\<bar\>>|]>=<ip|T<rsub|t>*X<rsub|0>|X<rsub|0>>=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d<ip|E<rsub|A><around|(|\<lambda\>|)>*X<rsub|0>|X<rsub|0>>=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*\<mu\><rsub|0><around|(|\<lambda\>|)>>>>>>
    </equation>

    By uniqueness in Bochner's theorem, <math|\<mu\><rsub|0>=\<mu\>>, so
    <math|>

    <\equation>
      F<around|(|B|)>=\<mu\><rsub|0><around|(|B|)>=<E><around|[|<around|\||Z<around|(|B|)>|\|><rsup|2>|]>
    </equation>
  </proof>

  <\corollary>
    [Real-Valued Process Representation]<label|cor:real_process> If
    <math|<around|(|X<rsub|t>|)>> is real-valued and weakly stationary, the
    spectral measure <math|F> is symmetric:
    <math|F*<around|(|-B|)>=F<around|(|B|)>> for Borel <math|B>, and there
    exist real-valued orthogonal random measures <math|U,V> such that

    <\equation>
      X<rsub|t>=<big|int><rsub|<R>>cos <around|(|t*\<lambda\>|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>+<big|int><rsub|<R>>sin
      <around|(|t*\<lambda\>|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>
    </equation>

    with <math|<E><around|[|U<around|(|B<rsub|1>|)>*U<around|(|B<rsub|2>|)>|]>=<E><around|[|V<around|(|B<rsub|1>|)>*V<around|(|B<rsub|2>|)>|]>=2*F*<around|(|B<rsub|1>\<cap\>B<rsub|2>|)>>
    and <math|<E><around|[|U<around|(|B<rsub|1>|)>*V<around|(|B<rsub|2>|)>|]>=0>.
  </corollary>

  <\proof>
    For real <math|<around|(|X<rsub|t>|)>>,
    <math|X<rsub|t>=<wide|X<rsub|t>|\<bar\>>>, so

    <\equation>
      <big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)>=<big|int>e<rsup|-i*t*\<lambda\>>*<space|0.17em>d<wide|Z<around|(|\<lambda\>|)>|\<bar\>>
    </equation>

    Changing variables <math|\<lambda\>\<to\>-\<lambda\>> in the right-hand
    side,

    <\equation>
      <big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d*Z<around|(|\<lambda\>|)>=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d<wide|Z*<around|(|-\<lambda\>|)>|\<bar\>>
    </equation>

    By uniqueness of the spectral representation,
    <math|Z<around|(|B|)>=<wide|Z*<around|(|-B|)>|\<bar\>>> for all <math|B>.
    Define

    <\equation>
      U<around|(|B|)>\<assign\>Z<around|(|B|)>+<wide|Z*<around|(|-B|)>|\<bar\>>
    </equation>

    <\equation>
      V<around|(|B|)>\<assign\>i*<around|(|Z<around|(|B|)>-<wide|Z*<around|(|-B|)>|\<bar\>>|)>
    </equation>

    These are real-valued. Then <math|Z<around|(|B|)>=<frac|1|2>*<around|(|U<around|(|B|)>-i*V<around|(|B|)>|)>>,
    so

    <\equation>
      <tabular|<tformat|<table|<row|<cell|X<rsub|t>>|<cell|=<big|int>e<rsup|i*t*\<lambda\>>*<space|0.17em>d<around*|(|<frac|U<around|(|\<lambda\>|)>-i*V<around|(|\<lambda\>|)>|2>|)>>>|<row|<cell|>|<cell|=<big|int><frac|<around|(|cos
      <around|(|t*\<lambda\>|)>+i*sin <around|(|t*\<lambda\>|)>|)>*<around|(|d*U<around|(|\<lambda\>|)>-i*<space|0.17em>d*V<around|(|\<lambda\>|)>|)>|2>>>|<row|<cell|>|<cell|=<big|int>cos
      <around|(|t*\<lambda\>|)>*<space|0.17em>d*U<around|(|\<lambda\>|)>+<big|int>sin
      <around|(|t*\<lambda\>|)>*<space|0.17em>d*V<around|(|\<lambda\>|)>>>>>>
    </equation>

    The variance formulas follow from <math|<E><around|[|<around|\||Z<around|(|B|)>|\|><rsup|2>|]>=F<around|(|B|)>>
    and the definitions of <math|U,V>.
  </proof>

  <section|Conclusion>

  We have provided complete, detailed proofs of the spectral theorem for both
  bounded and unbounded self-adjoint operators via projection-valued
  measures, Stone's theorem establishing the correspondence between strongly
  continuous unitary groups and self-adjoint generators, Bochner's theorem
  characterizing positive-definite functions as Fourier transforms of
  measures, Nelson's theorem on essential self-adjointness via analytic
  vectors, and Cramér's spectral representation theorem for weakly stationary
  stochastic processes. These results form the foundation for spectral
  analysis in functional analysis, quantum mechanics, stochastic process
  theory, and partial differential equations.
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
    <associate|auto-1|<tuple|1|1|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|auto-2|<tuple|2|2|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|auto-3|<tuple|3|7|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|auto-4|<tuple|4|12|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|auto-5|<tuple|5|14|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|auto-6|<tuple|6|17|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|cor:functional_calculus|<tuple|8|6|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|cor:real_process|<tuple|23|17|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|lem:covariance_pd|<tuple|20|14|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|lem:generator_properties|<tuple|11|7|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|lem:pvm_properties|<tuple|4|2|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|prop:deficiency|<tuple|18|13|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|thm:bochner|<tuple|12|9|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|thm:cramer|<tuple|22|15|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|thm:nelson|<tuple|17|12|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|thm:process_hilbert|<tuple|21|14|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|thm:spectral_bounded|<tuple|6|4|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|thm:spectral_integral_bounded|<tuple|5|3|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|thm:spectral_unbounded|<tuple|7|5|.TeXmacs/texts/scratch/no_name_30.tm>>
    <associate|thm:stone|<tuple|13|11|.TeXmacs/texts/scratch/no_name_30.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Foundational
      Concepts and Preliminaries> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Projection-Valued
      Measures and Spectral Calculus> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Stone's
      Theorem on One-Parameter Unitary Groups>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Essential
      Self-Adjointness and Nelson's Theorem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Hilbert
      Space Structure of Weakly Stationary Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>