<TeXmacs|2.1.4>

<style|<tuple|generic|metal|framed-theorems>>

<\body>
  <doc-data|<doc-title|Quantum Field Theory>|<doc-author|<author-data|<author-name|Stanley
  P. Gooder >>>>

  <\table-of-contents|toc>
    <with|par-left|1tab|7.1. Canonical Commutation Relations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1>>

    <with|par-left|1tab|7.2. Quantum Fields
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>>
  </table-of-contents>

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

  <subsection*|7.2. Quantum Fields>

  We now come to some of the mathematical problems of quantum field theory.
  Roughly speaking, a quantum field is a system with infinitely many degrees
  of freedom. We shall need an infinite-dimensional analogue of the Weyl form
  of the CCR given in <eqref|eq:ccr-weyl-n>. In order to state what this
  analogue is we need to introduce some more structure.

  Let <math|<with|math-font|cal*|H>> be a separable real Hilbert space. For
  <math|f\<in\><with|math-font|cal*|H>> we define the unitary operators
  <math|U<around|(|f|)>> and <math|V<around|(|f|)>> on a complex Hilbert
  space <math|<with|math-font|cal*|K>> satisfying

  <\equation>
    <label|eq:ccr-weyl-inf>U<around|(|f|)>*V<around|(|g|)>=e<rsup|i*<around|\<langle\>|f,g|\<rangle\>>>*V<around|(|g|)>*U<around|(|f|)>
  </equation>

  for all <math|f,g\<in\><with|math-font|cal*|H>>. As before,
  <math|U<around|(|f|)>> and <math|V<around|(|g|)>> are strongly continuous
  unitary representations of the additive group
  <math|<with|math-font|cal*|H>>. That is,

  <\enumerate-numeric>
    <item>

    <\equation>
      U<around*|(|f<rsub|1>|)>*U<around*|(|f<rsub|2>|)>=U*<around*|(|f<rsub|1>+f<rsub|2>|)>
    </equation>

    and

    <\equation>
      V<around*|(|g<rsub|1>|)>*V<around*|(|g<rsub|2>|)>=V*<around*|(|g<rsub|1>+g<rsub|2>|)>
    </equation>

    \<forall\><math|f<rsub|1>,f<rsub|2>,g<rsub|1>,g<rsub|2>\<in\><with|math-font|cal*|H>>

    <item>

    <\equation>
      lim<rsub|n\<rightarrow\>\<infty\>> U<around*|(|f<rsub|n>|)>*\<phi\>=U<around|(|f|)>*\<phi\>
    </equation>

    and

    <\equation>
      lim<rsub|n\<rightarrow\>\<infty\>> V<around*|(|g<rsub|n>|)>*\<phi\>=V<around|(|g|)>*\<phi\>
    </equation>

    \<forall\><math|\<phi\>\<in\><with|math-font|cal*|K>> whenever\ 

    <\equation>
      lim<rsub|n\<rightarrow\>\<infty\>> f<rsub|n>=f
    </equation>

    and

    <\equation>
      lim<rsub|n\<rightarrow\>\<infty\>> g<rsub|n>=g
    </equation>

    in <math|<with|math-font|cal*|H>>.
  </enumerate-numeric>

  We now describe three standard examples of quantum fields. For a boson
  field we have <math|<with|math-font|cal*|H>=L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>>,
  and <math|<with|math-font|cal*|K>> is the boson Fock space which we shall
  now define. Let <math|<with|math-font|cal*|K><rsub|0>=\<bbb-C\>> be the
  1-dimensional Hilbert space consisting of all complex numbers, and let
  <math|<with|math-font|cal*|K><rsub|n>=>
  <math|<around*|(|L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>\<otimes\>\<cdots\>\<otimes\>L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>|)><rsup|S>>
  be the <math|n>-fold symmetric tensor product of
  <math|L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>> with itself. The boson Fock
  space is then defined as

  <\equation>
    <label|eq:boson-fock><with|math-font|cal*|K>=<with|math-font|cal*|K><rsub|0>\<oplus\><with|math-font|cal*|K><rsub|1>\<oplus\>\<cdots\>\<oplus\><with|math-font|cal*|K><rsub|n>\<oplus\>\<cdots\>
  </equation>

  Thus a vector <math|\<phi\>\<in\><with|math-font|cal*|K>> is a sequence
  <math|\<phi\>=<around*|(|\<phi\><rsub|0>,\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|n>,\<ldots\>|)>>,
  where <math|\<phi\><rsub|0>\<in\>\<bbb-C\>,\<phi\><rsub|n>\<in\><with|math-font|cal*|K><rsub|n>>,
  and <math|<big|sum><rsub|0><rsup|\<infty\>><around*|\||\<phi\><rsub|n>|\|><rsup|2>\<less\>\<infty\>>.
  The inner product of <math|\<phi\>,\<psi\>\<in\><with|math-font|cal*|K>> is
  given by

  <\equation>
    <label|eq:fock-inner-product><around|\<langle\>|\<phi\>,\<psi\>|\<rangle\>>=<big|sum><rsub|0><rsup|\<infty\>><around*|\<langle\>|\<phi\><rsub|n>,\<psi\><rsub|n>|\<rangle\>>
  </equation>

  The unit vector <math|\<Omega\>=<around|(|1,0,0,\<ldots\>|)>> is called the
  vacuum state, and any vector in <math|<with|math-font|cal*|K>> can be
  approximated arbitrarily closely by (finite) linear combinations of
  multiple applications of the creation operators to the vacuum state. (The
  creation operators will be defined below.) For
  <math|f\<in\><with|math-font|cal*|H>>, the Segal field operator is defined
  by

  <\equation>
    <label|eq:field-operator>\<Phi\><around|(|f|)>=<around|(|Q<around|(|f|)>+P<around|(|f|)>|)>/<sqrt|2>
  </equation>

  where the position operator is

  <\equation>
    Q<around|(|f|)>=a<rsup|\<ast\>><around|(|f|)>+a<around|(|f|)>
  </equation>

  \ and the momentum operator is\ 

  <\equation>
    P<around|(|f|)>=i*<around*|(|a<rsup|\<ast\>><around|(|f|)>-a<around|(|f|)>|)>
  </equation>

  Here, <math|a<rsup|\<ast\>><around|(|f|)>> is the creation operator and
  <math|a<around|(|f|)>> is the annihilation operator. For
  <math|f<rsub|1>,\<ldots\>,f<rsub|n>\<in\>L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>>,
  the creation operator <math|a<rsup|\<ast\>><around|(|f|)>> is defined by

  <\equation>
    <label|eq:creation-op><tabular|<tformat|<table|<row|<cell|a<rsup|\<ast\>><around|(|f|)>*\<Omega\>>|<cell|=<around|(|0,f,0,\<ldots\>|)>>>|<row|<cell|a<rsup|\<ast\>><around|(|f|)><around*|(|0,\<ldots\>,\<phi\><rsub|n>,0,\<ldots\>|)>>|<cell|=<around*|(|0,\<ldots\>,0,S*<around*|(|f\<otimes\>\<phi\><rsub|n>|)>,0,\<ldots\>|)>>>>>>
  </equation>

  where <math|S> is the operator that symmetrizes the tensor product. The
  annihilation operator <math|a<around|(|f|)>> is defined as the adjoint of
  <math|a<rsup|\<ast\>><around|(|f|)>>. These operators have the property
  that <math|a<around|(|f|)>*\<Omega\>=0> for all <math|f>. We also have the
  following commutation relations:

  <\equation>
    <label|eq:creation-annihilation-ccr><tabular|<tformat|<table|<row|<cell|<around*|[|a<around|(|f|)>,a<rsup|\<ast\>><around|(|g|)>|]>=<around|\<langle\>|f,g|\<rangle\>>*I>>|<row|<cell|<around*|[|a<around|(|f|)>,a<around|(|g|)>|]>=<around*|[|a<rsup|\<ast\>><around|(|f|)>,a<rsup|\<ast\>><around|(|g|)>|]>=0>>>>>
  </equation>

  for all <math|f,g\<in\>L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>>. Returning
  to the Segal field operators <math|\<Phi\><around|(|f|)>>, let us define
  the unitary operators

  <\equation>
    <label|eq:unitary-ops><tabular|<tformat|<table|<row|<cell|U<around|(|f|)>=e<rsup|-i*P<around|(|f|)>>>>|<row|<cell|V<around|(|f|)>=e<rsup|-i*Q<around|(|f|)>>>>>>>
  </equation>

  for <math|f\<in\>L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>>. It can be shown
  that <eqref|eq:ccr-weyl-inf> holds for these operators. A fermion field is
  similar to a boson field with a few changes. The position operator is

  <\equation>
    <label|eq:fermion-q>Q<around|(|f|)>=b<rsup|\<ast\>><around|(|f|)>+b<around|(|f|)>
  </equation>

  and the momentum operator is

  <\equation>
    <label|eq:fermion-p>P<around|(|f|)>=i*<around*|(|b<rsup|\<ast\>><around|(|f|)>-b<around|(|f|)>|)>
  </equation>

  for <math|f\<in\><with|math-font|cal*|H>=L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>>.
  Here <math|b<rsup|\<ast\>><around|(|f|)>> is the fermion creation operator
  and <math|b<around|(|f|)>> is the fermion annihilation operator. As before,
  the Segal field operator is given by <eqref|eq:field-operator>. The fermion
  space <math|<with|math-font|cal*|K>> is similar to the boson space defined
  in <eqref|eq:boson-fock> except that <math|<with|math-font|cal*|K><rsub|n>=<around*|(|L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>\<otimes\>\<cdots\>\<otimes\>L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>|)><rsup|A>>
  is the <math|n>-fold antisymmetric tensor product. The relations for the
  creation and annihilation operators are now

  <\equation>
    <label|eq:fermion-ccr><tabular|<tformat|<table|<row|<cell|<around*|[|b<around|(|f|)>,b<rsup|\<ast\>><around|(|g|)>|]><rsub|+>=<around|\<langle\>|f,g|\<rangle\>>*I>>|<row|<cell|<around*|[|b<around|(|f|)>,b<around|(|g|)>|]><rsub|+>=<around*|[|b<rsup|\<ast\>><around|(|f|)>,b<rsup|\<ast\>><around|(|g|)>|]><rsub|+>=0>>>>>
  </equation>

  where <math|<around|[|A,B|]><rsub|+>=A*B+B*A> is the anticommutator. In
  particular, we have that <math|b<around|(|f|)><rsup|2>=>
  <math|b<rsup|\<ast\>><around|(|f|)><rsup|2>=0>. This result is consistent
  with the Pauli exclusion principle and tells us that a fermion cannot be in
  the same state twice.

  Our third example is that of a free scalar field. Let <math|\<cal-H\>> be
  the Hilbert space consisting of the set of all real-valued solutions
  <math|f> of the Klein-Gordon equation

  <\equation>
    <label|eq:klein-gordon>\<square\>*f+m<rsup|2>*f=0
  </equation>

  where <math|\<square\>=\<partial\><rsup|2>/\<partial\>*t<rsup|2>-\<nabla\><rsup|2>>
  is the d'Alembert operator, with the inner product

  <\equation>
    <label|eq:kg-inner-product><around|\<langle\>|f,g|\<rangle\>>=<big|int><around*|[|f<around|(|x,0|)><frac|\<partial\>*g|\<partial\>*t>*<around|(|x,0|)>-<frac|\<partial\>*f|\<partial\>*t>*<around|(|x,0|)>*g*<around|(|x,0|)>|]>*d*x
  </equation>

  This inner product is time-independent. That is, if we replace <math|0> by
  <math|t> in <eqref|eq:kg-inner-product>, then the inner product remains the
  same. This is essentially Green's identity of ordinary differential
  equations. The quantum space <math|<with|math-font|cal*|K>> is the boson
  Fock space. We can construct the field operator as follows. For simplicity
  we consider the case where <math|m=0>. In this case solutions of
  <eqref|eq:klein-gordon> are of the form
  <math|u<around|(|t,x|)>=v*<around|(|x+t|)>+w*<around|(|x-t|)>>. We define

  <\equation>
    <label|eq:scalar-annihil>a<around|(|k|)>=<frac|1|<around|(|2*\<pi\>|)><rsup|3/2>>*<big|int>e<rsup|-i*k\<cdot\>x>*<around*|[|\<omega\><around|(|k|)>*u<around|(|0,x|)>+i*<frac|\<partial\>*u|\<partial\>*t>*<around|(|0,x|)>|]>*d*x
  </equation>

  and

  <\equation>
    <label|eq:scalar-creation>a<rsup|\<ast\>><around|(|k|)>=<frac|1|<around|(|2*\<pi\>|)><rsup|3/2>>*<big|int>e<rsup|i*k\<cdot\>x>*<around*|[|\<omega\><around|(|k|)>*u<around|(|0,x|)>-i*<frac|\<partial\>*u|\<partial\>*t>*<around|(|0,x|)>|]>*d*x
  </equation>

  where <math|\<omega\><around|(|k|)>=<around|\||k|\|>>. These are the
  standard annihilation and creation operators. This last field appears to be
  different from the previous two, but this is in fact not the case. It has
  been proved that all three fields are unitarily equivalent.

  We now summarize some of the general theory. Let <math|U<around|(|f|)>> and
  <math|V<around|(|g|)>,f,g\<in\><with|math-font|cal*|H>>, be operators on
  <math|<with|math-font|cal*|K>> satisfying <eqref|eq:ccr-weyl-inf>. Assume
  for simplicity that these operators are irreducible; i.e., the only closed
  subspaces of <math|<with|math-font|cal*|K>> that are simultaneously
  invariant under all the operators <math|U<around|(|f|)>> and
  <math|V<around|(|g|)>> are <math|<around|{|0|}>> and
  <math|<with|math-font|cal*|K>>. According to the Stone-von Neumann-Mackey
  theorem, the representation is unitarily equivalent to the one described in
  our first example. That is, we can find a unitary operator
  <math|W:<with|math-font|cal*|K>\<rightarrow\><with|math-font|cal*|K><rsub|B>>,
  where <math|<with|math-font|cal*|K><rsub|B>> is the boson Fock space, such
  that

  <\equation>
    <label|eq:unitary-equiv><tabular|<tformat|<table|<row|<cell|W*U<around|(|f|)>*W<rsup|-1>=U<rsub|B><around|(|f|)>>>|<row|<cell|W*V<around|(|g|)>*W<rsup|-1>=V<rsub|B><around|(|g|)>>>>>>
  </equation>

  for all <math|f,g\<in\><with|math-font|cal*|H>>. Here
  <math|U<rsub|B><around|(|f|)>> and <math|V<rsub|B><around|(|g|)>> are the
  unitary operators for the boson field. In this sense, all quantum fields
  (at least of bosonic type) are unitarily equivalent.

  However, the situation changes drastically if we consider dynamics. Let
  <math|H> be the Hamiltonian (energy operator) for a quantum field. Let
  <math|U<rsub|t>=e<rsup|i*t*H>> be the corresponding time-evolution
  operator. Then <math|U<rsub|t>*K=K> if and only if <math|K> commutes with
  <math|H>. It can be shown that for many interacting-field Hamiltonians, the
  operators <math|U<rsub|t>*U<around|(|f|)>*U<rsub|-t>> and
  <math|U<rsub|t>*V<around|(|g|)>*U<rsub|-t>> do not satisfy the Weyl form of
  the CCR. In this case we say that the fields are not unitarily equivalent
  to free fields. In fact, it has been proved that all known physically
  relevant interacting fields are not unitarily equivalent to free fields.
  This is one of the central problems in quantum field theory.

  Another problem in quantum field theory is the following. Let us first
  consider the Klein-Gordon equation

  <\equation>
    <label|eq:kg-eqn-2>\<square\>*\<phi\>+m<rsup|2>*\<phi\>=0
  </equation>

  for a free scalar field. A general solution is of the form

  <\equation>
    <label|eq:kg-soln>\<phi\><around|(|t,x|)>=<big|int><around*|[|a<around|(|k|)>*e<rsup|i*<around|(|k\<cdot\>x-\<omega\><around|(|k|)>*t|)>>+a<rsup|\<ast\>><around|(|k|)>*e<rsup|-i*<around|(|k\<cdot\>x-\<omega\><around|(|k|)>*t|)>>|]>*d*k
  </equation>

  where <math|\<omega\><around|(|k|)>=<sqrt|<around|\||k|\|><rsup|2>+m<rsup|2>>>.
  The energy of this field is given by

  <\equation>
    <label|eq:kg-energy>H=<frac|1|2>*<big|int><around*|[|\<Pi\><rsup|2><around|(|x|)>+<around|(|\<nabla\>*\<phi\><around|(|x|)>|)><rsup|2>+m<rsup|2>*\<phi\><rsup|2><around|(|x|)>|]>*d*x
  </equation>

  where <math|\<Pi\><around|(|x|)>=\<partial\>*\<phi\>/\<partial\>*t> is the
  field momentum.

  Now let us consider the case when a self-interaction term
  <math|g*\<phi\><rsup|4><around|(|x|)>> is added to the energy integral.
  Then the energy becomes

  <\equation>
    <label|eq:kg-energy-interact>H=<frac|1|2>*<big|int><around*|[|\<Pi\><rsup|2><around|(|x|)>+<around|(|\<nabla\>*\<phi\><around|(|x|)>|)><rsup|2>+m<rsup|2>*\<phi\><rsup|2><around|(|x|)>+g*\<phi\><rsup|4><around|(|x|)>|]>*d*x
  </equation>

  For this interaction, new and even more formidable problems arise. It is
  not clear that the solutions of the interacting field equation are
  operator-valued. They may produce a distribution-valued field rather than
  operator-valued. Infinities may arise in perturbation expansions. All these
  problems are areas of active research in quantum field theory.

  In the remainder of this section we describe a formulation of the dynamics
  of quantum fields. Let the Hamiltonian <math|H> for the system be a
  self-adjoint operator. If <math|\<psi\><rsub|t>> denotes the state of the
  system at time <math|t> and <math|\<psi\><rsub|0>> the initial state, then
  we have

  <\equation>
    <label|eq:schrodinger>\<psi\><rsub|t>=e<rsup|-i*t*H>*\<psi\><rsub|0>
  </equation>

  This is the Schrödinger picture.

  Another approach is the Heisenberg picture. In this approach it is the
  observable rather than the state that varies with time. If <math|A> is an
  observable, then its value at time <math|t> is

  <\equation>
    <label|eq:heisenberg-pic>A<around|(|t|)>=e<rsup|i*t*H>*A*e<rsup|-i*t*H>
  </equation>

  Presumably, the expectation value <math|<around*|\<langle\>|\<psi\><rsub|t>,A*\<psi\><rsub|t>|\<rangle\>>>
  of <math|A> at time <math|t> in the Schrödinger picture should equal the
  expectation value <math|<around*|\<langle\>|\<psi\><rsub|0>,A<around|(|t|)>*\<psi\><rsub|0>|\<rangle\>>>
  of <math|A<around|(|t|)>> at time <math|t>, relative to the initial state,
  in the Heisenberg picture:

  <\equation>
    <label|eq:pic-equivalence><around*|\<langle\>|\<psi\><rsub|t>,A*\<psi\><rsub|t>|\<rangle\>>=<around*|\<langle\>|\<psi\><rsub|0>,A<around|(|t|)>*\<psi\><rsub|0>|\<rangle\>>
  </equation>

  This is indeed the case since

  <\equation>
    <label|eq:pic-equiv-proof><tabular|<tformat|<table|<row|<cell|<around*|\<langle\>|\<psi\><rsub|t>,A*\<psi\><rsub|t>|\<rangle\>>>|<cell|=<around*|\<langle\>|e<rsup|-i*t*H>*\<psi\><rsub|0>,A*e<rsup|-i*t*H>*\<psi\><rsub|0>|\<rangle\>>>>|<row|<cell|>|<cell|=<around*|\<langle\>|\<psi\><rsub|0>,e<rsup|i*t*H>*A*e<rsup|-i*t*H>*\<psi\><rsub|0>|\<rangle\>>>>|<row|<cell|>|<cell|=<around*|\<langle\>|\<psi\><rsub|0>,A<around|(|t|)>*\<psi\><rsub|0>|\<rangle\>>>>>>>
  </equation>

  It is quite useful to have the operator satisfy a differential equation.
  Differentiating <eqref|eq:heisenberg-pic> by <math|t> we obtain

  <\equation>
    <label|eq:heisenberg-eqn><tabular|<tformat|<table|<row|<cell|<frac|d*A<around|(|t|)>|d*t>>|<cell|=i*e<rsup|i*t*H>*H*A*e<rsup|-i*t*H>-i*e<rsup|i*t*H>*A*H*e<rsup|-i*t*H>>>|<row|<cell|>|<cell|=i*<around|[|H,A<around|(|t|)>|]>>>>>>
  </equation>

  where we have used the fact that <math|H> is self-adjoint.

  Let us apply this to the canonical field variables

  <\equation>
    <label|eq:canonical-variables><tabular|<tformat|<table|<row|<cell|\<phi\><around|(|x|)>>|<cell|=<frac|1|<sqrt|2>>*<big|int><frac|1|<sqrt|\<omega\><around|(|k|)>>>*<around*|[|a<around|(|k|)>*e<rsup|i*k\<cdot\>x>+a<rsup|\<ast\>><around|(|k|)>*e<rsup|-i*k\<cdot\>x>|]>*d*k>>|<row|<cell|\<pi\><around|(|x|)>>|<cell|=<frac|i|<sqrt|2>>*<big|int><sqrt|\<omega\><around|(|k|)>>*<around*|[|a<rsup|\<ast\>><around|(|k|)>*e<rsup|-i*k\<cdot\>x>-a<around|(|k|)>*e<rsup|i*k\<cdot\>x>|]>*d*k>>>>>
  </equation>

  The usual canonical commutation relations for the field operators are

  <\equation>
    <label|eq:field-ccr><tabular|<tformat|<table|<row|<cell|<around|[|\<phi\><around|(|x|)>,\<pi\><around|(|y|)>|]>=i*\<delta\>*<around|(|x-y|)>>>|<row|<cell|<around|[|\<phi\><around|(|x|)>,\<phi\><around|(|y|)>|]>=<around|[|\<pi\><around|(|x|)>,\<pi\><around|(|y|)>|]>=0>>>>>
  </equation>

  An example of a Hamiltonian for a free field is

  <\equation>
    <label|eq:free-hamiltonian>H=<frac|1|2>*<big|int><around*|[|\<pi\><rsup|2><around|(|x|)>+<around|(|\<nabla\>*\<phi\><around|(|x|)>|)><rsup|2>+m<rsup|2>*\<phi\><rsup|2><around|(|x|)>|]>*d*x
  </equation>

  For this Hamiltonian we have

  <\equation>
    <label|eq:ham-field-comm><text|<math|<tabular|<tformat|<table|<row|<cell|<around|[|H,\<phi\><around|(|x|)>|]>=i*\<pi\><around|(|x|)>>>|<row|<cell|<around|[|H,\<pi\><around|(|x|)>|]>=-i*<around*|[|-\<nabla\><rsup|2>+m<rsup|2>|]>*\<phi\><around|(|x|)>>>>>>>>
  </equation>

  It follows from the Heisenberg equation <eqref|eq:heisenberg-eqn> that

  <\equation>
    <label|eq:heis-eqn-phi><frac|d*\<phi\><around|(|x,t|)>|d*t>=\<pi\><around|(|x,t|)>
  </equation>

  and

  <\equation>
    <label|eq:heis-eqn-pi><frac|d*\<pi\><around|(|x,t|)>|d*t>=<around*|[|\<nabla\><rsup|2>-m<rsup|2>|]>*\<phi\><around|(|x,t|)>
  </equation>

  Eliminating <math|\<pi\><around|(|x,t|)>> we obtain

  <\equation>
    <label|eq:kg-operatorial><frac|d<rsup|2>*\<phi\><around|(|x,t|)>|d*t<rsup|2>>=<around*|[|\<nabla\><rsup|2>-m<rsup|2>|]>*\<phi\><around|(|x,t|)>
  </equation>

  or

  <\equation>
    <label|eq:kg-final>\<square\>*\<phi\><around|(|x,t|)>+m<rsup|2>*\<phi\><around|(|x,t|)>=0
  </equation>

  We therefore end up with the Klein-Gordon equation <eqref|eq:kg-eqn-2>
  again. For the more general Hamiltonian <eqref|eq:kg-energy-interact>
  defining the <math|\<phi\><rsup|4>> interaction, the evolution equations
  are more difficult to solve.

  In the next section we introduce the Euclidean approach to quantum field
  theory. We shall see the advantages of this approach for the study of the
  various problems that appear in quantum field theory, especially
  interacting field theory.

  <subsection|Infinite Degrees of Freedom>

  We now jump to the infinite number of degrees of freedom case. In this case
  <math|\<bbb-R\><rsup|n>> must be replaced by an infinite dimensional real
  inner product space <math|\<frak-V\>>. A unitary representation <math|U> of
  <math|\<frak-V\>> on a Hilbert space <math|\<cal-H\>> is a map from
  <math|\<frak-V\>> into the set of unitary operators on <math|\<cal-H\>>
  which satisfies:

  <\enumerate>
    <item><math|U*<around|(|\<phi\>+\<psi\>|)>=U<around|(|\<phi\>|)>*U<around|(|\<psi\>|)>>
    for all <math|\<phi\>,\<psi\>\<in\>\<frak-V\>>;

    <item>if <math|\<phi\><rsub|i>\<rightarrow\>\<phi\>> in
    <math|\<frak-V\>>, then <math|U<around|(|\<phi\><rsub|i>|)>*f\<rightarrow\>U<around|(|\<phi\>|)>*f>
    for every <math|f\<in\>\<cal-H\>>.
  </enumerate>

  A <math|\<frak-V\>>-representation of the CCR on <math|\<cal-H\>> is a pair
  of unitary representations <math|<around|(|U,V|)>> of <math|\<frak-V\>> on
  <math|\<cal-H\>> such that

  <\equation>
    U<around|(|\<phi\>|)>*V<around|(|\<psi\>|)>=e<rsup|i*<around|\<langle\>|\<phi\>,\<psi\>|\<rangle\>>>*V<around|(|\<psi\>|)>*U<around|(|\<phi\>|)><label|eq:vccr>
  </equation>

  for every <math|\<phi\>,\<psi\>\<in\>\<frak-V\>>. Of course, this is a
  straightforward generalization of the finite number of degrees of freedom
  case. But now the von Neumann uniqueness theorem does not hold and we can
  have many inequivalent <math|\<frak-V\>>-representations of the CCR. We
  shall only consider the so-called cyclic representations.

  A <math|\<frak-V\>>-representation of the CCR is cyclic with cyclic vector
  <math|h\<in\>\<cal-H\>> if

  <\equation>
    \<cal-H\>=<wide|<math-up|span>|\<bar\>><around|{|V<around|(|\<phi\>|)>*h:\<phi\>\<in\>\<frak-V\>|}><label|eq:cyclic-v>
  </equation>

  This is the definition of cyclicity used in <cite|gelfand-vilenkin> (and
  elsewhere); other authors (e.g., <cite|araki63>) define cyclicity in terms
  of <math|U> and <math|V>. Care must be taken here, since the definitions
  are not equivalent. In this section we give a correspondence between cyclic
  <math|V>-representations of the CCR and certain random fields on
  <math|\<frak-V\>>. We first need the relevant definitions.

  Let <math|\<Phi\>:\<frak-V\>\<to\>R<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>
  be a full random field. For <math|\<psi\>\<in\>\<frak-V\>>, define
  <math|\<Phi\><rsub|\<psi\>>:\<frak-V\>\<to\>R<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>
  by <math|\<Phi\><rsub|\<psi\>><around|(|\<phi\>|)>=\<Phi\><around|(|\<phi\>|)>-<around|\<langle\>|\<phi\>,\<psi\>|\<rangle\>>>.
  The random field <math|\<Phi\><rsub|\<psi\>>> corresponds to a translation
  of <math|\<Phi\>> by the vector <math|\<psi\>>.

  Let <math|m<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>> be the group of
  measurable bijections on <math|\<Omega\>>. If
  <math|T\<in\>m<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>> we define
  <math|<wide|T|^>:R<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>\<to\>R<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>
  by <math|<around|(|<wide|T|^>*f|)><around|(|\<omega\>|)>=f*<around|(|T<rsup|-1>*\<omega\>|)>>.
  An action of <math|\<frak-V\>> on <math|<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>
  is a group homomorphism <math|T:\<frak-V\>\<to\>m<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>
  such that <math|\<psi\><rsub|i>\<to\>\<psi\>> in <math|\<frak-V\>> implies
  that <math|<wide|T|^><rsub|\<psi\><rsub|i>>*f\<to\><wide|T|^><rsub|\<psi\>>*f>
  in probability. An action <math|T> is quasi-invariant when
  <math|\<mu\><around|(|A|)>=0> implies <math|\<mu\>*<around|(|T<rsub|\<psi\>>*A|)>=0>
  for every <math|\<psi\>\<in\>\<frak-V\>>. If we define the measure
  <math|\<mu\><rsub|\<psi\>><around|(|A|)>=\<mu\>*<around|(|T<rsub|\<psi\>>*A|)>>,
  this is equivalent to <math|\<mu\><rsub|\<psi\>>> being absolutely
  continuous relative to <math|\<mu\>> for every
  <math|\<psi\>\<in\>\<frak-V\>>.

  If <math|T> is an action of <math|\<frak-V\>> on
  <math|<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>> and
  <math|\<Phi\>:\<frak-V\>\<to\>R<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>> is
  a random field, we denote the random field
  <math|\<phi\>\<mapsto\><wide|T|^><rsub|\<psi\>><around|[|\<Phi\><around|(|\<phi\>|)>|]>>
  by <math|<wide|T|^><rsub|\<psi\>>*\<Phi\>> and say that <math|\<Phi\>> is
  <math|T>-covariant if <math|\<Phi\><rsub|\<psi\>>=<wide|T|^><rsub|\<psi\>>*\<Phi\>>
  for every <math|\<psi\>\<in\>\<frak-V\>>. A covariant random field is a
  pair <math|<around|(|\<Phi\>,T|)>> where
  <math|\<Phi\>:\<frak-V\>\<to\>R<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>> is
  a random field, <math|T> is a quasi-invariant action of <math|\<frak-V\>>
  on <math|<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>> and <math|\<Phi\>> is
  <math|T>-covariant.

  One of the most difficult conditions to verify for a covariant random field
  <math|<around|(|\<Phi\>,T|)>> is that <math|T> is quasi-invariant. Our
  first result gives two sufficient conditions for <math|T> to be
  quasi-invariant. If <math|F> and <math|F<rsub|1>> are positive definite
  functions on <math|\<frak-V\>>, we say that <math|F<rsub|1>> dominates
  <math|F> if there exists an <math|M\<gtr\>0> such that <math|M*F<rsub|1>-F>
  is positive definite.

  <\theorem>
    <label|thm:quasiinvariant>Let <math|T:\<frak-V\>\<to\>m<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>
    be an action and <math|\<Phi\>:\<frak-V\>\<to\>R<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>
    a random field. Then the following statements are equivalent:

    <\enumerate>
      <item><math|L<rsub|\<Phi\>>> dominates
      <math|L<rsub|<wide|T|^><rsub|\<psi\>>*\<Phi\>>> for every
      <math|\<psi\>\<in\>\<frak-V\>>.

      <item><math|<wide|T|^><rsub|\<psi\>>> is a bounded operator from
      <math|\<cal-H\>=L<rsup|2><around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>> to
      itself for every <math|\<psi\>\<in\>\<frak-V\>>.

      <item><math|T> is quasi-invariant and
      <math|f<rsub|\<psi\>>=d*\<mu\><rsub|\<psi\>>/d*\<mu\>\<in\>\<cal-H\>>
      for every <math|\<psi\>\<in\>\<frak-V\>>
    </enumerate>
  </theorem>

  <\proof>
    We first show that <reference|thm:quasiinvariant>.1 and
    <reference|thm:quasiinvariant>.2 are equivalent. If
    <reference|thm:quasiinvariant>.1 holds then for every
    <math|\<psi\>\<in\>\<frak-V\>> there exists an
    <math|M<rsub|\<psi\>>\<gtr\>0> such that
    <math|M<rsub|\<psi\>>*L<rsub|\<Phi\>>-L<rsub|<wide|T|^><rsub|\<psi\>>*\<Phi\>>>
    is positive definite. Since <math|\<Sigma\>> is generated by
    <math|<around|{|\<Phi\><around|(|\<phi\>|)>:\<phi\>\<in\>\<frak-V\>|}>>,
    it follows that <math|<wide|<math-up|span>|\<bar\>><around|{|e<rsup|i*\<Phi\><around|(|\<phi\>|)>>:\<phi\>\<in\>\<frak-V\>|}>=\<cal-H\>>.
    Let <math|Y=<math-up|span><around|{|e<rsup|i*\<Phi\><around|(|\<phi\>|)>>:\<phi\>\<in\>\<frak-V\>|}>>.
    We now show that the restriction <math|<wide|T|^><rsub|\<psi\>>\<mid\>Y>
    is a bounded operator from <math|Y> to <math|\<cal-H\>>:

    <\align>
      <tformat|<table|<row|<cell|<around*|\||<wide|T|^><rsub|\<psi\>>\<mid\>Y*<big|sum>\<lambda\><rsub|k>*e<rsup|i*\<Phi\><around|(|\<phi\><rsub|k>|)>>|\|><rsup|2>>|<cell|=<around*|\||<big|sum>\<lambda\><rsub|k>*e<rsup|i*<wide|T|^><rsub|\<psi\>>*\<Phi\><around|(|\<phi\><rsub|k>|)>>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|j,k>\<lambda\><rsub|j>*\<lambda\><rsub|k><rsup|\<ast\>>*<big|int>e<rsup|i*<wide|T|^><rsub|\<psi\>>*\<Phi\>*<around|(|\<phi\><rsub|j>-\<phi\><rsub|k>|)>>*d*\<mu\>>>|<row|<cell|>|<cell|=<big|sum><rsub|j,k>\<lambda\><rsub|j>*\<lambda\><rsub|k><rsup|\<ast\>>*L<rsub|<wide|T|^><rsub|\<psi\>>*\<Phi\>>*<around|(|\<phi\><rsub|j>-\<phi\><rsub|k>|)><eq-number>>>|<row|<cell|>|<cell|\<leq\>M<rsub|\<psi\>>*<big|sum><rsub|j,k>\<lambda\><rsub|j>*\<lambda\><rsub|k><rsup|\<ast\>>*L<rsub|\<Phi\>>*<around|(|\<phi\><rsub|j>-\<phi\><rsub|k>|)>>>|<row|<cell|>|<cell|=M<rsub|\<psi\>><around*|\||<big|sum>\<lambda\><rsub|k>*e<rsup|i*\<Phi\><around|(|\<phi\><rsub|k>|)>>|\|><rsup|2><eq-number>>>>>
    </align>

    Thus <math|<around|\<\|\|\>|<wide|T|^><rsub|\<psi\>>\<mid\>Y|\<\|\|\>>\<leq\>M<rsub|\<psi\>><rsup|1/2>>
    and <math|<wide|T|^><rsub|\<psi\>>\<mid\>Y> is bounded. Since
    <math|<wide|Y|\<bar\>>=\<cal-H\>>, <math|<wide|T|^><rsub|\<psi\>>\<mid\>Y>
    has a unique bounded extension <math|S<rsub|\<psi\>>:\<cal-H\>\<to\>\<cal-H\>>.
    We next show that <math|S<rsub|\<psi\>>=<wide|T|^><rsub|\<psi\>>> on
    <math|\<cal-H\>>. If <math|f\<in\>\<cal-H\>>, there exists a sequence
    <math|f<rsub|i>\<in\>Y> such that <math|f<rsub|i>\<to\>f> in norm. Hence
    <math|S<rsub|\<psi\>>*f=lim S<rsub|\<psi\>>*f<rsub|i>>. Now there exists
    a subsequence <math|f<rsub|i<rprime|'>>> such that
    <math|f<rsub|i<rprime|'>>\<to\>f> almost everywhere. Then

    <\align>
      <tformat|<table|<row|<cell|<around|(|S<rsub|\<psi\>>*f|)><around|(|\<omega\>|)>>|<cell|=lim
      <around|(|S<rsub|\<psi\>>*f<rsub|i>|)><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=lim
      <around|(|<wide|T|^><rsub|\<psi\>>*f<rsub|i>|)><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=lim
      f<rsub|i<rprime|'>>*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>>>|<row|<cell|>|<cell|=f*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>=<around|(|<wide|T|^><rsub|\<psi\>>*f|)><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    Hence <reference|thm:quasiinvariant>.2 holds.

    Conversely, suppose <reference|thm:quasiinvariant>.2 holds and
    <math|\<phi\><rsub|1>,\<ldots\>,\<phi\><rsub|n>\<in\>\<frak-V\>>,
    <math|\<lambda\><rsub|1>,\<ldots\>,\<lambda\><rsub|n>\<in\>\<bbb-C\>>.
    Then,

    <\align>
      <tformat|<table|<row|<cell|<big|sum><rsub|j,k>\<lambda\><rsub|j>*\<lambda\><rsub|k><rsup|\<ast\>>*L<rsub|<wide|T|^><rsub|\<psi\>>*\<Phi\>>*<around|(|\<phi\><rsub|j>-\<phi\><rsub|k>|)>>|<cell|=<around*|\||<big|sum>\<lambda\><rsub|k>*e<rsup|i*<wide|T|^><rsub|\<psi\>>*\<Phi\><around|(|\<phi\><rsub|k>|)>>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|=<around|\<\|\|\>|<wide|T|^><rsub|\<psi\>>*<big|sum>\<lambda\><rsub|k>*e<rsup|i*\<Phi\><around|(|\<phi\><rsub|k>|)>>|\<\|\|\>><rsup|2>>>|<row|<cell|>|<cell|\<leq\><around|\<\|\|\>|<wide|T|^><rsub|\<psi\>>|\<\|\|\>><rsup|2><around*|\||<big|sum>\<lambda\><rsub|k>*e<rsup|i*\<Phi\><around|(|\<phi\><rsub|k>|)>>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|=<around|\<\|\|\>|<wide|T|^><rsub|\<psi\>>|\<\|\|\>><rsup|2>*<big|sum><rsub|j,k>\<lambda\><rsub|j>*\<lambda\><rsub|k><rsup|\<ast\>>*L<rsub|\<Phi\>>*<around|(|\<phi\><rsub|j>-\<phi\><rsub|k>|)>>>>>
    </align>

    Hence <reference|thm:quasiinvariant>.1 holds.

    Now show that <reference|thm:quasiinvariant>.2 and
    <reference|thm:quasiinvariant>.3 are equivalent. If
    <reference|thm:quasiinvariant>.2 holds, then the map
    <math|f\<mapsto\><around|\<langle\>|<wide|T|^><rsub|\<psi\>>*f,<with|math-font-family|bf|1>|\<rangle\>>>
    is a bounded linear functional on <math|\<cal-H\>>. By the Riesz theorem
    there exists an <math|f<rsub|\<psi\>>\<in\>\<cal-H\>> such that
    <math|<around|\<langle\>|<wide|T|^><rsub|\<psi\>>*f,<with|math-font-family|bf|1>|\<rangle\>>=<around|\<langle\>|f,f<rsub|\<psi\>>|\<rangle\>>>
    for all <math|f\<in\>\<cal-H\>>. Hence for every <math|f\<in\>\<cal-H\>>

    <\equation>
      <big|int>f*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>=<big|int>f<around|(|\<omega\>|)>*f<rsub|\<psi\>><around|(|\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>.<label|eq:quasi1>
    </equation>

    Letting <math|f=\<chi\><rsub|A>> for <math|A\<in\>\<Sigma\>> we obtain

    <\equation>
      <tabular|<tformat|<table|<row|<cell|\<mu\><rsub|\<psi\>><around|(|A|)>>|<cell|=\<mu\>*<around|(|T<rsub|\<psi\>>*A|)>>>|<row|<cell|>|<cell|=<big|int>\<chi\><rsub|A>*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>>>>>><label|eq:quasi2>
    </equation>

    Hence <math|\<mu\><rsub|\<psi\>>> is absolutely continuous relative to
    <math|\<mu\>> and <math|f<rsub|\<psi\>>=d*\<mu\><rsub|\<psi\>>/d*\<mu\>\<in\>\<cal-H\>>.

    Conversely, suppose <reference|thm:quasiinvariant>.3 holds and let
    <math|<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>>> be a simple
    function in <math|\<cal-H\>>, where <math|A<rsub|i>\<cap\>A<rsub|j>=\<varnothing\>>
    for <math|i\<neq\>j>. Then

    <\align>
      <tformat|<table|<row|<cell|<around*|\||<wide|T|^><rsub|\<psi\>>*<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>>|\|><rsup|2>>|<cell|=<big|int><around*|\||<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>>*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>|\|><rsup|2>*d*\<mu\><eq-number>>>|<row|<cell|>|<cell|=<big|int><around*|\||<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><rsub|\<psi\>>>>|<row|<cell|>|<cell|=<big|int><around*|\||<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>>|\|><rsup|2>*f<rsub|\<psi\>>*d*\<mu\><eq-number>>>|<row|<cell|>|<cell|=<big|sum><around|\||\<lambda\><rsub|j>|\|><rsup|2>*<big|int>\<chi\><rsub|A<rsub|j>>*f<rsub|\<psi\>>*d*\<mu\>>>|<row|<cell|>|<cell|\<leq\><big|sum><around|\||\<lambda\><rsub|j>|\|><rsup|2><around|\<\|\|\>|f<rsub|\<psi\>>|\<\|\|\>><rsup|2>*\<mu\><around|(|A<rsub|j>|)><eq-number>>>|<row|<cell|>|<cell|=<around|\<\|\|\>|f<rsub|\<psi\>>|\<\|\|\>><rsup|2><around*|\||<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>>|\|><rsup|2>>>>>
    </align>

    Hence, the restriction of <math|<wide|T|^><rsub|\<psi\>>> to the subspace
    of simple functions is bounded. Since the simple functions are dense in
    <math|\<cal-H\>>, this restriction has a unique bounded extension to
    <math|\<cal-H\>>. By an argument similar to that above we conclude that
    <reference|thm:quasiinvariant>.2 holds.
  </proof>

  An inner product space <math|\<frak-V\>> is completely separable if there
  exists a countable orthonormal set <math|<around|{|x<rsub|i>|}>> in
  <math|\<frak-V\>> such that <math|<around|{|x<rsub|i>|}>> is a basis for
  the completion <math|<wide|\<frak-V\>|\<bar\>>> of <math|\<frak-V\>>.
  Clearly, a completely separable inner product space is separable. However,
  the converse need not hold.

  <\theorem>
    <label|thm:araki-segal>

    <\enumerate>
      <item*|(a)>Let <math|<around|(|\<Phi\>,T|)>> be a covariant random
      field from an inner product space <math|\<frak-V\>> to a probability
      space <math|<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>. Then there exists
      a random functional <math|\<Psi\>:\<frak-V\>\<to\>R<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>
      such that <math|<around|(|U<rsub|0>,V<rsub|0>|)>> defined by
      Eqs.<nbsp><eqref|eq:u0v0-1> and <eqref|eq:u0v0-2> forms a cyclic
      <math|\<frak-V\>>-representation of the CCR on
      <math|\<cal-H\>=L<rsup|2><around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>:

      <\align>
        <tformat|<table|<row|<cell|<around|[|V<rsub|0><around|(|\<phi\>|)>*f|]><around|(|\<omega\>|)>>|<cell|=e<rsup|-i*\<Phi\><around|(|\<phi\>|)><around|(|\<omega\>|)>>*f<around|(|\<omega\>|)><eq-number><label|eq:u0v0-1>>>|<row|<cell|<around|[|U<rsub|0><around|(|\<phi\>|)>*f|]><around|(|\<omega\>|)>>|<cell|=<around|[|\<Psi\><around|(|\<psi\>|)>|]><around|(|\<omega\>|)>*<around|[|<wide|T|^><rsub|\<psi\>>*f|]><around|(|\<omega\>|)><eq-number><label|eq:u0v0-2>>>>>
      </align>

      <item*|(b)>Conversely, let <math|\<frak-V\>> be a completely separable
      inner product space. If <math|<around|(|U,V|)>> is a cyclic
      <math|\<frak-V\>>-representation of CCR on a Hilbert space
      <math|\<cal-H\>>, then there exists a covariant random field
      <math|<around|(|\<Phi\>,T|)>> from <math|\<frak-V\>> to a probability
      space <math|<around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>> such that
      <math|<around|(|U,V|)>> is equivalent to
      <math|<around|(|U<rsub|0>,V<rsub|0>|)>> defined by
      Eqs.<nbsp><eqref|eq:u0v0-1> and <eqref|eq:u0v0-2>.
    </enumerate>
  </theorem>

  <\proof>
    <\enumerate-alpha>
      <item>It is clear that <math|V<rsub|0>> as defined above is unitary and
      that <math|V<rsub|0>*<around|(|\<phi\>+\<psi\>|)>=V<rsub|0><around|(|\<phi\>|)>*V<rsub|0><around|(|\<psi\>|)>>
      for all <math|\<phi\>,\<psi\>\<in\>\<frak-V\>>. Strong continuity
      follows from the dominated convergence theorem.

      Since <math|\<mu\><rsub|\<psi\>>> is absolutely continuous relative to
      <math|\<mu\>>, by the Radon-Nikodym theorem there exist unique
      nonnegative functions <math|f<rsub|\<psi\>>\<in\>L<rsup|1><around|(|\<Omega\>,\<Sigma\>,\<mu\>|)>>
      such that <math|\<mu\><rsub|\<psi\>><around|(|A|)>=<big|int><rsub|A>f<rsub|\<psi\>>*d*\<mu\>>
      for all <math|A\<in\>\<Sigma\>> and <math|\<psi\>\<in\>\<frak-V\>>.
      Define the random functional <math|\<Psi\><around|(|\<psi\>|)>=f<rsub|\<psi\>><rsup|1/2><around|(|\<omega\>|)>>.
      Then <math|U<rsub|0><around|(|\<psi\>|)>> is unitary since for all
      <math|f,g\<in\>\<cal-H\>> we have

      <\align>
        <tformat|<table|<row|<cell|<around|\<langle\>|U<rsub|0><around|(|\<psi\>|)>*f,U<rsub|0><around|(|\<psi\>|)>*g|\<rangle\>>>|<cell|=<big|int>f<rsub|\<psi\>><around|(|\<omega\>|)>*f*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>*g<rsup|\<ast\>>*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int>f*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>*g<rsup|\<ast\>>*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>*d*\<mu\>*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int>f<around|(|\<omega\>|)>*g<rsup|\<ast\>><around|(|\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>=<around|\<langle\>|f,g|\<rangle\>><eq-number>>>>>
      </align>

      We now show that <math|>

      <\equation>
        f<rsub|\<phi\>+\<psi\>><around|(|\<omega\>|)>=f<rsub|\<phi\>><around|(|\<omega\>|)>*f<rsub|\<psi\>>*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)>
      </equation>

      Indeed, for any <math|A\<in\>\<Sigma\>> we have

      <\align>
        <tformat|<table|<row|<cell|<big|int><rsub|A>f<rsub|\<phi\>><around|(|\<omega\>|)>*f<rsub|\<psi\>>*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>>|<cell|=<big|int><rsub|A>f<rsub|\<psi\>>*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)>*d*\<mu\>*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|A>d*\<mu\>*<around|(|T<rsub|\<psi\>><rsup|-1>*T<rsub|\<phi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|A>f<rsub|\<phi\>+\<psi\>><around|(|\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=\<mu\>*<around|(|T<rsub|\<phi\>+\<psi\>>*A|)>>>>>
      </align>

      It follows

      <\align>
        <tformat|<table|<row|<cell|<around|[|U<rsub|0>*<around|(|\<phi\>+\<psi\>|)>*f|]><around|(|\<omega\>|)>>|<cell|=<around|[|\<Psi\>*<around|(|\<phi\>+\<psi\>|)>|]><around|(|\<omega\>|)>*<around|[|<wide|T|^><rsub|\<phi\>+\<psi\>>*f|]><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<around|[|\<Psi\><around|(|\<phi\>|)>|]><around|(|\<omega\>|)><around|[|\<Psi\><around|(|\<psi\>|)>|]>*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)>*f*<around|(|T<rsub|\<phi\>+\<psi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<around|[|\<Psi\><around|(|\<phi\>|)>|]><around|(|\<omega\>|)>*<around*|{|T<rsub|\<phi\>>*<around|[|\<Psi\><around|(|\<psi\>|)><around|(|\<omega\>|)>*f*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>|]>|}><eq-number>>>|<row|<cell|>|<cell|=<around|[|U<rsub|0><around|(|\<phi\>|)>*U<rsub|0><around|(|\<psi\>|)>*f|]><around|(|\<omega\>|)><eq-number>>>>>
      </align>

      Hence <math|U<rsub|0>*<around|(|\<phi\>+\<psi\>|)>=U<rsub|0><around|(|\<phi\>|)>*U<rsub|0><around|(|\<psi\>|)>>.
      The strong continuity of <math|\<phi\>\<mapsto\>U<rsub|0><around|(|\<phi\>|)>>
      follows as above. To show the canonical commutation relations, use the
      <math|T>-covariance of <math|\<Phi\>>:

      <\align>
        <tformat|<table|<row|<cell|<around|[|U<rsub|0><around|(|\<phi\>|)>*V<rsub|0><around|(|\<psi\>|)>*f|]><around|(|\<omega\>|)>>|<cell|=\<Psi\><around|(|\<phi\>|)>*<around|[|V<rsub|0><around|(|\<psi\>|)>*f|]>*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<Psi\><around|(|\<phi\>|)>*exp
        <around*|{|-i<around|[|\<Phi\><around|(|\<psi\>|)>|]>*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)>|}>*f*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<Psi\><around|(|\<phi\>|)>*exp
        <around*|{|-i<around|[|\<Phi\><rsub|\<phi\>><around|(|\<psi\>|)>|]><around|(|\<omega\>|)>|}>*f*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<Psi\><around|(|\<phi\>|)>*e<rsup|-i*\<Phi\><around|(|\<psi\>|)><around|(|\<omega\>|)>>*e<rsup|i*<around|\<langle\>|\<phi\>,\<psi\>|\<rangle\>>>*f*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=e<rsup|i*<around|\<langle\>|\<phi\>,\<psi\>|\<rangle\>>>*<around|[|V<rsub|0><around|(|\<psi\>|)>*U<rsub|0><around|(|\<phi\>|)>*f|]><around|(|\<omega\>|)><eq-number>>>>>
      </align>

      Thus, the CCR <eqref|eq:vccr> holds. The indicator function
      <math|<with|math-font-family|bf|1>> is a cyclic vector since
      <math|<math-up|span><around|{|e<rsup|i*\<Phi\><around|(|\<phi\>|)>>:\<phi\>\<in\>\<frak-V\>|}>>
      is dense.

      <item>We first show that <math|<around|(|U,V|)>> has a unique extension
      to a cyclic <math|<wide|\<frak-V\>|\<bar\>>>-representation of the CCR
      on <math|\<cal-H\>>. For <math|\<phi\>\<in\><wide|\<frak-V\>|\<bar\>>>,
      let <math|\<phi\><rsub|i>> be a sequence in <math|\<frak-V\>>
      converging to <math|\<phi\>>. Now <math|U<around|(|\<phi\><rsub|i>|)>>
      is strongly Cauchy in <math|\<cal-H\>> since for every
      <math|f\<in\>\<cal-H\>>

      <\equation>
        lim<rsub|i,j\<to\>\<infty\>><around|\<\|\|\>|U<around|(|\<phi\><rsub|i>|)>*f-U<around|(|\<phi\><rsub|j>|)>*f|\<\|\|\>>=lim<rsub|i,j\<to\>\<infty\>><around|\<\|\|\>|f-U*<around|(|\<phi\><rsub|j>-\<phi\><rsub|i>|)>*f|\<\|\|\>>=0
      </equation>

      Defining <math|U<around|(|\<phi\>|)>*f=lim
      U<around|(|\<phi\><rsub|i>|)>*f> gives a well-defined linear operator
      which is bounded by the uniform boundedness theorem. Extend <math|V> to
      <math|<wide|\<frak-V\>|\<bar\>>> similarly. By taking limits it is
      straightforward to show that <math|<around|(|U,V|)>> extended in this
      way gives a cyclic <math|<wide|\<frak-V\>|\<bar\>>>-representation of
      the CCR on <math|\<cal-H\>>. Let <math|<around|{|\<psi\><rsub|i>|}>> be
      an orthonormal basis for <math|<wide|\<frak-V\>|\<bar\>>> where
      <math|\<psi\><rsub|i>\<in\>\<frak-V\>>, <math|i=1,2,\<ldots\>>. Let
      <math|<around|{|f<rsub|i>|}>> be an orthonormal basis for
      <math|L<rsup|2><around|(|\<bbb-R\>,d*x|)>> where <math|f<rsub|i>> are
      in the Schwartz space, and define the isomorphism
      <math|J:<wide|\<frak-V\>|\<bar\>>\<to\>L<rsup|2><around|(|\<bbb-R\>,d*x|)>>
      by <math|J<around|(|\<psi\><rsub|i>|)>=f<rsub|i>>. Then
      <math|<around|(|U\<circ\>J<rsup|-1>,V\<circ\>J<rsup|-1>|)>> is a cyclic
      <math|L<rsup|2><around|(|\<bbb-R\>,d*x|)>>-representation of the CCR.

      Applying a theorem due to Gelfand-Vilenkin <cite|gelfand-vilenkin>,
      there exist:

      <\enumerate>
        <item>a unique Borel probability measure <math|\<mu\>> on the dual
        <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>> such that for every
        Borel set <math|A> and every <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>,
        <math|\<mu\><around|(|A|)>=0> implies
        <math|\<mu\>*<around|(|A+f<rsub|\<phi\>>|)>=0>, where
        <math|f<rsub|\<phi\>><around|(|\<psi\>|)>=<around|\<langle\>|\<psi\>,\<phi\>|\<rangle\>>>
        for every <math|\<psi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>;

        <item>for every <math|\<phi\>\<in\>\<cal-S\><around|(|\<bbb-R\>|)>>
        there exists a functional <math|F<rsub|\<phi\>>> on
        <math|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>> such that
        <math|<around|(|U<rsub|1>,V<rsub|1>|)>> is a cyclic
        <math|\<cal-S\><around|(|\<bbb-R\>|)>>-representation of the CCR on
        <math|L<rsup|2><around|(|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>,\<mu\>|)>>
        where <math|<around|[|V<rsub|1><around|(|\<phi\>|)>*F|]><around|(|f|)>=e<rsup|-i*f<around|(|\<phi\>|)>>*F<around|(|f|)>>
        and <math|<around|[|U<rsub|1><around|(|\<phi\>|)>*F|]><around|(|f|)>=F<rsub|\<phi\>><around|(|f|)>*F*<around|(|f+f<rsub|\<phi\>>|)>>;

        <item>an isomorphism <math|M:\<cal-H\>\<to\>L<rsup|2><around|(|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>,\<mu\>|)>>
        with <math|M*U\<circ\>J<rsup|-1>*M<rsup|-1>=U<rsub|1>>, and
        <math|M*V\<circ\>J<rsup|-1>*M<rsup|-1>=V<rsub|1>>.
      </enumerate>

      Define the random field <math|\<Phi\>:\<frak-V\>\<to\><around|(|\<cal-S\><rprime|'><around|(|\<bbb-R\>|)>,\<mu\>|)>>
      by

      <\equation>
        <around|[|\<Phi\><around|(|\<phi\>|)>|]><around|(|f|)>=f*<around|(|J*\<phi\>|)>
      </equation>

      the random functional <math|>

      <\equation>
        \<Psi\><around|(|\<phi\>|)>=F<rsub|J*\<phi\>><around|(|f|)>
      </equation>

      and the action\ 

      <\equation>
        T<rsub|\<phi\>>*f=f+f<rsub|J*\<phi\>>
      </equation>

      Now define

      <\equation>
        U<rsub|0><around|(|\<phi\>|)>=U<rsub|1>*<around|(|J*\<phi\>|)>
      </equation>

      <\equation>
        V<rsub|0><around|(|\<phi\>|)>=V<rsub|1>*<around|(|J*\<phi\>|)>
      </equation>

      Then, <math|<around|(|\<Phi\>,T|)>> and
      <math|<around|(|U<rsub|0>,V<rsub|0>|)>> satisfy the conditions of the
      theorem. Furthermore, <math|<around|(|U,V|)>> is equivalent to
      <math|<around|(|U<rsub|0>,V<rsub|0>|)>>.
    </enumerate-alpha>

    \;
  </proof>

  There is another approach to representations of the CCR which is frequently
  used. Let <math|<around|(|U,V|)>> be a <math|\<frak-V\>>-representation of
  the Weyl form of the CCR on <math|\<cal-H\>>. For notational convenience we
  replace <math|<around|(|U,V|)>> by a single representation operator
  <math|W> over the complexification <math|\<frak-V\><rsub|c>> of
  <math|\<frak-V\>>.

  To be precise, <math|\<frak-V\><rsub|c>> is the set of ordered pairs
  <math|<around|{|<around|(|\<phi\>,\<psi\>|)>:\<phi\>,\<psi\>\<in\>\<frak-V\>|}>>.
  We define addition componentwise:

  <\equation>
    <around|(|\<phi\>,\<psi\>|)>+<around|(|\<phi\><rsub|1>,\<psi\><rsub|1>|)>=<around|(|\<phi\>+\<phi\><rsub|1>,\<psi\>+\<psi\><rsub|1>|)>
  </equation>

  and if <math|\<alpha\>+i*\<beta\>\<in\>\<bbb-C\>>,
  <math|\<alpha\>,\<beta\>\<in\>\<bbb-R\>>,

  <\equation>
    <around|(|\<alpha\>+i*\<beta\>|)>*<around|(|\<phi\>,\<psi\>|)>=<around|(|\<alpha\>*\<phi\>,\<alpha\>*\<psi\>|)>+<around|(|-\<beta\>*\<psi\>,\<beta\>*\<phi\>|)>.<label|eq:complexification>
  </equation>

  It is straightforward to show that <math|\<frak-V\><rsub|c>> is a complex
  linear space. We define an inner product on <math|\<frak-V\><rsub|c>> by

  <\equation>
    <around|\<langle\>|<around|(|\<phi\>,\<psi\>|)>,<around|(|\<phi\><rsub|1>,\<psi\><rsub|1>|)>|\<rangle\>>=<around|\<langle\>|\<phi\>,\<phi\><rsub|1>|\<rangle\>>+<around|\<langle\>|\<psi\>,\<psi\><rsub|1>|\<rangle\>>+i*<around|(|<around|\<langle\>|\<psi\>,\<phi\><rsub|1>|\<rangle\>>-<around|\<langle\>|\<phi\>,\<psi\><rsub|1>|\<rangle\>>|)><label|eq:complex-inner-product>
  </equation>

  Now let <math|<around|(|U,V|)>> be a <math|\<frak-V\>>-representation of
  the CCR on <math|\<cal-H\>>. For <math|\<phi\>+i*\<psi\>\<in\>\<frak-V\><rsub|c>>,
  define

  <\equation>
    W*<around|(|\<phi\>+i*\<psi\>|)>=e<rsup|-i*<around|\<langle\>|\<phi\>,\<psi\>|\<rangle\>>/2>*U<around|(|\<phi\>|)>*V<around|(|\<psi\>|)>.<label|eq:weyl-cmplx>
  </equation>

  <\lemma>
    <label|lemma:weyl>

    <\enumerate>
      <item><math|W<around|(|\<phi\>|)>> is a unitary operator on
      <math|\<cal-H\>> satisfying

      <\enumerate>
        <item*|(a)><math|\<phi\>\<mapsto\>W<around|(|\<phi\>|)>> is
        continuous in the strong operator topology,

        <item*|(b)><math|W<around|(|\<phi\>|)><rsup|\<ast\>>=W*<around|(|-\<phi\>|)>>
        for all <math|\<phi\>\<in\>\<frak-V\><rsub|c>>,

        <item*|(c)><math|W<around|(|\<phi\>|)>*W<around|(|\<psi\>|)>=W*<around|(|\<phi\>+\<psi\>|)>*e<rsup|i<math-up|Im><around|\<langle\>|\<phi\>,\<psi\>|\<rangle\>>/2>>
        for all <math|\<phi\>,\<psi\>\<in\>\<frak-V\><rsub|c>>.
      </enumerate>

      <item>Conversely, if <math|W<around|(|\<phi\>|)>> is a unitary operator
      on <math|\<cal-H\>> satisfying (a), (b), and (c) and if we define
      <math|U<around|(|\<phi\>|)>=W<around|(|\<phi\>|)>>,
      <math|V<around|(|\<phi\>|)>=W*<around|(|i*\<phi\>|)>> for every
      <math|\<phi\>\<in\>\<frak-V\>>, then <math|<around|(|U,V|)>> is a
      <math|\<frak-V\>>-representation of the CCR.
    </enumerate>
  </lemma>

  We call a map <math|\<phi\>\<mapsto\>W<around|(|\<phi\>|)>> satisfying (a),
  (b), (c) a complex <math|\<frak-V\><rsub|c>>-representation of the CCR on
  <math|\<cal-H\>>. We say that <math|W> is cyclic with cyclic vector
  <math|h\<in\>\<cal-H\>> if <math|<math-up|span><around|{|W<around|(|\<phi\>|)>*h:\<phi\>\<in\>\<frak-V\><rsub|c>|}>>
  is dense in <math|\<cal-H\>>.

  Let <math|W> be a cyclic complex <math|\<frak-V\><rsub|c>>-representation
  of the CCR on <math|\<cal-H\>> with unit cyclic vector
  <math|h\<in\>\<cal-H\>>. Define <math|w:\<frak-V\><rsub|c>\<to\>\<bbb-C\>>
  by <math|w<around|(|\<phi\>|)>=<around|\<langle\>|W<around|(|\<phi\>|)>*h,h|\<rangle\>>>.
  We would now like to find the properties of <math|w>. First, since <math|W>
  is continuous we have

  <\enumerate>
    <item><math|w> is continuous.

    <item><math|w<around|(|0|)>=1>.

    <item>For <math|\<phi\><rsub|i>\<in\>\<frak-V\><rsub|c>> and
    <math|\<lambda\><rsub|i>\<in\>\<bbb-C\>>, <math|i=1,\<ldots\>,n>,

    <\equation>
      <big|sum><rsub|j,k=1><rsup|n>\<lambda\><rsub|j>*\<lambda\><rsub|k><rsup|\<ast\>>*w*<around|(|\<phi\><rsub|j>-\<phi\><rsub|k>|)>*e<rsup|i<math-up|Im><around|\<langle\>|\<phi\><rsub|j>,\<phi\><rsub|k>|\<rangle\>>/2>\<geq\>0.<label|eq:positive-definite>
    </equation>
  </enumerate>

  <\theorem>
    <label|thm:gns>If <math|w:\<frak-V\><rsub|c>\<to\>\<bbb-C\>> satisfies
    properties (1)\U(3) above, then there exists a unique (up to unitary
    equivalence) cyclic complex <math|\<frak-V\>>-representation <math|W> of
    the CCR with cyclic vector <math|h> such that
    <math|w<around|(|\<phi\>|)>=<around|\<langle\>|W<around|(|\<phi\>|)>*h,h|\<rangle\>>>
    for every <math|\<phi\>\<in\>\<frak-V\><rsub|c>>.
  </theorem>

  <\proof>
    Any <math|f\<in\>\<Delta\><around|(|\<frak-V\><rsub|c>|)>> can be written
    as <math|f=<big|sum><rsub|j=1><rsup|n>\<lambda\><rsub|j>*\<chi\><rsub|<around|{|\<phi\><rsub|j>|}>>>,
    <math|0\<neq\>\<phi\><rsub|j>\<in\>\<frak-V\><rsub|c>> distinct. Define
    <math|w<around|(|f|)>=<big|sum><rsub|j=1><rsup|n>\<lambda\><rsub|j>*w<around|(|\<phi\><rsub|j>|)>>.
    Then <math|w> is linear on <math|\<Delta\><around|(|\<frak-V\><rsub|c>|)>>
    and, moreover, <math|w> is positive since

    <\align>
      <tformat|<table|<row|<cell|w<around*|[|<around*|(|<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|<around|{|\<phi\><rsub|j>|}>>|)><rsup|\<ast\>><around*|(|<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|<around|{|\<phi\><rsub|j>|}>>|)>|]>=<big|sum><rsub|j,k>\<lambda\><rsub|j>*\<lambda\><rsub|k><rsup|\<ast\>>*w*<around|(|\<phi\><rsub|j>-\<phi\><rsub|k>|)>*e<rsup|i<math-up|Im><around|\<langle\>|\<phi\><rsub|j>,\<phi\><rsub|k>|\<rangle\>>/2>\<geq\>0.<eq-number>>>>>
    </align>

    Also <math|w<around|(|\<chi\><rsub|<around|{|0|}>>|)>=w<around|(|0|)>=1>.
    Applying Schwarz's inequality, <math|<around|\||w<around|(|\<chi\><rsub|<around|{|\<phi\>|}>>|)>|\|><rsup|2>\<leq\>w*<around|(|\<chi\><rsub|<around|{|\<phi\>|}>><rsup|\<ast\>>*\<chi\><rsub|<around|{|\<phi\>|}>>|)>=1>.
    Hence for <math|f=<big|sum>\<lambda\><rsub|i>*\<chi\><rsub|<around|{|\<phi\><rsub|i>|}>>>,

    <\equation*>
      <around|\||w<around|(|f|)>|\|>\<leq\><big|sum><around|\||\<lambda\><rsub|i>|\|>.
    </equation*>

    Thus <math|w> is continuous on <math|\<Delta\><around|(|\<frak-V\><rsub|c>|)>>
    and extends to a state on its Banach-* algebra completion. By the GNS
    construction there exists a unique (up to equivalence) cyclic
    representation <math|\<pi\>> of this Banach-* algebra with cyclic vector
    <math|h> such that <math|<around|\<langle\>|\<pi\><around|(|f|)>*h,h|\<rangle\>>=w<around|(|f|)>>.
    Define <math|W<around|(|\<phi\>|)>=\<pi\><around|(|\<chi\><rsub|<around|{|\<phi\>|}>>|)>>.
    The required properties (a), (b), (c) are verified from the algebraic
    relations.
  </proof>

  As an application of Theorem<nbsp><reference|thm:gns>, we outline a proof
  of the von Neumann uniqueness theorem. If <math|\<frak-V\>> is
  one-dimensional we can assume <math|\<frak-V\>=\<bbb-R\>>, so
  <math|\<frak-V\><rsub|c>=\<bbb-C\>>. Let <math|W> be an irreducible complex
  <math|\<bbb-R\>>-representation of the CCR on <math|\<cal-H\>>. Then
  <math|W<around|(|\<lambda\>|)>> is a unitary operator on <math|\<cal-H\>>,
  <math|\<lambda\>\<in\>\<bbb-C\>>, satisfying:

  <\enumerate>
    <item*|<math|<around|(|a<rprime|'>|)>>><math|\<lambda\>\<mapsto\>W<around|(|\<lambda\>|)>>
    is strongly continuous;

    <item*|<math|<around|(|b<rprime|'>|)>>><math|W<around|(|\<lambda\>|)><rsup|\<ast\>>=W*<around|(|-\<lambda\>|)>>
    for all <math|\<lambda\>\<in\>\<bbb-C\>>;

    <item*|<math|<around|(|c<rprime|'>|)>>><math|W<around|(|\<alpha\>|)>*W<around|(|\<beta\>|)>=e<rsup|i<math-up|Im>\<alpha\>*<wide|\<beta\>|\<bar\>>/2>*W*<around|(|\<alpha\>+\<beta\>|)>>.
  </enumerate>

  Define the linear operator <math|A> on <math|\<cal-H\>> by

  <\equation>
    <around|\<langle\>|A*x,y|\<rangle\>>=<around|(|2*\<pi\>|)><rsup|-1/2>*<big|int><around|\<langle\>|W<around|(|\<lambda\>|)>*x,y|\<rangle\>>*e<rsup|-<around|\||\<lambda\>|\|><rsup|2>/4>*d*\<lambda\><label|eq:A-operator>
  </equation>

  where <math|x,y\<in\>\<cal-H\>>, and <math|\<lambda\>=s+i*t>,
  <math|s,t\<in\>\<bbb-R\>>. Since <math|W<around|(|\<lambda\>|)>> is
  unitary,

  <\equation>
    <around|\||<around|\<langle\>|A*x,y|\<rangle\>>|\|>\<leq\><around|(|2*\<pi\>|)><rsup|-1/2>*<big|int>e<rsup|-<around|(|s<rsup|2>+t<rsup|2>|)>/4>*d*s*d*t<space|0.17em><around|\<\|\|\>|x|\<\|\|\>><around|\<\|\|\>|y|\<\|\|\>>=<around|\<\|\|\>|x|\<\|\|\>><around|\<\|\|\>|y|\<\|\|\>>
  </equation>

  and hence <math|A> is bounded and <math|<around|\<\|\|\>|A|\<\|\|\>>\<leq\>1>.
  Applying <math|<around|(|b<rprime|'>|)>> gives <math|A> is self-adjoint.
  Using a straightforward calculation one can show that

  <\equation>
    A*W<around|(|\<lambda\>|)>*A=A*e<rsup|-<around|\||\<lambda\>|\|><rsup|2>/4><label|eq:AWA>
  </equation>

  for every <math|\<lambda\>\<in\>\<bbb-C\>>. Moreover, <math|A\<neq\>0>.
  Letting <math|\<lambda\>=0> in <eqref|eq:AWA>, <math|A> is a nonzero
  projection. Hence there exists a unit vector <math|x\<in\>\<cal-H\>> such
  that <math|A*x=x>. Since <math|W> is irreducible, any nonzero vector in
  <math|\<cal-H\>> is cyclic so, in particular, <math|x> is cyclic. Define
  <math|w:\<bbb-C\>\<to\>\<bbb-C\>> by <math|w<around|(|\<lambda\>|)>=<around|\<langle\>|W<around|(|\<lambda\>|)>*x,x|\<rangle\>>>.
  Then, applying <eqref|eq:AWA>,

  <\equation>
    w<around|(|\<lambda\>|)>=<around|\<langle\>|A*W<around|(|\<lambda\>|)>*A*x,x|\<rangle\>>=e<rsup|-<around|\||\<lambda\>|\|><rsup|2>/4>.
  </equation>

  Now let <math|W<rsub|0>> be the complex <math|\<bbb-R\>>-representation of
  the CCR on <math|L<rsup|2><around|(|\<bbb-R\>|)>> given by

  <\equation>
    W<rsub|0>*<around|(|s+i*t|)>*f<around|(|u|)>=e<rsup|i*s*t/2>*e<rsup|i*t*u>*f*<around|(|u-s|)>.
  </equation>

  If <math|x<rsub|0><around|(|u|)>=\<pi\><rsup|-1/4>*e<rsup|-u<rsup|2>/2>>,
  then

  <\equation>
    w<rsub|0><around|(|\<lambda\>|)>=<around|\<langle\>|W<rsub|0><around|(|\<lambda\>|)>*x<rsub|0>,x<rsub|0>|\<rangle\>>=e<rsup|-<around|\||\<lambda\>|\|><rsup|2>/4>.
  </equation>

  It follows from Theorem<nbsp><reference|thm:gns> that <math|W> and
  <math|W<rsub|0>> are unitarily equivalent.

  The generalization to any finite number of degrees of freedom is
  straightforward. However, this proof (and the result) cannot be generalized
  to an infinite number of degrees of freedom since in that case the measure

  <\equation*>
    A\<mapsto\><around|(|2*\<pi\>|)><rsup|-1/2>*<big|int><rsub|A>e<rsup|-<around|(|s<rsup|2>+t<rsup|2>|)>/4>*d*s*d*t
  </equation*>

  has no infinite-dimensional analog.
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|2.1|<tuple|1|?>>
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|22|4>>
    <associate|auto-3|<tuple|1|10>>
    <associate|eq:A-operator|<tuple|106|17>>
    <associate|eq:AWA|<tuple|108|17>>
    <associate|eq:boson-fock|<tuple|30|5>>
    <associate|eq:canonical-variables|<tuple|55|9>>
    <associate|eq:ccr-heisenberg|<tuple|5|1>>
    <associate|eq:ccr-heisenberg-n|<tuple|21|4>>
    <associate|eq:ccr-schrodinger|<tuple|10|2>>
    <associate|eq:ccr-weyl|<tuple|13|2>>
    <associate|eq:ccr-weyl-inf|<tuple|23|4>>
    <associate|eq:ccr-weyl-n|<tuple|22|4>>
    <associate|eq:complex-inner-product|<tuple|102|15>>
    <associate|eq:complexification|<tuple|101|15>>
    <associate|eq:creation-annihilation-ccr|<tuple|36|5>>
    <associate|eq:creation-op|<tuple|35|5>>
    <associate|eq:cyclic-v|<tuple|64|10>>
    <associate|eq:domain-q|<tuple|2|1>>
    <associate|eq:fermion-ccr|<tuple|40|6>>
    <associate|eq:fermion-p|<tuple|39|6>>
    <associate|eq:fermion-q|<tuple|38|6>>
    <associate|eq:field-ccr|<tuple|56|9>>
    <associate|eq:field-operator|<tuple|32|5>>
    <associate|eq:fock-inner-product|<tuple|31|5>>
    <associate|eq:free-hamiltonian|<tuple|57|9>>
    <associate|eq:ham-field-comm|<tuple|58|9>>
    <associate|eq:heis-eqn-phi|<tuple|59|9>>
    <associate|eq:heis-eqn-pi|<tuple|60|9>>
    <associate|eq:heisenberg-eqn|<tuple|54|8>>
    <associate|eq:heisenberg-pic|<tuple|51|8>>
    <associate|eq:kg-energy|<tuple|48|7>>
    <associate|eq:kg-energy-interact|<tuple|49|8>>
    <associate|eq:kg-eqn-2|<tuple|46|7>>
    <associate|eq:kg-final|<tuple|62|10>>
    <associate|eq:kg-inner-product|<tuple|42|6>>
    <associate|eq:kg-operatorial|<tuple|61|9>>
    <associate|eq:kg-soln|<tuple|47|7>>
    <associate|eq:klein-gordon|<tuple|41|6>>
    <associate|eq:pic-equiv-proof|<tuple|53|8>>
    <associate|eq:pic-equivalence|<tuple|52|8>>
    <associate|eq:positive-definite|<tuple|104|16>>
    <associate|eq:pq-qp-spectrum|<tuple|19|4>>
    <associate|eq:pq-spectrum|<tuple|18|4>>
    <associate|eq:pq-spectrum-unbounded|<tuple|20|4>>
    <associate|eq:q1-p1-ccr|<tuple|15|3>>
    <associate|eq:q1-p1-def|<tuple|14|3>>
    <associate|eq:quasi1|<tuple|72|12>>
    <associate|eq:quasi2|<tuple|73|12>>
    <associate|eq:scalar-annihil|<tuple|43|6>>
    <associate|eq:scalar-creation|<tuple|44|7>>
    <associate|eq:schrodinger|<tuple|50|8>>
    <associate|eq:taylor-expansion|<tuple|7|2>>
    <associate|eq:u-action|<tuple|8|2>>
    <associate|eq:u-q-u-inverse|<tuple|9|2>>
    <associate|eq:u0v0-1|<tuple|77|13>>
    <associate|eq:u0v0-2|<tuple|78|13>>
    <associate|eq:unitary-equiv|<tuple|45|7>>
    <associate|eq:unitary-ops|<tuple|37|6>>
    <associate|eq:uv-computation|<tuple|12|2>>
    <associate|eq:v-def|<tuple|11|2>>
    <associate|eq:vccr|<tuple|63|10>>
    <associate|eq:weyl-cmplx|<tuple|103|15>>
    <associate|lemma:unbounded|<tuple|1|3>>
    <associate|lemma:weyl|<tuple|4|15>>
    <associate|thm:araki-segal|<tuple|3|13>>
    <associate|thm:gns|<tuple|5|16>>
    <associate|thm:quasiinvariant|<tuple|2|11>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      gelfand-vilenkin

      araki63

      gelfand-vilenkin
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|7.1. Canonical Commutation Relations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|7.2. Quantum Fields
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1<space|2spc>Infinite Degrees of Freedom
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>