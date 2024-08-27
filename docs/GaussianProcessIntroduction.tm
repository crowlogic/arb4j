<TeXmacs|2.1.4>

<style|<tuple|generic|alt-colors|framed-theorems>>

<\body>
  <doc-data|<doc-title|Gaussian Processes>|<doc-author|<author-data|<author-name|Steve
  P. Lalley>|<\author-affiliation>
    Heavily Edited by Stephen Crowley (no affiliation with the univ of
    chicago)
  </author-affiliation>>>>\ 

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1. Definitions
    and Examples> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2. Continuous
    Extensions and Maxima of Gaussian Processes>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1. Continuity <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|2.2. Maximum of a Gaussian process.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3. Reproducing
    Kernel Hilbert Space of a Gaussian Process>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|3.2. Reproducing Kernel Hilbert Space.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|3.3. Examples of RKHS.
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4. Mutual
    Singularity and Absolute Continuity> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    <with|par-left|1tab|1<space|2spc>Distinguishibility Of Measures
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|2<space|2spc>Intuition
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>
  </table-of-contents>

  <section*|1. Definitions and Examples>

  <\definition>
    A <with|font-shape|italic|Gaussian process>
    <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> indexed by a set <math|T> is
    a family of (real-valued) random variables <math|X<rsub|t>>, all defined
    on the same probability space, such that for any finite subset
    <math|F\<subseteq\>T> the random vector
    <math|X<rsub|F>=<around|(|X<rsub|t<rsub|1>>,X<rsub|t<rsub|2>>,\<ldots\>,X<rsub|t<rsub|n>>|)>>
    has a (possibly degenerate) Gaussian distribution; if these
    finite-dimensional distributions are all non-degenerate then the Gaussian
    process is said to be non-degenerate. Equivalently,
    <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> is Gaussian if every finite
    linear combination <math|<big|sum><rsub|t\<in\>F>a<rsub|t>*X<rsub|t>> is
    either identically zero or has a Gaussian distribution on
    <math|\<bbb-R\>>. A Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>
    is <with|font-shape|italic|centered> if <math|E*X<rsub|t>=0> for every
    <math|t\<in\>T>, and its covariance function is the (symmetric) bivariate
    function

    <\equation>
      R<around|(|s,t|)>=<math-up|cov><around|(|X<rsub|s>,X<rsub|t>|)>=E*<around|(|X<rsub|s>*X<rsub|t>|)>-E*X<rsub|s>*E*X<rsub|t>
    </equation>
  </definition>

  <\definition>
    The <with|font-shape|italic|canonical metric> <math|d> associated with a
    non-degenerate Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>
    is

    <\equation>
      d<around|(|s,t|)>=<sqrt|E*<around|(|X<rsub|s>-X<rsub|t>|)><rsup|2>>
    </equation>
  </definition>

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

  <\equation>
    P*<around|(|X\<in\>B|)>=P*<around|(|Y\<in\>B|)>
  </equation>

  Since any event can be arbitrarily well-approximated by events that depend
  on only finitely many coordinates, it follows that the equality holds for
  <with|font-shape|italic|all> events <math|B>. Therefore, the processes
  <math|X> and <math|Y> are identical in law.

  <section*|2. Continuous Extensions and Maxima of Gaussian Processes>

  <subsection*|2.1. Continuity>

  Keep in mind that there are covariance functions <math|R> that exist such
  that no centered Gaussian process with covariance function <math|R> has
  continuous sample paths and there are also
  <with|font-shape|italic|continuous> covariance functions that exist that do
  not have versions with continous sample paths.

  <\definition>
    Let <math|<around|(|T,d|)>> be a compact metric space. For each
    <math|\<varepsilon\>\<gtr\>0> the Lebesgue covering number
    <math|N<around|(|\<varepsilon\>|)>> is the minimum number of (open)
    <math|\<varepsilon\>>-balls needed to cover <math|T>.
  </definition>

  <\theorem>
    \ Let <math|d> be the canonical metric of a non-degenerate, centered
    Gaussian process <math|<around|{|X<rsub|i>|}><rsub|i\<in\>T>>, and let
    <math|N<around|(|\<varepsilon\>|)>> be the Lebesgue covering function. If
    for some <math|\<rho\>\<gtr\>0>

    <\equation>
      <big|int><rsub|0><rsup|\<rho\>>log N<around|(|\<varepsilon\>|)>*d*\<varepsilon\>\<less\>\<infty\>
    </equation>

    then the Gaussian process has a version with uniformly continuous sample
    paths. Consequently (since <math|T> is compact), for this version,

    <\equation>
      sup<rsub|i\<in\>T> X<rsub|i>=max<rsub|i\<in\>T>
      X<rsub|i><space|1em><text|a.s.>
    </equation>
  </theorem>

  <\remark>
    This result can then also be used as an extension theorem. In particular,
    if <math|<around|(|T,d|)>> is not a complete metric space then the
    theorem implies that under the assumption
    <math|<big|int><rsub|0><rsup|\<varepsilon\>>log
    N<around|(|\<eta\>|)>*d*\<eta\>\<less\>\<infty\>> the Gaussian process
    has a uniformly continuous extension to the completion of
    <math|<around|(|T,d|)>>, by the next lemma.
  </remark>

  <\lemma>
    <label|continuousExtension>Let <math|D> be a dense subset of a metric
    space <math|T>, and let <math|f:D\<rightarrow\>\<bbb-R\>> be uniformly
    continuous on <math|D>, i.e., for each <math|\<varepsilon\>\<gtr\>0>
    there exists <math|\<delta\>\<gtr\>0> such that

    <\equation>
      <around|\||f<around|(|y|)>-f<around|(|x|)>|\|>\<less\>\<varepsilon\>\<forall\>x,y\<in\>D
    </equation>

    \ for any two points <math|>at distance
    <math|d<around|(|x,y|)>\<less\>\<delta\>>. Then there is a unique
    uniformly continuous extension of <math|f> to <math|T>.
  </lemma>

  <with|font-shape|italic|Proof.> This is a routine exercise in elementary
  real analysis.

  <with|font-shape|italic|Proof of Theorem 1.> Assume without loss of
  generality that <math|\<rho\>=1> (if not, rescale). Fix <math|r\<geq\>4>,
  and for each <math|n=0,1,2,\<ldots\>> let <math|T<rsub|n>\<subset\>T> be a
  subset of <math|T> with cardinality <math|N<around|(|r<rsup|-n>|)>> such
  that the <math|r<rsup|-n>>-balls centered at the points of <math|T<rsub|n>>
  cover <math|T>. Clearly, the set

  <\equation>
    D=<big|cup><rsub|n\<geq\>0>T<rsub|n>
  </equation>

  \ is a countable dense subset of <math|T>. The plan will be to use
  Borel-Cantelli to show that with probability one the restriction of the
  Gaussian process to the index set <math|D> is uniformly continuous; Lemma
  <reference|continuousExtension> will then imply that there is a continuous
  extension to <math|T>. Define

  <\equation>
    D<rsub|n>=<big|cup><rsub|k=0><rsup|n>T<rsub|k>\<forall\>n\<geq\>0<label|Dn>
  </equation>

  ; the sets <math|D<rsub|n>> are nested, and <math|D<rsub|n>> has
  cardinality

  <\equation>
    N<rsub|n>\<leq\><around|(|n+1|)>*N<around|(|r<rsup|-n>|)>
  </equation>

  and so the hypothesis (???) implies that

  <\equation>
    <big|sum><rsub|n=0><rsup|\<infty\>><frac|A<rsub|n>|r<rsup|n>>=<big|sum><rsub|n=0><rsup|\<infty\>><frac|<sqrt|log
    <around|(|4<rsup|n>*N<rsub|n>|)>>|r<rsup|n>>\<less\>\<infty\>*
  </equation>

  where

  <\equation>
    A<rsub|n>=<sqrt|log <around|(|4<rsup|n>*N<rsub|n>|)>>
  </equation>

  <math|>Consider the events

  <\equation>
    B<rsub|n>=<around|{|\<exists\><space|0.17em>s,t\<in\>D<rsub|n>:<around|\||X<rsub|s>-X<rsub|t>|\|>\<geq\>A<rsub|n>*d<around|(|s,t|)>|}>
  </equation>

  Since there are at most <math|N<rsub|n><rsup|2>> pairs of points in
  <math|D<rsub|n>>, Bonferroni implies that

  <\equation>
    P<around|(|B<rsub|n>|)>\<leq\>C*N<rsub|n><rsup|2>*e<rsup|<around*|(|-n*log
    4-log N<rsub|n><rsup|2>|)>><rsup|>\<leq\>C*4<rsup|-n>
  </equation>

  Here <math|C> is any constant such that if <math|Z> is a standard Gaussian
  random variable then\ 

  <\equation>
    P*<around|(|<around|\||Z|\|>\<gtr\>x|)>\<leq\>C*e<rsup|-<frac|x<rsup|2>|2>>\<forall\>x\<geq\>0
  </equation>

  This is summable, so the Borel-Cantelli lemma implies that with probability
  one only finitely many of the events <math|B<rsub|n>> occur. In particular,
  w.p.1 there exists <math|K\<less\>\<infty\>> (random) such that

  <\equation>
    <big|sum><rsub|n\<geq\>1>B<rsub|n>=0
  </equation>

  We will show that this implies that the mapping
  <math|s\<rightarrow\>X<rsub|s>> is uniformly continuous on <math|D>.

  Fix <math|\<varepsilon\>\<gtr\>0>, and let
  <math|m=m<around|(|\<varepsilon\>|)>> be such that

  <\equation>
    <big|sum><rsub|n\<geq\>m>*<frac|A<rsub|n>|r<rsup|n>>\<less\>\<varepsilon\>
  </equation>

  Suppose that <math|s,t\<in\>D> are any two points at distance less than
  <math|r<rsup|-m>>. Let <math|l> \ be the smallest nonnegative integer
  <math|m> such that <math|s,t\<in\>D<rsub|m+1>>\ 

  <\equation>
    l=<around*|{|min<rsub|m>:s,t\<in\>D<rsub|m+1>|}>=<around*|{|min<rsub|m>:s,t\<in\><big|cup><rsub|k=0><rsup|m+1>T<rsub|k>|}>
  </equation>

  Then there exists a point chain\ 

  <\equation>
    s=s<rsub|k>\<in\>T<rsub|n<rsub|k>>,s<rsub|k-1>\<in\>T<rsub|n<rsub|k-1>>,\<ldots\>,s<rsub|0>\<in\>T<rsub|n>
  </equation>

  <\equation>
    t=t<rsub|l>\<in\>T<rsub|n<rsub|l>>,t<rsub|l-1>\<in\>T<rsub|n<rsub|l-1>>,\<ldots\>,t<rsub|0>\<in\>T<rsub|n>
  </equation>

  connecting <math|s> to <math|t> such that\ 

  <\equation>
    d<around|(|s<rsub|r>,s<rsub|r-1>|)>\<leq\>4<rsup|-n+r+2>
  </equation>

  <\equation>
    d<around|(|t<rsub|r>,t<rsub|r-1>|)>\<leq\>4<rsup|-n-r+2>
  </equation>

  <\equation>
    d<around|(|s<rsub|0>,t<rsub|0>|)>\<leq\>4<rsup|-n+2>
  </equation>

  at every link of the chain. Eventually <math|m\<geq\>K> \ as
  <math|\<varepsilon\>\<rightarrow\>0> then along any link
  <math|<around|(|u,v|)>> of these chains the inequality

  <\equation>
    <around|\||X<rsub|u>-X<rsub|v>|\|>\<less\>A<rsub|j>*d<around|(|u,v|)>
  </equation>

  always holds true where <math|j> is the depth of the link. It then follows
  that

  <\equation>
    <around|\||X<rsub|s>-X<rsub|t>|\|>\<less\>3*\<varepsilon\>
  </equation>

  Thus, the restriction of the Gaussian process to <math|D> is, with
  probability one, uniformly continuous.\ 

  <\corollary>
    If <math|T> is a compact subset of <math|\<bbb-R\><rsup|k>> and if
    <math|R<around|(|s,t|)>> is a symmetric, Lipschitz continuous,
    nonnegative definite kernel on <math|T\<times\>T>, then there is a
    centered Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>
    with continuous sample paths and covariance function
    <math|R<around|(|s,t|)>>.
  </corollary>

  <with|font-shape|italic|Proof.> Exercise.

  <\corollary>
    Let <math|T> be a compact interval in <math|\<bbb-R\><rsup|1>> and assume
    that <math|R<around|(|s,t|)>> satisfies the hypotheses of Corollary 2.2.
    If <math|R> is twice continuously differentiable, and if the mixed second
    partials are Lipschitz continuous on <math|T\<times\>T>, then the
    centered Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>
    with covariance function <math|R<around|(|s,t|)>> has a differentiable
    version, and the derivative process <math|<around|{|X<rsub|t><rprime|'>|}><rsub|t\<in\>T>>
    is a centered Gaussian process with covariance function

    <\equation>
      <math-up|cov><around|(|X<rsub|s><rprime|'>,X<rsub|t><rprime|'>|)>=<frac|\<partial\><rsup|2>*R|\<partial\>*s*\<partial\>*t>*<around|(|s,t|)>
    </equation>

    <with|font-shape|italic|Proof (Sketch).> Define a Gaussian process on
    <math|T\<times\>T\<setminus\><around|{|<around|(|t,t|)>|}><rsub|t\<in\>T>>
    by

    <\equation>
      Y<rsub|s,t>=<frac|X<rsub|t>-X<rsub|s>|t-s>
    </equation>

    The hypotheses on <math|R> guarantee that the covariance function of the
    process <math|<around|{|Y<rsub|s,t>|}>> has a Lipschitz continuous
    extension to <math|T\<times\>T>, so the preceding corollary implies that
    <math|Y<rsub|s,t>> extends continuously to all of <math|T\<times\>T>.
  </corollary>

  <subsection*|2.2. Maximum of a Gaussian process.>

  Theorem 1 implies that if the metric entropy criterion (2.1) holds then the
  Gaussian process has a version with continuous sample paths, and for this
  version the maximum must be attained with probability one. A minor
  variation of the argument used to prove Theorem 1 shows that the
  <with|font-shape|italic|expectation> of the max is bounded by a multiple of
  the metric entropy integral.

  <\theorem>
    There is a universal constant <math|K\<less\>\<infty\>> such that for any
    non-degenerate, centered Gaussian process
    <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> and any countable dense
    subset <math|D\<subseteq\>T>,

    <\equation>
      E*sup<rsub|t\<in\>D> X<rsub|t>\<leq\>K*<big|int><rsub|0><rsup|<math-up|diam><around|(|T|)>/2><sqrt|log
      N<around|(|\<varepsilon\>|)>>*<space|0.17em>d*\<varepsilon\>
    </equation>
  </theorem>

  This is stated so that it holds for any version, whether or not it is
  continuous. However, it is easy to see, given Theorem 1, that the statement
  is equivalent to the statement that for a
  <with|font-shape|italic|continuous> version,

  <\equation>
    E*max<rsub|t\<in\>T> X<rsub|t>\<leq\>K*<big|int><rsub|0><rsup|<math-up|diam><around|(|T|)>/2><sqrt|log
    N<around|(|\<varepsilon\>|)>>*<space|0.17em>d*\<varepsilon\>
  </equation>

  The high concentration of sup around its mean is an easy consequence of the
  Gaussian concentration inequality.

  <\theorem>
    Let <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> be a centered Gaussian
    process on a countable set <math|T> that is almost surely bounded and let
    <math|X<rsup|\<ast\>>> be defined as its supremum over the index set
    <math|T>

    <\equation>
      X<rsup|\<ast\>>=sup<rsub|t\<in\>T> X<rsub|t>
    </equation>

    the it can be seen that if

    <\equation>
      \<sigma\><rsub|t><rsup|2>\<assign\>sup<rsub|t\<in\>T>
      E*X<rsub|t><rsup|2>\<less\>\<infty\>
    </equation>

    then\ 

    <\equation>
      E*X<rsup|\<ast\>>\<less\>\<infty\>
    </equation>

    and

    <\equation>
      P*<around|(|X<rsup|\<ast\>>\<geq\>E*X<rsup|\<ast\>>+u|)>\<leq\>e<rsup|-<frac|u<rsup|2>|2*\<sigma\><rsub|t><rsup|2>>>\<forall\>u\<gtr\>0
    </equation>
  </theorem>

  <\proof>
    Consider first the case where <math|T=<around|[|m|]>> is finite, and
    without loss of generality assume that
    <math|\<sigma\><rsub|t><rsup|2>\<leq\>1>. Then
    <math|X\<assign\><around|{|X<rsub|t>|}><rsub|t\<in\>T>> is just a
    mean-zero Gaussian random vector, and <math|X<rsup|\<ast\>>> is the value
    of the maximum coordinate. This has finite expectation, because, for
    instance it is always bounded by the absolute value. Furthermore, if
    <math|k\<leq\>m> is the rank of the covariance matrix then there is a
    linear transformation <math|A:\<bbb-R\><rsup|k>\<rightarrow\>\<bbb-R\><rsup|m>>
    and a standard Gaussian random vector <math|Y> in
    <math|\<bbb-R\><rsup|k>> such that <math|X=A*Y>. Because
    <math|\<sigma\><rsub|t><rsup|2>\<leq\>1>, the components <math|X<rsub|j>>
    of <math|X> have variances bounded by 1, and so the rows of <math|A> all
    have length bounded by 1. Consequently, the mapping
    <math|A<rsup|\<ast\>>:\<bbb-R\><rsup|k>\<rightarrow\>\<bbb-R\>> that
    takes <math|y\<in\>\<bbb-R\><rsup|k>> to the largest coordinate of the
    <math|m>-vector <math|A*y> is 1\ULipschitz. Hence, the inequality (2.5)
    is an immediate consequence of the Gaussian concentration theorem.

    Now let <math|T> be countable, and let
    <math|T<rsub|1>\<subseteq\>T<rsub|2>\<subseteq\>\<ldots\>> be finite
    subsets of <math|T> whose union is <math|T>. Set
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

    <\equation>
      E*X<rsup|\<ast\>>=E*lim<rsub|n\<rightarrow\>\<infty\>>
      max<rsub|t\<in\>T<rsub|n>> X<rsub|t>=lim<rsub|n\<rightarrow\>\<infty\>>
      \<mu\><rsub|n>\<less\>\<infty\>
    </equation>

    Finally, to prove the concentration inequality, observe that for any
    <math|u\<gtr\>0>

    <\equation>
      <tabular|<tformat|<table|<row|<cell|P*<around|(|X<rsup|\<ast\>>\<geq\>E*X<rsup|\<ast\>>+u|)>>|<cell|=lim<rsub|n\<rightarrow\>\<infty\>>
      P*<around|(|max<rsub|t\<in\>T<rsub|n>>
      X<rsub|t>\<geq\>E*X<rsup|\<ast\>>+u|)>>>|<row|<cell|>|<cell|\<leq\>lim<rsub|n\<rightarrow\>\<infty\>>
      P*<around|(|max<rsub|t\<in\>T<rsub|n>>
      X<rsub|t>\<geq\>\<mu\><rsub|n>+u|)>>>|<row|<cell|>|<cell|\<leq\>e<rsup|-<frac|u<rsup|2>|2*\<sigma\><rsub|t><rsup|2>>>>>>>>
    </equation>
  </proof>

  <section*|3. Reproducing Kernel Hilbert Space of a Gaussian Process>

  Let <math|R<around|(|s,t|)>> be the covariance function of a centered,
  non-degenerate Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>,
  and let <math|L<rsub|2><rsup|X>> be the closure, relative to the
  <math|L<rsub|2>>\Unorm, of the vector space consisting of all finite linear
  combinations of the random variables <math|X<rsub|t>>. Since
  <math|L<rsub|2>>\Ulimits of centered Gaussian random variables are centered
  Gaussian random variables, every random variable in
  <math|L<rsub|2><rsup|X>> is Gaussian.\ 

  <\definition>
    The <with|font-shape|italic|<strong|reproducing kernel Hilbert space>>
    (abbreviated <strong|RKHS>) associated to the Gaussian process
    <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> is a Hilbert space of
    real-valued functions on <math|T> that is naturally isometric to
    <math|L<rsub|2><rsup|X>>. The isometry between these Hilbert spaces leads
    to useful spectral representations of the Gaussian process, notably the
    Karhunen-Loeve representation.
  </definition>

  \ 

  <subsection*|3.2. Reproducing Kernel Hilbert Space.>

  <\definition>
    A symmetric, real-valued function

    <\equation>
      R:T\<times\>T\<rightarrow\>\<bbb-R\>
    </equation>

    \ is said to be a <with|font-shape|italic|positive definite kernel> if
    for every finite subset <math|F\<subseteq\>T> the
    <math|<around|\||F|\|>\<times\><around|\||F|\|>> matrix
    <math|<around|(|R<around|(|s,t|)>|)><rsub|s,t\<in\>F>> is positive
    definite.
  </definition>

  <\definition>
    \ The covariance function of any nondegenerate Gaussian process has this
    property. Every positive definite kernel <math|R> on <math|T> induces a
    <with|font-shape|italic|canonical metric> <math|d> on <math|T> by

    <\equation>
      d*<around|(|s,t|)>=<sqrt|R<around|(|t,t|)>+R<around|(|s,s|)>-2*R<around|(|s,t|)>>
    </equation>
  </definition>

  <\lemma>
    The definition (3.5) specifies a metric on <math|T>.
  </lemma>

  <\proof>
    This is most easily proved by making a connection with Gaussian
    processes. To prove that <math|d> is a metric on <math|T> it suffices to
    prove that it is a metric on any finite subset of <math|T> (because the
    defining properties of a metric \U symmetry, positivity, and the triangle
    inequality \U involve only two or three points at a time). Now if
    <math|F> is a finite subset of <math|T> then the matrix
    <math|<around|(|R<around|(|i,j|)>|)><rsub|i,j\<in\>F>> is a symmetric,
    positive definite <math|<around|\||F|\|>\<times\><around|\||F|\|>>
    matrix, and hence is the covariance matrix of a centered, nondegenerate
    Gaussian random vector <math|<around|(|X<rsub|i>|)><rsub|i\<in\>F>>. By
    construction,

    <\equation>
      d<around|(|i,j|)><rsup|2>=E*<around|\||X<rsub|i>-X<rsub|j>|\|><rsup|2>
    </equation>

    so <math|d> is the canonical metric of the Gaussian process
    <math|<around|(|X<rsub|i>|)><rsub|i\<in\>F>>. But the canonical metric of
    a non-degenerate Gaussian process is a genuine metric.

    Assume for the remainder of this section that <math|R<around|(|s,t|)>> is
    a positive definite kernel on <math|T>. For each <math|s\<in\>T> let
    <math|R<rsub|s>:T\<rightarrow\>\<bbb-R\>> be the <math|s>\Usection of
    <math|R>, that is, the function defined by
    <math|R<rsub|s><around|(|t|)>=R<around|(|s,t|)>>. Let <math|H<rsub|0>> be
    the vector space of real-valued functions on <math|T> consisting of all
    finite linear combinations <math|<big|sum>a<rsub|i>*R<rsub|s<rsub|i>>>.
    Define an inner product on <math|H<rsub|0>> as follows:

    <\equation>
      <around*|\<langle\>|<big|sum>a<rsub|i>*R<rsub|s<rsub|i>>,<big|sum>b<rsub|j>*R<rsub|t<rsub|j>>|\<rangle\>>=<big|sum>a<rsub|i>*b<rsub|j>*R<around|(|s<rsub|i>,t<rsub|j>|)>
    </equation>

    This is clearly bilinear, and since <math|R> is assumed to be positive
    definite it defines an inner product (as you should check!). This inner
    product is designed so that the mapping <math|s\<rightarrow\>R<rsub|s>>
    is an <with|font-shape|italic|isometry> of <math|T> (with the canonical
    metric) into <math|H<rsub|0>> (with the metric induced by the inner
    product (3.6)): in particular, for any <math|s,t\<in\>T>

    <\equation>
      <around|\<\|\|\>|R<rsub|s>-R<rsub|t>|\<\|\|\>><rsup|2>=R<around|(|t,t|)>+R<around|(|s,s|)>-2*R<around|(|s,t|)>=d<around|(|s,t|)><rsup|2>
    </equation>

    Observe that when <math|R> is the covariance function of a centered
    Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>, the inner
    product (3.6) makes the mapping <math|T:H<rsub|0>\<rightarrow\>L<rsup|2><around|(|P|)>>
    defined by

    <\equation>
      T<around*|(|<big|sum>a<rsub|i>*R<rsub|s<rsub|i>>|)>=<big|sum>a<rsub|i>*X<rsub|s<rsub|i>>
    </equation>

    a linear isometry.

    The pairing of the inner product (3.6) with the positive definite kernel
    <math|R> is explicitly made so that the kernel <math|R<around|(|s,t|)>>
    will a <with|font-shape|italic|reproducing kernel> relative to the inner
    product, in the following sense: for any function
    <math|\<varphi\>\<in\>H<rsub|0>> and any <math|t\<in\>T>,

    <\equation>
      \<varphi\><around|(|t|)>=<around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>
    </equation>
  </proof>

  <\definition>
    The <with|font-shape|italic|reproducing kernel Hilbert space> <math|H>
    associated with the covariance kernel <math|R> is the closure of
    <math|H<rsub|0>> with respect to the norm induced by the inner product
    (3.6).

    In the special case where <math|R> is the covariance function of a
    centered Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>>,
    Proposition 3.1 implies that the linear isometry <math|T> defined by
    (3.8) extends in a unique way to all of <math|H>, since by construction
    <math|H<rsub|0>> is a dense linear subspace of <math|H>.
  </definition>

  <\lemma>
    If <math|T> is separable relative to the canonical metric then so is the
    reproducing kernel Hilbert space <math|H>, and if <math|T> is compact
    then set <math|<around|{|R<rsub|s>|}><rsub|s\<in\>T>> is compact, and
    therefore bounded, in <math|H>.
  </lemma>

  <\proof>
    By construction, the mapping <math|s\<rightarrow\>R<rsub|s>> is an
    isometry. Therefore, if <math|T> is compact (separable) then the set
    <math|<around|{|R<rsub|s>|}><rsub|s\<in\>T>> is compact (separable) in
    <math|H>. If the set <math|<around|{|R<rsub|s>|}><rsub|s\<in\>T>> is
    separable, it has a countable dense subset <math|D>, and if this is the
    case then the (countable) set of rational linear combinations of elements
    of <math|D> is dense in the reproducing kernel Hilbert space <math|H>.
  </proof>

  <\lemma>
    \ The set

    <\equation>
      <around|{|R<rsub|s>|}><rsub|s\<in\>T>
    </equation>

    \ is bounded in the reproducing kernel Hilbert space <math|H> if and only
    if

    <\equation>
      sup<rsub|t\<in\>T> R<around|(|t,t|)>\<less\>\<infty\>
    </equation>

    If this is the case then

    <\itemize>
      <item*|(a)>the function

      <\equation>
        <around|(|s,t|)>\<rightarrow\>R<around|(|s,t|)>
      </equation>

      \ is Lipschitz in each variable <math|s,t>; and

      <item*|(b)>The function

      <\equation>
        t\<rightarrow\><around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>\<forall\>\<varphi\>\<in\>H
      </equation>

      is a Lipschitz continuous function on <math|T>, with Lipschitz constant
      bounded by <math|<around|\<\|\|\>|\<varphi\>|\<\|\|\>>> and sup-norm
      bounded by

      <\equation>
        <around|\<\|\|\>|\<varphi\>|\<\|\|\>>*sup<rsub|t\<in\>T><around|\<\|\|\>|R<rsub|t>|\<\|\|\>>
      </equation>
    </itemize>

    Thus, the elements <math|\<varphi\>\<in\>H> can be identified with
    Lipschitz functions <math|t\<rightarrow\><around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>>
    on <math|T>.
  </lemma>

  <\proof>
    By the reproducing property (or equivalently the definition of the inner
    product (3.6)),

    <\equation>
      <around|\<\|\|\>|R<rsub|s>-R<rsub|t>|\<\|\|\>><rsup|2>=<around|\<langle\>|R<rsub|s>-R<rsub|t>,R<rsub|s>-R<rsub|t>|\<rangle\>>=R<around|(|t,t|)>+R<around|(|s,s|)>-2*R<around|(|s,t|)>=d<around|(|s,t|)><rsup|2>
    </equation>

    Assume now that <math|C=sup<rsub|t\<in\>T><around|\<\|\|\>|R<rsub|t>|\<\|\|\>>\<less\>\<infty\>>.
    By the reproducing property and the Cauchy-Schwartz inequality, for any
    <math|s<rsub|1>,s<rsub|2>\<in\>T>,

    <\equation>
      <text|<tabular*|<tformat|<cwith|1|-1|2|2|cell-halign|l>|<table|<row|<cell|<math|<around|\||R<around|(|s<rsub|1>,t|)>-R<around|(|s<rsub|2>,t|)>|\|>>>|<cell|<math|=<around|\||<around|\<langle\>|R<rsub|t>-R<rsub|s<rsub|2>>,R<rsub|t>|\<rangle\>>|\|>>>>|<row|<cell|>|<cell|<math|\<leq\><around|\||<around|\<langle\>|R<rsub|s>-R<rsub|s<rsub|2>>,R<rsub|t>|\<rangle\>>|\|>>>>|<row|<cell|>|<cell|<math|\<leq\>d<around|(|s<rsub|1>,s<rsub|2>|)><around|\<\|\|\>|R<rsub|t>|\<\|\|\>>>>>|<row|<cell|>|<cell|<math|=C*d<around|(|s<rsub|1>,s<rsub|2>|)>>>>>>>>
    </equation>

    <\equation>
      \;
    </equation>

    consequently, <math|R<around|(|s,t|)>> is Lipschitz-continuous in
    <math|s>, with Lipschitz constant bounded by <math|C>. Since
    <math|R<around|(|s,t|)>=R<around|(|t,s|)>>, it follows that <math|R> is
    Lipschitz in the second variable <math|t> as well.

    Finally, let <math|\<varphi\>> be any element of the reproducing kernel
    Hilbert space <math|H>, and consider the mapping

    <\equation>
      t\<rightarrow\><around|\<langle\>|\<varphi\>,R<rsub|t>|\<rangle\>>\<forall\>\<varphi\>\<in\>H
    </equation>

    then for any two points,

    <\equation>
      <tabular|<tformat|<table|<row|<cell|<around|\||<around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>-<around|\<langle\>|R<rsub|s>,\<varphi\>|\<rangle\>>|\|>>|<cell|=<around|\||<around|\<langle\>|R<rsub|t>-R<rsub|s>,\<varphi\>|\<rangle\>>|\|>\<forall\>s,t\<in\>T>>|<row|<cell|>|<cell|\<leq\>d<around|(|s,t|)><around|\<\|\|\>|\<varphi\>|\<\|\|\>>>>>>>
    </equation>

    This implies that the function <math|t\<rightarrow\><around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>>
    is Lipschitz, with Lipschitz constant bounded by
    <math|<around|\<\|\|\>|\<varphi\>|\<\|\|\>>>. Furthermore, by the
    Cauchy-Schwartz inequality,

    <\equation>
      <around|\||<around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>|\|>\<leq\><around|\<\|\|\>|\<varphi\>|\<\|\|\>>*sup<rsub|t\<in\>T><around|\<\|\|\>|R<rsub|t>|\<\|\|\>>\<forall\>t\<in\>T
    </equation>
  </proof>

  <\note>
    It is important to behold the fact that <math|H> is identified with the
    elements of its function space defined by

    <\equation>
      t\<rightarrow\><around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>\<forall\>\<varphi\>\<in\>H
    </equation>

    which was constructed as the abstract completion of the inner product
    space <math|H<rsub|0>>, so its elements are equivalence classes of Cauchy
    sequences in <math|H<rsub|0>>, not functions on <math|T>. This is despite
    the fact that the elements of <math|H<rsub|0>> itself are functions on
    <math|T>. Therefore, when the hypotheses of Lemma 3.5 hold, the elements
    <math|\<varphi\>\<in\>H> shall be regarded as Lipschitz functions and
    expressed by

    <\equation>
      \<varphi\><around|(|t|)>=<around|\<langle\>|R<rsub|t>,\<varphi\>|\<rangle\>>\<forall\>\<varphi\>\<in\>H
    </equation>

    .
  </note>

  <\proposition>
    \ If <math|T> is compact relative to the canonical metric of the Gaussian
    process then for any (countable) orthonormal basis
    <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>> and any
    <math|s,t\<in\>T>

    <\equation>
      R<around|(|s,t|)>=<big|sum><rsub|n\<geq\>1><around|\<langle\>|R<rsub|s>,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n><around|(|t|)>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>
    </equation>

    and the convergence is uniform for <math|s,t\<in\>T>.
  </proposition>

  <\note>
    This is a variant of Mercer's theorem. The hypothesis that <math|T> is
    compact ensures that the reproducing kernel Hilbert space is separable,
    and hence that every orthonormal basis is countable (or has cardinality
    <math|<around|\||T|\|>> is <math|T> is finite). If <math|T> is finite the
    expansion (3.10) follows from the spectral theorem for finite symmetric
    matrices, so we will restrict attention to the case where <math|T> is
    compact but infinite.
  </note>

  <\proof>
    By construction, the mapping <math|s\<rightarrow\>R<rsub|s>> is an
    isometry. Therefore, if <math|T> is compact then by Lemma 3.5, <math|R>
    is Lipschitz in each variable. This implies that the mapping
    <math|s\<rightarrow\>R<around|(|s,s|)>> is Lipschitz, and that
    <math|sup<rsub|s\<in\>T> R<around|(|s,s|)>\<less\>\<infty\>>.

    If <math|T> is compact and infinite then every orthonormal basis for the
    reproducing kernel Hilbert space is countable. Let
    <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>> be any orthonormal
    basis. By Parseval's theorem, for any <math|s\<in\>T> the
    <math|s>\Usection <math|R<rsub|s>> has the expansion

    <\equation>
      R<rsub|s>=<big|sum><rsub|n\<geq\>1><around|\<langle\>|R<rsub|s>,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n>
    </equation>

    where the convergence is in the <math|H>\Unorm. (The second identity
    follows from the reproducing property of the kernel.) Moreover, for any
    <math|s\<in\>T>,

    <\equation>
      R<around|(|s,s|)>=<around|\<\|\|\>|R<rsub|s>|\<\|\|\>><rsup|2>=<big|sum><rsub|n\<geq\>1><around|\<langle\>|R<rsub|s>,\<psi\><rsub|n>|\<rangle\>><rsup|2>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)><rsup|2>
    </equation>

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

    <\equation>
      <around*|\||<big|sum><rsub|n\<geq\>m>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>|\|>\<leq\><sqrt|<big|sum><rsub|n\<geq\>m>\<psi\><rsub|n><around|(|s|)><rsup|2>*<big|sum><rsub|n\<geq\>m>\<psi\><rsub|n><around|(|t|)><rsup|2>>
    </equation>

    since <math|<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)><rsup|2>>
    converges uniformly for <math|s\<in\>T>, the right side of the inequality
    can be made uniformly small by choosing <math|m> large. To see that the
    limit of the series <math|<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>>
    is <math|R<around|(|s,t|)>>, we use the reproducing property of the
    kernel together with the <math|H>\Uconvergence (3.11). This implies that

    <\equation>
      R<around|(|s,t|)>=<around|\<langle\>|R<rsub|s>,R<rsub|t>|\<rangle\>>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)><around|\<langle\>|\<psi\><rsub|n>,R<rsub|t>|\<rangle\>>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>
    </equation>
  </proof>

  <\proposition>
    If <math|T> is compact relative to the canonical metric then on any
    probability space that supports a sequence
    <math|<around|{|\<xi\><rsub|n>|}><rsub|n\<geq\>1>> of independent
    <math|N<around|(|0,1|)>> random variables there exists a centered
    Gaussian process <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> with
    covariance function <math|R>. For any orthonormal basis
    <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>> and any
    <math|t\<in\>T> the random variable <math|X<rsub|t>> is the almost sure
    limit of the series

    <\equation>
      X<rsub|t>=<big|sum><rsub|n\<geq\>1>\<xi\><rsub|n>*\<psi\><rsub|n><around|(|t|)>
    </equation>
  </proposition>

  <\proof>
    If <math|T> is separable then so is the reproducing kernel Hilbert space
    <math|H>, by the same argument as in the proof of Proposition 3.6.
    Consequently, <math|H> has a countable orthonormal basis
    <math|\<psi\><rsub|n>>, and for each <math|s\<in\>T> the
    <math|s>\Usection <math|R<rsub|s>> has the expansion (3.11), and has norm
    <math|<around|\<\|\|\>|R<rsub|s>|\<\|\|\>>> given by (3.12). This implies
    that the series <math|<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)><rsup|2>>
    converges to a finite limit.

    Suppose that <math|<around|{|\<xi\><rsub|n>|}><rsub|n\<geq\>1>> is a
    sequence of independent <math|N<around|(|0,1|)>> random variables. Then
    for any <math|s\<in\>T> the series

    <\equation>
      X<rsub|s>\<assign\><big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<xi\><rsub|n>
    </equation>

    converges in <math|L<rsup|2><around|(|P|)>> and almost surely, since the
    variances <math|\<psi\><rsub|n><around|(|s|)><rsup|2>> are summable. (The
    sequence of partial sums is an <math|L<rsup|2>>\Ubounded martingale, and
    a basic result of martingale theory asserts that any such martingale
    converges both a.s. and in <math|L<rsup|2><around|(|P|)>> by the usual
    arguments, the limit random variable <math|X<rsub|s>> is centered
    Gaussian, and the process <math|<around|{|X<rsub|s>|}><rsub|s\<in\>T>> is
    Gaussian. The covariance function is

    <\equation>
      E*X<rsub|s>*X<rsub|t>=E*<big|sum><rsub|n><big|sum><rsub|m>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|m><around|(|t|)>*\<xi\><rsub|n>*\<xi\><rsub|m>=<big|sum><rsub|n\<geq\>1>\<psi\><rsub|n><around|(|s|)>*\<psi\><rsub|n><around|(|t|)>=R*<around|(|s,t|)>
    </equation>
  </proof>

  <\theorem>
    (Itô-Nisio) Let <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> be a
    centered Gaussian process with covariance function <math|R> and
    continuous sample paths. Assume also that <math|T> is compact relative to
    the canonical metric <math|d>. Let <math|<around|{|\<psi\><rsub|n>|}><rsub|n\<geq\>1>>
    be any orthonormal basis for the reproducing kernel Hilbert space, and
    denote by <math|\<xi\><rsub|n>=T*\<psi\><rsub|n>> the image of
    <math|\<psi\><rsub|n>> under the canonical isometry <math|T> (see
    equation (3.8)). Then the random variables <math|\<xi\><rsub|n>> are
    independent Normal(0,1), and

    <\equation>
      X<rsub|t>=<big|sum><rsub|n\<geq\>1>\<xi\><rsub|n>*\<psi\><rsub|n><around|(|t|)>
    </equation>

    With probability one, the series converges uniformly in <math|t>.
  </theorem>

  The main point of the theorem is the uniform convergence. The hypothesis
  that the Gaussian process has a version with continuous paths is crucial,
  as there are Gaussian processes with the property that every version is
  discontinuous at every point with probability one (see Example 2.1 above).
  Theorem 4 is somewhat harder to prove than the other results of this
  section, so I will omit it and refer you to the original paper of Itô and
  Nisio.

  <\note>
    Since the random variables <math|\<xi\><rsub|n>> are i.i.d. the series
    <math|<big|sum>\<xi\><rsub|n><rsup|2>=\<infty\>> a.s. Therefore, the
    expansion (3.14) does not converge in <math|H>, and in particular the
    sample paths <math|t\<rightarrow\>X<rsub|t>> of the Gaussian process are
    a.s. not elements of <math|H>. (Keep this in mind when reading Example
    3.2 below.)
  </note>

  <subsection*|3.3. Examples of RKHS.>

  <\example>
    Recall that the covariance function of the standard Wiener process
    <math|<around|{|W<rsub|t>|}><rsub|t\<in\><around|[|0,1|]>>> is
    <math|R*<around|(|s,t|)>=s\<wedge\>t>, where <math|\<wedge\>> denotes
    min. Each <math|s>\Usection <math|R<rsub|s>> has the property that
    <math|R<rsub|s><around|(|0|)>=0>, so every function in <math|H<rsub|0>>
    takes the value 0 at <math|t=0>. Each <math|s>\Usection <math|R<rsub|s>>
    has derivative <math|R<rsub|s><rprime|'>> equal to the indicator function
    <math|I<rsub|<around|[|0,s|]>>> of the interval <math|<around|[|0,s|]>>,
    so every <math|\<varphi\>\<in\>H<rsub|0>> is differentiable at all but
    finitely many points, and the derivative is bounded. Hence, for every
    <math|\<varphi\>\<in\>H<rsub|0>>,

    <\equation>
      <around|\<langle\>|R<rsub|s>,\<varphi\>|\<rangle\>>=\<varphi\><around|(|s|)>=<big|int><rsub|0><rsup|1>R<rsub|s><rprime|'><around|(|t|)>*\<varphi\><rprime|'><around|(|t|)>*<space|0.17em>d*t
    </equation>

    It follows that the inner product (3.6) on <math|H<rsub|0>> coincides
    with the usual inner product of derivatives, that is,

    <\equation>
      <around|\<langle\>|\<varphi\>,\<psi\>|\<rangle\>>=<big|int><rsub|0><rsup|1>\<varphi\><rprime|'><around|(|s|)>*\<psi\><rprime|'><around|(|s|)>*<space|0.17em>d*s
    </equation>

    Since linear combinations of intervals <math|I<rsub|<around|[|0,s|]>>>
    are dense in <math|L<rsup|2><around|[|0,1|]>>, it follows that
    <math|H<rsub|0>> is dense in the space of all functions
    <math|\<varphi\>:<around|[|0,1|]>\<rightarrow\>\<bbb-R\>> with
    <math|L<rsup|2>>\Uderivative <math|\<varphi\><rprime|'>> and
    <math|\<varphi\><around|(|0|)>=0>. Consequently, this space is the
    reproducing kernel Hilbert space for Brownian motion. It is sometimes
    called the Cameron-Martin Hilbert space.
  </example>

  <section*|4. Mutual Singularity and Absolute Continuity>

  <subsection|Distinguishibility Of Measures>

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

  <\theorem>
    The probability measures <math|P,Q> are mutually singular on
    <math|<around|(|\<Omega\>,\<cal-F\>|)>> unless <math|f> is an element of
    the reproducing kernel Hilbert space <math|H> of <math|R>. If
    <math|f\<in\>H> then <math|P,Q> are mutually absolutely continuous, with
    likelihood ratio (Radon-Nikodym derivative)

    <\equation>
      <frac|d*Q|d*P><mid|\|><rsub|\<cal-F\>>=exp
      <around|{|J<rsub|X><around|(|f|)>-<around|\<\|\|\>|f|\<\|\|\>><rsup|2>/2|}>
    </equation>
  </theorem>

  <\remark>
    In the special case where <math|<around|{|X<rsub|t>|}><rsub|t\<in\>T>> is
    the Wiener process on <math|T=<around|[|0,1|]>> this theorem was
    discovered and proved by Cameron and Martin around 1945. In this case the
    isometry <math|J<rsub|X>> is the usual Wiener integral. Later Girsanov
    extended the Cameron-Martin formula (4.2) for the likelihood ratio to
    certain <with|font-shape|italic|random> functions <math|f> given as
    stochastic integrals.

    Before turning to the proof of Theorem 5 let's look at the related but at
    least superficially simpler problem of distinguishing signal plus noise
    from noise for <with|font-shape|italic|white noise>. Here
    <math|T=\<bbb-N\>>, and the covariance function is the simplest of all
    possible covariance functions, to wit,
    <math|R<around|(|i,j|)>=\<delta\><rsub|i,j>>; thus, the Gaussian process
    <math|<around|{|X<rsub|n>|}>> consists of independent, identically
    distributed standard Gaussian random variables. The \Psignal\Q is a fixed
    non-random sequence <math|<around|{|a<rsub|n>|}><rsub|n\<in\>\<bbb-N\>>>
    of real numbers. Let the probability measures <math|\<mu\>> and
    <math|\<nu\>> be the joint distributions of the sequences
    <math|<around|{|X<rsub|n>|}>> and <math|<around|{|X<rsub|n>+a<rsub|n>|}>>,
    respectively.
  </remark>

  <\theorem>
    (Kakutani) The measures <math|\<mu\>> and <math|\<nu\>> are absolutely
    continuous if

    <\equation>
      <big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>\<less\>\<infty\>
    </equation>

    , and mutually singular if

    <\equation>
      <big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>=\<infty\>
    </equation>

    If <math|<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>\<less\>\<infty\>>
    then the series <math|<big|sum><rsub|n\<geq\>1>a<rsub|n>*y<rsub|n>>
    converges almost surely under <math|\<mu\>> and

    <\equation>
      <frac|d*\<nu\>|d*\<mu\>><mid|\|><rsub|<around|(|y<rsub|n>|)><rsub|n\<geq\>1>>=L<rsub|\<infty\>>=e<rsup|<around*|(|<big|sum><rsub|n\<geq\>1>a<rsub|n>*y<rsub|n>-<frac|1|2>*<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>|)>>
    </equation>
  </theorem>

  <\proof>
    First some generalities. Let <math|\<mu\>,\<nu\>> be two probability
    measures on <math|<around|(|\<bbb-R\><rsup|\<infty\>>,\<cal-F\><rsub|\<infty\>>|)>>,
    where <math|\<cal-F\><rsub|\<infty\>>> is the usual Borel field, that is,
    the smallest <math|\<sigma\>>\Ualgebra that contains all cylinder sets.
    For each <math|n\<in\>\<bbb-N\>> denote by <math|\<cal-F\><rsub|n>> the
    <math|\<sigma\>>\Ualgebra generated by the first <math|n> coordinate
    variables. Suppose that the restrictions of <math|\<mu\>> and
    <math|\<nu\>> to <math|\<cal-F\><rsub|n>> are mutually absolutely
    continuous for each <math|n> (this is the case, for instance, when
    <math|\<mu\>> and <math|\<nu\>> are the laws of any two nondegenerate
    Gaussian processes, or when <math|\<mu\>> and <math|\<nu\>> are product
    measures where each factor is absolutely continuous relative to Lebesgue
    measure on <math|\<bbb-R\>>). Then the sequence

    <\equation>
      L<rsub|n>\<assign\><around*|(|<frac|d*\<nu\>|d*\<mu\>><mid|\|>\<cal-F\><rsub|n>|)>
    </equation>

    of likelihood ratios is a positive martingale under <math|\<mu\>>
    relative to the filtration <math|<around|{|\<cal-F\><rsub|n>|}><rsub|n\<geq\>1>>,
    and hence converges to a nonnegative limit <math|L<rsub|\<infty\>>>
    almost surely. (Exercise: Verify that <math|L<rsub|n>> is a martingale.)
    There are two interesting cases:

    <\enumerate-alpha>
      <item><math|E<rsub|\<mu\>>*L<rsub|\<infty\>>=1>

      <item><math|\<mu\>*<around|{|L<rsub|\<infty\>>=0|}>=1>
    </enumerate-alpha>

    These are not the only possibilities, in general, but in both the
    Gaussian cases and in the case of product measures either (a) or (b) will
    hold. In case (a) the martingale <math|L<rsub|n>> is closed, that is,
    <math|L<rsub|n>=E<around|(|L<rsub|\<infty\>>\|\<cal-F\><rsub|n>|)>> for
    each <math|n> and <math|L<rsub|n>\<rightarrow\>L<rsub|\<infty\>>> in
    <math|L<rsup|1>>. In this case the measures <math|\<mu\>> and
    <math|\<nu\>> are absolutely continuous on
    <math|\<cal-F\><rsub|\<infty\>>>, with Radon-Nikodym derivative
    <math|L<rsub|\<infty\>>>, because for any
    <math|F\<in\>\<cal-F\><rsub|n>>,

    <\equation>
      E<rsub|\<mu\>>*L<rsub|\<infty\>>*1<rsub|F>=E<rsub|\<mu\>>*L<rsub|n>*1<rsub|F>=\<nu\><around|(|F|)>
    </equation>

    and so the measures <math|\<nu\>> and
    <math|F\<mapsto\>E<rsub|\<mu\>>*L<rsub|\<infty\>>*1<rsub|F>> agree on
    <math|<big|cup><rsub|n\<geq\>1>\<cal-F\><rsub|n>>. In case (b), on the
    other hand, the measures <math|\<mu\>> and <math|\<nu\>> are singular on
    <math|\<cal-F\><rsub|\<infty\>>>. To see this, first note that if
    <math|L<rsub|n>\<rightarrow\>0> a.s. under <math|\<mu\>> then there is a
    sequence of constants <math|\<varepsilon\><rsub|n>\<gtr\>0> such that
    <math|\<varepsilon\><rsub|n>\<rightarrow\>0> and such that with
    <math|\<mu\>>\Uprobability 1,

    <\equation>
      \<mu\>*<around|(|L<rsub|n>\<leq\>\<varepsilon\><rsub|n><text|eventually>|)>=1
    </equation>

    (<with|font-shape|italic|Exercise:> Prove this.) Define
    <math|\<tau\><rsub|m>> to be the first time <math|n\<geq\>m> that
    <math|L<rsub|n>\<leq\>\<varepsilon\><rsub|n>>, and let <math|F<rsub|m>>
    be the event <math|<around|{|\<tau\><rsub|m>\<less\>\<infty\>|}>>. These
    events are nested: <math|F<rsub|m>\<supseteq\>F<rsub|m+1>> for each
    <math|m>. By construction, <math|\<mu\><around|(|F<rsub|m>|)>=1> for
    every <math|m\<geq\>1>, and hence <math|\<mu\><around|(|<big|cap><rsub|m>F<rsub|m>|)>=1>.
    But for each <math|m\<geq\>1>,

    <\equation>
      \<nu\><around|(|F<rsub|m>|)>=<big|sum><rsub|n=m><rsup|\<infty\>>\<nu\>*<around|(|\<tau\><rsub|m>=n|)>=<big|sum><rsub|n=m><rsup|\<infty\>>E<rsub|\<mu\>>*L<rsub|n>*1<rsub|<around|{|\<tau\><rsub|m>=n|}>>=E<rsub|\<mu\>>*L<rsub|\<tau\><rsub|m>>\<leq\>\<varepsilon\><rsub|m>
    </equation>

    Consequently, <math|\<nu\><around|(|<big|cap><rsub|m>F<rsub|m>|)>=0>.

    Now to Kakutani's theorem: Under <math|\<mu\>> the coordinate variables
    <math|y<rsub|n>> are i.i.d. standard Gaussian, whereas under
    <math|\<nu\>> they are independent Gaussians with means <math|a<rsub|n>>
    and variances 1. Thus, the likelihood ratio on <math|\<cal-F\><rsub|n>>
    is

    <\equation>
      L<rsub|n>=e<rsup| A<rsub|n>*z<rsub|n>-<frac|A<rsub|n><rsup|2>|2>>*<space|1em><text|where><space|1em>A<rsub|n><rsup|2>=<big|sum><rsub|j=1><rsup|n>a<rsub|j><rsup|2>*<space|1em><text|and><space|1em>z<rsub|n>=<big|sum><rsub|j=1><rsup|n><frac|a<rsub|j>*y<rsub|j>|A<rsub|n>>
    </equation>

    If <math|A=<big|sum>a<rsub|j><rsup|2>\<less\>\<infty\>> then the series
    <math|<big|sum><rsub|j=1>a<rsub|j>*y<rsub|j>> converges almost surely and
    in <math|L<rsup|2><around|(|\<mu\>|)>>, and the limit random variable is
    centered Gaussian with variance <math|A>. Consequently,
    <math|L<rsub|n>\<rightarrow\>L<rsub|\<infty\>>> where half of the
    theorem. Suppose then that <math|<big|sum>a<rsub|j><rsup|2>=\<infty\>>.
    Under <math|\<nu\>> the random variable <math|z<rsub|n>> is standard
    Gaussian, and so

    <\equation>
      lim<rsub|n\<rightarrow\>\<infty\>> \<mu\>*<around*|{|A<rsub|n>*z<rsub|n>\<gtr\><frac|A<rsub|n><rsup|2>|4>|}>=0
    </equation>

    This implies that <math|L<rsub|n>\<rightarrow\>0> in
    <math|\<mu\>>\Uprobability. But the martingale convergence theorem
    implies that <math|L<rsub|n>\<rightarrow\>L<rsub|\<infty\>>> almost
    surely under <math|\<mu\>>, and so it follows that
    <math|L<rsub|\<infty\>>=0> a.s. <math|\<mu\>>.
  </proof>

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

  <\equation>
    \<cal-F\>=\<sigma\><around*|(|<big|cup><rsub|n\<geq\>1>\<cal-F\><rsub|n>|)>
  </equation>

  where <math|\<cal-F\><rsub|n>=\<sigma\><around|(|<around|(|X<rsub|s>|)><rsub|s\<in\>D<rsub|n>>|)>>.
  Let <math|\<xi\><rsub|1>,\<xi\><rsub|2>,\<ldots\>> be the random variables
  obtained by applying the Gram-Schmidt algorithm to the sequence
  <math|X<rsub|s<rsub|1>>,X<rsub|s<rsub|2>>,\<ldots\>>, that is,

  <\equation>
    \<xi\><rsub|1>=<frac|X<rsub|s<rsub|1>>|<sqrt|R<around|(|s<rsub|1>,s<rsub|1>|)>>>
  </equation>

  <\equation>
    \<xi\><rsub|2>=<frac|X<rsub|s<rsub|2>>-<frac|R<around|(|s<rsub|2>,s<rsub|1>|)>*X<rsub|s<rsub|1>>|R<around|(|s<rsub|1>,s<rsub|1>|)>>|<sqrt|<around*|(|R<around|(|s<rsub|1>,s<rsub|1>|)>-<frac|R<around|(|s<rsub|2>,s<rsub|1>|)><rsup|2>|R<around|(|s<rsub|1>,s<rsub|1>|)>>|)>>>
  </equation>

  etc.

  Since we have assumed that the covariance kernel <math|R<around|(|s,t|)>>
  is positive definite, the random variables
  <math|<around|{|X<rsub|s<rsub|j>>|}><rsub|j\<geq\>1>> are linearly
  independent in <math|L<rsup|2><around|(|P|)>>, and hence the Gram-Schmidt
  mapping (4.4) is well-defined (that is, there are no divisions by 0).
  Observe that for each <math|n\<geq\>1> the Gram-Schmidt equations (4.4) can
  be written in matrix form:

  <\equation>
    <matrix|<tformat|<table|<row|<cell|\<xi\><rsub|1>>>|<row|<cell|\<xi\><rsub|2>>>|<row|<cell|\<vdots\>>>|<row|<cell|\<xi\><rsub|n>>>>>>=T<rsub|n><matrix|<tformat|<table|<row|<cell|X<rsub|s<rsub|1>>>>|<row|<cell|X<rsub|s<rsub|2>>>>|<row|<cell|\<vdots\>>>|<row|<cell|X<rsub|s<rsub|n>>>>>>>
  </equation>

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

  <\equation>
    T<rsub|n>=<matrix|<tformat|<table|<row|<cell|b<rsub|1,1>>|<cell|0>|<cell|0>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|b<rsub|2,1>>|<cell|b<rsub|2,2>>|<cell|0>|<cell|\<cdots\>>|<cell|0>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|b<rsub|n,1>>|<cell|b<rsub|n,2>>|<cell|b<rsub|n,3>>|<cell|\<cdots\>>|<cell|b<rsub|n,n>>>>>>
  </equation>

  for fixed scalars <math|b<rsub|i,j>>.

  By construction, the random variables <math|<around|{|\<xi\><rsub|n>|}><rsub|n\<geq\>1>>
  are independent, identically distributed standard Gaussians under <math|P>.
  Under <math|Q>, however, they are independent Gaussians with common
  variance 1, but with means <math|a<rsub|n>=E<rsub|Q>*\<xi\><rsub|n>>
  depending on the function <math|f>. These means can be computed by taking
  <math|E<rsub|Q>>\Uexpectations on both sides in (4.5): this implies that
  for each <math|n>,

  <\equation>
    <matrix|<tformat|<table|<row|<cell|a<rsub|1>>>|<row|<cell|a<rsub|2>>>|<row|<cell|\<vdots\>>>|<row|<cell|a<rsub|n>>>>>>=T<rsub|n><matrix|<tformat|<table|<row|<cell|f<rsub|s<rsub|1>>>>|<row|<cell|f<rsub|s<rsub|2>>>>|<row|<cell|\<vdots\>>>|<row|<cell|f<rsub|s<rsub|n>>>>>>>
  </equation>

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

  <\equation>
    a<rsub|n>=<around|\<langle\>|f,\<psi\><rsub|n>|\<rangle\>>
  </equation>

  Since <math|f=<big|sum><rsub|n\<geq\>1><around|\<langle\>|f,\<psi\><rsub|n>|\<rangle\>>*\<psi\><rsub|n>>,
  it follows that <math|<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>=<around|\<\|\|\>|f|\<\|\|\>><rsup|2>\<less\>\<infty\>>.
  Thus, Kakutani's theorem implies that in this case the measures <math|P>
  and <math|Q> are absolutely continuous, and the likelihood ratio is

  <\equation>
    <frac|d*Q|d*P><mid|\|><rsub|\<cal-F\>>=e<rsup|<around*|(|<big|sum><rsub|n\<geq\>1>a<rsub|n>*\<xi\><rsub|n>-<frac|<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>|2>|)>>
  </equation>

  The formula (4.2) follows, because

  <\equation>
    J<rsub|X><around|(|f|)>=<big|sum><rsub|n\<geq\>1>a<rsub|n>*\<xi\><rsub|n><space|1em><text|and><space|1em><around|\<\|\|\>|f|\<\|\|\>><rsup|2>=<big|sum><rsub|n\<geq\>1>a<rsub|n><rsup|2>
  </equation>

  Now suppose that <math|f\<nin\>H>. For each <math|n\<geq\>1>, let
  <math|f<rsup|n>\<in\>H> be the unique linear combination in
  span<math|<around|{|R<rsub|s<rsub|j>>|}><rsub|j\<leq\>n>> such that
  <math|f<rsup|n><around|(|s<rsub|i>|)>=f<around|(|s<rsub|i>|)>> for each
  <math|i\<leq\>n>. There is such a linear combination, because for each
  <math|n> the matrix <math|R<around|(|s<rsub|i>,s<rsub|j>|)><rsub|i,j\<leq\>n>>
  is positive definite, and hence invertible. For each <math|n> the means
  <math|<around|(|a<rsub|i>|)><rsub|i\<leq\>n>> are related to the entries
  <math|<around|(|f<rsub|s<rsub|i>>|)><rsub|i\<leq\>n>> by (4.6), and so

  <\equation>
    <matrix|<tformat|<table|<row|<cell|a<rsub|1>>>|<row|<cell|a<rsub|2>>>|<row|<cell|\<vdots\>>>|<row|<cell|a<rsub|n>>>>>>=T<rsub|n><matrix|<tformat|<table|<row|<cell|f<rsub|s<rsub|1>>>>|<row|<cell|f<rsub|s<rsub|2>>>>|<row|<cell|\<vdots\>>>|<row|<cell|f<rsub|s<rsub|n>>>>>>>
  </equation>

  But since <math|f<rsup|n>> is a linear combination of the functions
  <math|<around|(|R<rsub|s<rsub|j>>|)><rsub|j\<leq\>n>>, it follows that for
  <math|1\<leq\>m\<leq\>n>,

  <\equation>
    a<rsub|m>=<around|\<langle\>|f<rsup|n>,\<psi\><rsub|m>|\<rangle\>>
  </equation>

  and so

  <\equation>
    <big|sum><rsub|j=1><rsup|n>a<rsub|j><rsup|2>=<around|\<\|\|\>|f<rsup|n>|\<\|\|\>><rsup|2>
  </equation>

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

  <subsection|Intuition>

  Mutual singularity between measures, like <math|P> and <math|Q> in the
  Gaussian process context, means that there exist disjoint sets in the
  underlying space, each fully supported by one measure and null for the
  other. Basically, the measures live on completely separate parts of the
  probability space, making them incompatible or "orthogonal."

  Absolute continuity, on the other hand, is when one measure (like <math|Q>)
  is completely contained within another (like <math|P>). If <math|f> is in
  the reproducing kernel Hilbert space (H) associated with the Gaussian
  process, then <math|P> and <math|Q> are absolutely continuous. This
  relationship is characterized by the existence of a Radon-Nikodym
  derivative <math|d*Q/d*P>, giving the precise "scaling" of probabilities
  from <math|P> to <math|Q> across events.

  The intuition here revolves around how the modifications (<math|f<rsub|t>>)
  to the Gaussian process <math|X<rsub|t>> under measure <math|Q> compared to
  <math|P> affect the likelihood of observing certain outcomes. If <math|f>
  belongs to <math|H>, it aligns well enough with the Gaussian structure of
  <math|X<rsub|t>> under <math|P> that <math|Q> just reweights these
  probabilities (absolute continuity). If <math|f> does not belong to
  <math|H>, the modifications it introduces are too orthogonal (in the
  Hilbert space sense) to the original process, making <math|P> and <math|Q>
  live on different "worlds" (mutual singularity).

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
    <associate|Dn|<tuple|8|3>>
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-10|<tuple|2|18>>
    <associate|auto-2|<tuple|3|2>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|26|5>>
    <associate|auto-5|<tuple|34|7>>
    <associate|auto-6|<tuple|11|7>>
    <associate|auto-7|<tuple|23|12>>
    <associate|auto-8|<tuple|65|13>>
    <associate|auto-9|<tuple|1|13>>
    <associate|continuousExtension|<tuple|6|3>>
    <associate|footnote-1|<tuple|1|11>>
    <associate|footnr-1|<tuple|1|11>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.
      Definitions and Examples> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.
      Continuous Extensions and Maxima of Gaussian Processes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1. Continuity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2. Maximum of a Gaussian process.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.
      Reproducing Kernel Hilbert Space of a Gaussian Process>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.2. Reproducing Kernel Hilbert Space.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.3. Examples of RKHS.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.
      Mutual Singularity and Absolute Continuity>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1<space|2spc>Distinguishibility Of Measures
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|2<space|2spc>Intuition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>
    </associate>
  </collection>
</auxiliary>