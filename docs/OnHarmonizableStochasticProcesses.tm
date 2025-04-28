<TeXmacs|2.1.4>

<style|generic>

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

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1.
    Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2. Notation>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3.
    Representation of Harmonizable Stochastic Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Orthogonal
    Series Representation of a Harmonizable Stochastic Process>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Orthonormal and
    Complete Sets in <with|mode|math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Orthogonal
    Integral Representation of a Harmonizable Stochastic Process>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4. Moving
    Average Representations and Harmonizable Stochastic Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5. Linear Time
    Varying Systems and Harmonizable Stochastic Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Deterministic
    Linear Time Varying Systems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Linear Randomly
    Time Varying Systems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12><vspace|0.5fn>
  </table-of-contents>

  <section*|1. Introduction>

  Harmonizable stochastic processes, a generalization of wide sense
  stationary processes, have been investigated in connection with a variety
  of subjects. Properties related to their integral representation have been
  studied by Loève <cite|loeve1963> and Rosanov <cite|rosanov1959>, their
  special role in the multiplicity theory of purely nondeterministic
  stochastic processes has been demonstrated by Cramer <cite|cramer1964>, and
  sampling theorems have been derived by Piranashvili <cite|piranashvili1967>
  and Rao <cite|rao1967>.

  This paper makes two contributions related to the class of harmonizable
  stochastic processes. First it is proved under some general conditions that
  the output of a linear system is a harmonizable stochastic process; the
  system may be randomly time-varying and the input process need not be
  stationary nor even harmonizable. Thus harmonizable processes are the most
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

  <section*|2. Notation>

  Some definitions and basic properties are briefly mentioned here. For a
  more detailed discussion the reader is referred to Karhunen
  <cite|karhunen1947>, Cramer <cite|cramer1951>, Rosanov <cite|rosanov1959>,
  Parzen <cite|parzen1967>, and Masani <cite|masani1968>.

  Consider a probability space <math|<around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>>
  and the Hilbert space <math|L<rsub|2><around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>>
  of all complex valued random variables with finite mean square value. A
  random measure <math|X> on a class of subsets
  <math|<with|math-font|cal*|N>> of a set <math|E> is a countably additive
  function on <math|<with|math-font|cal*|N>> to
  <math|L<rsub|2><around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>>, i.e.,
  <math|X<around|(|S,\<omega\>|)>=<big|sum><rsub|n=1><rsup|\<infty\>>X<around*|(|S<rsub|n>,\<omega\>|)>>
  in the mean square sense whenever the disjoint sets
  <math|S<rsub|n>,n=1,2,\<ldots\>>, are in <math|<with|math-font|cal*|N>> and
  <math|S=<big|cup><rsub|n=1><rsup|\<infty\>>S<rsub|n>\<in\><with|math-font|cal*|N>>.
  To each <math|X> on <math|<with|math-font|cal*|N>> there corresponds a
  complex measure <math|r<rsub|X>> defined on
  <math|<with|math-font|cal*|N>\<times\><with|math-font|cal*|N>> by
  <math|r<rsub|X>*<around*|(|S<rsub|1>\<times\>S<rsub|2>|)>=<with|math-font|cal*|E><around*|[|X<around*|(|S<rsub|1>,\<omega\>|)>*X<rsup|\<ast\>><around*|(|S<rsub|2>,\<omega\>|)>|]>>,
  where <math|<with|math-font|cal*|E>> is the expectation operator and the
  star denotes complex conjugate. <math|r<rsub|X>> is nonnegative definite on
  <math|<with|math-font|cal*|N>\<times\><with|math-font|cal*|N>>. <math|X> is
  orthogonal if and only if <math|r<rsub|X>*<around*|(|S<rsub|1>\<times\>S<rsub|2>|)>=0>,
  whenever <math|S<rsub|1>> and <math|S<rsub|2>> are disjoint. To each
  orthogonal <math|X> on <math|<with|math-font|cal*|N>> there corresponds a
  nonnegative measure <math|Q<rsub|X>> defined on
  <math|<with|math-font|cal*|N>> by <math|Q<rsub|X><around|(|S|)>=<with|math-font|cal*|E><around|\||X<around|(|S,\<omega\>|)>|\|><rsup|2>>.
  Usually <math|X> is initially defined on a semiring of subsets
  <math|<with|math-font|cal*|N>>. If <math|r<rsub|X>> is of bounded variation
  over <math|<with|math-font|cal*|N>\<times\><with|math-font|cal*|N>> then
  <math|X> can be extended to the restricted <math|\<sigma\>>-ring
  <math|<with|math-font|cal*|B><rsub|0>=<around*|{|S\<in\>\<sigma\><around|(|<with|math-font|cal*|N>|)>=<with|math-font|cal*|B>;<around*|\||r<rsub|X>|\|>*<around|(|S\<times\>S|)>\<less\>\<infty\>|}>>.
  We then say that <math|X> is a random measure on
  <math|<around|(|E,<with|math-font|cal*|B>|)>>.

  Let <math|L<rsub|2><around|(|X|)>=\<sigma\><around*|{|X<around|(|S,\<omega\>|)>;S\<in\><with|math-font|cal*|B><rsub|0>|}>>
  denote the span of <math|X> in <math|L<rsub|2><around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>>
  and let <math|\<Lambda\><rsub|2><around*|(|r<rsub|X>|)>> be the set of all
  complex valued, <math|<with|math-font|cal*|B>>-measurable functions
  <math|f> on <math|E> such that <math|<big|int><rsub|E\<times\>E>f<around|(|t|)>*f<rsup|\<ast\>><around|(|s|)>*r<rsub|X><around|(|d*t,d*s|)>>
  is finite. Then, upon considering two functions <math|f> and <math|g> in
  <math|\<Lambda\><rsub|2><around*|(|r<rsub|x>|)>> as identical if and only
  if

  <\equation*>
    <big|int><rsub|E\<times\>E><around|[|f<around|(|t|)>-g<around|(|t|)>|]>*<around*|[|f<rsup|\<ast\>><around|(|s|)>-g<rsup|\<ast\>><around|(|s|)>|]>*r<rsub|X><around|(|d*t,d*s|)>=0,
  </equation*>

  <math|\<Lambda\><rsub|2><around*|(|r<rsub|X>|)>> becomes a Hilbert space
  with inner product

  <\equation*>
    <around|(|f,g|)><rsub|A<rsub|2><around*|(|r<rsub|X>|)>>=<big|int><rsub|E\<times\>E>f<around|(|t|)>*g<rsup|\<ast\>><around|(|s|)>*r<rsub|X><around|(|d*t,d*s|)>
  </equation*>

  and <math|\<Lambda\><rsub|2><around*|(|r<rsub|X>|)>=\<sigma\><around*|{|I<rsub|S><around|(|t|)>;S\<in\><with|math-font|cal*|B><rsub|0>|}>>,
  where <math|I> is the indicator function. <math|L<rsub|2><around|(|X|)>>
  and <math|\<Lambda\><rsub|2><around*|(|r<rsub|X>|)>> are isomorphic with
  corresponding elements <math|X<around|(|S,\<omega\>|)>> and
  <math|I<rsub|S><around|(|t|)>>, <math|S\<in\><with|math-font|cal*|B><rsub|0>>,
  and integration of functions in <math|A<rsub|2><around*|(|r<rsub|X>|)>>
  with respect to <math|X> is defined by <math|\<xi\><around|(|\<omega\>|)>=<big|int><rsub|E>f<around|(|t|)>*X<around|(|d*t,\<omega\>|)>>,
  where <math|\<xi\>> and <math|f> are corresponding elements under the
  isomorphism.

  <section*|3. Representation of Harmonizable Stochastic Processes>

  Harmonizable stochastic processes have been introduced by Loève
  <cite|loeve1963> as a first step generalization of wide sense stationary
  mean square continuous stochastic processes. A second-order stochastic
  process <math|<around|{|x*<around|(|t,\<omega\>|)>,t\<in\>R<rsup|1>,\<omega\>\<in\>\<Omega\>|}>>
  is harmonizable if and only if it has the integral representation

  <\equation*>
    x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*X<around|(|d*u,\<omega\>|)>*<space|1em><text|for
    all ><space|1em>t\<in\>R<rsup|1>
  </equation*>

  where <math|X> is a random measure defined for all Borel sets
  <math|<with|math-font|cal*|B><rsup|1>> of the real line <math|R<rsup|1>>.

  It is shown by Loève <cite|loeve1963> and Cramèr <cite|cramer1951> that a
  second-order stochastic process <math|x*<around|(|t,\<omega\>|)>> is
  harmonizable if and only if its autocorrelation function
  <math|R<rsub|x*x><around|(|t,s|)>> has the integral representation

  <\equation*>
    R<rsub|x*x><around|(|t,s|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsup|\<infty\>>e<rsup|i*<around|(|t*u-s*v|)>>*r<rsub|X><around|(|d*u,d*v|)>*<space|1em><text|for
    all ><space|1em>t,s\<in\>R<rsup|1>
  </equation*>

  where <math|r<rsub|X>> is a measure of bounded variation on the whole plane
  <math|R<rsup|2>> and nonnegative definite on
  <math|<with|math-font|cal*|B><rsup|1>\<times\><with|math-font|cal*|B><rsup|1>>.
  <math|r<rsub|X>> can be regarded as the two-dimensional spectral measure of
  the harmonizable process <math|x*<around|(|t,\<omega\>|)>>, with
  two-dimensional spectral distribution <math|\<rho\><rsub|x*x><around|(|u,v|)>=r<rsub|X>*<around|(|<around|(|-\<infty\>,u|]>\<times\><around|(|-\<infty\>,v|]>|)>>.

  It is clear that a mean square continuous wide sense stationary stochastic
  process is harmonizable, with <math|X> an orthogonal random measure and
  <math|r<rsub|X>> a nonnegative measure concentrated on the diagonal of the
  plane.

  The functions <math|<around|{|e<rsup|i*t*u>,t\<in\>R<rsup|1>|}>> span the
  whole <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> space and this
  implies that <math|L<rsub|2><around|(|x|)>=L<rsub|2><around|(|X|)>>, where
  <math|L<rsub|2><around|(|x|)>=\<sigma\><around|{|x*<around|(|t,\<omega\>|)>,t\<in\>R<rsup|<with|math-font-family|bf|1>>|}>>
  denotes the span of <math|x> in <math|L<rsub|2><around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>>.

  <section*|Orthogonal Series Representation of a Harmonizable Stochastic
  Process>

  An orthogonal series representation for harmonizable stochastic processes
  is provided by the following:

  <\theorem>
    A harmonizable stochastic process <math|<around|{|x*<around|(|t,\<omega\>|)>,t\<in\>R<rsup|1>,\<omega\>\<in\>\<Omega\>|}>>
    is uniformly mean square continuous and has an orthogonal series
    expansion

    <\equation*>
      x*<around|(|t,\<omega\>|)>=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*\<xi\><rsub|n><around|(|\<omega\>|)>
    </equation*>

    in the mean square sense for all <math|t\<in\>R<rsup|1>>, where

    <\equation*>
      \<xi\><rsub|n><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsub|n><around|(|u|)>*X<around|(|d*u,\<omega\>|)>,<space|1em><with|math-font|cal*|E><around|[|\<xi\><rsub|n>*\<xi\><rsub|m><rsup|\<ast\>>|]>=\<delta\><rsub|n*m>
    </equation*>

    and

    <\equation*>
      a<rsub|n><around|(|t|)>=<iint><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*f<rsub|n><rsup|\<ast\>><around|(|v|)>*r<rsub|X><around|(|d*u,d*v|)>
    </equation*>

    and <math|<around|{|f<rsub|n>|(>\<cdot\><around|)||}>> is an orthonormal
    and complete set of functions in <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>.
  </theorem>

  <\proof>
    The autocorrelation function <math|R<rsub|x*x><around|(|t,s|)>> of
    <math|x*<around|(|t,\<omega\>|)>> is given by (2). Since
    <math|e<rsup|i*<around|(|t*u-s*v|)>>> is continuous in <math|t,s>
    uniformly in <math|u,v> and is bounded by 1, which is integrable with
    respect to <math|r<rsub|X>>, it follows by the bounded convergence
    theorem that <math|R<rsub|x*x><around|(|t,s|)>> is uniformly continuous
    in <math|t,s>. Hence <math|x*<around|(|t,\<omega\>|)>> is uniformly mean
    square continuous.

    Since <math|x*<around|(|t,\<omega\>|)>> is mean square continuous,
    <math|L<rsub|2><around|(|x|)>> is separable, as shown by Parzen
    <cite|parzen1967> in Theorem 2C. Hence
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

    <\equation*>
      \<xi\><rsub|n><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<rsub|n><around|(|u|)>*X<around|(|d*u,\<omega\>|)>
    </equation*>

    Hence, for all <math|t\<in\>R<rsup|1>>, we have

    <\equation*>
      x*<around|(|t,\<omega\>|)>=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*\<xi\><rsub|n><around|(|\<omega\>|)>
    </equation*>

    in the mean square sense and

    <\equation*>
      a<rsub|n><around|(|t|)>=<with|math-font|cal*|E><around|[|x<around|(|t|)>*\<xi\><rsub|n><rsup|\<ast\>>|]>
    </equation*>

    Since <math|x*<around|(|t,\<omega\>|)>> and <math|e<rsup|i*t*u>>, as well
    as <math|\<xi\><rsub|n><around|(|\<omega\>|)>> and
    <math|f<rsub|n><around|(|u|)>>, are corresponding elements of
    <math|L<rsub|2><around|(|X|)>> and <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
    under the isomorphism, we obtain

    <\equation*>
      a<rsub|n><around|(|t|)>=<around|(|e<rsup|i*t*u>,f<rsub|n><around|(|u|)>|)><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*f<rsub|n><rsup|\<ast\>><around|(|v|)>*r<rsub|X><around|(|d*u,d*v|)>
    </equation*>
  </proof>

  It follows from (3) and (4) that the autocorrelation function of a
  harmonizable stochastic process <math|x*<around|(|t,\<omega\>|)>> has a
  series expansion

  <\equation*>
    R<rsub|x*x><around|(|t,s|)>=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*a<rsub|n><rsup|\<ast\>><around|(|s|)>*<space|1em><text|for
    all ><space|1em>t,s\<in\>R<rsup|1>
  </equation*>

  where the <math|a<rsub|n>>'s are given by (5).

  For all <math|f\<in\>\<Lambda\><rsub|2><around|(|r<rsub|x>|)>> we have
  <math|e<rsup|i*t*u>*f<around|(|u|)>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
  for all <math|t\<in\>R<rsup|1>>, since

  <\equation*>
    <around|\||e<rsup|i*t*u>*f<around|(|u|)>|\|>\<leqslant\><around|\||f<around|(|u|)>|\|>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>
  </equation*>

  Hence

  <\equation*>
    y<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*f<around|(|u|)>*X<around|(|d*u,\<omega\>|)>
  </equation*>

  is well-defined in <math|L<rsub|2><around|(|X|)>=L<rsub|2><around|(|x|)>>
  and is thus a linear operation on <math|x*<around|(|t,\<omega\>|)>>.
  <math|y<around|(|t,\<omega\>|)>> is harmonizable itself, since if a random
  measure <math|Y> is defined by <math|Y<around|(|S,\<omega\>|)>=<big|int><rsub|S>f<around|(|u|)>*X<around|(|d*u,\<omega\>|)>>
  for all <math|S\<in\><with|math-font|cal*|B><rsup|1>>, then <math|Y> is
  finite on <math|R<rsup|1>> and

  <\equation*>
    y<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*Y<around|(|d*u,\<omega\>|)>
  </equation*>

  Let <math|y<rsub|n><around|(|t,\<omega\>|)>> be the linear operation on
  <math|x*<around|(|t,\<omega\>|)>> defined by (7) when
  <math|f<around|(|u|)>=f<rsub|n><around|(|u|)>>

  Let <math|y<rsub|n>*<around|(|t,\<omega\>|)>> be the linear operation on
  <math|x*<around|(|t,\<omega\>|)>> defined by (7) when
  <math|f<around|(|u|)>=f<rsub|n><around|(|u|)>>. Then
  <math|\<xi\><rsub|n><around|(|\<omega\>|)>=y<rsub|n>*<around|(|0,\<omega\>|)>>.
  If <math|f<rsub|n>> has Fourier transform <math|h<rsub|n>>, i.e., if
  <math|f<rsub|n><around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|n><around|(|v|)>*e<rsup|-i*u*v>*m*<around|(|d*v|)>>,
  with <math|h<rsub|n>\<in\>L<rsub|1><around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>,m|)>>,
  then, as it is shown by Rosanov <cite|rosanov1959>, p. 278, the order of
  integration in (7) can be interchanged to give

  <\equation*>
    y<rsub|n>*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|n><around|(|v|)>*x*<around|(|t-v,\<omega\>|)>*m*<around|(|d*v|)>
  </equation*>

  Hence <math|\<xi\><rsub|n><around|(|\<omega\>|)>> may be regarded as the
  output at time <math|t=0> of a linear time invariant system with impulse
  response <math|h<rsub|n>> and input <math|x*<around|(|t,\<omega\>|)>>. We
  also obtain from (5)

  <\equation*>
    a<rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h<rsub|n><rsup|\<ast\>><around|(|\<tau\>|)>*R<rsub|x*x><around|(|t,-\<tau\>|)>*m*<around|(|d*\<tau\>|)>
  </equation*>

  It should be noted that the series representation of Theorem 1 is by no
  means unique, since for each orthonormal and complete set of functions in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> a distinct representation
  (3) is obtained by (4) and (5). However, in the context of a particular
  problem, one may be able to determine those representations, if any, which
  have some optimal properties. The significance of the representation is
  primarily in the fact that it exists and it is orthogonal, which enables
  one to use it as a model for the harmonizable process in problems involving
  mean square error criteria.

  Theorem 1 has been proven for mean square continuous, wide sense stationary
  stochastic processes by Masry et. al. <cite|masry1968> and also by Campbell
  <cite|campbell1969>.

  The orthogonal series expansion (3) has been shown in Theorem 1 to hold for
  all harmonizable stochastic processes. Some nonorthogonal series expansions
  have been reported in the literature for particular cases of harmonizable
  processes. It is shown by Piranashvili <cite|piranashvili1967> that if the
  support of <math|X>, or of <math|r<rsub|X>>, is bounded then
  <math|x*<around|(|t,\<omega\>|)>> admits a usual periodic sampling
  expansion; and that if the support of <math|X>, or of <math|r<rsub|X>>, is
  not bounded then <math|x*<around|(|t,\<omega\>|)>> can be approximated
  within <math|\<epsilon\>> in the mean square sense by a finite usual
  periodic sampling expansion, where both the number of terms and the
  sampling rate of the expansion depend on <math|\<epsilon\>>. Rao
  <cite|rao1967> gave a necessary and sufficient condition for
  <math|L<rsub|2><around|(|x|)>=\<sigma\><around|{|x*<around|(|n*T,\<omega\>|)>,n=0,\<pm\>1,\<pm\>2,\<ldots\>|}>>,
  i.e., for a periodic sampling expansion to approximate
  <math|x*<around|(|t,\<omega\>|)>> arbitrarily closely in the mean square
  sense and also a sufficient condition for
  <math|L<rsub|2><around|(|x|)>=\<sigma\><around|{|x*<around|(|t<rsub|n>,\<omega\>|)>,n=0,\<pm\>1,\<pm\>2,\<ldots\>|}>>
  where <math|<around|{|t<rsub|n>|}>> is a bounded set with infinitely many
  distinct points, i.e., for a bounded nonperiodic sampling expansion to
  approximate <math|x*<around|(|t,\<omega\>|)>> arbitrarily closely in the
  mean square sense.

  <section*|Orthonormal and Complete Sets in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>>

  It is clear from Theorem 1 that an explicit series expansion of a
  harmonizable process can be obtained by using (4) and (5) provided an
  orthonormal and complete set of functions in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> can be constructed.

  If the harmonizable process <math|x> is stationary then
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> is isomorphic to
  <math|L<rsub|2><around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>,Q<rsub|X>|)>>,
  where <math|Q<rsub|X>> is a finite nonnegative measure, and a general
  procedure to construct an orthonormal basis in the latter space is
  presented by Masry et. al. <cite|masry1968>.

  Since

  <\equation*>
    \<Lambda\><rsub|2><around|(|r<rsub|X>|)>=\<sigma\><around|{|e<rsup|i*t*u>,t<text|real
    >|}>=\<sigma\><around|{|e<rsup|i*t*u>,t<text|rational >|}>,
  </equation*>

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
    Let <math|\<mu\>> be any finite, nonnegative measure on
    <math|<around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>|)>>, absolutely
    continuous with respect to the Lebesgue measure <math|m> with
    Radon-Nikodym derivative <math|<around|[|d*\<mu\>/d*m|]><around|(|t|)>=h<around|(|t|)>\<neq\>0>
    a.e. <math|<around|[|m|]>>, and let <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>>
    be any complete set of functions in <math|L<rsub|2><around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>,\<mu\>|)>=L<rsub|2><around|(|\<mu\>|)>>.
    Then the set <math|<around|{|F<rsub|n><around|(|t|)>|}>> given by

    <\equation*>
      F<rsub|n><around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|n><rsup|\<ast\>><around|(|u|)>*e<rsup|i*t*u>*\<mu\>*<around|(|d*u|)>
    </equation*>

    is complete in <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>.
  </theorem>

  <\proof>
    Since <math|\<mu\>> is finite, <math|\<phi\><rsub|n>\<in\>L<rsub|2><around|(|\<mu\>|)>>
    implies <math|\<phi\><rsub|n>\<in\>L<rsub|1><around|(|\<mu\>|)>> and
    hence the functions <math|F<rsub|n><around|(|t|)>> are well-defined by
    (10) everywhere and

    <\equation*>
      <around|\||F<rsub|n><around|(|t|)>|\|>\<leqslant\><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<phi\><rsub|n><rsup|\<ast\>><around|(|u|)>|\|>*\<mu\>*<around|(|d*u|)>=<around|\<\|\|\>|\<phi\><rsub|n>|\<\|\|\>><rsub|L<rsub|1><around|(|\<mu\>|)>>
    </equation*>

    This implies that <math|F<rsub|n>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
    and

    <\equation*>
      <around|\<\|\|\>|F<rsub|n>|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2>\<leqslant\><around|\<\|\|\>|\<phi\><rsub|n>|\<\|\|\>><rsub|L<rsub|1><around|(|\<mu\>|)>><rsup|2><around|\||r<rsub|X>|\|><around|(|R<rsup|2>|)>,
    </equation*>

    where <math|<around|\||r<rsub|X>|\|>> denotes the total variation of
    <math|r<rsub|X>>.

    The completeness of the set <math|<around|{|F<rsub|n><around|(|t|)>|}>>
    in <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> is shown as follows.
    Let <math|f\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> and
    <math|<around|(|F<rsub|n>,f|)><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>=0>
    for all <math|n>. Then

    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|0>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>F<rsub|n><around|(|u|)>*f<rsup|\<ast\>><around|(|v|)>*r<rsub|X><around|(|d*u,d*v|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<phi\><rsub|n><rsup|\<ast\>><around|(|t|)>*e<rsup|i*t*u>*f<rsup|\<ast\>><around|(|v|)>*\<mu\>*<around|(|d*t|)>*r<rsub|X><around|(|d*u,d*v|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>F<around|(|t|)>*\<phi\><rsub|n><rsup|\<ast\>><around|(|t|)>*\<mu\>*<around|(|d*t|)>>>>>
      </aligned>
    </equation*>

    where

    <\equation*>
      F<around|(|t|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*u>*f<rsup|\<ast\>><around|(|v|)>*r<rsub|X><around|(|d*u,d*v|)>=<around|(|e<rsup|i*t*u>,f<around|(|u|)>|)><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
    </equation*>

    It follows by (12) that

    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|<around|\||F<around|(|t|)>|\|><rsup|2>>|<cell|\<leqslant\><around|\<\|\|\>|e<rsup|i*t*u>|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2><around|\<\|\|\>|f|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2>=R<rsub|x*x><around|(|t,t|)><around|\<\|\|\>|f|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2>>>|<row|<cell|>|<cell|\<leqslant\><around|\||r<rsub|X>|\|><around|(|R<rsup|2>|)><around|\<\|\|\>|f|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2>>>>>
      </aligned>
    </equation*>

    and

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||F<around|(|t|)>|\|><rsup|2>*\<mu\>*<around|(|d*t|)>\<leqslant\><around|\||r<rsub|X>|\|><around|(|R<rsup|2>|)><around|\<\|\|\>|f|\<\|\|\>><rsub|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>><rsup|2>*\<mu\><around|(|R<rsup|1>|)>\<less\>\<infty\>
    </equation*>

    i.e., <math|F\<in\>L<rsub|2><around|(|\<mu\>|)>>. The completeness of the
    set <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>> in
    <math|L<rsub|2><around|(|\<mu\>|)>> and (11) imply that <math|F=0> in
    <math|L<rsub|2><around|(|\<mu\>|)>>, i.e.,
    <math|<around|\||F<around|(|t|)>|\|><rsup|2>*h<around|(|t|)>=0> a.e.
    <math|<around|[|m|]>>. Since <math|h<around|(|t|)>\<neq\>0> a.e. [m], it
    follows that <math|F<around|(|t|)>=0> a.e. [m]. But the continuity of
    <math|e<rsup|i*t*u>> in <math|t> and the bounded convergence theorem
    imply by (12) that <math|F<around|(|t|)>> is continuous in <math|t>.
    Hence <math|F<around|(|t|)>=0> for all <math|t\<in\>R<rsup|1>> and by
    (12) <math|f> is orthogonal to the set
    <math|<around|{|e<rsup|i*t*u>,t\<in\>R<rsup|1>|}>>, which is dense in
    <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>. It follows that
    <math|f=0> in <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>> and hence
    the set <math|<around|{|F<rsub|n><around|(|t|)>|}>> is complete in
    <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>.
  </proof>

  It should be pointed out that the set of functions
  <math|<around|{|F<rsub|n><around|(|t|)>|}>> given by (10), which is shown
  in Theorem 2 to be complete in any <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
  space with <math|r<rsub|X>> of bounded variation on the entire plane, is
  independent of the measure <math|r<rsub|X>> and is completely determined by
  <math|\<mu\>> and <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>>. It is
  clear, however, that the orthonormal and complete set of functions
  <math|<around|{|f<rsub|n><around|(|t|)>|}>> in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>, obtained by
  orthonormalizing the complete set <math|<around|{|F<rsub|n><around|(|t|)>|}>>,
  depends on the measure <math|r<rsub|X>>.

  Theorem 2 allows considerable freedom in the choice of the measure
  <math|\<mu\>> and complete freedom in the choice of the complete set of
  functions <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>> in
  <math|L<rsub|2><around|(|\<mu\>|)>>. As a complete set of functions in
  <math|L<rsub|2><around|(|\<mu\>|)>> one can choose the orthonormal and
  complete set <math|<around|{|\<phi\><rsub|n><around|(|t|)>|}>> given by
  Masry et. al. <cite|masry1968>:

  <\equation*>
    \<phi\><rsub|n><around|(|t|)>=<frac|1|<sqrt|\<mu\><around|(|R<rsup|1>|)>>>*exp
    <around*|(|<frac|i*n*2*\<pi\>|\<mu\><around|(|R<rsup|1>|)>>*<big|int><rsub|-\<infty\>><rsup|t>h<around|(|u|)>*m*<around|(|d*u|)>|)>,<space|1em>n=0,\<pm\>1,\<pm\>2,\<ldots\>
  </equation*>

  Upon normalizing <math|\<mu\>,\<mu\><around|(|R<rsup|1>|)>=1>, and using
  the complete set (13) in (10) we obtain the complete set of functions

  <\equation*>
    <\aligned>
      <tformat|<table|<row|<cell|F<rsub|n><around|(|t|)>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>exp
      <around|[|i*<around|{|t*u-n*2*\<pi\>*H<around|(|u|)>|}>|]>*h<around|(|u|)>*m*<around|(|d*u|)>*<space|1em>n=0,\<pm\>1,\<pm\>2,\<ldots\>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|1>exp
      <around*|[|i*<around*|{|t*H<rsup|-1><around|(|v|)>-n*2*\<pi\>*v|}>|]>*m*<around|(|d*v|)>>>>>
    </aligned>
  </equation*>

  where <math|h> is any probability density with
  <math|h<around|(|u|)>\<neq\>0> a.e. [<math|m>], and

  <\equation*>
    H<around|(|u|)>=<big|int><rsub|-\<infty\>><rsup|u>h<around|(|v|)>*m*<around|(|d*v|)>
  </equation*>

  It is clear that the functions given by (10) are uniformly continuous and
  uniformly bounded for fixed <math|n>, and that the family of functions
  given by (14) is equicontinuous and uniformly bounded.

  <with|font-series|bold|Examples.> By chosing probability densities <math|h>
  of particular form, we obtain by (14) various sets of complete functions in
  <math|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>. However, as it is
  illustrated by the following examples, the integral in (14) is not easily
  expressed in terms of the elementary and the special functions.

  1. The density of the normal distribution,
  <math|h<around|(|u|)>=<around|(|1/<sqrt|2*\<pi\>>|)>*e<rsup|-<frac|1|2>*u<rsup|2>>>,
  gives

  <\equation*>
    F<rsub|n><around|(|t|)>=<around|(|-1|)><rsup|n><sqrt|<frac|2|\<pi\>>>*<big|int><rsub|0><rsup|\<infty\>>cos
    <around*|[|t*u-n*\<pi\>*\<Phi\><around*|(|<frac|u|<sqrt|2>>|)>|]>*e<rsup|-<frac|1|2>*u<rsup|2>>*m*<around|(|d*u|)>
  </equation*>

  where <math|\<Phi\><around|(|u|)>=<around|(|2/<sqrt|\<pi\>>|)>*<big|int><rsub|0><rsup|u>e<rsup|-v<rsup|2>>*m*<around|(|d*v|)>>.

  2. The density of the double exponential distribution,
  <math|h<around|(|u|)>=<frac|1|2>*e<rsup|-<around|\||u|\|>>>, gives

  <\equation*>
    <\aligned>
      <tformat|<table|<row|<cell|F<rsub|n><around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-u>*cos
      <around*|[|t*u+n*\<pi\>*e<rsup|-u>|]>*m*<around|(|d*u|)>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|1>cos
      <around|[|t*ln v-n*\<pi\>*v|]>*m*<around|(|d*v|)>>>>>
    </aligned>
  </equation*>

  3. The density of the Cauchy distribution,
  <math|h<around|(|u|)>=<around|(|1/\<pi\>*<around|(|1+u<rsup|2>|)>|)>>,
  gives

  <\equation*>
    <\aligned>
      <tformat|<table|<row|<cell|F<rsub|n><around|(|t|)>>|<cell|=<around|(|-1|)><rsup|n><frac|2|\<pi\>>*<big|int><rsub|0><rsup|\<infty\>>cos
      <around*|[|t*u-2*n*tan<rsup|-1> u|]>*<frac|m*<around|(|d*u|)>|1+u<rsup|2>>>>|<row|<cell|>|<cell|=<around|(|-1|)><rsup|n><frac|2|\<pi\>>*<big|int><rsub|0><rsup|\<pi\>/2>cos
      <around|[|t*tan v-2*n*v|]>*m*<around|(|d*v|)>>>>>
    </aligned>
  </equation*>

  4. The probability density

  <\equation*>
    h<around|(|u|)>=<choice|<tformat|<table|<row|<cell|\<alpha\><rsup|-k>>|<cell|<text|on
    ><around|(|k-1,k|)>,<space|1em>k\<leqslant\>-1>>|<row|<cell|<frac|1-3*\<alpha\>|2*<around|(|1-\<alpha\>|)>>>|<cell|<text|on
    ><around|(|-1,+1|)>,>>|<row|<cell|\<alpha\><rsup|k>>|<cell|<text|on
    ><around|(|k,k+1|)>,<space|1em>k\<geqslant\>1>>>>>
  </equation*>

  where <math|0\<less\>\<alpha\>\<less\><frac|1|3>>, gives

  <\equation*>
    F<rsub|n><around|(|t|)>=2*<around|(|-1|)><rsup|n>*<big|sum><rsub|k=0><rsup|\<infty\>>\<alpha\><rsup|k>*cos
    <around*|[|<around*|(|k+<frac|1|2>|)>*t-n*\<pi\>*c<rsub|k>|]>*<frac|sin
    <around*|(|<frac|1|2>*t-n*\<pi\>*\<alpha\><rsup|k>|)>|<frac|1|2>*t-n*\<pi\>*\<alpha\><rsup|k>>,
  </equation*>

  where <math|c<rsub|k>=1-<around|(|1+\<alpha\>/1-\<alpha\>|)>*\<alpha\><rsup|k>>.

  5. If <math|r<rsub|X>> is supported by <math|<around|(|a,b|)>\<times\><around|(|a,b|)>>,
  then by using the density of the uniform distribution on
  <math|<around|(|a,b|)>,h<around|(|u|)>=<around|(|1/b-a|)>> on
  <math|<around|(|a,b|)>> and zero elsewhere, we obtain the complete set of
  functions

  <\equation*>
    F<rsub|n><around|(|t|)>=<frac|e<rsup|i*b*t>-e<rsup|i*a*t>|i*<around|[|<around|(|b-a|)>*t-n*2*\<pi\>|]>>
  </equation*>

  which in the particular case where <math|a=-T,b=T> gives

  <\equation*>
    F<rsub|n><around|(|t|)>=<around|(|-1|)><rsup|n><frac|sin
    <around*|[|\<pi\>*<around*|(|<frac|T|\<pi\>>*t-n|)>|]>|\<pi\>*<around*|(|<frac|T|\<pi\>>*t-n|)>>
  </equation*>

  <section*|Orthogonal Integral Representation of a Harmonizable Stochastic
  Process>

  Clearly any second order stochastic process
  <math|x*<around|(|t,\<omega\>|)>> having an orthogonal series expansion of
  the form (3) admits a trivial orthogonal integral representation of the
  form

  <\equation*>
    x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t,u|)>*Y<around|(|d*u,\<omega\>|)>,
  </equation*>

  where the orthogonal random measure <math|Y> is concentrated on the set of
  integers with <math|Y<around|(|<around|{|n|}>,\<omega\>|)>=\<xi\><rsub|n><around|(|\<omega\>|)>>
  and <math|f<around|(|t,n|)>=a<rsub|n><around|(|t|)>>.

  The following theorem shows that an explicit (nontrivial) orthogonal
  integral representation of a harmonizable stochastic process can always be
  obtained and that the nonnegative measure associated with the orthogonal
  random measure can be chosen arbitrarily from a wide class of measures.

  <\theorem>
    Let <math|\<mu\>> be any nonnegative measure on
    <math|<around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>|)>>, finite on
    the bounded Borel sets <math|<with|math-font|cal*|B>> and such that
    <math|L<rsub|2><around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>,\<mu\>|)>=L<rsub|2><around|(|\<mu\>|)>>
    is infinite dimensional. Let <math|<around|{|\<varphi\><rsub|n>|(>\<cdot\><around|)||}>>
    be an orthonormal and complete set of functions in
    <math|L<rsub|2><around|(|\<mu\>|)>>. Then every harmonizable stochastic
    process <math|x*<around|(|t,\<omega\>|)>> admits an orthogonal integral
    representation

    <\equation*>
      x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t,u|)>*Y<around|(|d*u,\<omega\>|)>
    </equation*>

    The function <math|f<around|(|t,u|)>> is given by

    <\equation*>
      f<around|(|t,u|)>=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*\<varphi\><rsub|n><around|(|u|)>
    </equation*>

    in <math|L<rsub|2><around|(|\<mu\>|)>> for all <math|t\<in\>R<rsup|1>>.
    The orthogonal random measure <math|Y> is defined on
    <math|<with|math-font|cal*|B>> by

    <\equation*>
      Y<around|(|S,\<omega\>|)>=<big|sum><rsub|n>\<xi\><rsub|n><around|(|\<omega\>|)>*<big|int><rsub|S>\<varphi\><rsub|n><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)>
    </equation*>

    in the mean square sense for all <math|S\<in\><with|math-font|cal*|B>>
    and has <math|Q<rsub|Y>=\<mu\>>. The <math|a<rsub|n>>'s and the
    <math|\<xi\><rsub|n>>'s are given in Theorem 1.
  </theorem>

  <\proof>
    We first show that <math|Y> is well-defined on
    <math|<with|math-font|cal*|B>> by (17) and that it is orthogonal. Since
    <math|\<mu\>> is finite on <math|<with|math-font|cal*|B>,I<rsub|S>\<in\>L<rsub|2><around|(|\<mu\>|)>>
    for all <math|S\<in\><with|math-font|cal*|B>>. Hence

    <\equation*>
      I<rsub|S><around|(|u|)>=<big|sum><rsub|n>b<rsub|n><around|(|S|)>*\<varphi\><rsub|n><around|(|u|)>
    </equation*>

    where

    <\equation*>
      b<rsub|n><around|(|S|)>=<big|int><rsub|S>\<varphi\><rsub|n><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)>
    </equation*>

    It follows that

    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|>|<cell|<big|sum><rsub|n><big|int><rsub|S<rsub|1>>\<varphi\><rsub|n><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)>*<big|int><rsub|S<rsub|2>>\<varphi\><rsub|n><around|(|u|)>*\<mu\>*<around|(|d*u|)>>>|<row|<cell|>|<cell|<space|1em>=<around|(|I<rsub|S<rsub|1>>,I<rsub|S<rsub|2>>|)><rsub|L<rsub|2><around|(|\<mu\>|)>>=\<mu\>*<around|(|S<rsub|1>\<cap\>S<rsub|2>|)>\<less\>\<infty\>*<space|1em><text|for
        all ><space|1em>S<rsub|1>,S<rsub|2>\<in\><with|math-font|cal*|B>>>>>
      </aligned>
    </equation*>

    and in particular that

    <\equation*>
      <big|sum><rsub|n><around*|\||<big|int><rsub|S>\<varphi\><rsub|n><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)>|\|><rsup|2>=<around|\<\|\|\>|I<rsub|S>|\<\|\|\>><rsub|L<rsub|2><around|(|\<mu\>|)>><rsup|2>=\<mu\><around|(|S|)>\<less\>\<infty\>
    </equation*>

    Hence <math|Y> is well-defined by (17) in
    <math|L<rsub|2><around|(|\<Omega\>,<with|math-font|cal*|M>,P|)>> for all
    <math|S\<in\><with|math-font|cal*|B>>. It follows by (17) and (18) that

    <\equation*>
      r<rsub|Y>*<around|(|S<rsub|1>\<times\>S<rsub|2>|)>=\<mu\>*<around|(|S<rsub|1>\<cap\>S<rsub|2>|)>
    </equation*>

    and thus <math|Y> is orthogonal with <math|Q<rsub|Y>=\<mu\>>.

    We next show that <math|f<around|(|t,u|)>> is well-defined in
    <math|L<rsub|2><around|(|\<mu\>|)>> by (16) for all
    <math|t\<in\>R<rsup|1>>. This is clear since from (6)

    <\equation*>
      <big|sum><rsub|n><around|\||a<rsub|n><around|(|t|)>|\|><rsup|2>=R<rsub|x*x><around|(|t,t|)>\<less\>\<infty\>*<space|1em><text|for
      all ><space|1em>t\<in\>R<rsub|1>
    </equation*>

    Hence the integral in (15) is well-defined and from (16), (17), and (3)
    we have

    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|<big|int><rsub|-\<infty\>><rsup|\<infty\>>f<around|(|t,u|)>*Y<around|(|d*u,\<omega\>|)>>|<cell|=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|n><around|(|u|)>*Y<around|(|d*u,\<omega\>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*<big|sum><rsub|m><big|int><rsub|-\<infty\>><rsup|\<infty\>>\<varphi\><rsub|n><around|(|u|)>*\<varphi\><rsub|m><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)>*\<xi\><rsub|m><around|(|\<omega\>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|n>a<rsub|n><around|(|t|)>*\<xi\><rsub|n><around|(|\<omega\>|)>=x*<around|(|t,\<omega\>|)>>>>>
      </aligned>
    </equation*>

    which proves (15).
  </proof>

  The freedom in choosing the measure <math|\<mu\>> enables us to obtain
  various orthogonal integral representations (15) of particular form. If
  <math|\<mu\>> is chosen to be a finite nonnegative measure on
  <math|R<rsup|1>> then <math|Y> will be finite on the whole real line and
  the <math|\<varphi\><rsub|n>>'s can be chosen as in (13) given by Masry et.
  al. <cite|masry1968>. If <math|\<mu\>> is chosen to be the Lebesgue measure
  or the Lebesgue measure restricted to the half line or to an interval, then
  the <math|\<varphi\><rsub|n>>'s may be chosen to be well-known orthonormal
  and complete sets of functions such as the Tchebysheff-Hermite functions,
  the Tchebysheff-Laguerre functions, the Legendre polynomials or the
  trigonometric system. In this latter case it is clear from (20) that the
  orthogonal random measure <math|Y> has stationary values.

  A harmonizable stochastic process is shown to have the nonorthogonal
  integral representation (1), the orthogonal series expansion (3) and the
  orthogonal integral representation (15). The relationship between the
  orthogonal random measure <math|Y> and the random measure <math|X> is

  <\equation*>
    Y<around|(|S,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|sum><rsub|n>f<rsub|n><around|(|v|)>*<big|int><rsub|S>\<varphi\><rsub|n><rsup|\<ast\>><around|(|u|)>*\<mu\>*<around|(|d*u|)>|]>*X<around|(|d*v,\<omega\>|)>
  </equation*>

  for all <math|S\<in\><with|math-font|cal*|B>>, which can be obtained by
  (17) and (4).

  <section*|4. Moving Average Representations and Harmonizable Stochastic
  Processes>

  A second-order stochastic process <math|<around|{|x*<around|(|t,\<omega\>|)>,t\<in\>R<rsup|1>,\<omega\>\<in\>\<Omega\>|}>>
  is said to have a moving average representation if and only if

  <\equation*>
    x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f*<around|(|t-u|)>*X<around|(|d*u,\<omega\>|)>*<space|1em><text|for
    all ><space|1em>t\<in\>R<rsup|1>
  </equation*>

  where <math|X> is a random measure defined on the bounded Borel sets of
  <math|R<rsup|1>> and <math|f*<around|(|t-\<cdot\>|)>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>
  for all <math|t\<in\>R<rsup|1>>. This is a generalization of the usual
  definition which assumes <math|X> to be orthogonal and <math|Q<rsub|X>> to
  be the Lebesgue measure. A moving average representation is orthogonal if
  and only if <math|X> is orthogonal and in this case
  <math|f*<around|(|t-\<cdot\>|)>\<in\>L<rsub|2><around|(|Q<rsub|X>|)>> for
  all <math|t\<in\>R<rsup|1>>.

  It is shown by Karhunen <cite|karhunen1947> and Doob <cite|doob1953> that
  (i) a second-order stochastic process which has an orthogonal moving
  average representation with <math|Q<rsub|X>=m>, the Lebesgue measure, and
  <math|f\<in\>L<rsub|2><around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>,m|)>=L<rsub|2><around|(|m|)>>
  is mean square continuous wide sense stationary and has absolutely
  continuous spectrum; and conversely that (ii) a mean square continuous wide
  sense stationary process with absolutely continuous spectrum has a moving
  average representation with <math|Q<rsub|X>=m> and
  <math|f\<in\>L<rsub|2><around|(|m|)>> is the Fourier transform of the
  square root of its spectral density.

  Sufficient conditions for the harmonizability of a stochastic process which
  has a moving average representation are given in the following

  <\theorem>
    If a second-order stochastic process <math|x*<around|(|t,\<omega\>|)>>
    has a moving average representation with <math|r<rsub|X>> a measure of
    bounded variation on the entire plane
    <math|R<rsup|2>,f\<in\>L<rsub|1><around|(|m|)>> and its Fourier transform
    <math|F\<in\>L<rsub|1><around|(|m|)>>, then
    <math|x*<around|(|t,\<omega\>|)>> is harmonizable.
  </theorem>

  <\proof>
    We have

    <\equation*>
      f<around|(|\<tau\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>F<around|(|\<rho\>|)>*e<rsup|i*\<tau\>*\<rho\>>*m*<around|(|d*\<rho\>|)>
    </equation*>

    Since <math|F\<in\>L<rsub|1><around|(|m|)>> and <math|r<rsub|X>> is
    finite, by interchanging the order of integration (see Rosanov
    <cite|rosanov1959>, p. 287), we obtain from (22)

    <\equation*>
      x*<around|(|t,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>F<around|(|\<rho\>|)>*e<rsup|-i*u*\<rho\>>*e<rsup|i*t*\<rho\>>*X<around|(|d*u,\<omega\>|)>*m*<around|(|d*\<rho\>|)>
    </equation*>

    Also, <math|F\<in\>L<rsub|1><around|(|m|)>> and <math|r<rsub|X>> finite
    imply that for all <math|S\<in\><with|math-font|cal*|B><rsup|1>>

    <\equation*>
      <big|int><rsub|S>F<around|(|\<rho\>|)>*e<rsup|-i*u*\<rho\>>*m*<around|(|d*\<rho\>|)>\<in\>\<Lambda\><rsub|2><around|(|r<rsub|X>|)>
    </equation*>

    Hence the random measure <math|Y> on <math|<around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>|)>>
    is well-defined by

    <\equation*>
      Y<around|(|S,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|S>F<around|(|\<rho\>|)>*e<rsup|-i*u*\<rho\>>*m*<around|(|d*\<rho\>|)>|]>*X<around|(|d*u,\<omega\>|)>
    </equation*>

    for all <math|S\<in\><with|math-font|cal*|B><rsup|1>> and by
    interchanging the order of integration we obtain

    <\equation*>
      Y<around|(|S,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|S>F<around|(|\<rho\>|)><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*u*\<rho\>>*X<around|(|d*u,\<omega\>|)>|]>*m*<around|(|d*\<rho\>|)>
    </equation*>

    i.e.,

    <\equation*>
      <around*|[|<frac|d*Y|d*m>|]><around|(|\<rho\>,\<omega\>|)>=<frac|F<around|(|\<rho\>|)>|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*u*\<rho\>>*X<around|(|d*u,\<omega\>|)>
    </equation*>

    Since <math|F\<in\>L<rsub|1><around|(|m|)>> and <math|r<rsub|X>> is
    finite, the lemma which follows this proof applies, and (23) and (24)
    imply

    <\equation*>
      x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<rho\>>*Y<around|(|d*\<rho\>,\<omega\>|)>
    </equation*>

    Therefore, <math|x*<around|(|t,\<omega\>|)>> is harmonizable.
  </proof>

  The property used in the last step of the proof of Theorem 4 will be proven
  now. It corresponds to the familiar property of Radon-Nikodym derivative in
  the scalar case and is used in later sections of this paper.

  <\lemma>
    If the second-order stochastic process
    <math|<around|{|y*<around|(|t,\<omega\>|)>,t\<in\>R<rsup|1>,\<omega\>\<in\>\<Omega\>|}>>
    is such that

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||R<rsub|y*y><around|(|t,s|)>|\|>*m*<around|(|d*t|)>*m*<around|(|d*s|)>\<less\>\<infty\>
    </equation*>

    then

    <\equation*>
      Y<around|(|S,\<omega\>|)>=<big|int><rsub|S>y*<around|(|t,\<omega\>|)>*m*<around|(|d*t|)>,<space|1em>S\<in\><with|math-font|cal*|B><rsup|1>
    </equation*>

    defines a random measure <math|Y> on <math|<around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>|)>>
    with <math|r<rsub|Y>> of bounded variation on <math|R<rsup|2>>, and for
    all <math|g\<in\>\<Lambda\><rsub|2><around|(|r<rsub|Y>|)>>

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*Y<around|(|d*t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*y*<around|(|t,\<omega\>|)>*m*<around|(|d*t|)>
    </equation*>

    all equalities being in the mean square sense.
  </lemma>

  <\proof>
    It is clear from (25) that (26) defines a random measure <math|Y> on
    <math|<around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>|)>> with
    <math|r<rsub|Y>> of bounded variation on <math|R<rsup|2>>.

    If we put

    <\equation*>
      \<xi\><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*Y<around|(|d*t,\<omega\>|)>*<space|1em><text|and
      ><space|1em>\<eta\><around|(|\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*y*<around|(|t,\<omega\>|)>*m*<around|(|d*t|)>
    </equation*>

    it suffices to show that

    <\equation*>
      <with|math-font|cal*|E><around|[|<around|\||\<xi\>-\<eta\>|\|><rsup|2>|]>=<with|math-font|cal*|E><around|[|<around|\||\<xi\>|\|><rsup|2>|]>+<with|math-font|cal*|E><around|[|<around|\||\<eta\>|\|><rsup|2>|]>-<with|math-font|cal*|E><around|[|\<xi\>*\<eta\><rsup|\<ast\>>|]>-<with|math-font|cal*|E><around|[|\<eta\>*\<xi\><rsup|\<ast\>>|]>=0
    </equation*>

    We have

    <\equation*>
      <\aligned>
        <tformat|<table|<row|<cell|<with|math-font|cal*|E><around|[|<around|\||\<xi\>|\|><rsup|2>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*g<rsup|\<ast\>><around|(|s|)>*r<rsub|Y><around|(|d*t,d*s|)>>>|<row|<cell|>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*g<rsup|\<ast\>><around|(|s|)>*R<rsub|y*y><around|(|t,s|)>*m*<around|(|d*t|)>*m*<around|(|d*s|)>>>|<row|<cell|<with|math-font|cal*|E><around|[|<around|\||\<eta\>|\|><rsup|2>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*g<rsup|\<ast\>><around|(|s|)>*R<rsub|y*y><around|(|t,s|)>*m*<around|(|d*t|)>*m*<around|(|d*s|)>,>>|<row|<cell|<with|math-font|cal*|E><around|[|\<eta\>*\<xi\><rsup|\<ast\>>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)><with|math-font|cal*|E><around|[|y<around|(|t|)>*\<xi\><rsup|\<ast\>>|]>*m*<around|(|d*t|)>>>|<row|<cell|<with|math-font|cal*|E><around|[|y<around|(|t|)>*\<xi\><rsup|\<ast\>>|]>>|<cell|=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<rsup|\<ast\>><around|(|s|)>*\<lambda\><rsub|t>*<around|(|d*s|)>>>>>
      </aligned>
    </equation*>

    where the measure <math|\<lambda\><rsub|t>> on
    <math|<around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>|)>> is defined
    by

    <\equation*>
      \<lambda\><rsub|t><around|(|S|)>=<with|math-font|cal*|E><around|[|y<around|(|t|)>*Y<rsup|\<ast\>><around|(|S|)>|]>=<big|int><rsub|S>R<rsub|y*y><around|(|t,s|)>*m*<around|(|d*s|)>
    </equation*>

    for all <math|S\<in\><with|math-font|cal*|B><rsup|1>>. It follows by (33)
    and (34) that

    <\equation*>
      <with|math-font|cal*|E><around|[|y<around|(|t|)>*\<xi\><rsup|\<ast\>>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<rsup|\<ast\>><around|(|s|)>*R<rsub|y*y><around|(|t,s|)>*m*<around|(|d*s|)>
    </equation*>

    and by (32)

    <\equation*>
      <with|math-font|cal*|E><around|[|\<eta\>*\<xi\><rsup|\<ast\>>|]>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|t|)>*g<rsup|\<ast\>><around|(|s|)>*R<rsub|y*y><around|(|t,s|)>*m*<around|(|d*t|)>*m*<around|(|d*s|)>=<with|math-font|cal*|E><around|[|\<xi\>*\<eta\><rsup|\<ast\>>|]>
    </equation*>

    The validity of (29) follows from (30), (31), and (36) and the proof is
    complete.
  </proof>

  If the moving average representation in Theorem 4 is orthogonal, then the
  condition of bounded variation of <math|r<rsub|X>> is equivalent to the
  finiteness of <math|Q<rsub|X>>.

  If the second-order stochastic process <math|x*<around|(|t,\<omega\>|)>>
  has a moving average representation and <math|X> has Radon-Nikodym
  derivative with respect to the Lebesgue measure the second-order stochastic
  process <math|y*<around|(|t,\<omega\>|)>,<around|[|d*Y/d*m|]>=y>, then

  <\equation*>
    x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>f*<around|(|t-u|)>*y*<around|(|u,\<omega\>|)>*m*<around|(|d*u|)>
  </equation*>

  In this case <math|x*<around|(|t,\<omega\>|)>> can be regarded as the
  output of a linear time invariant system with impulse response <math|f> and
  input the stochastic process <math|y*<around|(|t,\<omega\>|)>>. Theorem 4
  then implies that if <math|y*<around|(|t,\<omega\>|)>> is integrable over
  <math|R<rsup|1>> in the mean square sense, i.e., if
  <math|R<rsub|y*y><around|(|t,s|)>> is integrable over <math|R<rsup|2>>, and
  <math|f,F\<in\>L<rsub|1><around|(|m|)>> then the output
  <math|x*<around|(|t,\<omega\>|)>> is a harmonizable stochastic process. In
  the following section a more general result is proven which includes time
  varying linear systems.

  <section*|5. Linear Time Varying Systems and Harmonizable Stochastic
  Processes>

  Two kinds of linear time varying systems characterized by their impulse
  response <math|h*<around|(|t,\<tau\>|)>>, i.e., the response at time
  <math|t> to a unit impulse input at time <math|\<tau\>>, are considered in
  this section. Systems with <math|h> a deterministic function and systems
  with <math|h> a sample function of a stochastic process.

  <section*|Deterministic Linear Time Varying Systems>

  Consider a linear time varying system with impulse response
  <math|h*<around|(|t,\<tau\>|)>>. If the input process <math|x> is such that

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t,u|)>*h<rsup|\<ast\>>*<around|(|t,v|)>*R<rsub|x*x><around|(|u,v|)>*m*<around|(|d*u|)>*m*<around|(|d*v|)>\<less\>\<infty\>*<space|1em><text|for
    all ><space|1em>t\<in\>R<rsup|1>
  </equation*>

  then the output of the system is the second-order stochastic process
  <math|y> defined by

  <\equation*>
    y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t,u|)>*x*<around|(|u,\<omega\>|)>*m*<around|(|d*u|)>*<space|1em><text|for
    all ><space|1em>t\<in\>R<rsup|1>
  </equation*>

  It is apparent that a sufficient condition for the output of the system to
  be a stochastic process of second-order for all input processes <math|x>
  which have uniformly bounded autocorrelation functions

  <\equation*>
    <around|\||R<rsub|x*x><around|(|u,v|)>|\|>\<leqslant\>M\<less\>\<infty\>*<space|1em><text|for
    all >u,v\<in\>R<rsup|1>
  </equation*>

  is

  <\equation*>
    h*<around|(|t,\<cdot\>|)>\<in\>L<rsub|1><around|(|m|)>*<space|1em><text|for
    all >t\<in\>R<rsup|1>
  </equation*>

  The wide sense stationary processes <math|x> belong to this class since

  <\equation*>
    <around|\||R<rsub|x*x><around|(|u,v|)>|\|>=<around|\||R<rsub|x*x>*<around|(|u-v|)>|\|>\<leqslant\>R<rsub|x*x><around|(|0|)>\<less\>\<infty\>*<space|1em><text|for
    all >u,v\<in\>R<rsup|1>
  </equation*>

  and so do the harmonizable stochastic processes <math|x>, since

  <\equation*>
    <around|\||R<rsub|x*x><around|(|u,v|)>|\|>\<leqslant\><around|\||r<rsub|X>|\|><around|(|R<rsup|2>|)>\<less\>\<infty\>*<space|1em><text|for
    all >u,v\<in\>R<rsup|1>
  </equation*>

  The following theorem provides a set of sufficient conditions which imply
  the harmonizability of the output of a linear time varying system.

  <\theorem>
    Let <math|h*<around|(|t,\<tau\>|)>> be the impulse response of a linear
    time varying system and <math|x*<around|(|t,\<omega\>|)>> be the input
    stochastic process. If <math|h*<around|(|\<cdummy\>,\<tau\>|)>> is the
    Fourier transform of a function <math|g<around|(|\<cdummy\>,\<tau\>|)>\<in\>L<rsub|1><around|(|m|)>>
    for all <math|\<tau\>\<in\>R<rsup|1>> and if <math|g> satisfies

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||g<around|(|\<tau\>,u|)>|\|><around|\||g<rsup|\<ast\>><around|(|\<sigma\>,v|)>|\|><around|\||R<rsub|x*x><around|(|u,v|)>|\|>*m*<around|(|d*u|)>*m*<around|(|d*v|)>*m*<around|(|d*\<tau\>|)>*m*<around|(|d*\<sigma\>|)>\<less\>\<infty\>
    </equation*>

    then the output stochastic process is harmonizable.
  </theorem>

  <\proof>
    For all <math|\<tau\>\<in\>R<rsup|1>> we have

    <\equation*>
      h*<around|(|t,\<tau\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|s,\<tau\>|)>*e<rsup|i*t*s>*m*<around|(|d*s|)>
    </equation*>

    Hence (39) implies (37) and <math|y*<around|(|t,\<omega\>|)>> is
    well-defined by (38) in the stochastic mean. It follows by (39) that the
    random measure <math|Y> defined on <math|<around|(|R<rsup|1>,<with|math-font|cal*|B><rsup|1>|)>>
    by

    <\equation*>
      <around*|[|<frac|d*Y|d*m>|]><around|(|\<tau\>,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>g<around|(|\<tau\>,u|)>*x*<around|(|u,\<omega\>|)>*m*<around|(|d*u|)>
    </equation*>

    has <math|r<rsub|Y>> of finite variation on the entire plane
    <math|R<rsup|2>>. For all <math|S<rsub|1>,S<rsub|2>\<in\><with|math-font|cal*|B><rsup|1>>

    <with|font-base-size|9|<\equation*>
      r<rsub|Y>*<around|(|S<rsub|1>\<times\>S<rsub|2>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|S<rsub|1>><big|int><rsub|S<rsub|2>>g<around|(|\<tau\>,u|)>*g<rsup|\<ast\>><around|(|\<sigma\>,v|)>*R<rsub|x*x><around|(|u,v|)>*m*<around|(|d*\<tau\>|)>*m*<around|(|d*\<sigma\>|)>*m*<around|(|d*u|)>*m*<around|(|d*v|)>
    </equation*>>

    It is clear from (38), (40), (41) and the lemma that

    <\equation*>
      y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<tau\>><around*|[|<frac|d*Y|d*m>|]><around|(|\<tau\>,\<omega\>|)>*m*<around|(|d*\<tau\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<tau\>>*Y<around|(|d*\<tau\>,\<omega\>|)>
    </equation*>

    in the stochastic mean sense and hence <math|y> is harmonizable.
  </proof>

  A sufficient condition for (39) to be satisfied for the class of input
  processes with uniformly bounded autocorrelation functions is clearly

  <\equation*>
    g<around|(|s,\<tau\>|)>\<in\>L<rsub|1>*<around|(|m\<times\>m|)>
  </equation*>

  As an example, let

  <\equation*>
    h*<around|(|t,\<tau\>|)>=<frac|\<alpha\>+\<gamma\><around|\||\<tau\>|\|>|t<rsup|2>+<around|(|\<alpha\>+\<gamma\><around|\||\<tau\>|\|>|)><rsup|2>>*e<rsup|-\<beta\><around|\||\<tau\>|\|>>*<space|1em>\<alpha\>,\<beta\>\<gtr\>0,<space|1em>\<gamma\>\<geqslant\>0
  </equation*>

  Then <math|h*<around|(|t,\<tau\>|)>> is the Fourier transform of
  <math|g<around|(|s,\<tau\>|)>> :

  <\equation*>
    g<around|(|s,\<tau\>|)>=<sqrt|<frac|\<pi\>|2>>*e<rsup|-\<alpha\>\|s*<around|\||-\<beta\>|\|>*\<tau\>\|-\<gamma\>*<around|\||s*\<tau\>|\|>>
  </equation*>

  and <math|g> satisfies (44). The condition (39) can be written in the form

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|e<rsup|-\<beta\><around|\||u|\|>>|\<alpha\>+\<gamma\><around|\||u|\|>>\<cdot\><frac|e<rsup|-\<beta\><around|\||v|\|>>|\<alpha\>+\<gamma\><around|\||v|\|>><around|\||R<rsub|x*x><around|(|u,v|)>|\|>*m*<around|(|d*u|)>*m*<around|(|d*v|)>\<less\>\<infty\>
  </equation*>

  and the output of the system with impulse response
  <math|h*<around|(|t,\<tau\>|)>> to all input processes which satisfy this
  condition is a harmonizable stochastic process. In particular, if <math|x>
  is harmonizable with

  <\equation*>
    x*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<lambda\>>*X<around|(|d*\<lambda\>,\<omega\>|)>
  </equation*>

  then it follows by (41) that

  <\equation*>
    <around*|[|<frac|d*Y|d*m>|]><around|(|\<tau\>,\<omega\>|)>=<around|(|\<beta\>+\<gamma\><around|\||\<tau\>|\|>|)>*e<rsup|-\<alpha\><around|\||\<tau\>|\|>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|X<around|(|d*\<lambda\>,\<omega\>|)>|\<lambda\><rsup|2>+<around|(|\<beta\>+\<gamma\><around|\||\<tau\>|\|>|)><rsup|2>>
  </equation*>

  and the output <math|y> has the harmonizable representation (43) which can
  also be written in the form

  <\equation*>
    y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around*|[|<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|\<beta\>+\<gamma\><around|\||\<tau\>|\|>|\<lambda\><rsup|2>+<around|(|\<beta\>+\<gamma\><around|\||\<tau\>|\|>|)><rsup|2>>*e<rsup|-\<alpha\>\|\<tau\>\|+i*t*\<tau\>>*m*<around|(|d*\<tau\>|)>|]>*X<around|(|d*\<lambda\>,\<omega\>|)>
  </equation*>

  This representation takes the following simple form in the particular case
  where <math|\<gamma\>=0>, i.e., <math|h*<around|(|t,\<tau\>|)>=\<alpha\>*e<rsup|-\<beta\><around|\||\<tau\>|\|>>/<around|(|\<alpha\><rsup|2>+t<rsup|2>|)>>,

  <\equation*>
    y*<around|(|t,\<omega\>|)>=<frac|2*\<beta\>|\<alpha\><rsup|2>+t<rsup|2>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>><frac|X<around|(|d*\<lambda\>,\<omega\>|)>|\<beta\><rsup|2>+\<lambda\><rsup|2>>
  </equation*>

  <section*|Linear Randomly Time Varying Systems>

  Let the impulse response of a linear time varying system be a sample
  function of a stochastic process of second order
  <math|h*<around|(|t,\<tau\>,\<omega\>|)>> with autocorrelation function
  <math|R<rsub|h*h><around|(|t,s;\<tau\>,\<sigma\>|)>>. For all second-order
  input processes <math|x*<around|(|t,\<omega\>|)>> independent of <math|h>
  and such that

  <\equation*>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>>R<rsub|h*h><around|(|t,t;u,v|)>*R<rsub|x*x><around|(|u,v|)>*m*<around|(|d*u|)>*m*<around|(|d*v|)>\<less\>\<infty\>*<space|1em><text|for
    all ><space|1em>t\<in\>R<rsup|1>
  </equation*>

  the output of the system is the second-order stochastic process <math|y>
  defined by

  <\equation*>
    y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>h*<around|(|t,u,\<omega\>|)>*x*<around|(|u,\<omega\>|)>*m*<around|(|d*u|)>
  </equation*>

  A sufficient condition for (45) to hold for all input processes <math|x>
  with uniformly bounded autocorrelation functions is clearly
  <math|R<rsub|h*h><around|(|t,t;\<cdot\>,\<cdot\>|)>\<in\>L<rsub|1>*<around|(|m\<times\>m|)>>
  for all <math|t\<in\>R<rsup|1>>.

  A set of sufficient conditions for the harmonizability of the output of a
  linear randomly time varying system is given in the following theorem. Its
  proof is similar to the proof of Theorem 5 and as such it is omitted.

  <\theorem>
    If the impulse response <math|h*<around|(|t,u,\<omega\>|)>> of a linear
    randomly time varying system is the Fourier transform in the stochastic
    mean sense of a second-order stochastic process
    <math|H*<around|(|\<rho\>,u,\<omega\>|)>>, i.e.,

    <\equation*>
      h*<around|(|t,u,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>H*<around|(|\<rho\>,u,\<omega\>|)>*e<rsup|i*t*\<rho\>>*m*<around|(|d*\<rho\>|)>
    </equation*>

    which is such that <math|R<rsub|H*H><around|(|\<cdummy\>,\<cdummy\>;u,u|)>\<in\>L<rsub|1>*<around|(|m\<times\>m|)>>
    for all <math|u\<in\>R<rsup|1>> and

    <\equation*>
      <big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||R<rsub|H*H><around|(|\<tau\>,\<sigma\>;u,v|)><around|\|||\|>*R<rsub|x*x><around|(|u,v|)>|\|>*m*<around|(|d*\<tau\>|)>*m*<around|(|d*\<sigma\>|)>*m*<around|(|d*u|)>*m*<around|(|d*v|)>\<less\>\<infty\>
    </equation*>

    and if the input <math|x> is independent of <math|h>, then the output
    stochastic process <math|y*<around|(|t,\<omega\>|)>> is harmonizable.
  </theorem>

  We have

  <\equation*>
    y*<around|(|t,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<rho\>>*Y<around|(|d*\<rho\>,\<omega\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*t*\<rho\>><around*|[|<frac|d*Y|d*m>|]><around|(|\<rho\>,\<omega\>|)>*m*<around|(|d*\<rho\>|)>,
  </equation*>

  where

  <\equation*>
    <around*|[|<frac|d*Y|d*m>|]><around|(|\<rho\>,\<omega\>|)>=<frac|1|<sqrt|2*\<pi\>>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>H*<around|(|\<rho\>,u,\<omega\>|)>*x*<around|(|u,\<omega\>|)>*m*<around|(|d*u|)>
  </equation*>

  A sufficient condition for (48) to hold for all input processes <math|x>
  with uniformly bounded autocorrelation functions is clearly
  <math|R<rsub|H*H>\<in\>L<rsub|1><around|(|m<rsup|4>|)>>.

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
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-10|<tuple|6|18>>
    <associate|auto-11|<tuple|7|19>>
    <associate|auto-2|<tuple|?|2>>
    <associate|auto-3|<tuple|?|3>>
    <associate|auto-4|<tuple|?|3>>
    <associate|auto-5|<tuple|1|6>>
    <associate|auto-6|<tuple|2|10>>
    <associate|auto-7|<tuple|3|12>>
    <associate|auto-8|<tuple|5|15>>
    <associate|auto-9|<tuple|5|15>>
    <associate|bib-campbell1969|<tuple|campbell1969|19>>
    <associate|bib-cramer1951|<tuple|cramer1951|19>>
    <associate|bib-cramer1964|<tuple|cramer1964|19>>
    <associate|bib-doob1953|<tuple|doob1953|19>>
    <associate|bib-karhunen1947|<tuple|karhunen1947|19>>
    <associate|bib-loeve1963|<tuple|loeve1963|19>>
    <associate|bib-masani1968|<tuple|masani1968|19>>
    <associate|bib-masry1968|<tuple|masry1968|19>>
    <associate|bib-parzen1967|<tuple|parzen1967|19>>
    <associate|bib-piranashvili1967|<tuple|piranashvili1967|19>>
    <associate|bib-rao1967|<tuple|rao1967|19>>
    <associate|bib-rosanov1959|<tuple|rosanov1959|19>>
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

      piranashvili1967

      rao1967

      masry1968

      masry1968

      masry1968

      karhunen1947

      doob1953

      rosanov1959
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.
      Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.
      Notation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.
      Representation of Harmonizable Stochastic Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Orthogonal
      Series Representation of a Harmonizable Stochastic Process>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Orthonormal
      and Complete Sets in <with|mode|<quote|math>|\<Lambda\><rsub|2><around|(|r<rsub|X>|)>>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Orthogonal
      Integral Representation of a Harmonizable Stochastic Process>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.
      Moving Average Representations and Harmonizable Stochastic Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5.
      Linear Time Varying Systems and Harmonizable Stochastic Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Deterministic
      Linear Time Varying Systems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Linear
      Randomly Time Varying Systems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>