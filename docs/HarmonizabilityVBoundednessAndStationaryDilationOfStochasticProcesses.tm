<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Harmonizability, V-Boundedness and Stationary Dilation
  of Stochastic Processes>|<doc-author|<author-data|<author-name|A. G.
  MIAMEE, H. SALEHI>>>|<doc-date|January-February, 1978>>

  The main purpose of this paper is to show that a stochastic process
  <math|X<rsub|t>,t> in the real line <math|R>, with values in a given
  complex Hilbert space <math|<with|math-font|cal*|H>> is harmonizable if and
  only if it is the projection of some stationary process taking values in a
  larger Hilbert space <math|<with|math-font|cal*|K>>. Harmonizable processes
  are natural generalizations of stationary processes where the inner product
  <math|<around|(|X<rsub|t>,X<rsub|s>|)>> is continuous and depends only on
  <math|t-s>. It is well known that any stationary process
  <math|X<rsub|t>,t\<in\>R>, can be represented in the form

  <\equation>
    <label|eq:stationary>X<rsub|t>=<big|int><rsub|R>e<rsup|-i*t*u>*d*\<Phi\><around|(|u|)>
  </equation>

  where <math|\<Phi\>> is a countably additive orthogonally scattered
  <math|<with|math-font|cal*|H>>-valued measure on <math|R> such that the
  spectral measure <math|F> defined by

  <\equation>
    <label|eq:spectral_measure>F*<around|(|A\<cap\>B|)>=<around|(|\<Phi\><around|(|A|)>,\<Phi\><around|(|B|)>|)>
  </equation>

  is a bounded countably additive nonnegative measure for all <math|Borel
  sets A> and <math|B> (for the definition of orthogonally scattered
  measures, see <cite|masani>). In this case the correlation function
  <math|R<around|(|t,s|)>=<around|(|X<rsub|t>,X<rsub|s>|)>> has the
  representation

  <\equation>
    <label|eq:correlation>R<around|(|t,s|)>=<big|int><rsub|R>e<rsup|-i*<around|(|t-s|)>*u>*d*F<around|(|u|)>
  </equation>

  The notion of harmonizable processes was introduced by M. Loève
  <cite|loeve> as those processes <math|X<rsub|t>> for which

  <\equation>
    <label|eq:harmonizable1>X<rsub|t>=<big|int><rsub|R>e<rsup|-i*t*u>*d*\<Phi\><around|(|u|)>
  </equation>

  and

  <\equation>
    <label|eq:harmonizable2>R<around|(|t,s|)>=<big|int><big|int><rsub|R<rsup|2>>e<rsup|-i*<around|(|t*v-s*u|)>>*d*F<around|(|u,v|)>
  </equation>

  with <math|\<Phi\>> being a countably additive
  <math|<with|math-font|cal*|H>>-valued measure (not necessarily orthogonally
  scattered) and the spectral measure <math|F> being a complex-valued measure
  of bounded variation on the plane. We note that for a stationary process
  the spectral measure <math|F> can be realized as a measure on the plane
  which is concentrated on its diagonal. But for a harmonizable process this
  is not necessarily the case.

  Subsequently H. Cramér <cite|cramer> in his study of non-stationary
  processes obtained several important results concerning harmonizable
  sequences. Later J. L. Abreu <cite|abreu> considered these harmonizable
  processes and showed that they are projections of stationary processes
  taking values in some larger Hilbert space. With this setting the class of
  harmonizable processes fails to include projection of all stationary
  processes, a fact which was observed by Abreu in his work. A weaker
  definition of harmonizability was introduced by Yu. A. Rozanov in
  <cite|rozanov>. More precisely, he defined an
  <math|<with|math-font|cal*|H>>-valued process <math|X<rsub|t>> to be
  harmonizable if it can be represented as

  <\equation>
    <label|eq:harmonizable_rozanov>X<rsub|t>=<big|int><rsub|R>e<rsup|-i*t*u>*d*\<Phi\><around|(|u|)>
  </equation>

  where <math|\<Phi\>> is a countably additive measure with values in
  <math|<with|math-font|cal*|H>>, which is "strongly continuous" and of
  bounded semi-variation. The term "strong continuity" used by Rozanov means
  that the semi-variation <math|<around|\<\|\|\>|\<Phi\>|\<\|\|\>><around|(|\<cdummy\>|)>>
  is continuous from above at zero (for definition of the semi-variation
  <math|<around|\<\|\|\>|\<Phi\>|\<\|\|\>>> see <cite|dunford> and
  <cite|rozanov>). In view of IV. 10.5 <cite|dunford> the "strong continuity"
  of <math|\<Phi\>> assumed by Rozanov is automatically true. Hence we adopt
  the following definition for harmonizability:

  <\definition>
    <label|def:harmonizability>An <math|<with|math-font|cal*|H>>-valued
    process <math|X<rsub|t>,t\<in\>R>, is said to be harmonizable if
    <math|X<rsub|t>> can be represented as

    <\equation>
      <label|eq:def_harmonizable>X<rsub|t>=<big|int><rsub|R>e<rsup|-i*t*u>*d*\<Phi\><around|(|u|)>
    </equation>

    with <math|\<Phi\>> being a countably additive
    <math|<with|math-font|cal*|H>>-valued measure on <math|R> which is of
    bounded semi-variation.
  </definition>

  It is clear, as Rozanov pointed out in <cite|rozanov>, that the class of
  harmonizable processes contains projections of stationary processes. The
  main purpose of this article is to show that in fact these two class of
  processes are precisely the same (Theorem <reference|thm:main_theorem>). In
  other words our aim is to prove that an
  <math|<with|math-font|cal*|H>>-valued process is harmonizable if and only
  if it has a stationary dilation, i.e., it is the projection of some
  stationary process taking values in some larger Hilbert space
  <math|<with|math-font|cal*|K>>.

  Recently H. Niemi in a sequence of articles <cite|niemi1>, <cite|niemi2>,
  <cite|niemi3> studied bounded vector measures and their dilation as
  projection of orthogonally scattered measures. Using these results he
  characterized <cite|niemi4> continuous <math|V>-bounded processes, and
  showed that they are the same as projections of stationary processes.
  Combining this and our main result mentioned above, one concludes that the
  following are equivalent:

  <\enumerate>
    <item><label|item:harmonizable> <math|X<rsub|t>,t\<in\>R>, is a
    harmonizable process,

    <item><label|item:projection> <math|X<rsub|t>,t\<in\>R>, is projection of
    some stationary process,

    <item><label|item:vbounded> <math|X<rsub|t>,t\<in\>R>, is a continuous
    <math|V>-bounded process.
  </enumerate>

  However, we will obtain a direct proof for the equivalence of
  <reference|item:harmonizable> and <reference|item:vbounded>, (see also
  <cite|kluvanek>), and hence providing a considerably shorter proof for
  Niemi's result. We should also point out that in Niemi's work a bounded
  vector measure means a bounded linear operator on
  <math|C<rsub|0><around|(|R|)>> into a Hilbert space, whereas in our study
  we work with the usual vector valued measures, which naturally appear in
  the study of spectral theory of stochastic processes.

  In the course of our proof we will make extensive use of the ideas and the
  techniques occurring in the works of R. Rogge <cite|rogge> and A. Pietsch
  <cite|pietsch> concerning 2 majorizable operators on a Hilbert space. In
  this connection see also <cite|dubinsky> and <cite|grothendieck>.

  In this paper we use the concept of integration with respect to a finitely
  additive measure <math|F> as introduced by Rozanov in <cite|rozanov>. The
  reader may find it convenient to be familiar with this paper. We will use
  the following characterization of harmonizable processes which is a slight
  modification of Theorem 1.2, <cite|rozanov>.

  <\theorem>
    <label|thm:characterization>In order that an
    <math|<with|math-font|cal*|H>>-valued process <math|X<rsub|t>,t\<in\>R>,
    be harmonizable, it is necessary and sufficient that the correlation
    function <math|R<around|(|t,s|)>> can be represented in the form

    <\equation>
      <label|eq:characterization>R<around|(|t,s|)>=<big|int><big|int><rsub|R<rsup|2>>e<rsup|-i*<around|(|t*v-s*u|)>>*d*F<around|(|u,v|)>
    </equation>

    where <math|F<around|(|A,B|)>=<around|(|\<Phi\><around|(|A|)>,\<Phi\><around|(|B|)>|)>,A>
    and B Borel sets; <math|\<Phi\>> as in Definition
    <reference|def:harmonizability>, and the spectral measure <math|F> has
    the following properties:

    <\enumerate>
      <item><label|item:finitely_additive> <math|F> is finitely additive on
      the algebra of rectangles,

      <item><label|item:continuous_zero> <math|F> is continuous from above at
      zero, in the sense that <math|F<around|(|A<rsub|i>,B<rsub|j>|)>> tends
      to zero if <math|A<rsub|i>> and <math|B<rsub|j>> converge monotonically
      to the empty set.

      <item><label|item:positive_definite> <math|F> is positive definite,
      i.e., for any set of complex numbers
      <math|\<alpha\><rsub|1>,\<alpha\><rsub|2>,\<cdots\>*\<alpha\><rsub|n>>,

      <\equation>
        <label|eq:positive_definite><big|sum><rsub|i,j=1><rsup|n>a<rsub|i>*<wide|\<alpha\>|\<bar\>><rsub|j>*F<around|(|A<rsub|i>,A<rsub|j>|)>\<geq\>0
      </equation>

      <item><label|item:bounded_semi_var> <math|F> is of bounded
      semi-variation.
    </enumerate>
  </theorem>

  In his paper <cite|rozanov> Rozanov, in addition, assumed that <math|F> is
  "strongly continuous\Q, i.e., the semi-variation of <math|F> is continuous
  from above at zero. It is not hard to show that properties
  <reference|item:finitely_additive>-<reference|item:bounded_semi_var> imply
  this "strong continuity."

  In order to establish our main theorem we first prove two lemmas. In the
  proof of these lemmas we have borrowed the techniques contained in
  <cite|pietsch> and <cite|rogge>, and we are happy to acknowledge it here.
  For the sake of completeness and the benefit of readers we summarize some
  preliminary results contained in <cite|rogge>. Let
  <math|R<rsup|n>*<around|(|n\<geq\>2|)>> be the <math|n>-dimensional real
  Euclidean space with the usual norm and inner product
  <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>>,<around|(|\<cdummy\>,\<cdummy\>|)>>;
  <math|A<rsub|n>> the unit sphere of <math|R<rsup|n>>, and <math|m<rsub|n>>
  the normalized Haar measure on <math|A<rsub|n>>. By elementary integration
  one can obtain:

  <\equation>
    <label|eq:integration_results><around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|<big|int><rsub|A<rsub|n>><around|(|r,t|)><around|(|s,t|)>*d*m<rsub|n><around|(|t|)>=<frac|1|n>*<around|(|r,s|)>>>|<row|<cell|<around|\<\|\|\>|r|\<\|\|\>>*<big|int><rsub|A<rsub|n>><math-up|sign><around|[|<around|(|r,t|)>|]><around|(|s,t|)>*d*m<rsub|n><around|(|t|)>=\<rho\><rsub|n>*<around|(|r,s|)>>>|<row|<cell|<big|int><rsub|A<rsub|n>><around|\||<around|(|r,t|)>|\|>*d*m<rsub|n><around|(|t|)>=\<rho\><rsub|n><around|\<\|\|\>|r|\<\|\|\>>>>>>>|\<nobracket\>>
  </equation>

  where <math|>

  <\equation>
    \<rho\><rsub|n>=<frac|\<Gamma\><around*|(|<frac|n|2>|)>|<sqrt|\<pi\>>*\<Gamma\><around*|(|<frac|n+1|2>|)>>
  </equation>

  Moreover, one can see that <math|n*\<rho\><rsub|n><rsup|2>\<gtr\><frac|2|\<pi\>>>.\ 

  Let <math|L<rsub|2><around|(|A<rsub|n>,m<rsub|n>|)>> be the usual Hilbert
  space of real-valued square summable functions on <math|A<rsub|n>>. We
  define two operators <math|P<rsub|n>> and <math|Q<rsub|n>> on
  <math|L<rsub|2><around|(|A<rsub|n>,m<rsub|n>|)>> as follows:

  <\equation>
    <around|(|P<rsub|n>*f|)><around|(|s|)>=n*<big|int><rsub|A<rsub|n>><around|(|s,t|)>*f<around|(|t|)>*d*m<rsub|n><around|(|t|)>
  </equation>

  <\equation>
    <around|(|Q<rsub|n>*f|)><around|(|s|)>=<big|int><rsub|A<rsub|n>><math-up|sign><around|[|<around|(|s,t|)>|]>*f<around|(|t|)>*d*m<rsub|n><around|(|t|)><label|eq:operators>
  </equation>

  <math|P<rsub|n>> and <math|Q<rsub|n>> are linear operators. As shown in
  <cite|rogge>, using relations <eqref|eq:integration_results>, one can
  verify that <math|>

  <\equation>
    <frac|\<pi\>|2>*Q<rsub|n><rsup|2>-<frac|1|n>*P<rsub|n>
  </equation>

  \ is a non-negative Hermitian operator in
  <math|L<rsub|2><around|(|A<rsub|n>,m<rsub|n>|)>>, i.e.,

  <\equation>
    <label|eq:operator_inequality><frac|\<pi\>|2>*<around|(|Q<rsub|n><rsup|2>*f,f|)>\<geq\><frac|1|n>*<around|(|P<rsub|n>*f,f|)><space|1em><text|for
    all >f\<in\>L<rsub|2><around|(|A<rsub|n>,m<rsub|n>|)>
  </equation>

  Define the kernel <math|L<around|(|\<cdummy\>,\<cdummy\>|)>> by

  <\equation>
    <label|eq:kernel>L<around|(|r,s|)>=<big|int><rsub|A<rsub|n>><math-up|sign><around|[|<around|(|r,t|)>|]><math-up|sign><around|[|<around|(|s,t|)>|]>*d*m<rsub|n><around|(|t|)>
  </equation>

  Simple computation on <eqref|eq:operator_inequality> shows that for all
  <math|f\<in\>L<rsub|2><around|(|A<rsub|n>,m<rsub|n>|)>>,

  <\equation>
    <label|eq:kernel_inequality><tabular|<tformat|<table|<row|<cell|>|<cell|<big|int><rsub|A<rsub|n>><big|int><rsub|A<rsub|n>><around|(|r,s|)>*f<around|(|r|)>*f<around|(|s|)>*d*m<rsub|n><around|(|r|)>*d*m<rsub|n><around|(|s|)>>>|<row|<cell|\<leq\>>|<cell|<frac|\<pi\>|2>*<big|int><rsub|A<rsub|n>><big|int><rsub|A<rsub|n>>L<around|(|r,s|)>*f<around|(|r|)>*f<around|(|s|)>*d*m<rsub|n><around|(|r|)>*d*m<rsub|n><around|(|s|)>>>>>>
  </equation>

  Let <math|\<lambda\><rsub|1>,\<lambda\><rsub|2>*\<cdots\>,\<lambda\><rsub|n>>
  be any set of real numbers and <math|t<rsub|1>,t<rsub|2>,\<cdots\>,t<rsub|n>>
  be any set of vectors in <math|R<rsup|n>>. Apply
  <eqref|eq:kernel_inequality> to the function\ 

  <\equation>
    f<around|(|r|)>=<big|sum><rsub|i=1><rsup|n>\<lambda\><rsub|i>*<around|(|r,t<rsub|i>|)>
  </equation>

  Using relations <eqref|eq:integration_results> and the definition of the
  kernel <math|L<around|(|\<cdummy\>,\<cdummy\>|)>>, some routine
  calculations show that

  <\equation>
    <label|eq:real_numbers><big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m><around|(|t<rsub|i>,t<rsub|j>|)>*\<lambda\><rsub|i>*\<lambda\><rsub|j>\<leq\><frac|\<pi\>|2>*<big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m>L<around|(|t<rsub|i>,t<rsub|j>|)><around|\<\|\|\>|t<rsub|i>|\<\|\|\>><around|\<\|\|\>|t<rsub|j>|\<\|\|\>>*\<lambda\><rsub|i>*\<lambda\><rsub|j>
  </equation>

  Now since the matrix\ 

  <\equation>
    <around*|[|<frac|\<pi\>|2>*L<around|(|t<rsub|i>,t<rsub|j>|)><around|\<\|\|\>|t<rsub|i>|\<\|\|\>>\<\|\|\>t<rsub|i>\<\|\|\>-<around|(|t<rsub|i>,t<rsub|j>|)>|]><rsub|i,j=1><rsup|n>
  </equation>

  \ is symmetric with real entries, <eqref|eq:real_numbers> implies the
  corresponding relation for the complex numbers
  <math|\<lambda\><rsub|1>*\<lambda\><rsub|2>,\<cdots\>,\<lambda\><rsub|n>>,
  i.e., we have

  <\equation>
    <label|eq:complex_numbers><big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m><around|(|t<rsub|i>,t<rsub|j>|)>*\<lambda\><rsub|i>*<wide|\<lambda\>|\<bar\>><rsub|j>\<leq\><frac|\<pi\>|2>*<big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m>L<around|(|t<rsub|i>,t<rsub|j>|)><around|\<\|\|\>|t<rsub|i>|\<\|\|\>><around|\<\|\|\>|t<rsub|j>|\<\|\|\>>*\<lambda\><rsub|i>*<wide|\<lambda\>|\<bar\>><rsub|j>
  </equation>

  for any set <math|\<lambda\><rsub|1>,\<lambda\><rsub|2>,\<cdots\>,\<lambda\><rsub|n>>
  of complex numbers and any set <math|t<rsub|1>,t<rsub|2>,\<cdots\>,t<rsub|n>>
  of vectors in <math|R<rsup|n>>.

  <\lemma>
    <label|lem:spectral_bound>Let <math|X<rsub|t>,t\<in\>R>, be an
    <math|<with|math-font|cal*|H>>-valued harmonizable process with the
    spectral measure F as in Theorem <reference|thm:characterization>, then
    there exists a positive number <math|c> such that

    <\enumerate>
      <item><label|item:bound_a>

      <\equation>
        <label|eq:bound_a><around*|\||<big|int><big|int><rsub|R<rsup|2>>\<varphi\><around|(|s|)>*\<psi\><around|(|t|)>*d*F<around|(|s,t|)>|\|>\<leq\>c<around|\<\|\|\>|\<varphi\>|\<\|\|\>><rsub|\<infty\>><around|\<\|\|\>|\<psi\>|\<\|\|\>><rsub|\<infty\>>
      </equation>

      for any pair <math|\<varphi\>> and <math|\<psi\>> of bounded measurable
      complex-valued functions on <math|R>, and

      <item><label|item:bound_b>

      <\equation>
        <label|eq:bound_b><big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<varphi\><rsub|k><around|(|s|)>*<wide|\<varphi\>|\<bar\>><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>\<leq\>\<pi\>*c*sup<rsub|t\<in\>R>
        <big|sum><rsub|k=1><rsup|n><around|\||\<varphi\><rsub|k><around|(|t|)>|\|><rsup|2>
      </equation>

      for any set <math|<around|{|\<varphi\><rsub|1>,\<varphi\><rsub|2>,\<cdots\>,\<varphi\><rsub|n>|}>>
      of bounded measurable complex-valued functions on <math|R>.
    </enumerate>
  </lemma>

  <\proof>
    <\enumerate>
      <item>This follows from <cite|rozanov> with
      <math|c=<around|\<\|\|\>|F|\<\|\|\>><around|(|R|)>>.

      <item>First we assume that the function
      <math|\<varphi\><rsub|1>,\<varphi\><rsub|2>,\<cdots\>,\<varphi\><rsub|n>>
      are real-valued. Without loss of generality we may assume that <math|c>
      in part <reference|item:bound_a> is one, and hence assuming
      <math|<around|\<\|\|\>|\<varphi\><rsub|k>|\<\|\|\>><rsub|\<infty\>><rsup|2>=1>,
      we show that

      <\equation>
        <label|eq:proof_real><big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<varphi\><rsub|k><around|(|s|)>*\<varphi\><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>\<leq\>\<pi\>
      </equation>

      It suffices to assume that <math|\<varphi\><rsub|1>,\<varphi\><rsub|2>,\<cdots\>,\<varphi\><rsub|n>>
      are simple functions (the general case then follows from approximating
      the <math|\<varphi\>>'s by simple functions). We may write

      <\equation>
        \<varphi\><rsub|k>=<big|sum><rsub|i=1><rsup|m>\<varphi\><rsub|k><around|(|t<rsub|i>|)>*\<chi\><rsub|U<rsub|i>>\<forall\>k=1,2,\<ldots\>,n
      </equation>

      where <math|U<rsub|1>,U<rsub|2>,\<cdots\>,U<rsub|m>> is a disjoint
      covering of <math|R> and <math|t<rsub|i>\<in\>U<rsub|i>> for each
      <math|i>. We have

      <\equation>
        <label|eq:simple_functions><big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<varphi\><rsub|k><around|(|s|)>*\<varphi\><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>=<big|sum><rsub|k=1><rsup|n><big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m>\<varphi\><rsub|k><around|(|t<rsub|i>|)>*\<varphi\><rsub|k><around|(|t<rsub|j>|)>*F<around|(|U<rsub|i>,U<rsub|j>|)>
      </equation>

      Now for any set of complex numbers <math|<around|{|\<gamma\><rsub|i>|}><rsub|i=1><rsup|m>>
      with\ 

      <\equation>
        <big|sum><rsub|i=1><rsup|m><around|\||\<gamma\><rsub|i>|\|><rsup|2>=1
      </equation>

      ,e have

      <\equation>
        <label|eq:complex_inequality><around*|\||<big|int><big|int><rsub|R<rsup|2>><around*|(|<big|sum><rsub|i=1><rsup|m>\<gamma\><rsub|i>*\<chi\><rsub|U<rsub|i>><around|(|s|)>|)><around*|(|<big|sum><rsub|j=1><rsup|m>\<gamma\><rsub|j>*\<chi\><rsub|U<rsub|j>><around|(|t|)>|)>*d*F<around|(|s,t|)>|\|>\<leq\>1
      </equation>

      because\ 

      <\equation>
        <around|\<\|\|\>|<big|sum><rsub|i=1><rsup|m>\<gamma\><rsub|i>*\<chi\><rsub|U<rsub|i>>|\<\|\|\>><rsub|\<infty\>>\<leq\>1
      </equation>

      and <reference|item:bound_a> applies with

      <\equation>
        \<varphi\>=\<psi\>=<big|sum><rsub|i=1><rsup|m>\<gamma\><rsub|i>*\<chi\><rsub|U<rsub|i>>
      </equation>

      Define the operator <math|S:R\<to\>R<rsup|n>> by

      <\equation>
        <label|eq:operator_S>S<around|(|t|)>=<around|(|\<varphi\><rsub|1><around|(|t|)>,\<varphi\><rsub|2><around|(|t|)>,\<cdots\>,\<varphi\><rsub|n><around|(|t|)>|)>
      </equation>

      For any <math|s,t\<in\>R> we have

      <\equation>
        <label|eq:S_properties><around|(|S<around|(|s|)>,S<around|(|t|)>|)>=<big|sum><rsub|k=1><rsup|n>\<varphi\><rsub|k><around|(|s|)>*\<varphi\><rsub|k><around|(|t|)><space|1em><text|and><space|1em><around|\<\|\|\>|S<around|(|t|)>|\<\|\|\>>\<leq\>1
      </equation>

      Now from <eqref|eq:simple_functions> we can write

      <with|font-base-size|8|<\align>
        <tformat|<table|<row|<cell|<big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<varphi\><rsub|k><around|(|s|)>*\<varphi\><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>>|<cell|=<big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m><around|(|S<around|(|t<rsub|i>|)>,S<around|(|t<rsub|j>|)>|)>*F<around|(|U<rsub|i>,U<rsub|j>|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m><big|sum><rsub|\<beta\>><around|(|\<Phi\><around|(|U<rsub|i>|)>,e<rsub|\<beta\>>|)><around|(|\<Phi\><around|(|U<rsub|j>|)>,e<rsub|\<beta\>>|)><around|(|S<around|(|t<rsub|i>|)>,S<around|(|t<rsub|j>|)>|)><eq-number>>>>>
      </align>>

      where <math|<around|{|e<rsub|\<beta\>>|}>> is an orthonormal system for
      the Hilbert space <math|<with|math-font|cal*|H>>, and <math|\<Phi\>> is
      as in Theorem <reference|thm:characterization>. Now bringing the sum
      over <math|\<beta\>> out and using <eqref|eq:complex_numbers> we get

      <with|font-base-size|6|<\align>
        <tformat|<cwith|2|-1|1|-1|font-base-size|7>|<table|<row|<cell|<big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<varphi\><rsub|k><around|(|s|)>*\<varphi\><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>>|<cell|<with|font-base-size|5|\<leq\><frac|\<pi\>|2>*<big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m><big|sum><rsub|\<beta\>>L<around|(|S<around|(|t<rsub|i>|)>,S<around|(|t<rsub|j>|)>|)>*<around|\<\|\|\>|S<around|(|t<rsub|i>|)><around|\<\|\|\>||\<\|\|\>>*S<around|(|t<rsub|j>|)>|\<\|\|\>><around|(|\<Phi\><around|(|U<rsub|i>|)>,e<rsub|\<beta\>>|)><around|(|\<Phi\><around|(|U<rsub|j>|)>,e<rsub|\<beta\>>|)>><eq-number>>>|<row|<cell|>|<cell|=<frac|\<pi\>|2>*<big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m>L<around|(|S<around|(|t<rsub|i>|)>,S<around|(|t<rsub|j>|)>|)>*<around|\<\|\|\>|S<around|(|t<rsub|i>|)><around|\<\|\|\>||\<\|\|\>>*S<around|(|t<rsub|j>|)>|\<\|\|\>><around|(|\<Phi\><around|(|U<rsub|i>|)>,\<Phi\><around|(|U<rsub|j>|)>|)><eq-number>>>|<row|<cell|>|<cell|=<frac|\<pi\>|2>*<big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m>L<around|(|S<around|(|t<rsub|i>|)>,S<around|(|t<rsub|j>|)>|)>*<around|\<\|\|\>|S<around|(|t<rsub|i>|)><around|\<\|\|\>||\<\|\|\>>*S<around|(|t<rsub|j>|)>|\<\|\|\>>*F<around|(|U<rsub|i>,U<rsub|j>|)><eq-number>>>|<row|<cell|>|<cell|=<frac|\<pi\>|2>*<big|int><rsub|A<rsub|n>><big|sum><rsub|i=1><rsup|m><big|sum><rsub|j=1><rsup|m>F<around|(|U<rsub|i>,U<rsub|j>|)>\<gamma\><rsub|i>
        \<gamma\><rsub|j>*d*m<rsub|n><around|(|p|)>.<eq-number>>>>>
      </align>>

      where

      <\equation>
        \<gamma\><rsub|i>=<text|sign><around|[|<around|(|S<around|(|t<rsub|i>|)>,p|)>|]><around|\<\|\|\>|S<around|(|t<rsub|i>|)>|\<\|\|\>>
      </equation>

      \ Using <eqref|eq:complex_inequality> we get

      <\align>
        <tformat|<cwith|1|-1|1|-1|font-base-size|7>|<table|<row|<cell|<big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<varphi\><rsub|k><around|(|s|)>*\<varphi\><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>>|<cell|\<leq\><frac|\<pi\>|2>*<big|int><rsub|A<rsub|n>><around*|\||<big|int><big|int><rsub|R<rsup|2>><around*|(|<big|sum><rsub|i=1><rsup|m>\<gamma\><rsub|I>*\<chi\><rsub|U<rsub|i>><around|(|s|)>|)>|\<nobracket\>><eq-number>>>|<row|<cell|>|<cell|<space|1em><around*|\<nobracket\>|<around*|(|<big|sum><rsub|j=1><rsup|m>\<gamma\><rsub|j>*\<chi\><rsub|U<rsub|j>><around|(|t|)>|)>*d*F<around|(|s,t|)>|\|>*d*m<rsub|n><around|(|p|)><eq-number>>>|<row|<cell|>|<cell|\<leq\><frac|\<pi\>|2>*<big|int><rsub|A<rsub|n>>d*m<rsub|n><around|(|p|)>=<frac|\<pi\>|2>\<cdot\>2=\<pi\><eq-number>>>>>
      </align>

      Thus for any arbitrary real-valued bounded measurable functions
      <math|\<varphi\><rsub|1>,\<varphi\><rsub|2>,\<cdots\>,\<varphi\><rsub|n>>
      we have

      <\equation>
        <label|eq:final_real><big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<varphi\><rsub|k><around|(|s|)>*\<varphi\><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>\<leq\>\<pi\>*c*sup<rsub|t\<in\>R>
        <big|sum><rsub|k=1><rsup|n>\<varphi\><rsub|k><around|(|t|)><rsup|2>
      </equation>

      This completes the proof of <reference|item:bound_b> for the
      real-valued <math|\<varphi\>>'s. Now let
      <math|\<varphi\><rsub|1>,\<varphi\><rsub|2>,\<cdots\>,\<varphi\><rsub|n>>
      be complex-valued bounded measurable functions. Writing

      <\equation>
        \<varphi\><rsub|k><around|(|t|)>=\<alpha\><rsub|k><around|(|t|)>+i*\<beta\><rsub|k><around|(|t|)>\<forall\>k=1,2,\<ldots\>,n
      </equation>

      \ we have

      <\align>
        <tformat|<cwith|1|-1|1|-1|font-base-size|6>|<table|<row|<cell|0\<leq\><big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<varphi\><rsub|k><around|(|s|)>*<wide|\<varphi\>|\<bar\>><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>>|<cell|=<big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>><around|(|\<alpha\><rsub|k><around|(|s|)>+i*\<beta\><rsub|k><around|(|s|)>|)>*<around|(|\<alpha\><rsub|k><around|(|t|)>-i*\<beta\><rsub|k><around|(|t|)>|)>*d*F<around|(|s,t|)><eq-number>>>|<row|<cell|>|<cell|=<big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<alpha\><rsub|k><around|(|s|)>*\<alpha\><rsub|k><around|(|t|)>*d*F<around|(|s,t|)><eq-number>>>|<row|<cell|>|<cell|+<big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<beta\><rsub|k><around|(|s|)>*\<beta\><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>>>|<row|<cell|>|<cell|+i*<big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>><around|(|\<beta\><rsub|k><around|(|s|)>*\<alpha\><rsub|k><around|(|t|)>-\<alpha\><rsub|k><around|(|s|)>*\<beta\><rsub|k><around|(|t|)>|)>*d*F<around|(|s,t|)><eq-number>>>>>
      </align>

      Clearly the third term is zero. By <eqref|eq:final_real> each of the
      first two terms are less than or equal to

      <\equation>
        <frac|\<pi\>*c|2>*sup<rsub|t\<in\>R>
        <big|sum><rsub|k=1><rsup|n><around|(|<around|\||\<alpha\><rsub|k><around|(|t|)>|\|><rsup|2>+<around|\||\<beta\><rsub|k><around|(|t|)>|\|><rsup|2>|)>=<frac|\<pi\>*c|2>*sup<rsub|t\<in\>R>
        <big|sum><rsub|k=1><rsup|n><around|\||\<varphi\><rsub|k><around|(|t|)>|\|><rsup|2>
      </equation>

      These complete the proof of part <reference|item:bound_b>.
    </enumerate>

    \;
  </proof>

  <\lemma>
    <label|lem:dom_measure>Let <math|X<rsub|t>> be a harmonizable process
    with the spectral measure <math|F>, then there exists a bounded regular
    countably additive nonnegative measure <math|\<mu\>> on <math|R> such
    that

    <\equation>
      <label|eq:dom_measure><around*|\||<big|int><big|int><rsub|R<rsup|2>>\<varphi\><around|(|s|)>*\<psi\><around|(|t|)>*d*F<around|(|s,t|)>|\|>\<leq\><around*|(|<big|int><rsub|R><around|\||\<varphi\><around|(|t|)>|\|><rsup|2>*d*\<mu\><around|(|t|)>|)><rsup|1/2><around*|(|<big|int><rsub|R><around|\||\<psi\><around|(|t|)>|\|><rsup|2>*d*\<mu\><around|(|t|)>|)><rsup|1/2>
    </equation>

    for any bounded measurable complex-valued function <math|\<varphi\>> on
    <math|R>.
  </lemma>

  <\proof>
    By Lemma <reference|lem:spectral_bound> there exists a positive number
    <math|\<rho\>> such that

    <\equation>
      <label|eq:rho_inequality><big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<varphi\><rsub|k><around|(|s|)>*<wide|\<varphi\>|\<bar\>><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>\<leq\>\<rho\>*sup<rsub|t\<in\>R>
      <big|sum><rsub|k=1><rsup|n><around|\||\<varphi\><rsub|k><around|(|t|)>|\|><rsup|2>
    </equation>

    for any set <math|<around|{|\<varphi\><rsub|1>,\<varphi\><rsub|2>,\<cdots\>,\<varphi\><rsub|n>|}>>
    of bounded measurable complex-valued functions. Define a functional
    <math|S> on the class <math|C<rsub|R><around|(|R|)>> of all bounded
    continuous real-valued functions by

    <with|font-base-size|9|<\equation>
      <label|eq:S_functional>S<around|(|\<psi\>|)>=inf
      <around*|{|sup<rsub|t\<in\>R> <big|sum><rsub|k=1><rsup|n>\|\<varphi\><rsub|k><around|(|t|)>*<around|\||<rsup|2>+\<rho\>*<big|sum><rsub|k=1><rsup|n>|\|>*\<psi\><around|(|t|)>-\<varphi\><rsub|k><around|(|t|)>\|<rsup|2>-<big|sum><rsub|k=1><rsup|n><big|int><big|int><rsub|R<rsup|2>>\<varphi\><rsub|k><around|(|s|)>*<wide|\<varphi\>|\<bar\>><rsub|k><around|(|t|)>*d*F<around|(|s,t|)>|}>
    </equation>>

    where the infinum is taken over all finite sets
    <math|<around|{|\<varphi\><rsub|1>,\<varphi\><rsub|2>,\<cdots\>,\<varphi\><rsub|n>|}>>
    of bounded measurable complex-valued functions. It is easy to see that
    <math|S> is a homogeneous subadditive real-valued functional for which

    <\equation>
      <label|eq:S_bounds>inf<rsub|t\<in\>R>
      \<psi\><around|(|t|)>\<leq\>S<around|(|\<psi\>|)>\<leq\>sup<rsub|t\<in\>R>
      \<psi\><around|(|t|)> \<forall\>\<psi\>\<in\>C<rsub|R><around|(|R|)>
    </equation>

    and hence

    <\equation>
      S<around|(|\<psi\>|)>\<geq\>0*<text|if >\<psi\>\<geq\>0
    </equation>

    <\equation>
      S<around|(|\<psi\>|)>\<leq\>0*<text|if >\<psi\>\<leq\>0
    </equation>

    Thus, by the Hahn-Banach theorem there exists a linear functional
    <math|T> on <math|C<rsub|R><around|(|R|)>> such that (see for example
    <cite|dunford> pp. 62-63)

    <\equation>
      <label|eq:T_bounds>S*<around|(|-\<psi\>|)>\<leq\>T<around|(|\<psi\>|)>\<leq\>S<around|(|\<psi\>|)>\<forall\>\<psi\>\<in\>C<rsub|R><around|(|R|)>
    </equation>

    Obviously, <math|T> is a bounded nonnegative linear functional on the
    normed vector space <math|C<rsub|R><around|(|R|)>>. Let
    <math|C<rsub|C><around|(|R|)>> be the class of all bounded continuous
    complex-valued functions on <math|R>. We extend <math|T> to
    <math|C<rsub|C><around|(|R|)>> by

    <\equation>
      <label|eq:T_extension><wide|T|^>*<around|(|\<varphi\>+i*\<psi\>|)>=T<around|(|\<varphi\>|)>+i*T<around|(|\<psi\>|)>\<forall\>\<varphi\>,\<psi\>\<in\>C<rsub|R><around|(|R|)>
    </equation>

    Clearly <math|<wide|T|^>> is a bounded nonnegative linear functional on
    <math|C<rsub|C><around|(|R|)>>. Since <math|C<rsub|C><around|(|R|)>>
    contains <math|C<rsub|0><around|(|R|)>>, the class of all continuous
    complex-valued functions vanishing at <math|\<infty\>>, according to the
    Riesz representation theorem (<cite|rudin>, p. 131, Theorem 6.19) there
    exists a complex regular measure <math|\<mu\><rsub|0>> such that

    <\equation>
      <label|eq:mu0_def>T<around|(|\<psi\>|)>=<big|int><rsub|R>\<psi\><around|(|t|)>*d*\<mu\><rsub|0><around|(|t|)>\<forall\>\<psi\>\<in\>C<rsub|C><around|(|R|)>
    </equation>

    Let <math|E> be any measurable set. Given any <math|\<epsilon\>\<gtr\>0>,
    one can find a nonnegative function <math|\<psi\>> in
    <math|C<rsub|C><around|(|R|)>> such that
    <math|<big|int><rsub|E><around|(|1-\<psi\><around|(|t|)>|)>*d*\<mu\><rsub|0><around|(|t|)>\<leq\>\<epsilon\>>.
    This implies that\ 

    <\equation>
      \<mu\><rsub|0><around|(|E|)>=<big|int><rsub|E>1*d*\<mu\><rsub|0><around|(|t|)>
    </equation>

    \ is nonnegative. Hence <math|\<mu\><rsub|0>> is a bounded regular
    countably additive nonnegative measure such that

    <\equation>
      <label|eq:T_mu0>T<around|(|\<psi\>|)>=<big|int><rsub|R>\<psi\><around|(|t|)>*d*\<mu\><rsub|0><around|(|t|)>\<forall\>\<psi\>\<in\>C<rsub|R><around|(|R|)>
    </equation>

    For any bounded continuous complex-valued function <math|\<psi\>> we have

    <\equation>
      <label|eq:S_rho_bound>S*<around|(|-\<rho\><around|\||\<psi\>|\|><rsup|2>|)>\<leq\>T*<around|(|-\<rho\><around|\||\<psi\>|\|><rsup|2>|)>
    </equation>

    or

    <\equation>
      <label|eq:S_rho_expanded>S*<around|(|-\<rho\><around|\||\<psi\>|\|><rsup|2>|)>\<leq\>sup<rsub|t\<in\>R><around|{|<around|\||\<psi\><around|(|t|)>*<around|\||<rsup|2>+\<rho\>|\|>*\<varphi\><around|(|t|)>-\<psi\><around|(|t|)>|\|><rsup|2>-<big|int><big|int><rsub|R<rsup|2>>\<varphi\><around|(|s|)>*<wide|\<varphi\>|\<bar\>><around|(|t|)>*d*F<around|(|s,t|)>|}>
    </equation>

    where the supremum is taken over all bounded continuous complex-valued
    functions <math|\<varphi\>>. Thus for the specific choice
    <math|\<varphi\>=\<psi\>> we get

    <\equation>
      <label|eq:S_rho_simplified>S*<around|(|-\<rho\><around|\||\<psi\>|\|><rsup|2>|)>\<leq\>sup<rsub|t\<in\>R>\|\<psi\><around|(|t|)>\|<rsup|2>-<big|int><big|int><rsub|R<rsup|2>>\<psi\><around|(|s|)>*<wide|\<psi\>|\<bar\>><around|(|t|)>*d*F<around|(|s,t|)>
    </equation>

    or

    <\equation>
      <label|eq:T_rho_inequality>-\<rho\>*T<around|(|<around|\||\<psi\>|\|><rsup|2>|)>=T*<around|(|-\<rho\><around|\||\<psi\>|\|><rsup|2>|)>\<leq\>S*<around|(|-\<rho\><around|\||\<psi\>|\|><rsup|2>|)>\<leq\><big|int><big|int><rsub|R<rsup|2>>\<psi\><around|(|s|)>*<wide|\<psi\>|\<bar\>><around|(|t|)>*d*F<around|(|s,t|)>
    </equation>

    Thus for any function <math|\<psi\>> in <math|C<rsub|C><around|(|R|)>> we
    have

    <\equation>
      <label|eq:mu0_bound_1><big|int><big|int><rsub|R<rsup|2>>\<psi\><around|(|s|)>*<wide|\<psi\>|\<bar\>><around|(|t|)>*d*F<around|(|s,t|)>\<leq\>\<rho\>*T<around|(|<around|\||\<psi\>|\|><rsup|2>|)>=\<rho\>*<big|int><rsub|R><around|\||\<psi\><around|(|t|)>|\|><rsup|2>*d*\<mu\><rsub|0><around|(|t|)>
    </equation>

    or equivalently

    <\equation>
      <label|eq:mu0_bound_2><around*|\<langle\>|<big|int><rsub|R>\<psi\><around|(|s|)>*d*\<Phi\><around|(|s|)>,<big|int><rsub|R>\<psi\><around|(|s|)>*d*\<Phi\><around|(|s|)>|\<rangle\>>\<leq\>\<rho\>*<big|int><rsub|R><around|\||\<psi\><around|(|t|)>|\|><rsup|2>*d*\<mu\><rsub|0><around|(|t|)>
    </equation>

    Let <math|\<psi\>> be in <math|C<rsub|C><around|(|R|)>>. Take a sequence
    <math|\<psi\><rsub|n>> in <math|C<rsub|C><around|(|R|)>> such that
    <math|\<psi\><rsub|n>\<to\>\<psi\>> pointwise and\ 

    <\equation>
      <around|\||\<psi\><rsub|n><around|(|s|)>|\|>\<leq\>sup<rsub|t\<in\>R><around|\||\<psi\><around|(|t|)>|\|>
    </equation>

    . Since <math|\<mu\><rsub|0>> is bounded by the usual Lebesgue dominated
    convergence theorem <math|<big|int><rsub|R><around|\||\<psi\><rsub|n><around|(|t|)>|\|><rsup|2>*d*\<mu\><rsub|0><around|(|t|)>>
    converges to <math|<big|int><rsub|R><around|\||\<psi\><around|(|t|)>|\|><rsup|2>*d*\<mu\><rsub|0><around|(|t|)>>.
    Also by (<cite|dunford>, p. 328, Theorem 10)
    <math|<big|int><rsub|R>\<psi\><rsub|n><around|(|t|)>*d*\<Phi\><around|(|t|)>>
    converges to <math|<big|int><rsub|R>\<psi\><around|(|t|)>*d*\<Phi\><around|(|t|)>>.
    Therefore applying <eqref|eq:mu0_bound_1> to the sequence
    <math|\<psi\><rsub|n>> and then taking limits one obtains

    <\equation>
      <with|font-base-size|8|<label|eq:mu0_bound_final><big|int><big|int><rsub|R<rsup|2>>\<psi\><around|(|s|)><wide|\<psi\>|\<bar\>><around|(|t|)>*d*F<around|(|s,t|)>=<around*|\<langle\>|<big|int><rsub|R>\<psi\><around|(|s|)>*d*\<Phi\><around|(|s|)>,<big|int><rsub|R>\<psi\><around|(|s|)>*d*\<Phi\><around|(|s|)>|\<rangle\>>\<leq\>\<rho\>*<big|int><rsub|R><around|\||\<psi\><around|(|t|)>|\|><rsup|2>*d*\<mu\><rsub|0><around|(|t|)>,\<psi\>\<in\>C<rsub|C><around|(|R|)>>
    </equation>

    Hence <math|\<mu\>=\<rho\>*\<mu\><rsub|0>> is the desired measure.
  </proof>

  <\theorem>
    [Main theorem]<label|thm:main_theorem> An
    <math|<with|math-font|cal*|H>>-valued process <math|X<rsub|t>,t\<in\>R>,
    is harmonizable if and only if there exists a Hilbert space
    <math|<with|math-font|cal*|K>> containing <math|<with|math-font|cal*|H>>
    and a <math|<with|math-font|cal*|K>>-valued stationary process
    <math|Y<rsub|t>> such that

    <\equation>
      <label|eq:projection>X<rsub|t>=P*Y<rsub|t>
    </equation>

    where <math|P> is the projection from <math|<with|math-font|cal*|K>> onto
    <math|<with|math-font|cal*|H>>
  </theorem>

  <\proof>
    If <math|X> is the projection of some stationary process <math|Y>, it is
    easy, as was pointed out in <cite|rozanov>, to see that <math|X<rsub|t>>
    is harmonizable. Now let <math|X<rsub|t>,t\<in\>R>, be a harmonizable
    process with the spectral measure <math|F>. Let <math|\<mu\>> be the
    dominating measure of Lemma <reference|lem:dom_measure>. There exists a
    countably additive Borel measure <math|\<mu\><rsub|1>> on
    <math|R\<times\>R> which is concentrated on its diagonal and satisfies

    <\equation>
      <label|eq:mu1_def><big|int><rsub|R<rsup|2>>f<around|(|s,t|)>*d*\<mu\><rsub|1><around|(|s,t|)>=<big|int><rsub|R>f<around|(|t,t|)>*d*\<mu\><around|(|t|)>
    </equation>

    for every bounded continuous complex-valued function <math|f> on
    <math|R\<times\>R>. Now since by Lemma <reference|lem:dom_measure>

    <\equation>
      <label|eq:mu1_F_inequality><big|int><rsub|R<rsup|2>>\<varphi\><around|(|s|)>*<wide|\<psi\>|\<bar\>><around|(|t|)>*d*\<mu\><rsub|1><around|(|s,t|)>-<big|int><rsub|R<rsup|2>>\<varphi\><around|(|s|)>*<wide|\<psi\>|\<bar\>><around|(|t|)>*d*F<around|(|s,t|)>\<geq\>0
    </equation>

    we define an inner product <math|<around|(|\<cdummy\>,\<cdummy\>|)><rprime|'>>
    on the class <math|C<rsub|C><around|(|R|)>> by

    <\equation>
      <label|eq:inner_product_def><around|(|\<varphi\>,\<psi\>|)><rprime|'>=<big|int><rsub|R<rsup|2>>\<varphi\><around|(|s|)>*<wide|\<psi\>|\<bar\>><around|(|t|)>*d*\<mu\><rsub|1><around|(|s,t|)>-<big|int><rsub|R<rsup|2>>\<varphi\><around|(|s|)>*<wide|\<psi\>|\<bar\>><around|(|t|)>*d*F<around|(|s,t|)>
    </equation>

    Let <math|<with|math-font|cal*|H><rprime|'>> be the Hilbert space
    obtained from completing <math|>

    <\equation>
      C<rsub|C><around|(|R|)>/<around|{|f\<in\>C<rsub|C><around|(|R|)>\|<around|(|f,f|)><rprime|'>=0|}>
    </equation>

    with respect to the norm <math|<around|\<\|\|\>|f|\<\|\|\>><rprime|'>=<sqrt|<around|(|f,f|)><rprime|'>>>,
    and <math|Z<rsub|t>> be the image of the functional
    <math|u\<to\>e<rsup|-i*u*t>> under the canonical mapping
    <math|C<rsub|C><around|(|R|)>\<to\><with|math-font|cal*|H><rprime|'>>.
    Now let

    <\equation>
      <with|math-font|cal*|K>=<with|math-font|cal*|H>\<oplus\><with|math-font|cal*|H><rprime|'>
    </equation>

    identifying <math|<with|math-font|cal*|H>> with the subspace
    <math|<with|math-font|cal*|H>\<oplus\><around|{|0|}>> of
    <math|<with|math-font|cal*|K>>. Let\ 

    <\equation>
      Y<rsub|t>=X<rsub|t>+Z<rsub|t>\<forall\>t\<in\>R
    </equation>

    Obviously,\ 

    <\equation>
      X<rsub|t>=P*Y<rsub|t>
    </equation>

    \ and

    <\equation>
      <label|eq:Y_inner_product><around|(|Y<rsub|s>,Y<rsub|t>|)><rsub|<with|math-font|cal*|K>>=<around|(|X<rsub|s>,X<rsub|t>|)><rsub|<with|math-font|cal*|H>>+<around|(|Z<rsub|s>,Z<rsub|t>|)><rprime|'>\<forall\>s,t\<in\>R
    </equation>

    Hence

    <\align>
      <tformat|<cwith|1|1|1|-1|font-base-size|7>|<table|<row|<cell|<around|(|Y<rsub|t>,Y<rsub|s>|)><rsub|<with|math-font|cal*|K>>>|<cell|=<big|int><big|int><rsub|R<rsup|2>>e<rsup|-i*<around|(|t*v-s*u|)>>*d*F<around|(|u,v|)>+<big|int><big|int><rsub|R<rsup|2>>e<rsup|-i*<around|(|t*v-s*u|)>>*d*\<mu\><rsub|1><around|(|u,v|)>-<big|int><big|int><rsub|R<rsup|2>>e<rsup|-i*<around|(|t*v-s*u|)>>*d*F<around|(|u,v|)><eq-number>>>>>
    </align>

    which reduces to

    <\align>
      <tformat|<table|<row|<cell|<around|(|Y<rsub|t>,Y<rsub|s>|)><rsub|<with|math-font|cal*|K>>>|<cell|=<big|int><big|int><rsub|R<rsup|2>>e<rsup|-i*<around|(|t*v-s*u|)>>*d*\<mu\><rsub|1><around|(|u,v|)><eq-number>>>|<row|<cell|>|<cell|=<big|int><rsub|R>e<rsup|-i*u*<around|(|t-s|)>>*d*\<mu\><around|(|u|)><eq-number>>>>>
    </align>

    which in turn means that <math|Y<rsub|t>> is stationary and completes the
    proof.
  </proof>

  The idea of constructing the Hilbert space <math|<with|math-font|cal*|K>>
  and the stationary process <math|Y> was originated by Abreu in
  <cite|abreu>. In his case the measure <math|F> was of bounded variation and
  this fact played an important part in establishing the dominating measure.
  However, in our case <math|F> is a finitely additive measure which is only
  of bounded semi-variation and his line of proof will not induce the desired
  dominating measure. Nevertheless, we did achieve our goal in establishing
  the existence of this crucial measure via our lemmas.

  As a consequence of our main theorem we obtain the following result which
  relates countably additive vector valued measures to projections of
  orthogonally scattered measures (see also <cite|niemi2>).

  <\corollary>
    <label|cor:projection>A countably additive
    <math|<with|math-font|cal*|H>>-valued measure <math|\<Phi\>> is a
    projection of an orthogonally scattered
    <math|<with|math-font|cal*|K>>-valued measure <math|E> if and only if
    <math|\<Phi\>> is of bounded semi-variation.
  </corollary>

  <\proof>
    It is clear that if <math|E> is an orthogonally scattered
    <math|<with|math-font|cal*|K>>-valued measure and <math|P> is the
    projection of the Hilbert space <math|<with|math-font|cal*|K>> onto
    <math|<with|math-font|cal*|H>\<subset\><with|math-font|cal*|K>>, then
    <math|\<Phi\>=P*E> is a countably additive
    <math|<with|math-font|cal*|H>>-valued measure which is of bounded
    semi-variation. Now suppose that <math|\<Phi\>> is a countably additive
    <math|<with|math-font|cal*|H>>-valued measure which is of bounded
    semi-variation. Then the process <math|X<rsub|t>> defined by

    <\equation>
      <label|eq:X_Phi>X<rsub|t>=<big|int><rsub|R>e<rsup|-i*t*u>*d*\<Phi\><around|(|u|)>
    </equation>

    is harmonizable. Now by Theorem <reference|thm:main_theorem> there exists
    a Hilbert space <math|<with|math-font|cal*|K>> containing
    <math|<with|math-font|cal*|H>> and a stationary process
    <math|Y<rsub|t>\<forall\>t\<in\>R>, such that

    <\equation>
      X<rsub|t>=P*Y<rsub|t>\<forall\>t\<in\>R
    </equation>

    Let <math|E> be the well-known corresponding orthogonally scattered
    <math|<with|math-font|cal*|K>>-valued measure. We have

    <\equation>
      <label|eq:X_PY>X<rsub|t>=P*Y<rsub|t>=P<around*|(|<big|int><rsub|R>e<rsup|-i*t*u>*d*E<around|(|u|)>|)>=<big|int><rsub|R>e<rsup|-i*t*u>*P*E<around|(|u|)>
    </equation>

    Thus

    <\equation>
      <label|eq:X_t_equality><big|int><rsub|R>e<rsup|-i*t*u>*d*\<Phi\><around|(|u|)>=<big|int><rsub|R>e<rsup|-i*t*u>*P*E<around|(|u|)><text|for
      all >t\<in\>R
    </equation>

    Hence for any <math|h\<in\><with|math-font|cal*|H>> and any real number
    <math|t>, we have

    <\equation>
      <label|eq:Phi_PE_equality><tabular|<tformat|<table|<row|<cell|<big|int><rsub|R>e<rsup|-i*t*u>*d*<around|(|\<Phi\><around|(|u|)>,h|)><rsub|<with|math-font|cal*|H>>>|<cell|=<around*|(|<big|int><rsub|R>e<rsup|-i*t*u>*d*\<Phi\><around|(|u|)>,h|)><rsub|<with|math-font|cal*|H>>>>|<row|<cell|>|<cell|=<around*|(|<big|int><rsub|R>e<rsup|-i*t*u>*P*E<around|(|u|)>h|)><rsub|<with|math-font|cal*|H>>>>|<row|<cell|>|<cell|=<big|int><rsub|R>e<rsup|-i*t*u>*d*<around|(|P*E<around|(|u|)>,h|)><rsub|<with|math-font|cal*|H>>>>>>>
    </equation>

    which implies

    <\equation>
      <label|eq:Phi_result>\<Phi\>=P*E
    </equation>
  </proof>

  Our next theorem relates harmonizable processes with the continuous
  <math|V>-bounded processes which were originally studied by S. Bochner in
  <cite|bochner>. We first state the definition of continuous
  <math|V>-bounded processes as given in <cite|niemi4>.

  <\definition>
    <label|def:vbounded>A continuous <math|<with|math-font|cal*|H>>-valued
    process <math|X<rsub|t>,t\<in\>R>, is <math|V>-bounded if it is bounded
    and if there exists a constant <math|C> such that

    <\equation>
      <label|eq:vbounded><big|int><big|int><rsub|R<rsup|2>>R<around|(|t,s|)>*<wide|\<varphi\>|^><around|(|s|)>*<wide|\<psi\>|^><around|(|t|)>*d*s*d*t\<leq\>C<around|\<\|\|\>|\<varphi\>|\<\|\|\>><rsub|1><around|\<\|\|\>|\<psi\>|\<\|\|\>><rsub|1>
    </equation>

    where <math|\<varphi\>> and <math|\<psi\>> are functions in
    <math|L<rsub|1><around|(|R|)>> with the Fourier transforms
    <math|<wide|\<varphi\>|^>> and <math|<wide|\<psi\>|^>> respectively, and
    <math|R<around|(|\<cdummy\>,\<cdummy\>|)>> is the correlation of
    <math|X<rsub|t>,t\<in\>R>.
  </definition>

  The proof of the following lemma is clear.

  <\lemma>
    <label|lem:fourier_equality>Let <math|X<rsub|t>> be a harmonizable
    process, i.e., let

    <\equation>
      <label|eq:X_t_harmonizable>X<rsub|t>=<big|int><rsub|R>e<rsup|-i*t*u>*d*\<Phi\><around|(|u|)>
    </equation>

    where <math|\<Phi\>> as in <eqref|eq:def_harmonizable>. Then we have

    <\equation>
      <label|eq:fourier_equality><big|int><rsub|R><wide|f|^><around|(|t|)>*X<rsub|t>*d*t=<big|int><rsub|R>f<around|(|t|)>*d*\<Phi\><around|(|t|)>\<forall\>f\<in\>L<rsub|1><around|(|R|)>
    </equation>
  </lemma>

  <\theorem>
    <label|thm:vbounded_harmonic>An <math|<with|math-font|cal*|H>>-valued
    process <math|X<rsub|t>,t\<in\>R>, is harmonizable if and only if it is a
    continuous <math|V>-bounded process.
  </theorem>

  <\proof>
    Suppose that <math|X<rsub|t>> is harmonizable, i.e., suppose that

    <\equation>
      <label|eq:Xt_harmonizable_thm>X<rsub|t>=<big|int><rsub|R>e<rsup|-i*t*u>*d*\<Phi\><around|(|u|)>
    </equation>

    and

    <\equation>
      <label|eq:Rt_harmonizable_thm>R<around|(|t,s|)>=<around|(|X<rsub|t>,X<rsub|s>|)><rsub|<with|math-font|cal*|H>>=<big|int><big|int><rsub|R<rsup|2>>e<rsup|-i*<around|(|t*v-s*u|)>>*d*F<around|(|u,v|)>
    </equation>

    where <math|\<Phi\>> and <math|F> are as in Theorem
    <reference|thm:characterization>. It is clear by Theorem
    <reference|thm:main_theorem> that <math|X<rsub|t>> is bounded and
    continuous. Now using Lemma <reference|lem:fourier_equality> we note that
    for any two functions <math|\<varphi\>> and <math|\<psi\>> in
    <math|L<rsub|1><around|(|R|)>> we have

    <\align>
      <tformat|<table|<row|<cell|<big|int><big|int><rsub|R<rsup|2>><wide|\<varphi\>|^><around|(|u|)>*<wide|\<psi\>|^><around|(|v|)>*R<around|(|u,v|)>*d*u*d*v>|<cell|=<around*|(|<big|int><rsub|R><wide|\<varphi\>|^><around|(|u|)>*X<rsub|u>*d*u,<big|int><rsub|R><wide|\<psi\>|^><around|(|v|)>*X<rsub|v>*d*v|)><rsub|<with|math-font|cal*|H>><eq-number>>>|<row|<cell|>|<cell|=<around*|(|<big|int><rsub|R>\<varphi\><around|(|u|)>*d*\<Phi\><around|(|u|)>,<big|int><rsub|R>\<psi\><around|(|v|)>*d*\<Phi\><around|(|v|)>|)><rsub|<with|math-font|cal*|H>><eq-number>>>|<row|<cell|>|<cell|\<leq\>C<around|\<\|\|\>|\<varphi\>|\<\|\|\>><rsub|1><around|\<\|\|\>|\<psi\>|\<\|\|\>><rsub|1><eq-number>>>>>
    </align>

    where

    <\equation>
      C=<around|\<\|\|\>|F|\<\|\|\>><around|(|R|)>
    </equation>

    Conversely, suppose that <math|X<rsub|t>> is a continuous
    <math|V>-bounded process with the correlation function
    <math|R<around|(|s,t|)>>. Then besides being bounded and continuous, we
    have

    <\equation>
      <label|eq:vbounded_assumption><around*|\||<big|int><big|int><rsub|R<rsup|2>><wide|\<varphi\>|^><around|(|u|)>*<wide|\<psi\>|^><around|(|v|)>*R<around|(|u,v|)>*d*u*d*v|\|>\<leq\>C<around|\<\|\|\>|\<varphi\>|\<\|\|\>><rsub|1><around|\<\|\|\>|\<psi\>|\<\|\|\>><rsub|1><space|1em>\<forall\>\<varphi\>,\<psi\>\<in\>L<rsub|1><around|(|R|)>.
    </equation>

    Define the bilinear form <math|K> on <math|L<rsub|1><around|(|R|)>> by

    <\equation>
      <label|eq:K_bilinear>K<around|(|\<varphi\>,\<psi\>|)>=<big|int><big|int><rsub|R<rsup|2>><wide|\<varphi\>|^><around|(|u|)>*<wide|\<psi\>|^><around|(|v|)>*R<around|(|u,v|)>*d*u*d*v
    </equation>

    By <eqref|eq:vbounded_assumption> we have

    <\equation>
      <label|eq:K_bounded><around|\||K<around|(|\<varphi\>,\<psi\>|)>|\|>\<leq\>C<around|\<\|\|\>|\<varphi\>|\<\|\|\>><rsub|1><around|\<\|\|\>|\<psi\>|\<\|\|\>><rsub|1>
    </equation>

    <math|K<around|(|\<cdummy\>,\<cdummy\>|)>> is a positive definite kernel.
    Consider the corresponding reproducing kernel Hilbert space
    <math|<with|math-font|cal*|F>>. We can define the operator <math|>

    <\equation>
      T:L<rsub|1><around|(|R|)>\<to\><with|math-font|cal*|F>
    </equation>

    \ by

    <\equation>
      <label|eq:T_operator>T<around|(|\<varphi\>|)>=K<around|(|\<varphi\>,\<cdummy\>|)>
    </equation>

    From the properties of reproducing kernel Hilbert spaces we have

    <\equation>
      <label|eq:K_property>K<around|(|\<varphi\>,\<psi\>|)>=(K<around|(|\<varphi\>,\<cdot\>|)>,K(\<psi\>,\<cdot\><around|)||)><rsub|<with|math-font|cal*|F>>=<around|(|T<around|(|\<varphi\>|)>,T<around|(|\<psi\>|)>|)><rsub|<with|math-font|cal*|F>>
    </equation>

    which along with <eqref|eq:K_bounded> implies that <math|T> is a bounded
    operator on <math|L<rsub|1><around|(|R|)>>. Since
    <math|L<rsub|1><around|(|R|)>> is dense in the class
    <math|C<rsub|0><around|(|R|)>> (see <cite|rudin>, p. 195) one can extend
    <math|T> to a bounded operator on <math|C<rsub|0><around|(|R|)>> into
    <math|<with|math-font|cal*|F>>. But by Lemma 2 of <cite|kluvanek> and its
    corollaries, there exists an <math|<with|math-font|cal*|F>>-valued
    regular measure <math|M> on <math|R> which is of bounded semi-variation
    and satisfies

    <\equation>
      <label|eq:T_M_equality>T<around|(|\<varphi\>|)>=<big|int><rsub|R>\<varphi\><around|(|t|)>*d*M<around|(|t|)><text|\<forall\>>\<varphi\>\<in\>C<rsub|0><around|(|R|)>
    </equation>

    Define the set function <math|F> for each pair <math|A> and <math|B> of
    Borel sets by

    <\equation>
      <label|eq:F_def_M>F<around|(|A,B|)>=<around|(|M<around|(|A|)>,M<around|(|B|)>|)><rsub|<with|math-font|cal*|F>>
    </equation>

    and then define <math|R<rsub|1>> by

    <\equation>
      <label|eq:R1_def>R<rsub|1><around|(|t,s|)>=<big|int><big|int><rsub|R<rsup|2>>e<rsup|-i*<around|(|t*v-s*u|)>>*d*F<around|(|u,v|)>
    </equation>

    Using Lemma <reference|lem:fourier_equality> and Theorem
    <reference|thm:characterization> that for any <math|\<varphi\>> and
    <math|\<psi\>> in <math|L<rsub|1><around|(|R|)>> we have

    <\equation>
      <label|eq:R1_integral><big|int><big|int><rsub|R<rsup|2>><wide|\<varphi\>|^><around|(|u|)>*<wide|\<psi\>|^><around|(|v|)>*R<rsub|1><around|(|u,v|)>*d*u*d*v=<big|int><big|int><rsub|R<rsup|2>>\<varphi\><around|(|u|)>*\<psi\><around|(|v|)>*d*F<around|(|u,v|)>
    </equation>

    On the other hand, we have

    <\equation>
      <label|eq:R_integral><big|int><big|int><rsub|R<rsup|2>><wide|\<varphi\>|^><around|(|u|)>*<wide|\<psi\>|^><around|(|v|)>*R<around|(|u,v|)>*d*u*d*v=<big|int><big|int><rsub|R<rsup|2>>\<varphi\><around|(|u|)>*\<psi\><around|(|v|)>*d*F<around|(|u,v|)>
    </equation>

    for all pairs <math|\<varphi\>> and <math|\<psi\>> of functions in
    <math|L<rsub|1><around|(|R|)>>. Combining <eqref|eq:R1_integral> and
    <eqref|eq:R_integral> we get

    <\equation>
      <label|eq:R_R1_zero><big|int><big|int><rsub|R<rsup|2>><wide|\<varphi\>|^><around|(|u|)>*<wide|\<psi\>|^><around|(|v|)>*<around|[|R<around|(|u,v|)>-R<rsub|1><around|(|u,v|)>|]>*d*u*d*v=0
    </equation>

    for all <math|\<varphi\>> and <math|\<psi\>> in
    <math|L<rsub|1><around|(|R|)>>. Thus, we have

    <\equation>
      <label|eq:R_equals_R1>R<around|(|t,s|)>=R<rsub|1><around|(|t,s|)>=<big|int><big|int><rsub|R<rsup|2>>e<rsup|-i*<around|(|t*v-s*u|)>>*d*F<around|(|u,v|)>
    </equation>

    and Theorem <reference|thm:characterization>, now implies that
    <math|X<rsub|t>> is harmonizable.
  </proof>

  As a corollary to our work we obtain the following ergodic theorem:

  <\corollary>
    <label|cor:ergodic>If <math|X> is an <math|<with|math-font|cal*|H>>-valued
    harmonizable or equivalently continuous <math|V>-bounded process, then

    <\equation>
      <label|eq:ergodic>lim<rsub|T\<to\>\<infty\>>
      <frac|1|T>*<big|int><rsub|0><rsup|T>X<rsub|t>*e<rsup|-i*u<rsub|0>*t>*d*t=\<Phi\><around|(|<around|{|u<rsub|0>|}>|)>
    </equation>

    where <math|X<rsub|t>=<big|int><rsub|R>e<rsup|-i*t*u>*d*\<Phi\><around|(|u|)>>.
  </corollary>

  <\proof>
    By our earlier results there exists a Hilbert space
    <math|<with|math-font|cal*|K>> containing <math|<with|math-font|cal*|H>>,
    a <math|<with|math-font|cal*|K>>-valued stationary process
    <math|Y<rsub|t>> and an orthogonally scattered
    <math|<with|math-font|cal*|K>>-valued measure <math|E> such that <math|>

    <\equation>
      X<rsub|t>=P*Y<rsub|t>
    </equation>

    <\equation>
      Y<rsub|t>=<big|int><rsub|R>e<rsup|-i*u*t>*d*E<around|(|u|)>
    </equation>

    and\ 

    <\equation>
      \<Phi\>=P*E
    </equation>

    where <math|P> is the projection of <math|<with|math-font|cal*|K>> onto
    <math|<with|math-font|cal*|H>>. Now using the corresponding well known
    ergodic theorem for the stationary process <math|Y<rsub|t>> we get

    <\align>
      <tformat|<table|<row|<cell|lim<rsub|T\<to\>\<infty\>>
      <frac|1|T>*<big|int><rsub|0><rsup|T>X<rsub|t>*e<rsup|-i*u<rsub|0>*t>*d*t>|<cell|=lim<rsub|T\<to\>\<infty\>>
      <frac|1|T>*<big|int><rsub|0><rsup|T>P*Y<rsub|t>*e<rsup|-i*u<rsub|0>*t>*d*t<eq-number>>>|<row|<cell|>|<cell|=P*lim<rsub|T\<to\>\<infty\>>
      <frac|1|T>*<big|int><rsub|0><rsup|T>Y<rsub|t>*e<rsup|-i*u<rsub|0>*t>*d*t<eq-number>>>|<row|<cell|>|<cell|=P*E<around|(|<around|{|u<rsub|0>|}>|)>=\<Phi\><around|(|<around|{|u<rsub|0>|}>|)>.<eq-number>>>>>
    </align>
  </proof>

  Such an ergodic theorem for harmonizable processes was obtained in
  <cite|rozanov>.

  <\remark>
    <label|rem:discrete>In this article we only considered the continuous
    parameter processes, however our main theorem can be established in an
    analogous way for the discrete parameter case as well.
  </remark>

  <\thebibliography|99>
    <bibitem|abreu>J. L. Abreu, A note on harmonizable and stationary
    sequences, Bol. Soc. Mat. Mexicana 15 (1970), 58-41.

    <bibitem|bochner>S. Bochner, Stationarity, boundedness, almost
    periodicity of random valued functions, Proc. III Berkeley Sym. Math.
    Stat. Prob., 2, 7-27, Univ. Calif. Press, 1956.

    <bibitem|cramer>H. Cramér, On some class of non-stationary stochastic
    processes, Proc. IV Berkeley Sym. Math. Stat. prob., 2, 57-78, Univ.
    Calif. Press, 1962.

    <bibitem|dubinsky>E. Dubinsky, A. Peªczy«ski & H. P. Rosenthal, On Banach
    spaces X for which <math|\<Pi\><rsub|2><around|(|L<rsub|\<infty\>>,X|)>=B<around|(|L<rsub|\<infty\>>,X|)>>,
    Studia Math. 44 (1972), 617-648.

    <bibitem|dunford>N. Dunford & J. T. Schwartz, Linear Operators, I, Wiley,
    New York, 1953.

    <bibitem|grothendieck>A. Grothendieck, Résumé de la théorie metrique des
    produits tensoriels topologiques, Bol. Soc. Matem. Sao Paulo 8 (1956),
    1-79.

    <bibitem|kluvanek>I. Kluvánek, Characterization of Fourier-Stieltjes
    transform of vector and operator valued measures, Czechoslovak Math. J.
    17 (1967), 261-277.

    <bibitem|loeve>M. Loève, Fonctions aléatoires du second ordre, Revue Sci.
    84 (1946), 195-206.

    <bibitem|masani>P. Masani, Quasi-isometric measures and their
    applications, Bull. Amer. Math. Soc. 76 (1970), 427-528.

    <bibitem|niemi1>H. Niemi, On stationary dilations and the linear
    prediction of certain stochastic processes, Soc. Sci. Fennica Comment
    Phys.-Math. 38 (1972), 1-30.

    <bibitem|niemi2>H. Niemi, Stochastic operators on a Hilbert space and
    stochastically continuous semigroups, J. Functional Analysis 13 (1973),
    63-76.

    <bibitem|niemi3>H. Niemi, On orthogonally scattered dilations of bounded
    vector measures, Ann. Acad. Sci. Fennicae, Ser. A, I Math. 2 (1976),
    97-105.

    <bibitem|niemi4>H. Niemi, On the support of a <math|V>-bounded stochastic
    measure and the dilation of its covariance measure, Thesis, Turku, 1975.

    <bibitem|pietsch>A. Pietsch, Absolut <math|p>-summierende Abbildungen in
    normierten Räumen, Studia Math. 28 (1967), 333-353.

    <bibitem|rogge>R. Rogge, Über <math|2>-majorisierende Operatoren, Studia
    Math. 29 (1967), 41-52.

    <bibitem|rozanov>Yu. A. Rozanov, Spectral analysis of abstract functions,
    Theory Prob. Appl. 4 (1959), 271-287.

    <bibitem|rudin>W. Rudin, Real and Complex Analysis, McGraw-Hill, New
    York, 1966.
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
    <associate|auto-1|<tuple|11|15>>
    <associate|bib-abreu|<tuple|abreu|15>>
    <associate|bib-bochner|<tuple|bochner|15>>
    <associate|bib-cramer|<tuple|cramer|15>>
    <associate|bib-dubinsky|<tuple|dubinsky|15>>
    <associate|bib-dunford|<tuple|dunford|15>>
    <associate|bib-grothendieck|<tuple|grothendieck|15>>
    <associate|bib-kluvanek|<tuple|kluvanek|15>>
    <associate|bib-loeve|<tuple|loeve|15>>
    <associate|bib-masani|<tuple|masani|15>>
    <associate|bib-niemi1|<tuple|niemi1|15>>
    <associate|bib-niemi2|<tuple|niemi2|15>>
    <associate|bib-niemi3|<tuple|niemi3|15>>
    <associate|bib-niemi4|<tuple|niemi4|15>>
    <associate|bib-pietsch|<tuple|pietsch|15>>
    <associate|bib-rogge|<tuple|rogge|15>>
    <associate|bib-rozanov|<tuple|rozanov|15>>
    <associate|bib-rudin|<tuple|rudin|15>>
    <associate|cor:ergodic|<tuple|10|14>>
    <associate|cor:projection|<tuple|6|11>>
    <associate|def:harmonizability|<tuple|1|2>>
    <associate|def:vbounded|<tuple|7|12>>
    <associate|eq:F_def_M|<tuple|102|13>>
    <associate|eq:K_bilinear|<tuple|96|13>>
    <associate|eq:K_bounded|<tuple|97|13>>
    <associate|eq:K_property|<tuple|100|13>>
    <associate|eq:Phi_PE_equality|<tuple|84|11>>
    <associate|eq:Phi_result|<tuple|85|12>>
    <associate|eq:R1_def|<tuple|103|13>>
    <associate|eq:R1_integral|<tuple|104|13>>
    <associate|eq:R_R1_zero|<tuple|106|14>>
    <associate|eq:R_equals_R1|<tuple|107|14>>
    <associate|eq:R_integral|<tuple|105|14>>
    <associate|eq:Rt_harmonizable_thm|<tuple|90|12>>
    <associate|eq:S_bounds|<tuple|52|8>>
    <associate|eq:S_functional|<tuple|51|8>>
    <associate|eq:S_properties|<tuple|32|6>>
    <associate|eq:S_rho_bound|<tuple|60|9>>
    <associate|eq:S_rho_expanded|<tuple|61|9>>
    <associate|eq:S_rho_simplified|<tuple|62|9>>
    <associate|eq:T_M_equality|<tuple|101|13>>
    <associate|eq:T_bounds|<tuple|55|8>>
    <associate|eq:T_extension|<tuple|56|8>>
    <associate|eq:T_mu0|<tuple|59|9>>
    <associate|eq:T_operator|<tuple|99|13>>
    <associate|eq:T_rho_inequality|<tuple|63|9>>
    <associate|eq:X_PY|<tuple|82|11>>
    <associate|eq:X_Phi|<tuple|80|11>>
    <associate|eq:X_t_equality|<tuple|83|11>>
    <associate|eq:X_t_harmonizable|<tuple|87|12>>
    <associate|eq:Xt_harmonizable_thm|<tuple|89|12>>
    <associate|eq:Y_inner_product|<tuple|76|10>>
    <associate|eq:bound_a|<tuple|22|5>>
    <associate|eq:bound_b|<tuple|23|5>>
    <associate|eq:characterization|<tuple|8|3>>
    <associate|eq:complex_inequality|<tuple|28|6>>
    <associate|eq:complex_numbers|<tuple|21|5>>
    <associate|eq:correlation|<tuple|3|1>>
    <associate|eq:def_harmonizable|<tuple|7|2>>
    <associate|eq:dom_measure|<tuple|49|8>>
    <associate|eq:ergodic|<tuple|108|14>>
    <associate|eq:final_real|<tuple|43|7>>
    <associate|eq:fourier_equality|<tuple|88|12>>
    <associate|eq:harmonizable1|<tuple|4|1>>
    <associate|eq:harmonizable2|<tuple|5|1>>
    <associate|eq:harmonizable_rozanov|<tuple|6|2>>
    <associate|eq:inner_product_def|<tuple|71|10>>
    <associate|eq:integration_results|<tuple|10|4>>
    <associate|eq:kernel|<tuple|16|4>>
    <associate|eq:kernel_inequality|<tuple|17|4>>
    <associate|eq:mu0_bound_1|<tuple|64|9>>
    <associate|eq:mu0_bound_2|<tuple|65|9>>
    <associate|eq:mu0_bound_final|<tuple|67|10>>
    <associate|eq:mu0_def|<tuple|57|9>>
    <associate|eq:mu1_F_inequality|<tuple|70|10>>
    <associate|eq:mu1_def|<tuple|69|10>>
    <associate|eq:operator_S|<tuple|31|6>>
    <associate|eq:operator_inequality|<tuple|15|4>>
    <associate|eq:operators|<tuple|13|4>>
    <associate|eq:positive_definite|<tuple|9|3>>
    <associate|eq:projection|<tuple|68|10>>
    <associate|eq:proof_real|<tuple|24|6>>
    <associate|eq:real_numbers|<tuple|19|5>>
    <associate|eq:rho_inequality|<tuple|50|8>>
    <associate|eq:simple_functions|<tuple|26|6>>
    <associate|eq:spectral_measure|<tuple|2|1>>
    <associate|eq:stationary|<tuple|1|1>>
    <associate|eq:vbounded|<tuple|86|12>>
    <associate|eq:vbounded_assumption|<tuple|95|13>>
    <associate|item:bound_a|<tuple|1|5>>
    <associate|item:bound_b|<tuple|2|5>>
    <associate|item:bounded_semi_var|<tuple|4|3>>
    <associate|item:continuous_zero|<tuple|2|3>>
    <associate|item:finitely_additive|<tuple|1|3>>
    <associate|item:harmonizable|<tuple|1|2>>
    <associate|item:positive_definite|<tuple|3|3>>
    <associate|item:projection|<tuple|2|2>>
    <associate|item:vbounded|<tuple|3|2>>
    <associate|lem:dom_measure|<tuple|4|8>>
    <associate|lem:fourier_equality|<tuple|8|12>>
    <associate|lem:spectral_bound|<tuple|3|5>>
    <associate|rem:discrete|<tuple|11|15>>
    <associate|thm:characterization|<tuple|2|3>>
    <associate|thm:main_theorem|<tuple|5|10>>
    <associate|thm:vbounded_harmonic|<tuple|9|12>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      masani

      loeve

      cramer

      abreu

      rozanov

      dunford

      rozanov

      dunford

      rozanov

      niemi1

      niemi2

      niemi3

      niemi4

      kluvanek

      rogge

      pietsch

      dubinsky

      grothendieck

      rozanov

      rozanov

      rozanov

      pietsch

      rogge

      rogge

      rogge

      rozanov

      dunford

      rudin

      dunford

      rozanov

      abreu

      niemi2

      bochner

      niemi4

      rudin

      kluvanek

      rozanov
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>