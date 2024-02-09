<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Approximate Solution of Riccati's
  Equation>|<doc-author|<author-data|<author-name|F. MAX STEINT and R. G.
  HUFFSTUTLER>|<\author-affiliation>
    <date|1966>
  </author-affiliation>>>>

  \<cdot\><section|Introduction>

  Bessel functions of the zeroth order possess the property that their
  derivatives give Bessel functions of the first order; i.e.,

  <\equation>
    <wide|J|\<dot\>><rsub|0><around|(|x|)>=-J<rsub|1><around|(|x|)>
  </equation>

  In this paper we make use of this fact in approximating the solution of the
  nonlinear differential equation, the Riccati equation,

  <\equation>
    L<around|(|y<around*|(|x|)>|)>=<wide|y|\<dot\>><around*|(|x|)>-P<around|(|x|)>*y<around*|(|x|)>-Q<around|(|x|)>*y<around*|(|x|)><rsup|2>=R<around|(|x|)>
  </equation>

  by a sum <math|S<rsub|n><around|(|x|)>> of <math|n> terms of Bessel
  functions of the zeroth order. We consider the existence and uniqueness of
  such a sum of Bessel functions <math|y=S<rsub|n><around|(|x|)>> that
  satisfies the condition that\ 

  <\equation>
    y<rsub|0>=S<rsub|n><around|(|x<rsub|0>|)>\<forall\>x<rsub|0>\<in\>I where
    I=<around|[|0,1|]>
  </equation>

  and which at the same time gives the best approximation to the solution of
  (2) in <math|I> in the sense that the integral

  <\equation>
    <big|int><rsub|0><rsup|1><around|\||R<around|(|x|)>-L<around|[|S<rsub|n><around|(|x|)>|]>|\|>*<rsup|m><space|0.17em>dx<text|>
  </equation>

  is a minimum where <math|m\<gtr\>0> is fixed.

  <section|The Riccati differential equation>

  If <math|Q<around|(|x|)>\<neq\>0> for <math|x> in <math|I>, then, by
  reducing (2) to a second order linear differential equation, we can show
  that, if <math|P>, <math|Q>, and <math|<frac|<wide|R|\<dot\>>|Q>> are
  analytic in <math|I>, there exists a unique continuous solution,
  <math|y=y<around|(|x|)>> such that for a given <math|y<rsub|0>> we have
  <math|y<rsub|0>=y<around|(|x<rsub|0>|)>>, (see [2]). Throughout our work we
  shall assume that the coefficients in (2) are such that there exists a
  unique continuous solution <math|y=y<around|(|x|)>> that satisfies
  <math|y<rsub|0>=y<around|(|x<rsub|0>|)>> and possesses a continuous first
  derivative and a second derivative of bounded variation.

  <section|The approximating sum>

  The following facts are known (see [1], [10]). First, the set
  <math|<around|{|J<rsub|n>*<around|(|\<lambda\>*x|)>|}>> of <math|n>th order
  Bessel functions is an orthogonal set over <math|I> with respect to the
  weight function <math|x>, i.e.,

  <assign|section-nr|3><assign|page-nr|426>

  <section*|>

  <\equation>
    <big|int><rsub|0><rsup|1>x*J<rsub|n>*<around|(|\<lambda\>*x|)>*J<rsub|n>*<around|(|\<lambda\><rprime|'>*x|)>*<space|0.17em>d*x=c<rsub|j>*\<delta\><rsub|j*k>
  </equation>

  where the <math|\<delta\><rsub|j*k>> is the Kronecker delta and the
  <math|c<rsub|j>>'s are constants, if the set of eigenvalues
  <math|<around|{|\<lambda\><rsub|i>|}>> are the positive roots of one of the
  equations

  <\enumerate>
    <item*|(a)><math|J<rsub|n><around|(|x|)>=0>\ 

    or

    <item*|(b)><math|J<rprime|'><rsub|n><around|(|x|)>=0>
  </enumerate>

  We assume that <math|\<lambda\><rsub|i>\<less\>\<lambda\><rsub|i+1>,i=1,2,\<ldots\>>.
  Next, the normalized Fourier-Bessel coefficients for the expansion of a
  function <math|f<around|(|x|)>> in terms of the Bessel functions
  <math|<around|{|J<rsub|n>*<around|(|\<lambda\>*x|)>|}>> are

  <\equation>
    B<rsub|m>=<frac|<big|int><rsub|0><rsup|1>x*f<around|(|x|)>*J<rsub|n>*<around|(|\<lambda\><rsub|m>*x|)>*<space|0.17em>d*x|<big|int><rsub|0><rsup|1>x*<around|[|J<rsub|n>*<around|(|\<lambda\><rsub|m>*x|)>|]><rsup|2>*<space|0.17em>d*x>
  </equation>

  And finally, for both <math|J<rsub|0><around|(|x|)>> and
  <math|J<rsub|1><around|(|x|)>> the first positive eigenvalue is greater
  than 1, a fact we shall use later. It is also known that
  <math|\<lambda\><rsub|m>> is of the order of <math|m>, or
  <math|\<lambda\><rsub|m>=O<around|(|m|)>> (see [5]). That is,
  <math|<frac|\<lambda\><rsub|m>|m>\<less\>K>, a constant, for large enough
  <math|m>. Moore [6] and Scherberg [8] have considered the degree of
  convergence of the general expression

  <\equation>
    f<around|(|x|)>=<big|sum><rsub|m=0><rsup|\<infty\>>B<rsub|m>*J<rsub|n>*<around|(|\<lambda\><rsub|m>*x|)><space|1em>n\<geq\>0
  </equation>

  where the <math|B<rsub|m>>'s are given in (6). The degree of convergence of
  sums of Bessel functions to a given function <math|f<around|(|x|)>> is
  defined to be the absolute value of the difference between the function and
  the first <math|n> terms of a series of Bessel functions that is known to
  converge to <math|f<around|(|x|)>>.

  In our work we shall consider the series

  <\equation>
    f<around|(|x|)>=<big|sum><rsub|m=1><rsup|\<infty\>>B<rsub|m>*J<rsub|0>*<around|(|\<lambda\><rsub|m>*x|)>
  </equation>

  in the special case in which <math|n=0> in (5) and (7); i.e., we consider
  the case in which the <math|\<lambda\><rsub|i>>'s are the distinct positive
  roots of

  <\equation>
    J<rsub|1><around|(|x|)>=<wide|J|\<dot\>><rsub|0><around|(|x|)>=0
  </equation>

  and the <math|B<rsub|m>>'s are as given in (6) with <math|n=0>. Thus we
  have that the sets <math|<around|{|J<rsub|0>*<around|(|\<lambda\>*x|)>|}>>
  and <math|<around|{|J<rsub|1>*<around|(|\<lambda\>*x|)>|}>> are both sets
  of orthogonal functions with respect to the weight function <math|x> and
  over the same interval <math|<around|[|0,1|]>>, and the corresponding sets
  of eigenvalues <math|<around|{|\<lambda\><rsub|i>|}>> are the same in each
  case.

  <section|Preliminary lemmas>

  In this section we state, but do not prove, two lemmas that are needed in
  our further discussion. The first of these lemmas<assign|page-nr|427> is
  needed for the proof of the second. These lemmas and their proofs may be
  found in [6] and [8].

  In the following discussion the order symbol <math|O> will be used; e.g.,
  <math|O<around|(|<frac|1|\<lambda\><rsub|i>>|)>> is such that
  <math|\<lambda\><rsub|i>*O<around|(|<frac|1|\<lambda\><rsub|i>>|)>> is
  bounded for large <math|\<lambda\><rsub|i>> or for large <math|i>, since
  <math|\<lambda\><rsub|i>\<gtr\>1> and <math|\<lambda\><rsub|i>> is of the
  order of <math|i>.

  <with|font-series|bold|Lemma 1.> If <math|F<around|(|x|)>> is a function
  such that <math|<frac|F<around|(|x|)>|x>> has bounded variation
  \<forall\><math|x\<in\>I>, then

  <\equation>
    <big|int><rsub|0><rsup|1>F<around|(|x|)>*J<rsub|m>*<around|(|\<lambda\>*x|)>*<space|0.17em>d*x=O<around*|(|<frac|1|\<lambda\><rsub|m>>|)><rsup|<frac|3|2>>
  </equation>

  <with|font-series|bold|Lemma 2.> For <math|x\<in\>><math|I> let the
  function <math|f<around|(|x|)>> be such that it has bounded variation. Then
  the general coefficient <math|B<rsub|m>> in (7) is such that

  <\equation>
    B<rsub|m>=O<around*|(|<frac|1|\<lambda\><rsub|m>>|)><rsup|<frac|3|2>>
  </equation>

  <section|Convergence of sums of Bessel functions to a given function>

  We now consider a theorem that establishes the degree of convergence of a
  sum <math|S<rsub|n><around|(|x|)>> of zeroth order Bessel functions to a
  suitably restricted function <math|f<around|(|x|)>> for
  <math|x\<in\>I\<centerdot\>><math|I>. An analogous theorem is then
  developed involving a sum <math|S<rsub|n><around|(|x|)>> of first order
  Bessel functions and <math|f<around|(|x|)>>, the derivative of the function
  <math|f<around|(|x|)>> given in the first of these theorems.

  <with|font-series|bold|Theorem 1.> If <math|f<around|(|x|)>> exists and has
  bounded variation for <math|x> in <math|I>, then

  <\equation>
    <around|\||f<around|(|x|)>-S<rsub|n><around|(|x|)>|\|>=<sqrt|O<around*|(|<frac|1|n>|)>>
  </equation>

  where

  <\equation>
    S<rsub|n><around|(|x|)>=<big|sum><rsub|m=1><rsup|n>B<rsub|m>*J<rsub|0>*<around|(|\<lambda\><rsub|m>*x|)>
  </equation>

  and

  <\equation>
    B<rsub|m>=O<around*|(|<frac|1|\<lambda\><rsub|m>>|)><rsup|<frac|3|2>>
  </equation>

  <with|font-shape|italic|Proof.> From Lemma 2 the coefficient of the general
  term of <math|S<rsub|n><around|(|x|)>> is such that
  <math|B<rsub|m>=O<around|(|<frac|1|\<lambda\><rsub|m>>|)><rsup|<frac|3|2>>>,
  so that we have

  <\equation>
    <tabular|<tformat|<table|<row|<cell|f<around|(|x|)>-S<rsub|n><around|(|x|)>>|<cell|=<big|sum><rsub|m=n+1><rsup|\<infty\>>B<rsub|m>*J<rsub|0>*<around|(|\<lambda\><rsub|m>*x|)>-<big|sum><rsub|m=1><rsup|n>B<rsub|m>*J<rsub|0>*<around|(|\<lambda\><rsub|m>*x|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|m=n+1><rsup|\<infty\>>B<rsub|m>*J<rsub|0>*<around|(|\<lambda\><rsub|m>*x|)><text|>>>|<row|<cell|>|<cell|=<big|sum><rsub|m=n+1><rsup|\<infty\>>O<around*|(|<frac|1|m>|)><rsup|<frac|3|2>>*J<rsub|0>*<around|(|\<lambda\><rsub|m>*x|)>>>>>>
  </equation>

  However, <math|<around|\||J<rsub|0><around|(|t|)>|\|>\<leq\>1> for all
  values of <math|t> so that

  <\equation>
    <around|\||f<around|(|x|)>-S<rsub|n><around|(|x|)>|\|>=<big|sum><rsub|m=n+1><rsup|\<infty\>>O<around*|(|<frac|1|m>|)><rsup|<frac|3|2>>*\<lambda\><rsub|m>=O<around*|(|<big|sum><rsub|m=n+1><rsup|\<infty\>><frac|1|m<rsup|<frac|3|2>>>|)>
  </equation>

  <\equation>
    <tabular|<tformat|<table|<row|<cell|Q<rsub|1><around|(|x|)>>|<cell|=<frac|f<around|(|x|)>-f<rsub|c><around|(|x|)>|x>=<sqrt|O<around*|(|<frac|1|\<lambda\><rsub|n+1>>|)>><rsup|>>>|<row|<cell|Q<rsub|c><around|(|x|)>>|<cell|=<frac|f<rsub|c><around|(|x|)>-S<rsub|n><around|(|x|)>|x>=<sqrt|O<around*|(|<frac|1|\<lambda\><rsub|n+1>>|)><rsup|>>>>>>>
  </equation>

  where <math|f<rsub|c><around|(|x|)>> is the sum of the first <math|n> terms
  of the expansion of <math|f<around|(|x|)>> by sums of Bessel functions. We
  have

  <\equation>
    <big|int><rsub|0><rsup|1><around|\||Q<rsub|1><around|(|x|)>|\|><rsup|2>*<space|0.17em>d*x=O<around*|(|<frac|1|\<lambda\><rsub|n+1>>|)><text|>
  </equation>

  <\equation>
    <big|int><rsub|0><rsup|1><around|\||Q<rsub|c><around|(|x|)>|\|><rsup|2>*<space|0.17em>d*x=O<around*|(|<frac|1|\<lambda\><rsub|n+1>>|)>
  </equation>

  Hence

  <\align*>
    <tformat|<table|<row|<cell|<around|\||f<around|(|x|)>-S<rsub|n><around|(|x|)>|\|>>|<cell|=<around|\||x*<around|(|Q<rsub|1><around|(|x|)>+Q<rsub|c><around|(|x|)>|)>|\|>,>>|<row|<cell|>|<cell|\<leq\>x*<around|(|<around|\||Q<rsub|1><around|(|x|)>|\|>+<around|\||Q<rsub|c><around|(|x|)>|\|>|)>>>|<row|<cell|>|<cell|=<sqrt|O<around*|(|<frac|1|\<lambda\><rsub|n+1>>|)>>>>>>
  </align*>

  Thus by defining <math|Q<rsub|c><around|(|x|)>> as the sum of the first
  <math|n> terms of the expansion of <math|f<around|(|x|)>> by Bessel
  functions, we have

  <\equation>
    <frac|f<rsub|c><around|(|x|)>|x>-<frac|S<rsub|n><around|(|x|)>|x>=<big|sum><rsub|m=1><rsup|n><frac|B<rsub|m>*J<rsub|0>*<around|(|\<lambda\><rsub|m>*x|)>|x><text|>
  </equation>

  and hence

  <\equation>
    <frac|f<around|(|x|)>|x>-<frac|S<rsub|n><around|(|x|)>|x>=Q<rsub|1><around|(|x|)>+<big|sum><rsub|m=1><rsup|n><frac|B<rsub|m>*J<rsub|0>*<around|(|\<lambda\><rsub|m>*x|)>|x><text|>
  </equation>

  It follows that

  <\equation>
    <big|int><rsub|0><rsup|1><around*|\||<frac|f<around|(|x|)>|x>-<frac|S<rsub|n><around|(|x|)>|x>|\|><rsup|2>*<space|0.17em>d*x=O<around*|(|<frac|1|\<lambda\><rsub|n+1>>|)><text|>
  </equation>

  where <math|f<rsub|c><around|(|x|)>> is the sum of the first <math|n> terms
  of the expansion of <math|f<around|(|x|)>> by Bessel functions. This
  completes the proof of Theorem 1.

  The proof of Theorem 1 is completed by the result of Lemma 2, that is,

  <\equation>
    f<around|(|x|)>-S<rsub|n><around|(|x|)>=<sqrt|O<around*|(|<frac|1|n>|)>><text|>
  </equation>

  and we have

  <\equation>
    <big|int><rsub|0><rsup|1><around|\||f<around|(|x|)>-S<rsub|n><around|(|x|)>|\|><rsup|2>*<space|0.17em>d*x=O<around*|(|<frac|1|n>|)><text|>
  </equation>

  Hence

  <\equation>
    <around|\||f<around|(|x|)>-S<rsub|n><around|(|x|)>|\|>=<sqrt|O<around*|(|<frac|1|n>|)>>
  </equation>

  since <math|a-b> is of the order of the larger of <math|a> and
  <math|b>.<assign|page-nr|429> We now consider the degree of convergence of
  sums of Bessel functions to a given function <math|f<around|(|x|)>> and the
  derivative of these sums as they converge to
  <math|f<rprime|'><around|(|x|)>>.

  <with|font-series|bold|Theorem 3.> If <math|f<around|(|x|)>> and
  <math|f<rprime|'><around|(|x|)>> are such that
  <math|f<rprime|''><around|(|x|)>> exists and has bounded variation in
  <math|I>, then there exists a sum of zeroth order Bessel functions such
  that

  <\equation>
    <around|\||f<rsup|<around|(|k|)>><around|(|x|)>-S<rsub|n><rsup|<around|(|k|)>><around|(|x|)>|\|>=<sqrt|O<around*|(|<frac|1|\<lambda\><rsub|n>>|)>><rsup|><space|1em>k=0,1.
  </equation>

  <with|font-shape|italic|Proof.> Assume <math|f<around|(|x|)>> is a function
  of <math|x> as described by Theorem 2 and that
  <math|Q<rsub|n><around|(|x|)>> is a sum of Bessel functions

  <\equation>
    Q<rsub|n><around|(|x|)>=<big|sum><rsub|m=1><rsup|n>B<rsub|m>*J<rsub|0>*<around|(|\<lambda\><rsub|m>*x|)>
  </equation>

  Then from Theorem 2 we have that

  <\equation>
    <around|\||f<around|(|x|)>-Q<rsub|n><around|(|x|)>|\|>=<sqrt|O<around*|(|<frac|1|\<lambda\><rsub|n>>|)>>
  </equation>

  Next define <math|R<rsub|n><around|(|x|)>> by

  <\equation>
    R<rsub|n><around|(|x|)>=f<around|(|0|)>+<big|int><rsub|0><rsup|x>Q<rsub|n><around|(|t|)>*<space|0.17em>d*t
  </equation>

  That is, <math|R<rsub|n><around|(|x|)>> is a sum of zeroth order Bessel
  functions. From (11) we can write

  <\equation>
    <tabular|<tformat|<table|<row|<cell|f<around|(|x|)>-R<rsub|n><around|(|x|)>>|<cell|=f<around|(|x|)>-f<around|(|0|)>-<big|int><rsub|0><rsup|x>Q<rsub|n><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|x><wide|f|\<dot\>><around|(|t|)>*<space|0.17em>d*t-<big|int><rsub|0><rsup|x>Q<rsub|n><around|(|t|)>*<space|0.17em>d*t>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|x><around*|[|<wide|f|\<dot\>><around|(|t|)>-Q<rsub|n><around|(|t|)>|]>*<space|0.17em>d*t>>>>>
  </equation>

  Therefore

  <\equation>
    <around|\||f<around|(|x|)>-R<rsub|n><around|(|x|)>|\|>=<around*|\||<big|int><rsub|0><rsup|x><around*|[|f<rprime|'><around|(|t|)>-Q<rsub|n><around|(|t|)>|]>*<space|0.17em>d*t|\|>=<around|(|1-0|)><sqrt|O<around*|(|<frac|1|\<lambda\><rsub|n>>|)>>
  </equation>

  and

  <\equation>
    <around|\||f<rprime|'><around|(|x|)>-R<rsub|n><rprime|'><around|(|x|)>|\|>=<frac|<sqrt|O<around*|(|<frac|1|\<lambda\><rsub|n>>|)>>|<sqrt|\<lambda\><rsub|n>>><rsup|>
  </equation>

  since <math|R<rsub|n><rprime|'><around|(|x|)>=Q<rsub|n><around|(|x|)>> from
  (11). From these two equations we see that <math|f<around|(|x|)>> can be
  uniformly approximated by a sum of zeroth order Bessel functions such that
  <math|f<around|(|x|)>> is, at the same time, uniformly approximated by the
  derivative of this sum, and the theorem is proved.

  <section|Existence and uniqueness of minimizing sums>

  The proof of existence of sums of zeroth order Bessel functions that will
  minimize (3) can be shown in a manner analogous to the discussion of the
  least mth power approximation by Jackson [3] and McEwen [4] who used other
  types of functions; this proof is omitted here.

  Also omitted is the proof of the uniqueness of a minimizing sum for the
  case when <math|m\<gtr\>1>. The usual proof by contradiction can be used.
  Two sums that make (3) a minimum are assumed, and by considering their
  arithmetic mean one is led to the required contradiction (see [3]).

  <section|The approximate solution of Riccati's equation>

  Before we arrive at the principal theorem of the paper, we state a lemma
  that is a special case of a theorem due to Oberg [7]. His theorem for sums
  of orthonormal functions says that if

  <\equation>
    S<rsub|n><around|(|x|)>=<big|sum><rsub|i=1><rsup|n>a<rsub|i>*\<phi\><rsub|i><around|(|x|)>
  </equation>

  is a sum of orthonormal functions, and if <math|w<rsub|0>> is the maximum
  of <math|<around|\||S<rsub|n><around|(|x|)>|\|>> for all <math|x> in the
  interval <math|<around|[|a,b|]>>, then

  <\equation>
    <around*|\||<frac|d*S<rsub|n><around|(|x|)>|d*x>|\|>\<leq\>*<frac|M
    w<rsub|0>|<sqrt|b-a>>*
  </equation>

  where <math|M> is a constant and <math|\<lambda\><rsub|n>> is a variable
  which increases with <math|n>. Also, the theorem is similar to one
  developed by Stein [9] in approximating the solutions of
  integro-differential equations.

  <with|font-series|bold|Lemma 3.> If <math|g<rsub|n><around|(|x|)>> is a sum
  of <math|n> terms of zeroth order Bessel functions that satisfies a
  boundary condition such as <math|y<rsub|0>=g<rsub|n><around|(|x<rsub|0>|)>>,
  if <math|<wide|P*|\<dot\>><around|(|x|)>> and
  <math|<wide|Q|\<dot\>><around|(|x|)>> of (2) are bounded
  \<forall\><math|x\<in\>><math|I>, and further if <math|<wide|w|~>> is the
  maximum for <math|<around|\||g<rsub|n><around|(|x|)>|\|>> for <math|x> in
  this interval, then

  <\enumerate>
    <item*|(a)><math|<around*|\||L<around|[|g<rsub|n><around|(|x|)>|]>|\|>\<leq\>A*\<lambda\><rsub|n><rsup|2>*<wide|w|~>>
    and

    <item*|(b)><math|<around*|\||<frac|d*L<around|[|g<rsub|n><around|(|x|)>|]>|d*x>|\|>\<leq\>B*\<lambda\><rsub|n><rsup|2>*<wide|w|~><rsup|2>>
  </enumerate>

  for all <math|x> in <math|I>, where <math|A> and <math|B> are positive
  constants not depending on <math|n>, and <math|L> is defined by (2).

  The proof of this theorem follows that of Oberg [7] and is not included.

  We are now ready to consider the approximate solution of the Riccati
  equation, with the boundary condition <math|y<rsub|0>=y<around|(|x<rsub|0>|)>>,
  by a sum of zeroth order Bessel functions. That is, we want to find the
  conditions on the sum <math|S<rsub|n><around|(|x|)>> which satisfies
  <math|y<rsub|0>=S<rsub|n><around|(|x<rsub|0>|)>> and which approximates the
  solution <math|y<around|(|x|)>> such that the integral in (3) is a minimum;
  the sum <math|S<rsub|n><around|(|x|)>> is called the
  <with|font-shape|italic|minimizing sum> for <math|y<around|(|x|)>> and is
  the <with|font-shape|italic|best approximation> for fixed <math|m> in (3).

  Let <math|g<rsub|n><around|(|x|)>> be an arbitrary sum of zeroth order
  Bessel functions that satisfies the boundary condition
  <math|y<rsub|0>=g<rsub|n><around|(|x<rsub|0>|)>> and is such that

  <\equation>
    <around*|\||y<rsup|<around|(|k|)>><around|(|x|)>-g<rsub|n><rsup|<around|(|k|)>><around|(|x|)>|\|>\<leq\>\<eta\><rsub|n>\<forall\>\<eta\><rsub|n>\<less\>1,k=0,1<space|1em>
  </equation>

  \;

  <assign|section-nr|4><assign|page-nr|431>

  Note that <math|\<eta\>> depends on <math|n>; however, it is not so
  indicated in the following discussion. The statement in (12) is possible by
  Theorem 3 and is true for all values of <math|x> in <math|I>, where
  <math|y<around|(|x|)>> is the solution of the Riccati equation. Let
  <math|r<rsub|n><around|(|x|)>=y<around|(|x|)>-g<rsub|n><around|(|x|)>>, and
  let <math|Q<rsub|n><around|(|x|)>=S<rsub|n><around|(|x|)>-g<rsub|n><around|(|x|)>>,
  where <math|S<rsub|n><around|(|x|)>> is the sum of zeroth order Bessel
  functions which satisfies the boundary condition and which makes

  <\equation>
    v<rsub|n>=<big|int><rsub|0><rsup|1><around|\||R<around|(|x|)>-L<around|[|S<rsub|n><around|(|x|)>|]>|\|>*<space|0.17em>d*x\<forall\>fixed<space|1em>m\<gtr\>0
  </equation>

  a minimum. It is possible that <math|Q<rsub|n><around|(|x|)>=0>, since
  <math|S<rsub|n><around|(|x|)>> and <math|g<rsub|n><around|(|x|)>> both
  satisfy the boundary condition, and <math|0> is a sum of zeroth order
  Bessel functions trivially; note that the boundary condition for
  <math|Q<rsub|n><around|(|x|)>> is <math|0>. Thus using (13) and (2) we can
  write

  <\equation>
    <tabular|<tformat|<table|<row|<cell|v<rsub|n>>|<cell|=<big|int><rsub|0><rsup|1><around|\||R<around|(|x|)>-L<around|[|S<rsub|n><around|(|x|)>|]>*<around|\||<space|0.17em>d*x|\<nobracket\>>*|\<nobracket\>>>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|1><around*|\||L<around|(|y|)>-L<around|(|S<rsub|n>|)>|\|>\<mathd\>
    x>>|<row|<cell|>|<cell|=<big|int><rsub|0><rsup|1><around|\||L*<around|(|y-S<rsub|n>|)>-2*Q*S<rsub|n>*<around|(|y-S<rsub|n>|)>|\|>*<space|0.17em>d
    x>>|<row|<cell|>|<cell|\<leq\><big|int><rsub|0><rsup|1><around|\||L<around|(|r<rsub|n>|)>-2*Q*S<rsub|n>*r<rsub|n>|\|>*<space|0.17em>d
    x>>>>>
  </equation>

  assuming <math|Q<rsub|n><around|(|x|)>=0> as a possibility. The final step
  in (14) is permissible since <math|S<rsub|n><around|(|x|)>> is the
  minimizing sum for <math|y<around|(|x|)>>, and the value of the integral is
  no less for any other sum. Then since

  <\equation>
    L<around|(|r<rsub|n>|)>=<wide|r|\<dot\>><rsub|n>-P<around|(|x|)>*r<rsub|n>-Q<around|(|x|)>*r<rsub|n><rsup|2><text|>
  </equation>

  we have that

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<around|\||L<around|(|r<rsub|n>|)>|\|>>|<cell|\<leq\><around|\||r<rsub|n>|\|>+<around|\||P|\|>\|r<rsub|n>\|+<around|\||Q|\|><around|\||r<rsub|n><rsup|2>|\|>>>|<row|<cell|>|<cell|\<leq\>\<eta\>+M<rsub|1>*\<eta\>+M<rsub|2>*\<eta\><rsup|2>\<leq\>N*\<eta\><text|>>>>>>
  </equation>

  where <math|M<rsub|1>> and <math|M<rsub|2>> are the upper bounds for
  <math|<around|\||P<around|(|x|)>|\|>> and
  <math|<around|\||Q<around|(|x|)>|\|>> over <math|I>, and <math|N> is a
  constant.

  Also since <math|S<rsub|n><around|(|x|)>> satisfies the conditions of Lemma
  3, then <math|<around|\||S<rsub|n><around|(|x|)>|\|>\<leq\>w>,
  <math|<around|(|w=max <around|{|<around|\||S<rsub|n><around|(|x|)>|\|>,<around|\||g<rsub|n><around|(|x|)>|\|>,<around|\||Q<rsub|n><around|(|x|)>|\|>:x\<in\>I|}>|)>>,
  and we have from (12), (14), and (15) that

  <\equation>
    <tabular|<tformat|<table|<row|<cell|v<rsub|n>>|<cell|=<big|int><rsub|0><rsup|1><around|\||L<around|(|r<rsub|n>|)>-2*Q*S<rsub|n>*r<rsub|n>|\|>*<space|0.17em>d*x>>|<row|<cell|>|<cell|\<leq\><big|int><rsub|0><rsup|1><around|(|<around|\||L<around|(|r<rsub|n>|)>*<around|\||+2|\|>*Q<around|\|||\|>*S<rsub|n>*r<rsub|n>|\|>|)>*<space|0.17em>d*x<text|>>>|<row|<cell|>|<cell|\<leq\><big|int><rsub|0><rsup|1><around|(|N*\<eta\>+2*M<rsub|2>*w*\<eta\>|)>*<space|0.17em>d*x>>|<row|<cell|>|<cell|=N<rsub|1>*\<eta\>*m>>>>>
  </equation>

  where <math|N<rsub|1>> is a constant. Let <math|x<rsub|1>> be the point in
  <math|I> where <math|<around|\||L<around|[|Q<rsub|n>|]>|\|>> reaches its
  maximum, and denote this maximum by <math|A*\<lambda\><rsub|n>*w<rsup|2>>,
  <math|A> a constant. Then by the mean value theorem we have that

  <\equation>
    <around|\||L<around|[|Q<rsub|n><around|(|x|)>|]>-L<around|[|Q<rsub|n><around|(|x<rsub|1>|)>|]>|\|>\<leq\><around|\||x-x<rsub|1>|\|>*max<rsub|x\<in\>I><around|\||<wide|L|\<dot\>><around|[|Q<rsub|n><around|(|X|)>|]>|\|>\<leq\><frac|A*\<lambda\><rsub|n>*w<rsup|2>|2*B<rsub|n>><text|>
  </equation>

  for <math|<around|\||x-x<rsub|1>|\|>\<leq\>1> and
  <math|<around|\||x-x<rsub|1>|\|>\<leq\><frac|A|2>*B<rsub|n>>. Let us choose
  an interval about <math|x<rsub|1>> such that
  <math|<around|\||x-x<rsub|1>|\|>\<leq\>A/2*B<rsub|n>>, or the part of the
  interval that is contained in <math|<around|[|0,1|]>>, if <math|x<rsub|1>>
  is nearer to <math|0> or <math|1> by less than <math|A/2*B<rsub|n>>, where
  <math|A> and <math|B> are constants. Then upon applying conclusion (b) of
  Lemma 3 we have that

  <\equation>
    <around|\||L<around|[|Q<rsub|n><around|(|x|)>|]>-L<around|[|Q<rsub|n><around|(|x<rsub|1>|)>|]>|\|>\<leq\><frac|A*\<lambda\><rsub|n>*w<rsup|2>|2><text|>
  </equation>

  Hence,

  <\equation>
    <around|\||L<around|[|Q<rsub|n><around|(|x|)>|]>|\|>\<leq\><frac|3|4>*A*\<lambda\><rsub|n>*w<rsup|2>x
  </equation>

  for <math|x> in <math|I>.

  Now by (15) <math|<around|\||L<around|[|r<rsub|n>|]>|\|>\<leq\>N*\<eta\>>.
  Thus if <math|n> is chosen large enough so that
  <math|\<lambda\><rsub|n>\<gtr\>16*M<rsub|2>/A> and if <math|\<eta\>> is
  chosen so that <math|n\<leq\><around|(|A*\<lambda\><rsub|n>-16*M<rsub|2>|)>/<around|(|16*M<rsub|2>*w|)>>,
  and recalling that <math|\<eta\>\<less\>1>, then either
  <math|N*\<eta\>\<leq\><frac|3|4>*A*\<lambda\><rsub|n>*w<rsup|2>> or
  <math|N*\<eta\>\<leq\><frac|3|4>*A*\<lambda\><rsub|n>*w<rsup|2>>.

  First, by assuming that <math|N*\<eta\>\<leq\><frac|3|4>*A*\<lambda\><rsub|n>*w<rsup|2>>,
  we have that

  <\align*>
    <tformat|<table|<row|<cell|<around|\||L<around|(|y|)>-L<around|(|S<rsub|n>|)>|\|>>|<cell|=<around|\||L*<around|(|r<rsub|n>+g<rsub|n>|)>-L*<around|(|Q<rsub|n>+g<rsub|n>|)>|\|><rsup|2>>>|<row|<cell|>|<cell|=<around|\||r<rsub|n><rprime|'>+g<rsub|n><rprime|'>-P*r<rsub|n>-P*g<rsub|n>-Q*r<rsub|n><rsup|2>-Q*g<rsub|n><rsup|2>-2*Q*r<rsub|n>*g<rsub|n>|\|>>>|<row|<cell|>|<cell|=<around|\||L<around|(|r<rsub|n>|)>+L<around|(|g<rsub|n>|)>-2*Q*g<rsub|n>*r<rsub|n>-P*Q<rsub|n>-P*g<rsub|n>-Q*Q<rsub|n><rsup|2>-Q*g<rsub|n><rsup|2>-2*Q*Q<rsub|n>*g<rsub|n>|\|>>>|<row|<cell|>|<cell|\<geq\><around|\||L<around|(|Q<rsub|n>|)>|\|>-<around|\||L<around|(|r<rsub|n>|)>*<around|\||-2|\|>*Q<around|\|||\|>*g<rsub|n>|\|>*<around|\||r<rsub|n>-Q<rsub|n>|\|>>>|<row|<cell|>|<cell|\<geq\><frac|3|4>*A*\<lambda\><rsub|n>*w<rsup|2>-<frac|3|4>*A*\<lambda\><rsub|n>*w<rsup|2>-2*M<rsub|2>*w*<around|(|\<eta\>+w|)>\<geq\><frac|1|4>*A*\<lambda\><rsub|n>*w<rsup|2>>>>>
  </align*>

  Note that use is made of the fact that <math|<around|\||r<rsub|n>-Q<rsub|n>|\|>\<leq\><around|\||r<rsub|n>|\|>+<around|\||Q<rsub|n>|\|>\<leq\>\<eta\>+w>,
  since <math|Q<rsub|n>> satisfies the conditions of Lemma 3. Therefore

  <\equation>
    v<rsub|n>=<big|int><rsub|0><rsup|1><around|\||L<around|(|y|)>-L<around|(|S<rsub|n>|)>*<around|\||<space|0.17em>d*x\<geq\><big|int><rsub|x<rsub|1>-A/2*B<rsub|n>><rsup|x<rsub|1>+A/2*B<rsub|n>>|\|>*L<around|(|y|)>-L<around|(|S<rsub|n>|)>|\|>*<space|0.17em>d*x\<geq\><frac|A*\<lambda\><rsub|n>*w<rsup|2>|2><text|>
  </equation>

  where <math|N<rsub|1>> is a constant. In the contrary case if we assume
  that <math|N*\<eta\>\<geq\><frac|3|4>*A*\<lambda\><rsub|n>*w<rsup|2>>, then

  <\equation*>
    w<rsup|2>\<leq\><frac|4*N*\<eta\>|A*\<lambda\><rsub|n>>
  </equation*>

  directly. Thus in either event we have that

  <\equation>
    w<rsup|2>\<leq\><around*|[|<frac|8|A*\<lambda\><rsub|n>><around*|(|<frac|B*v<rsub|n>|A>|)><rsup|m>|]><rsup|1/m>*<space|1em>
  </equation>

  <\equation>
    w<rsup|2>\<leq\><around*|[|<frac|8|A*\<lambda\><rsub|n>><around*|(|<frac|<wide|B|\<ddot\>>|A>|)><rsup|m>*N<rsub|1><rsup|1/m>*\<eta\><rsup|1/m>|]><rsup|1/m>
  </equation>

  <\equation>
    w<rsup|2>\<leq\><frac|4*N*\<eta\>|A*\<lambda\><rsub|n>>
  </equation>

  by application of (16). Finally, since <math|\<lambda\><rsub|n>\<gtr\>1>,
  we can write

  <\equation>
    w<rsup|2>\<leq\>C<rsub|1>*\<lambda\><rsub|n><rsup|-m>*\<eta\><rsup|1/m>,
  </equation>

  where <math|C<rsub|1>> is a constant. Using the fact that

  <\equation>
    <around|\||r<rsub|n><rsup|<around|(|k|)>>-Q<rsub|n><rsup|<around|(|k|)>>|\|>\<leq\><around|\||r<rsub|n><rsup|<around|(|k|)>>|\|>+<around|\||Q<rsub|n><rsup|<around|(|k|)>>|\|>\<leq\>\<eta\>+w<text|>
  </equation>

  for <math|k=0,1>, and the conditions of Lemma 3, we have that from (12) and
  (17) and the fact that <math|Q<rsub|n>> satisfies the conditions of Lemma
  3, then

  <\equation>
    <around|\||r<rsub|n><rsup|<around|(|k|)>>-Q<rsub|n><rsup|<around|(|k|)>>|\|>\<leq\>\<eta\>+C<rsub|1>*\<lambda\><rsub|n><rsup|-m>*\<eta\><rsup|1/m>\<leq\>C<rsub|2>*\<lambda\><rsub|n><rsup|-1/2>*\<eta\><rsup|1/2><text|>
  </equation>

  where <math|C<rsub|2>> is a constant and <math|\<eta\>\<leq\>min
  <around*|{|1,<around*|(|<frac|A*\<lambda\><rsub|n>-16*M<rsub|2>|16*M<rsub|2>>|)>*w|}>>,
  and <math|\<eta\>> is given by (12).

  We can thus state the following theorem.

  <with|font-series|bold|Theorem 4.> If <math|y<around|(|x|)>> is the unique
  continuous solution of the Riccati equation in <math|I> which satisfies the
  boundary condition <math|y<rsub|0>=y<around|(|x<rsub|0>|)>> and has a
  continuous first derivative and a second derivative of bounded variation,
  and if <math|y=S<rsub|n><around|(|x|)>> is a sum of <math|n> terms of
  zeroth order Bessel functions such that
  <math|y<rsub|0>=S<rsub|n><around|(|x<rsub|0>|)>> and also such that
  <math|S<rsub|n><around|(|x|)>> makes (3) a minimum for fixed <math|m>, a
  sufficient condition for the uniform convergence of
  <math|S<rsub|n><around|(|x|)>> to <math|y<around|(|x|)>> and
  <math|S<rsub|n><rprime|'><around|(|x|)>> to
  <math|y<rprime|'><around|(|x|)>> throughout <math|I> is that

  <\equation>
    lim<rsub|n\<to\>\<infty\>> \<lambda\><rsub|n><rsup|1/2*m>*\<eta\><rsub|n>=0<text|>
  </equation>

  where <math|\<eta\><rsub|n>=C*<sqrt|v<rsub|n>>>, <math|\<eta\>\<leq\>min
  <around*|{|1,<around*|(|<frac|A*\<lambda\><rsub|n>-16*M<rsub|2>|16*M<rsub|2>>|)>*w|}>>,
  and <math|\<eta\><rsub|n>> is given by (12).

  <section|Conclusion>

  We have shown in Theorem 3 that a suitably restricted function
  <math|f<around|(|x|)>> can be uniformly approximated by a sum
  <math|S<rsub|n><around|(|x|)>> of zeroth order Bessel functions and at the
  same time its derivative <math|f<rprime|'><around|(|x|)>> can be uniformly
  approximated by <math|S<rsub|n><rprime|'><around|(|x|)>>. In Theorem 4 are
  given the conditions for convergence of <math|S<rsub|n><around|(|x|)>> and
  <math|S<rsub|n><rprime|'><around|(|x|)>> to <math|y<around|(|x|)>> and
  <math|y<rprime|'><around|(|x|)>>, the solution of Riccati's equation and
  its derivative respectively, as the number of terms in
  <math|S<rsub|n><around|(|x|)>> increases without bound. By the analogues of
  Jackson's work [3], the minimizing sum <math|S<rsub|n><around|(|x|)>>
  exists and is unique. Thus <math|S<rsub|n><around|(|x|)>> is the best
  approximation to the solution of (2) in the sense given by (3), and the
  solution of (2) can be expanded directly in a series of zeroth order Bessel
  functions under the assumptions of Theorem 4.

  <subsection*|References>

  <\enumerate>
    <item>F. Bowman, <with|font-shape|italic|Introduction to Bessel
    Functions>, Dover Publications, New York, 1958.

    <item>E. A. Coddington and N. Levinson, <with|font-shape|italic|Theory of
    Ordinary Differential Equations>, McGraw-Hill, New York, 1955.

    <item>D. Jackson, <with|font-shape|italic|Proofs of closest
    approximation>, Trans. Amer. Math. Soc., 22 (1921), pp. 117\U158.

    <item>W. H. McEwen, <with|font-shape|italic|Problems of closest
    approximation connected with the solution of linear differential
    equations>, Ibid., 33 (1931), pp. 979\U997.

    <item>C. N. Moore, <with|font-shape|italic|The summability of the
    developments in Bessel functions with applications>, Ibid., 10 (1909),
    pp. 391\U435.

    <item>\V, <with|font-shape|italic|On the uniform convergence of the
    developments in Bessel's functions>, Ibid., 12 (1911), pp. 181\U206.

    <item>E. N. Oberg, <with|font-shape|italic|The approximate solution of
    integral equations>, Bull. Amer. Math. Soc., 41 (1935), pp. 276\U284.

    <item>M. G. Scherberg, <with|font-shape|italic|The degree of convergence
    of a series of Bessel functions>, Trans. Amer. Math. Soc., 35 (1933), pp.
    172\U183.

    <item>F. Max Stein, <with|font-shape|italic|The approximate solution of
    integro-differential equations>, Ph.D. dissertation, State University of
    Iowa, 1955, pp. 1\U66.

    <item>G. N. Watson, <with|font-shape|italic|A Treatise on the Theory of
    Bessel Functions>, Cambridge Press, Cambridge, 1922.
  </enumerate>
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
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-10|<tuple|5|434|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-3|<tuple|3|426|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-4|<tuple|3|426|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-5|<tuple|4|427|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-6|<tuple|5|428|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-7|<tuple|6|430|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-8|<tuple|7|430|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-9|<tuple|5|434|../../.TeXmacs/texts/scratch/no_name_26.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The
      Riccati differential equation> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>The
      approximating sum> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Preliminary
      lemmas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Convergence
      of sums of Bessel functions to a given function>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Existence
      and uniqueness of minimizing sums> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>The
      approximate solution of Riccati's equation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Conclusion>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|References
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>
    </associate>
  </collection>
</auxiliary>