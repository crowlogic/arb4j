<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|On Harmonizable Stochastic
  Processes>|<doc-author|<author-data|<author-name|Stamatis Cambanis and Bede
  Liu>>>>

  <\abstract>
    This paper presents a new orthogonal series representation and a new
    orthogonal integral representation for harmonizable stochastic processes.
    It also demonstrates the importance of harmonizable stochastic processes
    in systems analysis by showing that the output of a wide class of systems
    is a harmonizable process.
  </abstract>

  <section|Introduction><label|sec:intro>

  Harmonizable stochastic processes, a generalization of wide sense
  stationary processes, have been investigated in connection with a variety
  of subjects. Properties related to their integral representation have been
  studied by Loève<nbsp><cite|loeve1963> and Rosanov<nbsp><cite|rosanov1959>,
  their special role in the multiplicity theory of purely nondeterministic
  stochastic processes has been demonstrated by
  Cramer<nbsp><cite|cramer1964>, and sampling theorems have been derived by
  Piranashvili<nbsp><cite|piranashvili1967> and Rao<nbsp><cite|rao1967>.

  This paper makes two contributions related to the class of harmonizable
  stochastic processes. First, it is proved under some general conditions
  that the output of a linear system is a harmonizable stochastic process;
  the system may be randomly time-varying and the input process need not be
  stationary nor even harmonizable. Thus, harmonizable processes are the most
  general processes that need be considered in the analysis of a wide class
  of linear systems. In such analyses as well as in many other problems in
  communications and controls, series representation of stochastic processes
  has been used as a powerful tool. The second contribution of this paper is
  a series representation for harmonizable stochastic processes. A
  constructive procedure for obtaining the series representation is given.
  This representation is valid over the entire real line, while the
  well-known Karhunen-Loève series representation is valid only on compact
  intervals. An orthogonal integral representation for harmonizable
  stochastic processes is also derived in this paper.

  <section|Notation><label|sec:notation>

  Some definitions and basic properties are briefly mentioned here. For a
  more detailed discussion the reader is referred to
  Karhunen<nbsp><cite|karhunen1947>, Cramer<nbsp><cite|cramer1951>,
  Rosanov<nbsp><cite|rosanov1959>, Parzen<nbsp><cite|parzen1967>, and
  Masani<nbsp><cite|masani1968>.

  Consider a probability space <math|<around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>>
  and the Hilbert space <math|L<rsub|2><around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>>
  of all complex valued random variables with finite mean square value. A
  random measure <math|X> on a class of subsets
  <math|<with|math-font|cal*|N>> of a set <math|E> is a countably additive
  function on <math|<with|math-font|cal*|N>> to
  <math|L<rsub|2><around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>>, i.e.,
  <math|X<around|(|S,\<omega\>|)>=<big|sum><rsub|n=1><rsup|\<infty\>>X<around|(|S<rsub|n>,\<omega\>|)>>
  in the mean square sense whenever the disjoint sets
  <math|S<rsub|n>,n=1,2,\<ldots\>>, are in <math|<with|math-font|cal*|N>> and
  <math|S=<big|cup><rsub|n=1><rsup|\<infty\>>S<rsub|n>\<in\><with|math-font|cal*|N>>.
  To each <math|X> on <math|<with|math-font|cal*|N>> there corresponds a
  complex measure <math|r<rsub|X>> defined on
  <math|<with|math-font|cal*|N>\<times\><with|math-font|cal*|N>> by

  <\equation>
    r<rsub|X>*<around|(|S<rsub|1>\<times\>S<rsub|2>|)>=<with|math-font|cal*|E><around|[|X<around|(|S<rsub|1>,\<omega\>|)>*X<rsup|\<ast\>><around|(|S<rsub|2>,\<omega\>|)>|]>,<label|eq:rX>
  </equation>

  where <math|<with|math-font|cal*|E>> is the expectation operator and the
  star denotes complex conjugate. <math|r<rsub|X>> is nonnegative definite on
  <math|<with|math-font|cal*|N>\<times\><with|math-font|cal*|N>>. <math|X> is
  orthogonal if and only if <math|r<rsub|X>*<around|(|S<rsub|1>\<times\>S<rsub|2>|)>=0>,
  whenever <math|S<rsub|1>> and <math|S<rsub|2>> are disjoint. To each
  orthogonal <math|X> on <math|<with|math-font|cal*|N>> there corresponds a
  nonnegative measure <math|Q<rsub|X>> defined on
  <math|<with|math-font|cal*|N>> by

  <\equation>
    Q<rsub|X><around|(|S|)>=<with|math-font|cal*|E><around|\||X<around|(|S,\<omega\>|)>|\|><rsup|2>.<label|eq:QX>
  </equation>

  Usually <math|X> is initially defined on a semiring of subsets
  <math|<with|math-font|cal*|N>>. If <math|r<rsub|X>> is of bounded variation
  over <math|<with|math-font|cal*|N>\<times\><with|math-font|cal*|N>> then
  <math|X> can be extended to the restricted <math|\<sigma\>>-ring
  <math|<with|math-font|cal*|B><rsub|0>=<around|{|S\<in\>\<sigma\><around|(|<with|math-font|cal*|N>|)>=<with|math-font|cal*|B>;<around|\||r<rsub|X>|\|>*<around|(|S\<times\>S|)>\<less\>\<infty\>|}>>.
  We then say that <math|X> is a random measure on
  <math|<around|(|E,<with|math-font|cal*|B>|)>>.

  Let <math|L<rsub|2><around|(|X|)>=\<sigma\><around|{|X<around|(|S,\<omega\>|)>;S\<in\><with|math-font|cal*|B><rsub|0>|}>>
  denote the span of <math|X> in <math|L<rsub|2><around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>>
  and let <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> be the set of all
  complex valued, <math|<with|math-font|cal*|B>>-measurable functions
  <math|f> on <math|E> such that

  <\equation>
    <big|int><rsub|E\<times\>E>f<around|(|t|)>*f<rsup|\<ast\>><around|(|s|)>*r<rsub|X><around|(|d*t,d*s|)>\<less\>\<infty\>.<label|eq:lambda2>
  </equation>

  Then, upon considering two functions <math|f> and <math|g> in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|x>|)>> as identical if and only if

  <\equation>
    <big|int><rsub|E\<times\>E><around|[|f<around|(|t|)>-g<around|(|t|)>|]>*<around|[|f<rsup|\<ast\>><around|(|s|)>-g<rsup|\<ast\>><around|(|s|)>|]>*r<rsub|X><around|(|d*t,d*s|)>=0,<label|eq:lambda2-ident>
  </equation>

  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> becomes a Hilbert space
  with inner product

  <\equation>
    <around|(|f,g|)><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>=<big|int><rsub|E\<times\>E>f<around|(|t|)>*g<rsup|\<ast\>><around|(|s|)>*r<rsub|X><around|(|d*t,d*s|)><label|eq:lambda2-inner>
  </equation>

  and <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>=\<sigma\><around|{|I<rsub|S><around|(|t|)>;S\<in\><with|math-font|cal*|B><rsub|0>|}>>,
  where <math|I> is the indicator function. <math|L<rsub|2><around|(|X|)>>
  and <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> are isomorphic with
  corresponding elements <math|X<around|(|S,\<omega\>|)>> and
  <math|I<rsub|S><around|(|t|)>>, <math|S\<in\><with|math-font|cal*|B><rsub|0>>,
  and integration of functions in <math|A<rsub|2><around|(|r<rsub|X>|)>> with
  respect to <math|X> is defined by

  <\equation>
    \<xi\><around|(|\<omega\>|)>=<big|int><rsub|E>f<around|(|t|)>*X<around|(|d*t,\<omega\>|)>,<label|eq:xi>
  </equation>

  where <math|\<xi\>> and <math|f> are corresponding elements under the
  isomorphism.

  <section|Representation of Harmonizable Stochastic
  Processes><label|sec:representation>

  Harmonizable stochastic processes have been introduced by
  Loève<nbsp><cite|loeve1963> as a first step generalization of wide sense
  stationary mean square continuous stochastic processes. A second-order
  stochastic process <math|<around|{|x*<around|(|t,\<omega\>|)>,t\<in\>\<bbb-R\>,\<omega\>\<in\>\<Omega\>|}>>
  is harmonizable if and only if it has the integral representation

  <\equation>
    x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*X<around|(|d*u,\<omega\>|)>*<space|1em><text|for
    all >t\<in\>\<bbb-R\><label|eq:proc-integral>
  </equation>

  where <math|X> is a random measure defined for all Borel sets
  <math|<with|math-font|cal*|B><rsup|1>> of the real line <math|\<bbb-R\>>.

  It is shown by Loève<nbsp><cite|loeve1963> and
  Cramèr<nbsp><cite|cramer1951> that a second-order stochastic process
  <math|x*<around|(|t,\<omega\>|)>> is harmonizable if and only if its
  autocorrelation function <math|R<rsub|x*x><around|(|t,s|)>> has the
  integral representation

  <\equation>
    R<rsub|x*x><around|(|t,s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*<around|(|t*u-s*v|)>>*r<rsub|X><around|(|d*u,d*v|)>*<space|1em><text|for
    all >t,s\<in\>\<bbb-R\><label|eq:autocorr>
  </equation>

  where <math|r<rsub|X>> is a measure of bounded variation on the whole plane
  <math|\<bbb-R\><rsup|2>> and nonnegative definite on
  <math|<with|math-font|cal*|B><rsup|1>\<times\><with|math-font|cal*|B><rsup|1>>.
  <math|r<rsub|X>> can be regarded as the two-dimensional spectral measure of
  the harmonizable process <math|x*<around|(|t,\<omega\>|)>>, with
  two-dimensional spectral distribution <math|\<rho\><rsub|x*x><around|(|u,v|)>=r<rsub|X>*<around|(|<around|(|-\<infty\>,u|]>\<times\><around|(|-\<infty\>,v|]>|)>>.

  It is clear that a mean square continuous wide sense stationary stochastic
  process is harmonizable, with <math|X> an orthogonal random measure and
  <math|r<rsub|X>> a nonnegative measure concentrated on the diagonal of the
  plane.

  The functions <math|<around|{|e<rsup|i*t*u>,t\<in\>\<bbb-R\>|}>> span the
  whole <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> space and this
  implies that <math|L<rsub|2><around|(|x|)>=L<rsub|2><around|(|X|)>>, where
  <math|L<rsub|2><around|(|x|)>=\<sigma\><around|{|x*<around|(|t,\<omega\>|)>,t\<in\>\<bbb-R\>|}>>
  denotes the span of <math|x> in <math|L<rsub|2><around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>>.

  <section|Orthogonal Series Representation of a Harmonizable Stochastic
  Process><label|sec:orthogonal-series>

  An orthogonal series representation for harmonizable stochastic processes
  is provided by the following:

  <\theorem>
    <label|thm:series-rep>A harmonizable stochastic process
    <math|<around|{|x*<around|(|t,\<omega\>|)>,t\<in\>\<bbb-R\>,\<omega\>\<in\>\<Omega\>|}>>
    is uniformly mean square continuous and has an orthogonal series
    expansion

    <\equation>
      x*<around|(|t,\<omega\>|)>=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*\<xi\><rsub|n><around|(|\<omega\>|)><label|eq:series>
    </equation>

    in the mean square sense for all <math|t\<in\>\<bbb-R\>>, where

    <\equation>
      \<xi\><rsub|n><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsub|n><around|(|u|)>*X<around|(|d*u,\<omega\>|)>,<space|1em><with|math-font|cal*|E><around|[|\<xi\><rsub|n>*\<xi\><rsub|m><rsup|\<ast\>>|]>=\<delta\><rsub|n*m><label|eq:xin>
    </equation>

    and

    <\equation>
      a<rsub|n><around|(|t|)>=<big|iint><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*f<rsub|n><rsup|\<ast\>><around|(|v|)>*r<rsub|X><around|(|d*u,d*v|)><label|eq:an>
    </equation>

    and <math|<around|{|f<rsub|n>|(>\<cdot\><around|)||}>> is an orthonormal
    and complete set of functions in <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>.
  </theorem>

  <\proof>
    The autocorrelation function <math|R<rsub|x*x><around|(|t,s|)>> of
    <math|x*<around|(|t,\<omega\>|)>> is given by <eqref|eq:autocorr>. Since
    <math|e<rsup|i*<around|(|t*u-s*v|)>>> is continuous in <math|t,s>
    uniformly in <math|u,v> and is bounded by <math|1>, which is integrable
    with respect to <math|r<rsub|X>>, it follows by the bounded convergence
    theorem that <math|R<rsub|x*x><around|(|t,s|)>> is uniformly continuous
    in <math|t,s>. Hence <math|x*<around|(|t,\<omega\>|)>> is uniformly mean
    square continuous.

    Since <math|x*<around|(|t,\<omega\>|)>> is mean square continuous,
    <math|L<rsub|2><around|(|x|)>> is separable, as shown by
    Parzen<nbsp><cite|parzen1967> in Theorem 2C. Hence
    <math|L<rsub|2><around|(|X|)>=L<rsub|2><around|(|x|)>> is separable and
    so is its isomorphic space <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>.
    Let <math|<around|{|f<rsub|n>|(>\<cdot\><around|)||}>> be an orthonormal
    basis in <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>. If for each
    <math|n,\<xi\><rsub|n><around|(|\<omega\>|)>> is the element of
    <math|L<rsub|2><around|(|x|)>> corresponding to
    <math|f<rsub|n><around|(|\<cdummy\>|)>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
    under the isomorphism, then <math|<around|{|\<xi\><rsub|n><around|(|\<omega\>|)>|}>>
    is an orthonormal basis in <math|L<rsub|2><around|(|X|)>=L<rsub|2><around|(|x|)>>,
    i.e., <math|<with|math-font|cal*|E><around|[|\<xi\><rsub|n>*\<xi\><rsub|m><rsup|\<ast\>>|]>=\<delta\><rsub|n*m>>,
    and

    <\equation>
      \<xi\><rsub|n><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsub|n><around|(|u|)>*X<around|(|d*u,\<omega\>|)><label|eq:xin-again>
    </equation>

    Hence, for all <math|t\<in\>\<bbb-R\>>, we have

    <\equation>
      x*<around|(|t,\<omega\>|)>=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*\<xi\><rsub|n><around|(|\<omega\>|)><label|eq:series-again>
    </equation>

    in the mean square sense and

    <\equation>
      a<rsub|n><around|(|t|)>=<with|math-font|cal*|E><around|[|x<around|(|t|)>*\<xi\><rsub|n><rsup|\<ast\>>|]><label|eq:an-expect>
    </equation>

    Since <math|x*<around|(|t,\<omega\>|)>> and <math|e<rsup|i*t*u>>, as well
    as <math|\<xi\><rsub|n><around|(|\<omega\>|)>> and
    <math|f<rsub|n><around|(|u|)>>, are corresponding elements of
    <math|L<rsub|2><around|(|X|)>> and <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
    under the isomorphism, we obtain

    <\equation>
      a<rsub|n><around|(|t|)>=<around|(|e<rsup|i*t*u>,f<rsub|n><around|(|u|)>|)><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*f<rsub|n><rsup|\<ast\>><around|(|v|)>*r<rsub|X><around|(|d*u,d*v|)><label|eq:an-inner>
    </equation>
  </proof>

  It follows from <eqref|eq:series> and <eqref|eq:an> that the
  autocorrelation function of a harmonizable stochastic process
  <math|x*<around|(|t,\<omega\>|)>> has a series expansion

  <\equation>
    R<rsub|x*x><around|(|t,s|)>=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*a<rsub|n><rsup|\<ast\>><around|(|s|)>*<space|1em><text|for
    all >t,s\<in\>\<bbb-R\><label|eq:autocorr-series>
  </equation>

  where the <math|a<rsub|n>>'s are given by <eqref|eq:an>.

  For all <math|f\<in\>\<Lambda\><rsub|2><around|(|r<rsub|x>|)>> we have
  <math|e<rsup|i*t*u>*f<around|(|u|)>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
  for all <math|t\<in\>\<bbb-R\>>, since

  <\equation>
    <around|\||e<rsup|i*t*u>*f<around|(|u|)>|\|>\<leqslant\><around|\||f<around|(|u|)>|\|>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)><label|eq:expf>
  </equation>

  Hence

  <\equation>
    y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*f<around|(|u|)>*X<around|(|d*u,\<omega\>|)><label|eq:y>
  </equation>

  is well-defined in <math|L<rsub|2><around|(|X|)>=L<rsub|2><around|(|x|)>>
  and is thus a linear operation on <math|x*<around|(|t,\<omega\>|)>>.
  <math|y*<around|(|t,\<omega\>|)>> is harmonizable itself, since if a random
  measure <math|Y> is defined by

  <\equation>
    Y<around|(|S,\<omega\>|)>=<big|int><rsub|S>f<around|(|u|)>*X<around|(|d*u,\<omega\>|)>,<space|1em>S\<in\><with|math-font|cal*|B><rsup|1><label|eq:Y>
  </equation>

  then <math|Y> is finite on <math|\<bbb-R\>> and

  <\equation>
    y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*Y<around|(|d*u,\<omega\>|)><label|eq:yY>
  </equation>

  Let <math|y<rsub|n>*<around|(|t,\<omega\>|)>> be the linear operation on
  <math|x*<around|(|t,\<omega\>|)>> defined by <eqref|eq:y> when
  <math|f<around|(|u|)>=f<rsub|n><around|(|u|)>>. Then
  <math|\<xi\><rsub|n><around|(|\<omega\>|)>=y<rsub|n>*<around|(|0,\<omega\>|)>>.
  If <math|f<rsub|n>> has Fourier transform <math|h<rsub|n>>, i.e., if

  <\equation>
    f<rsub|n><around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|n><around|(|v|)>*e<rsup|-i*u*v>*m*<around|(|d*v|)>,<space|1em>h<rsub|n>\<in\>L<rsub|1><around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>,m|)><label|eq:fnFourier>
  </equation>

  then, as it is shown by Rosanov<nbsp><cite|rosanov1959>, p. 278, the order
  of integration in <eqref|eq:y> can be interchanged to give

  <\equation>
    y<rsub|n>*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|n><around|(|v|)>*x*<around|(|t-v,\<omega\>|)>*m*<around|(|d*v|)><label|eq:yn>
  </equation>

  Hence <math|\<xi\><rsub|n><around|(|\<omega\>|)>> may be regarded as the
  output at time <math|t=0> of a linear time invariant system with impulse
  response <math|h<rsub|n>> and input <math|x*<around|(|t,\<omega\>|)>>. We
  also obtain from <eqref|eq:an>

  <\equation>
    a<rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|n><rsup|\<ast\>><around|(|\<tau\>|)>*R<rsub|x*x><around|(|t,-\<tau\>|)>*m*<around|(|d*\<tau\>|)><label|eq:an-hn>
  </equation>

  It should be noted that the series representation of Theorem
  <reference|thm:series-rep> is by no means unique, since for each
  orthonormal and complete set of functions in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> a distinct representation
  <eqref|eq:series> is obtained by <eqref|eq:xin> and <eqref|eq:an>. However,
  in the context of a particular problem, one may be able to determine those
  representations, if any, which have some optimal properties. The
  significance of the representation is primarily in the fact that it exists
  and it is orthogonal, which enables one to use it as a model for the
  harmonizable process in problems involving mean square error criteria.

  Theorem <reference|thm:series-rep> has been proven for mean square
  continuous, wide sense stationary stochastic processes by Masry et
  al.<nbsp><cite|masry1968> and also by Campbell<nbsp><cite|campbell1969>.

  <section|Orthonormal and Complete Sets in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>><label|sec:orthonormal-sets>

  It is clear from Theorem <reference|thm:series-rep> that an explicit series
  expansion of a harmonizable process can be obtained by using <eqref|eq:xin>
  and <eqref|eq:an> provided an orthonormal and complete set of functions in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> can be constructed.

  If the harmonizable process <math|x> is stationary then
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> is isomorphic to
  <math|L<rsub|2><around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>,Q<rsub|X>|)>>,
  where <math|Q<rsub|X>> is a finite nonnegative measure, and a general
  procedure to construct an orthonormal basis in the latter space is
  presented by Masry et al.<nbsp><cite|masry1968>.

  Since

  <\equation>
    \<Lambda\><rsub|2><around|(|r<rsub|X>|)>=\<sigma\><around|{|e<rsup|i*t*u>,t<text|real
    >|}>=\<sigma\><around|{|e<rsup|i*t*u>,t<text|rational
    >|}>,<label|eq:span>
  </equation>

  an orthonormal and complete set of functions in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> can be obtained by
  orthonormalizing the countable set of functions <math|{e<rsup|i*t*u>,t>
  rational <math|}> using the Gram-Schmidt procedure. However, this procedure
  solves the problem of finding an orthonormal basis in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> only in principle.

  The following theorem gives a complete set of functions
  <math|<around|{|F<rsub|n><around|(|t|)>|}>> in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>. By orthonormalizing the
  set <math|<around|{|F<rsub|n><around|(|t|)>|}>> using the Gram-Schmidt
  procedure, an orthonormal and complete set
  <math|<around|{|f<rsub|n><around|(|t|)>|}>> is obtained.

  <\theorem>
    <label|thm:complete-set>Let <math|\<mu\>> be any finite, nonnegative
    measure on <math|<around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>|)>>,
    absolutely continuous with respect to the Lebesgue measure <math|m> with
    Radon-Nikodym derivative <math|<around|[|d*\<mu\>/d*m|]><around|(|t|)>=h<around|(|t|)>\<neq\>0>
    a.e. <math|<around|[|m|]>>, and let <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>>
    be any complete set of functions in <math|L<rsub|2><around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>,\<mu\>|)>=L<rsub|2><around|(|\<mu\>|)>>.
    Then the set <math|<around|{|F<rsub|n><around|(|t|)>|}>> given by

    <\equation>
      F<rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|n><rsup|\<ast\>><around|(|u|)>*e<rsup|i*t*u>*\<mu\>*<around|(|d*u|)><label|eq:Fn>
    </equation>

    is complete in <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>.
  </theorem>

  <\proof>
    Since <math|\<mu\>> is finite, <math|\<phi\><rsub|n>\<in\>L<rsub|2><around|(|\<mu\>|)>>
    implies <math|\<phi\><rsub|n>\<in\>L<rsub|1><around|(|\<mu\>|)>> and
    hence the functions <math|F<rsub|n><around|(|t|)>> are well-defined by
    <eqref|eq:Fn> everywhere and

    <\equation>
      <around|\||F<rsub|n><around|(|t|)>|\|>\<leqslant\><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<phi\><rsub|n><rsup|\<ast\>><around|(|u|)>|\|>*\<mu\>*<around|(|d*u|)>=<around|\<\|\|\>|\<phi\><rsub|n>|\<\|\|\>><rsub|L<rsub|1><around|(|\<mu\>|)>><label|eq:Fn-bound>
    </equation>

    This implies that <math|F<rsub|n>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
    and

    <\equation>
      <around|\<\|\|\>|F<rsub|n>|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2>\<leqslant\><around|\<\|\|\>|\<phi\><rsub|n>|\<\|\|\>><rsub|L<rsub|1><around|(|\<mu\>|)>><rsup|2><around|\||r<rsub|X>|\|><around|(|R<rsup|2>|)>,<label|eq:Fn-norm>
    </equation>

    where <math|<around|\||r<rsub|X>|\|>> denotes the total variation of
    <math|r<rsub|X>>.

    The completeness of the set <math|<around|{|F<rsub|n><around|(|t|)>|}>>
    in <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> is shown as follows.
    Let <math|f\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> and

    <\equation>
      <around|(|F<rsub|n>,f|)><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>=0\<forall\>n
    </equation>

    <math|>

    Then

    <\align>
      <tformat|<table|<row|<cell|0>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>F<rsub|n><around|(|u|)>*f<rsup|\<ast\>><around|(|v|)>*r<rsub|X><around|(|d*u,d*v|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|n><rsup|\<ast\>><around|(|t|)>*e<rsup|i*t*u>*f<rsup|\<ast\>><around|(|v|)>*\<mu\>*<around|(|d*t|)>*r<rsub|X><around|(|d*u,d*v|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>F<around|(|t|)>*\<phi\><rsub|n><rsup|\<ast\>><around|(|t|)>*\<mu\>*<around|(|d*t|)><eq-number><label|eq:Fn-complete>>>>>
    </align>

    where

    <\equation>
      F<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*f<rsup|\<ast\>><around|(|v|)>*r<rsub|X><around|(|d*u,d*v|)>=<around|(|e<rsup|i*t*u>,f<around|(|u|)>|)><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><label|eq:F>
    </equation>

    It follows by <eqref|eq:Fn-complete> that

    <\align>
      <tformat|<table|<row|<cell|<around|\||F<around|(|t|)>|\|><rsup|2>>|<cell|\<leqslant\><around|\<\|\|\>|e<rsup|i*t*u>|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2><around|\<\|\|\>|f|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2><eq-number>>>|<row|<cell|>|<cell|=R<rsub|x*x><around|(|t,t|)><around|\<\|\|\>|f|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2>>>|<row|<cell|>|<cell|\<leqslant\><around|\||r<rsub|X>|\|><around|(|R<rsup|2>|)><around|\<\|\|\>|f|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2><eq-number><label|eq:F-bound>>>>>
    </align>

    and

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||F<around|(|t|)>|\|><rsup|2>*\<mu\>*<around|(|d*t|)>\<leqslant\><around|\||r<rsub|X>|\|><around|(|R<rsup|2>|)><around|\<\|\|\>|f|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2>*\<mu\><around|(|\<bbb-R\>|)>\<less\>\<infty\><label|eq:F-L2>
    </equation>

    i.e., <math|F\<in\>L<rsub|2><around|(|\<mu\>|)>>. The completeness of the
    set <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>> in
    <math|L<rsub|2><around|(|\<mu\>|)>> and <eqref|eq:Fn-complete> imply that
    <math|F=0> in <math|L<rsub|2><around|(|\<mu\>|)>>, i.e.,
    <math|<around|\||F<around|(|t|)>|\|><rsup|2>*h<around|(|t|)>=0> a.e.
    <math|<around|[|m|]>>. Since <math|h<around|(|t|)>\<neq\>0> a.e. [m], it
    follows that <math|F<around|(|t|)>=0> a.e. [m]. But the continuity of
    <math|e<rsup|i*t*u>> in <math|t> and the bounded convergence theorem
    imply by <eqref|eq:F> that <math|F<around|(|t|)>> is continuous in
    <math|t>. Hence <math|F<around|(|t|)>=0> for all <math|t\<in\>\<bbb-R\>>
    and by <eqref|eq:F> <math|f> is orthogonal to the set
    <math|<around|{|e<rsup|i*t*u>,t\<in\>\<bbb-R\>|}>>, which is dense in
    <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>. It follows that
    <math|f=0> in <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> and hence
    the set <math|<around|{|F<rsub|n><around|(|t|)>|}>> is complete in
    <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>.
  </proof>

  It should be pointed out that the set of functions
  <math|<around|{|F<rsub|n><around|(|t|)>|}>> given by <eqref|eq:Fn>, which
  is shown in Theorem <reference|thm:complete-set> to be complete in any
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> space with <math|r<rsub|X>>
  of bounded variation on the entire plane, is independent of the measure
  <math|r<rsub|X>> and is completely determined by <math|\<mu\>> and
  <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>>. It is clear, however,
  that the orthonormal and complete set of functions
  <math|<around|{|f<rsub|n><around|(|t|)>|}>> in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>, obtained by
  orthonormalizing the complete set <math|<around|{|F<rsub|n><around|(|t|)>|}>>,
  depends on the measure <math|r<rsub|X>>.

  Theorem <reference|thm:complete-set> allows considerable freedom in the
  choice of the measure <math|\<mu\>> and complete freedom in the choice of
  the complete set of functions <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>>
  in <math|L<rsub|2><around|(|\<mu\>|)>>. As a complete set of functions in
  <math|L<rsub|2><around|(|\<mu\>|)>> one can choose the orthonormal and
  complete set <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>> given by
  Masry et al.<nbsp><cite|masry1968>:

  <\equation>
    \<phi\><rsub|n><around|(|t|)>=<frac|1|<sqrt|\<mu\><around|(|\<bbb-R\>|)>>>*exp
    <around*|(|<frac|i*n*2*\<pi\>|\<mu\><around|(|\<bbb-R\>|)>>*<big|int><rsub|-\<infty\>><rsup|t>h<around|(|u|)>*m*<around|(|d*u|)>|)>,<space|1em>n=0,\<pm\>1,\<pm\>2,\<ldots\><label|eq:phin>
  </equation>

  Upon normalizing <math|\<mu\>,\<mu\><around|(|\<bbb-R\>|)>=1>, and using
  the complete set <eqref|eq:phin> in <eqref|eq:Fn> we obtain the complete
  set of functions

  <\align>
    <tformat|<table|<row|<cell|F<rsub|n><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
    <around|[|i*<around|{|t*u-n*2*\<pi\>*H<around|(|u|)>|}>|]>*h<around|(|u|)>*m*<around|(|d*u|)>*<space|1em>n=0,\<pm\>1,\<pm\>2,\<ldots\><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|1>exp
    <around|[|i*<around|{|t*H<rsup|-1><around|(|v|)>-n*2*\<pi\>*v|}>|]>*m*<around|(|d*v|)><eq-number><label|eq:Fn-exp>>>>>
  </align>

  where <math|h> is any probability density with
  <math|h<around|(|u|)>\<neq\>0> a.e. [<math|m>], and

  <\equation>
    H<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|u>h<around|(|v|)>*m*<around|(|d*v|)><label|eq:H>
  </equation>

  It is clear that the functions given by <eqref|eq:Fn> are uniformly
  continuous and uniformly bounded for fixed <math|n>, and that the family of
  functions given by <eqref|eq:Fn-exp> is equicontinuous and uniformly
  bounded.

  <subsection*|Examples>

  By choosing probability densities <math|h> of particular form, we obtain by
  <eqref|eq:Fn-exp> various sets of complete functions in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>. However, as it is
  illustrated by the following examples, the integral in <eqref|eq:Fn-exp> is
  not easily expressed in terms of the elementary and the special functions.

  <\enumerate>
    <item>The density of the normal distribution,
    <math|h<around|(|u|)>=<around|(|1/<sqrt|2*\<pi\>>|)>*e<rsup|-<frac|1|2>*u<rsup|2>>>,
    gives

    <\equation>
      F<rsub|n><around|(|t|)>=<around|(|-1|)><rsup|n><sqrt|<frac|2|\<pi\>>>*<big|int><rsub|0><rsup|\<infty\>>cos
      <around*|[|t*u-n*\<pi\>*\<Phi\><around*|(|<frac|u|<sqrt|2>>|)>|]>*e<rsup|-<frac|1|2>*u<rsup|2>>*m*<around|(|d*u|)><label|eq:Fn-normal>
    </equation>

    where <math|\<Phi\><around|(|u|)>=<around|(|2/<sqrt|\<pi\>>|)>*<big|int><rsub|0><rsup|u>e<rsup|-v<rsup|2>>*m*<around|(|d*v|)>>.

    <item>The density of the double exponential distribution,
    <math|h<around|(|u|)>=<frac|1|2>*e<rsup|-<around|\||u|\|>>>, gives

    <\align>
      <tformat|<table|<row|<cell|F<rsub|n><around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-u>*cos
      <around|[|t*u+n*\<pi\>*e<rsup|-u>|]>*m*<around|(|d*u|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|1>cos
      <around|[|t*ln v-n*\<pi\>*v|]>*m*<around|(|d*v|)><eq-number><label|eq:Fn-double-exp>>>>>
    </align>

    <item>The density of the Cauchy distribution,
    <math|h<around|(|u|)>=<around|(|1/\<pi\>*<around|(|1+u<rsup|2>|)>|)>>,
    gives

    <\align>
      <tformat|<table|<row|<cell|F<rsub|n><around|(|t|)>>|<cell|=<around|(|-1|)><rsup|n><frac|2|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>cos
      <around|[|t*u-2*n*tan<rsup|-1> u|]>*<frac|m*<around|(|d*u|)>|1+u<rsup|2>><eq-number>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><frac|2|\<pi\>>*<big|int><rsub|0><rsup|\<pi\>/2>cos
      <around|[|t*tan v-2*n*v|]>*m*<around|(|d*v|)><eq-number><label|eq:Fn-cauchy>>>>>
    </align>

    <item>The probability density

    <\equation>
      h<around|(|u|)>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<alpha\><rsup|-k>>|<cell|<text|on
      ><around|(|k-1,k|)>,<space|1em>k\<leqslant\>-1>>|<row|<cell|<frac|1-3*\<alpha\>|2*<around|(|1-\<alpha\>|)>>>|<cell|<text|on
      ><around|(|-1,+1|)>,>>|<row|<cell|\<alpha\><rsup|k>>|<cell|<text|on
      ><around|(|k,k+1|)>,<space|1em>k\<geqslant\>1>>>>>|\<nobracket\>><label|eq:h-custom>
    </equation>

    where <math|0\<less\>\<alpha\>\<less\><frac|1|3>>, gives

    <\equation>
      F<rsub|n><around|(|t|)>=2*<around|(|-1|)><rsup|n>*<big|sum><rsub|k=0><rsup|\<infty\>>\<alpha\><rsup|k>*cos
      <around*|[|<around*|(|k+<frac|1|2>|)>*t-n*\<pi\>*c<rsub|k>|]>*<frac|sin
      <around*|(|<frac|1|2>*t-n*\<pi\>*\<alpha\><rsup|k>|)>|<frac|1|2>*t-n*\<pi\>*\<alpha\><rsup|k>><label|eq:Fn-custom>
    </equation>

    where <math|c<rsub|k>=1-<around|(|1+\<alpha\>/1-\<alpha\>|)>*\<alpha\><rsup|k>>.

    <item>If <math|r<rsub|X>> is supported by
    <math|<around|(|a,b|)>\<times\><around|(|a,b|)>>, then by using the
    density of the uniform distribution on
    <math|<around|(|a,b|)>,h<around|(|u|)>=<around|(|1/b-a|)>> on
    <math|<around|(|a,b|)>> and zero elsewhere, we obtain the complete set of
    functions

    <\equation>
      F<rsub|n><around|(|t|)>=<frac|e<rsup|i*b*t>-e<rsup|i*a*t>|i*<around|[|<around|(|b-a|)>*t-n*2*\<pi\>|]>><label|eq:Fn-uniform>
    </equation>

    which in the particular case where <math|a=-T,b=T> gives

    <\equation>
      F<rsub|n><around|(|t|)>=<around|(|-1|)><rsup|n><frac|sin
      <around*|[|\<pi\>*<around*|(|<frac|T|\<pi\>>*t-n|)>|]>|\<pi\>*<around*|(|<frac|T|\<pi\>>*t-n|)>><label|eq:Fn-uniform-symm>
    </equation>
  </enumerate>

  <section|Orthogonal Integral Representation of a Harmonizable Stochastic
  Process><label|sec:orthogonal-integral>

  Clearly any second order stochastic process
  <math|x*<around|(|t,\<omega\>|)>> having an orthogonal series expansion of
  the form <eqref|eq:series> admits a trivial orthogonal integral
  representation of the form

  <\equation>
    x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t,u|)>*Y<around|(|d*u,\<omega\>|)>,<label|eq:integral-rep>
  </equation>

  where the orthogonal random measure <math|Y> is concentrated on the set of
  integers with <math|Y<around|(|<around|{|n|}>,\<omega\>|)>=\<xi\><rsub|n><around|(|\<omega\>|)>>
  and <math|f<around|(|t,n|)>=a<rsub|n><around|(|t|)>>.

  The following theorem shows that an explicit (nontrivial) orthogonal
  integral representation of a harmonizable stochastic process can always be
  obtained and that the nonnegative measure associated with the orthogonal
  random measure can be chosen arbitrarily from a wide class of measures.

  <\theorem>
    <label|thm:integral-rep>Let <math|\<mu\>> be any nonnegative measure on
    <math|<around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>|)>>, finite on
    the bounded Borel sets <math|<with|math-font|cal*|B>> and such that
    <math|L<rsub|2><around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>,\<mu\>|)>=L<rsub|2><around|(|\<mu\>|)>>
    is infinite dimensional. Let <math|<around|{|\<varphi\><rsub|n>|(>\<cdot\><around|)||}>>
    be an orthonormal and complete set of functions in
    <math|L<rsub|2><around|(|\<mu\>|)>>. Then every harmonizable stochastic
    process <math|x*<around|(|t,\<omega\>|)>> admits an orthogonal integral
    representation

    <\equation>
      x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t,u|)>*Y<around|(|d*u,\<omega\>|)><label|eq:integral-rep-thm>
    </equation>

    The function <math|f<around|(|t,u|)>> is given by

    <\equation>
      f<around|(|t,u|)>=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*\<varphi\><rsub|n><around|(|u|)><label|eq:f-integral>
    </equation>

    in <math|L<rsub|2><around|(|\<mu\>|)>> for all <math|t\<in\>\<bbb-R\>>.
    The orthogonal random measure <math|Y> is defined on
    <math|<with|math-font|cal*|B>> by

    <\equation>
      Y<around|(|S,\<omega\>|)>=<big|sum><rsub|n>\<xi\><rsub|n><around|(|\<omega\>|)>*<big|int><rsub|S>\<varphi\><rsub|n><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)><label|eq:Y-thm>
    </equation>

    in the mean square sense for all <math|S\<in\><with|math-font|cal*|B>>
    and has <math|Q<rsub|Y>=\<mu\>>. The <math|a<rsub|n>>'s and the
    <math|\<xi\><rsub|n>>'s are given in Theorem <reference|thm:series-rep>.
  </theorem>

  <\proof>
    We first show that <math|Y> is well-defined on
    <math|<with|math-font|cal*|B>> by <eqref|eq:Y-thm> and that it is
    orthogonal. Since <math|\<mu\>> is finite on
    <math|<with|math-font|cal*|B>,I<rsub|S>\<in\>L<rsub|2><around|(|\<mu\>|)>>
    for all <math|S\<in\><with|math-font|cal*|B>>. Hence

    <\equation>
      I<rsub|S><around|(|u|)>=<big|sum><rsub|n>b<rsub|n><around|(|S|)>*\<varphi\><rsub|n><around|(|u|)><label|eq:IS>
    </equation>

    where

    <\equation>
      b<rsub|n><around|(|S|)>=<big|int><rsub|S>\<varphi\><rsub|n><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)><label|eq:bn>
    </equation>

    It follows that

    <\align>
      <tformat|<table|<row|<cell|>|<cell|<big|sum><rsub|n><big|int><rsub|S<rsub|1>>\<varphi\><rsub|n><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)>*<big|int><rsub|S<rsub|2>>\<varphi\><rsub|n><around|(|u|)>*\<mu\>*<around|(|d*u|)><eq-number>>>|<row|<cell|>|<cell|<space|1em>=<around|(|I<rsub|S<rsub|1>>,I<rsub|S<rsub|2>>|)><rsub|L<rsub|2><around|(|\<mu\>|)>>=\<mu\>*<around|(|S<rsub|1>\<cap\>S<rsub|2>|)>\<less\>\<infty\>*<space|1em><text|for
      all ><space|1em>S<rsub|1>,S<rsub|2>\<in\><with|math-font|cal*|B><eq-number><label|eq:sum-finite>>>>>
    </align>

    and in particular that

    <\equation>
      <big|sum><rsub|n><around*|\||<big|int><rsub|S>\<varphi\><rsub|n><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)>|\|><rsup|2>=<around|\<\|\|\>|I<rsub|S>|\<\|\|\>><rsub|L<rsub|2><around|(|\<mu\>|)>><rsup|2>=\<mu\><around|(|S|)>\<less\>\<infty\><label|eq:mu-finite>
    </equation>

    Hence <math|Y> is well-defined by <eqref|eq:Y-thm> in
    <math|L<rsub|2><around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>> for all
    <math|S\<in\><with|math-font|cal*|B>>. It follows by <eqref|eq:Y-thm> and
    <eqref|eq:bn> that

    <\equation>
      r<rsub|Y>*<around|(|S<rsub|1>\<times\>S<rsub|2>|)>=\<mu\>*<around|(|S<rsub|1>\<cap\>S<rsub|2>|)><label|eq:rY>
    </equation>

    and thus <math|Y> is orthogonal with <math|Q<rsub|Y>=\<mu\>>.

    We next show that <math|f<around|(|t,u|)>> is well-defined in
    <math|L<rsub|2><around|(|\<mu\>|)>> by <eqref|eq:f-integral> for all
    <math|t\<in\>\<bbb-R\>>. This is clear since from
    <eqref|eq:autocorr-series>

    <\equation>
      <big|sum><rsub|n><around|\||a<rsub|n><around|(|t|)>|\|><rsup|2>=R<rsub|x*x><around|(|t,t|)>\<less\>\<infty\>*<space|1em><text|for
      all ><space|1em>t\<in\>\<bbb-R\><label|eq:an-finite>
    </equation>

    Hence the integral in <eqref|eq:integral-rep-thm> is well-defined and
    from <eqref|eq:f-integral>, <eqref|eq:Y-thm>, and <eqref|eq:series> we
    have

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t,u|)>*Y<around|(|d*u,\<omega\>|)>>|<cell|=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|n><around|(|u|)>*Y<around|(|d*u,\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*<big|sum><rsub|m><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|n><around|(|u|)>*\<varphi\><rsub|m><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)>*\<xi\><rsub|m><around|(|\<omega\>|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*\<xi\><rsub|n><around|(|\<omega\>|)>=x*<around|(|t,\<omega\>|)><eq-number><label|eq:integral-proof>>>>>
    </align>

    which proves <eqref|eq:integral-rep-thm>.
  </proof>

  The freedom in choosing the measure <math|\<mu\>> enables us to obtain
  various orthogonal integral representations <eqref|eq:integral-rep-thm> of
  particular form. If <math|\<mu\>> is chosen to be a finite nonnegative
  measure on <math|\<bbb-R\>> then <math|Y> will be finite on the whole real
  line and the <math|\<varphi\><rsub|n>>'s can be chosen as in
  <eqref|eq:phin> given by Masry et al.<nbsp><cite|masry1968>. If
  <math|\<mu\>> is chosen to be the Lebesgue measure or the Lebesgue measure
  restricted to the half line or to an interval, then the
  <math|\<varphi\><rsub|n>>'s may be chosen to be well-known orthonormal and
  complete sets of functions such as the Tchebysheff-Hermite functions, the
  Tchebysheff-Laguerre functions, the Legendre polynomials or the
  trigonometric system. In this latter case it is clear from <eqref|eq:rY>
  that the orthogonal random measure <math|Y> has stationary values.

  A harmonizable stochastic process is shown to have the nonorthogonal
  integral representation <eqref|eq:proc-integral>, the orthogonal series
  expansion <eqref|eq:series> and the orthogonal integral representation
  <eqref|eq:integral-rep-thm>. The relationship between the orthogonal random
  measure <math|Y> and the random measure <math|X> is

  <\equation>
    Y<around|(|S,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|sum><rsub|n>f<rsub|n><around|(|v|)>*<big|int><rsub|S>\<varphi\><rsub|n><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)>|]>*X<around|(|d*v,\<omega\>|)><label|eq:Y-X>
  </equation>

  for all <math|S\<in\><with|math-font|cal*|B>>, which can be obtained by
  <eqref|eq:Y-thm> and <eqref|eq:xin>.

  <section|Moving Average Representations and Harmonizable Stochastic
  Processes><label|sec:moving-avg>

  A second-order stochastic process <math|<around|{|x*<around|(|t,\<omega\>|)>,t\<in\>\<bbb-R\>,\<omega\>\<in\>\<Omega\>|}>>
  is said to have a moving average representation if and only if

  <\equation>
    x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f*<around|(|t-u|)>*X<around|(|d*u,\<omega\>|)>*<space|1em><text|for
    all ><space|1em>t\<in\>\<bbb-R\><label|eq:moving-avg>
  </equation>

  where <math|X> is a random measure defined on the bounded Borel sets of
  <math|\<bbb-R\>> and <math|f*<around|(|t-\<cdot\>|)>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
  for all <math|t\<in\>\<bbb-R\>>. This is a generalization of the usual
  definition which assumes <math|X> to be orthogonal and <math|Q<rsub|X>> to
  be the Lebesgue measure. A moving average representation is orthogonal if
  and only if <math|X> is orthogonal and in this case
  <math|f*<around|(|t-\<cdot\>|)>\<in\>L<rsub|2><around|(|Q<rsub|X>|)>> for
  all <math|t\<in\>\<bbb-R\>>.

  It is shown by Karhunen<nbsp><cite|karhunen1947> and
  Doob<nbsp><cite|doob1953> that (i) a second-order stochastic process which
  has an orthogonal moving average representation with <math|Q<rsub|X>=m>,
  the Lebesgue measure, and <math|f\<in\>L<rsub|2><around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>,m|)>=L<rsub|2><around|(|m|)>>
  is mean square continuous wide sense stationary and has absolutely
  continuous spectrum; and conversely that (ii) a mean square continuous wide
  sense stationary process with absolutely continuous spectrum has a moving
  average representation with <math|Q<rsub|X>=m> and
  <math|f\<in\>L<rsub|2><around|(|m|)>> is the Fourier transform of the
  square root of its spectral density.

  Sufficient conditions for the harmonizability of a stochastic process which
  has a moving average representation are given in the following

  <\theorem>
    <label|thm:moving-avg-harmonizable>If a second-order stochastic process
    <math|x*<around|(|t,\<omega\>|)>> has a moving average representation
    with <math|r<rsub|X>> a measure of bounded variation on the entire plane
    <math|\<bbb-R\><rsup|2>,f\<in\>L<rsub|1><around|(|m|)>> and its Fourier
    transform <math|F\<in\>L<rsub|1><around|(|m|)>>, then
    <math|x*<around|(|t,\<omega\>|)>> is harmonizable.
  </theorem>

  <\proof>
    We have

    <\equation>
      f<around|(|\<tau\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>F<around|(|\<rho\>|)>*e<rsup|i*\<tau\>*\<rho\>>*m*<around|(|d*\<rho\>|)><label|eq:f-fourier>
    </equation>

    Since <math|F\<in\>L<rsub|1><around|(|m|)>> and <math|r<rsub|X>> is
    finite, by interchanging the order of integration (see
    Rosanov<nbsp><cite|rosanov1959>, p. 287), we obtain from
    <eqref|eq:moving-avg>

    <\equation>
      x*<around|(|t,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>F<around|(|\<rho\>|)>*e<rsup|-i*u*\<rho\>>*e<rsup|i*t*\<rho\>>*X<around|(|d*u,\<omega\>|)>*m*<around|(|d*\<rho\>|)><label|eq:x-interchange>
    </equation>

    Also, <math|F\<in\>L<rsub|1><around|(|m|)>> and <math|r<rsub|X>> finite
    imply that for all <math|S\<in\><with|math-font|cal*|B><rsup|1>>

    <\equation>
      <big|int><rsub|S>F<around|(|\<rho\>|)>*e<rsup|-i*u*\<rho\>>*m*<around|(|d*\<rho\>|)>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)><label|eq:F-Lambda>
    </equation>

    Hence the random measure <math|Y> on <math|<around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>|)>>
    is well-defined by

    <\equation>
      Y<around|(|S,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|S>F<around|(|\<rho\>|)>*e<rsup|-i*u*\<rho\>>*m*<around|(|d*\<rho\>|)>|]>*X<around|(|d*u,\<omega\>|)><label|eq:Y-define>
    </equation>

    for all <math|S\<in\><with|math-font|cal*|B><rsup|1>> and by
    interchanging the order of integration we obtain

    <\equation>
      Y<around|(|S,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|S>F<around|(|\<rho\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*u*\<rho\>>*X<around|(|d*u,\<omega\>|)>|]>*m*<around|(|d*\<rho\>|)><label|eq:Y-interchange>
    </equation>

    i.e.,

    <\equation>
      <around*|[|<frac|d*Y|d*m>|]><around|(|\<rho\>,\<omega\>|)>=<frac|F<around|(|\<rho\>|)>|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*u*\<rho\>>*X<around|(|d*u,\<omega\>|)><label|eq:dY-dm>
    </equation>

    Since <math|F\<in\>L<rsub|1><around|(|m|)>> and <math|r<rsub|X>> is
    finite, the lemma which follows this proof applies, and
    <eqref|eq:x-interchange> and <eqref|eq:dY-dm> imply

    <\equation>
      x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<rho\>>*Y<around|(|d*\<rho\>,\<omega\>|)><label|eq:x-harmonize>
    </equation>

    Therefore, <math|x*<around|(|t,\<omega\>|)>> is harmonizable.
  </proof>

  The property used in the last step of the proof of Theorem
  <reference|thm:moving-avg-harmonizable> will be proven now. It corresponds
  to the familiar property of Radon-Nikodym derivative in the scalar case and
  is used in later sections of this paper.

  <\lemma>
    <label|lem:radon-nikodym>If the second-order stochastic process
    <math|<around|{|y*<around|(|t,\<omega\>|)>,t\<in\>\<bbb-R\>,\<omega\>\<in\>\<Omega\>|}>>
    is such that

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||R<rsub|y*y><around|(|t,s|)>|\|>*m*<around|(|d*t|)>*m*<around|(|d*s|)>\<less\>\<infty\><label|eq:Ryy-finite>
    </equation>

    then

    <\equation>
      Y<around|(|S,\<omega\>|)>=<big|int><rsub|S>y*<around|(|t,\<omega\>|)>*m*<around|(|d*t|)>,<space|1em>S\<in\><with|math-font|cal*|B><rsup|1><label|eq:Y-lemma>
    </equation>

    defines a random measure <math|Y> on <math|<around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>|)>>
    with <math|r<rsub|Y>> of bounded variation on <math|\<bbb-R\><rsup|2>>,
    and for all <math|g\<in\>\<Lambda\><rsub|2><around|(|r<rsub|Y>|)>>

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*Y<around|(|d*t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*y*<around|(|t,\<omega\>|)>*m*<around|(|d*t|)><label|eq:g-interchange>
    </equation>

    all equalities being in the mean square sense.
  </lemma>

  <\proof>
    It is clear from <eqref|eq:Ryy-finite> that <eqref|eq:Y-lemma> defines a
    random measure <math|Y> on <math|<around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>|)>>
    with <math|r<rsub|Y>> of bounded variation on <math|\<bbb-R\><rsup|2>>.

    If we put

    <\equation>
      \<xi\><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*Y<around|(|d*t,\<omega\>|)>*<space|1em><text|and
      ><space|1em>\<eta\><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*y*<around|(|t,\<omega\>|)>*m*<around|(|d*t|)><label|eq:xi-eta>
    </equation>

    it suffices to show that

    <\equation>
      <with|math-font|cal*|E><around|[|<around|\||\<xi\>-\<eta\>|\|><rsup|2>|]>=<with|math-font|cal*|E><around|[|<around|\||\<xi\>|\|><rsup|2>|]>+<with|math-font|cal*|E><around|[|<around|\||\<eta\>|\|><rsup|2>|]>-<with|math-font|cal*|E><around|[|\<xi\>*\<eta\><rsup|\<ast\>>|]>-<with|math-font|cal*|E><around|[|\<eta\>*\<xi\><rsup|\<ast\>>|]>=0<label|eq:xi-eta-equal>
    </equation>

    We have

    <\align>
      <tformat|<table|<row|<cell|<with|math-font|cal*|E><around|[|<around|\||\<xi\>|\|><rsup|2>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*g<rsup|\<ast\>><around|(|s|)>*r<rsub|Y><around|(|d*t,d*s|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*g<rsup|\<ast\>><around|(|s|)>*R<rsub|y*y><around|(|t,s|)>*m*<around|(|d*t|)>*m*<around|(|d*s|)><eq-number>>>|<row|<cell|<with|math-font|cal*|E><around|[|<around|\||\<eta\>|\|><rsup|2>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*g<rsup|\<ast\>><around|(|s|)>*R<rsub|y*y><around|(|t,s|)>*m*<around|(|d*t|)>*m*<around|(|d*s|)>,<eq-number>>>|<row|<cell|<with|math-font|cal*|E><around|[|\<eta\>*\<xi\><rsup|\<ast\>>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)><with|math-font|cal*|E><around|[|y<around|(|t|)>*\<xi\><rsup|\<ast\>>|]>*m*<around|(|d*t|)><eq-number>>>|<row|<cell|<with|math-font|cal*|E><around|[|y<around|(|t|)>*\<xi\><rsup|\<ast\>>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<rsup|\<ast\>><around|(|s|)>*\<lambda\><rsub|t>*<around|(|d*s|)><eq-number><label|eq:E-terms>>>>>
    </align>

    where the measure <math|\<lambda\><rsub|t>> on
    <math|<around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>|)>> is defined
    by

    <\equation>
      \<lambda\><rsub|t><around|(|S|)>=<with|math-font|cal*|E><around|[|y<around|(|t|)>*Y<rsup|\<ast\>><around|(|S|)>|]>=<big|int><rsub|S>R<rsub|y*y><around|(|t,s|)>*m*<around|(|d*s|)><label|eq:lambda>
    </equation>

    for all <math|S\<in\><with|math-font|cal*|B><rsup|1>>. It follows by
    <eqref|eq:E-terms> and <eqref|eq:lambda> that

    <\equation>
      <with|math-font|cal*|E><around|[|y<around|(|t|)>*\<xi\><rsup|\<ast\>>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<rsup|\<ast\>><around|(|s|)>*R<rsub|y*y><around|(|t,s|)>*m*<around|(|d*s|)><label|eq:E-y-xi>
    </equation>

    and by <eqref|eq:E-terms>

    <\equation>
      <with|math-font|cal*|E><around|[|\<eta\>*\<xi\><rsup|\<ast\>>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*g<rsup|\<ast\>><around|(|s|)>*R<rsub|y*y><around|(|t,s|)>*m*<around|(|d*t|)>*m*<around|(|d*s|)>=<with|math-font|cal*|E><around|[|\<xi\>*\<eta\><rsup|\<ast\>>|]><label|eq:E-eta-xi>
    </equation>

    The validity of <eqref|eq:xi-eta-equal> follows from <eqref|eq:E-terms>,
    <eqref|eq:E-eta-xi> and the proof is complete.
  </proof>

  If the moving average representation in Theorem
  <reference|thm:moving-avg-harmonizable> is orthogonal, then the condition
  of bounded variation of <math|r<rsub|X>> is equivalent to the finiteness of
  <math|Q<rsub|X>>.

  If the second-order stochastic process <math|x*<around|(|t,\<omega\>|)>>
  has a moving average representation and <math|X> has Radon-Nikodym
  derivative with respect to the Lebesgue measure the second-order stochastic
  process <math|y*<around|(|t,\<omega\>|)>,<around|[|d*Y/d*m|]>=y>, then

  <\equation>
    x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f*<around|(|t-u|)>*y*<around|(|u,\<omega\>|)>*m*<around|(|d*u|)><label|eq:x-conv>
  </equation>

  In this case <math|x*<around|(|t,\<omega\>|)>> can be regarded as the
  output of a linear time invariant system with impulse response <math|f> and
  input the stochastic process <math|y*<around|(|t,\<omega\>|)>>. Theorem
  <reference|thm:moving-avg-harmonizable> then implies that if
  <math|y*<around|(|t,\<omega\>|)>> is integrable over <math|\<bbb-R\>> in
  the mean square sense, i.e., if <math|R<rsub|y*y><around|(|t,s|)>> is
  integrable over <math|\<bbb-R\><rsup|2>>, and
  <math|f,F\<in\>L<rsub|1><around|(|m|)>> then the output
  <math|x*<around|(|t,\<omega\>|)>> is a harmonizable stochastic process. In
  the following section a more general result is proven which includes time
  varying linear systems.

  <section|Linear Time Varying Systems and Harmonizable Stochastic
  Processes><label|sec:linear-systems>

  Two kinds of linear time varying systems characterized by their impulse
  response <math|h*<around|(|t,\<tau\>|)>>, i.e., the response at time
  <math|t> to a unit impulse input at time <math|\<tau\>>, are considered in
  this section. Systems with <math|h> a deterministic function and systems
  with <math|h> a sample function of a stochastic process.

  <subsection|Deterministic Linear Time Varying
  Systems><label|subsec:deterministic>

  Consider a linear time varying system with impulse response
  <math|h*<around|(|t,\<tau\>|)>>. If the input process <math|x> is such that

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t,u|)>*h<rsup|\<ast\>>*<around|(|t,v|)>*R<rsub|x*x><around|(|u,v|)>*m*<around|(|d*u|)>*m*<around|(|d*v|)>\<less\>\<infty\>*<space|1em><text|for
    all ><space|1em>t\<in\>\<bbb-R\><label|eq:impulse-finite>
  </equation>

  then the output of the system is the second-order stochastic process
  <math|y> defined by

  <\equation>
    y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t,u|)>*x*<around|(|u,\<omega\>|)>*m*<around|(|d*u|)>*<space|1em><text|for
    all ><space|1em>t\<in\>\<bbb-R\><label|eq:y-output>
  </equation>

  It is apparent that a sufficient condition for the output of the system to
  be a stochastic process of second-order for all input processes <math|x>
  which have uniformly bounded autocorrelation functions

  <\equation>
    <around|\||R<rsub|x*x><around|(|u,v|)>|\|>\<leqslant\>M\<less\>\<infty\>*<space|1em><text|for
    all >u,v\<in\>\<bbb-R\><label|eq:Rxx-bounded>
  </equation>

  is

  <\equation>
    h*<around|(|t,\<cdot\>|)>\<in\>L<rsub|1><around|(|m|)>*<space|1em><text|for
    all >t\<in\>\<bbb-R\><label|eq:h-L1>
  </equation>

  The wide sense stationary processes <math|x> belong to this class since

  <\equation>
    <around|\||R<rsub|x*x><around|(|u,v|)>|\|>=<around|\||R<rsub|x*x>*<around|(|u-v|)>|\|>\<leqslant\>R<rsub|x*x><around|(|0|)>\<less\>\<infty\>*<space|1em><text|for
    all >u,v\<in\>\<bbb-R\><label|eq:Rxx-stationary>
  </equation>

  and so do the harmonizable stochastic processes <math|x>, since

  <\equation>
    <around|\||R<rsub|x*x><around|(|u,v|)>|\|>\<leqslant\><around|\||r<rsub|X>|\|><around|(|\<bbb-R\><rsup|2>|)>\<less\>\<infty\>*<space|1em><text|for
    all >u,v\<in\>\<bbb-R\><label|eq:Rxx-harmonizable>
  </equation>

  The following theorem provides a set of sufficient conditions which imply
  the harmonizability of the output of a linear time varying system.

  <\theorem>
    <label|thm:linear-system-harmonizable>Let <math|h*<around|(|t,\<tau\>|)>>
    be the impulse response of a linear time varying system and
    <math|x*<around|(|t,\<omega\>|)>> be the input stochastic process. If
    <math|h*<around|(|\<cdummy\>,\<tau\>|)>> is the Fourier transform of a
    function <math|g<around|(|\<cdummy\>,\<tau\>|)>\<in\>L<rsub|1><around|(|m|)>>
    for all <math|\<tau\>\<in\>\<bbb-R\>> and if <math|g> satisfies

    <\equation>
      <with|font-base-size|9|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||g<around|(|\<tau\>,u|)>|\|><around|\||g<rsup|\<ast\>><around|(|\<sigma\>,v|)>|\|><around|\||R<rsub|x*x><around|(|u,v|)>|\|>*m*<around|(|d*u|)>*m*<around|(|d*v|)>*m*<around|(|d*\<tau\>|)>*m*<around|(|d*\<sigma\>|)>\<less\>\<infty\><label|eq:g-condition>>
    </equation>

    then the output stochastic process is harmonizable.
  </theorem>

  <\proof>
    For all <math|\<tau\>\<in\>\<bbb-R\>> we have

    <\equation>
      h*<around|(|t,\<tau\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|s,\<tau\>|)>*e<rsup|i*t*s>*m*<around|(|d*s|)><label|eq:h-g-transform>
    </equation>

    Hence <eqref|eq:impulse-finite> implies <eqref|eq:impulse-finite> and
    <math|y*<around|(|t,\<omega\>|)>> is well-defined by <eqref|eq:y-output>
    in the stochastic mean. It follows by <eqref|eq:g-condition> that the
    random measure <math|Y> defined on <math|<around|(|\<bbb-R\>,<with|math-font|cal*|B><rsup|1>|)>>
    by

    <\equation>
      <around*|[|<frac|d*Y|d*m>|]><around|(|\<tau\>,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<tau\>,u|)>*x*<around|(|u,\<omega\>|)>*m*<around|(|d*u|)><label|eq:dY-dm-g>
    </equation>

    has <math|r<rsub|Y>> of finite variation on the entire plane
    <math|\<bbb-R\><rsup|2>>. For all <math|S<rsub|1>,S<rsub|2>\<in\><with|math-font|cal*|B><rsup|1>>

    <with|font-base-size|8|<\equation>
      r<rsub|Y>*<around|(|S<rsub|1>\<times\>S<rsub|2>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|S<rsub|1>><big|int><rsub|S<rsub|2>>g<around|(|\<tau\>,u|)>*g<rsup|\<ast\>><around|(|\<sigma\>,v|)>*R<rsub|x*x><around|(|u,v|)>*m*<around|(|d*\<tau\>|)>*m*<around|(|d*\<sigma\>|)>*m*<around|(|d*u|)>*m*<around|(|d*v|)><label|eq:rY-g>
    </equation>>

    It is clear from <eqref|eq:y-output>, <eqref|eq:h-g-transform>,
    <eqref|eq:dY-dm-g> and Lemma <reference|lem:radon-nikodym> that

    <\equation>
      <label|eq:y-harmonize><tabular|<tformat|<table|<row|<cell|y*<around|(|t,\<omega\>|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<tau\>><around*|[|<frac|d*Y|d*m>|]><around|(|\<tau\>,\<omega\>|)>*m*<around|(|d*\<tau\>|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<tau\>>*Y<around|(|d*\<tau\>,\<omega\>|)>>>>>>
    </equation>

    in the stochastic mean sense and hence <math|y> is harmonizable.
  </proof>

  A sufficient condition for <eqref|eq:g-condition> to be satisfied for the
  class of input processes with uniformly bounded autocorrelation functions
  is clearly

  <\equation>
    g<around|(|s,\<tau\>|)>\<in\>L<rsub|1>*<around|(|m\<times\>m|)><label|eq:g-L1>
  </equation>

  <\example>
    Let

    <\equation>
      h*<around|(|t,\<tau\>|)>=<frac|\<alpha\>+\<gamma\><around|\||\<tau\>|\|>|t<rsup|2>+<around|(|\<alpha\>+\<gamma\><around|\||\<tau\>|\|>|)><rsup|2>>*e<rsup|-\<beta\><around|\||\<tau\>|\|>>*<space|1em>\<alpha\>,\<beta\>\<gtr\>0,<space|1em>\<gamma\>\<geqslant\>0<label|eq:h-example>
    </equation>

    Then <math|h*<around|(|t,\<tau\>|)>> is the Fourier transform of
    <math|g<around|(|s,\<tau\>|)>> :

    <\equation>
      g<around|(|s,\<tau\>|)>=<sqrt|<frac|\<pi\>|2>>*e<rsup|-\<alpha\>\|s*<around|\||-\<beta\>|\|>*\<tau\>\|-\<gamma\>*<around|\||s*\<tau\>|\|>><label|eq:g-example>
    </equation>

    and <math|g> satisfies <eqref|eq:g-L1>. The condition
    <eqref|eq:g-condition> can be written in the form

    <\equation>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-\<beta\><around|\||u|\|>>|\<alpha\>+\<gamma\><around|\||u|\|>>\<cdot\><frac|e<rsup|-\<beta\><around|\||v|\|>>|\<alpha\>+\<gamma\><around|\||v|\|>><around|\||R<rsub|x*x><around|(|u,v|)>|\|>*m*<around|(|d*u|)>*m*<around|(|d*v|)>\<less\>\<infty\><label|eq:g-condition-example>
    </equation>

    and the output of the system with impulse response
    <math|h*<around|(|t,\<tau\>|)>> to all input processes which satisfy this
    condition is a harmonizable stochastic process. In particular, if
    <math|x> is harmonizable with

    <\equation>
      x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*X<around|(|d*\<lambda\>,\<omega\>|)><label|eq:x-harmonize-example>
    </equation>

    then it follows by <eqref|eq:dY-dm-g> that

    <\equation>
      <around*|[|<frac|d*Y|d*m>|]><around|(|\<tau\>,\<omega\>|)>=<around|(|\<beta\>+\<gamma\><around|\||\<tau\>|\|>|)>*e<rsup|-\<alpha\><around|\||\<tau\>|\|>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|X<around|(|d*\<lambda\>,\<omega\>|)>|\<lambda\><rsup|2>+<around|(|\<beta\>+\<gamma\><around|\||\<tau\>|\|>|)><rsup|2>><label|eq:dY-dm-example>
    </equation>

    and the output <math|y> has the harmonizable representation
    <eqref|eq:y-harmonize> which can also be written in the form

    <\equation>
      y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|\<beta\>+\<gamma\><around|\||\<tau\>|\|>|\<lambda\><rsup|2>+<around|(|\<beta\>+\<gamma\><around|\||\<tau\>|\|>|)><rsup|2>>*e<rsup|-\<alpha\>\|\<tau\>\|+i*t*\<tau\>>*m*<around|(|d*\<tau\>|)>|]>*X<around|(|d*\<lambda\>,\<omega\>|)><label|eq:y-full-example>
    </equation>

    This representation takes the following simple form in the particular
    case where <math|\<gamma\>=0>, i.e.,\ 

    <\equation>
      h*<around|(|t,\<tau\>|)>=<frac|\<alpha\>*e<rsup|-\<beta\><around|\||\<tau\>|\|>>|\<alpha\><rsup|2>+t<rsup|2>>
    </equation>

    <\equation>
      y*<around|(|t,\<omega\>|)>=<frac|2*\<beta\>|\<alpha\><rsup|2>+t<rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|X<around|(|d*\<lambda\>,\<omega\>|)>|\<beta\><rsup|2>+\<lambda\><rsup|2>><label|eq:y-simple-example>
    </equation>
  </example>

  <subsection|Linear Randomly Time Varying
  Systems><label|subsec:random-systems>

  Let the impulse response of a linear time varying system be a sample
  function of a stochastic process of second order
  <math|h*<around|(|t,\<tau\>,\<omega\>|)>> with autocorrelation function
  <math|R<rsub|h*h><around|(|t,s;\<tau\>,\<sigma\>|)>>. For all second-order
  input processes <math|x*<around|(|t,\<omega\>|)>> independent of <math|h>
  and such that

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>R<rsub|h*h><around|(|t,t;u,v|)>*R<rsub|x*x><around|(|u,v|)>*m*<around|(|d*u|)>*m*<around|(|d*v|)>\<less\>\<infty\>*<space|1em><text|for
    all ><space|1em>t\<in\>\<bbb-R\><label|eq:Rhh-condition>
  </equation>

  the output of the system is the second-order stochastic process <math|y>
  defined by

  <\equation>
    y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t,u,\<omega\>|)>*x*<around|(|u,\<omega\>|)>*m*<around|(|d*u|)><label|eq:y-random>
  </equation>

  A sufficient condition for <eqref|eq:Rhh-condition> to hold for all input
  processes <math|x> with uniformly bounded autocorrelation functions is
  clearly <math|R<rsub|h*h><around|(|t,t;\<cdot\>,\<cdot\>|)>\<in\>L<rsub|1>*<around|(|m\<times\>m|)>>
  for all <math|t\<in\>\<bbb-R\>>.

  A set of sufficient conditions for the harmonizability of the output of a
  linear randomly time varying system is given in the following theorem. Its
  proof is similar to the proof of Theorem
  <reference|thm:linear-system-harmonizable> and as such it is omitted.

  <\theorem>
    <label|thm:random-system-harmonizable>If the impulse response
    <math|h*<around|(|t,u,\<omega\>|)>> of a linear randomly time varying
    system is the Fourier transform in the stochastic mean sense of a
    second-order stochastic process <math|H*<around|(|\<rho\>,u,\<omega\>|)>>,
    i.e.,

    <\equation>
      h*<around|(|t,u,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>H*<around|(|\<rho\>,u,\<omega\>|)>*e<rsup|i*t*\<rho\>>*m*<around|(|d*\<rho\>|)><label|eq:h-H-transform>
    </equation>

    which is such that <math|R<rsub|H*H><around|(|\<cdummy\>,\<cdummy\>;u,u|)>\<in\>L<rsub|1>*<around|(|m\<times\>m|)>>
    \<forall\><math|u\<in\>\<bbb-R\>> and

    <\equation>
      <with|font-base-size|9|<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||R<rsub|H*H><around|(|\<tau\>,\<sigma\>;u,v|)><around|\|||\|>*R<rsub|x*x><around|(|u,v|)>|\|>*m*<around|(|d*\<tau\>|)>*m*<around|(|d*\<sigma\>|)>*m*<around|(|d*u|)>*m*<around|(|d*v|)>\<less\>\<infty\><label|eq:RHH-condition>>
    </equation>

    and if the input <math|x> is independent of <math|h>, then the output
    stochastic process <math|y*<around|(|t,\<omega\>|)>> is harmonizable.
  </theorem>

  We have

  <\equation>
    y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<rho\>>*Y<around|(|d*\<rho\>,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<rho\>><around*|[|<frac|d*Y|d*m>|]><around|(|\<rho\>,\<omega\>|)>*m*<around|(|d*\<rho\>|)>,<label|eq:y-harmonize-random>
  </equation>

  where

  <\equation>
    <around*|[|<frac|d*Y|d*m>|]><around|(|\<rho\>,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>H*<around|(|\<rho\>,u,\<omega\>|)>*x*<around|(|u,\<omega\>|)>*m*<around|(|d*u|)><label|eq:dY-dm-H>
  </equation>

  A sufficient condition for <eqref|eq:RHH-condition> to hold for all input
  processes <math|x> with uniformly bounded autocorrelation functions is
  clearly <math|R<rsub|H*H>\<in\>L<rsub|1><around|(|m<rsup|4>|)>>.

  <\thebibliography|99>
    <bibitem|campbell1969>Campbell, L. L. (1969), Series expansions for
    random processes, in \PProceedings of the International Symposium on
    Probability and Information Theory,\Q Lecture Notes in Mathematics, No.
    89, pp. 77-95, Springer, New York.

    <bibitem|cramer1951>Cramer, H. (1951), A contribution to the theory of
    stochastic processes, 2nd Berkeley Symp. Math. Stat. Probability,
    329-339.

    <bibitem|cramer1964>Cramer, H. (1964), Stochastic processes as curves in
    Hilbert space, Theor. Probability Appl. 9, 169-179.

    <bibitem|doob1953>Doob, J. L. (1953), \PStochastic Processes,\Q Wiley,
    New York.

    <bibitem|karhunen1947>Karhunen, K. (1947), Uber lineare Methoden in der
    Wahrscheinlichkeitsrechnung, Ann. Acad. Sci. Fenn. Ser. Al No. 37, 1-79.

    <bibitem|loeve1963>Loève, M. (1963), \PProbability Theory,\Q Van
    Nostrand, Princeton, N. J.

    <bibitem|masani1968>Masani, P. (1968), Orthogonally scattered measures,
    Advan. Math. 2, 61-117.

    <bibitem|masry1968>Masry, E., Liu, B., And Steiglitz, K. (1968), Series
    expansion of wide-sense stationary random processes, IEEE Trans. IT-14,
    792-796.

    <bibitem|parzen1967>Parzen, E. (1967), Statistical inference on time
    series by Hilbert space methods, in \PTime series Analysis Papers,\Q
    Holden-Day, San Francisco, Calif.

    <bibitem|piranashvili1967>Piranashyili, Z. A. (1967), On the problem of
    interpolation of random processes, Theor. Probability Appl. 12, 647-657.

    <bibitem|rao1967>Rao, M. M. (1967), Inference in stochastic
    processes-III, Z. Wahrscheinlichkeitstheorie und verw. Gebiete 8, 49-72.

    <bibitem|rosanov1959>Rosanov, Y. A. (1959), Spectral analysis of abstract
    functions, Theor. Probability Appl. 4, 271-287.
  </thebibliography>

  \;
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
    <associate|auto-10|<tuple|8.1|15>>
    <associate|auto-11|<tuple|8.2|17>>
    <associate|auto-12|<tuple|111|18>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|3>>
    <associate|auto-5|<tuple|5|6>>
    <associate|auto-6|<tuple|39|8>>
    <associate|auto-7|<tuple|6|9>>
    <associate|auto-8|<tuple|7|11>>
    <associate|auto-9|<tuple|8|14>>
    <associate|bib-campbell1969|<tuple|campbell1969|18>>
    <associate|bib-cramer1951|<tuple|cramer1951|18>>
    <associate|bib-cramer1964|<tuple|cramer1964|18>>
    <associate|bib-doob1953|<tuple|doob1953|18>>
    <associate|bib-karhunen1947|<tuple|karhunen1947|18>>
    <associate|bib-loeve1963|<tuple|loeve1963|18>>
    <associate|bib-masani1968|<tuple|masani1968|18>>
    <associate|bib-masry1968|<tuple|masry1968|18>>
    <associate|bib-parzen1967|<tuple|parzen1967|18>>
    <associate|bib-piranashvili1967|<tuple|piranashvili1967|19>>
    <associate|bib-rao1967|<tuple|rao1967|19>>
    <associate|bib-rosanov1959|<tuple|rosanov1959|19>>
    <associate|eq:E-eta-xi|<tuple|84|14>>
    <associate|eq:E-terms|<tuple|81|14>>
    <associate|eq:E-y-xi|<tuple|83|14>>
    <associate|eq:F|<tuple|32|7>>
    <associate|eq:F-L2|<tuple|35|7>>
    <associate|eq:F-Lambda|<tuple|67|12>>
    <associate|eq:F-bound|<tuple|34|7>>
    <associate|eq:Fn|<tuple|25|6>>
    <associate|eq:Fn-bound|<tuple|26|6>>
    <associate|eq:Fn-cauchy|<tuple|44|9>>
    <associate|eq:Fn-complete|<tuple|31|7>>
    <associate|eq:Fn-custom|<tuple|46|9>>
    <associate|eq:Fn-double-exp|<tuple|42|8>>
    <associate|eq:Fn-exp|<tuple|38|8>>
    <associate|eq:Fn-norm|<tuple|27|7>>
    <associate|eq:Fn-normal|<tuple|40|8>>
    <associate|eq:Fn-uniform|<tuple|47|9>>
    <associate|eq:Fn-uniform-symm|<tuple|48|9>>
    <associate|eq:H|<tuple|39|8>>
    <associate|eq:IS|<tuple|53|10>>
    <associate|eq:QX|<tuple|2|2>>
    <associate|eq:RHH-condition|<tuple|109|18>>
    <associate|eq:Rhh-condition|<tuple|106|17>>
    <associate|eq:Rxx-bounded|<tuple|88|15>>
    <associate|eq:Rxx-harmonizable|<tuple|91|15>>
    <associate|eq:Rxx-stationary|<tuple|90|15>>
    <associate|eq:Ryy-finite|<tuple|72|13>>
    <associate|eq:Y|<tuple|19|5>>
    <associate|eq:Y-X|<tuple|63|11>>
    <associate|eq:Y-define|<tuple|68|12>>
    <associate|eq:Y-interchange|<tuple|69|12>>
    <associate|eq:Y-lemma|<tuple|73|13>>
    <associate|eq:Y-thm|<tuple|52|10>>
    <associate|eq:an|<tuple|11|3>>
    <associate|eq:an-expect|<tuple|14|4>>
    <associate|eq:an-finite|<tuple|59|11>>
    <associate|eq:an-hn|<tuple|23|5>>
    <associate|eq:an-inner|<tuple|15|4>>
    <associate|eq:autocorr|<tuple|8|3>>
    <associate|eq:autocorr-series|<tuple|16|4>>
    <associate|eq:bn|<tuple|54|10>>
    <associate|eq:dY-dm|<tuple|70|12>>
    <associate|eq:dY-dm-H|<tuple|111|18>>
    <associate|eq:dY-dm-example|<tuple|102|17>>
    <associate|eq:dY-dm-g|<tuple|94|16>>
    <associate|eq:expf|<tuple|17|4>>
    <associate|eq:f-fourier|<tuple|65|12>>
    <associate|eq:f-integral|<tuple|51|10>>
    <associate|eq:fnFourier|<tuple|21|5>>
    <associate|eq:g-L1|<tuple|97|16>>
    <associate|eq:g-condition|<tuple|92|15>>
    <associate|eq:g-condition-example|<tuple|100|16>>
    <associate|eq:g-example|<tuple|99|16>>
    <associate|eq:g-interchange|<tuple|74|13>>
    <associate|eq:h-H-transform|<tuple|108|18>>
    <associate|eq:h-L1|<tuple|89|15>>
    <associate|eq:h-custom|<tuple|45|9>>
    <associate|eq:h-example|<tuple|98|16>>
    <associate|eq:h-g-transform|<tuple|93|15>>
    <associate|eq:impulse-finite|<tuple|86|15>>
    <associate|eq:integral-proof|<tuple|62|11>>
    <associate|eq:integral-rep|<tuple|49|9>>
    <associate|eq:integral-rep-thm|<tuple|50|10>>
    <associate|eq:lambda|<tuple|82|14>>
    <associate|eq:lambda2|<tuple|3|2>>
    <associate|eq:lambda2-ident|<tuple|4|2>>
    <associate|eq:lambda2-inner|<tuple|5|2>>
    <associate|eq:moving-avg|<tuple|64|11>>
    <associate|eq:mu-finite|<tuple|57|10>>
    <associate|eq:phin|<tuple|36|8>>
    <associate|eq:proc-integral|<tuple|7|2>>
    <associate|eq:rX|<tuple|1|1>>
    <associate|eq:rY|<tuple|58|10>>
    <associate|eq:rY-g|<tuple|95|16>>
    <associate|eq:series|<tuple|9|3>>
    <associate|eq:series-again|<tuple|13|4>>
    <associate|eq:span|<tuple|24|6>>
    <associate|eq:sum-finite|<tuple|56|10>>
    <associate|eq:x-conv|<tuple|85|14>>
    <associate|eq:x-harmonize|<tuple|71|13>>
    <associate|eq:x-harmonize-example|<tuple|101|17>>
    <associate|eq:x-interchange|<tuple|66|12>>
    <associate|eq:xi|<tuple|6|2>>
    <associate|eq:xi-eta|<tuple|75|13>>
    <associate|eq:xi-eta-equal|<tuple|76|13>>
    <associate|eq:xin|<tuple|10|3>>
    <associate|eq:xin-again|<tuple|12|4>>
    <associate|eq:y|<tuple|18|5>>
    <associate|eq:y-full-example|<tuple|103|17>>
    <associate|eq:y-harmonize|<tuple|96|16>>
    <associate|eq:y-harmonize-random|<tuple|110|18>>
    <associate|eq:y-output|<tuple|87|15>>
    <associate|eq:y-random|<tuple|107|17>>
    <associate|eq:y-simple-example|<tuple|105|17>>
    <associate|eq:yY|<tuple|20|5>>
    <associate|eq:yn|<tuple|22|5>>
    <associate|lem:radon-nikodym|<tuple|5|13>>
    <associate|sec:intro|<tuple|1|1>>
    <associate|sec:linear-systems|<tuple|8|14>>
    <associate|sec:moving-avg|<tuple|7|11>>
    <associate|sec:notation|<tuple|2|1>>
    <associate|sec:orthogonal-integral|<tuple|6|9>>
    <associate|sec:orthogonal-series|<tuple|4|3>>
    <associate|sec:orthonormal-sets|<tuple|5|6>>
    <associate|sec:representation|<tuple|3|2>>
    <associate|subsec:deterministic|<tuple|8.1|15>>
    <associate|subsec:random-systems|<tuple|8.2|17>>
    <associate|thm:complete-set|<tuple|2|6>>
    <associate|thm:integral-rep|<tuple|3|10>>
    <associate|thm:linear-system-harmonizable|<tuple|6|15>>
    <associate|thm:moving-avg-harmonizable|<tuple|4|12>>
    <associate|thm:random-system-harmonizable|<tuple|8|18>>
    <associate|thm:series-rep|<tuple|1|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      loeve1963

      rosanov1959

      cramer1964

      piranashvili1967

      rao1967

      karhunen1947

      cramer1951

      rosanov1959

      parzen1967

      masani1968

      loeve1963

      loeve1963

      cramer1951

      parzen1967

      rosanov1959

      masry1968

      campbell1969

      masry1968

      masry1968

      masry1968

      karhunen1947

      doob1953

      rosanov1959
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Notation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Representation
      of Harmonizable Stochastic Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Orthogonal
      Series Representation of a Harmonizable Stochastic Process>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Orthonormal
      and Complete Sets in <with|mode|<quote|math>|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|Examples
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Orthogonal
      Integral Representation of a Harmonizable Stochastic Process>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Moving
      Average Representations and Harmonizable Stochastic Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Linear
      Time Varying Systems and Harmonizable Stochastic Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|8.1<space|2spc>Deterministic Linear Time
      Varying Systems <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|8.2<space|2spc>Linear Randomly Time Varying
      Systems <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>