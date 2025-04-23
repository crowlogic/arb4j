<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Quantum Field Theory>|<doc-author|<author-data|<author-name|Stanley
  P. Gooder (remixed by Steve)>>>>

  <subsection*|7.1. Canonical Commutation Relations>

  Let us begin with a mathematical description of a single spinless,
  nonrelativistic particle with one degree of freedom. Such a system is
  traditionally described by the Hilbert space
  <math|L<rsup|2><around|(|\<bbb-R\>|)>>. The position operator <math|Q> and
  the momentum operator <math|P> play fundamental roles. The position
  operator <math|Q> is the self-adjoint operator\ 

  <\equation>
    <around|(|Q*\<phi\>|)><around|(|x|)>=x*\<phi\><around|(|x|)>
  </equation>

  with domain

  <\equation>
    <label|eq:domain-q>D<around|(|Q|)>=<around*|{|\<phi\>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>:x*\<phi\><around|(|x|)>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>|}>
  </equation>

  and the momentum operator <math|P> is the self-adjoint operator <math|>

  <\equation>
    P=-i<frac|\<mathd\>|\<mathd\>x>
  </equation>

  \ (we assume <math|\<hbar\>=1> ) whose domain is the set of all absolutely
  continuous functions <math|\<phi\>> on <math|\<bbb-R\>> such that
  <math|\<phi\><rprime|'>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>

  <\equation>
    D<around|(|P|)>=<around|{|\<phi\>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>:\<phi\>*<text|is
    absolutely continuous and >\<phi\><rprime|'>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>|}>
  </equation>

  \ Notice that the Schwartz space <math|\<cal-S\>=\<cal-S\><around|(|\<bbb-R\>|)>>
  satisfies <math|\<cal-S\>\<subseteq\>D<around|(|Q|)>\<cap\>D<around|(|P|)>>
  and that <math|\<cal-S\>> is a dense subspace of
  <math|L<rsup|2><around|(|\<bbb-R\>|)>> which is left invariant by <math|Q>
  and <math|P>. Moreover, it is clear that

  <\equation>
    <label|eq:ccr-heisenberg>Q*P-P*Q=i*I
  </equation>

  on <math|\<cal-S\>>. We call <eqref|eq:ccr-heisenberg> the
  <with|font-shape|italic|Heisenberg form of the canonical commutation
  relations (CCR)>.

  There are other forms of the CCR. Since <math|P> is self-adjoint, the
  operator

  <\equation>
    U<around|(|a|)>=e<rsup|-i*a*P>\<forall\>a\<in\>\<bbb-R\>
  </equation>

  is unitary. In fact, it is well known that for any self-adjoint operator
  <math|P>, the set of operators <math|<around|{|U<around|(|a|)>:a\<in\>\<bbb-R\>|}>>
  forms a one-parameter strongly continuous unitary group. That is,

  <\enumerate>
    <item><math|U<around*|(|a<rsub|1>|)>*U<around*|(|a<rsub|2>|)>=U*<around*|(|a<rsub|1>+a<rsub|2>|)>>
    \<forall\><math|a<rsub|1>,a<rsub|2>\<in\>\<bbb-R\>>

    <item><math|lim<rsub|a\<rightarrow\>a<rsub|0>>
    U<around|(|a|)>*\<phi\>=U<around*|(|a<rsub|0>|)>*\<phi\>>
    \<forall\><math|\<phi\>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>
  </enumerate>

  For this reason, we call <math|a\<mapsto\>U<around|(|a|)>> a unitary
  representation of the additive group <math|\<bbb-R\>>. Using Taylor's
  theorem we see that for all <math|\<phi\>\<in\>\<cal-S\>>

  <\equation>
    <label|eq:taylor-expansion><tabular|<tformat|<table|<row|<cell|e<rsup|-i*a*P>*\<phi\><around|(|x|)>>|<cell|=<big|sum><frac|<around|(|-i*a*P|)><rsup|n>|n!>*\<phi\><around|(|x|)>>>|<row|<cell|>|<cell|=<big|sum><frac|<around|(|-a|)><rsup|n>|n!>*\<phi\><rsup|<around|(|n|)>><around|(|x|)>>>|<row|<cell|>|<cell|=\<phi\>*<around|(|x-a|)>>>>>>
  </equation>

  Extending by continuity we conclude that

  <\equation>
    <label|eq:u-action>U<around|(|a|)>*\<phi\><around|(|x|)>=\<phi\>*<around|(|x-a|)>
  </equation>

  for all <math|\<phi\>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>. Now
  <math|D<around|(|Q|)>> is invariant under <math|U<around|(|a|)>> for every
  <math|a\<in\>\<bbb-R\>>, and for every <math|\<phi\>\<in\>D<around|(|Q|)>>
  we have

  <\equation>
    <label|eq:u-q-u-inverse><tabular|<tformat|<table|<row|<cell|U<around|(|a|)>*Q*U*<around|(|-a|)>*\<phi\><around|(|x|)>>|<cell|=Q*U*<around|(|-a|)>*\<phi\>*<around|(|x-a|)>>>|<row|<cell|>|<cell|=<around|(|x-a|)>*U*<around|(|-a|)>*\<phi\>*<around|(|x-a|)>=<around|(|x-a|)>*\<phi\><around|(|x|)>>>>>>
  </equation>

  Hence, on <math|D<around|(|Q|)>> we have

  <\equation>
    <label|eq:ccr-schrodinger>U<around|(|a|)>*Q*U*<around|(|-a|)>=Q-a*I
  </equation>

  We call <eqref|eq:ccr-schrodinger> the Schrödinger form of the CCR. Since
  <math|Q> is self-adjoint it generates a strongly continuous one-parameter
  unitary group <math|V<around|(|b|)>> given by

  <\equation>
    <label|eq:v-def>V<around|(|b|)>*\<phi\><around|(|x|)>=e<rsup|-i*b*Q<rsub|\<phi\>>><around|(|x|)>=e<rsup|-i*b*x>*\<phi\><around|(|x|)>
  </equation>

  If <math|\<phi\>\<in\>\<cal-S\>,a,b\<in\>\<bbb-R\>> we obtain

  <\equation>
    <label|eq:uv-computation><tabular|<tformat|<table|<row|<cell|U<around|(|a|)>*V<around|(|b|)>*\<phi\><around|(|x|)>>|<cell|=V<around|(|b|)>*\<phi\>*<around|(|x-a|)>=e<rsup|-i*b*<around|(|x-a|)>>*\<phi\>*<around|(|x-a|)>>>|<row|<cell|>|<cell|=e<rsup|i*a*b>*e<rsup|-i*b*x>*\<phi\>*<around|(|x-a|)>=e<rsup|i*a*b>*V<around|(|b|)>*U<around|(|a|)>*\<phi\><around|(|x|)>>>>>>
  </equation>

  Extending this equation to <math|L<rsup|2><around|(|\<bbb-R\>|)>> by
  continuity we conclude that

  <\equation>
    <label|eq:ccr-weyl>U<around|(|a|)>*V<around|(|b|)>=e<rsup|i*a*b>*V<around|(|b|)>*U<around|(|a|)>
  </equation>

  for every <math|a,b\<in\>\<bbb-R\>>. Equation <eqref|eq:ccr-weyl> is called
  the Weyl form of the CCR.

  Let us now approach the subject from an axiomatic point of view as
  Heisenberg did when he introduced matrix mechanics. For a quantum system
  with one degree of freedom we assume that there are two fundamental
  observables, These observables are represented by two self-adjoint
  operators <math|Q> and <math|P> which leave invariant a dense subspace
  <math|D\<subseteq\>L<rsup|2><around|(|\<bbb-R\>|)>> and which satisfy the
  Heisenberg form <eqref|eq:ccr-heisenberg> of the CCR on <math|D>.
  Unfortunately, these conditions do not determine <math|Q> and <math|P>
  uniquely to within a unitary equivalence. To see this, we have already
  observed that <math|Q*\<phi\><around|(|x|)>=x*\<phi\><around|(|x|)>> and
  <math|P*\<phi\><around|(|x|)>=-i*\<phi\><rprime|'><around|(|x|)>> satisfy
  <eqref|eq:ccr-heisenberg>. Now let <math|H<rsub|1>=L<rsup|2><around|(|<around|[|0,1|]>|)>>
  and define the self-adjoint operators <math|Q<rsub|1>> and <math|P<rsub|1>>
  as follows:

  <\equation>
    <label|eq:q1-p1-def><tabular|<tformat|<table|<row|<cell|D<around*|(|Q<rsub|1>|)>=<around*|{|\<phi\>\<in\><with|math-font|cal*|H><rsub|1>:x*\<phi\><around|(|x|)>\<in\><with|math-font|cal*|H><rsub|1>|}><space|1em>>|<cell|Q<rsub|1>*\<phi\><around|(|x|)>=x*\<phi\><around|(|x|)>>>|<row|<cell|D<around*|(|P<rsub|1>|)>=<around*|{|\<phi\>\<in\>H<rsub|1>:\<phi\><around|(|0|)>=\<phi\><around|(|1|)>,\<phi\><rprime|'>\<in\><with|math-font|cal*|F><rsub|1>|}>>|<cell|P<rsub|1>*\<phi\><around|(|x|)>=-i*\<phi\><rprime|'><around|(|x|)>>>>>>
  </equation>

  Then it is easy to see that

  <\equation>
    <label|eq:q1-p1-ccr>Q<rsub|1>*P<rsub|1>-P<rsub|1>*Q<rsub|1>=i*I
  </equation>

  on the dense subspace of <math|<with|math-font|cal*|K><rsub|1>> consisting
  of the infinitely differentiable functions <math|\<phi\>> satisfying
  <math|\<phi\><around|(|0|)>=\<phi\><around|(|1|)>>. But the pair
  <math|<around|(|Q,P|)>> is not unitarily equivalent to the pair (
  <math|Q<rsub|1>,P<rsub|1>> ) since <math|Q> and <math|P> are unbounded with
  purely continuous spectrum, while <math|Q<rsub|1>> is bounded and
  <math|P<rsub|1>> has discrete point spectrum. We thus see that there are
  inequivalent ways of representing the CCR in the Heisenberg form
  <eqref|eq:ccr-heisenberg>.

  The situation is quite different for the Weyl form <eqref|eq:ccr-weyl> of
  the CCR. In this case the von Neumann uniqueness theorem, which we shall
  consider in detail later, takes effect. This theorem states that all
  irreducible [i.e., <math|U<around|(|a|)>*M\<subseteq\>M,V<around|(|b|)>*M\<subseteq\>M,a,b\<in\>\<bbb-R\>>,
  for a closed subspace <math|M> implies <math|M=> <math|<around|{|0|}>> or
  <math|<with|math-font|cal*|H>> ] representations of the Weyl form of the
  CCR for one degree of freedom are unitarily equivalent. Since any
  representation is the direct sum of irreducible representations it follows
  that if <math|U<rsub|1><around|(|a|)>> and <math|V<rsub|1><around|(|b|)>>
  satisfy <eqref|eq:ccr-weyl>, then <math|U<rsub|1><around|(|a|)>> and
  <math|V<rsub|1><around|(|b|)>> must be the direct sum of copies of
  operators of the form\ 

  <\equation>
    U<around|(|a|)>*\<phi\><around|(|x|)>=\<phi\>*<around|(|x-a|)>
  </equation>

  <\equation>
    V<around|(|b|)>*\<phi\><around|(|x|)>=e<rsup|-i*b*x>*\<phi\><around|(|x|)>
  </equation>

  It follows from the above that the Heisenberg and Weyl forms of the CCR are
  not logically equivalent. It can be shown, however, that the Schrödinger
  and the Weyl forms are equivalent. The Weyl form <eqref|eq:ccr-weyl> thus
  enjoys at least two advantages. It is phrased in terms of bounded operators
  and it uniquely determines the operators <math|U<around|(|a|)>> and
  <math|V<around|(|b|)>> to within an equivalence (in the irreducible case).

  We have noted that the Heisenberg form does not have the uniqueness
  property of the Weyl form. We now show that it cannot have the boundedness
  property.

  <\lemma>
    <label|lemma:unbounded>If <math|Q*P-P*Q=i*I>, then at least one of the
    operators <math|Q> or <math|P> must be unbounded.
  </lemma>

  <\proof>
    Suppose, on the contrary, that there exist two bounded operators <math|Q>
    and <math|P> acting on a Hilbert space and satisfying
    <eqref|eq:ccr-heisenberg>. We can assume without loss of generality that
    <math|P> is invertible, for if not we could replace <math|P> by
    <math|P-\<lambda\>*I>, where <math|\<lambda\>\<gtr\><around|\<\|\|\>|P|\<\|\|\>>>,
    without changing the commutation relation. Since

    <\equation>
      <label|eq:pq-spectrum>P*Q-\<alpha\>*I=P*<around|(|Q*P-\<alpha\>*I|)>*P<rsup|-1>
    </equation>

    for all <math|\<alpha\>\<in\>C>, we conclude that the spectrum
    <math|\<sigma\>*<around|(|P*Q|)>=\<sigma\>*<around|(|Q*P|)>>. Since
    <math|P*Q=> <math|Q*P-i*I>, we have

    <\equation>
      <label|eq:pq-qp-spectrum>P*Q-i*<around|(|\<alpha\>-1|)>*I=Q*P-i*\<alpha\>*I
    </equation>

    for every <math|\<alpha\>\<in\>C>. Hence
    <math|i*\<alpha\>\<in\>\<sigma\>*<around|(|Q*P|)>> if and only if
    <math|i*<around|(|\<alpha\>-1|)>\<in\>\<sigma\>*<around|(|P*Q|)>>. Since
    <math|\<sigma\>*<around|(|P*Q|)>\<neq\>\<varnothing\>> it follows that
    there exists an <math|\<alpha\>\<in\>C> such that

    <\equation>
      <label|eq:pq-spectrum-unbounded><around|{|i*<around|(|\<alpha\>+n|)>:n=0,1,2,\<ldots\>|}>\<subseteq\>\<sigma\>*<around|(|P*Q|)>
    </equation>

    Thus <math|\<sigma\>*<around|(|P*Q|)>> is unbounded. This contradicts the
    fact that <math|P*Q> is a bounded operator.
  </proof>

  All that we have said so far can be easily generalized to systems with a
  finite number <math|n> of degrees of freedom. In this case we have
  <math|2*n> operators <math|Q<rsub|1>,\<ldots\>,Q<rsub|n>,P<rsub|1>,\<ldots\>,P<rsub|n>>
  on <math|L<rsup|2><around*|(|\<bbb-R\><rsup|n>|)>> satisfying the
  Heisenberg form of the CCR

  <\equation>
    <label|eq:ccr-heisenberg-n>Q<rsub|\<kappa\>>*P<rsub|j>-P<rsub|j>*Q<rsub|\<kappa\>>=i*\<delta\><rsub|\<kappa\>*j>*I
  </equation>

  For <math|a=<around*|(|a<rsub|1>,\<ldots\>,a<rsub|n>|)>,b=<around*|(|b<rsub|1>,\<ldots\>,b<rsub|n>|)>\<in\>\<bbb-R\><rsup|n>>
  we form the unitary operators <math|U<around|(|a|)>*\<phi\><around|(|x|)>=\<phi\>*<around|(|x-a|)>,V<around|(|b|)>*\<phi\><around|(|x|)>=e<rsup|-i*<around|\<langle\>|b,x|\<rangle\>>>*\<phi\><around|(|x|)>,\<phi\>\<in\>L<rsup|2><around*|(|\<bbb-R\><rsup|n>|)>>.
  As before, <math|U<around|(|a|)>> and <math|V<around|(|b|)>> are unitary
  representations of the additive group <math|\<bbb-R\><rsup|n>> i.e.,
  satisfy (i) and (ii)] and, moreover, the Weyl form of the CCR holds:

  <\equation>
    <label|eq:ccr-weyl-n>U<around|(|a|)>*V<around|(|b|)>=e<rsup|i*<around|\<langle\>|a,b|\<rangle\>>>*V<around|(|b|)>*U<around|(|a|)>
  </equation>

  for every <math|a,b\<in\>\<bbb-R\><rsup|n>>. Again, the von Neumann
  uniqueness theorem states that <eqref|eq:ccr-weyl-n> uniquely determines
  <math|U<around|(|a|)>> and <math|V<around|(|b|)>> to within an equivalence
  (in the irreducible case).
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-heisenberg|<tuple|5|1|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-heisenberg-n|<tuple|21|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-schrodinger|<tuple|10|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-weyl|<tuple|13|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-weyl-n|<tuple|22|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:domain-q|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:pq-qp-spectrum|<tuple|19|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:pq-spectrum|<tuple|18|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:pq-spectrum-unbounded|<tuple|20|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:q1-p1-ccr|<tuple|15|3|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:q1-p1-def|<tuple|14|3|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:taylor-expansion|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:u-action|<tuple|8|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:u-q-u-inverse|<tuple|9|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:uv-computation|<tuple|12|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:v-def|<tuple|11|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|lemma:unbounded|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_1.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <with|par-left|<quote|1tab>|7.1. Canonical Commutation Relations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>
    </associate>
  </collection>
</auxiliary>