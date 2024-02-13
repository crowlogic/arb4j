<TeXmacs|2.1.1>

<style|<tuple|generic|alt-colors|parchment|framed-theorems>>

<\body>
  <doc-data|<doc-title|The Karhunen-Loeve Expansion and Mercers
  Theorem>|<doc-author|<author-data|<author-name|Stephen Crowley>>>>

  Let's recall the KL expansion from <cite-detail|stochasticFiniteElements|2.3.3>.4

  <section|Karhunen-Loeve Expansion>

  Differentiating equation (2.26) with respect to <math|h<around|(|x|)>> and
  setting the result equal to zero, gives

  <\equation>
    <frac|\<mathd\> F|\<mathd\>*h<around|(|x|)>>=<big|int><rsub|D><big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<around|(|x<rsub|1>|)>*d*x<rsub|1>-\<lambda\>*h<around|(|x<rsub|2>|)>*d*x<rsub|2>=0
  </equation>

  which is satisfied when

  <\equation>
    <big|int><rsub|D>R<rsub|w*w><around|(|x<rsub|1>,x<rsub|2>|)>*h<around|(|x<rsub|2>|)>*d*x<rsub|2>=\<lambda\>*h<around|(|x<rsub|1>|)>
  </equation>

  <subsection|Uniqueness of the Expansion>

  The random variables appearing in an expansion of the kind given by
  equation (2.10) and the orthogonality and orthonormal functions
  <math|<around|{|f<rsub|n><around|(|x|)>|}>> and the constants
  <math|<around|{|\<lambda\><rsub|n>|}>> are respectively the eigenfunctions
  and the eigenvalues of the covariance kernel as given by equation (2.8).

  The "if" part is an immediate consequence of equation (2.11). To show the
  "only if" part, equation (2.12) can be used with
  <math|<around|\<langle\>|\<xi\><rsub|n>,\<xi\><rsub|m>|\<rangle\>>=\<delta\><rsub|n*m>>
  to obtain

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|n=0><rsup|\<infty\>>\<lambda\><rsub|n>*f<rsub|n><around|(|x<rsub|1>|)>*f<rsub|n><around|(|x<rsub|2>|)>
  </equation>

  \;

  In addition to the mean-square error minimizing property the Karhunen-Loeve
  expansion has the minimum representation entropy out of all possible
  representations.\ 

  <subsection| Solving Integral Covariance Operator Eigenfunction Equations
  With The KL Expansion>

  The Karhunen-Loeve expansion is an instrumental part of solutions of the
  integral covariance operator eigenfunction equation\ 

  <\equation>
    <big|int><rsub|D>C<around|(|s,t|)>*f<rsub|n><around|(|t|)>*d*t=\<lambda\><rsub|n>*f<rsub|n><around|(|s|)>
  </equation>

  where <math|C<around|(|s,t|)>> is an autocovariance function and <math|n>
  is a non-negative integer. Equation (2.33) is a homogeneous Fredholm
  integral equation of the second kind. . Being an autocovariance function,
  the kernel <math|C<around|(|x<rsub|1>,x<rsub|2>|)>> is bounded, symmetric,
  and positive definite. This fact simplifies the ensuing analysis
  considerably by guaranteeing a number of properties for the eigenfunctions
  and the eigenvalues that are solutions to equation (2.33). Specifically:

  <\enumerate>
    <item>The set <math|<around|{|f<rsub|n><around|(|x|)>|}>> of
    eigenfunctions is orthogonal and complete.

    <item>For each eigenvalue <math|\<lambda\><rsub|n>>, there correspond at
    most a finite number of linearly independent eigenfunctions.

    <item>There are at most a countably infinite set of eigenvalues.

    <item>The eigenvalues are all positive real numbers.

    <item>The kernel <math|C<around|(|s,t|)>> admits the following uniformly
    convergent expansion:
  </enumerate>

  <\equation>
    C<around|(|x<rsub|1>,x<rsub|2>|)>=<big|sum><rsub|k=1><rsup|\<infty\>>\<lambda\><rsub|k>*f<rsub|k><around|(|s|)>*f<rsub|k><around|(|t|)>
  </equation>

  The Karhunen-Loeve expansion of a process was derived based on the
  preceding analytical properties of its covariance function. These
  properties are independent of the stochastic nature of the process
  involved, which allows the expansion to be applied to a wide range of
  processes including nonstationary and multidimensional processes.
  <cite-detail|stochasticFiniteElements|2.3.3>

  <section|Mercers Theorem>

  Let <math|<around|{|X<around|(|t|)>,t\<in\>\<bbb-R\>|}>> be a second order
  (scalar) process with mean function

  <\equation>
    m<around|(|t|)>=\<bbb-E\><around|[|X<around|(|t|)>|]>
  </equation>

  \ and a continuous covariance function

  <\equation>
    <around|(|s,t|)>\<mapsto\>r<around|(|s,t|)>=\<bbb-E\>*<around|[|<around|(|X<around|(|s|)>-m<around|(|s|)>|)>*<around|(|X<around|(|t|)>-m<around|(|t|)>|)>|]>
  </equation>

  Then <math|r<around|(|s,t|)>> is positive definite, and if <math|r> is a
  (temporarily, assumed hereafter) continuous, by the classical Mercer
  theorem<cite-detail|functionalAnalysisRieszNagy|p.245> since

  <\equation>
    <big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>><around|\||r<around|(|s,t|)>|\|><rsup|2>*d*s*d*t\<less\>\<infty\>
  </equation>

  it can be represented by a uniformly convergent series: ('bar' for complex
  conjugate)

  <\equation>
    r<around|(|s,t|)>=<big|sum><rsub|i=1><rsup|\<infty\>><frac|\<phi\><rsub|i><around|(|s|)><wide|\<phi\><rsub|i><around|(|t|)>|\<bar\>>|\<lambda\><rsub|i>>\<forall\>\<lambda\><rsub|i>\<gtr\>0
  </equation>

  where the <math|\<phi\><rsub|i><around|(|\<cdummy\>|)>> are continuous
  functions satisfying the integral equation

  <\equation>
    \<phi\><rsub|i><around|(|t|)>=\<lambda\>*<big|int><rsub|\<bbb-R\>>r<around|(|s,t|)>*\<phi\><rsub|i><around|(|s|)>*d*s
  </equation>

  and <math|<big|sum><rsub|i=1><rsup|\<infty\>><frac|1|\<lambda\><rsub|i>>\<less\>\<infty\>>.
  Here the <math|\<lambda\><rsub|i>> are the eigenvalues (counted according
  to their multiplicity) and <math|\<phi\><rsub|i>> are the corresponding
  eigenfunctions of the "kernel" <math|r>, and
  <math|<around|{|\<phi\><rsub|n>,n\<geq\>1|}>> forms a complete orthonormal
  set in the Lebesgue space <math|L<rsup|2><around|(|\<bbb-R\>|)>>, with
  Lebesgue measure, satisfying (15). This classical result and its relation
  to the Hilbert-Schmidt theory of symmetric kernels is nicely treated in the
  above reference, and their properties are needed here. First we consider
  the case that <math|\<bbb-E\><around|[|X<around|(|t|)>|]>=m<around|(|t|)>=0>
  so that the <math|X<around|(|t|)>> are centered. Now define the random
  variables

  <\equation>
    \<xi\><rsub|n>=<sqrt|\<lambda\><rsub|n>>*<big|int><rsub|\<bbb-R\>>X<around|(|t|)><wide|\<phi\><rsub|n><around|(|t|)>|\<bar\>>d*t\<forall\>n\<geq\>1
  </equation>

  where the integral is obtained using Fubini's theorem, since
  <math|X<around|(|t,\<omega\>|)>> is jointly measurable
  (<math|r<around|(|\<cdummy\>,\<cdummy\>|)>> being jointly continuous) in
  <math|<around|(|t,\<omega\>|)>>. [Alternatively it may be regarded as a
  Bochner integral.] In any case, we get

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<bbb-E\>*<around|[|\<xi\><rsub|n>*\<xi\><rsub|m>|]>>|<cell|=<sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|m>>*<big|int><rsub|\<bbb-R\>><big|int><rsub|\<bbb-R\>>\<bbb-E\>*<around|[|X<around|(|s|)>*X<around|(|t|)>|]><wide|\<phi\><rsub|n><around|(|s|)>|\<bar\>>\<phi\><rsub|m><around|(|t|)>*d*s*d*t>>|<row|<cell|>|<cell|=<sqrt|\<lambda\><rsub|n>*\<lambda\><rsub|m>><big|iint><rsub|\<bbb-R\><rsup|2>>r<around|(|s,t|)><wide|\<phi\><rsub|n><around|(|s|)>|\<bar\>>\<phi\><rsub|m><around|(|t|)>*d*s*d*t>>|<row|<cell|>|<cell|=<frac|\<delta\><rsub|n*m>|<sqrt|\<lambda\><rsub|m>>>*<big|int><rsub|\<bbb-R\>><wide|\<phi\><rsub|n><around|(|t|)>|\<bar\>>\<phi\><rsub|m><around|(|t|)>*d*t>>>>>
  </equation>

  \;

  It follows (on expanding inner products) that
  <math|X<rsub|n><around|(|t|)>=<big|sum><rsub|k=1><rsup|\<infty\>>\<xi\><rsub|k>*\<phi\><rsub|k><around|(|t|)>/<sqrt|\<lambda\><rsub|k>>\<rightarrow\>X<around|(|t|)>>
  in <math|L<rsup|2><around|(|P|)>>, by (14), where
  <math|X<around|(|t|)>=<big|sum><rsub|n=1><rsup|\<infty\>>\<xi\><rsub|n>*\<phi\><rsub|n><around|(|t|)>/<sqrt|\<lambda\><rsub|n>>>,
  and conversely if <math|X<around|(|t|)>> is given by this series,
  converging in mean, then <math|E*<around|(|X<around|(|s|)>*X<around|(|t|)>|)>=lim<rsub|n\<rightarrow\>\<infty\>>
  <big|sum><rsub|i=1><rsup|n>\<xi\><rsub|i><wide|\<xi\><rsub|i>|\<bar\>>\<phi\><rsub|i><around|(|s|)>*\<phi\><rsub|i><around|(|t|)>/\<lambda\><rsub|i>>
  holds. If <math|E<around|(|X<around|(|t|)>|)>=m<around|(|t|)>\<neq\>0>,
  then the above argument applied to <math|Y<around|(|t|)>=X<around|(|t|)>-m<around|(|t|)>>
  establishes the following classical Karhunen-Lo√\Dve representation:

  <with|font-series|bold|Proposition.> If
  <math|<around|{|X<around|(|t|)>,t\<in\>I|}>> is a second order process with
  <math|E<around|(|X<around|(|t|)>|)>=m<around|(|t|)>>, and a continuous
  covariance function <math|r<around|(|\<cdummy\>,\<cdummy\>|)>> on a compact
  interval <math|I>, then

  <\equation>
    X<around|(|t|)>=m<around|(|t|)>+<big|sum><rsub|n=1><rsup|\<infty\>>\<xi\><rsub|n>*<frac|\<phi\><rsub|n><around|(|t|)>|<sqrt|\<lambda\><rsub|n>>>\<forall\>t\<in\>I
  </equation>

  holds uniformly in <math|t>, and the convergence is in
  <math|L<rsup|2><around|(|P|)>> where the <math|\<lambda\><rsub|n>\<gtr\>0>
  and <math|\<phi\><rsub|n>> are the eigenvalues and the corresponding
  (complete orthonormal in <math|L<rsup|2><around|(|I|)>>) eigenfunctions of
  the kernel, satisfying (15), and hence the <math|\<xi\><rsub|n>> are
  orthonormal in <math|L<rsup|2><around|(|P|)>>, given by (16).
  <cite-detail|stochasticProcessInferenceTheory|<text-dots>>

  \;

  <\bibliography|bib|tm-plain|../../../a/docs/refs2>
    <\bib-list|3>
      <bibitem*|1><label|bib-stochasticFiniteElements>Roger<nbsp>G.<nbsp>Ghanem<localize|
      and >Pol<nbsp>D.<nbsp>Spanos. <newblock><with|font-shape|italic|Stochastic
      finite elements: a spectral approach>. <newblock>Springer-Verlag,
      Berlin, Heidelberg, 1991.<newblock>

      <bibitem*|2><label|bib-stochasticProcessInferenceTheory>Malempati<nbsp>M.<nbsp>Rao.
      <newblock><with|font-shape|italic|Stochastic Processes: Inference
      Theory>. <newblock>Springer Monographs in Mathematics. Springer,
      2nd<localize| edition>, 2014.<newblock>

      <bibitem*|3><label|bib-functionalAnalysisRieszNagy>Frigyes
      Riesz<localize| and >BÈla Sz.-Nagy.
      <newblock><with|font-shape|italic|Functional Analysis>. <newblock>Dover
      Books on Mathematics. Dover Publications, 2012.<newblock>
    </bib-list>
  </bibliography>
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
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|2|2>>
    <associate|auto-5|<tuple|13|4>>
    <associate|bib-functionalAnalysisRieszNagy|<tuple|3|4>>
    <associate|bib-stochasticFiniteElements|<tuple|1|4>>
    <associate|bib-stochasticProcessInferenceTheory|<tuple|2|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      stochasticFiniteElements

      stochasticFiniteElements

      functionalAnalysisRieszNagy

      stochasticProcessInferenceTheory
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Karhunen-Loeve
      Expansion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Uniqueness of the Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc> Solving Integral Covariance
      Operator Eigenfunction Equations With The KL Expansion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Mercers
      Theorem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>