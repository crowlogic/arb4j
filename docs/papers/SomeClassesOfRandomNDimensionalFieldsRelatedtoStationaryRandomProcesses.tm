<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Some Classes of Random Fields in n-Dimensional Space,
  Related to Stationary Random Processes>|<doc-author|<author-data|<author-name|A.M.
  Yaglom>|<author-affiliation|(Translated by R.A.
  Silverman)>>>|<doc-date|1957>>

  <no-indent><with|font-shape|italic|Theory of Probability and Its
  Applications, 1957, Volume II, Number 3>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Homogeneous
    Random Fields> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Locally
    Homogeneous Random Fields (Fields with Homogeneous Increments)>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction>

  In recent decades there has been a great development of the theory of
  random processes, i.e., of random functions of one real variable, usually
  regarded as the time. At present there is a whole series of special
  monographs and review articles devoted to this theory (see e.g.
  <cite|Levy1948|Doob1956|Blanc-Lapierre1953|Bartlett1955|Yaglom1952>). The
  theory of random functions of several variables has been much less studied;
  the present article is devoted to certain topics in this theory.

  We consider complex random functions <math|\<xi\><around|(|<math-bf|x>|)>=\<xi\><around|(|x<rsub|1>,\<cdots\>,x<rsub|n>|)>>
  of <math|n> real variables, i.e., of a point
  <math|<math-bf|x>=<around|(|x<rsub|1>,\<cdots\>,x<rsub|n>|)>> of the
  <math|n>-dimensional space <math|R<rsub|n>>; we call such functions random
  <with|font-shape|italic|fields> in <math|R<rsub|n>>. Together with ordinary
  fields <math|\<xi\><around|(|<math-bf|x>|)>> we also consider generalized
  random fields (in the sense of Ito <cite|Ito1954>\UGelfand
  <cite|Gelfand1955>), i.e., random linear functionals
  <math|\<xi\><around|(|\<varphi\>|)>> with respect to
  <math|\<varphi\>\<in\>D>, where <math|D> is the class of infinitely
  differentiable complex functions of <math|n> variables, and each
  <math|\<varphi\>\<in\>D> vanishes outside some compact set. In this study
  we confine ourselves to the correlation theory of random fields, i.e.,
  random variables which are equal to each other with probability one are
  regarded as identical and we consider only the first and second moments

  <\equation>
    <label|eq:ordinary-moments>m<around|(|<math-bf|x>|)>=M*\<xi\><around|(|<math-bf|x>|)>,<space|1em>B<around|(|<math-bf|x><rsub|1>,<math-bf|x><rsub|2>|)>=M*\<xi\><around|(|<math-bf|x><rsub|1>|)><wide|\<xi\><around|(|<math-bf|x><rsub|2>|)>|\<bar\>>
  </equation>

  or

  <\equation>
    <label|eq:generalized-moments>m<around|(|\<varphi\>|)>=M*\<xi\><around|(|\<varphi\>|)>,<space|1em>B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>=M*\<xi\><around|(|\<varphi\><rsub|1>|)><wide|\<xi\><around|(|\<varphi\><rsub|2>|)>|\<bar\>>
  </equation>

  of the random variables <math|\<xi\><around|(|<math-bf|x>|)>,<math-bf|x>\<in\>R<rsub|n>>
  or <math|\<xi\><around|(|\<varphi\>|)>,\<varphi\>\<in\>D>, respectively. In
  what follows the mathematical expectations <eqref|eq:ordinary-moments> and
  <eqref|eq:generalized-moments> will always be assumed to be finite;
  moreover, the fields considered will always be assumed to be continuous in
  the sense that

  <\equation>
    <label|eq:continuity-ordinary>lim<rsub|<math-bf|x><rsub|1>\<to\><math-bf|x>>
    M*<around|\||\<xi\><around|(|<math-bf|x><rsub|1>|)>-\<xi\><around|(|<math-bf|x>|)>|\|><rsup|2>=0
  </equation>

  or

  <\equation>
    <label|eq:continuity-generalized>lim<rsub|\<varphi\><rsub|1>\<to\>\<varphi\>>
    M*<around|\||\<xi\><around|(|\<varphi\><rsub|1>|)>-\<xi\><around|(|\<varphi\>|)>|\|><rsup|2>=0
  </equation>

  respectively, where in <eqref|eq:continuity-generalized>
  <math|\<varphi\><rsub|1>\<to\>\<varphi\>> is understood in the sense of the
  usual Schwartz topology <cite|Schwartz1950> in the space <math|D> (i.e.,
  <math|lim \<varphi\><rsub|n>=\<varphi\>> means that the functions
  <math|\<varphi\><rsub|n>> and <math|\<varphi\>> all vanish outside the same
  compact set and that as <math|n\<to\>\<infty\>> all the partial derivatives
  of <math|\<varphi\><rsub|n>> approach the corresponding partial derivatives
  of the function <math|\<varphi\>> on this compact set). It is clear that
  using the formula

  <\equation>
    <label|eq:field-representation>\<xi\><around|(|\<varphi\>|)>=<big|int><rsub|R<rsub|n>>\<xi\><around|(|<math-bf|x>|)>*\<varphi\><around|(|<math-bf|x>|)>*<space|0.17em>d<math-bf|x>
  </equation>

  where <math|d<math-bf|x>=d*x<rsub|1>*\<cdots\>*d*x<rsub|n>>, we can
  associate a certain continuous generalized field
  <math|\<xi\><around|(|\<varphi\>|)>> with every continuous random field; in
  this sense ordinary random fields are a special case of generalized random
  fields. At the same time, the transition to the more general case of
  generalized random fields actually simplifies proofs in some cases;
  therefore, in what follows, we shall always consider generalized fields
  first, and then derive as consequences the corresponding results for
  ordinary fields.

  In the applications, random fields <math|\<xi\><around|(|<math-bf|x>|)>>
  were encountered first in the statistical theory of turbulence; in keeping
  with the particularly important role played in this theory by the special
  cases of homogeneous turbulence and homogeneous isotropic turbulence, the
  first concern here was with the notions of homogeneous and homogeneous
  isotropic random fields, respectively, which generalize the notion of a
  stationary random process. In this regard, many important results
  concerning such fields <math|\<xi\><around|(|<math-bf|x>|)>> were pointed
  out in papers on turbulence theory, published in physical and geophysical
  journals (see <cite|Taylor1935|VonKarman1941|Obukhov1941>); however, these
  results usually lacked complete mathematical proofs. The further
  development of the statistical theory of turbulence, associated with the
  important concept of locally homogeneous and locally isotropic turbulence,
  introduced by A.N. Kolmogorov <cite|Kolmogorov1941a|Kolmogorov1941b>,
  likewise required the consideration of more general locally homogeneous and
  locally isotropic random fields, which generalize the notion of a process
  with stationary increments; in this connection, such fields are frequently
  mentioned in the literature (see e.g. <cite|Batchelor1947|Obukhov1951>),
  but it appears that until now they have hardly been studied mathematically.
  Thus, the purpose of this paper is to give a mathematical theory, which is
  as complete as possible, of all the classes of random fields just
  enumerated, a theory analogous to the well known theory of stationary
  random processes and processes with stationary increments.

  While working on the formulation of this paper, the author became
  acquainted with the paper of Ito <cite|Ito1956>, devoted to the
  mathematical theory of a class of multidimensional generalized random
  fields, which contain as a special case all the fields studied in
  Section<nbsp>4 below. However, Ito's results (accompanied only by a sketch
  of the proofs) encompass only a comparatively small part of the results of
  our Section<nbsp>4.

  <section|Homogeneous Random Fields>

  We introduce the operator <math|\<tau\><rsub|<math-bf|y>>> of the space
  <math|D> by the vector <math|<math-bf|y>> which shifts the argument of the
  function

  <\equation>
    <label|eq:shift-operator>\<tau\><rsub|<math-bf|y>>*\<varphi\><around|(|<math-bf|x>|)>=\<varphi\>*<around|(|<math-bf|x>+<math-bf|y>|)>
  </equation>

  A random field <math|\<xi\><around|(|\<varphi\>|)>> (in general, a
  generalized random field) is called <with|font-shape|italic|homogeneous> if
  the first and second moments of the field, the mean value and correlation
  functional <math|B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>>, are
  invariant with respect to any shift <math|\<tau\><rsub|<math-bf|y>>> of
  their functional arguments:

  <\equation>
    <label|eq:homogeneous-mean>m<around|(|\<varphi\>|)>=m*<around|(|\<tau\><rsub|<math-bf|y>>*\<varphi\>|)>
  </equation>

  <\equation>
    <label|eq:homogeneous-correlation>B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>=B<around|(|\<tau\><rsub|<math-bf|y>>*\<varphi\><rsub|1>,\<tau\><rsub|<math-bf|y>>*\<varphi\><rsub|2>|)>
  </equation>

  These conditions are obviously met, in particular, in the case where
  <math|\<xi\><around|(|\<varphi\>|)>> is given by equation
  <eqref|eq:field-representation>, and where
  <math|\<xi\><around|(|<math-bf|x>|)>> is an ordinary random field such that
  for any <math|<math-bf|y>\<in\>R<rsub|n>> the mean value
  <math|m<around|(|<math-bf|x>|)>> and the correlation function
  <math|B<around|(|<math-bf|x><rsub|1>,<math-bf|x><rsub|2>|)>> satisfy the
  relations

  <\equation>
    <label|eq:ordinary-homogeneous-mean>m*<around|(|<math-bf|x>+<math-bf|y>|)>=m<around|(|<math-bf|x>|)>,<space|0.27em><text|i.e.,
    >m<around|(|<math-bf|x>|)>=m=<text|const.>
  </equation>

  <\equation>
    <label|eq:ordinary-homogeneous-correlation>B<around|(|<math-bf|x><rsub|1>+<math-bf|y>,<math-bf|x><rsub|2>+<math-bf|y>|)>=B<around|(|<math-bf|x><rsub|1>,<math-bf|x><rsub|2>|)>,<space|0.27em><text|i.e.,
    >B<around|(|<math-bf|x><rsub|1>,<math-bf|x><rsub|2>|)>=B*<around|(|<math-bf|x><rsub|1>-<math-bf|x><rsub|2>|)>
  </equation>

  The conditions <eqref|eq:ordinary-homogeneous-mean> and
  <eqref|eq:ordinary-homogeneous-correlation> are the conditions for an
  ordinary (non-generalized) homogeneous field.

  <\theorem>
    <label|thm:homogeneous-representation>For any (generalized) homogeneous
    random field <math|\<xi\><around|(|\<varphi\>|)>> in <math|R<rsub|n>> the
    mean value <math|m<around|(|\<varphi\>|)>> and the correlation functional
    <math|B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>> can be
    represented in the form

    <\equation>
      <label|eq:homogeneous-mean-form>m<around|(|\<varphi\>|)>=m*<big|int><rsub|R<rsub|n>>\<varphi\><around|(|<math-bf|x>|)>*<space|0.17em>d<math-bf|x>
    </equation>

    where <math|m> is a constant,

    <\equation>
      <label|eq:homogeneous-correlation-form>B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>=<big|int><rsub|P<rsub|n>><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em>F*<around|(|d*\<b-lambda\>|)>
    </equation>

    where

    <\equation>
      <label|eq:fourier-transform><wide|\<varphi\>|~><around|(|\<b-lambda\>|)>=<big|int><rsub|R<rsub|n>>e<rsup|i*\<b-lambda\>\<cdot\><math-bf|x>>*\<varphi\><around|(|<math-bf|x>|)>*<space|0.17em>d<math-bf|x>
    </equation>

    is the Fourier transform of the function
    <math|\<varphi\><around|(|<math-bf|x>|)>>, and <math|F<around|(|S|)>> is
    a measure on the <math|n>-dimensional space of \Pwave vectors\Q such that
    the inequality

    <\equation>
      <label|eq:measure-condition><big|int><rsub|P<rsub|n>><frac|F*<around|(|d*\<b-lambda\>|)>|<around|(|1+\<lambda\><rsup|2>|)><rsup|p>>\<less\>\<infty\>,<space|1em>\<lambda\>=<around|\||\<b-lambda\>|\|>=<sqrt|\<lambda\><rsub|1><rsup|2>+\<cdots\>+\<lambda\><rsub|n><rsup|2>>
    </equation>

    is satisfied for some non-negative number <math|p> (a \Pslowly growing
    measure\Q).

    Conversely, every linear functional of the form
    <eqref|eq:homogeneous-mean-form>, where <math|m> is a constant, is the
    mean value of some generalized homogeneous random field, and every
    bilinear functional of the form <eqref|eq:homogeneous-correlation-form>,
    where <math|F<around|(|S|)>> is a slowly growing measure in
    <math|P<rsub|n>>, is the correlation functional of some such field.
  </theorem>

  We shall henceforth call the measure <math|F<around|(|S|)>> the
  <with|font-shape|italic|spectral measure> of the field.

  <\proof>
    We use the well known fact (see <cite|Schwartz1950|Gelfand1955>) that
    every linear functional <math|m<around|(|\<varphi\>|)>> on the space
    <math|D<around|(|T|)>> of infinitely differentiable functions defined on
    a given finite <math|n>-dimensional parallelopiped <math|T> (where
    <math|D<around|(|T|)>> is regarded as a subspace of the space <math|D>)
    can be represented in the form

    <\equation>
      <label|eq:linear-functional-representation>m<around|(|\<varphi\>|)>=<big|int><rsub|R<rsub|n>>g<around|(|<math-bf|x>|)><frac|\<partial\><rsup|N>*\<varphi\><around|(|<math-bf|x>|)>|\<partial\>*x<rsub|1><rsup|k<rsub|1>>*\<cdots\>*\<partial\>*x<rsub|n><rsup|k<rsub|n>>>*<space|0.17em>d<math-bf|x>,<space|1em>N=k<rsub|1>+\<cdots\>+k<rsub|n>,
    </equation>

    where <math|g<around|(|<math-bf|x>|)>> is a continuous function of
    <math|<math-bf|x>>. But in this case it follows from
    <eqref|eq:homogeneous-mean> that the mean value
    <math|m<around|(|\<varphi\>|)>> of the generalized homogeneous random
    field can also be represented in the same way for all
    <math|\<varphi\>\<in\>D<rsub|1>>, where here the function
    <math|g<around|(|<math-bf|x>|)>> must satisfy the condition

    <\equation>
      <label|eq:homogeneity-condition-d1><big|int><rsub|R<rsub|n>><around|[|g*<around|(|<math-bf|x>+<math-bf|y>|)>-g<around|(|<math-bf|x>|)>|]>*<frac|\<partial\><rsup|N>*\<varphi\><around|(|<math-bf|x>|)>|\<partial\>*x<rsub|1><rsup|k<rsub|1>>*\<cdots\>*\<partial\>*x<rsub|n><rsup|k<rsub|n>>>*<space|0.17em>d<math-bf|x>=0
    </equation>

    for any <math|<math-bf|y>\<in\>R<rsub|n>> and
    <math|\<varphi\>\<in\>D<rsub|1>>. The last equation shows that
    <math|g*<around|(|<math-bf|x>+<math-bf|y>|)>-g<around|(|<math-bf|x>|)>>
    is a polynomial in <math|x<rsub|1>,\<cdots\>,x<rsub|n>> (with
    coefficients which can depend on <math|y<rsub|1>,\<cdots\>,y<rsub|n>>) of
    degree no higher than <math|k<rsub|j>> in <math|x<rsub|j>>,
    <math|j=1,\<cdots\>,n>. Therefore <math|g<around|(|<math-bf|x>|)>> is a
    polynomial in <math|x<rsub|1>,\<cdots\>,x<rsub|n>> whose degree with
    respect to <math|x<rsub|j>> does not exceed <math|k<rsub|j>+1>, and after
    some partial differentiations we obtain from
    <eqref|eq:linear-functional-representation> the formula

    <\equation>
      <label|eq:locally-homogeneous-mean-form>m<around|(|\<varphi\>|)>=<big|sum><rsub|j=1><rsup|n>m<rsub|j>*<big|int><rsub|R<rsub|n>>x<rsub|j>*\<varphi\><around|(|<math-bf|x>|)>*<space|0.17em>d<math-bf|x>
    </equation>

    which is equivalent to <eqref|eq:locally-homogeneous-mean>.

    To prove that every linear functional of the form
    <eqref|eq:locally-homogeneous-mean> is the mean value of some generalized
    locally homogeneous field, it is sufficient to consider the field
    <math|\<xi\><around|(|\<varphi\>|)>=<math-bf|m>\<cdot\>\<nabla\>*<wide|\<varphi\>|~><around|(|<with|math-font-family|bf|0>|)>>
    which is obviously locally homogeneous.

    We now turn to the proof of equation <eqref|eq:locally-homogeneous-correlation>.
    For this we use the fact that if <math|\<xi\><around|(|\<varphi\>|)>> is
    a locally homogeneous random field in <math|R<rsub|n>> and
    <math|<math-bf|r>> is a fixed vector, then the linear functional

    <\equation>
      <label|eq:increment-field-functional>\<xi\><rsub|<math-bf|r>><around|(|\<varphi\>|)>=\<xi\>*<around|(|\<varphi\>-\<tau\><rsub|<math-bf|r>>*\<varphi\>|)>,<space|1em>\<varphi\>\<in\>D,<space|0.27em>\<varphi\>-\<tau\><rsub|<math-bf|r>>*\<varphi\>\<in\>D<rsub|1>
    </equation>

    will be a homogeneous random field in <math|R<rsub|n>>, depending on the
    vector parameter <math|<math-bf|r>>, where the <math|N> random fields
    <math|<around|{|\<xi\><rsub|<math-bf|r><rsub|1>><around|(|\<varphi\>|)>,\<cdots\>,\<xi\><rsub|<math-bf|r><rsub|N>><around|(|\<varphi\>|)>|}>>
    will constitute an <math|N>-dimensional homogeneous random field for any
    <math|<math-bf|r><rsub|1>,\<cdots\>,<math-bf|r><rsub|N>\<in\>R<rsub|n>>.
    Therefore, by Theorem<nbsp><reference|thm:multidimensional-homogeneous>

    <\equation>
      <label|eq:increment-correlation-proof>M*\<xi\><rsub|<math-bf|r><rsub|1>><around|(|\<varphi\><rsub|1>|)><wide|\<xi\><rsub|<math-bf|r><rsub|2>><around|(|\<varphi\><rsub|2>|)>|\<bar\>>=<big|int><rsub|P<rsub|n>><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>,
    </equation>

    where <math|F<around|(|S;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>> is a
    complex function of the set <math|S> of the space <math|P<rsub|n>>, a
    function which is slowly growing in modulus, depends on the vectors
    <math|<math-bf|r><rsub|1>,<math-bf|r><rsub|2>>, and is such that the
    inequality

    <\equation>
      <label|eq:increment-positivity><big|sum><rsub|k,l=1><rsup|N>F<around|(|S;<math-bf|r><rsub|k>,<math-bf|r><rsub|l>|)>*\<alpha\><rsub|k>*<wide|\<alpha\>|\<bar\>><rsub|l>\<ge\>0
    </equation>

    is valid for any choice of <math|S>, the positive integer <math|N>, the
    vectors <math|<math-bf|r><rsub|1>,\<cdots\>,<math-bf|r><rsub|N>> and the
    complex numbers <math|\<alpha\><rsub|1>,\<cdots\>,\<alpha\><rsub|N>> (so
    that in particular <math|F<around|(|S;<math-bf|r>,<math-bf|r>|)>> is
    always a non-negative measure).

    We observe now that, because of the linearity of
    <math|\<xi\><rsub|<math-bf|r>><around|(|\<varphi\>|)>> and the obvious
    equality <math|\<tau\><rsub|<math-bf|r><rsub|1><rprime|'>>*\<tau\><rsub|<math-bf|r><rsub|1><rprime|''>>=\<tau\><rsub|<math-bf|r><rsub|1><rprime|'>+<math-bf|r><rsub|1><rprime|''>>>,
    we have

    <\equation>
      <label|eq:increment-additivity>\<xi\><rsub|<math-bf|r><rsub|1><rprime|'>+<math-bf|r><rsub|1><rprime|''>><around|(|\<varphi\>|)>=\<xi\><rsub|<math-bf|r><rsub|1><rprime|'>><around|(|\<varphi\>|)>+\<xi\><rsub|<math-bf|r><rsub|1><rprime|'>>*<around|(|\<tau\><rsub|<math-bf|r><rsub|1><rprime|''>>*\<varphi\>|)>=\<xi\><rsub|<math-bf|r><rsub|1><rprime|'>><around|(|\<varphi\>|)>+\<xi\><rsub|<math-bf|r><rsub|1><rprime|''>>*<around|(|\<tau\><rsub|<math-bf|r><rsub|1><rprime|'>>*\<varphi\>|)>
    </equation>

    Bearing in mind that the Fourier transforms of the functions
    <math|\<varphi\>> and <math|\<tau\><rsub|<math-bf|r>>*\<varphi\>> are
    connected by the relation <math|<wide|\<tau\><rsub|<math-bf|r>>*\<varphi\>|~><around|(|\<b-lambda\>|)>=e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r>>*<wide|\<varphi\>|~><around|(|\<b-lambda\>|)>>,
    we immediately obtain from <eqref|eq:increment-additivity> and
    <eqref|eq:increment-correlation-proof>

    <\equation>
      <label|eq:increment-correlation-relation><big|int><rsub|P<rsub|n>><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1><rprime|'>,<math-bf|r><rsub|2>|)>=<big|int><rsub|P<rsub|n>><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1><rprime|'>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1><rprime|''>,<math-bf|r><rsub|2>|)>
    </equation>

    Since here <math|<wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)>>
    and <math|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>> are
    Fourier transforms of two arbitrary functions of <math|D>, it follows
    from the equality of the middle and right hand terms of
    <eqref|eq:increment-correlation-relation> that

    <\equation>
      <label|eq:increment-measure-relation><big|int><rsub|S><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1><rprime|'>,<math-bf|r><rsub|2>|)>=<big|int><rsub|S><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1><rprime|'>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1><rprime|''>,<math-bf|r><rsub|2>|)>
    </equation>

    for all <math|S> for which <math|F<around|(|S;<math-bf|r><rsub|1><rprime|'>+<math-bf|r><rsub|1><rprime|''>,<math-bf|r><rsub|2>|)>>
    is defined.

    Now applying equation <eqref|eq:increment-additivity> to the field
    <math|\<xi\><rsub|<math-bf|r><rsub|2>><around|(|\<varphi\><rsub|2>|)>>,
    we obtain similarly

    <\equation>
      <label|eq:increment-measure-relation-2><big|int><rsub|S><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>=<big|int><rsub|S><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1><rprime|'>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1><rprime|''>,<math-bf|r><rsub|2>|)>
    </equation>

    By now it is not hard to obtain equation
    <eqref|eq:locally-homogeneous-correlation>. Let <math|S> be a set of
    <math|P<rsub|n><rsup|->> and let

    <\equation>
      <label|eq:spectral-measure-definition>F<around|(|S|)>=<big|int><rsub|S><frac|F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>|<around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>>
    </equation>

    According to <eqref|eq:increment-measure-relation-2>, the function
    <math|F<around|(|S|)>> does not depend on the choice of the vectors
    <math|<math-bf|r><rsub|1>,<math-bf|r><rsub|2>>, and consequently can be
    defined for any set <math|S> of <math|P<rsub|n><rsup|->> (since <math|S>
    can always be decomposed into parts, for each of which the product
    <math|<around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>>
    does not vanish for any choice of <math|<math-bf|r><rsub|1>,<math-bf|r><rsub|2>>).
    It follows from the non-negativity of
    <math|F<around|(|d*\<b-lambda\>;<math-bf|r>,<math-bf|r>|)>> that the
    function <math|F<around|(|S|)>> is non-negative; as the set <math|S>
    approaches infinity unboundedly or the point
    <math|<with|math-font-family|bf|0>>, the value of <math|F<around|(|S|)>>
    will approach infinity, but only in such a way that the inequality
    <eqref|eq:locally-homogeneous-measure-condition> holds. Thus equation
    <eqref|eq:increment-correlation-proof> can be rewritten in the form

    <\equation>
      <label|eq:increment-correlation-final>M*\<xi\><rsub|<math-bf|r><rsub|1>><around|(|\<varphi\><rsub|1>|)><wide|\<xi\><rsub|<math-bf|r><rsub|2>><around|(|\<varphi\><rsub|2>|)>|\<bar\>>=<big|int><rsub|P<rsub|n><rsup|->><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>*<space|0.17em>F*<around|(|d*\<b-lambda\>|)>+\<cal-A\><math-bf|r><rsub|1>\<cdot\><math-bf|r><rsub|2>
    </equation>

    where <math|F<around|(|S|)>> is a measure in <math|P<rsub|n><rsup|->>
    which meets the conditions stated in the formulation of
    Theorem<nbsp><reference|thm:locally-homogeneous-representation>, and
    <math|\<cal-A\>> is a numerical function of the vectors
    <math|<math-bf|r><rsub|1>> and <math|<math-bf|r><rsub|2>>.

    Let us further specify the form of this last function. It easily follows
    from the equality of the first and middle terms of
    <eqref|eq:increment-correlation-relation> that the function
    <math|\<cal-A\><around|(|<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>>
    depends linearly on <math|<math-bf|r><rsub|1>>; in just the same way it
    is shown that it depends linearly on <math|<math-bf|r><rsub|2>>. Thus

    <\equation>
      <label|eq:linear-term>\<cal-A\><around|(|<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>=\<cal-A\><math-bf|r><rsub|1>\<cdot\><math-bf|r><rsub|2>
    </equation>

    where as a consequence of inequality <eqref|eq:increment-positivity> the
    matrix <math|\<cal-A\>> must be Hermitean non-negative.

    If now we write

    <\equation>
      <label|eq:difference-definition>\<varphi\>-\<tau\><rsub|<math-bf|r>>*\<varphi\>=\<varphi\><rsup|<around|(|<math-bf|r>|)>>
    </equation>

    then equations <eqref|eq:increment-correlation-final> and
    <eqref|eq:linear-term> can be rewritten in the

    <\equation>
      <label|eq:increment-correlation-difference>M*\<xi\><around|(|\<varphi\><rsub|1><rsup|<around|(|<math-bf|r><rsub|1>|)>>|)><wide|\<xi\><around|(|\<varphi\><rsub|2><rsup|<around|(|<math-bf|r><rsub|2>|)>>|)>|\<bar\>>=<big|int><rsub|P<rsub|n><rsup|->><wide|\<varphi\>|~><rsub|1><rsup|<around|(|<math-bf|r><rsub|1>|)>><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><rsup|<around|(|<math-bf|r><rsub|2>|)>><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em>F*<around|(|d*\<b-lambda\>|)>+\<cal-A\>*\<nabla\>*<wide|\<varphi\>|~><rsub|1><rsup|<around|(|<math-bf|r><rsub|1>|)>><around|(|<with|math-font-family|bf|0>|)>\<cdot\><wide|\<nabla\>*<wide|\<varphi\>|~><rsub|2><rsup|<around|(|<math-bf|r><rsub|2>|)>><around|(|<with|math-font-family|bf|0>|)>|\<bar\>>
    </equation>

    which proves equation <eqref|eq:locally-homogeneous-correlation> for
    functions <math|\<varphi\><rsub|1>> and <math|\<varphi\><rsub|2>> of the
    form <eqref|eq:difference-definition>. It follows immediately from this
    that this formula is true also for the case where
    <math|\<varphi\><rsub|1>> and <math|\<varphi\><rsub|2>> are linear
    combinations or limits of linear combinations of functions of the form
    <eqref|eq:difference-definition>; but since functions of this form and
    their linear combinations are dense in <math|D<rsub|1>>, this completely
    proves equation <eqref|eq:locally-homogeneous-correlation>.

    The proof that every bilinear functional of the form
    <eqref|eq:locally-homogeneous-correlation> is the correlation functional
    of a locally homogeneous field can be carried out just like the
    corresponding proof for generalized stationary processes (see
    <cite|Ito1954>). Namely, if <math|\<varphi\><rsub|1>,\<cdots\>,\<varphi\><rsub|N>\<in\>D<rsub|1>>
    and <math|B<around|(|\<varphi\><rsub|k>,\<varphi\><rsub|l>|)>> is given
    by equation <eqref|eq:locally-homogeneous-correlation>, then

    <\equation>
      <label|eq:positive-definiteness><big|sum><rsub|k,l=1><rsup|N>B<around|(|\<varphi\><rsub|k>,\<varphi\><rsub|l>|)>*\<alpha\><rsub|k>*<wide|\<alpha\>|\<bar\>><rsub|l>\<ge\>0
    </equation>

    for any complex numbers <math|\<alpha\><rsub|1>,\<cdots\>,\<alpha\><rsub|N>>;
    therefore we can define a set of multidimensional normal distributions
    for the complex random variables <math|\<xi\><around|(|\<varphi\>|)>>,
    <math|\<varphi\>\<in\>D<rsub|1>>, such that
    <math|M*\<xi\><around|(|\<varphi\><rsub|1>|)><wide|\<xi\><around|(|\<varphi\><rsub|2>|)>|\<bar\>>=B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>>
    and, for example, <math|M*\<xi\><around|(|\<varphi\>|)>=0>. Moreover,
    using the bilinearity of <math|B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>>
    it can immediately be verified that <math|M*<around|\||c*\<xi\><around|(|\<varphi\>|)>-\<xi\>*<around|(|c*\<varphi\>|)>|\|><rsup|2>=0>
    for any <math|\<varphi\>\<in\>D<rsub|1>> and any complex number <math|c>,
    and that <math|M*<around|\||\<xi\>*<around|(|\<varphi\><rsub|1>+\<varphi\><rsub|2>|)>-\<xi\><around|(|\<varphi\><rsub|1>|)>-\<xi\><around|(|\<varphi\><rsub|2>|)>|\|><rsup|2>=0>
    for any <math|\<varphi\><rsub|1>,\<varphi\><rsub|2>\<in\>D<rsub|1>>, and
    it can also be proved that the continuity condition
    <eqref|eq:continuity-generalized> holds. Consequently,
    <math|\<xi\><around|(|\<varphi\>|)>> is a generalized locally homogeneous
    field with correlation functional <eqref|eq:locally-homogeneous-correlation>,
    QED.

    Another proof of the converse of Theorem<nbsp><reference|thm:locally-homogeneous-representation>
    can be given by using Theorem<nbsp><reference|thm:locally-homogeneous-spectral>
    on the spectral decomposition of the locally homogeneous field itself.
  </proof>

  <\theorem>
    <label|thm:multidimensional-homogeneous>For any collection of <math|N>
    generalized homogeneous random fields
    <math|<around|{|\<xi\><rsub|1><around|(|\<varphi\>|)>,\<cdots\>,\<xi\><rsub|N><around|(|\<varphi\>|)>|}>>
    in <math|R<rsub|n>>, the joint correlation functional can be represented
    in the form

    <\equation>
      <label|eq:multidimensional-correlation>M*\<xi\><rsub|k><around|(|\<varphi\><rsub|1>|)><wide|\<xi\><rsub|l><around|(|\<varphi\><rsub|2>|)>|\<bar\>>=<big|int><rsub|P<rsub|n>><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em>F<rsub|k*l>*<around|(|d*\<b-lambda\>|)>
    </equation>

    where <math|F<rsub|k*l><around|(|S|)>> is a complex matrix-valued measure
    such that the matrix <math|<around|[|F<rsub|k*l><around|(|S|)>|]>> is
    non-negative Hermitean for each set <math|S>, and each
    <math|F<rsub|k*l><around|(|S|)>> satisfies the slow growth condition
    <eqref|eq:measure-condition>.
  </theorem>

  <\proof>
    This follows directly from Theorem<nbsp><reference|thm:homogeneous-representation>
    applied to each field individually and using the positive definiteness
    condition for the joint correlation structure.
  </proof>

  <section|Locally Homogeneous Random Fields (Fields with Homogeneous
  Increments)>

  By a generalized locally homogeneous random field (or, alternatively, a
  random field with homogeneous increments) we mean a random linear
  functional <math|\<xi\><around|(|\<varphi\>|)>>, continuous in the sense of
  <eqref|eq:continuity-generalized>, defined on the set <math|D<rsub|1>> of
  functions <math|\<varphi\>\<in\>D> satisfying the condition

  <\equation>
    <label|eq:zero-mean-condition><big|int><rsub|R<rsub|n>>\<varphi\><around|(|<math-bf|x>|)>*<space|0.17em>d<math-bf|x>=0
  </equation>

  and such that the mathematical expectations <eqref|eq:generalized-moments>
  satisfy the conditions <eqref|eq:homogeneous-mean> and
  <eqref|eq:homogeneous-correlation>, for any
  <math|\<varphi\>,\<varphi\><rsub|1>,\<varphi\><rsub|2>\<in\>D<rsub|1>> and
  any <math|<math-bf|y>\<in\>R<rsub|n>>.

  We observe that if we assume that the functional
  <math|\<xi\><around|(|\<varphi\>|)>> is given by equation
  <eqref|eq:field-representation>, where <math|\<xi\><around|(|<math-bf|x>|)>>
  is a continuous random point function, then if we confine ourselves to
  functions <math|\<varphi\>> of the class <math|D<rsub|1>>, we can only
  define the values of <math|\<xi\><around|(|<math-bf|x>|)>> up to an
  additive constant. A random field <math|\<xi\><around|(|<math-bf|x>|)>>
  which is defined only up to an additive constant can be regarded as a
  collection of random variables <math|\<xi\><around|(|<math-bf|x>|)>-\<xi\><around|(|<with|math-font-family|bf|0>|)>>,
  or (which will be more convenient here) as a collection of quantities

  <\equation>
    <label|eq:increment-field>A<rsub|<math-bf|r>>*\<xi\><around|(|<math-bf|x>|)>=\<xi\><around|(|<math-bf|x>|)>-\<xi\>*<around|(|<math-bf|x>-<math-bf|r>|)>
  </equation>

  defined for all possible <math|<math-bf|x>,<math-bf|r>\<in\>R<rsub|n>>
  (i.e., as a field in <math|R<rsub|2*n>>) and satisfying the condition

  <\equation>
    <label|eq:increment-condition>A<rsub|<math-bf|r><rsub|1>+<math-bf|r><rsub|2>>*\<xi\><around|(|<math-bf|x>|)>=A<rsub|<math-bf|r><rsub|1>>*\<xi\><around|(|<math-bf|x>|)>+A<rsub|<math-bf|r><rsub|2>>*<around|(|<math-bf|x>-<math-bf|r><rsub|1>|)>
  </equation>

  Now taking into consideration the conditions <eqref|eq:homogeneous-mean>
  and <eqref|eq:homogeneous-correlation>, we arrive at the following
  definition: a random field <math|\<xi\><around|(|<math-bf|x>|)>>, defined
  only up to a constant, is called an ordinary (non-generalized) locally
  homogeneous field, if the mathematical expectations

  <\equation>
    <label|eq:increment-mean>M*A<rsub|<math-bf|y>>*\<xi\><around|(|<math-bf|x>|)>=m<around|(|<math-bf|r>|)>
  </equation>

  and

  <\equation>
    <label|eq:increment-correlation>M*A<rsub|<math-bf|y>>*\<xi\>*<around|(|<math-bf|x>+<math-bf|r><rsub|1>|)><wide|A<rsub|<math-bf|y>>*\<xi\>*<around|(|<math-bf|x>+<math-bf|r><rsub|2>|)>|\<bar\>>=D<around|(|<math-bf|x>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>
  </equation>

  do not depend on <math|<math-bf|y>> for all
  <math|<math-bf|x>,<math-bf|y>,<math-bf|r>,<math-bf|r><rsub|1>,<math-bf|r><rsub|2>\<in\>R<rsub|n>>.
  The mathematical expectations <eqref|eq:increment-mean> and
  <eqref|eq:increment-correlation> are clearly the mean value and the
  correlation functional of the field <math|A<rsub|<math-bf|r>>*\<xi\><around|(|<math-bf|x>|)>>;
  alternatively, they are also called the mean value of the increment of the
  field <math|\<xi\><around|(|<math-bf|x>|)>> and the structure function of
  the field <math|\<xi\><around|(|<math-bf|x>|)>>, respectively. We also note
  that in the case of a real field <math|A<rsub|<math-bf|r>>*\<xi\><around|(|<math-bf|x>|)>>,
  using the identity

  <\equation>
    <label|eq:structure-function-identity><around|(|a-b|)>*<around|(|c-d|)>=<frac|1|2>*<around|[|<around|(|a-d|)><rsup|2>+<around|(|b-c|)><rsup|2>-<around|(|a-c|)><rsup|2>-<around|(|b-d|)><rsup|2>|]>
  </equation>

  we can always express <math|D<around|(|<math-bf|x>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>>
  in terms of the simpler function of one variable

  <\equation>
    <label|eq:simple-structure-function>D<around|(|<math-bf|r>|)>=M*<around|\||A<rsub|<math-bf|r>>*\<xi\><around|(|<math-bf|x>|)>|\|><rsup|2>=D<around|(|<with|math-font-family|bf|0>;<math-bf|r>,<math-bf|r>|)>
  </equation>

  also called the structure function of the field
  <math|\<xi\><around|(|<math-bf|x>|)>>; it is even sufficient for the field
  <math|A<rsub|<math-bf|r>>*\<xi\><around|(|<math-bf|x>|)>> to be real only
  in the wide sense (see Remark<nbsp><reference|rem:real-locally-homogeneous>
  to Theorem<nbsp><reference|thm:locally-homogeneous-representation>).

  The definition of an ordinary locally homogeneous field was first given in
  the work of A.N. Kolmogorov <cite|Kolmogorov1941b>, devoted to a study of
  the local properties of developed turbulence; since that time such fields
  are continually used in the statistical theory of turbulence (see e.g.
  <cite|Kolmogorov1941a|Batchelor1947|Obukhov1951>). However, such fields
  have not been considered so far in the mathematical literature, despite the
  fact that the corresponding concept for the case of one variable (namely,
  the concept of a random process with stationary increments) had already
  been studied in 1940 in the work of A.N. Kolmogorov <cite|Kolmogorov1940>
  (also <cite|Cramer1947|Doob1956|Yaglom1952>).

  <\theorem>
    <label|thm:locally-homogeneous-representation>Given any generalized
    locally homogeneous random field <math|\<xi\><around|(|\<varphi\>|)>> in
    <math|R<rsub|n>>, the mean value <math|m<around|(|\<varphi\>|)>> and
    correlation functional <math|B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>>
    can be represented in the form

    <\equation>
      <label|eq:locally-homogeneous-mean>m<around|(|\<varphi\>|)>=<math-bf|m>\<cdot\>\<nabla\>*<wide|\<varphi\>|~><around|(|<with|math-font-family|bf|0>|)>
    </equation>

    where <math|<math-bf|m>=<around|(|m<rsub|1>,\<ldots\>,m<rsub|n>|)>> is a
    constant vector, <math|\<nabla\>> is the gradient operator,

    <\equation>
      <label|eq:locally-homogeneous-correlation>B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>=<big|int><rsub|P<rsub|n><rsup|->><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em>F*<around|(|d*\<b-lambda\>|)>+\<cal-A\>*\<nabla\>*<wide|\<varphi\>|~><rsub|1><around|(|<with|math-font-family|bf|0>|)>\<cdot\><wide|\<nabla\>*<wide|\<varphi\>|~><rsub|2><around|(|<with|math-font-family|bf|0>|)>|\<bar\>>
    </equation>

    <math|P<rsub|n><rsup|->> is the space <math|P<rsub|n>> of vectors
    <math|\<b-lambda\>> minus the \Pzero point\Q
    <math|<with|math-font-family|bf|0>>, <math|<wide|\<varphi\>|~><around|(|\<b-lambda\>|)>>
    is the Fourier transform of the function
    <math|\<varphi\><around|(|<math-bf|x>|)>>, and finally <math|\<cal-A\>>
    is a non-negative Hermitean matrix, <math|F<around|(|S|)>> is a measure
    on the space <math|P<rsub|n><rsup|->> such that

    <\equation>
      <label|eq:locally-homogeneous-measure-condition><big|int><rsub|P<rsub|n><rsup|->><frac|F*<around|(|d*\<b-lambda\>|)>|<around|(|1+\<lambda\><rsup|2>|)><rsup|p+1>>\<less\>\<infty\>
    </equation>

    for some non-negative <math|p>.

    Conversely, every linear functional of the form
    <eqref|eq:locally-homogeneous-mean> is the mean value of some generalized
    locally homogeneous random field, and every bilinear functional of the
    form <eqref|eq:locally-homogeneous-correlation> is the correlation
    functional of some such field.
  </theorem>

  We shall call the measure <math|F<around|(|S|)>> the
  <with|font-shape|italic|spectral measure> of the locally homogeneous field
  <math|\<xi\><around|(|\<varphi\>|)>>. In general this measure will be
  infinite. However, for all <math|F>-measurable interior sets of
  <math|P<rsub|n><rsup|->> (i.e., for all bounded <math|F>-measurable sets
  <math|S> which are a finite distance from the origin of coordinates
  <math|<with|math-font-family|bf|0>>) the values of <math|F<around|(|S|)>>
  will always be finite; hereafter by sets <math|S> of
  <math|P<rsub|n><rsup|->> we shall always understand only such sets.

  <\proof>
    First of all we note that the usual proof that every linear functional
    <math|m<around|(|\<varphi\>|)>> on the space <math|D<around|(|T|)>> of
    infinitely differentiable functions on a finite <math|n>-dimensional
    interval <math|T> can be represented in the form
    <eqref|eq:linear-functional-representation> is completely applicable to
    functionals on the subspace <math|D<rsub|1><around|(|T|)>> of infinitely
    differentiable functions on the same interval which satisfy the condition
    <eqref|eq:zero-mean-condition>. But in this case it follows from
    <eqref|eq:homogeneous-mean> that the functional
    <math|m<around|(|\<varphi\>|)>> can be represented in the same way for
    all <math|\<varphi\>\<in\>D<rsub|1>>, where here the function
    <math|g<around|(|<math-bf|x>|)>> must satisfy the condition

    <\equation>
      <label|eq:homogeneity-condition-d1-2><big|int><rsub|R<rsub|n>><around|[|g*<around|(|<math-bf|x>+<math-bf|y>|)>-g<around|(|<math-bf|x>|)>|]>*<frac|\<partial\><rsup|N>*\<varphi\><around|(|<math-bf|x>|)>|\<partial\>*x<rsub|1><rsup|k<rsub|1>>*\<cdots\>*\<partial\>*x<rsub|n><rsup|k<rsub|n>>>*<space|0.17em>d<math-bf|x>=0
    </equation>

    for any <math|<math-bf|y>\<in\>R<rsub|n>> and
    <math|\<varphi\>\<in\>D<rsub|1>>. The last equation shows that
    <math|g*<around|(|<math-bf|x>+<math-bf|y>|)>-g<around|(|<math-bf|x>|)>>
    is a polynomial in <math|x<rsub|1>,\<cdots\>,x<rsub|n>> (with
    coefficients which can depend on <math|y<rsub|1>,\<cdots\>,y<rsub|n>>) of
    degree no higher than <math|k<rsub|j>> in <math|x<rsub|j>>,
    <math|j=1,\<cdots\>,n>. Therefore <math|g<around|(|<math-bf|x>|)>> is a
    polynomial in <math|x<rsub|1>,\<cdots\>,x<rsub|n>> whose degree with
    respect to <math|x<rsub|j>> does not exceed <math|k<rsub|j>+1>, and after
    some partial differentiations we obtain from
    <eqref|eq:linear-functional-representation> the formula

    <\equation>
      <label|eq:locally-homogeneous-mean-form-2>m<around|(|\<varphi\>|)>=<big|sum><rsub|j=1><rsup|n>m<rsub|j>*<big|int><rsub|R<rsub|n>>x<rsub|j>*\<varphi\><around|(|<math-bf|x>|)>*<space|0.17em>d<math-bf|x>
    </equation>

    which is equivalent to <eqref|eq:locally-homogeneous-mean>.

    To prove that every linear functional of the form
    <eqref|eq:locally-homogeneous-mean> is the mean value of some generalized
    locally homogeneous field, it is sufficient to consider the field
    <math|\<xi\><around|(|\<varphi\>|)>=<math-bf|m>\<cdot\>\<nabla\>*<wide|\<varphi\>|~><around|(|<with|math-font-family|bf|0>|)>>
    which is obviously locally homogeneous.

    We now turn to the proof of equation <eqref|eq:locally-homogeneous-correlation>.
    For this we use the fact that if <math|\<xi\><around|(|\<varphi\>|)>> is
    a locally homogeneous random field in <math|R<rsub|n>> and
    <math|<math-bf|r>> is a fixed vector, then the linear functional

    <\equation>
      <label|eq:increment-field-functional-2>\<xi\><rsub|<math-bf|r>><around|(|\<varphi\>|)>=\<xi\>*<around|(|\<varphi\>-\<tau\><rsub|<math-bf|r>>*\<varphi\>|)>,<space|1em>\<varphi\>\<in\>D,<space|0.27em>\<varphi\>-\<tau\><rsub|<math-bf|r>>*\<varphi\>\<in\>D<rsub|1>
    </equation>

    will be a homogeneous random field in <math|R<rsub|n>>, depending on the
    vector parameter <math|<math-bf|r>>, where the <math|N> random fields
    <math|<around|{|\<xi\><rsub|<math-bf|r><rsub|1>><around|(|\<varphi\>|)>,\<cdots\>,\<xi\><rsub|<math-bf|r><rsub|N>><around|(|\<varphi\>|)>|}>>
    will constitute an <math|N>-dimensional homogeneous random field for any
    <math|<math-bf|r><rsub|1>,\<cdots\>,<math-bf|r><rsub|N>\<in\>R<rsub|n>>.
    Therefore, by Theorem<nbsp><reference|thm:multidimensional-homogeneous>

    <\equation>
      <label|eq:increment-correlation-2>M*\<xi\><rsub|<math-bf|r><rsub|1>><around|(|\<varphi\><rsub|1>|)><wide|\<xi\><rsub|<math-bf|r><rsub|2>><around|(|\<varphi\><rsub|2>|)>|\<bar\>>=<big|int><rsub|P<rsub|n>><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>
    </equation>

    where <math|F<around|(|S;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>> is a
    complex function of the set <math|S> of the space <math|P<rsub|n>>, a
    function which is slowly growing in modulus, depends on the vectors
    <math|<math-bf|r><rsub|1>,<math-bf|r><rsub|2>>, and is such that the
    inequality

    <\equation>
      <label|eq:increment-positivity-2><big|sum><rsub|k,l=1><rsup|N>F<around|(|S;<math-bf|r><rsub|k>,<math-bf|r><rsub|l>|)>*\<alpha\><rsub|k>*<wide|\<alpha\>|\<bar\>><rsub|l>\<ge\>0
    </equation>

    is valid for any choice of <math|S>, the positive integer <math|N>, the
    vectors <math|<math-bf|r><rsub|1>,\<cdots\>,<math-bf|r><rsub|N>> and the
    complex numbers <math|\<alpha\><rsub|1>,\<cdots\>,\<alpha\><rsub|N>> (so
    that in particular <math|F<around|(|S;<math-bf|r>,<math-bf|r>|)>> is
    always a non-negative measure).

    We observe now that, because of the linearity of
    <math|\<xi\><rsub|<math-bf|r>><around|(|\<varphi\>|)>> and the obvious
    equality <math|\<tau\><rsub|<math-bf|r><rsub|1><rprime|'>>*\<tau\><rsub|<math-bf|r><rsub|1><rprime|''>>=\<tau\><rsub|<math-bf|r><rsub|1><rprime|'>+<math-bf|r><rsub|1><rprime|''>>>,
    we have

    <\equation>
      <label|eq:increment-additivity-2>\<xi\><rsub|<math-bf|r><rsub|1><rprime|'>+<math-bf|r><rsub|1><rprime|''>><around|(|\<varphi\>|)>=\<xi\><rsub|<math-bf|r><rsub|1><rprime|'>><around|(|\<varphi\>|)>+\<xi\><rsub|<math-bf|r><rsub|1><rprime|'>>*<around|(|\<tau\><rsub|<math-bf|r><rsub|1><rprime|''>>*\<varphi\>|)>=\<xi\><rsub|<math-bf|r><rsub|1><rprime|'>><around|(|\<varphi\>|)>+\<xi\><rsub|<math-bf|r><rsub|1><rprime|''>>*<around|(|\<tau\><rsub|<math-bf|r><rsub|1><rprime|'>>*\<varphi\>|)>
    </equation>

    Bearing in mind that the Fourier transforms of the functions
    <math|\<varphi\>> and <math|\<tau\><rsub|<math-bf|r>>*\<varphi\>> are
    connected by the relation <math|<wide|\<tau\><rsub|<math-bf|r>>*\<varphi\>|~><around|(|\<b-lambda\>|)>=e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r>>*<wide|\<varphi\>|~><around|(|\<b-lambda\>|)>>,
    we immediately obtain from <eqref|eq:increment-additivity-2> and
    <eqref|eq:increment-correlation-2>

    <\equation>
      <label|eq:increment-correlation-relation-2><big|int><rsub|P<rsub|n>><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1><rprime|'>,<math-bf|r><rsub|2>|)>=<big|int><rsub|P<rsub|n>><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1><rprime|'>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1><rprime|''>,<math-bf|r><rsub|2>|)>
    </equation>

    Since here <math|<wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)>>
    and <math|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>> are
    Fourier transforms of two arbitrary functions of <math|D>, it follows
    from the equality of the middle and right hand terms of
    <eqref|eq:increment-correlation-relation-2> that

    <\equation>
      <label|eq:increment-measure-relation-3><big|int><rsub|S><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1><rprime|'>,<math-bf|r><rsub|2>|)>=<big|int><rsub|S><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1><rprime|'>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1><rprime|''>,<math-bf|r><rsub|2>|)>
    </equation>

    for all <math|S> for which <math|F<around|(|S;<math-bf|r><rsub|1><rprime|'>+<math-bf|r><rsub|1><rprime|''>,<math-bf|r><rsub|2>|)>>
    is defined.

    Now applying equation <eqref|eq:increment-additivity-2> to the field
    <math|\<xi\><rsub|<math-bf|r><rsub|2>><around|(|\<varphi\><rsub|2>|)>>,
    we obtain similarly

    <\equation>
      <label|eq:increment-measure-relation-4><big|int><rsub|S><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>=<big|int><rsub|S><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1><rprime|'>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>*<space|0.17em>F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1><rprime|''>,<math-bf|r><rsub|2>|)>
    </equation>

    By now it is not hard to obtain equation
    <eqref|eq:locally-homogeneous-correlation>. Let <math|S> be a set of
    <math|P<rsub|n><rsup|->> and let

    <\equation>
      <label|eq:spectral-measure-definition-2>F<around|(|S|)>=<big|int><rsub|S><frac|F<around|(|d*\<b-lambda\>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>|<around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>>
    </equation>

    According to <eqref|eq:increment-measure-relation-4>, the function
    <math|F<around|(|S|)>> does not depend on the choice of the vectors
    <math|<math-bf|r><rsub|1>,<math-bf|r><rsub|2>>, and consequently can be
    defined for any set <math|S> of <math|P<rsub|n><rsup|->> (since <math|S>
    can always be decomposed into parts, for each of which the product
    <math|<around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>>
    does not vanish for any choice of <math|<math-bf|r><rsub|1>,<math-bf|r><rsub|2>>).
    It follows from the non-negativity of
    <math|F<around|(|d*\<b-lambda\>;<math-bf|r>,<math-bf|r>|)>> that the
    function <math|F<around|(|S|)>> is non-negative; as the set <math|S>
    approaches infinity unboundedly or the point
    <math|<with|math-font-family|bf|0>>, the value of <math|F<around|(|S|)>>
    will approach infinity, but only in such a way that the inequality
    <eqref|eq:locally-homogeneous-measure-condition> holds. Thus equation
    <eqref|eq:increment-correlation-2> can be rewritten in the form

    <\equation>
      <label|eq:increment-correlation-final-2>M*\<xi\><rsub|<math-bf|r><rsub|1>><around|(|\<varphi\><rsub|1>|)><wide|\<xi\><rsub|<math-bf|r><rsub|2>><around|(|\<varphi\><rsub|2>|)>|\<bar\>>=<big|int><rsub|P<rsub|n><rsup|->><wide|\<varphi\>|~><rsub|1><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em><around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>*<space|0.17em>F*<around|(|d*\<b-lambda\>|)>+\<cal-A\><math-bf|r><rsub|1>\<cdot\><math-bf|r><rsub|2>
    </equation>

    where <math|F<around|(|S|)>> is a measure in <math|P<rsub|n><rsup|->>
    which meets the conditions stated in the formulation of
    Theorem<nbsp><reference|thm:locally-homogeneous-representation>, and
    <math|\<cal-A\>> is a numerical function of the vectors
    <math|<math-bf|r><rsub|1>> and <math|<math-bf|r><rsub|2>>.

    Let us further specify the form of this last function. It easily follows
    from the equality of the first and middle terms of
    <eqref|eq:increment-correlation-relation-2> that the function
    <math|\<cal-A\><around|(|<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>>
    depends linearly on <math|<math-bf|r><rsub|1>>; in just the same way it
    is shown that it depends linearly on <math|<math-bf|r><rsub|2>>. Thus

    <\equation>
      <label|eq:linear-term-2>\<cal-A\><around|(|<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>=\<cal-A\><math-bf|r><rsub|1>\<cdot\><math-bf|r><rsub|2>
    </equation>

    where as a consequence of inequality <eqref|eq:increment-positivity-2>
    the matrix <math|\<cal-A\>> must be Hermitean non-negative.

    If now we write

    <\equation>
      <label|eq:difference-definition-2>\<varphi\>-\<tau\><rsub|<math-bf|r>>*\<varphi\>=\<varphi\><rsup|<around|(|<math-bf|r>|)>>
    </equation>

    then equations <eqref|eq:increment-correlation-final-2> and
    <eqref|eq:linear-term-2> can be rewritten in the

    <\equation>
      <label|eq:increment-correlation-difference-2>M*\<xi\><around|(|\<varphi\><rsub|1><rsup|<around|(|<math-bf|r><rsub|1>|)>>|)><wide|\<xi\><around|(|\<varphi\><rsub|2><rsup|<around|(|<math-bf|r><rsub|2>|)>>|)>|\<bar\>>=<big|int><rsub|P<rsub|n><rsup|->><wide|\<varphi\>|~><rsub|1><rsup|<around|(|<math-bf|r><rsub|1>|)>><around|(|\<b-lambda\>|)><wide|<wide|\<varphi\>|~><rsub|2><rsup|<around|(|<math-bf|r><rsub|2>|)>><around|(|\<b-lambda\>|)>|\<bar\>><space|0.17em>F*<around|(|d*\<b-lambda\>|)>+\<cal-A\>*\<nabla\>*<wide|\<varphi\>|~><rsub|1><rsup|<around|(|<math-bf|r><rsub|1>|)>><around|(|<with|math-font-family|bf|0>|)>\<cdot\><wide|\<nabla\>*<wide|\<varphi\>|~><rsub|2><rsup|<around|(|<math-bf|r><rsub|2>|)>><around|(|<with|math-font-family|bf|0>|)>|\<bar\>>
    </equation>

    which proves equation <eqref|eq:locally-homogeneous-correlation> for
    functions <math|\<varphi\><rsub|1>> and <math|\<varphi\><rsub|2>> of the
    form <eqref|eq:difference-definition-2>. It follows immediately from this
    that this formula is true also for the case where
    <math|\<varphi\><rsub|1>> and <math|\<varphi\><rsub|2>> are linear
    combinations or limits of linear combinations of functions of the form
    <eqref|eq:difference-definition-2>; but since functions of this form and
    their linear combinations are dense in <math|D<rsub|1>>, this completely
    proves equation <eqref|eq:locally-homogeneous-correlation>.

    The proof that every bilinear functional of the form
    <eqref|eq:locally-homogeneous-correlation> is the correlation functional
    of a locally homogeneous field can be carried out just like the
    corresponding proof for generalized stationary processes (see
    <cite|Ito1954>). Namely, if <math|\<varphi\><rsub|1>,\<cdots\>,\<varphi\><rsub|N>\<in\>D<rsub|1>>
    and <math|B<around|(|\<varphi\><rsub|k>,\<varphi\><rsub|l>|)>> is given
    by equation <eqref|eq:locally-homogeneous-correlation>, then

    <\equation>
      <label|eq:positive-definiteness-2><big|sum><rsub|k,l=1><rsup|N>B<around|(|\<varphi\><rsub|k>,\<varphi\><rsub|l>|)>*\<alpha\><rsub|k>*<wide|\<alpha\>|\<bar\>><rsub|l>\<ge\>0
    </equation>

    for any complex numbers <math|\<alpha\><rsub|1>,\<cdots\>,\<alpha\><rsub|N>>;
    therefore we can define a set of multidimensional normal distributions
    for the complex random variables <math|\<xi\><around|(|\<varphi\>|)>>,
    <math|\<varphi\>\<in\>D<rsub|1>>, such that
    <math|M*\<xi\><around|(|\<varphi\><rsub|1>|)><wide|\<xi\><around|(|\<varphi\><rsub|2>|)>|\<bar\>>=B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>>
    and, for example, <math|M*\<xi\><around|(|\<varphi\>|)>=0>. Moreover,
    using the bilinearity of <math|B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>>
    it can immediately be verified that <math|M*<around|\||c*\<xi\><around|(|\<varphi\>|)>-\<xi\>*<around|(|c*\<varphi\>|)>|\|><rsup|2>=0>
    for any <math|\<varphi\>\<in\>D<rsub|1>> and any complex number <math|c>,
    and that <math|M*<around|\||\<xi\>*<around|(|\<varphi\><rsub|1>+\<varphi\><rsub|2>|)>-\<xi\><around|(|\<varphi\><rsub|1>|)>-\<xi\><around|(|\<varphi\><rsub|2>|)>|\|><rsup|2>=0>
    for any <math|\<varphi\><rsub|1>,\<varphi\><rsub|2>\<in\>D<rsub|1>>, and
    it can also be proved that the continuity condition
    <eqref|eq:continuity-generalized> holds. Consequently,
    <math|\<xi\><around|(|\<varphi\>|)>> is a generalized locally homogeneous
    field with correlation functional <eqref|eq:locally-homogeneous-correlation>,
    QED.

    Another proof of the converse of Theorem<nbsp><reference|thm:locally-homogeneous-representation>
    can be given by using Theorem<nbsp><reference|thm:locally-homogeneous-spectral>
    on the spectral decomposition of the locally homogeneous field itself.
  </proof>

  <\theorem>
    <label|thm:locally-homogeneous-spectral>Any generalized locally
    homogeneous random field <math|\<xi\><around|(|\<varphi\>|)>> in
    <math|R<rsub|n>> admits a spectral representation of the form

    <\equation>
      <label|eq:spectral-representation>\<xi\><around|(|\<varphi\>|)>=<big|int><rsub|P<rsub|n><rsup|->><wide|\<varphi\>|~><around|(|\<b-lambda\>|)>*<space|0.17em>Z*<around|(|d*\<b-lambda\>|)>+<math-bf|m>\<cdot\>\<nabla\>*<wide|\<varphi\>|~><around|(|<with|math-font-family|bf|0>|)>
    </equation>

    where <math|Z<around|(|S|)>> is a random measure with orthogonal
    increments such that <math|M<around|\||Z<around|(|S|)>|\|><rsup|2>=F<around|(|S|)>>,
    and <math|<math-bf|m>> is the constant vector from
    <eqref|eq:locally-homogeneous-mean>.
  </theorem>

  <\proof>
    The proof follows from the standard construction of the stochastic
    integral with respect to the spectral measure, using the representation
    <eqref|eq:locally-homogeneous-correlation> and the theory of random
    measures with orthogonal increments.
  </proof>

  <\remark>
    <label|rem:real-locally-homogeneous>In the case of real locally
    homogeneous random fields, it follows at once from the conditions
    <math|m<around|(|<wide|\<varphi\>|\<bar\>>|)>=<wide|m<around|(|\<varphi\>|)>|\<bar\>>>
    and <math|B<around|(|<wide|\<varphi\>|\<bar\>><rsub|1>,<wide|\<varphi\>|\<bar\>><rsub|2>|)>=<wide|B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>|\<bar\>>>
    that the vector <math|<math-bf|m>> must be real, the measure
    <math|F<around|(|S|)>> such that <math|F*<around|(|-S|)>=F<around|(|S|)>>
    and the matrix <math|\<cal-A\>> real, symmetric and non-negative. The
    stated conditions regarding <math|<math-bf|m>>, <math|F<around|(|S|)>>
    and <math|\<cal-A\>> are clearly necessary and sufficient for the
    equalities <math|m<around|(|<wide|\<varphi\>|\<bar\>>|)>=<wide|m<around|(|\<varphi\>|)>|\<bar\>>>
    and <math|B<around|(|<wide|\<varphi\>|\<bar\>><rsub|1>,<wide|\<varphi\>|\<bar\>><rsub|2>|)>=<wide|B<around|(|\<varphi\><rsub|1>,\<varphi\><rsub|2>|)>|\<bar\>>>
    to be true; in this case it is natural to call the field itself real in
    the wide sense.
  </remark>

  <\remark>
    <label|rem:matrix-vector-relation>Obviously the matrix <math|\<cal-A\>>
    is related to the vector <math|<math-bf|m>> by the condition that the
    matrix <math|\<cal-A\>-<math-bf|mm><rsup|\<ast\>>> be non-negative; for a
    given <math|<math-bf|m>> the measure <math|F> can be completely
    arbitrary.
  </remark>

  <\remark>
    <label|rem:ordinary-locally-homogeneous>In the case of an ordinary
    (non-generalized) locally homogeneous field
    <math|\<xi\><around|(|<math-bf|x>|)>>, the quantities
    <math|m<around|(|\<varphi\>|)>> and <math|B<around|(|\<varphi\><rsub|1><rsup|<around|(|<math-bf|r><rsub|1>|)>>,\<varphi\><rsub|2><rsup|<around|(|<math-bf|r><rsub|2>|)>>|)>>
    (see <eqref|eq:difference-definition-2>) can clearly be represented in
    the following way in terms of the mean value
    <math|m<around|(|<math-bf|r>|)>> of the increment of the field
    <math|\<xi\><around|(|<math-bf|x>|)>> and the corresponding structure
    function <math|D<around|(|<math-bf|x>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>>:

    <\equation>
      <label|eq:ordinary-locally-homogeneous-mean>m<around|(|\<varphi\>|)>=<big|int><rsub|R<rsub|n>>m<around|(|<math-bf|x>|)>*\<varphi\><around|(|<math-bf|x>|)>*<space|0.17em>d<math-bf|x>
    </equation>

    <\equation>
      <label|eq:ordinary-locally-homogeneous-correlation>B<around|(|\<varphi\><rsub|1><rsup|<around|(|<math-bf|r><rsub|1>|)>>,\<varphi\><rsub|2><rsup|<around|(|<math-bf|r><rsub|2>|)>>|)>=<big|int><rsub|R<rsub|n>><big|int><rsub|R<rsub|n>>D<around|(|<math-bf|x><rsub|1>-<math-bf|x><rsub|2>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>*\<varphi\><rsub|1><around|(|<math-bf|x><rsub|1>|)><wide|\<varphi\><rsub|2><around|(|<math-bf|x><rsub|2>|)>|\<bar\>><space|0.17em>d<math-bf|x><rsub|1>d<math-bf|x><rsub|2>
    </equation>

    Here equation <eqref|eq:locally-homogeneous-mean> means that

    <\equation>
      <label|eq:linear-mean-increment>m<around|(|<math-bf|r>|)>=<math-bf|m>\<cdot\><math-bf|r>
    </equation>

    and <eqref|eq:locally-homogeneous-correlation>, <eqref|eq:linear-term-2>
    that

    <\equation>
      <label|eq:structure-function-spectral>D<around|(|<math-bf|x>;<math-bf|r><rsub|1>,<math-bf|r><rsub|2>|)>=<big|int><rsub|P<rsub|n><rsup|->>e<rsup|i*\<b-lambda\>\<cdot\><math-bf|x>>*<around|(|1-e<rsup|-i*\<b-lambda\>\<cdot\><math-bf|r><rsub|1>>|)>*<around|(|1-e<rsup|i*\<b-lambda\>\<cdot\><math-bf|r><rsub|2>>|)>*<space|0.17em>F*<around|(|d*\<b-lambda\>|)>+\<cal-A\><math-bf|r><rsub|1>\<cdot\><math-bf|r><rsub|2>
    </equation>

    and in particular

    <\equation>
      <label|eq:simple-structure-function-spectral>D<around|(|<math-bf|r>|)>=D<around|(|<with|math-font-family|bf|0>;<math-bf|r>,<math-bf|r>|)>=2*<big|int><rsub|P<rsub|n><rsup|->><around|(|1-cos
      <around|(|\<b-lambda\>\<cdot\><math-bf|r>|)>|)>*<space|0.17em>F*<around|(|d*\<b-lambda\>|)>+\<cal-A\><math-bf|r>\<cdot\><math-bf|r>
    </equation>

    (in the real case the function <eqref|eq:structure-function-spectral> can
    always be expressed in terms of <eqref|eq:simple-structure-function-spectral>
    by using the identity <eqref|eq:structure-function-identity>). It is not
    hard to show that for equations <eqref|eq:linear-mean-increment> and
    <eqref|eq:simple-structure-function-spectral> to make sense, the
    inequality <eqref|eq:locally-homogeneous-measure-condition> must hold for
    <math|p=0>. In fact, it follows from <eqref|eq:simple-structure-function-spectral>
    that

    <\equation>
      <label|eq:structure-function-sphere><big|int><rsub|<around|\||<math-bf|r>|\|>=1>D<around|(|<math-bf|r>|)>*<space|0.17em>d*\<sigma\><around|(|<math-bf|r>|)>=<big|int><rsub|P<rsub|n><rsup|->>\<Phi\><around|(|\<lambda\>|)><frac|\<lambda\><rsup|2>*<space|0.17em>F*<around|(|d*\<b-lambda\>|)>|1+\<lambda\><rsup|2>>+A<rsub|0>
    </equation>

    (<math|d*\<sigma\><around|(|<math-bf|r>|)>> is an element of area of the
    sphere <math|<around|\||<math-bf|r>|\|>=1>), where
    <math|\<Phi\><around|(|\<lambda\>|)>> is an everywhere positive function,
    continuous on the half-line <math|0\<le\>\<lambda\>\<less\>\<infty\>>,
    and approaching a positive limit as <math|\<lambda\>\<to\>\<infty\>>
    (this is the integral over the <math|<around|(|n-1|)>>-dimensional unit
    sphere of the function <math|2*<around|(|1-cos
    <around|(|\<b-lambda\>\<cdot\><math-bf|r>|)>|)>*<around|(|1+\<lambda\><rsup|2>|)>/\<lambda\><rsup|2>>);
    <math|A<rsub|0>> is a non-negative constant (the integral of
    <math|<math-bf|r>\<cdot\>\<cal-A\><math-bf|r>> over the same sphere).
    From this it follows at once that <math|\<Phi\><around|(|\<lambda\>|)>\<gtr\>b\<gtr\>0>
    (where <math|b> is some constant), which means that

    <\equation>
      <label|eq:finite-structure-condition><big|int><rsub|P<rsub|n><rsup|->><frac|\<lambda\><rsup|2>*<space|0.17em>F*<around|(|d*\<b-lambda\>|)>|1+\<lambda\><rsup|2>>\<less\>\<infty\>
    </equation>

    i.e., we can really put <math|p=0> in
    <eqref|eq:locally-homogeneous-measure-condition>. A little later (see
    Remark<nbsp><reference|rem:ordinary-from-generalized> to
    Theorem<nbsp><reference|thm:locally-homogeneous-spectral>) we shall show
    that conversely, if we can put <math|p=0> in
    <eqref|eq:locally-homogeneous-measure-condition>, then
    <math|\<xi\><around|(|\<varphi\>|)>> must be representable in the form
    <eqref|eq:field-representation>, where
    <math|\<xi\><around|(|<math-bf|x>|)>> (here instead of
    <math|\<xi\><around|(|<math-bf|x>|)>> we can clearly write
    <math|A<rsub|<math-bf|r>>*\<xi\><around|(|<math-bf|x>|)>>, where
    <math|<math-bf|r>> is arbitrary) is an ordinary (non-generalized) locally
    homogeneous field, with the structure function
    <eqref|eq:simple-structure-function-spectral>.
  </remark>

  <\remark>
    <label|rem:ordinary-from-generalized>If the spectral measure
    <math|F<around|(|S|)>> in <eqref|eq:locally-homogeneous-correlation>
    satisfies condition <eqref|eq:locally-homogeneous-measure-condition> with
    <math|p=0>, then the generalized locally homogeneous field
    <math|\<xi\><around|(|\<varphi\>|)>> can be represented in the form
    <eqref|eq:field-representation>, where
    <math|\<xi\><around|(|<math-bf|x>|)>> is an ordinary (non-generalized)
    locally homogeneous field. This follows from the fact that the integral
    <eqref|eq:spectral-representation> converges for ordinary test functions
    when <math|p=0>, allowing pointwise evaluation of the field.
  </remark>

  <\thebibliography|99>
    <bibitem|Levy1948>P. Lévy, <with|font-shape|italic|Processus
    Stochastiques et Mouvement Brownien>, Paris, 1948.

    <bibitem|Doob1956>J. Doob, <with|font-shape|italic|Stochastic Processes>,
    Moscow, 1956 (Translated to Russian).

    <bibitem|Blanc-Lapierre1953>A. Blanc-Lapierre and R. Fortet,
    <with|font-shape|italic|Théorie des Fonctions Aléatoires>, Paris, 1953.

    <bibitem|Bartlett1955>M.S. Bartlett, <with|font-shape|italic|An
    Introduction to Stochastic Processes>, Cambridge, 1955.

    <bibitem|Yaglom1952>A.M. Yaglom, <with|font-shape|italic|An introduction
    to the theory of stationary random functions>, Usp. Mat. Nauk, Vol. 7,
    No. 5(51), 1952, pp. 3-168 (In Russian).

    <bibitem|Ito1954>I. Ito, <with|font-shape|italic|Stationary random
    distributions>, Mem. College Sci., Univ. Kyoto, Ser. A, 28, 1954, pp.
    209-223.

    <bibitem|Gelfand1955>I.M. Gel'fand, <with|font-shape|italic|Generalized
    random processes>, Dok. Akad. Nauk SSSR, 100, 1955, pp. 853-856.

    <bibitem|Schwartz1950>L. Schwartz, <with|font-shape|italic|Théorie des
    Distributions>, Vols. I, II, Paris, 1950-1.

    <bibitem|Taylor1935>G.I. Taylor, <with|font-shape|italic|Statistical
    theory of turbulence>, Proc. Roy. Soc. A, 151, 1935, pp. 421-478.

    <bibitem|VonKarman1941>Th. von Kármán and L. Howarth,
    <with|font-shape|italic|On the statistical theory of isotropic
    turbulence>, Proc. Roy. Soc. A, 164, 1941, pp. 192-215.

    <bibitem|Obukhov1941>A.M. Obukhov, <with|font-shape|italic|On the
    distribution of energy in the spectrum of turbulent flow>, Izv. Akad.
    Nauk SSSR, Ser. Geograf. Geofiz., Nos. 4-5, 1941, pp. 453-466.

    <bibitem|Kolmogorov1941a>A.N. Kolmogorov, <with|font-shape|italic|The
    local structure of turbulence in an incompressible fluid at very large
    Reynolds numbers>, Dok. Akad. Nauk SSSR, 30, 1941, pp. 229-303.

    <bibitem|Kolmogorov1941b>A.N. Kolmogorov, <with|font-shape|italic|The
    distribution of energy in locally isotropic turbulence>, Dok. Akad. Nauk
    SSSR, 32, 1941, pp. 19-21.

    <bibitem|Batchelor1947>G.K. Batchelor,
    <with|font-shape|italic|Kolmogorov's theory of locally isotropic
    turbulence>, Proc. Camb. Phil. Soc., 43, 1947, pp. 553-559.

    <bibitem|Obukhov1951>A.M. Obukhov, <with|font-shape|italic|The
    statistical description of continuous fields>, Trudy Geofiz. Inst. Akad.
    Nauk SSSR, No. 24(151), 1954, pp. 3-42 (In Russian).

    <bibitem|Ito1956>I. Ito, <with|font-shape|italic|Isotropic random
    current>, Proceedings Third Berkeley Symposium on Math. Stat. and Prob.,
    Berkeley and Los Angeles, Vol. II, 1956, pp. 125-132.

    <bibitem|Ryzhik1951>I.M. Ryzhik and I.S. Gradshtein,
    <with|font-shape|italic|Tables of Integrals, Sums, Series, and Products>,
    Moscow, 1951 (In Russian).

    <bibitem|Kolmogorov1940>A.N. Kolmogorov, <with|font-shape|italic|Curves
    in Hilbert space, invariant under a one-parameter group of translations>,
    Dok. Akad. Nauk SSSR, 26, 1940, pp. 6-9.

    <bibitem|Cramer1947>H. Cramér, <with|font-shape|italic|Random Variables
    and Probability Distributions>, Moscow, 1947 (Translated to Russian).
  </thebibliography>
</body>

<\initial>
  <\collection>
    <associate|global-title|Some Classes of Random Fields in n-Dimensional
    Space, Related to Stationary Random Processes>
    <associate|magnification|1.2>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-2|<tuple|2|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-3|<tuple|3|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|auto-4|<tuple|8|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Bartlett1955|<tuple|Bartlett1955|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Batchelor1947|<tuple|Batchelor1947|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Blanc-Lapierre1953|<tuple|Blanc-Lapierre1953|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Cramer1947|<tuple|Cramer1947|15|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Doob1956|<tuple|Doob1956|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Gelfand1955|<tuple|Gelfand1955|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Ito1954|<tuple|Ito1954|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Ito1956|<tuple|Ito1956|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Kolmogorov1940|<tuple|Kolmogorov1940|15|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Kolmogorov1941a|<tuple|Kolmogorov1941a|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Kolmogorov1941b|<tuple|Kolmogorov1941b|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Levy1948|<tuple|Levy1948|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Obukhov1941|<tuple|Obukhov1941|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Obukhov1951|<tuple|Obukhov1951|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Ryzhik1951|<tuple|Ryzhik1951|15|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Schwartz1950|<tuple|Schwartz1950|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Taylor1935|<tuple|Taylor1935|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-VonKarman1941|<tuple|VonKarman1941|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|bib-Yaglom1952|<tuple|Yaglom1952|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:continuity-generalized|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:continuity-ordinary|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:difference-definition|<tuple|28|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:difference-definition-2|<tuple|54|11|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:field-representation|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:finite-structure-condition|<tuple|64|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:fourier-transform|<tuple|13|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:generalized-moments|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:homogeneity-condition-d1|<tuple|16|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:homogeneity-condition-d1-2|<tuple|42|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:homogeneous-correlation|<tuple|8|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:homogeneous-correlation-form|<tuple|12|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:homogeneous-mean|<tuple|7|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:homogeneous-mean-form|<tuple|11|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-additivity|<tuple|21|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-additivity-2|<tuple|47|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-condition|<tuple|34|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-correlation|<tuple|36|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-correlation-2|<tuple|45|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-correlation-difference|<tuple|29|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-correlation-difference-2|<tuple|55|12|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-correlation-final|<tuple|26|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-correlation-final-2|<tuple|52|11|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-correlation-proof|<tuple|19|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-correlation-relation|<tuple|22|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-correlation-relation-2|<tuple|48|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-field|<tuple|33|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-field-functional|<tuple|18|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-field-functional-2|<tuple|44|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-mean|<tuple|35|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-measure-relation|<tuple|23|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-measure-relation-2|<tuple|24|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-measure-relation-3|<tuple|49|11|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-measure-relation-4|<tuple|50|11|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-positivity|<tuple|20|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:increment-positivity-2|<tuple|46|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:linear-functional-representation|<tuple|15|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:linear-mean-increment|<tuple|60|13|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:linear-term|<tuple|27|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:linear-term-2|<tuple|53|11|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:locally-homogeneous-correlation|<tuple|40|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:locally-homogeneous-mean|<tuple|39|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:locally-homogeneous-mean-form|<tuple|17|5|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:locally-homogeneous-mean-form-2|<tuple|43|10|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:locally-homogeneous-measure-condition|<tuple|41|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:measure-condition|<tuple|14|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:multidimensional-correlation|<tuple|31|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:ordinary-homogeneous-correlation|<tuple|10|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:ordinary-homogeneous-mean|<tuple|9|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:ordinary-locally-homogeneous-correlation|<tuple|59|13|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:ordinary-locally-homogeneous-mean|<tuple|58|13|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:ordinary-moments|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:positive-definiteness|<tuple|30|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:positive-definiteness-2|<tuple|56|12|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:shift-operator|<tuple|6|3|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:simple-structure-function|<tuple|38|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:simple-structure-function-spectral|<tuple|62|13|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:spectral-measure-definition|<tuple|25|6|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:spectral-measure-definition-2|<tuple|51|11|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:spectral-representation|<tuple|57|12|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:structure-function-identity|<tuple|37|8|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:structure-function-spectral|<tuple|61|13|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:structure-function-sphere|<tuple|63|13|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|eq:zero-mean-condition|<tuple|32|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|rem:matrix-vector-relation|<tuple|6|13|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|rem:ordinary-from-generalized|<tuple|8|14|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|rem:ordinary-locally-homogeneous|<tuple|7|13|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|rem:real-locally-homogeneous|<tuple|5|13|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|thm:homogeneous-representation|<tuple|1|4|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|thm:locally-homogeneous-representation|<tuple|3|9|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|thm:locally-homogeneous-spectral|<tuple|4|12|../../.TeXmacs/texts/scratch/no_name_47.tm>>
    <associate|thm:multidimensional-homogeneous|<tuple|2|7|../../.TeXmacs/texts/scratch/no_name_47.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Levy1948

      Doob1956

      Blanc-Lapierre1953

      Bartlett1955

      Yaglom1952

      Ito1954

      Gelfand1955

      Schwartz1950

      Taylor1935

      VonKarman1941

      Obukhov1941

      Kolmogorov1941a

      Kolmogorov1941b

      Batchelor1947

      Obukhov1951

      Ito1956

      Schwartz1950

      Gelfand1955

      Ito1954

      Kolmogorov1941b

      Kolmogorov1941a

      Batchelor1947

      Obukhov1951

      Kolmogorov1940

      Cramer1947

      Doob1956

      Yaglom1952

      Ito1954
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Homogeneous
      Random Fields> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Locally
      Homogeneous Random Fields (Fields with Homogeneous Increments)>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>