<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|Energetic Hilbert Subspaces>>

  <section*|Introduction>

  In mathematics, more precisely in functional analysis, an energetic space
  is, intuitively, a subspace of a given real Hilbert space equipped with a
  new "energetic" inner product. The motivation for the name comes from
  physics, as in many physical problems the energy of a system can be
  expressed in terms of the energetic inner product.

  <section*|Energetic Space>

  Formally, consider a real Hilbert space <math|X> with the inner product
  <math|(\<cdot\>\|\<cdot\>)> and the norm
  <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>>>. Let <math|Y> be a linear
  subspace of <math|X> and <math|B:Y\<to\>X> be a strongly monotone symmetric
  linear operator, that is, a linear operator satisfying:

  <\itemize>
    <item><math|<around|(|B*u\|v|)>=<around|(|u\|B*v|)>> \<forall\>
    <math|u,v\<in\>Y>

    <item><math|<around|(|B*u\|u|)>\<ge\>c<around|\<\|\|\>|u|\<\|\|\>><rsup|2>>
    for some constant <math|c\<gtr\>0> and \<forall\><math|u\<in\>Y>
  </itemize>

  The <with|font-series|bold|energetic inner product> is defined as:

  <\equation>
    <around|(|u\|v|)><rsub|E>=<around|(|B*u\|v|)>
  </equation>

  for all <math|u,v\<in\>Y>.

  The <with|font-series|bold|energetic norm> is:

  <\equation>
    <around|\<\|\|\>|u|\<\|\|\>><rsub|E>=<sqrt|<around|(|u\|u|)><rsub|E>>
  </equation>

  for all <math|u\<in\>Y>.

  The set <math|Y> together with the energetic inner product is a pre-Hilbert
  space. The <with|font-series|bold|energetic space> <math|X<rsub|E>> is
  defined as the completion of <math|Y> in the energetic norm.
  <math|X<rsub|E>> can be considered a subset of the original Hilbert space
  <math|X>, since any Cauchy sequence in the energetic norm is also Cauchy in
  the norm of <math|X> (this follows from the strong monotonicity property of
  <math|B>).

  The energetic inner product is extended from <math|Y> to <math|X<rsub|E>>
  by:

  <\equation>
    <around|(|u\|v|)><rsub|E>=lim<rsub|n\<to\>\<infty\>><around|(|u<rsub|n>\|v<rsub|n>|)><rsub|E>
  </equation>

  where <math|<around|(|u<rsub|n>|)>> and <math|<around|(|v<rsub|n>|)>> are
  sequences in <math|Y> that converge to points in <math|X<rsub|E>> in the
  energetic norm.

  <section*|Energetic Extension>

  The operator <math|B> admits an <with|font-series|bold|energetic extension>
  <math|B<rsub|E>>:

  <\equation>
    B<rsub|E>:X<rsub|E>\<to\>X<rsub|E><rsup|\<ast\>>
  </equation>

  defined on <math|X<rsub|E>> with values in the dual space
  <math|X<rsub|E><rsup|\<ast\>>> and given by the formula:

  <\equation>
    <around|\<langle\>|B<rsub|E>*u\|v|\<rangle\>><rsub|E>=<around|(|u\|v|)><rsub|E>
  </equation>

  for all <math|u,v\<in\>X<rsub|E>>.

  Here, <math|\<langle\>\<cdot\>\|\<cdot\>\<rangle\><rsub|E>> denotes the
  duality bracket between <math|X<rsub|E><rsup|\<ast\>>> and
  <math|X<rsub|E>>, so <math|<around|\<langle\>|B<rsub|E>*u\|v|\<rangle\>><rsub|E>>
  actually denotes <math|<around|(|B<rsub|E>*u|)><around|(|v|)>>.

  If <math|u> and <math|v> are elements in the original subspace <math|Y>,
  then:

  <\equation*>
    <around|\<langle\>|B<rsub|E>*u\|v|\<rangle\>><rsub|E>=<around|(|u\|v|)><rsub|E>=<around|(|B*u\|v|)>=<around|\<langle\>|u<around|\||B|\|>*v|\<rangle\>>
  </equation*>

  by the definition of the energetic inner product. If one views <math|B*u>,
  which is an element in <math|X>, as an element in the dual
  <math|X<rsup|\<ast\>>> via the Riesz representation theorem, then
  <math|B*u> will also be in the dual <math|X<rsub|E><rsup|\<ast\>>> (by the
  strong monotonicity property of <math|B>). Via these identifications, it
  follows that <math|B<rsub|E>*u=B*u>. In other words, the original operator
  <math|B:Y\<to\>X> can be viewed as an operator
  <math|B:Y\<to\>X<rsub|E><rsup|\<ast\>>>, and then
  <math|B<rsub|E>:X<rsub|E>\<to\>X<rsub|E><rsup|\<ast\>>> is simply the
  function extension of <math|B> from <math|Y> to <math|X<rsub|E>>.

  <section*|An Example from Physics>

  Consider a string whose endpoints are fixed at two points <math|a\<less\>b>
  on the real line. Let the vertical outer force density at each point
  <math|x> (<math|a\<le\>x\<le\>b>) on the string be
  <math|f<around|(|x|)><math-bf|e>>, where <math|<math-bf|e>> is a unit
  vector pointing vertically and <math|f:<around|[|a,b|]>\<to\>\<bbb-R\>>.
  Let <math|u<around|(|x|)>> be the deflection of the string at the point
  <math|x> under the influence of the force. Assuming that the deflection is
  small, the elastic energy of the string is:

  <\equation>
    <frac|1|2>*<big|int><rsub|a><rsup|b>u<rprime|'><around|(|x|)><rsup|2>*<space|0.17em>d*x
  </equation>

  and the total potential energy of the string is:

  <\equation>
    F<around|(|u|)>=<frac|1|2>*<big|int><rsub|a><rsup|b>u<rprime|'><around|(|x|)><rsup|2>*<space|0.17em>d*x-<big|int><rsub|a><rsup|b>u<around|(|x|)>*f<around|(|x|)>*<space|0.17em>d*x
  </equation>

  The deflection <math|u<around|(|x|)>> minimizing the potential energy will
  satisfy the differential equation:

  <\equation>
    -u<rprime|''>=f
  </equation>

  with boundary conditions:

  <\equation>
    u<around|(|a|)>=u<around|(|b|)>=0
  </equation>

  To study this equation, consider the space
  <math|X=L<rsup|2><around|(|a,b|)>>, the <math|L<rsup|2>> space of all
  square-integrable functions <math|u:<around|[|a,b|]>\<to\>\<bbb-R\>> with
  respect to the Lebesgue measure. This space is Hilbert with the inner
  product:

  <\equation>
    <around|(|u\|v|)>=<big|int><rsub|a><rsup|b>u<around|(|x|)>*v<around|(|x|)>*<space|0.17em>d*x
  </equation>

  and the norm given by:

  <\equation>
    <around|\<\|\|\>|u|\<\|\|\>>=<sqrt|<around|(|u\|u|)>>
  </equation>

  Let <math|Y> be the set of all twice continuously differentiable functions
  <math|u:<around|[|a,b|]>\<to\>\<bbb-R\>> with the boundary conditions
  <math|u<around|(|a|)>=u<around|(|b|)>=0>. Then <math|Y> is a linear
  subspace of <math|X>.

  Consider the operator <math|B:Y\<to\>X> given by:

  <\equation>
    B*u=-u<rprime|''>
  </equation>

  so the deflection satisfies the equation <math|B*u=f>. Using integration by
  parts and the boundary conditions, one can see that:

  <\equation>
    <around|(|B*u\|v|)>=-<big|int><rsub|a><rsup|b>u<rprime|''><around|(|x|)>*v<around|(|x|)>*<space|0.17em>d*x=<big|int><rsub|a><rsup|b>u<rprime|'><around|(|x|)>*v<rprime|'><around|(|x|)>*<space|0.17em>d*x=<around|(|u\|B*v|)>
  </equation>

  for any <math|u> and <math|v\<in\>Y>. Therefore, <math|B> is a symmetric
  linear operator.

  <math|B> is also strongly monotone, since by Friedrichs's inequality:

  <\equation>
    <around|\<\|\|\>|u|\<\|\|\>><rsup|2>=<big|int><rsub|a><rsup|b>u<rsup|2><around|(|x|)>*<space|0.17em>d*x\<le\>C*<big|int><rsub|a><rsup|b>u<rprime|'><around|(|x|)><rsup|2>*<space|0.17em>d*x=C*<around|(|B*u\|u|)>
  </equation>

  for some <math|C\<gtr\>0>.

  The energetic space with respect to the operator <math|B> is the Sobolev
  space <math|H<rsup|1><rsub|0><around|(|a,b|)>>. The elastic energy of the
  string which motivated this study is:

  <\equation>
    <frac|1|2>*<big|int><rsub|a><rsup|b>u<rprime|'><around|(|x|)><rsup|2>*<space|0.17em>d*x=<frac|1|2><around|(|u\|u|)><rsub|E>
  </equation>

  so it is half of the energetic inner product of <math|u> with itself.

  To calculate the deflection <math|u> minimizing the total potential energy
  <math|F<around|(|u|)>> of the string, one writes this problem in the form:

  <\equation>
    <around|(|u\|v|)><rsub|E>=<around|(|f\|v|)\<forall\>v\<in\>X<rsub|E>>
  </equation>

  Next, one usually approximates <math|u> by some <math|u<rsub|h>>, a
  function in a finite-dimensional subspace of the true solution space. For
  example, one might let <math|u<rsub|h>> be a continuous piecewise linear
  function in the energetic space, which gives the finite element method. The
  approximation <math|u<rsub|h>> can be computed by solving a system of
  linear equations.

  The energetic norm turns out to be the natural norm in which to measure the
  error between <math|u> and <math|u<rsub|h>>, see Céa's lemma.

  <section*|References>

  <\itemize>
    <item>Zeidler, Eberhard. <with|font-shape|italic|Applied functional
    analysis: applications to mathematical physics>. New York:
    Springer-Verlag, 1995. ISBN 0-387-94442-7.

    <item>Johnson, Claes. <with|font-shape|italic|Numerical solution of
    partial differential equations by the finite element method>. Cambridge
    University Press, 1987. ISBN 0-521-34514-6.
  </itemize>

  \;

  <no-indent><with|font-series|bold|Corollary 3.> If
  <math|<around|{|\<varphi\><rsub|n>|}>\<subset\>D<around|(|P|)>> and the
  sequence <math|<around|{|P*\<varphi\><rsub|n>|}>> is complete in an initial
  Hilbert space <math|H>, then the sequence
  <math|<around|{|\<varphi\><rsub|n>|}>> is complete in the energetic space
  <math|H<rsub|P>>.

  <subsection*|2.3. Examples>

  The examples listed below present various ways of determining complete
  sequences with the aid of the theorems proved. Having a given sequence, it
  is sufficient to prove its completeness in the energetic space
  <math|H<rsub|P>>, since every sequence complete in <math|H<rsub|P>> is also
  complete in an initial Hilbert space <math|H> <cite|15>. Sometimes,
  however, in order to prove the completeness of a sequence in
  <math|H<rsub|P>> one should have shown its completeness in <math|H> from
  the start. Even when there is no need to do so, it is preferable to become
  acquainted with direct proofs of the completeness of the sequences in the
  initial space <math|H> with the aim of understanding how the theorems
  proved above are used.

  In all examples, except one, <math|H> is assumed to be the space of
  quadratically integrable functions and <math|P> is always the operator
  <math|-\<Delta\>> with the homogeneous Dirichlet boundary condition.
  Therefore the domain <math|D*<around|(|-\<Delta\>|)>> consists of those
  functions of the space <math|H> which are twice continuously differentiable
  in the considered area and vanish on its boundary.

  <\example>
    Consider on the interval <math|D=<around*|(|0,a|)>> the sequence
    <math|<around|{|\<varphi\><rsub|n>|}>=<around|{|x<rsup|n>*<around|(|a-x|)>:n=1,2,\<ldots\>|}>>.

    Let <math|\<cal-F\>> be the family consisting of
    <math|\<varphi\><rsub|1>> and <math|\<varphi\><rsub|2>>. Raising the
    difference <math|a-x> to <math|m>th power according to the binomial
    theorem and multiplying by <math|x<rsup|n>*<around|(|a-x|)>> we ascertain
    that <math|x<rsup|n>*<around|(|a-x|)><rsup|m+1>> is a linear combination
    of the terms of the sequence <math|<around|{|\<varphi\><rsub|n>|}>>. Thus
    after addition of the constant <math|\<varphi\><rsub|0>=1> to the
    considered sequence, it is obvious that the sequence AS given by the
    formula (10) is a subset of the linear space
    Lin<math|<around|{|\<varphi\><rsub|n>:n=0,1,2,\<ldots\>|}>>. Taking two
    points <math|x<rprime|'>> and <math|x<rprime|''>> from the open interval
    <math|<around|(|0,a|)>> such that <math|\<varphi\><rsub|1><around|(|x<rprime|'>|)>=\<varphi\><rsub|1><around|(|x<rprime|''>|)>>
    and <math|\<varphi\><rsub|2><around|(|x<rprime|'>|)>=\<varphi\><rsub|2><around|(|x<rprime|''>|)>>,
    and dividing the second equation by the first, we obtain
    <math|x<rprime|'>=x<rprime|''>>. Therefore the family <math|\<cal-F\>>
    separates the points of the interval <math|<around|(|0,a|)>> and
    <math|R<around|(|\<cal-F\>|)>> is the two-point set
    <math|<around|{|0,a|}>> being the boundary <math|\<partial\>*D> of the
    set <math|D>. Let AS<math|<rsub|2>=<around|{|\<varphi\><rsub|n>|}>> and
    AS<rsub|<math|1>> will be the one-element sequence
    <math|<around|{|\<varphi\><rsub|0>|}>>. Of course, AS<rsub|<math|1>>
    consisting only of a constant function fulfills the assumptions of the
    corollary of Theorem 2 (taking advantage of it one should assume
    <math|k=1> and <math|S<rsub|1>=\<partial\>*D>). Thus according to this
    corollary the sequence <math|<around|{|\<varphi\><rsub|n>|}>> is complete
    in <math|L<rsub|2><around|(|D|)>>.
  </example>

  To prove the completeness of the sequence
  <math|<around|{|\<varphi\><rsub|n>|}>> in <math|H<rsub|-\<Delta\>>>, let us
  observe that\ 

  <\equation>
    1=-\<Delta\>*<frac|\<varphi\>|2>
  </equation>

  <\equation>
    x<rsup|n-1>=<frac|<around|[|n*<around|(|n-1|)>*a*x<rsup|n-2>-2*\<Delta\>*\<varphi\><rsub|n>|]>|<around|(|n<rsup|2>+n|)>>\<forall\>n=2,3,\<ldots\>
  </equation>

  , rom which it follows that every element of the sequence
  <math|<around|{|\<psi\><rsub|n>|}>=<around|{|x<rsup|n>:n=0,1,2,\<ldots\>|}>>

  <\proof>
    Let <math|g\<in\>C<around|(|D|)>>. By virtue of condition (a) there exist
    <math|f<rsub|n>\<in\><text|Lin><around|{|\<varphi\><rsub|n>|}>> such that
    <math|sup <around|{|<around|\||f<around|(|u|)>*P<rsub|n>*f<around|(|u|)>-f<around|(|u|)>|\|>:u\<in\>D|}>\<leq\>1/n>.
    Because <math|1/f\<in\>L<rsub|2><around|(|D|)>>, the inverse image
    <math|f<rsup|-1><around|[|0|]>> is of measure zero. Therefore
    <math|<around|\||P<rsub|n>*f-g|\|>\<rightarrow\>0> almost everywhere and
    <math|<around|\||P<rsub|n>*f-g|\|><rsup|2>\<leq\>1/<around|\||f|\|><rsup|2>>.
    Consequently <math|<around|\<\|\|\>|P<rsub|n>*f-g|\<\|\|\>>\<rightarrow\>0>
    by the Lebesgue dominated convergence theorem, which, together with the
    known fact that the set of continuous functions is dense in
    <math|L<rsub|2><around|(|D|)>>, proves that the sequence
    <math|<around|{|P*\<varphi\><rsub|n>|}>> is complete in
    <math|L<rsub|2><around|(|D|)>>.

    <no-indent>If condition (b) is fulfilled, then for any
    <math|g\<in\>L<rsub|2><around|(|D|)>> there exists a
    <math|g<rsub|n>\<in\><text|Lin><around|{|\<varphi\><rsub|n>|}>> such that
    <math|<around|\<\|\|\>|f*P<rsub|n>-f*g|\<\|\|\>>\<leq\>1/n>. The
    inequality <math|<around|\||f|\|><rsub|inf>\<cdot\><around|\<\|\|\>|P<rsub|n>-g|\<\|\|\>>\<leq\><around|\<\|\|\>|f*P<rsub|n>-f*g|\<\|\|\>>>
    implies that <math|<around|\<\|\|\>|P<rsub|n>-g|\<\|\|\>>\<rightarrow\>0>
    since <math|<around|\||f|\|><rsub|inf>\<neq\>0>, from where it follows
    that the sequence <math|<around|{|P*\<varphi\><rsub|n>|}>> is complete in
    <math|L<rsub|2><around|(|D|)>> also for the case (b). From the two
    inequalities satisfied by every positive definite operator

    <\equation>
      \;
    </equation>

    <\equation>
      <tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<table|<row|<cell|<around|\<\|\|\>|P*h|\<\|\|\>>>|<cell|\<geq\>\<mu\><around|\<\|\|\>|h|\<\|\|\>>>>|<row|<cell|<around|\<\|\|\>|P*h|\<\|\|\>>\<cdot\><around|\<\|\|\>|h|\<\|\|\>>>|<cell|\<geq\><around|\<\|\|\>|h|\<\|\|\>><rsup|2>>>>>><space|1em>\<forall\>h\<in\>D<around|(|P|)>
    </equation>

    <no-indent>where <math|\<mu\>> is a positive real number, and
    <math|<around|\<\|\|\>|h|\<\|\|\>><rsub|P>> denotes the norm in
    <math|H<rsub|P>>, we come to a conclusion that
    <math|<around|\<\|\|\>|h<rsub|n>|\<\|\|\>><rsub|P>\<rightarrow\>0> for
    any sequence <math|<around|{|h<rsub|n>|}>\<subset\>D<around|(|P|)>> such
    that <math|<around|\<\|\|\>|P*h<rsub|n>|\<\|\|\>>\<rightarrow\>0>. Thus
    by the completeness of the sequence <math|<around|{|P*\<varphi\><rsub|n>|}>>
    in <math|L<rsub|2><around|(|D|)>>, the sequence
    <math|<around|{|\<varphi\><rsub|n>|}>> is complete in <math|H<rsub|P>>,
    which completes the proof.
  </proof>

  <no-indent>From the point (a) of the above theorem the following corollary
  results directly:

  <\corollary>
    If <math|<around|{|\<varphi\><rsub|n>|}>> is a sequence in
    <math|D<around|(|P|)>>, and there exists a sequence
    <math|<around|{|\<psi\><rsub|n>|}>> complete in <math|C<around|(|D|)>>
    and a function <math|f\<in\>C<around|(|D|)>>,
    <math|1/f\<in\>L<rsub|2><around|(|D|)>>, such that each function
    <math|\<psi\><rsub|n>> can be uniformly approximated by linear
    combinations of the terms of the sequence
    <math|<around|{|f*P*\<varphi\><rsub|n>|}>> (in particular when
    <math|<around|{|\<psi\><rsub|n>|}>\<subset\><text|Lin><around|{|f*P*\<varphi\><rsub|n>|}>>,
    i.e., when each of the functions <math|\<psi\><rsub|n>> is a linear
    combination of the terms of the sequence
    <math|<around|{|f*P*\<varphi\><rsub|n>|}>>), then the sequence
    <math|<around|{|\<varphi\><rsub|n>|}>> is complete in the energetic space
    <math|H<rsub|P>>.
  </corollary>

  <no-indent>Assuming that <math|P> is the identity operator
  <math|<around|(|P*u=u|)>>, choosing the function <math|f=1> and taking
  advantage of the part of the proof of Theorem 6 concerning case (a) (where,
  among other things, we replace the limit
  <math|<around|\<\|\|\>|P<rsub|n>*f-g|\<\|\|\>><rsup|2>\<rightarrow\>0> by
  the limit <math|<around|\||f<rsub|n>-g|\|><rsup|p>\<rightarrow\>0>) we
  obtain a proof of the following corollary:

  <\corollary>
    Every sequence complete in <math|C<around|(|D|)>> is also complete in
    <math|L<rsub|p><around|(|D|)>>.
  </corollary>

  <\corollary>
    \ If <math|<around|{|\<varphi\><rsub|n>|}>\<subset\>D<around|(|P|)>> and
    the sequence <math|<around|{|P*\<varphi\><rsub|n>|}>> is complete in an
    initial Hilbert space <math|H>, then the sequence
    <math|<around|{|\<varphi\><rsub|n>|}>> is complete in the energetic space
    <math|H<rsub|P>>.
  </corollary>

  <subsection*|2.3. Examples>

  The examples listed below present various ways of determining complete
  sequences with the aid of the theorems proved. Having a given sequence, it
  is sufficient to prove its completeness in the energetic space
  <math|H<rsub|P>>, since every sequence complete in <math|H<rsub|P>> is also
  complete in an initial Hilbert space <math|H> <cite|15>. Sometimes,
  however, in order to prove the completeness of a sequence in
  <math|H<rsub|P>> one should have shown its completeness in <math|H> from
  the start. Even when there is no need to do so, it is preferable to become
  acquainted with direct proofs of the completeness of the sequences in the
  initial space <math|H> with the aim of understanding how the theorems
  proved above are used.

  In all examples, except one, <math|H> is assumed to be the space of
  quadratically integrable functions and <math|P> is always the operator
  <math|-\<Delta\>> with the homogeneous Dirichlet boundary condition.
  Therefore the domain <math|D*<around|(|-\<Delta\>|)>> consists of those
  functions of the space <math|H> which are twice continuously differentiable
  in the considered area and vanish on its boundary.

  <\example>
    Consider on the interval <math|D=<around*|(|0,a|)>> the sequence
    <math|<around|{|\<varphi\><rsub|n>|}>=<around|{|x<rsup|n>*<around|(|a-x|)>:n=1,2,\<ldots\>|}>>.

    Let <math|\<cal-F\>> be the family consisting of
    <math|\<varphi\><rsub|1>> and <math|\<varphi\><rsub|2>>. Raising the
    difference <math|a-x> to <math|m>th power according to the binomial
    theorem and multiplying by <math|x<rsup|n>*<around|(|a-x|)>> we ascertain
    that <math|x<rsup|n>*<around|(|a-x|)><rsup|m+1>> is a linear combination
    of the terms of the sequence <math|<around|{|\<varphi\><rsub|n>|}>>. Thus
    after addition of the constant <math|\<varphi\><rsub|0>=1> to the
    considered sequence, it is obvious that the sequence AS given by the
    formula (10) is a subset of the linear space
    Lin<math|<around|{|\<varphi\><rsub|n>:n=0,1,2,\<ldots\>|}>>. Taking two
    points <math|x<rprime|'>> and <math|x<rprime|''>> from the open interval
    <math|<around|(|0,a|)>> such that <math|\<varphi\><rsub|1><around|(|x<rprime|'>|)>=\<varphi\><rsub|1><around|(|x<rprime|''>|)>>
    and <math|\<varphi\><rsub|2><around|(|x<rprime|'>|)>=\<varphi\><rsub|2><around|(|x<rprime|''>|)>>,
    and dividing the second equation by the first, we obtain
    <math|x<rprime|'>=x<rprime|''>>. Therefore the family <math|\<cal-F\>>
    separates the points of the interval <math|<around|(|0,a|)>> and
    <math|R<around|(|\<cal-F\>|)>> is the two-point set
    <math|<around|{|0,a|}>> being the boundary <math|\<partial\>*D> of the
    set <math|D>. Let AS<math|<rsub|2>=<around|{|\<varphi\><rsub|n>|}>> and
    AS<rsub|<math|1>> will be the one-element sequence
    <math|<around|{|\<varphi\><rsub|0>|}>>. Of course, AS<rsub|<math|1>>
    consisting only of a constant function fulfills the assumptions of the
    corollary of Theorem 2 (taking advantage of it one should assume
    <math|k=1> and <math|S<rsub|1>=\<partial\>*D>). Thus according to this
    corollary the sequence <math|<around|{|\<varphi\><rsub|n>|}>> is complete
    in <math|L<rsub|2><around|(|D|)>>.

    To prove the completeness of the sequence
    <math|<around|{|\<varphi\><rsub|n>|}>> in <math|H<rsub|-\<Delta\>>>, let
    us observe that <math|1=-\<Delta\>*\<varphi\>/2,x<rsup|n-1>=<around|[|n*<around|(|n-1|)>*a*x<rsup|n-2>-2*\<Delta\>*\<varphi\><rsub|n>|]>/<around|(|n<rsup|2>+n|)>,n=2,3,\<ldots\>>,
    from which it follows that every element of the sequence
    <math|<around|{|\<psi\><rsub|n>|}>=<around|{|x<rsup|n>:n=0,1,2,\<ldots\>|}>>
  </example>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-2|<tuple|?|?|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-3|<tuple|3|?|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-4|<tuple|5|?|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-5|<tuple|16|?|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-6|<tuple|<with|mode|<quote|math>|\<bullet\>>|?|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-7|<tuple|4|?|../../.TeXmacs/texts/scratch/no_name_39.tm>>
    <associate|auto-8|<tuple|4|?|../../.TeXmacs/texts/scratch/no_name_39.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      15
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|2.3. Examples
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>
    </associate>
  </collection>
</auxiliary>