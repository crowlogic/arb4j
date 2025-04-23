<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
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

  for every <math|\<phi\>,\<psi\>\<in\>\<frak-V\>>.

  Of course, this is a straightforward generalization of the finite number of
  degrees of freedom case. But now the von Neumann uniqueness theorem does
  not hold and we can have many inequivalent
  <math|\<frak-V\>>-representations of the CCR. We shall only consider the
  so-called cyclic representations.

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
      <tformat|<table|<row|<cell|<around*|\||<wide|T|^><rsub|\<psi\>>\<mid\>Y*<big|sum>\<lambda\><rsub|k>*e<rsup|i*\<Phi\><around|(|\<phi\><rsub|k>|)>>|\|><rsup|2>>|<cell|=<around*|\||<big|sum>\<lambda\><rsub|k>*e<rsup|i*<wide|T|^><rsub|\<psi\>>*\<Phi\><around|(|\<phi\><rsub|k>|)>>|\|><rsup|2><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|j,k>\<lambda\><rsub|j>*\<lambda\><rsub|k><rsup|\<ast\>>*<big|int>e<rsup|i*<wide|T|^><rsub|\<psi\>>*\<Phi\>*<around|(|\<phi\><rsub|j>-\<phi\><rsub|k>|)>>*d*\<mu\>>>|<row|<cell|>|<cell|=<big|sum><rsub|j,k>\<lambda\><rsub|j>*\<lambda\><rsub|k><rsup|\<ast\>>*L<rsub|<wide|T|^><rsub|\<psi\>>*\<Phi\>>*<around|(|\<phi\><rsub|j>-\<phi\><rsub|k>|)>\<leq\>M<rsub|\<psi\>>*<big|sum><rsub|j,k>\<lambda\><rsub|j>*\<lambda\><rsub|k><rsup|\<ast\>>*L<rsub|\<Phi\>>*<around|(|\<phi\><rsub|j>-\<phi\><rsub|k>|)><eq-number>>>|<row|<cell|>|<cell|=M<rsub|\<psi\>><around*|\||<big|sum>\<lambda\><rsub|k>*e<rsup|i*\<Phi\><around|(|\<phi\><rsub|k>|)>>|\|><rsup|2><eq-number>>>>>
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
      <around|(|S<rsub|\<psi\>>*f<rsub|i>|)><around|(|\<omega\>|)>=lim
      <around|(|<wide|T|^><rsub|\<psi\>>*f<rsub|i>|)><around|(|\<omega\>|)>=lim
      f<rsub|i<rprime|'>>*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=f*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>=<around|(|<wide|T|^><rsub|\<psi\>>*f|)><around|(|\<omega\>|)><eq-number>>>>>
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
      \<mu\><rsub|\<psi\>><around|(|A|)>=\<mu\>*<around|(|T<rsub|\<psi\>>*A|)>=<big|int>\<chi\><rsub|A>*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>=<big|int><rsub|A>f<rsub|\<psi\>><around|(|\<omega\>|)>*d*\<mu\><around|(|\<omega\>|)>.<label|eq:quasi2>
    </equation>

    Hence <math|\<mu\><rsub|\<psi\>>> is absolutely continuous relative to
    <math|\<mu\>> and <math|f<rsub|\<psi\>>=d*\<mu\><rsub|\<psi\>>/d*\<mu\>\<in\>\<cal-H\>>.

    Conversely, suppose <reference|thm:quasiinvariant>.3 holds and let
    <math|<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>>> be a simple
    function in <math|\<cal-H\>>, where <math|A<rsub|i>\<cap\>A<rsub|j>=\<varnothing\>>
    for <math|i\<neq\>j>. Then

    <\align>
      <tformat|<table|<row|<cell|<around*|\||<wide|T|^><rsub|\<psi\>>*<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>>|\|><rsup|2>>|<cell|=<big|int><around*|\||<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>>*<around|(|T<rsub|\<psi\>><rsup|-1>*\<omega\>|)>|\|><rsup|2>*d*\<mu\>=<big|int><around*|\||<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>><around|(|\<omega\>|)>|\|><rsup|2>*d*\<mu\><rsub|\<psi\>><eq-number>>>|<row|<cell|>|<cell|=<big|int><around*|\||<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>>|\|><rsup|2>*f<rsub|\<psi\>>*d*\<mu\>=<big|sum><around|\||\<lambda\><rsub|j>|\|><rsup|2>*<big|int>\<chi\><rsub|A<rsub|j>>*f<rsub|\<psi\>>*d*\<mu\><eq-number>>>|<row|<cell|>|<cell|\<leq\><big|sum><around|\||\<lambda\><rsub|j>|\|><rsup|2><around|\<\|\|\>|f<rsub|\<psi\>>|\<\|\|\>><rsup|2>*\<mu\><around|(|A<rsub|j>|)>=<around|\<\|\|\>|f<rsub|\<psi\>>|\<\|\|\>><rsup|2><around*|\||<big|sum>\<lambda\><rsub|j>*\<chi\><rsub|A<rsub|j>>|\|><rsup|2><eq-number>>>>>
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
        <tformat|<table|<row|<cell|<around|[|V<rsub|0><around|(|\<phi\>|)>*f|]><around|(|\<omega\>|)>>|<cell|=e<rsup|-i*\<Phi\><around|(|\<phi\>|)><around|(|\<omega\>|)>>*f<around|(|\<omega\>|)>,<eq-number><label|eq:u0v0-1>>>|<row|<cell|<vspace*|U><around|(|\<omega\>|)>>|<cell|=<around|[|\<Psi\><around|(|\<psi\>|)>|]><around|(|\<omega\>|)>*<around|[|<wide|T|^><rsub|\<psi\>>*f|]><around|(|\<omega\>|)><eq-number><label|eq:u0v0-2>>>>>
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
    (a) It is clear that <math|V<rsub|0>> as defined above is unitary and
    that <math|V<rsub|0>*<around|(|\<phi\>+\<psi\>|)>=V<rsub|0><around|(|\<phi\>|)>*V<rsub|0><around|(|\<psi\>|)>>
    for all <math|\<phi\>,\<psi\>\<in\>\<frak-V\>>. Strong continuity follows
    from the dominated convergence theorem.

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

    We now show that <math|f<rsub|\<phi\>+\<psi\>><around|(|\<omega\>|)>=f<rsub|\<phi\>><around|(|\<omega\>|)>*f<rsub|\<psi\>>*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)>>.
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
    follows as above.

    To show the canonical commutation relations, use the <math|T>-covariance
    of <math|\<Phi\>>:

    <\align>
      <tformat|<table|<row|<cell|<around|[|U<rsub|0><around|(|\<phi\>|)>*V<rsub|0><around|(|\<psi\>|)>*f|]><around|(|\<omega\>|)>>|<cell|=\<Psi\><around|(|\<phi\>|)>*<around|[|V<rsub|0><around|(|\<psi\>|)>*f|]>*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<Psi\><around|(|\<phi\>|)>*exp
      <around*|{|-i<around|[|\<Phi\><around|(|\<psi\>|)>|]>*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)>|}>*f*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<Psi\><around|(|\<phi\>|)>*exp
      <around*|{|-i<around|[|\<Phi\><rsub|\<phi\>><around|(|\<psi\>|)>|]><around|(|\<omega\>|)>|}>*f*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=\<Psi\><around|(|\<phi\>|)>*e<rsup|-i*\<Phi\><around|(|\<psi\>|)><around|(|\<omega\>|)>>*e<rsup|i*<around|\<langle\>|\<phi\>,\<psi\>|\<rangle\>>>*f*<around|(|T<rsub|\<phi\>><rsup|-1>*\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=e<rsup|i*<around|\<langle\>|\<phi\>,\<psi\>|\<rangle\>>>*<around|[|V<rsub|0><around|(|\<psi\>|)>*U<rsub|0><around|(|\<phi\>|)>*f|]><around|(|\<omega\>|)><eq-number>>>>>
    </align>

    Thus, the CCR <eqref|eq:vccr> holds. The indicator function
    <math|<with|math-font-family|bf|1>> is a cyclic vector since
    <math|<math-up|span><around|{|e<rsup|i*\<Phi\><around|(|\<phi\>|)>>:\<phi\>\<in\>\<frak-V\>|}>>
    is dense.

    (b) We first show that <math|<around|(|U,V|)>> has a unique extension to
    a cyclic <math|<wide|\<frak-V\>|\<bar\>>>-representation of the CCR on
    <math|\<cal-H\>>. For <math|\<phi\>\<in\><wide|\<frak-V\>|\<bar\>>>, let
    <math|\<phi\><rsub|i>> be a sequence in <math|\<frak-V\>> converging to
    <math|\<phi\>>. Now <math|U<around|(|\<phi\><rsub|i>|)>> is strongly
    Cauchy in <math|\<cal-H\>> since for every <math|f\<in\>\<cal-H\>>

    <\equation*>
      lim<rsub|i,j\<to\>\<infty\>><around|\<\|\|\>|U<around|(|\<phi\><rsub|i>|)>*f-U<around|(|\<phi\><rsub|j>|)>*f|\<\|\|\>>=lim<rsub|i,j\<to\>\<infty\>><around|\<\|\|\>|f-U*<around|(|\<phi\><rsub|j>-\<phi\><rsub|i>|)>*f|\<\|\|\>>=0.
    </equation*>

    Defining <math|U<around|(|\<phi\>|)>*f=lim
    U<around|(|\<phi\><rsub|i>|)>*f> gives a well-defined linear operator
    which is bounded by the uniform boundedness theorem. Extend <math|V> to
    <math|<wide|\<frak-V\>|\<bar\>>> similarly. By taking limits it is
    straightforward to show that <math|<around|(|U,V|)>> extended in this way
    gives a cyclic <math|<wide|\<frak-V\>|\<bar\>>>-representation of the CCR
    on <math|\<cal-H\>>. Let <math|<around|{|\<psi\><rsub|i>|}>> be an
    orthonormal basis for <math|<wide|\<frak-V\>|\<bar\>>> where
    <math|\<psi\><rsub|i>\<in\>\<frak-V\>>, <math|i=1,2,\<ldots\>>. Let
    <math|<around|{|f<rsub|i>|}>> be an orthonormal basis for
    <math|L<rsup|2><around|(|\<bbb-R\>,d*x|)>> where <math|f<rsub|i>> are in
    the Schwartz space, and define the isomorphism
    <math|J:<wide|\<frak-V\>|\<bar\>>\<to\>L<rsup|2><around|(|\<bbb-R\>,d*x|)>>
    by <math|J<around|(|\<psi\><rsub|i>|)>=f<rsub|i>>. Then
    <math|<around|(|U\<circ\>J<rsup|-1>,V\<circ\>J<rsup|-1>|)>> is a cyclic
    <math|L<rsup|2><around|(|\<bbb-R\>,d*x|)>>-representation of the CCR.

    Applying a theorem due to Gelfand-Vilenkin <cite|gelfand-vilenkin>, there
    exist:

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
    by <math|<around|[|\<Phi\><around|(|\<phi\>|)>|]><around|(|f|)>=f*<around|(|J*\<phi\>|)>>,
    the random functional <math|\<Psi\><around|(|\<phi\>|)>=F<rsub|J*\<phi\>><around|(|f|)>>,
    and the action <math|T<rsub|\<phi\>>*f=f+f<rsub|J*\<phi\>>>. Now define
    <math|U<rsub|0><around|(|\<phi\>|)>=U<rsub|1>*<around|(|J*\<phi\>|)>>,
    <math|V<rsub|0><around|(|\<phi\>|)>=V<rsub|1>*<around|(|J*\<phi\>|)>>.
    Then, <math|<around|(|\<Phi\>,T|)>> and
    <math|<around|(|U<rsub|0>,V<rsub|0>|)>> satisfy the conditions of the
    theorem. Furthermore, <math|<around|(|U,V|)>> is equivalent to
    <math|<around|(|U<rsub|0>,V<rsub|0>|)>>.
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
    <associate|auto-1|<tuple|1|1>>
    <associate|eq:A-operator|<tuple|37|7>>
    <associate|eq:AWA|<tuple|39|7>>
    <associate|eq:complex-inner-product|<tuple|33|6>>
    <associate|eq:complexification|<tuple|32|5>>
    <associate|eq:cyclic-v|<tuple|2|1>>
    <associate|eq:positive-definite|<tuple|35|6>>
    <associate|eq:quasi1|<tuple|10|3>>
    <associate|eq:quasi2|<tuple|11|3>>
    <associate|eq:u0v0-1|<tuple|15|3>>
    <associate|eq:u0v0-2|<tuple|16|3>>
    <associate|eq:vccr|<tuple|1|1>>
    <associate|eq:weyl-cmplx|<tuple|34|6>>
    <associate|lemma:weyl|<tuple|3|6>>
    <associate|thm:araki-segal|<tuple|2|3>>
    <associate|thm:gns|<tuple|4|6>>
    <associate|thm:quasiinvariant|<tuple|1|2>>
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
      <with|par-left|<quote|1tab>|1<space|2spc>Infinite Degrees of Freedom
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>
    </associate>
  </collection>
</auxiliary>