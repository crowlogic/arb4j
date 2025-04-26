<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|On a Class of Asymptotically Stationary Harmonizable
  Processes>|<doc-author|<author-data|<author-name|Dominique
  Dehay>|<\author-affiliation>
    Laboratoire de Statistique et Probabilités (M.2), Université des Sciences
    et Techniques de Lille Flandres Artois Cité Scientifique,
    59655-Villeneuve D'Ascq Cedex, France

    Communicated by P. R. Krishnaiah
  </author-affiliation>>>|<doc-date|>>

  <abstract-data|<\abstract>
    We prove that every harmonizable process with <math|\<sigma\>>-finite
    bimeasure is asymptotically stationary and we give its associated
    spectral measure. \<copyright\> 1987 Academic Press, Inc.
  </abstract>>

  <section*|I. Introduction>

  For stochastic processes, various extensions of the notion of stationarity
  have been developed such as asymptotic stationarity and harmonizability,
  which are related notions. For example, Rozanov [12] established that every
  strongly harmonizable process is asymptotically stationary.

  In Section 2, we introduce a larger class of asymptotically stationary
  harmonizable processes, i.e., harmonizable processes which have
  <math|\<sigma\>>-finite bimeasure, and we prove that they are uniform
  limits of a sequence of strongly harmonizable ones.

  In Section 3, we show that these processes are indeed asymptotically
  stationary, and we exhibit the associated spectral measure using a
  stationary dilation of the harmonizable process under consideration [10].

  <with|font-size|0.84|<no-indent>Received August 11, 1986; revised January
  2, 1987.<next-line>AMS 1980 subject classifications:
  <math|60<math-up|G>10,60<math-up|G>12>.<next-line>Key words and phrases:
  harmonizable processes, asymptotic stationarity, spectral measures. >

  \ <vspace|baselineskip>

  <section*|5. Preliminaries>

  Following Rozanov [12] (see also [1,6]), a process
  <math|X:\<bbb-R\>\<rightarrow\>L<rsub|\<bbb-C\>><rsup|2><around|(|S,<with|math-font|cal*|F>,P|)>>
  is said to be asymptotically stationary if there exists a continuous
  function <math|r:\<bbb-R\>\<rightarrow\>\<bbb-C\>>, such that for any
  <math|h> in <math|\<bbb-R\>>

  <\equation>
    r<around|(|h|)>=lim<rsub|t\<rightarrow\>+\<infty\>>
    <frac|1|t>*<big|int><rsub|0><rsup|t>E*<around|(|X*<around|(|s+h|)>\<cdot\><wide|X<around|(|s|)>|\<bar\>>|)>*d*s
  </equation>

  In this case there exists a unique positive bounded measure <math|m> on
  <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>>, called the associated
  spectral measure of <math|X>, which verifies for any <math|h> in
  <math|\<bbb-R\>> :

  <\equation>
    r<around|(|h|)>=<big|int>e<rsup|i*h*u>*m*<around|(|d*u|)>
  </equation>

  We recall that every weakly harmonizable process
  <math|X:\<bbb-R\>\<rightarrow\>L<rsub|\<bbb-C\>><rsup|2><around|(|S,<with|math-font|cal*|F>,P|)>>
  is the Fourier transform of a stochastic measure
  <math|\<mu\>:<with|math-font|cal*|B><around|(|\<bbb-R\>|)>\<rightarrow\>L<rsub|\<bbb-C\>><rsup|2><around|(|S,<with|math-font|cal*|F>,P|)>[8>,
  11, 12], i.e., for any <math|t> in <math|\<bbb-R\>> :

  <\equation>
    X<around|(|t|)>=<big|int>e<rsup|i*t*u>*\<mu\>*<around|(|d*u|)>
  </equation>

  When the spectral bimeasure <math|M> of <math|X>, defined on
  <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>\<times\><with|math-font|cal*|B><around|(|\<bbb-R\>|)>>
  by <math|M<around|(|A,B|)>=E*<around|(|\<mu\><around|(|A|)>\<cdot\><wide|\<mu\><around|(|B|)>|\<bar\>>|)>>,
  is extendable to a measure on <math|<with|math-font|cal*|B><around*|(|\<bbb-R\><rsup|2>|)>>,
  the process is termed strongly harmonizable.

  In this paper we use the concept of integration with respect to a spectral
  bimeasure as introduced by Moché [8, Chap. IV]. Rozanov has proved that
  every strongly harmonizable process is asymptotically stationary and, more
  precisely, one can establish the following: [section]

  <\proposition>
    Let <math|X> be a strongly harmonizable process with spectral measure
    <math|M>, and let <math|\<Delta\>=<around|{|<around|(|u,v|)>\<mid\>u=v|}>>
    be the diagonal axis of <math|\<bbb-R\><rsup|2>>. Then uniformly with
    respect to <math|h> in <math|\<bbb-R\>>, we have:

    <\equation>
      lim<rsub|t\<rightarrow\>+\<infty\>>
      <frac|1|t>*<big|int><rsub|0><rsup|t>E*<around|(|X*<around|(|s+h|)>\<cdot\><wide|X<around|(|s|)>|\<bar\>>|)>*d*s=<big|iint><rsub|\<Delta\>>e<rsup|i*h*v>*M<around|(|d*u,d*v|)>
    </equation>
  </proposition>

  So in the weakly harmonizable case, one of the problems is: How can we
  define the restriction on the diagonal axis <math|\<Delta\>> of the
  bimeasure <math|M> as a measure on <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>>
  ? [section]

  <\definition>
    A spectral bimeasure <math|M> is said to be <math|\<sigma\>>-finite if
    there exists a sequence <math|<around*|(|B<rsub|n>|)><rsub|n\<in\>\<bbb-N\>>>
    in <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>> which verifies:

    <\enumerate>
      <item*|(1)>for any <math|n\<in\>\<bbb-N\>,B<rsub|n>\<subset\>B<rsub|n+1>>
      ; and <math|<big|cup><rsub|n\<in\>\<bbb-N\>>B<rsub|n>=\<bbb-R\>> ;

      <item*|(2)>for any <math|n,M> has finite Vitali variation on
      <math|B<rsub|n>\<times\>B<rsub|n>>.
    </enumerate>
  </definition>

  [section]

  <\example>
    (a) Obviously, the spectral bimeasure of every strongly harmonizable
    process is <math|\<sigma\>>-finite. (b) Here is an example of weakly
    harmonizable process which is not strongly harmonizable. It is due to
    Niemi [9] following Edwards [5] (see also [2]).

    Let us consider the positive definite family of real numbers defined by

    <\equation>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|c<rsub|j*j>=<frac|\<pi\>|2*j<around|(|log
      <around|(|j+1|)>|)><rsup|2>>,>|<cell|j\<in\>\<bbb-N\>\<setminus\><around|{|0|}>>>|<row|<cell|c<rsub|j*k>=<frac|sin
      <around|(|\<pi\>*<around|(|j-k|)>/2|)>|<around|(|j-k|)>*j<rsup|1/2>*k<rsup|1/2>*log
      <around|(|j+1|)>*log <around|(|k+1|)>>,>|<cell|j\<neq\>k;j,k\<in\>\<bbb-N\>\<setminus\><around|{|0|}>>>>>>
    </equation>

    Then there exist a probability space ( <math|S,<with|math-font|cal*|F>,P>
    ) and a sequence <math|<around*|(|x<rsub|j>|)>> in
    <math|L<rsub|\<bbb-R\>><rsup|2><around|(|S,<with|math-font|cal*|F>,P|)>>
    such that <math|E*<around*|(|x<rsub|j>\<cdot\>x<rsub|k>|)>=c<rsub|j*k>>.
    We can use this sequence to define a stochastic measure
    <math|\<mu\>:<with|math-font|cal*|B><around|(|\<bbb-R\>|)>\<rightarrow\>L<rsub|\<bbb-R\>><rsup|2><around|(|S,<with|math-font|cal*|F>,P|)>>
    by <math|\<mu\><around|(|B|)>=<big|sum><rsub|j\<in\>B>x<rsub|j>>, for
    every Borel set <math|B> of <math|\<bbb-R\>>.

    Since <math|<big|sum><rsub|j><big|sum><rsub|k><around*|\||c<rsub|j*k>|\|>=+\<infty\>>,
    the Vitali variation of <math|\<bbb-R\><rsup|2>> of its bimeasure
    <math|M> is infinite. Moreover, since <math|\<mu\>> is discrete, <math|M>
    is obviously <math|\<sigma\>>-finite. Therefore the Fourier transform of
    <math|\<mu\>> has a <math|\<sigma\>>-finite bimeasure but is not strongly
    harmonizable. So the class of harmonizable processes with
    <math|\<sigma\>>-finite bimeasure contains strictly the class of strongly
    harmonizable ones.
  </example>

  <paragraph|2.4. Notations.> Throughout the sequel, we consider a weakly
  harmonizable process <math|X> with <math|\<sigma\>>-finite bimeasure
  <math|M>, and spectral stochastic measure <math|\<mu\>>.

  Let <math|<around*|(|B<rsub|n>|)><rsub|n\<in\>\<bbb-N\>>> be a sequence in
  <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>> which satisfies (1)
  and (2) and for any <math|n> let <math|\<mu\><rsub|n>> be the stochastic
  measure on <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>> defined by
  <math|\<mu\><rsub|n><around|(|B|)>=\<mu\>*<around*|(|B\<cap\>B<rsub|n>|)>>,
  <math|M<rsub|n>> be its spectral bimeasure which is of finite Vitali
  variation on <math|\<bbb-R\><rsup|2>>, and <math|X<rsub|n>> be the
  associated strongly harmonizable process.... Niemi [9, Theorem 3.41] has
  proved that, for any weakly harmonizable process <math|X>, there exists a
  sequence of strongly harmonizable processes which converges in q.m. to
  <math|X> uniformly on every compact subset of <math|\<bbb-R\>>. Recently,
  Moche and the author [3] showed that this property remains true if the
  process <math|X> is only continuous and bounded. Here we obtain another
  sharpening of Niemi's result.

  <assign|proposition-nr|4>

  <\proposition>
    For every harmonizable process <math|X> with <math|\<sigma\>>-finite
    bimeasure, there exists a bounded sequence of strongly harmonizable
    processes which converges in q.m. towards <math|X> uniformly on
    <math|\<bbb-R\>>.
  </proposition>

  <\proof>
    With the previous notations, let <math|B<rsub|n><rprime|'>=\<bbb-R\>\<setminus\>B<rsub|n>>
    and let <math|<around|\<\|\|\>|\<mu\>|\<\|\|\>>> be the semi-variation of
    the stochastic measure <math|\<mu\>>, [4, Definition IV.10.3]; from [4,
    Theorem IV.10.8] we estimate for every <math|t> :

    <\equation>
      <tabular|<tformat|<table|<row|<cell|E<around*|[|<around*|\||X<rsub|n><around|(|t|)>|\|><rsup|2>|]>>|<cell|\<leqslant\><around*|(|<around|\<\|\|\>|\<mu\>|\<\|\|\>><around*|(|B<rsub|n>|)>|)><rsup|2>>>|<row|<cell|>|<cell|\<leqslant\><around|(|<around|\<\|\|\>|\<mu\>|\<\|\|\>><around|(|\<bbb-R\>|)>|)><rsup|2><next-line>E<around*|[|<around*|\||X<around|(|t|)>-X<rsub|n><around|(|t|)>|\|><rsup|2>|]>>>|<row|<cell|>|<cell|=E<around*|(|<around*|\||<big|int><rsub|B<rsub|n><rprime|'>>e<rsup|i*t*u>*\<mu\>*<around|(|d*u|)>|\|><rsup|2>|)>>>|<row|<cell|>|<cell|\<leqslant\><around*|(|<around|\<\|\|\>|\<mu\>|\<\|\|\>><around*|(|B<rsub|n><rprime|'>|)>|)><rsup|2>>>>>>
    </equation>

    Since the sequence ( <math|<around*|\<nobracket\>|B<rsub|n><rprime|'>|)><rsub|n\<in\>\<bbb-N\>>>
    decreases towards the empty set as <math|n> tends to infinity, then
    <math|<around|\<\|\|\>|\<mu\>|\<\|\|\>><around*|(|B<rsub|n><rprime|'>|)>>
    converges towards 0 [4; Lemma IV.10.5] and we can conclude that the
    bounded sequence <math|<around*|(|X<rsub|n>|)><rsub|n\<in\>\<bbb-N\>>>
    converges towards <math|X> in <math|L<rsub|\<bbb-C\>><rsup|2><around|(|S,<with|math-font|cal*|F>,P|)>>
    uniformly with respect to <math|t> on <math|\<bbb-R\>>.
  </proof>

  <section*|3. Main Result>

  [section]

  <\theorem>
    Every harmonizable process with <math|\<sigma\>>-finite bimeasure is
    asymptotically stationary.
  </theorem>

  <\proof>
    One can easily obtain that if a bounded sequence of asymptotically
    stationary processes ( <math|X<rsub|n><around|(|t|)>,t\<in\>\<bbb-R\>> )
    converges in q.m. towards a process <math|<around|(|X<around|(|t|)>,t\<in\>\<bbb-R\>|)>>
    uniformly with respect to <math|t> in <math|\<bbb-R\>>, then the process
    <math|<around|(|X<around|(|t|)>,t\<in\>\<bbb-R\>|)>> is asymptotically
    stationary. One can conclude using Proposition 2.5.

    Now with a quite different proof, we are going to sharpen the previous
    result and to estimate the associated spectral measure of the
    harmonizable process under consideration.
  </proof>

  <\theorem>
    For any harmonizable process with <math|\<sigma\>>-finite bimeasure,
    uniformly with respect to <math|h> in <math|\<bbb-R\>>, we have

    <\equation*>
      lim<rsub|t\<rightarrow\>+\<infty\>>
      <frac|1|t>*<big|int><rsub|0><rsup|t>E*<around|(|X*<around|(|s+h|)>\<cdot\><wide|X<around|(|s|)>|\<bar\>>|)>*d*s=<big|int>e<rsup|i*h*u>*m*<around|(|d*u|)>,
    </equation*>

    where the positive bounded measure <math|m> on
    <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>> is defined by:

    <\equation*>
      m<around|(|B|)>=lim<rsub|n\<rightarrow\>+\<infty\>>
      M<rsub|n>*<around|(|<around|(|B\<times\>B|)>\<cap\>\<Delta\>|)>\<forall\>B<text|\<in\>><with|math-font|cal*|B><around|(|\<bbb-R\>|)>
    </equation*>
  </theorem>

  <\proof>
    With Notations 2.4, let <math|>

    <\equation>
      K<around|(|t,s|)>=E*<around|(|X<around|(|t|)>\<cdot\><wide|X<around|(|s|)>|\<bar\>>|)>
    </equation>

    \ and\ 

    <\equation>
      K<rsub|n><around|(|t,s|)>=E*<around*|(|X<rsub|n><around|(|t|)>\<cdot\><wide|X<rsub|n><around|(|s|)>|\<bar\>>|)>
    </equation>

    <\equation*>
      \;
    </equation*>

    (a) From Proposition 2.5, the sequence <math|K<rsub|n><around|(|t,s|)>>
    converges towards <math|K<around|(|t,s|)>> uniformly with respect to
    <math|<around|(|t,s|)>> in <math|\<bbb-R\><rsup|2>>. So, given
    <math|\<varepsilon\>\<gtr\>0>, there exists
    <math|N<around|(|\<varepsilon\>|)>> such that for
    <math|n\<gtr\>N<around|(|\<varepsilon\>|)>> and for every
    <math|t\<gtr\>0> and every <math|h> we have

    <\equation>
      <label|eq:a1><around*|\||<frac|1|t>*<big|int><rsub|0><rsup|t>K<around|(|s+h,s|)>*d*s-<frac|1|t>*<big|int><rsub|0><rsup|t>K<rsub|n><around|(|s+h,s|)>*d*s|\|>\<less\>\<varepsilon\>
    </equation>

    Using the same notation for the spectral bimeasure <math|M<rsub|n>> and
    its extension as a measure on <math|<with|math-font|cal*|B><around*|(|\<bbb-R\><rsup|2>|)>>,
    we deduce from Proposition 2.1 that for every <math|n>, there exists
    <math|T<around|(|n,\<varepsilon\>|)>> such that for
    <math|t\<gtr\>T<around|(|n,\<varepsilon\>|)>> and for every <math|h> one
    has:

    <\equation>
      <label|eq:a2><around*|\||<frac|1|t>*<big|int><rsub|0><rsup|t>K<rsub|n><around|(|s+h,s|)>*d*s-<big|iint><rsub|\<Delta\>>e<rsup|i*u*h>*M<rsub|n><around|(|d*u,d*v|)>|\|>\<less\>\<varepsilon\>
    </equation>

    Consequently for <math|n\<gtr\>N<around|(|\<varepsilon\>|)>,t\<gtr\>T<around|(|n,\<varepsilon\>|)>>
    and for every <math|h> we obtain:

    <\equation>
      <label|eq:a3><around*|\||<frac|1|t>*<big|int><rsub|0><rsup|t>K<around|(|s+h,s|)>*d*s-<big|iint><rsub|\<Delta\>>e<rsup|i*u*h>*M<rsub|n><around|(|d*u,d*v|)>|\|>\<less\>2*\<varepsilon\>
    </equation>

    (b) We are going to prove that the sequence
    <math|<around*|(|m<rsub|n>|)>> of the restrictions on <math|\<Delta\>> of
    the spectral measures ( <math|M<rsub|n>> ) is convergent.

    First of all, <math|<around*|(|m<rsub|n>|)>> is increasing since for any
    <math|B> in <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>>

    <\equation>
      m<rsub|n><around|(|B|)>=M<rsub|n>*<around|(|<around|(|B\<times\>B|)>\<cap\>\<Delta\>|)>=M*<around|(|<around|(|B\<cap\>B<rsub|n>|)>\<times\><around|(|B\<cap\>B<rsub|n>|)>\<cap\>\<Delta\>|)>
    </equation>

    Let's re-evaluate the original text's argument:
    <math|m<rsub|n><around|(|B|)>=M<rsub|n>*<around|(|<around|(|B\<times\>B|)>\<cap\>\<Delta\>|)>>
    and <math|m<rsub|n+1><around|(|B|)>=M<rsub|n+1>*<around|(|<around|(|B\<times\>B|)>\<cap\>\<Delta\>|)>>.
    Since <math|M<rsub|n><around|(|A,C|)>=M<around|(|<around|(|A\<cap\>B<rsub|n>|)>,<around|(|C\<cap\>B<rsub|n>|)>|)>>
    and <math|M<rsub|n+1><around|(|A,C|)>=M<around|(|<around|(|A\<cap\>B<rsub|n+1>|)>,<around|(|C\<cap\>B<rsub|n+1>|)>|)>>.
    Also <math|B<rsub|n>\<subset\>B<rsub|n+1>>. The measure <math|M>
    restricted to the diagonal is positive. Let <math|m<rsub|d*i*a*g>> be the
    measure <math|M> restricted to the diagonal <math|\<Delta\>>. Then
    <math|m<rsub|n><around|(|B|)>=m<rsub|d*i*a*g>*<around|(|B\<cap\>B<rsub|n>|)>>
    and <math|m<rsub|n+1><around|(|B|)>=m<rsub|d*i*a*g>*<around|(|B\<cap\>B<rsub|n+1>|)>>.
    Since <math|B<rsub|n>\<subset\>B<rsub|n+1>>,
    <math|B\<cap\>B<rsub|n>\<subset\>B\<cap\>B<rsub|n+1>>. Since
    <math|m<rsub|d*i*a*g>> is a positive measure,
    <math|m<rsub|d*i*a*g>*<around|(|B\<cap\>B<rsub|n>|)>\<leq\>m<rsub|d*i*a*g>*<around|(|B\<cap\>B<rsub|n+1>|)>>,
    hence <math|m<rsub|n><around|(|B|)>\<leq\>m<rsub|n+1><around|(|B|)>>.

    <\equation>
      m<rsub|n><around|(|B|)>\<leqslant\>m<rsub|n+1><around|(|B|)>
    </equation>

    The only difficulty is to show that this sequence is bounded. Now Miamee
    and Salehi [7: Domination lemma] have proved that for every spectral
    bimeasure <math|M> on <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>\<times\><with|math-font|cal*|B><around|(|\<bbb-R\>|)>>,
    there exists a positive bounded measure <math|m<rsub|d>> on
    <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>> such that for any
    bounded Borel function <math|f:\<bbb-R\>\<rightarrow\>\<bbb-C\>> one has:

    <\equation>
      0\<leqslant\><big|iint>f<around|(|t|)><wide|f<around|(|s|)>|\<bar\>>M<around|(|d*t,d*s|)>\<leqslant\><big|int><around|\||f<around|(|t|)>|\|><rsup|2>*m<rsub|d>*<around|(|d*t|)>
    </equation>

    So, for any Borel set <math|B> in <math|\<bbb-R\>> we have:

    <\equation>
      0\<leqslant\>M<around|(|B,B|)>\<leqslant\>m<rsub|d><around|(|B|)>
    </equation>

    Let us put <math|,r=\<cdots\>-1,0,1,\<ldots\>>

    <\equation>
      I<rsub|q><rsup|r>=<around*|(|<frac|r|2<rsup|q>>,<frac|r+1|2<rsup|q>>|]>
    </equation>

    \ and <math|q=0,1,\<ldots\>>. Then, for any <math|q>, the sets
    <math|I<rsub|q><rsup|r>,r\<in\>\<bbb-Z\>>, form a partition of
    <math|\<bbb-R\>>, and the sequence <math|S<rsub|q>=<big|cup><rsub|r=-\<infty\>><rsup|+\<infty\>>I<rsub|q><rsup|r>\<times\>I<rsub|q><rsup|r>>
    decreases towards the diagonal axis <math|\<Delta\>>, as <math|q> becomes
    infinite.... Given <math|B> in <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>,n>,
    and <math|q>, then the measure <math|M<rsub|n>> verifies:

    <\equation>
      <tabular|<tformat|<table|<row|<cell|0>|<cell|\<leqslant\>M<rsub|n><around*|(|<big|cup><rsub|r=-\<infty\>><rsup|+\<infty\>><around*|(|B\<cap\>I<rsub|q><rsup|r>|)>\<times\><around*|(|B\<cap\>I<rsub|q><rsup|r>|)>|)>>>|<row|<cell|>|<cell|=<big|sum><rsub|r=-\<infty\>><rsup|+\<infty\>>M*<around*|(|<around*|(|B\<cap\>I<rsub|q><rsup|r>\<cap\>B<rsub|n>|)>\<times\><around*|(|B\<cap\>I<rsub|q><rsup|r>\<cap\>B<rsub|n>|)>|)>>>|<row|<cell|>|<cell|\<leqslant\><big|sum><rsub|r=-\<infty\>><rsup|+\<infty\>>m<rsub|d>*<around*|(|B\<cap\>I<rsub|q><rsup|r>\<cap\>B<rsub|n>|)>>>|<row|<cell|>|<cell|=m<rsub|d>*<around*|(|B\<cap\>B<rsub|n>|)>.>>>>>
    </equation>

    Hence, when <math|q> tends to infinity we obtain (taking the limit inside
    the sum requires justification, perhaps using properties of measures on
    product spaces, or the definition of <math|m<rsub|n>> as the diagonal
    restriction):

    <\equation>
      0\<leqslant\>m<rsub|n><around|(|B|)>\<leqslant\>m<rsub|d>*<around*|(|B\<cap\>B<rsub|n>|)>\<leqslant\>m<rsub|d><around|(|\<bbb-R\>|)>
    </equation>

    So, for every Borel set <math|B>, the increasing sequence
    <math|<around*|(|m<rsub|n><around|(|B|)>|)>> converges towards a positive
    number <math|m<around|(|B|)>>, and according to the Vitali-Hahn Saks
    theorem [4, Corollary III.7.3], <math|m> is a positive bounded measure on
    <math|<with|math-font|cal*|B><around|(|\<bbb-R\>|)>>. It is estimated for
    all <math|n> and <math|B> by

    <\equation*>
      m<rsub|n><around|(|B|)>\<leqslant\>m<around|(|B|)>\<leqslant\>m<rsub|d><around|(|B|)>\<leqslant\>m<rsub|d><around|(|\<bbb-R\>|)>\<less\>+\<infty\>*<space|1em><text|and
      ><space|1em>m*<around*|(|B\<cap\>B<rsub|n>|)>=m<rsub|n><around|(|B|)>
    </equation*>

    Moreover for any bounded Borel function <math|f> one has:

    <\equation>
      <text|<math|<tabular|<tformat|<cwith|1|-1|1|-1|font-base-size|9>|<table|<row|<cell|<around*|\||<big|int>f<around|(|u|)>*m<rsub|n>*<around|(|d*u|)>-<big|int>f<around|(|u|)>*m*<around|(|d*u|)>|\|>>|<cell|=<around*|\||<big|int>f<around|(|u|)>*m*<around|(|d*u|)>-<big|int>f<around|(|u|)>*m<rsub|n>*<around|(|d*u|)>|\|>>>|<row|<cell|>|<cell|=<around*|\||<big|int><rsub|B>f<around|(|u|)>*m*<around|(|d*u|)>-<big|int><rsub|B\<cap\>B<rsub|n>>f<around|(|u|)>*m*<around|(|d*u|)>|\|>>>|<row|<cell|>|<cell|=<around*|\||<big|int>f<around|(|u|)>*<around|(|m-m<rsub|n>|)>*<around|(|d*u|)>|\|>>>|<row|<cell|>|<cell|=<around*|\||<big|int><rsub|B<rsub|n><rsup|c>>f<around|(|u|)>*m*<around|(|d*u|)>|\|>*<space|1em><with|font-base-size|6|<around|(|<text|since
      >m<rsub|n><around|(|A|)>=m*<around|(|A\<cap\>B<rsub|n>|)>|)>>>>|<row|<cell|>|<cell|\<leqslant\><big|int><rsub|B<rsub|n><rsup|c>><around|\||f<around|(|u|)>|\|>*m*<around|(|d*u|)>>>|<row|<cell|>|<cell|\<leqslant\>m<around*|(|B<rsub|n><rprime|'>|)>\<cdot\>sup<rsub|u\<in\>\<bbb-R\>><around|(|<around|\||f<around|(|u|)>|\|>|)>>>>>>>>
    </equation>

    Since <math|m<around|(|B<rsub|n><rprime|'>|)>\<to\>0> as
    <math|n\<to\>\<infty\>> (because <math|m> is a finite measure and
    <math|B<rsub|n><rprime|'>*\<downarrow\>*\<emptyset\>>), the convergence
    <math|<big|int>f*d*m<rsub|n>\<to\><big|int>f*d*m> holds. Consequently,
    given <math|\<varepsilon\>\<gtr\>0>, there exists
    <math|N<rprime|'><around|(|\<varepsilon\>|)>> such that for
    <math|n\<gtr\>N<rprime|'><around|(|\<varepsilon\>|)>> and for every
    <math|h> (taking <math|f<around|(|u|)>=e<rsup|i*u*h>>):

    <\equation>
      <label|eq:b1><around*|\||<big|iint><rsub|\<Delta\>>e<rsup|i*u*h>*M<rsub|n><around|(|d*u,d*v|)>-<big|int>e<rsup|i*u*h>*m*<around|(|d*u|)>|\|>=<around*|\||<big|int>e<rsup|i*u*h>*m<rsub|n>*<around|(|d*u|)>-<big|int>e<rsup|i*u*h>*m*<around|(|d*u|)>|\|>\<less\>\<varepsilon\>
    </equation>

    (c) From the relations (<reference|eq:a3>) and (<reference|eq:b1>) we
    deduce that for any <math|\<varepsilon\>\<gtr\>0>, there exists
    <math|N=max <around|(|N<around|(|\<varepsilon\>|)>,N<rprime|'><around|(|\<varepsilon\>|)>|)>>
    and <math|T<around|(|\<varepsilon\>|)>=T<around|(|N,\<varepsilon\>|)>>
    such that for <math|t\<gtr\>T<around|(|\<varepsilon\>|)>> and for every
    <math|h> we have:

    <\equation>
      <tabular|<tformat|<cwith|1|-1|1|-1|font-base-size|8>|<table|<row|<cell|<around*|\||<frac|1|t>*<big|int><rsub|0><rsup|t>K<around|(|s+h,s|)>*d*s-<big|int>e<rsup|i*u*h>*m*<around|(|d*u|)>|\|>>|<cell|\<le\><around*|\||<frac|1|t>*<big|int><rsub|0><rsup|t>K<around|(|s+h,s|)>*d*s-<big|iint><rsub|\<Delta\>>e<rsup|i*u*h>*M<rsub|N><around|(|d*u,d*v|)>|\|>>>|<row|<cell|>|<cell|+<around*|\||<big|iint><rsub|\<Delta\>>e<rsup|i*u*h>*M<rsub|N><around|(|d*u,d*v|)>-<big|int>e<rsup|i*u*h>*m*<around|(|d*u|)>|\|>>>|<row|<cell|>|<cell|\<less\>2*\<varepsilon\>+\<varepsilon\>=3*\<varepsilon\>>>>>>
    </equation>

    as was to be shown.
  </proof>

  [section]

  <\remark>
    (a) There exist weakly harmonizable processes with
    non-<math|\<sigma\>>-finite spectral bimeasure. Indeed, Niemi gave an
    example of a discrete time weakly harmonizable process which is not
    asymptotically stationary (cf. [11, Sect. 6]). As Theorems 3.1 and 3.2
    still hold in the discrete time case, its spectral bimeasure is not
    <math|\<sigma\>>-finite. Consequently, <math|\<mu\>> denoting its
    spectral stochastic measure (defined on
    <math|<with|math-font|cal*|B><around|(|<around|[|-\<pi\>,\<pi\>|]>|)>> ),
    the spectral bimeasure of the (continuous time) weakly harmonizable
    process defined by

    <\equation>
      X<around|(|t|)>=<big|int>e<rsup|i*t*x>*\<mu\>*<around|(|d*x|)>\<forall\>t\<in\>\<bbb-R\>
    </equation>

    is not <math|\<sigma\>>-finite. We do not know if <math|X> is
    asymptotically stationary.

    More generally we do not know how to compare more precisely the class of
    weakly harmonizable processes and the class of asymptotically stationary
    processes. (b) So we have:

    <\equation*>
      <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<table|<row|<cell|<around|{|<text|stationary>|}>>|<cell|\<varsubsetneqq\>>|<cell|<around|{|<text|strongly
      harmonizable>|}>>>|<row|<cell|>|<cell|\<varsubsetneqq\>>|<cell|<around|{|<text|harmonizable
      with >\<sigma\><text|-finite bimeasure>|}>>>|<row|<cell|>|<cell|\<varsubsetneqq\>>|<cell|<around|{|<text|weakly
      harmonizable>|}>>>|<row|<cell|>|<cell|\<subset\>>|<cell|<around|{|<text|asymptotically
      stationary>|}>>>>>>
    </equation*>

    (Note: The layout in the original PDF is complex; this array attempts to
    capture the relationships shown.)
  </remark>

  <section*|Acknowledgments>

  I would like to thank Professor M. M. Rao and the referee as well as
  Professor R. Moché for their precious advice.

  <section*|References>

  <\enumerate>
    <item*|1>Blanc Lapierre, A., and Brard, R. (1949). Les fonctions
    aléatoires stationnaires et la loi des grands nombres. Bull. Soc. Math.
    France 74 102-105.

    <item*|2>Dehay, D. (1985). Quelques lois des grands nombres pour les
    processus harmonisables. Thèse U.E.R. Math., Université des Sciences et
    Techniques de Lille.

    <item*|3>Dehay, D., and MochE, R. (1986). Strongly harmonizable
    approximations of bounded continuous random fields. Stochastic Process.
    Appl. 23 327-331.

    <item*|4>Dunford, N., and Schwartz, J. T. (1957). Linear Operators, Part
    I, Interscience, New York.

    <item*|5>Edwards, D. A. (1955). Vector-valued measure and bounded
    variation in Hilbert space. Math. Scand. 3 90-96.

    <item*|6>Kampé de Fériet, J., and Frankiel, F. N. (1962). Correlation and
    spectra of nonstationary random functions. Math. Comp. 16 1-21.

    <item*|7>Miamee, A . G., and Salehi, H. (1978). Harmonizability,
    V-boundedness and stationary dilation of stochastic processes. Indiana
    Univ. Math. J. 27 37-50.

    <item*|8>Mocht, R. (1985). Introduction aux processus harmonisables.
    Lectures Notes, U.E.R. Math., Université des Sciences et Techniques de
    Lille.

    <item*|9>Niemi, H. (1975). Stochastic processes as Fourier transforms of
    stochastic measures. Ann. Acad. Sci. Fenn. Ser. A I Math. 591 1-47.

    <item*|10>Niemi, H. (1975). On stationary dilations and linear prediction
    of certain stochastic processes. Soc. Sci. Fenn. Comment. Phys.-Math. 45
    111-130.

    <item*|11>Rao, M. M. (1985). Harmonizable, Cramér, and Karhunen classes
    of processes. In Handbook of Statistics, Vol. 5, pp. 279-310. Elsevier,
    New York/Amsterdam.

    <item*|12>Rozanov, Yu. A. (1959). Spectral analysis of abstract
    functions. Theory Probab. Appl. 4 271-287.
  </enumerate>
</body>

<\initial>
  <\collection>
    <associate|magnification|1.2>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|1|3|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|6|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|22|7|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|22|8|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:a1|<tuple|9|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:a2|<tuple|10|4|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:a3|<tuple|11|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|eq:b1|<tuple|20|6|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|I.
      Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5.
      Preliminaries> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|3tab>|2.4. Notations.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.
      Main Result> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgments>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>