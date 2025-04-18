<TeXmacs|2.1.4>

<style|<tuple|generic|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Contractive Containment, Stationary Dilations, and
  Partial Isometries: Equivalence, Properties, and Geometric
  Intuition>|<doc-author|<author-data|<author-name|Stephen Andrew
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Preliminaries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Main
    Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Structure
    Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Convergence
    Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Partial
    Isometries: The Mathematical Scalpel>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section|Preliminaries>

  <\definition>
    <strong|[Hilbert Space Contraction] >A bounded linear operator
    <math|T:H<rsub|1>\<to\>H<rsub|2>> between Hilbert spaces is called a
    contraction if

    <\equation>
      <around|\<\|\|\>|T*x|\<\|\|\>><rsub|H<rsub|2>>\<leq\><around|\<\|\|\>|x|\<\|\|\>><rsub|H<rsub|1>><space|1em>\<forall\>x\<in\>H<rsub|1>
    </equation>

    Equivalently, <math|<around|\<\|\|\>|T|\<\|\|\>>\<leq\>1>.
  </definition>

  <\definition>
    <strong|[Stationary Process]> A stochastic process
    <math|<around|{|Y<around|(|t|)>|}><rsub|t\<in\>\<bbb-R\>>> is stationary
    if for any finite set of time points <math|<around|{|t<rsub|1>,\<ldots\>,t<rsub|n>|}>>
    and any <math|h\<in\>\<bbb-R\>>, the joint distribution of

    <\equation>
      <around|{|Y*<around|(|t<rsub|1>+h|)>,\<ldots\>,Y*<around|(|t<rsub|n>+h|)>|}>
    </equation>

    is identical to that of <math|<around|{|Y<around|(|t<rsub|1>|)>,\<ldots\>,Y<around|(|t<rsub|n>|)>|}>>.
  </definition>

  <\definition>
    <strong|[Stationary Dilation]> Given a non-stationary process
    <math|X<around|(|t|)>>, a stationary dilation is a stationary process
    <math|Y<around|(|s|)>> together with a family of bounded operators
    <math|{\<phi\>(t,\<cdot\><around|)||}><rsub|t\<in\>\<bbb-R\>>> such that

    <\equation>
      X<around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<phi\><around|(|t,s|)>*Y<around|(|s|)>*d*s
    </equation>

    where <math|\<phi\><around|(|t,s|)>> is a measurable function satisfying:

    <\enumerate>
      <item><math|\<\|\|\>\<phi\>(t,\<cdot\><around|)||\<\|\|\>><rsub|\<infty\>>\<leq\>1>
      for all <math|t>

      <item>The map <math|t\<mapsto\>\<phi\><around|(|t,\<cdot\>|)>> is
      strongly continuous
    </enumerate>
  </definition>

  <\remark>
    The conditions on <math|\<phi\><around|(|t,s|)>> ensure that the integral
    is well-defined and the resulting process <math|X<around|(|t|)>> inherits
    appropriate regularity properties from <math|Y<around|(|s|)>>.
  </remark>

  <section|Main Results>

  <\proposition>
    <strong|[Properties of Scaling Function] >The scaling function
    <math|\<phi\><around|(|t,s|)>> in a stationary dilation satisfies:

    <\enumerate>
      <item><math|<around|\<\|\|\>|\<phi\><around|(|t,s|)>|\<\|\|\>>\<leq\>1>
      for all <math|t,s\<in\>\<bbb-R\>>

      <item>For fixed <math|t>, <math|s\<mapsto\>\<phi\><around|(|t,s|)>> is
      measurable

      <item>For fixed <math|s>, <math|t\<mapsto\>\<phi\><around|(|t,s|)>> is
      continuous
    </enumerate>
  </proposition>

  <\theorem>
    <strong|[Equivalence of Containment]> For a non-stationary process
    <math|X<around|(|t|)>> and a stationary process <math|Y<around|(|s|)>>,
    the following are equivalent:

    <\itemize>
      <item><math|Y<around|(|s|)>> is a stationary dilation of
      <math|X<around|(|t|)>>

      <item>There exists a contractive mapping <math|\<Phi\>> from the space
      generated by <math|Y> to the space generated by <math|X> such that

      <\equation>
        X<around|(|t|)>=<around|(|\<Phi\>*Y|)><around|(|t|)>\<forall\>t
      </equation>
    </itemize>
  </theorem>

  <\proof>
    (<math|1\<Rightarrow\>2>): Define <math|\<Phi\>> by

    <\equation>
      <around|(|\<Phi\>*Y|)><around|(|t|)>=<big|int><rsub|\<bbb-R\>>\<phi\><around|(|t,s|)>*Y<around|(|s|)>*d*s
    </equation>

    For any finite linear combination <math|<big|sum><rsub|i>\<alpha\><rsub|i>*Y<around|(|t<rsub|i>|)>>:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\<\|\|\>|\<Phi\><around|(|<big|sum><rsub|i>\<alpha\><rsub|i>*Y<around|(|t<rsub|i>|)>|)>|\<\|\|\>><rsup|2>>|<cell|=<around|\<\|\|\>|<big|sum><rsub|i>\<alpha\><rsub|i>*<big|int><rsub|\<bbb-R\>>\<phi\><around|(|t<rsub|i>,s|)>*Y<around|(|s|)>*d*s|\<\|\|\>><rsup|2>>>|<row|<cell|>|<cell|\<leq\><around|\<\|\|\>|<big|sum><rsub|i>\<alpha\><rsub|i>*Y<around|(|t<rsub|i>|)>|\<\|\|\>><rsup|2>>>>>>
    </equation>

    where the inequality follows from the bound on
    <math|<around|\<\|\|\>|\<phi\><around|(|t,s|)>|\<\|\|\>>> and the
    Cauchy-Schwarz inequality.

    (<math|2\<Rightarrow\>1>): The contractive mapping <math|\<Phi\>> induces
    a family of operators <math|\<phi\><around|(|t,s|)>> via the Kernel
    theorem for Hilbert spaces. The stationarity of <math|Y> and the
    contractivity of <math|\<Phi\>> ensure that these operators satisfy the
    required properties.
  </proof>

  <\lemma>
    <strong|[Minimal Dilation Property]> If <math|Y<around|(|s|)>> is a
    minimal stationary dilation of <math|X<around|(|t|)>>, then the scaling
    function <math|\<phi\><around|(|t,s|)>> achieves the bound

    <\equation>
      sup<rsub|t,s><around|\<\|\|\>|\<phi\><around|(|t,s|)>|\<\|\|\>>=1
    </equation>
  </lemma>

  <\proof>
    If <math|sup<rsub|t,s><around|\<\|\|\>|\<phi\><around|(|t,s|)>|\<\|\|\>>\<less\>1>,
    we could construct a smaller dilation by scaling <math|Y<around|(|s|)>>,
    contradicting minimality.
  </proof>

  <section|Structure Theory>

  <\theorem>
    <strong|[Sz.-Nagy Dilation]> For any contraction <math|T> on a Hilbert
    space <math|H>, there exists a minimal unitary dilation <math|U> on a
    larger space <math|K\<supseteq\>H> such that:

    <\equation>
      T<rsup|n>=P<rsub|H>*U<rsup|n>\|<rsub|H><space|1em>\<forall\>n\<geq\>0
    </equation>

    where <math|P<rsub|H>> is the orthogonal projection onto <math|H>.
  </theorem>

  <\lemma>
    <strong|[Defect Operators] >For a contraction <math|T>, the defect
    operators defined by:

    <\equation>
      D<rsub|T>=<sqrt|I-T<rsup|\<ast\>>*T>
    </equation>

    <\equation>
      D<rsub|T<rsup|\<ast\>>>=<sqrt|I-T*T<rsup|\<ast\>>>
    </equation>

    satisfy:

    <\enumerate>
      <item><math|<around|\<\|\|\>|D<rsub|T>|\<\|\|\>>\<leq\>1> and
      <math|<around|\<\|\|\>|D<rsub|T<rsup|\<ast\>>>|\<\|\|\>>\<leq\>1>

      <item><math|D<rsub|T>=0> if and only if <math|T> is an isometry

      <item><math|D<rsub|T<rsup|\<ast\>>>=0> if and only if <math|T> is a
      co-isometry
    </enumerate>
  </lemma>

  <section|Convergence Properties>

  <\theorem>
    <strong|[Strong Convergence]> For a contractive stationary dilation, the
    following limit exists in the strong operator topology:

    <\equation>
      lim<rsub|n\<to\>\<infty\>> T<rsup|n>=P<rsub|k*e*r*<around|(|I-T<rsup|\<ast\>>*T|)>>
    </equation>

    where <math|P<rsub|k*e*r*<around|(|I-T<rsup|\<ast\>>*T|)>>> is the
    orthogonal projection onto the kernel of <math|I-T<rsup|\<ast\>>*T>.
  </theorem>

  <\proof>
    For any <math|x> in the Hilbert space:

    <\enumerate>
      <item>The sequence <math|<around|{|<around|\<\|\|\>|T<rsup|n>*x|\<\|\|\>>|}>>
      is decreasing since <math|T> is a contraction

      <item>It is bounded below by 0

      <item>Therefore, <math|lim<rsub|n\<to\>\<infty\>><around|\<\|\|\>|T<rsup|n>*x|\<\|\|\>>>
      exists

      <item>The limit operator must be the projection onto the space of
      vectors <math|x> satisfying <math|<around|\<\|\|\>|T*x|\<\|\|\>>=<around|\<\|\|\>|x|\<\|\|\>>>

      <item>This space is precisely <math|k*e*r*<around|(|I-T<rsup|\<ast\>>*T|)>>
    </enumerate>
  </proof>

  <\corollary>
    <strong|[Asymptotic Behavior]> If <math|T> is a strict contraction (i.e.,
    <math|<around|\<\|\|\>|T|\<\|\|\>>\<less\>1>), then

    <\equation>
      lim<rsub|n\<to\>\<infty\>> T<rsup|n>=0
    </equation>

    in the strong operator topology.
  </corollary>

  <section|Partial Isometries: The Mathematical Scalpel>

  <\definition>
    <strong|[Partial Isometry]> An operator <math|A> on a Hilbert space
    <math|H> is a partial isometry if <math|A<rsup|\<ast\>>*A> is an
    orthogonal projection.
  </definition>

  <\remark>
    [Geometric Intuition] A partial isometry is like a mathematical scalpel
    that carves out a section of space:

    <\itemize>
      <item>It acts as a perfect rigid motion (isometry) on a specific
      subspace

      <item>It completely annihilates the rest of the space
    </itemize>

    This property makes partial isometries powerful tools for selecting and
    transforming specific parts of a Hilbert space while cleanly disposing of
    the rest.
  </remark>

  <\proposition>
    <strong|[Key Properties of Partial Isometries]> Let <math|A> be a partial
    isometry. Then:

    <\enumerate>
      <item><math|A> is an isometry when restricted to
      <math|<around|(|<text|ker><around*|(|A|)>|)><rsup|\<perp\>>>

      <item><math|A*<around|(|<text|ker><around*|(|A|)>|)><rsup|\<perp\>>=<text|range><around*|(|A|)>>

      <item><math|A<rsup|\<ast\>>> is also a partial isometry

      <item><math|A*A<rsup|\<ast\>>*A=A> and
      <math|A<rsup|\<ast\>>*A*A<rsup|\<ast\>>=A<rsup|\<ast\>>>
    </enumerate>
  </proposition>

  <\theorem>
    <strong|[Geometric Characterization]> For a partial isometry <math|A>:

    <\equation>
      A<rsup|\<ast\>>*A=P<rsub|<around|(|k*e*r*<around*|(|A|)>|)><rsup|\<perp\>>>
    </equation>

    and

    <\equation>
      A*A<rsup|\<ast\>>=P<rsub|r*a*n*ge<around*|(|A|)>>
    </equation>

    where <math|P<rsub|S>> denotes the orthogonal projection onto subspace
    <math|S>.
  </theorem>

  <\proof>
    The action of <math|A> can be decomposed as:

    <\enumerate>
      <item>Project onto <math|<around|(|k*e*r*A|)><rsup|\<perp\>>> (this is
      <math|A<rsup|\<ast\>>*A>)

      <item>Apply a perfect rigid motion to the projected space
    </enumerate>

    This two-step process ensures <math|A<rsup|\<ast\>>*A> is the projection
    onto <math|<around|(|k*e*r*A|)><rsup|\<perp\>>>.
  </proof>

  <\remark>
    [The "Not So Partial" Nature] Despite the name, there's nothing
    incomplete about a partial isometry. It performs a complete operation:

    <\itemize>
      <item>It's a full isometry on its initial space
      <math|<around|(|k*e*r*<around*|(|A|)>|)><rsup|\<perp\>>>

      <item>It perfectly maps this initial space onto its final space
      <math|r*a*n*<around*|(|A|)>>

      <item>It precisely annihilates everything else
    </itemize>

    This makes partial isometries fundamental building blocks in operator
    theory, crucial in polar decompositions, dimension theory of von Neumann
    algebras, and quantum mechanics.
  </remark>
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
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_63.tm>>
    <associate|auto-2|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_63.tm>>
    <associate|auto-3|<tuple|3|3|../.TeXmacs/texts/scratch/no_name_63.tm>>
    <associate|auto-4|<tuple|4|4|../.TeXmacs/texts/scratch/no_name_63.tm>>
    <associate|auto-5|<tuple|5|5|../.TeXmacs/texts/scratch/no_name_63.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Main
      Results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Structure
      Theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Convergence
      Properties> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Partial
      Isometries: The Mathematical Scalpel>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>