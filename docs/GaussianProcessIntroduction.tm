<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors>>

<\body>
  <doc-data|<doc-title|INTRODUCTION TO GAUSSIAN
  PROCESSES>|<doc-author|<author-data|<author-name|STEVEN P. LALLEY>>>>\ 

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1. DEFINITIONS
    AND EXAMPLES> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2. CONTINUOUS
    EXTENSIONS AND MAXIMA OF GAUSSIAN PROCESSES>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1. Continuity. <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2. Maximum of a Gaussian process.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3. REPRODUCING
    KERNEL HILBERT SPACE OF A GAUSSIAN PROCESS>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|3.1. The Wiener Integral.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|3.2. Reproducing Kernel Hilbert Space.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <with|par-left|1tab|3.3. Examples of RKHS.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4. SINGULARITY
    AND ABSOLUTE CONTINUITY> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>
  </table-of-contents>

  <section*|1. DEFINITIONS AND EXAMPLES>

  <with|font-series|bold|Definition 1.1.> A <with|font-shape|italic|Gaussian
  process> <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> indexed by a set
  <math|T> is a family of (real-valued) random variables <math|X<rsub|t>>,
  all defined on the same probability space, such that for any finite subset
  <math|F\<subseteq\>T> the random vector
  <math|X<rsub|F>=<around|(|X<rsub|t<rsub|1>>,X<rsub|t<rsub|2>>,\<ldots\>,X<rsub|t<rsub|n>>|)>>
  has a (possibly degenerate) Gaussian distribution; if these
  finite-dimensional distributions are all non-degenerate then the Gaussian
  process is said to be non-degenerate. Equivalently,
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> is Gaussian if every finite
  linear combination <math|<big|sum><rsub|t\<in\>F>a<rsub|t>*X<rsub|t>> is
  either identically zero or has a Gaussian distribution on <math|\<bbb-R\>>.
  A Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> is
  <with|font-shape|italic|centered> if <math|E*X<rsub|t>=0> for every
  <math|t\<in\>T>, and its covariance function is the (symmetric) bivariate
  function

  <\equation*>
    R<around|(|s,t|)>=<math-up|cov><around|(|X<rsub|s>,X<rsub|t>|)>=E*<around|(|X<rsub|s>*X<rsub|t>|)>-E*X<rsub|s>*E*X<rsub|t>.
  </equation*>

  The <with|font-shape|italic|canonical metric> <math|d> associated with a
  non-degenerate Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>
  is

  <\equation*>
    d<around|(|s,t|)>=<sqrt|E*<around|(|X<rsub|s>-X<rsub|t>|)><rsup|2>>.
  </equation*>

  <with|font-series|bold|Covariance Functions:> Recall that the covariance
  matrix of a multivariate Gaussian random vector is a symmetric, nonnegative
  definite matrix; the distribution is said to be non-degenerate if its
  covariance matrix is strictly positive definite. The mean vector and
  covariance matrix uniquely determine a Gaussian distribution; consequently,
  the <with|font-shape|italic|mean function> and
  <with|font-shape|italic|covariance function> of a Gaussian process
  completely determine all of the finite-dimensional distributions (that is,
  the joint distributions of finite subsets <math|X<rsub|F>> of the random
  variables). Thus, if two Gaussian processes
  <math|X=<around|{|X<rsub|t>|}><rsub|t\<in\>T>> and
  <math|Y=<around|{|Y<rsub|t>|}><rsub|t\<in\>T>> have the same mean and
  covariance functions, then for any event <math|B>

  <\equation*>
    P*<around|(|X\<in\>B|)>=P*<around|(|Y\<in\>B|)>.
  </equation*>

  Since any event can be arbitrarily well-approximated by events that depend
  on only finitely many coordinates, it follows that the equality holds for
  <with|font-shape|italic|all> events <math|B>. Therefore, the processes
  <math|X> and <math|Y> are identical in law.

  <with|font-series|bold|Gaussian processes: Examples>

  <with|font-series|bold|Example 1.1.> The most important one-parameter
  Gaussian processes are the Wiener process
  <math|W=<around|{|W<rsub|t>|}><rsub|t\<geq\>0>> (Brownian motion), the
  Ornstein-Uhlenbeck process <math|<around|{|Y<rsub|t>|}><rsub|t\<geq\>0>>,
  and the Brownian bridge <math|<around|{|W<rsup|b><rsub|t>|}><rsub|t\<in\><around|[|0,1|]>>>.
  These are the centered Gaussian processes with covariance functions

  <\equation*>
    E*W<rsub|t>*W<rsub|s>=min <around|(|s,t|)>
  </equation*>

  <\equation*>
    E*Y<rsub|s>*Y<rsub|t>=e<rsup|-<around|\||t-s|\|>>
  </equation*>

  <\equation*>
    E*W<rsup|b><rsub|s>*W<rsup|b><rsub|t>=min <around|(|s,t|)>-s*t
  </equation*>

  <with|font-series|bold|Note:> In certain situations we truncate the
  parameter space <math|T> \U in particular, sometimes we are interested in
  the Wiener process <math|W<rsub|t>> only for
  <math|t\<in\><around|[|0,1|]>>, or in the Ornstein-Uhlenbeck process
  <math|Y<rsub|t>> for <math|t\<geq\>0>.

  <with|font-series|bold|Exercise 1.1.> Check that if <math|W<rsub|t>> is a
  standard Wiener process, then the derived processes

  <\equation*>
    W<rprime|'><rsub|t>\<assign\>W<rsub|t>-t*W<rsub|1>*<space|1em><text|and><space|1em>Y<rsub|t>\<assign\>e<rsup|-t>*W<rsub|e<rsup|t>>
  </equation*>

  have the same covariance functions as given above, and so these derived
  processes have the same \Pfinite-dimensional distributions\Q as the
  Brownian bridge and Ornstein-Uhlenbeck process, respectively. Also, check
  that for any scalar <math|a\<gtr\>0> the process

  <\equation*>
    W<rsup|\<prime\>*\<prime\>><rsub|t>\<assign\>a<rsup|-1>*W<rsub|a<rsup|2>*t>
  </equation*>

  has the same covariance function, and therefore also the same
  finite-dimensional distributions, as <math|W>. (This correspondence is
  called <with|font-shape|italic|Brownian scaling>.)

  <with|font-series|bold|Exercise 1.2.> Let <math|W<rsub|t>> be a standard
  Wiener process, and let <math|f<around|(|t|)>> be any continuous
  (nonrandom) function. Define

  <\equation*>
    Z<rsub|t>=<big|int><rsub|0><rsup|t>W<rsub|s>*f<around|(|s|)>*<space|0.17em>d*s
  </equation*>

  (The integral is well-defined because the Wiener process has continuous
  paths.) Show that <math|Z<rsub|t>> is a Gaussian process, and calculate its
  covariance function. <with|font-shape|italic|Hint:> First show that if a
  sequence <math|X<rsub|n>> of Gaussian random variables converges in
  distribution, then the limit distribution is Gaussian (but possibly
  degenerate).

  <with|font-series|bold|Example 1.2.> Let
  <math|i<rsub|1>,i<rsub|2>,\<ldots\>> be independent, identically
  distributed unit normals. Then for any finite set of frequencies
  <math|\<omega\><rsub|i>\<geq\>0>, the process

  <\equation*>
    X<rsub|t>=<big|sum><rsub|i=1><rsup|m>\<xi\><rsub|i>*cos
    <around|(|\<omega\><rsub|i>*t|)>
  </equation*>

  indexed by <math|t\<in\>\<bbb-R\>> is a Gaussian process. This process has
  smooth sample paths (they are just random linear combinations of cosine
  waves). Note that for any finite set <math|F> of cardinality larger than
  <math|m> the random vector <math|X<rsub|F>> has a degenerate Gaussian
  distribution (why?).

  <with|font-series|bold|Example 1.3.> The two-parameter Brownian sheet
  <math|<around|{|W<rsub|s,t>|}><rsub|s,t\<in\>\<bbb-R\><rsup|2>>> is the
  mean-zero Gaussian process indexed by ordered pairs <math|<around|(|s,t|)>>
  of nonnegative reals with covariance function

  <\equation*>
    E*W<rsub|s<rsub|1>,t<rsub|1>>*W<rsub|s<rsub|2>,t<rsub|2>>=min
    <around|(|s<rsub|1>,s<rsub|2>|)>*min <around|(|t<rsub|1>,t<rsub|2>|)>
  </equation*>

  Observe that for each fixed <math|r\<gtr\>0>, the one-parameter process
  <math|Z<rprime|'><rsub|t>=W<rsub|r,t>> has the same covariance function as
  a standard Wiener process multiplied by <math|<sqrt|r>>. Thus, the Brownian
  sheet has slices in the two coordinate directions that look like scaled
  Wiener processes. For figures showing simulations of Brownian sheets, see
  Mandelbrot's book <with|font-shape|italic|Fractal Geometry of Nature>.

  <with|font-series|bold|Construction of Gaussian Processes.> It is not at
  all obvious that the Gaussian processes in Examples 1.1 and 1.3 exist, nor
  what kind of sample paths/sheets they will have. The difficulty is that
  uncountably many random variables are involved. We will show that not only
  do all of the processes above exist, but that they have continuous sample
  functions. This will be done in two steps: First, we will show that
  Gaussian processes with <with|font-shape|italic|countable> index sets can
  always be constructed from i.i.d. unit normals. Then, in section 2, we will
  show that under certain restrictions on the covariance function a Gaussian
  process can be extended continuously from a countable dense index set to a
  continuum. The following example shows that some restriction on the
  covariance is necessary.

  <with|font-series|bold|Exercise 1.3.> (A) Show that there is no Gaussian
  process <math|<around|{|X<rsub|t>|}><rsub|t\<in\><around|[|0,1|]>>> with
  continuous sample paths and covariance function

  <\equation*>
    R<around|(|s,t|)>=0*<space|1em><text|for><space|1em>s\<neq\>t*<space|1em><text|and><space|1em>R<around|(|s,s|)>=1
  </equation*>

  (B)<rsup|<math|\<ast\>>> Show that there is no probability space
  <math|<around|(|\<Omega\>,\<cal-F\>,P|)>> that supports random variables
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\><around|[|0,1|]>>> such that (i)
  the mapping <math|X:<around|(|\<Omega\>,\<cal-F\>|)>\<rightarrow\><around|(|\<bbb-R\><rsup|<around|[|0,1|]>>,\<cal-B\>|)>>
  defined by <math|X<around|(|\<omega\>,t|)>=X<rsub|t><around|(|\<omega\>|)>>
  is jointly measurable (here the implied <math|\<sigma\>>\Ualgebra on
  <math|<around|[|0,1|]>> is the set of Lebesgue measurable subsets of
  <math|<around|[|0,1|]>>); and (ii) the stochastic process
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\><around|[|0,1|]>>> is centered
  Gaussian with covariance function <math|R> as in part (A).

  <with|font-series|bold|Processes with Countable Index Sets.> For each
  <math|m=1,2,\<ldots\>>, let <math|F<rsub|m>> be a (Borel) probability
  distribution on <math|\<bbb-R\><rsup|m>>. Assume that these are mutually
  consistent in the following sense: for each Borel subset <math|B> of
  <math|\<bbb-R\><rsup|m>>,

  <\equation*>
    F<rsub|m><around|(|B|)>=F<rsub|m+1>*<around|(|B\<times\>\<bbb-R\>|)>;
  </equation*>

  that is, <math|F<rsub|m>> is the marginal joint distribution of the first
  <math|m> coordinates of a random vector with distribution
  <math|F<rsub|m+1>>. I will show that on some probability space an arbitrary
  defined random variable <math|X<rsub|i>> such that for each <math|m>, the
  random vector <math|<around|(|X<rsub|1>,X<rsub|2>,\<ldots\>,X<rsub|m>|)>>
  has distribution <math|F<rsub|m+1>>. In fact, any probability space that
  support an i.i.d. sequence <math|U<rsub|i>> of uniform
  <math|<around|[|0,1|]>> random variables will suffice.

  Recall that any probability distribution <math|F> on <math|\<bbb-R\>> can
  be \Psimulated\Q using a single uniform <math|<around|[|0,1|]>> random
  variable <math|U>, by the quantile transformation method. Hence, there is a
  (Borel) function <math|\<psi\><around|(|U|)>> such that <math|U> has
  distribution <math|F>. Now suppose that <math|X<rsub|i>> have been
  constructed for <math|i\<leq\>m> using the values <math|U<rsub|i>>, with
  <math|i\<leq\>m>, in such a way that the joint distribution of the random
  vector <math|<around|(|X<rsub|1>,X<rsub|2>,\<ldots\>,X<rsub|m-1>,X<rsub|m>|)>>
  is <math|F<rsub|m>>. Let <math|G<rsub|m+1>> be the conditional distribution
  on <math|\<bbb-R\>> of the <math|<around|(|m+1|)>>st coordinate of an
  arbitrary defined random vector given that the first <math|m> coordinates
  have values <math|<around|(|X<rsub|1>,X<rsub|2>,\<ldots\>,X<rsub|m>|)>>.
  Use <math|U<rsub|m+1>> to produce a random variable <math|X<rsub|m+1>> with
  conditional distribution <math|G<rsub|m+1>> given the values
  <math|<around|(|X<rsub|1>,X<rsub|2>,\<ldots\>,X<rsub|m>|)>>. Then the joint
  distribution of <math|<around|(|X<rsub|1>,X<rsub|2>,\<ldots\>,X<rsub|m+1>|)>>
  will be <math|F<rsub|m+1>>, by the consistency hypothesis.

  Now let <math|R<around|(|s,t|)>> be a positive definite function indexed by
  a countable set <math|T>, that is, a symmetric function with the property
  that for every finite subset <math|F> of <math|T>, the matrix
  <math|Z<rsub|F>=<around|{|R<around|(|s,t|)>|}><rsub|s,t\<in\>F>> is
  positive definite. Without loss of generality, assume that
  <math|T=\<bbb-N\>>. Then the sequence of distributions

  <\equation*>
    F<rsub|m>=<text|Normal><around|(|0,\<Sigma\><rsub|m>|)>
  </equation*>

  is mutually consistent (why?). Therefore, by the preceding paragraph, there
  exists a sequence of random variables <math|X<rsub|i>> such that, for each
  finite subset <math|F\<subseteq\>T> the joint distribution of
  <math|X<rsub|F>> is Gaussian with mean zero and covariance
  <math|Z<rsub|F>>.

  <section*|2. CONTINUOUS EXTENSIONS AND MAXIMA OF GAUSSIAN PROCESSES>

  <subsection*|2.1. Continuity.>

  Exercise 1.3 shows that there are covariance functions <math|R> such that
  no centered Gaussian process with covariance function <math|R> has
  continuous sample paths. The example provided by Exercise 1.3 is somewhat
  pathological, though, in that the covariance <math|R> is discontinuous (and
  the corresponding canonical metric leads to the discrete topology). The
  following example shows that there are <with|font-shape|italic|continuous>
  covariance functions that are incompatible with sample-path continuity.

  <with|font-series|bold|Example 2.1.> Let
  <math|n=n<rsub|1>*n<rsub|2>*\<ldots\>> be an infinite sequence of integers
  <math|n<rsub|i>\<geq\>2>. Define the rooted infinite tree
  <math|T=T<rsub|n>> to be graph whose vertex set consists of all
  <with|font-shape|italic|finite> sequence
  <math|i<rsub|1>*i<rsub|2>*\<ldots\>*i<rsub|k>> such that
  <math|1\<leq\>i<rsub|j>\<leq\>n> for each <math|j\<leq\>k>, and whose edge
  set consists of all pairs <math|<around|(|i<rsub|1><rprime|'>,i<rsub|1>|)>>
  such that <math|i<rsub|1><rprime|'>> is obtained by appending a single
  letter (integer) to <math|i>, for instance

  <\equation*>
    <around|(|<around|(|2,7,13|)>,<around|(|2,7,13,4|)>|)>.
  </equation*>

  The empty sequence <math|\<emptyset\>> is the root of the tree. The
  <with|font-shape|italic|boundary> <math|\<partial\>*T> is defined to be the
  set of all infinite self-avoiding paths
  <math|i=i<rsub|1>*i<rsub|2>*\<ldots\>> that start at the root. For each
  <math|0\<less\>\<alpha\>\<less\>1> there is a natural metric
  <math|d<rsub|\<alpha\>>> on <math|\<partial\>*T> defined as follows:
  <math|d<rsub|\<alpha\>><around|(|i,i<rprime|'>|)>=\<alpha\><rsup|N<around|(|i,i<rprime|'>|)>>>
  where <math|N<around|(|i,i<rprime|'>|)>> is the index of the first
  coordinate where the sequences <math|i,i<rprime|'>> differ, e.g.,

  <\equation*>
    N<around|(|<around|(|2,7,4,5,8,1,\<ldots\>|)>,<around|(|2,7,4,3,3,1,\<ldots\>|)>|)>=4
  </equation*>

  Define a centered Gaussian process <math|<around|{|X<rsub|i<rsub|\<alpha\>>>|}><rsub|i\<in\>\<partial\>*T>>
  indexed by the boundary <math|\<partial\>*T> as follows: first, attach to
  each edge <math|e> connecting vertices at levels <math|n-1> and <math|n> a
  mean-zero Gaussian random variable <math|\<xi\><rsub|e>> with variance
  <math|4<rsup|-n>>, in such a way that the random variables
  <math|<around|{|\<xi\><rsub|e>|}>> are mutually independent. For
  <math|i=i<rsub|1>*i<rsub|2>*\<ldots\>\<in\>\<partial\>*T> define

  <\equation*>
    X<rsub|i>=<big|sum><rsub|m=1><rsup|\<infty\>>\<xi\><rsub|e<rsub|m><around|(|i|)>>
  </equation*>

  where <math|e<rsub|m><around|(|i|)>=<around|(|i<rsub|1>*i<rsub|2>*\<ldots\>*i<rsub|m-1>,i<rsub|1>*i<rsub|2>*\<ldots\>*i<rsub|m>|)>>,
  that is, sum the random variables <math|\<xi\><rsub|e>> along the path from
  the root leading to <math|i>. Observe that for each
  <math|i\<in\>\<partial\>*T> the random variable <math|X<rsub|i>> is
  centered Gaussian with variance <math|1/3>. You should check that the
  canonical metric <math|d<rsub|\<alpha\>>> for the choice <math|\<alpha\>=>?
  (figure it out). Theorem 1 below implies that if, for instance,
  <math|n<rsub|k>\<geq\>2<rsup|2<rsup|k>>> then the Gaussian process
  <math|<around|{|X<rsub|i<rsub|\<alpha\>>>|}>> has a version with continuous
  paths. However, if <math|n<rsub|k>\<geq\>2<rsup|22<rsup|k>>> then it
  doesn't. (Exercise!)

  <with|font-series|bold|Definition 2.1.> Let <math|<around|(|T,d|)>> be a
  compact metric space. For each <math|\<varepsilon\>\<gtr\>0> the Lebesgue
  covering number <math|N<around|(|\<varepsilon\>|)>> is the minimum number
  of (open) <math|\<varepsilon\>>-balls needed to cover <math|T>.

  <with|font-series|bold|Theorem 1.> Let <math|d> be the canonical metric of
  a non-degenerate, centered Gaussian process
  <math|<around|{|X<rsub|i>|}><rsub|i\<in\>T>>, and let
  <math|N<around|(|\<varepsilon\>|)>> be the Lebesgue covering function. If
  for some <math|\<rho\>\<gtr\>0>

  <\equation*>
    <big|int><rsub|0><rsup|\<varepsilon\>>log
    N<around|(|\<eta\>|)>*d*\<eta\>\<less\>\<infty\>
  </equation*>

  then the Gaussian process has a version with uniformly continuous sample
  paths. Consequently (since <math|T> is compact), for this version,

  <\equation*>
    sup<rsub|i\<in\>T> X<rsub|i>=max<rsub|i\<in\>T>
    X<rsub|i><space|1em><text|a.s.>
  </equation*>

  <with|font-series|bold|Remark 1.> This result can then also be used as an
  extension theorem. In particular, if <math|<around|(|T,d|)>> is not a
  complete metric space then the theorem implies that under the assumption
  <math|<big|int><rsub|0><rsup|\<varepsilon\>>log
  N<around|(|\<eta\>|)>*d*\<eta\>\<less\>\<infty\>> the Gaussian process has
  a uniformly continuous extension to the completion of
  <math|<around|(|T,d|)>>, by the next lemma.

  <with|font-series|bold|Lemma 2.1.> Let <math|D> be a dense subset of a
  metric space <math|T>, and let <math|f:D\<rightarrow\>\<bbb-R\>> be
  uniformly continuous on <math|D>, i.e., for each
  <math|\<varepsilon\>\<gtr\>0> there exists <math|\<delta\>\<gtr\>0> such
  that <math|<around|\||f<around|(|y|)>-f<around|(|x|)>|\|>\<less\>\<varepsilon\>>
  for any two points <math|x,y\<in\>D> at distance
  <math|d<around|(|x,y|)>\<less\>\<delta\>>. Then there is a unique uniformly
  continuous extension of <math|f> to <math|T>.

  <with|font-shape|italic|Proof.> This is a routine exercise in elementary
  real analysis.

  <with|font-shape|italic|Proof of Theorem 1.> Assume without loss of
  generality that <math|\<rho\>=1> (if not, rescale). Fix <math|r\<geq\>4>,
  and for each <math|n=0,1,2,\<ldots\>> let <math|T<rsub|n>> be a subset of
  <math|T> with cardinality <math|N<around|(|r<rsup|-n>|)>> such that the
  <math|r<rsup|-n>>-balls centered at the points of <math|T<rsub|n>> cover
  <math|T>. Clearly, the set <math|D=<big|cup><rsub|n\<geq\>0>T<rsub|n>> is a
  countable dense subset of <math|T>. The plan will be to use Borel-Cantelli
  to show that with probability one the restriction of the Gaussian process
  to the index set <math|D> is uniformly continuous; Lemma 2.1 will then
  imply that there is a continuous extension to <math|T>.

  For each <math|n\<geq\>0> define <math|D<rsub|n>=<big|cup><rsub|k=0><rsup|n>T<rsub|k>>;
  the sets <math|D<rsub|n>> are nested, and <math|D<rsub|n>> has cardinality
  <math|N<rsub|n>\<leq\><around|(|n+1|)>*N<around|(|r<rsup|-n>|)>>, and so
  the hypothesis (2.1) implies that

  <\equation*>
    <big|sum><rsub|n=0><rsup|\<infty\>>r<rsup|-n>*A<rsub|n>\<less\>\<infty\>*<space|1em><text|where><space|1em>A<rsub|n>=<sqrt|log
    <around|(|4<rsup|n>*N<rsub|n>|)>>
  </equation*>

  Consider the events

  <\equation*>
    B<rsub|n>=<around|{|\<exists\><space|0.17em>s,t\<in\>D<rsub|n>:<around|\||X<rsub|s>-X<rsub|t>|\|>\<geq\>A<rsub|n>*d<around|(|s,t|)>|}>
  </equation*>

  Since there are at most <math|N<rsub|n><rsup|2>> pairs of points in
  <math|D<rsub|n>>, Bonferroni implies that

  <\equation*>
    P<around|(|B<rsub|n>|)>\<leq\>C*N<rsub|n><rsup|2>*e<rsup|<around*|(|-n*log
    4-log N<rsub|n><rsup|2>|)>><rsup|>\<leq\>C*4<rsup|-n>
  </equation*>

  (Here <math|C> is any constant such that if <math|Z> is a standard Gaussian
  random variable then <math|P*<around|(|<around|\||Z|\|>\<gtr\>x|)>\<leq\>C*exp
  <around|(|-x<rsup|2>/2|)>> for all <math|x\<geq\>0>.) This is summable, so
  Borel-Cantelli implies that with probability one only finitely many of the
  events <math|B<rsub|n>> occur. In particular, w.p.1 there exists
  <math|K\<less\>\<infty\>> (random) such that
  <math|<big|sum><rsub|n\<geq\>1>B<rsub|n>=0>. We will show that this implies
  that the mapping <math|s\<rightarrow\>X<rsub|s>> is uniformly continuous on
  <math|D>.

  Fix <math|\<varepsilon\>\<gtr\>0>, and let
  <math|m=m<around|(|\<varepsilon\>|)>> be such that
  <math|<big|sum><rsub|n\<geq\>m>r<rsup|-n>*A<rsub|n>\<less\>\<varepsilon\>>.
  Suppose that <math|s,t\<in\>D> are any two points at distance less than
  <math|r<rsup|-m>>. Let <math|l\<geq\>0> be the smallest nonnegative integer
  such that <math|s,t\<in\>D<rsub|m+1>>. Then there is a chain of points

  <\equation*>
    s=s<rsub|k>\<in\>T<rsub|n<rsub|k>>,s<rsub|k-1>\<in\>T<rsub|n<rsub|k-1>>,\<ldots\>,s<rsub|0>\<in\>T<rsub|n>
  </equation*>

  <\equation*>
    t=t<rsub|l>\<in\>T<rsub|n<rsub|l>>,t<rsub|l-1>\<in\>T<rsub|n<rsub|l-1>>,\<ldots\>,t<rsub|0>\<in\>T<rsub|n>
  </equation*>

  connecting <math|s> to <math|t> such that at every link of the chain

  <\equation*>
    d<around|(|s<rsub|r>,s<rsub|r-1>|)>\<leq\>4<rsup|-n+r+2>
  </equation*>

  <\equation*>
    d<around|(|t<rsub|r>,t<rsub|r-1>|)>\<leq\>4<rsup|-n-r+2>
  </equation*>

  <\equation*>
    d<around|(|s<rsub|0>,t<rsub|0>|)>\<leq\>4<rsup|-n+2>
  </equation*>

  If <math|m\<geq\>K> (as it will be eventually as
  <math|\<varepsilon\>\<rightarrow\>0> then along any link
  <math|<around|(|u,v|)>> of these chains
  <math|<around|\||X<rsub|u>-X<rsub|v>|\|>\<less\>A<rsub|j>*d<around|(|u,v|)>>,
  where <math|j> is the depth of the link. It then follows that

  <\equation*>
    <around|\||X<rsub|s>-X<rsub|t>|\|>\<less\>3*\<varepsilon\>
  </equation*>

  Thus, the restriction of the Gaussian process to <math|D> is, with
  probability one, uniformly continuous.\ 

  <with|font-series|bold|Corollary 2.2.> If <math|T> is a compact subset of
  <math|\<bbb-R\><rsup|k>> and if <math|R<around|(|s,t|)>> is a symmetric,
  Lipschitz continuous, nonnegative definite kernel on <math|T\<times\>T>,
  then there is a centered Gaussian process
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> with continuous sample paths
  and covariance function <math|R<around|(|s,t|)>>.

  <with|font-shape|italic|Proof.> Exercise.

  <with|font-series|bold|Corollary 2.3.> Let <math|T> be a compact interval
  in <math|\<bbb-R\><rsup|1>> and assume that <math|R<around|(|s,t|)>>
  satisfies the hypotheses of Corollary 2.2. If <math|R> is twice
  continuously differentiable, and if the mixed second partials are Lipschitz
  continuous on <math|T\<times\>T>, then the centered Gaussian process
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> with covariance function
  <math|R<around|(|s,t|)>> has a differentiable version, and the derivative
  process <math|<around|{|X<rsub|t><rprime|'>|}><rsub|t\<in\>T>> is a
  centered Gaussian process with covariance function

  <\equation*>
    <math-up|cov><around|(|X<rsub|s><rprime|'>,X<rsub|t><rprime|'>|)>=<frac|\<partial\><rsup|2>*R|\<partial\>*s*\<partial\>*t>*<around|(|s,t|)>
  </equation*>

  <with|font-shape|italic|Proof (Sketch).> Define a Gaussian process on
  <math|T\<times\>T\<setminus\><around|{|<around|(|t,t|)>|}><rsub|t\<in\>T>>
  by

  <\equation*>
    Y<rsub|s,t>=<frac|X<rsub|t>-X<rsub|s>|t-s>
  </equation*>

  The hypotheses on <math|R> guarantee that the covariance function of the
  process <math|<around|{|Y<rsub|s,t>|}>> has a Lipschitz continuous
  extension to <math|T\<times\>T>, so the preceding corollary implies that
  <math|Y<rsub|s,t>> extends continuously to all of <math|T\<times\>T>.

  <subsection*|2.2. Maximum of a Gaussian process.>

  Theorem 1 implies that if the metric entropy criterion (2.1) holds then the
  Gaussian process has a version with continuous sample paths, and for this
  version the maximum must be attained with probability one. A minor
  variation of the argument used to prove Theorem 1 shows that the
  <with|font-shape|italic|expectation> of the max is bounded by a multiple of
  the metric entropy integral.

  <with|font-series|bold|Theorem 2.> There is a universal constant
  <math|K\<less\>\<infty\>> such that for any non-degenerate, centered
  Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> and any
  countable dense subset <math|D\<subseteq\>T>,

  <\equation*>
    E*sup<rsub|t\<in\>D> X<rsub|t>\<leq\>K*<big|int><rsub|0><rsup|<math-up|diam><around|(|T|)>/2><sqrt|log
    N<around|(|\<varepsilon\>|)>>*<space|0.17em>d*\<varepsilon\>
  </equation*>

  This is stated so that it holds for any version, whether or not it is
  continuous. However, it is easy to see, given Theorem 1, that the statement
  is equivalent to the statement that for a
  <with|font-shape|italic|continuous> version,

  <\equation*>
    E*max<rsub|t\<in\>T> X<rsub|t>\<leq\>K*<big|int><rsub|0><rsup|<math-up|diam><around|(|T|)>/2><sqrt|log
    N<around|(|\<varepsilon\>|)>>*<space|0.17em>d*\<varepsilon\>
  </equation*>

  What is even more striking is that the sup is highly concentrated around
  its mean. This is an easy consequence of the Gaussian concentration
  inequality proved earlier in the course.

  <with|font-series|bold|Theorem 3.> Let <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>
  be a centered Gaussian process on a countable set <math|T> that is almost
  surely bounded. Write <math|X<rsup|\<ast\>>=sup<rsub|t\<in\>T> X<rsub|t>>.
  If <math|\<sigma\><rsub|t><rsup|2>\<assign\>sup<rsub|t\<in\>T>
  E*X<rsub|t><rsup|2>\<less\>\<infty\>>, then
  <math|E*X<rsup|\<ast\>>\<less\>\<infty\>> and for any <math|u\<gtr\>0>

  <\equation*>
    P*<around|(|X<rsup|\<ast\>>\<geq\>E*X<rsup|\<ast\>>+u|)>\<leq\>exp
    <around|(|-u<rsup|2>/2*\<sigma\><rsub|t><rsup|2>|)>
  </equation*>

  <with|font-shape|italic|Proof.> Consider first the case where
  <math|T=<around|[|m|]>> is finite, and without loss of generality assume
  that <math|\<sigma\><rsub|t><rsup|2>\<leq\>1>. Then
  <math|X\<assign\><around|{|X<rsub|t>|}><rsub|t\<in\>T>> is just a mean-zero
  Gaussian random vector, and <math|X<rsup|\<ast\>>> is the value of the
  maximum coordinate. This has finite expectation, because, for instance it
  is always bounded by the absolute value. Furthermore, if <math|k\<leq\>m>
  is the rank of the covariance matrix then there is a linear transformation
  <math|A:\<bbb-R\><rsup|k>\<rightarrow\>\<bbb-R\><rsup|m>> and a standard
  Gaussian random vector <math|Y> in <math|\<bbb-R\><rsup|k>> such that
  <math|X=A*Y>. Because <math|\<sigma\><rsub|t><rsup|2>\<leq\>1>, the
  components <math|X<rsub|j>> of <math|X> have variances bounded by 1, and so
  the rows of <math|A> all have length bounded by 1. Consequently, the
  mapping <math|A<rsup|\<ast\>>:\<bbb-R\><rsup|k>\<rightarrow\>\<bbb-R\>>
  that takes <math|y\<in\>\<bbb-R\><rsup|k>> to the largest coordinate of the
  <math|m>-vector <math|A*y> is 1\ULipschitz. Hence, the inequality (2.5) is
  an immediate consequence of the Gaussian concentration theorem.

  Now let <math|T> be countable, and let <math|T<rsub|1>\<subseteq\>T<rsub|2>\<subseteq\>\<ldots\>>
  be finite subsets of <math|T> whose union is <math|T>. Set
  <math|\<mu\><rsub|n>=E*max<rsub|t\<in\>T<rsub|n>> X<rsub|t>>; since the
  sets <math|T<rsub|n>> are nested, the sequence <math|\<mu\><rsub|n>> is
  nondecreasing. There are two possibilities: either <math|lim
  \<mu\><rsub|n>\<less\>\<infty\>> or <math|lim \<mu\><rsub|n>=\<infty\>>.
  But if <math|lim \<mu\><rsub|n>=\<infty\>> then it must be the case that
  <math|X<rsup|\<ast\>>=\<infty\>> almost surely, because
  <math|X<rsup|\<ast\>>\<geq\>max<rsub|t\<in\>T<rsub|n>> X<rsub|t>>, and
  since (2.5) holds for each <math|T<rsub|n>>, the maximum of <math|X> on
  <math|T<rsub|n>> is highly concentrated about <math|\<mu\><rsub|n>>.
  (Exercise: Fill in the details.) Thus, if
  <math|X<rsup|\<ast\>>\<less\>\<infty\>> almost surely then <math|lim
  \<mu\><rsub|n>\<less\>\<infty\>>, and by monotone convergence

  <\equation*>
    E*X<rsup|\<ast\>>=E*lim<rsub|n\<rightarrow\>\<infty\>>
    max<rsub|t\<in\>T<rsub|n>> X<rsub|t>=lim<rsub|n\<rightarrow\>\<infty\>>
    \<mu\><rsub|n>\<less\>\<infty\>.
  </equation*>

  Finally, to prove the concentration inequality, observe that for any
  <math|u\<gtr\>0>,

  <\equation*>
    P*<around|(|X<rsup|\<ast\>>\<geq\>E*X<rsup|\<ast\>>+u|)>=lim<rsub|n\<rightarrow\>\<infty\>>
    P*<around|(|max<rsub|t\<in\>T<rsub|n>>
    X<rsub|t>\<geq\>E*X<rsup|\<ast\>>+u|)>
  </equation*>

  <\equation*>
    \<leq\>lim<rsub|n\<rightarrow\>\<infty\>>
    P*<around|(|max<rsub|t\<in\>T<rsub|n>>
    X<rsub|t>\<geq\>\<mu\><rsub|n>+u|)>
  </equation*>

  <\equation*>
    \<leq\>exp <around|(|-u<rsup|2>/2*\<sigma\><rsub|t><rsup|2>|)>.
  </equation*>

  <section*|3. REPRODUCING KERNEL HILBERT SPACE OF A GAUSSIAN PROCESS>

  Let <math|R<around|(|s,t|)>> be the covariance function of a centered,
  non-degenerate Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>,
  and let <math|L<rsub|2><rsup|X>> be the closure, relative to the
  <math|L<rsub|2>>\Unorm, of the vector space consisting of all finite linear
  combinations of the random variables <math|X<rsub|t>>. Since
  <math|L<rsub|2>>\Ulimits of centered Gaussian random variables are centered
  Gaussian random variables, every random variable in
  <math|L<rsub|2><rsup|X>> is Gaussian. The
  <with|font-shape|italic|reproducing kernel Hilbert space> (abbreviated
  RKHS) associated to the Gaussian process
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> is a Hilbert space of
  real-valued functions on <math|T> that is naturally isometric to
  <math|L<rsub|2><rsup|X>>. The isometry between these Hilbert spaces leads
  to useful spectral representations of the Gaussian process, notably the
  Karhunen-Loeve representation. The construction of the RKHS is relatively
  painless, but because the idea behind it is a bit obscure we will first
  look at another more transparent isometry of Hilbert spaces, the
  <with|font-shape|italic|Wiener integral>.

  <subsection*|3.1. The Wiener Integral.>

  The idea \U at least, some version of it \U lies behind Wiener's original
  1920 construction of the Wiener process. Wiener realized that if a centered
  Gaussian process <math|<around|{|W<rsub|t>|}><rsub|t\<in\><around|[|0,1|]>>>
  has the covariance function (1.4) then for <math|s\<less\>t> and
  <math|u\<less\>v>,

  <\equation*>
    E*<around|[|<around|(|W<rsub|t>-W<rsub|s>|)>*<around|(|W<rsub|v>-W<rsub|u>|)>|]>=<big|int><rsub|0><rsup|1>I<rsub|<around|[|s,t|]>><around|(|x|)>*I<rsub|<around|[|u,v|]>><around|(|x|)>*<space|0.17em>d*x
  </equation*>

  that is, the <math|L<rsup|2>> inner product of Wiener process increments is
  identical to the <math|L<rsup|2>> inner product of the corresponding time
  interval indicator functions relative to Lebesgue measure. Because both
  expectation and Lebesgue integral are linear, it follows that the inner
  product identity (3.1) extends to all finite linear combinations. Now
  finite linear combinations of indicator functions of intervals are just
  step functions, and step functions are dense, relative to the
  <math|L<rsup|2>>\Udistance, in <math|L<rsup|2><around|[|0,1|]>>, so the
  linear mapping

  <\equation*>
    T<around*|(|<big|sum><rsub|i=1><rsup|k>a<rsub|i>*I<rsub|<around|[|s<rsub|i>,t<rsub|i>|]>>|)>=<big|sum><rsub|i=1><rsup|k>a<rsub|i>*<around|(|W<around|(|t<rsub|i>|)>-W<around|(|s<rsub|i>|)>|)>
  </equation*>

  extends to a linear mapping <math|T> of <math|L<rsup|2><around|[|0,1|]>>
  into the space <math|L<rsup|2><around|(|P|)>> of square-integrable random
  variables, by the following general principle.

  <with|font-series|bold|Proposition 3.1.> Let <math|H<rsub|0>> be a dense,
  linear subspace of a Hilbert space <math|H>, and let
  <math|J:H<rsub|0>\<rightarrow\>H<rprime|'>> be a linear isometry mapping
  <math|H<rsub|0>> into another Hilbert space <math|H<rprime|'>>. Then
  <math|J> extends uniquely to a linear isometry
  <math|J:H\<rightarrow\>H<rprime|'>>.

  <with|font-shape|italic|Proof.> Exercise. If you don't know what a Hilbert
  space is, just assume that <math|H> and <math|H<rprime|'>> are closed
  linear subspaces of <math|L<rsup|2>> spaces.

  <with|font-series|bold|Corollary 3.2.> If
  <math|<around|{|W<rsub|t>|}><rsub|t\<in\><around|[|0,1|]>>> is a Wiener
  process defined on some probability space
  <math|<around|(|\<Omega\>,\<cal-F\>,P|)>> then the mapping
  <math|T<around|(|I<rsub|<around|[|s,t|]>>|)>=W<rsub|t>-W<rsub|s>> extends
  in a unique way to a linear isometry <math|T:L<rsup|2><around|[|0,1|]>\<rightarrow\>L<rsup|2><around|(|P|)>>.

  The isometry <math|T> is called the <with|font-shape|italic|Wiener
  isometry> or the <with|font-shape|italic|Wiener integral>. Since a Wiener
  process is a Gaussian process, all linear combinations (3.2) of Wiener
  increments are mean-zero Gaussian random variables, so all step functions
  are mapped by <math|T> to Gaussians. Since <math|L<rsup|2>>\Ulimits of
  Gaussian random variables are Gaussian, it follows that the image
  <math|T<around|(|L<rsup|2><around|[|0,1|]>|)>> contains only Gaussian
  random variables.

  One of the fundamental theorems of Hilbert space theory is that any Hilbert
  space has a complete orthonormal basis. The Hilbert space
  <math|L<rsup|2><around|[|0,1|]>> is separable, so it has countable
  orthonormal bases (for instance, the Fourier basis and the Haar basis). Let
  <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>> be any such basis.
  Since the Wiener integral <math|T> is an isometry, the random variables
  <math|\<xi\><rsub|n>=T*\<psi\><rsub|n>> are orthogonal \U in particular,
  uncorrelated, and therefore independent \U standard normals, and these form
  a complete orthonormal basis of <math|T<around|(|L<rsup|2><around|[|0,1|]>|)>>.
  By Parseval's theorem, any <math|f\<in\>L<rsup|2><around|[|0,1|]>> has the
  representation

  <\equation*>
    f=<big|sum><rsub|n=1><rsup|\<infty\>><around|\<langle\>|f,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n><space|1em><text|where><space|1em><around|\<langle\>|f,g|\<rangle\>>=<big|int><rsub|0><rsup|1>f<around|(|x|)>*g<around|(|x|)>*<space|0.17em>d*x
  </equation*>

  where the series converges in <math|L<rsup|2>> norm, and in particular, for
  any <math|t\<in\><around|[|0,1|]>>,

  <\equation*>
    1.0=<big|sum><rsub|n=1><rsup|\<infty\>><around*|(|<big|int><rsub|0><rsup|t>\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s|)><rsup|2>
  </equation*>

  Consequently, for any <math|t\<in\><around|[|0,1|]>>,

  <\equation*>
    W<rsub|t>=<big|sum><rsub|n=1><rsup|\<infty\>>\<xi\><rsub|n>*\<Psi\><rsub|n><around|(|t|)>*<space|1em><text|where><space|1em>\<Psi\><rsub|n><around|(|t|)>\<assign\><big|int><rsub|0><rsup|t>\<psi\><rsub|n><around|(|s|)>*<space|0.17em>d*s
  </equation*>

  This expansion is valid for <with|font-shape|italic|any> orthonormal basis
  <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>>. For the Fourier sine
  basis, the indefinite integrals <math|\<Psi\><rsub|n>> are cosines, and the
  expansion reads

  <\equation*>
    W<rsub|t>=\<xi\><rsub|0>*t+<big|sum><rsub|n=1><rsup|\<infty\>>n<rsup|-1>*\<xi\><rsub|n>*<sqrt|2>*sin
    n*\<pi\>*t
  </equation*>

  Wiener's 1920 insight was that the isometry can be \Preversed\Q, that is,
  if <math|<around|(|\<Omega\>,\<cal-F\>,P|)>> is a probability space that
  supports a sequence <math|<around|{|\<xi\><rsub|n>|}><rsub|n\<geq\>1>> of
  i.i.d. standard normal random variables then the mapping
  <math|T*\<psi\><rsub|n>=\<xi\><rsub|n>> extends to a linear isometry of
  <math|L<rsup|2><around|[|0,1|]>> into <math|L<rsup|2><around|(|P|)>>, and
  therefore (3.3) defines a Wiener process. This doesn't prove that the
  Wiener process has continuous sample paths, because the convergence of the
  series (3.3) is only <math|L<rsup|2>> convergence for each <math|t>. But
  Wiener was able to show, by brute force, that for the Fourier basis the
  series (3.4) actually converges uniformly in <math|t>, w.p.1, and so at
  least for this basis the series defines a Wiener process with continuous
  paths. Paul Lévy later realized that it is much easier to prove uniform
  convergence of the series (3.3) for the Haar basis <math|\<psi\><rsub|n>>
  than for the Fourier basis. This is the existence proof given in most
  standard textbooks today.

  <with|font-series|bold|Exercise 3.1.> Let
  <math|f\<in\>L<rsup|2><around|[|0,1|]>> be a strictly positive function
  with <math|L<rsup|2>>\Unorm 1, i.e., such that
  <math|<big|int><rsub|0><rsup|1>f<around|(|s|)><rsup|2>*<space|0.17em>d*s=1>.
  For <math|t\<in\><around|[|0,1|]>> define

  <\equation*>
    F<around|(|t|)>=<big|int><rsub|0><rsup|t>f<around|(|s|)><rsup|2>*<space|0.17em>d*s
  </equation*>

  <\equation*>
    \<tau\><around|(|t|)>=F<rsup|-1><around|(|t|)>=min
    <around|{|s:F<around|(|s|)>=t|}>,<space|1em><text|and><space|1em>Y<around|(|t|)>=T*<around|(|f*I<rsub|<around|[|0,\<tau\><around|(|t|)>|]>>|)>
  </equation*>

  Show that <math|Y<around|(|\<tau\><around|(|t|)>|)>> is a Wiener process,
  that is, a mean-zero Gaussian process with covariance function (1.4).
  Interpretation: <math|f<around|(|s|)>*d*W<rsub|s>> is a Brownian increment
  whose \Pvolatility\Q is multiplied by <math|<around|\||f<around|(|s|)>|\|>>.
  Thus, <math|\<tau\><around|(|t|)>> runs the integral until the total
  accumulated squared volatility (variance) reaches <math|t>.

  <with|font-series|bold|Exercise 3.2.> Let
  <math|g\<in\>L<rsup|2><around|[|0,1|]>> and define
  <math|G<around|(|t|)>=<big|int><rsub|0><rsup|t>g<around|(|s|)>*<space|0.17em>d*s>.
  Note that <math|G<around|(|t|)>> is continuous (why?).

  Also, if <math|W<around|(|t|)>> is a standard Wiener process with
  continuous paths, then the integral <math|<big|int><rsub|0><rsup|1>g<around|(|s|)>*W<around|(|s|)>*<space|0.17em>d*s>
  is well-defined as a Riemann integral. Show that

  <\equation*>
    T<around|(|G|)>=<big|int><rsub|0><rsup|1>g<around|(|s|)>*W<around|(|s|)>*<space|0.17em>d*s
  </equation*>

  Also, show that

  <\equation*>
    E<around|(|T<around|(|G|)><rsup|2>|)>=<big|int><rsub|0><rsup|1>G<around|(|s|)><rsup|2>*<space|0.17em>d*s=<big|int><rsub|<around|[|0,1|]><rsup|2>>g<around|(|s|)>*g<around|(|t|)>*min
    <around|(|s,t|)>*<space|0.17em>d*s*<space|0.17em>d*t
  </equation*>

  <subsection*|3.2. Reproducing Kernel Hilbert Space.>

  A symmetric, real-valued function <math|R:T\<times\>T\<rightarrow\>\<bbb-R\>>
  is said to be a <with|font-shape|italic|positive definite kernel> if for
  every finite subset <math|F\<subseteq\>T> the
  <math|<around|\||F|\|>\<times\><around|\||F|\|>> matrix
  <math|<around|(|R<around|(|s,t|)>|)><rsub|s,t\<in\>F>> is positive
  definite. The covariance function of any nondegenerate Gaussian process has
  this property. Every positive definite kernel <math|R> on <math|T> induces
  a <with|font-shape|italic|canonical metric> <math|d> on <math|T> by

  <\equation*>
    d*<around|(|s,t|)>=<sqrt|R<around|(|t,t|)>+R<around|(|s,s|)>-2*R<around|(|s,t|)>>
  </equation*>

  <with|font-series|bold|Lemma 3.3.> The definition (3.5) specifies a metric
  on <math|T>.

  <with|font-shape|italic|Proof.> This is most easily proved by making a
  connection with Gaussian processes. To prove that <math|d> is a metric on
  <math|T> it suffices to prove that it is a metric on any finite subset of
  <math|T> (because the defining properties of a metric \U symmetry,
  positivity, and the triangle inequality \U involve only two or three points
  at a time). Now if <math|F> is a finite subset of <math|T> then the matrix
  <math|<around|(|R<around|(|i,j|)>|)><rsub|i,j\<in\>F>> is a symmetric,
  positive definite <math|<around|\||F|\|>\<times\><around|\||F|\|>> matrix,
  and hence is the covariance matrix of a centered, nondegenerate Gaussian
  random vector <math|<around|(|X<rsub|i>|)><rsub|i\<in\>F>>. By
  construction,

  <\equation*>
    d<around|(|i,j|)><rsup|2>=E*<around|\||X<rsub|i>-X<rsub|j>|\|><rsup|2>
  </equation*>

  so <math|d> is the canonical metric of the Gaussian process
  <math|<around|(|X<rsub|i>|)><rsub|i\<in\>F>>. But the canonical metric of a
  non-degenerate Gaussian process is a genuine metric.

  Assume for the remainder of this section that <math|R<around|(|s,t|)>> is a
  positive definite kernel on <math|T>. For each <math|s\<in\>T> let
  <math|R<rsub|s>:T\<rightarrow\>\<bbb-R\>> be the <math|s>\Usection of
  <math|R>, that is, the function defined by
  <math|R<rsub|s><around|(|t|)>=R<around|(|s,t|)>>. Let <math|H<rsub|0>> be
  the vector space of real-valued functions on <math|T> consisting of all
  finite linear combinations <math|<big|sum>a<rsub|i>*R<rsub|s<rsub|i>>>.
  Define an inner product on <math|H<rsub|0>> as follows:

  <\equation*>
    <around*|\<langle\>|<big|sum>a<rsub|i>*R<rsub|s<rsub|i>>,<big|sum>b<rsub|j>*R<rsub|t<rsub|j>>|\<rangle\>>=<big|sum>a<rsub|i>*b<rsub|j>*R<around|(|s<rsub|i>,t<rsub|j>|)>
  </equation*>

  This is clearly bilinear, and since <math|R> is assumed to be positive
  definite it defines an inner product (as you should check!). This inner
  product is designed so that the mapping <math|s\<rightarrow\>R<rsub|s>> is
  an <with|font-shape|italic|isometry> of <math|T> (with the canonical
  metric) into <math|H<rsub|0>> (with the metric induced by the inner product
  (3.6)): in particular, for any <math|s,t\<in\>T>

  <\equation*>
    <around|\<\|\|\>|R<rsub|s>-R<rsub|t>|\<\|\|\>><rsup|2>=R<around|(|t,t|)>+R<around|(|s,s|)>-2*R<around|(|s,t|)>=d<around|(|s,t|)><rsup|2>
  </equation*>

  Observe that when <math|R> is the covariance function of a centered
  Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>, the inner
  product (3.6) makes the mapping <math|T:H<rsub|0>\<rightarrow\>L<rsup|2><around|(|P|)>>
  defined by

  <\equation*>
    T<around*|(|<big|sum>a<rsub|i>*R<rsub|s<rsub|i>>|)>=<big|sum>a<rsub|i>*X<rsub|s<rsub|i>>
  </equation*>

  a linear isometry.

  The pairing of the inner product (3.6) with the positive definite kernel
  <math|R> is explicitly made so that the kernel <math|R<around|(|s,t|)>>
  will a <with|font-shape|italic|reproducing kernel> relative to the inner
  product, in the following sense: for any function
  <math|\<varphi\>\<in\>H<rsub|0>> and any <math|t\<in\>T>,

  <\equation*>
    \<varphi\><around|(|t|)>=<around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>
  </equation*>

  <with|font-series|bold|Definition 3.1.> The
  <with|font-shape|italic|reproducing kernel Hilbert space> <math|H>
  associated with the covariance kernel <math|R> is the closure of
  <math|H<rsub|0>> with respect to the norm induced by the inner product
  (3.6).

  In the special case where <math|R> is the covariance function of a centered
  Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>, Proposition
  3.1 implies that the linear isometry <math|T> defined by (3.8) extends in a
  unique way to all of <math|H>, since by construction <math|H<rsub|0>> is a
  dense linear subspace of <math|H>.

  <with|font-series|bold|Lemma 3.4.> If <math|T> is separable relative to the
  canonical metric then so is the reproducing kernel Hilbert space <math|H>,
  and if <math|T> is compact then set <math|<around|{|R<rsub|s>|}><rsub|s\<in\>T>>
  is compact, and therefore bounded, in <math|H>.

  <with|font-shape|italic|Proof.> By construction, the mapping
  <math|s\<rightarrow\>R<rsub|s>> is an isometry. Therefore, if <math|T> is
  compact (separable) then the set <math|<around|{|R<rsub|s>|}><rsub|s\<in\>T>>
  is compact (separable) in <math|H>. If the set
  <math|<around|{|R<rsub|s>|}><rsub|s\<in\>T>> is separable, it has a
  countable dense subset <math|D>, and if this is the case then the
  (countable) set of rational linear combinations of elements of <math|D> is
  dense in the reproducing kernel Hilbert space <math|H>.

  <with|font-series|bold|Lemma 3.5.> The set
  <math|<around|{|R<rsub|s>|}><rsub|s\<in\>T>> is bounded in the reproducing
  kernel Hilbert space <math|H> if and only if <math|sup<rsub|t\<in\>T>
  R<around|(|t,t|)>\<less\>\<infty\>>. If this is the case then

  <\itemize>
    <item*|(a)>the function <math|<around|(|s,t|)>\<rightarrow\>R<around|(|s,t|)>>
    is Lipschitz in each variable <math|s,t>; and

    <item*|(b)>for every element <math|\<varphi\>\<in\>H> the function
    <math|t\<rightarrow\><around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>>
    is a Lipschitz continuous function on <math|T>, with Lipschitz constant
    bounded by <math|<around|\<\|\|\>|\<varphi\>|\<\|\|\>>> and sup-norm
    bounded by <math|<around|\<\|\|\>|\<varphi\>|\<\|\|\>>*sup<rsub|t\<in\>T><around|\<\|\|\>|R<rsub|t>|\<\|\|\>>>.
  </itemize>

  Thus, the elements <math|\<varphi\>\<in\>H> can be identified with
  Lipschitz functions <math|t\<rightarrow\><around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>>
  on <math|T>.

  <with|font-shape|italic|Proof.> By the reproducing property (or
  equivalently the definition of the inner product (3.6)),

  <\equation*>
    <around|\<\|\|\>|R<rsub|s>-R<rsub|t>|\<\|\|\>><rsup|2>=<around|\<langle\>|R<rsub|s>-R<rsub|t>,R<rsub|s>-R<rsub|t>|\<rangle\>>=R<around|(|t,t|)>+R<around|(|s,s|)>-2*R<around|(|s,t|)>=d<around|(|s,t|)><rsup|2>
  </equation*>

  Assume now that <math|C=sup<rsub|t\<in\>T><around|\<\|\|\>|R<rsub|t>|\<\|\|\>>\<less\>\<infty\>>.
  By the reproducing property and the Cauchy-Schwartz inequality, for any
  <math|s<rsub|1>,s<rsub|2>\<in\>T>,

  <\equation*>
    <around|\||R<around|(|s<rsub|1>,t|)>-R<around|(|s<rsub|2>,t|)>|\|>=<around|\||<around|\<langle\>|R<rsub|t>-R<rsub|s<rsub|2>>,R<rsub|t>|\<rangle\>>|\|>\<leq\><around|\||<around|\<langle\>|R<rsub|s>-R<rsub|s<rsub|2>>,R<rsub|t>|\<rangle\>>|\|>\<leq\>d<around|(|s<rsub|1>,s<rsub|2>|)><around|\<\|\|\>|R<rsub|t>|\<\|\|\>>
  </equation*>

  <\equation*>
    =C*d<around|(|s<rsub|1>,s<rsub|2>|)>;
  </equation*>

  consequently, <math|R<around|(|s,t|)>> is Lipschitz in <math|s>, with
  Lipschitz constant bounded by <math|C>. Since
  <math|R<around|(|s,t|)>=R<around|(|t,s|)>>, it follows that <math|R> is
  Lipschitz in the second variable <math|t> as well.

  Finally, let <math|\<varphi\>> be any element of the reproducing kernel
  Hilbert space <math|H>, and consider the mapping
  <math|t\<rightarrow\><around|\<langle\>|\<varphi\>,R<rsub|t>|\<rangle\>>>.
  For any two points <math|s,t\<in\>T>,

  <\equation*>
    <around|\||<around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>-<around|\<langle\>|R<rsub|s>,\<varphi\>|\<rangle\>>|\|>=<around|\||<around|\<langle\>|R<rsub|t>-R<rsub|s>,\<varphi\>|\<rangle\>>|\|>\<leq\>d<around|(|s,t|)><around|\<\|\|\>|\<varphi\>|\<\|\|\>>
  </equation*>

  This implies that the function <math|t\<rightarrow\><around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>>
  is Lipschitz, with Lipschitz constant bounded by
  <math|<around|\<\|\|\>|\<varphi\>|\<\|\|\>>>. Furthermore, by
  Cauchy-Schwartz, for any <math|t\<in\>T>,

  <\equation*>
    <around|\||<around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>|\|>\<leq\><around|\<\|\|\>|\<varphi\>|\<\|\|\>>*sup<rsub|t\<in\>T><around|\<\|\|\>|R<rsub|t>|\<\|\|\>>
  </equation*>

  <with|font-shape|italic|Note:> Lest you be confused about the
  identification of elements <math|\<varphi\>\<in\>H> with functions
  <math|t\<rightarrow\><around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>>:
  keep in mind that <math|H> was constructed as the abstract completion of
  the inner product space <math|H<rsub|0>>, so (technically) its elements are
  equivalence classes of Cauchy sequences in <math|H<rsub|0>>, not functions
  on <math|T> (even though the elements of <math|H<rsub|0>> are functions on
  <math|T>). Nevertheless, when the hypotheses of Lemma 3.5 hold, we will act
  as if the elements <math|\<varphi\>\<in\>H> are Lipschitz functions and
  write <math|\<varphi\><around|(|t|)>=<around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>>.

  <with|font-series|bold|Proposition 3.6.> If <math|T> is compact relative to
  the canonical metric of the Gaussian process then for any (countable)
  orthonormal basis <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>> and
  any <math|s,t\<in\>T>

  <\equation*>
    R<around|(|s,t|)>=<big|sum><rsub|n\<geq\>1><around|\<langle\>|R<rsub|s>,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n><around|(|t|)>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>
  </equation*>

  and the convergence is uniform for <math|s,t\<in\>T>.

  <with|font-shape|italic|Note:> This is a variant of Mercer's theorem. The
  hypothesis that <math|T> is compact ensures that the reproducing kernel
  Hilbert space is separable, and hence that every orthonormal basis is
  countable (or has cardinality <math|<around|\||T|\|>> is <math|T> is
  finite). If <math|T> is finite the expansion (3.10) follows from the
  spectral theorem for finite symmetric matrices, so we will restrict
  attention to the case where <math|T> is compact but infinite.

  <with|font-shape|italic|Proof.> By construction, the mapping
  <math|s\<rightarrow\>R<rsub|s>> is an isometry. Therefore, if <math|T> is
  compact then by Lemma 3.5, <math|R> is Lipschitz in each variable. This
  implies that the mapping <math|s\<rightarrow\>R<around|(|s,s|)>> is
  Lipschitz, and that <math|sup<rsub|s\<in\>T>
  R<around|(|s,s|)>\<less\>\<infty\>>.

  If <math|T> is compact and infinite then every orthonormal basis for the
  reproducing kernel Hilbert space is countable. Let
  <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>> be any orthonormal
  basis. By Parseval's theorem, for any <math|s\<in\>T> the <math|s>\Usection
  <math|R<rsub|s>> has the expansion

  <\equation*>
    R<rsub|s>=<big|sum><rsub|n\<geq\>1><around|\<langle\>|R<rsub|s>,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n>
  </equation*>

  where the convergence is in the <math|H>\Unorm. (The second identity
  follows from the reproducing property of the kernel.) Moreover, for any
  <math|s\<in\>T>,

  <\equation*>
    R<around|(|s,s|)>=<around|\<\|\|\>|R<rsub|s>|\<\|\|\>><rsup|2>=<big|sum><rsub|n\<geq\>1><around|\<langle\>|R<rsub|s>,\<psi\><rsub|n>|\<rangle\>><rsup|2>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)><rsup|2>
  </equation*>

  Since <math|T> is compact, the function
  <math|s\<rightarrow\>R<around|(|s,s|)>> is Lipschitz, by Lemma 3.5, and
  therefore continuous. Moreover, the functions
  <math|\<psi\><rsub|n><around|(|s|)><rsup|2>> are (Lipschitz) continuous,
  also by Lemma 3.5, and obviously nonnegative. Consequently, Dini's
  theorem<footnote|Dini's theorem states that if
  <math|f<rsub|n><around|(|t|)>> is a nondecreasing sequence of nonnegative
  continuous functions on a compact space <math|T> such that
  <math|f<rsub|n><around|(|t|)>*\<uparrow\>*f<around|(|t|)>> for every
  <math|t\<in\>T>, where <math|f> is a continuous function, then the
  convergence is uniform.> implies that the series
  <math|<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)><rsup|2>>
  converges to <math|R<around|(|s,s|)>> uniformly for <math|s\<in\>T>.

  To complete the proof we will show that the uniform convergence of the
  series <math|<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)><rsup|2>>
  implies that the series <math|<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>>
  converges uniformly for <math|<around|(|s,t|)>\<in\>T\<times\>T>. The
  uniform convergence follows by Cauchy-Schwartz, because for any
  <math|m\<geq\>1>,

  <\equation*>
    <around*|\||<big|sum><rsub|n\<geq\>m>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>|\|>\<leq\><sqrt|<big|sum><rsub|n\<geq\>m>\<psi\><rsub|n><around|(|s|)><rsup|2>*<big|sum><rsub|n\<geq\>m>\<psi\><rsub|n><around|(|t|)><rsup|2>>
  </equation*>

  since <math|<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)><rsup|2>>
  converges uniformly for <math|s\<in\>T>, the right side of the inequality
  can be made uniformly small by choosing <math|m> large. To see that the
  limit of the series <math|<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>>
  is <math|R<around|(|s,t|)>>, we use the reproducing property of the kernel
  together with the <math|H>\Uconvergence (3.11). This implies that

  <\equation*>
    R<around|(|s,t|)>=<around|\<langle\>|R<rsub|s>,R<rsub|t>|\<rangle\>>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)><around|\<langle\>|\<psi\><rsub|n>,R<rsub|t>|\<rangle\>>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>
  </equation*>

  <with|font-series|bold|Proposition 3.7.> If <math|T> is compact relative to
  the canonical metric then on any probability space that supports a sequence
  <math|<around|{|\<xi\><rsub|n>|}><rsub|n\<geq\>1>> of independent
  <math|N<around|(|0,1|)>> random variables there exists a centered Gaussian
  process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> with covariance
  function <math|R>. For any orthonormal basis
  <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>> and any <math|t\<in\>T>
  the random variable <math|X<rsub|t>> is the almost sure limit of the series

  <\equation*>
    X<rsub|t>=<big|sum><rsub|n\<geq\>1>\<xi\><rsub|n>*\<psi\><rsub|n><around|(|t|)>.
  </equation*>

  <with|font-shape|italic|Proof.> If <math|T> is separable then so is the
  reproducing kernel Hilbert space <math|H>, by the same argument as in the
  proof of Proposition 3.6. Consequently, <math|H> has a countable
  orthonormal basis <math|\<psi\><rsub|n>>, and for each <math|s\<in\>T> the
  <math|s>\Usection <math|R<rsub|s>> has the expansion (3.11), and has norm
  <math|<around|\<\|\|\>|R<rsub|s>|\<\|\|\>>> given by (3.12). This implies
  that the series <math|<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)><rsup|2>>
  converges to a finite limit.

  Suppose that <math|<around|{|\<xi\><rsub|n>|}><rsub|n\<geq\>1>> is a
  sequence of independent <math|N<around|(|0,1|)>> random variables. Then for
  any <math|s\<in\>T> the series

  <\equation*>
    X<rsub|s>\<assign\><big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<xi\><rsub|n>
  </equation*>

  converges in <math|L<rsup|2><around|(|P|)>> and almost surely, since the
  variances <math|\<psi\><rsub|n><around|(|s|)><rsup|2>> are summable. (The
  sequence of partial sums is an <math|L<rsup|2>>\Ubounded martingale, and a
  basic result of martingale theory asserts that any such martingale
  converges both a.s. and in <math|L<rsup|2><around|(|P|)>> by the usual
  arguments, the limit random variable <math|X<rsub|s>> is centered Gaussian,
  and the process <math|<around|{|X<rsub|s>|}><rsub|s\<in\>T>> is Gaussian.
  The covariance function is

  <\equation*>
    E*X<rsub|s>*X<rsub|t>=E*<big|sum><rsub|n><big|sum><rsub|m>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|m><around|(|t|)>*\<xi\><rsub|n>*\<xi\><rsub|m>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>=R*<around|(|s,t|)>.
  </equation*>

  <with|font-series|bold|Theorem 4. (Itô-Nisio)> Let
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> be a centered Gaussian process
  with covariance function <math|R> and continuous sample paths. Assume also
  that <math|T> is compact relative to the canonical metric <math|d>. Let
  <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>> be any orthonormal
  basis for the reproducing kernel Hilbert space, and denote by
  <math|\<xi\><rsub|n>=T*\<psi\><rsub|n>> the image of <math|\<psi\><rsub|n>>
  under the canonical isometry <math|T> (see equation (3.8)). Then the random
  variables <math|\<xi\><rsub|n>> are independent Normal(0,1), and

  <\equation*>
    X<rsub|t>=<big|sum><rsub|n\<geq\>1>\<xi\><rsub|n>*\<psi\><rsub|n><around|(|t|)>.
  </equation*>

  With probability one, the series converges uniformly in <math|t>.

  The main point of the theorem is the uniform convergence. The hypothesis
  that the Gaussian process has a version with continuous paths is crucial,
  as there are Gaussian processes with the property that every version is
  discontinuous at every point with probability one (see Example 2.1 above).
  Theorem 4 is somewhat harder to prove than the other results of this
  section, so I will omit it and refer you to the original paper of Itô and
  Nisio. <with|font-shape|italic|Note:> Since the random variables
  <math|\<xi\><rsub|n>> are i.i.d. the series
  <math|<big|sum>\<xi\><rsub|n><rsup|2>=\<infty\>> a.s. Therefore, the
  expansion (3.14) does not converge in <math|H>, and in particular the
  sample paths <math|t\<rightarrow\>X<rsub|t>> of the Gaussian process are
  a.s. not elements of <math|H>. (Keep this in mind when reading Example 3.2
  below.)

  <subsection*|3.3. Examples of RKHS.>

  <with|font-series|bold|Example 3.1.> Consider first the case where the
  index set <math|T=<around|[|m|]>> is finite, so that the covariance kernel
  <math|R*<around|(|s,t|)>> is just a symmetric, positive definite
  <math|m\<times\>m> matrix. Functions on <math|T> are just
  <math|m>\Uvectors. To characterize the inner product (3.6), recall that
  <math|<around|\<langle\>|R<rsub|s>,R<rsub|t>|\<rangle\>>=R*<around|(|s,t|)>>;
  this can be obtained by taking the <math|s,t> entry of the matrix
  <math|R*R<rsup|-1>*R>, in matrix notation (with <math|R<rsub|s>> and
  <math|R<rsub|t>> viewed as column vectors),
  <math|R*<around|(|s,t|)>=R<rsub|s><rsup|T>*R<rsup|-1>*R<rsub|t>>. Thus, the
  inner product (3.6) can be written in matrix form as

  <\equation*>
    <around|\<langle\>|u,v|\<rangle\>>=u<rsup|T>*R<rsup|-1>*v
  </equation*>

  Example 3.1 is straightforward, but it is useful to keep in mind when
  attempting to characterize/identify the reproducing kernel Hilbert spaces
  of infinite parameter Gaussian processes. The rough idea is that the inner
  product (3.6) can be viewed as the quadratic form <math|R<rsup|-1>>, where
  <math|R<rsup|-1>> is, in a suitable sense, an inverse of the integral
  operator associated with the kernel <math|R>.

  <with|font-series|bold|Example 3.2.> Recall that the covariance function of
  the standard Wiener process <math|<around|{|W<rsub|t>|}><rsub|t\<in\><around|[|0,1|]>>>
  is <math|R*<around|(|s,t|)>=s\<wedge\>t>, where <math|\<wedge\>> denotes
  min. Each <math|s>\Usection <math|R<rsub|s>> has the property that
  <math|R<rsub|s><around|(|0|)>=0>, so every function in <math|H<rsub|0>>
  takes the value 0 at <math|t=0>. Each <math|s>\Usection <math|R<rsub|s>>
  has derivative <math|R<rsub|s><rprime|'>> equal to the indicator function
  <math|I<rsub|<around|[|0,s|]>>> of the interval <math|<around|[|0,s|]>>, so
  every <math|\<varphi\>\<in\>H<rsub|0>> is differentiable at all but
  finitely many points, and the derivative is bounded. Hence, for every
  <math|\<varphi\>\<in\>H<rsub|0>>,

  <\equation*>
    <around|\<langle\>|R<rsub|s>,\<varphi\>|\<rangle\>>=\<varphi\><around|(|s|)>=<big|int><rsub|0><rsup|1>R<rsub|s><rprime|'><around|(|t|)>*\<varphi\><rprime|'><around|(|t|)>*<space|0.17em>d*t
  </equation*>

  It follows that the inner product (3.6) on <math|H<rsub|0>> coincides with
  the usual inner product of derivatives, that is,

  <\equation*>
    <around|\<langle\>|\<varphi\>,\<psi\>|\<rangle\>>=<big|int><rsub|0><rsup|1>\<varphi\><rprime|'><around|(|s|)>*\<psi\><rprime|'><around|(|s|)>*<space|0.17em>d*s
  </equation*>

  Since linear combinations of intervals <math|I<rsub|<around|[|0,s|]>>> are
  dense in <math|L<rsup|2><around|[|0,1|]>>, it follows that <math|H<rsub|0>>
  is dense in the space of all functions <math|\<varphi\>:<around|[|0,1|]>\<rightarrow\>\<bbb-R\>>
  with <math|L<rsup|2>>\Uderivative <math|\<varphi\><rprime|'>> and
  <math|\<varphi\><around|(|0|)>=0>. Consequently, this space is the
  reproducing kernel Hilbert space for Brownian motion. It is sometimes
  called the Cameron-Martin Hilbert space.

  <with|font-series|bold|Example 3.3.> The Ornstein-Uhlenbeck process
  <math|<around|{|Y<rsub|t>|}><rsub|t\<in\>\<bbb-R\>>> is best viewed as a
  process whose parameter space is the entire real line, since it is
  stationary. This space isn't compact, so Proposition 3.6 does not apply.
  Nevertheless, the reproducing kernel Hilbert space remains a useful object.

  <with|font-series|bold|Proposition 3.8.> The reproducing kernel Hilbert
  space <math|H> associated with the double-exponential kernel
  <math|R*<around|(|s,t|)>=e<rsup|-<around|\||t-s|\|>>> consists of all
  functions <math|\<varphi\>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>> whose
  derivative <math|\<varphi\><rprime|'>> is also an element of
  <math|L<rsup|2><around|(|\<bbb-R\>|)>>. The inner product of the RKHS is
  given by

  <\equation*>
    <around|\<langle\>|\<varphi\>,\<psi\>|\<rangle\>>=<big|int>\<varphi\>*\<psi\>+<big|int>\<varphi\><rprime|'>*\<psi\><rprime|'>
  </equation*>

  <with|font-shape|italic|Proof.> Two things must be proved: first, that for
  the covariance kernel of the Ornstein-Uhlenbeck process the inner product
  (3.6) reduces to (3.16), and second, that the space <math|H<rsub|0>> is
  dense in the Hilbert space of functions
  <math|\<varphi\>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>> with derivative
  <math|\<varphi\><rprime|'>\<in\>L<rsup|2><around|(|\<bbb-R\>|)>>. I will
  skip the second, since we will have no further use for the result. For the
  first it suffices to prove that for any <math|s,t\<in\>\<bbb-R\>>,

  <\equation*>
    <around|\<langle\>|R<rsub|s>,R<rsub|t>|\<rangle\>>=R*<around|(|s,t|)>=<big|int>R<rsub|s>*R<rsub|t>+<big|int>R<rsub|s><rprime|'>*R<rsub|t><rprime|'>
  </equation*>

  This is an entirely routine calculation (which you should do, to be sure
  that I haven't missed any factors of 2 or <math|\<pi\>>). This proves that
  (3.16) holds for all functions in <math|H<rsub|0>>.\ 

  <with|font-shape|italic|Note:> The density proof isn't hard \U it can be
  done using standard elementary results of Fourier analysis. The Hilbert
  space <math|H> is the Sobolev space <math|H<rsup|1><around|(|\<bbb-R\>|)>>.

  <with|font-series|bold|Example 3.4.> Consider next a
  <with|font-shape|italic|moving average process>. Let
  <math|<around|{|a<rsub|k>|}><rsub|0\<leq\>k\<leq\>K>> be a finite sequence
  of real numbers, and let <math|<around|{|\<xi\><rsub|n>|}><rsub|n\<in\>\<bbb-Z\>>>
  be independent standard Gaussian random variables. The moving average
  process with averaging kernel <math|<around|{|a<rsub|k>|}>> is the centered
  Gaussian process <math|<around|{|X<rsub|n>|}><rsub|n\<in\>\<bbb-Z\>>>
  defined by

  <\equation*>
    X<rsub|n>=<big|sum><rsub|k=0><rsup|K>a<rsub|k>*\<xi\><rsub|n-k>.
  </equation*>

  <with|font-series|bold|Lemma 3.9.>

  <\equation*>
    E*X<rsub|n>*X<rsub|m>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|i*n*\<theta\>>*e<rsup|-i*m*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>*<space|0.17em>d*\<theta\>*<space|1em><text|where><space|1em>A<around|(|e<rsup|i*\<theta\>>|)>=<big|sum><rsub|k=0><rsup|K>a<rsub|k>*e<rsup|i*k*\<theta\>>.
  </equation*>

  This representation of the covariance kernel is called the
  <with|font-shape|italic|spectral representation>. The density
  <math|<around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>> is called
  the <with|font-shape|italic|spectral density> of the moving average
  process. For many purposes \U for instance, linear prediction \U the
  spectral representation is more useful than the time-domain representation.

  <with|font-shape|italic|Proof.> Since a moving average process is
  stationary in time, its covariance function
  <math|R<around|(|m,n|)>=E*X<rsub|n>*X<rsub|m>> depends only on the
  difference <math|m-n>. Set <math|r<rsub|k>=E*X<rsub|k>*X<rsub|0>>; then by
  the Fourier inversion formula, (3.18) is equivalent to the assertion that
  the Fourier series of the sequence <math|r<rsub|k>> sums (in
  <math|L<rsup|2><around|[|-\<pi\>,\<pi\>|]>>) to
  <math|<around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>>. That this
  is so can be seen as follows. First, since the random variables
  <math|\<xi\><rsub|n>> are i.i.d. standard Gaussians,

  <\equation*>
    r<rsub|k>=E*X<rsub|k>*X<rsub|0>=E*<big|sum><rsub|m><big|sum><rsub|n>a<rsub|m>*\<xi\><rsub|k-m>*a<rsub|n>*\<xi\><rsub|-n>=<big|sum><rsub|m>a<rsub|k>*a<rsub|m+k>
  </equation*>

  Therefore,

  <\equation*>
    <big|sum><rsub|k>r<rsub|k>*e<rsup|i*k*\<theta\>>=<big|sum><rsub|k><big|sum><rsub|m>a<rsub|k>*a<rsub|m+k>*e<rsup|i*k*\<theta\>>=<big|sum><rsub|k><big|sum><rsub|m>a<rsub|k>*a<rsub|m+k>*e<rsup|i*<around|(|k+m|)>*\<theta\>>*e<rsup|-i*m*\<theta\>>=<around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>
  </equation*>

  The spectral representation (3.18) of the covariance kernel can be used to
  give a corresponding spectral description of the reproducing kernel Hilbert
  space. Let's identify a section <math|R<rsub|m><around|(|n|)>=r<rsub|n-m>>
  with its Fourier series:

  <\equation*>
    R<rsub|m>\<longleftrightarrow\><big|sum><rsub|k>r<rsub|k-m>*e<rsup|i*m*\<theta\>>=e<rsup|i*m*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>
  </equation*>

  The inner product on the reproducing kernel Hilbert space is determined by
  the law <math|<around|(|R<rsub|m>,R<rsub|n>|)>=R<around|(|m,n|)>=r<rsub|m-n>>.
  Now Lemma 3.9 implies that

  <\equation*>
    r<rsub|m-n>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|-i*m*\<theta\>>*e<rsup|i*n*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>*<space|0.17em>d*\<theta\>
  </equation*>

  <\equation*>
    =<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>><around|(|e<rsup|-i*m*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>|)><around|(|e<rsup|i*n*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>|)><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|-2>*<space|0.17em>d*\<theta\>
  </equation*>

  <with|font-shape|italic|Note:> The density proof isn't hard \U it can be
  done using standard elementary results of Fourier analysis. The Hilbert
  space <math|H> is the Sobolev space <math|H<rsup|1><around|(|\<bbb-R\>|)>>.

  <with|font-series|bold|Example 3.4.> Consider next a
  <with|font-shape|italic|moving average process>. Let
  <math|<around|{|a<rsub|k>|}><rsub|0\<leq\>k\<leq\>K>> be a finite sequence
  of real numbers, and let <math|<around|{|\<xi\><rsub|n>|}><rsub|n\<in\>\<bbb-Z\>>>
  be independent standard Gaussian random variables. The moving average
  process with averaging kernel <math|<around|{|a<rsub|k>|}>> is the centered
  Gaussian process <math|<around|{|X<rsub|n>|}><rsub|n\<in\>\<bbb-Z\>>>
  defined by

  <\equation*>
    X<rsub|n>=<big|sum><rsub|k=0><rsup|K>a<rsub|k>*\<xi\><rsub|n-k>
  </equation*>

  <with|font-series|bold|Lemma 3.9.>

  <\equation*>
    E*X<rsub|n>*X<rsub|m>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|i*n*\<theta\>>*e<rsup|-i*m*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>*<space|0.17em>d*\<theta\>*<space|1em><text|where><space|1em>A<around|(|e<rsup|i*\<theta\>>|)>=<big|sum><rsub|k=0><rsup|K>a<rsub|k>*e<rsup|i*k*\<theta\>>
  </equation*>

  This representation of the covariance kernel is called the
  <with|font-shape|italic|spectral representation>. The density
  <math|<around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>> is called
  the <with|font-shape|italic|spectral density> of the moving average
  process. For many purposes \U for instance, linear prediction \U the
  spectral representation is more useful than the time-domain representation.

  <with|font-shape|italic|Proof.> Since a moving average process is
  stationary in time, its covariance function
  <math|R<around|(|m,n|)>=E*X<rsub|n>*X<rsub|m>> depends only on the
  difference <math|m-n>. Set <math|r<rsub|k>=E*X<rsub|k>*X<rsub|0>>; then by
  the Fourier inversion formula, (3.18) is equivalent to the assertion that
  the Fourier series of the sequence <math|r<rsub|k>> sums (in
  <math|L<rsup|2><around|[|-\<pi\>,\<pi\>|]>>) to
  <math|<around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>>. That this
  is so can be seen as follows. First, since the random variables
  <math|\<xi\><rsub|n>> are i.i.d. standard Gaussians,

  <\equation*>
    r<rsub|k>=E*X<rsub|k>*X<rsub|0>=E*<big|sum><rsub|m><big|sum><rsub|n>a<rsub|m>*\<xi\><rsub|k-m>*a<rsub|n>*\<xi\><rsub|-n>=<big|sum><rsub|m>a<rsub|k>*a<rsub|m+k>
  </equation*>

  Therefore,

  <\equation*>
    <big|sum><rsub|k>r<rsub|k>*e<rsup|i*k*\<theta\>>=<big|sum><rsub|k><big|sum><rsub|m>a<rsub|k>*a<rsub|m+k>*e<rsup|i*k*\<theta\>>=<big|sum><rsub|k><big|sum><rsub|m>a<rsub|k>*a<rsub|m+k>*e<rsup|i*<around|(|k+m|)>*\<theta\>>*e<rsup|-i*m*\<theta\>>=<around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>
  </equation*>

  The spectral representation (3.18) of the covariance kernel can be used to
  give a corresponding spectral description of the reproducing kernel Hilbert
  space. Let's identify a section <math|R<rsub|m><around|(|n|)>=r<rsub|n-m>>
  with its Fourier series:

  <\equation*>
    R<rsub|m>\<longleftrightarrow\><big|sum><rsub|k>r<rsub|k-m>*e<rsup|i*m*\<theta\>>=e<rsup|i*m*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>
  </equation*>

  The inner product on the reproducing kernel Hilbert space is determined by
  the law <math|<around|(|R<rsub|m>,R<rsub|n>|)>=R<around|(|m,n|)>=r<rsub|m-n>>.
  Now Lemma 3.9 implies that

  <\equation*>
    r<rsub|m-n>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|-i*m*\<theta\>>*e<rsup|i*n*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>*<space|0.17em>d*\<theta\>
  </equation*>

  <\equation*>
    =<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>><around|(|e<rsup|-i*m*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>|)><around|(|e<rsup|i*n*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>|)><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|-2>*<space|0.17em>d*\<theta\>
  </equation*>

  Thus, with the identification (3.19), the inner product on the reproducing
  kernel Hilbert space corresponds to the inner product

  <\equation*>
    <around|\<langle\>|f,g|\<rangle\>>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>f<around|(|\<theta\>|)><wide|g<around|(|\<theta\>|)>|\<bar\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|-2>*d*\<theta\>
  </equation*>

  Therefore, the identification (3.19) extends to a linear isometry of the
  reproducing kernel Hilbert space onto the Hilbert space <math|H> of all
  complex functions <math|f:<around|[|-\<pi\>,\<pi\>|]>\<rightarrow\>\<bbb-C\>>
  with real Fourier coefficients that satisfy

  <\equation*>
    <around|\<\|\|\>|f|\<\|\|\>><rsup|2>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>><around|\||f<around|(|\<theta\>|)><around|\||<rsup|2>|\|>*A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|-2>*d*\<theta\>\<less\>\<infty\>
  </equation*>

  (Note: Even though this expression involves complex numbers, the Hilbert
  space <math|H> is actually a real Hilbert space, because functions
  <math|f<around|(|\<theta\>|)>> with real Fourier coefficients satisfy
  <math|f<around|(|\<theta\>|)>=<wide|f*<around|(|-\<theta\>|)>|\<bar\>>>, so
  the inner product can be rewritten as an integral over the interval
  <math|<around|[|0,\<pi\>|]>> using only the real parts of the functions.)

  Finally, let's give a complete description of the reproducing kernel
  Hilbert space itself. Since <math|T=\<bbb-Z\>>, the sections
  <math|R<rsub|m>> of the covariance are two-sided sequences, and the law
  <math|<around|\<langle\>|R<rsub|m>,R<rsub|n>|\<rangle\>>=R*<around|(|m,n|)>=r<rsub|m-n>>
  for the inner product can be expressed explicitly as

  <\equation*>
    r<rsub|m-n>=<big|sum><rsub|n>R<rsub|m-s>*k<rsub|n-t>*r<rsub|n-t>
  </equation*>

  our problem is to determine the appropriate sequence <math|s<rsub|j>>. But
  this can be gotten using the fact that the Fourier transform is an
  <math|L<rsup|2>>\Uisometry (or alternatively using the Fourier inversion
  formula); in particular, the right side of (3.21) can be written as

  <\equation*>
    <big|sum><rsub|m,n>R<rsub|m-s>*k<rsub|-n-t>*r<rsub|n-t>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|i*m*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>*S<around|(|e<rsup|i*\<theta\>>|)>*e<rsup|-i*n*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>*d*\<theta\>
  </equation*>

  where <math|S<around|(|e<rsup|i*\<theta\>>|)>=<big|sum><rsub|k>s<rsub|k>*e<rsup|i*k*\<theta\>>>.
  Here we have used the fact that the Fourier series of the sequence
  <math|r<rsub|k>> is <math|<around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|2>>.
  This shows that

  <\equation*>
    S<around|(|e<rsup|i*\<theta\>>|)>=<around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|-2>
  </equation*>

  and so the coefficients <math|s<rsub|k>> in the inner product (3.21) can be
  recovered by another Fourier inversion:

  <\equation*>
    s<rsub|k>=<frac|1|2*\<pi\>>*<big|int><rsub|-\<pi\>><rsup|\<pi\>>e<rsup|-i*k*\<theta\>><around|\||A<around|(|e<rsup|i*\<theta\>>|)>|\|><rsup|-2>*d*\<theta\>
  </equation*>

  <with|font-series|bold|Exercise 3.3.> Assume that the polynomial
  <math|A<around|(|z|)>=<big|sum><rsub|k=1><rsup|K>a<rsub|k>*z<rsup|k>> has
  <math|K> distinct roots <math|\<zeta\><rsub|j>> all located outside the
  unit disk. Use partial fractions to give explicit formulas for the
  coefficients <math|s<rsub|k>>. What happens when some of the roots of
  <math|A<around|(|z|)>> are inside the unit circle?

  <section*|4. SINGULARITY AND ABSOLUTE CONTINUITY>

  Let <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> be a centered,
  nondegenerate Gaussian process with (positive definite) covariance function
  <math|R*<around|(|s,t|)>>, and assume that the index set <math|T> is
  compact relative to the canonical metric <math|d>. Assume also that the
  sample paths <math|t\<rightarrow\>X<rsub|t>> are continuous. Given a
  non-random, continuous function <math|f:T\<rightarrow\>\<bbb-R\>> \U the
  \Psignal\Q \U when can one distinguish between
  <math|<around|{|X<rsub|t>+f<rsub|t>|}><rsub|t\<in\>T>> and
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>?\ 

  More precisely, let <math|P> and <math|Q> be probability measures on the
  measurable space <math|<around|(|\<omega\>,\<cal-F\>|)>> such that under
  <math|P> the process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> is
  centered Gaussian with covariance function <math|R>, while under <math|Q>
  the process <math|<around|{|X<rsub|t>-f<rsub|t>|}><rsub|t\<in\>T>> is
  centered Gaussian with covariance function <math|R>. Assume that the
  <math|\<sigma\>>\Ualgebra <math|\<cal-F\>> is generated by the random
  variables <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>. Recall that there
  is a linear isometry <math|J<rsub|X>:H\<rightarrow\>L<rsup|2><around|(|P|)>>
  that maps <math|R<rsub|t>> to the coordinate variable <math|X<rsub|t>> (see
  equation (3.7)).

  <with|font-series|bold|Theorem 5.> The probability measures <math|P,Q> are
  mutually singular on <math|<around|(|\<Omega\>,\<cal-F\>|)>> unless
  <math|f> is an element of the reproducing kernel Hilbert space <math|H> of
  <math|R>. If <math|f\<in\>H> then <math|P,Q> are mutually absolutely
  continuous, with likelihood ratio (Radon-Nikodym derivative)

  <\equation*>
    <frac|d*Q|d*P><mid|\|><rsub|\<cal-F\>>=exp
    <around|{|J<rsub|X><around|(|f|)>-<around|\<\|\|\>|f|\<\|\|\>><rsup|2>/2|}>
  </equation*>

  <with|font-shape|italic|Remark 2.> In the special case where
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> is the Wiener process on
  <math|T=<around|[|0,1|]>> this theorem was discovered and proved by Cameron
  and Martin around 1945. In this case the isometry <math|J<rsub|X>> is the
  usual Wiener integral. Later Girsanov extended the Cameron-Martin formula
  (4.2) for the likelihood ratio to certain <with|font-shape|italic|random>
  functions <math|f> given as stochastic integrals.

  Before turning to the proof of Theorem 5 let's look at the related but at
  least superficially simpler problem of distinguishing signal plus noise
  from noise for <with|font-shape|italic|white noise>. Here
  <math|T=\<bbb-N\>>, and the covariance function is the simplest of all
  possible covariance functions, to wit, <math|R<around|(|i,j|)>=\<delta\><rsub|i,j>>;
  thus, the Gaussian process <math|<around|{|X<rsub|n>|}>> consists of
  independent, identically distributed standard Gaussian random variables.
  The \Psignal\Q is a fixed non-random sequence
  <math|<around|{|a<rsub|n>|}><rsub|n\<in\>\<bbb-N\>>> of real numbers. Let
  the probability measures <math|\<mu\>> and <math|\<nu\>> be the joint
  distributions of the sequences <math|<around|{|X<rsub|n>|}>> and
  <math|<around|{|X<rsub|n>+a<rsub|n>|}>>, respectively.

  <with|font-series|bold|Theorem 6. (Kakutani)> The measures <math|\<mu\>>
  and <math|\<nu\>> are absolutely continuous if
  <math|<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>\<less\>\<infty\>>, and
  mutually singular if <math|<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>=\<infty\>>.
  If <math|<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>\<less\>\<infty\>> then
  the series <math|<big|sum><rsub|n\<geq\>1>a<rsub|n>*y<rsub|n>> converges
  almost surely under <math|\<mu\>> and

  <\equation*>
    <frac|d*\<nu\>|d*\<mu\>><mid|\|><rsub|<around|(|y<rsub|n>|)><rsub|n\<geq\>1>>=L<rsub|\<infty\>>=exp
    <around*|{|<big|sum><rsub|n\<geq\>1>a<rsub|n>*y<rsub|n>-<frac|1|2>*<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>|}>
  </equation*>

  <with|font-shape|italic|Proof.> First some generalities. Let
  <math|\<mu\>,\<nu\>> be two probability measures on
  <math|<around|(|\<bbb-R\><rsup|\<infty\>>,\<cal-F\><rsub|\<infty\>>|)>>,
  where <math|\<cal-F\><rsub|\<infty\>>> is the usual Borel field, that is,
  the smallest <math|\<sigma\>>\Ualgebra that contains all cylinder sets. For
  each <math|n\<in\>\<bbb-N\>> denote by <math|\<cal-F\><rsub|n>> the
  <math|\<sigma\>>\Ualgebra generated by the first <math|n> coordinate
  variables. Suppose that the restrictions of <math|\<mu\>> and <math|\<nu\>>
  to <math|\<cal-F\><rsub|n>> are mutually absolutely continuous for each
  <math|n> (this is the case, for instance, when <math|\<mu\>> and
  <math|\<nu\>> are the laws of any two nondegenerate Gaussian processes, or
  when <math|\<mu\>> and <math|\<nu\>> are product measures where each factor
  is absolutely continuous relative to Lebesgue measure on <math|\<bbb-R\>>).
  Then the sequence

  <\equation*>
    L<rsub|n>\<assign\><around*|(|<frac|d*\<nu\>|d*\<mu\>><mid|\|>\<cal-F\><rsub|n>|)>
  </equation*>

  of likelihood ratios is a positive martingale under <math|\<mu\>> relative
  to the filtration <math|<around|{|\<cal-F\><rsub|n>|}><rsub|n\<geq\>1>>,
  and hence converges to a nonnegative limit <math|L<rsub|\<infty\>>> almost
  surely. (Exercise: Verify that <math|L<rsub|n>> is a martingale.) There are
  two interesting cases:

  <\itemize>
    <item*|(a)><math|E<rsub|\<mu\>>*L<rsub|\<infty\>>=1>, and

    <item*|(b)><math|\<mu\>*<around|{|L<rsub|\<infty\>>=0|}>=1>
  </itemize>

  These are not the only possibilities, in general, but in both the Gaussian
  cases and in the case of product measures either (a) or (b) will hold. In
  case (a) the martingale <math|L<rsub|n>> is closed, that is,
  <math|L<rsub|n>=E<around|(|L<rsub|\<infty\>>\|\<cal-F\><rsub|n>|)>> for
  each <math|n> and <math|L<rsub|n>\<rightarrow\>L<rsub|\<infty\>>> in
  <math|L<rsup|1>>. In this case the measures <math|\<mu\>> and <math|\<nu\>>
  are absolutely continuous on <math|\<cal-F\><rsub|\<infty\>>>, with
  Radon-Nikodym derivative <math|L<rsub|\<infty\>>>, because for any
  <math|F\<in\>\<cal-F\><rsub|n>>,

  <\equation*>
    E<rsub|\<mu\>>*L<rsub|\<infty\>>*1<rsub|F>=E<rsub|\<mu\>>*L<rsub|n>*1<rsub|F>=\<nu\><around|(|F|)>
  </equation*>

  and so the measures <math|\<nu\>> and <math|F\<mapsto\>E<rsub|\<mu\>>*L<rsub|\<infty\>>*1<rsub|F>>
  agree on <math|<big|cup><rsub|n\<geq\>1>\<cal-F\><rsub|n>>. In case (b), on
  the other hand, the measures <math|\<mu\>> and <math|\<nu\>> are singular
  on <math|\<cal-F\><rsub|\<infty\>>>. To see this, first note that if
  <math|L<rsub|n>\<rightarrow\>0> a.s. under <math|\<mu\>> then there is a
  sequence of constants <math|\<varepsilon\><rsub|n>\<gtr\>0> such that
  <math|\<varepsilon\><rsub|n>\<rightarrow\>0> and such that with
  <math|\<mu\>>\Uprobability 1,

  <\equation*>
    \<mu\>*<around|(|L<rsub|n>\<leq\>\<varepsilon\><rsub|n><text|eventually>|)>=1
  </equation*>

  (<with|font-shape|italic|Exercise:> Prove this.) Define
  <math|\<tau\><rsub|m>> to be the first time <math|n\<geq\>m> that
  <math|L<rsub|n>\<leq\>\<varepsilon\><rsub|n>>, and let <math|F<rsub|m>> be
  the event <math|<around|{|\<tau\><rsub|m>\<less\>\<infty\>|}>>. These
  events are nested: <math|F<rsub|m>\<supseteq\>F<rsub|m+1>> for each
  <math|m>. By construction, <math|\<mu\><around|(|F<rsub|m>|)>=1> for every
  <math|m\<geq\>1>, and hence <math|\<mu\><around|(|<big|cap><rsub|m>F<rsub|m>|)>=1>.
  But for each <math|m\<geq\>1>,

  <\equation*>
    \<nu\><around|(|F<rsub|m>|)>=<big|sum><rsub|n=m><rsup|\<infty\>>\<nu\>*<around|(|\<tau\><rsub|m>=n|)>=<big|sum><rsub|n=m><rsup|\<infty\>>E<rsub|\<mu\>>*L<rsub|n>*1<rsub|<around|{|\<tau\><rsub|m>=n|}>>=E<rsub|\<mu\>>*L<rsub|\<tau\><rsub|m>>\<leq\>\<varepsilon\><rsub|m>
  </equation*>

  Consequently, <math|\<nu\><around|(|<big|cap><rsub|m>F<rsub|m>|)>=0>.

  Now to Kakutani's theorem: Under <math|\<mu\>> the coordinate variables
  <math|y<rsub|n>> are i.i.d. standard Gaussian, whereas under <math|\<nu\>>
  they are independent Gaussians with means <math|a<rsub|n>> and variances 1.
  Thus, the likelihood ratio on <math|\<cal-F\><rsub|n>> is

  <\equation*>
    L<rsub|n>=exp <around|{|A<rsub|n>*z<rsub|n>-A<rsub|n><rsup|2>/2|}>*<space|1em><text|where><space|1em>A<rsub|n><rsup|2>=<big|sum><rsub|j=1><rsup|n>a<rsub|j><rsup|2>*<space|1em><text|and><space|1em>z<rsub|n>=<big|sum><rsub|j=1><rsup|n>a<rsub|j>*y<rsub|j>/A<rsub|n>
  </equation*>

  If <math|A=<big|sum>a<rsub|j><rsup|2>\<less\>\<infty\>> then the series
  <math|<big|sum><rsub|j=1>a<rsub|j>*y<rsub|j>> converges almost surely and
  in <math|L<rsup|2><around|(|\<mu\>|)>>, and the limit random variable is
  centered Gaussian with variance <math|A>. Consequently,
  <math|L<rsub|n>\<rightarrow\>L<rsub|\<infty\>>> where half of the theorem.
  Suppose then that <math|<big|sum>a<rsub|j><rsup|2>=\<infty\>>. Under
  <math|\<nu\>> the random variable <math|z<rsub|n>> is standard Gaussian,
  and so

  <\equation*>
    lim<rsub|n\<rightarrow\>\<infty\>> \<mu\>*<around|{|A<rsub|n>*z<rsub|n>\<gtr\>A<rsub|n><rsup|2>/4|}>=0
  </equation*>

  This implies that <math|L<rsub|n>\<rightarrow\>0> in
  <math|\<mu\>>\Uprobability. But the martingale convergence theorem implies
  that <math|L<rsub|n>\<rightarrow\>L<rsub|\<infty\>>> almost surely under
  <math|\<mu\>>, and so it follows that <math|L<rsub|\<infty\>>=0> a.s.
  <math|\<mu\>>.

  <with|font-shape|italic|Proof of Theorem 5.> Since <math|T> is compact it
  has a countable dense subset <math|D=<around|{|s<rsub|1>,s<rsub|2>,\<ldots\>|}>>.
  The strategy of the proof will be to reduce the problem to the situation
  covered by Kakutani's theorem by applying Gram-Schmidt to the random
  variables <math|X<rsub|s<rsub|1>>,X<rsub|s<rsub|2>>,\<ldots\>>.

  Assume then that under <math|P> the process
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> is centered Gaussian with
  covariance function <math|R<around|(|s,t|)>>, and that under <math|Q> the
  process <math|<around|{|X<rsub|t>-f<rsub|t>|}><rsub|t\<in\>T>> is centered
  Gaussian with covariance function <math|R<around|(|s,t|)>>. Assume also
  that under both <math|P> and <math|Q> the sample paths
  <math|t\<rightarrow\>X<rsub|t>> are continuous; this implies that the
  <math|\<sigma\>>\Ualgebra <math|\<cal-F\>> generated by the entire family
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> coincides with the
  <math|\<sigma\>>\Ualgebra <math|\<cal-F\>> generated by
  <math|<around|{|X<rsub|t>|}><rsub|t\<in\>D>>, and so

  <\equation*>
    \<cal-F\>=\<sigma\><around*|(|<big|cup><rsub|n\<geq\>1>\<cal-F\><rsub|n>|)>
  </equation*>

  where <math|\<cal-F\><rsub|n>=\<sigma\><around|(|<around|(|X<rsub|s>|)><rsub|s\<in\>D<rsub|n>>|)>>.
  Let <math|\<xi\><rsub|1>,\<xi\><rsub|2>,\<ldots\>> be the random variables
  obtained by applying the Gram-Schmidt algorithm to the sequence
  <math|X<rsub|s<rsub|1>>,X<rsub|s<rsub|2>>,\<ldots\>>, that is,

  <\equation*>
    \<xi\><rsub|1>=X<rsub|s<rsub|1>>/R<around|(|s<rsub|1>,s<rsub|1>|)><rsup|1/2>
  </equation*>

  <\equation*>
    \<xi\><rsub|2>=<around|(|X<rsub|s<rsub|2>>-R<around|(|s<rsub|2>,s<rsub|1>|)>*X<rsub|s<rsub|1>>/R<around|(|s<rsub|1>,s<rsub|1>|)>|)>/<around|(|R<around|(|s<rsub|1>,s<rsub|1>|)>-R<around|(|s<rsub|2>,s<rsub|1>|)><rsup|2>/R<around|(|s<rsub|1>,s<rsub|1>|)>|)><rsup|1/2>
  </equation*>

  etc.

  Since we have assumed that the covariance kernel <math|R<around|(|s,t|)>>
  is positive definite, the random variables
  <math|<around|{|X<rsub|s<rsub|j>>|}><rsub|j\<geq\>1>> are linearly
  independent in <math|L<rsup|2><around|(|P|)>>, and hence the Gram-Schmidt
  mapping (4.4) is well-defined (that is, there are no divisions by 0).
  Observe that for each <math|n\<geq\>1> the Gram-Schmidt equations (4.4) can
  be written in matrix form:

  <\equation*>
    <matrix|<tformat|<table|<row|<cell|\<xi\><rsub|1>>>|<row|<cell|\<xi\><rsub|2>>>|<row|<cell|\<vdots\>>>|<row|<cell|\<xi\><rsub|n>>>>>>=T<rsub|n><matrix|<tformat|<table|<row|<cell|X<rsub|s<rsub|1>>>>|<row|<cell|X<rsub|s<rsub|2>>>>|<row|<cell|\<vdots\>>>|<row|<cell|X<rsub|s<rsub|n>>>>>>>
  </equation*>

  where for each <math|n> the matrix <math|T<rsub|n>> is lower triangular and
  invertible. Consequently, for each <math|n>,

  <\equation*>
    \<cal-F\><rsub|n>=\<sigma\><around|(|<around|{|\<xi\><rsub|i>|}><rsub|i\<leq\>n>|)>
  </equation*>

  Thus, the random variables <math|<around|{|\<xi\><rsub|n>|}>> generate the
  <math|\<sigma\>>-algebra <math|\<cal-F\>>. Note also that the entries of
  the matrices <math|T<rsub|n>> are determined solely by the entries
  <math|R<around|(|s<rsub|i>,s<rsub|j>|)>> with <math|i,j\<leq\>n>, and that
  for each <math|n> the <math|n\<times\>n> minor of <math|T<rsub|n+1>> is
  <math|T<rsub|n>>, that is,

  <\equation*>
    T<rsub|n>=<matrix|<tformat|<table|<row|<cell|b<rsub|1,1>>|<cell|0>|<cell|0>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|b<rsub|2,1>>|<cell|b<rsub|2,2>>|<cell|0>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|b<rsub|n,1>>|<cell|b<rsub|n,2>>|<cell|b<rsub|n,3>>|<cell|\<cdots\>>|<cell|b<rsub|n,n>>>>>>
  </equation*>

  for fixed scalars <math|b<rsub|i,j>>.

  By construction, the random variables <math|<around|{|\<xi\><rsub|n>|}><rsub|n\<geq\>1>>
  are independent, identically distributed standard Gaussians under <math|P>.
  Under <math|Q>, however, they are independent Gaussians with common
  variance 1, but with means <math|a<rsub|n>=E<rsub|Q>*\<xi\><rsub|n>>
  depending on the function <math|f>. These means can be computed by taking
  <math|E<rsub|Q>>\Uexpectations on both sides in (4.5): this implies that
  for each <math|n>,

  <\equation*>
    <matrix|<tformat|<table|<row|<cell|a<rsub|1>>>|<row|<cell|a<rsub|2>>>|<row|<cell|\<vdots\>>>|<row|<cell|a<rsub|n>>>>>>=T<rsub|n><matrix|<tformat|<table|<row|<cell|f<rsub|s<rsub|1>>>>|<row|<cell|f<rsub|s<rsub|2>>>>|<row|<cell|\<vdots\>>>|<row|<cell|f<rsub|s<rsub|n>>>>>>>
  </equation*>

  In particular, for each <math|n> the vector
  <math|<around|(|a<rsub|i>|)><rsub|i\<leq\>n>> is gotten by applying the
  Gram-Schmidt transformation to the vector
  <math|<around|(|f<rsub|s<rsub|i>>|)><rsub|i\<leq\>n>>.

  Suppose that <math|f\<in\>H>. Let <math|J<rsub|X>:H\<rightarrow\>L<rsup|2><around|(|P|)>>
  be the canonical linear isometry from the reproducing kernel Hilbert space
  <math|H> into <math|L<rsup|2><around|(|P|)>> (recall that this is
  determined by the identification <math|J<rsub|X><around|(|R<rsub|t>|)>=X<rsub|t>>),
  and let <math|\<psi\><rsub|n>=J<rsub|X><rsup|\<ast\>>*\<xi\><rsub|n>>.
  Since <math|J<rsub|X>> is a linear isometry, the sequence
  <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>> constitutes an
  orthonormal basis of <math|H>, and the functions <math|\<psi\><rsub|n>> are
  obtained from the sequence <math|R<rsub|s<rsub|1>>,R<rsub|s<rsub|2>>,\<ldots\>>
  by Gram-Schmidt, and for each <math|n> the linear transformation taking
  <math|<around|(|R<rsub|s<rsub|j>>|)><rsub|j\<leq\>n>> to
  <math|<around|(|\<psi\><rsub|j>|)><rsub|j\<leq\>n>> is the same as that
  taking <math|<around|(|X<rsub|s<rsub|j>>|)><rsub|j\<leq\>n>> to
  <math|<around|(|\<xi\><rsub|j>|)><rsub|j\<leq\>n>>. This implies that

  <\equation*>
    a<rsub|n>=<around|\<langle\>|f,\<psi\><rsub|n>|\<rangle\>>.
  </equation*>

  Since <math|f=<big|sum><rsub|n\<geq\>1><around|\<langle\>|f,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n>>,
  it follows that <math|<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>=<around|\<\|\|\>|f|\<\|\|\>><rsup|2>\<less\>\<infty\>>.
  Thus, Kakutani's theorem implies that in this case the measures <math|P>
  and <math|Q> are absolutely continuous, and the likelihood ratio is

  <\equation*>
    <frac|d*Q|d*P><mid|\|><rsub|\<cal-F\>>=exp
    <around*|{|<big|sum><rsub|n\<geq\>1>a<rsub|n>*\<xi\><rsub|n>-<frac|1|2>*<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>|}>
  </equation*>

  The formula (4.2) follows, because

  <\equation*>
    J<rsub|X><around|(|f|)>=<big|sum><rsub|n\<geq\>1>a<rsub|n>*\<xi\><rsub|n><space|1em><text|and><space|1em><around|\<\|\|\>|f|\<\|\|\>><rsup|2>=<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>
  </equation*>

  Now suppose that <math|f\<nin\>H>. For each <math|n\<geq\>1>, let
  <math|f<rsup|n>\<in\>H> be the unique linear combination in
  span<math|<around|{|R<rsub|s<rsub|j>>|}><rsub|j\<leq\>n>> such that
  <math|f<rsup|n><around|(|s<rsub|i>|)>=f<around|(|s<rsub|i>|)>> for each
  <math|i\<leq\>n>. There is such a linear combination, because for each
  <math|n> the matrix <math|R<around|(|s<rsub|i>,s<rsub|j>|)><rsub|i,j\<leq\>n>>
  is positive definite, and hence invertible. For each <math|n> the means
  <math|<around|(|a<rsub|i>|)><rsub|i\<leq\>n>> are related to the entries
  <math|<around|(|f<rsub|s<rsub|i>>|)><rsub|i\<leq\>n>> by (4.6), and so

  <\equation*>
    <matrix|<tformat|<table|<row|<cell|a<rsub|1>>>|<row|<cell|a<rsub|2>>>|<row|<cell|\<vdots\>>>|<row|<cell|a<rsub|n>>>>>>=T<rsub|n><matrix|<tformat|<table|<row|<cell|f<rsub|s<rsub|1>>>>|<row|<cell|f<rsub|s<rsub|2>>>>|<row|<cell|\<vdots\>>>|<row|<cell|f<rsub|s<rsub|n>>>>>>>
  </equation*>

  But since <math|f<rsup|n>> is a linear combination of the functions
  <math|<around|(|R<rsub|s<rsub|j>>|)><rsub|j\<leq\>n>>, it follows that for
  <math|1\<leq\>m\<leq\>n>,

  <\equation*>
    a<rsub|m>=<around|\<langle\>|f<rsup|n>,\<psi\><rsub|m>|\<rangle\>>,
  </equation*>

  and so

  <\equation*>
    <big|sum><rsub|j=1><rsup|n>a<rsub|j><rsup|2>=<around|\<\|\|\>|f<rsup|n>|\<\|\|\>><rsup|2>.
  </equation*>

  Now if it were the case that <math|<big|sum><rsub|j=1><rsup|\<infty\>>a<rsub|j><rsup|2>=<around|\<\|\|\>|f<rsup|n>|\<\|\|\>><rsup|2>\<less\>\<infty\>>
  then <math|g=<big|sum><rsub|n\<geq\>1>a<rsub|n>*\<psi\><rsub|n>\<in\>H>,
  and the last two equations would imply that for each <math|n> the function
  <math|f<rsup|n>> is the orthogonal projection of <math|g> on the subspace
  spanned by the functions <math|<around|(|R<rsub|s<rsub|j>>|)><rsub|j\<leq\>n>>.
  But this would imply that <math|g<around|(|s<rsub|i>|)>=f<around|(|s<rsub|i>|)>>
  for every <math|i\<geq\>1>, and since the sequence
  <math|<around|(|s<rsub|i>|)><rsub|i\<geq\>1>> is dense in <math|T> it would
  follow that <math|f=g> everywhere. Since we have assumed that
  <math|f\<nin\>H> this cannot be the case. Therefore,
  <math|<big|sum><rsub|n=1><rsup|\<infty\>>a<rsub|n><rsup|2>=\<infty\>>, and
  Kakutani's theorem implies that <math|P> and <math|Q> are mutually
  singular.

  <\padded-center>
    <with|font-shape|italic|University of Chicago, Department of Statistics,
    USA>
  </padded-center>
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
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_53.tm>>
    <associate|auto-2|<tuple|?|4|../../.TeXmacs/texts/scratch/no_name_53.tm>>
    <associate|auto-3|<tuple|?|4|../../.TeXmacs/texts/scratch/no_name_53.tm>>
    <associate|auto-4|<tuple|?|7|../../.TeXmacs/texts/scratch/no_name_53.tm>>
    <associate|auto-5|<tuple|?|9|../../.TeXmacs/texts/scratch/no_name_53.tm>>
    <associate|auto-6|<tuple|?|9|../../.TeXmacs/texts/scratch/no_name_53.tm>>
    <associate|auto-7|<tuple|?|11|../../.TeXmacs/texts/scratch/no_name_53.tm>>
    <associate|auto-8|<tuple|1|16|../../.TeXmacs/texts/scratch/no_name_53.tm>>
    <associate|auto-9|<tuple|1|21|../../.TeXmacs/texts/scratch/no_name_53.tm>>
    <associate|footnote-1|<tuple|1|15|../../.TeXmacs/texts/scratch/no_name_53.tm>>
    <associate|footnr-1|<tuple|1|15|../../.TeXmacs/texts/scratch/no_name_53.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.
      DEFINITIONS AND EXAMPLES> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.
      CONTINUOUS EXTENSIONS AND MAXIMA OF GAUSSIAN PROCESSES>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1. Continuity.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2. Maximum of a Gaussian process.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.
      REPRODUCING KERNEL HILBERT SPACE OF A GAUSSIAN PROCESS>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1. The Wiener Integral.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2. Reproducing Kernel Hilbert Space.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|3.3. Examples of RKHS.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.
      SINGULARITY AND ABSOLUTE CONTINUITY>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>