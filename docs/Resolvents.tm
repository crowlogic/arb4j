<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <section*|VIII. Resolvent and Spectrum>

  Let <math|T> be a linear operator whose domain <math|D<around|(|T|)>> and
  range <math|R<around|(|T|)>> both lie in the same complex linear
  topological space <math|X>. We consider the linear operator

  <\equation>
    T<rsub|\<lambda\>>=\<lambda\>*I-T
  </equation>

  where <math|\<lambda\>> is a complex number and <math|I> the identity
  operator. The distribution of the values of <math|\<lambda\>> for which
  <math|T<rsub|\<lambda\>>> has an inverse and the properties of the inverse
  when it exists, are called the <with|font-shape|italic|spectral theory> for
  the operator <math|T>. We shall thus discuss the general theory of the
  inverse of <math|T<rsub|\<lambda\>>>.

  <subsection*|1. The Resolvent and Spectrum>

  <\definition>
    If <math|\<lambda\><rsub|0>> is such that the range
    <math|R<around|(|T<rsub|\<lambda\><rsub|0>>|)>> is dense in <math|X> and
    <math|T<rsub|\<lambda\><rsub|0>>> has a continuous inverse
    <math|<around|(|\<lambda\><rsub|0>*I-T|)><rsup|-1>>, we say that
    <math|\<lambda\><rsub|0>> is in the <with|font-shape|italic|resolvent
    set> <math|\<rho\><around|(|T|)>> of <math|T> and denote this inverse
    <math|<around|(|\<lambda\><rsub|0>*I-T|)><rsup|-1>> by
    <math|R<around|(|\<lambda\><rsub|0>;T|)>> and call it the
    <with|font-shape|italic|resolvent> (at <math|\<lambda\><rsub|0>>) of
    <math|T>. All complex numbers <math|\<lambda\>> not in
    <math|\<rho\><around|(|T|)>> form a set <math|\<sigma\><around|(|T|)>>
    called the <with|font-shape|italic|spectrum> of <math|T>. The spectrum
    <math|\<sigma\><around|(|T|)>> is composed of disjoint sets
    <math|P<around|(|T|)>>, <math|C<around|(|T|)>> and <math|R<around|(|T|)>>
    with the following properties:

    <\itemize>
      <item>The the <with|font-shape|italic|point spectrum>
      <math|P<around|(|T|)>> of T is the totality of complex numbers
      <math|\<lambda\>> for which <math|T<rsub|\<lambda\>>> does not have an
      inverse;

      <item>The <with|font-shape|italic|continuous spectrum
      <math|C<around|(|T|)>>> of <math|T> is the totality of complex numbers
      <math|\<lambda\>> for which <math|T<rsub|\<lambda\>>> has a continuous
      inverse with domain dense in X

      <item>The <with|font-shape|italic|residual spectrum>
      <math|R<around|(|T|)>> of <math|T> is the totality of complex numbers
      <math|\<lambda\>> for which <math|T<rsub|\<lambda\>>> has an inverse
      whose domain is not dense in of T is the totality of complex numbers
      \<lambda\>*for which T<rsub|Î>\T does not have an inverse;
    </itemize>
  </definition>

  From these definitions and the linearity of <math|T> we have the following\ 

  <\proposition>
    A necessary and sufficient condition for <math|\<lambda\><rsub|0>> to be
    in <math|P<around|(|T|)>> is that the equation
    <math|T*x=\<lambda\><rsub|0>*x> has a solution <math|x\<neq\>0>. In this
    case <math|\<lambda\><rsub|0>> is called an
    <with|font-shape|italic|eigenvalue> of <math|T>, and the corresponding
    <with|font-shape|italic|eigenvector>. The null space
    <math|N*<around|(|\<lambda\><rsub|0>*I-T|)>> of <math|T<rsub|\<lambda\>>>
    is called the <with|font-shape|italic|eigenspace> of <math|T>
    corresponding to the eigenvalue <math|\<lambda\><rsub|0>>. It consists of
    the vector or the totality of eigenvectors corresponding to
    <math|\<lambda\><rsub|0>>. The dimension of the eigenspace corresponding
    to <math|\<lambda\><rsub|0>> is called the
    <with|font-shape|italic|multiplicity> of the eigenvalue
    <math|\<lambda\><rsub|0>>.
  </proposition>

  <\theorem>
    Let <math|X> be a complex B-space, and <math|T> a closed linear operator
    with its domain <math|D<around|(|T|)>> and range <math|R<around|(|T|)>>
    both in <math|X>. Then, for any <math|\<lambda\><rsub|0>> in
    <math|\<rho\><around|(|T|)>>,

    <\equation>
      <frac|1|\<lambda\><rsub|0>*I-T>
    </equation>

    is an everywhere defined continuous linear operator.
  </theorem>

  <\proof>
    Since <math|\<lambda\><rsub|0>> is in the resolvent set
    <math|\<rho\><around|(|T|)>>, <math|R<around|(|\<lambda\><rsub|0>;T|)>=D<around|(|<around|(|\<lambda\><rsub|0>*I-T|)><rsup|-1>|)>>
    is dense in <math|X> in such a way that there exists a positive constant
    <math|c> for which

    \<\|\|\>(\<lambda\><rsub|0> I - T) x \<\|\|\> \<geq\>c \<\|\|\> x
    \<\|\|\> whenever \ x \<in\>D(T). We have to show that
    <math|R*<around|(|\<lambda\><rsub|0>*I-T|)>=X>. But, if
    <math|s*<text|->lim<rsub|n\<to\>\<infty\>> x<rsub|n>=y> exists, then by
    the above inequality, <math|s*<text|->lim<rsub|n\<to\>\<infty\>>
    T*x<rsub|n>=T*y> exists, and so, by the closure property of <math|T>, we
    must have <math|<around|(|\<lambda\><rsub|0>*I-T|)>*x=y>. Hence, by the
    assumption that <math|R*<around|(|\<lambda\><rsub|0>*I-T|)><rsup|-1>=X>,
    we must have <math|R*<around|(|\<lambda\><rsub|0>*I-T|)>=X>.
  </proof>

  <\example>
    If the space <math|X> is of finite dimension, then any bounded linear
    operator <math|T> is represented by a matrix
    <math|<around|(|t<rsub|i*j>|)>>. It is known that the eigenvalues of
    <math|T> are obtained as the roots of the algebraic equation, the
    so-called <with|font-shape|italic|secular> or
    <with|font-shape|italic|characteristic equation> of the matrix
    <math|<around|(|t<rsub|i*j>|)>>:

    <\equation>
      det <around|(|\<lambda\><rsub|0>*I<rsub|i*j>-t<rsub|i*j>|)>=0
    </equation>

    where <math|det <around|(|A|)>> denotes the determinant of the matrix
    <math|A>.
  </example>

  <\example>
    Let <math|X=L<rsup|2><around|(|-\<infty\>,\<infty\>|)>> and let <math|T>
    be defined by

    <\equation>
      T:<around|(|x<around|(|t|)>\<mapsto\>t*x<around|(|t|)>|)>
    </equation>

    that is, <math|D<around|(|T|)>=<around|{|x<around|(|t|)>:x<around|(|t|)>\<in\>L<rsup|2><around|(|-\<infty\>,\<infty\>|)>|}>>
    and <math|T*x<around|(|t|)>=t*x<around|(|t|)>> for
    <math|x<around|(|t|)>\<in\>D<around|(|T|)>>. Then every real number
    <math|\<lambda\><rsub|0>> is in <math|C<rsub|c><around|(|T|)>>.
  </example>

  <\proof>
    \ The condition <math|<around|(|\<lambda\><rsub|0>*I-T|)>*x=0> implies
    <math|<around|(|\<lambda\><rsub|0>-t|)>*x<around|(|t|)>=0> a.e., and so
    <math|x<around|(|t|)>=0> a.e. Thus <math|\<rho\>*<around|(|\<lambda\><rsub|0>-T|)>=\<bbb-C\>>.
    The domain <math|D<around|(|<around|(|\<lambda\><rsub|0>*I-T|)><rsup|-1>|)>>
    comprises those <math|y<around|(|t|)>\<in\>L<rsup|2><around|(|-\<infty\>,\<infty\>|)>>
    which vanish identically in the neighbourhood of
    <math|t=\<lambda\><rsub|0>>; the neighbourhood may vary with
    <math|y<around|(|t|)>>. Hence <math|D<around|(|<around|(|\<lambda\><rsub|0>*I-T|)><rsup|-1>|)>>
    is dense in <math|L<rsup|2><around|(|-\<infty\>,\<infty\>|)>>. It is easy
    to see that the norm of <math|<around|(|\<lambda\><rsub|0>*I-T|)><rsup|-1>>
    is not bounded on the totality of such
    <math|y<around|(|t|)><rprime|'>*s>.
  </proof>

  <\example>
    \ Let <math|X> be the Hilbert space <math|<around|(|\<ell\><rsup|2>|)>>,
    and let <math|T<rsub|0>> be defined by

    <\equation>
      T<rsub|0><around|(|<around|{|s<rsub|1>,s<rsub|2>,\<ldots\>|}>|)>=<around|(|0,s<rsub|1>,s<rsub|2>,\<ldots\>|)>
    </equation>

    Then <math|0> is in the residual spectrum of <math|T>, since
    <math|R<around|(|T<rsub|0>|)>> is not dense in <math|X>.
  </example>

  <\example>
    Let <math|H> be a self-adjoint operator in a Hilbert space <math|X>. Then
    the resolvent set <math|\<rho\><around|(|H|)>> of <math|H> comprises all
    the complex numbers <math|\<lambda\>> with
    Im<math|<around|(|\<lambda\>|)>\<neq\>0>, and the resolvent
    <math|R<around|(|\<lambda\>;H|)>> is a bounded linear operator with the
    estimate

    <\equation>
      <around|\<\|\|\>|R<around|(|\<lambda\>;H|)>|\<\|\|\>>\<leq\><frac|1|<around|\||<text|Im><around|(|\<lambda\>|)>|\|>>
    </equation>

    Moreover,

    <\equation>
      <text|Im><around|(|<around|(|\<lambda\>*I-H|)>*x,x|)>=<text|Im><around|(|\<lambda\>|)><around|\<\|\|\>|x|\<\|\|\>><rsup|2>\<forall\>x\<in\>D<around|(|H|)>
    </equation>
  </example>

  <with|font-series|bold|Proof.> If <math|x\<in\>D<around|(|H|)>>, then
  <math|<around|(|H*x,x|)>> is real since
  <math|<around|(|H*x,x|)>=<around|(|x,H*x|)>>. Therefore we have (3) and so
  by Schwarz's inequality\ 

  <\equation>
    <around|\<\|\|\>|<around|(|\<lambda\>*I-H|)>*x|\<\|\|\>>*\<geqslant\><around*|\||<around|(|\<lambda\>*I-H|)>*x|\|>\<geqslant\>Im<around*|(|\<lambda\>|)>*<around*|\<\|\|\>|x|\<\|\|\>><rsup|2>
  </equation>

  which implies that

  <\equation>
    <around|\<\|\|\>|<around|(|\<lambda\>*I-H|)>*x|\<\|\|\>>\<geq\><around|\||<text|Im><around|(|\<lambda\>|)>|\|><around|\<\|\|\>|x|\<\|\|\>>
  </equation>

  Hence the inverse <math|<frac|1|\<lambda\>*I-H>> exists if
  Im<math|<around|(|\<lambda\>|)>\<neq\>0>. Moreover, the range
  <math|R*<around|(|\<lambda\>*I-H|)>> is dense in <math|X> if
  Im<math|<around|(|\<lambda\>|)>\<neq\>0>. If otherwise, there would exist a
  <math|y\<neq\>0> orthogonal to <math|R*<around|(|\<lambda\>*I-H|)>>, i.e.,
  <math|<around|(|<around|(|\<lambda\>*I-H|)>*x,y|)>=0>\<forall\><math|x\<in\>D<around|(|H|)>>,
  and so <math|<around|(|x,<around|(|<wide|\<lambda\>*|\<bar\>>I-H|)>*y|)>=0>\<forall\><math|x\<in\>D<around|(|H|)>>.
  Since the domain <math|D<around|(|H|)>> of a self-adjoint operator <math|H>
  is dense in <math|X,> we must have <math|<around*|(|<wide|\<lambda\>|\<bar\>>I-H|)>y=0>,
  that is, <math|H y=<wide|\<lambda\>|\<bar\>>y,> contrary to the reality of
  the value <math|<around*|(|H y,y|)>>.

  Therefore, by the above theorem, we see that for any complex number
  <math|\<lambda\>> with <math|Im<around*|(|\<lambda\>|)>\<neq\>0>, the
  resolvent <math|R<around*|(|\<lambda\>;H|)>> is a bounded linear operator
  with the estimate <math|<around*|(|2|)>>.

  <section*|2. The Resolvent Equation and Spectral Radius>

  <\theorem>
    \ Let <math|T> be a closed linear operator with domain and range both in
    a complex B-space <math|X>. Then the resolvent set
    <math|\<rho\><around|(|T|)>> is an open set of the complex plane. In each
    component (the maximal connected sets) of <math|\<rho\><around|(|T|)>>,
    <math|R<around|(|\<lambda\>;T|)>> is a holomorphic function of
    <math|\<lambda\>>.
  </theorem>

  <\proof>
    By the Theorem of the preceding section,
    <math|R<around|(|\<lambda\>;T|)>> for
    <math|\<lambda\>\<in\>\<rho\><around|(|T|)>> is an everywhere defined
    continuous operator. Let <math|\<lambda\><rsub|0>\<in\>\<rho\><around|(|T|)>>
    and consider

    <\equation>
      S<around|(|\<lambda\>|)>=R<around|(|\<lambda\><rsub|0>;T|)>*<around*|[|I+<big|sum><rsub|n=1><rsup|\<infty\>><around|(|\<lambda\><rsub|0>-\<lambda\>|)><rsup|n>*R<around|(|\<lambda\><rsub|0>;T|)><rsup|n>|]>
    </equation>

    The series is convergent in the operator norm whenever
    <math|<around|\||\<lambda\><rsub|0>-\<lambda\>|\|>>.
    <math|<around|\<\|\|\>|R<around|(|\<lambda\><rsub|0>;T|)>|\<\|\|\>>\<less\>1>,
    and within this circle of the complex plane, the series defines a
    holomorphic function of <math|\<lambda\>>. Multiplication by
    <math|<around|(|\<lambda\>-T|)>> on the left or right gives <math|I> so
    that the series <math|S<around|(|\<lambda\>|)>> actually represents the
    resolvent <math|R<around|(|\<lambda\>;T|)>>. Thus we have proved that a
    circular neighbourhood of <math|\<lambda\><rsub|0>> belongs to
    <math|\<rho\><around|(|T|)>> and <math|R<around|(|\<lambda\>;T|)>> are
    everywhere defined continuous operators, then the resolvent equation
    holds:

    <\equation>
      R<around|(|\<lambda\>;T|)>-R<around|(|\<mu\>;T|)>=<around|(|\<mu\>-\<lambda\>|)>*R<around|(|\<lambda\>;T|)>*R<around|(|\<mu\>;T|)>
    </equation>
  </proof>

  <\proof>
    We have

    <\equation>
      <tabular|<tformat|<table|<row|<cell|R<around|(|\<lambda\>;T|)>>|<cell|=R<around|(|\<mu\>;T|)>*<around*|[|<around|(|\<mu\>-T|)>*R<around|(|\<mu\>;T|)>|]>>>|<row|<cell|>|<cell|=R<around|(|\<mu\>;T|)>*<around*|[|<around|(|\<mu\>-\<lambda\>|)>*I+<around|(|\<lambda\>-T|)>|]>*R<around|(|\<mu\>;T|)>>>|<row|<cell|>|<cell|=<around|(|\<mu\>-\<lambda\>|)>*R<around|(|\<lambda\>;T|)>*R<around|(|\<mu\>;T|)>>>>>>
    </equation>
  </proof>

  <\theorem>
    \ If <math|T> is a bounded linear operator on a complex B-space <math|X>,
    then the following limit exists:

    <\equation>
      lim<rsub|n\<to\>\<infty\>><around|\<\|\|\>|T<rsup|n>|\<\|\|\>><rsup|<frac|1|n>>=r<rsub|0><around|(|T|)>
    </equation>

    It is called the <with|font-shape|italic|spectral radius> of <math|T>,
    and we have

    <\equation>
      r<rsub|0><around|(|T|)>\<leq\><around|\<\|\|\>|T|\<\|\|\>>
    </equation>

    If <math|<around|\||\<lambda\>|\|>\<gtr\>r<rsub|0><around|(|T|)>>, then
    the resolvent <math|R<around|(|\<lambda\>;T|)>> exists and is given by
    the series

    <\equation>
      R<around|(|\<lambda\>;T|)>=<big|sum><rsub|n=1><rsup|\<infty\>>\<lambda\><rsup|-n>*T<rsup|n-1>
    </equation>

    which converges in the norm of operators.
  </theorem>

  <\proof>
    Set <math|r=inf<rsub|n><around|\<\|\|\>|T<rsup|n>|\<\|\|\>><rsup|1/n>>.
    We have to show that <math|lim<rsub|n\<to\>\<infty\>><around|\<\|\|\>|T<rsup|n>|\<\|\|\>><rsup|1/n>\<leq\>r>.
    For any <math|\<epsilon\>\<gtr\>0>, choose <math|m> such that
    <math|<around|\<\|\|\>|T<rsup|m>|\<\|\|\>><rsup|1/m>\<leq\>r+\<epsilon\>>,
    for arbitrary <math|n>, write <math|n=p*m+q> where
    <math|0\<leq\>q\<less\>m>. Then, by <math|<around|\<\|\|\>|A*B|\<\|\|\>>\<leq\><around|\<\|\|\>|A|\<\|\|\>><around|\<\|\|\>|B|\<\|\|\>>>,
    we obtain

    <\equation>
      <around|\<\|\|\>|T<rsup|n>|\<\|\|\>><rsup|1/n>\<leq\><around|\<\|\|\>|T<rsup|m>|\<\|\|\>><rsup|p/n><around|\<\|\|\>|T<rsup|q>|\<\|\|\>><rsup|1/n>\<leq\><around|(|r+\<epsilon\>|)><rsup|p*m/n><around|\<\|\|\>|T<rsup|q>|\<\|\|\>><rsup|1/n>
    </equation>

    Since <math|p*m/n\<to\>1> and <math|q/n\<to\>0> as
    <math|n\<to\>\<infty\>>, we must have
    <math|<around|\<\|\|\>|T<rsup|n>|\<\|\|\>><rsup|1/n>\<leq\>r+\<epsilon\>>.
    Since <math|\<epsilon\>> was arbitrary, we have proved
    <math|lim<rsub|n\<to\>\<infty\>><around|\<\|\|\>|T<rsup|n>|\<\|\|\>><rsup|1/n>\<leq\>r>.

    Since <math|<around|\<\|\|\>|T<rsup|n>|\<\|\|\>>\<leq\><around|\<\|\|\>|T|\<\|\|\>><rsup|n>>,
    we have <math|lim<rsub|n\<to\>\<infty\>><around|\<\|\|\>|T<rsup|n>|\<\|\|\>><rsup|1/n>\<leq\><around|\<\|\|\>|T|\<\|\|\>>>.
    The series (5) is convergent in the norm of operators when
    <math|<around|\||\<lambda\>|\|>\<gtr\>r<rsub|0><around|(|T|)>>. For if
    <math|<around|\||\<lambda\>|\|>\<geq\>r<rsub|0><around|(|T|)>+\<epsilon\>\<gtr\>0>,
    then, by (3), <math|<around|\<\|\|\>|R<around|(|\<lambda\>;T|)>|\<\|\|\>><rsup|1/n>\<leq\><around|(|r<rsub|0><around|(|T|)>+2*\<epsilon\>|)><rsup|-n>>
    for large <math|n>. Multiplication by <math|<around|(|\<lambda\>*I-T|)>>
    on the left or right of this series gives <math|I> so that the series
    actually represents the resolvent <math|R<around|(|\<lambda\>;T|)>>.
  </proof>

  <\corollary>
    The resolvent set <math|\<rho\><around|(|T|)>> is not empty when <math|T>
    is a bounded linear operator.
  </corollary>

  <\theorem>
    For a bounded linear operator <math|T> in <math|L<around|(|X,X|)>>, we
    have

    <\equation>
      r<rsub|0><around|(|T|)>=sup<rsub|\<lambda\>\<in\>\<sigma\><around|(|T|)>><around|\||\<lambda\>|\|>
    </equation>
  </theorem>

  <\proof>
    By Theorem 3, we know that <math|R<around|(|\<lambda\>;T|)>> is
    holomorphic in <math|\<lambda\>> when
    <math|<around|\||\<lambda\>|\|>\<gtr\>sup<rsub|\<mu\>\<in\>\<sigma\><around|(|T|)>><around|\||\<mu\>|\|>>.
    Hence we have only to show that <math|r<rsub|0><around|(|T|)>> is equal
    to <math|sup<rsub|\<lambda\>\<in\>\<sigma\><around|(|T|)>><around|\||\<lambda\>|\|>>.

    By Theorem 1, <math|R<around|(|\<lambda\>;T|)>> is holomorphic in
    <math|\<lambda\>> where <math|<around|\||\<lambda\>|\|>\<gtr\>sup<rsub|\<mu\>\<in\>\<sigma\><around|(|T|)>><around|\||\<mu\>|\|>>.
    Thus it admits a uniquely determined Laurent expansion in positive and
    non-positive powers of <math|\<lambda\>> converging in the operator norm
    for <math|<around|\||\<lambda\>|\|>\<gtr\>sup<rsub|\<mu\>\<in\>\<sigma\><around|(|T|)>><around|\||\<mu\>|\|>>.
    By Theorem 3, this Laurent series must coincide with

    <\equation>
      <big|sum><rsub|n=1><rsup|\<infty\>>\<lambda\><rsup|-n>*T<rsup|n-1>
    </equation>

    Hence <math|lim<rsub|n\<to\>\<infty\>><frac|*T<rsup|n-1>|\<lambda\><rsup|n>>=0>
    if <math|<around|\||\<lambda\>|\|>\<gtr\>sup<rsub|\<mu\>\<in\>\<sigma\><around|(|T|)>><around|\||\<mu\>|\|>>,
    and so, for any <math|\<epsilon\>\<gtr\>0>, we must have
    <math|<around|\<\|\|\>|T|\<\|\|\>>\<leq\><around|(|\<epsilon\>+sup<rsub|\<mu\>\<in\>\<sigma\><around|(|T|)>><around|\||\<mu\>|\|>|)><rsup|n>>
    for large <math|n>. This proves that

    <\equation>
      r<rsub|0><around|(|T|)>=lim<rsub|n\<to\>\<infty\>><around|\<\|\|\>|T<rsup|n>|\<\|\|\>><rsup|<frac|1|n>>=sup<rsub|\<lambda\>\<in\>\<sigma\><around|(|T|)>><around|\||\<lambda\>|\|>
    </equation>
  </proof>

  <\corollary>
    The series <math|<big|sum><rsub|n=1><rsup|\<infty\>>\<lambda\><rsup|-n>*T<rsup|n-1>>
    diverges if <math|<around|\||\<lambda\>|\|>\<less\>r<rsub|0><around|(|T|)>>.
  </corollary>

  <\proof>
    Let <math|\<gamma\>> be the smallest number <math|\<geq\>0> such that the
    series

    <\equation>
      <big|sum><rsub|n=1><rsup|\<infty\>>\<lambda\><rsup|-n>*T<rsup|n-1>
    </equation>

    converges in the operator norm for <math|<around|\||\<lambda\>|\|>\<gtr\>\<gamma\>>.
    The existence of such an <math|n> is proved as for ordinary power series
    in <math|\<lambda\><rsup|-1>>. Then, for
    <math|<around|\||\<lambda\>|\|>\<gtr\>\<gamma\>>,
    <math|lim<rsub|n\<to\>\<infty\>> \<lambda\><rsup|-n>*T<rsup|n-1>=0> and
    so, as in the proof of <math|r<rsub|0><around|(|T|)>\<leq\>sup<rsub|\<mu\>\<in\>\<sigma\><around|(|T|)>><around|\||\<mu\>|\|>>,
    we must have <math|lim<rsub|n\<to\>\<infty\>><around|\<\|\|\>|T<rsup|n>|\<\|\|\>><rsup|1/n>\<leq\>\<gamma\>>.
    This proves that <math|r<rsub|0><around|(|T|)>\<leq\>\<gamma\>>.

    \;
  </proof>
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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|1|1>>
    <associate|auto-3|<tuple|9|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|VIII.
      Resolvent and Spectrum> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1. The Resolvent and Spectrum
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.
      The Resolvent Equation and Spectral Radius>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>