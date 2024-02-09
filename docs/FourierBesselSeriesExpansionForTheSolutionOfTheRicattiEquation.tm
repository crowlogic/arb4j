<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|boring-white|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Approximate Solution of Riccati's
  Equation>|<doc-author|<author-data|<author-name|F. MAX STEINT and R. G.
  HUFFSTUTLER>|<\author-affiliation>
    <date|1966>
  </author-affiliation>>>>

  <section|Introduction>

  Bessel functions of the zeroth order possess the property that their
  derivatives give Bessel functions of the first order; i.e.,

  <\equation>
    <wide|J|\<dot\>><rsub|0><around|(|x|)>=-J<rsub|1><around|(|x|)>
  </equation>

  In this paper we make use of this fact in approximating the solution of the
  nonlinear differential equation, the Riccati equation,

  <\equation>
    L<around|(|y|)>=<wide|y|\<dot\>><around*|(|x|)>-P<around|(|x|)>*y<around*|(|x|)>-Q<around|(|x|)>*y<around*|(|x|)><rsup|2>=R<around|(|x|)>
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

  <\equation*>
    <around|\||f<around|(|x|)>-Q<rsub|n><around|(|x|)>|\|>=<sqrt|O<around*|(|<frac|1|\<lambda\><rsub|n>>|)>>
  </equation*>

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

  <\equation*>
    <around|\||f<around|(|x|)>-R<rsub|n><around|(|x|)>|\|>=<around*|\||<big|int><rsub|0><rsup|x><around*|[|f<rprime|'><around|(|t|)>-Q<rsub|n><around|(|t|)>|]>*<space|0.17em>d*t|\|>=<around|(|1-0|)><sqrt|O<around*|(|<frac|1|\<lambda\><rsub|n>>|)>>
  </equation*>

  and

  <\equation*>
    <around|\||f<rprime|'><around|(|x|)>-R<rsub|n><rprime|'><around|(|x|)>|\|>=<frac|<sqrt|O<around*|(|<frac|1|\<lambda\><rsub|n>>|)>>|<sqrt|\<lambda\><rsub|n>>><rsup|>,
  </equation*>

  since <math|R<rsub|n><rprime|'><around|(|x|)>=Q<rsub|n><around|(|x|)>> from
  (11). From these two equations we see that <math|f<around|(|x|)>> can be
  uniformly approximated by a sum of zeroth order Bessel functions such that
  <math|f<around|(|x|)>> is, at the same time, uniformly approximated by the
  derivative of this sum, and the theorem is proved.
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
    <associate|auto-2|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-3|<tuple|3|1|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-4|<tuple|3|426|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-5|<tuple|4|427|../../.TeXmacs/texts/scratch/no_name_26.tm>>
    <associate|auto-6|<tuple|5|427|../../.TeXmacs/texts/scratch/no_name_26.tm>>
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
    </associate>
  </collection>
</auxiliary>