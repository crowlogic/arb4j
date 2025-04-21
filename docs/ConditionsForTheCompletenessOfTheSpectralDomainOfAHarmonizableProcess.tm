<TeXmacs|2.1.4>

<style|<tuple|generic|framed-theorems>>

<\body>
  <doc-data|<doc-title|Conditions for the completeness of the spectral domain
  of a harmonizable process>|<doc-author|<author-data|<author-name|Roland
  Averkamp>|<author-note|Tel.: 49/761/203 5672; fax: 49/761/203
  5661>|<author-email|averkamp@pollux.mathematik.uni-freiburg.de>|<author-affiliation|Institut
  für Mathematische Stochastik, Albert-Ludwigs Universität Freiburg,
  Eckerstrasse 1, 79104 Freiburg, Germany>>>|<doc-date|Received 11 September
  1995; received in revised form 23 June 1997>>

  <abstract-data|<\abstract>
    We generalize a theorem of Köthe and Toeplitz on unconditional bases in
    Hilbert spaces to Hilbert space-valued measures. This leads to a
    necessary and sufficient condition for the completeness of the spectral
    domain of a weakly harmonizable process whose shift operator exists and
    is invertible. A process in this class has a complete spectral domain if
    and only if it is the image of a stationary process under a topological
    isomorphism. (C) 1997 Elsevier Science B.V.
  </abstract>>

  <no-indent>Keywords: Weakly harmonizable process; Bimeasure; Completeness
  of spectral domain; Shift operator

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1.
    Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2. A condition
    for the completeness of the spectral domain>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3. The shift
    operator condition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Acknowledgements>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|References>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <section*|1. Introduction>

  Let <math|L<rsub|0><rsup|2><around|(|P|)>> denote the zero mean square
  integrable functions on some probability space. The stochastic processes in
  this paper are either discrete time (<math|T=\<bbb-Z\>>) or continuous time
  <math|<around|(|T=\<bbb-R\>|)>> and they are subsets of
  <math|L<rsub|0><rsup|2><around|(|P|)>>. Let
  <math|<wide|T|^>=\<Pi\>\<assign\>\<bbb-R\>/2*\<pi\>*\<bbb-Z\>=<around|(|-\<pi\>,\<pi\>|]>>
  if <math|T=\<bbb-Z\>> and <math|<wide|T|^>=\<bbb-R\>> if
  <math|T=\<bbb-R\>>, and let <math|\<bbb-B\>> denote the Borel
  <math|\<sigma\>>-field of either <math|\<Pi\>> or <math|\<bbb-R\>>.

  Recall that a process <math|<around|(|X<rsub|t>|)><rsub|t\<in\>T>> is
  weakly stationary if its covariance function admits the representation

  <\equation>
    <math-up|Cov><around|(|X<rsub|s>,X<rsub|t>|)>=<big|int><rsub|<wide|T|^>>e<rsup|i*\<lambda\>*s><wide|e<rsup|i*\<lambda\>*t>|\<bar\>>\<mu\>*<around|(|d*\<lambda\>|)>,<space|1em>s,t\<in\>T
  </equation>

  where <math|\<mu\>> is a finite positive measure on <math|<wide|T|^>>. The
  time domain of a stationary process is isometrically isomorphic to its
  spectral domain <math|L<rsup|2><around|(|\<mu\>|)>> and prediction and
  filtering of the process can thus be carried out in the spectral domain
  using Fourier methods.

  Harmonizable processes are an extension which allow also for these Fourier
  methods. A stochastic process <math|<around|(|X<rsub|t>|)><rsub|t\<in\>T>>
  is called strongly harmonizable, if its covariance function admits the
  representation

  <\equation>
    <math-up|Cov><around|(|X<rsub|s>,X<rsub|t>|)>=<big|int><rsub|<wide|T|^>><big|int><rsub|<wide|T|^>>e<rsup|i*s*\<lambda\>><wide|e<rsup|i*t*\<lambda\><rprime|'>>|\<bar\>><space|0.27em>\<beta\><around|(|d*\<lambda\>,d*\<lambda\><rprime|'>|)>,<space|1em>\<forall\>s,t\<in\>T
  </equation>

  for some measure <math|\<beta\>> on <math|\<bbb-B\>\<otimes\>\<bbb-B\>>.
  These processes were introduced by Loève (1948) and Cramér (1951). An
  important example of strongly harmonizable processes are the periodically
  correlated discrete time processes (Hurd, 1989, 1991; Dehay, 1994). In this
  case, the mass of <math|\<beta\>> is concentrated on lines parallel to the
  diagonal <math|<around|{|<around|(|\<lambda\>,\<lambda\>|)>,\<lambda\>\<in\><wide|T|^>|}>>
  of <math|<wide|T|^>\<times\><wide|T|^>>. However, the class of strongly
  harmonizable processes is still not large enough for some applications. For
  example, it is not closed under linear transformations. A wider extension
  of stationary processes are the weakly harmonizable processes. These
  processes have the same covariance representation as strongly harmonizable
  processes, but the conditions on <math|\<beta\>> are relaxed.
  <math|\<beta\>> is not necessarily a measure, but can be a bimeasure (i.e.,
  <math|\<beta\>> is a mapping <math|\<beta\>:\<bbb-B\>\<times\>\<bbb-B\>\<to\>\<bbb-C\>>
  and <math|\<beta\><around|(|\<cdummy\>,A|)>,\<beta\><around|(|A,\<cdot\>|)>>
  are measures for all <math|A\<in\>\<bbb-B\>>), which is positive definite
  (i.e., <math|\<beta\><around|(|A,B|)>=<wide|\<beta\><around|(|B,A|)>|\<bar\>>>
  and <math|<big|sum><rsub|i,j>a<rsub|i>*\<beta\><around|(|A<rsub|i>,A<rsub|j>|)><wide|a<rsub|j>|\<bar\>>\<geq\>0>
  for all <math|A<rsub|i>\<in\>\<bbb-B\>,a<rsub|i>\<in\>\<bbb-C\>>).
  <math|\<beta\>> is called the spectral bimeasure of the process. The class
  of weakly harmonizable processes is closed under linear transformations.
  Indeed, another characterization of weakly harmonizability is that these
  processes are coordinatewise images of stationary processes under linear
  mappings (Niemi, 1975, 1977). In general, bimeasures cannot be extended to
  measures on <math|<wide|T|^>\<otimes\><wide|T|^>>, so the integral in (2)
  is not a Lebesgue integral, but a strict integral in the sense of Morse and
  Transue (Chang and Rao, 1986).

  Let <math|f,g:<wide|T|^>\<to\>\<bbb-C\>> be measurable and <math|\<beta\>>
  a bimeasure on <math|\<bbb-B\>\<times\>\<bbb-B\>>. <math|<around|(|f,g|)>>
  is strictly <math|\<beta\>>-integrable, if the following holds:

  <\itemize>
    <item*|(1)><math|f> is <math|\<beta\><around|(|\<cdummy\>,A|)>>-integrable,
    <math|g> is <math|\<beta\><around|(|A,\<cdot\>|)>>-integrable for all
    <math|A\<in\>\<bbb-B\>>. If this holds, then
    <math|\<beta\><rsub|1><rsup|E>:A\<mapsto\><big|int><rsub|E>f<around|(|x|)>*\<beta\><around|(|d*x,A|)>>
    and <math|\<beta\><rsub|2><rsup|F>:A\<mapsto\><big|int><rsub|F>g<around|(|y|)>*\<beta\><around|(|A,d*y|)>>
    are measures for all <math|E,F\<in\>\<Sigma\>> (Houdré, 1987, Lemma 2).

    <item*|(2)><math|f> is <math|\<beta\><rsub|2><rsup|F>>-integrable and
    <math|g> is <math|\<beta\><rsub|1><rsup|E>>-integrable for all
    <math|E,F\<in\>\<bbb-B\>>. One defines now
  </itemize>

  <\equation>
    <big|int><rsub|E><big|int><rsub|F><rsup|\<ast\>><around|(|f,g|)>*<space|0.17em>d*\<beta\>\<assign\><big|int><rsub|E>f<around|(|x|)>*<space|0.17em>\<beta\><rsub|2><rsup|F>*<around|(|d*x|)>=<big|int><rsub|F>g<around|(|y|)>*\<beta\><rsub|1><rsup|E>*<around|(|d*y|)>
  </equation>

  The equality of the integrals holds by Houdré (1987, Theorem 4). If
  <math|\<beta\>> is a measure on <math|\<bbb-B\>\<otimes\>\<bbb-B\>> and
  <math|f,g> are bounded then this integral is equal to the usual Lebesgue
  integral, i.e., <math|<big|int><rsub|E><big|int><rsub|F>f<around|(|x|)>*g<around|(|y|)>*\<beta\><around|(|d*x,d*y|)>>.

  For a positive-definite bimeasure <math|\<beta\>> define

  <\equation>
    <with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>\<assign\><around|{|f:<around|(|f,<wide|f|\<bar\>>|)>*<text|is
    strict >\<beta\><text|-integrable>|}>
  </equation>

  the spectral domain of <math|\<beta\>>. This is a pre-Hilbert space with
  the inner product <math|<around|(|f,g|)><rsub|\<beta\>>\<assign\><iint><rsup|\<ast\>><around|(|f,<wide|g|\<bar\>>|)>*<space|0.17em>d*\<beta\>>
  (cf. Chang and Rao, 1986).

  Now let <math|<around|(|X<rsub|t>|)><rsub|t\<in\>T>> be a weakly
  harmonizable process with spectral bimeasure <math|\<beta\>>. As for a
  stationary process, <math|<around|(|X<rsub|t>|)><rsub|t\<in\>T>> has an
  integral representation <math|X<rsub|t>=<big|int><rsub|<wide|T|^>>e<rsup|i*\<lambda\>*t>*Z*<around|(|d*\<lambda\>|)>>
  where <math|Z> is a stochastic measure (i.e.,
  <math|L<rsub|0><rsup|2><around|(|P|)>>-valued) and the integral is in the
  sense of Dunford-Schwartz (1960, IV.10). <math|Z> is called the stochastic
  spectral measure of <math|<around|(|X<rsub|t>|)><rsub|t\<in\>T>>. It is
  related to the spectral bimeasure by <math|\<beta\><around|(|A,B|)>=E*Z<around|(|A|)><wide|Z<around|(|B|)>|\<bar\>>>,
  <math|<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>=L<rsup|1><around|(|Z|)>>
  and

  <\equation>
    <math-up|Cov><around*|(|<big|int>f*<space|0.17em>d*Z,<big|int>g*<space|0.17em>d*Z|)>=<big|iint><rsup|\<ast\>><around|(|f,<wide|g|\<bar\>>|)>*<space|0.17em>d*\<beta\>
  </equation>

  (Chang and Rao, 1986). We then say that <math|\<beta\>> is induced by
  <math|Z>. Note that <math|<around|(|X<rsub|t>|)><rsub|t\<in\>T>> is
  stationary if <math|Z> is orthogonally scattered (i.e.,
  <math|A\<cap\>B=\<emptyset\>> then <math|Z<around|(|A|)>\<perp\>Z<around|(|B|)>>)
  or equivalently the mass of <math|\<beta\>> is concentrated on the
  diagonal, i.e., <math|\<beta\><around|(|A,B|)>=\<beta\>*<around|(|A\<cap\>B|)>>.

  It is well known that

  <\equation>
    H<rsub|Z>\<assign\><wide|<math-up|sp><around|{|Z<around|(|A|)>,A\<in\>\<bbb-B\>|}>|\<bar\>>=<wide|<math-up|sp><around*|{|<big|int><rsub|<wide|T|^>>e<rsup|i*t\<cdot\>>*d*Z,t\<in\>T|}>|\<bar\>>
  </equation>

  Indeed, stochastic measures on <math|<wide|T|^>> are regular (this follows
  from Dunford and Schwartz, 1960, IV.10.5) and hence the set of integrals of
  continuous functions is dense in <math|H<rsub|Z>>. The assertion now
  follows from the fact that continuous functions can be approximated
  uniformly on compact sets by trigonometric polynomials (Naimark, 1959, p.
  406, Corollary 4).

  As we have already seen, the mapping <math|V:<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>\<to\>H<rsub|Z>*<around*|(|=<wide|<math-up|sp><around|{|X<rsub|t>,t\<in\>T|}>|\<bar\>>|)>,f\<mapsto\><big|int>f*<space|0.17em>d*Z>
  is an isometry. It is easy to see that <math|V> is surjective if and only
  if <math|<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>>
  is complete. Thus, the spectral domain and the time domain of the process
  are isometrically isomorphic if and only if the spectral domain is
  complete.

  One of the reasons to introduce weakly harmonizable processes was to retain
  the powerful Fourier methods of the stationary processes, so that, for
  example, extrapolation and interpolation can be carried out in the spectral
  domain of the process, using again the methods of Fourier analysis. But the
  transition from the spectral domain to the time domain of a process can
  only be made in full generality if the spectral domain is complete. For
  example, Chang and Rao (1986) need this completeness to solve filter
  equations, and Houdré (1991) for obtaining autoregressive predictors. A
  solution to this problem might be to take the algebraic completion of the
  spectral domain. But the members of this space need not to be functions in
  the usual sense. Also the isometry to the time domain can no longer be
  described by the elegant integral representation of the process.

  Cramér, who defined the spectral domain, raised the problem of the
  completeness of this spectral domain: "the set
  <math|\<Lambda\><rsub|2><around|(|\<rho\>|)>> will have all the properties
  of Hilbert space, except possibly the completeness property" (Cramér,
  1951). In the 1980s, Rao et al. (Chang and Rao, 1986; Rao, 1989a, b;
  Mehlmann, 1991) came up with proofs for the completeness of the spectral
  domain, but these proofs worked only in special cases. Then in 1991, Miamee
  and Salehi were able to show that, in general,
  <math|<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>>
  is not complete (cf. Miamee and Salehi, 1991; Michálek and Rüschendorf,
  1994). In 1995, Miamee and Schröder (1995) gave conditions for the
  completeness of the spectral domain in certain cases (see also Michálek and
  Rüschendorf, 1994).

  In this work, we represent a necessary and sufficient condition for the
  completeness of the spectral domain for a broad class of weakly
  harmonizable processes. This result is not only of interest for
  harmonizable processes, but also in functional analysis, in fact we
  prove:<next-line>Let <math|Z> be a Hilbert space-valued measure such that
  <math|<big|int>f*<space|0.17em>d*Z=0> implies <math|f=0> <math|Z>-almost
  everywhere. Then <math|<around|{|<big|int>f*<space|0.17em>d*Z,f\<in\>L<rsup|1><around|(|Z|)>|}>>
  is complete if and only if there exists an orthogonally scattered measure
  <math|<wide|Z|^>> and an isomorphism <math|V> with
  <math|V<around|(|<wide|Z|^>|)>=Z>.

  The following result due to Rao (Rao, 1989, p. 605, Proposition 3.2) gives
  a sufficient condition for the completeness of the spectral domain of a
  weakly harmonizable process (with <math|T=\<bbb-R\>> or <math|\<bbb-Z\>>):
  Let <math|\<beta\>> be a positive-definite bimeasure on
  <math|\<bbb-B\>\<times\>\<bbb-B\>>. Then
  <math|<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>>
  is complete if there is a positive finite measure <math|\<mu\>> on
  <math|\<bbb-B\>> and a continuous linear mapping
  <math|W:L<rsup|2><around|(|\<mu\>|)>\<to\>L<rsup|2><around|(|\<mu\>|)>>
  with closed range such that <math|L<rsup|2><around|(|\<mu\>|)>\<subset\><with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>>
  and

  <\equation>
    <big|iint><rsup|\<ast\>><around|(|f,<wide|g|\<bar\>>|)>*<space|0.17em>d*\<beta\>=<big|int>W<around|(|f|)><wide|W<around|(|g|)>|\<bar\>><space|0.17em>d*\<mu\>,<space|1em>\<forall\>f,g\<in\>L<rsup|2><around|(|\<mu\>|)>
  </equation>

  There is always a finite measure <math|\<mu\>> and a linear continuous
  mapping from <math|L<rsup|2><around|(|\<mu\>|)>> to
  <math|L<rsup|2><around|(|\<mu\>|)>> such that (7) holds, but its range is
  not necessarily closed. This follows from the Grothendieck inequality (Rao,
  1989, Theorem 2). If <math|L<rsup|2><around|(|\<mu\>|)>=<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>>,
  the closed range condition is necessary. The closed range condition is
  clearly satisfied if there are constants <math|C,c\<gtr\>0> such that

  <\equation>
    C<around|\<\|\|\>|f|\<\|\|\>><rsub|\<mu\>,2>\<geq\><around|\<\|\|\>|f|\<\|\|\>><rsub|\<beta\>>\<geq\>c<around|\<\|\|\>|f|\<\|\|\>><rsub|\<mu\>,2>,<space|1em>\<forall\>f\<in\>L<rsup|2><around|(|\<mu\>|)>
  </equation>

  holds. This is the sufficient condition for the completeness of the
  spectral domain obtained by Truong-Van (1981) (Theorem 6, cf. also Michálek
  and Rüschendorf, 1994). In the next section we shall see that this
  condition is close to being necessary for completeness.

  Since the results of the next section do not depend on the structure of
  <math|\<bbb-R\>> or <math|\<Pi\>>, we will formulate and prove them for
  arbitrary measurable spaces. So let <math|<around|(|\<Omega\>,\<Sigma\>|)>>
  be a measurable space and <math|\<beta\>> a positive-definite bimeasure
  defined on <math|\<Sigma\>\<times\>\<Sigma\>>. <math|\<beta\>> is induced
  by the stochastic measure <math|Z>. Since the strict integral is not handy,
  we shall make use of (3) and use instead the Dunford-Schwartz integral for
  vector measures. By <math|<around|\<\|\|\>|Z|\<\|\|\>><around|(|\<cdummy\>|)>>,
  we will denote the semivariation of the stochastic measure <math|Z>
  (Dunford and Schwartz, 1960, IV.10.3). In this paper, we will use only the
  Hilbert space properties of <math|L<rsub|0><rsup|2><around|(|P|)>>. By
  <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>>> we refer to the norm of this
  space.

  The next theorem is crucial for the next section\ 

  <\theorem>
    Drewsnowski (1974a, p. 217, 3.10; 1974b, p. 799, Example 2.3.3).

    <\enumerate-alpha>
      <item><math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>> defined via
      <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|Z>\<assign\>sup<rsub|<around|\||g|\|>\<leq\><around|\||f|\|>><around*|\||<big|int>g*<space|0.17em>d*Z|\|>>,
      <math|f\<in\>L<rsup|1><around|(|Z|)>>, is a norm on
      <math|L<rsup|1><around|(|Z|)>>. This norm is equivalent to the norm

      <\equation>
        <around|\<lVert\>|<around|\||f|\|>|\<rVert\>>\<assign\>sup<rsub|A\<in\>\<Sigma\>><around*|\||<big|int><rsub|A>f*<space|0.17em>d*Z|\|>*<around*|(|\<geq\><frac|1|4><around|\<\|\|\>|f|\<\|\|\>><rsub|Z>|)>
      </equation>

      <item><math|<around|(|L<rsup|1><around|(|Z|)>,|\<\|\|\>>\<cdot\><around|\<\|\|\>|<rsub|Z>|)>>
      is a Banach space.

      <item>If <math|f<rsub|n>,f\<in\>L<rsup|1><around|(|Z|)>> for all
      <math|n\<in\>\<bbb-N\>> and <math|lim<rsub|n\<to\>\<infty\>><around|\<\|\|\>|f-f<rsub|n>|\<\|\|\>><rsub|Z>=0>,
      then <math|<around|(|f<rsub|n>|)><rsub|n\<in\>\<bbb-N\>>> converges to
      <math|f> in <math|Z>-measure (i.e.,
      <math|\<forall\>\<varepsilon\>\<gtr\>0>,
      <math|lim<rsub|n\<to\>\<infty\>><around|\<\|\|\>|Z|\<\|\|\>><around|(|<around|{|<around|\||f<rsub|n>-f|\|>\<gtr\>\<varepsilon\>|}>|)>=0>).
      Hence any subsequence of <math|<around|(|f<rsub|n>|)><rsub|n\<in\>\<bbb-N\>>>
      contains a subsequence converging <math|Z>-a.e. to <math|f>.
    </enumerate-alpha>
  </theorem>

  Note that <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|Z>=sup<rsub|<around|\||g|\|>\<leq\><around|\||f|\|>><around|\<\|\|\>|g|\<\|\|\>><rsub|\<beta\>>>!
  Finally, note that the simple functions are dense in
  <math|<around|(|L<rsup|1><around|(|Z|)>,|\<\|\|\>>\<cdot\><around|\<\|\|\>|<rsub|Z>|)>>.
  This follows from the results in Kwapien and Woycy«ski (1992, Proposition
  7.1.1, Definition 7.3.1).

  <section*|2. A condition for the completeness of the spectral domain>

  Miamee and Schröder (1995) obtained necessary conditions for the
  completeness of the spectral domain of a weakly harmonizable process. In
  particular, for the class of spectral bimeasures <math|\<beta\>> such that
  for some positive finite measure <math|\<mu\>>,
  <math|\<mu\><around|(|<around|{|f\<neq\>0|}>|)>=0> is equivalent to
  <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|\<beta\>>=0>. In this section we
  investigate the completeness of the spectral domain of a bimeasure
  <math|\<beta\>> such that <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>=0>
  is equivalent to <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>=0>,
  which is a weaker condition than the one studied by Miamee and Schröder.

  <\theorem>
    Let <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>=0> be
    equivalent to <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>=0>.
    Then the following statements are equivalent:

    <\enumerate>
      <item><math|<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>>
      is complete.

      <item>There exists a <math|K\<gtr\>0> such that for all
      <math|f\<in\>L<rsup|1><around|(|Z|)>>,

      <\equation>
        K<around|\<\|\|\>|f|\<\|\|\>><rsub|\<beta\>>\<geq\><around|\<\|\|\>|f|\<\|\|\>><rsub|Z>
      </equation>

      <item>There exists a positive finite measure <math|\<mu\>> and
      constants <math|c,C\<gtr\>0> such that
      <math|L<rsup|2><around|(|\<mu\>|)>=L<rsup|1><around|(|Z|)>(=<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>)>
      and

      <\equation>
        C<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<mu\>,2>\<geq\><around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>\<geq\>c<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<mu\>,2>
      </equation>
    </enumerate>
  </theorem>

  <em|Proof.> <math|<around|(|1|)>\<Rightarrow\><around|(|2|)>>: Note that
  <math|T:L<rsup|1><around|(|Z|)>\<to\><with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>,f\<mapsto\>f>,
  is a linear, one-to-one mapping and that
  <math|<around|(|L<rsup|1><around|(|Z|)>,|\<\|\|\>>\<cdot\><around|\<\|\|\>|<rsub|Z>|)>>
  and <math|<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>>
  are Banach spaces. This implies that <math|T> has a continuous linear
  inverse (Dunford and Schwartz, 1960, II.2.2). Consequently, there exists
  <math|K\<gtr\>0> satisfying <math|K<around|\<\|\|\>|f|\<\|\|\>><rsub|\<beta\>>\<geq\><around|\<\|\|\>|f|\<\|\|\>><rsub|Z>>
  for all <math|f\<in\>L<rsup|1><around|(|Z|)>>.

  <math|<around|(|2|)>\<Rightarrow\><around|(|1|)>>: Since
  <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|Z>\<geq\><around|\<\|\|\>|f|\<\|\|\>><rsub|\<beta\>>>,
  both norms are equivalent.

  <math|<around|(|3|)>\<Rightarrow\><around|(|2|)>>: It follows directly from
  the definition of <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>> that
  <math|C<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<mu\>,2>\<geq\><around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>>,
  hence <math|C/c<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>\<geq\><around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>>.

  <math|<around|(|2|)>\<Rightarrow\><around|(|3|)>>: We define
  <math|<around|\||f|\|><rsub|Z>\<assign\>inf<rsub|<around|\||h|\|>=<around|\||f|\|>><around|\<\|\|\>|<big|int>h*<space|0.17em>d*Z|\<\|\|\>>=inf<rsub|<around|\||h|\|>=<around|\||f|\|>><around|\<\|\|\>|h|\<\|\|\>><rsub|\<beta\>>>,
  and prove that <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z><rsup|2>>
  is superadditive while <math|<around|\||\<cdummy\>|\|><rsub|Z><rsup|2>> is
  subadditive: Indeed, let <math|f,g\<in\>L<rsup|1><around|(|Z|)>> and
  <math|f*g=0>. Then

  <\align>
    <tformat|<table|<row|<cell|<around|\<\|\|\>|f+g|\<\|\|\>><rsub|Z><rsup|2>>|<cell|=sup<rsub|<around|\||f<rprime|'>|\|>\<leq\><around|\||f|\|>,<around|\||g<rprime|'>|\|>\<leq\><around|\||g|\|>>
    sup<rsub|\<alpha\>\<in\>\<bbb-C\>,<around|\||\<alpha\>|\|>=1><around|(|\<alpha\>*f<rprime|'>,\<alpha\>*f<rprime|'>|)><rsub|\<beta\>>+<around|(|g<rprime|'>,g<rprime|'>|)><rsub|\<beta\>>+2<math-up|Re><around|(|\<alpha\>*f<rprime|'>,g<rprime|'>|)><rsub|\<beta\>><eq-number>>>|<row|<cell|>|<cell|\<geq\>sup<rsub|<around|\||f<rprime|'>|\|>\<leq\><around|\||f|\|>,<around|\||g<rprime|'>|\|>\<leq\><around|\||g|\|>><around|(|f<rprime|'>,f<rprime|'>|)><rsub|\<beta\>>+<around|(|g<rprime|'>,g<rprime|'>|)><rsub|\<beta\>><eq-number>>>|<row|<cell|>|<cell|=<around|\<\|\|\>|f|\<\|\|\>><rsub|Z><rsup|2>+<around|\<\|\|\>|g|\<\|\|\>><rsub|Z><rsup|2><eq-number>>>>>
  </align>

  In a similar way one shows <math|<around|\||f+g|\|><rsub|Z><rsup|2>\<leq\><around|\||f|\|><rsub|Z><rsup|2>+<around|\||g|\|><rsub|Z><rsup|2>>.

  Next, we prove that

  <\equation>
    \<mu\><around|(|A|)>\<assign\>sup <around*|{|<big|sum><rsub|i\<in\>I><around|\||1<rsub|A<rsub|i>>|\|><rsub|Z><rsup|2>;<around|(|A<rsub|i>|)><rsub|i\<in\>I>*<text|finite
    measurable partitions of >A|}>
  </equation>

  is a positive finite measure. The properties
  <math|\<mu\><around|(|\<emptyset\>|)>=0>, <math|\<mu\>\<geq\>0>, and the
  additivity follow readily from the definition of <math|\<mu\>>.

  Since <math|<around|\<\|\|\>|Z|\<\|\|\>><around|(|\<cdummy\>|)>> is
  continuous at the empty set (Dunford and Schwartz, 1960, IV.10.5) and
  <math|\<mu\><around|(|A|)>\<leq\><around|\<\|\|\>|1<rsub|A>|\<\|\|\>><rsub|Z><rsup|2>=<around|\<\|\|\>|Z|\<\|\|\>><around|(|A|)><rsup|2>>,
  we conclude that <math|\<mu\>> is also continuous. Thus <math|\<mu\>> is a
  measure.

  It is clear that <math|<around|\||1<rsub|A>|\|><rsub|Z><rsup|2>\<leq\>\<mu\><around|(|A|)>\<leq\><around|\<\|\|\>|1<rsub|A>|\<\|\|\>><rsub|Z><rsup|2>>
  for all <math|A\<in\>\<Sigma\>>. Let <math|f> be a simple function. From
  the last inequality, the subadditivity of
  <math|<around|\||\<cdummy\>|\|><rsub|Z><rsup|2>>, and the superadditivity
  of <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z><rsup|2>>, it follows
  that

  <\equation>
    <around|\||f|\|><rsub|Z><rsup|2>\<leq\><around|\<\|\|\>|f|\<\|\|\>><rsub|\<mu\>,2><rsup|2>\<leq\><around|\<\|\|\>|f|\<\|\|\>><rsub|Z><rsup|2>
  </equation>

  By the assumptions there exists a <math|K\<gtr\>0> such that
  <math|K<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>\<geq\><around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>>.
  Now let <math|f\<in\>L<rsup|1><around|(|Z|)>>; then

  <\equation>
    K<around|\||f|\|><rsub|Z>=K*inf<rsub|<around|\||g|\|>=<around|\||f|\|>><around|\<\|\|\>|g|\<\|\|\>><rsub|\<beta\>>\<geq\>inf<rsub|<around|\||g|\|>=<around|\||f|\|>><around|\<\|\|\>|g|\<\|\|\>><rsub|Z>=<around|\<\|\|\>|f|\<\|\|\>><rsub|Z>
  </equation>

  where the last equality holds since <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>>
  depends only on the modulus of a function. Thus
  <math|K<around|\||\<cdummy\>|\|><rsub|Z>\<geq\><around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>>.

  Hence, the norms <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<mu\>,2>>
  and <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>> are equivalent for
  the simple functions. Since <math|<around|(|L<rsup|1><around|(|Z|)>,|\<\|\|\>>\<cdot\><around|\<\|\|\>|<rsub|Z>|)>>
  and <math|L<rsup|2><around|(|\<mu\>|)>> are Banach spaces, since the simple
  functions are dense in both spaces and since the convergence in both spaces
  implies the almost everywhere convergence of some subsequence, the norms
  are equivalent for <math|L<rsup|1><around|(|Z|)>=L<rsup|2><around|(|\<mu\>|)>>.

  The equivalence of <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>>
  and <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>> implies the
  equivalence of <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>>
  and <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<mu\>,2>>.

  Let <math|\<beta\>,Z> and <math|\<mu\>> be as in the second condition of
  Theorem 1. Then there is (up to isometric isomorphism) a unique
  orthogonally scattered Hilbert space valued measure <math|<wide|Z|^>>
  satisfying <math|<around|\<\|\|\>|<wide|Z|^><around|(|A|)>|\<\|\|\>><rsup|2>=\<mu\><around|(|A|)>>,
  <math|L<rsup|1><around|(|<wide|Z|^>|)>=L<rsup|2><around|(|\<mu\>|)>> and

  <\equation>
    <around*|(|<big|int>f*<space|0.17em>d*<wide|Z|^>,<big|int>g*<space|0.17em>d*<wide|Z|^>|)>=<big|int>f*<wide|g|\<bar\>>*<space|0.17em>d*\<mu\>,<space|1em>\<forall\>f,g\<in\>L<rsup|2><around|(|\<mu\>|)>
  </equation>

  Take, for example, <math|<wide|Z|^><around|(|A|)>\<assign\>1<rsub|A>\<in\>L<rsup|2><around|(|\<mu\>|)>>.
  Since <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<mu\>,2>> and
  <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>> are equivalent,
  there is a continuous and continuously invertible linear map
  <math|V:H<rsub|<wide|Z|^>>\<to\>H<rsub|Z>> with
  <math|V\<circ\><wide|Z|^>=Z>.

  Now, let <math|<around|(|x<rsub|i>|)><rsub|i\<in\>\<bbb-N\>>> be a normed
  sequence in some Hilbert space, and let <math|Z> be the measure on
  <math|\<bbb-N\>> with <math|Z<around|(|<around|{|i|}>|)>=x<rsub|i>/i<rsup|2>,i\<in\>\<bbb-N\>>.
  It is easy to show that <math|<around|(|a<rsub|i>|)><rsub|i\<in\>\<bbb-N\>>\<in\>L<rsup|1><around|(|Z|)>>
  if and only if <math|<big|sum><rsub|i=1><rsup|\<infty\>>a<rsub|i>*x<rsub|i>*<around*|(|=<big|int><rsub|\<bbb-N\>>a*<space|0.17em>d*Z|)>>
  is unconditionally convergent. Hence, it is easy to see that Theorem 1 is a
  generalization of the theorem of Köthe and Toeplitz (Nikolskii, 1986, p.
  137), which states that if <math|<around|(|x<rsub|n>|)><rsub|n\<in\>\<bbb-N\>>>
  is a normed unconditional base of a Hilbert space, then there exist
  constants <math|c,C\<gtr\>0> such that

  <\equation>
    c*<big|sum><rsub|i=1><rsup|n><around|\||a<rsub|i>|\|><rsup|2>\<leq\><around*|\||<big|sum><rsub|i=1><rsup|n>a<rsub|i>*x<rsub|i>|\|><rsup|2>\<leq\>C*<big|sum><rsub|i=1><rsup|n><around|\||a<rsub|i>|\|><rsup|2>,<space|1em>a<rsub|i>\<in\>\<bbb-C\>,i=1,\<ldots\>,n\<in\>\<bbb-N\>
  </equation>

  In other words, any normed unconditional base of a separable Hilbert space
  is topologically isomorphic to some orthonormal base.

  <section*|3. The shift operator condition>

  We now turn to the question of finding under which conditions
  <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>=0> and
  <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>=0> are equivalent,
  where <math|\<beta\>> is the spectral bimeasure and <math|Z> the stochastic
  spectral measure of some weakly harmonizable process.

  The next theorem gives a necessary and sufficient condition for this
  equivalence.

  <\theorem>
    Let <math|<around|(|X<rsub|t>|)><rsub|t\<in\>\<bbb-Z\>>> be a weakly
    harmonizable process with spectral bimeasure <math|\<beta\>> and
    stochastic spectral measure <math|Z>.

    Then the following two statements are equivalent:

    <\enumerate>
      <item><math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>=0> is
      equivalent to <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|Z>=0>.

      <item>The shift operator <math|S:<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>\<to\><with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>>,
      <math|S<around|(|f|)>\<assign\>exp <around|(|i*\<cdummy\>|)>*f> is a
      well-defined invertible linear mapping, i.e.,
      <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|\<beta\>>=0\<Leftrightarrow\>\<\|\|\>exp
      (i\<cdot\><around|)|f|\<\|\|\>><rsub|\<beta\>>=0>.
    </enumerate>
  </theorem>

  <em|Proof.> (1) <math|\<Rightarrow\>> (2): This follows immediately from
  <math|<around|\<\|\|\>|f*e<rsup|i\<cdot\>>|\<\|\|\>><rsub|Z>=<around|\<\|\|\>|f|\<\|\|\>><rsub|Z>>.

  (2) <math|\<Rightarrow\>> (1): Let <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|\<beta\>>=0>.
  It follows from the theorem stated at the end of Section 1, that there is
  <math|A\<in\>\<bbb-B\>> such that <math|<around|\<\|\|\>|f|\<\|\|\>><rsub|Z>\<leq\>5*<around|\<\|\|\>|f*1<rsub|A>|\<\|\|\>><rsub|\<beta\>>>.
  Since <math|<around|\<\|\|\>|Z|\<\|\|\>>> is regular, it is easy to see
  that there exist trigonometric polynomials
  <math|<around|(|p<rsub|n>|)><rsub|n\<in\>\<bbb-N\>>> with
  <math|<around|\<\|\|\>|p<rsub|n>|\<\|\|\>><rsub|\<infty\>>\<leq\>2> for all
  <math|n\<in\>\<bbb-N\>>, such that <math|lim<rsub|n\<to\>\<infty\>><around|\<\|\|\>|p<rsub|n>-1<rsub|A>|\<\|\|\>><rsub|Z>=0>
  (the trigonometric polynomials are dense in the continuous functions with
  respect to the uniform convergence (Naimark, 1959, p. 406, Corollary 4)).
  By the theorem previously cited there is a subsequence
  <math|<around|(|p<rsub|n<rsub|k>>|)><rsub|k\<in\>\<bbb-N\>>> converging
  <math|Z>-almost everywhere to <math|1<rsub|A>>. Applying the theorem of
  dominated convergence (Dunford and Schwartz, 1960, IV.10.10) we have
  <math|lim<rsub|k\<to\>\<infty\>> <big|int>p<rsub|n<rsub|k>>*f*<space|0.17em>d*Z=<big|int><rsub|A>f*<space|0.17em>d*Z>.
  But if <math|p=<big|sum><rsub|j=-m><rsup|m>a<rsub|j>*e<rsup|i*j\<cdot\>>>,
  then

  <\equation>
    <around*|\||<big|int>p*f*<space|0.17em>d*Z|\|>=<around|\<\|\|\>|p*f|\<\|\|\>><rsub|\<beta\>>\<leq\><big|sum><rsub|j=-m><rsup|m><around|\||a<rsub|j>|\|>*<around*|\||e<rsup|i*j\<cdot\>>*f|\|><rsub|\<beta\>>=<big|sum><rsub|j=-m><rsup|m><around|\||a<rsub|j>|\|><around|\<\|\|\>|S<rsup|j><around|(|f|)>|\<\|\|\>><rsub|\<beta\>>=0
  </equation>

  Hence <math|0=5<around|\<\|\|\>|<big|int><rsub|A>f*<space|0.17em>d*Z|\<\|\|\>>\<geq\><around|\<\|\|\>|f|\<\|\|\>><rsub|Z>>.

  <\remark>
    A sufficient condition for the existence of an invertible shift operator
    <math|S> of the spectral domain is the existence of an invertible shift
    operator <math|<wide|S|^>> of the time domain
    <math|H<rsub|X>\<assign\><math-up|sp><around|{|X<rsub|t>,t\<in\>\<bbb-Z\>|}>>,
    i.e., there is a continuous linear and continuously invertible mapping
    <math|<wide|S|^>:H<rsub|X>\<to\>H<rsub|X>> with
    <math|<wide|S|^><around|(|X<rsub|t>|)>=X<rsub|t+1>> for all
    <math|t\<in\>\<bbb-Z\>>.

    Indeed, it is sufficient to show that

    <\equation>
      <wide|S|^><around*|(|<big|int>f*<space|0.17em>d*Z|)>=<big|int>S<around|(|f|)>*<space|0.17em>d*Z,<space|1em>\<forall\>f\<in\>L<rsup|1><around|(|Z|)>
    </equation>

    <math|U:f\<mapsto\>e<rsup|i\<cdot\>>*f> and
    <math|V:f\<mapsto\><big|int>f*<space|0.17em>d*Z> are continuous linear
    mappings from <math|<around|(|L<rsup|1><around|(|Z|)>,|\<\|\|\>>\<cdot\><around|\<\|\|\>|<rsub|Z>|)>>
    to <math|<around|(|L<rsup|1><around|(|Z|)>,|\<\|\|\>>\<cdot\><around|\<\|\|\>|<rsub|Z>|)>>,
    respectively <math|H<rsub|Z>>. If <math|p> is a trigonometric polynomial,
    then <math|<wide|S|^><around|(|V<around|(|p|)>|)>=V<around|(|U<around|(|p|)>|)>>
    holds. By an argument similar to the one given in the proof of Theorem 2
    it follows that the trigonometric polynomials are dense in
    <math|<around|(|L<rsup|1><around|(|Z|)>,|\<\|\|\>>\<cdot\><around|\<\|\|\>|<rsub|Z>|)>>.
    Thus, (19) is true for all <math|f\<in\>L<rsup|1><around|(|Z|)>>.
  </remark>

  A similar shift operator criterion holds for weakly harmonizable
  continuous-time processes.

  Let <math|<around|(|X<rsub|t>|)><rsub|t\<in\>\<bbb-Z\>>> be a weakly
  harmonizable process whose spectral domain is complete and assume that the
  shift operator <math|S> of the process exists and is invertible. Then by
  the last two theorems the operators <math|S<rsup|k>,k\<in\>\<bbb-Z\>>, are
  uniformly bounded. But is the uniform boundedness of the operators
  <math|S<rsup|k>,k\<in\>\<bbb-Z\>>, sufficient for the completeness of the
  spectral domain?

  The following theorem, due to Nagy (1948), gives an affirmative answer (see
  also Truong-Van, 1981).

  <\theorem>
    Let <math|<around|(|X<rsub|t>|)><rsub|t\<in\>\<bbb-Z\>>> be a stochastic
    process, and let <math|S> be the shift operator of the process (i.e.,
    <math|S> is a linear continuous mapping on the time domain of
    <math|<around|(|X<rsub|t>|)><rsub|t\<in\>\<bbb-Z\>>>,
    <math|S<around|(|X<rsub|t>|)>=X<rsub|t+1>> for all
    <math|t\<in\>\<bbb-Z\>>). If <math|S> is invertible and moreover the
    mappings <math|S<rsup|k>,k\<in\>\<bbb-Z\>>, are uniformly bounded (in the
    operator norm), then <math|<around|(|X<rsub|t>|)><rsub|t\<in\>\<bbb-Z\>>>
    is weakly harmonizable and there exists a finite positive measure
    <math|\<mu\>>, such that <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<mu\>,2>>
    and <math|<around|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|\<beta\>>> are
    equivalent, where <math|\<beta\>> is the spectral bimeasure of
    <math|<around|(|X<rsub|t>|)><rsub|t\<in\>\<bbb-Z\>>>. Hence
    <math|<with|math-font|cal*|L><rsub|\<ast\>><rsup|2><around|(|\<beta\>|)>>
    is complete.
  </theorem>

  <section*|Acknowledgements>

  The author would like to thank C. Houdré, J. Kallsen and the anonymous
  referee for their valuable advice on the composition of this paper.

  <section*|References>

  Chang, D.K., Rao, M.M., 1986. Bimeasures and nonstationary processes. In:
  Rao, M.M. (Ed.), Real and Stochastic Analysis. Wiley, New York, pp.
  7-118.<next-line>Cramér, H. 1951. A Contribution to the theory of
  stochastic processes. In: Proc. 2nd Berkeley Symp. Math. Statist. and
  Prob., University of California, Berkeley, CA, pp.
  329-339.<next-line>Dehay, D., 1994. Spectral analysis of the covariance of
  the almost periodically correlated processes. Stochastic Processes Appl. 50
  (2), 315-330.<next-line>Drewsnowski, L., 1974a. On control submeasures and
  measures. Stud. Math. 50, 203-224.<next-line>Drewsnowski, L., 1974b. On
  Subseries Convergence in some function spaces. Bull. Académie Polonaise
  Sci. Série Sci. Math. Astronom. Phys. 22, 797-803.<next-line>Dunford, N.,
  Schwartz, J.T., 1960. Linear operators, Part 1: General Theory. Wiley
  Interscience, New York.<next-line>Houdré, C., 1987. A vector bimeasure
  integral with some applications. Technical Report 214, Center for
  Stochastic Processes, Univ. North Carolina.<next-line>Houdré, C., 1991. On
  the linear prediction of multivariate (2, p)-bounded processes. Ann.
  Probab. 19 (2), 843-867.<next-line>Hurd, H.L., 1989. Representation of
  strongly harmonizable periodically correlated processes and their
  covariances. J. Multivariate Anal. 29 (1), 53-67.<next-line>Hurd, H.L.,
  1991. Correlation theory of almost periodically correlated processes. J.
  Multivariate Anal. 37 (1) 24-25.<next-line>Kwapien, S., Woycy«ski, W.A.,
  1992. Random series and stochastic integrals: single and multiple.
  Birkhäuser, Boston.<next-line>Loève, M., 1948. Fonctions aléatoires du
  second ordre. In: P. Lévy (Ed.), Processus Stochastiques et Mouvement
  Brownien. Guthier-Villars, Paris.<next-line>Mehlmann, M., 1991. Structure
  and moving average representation for multidimensional strongly
  harmonizable processes. Stochastic Anal. Appl. 9 (3)
  323-361.<next-line>Miamee, A.G., Salehi, H., 1991. An example of a
  harmonizable process whose spectral domain is not complete. Scandinavian J.
  Statist. 18, 249-254.<next-line>Miamee, A.G., Schröder, B.S.W., 1995. On
  completeness of the spectral domain of harmonizable processes. Probab.
  Theory Related Fields 101, 303-309.<next-line>Michálek, J., Rüschendorf,
  L., 1994. A remark on the spectral domain of nonstationary processes.
  Stochastic Processes Appl. 53 (1), 55-64.<next-line>Naimark, M.A., 1959.
  Normed Rings. P. Noordhof, Ltd. Groningen, Niederlands.<next-line>Niemi,
  H., 1975. On stationary dilations and the linear prediction of certain
  stochastic processes. Soc. Sci. Fenn. Comment. Phys.-Math. 45,
  111-130.<next-line>Niemi, H., 1977. On orthogonally scattered dilations of
  bounded vector measures. Ann. Acad. Sci. Fenn. Ser. AI Math. 593,
  43-52.<next-line>Nikolskii, N.K., 1986. Treatise on the Shiftoperator.
  Springer, Berlin.<next-line>Rao, M.M., 1989a. Bimeasures and harmonizable
  processes (analysis, classification, and representation). In: Probability
  Theory on Groups IX, Proc. 9th Conf., Oberwolfach, 1988. Lecture Notes in
  Math., vol. 1379. Springer, Berlin, pp. 254-298.<next-line>Rao, M.M.,
  1989b. A view on harmonizable processes. In: Statistical Data Analysis and
  Inference, Pap. Int. Conf., Neuchatel, Switzerland, pp.
  597-615.<next-line>Rozanov, Y.A., 1967. Stationary Random Processes.
  Holden-Day Inc., San Francisco.<next-line>de Sz. Nagy, B., 1948. On
  uniformly bounded linear transformations in Hilbert space, Acta Sci. Math.
  XI. Acta Universitatis Szegediensis, pp. 152-157.<next-line>Truong-Van, B.,
  1981. Une généralisation du théorème de Kolmogorov-Aronszajn Processus
  V-bornés <math|q>-dimensionnels: domaine spectral & dilatations
  stationnaires. Ann. Inst. Henri Poincaré XVII (1), 31-49.
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
    <associate|auto-2|<tuple|c|5|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|19|8|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|5|9|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|5|9|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.
      Introduction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.
      A condition for the completeness of the spectral domain>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.
      The shift operator condition> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Acknowledgements>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|References>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>