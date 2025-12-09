<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|INTEGRAL REPRESENTATIONS OF POSITIVE DEFINITE
  FUNCTIONS>|<doc-author|<author-data|<author-name|A.
  DEVINATZ>|<author-note|Parts of this paper are taken from the author's
  Harvard dissertation. I would like to express my appreciation to Prof. N.
  Aronszajn for allowing me to read his paper Theory of reproducing kernels
  <cite|aronszajn2> before it was published.>>>|<doc-date|November 24, 1950>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Preliminaries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Semi-bounded
    and real operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Positive
    matrices represented by integrals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>The
    main theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6<space|2spc>Moment
    problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  During the last decade a school of Russian mathematicians including Krein
  <cite|krein1|krein2|krein3><footnote|Numbers in brackets refer to the
  references at the end.>, Krein and Krasnoselskiï
  <cite|krein-krasnoselskii>, Livshitz <cite|livshitz>, and Neumark
  <cite|neumark> have made contributions to the theory of moments and related
  problems<footnote|For an extensive bibliography of such problems see Shohat
  and Tamarkin <cite|shohat-tamarkin>.> by the methods of operators in
  Hilbert space. Before this Carleman <cite|carleman> had used the theory of
  integral equations to develop the theory and Stone <cite|stone> had
  connected the theory with infinite Jacobi matrices, which method has been
  elaborated by various other authors.

  In this paper we make systematic use of the theory of reproducing kernels,
  as developed by N. Aronszajn <cite|aronszajn1|aronszajn2>, to obtain
  integral representations for positive definite functions. A function
  <math|K<around|(|x,y|)>>, defined over a Cartesian product set
  <math|E\<times\>F>, was termed by E. H. Moore a positive Hermitian matrix
  if for every finite set, <math|<around|{|a<rsub|1>,\<ldots\>,a<rsub|n>|}>>,
  of complex numbers and points <math|<around|{|y<rsub|1>,\<ldots\>,y<rsub|n>|}>\<subset\>E>,

  <\equation>
    <big|sum><rsub|i,j=1><rsup|n>a<rsub|i><wide|a<rsub|j>|\<bar\>>K<around|(|y<rsub|i>,y<rsub|j>|)>\<geq\>0.<label|eq:positive-hermitian>
  </equation>

  This terminology has been shortened by N. Aronszajn <cite|aronszajn2> to
  positive matrix, which we shall use here.

  A positive definite function shall be defined as a complex-valued function
  <math|f<around|(|x,y|)>>, with domain a set <math|E=S\<times\>G>, where
  <math|S> is a semi-group and <math|G> is a group, such that
  <math|K<around|(|<around|(|x<rsub|1>,y<rsub|1>|)>,<around|(|x<rsub|2>,y<rsub|2>|)>|)>=f<around|(|x<rsub|1>-x<rsub|2>,y<rsub|1>-y<rsub|2><rsup|-1>|)>>
  is a positive matrix.

  Here, we shall be concerned only with the case in which <math|S> is a
  semi-group and <math|G> is a group in Euclidean space. Our main theorem
  (Theorem<nbsp><reference|thm:main>) contains extensions, to higher
  dimensions, of results which have already been obtained, in a different
  way, for the one-dimensional case and also contains results which are new.

  The readers of this paper are expected to have some acquaintance with the
  papers of N. Aronszajn <cite|aronszajn1|aronszajn2> and with the general
  theory of Hilbert space. The notations used in this paper for the general
  theory of Hilbert space have been taken from the excellent book by Béla v.
  Sz. Nagy <cite|nagy>.

  <section|Preliminaries><label|sec:preliminaries>

  If <math|K<around|(|x,y|)>> is a positive matrix (p.m.), defined on
  <math|E\<times\>E>, then there exists a Hilbert space <math|\<cal-J\>>, of
  functions defined on <math|E>, for which <math|K<around|(|x,y|)>> acts as a
  reproducing kernel (r.k.) (i.e. <math|f<around|(|y|)>=<around|(|f<around|(|x|)>,K<around|(|x,y|)>|)>>
  for every <math|f\<in\>\<cal-J\>>). The space <math|\<cal-J\>> will be
  called a reproducing kernel space (r.k.s.). <math|\<cal-J\>> is the closure
  of the set <math|\<cal-J\><rprime|'>> of functions of the form
  <math|g<around|(|x|)>=<big|sum><rsub|i=1><rsup|n>a<rsub|i>*K<around|(|x,y<rsub|i>|)>>,
  where <math|a<rsub|i>>, <math|i=1,\<ldots\>,n>, is a complex number. In the
  future <math|\<cal-J\>> will always denote the r.k.s. of the p.m. we are
  considering at that time and <math|\<cal-J\><rprime|'>> will always denote
  the set as given above for that p.m.

  Aronszajn <cite|aronszajn2> has shown that if <math|T> is a bounded linear
  operator defined on <math|\<cal-J\>>, then there exists a function
  <math|M<around|(|x,y|)>>, defined over <math|E\<times\>E>, which, for every
  <math|y\<in\>E>, belongs to <math|\<cal-J\>> and such that for every
  <math|f\<in\>\<cal-J\>>, <math|T*f<around|(|y|)>=<around|(|f<around|(|x|)>,M<around|(|x,y|)>|)>>.
  The function <math|M<around|(|x,y|)>> is given by
  <math|T<rsup|\<ast\>>*K<around|(|x,y|)>>. The operator <math|T> is said to
  correspond to the function <math|M<around|(|x,y|)>> and we shall denote
  this by <math|T\<leftrightarrow\>M<around|(|x,y|)>>.

  The following facts are given by Aronszajn <cite|aronszajn2> and may be
  checked without too much difficulty:

  <\enumerate>
    <item><math|T<rsup|\<ast\>>\<leftrightarrow\>M<rsup|\<ast\>><around|(|x,y|)>=M<around|(|y,x|)>>.

    <item>If <math|T<rsub|1>\<leftrightarrow\>M<rsub|1><around|(|x,y|)>>,
    <math|T<rsub|2>\<leftrightarrow\>M<rsub|2><around|(|x,y|)>>, then

    <\equation>
      T<rsub|1>*T<rsub|2>\<leftrightarrow\>M<around|(|x,y|)>=<around|(|M<rsub|1><around|(|z,y|)>,M<rsub|2><rsup|\<ast\>><around|(|z,x|)>|)>.<label|eq:operator-product>
    </equation>

    <item>If <math|T\<leftrightarrow\>M<around|(|x,y|)>>, then the symmetry
    of <math|T> is equivalent to the Hermitian symmetry of
    <math|M<around|(|x,y|)>> (i.e. <math|M<around|(|y,x|)>=<wide|M<around|(|x,y|)>|\<bar\>>>).

    <item>If <math|T\<leftrightarrow\>M<around|(|x,y|)>>, then <math|T> is
    positive if and only if <math|M<around|(|x,y|)>> is a p.m.
  </enumerate>

  We find it necessary to extend the concept of correspondence between
  operators and kernels to unbounded operators. Let <math|T> denote an
  arbitrary operator in <math|\<cal-J\>>, <math|D<rsub|T>> its domain, and
  <math|M<around|(|x,y|)>\<in\>\<cal-J\>> for every <math|y> in <math|E>.

  <\definition>
    <label|def:correspondence><math|T> is said to correspond to the kernel
    <math|M<around|(|x,y|)>>, in symbol <math|T\<sim\>M<around|(|x,y|)>>, if
    for every <math|f\<in\>D<rsub|T>>, <math|T*f<around|(|y|)>=<around|(|f<around|(|x|)>,M<around|(|x,y|)>|)>>.
    <math|T> is said to correspond to <math|M<around|(|x,y|)>> in the maximal
    sense, in symbol <math|T\<doteq\>M<around|(|x,y|)>>, if <math|D<rsub|T>>
    consists of all the elements <math|f> in <math|\<cal-J\>> such that
    <math|<around|(|f<around|(|x|)>,M<around|(|x,y|)>|)>> is again an element
    of <math|\<cal-J\>>, when considered as a function of <math|y> and for
    every <math|f\<in\>D<rsub|T>>, <math|T*f<around|(|y|)>=<around|(|f<around|(|x|)>,M<around|(|x,y|)>|)>>.
  </definition>

  Let us notice that, according to this definition, to a given kernel there
  may correspond many operators. However, to any given kernel there exists
  one and only one linear operator which corresponds to it in the maximal
  sense. Bounded linear operators always correspond to kernels in the maximal
  sense.

  The question arises as to which operators correspond to kernels. To answer
  this we consider an operator <math|T<rsub|1>> with
  <math|D<rsub|T<rsub|1>>\<subset\>\<cal-J\>>. An operator <math|T<rsub|2>>
  is said to be adjoint to <math|T<rsub|1>>, in symbol
  <math|T<rsub|1>\<perp\>T<rsub|2>>, if for every
  <math|f\<in\>D<rsub|T<rsub|1>>> and <math|g\<in\>D<rsub|T<rsub|2>>> we have
  <math|<around|(|T<rsub|1>*f,g|)>=<around|(|f,T<rsub|2>*g|)>><footnote|Cf.
  Stone <cite|stone>, p. 41.>.

  <\theorem>
    <label|thm:correspondence>Necessary and sufficient conditions that an
    operator <math|T<rsub|1>> corresponds to the kernel
    <math|M<around|(|x,y|)>> are that there exists a <math|T<rsub|2>> such
    that <math|T<rsub|1>\<perp\>T<rsub|2>>, the r.k. <math|K<around|(|x,y|)>>
    of <math|\<cal-J\>> belongs to <math|D<rsub|T<rsub|1>>> for every
    <math|y> of <math|E>, and <math|M<around|(|x,y|)>=T<rsub|2>*K<around|(|x,y|)>>.
    If <math|T\<doteq\>M<around|(|x,y|)>>, a sufficient condition that
    <math|T> have an inverse is that the linear manifold determined by the
    functions <math|M<around|(|x,y|)>> be dense in <math|\<cal-J\>>. If
    <math|T\<doteq\>M<around|(|x,y|)>>, the condition is also necessary.
  </theorem>

  <\proof>
    That the conditions of the first statement are sufficient is quite
    obvious. For <math|T<rsub|1>*f<around|(|y|)>=<around|(|T<rsub|1>*f<around|(|x|)>,K<around|(|x,y|)>|)>=<around|(|f<around|(|x|)>,T<rsub|2>*K<around|(|x,y|)>|)>>
    and consequently <math|T<rsub|1>\<sim\>M<around|(|x,y|)>=T<rsub|2>*K<around|(|x,y|)>>.

    For the necessity, we suppose <math|f\<in\>D<rsub|T<rsub|1>>> and we have
    <math|T<rsub|1>*f<around|(|y|)>=<around|(|f<around|(|x|)>,M<around|(|x,y|)>|)>=<around|(|T<rsub|1>*f<around|(|x|)>,K<around|(|x,y|)>|)>>.
    Consequently, we define a transformation <math|T<rsub|2>>, with
    <math|D<rsub|T<rsub|2>>> equal to the class
    <math|<around|{|K<around|(|x,y|)>|}>>, by the condition
    <math|T<rsub|2>*K<around|(|x,y|)>=M<around|(|x,y|)>>. Since
    <math|T<rsub|1>\<perp\>T<rsub|2>> the necessity is proved.

    To prove the sufficiency of the second statement we suppose
    <math|T*f<rsub|1>=T*f<rsub|2>>. It follows that
    <math|T*f<rsub|1><around|(|y|)>-T*f<rsub|2><around|(|y|)>=<around|(|f<rsub|1><around|(|x|)>-f<rsub|2><around|(|x|)>,M<around|(|x,y|)>|)>=0>.
    Since the linear manifold determined by the class
    <math|<around|{|M<around|(|x,y|)>|}>> is dense in <math|\<cal-J\>> we
    must have <math|f<rsub|1>=f<rsub|2>>.

    For the third statement, we notice that if the linear manifold determined
    by the class <math|<around|{|M<around|(|x,y|)>|}>> is not dense in
    <math|\<cal-J\>>, there exists a nonzero <math|f\<in\>\<cal-J\>> such
    that <math|<around|(|f<around|(|x|)>,M<around|(|x,y|)>|)>=0>. Since
    <math|T\<doteq\>M<around|(|x,y|)>>, <math|f\<in\>D<rsub|T>> and
    <math|T*f=0>. This contradicts the fact that <math|T> has an inverse.
  </proof>

  In Ÿ<reference|sec:main-theorem> we have occasion to consider the
  restriction of a r.k. <math|K<around|(|x,y|)>>, defined over a set
  <math|E\<times\>E>, to a set <math|E<rsub|1>\<times\>E<rsub|1>\<subset\>E\<times\>E>.
  The restriction of <math|K<around|(|x,y|)>> to
  <math|E<rsub|1>\<times\>E<rsub|1>> is of course a p.m.
  <math|K<rsub|1><around|(|x,y|)>> and the r.k.s. <math|\<cal-J\><rsub|1>>
  which is associated with <math|K<rsub|1><around|(|x,y|)>> is obtained in
  the following way. Let <math|\<cal-J\><rsub|0>> be the subspace of all
  <math|f\<in\>\<cal-J\>> such that <math|f<around|(|x|)>=0> for
  <math|x\<in\>E<rsub|1>>. If <math|\<cal-J\><rsub|0><rsup|\<perp\>>> is the
  orthogonal complement of <math|\<cal-J\><rsub|0>>, then to every
  <math|f\<in\>\<cal-J\>> there exists an
  <math|f<rsub|0>\<in\>\<cal-J\><rsub|0><rsup|\<perp\>>> such that the
  restriction of <math|f> and <math|f<rsub|0>> to <math|E<rsub|1>> are the
  same. Consequently, define <math|\<cal-J\><rsub|1>> as the set of functions
  in <math|\<cal-J\>> restricted to <math|E<rsub|1>> with the norm of any
  element <math|f<rsub|1>\<in\>\<cal-J\><rsub|1>> given by the norm of that
  element <math|f<rsub|0>> in <math|\<cal-J\><rsub|0><rsup|\<perp\>>> for
  which the restriction of <math|f<rsub|0>> to <math|E<rsub|1>> is
  <math|f<rsub|1>>. The pertinent theorem here is as follows.

  <\theorem>
    [A]<label|thm:restriction>If <math|K> is the reproducing kernel of the
    space <math|\<cal-J\>> of functions defined on the set <math|E> with norm
    <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>>>, then <math|K> restricted to
    the subset <math|E<rsub|1>\<times\>E<rsub|1>\<subset\>E\<times\>E> is the
    reproducing kernel of the class <math|\<cal-J\><rsub|1>> of all
    restrictions of functions of <math|\<cal-J\>> to the subset
    <math|E<rsub|1>>. For any such restriction,
    <math|f<rsub|1>\<in\>\<cal-J\><rsub|1>>, the norm
    <math|<around|\<\|\|\>|f<rsub|1>|\<\|\|\>><rsub|1>> is the minimum of
    <math|<around|\<\|\|\>|f|\<\|\|\>>> for all <math|f\<in\>\<cal-J\>> whose
    restriction to <math|E<rsub|1>> is <math|f<rsub|1>>.
  </theorem>

  <section|Semi-bounded and real operators><label|sec:semi-bounded>

  In this section we wish to extend a theorem of Aronszajn to semi-bounded
  operators and, for spaces which correspond to real spaces<footnote|These
  are spaces for which the r.k. is real. Cf. Aronszajn <cite|aronszajn2>, p.
  354.>, to unbounded operators. Following Aronszajn we write
  <math|M<rsub|1><around|(|x,y|)>\<leq\><rsub|K>M<rsub|2><around|(|x,y|)>> if
  <math|M<rsub|2><around|(|x,y|)>-M<rsub|1><around|(|x,y|)>> is a p.m. In the
  following two theorems <math|K<around|(|x,y|)>> is the r.k. of the r.k.s.
  <math|\<cal-J\>>.

  <\theorem>
    <label|thm:semi-bounded>Let <math|M<around|(|x,y|)>> be a Hermitian
    symmetric function (i.e. <math|M<around|(|x,y|)>=<wide|M<around|(|y,x|)>|\<bar\>>>)
    defined over <math|E\<times\>E> which belongs to <math|\<cal-J\>> when
    considered as a function of <math|x>, for every <math|y\<in\>E>.

    <\enumerate>
      <item>If <math|T\<doteq\>M<around|(|x,y|)>>, then
      <math|T<rsup|\<ast\>>> and <math|T<rsup|\<ast\>\<ast\>>> exist and
      <math|T<rsup|\<ast\>\<ast\>>=T>. <math|T<rsup|\<ast\>>> is a symmetric
      operator and is the closure of the restriction of <math|T> to
      <math|\<cal-J\><rprime|'>>; every self-adjoint operator which
      corresponds to <math|M<around|(|x,y|)>> is an extension of
      <math|T<rsup|\<ast\>>>. A necessary and sufficient condition that
      <math|T> be self-adjoint is that the linear manifold determined by the
      class <math|<around|{|M<around|(|x,y|)>+i*K<around|(|x,y|)>|}>> is
      dense in <math|\<cal-J\>>.

      <item>A necessary and sufficient condition that there exists a
      self-adjoint operator <math|H\<sim\>M<around|(|x,y|)>> which is bounded
      below (above) by the finite number <math|c> is that
      <math|M<around|(|x,y|)>\<geq\><rsub|K>c*K<around|(|x,y|)>>
      (<math|M<around|(|x,y|)>\<leq\><rsub|K>c*K<around|(|x,y|)>>). A
      necessary and sufficient condition that there exists a self-adjoint
      <math|H\<doteq\>M<around|(|x,y|)>> with lower bound
      <math|\<geq\>\<alpha\>\<gtr\>-\<infty\>> and upper bound
      <math|\<leq\>\<beta\>\<less\>+\<infty\>> is that

      <\equation>
        \<alpha\>*K<around|(|x,y|)>\<leq\><rsub|K>M<around|(|x,y|)>\<leq\><rsub|K>\<beta\>*K<around|(|x,y|)>.<label|eq:bounded-operator>
      </equation>
    </enumerate>
  </theorem>

  <\proof>
    To prove (a) we consider the operator <math|T\<doteq\>M<around|(|x,y|)>>.
    From the fact that <math|M<around|(|z,y|)>=<around|(|K<around|(|x,z|)>,M<around|(|x,y|)>|)>=<wide|M<around|(|y,z|)>|\<bar\>>>
    we conclude that <math|<around|(|K<around|(|x,z|)>,M<around|(|x,y|)>|)>>
    is an element of <math|\<cal-J\>>, when considered as a function of
    <math|y>, for every <math|z\<in\>E>, and consequently
    <math|\<cal-J\><rprime|'>\<subset\>D<rsub|T>>. Therefore,
    <math|D<rsub|T>> is dense in <math|\<cal-J\>>, which implies
    <math|T<rsup|\<ast\>>> exists.

    Since <math|T\<doteq\>M<around|(|x,y|)>>, it follows that <math|T> is a
    closed linear operator and from the fact that <math|D<rsub|T>> is dense
    in <math|\<cal-J\>>, it follows that <math|T<rsup|\<ast\>\<ast\>>=T><footnote|This
    remark is due to the referee. It slightly simplifies the original proof.
    For the pertinent theorem see Nagy <cite|nagy>, p. 29.>. Therefore,

    <\align>
      <tformat|<table|<row|<cell|T<rsup|\<ast\>>>|<cell|\<sim\>M<rsup|\<ast\>><around|(|x,y|)>=<wide|T*K<around|(|x,y|)>|\<bar\>>=<around|(|T*K<around|(|z,y|)>,K<around|(|z,x|)>|)>>>|<row|<cell|>|<cell|=<around|(|K<around|(|z,y|)>,T<rsup|\<ast\>>*K<around|(|z,x|)>|)>=<around|(|M<around|(|z,x|)>,K<around|(|z,y|)>|)>=M<around|(|y,x|)>=<wide|M<around|(|x,y|)>|\<bar\>>.<eq-number><label|eq:adjoint-correspondence>>>>>
    </align>

    This shows <math|T<rsup|\<ast\>>\<subset\>T> and consequently
    <math|T<rsup|\<ast\>>> is a closed symmetric operator.

    Let now <math|T<rprime|'>> be the restriction of <math|T> to
    <math|\<cal-J\><rprime|'>>. We have, by
    Theorem<nbsp><reference|thm:correspondence>,
    <math|T<rprime|'>\<subset\>T<rsup|\<ast\>>\<subset\>T<rprime|'><rsup|\<ast\>\<ast\>>>.
    Therefore <math|T<rprime|'><rsup|\<ast\>>\<subset\>T\<subset\>T<rprime|'><rsup|\<ast\>\<ast\>>>,
    which implies <math|T<rprime|'><rsup|\<ast\>\<ast\>>> exists. Since
    <math|T<rprime|'>\<subset\>T<rprime|'><rsup|\<ast\>\<ast\>>>, we get, by
    Theorem<nbsp><reference|thm:correspondence>,
    <math|T<rprime|'><rsup|\<ast\>\<ast\>>\<sim\>M<around|(|x,y|)>>. It
    follows that <math|T=T<rprime|'><rsup|\<ast\>\<ast\>>>. If
    <math|T<rprime|''>> is the closure of <math|T<rprime|'>>, then by general
    Hilbert space theory, <math|T<rprime|''>=T<rprime|'><rsup|\<ast\>\<ast\>>>.
    This shows that <math|T<rprime|''>=T<rsup|\<ast\>>>. Further, if <math|H>
    is any self-adjoint operator such that <math|H\<sim\>M<around|(|x,y|)>>,
    then <math|H\<subset\>T> and consequently
    <math|T<rsup|\<ast\>>\<subset\>H>.

    Consider now the Cayley transform, <math|V>, of <math|T<rsup|\<ast\>>>.
    The domain of <math|V> consists of elements of the form
    <math|<around|(|T<rsup|\<ast\>>+i*I|)>*g>, where
    <math|g\<in\>D<rsub|T<rsup|\<ast\>>>>. Since <math|T<rsup|\<ast\>>> is
    the closure of <math|T<rprime|'>>, the domain of <math|V> is the closure
    of the linear manifold determined by the set
    <math|<around|{|M<around|(|x,y|)>+i*K<around|(|x,y|)>|}>>. Consequently,
    <math|T<rsup|\<ast\>>> is self-adjoint if and only if the linear manifold
    determined by this set is dense in <math|\<cal-J\>>. Since
    <math|T<rsup|\<ast\>\<ast\>>=T>, <math|T<rsup|\<ast\>>> is self-adjoint
    if and only if <math|T> is self-adjoint.

    Let us now prove part (b) for the semi-bounded case. The bounded case
    will follow by similar reasoning. Suppose then that <math|H> is
    self-adjoint, <math|H\<sim\>M<around|(|x,y|)>>, and <math|H\<geq\>c*I>.
    Then, the self-adjoint operator <math|H<rsub|1>=H-c*I> is positive. Since
    <math|H<rsub|1>> is self-adjoint and <math|H<rsub|1>\<sim\>M<rsub|1><around|(|x,y|)>=M<around|(|x,y|)>-c*K<around|(|x,y|)>>,
    by Theorem<nbsp><reference|thm:correspondence>,
    <math|\<cal-J\><rprime|'>\<subset\>D<rsub|H<rsub|1>>> and consequently,

    <\align>
      <tformat|<table|<row|<cell|<big|sum><rsub|i,j=1><rsup|n>a<rsub|i><wide|a<rsub|j>|\<bar\>>M<rsub|1><around|(|y<rsub|j>,y<rsub|i>|)>>|<cell|=<big|sum><rsub|i,j=1><rsup|n>a<rsub|i><wide|a<rsub|j>|\<bar\>><around|(|H<rsub|1>*K<around|(|x,y<rsub|j>|)>,K<around|(|x,y<rsub|i>|)>|)>>>|<row|<cell|>|<cell|=<around*|(|H<rsub|1>*<big|sum><rsub|i=1><rsup|n>a<rsub|i>*K<around|(|x,y<rsub|i>|)>,<big|sum><rsub|i=1><rsup|n>a<rsub|i>*K<around|(|x,y<rsub|i>|)>|)>\<geq\>0.<eq-number><label|eq:positivity>>>>>
    </align>

    This establishes the necessity of (b).

    To prove the sufficiency of (b) suppose that
    <math|g\<in\>\<cal-J\><rprime|'>> is given by
    <math|g<around|(|x|)>=<big|sum><rsub|i=1><rsup|n>a<rsub|i>*K<around|(|x,y<rsub|i>|)>>.
    If <math|T\<doteq\>M<around|(|x,y|)>>, then by hypothesis,

    <\align>
      <tformat|<table|<row|<cell|<around|(|T<rsup|\<ast\>>*g,g|)>>|<cell|=<big|sum><rsub|i,j=1><rsup|n>a<rsub|i><wide|a<rsub|j>|\<bar\>>T<rsup|\<ast\>>*K<around|(|y<rsub|j>,y<rsub|i>|)>=<big|sum><rsub|i,j=1><rsup|n>a<rsub|i><wide|a<rsub|j>|\<bar\>>M<around|(|y<rsub|j>,y<rsub|i>|)>>>|<row|<cell|>|<cell|\<geq\>c*<big|sum><rsub|i,j=1><rsup|n>a<rsub|i><wide|a<rsub|j>|\<bar\>>K<around|(|y<rsub|j>,y<rsub|i>|)>=c*<around|(|g,g|)>.<eq-number><label|eq:lower-bound>>>>>
    </align>

    By part (a) we know that for any <math|f\<in\>D<rsub|T<rsup|\<ast\>>>>
    there exists a sequence <math|<around|{|f<rsub|n>|}>\<subset\>\<cal-J\><rprime|'>>
    such that <math|f<rsub|n>\<to\>f> and
    <math|T<rsup|\<ast\>>*f<rsub|n>\<to\>T<rsup|\<ast\>>*f>. Therefore, for
    any <math|f\<in\>D<rsub|T<rsup|\<ast\>>>>,
    <math|<around|(|T<rsup|\<ast\>>*f,f|)>\<geq\>c*<around|(|f,f|)>>, which
    shows that <math|T<rsup|\<ast\>>> is bounded below by <math|c>. Since
    <math|T<rsup|\<ast\>>> is closed and symmetric, by a well known theorem
    of the general theory of Hilbert space, it may be extended to a
    self-adjoint operator <math|H> with the same lower bound<footnote|Cf.
    Nagy <cite|nagy>, p. 35.>.
  </proof>

  <\theorem>
    <label|thm:real-operators>Let <math|\<cal-J\>> be a space which
    corresponds to a real space<footnote|These are spaces for which the r.k.
    is real. Cf. Aronszajn <cite|aronszajn2>, p. 354.>. Let
    <math|M<around|(|x,y|)>> be a real symmetric function defined over
    <math|E\<times\>E>, which for every <math|y\<in\>E> belongs to
    <math|\<cal-J\>>, when considered as a function of <math|x>.

    <\enumerate>
      <item>The same statement as in Theorem<nbsp><reference|thm:semi-bounded>(a)
      is true here.

      <item>There exists a real self-adjoint operator <math|H> such that
      <math|H\<sim\>M<around|(|x,y|)>>.
    </enumerate>
  </theorem>

  <\proof>
    The proof of part (a) is the same as in
    Theorem<nbsp><reference|thm:semi-bounded>.

    To prove (b), we notice that since <math|\<cal-J\>> corresponds to a real
    space, <math|g\<in\>\<cal-J\>> implies
    <math|<wide|g|\<bar\>>\<in\>\<cal-J\>>. Consider then
    <math|T\<doteq\>M<around|(|x,y|)>>; <math|T> is a real operator. For
    suppose <math|g\<in\>D<rsub|T>>; then
    <math|T*g<around|(|y|)>=<around|(|g<around|(|x|)>,M<around|(|x,y|)>|)>>
    is an element of <math|\<cal-J\>> and consequently
    <math|<wide|T*g<around|(|y|)>|\<bar\>>\<in\>\<cal-J\>>.

    Further,

    <\equation>
      <wide|T*g<around|(|y|)>|\<bar\>>=<wide|<around|(|g<around|(|x|)>,M<around|(|x,y|)>|)>|\<bar\>>=<around|(|<wide|g<around|(|x|)>|\<bar\>>,M<around|(|x,y|)>|)>=T*<wide|g|\<bar\>><around|(|y|)>.<label|eq:real-operator>
    </equation>

    Since <math|T> is real <math|T<rsup|\<ast\>>> is a real closed symmetric
    operator and consequently may be extended to a real self-adjoint
    operator<footnote|Cf. Nagy <cite|nagy>, p. 40.> <math|H>, with
    <math|H\<sim\>M<around|(|x,y|)>>.
  </proof>

  <section|Positive matrices represented by
  integrals><label|sec:integral-representation>

  N. Aronszajn <cite|aronszajn2> has shown that given any p.m.
  <math|K<around|(|x,y|)>>, for which <math|\<cal-J\>> is either a
  finite-dimensional space or a separable Hilbert space, there always exists
  a resolution of the identity <math|<around|{|E<rsub|\<lambda\>>|}>>, a set
  of functions <math|<around|{|k<around|(|x,\<lambda\>|)>|}>>, and an element
  <math|f<rsub|0>\<in\>\<cal-J\>> such that
  <math|<big|int><around|\||k<around|(|x,\<lambda\>|)>|\|><rsup|2>*d*<around|(|E<rsub|\<lambda\>>*f<rsub|0>,f<rsub|0>|)>\<less\>\<infty\>><footnote|Here
  and in what follows there will be no loss in generality if we assume that
  the functions being integrated are Borel measurable and finite at every
  real number so that the statements we shall make about integration with
  respect to a resolution of the identity have meaning. Absence of limits of
  integration shall always indicate that the integral is being taken from
  <math|-\<infty\>> to <math|+\<infty\>>.> and

  <\equation>
    K<around|(|x,y|)>=<big|int>k<around|(|x,\<lambda\>|)><wide|k<around|(|y,\<lambda\>|)>|\<bar\>>d*<around|(|E<rsub|\<lambda\>>*f<rsub|0>,f<rsub|0>|)>.<label|eq:aronszajn-representation>
  </equation>

  The problem in which we are interested here is to determine the space
  <math|\<cal-J\>> associated with the p.m. given by the integral
  <math|A<around|(|x,y|)>=<big|int>a*<around|(|x,\<lambda\>|)><wide|a*<around|(|y,\<lambda\>|)>|\<bar\>>d*V<around|(|\<lambda\>|)>>,
  where <math|<big|int><around|\||a*<around|(|x,\<lambda\>|)>|\|><rsup|2>*d*V<around|(|\<lambda\>|)>\<less\>\<infty\>>
  and <math|V<around|(|\<lambda\>|)>> is a bounded monotone increasing
  function which may be normed by the relations
  <math|V*<around|(|-\<infty\>|)>=0>, <math|V*<around|(|+\<infty\>|)>=V<around|(|\<lambda\>|)>>.
  The function <math|V<around|(|\<lambda\>|)>> gives rise to a measure and we
  are considering the integral in the Lebesgue-Radon-Stieltjes sense.

  Designate by <math|L<rsup|2><rsub|\<cal-C\>><around|(|V|)>> the Hilbert
  space which consists of equivalence classes of complex-valued measurable
  functions <math|f<around|(|\<lambda\>|)>> (with respect to the measure
  generated by <math|V>) such that <math|<big|int><around|\||f<around|(|\<lambda\>|)>|\|><rsup|2>*d*V<around|(|\<lambda\>|)>\<less\>\<infty\>>.
  We shall designate any equivalence class in
  <math|L<rsup|2><rsub|\<cal-C\>><around|(|V|)>> by any one of its elements.
  An inner product in <math|L<rsup|2><rsub|\<cal-C\>><around|(|V|)>> is then
  of course given by <math|<around|(|f,g|)>=<big|int>f<around|(|\<lambda\>|)><wide|g<around|(|\<lambda\>|)>|\<bar\>>d*V<around|(|\<lambda\>|)>>.

  Let <math|L<rsub|0>> be the subspace of
  <math|L<rsup|2><rsub|\<cal-C\>><around|(|V|)>> which consists of those
  elements <math|\<phi\>> such that <math|<big|int>a*<around|(|x,\<lambda\>|)>*\<phi\><around|(|\<lambda\>|)>*d*V<around|(|\<lambda\>|)>=0>
  for every <math|x\<in\>E>. Let <math|L<rsub|0><rsup|\<perp\>>> be the
  orthogonal complement of <math|L<rsub|0>>.

  <\theorem>
    <label|thm:integral-space>Let <math|A<around|(|x,y|)>> have an integral
    representation as above. Then, the space <math|\<cal-F\>> associated with
    <math|A<around|(|x,y|)>> is given by all functions of the form

    <\equation>
      f<around|(|x|)>=<big|int>a*<around|(|x,\<lambda\>|)>*\<phi\><around|(|\<lambda\>|)>*d*V<around|(|\<lambda\>|)>,<space|1em>\<phi\>\<in\>L<rsub|0><rsup|\<perp\>><around|(|V|)>.<label|eq:function-representation>
    </equation>

    Further,

    <\equation>
      <around|\<\|\|\>|f|\<\|\|\>><rsup|2>=min
      <big|int><around|\||\<phi\><around|(|\<lambda\>|)>|\|><rsup|2>*d*V<around|(|\<lambda\>|)>,<label|eq:norm-representation>
    </equation>

    where the minimum is taken over all <math|\<phi\>\<in\>L<rsub|0><rsup|\<perp\>><around|(|V|)>>
    such that <math|f<around|(|x|)>=<big|int>a*<around|(|x,\<lambda\>|)>*\<phi\><around|(|\<lambda\>|)>*d*V<around|(|\<lambda\>|)>>.

    Necessary and sufficient conditions that <math|L<rsub|0>> consists of the
    zero element only are that there exists a resolution of the identity
    <math|<around|{|E<rsub|\<lambda\>>|}>> over <math|\<cal-F\>> and an
    element <math|f<rsub|0>\<in\>\<cal-F\>> such that
    <math|V<around|(|\<lambda\>|)>=<around|(|E<rsub|\<lambda\>>*f<rsub|0>,f<rsub|0>|)>>
    and <math|A<around|(|x,y|)>=<big|int><wide|a*<around|(|y,\<lambda\>|)>|\<bar\>>d*E<rsub|\<lambda\>>*f<rsub|0><around|(|x|)>>.
  </theorem>

  <\proof>
    Consider the space <math|\<cal-J\><rsub|1>> given by all functions of the
    form <math|f<around|(|x|)>=<big|int>a*<around|(|x,\<lambda\>|)>*F<around|(|\<lambda\>|)>*d*V<around|(|\<lambda\>|)>>,
    with <math|F<around|(|\<lambda\>|)>\<in\>L<rsup|2><rsub|\<cal-C\>>>. If
    <math|g<around|(|x|)>=<big|int>a*<around|(|x,\<lambda\>|)>*G<around|(|\<lambda\>|)>*d*V<around|(|\<lambda\>|)>>,
    with <math|G<around|(|\<lambda\>|)>\<in\>L<rsup|2><rsub|\<cal-C\>>>,
    define an inner product by <math|<around|(|f,g|)>=<big|int>F<around|(|\<lambda\>|)><wide|G<around|(|\<lambda\>|)>|\<bar\>>d*V<around|(|\<lambda\>|)>>.
    This defines <math|<around|(|f,g|)>> uniquely.

    By the very definition of the class <math|L<rsub|0>> it is clear that
    <math|a*<around|(|x,\<lambda\>|)>\<in\>L<rsub|0><rsup|\<perp\>>> for
    every <math|x\<in\>E>. Therefore, <math|A<around|(|x,y|)>=<big|int>a*<around|(|x,\<lambda\>|)><wide|a*<around|(|y,\<lambda\>|)>|\<bar\>>d*V<around|(|\<lambda\>|)>>
    belongs to <math|\<cal-J\><rsub|1>> for all <math|y> and if
    <math|f\<in\>\<cal-J\><rsub|1>>, <math|f<around|(|y|)>=<big|int>a*<around|(|y,\<lambda\>|)>*F<around|(|\<lambda\>|)>*d*V<around|(|\<lambda\>|)>=<around|(|f<around|(|x|)>,A<around|(|x,y|)>|)>>.
    Since <math|\<cal-J\><rprime|'>\<subset\>\<cal-J\><rsub|1>> and
    <math|A<around|(|x,y|)>> acts as a r.k. for <math|\<cal-J\>> and
    <math|\<cal-J\><rsub|1>> we must have <math|\<cal-J\><rsub|1>=\<cal-J\>>.
    The first part of our theorem is now an immediate consequence of this
    fact.

    To prove the necessity of the second part of the theorem we suppose
    <math|L<rsub|0>> consists only of the zero element. If
    <math|g<around|(|x|)>=<big|int>a*<around|(|x,\<lambda\>|)>*G<around|(|\<lambda\>|)>*d*V<around|(|\<lambda\>|)>>,
    with <math|G<around|(|\<lambda\>|)>\<in\>L<rsup|2><rsub|\<cal-C\>><around|(|V|)>>,
    define

    <\equation>
      E<rsub|T>*g<around|(|x|)>=<big|int>a*<around|(|x,\<lambda\>|)>*G<rsub|T><around|(|\<lambda\>|)>*d*V<around|(|\<lambda\>|)>,<label|eq:resolution-definition>
    </equation>

    where

    <\equation>
      G<rsub|T><around|(|\<lambda\>|)>=<choice|<tformat|<table|<row|<cell|G<around|(|\<lambda\>|)>>|<cell|<text|for
      >-\<infty\>\<leq\>\<lambda\>\<leq\>T,>>|<row|<cell|0>|<cell|<text|for
      >T\<less\>\<lambda\>\<leq\>\<infty\>.>>>>><label|eq:cutoff-function>
    </equation>

    It is easy to verify that <math|<around|{|E<rsub|T>|}>> is a resolution
    of the identity. Now, if <math|F<rsub|0><around|(|\<lambda\>|)>=1>, then
    since <math|V<around|(|\<lambda\>|)>> is bounded,
    <math|F<rsub|0><around|(|\<lambda\>|)>\<in\>L<rsup|2><rsub|\<cal-C\>><around|(|V|)>>.
    Consequently, if we set <math|f<rsub|0><around|(|x|)>=<big|int>a*<around|(|x,\<lambda\>|)>*F<rsub|0><around|(|\<lambda\>|)>*d*V<around|(|\<lambda\>|)>>,
    then <math|<around|(|E<rsub|T>*f<rsub|0>,f<rsub|0>|)>=V<around|(|\<lambda\>|)>>
    and <math|A<around|(|x,y|)>=<big|int><wide|a*<around|(|y,\<lambda\>|)>|\<bar\>>d*E<rsub|\<lambda\>>*f<rsub|0><around|(|x|)>>.

    To prove the sufficiency, we suppose that
    <math|V<around|(|\<lambda\>|)>=<around|(|E<rsub|\<lambda\>>*f<rsub|0>,f<rsub|0>|)>>.
    Let <math|\<phi\><around|(|\<lambda\>|)>\<in\>L<rsub|0>> and consider the
    normal operator <math|T=<big|int>\<phi\><around|(|\<lambda\>|)>*d*E<rsub|\<lambda\>>>.
    We know that <math|f<rsub|0>\<in\>D<rsub|T>> since
    <math|<big|int><around|\||\<phi\><around|(|\<lambda\>|)>|\|><rsup|2>*d*<around|(|E<rsub|\<lambda\>>*f<rsub|0>,f<rsub|0>|)>\<less\>\<infty\>>.
    Consider also the Abelian system of normal operators<footnote|An Abelian
    system of normal operators is a set of normal operators which commute
    with each other.> <math|T<rsub|x>=<big|int>a*<around|(|x,\<lambda\>|)>*d*E<rsub|\<lambda\>>>.
    It is clear that <math|f<rsub|0>\<in\>D<rsub|T<rsub|x>>> and further, by
    hypotheses, <math|T<rsub|x>*f<rsub|0><around|(|y|)>=A<around|(|x,y|)>>.
    We have then, for every <math|x\<in\>E>,
    <math|<around|(|T*f<rsub|0>,T<rsub|x>*f<rsub|0>|)>=<big|int>a*<around|(|x,\<lambda\>|)>*\<phi\><around|(|\<lambda\>|)>*d*<around|(|E<rsub|\<lambda\>>*f<rsub|0>,f<rsub|0>|)>=0>.
    It follows that since the linear manifold determined by the set
    <math|<around|{|T<rsub|x>*f<rsub|0>|}>> is dense in <math|\<cal-J\>>,
    <math|T*f<rsub|0>=0>. Consequently, if
    <math|\<lambda\><rsub|1>\<less\>\<lambda\><rsub|2>>,
    <math|<around|(|<around|(|E<rsub|\<lambda\><rsub|2>>-E<rsub|\<lambda\><rsub|1>>|)>*T*f<rsub|0>,f<rsub|0>|)>=<big|int><rsub|I>\<phi\><around|(|\<lambda\>|)>*d*<around|(|E<rsub|\<lambda\>>*f<rsub|0>,f<rsub|0>|)>=0>,
    where <math|I> is the half open interval
    <math|<around|(|\<lambda\><rsub|1>,\<lambda\><rsub|2>|]>>. This means
    that <math|\<phi\><around|(|\<lambda\>|)>> must be zero almost everywhere
    (with respect to the measure generated by <math|V<around|(|t|)>>).
  </proof>

  <section|The main theorem><label|sec:main-theorem>

  In this section we shall work with special types of positive matrices,
  namely positive definite functions which we described in the introduction.
  Before we state and prove our main theorem we shall say a few words about
  the notations used.

  We shall designate vectors in an <math|n>-dimensional Euclidean space,
  <math|E<rsub|n><around|(|u|)>>, by the lower case latin letters
  <math|a,b,c,d> and <math|s,t,u,x,y> and the components by corresponding
  latin letters with superscripts (e.g. <math|x<rsup|<around|(|n|)>>=<around|(|x<rsup|<around|(|1|)>>,x<rsup|<around|(|2|)>>,\<ldots\>,x<rsup|<around|(|n|)>>|)>>).
  The "unit" vectors <math|u<rsub|k>> will be those for which
  <math|u<rsub|k><rsup|<around|(|i|)>>=\<delta\><rsub|j*k>>, where
  <math|\<delta\><rsub|j*k>> is the Kronecker symbol. Real numbers will be
  designated either by the lower case latin letters given above the
  superscripts (as for the components) or by lower case greek letters. The
  scalar or dot product of two vectors we shall designate by
  <math|x\<cdot\>y> and shall write <math|x\<geq\>y> if
  <math|x<rsup|<around|(|i|)>>\<geq\>y<rsup|<around|(|i|)>>> for
  <math|i=1,\<ldots\>,n>. If <math|t> is the vector
  <math|t=<around|(|t<rsup|<around|(|1|)>>,\<ldots\>,t<rsup|<around|(|n|)>>|)>>,
  by <math|t<rsup|s>> we shall mean the product
  <math|<big|prod><rsub|i=1><rsup|n><around|(|t<rsup|<around|(|i|)>>|)><rsup|s<rsup|<around|(|i|)>>>>.

  If <math|V<around|(|t|)>=V<around|(|t<rsup|<around|(|1|)>>,\<ldots\>,t<rsup|<around|(|n|)>>|)>>
  is a real-valued function with domain <math|E<rsub|n>>, we shall say that
  <math|V<around|(|t|)>> is monotone increasing if for any interval <math|I>,
  defined by all <math|t> such that <math|a\<less\>t\<less\>b>, we have

  <\equation>
    \<nu\><around|(|I|)>=<big|sum><rsub|\<epsilon\><rsub|1>,\<ldots\>,\<epsilon\><rsub|n-1>,2><around|(|-1|)><rsup|\<epsilon\><rsub|1>+\<cdots\>+\<epsilon\><rsub|n>>*V<around|(|c<rsup|<around|(|\<epsilon\><rsub|1>|)>>,\<ldots\>,c<rsup|<around|(|\<epsilon\><rsub|n>|)>>|)>\<geq\>0,<label|eq:monotone-increasing>
  </equation>

  where <math|c<rsup|<around|(|i|)>>-a<rsup|<around|(|i|)>>>,
  <math|c<rsup|<around|(|i|)>>=b<rsup|<around|(|i|)>>>. The interval function
  <math|\<nu\><around|(|I|)>> is an additive function of an interval and
  consequently it defines a corresponding Lebesgue-Radon-Stieltjes
  measure<footnote|For a discussion of such functions see J. V. Neumann
  <cite|neumann>, pp. 160-172.>. When we write
  <math|<big|int><rsub|Q>F<around|(|t|)>*d*V<around|(|t|)>> we shall mean the
  Lebesgue-Radon-Stieltjes integral with respect to this measure over some
  measurable set <math|Q>. When we write <math|<big|int><rsub|a><rsup|b>F<around|(|t|)>*d*V<around|(|t|)>>
  we shall always mean that the integral is taken over the closed interval
  <math|a\<leq\>t\<leq\>b>. We shall say that two monotone increasing
  functions are substantially equal if they both generate the same measure
  function. The spectrum of the function <math|V<around|(|t|)>> is the set of
  points <math|t\<in\>E<rsub|n>> such that
  <math|\<nu\><around|(|I|)>\<neq\>0> for every open interval <math|I>
  containing <math|t>.

  In Ÿ<reference|sec:semi-bounded> we used the notation
  <math|M<rsub|1><around|(|x,y|)>\<leq\><rsub|K>M<rsub|2><around|(|x,y|)>>.
  In this section we shall have occasion to use the condition
  <math|\<alpha\>*K<around|(|x,y|)>\<leq\><rsub|K>M<around|(|x,y|)>\<leq\><rsub|K>\<beta\>*K<around|(|x,y|)>>.
  Let us agree that if <math|\<alpha\>=-\<infty\>> or
  <math|\<beta\>=+\<infty\>>, then the respective inequalities
  <math|\<alpha\>*K<around|(|x,y|)>\<leq\><rsub|K>M<around|(|x,y|)>> or
  <math|M<around|(|x,y|)>\<leq\><rsub|K>\<beta\>*K<around|(|x,y|)>> are
  always true regardless of the functions <math|K> and <math|M>.

  For the following considerations we find it convenient to consider a
  certain subspace of the <math|<around|(|n+m|)>>-dimensional unitary space
  with elements <math|w=<around|(|w<rsup|<around|(|-1|)>>,\<ldots\>,w<rsup|<around|(|-n+m|)>>|)>>,
  <math|w<rsup|<around|(|j|)>>>, <math|j=1,\<ldots\>,n+m>, a complex number.
  As before the scalar or dot product of two such vectors <math|v> and
  <math|w> will be indicated by <math|v\<cdot\>w>. We first consider the
  vectors <math|x=<around|(|x<rsup|<around|(|1|)>>,\<ldots\>,x<rsup|<around|(|n|)>>,0,\<ldots\>,0|)>>
  and <math|y=<around|(|0,\<ldots\>,0,y<rsup|<around|(|n+1|)>>,\<ldots\>,y<rsup|<around|(|n+m|)>>|)>>.
  We shall then consider the subspace which consists of elements of the form
  <math|z=x+i*y>, <math|i=<around|(|-1|)><rsup|1/2>>. Using the terminology
  of the complex number system we shall call <math|x> the real part of
  <math|z>, <math|y> the imaginary part of <math|z>, and write
  <math|R<around|(|z|)>=x>, <math|I<around|(|z|)>=y>,
  <math|<wide|z|\<bar\>>=x-i*y>.

  In the theorem which follows we use the following notation:
  <math|a=<around|(|a<rsup|<around|(|1|)>>,\<ldots\>,a<rsup|<around|(|n|)>>,-d<rsup|<around|(|n+1|)>>,\<ldots\>,-d<rsup|<around|(|n+m|)>>|)>>,
  <math|b=<around|(|b<rsup|<around|(|1|)>>,\<ldots\>,b<rsup|<around|(|n|)>>,d<rsup|<around|(|n+1|)>>,\<ldots\>,d<rsup|<around|(|n+m|)>>|)>>,
  <math|c=<around|(|c<rsup|<around|(|1|)>>,\<ldots\>,c<rsup|<around|(|n|)>>,0,\<ldots\>,0|)>>,
  <math|d=<around|(|0,\<ldots\>,0,d<rsup|<around|(|n+1|)>>,\<ldots\>,d<rsup|<around|(|n+m|)>>|)>>,
  <math|s=<around|(|0,\<ldots\>,0,s<rsup|<around|(|n+1|)>>,\<ldots\>,s<rsup|<around|(|n+m|)>>|)>>,
  <math|t=<around|(|t<rsup|<around|(|1|)>>,\<ldots\>,t<rsup|<around|(|n+m|)>>|)>>,
  where <math|b<rsup|<around|(|i|)>>\<geq\>0> and
  <math|a<rsup|<around|(|i|)>>\<leq\>b<rsup|<around|(|i|)>>>. The numbers
  <math|a<rsup|<around|(|i|)>>> may take on the value <math|-\<infty\>>,
  <math|b<rsup|<around|(|i|)>>> and <math|d<rsup|<around|(|i|)>>> the value
  <math|+\<infty\>>, and <math|-\<infty\>\<leq\>c<rsup|<around|(|i|)>>\<less\>0>.
  The numbers <math|m> and <math|n> may take on any positive value or 0. The
  vector <math|z> shall be as described above.

  <\theorem>
    <label|thm:main>Let <math|f<around|(|z|)>> be a continuous complex-valued
    function defined for <math|R<around|(|z|)>\<gtr\>c> and
    <math|-\<infty\>\<less\>I<around|(|z|)>\<less\>\<infty\>>. Necessary and
    sufficient conditions that there exists a bounded monotone increasing
    function <math|V<around|(|t|)>> whose spectrum is contained in the
    interval <math|a\<leq\>t\<leq\>b> and such that

    <\equation>
      f<around|(|z|)>=<big|int><rsub|a><rsup|b>e<rsup|i*z\<cdot\>t>*d*V<around|(|t|)><label|eq:main-representation>
    </equation>

    are:

    <\enumerate>
      <item><math|f*<around|(|z<rsub|1>+z<rsub|2>|)>\<geq\><rsub|0>>.

      <item><math|e<rsup|a<rsup|<around|(|k|)>>*u<rsub|k>>*f*<around|(|z<rsub|1>+z<rsub|2>|)>\<leq\><rsub|K>f*<around|(|z<rsub|1>+z<rsub|2>+u<rsub|k>|)>\<leq\><rsub|K>e<rsup|b<rsup|<around|(|k|)>>*u<rsub|k>>*f*<around|(|z<rsub|1>+z<rsub|2>|)>>,
      for <math|k=1,2,\<ldots\>,n>.

      <item>There exists a sequence <math|s<rsub|r>\<to\>\<infty\>> such that
      <math|s<rsub|r><rsup|<around|(|k|)>>\<gtr\>0> if
      <math|d<rsup|<around|(|k|)>>\<less\>\<infty\>>,
      <math|s<rsub|r><rsup|<around|(|k|)>>=0> if
      <math|d<rsup|<around|(|k|)>>=\<infty\>>,
      <math|s<rsub|r><rsup|<around|(|k|)>>*d<rsup|<around|(|k|)>>\<less\>\<pi\>><footnote|Define
      <math|0\<cdot\>\<infty\>=0>>, and, for <math|r=1,2,\<ldots\>>, and,
      <math|k=n+1,\<ldots\>,n+m>,

      <\equation>
        f*<around|(|z<rsub|1>+z<rsub|2>-i*s<rsub|r>\<cdot\>u<rsub|k>|)>+f*<around|(|z<rsub|1>+z<rsub|2>+i*s<rsub|r>\<cdot\>u<rsub|k>|)>\<geq\><rsub|K>2*cos
        <around|(|s<rsub|r>*d<rsup|<around|(|k|)>>|)>*f*<around|(|z<rsub|1>+z<rsub|2>|)>.<label|eq:cosine-condition>
      </equation>
    </enumerate>

    If there exists another bounded monotone function
    <math|V<rsub|1><around|(|t|)>> whose spectrum is contained in the
    interval <math|a\<leq\>t\<leq\>b> and which satisfies
    <eqref|eq:main-representation>, then <math|V<rsub|1><around|(|t|)>> and
    <math|V<around|(|t|)>> are substantially equal.
  </theorem>

  The proof of this theorem will be constructed from a number of lemmas. In
  the first five of the following lemmas we shall be working in the
  1-dimensional case.

  <\lemma>
    <label|lem:one-dimensional>Let <math|f<around|(|m|)>> be a function
    defined on the positive integers and zero. Necessary and sufficient
    conditions that there exists a bounded monotone increasing function,
    <math|V<around|(|t|)>>, whose spectrum is contained in the interval
    <math|a\<leq\>t\<leq\>b> (<math|a> may take the value
    <math|<around|(|-\<infty\>|)>>, <math|b> the value
    <math|<around|(|+\<infty\>|)>>) and such that

    <\equation>
      f<around|(|m|)>=<big|int><rsub|a><rsup|b>t<rsup|m>*d*V<around|(|t|)><label|eq:moment-representation>
    </equation>

    are:

    <\enumerate>
      <item><math|f*<around|(|m+n|)>\<geq\><rsub|0>>.

      <item><math|a\<cdot\>u<rsub|1>*f*<around|(|m+n|)>\<leq\><rsub|K>f*<around|(|m+n+1|)>\<leq\><rsub|K>b\<cdot\>u<rsub|1>*f*<around|(|m+n|)>>.
    </enumerate>

    If <math|T\<leftrightarrow\>f*<around|(|m+n+1|)>>, the transformation
    <math|T<rsup|\<ast\>>> has either the deficiency index
    <math|<around|(|1,1|)>> or <math|<around|(|0,0|)>>. In case the
    deficiency index is <math|<around|(|0,0|)>> the function
    <math|V<around|(|t|)>> is substantially unique.
  </lemma>

  <\proof>
    The necessity of conditions (1) and (2) is quite clear.

    To prove the sufficiency of these conditions we note that since
    <math|f*<around|(|m+n|)>> and <math|f*<around|(|m+n+1|)>> are real, then
    by either Theorem<nbsp><reference|thm:semi-bounded> or
    Theorem<nbsp><reference|thm:real-operators> there exists a self-adjoint
    operator <math|H\<sim\>f*<around|(|m+n+1|)>> such that
    <math|a\<cdot\>u<rsub|1>*I\<leq\>H\<leq\>b\<cdot\>u<rsub|1>*I>, where
    <math|I> is the identity operator. Let <math|<around|{|E<rsub|t>|}>> be
    the canonical resolution of the identity which corresponds to <math|H>.
    We may then write

    <\equation>
      H<rsup|m>=<big|int><rsub|a><rsup|b>t<rsup|m>*d*E<rsub|t><label|eq:spectral-representation>
    </equation>

    for any integer <math|m>.

    By Theorem<nbsp><reference|thm:correspondence>,
    <math|\<cal-J\><rprime|'>\<subset\>D<rsub|H>>. Further, since
    <math|H*f*<around|(|p+q|)>\<in\>\<cal-J\><rprime|'>> for every <math|q>,
    it follows that <math|\<cal-J\><rprime|'>\<subset\>D<rsub|H<rsup|m>>> and
    that <math|H<rsup|m>*f*<around|(|p+q|)>=f*<around|(|p+q+m|)>>.
    Consequently, since <math|f*<around|(|p+q|)>> is a r.k., we have

    <\equation>
      f<around|(|m|)>=<around|(|H<rsup|m>*f<around|(|p|)>,f<around|(|p|)>|)>=<big|int><rsub|a><rsup|b>t<rsup|m>*d*<around|(|E<rsub|t>*f,f|)>.<label|eq:moment-formula>
    </equation>

    This completes the proof of the first part of the lemma<footnote|The
    proof of representation presents familiar arguments in the application of
    Hilbert space theory to moment problems. Cf. Krein and Krasnoselskiï
    <cite|krein-krasnoselskii>. We give the proof here for completeness.>.

    To prove the second part of the lemma we note that the deficiency spaces
    of <math|T<rsup|\<ast\>>> are given respectively by the elements <math|g>
    and <math|h> of <math|\<cal-J\>> for which <math|T*g=i*g> or
    <math|T*h=-i*h>. Since <math|T<rsup|\<ast\>>> is real, the dimensions of
    the deficiency spaces must be the same. For the case where <math|T*g=i*g>
    we get <math|g<around|(|m|)>=i<rsup|m>*g<around|(|0|)>>. This shows that
    the deficiency index can at most be <math|<around|(|1,1|)>>.

    Suppose now that the deficiency index of <math|T<rsup|\<ast\>>> is
    <math|<around|(|0,0|)>>, that is, <math|T> is self-adjoint. We wish to
    show that the <math|V<around|(|t|)>> of the lemma is substantially
    unique. Suppose then that <math|V<around|(|t|)>> is such a function and
    <math|f<around|(|m|)>> has the representation

    <\equation>
      f<around|(|m|)>=<big|int>t<rsup|m>*d*V<around|(|t|)>.<label|eq:alternative-representation>
    </equation>

    We may further suppose, without loss of generality, that
    <math|V<around|(|t|)>> is normed by the conditions
    <math|V*<around|(|t+0|)>=V<around|(|t|)>> and
    <math|V*<around|(|-\<infty\>|)>=0>.

    By Theorem<nbsp><reference|thm:integral-space> we know that
    <math|L<rsup|2><rsub|\<cal-C\>><around|(|V|)>> may be written as
    <math|L<rsup|2><rsub|\<cal-C\>><around|(|V|)>=L<rsub|0>\<oplus\>L<rsub|0><rsup|\<perp\>>>
    and that every element <math|g> of <math|\<cal-J\>> is given by

    <\equation>
      g<around|(|m|)>=<big|int>t<rsup|m>*G<around|(|t|)>*d*V<around|(|t|)>,<label|eq:function-integral>
    </equation>

    where <math|G<around|(|t|)>\<in\>L<rsub|0><rsup|\<perp\>>>. Consider the
    class <math|D<rsub|H>> of elements <math|G<around|(|t|)>\<in\>L<rsub|0><rsup|\<perp\>>>
    such that <math|t*G<around|(|t|)>\<in\>L<rsub|0><rsup|\<perp\>>>. By
    means of the integral in <eqref|eq:function-integral> this class <math|D>
    gives rise to a class <math|D<rsub|H>\<subset\>\<cal-J\>> which certainly
    contains the linear manifold <math|\<cal-J\><rprime|'>>.

    If <math|g\<in\>D<rsub|H>> is given by <eqref|eq:function-integral>,
    define the operator <math|H> by the relation

    <\equation>
      H*g<around|(|m|)>=<big|int>t<rsup|m>\<cdot\>t\<cdot\>G<around|(|t|)>*d*V<around|(|t|)>.<label|eq:operator-definition>
    </equation>

    It is clear that <math|H\<subset\>T> and that <math|H> is symmetric.
    Further <math|H> is closed. For suppose there exists a sequence
    <math|<around|{|g<rsub|r>|}>\<subset\>D<rsub|H>> such that
    <math|g<rsub|r>\<to\>g\<in\>\<cal-J\>> and <math|H*g<rsub|r>> converges.
    We have

    <\align>
      <tformat|<table|<row|<cell|g<rsub|r><around|(|m|)>>|<cell|=<big|int>t<rsup|m>*G<rsub|r><around|(|t|)>*d*V<around|(|t|)>,<space|1em>G<rsub|r><around|(|t|)>\<in\>L<rsub|0><rsup|\<perp\>>,<eq-number>>>|<row|<cell|g<around|(|m|)>>|<cell|=<big|int>t<rsup|m>*G<around|(|t|)>*d*V<around|(|t|)>,<space|1em>G<around|(|t|)>\<in\>L<rsub|0><rsup|\<perp\>>.<eq-number><label|eq:convergence-setup>>>>>
    </align>

    Therefore,

    <\equation>
      <around|\<\|\|\>|g<rsub|r>-g|\<\|\|\>><rsup|2>=<big|int><around|\||G<rsub|r><around|(|t|)>-G<around|(|t|)>|\|><rsup|2>*d*V<around|(|t|)>\<to\>0*<text|as
      >r\<to\>\<infty\>,<label|eq:norm-convergence>
    </equation>

    and

    <\equation>
      <around|\<\|\|\>|H*<around|(|g<rsub|p>-g<rsub|q>|)>|\<\|\|\>><rsup|2>=<big|int><around|\||t*G<rsub|p><around|(|t|)>-t*G<rsub|q><around|(|t|)>|\|><rsup|2>*d*V<around|(|t|)>\<to\>0*<text|as
      >p,q\<to\>\<infty\>.<label|eq:operator-convergence>
    </equation>

    Consequently, there exists a <math|\<Phi\><around|(|t|)>\<in\>L<rsub|0><rsup|\<perp\>>>
    such that

    <\equation>
      <big|int><around|\||t*G<rsub|r><around|(|t|)>-\<Phi\><around|(|t|)>|\|><rsup|2>*d*V<around|(|t|)>\<to\>0.<label|eq:limit-function>
    </equation>

    It is clear that

    <\equation>
      <big|int><around|\||t*G<rsub|r><around|(|t|)>-\<Phi\><around|(|t|)>|\|>*d*V<around|(|t|)>=<big|int><rsub|R><around|\||t*G<rsub|r><around|(|t|)>-\<Phi\><around|(|t|)>|\|><rsup|2>*d*V<around|(|t|)>,<label|eq:integral-equality>
    </equation>

    where <math|R> is the whole real axis minus the point <math|t=0>. On
    <math|R> consider the function <math|\<psi\><around|(|t|)>=\<Phi\><around|(|t|)>/t>.
    Let <math|\<eta\>\<gtr\>0> and <math|R<rsub|\<eta\>>> be the union of the
    intervals <math|<around|[|-\<infty\>,-\<eta\>|]>> and
    <math|<around|[|\<eta\>,\<infty\>|]>>. It follows that

    <\equation>
      \<eta\><rsup|2>*<big|int><rsub|R<rsub|\<eta\>>><around|\||G<rsub|r><around|(|t|)>-\<psi\><around|(|t|)>|\|><rsup|2>*d*V<around|(|t|)>\<leq\><big|int><rsub|R<rsub|\<eta\>>><around|\||t*G<rsub|r><around|(|t|)>-\<Phi\><around|(|t|)>|\|><rsup|2>*d*V<around|(|t|)>.<label|eq:eta-bound>
    </equation>

    Consequently, <math|<big|int><rsub|R<rsub|\<eta\>>><around|\||G<rsub|r><around|(|t|)>-\<psi\><around|(|t|)>|\|><rsup|2>*d*V<around|(|t|)>\<to\>0>
    which implies that <math|<big|int><rsub|R<rsub|\<eta\>>><around|\||\<psi\><around|(|t|)>|\|><rsup|2>*d*V<around|(|t|)>\<less\>\<infty\>>.
    Further, since <math|<big|int><rsub|R<rsub|\<eta\>>><around|\||G<rsub|r><around|(|t|)>-G<around|(|t|)>|\|><rsup|2>*d*V<around|(|t|)>\<to\>0>,
    we must have that <math|\<psi\><around|(|t|)>> and <math|G<around|(|t|)>>
    differ only on a set of measure (generated by <math|V>) zero on
    <math|R<rsub|\<eta\>>>. Since <math|\<eta\>> is arbitrary, this must also
    be true for <math|R>.

    Define <math|\<psi\><around|(|0|)>=G<around|(|0|)>>. With this definition
    <math|\<psi\><around|(|t|)>\<in\>L<rsub|0><rsup|\<perp\>>>. Now,
    <math|t*\<psi\><around|(|t|)>=\<Phi\><around|(|t|)>> for
    <math|t\<neq\>0>. If <math|V*<around|(|0+0|)>-V*<around|(|0-0|)>\<neq\>0>,
    <math|\<Phi\><around|(|0|)>=0>, <math|\<psi\><around|(|0|)>> is finite
    and therefore <math|\<psi\><around|(|t|)>=\<Phi\><around|(|t|)>> for all
    <math|t>. Consequently, <math|t*\<psi\><around|(|t|)>\<in\>L<rsub|0><rsup|\<perp\>>>.
    Therefore, <math|g\<in\>D<rsub|H>> and <math|H*g<rsub|r>\<to\>H*g>. This
    proves that <math|H> is closed. Further, since
    <math|\<cal-J\><rprime|'>\<subset\>D<rsub|H>>, we must have
    <math|T<rsup|\<ast\>>=T\<subset\>H> which means <math|T=H>.

    Let <math|g<around|(|m|)>> be given as in <eqref|eq:function-integral>.
    Define

    <\equation>
      B<rsub|\<lambda\>>*g<around|(|m|)>=<big|int>t<rsup|m>*G<rsub|\<lambda\>><around|(|t|)>*d*V<around|(|t|)>,<label|eq:spectral-family>
    </equation>

    where <math|G<rsub|\<lambda\>><around|(|t|)>=G<around|(|t|)>> for
    <math|-\<infty\>\<leq\>t\<leq\>\<lambda\>>, and
    <math|G<rsub|\<lambda\>><around|(|t|)>=0> for
    <math|\<lambda\>\<less\>t\<leq\>\<infty\>>. It is easily checked that the
    set <math|<around|{|B<rsub|\<lambda\>>|}>>,
    <math|-\<infty\>\<less\>\<lambda\>\<less\>\<infty\>>, is a monotone
    increasing set of bounded self-adjoint operators such that

    <\equation>
      B<rsub|\<lambda\>+0>=B<rsub|\<lambda\>>,<space|1em>lim<rsub|\<lambda\>\<to\>-\<infty\>>
      B<rsub|\<lambda\>>=0,<space|1em>lim<rsub|\<lambda\>\<to\>\<infty\>>
      B<rsub|\<lambda\>>=I,<space|1em><text|and
      ><around|(|B<rsub|\<lambda\>>*f,f|)>=V<around|(|\<lambda\>|)>.<label|eq:spectral-properties>
    </equation>

    We have <math|<around|(|T*g,h|)>=<big|int>t*d*<around|(|B<rsub|\<lambda\>>*g,h|)>>,
    and consequently we may write, symbolically,
    <math|T=<big|int>t*d*B<rsub|\<lambda\>>>. <math|D<rsub|T>=D<rsub|H>> is
    the set of all <math|g\<in\>\<cal-J\>> such that
    <math|<big|int><around|\||t|\|><rsup|2>*d*<around|(|B<rsub|\<lambda\>>*g,g|)>\<less\>\<infty\>>.
    It is clear that if <math|m> is an integer,
    <math|<around|(|T<rsup|m>*g,h|)>=<big|int>t<rsup|m>*d*<around|(|B<rsub|\<lambda\>>*g,h|)>>.

    Any operator <math|B<rsub|\<lambda\>>> commutes with <math|T>. For, if
    <math|g\<in\>D<rsub|T>>, <math|B<rsub|\<lambda\>>*T*g<around|(|m|)>=<big|int>t<rsup|m>\<cdot\>t\<cdot\>G<rsub|\<lambda\>><around|(|t|)>*d*V<around|(|t|)>>.
    Therefore, <math|B<rsub|\<lambda\>>*T*g<around|(|m|)>> is
    <math|B<rsub|\<lambda\>>*g> evaluated at the point <math|m+1>. But since
    <math|T\<leftrightarrow\>f*<around|(|p+q+1|)>>,
    <math|B<rsub|\<lambda\>>*g\<in\>D<rsub|T>> and
    <math|T*B<rsub|\<lambda\>>*g=B<rsub|\<lambda\>>*T*g>.

    Since <math|T> is self-adjoint, there exist orthogonal subspaces
    <math|M<rsub|k>>, <math|k=1,2,\<ldots\>>, such that <math|M<rsub|k>>
    reduces <math|T> and <math|T> may be considered as
    <math|<big|sum><rsub|k=1><rsup|\<infty\>>\<oplus\>T<rsub|k>> where
    <math|T<rsub|k>> is a bounded self-adjoint operator on <math|M<rsub|k>>
    and is the restriction of <math|T> to <math|M<rsub|k>><footnote|Cf. Nagy
    <cite|nagy>, pp. 48-49.>. Since <math|B<rsub|\<lambda\>>> commutes with
    <math|T>, <math|M<rsub|k>> reduces <math|B<rsub|\<lambda\>>>. Let
    <math|B<rsub|\<lambda\>><rsup|<around|(|k|)>>> be the restriction of
    <math|B<rsub|\<lambda\>>> to <math|M<rsub|k>>. We may then write,
    symbolically, <math|T<rsub|k>=<big|int>t*d*B<rsub|\<lambda\>><rsup|<around|(|k|)>>>.

    Suppose that <math|\<beta\><rsub|k>> is the upper and
    <math|\<alpha\><rsub|k>> the lower bound of <math|T<rsub|k>>. Suppose
    further that <math|\<mu\>\<gtr\>\<nu\>\<geq\>\<beta\><rsub|k>>; then
    since <math|B<rsub|\<lambda\>><rsup|<around|(|k|)>><around|(|\<mu\>|)>-B<rsub|\<lambda\>><rsup|<around|(|k|)>><around|(|\<nu\>|)>>
    is positive and commutes with <math|T<rsub|k>>, we have

    <\equation>
      0\<leq\><around|(|B<rsub|\<lambda\>><rsup|<around|(|k|)>><around|(|\<mu\>|)>-B<rsub|\<lambda\>><rsup|<around|(|k|)>><around|(|\<nu\>|)>|)>*<around|(|\<nu\>*I-T<rsub|k>|)>=<big|int><rsub|J><around|(|\<nu\>-\<lambda\>|)>*d*B<rsub|\<lambda\>><rsup|<around|(|k|)>>\<leq\>0,<label|eq:spectral-bound>
    </equation>

    where <math|J> is the interval <math|<around|(|\<nu\>,\<mu\>|]>>.
    Consequently, the only possibility is that
    <math|B<rsub|\<lambda\>><rsup|<around|(|k|)>><around|(|\<mu\>|)>-B<rsub|\<lambda\>><rsup|<around|(|k|)>><around|(|\<nu\>|)>=0>.
    Similarly, if <math|\<nu\>\<less\>\<alpha\><rsub|k>>,
    <math|B<rsub|\<lambda\>><rsup|<around|(|k|)>><around|(|\<nu\>|)>=0>.
    Therefore,

    <\equation>
      T<rsub|k>=<big|int><rsub|\<alpha\><rsub|k>><rsup|\<beta\><rsub|k>>t*d*B<rsub|\<lambda\>><rsup|<around|(|k|)>>=<big|int><rsub|\<alpha\><rsub|k>><rsup|\<beta\><rsub|k>>t*d*E<rsub|\<lambda\>><rsup|<around|(|k|)>>,<label|eq:reduced-spectral>
    </equation>

    where <math|<around|{|E<rsub|\<lambda\>><rsup|<around|(|k|)>>|}>> is the
    resolution of the identity associated with <math|T<rsub|k>>. If we apply
    the Weierstrass approximation theorem we get
    <math|B<rsub|\<lambda\>><rsup|<around|(|k|)>>=E<rsub|\<lambda\>><rsup|<around|(|k|)>>>,
    <math|k=1,2,\<ldots\>>. Since <math|B<rsub|\<lambda\>>> may be considered
    as <math|<big|sum><rsub|k=1><rsup|\<infty\>>\<oplus\>B<rsub|\<lambda\>><rsup|<around|(|k|)>>>,
    we have <math|B<rsub|\<lambda\>>=E<rsub|\<lambda\>>>, where
    <math|<around|{|E<rsub|\<lambda\>>|}>> is the canonical resolution of the
    identity of <math|T>. Consequently <math|V<around|(|\<lambda\>|)>=<around|(|E<rsub|\<lambda\>>*f,f|)>>,
    which completes the proof of the lemma.
  </proof>

  Now, let <math|K<around|(|x,y|)>=f*<around|(|x+y|)>> be a positive matrix
  defined for <math|0\<leq\>x,y\<less\>\<infty\>> and such that
  <math|f<around|(|x|)>> is continuous for <math|x\<gtr\>0>.

  <\lemma>
    <label|lem:analytic-extension>There exists an analytic function
    <math|F<around|(|z|)>> defined in the half-plane
    <math|R<around|(|z|)>\<gtr\>0> which coincides with
    <math|f<around|(|x|)>> for <math|x\<gtr\>0> and such that
    <math|F*<around|(|z+w|)>\<geq\><rsub|0>>.
  </lemma>

  <\proof>
    Denote by <math|S<rsub|n>> the semi-groups
    <math|<around|{|m/2<rsup|n>|}><rsub|m=0><rsup|\<infty\>>> and let
    <math|f<rsub|n><around|(|m|)>=f*<around|(|m/2<rsup|n>|)>>. Since
    <math|f<rsub|n>*<around|(|m+q+1|)>\<geq\><rsub|0>>, by
    Lemma<nbsp><reference|lem:one-dimensional>, there exists a bounded
    monotone increasing function <math|V<rsub|n><around|(|t|)>> so that

    <\equation>
      f<rsub|n><around|(|m|)>=f*<around|(|m/2<rsup|n>|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|m/2<rsup|n>>*d*V<rsub|n><around|(|t|)>.<label|eq:discrete-representation>
    </equation>

    The function

    <\equation>
      F<rsub|n><around|(|z|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|z>*d*V<rsub|n><around|(|t|)><label|eq:analytic-function>
    </equation>

    clearly exists and is analytic for <math|R<around|(|z|)>\<gtr\>0>. Also,
    it coincides with <math|f<around|(|x|)>> on <math|S<rsub|n>> for
    <math|m\<leq\>n> and <math|F<rsub|n>*<around|(|z+w|)>\<geq\><rsub|0>>.
    Further, if <math|p> is any integer and <math|0\<less\>x\<leq\>p>, where
    <math|x=R<around|(|z|)>>, we have

    <\align>
      <tformat|<table|<row|<cell|<around|\||F<rsub|n><around|(|z|)>|\|>>|<cell|\<leq\><big|int><rsub|0><rsup|\<infty\>>t<rsup|x>*d*V<rsub|n><around|(|t|)>\<leq\><big|int><rsub|0><rsup|1>d*V<rsub|n><around|(|t|)>+<big|int><rsub|1><rsup|\<infty\>>t<rsup|x>*d*V<rsub|n><around|(|t|)>+<big|int><rsub|1><rsup|\<infty\>>t<rsup|p>*d*V<rsub|n><around|(|t|)><eq-number>>>|<row|<cell|>|<cell|=f<around|(|0|)>+f<around|(|x|)>+f<around|(|p|)>.<eq-number><label|eq:uniform-bound>>>>>
    </align>

    This implies that the sequence <math|<around|{|F<rsub|n><around|(|z|)>|}>>
    is uniformly bounded in this strip. Also, for any rational number of the
    form <math|p/2<rsup|q>>, <math|F<rsub|n>*<around|(|p/2<rsup|q>|)>>
    converges to <math|f*<around|(|p/2<rsup|q>|)>>. Therefore by the Vitali
    theorem<footnote|See L. Bieberbach, Lehrbuch der Funktionentheorie, vol.
    I, Leipzig, 1934, p. 168.> <math|F<rsub|n><around|(|z|)>> converges to an
    analytic function <math|F<around|(|z|)>> for
    <math|R<around|(|z|)>\<gtr\>0>. Clearly,
    <math|F*<around|(|z+w|)>\<geq\><rsub|0>>, and since
    <math|F<around|(|z|)>> coincides with <math|f<around|(|x|)>> on the
    rational points of the form <math|p/2<rsup|q>>, by the continuity of
    <math|f<around|(|x|)>> we must have <math|F<around|(|x|)>=f<around|(|x|)>>
    for all <math|x\<gtr\>0>.
  </proof>

  <\lemma>
    <label|lem:self-adjoint-operators>The operators
    <math|H<rsub|x<rsub|0>>\<leftrightarrow\>f*<around|(|x+y+x<rsub|0>|)>>
    are self-adjoint for <math|x<rsub|0>\<geq\>0>. If <math|f<around|(|x|)>>
    is continuous at the origin, every operator <math|H<rsub|x<rsub|0>>> has
    an inverse.
  </lemma>

  <\proof>
    Let <math|\<cal-J\>> be the r.k.s. corresponding to
    <math|f*<around|(|x+y|)>> for <math|x,y\<geq\>0>,
    <math|\<cal-J\><rsub|0>> be the r.k.s. corresponding to
    <math|f*<around|(|x+y|)>> for <math|x,y\<gtr\>0>, and
    <math|\<cal-J\><rsub|1>> the r.k.s. corresponding to
    <math|F*<around|(|z+w|)>> of the previous lemma.

    Suppose <math|x<rsub|0>\<gtr\>0> and that there exists an element
    <math|g> in <math|\<cal-J\>> which is in the domain of
    <math|H<rsub|x<rsub|0>>> and such that <math|H<rsub|x<rsub|0>>*g=i*g>,
    that is, <math|g*<around|(|x+x<rsub|0>|)>=i*g<around|(|x|)>> for
    <math|x\<geq\>0>. Let <math|g<rsub|0><around|(|x|)>> be the restriction
    of <math|g<around|(|x|)>> to the positive real axis, <math|x\<gtr\>0>. By
    Theorem<nbsp><reference|thm:restriction>,
    <math|g<rsub|0>\<in\>\<cal-J\><rsub|0>> and also there exists an element
    <math|g<rsub|1>> in <math|\<cal-J\><rsub|1>> such that the restriction of
    <math|g<rsub|1>> to the positive part of the real axis is
    <math|g<rsub|0>>.

    Since <math|F<around|(|z|)>> is analytic, from the fact that
    <math|\<cal-J\><rsub|1><rprime|'>> is dense in <math|\<cal-J\><rsub|1>>
    and that strong convergence in <math|\<cal-J\><rsub|1>> implies uniform
    convergence in every set where <math|F*<around|(|z+<wide|z|\<bar\>>|)>>
    is bounded (see N. Aronszajn <cite|aronszajn2>, p. 344(5)),
    <math|g<rsub|1><around|(|z|)>> is analytic for
    <math|R<around|(|z|)>\<gtr\>0>. Therefore since
    <math|g<rsub|1>*<around|(|x+x<rsub|0>|)>=i*g<rsub|1><around|(|x|)>> for
    <math|x\<gtr\>0>, we must have <math|g<rsub|1>*<around|(|z+x<rsub|0>|)>=i*g<rsub|1><around|(|z|)>>
    for all <math|R<around|(|z|)>\<gtr\>0>. Now,
    <math|g<rsub|1><around|(|z|)>> is periodic of period <math|4*i*x<rsub|0>>
    and consequently may be extended analytically to the whole plane (less
    <math|\<infty\>>). Further, since

    <\equation>
      <around|\||g<rsub|1><around|(|z|)>|\|>=<around|\||<around|(|g<rsub|1><around|(|w|)>,F*<around|(|w+<wide|z|\<bar\>>|)>|)>|\|>\<leq\><around|\<\|\|\>|g<rsub|1>|\<\|\|\>>*<around|\<\|\|\>|f*<around|(|2*R<around|(|z|)>|)>|\<\|\|\>><rsup|1/2>,<label|eq:bound-estimate>
    </equation>

    <math|g<rsub|1><around|(|z|)>> is bounded in any strip
    <math|0\<less\>x<rsub|1>\<leq\>R<around|(|z|)>\<leq\>x<rsub|2>\<less\>\<infty\>>.
    By Liouville's theorem <math|g<rsub|1><around|(|z|)>> must be a constant,
    which must of course be zero. Therefore, the element
    <math|g<rsub|0><around|(|x|)>> must be zero for <math|x\<gtr\>0>. Since
    <math|g<around|(|x|)>=i*g<around|(|0|)>>, we must have
    <math|g<around|(|0|)>=0>.

    We have consequently proved that for <math|x<rsub|0>\<gtr\>0> the
    deficiency index of <math|H<rsub|x<rsub|0>><rsup|\<ast\>>> is
    <math|<around|(|0,0|)>>, which means <math|H<rsub|x<rsub|0>>> is
    self-adjoint. Since <math|H<rsub|0>> is the identity operator, we have
    shown that every operator <math|H<rsub|x<rsub|0>>> is self-adjoint.

    Suppose now that <math|f<around|(|x|)>> is continuous at the origin. Then
    every element of <math|\<cal-J\>> is continuous for
    <math|x\<geq\>0><footnote|The relevant general theorem is given in N.
    Aronszajn <cite|aronszajn1>, p. 140.>. We shall show that the linear
    manifold determined by the functions <math|f*<around|(|x+y+x<rsub|0>|)>>
    is dense in <math|\<cal-J\>>, which by
    Theorem<nbsp><reference|thm:correspondence> will mean that
    <math|H<rsub|x<rsub|0>>> has an inverse.

    Let <math|\<cal-J\><rsub|0>> be the set of all elements in
    <math|\<cal-J\>> which are zero for <math|x\<geq\>x<rsub|0>>. The linear
    manifold determined by the functions <math|<around|{|f*<around|(|x+y+x<rsub|0>|)>|}>>
    is dense in the orthogonal complement of <math|\<cal-J\><rsub|0>>. If
    <math|h\<in\>\<cal-J\><rsub|0>>, then from the facts that <math|h> is
    continuous at the origin and is the restriction of an element of
    <math|\<cal-J\><rsub|1>> for <math|x\<gtr\>0>, we must have
    <math|h<around|(|x|)>=0> for <math|x\<geq\>0>. Therefore,
    <math|\<cal-J\><rsub|0>> consists only of the zero element.
  </proof>

  <\lemma>
    <label|lem:spectral-representation>There exists a resolution of the
    identity, <math|<around|{|E<rsub|t>|}>>, defined on <math|\<cal-J\>>,
    such that<footnote|The integral representation for these types of
    functions was first given by S. Bernstein <cite|bernstein>, where they
    were called exponentially convex. Also cf. D. V. Widder <cite|widder2>
    and <cite|widder3>, p. 273.>

    <\equation>
      f<around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|x>*d*<around|(|E<rsub|t>*f,f|)>.<label|eq:spectral-integral>
    </equation>

    The function <math|V<around|(|t|)>=<around|(|E<rsub|t>*f,f|)>> is
    substantially unique and is continuous at the origin if
    <math|f<around|(|x|)>> is continuous there. The operators
    <math|H<rsub|x<rsub|0>>\<leftrightarrow\>f*<around|(|x+y+x<rsub|0>|)>>
    are given by

    <\equation>
      H<rsub|x<rsub|0>>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|x<rsub|0>>*d*E<rsub|t>.<label|eq:operator-representation>
    </equation>
  </lemma>

  <\proof>
    Let <math|<around|{|E<rsub|t>|}>> be the canonical resolution of the
    identity of the self-adjoint operator <math|H<rsub|1>>. Since
    <math|H<rsub|1/2>*H<rsub|1/2>=H<rsub|1>> and since both
    <math|H<rsub|1/2>> and <math|H<rsub|1>> are self-adjoint, it follows that
    <math|H<rsub|1/2>=H<rsub|1><rsup|1/2>>. Further, since
    <math|f*<around|(|x+y+1/2|)>\<geq\><rsub|0>>, by
    Theorem<nbsp><reference|thm:semi-bounded>, <math|H<rsub|1/2>\<geq\>0> and
    therefore

    <\equation>
      H<rsub|1/2>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|1/2>*d*E<rsub|t>.<label|eq:half-power>
    </equation>

    Similarly, <math|H<rsub|m/2<rsup|n>>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|m/2<rsup|n>>*d*E<rsub|t>>.
    Therefore,

    <\equation>
      f*<around|(|m/2<rsup|n>|)>=<around|(|H<rsub|m/2<rsup|n>>*f,f|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|m/2<rsup|n>>*d*<around|(|E<rsub|t>*f,f|)>.<label|eq:discrete-spectral>
    </equation>

    For <math|x> in the open interval <math|<around|(|0,\<infty\>|)>>, by the
    continuity of the function on the left and the integral on the right, we
    get

    <\equation>
      f<around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|x>*d*<around|(|E<rsub|t>*f,f|)>.<label|eq:continuous-spectral>
    </equation>

    Since it is clear that <math|f<around|(|0|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|0>*d*<around|(|E<rsub|t>*f,f|)>>,
    we have the representation for all <math|x\<geq\>0>.

    The uniqueness of <math|V<around|(|t|)>=<around|(|E<rsub|t>*f,f|)>>
    follows by an argument similar to the uniqueness proof of
    Lemma<nbsp><reference|lem:one-dimensional>. If <math|f<around|(|x|)>> is
    continuous at the origin, then <math|lim<rsub|t\<to\>0> E<rsub|t>=0>,
    which implies the continuity of <math|V<around|(|t|)>> at the origin.

    Consider now the operators

    <\equation>
      T<rsub|x<rsub|0>>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|x<rsub|0>>*d*E<rsub|t>.<label|eq:operator-definition-2>
    </equation>

    The operators <math|T<rsub|m/2<rsup|n>>> certainly coincide with
    <math|H<rsub|m/2<rsup|n>>>, where <math|m> and <math|n> take on the
    values <math|0,1,2,\<ldots\>>. Since <math|f<around|(|x|)>=f*<around|(|x+y|)>\<in\>D<rsub|H<rsub|m/2<rsup|n>>>>,
    <math|f<rsub|y>\<in\>D<rsub|T<rsub|x<rsub|0>>>> for every
    <math|x<rsub|0>\<geq\>0>. Therefore,

    <\equation>
      f*<around|(|x+y+m/2<rsup|n>|)>=<around|(|H<rsub|m/2<rsup|n>>*f<rsub|x>,f<rsub|y>|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|m/2<rsup|n>>*d*<around|(|E<rsub|t>*f<rsub|x>,f<rsub|y>|)>.<label|eq:kernel-representation>
    </equation>

    If we choose a sequence of the <math|m/2<rsup|n>> which approach any
    <math|x<rsub|0>\<gtr\>0>, we get

    <\equation>
      f*<around|(|x+y+x<rsub|0>|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|x<rsub|0>>*d*<around|(|E<rsub|t>*f<rsub|x>,f<rsub|y>|)>=<around|(|T<rsub|x<rsub|0>>*f<rsub|x>,f<rsub|y>|)>.<label|eq:limit-representation>
    </equation>

    Therefore, <math|T<rsub|x<rsub|0>>*f<rsub|y><around|(|x|)>=f*<around|(|x+y+x<rsub|0>|)>>,
    which means <math|T<rsub|x<rsub|0>>\<sim\>f*<around|(|x+y+x<rsub|0>|)>>.
    Consequently, <math|T<rsub|x<rsub|0>>\<subset\>H<rsub|x<rsub|0>>> and
    since both of these operators are self-adjoint we must have
    <math|T<rsub|x<rsub|0>>=H<rsub|x<rsub|0>>>.
  </proof>

  <with|font-series|bold|Remark.> With the help of
  Theorem<nbsp><reference|thm:integral-space> and
  Lemma<nbsp><reference|lem:spectral-representation>, we see that for any
  bounded monotone increasing function <math|V<around|(|t|)>> such that
  <math|<big|int><rsub|0><rsup|\<infty\>>t<rsup|x>*d*V<around|(|t|)>\<less\>\<infty\>>
  for <math|x\<geq\>0>, the linear manifold generated by the set of functions
  <math|<around|{|g<around|(|t|)>|}>=<around|{|t<rsup|x>|}>>, for
  <math|t\<geq\>0> and <math|x\<geq\>0>, is dense in
  <math|L<rsup|2><around|(|V|)>>.

  <\lemma>
    <label|lem:unitary-group>Let <math|<around|{|U<rsub|y>|}>>,
    <math|-\<infty\>\<less\>y\<less\>\<infty\>>, be a group of unitary
    operators in the sense that <math|U<rsub|x>*U<rsub|y>=U<rsub|x+y>> and
    <math|U<rsub|y><rsup|\<ast\>>=U<rsub|-y>>. Further suppose
    <math|<around|(|U<rsub|y>*f,g|)>> is a continuous function of <math|y>
    for every <math|f> and <math|g> in the Hilbert space. Let
    <math|H<rsub|1>=2<rsup|-1>*<around|(|U<rsub|1>+U<rsub|-1>|)>> and
    <math|d> a finite positive real number.

    Necessary and sufficient conditions that there exists a resolution of the
    identity <math|<around|{|E<rsub|t>|}>> such that <math|E<rsub|t>=0> for
    <math|t\<less\>-d>, <math|E<rsub|t>=I> for <math|t\<geq\>d>, and such
    that

    <\equation>
      U<rsub|y>=<big|int><rsub|-d><rsup|d>e<rsup|i*y*t>*d*E<rsub|t>,<label|eq:unitary-representation>
    </equation>

    are that there exists a sequence of positive numbers <math|y<rsub|n>>
    such that <math|y<rsub|n>*d\<leq\>\<pi\>> and

    <\equation>
      H<rsub|1>\<geq\>cos <around|(|y<rsub|n>*d|)>*I,<space|1em>n=1,2,\<ldots\><label|eq:cosine-bound>
    </equation>
  </lemma>

  <\proof>
    <footnote|I am indebted to the referee for a suggestion which materially
    simplified the original proof.> To prove the necessity, suppose that
    <math|<around|{|U<rsub|y>|}>> has a representation as above. There exists
    an integer <math|n<rsub|0>> such that <math|n<rsub|0>*d\<gtr\>\<pi\>>.
    Choose <math|y<rsub|n>=1/<around|(|n+n<rsub|0>|)>>. For any such
    <math|y<rsub|n>> we have

    <\equation>
      U<rsub|y<rsub|n>>=<big|int><rsub|-d><rsup|d>e<rsup|i*y<rsub|n>*t>*d*E<rsub|t>.<label|eq:unitary-spectral>
    </equation>

    It follows immediately that <math|H<rsub|y<rsub|n>>\<geq\>cos
    <around|(|y<rsub|n>*d|)>*I>, <math|n=1,2,\<ldots\>>.

    To prove the sufficiency we first note that by a well known theorem of M.
    H. Stone<footnote|Cf. Nagy <cite|nagy>, p. 69.> there exists a resolution
    of the identity <math|<around|{|E<rsub|t>|}>> such that for every
    <math|y>,

    <\equation>
      U<rsub|y>=<big|int>e<rsup|i*y*t>*d*E<rsub|t>.<label|eq:stone-representation>
    </equation>

    It follows that

    <\equation>
      H<rsub|1>=<big|int>cos <around|(|y*t|)>*d*E<rsub|t>.<label|eq:cosine-integral>
    </equation>

    From the fact that <math|H<rsub|1>\<geq\>cos <around|(|y<rsub|n>*d|)>*I>
    it follows that <math|<around|{|E<rsub|t>|}>> has no spectrum in the
    intervals where <math|cos <around|(|y<rsub|n>*t|)>\<less\>cos
    <around|(|y<rsub|n>*d|)>>, in particular in
    <math|d\<less\>t\<less\><around|(|2*\<pi\>/y<rsub|n>|)>-d> and
    <math|<around|(|-2*\<pi\>/y<rsub|n>|)>+d\<less\>t\<less\>-d>. For
    <math|y<rsub|n>\<to\>0> we get that there is no spectrum outside of
    <math|-d\<leq\>t\<leq\>d>.
  </proof>

  Let us now consider these problems over higher-dimensional spaces. Let
  <math|x>, for <math|x\<geq\>0>, and <math|t<rsub|1>>, for
  <math|-\<infty\>\<leq\>t<rsub|1>\<leq\>\<infty\>>, be generic symbols for
  vectors in <math|n>-dimensional Euclidean space and <math|y>, for
  <math|-\<infty\>\<less\>y\<less\>\<infty\>>, and <math|t<rsub|2>>, for
  <math|-\<infty\>\<leq\>t<rsub|2>\<leq\>\<infty\>>, be generic symbols for
  vectors in <math|m>-dimensional Euclidean space. Further let
  <math|f<around|(|x,y|)>> be a continuous positive definite function as
  defined in the introduction, i.e., <math|<big|sum><rsub|i,j=1><rsup|N>a<rsub|i><wide|a<rsub|j>|\<bar\>>f<around|(|x<rsub|i>+x<rsub|j>,y<rsub|i>-y<rsub|j>|)>\<geq\>0>.

  <\lemma>
    <label|lem:higher-dimensional>There exists a bounded monotone increasing
    function <math|V<around|(|t<rsub|1>,t<rsub|2>|)>> whose spectrum is
    contained in the set <math|0\<leq\>t<rsub|1>\<less\>\<infty\>>,
    <math|-\<infty\>\<less\>t<rsub|2>\<less\>\<infty\>> and such that

    <\equation>
      f<around|(|x,y|)>=<big|int><rsub|E<rsub|n+m>>t<rsub|1><rsup|x>*exp
      <around|(|i*t<rsub|2>\<cdot\>y|)>*d*V<around|(|t<rsub|1>,t<rsub|2>|)>.<label|eq:higher-dimensional-representation>
    </equation>

    The function <math|V<around|(|t<rsub|1>,t<rsub|2>|)>> is substantially
    unique.
  </lemma>

  <\proof>
    Consider the operators <math|T<rsub|u<rsub|k>>\<leftrightarrow\>f<around|(|x<rsub|1>+x<rsub|2>+u<rsub|k>,y<rsub|1>-y<rsub|2>|)>>,
    <math|k=1,2,\<ldots\>,n>. These operators are self-adjoint. For if
    <math|T<rsub|u<rsub|k>>> is not self-adjoint there exists a nonzero
    <math|g\<in\>\<cal-J\>> such that <math|T<rsub|u<rsub|k>>*g=i*g>. Since
    <math|g> is not zero, there exists a vector <math|y<rsub|0>> and vectors
    <math|x=<around|(|x<rsup|<around|(|1|)>>,\<ldots\>,x<rsup|<around|(|k-1|)>>,x<rsup|<around|(|k|)>>,x<rsup|<around|(|k+1|)>>,\<ldots\>,x<rsup|<around|(|n|)>>|)>>,
    <math|x> fixed, <math|0\<leq\>x<rsup|<around|(|k|)>>\<less\>\<infty\>>,
    such that the restriction of <math|g<around|(|x,y|)>> to the set
    <math|<around|(|x<rsup|<around|(|k|)>>,y<rsub|0>|)>> is not zero. We have
    then <math|g<around|(|x<rsup|<around|(|k|)>>+u<rsub|k>,y<rsub|0>|)>=i*g<around|(|x<rsup|<around|(|k|)>>,y<rsub|0>|)>>.
    But if we consider the restriction of the elements of <math|\<cal-J\>> to
    the set <math|<around|(|x<rsup|<around|(|k|)>>,y<rsub|0>|)>>, then
    Lemma<nbsp><reference|lem:self-adjoint-operators> tells us that <math|g>
    cannot satisfy this relation.

    Let <math|<around|{|E<rsub|t><rsup|<around|(|k|)>>|}>> be the resolution
    of the identity associated with <math|T<rsub|u<rsub|k>>>. Since
    <math|f<around|(|x<rsub|1>+x<rsub|2>+u<rsub|k>,y<rsub|1>-y<rsub|2>|)>\<geq\><rsub|\<cal-J\>>0>,
    the spectrum of <math|<around|{|E<rsub|t><rsup|<around|(|k|)>>|}>> lies
    in the interval <math|<around|[|0,\<infty\>|]>>.

    Consider the operators <math|T<rsub|x\<cdot\>u<rsub|k>>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|x\<cdot\>u<rsub|k>>*d*E<rsub|t><rsup|<around|(|k|)>>>.
    By methods similar to those used in Lemma<nbsp><reference|lem:spectral-representation>
    we may prove that <math|T<rsub|x\<cdot\>u<rsub|k>>\<leftrightarrow\>f<around|(|x<rsub|1>+x<rsub|2>+x\<cdot\>u<rsub|k>,y<rsub|1>-y<rsub|2>|)>>.

    Let us now prove that the operators <math|T<rsub|u<rsub|j>>> and
    <math|T<rsub|u<rsub|k>>> commute. It is clear that
    <math|T<rsub|x\<cdot\>u<rsub|j>>> and <math|T<rsub|x\<cdot\>u<rsub|k>>>
    commute on <math|\<cal-J\><rprime|'>> for every <math|x\<geq\>0>. We
    have, therefore, for any <math|g,h\<in\>\<cal-J\><rprime|'>>,

    <\equation>
      <around|(|T<rsub|x\<cdot\>u<rsub|j>>*T<rsub|x\<cdot\>u<rsub|k>>*g,h|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|x\<cdot\>u<rsub|j>>*d*<around|(|E<rsub|t><rsup|<around|(|j|)>>*T<rsub|x\<cdot\>u<rsub|k>>*g,h|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|x\<cdot\>u<rsub|j>>*d*<around|(|E<rsub|t><rsup|<around|(|j|)>>*g,T<rsub|x\<cdot\>u<rsub|k>>*h|)>.<label|eq:commutation-step1>
    </equation>

    Consequently,

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>t<rsup|x\<cdot\>u<rsub|j>>*d*<around|[|<around|(|E<rsub|t><rsup|<around|(|j|)>>*T<rsub|x\<cdot\>u<rsub|k>>*g,h|)>-<around|(|E<rsub|t><rsup|<around|(|j|)>>*g,T<rsub|x\<cdot\>u<rsub|k>>*h|)>|]>=0.<label|eq:commutation-step2>
    </equation>

    Let us write

    <\equation>
      <around|(|E<rsub|t><rsup|<around|(|j|)>>*T<rsub|x\<cdot\>u<rsub|k>>*g,h|)>-<around|(|E<rsub|t><rsup|<around|(|j|)>>*g,T<rsub|x\<cdot\>u<rsub|k>>*h|)>=V<rsub|1><around|(|t|)>-V<rsub|1><rsup|\<ast\>><around|(|t|)>+<around|[|V<rsub|2><around|(|t|)>-V<rsub|2><rsup|\<ast\>><around|(|t|)>|]>,<label|eq:commutation-decomposition>
    </equation>

    where, e.g.,

    <\equation>
      V<rsub|1><around|(|t|)>=<frac|1|4>*<around|\<\|\|\>|E<rsub|t><rsup|<around|(|j|)>>*<around|(|T<rsub|x\<cdot\>u<rsub|k>>*g+h|)>*<around|\<\|\|\>|<rsup|2>+<frac|1|4>|\<\|\|\>>*E<rsub|t><rsup|<around|(|j|)>>*<around|(|g-T<rsub|x\<cdot\>u<rsub|k>>*h|)>|\<\|\|\>><rsup|2>,<label|eq:v1-definition>
    </equation>

    and <math|V<rsub|1><rsup|\<ast\>><around|(|t|)>>,
    <math|V<rsub|2><around|(|t|)>>, and <math|V<rsub|2><rsup|\<ast\>><around|(|t|)>>
    have similar forms. The functions <math|V<rsub|r><around|(|t|)>> and
    <math|V<rsub|r><rsup|\<ast\>><around|(|t|)>>, <math|r=1,2>, are bounded
    monotone increasing functions.

    We get

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>t<rsup|x\<cdot\>u<rsub|j>>*d*V<rsub|r><around|(|t|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>t<rsup|x\<cdot\>u<rsub|j>>*d*V<rsub|r><rsup|\<ast\>><around|(|t|)>,<space|1em>r=1,2.<eq-number><label|eq:integral-equality>>>>>
    </align>

    Since <math|V<rsub|r><around|(|t|)>> and
    <math|V<rsub|r><rsup|\<ast\>><around|(|t|)>> are normed in the same way,
    by Lemma<nbsp><reference|lem:spectral-representation> they must be equal
    and, consequently,

    <\equation>
      <around|(|E<rsub|t><rsup|<around|(|j|)>>*T<rsub|x\<cdot\>u<rsub|k>>*g,h|)>=<around|(|E<rsub|t><rsup|<around|(|j|)>>*g,T<rsub|x\<cdot\>u<rsub|k>>*h|)>.<label|eq:commutation-result>
    </equation>

    From this it follows that

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>t<rsup|x\<cdot\>u<rsub|j>>*d*<around|(|E<rsub|t><rsup|<around|(|j|)>>*E<rsub|\<mu\>><rsup|<around|(|k|)>>*g,h|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsup|x\<cdot\>u<rsub|j>>*d*<around|(|E<rsub|\<mu\>><rsup|<around|(|k|)>>*E<rsub|t><rsup|<around|(|j|)>>*g,h|)>.<label|eq:spectral-commutation>
    </equation>

    By the same reasoning as employed before we get

    <\equation>
      <around|(|E<rsub|t><rsup|<around|(|j|)>>*E<rsub|\<mu\>><rsup|<around|(|k|)>>*g,h|)>=<around|(|E<rsub|\<mu\>><rsup|<around|(|k|)>>*E<rsub|t><rsup|<around|(|j|)>>*g,h|)>.<label|eq:projections-commute>
    </equation>

    Since <math|\<cal-J\><rprime|'>> is dense in <math|\<cal-J\>> we have
    that <math|<around|{|E<rsub|t><rsup|<around|(|j|)>>|}>> commutes with
    <math|<around|{|E<rsub|\<mu\>><rsup|<around|(|k|)>>|}>>.

    Consider now the operators <math|U<rsub|y\<cdot\>u<rsub|k>>\<leftrightarrow\>f<around|(|x<rsub|1>+x<rsub|2>,y<rsub|1>-y<rsub|2>+y\<cdot\>u<rsub|k>|)>>,
    for <math|k=1,\<ldots\>,m>, <math|-\<infty\>\<less\>y\<less\>\<infty\>>.
    These are unitary operators which for fixed <math|k> form a group. It is
    clear that <math|<around|(|U<rsub|y\<cdot\>u<rsub|k>>*f,g|)>> is a
    continuous function of <math|y\<cdot\>u<rsub|k>> for every
    <math|f,g\<in\>\<cal-J\>>. Consequently, there exists a resolution of the
    identity <math|<around|{|F<rsub|t><rsup|<around|(|k|)>>|}>> such that

    <\equation>
      U<rsub|y\<cdot\>u<rsub|k>>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*y\<cdot\>u<rsub|k>\<cdot\>t>*d*F<rsub|t><rsup|<around|(|k|)>>.<label|eq:unitary-representation>
    </equation>

    Since the operators <math|<around|{|T<rsub|u<rsub|j>>|}>> commute with
    one another and all of the operators <math|<around|{|U<rsub|y\<cdot\>u<rsub|k>>|}>>
    commute with one another and with every <math|T<rsub|u<rsub|j>>>, the
    operator

    <\equation>
      E<rsub|t<rsub|1>,t<rsub|2>>=<big|prod><rsub|k=1><rsup|n>E<rsub|t<rsub|1><rsup|<around|(|k|)>>><rsup|<around|(|k|)>>*<big|prod><rsub|k=1><rsup|m>F<rsub|t<rsub|2><rsup|<around|(|k|)>>><rsup|<around|(|k|)>><label|eq:joint-spectral-family>
    </equation>

    is a projection and the set <math|<around|{|E<rsub|t<rsub|1>,t<rsub|2>>|}>>
    is a resolution of the identity. Therefore, if we write

    <\equation>
      T<rsub|t<rsub|1>>=<big|prod><rsub|k=1><rsup|n>T<rsub|t<rsub|1><rsup|<around|(|k|)>>\<cdot\>u<rsub|k>>*<space|1em><text|and><space|1em>U<rsub|t<rsub|2>>=<big|prod><rsub|k=1><rsup|m>U<rsub|t<rsub|2><rsup|<around|(|k|)>>\<cdot\>u<rsub|k>>,<label|eq:product-operators>
    </equation>

    we have

    <\equation>
      T<rsub|t<rsub|1>>*U<rsub|t<rsub|2>>=<big|int><rsub|E<rsub|n+m>>t<rsub|1><rsup|t<rsub|1>>*exp
      <around|(|i*t<rsub|2>\<cdot\>t<rsub|2>|)>*d*E<rsub|t<rsub|1>,t<rsub|2>>*<space|1em><text|and><space|1em>V<around|(|t<rsub|1>,t<rsub|2>|)>=<around|(|E<rsub|t<rsub|1>,t<rsub|2>>*f,f|)><label|eq:spectral-formula>
    </equation>

    <\equation>
      f<around|(|x,y|)>=<around|(|T<rsub|x>*U<rsub|y>*f,f|)>=<big|int><rsub|E<rsub|n+m>>t<rsub|1><rsup|x>*exp
      <around|(|i*t<rsub|2>\<cdot\>y|)>*d*V<around|(|t<rsub|1>,t<rsub|2>|)>.<label|eq:final-representation>
    </equation>

    It remains to prove the uniqueness of
    <math|V<around|(|t<rsub|1>,t<rsub|2>|)>>. We write

    <\equation>
      <big|int><rsub|E<rsub|n+m>>exp <around|(|i*t<rsub|2>\<cdot\>y|)>*t<rsub|1><rsup|x>*d*V<around|(|t<rsub|1>,t<rsub|2>|)>=<big|int><rsub|E<rsub|m>>exp
      <around|(|i*t<rsub|2>\<cdot\>y|)>*d*t<rsub|2>*<big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x>*d*V<around|(|t<rsub|1>,t<rsub|2>|)>.<label|eq:uniqueness-step1>
    </equation>

    If <math|V<rsub|1><around|(|t<rsub|1>,t<rsub|2>|)>> is another monotone
    function as described in Lemma<nbsp><reference|lem:higher-dimensional>,
    we may assume without loss of generality that
    <math|V<rsub|1><around|(|t<rsub|1>,t<rsub|2>|)>> is normed in the same
    manner as <math|V<around|(|t<rsub|1>,t<rsub|2>|)>>. We have
    then<footnote|The iterations which we are performing on these multiple
    integrals may be easily verified, at least for the simple functions used
    here, by measure-theoretic methods.>

    <\equation>
      <big|int><rsub|E<rsub|n+m>>exp <around|(|i*t<rsub|2>\<cdot\>y|)>*t<rsub|1><rsup|x>*d*V<around|(|t<rsub|1>,t<rsub|2>|)>=<big|int><rsub|E<rsub|n+m>>exp
      <around|(|i*t<rsub|2>\<cdot\>y|)>*t<rsub|1><rsup|x>*d*V<rsub|1><around|(|t<rsub|1>,t<rsub|2>|)>.<label|eq:uniqueness-step2>
    </equation>

    It follows quite easily<footnote|Cf., e.g., E. Hopf, Ergodentheorie,
    Ergibnisse der Mathematik und ihrer Grenzgebiete, vol. 5, no. 5, 1937,
    Berlin, Springer, p. 11.> that for every <math|t<rsub|2>>,

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x>*d*V<around|(|t<rsub|1>,t<rsub|2>|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x>*d*V<rsub|1><around|(|t<rsub|1>,t<rsub|2>|)>.<label|eq:uniqueness-step3>
    </equation>

    We may now write

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x>*d*V<around|(|t<rsub|1>,t<rsub|2>|)>>|<cell|=<big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x<rsup|<around|(|1|)>>>*d*t<rsub|1><rsup|<around|(|1|)>>*<big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x<rsup|<around|(|2|)>>>*d*t<rsub|1><rsup|<around|(|2|)>>*\<cdots\>*<big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x<rsup|<around|(|n|)>>>*d*V<around|(|t<rsub|1>,t<rsub|2>|)>,<eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x<rsup|<around|(|1|)>>>*d*t<rsub|1><rsup|<around|(|1|)>>*<big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x<rsup|<around|(|2|)>>>*d*t<rsub|1><rsup|<around|(|2|)>>*\<cdots\>*<big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x<rsup|<around|(|n|)>>>*d*V<rsub|1><around|(|t<rsub|1>,t<rsub|2>|)>,<eq-number><label|eq:uniqueness-step4>>>>>
    </align>

    where the <math|d*t<rsub|1><rsup|<around|(|i|)>>> indicates we are
    integrating with respect to <math|t<rsub|1><rsup|<around|(|i|)>>>, the
    <math|d*t<rsub|2>> indicates we are integrating with respect to the
    variables <math|t<rsub|2><rsup|<around|(|j|)>>>, <math|j=1,\<ldots\>,m>,
    and <math|x<rsup|<around|(|i|)>>=x<rsup|<around|(|i|)>>> By
    Lemma<nbsp><reference|lem:spectral-representation> we must have

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x<rsup|<around|(|1|)>>>*d*V<around|(|t<rsub|1>,t<rsub|2>|)>=<big|int><rsub|0><rsup|\<infty\>>t<rsub|1><rsup|x<rsup|<around|(|1|)>>>*d*V<rsub|1><around|(|t<rsub|1>,t<rsub|2>|)>.<label|eq:uniqueness-step5>
    </equation>

    Proceeding in this way we get <math|V<around|(|t<rsub|1>,t<rsub|2>|)>=V<rsub|1><around|(|t<rsub|1>,t<rsub|2>|)>>.
    This completes the proof of the lemma.
  </proof>

  We are now in a position to prove the sufficiency of
  Theorem<nbsp><reference|thm:main>. Choose
  <math|c\<less\>c<rsub|1>\<less\>0> and consider the transformation
  <math|z<rprime|'>=z-c<rsub|1>> for <math|R<around|(|z|)>\<geq\>c<rsub|1>>.
  Consider then the function <math|f<rsub|c<rsub|1>><around|(|z<rprime|'>|)>=f<around|(|z|)>>;
  <math|f<rsub|c<rsub|1>>*<around|(|z<rprime|'><rsub|1>+z<rprime|'><rsub|2>|)>\<geq\><rsub|\<cal-J\>>0>
  and the inequalities (2) and (3) of Theorem<nbsp><reference|thm:main> carry
  over for <math|f<rsub|c<rsub|1>>>.

  By Lemma<nbsp><reference|lem:higher-dimensional> we may write

  <\equation>
    f<rsub|c<rsub|1>><around|(|z<rprime|'>|)>=<big|int><rsub|E<rsub|n+m>>t<rsub|1><rsup|x<rprime|'>>*exp
    <around|(|i*t<rsub|2>\<cdot\>y<rprime|'>|)>*d*V<rsub|c<rsub|1>><around|(|t<rsub|1>,t<rsub|2>|)>,<label|eq:sufficiency-step1>
  </equation>

  where <math|V<rsub|c<rsub|1>>> is a bounded monotone increasing function
  whose spectrum lies in the set <math|0\<leq\>t<rsub|1>\<less\>\<infty\>>,
  <math|-\<infty\>\<less\>t<rsub|2>\<less\>\<infty\>>. If we make the
  transformation <math|t<rsub|1>=log \<tau\><rsub|1>>,
  <math|t<rsub|2>=\<tau\><rsub|2>>, we get

  <\equation>
    f<rsub|c<rsub|1>><around|(|z<rprime|'>|)>=<big|int><rsub|E<rsub|n+m>>e<rsup|z<rprime|'>\<cdot\>t>*d*V<rprime|'><around|(|t|)>,<label|eq:sufficiency-step2>
  </equation>

  where <math|t=<around|(|t<rsub|1>,t<rsub|2>|)>=<around|(|t<rsub|1><rsup|<around|(|1|)>>,\<ldots\>,t<rsub|1><rsup|<around|(|n|)>>,t<rsub|2><rsup|<around|(|1|)>>,\<ldots\>,t<rsub|2><rsup|<around|(|m|)>>|)>>
  and <math|V<rprime|'><around|(|t|)>=V<rsub|c<rsub|1>><around|(|e<rsup|t<rsub|1>>,t<rsub|2>|)>>.

  Furthermore, by virtue of the method of proof of
  Lemma<nbsp><reference|lem:higher-dimensional>, conditions (2) and (3) of
  Theorem<nbsp><reference|thm:main>, Lemma<nbsp><reference|lem:unitary-group>,
  and Theorem<nbsp><reference|thm:semi-bounded> we have

  <\equation>
    f<rsub|c<rsub|1>><around|(|z<rprime|'>|)>=<big|int><rsub|a><rsup|b>e<rsup|z<rprime|'>\<cdot\>t>*d*V<around|(|t|)>.<label|eq:sufficiency-step3>
  </equation>

  Therefore, for <math|R<around|(|z|)>\<geq\>c<rsub|1>>,

  <\equation>
    f<around|(|z|)>=<big|int><rsub|a><rsup|b>e<rsup|z\<cdot\>t>*d*V<rsub|c<rsub|1>><around|(|t|)>,<label|eq:sufficiency-step4>
  </equation>

  where

  <\equation>
    V<rsub|c<rsub|1>><around|(|t|)>=<big|int><rsub|a><rsup|t>e<rsup|c<rsub|1>\<cdot\>s>*d*V<around|(|s|)>.<label|eq:sufficiency-step5>
  </equation>

  Since <math|c<rsub|1>\<less\>0>, <math|V<rsub|c<rsub|1>>> is a bounded
  monotone increasing function.

  Choose now <math|c\<less\>c<rsub|2>\<less\>c<rsub|1>>. By the same argument
  as used above we get

  <\equation>
    f<around|(|z|)>=<big|int><rsub|a><rsup|b>e<rsup|z\<cdot\>t>*d*V<rsub|c<rsub|2>><around|(|t|)>,<label|eq:sufficiency-step6>
  </equation>

  for <math|R<around|(|z|)>\<geq\>c<rsub|2>>. By
  Lemma<nbsp><reference|lem:higher-dimensional> it follows that
  <math|V<rsub|c<rsub|1>>> and <math|V<rsub|c<rsub|2>>> are substantially
  equal. Therefore, there exists a bounded monotone increasing function
  <math|V<around|(|t|)>> such that for <math|R<around|(|z|)>\<gtr\>c>,

  <\equation>
    f<around|(|z|)>=<big|int><rsub|a><rsup|b>e<rsup|i*z\<cdot\>t>*d*V<around|(|t|)>.<label|eq:sufficiency-conclusion>
  </equation>

  This proves the sufficiency of our main theorem.

  The necessity of conditions (1) and (2) of
  Theorem<nbsp><reference|thm:main> follow immediately by simple
  calculations. The necessity of condition (3) follows from the uniqueness of
  <math|V<around|(|t|)>> in <eqref|eq:main-representation>,
  Lemma<nbsp><reference|lem:unitary-group>, and
  Theorem<nbsp><reference|thm:semi-bounded>. This concludes the proof of the
  theorem.

  Let us notice now that for <math|n=0>, <math|d=\<infty\>>, this is the well
  known theorem of Bochner <cite|bochner>. For <math|m=0>,
  <math|a=-\<infty\>>, and <math|b=0> we have new conditions for the S.
  Bernstein-Hausdorff-Widder theorem on completely monotone functions. For
  <math|m=0>, <math|n=1>, <math|a=-\<infty\>>, and <math|b=\<infty\>> this is
  a result of S. Bernstein on exponentially convex functions. Further, for
  <math|m=1>, <math|n=1>, <math|a=-\<infty\>>, <math|b=\<infty\>>, as far as
  the theorem goes, it gives a corrected version of an incorrect theorem
  stated by M. Livshitz <cite|livshitz>.

  <section|Moment problems><label|sec:moment-problems>

  Let us consider the vectors <math|r=<around|(|r<rsup|<around|(|1|)>>,\<ldots\>,r<rsup|<around|(|n|)>>|)>>,
  <math|s=<around|(|s<rsup|<around|(|1|)>>,\<ldots\>,s<rsup|<around|(|m|)>>|)>>,
  where <math|r<rsup|<around|(|k|)>>>, <math|k=1,\<ldots\>,n>, ranges over
  the positive integers and zero and <math|s<rsup|<around|(|k|)>>>,
  <math|k=1,\<ldots\>,m>, ranges over the positive and negative integers and
  zero. Further, let <math|a<rsub|1>>, <math|b<rsub|1>>, and
  <math|t<rsub|1>>, with <math|a<rsub|1>>, <math|b<rsub|1>> finite and
  <math|b<rsub|1>-a<rsub|1>\<geq\>0>, be vectors in <math|n>-dimensional
  Euclidean space and <math|a<rsub|2>>, <math|b<rsub|2>>, <math|t<rsub|2>>,
  with <math|a<rsub|2>>, <math|b<rsub|2>> finite and
  <math|0\<leq\>b<rsub|2>-a<rsub|2>\<leq\>\<pi\>>, be vectors in
  <math|m>-dimensional Euclidean space. With these notations we have the
  following theorem.

  <\theorem>
    <label|thm:moment-problems>Let <math|<around|{|\<mu\><rsub|r,s>|}>> be a
    sequence of numbers with <math|r> and <math|s> as defined above.
    Necessary and sufficient conditions that there exists a bounded monotone
    increasing function <math|V<around|(|t<rsub|1>,t<rsub|2>|)>> whose
    spectrum vanishes outside of the interval <math|I> given by
    <math|a<rsub|j>\<leq\>t<rsub|j>\<leq\>b<rsub|j>>, <math|j=1,2>, and such
    that

    <\equation>
      \<mu\><rsub|r,s>=<big|int><rsub|I>t<rsub|1><rsup|r>*exp
      <around|(|i*t<rsub|2>\<cdot\>s|)>*d*V<around|(|t<rsub|1>,t<rsub|2>|)>,<label|eq:moment-integral>
    </equation>

    are:

    <\enumerate>
      <item><math|\<mu\><rsub|r<rsub|1>+r<rsub|2>,s<rsub|1>-s<rsub|2>>\<geq\><rsub|\<cal-J\>>0>.

      <item><math|a<rsub|1>\<cdot\>u<rsub|k>*\<mu\><rsub|r<rsub|1>+r<rsub|2>,s<rsub|1>-s<rsub|2>>\<leq\><rsub|\<cal-J\>>\<mu\><rsub|r<rsub|1>+r<rsub|2>+u<rsub|k>,s<rsub|1>-s<rsub|2>>\<leq\><rsub|\<cal-J\>>b<rsub|1>\<cdot\>u<rsub|k>*\<mu\><rsub|r<rsub|1>+r<rsub|2>,s<rsub|1>-s<rsub|2>>>
      for <math|k=1,\<ldots\>,n>.

      <item><math|exp <around|(|-2<rsup|-1>*i*<around|(|a<rsub|2>+b<rsub|2>|)>|)>*\<mu\><rsub|r<rsub|1>+r<rsub|2>,s<rsub|1>-s<rsub|2>+u<rsub|k>>+exp
      <around|(|2<rsup|-1>*i*<around|(|a<rsub|2>+b<rsub|2>|)>|)>*\<mu\><rsub|r<rsub|1>+r<rsub|2>,s<rsub|1>-s<rsub|2>-u<rsub|k>>\<geq\><rsub|\<cal-J\>>2*cos
      <around|(|2<rsup|-1>*<around|(|b<rsub|2>-a<rsub|2>|)>|)>*\<mu\><rsub|r<rsub|1>+r<rsub|2>,s<rsub|1>-s<rsub|2>>>
      for <math|k=1,\<ldots\>,m>.
    </enumerate>

    The function <math|V<around|(|t<rsub|1>,t<rsub|2>|)>> is substantially
    unique.
  </theorem>

  The proof of this theorem follows the same pattern as the proof of
  Theorem<nbsp><reference|thm:main>, but is much easier. For <math|m=0> we
  have the Hausdorff moment problem. For <math|n=0>, <math|m=1>, we have a
  result of Achieser and Krein <cite|achieser-krein>. For <math|m=0> and
  <math|n=1>, the usual solutions of the moment problems involving infinite
  domains of integration have been obtained in
  Lemma<nbsp><reference|lem:one-dimensional>. For the higher-dimensional
  cases of these problems there is difficulty in obtaining the solutions by
  these methods because of the difficulty in proving the permutability of the
  unbounded operators which arise.

  <\thebibliography|99>
    <bibitem|achieser-krein>N. Achieser and M. Krein, <em|On certain problems
    in the theory of moments> (in Russian), Kharkoff, 1938, 254 pp.

    <bibitem|aronszajn1>N. Aronszajn, La théorie générale des noyaux
    reproduisants et ses applications, Première Partie, <em|Proc. Cambridge
    Philos. Soc.> vol. 39 (1943) p. 133.

    <bibitem|aronszajn2>N. Aronszajn, The theory of reproducing kernels,
    <em|Trans. Amer. Math. Soc.> vol. 68 (1950) pp. 337\U404.

    <bibitem|bernstein>S. Bernstein, Sur les fonctions absolument monotones,
    <em|Acta Math.> vol. 52 (1929) pp. 1\U66.

    <bibitem|bochner>S. Bochner, <em|Fouriersche Integrale>, Leipzig, 1932,
    227 pp.

    <bibitem|carleman>T. Carleman, Sur les équations intégrales singulières à
    noyau réel et symétrique, <em|Uppsala Universitets Årsskrift>, 1923, 228
    pp.

    <bibitem|devinatz>A. Devinatz, Transformations in reproducing kernel
    spaces, Thesis, Harvard University, 1950.

    <bibitem|hausdorff>F. Hausdorff, Summationsmethoden und Momentfolgen,
    <em|Math. Zeit.> vol. 9 (1921) I pp. 74\U109, II pp. 280\U299.

    <bibitem|krein1>M. Krein, On a remarkable class of Hermitian operators,
    <em|C.R. (Doklady) Acad. Sci. URSS. N.S.> vol. 44 (1944) pp. 175\U179.

    <bibitem|krein2>M. Krein, On a generalized problem of moments, <em|C.R.
    (Doklady) Acad. Sci. URSS N.S.> vol. 44 (1944) pp. 219\U222.

    <bibitem|krein3>M. Krein, Infinite J-matrices and matrices of the moment
    problem (in Russian), <em|Doklady Acad. Nauk SSSR N.S.> vol. 69 (1949)
    pp. 125\U128.

    <bibitem|krein-krasnoselskii>M. Krein and M. A. Krasnoselskiï,
    Fundamental theorems on the extension of Hermitian operators and certain
    of their applications to the theory of orthogonal polynomials and the
    problem of moments (in Russian) <em|Uspehi Matematicheskih Nauk N.S.>
    vol. 2 (1947) pp. 60\U106.

    <bibitem|livshitz>M. Livshitz, On an application of the theory of
    Hermitian operators to the generalized problem of moments, <em|C.R.
    (Doklady) Acad. Sci. URSS N.S.> vol. 44 (1944) pp. 3\U7.

    <bibitem|neumann>J. V. Neumann, <em|Functional operators>, vol. 1, Annals
    of Mathematics Studies, no. 21, Princeton University Press, 1950, 261 pp.

    <bibitem|neumark>M. A. Neumark, On extremal spectral functions of a
    symmetric operator, <em|C.R. (Doklady) Acad. Sci. URSS. N.S.> vol. 54
    (1946) pp. 7\U9.

    <bibitem|shohat-tamarkin>J. A. Shohat and J. D. Tamarkin, <em|The problem
    of moments>, Mathematical Surveys, vol. 2, New York, American
    Mathematical Society, 1943, 144 pp.

    <bibitem|stone>M. H. Stone, <em|Linear transformations in Hilbert space>,
    Amer. Math. Soc. Colloquium Publications, vol. 15, New York, 1932, 622
    pp.

    <bibitem|nagy>B. v. Sz. Nagy, <em|Spektraldarstellung linearer
    Transformationen des Hilbertschen Raumes>, Ergebnisse der Mathematik und
    ihrer Grenzgebiete, no. 5, 1942, Berlin, 80 pp.

    <bibitem|widder1>D. V. Widder, Necessary and sufficient conditions for
    the representation of a function as a Laplace integral, <em|Trans. Amer.
    Math. Soc.> vol. 33 (1931) pp. 851\U892.

    <bibitem|widder2>D. V. Widder, Necessary and sufficient conditions for
    the representation of a function by a doubly infinite Laplace integral,
    <em|Bull. Amer. Math. Soc.> vol. 40 (1934) pp. 321\U326.

    <bibitem|widder3>D. V. Widder, <em|The Laplace transform>, Princeton,
    1941, 406 pp.
  </thebibliography>
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
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|4>>
    <associate|auto-4|<tuple|4|6>>
    <associate|auto-5|<tuple|5|8>>
    <associate|auto-6|<tuple|6|21>>
    <associate|auto-7|<tuple|3|22>>
    <associate|bib-achieser-krein|<tuple|achieser-krein|22>>
    <associate|bib-aronszajn1|<tuple|aronszajn1|22>>
    <associate|bib-aronszajn2|<tuple|aronszajn2|22>>
    <associate|bib-bernstein|<tuple|bernstein|22>>
    <associate|bib-bochner|<tuple|bochner|22>>
    <associate|bib-carleman|<tuple|carleman|22>>
    <associate|bib-devinatz|<tuple|devinatz|22>>
    <associate|bib-hausdorff|<tuple|hausdorff|22>>
    <associate|bib-krein-krasnoselskii|<tuple|krein-krasnoselskii|22>>
    <associate|bib-krein1|<tuple|krein1|22>>
    <associate|bib-krein2|<tuple|krein2|22>>
    <associate|bib-krein3|<tuple|krein3|22>>
    <associate|bib-livshitz|<tuple|livshitz|22>>
    <associate|bib-nagy|<tuple|nagy|22>>
    <associate|bib-neumann|<tuple|neumann|22>>
    <associate|bib-neumark|<tuple|neumark|22>>
    <associate|bib-shohat-tamarkin|<tuple|shohat-tamarkin|22>>
    <associate|bib-stone|<tuple|stone|22>>
    <associate|bib-widder1|<tuple|widder1|22>>
    <associate|bib-widder2|<tuple|widder2|22>>
    <associate|bib-widder3|<tuple|widder3|22>>
    <associate|def:correspondence|<tuple|1|3>>
    <associate|eq:adjoint-correspondence|<tuple|4|5>>
    <associate|eq:alternative-representation|<tuple|19|11>>
    <associate|eq:analytic-function|<tuple|34|13>>
    <associate|eq:aronszajn-representation|<tuple|8|6>>
    <associate|eq:bound-estimate|<tuple|37|14>>
    <associate|eq:bounded-operator|<tuple|3|4>>
    <associate|eq:commutation-decomposition|<tuple|54|18>>
    <associate|eq:commutation-result|<tuple|57|18>>
    <associate|eq:commutation-step1|<tuple|52|17>>
    <associate|eq:commutation-step2|<tuple|53|18>>
    <associate|eq:continuous-spectral|<tuple|42|15>>
    <associate|eq:convergence-setup|<tuple|23|11>>
    <associate|eq:cosine-bound|<tuple|47|16>>
    <associate|eq:cosine-condition|<tuple|15|9>>
    <associate|eq:cosine-integral|<tuple|50|17>>
    <associate|eq:cutoff-function|<tuple|12|7>>
    <associate|eq:discrete-representation|<tuple|33|13>>
    <associate|eq:discrete-spectral|<tuple|41|15>>
    <associate|eq:eta-bound|<tuple|28|12>>
    <associate|eq:final-representation|<tuple|64|19>>
    <associate|eq:function-integral|<tuple|20|11>>
    <associate|eq:function-representation|<tuple|9|7>>
    <associate|eq:half-power|<tuple|40|15>>
    <associate|eq:higher-dimensional-representation|<tuple|51|17>>
    <associate|eq:integral-equality|<tuple|56|18>>
    <associate|eq:joint-spectral-family|<tuple|61|19>>
    <associate|eq:kernel-representation|<tuple|44|15>>
    <associate|eq:limit-function|<tuple|26|11>>
    <associate|eq:limit-representation|<tuple|45|16>>
    <associate|eq:lower-bound|<tuple|6|5>>
    <associate|eq:main-representation|<tuple|14|9>>
    <associate|eq:moment-formula|<tuple|18|10>>
    <associate|eq:moment-integral|<tuple|78|21>>
    <associate|eq:moment-representation|<tuple|16|10>>
    <associate|eq:monotone-increasing|<tuple|13|8>>
    <associate|eq:norm-convergence|<tuple|24|11>>
    <associate|eq:norm-representation|<tuple|10|7>>
    <associate|eq:operator-convergence|<tuple|25|11>>
    <associate|eq:operator-definition|<tuple|21|11>>
    <associate|eq:operator-definition-2|<tuple|43|15>>
    <associate|eq:operator-product|<tuple|2|2>>
    <associate|eq:operator-representation|<tuple|39|15>>
    <associate|eq:positive-hermitian|<tuple|1|1>>
    <associate|eq:positivity|<tuple|5|5>>
    <associate|eq:product-operators|<tuple|62|19>>
    <associate|eq:projections-commute|<tuple|59|18>>
    <associate|eq:real-operator|<tuple|7|6>>
    <associate|eq:reduced-spectral|<tuple|32|13>>
    <associate|eq:resolution-definition|<tuple|11|7>>
    <associate|eq:spectral-bound|<tuple|31|13>>
    <associate|eq:spectral-commutation|<tuple|58|18>>
    <associate|eq:spectral-family|<tuple|29|12>>
    <associate|eq:spectral-formula|<tuple|63|19>>
    <associate|eq:spectral-integral|<tuple|38|15>>
    <associate|eq:spectral-properties|<tuple|30|12>>
    <associate|eq:spectral-representation|<tuple|17|10>>
    <associate|eq:stone-representation|<tuple|49|16>>
    <associate|eq:sufficiency-conclusion|<tuple|77|21>>
    <associate|eq:sufficiency-step1|<tuple|71|20>>
    <associate|eq:sufficiency-step2|<tuple|72|20>>
    <associate|eq:sufficiency-step3|<tuple|73|20>>
    <associate|eq:sufficiency-step4|<tuple|74|20>>
    <associate|eq:sufficiency-step5|<tuple|75|20>>
    <associate|eq:sufficiency-step6|<tuple|76|20>>
    <associate|eq:uniform-bound|<tuple|36|13>>
    <associate|eq:uniqueness-step1|<tuple|65|19>>
    <associate|eq:uniqueness-step2|<tuple|66|19>>
    <associate|eq:uniqueness-step3|<tuple|67|19>>
    <associate|eq:uniqueness-step4|<tuple|69|19>>
    <associate|eq:uniqueness-step5|<tuple|70|20>>
    <associate|eq:unitary-representation|<tuple|60|18>>
    <associate|eq:unitary-spectral|<tuple|48|16>>
    <associate|eq:v1-definition|<tuple|55|18>>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnote-10|<tuple|10|8>>
    <associate|footnote-11|<tuple|11|8>>
    <associate|footnote-12|<tuple|12|9>>
    <associate|footnote-13|<tuple|13|10>>
    <associate|footnote-14|<tuple|14|12>>
    <associate|footnote-15|<tuple|15|14>>
    <associate|footnote-16|<tuple|16|14>>
    <associate|footnote-17|<tuple|17|14>>
    <associate|footnote-18|<tuple|18|16>>
    <associate|footnote-19|<tuple|19|16>>
    <associate|footnote-2|<tuple|2|1>>
    <associate|footnote-20|<tuple|20|19>>
    <associate|footnote-21|<tuple|21|19>>
    <associate|footnote-3|<tuple|3|3>>
    <associate|footnote-4|<tuple|4|4>>
    <associate|footnote-5|<tuple|5|5>>
    <associate|footnote-6|<tuple|6|6>>
    <associate|footnote-7|<tuple|7|5>>
    <associate|footnote-8|<tuple|8|6>>
    <associate|footnote-9|<tuple|9|6>>
    <associate|footnr-1|<tuple|1|1>>
    <associate|footnr-10|<tuple|10|8>>
    <associate|footnr-11|<tuple|11|8>>
    <associate|footnr-12|<tuple|12|9>>
    <associate|footnr-13|<tuple|13|10>>
    <associate|footnr-14|<tuple|14|12>>
    <associate|footnr-15|<tuple|15|14>>
    <associate|footnr-16|<tuple|16|14>>
    <associate|footnr-17|<tuple|17|15>>
    <associate|footnr-18|<tuple|18|16>>
    <associate|footnr-19|<tuple|19|16>>
    <associate|footnr-2|<tuple|2|1>>
    <associate|footnr-20|<tuple|20|19>>
    <associate|footnr-21|<tuple|21|19>>
    <associate|footnr-3|<tuple|3|3>>
    <associate|footnr-4|<tuple|4|4>>
    <associate|footnr-5|<tuple|5|5>>
    <associate|footnr-6|<tuple|6|6>>
    <associate|footnr-7|<tuple|7|6>>
    <associate|footnr-8|<tuple|8|6>>
    <associate|footnr-9|<tuple|9|6>>
    <associate|lem:analytic-extension|<tuple|9|13>>
    <associate|lem:higher-dimensional|<tuple|13|17>>
    <associate|lem:one-dimensional|<tuple|8|10>>
    <associate|lem:self-adjoint-operators|<tuple|10|14>>
    <associate|lem:spectral-representation|<tuple|11|15>>
    <associate|lem:unitary-group|<tuple|12|16>>
    <associate|sec:integral-representation|<tuple|4|6>>
    <associate|sec:main-theorem|<tuple|5|8>>
    <associate|sec:moment-problems|<tuple|6|21>>
    <associate|sec:preliminaries|<tuple|2|2>>
    <associate|sec:semi-bounded|<tuple|3|4>>
    <associate|thm:correspondence|<tuple|2|3>>
    <associate|thm:integral-space|<tuple|6|7>>
    <associate|thm:main|<tuple|7|9>>
    <associate|thm:moment-problems|<tuple|14|21>>
    <associate|thm:real-operators|<tuple|5|6>>
    <associate|thm:restriction|<tuple|3|4>>
    <associate|thm:semi-bounded|<tuple|4|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      aronszajn2

      krein1

      krein2

      krein3

      krein-krasnoselskii

      livshitz

      neumark

      shohat-tamarkin

      carleman

      stone

      aronszajn1

      aronszajn2

      aronszajn2

      aronszajn1

      aronszajn2

      nagy

      aronszajn2

      aronszajn2

      stone

      aronszajn2

      nagy

      nagy

      aronszajn2

      nagy

      aronszajn2

      neumann

      krein-krasnoselskii

      nagy

      aronszajn2

      aronszajn1

      bernstein

      widder2

      widder3

      nagy

      bochner

      livshitz

      achieser-krein
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Preliminaries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Semi-bounded
      and real operators> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Positive
      matrices represented by integrals> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      main theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Moment
      problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>