<TeXmacs|2.1.5>

<style|<tuple|article|framed-theorems|alt-colors>>

<\body>
  <\hide-preamble>
    <new-theorem|algorithm|Algorithm>

    <assign|Prim|<macro|Prim>>

    <assign|Sym|<macro|Sym>>

    <assign|ev|<macro|ev>>

    <assign|Aut|<macro|Aut>>

    <assign|ord|<macro|ord>>

    <assign|Res|<macro|Res>>

    <assign|trdeg|<macro|trdeg>>

    <assign|CA|<macro|\<frak-B\>>>

    <assign|C|<macro|\<bbb-C\>>>

    <assign|Z|<macro|\<bbb-Z\>>>

    <assign|N|<macro|\<bbb-N\>>>

    <assign|R|<macro|\<bbb-R\>>>

    <assign|Q|<macro|\<bbb-Q\>>>
  </hide-preamble>

  <doc-data|<doc-title|The Coefficient Algebra of Exponentials of Rational
  Functions>|<doc-author|<author-data|<author-name|Stephen
  Crowley>|<\author-affiliation>
    <date|>
  </author-affiliation>>>|<doc-date|>>

  <abstract-data|<\abstract>
    Let <math|R> be a rational function with a pole of order <math|m> at
    <math|a> and principal part <math|\<Pi\><around|(|w|)>=<big|sum><rsub|j=1><rsup|m>c<rsub|j>*w<rsup|-j>>,
    <math|w=z-a>. The Laurent coefficients of <math|e<rsup|R>> on a punctured
    disk about <math|a> are governed by the coefficients
    <math|\<Lambda\><rsub|N>> of <math|exp <around|(|\<Pi\>|)>>, which
    satisfy the first-order recurrence <math|N*\<Lambda\><rsub|N>=<big|sum><rsub|j=1><rsup|min
    <around|(|m,N|)>>j*c<rsub|j>*\<Lambda\><rsub|N-j>>. We take this
    recurrence as the primitive object, construct from it a graded
    commutative Hopf algebra <math|<CA><rsub|m>=<C><around|[|c<rsub|1>,\<ldots\>,c<rsub|m>|]>>
    carrying the sequence <math|<around|(|\<Lambda\><rsub|N>|)>>, and prove
    its structure theory: <math|<CA><rsub|m>> is canonically the quotient of
    the Hopf algebra of symmetric functions by the Hopf ideal
    <math|<around|(|p<rsub|m+1>,p<rsub|m+2>,\<ldots\>|)>>, under which
    <math|\<Lambda\><rsub|N>> corresponds to the complete homogeneous
    symmetric function <math|h<rsub|N>>, <math|c<rsub|j>> to
    <math|p<rsub|j>/j>, and the universal recurrence to Newton's identity.
    The sequence <math|<around|(|\<Lambda\><rsub|N>|)>> is a divided-power
    sequence; as functions of <math|c<rsub|1>> the
    <math|N!<space|0.17em>\<Lambda\><rsub|N>> form an Appell sequence; the
    coefficient matrix is an element of the Appell subgroup of the
    exponential Riordan group; <math|N!<space|0.17em>\<Lambda\><rsub|N>>
    enumerates set partitions with block sizes at most <math|m>; the graded
    Hopf automorphism group is the torus <math|<around|(|<C><rsup|\<times\>>|)><rsup|m>>;
    and the Hankel determinants of <math|<around|(|\<Lambda\><rsub|N>|)>>
    are, up to explicit sign, rectangular Schur functions. We then prove that
    the analytic Laurent-coefficient construction is a model of the algebra,
    with quantitative growth bounds; we identify the classical
    specializations exactly (modified Bessel functions for <math|m=1>,
    Hermite-type polynomials for <math|m=2>, Wright generalized Bessel
    functions for single-term principal parts against a linear entire
    exponent) and refrain from claiming reductions that do not exist for
    <math|m\<ge\>3>; we prove holonomy of the full Laurent coefficient
    sequence at every pole, with an explicit recurrence and order bound
    derived from <math|y<rprime|'>=R<rprime|'>*y>; and we prove an initiality
    theorem and a recognition theorem that together constitute the axiomatic
    characterization, with independence of the hypotheses established by
    counterexamples. The final section applies the algebra to the rough
    Heston characteristic function <math|\<varphi\><rsub|M>=exp
    <around*|(|t*<space|0.17em>A<rsub|M><around|(|x|)>/B<rsub|M><around|(|x|)>|)>>,
    <math|x=t<rsup|\<alpha\>>>, produced by the diagonal Pad� pipeline of the
    companion papers: we give the exact local Laurent data of
    <math|\<varphi\><rsub|M>> at the zeros of <math|B<rsub|M>> in the
    coefficient algebra, and prove convergence of Pad� prices to exact prices
    under explicit hypotheses on a fixed contour, with no contour
    deformation through approximant poles. Statements that remain open
    (resurgent/alien-derivative structure, uniform-in-parameter domination,
    exponential-motive positioning) are listed as open problems, not
    theorems.
  </abstract>>

  <section|The universal recurrence><label|sec:recurrence>

  Throughout, <math|m\<ge\>1> is a fixed integer and
  <math|c<rsub|1>,\<ldots\>,c<rsub|m>> are independent commuting
  indeterminates over <math|<C>>. Set

  <\equation*>
    <CA><rsub|m>\<assign\><C><around|[|c<rsub|1>,\<ldots\>,c<rsub|m>|]>,
  </equation*>

  graded by <math|<math-up|wt><around|(|c<rsub|j>|)>=j>, so that
  <math|<CA><rsub|m>=<big|oplus><rsub|N\<ge\>0><around|(|<CA><rsub|m>|)><rsub|N>>
  with <math|<around|(|<CA><rsub|m>|)><rsub|0>=<C>>. All constructions in
  Sections<nbsp><reference|sec:recurrence>\U<reference|sec:axioms> are exact
  identities in <math|<CA><rsub|m>> or in the formal power series ring
  <math|<CA><rsub|m><around|[|<around|[|v|]>|]>>; no analysis enters until
  Section<nbsp><reference|sec:model>.

  <\definition>
    <label|def:E><math|E<around|(|v|)>\<assign\>exp
    <around*|(|<big|sum><rsub|j=1><rsup|m>c<rsub|j>*v<rsup|j>|)>\<in\><CA><rsub|m><around|[|<around|[|v|]>|]>>,
    and <math|\<Lambda\><rsub|N>\<in\><CA><rsub|m>> is defined by
    <math|E<around|(|v|)>=<big|sum><rsub|N\<ge\>0>\<Lambda\><rsub|N>*v<rsup|N>>.
    We set <math|\<Lambda\><rsub|N>\<assign\>0> for <math|N\<less\>0>.
  </definition>

  The exponential is well defined because
  <math|<big|sum><rsub|j>c<rsub|j>*v<rsup|j>> has zero constant term. Under
  the substitution <math|v=w<rsup|-1>>, <math|E> becomes the formal expansion
  of <math|exp <around*|(|<big|sum><rsub|j=1><rsup|m>c<rsub|j>*w<rsup|-j>|)>>,
  the exponential of the principal part of a rational function at a pole of
  order <math|\<le\>m>; the analytic counterpart is
  Theorem<nbsp><reference|thm:analyticmodel>.

  <\lemma>
    [Universal recurrence]<label|lem:recurrence> <math|\<Lambda\><rsub|0>=1>
    and, for all <math|N\<ge\>1>,

    <\equation>
      <label|eq:universal>N*<space|0.17em>\<Lambda\><rsub|N><space|0.27em>=<space|0.27em><big|sum><rsub|j=1><rsup|min
      <around|(|m,N|)>>j*<space|0.17em>c<rsub|j>*<space|0.17em>\<Lambda\><rsub|N-j>.
    </equation>
  </lemma>

  <\proof>
    <math|E> satisfies the linear first-order equation
    <math|E<rprime|'><around|(|v|)>=<around*|(|<big|sum><rsub|j=1><rsup|m>j*c<rsub|j>*v<rsup|j-1>|)>*E<around|(|v|)>>
    in <math|<CA><rsub|m><around|[|<around|[|v|]>|]>>, obtained by formal
    differentiation of the exponential. The coefficient of <math|v<rsup|N-1>>
    on the left is <math|N*\<Lambda\><rsub|N>>; on the right it is
    <math|<big|sum><rsub|j=1><rsup|m>j*c<rsub|j>*\<Lambda\><rsub|N-j>>, in
    which terms with <math|j\<gtr\>N> vanish by the convention
    <math|\<Lambda\><rsub|\<less\>0>=0>. The initial value
    <math|\<Lambda\><rsub|0>=E<around|(|0|)>=1>.
  </proof>

  <\lemma>
    [Partition formula]<label|lem:partition> For all <math|N\<ge\>0>,

    <\equation>
      <label|eq:partition>\<Lambda\><rsub|N><space|0.27em>=<space|0.27em><big|sum><rsub|<stack|<tformat|<table|<row|<cell|k<rsub|1>,\<ldots\>,k<rsub|m>\<ge\>0>>|<row|<cell|<big|sum><rsub|j>j*k<rsub|j>=N>>>>>><space|0.27em><big|prod><rsub|j=1><rsup|m><frac|c<rsub|j><rsup|<space|0.17em>k<rsub|j>>|k<rsub|j>!>.
    </equation>

    In particular <math|\<Lambda\><rsub|N>> is homogeneous of weight
    <math|N>.
  </lemma>

  <\proof>
    <math|E<around|(|v|)>=<big|prod><rsub|j=1><rsup|m>exp
    <around|(|c<rsub|j>*v<rsup|j>|)>=<big|prod><rsub|j=1><rsup|m><big|sum><rsub|k<rsub|j>\<ge\>0><frac|c<rsub|j><rsup|k<rsub|j>>|k<rsub|j>!>*v<rsup|j*k<rsub|j>>>;
    the product of the <math|m> series is computed by collecting the
    coefficient of <math|v<rsup|N>>, which is <eqref|eq:partition>.
    Homogeneity is immediate since the monomial
    <math|<big|prod>c<rsub|j><rsup|k<rsub|j>>> has weight
    <math|<big|sum>j*k<rsub|j>=N>.
  </proof>

  <\proposition>
    [Bell-polynomial form]<label|prop:bell>
    <math|N!<space|0.17em>\<Lambda\><rsub|N>=B<rsub|N>*<around|(|1!<space|0.17em>c<rsub|1>,<space|0.17em>2!<space|0.17em>c<rsub|2>,\<ldots\>,m!<space|0.17em>c<rsub|m>,<space|0.17em>0,\<ldots\>,0|)>>,
    where <math|B<rsub|N>> is the complete Bell polynomial, defined by
    <math|exp <around*|(|<big|sum><rsub|j\<ge\>1>x<rsub|j>*t<rsup|j>/j!|)>=<big|sum><rsub|N\<ge\>0>B<rsub|N>*<around|(|x<rsub|1>,\<ldots\>,x<rsub|N>|)>*<space|0.17em>t<rsup|N>/N!>
    <em|(Comtet <cite-detail|Comtet|�3.3>)>.
  </proposition>

  <\proof>
    Substitute <math|x<rsub|j>=j!<space|0.17em>c<rsub|j>> for <math|j\<le\>m>
    and <math|x<rsub|j>=0> for <math|j\<gtr\>m> in the defining generating
    identity of <math|B<rsub|N>>; the left side becomes
    <math|E<around|(|t|)>>.
  </proof>

  <\lemma>
    [Derivations]<label|lem:derivation> For <math|1\<le\>j\<le\>m> and all
    <math|N>,

    <\equation*>
      <frac|\<partial\>*\<Lambda\><rsub|N>|\<partial\>*c<rsub|j>><space|0.27em>=<space|0.27em>\<Lambda\><rsub|N-j>.
    </equation*>
  </lemma>

  <\proof>
    <math|\<partial\><rsub|c<rsub|j>>*E<around|(|v|)>=v<rsup|j>*E<around|(|v|)>>;
    compare coefficients of <math|v<rsup|N>>.
  </proof>

  <\remark>
    <label|rem:eulerequiv>Lemma<nbsp><reference|lem:recurrence> is exactly
    the Euler homogeneity relation: the grading operator
    <math|\<cal-E\>=<big|sum><rsub|j=1><rsup|m>j*<space|0.17em>c<rsub|j>*<space|0.17em>\<partial\><rsub|c<rsub|j>>>
    satisfies <math|\<cal-E\>*\<Lambda\><rsub|N>=<big|sum><rsub|j>j*c<rsub|j>*\<Lambda\><rsub|N-j>>
    by Lemma<nbsp><reference|lem:derivation>, and
    <math|\<cal-E\>*\<Lambda\><rsub|N>=N*\<Lambda\><rsub|N>> by
    Lemma<nbsp><reference|lem:partition>. Conversely, any sequence of
    weight-homogeneous elements satisfying
    Lemma<nbsp><reference|lem:derivation> with <math|\<Lambda\><rsub|0>=1>
    satisfies <eqref|eq:universal>. The universal recurrence, the lowering
    operators, and the grading are one structure viewed three ways.
  </remark>

  <\theorem>
    [Generation and freeness]<label|thm:generation>
    <math|<C><around|[|\<Lambda\><rsub|1>,\<ldots\>,\<Lambda\><rsub|m>|]>=<CA><rsub|m>>,
    and <math|\<Lambda\><rsub|1>,\<ldots\>,\<Lambda\><rsub|m>> are
    algebraically independent over <math|<C>>. Consequently
    <math|<around|(|\<Lambda\><rsub|N>|)><rsub|N\<ge\>0>\<subset\><C><around|[|\<Lambda\><rsub|1>,\<ldots\>,\<Lambda\><rsub|m>|]>>:
    the entire coefficient sequence lives in the polynomial algebra on its
    first <math|m> terms.
  </theorem>

  <\proof>
    For <math|1\<le\>N\<le\>m>, the multi-index <math|k<rsub|N>=1>,
    <math|k<rsub|j>=0> <math|<around|(|j\<ne\>N|)>> is the unique solution of
    <math|<big|sum>j*k<rsub|j>=N> using the variable <math|c<rsub|N>>; every
    other solution has <math|k<rsub|N>=0> and involves only
    <math|c<rsub|1>,\<ldots\>,c<rsub|N-1>>. Hence
    <math|\<Lambda\><rsub|N>=c<rsub|N>+q<rsub|N><around|(|c<rsub|1>,\<ldots\>,c<rsub|N-1>|)>>
    with <math|q<rsub|N>> polynomial. By induction,
    <math|c<rsub|N>\<in\><C><around|[|\<Lambda\><rsub|1>,\<ldots\>,\<Lambda\><rsub|N>|]>>,
    so <math|<C><around|[|\<Lambda\><rsub|1>,\<ldots\>,\<Lambda\><rsub|m>|]>\<supseteq\><C><around|[|c<rsub|1>,\<ldots\>,c<rsub|m>|]>>;
    the reverse inclusion is trivial. Since
    <math|<trdeg><rsub|<C>><CA><rsub|m>=m> and
    <math|\<Lambda\><rsub|1>,\<ldots\>,\<Lambda\><rsub|m>> generate it, they
    are algebraically independent. For <math|N\<gtr\>m>,
    <math|\<Lambda\><rsub|N>\<in\><CA><rsub|m>=<C><around|[|\<Lambda\><rsub|1>,\<ldots\>,\<Lambda\><rsub|m>|]>>;
    explicitly, iterate <eqref|eq:universal>.
  </proof>

  <section|Hopf structure and the symmetric-function
  realization><label|sec:hopf>

  <\definition>
    <label|def:hopf>Equip <math|<CA><rsub|m>> with the unique bialgebra
    structure for which each <math|c<rsub|j>> is primitive:
    <math|\<Delta\>*c<rsub|j>=c<rsub|j>\<otimes\>1+1\<otimes\>c<rsub|j>>,
    <math|\<varepsilon\><around|(|c<rsub|j>|)>=0>, extended as algebra
    morphisms. Since <math|<CA><rsub|m>> is graded and connected
    (<math|<around|(|<CA><rsub|m>|)><rsub|0>=<C>>), it is automatically a
    Hopf algebra, with antipode determined by
    <math|S<around|(|c<rsub|j>|)>=-c<rsub|j>> <em|(graded connected
    bialgebras possess antipodes; see <cite-detail|MilnorMoore|�1><space|0.17em>)>.
  </definition>

  <\theorem>
    [Divided-power property]<label|thm:dividedpower>
    <math|\<Delta\>*\<Lambda\><rsub|N>=<big|sum><rsub|i=0><rsup|N>\<Lambda\><rsub|i>\<otimes\>\<Lambda\><rsub|N-i>>
    for all <math|N\<ge\>0>, <math|\<varepsilon\><around|(|\<Lambda\><rsub|N>|)>=\<delta\><rsub|N,0>>,
    and <math|<big|sum><rsub|i=0><rsup|N>\<Lambda\><rsub|i>*<space|0.17em>S<around|(|\<Lambda\><rsub|N-i>|)>=\<delta\><rsub|N,0>>,
    with <math|S<around|(|\<Lambda\><rsub|N>|)>=\<Lambda\><rsub|N>*<around|(|-c<rsub|1>,\<ldots\>,-c<rsub|m>|)>>.
  </theorem>

  <\proof>
    Apply the algebra morphism <math|\<Delta\>> coefficient-wise in
    <math|<around|(|<CA><rsub|m>\<otimes\><CA><rsub|m>|)><around|[|<around|[|v|]>|]>>:

    <\equation*>
      <big|sum><rsub|N>\<Delta\>*\<Lambda\><rsub|N>*<space|0.17em>v<rsup|N>=\<Delta\>*E<around|(|v|)>=exp
      <around*|(|<big|sum><rsub|j><around|(|c<rsub|j>\<otimes\>1+1\<otimes\>c<rsub|j>|)>*v<rsup|j>|)>=exp
      <around*|(|<big|sum><rsub|j><around|(|c<rsub|j>\<otimes\>1|)>*v<rsup|j>|)>*exp
      <around*|(|<big|sum><rsub|j><around|(|1\<otimes\>c<rsub|j>|)>*v<rsup|j>|)>,
    </equation*>

    the factorization being valid because the two exponents commute. The
    right side equals <math|<around*|(|<big|sum><rsub|i>\<Lambda\><rsub|i>\<otimes\>1*<space|0.17em>v<rsup|i>|)><around*|(|<big|sum><rsub|k>1\<otimes\>\<Lambda\><rsub|k>*<space|0.17em>v<rsup|k>|)>>;
    compare coefficients. The counit and antipode identities follow the same
    way from <math|\<varepsilon\>*E<around|(|v|)>=1> and
    <math|S*E<around|(|v|)>=E<around|(|v|)><rsup|-1>=exp
    <around|(|-<big|sum>c<rsub|j>*v<rsup|j>|)>>.
  </proof>

  Thus <math|<around|(|\<Lambda\><rsub|N>|)>> is a <em|divided-power
  sequence> in the graded connected Hopf algebra <math|<CA><rsub|m>>:
  <math|\<Lambda\><rsub|N>\<in\><around|(|<CA><rsub|m>|)><rsub|N>>,
  <math|\<Lambda\><rsub|0>=1>, <math|\<Delta\>*\<Lambda\><rsub|N>=<big|sum>\<Lambda\><rsub|i>\<otimes\>\<Lambda\><rsub|N-i>>.
  Equivalently, the series <math|E<around|(|v|)>> is group-like in the
  completed Hopf algebra <math|<CA><rsub|m><around|[|<around|[|v|]>|]>>.

  <\theorem>
    [Primitives]<label|thm:primitives> <math|<Prim><around|(|<CA><rsub|m>|)>=<big|oplus><rsub|j=1><rsup|m><C><space|0.17em>c<rsub|j>>;
    in particular the primitive space in weight <math|j> is one-dimensional
    for <math|1\<le\>j\<le\>m> and zero for <math|j\<gtr\>m>.
  </theorem>

  <\proof>
    Each <math|c<rsub|j>> is primitive by construction. Conversely, let
    <math|f=<big|sum><rsub|\<alpha\>>a<rsub|\<alpha\>>*c<rsup|\<alpha\>>> be
    primitive, with multi-index notation <math|c<rsup|\<alpha\>>=<big|prod>c<rsub|j><rsup|\<alpha\><rsub|j>>>.
    Then <math|\<Delta\><around|(|c<rsup|\<alpha\>>|)>=<big|prod><rsub|j><around|(|c<rsub|j>\<otimes\>1+1\<otimes\>c<rsub|j>|)><rsup|\<alpha\><rsub|j>>=<big|sum><rsub|0\<le\>\<beta\>\<le\>\<alpha\>><binom|\<alpha\>|\<beta\>>c<rsup|\<beta\>>\<otimes\>c<rsup|\<alpha\>-\<beta\>>>.
    The component of <math|\<Delta\>*f-f\<otimes\>1-1\<otimes\>f> in
    <math|<CA><rsub|m><rsup|+>\<otimes\><CA><rsub|m><rsup|+>>
    (<math|<CA><rsub|m><rsup|+>\<assign\>ker \<varepsilon\>>) is
    <math|<big|sum><rsub|\<alpha\>>a<rsub|\<alpha\>>*<big|sum><rsub|0\<less\>\<beta\>\<less\>\<alpha\>><binom|\<alpha\>|\<beta\>>c<rsup|\<beta\>>\<otimes\>c<rsup|\<alpha\>-\<beta\>>>.
    The elements <math|<around|{|c<rsup|\<beta\>>\<otimes\>c<rsup|\<gamma\>>:\<beta\>,\<gamma\>\<ne\>0|}>>
    are linearly independent in <math|<CA><rsub|m>\<otimes\><CA><rsub|m>>,
    and for fixed <math|<around|(|\<beta\>,\<gamma\>|)>> the total
    coefficient is <math|a<rsub|\<beta\>+\<gamma\>><binom|\<beta\>+\<gamma\>|\<beta\>>>.
    Primitivity therefore forces <math|a<rsub|\<alpha\>>=0> whenever
    <math|\<alpha\>> admits a decomposition
    <math|\<alpha\>=\<beta\>+\<gamma\>> with
    <math|\<beta\>,\<gamma\>\<ne\>0>, i.e. whenever
    <math|<around|\||\<alpha\>|\|>\<assign\><big|sum><rsub|j>\<alpha\><rsub|j>\<ge\>2>.
    Hence <math|f> is a linear combination of
    <math|1,c<rsub|1>,\<ldots\>,c<rsub|m>>, and
    <math|\<varepsilon\><around|(|f|)>=0> kills the constant.
  </proof>

  <subsection|The symmetric-function isomorphism>

  Let <math|<Sym>=<C><around|[|p<rsub|1>,p<rsub|2>,\<ldots\>|]>> be the Hopf
  algebra of symmetric functions over <math|<C>>, with power sums
  <math|p<rsub|r>> primitive, complete homogeneous symmetric functions
  <math|h<rsub|N>>, and Schur functions <math|s<rsub|\<lambda\>>>
  <em|(Macdonald <cite-detail|Macdonald|Ch.<nbsp>I>)>. Write
  <math|<CA><rsub|\<infty\>>\<assign\><C><around|[|c<rsub|1>,c<rsub|2>,\<ldots\>|]>>
  for the evident <math|m=\<infty\>> version of
  Definitions<nbsp><reference|def:E> and<nbsp><reference|def:hopf>; Lemmas
  <reference|lem:recurrence>\U<reference|lem:derivation> and
  Theorems<nbsp><reference|thm:generation>\U<reference|thm:primitives> hold
  verbatim with <math|min <around|(|m,N|)>> replaced by <math|N>.

  <\theorem>
    [Symmetric-function realization]<label|thm:sym> The assignment
    <math|\<Psi\><around|(|p<rsub|j>|)>\<assign\>j*<space|0.17em>c<rsub|j>>
    extends uniquely to an isomorphism of graded Hopf algebras
    <math|\<Psi\>:<Sym><long-arrow|\<rubber-rightarrow\>|\<sim\>><CA><rsub|\<infty\>>>,
    and

    <\equation*>
      \<Psi\><around|(|h<rsub|N>|)>=\<Lambda\><rsub|N>*<space|2em><around|(|N\<ge\>0|)>.
    </equation*>

    Under <math|\<Psi\>>, Newton's identity
    <math|N*h<rsub|N>=<big|sum><rsub|j=1><rsup|N>p<rsub|j>*h<rsub|N-j>>
    becomes the universal recurrence <eqref|eq:universal>. Moreover the ideal
    <math|I<rsub|m>\<assign\><around|(|c<rsub|m+1>,c<rsub|m+2>,\<ldots\>|)>\<subset\><CA><rsub|\<infty\>>>
    is a graded Hopf ideal, and

    <\equation*>
      <CA><rsub|m><space|0.27em>\<cong\><space|0.27em><CA><rsub|\<infty\>>/I<rsub|m><space|0.27em>\<cong\><space|0.27em><Sym>/<around|(|p<rsub|m+1>,p<rsub|m+2>,\<ldots\>|)>
    </equation*>

    as graded Hopf algebras, compatibly with the sequences:
    <math|h<rsub|N>\<mapsto\>\<Lambda\><rsub|N>> throughout.
  </theorem>

  <\proof>
    <math|<Sym>> and <math|<CA><rsub|\<infty\>>> are free commutative
    algebras on primitive generators <math|p<rsub|j>>, resp.
    <math|c<rsub|j>>, one in each weight <math|j\<ge\>1>; <math|\<Psi\>>
    matches them by weight with the nonzero scalar <math|j>, hence is an
    isomorphism of graded algebras. It is a coalgebra map because it sends
    primitives to primitives and both coproducts are algebra morphisms
    determined on generators; a bialgebra isomorphism of Hopf algebras
    automatically respects antipodes. For the sequence: the generating
    identity <math|<big|sum><rsub|N\<ge\>0>h<rsub|N>*t<rsup|N>=exp
    <around*|(|<big|sum><rsub|r\<ge\>1>p<rsub|r>*t<rsup|r>/r|)>>
    <em|(<cite-detail|Macdonald|I.(2.10)>)> maps under <math|\<Psi\>>
    (applied coefficient-wise in <math|t>) to
    <math|<big|sum><rsub|N>\<Psi\><around|(|h<rsub|N>|)>*t<rsup|N>=exp
    <around*|(|<big|sum><rsub|r>c<rsub|r>*t<rsup|r>|)>=<big|sum><rsub|N>\<Lambda\><rsub|N>*t<rsup|N>>,
    so <math|\<Psi\><around|(|h<rsub|N>|)>=\<Lambda\><rsub|N>>. Newton's
    identity is <cite-detail|Macdonald|I.(2.11)<math|<rprime|'>>>; applying
    <math|\<Psi\>> gives <eqref|eq:universal> (and, independently,
    Lemma<nbsp><reference|lem:recurrence> re-proves Newton's identity via the
    differential equation <math|E<rprime|'>=<around|(|<big|sum>j*c<rsub|j>*v<rsup|j-1>|)>*E>).
    For the quotient: <math|I<rsub|m>> is generated by primitives, so
    <math|\<Delta\>*I<rsub|m>\<subseteq\>I<rsub|m>\<otimes\><CA><rsub|\<infty\>>+<CA><rsub|\<infty\>>\<otimes\>I<rsub|m>>,
    <math|\<varepsilon\><around|(|I<rsub|m>|)>=0>,
    <math|S<around|(|I<rsub|m>|)>\<subseteq\>I<rsub|m>>: a Hopf ideal. The
    quotient map <math|<CA><rsub|\<infty\>>\<to\><CA><rsub|m>>,
    <math|c<rsub|j>\<mapsto\>c<rsub|j>> <math|<around|(|j\<le\>m|)>>,
    <math|c<rsub|j>\<mapsto\>0> <math|<around|(|j\<gtr\>m|)>>, carries
    <math|\<Lambda\><rsub|N><rsup|<around|(|\<infty\>|)>>> to
    <math|\<Lambda\><rsub|N>> by Lemma<nbsp><reference|lem:partition>
    (multi-indices with <math|k<rsub|j>\<gtr\>0> for some <math|j\<gtr\>m>
    die).
  </proof>

  <\remark>
    <label|rem:notFdB><math|<CA><rsub|\<infty\>>> is <em|not> the Fa� di
    Bruno Hopf algebra: the latter is the coordinate Hopf algebra of the
    group of formal diffeomorphisms and is not cocommutative
    <em|(Figueroa\UGracia-Bond�a <cite|FGB>)>, whereas
    <math|<CA><rsub|\<infty\>>\<cong\><Sym>> is commutative and
    cocommutative. The relation to Bell polynomials is the coefficient
    identity of Proposition<nbsp><reference|prop:bell>, not an isomorphism
    with the Fa� di Bruno object. This answers, precisely, the question \Pis
    it the Bell algebra\Q: the coefficient algebra is the algebra of
    symmetric functions, in which the <math|\<Lambda\><rsub|N>> are the
    complete homogeneous basis re-expressed through rescaled power sums.
  </remark>

  <\remark>
    [Hall algebra]<label|rem:hall> The classical Hall algebra of finite
    modules over a discrete valuation ring with finite residue field is
    isomorphic, after the standard rescaling, to <math|<Sym>>
    <em|(<cite-detail|Macdonald|Ch.<nbsp>II--III>)>. Via
    Theorem<nbsp><reference|thm:sym>, <math|<CA><rsub|\<infty\>>> therefore
    <em|does> arise as a Hall algebra, and <math|<CA><rsub|m>> as an explicit
    Hopf quotient of one. We record this as an identification available by
    citation; we make no use of the finer (Hall\ULittlewood, <math|q>-)
    structure here, and lifting the coefficient sequence
    <math|<around|(|\<Lambda\><rsub|N>|)>> to the <math|q>-deformed level is
    Open Problem<nbsp><reference|prob:hall>.
  </remark>

  <section|Combinatorial and matrix realizations><label|sec:combinatorics>

  <\theorem>
    [Species / set-partition interpretation]<label|thm:species> For
    <math|N\<ge\>1>,

    <\equation*>
      N!<space|0.17em>\<Lambda\><rsub|N><space|0.27em>=<space|0.27em><big|sum><rsub|<stack|<tformat|<table|<row|<cell|\<pi\>\<vdash\><around|[|N|]>>>|<row|<cell|<text|all
      blocks of size>\<le\>m>>>>>><space|0.27em><big|prod><rsub|B\<in\>\<pi\>><around|\||B|\|>!<space|0.27em>c<rsub|<around|\||B|\|>>,
    </equation*>

    the sum over set partitions <math|\<pi\>> of
    <math|<around|{|1,\<ldots\>,N|}>> with block sizes at most <math|m>.
    Equivalently, <math|E<around|(|v|)>> is the exponential generating
    function of the species \Psets of blocks,\Q each block of size
    <math|j\<le\>m> weighted <math|j!<space|0.17em>c<rsub|j>>.
  </theorem>

  <\proof>
    The number of set partitions of <math|<around|[|N|]>> with exactly
    <math|k<rsub|j>> blocks of size <math|j> is
    <math|N!/<big|prod><rsub|j><around*|(|<around|(|j!|)><rsup|k<rsub|j>>*k<rsub|j>!|)>>.
    Hence

    <\equation*>
      <big|sum><rsub|\<pi\>><big|prod><rsub|B\<in\>\<pi\>><around|\||B|\|>!<space|0.17em>c<rsub|<around|\||B|\|>>=<big|sum><rsub|<stack|<tformat|<table|<row|<cell|k:<space|0.17em><big|sum>j*k<rsub|j>=N>>>>>><frac|N!|<big|prod><rsub|j><around|(|j!|)><rsup|k<rsub|j>>*k<rsub|j>!>*<big|prod><rsub|j><around|(|j!<space|0.17em>c<rsub|j>|)><rsup|k<rsub|j>>=N!<big|sum><rsub|<stack|<tformat|<table|<row|<cell|k:<space|0.17em><big|sum>j*k<rsub|j>=N>>>>>><big|prod><rsub|j><frac|c<rsub|j><rsup|k<rsub|j>>|k<rsub|j>!>=N!<space|0.17em>\<Lambda\><rsub|N>
    </equation*>

    by Lemma<nbsp><reference|lem:partition>. The species statement is the
    exponential formula <em|(Flajolet\USedgewick <cite-detail|FS|II.2>;
    Bergeron\ULabelle\ULeroux <cite|BLL>)>.
  </proof>

  <\theorem>
    [Appell structure]<label|thm:appell> Fix
    <math|c<rsub|2>,\<ldots\>,c<rsub|m>> and regard
    <math|p<rsub|N><around|(|c<rsub|1>|)>\<assign\>N!<space|0.17em>\<Lambda\><rsub|N>>
    as a polynomial in <math|c<rsub|1>>. Then
    <math|<around|(|p<rsub|N>|)><rsub|N\<ge\>0>> is an Appell sequence:
    <math|p<rsub|N><rprime|'><around|(|c<rsub|1>|)>=N*<space|0.17em>p<rsub|N-1><around|(|c<rsub|1>|)>>,
    with exponential generating function <math|<big|sum><rsub|N>p<rsub|N><around|(|c<rsub|1>|)>*t<rsup|N>/N!=e<rsup|c<rsub|1>*t>*A<around|(|t|)>>,
    <math|A<around|(|t|)>=exp <around*|(|<big|sum><rsub|j=2><rsup|m>c<rsub|j>*t<rsup|j>|)>>.
  </theorem>

  <\proof>
    Lemma<nbsp><reference|lem:derivation> with <math|j=1> gives
    <math|\<partial\><rsub|c<rsub|1>>*\<Lambda\><rsub|N>=\<Lambda\><rsub|N-1>>,
    i.e. <math|p<rsub|N><rprime|'>=N*p<rsub|N-1>>; the generating function is
    Definition<nbsp><reference|def:E> with the <math|c<rsub|1>>-factor split
    off. Appell sequences are exactly the Sheffer sequences with identity
    delta series, so <math|<around|(|p<rsub|N>|)>> is Sheffer of Appell type
    <em|(Roman <cite-detail|Roman|�2.5>)>.
  </proof>

  <\theorem>
    [Riordan-group realization]<label|thm:riordan> The lower-triangular
    matrix <math|D=<around|(|d<rsub|n,k>|)><rsub|n,k\<ge\>0>>,
    <math|d<rsub|n,k>\<assign\><dfrac|n!|k!><space|0.17em>\<Lambda\><rsub|n-k>>,
    is the exponential Riordan array <math|<around*|(|E<around|(|t|)>,<space|0.17em>t|)>>,
    an element of the Appell subgroup of the exponential Riordan group. The
    group law restricted to this subgroup,
    <math|<around|(|E<around|(|t|)>,t|)>\<cdot\><around|(|E<rprime|'><around|(|t|)>,t|)>=<around|(|E<around|(|t|)>*E<rprime|'><around|(|t|)>,t|)>>,
    corresponds to addition <math|c<rsub|j>\<mapsto\>c<rsub|j>+c<rsub|j><rprime|'>>
    of parameters, i.e. to the coproduct of
    Theorem<nbsp><reference|thm:dividedpower>.
  </theorem>

  <\proof>
    By definition <em|(Shapiro et al. <cite|Shapiro>; Barry <cite|Barry>)>
    the exponential Riordan array <math|<around|(|g<around|(|t|)>,f<around|(|t|)>|)>>
    has entries <math|d<rsub|n,k>=<frac|n!|k!><around|[|t<rsup|n-k>|]>*<space|0.17em>g<around|(|t|)>*f<around|(|t|)><rsup|k>/t<rsup|k>>
    reduced, for <math|f<around|(|t|)>=t>, to
    <math|d<rsub|n,k>=<frac|n!|k!><around|[|t<rsup|n-k>|]>*g<around|(|t|)>>;
    with <math|g=E> this is <math|<frac|n!|k!>*\<Lambda\><rsub|n-k>>. Matrix
    multiplication of Appell arrays multiplies the <math|g>'s;
    <math|E<around|(|t;c|)>*E<around|(|t;c<rprime|'>|)>=E<around|(|t;c+c<rprime|'>|)>>
    since the exponents add. The identification with the coproduct is
    Theorem<nbsp><reference|thm:dividedpower> read through
    <math|\<Lambda\><rsub|N>*<around|(|c+c<rprime|'>|)>=<big|sum><rsub|i>\<Lambda\><rsub|i><around|(|c|)>*\<Lambda\><rsub|N-i><around|(|c<rprime|'>|)>>,
    which is the image of <math|\<Delta\>*\<Lambda\><rsub|N>> under
    evaluation at <math|<around|(|c,c<rprime|'>|)>>.
  </proof>

  <subsection|Hankel determinants are rectangular Schur functions>

  <\theorem>
    [Hankel\USchur identity]<label|thm:hankelschur> In
    <math|<CA><rsub|\<infty\>>\<cong\><Sym>> (hence, after applying the
    quotient of Theorem<nbsp><reference|thm:sym>, as identities in
    <math|<CA><rsub|m>>), for every <math|n\<ge\>1>:

    <\equation*>
      det <around*|(|\<Lambda\><rsub|i+j>|)><rsub|0\<le\>i,j\<le\>n-1>=<around|(|-1|)><rsup|<binom|n|2>>*<space|0.17em>\<Psi\><around*|(|s<rsub|<around|(|<around|(|n-1|)><rsup|n>|)>>|)>,<space|2em>det
      <around*|(|\<Lambda\><rsub|i+j+1>|)><rsub|0\<le\>i,j\<le\>n-1>=<around|(|-1|)><rsup|<binom|n|2>>*<space|0.17em>\<Psi\><around*|(|s<rsub|<around|(|n<rsup|n>|)>>|)>,
    </equation*>

    where <math|<around|(|r<rsup|n>|)>> denotes the <math|n\<times\>r>
    rectangular partition.
  </theorem>

  <\proof>
    Work in <math|<Sym>> with <math|\<Lambda\><rsub|N>=h<rsub|N>>
    (Theorem<nbsp><reference|thm:sym>). Reverse the rows of the Hankel matrix
    by <math|i\<mapsto\>n-1-i>; this multiplies the determinant by the sign
    of the reversal permutation, <math|<around|(|-1|)><rsup|<binom|n|2>>>. In
    <math|1>-based indices <math|<around|(|i,j|)>> the reversed matrix has
    entries <math|h<rsub|<space|0.17em>n-1-i+j>> (first case), which is the
    Jacobi\UTrudi matrix <math|<around*|(|h<rsub|\<lambda\><rsub|i>-i+j>|)>>
    for the constant partition <math|\<lambda\><rsub|i>=n-1>; by the
    Jacobi\UTrudi identity <em|(<cite-detail|Macdonald|I.(3.4)>)> its
    determinant is <math|s<rsub|<around|(|<around|(|n-1|)><rsup|n>|)>>>. The
    shifted case is identical with <math|\<lambda\><rsub|i>=n>.
  </proof>

  <\corollary>
    [Normality of the Pad� table of <math|E>]<label|cor:padeE> Let
    <math|<ev><rsub|c>:<CA><rsub|m>\<to\><C>> be evaluation at
    <math|c\<in\><C><rsup|m>> and let <math|\<cal-L\>> be the moment
    functional <math|\<cal-L\><around|[|x<rsup|N>|]>=<ev><rsub|c><around|(|\<Lambda\><rsub|N>|)>>.
    The Hankel determinants governing the diagonal Pad� approximants of
    <math|E<around|(|v|)>> at <math|c> <em|(Gragg <cite|Gragg>)> are the
    numbers <math|<around|(|-1|)><rsup|<binom|n|2>>*<space|0.17em>s<rsub|<around|(|<around|(|n-1|)><rsup|n>|)>>>
    and <math|<around|(|-1|)><rsup|<binom|n|2>>*<space|0.17em>s<rsub|<around|(|n<rsup|n>|)>>>
    evaluated under <math|p<rsub|j>=j*c<rsub|j>>
    <math|<around|(|j\<le\>m|)>>, <math|p<rsub|j>=0>
    <math|<around|(|j\<gtr\>m|)>>. In particular, for <math|m=1> (so
    <math|p<rsub|1>=c<rsub|1>>, <math|p<rsub|\<ge\>2>=0>), the exponential
    specialization <math|s<rsub|\<lambda\>>\<mapsto\>f<rsup|\<lambda\>>*c<rsub|1><rsup|<around|\||\<lambda\>|\|>>/<around|\||\<lambda\>|\|>>!
    <em|(<cite-detail|Macdonald|I.�7, Ex.<nbsp>24(a) with
    <math|n\<to\>\<infty\>>; equivalently <math|<ev>> of
    <cite-detail|Macdonald|I.(5.16)> at the exponential
    specialization><space|0.17em>)>, where <math|f<rsup|\<lambda\>>\<gtr\>0>
    is the number of standard Young tableaux, shows every such determinant is
    nonzero for <math|c<rsub|1>\<ne\>0>: the Pad� table of
    <math|e<rsup|c<rsub|1>*v>> is normal, recovering the classical normality
    of the exponential.
  </corollary>

  <\proof>
    Immediate from Theorem<nbsp><reference|thm:hankelschur>, the Pad�\UHankel
    dictionary <cite|Gragg>, and <math|f<rsup|\<lambda\>>\<ge\>1> for every
    partition <math|\<lambda\>>.
  </proof>

  <\remark>
    <label|rem:zeroloci>For <math|m\<ge\>2> the quasi-definiteness locus of
    <math|\<cal-L\>> is precisely the complement of the union of the
    hypersurfaces <math|<around|{|c\<in\><C><rsup|m>:s<rsub|<around|(|<around|(|n-1|)><rsup|n>|)>>*<around|(|p<rsub|j>=j*c<rsub|j>|)>=0|}>>;
    the obstruction to Pad� normality of exponentials of principal parts is a
    rectangular Schur divisor. This gives the \Pdiscriminant locus\Q
    appearing in the companion Chebyshev\UWheeler paper a name in the
    pure-pole case.
  </remark>

  <section|Automorphisms and differential Galois structure><label|sec:aut>

  <\theorem>
    [Graded Hopf automorphisms]<label|thm:aut>
    <math|<Aut><rsub|<with|math-font-family|rm|gr<text|->Hopf>><around|(|<CA><rsub|m>|)>\<cong\><around|(|<C><rsup|\<times\>>|)><rsup|m>>,
    acting by <math|c<rsub|j>\<mapsto\>\<lambda\><rsub|j>*c<rsub|j>>. The
    subgroup induced by the geometric rescalings
    <math|w\<mapsto\>\<lambda\>*w> of the local coordinate is the
    one-parameter diagonal <math|\<lambda\><rsub|j>=\<lambda\><rsup|<space|0.17em>j>>.
  </theorem>

  <\proof>
    A graded Hopf automorphism preserves <math|<Prim><around|(|<CA><rsub|m>|)>>
    and each of its graded pieces, which are the lines <math|<C>c<rsub|j>> by
    Theorem<nbsp><reference|thm:primitives>; hence
    <math|c<rsub|j>\<mapsto\>\<lambda\><rsub|j>*c<rsub|j>> with
    <math|\<lambda\><rsub|j>\<in\><C><rsup|\<times\>>>, and any such
    assignment plainly defines a graded Hopf automorphism. Under
    <math|w\<mapsto\>\<lambda\>*w> the principal part
    <math|<big|sum>c<rsub|j>*w<rsup|-j>> becomes
    <math|<big|sum><around|(|c<rsub|j>*\<lambda\><rsup|-j>|)>*w<rsup|-j>>,
    giving the stated one-parameter subgroup (with
    <math|\<lambda\><rsup|-j>>; reparametrize).
  </proof>

  <\proposition>
    [Picard\UVessiot group]<label|prop:galois> Let
    <math|R\<in\><C><around|(|z|)>> be nonconstant. Then <math|y=e<rsup|R>>
    is transcendental over <math|<C><around|(|z|)>> and the Picard\UVessiot
    group of <math|y<rprime|'>=R<rprime|'>*y> over <math|<C><around|(|z|)>>
    is <math|\<bbb-G\><rsub|m>>. The group acts on solutions by
    <math|y\<mapsto\>\<lambda\>*y>, hence on the full Laurent coefficient
    sequence <math|<around|(|A<rsub|n>|)>> of
    Section<nbsp><reference|sec:model> diagonally by
    <math|A<rsub|n>\<mapsto\>\<lambda\>*A<rsub|n>>: the coefficient sequence
    spans the weight-one isotypic line, while the algebra <math|<CA><rsub|m>>
    itself is Galois-invariant.
  </proposition>

  <\proof>
    The PV group of a rank-one equation is a Zariski-closed subgroup of
    <math|\<bbb-G\><rsub|m>>, hence <math|\<bbb-G\><rsub|m>> itself or the
    finite group <math|\<mu\><rsub|n>>; the latter occurs iff
    <math|y<rsup|n>\<in\><C><around|(|z|)>> for some <math|n\<ge\>1> <em|(van
    der Put\USinger <cite-detail|vdPS|Ex.<nbsp>1.19, �1.4>)>. Suppose
    <math|e<rsup|n*R>=f\<in\><C><around|(|z|)>>. Then
    <math|n*R<rprime|'>=f<rprime|'>/f>. Every residue of <math|R<rprime|'>>
    vanishes, since <math|R<rprime|'>> is the derivative of a rational
    function; every residue of <math|f<rprime|'>/f> at a zero or pole of
    <math|f> is the (nonzero) integer order of <math|f> there. Hence <math|f>
    has no zeros or poles, so <math|f> is constant and <math|R<rprime|'>=0>,
    contradicting <math|R> nonconstant.
  </proof>

  <section|The analytic model><label|sec:model>

  We now verify that the formal object of
  Sections<nbsp><reference|sec:recurrence>\U<reference|sec:combinatorics>
  computes actual Laurent coefficients, with quantitative control. Fix
  <math|c=<around|(|c<rsub|1>,\<ldots\>,c<rsub|m>|)>\<in\><C><rsup|m>> and
  write <math|\<Lambda\><rsub|N><around|(|c|)>\<assign\><ev><rsub|c><around|(|\<Lambda\><rsub|N>|)>>,
  <math|C\<assign\><big|sum><rsub|j=1><rsup|m><around|\||c<rsub|j>|\|>>.

  <\proposition>
    [Growth bound]<label|prop:growth> For all <math|N\<ge\>0> and all
    <math|v\<gtr\>0>, <math|<around|\||\<Lambda\><rsub|N><around|(|c|)>|\|>\<le\>\<Lambda\><rsub|N>*<around|(|<around|\||c<rsub|1>|\|>,\<ldots\>,<around|\||c<rsub|m>|\|>|)>\<le\>v<rsup|-N>*exp
    <around*|(|<big|sum><rsub|j><around|\||c<rsub|j>|\|>*v<rsup|j>|)>>.
    Consequently, for <math|N\<ge\>m*C>,

    <\equation*>
      <around|\||\<Lambda\><rsub|N><around|(|c|)>|\|><space|0.27em>\<le\><space|0.27em>e<rsup|N/m><around*|(|<frac|m*C|N>|)><rsup|N/m>,
    </equation*>

    so <math|<around|\||\<Lambda\><rsub|N><around|(|c|)>|\|><rsup|1/N>\<to\>0>
    super-geometrically, at the rate of an entire function of order <math|m>
    in <math|1/w>.
  </proposition>

  <\proof>
    The first inequality is termwise from <eqref|eq:partition>. For the
    second, all terms of <math|<big|sum><rsub|M>\<Lambda\><rsub|M><around|(|<around|\||c|\|>|)>*v<rsup|M>=exp
    <around|(|<big|sum><rsub|j><around|\||c<rsub|j>|\|>*v<rsup|j>|)>> are
    nonnegative, so any single term is bounded by the sum:
    <math|\<Lambda\><rsub|N><around|(|<around|\||c|\|>|)>*v<rsup|N>\<le\>exp
    <around|(|<big|sum><around|\||c<rsub|j>|\|>*v<rsup|j>|)>\<le\>e<rsup|C*v<rsup|m>>>
    for <math|v\<ge\>1>. Choose <math|v=<around|(|N/<around|(|m*C|)>|)><rsup|1/m>\<ge\>1>;
    then <math|e<rsup|C*v<rsup|m>>=e<rsup|N/m>> and
    <math|v<rsup|-N>=<around|(|m*C/N|)><rsup|N/m>>.
  </proof>

  <\theorem>
    [Pure-pole expansion]<label|thm:analyticmodel> For every
    <math|c\<in\><C><rsup|m>> and <math|w\<ne\>0>, the series
    <math|<big|sum><rsub|N\<ge\>0>\<Lambda\><rsub|N><around|(|c|)>*<space|0.17em>w<rsup|-N>>
    converges absolutely, uniformly on <math|<around|\||w|\|>\<ge\>\<epsilon\>>
    for each <math|\<epsilon\>\<gtr\>0>, and

    <\equation*>
      exp <around*|(|<big|sum><rsub|j=1><rsup|m>c<rsub|j>*w<rsup|-j>|)>=<big|sum><rsub|N\<ge\>0>\<Lambda\><rsub|N><around|(|c|)>*<space|0.17em>w<rsup|-N>.
    </equation*>

    In particular <math|\<Lambda\><rsub|N><around|(|c|)>> <em|is> the
    coefficient of <math|w<rsup|-N>> in the Laurent expansion of
    <math|e<rsup|\<Pi\>>> on <math|<C><rsup|\<times\>>>, and the map
    <math|c\<mapsto\><around|(|\<Lambda\><rsub|N><around|(|c|)>|)><rsub|N\<ge\>0>>
    is injective.
  </theorem>

  <\proof>
    Expanding each factor <math|exp <around|(|c<rsub|j>*w<rsup|-j>|)>> and
    multiplying, the resulting multi-series is dominated termwise by
    <math|<big|prod><rsub|j><big|sum><rsub|k<rsub|j>><around|\||c<rsub|j>|\|><rsup|k<rsub|j>><around|\||w|\|><rsup|-j*k<rsub|j>>/k<rsub|j>!=exp
    <around|(|<big|sum><rsub|j><around|\||c<rsub|j>|\|><around|\||w|\|><rsup|-j>|)>\<less\>\<infty\>>,
    so it converges absolutely and may be rearranged by total degree,
    yielding <math|<big|sum><rsub|N>\<Lambda\><rsub|N><around|(|c|)>*w<rsup|-N>>
    with the coefficients of Lemma<nbsp><reference|lem:partition>. Uniqueness
    of Laurent coefficients on an annulus identifies them with the Laurent
    coefficients of <math|e<rsup|\<Pi\>>>. Injectivity: by the triangularity
    in the proof of Theorem<nbsp><reference|thm:generation>, <math|c<rsub|N>>
    is a polynomial in <math|\<Lambda\><rsub|1><around|(|c|)>,\<ldots\>,\<Lambda\><rsub|N><around|(|c|)>>.
  </proof>

  <\theorem>
    [Local Laurent structure of <math|e<rsup|R>>; the coefficient
    module]<label|thm:module> Let <math|R\<in\><C><around|(|z|)>> have a pole
    at <math|a> of order <math|m\<ge\>1> with principal part
    <math|\<Pi\><around|(|w|)>=<big|sum><rsub|j=1><rsup|m>c<rsub|j>*w<rsup|-j>>,
    <math|w=z-a>, <math|c<rsub|m>\<ne\>0>, and let
    <math|r<rsub|a>\<in\><around|(|0,\<infty\>|]>> be the distance from
    <math|a> to the nearest other pole of <math|R>. Write
    <math|H\<assign\>R-\<Pi\>>, analytic on
    <math|<around|\||w|\|>\<less\>r<rsub|a>>, and
    <math|e<rsup|H*<around|(|a+w|)>>=<big|sum><rsub|l\<ge\>0>b<rsub|l>*w<rsup|l>>,
    <math|limsup<rsub|l><around|\||b<rsub|l>|\|><rsup|1/l>\<le\>1/r<rsub|a>>.
    Then on <math|0\<less\><around|\||w|\|>\<less\>r<rsub|a>>,

    <\equation*>
      e<rsup|R*<around|(|a+w|)>>=<big|sum><rsub|n\<in\><Z>>A<rsub|n>*<space|0.17em>w<rsup|n>,<space|2em>A<rsub|n>=<big|sum><rsub|k\<ge\>max
      <around|(|0,-n|)>>\<Lambda\><rsub|k><around|(|c|)>*<space|0.17em>b<rsub|n+k>,
    </equation*>

    each <math|A<rsub|n>> given by an absolutely convergent series. The map
    <math|<CA><rsub|m>\<times\><C><around|[|<around|[|w|]>|]><rsub|r<rsub|a>>\<to\><C><rsup|<Z>>>
    so defined is <math|<C>>-bilinear in the coefficient sequences
    <math|<around|(|\<Lambda\><rsub|k><around|(|c|)>|)>> and
    <math|<around|(|b<rsub|l>|)>>: the Laurent coefficients of
    <math|e<rsup|R>> constitute a module over the coefficient algebra, with
    structure constants supported on the exponent lattice <math|n=l-k>.
  </theorem>

  <\proof>
    <math|e<rsup|R>=e<rsup|\<Pi\>>*e<rsup|H>> exactly, since <math|\<Pi\>>
    and <math|H> are scalar functions. On any circle
    <math|<around|\||w|\|>=\<rho\>\<in\><around|(|0,r<rsub|a>|)>>, both
    factors are given by absolutely convergent Laurent/Taylor series
    (Theorem<nbsp><reference|thm:analyticmodel>; Cauchy), so their product's
    Laurent coefficients are the Cauchy convolutions
    <math|A<rsub|n>=<big|sum><rsub|k>\<Lambda\><rsub|k><around|(|c|)>*b<rsub|n+k>>
    (with <math|b<rsub|\<less\>0>\<assign\>0>), and the double series
    converges absolutely because, choosing
    <math|\<rho\><rprime|'>\<in\><around|(|\<rho\>,r<rsub|a>|)>>,
    <math|<around|\||b<rsub|n+k>|\|>\<le\>B*\<rho\><rprime|'><rsup|-<around|(|n+k|)>>>
    while <math|<around|\||\<Lambda\><rsub|k><around|(|c|)>|\|>> decays
    super-geometrically by Proposition<nbsp><reference|prop:growth>:
    <math|<big|sum><rsub|k><around|\||\<Lambda\><rsub|k><around|(|c|)>|\|>*<space|0.17em>B*\<rho\><rprime|'><rsup|-<around|(|n+k|)>>\<le\>B*\<rho\><rprime|'><rsup|-n>*<big|sum><rsub|k>e<rsup|k/m>*<around|(|m*C/k|)><rsup|k/m>*\<rho\><rprime|'><rsup|-k>\<less\>\<infty\>>.
    Bilinearity is manifest.
  </proof>

  <\proposition>
    [Truncation error]<label|prop:tail> In the setting of
    Theorem<nbsp><reference|thm:module>, fix
    <math|\<rho\><rprime|'>\<less\>r<rsub|a>> with
    <math|<around|\||b<rsub|l>|\|>\<le\>B*\<rho\><rprime|'><rsup|-l>>, and
    let <math|K\<ge\>K<rsub|0>\<assign\>max
    <around*|{|m*C,e*<space|0.17em>m*C*<space|0.17em><around|(|2/\<rho\><rprime|'>|)><rsup|m>|}>>.
    Then

    <\equation*>
      <around*|\||A<rsub|n>-<big|sum><rsub|k=max
      <around|(|0,-n|)>><rsup|K>\<Lambda\><rsub|k><around|(|c|)>*b<rsub|n+k>|\|><space|0.27em>\<le\><space|0.27em>B*<space|0.17em>\<rho\><rprime|'><rsup|-n>*<space|0.17em>2<rsup|-K>.
    </equation*>
  </proposition>

  <\proof>
    For <math|k\<ge\>K<rsub|0>>, Proposition<nbsp><reference|prop:growth>
    gives <math|<around|\||\<Lambda\><rsub|k><around|(|c|)>|\|>*\<rho\><rprime|'><rsup|-k>\<le\><around*|[|<around|(|e*<space|0.17em>m*C/k|)><rsup|1/m>/\<rho\><rprime|'>|]><rsup|k>\<le\>2<rsup|-k>>
    by the choice of <math|K<rsub|0>>. Sum the geometric tail
    <math|<big|sum><rsub|k\<gtr\>K>2<rsup|-k>\<le\>2<rsup|-K>> against
    <math|B*\<rho\><rprime|'><rsup|-n>> (absorbing
    <math|\<rho\><rprime|'><rsup|-k>\<le\>> what was already used).
  </proof>

  <\proposition>
    [Hadamard closure]<label|prop:hadamard> For
    <math|c,c<rprime|'>\<in\><C><rsup|m>>, the Hadamard product sequence
    <math|<around*|(|\<Lambda\><rsub|N><around|(|c|)>*\<Lambda\><rsub|N><around|(|c<rprime|'>|)>|)><rsub|N>>
    is P-recursive (holonomic).
  </proposition>

  <\proof>
    Each factor satisfies the polynomial-coefficient recurrence
    <eqref|eq:universal>; the Hadamard product of P-recursive sequences is
    P-recursive <em|(Stanley <cite|StanleyDF>; Lipshitz <cite|Lipshitz>)>.
  </proof>

  <section|Classical specializations><label|sec:classical>

  The identifications below are exact and exhaustive in the stated cases; no
  claim is made that a general principal part of order <math|m\<ge\>3>
  reduces to a single classical one-variable function. The general case is
  the algebra itself.

  <\theorem>
    [<math|m=1>: modified Bessel]<label|thm:bessel> For <math|b,c\<in\><C>>,
    the Laurent expansion of <math|e<rsup|c/w+b*w>> on
    <math|<C><rsup|\<times\>>> has coefficients

    <\equation*>
      <around|[|w<rsup|-n>|]>*<space|0.17em>e<rsup|c/w+b*w>=<big|sum><rsub|j\<ge\>0><frac|c<rsup|<space|0.17em>j+n>*b<rsup|<space|0.17em>j>|j!<space|0.17em><around|(|j+n|)>!>*<space|2em><around|(|n\<ge\>0|)>,<space|2em><around|[|w<rsup|n>|]>*<space|0.17em>e<rsup|c/w+b*w>=<text|same
      with >b\<leftrightarrow\>c.
    </equation*>

    For any determination <math|<sqrt|b*c>> of a square root of <math|b*c>
    with <math|<around|(|<sqrt|b*c>|)><rsup|2>=b*c>, these equal
    <math|<around|(|c/b|)><rsup|n/2>*I<rsub|n>*<around|(|2*<sqrt|b*c>|)>>
    (interpreting <math|<around|(|c/b|)><rsup|n/2>\<assign\>c<rsup|n>*<around|(|b*c|)><rsup|-n/2>>
    with the same determination), where <math|I<rsub|n><around|(|x|)>=<big|sum><rsub|j\<ge\>0><around|(|x/2|)><rsup|2*j+n>/<around|(|j!<space|0.17em><around|(|j+n|)>!|)>>.
    Setting <math|b=c=x/2>, <math|w=1/t> recovers the classical generating
    identity <math|exp <around*|(|<tfrac|x|2><around|(|t+1/t|)>|)>=<big|sum><rsub|n\<in\><Z>>I<rsub|n><around|(|x|)>*t<rsup|n>>.
  </theorem>

  <\proof>
    Here <math|\<Lambda\><rsub|k><around|(|c|)>=c<rsup|k>/k>! and
    <math|b<rsub|l>=b<rsup|l>/l>!; Theorem<nbsp><reference|thm:module> with
    <math|r<rsub|a>=\<infty\>> gives <math|A<rsub|-n>=<big|sum><rsub|k\<ge\>n><frac|c<rsup|k>|k!>*<frac|b<rsup|k-n>|<around|(|k-n|)>!>>;
    substitute <math|k=j+n>. The Bessel form is the same series regrouped:
    <math|<big|sum><rsub|j><around|(|b*c|)><rsup|j>/<around|(|j!<around|(|j+n|)>!|)>=<around|(|b*c|)><rsup|-n/2>*I<rsub|n>*<around|(|2*<sqrt|b*c>|)>>
    term by term, both sides being unambiguous power series in <math|b*c>
    once the prefactor convention is fixed. Symmetry <math|w\<mapsto\>1/w>
    exchanges <math|b,c> and <math|n\<mapsto\>-n>, giving the positive
    coefficients and, with <math|I<rsub|-n>=I<rsub|n>>, the classical
    identity <em|(cf. <cite-detail|DLMF|10.35.1>)>.
  </proof>

  <\theorem>
    [<math|m=2>: Hermite-type polynomials]<label|thm:hermite> Define
    <math|<math-bf|H><rsub|N><around|(|x,y|)>> by <math|exp
    <around|(|x*t+y*t<rsup|2>|)>=<big|sum><rsub|N\<ge\>0><math-bf|H><rsub|N><around|(|x,y|)>*<space|0.17em>t<rsup|N>/N!>
    <em|(the Hermite\UKamp� de F�riet polynomials <cite|Appell>)>. Then for
    <math|m=2>,

    <\equation*>
      \<Lambda\><rsub|N>*<around|(|c<rsub|1>,c<rsub|2>|)>=<frac|<math-bf|H><rsub|N><around|(|c<rsub|1>,c<rsub|2>|)>|N!>=<big|sum><rsub|0\<le\>k\<le\>N/2><frac|c<rsub|1><rsup|<space|0.17em>N-2*k>*c<rsub|2><rsup|<space|0.17em>k>|<around|(|N-2*k|)>!<space|0.17em>k!>,
    </equation*>

    and <math|<math-bf|H><rsub|N><around|(|x,y|)>=<around|(|<math-up|i><sqrt|y>|)><rsup|<space|0.17em>N>*H<rsub|N>*<space|-0.17em><around*|(|x/<around|(|2<math-up|i><sqrt|y>|)>|)>>
    for any fixed square root, where <math|H<rsub|N>> is the classical
    (physicists') Hermite polynomial.
  </theorem>

  <\proof>
    The first two equalities are Definition<nbsp><reference|def:E> for
    <math|m=2> and Lemma<nbsp><reference|lem:partition>. The classical
    relation follows by comparing <math|exp <around|(|x*t+y*t<rsup|2>|)>>
    with <math|exp <around|(|2*X*s-s<rsup|2>|)>=<big|sum>H<rsub|N><around|(|X|)>*s<rsup|N>/N!>
    under <math|s=<math-up|i><sqrt|y>*<space|0.17em>t>,
    <math|X=x/<around|(|2<math-up|i><sqrt|y>|)>>; both sides are polynomial
    identities in <math|<around|(|x,y<rsup|1/2>|)>>, hence hold for every
    branch choice consistently.
  </proof>

  <\theorem>
    [Single-term pole of order <math|m>: Wright functions]<label|thm:wright>
    Let <math|\<phi\><around|(|\<rho\>,\<beta\>;\<zeta\>|)>\<assign\><big|sum><rsub|k\<ge\>0><dfrac|\<zeta\><rsup|k>|k!<space|0.17em>\<Gamma\>*<around|(|\<rho\>*k+\<beta\>|)>>>
    be Wright's generalized Bessel function <em|(Wright <cite|Wright1933>;
    Kilbas\USaigo <cite-detail|KilbasSaigo|�1.11>)>, entire in
    <math|\<zeta\>> for <math|\<rho\>\<gtr\>-1>. Then for
    <math|b\<in\><C><rsup|\<times\>>>, <math|c\<in\><C>>, <math|n\<in\><Z>>,

    <\equation*>
      <around|[|w<rsup|-n>|]>*<space|0.27em>exp
      <around*|(|<frac|c|w<rsup|m>>+b*w|)>=b<rsup|-n>*<space|0.17em>\<phi\><around*|(|m,<space|0.17em>1-n;<space|0.17em>c*<space|0.17em>b<rsup|<space|0.17em>m>|)>.
    </equation*>
  </theorem>

  <\proof>
    Here <math|\<Lambda\><rsub|m*k>=c<rsup|k>/k>! and
    <math|\<Lambda\><rsub|N>=0> otherwise, <math|b<rsub|l>=b<rsup|l>/l>!
    <math|<around|(|l\<ge\>0|)>>, <math|b<rsub|l>\<assign\>0>
    <math|<around|(|l\<less\>0|)>>. Theorem<nbsp><reference|thm:module>:
    <math|A<rsub|-n>=<big|sum><rsub|k><frac|c<rsup|k>|k!>*<space|0.17em><frac|b<rsup|<space|0.17em>m*k-n>|<around|(|m*k-n|)>!>>
    over <math|k> with <math|m*k\<ge\>n>. Since
    <math|1/\<Gamma\><around|(|\<ell\>|)>=0> for
    <math|\<ell\>\<in\><Z><rsub|\<le\>0>>, the constraint is absorbed by
    writing <math|<around|(|m*k-n|)>!=\<Gamma\>*<around|(|m*k-n+1|)>=\<Gamma\>*<around|(|m*k+<around|(|1-n|)>|)>>,
    and the full sum over <math|k\<ge\>0> equals
    <math|b<rsup|-n>*<big|sum><rsub|k><around|(|c*b<rsup|m>|)><rsup|k>/<around*|(|k!<space|0.17em>\<Gamma\>*<around|(|m*k+1-n|)>|)>>.
  </proof>

  <\remark>
    [Scope of special-function reductions]<label|rem:scope>
    Theorems<nbsp><reference|thm:bessel>\U<reference|thm:wright> exhaust the
    cases in which a single classical family arises from a natural
    one-parameter entire factor: <math|m=1>, <math|m=2>, and pure top-order
    poles. For a general principal part with <math|m\<ge\>3> and mixed
    <math|c<rsub|j>>, the coefficient <math|A<rsub|n>> is the genuine
    multivariate partition sum of Theorem<nbsp><reference|thm:module>, i.e.
    an element of the <math|<CA><rsub|m>>-module, and we do not assert any
    reduction to Wright, Fox\UWright, or Fox <math|H> functions of one
    variable. What replaces such a reduction is the structure theory of
    Sections<nbsp><reference|sec:hopf>\U<reference|sec:combinatorics>
    together with the holonomy of Section<nbsp><reference|sec:holonomy>:
    closed recurrences, not closed one-variable forms.
  </remark>

  <section|Holonomy><label|sec:holonomy>

  <\theorem>
    [D-finiteness and the coefficient recurrence]<label|thm:holonomy> Let
    <math|R\<in\><C><around|(|z|)>> be nonconstant, write
    <math|R<rprime|'>=U/V> in lowest terms with
    <math|U,V\<in\><C><around|[|z|]>>, and let <math|a> be a pole of <math|R>
    of order <math|m\<ge\>1>. Set <math|<wide|V|~><around|(|w|)>\<assign\>V*<around|(|a+w|)>=<big|sum><rsub|p=0><rsup|d<rsub|V>>V<rsub|p>*w<rsup|p>>,
    <math|<wide|U|~><around|(|w|)>\<assign\>U*<around|(|a+w|)>=<big|sum><rsub|p=0><rsup|d<rsub|U>>U<rsub|p>*w<rsup|p>>.
    Then <math|y=e<rsup|R>> satisfies the first-order equation
    <math|V*y<rprime|'>-U*y=0> over <math|<C><around|(|z|)>> (in particular
    <math|y> is D-finite), and the full two-sided Laurent coefficient
    sequence <math|<around|(|A<rsub|n>|)><rsub|n\<in\><Z>>> of <math|y> at
    <math|a> (Theorem<nbsp><reference|thm:module>) satisfies, for every
    <math|s\<in\><Z>>,

    <\equation>
      <label|eq:Prec><big|sum><rsub|p=0><rsup|d<rsub|V>>V<rsub|p>*<space|0.17em><around|(|s+1-p|)>*<space|0.17em>A<rsub|s+1-p><space|0.27em>=<space|0.27em><big|sum><rsub|p=0><rsup|d<rsub|U>>U<rsub|p>*<space|0.17em>A<rsub|s-p>.
    </equation>

    This is a linear recurrence with coefficients affine in <math|s>, of
    order at most <math|max <around|(|d<rsub|V>,<space|0.17em>d<rsub|U>+1|)>>,
    valid in both directions <math|n\<to\>\<pm\>\<infty\>>. Moreover
    <math|w<rsup|m+1>\<mid\><wide|V|~>> (indeed
    <math|<ord><rsub|w=0>R<rprime|'>=-<around|(|m+1|)>> forces
    <math|<ord><wide|V|~>-<ord><wide|U|~>=m+1>), and in the pure-pole case
    <math|R=\<Pi\>> the recurrence <eqref|eq:Prec> reduces exactly to the
    universal recurrence <eqref|eq:universal>.
  </theorem>

  <\proof>
    <math|y<rprime|'>=R<rprime|'>*y> is immediate; clearing denominators
    gives <math|V*y<rprime|'>=U*y> with polynomial coefficients, which is the
    definition of D-finiteness for <math|y> <em|(Stanley <cite|StanleyDF>)>.
    On <math|0\<less\><around|\||w|\|>\<less\>r<rsub|a>> insert
    <math|y=<big|sum><rsub|n>A<rsub|n>*w<rsup|n>> (absolutely and locally
    uniformly convergent, so termwise differentiation and Cauchy products
    with the polynomials <math|<wide|V|~>,<wide|U|~>> are valid):
    <math|<big|sum><rsub|p>V<rsub|p>*w<rsup|p>*<big|sum><rsub|n>n*A<rsub|n>*w<rsup|n-1>=<big|sum><rsub|p>U<rsub|p>*w<rsup|p>*<big|sum><rsub|n>A<rsub|n>*w<rsup|n>>.
    Equate coefficients of <math|w<rsup|s>>:
    <math|<big|sum><rsub|p>V<rsub|p>*<around|(|s+1-p|)>*A<rsub|s+1-p>=<big|sum><rsub|p>U<rsub|p>*A<rsub|s-p>>,
    which is <eqref|eq:Prec>. The order statement counts the index span. The
    valuation claim: near <math|a>, <math|R<rprime|'>=-m*c<rsub|m>*w<rsup|-<around|(|m+1|)>>+O<around|(|w<rsup|-m>|)>>
    with <math|c<rsub|m>\<ne\>0>, so <math|<ord><rsub|w=0><around|(|<wide|U|~>/<wide|V|~>|)>=-<around|(|m+1|)>>;
    since <math|gcd <around|(|U,V|)>=1>, at most one of
    <math|<wide|U|~><around|(|0|)>,<wide|V|~><around|(|0|)>> vanishes,
    forcing <math|<wide|U|~><around|(|0|)>\<ne\>0> and
    <math|w<rsup|m+1><space|0.17em>\<\|\|\><space|0.17em><wide|V|~>>. Pure
    pole: <math|R=\<Pi\>> gives <math|R<rprime|'>=-<big|sum><rsub|j>j*c<rsub|j>*w<rsup|-j-1>=<wide|U|~>/<wide|V|~>>
    with <math|<wide|V|~>=w<rsup|m+1>>, <math|<wide|U|~>=-<big|sum><rsub|j=1><rsup|m>j*c<rsub|j>*w<rsup|<space|0.17em>m-j>>;
    then <eqref|eq:Prec> reads <math|<around|(|s-m|)>*A<rsub|s-m>=-<big|sum><rsub|j>j*c<rsub|j>*A<rsub|s-m+j>>,
    and putting <math|A<rsub|-N>=\<Lambda\><rsub|N>>, <math|s-m=-N>:
    <math|N*\<Lambda\><rsub|N>=<big|sum><rsub|j>j*c<rsub|j>*\<Lambda\><rsub|N-j>>.
  </proof>

  <\corollary>
    <label|cor:algorithmicholonomy>For fixed <math|c>, every coefficient
    sequence in the module of Theorem<nbsp><reference|thm:module> is
    P-recursive with an explicitly computable recurrence <eqref|eq:Prec>;
    creative-telescoping toolchains apply directly <em|(Kauers\UPaule
    <cite|KauersPaule>; Koutschan <cite|Koutschan>)>.
  </corollary>

  <section|Axiomatic characterization><label|sec:axioms>

  Following the constructive development, we now characterize what has been
  built. Two statements are proved: an <em|initiality> theorem in the
  category naturally attached to the universal recurrence, and a
  <em|recognition> theorem identifying <math|<CA><rsub|m>> among graded Hopf
  algebras. The hypotheses of the recognition theorem are shown to be
  independent.

  <subsection|Initiality>

  <\definition>
    [The category <math|\<cal-C\><rsub|m>>]<label|def:category> Objects of
    <math|\<cal-C\><rsub|m>> are triples <math|<around*|(|A,\<gamma\>=<around|(|\<gamma\><rsub|1>,\<ldots\>,\<gamma\><rsub|m>|)>\<in\>A<rsup|m>,<around|(|\<lambda\><rsub|N>|)><rsub|N\<ge\>0>|)>>
    where <math|A> is a commutative unital <math|<C>>-algebra,
    <math|\<lambda\><rsub|0>=1>, and

    <\equation>
      <label|eq:axiomrec>N*\<lambda\><rsub|N>=<big|sum><rsub|j=1><rsup|min
      <around|(|m,N|)>>j*<space|0.17em>\<gamma\><rsub|j>*<space|0.17em>\<lambda\><rsub|N-j>*<space|2em><around|(|N\<ge\>1|)>.
    </equation>

    A morphism <math|<around|(|A,\<gamma\>,\<lambda\>|)>\<to\><around|(|A<rprime|'>,\<gamma\><rprime|'>,\<lambda\><rprime|'>|)>>
    is a unital <math|<C>>-algebra homomorphism
    <math|\<varphi\>:A\<to\>A<rprime|'>> with
    <math|\<varphi\><around|(|\<gamma\><rsub|j>|)>=\<gamma\><rprime|'><rsub|j>>
    for all <math|j> and <math|\<varphi\><around|(|\<lambda\><rsub|N>|)>=\<lambda\><rprime|'><rsub|N>>
    for all <math|N>.
  </definition>

  <\theorem>
    [Initiality]<label|thm:initial> <math|<around|(|<CA><rsub|m>,<space|0.17em>c,<space|0.17em>\<Lambda\>|)>>
    is an initial object of <math|\<cal-C\><rsub|m>>: for every object
    <math|<around|(|A,\<gamma\>,\<lambda\>|)>> there is exactly one morphism
    <math|\<varphi\>:<around|(|<CA><rsub|m>,c,\<Lambda\>|)>\<to\><around|(|A,\<gamma\>,\<lambda\>|)>>.
  </theorem>

  <\proof>
    <em|Existence.> Since <math|<CA><rsub|m>> is the free commutative
    <math|<C>>-algebra on <math|c<rsub|1>,\<ldots\>,c<rsub|m>>, there is a
    unique algebra map <math|\<varphi\>> with
    <math|\<varphi\><around|(|c<rsub|j>|)>=\<gamma\><rsub|j>>. We claim
    <math|\<varphi\><around|(|\<Lambda\><rsub|N>|)>=\<lambda\><rsub|N>> for
    all <math|N>, by strong induction: true at <math|N=0>
    (<math|\<Lambda\><rsub|0>=1\<mapsto\>1=\<lambda\><rsub|0>>); for
    <math|N\<ge\>1>, since <math|N> is invertible in the <math|<C>>-algebra
    <math|A>,

    <\equation*>
      \<varphi\><around|(|\<Lambda\><rsub|N>|)>=\<varphi\><around*|(|<tfrac|1|N><big|sum><rsub|j>j*c<rsub|j>*\<Lambda\><rsub|N-j>|)>=<tfrac|1|N><big|sum><rsub|j>j*<space|0.17em>\<gamma\><rsub|j>*<space|0.17em>\<varphi\><around|(|\<Lambda\><rsub|N-j>|)>=<tfrac|1|N><big|sum><rsub|j>j*<space|0.17em>\<gamma\><rsub|j>*<space|0.17em>\<lambda\><rsub|N-j>=\<lambda\><rsub|N>,
    </equation*>

    using Lemma<nbsp><reference|lem:recurrence> in <math|<CA><rsub|m>>, the
    inductive hypothesis, and <eqref|eq:axiomrec> in <math|A>.
    <em|Uniqueness.> Any morphism must send
    <math|c<rsub|j>\<mapsto\>\<gamma\><rsub|j>>, and an algebra map out of a
    polynomial ring is determined by the images of the variables; the
    <math|\<lambda\>>-compatibility is then automatic by the computation just
    made, so no further freedom exists.
  </proof>

  <\remark>
    <label|rem:initialmeaning>Equation <eqref|eq:axiomrec> determines
    <math|<around|(|\<lambda\><rsub|N>|)>> uniquely from <math|\<gamma\>> in
    any <math|<C>>-algebra; so <math|\<cal-C\><rsub|m>> is equivalent to the
    category of <math|m>-pointed commutative <math|<C>>-algebras, and
    initiality is exactly the freeness of <math|<CA><rsub|m>> <em|together
    with> the verification that the distinguished sequence transports along
    the unique map. The content is modest but the statement is now a theorem
    with a defined category, defined morphisms, and a proof, rather than an
    assertion.
  </remark>

  <subsection|Recognition>

  <\theorem>
    [Recognition]<label|thm:recognition> Let <math|A> be a graded connected
    commutative <math|<C>>-Hopf algebra with a sequence
    <math|\<lambda\><rsub|N>\<in\>A<rsub|N>>, <math|\<lambda\><rsub|0>=1>,
    satisfying:

    <\enumerate>
      <item*|<with|font-shape|right|(G)>>the <math|\<lambda\><rsub|N>>
      generate <math|A> as an algebra;

      <item*|<with|font-shape|right|(D)>><math|\<Delta\>*\<lambda\><rsub|N>=<big|sum><rsub|i=0><rsup|N>\<lambda\><rsub|i>\<otimes\>\<lambda\><rsub|N-i>>
      for all <math|N> <em|(divided-power sequence)>;

      <item*|<with|font-shape|right|(T)>><math|<Prim><around|(|A|)><rsub|j>=0>
      for all <math|j\<gtr\>m>;

      <item*|<with|font-shape|right|(I)>><math|\<lambda\><rsub|1>,\<ldots\>,\<lambda\><rsub|m>>
      are algebraically independent over <math|<C>>.
    </enumerate>

    Then there is a unique isomorphism of graded Hopf algebras
    <math|\<varphi\>:<CA><rsub|m>\<to\>A> with
    <math|\<varphi\><around|(|\<Lambda\><rsub|N>|)>=\<lambda\><rsub|N>> for
    all <math|N>; and <math|\<varphi\><around|(|c<rsub|j>|)>> is the
    weight-<math|j> coefficient of <math|log
    <big|sum><rsub|N>\<lambda\><rsub|N>*t<rsup|N>>.
  </theorem>

  <\proof>
    Set <math|\<Lambda\><rsup|A><around|(|t|)>\<assign\><big|sum><rsub|N\<ge\>0>\<lambda\><rsub|N>*t<rsup|N>\<in\>A<around|[|<around|[|t|]>|]>>.
    By (D), <math|\<Lambda\><rsup|A><around|(|t|)>> is group-like in the
    completed Hopf algebra <math|A<around|[|<around|[|t|]>|]>> (coproduct and
    counit extended <math|t>-adically): <math|\<Delta\>*\<Lambda\><rsup|A>=\<Lambda\><rsup|A>\<otimes\>\<Lambda\><rsup|A>>
    read in <math|<around|(|A\<otimes\>A|)><around|[|<around|[|t|]>|]>>,
    <math|\<varepsilon\>*\<Lambda\><rsup|A>=1>. Since
    <math|\<Lambda\><rsup|A><around|(|t|)>-1\<in\>t*A<around|[|<around|[|t|]>|]>>,
    the logarithm <math|\<ell\><around|(|t|)>\<assign\>log
    \<Lambda\><rsup|A><around|(|t|)>=<big|sum><rsub|j\<ge\>1>\<gamma\><rsub|j>*t<rsup|j>>
    is defined, and

    <\equation*>
      \<Delta\>*\<ell\>=log <around*|(|<around|(|\<Lambda\><rsup|A>\<otimes\>1|)>*<around|(|1\<otimes\>\<Lambda\><rsup|A>|)>|)>=log
      <around|(|\<Lambda\><rsup|A>\<otimes\>1|)>+log
      <around|(|1\<otimes\>\<Lambda\><rsup|A>|)>=\<ell\>\<otimes\>1+1\<otimes\>\<ell\>,
    </equation*>

    the middle equality because the two arguments commute. Hence every
    <math|\<gamma\><rsub|j>> is primitive; also
    <math|\<gamma\><rsub|j>\<in\>A<rsub|j>> because
    <math|\<lambda\><rsub|N>\<in\>A<rsub|N>> and <math|log> preserves the
    grading of coefficients. By (T), <math|\<gamma\><rsub|j>=0> for
    <math|j\<gtr\>m>, so

    <\equation*>
      \<Lambda\><rsup|A><around|(|t|)>=exp
      <around*|(|<big|sum><rsub|j=1><rsup|m>\<gamma\><rsub|j>*t<rsup|j>|)>,<space|2em><text|i.e.><space|2em>\<lambda\><rsub|N>=\<Lambda\><rsub|N>*<around|(|\<gamma\><rsub|1>,\<ldots\>,\<gamma\><rsub|m>|)>.
    </equation*>

    Define the algebra map <math|\<varphi\>:<CA><rsub|m>\<to\>A> by
    <math|\<varphi\><around|(|c<rsub|j>|)>=\<gamma\><rsub|j>>; then
    <math|\<varphi\><around|(|\<Lambda\><rsub|N>|)>=\<lambda\><rsub|N>> by
    the displayed identity (or by Theorem<nbsp><reference|thm:initial>, since
    <math|<around|(|A,\<gamma\>,\<lambda\>|)>\<in\>\<cal-C\><rsub|m>>: apply
    <math|d/d*t> to <math|\<Lambda\><rsup|A>=exp
    <around|(|<big|sum>\<gamma\><rsub|j>*t<rsup|j>|)>> as in
    Lemma<nbsp><reference|lem:recurrence>). <math|\<varphi\>> is a morphism
    of graded Hopf algebras: it preserves grading
    (<math|\<gamma\><rsub|j>\<in\>A<rsub|j>>) and sends the primitive
    generators <math|c<rsub|j>> to primitives, which determines compatibility
    with <math|\<Delta\>>, <math|\<varepsilon\>>, <math|S> on all of
    <math|<CA><rsub|m>> since these are (anti)algebra maps.
    <em|Surjectivity:> the image contains every <math|\<lambda\><rsub|N>>,
    which generate by (G). <em|Injectivity:>
    <math|\<lambda\><rsub|1>,\<ldots\>,\<lambda\><rsub|m>> are polynomials in
    <math|\<gamma\><rsub|1>,\<ldots\>,\<gamma\><rsub|m>> and conversely (the
    triangularity of Theorem<nbsp><reference|thm:generation> transports along
    <math|\<varphi\>>), so (I) is equivalent to algebraic independence of
    <math|\<gamma\><rsub|1>,\<ldots\>,\<gamma\><rsub|m>>; an algebra map from
    <math|<C><around|[|c<rsub|1>,\<ldots\>,c<rsub|m>|]>> sending the
    variables to algebraically independent elements has zero kernel.
    <em|Uniqueness:> any graded Hopf map <math|\<psi\>> with
    <math|\<psi\><around|(|\<Lambda\><rsub|N>|)>=\<lambda\><rsub|N>>
    satisfies <math|\<psi\><around*|(|log
    E<around|(|t|)>|)>=\<ell\><around|(|t|)>> coefficient-wise, i.e.
    <math|\<psi\><around|(|c<rsub|j>|)>=\<gamma\><rsub|j>>, and is therefore
    <math|\<varphi\>>.
  </proof>

  <subsection|Independence of the hypotheses>

  <\proposition>
    <label|prop:independence>Each of <with|font-shape|right|(G), (D), (T),
    (I)> is independent of the remaining three: for each hypothesis there is
    a triple <math|<around|(|A,<around|(|\<lambda\><rsub|N>|)>|)>> satisfying
    the other three but not isomorphic to
    <math|<around|(|<CA><rsub|m>,<around|(|\<Lambda\><rsub|N>|)>|)>> in the
    sense of Theorem<nbsp><reference|thm:recognition>.
  </proposition>

  <\proof>
    Fix <math|m\<ge\>2> (for <math|m=1> replace the (I)-example by
    <math|A=<C>>, <math|\<lambda\><rsub|N>=\<delta\><rsub|N,0>>, which
    satisfies (G),(D),(T) but not (I)).

    <em|Drop (G).> <math|A=<CA><rsub|m><around|[|y|]>>, <math|y> primitive of
    weight <math|1>, with <math|\<lambda\><rsub|N>\<assign\>\<Lambda\><rsub|N>>.
    (D) holds as before; <math|<Prim><around|(|A|)><rsub|j>=<C>c<rsub|j>> for
    <math|2\<le\>j\<le\>m>, <math|<Prim><around|(|A|)><rsub|1>=<C>c<rsub|1>\<oplus\><C>y>,
    and <math|0> for <math|j\<gtr\>m>, so (T) holds; (I) holds. But the
    <math|\<lambda\><rsub|N>> do not generate (<math|y> is missing), and
    <math|A\<ncong\><CA><rsub|m>> carrying the sequences (Hilbert series
    differ).

    <em|Drop (I).> <math|A=<CA><rsub|m>/<around|(|c<rsub|m>|)>\<cong\><CA><rsub|m-1>>
    with <math|\<lambda\><rsub|N>\<assign\>> image of
    <math|\<Lambda\><rsub|N>>, i.e. <math|\<Lambda\><rsub|N>*<around|(|c<rsub|1>,\<ldots\>,c<rsub|m-1>,0|)>>.
    <math|<around|(|c<rsub|m>|)>> is a Hopf ideal (generated by a primitive),
    so <math|A> is a graded connected Hopf algebra and (D) descends; (G)
    descends; (T) holds a fortiori since <math|<Prim><around|(|A|)><rsub|j>=0>
    for <math|j\<ge\>m>. But <math|\<lambda\><rsub|1>,\<ldots\>,\<lambda\><rsub|m>>
    satisfy the algebraic relation expressing <math|\<lambda\><rsub|m>>
    through <math|\<lambda\><rsub|1>,\<ldots\>,\<lambda\><rsub|m-1>> (set
    <math|c<rsub|m>=0> in <math|\<Lambda\><rsub|m>=c<rsub|m>+q<rsub|m><around|(|c<rsub|1>,\<ldots\>,c<rsub|m-1>|)>>),
    and <math|A\<ncong\><CA><rsub|m>> (transcendence degree <math|m-1> vs.
    <math|m>).

    <em|Drop (T).> <math|A=<CA><rsub|m+1>> with its own sequence
    <math|\<lambda\><rsub|N>\<assign\>\<Lambda\><rsup|<around|(|m+1|)>><rsub|N>>.
    (G), (D), (I) hold (Theorems <reference|thm:generation>,
    <reference|thm:dividedpower>; independence of the first <math|m> among
    the first <math|m+1>). <math|<Prim><around|(|A|)><rsub|m+1>=<C>c<rsub|m+1>\<ne\>0>,
    and no isomorphism onto <math|<CA><rsub|m>> exists (transcendence
    degree).

    <em|Drop (D).> <math|A=<CA><rsub|m>> as a graded Hopf algebra (so (T) is
    unchanged), with the perturbed sequence
    <math|\<lambda\><rprime|'><rsub|N>\<assign\>\<Lambda\><rsub|N>> for
    <math|N\<ne\>2> and <math|\<lambda\><rprime|'><rsub|2>\<assign\>\<Lambda\><rsub|2>+c<rsub|1><rsup|2>>.
    (G): <math|\<lambda\><rprime|'><rsub|1>=c<rsub|1>> and
    <math|\<lambda\><rprime|'><rsub|2>-<tfrac|3|2>\<lambda\><rsub|1><rprime|'><rsup|2>=c<rsub|2>>
    recover the generators, and inductively all <math|c<rsub|j>>; (I):
    <math|\<lambda\><rprime|'><rsub|1>,\<ldots\>,\<lambda\><rprime|'><rsub|m>>
    differ from <math|\<Lambda\><rsub|1>,\<ldots\>,\<Lambda\><rsub|m>> by a
    weight-preserving triangular polynomial change, preserving independence.
    But

    <\equation*>
      \<Delta\>*\<lambda\><rprime|'><rsub|2>-<big|sum><rsub|i=0><rsup|2>\<lambda\><rprime|'><rsub|i>\<otimes\>\<lambda\><rprime|'><rsub|2-i>=\<Delta\>*c<rsub|1><rsup|2>-<around|(|c<rsub|1><rsup|2>\<otimes\>1+1\<otimes\>c<rsub|1><rsup|2>|)>=2*<space|0.17em>c<rsub|1>\<otimes\>c<rsub|1>\<neq\>0,
    </equation*>

    so (D) fails; and no isomorphism <math|\<varphi\>> with
    <math|\<varphi\><around|(|\<Lambda\><rsub|N>|)>=\<lambda\><rprime|'><rsub|N>>
    can exist, since a Hopf map would transport identity (D), which holds for
    <math|<around|(|\<Lambda\><rsub|N>|)>> and fails for
    <math|<around|(|\<lambda\><rprime|'><rsub|N>|)>>.
  </proof>

  <\remark>
    <label|rem:axiomsdowork>The axioms now do work in the promised sense:
    (D)+(T) alone force the generating series into the exponential normal
    form <math|exp <around|(|<big|sum><rsub|j\<le\>m>\<gamma\><rsub|j>*t<rsup|j>|)>>
    (proof of Theorem<nbsp><reference|thm:recognition>), i.e. they
    <em|derive> the universal recurrence rather than postulate it; (G)+(I)
    then pin the algebra. Grading, derivations
    (Lemma<nbsp><reference|lem:derivation>, recovered as
    <math|\<partial\><rsub|\<gamma\><rsub|j>>>), and the product/coproduct
    formulas are theorems from the axioms, and the Laurent construction of
    Section<nbsp><reference|sec:model> is a model by
    Theorem<nbsp><reference|thm:analyticmodel>.
  </remark>

  <section|Application: rough Heston pricing in the coefficient
  algebra><label|sec:pricing>

  We use the notation of the companion papers <cite|CrowleyCGF|CrowleyCW>:
  the rough Heston characteristic function is
  <math|\<varphi\><around|(|a,t|)>=e<rsup|L<around|(|a,t|)>>> with
  <math|L<around|(|a,t|)>=t*<space|0.17em>G<around|(|a,x|)>>,
  <math|x=t<rsup|\<alpha\>>>, <math|\<alpha\>=H+<tfrac|1|2>\<in\><around|(|0,1|)>>;
  <math|G<around|(|a,\<cdot\>|)>> is given by the neighboring-pair series
  with coefficients <math|g<rsub|j>\<in\><C><around|[|a|]>>
  <cite-detail|CrowleyCGF|Thm.<nbsp>1>; and the diagonal Pad� approximant
  <math|G<rsub|M>=A<rsub|M>/B<rsub|M>> (<math|deg A<rsub|M>=deg B<rsub|M>=M>)
  is produced exactly in <math|<C><around|[|a|]>> by the polynomial
  Chebyshev\UWheeler recurrence <cite-detail|CrowleyCGF|Thm.<nbsp>2>,
  <cite|CrowleyCW>, with Stahl convergence on the physical ray
  <cite-detail|CrowleyCGF|Thm.<nbsp>3>. Define

  <\equation*>
    \<varphi\><rsub|M><around|(|a,t|)>\<assign\>exp
    <around*|(|t*<space|0.17em>G<rsub|M><around|(|a,t<rsup|\<alpha\>>|)>|)>.
  </equation*>

  For fixed <math|a> and <math|t>, <math|\<varphi\><rsub|M>> is the
  exponential of a rational function of <math|x>: exactly the object of this
  paper.

  <\theorem>
    [Local data of <math|\<varphi\><rsub|M>> in the coefficient
    algebra]<label|thm:localdata> Fix <math|a> and <math|M>, and let
    <math|\<xi\><rsub|1>,\<ldots\>,\<xi\><rsub|r>> be the distinct zeros of
    <math|B<rsub|M>*<around|(|a,\<cdot\>|)>> in <math|<C>>, with
    multiplicities <math|\<mu\><rsub|1>,\<ldots\>,\<mu\><rsub|r>>, none lying
    on <math|<around|[|0,x<rsup|\<ast\>>|]>> where
    <math|x<rsup|\<ast\>>=t<rsup|\<alpha\>>> for the maturity range of
    interest <em|(guaranteed for <math|a> on the pricing contour by the
    real-ray theorem <cite-detail|CrowleyCGF|Thm.<nbsp>3> for all <math|M>
    large)>. Write the exact partial fraction decomposition

    <\equation*>
      t*<space|0.17em>G<rsub|M><around|(|a,x|)>=\<pi\><around|(|x|)>+<big|sum><rsub|i=1><rsup|r><big|sum><rsub|j=1><rsup|\<mu\><rsub|i>><frac|c<rsup|<around|(|i|)>><rsub|j>|<around|(|x-\<xi\><rsub|i>|)><rsup|j>>,<space|2em>\<pi\>\<in\><C><around|[|x|]>,deg
      \<pi\>\<le\>deg A<rsub|M>-deg B<rsub|M>+<text|(polynomial part)>,
    </equation*>

    all data computable exactly from <math|<around|(|A<rsub|M>,B<rsub|M>|)>>
    by division and residue extraction in
    <math|<C><around|[|a|]><around|(|x|)>>. Then:

    <\enumerate>
      <item><math|\<varphi\><rsub|M><around|(|a,\<cdot\>|)>> is analytic on a
      neighborhood of <math|<around|[|0,x<rsup|\<ast\>>|]>> in the
      <math|x>-plane and is evaluated there by direct composition
      <math|exp\<circ\><space|0.17em><around|(|t*<space|0.17em>A<rsub|M>/B<rsub|M>|)>>;
      no expansion is needed on the ray and no essential singularity is
      approached.

      <item>Around each <math|\<xi\><rsub|i>>, with <math|w=x-\<xi\><rsub|i>>
      and <math|H<rsub|i>\<assign\>t*G<rsub|M>-<big|sum><rsub|j>c<rsup|<around|(|i|)>><rsub|j>*w<rsup|-j>>
      analytic on <math|<around|\||w|\|>\<less\>r<rsub|i>>
      (<math|r<rsub|i>=min<rsub|i<rprime|'>\<ne\>i><around|\||\<xi\><rsub|i<rprime|'>>-\<xi\><rsub|i>|\|>>),

      <\equation>
        \<varphi\><rsub|M>=<around*|(|<big|sum><rsub|N\<ge\>0>\<Lambda\><rsub|N><around*|(|c<rsup|<around|(|i|)>>|)>*w<rsup|-N>|)><around*|(|<big|sum><rsub|l\<ge\>0>b<rsup|<around|(|i|)>><rsub|l>*w<rsup|<space|0.17em>l>|)>
      </equation>

      <\equation>
        A<rsup|<around|(|i|)>><rsub|n>=<big|sum><rsub|k\<ge\>max
        <around|(|0,-n|)>>\<Lambda\><rsub|k><around*|(|c<rsup|<around|(|i|)>>|)>*<space|0.17em>b<rsup|<around|(|i|)>><rsub|n+k>
      </equation>

      absolutely convergent Laurent data on
      <math|0\<less\><around|\||w|\|>\<less\>r<rsub|i>>, with truncation
      error controlled by Proposition<nbsp><reference|prop:tail> and with
      each coefficient sequence P-recursive via <eqref|eq:Prec> applied to
      <math|R=t*G<rsub|M>>.

      <item>All quantities in <with|font-shape|right|(i)\U(ii)> are algebraic
      expressions in the Chebyshev\UWheeler output and hence carry rigorous
      arb enclosures when evaluated in ball arithmetic.
    </enumerate>
  </theorem>

  <\proof>
    (i) is the zero-freeness of <math|B<rsub|M>> on the ray plus continuity
    of <math|exp>. (ii) is Theorem<nbsp><reference|thm:module> and
    Proposition<nbsp><reference|prop:tail> applied to the rational function
    <math|R<around|(|x|)>=t*G<rsub|M><around|(|a,x|)>> at the pole
    <math|\<xi\><rsub|i>> (the polynomial part <math|\<pi\>> is absorbed into
    <math|H<rsub|i>>), together with Theorem<nbsp><reference|thm:holonomy>.
    (iii) is by inspection: partial fractions, <math|\<Lambda\>>-recurrence
    <eqref|eq:universal>, and Taylor coefficients of <math|e<rsup|H<rsub|i>>>
    (themselves obtainable from <eqref|eq:Prec>) are finite exact
    recurrences.
  </proof>

  <subsection|Price convergence without contour deformation>

  We deliberately do <em|not> deform any contour across poles of
  <math|B<rsub|M>>: the poles belong to the approximant, not to
  <math|\<varphi\>>, and residue exchange across them is not justified.
  Instead the pricing contour is held fixed inside the strip of analyticity
  of the exact characteristic function, and convergence is proved by
  domination.

  <\definition>
    [Contour pricing functional]<label|def:contour> Fix maturity
    <math|T\<gtr\>0>, <math|x<rsup|\<ast\>>=T<rsup|\<alpha\>>>, log-strike
    <math|k>, and a horizontal contour <math|\<Im\>*a=\<eta\><rsub|0>>
    interior to the moment-analyticity strip of
    <math|\<varphi\><around|(|\<cdummy\>,T|)>>. A <em|Contour functional>
    is

    <\equation*>
      P<around|[|\<psi\>|]><space|0.27em>=<space|0.27em>c<rsub|0>+<big|int><rsub|<R>>K<around|(|u|)>*<space|0.17em>\<psi\>*<around|(|u+<math-up|i>\<eta\><rsub|0>|)>*<space|0.17em>d*u,<space|2em><around|\||K<around|(|u|)>|\|>\<le\><frac|C<rsub|K>|1+u<rsup|2>>,
    </equation*>

    with <math|c<rsub|0>,K> depending only on
    <math|<around|(|S<rsub|0>,K,r,T,k,\<eta\><rsub|0>|)>>; the call price is
    <math|P<around|[|\<varphi\>|(>\<cdot\>,T)>] for the standard choices of
    <math|<around|(|c<rsub|0>,K,\<eta\><rsub|0>|)>> <em|(Carr\UMadan <cite|CarrMadan>; Gil-Pelaez
    <cite|GilPelaez>)>.
  </definition>

  <\theorem>
    [Convergence of Pad� prices]<label|thm:priceconv> Assume:

    <\enumerate>
      <item>for every <math|u\<in\><R>>, <math|B<rsub|M>*<around|(|u+<math-up|i>\<eta\><rsub|0>,\<cdot\>|)>>
      is zero-free on <math|<around|[|0,x<rsup|\<ast\>>|]>> for all
      <math|M\<ge\>M<rsub|0><around|(|u|)>>, and
      <math|\<varphi\><rsub|M><around|(|u+<math-up|i>\<eta\><rsub|0>,T|)>\<to\>\<varphi\><around|(|u+<math-up|i>\<eta\><rsub|0>,T|)>>
      as <math|M\<to\>\<infty\>>;

      <item>there exists <math|\<Phi\>\<in\>L<rsup|1><around*|(|<R>,<tfrac|d*u|1+u<rsup|2>>|)>>
      and <math|M<rsub|1>> with <math|<around|\||\<varphi\><rsub|M><around|(|u+<math-up|i>\<eta\><rsub|0>,T|)>|\|>\<le\>\<Phi\><around|(|u|)>>
      for all <math|M\<ge\>M<rsub|1>> and a.e. <math|u>.
    </enumerate>

    Then <math|P<around|[|\<varphi\><rsub|M>|(>\<cdot\>,T)]\<to\>P<around|[|\<varphi\>|(>\<cdot\>,T)>]:
    Pad� prices converge to exact prices. Moreover
    <with|font-shape|right|(H1)> holds pointwise on the contour as a
    consequence of the real-ray Stahl theorem
    <cite-detail|CrowleyCGF|Thm.<nbsp>3> applied at each fixed
    <math|a=u+<math-up|i>\<eta\><rsub|0>> (convergence of
    <math|G<rsub|M><around|(|a,\<cdot\>|)>\<to\>G<around|(|a,\<cdot\>|)>> on
    a neighborhood of <math|<around|[|0,x<rsup|\<ast\>>|]>>, hence of the
    exponentials), so the only unproved input is the domination
    <with|font-shape|right|(H2)>.
  </theorem>

  <\proof>
    For <math|M\<ge\>max <around|(|M<rsub|0><around|(|u|)>,M<rsub|1>|)>> the
    integrand <math|K<around|(|u|)>*\<varphi\><rsub|M><around|(|u+<math-up|i>\<eta\><rsub|0>,T|)>>
    converges pointwise to <math|K<around|(|u|)>*\<varphi\><around|(|u+<math-up|i>\<eta\><rsub|0>,T|)>>
    by (H1) and continuity of nothing further (the integrand is the object
    itself), and is dominated by <math|C<rsub|K>*\<Phi\><around|(|u|)>/<around|(|1+u<rsup|2>|)>\<in\>L<rsup|1>>
    by (H2). Apply dominated convergence. The claim about (H1): for fixed
    <math|a> on the contour, Stahl convergence in capacity together with
    zero-freeness of <math|B<rsub|M>> on a fixed neighborhood
    <math|\<Omega\>\<supset\><around|[|0,x<rsup|\<ast\>>|]>> upgrades, by the
    standard capacity-to-uniform argument on compacts avoiding the poles
    <em|(Stahl <cite-detail|Stahl|Thm.<nbsp>1 and �6>)>, to uniform
    convergence <math|G<rsub|M>\<to\>G> on
    <math|<around|[|0,x<rsup|\<ast\>>|]>>; then <math|\<varphi\><rsub|M>=exp
    <around|(|T*G<rsub|M><around|(|a,T<rsup|\<alpha\>>|)>|)>\<to\>exp
    <around|(|T*G<around|(|a,T<rsup|\<alpha\>>|)>|)>=\<varphi\>>.
  </proof>

  <\remark>
    [Status of <with|font-shape|right|(H2)>]<label|rem:H2> (H2) is the
    precise statement of what remains open on the analytic side. It is
    implied by a uniform-in-<math|M>, integrable-in-<math|u> bound on
    <math|\<Re\>*<space|0.17em>T*<space|0.17em>G<rsub|M><around|(|u+<math-up|i>\<eta\><rsub|0>,T<rsup|\<alpha\>>|)>>
    from above; numerically, the implemented pipeline exhibits
    <math|<around|\||\<varphi\><rsub|M>|\|>> dominated by the exact
    <math|<around|\||\<varphi\>|\|>>-envelope (Gaussian-type decay in
    <math|u> from the leading cumulant <math|g<rsub|0>=v<rsub|0>*F<rsub|0>>
    <cite-detail|CrowleyCGF|Cor.<nbsp>1.1>) uniformly at machine-verified
    precision, consistently with the end-to-end validation of the pricing
    series to <math|1.1\<times\>10<rsup|-14>> at <math|M=20> (<math|40>
    coefficients) <cite|CrowleyCGF>. A proof of (H2) is Open
    Problem<nbsp><reference|prob:H2>; Theorem<nbsp><reference|thm:priceconv>
    isolates it as the exact remaining gap, replacing the invalid
    contour-deformation route.
  </remark>

  <\proposition>
    [Cumulants in the algebra]<label|prop:cumulants> Every
    <math|c<rsub|k><around|(|a|)>> and hence every
    <math|g<rsub|j><around|(|a|)>> is a polynomial in <math|a>
    <em|(<cite-detail|CrowleyCW|Lem.<nbsp>2.1--2.2>)>, and for
    <math|0\<le\>t\<less\>t<rsub|0>> with <math|t<rsub|0><rsup|\<alpha\>>>
    less than the shared radius <cite-detail|CrowleyCGF|Cor.<nbsp>1.2>
    uniformly for <math|a> in a neighborhood of <math|0>, the cumulants of
    <math|log S<rsub|T>> are the absolutely convergent series

    <\equation*>
      \<kappa\><rsub|n><around|(|t|)><space|0.27em>=<space|0.27em>\<partial\><rsub|a><rsup|n>*L<around|(|a,t|)><mid|\|><rsub|a=0><space|0.27em>=<space|0.27em>t*<big|sum><rsub|j\<ge\>0><around*|(|\<partial\><rsub|a><rsup|n>*g<rsub|j>|)><around|(|0|)>*<space|0.17em>t<rsup|\<alpha\>*j>,
    </equation*>

    with each <math|<around|(|\<partial\><rsub|a><rsup|n>*g<rsub|j>|)><around|(|0|)>>
    a finite exact expression obtained by differentiating the Gamma-ratio
    recurrence in <math|a>. Consequently the cumulant data feeding any
    transform- or expansion-based pricing representation lies in
    <math|<C>>-linear combinations of the same neighboring-pair objects,
    computed without approximation.
  </proposition>

  <\proof>
    Polynomiality in <math|a> is the coefficient-ring statement of
    <cite|CrowleyCW>. For <math|<around|\||a|\|>\<le\>\<epsilon\>> and
    <math|t\<le\>t<rsub|1>\<less\>t<rsub|0>> the series
    <math|<big|sum>g<rsub|j><around|(|a|)>*t<rsup|\<alpha\>*j>> converges
    uniformly (Cauchy majorization from the shared radius, which is locally
    uniform in <math|a> by the analyticity argument of
    <cite-detail|CrowleyCGF|Cor.<nbsp>1.2>); a locally uniformly convergent
    series of polynomials in <math|a> may be differentiated termwise in
    <math|a> any number of times (Weierstrass), giving the display. Each
    <math|\<partial\><rsub|a><rsup|n>*g<rsub|j><around|(|0|)>> is a finite
    combination of <math|\<partial\><rsub|a><rsup|n>*c<rsub|j><around|(|0|)>,\<partial\><rsub|a><rsup|n>*c<rsub|j+1><around|(|0|)>>
    via <cite-detail|CrowleyCGF|Eq.<nbsp>(2)>, and
    <math|\<partial\><rsub|a><rsup|n>*c<rsub|k><around|(|0|)>> obeys the
    recurrence obtained by Leibniz differentiation of the Gamma-ratio
    recurrence, closed because <math|F<rsub|0>,\<beta\>> are polynomials in
    <math|a>.
  </proof>

  <\algorithm>
    [Coefficient-algebra evaluation layer for arb4j]<label|alg:arb4j> Input:
    <math|<around|(|A<rsub|M>,B<rsub|M>|)>\<in\><C><around|[|a|]><around|[|x|]><rsup|2>>
    from the Chebyshev\UWheeler pipeline; contour height
    <math|\<eta\><rsub|0>>; maturity <math|T>; working precision; truncation
    bandwidth <math|K>.

    <\enumerate>
      <item>For each quadrature node <math|a=u+<math-up|i>\<eta\><rsub|0>>:
      evaluate <math|B<rsub|M>*<around|(|a,x|)>> on
      <math|<around|[|0,T<rsup|\<alpha\>>|]>> in ball arithmetic; certify
      zero-freeness (interval Descartes/argument principle). Cost
      <math|O<around|(|M|)>> per node.

      <item>Price by fixed-contour quadrature of <math|K<around|(|u|)>*exp
      <around*|(|T*<space|0.17em>A<rsub|M>/B<rsub|M>|)>>
      (Theorem<nbsp><reference|thm:priceconv>); rigorous tails from the
      kernel bound. Cost: nodes <math|\<times\>O<around|(|M|)>>.

      <item>(Diagnostics / analytic continuation off the ray.) For each
      required pole <math|\<xi\><rsub|i>>: partial fractions to get
      <math|c<rsup|<around|(|i|)>>> (<math|O<around|(|M<rsup|2>|)>> exact
      ops); <math|\<Lambda\>>-sequence by <eqref|eq:universal>
      (<math|O<around|(|m*K|)>> ops); Taylor data
      <math|b<rsup|<around|(|i|)>><rsub|l>> of <math|e<rsup|H<rsub|i>>> by
      <eqref|eq:Prec> (<math|O<around|(|<around|(|d<rsub|U>+d<rsub|V>|)>*K|)>>
      ops); assemble <math|A<rsup|<around|(|i|)>><rsub|n>> with certified
      tail via Proposition<nbsp><reference|prop:tail>.

      <item>Cumulant channel: <math|\<partial\><rsub|a><rsup|n>*c<rsub|k><around|(|0|)>>
      by the differentiated Gamma-ratio recurrence (<math|O<around|(|n*M|)>>
      per order), then <math|\<kappa\><rsub|n>> by
      Proposition<nbsp><reference|prop:cumulants>.
    </enumerate>

    All steps are exact recurrences or ball-arithmetic evaluations with
    explicit error terms; no Hankel solve, no numerically unstable step,
    matching the stability profile of <cite-detail|CrowleyCW|Thm.<nbsp>10.2>.
  </algorithm>

  <section|Open problems><label|sec:open>

  <\problem>
    [Domination]<label|prob:H2> Prove hypothesis <with|font-shape|right|(H2)>
    of Theorem<nbsp><reference|thm:priceconv>: a uniform-in-<math|M>
    integrable majorant for <math|<around|\||\<varphi\><rsub|M>|\|>> on the
    contour, e.g. via a uniform-in-<math|a> version of the Stahl rate
    on the contour combined with the exact Gaussian-type decay of
    <math|\<varphi\>>.
  </problem>

  <\problem>
    [Resurgent structure]<label|prob:resurgence> <math|e<rsup|\<Pi\>>> is the
    exponential factor of the Hukuhara--Levelt--Turrittin normal form of the
    rank-one connection <math|d-d*R> at the irregular singularity <math|a>
    <em|(<cite-detail|vdPS|Ch.<nbsp>3>)>; this much is classical. Construct
    the action of the alien derivations of �calle on the
    <math|<CA><rsub|m>>-module of Theorem<nbsp><reference|thm:module> \V the
    natural conjecture, suggested by Lemma<nbsp><reference|lem:derivation>,
    is that singular directions act through the lowering operators
    <math|\<partial\><rsub|c<rsub|j>>> \V and determine the Stokes data of
    <math|\<varphi\><rsub|M>> in terms of the <math|c<rsup|<around|(|i|)>>>
    <em|(framework: Mitschi--Sauzin <cite|MitschiSauzin>; Costin
    <cite|Costin>)>. No such statement is asserted here as a theorem.
  </problem>

  <\problem>
    [Exponential periods]<label|prob:motives>
    <math|e<rsup|R>*<space|0.17em>d*z> is an exponential-period integrand;
    the category of exponential motives <em|(Fres�n--Jossen
    <cite|FresanJossen>)> attaches cohomological invariants to
    <math|<around|(|\<bbb-A\><rsup|1>,R|)>>. Position <math|<CA><rsub|m>>
    relative to the de Rham realization of the rank-one exponential
    connection: is the coefficient module of
    Theorem<nbsp><reference|thm:module> a concrete model of a known object
    there?
  </problem>

  <\problem>
    [<math|q>-lift]<label|prob:hall> Lift
    <math|<around|(|\<Lambda\><rsub|N>|)>> along the Hall-algebra isomorphism
    of Remark<nbsp><reference|rem:hall> to the Hall--Littlewood level:
    identify the <math|q>-analogue of the universal recurrence and its
    analytic meaning, if any, for <math|q>-deformed exponentials of principal
    parts.
  </problem>

  <\problem>
    [Non-reduction]<label|prob:nonreduction> Prove (or refute) that for
    generic <math|<around|(|c<rsub|1>,c<rsub|2>,c<rsub|3>|)>> the sequence
    <math|<around*|(|\<Lambda\><rsub|N>*<around|(|c<rsub|1>,c<rsub|2>,c<rsub|3>|)>|)><rsub|N>>
    is not expressible as <math|<around*|(|\<rho\><rsup|N>*<space|0.17em>F*<around|(|\<sigma\>*N+\<tau\>|)>|)><rsub|N>>
    for any single classical hypergeometric-type function <math|F> of one
    variable \V i.e. make Remark<nbsp><reference|rem:scope> a theorem,
    plausibly via differential Galois groups of the order-<math|3> holonomic
    equation from <eqref|eq:universal>.
  </problem>

  <\thebibliography|99>
    <bibitem|Appell>P.<nbsp>Appell, J.<nbsp>Kamp� de F�riet, <em|Fonctions
    hyperg�om�triques et hypersph�riques. Polynomes d'Hermite>,
    Gauthier-Villars, Paris, 1926.

    <bibitem|Barry>P.<nbsp>Barry, <em|Riordan Arrays: A Primer>, Logic Press,
    2016.

    <bibitem|BLL>F.<nbsp>Bergeron, G.<nbsp>Labelle, P.<nbsp>Leroux,
    <em|Combinatorial Species and Tree-like Structures>, Encyclopedia Math.
    Appl. 67, Cambridge Univ. Press, 1998.

    <bibitem|CarrMadan>P.<nbsp>Carr, D.<nbsp>Madan, Option valuation using
    the fast Fourier transform, <em|J. Comput. Finance>
    <with|font-series|bold|2> (1999), 61\U73.

    <bibitem|Comtet>L.<nbsp>Comtet, <em|Advanced Combinatorics>, Reidel,
    Dordrecht, 1974.

    <bibitem|Costin>O.<nbsp>Costin, <em|Asymptotics and Borel Summability>,
    Chapman & Hall/CRC, 2009.

    <bibitem|CrowleyCGF>S.<nbsp>Crowley, Neighboring-pair representation of
    the rough Heston CGF and global rational closed form via Pad�
    approximation, companion paper, arb4j repository, 2026.

    <bibitem|CrowleyCW>S.<nbsp>Crowley, A universal solution methodology for
    constant-coefficient fractional Riccati equations via the polynomial
    Chebyshev\UWheeler recurrence, companion paper, arb4j repository, 2026.

    <bibitem|DLMF>NIST <em|Digital Library of Mathematical Functions>,
    �10.35, https://dlmf.nist.gov/.

    <bibitem|FGB>H.<nbsp>Figueroa, J.<nbsp>M.<nbsp>Gracia-Bond�a,
    Combinatorial Hopf algebras in quantum field theory I, <em|Rev. Math.
    Phys.> <with|font-series|bold|17> (2005), 881\U976.

    <bibitem|FS>P.<nbsp>Flajolet, R.<nbsp>Sedgewick, <em|Analytic
    Combinatorics>, Cambridge Univ. Press, 2009.

    <bibitem|FresanJossen>J.<nbsp>Fres�n, P.<nbsp>Jossen, <em|Exponential
    Motives>, book draft, http://javier.fresan.perso.math.cnrs.fr/.

    <bibitem|GilPelaez>J.<nbsp>Gil-Pelaez, Note on the inversion theorem,
    <em|Biometrika> <with|font-series|bold|38> (1951), 481\U482.

    <bibitem|Gragg>W.<nbsp>B.<nbsp>Gragg, The Pad� table and its relation to
    certain algorithms of numerical analysis, <em|SIAM Review>
    <with|font-series|bold|14> (1972), 1\U62.

    <bibitem|KauersPaule>M.<nbsp>Kauers, P.<nbsp>Paule, <em|The Concrete
    Tetrahedron>, Springer, 2011.

    <bibitem|KilbasSaigo>A.<nbsp>A.<nbsp>Kilbas, M.<nbsp>Saigo,
    <em|H-Transforms: Theory and Applications>, CRC Press, 2004.

    <bibitem|Koutschan>C.<nbsp>Koutschan, Advanced applications of the
    holonomic systems approach, PhD thesis, RISC, J.<nbsp>Kepler Univ. Linz,
    2009.

    <bibitem|Lipshitz>L.<nbsp>Lipshitz, The diagonal of a D-finite power
    series is D-finite, <em|J. Algebra> <with|font-series|bold|113> (1988),
    373\U378.

    <bibitem|Macdonald>I.<nbsp>G.<nbsp>Macdonald, <em|Symmetric Functions and
    Hall Polynomials>, 2nd ed., Oxford Univ. Press, 1995.

    <bibitem|MilnorMoore>J.<nbsp>Milnor, J.<nbsp>Moore, On the structure of
    Hopf algebras, <em|Ann. of Math.> <with|font-series|bold|81> (1965),
    211\U264.

    <bibitem|MitschiSauzin>C.<nbsp>Mitschi, D.<nbsp>Sauzin, <em|Divergent
    Series, Summability and Resurgence I>, Lecture Notes in Math. 2153,
    Springer, 2016.

    <bibitem|Roman>S.<nbsp>Roman, <em|The Umbral Calculus>, Academic Press,
    1984.

    <bibitem|Shapiro>L.<nbsp>W.<nbsp>Shapiro, S.<nbsp>Getu, W.-J.<nbsp>Woan,
    L.<nbsp>C.<nbsp>Woodson, The Riordan group, <em|Discrete Appl. Math.>
    <with|font-series|bold|34> (1991), 229\U239.

    <bibitem|Stahl>H.<nbsp>Stahl, The convergence of Pad� approximants to
    functions with branch points, <em|J. Approx. Theory>
    <with|font-series|bold|91> (1997), 139\U204.

    <bibitem|StanleyDF>R.<nbsp>P.<nbsp>Stanley, Differentiably finite power
    series, <em|European J. Combin.> <with|font-series|bold|1> (1980),
    175\U188.

    <bibitem|vdPS>M.<nbsp>van der Put, M.<nbsp>F.<nbsp>Singer, <em|Galois
    Theory of Linear Differential Equations>, Grundlehren Math. Wiss. 328,
    Springer, 2003.

    <bibitem|Wright1933>E.<nbsp>M.<nbsp>Wright, On the coefficients of power
    series having exponential singularities, <em|J. London Math. Soc.>
    <with|font-series|bold|8> (1933), 71\U79.
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
    <associate|alg:arb4j|<tuple|44|16|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-1|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-10|<tuple|8|11|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-11|<tuple|8.1|11|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-12|<tuple|8.2|12|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-13|<tuple|8.3|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-14|<tuple|9|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-15|<tuple|9.1|15|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-16|<tuple|10|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-17|<tuple|5|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-2|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-3|<tuple|2.1|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-4|<tuple|3|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-5|<tuple|3.1|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-6|<tuple|4|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-7|<tuple|5|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-8|<tuple|6|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|auto-9|<tuple|7|10|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Appell|<tuple|Appell|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-BLL|<tuple|BLL|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Barry|<tuple|Barry|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-CarrMadan|<tuple|CarrMadan|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Comtet|<tuple|Comtet|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Costin|<tuple|Costin|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-CrowleyCGF|<tuple|CrowleyCGF|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-CrowleyCW|<tuple|CrowleyCW|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-DLMF|<tuple|DLMF|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-FGB|<tuple|FGB|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-FS|<tuple|FS|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-FresanJossen|<tuple|FresanJossen|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-GilPelaez|<tuple|GilPelaez|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Gragg|<tuple|Gragg|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-KauersPaule|<tuple|KauersPaule|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-KilbasSaigo|<tuple|KilbasSaigo|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Koutschan|<tuple|Koutschan|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Lipshitz|<tuple|Lipshitz|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Macdonald|<tuple|Macdonald|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-MilnorMoore|<tuple|MilnorMoore|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-MitschiSauzin|<tuple|MitschiSauzin|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Roman|<tuple|Roman|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Shapiro|<tuple|Shapiro|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Stahl|<tuple|Stahl|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-StanleyDF|<tuple|StanleyDF|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-Wright1933|<tuple|Wright1933|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|bib-vdPS|<tuple|vdPS|18|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|cor:algorithmicholonomy|<tuple|32|11|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|cor:padeE|<tuple|18|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:E|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:category|<tuple|33|11|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:hopf|<tuple|8|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|def:contour|<tuple|40|15|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:Prec|<tuple|3|10|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:axiomrec|<tuple|4|11|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:partition|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|eq:universal|<tuple|1|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:derivation|<tuple|5|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:partition|<tuple|3|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|lem:recurrence|<tuple|2|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prob:H2|<tuple|1|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prob:hall|<tuple|4|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prob:motives|<tuple|3|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prob:nonreduction|<tuple|5|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prob:resurgence|<tuple|2|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prop:bell|<tuple|4|2|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prop:cumulants|<tuple|43|16|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prop:galois|<tuple|21|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prop:growth|<tuple|22|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prop:hadamard|<tuple|26|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prop:independence|<tuple|37|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|prop:tail|<tuple|25|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:H2|<tuple|42|15|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:axiomsdowork|<tuple|38|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:eulerequiv|<tuple|6|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:hall|<tuple|13|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:initialmeaning|<tuple|35|12|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:notFdB|<tuple|12|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:scope|<tuple|30|10|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|rem:zeroloci|<tuple|19|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:aut|<tuple|4|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:axioms|<tuple|8|11|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:classical|<tuple|6|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:combinatorics|<tuple|3|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:holonomy|<tuple|7|10|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:hopf|<tuple|2|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:model|<tuple|5|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:open|<tuple|10|17|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:pricing|<tuple|9|13|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|sec:recurrence|<tuple|1|1|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:analyticmodel|<tuple|23|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:appell|<tuple|15|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:aut|<tuple|20|7|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:bessel|<tuple|27|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:dividedpower|<tuple|9|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:generation|<tuple|7|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:hankelschur|<tuple|17|6|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:hermite|<tuple|28|9|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:holonomy|<tuple|31|10|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:initial|<tuple|34|11|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:localdata|<tuple|39|14|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:module|<tuple|24|8|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:priceconv|<tuple|41|15|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:primitives|<tuple|10|3|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:recognition|<tuple|36|12|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:riordan|<tuple|16|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:species|<tuple|14|5|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:sym|<tuple|11|4|../.TeXmacs/texts/scratch/no_name_2.tm>>
    <associate|thm:wright|<tuple|29|10|../.TeXmacs/texts/scratch/no_name_2.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Comtet

      MilnorMoore

      Macdonald

      Macdonald

      Macdonald

      FGB

      Macdonald

      FS

      BLL

      Roman

      Shapiro

      Barry

      Macdonald

      Gragg

      Macdonald

      Macdonald

      Gragg

      vdPS

      StanleyDF

      Lipshitz

      DLMF

      Appell

      Wright1933

      KilbasSaigo

      StanleyDF

      KauersPaule

      Koutschan

      CrowleyCGF

      CrowleyCW

      CrowleyCGF

      CrowleyCGF

      CrowleyCW

      CrowleyCGF

      CrowleyCGF

      CarrMadan

      GilPelaez

      CrowleyCGF

      Stahl

      CrowleyCGF

      CrowleyCGF

      CrowleyCW

      CrowleyCGF

      CrowleyCW

      CrowleyCGF

      CrowleyCGF

      CrowleyCW

      vdPS

      MitschiSauzin

      Costin

      FresanJossen
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>The
      universal recurrence> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Hopf
      structure and the symmetric-function realization>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>The symmetric-function
      isomorphism <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Combinatorial
      and matrix realizations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Hankel determinants are
      rectangular Schur functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Automorphisms
      and differential Galois structure> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>The
      analytic model> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Classical
      specializations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Holonomy>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Axiomatic
      characterization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <with|par-left|<quote|1tab>|8.1<space|2spc>Initiality
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|8.2<space|2spc>Recognition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|8.3<space|2spc>Independence of the
      hypotheses <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Application:
      rough Heston pricing in the coefficient algebra>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>

      <with|par-left|<quote|1tab>|9.1<space|2spc>Price convergence without
      contour deformation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|10<space|2spc>Open
      problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>