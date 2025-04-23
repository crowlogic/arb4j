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
    <item><tabular|<tformat|<table|<row|<\cell>
      <math|U<around*|(|f<rsub|1>|)>*U<around*|(|f<rsub|2>|)>=U*<around*|(|f<rsub|1>+f<rsub|2>|)>>

      and

      <math|V<around*|(|g<rsub|1>|)>*V<around*|(|g<rsub|2>|)>=V*<around*|(|g<rsub|1>+g<rsub|2>|)>>
    </cell>>|<row|<\cell>
      \<forall\><math|f<rsub|1>,f<rsub|2>,g<rsub|1>,g<rsub|2>\<in\><with|math-font|cal*|H>>
    </cell>>>>>

    <item><tabular|<tformat|<table|<row|<cell|<math|lim<rsub|n\<rightarrow\>\<infty\>>
    U<around*|(|f<rsub|n>|)>*\<phi\>=U<around|(|f|)>*\<phi\>>>>|<row|<cell|and>>|<row|<cell|<math|lim<rsub|n\<rightarrow\>\<infty\>>
    V<around*|(|g<rsub|n>|)>*\<phi\>=V<around|(|g|)>*\<phi\>>>>|<row|<cell|\<forall\><math|\<phi\>\<in\><with|math-font|cal*|K>>
    whenever <with|font-base-size|8|<math|lim<rsub|n\<rightarrow\>\<infty\>>
    f<rsub|n>=f> and <math|lim<rsub|n\<rightarrow\>\<infty\>> g<rsub|n>=g> in
    <math|<with|math-font|cal*|H>>>>>>>>
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
  creation operators will be defined below.)

  For <math|f\<in\><with|math-font|cal*|H>>, the Segal field operator is
  defined by

  <\equation>
    <label|eq:field-operator>\<Phi\><around|(|f|)>=<around|(|Q<around|(|f|)>+P<around|(|f|)>|)>/<sqrt|2>
  </equation>

  where <math|Q<around|(|f|)>=a<rsup|\<ast\>><around|(|f|)>+a<around|(|f|)>>
  (position operator) and <math|P<around|(|f|)>=i*<around*|(|a<rsup|\<ast\>><around|(|f|)>-a<around|(|f|)>|)>>
  (momentum operator). Here, <math|a<rsup|\<ast\>><around|(|f|)>> is the
  creation operator and <math|a<around|(|f|)>> is the annihilation operator.
  For <math|f<rsub|1>,\<ldots\>,f<rsub|n>\<in\>L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>>,
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

  for all <math|f,g\<in\>L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>>.

  Returning to the Segal field operators <math|\<Phi\><around|(|f|)>>, let us
  define the unitary operators

  <\equation>
    <label|eq:unitary-ops><tabular|<tformat|<table|<row|<cell|U<around|(|f|)>=e<rsup|-i*P<around|(|f|)>>>>|<row|<cell|V<around|(|f|)>=e<rsup|-i*Q<around|(|f|)>>>>>>>
  </equation>

  for <math|f\<in\>L<rsup|2><around*|(|\<bbb-R\><rsup|3>|)>>.

  It can be shown that <eqref|eq:ccr-weyl-inf> holds for these operators. A
  fermion field is similar to a boson field with a few changes. The position
  operator is

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
    <label|eq:ham-field-comm>

    <\aligned>
      <tformat|<table|<row|<cell|>|<cell|<around|[|H,\<phi\><around|(|x|)>|]>=i*\<pi\><around|(|x|)>>>|<row|<cell|>|<cell|<around|[|H,\<pi\><around|(|x|)>|]>=-i*<around*|[|-\<nabla\><rsup|2>+m<rsup|2>|]>*\<phi\><around|(|x|)>>>>>
    </aligned>
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
    <associate|auto-2|<tuple|22|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-3|<tuple|1|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:boson-fock|<tuple|24|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:canonical-variables|<tuple|47|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-heisenberg|<tuple|5|1|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-heisenberg-n|<tuple|21|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-schrodinger|<tuple|10|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-weyl|<tuple|13|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-weyl-inf|<tuple|23|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ccr-weyl-n|<tuple|22|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:creation-annihilation-ccr|<tuple|28|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:creation-op|<tuple|27|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:domain-q|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:fermion-ccr|<tuple|32|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:fermion-p|<tuple|31|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:fermion-q|<tuple|30|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:field-ccr|<tuple|48|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:field-operator|<tuple|26|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:fock-inner-product|<tuple|25|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:free-hamiltonian|<tuple|49|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:ham-field-comm|<tuple|50|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:heis-eqn-phi|<tuple|51|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:heis-eqn-pi|<tuple|52|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:heisenberg-eqn|<tuple|46|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:heisenberg-pic|<tuple|43|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:kg-energy|<tuple|40|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:kg-energy-interact|<tuple|41|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:kg-eqn-2|<tuple|38|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:kg-final|<tuple|54|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:kg-inner-product|<tuple|34|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:kg-operatorial|<tuple|53|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:kg-soln|<tuple|39|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:klein-gordon|<tuple|33|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:pic-equiv-proof|<tuple|45|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:pic-equivalence|<tuple|44|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:pq-qp-spectrum|<tuple|19|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:pq-spectrum|<tuple|18|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:pq-spectrum-unbounded|<tuple|20|4|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:q1-p1-ccr|<tuple|15|3|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:q1-p1-def|<tuple|14|3|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:scalar-annihil|<tuple|35|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:scalar-creation|<tuple|36|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:schrodinger|<tuple|42|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:taylor-expansion|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:u-action|<tuple|8|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:u-q-u-inverse|<tuple|9|2|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:unitary-equiv|<tuple|37|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|eq:unitary-ops|<tuple|29|?|../../.TeXmacs/texts/scratch/no_name_1.tm>>
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