<TeXmacs|2.1.4>

<style|<tuple|article|framed-theorems>>

<\body>
  \;

  <\padded-center>
    <with|font-shape|small-caps|Annals of
    Mathematics><next-line>Vol.<nbsp>53, No.<nbsp>2, March, 1951

    <vspace*|2em><with|font-series|bold|SOME PROPERTIES OF MODULAR RELATIONS>

    <vspace*|1em>By S.<nbsp>Bochner

    <vspace*|0.5em>(Received April 10, 1950)
  </padded-center>

  <section*|Introduction>

  A modular relation will be for us a relation resembling an identity

  <\equation>
    <big|sum><rsub|0><rsup|\<infty\>>a<rsub|m>*e<rsup|-\<lambda\><rsub|m>*x>=x<rsup|-\<delta\>>*<big|sum><rsub|0><rsup|\<infty\>>b<rsub|n>*exp
    <around*|(|-<frac|\<mu\><rsub|n>|x>|)>
  </equation>

  in the half-line <math|0\<less\>x\<less\>\<infty\>> or rather in the
  half-plane <math|<math-up|Re><around|(|x|)>\<gtr\>0>; and beyond always
  assuming <math|\<delta\>\<gtr\>0,\<lambda\><rsub|m>\<geqq\>0,\<mu\><rsub|n>\<geqq\>0>
  and sometimes also

  <\equation>
    0\<less\>\<lambda\><rsub|1>\<less\>\<lambda\><rsub|2>\<less\>\<lambda\><rsub|3>\<less\>\<cdots\>\<to\>\<infty\>
  </equation>

  <\equation>
    0\<less\>\<mu\><rsub|1>\<less\>\<mu\><rsub|2>\<less\>\<mu\><rsub|3>\<less\>\<cdots\>\<to\>\<infty\>
  </equation>

  and introducing some convergence assumptions, we will impose on the
  constants <math|a<rsub|m>,\<lambda\><rsub|m>,b<rsub|n>,\<mu\><rsub|n>> no
  explicit restrictions in addition to those implied in the validity of (1).
  If we write (1) as

  <\equation>
    \<Phi\><around|(|x|)>=x<rsup|-\<delta\>>*\<Psi\><around*|(|<frac|1|x>|)>
  </equation>

  where

  <\equation>
    \<Phi\><around|(|x|)>=<big|sum><rsub|0><rsup|\<infty\>>a<rsub|m>*e<rsup|-\<lambda\><rsub|m>*x>
  </equation>

  <\equation>
    \<Psi\><around|(|x|)>=<big|sum><rsub|0><rsup|\<infty\>>b<rsub|n>*e<rsup|-\<mu\><rsub|n>*x>
  </equation>

  then the relation (4) as such is of no interest whatsoever. It can be
  always inverted to

  <\equation>
    \<Psi\><around|(|x|)>=x<rsup|-\<delta\>>*\<Phi\><around*|(|<frac|1|x>|)>,
  </equation>

  and we may start with any analytic function <math|\<Phi\><around|(|x|)>> in
  <math|<math-up|Re><around|(|x|)>\<gtr\>0> and define
  <math|\<Psi\><around|(|x|)>> by (7), and vice-versa. Thus some structural
  requirements of the type (5), (6) must be added. In the classical set-up
  the functions (5), (6) are \Pperiodic\Q that is we have

  <\equation>
    \<lambda\><rsub|m>=\<lambda\><rsup|\<ast\>>*m,<space|1em>\<mu\><rsub|n>=\<mu\><rsup|\<ast\>>*n
  </equation>

  but even if we start from a family of such periodic relations

  <\equation*>
    \<Phi\><rsub|j><around|(|x|)>=x<rsup|-\<delta\><rsub|j>>*\<Psi\><rsub|j><around*|(|<frac|1|x>|)>
  </equation*>

  then very general \Palmost periodic\Q relations will ensue if we form
  products

  <\equation*>
    <big|prod><rsub|j>\<Phi\><rsub|j><around|(|x|)>=<big|prod><rsub|j>x<rsup|-\<delta\><rsub|j>>*\<Psi\><rsub|j><around*|(|<frac|1|x>|)>
  </equation*>

  for any <math|\<delta\><rsub|j>>, and finite or uniformly convergent
  infinite sums

  <\equation*>
    <big|sum><rsub|j>c<rsub|j>*\<Phi\><rsub|j><around|(|x|)>=x<rsup|-\<delta\>>*<big|sum><rsub|j>c<rsub|j>*\<Psi\><rsub|j><around*|(|<frac|1|x>|)>
  </equation*>

  for equal <math|\<delta\><rsub|j>>, and combinations of such.

  Another source of general relations are, for instance, multidimensional
  relations

  <\equation>
    <big|sum><rsub|m>A<rsub|m>*e<rsup|-<math-up|trace><around|(|L<rsub|m>*X|)>>=<around|(|det
    <around|\||X|\|>|)><rsup|-\<delta\>>*<big|sum><rsub|n>B<rsub|n>*e<rsup|-<math-up|trace><around|(|M<rsub|n>*X<rsup|-1>|)>>
  </equation>

  in which <math|A<rsub|m>,B<rsub|n>> are scalar constants, each
  <math|L<rsub|m>> and <math|M<rsub|n>> is a real symmetric positive
  semi-definite matrix <math|<around|{|\<lambda\><rsub|p*q>|}>> and
  <math|<around|{|\<mu\><rsub|p*q>|}>> respectively,
  <math|p,q=1,\<ldots\>,k>, and <math|X> is a real symmetric strictly
  positive definite matrix <math|<around|{|x<rsub|p*q>|}>> of the same finite
  dimension <math|k>, see [13]. If we replace the matrix <math|X> by the
  product <math|X*t> in which <math|t> is a positive scalar, then (9) implies

  <\equation>
    <big|sum><rsub|m>A<rsub|m>*exp <around|(|-<math-up|trace><around|(|L<rsub|m>*X|)>*t|)>=t<rsup|-\<delta\>><around|(|det
    <around|\||X|\|>|)><rsup|-\<delta\>>*<big|sum><rsub|n>B<rsub|n>*exp
    <around|(|-<math-up|trace><around|(|M<rsub|n>*X<rsup|-1>|)>*t<rsup|-1>|)>,
  </equation>

  and this is of the form (1) if we put

  <\equation*>
    a<rsub|m>=A<rsub|m><around|(|det <around|\||X|\|>|)><rsup|-\<delta\>>,<space|1em>b<rsub|n>=B<rsub|n>,<space|1em>\<lambda\><rsub|m>=<math-up|trace><around|(|L<rsub|m>*X|)>,
  </equation*>

  <\equation*>
    \<mu\><rsub|n>=<math-up|trace><around|(|M<rsub|n>*X<rsup|-1>|)>,<space|1em>x=t,
  </equation*>

  and even if in the original matrices <math|L<rsub|m>,M<rsub|n>> the
  coefficients are multiples of integers, then for a general matrix <math|X>
  the resulting exponents <math|\<lambda\><rsub|m>,\<mu\><rsub|n>> will no
  longer so be.

  In the classical cases of (8) it is a familiar fact, compare [10], that the
  relation (1) is equivalent with the functional equation

  <\equation>
    \<Gamma\>*<around|(|\<delta\>-s|)>*\<psi\>*<around|(|\<delta\>-s|)>=\<Gamma\><around|(|s|)>*\<varphi\><around|(|s|)>
  </equation>

  where

  <\equation>
    \<varphi\><around|(|s|)>=<big|sum><rsub|1><rsup|\<infty\>><frac|a<rsub|m>|\<lambda\><rsub|m><rsup|s>>
  </equation>

  <\equation>
    \<psi\><around|(|s|)>=<big|sum><rsub|1><rsup|\<infty\>><frac|b<rsub|n>|\<mu\><rsub|n><rsup|s>>
  </equation>

  and that the constant terms <math|a<rsub|0>,b<rsub|0>> of (8) which do not
  appear in (12) and (13) are the residues of the function
  <math|\<chi\><around|(|s|)>> which is the joint value of the two sides in
  (11), this function having simple poles at <math|s=0> and
  <math|s=\<delta\>> at most. Now, in Section I we will examine this
  equivalence from a broad approach and we will see that the singularities of
  <math|\<chi\><around|(|s|)>> may contribute a rather large additional term
  to the modular relation, but that it can be absorbed into it structurally
  by introducing a relation

  <\equation>
    <big|int>e<rsup|-\<lambda\>*x>*<space|0.17em>d*R<around|(|\<lambda\>|)>=x<rsup|-\<delta\>>*<big|int>exp
    <around*|(|-<frac|\<mu\>|x>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  which is more comprehensive than (1). Also near the end of Section III we
  will have some supplementary remarks about functional equations other than
  (11).

  For particular cases of (1) it has been known and it is formally true in
  general that relation (1) implies the summation formula

  <\equation>
    <big|sum><rsub|0><rsup|\<infty\>>a<rsub|m>*f<around|(|\<lambda\><rsub|m>|)>=<big|sum><rsub|0><rsup|\<infty\>>b<rsub|n>*g<around|(|\<mu\><rsub|n>|)>,
  </equation>

  or more generally

  <\equation>
    <big|sum><rsub|0><rsup|\<infty\>>a<rsub|m>*f*<around|(|\<lambda\><rsub|m>*x|)>=x<rsup|-\<delta\>>*<big|sum><rsub|0><rsup|\<infty\>>b<rsub|n>*g<around*|(|<frac|\<mu\><rsub|n>|x>|)>,<space|1em>x\<gtr\>0
  </equation>

  for a pair of functions <math|f<around|(|\<lambda\>|)>,g<around|(|\<mu\>|)>>
  which are connected by the Hankel transformations

  <\equation>
    g<around|(|\<mu\>|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|\<delta\>-1>*<around|(|2*<around|(|\<lambda\>*\<mu\>|)><rsup|1/2>|)>*\<lambda\><rsup|<frac|1|2>*<around|(|\<delta\>-1|)>>*f<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>
  </equation>

  <\equation>
    f<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|\<delta\>-1>*<around|(|2*<around|(|\<lambda\>*\<mu\>|)><rsup|1/2>|)>*\<mu\><rsup|<frac|1|2>*<around|(|\<delta\>-1|)>>*g<around|(|\<mu\>|)>*<space|0.17em>d*\<mu\>
  </equation>

  of which each is a formal reciprocal to the other; with
  <math|J<rsub|\<nu\>><around|(|x|)>> being the ordinary Bessel function as
  usual.

  As regards validity of (15), a primitive but important situation arises if
  it is required that both sides in (15) shall also be absolutely convergent,

  <\equation>
    <big|sum><around|\||a<rsub|m>|\|><space|0.17em><around|\||f<around|(|\<lambda\><rsub|m>|)>|\|>\<less\>\<infty\>,<space|1em><big|sum><around|\||b<rsub|n>|\|><space|0.17em><around|\||g<around|(|\<mu\><rsub|n>|)>|\|>\<less\>\<infty\>,
  </equation>

  and for this situation we will draw up in Section II a kind of master
  criterion from which specific ones, old and new, may be obtained. We also
  note that formula (16), if applied to (9) by way of (10) reads

  <\equation>
    <big|sum><rsub|m>A<rsub|m>*f<around|(|<math-up|trace><around|(|L<rsub|m>*X|)>|)>=<around|(|det
    <around|\||X|\|>|)><rsup|-\<delta\>>*<big|sum><rsub|n>B<rsub|n>*g<around|(|<math-up|trace><around|(|M<rsub|n>*X<rsup|-1>|)>|)>
  </equation>

  where <math|f<around|(|\<lambda\>|)>> and <math|g<around|(|\<mu\>|)>> are
  connected by the same relations as before and we are stating here the
  following consequence from Theorem 10 in Section II.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 1.> <em|If a
  relation (9) is given then for a matrix <math|X> and a number
  <math|\<gamma\>\<gtr\>0> we have relation>

  <\equation>
    \<Gamma\>*<around|(|\<gamma\>+1|)>*<big|sum><rsub|m>A<rsub|m><around|(|<math-up|trace><around|(|L<rsub|m>*X<rsup|-1>|)>|)><rsup|-\<gamma\>-1>=<big|sum><rsub|n>B<rsub|n><around|(|<math-up|trace><around|(|M<rsub|n>*X|)>|)><rsup|<frac|1|2>*<around|(|\<delta\>+\<gamma\>|)>>*J<rsub|\<delta\>+\<gamma\>><around|(|2<around|(|<math-up|trace><around|(|M<rsub|n>*X|)>|)><rsup|1/2>|)>
  </equation>

  <em|provided we have>

  <\equation*>
    <big|sum><rsub|<math-up|tr><around|(|M<rsub|n>*X|)>\<le\>1><around|\||B<rsub|n>*<around|\||+<big|sum><rsub|<math-up|tr><around|(|M<rsub|n>*X|)>\<gtr\>1>|\|>*B<rsub|n>|\|><around|{|<math-up|tr><around|(|M<rsub|n>*X|)>|}><rsup|-<frac|1|2>*<around|(|\<delta\>+\<gamma\>|)>-<frac|1|4>>\<less\>\<infty\>,
  </equation*>

  <em|and also>

  <\equation*>
    <big|sum><rsub|<math-up|tr><around|(|L<rsub|m>*X<rsup|-1>|)>\<le\>1><around|\||A<rsub|m>*<around|\||+<big|sum><rsub|<math-up|tr><around|(|L<rsub|m>*X<rsup|-1>|)>\<gtr\>1>|\|>*A<rsub|m>|\|><around|{|<math-up|tr><around|(|L<rsub|m>*X<rsup|-1>|)>|}><rsup|-\<alpha\>>\<less\>\<infty\>,
  </equation*>

  <em|for some <math|\<alpha\>\<gtr\>0>.>

  Finally in Section IV we will have statements on Abel and Riesz summability
  of the modular series

  <\equation>
    <big|sum><rsub|\<lambda\><rsub|m>\<ge\>1>\<lambda\><rsub|m><rsup|l>*exp
    <around|(|i*<around|(|\<lambda\><rsub|m>*x|)><rsup|1/2>|)>
  </equation>

  for arbitrary <math|l>, and on the validity of the formula

  <\equation>
    \<Gamma\>*<around|(|\<delta\>+1|)>*<big|sum>a<rsub|m><around*|(|<frac|x|\<lambda\><rsub|m>>|)><rsup|<frac|1|2>*<around|(|\<delta\>+\<gamma\>|)>>*J<rsub|\<delta\>+\<gamma\>>*<around|(|2*<around|(|\<lambda\><rsub|m>*x|)><rsup|1/2>|)>=<big|sum><rsub|\<mu\><rsub|n>\<le\>x>b<rsub|n>*<around|(|x-\<mu\><rsub|n>|)><rsup|\<gamma\>>
  </equation>

  for arbitrary values of <math|\<gamma\>>, positive or negative, but only
  for such values of the variable <math|x> as are different from all
  exponents <math|\<mu\><rsub|n>> occurring. Our statements as such will not
  be new, see for instance, Ferrar [8], but our line of reasoning will, and
  we think that, syllogistically, the proof to Theorem 11 is the main
  contribution of the present paper. We have nothing to contribute to the
  case of <math|x> being equal an exponent <math|\<mu\><rsub|n>> and for
  completeness' sake we note that as far as is known to us, the latest
  \Pdelicate\Q result bearing on this situation is the one due to Wilton and
  Hardy [18].

  <section*|Section I. Functional Equations>

  <subsection*|1.>

  We recall that we always assume

  <\equation*>
    \<delta\>\<gtr\>0.
  </equation*>

  In the complex <math|s>-plane, <math|s=\<sigma\>+i*t>, we take two Mellin
  integrals

  <\equation>
    \<chi\><rsub|1><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|s-1>*\<Phi\><around|(|x|)>*<space|0.17em>d*x
  </equation>

  <\equation>
    \<chi\><rsub|2><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|s-1>*\<Psi\><around|(|x|)>*<space|0.17em>d*x
  </equation>

  and we assume that they are absolutely convergent in a right half-plane,
  that is

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>x<rsup|\<sigma\>-1><around|\||\<Phi\><around|(|x|)>|\|>*<space|0.17em>d*x\<less\>\<infty\>,<space|1em><big|int><rsub|0><rsup|\<infty\>>x<rsup|\<sigma\>-1><around|\||\<Psi\><around|(|x|)>|\|>*<space|0.17em>d*x\<less\>\<infty\>
  </equation>

  for <math|\<sigma\>\<ge\>\<sigma\><rsub|0>> for some
  <math|\<sigma\><rsub|0>\<gtr\>0>. We also assume that
  <math|\<Phi\><around|(|x|)>> and <math|\<Psi\><around|(|x|)>> are
  differentiable in <math|0\<less\>x\<less\>\<infty\>>, although this
  assumption could be circumvented altogether.

  <vspace*|1fn><no-indent><with|font-series|bold|Definition 1.> We will say
  that two functions <math|\<chi\><rsub|1><around|(|s|)>,\<chi\><rsub|2><around|(|s|)>>,
  as just introduced, satisfy the functional equation

  <\equation>
    \<chi\><rsub|1><around|(|s|)>=\<chi\><rsub|2>*<around|(|\<delta\>-s|)>
  </equation>

  if the following situation prevails. There is given in the <math|s>-plane a
  domain <math|D> which is the entire exterior of a bounded closed set
  <math|S>, with <math|D> and <math|S> both symmetric with respect to the
  line

  <\equation>
    \<sigma\>=<frac|\<delta\>|2>,<space|1em>-\<infty\>\<less\>t\<less\>\<infty\>
  </equation>

  and in <math|D> there is given a holomorphic function
  <math|\<chi\><around|(|s|)>> which in a right half-plane coincides with
  <math|\<chi\><rsub|1><around|(|s|)>> and in a left half-plane with
  <math|\<chi\><rsub|2>*<around|(|\<delta\>-s|)>>, and furthermore we have

  <\equation>
    lim<rsub|<around|\||t|\|>\<to\>\<infty\>>
    \<chi\>*<around|(|\<sigma\>+i*t|)>=0
  </equation>

  uniformly in every bounded interval

  <\equation>
    \<sigma\><rsub|1>\<le\>\<sigma\>\<le\>\<sigma\><rsub|2>,<space|1em>-\<infty\>\<less\>\<sigma\><rsub|1>\<less\>\<sigma\><rsub|2>\<less\>\<infty\>.
  </equation>

  Before proceeding we will immediately introduce another definition.

  <vspace*|1fn><no-indent><with|font-series|bold|Definition 2.> We will say
  that a function <math|P<around|(|x|)>> is a <em|residual function> if it
  has the following properties: (i) It is defined and differentiable in
  <math|0\<less\>x\<less\>\<infty\>>, and for some <math|\<gamma\>\<gtr\>0>
  we have <math|P<around|(|x|)>=O<around|(|x<rsup|-\<gamma\>>|)>> as
  <math|x\<to\>0> and <math|=O<around|(|x<rsup|\<gamma\>>|)>> as
  <math|x\<to\>\<infty\>>, so that we may introduce the functions

  <\equation>
    \<chi\><rsub|r><around|(|s|)>=<big|int><rsub|0><rsup|1>P<around|(|x|)>*x<rsup|s-1>*<space|0.17em>d*x
  </equation>

  <\equation>
    \<chi\><rsub|l><around|(|s|)>=-<big|int><rsub|1><rsup|\<infty\>>P<around|(|x|)>*x<rsup|s-1>*<space|0.17em>d*x
  </equation>

  the first in a right half-plane and the second in a left half-plane. (ii)
  These two functions can be continued, the one into the other, in a domain
  <math|D> as introduced in Definition 1. (iii) We also have

  <\equation>
    lim<rsub|<around|\||t|\|>\<to\>\<infty\>>
    \<chi\><rsub|r>*<around|(|\<sigma\>+i*t|)>=0
  </equation>

  uniformly in (30), where <math|\<chi\><rsub|r><around|(|s|)>> simply
  denotes the joint value of the two functions (31), (32) in the domain
  <math|D>.

  <vspace*|1fn><no-indent><with|font-series|bold|Lemma 1.> <em|Any integral>

  <\equation>
    P<around|(|x|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|C>\<chi\><around|(|\<zeta\>|)>*x<rsup|-\<zeta\>>*<space|0.17em>d*\<zeta\>
  </equation>

  <em|over a bounded curve or curves <math|C>, with
  <math|x<rsup|-\<zeta\>>=exp <around|(|-\<zeta\>*log x|)>>, is a residual
  function. So is also any finite sum>

  <\equation>
    <big|sum><rsub|\<zeta\>>a<rsub|\<zeta\>>*x<rsup|-\<zeta\>>
  </equation>

  <em|with>

  <\equation>
    -a<rsub|0>+b<rsub|0>*x<rsup|-\<delta\>>
  </equation>

  <em|occurring most frequently, and more generally any finite sum>

  <\equation>
    <big|sum>a<rsub|p*\<zeta\>><around|(|log x|)><rsup|p>*x<rsup|-\<zeta\>>
  </equation>

  <em|where <math|p=0,1,2,\<ldots\>>, and <math|\<zeta\>> is complex.>

  <vspace*|1fn><no-indent><em|Proof.> If <math|\<gamma\>\<gtr\>0> is such
  that <math|C> lies in the strip <math|-\<gamma\>\<less\>\<sigma\>\<less\>\<gamma\>>
  then property (i) of Definition 2 is fulfilled. Now, for
  <math|\<sigma\>\<gtr\>\<gamma\>> we have

  <\equation*>
    <big|int><rsub|0><rsup|1>P<around|(|x|)>*x<rsup|s-1>*<space|0.17em>d*x=<frac|1|2*\<pi\>*i>*<big|int><rsub|0><rsup|1>d*x\<cdot\>x<rsup|s-1>*<big|int><rsub|C>d*\<zeta\>\<cdot\>\<chi\><around|(|\<zeta\>|)>*x<rsup|-\<zeta\>>
  </equation*>

  <\equation*>
    =<frac|1|2*\<pi\>*i>*<big|int><rsub|C>d*\<zeta\>\<cdot\>\<chi\><around|(|\<zeta\>|)>*<big|int><rsub|0><rsup|1>x<rsup|s-\<zeta\>-1>*<space|0.17em>d*x=<frac|1|2*\<pi\>*i>*<big|int><rsub|C><frac|\<chi\><around|(|\<zeta\>|)>*<space|0.17em>d*\<zeta\>|s-\<zeta\>>
  </equation*>

  and for <math|\<sigma\>\<less\>-\<gamma\>> we have

  <\equation*>
    -<big|int><rsub|1><rsup|\<infty\>>P<around|(|x|)>*x<rsup|s-1>*<space|0.17em>d*x=-<frac|1|2*\<pi\>*i>*<big|int><rsub|1><rsup|\<infty\>>d*x\<cdot\>x<rsup|s-1>*<big|int><rsub|C>d*\<zeta\>\<cdot\>\<chi\><around|(|\<zeta\>|)>*x<rsup|-\<zeta\>>
  </equation*>

  <\equation*>
    =-<frac|1|2*\<pi\>*i>*<big|int><rsub|C>d*\<zeta\>\<cdot\>\<chi\><around|(|\<zeta\>|)>*<big|int><rsub|1><rsup|\<infty\>>x<rsup|s-\<zeta\>-1>*<space|0.17em>d*x=<frac|1|2*\<pi\>*i>*<big|int><rsub|C><frac|\<chi\><around|(|\<zeta\>|)>*<space|0.17em>d*\<zeta\>|s-\<zeta\>>
  </equation*>

  and from this (ii) and (iii) follow easily.

  Also, for <math|P<around|(|x|)>=<around|(|log
  x|)><rsup|p>*x<rsup|-\<zeta\>>> we obtain for (31) and (32) the same
  expression <math|-\<Gamma\>*<around|(|p+1|)>*<around|(|\<zeta\>-s|)><rsup|-p-1>>
  and thus (37) is a residual function.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 2.> <em|If two
  Mellin integrals (24), (25) satisfy the functional equation (27), then
  their integrands satisfy the (modular) relation>

  <\equation>
    \<Phi\><around|(|x|)>-x<rsup|-\<delta\>>*\<Psi\><around*|(|<frac|1|x>|)>=P<around|(|x|)>
  </equation>

  <em|in which <math|P<around|(|x|)>> is a residual function representable as
  an integral (34) in which <math|C> is a curve or curves in <math|D>
  encircling all of <math|S>.>

  <vspace*|1fn><no-indent><em|Proof.> If we choose a sufficiently large
  number <math|a\<gtr\>0>, then by Mellin inversion of (24) we obtain

  <\equation>
    \<Phi\><around|(|x|)>=lim<rsub|T\<to\>\<infty\>>
    <frac|1|2*\<pi\>*i>*<big|int><rsub|a-i*T><rsup|a+i*T>\<chi\><rsub|1><around|(|s|)>*x<rsup|-s>*<space|0.17em>d*s,
  </equation>

  and due to (29) the right side is

  <\equation>
    <frac|1|2*\<pi\>*i>*<big|int><rsub|C>+lim<rsub|T\<to\>\<infty\>>
    <frac|1|2*\<pi\>*i>*<big|int><rsub|\<delta\>-a-i*T><rsup|\<delta\>-a+i*T>\<chi\><around|(|s|)>*x<rsup|-s>*<space|0.17em>d*s
  </equation>

  provided <math|C> is located in the strip
  <math|\<delta\>-a\<less\>\<sigma\>\<less\>a>, and this will take place if
  <math|a> is sufficiently large. The first term in (40) is our residual
  function; and if in the second we write
  <math|\<chi\><rsub|2>*<around|(|\<delta\>-s|)>> for
  <math|\<chi\><around|(|s|)>> and replace <math|s> by <math|\<delta\>-s>, we
  obtain

  <\equation*>
    x<rsup|-\<delta\>>*lim<rsub|T\<to\>\<infty\>>
    <frac|1|2*\<pi\>*i>*<big|int><rsub|a-i*T><rsup|a+i*T>\<chi\><rsub|2><around|(|s|)><around*|(|<frac|1|x>|)><rsup|-s>*<space|0.17em>d*s
  </equation*>

  which by Mellin inversion of (25) is <math|x<rsup|-\<delta\>>*\<Psi\><around*|(|<frac|1|x>|)>>,
  as claimed.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 3.> <em|Conversely,
  if we are given in <math|0\<less\>x\<less\>\<infty\>> a (modular) relation
  (38) in which <math|P<around|(|x|)>> is any residual function according to
  Definition 2, and if <math|\<Phi\><around|(|x|)>> and
  <math|\<Psi\><around|(|x|)>> are differentiable functions for which the
  restriction (26) holds so as to give rise to Mellin integrals (24), (25),
  then the latter satisfy the functional equation (27) in the sense of
  Definition 1.>

  <vspace*|1fn><no-indent><em|Remark.> In particular, by Theorem 2,
  <math|P<around|(|x|)>> can be represented by an integral (34) and this
  statement is a kind of converse to Lemma 1.

  <vspace*|1fn><no-indent><em|Proof.> We have

  <\equation*>
    \<chi\><rsub|1><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|s-1>*\<Phi\><around|(|x|)>*<space|0.17em>d*x
  </equation*>

  <\equation*>
    =<big|int><rsub|0><rsup|1>x<rsup|s-1>*\<Phi\><around|(|x|)>*<space|0.17em>d*x+<big|int><rsub|1><rsup|\<infty\>>x<rsup|s-1>*\<Phi\><around|(|x|)>*<space|0.17em>d*x+<big|int><rsub|0><rsup|1>x<rsup|s-1>*P<around|(|x|)>*<space|0.17em>d*x+<big|int><rsub|1><rsup|\<infty\>>x<rsup|s-1>*P<around|(|x|)>*<space|0.17em>d*x
  </equation*>

  <\equation*>
    =\<chi\><rsub|1><rsup|\<ast\>><around|(|s|)>+\<chi\><rsub|r><around|(|s|)>,
  </equation*>

  where <math|\<chi\><rsub|r><around|(|s|)>> is defined by (31) and

  <\equation>
    \<chi\><rsub|1><rsup|\<ast\>><around|(|s|)>=<big|int><rsub|0><rsup|1>x<rsup|s-1>*\<Phi\><around|(|x|)>*<space|0.17em>d*x+<big|int><rsub|1><rsup|\<infty\>>x<rsup|s-1>*\<Psi\><around|(|x|)>*<space|0.17em>d*x.
  </equation>

  Now, for <math|\<chi\><rsub|r><around|(|s|)>> we have stipulated explicitly
  that it can be extended into a domain <math|D> and that (33) holds for it,
  and for <math|\<chi\><rsub|1><rsup|\<ast\>><around|(|s|)>> we are going to
  prove this. It follows easily from (26) that the two integrals comprising
  (41) are each absolutely uniformly convergent in every strip (30) so that
  (41) is actually an entire function. As for the validity of

  <\equation>
    lim<rsub|<around|\||t|\|>\<to\>\<infty\>>
    \<chi\><rsub|1><rsup|\<ast\>>*<around|(|\<sigma\>+i*t|)>=0
  </equation>

  uniformly in <math|\<sigma\><rsub|1>\<le\>\<sigma\>\<le\>\<sigma\><rsub|2>>
  we note that this is nothing else but the Riemann\ULebesgue Lemma for the
  sum of Fourier integrals

  <\equation*>
    <big|int><rsub|0><rsup|1><around*|(|e<rsup|i*<around|(|s*log
    x|)>>*\<Phi\><around|(|x|)>+e<rsup|i*<around|(|\<delta\>-s|)>*log
    x>*\<Psi\><around|(|x|)>|)>*<space|0.17em>d<around|(|log x|)>
  </equation*>

  uniformly in the parameter <math|\<sigma\>> and can be easily verified.

  Next we note that relation (38) implies

  <\equation>
    \<Psi\><around|(|x|)>=x<rsup|-\<delta\>>*\<Phi\><around*|(|<frac|1|x>|)>-x<rsup|-\<delta\>>*P<around*|(|<frac|1|x>|)>
  </equation>

  and therefore we have

  <\equation*>
    \<chi\><rsub|2><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|s-1>*\<Psi\><around|(|x|)>*<space|0.17em>d*x
  </equation*>

  <\equation*>
    =<big|int><rsub|0><rsup|1>x<rsup|s-1>*\<Psi\><around|(|x|)>*<space|0.17em>d*x+<big|int><rsub|1><rsup|\<infty\>>x<rsup|s-1>*\<Psi\><around|(|x|)>*<space|0.17em>d*x
  </equation*>

  <\equation*>
    =<big|int><rsub|0><rsup|1>x<rsup|s-1-\<delta\>>*\<Phi\><around*|(|<frac|1|x>|)>*<space|0.17em>d*x-<big|int><rsub|0><rsup|1>x<rsup|s-1-\<delta\>>*P<around*|(|<frac|1|x>|)>*<space|0.17em>d*x+<big|int><rsub|1><rsup|\<infty\>>x<rsup|s-1>*\<Psi\><around|(|x|)>*<space|0.17em>d*x
  </equation*>

  <\equation*>
    =<big|int><rsub|1><rsup|\<infty\>>x<rsup|\<delta\>-s-1>*\<Phi\><around|(|x|)>*<space|0.17em>d*x+\<chi\><rsub|l>*<around|(|\<delta\>-s|)>+<big|int><rsub|1><rsup|\<infty\>>x<rsup|s-1>*\<Psi\><around|(|x|)>*<space|0.17em>d*x
  </equation*>

  <\equation*>
    =\<chi\><rsub|2><rsup|\<ast\>>*<around|(|\<delta\>-s|)>+\<chi\><rsub|l>*<around|(|\<delta\>-s|)>,
  </equation*>

  and equation (27) follows now from the postulated equality of (31) and
  (32).

  <subsection*|2.>

  We now take a Dirichlet series (12) with (2) and we assume that for a
  constant <math|\<alpha\>\<gtr\>0> we have

  <\equation>
    <big|sum><rsub|1><rsup|\<infty\>><frac|<around|\||a<rsub|m>|\|>|\<lambda\><rsub|m><rsup|\<alpha\>>>\<less\>\<infty\>.
  </equation>

  If with the Gamma integral

  <\equation*>
    \<Gamma\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>x<rsup|s-1>*e<rsup|-x>*<space|0.17em>d*x
  </equation*>

  we form the product

  <\equation>
    \<chi\><rsub|1><around|(|s|)>=\<Gamma\><around|(|s|)>*\<varphi\><around|(|s|)>
  </equation>

  then we can write for it the Mellin integral (24) where
  <math|\<Phi\><around|(|x|)>> is given by (5). Similarly if we introduce the
  Dirichlet series (13) with (3) and if for a constant
  <math|\<beta\>\<gtr\>0> we have

  <\equation>
    <big|sum><rsub|1><rsup|\<infty\>><frac|<around|\||b<rsub|n>|\|>|\<mu\><rsub|n><rsup|\<beta\>>>\<less\>\<infty\>
  </equation>

  then for

  <\equation>
    \<chi\><rsub|2><around|(|s|)>=\<Gamma\><around|(|s|)>*\<psi\><around|(|s|)>
  </equation>

  we have the Mellin integral (25) where <math|\<Psi\><around|(|x|)>> is (6),
  and our Theorems 2 and 3 express the following equivalence, subject to
  details.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 4.> <em|A Hecke
  functional equation>

  <\equation>
    \<Gamma\><around|(|s|)>*\<varphi\><around|(|s|)>=\<Gamma\>*<around|(|\<delta\>-s|)>*\<psi\>*<around|(|\<delta\>-s|)>=\<chi\><around|(|s|)>
  </equation>

  <em|where>

  <\equation>
    \<varphi\><around|(|s|)>=<big|sum><rsub|1><rsup|\<infty\>><frac|a<rsub|m>|\<lambda\><rsub|m><rsup|s>>,<space|1em>\<psi\><around|(|s|)>=<big|sum><rsub|1><rsup|\<infty\>><frac|b<rsub|n>|\<mu\><rsub|n><rsup|s>>
  </equation>

  <em|implies the modular relation>

  <\equation>
    <big|sum><rsub|1><rsup|\<infty\>>a<rsub|m>*e<rsup|-\<lambda\><rsub|m>*x>-x<rsup|-\<delta\>>*<big|sum><rsub|1><rsup|\<infty\>>b<rsub|n>*exp
    <around*|(|-<frac|\<mu\><rsub|n>|x>|)>=P<around|(|x|)>
  </equation>

  <em|in which <math|P<around|(|x|)>> is a residual function and is given by
  an integral (34); and conversely any relation (50) with any residual
  function <math|P<around|(|x|)>> leads back to an equation (48).>

  We may generalize this by introducing in (48) the Laplace\UStieltjes
  integrals

  <\equation>
    \<varphi\><around|(|s|)>=<big|int><rsub|+0><rsup|\<infty\>>\<lambda\><rsup|-s>*<space|0.17em>d*A<around|(|\<lambda\>|)>
  </equation>

  <\equation>
    \<psi\><around|(|s|)>=<big|int><rsub|+0><rsup|\<infty\>>\<mu\><rsup|-s>*<space|0.17em>d*B<around|(|\<mu\>|)>
  </equation>

  with

  <\equation>
    <big|int><rsub|+0><rsup|\<infty\>>\<lambda\><rsup|-\<alpha\>>*<around|\||d*A<around|(|\<lambda\>|)>|\|>\<less\>\<infty\>,<space|1em><big|int><rsub|+0><rsup|\<infty\>>\<mu\><rsup|-\<beta\>>*<around|\||d*B<around|(|\<mu\>|)>|\|>\<less\>\<infty\>
  </equation>

  in which case (50) is to be replaced by

  <\equation>
    <big|int><rsub|+0><rsup|\<infty\>>e<rsup|-\<lambda\>*x>*<space|0.17em>d*A<around|(|\<lambda\>|)>-x<rsup|-\<delta\>>*<big|int><rsub|+0><rsup|\<infty\>>exp
    <around*|(|-<frac|\<mu\>|x>|)>*<space|0.17em>d*B<around|(|\<mu\>|)>=P<around|(|x|)>
  </equation>

  and this includes the previous case if we put

  <\equation>
    A<around|(|\<lambda\>|)>=<big|sum><rsub|\<lambda\><rsub|m>\<less\>\<lambda\>>a<rsub|m>,<space|1em>B<around|(|\<mu\>|)>=<big|sum><rsub|\<mu\><rsub|n>\<less\>\<mu\>>b<rsub|n>.
  </equation>

  In forming the expressions (55) we may abandon the requirement that the
  exponents <math|\<lambda\><rsub|m>,\<mu\><rsub|n>> shall be simple
  sequences (2), (3), and if we apply this to (10), recalling that (36) is a
  residual function, we obtain the following statement.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 5.> <em|If there is
  given a multi-dimensional relation (9), and if corresponding to a matrix
  <math|X> there are numbers <math|\<alpha\>\<gtr\>0,\<beta\>\<gtr\>0> such
  that>

  <\equation>
    <big|sum><rsub|<math-up|tr><around|(|L<rsub|m>*X|)>=0><around|\||A<rsub|m>|\|>+<big|sum><rsub|<math-up|tr><around|(|L<rsub|m>*X|)>\<gtr\>0><around|(|<math-up|tr><around|(|L<rsub|m>*X|)>|)><rsup|-\<alpha\>><around|\||A<rsub|m>|\|>\<less\>\<infty\>
  </equation>

  <em|and>

  <\equation>
    <big|sum><rsub|<math-up|tr><around|(|M<rsub|n>*X<rsup|-1>|)>=0><around|\||B<rsub|n>|\|>+<big|sum><rsub|<math-up|tr><around|(|M<rsub|n>*X<rsup|-1>|)>\<gtr\>0><around|(|<math-up|tr><around|(|M<rsub|n>*X<rsup|-1>|)>|)><rsup|-\<beta\>><around|\||B<rsub|n>|\|>\<less\>\<infty\>,
  </equation>

  <em|then we have the functional equation>

  <\equation>
    \<Gamma\><around|(|s|)>*\<varphi\>*<around|(|s;X|)>=<around|(|det
    <around|\||X|\|>|)><rsup|-\<delta\>>*\<Gamma\>*<around|(|\<delta\>-s|)>*\<psi\>*<around|(|\<delta\>-s;X<rsup|-1>|)>
  </equation>

  <em|where>

  <\equation>
    \<varphi\>*<around|(|s;X|)>=<big|sum><rsub|<math-up|tr><around|(|L<rsub|m>*X|)>\<gtr\>0>A<rsub|m><around|(|<math-up|tr><around|(|L<rsub|m>*X|)>|)><rsup|-s>
  </equation>

  <em|and>

  <\equation>
    \<psi\>*<around|(|s;X<rsup|-1>|)>=<big|sum><rsub|<math-up|tr><around|(|M<rsub|n>*X<rsup|-1>|)>\<gtr\>0>B<rsub|n><around|(|<math-up|tr><around|(|M<rsub|n>*X<rsup|-1>|)>|)><rsup|-s>.
  </equation>

  <subsection*|3.>

  Usually the function <math|\<chi\><around|(|s|)>> will have but a finite
  number of unramified singularities and the point set <math|S> will consist
  of these points only. In this case the point set <math|S> certainly does
  not contain a continuum linking the line <math|\<sigma\>=0> with the line
  <math|\<sigma\>=\<delta\>>. If now we impose on <math|S> the non-linking
  property just stated (and nothing more specific) then it is possible to
  replace in (34) the system of curves <math|C> encircling <math|S> by a
  combinatorial sum <math|-C<rsub|1>+C<rsub|2>> in such a manner that
  <math|C<rsub|1>> is located in the right half-plane
  <math|\<sigma\>\<gtr\>0> and <math|C<rsub|2>> in the left half-plane
  <math|\<sigma\>\<less\>\<delta\>>. We can then put

  <\equation>
    P<around|(|x|)>=-M<around|(|x|)>+x<rsup|-\<delta\>>*N<around*|(|<frac|1|x>|)>
  </equation>

  where

  <\equation>
    M<around|(|x|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|C<rsub|1>>\<chi\><around|(|s|)>*x<rsup|-s>*<space|0.17em>d*s
  </equation>

  and

  <\equation>
    N<around|(|x|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|C<rsub|2>>\<chi\><around|(|s|)>*x<rsup|s-\<delta\>>*<space|0.17em>d*s,
  </equation>

  and by the use of the integrals

  <\equation*>
    \<Gamma\><around|(|s|)>*x<rsup|-s>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*x>*\<lambda\><rsup|s-1>*<space|0.17em>d*\<lambda\>,<space|1em>\<Gamma\>*<around|(|\<delta\>-s|)>*x<rsup|s-\<delta\>>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<mu\>*x>*\<mu\><rsup|\<delta\>-s-1>*<space|0.17em>d*\<mu\>
  </equation*>

  we obtain

  <\equation>
    M<around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*x>*u<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>
  </equation>

  <\equation>
    N<around|(|x|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<mu\>*x>*v<around|(|\<mu\>|)>*<space|0.17em>d*\<mu\>
  </equation>

  where

  <\equation>
    u<around|(|\<lambda\>|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|C<rsub|1>>\<varphi\><around|(|s|)>*\<lambda\><rsup|s-1>*<space|0.17em>d*s,<space|1em>v<around|(|\<mu\>|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|C<rsub|2>>\<psi\><around|(|\<zeta\>|)>*\<mu\><rsup|\<delta\>-\<zeta\>-1>*<space|0.17em>d*\<zeta\>.
  </equation>

  If now we introduce the indefinite integrals

  <\equation>
    U<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<lambda\>>u<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>,<space|1em>V<around|(|\<mu\>|)>=<big|int><rsub|0><rsup|\<mu\>>v<around|(|\<mu\>|)>*<space|0.17em>d*\<mu\>
  </equation>

  and then put

  <\equation>
    R<around|(|\<lambda\>|)>=A<around|(|\<lambda\>|)>+U<around|(|\<lambda\>|)>,<space|1em>S<around|(|\<mu\>|)>=B<around|(|\<mu\>|)>+V<around|(|\<mu\>|)>
  </equation>

  then the relation (54) assumes the \Punified\Q appearance

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*x>*<space|0.17em>d*R<around|(|\<lambda\>|)>=x<rsup|-\<delta\>>*<big|int><rsub|0><rsup|\<infty\>>exp
    <around*|(|-<frac|\<mu\>|x>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  in which the residual part <math|P<around|(|x|)>> has been assimilated to
  the modular part proper.

  This assimilation, however, is a very superficial one in that relation (69)
  as such is no longer equivalent to a functional equation

  <\equation>
    \<Gamma\><around|(|s|)>*<wide|\<varphi\>|~><around|(|s|)>=\<Gamma\>*<around|(|\<delta\>-s|)>*<wide|\<psi\>|~>*<around|(|\<delta\>-s|)>
  </equation>

  with would-be expansions

  <\equation>
    <wide|\<varphi\>|~><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>\<lambda\><rsup|-s>*<space|0.17em>d*R<around|(|\<lambda\>|)>,<space|1em><wide|\<psi\>|~><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>\<mu\><rsup|-s>*<space|0.17em>d*S<around|(|\<mu\>|)>,
  </equation>

  such expansions not converging. In fact if we take an equation (48) of the
  classical type in which <math|\<chi\><around|(|s|)>> has two simple poles,
  at <math|s=0> and <math|s=\<delta\>> then <math|P<around|(|x|)>> is of the
  form (36), and our decomposition (61) can be done in only one way with

  <\equation>
    M<around|(|x|)>=-b<rsub|0>*x<rsup|-\<delta\>>,<space|1em>N<around|(|x|)>=-a<rsub|0>*x<rsup|-\<delta\>>
  </equation>

  <\equation>
    u<around|(|\<lambda\>|)>=-b<rsub|0>*\<lambda\><rsup|\<delta\>-1>,<space|1em>v<around|(|\<mu\>|)>=-a<rsub|0>*\<mu\><rsup|\<delta\>-1>.
  </equation>

  The would-be expansion <math|<wide|\<varphi\>|~><around|(|s|)>> would then
  be the sum of the previous expansion <math|\<varphi\><around|(|s|)>>, which
  exists, and of a would-be integral

  <\equation*>
    <big|int><rsub|0><rsup|\<infty\>>\<lambda\><rsup|-s>*u<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>=-b<rsub|0>*<big|int><rsub|0><rsup|\<infty\>>\<lambda\><rsup|-s+\<delta\>-1>*<space|0.17em>d*\<lambda\>,
  </equation*>

  which latter however is undefinable.

  We further notice that if there are singularities of
  <math|\<chi\><around|(|s|)>> in the interior of the strip
  <math|0\<less\>\<sigma\>\<less\>\<delta\>>, the decomposition (61) of
  <math|P<around|(|x|)>> is no longer unique, and that the terms originating
  from the poles at <math|s=0> and <math|s=\<delta\>> are assigned wrong
  positions as it were. Thus if we start from a relation

  <\equation>
    <big|sum>a<rsub|m>*e<rsup|-\<lambda\><rsub|m>*x>-x<rsup|-\<delta\>>*<big|sum>b<rsub|n>*exp
    <around|(|-\<mu\><rsub|n>*x<rsup|-1>|)>=-a<rsub|0>+b<rsub|0>*x<rsup|-\<delta\>>
  </equation>

  then the decomposition (61) leads to

  <\equation>
    -b<rsub|0>*x<rsup|-\<delta\>>+<big|sum>a<rsub|m>*e<rsup|-\<lambda\><rsub|m>*x>=x<rsup|-\<delta\>>*<around|(|-a<rsub|0>*x+<big|sum>b<rsub|n>*exp
    <around|(|\<mu\><rsub|n>*x<rsup|-1>|)>|)>
  </equation>

  whereas, obviously, the \Pnatural\Q decomposition would be

  <\equation>
    <big|sum>a<rsub|m>*e<rsup|-\<lambda\><rsub|m>*x>=x<rsup|-\<delta\>>*<big|sum>b<rsub|n>*exp
    <around|(|\<mu\><rsub|n>*x<rsup|-1>|)>
  </equation>

  with <math|\<lambda\><rsub|0>=\<mu\><rsub|0>=1>.

  We are for the present terminating the general discussion of \Prelations\Q
  and \Pequations\Q and further supplementary remarks will be made in Section
  III.

  <section*|Section II. Summation Formulas>

  <subsection*|4.>

  We now take any relation of the form (69), that is

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*x>*<space|0.17em>d*R<around|(|\<lambda\>|)>=x<rsup|-\<delta\>>*<big|int><rsub|0><rsup|\<infty\>>exp
    <around*|(|-<frac|\<mu\>|x>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>,
  </equation>

  no matter how originating, and we only postulate as follows. The function
  <math|R<around|(|\<lambda\>|)>> is of bounded variation in any finite
  interval <math|0\<le\>\<lambda\>\<le\>\<lambda\><rprime|'>> and so is
  <math|S<around|(|\<mu\>|)>> in any finite interval
  <math|0\<le\>\<mu\>\<le\>\<mu\><rprime|'>>, and either function may have a
  saltus at the origin so as to include equation (76) with <math|a<rsub|0>>
  and <math|b<rsub|0>> not zero; and as before we assume that there are
  constants <math|\<alpha\>\<gtr\>0,\<beta\>\<gtr\>0>, which will be always
  denoted by these letters, such that

  <\equation>
    <big|int><rsub|1><rsup|\<infty\>>\<lambda\><rsup|-\<alpha\>>*<space|0.17em><around|\||d*R<around|(|\<lambda\>|)>|\|>\<less\>\<infty\>
  </equation>

  <\equation>
    <big|int><rsub|1><rsup|\<infty\>>\<mu\><rsup|-\<beta\>>*<space|0.17em><around|\||d*S<around|(|\<mu\>|)>|\|>\<less\>\<infty\>.
  </equation>

  Now, such a relation (77) \Pgenerates\Q the \Psummation formula\Q

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>f<around|(|\<lambda\>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<infty\>>g<around|(|\<mu\>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  in which <math|f<around|(|\<lambda\>|)>> is an \Parbitrary\Q function in
  <math|0\<le\>\<lambda\>\<less\>\<infty\>> and <math|g<around|(|\<mu\>|)>>
  is the Hankel transform

  <\equation>
    g<around|(|\<mu\>|)>=\<mu\><rsup|-<frac|1|2>*<around|(|\<delta\>-1|)>>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|\<delta\>-1>*<around|(|2*<around|(|\<lambda\>*\<mu\>|)><rsup|1/2>|)>*\<lambda\><rsup|<frac|1|2>*<around|(|\<delta\>-1|)>>*f<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>,
  </equation>

  in which <math|J<rsub|\<nu\>><around|(|x|)>> is the ordinary Bessel
  function. The transformation (81) is self-inversive, so that, at least
  formally, it implies and is implied by the formula

  <\equation>
    f<around|(|\<lambda\>|)>=\<lambda\><rsup|-<frac|1|2>*<around|(|\<delta\>-1|)>>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|\<delta\>-1>*<around|(|2*<around|(|\<lambda\>*\<mu\>|)><rsup|1/2>|)>*\<mu\><rsup|<frac|1|2>*<around|(|\<delta\>-1|)>>*g<around|(|\<mu\>|)>*<space|0.17em>d*\<mu\>;
  </equation>

  and we also note that on substituting

  <\equation*>
    J<rsub|\<nu\>><around|(|x|)>=<frac|x<rsup|\<nu\>>|\<Gamma\>*<around|(|\<nu\>+1|)>>*<around|{|1+<around|(|<text|higher
    powers>|)>|}>,
  </equation*>

  the transforms (81) and (82) obtain the limiting values

  <\equation*>
    g<around|(|0|)>=<big|int><rsub|0><rsup|\<infty\>><frac|\<lambda\><rsup|\<delta\>-1>|\<Gamma\><around|(|\<delta\>|)>>*f<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>
  </equation*>

  <\equation*>
    f<around|(|0|)>=<big|int><rsub|0><rsup|\<infty\>><frac|\<mu\><rsup|\<delta\>-1>|\<Gamma\><around|(|\<delta\>|)>>*g<around|(|\<mu\>|)>*<space|0.17em>d*\<mu\>
  </equation*>

  and that such a limiting value is to be employed whenever
  <math|S<around|(|\<mu\>|)>> or <math|R<around|(|\<lambda\>|)>> has a
  discontinuity at the origin.

  Furthermore if

  <\equation*>
    <around|{|f<around|(|\<lambda\>|)>,g<around|(|\<mu\>|)>|}>
  </equation*>

  are a pair of functions thus connected then for every <math|x\<gtr\>0> the
  pair

  <\equation*>
    <around*|{|f*<around|(|\<lambda\>*x|)>,<space|1em>x<rsup|-\<delta\>>*g<around*|(|<frac|\<mu\>|x>|)>|}>
  </equation*>

  will also so be, and thus we might just as well write (80) in the seemingly
  more general form

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>f*<around|(|\<lambda\>*x|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>=x<rsup|-\<delta\>>*<big|int><rsub|0><rsup|\<infty\>>g<around*|(|<frac|\<mu\>|x>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  of which it is technically the special case <math|x=1>. If so written, the
  summation formula subsumes the original relation (77) as a particular case
  of itself in agreement with the known formula, see [17], p.<nbsp>394,

  <\equation>
    e<rsup|-\<lambda\>>=\<lambda\><rsup|-<frac|1|2>*<around|(|\<delta\>-1|)>>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|\<delta\>-1>*<around|(|2*<around|(|\<lambda\>*\<mu\>|)><rsup|1/2>|)>*\<mu\><rsup|<frac|1|2>*<around|(|\<delta\>-1|)>>*e<rsup|-\<mu\>>*<space|0.17em>d*\<mu\>
  </equation>

  and we are going to use this fact very directly towards obtaining a
  rigorous criterion for the validity of our summation formula; and the
  criterion will be such that in consequence of its hypothesis both sides in
  (80) will be convergent absolutely.

  <subsection*|5.>

  Relation (77) is valid not only for real <math|x> in the half-line

  <\equation*>
    0\<less\>x\<less\>\<infty\>
  </equation*>

  but for complex <math|x=\<xi\>+i*\<eta\>> in the half-plane

  <\equation*>
    H:0\<less\>\<xi\>\<less\>\<infty\>,<space|1em>-\<infty\>\<less\>\<eta\>\<less\>\<infty\>
  </equation*>

  thus,

  <\equation*>
    <big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*<around|(|\<xi\>+i*\<eta\>|)>>*<space|0.17em>d*R<around|(|\<lambda\>|)>=<around|(|\<xi\>+i*\<eta\>|)><rsup|-\<delta\>>*<big|int><rsub|0><rsup|\<infty\>>exp
    <around*|(|-<frac|\<mu\>|\<xi\>+i*\<eta\>>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation*>

  and this implies formally the equality

  <\equation*>
    <big|int><rsub|H><around*|(|<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*<around|(|\<xi\>+i*\<eta\>|)>>*<space|0.17em>d*R<around|(|\<lambda\>|)>|)>*<space|0.17em>d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>=<big|int><rsub|H><around|(|\<xi\>+i*\<eta\>|)><rsup|-\<delta\>><around*|(|<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<mu\>*<around|(|\<xi\>+i*\<eta\>|)><rsup|-1>>*<space|0.17em>d*S<around|(|\<mu\>|)>|)>*<space|0.17em>d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>
  </equation*>

  for an \Parbitrary\Q Stieltjes\URadon \Pdistribution\Q
  <math|\<rho\>*<around|(|\<xi\>,\<eta\>|)>> in <math|H>. If we invert
  integrations we obtain

  <\equation*>
    <big|int><rsub|0><rsup|\<infty\>>f<around|(|\<lambda\>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<infty\>><wide|g|~><around|(|\<mu\>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation*>

  where

  <\equation>
    f<around|(|\<lambda\>|)>=<big|int><rsub|H>e<rsup|-\<lambda\>*<around|(|\<xi\>+i*\<eta\>|)>>*<space|0.17em>d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>
  </equation>

  <\equation>
    <wide|g|~><around|(|\<mu\>|)>=<big|int><rsub|H><around|(|\<xi\>+i*\<eta\>|)><rsup|-\<delta\>>*e<rsup|-\<mu\>*<around|(|\<xi\>+i*\<eta\>|)><rsup|-1>>*<space|0.17em>d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>,
  </equation>

  and by Fubini's theorem all this is rigorous, with all occurring integrals
  converging absolutely, provided we have

  <\equation>
    <big|int><rsub|H><around|\||d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>|\|>\<less\>\<infty\>
  </equation>

  <\equation*>
    <big|int><rsub|H><around|(|\<xi\><rsup|2>+\<eta\><rsup|2>|)><rsup|-\<delta\>/2>*<around|\||d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>|\|>\<less\>\<infty\>
  </equation*>

  <\equation>
    <big|int><rsub|H>e<rsup|-\<lambda\>*\<xi\>>*<around|\||d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>|\|>=O<around|(|\<lambda\><rsup|-\<alpha\>>|)>,<space|1em>\<lambda\>\<to\>\<infty\>
  </equation>

  <\equation>
    <big|int><rsub|H><around|(|\<xi\><rsup|2>+\<eta\><rsup|2>|)><rsup|-\<delta\>/2>*exp
    <around*|(|-<frac|\<mu\>*\<xi\>|\<xi\><rsup|2>+\<eta\><rsup|2>>|)>*<around|\||d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>|\|>=O<around|(|\<mu\><rsup|-\<beta\>>|)>,<space|1em>\<mu\>\<to\>\<infty\>.
  </equation>

  However we do not yet know whether the function
  <math|<wide|g|~><around|(|\<mu\>|)>> is identical with the function
  <math|g<around|(|\<mu\>|)>> as related to <math|f<around|(|\<lambda\>|)>>
  by means of relation (81). But from (84) we deduce

  <\equation>
    <around|(|\<xi\>+i*\<eta\>|)><rsup|-\<delta\>>*e<rsup|-\<mu\>*<around|(|\<xi\>+i*\<eta\>|)><rsup|-1>>=\<mu\><rsup|-<frac|1|2>*<around|(|\<delta\>-1|)>>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|\<delta\>-1>*<around|(|2*<around|(|\<mu\>*\<lambda\>|)><rsup|1/2>|)>*\<lambda\><rsup|<frac|1|2>*<around|(|\<delta\>-1|)>>*e<rsup|-\<lambda\>*<around|(|\<xi\>+i*\<eta\>|)>>*<space|0.17em>d*\<lambda\>
  </equation>

  and if we substitute this in (86) and apply Fubini's theorem we obtain
  indeed (81), provided we have

  <\equation>
    <big|int><rsub|\<lambda\>=0><rsup|\<infty\>>\<mu\><rsup|-<frac|1|2>*<around|(|\<delta\>-1|)>>*<big|int><rsub|H><around|\||J<rsub|\<delta\>-1>*<around|(|2*<around|(|\<lambda\>*\<mu\>|)><rsup|1/2>|)>*<around|\||\<lambda\><rsup|<frac|1|2>*<around|(|\<delta\>-1|)>>*e<rsup|-\<lambda\>*\<xi\>>|\|>*d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>|\|>*<space|0.17em>d*\<lambda\>\<less\>\<infty\>
  </equation>

  for every <math|\<mu\>\<geqq\>0>. Now, for
  <math|\<delta\>\<geqq\><frac|1|2>> we have

  <\equation>
    <around|\||J<rsub|\<delta\>-1>*<around|(|2*x|)>|\|>\<leqq\>M*x<rsup|\<delta\>-1>,<space|1em>0\<less\>x\<less\>\<infty\>
  </equation>

  whereas for <math|0\<less\>\<delta\>\<less\><frac|1|2>> we have

  <\equation>
    <around|\||J<rsub|\<delta\>-1>*<around|(|2*x|)>|\|>\<leqq\><choice|<tformat|<table|<row|<cell|M*x<rsup|\<delta\>-1>,>|<cell|0\<less\>x\<leqq\>1>>|<row|<cell|M*x<rsup|-<frac|1|2>>,>|<cell|1\<less\>x\<less\>\<infty\>>>>>>
  </equation>

  and therefore (91) is satisfied if we have

  <\equation>
    <big|int><rsub|H>\<xi\><rsup|-\<delta\>>*<around|\||d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>|\|>\<less\>\<infty\>,<space|1em><text|for
    >0\<less\>\<delta\>\<less\>\<infty\>,
  </equation>

  and also

  <\equation>
    <big|int><rsub|H>\<xi\><rsup|-<around|(|\<delta\>/2+1/4|)>>*<around|\||d*\<rho\>*<around|(|\<xi\>,\<eta\>|)>|\|>\<less\>\<infty\>*<space|1em><text|for
    >0\<less\>\<delta\>\<less\><frac|1|2>,
  </equation>

  and this is certainly the case if for <math|0\<less\>\<delta\>\<less\>\<infty\>>
  assumptions (87) and (94) hold and for <math|0\<less\>\<delta\>\<less\><frac|1|2>>
  also (95).

  <subsection*|6.>

  If the set-function in <math|H> is concentrated entirely on the half-line
  <math|0\<less\>\<xi\>\<less\>\<infty\>>, <math|\<eta\>=0> we have a
  representation

  <\equation>
    f<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*\<xi\>>*<space|0.17em>d*\<rho\><around|(|\<xi\>|)>,
  </equation>

  and if the set function is also non-negative then on account of (87) we
  have

  <\equation>
    d*\<rho\><around|(|\<xi\>|)>\<geqq\>0,<space|1em><big|int><rsub|0><rsup|\<infty\>>d*\<rho\><around|(|\<xi\>|)>\<less\>\<infty\>
  </equation>

  and our function <math|f<around|(|\<lambda\>|)>> is completely monotone in
  <math|0\<leqq\>\<lambda\>\<less\>\<infty\>>. The two conditions (87) and
  (94) merge into the one

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>\<xi\><rsup|-\<delta\>>*d*\<rho\><around|(|\<xi\>|)>\<less\>\<infty\>,<space|1em>0\<less\>\<delta\>\<less\>\<infty\>,
  </equation>

  and the further condition (95) reads

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>\<xi\><rsup|-<around|(|\<delta\>/2+1/4|)>>*d*\<rho\><around|(|\<xi\>|)>\<less\>\<infty\>,<space|1em>0\<less\>\<delta\>\<less\><frac|1|2>
  </equation>

  and it can also be seen that (98) and (99) are then equivalent with

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>\<lambda\><rsup|\<delta\>-1>*f<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>\<less\>\<infty\>,<space|1em>0\<less\>\<delta\>\<less\>\<infty\>
  </equation>

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>\<lambda\><rsup|\<delta\>/2-3/4>*f<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>\<less\>\<infty\>,<space|1em>0\<less\>\<delta\>\<less\><frac|1|2>,
  </equation>

  respectively. We furthermore note that (86) reads

  <\equation>
    <wide|g|~><around|(|\<mu\>|)>=<big|int><rsub|0><rsup|\<infty\>>\<xi\><rsup|-\<delta\>>*e<rsup|-\<mu\>*\<xi\><rsup|-1>>*d*\<rho\><around|(|\<xi\>|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<mu\>*\<xi\>>*\<xi\><rsup|\<delta\>>*d*\<rho\>*<around|(|1/\<xi\>|)>
  </equation>

  so that this function is also completely monotone in
  <math|0\<leqq\>\<mu\>\<less\>\<infty\>> and we may state the following
  theorem.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 6.> <em|If
  <math|f<around|(|\<lambda\>|)>> is completely monotone in
  <math|0\<leqq\>\<lambda\>\<less\>\<infty\>> and (100) and (101) holds, then
  the transform (81) exists and is completely monotone in
  <math|0\<leqq\>\<mu\>\<less\>\<infty\>>.>

  <em|If moreover we have>

  <\equation>
    f<around|(|\<lambda\>|)>=O<around|(|\<lambda\><rsup|-\<alpha\>>|)>,<space|1em>g<around|(|\<mu\>|)>=O<around|(|\<mu\><rsup|-\<beta\>>|)>
  </equation>

  <em|for large <math|\<lambda\>> and <math|\<mu\>>, then our summation
  formula (80), and also (83) holds with both sides converging absolutely.>

  <em|If <math|R<around|(|\<lambda\>|)>> and <math|S<around|(|\<mu\>|)>> are
  monotonely non-decreasing as they are for instance in the case of relation
  (76) with <math|a<rsub|m>\<geqq\>0,b<rsub|n>\<geqq\>0>, then assumption
  (103) may be omitted and formula (80) holds whether the value of any of its
  two sides is finite or <math|+\<infty\>>.>

  The last part of the theorem follows from the fact that for
  <math|d*R<around|(|\<lambda\>|)>\<geqq\>0,d*S<around|(|\<mu\>|)>\<geqq\>0,d*\<rho\><around|(|\<xi\>|)>\<geqq\>0>
  the order of integrations in the repeated integrals occurring in

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*\<xi\>>*<space|0.17em>d*R<around|(|\<lambda\>|)>*d*\<rho\><around|(|\<xi\>|)>=<big|int><rsub|0><rsup|\<infty\>><big|int><rsub|0><rsup|\<infty\>>\<xi\><rsup|-\<delta\>>*e<rsup|-\<mu\>*\<xi\><rsup|-1>>*<space|0.17em>d*S<around|(|\<mu\>|)>*d*\<rho\><around|(|\<xi\>|)>
  </equation>

  may be always interchanged.

  <subsection*|7.>

  Another situation arises if the set function is concentrated on a line

  <\equation>
    \<xi\>=\<epsilon\>\<gtr\>0,<space|1em>-\<infty\>\<less\>\<eta\>\<less\>\<infty\>
  </equation>

  which is parallel to the <math|\<eta\>>-axis, that is if we have a
  representation

  <\equation>
    f<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-\<lambda\>*<around|(|\<epsilon\>+i*\<eta\>|)>>*<space|0.17em>d*\<sigma\><around|(|\<eta\>|)>
  </equation>

  and the reader will verify the following statements.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 7.> <em|If a
  function <math|f<around|(|\<lambda\>|)>> in
  <math|0\<leqq\>\<lambda\>\<less\>\<infty\>> can be continued into the
  entire line <math|-\<infty\>\<less\>\<lambda\>\<less\>\<infty\>> in such a
  manner that for some <math|\<epsilon\>\<gtr\>0> the function
  <math|f<rsub|\<epsilon\>><around|(|\<lambda\>|)>=e<rsup|\<epsilon\>*\<lambda\>>*f<around|(|\<lambda\>|)>>
  has a representation>

  <\equation>
    f<rsub|\<epsilon\>><around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*\<eta\>>*<space|0.17em>d*\<sigma\><around|(|\<eta\>|)>
  </equation>

  <em|with>

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||d*\<sigma\><around|(|\<eta\>|)>|\|>\<less\>\<infty\>
  </equation>

  <em|then the integral (81) by which <math|g<around|(|\<mu\>|)>> is defined
  is absolutely convergent, and if moreover>

  <\equation>
    <around*|(|<big|int><rsub|-\<infty\>><rsup|-1>+<big|int><rsub|+1><rsup|\<infty\>>|)>*exp
    <around*|(|-<frac|\<mu\>*\<epsilon\>|\<epsilon\><rsup|2>+\<eta\><rsup|2>>|)>*<around|\||d*\<sigma\><around|(|\<eta\>|)>|\|>=O<around|(|\<mu\><rsup|-\<beta\>>|)>,<space|1em>\<mu\>\<to\>\<infty\>,
  </equation>

  <em|then the summation formula (80) holds with both sides converging
  absolutely.>

  This leads to the following corollary

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 8.> <em|The
  summation formula holds if for some <math|\<epsilon\>\<gtr\>0> we have a
  representation>

  <\equation>
    e<rsup|\<epsilon\>*\<lambda\>>*f<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|-i*\<lambda\>*\<eta\>>*\<tau\><around|(|\<eta\>|)>*<space|0.17em>d*\<eta\>
  </equation>

  <em|with>

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>><around|\||\<tau\><around|(|\<eta\>|)>|\|>*<space|0.17em>d*\<eta\>\<less\>\<infty\>
  </equation>

  <em|and>

  <\equation>
    <around*|(|<big|int><rsub|-\<infty\>><rsup|-1>+<big|int><rsub|+1><rsup|\<infty\>>|)>*\<eta\><rsup|4*\<beta\>-2*\<delta\>+1><around|\||\<tau\><around|(|\<eta\>|)>|\|><rsup|2>*<space|0.17em>d*\<eta\>\<less\>\<infty\>.
  </equation>

  In fact, in order to verify (109) we note that we have

  <\equation*>
    <around*|(|<big|int><rsub|1><rsup|\<infty\>>\<eta\><rsup|-\<delta\>>*exp
    <around*|(|-<frac|\<mu\>*\<epsilon\>|\<epsilon\><rsup|2>+\<eta\><rsup|2>>|)><around|\||\<tau\><around|(|\<eta\>|)>|\|>*<space|0.17em>d*\<eta\>|)><rsup|2>\<leqq\><big|int><rsub|1><rsup|\<infty\>>\<eta\><rsup|-4*\<beta\>-1>*exp
    <around*|(|<frac|2*\<mu\>*\<epsilon\>|\<epsilon\><rsup|2>+\<eta\><rsup|2>>|)>*<space|0.17em>d*\<eta\>
  </equation*>

  <\equation*>
    \<cdot\><big|int><rsub|1><rsup|\<infty\>>\<eta\><rsup|4*\<beta\>-2*\<delta\>+1><around|\||\<tau\><around|(|\<eta\>|)>|\|><rsup|2>*<space|0.17em>d*\<eta\>,
  </equation*>

  and that the first factor on the right is
  <math|O<around|(|\<mu\><rsup|-2*\<beta\>>|)>> as
  <math|\<mu\>\<to\>\<infty\>>; and similarly for the interval
  <math|<around|(|-\<infty\>,-1|)>>.

  Since

  <\equation>
    <around*|(|<big|int><rsub|1><rsup|\<infty\>><around|\||\<tau\><around|(|\<eta\>|)>|\|>*<space|0.17em>d*\<eta\>|)><rsup|2>\<leqq\><big|int><rsub|1><rsup|\<infty\>>\<eta\><rsup|-2>*<space|0.17em>d*\<eta\>*<big|int><rsub|1><rsup|\<infty\>>\<eta\><rsup|2><around|\||\<tau\><around|(|\<eta\>|)>|\|><rsup|2>*<space|0.17em>d*\<eta\>,
  </equation>

  then by the theory of Plancherel transforms, see [5], the following
  conclusion from Theorem 8 will be drawn.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 9.> <em|If <math|p>
  is an integer such that>

  <\equation>
    p\<geqq\>max <around|(|1,2*\<beta\>-\<delta\>+<tfrac|1|2>|)>;
  </equation>

  <em|and if <math|f<around|(|\<lambda\>|)>> in
  <math|0\<leqq\>\<lambda\>\<less\>\<infty\>> has <math|p-1> continuous
  derivatives, and if <math|f<rsup|<around|(|p-1|)>><around|(|\<lambda\>|)>>
  is the indefinite integral of a function
  <math|f<rsup|<around|(|p|)>><around|(|\<lambda\>|)>> which latter function
  is square integrable in every finite interval; and if the <math|p+1>
  functions <math|f<around|(|\<lambda\>|)>,f<rprime|'><around|(|\<lambda\>|)>,\<ldots\>,f<rsup|<around|(|p|)>><around|(|\<lambda\>|)>>
  are <math|O<around|(|e<rsup|-2*\<epsilon\>*\<lambda\>>|)>> as
  <math|\<lambda\>\<to\>+\<infty\>> for some <math|\<epsilon\>\<gtr\>0>; then
  the summation formula holds with both sides converging absolutely.>

  <em|Proof.> We can extend the function <math|f<around|(|\<lambda\>|)>> into
  <math|-\<infty\>\<less\>\<lambda\>\<less\>0> so that it vanish in a left
  half-line <math|\<lambda\>\<leqq\>\<lambda\><rprime|'>\<less\>0> and
  preserve all the differentiability properties stipulated for the entire
  line <math|-\<infty\>\<less\>\<lambda\>\<less\>\<infty\>>. The function

  <\equation>
    f<rsub|\<epsilon\>><around|(|\<lambda\>|)>=e<rsup|\<epsilon\>*\<lambda\>>*f<around|(|\<lambda\>|)>
  </equation>

  will then have <math|p> derivatives <math|f<rsub|\<epsilon\>><rsup|<around|(|q|)>><around|(|\<lambda\>|)>,q=1,\<ldots\>,p>,
  having similar properties in <math|-\<infty\>\<less\>\<lambda\>\<less\>\<infty\>>,
  and the <math|p+1> functions <math|f<rsub|\<epsilon\>>,f<rsub|\<epsilon\>><rprime|'>,\<ldots\>,f<rsub|\<epsilon\>><rsup|<around|(|p|)>>>
  are each of integrable square in <math|<around|(|-\<infty\>,\<infty\>|)>>
  and for the Plancherel transform

  <\equation>
    \<tau\><around|(|\<eta\>|)>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<infty\>><rsup|\<infty\>>e<rsup|i*\<eta\>*\<lambda\>>*f<rsub|\<epsilon\>><around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>
  </equation>

  we then have, see [5],

  <\equation>
    <big|int><rsub|-\<infty\>><rsup|\<infty\>>\<eta\><rsup|2*p><around|\||\<tau\><around|(|\<eta\>|)>|\|><rsup|2>*<space|0.17em>d*\<eta\>\<less\>\<infty\>,
  </equation>

  and this implies (111) and (112), q.e.d.

  For instance the Riesz kernel

  <\equation>
    f<around|(|\<lambda\>|)>=<choice|<tformat|<table|<row|<cell|<around|(|1-\<lambda\>|)><rsup|\<gamma\>>>|<cell|0\<less\>\<lambda\>\<less\>1>>|<row|<cell|0>|<cell|1\<leqq\>\<lambda\>\<less\>\<infty\>>>>>>
  </equation>

  falls under Theorem 9 for <math|\<gamma\>\<gtr\>p-<tfrac|1|2>>, and since

  <\equation>
    \<mu\><rsup|-<frac|1|2>*<around|(|\<delta\>-1|)>>*<big|int><rsub|0><rsup|1>J<rsub|\<delta\>-1>*<around|(|2*<around|(|\<mu\>*\<lambda\>|)><rsup|1/2>|)>*\<lambda\><rsup|<frac|1|2>*<around|(|\<delta\>-1|)>>*<around|(|1-\<lambda\>|)><rsup|\<gamma\>>*<space|0.17em>d*\<lambda\>=\<Gamma\>*<around|(|\<gamma\>+1|)>*\<mu\><rsup|-<frac|1|2>*<around|(|\<delta\>+\<gamma\>|)>>*J<rsub|\<delta\>+\<gamma\>>*<around|(|2*\<mu\><rsup|1/2>|)>,
  </equation>

  we obtain for <math|0\<less\>x\<less\>\<infty\>> the formula

  <\equation>
    <frac|1|\<Gamma\>*<around|(|\<gamma\>+1|)>>*<big|int><rsub|0><rsup|x><around|(|x-\<lambda\>|)><rsup|\<gamma\>>*<space|0.17em>d*R<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<infty\>><around*|(|<frac|x|\<mu\>>|)><rsup|<frac|1|2>*<around|(|\<delta\>+\<gamma\>|)>>*J<rsub|\<delta\>+\<gamma\>>*<around|(|2*<around|(|x*\<mu\>|)><rsup|1/2>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  for <math|\<gamma\>\<gtr\>p-<tfrac|1|2>> where
  <math|p\<geqq\>1,p\<geqq\>2*\<beta\>-\<delta\>+<tfrac|1|2>>.

  Now, due to (99) the right side in (120) is absolutely convergent for

  <\equation>
    \<gamma\>\<geqq\>2*\<beta\>-\<delta\>-<tfrac|1|2>
  </equation>

  which is a smaller value, and if we differentiate both sides in (120) with
  regard to <math|x> a suitable number of times we obtain the following
  conclusion.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 10.> <em|Relation
  (120) is valid if <math|\<gamma\>\<geqq\>2*\<beta\>-\<delta\>-<tfrac|1|2>>
  and <math|\<gamma\>\<gtr\>0> simultaneously.>

  <em|Also the restriction <math|\<gamma\>\<gtr\>0> may be dropped for values
  of <math|x> in the neighborhood of which <math|R<around|(|\<lambda\>|)>> is
  constant or only differentiable sufficiently often.>

  The topic of Theorem 10 will be continued in Section IV and in the next
  section we will first assemble some remarks on subjects we will not discuss
  in detail.

  <section*|Section III. Supplementary Remarks>

  <subsection*|8.>

  For fixed <math|\<epsilon\>\<gtr\>0,\<rho\>\<gtr\>0>, the function

  <\equation>
    e<rsup|-\<epsilon\>*\<lambda\>>*J<rsub|\<delta\>-1>*<around|(|2*<around|(|\<lambda\>*\<rho\>|)><rsup|1/2>|)>*\<lambda\><rsup|-<frac|1|2>*<around|(|\<delta\>-1|)>>
  </equation>

  if viewed as an <math|f<around|(|\<lambda\>|)>> falls under Theorem 9 and
  this leads to the rigorous relation

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<epsilon\>*\<lambda\>>*\<lambda\><rsup|-<frac|1|2>*<around|(|\<delta\>-1|)>>*J<rsub|\<delta\>-1>*<around|(|2*<around|(|\<lambda\>*\<rho\>|)><rsup|1/2>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<infty\>>\<mu\><rsup|-<frac|1|2>*<around|(|\<delta\>-1|)>>*<frac|1|\<epsilon\>>*exp
    <around*|(|-<frac|\<rho\>+\<mu\>|\<epsilon\>>|)>*I<rsub|\<delta\>-1>*<around*|(|<frac|2|\<epsilon\>>*<around|(|\<rho\>*\<mu\>|)><rsup|1/2>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  in which <math|I<rsub|\<nu\>><around|(|x|)>> is the Bessel function with
  imaginary argument, see [17], p.<nbsp>396.

  But now start with a function <math|g<around|(|\<rho\>|)>> in
  <math|0\<leqq\>\<rho\>\<less\>\<infty\>>, multiply both sides of (123) with
  it, integrate with respect to <math|\<rho\>> and interchange integrations.
  We then obtain formally

  <\equation>
    <big|int>f<around|(|\<lambda\>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>=<big|int>g<rsub|\<epsilon\>><around|(|\<mu\>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  where <math|f<around|(|\<lambda\>|)>> is defined by (82) and
  <math|g<rsub|\<epsilon\>><around|(|\<mu\>|)>> by

  <\equation>
    g<rsub|\<epsilon\>><around|(|\<mu\>|)>=<frac|1|\<epsilon\>>*<big|int><rsub|0><rsup|\<infty\>>exp
    <around*|(|-<frac|\<rho\>+\<mu\>|\<epsilon\>>|)>*I<rsub|\<delta\>-1>*<around*|(|<frac|2|\<epsilon\>>*<around|(|\<rho\>*\<mu\>|)><rsup|1/2>|)>*g<around|(|\<rho\>|)>*<space|0.17em>d*\<rho\>.
  </equation>

  Now, the comparison of (125) with (80) suggests that we ought to have the
  relation

  <\equation>
    lim<rsub|\<epsilon\>\<to\>0> g<rsub|\<epsilon\>><around|(|\<mu\>|)>=g<around|(|\<mu\>|)>
  </equation>

  in the sense that for a general function <math|g<around|(|\<mu\>|)>> the
  associated function <math|g<rsub|\<epsilon\>><around|(|\<mu\>|)>> as
  defined by (125) is a kind of approximation to it and that relation (126)
  holds literally subject to criteria for <math|g<around|(|\<mu\>|)>>. Such
  is indeed the case, see for instance [4], and on another occasion we will
  show that it is possible to strengthen the criteria so as to obtain the
  further relation

  <\equation>
    lim<rsub|\<epsilon\>\<to\>0> <big|int><rsub|0><rsup|\<infty\>>g<rsub|\<epsilon\>><around|(|\<mu\>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>=<big|int><rsub|0><rsup|\<infty\>>g<around|(|\<mu\>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  with the right side converging absolutely, say. Now, whenever this takes
  place, (124) leads to

  <\equation>
    lim<rsub|\<epsilon\>\<to\>0> <big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<epsilon\>*\<lambda\>>*f<around|(|\<lambda\>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<infty\>>g<around|(|\<mu\>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>,
  </equation>

  and this is obviously (80) itself with the understanding that the left side
  in (80) shall be evaluated by a Gauss limiting process as indicated.

  <subsection*|9.>

  In the ordinary theory of Fourier series and integrals see [5], the Gauss
  summability factor is <math|e<rsup|-\<epsilon\>*x<rsup|2>>>, and
  <math|e<rsup|-\<epsilon\>*x>> is the abelian one, but in our present
  normalization these factors are <math|e<rsup|-\<epsilon\>*\<lambda\>>> and
  <math|e<rsup|-\<epsilon\>*\<lambda\><rsup|1/2>>> respectively. This
  square-root has been introduced into our set-up by the manner in which it
  appears in the kernels of the transformations (81) and (82), and it must be
  taken into account when comparing our present summation formula with the
  classical summation formula of Poisson. If applied to relation (76) our
  formula (80) reads

  <\equation>
    <big|sum><rsub|0><rsup|\<infty\>>a<rsub|m>*f<around|(|\<lambda\><rsub|m>|)>=<big|sum><rsub|0><rsup|\<infty\>>b<rsub|n>*g<around|(|\<mu\><rsub|n>|)>
  </equation>

  and in the case of the Jacobi relation

  <\equation>
    <big|sum><rsub|0><rsup|\<infty\>>r<rsub|k><around|(|n|)>*e<rsup|-\<pi\>*x*n>=x<rsup|-k/2>*<big|sum><rsub|0><rsup|\<infty\>>r<rsub|k><around|(|n|)>*exp
    <around*|(|-<frac|\<pi\>*n|x>|)>
  </equation>

  in which <math|r<rsub|k><around|(|n|)>> is the number of representations
  <math|n=n<rsub|1><rsup|2>+\<ldots\>+n<rsub|k><rsup|2>>, with
  <math|r<rsub|k><around|(|0|)>=1>, (129) is

  <\equation>
    <big|sum><rsub|0><rsup|\<infty\>>r<rsub|k><around|(|n|)>*f*<around|(|\<pi\>*n|)>=<big|sum><rsub|0><rsup|\<infty\>>r<rsub|k><around|(|n|)>*g*<around|(|\<pi\>*n|)>.
  </equation>

  On the other hand if we take any function
  <math|F<around|(|x<rsub|1>,\<ldots\>,x<rsub|k>|)>> with period
  <math|2*\<pi\>> in each variable and put

  <\equation>
    G<around|(|y<rsub|1>,\<ldots\>,y<rsub|k>|)>=<big|int><rsub|E<rsub|k>>F<around|(|x<rsub|1>,\<ldots\>,x<rsub|k>|)>*exp
    <around|(|i*<around|(|y<rsub|1>*x<rsub|1>+\<ldots\>+y<rsub|k>*x<rsub|k>|)>|)>*<space|0.17em>d*x<rsub|1>*\<ldots\>*d*x<rsub|k>,
  </equation>

  then we obtain the Poisson summation formula

  <\equation>
    <big|sum><rsub|n<rsub|1>*\<ldots\>*n<rsub|k>>G<around|(|2*\<pi\>*n<rsub|1>,\<ldots\>,2*\<pi\>*n<rsub|k>|)>=<big|sum><rsub|m<rsub|1>*\<ldots\>*m<rsub|k>>F<around|(|m<rsub|1>,\<ldots\>,m<rsub|k>|)>.
  </equation>

  If <math|F<around|(|x<rsub|1>,\<ldots\>,x<rsub|k>|)>> is a \Pradial\Q
  function, see [2], p.<nbsp>186,

  <\equation>
    F<around|(|x<rsub|1>,\<ldots\>,x<rsub|k>|)>=F<around|(|<around|(|x<rsub|1><rsup|2>+\<ldots\>+x<rsub|k><rsup|2>|)><rsup|1/2>|)>
  </equation>

  then we similarly have

  <\equation>
    G<around|(|y<rsub|1>,\<ldots\>,y<rsub|k>|)>=G<around|(|<around|(|y<rsub|1><rsup|2>+\<ldots\>+y<rsub|k><rsup|2>|)><rsup|1/2>|)>
  </equation>

  where, on putting <math|\<delta\>=k/2>, the connection is

  <\equation>
    G<around|(|y|)>*y<rsup|\<delta\>-1>=<around|(|2*\<pi\>|)><rsup|\<delta\>>*<big|int><rsub|0><rsup|\<infty\>>J<rsub|\<delta\>-1>*<around|(|y*x|)>*x<rsup|\<delta\>>*F<around|(|x|)>*<space|0.17em>d*x,
  </equation>

  and (133) becomes

  <\equation>
    <big|sum><rsub|m=0><rsup|\<infty\>>r<rsub|k><around|(|m|)>*G*<around|(|2*\<pi\>*m<rsup|1/2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>r<rsub|k><around|(|n|)>*F<around|(|n<rsup|1/2>|)>.
  </equation>

  Since (136) implies

  <\equation>
    G*<around|(|2*<around|(|\<pi\>*y|)><rsup|1/2>|)>*y<rsup|<frac|1|2>*<around|(|\<delta\>-1|)>>=<big|int><rsub|0><rsup|\<infty\>>J<rsub|\<delta\>-1>*<around|(|2*<around|(|y*x|)><rsup|1/2>|)>*x<rsup|<frac|1|2>*<around|(|\<delta\>-1|)>>*F<around*|(|<around*|(|<frac|x|\<pi\>>|)><rsup|1/2>|)>*<space|0.17em>d*x,
  </equation>

  we obtain (81) by putting

  <\equation*>
    f<around|(|\<lambda\>|)>=F<around*|(|<around*|(|<frac|\<lambda\>|\<pi\>>|)><rsup|1/2>|)>,<space|1em>g<around|(|\<mu\>|)>=G*<around|(|2*<around|(|\<pi\>*\<mu\>|)><rsup|1/2>|)>
  </equation*>

  and this is the origin of the square-root appearing subsequently.

  We also note that for the same reason the summability factor
  <math|<around|(|x-\<lambda\>|)><rsup|\<gamma\>>> in (120) does not
  correspond to the \Pordinary\Q Fejér\URiesz factor as such but to the
  factor <math|<around|(|R<rsup|2>-\<nu\><rsup|2>|)><rsup|\<gamma\>>> of
  \Pspherical summability\Q, see [3], which is also tellingly indicated by
  the presence of a Bessel function proper on the other side of (120).

  Now, although spherical summability has usually the advantage of greater
  technical elegance over the ordinary one, yet in the theory of modular
  functions there is at least one very important occasion known to us on
  which spherical summability apparently fails where the ordinary one
  succeeds. In the proof of H.<nbsp>Hamburger, [9], for the unique
  determination of the Riemann Zeta function by its functional equation, use
  is made of a relation of the form (120) for <math|\<gamma\>=1>, but it is
  its \Pordinary\Q counterpart, and we are unable to substitute in the
  reasoning formula (120) proper in its stead. Such a substitution would be
  of greatest importance, since it might open the way for obtaining
  uniqueness theorem for Zeta functions other then the very obvious ones.

  Finally we note that the matrix trace in (20) and (21) is a quadratic form
  of the square roots of the eigenvalues of the matrix and that therefore
  these formulas collect the terms by \Pspheres\Q and not by \Pdiagonals\Q,
  first impressions notwithstanding.

  <subsection*|10.>

  We will now make some remarks on the functional equation

  <\equation>
    \<Delta\>*<around|(|\<delta\>-s|)>*\<psi\>*<around|(|\<delta\>-s|)>=\<Delta\><around|(|s|)>*\<varphi\><around|(|s|)>
  </equation>

  in which <math|\<varphi\><around|(|s|)>>, <math|\<psi\><around|(|s|)>> are
  Dirichlet series (49), but the factor <math|\<Delta\><around|(|s|)>> is not
  the Gamma function itself, but some other function suitably circumscribed
  the most notable example of which is the Hecke factor

  <\equation>
    \<Delta\><around|(|s|)>=\<Gamma\><around*|(|<frac|s|2>|)><rsup|r<rsub|1>>*\<Gamma\><around|(|s|)><rsup|r<rsub|2>>
  </equation>

  where <math|r<rsub|2>+2*r<rsub|2>> is the degree of an algebraic number
  field. If <math|\<Delta\><around|(|s|)>> is holomorphic in the right half
  plane <math|\<sigma\>\<gtr\>0>, and <math|\<Delta\>*<around|(|\<sigma\>+i*t|)>>
  belongs to <math|L<rsub|1>*<around|(|-\<infty\>,\<infty\>|)>> uniformly in
  <math|0\<less\>\<sigma\><rsub|1>\<le\>\<sigma\>\<le\>\<sigma\><rsub|2>>,
  then we can set up for <math|x\<gtr\>0> the Mellin transform

  <\equation>
    E<around|(|x|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|a-i*\<infty\>><rsup|a+i*\<infty\>>\<Delta\><around|(|s|)>*x<rsup|-s>*<space|0.17em>d*s,<space|1em>a\<gtr\>0
  </equation>

  and we first of all have

  <\equation>
    E<around|(|x|)>=O<around|(|x<rsup|-\<epsilon\>>|)>,<space|1em>x\<to\>0,
  </equation>

  for every <math|\<epsilon\>\<gtr\>0>. For (140), or more generally for

  <\equation>
    \<Delta\><around|(|s|)>=<big|prod><rsub|j=1><rsup|n>\<Gamma\>*<around|(|p<rsub|j>*s+q<rsub|j>|)>
  </equation>

  where

  <\equation>
    1\<ge\>p<rsub|j>\<gtr\>0,<space|1em><math-up|Re><around|(|q<rsub|j>|)>\<ge\>0
  </equation>

  we also have

  <\equation>
    E<around|(|x|)>=O<around|(|e<rsup|-c*x>|)>,<space|1em>x\<to\>\<infty\>
  </equation>

  for some suitable <math|c\<gtr\>0>; and in fact, we have

  <\equation>
    E*<around|(|\<xi\>+i*\<eta\>|)>\<le\>M*e<rsup|-c*\<xi\>>,<space|1em>\<xi\>\<to\>\<infty\>.
  </equation>

  For a simple factor <math|\<Delta\><around|(|s|)>=\<Gamma\>*<around|(|p*s+q|)>>
  this is obviously so, since we then have

  <\equation>
    E<around|(|x|)>=<frac|1|p>*x<rsup|q/p>*e<rsup|-x<rsup|1/p>>
  </equation>

  and for a product (143) this follows then by successively applying the
  composition rule

  <\equation>
    <frac|1|2*\<pi\>*i>*<big|int><rsub|a-i*\<infty\>><rsup|a+i*\<infty\>>\<Delta\><rsub|1><around|(|s|)>*\<Delta\><rsub|2><around|(|s|)>*x<rsup|-s>*<space|0.17em>d*s=<big|int><rsub|0><rsup|\<infty\>>E<rsub|1><around|(|u|)>*E<rsub|2><around*|(|<frac|x|u>|)><frac|d*u|u>
  </equation>

  Now, if we have (2) and (3), and also (145), we can again obtain from (139)
  the relation

  <\equation>
    <big|sum><rsub|1><rsup|\<infty\>>a<rsub|m>*E*<around|(|\<lambda\><rsub|m>*x|)>=x<rsup|-\<delta\>>*<big|sum><rsub|1><rsup|\<infty\>>b<rsub|n>*E<around*|(|<frac|\<mu\><rsub|n>|x>|)>+P<around|(|x|)>,
  </equation>

  where <math|P<around|(|x|)>> is a residual function as before, and the two
  series in (149) converge absolutely for <math|x\<gtr\>0>, and under
  assumption (146) also for <math|\<xi\>\<gtr\>0>. We can again re-write
  (149) into the \Punified\Q relation

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>E*<around|(|\<lambda\>*x|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>=x<rsup|-\<delta\>>*<big|int><rsub|0><rsup|\<infty\>>E<around*|(|<frac|\<mu\>|x>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>,
  </equation>

  but the very simple relation (76) is usually no longer available, not even
  for the Hecke factor (140), since <math|E<around|(|x|)>> usually does not
  have a (finite) limit for <math|x\<to\>0>.

  On the other hand, (141) can be always inverted to

  <\equation>
    \<Delta\><around|(|s|)>=<big|int><rsub|0><rsup|\<infty\>>E<around|(|x|)>*x<rsup|s-1>*<space|0.17em>d*x
  </equation>

  and consequently it is always possible to proceed from a relation (149) to
  an equation (139) very much under the same kind of conditions as before.

  The relation (150) as such has apparently not been investigated
  systematically in the literature, if it has been previously introduced at
  all. However (150) implies the summation formula

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>f<around|(|\<lambda\>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<infty\>>g<around|(|\<mu\>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  with

  <\equation>
    g<around|(|\<mu\>|)>=\<mu\><rsup|-<frac|1|2>*<around|(|\<delta\>-1|)>>*<big|int><rsub|0><rsup|\<infty\>>K*<around|(|\<lambda\>*\<mu\>|)>*f<around|(|\<lambda\>|)>*<space|0.17em>d*\<lambda\>,
  </equation>

  and self-reciprocally, where

  <\equation>
    K<around|(|x|)>=<frac|1|2*\<pi\>*i>*<big|int><rsub|c-i*\<infty\>><rsup|c+i*\<infty\>>\<Delta\>*<around*|(|<frac|\<delta\>-1|2>+s|)>*\<Delta\>*<around*|(|<frac|\<delta\>+1|2>-s|)>*x<rsup|-s>*<space|0.17em>d*s
  </equation>

  and instances of the formula (152), in particular for
  <math|f<around|(|\<lambda\>|)>> being the Riesz kernel (118), do occur in
  considerable number. One of the most important papers in this direction,
  one which has not been superseded by other important papers dealing either
  with the summation formulas as such or with the nature of the kernels (154)
  employed therein, is the thesis of Walfisz [15] as supplemented by his
  later paper [16], and a further study of the topics introduced in [15]
  would be indicated.

  Also, if we start from (150) then (152) can be fulfilled by putting

  <\equation>
    f<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<infty\>>E*<around|(|\<lambda\>*\<xi\>|)>*<space|0.17em>d*\<rho\><around|(|\<xi\>|)>,<space|1em>g<around|(|\<mu\>|)>=<big|int><rsub|0><rsup|\<infty\>>\<xi\><rsup|-\<delta\>>*E<around*|(|<frac|\<mu\>|\<xi\>>|)>*<space|0.17em>d*\<rho\><around|(|\<xi\>|)>=<big|int><rsub|0><rsup|\<infty\>>E*<around|(|\<mu\>*\<xi\>|)>*\<xi\><rsup|\<delta\>>*<space|0.17em>d*\<rho\><around*|(|<frac|1|\<xi\>>|)>
  </equation>

  and this suggests the very interesting problem of describing the class of
  functions <math|f<around|(|\<lambda\>|)>> which can be represented by an
  integral (155) with <math|E<around|(|x|)>> corresponding to the Hecke
  factor (140) say. The companion problem of satisfying (152) by putting

  <\equation*>
    f<around|(|\<lambda\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>>E*<around|(|\<lambda\>*<around|(|\<epsilon\>+i*\<eta\>|)>|)>*\<tau\><around|(|\<eta\>|)>*<space|0.17em>d*\<eta\>,<space|1em>g<around|(|\<mu\>|)>=<big|int><rsub|-\<infty\>><rsup|\<infty\>><around|(|\<epsilon\>+i*\<eta\>|)><rsup|-\<delta\>>*E<around*|(|<frac|\<mu\>|\<epsilon\>+i*\<eta\>>|)>*\<tau\><around|(|\<eta\>|)>*<space|0.17em>d*\<eta\>
  </equation*>

  might also be worth studying, but this problem is less likely to lead to
  polished results, in our opinion.

  <section*|Section IV. Modular Exponential Sums>

  <subsection*|11.>

  If we substitute the known identity, see [2], p.<nbsp>57,

  <\equation>
    exp <around|(|-2*x*\<lambda\><rsup|1/2>|)>=<frac|x|\<pi\><rsup|1/2>>*<big|int><rsub|0><rsup|\<infty\>>y<rsup|-3/2>*exp
    <around*|(|-<frac|x<rsup|2>|y>|)>*e<rsup|-\<lambda\>*y>*<space|0.17em>d*y
  </equation>

  into

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>exp <around|(|-2*x*\<lambda\><rsup|1/2>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>
  </equation>

  and interchange integrations, and if our modular relation

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<lambda\>*y>*<space|0.17em>d*R<around|(|\<lambda\>|)>=y<rsup|-\<delta\>>*<big|int><rsub|0><rsup|\<infty\>>exp
    <around*|(|-<frac|\<mu\>|y>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  holds, then (157) assumes the value

  <\equation*>
    <frac|x|\<pi\><rsup|1/2>>*<big|int><rsub|0><rsup|\<infty\>>d*y*exp
    <around*|(|-<frac|x<rsup|2>|y>|)>*y<rsup|-3/2-\<delta\>>*<big|int><rsub|0><rsup|\<infty\>>exp
    <around*|(|-<frac|\<mu\>|y>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation*>

  <\equation*>
    =<frac|x|\<pi\><rsup|1/2>>*<big|int><rsub|0><rsup|\<infty\>>d*y*<big|int><rsub|0><rsup|\<infty\>>y<rsup|-3/2-\<delta\>>*exp
    <around*|(|-<frac|x<rsup|2>+\<mu\>|y>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>;
  </equation*>

  and thus (158) implies the relation

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>exp <around|(|-2*x*\<lambda\><rsup|1/2>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>=<frac|\<Gamma\>*<around|(|\<delta\>+<tfrac|1|2>|)>|\<pi\><rsup|1/2>>*<big|int><rsub|0><rsup|\<infty\>><frac|x*<space|0.17em>d*S<around|(|\<mu\>|)>|<around|(|x<rsup|2>+\<mu\>|)><rsup|\<delta\>+<tfrac|1|2>>>,
  </equation>

  and under assumptions (78), (79) this is rigorously valid for
  <math|<math-up|Re><around|(|x|)>\<gtr\>0> provided

  <\equation>
    \<beta\>\<le\>\<delta\>+<tfrac|1|2>.
  </equation>

  On putting

  <\equation>
    F<around|(|x;\<lambda\>|)>=\<pi\><rsup|-1/2>*x<rsup|-1>*exp
    <around|(|-2*x*\<lambda\><rsup|1/2>|)>
  </equation>

  <\equation>
    G<around|(|x;\<mu\>|)>=\<Gamma\>*<around|(|\<delta\>+<tfrac|1|2>|)>*<around|(|x<rsup|2>+\<mu\>|)><rsup|-\<delta\>-<tfrac|1|2>>
  </equation>

  (159) implies for <math|A\<gtr\>0> and any integer <math|p\<gtr\>0> the
  relation

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|q=0><rsup|p><around|(|-1|)><rsup|q>*F<around|(|<around|(|x<rsup|2>+q*A|)><rsup|1/2>;\<lambda\>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>=<big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|q=0><rsup|p><around|(|-1|)><rsup|q>*G<around|(|x<rsup|2>+q*A;\<mu\>|)>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  but for the latter we may state as follows.

  <vspace*|1fn><no-indent><with|font-series|bold|Lemma 2.> <em|Relation (163)
  holds in <math|0\<less\>x\<less\>\<infty\>> for>

  <\equation>
    \<beta\>\<le\>\<delta\>+<tfrac|1|2>+p
  </equation>

  <em|with both sides converging absolutely.>

  <vspace*|1fn><no-indent><em|Proof.> The absolute convergence follows from
  (78), (79). If we substitute (156) into the left side of (163) we obtain
  for the latter

  <\equation*>
    <big|int><rsub|\<lambda\>=0><rsup|\<infty\>><around*|(|<big|int><rsub|y=0><rsup|\<infty\>>y<rsup|-3/2>*e<rsup|-x<rsup|2>*y<rsup|-1>>*<around|(|1-e<rsup|-A*y<rsup|-1>>|)><rsup|p>*e<rsup|-\<lambda\>*y>*<space|0.17em>d*y|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>,
  </equation*>

  and, on account of the positiveness of the integrand, if we substitute
  (158), this becomes

  <\equation*>
    <big|int><rsub|y=0><rsup|\<infty\>>d*y<around*|(|<big|int><rsub|\<mu\>=0><rsup|\<infty\>>y<rsup|-\<delta\>-3/2>*exp
    <around*|(|-<frac|x<rsup|2>+\<mu\>|y>|)>*<around|(|1-e<rsup|-A*y<rsup|-1>>|)><rsup|p>*<space|0.17em>d*S<around|(|\<mu\>|)>|)>,
  </equation*>

  and, for (164), we may again interchange integrations which produce the
  right side in (163), q.e.d.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 11.> <em|For
  <math|\<mu\><rsup|0>\<gtr\>0>, if in an interval
  <math|<around|\||\<mu\>-\<mu\><rsup|0>|\|>\<less\>\<delta\>> the function
  <math|S<around|(|\<mu\>|)>> is a constant, (or more generally is there
  analytic), then for>

  <\equation>
    t=\<pm\><around|(|\<mu\><rsup|0>|)><rsup|1/2>
  </equation>

  <em|the integral>

  <\equation>
    <big|int><rsub|1><rsup|\<infty\>>\<lambda\><rsup|l>*e<rsup|-2*i*\<lambda\><rsup|1/2>*t>*<space|0.17em>d*R<around|(|\<lambda\>|)>
  </equation>

  <em|exists for every <math|l\<le\>0> as the Abel limit>

  <\equation>
    lim<rsub|\<epsilon\>\<to\>0> <big|int><rsub|1><rsup|\<infty\>>e<rsup|-\<epsilon\>*\<lambda\><rsup|1/2>>*\<lambda\><rsup|l>*e<rsup|-2*i*\<lambda\><rsup|1/2>*t>*<space|0.17em>d*R<around|(|\<lambda\>|)>,
  </equation>

  <em|and for a neighborhood>

  <\equation>
    <around|\||t<rsup|2>-\<mu\><rsup|0>|\|>\<less\>\<delta\>-\<eta\>
  </equation>

  <em|it exists uniformly in <math|t>.>

  <em|Also, for the same values of <math|t>, and again uniformly, the Abel
  limit>

  <\equation>
    lim<rsub|\<epsilon\>\<to\>0> <big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<epsilon\>*\<lambda\><rsup|1/2>><around*|(|<frac|t<rsup|2>|\<lambda\>>|)><rsup|<frac|1|2>*<around|(|\<delta\>+\<gamma\>|)>>*J<rsub|\<delta\>+\<gamma\>>*<around|(|2*t*\<lambda\><rsup|1/2>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>
  </equation>

  <em|exists for <math|\<gamma\>\<ge\>0>, and its value is>

  <\equation>
    <frac|1|\<Gamma\>*<around|(|\<gamma\>+1|)>>*<big|int><rsub|0><rsup|t<rsup|2>><around|(|t<rsup|2>-\<mu\>|)><rsup|\<gamma\>>*<space|0.17em>d*S<around|(|\<mu\>|)>
  </equation>

  <em|except for>

  <\equation>
    \<gamma\>=-1,-2,-3,\<ldots\>,
  </equation>

  <em|for which the limit has value 0.>

  <em|Thus, in particular, in the case of a modular relation>

  <\equation>
    <big|sum><rsub|0><rsup|\<infty\>>a<rsub|m>*e<rsup|-\<lambda\><rsub|m>*x>=x<rsup|-\<delta\>>*<big|sum><rsub|n=0><rsup|\<infty\>>b<rsub|n>*e<rsup|-\<mu\><rsub|n>*x<rsup|-1>>
  </equation>

  <em|with (2), (3), (44), (46), the series>

  <\equation>
    <big|sum><rsub|1><rsup|\<infty\>>a<rsub|m>*\<lambda\><rsub|m><rsup|l>*e<rsup|-2*i*\<lambda\><rsub|m><rsup|1/2>*t>,<space|1em>l\<le\>0
  </equation>

  <\equation>
    <big|sum><rsub|0><rsup|\<infty\>>a<rsub|m><around*|(|<frac|t<rsup|2>|\<lambda\><rsub|m>>|)><rsup|<frac|1|2>*<around|(|\<delta\>+\<gamma\>|)>>*J<rsub|\<delta\>+\<gamma\>>*<around|(|2*t*\<lambda\><rsub|m><rsup|1/2>|)>,<space|1em>\<gamma\>\<ge\>0
  </equation>

  <em|are Abel summable for <math|t<rsup|2>\<gtr\>0>, if
  <math|t<rsup|2>\<ne\>\<mu\><rsub|1>,\<mu\><rsub|2>,\<mu\><rsub|3>,\<ldots\>>,
  the second series having the value previously stated.>

  <vspace*|1fn><no-indent><em|Proof.> For <math|p=0>, if we put
  <math|x=\<epsilon\>+i*t> into the right side of (159), then uniformly in
  (168) a limit exists for <math|\<epsilon\>\<to\>0>, and this established
  the corresponding limit of (166) for <math|l=0>. For <math|p\<gtr\>0>, if
  we choose <math|A=\<mu\><rsup|0>+\<delta\>> then for <math|q\<gtr\>0> we
  have

  <\equation>
    <math-up|Re><around|{|x<rsup|2>+q*A|}>\<ge\><math-up|Re><around|{|x<rsup|2>+A|}>=\<epsilon\><rsup|2>-t<rsup|2>+A,
  </equation>

  and it follows that the right side of (163) has a limit as before so that
  the left side of (163) also has one. We now split the left side into the
  principal term

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>>F<around|(|x;\<lambda\>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>
  </equation>

  and the secondary term

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>><big|sum><rsub|q=1><rsup|p><around|(|-1|)><rsup|q>*F<around|(|x<rsup|2>+q*A;\<lambda\>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>
  </equation>

  and we notice that (177) is absolutely convergent uniformly for small
  <math|\<epsilon\>> and <math|t> in (168). Therefore (176) itself must have
  a limit, as <math|\<epsilon\>\<to\>0>, uniformly in (168) which proves our
  assertion about (166) for <math|l=0>.

  Our next step will be to discuss it for <math|l=k/2,k=1,2,3,\<ldots\>>, by
  induction on <math|k>. If we differentiate both sides in (163), term by
  term, <math|k> times with respect to <math|x>, then the right side retains
  the previously stated limit behavior, and so does the secondary part (177).
  But the principal part (176) constitutes a term

  <\equation>
    <around|(|-2*i|)><rsup|k>*<big|int><rsub|0><rsup|\<infty\>>\<lambda\><rsup|k/2>*F<around|(|x;\<lambda\>|)>*<space|0.17em>d*R<around|(|\<lambda\>|)>
  </equation>

  and similar terms involving <math|\<lambda\><rsup|h/2>*F<around|(|x;\<lambda\>|)>>
  for <math|h\<le\>k-1>, which justifies the induction.

  Finally, for a general real <math|l>, whether positive or negative, we put
  <math|l=k/2-\<alpha\>/2> for some integer <math|k> and
  <math|\<alpha\>\<gtr\>0>, and on setting

  <\equation*>
    \<lambda\>=\<xi\><rsup|2>,<space|1em>d<rsub|\<xi\>>*A*<around|(|t,\<xi\>|)>=e<rsup|-2*i*t*\<xi\>>*<space|0.17em>d*R<around|(|\<xi\><rsup|2>|)>
  </equation*>

  we easily obtain the desired conclusion from the following lemma.

  <vspace*|1fn><no-indent><with|font-series|bold|Lemma 3.> <em|If>

  <\equation>
    <big|int><rsub|1><rsup|\<infty\>>e<rsup|-x*\<xi\>>*<around|\||d<rsub|\<xi\>>*A*<around|(|t,\<xi\>|)>|\|>\<le\>M<around|(|\<epsilon\>|)>*e<rsup|-\<epsilon\>>,<space|1em>x\<ge\>\<epsilon\>,
  </equation>

  <em|uniformly in <math|t>, and if the function>

  <\equation>
    L*<around|(|t,x|)>=<big|int><rsub|1><rsup|\<infty\>>e<rsup|-x*\<xi\>>*<space|0.17em>d<rsub|\<xi\>>*A*<around|(|t,\<xi\>|)>
  </equation>

  <em|has a limit <math|L<around|(|t|)>> as <math|x*\<downarrow\>*0>
  uniformly in <math|t>, then for <math|\<rho\>\<gtr\>0> the function>

  <\equation>
    L<rsub|\<rho\>>*<around|(|t,x|)>=<big|int><rsub|1><rsup|\<infty\>>\<xi\><rsup|-\<rho\>>*e<rsup|-x*\<xi\>>*<space|0.17em>d<rsub|\<xi\>>*A*<around|(|t,\<xi\>|)>
  </equation>

  <em|has a limit of the same type.>

  <vspace*|1fn><no-indent><em|Proof of Lemma 3.> For fixed <math|t> and
  <math|x> we may substitute in (181)

  <\equation*>
    \<xi\><rsup|-\<rho\>>=<frac|1|\<Gamma\><around|(|\<rho\>|)>>*<big|int><rsub|0><rsup|\<infty\>>e<rsup|-\<xi\>*\<eta\>>*\<eta\><rsup|\<rho\>-1>*<space|0.17em>d*\<eta\>
  </equation*>

  and we obtain

  <\equation*>
    L<rsub|\<rho\>>*<around|(|t,x|)>=<frac|1|\<Gamma\><around|(|\<rho\>|)>>*<big|int><rsub|0><rsup|\<infty\>>y<rsup|\<rho\>-1>*L*<around|(|t,x+y|)>*<space|0.17em>d*y.
  </equation*>

  If we split the last integral into <math|<big|int><rsub|0><rsup|1>y<rsup|\<rho\>-1>*L*<around|(|t,x+y|)>*<space|0.17em>d*y+<big|int><rsub|1><rsup|\<infty\>>>
  then the first part converges, uniformly in <math|t>, as
  <math|x*\<downarrow\>*0>, in consequence of <math|L*<around|(|t,x|)>> so
  converging, whereas the second part so converges in consequence of
  inequality (179); which finally proves our assertion regarding (166).

  In turning to (169) we note that of the two assumptions (78), (79) until
  now only the second has been exploited fully, but that at present the first
  will come into its own. For

  <\equation*>
    x=2*t*\<lambda\><rsup|1/2>\<geqq\>1
  </equation*>

  and a fixed <math|\<gamma\>\<geqq\>0> we introduce in (169) the asymptotic
  expansion

  <\equation>
    J<rsub|\<delta\>+\<gamma\>><around|(|x|)>=<big|sum><rsub|\<nu\>=0><rsup|M><frac|a<rsub|\<nu\>>*e<rsup|i*x>+b<rsub|\<nu\>>*e<rsup|-i*x>|x<rsup|\<nu\>+1/2>>+O<around*|(|<frac|1|x<rsup|M+3/2>>|)>,
  </equation>

  and on the basis of (78) the contribution due to the error term is
  absolutely convergent for <math|M> sufficiently large. However the other
  terms of (182) lead to expressions of the form (167), and the uniform
  existence of (169) follows. As regards the value given for (169) we recall
  that for <math|\<gamma\>> sufficiently large we have obtained it in Theorem
  10, and for other values of <math|\<gamma\>> it may be obtained by
  differentiation with respect to <math|t>, which completes the proof of
  Theorem 11.

  <subsection*|12.>

  We are now going to quote an important theorem from Walfisz [16], his
  theorems <math|A> and <math|A<rsub|1>>, in a trivial extension from
  Dirichlet series to Laplace\UStieltjes integrals.

  <vspace*|1fn><no-indent><with|font-series|bold|Lemma 4.> <em|If the
  integral>

  <\equation>
    f<around|(|\<epsilon\>|)>=<big|int><rsub|1><rsup|\<infty\>>e<rsup|-\<epsilon\>*\<xi\>>*<space|0.17em>d*A<around|(|\<xi\>|)>
  </equation>

  <em|is absolutely convergent for <math|\<epsilon\>\<gtr\>0>; if>

  <\equation>
    lim<rsub|\<epsilon\>\<to\>0> f<around|(|\<epsilon\>|)><text|exists>
  </equation>

  <em|and if for <math|\<tau\>\<gtr\>0>>

  <\equation>
    <big|int><rsub|1><rsup|\<infty\>>\<xi\><rsup|-\<tau\>>*<space|0.17em><around|\||d*A<around|(|\<xi\>|)>|\|>\<less\>\<infty\>
  </equation>

  <em|then the Riesz mean>

  <\equation>
    A<rsub|\<tau\>><around|(|x|)>=<frac|x<rsup|-\<tau\>>|\<Gamma\>*<around|(|\<tau\>+1|)>>*<big|int><rsub|0><rsup|x><around|(|x-\<xi\>|)><rsup|\<tau\>>*<space|0.17em>d*A<around|(|\<xi\>|)>
  </equation>

  <em|has a limit for <math|x\<to\>\<infty\>>.>

  <em|If the function <math|A<around|(|\<xi\>|)>=A*<around|(|\<xi\>,t|)>>
  depends on a parameter <math|t>; if (184) holds uniformly in <math|t>, and
  if the variation of <math|A*<around|(|\<xi\>,t|)>> with regards to
  <math|\<xi\>> is majorized by a function <math|B<around|(|\<xi\>|)>> for
  which>

  <\equation>
    <big|int><rsub|1><rsup|\<infty\>>\<xi\><rsup|-\<tau\>>*<space|0.17em>d*B<around|(|\<xi\>|)>\<less\>\<infty\>
  </equation>

  <em|holds, then the limit of (186) exists uniformly in <math|t>.>

  Now, if we put

  <\equation>
    A*<around|(|\<xi\>,t|)>=<big|int><rsub|\<lambda\>=1><rsup|\<xi\><rsup|2>>\<lambda\><rsup|l>*e<rsup|-2*i*t*\<lambda\><rsup|1/2>>*<space|0.17em>d*R<around|(|\<lambda\>|)>
  </equation>

  then we may put

  <\equation*>
    B<around|(|\<xi\>|)>=<big|int><rsub|\<lambda\>=1><rsup|\<xi\><rsup|2>>\<lambda\><rsup|l>*<space|0.17em><around|\||d*R<around|(|\<lambda\>|)>|\|>,
  </equation*>

  and (78) implies (187) with

  <\equation>
    \<tau\>=2*\<alpha\>+2*l
  </equation>

  and if we apply Hardy's equivalence of <math|<around|(|R;\<lambda\><rsup|1/2>|)>>
  with <math|<around|(|R;\<lambda\>|)>> we obtain the following theorem.

  <no-indent><with|font-series|bold|Theorem 12> <em|If (78) holds, then for
  <math|l\<gtr\>-\<alpha\>> the integral (166) is summable
  <math|<around|(|R;\<lambda\>;2*l+2*\<alpha\>|)>>, that is the limit>

  <\equation>
    lim<rsub|x\<to\>\<infty\>><around|{|\<Gamma\>*<around|(|2*l+2*\<alpha\>+1|)>|}><rsup|-1>*<big|int><rsub|1><rsup|x><around*|(|1-<frac|\<lambda\>|x>|)><rsup|2*l+2*\<alpha\>>*\<lambda\><rsup|l>*e<rsup|-2*i*t*\<lambda\><rsup|1/2>>*<space|0.17em>d*R<around|(|\<lambda\>|)>
  </equation>

  <em|exists, and equals (167) uniformly in (168).>

  We note that for <math|l\<less\>-\<alpha\>> assumption (78) makes the
  integral (166) absolutely convergent so that Theorem 12 covers all other
  possibilities <math|l\<gtr\>-\<alpha\>>, by securing for them a Riesz
  summability at least. But no intermediary interval of ordinary
  (non-absolute) convergence is provided for, and perhaps in general none is
  available, however for modular relations of the classical structure or
  nearly so the following theorem of Ananda\URau [1] opens up a possibility.

  <vspace*|1fn><no-indent><with|font-series|bold|Lemma 5.> <em|If
  <math|R<rsub|0><around|(|\<lambda\>|)>> in
  <math|1\<leqq\>\<lambda\>\<less\>\<infty\>> is continuous from the right;
  if for <math|\<sigma\>\<gtr\>0> we have>

  <\equation>
    <big|int><rsub|\<lambda\>><rsup|\<lambda\>+\<xi\>><around|\||d*R<rsub|0><around|(|\<lambda\>|)>|\|>\<leqq\>K*\<xi\><rsup|\<sigma\>-1>*\<lambda\>
  </equation>

  <em|in>

  <\equation>
    \<lambda\>\<leqq\>\<xi\>\<leqq\>H*\<lambda\>
  </equation>

  <em|and if for some <math|l\<leqq\>0> and some <math|c\<geqq\>0> the
  integral>

  <\equation>
    <big|int><rsub|1><rsup|\<infty\>>\<lambda\><rsup|l+c>*<space|0.17em>d*R<rsub|0><around|(|\<lambda\>|)>
  </equation>

  <em|is summable <math|<around|(|R;\<lambda\>;b|)>> for some
  <math|b\<gtr\>0>; then for <math|0\<leqq\>\<eta\>\<less\>b> the integral>

  <\equation>
    <big|int><rsub|1><rsup|\<infty\>>\<lambda\><rsup|l>*<space|0.17em>d*R<rsub|0><around|(|\<lambda\>|)>
  </equation>

  <em|is summable <math|<around|(|R;\<lambda\>;\<eta\>|)>> for>

  <\equation>
    \<eta\>\<gtr\><frac|<around|(|\<sigma\>+l|)>*b-c|\<sigma\>+l+c>.
  </equation>

  In our case it implies the following theorem.

  <vspace*|1fn><no-indent><with|font-series|bold|Theorem 13.> <em|If for some
  <math|\<sigma\>\<gtr\>0> we have>

  <\equation>
    <big|int><rsub|\<lambda\>><rsup|\<lambda\>+\<xi\>><around|\||d*R<around|(|\<lambda\>|)>|\|>\<leqq\>K*\<xi\><rsup|\<sigma\>-1>*\<lambda\>,<space|1em>1\<leqq\>\<lambda\>\<less\>\<infty\>
  </equation>

  <em|for (192), then the integral (166) is
  <math|<around|(|R;\<lambda\>,\<eta\>|)>> if simultaneously
  <math|\<eta\>\<geqq\>0> and <math|\<eta\>\<gtr\>2*l+2*\<sigma\>-1>.>

  <em|In particular, the integral>

  <\equation>
    <big|int><rsub|1><rsup|\<infty\>><frac|e<rsup|-2*i*t*\<lambda\><rsup|1/2>>|\<lambda\><rsup|\<sigma\>-1/2+\<epsilon\>>>*<space|0.17em>d*R<around|(|\<lambda\>|)>
  </equation>

  <em|is convergent for <math|\<epsilon\>\<gtr\>0>.>

  <vspace*|1fn><no-indent><em|Proof.> For <math|l+c> instead of <math|l>, our
  integral is summable <math|<around|(|R;\<lambda\>;2*\<sigma\>+2*l+2*c|)>>
  by Theorem 12. Now, if we put <math|b=2*\<sigma\>+2*l+2*c> in (195) we
  obtain

  <\equation>
    \<eta\>\<gtr\><frac|<around|(|\<sigma\>+l|)>*<around|(|2*\<sigma\>+2*l+2*c|)>-c|\<sigma\>+l+c>
  </equation>

  and on the basis of Lemma 5 we may claim that for fixed <math|l> our
  integral is summable <math|<around|(|R;\<lambda\>;\<eta\>|)>> with
  <math|\<eta\>\<geqq\>0>, provided there exists some positive <math|c> for
  which (198) holds. Now, on letting <math|c\<to\>\<infty\>>, the right side
  in (198) converges to <math|2*\<sigma\>+2*l-1>, and thus
  <math|\<eta\>\<gtr\>2*\<sigma\>+2*l-1> is a sufficient condition, which
  proves our theorem.

  <vspace*|1fn><no-indent><em|Remarks.> Assumption (196) implies

  <\equation*>
    <big|int><rsub|1><rsup|\<infty\>>\<lambda\><rsup|-\<sigma\>-\<epsilon\>>*<space|0.17em><around|\||d*R<around|(|\<lambda\>|)>|\|>\<less\>\<infty\>
  </equation*>

  for <math|\<epsilon\>\<gtr\>0>, and this, with (78) known, it would have
  been reasonable to assume <math|\<sigma\>\<ge\>\<alpha\>> and not only
  <math|\<sigma\>\<gtr\>0>; for a similar reason the second half of the
  theorem is of interest only for <math|\<sigma\>\<le\>\<alpha\>+<tfrac|1|2>>.

  In the lattice point relation (130) our assumptions are fulfilled for
  <math|\<alpha\>=k/2+\<epsilon\>>, <math|\<sigma\>=\<alpha\>>, so that
  Theorem 13 gives the result that the series

  <\equation*>
    <big|sum><rsub|1><rsup|\<infty\>><frac|r<rsub|k><around|(|n|)>|n<rsup|<around|(|k-1|)>/2+\<epsilon\>>>*e<rsup|-i*t*<around|(|\<pi\>*n|)><rsup|1/2>>
  </equation*>

  converges for <math|t\<ne\><around|(|\<pi\>*m|)><rsup|1/2>>, for
  <math|\<epsilon\>\<gtr\>0>, and this tallies with a best result known for
  this case, see [7] and [6].

  <section*|Addendum>

  <no-indent><with|font-series|bold|Remark on Hecke's Functional Equation for
  Zeta Functions in Algebraic Fields><next-line>(Received June 8, 1950)

  We note that the non-arithmetical part of Hecke's reasoning in his paper:
  <em|Eine neue Art von Zetafunktionen und ihre Beziehungen zur Verteilung
  der Primzahlen, Zweite Mitteilung>, Mathematische Zeitschrift 6 (1920),
  11\U51, can be formalized and technically generalized in the following
  manner [compare also: Ch.<nbsp>H.<nbsp>Müntz, Hamburgische Abh.<nbsp>3
  (1924), 1\U11, and L.<nbsp>J.<nbsp>Mordell, Proc.<nbsp>London
  Math.<nbsp>Soc.<nbsp>(2) 3 (1931), 501\U506].

  Consider in <math|k>-space a real affine transformation

  <\equation*>
    Z<rsub|\<mu\>>=a<rsub|\<mu\>*1>*z<rsub|1>+a<rsub|\<mu\>*2>*z<rsub|2>+\<ldots\>+a<rsub|\<mu\>*k>*z<rsub|k>,<space|1em>\<mu\>=1,\<ldots\>,k,
  </equation*>

  with determinant 1,

  <\equation*>
    <around|\||a<rsub|\<mu\>*\<nu\>>|\|><rsub|\<mu\>,\<nu\>=1,\<ldots\>,k>=1,
  </equation*>

  and for a fixed decomposition

  <\equation*>
    k=p<rsub|1>+p<rsub|2>+\<ldots\>+p<rsub|r+1>,<space|1em>1\<le\>r+1\<le\>k,
  </equation*>

  into any integers <math|p<rsub|j>>, (not necessarily <math|=1> or 2 only),

  <\equation*>
    1\<le\>p<rsub|j>\<le\>k,<space|1em>j=1,\<ldots\>,r+1,
  </equation*>

  we introduce the <math|r+1> semi-definite forms

  <\equation*>
    A<rsub|1><around|(|z|)>=Z<rsub|1><rsup|2>+\<ldots\>+Z<rsub|p<rsub|1>><rsup|2>,<space|1em>A<rsub|2><around|(|z|)>=Z<rsub|p<rsub|1>+1><rsup|2>+\<ldots\>+Z<rsub|p<rsub|2>><rsup|2>,\<ldots\>,A<rsub|r+1><around|(|z|)>=Z<rsub|p<rsub|r>+1><rsup|2>+\<ldots\>+Z<rsub|p<rsub|r+1>><rsup|2>.
  </equation*>

  If we also introduce the inverse transformation

  <\equation*>
    z<rsub|\<nu\>>=b<rsub|\<nu\>*1>*Z<rsub|1>+\<ldots\>+b<rsub|\<nu\>*k>*Z<rsub|k>,
  </equation*>

  <\equation*>
    <big|sum><rsub|j>b<rsub|\<nu\>*j>*a<rsub|j*\<mu\>>=\<delta\><rsub|\<nu\>*\<mu\>>,
  </equation*>

  and the corresponding semi-definite forms

  <\equation*>
    B<rsub|1><around|(|Z|)>=z<rsub|1><rsup|2>+\<ldots\>+z<rsub|p<rsub|1>><rsup|2>,<space|1em>B<rsub|2><around|(|Z|)>=z<rsub|p<rsub|1>+1><rsup|2>+\<ldots\>+z<rsub|p<rsub|2>><rsup|2>,\<ldots\>,
  </equation*>

  then the classical theta formula implies the relation

  <\equation*>
    <big|sum><rsub|m>exp <around*|(|-\<pi\>*<big|sum><rsub|j=1><rsup|r+1>A<rsub|j><around|(|m|)>*t<rsub|j>|)>=<big|prod><rsub|j=1><rsup|r+1>t<rsub|j><rsup|-p<rsub|j>/2>*<big|sum><rsub|n>exp
    <around*|(|-\<pi\>*<big|sum><rsub|j=1><rsup|r+1>B<rsub|j><around|(|n|)>*t<rsub|j><rsup|-1>|)>
  </equation*>

  for variables <math|t<rsub|1>\<gtr\>0,\<ldots\>,t<rsub|r+1>\<gtr\>0>, the
  summation extending over all lattice points
  <math|m=<around|(|m<rsub|1>,\<ldots\>,m<rsub|k>|)>> and <math|n>
  respectively. This relation leads only to what corresponds to Zeta
  functions for the trivial character <math|\<chi\>=1>, and in order to
  include more general characters it is necessary to envisage more general
  relations, such as exist, of the form

  <\equation*>
    <big|sum><rsub|m>\<varphi\><rsub|m>*exp
    <around*|(|-\<pi\>*<big|sum><rsub|j>A<rsub|j><around|(|m|)>*t<rsub|j>|)>=<big|prod><rsub|j>t<rsub|j><rsup|p<rsub|j>*s-q<rsub|j>>*<big|sum><rsub|n>\<psi\><rsub|n>*exp
    <around*|(|-\<pi\>*<big|sum><rsub|j>B<rsub|j><around|(|n|)>*t<rsub|j><rsup|-1>|)>
  </equation*>

  with suitable constant coefficients <math|<around|{|\<varphi\><rsub|m>|}>>,
  <math|<around|{|\<psi\><rsub|n>|}>> and additional exponents
  <math|q<rsub|j>> for which <math|<math-up|Re>q<rsub|j>\<ge\>0>. For brevity
  we denote the left side by <math|\<theta\><around|(|t;A;\<varphi\>|)>> and
  the relation then reads

  <\equation>
    \<theta\><around|(|t;A;\<varphi\>|)>=<big|prod><rsub|j>t<rsub|j><rsup|-<frac|1|2>*p<rsub|j>-q<rsub|j>>*\<theta\><around*|(|<frac|1|t>;B;\<psi\>|)>.
  </equation>

  We assume that for <math|m\<ne\><around|(|0,0,\<ldots\>,0|)>> all
  <math|A<rsub|j><around|(|m|)>\<gtr\>0>, and that the same holds for
  <math|B<rsub|j><around|(|n|)>>, and we introduce the series

  <\equation>
    \<zeta\>*<around|(|s;A;\<varphi\>|)>=<big|sum><rsub|m><rprime|''>\<varphi\><rsub|m>*<big|prod><rsub|j=1><rsup|r+1><around|(|\<pi\>*A<rsub|j><around|(|m|)>|)><rsup|-<frac|1|2>*<around|(|p<rsub|j>*s+q<rsub|j>|)>>
  </equation>

  <\equation>
    \<theta\><rprime|''><around|(|t;A;\<varphi\>|)>=<big|sum><rsub|m><rprime|''>\<varphi\><rsub|m>*exp
    <around*|(|-\<pi\>*<big|sum><rsub|j>A<rsub|j><around|(|m|)>*t<rsub|j>|)>
  </equation>

  in which the summation extends only over a certain fixed subset of all
  lattice points (not including the origin) whose precise nature will be
  described later. From

  <\equation*>
    \<Gamma\>*<around*|(|<frac|p|2>*x+<frac|q|2>|)>=<big|int><rsub|0><rsup|\<infty\>>e<rsup|-t>*t<rsup|<frac|1|2>*<around|(|p*x+q|)>-1>*<space|0.17em>d*t
  </equation*>

  we then obtain

  <\equation>
    \<Delta\><around|(|s|)>*\<zeta\>*<around|(|s;A;\<varphi\>|)>=<big|int><rsub|0><rsup|\<infty\>>\<ldots\>*<big|int><rsub|0><rsup|\<infty\>>\<theta\><rprime|''><around|(|t;A;\<varphi\>|)>*<big|prod><rsub|j>t<rsub|j><rsup|<frac|1|2>*<around|(|p<rsub|j>*s+q<rsub|j>|)>-1>*<space|0.17em>d*t<rsub|j>
  </equation>

  <\equation>
    \<Delta\><around|(|s|)>*\<zeta\>*<around|(|s;B;\<psi\>|)>=<big|int><rsub|0><rsup|\<infty\>>\<ldots\>*<big|int><rsub|0><rsup|\<infty\>>\<theta\><rprime|''><around|(|t;B;\<psi\>|)>*<big|prod><rsub|j>t<rsub|j><rsup|<frac|1|2>*<around|(|p<rsub|j>*s+q<rsub|j>|)>-1>*<space|0.17em>d*t<rsub|j>
  </equation>

  where

  <\equation*>
    \<Delta\><around|(|s|)>=<big|prod><rsub|j=1><rsup|r+1>\<Gamma\>*<around*|(|<frac|p<rsub|j>|2>*s+<frac|q<rsub|j>|2>|)>,
  </equation*>

  whatever the subset of the lattice points may be.

  We now substitute for the variables <math|t<rsub|1>,\<ldots\>,t<rsub|r+1>>
  new variables <math|v;y<rsub|1>,\<ldots\>,y<rsub|r>> by means of the
  transformation

  <\equation*>
    t<rsub|j>=exp <around*|(|v+<big|sum><rsub|\<rho\>=1><rsup|r>\<alpha\><rsub|j*\<rho\>>*y<rsub|\<rho\>>|)>,<space|1em>j=1,\<ldots\>,r+1,
  </equation*>

  with suitable constants <math|<around|{|\<alpha\><rsub|j*\<rho\>>|}>> which
  will be subjected, axiomatically, to rather heavy assumptions expressive of
  the behavior of units in algebraic fields. We first of all assume that we
  have

  <\equation>
    <big|sum><rsub|j=1><rsup|r+1>p<rsub|j>*\<alpha\><rsub|j*\<rho\>>=0,<space|1em>\<rho\>=1,\<ldots\>,r.
  </equation>

  and that the determinant

  <\equation*>
    R=\|1,\<alpha\><rsub|j*1>,\<alpha\><rsub|j*2>,\<ldots\>,\<alpha\><rsub|j*r>\|<space|1em>j=1,\<ldots\>,r+1
  </equation*>

  is <math|\<ne\>0>, and in consequence of (204), if we put

  <\equation*>
    q=<big|sum><rsub|j=1><rsup|r+1>q<rsub|j>,<space|1em>\<alpha\><rsub|\<rho\>>=<big|sum><rsub|j=1><rsup|r+1>q<rsub|j>*\<alpha\><rsub|j*\<rho\>>,
  </equation*>

  we obtain

  <\equation*>
    <big|sum><rsub|j=1><rsup|r+1>A<rsub|j>*t<rsub|j>=e<rsup|v>*<big|sum><rsub|j=1><rsup|r+1>A<rsub|j>*e<rsup|<big|sum><rsub|\<rho\>>\<alpha\><rsub|j*\<rho\>>*y<rsub|\<rho\>>>
  </equation*>

  and

  <\equation*>
    <big|prod><rsub|j=1><rsup|r+1>t<rsub|j><rsup|<frac|1|2>*<around|(|p<rsub|j>*s+q<rsub|j>|)>-1>*d*t<rsub|j>=e<rsup|v/2*<around|(|k*s+q|)>>*d*v*<big|prod><rsub|\<rho\>=1><rsup|r>e<rsup|<frac|1|2>*\<alpha\><rsub|\<rho\>>*y<rsub|\<rho\>>>*d*y<rsub|\<rho\>>.
  </equation*>

  We now put

  <\equation*>
    y<rsub|\<rho\>>=g<rsub|\<rho\>>+\<eta\><rsub|\<rho\>>,<space|1em>\<rho\>=1,\<ldots\>,r
  </equation*>

  where

  <\equation>
    -<tfrac|1|2>\<leqq\>\<eta\><rsub|\<rho\>>\<less\><tfrac|1|2>,<space|1em>\<rho\>=1,\<ldots\>,r
  </equation>

  and

  <\equation*>
    g<rsub|\<rho\>>=0,\<pm\>1,\<pm\>2,\<pm\>3,\<ldots\>,
  </equation*>

  and if we introduce the expression

  <\equation*>
    \<theta\><rprime|'><around|(|t;A;\<varphi\>|)>=<big|sum><rsub|g>\<theta\><rprime|''><around|(|t;A<rsub|j>*e<rsup|<big|sum>\<alpha\><rsub|j*\<rho\>>*g<rsub|\<rho\>>>;\<varphi\>*e<rsup|<frac|1|2>*<big|sum>\<alpha\><rsub|\<rho\>>*g<rsub|\<rho\>>>|)>
  </equation*>

  with summation over all lattice point <math|<around|(|g<rsub|1>,\<ldots\>,g<rsub|r>|)>>
  then the right side of (202) is

  <\equation>
    R*<big|int><rsub|-\<infty\>><rsup|\<infty\>>d*v*e<rsup|v/2*<around|(|k*s+q|)>>*<big|int><rsub|I>\<theta\><rprime|'><around|(|e<rsup|v+<big|sum>\<alpha\><rsub|j*\<rho\>>*\<eta\><rsub|\<rho\>>>;A;\<varphi\>|)>*e<rsup|<frac|1|2>*<big|sum>\<alpha\><rsub|\<rho\>>*\<eta\><rsub|\<rho\>>>*<space|0.17em>d*\<eta\>
  </equation>

  where <math|d*\<eta\>=d*\<eta\><rsub|1>*\<ldots\>*d*\<eta\><rsub|r>> and
  <math|I> is the cube (205).

  The decisive assumption now is that for a certain constant <math|w> we have

  <\equation>
    w*\<theta\><rprime|'><around|(|t;A;\<varphi\>|)>=\<theta\><around|(|t;A;\<varphi\>|)>-\<varphi\><rsub|0>
  </equation>

  <\equation>
    w*\<theta\><rprime|'><around|(|t;B;\<psi\>|)>=\<theta\><around|(|t;B;\<psi\>|)>-\<psi\><rsub|0>
  </equation>

  and Hecke satisfies it by the following arithmetical data. The constant
  <math|w> is an integer, (it is the number of roots of unity in the field),
  and, except for a multiplicity <math|w>, the multitude of all vectors
  <math|<around|{|A<rsub|j><around|(|m|)>|}>>, <math|j=1,\<ldots\>,r+1>, in
  conjunction with the coefficients <math|<around|{|\<varphi\><around|(|m|)>|}>>,
  as taken over all lattice points <math|<around|{|m|}>> not identically
  zero, is the same as the multitude of quantities

  <\equation*>
    <around|{|A<rsub|j><around|(|m<rprime|''>|)>*e<rsup|<big|sum>\<alpha\><rsub|j*\<rho\>>*g<rsub|\<rho\>>>|}>,<space|1em><around|{|\<varphi\><around|(|m<rprime|''>|)>*e<rsup|<frac|1|2>*<big|sum>\<alpha\><rsub|\<rho\>>*g<rsub|\<rho\>>>|}>
  </equation*>

  as taken, independently, over all integers
  <math|<around|{|g<rsub|\<rho\>>|}>> and the elements
  <math|<around|{|m<rprime|''>|}>> of a certain subset of the set of all
  lattice points <math|<around|{|m|}>>, and similarly for <math|B,\<psi\>>,
  the subset being precisely the one over which the summation in (200), (201)
  was meant to be taken.

  Once relations (207), (208) are secured we obtain the functional equation

  <\equation*>
    \<Delta\><around|(|s|)>*\<zeta\>*<around|(|s;A;\<varphi\>|)>=\<Delta\>*<around|(|1-s|)>*\<zeta\>*<around|(|1-s;B;\<psi\>|)>
  </equation*>

  by the familiar reasoning of decomposing in (206) the integration with
  respect to <math|v> into <math|<around|(|-\<infty\>,0|)>> and
  <math|<around|(|0,\<infty\>|)>>; substituting from (207); replacing in one
  of the half-line <math|\<theta\><around|(|t;A;\<varphi\>|)>> by
  <math|\<theta\><around|(|t<rsup|-1>;B;\<psi\>|)>> from (199); and then
  again substituting from (208). See Hecke loc.<nbsp>cit., and also
  E.<nbsp>Landau, <em|Ueber Ideale und Primideale in Idealklassen>,
  Mathematische Zeitschrift 2 (1918), 52\U154.

  <vspace*|1fn><no-indent>PRINCETON UNIVERSITY

  <vspace*|2em><no-indent><with|font-series|bold|REFERENCES>

  <\enumerate>
    <item>K.<nbsp>Ananda-Rau, On the convergence and summability of Dirichlet
    series. Proc.<nbsp>London Math.<nbsp>Soc.<nbsp>(2) 34 (1932), 414\U40.

    <item>Bochner, S., Vorlesungen ueber Fouriersche Integrale. 1937, 1948.

    <item>Bochner, S., Spherical summability of multiple Fourier series.
    Trans.<nbsp>Amer.<nbsp>Math.<nbsp>Soc.<nbsp>40 (1936), 175\U207; also Die
    Poissonsche Summationsformel in mehreren Veraenderlichen.
    Math.<nbsp>Annalen 106 (1932), 56\U63.

    <item>Bochner, S., and Chandrasekharan, K., On the localization property
    for multiple Fourier series. Ann.<nbsp>of Math., 49 (1948), 966\U978.

    <item>Bochner, S., and Chandrasekharan, K., Fourier transforms. 1949.

    <item>Bochner, S. and Chandrasekharan, K., Summation over lattice points
    in <math|k>-space. Quart.<nbsp>J.<nbsp>Math.<nbsp>Oxford Ser.<nbsp>19
    (1948), 238\U248.

    <item>A.<nbsp>L.<nbsp>Dixon and W.<nbsp>L.<nbsp>Ferrar, Some summations
    over the lattice points of a circle (I), (II).
    Quart.<nbsp>J.<nbsp>Math.<nbsp>Oxford Ser., 5 (1934), 46\U63; 172\U185.

    <item>M.<nbsp>L.<nbsp>Ferrar, Summation formulae and their relation to
    Dirichlet series I, II. Compositio Math., 1 (1934), 344\U360; 4 (1936),
    396\U405.

    <item>H.<nbsp>Hamburger, Ueber die Riemannsche Funktionalgleichung der
    <math|\<zeta\>>-Funktion I, II, III; Math.<nbsp>Zeit.<nbsp>10 (1921),
    240\U254; 11 (1921), 224\U245; 13 (1922), 283\U311; also: Ueber einige
    Beziehungen die mit der Funktionalgleichung der Riemannschen
    <math|\<zeta\>>-Funktion aequivalent sind, Math.<nbsp>Ann.<nbsp>85
    (1922), 129\U140; also E.<nbsp>Hecke, Ueber die Loesungen der
    Riemannschen Funktionalgleichung, Math.<nbsp>Zeit.<nbsp>16 (1923),
    301\U307.

    <item>E.<nbsp>Hecke, Ueber die Bestimmung Dirichletscher Reihen durch
    ihre Funktionalgleichung, Math.<nbsp>Ann.<nbsp>112 (1936), 664\U699; also
    H.<nbsp>Rademacher, Trends in research, the analytic number theory.
    Bull.<nbsp>Amer.<nbsp>Math.<nbsp>Soc.<nbsp>48 (1942), p.<nbsp>393.

    <item>N.<nbsp>S.<nbsp>Koshliakov, Application of the theory of
    sumformulae to the investigation of a class of one-valued analytical
    functions in the theory of numbers. Messenger of Mathematics, 58 (1929),
    1\U23.

    <item>H.<nbsp>Maass, Ueber eine neue Art von nicht-analytischen
    automorphen Funktionen und die Bestimmung Dirichletscher Reihen durch
    Funktionalgleichungen. Math.<nbsp>Ann.<nbsp>121 (1949), 141\U183; also,
    Automorphe Funktionen von mehreren Veraenderlichen und Dirichletsche
    Reihen. Abh.<nbsp>Math.<nbsp>Sem.<nbsp>Hansischen Univ.<nbsp>16 (1949),
    72\U100.

    <item>C.<nbsp>L.<nbsp>Siegel, Einfuehrung in die Theorie der
    Modulfunktionen <math|n>-ten Grades. Math.<nbsp>Ann.<nbsp>116 (1939),
    617\U657.

    <item>G.<nbsp>Voronoï, Sur une fonction transcendante et ses application
    a la sommation de quelques series. Ann.<nbsp>École Norm., (3) 21 (1904);
    207\U267, 459\U533.

    <item>A.<nbsp>Walfisz, Ueber die Summatorischen Funktionen einiger
    Dirichletscher Reihen. Inaugural dissertation, Göttingen, 1922.

    <item>A.<nbsp>Walfisz, Ueber Summabilitätssätze von Marcel Riesz.
    Math.<nbsp>Ann.<nbsp>93 (1924), 130\U148.

    <item>G.<nbsp>N.<nbsp>Watson, Bessel functions. 1922, 1944.

    <item>J.<nbsp>R.<nbsp>Wilton, A note on Ramanujan's arithmetical function
    <math|\<tau\><around|(|n|)>>. Proc.<nbsp>Cambridge
    Philos.<nbsp>Soc.<nbsp>25 (1929), 121\U9; and G.<nbsp>H.<nbsp>Hardy, A
    further note on Ramanujan's arithmetical function
    <math|\<tau\><around|(|n|)>>. Ibid., 34 (1938), 309\U315.
  </enumerate>
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
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-10|<tuple|104|12>>
    <associate|auto-11|<tuple|121|14>>
    <associate|auto-12|<tuple|121|14>>
    <associate|auto-13|<tuple|128|15>>
    <associate|auto-14|<tuple|138|16>>
    <associate|auto-15|<tuple|155|18>>
    <associate|auto-16|<tuple|155|18>>
    <associate|auto-17|<tuple|182|20>>
    <associate|auto-18|<tuple|198|22>>
    <associate|auto-2|<tuple|23|3>>
    <associate|auto-3|<tuple|23|3>>
    <associate|auto-4|<tuple|43|6>>
    <associate|auto-5|<tuple|60|8>>
    <associate|auto-6|<tuple|76|9>>
    <associate|auto-7|<tuple|76|9>>
    <associate|auto-8|<tuple|84|10>>
    <associate|auto-9|<tuple|95|11>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Section
      I. Functional Equations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Section
      II. Summation Formulas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|5. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|6. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|7. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Section
      III. Supplementary Remarks> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      <with|par-left|<quote|1tab>|8. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|9. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|10. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Section
      IV. Modular Exponential Sums> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>

      <with|par-left|<quote|1tab>|11. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|12. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Addendum>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>